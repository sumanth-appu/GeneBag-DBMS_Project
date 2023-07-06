from flask import Flask,render_template,request,flash,redirect,url_for,session
from wtforms import  StringField,PasswordField,validators,Form
from flask_sqlalchemy import SQLAlchemy
import pymysql
from functools import wraps
from sqlalchemy import create_engine


app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:@localhost/genebag'
db = SQLAlchemy(app)


'''Cursor creation'''

# engine = create_engine('mysql://root:@localhost/genebag')
# connection = engine.raw_connection()
# cur = connection.cursor()
connection = pymysql.connect(host='localhost',user="root",password="",database='genebag',cursorclass=pymysql.cursors.DictCursor)
cur = connection.cursor(pymysql.cursors.DictCursor)

'''Form section'''

class ResgistrationForm(Form):
    user_name = StringField('user_name',[validators.Length(min=4, max=25)])
    email = StringField('email',[validators.Length(min=6, max=35),validators.Email()])
    password = PasswordField('password',[validators.DataRequired(),validators.EqualTo('confirm_pass',message='Passwords must match')])
    confirm_pass = PasswordField('Repeat Password')
    
    
'''End of Form section'''
    
'''Model section'''

class User(db.Model):
    user_id = db.Column(db.Integer, primary_key=True)
    user_name = db.Column(db.String(20), unique=True, nullable=False)
    email = db.Column(db.String(20), nullable=False)
    password = db.Column(db.String(20), nullable=False)
    confirm_pass = db.Column(db.String(20), nullable=False)
    
    def __repr__(self):
        return '<User %r>' % self.id
    
class Bags(db.Model):
    bag_id = db.Column(db.Integer, primary_key=True)
    bag_name = db.Column(db.String(20), nullable=False)
    price = db.Column(db.Integer, nullable=False)
    brand = db.Column(db.String(20), nullable=False)
    bag_type = db.Column(db.String(20), nullable=False)
    desc = db.Column(db.String(150), nullable=False)
    img = db.Column(db.String(150), nullable=False)
    
    brand_id = db.Column(db.Integer, db.ForeignKey('brand.id'),nullable=False)
    brand = db.relationship('Brand',backref=db.backref('posts',lazy=True))
    
    def __repr__(self):
        return '<Bags %r>' % self.id

class Brand(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(20), nullable=False, unique=True)
    
    def __repr__(self):
        return  '%r' % self.name
     
    
'''End of Model section'''

'''Route section'''

@app.route("/")
def index():
    return render_template('index.html')


@app.route('/home')
def home():
 
    return render_template('home.html')


@app.route("/login", methods = ['GET','POST'])
def login():
    if(request.method == 'POST'):
        user_name = request.form['user_name']
        password = request.form['password']
        cur.execute('SELECT * FROM user WHERE user_name = %s AND password = %s',(user_name,password))
        record = cur.fetchone()
        if record:
            cur.execute("SELECT SUM(quantity) as total_quantity FROM cart WHERE user_id=%s",(record['user_id'],))
            cart_data = cur.fetchone()
            session['loggedin'] = True
            session['user_name'] = record["user_name"]
            session['email'] = record["email"]
            session['user_id'] = record["user_id"]
            session['total_cart_items']=cart_data['total_quantity']
            flash(f"Welcome {user_name}","success")
            return redirect(url_for('home'))    
        else:
            flash("Wrong username / password - Try again!","error") 
             
    return render_template('login.html')


def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if 'loggedin' not in session:
            flash('Your session ended!, signin again...')
            return redirect(url_for('login'))
        return f(*args, **kwargs)
    return decorated_function


@app.route("/logout")
@login_required
def logout():
    session.clear()
    flash("Thank you, Visit again..!")
    return redirect(url_for('index'))



