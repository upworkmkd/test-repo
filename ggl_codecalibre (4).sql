-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2024 at 08:51 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ggl_codecalibre`
--

-- --------------------------------------------------------

--
-- Table structure for table `access`
--

CREATE TABLE `access` (
  `access_id` int(11) NOT NULL,
  `access_level_id` int(11) NOT NULL,
  `access_module_id` int(11) NOT NULL,
  `access_view` int(11) DEFAULT 0,
  `access_insert` int(11) DEFAULT 0,
  `access_update` int(11) DEFAULT 0,
  `access_delete` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `access_level`
--

CREATE TABLE `access_level` (
  `access_level_id` int(11) NOT NULL,
  `access_level_name` varchar(45) DEFAULT NULL,
  `access_level_description` varchar(130) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `acl`
--

CREATE TABLE `acl` (
  `ai` int(10) UNSIGNED NOT NULL,
  `action_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `acl_actions`
--

CREATE TABLE `acl_actions` (
  `action_id` int(10) UNSIGNED NOT NULL,
  `action_code` varchar(100) NOT NULL COMMENT 'No periods allowed!',
  `action_desc` varchar(100) NOT NULL COMMENT 'Human readable description',
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `acl_categories`
--

CREATE TABLE `acl_categories` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_code` varchar(100) NOT NULL COMMENT 'No periods allowed!',
  `category_desc` varchar(100) NOT NULL COMMENT 'Human readable description'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

CREATE TABLE `actions` (
  `id` int(11) NOT NULL,
  `action` varchar(500) NOT NULL,
  `table` varchar(225) NOT NULL,
  `to_what` varchar(225) NOT NULL,
  `who_did_it` int(11) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `post_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `api_token`
--

CREATE TABLE `api_token` (
  `id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_sessions`
--

CREATE TABLE `auth_sessions` (
  `id` varchar(128) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `login_time` datetime DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ip_address` varchar(45) NOT NULL,
  `user_agent` varchar(60) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bom_base_price`
--

CREATE TABLE `bom_base_price` (
  `ID` int(11) NOT NULL,
  `Parent_Part_Number` varchar(100) NOT NULL,
  `Parent_Desc1` varchar(100) NOT NULL,
  `Parent_Desc2` varchar(100) NOT NULL,
  `Parent_Stocking_Type` varchar(10) NOT NULL,
  `Parent_Product_Line` varchar(20) NOT NULL,
  `Parent_Base_Price` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bom_kit`
--

CREATE TABLE `bom_kit` (
  `ID` int(11) NOT NULL,
  `Parent_Part_Number` varchar(100) NOT NULL,
  `Parent_Desc1` varchar(150) NOT NULL,
  `Parent_Desc2` varchar(150) NOT NULL,
  `Parent_Product_Line` varchar(50) NOT NULL,
  `Parent_Color` varchar(50) NOT NULL,
  `Parent_Planning_Family` varchar(50) NOT NULL,
  `Parent_Stocking_Type` varchar(10) NOT NULL,
  `Child_Part_Number` varchar(100) NOT NULL,
  `Child_Desc1` varchar(150) NOT NULL,
  `Child_Desc2` varchar(150) NOT NULL,
  `BOM_QTY` int(11) NOT NULL,
  `Child_UOM` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_profile`
--

CREATE TABLE `company_profile` (
  `id` int(11) NOT NULL,
  `company_name` varchar(250) NOT NULL,
  `company_address` varchar(250) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(80) NOT NULL,
  `image` varchar(250) NOT NULL,
  `company_url` varchar(200) NOT NULL,
  `social_link` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `receiver_id` int(10) UNSIGNED DEFAULT NULL,
  `receiver_name` varchar(100) NOT NULL,
  `receiver_email` varchar(100) NOT NULL,
  `sender_id` int(11) UNSIGNED NOT NULL,
  `sender_name` varchar(100) NOT NULL,
  `sender_email` varchar(100) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `attachement` text NOT NULL,
  `email_read` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:unread,1:read',
  `code` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_files`
--

CREATE TABLE `contact_files` (
  `id` int(11) NOT NULL,
  `contact_reply_id` int(11) NOT NULL,
  `filename` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_replies`
--

CREATE TABLE `contact_replies` (
  `id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `receiver_name` varchar(100) NOT NULL,
  `receiver_email` varchar(100) NOT NULL,
  `receiver_id` int(10) UNSIGNED NOT NULL,
  `sender_id` int(10) UNSIGNED NOT NULL,
  `sender_name` varchar(255) NOT NULL,
  `sender_email` varchar(100) NOT NULL,
  `msg_read` tinyint(4) NOT NULL COMMENT '0:unread,1:read',
  `message` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contractor_logo`
--

CREATE TABLE `contractor_logo` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `office_contact_name` varchar(100) NOT NULL,
  `office_address` varchar(225) NOT NULL,
  `office_address2` varchar(225) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(20) NOT NULL,
  `zip` varchar(25) NOT NULL,
  `country` varchar(55) NOT NULL,
  `office_contact_email` varchar(50) NOT NULL,
  `office_contact_phone` varchar(50) NOT NULL,
  `office_contact_fax` varchar(50) NOT NULL,
  `office_contact_cell` varchar(20) NOT NULL,
  `office_contact_custom_fields` text NOT NULL,
  `alternate_office_name` varchar(100) NOT NULL,
  `alternate_office_email` varchar(100) NOT NULL,
  `alternate_office_phone` varchar(100) NOT NULL,
  `alternate_office_fax` varchar(100) NOT NULL,
  `alternate_office_cell` varchar(100) NOT NULL,
  `alternate_office_custom_fields` text NOT NULL,
  `issue_id` int(11) NOT NULL,
  `source_type_id` int(11) NOT NULL,
  `log_date` datetime DEFAULT NULL,
  `schedule_status` varchar(255) NOT NULL,
  `job_type_id` int(11) NOT NULL,
  `proposal_notes` text NOT NULL,
  `sales_rep_id` int(11) UNSIGNED NOT NULL,
  `ar_customer` tinyint(2) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `created_by` int(11) UNSIGNED NOT NULL,
  `updated_at` datetime NOT NULL,
  `modified_by` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `denied_access`
--

CREATE TABLE `denied_access` (
  `ai` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` datetime NOT NULL,
  `reason_code` tinyint(1) UNSIGNED DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` text NOT NULL,
  `display_color` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fdas`
--

CREATE TABLE `fdas` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `foreman_id` int(11) NOT NULL,
  `helpers` text NOT NULL,
  `work_status` int(11) NOT NULL,
  `comments` text NOT NULL,
  `fd_explain` text NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `total_hours` varchar(255) NOT NULL,
  `images` text NOT NULL,
  `work_order_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fence_types`
--

CREATE TABLE `fence_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gate_points`
--

CREATE TABLE `gate_points` (
  `id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `latLong` varchar(50) NOT NULL,
  `gate_type` varchar(20) NOT NULL,
  `gate_length_on_ground` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `work_order_id` int(11) NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `invoice_date` date NOT NULL,
  `invoice_items` text NOT NULL,
  `additional_charges` text NOT NULL,
  `subtotal` double(11,2) NOT NULL,
  `tax_percent` double(11,2) NOT NULL,
  `tax_value` double(11,2) NOT NULL,
  `discount_percent` double(11,2) NOT NULL,
  `discount_value` double(11,2) NOT NULL,
  `exclusion` double(11,2) NOT NULL,
  `total` double(11,2) NOT NULL,
  `labor_per_hour` double(11,2) NOT NULL,
  `spent_hour` double(11,2) NOT NULL,
  `labor_value` double(11,2) NOT NULL,
  `additional_labor` double NOT NULL,
  `status` varchar(100) NOT NULL,
  `notes` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_lines_items`
--

CREATE TABLE `invoice_lines_items` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `part_number` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `quantity` double(11,2) DEFAULT NULL,
  `length` double(11,2) DEFAULT NULL,
  `unit_price` double(11,2) DEFAULT NULL,
  `total_price` double(11,2) DEFAULT NULL,
  `addtional_charge` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ips_on_hold`
--

CREATE TABLE `ips_on_hold` (
  `ai` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

CREATE TABLE `issues` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_types`
--

CREATE TABLE `job_types` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address1` varchar(250) NOT NULL,
  `address2` varchar(250) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(20) NOT NULL,
  `zip` varchar(25) NOT NULL,
  `country` varchar(55) NOT NULL,
  `jobsite_contact_name` varchar(140) NOT NULL,
  `jobsite_contact_email` varchar(100) NOT NULL,
  `jobsite_contact_phone` varchar(100) NOT NULL,
  `jobsite_contact_cell` varchar(100) NOT NULL,
  `jobsite_contact_nextel` varchar(100) NOT NULL,
  `jobsite_contact_custom_fields` text NOT NULL,
  `isDefault` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login_errors`
--

CREATE TABLE `login_errors` (
  `ai` int(10) UNSIGNED NOT NULL,
  `username_or_email` varchar(255) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

CREATE TABLE `materials` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `quantity` decimal(10,0) NOT NULL,
  `ready` int(11) NOT NULL,
  `install_date` date NOT NULL,
  `instructions` varchar(500) NOT NULL,
  `work_order_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `material_types`
--

CREATE TABLE `material_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `measurements`
--

CREATE TABLE `measurements` (
  `id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `start_point` varchar(255) NOT NULL,
  `end_point` varchar(255) NOT NULL,
  `elevation` varchar(255) NOT NULL,
  `length_text` varchar(100) NOT NULL,
  `length_value` double NOT NULL,
  `segment` int(11) NOT NULL DEFAULT 1,
  `bearing` float NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` int(10) UNSIGNED NOT NULL,
  `line_start_point` varchar(255) NOT NULL,
  `line_end_point` varchar(255) NOT NULL,
  `zone_id` bigint(20) DEFAULT NULL,
  `proposal_id` int(10) UNSIGNED DEFAULT NULL CHECK (`proposal_id` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `measurements_polyline`
--

CREATE TABLE `measurements_polyline` (
  `id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `start_line_point` varchar(255) NOT NULL,
  `end_line_point` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `module_id` int(11) NOT NULL,
  `module_parent` int(11) NOT NULL,
  `module_name` varchar(45) DEFAULT NULL,
  `module_description` text DEFAULT NULL,
  `module_link` varchar(125) DEFAULT NULL,
  `module_icon` varchar(45) NOT NULL,
  `module_position` enum('menu','profile','submenu') NOT NULL,
  `module_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `product_category_id` int(11) DEFAULT NULL,
  `product_family` int(11) DEFAULT NULL,
  `length_on_ground` float DEFAULT NULL,
  `height` float DEFAULT NULL,
  `cost` decimal(11,2) DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `part_number` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `sequence_number` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_families`
--

CREATE TABLE `product_families` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_heights`
--

CREATE TABLE `product_heights` (
  `id` int(11) NOT NULL,
  `height` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_meta`
--

CREATE TABLE `product_meta` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `status` tinyint(2) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proposals`
--

CREATE TABLE `proposals` (
  `id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `product_family_id` int(11) DEFAULT NULL,
  `proposal_name` varchar(255) NOT NULL,
  `notes` text NOT NULL,
  `map_image` varchar(255) DEFAULT NULL,
  `form_workup` decimal(11,2) DEFAULT NULL,
  `misc` decimal(11,2) DEFAULT NULL,
  `subtotal` decimal(11,2) DEFAULT NULL,
  `waste_rate` decimal(11,0) DEFAULT NULL,
  `waste_price` decimal(11,2) DEFAULT NULL,
  `total_materials_cost` decimal(11,2) DEFAULT NULL,
  `labor_rate` decimal(11,0) NOT NULL,
  `labor_cost` decimal(11,2) NOT NULL,
  `installation` decimal(11,2) DEFAULT NULL,
  `clearing` decimal(11,2) DEFAULT NULL,
  `mileage` decimal(11,2) DEFAULT NULL,
  `other` decimal(11,2) DEFAULT NULL,
  `total_labour_cost` decimal(11,2) DEFAULT NULL,
  `overhead_rate` decimal(11,2) DEFAULT NULL,
  `profit_calc_rate` decimal(11,2) DEFAULT NULL,
  `bond_rate` decimal(11,0) DEFAULT NULL,
  `direct_cost` decimal(11,2) DEFAULT NULL,
  `overhead` decimal(11,2) DEFAULT NULL,
  `total_cost` decimal(11,2) DEFAULT NULL,
  `profit` decimal(11,2) DEFAULT NULL,
  `selling_price` decimal(11,2) DEFAULT NULL,
  `bond_price` decimal(11,2) DEFAULT NULL,
  `total_bid` decimal(11,2) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL COMMENT '1:bid,2:proposal',
  `proposal_status` tinyint(4) DEFAULT NULL COMMENT '1:Active,2:Accepted,3:Declined,4:Closed',
  `mail_sent` tinyint(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) UNSIGNED DEFAULT NULL,
  `image` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proposals_point`
--

CREATE TABLE `proposals_point` (
  `id` bigint(20) NOT NULL,
  `type` varchar(31) NOT NULL,
  `distance` double NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `measurement_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proposals_proposaldata`
--

CREATE TABLE `proposals_proposaldata` (
  `id` bigint(20) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `proposal_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proposals_zone`
--

CREATE TABLE `proposals_zone` (
  `id` bigint(20) NOT NULL,
  `number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proposal_items`
--

CREATE TABLE `proposal_items` (
  `id` int(11) NOT NULL,
  `proposal_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proposal_item_meta`
--

CREATE TABLE `proposal_item_meta` (
  `id` int(11) NOT NULL,
  `proposal_item_id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order`
--

CREATE TABLE `purchase_order` (
  `id` int(100) NOT NULL,
  `work_order_id` int(100) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `created_by` int(100) UNSIGNED DEFAULT NULL,
  `ordered_for` varchar(100) DEFAULT NULL,
  `vendor` varchar(100) DEFAULT NULL,
  `contact_name` varchar(100) DEFAULT NULL,
  `contact_no` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `date` text DEFAULT NULL,
  `order_description` text DEFAULT NULL,
  `price` text DEFAULT NULL,
  `quantity` text DEFAULT NULL,
  `ordered_date` text DEFAULT NULL,
  `tracking` text DEFAULT NULL,
  `total_price` text DEFAULT NULL,
  `status` text DEFAULT NULL,
  `receiver` text NOT NULL,
  `receive_date` text NOT NULL,
  `row_count` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rental_status`
--

CREATE TABLE `rental_status` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rfi`
--

CREATE TABLE `rfi` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `subject` varchar(155) NOT NULL,
  `question_received_from` varchar(50) NOT NULL,
  `schedule_impact` varchar(10) NOT NULL,
  `schedule_impact_days` double NOT NULL,
  `cost_impact` varchar(10) NOT NULL,
  `cost_Impact_price` double NOT NULL,
  `assign_to` text NOT NULL,
  `rfi_date` date NOT NULL,
  `questions` text NOT NULL,
  `attachment` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rfi_reply`
--

CREATE TABLE `rfi_reply` (
  `id` int(11) NOT NULL,
  `rfi_id` int(11) NOT NULL,
  `reply` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL COMMENT 'this id will related to user auth_level column',
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sent_emails`
--

CREATE TABLE `sent_emails` (
  `id` int(11) NOT NULL,
  `emails` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sitesheet`
--

CREATE TABLE `sitesheet` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `work_order_id` int(11) NOT NULL,
  `material_id` text NOT NULL,
  `HT` varchar(100) NOT NULL,
  `quantity` text NOT NULL,
  `images` text NOT NULL,
  `start_time` datetime NOT NULL,
  `total_hours` float NOT NULL,
  `end_time` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `source_types`
--

CREATE TABLE `source_types` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `username_or_email_on_hold`
--

CREATE TABLE `username_or_email_on_hold` (
  `ai` int(10) UNSIGNED NOT NULL,
  `username_or_email` varchar(255) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(12) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `auth_level` tinyint(3) UNSIGNED NOT NULL,
  `banned` enum('0','1') NOT NULL DEFAULT '0',
  `passwd` varchar(60) NOT NULL,
  `passwd_recovery_code` varchar(60) DEFAULT NULL,
  `passwd_recovery_date` datetime DEFAULT NULL,
  `passwd_modified_at` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `name` varchar(100) NOT NULL,
  `plan_name` varchar(233) DEFAULT NULL,
  `plan_type` varchar(233) DEFAULT NULL,
  `plan_price` int(11) DEFAULT NULL,
  `subscription_status` varchar(233) DEFAULT NULL,
  `subscription_start_date` varchar(233) DEFAULT NULL,
  `subscription_end_date` varchar(233) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `employees_count` varchar(255) DEFAULT NULL,
  `address_one` text DEFAULT NULL,
  `address_two` text DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_email` varchar(255) DEFAULT NULL,
  `notification_email` varchar(255) DEFAULT NULL,
  `company_website` varchar(255) DEFAULT NULL,
  `how_hear_about_us` varchar(255) DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `work_items`
--

CREATE TABLE `work_items` (
  `id` int(11) NOT NULL,
  `installer` int(11) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `spent_time` decimal(10,0) NOT NULL,
  `comments` varchar(225) NOT NULL,
  `work_order_id` int(11) NOT NULL,
  `photos` varchar(225) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `work_orders`
--

CREATE TABLE `work_orders` (
  `id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `schedule_date` date NOT NULL,
  `requested_start` date NOT NULL,
  `scheduling_notes` varchar(1000) NOT NULL,
  `work_description` varchar(2000) NOT NULL,
  `special_instructions` varchar(2000) NOT NULL,
  `status_id` int(11) NOT NULL,
  `type_of_work` int(11) NOT NULL,
  `est_duration` double NOT NULL,
  `created_by_id` varchar(1000) NOT NULL,
  `ordered_by` varchar(100) NOT NULL,
  `order_by_phone` varchar(50) NOT NULL,
  `order_by_email` varchar(50) NOT NULL,
  `submitted_date` date NOT NULL,
  `foreman_id` int(11) UNSIGNED NOT NULL,
  `installer_id` text NOT NULL,
  `customer_id` int(11) NOT NULL,
  `completed` int(11) NOT NULL,
  `utility_loc_id` varchar(25) NOT NULL,
  `workorder_type` int(11) NOT NULL COMMENT '1 : Bid,2:Proposal,3: Work order',
  `proposal_id` int(11) NOT NULL,
  `status_changed_date` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `modified_by` int(11) UNSIGNED NOT NULL,
  `date_completed` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `work_order_products`
--

CREATE TABLE `work_order_products` (
  `id` int(11) NOT NULL,
  `work_order_id` int(11) NOT NULL,
  `part_number` varchar(255) NOT NULL,
  `quantity` double NOT NULL,
  `length` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `work_types`
--

CREATE TABLE `work_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access`
--
ALTER TABLE `access`
  ADD PRIMARY KEY (`access_id`),
  ADD KEY `access_group_id_idx` (`access_level_id`),
  ADD KEY `access_module_id` (`access_module_id`);

--
-- Indexes for table `access_level`
--
ALTER TABLE `access_level`
  ADD PRIMARY KEY (`access_level_id`);

--
-- Indexes for table `acl`
--
ALTER TABLE `acl`
  ADD PRIMARY KEY (`ai`),
  ADD KEY `action_id` (`action_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `acl_actions`
--
ALTER TABLE `acl_actions`
  ADD PRIMARY KEY (`action_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `acl_categories`
--
ALTER TABLE `acl_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_code` (`category_code`),
  ADD UNIQUE KEY `category_desc` (`category_desc`);

--
-- Indexes for table `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_token`
--
ALTER TABLE `api_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_sessions`
--
ALTER TABLE `auth_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `bom_base_price`
--
ALTER TABLE `bom_base_price`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `bom_kit`
--
ALTER TABLE `bom_kit`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `company_profile`
--
ALTER TABLE `company_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_files`
--
ALTER TABLE `contact_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_replies`
--
ALTER TABLE `contact_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contractor_logo`
--
ALTER TABLE `contractor_logo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `denied_access`
--
ALTER TABLE `denied_access`
  ADD PRIMARY KEY (`ai`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fdas`
--
ALTER TABLE `fdas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fence_types`
--
ALTER TABLE `fence_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gate_points`
--
ALTER TABLE `gate_points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_lines_items`
--
ALTER TABLE `invoice_lines_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ips_on_hold`
--
ALTER TABLE `ips_on_hold`
  ADD PRIMARY KEY (`ai`);

--
-- Indexes for table `issues`
--
ALTER TABLE `issues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_types`
--
ALTER TABLE `job_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `login_errors`
--
ALTER TABLE `login_errors`
  ADD PRIMARY KEY (`ai`);

--
-- Indexes for table `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `material_types`
--
ALTER TABLE `material_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `measurements`
--
ALTER TABLE `measurements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `measurements_zone_id_8652c64f_fk_proposals_zone_id` (`zone_id`);

--
-- Indexes for table `measurements_polyline`
--
ALTER TABLE `measurements_polyline`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`module_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_families`
--
ALTER TABLE `product_families`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_heights`
--
ALTER TABLE `product_heights`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_meta`
--
ALTER TABLE `product_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proposals`
--
ALTER TABLE `proposals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proposals_point`
--
ALTER TABLE `proposals_point`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proposals_proposaldata`
--
ALTER TABLE `proposals_proposaldata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proposals_zone`
--
ALTER TABLE `proposals_zone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proposal_items`
--
ALTER TABLE `proposal_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proposal_item_meta`
--
ALTER TABLE `proposal_item_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rental_status`
--
ALTER TABLE `rental_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rfi`
--
ALTER TABLE `rfi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rfi_reply`
--
ALTER TABLE `rfi_reply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_emails`
--
ALTER TABLE `sent_emails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `emails` (`emails`);

--
-- Indexes for table `sitesheet`
--
ALTER TABLE `sitesheet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `source_types`
--
ALTER TABLE `source_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ID` (`id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `username_or_email_on_hold`
--
ALTER TABLE `username_or_email_on_hold`
  ADD PRIMARY KEY (`ai`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `work_items`
--
ALTER TABLE `work_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `work_orders`
--
ALTER TABLE `work_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `work_order_products`
--
ALTER TABLE `work_order_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `work_types`
--
ALTER TABLE `work_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access`
--
ALTER TABLE `access`
  MODIFY `access_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `access_level`
--
ALTER TABLE `access_level`
  MODIFY `access_level_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `acl`
--
ALTER TABLE `acl`
  MODIFY `ai` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `acl_actions`
--
ALTER TABLE `acl_actions`
  MODIFY `action_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `acl_categories`
--
ALTER TABLE `acl_categories`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `actions`
--
ALTER TABLE `actions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api_token`
--
ALTER TABLE `api_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bom_base_price`
--
ALTER TABLE `bom_base_price`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bom_kit`
--
ALTER TABLE `bom_kit`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company_profile`
--
ALTER TABLE `company_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_files`
--
ALTER TABLE `contact_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_replies`
--
ALTER TABLE `contact_replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contractor_logo`
--
ALTER TABLE `contractor_logo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `denied_access`
--
ALTER TABLE `denied_access`
  MODIFY `ai` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fdas`
--
ALTER TABLE `fdas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fence_types`
--
ALTER TABLE `fence_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gate_points`
--
ALTER TABLE `gate_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_lines_items`
--
ALTER TABLE `invoice_lines_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ips_on_hold`
--
ALTER TABLE `ips_on_hold`
  MODIFY `ai` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `issues`
--
ALTER TABLE `issues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_types`
--
ALTER TABLE `job_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_errors`
--
ALTER TABLE `login_errors`
  MODIFY `ai` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `materials`
--
ALTER TABLE `materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `material_types`
--
ALTER TABLE `material_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `measurements`
--
ALTER TABLE `measurements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `measurements_polyline`
--
ALTER TABLE `measurements_polyline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_families`
--
ALTER TABLE `product_families`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_heights`
--
ALTER TABLE `product_heights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_meta`
--
ALTER TABLE `product_meta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proposals`
--
ALTER TABLE `proposals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proposals_point`
--
ALTER TABLE `proposals_point`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proposals_proposaldata`
--
ALTER TABLE `proposals_proposaldata`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proposals_zone`
--
ALTER TABLE `proposals_zone`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proposal_items`
--
ALTER TABLE `proposal_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proposal_item_meta`
--
ALTER TABLE `proposal_item_meta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_order`
--
ALTER TABLE `purchase_order`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rental_status`
--
ALTER TABLE `rental_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rfi`
--
ALTER TABLE `rfi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rfi_reply`
--
ALTER TABLE `rfi_reply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'this id will related to user auth_level column';

--
-- AUTO_INCREMENT for table `sent_emails`
--
ALTER TABLE `sent_emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sitesheet`
--
ALTER TABLE `sitesheet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `source_types`
--
ALTER TABLE `source_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `username_or_email_on_hold`
--
ALTER TABLE `username_or_email_on_hold`
  MODIFY `ai` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `work_items`
--
ALTER TABLE `work_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `work_orders`
--
ALTER TABLE `work_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `work_order_products`
--
ALTER TABLE `work_order_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `work_types`
--
ALTER TABLE `work_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `measurements`
--
ALTER TABLE `measurements`
  ADD CONSTRAINT `measurements_zone_id_8652c64f_fk_proposals_zone_id` FOREIGN KEY (`zone_id`) REFERENCES `proposals_zone` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
