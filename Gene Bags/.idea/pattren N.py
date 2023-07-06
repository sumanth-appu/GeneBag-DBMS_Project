

n=int(input("enter  the value of n:"))

for row in range (n+1):
    for col in range (n+1):
        if col==0 or col==n  or (row==col and (col>0 and col<n)):
            print(" *",end="")
        else:
            print(end="  ")
    print()