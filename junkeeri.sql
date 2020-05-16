-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 13, 2020 at 08:09 PM
-- Server version: 5.7.29-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `junkeeri`
--

-- --------------------------------------------------------

--
-- Table structure for table `about`
--

CREATE TABLE `about` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `information` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `division_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `version`, `division_id`, `name`) VALUES
(1, 0, 1, 'Clothing');

-- --------------------------------------------------------

--
-- Table structure for table `category_hierarchy`
--

CREATE TABLE `category_hierarchy` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `hierarchy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_hierarchy`
--

INSERT INTO `category_hierarchy` (`id`, `version`, `product_id`, `category_id`, `hierarchy`) VALUES
(1, 0, 3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `numbers` varchar(255) NOT NULL,
  `instagram` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `version`, `address`, `facebook`, `numbers`, `instagram`, `email`) VALUES
(1, 3, 'Chabahil, Kathmandu, Nepal.', '#', '9866273353-9801000043-9869726111', '#', 'junintpvt@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `date` datetime(6) NOT NULL,
  `numbers` varchar(255) NOT NULL,
  `payment_method` varchar(16) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `total` int(11) NOT NULL,
  `delivery_status` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `version`, `date`, `numbers`, `payment_method`, `name`, `email`, `total`, `delivery_status`) VALUES
(1, 0, '2020-04-17 15:40:56.555000', '9860081670', 'Khalti', 'Shreya Sapkota', 'none', 1000, 'Pending'),
(2, 0, '2020-04-17 15:51:47.075000', '9860081670', 'Khalti', 'Shreya Sapkota', 'none', 1000, 'Pending'),
(3, 0, '2020-04-17 16:16:24.589000', '9860081670', 'Khalti', 'Shreya Sapkota', 'none', 1000, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `offer` varchar(255) NOT NULL,
  `valid_till` datetime(6) NOT NULL,
  `rate` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `valid_from` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`id`, `version`, `offer`, `valid_till`, `rate`, `type`, `valid_from`) VALUES
(5, 6, 's', '2020-12-27 00:00:00.000000', 12, 'Percentage', '2020-02-27 00:00:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `division`
--

CREATE TABLE `division` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `division`
--

INSERT INTO `division` (`id`, `version`, `name`, `image`) VALUES
(1, 4, 'Men', '1589377787989img4.png');

-- --------------------------------------------------------

--
-- Table structure for table `featured`
--

CREATE TABLE `featured` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `image` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `featured`
--

INSERT INTO `featured` (`id`, `version`, `image`, `name`, `title`, `link`) VALUES
(3, 1, '1589379420583614915-PNJJUL-812.jpg', 'Kids', 'GET EVERYTHING', 'https://www.google.com/search?client=opera&q=Cannot+read+property+%27mData%27+of+undefinedat+HTMLTableCellElement.<anonymous>+(jquery.dataTables.js%3A11&sourceid=opera&ie=UTF-8&oe=UTF-8');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `color` varchar(255) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `sales` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `version`, `color`, `product_id`, `sales`) VALUES
(43, 0, 'red', 3, 0),
(44, 0, 'Black', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `option_image`
--

CREATE TABLE `option_image` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `option_id` bigint(20) NOT NULL,
  `image` varchar(255) NOT NULL,
  `hierarchy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `option_image`
--

INSERT INTO `option_image` (`id`, `version`, `option_id`, `image`, `hierarchy`) VALUES
(21, 0, 43, '1585241457634IMG_7568.JPG', 1),
(22, 0, 43, '1585241457699IMG_7567.JPG', 2),
(23, 0, 44, '1585817319083IMG_7454.JPG', 1),
(24, 0, 44, '1585817319218IMG_7456.JPG', 2);

-- --------------------------------------------------------

--
-- Table structure for table `option_size`
--

CREATE TABLE `option_size` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `option_id` bigint(20) NOT NULL,
  `size` varchar(255) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `option_size`
--

INSERT INTO `option_size` (`id`, `version`, `option_id`, `size`, `stock`) VALUES
(6, 0, 43, 'S', 20),
(7, 0, 44, 'M', 12),
(8, 0, 44, 'L', 12);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `sales_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `version`, `customer_id`, `sales_id`) VALUES
(1, 0, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `division_id` bigint(20) NOT NULL,
  `price` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` varchar(9) NOT NULL,
  `shipping` varchar(255) NOT NULL,
  `features` varchar(255) NOT NULL,
  `instruction` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `total_sales` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `version`, `division_id`, `price`, `name`, `category_id`, `description`, `status`, `shipping`, `features`, `instruction`, `brand`, `total_sales`) VALUES
(3, 8, 1, 2345, 'mn', 1, 'Faux leather biker jacket. Transverse closure on the front with zip. Lapel collar with application of metal buttons. Side pockets with zip and one with flap. Waist belt', 'Available', 'Free', 'Biker jacket for women\r\nTransver Closure\r\nFaux Leather Fabric\r\nZip Pockets\r\nWaist Belt', 'Model	\r\n25442\r\nWash	\r\nWash 30 degrees\r\nDry cleaning not allowed\r\nDo not bleach\r\nDo not tumble dry\r\nIron at maximum temperature 110 degrees\r\nComposition	\r\n70% VISCOSE 30% NYLON', 'vsv', 0);

-- --------------------------------------------------------

--
-- Table structure for table `products_on_discount`
--

