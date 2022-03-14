-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2022 at 08:58 AM
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

-- --------------------------------------------------------

--
-- Table structure for table `cart_session`
--

CREATE TABLE `cart_session` (
  `id` int(11) NOT NULL,
  `fk_user_id` int(11) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `fk_user_id` int(11) DEFAULT NULL,
  `fk_invoice_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_invoice`
--

CREATE TABLE `order_invoice` (
  `id` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `provider` varchar(30) DEFAULT NULL,
  `status` enum('billed','paid','overdue') DEFAULT NULL,
  `fk_order_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `fk_order_id` int(11) DEFAULT NULL,
  `fk_product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `barcode` varchar(20) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `fk_category_id` int(11) DEFAULT NULL,
  `fk_inventory_id` int(11) DEFAULT NULL,
  `fk_discount_id` int(11) DEFAULT NULL,
  `fk_supplier_id` int(11) DEFAULT NULL,
  `fk_shipper_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

-- --------------------------------------------------------

--
-- Table structure for table `user_billing`
--

CREATE TABLE `user_billing` (
  `id` int(11) NOT NULL,
  `fk_user_id` int(11) DEFAULT NULL,
  `pay_type` enum('PayPal','Credit Card','Debit Card','Invoice') DEFAULT NULL,
  `provider` varchar(30) DEFAULT NULL,
  `account_no` int(11) DEFAULT NULL,
  `expiry` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  ADD KEY `fk_user_id` (`fk_user_id`),
  ADD KEY `fk_invoice_no` (`fk_invoice_no`);

--
-- Indexes for table `order_invoice`
--
ALTER TABLE `order_invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_order_id` (`fk_order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_order_id` (`fk_order_id`),
  ADD KEY `fk_product_id` (`fk_product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_category_id` (`fk_category_id`),
  ADD KEY `fk_inventory_id` (`fk_inventory_id`),
  ADD KEY `fk_discount_id` (`fk_discount_id`),
  ADD KEY `fk_supplier_id` (`fk_supplier_id`),
  ADD KEY `fk_shipper_id` (`fk_shipper_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_session`
--
ALTER TABLE `cart_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_invoice`
--
ALTER TABLE `order_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipper`
--
ALTER TABLE `shipper`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_address`
--
ALTER TABLE `user_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_billing`
--
ALTER TABLE `user_billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`fk_invoice_no`) REFERENCES `order_invoice` (`id`);

--
-- Constraints for table `order_invoice`
--
ALTER TABLE `order_invoice`
  ADD CONSTRAINT `order_invoice_ibfk_1` FOREIGN KEY (`fk_order_id`) REFERENCES `order_details` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`fk_order_id`) REFERENCES `order_details` (`id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`fk_product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`fk_category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`fk_inventory_id`) REFERENCES `inventory` (`id`),
  ADD CONSTRAINT `product_ibfk_3` FOREIGN KEY (`fk_discount_id`) REFERENCES `discount` (`id`),
  ADD CONSTRAINT `product_ibfk_4` FOREIGN KEY (`fk_supplier_id`) REFERENCES `supplier` (`id`),
  ADD CONSTRAINT `product_ibfk_5` FOREIGN KEY (`fk_shipper_id`) REFERENCES `shipper` (`id`);

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
