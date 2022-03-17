-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2022 at 10:43 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `be15_cr9_famazon_sedlaczek`
--
CREATE DATABASE IF NOT EXISTS `be15_cr9_famazon_sedlaczek` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `be15_cr9_famazon_sedlaczek`;

-- --------------------------------------------------------

--
-- Table structure for table `cart_item`
--

CREATE TABLE `cart_item` (
  `id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `fk_session_id` int(11) DEFAULT NULL,
  `fk_product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart_item`
--

INSERT INTO `cart_item` (`id`, `quantity`, `fk_session_id`, `fk_product_id`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 1, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `cart_session`
--

CREATE TABLE `cart_session` (
  `id` int(11) NOT NULL,
  `fk_user_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart_session`
--

INSERT INTO `cart_session` (`id`, `fk_user_id`, `total`) VALUES
(1, 1, '462.85'),
(2, 2, '79.99'),
(3, 3, '12.21');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `description`) VALUES
(1, 'Phones', NULL),
(2, 'Headphones', NULL),
(3, 'Keyboards', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `percent` decimal(10,0) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`id`, `name`, `description`, `percent`, `active`) VALUES
(1, '5 percent off', NULL, '5', 1),
(2, '10 percent off', NULL, '10', 0),
(3, '15 percent off', NULL, '15', 0);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `warehouse` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `quantity`, `warehouse`) VALUES
(1, 20, 1),
(2, 30, 2),
(3, 40, 3);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `fk_user_id` int(11) DEFAULT NULL,
  `fk_invoice_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `total`, `fk_user_id`, `fk_invoice_no`) VALUES