CREATE TABLE `products_on_discount` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `discount_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products_on_discount`
--

INSERT INTO `products_on_discount` (`id`, `version`, `product_id`, `discount_id`) VALUES
(17, 0, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `promo_code`
--

CREATE TABLE `promo_code` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `valid_till` datetime(6) NOT NULL,
  `rate` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `valid_from` datetime(6) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `authority` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `version`, `authority`) VALUES
(1, 0, 'ROLE_ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `option_size_id` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `version`, `product_id`, `option_size_id`, `code`, `quantity`) VALUES
(1, 0, 3, 6, 'none', 1),
(2, 0, 3, 6, 'none', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_category`
--

INSERT INTO `sub_category` (`id`, `version`, `name`) VALUES
(1, 0, 'Shirt'),
(2, 0, 'Full Sleeves Shirt'),
(3, 0, 'Half Sleeves');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL,
  `password_expired` bit(1) NOT NULL,
  `username` varchar(255) NOT NULL,
  `account_locked` bit(1) NOT NULL,
  `password` varchar(255) NOT NULL,
  `account_expired` bit(1) NOT NULL,
  `enabled` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `version`, `password_expired`, `username`, `account_locked`, `password`, `account_expired`, `enabled`) VALUES
(2, 0, b'0', 'adminJunkeeri', b'0', '{bcrypt}$2a$10$3bl7J/zNlgYsTa4PoQ0/8u0mVMasp05n6UeOM8lZOAL.gM4..aXpC', b'0', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`, `version`) VALUES
(2, 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK7he7b9x4pieeoxix5krl0fr4v` (`division_id`);

--
-- Indexes for table `category_hierarchy`
--
ALTER TABLE `category_hierarchy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKlngkwebh7fljl69o8vv5fnsvm` (`product_id`),
  ADD KEY `FK7yfqxoxa8e5kv7h36e6qqgbcu` (`category_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `division`
--
ALTER TABLE `division`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `featured`
--
ALTER TABLE `featured`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKj3bcdkwkruna46tcdi2gpfxty` (`product_id`);

--
-- Indexes for table `option_image`
--
ALTER TABLE `option_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK25yd6rxw8aq1hc0xx3qc4n2j0` (`option_id`);

--
-- Indexes for table `option_size`
--
ALTER TABLE `option_size`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKaed3t48oc8x290762cw8cahs8` (`option_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3x5l78p8fkdgbqgt1ta6ro5lm` (`customer_id`),
  ADD KEY `FKg5abfqm4jku13jlh8b10ekn66` (`sales_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKnysc17it5u4pf5g7dnlagxy63` (`division_id`),
  ADD KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`);

--
-- Indexes for table `products_on_discount`
--
ALTER TABLE `products_on_discount`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK6bu9u98yhp6gtsy55qlvjr52q` (`product_id`),
  ADD KEY `FKfq9fk25wc4io08b1sdkjgp802` (`discount_id`);

--
-- Indexes for table `promo_code`
--
ALTER TABLE `promo_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_irsamgnera6angm0prq1kemt2` (`authority`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKfcs4mjmgry6xchs16dv03eclp` (`product_id`),
  ADD KEY `FKp3cj56cnfmau3hvoi8843elm3` (`option_size_id`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about`
--
ALTER TABLE `about`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `category_hierarchy`
--
ALTER TABLE `category_hierarchy`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `division`
--
ALTER TABLE `division`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `featured`
--
ALTER TABLE `featured`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `option_image`
--
ALTER TABLE `option_image`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `option_size`
--
ALTER TABLE `option_size`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `products_on_discount`
--
ALTER TABLE `products_on_discount`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `promo_code`
--
ALTER TABLE `promo_code`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `FK7he7b9x4pieeoxix5krl0fr4v` FOREIGN KEY (`division_id`) REFERENCES `division` (`id`);

--
-- Constraints for table `category_hierarchy`
--
ALTER TABLE `category_hierarchy`
  ADD CONSTRAINT `FK7yfqxoxa8e5kv7h36e6qqgbcu` FOREIGN KEY (`category_id`) REFERENCES `sub_category` (`id`),
  ADD CONSTRAINT `FKlngkwebh7fljl69o8vv5fnsvm` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `FKj3bcdkwkruna46tcdi2gpfxty` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `option_image`
--
ALTER TABLE `option_image`
  ADD CONSTRAINT `FK25yd6rxw8aq1hc0xx3qc4n2j0` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`);

--
-- Constraints for table `option_size`
--
ALTER TABLE `option_size`
  ADD CONSTRAINT `FKaed3t48oc8x290762cw8cahs8` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `FK3x5l78p8fkdgbqgt1ta6ro5lm` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `FKg5abfqm4jku13jlh8b10ekn66` FOREIGN KEY (`sales_id`) REFERENCES `sales` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FKnysc17it5u4pf5g7dnlagxy63` FOREIGN KEY (`division_id`) REFERENCES `division` (`id`);

--
-- Constraints for table `products_on_discount`
--
ALTER TABLE `products_on_discount`
  ADD CONSTRAINT `FK6bu9u98yhp6gtsy55qlvjr52q` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FKfq9fk25wc4io08b1sdkjgp802` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`id`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `FKfcs4mjmgry6xchs16dv03eclp` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FKp3cj56cnfmau3hvoi8843elm3` FOREIGN KEY (`option_size_id`) REFERENCES `option_size` (`id`);

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
