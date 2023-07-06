-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2023 at 07:58 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `genebag`
--

-- --------------------------------------------------------

--
-- Table structure for table `bags`
--

CREATE TABLE `bags` (
  `bag_id` int(11) NOT NULL,
  `bag_name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `brand` varchar(20) NOT NULL,
  `bag_type` varchar(20) NOT NULL,
  `desc` text NOT NULL,
  `img` text NOT NULL,
  `brand_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bags`
--

INSERT INTO `bags` (`bag_id`, `bag_name`, `price`, `brand`, `bag_type`, `desc`, `img`, `brand_id`) VALUES
(1, 'American Tourister Laptop Backpack', 50, 'American Tourister', 'bagpack', 'Marking Our Presence In 100+ Countries American Tourister Is Considered To Be The Most Preferred Luggage Brand Worldwide. \r\nSchool • Unisex\r\n', 'AT1.jpg', 1),
(2, 'Saima American Tourister Backpack Bag - 15 L Backp', 65, 'American Tourister', 'bagpack', '30% Extra Storage We Indians Tend To Carry A Lot Of Stuff In Our Backpacks, Which Is Why This Saimaenterprises Backpack Comes With Three Spacious Compartments. Maximized ...\r\nUnisex\r\n', 'AT2.jpg', 1),
(3, 'Skybags Decode Daypack E Black 11 L Backpack', 38, 'Sky Bags', 'bagpack', 'Complement your chic and trendy look carrying this unisex laptop backpack from the Decode Daypack collection by Skybags. Adorned with a printed pattern, this black backpack ...\r\nSchool • Nylon • Unisex • For Children\r\n', 'sk1.jpg', 2),
(4, 'Skybags Brat School Bags - Height 18.5 Inches', 35, 'Sky Bags', 'bagpack', '6 Years+, L 35 x B 13 x H 47 cm, Spacious to accommodate all essentials, Attractive colour and print Adjustable and padded shoulder strap for yours comfort', 'sk2.jpg', 2),
(5, 'GUCCI LADIES PREMIUM HANDBAGS (DESIGN: 3)', 90, 'Gucci', 'Satchel', 'GUCCI BAMBOO TOP HANDLE WITH TRI COLOUR GUCCI STRAP WITH BOX SMART ELEGANT AND LATEST EDITION LIVE VIDEO GIVEN EXCELLENT QUALITY UNBEATABLE/ UNBELIEVABLE ', 'GU1.jpg', 3),
(6, 'Gucci Leather Sling Bag', 95, 'Gucci', 'Sling Bag', 'Gucci Latest 12A Quality Size: 5 By 8 Inches Comes With Bill, Branded Box & Satin Dust Cover\r\nGenuine Leather\r\n', 'GU2.jpg', 3),
(7, 'F-GEAR 17\" Laptop Bag (Grey, OS)', 40, 'Gear', 'Bagpack', 'Grey, 17\" Laptop Bag with Zip Pockets Classic Laptop Bags perfect for Casual occasion.\r\nMen\'s\r\n', 'GE1.jpg', 4),
(8, 'Gear Blue Laptop Backpack', 35, 'Gear', 'Bagpack', 'Shoulder Straps Padded With Pp Foam/ Eva Sheet. Anti Slip Fabric / Breathable Spongy Mesh On Shoulder Stpars Waterproof Interior And Exterior Fabric For Double Protection ...\r\nWaterproof • India Ink • Unisex\r\n', 'GE2.jpg', 4),
(9, 'American Tourister Zook NXT 01 Purple Backpack', 65, 'American Tourister', 'Bagpack', 'Broaden the collection of your accessories with this backpack from the house of American Tourister. It has been made of good quality material to make certain that it lasts for ...\r\nWaterproof • Purple • Unisex\r\n', 'AT3.jpg', 1),
(10, 'Sky Bags Men Green & Yellow Printed Rucksack', 60, 'Sky Bags', 'Rucksack', 'Style Code Is Kamzakksecure55coral. Locking Mechanism Is Number Lock. Pattern Is Striped. Capacity Is 52 L. Body Type, Material Is Hard Body. Color Is Blue. Ideal For Is Men ...\r\n2 Wheel / Rolling • Hard Shell\r\n', 'sk3.jpg', 2),
(11, 'F Gear Healer 17 Ltrs Brown Small Laptop Backpack', 55, 'Gear', 'Bagpack', 'Accommodate your world of essentials and knick-knacks in this women\'s laptop backpack from the Healer collection by F Gear and walk in style. ', 'GE3.jpg', 4),
(12, 'Gucci Black Medium Leather Tote Bag', 85, 'Gucci', 'Tote Bag', 'Brown shoulder bag from Gucci. Crafted from lamb leather, this design showcases gold-tone and silver-tone Interlocking G hardware, two half-round handles, a detachable shoulder ...\r\nShoulder Bag • Tote • Genuine Leather • Black\r\n', 'GU4.jpg', 3),
(13, 'American Tourister Sunset Square Cabin Suitcase - ', 75, 'American Tourister', 'Trolley Bag', '\r\n\r\n\r\nAmerican Tourister Sunset Square Cabin Suitcase - 22 Inch\r\nIt Is made of strong and lightweight polycarbonate shells. Re-Engineered lightweight spinner wheels for effortless mobility. Tsa lock ensures security while traveling. Outer ...\r\nSpinner • Hard Shell • Single\r\n\r\n', 'AT7.jpg', 1),
(14, 'American Tourister Trolley NOVASTREAM Light blue ', 45, 'American Tourister', 'Trolley Bag', 'Meet the Novastream Spinner TSA Expandable 67cm (4 wheels). Designed for today ́s modern traveller. Our new favourite travel companion Novastream also embodies a minimalistic ...\r\nSpinner • Hard Shell • Single\r\n', 'AT8.jpg', 1),
(15, 'Gear Blue Solid Duffle Bag', 35, 'Gear', 'Duffle Bag', 'Stop following the bandwagon and showcase your unique fashion sense with this unisex duffle bag from F Gear', 'GE4.jpg', 4),
(16, 'Gear Black And Blue Carryon Backpack', 58, 'Gear', 'Bagpack', 'With Rain Cover Is No. Style Code Is Bkpcaryon0110. Type Is Backpack. Trolley Support Is No. Compatible Laptop Size Is 15.4. Color Is Black. Ideal For Is Men & Women. Color ...\r\nSchool • Black/Blue • Travel • Unisex\r\n', 'GE5.jpg', 4),
(17, 'Gucci Marmont Shoulder Bag', 70, 'Gucci', 'Shoulder Bag', 'GUCCI BAMBOO TOP HANDLE WITH TRI COLOUR GUCCI STRAP WITH BOX SMART ELEGANT AND LATEST EDITION LIVE VIDEO GIVEN EXCELLENT QUALITY UNBEATABLE/ UNBELIEVABLE PRICE.', 'new-arrivals-3.jpg', 3),
(18, 'Kamiliant American Tourister Zakk Secure Cabin Lug', 40, 'American Tourister', 'Rucksack', 'Style Code Is Kamzakksecure55coral. Locking Mechanism Is Number Lock. Pattern Is Striped. Capacity Is 52 L. Body Type, Material Is Hard Body. Color Is Blue. Ideal For Is Men ...\r\n2 Wheel / Rolling • Hard Shell\r\n', 'AT6.jpg', 1),
(19, ' Skybags Decode Daypack E Black 11 L Backpack', 37, 'Sky Bags', 'Bagpack', 'With Rain Cover Is No. Style Code Is Bpgrf27ered. Type Is Backpack. Trolley Support Is No. Color Is Red. Ideal For Is Men & Women. Color Code Is Red. Laptop Sleeve Is No ...\r\nSchool • Waterproof • Unisex • For Children\r\n', 'sk12.jpg', 2),
(20, 'Sky Bags Trolley NOVASTREAM Yellow', 50, 'Sky Bags', 'Trolley Bag', 'It Is made of strong and lightweight polycarbonate shells. Re-Engineered lightweight spinner wheels for effortless mobility. Tsa lock ensures security while traveling. Outer ...\r\nSpinner • Hard Shell • Single\r\n', 'sk8.jpg', 2),
(21, 'American Tourister Polypropylene KROSS SPRING Dark', 43, 'American Tourister', 'Trolley Bag', 'Red, Striped Trolley with TSA Lock Classic Luggage & Trolley Bags perfect for Casual occasion.\r\nSingle\r\n', 'AT12.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `name`) VALUES
(1, 'American Tourister'),
(2, 'Sky Bags'),
(3, 'Gucci'),
(4, 'Gear');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `bag_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `img` text NOT NULL,
  `bag_name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `place` varchar(20) NOT NULL,
  `phone_no` bigint(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `q1` varchar(100) NOT NULL,
  `q2` varchar(100) NOT NULL,
  `q3` varchar(100) NOT NULL,
  `q4` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_amt` int(11) NOT NULL,
  `payment_datetime` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `payment`
--
DELIMITER $$
CREATE TRIGGER `add_payment_date` BEFORE INSERT ON `payment` FOR EACH ROW SET new.payment_datetime=CURRENT_DATE()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `confirm_pass` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `email`, `password`, `confirm_pass`) VALUES
(1, 'Darshan', 'darshan@gmail.com', 'Defender@123', 'Defender@123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bags`
--
ALTER TABLE `bags`
  ADD PRIMARY KEY (`bag_id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD KEY `bag_id` (`bag_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD KEY `contact_us_ibfk_1` (`user_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bags`
--
ALTER TABLE `bags`
  ADD CONSTRAINT `bags_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`bag_id`) REFERENCES `bags` (`bag_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD CONSTRAINT `contact_us_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