@app.route("/signup", methods = ['GET','POST'])
def signup():
    form = ResgistrationForm(request.form)
    if(request.method == 'POST' and form.validate()):
        user_name = request.form.get('user_name')
        email = request.form.get('email')
        password = request.form.get('password')
        confirm_pass = request.form.get('confirm_pass')

        
        if confirm_pass != password:
            flash("Password does not match!, error")
            return render_template("signup.html")
        
        cur.execute("""SELECT * FROM user WHERE email=%(mail)s""", {"mail":email})
        res = cur.fetchone()
        if res:
            flash("User already exists! Try signing in","error")
            return redirect(url_for('login'))
        
        else:
            cur.execute("SELECT * FROM user WHERE user_id=%(u_id)s",{"u_id":user_name})
            if cur.fetchone():
                flash("Username already exists! try different one","error")
            
            else:
                
                cur.execute("INSERT INTO user (user_name,email,password,confirm_pass) VALUES (%s,%s,%s,%s)",(user_name,email,password,password))
                connection.commit()
                flash(f'Welcome {user_name}, Thank you for registering','success')
        return render_template('index.html',form=form)
        
    return render_template('signup.html')

@app.route("/product")
@login_required
def product():
    bags = Bags.query.all()
    brands = Brand.query.all()
    return render_template('product.html',bags=bags,brands=brands)


@app.route("/brand/<int:id>")
def get_brand(id):
    brand = Bags.query.filter_by(brand_id = id)
    return render_template('product.html',brand=brand)


@app.route('/details/<int:id>')
def details(id):
    product = Bags.query.get_or_404(id)
   
    return render_template('details.html',product=product)


def array_merge (first_array, second_array):
    if isinstance(first_array, list) and isinstance(second_array, list):
        return first_array + second_array
    elif isinstance(first_array, dict) and isinstance(second_array, dict):
        return dict(list(first_array.items() ) + list(second_array.items() ))
    elif isinstance(first_array, set) and isinstance(second_array, set):
        return first_array.union(second_array)
    return False

@app.route("/addcart", methods = ['POST'])
def AddCart():
    try:
        bag_id = request.form['bag_id']
        quantity = int(request.form['quantity'])
        if bag_id and quantity and request.method == 'POST':
            cur.execute("SELECT * FROM bags WHERE bag_id=%s", bag_id)
            bag = cur.fetchone()
            cur.execute("SELECT * FROM cart WHERE bag_id=%s and user_id=%s",(bag_id,session['user_id']))
            row = cur.fetchone()
            if row:
                total_quantity = row['quantity']+quantity
                total_price = row['price']+quantity*bag['price']
                cur.execute("UPDATE cart SET quantity=quantity+%s, price=price+%s WHERE bag_id=%s AND user_id=%s",(total_quantity,total_price,bag['bag_id'],session['user_id']))
                connection.commit()
                cur.execute("SELECT SUM(quantity) as total_quantity FROM cart WHERE user_id=%s",(session['user_id'],))
                cart_data = cur.fetchone()
                session['total_cart_items']=cart_data['total_quantity']
                return redirect(url_for('product'))
            else:
                cur.execute("INSERT INTO cart (bag_id,user_id,quantity,price,img,bag_name) VALUES (%s,%s,%s,%s,%s,%s)",(bag_id,session['user_id'],quantity,int(bag['price']*quantity),bag['img'],bag['bag_name']))
                connection.commit()
                cur.execute("SELECT SUM(quantity) as total_quantity FROM cart WHERE user_id=%s",(session['user_id'],))
                cart_data = cur.fetchone()
                session['total_cart_items']=cart_data['total_quantity']
                flash("Product added to Cart...!")
                return redirect(url_for('product'))
        else:
            return "Something went wrong!"
    except:
        return "Something went wrong!"
        
        
@app.route('/empty')
def empty_cart():
    try:
        cur.execute("DELETE FROM cart WHERE user_id=%s",(session['user_id'],))
        connection.commit()
        cur.execute("SELECT SUM(quantity) as total_quantity FROM cart WHERE user_id=%s",(session['user_id'],))
        cart_data = cur.fetchone()
        session['total_cart_items']=cart_data['total_quantity']
        return redirect(url_for('getCart'))
    except Exception as e:
        print(e)
        return "Something went wrong!"
        