(1, '462.85', 1, 1),
(2, '79.99', 2, 2),
(3, '12.21', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `order_invoice`
--

CREATE TABLE `order_invoice` (
  `id` int(11) NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `provider` enum('PayPal','Credit Card','Debit Card','Invoice') DEFAULT NULL,
  `status` enum('billed','paid','overdue') DEFAULT NULL,
  `fk_order_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_invoice`
--

INSERT INTO `order_invoice` (`id`, `amount`, `provider`, `status`, `fk_order_id`) VALUES
(1, '462.85', 'PayPal', 'billed', 1),
(2, '79.99', 'Credit Card', 'paid', 2),
(3, '12.21', 'Invoice', 'overdue', 3);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `fk_order_id` int(11) DEFAULT NULL,
  `fk_product_id` int(11) DEFAULT NULL,
  `fk_shipper_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `quantity`, `fk_order_id`, `fk_product_id`, `fk_shipper_id`) VALUES
(1, 1, 1, 1, 1),
(2, 1, 2, 2, 2),
(3, 1, 3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `barcode` varchar(20) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `fk_category_id` int(11) DEFAULT NULL,
  `fk_inventory_id` int(11) DEFAULT NULL,
  `fk_discount_id` int(11) DEFAULT NULL,
  `fk_supplier_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `barcode`, `price`, `image`, `fk_category_id`, `fk_inventory_id`, `fk_discount_id`, `fk_supplier_id`) VALUES
(1, 'iPhone SE 64GB', NULL, NULL, '463.85', '../images/81nld4NtAkL._AC_SL1500_.jpg', 1, 1, 2, 1),
(2, 'Bluetooth Illuminated Keyboard K810', NULL, NULL, '79.99', '../images/71jr6psIRdL._AC_SL1500_.jpg', 2, 2, 3, 2),
(3, 'HA-S160-B-EF On-Ear Headphones Black', NULL, NULL, '12.21', '../images/61lHZRiuWKL._AC_SL1500_.jpg', 3, 3, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `shipper`
--

CREATE TABLE `shipper` (
  `id` int(11) NOT NULL,
  `company` varchar(30) DEFAULT NULL,
  `country` varchar(53) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shipper`
--

INSERT INTO `shipper` (`id`, `company`, `country`, `city`) VALUES
(1, 'BSS Logistik', 'Austria', 'Hütendorf/Mistelbach'),
(2, 'DHL', 'Germany', 'Bonn'),
(3, 'UPS', 'Austria', 'Vienna');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `company` varchar(30) DEFAULT NULL,
  `country` varchar(53) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `company`, `country`, `city`) VALUES
(1, 'Apple', 'Austria', 'Vienna'),
(2, 'Logitech', 'Austria', 'Vienna'),
(3, 'JVC', 'Austria', 'Vienna');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(64) DEFAULT NULL,
  `first_name` varchar(35) DEFAULT NULL,
  `last_name` varchar(35) DEFAULT NULL,
  `pwd` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `first_name`, `last_name`, `pwd`, `email`) VALUES
(1, 'johndoe', 'John', 'Doe', NULL, 'johndoe@mail.com'),
(2, 'janedoe', 'Jane', 'Doe', NULL, 'janedoe@mail.com'),
(3, 'jilldoe', 'Jill', 'Doe', NULL, 'jilldoe@mail.com');

-- --------------------------------------------------------

--
-- Table structure for table `user_address`
--

CREATE TABLE `user_address` (
  `address_id` int(11) NOT NULL,
  `fk_user_id` int(11) DEFAULT NULL,
  `address_line1` varchar(95) DEFAULT NULL,
  `address_line2` varchar(95) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `country` varchar(53) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `mobile` varchar(26) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_address`
--

INSERT INTO `user_address` (`address_id`, `fk_user_id`, `address_line1`, `address_line2`, `city`, `postal_code`, `country`, `telephone`, `mobile`) VALUES
(1, 1, 'Kirchenplatz 6/8/1', NULL, 'Vienna', '1230', 'Austria', NULL, NULL),
(2, 2, 'Degengasse 70/3/1B', NULL, 'Vienna', '1160', 'Austria', NULL, NULL),
(3, 3, 'Saileräckerg 47', NULL, 'Vienna', '1190', 'Austria', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_billing`
--

CREATE TABLE `user_billing` (
  `id` int(11) NOT NULL,
  `fk_user_id` int(11) DEFAULT NULL,
  `provider` enum('PayPal','Credit Card','Debit Card','Invoice') DEFAULT NULL,
  `account_no` varchar(20) DEFAULT NULL,
  `expiry` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_billing`
--

INSERT INTO `user_billing` (`id`, `fk_user_id`, `provider`, `account_no`, `expiry`) VALUES
(1, 1, 'PayPal', NULL, NULL),
(2, 2, 'Credit Card', '1234 5678 9012 3456', '2025-12-31'),
(3, 3, 'Invoice', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_session_id` (`fk_session_id`),
  ADD KEY `fk_product_id` (`fk_product_id`);

--
-- Indexes for table `cart_session`
--
ALTER TABLE `cart_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id` (`fk_user_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_ibfk_1` (`fk_user_id`),
  ADD KEY `order_details_ibfk_2` (`fk_invoice_no`);

--
-- Indexes for table `order_invoice`
--
ALTER TABLE `order_invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_invoice_ibfk_1` (`fk_order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_ibfk_1` (`fk_order_id`),
  ADD KEY `order_items_ibfk_2` (`fk_product_id`),
  ADD KEY `order_items_ibfk_3` (`fk_shipper_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_category_id` (`fk_category_id`),
  ADD KEY `fk_inventory_id` (`fk_inventory_id`),
  ADD KEY `fk_discount_id` (`fk_discount_id`),
  ADD KEY `fk_supplier_id` (`fk_supplier_id`);

--
-- Indexes for table `shipper`
--
ALTER TABLE `shipper`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_address`
--
ALTER TABLE `user_address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `fk_user_id` (`fk_user_id`);

--
-- Indexes for table `user_billing`
--
ALTER TABLE `user_billing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id` (`fk_user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_item`
--
ALTER TABLE `cart_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cart_session`
--
ALTER TABLE `cart_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `order_invoice`
--
ALTER TABLE `order_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shipper`
--
ALTER TABLE `shipper`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_address`
--
ALTER TABLE `user_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_billing`
--
ALTER TABLE `user_billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD CONSTRAINT `cart_item_ibfk_1` FOREIGN KEY (`fk_session_id`) REFERENCES `cart_session` (`id`),
  ADD CONSTRAINT `cart_item_ibfk_2` FOREIGN KEY (`fk_product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `cart_session`
--
ALTER TABLE `cart_session`
  ADD CONSTRAINT `cart_session_ibfk_1` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`fk_invoice_no`) REFERENCES `order_invoice` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `order_invoice`
--
ALTER TABLE `order_invoice`
  ADD CONSTRAINT `order_invoice_ibfk_1` FOREIGN KEY (`fk_order_id`) REFERENCES `order_details` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`fk_order_id`) REFERENCES `order_details` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`fk_product_id`) REFERENCES `product` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_3` FOREIGN KEY (`fk_shipper_id`) REFERENCES `shipper` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`fk_category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`fk_inventory_id`) REFERENCES `inventory` (`id`),
  ADD CONSTRAINT `product_ibfk_3` FOREIGN KEY (`fk_discount_id`) REFERENCES `discount` (`id`),
  ADD CONSTRAINT `product_ibfk_4` FOREIGN KEY (`fk_supplier_id`) REFERENCES `supplier` (`id`);

--
-- Constraints for table `user_address`
--
ALTER TABLE `user_address`
  ADD CONSTRAINT `user_address_ibfk_1` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user_billing`
--
ALTER TABLE `user_billing`
  ADD CONSTRAINT `user_billing_ibfk_1` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
