-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 14, 2022 at 02:23 AM
-- Server version: 8.0.17
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spos`
--

-- --------------------------------------------------------

--
-- Table structure for table `tec_adjustments`
--

CREATE TABLE `tec_adjustments` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `reference` varchar(200) DEFAULT NULL,
  `note` text,
  `attachment` varchar(200) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_adjustment_items`
--

CREATE TABLE `tec_adjustment_items` (
  `id` int(11) NOT NULL,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(25,4) NOT NULL,
  `type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_categories`
--

CREATE TABLE `tec_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(100) DEFAULT 'no_image.png',
  `store_id` tinyint(1) NOT NULL DEFAULT '1',
  `default_store_cate` tinyint(1) NOT NULL,
  `discount` varchar(20) NOT NULL DEFAULT '0',
  `ingredient` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_categories`
--

INSERT INTO `tec_categories` (`id`, `code`, `name`, `image`, `store_id`, `default_store_cate`, `discount`, `ingredient`) VALUES
(1, 'C01', 'អារហារពេលព្រឹក', 'no_image.png', 1, 0, '0', 0),
(2, 'C02', 'អារហារថៃ្ងត្រង់', 'no_image.png', 1, 0, '0', 0),
(3, 'C03', 'អារហារពេលល្ងាច', 'no_image.png', 1, 0, '0', 0),
(4, 'C04', 'អារហារសម្រន់', 'no_image.png', 1, 0, '0', 0),
(5, 'C05', 'បុកល្ហុង', 'no_image.png', 1, 0, '0', 0),
(6, 'C06', 'ភ្លា', 'no_image.png', 1, 0, '0', 0),
(7, 'C07', 'បន្លែ', 'no_image.png', 1, 0, '0', 0),
(8, 'C08', 'ភេសជ្ជៈ', 'no_image.png', 1, 0, '0', 0),
(9, 'C09', 'ប្រភេទក្រឡុក', 'no_image.png', 1, 0, '0', 0),
(10, 'C10', 'ប្រភេទក្ដៅ', 'no_image.png', 1, 0, '0', 0),
(11, 'C11', 'តែគុជ', 'no_image.png', 1, 0, '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tec_combo_items`
--

CREATE TABLE `tec_combo_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(150) NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_customers`
--

CREATE TABLE `tec_customers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cf1` varchar(255) NOT NULL,
  `cf2` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `hide` tinyint(1) NOT NULL,
  `discount` varchar(20) NOT NULL DEFAULT '0',
  `award_points` decimal(25,4) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_customers`
--

INSERT INTO `tec_customers` (`id`, `name`, `cf1`, `cf2`, `phone`, `email`, `store_id`, `hide`, `discount`, `award_points`, `group_id`) VALUES
(1, 'ទូទៅ', '', '', '', '', NULL, 0, '0', NULL, NULL),
(4, 'LAY SOKKONG', 'ចំការមន', '', '088 42 42 224', '', NULL, 0, '', '0.0000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tec_customer_group`
--

CREATE TABLE `tec_customer_group` (
  `id` int(11) NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_expenses`
--

CREATE TABLE `tec_expenses` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1',
  `type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_gift_cards`
--

CREATE TABLE `tec_gift_cards` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_groups`
--

CREATE TABLE `tec_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_groups`
--

INSERT INTO `tec_groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'staff', 'Cashier'),
(3, 'stock', 'Stock'),
(4, 'manager', 'Manager'),
(5, 'print', 'Print Only'),
(6, 'salereport', 'View Sales Report'),
(7, 'allreports', 'View All Reports'),
(8, 'order', 'Order'),
(9, 'supervisor', 'Supervisor');

-- --------------------------------------------------------

--
-- Table structure for table `tec_login_attempts`
--

CREATE TABLE `tec_login_attempts` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_payments`
--

CREATE TABLE `tec_payments` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT '0.0000',
  `pos_balance` decimal(25,4) DEFAULT '0.0000',
  `gc_no` varchar(20) DEFAULT NULL,
  `reference` varchar(50) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1',
  `pos_paid_main` decimal(25,4) DEFAULT '0.0000',
  `pos_paid_exc` decimal(25,4) DEFAULT '0.0000',
  `pos_paid_exc2` decimal(25,4) DEFAULT '0.0000',
  `next_payment` date DEFAULT NULL,
  `alert_payment_day` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_payments`
--

INSERT INTO `tec_payments` (`id`, `date`, `sale_id`, `customer_id`, `transaction_id`, `paid_by`, `cheque_no`, `cc_no`, `cc_holder`, `cc_month`, `cc_year`, `cc_type`, `amount`, `currency`, `created_by`, `attachment`, `note`, `pos_paid`, `pos_balance`, `gc_no`, `reference`, `updated_by`, `updated_at`, `store_id`, `pos_paid_main`, `pos_paid_exc`, `pos_paid_exc2`, `next_payment`, `alert_payment_day`) VALUES
(1, '2022-03-03 05:49:44', 1, 1, NULL, 'cash', '', '', '', '', '', '', '52000.0000', NULL, 1, NULL, '', '52000.0000', '0.0000', '', NULL, NULL, NULL, 1, '52000.0000', '0.0000', '0.0000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tec_printers`
--

CREATE TABLE `tec_printers` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `type` varchar(25) NOT NULL,
  `profile` varchar(25) NOT NULL,
  `char_per_line` tinyint(3) UNSIGNED DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_products`
--

CREATE TABLE `tec_products` (
  `id` int(11) NOT NULL,
  `code` varchar(150) NOT NULL,
  `name` char(255) NOT NULL,
  `second_name` varchar(255) DEFAULT NULL,
  `category_id` int(11) NOT NULL DEFAULT '1',
  `price` decimal(25,4) NOT NULL,
  `price_wholesale` decimal(25,4) NOT NULL,
  `price_vip` decimal(25,4) NOT NULL,
  `image` varchar(255) DEFAULT 'no_image.png',
  `tax` varchar(20) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `tax_method` tinyint(1) DEFAULT '1',
  `quantity` decimal(15,2) DEFAULT '0.00',
  `barcode_symbology` varchar(20) NOT NULL DEFAULT 'code39',
  `type` varchar(20) NOT NULL DEFAULT 'standard',
  `details` text,
  `alert_quantity` decimal(25,4) DEFAULT '0.0000',
  `unit_id` int(11) DEFAULT NULL,
  `alert_expiry` decimal(25,4) DEFAULT '0.0000',
  `expiry_date` date DEFAULT NULL,
  `beverage` tinyint(1) DEFAULT '0',
  `ingredient` tinyint(1) DEFAULT '0',
  `service_month` int(11) DEFAULT '0',
  `alert_service` int(11) DEFAULT '0',
  `promotion` tinyint(4) DEFAULT '0',
  `promo_price` decimal(25,4) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_products`
--

INSERT INTO `tec_products` (`id`, `code`, `name`, `second_name`, `category_id`, `price`, `price_wholesale`, `price_vip`, `image`, `tax`, `cost`, `tax_method`, `quantity`, `barcode_symbology`, `type`, `details`, `alert_quantity`, `unit_id`, `alert_expiry`, `expiry_date`, `beverage`, `ingredient`, `service_month`, `alert_service`, `promotion`, `promo_price`, `start_date`, `end_date`) VALUES
(1, '000001', 'Product 01', '', 1, '10.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 0, '0.00', 'code128', 'standard', '', '0.0000', NULL, NULL, NULL, 0, 0, NULL, NULL, 0, '0.0000', '0000-00-00', '0000-00-00'),
(2, '000002', 'Product 02', '', 1, '3.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 0, '0.00', 'code128', 'standard', '', '0.0000', NULL, NULL, NULL, 0, 0, NULL, NULL, 0, '0.0000', '0000-00-00', '0000-00-00'),
(3, '8809625242909', 'SEE-THROUGH MELTING CHEEK, 03 MELTING LAVENDER', '', 60, '12.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(4, '8809625242893', 'SEE-THROUGH MELTING CHEEK, 02 MELTING LAVENDER', '', 10, '12.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(5, '8809625242886', 'SEE-THROUGH MELTING CHEEK, 01 MELTING LAVENDER', '', 60, '12.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(6, '8809625241704', 'BETTER THAN EYES, 02 DRY ROSE', '', 60, '12.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(7, '8809625240479', 'BETTER THAN EYES, W02 DRY PEACH BLOSSOM', '', 60, '12.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(8, '8809625240462', 'BETTER THAN EYES, 01 DRY MANGO TULIP', '', 60, '12.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(9, '8809625240486', 'BETTER THAN EYES, 03 DRY RAGRAS', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '11.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(10, '8809625243111', 'BETTER THAN PALETTE, 03 ROSEBUD GARDEN', '', 13, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '11.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(11, '8809625240189', 'ZERO VELVET TINT, 03 #PERSIRED', '', 13, '11.2800', '0.0000', '0.0000', 'no_image.png', '0', '5.6400', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(12, '8809625241919', 'ZERO VELVET TINT, 12 #ANNE SHIRLEY', '', 15, '11.2800', '0.0000', '0.0000', 'no_image.png', '0', '5.6400', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(13, '8809625243746', 'ZERO VELVET TINT, #23 VINTAGE TAUPE', '', 58, '11.2800', '0.0000', '0.0000', 'no_image.png', '0', '5.6400', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(14, '8809625240554', 'ZERO VELVET TINT, 10 #FEVER', '', 57, '11.2800', '0.0000', '0.0000', 'no_image.png', '0', '5.6400', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(15, '8809625240493', 'ZERO VELVET TINT, 07 #FIZZ', '', 11, '11.2800', '0.0000', '0.0000', 'no_image.png', '0', '5.6400', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(16, '8809625240547', 'ZERO VELVET TINT, 11 #FLARE', '', 12, '11.2800', '0.0000', '0.0000', 'no_image.png', '0', '5.6400', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(17, '8809625240530', 'ZERO VELVET TINT, 09 #POLAR', '', 13, '11.2800', '0.0000', '0.0000', 'no_image.png', '0', '5.6400', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(18, '8809625240165', 'ZERO VELVET TINT, 01 #MELTING', '', 13, '11.2800', '0.0000', '0.0000', 'no_image.png', '0', '5.6400', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(19, '8809625241568', 'BEST COOL TINT', '', 13, '24.0000', '0.0000', '0.0000', 'no_image.png', '0', '12.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(20, '8809625241575', 'BETTER THAN CHEEK, W01.ODI MILK', '', 13, '11.0000', '0.0000', '0.0000', 'no_image.png', '0', '5.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(21, '8809625243814', 'BETTER THAN EYES mini, M02 DRY BUCKWHEAT FLOWER', '', 13, '9.0000', '0.0000', '0.0000', 'no_image.png', '0', '4.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(22, '8809625243845', 'JUICY LSTING TINT mini, 12 CHERRY BOMB', '', 13, '7.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(23, '8809625243838', 'JUICY LSTING TINT mini, 07 JUJUBE', '', 13, '7.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(24, '8809625243821', 'JUICY LSTING TINT mini, 06 FIGFIG', '', 10, '7.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(25, '8809625243852', 'JUICY LSTING TINT mini, 13 EAT DOTORI', '', 10, '7.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(26, '8809625243869', 'JUICY LSTING TINT mini, 20 DARK COCONUT', '', 10, '7.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(27, '8809625242060', 'ZERO MATTE LIPSTICK, 01 DUSTY PINK', '', 10, '10.6000', '0.0000', '0.0000', 'no_image.png', '0', '5.3000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(28, '8809625242077', 'ZERO MATTE LIPSTICK, 02 ALL THAT JAZZ', '', 10, '10.6000', '0.0000', '0.0000', 'no_image.png', '0', '5.3000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(29, '8809625242084', 'ZERO MATTE LIPSTICK, 03 SILHOUETTE', '', 12, '10.6000', '0.0000', '0.0000', 'no_image.png', '0', '5.3000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(30, '8809625242091', 'ZERO MATTE LIPSTICK, 04 BEFORE SUNSET', '', 44, '10.6000', '0.0000', '0.0000', 'no_image.png', '0', '5.3000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(31, '8809625242114', 'ZERO MATTE LIPSTICK, 06 AWESOME', '', 13, '10.6000', '0.0000', '0.0000', 'no_image.png', '0', '5.3000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(32, '8809625242121', 'ZERO MATTE LIPSTICK, 07 ENVY ME', '', 59, '10.6000', '0.0000', '0.0000', 'no_image.png', '0', '5.3000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(33, '8809625242138', 'ZERO MATTE LIPSTICK, 08 ADORABLE', '', 13, '10.6000', '0.0000', '0.0000', 'no_image.png', '0', '5.3000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(34, '8809625242152', 'ZERO MATTE LIPSTICK, 10 PINK SAND', '', 13, '10.6000', '0.0000', '0.0000', 'no_image.png', '0', '5.3000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(35, '8809625242169', 'ZERO MATTE, 11 SUNLIGHT', '', 13, '10.6000', '0.0000', '0.0000', 'no_image.png', '0', '5.3000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(36, '8809625242176', 'ZERO MATTE LIPSTICK, 12 SOMETHING', '', 13, '10.6000', '0.0000', '0.0000', 'no_image.png', '0', '5.3000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(37, '8809625242220', 'ZERO MATTE, 17 RED HEAT', '', 13, '10.6000', '0.0000', '0.0000', 'no_image.png', '0', '5.3000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(38, '8809625242237', 'ZERO MATTE LIPSTICK, 18 TANNING RED', '', 13, '10.6000', '0.0000', '0.0000', 'no_image.png', '0', '5.3000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(39, '8809625242244', 'ZERO MATTE, 19 RED SURFER', '', 13, '10.6000', '0.0000', '0.0000', 'no_image.png', '0', '5.3000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(40, '8809625240837', 'SEE-THROUGH MATTE TINT, #01 PINK FOLD', '', 13, '11.2800', '0.0000', '0.0000', 'no_image.png', '0', '5.6400', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(41, '8809625240875', 'SEE-THROUGH MATTE TINT, #05 BRICK COVER', '', 13, '11.2800', '0.0000', '0.0000', 'no_image.png', '0', '5.6400', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(42, '8809625240851', 'SEE-THROUGH MATTE TINT, #03 THROUGH CORAL', '', 13, '11.2800', '0.0000', '0.0000', 'no_image.png', '0', '5.6400', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(43, '8809625240882', 'SEE-THROUGH MATTE TINT, #06 BURN WRAP', '', 13, '11.2800', '0.0000', '0.0000', 'no_image.png', '0', '5.6400', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(44, '8809625240844', 'SEE-THROUGH MATTE TINT, #02 RIP PLUM', '', 13, '11.2800', '0.0000', '0.0000', 'no_image.png', '0', '5.6400', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(45, '8809625241667', 'MILK TEA VELVET TINT, #02 CHOCOLATE', '', 13, '11.2800', '0.0000', '0.0000', 'no_image.png', '0', '5.6400', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(46, '8809625241674', 'MILK TEA VELVET TINT, #03 CINNAMON TEA', '', 13, '11.2800', '0.0000', '0.0000', 'no_image.png', '0', '5.6400', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(47, '8809625240288', 'JUICY LASTING TINT, 07 #JUJUBE', '', 13, '11.2800', '0.0000', '0.0000', 'no_image.png', '0', '5.6400', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(48, '8809625243708', 'JUICY LASTING TINT, #23 NUCADAMIA', '', 13, '13.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(49, '8809625243692', 'JUICY LASTING TINT, #22 POMELO SKIN', '', 13, '13.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(50, '8809625243715', 'JUICY LASTING TINT, #24 PEELING ANGDO', '', 13, '13.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(51, '8809625243722', 'JUICY LASTING TINT, #25 BARE GRAPE', '', 13, '13.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(52, '8809625244194', 'dewy.ful, 06 thulian', '', 13, '13.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(53, '8809625244187', 'dewy.ful, 05 taffy', '', 13, '13.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(54, '8809625241605', 'GLASTING WATER TINT, #07 PINK VALLEY', '', 13, '11.2800', '0.0000', '0.0000', 'no_image.png', '0', '5.6400', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(55, '8809625241346', 'GLASTING WATER TINT, #03 BRICK RIVER', '', 13, '11.2800', '0.0000', '0.0000', 'no_image.png', '0', '5.6400', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(56, '8809691971116', 'PERIPERA ALL MOOD PALETTE, 02 LALA CORALMINGO', '', 13, '20.0000', '0.0000', '0.0000', 'no_image.png', '0', '12.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(57, '8809691974926', 'PERIPERA ALL MOOD PALETTE, 03 BURNT BREEZE', '', 13, '20.0000', '0.0000', '0.0000', 'no_image.png', '0', '12.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(58, '8809751119755', 'PERIPERA ALL MOOD PALETTE, 07 NUDE FLEXXXXX', '', 13, '20.0000', '0.0000', '0.0000', 'no_image.png', '0', '12.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(59, '8809598290280', 'PERIPERA OIL CAPTURE PACT', '', 13, '13.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(60, '8809691979952', 'PERIPERA INK POCKET SHADOW PALETTE, 06 WELCOMING WOODY HOME', '', 13, '15.0000', '0.0000', '0.0000', 'no_image.png', '0', '7.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(61, '8809691979945', 'PERIPERA INK POCKET SHADOW PALETTE, 05 TOUCHING TARO STARS', '', 13, '15.0000', '0.0000', '0.0000', 'no_image.png', '0', '7.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(62, '8809644499728', 'PERIPERA INK POCKET SHADOW PALETTE, 03 BROWN FILTER 360', '', 13, '15.0000', '0.0000', '0.0000', 'no_image.png', '0', '7.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(63, '8809751117287', 'PERIPERA PURE BLUSHED SUNSHINE CHEEK, 07MILKY PEACH', '', 13, '9.0000', '0.0000', '0.0000', 'no_image.png', '0', '4.2400', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(64, '8809751117294', 'PERIPERA PURE BLUSHED SUNSHINE CHEEK, 08 COTTON NUDE', '', 13, '9.0000', '0.0000', '0.0000', 'no_image.png', '0', '4.2400', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(65, '8809691973752', 'PERIPERA PURE BLUSHED SUNSHINE CHEEK, 02 MILKTEA CORAL', '', 13, '9.0000', '0.0000', '0.0000', 'no_image.png', '0', '4.2400', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(66, '8809691973769', 'PERIPERA PURE BLUSHED SUNSHINE CHEEK, 03 AFTERNOON RED', '', 13, '9.0000', '0.0000', '0.0000', 'no_image.png', '0', '4.2400', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(67, '8809691973745', 'PERIPERA PURE BLUSHED SUNSHINE CHEEK, 01 CALM PINK', '', 13, '9.0000', '0.0000', '0.0000', 'no_image.png', '0', '4.2400', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(68, '8809751117270', 'PERIPERA PURE BLUSHED SUNSHINE CHEEK, 06 MORNING BLUSH', '', 13, '9.0000', '0.0000', '0.0000', 'no_image.png', '0', '4.2400', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(69, '8809691973776', 'PERIPERA PURE BLUSHED SUNSHINE CHEEK, 04 HAZEL ORANGE', '', 13, '9.0000', '0.0000', '0.0000', 'no_image.png', '0', '4.2400', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(70, '8809691973783', 'PERIPERA PURE BLUSHED SUNSHINE CHEEK, 05 DUSKY ROSE', '', 13, '9.0000', '0.0000', '0.0000', 'no_image.png', '0', '4.2400', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(71, '8809691972830', 'PERIPERA INK V HIGHLIGHTER, 01', '', 13, '15.0000', '0.0000', '0.0000', 'no_image.png', '0', '7.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(72, '8809644496277', 'PERIPERA INK V SHADING, 01', '', 13, '15.0000', '0.0000', '0.0000', 'no_image.png', '0', '7.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(73, '8809644496284', 'PERIPERA INK V SHADING, 02', '', 13, '15.0000', '0.0000', '0.0000', 'no_image.png', '0', '7.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(74, '8809644499667', 'PERIPERA INK V SHADING, 03', '', 13, '15.0000', '0.0000', '0.0000', 'no_image.png', '0', '7.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(75, '8809751118758', 'PERIPERA INK MOOD MATTE TINT, 01 PEACH PUREE', '', 13, '11.0000', '0.0000', '0.0000', 'no_image.png', '0', '5.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(76, '8809751118765', 'PERIPERA INK MOOD MATTE TINT, 02 BALLET PINK', '', 13, '11.0000', '0.0000', '0.0000', 'no_image.png', '0', '5.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(77, '8809751118772', 'PERIPERA INK MOOD MATTE TINT, 03 OATMEAL ROSE', '', 13, '11.0000', '0.0000', '0.0000', 'no_image.png', '0', '5.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(78, '8809751118789', 'PERIPERA INK MOOD MATTE TINT, 04 SOFT CEDARWOOD', '', 13, '11.0000', '0.0000', '0.0000', 'no_image.png', '0', '5.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(79, '8809751118796', 'PERIPERA INK MOOD MATTE TINT, 05 GINGER RED', '', 13, '11.0000', '0.0000', '0.0000', 'no_image.png', '0', '5.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(80, '8809786594183', 'PERIPERA INK MOOD MATTE TINT, 06 PINK DIVE', '', 13, '11.0000', '0.0000', '0.0000', 'no_image.png', '0', '5.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(81, '8809786594190', 'PERIPERA INK MOOD MATTE TINT, 07 JUICY RED', '', 13, '11.0000', '0.0000', '0.0000', 'no_image.png', '0', '5.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(82, '8809786594206', 'PERIPERA INK MOOD MATTE TINT, 08 SMOKY CORAL', '', 13, '11.0000', '0.0000', '0.0000', 'no_image.png', '0', '5.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(83, '8809691973325', 'PERIPERA INK AIRY VELVET STICK, 13 WOODY PEACH', '', 13, '13.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(84, '8809691975343', 'PERIPERA INK STICK SERUM, 04 NEUTRAL CORAL', '', 60, '13.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(85, '8809786594299', 'INK MOOD MATTE STICK, O2 PINK GO UP', '', 60, '13.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(86, '8809786594336', 'INK MOOD MATTE STICK, O6 MAUVE-HOLIC', '', 60, '13.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(87, '8809691975947', 'PERIPERA DOUBLE LONGWEAR COVER FOUNDATION, 02 NATURAL BEIGE', '', 60, '16.0000', '0.0000', '0.0000', 'no_image.png', '0', '10.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(88, '8809153107589', 'SKIN FOOD, Choco Eyebrow Powder Cake', '', 60, '6.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(89, '8809464341979', 'BLACKROUGE, POWER PROOF PEN LINER', '', 60, '16.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(90, '8809432011156', 'MONY, WATERPROOF PEN EYELINER, 01 DEEP BLACK', '', 60, '8.8000', '0.0000', '0.0000', 'no_image.png', '0', '4.4000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(91, '8809691971840', 'PERIPERA DOUBLE LONGWEAR COVER CONCEALER, 01 PURE IVORY', '', 60, '10.0000', '0.0000', '0.0000', 'no_image.png', '0', '5.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(92, '8809691971857', 'PERIPERA DOUBLE LONGWEAR COVER CONCEALER, 02 NATURAL BEIGE', '', 60, '10.0000', '0.0000', '0.0000', 'no_image.png', '0', '5.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(93, '8809691971864', 'PERIPERA DOUBLE LONGWEAR COVER CONCEALER, 03 CLASSIC SAND', '', 60, '10.0000', '0.0000', '0.0000', 'no_image.png', '0', '5.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(94, '8809644492064', 'PERIPERA INK BLACK CARA, 02 VOLUME CURLING', '', 60, '15.0000', '0.0000', '0.0000', 'no_image.png', '0', '10.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(95, '8809644492057', 'PERIPERA INK BLACK CARA, 01 LONG LASH CURLING', '', 60, '15.0000', '0.0000', '0.0000', 'no_image.png', '0', '10.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(96, '8809581445796', '4D MASCARA', '', 60, '10.0000', '0.0000', '0.0000', 'no_image.png', '0', '4.4000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(97, '8809644491234', 'PERIPERA INK AIRY VELVET, 03 CARTOON CORAL', '', 60, '11.0000', '0.0000', '0.0000', 'no_image.png', '0', '5.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(98, '8809751113999', 'PERIPERA INK AIRY VELVET, 16 FAVORITE ORANGE PINK', '', 60, '11.0000', '0.0000', '0.0000', 'no_image.png', '0', '5.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(99, '8809644495072', 'PERIPERA INK VELVET, 05 CORALFICIAL', '', 60, '11.0000', '0.0000', '0.0000', 'no_image.png', '0', '5.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(100, '8809644495065', 'PERIPERA INK VELVET, 04 VITAITY CORAL', '', 60, '11.0000', '0.0000', '0.0000', 'no_image.png', '0', '5.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(101, '8809644495096', 'PERIPERA INK VELVET, 07 GIRLISH RED', '', 60, '11.0000', '0.0000', '0.0000', 'no_image.png', '0', '5.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(102, '8809644495102', 'PERIPERA INK VELVET, 08 SELLOUT RED', '', 60, '11.0000', '0.0000', '0.0000', 'no_image.png', '0', '5.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(103, '8809691972052', 'PERIPERA INK VELVET, 14 INKRUSH ORANGE', '', 60, '11.0000', '0.0000', '0.0000', 'no_image.png', '0', '5.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(104, '8809691972076', 'PERIPERA INK VELVET, 16 HEART FUCHSIA PINK', '', 60, '11.0000', '0.0000', '0.0000', 'no_image.png', '0', '5.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(105, '8809751116235', 'PERIPERA INK VELVET, 17 ROSY NUDE', '', 60, '11.0000', '0.0000', '0.0000', 'no_image.png', '0', '5.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(106, '8809751118710', 'PERIPERA INK VELVET, 18 STAR PLUM PINK', '', 60, '11.0000', '0.0000', '0.0000', 'no_image.png', '0', '5.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(107, '8809751118727', 'PERIPERA INK VELVET, 19 LOVE SNIPER RED', '', 60, '11.0000', '0.0000', '0.0000', 'no_image.png', '0', '5.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(108, '8809786597092', 'PERIPERA INK VELVET, 20 CLASSY PLUM ROSE', '', 60, '11.0000', '0.0000', '0.0000', 'no_image.png', '0', '5.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(109, '8809786597108', 'PERIPERA INK VELVET, 21 VITALITY CORAL RED', '', 60, '11.0000', '0.0000', '0.0000', 'no_image.png', '0', '5.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(110, '8809644495058', 'PERIPERA INK VELVET, 03 RED ONLY', '', 60, '11.0000', '0.0000', '0.0000', 'no_image.png', '0', '5.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(111, '8809644495034', 'PERIPERA INK VELVET, 01 GOOD BRICK', '', 60, '11.0000', '0.0000', '0.0000', 'no_image.png', '0', '5.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(112, '8809644492811', 'PERIPERA INK AIRY VELVET, 06 SOLD OUT RED', '', 60, '11.0000', '0.0000', '0.0000', 'no_image.png', '0', '5.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(113, '8809644492828', 'PERIPERA INK AIRY VELVET, 08 PRETTY ORANGE PINK', '', 60, '11.0000', '0.0000', '0.0000', 'no_image.png', '0', '5.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(114, '8809691970065', 'PERIPERA INK AIRY VELVET, 12 MORNING GRAPEFRUIT', '', 60, '11.0000', '0.0000', '0.0000', 'no_image.png', '0', '5.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(115, '8809437396807', '3CE MINI MULTI EYE COLOR PALETTE, OVER TAKE', '', 60, '38.0000', '0.0000', '0.0000', 'no_image.png', '0', '25.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(116, '8809664982927', '3CE MINI MULTI EYE COLOR PALETTE, CASUAL TALK', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '14.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(117, '8809664982934', '3CE MINI MULTI EYE COLOR PALETTE, SECOND PAIR', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '14.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(118, '8809664980886', '3CE MINI MULTI EYE COLOR PALETTE, ALMOND FUDGE', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '15.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(119, '8809664980947', '3CE MINI MULTI EYE COLOR PALETTE, DIAMOND GLINT', '', 60, '24.0000', '0.0000', '0.0000', 'no_image.png', '0', '15.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(120, '8809664981722', '3CE MINI MULTI EYE COLOR PALETTE, SIDE BY SIDE', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '13.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(121, '8809664981715', '3CE MINI MULTI EYE COLOR PALETTE, ALMOND FUDGE (DISNEY)', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '13.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(122, '8809664982866', '3CE MINI MULTI EYE COLOR PALETTE, OVER AND OUT (DISNEY)', '', 60, '30.0000', '0.0000', '0.0000', 'no_image.png', '0', '17.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(123, '8809664982873', '3CE BLURRING BLUSH, INSIDE FIREND (DISNEY)', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '11.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(124, '8809664981982', '3CE BLURRING BLUSH, MUCH BETTER (DISNEY)', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '11.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(125, '8809664981975', '3CE BLURRING BLUSH, EASY BREEZY (DISNEY)', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '11.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(126, '8809664982217', '3CE MINI MULTI EYE COLOR PALETTE, DELIGHTFUL', '', 60, '40.0000', '0.0000', '0.0000', 'no_image.png', '0', '28.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(127, '8809664983351', '3CE MINI MULTI EYE COLOR PALETTE, SOME DEF', '', 60, '40.0000', '0.0000', '0.0000', 'no_image.png', '0', '28.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(128, '8809392620078', '3CE BACK TO BABY BB CREAM', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '12.3000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(129, '8809437398092', '3CE BLURRING BLUSH, PINK', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '12.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(130, '8809664980190', '3CE STYLENANDA, #RIGHT AROUND', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '11.2600', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(131, '8809664981661', '3CE VELVET FIT FOUNDATION, PURE IVORY', '', 60, '36.0000', '0.0000', '0.0000', 'no_image.png', '0', '23.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(132, '8809664981654', '3CE VELVET FIT FOUNDATION, WARM IVORY', '', 60, '36.0000', '0.0000', '0.0000', 'no_image.png', '0', '23.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(133, '8809437399662', '3CE MINI MULTI EYE COLOR PALETTE, BEACH MUSE', '', 60, '38.0000', '0.0000', '0.0000', 'no_image.png', '0', '25.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(134, '8809664981289', '3CE VELVET LIQUID BLUSHER BLUSHER, SO ALIVE', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '11.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(135, '8809437395152', '3CE BLUSH CUSHION, PEACH', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '11.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(136, '8809437395176', '3CE BLUSH CUSHION, MANDARINE', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '11.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(137, '8809437395183', '3CE BLUSH CUSHION, GIRLISH RED', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '11.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(138, '8809664982798', '3CE LIQUID PRIMER EYE SHADOW, ROLLING DAYS', '', 60, '16.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(139, '8809664982828', '3CE LIQUID PRIMER EYE SHADOW, CERTAINTY', '', 60, '16.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(140, '8809664982842', '3CE LIQUID PRIMER EYE SHADOW, BETTER TIMING', '', 60, '16.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(141, '8809437398153', '3CE MULTI POT, DIOTIMA', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '11.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(142, '8809437398429', '3CE STYLENANDA #ALL-NIGHTER', '', 60, '38.0000', '0.0000', '0.0000', 'no_image.png', '0', '25.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(143, '8809664984204', '3CE EYE POINT BRUSH', '', 60, '15.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(144, '8809664983481', '3CE BLUR WATER TINT, PLAY OFF', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(145, '8809664983467', '3CE BLUR WATER TINT, PINK GUAVA', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(146, '8809664983450', '3CE BLUR WATER TINT, CORAL MOON', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(147, '8809664983504', '3CE BLUR WATER TINT, BREEZE WAY', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(148, '8809664982750', '3CE BLURRING LIQUID LIP, NUDE SCENE', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(149, '8809664982682', '3CE BLURRING LIQUID LIP, PULL OFF', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(150, '8809664982743', '3CE BLURRING LIQUID LIP, DELICATE SOUL', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(151, '8809664981302', '3CE VELVET LIQUID BLUSHER BLUSHER, VIENNA ROSE', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '11.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(152, '8809664982347', '3CE SOFT MATTE LIPSTICK, #GIVING PLEASURE', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '13.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(153, '8809664983344', '3CE EYE SHADOW, BUTTER CREAM', '', 60, '38.0000', '0.0000', '0.0000', 'no_image.png', '0', '25.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(154, '8809664983405', '3CE SOFT MATTE LIPSTICK, #HAZY ROSE', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '12.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(155, '8809664983368', '3CE SOFT MATTE LIPSTICK, #WARMISH MOVE', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '12.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(156, '8809664980701', '3CE SOFT LIP LACQUER, #IMPOSING', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(157, '8809437398344', '3CE STYLENANDA DUAL BLEND BLUSHER, #ALLURING SCENE', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '12.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(158, '8809664982262', '3CE STYLENANDA #LAST TIME', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '12.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(159, '8809437398818', '3CE STYLENANDA, #STROBING SKIN PLATTE', '', 60, '36.0000', '0.0000', '0.0000', 'no_image.png', '0', '23.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(160, '8809664981098', '3CE LIP COLOR, #230 KYTALY', '', 60, '20.0000', '0.0000', '0.0000', 'no_image.png', '0', '12.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(161, '8809664981807', '3CE LIP COLOR, #233 BEST PART (DISNEY)', '', 60, '20.0000', '0.0000', '0.0000', 'no_image.png', '0', '13.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(162, '8809664981081', '3CE LIP COLOR, #229 TANGERINE', '', 60, '20.0000', '0.0000', '0.0000', 'no_image.png', '0', '12.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(163, '8809437397095', '3CE HEART POT LIP, #MAROON BEIGE', '', 60, '8.0000', '0.0000', '0.0000', 'no_image.png', '0', '4.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(164, '8809437391697', '3CE KABUKI, CHEEK BRUSH', '', 60, '8.0000', '0.0000', '0.0000', 'no_image.png', '0', '4.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(165, '8809437397026', '3CE EASY PEN EYE LINER, BLACK', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '11.9500', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(166, '8809292447386', '3CE FIXER & MASCARA, BLACK', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '13.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(167, '8809664983474', '3CE BLUR WATER TINT, SPOT PLAYER', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(168, '8809664983498', '3CE BLUR WATER TINT, DOUBLE WIND', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(169, '8809664983443', '3CE BLUR WATER TINT, CASUAL AFFAIR', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(170, '8809664983429', '3CE BLUR WATER TINT, LAYDOWN', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(171, '8809664980107', '3CE SMOOTHING LIP TINT, DOLLYFIED', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(172, '8809437396647', '3CE VELVET LIP TINT, NEAR AND DEAR', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(173, '8809437396623', '3CE VELVET LIP TINT, GOING RIGHT', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(174, '8809437396616', '3CE VELVET LIP TINT, DAFFODIL', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(175, '8809437396630', '3CE VELVET LIP TINT, PRIVATE', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(176, '8809437396593', '3CE VELVET LIP TINT, CHILDLIKE', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(177, '8809437396654', '3CE VELVET LIP TINT, NEW NUDE', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(178, '8809437396685', '3CE VELVET LIP TINT, BEST EVER', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(179, '8809437396678', '3CE VELVET LIP TINT, TAUPE', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(180, '8809559348173', 'HERA, BLACK CUSHION 21 VANILLA', '', 60, '14.0000', '0.0000', '0.0000', 'no_image.png', '0', '7.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(181, '8809685796350', 'LANEIGE NEO CUSHION MATTE, SPF 42 PA++', '', 60, '25.0000', '0.0000', '0.0000', 'no_image.png', '0', '17.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(182, '8809636441032', 'MOONSHOT MICRO SETTINGFIT CUSHION, SPF50+, PA++', '', 60, '20.0000', '0.0000', '0.0000', 'no_image.png', '0', '13.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(183, '8809652888415', 'INNISFREE LIGHT COTTON COVER PACT, SPF30 PA++', '', 60, '15.0000', '0.0000', '0.0000', 'no_image.png', '0', '10.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(184, '8809636440738', 'MOONSHOT MICRO GLASSYFIT CUSHION, SPF50+, PA++++', '', 60, '14.0000', '0.0000', '0.0000', 'no_image.png', '0', '7.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(185, '8809707256183', 'INNISFREE DEWY TINT LIP BALM, 2 MELON CORAL', '', 60, '15.0000', '0.0000', '0.0000', 'no_image.png', '0', '7.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(186, '8809707256176', 'INNISFREE DEWY TINT LIP BALM, 1 BABY PINK', '', 60, '15.0000', '0.0000', '0.0000', 'no_image.png', '0', '7.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(187, '8809707253724', 'INNISFREE NO-SEBUM POWDER CUSHION 21N VANILLA SPF 35 PA++', '', 60, '26.0000', '0.0000', '0.0000', 'no_image.png', '0', '13.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(188, '8809707253717', 'INNISFREE NO-SEBUM POWDER CUSHION 23N GINGER SPF 35 PA++', '', 60, '26.0000', '0.0000', '0.0000', 'no_image.png', '0', '13.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(189, '8809652896106', 'INNISFREE AUTO EYEBROW PENCIL, 5 DEEP BALM EXSPRESSO BROWN', '', 60, '5.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.4000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(190, '8809652896113', 'INNISFREE AUTO EYEBROW PENCIL, 6 URBAN BROWN BEFORE DAWN', '', 60, '5.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.4000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(191, '8809652894782', 'INNISFREE AUTO EYEBROW PENCIL, 3 DREAMING DAWN GRAY', '', 60, '5.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.4000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(192, '8809652894768', 'INNISFREE AUTO EYEBROW PENCIL, 1 ROSE BROWN DREAMING AT SUNSET', '', 60, '5.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.4000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(193, '8806199416248', 'INNISFREE AUTO EYEBROW PENCIL, 07 LIGHT BROWN', '', 60, '5.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.4000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(194, '8809652894799', 'INNISFREE AUTO EYEBROW PENCIL, 4 DAWN DEW ASH BROWN', '', 60, '5.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.4000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(195, '8806199416217', 'INNISFREE AUTO EYEBROW PENCIL, 04 DARK GRAY', '', 60, '5.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.4000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(196, '8809563957132', 'ESPOIR COUTURE LIP TINT SHINE, BR901 NUTTY', '', 60, '20.0000', '0.0000', '0.0000', 'no_image.png', '0', '10.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(197, '8809563957149', 'ESPOIR COUTURE LIP TINT SHINE, BR901 BUTTER NUT', '', 60, '20.0000', '0.0000', '0.0000', 'no_image.png', '0', '10.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(198, '8809563957156', 'ESPOIR COUTURE LIP TINT SHINE, PP701 CALM IN MAUVE', '', 60, '20.0000', '0.0000', '0.0000', 'no_image.png', '0', '10.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(199, '8809563955510', 'ESPOIR NOWEAR GLOW LIP BALM, OR401 CORAL DEW', '', 60, '20.0000', '0.0000', '0.0000', 'no_image.png', '0', '10.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(200, '8809563957408', 'ESPOIR COUTURE LIP TINT SHINE, WN601 VAMPY', '', 60, '20.0000', '0.0000', '0.0000', 'no_image.png', '0', '10.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(201, '8809563954957', 'ESPOIR BE POWDER (SET BOX) 22', '', 60, '30.0000', '0.0000', '0.0000', 'no_image.png', '0', '15.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(202, '8809563954964', 'ESPOIR BE POWDER (SET BOX) 21', '', 60, '30.0000', '0.0000', '0.0000', 'no_image.png', '0', '15.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(203, '8809668014013', 'ETUDE ALMOND CHOCOLATE', '', 60, '26.0000', '0.0000', '0.0000', 'no_image.png', '0', '13.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(204, '8809668014037', 'ETUDE MILK CHOCOLATE', '', 60, '26.0000', '0.0000', '0.0000', 'no_image.png', '0', '13.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(205, '8809563955503', 'ESPOIR NOWEAR GLOW LIP BALM, PK001 SHELL PINK', '', 60, '20.0000', '0.0000', '0.0000', 'no_image.png', '0', '10.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(206, '8809563956968', 'ESPOIR LOOKBOOK PALETTE, CHANGE MOONLIGHT', '', 60, '25.0000', '0.0000', '0.0000', 'no_image.png', '0', '15.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(207, '8809563956159', 'ESPOIR LOOKBOOK PALETTE, PILLOW PEACH', '', 60, '25.0000', '0.0000', '0.0000', 'no_image.png', '0', '15.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(208, '8809668017502', 'ETUDE FIXING TINT, 02 VINTAGE RED', '', 60, '13.7500', '0.0000', '0.0000', 'no_image.png', '0', '6.6600', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(209, '8809668017526', 'ETUDE FIXING TINT, 04 GINGER MILK TEA', '', 60, '13.7500', '0.0000', '0.0000', 'no_image.png', '0', '6.6600', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `tec_products` (`id`, `code`, `name`, `second_name`, `category_id`, `price`, `price_wholesale`, `price_vip`, `image`, `tax`, `cost`, `tax_method`, `quantity`, `barcode_symbology`, `type`, `details`, `alert_quantity`, `unit_id`, `alert_expiry`, `expiry_date`, `beverage`, `ingredient`, `service_month`, `alert_service`, `promotion`, `promo_price`, `start_date`, `end_date`) VALUES
(210, '8809668017397', 'ETUDE FIXING TINT, 01 ANALONG ROSE', '', 60, '13.7500', '0.0000', '0.0000', 'no_image.png', '0', '6.6600', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(211, '8809668017519', 'ETUDE FIXING TINT, 03 MELLOW PEACH', '', 60, '13.7500', '0.0000', '0.0000', 'no_image.png', '0', '6.6600', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(212, '8806165933724', 'ETUDE HOUSE, DR.MASCARA FIXER, PERFECT LASH', '', 60, '7.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(213, '8806165938903', 'ETUDE HOUSE, DR.MASCARA FIXER, SUPER LONGLASH', '', 60, '7.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(214, '8809667985314', 'ETUDE HOUSE, DEAR DARLING WATER TINT, 03 ORANGE AID', '', 60, '7.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(215, '8809667985253', 'ETUDE HOUSE, DEAR DARLING WATER TINT, RD306 SHARK RED', '', 60, '7.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(216, '8809668017533', 'ETUDE FIXING TINT, 05 MIDNIGHT MAUVE', '', 60, '13.7500', '0.0000', '0.0000', 'no_image.png', '0', '6.6600', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(217, '8809668027181', 'ETUDE FIXING TINT, 07 CRANBERRY PLUM', '', 60, '13.7500', '0.0000', '0.0000', 'no_image.png', '0', '6.6600', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(218, '8809668027174', 'ETUDE FIXING TINT, 06 SOFT WALNUT', '', 60, '13.7500', '0.0000', '0.0000', 'no_image.png', '0', '6.6600', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(219, '8858910625798', 'ODBO THREE LIVELY BLUSHES, 02', '', 60, '7.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(220, '8858910625804', 'ODBO THREE LIVELY BLUSHES, 03', '', 60, '7.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(221, '8858910625941', 'ODBO THREE LIVELY BLUSHES, 04', '', 60, '7.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(222, '8858910622308', 'ODBO SAND BEACH (YELLOW)', '', 60, '8.0000', '0.0000', '0.0000', 'no_image.png', '0', '4.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(223, '8858910622315', 'ODBO SAND BEACH (PINK)', '', 60, '8.0000', '0.0000', '0.0000', 'no_image.png', '0', '4.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(224, '8858994476385', 'SIVANNA COLOR, TWINS LONG-STAY MATTE LIP MUD No.1', '', 60, '8.0000', '0.0000', '0.0000', 'no_image.png', '0', '4.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(225, '8858994476408', 'SIVANNA COLOR, TWINS LONG-STAY MATTE LIP MUD No.3', '', 60, '8.0000', '0.0000', '0.0000', 'no_image.png', '0', '4.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(226, '8858994476392', 'SIVANNA COLOR, TWINS LONG-STAY MATTE LIP MUD No.2', '', 60, '8.0000', '0.0000', '0.0000', 'no_image.png', '0', '4.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(227, '8858994476415', 'SIVANNA COLOR, TWINS LONG-STAY MATTE LIP MUD No.4', '', 60, '8.0000', '0.0000', '0.0000', 'no_image.png', '0', '4.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(228, '8858994481587', 'SIVANNA COLOR, PRETTY MAKEUP KITS No.03', '', 60, '7.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(229, '8858994481563', 'SIVANNA COLOR, PRETTY MAKEUP KITS No.01', '', 60, '7.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(230, '8858994481570', 'SIVANNA COLOR, PRETTY MAKEUP KITS No.02', '', 60, '7.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(231, '8858994441956', 'SIVANNA COLOR, MOON & STAR FACE PALETTE No.01', '', 60, '7.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(232, '8858994441970', 'SIVANNA COLOR, MOON & STAR FACE PALETTE No.03', '', 60, '7.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(233, '8858994453324', 'SIVANNA RAINBOW BLUSH 01', '', 60, '7.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(234, '8858994453348', 'SIVANNA RAINBOW BLUSH 03', '', 60, '7.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(235, '8858994453362', 'SIVANNA RAINBOW BLUSH 05', '', 60, '7.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(236, '6902395682820', 'MAYBELLINE SUPER STAY MATTE INK, 75 FIGHTER', '', 60, '12.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.6600', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(237, '6902395808879', 'MAYBELLINE SUPER STAY MATTE INK, 370 OVERSEER', '', 60, '12.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.6600', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(238, '6902395800569', 'MAYBELLINE SUPER STAY MATTE INK, 350 FREETHINKER', '', 60, '12.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.6600', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(239, '6902395800576', 'MAYBELLINE SUPER STAY MATTE INK, 355 SHAKER', '', 60, '12.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.6600', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(240, '6902395706366', 'MAYBELLINE SUPER STAY MATTE INK, 135 GLOBETROTTER', '', 60, '12.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.6600', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(241, '6902395706663', 'MAYBELLINE SUPER STAY MATTE INK, 205 ASSERTIVE', '', 60, '12.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.6600', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(242, '41554496932', 'MAYBELLINE SUPER STAY MATTE INK, 25 HEROINE', '', 60, '12.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.6600', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(243, '6902395788812', 'MAYBELLINE SUPER STAY MATTE INK, 315 EXTRAORDDINARY', '', 60, '12.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.6600', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(244, '8858994402780', 'SIVANNA COLOR, EVOLUTION WONDER STICK No.02', '', 60, '5.0000', '0.0000', '0.0000', 'no_image.png', '0', '2.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(245, '8858994402797', 'SIVANNA COLOR, EVOLUTION WONDER STICK No.03', '', 60, '5.0000', '0.0000', '0.0000', 'no_image.png', '0', '2.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(246, '8858910610138', 'ODBO CC MATTE POWDER CUSHION OIL CONTROL, No.21', '', 60, '12.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(247, '8858910610145', 'ODBO CC MATTE POWDER CUSHION OIL CONTROL, No.23', '', 60, '12.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(248, '8858994402582', 'SIVANNA COLOR SUPER COVER, ULTRA MOISTURE CUSHION', '', 60, '11.0000', '0.0000', '0.0000', 'no_image.png', '0', '5.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(249, '8858842088586', 'BABY BRIGHT, LIP & CHECK MATTE TINT #21 LIVING CORAL', '', 60, '5.0000', '0.0000', '0.0000', 'no_image.png', '0', '2.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(250, '8858842088593', 'BABY BRIGHT, LIP & CHECK MATTE TINT #22 CANTALOUPE', '', 60, '5.0000', '0.0000', '0.0000', 'no_image.png', '0', '2.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(251, '8858842088623', 'BABY BRIGHT, LIP & CHECK MATTE TINT #25 MLBB BROWN', '', 60, '5.0000', '0.0000', '0.0000', 'no_image.png', '0', '2.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(252, '8858842088630', 'BABY BRIGHT, LIP & CHECK MATTE TINT #26 APRICOT', '', 60, '5.0000', '0.0000', '0.0000', 'no_image.png', '0', '2.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(253, '8858842088647', 'BABY BRIGHT, LIP & CHECK MATTE TINT #27 BABY CARROT', '', 60, '5.0000', '0.0000', '0.0000', 'no_image.png', '0', '2.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(254, '8858842088654', 'BABY BRIGHT, LIP & CHECK MATTE TINT #28 PUMPKIN', '', 60, '5.0000', '0.0000', '0.0000', 'no_image.png', '0', '2.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(255, '8858842088678', 'BABY BRIGHT, LIP & CHECK MATTE TINT #30 RED PEPPER', '', 60, '5.0000', '0.0000', '0.0000', 'no_image.png', '0', '2.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(256, '8858994417791', 'SIVANNA COLOR MULTI EFFECT PEACHY EYEBROW & BROW MASCARA No.01', '', 60, '6.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(257, '8858994430073', 'SIVANNA COLOR TWO-STEP MASCARA', '', 60, '6.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(258, '8858842086957', 'CATHY DOLL MINI LIP & CHEEK NUDE MATTE TINT, #08 BROWNIE RED', '', 60, '6.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(259, '8858842086940', 'CATHY DOLL MINI LIP & CHEEK NUDE MATTE TINT, #07 BRIGHT BRICK', '', 60, '6.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(260, '8858842086933', 'CATHY DOLL MINI LIP & CHEEK NUDE MATTE TINT, #06 WIN KISS', '', 60, '6.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(261, '8858842086926', 'CATHY DOLL MINI LIP & CHEEK NUDE MATTE TINT, #05 TWIN ORANGE', '', 60, '6.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(262, '8858842086919', 'CATHY DOLL MINI LIP & CHEEK NUDE MATTE TINT, #04 SUN PEACH', '', 60, '6.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(263, '8858842077948', 'BABY BRIGHT, LIP & CHECK VELVET CHERRY BLOSSOM #03 DRY SAKURA', '', 60, '6.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(264, '8858842077962', 'BABY BRIGHT, LIP & CHECK VELVET CHERRY BLOSSOM #05 PEACH SAKURA', '', 60, '6.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(265, '8858842077979', 'BABY BRIGHT, LIP & CHECK VELVET CHERRY BLOSSOM #06 PINK SAKURA', '', 60, '6.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(266, '8858842077955', 'BABY BRIGHT, LIP & CHECK VELVET CHERRY BLOSSOM #04 PLUM BLOSSOM', '', 60, '6.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(267, '8858842077931', 'BABY BRIGHT, LIP & CHECK VELVET CHERRY BLOSSOM #02 CORAL SAKURA', '', 60, '6.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(268, '8809486362280', 'VITA GENIC JELLY MASK, RELAXING', '', 60, '1.3000', '0.0000', '0.0000', 'no_image.png', '0', '0.6500', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(269, '8809486361610', 'VITA GENIC JELLY MASK, VITALIZING', '', 60, '1.3000', '0.0000', '0.0000', 'no_image.png', '0', '0.6500', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(270, '8809486362273', 'VITA GENIC JELLY MASK, LIFTING', '', 60, '1.3000', '0.0000', '0.0000', 'no_image.png', '0', '0.6500', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(271, '8809486361597', 'VITA GENIC JELLY MASK, CICA', '', 60, '1.3000', '0.0000', '0.0000', 'no_image.png', '0', '0.6500', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(272, '8809486362266', 'VITA GENIC JELLY MASK, HYDRATING', '', 60, '1.3000', '0.0000', '0.0000', 'no_image.png', '0', '0.6500', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(273, '8809486361603', 'VITA GENIC JELLY MASK, PORE TIGHTENING', '', 60, '1.3000', '0.0000', '0.0000', 'no_image.png', '0', '0.6500', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(274, '8809511987549', 'I\'M SORRY FOR MY SKIN, BRIGHTENING', '', 60, '1.3000', '0.0000', '0.0000', 'no_image.png', '0', '0.6500', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(275, '8809511987662', 'I\'M SORRY FOR MY SKIN, RELAXING', '', 60, '1.3000', '0.0000', '0.0000', 'no_image.png', '0', '0.6500', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(276, '8809511987570', 'I\'M SORRY FOR MY SKIN, MOISTURE', '', 60, '1.3000', '0.0000', '0.0000', 'no_image.png', '0', '0.6500', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(277, '8809511987600', 'I\'M SORRY FOR MY SKIN, SOOTHING', '', 60, '1.3000', '0.0000', '0.0000', 'no_image.png', '0', '0.6500', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(278, '77043000953', 'ST.IVES, SOFT SKIN SCRUB AVOCADO & HONEY', '', 60, '9.0000', '0.0000', '0.0000', 'no_image.png', '0', '4.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(279, '77043358023', 'ST.IVES, BLACKHEAD CLEARING', '', 60, '9.0000', '0.0000', '0.0000', 'no_image.png', '0', '4.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(280, '8809153100641', 'SKIN FOOD, RICE MASK WASH OFF', '', 60, '10.6000', '0.0000', '0.0000', 'no_image.png', '0', '5.3000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(281, '8809153100634', 'SKIN FOOD, BLACK MASK WASH OFF', '', 60, '10.6000', '0.0000', '0.0000', 'no_image.png', '0', '5.3000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(282, '8809329791239', 'ANSKIN, PEARL', '', 60, '10.6000', '0.0000', '0.0000', 'no_image.png', '0', '5.3000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(283, '8809329791215', 'ANSKIN, VITAMIN-C', '', 60, '10.6000', '0.0000', '0.0000', 'no_image.png', '0', '5.3000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(284, '8809329791420', 'ANSKIN, AROMA', '', 60, '10.6000', '0.0000', '0.0000', 'no_image.png', '0', '5.3000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(285, '8809329791093', 'ANSKIN, SNAIL', '', 60, '10.6000', '0.0000', '0.0000', 'no_image.png', '0', '5.3000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(286, '8809329791208', 'ANSKIN, COLLAGEN', '', 60, '10.6000', '0.0000', '0.0000', 'no_image.png', '0', '5.3000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(287, '8858762335997', 'ND BRAND QUEENIE BODY LOTION', '', 60, '10.0000', '0.0000', '0.0000', 'no_image.png', '0', '5.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(288, '4513574029606', 'HATOMUGI, THE BODY MILK', '', 60, '21.0000', '0.0000', '0.0000', 'no_image.png', '0', '10.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(289, '4513574030305', 'HATOMUGI, THE BODY SOAP', '', 60, '21.0000', '0.0000', '0.0000', 'no_image.png', '0', '10.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(290, '4513574025912', 'HATOMUGI, THE BODY LOTION', '', 60, '21.0000', '0.0000', '0.0000', 'no_image.png', '0', '10.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(291, '4513574030015', 'HATOMUGI, THE MILKY CREAM', '', 60, '21.0000', '0.0000', '0.0000', 'no_image.png', '0', '10.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(292, '4513574033955', 'HATOMUGI, UV CARE & MOISTURIZING', '', 60, '21.0000', '0.0000', '0.0000', 'no_image.png', '0', '10.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(293, '4513574029583', 'HATOMUGI, HOT CLEANSING', '', 60, '21.0000', '0.0000', '0.0000', 'no_image.png', '0', '10.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(294, '4513574031302', 'HATOMUGI, THE MEDICATED FACIAL FOAM', '', 60, '9.9000', '0.0000', '0.0000', 'no_image.png', '0', '4.9500', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(295, '4513574029590', 'HATOMUGI, THE FACIAL FOAM', '', 60, '9.9000', '0.0000', '0.0000', 'no_image.png', '0', '4.9500', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(296, '9318637072378', 'CATAPHIL, GENTLE SKIN CLEANSER 250ML', '', 60, '13.4000', '0.0000', '0.0000', 'no_image.png', '0', '6.7000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(297, '9318637070510', 'CATAPHIL, GENTLE SKIN CLEANSER 125ML', '', 60, '9.0800', '0.0000', '0.0000', 'no_image.png', '0', '4.5400', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(298, '769915190977', 'THE ORDINARY, GLYCOLIC ACID 7% TONING SOLUTION 240ML', '', 60, '20.0000', '0.0000', '0.0000', 'no_image.png', '0', '10.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(299, '769915190700', 'THE ORDINARY, AZELAIC ACID SUSPENION 10% 30ML', '', 60, '13.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.6600', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(300, '769915190250', 'THE ORDINARY, ALPHA ARBUTIN 2% 30ML', '', 60, '13.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.6600', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(301, '769915190281', 'THE ORDINARY, LACTIC ACID 5% + HA', '', 60, '13.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.6600', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(302, '769915194647', 'THE ORDINARY, MULTI-PEPTIDE SERUM FOR HAIR DENSITY', '', 60, '30.0000', '0.0000', '0.0000', 'no_image.png', '0', '15.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(303, '769915191004', 'THE ORDINARY, AHA 30% + BHA 2% PEELING SOLUTION', '', 60, '13.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.6600', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(304, '769915193862', 'THE ORDINARY, SALICYLIC ACID 2% SOLUTION', '', 60, '13.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.6600', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(305, '769915190403', 'THE ORDINARY, BUFFET', '', 60, '13.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.6600', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(306, '769915190670', 'THE ORDINARY, CAFFEINE SOLUTION 5% + EGCG', '', 60, '13.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.6600', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(307, 'F09', 'F9 TRUE WIRELESS HEADSET', '', 60, '15.0000', '0.0000', '0.0000', 'no_image.png', '0', '7.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(308, '6934177716867', 'REDMI AIRDOTS HEADSET', '', 60, '15.0000', '0.0000', '0.0000', 'no_image.png', '0', '7.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(309, '6971664930566', 'HAYLOU, GT25 TRUE WIRELESS EARBUDS', '', 60, '15.0000', '0.0000', '0.0000', 'no_image.png', '0', '7.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(310, 'TW80', 'TW80, WIRELESS HEADSET', '', 60, '15.0000', '0.0000', '0.0000', 'no_image.png', '0', '7.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(311, '8809140501680', 'COTTON PADS PLAIN', '', 60, '2.5000', '0.0000', '0.0000', 'no_image.png', '0', '1.2500', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(312, '8809643509657', 'HOT BURNING BODY GEL', '', 60, '8.0000', '0.0000', '0.0000', 'no_image.png', '0', '4.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(313, '8809685750505', 'RYO SHAMPOO, HAIR LOSS EXPERT CARE, FOR ANTI-DANDRUFF', '', 60, '7.0000', '0.0000', '0.0000', 'no_image.png', '0', '2.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(314, '8809685750512', 'RYO SHAMPOO, HAIR LOSS EXPERT CARE, FOR OILY SCALP', '', 60, '7.0000', '0.0000', '0.0000', 'no_image.png', '0', '2.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(315, '8809643086905', 'RYO SHAMPOO, HAIR LOSS CARE FOR OILY SCALP', '', 60, '7.0000', '0.0000', '0.0000', 'no_image.png', '0', '2.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(316, '8809643041447', 'MISEENSCENE, PERFECT SERUM, GOLDEN MOROCCO ARGAN OIL', '', 60, '7.0000', '0.0000', '0.0000', 'no_image.png', '0', '2.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(317, '8809544393935', 'GOODAL, CITRON INFUSED WATER MILD SHEET MASK', '', 60, '1.5000', '0.0000', '0.0000', 'no_image.png', '0', '0.4500', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(318, '8809544393942', 'GOODAL, GINSENG INFUSED HONEY MILD SHEET MASK', '', 60, '1.5000', '0.0000', '0.0000', 'no_image.png', '0', '0.4500', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(319, '8809544393911', 'GOODAL, MUGWORT INFUSED WATER MILD SHEET MASK', '', 60, '1.5000', '0.0000', '0.0000', 'no_image.png', '0', '0.4500', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(320, '8809544393867', 'GOODAL, GREEN TEA INFUSED WATER MILD SHEET MASK', '', 60, '1.5000', '0.0000', '0.0000', 'no_image.png', '0', '0.4500', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(321, '8809544393959', 'GOODAL, TEA TREE INFUSED WATER MILD SHEET MASK', '', 60, '1.5000', '0.0000', '0.0000', 'no_image.png', '0', '0.4500', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(322, '8809153102485', 'SKIN FOOD, EGG PLANT SOUS VIDE MASK SHEET', '', 60, '1.5000', '0.0000', '0.0000', 'no_image.png', '0', '0.4500', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(323, '8809153102423', 'SKIN FOOD, TOMATO SOUS VIDE MASK SHEET', '', 60, '1.5000', '0.0000', '0.0000', 'no_image.png', '0', '0.4500', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(324, '8809153102478', 'SKIN FOOD, PUMPKIN SOUS VIDE MASK SHEET', '', 60, '1.5000', '0.0000', '0.0000', 'no_image.png', '0', '0.4500', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(325, '8809153102492', 'SKIN FOOD, SPINACH SOUS VIDE MASK SHEET', '', 60, '1.5000', '0.0000', '0.0000', 'no_image.png', '0', '0.4500', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(326, '8809153102461', 'SKIN FOOD, PAPRIKA SOUS VIDE MASK SHEET', '', 60, '1.5000', '0.0000', '0.0000', 'no_image.png', '0', '0.4500', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(327, '8809153102447', 'SKIN FOOD, BROCCOLI SOUS VIDE MASK SHEET', '', 60, '1.5000', '0.0000', '0.0000', 'no_image.png', '0', '0.4500', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(328, '8809153102454', 'SKIN FOOD, KALE SOUS VIDE MASK SHEET', '', 60, '1.5000', '0.0000', '0.0000', 'no_image.png', '0', '0.4500', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(329, '8809153102430', 'SKIN FOOD, CABBAGE SOUS VIDE MASK SHEET', '', 60, '1.5000', '0.0000', '0.0000', 'no_image.png', '0', '0.4500', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(330, '8809153102515', 'SKIN FOOD, ASPARAGUS SOUS VIDE MASK SHEET', '', 60, '1.5000', '0.0000', '0.0000', 'no_image.png', '0', '0.4500', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(331, '8809153102508', 'SKIN FOOD, LOTUS ROOT SOUS VIDE MASK SHEET', '', 60, '1.5000', '0.0000', '0.0000', 'no_image.png', '0', '0.4500', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(332, '8809598451926', 'COSRK, TRIPLE HYALURONIC MOISTURIZING CLEANSER', '', 60, '16.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(333, '8809598451483', 'COSRK, CICA CLEANSER', '', 60, '20.0000', '0.0000', '0.0000', 'no_image.png', '0', '10.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(334, '8809416470191', 'COSRK, ALOE SOOTHING SUN CREAM', '', 60, '16.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(335, '8809598450547', 'COSRK, CALMING FOAM CLEANSER', '', 60, '16.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(336, '8809598451506', 'COSRK, CICA SERUM', '', 60, '30.0000', '0.0000', '0.0000', 'no_image.png', '0', '15.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(337, '8809598450820', 'COSRK, PROPOLIS LIGHT AMPOULE', '', 60, '36.0000', '0.0000', '0.0000', 'no_image.png', '0', '18.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(338, '8809598451032', 'COSRK, PROPOLIS LIGHT CREAM', '', 60, '36.0000', '0.0000', '0.0000', 'no_image.png', '0', '18.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(339, '8809707268919', 'INNISFREE, GREEN HOLIDAYS, GREEN TEA SEED SERUM SET', '', 60, '28.0000', '0.0000', '0.0000', 'no_image.png', '0', '14.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(340, 'LM30', 'LANEIGE MULTI DEEP-CLEAN CLEANSER 3ML', '', 60, '4.0000', '0.0000', '0.0000', 'no_image.png', '0', '2.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(341, '8809707277447', 'INNISFREE, JEJU CHERRY BLOSSOM', '', 60, '16.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(342, '8809652905990', 'INNISFREE, BIJA TROUBLE FACIAL FOAM', '', 60, '16.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(343, '8809707252826', 'INNISFREE, JEJU VOLCANIC PORE CLEANSING FOAM EX', '', 60, '16.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(344, '8809707267615', 'INNISFREE, GREEN TEA FOAM CLEANSER', '', 60, '16.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(345, '8809535802071', 'DR.JART+ SHAKE & SHOT, SHAKING RUBBER LUMINOUS SHOT', '', 60, '7.5000', '0.0000', '0.0000', 'no_image.png', '0', '3.7500', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(346, '8809535802064', 'DR.JART+ SHAKE & SHOT, SHAKING RUBBER SOOTHING SHOT', '', 60, '7.5000', '0.0000', '0.0000', 'no_image.png', '0', '3.7500', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(347, '8809535802088', 'DR.JART+ SHAKE & SHOT, SHAKING RUBBER ELASTIC SHOT', '', 60, '7.5000', '0.0000', '0.0000', 'no_image.png', '0', '3.7500', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(348, '8809535802057', 'DR.JART+ SHAKE & SHOT, SHAKING RUBBER HYDRO SHOT', '', 60, '7.5000', '0.0000', '0.0000', 'no_image.png', '0', '3.7500', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(349, '8809759901222', 'BANILA CO, CLEAN IT ZERO, CLEANSING BLAM ORIGINAL', '', 60, '24.0000', '0.0000', '0.0000', 'no_image.png', '0', '12.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(350, '8809560228082', 'BANILA CO, CLEAN IT ZERO, CLEANSING BLAM NOURISING', '', 60, '5.0000', '0.0000', '0.0000', 'no_image.png', '0', '2.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(351, '8809560228075', 'BANILA CO, CLEAN IT ZERO, CLEANSING BLAM REVITALIZING', '', 60, '5.0000', '0.0000', '0.0000', 'no_image.png', '0', '2.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(352, '8809560228006', 'BANILA CO, CLEAN IT ZERO, CLEANSING BLAM PURIFYING', '', 60, '5.0000', '0.0000', '0.0000', 'no_image.png', '0', '2.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(353, '8809560223728', 'BANILA CO, CLEAN IT ZERO SPECIAL KIT', '', 60, '12.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(354, '8809598452800', 'COSRX, ALL ABOUT SNAIL KIT', '', 60, '24.0000', '0.0000', '0.0000', 'no_image.png', '0', '12.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(355, '8809416470245', 'COSRX, ACNE PIMPLE MASTER PATCH', '', 60, '5.0000', '0.0000', '0.0000', 'no_image.png', '0', '2.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(356, '8809598452190', 'COSRX, CICA-7 RELIEF KIT', '', 60, '24.0000', '0.0000', '0.0000', 'no_image.png', '0', '12.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(357, '8806102875896', 'KYUNG NAM PHARM 120G (460 KCAL / 2G X 60) PINK (BOX)', '', 60, '26.0000', '0.0000', '0.0000', 'no_image.png', '0', '13.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(358, '8806102877906', 'KYUNG NAM PHARM 120G (465 KCAL / 2G X 60) RED (BOX)', '', 60, '26.0000', '0.0000', '0.0000', 'no_image.png', '0', '13.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(359, '8806102878354', 'LEMONA 60G (KIT)', '', 60, '27.0000', '0.0000', '0.0000', 'no_image.png', '0', '13.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(360, '8809707275252', 'INNISFREE, MY PERFUMED BODY PINK MUHLY GRASS #BODY CLEANSER', '', 60, '16.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(361, '8809707275269', 'INNISFREE, MY PERFUMED BODY PINK MUHLY GRASS #BODY LOTION', '', 60, '16.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(362, '8809707275184', 'INNISFREE, MY PERFUMED BODY GRAPFRUIT #BODY CLEANSER', '', 60, '16.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(363, '8809707275238', 'INNISFREE, MY PERFUMED BODY GRAPFRUIT #BODY LOTION', '', 60, '16.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(364, '8809707275191', 'INNISFREE, MY PERFUMED BODY GREEN TANGERING #BODY CLEANSER', '', 60, '16.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(365, '8809707275221', 'INNISFREE, MY PERFUMED BODY GREEN TANGERING #BODY LOTION', '', 60, '16.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(366, '8809707275207', 'INNISFREE, MY PERFUMED BODY WATER LILY #BODY CLEANSER', '', 60, '16.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(367, '8809707275214', 'INNISFREE, MY PERFUMED BODY WATER LILY #BODY LOTION', '', 60, '16.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(368, '8809707275245', 'INNISFREE, MY PERFUMED BODY COTTON FLOWER #BODY CLEANSER', '', 60, '16.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(369, '8809707275276', 'INNISFREE, MY PERFUMED BODY COTTON FLOWER #BODY LOTION', '', 60, '16.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(370, '8809707267622', 'INNISFREE, GREEN TEA CLEANSING WATER 300ML', '', 60, '16.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(371, '8809563955923', 'ESPOIR, WATER SPLASH SUN CREAM', '', 60, '24.0000', '0.0000', '0.0000', 'no_image.png', '0', '12.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(372, '8809563955930', 'ESPOIR, WATER SPLASH CICA TON UP SUN CREAM', '', 60, '24.0000', '0.0000', '0.0000', 'no_image.png', '0', '12.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(373, '8809685752608', 'MAMONDE, ROSE WATER TONER', '', 60, '15.0000', '0.0000', '0.0000', 'no_image.png', '0', '7.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(374, '8809707275870', 'INNISFREE, TONE UP WATERING SUNSCREEN', '', 60, '17.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(375, '8809652865430', 'INNISFREE, TONE UP NO SEBUM SUNSCREEN', '', 60, '17.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(376, '8809581452329', 'MISSHA, ESSENCE SUN MILK SPF50+ PA+++', '', 60, '16.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(377, '8809581452367', 'MISSHA, SOFT FINISH SUN MILK SPF50+ PA+++', '', 60, '16.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(378, '8809581452343', 'MISSHA, WATER PROOF MILK SPF50+ PA+++', '', 60, '16.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(379, '8809644494051', 'CLIO, NUDISM MOIST COVER CUSHION', '', 60, '25.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(380, '8809644495317', 'CLIO, KILL COVER AMPOULE CUSHION', '', 60, '25.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(381, '8809691975039', 'CLIO, KILL COVER CICA SERUM CUSHION', '', 60, '25.0000', '0.0000', '0.0000', 'no_image.png', '0', '7.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(382, '8809691970416', 'CLIO, PRO BLUSHER PALETTE BLOOM PASTEL', '', 60, '25.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(383, '8809685789505', 'HERA, SENSUAL POWDER MATTE #333 CLOSER', '', 60, '12.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(384, '8809685758051', 'HERA, SENSUAL POWDER MATTE #422 LINGERIE', '', 60, '12.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(385, '8809685789499', 'HERA, SENSUAL POWDER MATTE #177 SEOUL DAZE', '', 60, '12.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(386, '8809691970294', 'CLIO, MAD MATTER #10 BURNT BURGUNDY', '', 60, '12.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(387, '8809691970270', 'CLIO, MAD MATTER #08 PUMPKIN MOMENT', '', 60, '12.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(388, '8809691970218', 'CLIO, MAD MATTER #02 BLUSHING PINK', '', 60, '12.0000', '0.0000', '0.0000', 'no_image.png', '0', '6.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(389, '8809786594862', 'A.BLACK, ALL DAY PERFECT FIT COVER CUSHION', '', 60, '16.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(390, '8809612852708', 'INNISFREE, GREEN TEA SEED EYE CREAM', '', 60, '30.0000', '0.0000', '0.0000', 'no_image.png', '0', '15.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(391, '8809643078528', 'LANEIGE, PERFECT RENEW YOUTH REGENERATION EYE CREAM', '', 60, '52.0000', '0.0000', '0.0000', 'no_image.png', '0', '26.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(392, '8809539750651', 'BUBI BUBI BUBBLE LIP SCRUP', '', 60, '11.0000', '0.0000', '0.0000', 'no_image.png', '0', '5.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(393, 'L02', 'LANEIGE, RADIAN-C CREAM', '', 60, '2.0000', '0.0000', '0.0000', 'no_image.png', '0', '1.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(394, 'Z01', 'CLEAN IT ZERO CLEANING BALM ORIGINAL', '', 60, '6.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(395, '8809707274538', 'INNISFREE, INTENSIVE TRIPLE-SHIELD SUNSCREEN', '', 60, '6.0000', '0.0000', '0.0000', 'no_image.png', '0', '3.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(396, 'ES01', 'ESPOIR, WATER SPLASH CICA TON UP SUN CREAM 20ML', '', 60, '2.0000', '0.0000', '0.0000', 'no_image.png', '0', '1.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(397, 'ES02', 'ESPOIR, WATER SPLASH SUN CREAM 20ML', '', 60, '2.0000', '0.0000', '0.0000', 'no_image.png', '0', '1.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(398, '8809664983931', '3CE SHIMMER MAKEUP FIXER', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '14.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(399, '8809664981579', '3CE SOFT MATTE FIT CUSHION 001 WARM IVORY', '', 60, '40.0000', '0.0000', '0.0000', 'no_image.png', '0', '25.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(400, '8809664981586', '3CE SOFT MATTE FIT CUSHION 002 NUDE', '', 60, '40.0000', '0.0000', '0.0000', 'no_image.png', '0', '25.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(401, '8809437396791', '3CE MULTI EYE COLOR PALETTE #PLOT TWIST', '', 60, '38.0000', '0.0000', '0.0000', 'no_image.png', '0', '25.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(402, '8809664980442', '3CE STYLENANDA SUPER SLIM EYE BROW PENCIL #CHOCO BROWN', '', 60, '12.0000', '0.0000', '0.0000', 'no_image.png', '0', '7.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(403, '8809664980459', '3CE STYLENANDA SUPER SLIM EYE BROW PENCIL #GRAY BROWN', '', 60, '12.0000', '0.0000', '0.0000', 'no_image.png', '0', '7.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(404, '8809664980435', '3CE STYLENANDA SUPER SLIM EYE BROW PENCIL #LIGHT BROWN', '', 60, '12.0000', '0.0000', '0.0000', 'no_image.png', '0', '7.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(405, '8809437399990', '3CE CLOUD LIP TINT #ACTIVE LADY', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(406, '8809664980053', '3CE CLOUD LIP TINT #LIVE A LITTLE', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(407, '8809664980039', '3CE CLOUD LIP TINT #MACARON RED', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(408, '3862668014037', 'ETUDE PLAY COLOR EYES KISSES #1 MILK CHOCOLATE', '', 60, '20.0000', '0.0000', '0.0000', 'no_image.png', '0', '10.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(409, '8809685819431', 'LANEIGE JOYEUX ANNIVERSAIRE', '', 60, '16.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(410, '8809691972175', 'CLIO, PEACH CROVE #07', '', 60, '25.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(411, '8809437399501', '3CE STYLENANDA #001', '', 60, '30.0000', '0.0000', '0.0000', 'no_image.png', '0', '16.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(412, '8809437392786', '3CE STYLENANDA DUO CONTOUR STICK #01', '', 60, '20.0000', '0.0000', '0.0000', 'no_image.png', '0', '10.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(413, '8809664983511', '3CE BLUR WATER TINT, SEPIA', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(414, '8809664983870', '3CE VELVET LIP TINT, DEFINITION', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(415, '8809664983863', '3CE VELVET LIP TINT, CASHMERE NUDE', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(416, '8809664983894', '3CE VELVET LIP TINT, BITTER HOUR', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(417, '8809664983856', '3CE VELVET LIP TINT, LIKE GENTLE', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `tec_products` (`id`, `code`, `name`, `second_name`, `category_id`, `price`, `price_wholesale`, `price_vip`, `image`, `tax`, `cost`, `tax_method`, `quantity`, `barcode_symbology`, `type`, `details`, `alert_quantity`, `unit_id`, `alert_expiry`, `expiry_date`, `beverage`, `ingredient`, `service_month`, `alert_service`, `promotion`, `promo_price`, `start_date`, `end_date`) VALUES
(418, '8809437399983', '3CE VELVET LIP TINT, BEIGE AVENUE', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(419, '8809664980091', '3CE VELVET LIP TINT, CUTESICLE', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(420, '8809437395145', '3CE BLUSH CUSION, PINK', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '12.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(421, '8809437399686', '3CE FACE BLUSH, PEACH SPLASH', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '11.3000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(422, '8809437399716', '3CE FACE BLUSH, FULL OF CHARM', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '11.3000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(423, '8809437399693', '3CE FACE BLUSH, PURE CAKE', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '11.3000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(424, '8809292447355', '3CE PORE SILKY BALM', '', 60, '15.0000', '0.0000', '0.0000', 'no_image.png', '0', '7.2000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(425, '8809664983436', '3CE BLUR WATER TINT, BAKE BEIGE', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(426, '8809598452305', 'COSRX, ADVANCED SNAIL HYDROGEL EYE PATCH', '', 60, '25.0000', '0.0000', '0.0000', 'no_image.png', '0', '15.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(427, '8809664983887', '3CE VELVET LIP TINT, WALK N TALK', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(428, 'ES03', 'ESPOIR, WATER SPLASH CICA TONE UP SUN CREAM 20ML', '', 60, '2.0000', '0.0000', '0.0000', 'no_image.png', '0', '1.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(429, '8809664982309', '3CE SOFT MATTE, RED MUSE', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '12.3000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(430, '8809664982354', '3CE SOFT MATTE, KIND & LOVE', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '12.3000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(431, '8809664980084', '3CE CLOUD LIP TINT BLOOSOM DAY', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.7000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(432, '8809664980046', '3CE CLOUD LIP TINT IMMANCE', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.7000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(433, '8809664982224', '3CE EYE SHADOW, SHOT AGAIN', '', 60, '38.0000', '0.0000', '0.0000', 'no_image.png', '0', '25.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(434, '8809664983375', '3CE SOFT MATTE LIPSTICK, #SOFT MELLOW', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '12.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(435, '8809664980398', '3CE VELVET LIP TINT, SLOW MOTION', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(436, '880943739983', '3CE CLOUD LIP TINT, BEIGE AVENUE', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(437, '8809664980022', '3CE CLOUD LIP TINT, NEEDFUL', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(438, '8809437398436', '3CE WATER PROOF MASCARA', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '13.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(439, '8809664983948', '3CE WATER PROOF ,SLIM MASCARA', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '13.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(440, 'L01', 'Laneige', '', 60, '4.0000', '0.0000', '0.0000', 'no_image.png', '0', '2.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(441, '8809664980015', '3CE CLOUD LIP TINT, PEACH TEASE', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(442, '8809437398368', '3ce dual blend blusher #BLOMMING AGAIN', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '13.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(443, '8809437398375', '3ce dual blend blusher #MAMACITA', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '13.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(444, '8809437398351', '3ce dual blend blusher #INSTICT', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '13.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(445, '8809664983849', '3CE BLUSH BRUSH #f06', '', 60, '15.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(446, '8809437396609', '3CE VELVET LIP TINT #PINK BREAK', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(447, '8809664982767', '3CE BLURRING BEAR BURRY', '', 60, '18.0000', '0.0000', '0.0000', 'no_image.png', '0', '9.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(448, '8809664980930', '3CE MINI MULTI EYE COLOR PALLETTE # GLITTER BOMB', '', 60, '24.0000', '0.0000', '0.0000', 'no_image.png', '0', '15.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(449, '8809437398795', '3CE FOUNDATION STICK', '', 60, '28.0000', '0.0000', '0.0000', 'no_image.png', '0', '16.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(450, '8809664981869', '3CE EYE GLINT', '', 60, '14.0000', '0.0000', '0.0000', 'no_image.png', '0', '7.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(451, '8809664981296', '3CE VELVET LIQUID BLUSHER #LIKE THAT', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '11.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(452, '8809437398993', '3CE PLUMPING LIPS #CORAL', '', 60, '16.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(453, '8809437398986', '3CE PLUMPING LIPS #RED', '', 60, '16.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(454, '8809437399006', '3CE PLUMPING LIPS #ROSY', '', 60, '16.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(455, '8809437398979', '3CE PLUMPING LIPS #CLEAR', '', 60, '16.0000', '0.0000', '0.0000', 'no_image.png', '0', '8.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(456, '8809664983399', '3CE SOFT MATTE LIPSTICK, #WAY BACK', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '12.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(457, '8809664983382', '3CE SOFT MATTE LIPSTICK #ORANGE BREEZE', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '13.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(458, '8809664983528', '3CE NATURAL FINISH LOOSE POWER, 001', '', 60, '28.0000', '0.0000', '0.0000', 'no_image.png', '0', '16.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(459, '8809664984488', '3CE SOFT MATTE LIPSTICK #UNSTAINED RED', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '13.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(460, '8809664983535', '3CE NATURAL FINISH LOOSE POWER, 002', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '16.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(461, '8809664980336', '3CE GLOW BEAM HIGHLIGHTER #REAR SIDE', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '11.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(462, '8809664983955', '3CE SUPER SLIM WATER PROOF MASCARA, BLACK', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '13.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(463, '8809664984464', '3CE SOFT MATTE LIPSTICK, #SENSUAL BREEZE', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '12.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(464, '8809664984068', '3CE GLOW BEAM', '', 60, '25.0000', '0.0000', '0.0000', 'no_image.png', '0', '12.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(465, '8809437399709', '3CE FACE BLUSH #DELECTABLE', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '11.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(466, '8809664981609', '3CE GLOW CUSHION 002 SOFT NUDE', '', 60, '40.0000', '0.0000', '0.0000', 'no_image.png', '0', '25.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(467, '8809437399280', '3CE PRO MULTI EYE COLOR PALETTE #MUSEDAY', '', 60, '95.0000', '0.0000', '0.0000', 'no_image.png', '0', '55.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(468, '8809664984471', '3CE SOFT MATTE LIPSTICK, #ETERNAL WARM', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '12.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(469, '8809664983191', '3CE GLOW LIP COLOR #UNDER PRESSURE', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '13.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(470, '8809664983207', '3CE GLOW LIP COLOR #SMOKY RED', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '13.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(471, '8809664983184', '3CE GLOW LIP COLOR #OVERLOAD', '', 60, '22.0000', '0.0000', '0.0000', 'no_image.png', '0', '13.5000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(472, '8809437399297', '3CE PRO MULTI BLUSHER COLOR PALLET', '', 60, '55.0000', '0.0000', '0.0000', 'no_image.png', '0', '38.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(473, '8809437398207', '3CE TAKE LAYER #COMMON TIME', '', 60, '28.0000', '0.0000', '0.0000', 'no_image.png', '0', '14.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(474, 'P001', 'ហ្វឹ', '', 1, '12000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(475, 'P002', 'ហ្វឹពិសេស', '', 1, '16000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(476, 'P003', 'បាយមាន់', '', 1, '12000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(477, 'P004', 'បាយសាច់គោ', '', 1, '12000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(478, 'P005', 'មីឆាសាច់គោ', '', 1, '12000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(479, 'P006', 'មីឆាគ្រឿងសមុទ្រ', '', 1, '12000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(480, 'P007', 'បាយឆាសាច់គោ', '', 1, '12000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(481, 'P008', 'បាយឆាគ្រឿងសមុទ្រ', '', 1, '12000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(482, 'P009', 'លតឆាសាច់គោ', '', 1, '12000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(483, 'P010', 'លតឆាគ្រឿងសមុទ្រ', '', 1, '12000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(484, 'P011', 'បាយឆាឡុកឡាក់', '', 1, '14000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(485, 'P012', 'បាយឆាម្រះព្រៅ', '', 1, '14000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(486, 'P013', 'បបរគ្រឿងសមុទ្រ', '', 1, '16000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(487, 'P014', 'បបរសាមចូក', '', 1, '16000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(488, 'P015', 'មីកាតាំងឆាសាច់គោ', '', 1, '14000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(489, 'P016', 'មីកាតាំងឆាគ្រឿងសមុទ្រ', '', 1, '14000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(490, 'P017', 'បាយឆាក្តាម', '', 1, '16000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(491, 'P018', 'សម្លម្ជូរគ្រឿងសាច់គោ (ចានតូច)', '', 2, '12000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(492, 'P019', 'សម្លម្ជូរគ្រឿងសាច់មាន់ (ចានតូច)', '', 2, '12000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(493, 'P020', 'សម្លកកូរត្រី (ចានតូច)', '', 2, '12000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(494, 'P021', 'សម្លកកូរមាន់ (ចានតូច)', '', 2, '12000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(495, 'P022', 'ស្ងោជ្រក់មាន់ (ចានតូច)', '', 2, '12000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(496, 'P023', 'ស្ងោជ្រក់ត្រី (ចានតូច)', '', 2, '12000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(497, 'P024', 'តុងយ៉ាំមាន់ (ចានតូច)', '', 2, '12000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(498, 'P025', 'តុងយ៉ាំគ្រឿងសមុទ្រ (ចានតូច)', '', 2, '12000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(499, 'P026', 'ចៀនចួនត្រីកេស​ នឹងត្រីសន្តាយ (ចានតូច)', '', 2, '12000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(500, 'P027', 'ឆាបន្លែគ្រប់មុខ (ចានតូច)', '', 2, '8000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(501, 'P028', 'ឆាសាច់គោ (ចានតូច)', '', 2, '10000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(502, 'P029', 'ឆាសាច់មាន់ (ចានតូច)', '', 2, '10000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(503, 'P030', 'ឆាក្តៅសាច់គោ (ចានតូច)', '', 2, '10000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(504, 'P031', 'ឆាក្តៅសាច់មាន់ (ចានតូច)', '', 2, '10000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(505, 'P032', 'ឆាជូអែមសាច់គោ (ចានតូច)', '', 2, '10000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(506, 'P033', 'ឆាជូអែមសាច់មាន់ (ចានតូច)', '', 2, '10000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(507, 'P034', 'ឆាជូអែមត្រី (ចានតូច)', '', 2, '10000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(508, 'P035', 'ឆាជូអែមគ្រឿងសមុទ្រ (ចានតូច)', '', 2, '10000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(509, 'P036', 'ត្រីកេសចៀន (ចានតូច)', '', 2, '12000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(510, 'P037', 'ត្រីសន្តាយចៀន (ចានតូច)', '', 2, '12000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(511, 'P038', 'ត្រីប្រម៉ាចៀន​ នឹងចំហុយ (ចានតូច)', '', 2, '10000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(512, 'P039', 'ត្រីឡាប់យ៉ាចំហុយក្រូចឆ្មារ (ចានតូច)', '', 2, '12000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(513, 'P040', 'សម្លម្ជូរគ្រឿងសាច់គោ (ចានធំ)', '', 2, '20000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(514, 'P041', 'សម្លម្ជូរគ្រឿងសាច់មាន់ (ចានធំ)', '', 2, '20000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(515, 'P042', 'សម្លកកូរត្រី (ចានធំ)', '', 2, '20000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(516, 'P043', 'សម្លកកូរមាន់ (ចានធំ)', '', 2, '20000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(517, 'P044', 'ស្ងោជ្រក់មាន់ (ចានធំ)', '', 2, '20000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(518, 'P045', 'ស្ងោជ្រក់ត្រី (ចានធំ)', '', 2, '20000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(519, 'P046', 'តុងយ៉ាំមាន់ (ចានធំ)', '', 2, '20000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(520, 'P047', 'តុងយ៉ាំគ្រឿងសមុទ្រ (ចានធំ)', '', 2, '20000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(521, 'P048', 'ចៀនចួនត្រីកេស​ នឹងត្រីសន្តាយ (ចានធំ)', '', 2, '20000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(522, 'P049', 'ឆាបន្លែគ្រប់មុខ (ចានធំ)', '', 2, '12000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(523, 'P050', 'ឆាសាច់គោ (ចានធំ)', '', 2, '16000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(524, 'P051', 'ឆាសាច់មាន់ (ចានធំ)', '', 2, '16000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(525, 'P052', 'ឆាក្តៅសាច់គោ (ចានធំ)', '', 2, '16000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(526, 'P053', 'ឆាក្តៅសាច់មាន់ (ចានធំ)', '', 2, '16000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(527, 'P054', 'ឆាជូអែមសាច់គោ (ចានធំ)', '', 2, '16000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(528, 'P055', 'ឆាជូអែមសាច់មាន់ (ចានធំ)', '', 2, '16000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(529, 'P056', 'ឆាជូអែមត្រី (ចានធំ)', '', 2, '16000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(530, 'P057', 'ឆាជូអែមគ្រឿងសមុទ្រ (ចានធំ)', '', 2, '16000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(531, 'P058', 'ត្រីកេសចៀន (ចានធំ)', '', 2, '20000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(532, 'P059', 'ត្រីសន្តាយចៀន (ចានធំ)', '', 2, '20000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(533, 'P060', 'ត្រីប្រម៉ាចៀន​ នឹងចំហុយ (ចានធំ)', '', 2, '16000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(534, 'P061', 'ត្រីឡាប់យ៉ាចំហុយក្រូចឆ្មារ (ចានធំ)', '', 2, '20000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(535, 'P062', 'ស៊ុបមាន់ខ្មៅ', '', 3, '40000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(536, 'P063', 'ស៊ុបស៊ីឈាន់​២រស់ជាតិ', '', 3, '48000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(537, 'P064', 'ស៊ុបកន្ធាយ', '', 3, '80000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(538, 'P065', 'កន្ធាយចំហុយខ្ទឹមស', '', 3, '80000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(539, 'P066', 'កន្ធាយចំហុយថ្នាំចិន', '', 3, '80000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(540, 'P067', 'ដំឡូងបំពង', '', 4, '6000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(541, 'P068', 'ស៊ាំងវិចគៀប', '', 4, '4000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(542, 'P069', 'ប្រហិតស្ងោរ', '', 4, '10000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(543, 'P070', 'ប្រហិតបំពង', '', 4, '10000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(544, 'P071', 'ស្លាបមាន់បំពង', '', 4, '8000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(545, 'P072', 'ភ្លៅមាន់បំពង', '', 4, '8000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(546, 'P073', 'មីកំប៉ុង', '', 4, '3000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(547, 'P074', 'បុកល្ហុង៣សាសន៌', '', 5, '15000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(548, 'P075', 'បុកពោត៣សាសន៌', '', 5, '15000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(549, 'P076', 'បុកមី៣សាស៌', '', 5, '15000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(550, 'P077', 'បុកពងទាកូន', '', 5, '15000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(551, 'P078', 'បុកក្តាម', '', 5, '10000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(552, 'P079', 'បុកបង្គា', '', 5, '10000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(553, 'P080', 'បុកងាវ', '', 5, '10000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(554, 'P081', 'បុកមឹក', '', 5, '10000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(555, 'P082', 'បុកប៉ាតេ', '', 5, '10000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(556, 'P083', 'បុកត្រីសាម៉ុន', '', 5, '20000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(557, 'P084', 'បុកជើងមាន់', '', 5, '10000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(558, 'P085', 'បុកក្តាមប្រៃ', '', 5, '8000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(559, 'P086', 'បុកបង្គាគ្រៀម', '', 5, '8000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(560, 'P087', 'ភ្លា៣សាសន៌', '', 6, '15000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(561, 'P088', 'ភ្លាក្តាមសេះ', '', 6, '15000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(562, 'P089', 'ភ្លាបង្គាស្រស់', '', 6, '15000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(563, 'P090', 'ភ្លាងាវ', '', 6, '15000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(564, 'P091', 'ភ្លាក្តាមប្រៃ', '', 6, '10000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(565, 'P092', 'ភ្លាត្រីសាម៉ុន', '', 6, '20000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(566, 'P093', 'ភ្លាប៉ាតេ', '', 6, '15000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(567, 'P094', 'សាឡាត់ស', '', 7, '5000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(568, 'P095', 'តាំងអោ', '', 7, '5000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(569, 'P096', 'ត្រកួន', '', 7, '3000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(570, 'P097', 'ស្ពៃបូកគោ', '', 7, '3000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(571, 'P098', 'ស្ពៃតឿ', '', 7, '3000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(572, 'P099', 'ផ្សិតម្ជុល', '', 7, '4000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(573, 'P100', 'ផ្សិតចំបើ', '', 7, '4000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(574, 'P101', 'មីកព្ចាប់', '', 7, '2000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(575, 'P102', 'មីដុំ', '', 7, '2000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(576, 'P103', 'មីគីឡូ', '', 7, '3000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(577, 'P104', 'តៅហ៊ូ', '', 7, '2000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(578, 'P105', 'ពពុះសណ្តែក', '', 7, '3000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(579, 'P106', 'មីសួ', '', 7, '3000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(580, 'P107', 'ប្រហិតត្រី', '', 7, '8000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(581, 'P108', 'ប្រហិតសាច់គោ', '', 7, '8000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(582, 'P109', 'សាច់គោខ្មែរ', '', 7, '8000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(583, 'P110', 'សាច់គោអូស្រ្តាលី', '', 7, '10000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(584, 'P111', 'កាហ្វេទឹកកក', '', 8, '4000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(585, 'P112', 'កាហ្វេទឹកដោះគោទឹកកក', '', 8, '6000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(586, 'P113', 'ឡាតេទឹកកក', '', 8, '7000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(587, 'P114', 'កាពូជីណូទឹកកក', '', 8, '7000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(588, 'P115', 'ម៉ូកាទឹកកក', '', 8, '7000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(589, 'P116', 'មីឡូទឹកដោះគោទឹកកក', '', 8, '6000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(590, 'P117', 'អូវ៉ាន់ទីនទឹកដោះគោទឹកកក', '', 8, '6000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(591, 'P118', 'កាកាវទឹកដោះគោទឹកកក', '', 8, '7000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(592, 'P119', 'កាហ្វេទឹកដោះគោឆៅទឹកកក', '', 8, '7000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(593, 'P120', 'តែក្រូចឆ្មាទឹកកក', '', 8, '4000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(594, 'P121', 'តែក្រូចឆ្មាទឹកឃ្មុំទឹកកក', '', 8, '6000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(595, 'P122', 'តែបៃតងទឹកដោះគោទឹកកក', '', 8, '7000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(596, 'P123', 'តែក្រហមទឹកដោះគោទឹកកក', '', 8, '7000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(597, 'P124', 'ផាសិនសូដាទឹកកក', '', 8, '6000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(598, 'P125', 'ផាសិនទឹកដោះគោទឹកកក', '', 8, '6000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(599, 'P126', 'ស្រ្តបប៉ូរីទឹកដោះគោទឹកកក', '', 8, '8000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(600, 'P127', 'ស្រ្តបប៉ូរីសូដាទឹកកក', '', 8, '6000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(601, 'P128', 'ប្លូប៊រីសូដាទឹកកក', '', 8, '6000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(602, 'P129', 'ប្លូប៊រីទឹកដោះគោទឹកកក', '', 8, '8000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(603, 'P130', 'ប៉ោមសូដាទឹកកក', '', 8, '6000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(604, 'P131', 'ប៉ោមទឹកដោះគោទឹកកក', '', 8, '8000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(605, 'P132', 'ដំឡូងស្វាយទឹកដោះគោទឹកកក', '', 8, '8000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(606, 'P133', 'តែទឹកដោះគោទឹកកក', '', 8, '8000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(607, 'P134', 'ទឹកដោះគោឆៅទឹកកក', '', 8, '6000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(608, 'P135', 'តែខ្មៅទឹកឃ្មុំទឹកកក', '', 8, '6000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(609, 'P136', 'កាហ្វេក្រឡុក', '', 9, '5000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(610, 'P137', 'កាហ្វេទឹកឃ្មុំក្រឡុក', '', 9, '8000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(611, 'P138', 'កាហ្វេទឹកដោះគោក្រឡុក', '', 9, '8000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(612, 'P139', 'ឡាតេក្រឡុក', '', 9, '9000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(613, 'P140', 'កាពូជីណូក្រឡុក', '', 9, '9000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(614, 'P141', 'ម៉ូកាក្រឡុក', '', 9, '9000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(615, 'P142', 'កាកាវក្រឡុក', '', 9, '9000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(616, 'P143', 'មីឡូទឹកដោះគោក្រឡុក', '', 9, '8000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(617, 'P144', 'អូវ៉ាន់ទីនទឹកដោះគោក្រឡុក', '', 9, '8000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(618, 'P145', 'កាហ្វេទឹកដោះគោឆៅក្រឡុក', '', 9, '8000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(619, 'P146', 'តែក្រូចឆ្មាក្រឡុក', '', 9, '5000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(620, 'P147', 'តែក្រូចឆ្មាទឹកឃ្មុំក្រឡុក', '', 9, '6000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(621, 'P148', 'តែបៃតងទឹកដោះគោក្រឡុក', '', 9, '8000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(622, 'P149', 'តែក្រហមទឹកដោះគោក្រឡុក', '', 9, '9000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(623, 'P150', 'ផាសិនសូដាក្រឡុក', '', 9, '8000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(624, 'P151', 'ផាសិនទឹកដោះគោក្រឡុក', '', 9, '8000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(625, 'P152', 'ប៉ោមទឹកដោះគោក្រឡុក', '', 9, '8000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(626, 'P153', 'ប៉ោមសូដាក្រឡុក', '', 9, '8000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(627, 'P154', 'ប័រក្រឡុក', '', 9, '10000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(628, 'P155', 'ស្រ្តប៊ីរីក្រឡុក', '', 9, '8000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(629, 'P156', 'កាហ្វេក្តៅ', '', 10, '4000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(630, 'P157', 'កាហ្វេទឹកឃ្មុំក្តៅ', '', 10, '6000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(631, 'P158', 'កាហ្វេទឹកដោះគោក្តៅ', '', 10, '6000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(632, 'P159', 'ម៉ូកាក្តៅ', '', 10, '8500.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(633, 'P160', 'ឡាតេក្តៅ', '', 10, '8500.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(634, 'P161', 'កាពូជីណូក្តៅ', '', 10, '8500.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(635, 'P162', 'មីឡូទឹកដោះគោក្តៅ', '', 10, '6000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(636, 'P163', 'អូវ៉ាន់ទីនទឹកដោះគោក្តៅ', '', 10, '6000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(637, 'P164', 'កាកាវក្តៅ', '', 10, '8500.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(638, 'P165', 'កាហ្វេទឹកដោះគោឆៅក្តៅ', '', 10, '8000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(639, 'P166', 'តែក្រូចឆ្មាក្តៅ', '', 10, '5000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(640, 'P167', 'តែក្រូចឆ្មាទឹកឃ្មុំក្តៅ', '', 10, '8000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(641, 'P168', 'តែខ្មៅទឹកឃ្មុំក្តៅ', '', 10, '8000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(642, 'P169', 'តែបៃតងទឹកដោះគោក្តៅ', '', 10, '8000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(643, 'P170', 'តែក្រហមទឹកដោះគោក្តៅ', '', 10, '8000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(644, 'P171', 'តែគុជទឹកដោះគោ', '', 11, '7000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(645, 'P172', 'ប្រោនស៊ូហ្គឺ', '', 11, '7000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(646, 'P173', 'កាហ្វេដូងក្រអូប', '', 11, '7000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', NULL, '0.0000', NULL, '0.0000', NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL),
(647, 'P174', 'តែមេអំបៅ', '', 11, '7000.0000', '0.0000', '0.0000', 'no_image.png', '0', '0.0000', 1, '0.00', 'code39', 'standard', '', '0.0000', NULL, NULL, NULL, 0, 0, NULL, NULL, 0, '0.0000', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `tec_product_options`
--

CREATE TABLE `tec_product_options` (
  `id` int(11) NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `additional_price` decimal(25,4) DEFAULT '0.0000',
  `additional_price_wholesale` decimal(25,4) DEFAULT '0.0000',
  `group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_product_options_group`
--

CREATE TABLE `tec_product_options_group` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_product_store_qty`
--

CREATE TABLE `tec_product_store_qty` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `quantity` decimal(15,2) NOT NULL DEFAULT '0.00',
  `price` decimal(25,4) DEFAULT NULL,
  `price_wholesale` decimal(25,4) NOT NULL,
  `price_vip` decimal(25,4) NOT NULL,
  `unit_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_product_store_qty`
--

INSERT INTO `tec_product_store_qty` (`id`, `product_id`, `store_id`, `quantity`, `price`, `price_wholesale`, `price_vip`, `unit_id`) VALUES
(1, 1, 1, '-4.00', '10.0000', '0.0000', '0.0000', NULL),
(2, 2, 1, '-3.00', '3.0000', '0.0000', '0.0000', NULL),
(3, 167, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(4, 473, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(5, 472, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(6, 471, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(7, 470, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(8, 469, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(9, 467, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(10, 465, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(11, 464, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(12, 425, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(13, 461, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(14, 459, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(15, 457, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(16, 455, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(17, 454, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(18, 453, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(19, 452, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(20, 451, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(21, 450, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(22, 449, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(23, 448, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(24, 447, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(25, 446, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(26, 445, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(27, 444, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(28, 443, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(29, 442, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(30, 441, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(31, 440, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(32, 439, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(33, 438, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(34, 437, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(35, 435, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(36, 153, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(37, 433, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(38, 432, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(39, 431, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(40, 430, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(41, 429, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(42, 428, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(43, 427, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(44, 426, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(45, 424, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(46, 423, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(47, 422, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(48, 421, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(49, 419, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(50, 418, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(51, 417, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(52, 416, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(53, 414, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(54, 413, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(55, 412, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(56, 411, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(57, 409, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(58, 408, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(59, 407, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(60, 406, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(61, 405, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(62, 404, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(63, 403, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(64, 402, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(65, 460, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(66, 401, 1, '-2.00', NULL, '0.0000', '0.0000', NULL),
(67, 398, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(68, 397, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(69, 396, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(70, 395, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(71, 394, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(72, 393, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(73, 392, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(74, 391, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(75, 390, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(76, 389, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(77, 388, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(78, 387, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(79, 386, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(80, 385, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(81, 384, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(82, 383, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(83, 382, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(84, 381, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(85, 380, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(86, 379, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(87, 377, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(88, 376, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(89, 375, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(90, 374, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(91, 373, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(92, 372, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(93, 371, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(94, 370, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(95, 369, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(96, 368, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(97, 367, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(98, 366, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(99, 365, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(100, 364, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(101, 363, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(102, 362, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(103, 361, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(104, 360, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(105, 359, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(106, 358, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(107, 357, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(108, 356, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(109, 355, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(110, 354, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(111, 353, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(112, 352, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(113, 351, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(114, 350, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(115, 349, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(116, 348, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(117, 347, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(118, 346, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(119, 345, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(120, 344, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(121, 343, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(122, 342, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(123, 341, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(124, 340, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(125, 339, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(126, 338, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(127, 337, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(128, 336, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(129, 335, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(130, 334, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(131, 333, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(132, 332, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(133, 331, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(134, 330, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(135, 329, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(136, 328, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(137, 327, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(138, 326, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(139, 325, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(140, 324, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(141, 323, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(142, 322, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(143, 321, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(144, 320, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(145, 319, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(146, 318, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(147, 317, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(148, 316, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(149, 315, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(150, 314, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(151, 313, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(152, 312, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(153, 311, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(154, 310, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(155, 309, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(156, 308, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(157, 307, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(158, 306, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(159, 305, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(160, 304, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(161, 303, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(162, 302, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(163, 301, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(164, 300, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(165, 299, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(166, 298, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(167, 297, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(168, 296, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(169, 295, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(170, 294, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(171, 293, 1, '-5.00', NULL, '0.0000', '0.0000', NULL),
(172, 292, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(173, 291, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(174, 290, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(175, 289, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(176, 288, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(177, 287, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(178, 286, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(179, 285, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(180, 284, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(181, 282, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(182, 281, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(183, 280, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(184, 279, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(185, 278, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(186, 277, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(187, 276, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(188, 275, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(189, 274, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(190, 273, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(191, 272, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(192, 271, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(193, 270, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(194, 269, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(195, 268, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(196, 267, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(197, 266, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(198, 265, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(199, 264, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(200, 263, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(201, 262, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(202, 261, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(203, 260, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(204, 259, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(205, 258, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(206, 257, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(207, 256, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(208, 255, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(209, 254, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(210, 253, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(211, 252, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(212, 251, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(213, 250, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(214, 249, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(215, 248, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(216, 247, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(217, 246, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(218, 245, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(219, 244, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(220, 243, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(221, 242, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(222, 240, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(223, 239, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(224, 238, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(225, 237, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(226, 236, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(227, 235, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(228, 234, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(229, 233, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(230, 232, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(231, 231, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(232, 230, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(233, 229, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(234, 228, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(235, 227, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(236, 226, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(237, 225, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(238, 224, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(239, 223, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(240, 222, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(241, 221, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(242, 220, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(243, 219, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(244, 218, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(245, 217, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(246, 216, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(247, 215, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(248, 213, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(249, 212, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(250, 211, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(251, 209, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(252, 208, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(253, 207, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(254, 206, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(255, 205, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(256, 204, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(257, 203, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(258, 202, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(259, 201, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(260, 200, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(261, 199, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(262, 198, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(263, 197, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(264, 196, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(265, 195, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(266, 194, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(267, 193, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(268, 192, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(269, 191, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(270, 190, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(271, 189, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(272, 188, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(273, 187, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(274, 186, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(275, 185, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(276, 184, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(277, 183, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(278, 182, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(279, 181, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(280, 179, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(281, 178, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(282, 177, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(283, 176, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(284, 175, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(285, 174, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(286, 173, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(287, 172, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(288, 171, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(289, 170, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(290, 169, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(291, 168, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(292, 165, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(293, 164, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(294, 163, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(295, 161, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(296, 159, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(297, 158, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(298, 157, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(299, 156, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(300, 155, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(301, 154, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(302, 456, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(303, 434, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(304, 152, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(305, 468, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(306, 463, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(307, 150, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(308, 147, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(309, 146, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(310, 145, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(311, 144, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(312, 143, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(313, 462, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(314, 142, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(315, 141, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(316, 140, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(317, 139, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(318, 138, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(319, 137, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(320, 136, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(321, 135, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(322, 134, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(323, 151, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(324, 115, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(325, 133, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(326, 129, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(327, 127, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(328, 126, 1, '2.00', NULL, '0.0000', '0.0000', NULL),
(329, 125, 1, '3.00', NULL, '0.0000', '0.0000', NULL),
(330, 124, 1, '2.00', NULL, '0.0000', '0.0000', NULL),
(331, 123, 1, '1.00', NULL, '0.0000', '0.0000', NULL),
(332, 122, 1, '4.00', NULL, '0.0000', '0.0000', NULL),
(333, 121, 1, '5.00', NULL, '0.0000', '0.0000', NULL),
(334, 120, 1, '5.00', NULL, '0.0000', '0.0000', NULL),
(335, 119, 1, '10.00', NULL, '0.0000', '0.0000', NULL),
(336, 118, 1, '3.00', NULL, '0.0000', '0.0000', NULL),
(337, 117, 1, '17.00', NULL, '0.0000', '0.0000', NULL),
(338, 116, 1, '22.00', NULL, '0.0000', '0.0000', NULL),
(339, 458, 1, '3.00', NULL, '0.0000', '0.0000', NULL),
(340, 113, 1, '1.00', NULL, '0.0000', '0.0000', NULL),
(341, 112, 1, '1.00', NULL, '0.0000', '0.0000', NULL),
(342, 111, 1, '5.00', NULL, '0.0000', '0.0000', NULL),
(343, 110, 1, '2.00', NULL, '0.0000', '0.0000', NULL),
(344, 109, 1, '2.00', NULL, '0.0000', '0.0000', NULL),
(345, 108, 1, '2.00', NULL, '0.0000', '0.0000', NULL),
(346, 107, 1, '1.00', NULL, '0.0000', '0.0000', NULL),
(347, 106, 1, '2.00', NULL, '0.0000', '0.0000', NULL),
(348, 105, 1, '2.00', NULL, '0.0000', '0.0000', NULL),
(349, 104, 1, '2.00', NULL, '0.0000', '0.0000', NULL),
(350, 103, 1, '1.00', NULL, '0.0000', '0.0000', NULL),
(351, 102, 1, '1.00', NULL, '0.0000', '0.0000', NULL),
(352, 101, 1, '1.00', NULL, '0.0000', '0.0000', NULL),
(353, 100, 1, '2.00', NULL, '0.0000', '0.0000', NULL),
(354, 99, 1, '3.00', NULL, '0.0000', '0.0000', NULL),
(355, 98, 1, '10.00', NULL, '0.0000', '0.0000', NULL),
(356, 97, 1, '8.00', NULL, '0.0000', '0.0000', NULL),
(357, 95, 1, '2.00', NULL, '0.0000', '0.0000', NULL),
(358, 94, 1, '4.00', NULL, '0.0000', '0.0000', NULL),
(359, 93, 1, '2.00', NULL, '0.0000', '0.0000', NULL),
(360, 92, 1, '4.00', NULL, '0.0000', '0.0000', NULL),
(361, 91, 1, '10.00', NULL, '0.0000', '0.0000', NULL),
(362, 90, 1, '5.00', NULL, '0.0000', '0.0000', NULL),
(363, 89, 1, '10.00', NULL, '0.0000', '0.0000', NULL),
(364, 88, 1, '6.00', NULL, '0.0000', '0.0000', NULL),
(365, 87, 1, '4.00', NULL, '0.0000', '0.0000', NULL),
(366, 86, 1, '3.00', NULL, '0.0000', '0.0000', NULL),
(367, 85, 1, '1.00', NULL, '0.0000', '0.0000', NULL),
(368, 84, 1, '1.00', NULL, '0.0000', '0.0000', NULL),
(369, 83, 1, '1.00', NULL, '0.0000', '0.0000', NULL),
(370, 82, 1, '5.00', NULL, '0.0000', '0.0000', NULL),
(371, 81, 1, '4.00', NULL, '0.0000', '0.0000', NULL),
(372, 80, 1, '4.00', NULL, '0.0000', '0.0000', NULL),
(373, 79, 1, '5.00', NULL, '0.0000', '0.0000', NULL),
(374, 78, 1, '4.00', NULL, '0.0000', '0.0000', NULL),
(375, 77, 1, '4.00', NULL, '0.0000', '0.0000', NULL),
(376, 76, 1, '5.00', NULL, '0.0000', '0.0000', NULL),
(377, 75, 1, '5.00', NULL, '0.0000', '0.0000', NULL),
(378, 74, 1, '4.00', NULL, '0.0000', '0.0000', NULL),
(379, 73, 1, '2.00', NULL, '0.0000', '0.0000', NULL),
(380, 72, 1, '1.00', NULL, '0.0000', '0.0000', NULL),
(381, 71, 1, '6.00', NULL, '0.0000', '0.0000', NULL),
(382, 70, 1, '11.00', NULL, '0.0000', '0.0000', NULL),
(383, 69, 1, '8.00', NULL, '0.0000', '0.0000', NULL),
(384, 68, 1, '11.00', NULL, '0.0000', '0.0000', NULL),
(385, 67, 1, '9.00', NULL, '0.0000', '0.0000', NULL),
(386, 66, 1, '2.00', NULL, '0.0000', '0.0000', NULL),
(387, 64, 1, '3.00', NULL, '0.0000', '0.0000', NULL),
(388, 63, 1, '2.00', NULL, '0.0000', '0.0000', NULL),
(389, 62, 1, '11.00', NULL, '0.0000', '0.0000', NULL),
(390, 61, 1, '4.00', NULL, '0.0000', '0.0000', NULL),
(391, 60, 1, '11.00', NULL, '0.0000', '0.0000', NULL),
(392, 59, 1, '6.00', NULL, '0.0000', '0.0000', NULL),
(393, 58, 1, '2.00', NULL, '0.0000', '0.0000', NULL),
(394, 57, 1, '2.00', NULL, '0.0000', '0.0000', NULL),
(395, 56, 1, '2.00', NULL, '0.0000', '0.0000', NULL),
(396, 55, 1, '4.00', NULL, '0.0000', '0.0000', NULL),
(397, 54, 1, '2.00', NULL, '0.0000', '0.0000', NULL),
(398, 51, 1, '4.00', NULL, '0.0000', '0.0000', NULL),
(399, 50, 1, '4.00', NULL, '0.0000', '0.0000', NULL),
(400, 49, 1, '10.00', NULL, '0.0000', '0.0000', NULL),
(401, 48, 1, '9.00', NULL, '0.0000', '0.0000', NULL),
(402, 47, 1, '3.00', NULL, '0.0000', '0.0000', NULL),
(403, 46, 1, '2.00', NULL, '0.0000', '0.0000', NULL),
(404, 45, 1, '3.00', NULL, '0.0000', '0.0000', NULL),
(405, 44, 1, '10.00', NULL, '0.0000', '0.0000', NULL),
(406, 43, 1, '8.00', NULL, '0.0000', '0.0000', NULL),
(407, 42, 1, '2.00', NULL, '0.0000', '0.0000', NULL),
(408, 41, 1, '1.00', NULL, '0.0000', '0.0000', NULL),
(409, 40, 1, '8.00', NULL, '0.0000', '0.0000', NULL),
(410, 39, 1, '1.00', NULL, '0.0000', '0.0000', NULL),
(411, 38, 1, '1.00', NULL, '0.0000', '0.0000', NULL),
(412, 37, 1, '1.00', NULL, '0.0000', '0.0000', NULL),
(413, 36, 1, '1.00', NULL, '0.0000', '0.0000', NULL),
(414, 35, 1, '3.00', NULL, '0.0000', '0.0000', NULL),
(415, 34, 1, '5.00', NULL, '0.0000', '0.0000', NULL),
(416, 32, 1, '7.00', NULL, '0.0000', '0.0000', NULL),
(417, 30, 1, '1.00', NULL, '0.0000', '0.0000', NULL),
(418, 28, 1, '5.00', NULL, '0.0000', '0.0000', NULL),
(419, 27, 1, '2.00', NULL, '0.0000', '0.0000', NULL),
(420, 26, 1, '5.00', NULL, '0.0000', '0.0000', NULL),
(421, 25, 1, '5.00', NULL, '0.0000', '0.0000', NULL),
(422, 24, 1, '4.00', NULL, '0.0000', '0.0000', NULL),
(423, 23, 1, '6.00', NULL, '0.0000', '0.0000', NULL),
(424, 22, 1, '1.00', NULL, '0.0000', '0.0000', NULL),
(425, 21, 1, '8.00', NULL, '0.0000', '0.0000', NULL),
(426, 20, 1, '2.00', NULL, '0.0000', '0.0000', NULL),
(427, 19, 1, '3.00', NULL, '0.0000', '0.0000', NULL),
(428, 18, 1, '1.00', NULL, '0.0000', '0.0000', NULL),
(429, 17, 1, '4.00', NULL, '0.0000', '0.0000', NULL),
(430, 16, 1, '6.00', NULL, '0.0000', '0.0000', NULL),
(431, 15, 1, '3.00', NULL, '0.0000', '0.0000', NULL),
(432, 14, 1, '3.00', NULL, '0.0000', '0.0000', NULL),
(433, 13, 1, '1.00', NULL, '0.0000', '0.0000', NULL),
(434, 12, 1, '2.00', NULL, '0.0000', '0.0000', NULL),
(435, 11, 1, '0.00', NULL, '0.0000', '0.0000', NULL),
(436, 10, 1, '6.00', NULL, '0.0000', '0.0000', NULL),
(437, 9, 1, '4.00', NULL, '0.0000', '0.0000', NULL),
(438, 8, 1, '1.00', NULL, '0.0000', '0.0000', NULL),
(439, 7, 1, '4.00', NULL, '0.0000', '0.0000', NULL),
(440, 6, 1, '4.00', NULL, '0.0000', '0.0000', NULL),
(441, 5, 1, '1.00', NULL, '0.0000', '0.0000', NULL),
(442, 4, 1, '1.00', NULL, '0.0000', '0.0000', NULL),
(443, 3, 1, '3.00', NULL, '0.0000', '0.0000', NULL),
(444, 483, 1, '-1.00', '12000.0000', '0.0000', '0.0000', NULL),
(445, 484, 1, '-1.00', '14000.0000', '0.0000', '0.0000', NULL),
(446, 485, 1, '-1.00', '14000.0000', '0.0000', '0.0000', NULL),
(447, 474, 1, '-1.00', '12000.0000', '0.0000', '0.0000', NULL),
(448, 647, 1, '0.00', '7000.0000', '0.0000', '0.0000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tec_purchases`
--

CREATE TABLE `tec_purchases` (
  `id` int(11) NOT NULL,
  `reference` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `received` tinyint(1) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1',
  `discount` decimal(25,4) DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_purchase_items`
--

CREATE TABLE `tec_purchase_items` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(15,2) NOT NULL,
  `cost` decimal(25,4) NOT NULL,
  `subtotal` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_registers`
--

CREATE TABLE `tec_registers` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) DEFAULT NULL,
  `total_cheques_submitted` int(11) DEFAULT NULL,
  `total_cc_slips_submitted` int(11) DEFAULT NULL,
  `note` text,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1',
  `cash_sales` decimal(25,4) DEFAULT '0.0000',
  `ch_sales` decimal(25,4) DEFAULT '0.0000',
  `cc_sales` decimal(25,4) DEFAULT '0.0000',
  `gc_sales` decimal(25,4) DEFAULT '0.0000',
  `other_sales` decimal(25,4) DEFAULT '0.0000',
  `total_sales` decimal(25,4) DEFAULT '0.0000',
  `nbr_sales` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `total_cash_1` decimal(25,4) DEFAULT NULL,
  `total_cash_2` decimal(25,4) DEFAULT NULL,
  `total_cash_3` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_registers`
--

INSERT INTO `tec_registers` (`id`, `date`, `user_id`, `cash_in_hand`, `status`, `total_cash`, `total_cheques`, `total_cc_slips`, `total_cash_submitted`, `total_cheques_submitted`, `total_cc_slips_submitted`, `note`, `closed_at`, `transfer_opened_bills`, `closed_by`, `store_id`, `cash_sales`, `ch_sales`, `cc_sales`, `gc_sales`, `other_sales`, `total_sales`, `nbr_sales`, `total_cash_1`, `total_cash_2`, `total_cash_3`) VALUES
(1, '2022-02-28 07:54:15', 1, '0.0000', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tec_sales`
--

CREATE TABLE `tec_sales` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(55) NOT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` varchar(20) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) NOT NULL,
  `total_items` int(11) DEFAULT NULL,
  `total_quantity` decimal(15,2) DEFAULT NULL,
  `paid` decimal(25,4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `rounding` decimal(25,4) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1',
  `hold_ref` varchar(255) DEFAULT NULL,
  `date_in` datetime DEFAULT NULL,
  `date_out` datetime DEFAULT NULL,
  `waiting_number` int(11) NOT NULL,
  `total_cost` decimal(25,4) DEFAULT NULL,
  `delivery_by` varchar(255) DEFAULT NULL,
  `delivery_status` varchar(100) DEFAULT NULL,
  `delivery_note` varchar(255) DEFAULT NULL,
  `delivery_staff` varchar(255) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `delivery_attachment` varchar(255) DEFAULT NULL,
  `next_payment` date DEFAULT NULL,
  `alert_payment_day` int(11) DEFAULT NULL,
  `inv_number` int(11) DEFAULT NULL,
  `sale_customer_group` int(11) DEFAULT NULL,
  `customer_group_name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_sales`
--

INSERT INTO `tec_sales` (`id`, `date`, `customer_id`, `customer_name`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `grand_total`, `total_items`, `total_quantity`, `paid`, `created_by`, `updated_by`, `updated_at`, `note`, `status`, `rounding`, `store_id`, `hold_ref`, `date_in`, `date_out`, `waiting_number`, `total_cost`, `delivery_by`, `delivery_status`, `delivery_note`, `delivery_staff`, `delivery_date`, `delivery_attachment`, `next_payment`, `alert_payment_day`, `inv_number`, `sale_customer_group`, `customer_group_name`) VALUES
(1, '2022-03-03 12:49:44', 1, 'ទូទៅ', '52000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '52000.0000', 4, '4.00', '52000.0000', 1, NULL, NULL, '', 'paid', '0.0000', 1, 'ទូទៅ', NULL, '2022-03-03 12:49:44', 6, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tec_sale_items`
--

CREATE TABLE `tec_sale_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(15,2) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `tax` int(20) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT '0.0000',
  `product_code` varchar(150) DEFAULT NULL,
  `product_name` varchar(150) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `next_service_date` date DEFAULT NULL,
  `length` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_sale_items`
--

INSERT INTO `tec_sale_items` (`id`, `sale_id`, `product_id`, `quantity`, `unit_price`, `net_unit_price`, `discount`, `item_discount`, `tax`, `item_tax`, `subtotal`, `real_unit_price`, `cost`, `product_code`, `product_name`, `comment`, `next_service_date`, `length`) VALUES
(1, 1, 483, '1.00', '12000.0000', '12000.0000', '0', '0.0000', 0, '0.0000', '12000.0000', '12000.0000', '0.0000', 'P010', 'លតឆាគ្រឿងសមុទ្រ', '', NULL, NULL),
(2, 1, 484, '1.00', '14000.0000', '14000.0000', '0', '0.0000', 0, '0.0000', '14000.0000', '14000.0000', '0.0000', 'P011', 'បាយឆាឡុកឡាក់', '', NULL, NULL),
(3, 1, 485, '1.00', '14000.0000', '14000.0000', '0', '0.0000', 0, '0.0000', '14000.0000', '14000.0000', '0.0000', 'P012', 'បាយឆាម្រះព្រៅ', '', NULL, NULL),
(4, 1, 474, '1.00', '12000.0000', '12000.0000', '0', '0.0000', 0, '0.0000', '12000.0000', '12000.0000', '0.0000', 'P001', 'ហ្វឹ', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tec_sessions`
--

CREATE TABLE `tec_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_sessions`
--

INSERT INTO `tec_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('0vklj5glj43bjkdpqrdd5qsg18kgsuav', '::1', 1646993617, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634363939333630373b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a353a2261646d696e223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a225375706572223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031303a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363436393632383639223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b7465726d696e616c5f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30322d32382031343a35343a3135223b),
('1622n3p38fdkpvt6ddf3tc8fd2jf2f00', '::1', 1646289195, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634363238393133343b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a353a2261646d696e223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a225375706572223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031303a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363436303334373438223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b7465726d696e616c5f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30322d32382031343a35343a3135223b),
('2043utjdmlfvkf3oe1vsuajqcrqkrdfi', '::1', 1646905287, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634363930353236313b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a353a2261646d696e223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a225375706572223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031303a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363436323836343937223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b7465726d696e616c5f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30322d32382031343a35343a3135223b),
('413nqpndmjlrqco95soepeojuj85igk4', '::1', 1647223516, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634373232333531363b),
('cekioht57bsq0dim7cf00ggpmsoni8d5', '::1', 1646034882, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634363033343734383b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a353a2261646d696e223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a225375706572223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031303a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363436303334363937223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b7465726d696e616c5f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30322d32382031343a35343a3135223b),
('d72251i348c3o3m0nj3l9jmjecdckfs6', '::1', 1646288564, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634363238383536343b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a353a2261646d696e223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a225375706572223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031303a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363436303334373438223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b7465726d696e616c5f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30322d32382031343a35343a3135223b),
('gra6e2q0gnldq869s80tb81folgq6pcd', '::1', 1646286808, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634363238363830383b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a353a2261646d696e223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a225375706572223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031303a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363436303334373438223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b7465726d696e616c5f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30322d32382031343a35343a3135223b),
('hgcotdb3huqj2ham5765nhnog8rtgun3', '::1', 1647046680, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634373034363638303b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a353a2261646d696e223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a225375706572223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031303a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363436393933363038223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b7465726d696e616c5f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30322d32382031343a35343a3135223b),
('jcj4gt20lgu8em6pb2hs5l1e2q2tt1tr', '::1', 1646803997, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634363830333939363b),
('pms98du8ek61fv1dieuss7ivednf8eeg', '::1', 1647224452, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634373232343435323b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a353a2261646d696e223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a225375706572223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031303a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363437303436333339223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b7465726d696e616c5f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30322d32382031343a35343a3135223b),
('qi67epgc3m7l215gphct20kkenakk5ig', '::1', 1647046710, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634373034363638303b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a353a2261646d696e223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a225375706572223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031303a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363436393933363038223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b7465726d696e616c5f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30322d32382031343a35343a3135223b),
('rb1v091moih5e7sc5kgf2ooqt28ffjuc', '::1', 1646962873, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634363936323832333b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a353a2261646d696e223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a225375706572223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031303a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363436393035323735223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b7465726d696e616c5f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30322d32382031343a35343a3135223b),
('t7932n8vrrb9348ll6s7i495o3agkrev', '::1', 1646289134, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634363238393133343b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a353a2261646d696e223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a225375706572223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031303a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363436303334373438223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b7465726d696e616c5f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30322d32382031343a35343a3135223b),
('v3j5imd01m8fpcnijrfb521evvkqiuog', '::1', 1647224564, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634373232343435323b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a353a2261646d696e223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a225375706572223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031303a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363437303436333339223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b7465726d696e616c5f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032322d30322d32382031343a35343a3135223b);

-- --------------------------------------------------------

--
-- Table structure for table `tec_settings`
--

CREATE TABLE `tec_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `dateformat` varchar(25) DEFAULT NULL,
  `timeformat` varchar(20) DEFAULT NULL,
  `default_email` varchar(100) NOT NULL,
  `language` varchar(20) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `theme` varchar(20) NOT NULL,
  `timezone` varchar(255) NOT NULL DEFAULT '0',
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `smtp_host` varchar(255) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(5) DEFAULT NULL,
  `mmode` tinyint(1) NOT NULL,
  `captcha` tinyint(1) NOT NULL DEFAULT '1',
  `mailpath` varchar(55) DEFAULT NULL,
  `currency_prefix` varchar(3) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_tax_rate` varchar(20) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `total_rows` int(2) NOT NULL,
  `header` varchar(1000) DEFAULT NULL,
  `footer` varchar(1000) DEFAULT NULL,
  `bsty` tinyint(4) NOT NULL,
  `display_kb` tinyint(4) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_discount` varchar(20) NOT NULL,
  `item_addition` tinyint(1) NOT NULL,
  `barcode_symbology` varchar(55) DEFAULT NULL,
  `pro_limit` tinyint(4) NOT NULL,
  `decimals` tinyint(1) NOT NULL DEFAULT '2',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_order` varchar(55) DEFAULT NULL,
  `print_bill` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `char_per_line` tinyint(4) DEFAULT '42',
  `rounding` tinyint(1) DEFAULT '0',
  `pin_code` varchar(20) DEFAULT NULL,
  `stripe` tinyint(1) DEFAULT NULL,
  `stripe_secret_key` varchar(100) DEFAULT NULL,
  `stripe_publishable_key` varchar(100) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `theme_style` varchar(25) DEFAULT 'green',
  `after_sale_page` tinyint(1) DEFAULT NULL,
  `overselling` tinyint(1) DEFAULT '1',
  `multi_store` tinyint(1) DEFAULT NULL,
  `qty_decimals` tinyint(1) DEFAULT '2',
  `symbol` varchar(55) DEFAULT NULL,
  `sac` tinyint(1) DEFAULT '0',
  `display_symbol` tinyint(1) DEFAULT NULL,
  `remote_printing` tinyint(1) DEFAULT '1',
  `printer` int(11) DEFAULT NULL,
  `order_printers` varchar(55) DEFAULT NULL,
  `auto_print` tinyint(1) DEFAULT '0',
  `local_printers` tinyint(1) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT NULL,
  `print_img` tinyint(1) DEFAULT NULL,
  `exchange_rate` decimal(10,2) NOT NULL,
  `exchange_rate2` decimal(10,2) NOT NULL,
  `exchange_rate_symbol` varchar(10) DEFAULT NULL,
  `exchange_rate_multiply` varchar(1) DEFAULT NULL,
  `exchange_rate2_symbol` varchar(10) DEFAULT NULL,
  `exchange_rate2_multiply` varchar(1) DEFAULT NULL,
  `show_wholesale` tinyint(1) NOT NULL,
  `hold_customer` tinyint(1) NOT NULL,
  `label_fontsize` tinyint(1) NOT NULL,
  `label_width` tinyint(1) NOT NULL,
  `label_height` tinyint(1) NOT NULL,
  `show_itemdiscount` tinyint(1) NOT NULL,
  `show_exc_paid` tinyint(1) NOT NULL DEFAULT '1',
  `show_refbarcode` tinyint(1) NOT NULL,
  `show_date_inout` tinyint(1) NOT NULL,
  `waiting_number` int(11) NOT NULL,
  `show_waiting_number` tinyint(1) NOT NULL,
  `multistore_quantity` tinyint(1) NOT NULL,
  `customer_as_holdref` tinyint(1) NOT NULL,
  `show_changedecimal` tinyint(1) NOT NULL,
  `show_inclusive_tax` tinyint(1) NOT NULL,
  `multistore_product` tinyint(1) NOT NULL,
  `show_icesugar` tinyint(1) NOT NULL,
  `auto_print_order` tinyint(1) NOT NULL,
  `print_order_label` tinyint(1) NOT NULL,
  `receipt_font_size` tinyint(1) NOT NULL,
  `print_customer_label` tinyint(1) NOT NULL,
  `show_unit` tinyint(1) NOT NULL,
  `show_expiry` tinyint(1) NOT NULL,
  `staff_change_pos_price` tinyint(1) NOT NULL,
  `staff_change_pos_discount` tinyint(1) NOT NULL,
  `show_product_service` tinyint(1) NOT NULL,
  `show_drink_ingredient` tinyint(1) NOT NULL DEFAULT '1',
  `pos_prodtype_filter` tinyint(4) NOT NULL DEFAULT '0',
  `show_delivery` tinyint(4) NOT NULL DEFAULT '0',
  `show_alert_payment` tinyint(4) NOT NULL DEFAULT '0',
  `show_orderbill` tinyint(4) DEFAULT '1',
  `telegram_notification` tinyint(4) DEFAULT '0',
  `receipt_format` tinyint(4) DEFAULT '0',
  `show_product_options` tinyint(4) NOT NULL DEFAULT '0',
  `product_second_name` tinyint(4) NOT NULL DEFAULT '0',
  `each_spent` decimal(25,4) DEFAULT NULL,
  `ca_point` decimal(25,4) DEFAULT NULL,
  `each_sale` decimal(25,4) DEFAULT NULL,
  `sa_point` decimal(25,4) DEFAULT NULL,
  `show_item_length` tinyint(1) NOT NULL DEFAULT '0',
  `ws_barcode_type` varchar(40) DEFAULT 'weight',
  `ws_barcode_chars` int(11) DEFAULT NULL,
  `flag_chars` int(11) DEFAULT NULL,
  `item_code_start` int(11) DEFAULT NULL,
  `item_code_chars` int(11) DEFAULT NULL,
  `price_start` int(11) DEFAULT NULL,
  `price_chars` int(11) DEFAULT NULL,
  `price_divide_by` int(11) DEFAULT NULL,
  `weight_start` int(11) DEFAULT NULL,
  `weight_chars` int(11) DEFAULT NULL,
  `weight_divide_by` int(11) DEFAULT NULL,
  `show_previous_due` tinyint(4) NOT NULL DEFAULT '0',
  `pos_printer_margin` tinyint(4) NOT NULL DEFAULT '0',
  `show_customer_group` tinyint(4) DEFAULT '0',
  `telegram_chat_id` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_settings`
--

INSERT INTO `tec_settings` (`setting_id`, `logo`, `site_name`, `tel`, `dateformat`, `timeformat`, `default_email`, `language`, `version`, `theme`, `timezone`, `protocol`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `mmode`, `captcha`, `mailpath`, `currency_prefix`, `default_customer`, `default_tax_rate`, `rows_per_page`, `total_rows`, `header`, `footer`, `bsty`, `display_kb`, `default_category`, `default_discount`, `item_addition`, `barcode_symbology`, `pro_limit`, `decimals`, `thousands_sep`, `decimals_sep`, `focus_add_item`, `add_customer`, `toggle_category_slider`, `cancel_sale`, `suspend_sale`, `print_order`, `print_bill`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `java_applet`, `receipt_printer`, `pos_printers`, `cash_drawer_codes`, `char_per_line`, `rounding`, `pin_code`, `stripe`, `stripe_secret_key`, `stripe_publishable_key`, `purchase_code`, `envato_username`, `theme_style`, `after_sale_page`, `overselling`, `multi_store`, `qty_decimals`, `symbol`, `sac`, `display_symbol`, `remote_printing`, `printer`, `order_printers`, `auto_print`, `local_printers`, `rtl`, `print_img`, `exchange_rate`, `exchange_rate2`, `exchange_rate_symbol`, `exchange_rate_multiply`, `exchange_rate2_symbol`, `exchange_rate2_multiply`, `show_wholesale`, `hold_customer`, `label_fontsize`, `label_width`, `label_height`, `show_itemdiscount`, `show_exc_paid`, `show_refbarcode`, `show_date_inout`, `waiting_number`, `show_waiting_number`, `multistore_quantity`, `customer_as_holdref`, `show_changedecimal`, `show_inclusive_tax`, `multistore_product`, `show_icesugar`, `auto_print_order`, `print_order_label`, `receipt_font_size`, `print_customer_label`, `show_unit`, `show_expiry`, `staff_change_pos_price`, `staff_change_pos_discount`, `show_product_service`, `show_drink_ingredient`, `pos_prodtype_filter`, `show_delivery`, `show_alert_payment`, `show_orderbill`, `telegram_notification`, `receipt_format`, `show_product_options`, `product_second_name`, `each_spent`, `ca_point`, `each_sale`, `sa_point`, `show_item_length`, `ws_barcode_type`, `ws_barcode_chars`, `flag_chars`, `item_code_start`, `item_code_chars`, `price_start`, `price_chars`, `price_divide_by`, `weight_start`, `weight_chars`, `weight_divide_by`, `show_previous_due`, `pos_printer_margin`, `show_customer_group`, `telegram_chat_id`) VALUES
(1, 'logo1.png', 'SimplePOS', '087 247 998', 'D j M Y', 'h:i A', 'cambodiatechtips@gmail.com', 'english', '4.0.24', 'default', 'Asia/Kuala_Lumpur', 'mail', 'smtp.gmail.com', '', '', '587', '', 0, 0, NULL, 'USD', 1, '0', 10, 30, NULL, NULL, 3, 0, 0, '0', 0, NULL, 21, 2, ',', '.', 'ALT+F1', 'ALT+F2', 'ALT+F10', 'ALT+F5', 'ALT+F6', 'ALT+F11', 'ALT+F12', 'ALT+F8', 'Ctrl+F1', 'Ctrl+F2', 'ALT+F7', 0, '', '', '', 42, 0, NULL, 0, '123', '123', '65806230-5697-4f94-89f4-49275c3c19d8', 'sgr1875', 'blue', 1, 1, 0, 0, '$', 0, 1, 1, NULL, 'null', 1, 0, 0, 0, '4000.00', '0.00', '៛', '*', 'B', '*', 0, 0, 8, 40, 25, 0, 1, 0, 0, 7, 0, 0, 1, 0, 0, 0, 0, 0, 0, 10, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '0.0000', '0.0000', '0.0000', '0.0000', 0, 'weight', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `tec_stores`
--

CREATE TABLE `tec_stores` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `code` varchar(20) NOT NULL,
  `logo` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `phone` varchar(250) NOT NULL,
  `address1` varchar(250) DEFAULT NULL,
  `address2` varchar(250) DEFAULT NULL,
  `city` varchar(250) DEFAULT NULL,
  `state` varchar(250) DEFAULT NULL,
  `postal_code` varchar(250) DEFAULT NULL,
  `country` varchar(250) DEFAULT NULL,
  `currency_code` varchar(3) DEFAULT NULL,
  `receipt_header` text,
  `receipt_footer` text,
  `promotion_photo` varchar(250) DEFAULT NULL,
  `inv_number` int(11) NOT NULL DEFAULT '0',
  `aba_qrstring` varchar(250) DEFAULT NULL,
  `acleda_qrstring` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_stores`
--

INSERT INTO `tec_stores` (`id`, `name`, `code`, `logo`, `email`, `phone`, `address1`, `address2`, `city`, `state`, `postal_code`, `country`, `currency_code`, `receipt_header`, `receipt_footer`, `promotion_photo`, `inv_number`, `aba_qrstring`, `acleda_qrstring`) VALUES
(1, 'SimplePOS', 'POS', 'da71338f3432d26bab24862f4ec7a4ed.png', 'store@gmail.com', '087 247 998', 'ផ្ទះលេខ១០, ផ្លូវ២៧១', 'ទឹកល្អក់៣, ទួលគោក', 'ភ្នំពេញ', '', '', '', 'USD', 'Header', 'ABA : 123123\r\nACD :13123123\r\nសូមអរគុណ', '', 7, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tec_suppliers`
--

CREATE TABLE `tec_suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cf1` varchar(255) NOT NULL,
  `cf2` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_suppliers`
--

INSERT INTO `tec_suppliers` (`id`, `name`, `cf1`, `cf2`, `phone`, `email`) VALUES
(1, 'LAY SOKKONG', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tec_suspended_items`
--

CREATE TABLE `tec_suspended_items` (
  `id` int(11) NOT NULL,
  `suspend_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(15,2) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `tax` int(20) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_code` varchar(150) DEFAULT NULL,
  `product_name` varchar(250) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `next_service_date` date DEFAULT NULL,
  `length` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_suspended_sales`
--

CREATE TABLE `tec_suspended_sales` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(55) NOT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` varchar(20) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) NOT NULL,
  `total_items` int(11) DEFAULT NULL,
  `total_quantity` decimal(15,2) DEFAULT NULL,
  `paid` decimal(25,4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `hold_ref` varchar(255) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1',
  `date_in` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_unit`
--

CREATE TABLE `tec_unit` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_users`
--

CREATE TABLE `tec_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT '2',
  `store_id` int(11) DEFAULT NULL,
  `terminal_id` int(11) NOT NULL DEFAULT '1',
  `award_points` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_users`
--

INSERT INTO `tec_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `store_id`, `terminal_id`, `award_points`) VALUES
(1, 0x3a3a31, 0x3132372e302e302e31, 'admin', 'fe941d48eb1fbce34b4588ae500861570fb0e398', NULL, 'admin', NULL, NULL, NULL, 'b2d2c8fd5d9a5f19901279ac74cec92dc15ac970', 1435204774, 1647223517, 1, 'Super', 'Admin', 'Tecdiary', '012345678', NULL, 'male', 1, NULL, 1, NULL),
(2, 0x3a3a31, 0x3a3a31, 'cashier1', '8a66653cb3e09304d2eb60be2c3676131af39be8', NULL, 'cashier1', NULL, NULL, NULL, 'dd1b0d4bb7a8dcb6a7ae358b708bff58fad580cb', 1568090038, 1568090054, 1, 'Cashier', '1', NULL, '123', NULL, 'male', 2, 1, 1, NULL),
(3, 0x3a3a31, 0x3a3a31, 'stock', '5c1ec787b07caa0b34add26027600b284ebacbd6', NULL, '', NULL, NULL, NULL, '6f812791cef21a3c2a5db57189e811b238165cef', 1645675226, 1645683061, 1, 'Test', 'Stock', NULL, '', NULL, 'male', 3, 1, 1, NULL),
(4, 0x3a3a31, 0x3a3a31, 'sup', '37e4d98abc8675d3e49bff7a7260c544866feb7d', NULL, '', NULL, NULL, NULL, '663160bcba39aded2eebf87a0050053a62c7b5af', 1645683929, 1645684160, 1, 'Test', 'Supervisor', NULL, '', NULL, 'male', 9, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tec_user_logins`
--

CREATE TABLE `tec_user_logins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_user_logins`
--

INSERT INTO `tec_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(1, 1, NULL, 0x3a3a31, 'admin', '2022-02-22 04:48:43'),
(2, 1, NULL, 0x3a3a31, 'admin', '2022-02-23 08:08:13'),
(3, 1, NULL, 0x3a3a31, 'admin', '2022-02-24 03:56:14'),
(4, 3, NULL, 0x3a3a31, 'stock', '2022-02-24 04:03:09'),
(5, 1, NULL, 0x3a3a31, 'admin', '2022-02-24 05:31:02'),
(6, 3, NULL, 0x3a3a31, 'stock', '2022-02-24 06:07:58'),
(7, 3, NULL, 0x3a3a31, 'stock', '2022-02-24 06:09:05'),
(8, 3, NULL, 0x3a3a31, 'stock', '2022-02-24 06:09:55'),
(9, 3, NULL, 0x3a3a31, 'stock', '2022-02-24 06:11:01'),
(10, 1, NULL, 0x3a3a31, 'admin', '2022-02-24 06:25:05'),
(11, 4, NULL, 0x3a3a31, 'sup', '2022-02-24 06:27:37'),
(12, 4, NULL, 0x3a3a31, 'sup', '2022-02-24 06:29:20'),
(13, 1, NULL, 0x3a3a31, 'admin', '2022-02-24 06:34:56'),
(14, 1, NULL, 0x3a3a31, 'admin', '2022-02-25 01:09:03'),
(15, 1, NULL, 0x3a3a31, 'admin', '2022-02-28 07:51:37'),
(16, 1, NULL, 0x3a3a31, 'admin', '2022-03-03 05:48:17'),
(17, 1, NULL, 0x3a3a31, 'admin', '2022-03-10 09:41:15'),
(18, 1, NULL, 0x3a3a31, 'admin', '2022-03-11 01:41:09'),
(19, 1, NULL, 0x3a3a31, 'admin', '2022-03-12 00:52:19'),
(20, 1, NULL, 0x3a3a31, 'admin', '2022-03-14 02:05:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tec_adjustments`
--
ALTER TABLE `tec_adjustments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_adjustment_items`
--
ALTER TABLE `tec_adjustment_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_categories`
--
ALTER TABLE `tec_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_combo_items`
--
ALTER TABLE `tec_combo_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_customers`
--
ALTER TABLE `tec_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_customer_group`
--
ALTER TABLE `tec_customer_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_expenses`
--
ALTER TABLE `tec_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_gift_cards`
--
ALTER TABLE `tec_gift_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `card_no` (`card_no`);

--
-- Indexes for table `tec_groups`
--
ALTER TABLE `tec_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_login_attempts`
--
ALTER TABLE `tec_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_payments`
--
ALTER TABLE `tec_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_printers`
--
ALTER TABLE `tec_printers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_products`
--
ALTER TABLE `tec_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `tec_product_options`
--
ALTER TABLE `tec_product_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_product_options_group`
--
ALTER TABLE `tec_product_options_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_product_store_qty`
--
ALTER TABLE `tec_product_store_qty`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `tec_purchases`
--
ALTER TABLE `tec_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_purchase_items`
--
ALTER TABLE `tec_purchase_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_registers`
--
ALTER TABLE `tec_registers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_sales`
--
ALTER TABLE `tec_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_sale_items`
--
ALTER TABLE `tec_sale_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_sessions`
--
ALTER TABLE `tec_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `tec_settings`
--
ALTER TABLE `tec_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `tec_stores`
--
ALTER TABLE `tec_stores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_suppliers`
--
ALTER TABLE `tec_suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_suspended_items`
--
ALTER TABLE `tec_suspended_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_suspended_sales`
--
ALTER TABLE `tec_suspended_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_unit`
--
ALTER TABLE `tec_unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_users`
--
ALTER TABLE `tec_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `tec_user_logins`
--
ALTER TABLE `tec_user_logins`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tec_adjustments`
--
ALTER TABLE `tec_adjustments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tec_adjustment_items`
--
ALTER TABLE `tec_adjustment_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tec_categories`
--
ALTER TABLE `tec_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tec_combo_items`
--
ALTER TABLE `tec_combo_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tec_customers`
--
ALTER TABLE `tec_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tec_customer_group`
--
ALTER TABLE `tec_customer_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tec_expenses`
--
ALTER TABLE `tec_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tec_gift_cards`
--
ALTER TABLE `tec_gift_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tec_groups`
--
ALTER TABLE `tec_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tec_login_attempts`
--
ALTER TABLE `tec_login_attempts`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tec_payments`
--
ALTER TABLE `tec_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tec_printers`
--
ALTER TABLE `tec_printers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tec_products`
--
ALTER TABLE `tec_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=648;

--
-- AUTO_INCREMENT for table `tec_product_options`
--
ALTER TABLE `tec_product_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tec_product_options_group`
--
ALTER TABLE `tec_product_options_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tec_product_store_qty`
--
ALTER TABLE `tec_product_store_qty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=449;

--
-- AUTO_INCREMENT for table `tec_purchases`
--
ALTER TABLE `tec_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tec_purchase_items`
--
ALTER TABLE `tec_purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tec_registers`
--
ALTER TABLE `tec_registers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tec_sales`
--
ALTER TABLE `tec_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tec_sale_items`
--
ALTER TABLE `tec_sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tec_stores`
--
ALTER TABLE `tec_stores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tec_suppliers`
--
ALTER TABLE `tec_suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tec_suspended_items`
--
ALTER TABLE `tec_suspended_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `tec_suspended_sales`
--
ALTER TABLE `tec_suspended_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tec_unit`
--
ALTER TABLE `tec_unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tec_users`
--
ALTER TABLE `tec_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tec_user_logins`
--
ALTER TABLE `tec_user_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