@app.route('/delete/<int:id>')
def delete_product(id):
    try:
        cur.execute("DELETE FROM cart WHERE user_id=%s AND bag_id=%s",(session['user_id'],id))
        connection.commit()
        cur.execute("SELECT SUM(quantity) as total_quantity FROM cart WHERE user_id=%s",(session['user_id'],))
        cart_data = cur.fetchone()
        session['total_cart_items']=cart_data['total_quantity']
        return redirect(url_for('getCart'))
    except Exception as e:
        print(e)  
        return str(e)     
 


@app.route('/cart')
@login_required
def getCart():
    try:
        cur.execute("SELECT * FROM cart WHERE user_id=%s",(session['user_id'],))
        cart_items = cur.fetchall()
        cur.execute("SELECT SUM(price) as total_price,SUM(quantity) as total_quantity FROM cart WHERE user_id=%s",(session['user_id'],))
        cart_data = cur.fetchone()
        return render_template("cart.html",cart_items=cart_items,cart_data=cart_data,len=len)
    except Exception as e:
        print(e)
        return "Something went wrong!"

@app.route('/profile')
def profile():
    return render_template('profile.html')
  
    

@app.route('/about')
def about():
    return render_template('About.html')

@app.route('/copyrights')
def copyright():
  
    return render_template('copyrights.html')

@app.route('/feedback',methods=["POST","GET"])
@login_required
def feedback():
    try:
        if request.method=="POST":
            q1 = request.form['q1']
            q2 = request.form['q2']
            q3 = request.form['q3']
            q4 = request.form['q4']
            desc = request.form['description']
            cur.execute("INSERT INTO feedback (q1,q2,q3,q4,description,user_id) VALUES (%s,%s,%s,%s,%s,%s)",(q1,q2,q3,q4,desc,session['user_id']))
            connection.commit()
            flash("Your response has been recorded!","success")
            return redirect(url_for('home'))
        return render_template('feedback.html')
    except:
        return "Something went wrong!"

@app.route('/contact',methods=["POST","GET"])
@login_required
def contact():
    try:
        if request.method=="POST":
            user_name = request.form['user_name']
            place = request.form['place']
            phone_no = request.form['phone_no']
            email = request.form['email']
            message = request.form['message']
            cur.execute("INSERT INTO contact_us (user_id,user_name,place,phone_no,email,message) VALUES (%s,%s,%s,%s,%s,%s)",(session['user_id'],user_name,place,phone_no,email,message))
            connection.commit()
            flash("Your response has been recorded!","success")
            return redirect(url_for('home'))
        return render_template('contact_us.html')
    except:
        return "Something went wrong!"

      
    
@app.route('/terms')
def terms():
  
    return render_template('terms.html')

@app.route('/checkout')
def checkout():
    try:
        cur.execute("SELECT SUM(price) as total_price FROM cart WHERE user_id=%s",(session['user_id'],))
        cart_data = cur.fetchone()
        return render_template('payment.html',total=int(cart_data['total_price']),int=int)
    except:
        return "Somthing went wrong!"
    
@app.route('/payment',methods=["POST"])
def payment():
    try:
        if request.method == "POST":
            cur.execute("SELECT SUM(price) as price FROM cart WHERE user_id=%s",(session['user_id'],))
            amt_data = cur.fetchone()
            amt = amt_data['price']
            cur.execute("INSERT INTO payment (user_id,payment_amt) VALUES (%s,%s)",(session['user_id'],amt))
            cur.execute("DELETE FROM cart WHERE user_id=%s",(session['user_id'],))
            connection.commit()
            cur.execute("SELECT SUM(quantity) as total_quantity FROM cart WHERE user_id=%s",(session['user_id'],))
            cart_data = cur.fetchone()
            session['total_cart_items']=cart_data['total_quantity']
            flash("Payment Successful!","success")
            flash("Order placed successfully..!")
            return redirect(url_for('home'))
        else:
            return "FORBIDDEN"
    except:
        return "Somthing went wrong!"
    


'''End of Route section'''



app.run(debug=True)