-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 15, 2023 at 07:43 AM
-- Server version: 5.7.41
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sitemaki_bulkfollow`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(225) DEFAULT NULL,
  `password` text NOT NULL,
  `register_date` datetime NOT NULL,
  `login_date` datetime DEFAULT NULL,
  `login_ip` varchar(225) DEFAULT NULL,
  `client_type` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> ON, 1 -> OFF',
  `access` varchar(999) NOT NULL,
  `mode` varchar(225) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `username`, `password`, `register_date`, `login_date`, `login_ip`, `client_type`, `access`, `mode`) VALUES
(1, 'admin', 'admin', '2021-09-08 10:19:05', '2023-05-15 11:12:46', '132.154.188.117', '2', '{\"admin_access\":\"1\",\"users\":\"1\",\"orders\":\"1\",\"subscriptions\":\"1\",\"dripfeed\":\"1\",\"services\":\"1\",\"payments\":\"1\",\"tickets\":\"1\",\"reports\":\"1\",\"general_settings\":\"1\",\"pages\":\"1\",\"payments_settings\":\"1\",\"bank_accounts\":\"1\",\"payments_bonus\":\"1\",\"alert_settings\":\"1\",\"providers\":\"1\",\"themes\":\"1\",\"child-panels\":\"1\",\"language\":\"1\",\"meta\":\"1\",\"twice\":\"1\",\"files\":\"1\",\"coupon\":\"1\",\"admins\":\"1\",\"update-prices\":\"1\",\"bulk\":\"1\",\"bulkc\":\"1\",\"synced-logs\":\"1\",\"refill\":\"1\",\"referral\":\"1\",\"broadcast\":\"1\",\"logs\":\"1\",\"videop\":\"1\",\"updates\":\"1\",\"menu\":\"1\",\"inte\":\"1\",\"currency\":\"1\",\"news\":\"1\",\"blog\":\"1\",\"modules\":\"1\",\"subject\":\"1\"}', 'sun');

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` datetime DEFAULT NULL,
  `image_file` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(11) NOT NULL,
  `bank_name` varchar(225) NOT NULL,
  `bank_sube` varchar(225) NOT NULL,
  `bank_hesap` varchar(225) NOT NULL,
  `bank_iban` text NOT NULL,
  `bank_alici` varchar(225) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` datetime NOT NULL,
  `image_file` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `blog_get` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bulkedit`
--

CREATE TABLE `bulkedit` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` text COLLATE utf8mb4_bin NOT NULL,
  `category_line` double NOT NULL,
  `category_type` enum('1','2') CHARACTER SET utf8 NOT NULL DEFAULT '2',
  `category_secret` enum('1','2') COLLATE utf8mb4_bin NOT NULL DEFAULT '2',
  `category_icon` text COLLATE utf8mb4_bin NOT NULL,
  `is_refill` enum('1','2') CHARACTER SET utf8 NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_line`, `category_type`, `category_secret`, `category_icon`, `is_refill`) VALUES
(1, 'SMMSCRIPT.SHOP', -1, '2', '2', ' ', '');

-- --------------------------------------------------------

--
-- Table structure for table `childpanels`
--

CREATE TABLE `childpanels` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `domain` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `currency` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `child_username` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `child_password` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `charge` double NOT NULL,
  `status` enum('Pending','Active','Frozen','Suspended') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pending',
  `renewal_date` date NOT NULL,
  `date_created` datetime NOT NULL,
  `dreampanel_id` int(11) NOT NULL,
  `keyc` varchar(225) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `client_id` int(11) NOT NULL,
  `name` varchar(225) DEFAULT NULL,
  `email` varchar(225) NOT NULL,
  `username` varchar(225) DEFAULT NULL,
  `admin_type` enum('1','2') NOT NULL DEFAULT '2',
  `password` text NOT NULL,
  `telephone` varchar(225) DEFAULT NULL,
  `balance` decimal(21,4) NOT NULL,
  `balance_type` enum('1','2') NOT NULL DEFAULT '2',
  `debit_limit` double DEFAULT NULL,
  `spent` decimal(21,4) NOT NULL,
  `register_date` datetime NOT NULL,
  `login_date` datetime DEFAULT NULL,
  `login_ip` varchar(225) DEFAULT NULL,
  `apikey` text NOT NULL,
  `tel_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `email_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `client_type` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> ON, 1 -> OFF',
  `access` text,
  `lang` varchar(255) NOT NULL DEFAULT 'tr',
  `timezone` double NOT NULL DEFAULT '0',
  `currency_type` enum('INR','USD') NOT NULL DEFAULT 'USD',
  `ref_code` text NOT NULL,
  `ref_by` text,
  `change_email` enum('1','2') NOT NULL DEFAULT '2',
  `resend_max` int(11) NOT NULL,
  `currency` varchar(225) NOT NULL DEFAULT '1',
  `passwordreset_token` varchar(225) NOT NULL,
  `coustm_rate` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`client_id`, `name`, `email`, `username`, `admin_type`, `password`, `telephone`, `balance`, `balance_type`, `debit_limit`, `spent`, `register_date`, `login_date`, `login_ip`, `apikey`, `tel_type`, `email_type`, `client_type`, `access`, `lang`, `timezone`, `currency_type`, `ref_code`, `ref_by`, `change_email`, `resend_max`, `currency`, `passwordreset_token`, `coustm_rate`) VALUES
(1, '', 'helloworld2@lmao.com', 'helloworld', '2', '432a4d005958f5192b640e1602277c63', '', 99.9950, '2', NULL, 0.0050, '2022-08-12 14:41:14', NULL, NULL, '39a47e99b9624ca21c09b6a7e838b1e5', '1', '2', '2', NULL, 'en', 0, 'USD', '463a1d', NULL, '2', 0, '2', '', 50),
(2, 'Jeisn', 'hejdbui@gmail.com', 'Unlock', '2', '25d55ad283aa400af464c76d713c07ad', '72837897869', 0.0000, '2', NULL, 0.0000, '2023-05-15 11:11:16', NULL, NULL, 'ff9d153d55fd3942c7a40045d2cd6a5b', '1', '2', '2', NULL, 'en', 0, 'USD', '1060f1', NULL, '2', 0, '1', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `clients_category`
--

CREATE TABLE `clients_category` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `clients_price`
--

CREATE TABLE `clients_price` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `service_price` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `clients_service`
--

CREATE TABLE `clients_service` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `client_report`
--

CREATE TABLE `client_report` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `action` text NOT NULL,
  `report_ip` varchar(225) NOT NULL,
  `report_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `client_report`
--

INSERT INTO `client_report` (`id`, `client_id`, `action`, `report_ip`, `report_date`) VALUES
(1, 1, '\r\n    User registered.', '2401:4900:1c36:2482:69d6:4c91:3db4:23c5, 162.158.235.69', '2022-08-12 14:41:14'),
(2, 1, 'API Key changed', '132.154.188.117', '2023-05-15 11:05:51'),
(3, 2, '\r\n    User registered.', '103.172.253.146', '2023-05-15 11:11:16'),
(4, 1, '0.005 New Order #1.', '132.154.188.117', '2023-05-15 11:11:30');

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` int(11) NOT NULL,
  `symbol` text,
  `value` double DEFAULT NULL,
  `name` varchar(225) NOT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1',
  `default` enum('2','1') NOT NULL DEFAULT '2',
  `nouse` enum('1','2') NOT NULL DEFAULT '2'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `symbol`, `value`, `name`, `status`, `default`, `nouse`) VALUES
(1, '$', 1, 'USD', '1', '1', '1'),
(2, '₹', 75, 'INR', '1', '2', '2'),
(5, '€', 0.94, 'Euro', '1', '2', '2');

-- --------------------------------------------------------

--
-- Table structure for table `earn`
--

CREATE TABLE `earn` (
  `earn_id` int(255) NOT NULL,
  `client_id` int(255) NOT NULL,
  `link` text NOT NULL,
  `earn_note` text NOT NULL,
  `status` enum('Pending','Under Review','Funds Granted','Rejected','Not Eligible') NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `link` text,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `General_options`
--

CREATE TABLE `General_options` (
  `id` int(11) NOT NULL,
  `coupon_status` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `updates_show` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `panel_status` enum('Pending','Active','Frozen','Suspended') COLLATE utf8_unicode_ci NOT NULL,
  `panel_orders` int(11) NOT NULL,
  `panel_thismonthorders` int(11) NOT NULL,
  `massorder` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '2',
  `balance_format` enum('0.0','0.00','0.000','0.0000') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.0',
  `currency_format` enum('0','2','3','4') COLLATE utf8_unicode_ci NOT NULL DEFAULT '3',
  `ticket_system` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `General_options`
--

INSERT INTO `General_options` (`id`, `coupon_status`, `updates_show`, `panel_status`, `panel_orders`, `panel_thismonthorders`, `massorder`, `balance_format`, `currency_format`, `ticket_system`) VALUES
(1, '', '2', 'Active', 1024, 20, '2', '', '4', '2');

-- --------------------------------------------------------

--
-- Table structure for table `integrations`
--

CREATE TABLE `integrations` (
  `id` int(11) NOT NULL,
  `name` varchar(225) NOT NULL,
  `description` varchar(225) NOT NULL,
  `icon_url` varchar(225) NOT NULL,
  `code` text NOT NULL,
  `visibility` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `integrations`
--

INSERT INTO `integrations` (`id`, `name`, `description`, `icon_url`, `code`, `visibility`, `status`) VALUES
(1, 'Beamer', 'Announce updates and get feedback with in-app notification center, widgets and changelog', '/img/integrations/Beamer.svg', '', 1, 1),
(2, 'Getsitecontrol', 'It helps you prevent website visitors from leaving your website without taking any action.', '/img/integrations/Getsitecontrol.svg', '', 1, 1),
(3, 'Google Analytics', 'Statistics and basic analytical tools for search engine optimization (SEO) and marketing purposes', '/img/integrations/Google%20Analytics.svg', '', 1, 2),
(4, 'Google Tag manager', 'Manage all your website tags without editing the code using simple tag management solutions', '/img/integrations/Google%20Tag%20manager.svg', '', 1, 1),
(5, 'JivoChat', 'All-in-one business messenger to talk to customers: live chat, phone, email and social', '/img/integrations/JivoChat.svg', '', 1, 1),
(6, 'Onesignal', 'Leader in customer engagement, empowers mobile push, web push, email, in-app messages', '/img/integrations/Onesignal.svg', '', 1, 1),
(7, 'Push alert', 'Increase reach, revenue, retarget users with Push Notifications on desktop and mobile', '/img/integrations/Push%20alert.svg', '', 1, 2),
(8, 'Smartsupp', 'Live chat, email inbox and Facebook Messenger in one customer messaging platform', '/img/integrations/Smartsupp.svg', '', 1, 1),
(9, 'Tawk.to', 'Track and chat with visitors on your website, mobile app or a free customizable page', '/img/integrations/Tawk.to.svg', '', 1, 1),
(10, 'Tidio', 'Communicator for businesses that keep live chat, chatbots, Messenger and email in one place', '/img/integrations/Tidio.svg', '', 1, 1),
(11, 'Zendesk Chat', 'Helps respond quickly to customer questions, reduce wait times and increase sales', '/img/integrations/Zendesk%20Chat.svg', '', 1, 1),
(12, 'Getbutton.io', 'Chat with website visitors through popular messaging apps. Whatsapp, messenger etc. contact button.', '/img/integrations/Getbutton.svg', 'Hii', 1, 1),
(13, 'Google reCAPTCHA v2', 'It uses an advanced risk analysis engine and adaptive challenges to prevent malware from engaging in abusive activities on your website.', '/img/integrations/reCAPTCHA.svg', '', 1, 2),
(14, 'Whatsapp', 'Whatsapp is for Personal Support of your Users', '/img/integrations/whatsapp.svg', '', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `kuponlar`
--

CREATE TABLE `kuponlar` (
  `id` int(11) NOT NULL,
  `kuponadi` varchar(255) NOT NULL,
  `adet` int(11) NOT NULL,
  `tutar` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kupon_kullananlar`
--

CREATE TABLE `kupon_kullananlar` (
  `id` int(11) NOT NULL,
  `uye_id` int(11) NOT NULL,
  `kuponadi` varchar(255) NOT NULL,
  `tutar` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `language_name` varchar(225) NOT NULL,
  `language_code` varchar(225) NOT NULL,
  `language_type` enum('2','1') NOT NULL DEFAULT '2',
  `default_language` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language_name`, `language_code`, `language_type`, `default_language`) VALUES
(1, 'English', 'en', '2', '1');

-- --------------------------------------------------------

--
-- Table structure for table `Mailforms`
--

CREATE TABLE `Mailforms` (
  `id` int(11) NOT NULL,
  `subject` varchar(225) NOT NULL,
  `message` varchar(225) NOT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1',
  `header` varchar(225) NOT NULL,
  `footer` varchar(225) NOT NULL,
  `type` enum('Admins','Users') NOT NULL DEFAULT 'Users'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8mb4_bin NOT NULL,
  `menu_line` double NOT NULL,
  `type` enum('1','2') CHARACTER SET utf8 NOT NULL DEFAULT '2',
  `slug` varchar(225) COLLATE utf8mb4_bin NOT NULL DEFAULT '2',
  `icon` varchar(225) COLLATE utf8mb4_bin DEFAULT NULL,
  `menu_status` enum('1','2') CHARACTER SET utf8 NOT NULL DEFAULT '1',
  `visible` enum('Internal','External') COLLATE utf8mb4_bin NOT NULL DEFAULT 'Internal',
  `active` varchar(225) COLLATE utf8mb4_bin NOT NULL,
  `tiptext` varchar(225) COLLATE utf8mb4_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `menu_line`, `type`, `slug`, `icon`, `menu_status`, `visible`, `active`, `tiptext`) VALUES
(2, 'Orders ', 2, '2', '/orders', 'fas fa-server', '1', 'Internal', 'massorder', 'Shown only if Mass Order system enabled for use'),
(3, 'New Order', 1, '2', '/', 'fas fa-cart-arrow-down', '1', 'Internal', 'orders', ''),
(5, 'Login', 2, '2', '/', 'fas fa-sign-in-alt', '1', 'External', 'login', ''),
(6, 'Services', 5, '2', '/services', 'fas fa-cogs', '1', 'Internal', 'services', ''),
(7, 'Add Funds', 6, '2', '/addfunds', 'fas fa-credit-card', '1', 'Internal', 'addfunds', ''),
(8, 'Api', 12, '2', '/api', 'fas fa-code', '1', 'Internal', 'api', ''),
(9, 'Tickets ', 9, '2', '/tickets', 'fas fa-headset', '1', 'Internal', 'tickets', ''),
(10, 'Child Panels', 10, '2', '/child-panels', 'fas fa-child', '1', 'Internal', 'child-panels', 'Shown only if child panels selling enabled'),
(11, 'Refer & Earn', 7, '2', '/refer', 'fas fa-bezier-curve', '1', 'Internal', 'refer', 'Shown only if affiliate system enabled for use'),
(14, 'Signup ', 3, '2', '/signup', 'fas fa-user-plus', '1', 'External', 'signup', 'Shown only if Signup system enabled for use'),
(15, 'Api', 4, '2', '/api', 'fas fa-code', '1', 'External', 'api', ''),
(18, 'Services', 5, '2', '/services', 'fas fa-list-alt', '1', 'External', 'terms', ''),
(27, 'Updates', 11, '2', '/updates', 'fas fa-wrench', '1', 'Internal', 'updates', ''),
(30, 'Mass Order', 3, '2', '/massorder', 'fas fa-cart-plus', '1', 'Internal', 'subscriptions', ''),
(29, 'Blogs', 6, '2', '/blog', 'fas fa-blog', '1', 'External', 'blog', '');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `news_icon` varchar(225) NOT NULL,
  `news_title` varchar(225) NOT NULL,
  `news_content` varchar(225) NOT NULL,
  `news_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `news_icon`, `news_title`, `news_content`, `news_date`) VALUES
(1, 'pinterest', 'smmpanelscriptstore', 'Hii', '2022-08-12 14:06:14');

-- --------------------------------------------------------

--
-- Table structure for table `notifications_popup`
--

CREATE TABLE `notifications_popup` (
  `id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `action_link` text NOT NULL,
  `isAllPage` enum('0','1') NOT NULL DEFAULT '0',
  `isAllUser` enum('1','0') NOT NULL DEFAULT '0',
  `expiry_date` date NOT NULL,
  `status` enum('1','2','0') NOT NULL DEFAULT '1',
  `allPages` varchar(225) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `action_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `api_orderid` int(11) NOT NULL DEFAULT '0',
  `order_error` text NOT NULL,
  `order_detail` text,
  `order_api` int(11) NOT NULL DEFAULT '0',
  `api_serviceid` int(11) NOT NULL DEFAULT '0',
  `api_charge` double NOT NULL DEFAULT '0',
  `api_currencycharge` double DEFAULT '1',
  `order_profit` double NOT NULL,
  `order_quantity` double NOT NULL,
  `order_extras` text NOT NULL,
  `order_charge` double NOT NULL,
  `dripfeed` enum('1','2','3') DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `dripfeed_id` double NOT NULL DEFAULT '0',
  `subscriptions_id` double NOT NULL DEFAULT '0',
  `subscriptions_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `dripfeed_totalcharges` double DEFAULT NULL,
  `dripfeed_runs` double DEFAULT NULL,
  `dripfeed_delivery` double NOT NULL DEFAULT '0',
  `dripfeed_interval` double DEFAULT NULL,
  `dripfeed_totalquantity` double DEFAULT NULL,
  `dripfeed_status` enum('active','completed','canceled') NOT NULL DEFAULT 'active',
  `order_url` text NOT NULL,
  `order_start` double NOT NULL DEFAULT '0',
  `order_finish` double NOT NULL DEFAULT '0',
  `order_remains` double NOT NULL DEFAULT '0',
  `order_create` datetime NOT NULL,
  `order_status` enum('pending','inprogress','completed','partial','processing','canceled') NOT NULL DEFAULT 'pending',
  `subscriptions_status` enum('active','paused','completed','canceled','expired','limit') NOT NULL DEFAULT 'active',
  `subscriptions_username` text,
  `subscriptions_posts` double DEFAULT NULL,
  `subscriptions_delivery` double NOT NULL DEFAULT '0',
  `subscriptions_delay` double DEFAULT NULL,
  `subscriptions_min` double DEFAULT NULL,
  `subscriptions_max` double DEFAULT NULL,
  `subscriptions_expiry` date DEFAULT NULL,
  `last_check` datetime NOT NULL,
  `order_where` enum('site','api') NOT NULL DEFAULT 'site',
  `refill_status` enum('Pending','Refilling','Completed','Rejected','Error') NOT NULL DEFAULT 'Pending',
  `is_refill` enum('1','2') NOT NULL DEFAULT '1',
  `refill` varchar(225) NOT NULL DEFAULT '1',
  `cancelbutton` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1 -> ON, 2 -> OFF',
  `show_refill` enum('true','false') NOT NULL DEFAULT 'true',
  `api_refillid` double NOT NULL DEFAULT '0',
  `avg_done` enum('0','1') NOT NULL DEFAULT '1',
  `order_increase` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `client_id`, `service_id`, `api_orderid`, `order_error`, `order_detail`, `order_api`, `api_serviceid`, `api_charge`, `api_currencycharge`, `order_profit`, `order_quantity`, `order_extras`, `order_charge`, `dripfeed`, `dripfeed_id`, `subscriptions_id`, `subscriptions_type`, `dripfeed_totalcharges`, `dripfeed_runs`, `dripfeed_delivery`, `dripfeed_interval`, `dripfeed_totalquantity`, `dripfeed_status`, `order_url`, `order_start`, `order_finish`, `order_remains`, `order_create`, `order_status`, `subscriptions_status`, `subscriptions_username`, `subscriptions_posts`, `subscriptions_delivery`, `subscriptions_delay`, `subscriptions_min`, `subscriptions_max`, `subscriptions_expiry`, `last_check`, `order_where`, `refill_status`, `is_refill`, `refill`, `cancelbutton`, `show_refill`, `api_refillid`, `avg_done`, `order_increase`) VALUES
(1, 1, 1, 0, '-', NULL, 0, 0, 0, 1, 0.005, 10, '', 0.005, '1', 0, 0, '1', NULL, NULL, 0, NULL, NULL, 'active', 'demo', 0, 0, 0, '2023-05-15 11:11:30', 'pending', 'active', NULL, NULL, 0, NULL, NULL, NULL, NULL, '2023-05-15 11:11:30', 'site', 'Pending', '1', '1', '1', 'true', 0, '1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `page_id` int(11) NOT NULL,
  `page_name` varchar(225) NOT NULL,
  `page_get` varchar(225) NOT NULL,
  `page_content` text NOT NULL,
  `page_status` enum('1','2') NOT NULL DEFAULT '1',
  `active` enum('1','2') NOT NULL DEFAULT '1',
  `seo_title` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `seo_keywords` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `seo_description` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `last_modified` datetime NOT NULL,
  `del` varchar(255) NOT NULL DEFAULT '1',
  `page_content2` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`page_id`, `page_name`, `page_get`, `page_content`, `page_status`, `active`, `seo_title`, `seo_keywords`, `seo_description`, `last_modified`, `del`, `page_content2`) VALUES
(2, 'Add funds', 'addfunds', '', '1', '1', '', '', '', '2022-02-07 08:23:09', '2', ''),
(787, 'Login', 'auth', '', '1', '1', 'India\'s No. #1 SMM Panel Since 2014 | Indian SMM Reseller', '', '', '2022-02-17 08:55:49', '2', '<div style=\"text-align: center;\"><span style=\"font-family: sans-serif; font-size: 16px;\"><font color=\"#0000ff\">smm panel,smmpanel,SMM Panel India,SMM Panel Paytm,SMM Panel Cheap India,SMM Reseller Panel,SMM Reseller Panel India,Cheap SMM Panel,cheapest SMM panel,cheap SMM panel india,Cheapest SMM Reseller Panel,Cheapest SMM Panel Paytm,Cheapest SMM Panel Paytm,indian smm panel,IndianSMM Reseller Panel,Best SMM panel,Best SMM Panel India,Top SMM Panel</font></span></div>'),
(9, 'New Order', 'neworder', '', '1', '1', '', '', '', '2022-02-26 08:00:25', '2', ''),
(14, 'Terms', 'terms', '', '1', '1', '', '', '', '2022-02-07 08:41:16', '2', ''),
(789, 'Mass Order', 'massorder', '', '1', '1', '', '', '', '2022-02-07 08:43:06', '2', ''),
(790, 'Orders', 'orders', '', '1', '1', '', '', '', '2022-02-07 08:53:20', '2', ''),
(791, 'Services', 'services', '', '1', '1', '', '', '', '2022-01-26 07:22:09', '2', ''),
(792, 'Tickets', 'tickets', '', '1', '1', '', '', '', '2022-01-26 07:22:09', '2', ''),
(793, 'API', 'api', '', '1', '1', '', '', '', '2022-01-24 07:21:07', '2', ''),
(794, 'Signup', 'signup', '', '1', '1', '', '', '', '2022-01-24 07:21:07', '2', ''),
(795, 'Blog', 'blog', '', '1', '1', '', '', '', '2022-01-24 07:21:07', '2', '');

-- --------------------------------------------------------

--
-- Table structure for table `panel_categories`
--

CREATE TABLE `panel_categories` (
  `id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8mb4,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '1 -> ENABLE, 0 -> DISABLE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `panel_info`
--

CREATE TABLE `panel_info` (
  `panel_id` int(11) NOT NULL,
  `panel_domain` text COLLATE utf8_unicode_ci NOT NULL,
  `panel_plan` text COLLATE utf8_unicode_ci NOT NULL,
  `panel_status` enum('Pending','Active','Frozen','Suspended') COLLATE utf8_unicode_ci NOT NULL,
  `panel_orders` int(11) NOT NULL,
  `panel_thismonthorders` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `api_key` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `renewal_date` datetime NOT NULL,
  `panel_type` enum('Child','Main') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Main'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `panel_info`
--

INSERT INTO `panel_info` (`panel_id`, `panel_domain`, `panel_plan`, `panel_status`, `panel_orders`, `panel_thismonthorders`, `date_created`, `api_key`, `renewal_date`, `panel_type`) VALUES
(1, 'yourpanel.com', 'A', 'Active', 1393, 1393, '2022-01-24 10:58:08', 'b1fbedd6f1266a8990bf648919068680', '2025-02-23 10:58:08', 'Main');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `client_balance` decimal(15,2) NOT NULL DEFAULT '0.00',
  `payment_amount` decimal(15,4) NOT NULL,
  `payment_privatecode` double DEFAULT NULL,
  `payment_method` int(11) NOT NULL,
  `payment_status` enum('1','2','3') NOT NULL DEFAULT '1',
  `payment_delivery` enum('1','2') NOT NULL DEFAULT '1',
  `payment_note` varchar(255) NOT NULL DEFAULT 'No',
  `payment_mode` enum('Manuel','Otomatik','Auto') NOT NULL DEFAULT 'Otomatik',
  `payment_create_date` datetime NOT NULL,
  `payment_update_date` datetime NOT NULL,
  `payment_ip` varchar(225) NOT NULL,
  `payment_extra` text NOT NULL,
  `payment_bank` int(11) NOT NULL,
  `t_id` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `client_id`, `client_balance`, `payment_amount`, `payment_privatecode`, `payment_method`, `payment_status`, `payment_delivery`, `payment_note`, `payment_mode`, `payment_create_date`, `payment_update_date`, `payment_ip`, `payment_extra`, `payment_bank`, `t_id`) VALUES
(1, 1, 0.00, 100.0000, NULL, 8, '1', '1', 'No', '', '2022-08-12 18:08:02', '0000-00-00 00:00:00', '2409:4064:2e94:8230::1949:9914, 172.70.183.166', '1660307882', 0, NULL),
(2, 1, 0.00, 100.0000, NULL, 1, '3', '2', 'No', 'Manuel', '2023-05-15 11:11:14', '2023-05-15 11:11:14', '', '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payments_bonus`
--

CREATE TABLE `payments_bonus` (
  `bonus_id` int(11) NOT NULL,
  `bonus_method` int(11) NOT NULL,
  `bonus_from` double NOT NULL,
  `bonus_amount` double NOT NULL,
  `bonus_type` enum('1','2') NOT NULL DEFAULT '2'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(11) NOT NULL,
  `method_name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `method_get` varchar(225) NOT NULL,
  `method_min` double NOT NULL,
  `method_max` double NOT NULL,
  `method_type` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> ON, 1 -> OFF	',
  `method_extras` text NOT NULL,
  `method_line` double NOT NULL,
  `nouse` enum('1','2') NOT NULL DEFAULT '2',
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `method_name`, `method_get`, `method_min`, `method_max`, `method_type`, `method_extras`, `method_line`, `nouse`, `content`) VALUES
(1, 'Paypal', 'paypal', 10, 10000, '2', '{\"method_type\":\"2\",\"name\":\"Paypal ( USD ) ( International Payments ) [ 10% Charge ]\",\"min\":\"10\",\"max\":\"10000\",\"client_id\":\"AR3wtI3dxA0qU2dme-kQdC6csRL4whF8SNWzJ2jilchyZvQsBJ7URF4UqktveDp67guIenYYX-e0zuCz\",\"client_secret\":\"EMFtatHjrBMf9EYcec0WZqKwGwO2aum03w62b9tZZWPB2G__WoFuBMkMu0z97NR8ooRJNXR0FqrtagrD\",\"fee\":\"10\"}', 5, '2', 'hello'),
(2, 'Stripe', 'stripe', 1, 100, '1', '{\"method_type\":\"2\",\"name\":\"Stripe\",\"min\":\"1\",\"max\":\"100\",\"stripe_publishable_key\":\"pk_live_51HiUnRLjkQAtcIW0F983imoO8qhftSSMSj7oB9xTjGHB51su6vnuDmGNs5l2NNZz1XE1Ogf1svxqjtdasRYr3atk00wEAHHKNT\",\"stripe_secret_key\":\"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\",\"stripe_webhooks_secret\":\"whsec_gSvhMz0eOIOTk5S9uzzzDgpHeclOmiDe\",\"fee\":\"10\",\"currency\":\"USD\"}', 8, '2', ''),
(3, 'Shopier', 'shopier', 5, 0, '1', '{\"method_type\":\"1\",\"name\":\"Kredi \\/ Banka Kart\\u0131 ile \\u00d6de\",\"min\":\"5\",\"max\":\"0\",\"apiKey\":\"\",\"apiSecret\":\"\",\"website_index\":\"1\",\"processing_fee\":\"1\",\"fee\":\"10\",\"currency\":\"USD\"}', 9, '2', ''),
(5, 'Paywant', 'paywant', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Paywant\",\"min\":\"1\",\"max\":\"0\",\"apiKey\":\"\",\"apiSecret\":\"\",\"fee\":\"0\",\"currency\":\"USD\",\"commissionType\":\"2\",\"payment_type\":[\"1\",\"2\",\"3\"]}', 10, '2', ''),
(7, 'PayTR', 'paytr', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Paytr\",\"min\":\"1\",\"max\":\"0\",\"merchant_id\":\"\",\"merchant_key\":\"\",\"merchant_salt\":\"\",\"fee\":\"0\",\"currency\":\"USD\"}', 11, '2', ''),
(8, 'Coinpayments', 'coinpayments', 10, 10000, '2', '{\"method_type\":\"2\",\"name\":\"CoinPayments ( Cryptocurrency )\",\"min\":\"10\",\"max\":\"10000\",\"coinpayments_public_key\":\"5a6f3154ddf28c2017df7ad00ce5c1f2b872822beb1ed32f52e0009a2425ecfd\",\"coinpayments_private_key\":\"da16CB5D8Ce6d90eD7181b5907F2103739ef0D5dbF591Ddf22d8f93649170E2F\",\"coinpayments_currency\":\"BTC\",\"merchant_id\":\"db74662404abc41263c87ed221718ce3\",\"ipn_secret\":\"5566\",\"fee\":\"0\",\"currency\":\"USD\"}', 6, '2', ''),
(9, '2checkout', '2checkout', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"2checkout\",\"min\":\"1\",\"max\":\"0\",\"seller_id\":\"\",\"private_key\":\"\",\"fee\":\"1\",\"currency\":\"USD\"}', 12, '2', ''),
(10, 'Payoneer', 'payoneer', 1, 0, '1', '{\"method_type\":\"2\",\"name\":\"Payoneer\",\"email\":\"fazilakbulut@outlook.com\"}', 13, '2', ''),
(11, 'Mollie', 'mollie', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Mollie\",\"min\":\"1\",\"max\":\"0\",\"live_api_key\":\"\",\"fee\":\"0\",\"currency\":\"USD\"}', 14, '2', ''),
(12, 'PayTM', 'paytm', 10, 100000, '2', '{\"method_type\":\"2\",\"name\":\"PayTM ( INR )( UPI \\/ NET BANKING \\/ DEBIT \\/ CREDIT CARD)\",\"min\":\"10\",\"max\":\"100000\",\"merchant_key\":\"IR6iRT5L0tOxBte4\",\"merchant_mid\":\"gVkWqH50536759745964\",\"merchant_website\":\"DEFAULT\",\"fee\":\"0\",\"currency\":\"\"}', 1, '2', ''),
(13, 'Instamojo', 'instamojo', 0, 0, '1', '{\"method_type\":\"2\",\"name\":\"Instamojo\",\"min\":\"0\",\"max\":\"0\",\"api_key\":\"a2bdf5035c16ad6db389caeb5ceb5273\",\"live_auth_token_key\":\"81ef2affdc5ecfde9b88b13e1cd67cd8\",\"fee\":\"0\",\"currency\":\"INR\"}', 15, '2', ''),
(14, 'Paytm Business', 'paytmqr', 10, 1000000, '2', '{\"method_type\":\"2\",\"name\":\"PayTM QR (5% Bonus From 2000rs)\",\"min\":\"10\",\"max\":\"1000000\",\"merchant_key\":\"https:\\/\\/i.imgur.com\\/mlAI1qX.png\",\"merchant_mid\":\"HYJEZD46937702834501\",\"merchant_website\":\"DEFAULT\",\"fee\":\"0\"}', 4, '2', ''),
(15, 'Razorpay', 'razorpay', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Razorpay\",\"min\":\"1\",\"max\":\"0\",\"api_key\":\"0\",\"api_secret_key\":\"0\",\"fee\":\"0\",\"currency\":\"INR\"}', 16, '2', ''),
(16, 'Iyzico', 'iyzico', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Iyzico\",\"min\":\"1\",\"max\":\"0\",\"api_key\":\"0\",\"api_secret_key\":\"0\",\"fee\":\"0\",\"currency\":\"USD\"}', 17, '2', ''),
(17, 'Authorize.net', 'authorize-net', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Authorize.net\",\"min\":\"1\",\"max\":\"0\",\"api_login_id\":\"0\",\"secret_transaction_key\":\"0\",\"fee\":\"0\",\"currency\":\"USD\"}', 18, '2', ''),
(20, 'Ravepay', 'ravepay', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Ravepay\",\"min\":\"1\",\"max\":\"0\",\"public_api_key\":\"0\",\"secret_api_key\":\"0\",\"fee\":\"0\",\"currency\":\"USD\"}', 20, '2', ''),
(21, 'Pagseguro', 'pagseguro', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Pagseguro\",\"min\":\"1\",\"max\":\"0\",\"email_id\":\"0\",\"live_production_token\":\"0\",\"fee\":\"0\",\"currency\":\"USD\"}', 21, '2', ''),
(22, 'Cashmaal', 'Cashmaal', 10, 10000, '2', '{\"method_type\":\"2\",\"name\":\"CashMaal (USD)(JAZZCASH)(EASYPAISA)\",\"min\":\"10\",\"max\":\"10000\",\"web_id\":\"5396\",\"fee\":\"0\",\"currency\":\"USD\"}', 7, '2', ''),
(25, 'Refer & earn', 'refer', 0, 0, '1', '{\"method_type\":\"2\",\"name\":\"Do Not Use\",\"min\":\"1\",\"max\":\"10000\",\"merchant_key\":\"P#n%aKfB3&DRAMqH\",\"merchant_mid\":\"DBWvgX98800736620578\",\"merchant_website\":\"DEFAULT\",\"fee\":\"0\",\"currency\":\"\"}', 25, '1', ''),
(26, 'payumoney', 'payumoney', 10, 0, '1', '{\"method_type\":\"2\",\"name\":\"Payumoney\",\"min\":\"10\",\"max\":\"0\",\"merchant_key\":\"Mv4ctvrc\",\"salt_key\":\"pWUvDRU8CT\",\"fee\":\"10\",\"currency\":\"INR\"}', 19, '2', ''),
(30, 'Freebalance', 'Freebalance', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Freebalance\",\"min\":\"1\",\"max\":\"0\",\"merchant_id\":\"\",\"merchant_key\":\"\",\"merchant_salt\":\"\",\"fee\":\"0\"}', 30, '1', ''),
(31, 'Perfect Money', 'perfectmoney', 5, 0, '2', '{\"method_type\":\"2\",\"name\":\"Perfect Money ( USD ) (MIN 5)\",\"min\":\"5\",\"max\":\"0\",\"passphrase\":\"Manbir25@\",\"usd\":\"U31731375\",\"merchant_website\":\"Viralsmmpanel.com\",\"fee\":\"0\"}', 2, '2', ''),
(32, 'Coinbase', 'Coinbase', 1, 0, '2', '{\"method_type\":\"1\",\"name\":\"Coinbase ( Cryptocurrency )\",\"min\":\"1\",\"max\":\"0\",\"api_key\":\"\",\"webhook_api\":\"\",\"fee\":\"0\"}', 22, '2', ''),
(33, 'Webmoney', 'Webmoney', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Webmoney\",\"min\":\"1\",\"max\":\"0\",\"wmid\":\"\",\"purse\":\"\",\"fee\":\"0\"}', 23, '2', ''),
(34, 'UnitPay', 'UnityPay', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"UnitPay\",\"min\":\"1\",\"max\":\"0\",\"secret_key\":\"\",\"reg_email\":\"\",\"fee\":\"0\"}', 24, '2', ''),
(35, 'Payeer', 'payeer', 10, 0, '2', '{\"method_type\":\"2\",\"name\":\"Payeer ( Paypal + Cryptocurrency + Skrill + Debit\\/Credit Cards + Bank + and more)\",\"min\":\"10\",\"max\":\"0\",\"client_secret\":\"NmjYQjAhbv0SFvoj\",\"m_shop\":\"1600076082\"}', 3, '2', '');

-- --------------------------------------------------------

--
-- Table structure for table `payment_methodsold`
--

CREATE TABLE `payment_methodsold` (
  `id` int(11) NOT NULL,
  `method_name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `method_get` varchar(225) NOT NULL,
  `method_min` double NOT NULL,
  `method_max` double NOT NULL,
  `method_type` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> ON, 1 -> OFF	',
  `method_extras` text NOT NULL,
  `method_line` double NOT NULL,
  `nouse` enum('1','2') NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_methodsold`
--

INSERT INTO `payment_methodsold` (`id`, `method_name`, `method_get`, `method_min`, `method_max`, `method_type`, `method_extras`, `method_line`, `nouse`) VALUES
(1, 'Paypal', 'paypal', 10, 10000, '2', '{\"method_type\":\"2\",\"name\":\"Paypal ( USD ) ( International Payments ) [ 10% Charge ]\",\"min\":\"10\",\"max\":\"10000\",\"client_id\":\"AWWRCH4eG0dDMY_84cDXJVKVsBGSzJpnezbgAB4Qm49cTQ2dJwZWMaWzNAbUv4ojUunW-pgicoYTMA0l\",\"client_secret\":\"EMiHDg3EejaX_ns8h3ybEkgBcm_mbFfPoK_EeNyW_UGX_LJlKxa3lpW9nDf7-gRrQMV1kyUWS1J48NxC\",\"fee\":\"10\"}', 3, '2'),
(2, 'Stripe', 'stripe', 1, 100, '1', '{\"method_type\":\"2\",\"name\":\"Stripe\",\"min\":\"1\",\"max\":\"100\",\"stripe_publishable_key\":\"pk_live_51HiUnRLjkQAtcIW0F983imoO8qhftSSMSj7oB9xTjGHB51su6vnuDmGNs5l2NNZz1XE1Ogf1svxqjtdasRYr3atk00wEAHHKNT\",\"stripe_secret_key\":\"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\",\"stripe_webhooks_secret\":\"whsec_gSvhMz0eOIOTk5S9uzzzDgpHeclOmiDe\",\"fee\":\"10\",\"currency\":\"USD\"}', 4, '2'),
(3, 'Shopier', 'shopier', 5, 0, '1', '{\"method_type\":\"1\",\"name\":\"Kredi \\/ Banka Kart\\u0131 ile \\u00d6de\",\"min\":\"5\",\"max\":\"0\",\"apiKey\":\"\",\"apiSecret\":\"\",\"website_index\":\"1\",\"processing_fee\":\"1\",\"fee\":\"10\",\"currency\":\"USD\"}', 5, '2'),
(5, 'Paywant', 'paywant', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Paywant\",\"min\":\"1\",\"max\":\"0\",\"apiKey\":\"\",\"apiSecret\":\"\",\"fee\":\"0\",\"currency\":\"USD\",\"commissionType\":\"2\",\"payment_type\":[\"1\",\"2\",\"3\"]}', 6, '2'),
(7, 'PayTR', 'paytr', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Paytr\",\"min\":\"1\",\"max\":\"0\",\"merchant_id\":\"\",\"merchant_key\":\"\",\"merchant_salt\":\"\",\"fee\":\"0\",\"currency\":\"USD\"}', 7, '2'),
(8, 'Coinpayments', 'coinpayments', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Coinpayments\",\"min\":\"1\",\"max\":\"0\",\"coinpayments_public_key\":\"\",\"coinpayments_private_key\":\"\",\"coinpayments_currency\":\"LTCT\",\"merchant_id\":\"\",\"ipn_secret\":\"\",\"fee\":\"0\",\"currency\":\"USD\"}', 8, '2'),
(9, '2checkout', '2checkout', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"2checkout\",\"min\":\"1\",\"max\":\"0\",\"seller_id\":\"\",\"private_key\":\"\",\"fee\":\"1\",\"currency\":\"USD\"}', 9, '2'),
(10, 'Payoneer', 'payoneer', 1, 0, '1', '{\"method_type\":\"2\",\"name\":\"Payoneer\",\"email\":\"fazilakbulut@outlook.com\"}', 10, '2'),
(11, 'Mollie', 'mollie', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Mollie\",\"min\":\"1\",\"max\":\"0\",\"live_api_key\":\"\",\"fee\":\"0\",\"currency\":\"USD\"}', 11, '2'),
(12, 'PayTM', 'paytm', 10, 100000, '2', '{\"method_type\":\"2\",\"name\":\"PayTM ( INR )( UPI \\/ NET BANKING \\/ DEBIT \\/ CREDIT CARD)\",\"min\":\"10\",\"max\":\"100000\",\"merchant_key\":\"IR6iRT5L0tOxBte4\",\"merchant_mid\":\"gVkWqH50536759745964\",\"merchant_website\":\"DEFAULT\",\"fee\":\"0\",\"currency\":\"\"}', 2, '2'),
(13, 'Instamojo', 'instamojo', 0, 0, '1', '{\"method_type\":\"2\",\"name\":\"Instamojo\",\"min\":\"0\",\"max\":\"0\",\"api_key\":\"a2bdf5035c16ad6db389caeb5ceb5273\",\"live_auth_token_key\":\"81ef2affdc5ecfde9b88b13e1cd67cd8\",\"fee\":\"0\",\"currency\":\"INR\"}', 12, '2'),
(14, 'Paytm Business', 'paytmqr', 10, 1000000, '2', '{\"method_type\":\"2\",\"name\":\"PayTM QR (5% Bonus From 2000rs)\",\"min\":\"10\",\"max\":\"1000000\",\"merchant_key\":\"https:\\/\\/i.imgur.com\\/mlAI1qX.png\",\"merchant_mid\":\"HYJEZD46937702834501\",\"merchant_website\":\"DEFAULT\",\"fee\":\"0\"}', 1, '2'),
(15, 'Razorpay', 'razorpay', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Razorpay\",\"min\":\"1\",\"max\":\"0\",\"api_key\":\"0\",\"api_secret_key\":\"0\",\"fee\":\"0\",\"currency\":\"INR\"}', 13, '2'),
(16, 'Iyzico', 'iyzico', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Iyzico\",\"min\":\"1\",\"max\":\"0\",\"api_key\":\"0\",\"api_secret_key\":\"0\",\"fee\":\"0\",\"currency\":\"USD\"}', 14, '2'),
(17, 'Authorize.net', 'authorize-net', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Authorize.net\",\"min\":\"1\",\"max\":\"0\",\"api_login_id\":\"0\",\"secret_transaction_key\":\"0\",\"fee\":\"0\",\"currency\":\"USD\"}', 15, '2'),
(20, 'Ravepay', 'ravepay', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Ravepay\",\"min\":\"1\",\"max\":\"0\",\"public_api_key\":\"0\",\"secret_api_key\":\"0\",\"fee\":\"0\",\"currency\":\"USD\"}', 17, '2'),
(21, 'Pagseguro', 'pagseguro', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Pagseguro\",\"min\":\"1\",\"max\":\"0\",\"email_id\":\"0\",\"live_production_token\":\"0\",\"fee\":\"0\",\"currency\":\"USD\"}', 18, '2'),
(22, 'Cashmaal', 'Cashmaal', 1, 10000, '2', '{\"method_type\":\"2\",\"name\":\"CashMaal (USD)(JAZZCASH)(EASYPAISA)\",\"min\":\"1\",\"max\":\"10000\",\"web_id\":\"5396\",\"fee\":\"0\",\"currency\":\"USD\"}', 19, '2'),
(25, 'Refer & earn', 'refer', 0, 0, '1', '{\"method_type\":\"2\",\"name\":\"Do Not Use\",\"min\":\"1\",\"max\":\"10000\",\"merchant_key\":\"P#n%aKfB3&DRAMqH\",\"merchant_mid\":\"DBWvgX98800736620578\",\"merchant_website\":\"DEFAULT\",\"fee\":\"0\",\"currency\":\"\"}', 25, '1'),
(26, 'payumoney', 'payumoney', 10, 0, '1', '{\"method_type\":\"2\",\"name\":\"Payumoney\",\"min\":\"10\",\"max\":\"0\",\"merchant_key\":\"Mv4ctvrc\",\"salt_key\":\"pWUvDRU8CT\",\"fee\":\"10\",\"currency\":\"INR\"}', 16, '2'),
(30, 'Freebalance', 'Freebalance', 1, 0, '1', '{\"method_type\":\"1\",\"name\":\"Freebalance\",\"min\":\"1\",\"max\":\"0\",\"merchant_id\":\"\",\"merchant_key\":\"\",\"merchant_salt\":\"\",\"fee\":\"0\"}', 30, '1');

-- --------------------------------------------------------

--
-- Table structure for table `referral`
--

CREATE TABLE `referral` (
  `referral_id` int(11) NOT NULL,
  `referral_client_id` int(11) NOT NULL,
  `referral_clicks` double NOT NULL DEFAULT '0',
  `referral_sign_up` double NOT NULL DEFAULT '0',
  `referral_totalFunds_byReffered` double NOT NULL DEFAULT '0',
  `referral_earned_commision` double DEFAULT '0',
  `referral_requested_commision` varchar(225) DEFAULT '0',
  `referral_total_commision` double DEFAULT '0',
  `referral_status` enum('1','2') NOT NULL DEFAULT '1',
  `referral_code` text NOT NULL,
  `referral_rejected_commision` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `referral`
--

INSERT INTO `referral` (`referral_id`, `referral_client_id`, `referral_clicks`, `referral_sign_up`, `referral_totalFunds_byReffered`, `referral_earned_commision`, `referral_requested_commision`, `referral_total_commision`, `referral_status`, `referral_code`, `referral_rejected_commision`) VALUES
(1, 1, 0, 0, 0, 0, '0', 0, '1', '463a1d', 0),
(2, 2, 0, 0, 0, 0, '0', 0, '1', '1060f1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `referral_payouts`
--

CREATE TABLE `referral_payouts` (
  `r_p_id` int(11) NOT NULL,
  `r_p_code` text NOT NULL,
  `r_p_status` enum('1','2','3','4','0') NOT NULL DEFAULT '0',
  `r_p_amount_requested` double NOT NULL,
  `r_p_requested_at` datetime NOT NULL,
  `r_p_updated_at` datetime NOT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `refill_status`
--

CREATE TABLE `refill_status` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `refill_apiid` int(11) DEFAULT NULL,
  `order_url` text NOT NULL,
  `creation_date` datetime DEFAULT NULL,
  `ending_date` date DEFAULT NULL,
  `service_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `refill_status` enum('Pending','Refilling','Completed','Rejected','Error') DEFAULT 'Pending',
  `order_apiid` int(11) DEFAULT '0',
  `refill_response` text,
  `refill_where` enum('site','api') DEFAULT 'site'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `serviceapi_alert`
--

CREATE TABLE `serviceapi_alert` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `serviceapi_alert` text NOT NULL,
  `servicealert_extra` text NOT NULL,
  `servicealert_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL,
  `service_api` int(11) NOT NULL DEFAULT '0',
  `api_service` int(11) NOT NULL DEFAULT '0',
  `api_servicetype` enum('1','2') NOT NULL DEFAULT '2',
  `api_detail` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `service_line` double NOT NULL,
  `service_type` enum('1','2') NOT NULL DEFAULT '2',
  `service_package` enum('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17') NOT NULL,
  `service_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `service_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `service_price` varchar(225) NOT NULL,
  `service_min` double NOT NULL,
  `service_max` double NOT NULL,
  `service_dripfeed` enum('1','2') NOT NULL DEFAULT '1',
  `service_autotime` double NOT NULL DEFAULT '0',
  `service_autopost` double NOT NULL DEFAULT '0',
  `service_speed` enum('1','2','3','4') NOT NULL,
  `want_username` enum('1','2') NOT NULL DEFAULT '1',
  `service_secret` enum('1','2') NOT NULL DEFAULT '2',
  `price_type` enum('normal','percent','amount') NOT NULL DEFAULT 'normal',
  `price_cal` text,
  `instagram_second` enum('1','2') NOT NULL DEFAULT '2',
  `start_count` enum('none','instagram_follower','instagram_photo','') NOT NULL,
  `instagram_private` enum('1','2') NOT NULL,
  `name_lang` varchar(225) DEFAULT 'en',
  `description_lang` text,
  `time_lang` varchar(225) NOT NULL DEFAULT 'Not enough data',
  `time` varchar(225) NOT NULL DEFAULT 'Not enough data',
  `cancelbutton` enum('1','2') NOT NULL DEFAULT '2' COMMENT '1 -> ON, 2 -> OFF',
  `show_refill` enum('true','false') NOT NULL DEFAULT 'false',
  `service_profit` varchar(225) NOT NULL,
  `refill_days` varchar(225) NOT NULL DEFAULT '30',
  `refill_hours` varchar(225) NOT NULL DEFAULT '24',
  `avg_days` int(11) NOT NULL,
  `avg_hours` int(11) NOT NULL,
  `avg_minutes` int(11) NOT NULL,
  `avg_many` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`service_id`, `service_api`, `api_service`, `api_servicetype`, `api_detail`, `category_id`, `service_line`, `service_type`, `service_package`, `service_name`, `service_description`, `service_price`, `service_min`, `service_max`, `service_dripfeed`, `service_autotime`, `service_autopost`, `service_speed`, `want_username`, `service_secret`, `price_type`, `price_cal`, `instagram_second`, `start_count`, `instagram_private`, `name_lang`, `description_lang`, `time_lang`, `time`, `cancelbutton`, `show_refill`, `service_profit`, `refill_days`, `refill_hours`, `avg_days`, `avg_hours`, `avg_minutes`, `avg_many`) VALUES
(1, 0, 0, '2', '', 1, 1, '2', '1', 'https://smmpanelscriptstore.com', NULL, '1', 1, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'instagram_follower', '1', '{\"en\":\"https:\\/\\/smmpanelscriptstore.com\"}', NULL, 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `service_api`
--

CREATE TABLE `service_api` (
  `id` int(11) NOT NULL,
  `api_name` varchar(225) NOT NULL,
  `api_url` text NOT NULL,
  `api_key` varchar(225) NOT NULL,
  `api_type` int(11) NOT NULL,
  `api_limit` double NOT NULL DEFAULT '0',
  `currency` enum('INR','USD') DEFAULT NULL,
  `api_alert` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> Gönder, 1 -> Gönderildi',
  `status` enum('1','2') NOT NULL DEFAULT '2'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `site_seo` text NOT NULL,
  `site_title` text,
  `site_description` text,
  `site_keywords` text,
  `site_logo` text,
  `site_name` text,
  `site_currency` varchar(2555) NOT NULL DEFAULT 'try',
  `favicon` text,
  `site_language` varchar(225) NOT NULL DEFAULT 'tr',
  `site_theme` text NOT NULL,
  `site_theme_alt` text,
  `recaptcha` enum('1','2') NOT NULL DEFAULT '1',
  `recaptcha_key` text,
  `recaptcha_secret` text,
  `custom_header` text,
  `custom_footer` text,
  `ticket_system` enum('1','2') NOT NULL DEFAULT '2',
  `register_page` enum('1','2') NOT NULL DEFAULT '2',
  `service_speed` enum('1','2') NOT NULL,
  `service_list` enum('1','2') NOT NULL,
  `dolar_charge` double NOT NULL,
  `euro_charge` double NOT NULL,
  `smtp_user` text NOT NULL,
  `smtp_pass` text NOT NULL,
  `smtp_server` text NOT NULL,
  `smtp_port` varchar(225) NOT NULL,
  `smtp_protocol` enum('0','ssl','tls') NOT NULL,
  `alert_type` enum('1','2','3') NOT NULL,
  `alert_apimail` enum('1','2') NOT NULL,
  `alert_newmanuelservice` enum('1','2') NOT NULL,
  `alert_newticket` enum('1','2') NOT NULL,
  `alert_apibalance` enum('1','2') NOT NULL,
  `alert_serviceapialert` enum('1','2') NOT NULL,
  `sms_provider` varchar(225) NOT NULL,
  `sms_title` varchar(225) NOT NULL,
  `sms_user` varchar(225) NOT NULL,
  `sms_pass` varchar(225) NOT NULL,
  `sms_validate` enum('0','1') NOT NULL DEFAULT '0' COMMENT '1 -> OK, 0 -> NO',
  `admin_mail` varchar(225) NOT NULL,
  `admin_telephone` varchar(225) NOT NULL,
  `resetpass_page` enum('1','2') NOT NULL,
  `resetpass_sms` enum('1','2') NOT NULL,
  `resetpass_email` enum('1','2') NOT NULL,
  `site_maintenance` enum('1','2') NOT NULL DEFAULT '2',
  `servis_siralama` varchar(255) NOT NULL,
  `bronz_statu` int(11) NOT NULL,
  `silver_statu` int(11) NOT NULL,
  `gold_statu` int(11) NOT NULL,
  `bayi_statu` int(11) NOT NULL,
  `ns1` varchar(191) DEFAULT NULL,
  `ns2` varchar(191) DEFAULT NULL,
  `childpanel_price` double DEFAULT NULL,
  `snow_effect` enum('1','2') NOT NULL DEFAULT '2',
  `snow_colour` text NOT NULL,
  `promotion` enum('1','2') DEFAULT '2',
  `referral_commision` double NOT NULL,
  `referral_payout` double NOT NULL,
  `referral_status` enum('1','2') NOT NULL DEFAULT '1',
  `childpanel_selling` enum('1','2') NOT NULL DEFAULT '1',
  `tickets_per_user` double NOT NULL DEFAULT '5',
  `name_fileds` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1 -> ON, 2 -> NO',
  `skype_feilds` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1 -> ON, 2 -> NO',
  `csymbol` text NOT NULL,
  `inr_symbol` text NOT NULL,
  `inr_value` double NOT NULL DEFAULT '0',
  `usd_symbol` text NOT NULL,
  `inr_convert` double NOT NULL DEFAULT '0',
  `otp_login` enum('1','2','0') NOT NULL DEFAULT '0',
  `auto_deactivate_payment` enum('1','2') NOT NULL DEFAULT '1',
  `service_avg_time` enum('1','0') NOT NULL DEFAULT '0',
  `alert_orderfail` enum('1','2') NOT NULL DEFAULT '2',
  `alert_welcomemail` enum('1','2') NOT NULL DEFAULT '2',
  `freebalance` enum('1','2') NOT NULL DEFAULT '1',
  `freeamount` double DEFAULT '0',
  `alert_newmessage` enum('1','2') NOT NULL DEFAULT '1',
  `email_confirmation` enum('1','2') NOT NULL DEFAULT '2',
  `resend_max` int(11) NOT NULL,
  `orders` int(255) NOT NULL,
  `orders_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT '1',
  `neworder_blocks` enum('1','2') NOT NULL DEFAULT '2',
  `decoration_ligts` enum('1','2') NOT NULL DEFAULT '2'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `site_seo`, `site_title`, `site_description`, `site_keywords`, `site_logo`, `site_name`, `site_currency`, `favicon`, `site_language`, `site_theme`, `site_theme_alt`, `recaptcha`, `recaptcha_key`, `recaptcha_secret`, `custom_header`, `custom_footer`, `ticket_system`, `register_page`, `service_speed`, `service_list`, `dolar_charge`, `euro_charge`, `smtp_user`, `smtp_pass`, `smtp_server`, `smtp_port`, `smtp_protocol`, `alert_type`, `alert_apimail`, `alert_newmanuelservice`, `alert_newticket`, `alert_apibalance`, `alert_serviceapialert`, `sms_provider`, `sms_title`, `sms_user`, `sms_pass`, `sms_validate`, `admin_mail`, `admin_telephone`, `resetpass_page`, `resetpass_sms`, `resetpass_email`, `site_maintenance`, `servis_siralama`, `bronz_statu`, `silver_statu`, `gold_statu`, `bayi_statu`, `ns1`, `ns2`, `childpanel_price`, `snow_effect`, `snow_colour`, `promotion`, `referral_commision`, `referral_payout`, `referral_status`, `childpanel_selling`, `tickets_per_user`, `name_fileds`, `skype_feilds`, `csymbol`, `inr_symbol`, `inr_value`, `usd_symbol`, `inr_convert`, `otp_login`, `auto_deactivate_payment`, `service_avg_time`, `alert_orderfail`, `alert_welcomemail`, `freebalance`, `freeamount`, `alert_newmessage`, `email_confirmation`, `resend_max`, `orders`, `orders_id`, `status`, `neworder_blocks`, `decoration_ligts`) VALUES
(1, 'Smm Panel', 'Smm Panel', 'Best and Cheap SMM Panel for Instagram, Tiktok, Facebook, Youtube and Twitter. Buy IG Reels views and Followers, Buy Instagram Likes, Views and Comments, Buy TikTok Likes and Followers, Buy Facebook Likes and Comments, Buy Youtube Likes, Views and Subscribers.\r\n', 'smm panel,smmpanel,SMM Panel India,SMM Panel Paytm,SMM Panel Cheap India,SMM Reseller Panel,SMM Reseller Panel India,Cheap SMM Panel,cheapest SMM panel,cheap SMM panel india,Cheapest SMM Reseller Panel,Cheapest SMM Panel Paytm,Cheapest SMM Panel Paytm,indian smm panel,IndianSMM Reseller Panel,Best SMM panel,Best SMM Panel India,Top SMM Panel', '', 'bulk', 'USD', '', 'en', 'Bulk', 'Blue', '1', '6LfQ414eAAAAAD0B3Nx7vmhg3rw8Ae7T-4dfI1ii', '6LfQ414eAAAAAL3jYAvNPi5xJJ6M89CcdFFxritH', '', '', '1', '2', '1', '2', 0, 0, '', '121345', '', '465', 'ssl', '2', '2', '2', '2', '2', '2', 'bizimsms', '', '', '', '1', '', '', '2', '1', '2', '2', 'asc', 500, 2500, 10000, 15000, 'rental1.mysecurepanel.com', 'rental2.mysecurepanel.com', 10, '2', '#ffffff', '1', 5, 10, '2', '2', 9999999999, '2', '2', '$', '₹', 74.87, '$', 0.013, '0', '1', '1', '2', '2', '1', 0, '2', '2', 1, 191530, 80, '0', '2', '2');

-- --------------------------------------------------------

--
-- Table structure for table `sync_logs`
--

CREATE TABLE `sync_logs` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `action` varchar(225) NOT NULL,
  `date` datetime NOT NULL,
  `description` varchar(225) NOT NULL,
  `api_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` int(11) NOT NULL,
  `theme_name` text NOT NULL,
  `theme_dirname` text NOT NULL,
  `theme_extras` text NOT NULL,
  `last_modified` datetime NOT NULL,
  `newpage` text NOT NULL,
  `colour` enum('1','2') NOT NULL DEFAULT '1',
  `site_theme_alt` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `theme_name`, `theme_dirname`, `theme_extras`, `last_modified`, `newpage`, `colour`, `site_theme_alt`) VALUES
(1, 'Bulk', 'Bulk', '', '2022-03-04 01:14:03', '{% include \'header.twig\' %}\r\n	<br><br><br>\r\n	\r\n	<div class=\"container-fluid container-fluid-spacious\">\r\n		<div class=\"row\">\r\n			<div class=\"col-md-12\">\r\n			{% if contentText %}\r\n{{ contentText }}\r\n{% endif %}\r\n				{% if contentText2 %}\r\n{{ contentText2 }}\r\n{% endif %}\r\n				\r\n			</div>\r\n		</div>\r\n	</div>\r\n   \r\n      \r\n        \r\n   ', '2', '');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `subject` varchar(225) NOT NULL,
  `time` datetime NOT NULL,
  `lastupdate_time` datetime NOT NULL,
  `client_new` enum('1','2') NOT NULL DEFAULT '2',
  `status` enum('pending','answered','closed') NOT NULL DEFAULT 'pending',
  `support_new` enum('1','2') NOT NULL DEFAULT '1',
  `canmessage` enum('1','2') NOT NULL DEFAULT '2'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_reply`
--

CREATE TABLE `ticket_reply` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `support` enum('1','2') NOT NULL DEFAULT '1',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `readed` enum('1','2') NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_subjects`
--

CREATE TABLE `ticket_subjects` (
  `subject_id` int(11) NOT NULL,
  `subject` varchar(225) NOT NULL,
  `content` text,
  `auto_reply` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ticket_subjects`
--

INSERT INTO `ticket_subjects` (`subject_id`, `subject`, `content`, `auto_reply`) VALUES
(2, 'Payment', '', '0'),
(4, 'Complaint & Suggestion', '', '0'),
(6, 'Others', '', '0');

-- --------------------------------------------------------

--
-- Table structure for table `units_per_page`
--

CREATE TABLE `units_per_page` (
  `id` int(11) NOT NULL,
  `unit` int(11) NOT NULL,
  `page` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `units_per_page`
--

INSERT INTO `units_per_page` (`id`, `unit`, `page`) VALUES
(1, 50, 'clients'),
(2, 50, 'orders'),
(3, 50, 'payments'),
(4, 50, 'refill'),
(5, 50, 'bulk');

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `u_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `action` varchar(225) NOT NULL,
  `date` datetime NOT NULL,
  `description` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'Not enough data'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bulkedit`
--
ALTER TABLE `bulkedit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `childpanels`
--
ALTER TABLE `childpanels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `clients_category`
--
ALTER TABLE `clients_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients_price`
--
ALTER TABLE `clients_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients_service`
--
ALTER TABLE `clients_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_report`
--
ALTER TABLE `client_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `earn`
--
ALTER TABLE `earn`
  ADD PRIMARY KEY (`earn_id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `General_options`
--
ALTER TABLE `General_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `integrations`
--
ALTER TABLE `integrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kuponlar`
--
ALTER TABLE `kuponlar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kupon_kullananlar`
--
ALTER TABLE `kupon_kullananlar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Mailforms`
--
ALTER TABLE `Mailforms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications_popup`
--
ALTER TABLE `notifications_popup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`) USING BTREE;

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `panel_categories`
--
ALTER TABLE `panel_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `panel_info`
--
ALTER TABLE `panel_info`
  ADD PRIMARY KEY (`panel_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `payments_bonus`
--
ALTER TABLE `payments_bonus`
  ADD PRIMARY KEY (`bonus_id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_methodsold`
--
ALTER TABLE `payment_methodsold`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referral`
--
ALTER TABLE `referral`
  ADD PRIMARY KEY (`referral_id`);

--
-- Indexes for table `referral_payouts`
--
ALTER TABLE `referral_payouts`
  ADD PRIMARY KEY (`r_p_id`);

--
-- Indexes for table `refill_status`
--
ALTER TABLE `refill_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `serviceapi_alert`
--
ALTER TABLE `serviceapi_alert`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `service_api`
--
ALTER TABLE `service_api`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sync_logs`
--
ALTER TABLE `sync_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Indexes for table `ticket_reply`
--
ALTER TABLE `ticket_reply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_subjects`
--
ALTER TABLE `ticket_subjects`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `units_per_page`
--
ALTER TABLE `units_per_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`u_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bulkedit`
--
ALTER TABLE `bulkedit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `childpanels`
--
ALTER TABLE `childpanels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `clients_category`
--
ALTER TABLE `clients_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients_price`
--
ALTER TABLE `clients_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients_service`
--
ALTER TABLE `clients_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_report`
--
ALTER TABLE `client_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `earn`
--
ALTER TABLE `earn`
  MODIFY `earn_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `General_options`
--
ALTER TABLE `General_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `integrations`
--
ALTER TABLE `integrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `kuponlar`
--
ALTER TABLE `kuponlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kupon_kullananlar`
--
ALTER TABLE `kupon_kullananlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Mailforms`
--
ALTER TABLE `Mailforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notifications_popup`
--
ALTER TABLE `notifications_popup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=904;

--
-- AUTO_INCREMENT for table `panel_categories`
--
ALTER TABLE `panel_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `panel_info`
--
ALTER TABLE `panel_info`
  MODIFY `panel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payments_bonus`
--
ALTER TABLE `payments_bonus`
  MODIFY `bonus_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `payment_methodsold`
--
ALTER TABLE `payment_methodsold`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `referral`
--
ALTER TABLE `referral`
  MODIFY `referral_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `referral_payouts`
--
ALTER TABLE `referral_payouts`
  MODIFY `r_p_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refill_status`
--
ALTER TABLE `refill_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `serviceapi_alert`
--
ALTER TABLE `serviceapi_alert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `service_api`
--
ALTER TABLE `service_api`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sync_logs`
--
ALTER TABLE `sync_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=268;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_reply`
--
ALTER TABLE `ticket_reply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_subjects`
--
ALTER TABLE `ticket_subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `units_per_page`
--
ALTER TABLE `units_per_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
