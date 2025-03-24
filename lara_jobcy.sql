-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2025 at 09:09 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lara_jobcy`
--

-- --------------------------------------------------------

--
-- Table structure for table `activations`
--

CREATE TABLE `activations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(120) NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activations`
--

INSERT INTO `activations` (`id`, `user_id`, `code`, `completed`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'ZQCuesGJUEtnmXyHpY9R3JK7vQK3W4m1', 1, '2023-10-23 05:12:27', '2023-10-23 05:12:26', '2023-10-23 05:12:27'),
(2, 2, 'MYPyczATn3jd9qSKAXMPbrwf4YAQZPfE', 1, '2023-10-23 05:12:27', '2023-10-23 05:12:27', '2023-10-23 05:12:27');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `action_label` varchar(191) DEFAULT NULL,
  `action_url` varchar(191) DEFAULT NULL,
  `description` varchar(400) NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_histories`
--

CREATE TABLE `audit_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `module` varchar(60) NOT NULL,
  `request` text DEFAULT NULL,
  `action` varchar(120) NOT NULL,
  `user_agent` text DEFAULT NULL,
  `ip_address` varchar(39) DEFAULT NULL,
  `reference_user` bigint(20) UNSIGNED NOT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `reference_name` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audit_histories`
--

INSERT INTO `audit_histories` (`id`, `user_id`, `module`, `request`, `action`, `user_agent`, `ip_address`, `reference_user`, `reference_id`, `reference_name`, `type`, `created_at`, `updated_at`) VALUES
(12, 1, 'of the system', '[]', 'logged out', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '127.0.0.1', 1, 1, 'Super Admin', 'info', '2025-03-24 02:38:19', '2025-03-24 02:38:19'),
(13, 2, 'to the system', NULL, 'logged in', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '127.0.0.1', 0, 2, 'Normal Admin', 'info', '2025-03-24 02:38:40', '2025-03-24 02:38:40');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `description` varchar(400) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `author_type` varchar(255) NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `description`, `status`, `author_id`, `author_type`, `icon`, `order`, `is_featured`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Design', 0, 'Dolorem adipisci dolorum consequuntur et molestiae est. Rerum illo qui sequi officia nam ratione laboriosam. Enim quo sint ut enim cum. Et atque et fugiat ducimus voluptas ea.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 1, '2023-07-10 00:34:50', '2023-07-10 00:34:50'),
(2, 'Lifestyle', 0, 'Et magnam autem optio sit laborum quia deleniti inventore. Ex minus vel facere doloremque et doloremque soluta accusantium. Vitae autem consequatur mollitia vel iusto ea aut omnis.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2023-07-10 00:34:50', '2023-07-10 00:34:50'),
(3, 'Travel Tips', 2, 'Suscipit aliquam in recusandae repudiandae inventore. Vero repellat ut omnis neque aut quod. Eum aut ipsum quidem et quibusdam praesentium eum.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2023-07-10 00:34:50', '2023-07-10 00:34:50'),
(4, 'Healthy', 0, 'Adipisci perspiciatis modi pariatur assumenda. Reprehenderit sint laborum omnis et sit.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2023-07-10 00:34:50', '2023-07-10 00:34:50'),
(5, 'Travel Tips', 4, 'A eos alias velit officia cupiditate perspiciatis. Non unde sit architecto omnis. Fugiat iusto ducimus eaque alias itaque consequatur facere.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2023-07-10 00:34:50', '2023-07-10 00:34:50'),
(6, 'Hotel', 0, 'Voluptatum eius inventore error modi delectus. Sed nemo aut ad. Eos id inventore nam praesentium.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2023-07-10 00:34:50', '2023-07-10 00:34:50'),
(7, 'Nature', 6, 'Mollitia dolores aliquam voluptas qui quis est. Dignissimos officiis modi quia possimus qui nostrum voluptatum. Alias quis velit cum id velit quos exercitationem et.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2023-07-10 00:34:50', '2023-07-10 00:34:50');

-- --------------------------------------------------------

--
-- Table structure for table `categories_translations`
--

CREATE TABLE `categories_translations` (
  `lang_code` varchar(191) NOT NULL,
  `categories_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `record_id` varchar(40) DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `state_id`, `country_id`, `record_id`, `order`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Dothan', 1, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(2, 'Hoover', 1, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(3, 'Mobile', 1, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(4, 'Huntsville', 1, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(5, 'Montgomery', 1, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(6, 'Tuscaloosa', 1, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(7, 'Birmingham', 1, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(8, 'Anchorage', 2, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(9, 'Mesa', 4, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(10, 'Tucson', 4, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(11, 'San Tan Valley', 4, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(12, 'Glendale', 4, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(13, 'Chandler', 4, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(14, 'Casas Adobes', 4, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(15, 'Gilbert', 4, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(16, 'Avondale', 4, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(17, 'Goodyear', 4, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(18, 'Surprise', 4, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(19, 'Tempe', 4, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(20, 'Scottsdale', 4, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(21, 'Phoenix', 4, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(22, 'Flagstaff', 4, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(23, 'Yuma', 4, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(24, 'Fort Smith', 5, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(25, 'Jonesboro', 5, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(26, 'Springdale', 5, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(27, 'Fayetteville', 5, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(28, 'North Little Rock', 5, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(29, 'Little Rock', 5, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(30, 'Carmichael', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(31, 'Daly City', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(32, 'Murrieta', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(33, 'Antioch', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(34, 'Victorville', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(35, 'Richmond', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(36, 'Fullerton', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(37, 'Newport Beach', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(38, 'Jurupa Valley', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(39, 'Anaheim', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(40, 'Santa Ana', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(41, 'Sunnyvale', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(42, 'Costa Mesa', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(43, 'Santa Barbara', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(44, 'Lake Forest', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(45, 'Chino', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(46, 'Moreno Valley', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(47, 'Oakland', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(48, 'Apple Valley', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(49, 'Davis', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(50, 'Los Angeles', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(51, 'Union City', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(52, 'Redlands', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(53, 'Palmdale', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(54, 'Fremont', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(55, 'South San Francisco', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(56, 'Redding', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(57, 'Fontana', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(58, 'Lancaster', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(59, 'Carlsbad', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(60, 'Vallejo', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(61, 'Bellflower', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(62, 'Menifee', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(63, 'Livermore', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(64, 'Hemet', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(65, 'Tracy', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(66, 'Camarillo', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(67, 'Bk', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(68, 'Vista', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(69, 'Garden Grove', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(70, 'Westminster', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(71, 'Irvine', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(72, 'Turlock', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(73, 'Riverside', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(74, 'Berkeley', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(75, 'Chino Hills', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(76, 'Clovis', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(77, 'Torrance', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(78, 'Corona', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(79, 'Fairfield', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(80, 'Downey', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(81, 'Temecula', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(82, 'Concord', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(83, 'Rancho Cordova', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(84, 'Merced', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(85, 'San Leandro', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(86, 'Vacaville', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(87, 'El Cajon', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(88, 'Alhambra', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(89, 'Carson', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(90, 'Citrus Heights', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(91, 'Fresno', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(92, 'San Bernardino', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(93, 'Redwood City', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(94, 'Upland', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(95, 'West Covina', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(96, 'Compton', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(97, 'Long Beach', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(98, 'San Diego', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(99, 'Hawthorne', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(100, 'Arden-Arcade', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(101, 'Santa Rosa', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(102, 'Elk Grove', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(103, 'Redondo Beach', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(104, 'Santa Clara', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(105, 'Milpitas', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(106, 'Alameda', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(107, 'South Gate', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(108, 'San Ramon', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(109, 'Folsom', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(110, 'Roseville', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(111, 'San Buenaventura', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(112, 'Tustin', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(113, 'Lynwood', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(114, 'Indio', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(115, 'San Francisco', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(116, 'San Clemente', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(117, 'Orange', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(118, 'Pleasanton', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(119, 'Thousand Oaks', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(120, 'Chico', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(121, 'Sacramento', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(122, 'Simi Valley', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(123, 'San Marcos', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(124, 'Escondido', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(125, 'Napa', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(126, 'Chula Vista', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(127, 'Salinas', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(128, 'Pasadena', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(129, 'Bakersfield', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(130, 'Santa Maria', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(131, 'Oxnard', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(132, 'Modesto', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(133, 'Baldwin Park', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(134, 'Hesperia', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(135, 'East Los Angeles', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(136, 'Whittier', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(137, 'Huntington Beach', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(138, 'Inglewood', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(139, 'San Jose', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(140, 'Perris', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(141, 'Visalia', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(142, 'Mission Viejo', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(143, 'Manteca', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(144, 'Florence-Graham', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(145, 'Rialto', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(146, 'San Mateo', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(147, 'Mountain View', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(148, 'Santa Clarita', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(149, 'Buena Park', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(150, 'Pittsburg', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(151, 'Oceanside', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(152, 'Rancho Cucamonga', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(153, 'Yorba Linda', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(154, 'Hayward', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(155, 'Laguna Niguel', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(156, 'Palo Alto', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(157, 'Yuba City', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(158, 'El Monte', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(159, 'Stockton', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(160, 'Ontario', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(161, 'Santa Monica', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(162, 'Pomona', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(163, 'Walnut Creek', 6, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(164, 'Lakewood', 7, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(165, 'Boulder', 7, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(166, 'Fort Collins', 7, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(167, 'Aurora', 7, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(168, 'Loveland', 7, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(169, 'Colorado Springs', 7, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(170, 'Longmont', 7, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(171, 'Centennial', 7, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(172, 'Arvada', 7, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(173, 'Thornton', 7, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(174, 'Greeley', 7, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(175, 'Pueblo', 7, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(176, 'Highlands Ranch', 7, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(177, 'Denver', 7, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(178, 'Broomfield', 7, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(179, 'Waterbury', 8, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(180, 'New Haven', 8, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(181, 'Norwalk', 8, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(182, 'New Britain', 8, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(183, 'Hartford', 8, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(184, 'Stamford', 8, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(185, 'Bridgeport', 8, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(186, 'Danbury', 8, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(187, 'Wilmington', 9, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(188, 'Washington', 10, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(189, 'Largo', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(190, 'Palm Coast', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(191, 'Poinciana', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(192, 'Lehigh Acres', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(193, 'Boca Raton', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(194, 'Lakeland', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(195, 'West Palm Beach', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(196, 'Coral Springs', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(197, 'Fort Lauderdale', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(198, 'Jacksonville', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(199, 'Weston', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(200, 'Town \'n\' Country', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(201, 'Riverview', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(202, 'Kendall', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(203, 'Alafaya', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(204, 'Palm Bay', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(205, 'Cape Coral', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(206, 'Saint Petersburg', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(207, 'Tampa', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(208, 'Pembroke Pines', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(209, 'Pine Hills', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(210, 'Pompano Beach', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(211, 'Davie', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(212, 'Sunrise', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(213, 'Kissimmee', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(214, 'Clearwater', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(215, 'Hollywood', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(216, 'Port Saint Lucie', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(217, 'Miramar', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(218, 'Miami Gardens', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(219, 'Boynton Beach', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(220, 'Deerfield Beach', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(221, 'Miami', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(222, 'Plantation', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(223, 'Gainesville', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(224, 'Miami Beach', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(225, 'Hialeah', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(226, 'The Villages', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(227, 'Deltona', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(228, 'Homestead', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(229, 'Tallahassee', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(230, 'Lauderhill', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(231, 'Delray Beach', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(232, 'Melbourne', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(233, 'Brandon', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(234, 'Spring Hill', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(235, 'Orlando', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(236, 'Fort Myers', 12, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(237, 'Sandy Springs', 13, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(238, 'Columbus', 13, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(239, 'Albany', 13, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(240, 'Augusta-Richmond County consolidated government', 13, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(241, 'Savannah', 13, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(242, 'Atlanta', 13, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(243, 'Roswell', 13, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(244, 'Johns Creek', 13, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(245, 'Macon', 13, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(246, 'Athens-Clarke County unified government', 13, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(247, 'Warner Robins', 13, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(248, 'Urban Honolulu', 15, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(249, 'Boise', 16, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(250, 'Nampa', 16, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(251, 'Meridian', 16, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(252, 'Peoria', 17, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(253, 'Springfield', 17, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(254, 'Evanston', 17, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(255, 'Decatur', 17, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(256, 'Joliet', 17, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(257, 'Bloomington', 17, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(258, 'Bolingbrook', 17, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(259, 'Chicago', 17, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(260, 'Schaumburg', 17, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(261, 'Cicero', 17, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(262, 'Elgin', 17, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(263, 'Arlington Heights', 17, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(264, 'Waukegan', 17, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(265, 'Skokie', 17, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(266, 'Champaign', 17, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(267, 'Naperville', 17, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(268, 'Rockford', 17, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(269, 'Palatine', 17, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(270, 'Fort Wayne', 18, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(271, 'Evansville', 18, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(272, 'Lafayette', 18, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(273, 'Hammond', 18, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(274, 'Gary', 18, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(275, 'Fishers', 18, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(276, 'Carmel', 18, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(277, 'Indianapolis', 18, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(278, 'Muncie', 18, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(279, 'South Bend', 18, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(280, 'Iowa City', 19, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(281, 'Cedar Rapids', 19, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(282, 'Waterloo', 19, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(283, 'Des Moines', 19, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(284, 'Ames', 19, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(285, 'Davenport', 19, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(286, 'Sioux City', 19, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(287, 'Shawnee', 20, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(288, 'Olathe', 20, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(289, 'Wichita', 20, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(290, 'Topeka', 20, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(291, 'Overland Park', 20, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(292, 'Lexington-Fayette  county', 21, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(293, 'Louisville/Jefferson County metro government', 21, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(294, 'Shreveport', 22, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(295, 'Metairie', 22, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(296, 'Kenner', 22, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(297, 'Baton Rouge', 22, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(298, 'Bossier City', 22, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(299, 'Lake Charles', 22, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(300, 'New Orleans', 22, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(301, 'German', 25, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(302, 'Waldorf', 25, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(303, 'Frederick', 25, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(304, 'Baltimore', 25, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(305, 'Ellicott City', 25, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(306, 'Gaithersburg', 25, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(307, 'Silver Spring', 25, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(308, 'Glen Burnie', 25, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(309, 'Rockville', 25, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(310, 'Quincy', 26, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(311, 'Brockton', 26, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(312, 'Boston', 26, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(313, 'Lawrence', 26, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(314, 'Worcester', 26, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(315, 'Newton', 26, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(316, 'Lynn', 26, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(317, 'Cambridge', 26, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(318, 'Lowell', 26, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(319, 'Somerville', 26, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(320, 'Framingham', 26, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(321, 'New Bedford', 26, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(322, 'Fall River', 26, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(323, 'Flint', 27, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(324, 'Kalamazoo', 27, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(325, 'Westland', 27, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(326, 'Troy', 27, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(327, 'Wyoming', 27, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(328, 'Lansing', 27, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(329, 'Southfield', 27, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(330, 'Livonia', 27, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(331, 'Dearborn', 27, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(332, 'Grand Rapids', 27, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(333, 'Rochester Hills', 27, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(334, 'Farmington Hills', 27, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(335, 'Sterling Heights', 27, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(336, 'Ann Arbor', 27, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(337, 'Detroit', 27, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(338, 'Warren', 27, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(339, 'Eagan', 28, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(340, 'Woodbury', 28, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(341, 'Saint Cloud', 28, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(342, 'Duluth', 28, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(343, 'Saint Paul', 28, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(344, 'Maple Grove', 28, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(345, 'Brooklyn Park', 28, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(346, 'Plymouth', 28, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(347, 'Minneapolis', 28, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(348, 'Jackson', 29, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(349, 'Gulfport', 29, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(350, 'O\'Fallon', 30, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(351, 'Columbia', 30, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(352, 'Saint Louis', 30, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(353, 'Lee\'s Summit', 30, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(354, 'Independence', 30, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(355, 'Kansas City', 30, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(356, 'Saint Joseph', 30, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(357, 'Saint Charles', 30, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(358, 'Billings', 31, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(359, 'Missoula', 31, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(360, 'Lincoln', 32, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(361, 'Omaha', 32, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(362, 'Henderson', 33, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(363, 'Reno', 33, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(364, 'North Las Vegas', 33, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(365, 'Las Vegas', 33, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(366, 'Paradise', 33, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(367, 'Sunrise Manor', 33, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(368, 'Sparks', 33, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(369, 'Spring Valley', 33, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(370, 'Enterprise', 33, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(371, 'Manchester', 34, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(372, 'Nashua', 34, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(373, 'Newark', 35, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(374, 'Elizabeth', 35, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(375, 'Bayonne', 35, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(376, 'Toms River', 35, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(377, 'Camden', 35, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(378, 'Paterson', 35, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(379, 'Jersey City', 35, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(380, 'Trenton', 35, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(381, 'Passaic', 35, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(382, 'East Orange', 35, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(383, 'Clifton', 35, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(384, 'Albuquerque', 36, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(385, 'Santa Fe', 36, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(386, 'Rio Rancho', 36, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(387, 'Las Cruces', 36, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(388, 'Brentwood', 37, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(389, 'Rochester', 37, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(390, 'Buffalo', 37, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(391, 'Yonkers', 37, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(392, 'Schenectady', 37, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(393, 'Cheektowaga', 37, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(394, 'Mount Vernon', 37, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(395, 'New York', 37, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(396, 'Syracuse', 37, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(397, 'New Rochelle', 37, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(398, 'Asheville', 38, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(399, 'Greensboro', 38, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(400, 'Cary', 38, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(401, 'High Point', 38, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(402, 'Raleigh', 38, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(403, 'Charlotte', 38, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(404, 'Durham', 38, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(405, 'Winston-Salem', 38, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(406, 'Gastonia', 38, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(407, 'Greenville', 38, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(408, 'Fargo', 39, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(409, 'Bismarck', 39, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(410, 'Youngs', 41, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(411, 'Lorain', 41, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(412, 'Parma', 41, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(413, 'Cleveland', 41, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(414, 'Cincinnati', 41, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(415, 'Toledo', 41, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(416, 'Akron', 41, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(417, 'Canton', 41, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(418, 'Dayton', 41, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(419, 'Norman', 42, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(420, 'Lawton', 42, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(421, 'Edmond', 42, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(422, 'Broken Arrow', 42, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(423, 'Tulsa', 42, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(424, 'Oklahoma City', 42, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(425, 'Gresham', 43, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(426, 'Bend', 43, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(427, 'Portland', 43, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(428, 'Beaverton', 43, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(429, 'Medford', 43, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(430, 'Hillsboro', 43, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(431, 'Eugene', 43, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(432, 'Salem', 43, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(433, 'Scranton', 45, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(434, 'Reading', 45, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(435, 'Erie', 45, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(436, 'Pittsburgh', 45, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(437, 'Allen', 45, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(438, 'Philadelphia', 45, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(439, 'Bethlehem', 45, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(440, 'Guaynabo', 46, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(441, 'Mayagüez', 46, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(442, 'San Juan', 46, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(443, 'Caguas', 46, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(444, 'Carolina', 46, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(445, 'Ponce', 46, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(446, 'Bayamón', 46, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(447, 'Providence', 47, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(448, 'Pawtucket', 47, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(449, 'Warwick', 47, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(450, 'Cranston', 47, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(451, 'Mount Pleasant', 48, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(452, 'Charleston', 48, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(453, 'Rock Hill', 48, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(454, 'North Charleston', 48, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(455, 'Rapid City', 49, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(456, 'Sioux Falls', 49, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(457, 'Memphis', 50, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(458, 'Nashville', 50, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(459, 'Clarksville', 50, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(460, 'Franklin', 50, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(461, 'Johnson City', 50, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(462, 'Chattanooga', 50, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(463, 'Murfreesboro', 50, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(464, 'Knoxville', 50, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(465, 'Bryan', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(466, 'Garland', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(467, 'Round Rock', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(468, 'Conroe', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(469, 'Frisco', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(470, 'Mission', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(471, 'Midland', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(472, 'Bay', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(473, 'Cedar Park', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(474, 'Longview', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(475, 'Richardson', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(476, 'Pharr', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(477, 'Flower Mound', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(478, 'Grand Prairie', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(479, 'Brownsville', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(480, 'Lewisville', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(481, 'San Antonio', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(482, 'Abilene', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(483, 'Fort Worth', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(484, 'The Woodlands', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(485, 'Lubbock', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(486, 'Arlington', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(487, 'Carrollton', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(488, 'McKinney', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(489, 'Corpus Christi', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(490, 'College Station', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(491, 'Plano', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(492, 'Laredo', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(493, 'Atascocita', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(494, 'Pearland', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(495, 'Denton', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(496, 'Mesquite', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(497, 'Amarillo', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(498, 'New Braunfels', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(499, 'Victoria', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(500, 'Odessa', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(501, 'McAllen', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(502, 'Missouri City', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(503, 'Houston', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(504, 'Waco', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(505, 'League City', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(506, 'Killeen', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(507, 'Beaumont', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(508, 'Sugar Land', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(509, 'El Paso', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(510, 'Irving', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(511, 'Dallas', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(512, 'Harlingen', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(513, 'Austin', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(514, 'Tyler', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(515, 'San Angelo', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(516, 'North Richland Hills', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(517, 'Wichita Falls', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(518, 'Edinburg', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(519, 'Temple', 51, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(520, 'Sandy', 52, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(521, 'Orem', 52, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53');
INSERT INTO `cities` (`id`, `name`, `state_id`, `country_id`, `record_id`, `order`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(522, 'Layton', 52, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(523, 'South Jordan', 52, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(524, 'West Valley City', 52, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(525, 'Ogden', 52, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(526, 'Provo', 52, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(527, 'Salt Lake City', 52, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(528, 'West Jordan', 52, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(529, 'Saint George', 52, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(530, 'Hampton', 55, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(531, 'Portsmouth', 55, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(532, 'Chesapeake', 55, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(533, 'Roanoke', 55, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(534, 'Lynchburg', 55, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(535, 'Norfolk', 55, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(536, 'Virginia Beach', 55, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(537, 'Alexandria', 55, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(538, 'Newport News', 55, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(539, 'Suffolk', 55, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(540, 'Dale City', 55, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(541, 'Centreville', 55, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(542, 'Tacoma', 56, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(543, 'Kirkland', 56, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(544, 'Everett', 56, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(545, 'Federal Way', 56, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(546, 'Marysville', 56, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(547, 'Pasco', 56, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(548, 'Spokane Valley', 56, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(549, 'Bellevue', 56, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(550, 'Kent', 56, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(551, 'Renton', 56, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(552, 'Spokane', 56, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(553, 'Auburn', 56, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(554, 'Yakima', 56, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(555, 'Bellingham', 56, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(556, 'Seattle', 56, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(557, 'Vancouver', 56, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(558, 'Kennewick', 56, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(559, 'Madison', 58, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(560, 'Milwaukee', 58, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(561, 'Waukesha', 58, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(562, 'Green Bay', 58, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(563, 'Appleton', 58, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(564, 'Eau Claire', 58, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(565, 'Racine', 58, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(566, 'Oshkosh', 58, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(567, 'Kenosha', 58, 1, NULL, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53');

-- --------------------------------------------------------

--
-- Table structure for table `cities_translations`
--

CREATE TABLE `cities_translations` (
  `lang_code` varchar(191) NOT NULL,
  `cities_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `phone` varchar(60) DEFAULT NULL,
  `address` varchar(120) DEFAULT NULL,
  `subject` varchar(120) DEFAULT NULL,
  `content` longtext NOT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `address`, `subject`, `content`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Onie Swaniawski PhD', 'favian.heller@example.org', '+19898841031', '7158 Myra Viaduct Suite 077\nEmmaberg, FL 77472-7054', 'Sit qui aut voluptatem.', 'Tempora velit accusantium doloremque rerum. Aut nostrum sit ut. Sit placeat sed est sed. Est quidem quaerat asperiores et. Officiis soluta molestiae inventore aut dicta omnis ea. Ut id voluptatem enim velit voluptates voluptates ducimus ea. Vero corporis sed harum repudiandae numquam nesciunt et. Nulla occaecati aut et dolorum. In accusamus itaque quaerat aut nostrum et. Velit corrupti voluptates ea nemo voluptatem recusandae.', 'unread', '2023-07-10 00:34:51', '2023-07-10 00:34:51'),
(2, 'Mercedes Brekke', 'zoila84@example.com', '+12245169257', '581 Edyth Harbor Suite 099\nEast Tamia, MA 33995', 'Explicabo rem aliquid ipsa minus molestiae sit.', 'Quisquam vitae ipsa magnam earum. Pariatur mollitia dicta animi culpa incidunt quam. Vero aut autem sunt aspernatur commodi rerum magnam. Sit et quos enim. Quaerat dolores non aliquid voluptas quo. Facere eum pariatur quasi non unde dolores dolores ut. Optio omnis voluptates eos corrupti ab nulla velit. Natus mollitia doloribus dolorem impedit similique.', 'unread', '2023-07-10 00:34:51', '2023-07-10 00:34:51'),
(3, 'Anika Daniel IV', 'dorris43@example.org', '+12409388489', '49626 Sarai Glen Suite 544\nWindlermouth, OR 10845', 'Ipsa et laudantium iusto et dolorem quos.', 'Ut eius non autem. Consectetur excepturi et deleniti esse molestiae culpa. Sunt laudantium repudiandae sed et consequatur. Aperiam dolore odio sit qui minima repellendus. Omnis temporibus est aut delectus rerum consequuntur perferendis. Est nihil officiis ex et. Earum tenetur rerum deleniti quia itaque aliquid. Dolore placeat omnis debitis eius quia mollitia aut. Molestiae illum eveniet cum asperiores. Numquam aut sint et qui aperiam. Minus facilis velit vel. Inventore ducimus quo sit ipsam.', 'unread', '2023-07-10 00:34:51', '2023-07-10 00:34:51'),
(4, 'Prof. Maximillian Stanton', 'van.murazik@example.com', '+14306160998', '78882 Sipes Drives Suite 638\nMayertberg, KS 32180', 'Nam rerum illum et voluptates itaque.', 'Ex eos corrupti ut omnis vel et repellendus. Ut adipisci ut corrupti eum adipisci quis. Omnis mollitia molestiae dolorum quo error ut dolore a. Labore neque molestiae praesentium alias assumenda. Architecto quia et labore quo assumenda voluptas. Quis dicta maxime dolores qui omnis quas. Dolores expedita magni est. Asperiores repellat tempora quis qui. Voluptate nihil ipsum laudantium laudantium. Officia nemo dicta autem sit voluptate.', 'unread', '2023-07-10 00:34:51', '2023-07-10 00:34:51'),
(5, 'Isabelle Kshlerin', 'xkris@example.org', '+16577203531', '369 Mafalda Views Suite 461\nEast Manley, CA 39501-5000', 'Voluptas et ipsam autem minima itaque doloremque.', 'Maiores et qui doloribus nihil sed optio sed distinctio. Qui aperiam velit dolores porro cum provident porro repellat. Totam autem numquam iure dolore illo. Distinctio sed sit architecto dolore provident. Rerum ullam quis fugiat adipisci id vel. Sed et qui et nostrum perspiciatis temporibus. Quibusdam maiores odio id est in accusamus molestias. Natus porro dolorem tenetur aut aut beatae. Quos eum quaerat ipsa. Rerum ducimus maxime fugit aut non.', 'unread', '2023-07-10 00:34:51', '2023-07-10 00:34:51'),
(6, 'Lonnie Bernhard', 'brown.ofelia@example.net', '+19172198182', '24963 Gonzalo Spring Suite 874\nNew Eliza, AK 56320-9072', 'Ab cumque ab qui molestiae rem aut.', 'Doloribus quis sapiente voluptas soluta sit. Voluptatem est quia quia. Est aut debitis est ad voluptates occaecati aperiam est. Corporis fuga sunt enim cumque enim tenetur corporis distinctio. Laborum iste illo sequi consequatur sequi optio. Et qui id ab. Rem est cupiditate voluptates earum numquam eum. Ipsam accusantium et deleniti laudantium. Est nostrum voluptas eos rerum voluptatum eligendi. Id quia ea ex voluptatibus.', 'unread', '2023-07-10 00:34:51', '2023-07-10 00:34:51'),
(7, 'Elfrieda Kulas', 'reichel.rodrigo@example.com', '+14106537544', '504 Herman Motorway Apt. 466\nWest Buddybury, ME 11528-9189', 'Maxime quibusdam impedit perferendis odio.', 'Soluta quaerat quis doloremque consequatur. Consequatur est a eligendi rerum. Ad excepturi maiores ullam non placeat et. Dolores distinctio et commodi perferendis. Voluptatibus voluptatem aut rem voluptatum nostrum voluptas. Sapiente nobis porro sed dolorem et non et. Est maiores ut praesentium dolor in. Ut ut reiciendis et velit. Voluptas voluptatem et provident dolore. Vitae praesentium distinctio hic dolorem dolores. Distinctio dolore quia rerum vel sit omnis excepturi.', 'read', '2023-07-10 00:34:51', '2023-07-10 00:34:51'),
(8, 'Tillman Flatley DVM', 'hane.jake@example.org', '+18068276618', '52860 Orpha Point\nSchmidtfort, AZ 10322', 'Rerum incidunt eaque quia autem aut enim.', 'Omnis id et aut id veniam vitae perferendis. Voluptatibus cum tenetur quidem et ullam. Eum nulla soluta voluptas sint veniam. Eos possimus sit fugit provident aut veritatis quasi voluptatem. Excepturi facilis rerum non quod cupiditate. Ut adipisci similique necessitatibus rerum omnis. Autem veniam voluptas minima minima totam. Voluptatem consequatur hic quaerat repellendus ab architecto est sequi.', 'read', '2023-07-10 00:34:51', '2023-07-10 00:34:51'),
(9, 'Ms. Celia Wintheiser', 'shirley.ruecker@example.net', '+18317237374', '7337 Nat Way Apt. 686\nAracelyside, IA 17090', 'Est illum quod et nobis eum non esse.', 'Dignissimos ea ipsum nemo non ut et aut. Corrupti at necessitatibus reprehenderit voluptatem quo. Harum quam et eveniet nobis officia sint. Laborum aut consequatur quis. Est culpa consectetur tempora aut blanditiis. Rerum numquam repudiandae molestias accusantium quisquam. Est consequatur perspiciatis modi ex dicta rerum perferendis. Fugit et deserunt nihil voluptate. Nisi architecto fugiat quos molestiae rem.', 'read', '2023-07-10 00:34:51', '2023-07-10 00:34:51'),
(10, 'Virginie Prosacco', 'samir68@example.com', '+12298267692', '35954 Runolfsdottir Squares Suite 526\nRusselberg, OH 03173', 'Molestias in quas accusamus et est quo aut.', 'Non nobis aut quo sed at omnis. Assumenda est sed debitis laboriosam architecto harum enim. Unde ut laborum repellat minus. Esse itaque vel dicta sequi. Debitis voluptas deserunt occaecati molestias dolores. Itaque repellendus omnis libero consequuntur rerum ea. Est dolorem quaerat natus tenetur rerum laboriosam nisi. Soluta deleniti cupiditate modi recusandae possimus sit. Rem quam eaque animi dignissimos reprehenderit sint.', 'unread', '2023-07-10 00:34:51', '2023-07-10 00:34:51');

-- --------------------------------------------------------

--
-- Table structure for table `contact_replies`
--

CREATE TABLE `contact_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` longtext NOT NULL,
  `contact_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `nationality` varchar(120) DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `nationality`, `order`, `is_default`, `status`, `created_at`, `updated_at`, `code`) VALUES
(1, 'United States of America', 'Americans', 0, 1, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53', 'US');

-- --------------------------------------------------------

--
-- Table structure for table `countries_translations`
--

CREATE TABLE `countries_translations` (
  `lang_code` varchar(191) NOT NULL,
  `countries_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `nationality` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_widgets`
--

CREATE TABLE `dashboard_widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dashboard_widgets`
--

INSERT INTO `dashboard_widgets` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'widget_total_themes', '2023-10-23 05:10:26', '2023-10-23 05:10:26'),
(2, 'widget_total_users', '2023-10-23 05:10:26', '2023-10-23 05:10:26'),
(3, 'widget_total_pages', '2023-10-23 05:10:27', '2023-10-23 05:10:27'),
(4, 'widget_total_plugins', '2023-10-23 05:10:27', '2023-10-23 05:10:27'),
(5, 'widget_analytics_general', '2023-10-23 05:10:27', '2023-10-23 05:10:27'),
(6, 'widget_analytics_page', '2023-10-23 05:10:27', '2023-10-23 05:10:27'),
(7, 'widget_analytics_browser', '2023-10-23 05:10:27', '2023-10-23 05:10:27'),
(8, 'widget_analytics_referrer', '2023-10-23 05:10:27', '2023-10-23 05:10:27'),
(9, 'widget_posts_recent', '2023-10-23 05:10:27', '2023-10-23 05:10:27'),
(10, 'widget_audit_logs', '2023-10-23 05:10:27', '2023-10-23 05:10:27');

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_widget_settings`
--

CREATE TABLE `dashboard_widget_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `settings` text DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `widget_id` bigint(20) UNSIGNED NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `category_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Where does it come from ?', 'If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages.', 1, 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(2, 'How Jobcy Work ?', 'To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.', 1, 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(3, 'What is your shipping policy?', 'Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.', 1, 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(4, 'Where To Place A FAQ Page', 'Just as the name suggests, a FAQ page is all about simple questions and answers. Gather common questions your customers have asked from your support team and include them in the FAQ, Use categories to organize questions related to specific topics.', 1, 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(5, 'Why do we use it ?', 'It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental.', 1, 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(6, 'Where can I get some ?', 'To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.', 1, 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(7, 'Where does it come from ?', 'If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages.', 2, 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(8, 'How Jobcy Work ?', 'To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.', 2, 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(9, 'What is your shipping policy?', 'Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.', 2, 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(10, 'Where To Place A FAQ Page', 'Just as the name suggests, a FAQ page is all about simple questions and answers. Gather common questions your customers have asked from your support team and include them in the FAQ, Use categories to organize questions related to specific topics.', 2, 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(11, 'Why do we use it ?', 'It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental.', 2, 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(12, 'Where can I get some ?', 'To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.', 2, 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(13, 'Where does it come from ?', 'If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages.', 3, 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(14, 'How Jobcy Work ?', 'To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.', 3, 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(15, 'What is your shipping policy?', 'Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.', 3, 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(16, 'Where To Place A FAQ Page', 'Just as the name suggests, a FAQ page is all about simple questions and answers. Gather common questions your customers have asked from your support team and include them in the FAQ, Use categories to organize questions related to specific topics.', 3, 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(17, 'Why do we use it ?', 'It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental.', 3, 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(18, 'Where can I get some ?', 'To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.', 3, 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(19, 'Where does it come from ?', 'If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages.', 4, 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(20, 'How Jobcy Work ?', 'To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.', 4, 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(21, 'What is your shipping policy?', 'Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.', 4, 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(22, 'Where To Place A FAQ Page', 'Just as the name suggests, a FAQ page is all about simple questions and answers. Gather common questions your customers have asked from your support team and include them in the FAQ, Use categories to organize questions related to specific topics.', 4, 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(23, 'Why do we use it ?', 'It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental.', 4, 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(24, 'Where can I get some ?', 'To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.', 4, 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03');

-- --------------------------------------------------------

--
-- Table structure for table `faqs_translations`
--

CREATE TABLE `faqs_translations` (
  `lang_code` varchar(191) NOT NULL,
  `faqs_id` bigint(20) UNSIGNED NOT NULL,
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq_categories`
--

CREATE TABLE `faq_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq_categories`
--

INSERT INTO `faq_categories` (`id`, `name`, `order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'General', 0, 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(2, 'Buying', 1, 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(3, 'Payment', 2, 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(4, 'Support', 3, 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03');

-- --------------------------------------------------------

--
-- Table structure for table `faq_categories_translations`
--

CREATE TABLE `faq_categories_translations` (
  `lang_code` varchar(191) NOT NULL,
  `faq_categories_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_accounts`
--

CREATE TABLE `jb_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(120) NOT NULL,
  `last_name` varchar(120) NOT NULL,
  `description` text DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `avatar_id` bigint(20) UNSIGNED DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) DEFAULT NULL,
  `type` varchar(30) NOT NULL DEFAULT 'job-seeker',
  `credits` int(10) UNSIGNED DEFAULT NULL,
  `resume` varchar(200) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `bio` mediumtext DEFAULT NULL,
  `is_public_profile` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `hide_cv` tinyint(1) NOT NULL DEFAULT 0,
  `views` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `available_for_hiring` tinyint(1) NOT NULL DEFAULT 1,
  `country_id` bigint(20) UNSIGNED DEFAULT 1,
  `state_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cover_letter` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jb_accounts`
--

INSERT INTO `jb_accounts` (`id`, `first_name`, `last_name`, `description`, `gender`, `email`, `password`, `avatar_id`, `dob`, `phone`, `confirmed_at`, `email_verify_token`, `type`, `credits`, `resume`, `address`, `bio`, `is_public_profile`, `hide_cv`, `views`, `is_featured`, `remember_token`, `created_at`, `updated_at`, `available_for_hiring`, `country_id`, `state_id`, `city_id`, `cover_letter`) VALUES
(1, 'Gilda', 'Quitzon', 'Software Developer', NULL, 'employer@botble.com', '$2y$10$nc5s5KPW5QOlOATbwvURt.mTgksMeIqLvyu3J2HRN/kEn.gF6TeYG', 60, '1992-11-20', '+15515091909', '2023-07-10 07:34:56', NULL, 'employer', NULL, NULL, '9075 Mercedes Hollow\nNew Ivory, MN 89139', 'King. Here one of these cakes,\' she thought, and rightly too, that very few little girls of her hedgehog. The hedgehog was engaged in a great hurry, muttering to himself as he spoke, and added with.', 1, 0, 628, 1, NULL, '2023-07-10 00:34:56', '2023-07-10 00:34:56', 0, 1, NULL, NULL, NULL),
(2, 'Jocelyn', 'Keebler', 'Creative Designer', NULL, 'job_seeker@botble.com', '$2y$10$50YhB9j0GCNXpnpOf7/aAuvmwVpZybVtmF5nU/tUCxL7sSzFW6qIu', 59, '2014-05-08', '+14305005203', '2023-07-10 07:34:56', NULL, 'job-seeker', NULL, 'resume/01.pdf', '48180 Lois Vista\nLake Brennon, WI 64784', 'He says it kills all the rest of it appeared. \'I don\'t think they play at all the time it vanished quite slowly, beginning with the tarts, you know--\' \'But, it goes on \"THEY ALL RETURNED FROM HIM TO.', 1, 0, 1404, 1, NULL, '2023-07-10 00:34:56', '2023-07-10 00:34:56', 1, 1, NULL, NULL, NULL),
(3, 'Sarah', 'Harding', 'Creative Designer', NULL, 'sarah_harding@botble.com', '$2y$10$CIY4dlUtxGuAyue0pbWg.ObvYuZN9cp6c7yOtSbljZ2TcaN03jN82', NULL, '1998-03-26', '+17342251926', '2023-07-10 07:34:56', NULL, 'employer', NULL, NULL, '39832 Katharina Pines\nZacharystad, IL 86665', 'Alice, \'to pretend to be treated with respect. \'Cheshire Puss,\' she began, rather timidly, saying to herself, and once she remembered having seen such a fall as this, I shall be punished for it now.', 1, 0, 2367, 0, NULL, '2023-07-10 00:34:56', '2023-07-10 00:34:56', 1, 1, NULL, NULL, NULL),
(4, 'Steven', 'Jobs', 'Creative Designer', NULL, 'steven_jobs@botble.com', '$2y$10$Mg30D2iXPFMMpAgJIZgn9eTzL8.3CcDvm2oXfR3jewb6Ci7ZA0sie', NULL, '1987-04-17', '+17315765700', '2023-07-10 07:34:57', NULL, 'employer', NULL, NULL, '14594 Katarina Roads\nLake Columbus, IA 19946-4261', 'YOU?\' Which brought them back again to the little crocodile Improve his shining tail, And pour the waters of the song. \'What trial is it?\' \'Why,\' said the Hatter. He came in sight of the Shark, But.', 1, 0, 3194, 0, NULL, '2023-07-10 00:34:57', '2023-07-10 00:34:57', 1, 1, NULL, NULL, NULL),
(5, 'William', 'Kennedy', 'Creative Designer', NULL, 'wiliam_kend@botble.com', '$2y$10$x1l3RDwQFlz0KseLyFqNzeyRDuudZ7v98wS5iRcYqrbSRy/I7nGLC', NULL, '1974-06-11', '+16788460431', '2023-07-10 07:34:57', NULL, 'employer', NULL, NULL, '4041 Lucius Wall Apt. 125\nNorth Denishaven, MN 91529', 'It\'s high time you were down here with me! There are no mice in the book,\' said the Gryphon: and Alice was a paper label, with the glass table as before, \'and things are worse than ever,\' thought.', 1, 0, 2014, 0, NULL, '2023-07-10 00:34:57', '2023-07-10 00:34:57', 1, 1, NULL, NULL, NULL),
(6, 'Maddison', 'Brekke', 'So Alice began to.', NULL, 'cummings.tierra@hotmail.com', '$2y$10$73uLqALaFXAJ.clDeXFotud5ETYKYwq/x71KbvkLxqMogA1cD64Y2', 62, '1978-08-22', '+19726887756', '2023-07-10 07:34:57', NULL, 'job-seeker', NULL, 'resume/01.pdf', '12797 Gislason Corners\nAnahiview, FL 21817', 'I have none, Why, I haven\'t been invited yet.\' \'You\'ll see me there,\' said the Rabbit whispered in reply, \'for fear they should forget them before the end of the moment she appeared; but she felt.', 1, 0, 4210, 1, NULL, '2023-07-10 00:34:57', '2023-07-10 00:34:57', 1, 1, NULL, NULL, NULL),
(7, 'Sheridan', 'Ziemann', 'Everything is so.', NULL, 'gaylord.omari@mohr.com', '$2y$10$.F8oVUfu2m9nJNXL3.f0wehdxOIDqtHkkKAo2WMoxSQ5RXGMClw6e', 62, '1982-01-08', '+19257021451', '2023-07-10 07:34:57', NULL, 'job-seeker', NULL, 'resume/01.pdf', '42363 Armand Crest\nSouth Marioshire, KY 23937-8705', 'I WAS when I breathe\"!\' \'It IS the same thing a Lobster Quadrille is!\' \'No, indeed,\' said Alice. \'What sort of mixed flavour of cherry-tart, custard, pine-apple, roast turkey, toffee, and hot.', 1, 0, 1444, 1, NULL, '2023-07-10 00:34:57', '2023-07-10 00:34:57', 1, 1, NULL, NULL, NULL),
(8, 'Tre', 'Smith', 'Alice noticed with.', NULL, 'bridgette.terry@yahoo.com', '$2y$10$UM0qt39vKMuTCe0r1YDZHOgFfeV8prcC9n/JYHx.CIeQfyeXmWtH2', 62, '1978-02-06', '+13642846388', '2023-07-10 07:34:57', NULL, 'employer', NULL, NULL, '89922 Jeremie Hill\nNew Alexzander, NH 05417', 'Alice heard the Queen\'s hedgehog just now, only it ran away when it saw Alice. It looked good-natured, she thought: still it had made. \'He took me for his housemaid,\' she said this, she came in with.', 1, 0, 3589, 1, NULL, '2023-07-10 00:34:57', '2023-07-10 00:34:57', 0, 1, NULL, NULL, NULL),
(9, 'Edgardo', 'Marquardt', 'Gryphon. \'It all.', NULL, 'camila.kihn@johns.com', '$2y$10$32DZfvirQTFFPb.ibcpbb.oBwXZirgQj7AgQM2OOjmhZvf68zlkJ2', 63, '1999-07-01', '+14322616427', '2023-07-10 07:34:57', NULL, 'employer', NULL, NULL, '7755 Stanley Springs\nArchibaldfurt, MS 66121-3166', 'Miss, this here ought to go among mad people,\' Alice remarked. \'Right, as usual,\' said the Caterpillar. \'Well, I\'ve tried banks, and I\'ve tried hedges,\' the Pigeon went on, spreading out the answer.', 1, 0, 4681, 0, NULL, '2023-07-10 00:34:57', '2023-07-10 00:34:57', 1, 1, NULL, NULL, NULL),
(10, 'Glenda', 'Mann', 'King triumphantly.', NULL, 'keegan.lakin@hotmail.com', '$2y$10$XOeaUuuz6M5HJvwgNkPTFOchtGCkgZZ7hHdEEAfP/vrPnT5eg8js.', 63, '1984-10-11', '+19479987389', '2023-07-10 07:34:57', NULL, 'employer', NULL, NULL, '4331 Breitenberg Lights Suite 426\nRitchieland, LA 67279-9665', 'See how eagerly the lobsters to the other: the Duchess and the arm that was lying under the window, and some of them can explain it,\' said the Cat, \'if you only kept on puzzling about it in time,\'.', 1, 0, 4178, 1, NULL, '2023-07-10 00:34:57', '2023-07-10 00:34:57', 1, 1, NULL, NULL, NULL),
(11, 'Reyes', 'Abernathy', 'Queen, and Alice.', NULL, 'rudolph12@gmail.com', '$2y$10$5Woyki0R7JK7D1dDCgZbjuDup/xYorRkcJgvAQ3sM3WvVeEdsEnT.', 63, '2004-01-04', '+12284856912', '2023-07-10 07:34:57', NULL, 'employer', NULL, NULL, '87079 Bode River\nSchulistborough, MI 53440-8275', 'Canary called out \'The race is over!\' and they repeated their arguments to her, one on each side to guard him; and near the entrance of the Lizard\'s slate-pencil, and the fall NEVER come to the.', 1, 0, 878, 1, NULL, '2023-07-10 00:34:57', '2023-07-10 00:34:57', 0, 1, NULL, NULL, NULL),
(12, 'Anne', 'Gulgowski', 'THERE again!\' said.', NULL, 'ena.bruen@marquardt.com', '$2y$10$5Xj17uzlwLArbxdZePzrgOSnAKbmyVTNEoFsnfP5qqEZt535zV70i', 61, '2018-02-06', '+12628523872', '2023-07-10 07:34:57', NULL, 'job-seeker', NULL, 'resume/01.pdf', '51127 Jalyn Mission Apt. 827\nBrennonville, IN 95657-0709', 'Alice waited a little, \'From the Queen. An invitation from the trees as well say,\' added the Queen. \'It proves nothing of the players to be a walrus or hippopotamus, but then she remembered trying.', 1, 0, 3710, 0, NULL, '2023-07-10 00:34:57', '2023-07-10 00:34:57', 0, 1, NULL, NULL, NULL),
(13, 'Meredith', 'Kemmer', 'I THINK; or is it.', NULL, 'marco13@kohler.com', '$2y$10$Sk/it9iMR6EV1c/Z7A.8LOOfDjgWYfKF8DWyWDDugg7GVIGdy1aJe', 61, '2002-02-28', '+19726903900', '2023-07-10 07:34:57', NULL, 'employer', NULL, NULL, '247 Cleveland Parks\nNew Isidro, NE 46915', 'France-- Then turn not pale, beloved snail, but come and join the dance? Will you, won\'t you join the dance? Will you, won\'t you join the dance? \"You can really have no sort of circle, (\'the exact.', 1, 0, 1342, 0, NULL, '2023-07-10 00:34:57', '2023-07-10 00:34:57', 0, 1, NULL, NULL, NULL),
(14, 'Mossie', 'Breitenberg', 'Alice. \'And where.', NULL, 'elbert53@yahoo.com', '$2y$10$Ba18ytFx/PQDNSjlIp3z6OcbW21rFAYz/2DAIpxIuGzVF/CtbiCya', 63, '1981-11-13', '+14459200575', '2023-07-10 07:34:57', NULL, 'job-seeker', NULL, 'resume/01.pdf', '9202 Veum Springs Suite 547\nPort Devan, WV 14701', 'Alice, who felt very glad to find that she ought not to be true): If she should meet the real Mary Ann, and be turned out of the court. (As that is enough,\' Said his father; \'don\'t give yourself.', 1, 0, 3107, 0, NULL, '2023-07-10 00:34:57', '2023-07-10 00:34:57', 0, 1, NULL, NULL, NULL),
(15, 'Arch', 'Dibbert', 'I almost think I.', NULL, 'kozey.jason@gmail.com', '$2y$10$5uVruXJiNe2WTnC2cPuOBOGnRV9Zihz2tS.VZO6odVrJhEFp/.X3G', 61, '2019-01-17', '+12239097048', '2023-07-10 07:34:57', NULL, 'job-seeker', NULL, 'resume/01.pdf', '119 Maye Harbors\nKihnfurt, NH 80496-8942', 'Footman remarked, \'till tomorrow--\' At this moment the King, the Queen, and Alice looked down into its eyes by this time, as it was impossible to say anything. \'Why,\' said the Gryphon repeated.', 1, 0, 4298, 0, NULL, '2023-07-10 00:34:57', '2023-07-10 00:34:57', 1, 1, NULL, NULL, NULL),
(16, 'Antonio', 'Robel', 'Alice,) and round.', NULL, 'rempel.trenton@hotmail.com', '$2y$10$dduCsRty3FchzU9p0MeGJO77A1bhFrlrpbbckuN5E5gGoafbCHGtq', 60, '1978-05-25', '+17155999522', '2023-07-10 07:34:57', NULL, 'employer', NULL, NULL, '74446 Boehm Coves Apt. 972\nLudwigville, LA 34468-0005', 'Duck and a piece of bread-and-butter in the common way. So she set to work, and very nearly carried it off. \'If everybody minded their own business,\' the Duchess by this time). \'Don\'t grunt,\' said.', 1, 0, 4962, 1, NULL, '2023-07-10 00:34:57', '2023-07-10 00:34:57', 0, 1, NULL, NULL, NULL),
(17, 'Idell', 'Hodkiewicz', 'The Footman seemed.', NULL, 'helene82@fahey.com', '$2y$10$nSgA8NSAsvVGkQDBBC9wEeQdhYvEKDliqVBcOPosmA3gB44E8wJoO', 62, '2002-01-31', '+12542657306', '2023-07-10 07:34:57', NULL, 'job-seeker', NULL, 'resume/01.pdf', '4177 Winnifred Falls\nSouth Magnolia, MT 45130-4020', 'Hatter: \'as the things between whiles.\' \'Then you may stand down,\' continued the King. The White Rabbit read out, at the Caterpillar\'s making such VERY short remarks, and she went on: \'--that begins.', 1, 0, 4669, 0, NULL, '2023-07-10 00:34:57', '2023-07-10 00:34:57', 1, 1, NULL, NULL, NULL),
(18, 'Daren', 'Kirlin', 'Ann, and be turned.', NULL, 'edmond.conn@gmail.com', '$2y$10$u5xJChkYx1rjJ9BR5kJkD.qKUXw0OzAi.2iBz4lsfTJ3gk9UOM2Um', 61, '1989-07-28', '+14346020548', '2023-07-10 07:34:57', NULL, 'job-seeker', NULL, 'resume/01.pdf', '43582 Megane Flats\nPort Isabellestad, ND 50832', 'Gryphon, lying fast asleep in the back. However, it was neither more nor less than a real Turtle.\' These words were followed by a row of lamps hanging from the Gryphon, the squeaking of the cakes.', 1, 0, 266, 1, NULL, '2023-07-10 00:34:57', '2023-07-10 00:34:57', 0, 1, NULL, NULL, NULL),
(19, 'Maurice', 'Spencer', 'I like being that.', NULL, 'salvador.gusikowski@padberg.net', '$2y$10$sHNq/gb/uBpEtViSjvrRT.yW8E43rxcCU6c9NpV2hI20JkiAnG5I6', 61, '1992-06-24', '+18203108068', '2023-07-10 07:34:57', NULL, 'employer', NULL, NULL, '73331 Ledner Station Suite 674\nPort Erinside, WA 72831-3625', 'I sleep\" is the driest thing I ever heard!\' \'Yes, I think you\'d better finish the story for yourself.\' \'No, please go on!\' Alice said nothing; she had read several nice little dog near our house I.', 1, 0, 3378, 1, NULL, '2023-07-10 00:34:57', '2023-07-10 00:34:57', 1, 1, NULL, NULL, NULL),
(20, 'Amanda', 'Roberts', 'King, \'that only.', NULL, 'vrau@gmail.com', '$2y$10$Qf6PJ7Az3QizFw4AV0Gbv.FAKu3xJz9D9t2vXiOTCd54p0Mn0hCsu', 60, '2011-02-09', '+19598711205', '2023-07-10 07:34:58', NULL, 'employer', NULL, NULL, '87053 Troy Locks\nO\'Connerborough, NM 98993-7000', 'Alice. \'What IS the use of this remark, and thought it would be four thousand miles down, I think--\' (she was rather doubtful whether she could even make out what she did, she picked up a little.', 1, 0, 1352, 1, NULL, '2023-07-10 00:34:58', '2023-07-10 00:34:58', 0, 1, NULL, NULL, NULL),
(21, 'Shane', 'Satterfield', 'I am now? That\'ll.', NULL, 'jast.lacy@hotmail.com', '$2y$10$grlutkkltXBLneDwT0wabe3Gg8eOkwZx.cseAHSzwWxhjFSmmT2Fm', 61, '1976-04-11', '+19406196776', '2023-07-10 07:34:58', NULL, 'employer', NULL, NULL, '493 Cielo Mills Suite 626\nLynchfurt, OK 09179-9883', 'MINE.\' The Queen smiled and passed on. \'Who ARE you doing out here? Run home this moment, and fetch me a good deal: this fireplace is narrow, to be found: all she could not stand, and she thought.', 1, 0, 3214, 1, NULL, '2023-07-10 00:34:58', '2023-07-10 00:34:58', 0, 1, NULL, NULL, NULL),
(22, 'Wilfred', 'Smith', 'YOU like cats if.', NULL, 'maximus70@yahoo.com', '$2y$10$Xlg9gQX.F/cvJesdzeCtF.YvuObKMFjeDLlobTt8TCm0a/avVKzwK', 60, '1984-01-05', '+15417279406', '2023-07-10 07:34:58', NULL, 'job-seeker', NULL, 'resume/01.pdf', '925 Alphonso Meadow\nWintheiserville, ND 81487', 'Hatter hurriedly left the court, by the hand, it hurried off, without waiting for the Duchess by this time?\' she said to herself, as she leant against a buttercup to rest herself, and fanned herself.', 1, 0, 4786, 1, NULL, '2023-07-10 00:34:58', '2023-07-10 00:34:58', 1, 1, NULL, NULL, NULL),
(23, 'Danika', 'Berge', 'Alice\'s elbow was.', NULL, 'lilliana93@kuhn.biz', '$2y$10$E/QHb.zWQx7HEwPYcybQaecYmnEAD7ve/0y1uS1L5ljuEYzKJsNgG', 59, '1996-12-23', '+15863209325', '2023-07-10 07:34:58', NULL, 'employer', NULL, NULL, '5550 Dovie Mountain Apt. 495\nLittleburgh, MD 91998-3862', 'Gryphon. \'I mean, what makes them bitter--and--and barley-sugar and such things that make children sweet-tempered. I only knew the name \'W. RABBIT\' engraved upon it. She stretched herself up and to.', 1, 0, 2129, 0, NULL, '2023-07-10 00:34:58', '2023-07-10 00:34:58', 1, 1, NULL, NULL, NULL),
(24, 'Maryjane', 'Heller', 'Now I growl when.', NULL, 'luz93@yahoo.com', '$2y$10$JXgv5BO8B39xIT65pIpYf.NluoNEcIuWy8Sm8JdTyMXsdiqo3T1/e', 61, '1985-07-19', '+18162707738', '2023-07-10 07:34:58', NULL, 'employer', NULL, NULL, '75875 Shirley Expressway\nDonnaside, AR 69656', 'And she\'s such a thing I ever heard!\' \'Yes, I think you\'d take a fancy to cats if you please! \"William the Conqueror, whose cause was favoured by the White Rabbit was still in existence; \'and now.', 1, 0, 4743, 0, NULL, '2023-07-10 00:34:58', '2023-07-10 00:34:58', 1, 1, NULL, NULL, NULL),
(25, 'Earnest', 'Lueilwitz', 'Gryphon, half to.', NULL, 'alisa15@gmail.com', '$2y$10$/L0yXjRZz9pB19QyFYZdPehUfjFdEeJIS2K.j0KljkAkRQn614B0a', 60, '2011-06-19', '+17853382904', '2023-07-10 07:34:58', NULL, 'employer', NULL, NULL, '9480 Auer Greens\nMcLaughlinport, TN 78609', 'WILL do next! If they had to kneel down on her spectacles, and began to feel which way you have to beat time when she had plenty of time as she could, for the first minute or two the Caterpillar.', 1, 0, 2956, 1, NULL, '2023-07-10 00:34:58', '2023-07-10 00:34:58', 1, 1, NULL, NULL, NULL),
(26, 'Alysa', 'Yundt', 'Mock Turtle went.', NULL, 'qhegmann@gmail.com', '$2y$10$8WMfDHcOWAk7qPiq8kqPnOq6Wcx.aMhhEh20HQEaKW87T4ifVhw4S', 61, '1971-01-06', '+14304540950', '2023-07-10 07:34:58', NULL, 'employer', NULL, NULL, '47597 Maxwell Rapid Suite 825\nEast Carolanne, TN 96157-2419', 'Majesty,\' he began, \'for bringing these in: but I shall have to go on. \'And so these three little sisters,\' the Dormouse said--\' the Hatter added as an explanation; \'I\'ve none of my own. I\'m a deal.', 1, 0, 2053, 0, NULL, '2023-07-10 00:34:58', '2023-07-10 00:34:58', 0, 1, NULL, NULL, NULL),
(27, 'Geovanni', 'Parisian', 'Alice: \'--where\'s.', NULL, 'dietrich.lazaro@kohler.org', '$2y$10$hwPqxyWVgCdarGUUmy7U3u1OBrK83TXRoKf4QyfhM2No38lCNG4yO', 63, '2002-05-16', '+17572556342', '2023-07-10 07:34:58', NULL, 'employer', NULL, NULL, '609 Wolff Locks Apt. 916\nLake Mariefurt, NH 30406-1861', 'Caterpillar, and the Mock Turtle said: \'I\'m too stiff. And the muscular strength, which it gave to my right size: the next witness!\' said the Cat: \'we\'re all mad here. I\'m mad. You\'re mad.\' \'How do.', 1, 0, 1294, 0, NULL, '2023-07-10 00:34:58', '2023-07-10 00:34:58', 1, 1, NULL, NULL, NULL),
(28, 'Dovie', 'Paucek', 'The Antipathies, I.', NULL, 'hackett.isabella@gmail.com', '$2y$10$SqX.X7/VzysR8ennLpE5NO0s7vAo6Xv3VNK49e7w0PxxuGTdF.51K', 62, '1999-08-23', '+16415600403', '2023-07-10 07:34:58', NULL, 'employer', NULL, NULL, '8220 Renner Inlet Suite 740\nTyrafort, VT 34987-8301', 'Alice, in a very respectful tone, but frowning and making quite a long hookah, and taking not the right house, because the Duchess was sitting on a crimson velvet cushion; and, last of all this.', 1, 0, 486, 0, NULL, '2023-07-10 00:34:58', '2023-07-10 00:34:58', 1, 1, NULL, NULL, NULL),
(29, 'Della', 'Abshire', 'CHORUS. (In which.', NULL, 'deffertz@satterfield.info', '$2y$10$/qKCN3Oc0EuqGcfNr5V46uFa4bt5I5/FAQHYV7vzfXgATMyv67bm.', 63, '2014-05-25', '+19316253343', '2023-07-10 07:34:58', NULL, 'employer', NULL, NULL, '8213 Gunnar Station\nAlysonchester, TX 85814-4840', 'English!\' said the Footman, and began picking them up again as she went on, \'that they\'d let Dinah stop in the distance, and she had brought herself down to look for her, and said, very gravely, \'I.', 1, 0, 2808, 1, NULL, '2023-07-10 00:34:58', '2023-07-10 00:34:58', 1, 1, NULL, NULL, NULL),
(30, 'Bernita', 'McKenzie', 'King, \'and don\'t.', NULL, 'queenie03@spinka.com', '$2y$10$DLcL1rI9ZlnMulQ6ghPT9eEhiW5n1UsvjTkYW4jLhjRk074VH/deW', 59, '1981-11-09', '+19859881596', '2023-07-10 07:34:58', NULL, 'job-seeker', NULL, 'resume/01.pdf', '3046 Kendrick Hollow Suite 389\nEast Emma, ND 50251', 'I can guess that,\' she added in a moment: she looked up, and there stood the Queen had ordered. They very soon finished it off. * * * * * * * * * * * * * * * \'What a curious feeling!\' said Alice; \'I.', 1, 0, 853, 0, NULL, '2023-07-10 00:34:58', '2023-07-10 00:34:58', 1, 1, NULL, NULL, NULL),
(31, 'Hannah', 'Feil', 'I think.\' And she.', NULL, 'gennaro.mohr@mccullough.org', '$2y$10$nUUV5BKXs/3gS04fPABDVuiYRUVLe5vKPYwrYjOAmHoxoeekAE1SO', 61, '1972-02-24', '+19169228170', '2023-07-10 07:34:58', NULL, 'employer', NULL, NULL, '75246 Koch Flats Suite 328\nLake Jackelinemouth, IA 03623-5413', 'Then she went on, very much to-night, I should like to go with the game,\' the Queen in front of the jurors were all writing very busily on slates. \'What are they made of?\' \'Pepper, mostly,\' said the.', 1, 0, 3084, 0, NULL, '2023-07-10 00:34:58', '2023-07-10 00:34:58', 0, 1, NULL, NULL, NULL),
(32, 'Marcel', 'Vandervort', 'IS his business!\'.', NULL, 'ratke.nichole@hotmail.com', '$2y$10$iDX5yEkj4VZhRkVIp0BZo.Pky.Mn98q5pi/ya6ERLdeEPEYLsQAyG', 60, '1996-01-02', '+16299761891', '2023-07-10 07:34:58', NULL, 'job-seeker', NULL, 'resume/01.pdf', '1757 Quinn Harbor Apt. 070\nEast Jimmiechester, MO 04405', 'Cheshire Cat,\' said Alice: \'allow me to introduce it.\' \'I don\'t think--\' \'Then you may SIT down,\' the King added in an encouraging opening for a dunce? Go on!\' \'I\'m a poor man, your Majesty,\' said.', 1, 0, 1389, 0, NULL, '2023-07-10 00:34:58', '2023-07-10 00:34:58', 0, 1, NULL, NULL, NULL),
(33, 'Kale', 'Boyer', 'The Rabbit started.', NULL, 'ylindgren@swaniawski.net', '$2y$10$7oSEtP6vv2pLGjTGM4D1z.es5R3mlIdMfkd9TiSIMVHvLW9F6gjK6', 62, '1975-11-03', '+16076326495', '2023-07-10 07:34:58', NULL, 'job-seeker', NULL, 'resume/01.pdf', '68591 Andy Orchard\nWest Christopheview, WV 30241-5181', 'Magpie began wrapping itself up very sulkily and crossed over to the Gryphon. \'--you advance twice--\' \'Each with a growl, And concluded the banquet--] \'What IS a Caucus-race?\' said Alice; \'it\'s laid.', 1, 0, 2150, 0, NULL, '2023-07-10 00:34:58', '2023-07-10 00:34:58', 1, 1, NULL, NULL, NULL),
(34, 'Maddison', 'Corkery', 'HE was.\' \'I never.', NULL, 'mittie.wolf@osinski.com', '$2y$10$ve28MwL55G7.Z8GQJbnz6uzzGVWH63LGe2kqWePtZhtoswWG1XT8G', 60, '2015-08-07', '+16606097088', '2023-07-10 07:34:58', NULL, 'employer', NULL, NULL, '1842 Wilderman Estate\nFayberg, WI 34679', 'She felt very lonely and low-spirited. In a little different. But if I\'m Mabel, I\'ll stay down here till I\'m somebody else\"--but, oh dear!\' cried Alice again, for she had read several nice little.', 1, 0, 3204, 0, NULL, '2023-07-10 00:34:58', '2023-07-10 00:34:58', 0, 1, NULL, NULL, NULL),
(35, 'Eric', 'Donnelly', 'Alice, who always.', NULL, 'hirthe.margie@purdy.com', '$2y$10$EH841wdb9G7yTVjtYv32oeAw2mPJhYPbGbNZ4TH7BKWAGGp.JR84a', 63, '1994-07-23', '+12679546584', '2023-07-10 07:34:58', NULL, 'job-seeker', NULL, 'resume/01.pdf', '8566 Nichole River Suite 359\nEast Lacy, MD 93379', 'Mock Turtle. Alice was silent. The Dormouse slowly opened his eyes were nearly out of his shrill little voice, the name \'W. RABBIT\' engraved upon it. She felt very lonely and low-spirited. In a.', 1, 0, 3563, 0, NULL, '2023-07-10 00:34:58', '2023-07-10 00:34:58', 1, 1, NULL, NULL, NULL),
(36, 'Richmond', 'Runolfsdottir', 'Alice. \'I\'m glad.', NULL, 'yeffertz@yahoo.com', '$2y$10$sVV.gLRS9N/B84bn00bNZ.mNlgFHhzQX4tHuyeyEOBcPNO0afY3/a', 62, '2018-11-18', '+13215370044', '2023-07-10 07:34:58', NULL, 'employer', NULL, NULL, '2518 Renner Motorway Suite 583\nLaurenport, NV 56309-7955', 'Hatter, \'you wouldn\'t talk about her repeating \'YOU ARE OLD, FATHER WILLIAM,\"\' said the King; and as for the accident of the cupboards as she left her, leaning her head struck against the ceiling.', 1, 0, 4137, 1, NULL, '2023-07-10 00:34:58', '2023-07-10 00:34:58', 0, 1, NULL, NULL, NULL),
(37, 'Kyla', 'Kessler', 'Alice, seriously.', NULL, 'dibbert.ettie@abernathy.com', '$2y$10$/N2olwnC8zeLJ5w2iDe.3ecWHAHfVjWIe7zFvcSpJfoMqh5Y/FmJu', 61, '2013-11-06', '+19207891386', '2023-07-10 07:34:59', NULL, 'employer', NULL, NULL, '646 Dooley Plain\nDonnellybury, ME 99019-7598', 'Queen was close behind her, listening: so she went out, but it said in a louder tone. \'ARE you to leave off being arches to do with this creature when I was going to turn round on its axis--\'.', 1, 0, 2564, 1, NULL, '2023-07-10 00:34:59', '2023-07-10 00:34:59', 1, 1, NULL, NULL, NULL),
(38, 'Walter', 'Mraz', 'I ask! It\'s always.', NULL, 'thad58@gleichner.com', '$2y$10$sIWoae6LrSqRz4KOc6PGmeGbJSbKxfwb3E/FdtDASpyxmE/g3Ojam', 61, '1994-06-26', '+15018958163', '2023-07-10 07:34:59', NULL, 'employer', NULL, NULL, '72169 Rosenbaum Station\nNorth Willyport, NH 77811-1443', 'Her first idea was that she still held the pieces of mushroom in her haste, she had read several nice little histories about children who had been for some time busily writing in his turn; and both.', 1, 0, 2889, 1, NULL, '2023-07-10 00:34:59', '2023-07-10 00:34:59', 0, 1, NULL, NULL, NULL),
(39, 'Carissa', 'Greenfelder', 'PLENTY of room!\'.', NULL, 'qortiz@hotmail.com', '$2y$10$C/rit5emNRxNWgJXwYx9G.fLu9w0YfObGgOpJX0Tz9NlrNFcH17aS', 63, '2012-06-05', '+14783942647', '2023-07-10 07:34:59', NULL, 'job-seeker', NULL, 'resume/01.pdf', '8492 Medhurst Court Suite 420\nLake Wade, OR 38795', 'Was kindly permitted to pocket the spoon: While the Panther received knife and fork with a great crash, as if nothing had happened. \'How am I to get her head to keep herself from being broken. She.', 1, 0, 4157, 1, NULL, '2023-07-10 00:34:59', '2023-07-10 00:34:59', 0, 1, NULL, NULL, NULL),
(40, 'Annetta', 'Lang', 'Mary Ann, what ARE.', NULL, 'lourdes09@bogan.com', '$2y$10$UGfhUY7neAYGIBd66QB7FOR0nikP9rvQNjmO6kuKbIiZNKYbT3ujC', 63, '2011-11-06', '+16237337899', '2023-07-10 07:34:59', NULL, 'employer', NULL, NULL, '91303 Kertzmann Mountain\nNorth Abbeymouth, ND 52346', 'Oh, how I wish I hadn\'t gone down that rabbit-hole--and yet--and yet--it\'s rather curious, you know, this sort of meaning in it, \'and what is the same age as herself, to see the earth takes.', 1, 0, 1821, 0, NULL, '2023-07-10 00:34:59', '2023-07-10 00:34:59', 0, 1, NULL, NULL, NULL),
(41, 'Alta', 'Grady', 'Dormouse, without.', NULL, 'ygraham@hotmail.com', '$2y$10$Qt7rqpTD9oQMilMJatU.teR0HYplHYY/ukLMB8MUpLUqsDsATJ7e2', 60, '1995-01-21', '+15707404129', '2023-07-10 07:34:59', NULL, 'job-seeker', NULL, 'resume/01.pdf', '31596 Kovacek Harbors\nSawaynmouth, NV 12356', 'Dormouse\'s place, and Alice heard the Rabbit say to itself, half to herself, and began whistling. \'Oh, there\'s no name signed at the Footman\'s head: it just grazed his nose, you know?\' \'It\'s the.', 1, 0, 309, 0, NULL, '2023-07-10 00:34:59', '2023-07-10 00:34:59', 1, 1, NULL, NULL, NULL),
(42, 'Brittany', 'Terry', 'Alice\'s elbow was.', NULL, 'stanley.hoeger@hotmail.com', '$2y$10$z5/UbY4gQciiL0MJaUqB6Omg3S/lkI5krMdCxvpDVagtZurQQ/tKO', 61, '1992-11-15', '+17026475828', '2023-07-10 07:34:59', NULL, 'employer', NULL, NULL, '1769 Anderson Extensions Suite 053\nVelmaburgh, KY 28728', 'Alice started to her to carry it further. So she began: \'O Mouse, do you call it purring, not growling,\' said Alice. \'You did,\' said the Caterpillar. Here was another long passage, and the.', 1, 0, 235, 1, NULL, '2023-07-10 00:34:59', '2023-07-10 00:34:59', 0, 1, NULL, NULL, NULL),
(43, 'Nicklaus', 'Dietrich', 'Alice opened the.', NULL, 'rowe.oscar@waelchi.com', '$2y$10$RbGv0NUz1/C8Je6J9XNFe.U6yV.gLCzUXhhTW3TAXXn.Kigz6xcly', 60, '2000-10-04', '+19596843500', '2023-07-10 07:34:59', NULL, 'employer', NULL, NULL, '619 Stella Forges\nPort Angelo, NJ 34958-5760', 'There was not even get her head pressing against the roof was thatched with fur. It was the first day,\' said the Cat, as soon as the March Hare,) \'--it was at in all directions, tumbling up against.', 1, 0, 4738, 0, NULL, '2023-07-10 00:34:59', '2023-07-10 00:34:59', 1, 1, NULL, NULL, NULL),
(44, 'Lia', 'Runte', 'The Fish-Footman.', NULL, 'amber45@hotmail.com', '$2y$10$pOH5GNtBmJuo2.aaBxkgo.L/Oyv7GT0UDSCYMds1B0t9LTaQ4oZ/O', 60, '2006-06-10', '+18158670946', '2023-07-10 07:34:59', NULL, 'employer', NULL, NULL, '41939 Greenholt Stravenue\nWest Walterhaven, KY 68185', 'Hatter, it woke up again as she could, for her to speak good English); \'now I\'m opening out like the three were all writing very busily on slates. \'What are you getting on?\' said Alice, always ready.', 1, 0, 3216, 1, NULL, '2023-07-10 00:34:59', '2023-07-10 00:34:59', 0, 1, NULL, NULL, NULL),
(45, 'Keven', 'Zulauf', 'I don\'t put my arm.', NULL, 'sabrina.leuschke@yahoo.com', '$2y$10$7Ue7G3sC2PUyTNW/eygB..O2Gt88SBobUk3cP50r1zNNzbM4lyXv2', 63, '1977-09-27', '+13516531132', '2023-07-10 07:34:59', NULL, 'job-seeker', NULL, 'resume/01.pdf', '3470 Champlin Loop Apt. 331\nJessycaland, VT 39932', 'ME.\' \'You!\' said the Cat: \'we\'re all mad here. I\'m mad. You\'re mad.\' \'How do you want to be?\' it asked. \'Oh, I\'m not Ada,\' she said, \'and see whether it\'s marked \"poison\" or not\'; for she thought.', 1, 0, 1654, 1, NULL, '2023-07-10 00:34:59', '2023-07-10 00:34:59', 0, 1, NULL, NULL, NULL),
(46, 'Hyman', 'Douglas', 'Let me see: four.', NULL, 'hassie.heathcote@brown.com', '$2y$10$3iWcE6qjIHXt0qjxCTaUEu3UwDFNee/phCbqmYZ8jyjakAPqD5z6q', 63, '1998-03-21', '+16786799799', '2023-07-10 07:34:59', NULL, 'job-seeker', NULL, 'resume/01.pdf', '2747 Manuel Cliffs Suite 740\nLake Darylmouth, DC 42894-0621', 'I wish I could shut up like a candle. I wonder if I might venture to ask his neighbour to tell me who YOU are, first.\' \'Why?\' said the King said, turning to the other: the only difficulty was, that.', 1, 0, 1119, 0, NULL, '2023-07-10 00:34:59', '2023-07-10 00:34:59', 0, 1, NULL, NULL, NULL),
(47, 'Ole', 'Kub', 'Then it got down.', NULL, 'rozella17@yahoo.com', '$2y$10$3hJ3Fe57BfbvK5IHbbnpVuGN26OGMxGjw7rv2j8bHtf8Rrt6xg2va', 61, '2000-07-06', '+15049779395', '2023-07-10 07:34:59', NULL, 'employer', NULL, NULL, '238 Mertie Isle\nPort Brandt, MO 72650-9536', 'Alice, very earnestly. \'I\'ve had nothing else to say than his first speech. \'You should learn not to be a walrus or hippopotamus, but then she walked off, leaving Alice alone with the Gryphon. Alice.', 1, 0, 357, 1, NULL, '2023-07-10 00:34:59', '2023-07-10 00:34:59', 1, 1, NULL, NULL, NULL),
(48, 'Amelie', 'Krajcik', 'Alice didn\'t think.', NULL, 'addie.breitenberg@kreiger.biz', '$2y$10$PipthYKDs/VKKi3MrlBW5O6xUq1n2z/PH7ZUdDyuzAiL3D.jNFN6a', 59, '2009-06-27', '+18505725845', '2023-07-10 07:34:59', NULL, 'employer', NULL, NULL, '4972 Travon Spring\nNew Nadiabury, AK 39969-2881', 'I can do no more, whatever happens. What WILL become of you? I gave her answer. \'They\'re done with a growl, And concluded the banquet--] \'What IS the same thing a Lobster Quadrille is!\' \'No.', 1, 0, 1045, 0, NULL, '2023-07-10 00:34:59', '2023-07-10 00:34:59', 1, 1, NULL, NULL, NULL),
(49, 'Georgiana', 'Runolfsson', 'I can guess that,\'.', NULL, 'friesen.golden@hotmail.com', '$2y$10$y4/mvoIDS5nqNP0OrfY7bOz2QnROW8.CI4faN8QqGB6tYtMkHKr5.', 59, '2009-12-03', '+16787195809', '2023-07-10 07:34:59', NULL, 'job-seeker', NULL, 'resume/01.pdf', '25802 Schowalter Rue\nTownechester, OK 91818-0686', 'Queen, stamping on the hearth and grinning from ear to ear. \'Please would you tell me, please, which way you have just been picked up.\' \'What\'s in it?\' said the one who got any advantage from the.', 1, 0, 1412, 1, NULL, '2023-07-10 00:34:59', '2023-07-10 00:34:59', 0, 1, NULL, NULL, NULL),
(50, 'Abdullah', 'Zboncak', 'Lobster Quadrille.', NULL, 'antonina33@gmail.com', '$2y$10$C9jy8Nk2v7SNsSNdyiegZOKVEAv8trwXiGX.MtjjOTJK39QAENFXu', 62, '2013-04-07', '+12063771976', '2023-07-10 07:34:59', NULL, 'job-seeker', NULL, 'resume/01.pdf', '431 Raynor Cove\nNew Timmy, IN 84947', 'His voice has a timid voice at her with large eyes full of smoke from one foot to the Mock Turtle is.\' \'It\'s the Cheshire Cat: now I shall have to whisper a hint to Time, and round Alice, every now.', 1, 0, 2231, 1, NULL, '2023-07-10 00:34:59', '2023-07-10 00:34:59', 1, 1, NULL, NULL, NULL),
(51, 'Zoila', 'Rowe', 'Alice loudly. \'The.', NULL, 'nsanford@haag.net', '$2y$10$Xnhd3w9iFuAjmD6.38u87OPUYvOVNGR5lIK6H8LpROhcaNrFckY6i', 62, '2021-01-02', '+15405332612', '2023-07-10 07:34:59', NULL, 'job-seeker', NULL, 'resume/01.pdf', '919 Murray Well Suite 942\nNorth Darby, KS 16506', 'How she longed to get into that lovely garden. I think you\'d better leave off,\' said the Caterpillar. \'Is that the Mouse only shook its head impatiently, and walked two and two, as the March Hare.', 1, 0, 133, 1, NULL, '2023-07-10 00:34:59', '2023-07-10 00:34:59', 0, 1, NULL, NULL, NULL),
(52, 'Tito', 'Osinski', 'Footman, and began.', NULL, 'sanford.maya@gmail.com', '$2y$10$o.fpOj2mg9QbI0hiTLFZ4.uNVEzxN4d9XYDZO9BQCBbqfqcsFZDj.', 61, '1978-08-03', '+16518051112', '2023-07-10 07:35:00', NULL, 'employer', NULL, NULL, '23016 Moses Manor\nNew Teagan, VA 76941-6090', 'But I\'ve got back to finish his story. CHAPTER IV. The Rabbit started violently, dropped the white kid gloves while she ran, as well as she spoke. (The unfortunate little Bill had left off.', 1, 0, 4380, 1, NULL, '2023-07-10 00:35:00', '2023-07-10 00:35:00', 1, 1, NULL, NULL, NULL),
(53, 'Adan', 'Paucek', 'They are waiting.', NULL, 'elsa32@hotmail.com', '$2y$10$3pMnSSlMIC3Whn.zEPzMruzZ0s8xjVX4aKrla4SfqM3PkKw63J.8O', 61, '1970-09-05', '+13413284686', '2023-07-10 07:35:00', NULL, 'job-seeker', NULL, 'resume/01.pdf', '97732 Demond Valley Apt. 356\nRatkemouth, NM 78075-1714', 'I chose,\' the Duchess sang the second time round, she found that it might happen any minute, \'and then,\' thought she, \'what would become of me?\' Luckily for Alice, the little golden key and hurried.', 1, 0, 1348, 1, NULL, '2023-07-10 00:35:00', '2023-07-10 00:35:00', 1, 1, NULL, NULL, NULL),
(54, 'Jaron', 'Schroeder', 'The Queen turned.', NULL, 'vkirlin@yahoo.com', '$2y$10$RP4RLKRhOXjXLyJWf.8Q7Ov7g00wrXIZfVr1B1D8cAQW1gw9GHbkS', 59, '2008-05-21', '+19714635722', '2023-07-10 07:35:00', NULL, 'job-seeker', NULL, 'resume/01.pdf', '22875 Minnie Prairie Suite 319\nSouth Ora, NE 58993-0150', 'Alice. \'Come on, then!\' roared the Queen, and Alice thought she might find another key on it, (\'which certainly was not going to dive in among the distant green leaves. As there seemed to Alice with.', 1, 0, 859, 1, NULL, '2023-07-10 00:35:00', '2023-07-10 00:35:00', 0, 1, NULL, NULL, NULL),
(55, 'Katlyn', 'Runte', 'I don\'t take this.', NULL, 'emclaughlin@dach.info', '$2y$10$Ky5S.uCwvFiRy23z/iI9seoESARpqof.jFeQ9wIeIOhW3XQNs2LL.', 59, '1980-03-01', '+13058598272', '2023-07-10 07:35:00', NULL, 'employer', NULL, NULL, '5894 Cormier Keys\nEast Alton, NJ 51653', 'Soup of the busy farm-yard--while the lowing of the ground--and I should think very likely true.) Down, down, down. Would the fall was over. Alice was soon submitted to by all three to settle the.', 1, 0, 466, 1, NULL, '2023-07-10 00:35:00', '2023-07-10 00:35:00', 0, 1, NULL, NULL, NULL),
(56, 'Dahlia', 'Senger', 'Alas! it was in a.', NULL, 'langworth.jacky@gerhold.com', '$2y$10$yuwEJCCNAYUNdSNlduvM6OlboOpvNgmjY67Ao17q5aUeScQfTvr9y', 59, '2018-08-08', '+15745590663', '2023-07-10 07:35:00', NULL, 'employer', NULL, NULL, '942 Jaylan Land Suite 052\nSouth Elsaborough, AL 81330-6471', 'Mock Turtle. \'Seals, turtles, salmon, and so on.\' \'What a number of cucumber-frames there must be!\' thought Alice. \'I\'m glad they don\'t seem to put everything upon Bill! I wouldn\'t be in a hoarse.', 1, 0, 3389, 0, NULL, '2023-07-10 00:35:00', '2023-07-10 00:35:00', 0, 1, NULL, NULL, NULL),
(57, 'Lilliana', 'Hilpert', 'Footman. \'That\'s.', NULL, 'kautzer.reynold@larkin.com', '$2y$10$9ERpPHSGQXztzqX/5kARQO3h68a.PWTdwLsB8d8/hdzL1AZ5rSkVq', 62, '2014-11-15', '+19514410898', '2023-07-10 07:35:00', NULL, 'job-seeker', NULL, 'resume/01.pdf', '60159 Jarvis River Apt. 800\nGoldnerhaven, OH 80042-7677', 'Alice. \'I wonder if I fell off the fire, and at once in the window, she suddenly spread out her hand, and Alice was a large fan in the other: the only difficulty was, that her neck kept getting.', 1, 0, 2042, 0, NULL, '2023-07-10 00:35:00', '2023-07-10 00:35:00', 1, 1, NULL, NULL, NULL),
(58, 'Alycia', 'West', 'SOME change in my.', NULL, 'noemy73@gmail.com', '$2y$10$hsGN8IvsmHZk3Y6BHs.cpuafqSq/6MeelVtpZb0FKeilvQJegRypK', 62, '1978-07-14', '+13177588653', '2023-07-10 07:35:00', NULL, 'employer', NULL, NULL, '6414 Marks Drives\nSouth Nadia, NJ 44537-1411', 'And yet I wish you wouldn\'t mind,\' said Alice: \'besides, that\'s not a moment like a mouse, you know. Come on!\' \'Everybody says \"come on!\" here,\' thought Alice, and her face in her life; it was.', 1, 0, 4020, 0, NULL, '2023-07-10 00:35:00', '2023-07-10 00:35:00', 1, 1, NULL, NULL, NULL),
(59, 'Dimitri', 'Wisoky', 'Alice called after.', NULL, 'makenzie.smitham@ward.com', '$2y$10$HFLvELEmCgAaz56tvtInX.9JTb.vyWIwSp6MApwpRCJR1ImW8N1We', 61, '1979-10-31', '+13099128762', '2023-07-10 07:35:00', NULL, 'job-seeker', NULL, 'resume/01.pdf', '22358 Arely Branch\nKuhnland, SC 14116-5696', 'Footman remarked, \'till tomorrow--\' At this moment the King, and the little magic bottle had now had its full effect, and she heard something splashing about in all their simple joys, remembering.', 1, 0, 4387, 1, NULL, '2023-07-10 00:35:00', '2023-07-10 00:35:00', 0, 1, NULL, NULL, NULL),
(60, 'Heaven', 'Hayes', 'Bill\'s got to the.', NULL, 'kerluke.marcelina@langosh.net', '$2y$10$5jdC6wMclw8N9m2lf/yYL..lyo0dOGE4lGa696fR3zrowOZOjYkTK', 61, '1973-10-05', '+13468025487', '2023-07-10 07:35:00', NULL, 'employer', NULL, NULL, '3285 Terry Union\nRevafurt, NH 27311', 'I\'ll be jury,\" Said cunning old Fury: \"I\'ll try the effect: the next witness.\' And he got up and saying, \'Thank you, sir, for your walk!\" \"Coming in a deep, hollow tone: \'sit down, both of you, and.', 1, 0, 1927, 0, NULL, '2023-07-10 00:35:00', '2023-07-10 00:35:00', 0, 1, NULL, NULL, NULL),
(61, 'Aurelie', 'Dietrich', 'At this the whole.', NULL, 'enoch.sawayn@yahoo.com', '$2y$10$r8RS4lhMv5rjxSlECkbEp.fFEiqlo1TtvwOtyJ0uSvAiyB6MvREfS', 63, '1990-05-03', '+17436543246', '2023-07-10 07:35:00', NULL, 'job-seeker', NULL, 'resume/01.pdf', '3443 Stanton Roads Suite 022\nEarleneberg, NC 90418', 'When the sands are all dry, he is gay as a last resource, she put it. She went on all the rest, Between yourself and me.\' \'That\'s the most curious thing I ever was at in all their simple joys.', 1, 0, 3017, 1, NULL, '2023-07-10 00:35:00', '2023-07-10 00:35:00', 0, 1, NULL, NULL, NULL),
(62, 'Dexter', 'Flatley', 'HAVE tasted eggs.', NULL, 'genoveva.bogisich@schimmel.com', '$2y$10$.VlRVQV85.TWMeDUouiPu.BtbRjQeayuiHzLUpYdCsOD0LzU.Qvmi', 59, '2012-05-11', '+13258153994', '2023-07-10 07:35:00', NULL, 'employer', NULL, NULL, '7969 Schulist Coves Suite 311\nLake Owenmouth, NM 91363-6201', 'March Hare. \'Then it ought to be otherwise than what you were all ornamented with hearts. Next came the guests, mostly Kings and Queens, and among them Alice recognised the White Rabbit blew three.', 1, 0, 814, 1, NULL, '2023-07-10 00:35:00', '2023-07-10 00:35:00', 1, 1, NULL, NULL, NULL),
(63, 'Misael', 'Anderson', 'March Hare. Visit.', NULL, 'schimmel.donna@hotmail.com', '$2y$10$1K8bIHtEI9vKSH1hzA5p3eEm7Sl/v6HtL2xJYt983mfLMupOrrwM6', 61, '1985-09-25', '+16828710478', '2023-07-10 07:35:00', NULL, 'job-seeker', NULL, 'resume/01.pdf', '6943 Jakubowski Knoll Suite 725\nDevanport, WY 88134', 'I almost wish I could say if I like being that person, I\'ll come up: if not, I\'ll stay down here! It\'ll be no doubt that it was done. They had not attended to this last remark, \'it\'s a vegetable. It.', 1, 0, 4014, 1, NULL, '2023-07-10 00:35:00', '2023-07-10 00:35:00', 0, 1, NULL, NULL, NULL),
(64, 'Breana', 'Goldner', 'Come on!\' So they.', NULL, 'jmcglynn@gmail.com', '$2y$10$qDW67B9i2Y4DiE6yOHi98.dOuyzPfP4tBiD50NjZVvBPLpoHNmm66', 63, '2001-09-11', '+14067102931', '2023-07-10 07:35:00', NULL, 'employer', NULL, NULL, '291 Hettinger Shore Suite 600\nOkunevaborough, CA 91862', 'Dormouse, who was sitting on a crimson velvet cushion; and, last of all her coaxing. Hardly knowing what she did, she picked up a little timidly: \'but it\'s no use their putting their heads down! I.', 1, 0, 3976, 1, NULL, '2023-07-10 00:35:00', '2023-07-10 00:35:00', 1, 1, NULL, NULL, NULL),
(65, 'Edgar', 'Cartwright', 'Alice again, for.', NULL, 'oking@kozey.com', '$2y$10$gZqch.WGE.8Sd35WJB09S.2tKifmiFfgdPdtOYhY27tcuTdJBZR3K', 62, '1973-04-18', '+12698763556', '2023-07-10 07:35:00', NULL, 'employer', NULL, NULL, '7651 Nicolas Common Suite 612\nWest Robyn, NE 58980', 'Gryphon interrupted in a natural way again. \'I should like to try the experiment?\' \'HE might bite,\' Alice cautiously replied: \'but I know I have none, Why, I do so like that curious song about the.', 1, 0, 4121, 0, NULL, '2023-07-10 00:35:00', '2023-07-10 00:35:00', 1, 1, NULL, NULL, NULL),
(66, 'Ezekiel', 'Gusikowski', 'Mouse, do you like.', NULL, 'dickens.koby@gmail.com', '$2y$10$PVYbry.iu1D26aUhHDADDeUl2S5tRVTigFVxcFwW8SkXmFHfRKHlW', 59, '2010-12-31', '+12812942058', '2023-07-10 07:35:00', NULL, 'job-seeker', NULL, 'resume/01.pdf', '87899 Tyler Green\nSteviebury, OH 85241', 'Caterpillar took the cauldron of soup off the top of the other side of the jurymen. \'No, they\'re not,\' said Alice very humbly: \'you had got burnt, and eaten up by wild beasts and other unpleasant.', 1, 0, 3845, 1, NULL, '2023-07-10 00:35:00', '2023-07-10 00:35:00', 0, 1, NULL, NULL, NULL),
(67, 'Ottilie', 'Wilkinson', 'I suppose?\' \'Yes,\'.', NULL, 'elvera30@lindgren.org', '$2y$10$NMa0TdnMqjplGdyToa.q0.ya1Qrh2Wr70E8z9Njx0ZtFC.TNFu64G', 62, '1971-08-05', '+17704691288', '2023-07-10 07:35:01', NULL, 'job-seeker', NULL, 'resume/01.pdf', '6972 Thurman Stream Apt. 745\nTorphyfort, CA 24167', 'Mock Turtle. \'Certainly not!\' said Alice to herself, \'it would be very likely it can talk: at any rate, there\'s no room to open her mouth; but she felt that she was considering in her pocket) till.', 1, 0, 1036, 1, NULL, '2023-07-10 00:35:01', '2023-07-10 00:35:01', 0, 1, NULL, NULL, NULL),
(68, 'Lelia', 'White', 'THE KING AND QUEEN.', NULL, 'faustino50@yahoo.com', '$2y$10$8w4bykhf5t65IdjcIDyn1u.oL14V0KMg7KpXNxEUpwe.MkE3bt32m', 63, '2005-10-15', '+17695304760', '2023-07-10 07:35:01', NULL, 'job-seeker', NULL, 'resume/01.pdf', '764 Homenick Ridge\nLukasview, FL 35138-9686', 'When I used to call him Tortoise--\' \'Why did you call it purring, not growling,\' said Alice. \'Oh, don\'t bother ME,\' said Alice doubtfully: \'it means--to--make--anything--prettier.\' \'Well, then,\' the.', 1, 0, 2150, 1, NULL, '2023-07-10 00:35:01', '2023-07-10 00:35:01', 0, 1, NULL, NULL, NULL),
(69, 'Maurice', 'Weber', 'THESE?\' said the.', NULL, 'prosacco.adonis@stehr.com', '$2y$10$cwCWwljWLmjPVzvQOA9gvOObIzr8WfKcRH1PcCusFrrbvhU7KBj6a', 59, '2009-03-02', '+19319291602', '2023-07-10 07:35:01', NULL, 'employer', NULL, NULL, '581 Vesta Flats\nNorth Leamouth, MI 28773', 'In the very middle of the house!\' (Which was very nearly carried it out again, and did not dare to laugh; and, as she stood looking at them with one foot. \'Get up!\' said the Caterpillar. Alice.', 1, 0, 4982, 1, NULL, '2023-07-10 00:35:01', '2023-07-10 00:35:01', 1, 1, NULL, NULL, NULL),
(70, 'Caesar', 'Hansen', 'Alice. \'I\'m glad.', NULL, 'pollich.dillon@orn.org', '$2y$10$hzImRz/zMA.b7PzsNFr.MuoTTy6FCiqk5/ImUN25g72meDu8avhVK', 60, '1999-03-27', '+14787945109', '2023-07-10 07:35:01', NULL, 'employer', NULL, NULL, '5985 Wanda Unions\nWest Giovanni, SD 25285-0151', 'Caterpillar. This was such a simple question,\' added the Dormouse. \'Write that down,\' the King triumphantly, pointing to Alice to herself, \'if one only knew how to get out at all know whether it was.', 1, 0, 2147, 0, NULL, '2023-07-10 00:35:01', '2023-07-10 00:35:01', 0, 1, NULL, NULL, NULL),
(71, 'Hortense', 'Huels', 'I\'m afraid, sir\'.', NULL, 'dock.roberts@sipes.com', '$2y$10$7vGYUqj3iY85RR0YVNpW2O/Q4UHIapzhLvMzLrZczP5b2YJAQCoHS', 61, '1988-05-07', '+19549458483', '2023-07-10 07:35:01', NULL, 'job-seeker', NULL, 'resume/01.pdf', '31228 Reanna Inlet Suite 379\nSouth Marcelina, NC 10368-7458', 'I will prosecute YOU.--Come, I\'ll take no denial; We must have imitated somebody else\'s hand,\' said the Mock Turtle\'s Story \'You can\'t think how glad I am now? That\'ll be a grin, and she went nearer.', 1, 0, 2018, 1, NULL, '2023-07-10 00:35:01', '2023-07-10 00:35:01', 0, 1, NULL, NULL, NULL),
(72, 'Fatima', 'Zulauf', 'Queen, \'and take.', NULL, 'gail.herman@yahoo.com', '$2y$10$8712z8g4glIfpyvXq6Zo4.bYvtL5Bw4OSSXtjvan9OltpUKLokn5i', 60, '2013-12-25', '+16204146202', '2023-07-10 07:35:01', NULL, 'job-seeker', NULL, 'resume/01.pdf', '424 Cindy Corner\nLake Caleighville, AR 96431-9642', 'Classics master, though. He was an old Turtle--we used to say.\' \'So he did, so he with his nose, and broke to pieces against one of them didn\'t know it was very like having a game of play with a.', 1, 0, 2012, 0, NULL, '2023-07-10 00:35:01', '2023-07-10 00:35:01', 0, 1, NULL, NULL, NULL),
(73, 'Abdul', 'Nienow', 'Alice started to.', NULL, 'witting.makayla@renner.net', '$2y$10$HElEq6X2exi/99XKyVihN.SDKSJVppS8s6.0aQV91ZPBdVF7Y9s0u', 60, '2009-06-01', '+17544419127', '2023-07-10 07:35:01', NULL, 'job-seeker', NULL, 'resume/01.pdf', '819 Leuschke Alley\nCordellchester, LA 65146', 'How queer everything is to-day! And yesterday things went on for some time busily writing in his throat,\' said the Gryphon, half to Alice. \'What IS the use of this elegant thimble\'; and, when it had.', 1, 0, 233, 1, NULL, '2023-07-10 00:35:01', '2023-07-10 00:35:01', 1, 1, NULL, NULL, NULL),
(74, 'Elwin', 'Moen', 'Adventures of hers.', NULL, 'jrobel@yahoo.com', '$2y$10$CFp5xX8fUekcpK173hXwrOWs64G1p38nULem.w5jntveerngJLPSC', 62, '1996-11-20', '+17794992547', '2023-07-10 07:35:01', NULL, 'job-seeker', NULL, 'resume/01.pdf', '1827 Jess Trafficway Apt. 596\nMcGlynnville, NJ 91404', 'This time there were no arches left, and all dripping wet, cross, and uncomfortable. The moment Alice appeared, she was walking hand in hand, in couples: they were getting so thin--and the twinkling.', 1, 0, 2281, 0, NULL, '2023-07-10 00:35:01', '2023-07-10 00:35:01', 0, 1, NULL, NULL, NULL),
(75, 'Loren', 'Farrell', 'I shouldn\'t want.', NULL, 'bkuhlman@hotmail.com', '$2y$10$SH5mMd1jsEAiyVX9MPvvvO8RKcxeQrdMdF3l3Qg/oPZCmn8hcezL6', 61, '1973-11-21', '+12516999281', '2023-07-10 07:35:01', NULL, 'job-seeker', NULL, 'resume/01.pdf', '8914 Kaitlin Heights\nPort Consueloland, MD 94783-0467', 'SAID was, \'Why is a raven like a serpent. She had just begun to think about it, you know.\' \'I DON\'T know,\' said the King, the Queen, who had been all the party sat silent for a minute or two. \'They.', 1, 0, 2112, 1, NULL, '2023-07-10 00:35:01', '2023-07-10 00:35:01', 0, 1, NULL, NULL, NULL),
(76, 'Ubaldo', 'Kessler', 'Hatter dropped his.', NULL, 'mable30@smith.org', '$2y$10$xIMPVcjvLBpwLQuMRLgnMOGXVAE3UERDtw794Axk8gCicNH4eTCay', 60, '2005-12-07', '+12205830823', '2023-07-10 07:35:01', NULL, 'employer', NULL, NULL, '47288 Kulas Ways Apt. 655\nNew Joaquinchester, MD 26205-3585', 'Alice the moment they saw her, they hurried back to yesterday, because I was a large pigeon had flown into her face, with such sudden violence that Alice could not stand, and she looked down, was an.', 1, 0, 4130, 0, NULL, '2023-07-10 00:35:01', '2023-07-10 00:35:01', 0, 1, NULL, NULL, NULL),
(77, 'Velma', 'Runolfsson', 'And the moral of.', NULL, 'tstamm@hotmail.com', '$2y$10$sL3wq9OrMh5H8Emm//WdreSP.mGFvxgVylfIKINUQh1uqT4Nl5W.O', 62, '1981-02-08', '+18434345167', '2023-07-10 07:35:01', NULL, 'job-seeker', NULL, 'resume/01.pdf', '32555 Brain Motorway\nLake Pamela, IL 22369-7793', 'Alice. \'And be quick about it,\' added the Gryphon, and, taking Alice by the end of the Rabbit\'s little white kid gloves: she took courage, and went back to the whiting,\' said Alice, \'how am I to get.', 1, 0, 2972, 0, NULL, '2023-07-10 00:35:01', '2023-07-10 00:35:01', 0, 1, NULL, NULL, NULL),
(78, 'Erica', 'Bartoletti', 'Alice didn\'t think.', NULL, 'brandyn37@berge.com', '$2y$10$UmYi6uc4I/JYzubbLw6YI.qkb3x5HWD.Iz2JwXYOzxD2Vz37UwpJe', 63, '2005-10-18', '+12819213053', '2023-07-10 07:35:01', NULL, 'job-seeker', NULL, 'resume/01.pdf', '3668 Hilpert Summit\nNew Schuyler, AK 02214-5696', 'I will tell you more than nine feet high. \'Whoever lives there,\' thought Alice, \'to pretend to be trampled under its feet, \'I move that the Queen furiously, throwing an inkstand at the Queen, who.', 1, 0, 1175, 0, NULL, '2023-07-10 00:35:01', '2023-07-10 00:35:01', 1, 1, NULL, NULL, NULL),
(79, 'Mariam', 'Gerhold', 'Poor Alice! It was.', NULL, 'xabshire@grady.com', '$2y$10$MjsBp6o3ihrRR77WhOA/yOw2RJIIOSbBCvCuAZq/B8lkeg9gZQuxG', 61, '2016-07-23', '+15622690751', '2023-07-10 07:35:01', NULL, 'employer', NULL, NULL, '523 Richie Dale\nO\'Connermouth, MN 39216-3974', 'But her sister kissed her, and she jumped up on tiptoe, and peeped over the edge of the sort,\' said the Duchess; \'and the moral of that is--\"Birds of a muchness?\' \'Really, now you ask me,\' said.', 1, 0, 2251, 1, NULL, '2023-07-10 00:35:01', '2023-07-10 00:35:01', 1, 1, NULL, NULL, NULL),
(80, 'Constance', 'Gusikowski', 'Dinah my dear! I.', NULL, 'glen.hegmann@gmail.com', '$2y$10$cahTkWOPejJgiV/RBVm3qeIkWnKzs8VSytGgb4V8GkkC8fNo514eG', 59, '1999-06-27', '+16195532575', '2023-07-10 07:35:01', NULL, 'job-seeker', NULL, 'resume/01.pdf', '16967 Dach Ways Apt. 882\nWillville, MA 23226', 'Majesty!\' the Duchess began in a thick wood. \'The first thing I\'ve got to do,\' said the March Hare. \'Exactly so,\' said the King, and the poor child, \'for I can\'t tell you his history,\' As they.', 1, 0, 1924, 0, NULL, '2023-07-10 00:35:01', '2023-07-10 00:35:01', 1, 1, NULL, NULL, NULL),
(81, 'Jacinto', 'Kovacek', 'Alice, \'to pretend.', NULL, 'isobel19@gmail.com', '$2y$10$TeGuF9MKgOzrMiWaO8.a1upRj3FUvvNwq0Ruq2kzzNEuYzFcXSEhu', 60, '1992-06-08', '+15398799291', '2023-07-10 07:35:01', NULL, 'employer', NULL, NULL, '97528 Gottlieb Pine Apt. 280\nGulgowskistad, NY 94582', 'King hastily said, and went on muttering over the wig, (look at the frontispiece if you were INSIDE, you might knock, and I never was so full of the well, and noticed that they must be shutting up.', 1, 0, 1519, 0, NULL, '2023-07-10 00:35:01', '2023-07-10 00:35:01', 1, 1, NULL, NULL, NULL),
(82, 'Tyler', 'Connelly', 'It quite makes my.', NULL, 'madelyn07@yahoo.com', '$2y$10$w.Cjl5tTQ0eLzhNIrBNvgeM1gHDJP74Bmle2v1StOBIsBUZr.DTFm', 60, '2022-12-13', '+18435523389', '2023-07-10 07:35:01', NULL, 'employer', NULL, NULL, '94955 Dulce Fort\nPort Kelley, ND 99565', 'Alice thought the poor child, \'for I never understood what it was: she was terribly frightened all the creatures order one about, and called out as loud as she spoke. Alice did not wish to offend.', 1, 0, 2079, 0, NULL, '2023-07-10 00:35:01', '2023-07-10 00:35:01', 1, 1, NULL, NULL, NULL),
(83, 'Candice', 'Kerluke', 'March Hare will be.', NULL, 'qwalker@rice.com', '$2y$10$MOQrp2pzw7TstIMpYKvCseQ8ZSir46le9k1he4iG0id4HG3OsokLS', 62, '1976-05-20', '+13609275317', '2023-07-10 07:35:02', NULL, 'employer', NULL, NULL, '56004 Schmidt Pass Apt. 668\nElianeside, WV 53156', 'When the pie was all very well to say which), and they went up to the waving of the soldiers shouted in reply. \'Idiot!\' said the Hatter: \'I\'m on the look-out for serpents night and day! Why, I do it.', 1, 0, 3178, 1, NULL, '2023-07-10 00:35:02', '2023-07-10 00:35:02', 0, 1, NULL, NULL, NULL),
(84, 'Lyric', 'Bauch', 'How puzzling all.', NULL, 'xkoss@gmail.com', '$2y$10$5hIC.eUzGKNtWp4hfAIH1OkP4QLHQhV5KCefXwgBInIdycz/14zam', 59, '1995-09-05', '+12395315214', '2023-07-10 07:35:02', NULL, 'employer', NULL, NULL, '95823 Daniel Roads Suite 659\nZanderborough, WA 07911', 'Cat, as soon as there was silence for some time busily writing in his confusion he bit a large dish of tarts upon it: they looked so good, that it signifies much,\' she said to Alice, they all spoke.', 1, 0, 1727, 0, NULL, '2023-07-10 00:35:02', '2023-07-10 00:35:02', 0, 1, NULL, NULL, NULL);
INSERT INTO `jb_accounts` (`id`, `first_name`, `last_name`, `description`, `gender`, `email`, `password`, `avatar_id`, `dob`, `phone`, `confirmed_at`, `email_verify_token`, `type`, `credits`, `resume`, `address`, `bio`, `is_public_profile`, `hide_cv`, `views`, `is_featured`, `remember_token`, `created_at`, `updated_at`, `available_for_hiring`, `country_id`, `state_id`, `city_id`, `cover_letter`) VALUES
(85, 'Hattie', 'Trantow', 'Adventures, till.', NULL, 'maxwell94@metz.biz', '$2y$10$WL5DpzsF59T3/DNJr3uAQ.PeQYrgkuOTJ8le.72VQxJV2OOsFSgKG', 59, '2009-07-29', '+12724793055', '2023-07-10 07:35:02', NULL, 'job-seeker', NULL, 'resume/01.pdf', '2178 Schowalter Wells\nLake Pietroberg, NE 51035-0703', 'White Rabbit blew three blasts on the table. \'Have some wine,\' the March Hare and the small ones choked and had to leave off being arches to do anything but sit with its mouth and began an account.', 1, 0, 1443, 1, NULL, '2023-07-10 00:35:02', '2023-07-10 00:35:02', 1, 1, NULL, NULL, NULL),
(86, 'Karelle', 'Hirthe', 'As she said to a.', NULL, 'carter.shirley@cummings.com', '$2y$10$qBNisn3sb/QTSQIng7NU/uPU5..NIbPq8z3mdmeF92NsNjNq8hw4m', 63, '2000-01-15', '+18025574768', '2023-07-10 07:35:02', NULL, 'job-seeker', NULL, 'resume/01.pdf', '4900 Medhurst Trace\nPort Khalil, NY 44224-9976', 'I can\'t put it more clearly,\' Alice replied thoughtfully. \'They have their tails in their paws. \'And how did you call it purring, not growling,\' said Alice. \'Well, I never was so much into the way.', 1, 0, 2037, 1, NULL, '2023-07-10 00:35:02', '2023-07-10 00:35:02', 1, 1, NULL, NULL, NULL),
(87, 'Aylin', 'Weissnat', 'Mock Turtle, \'but.', NULL, 'mcrona@harvey.com', '$2y$10$DJygxmgsKEOpB4t1LLGBa.pHkxhPhmamgaNDXXmLLAk0BSaXI8ZkK', 59, '2013-05-02', '+13126047415', '2023-07-10 07:35:02', NULL, 'job-seeker', NULL, 'resume/01.pdf', '9468 Torphy Court Apt. 483\nNorth Alize, MT 37314-4648', 'And beat him when he sneezes: He only does it matter to me whether you\'re nervous or not.\' \'I\'m a poor man, your Majesty,\' said Alice loudly. \'The idea of having the sentence first!\' \'Hold your.', 1, 0, 2062, 1, NULL, '2023-07-10 00:35:02', '2023-07-10 00:35:02', 1, 1, NULL, NULL, NULL),
(88, 'Jarod', 'Kshlerin', 'Duchess,\' she said.', NULL, 'zora.vonrueden@zboncak.com', '$2y$10$8ao5Pz8fnJ1oqpeitPyr5uWzRoodCZb4pRaJ84A3m3E1Fv5W.sqmi', 59, '1990-04-16', '+19163678175', '2023-07-10 07:35:02', NULL, 'job-seeker', NULL, 'resume/01.pdf', '514 Mylene Fall Suite 602\nNorth Delaney, CA 02678', 'I THINK,\' said Alice. \'Come on, then,\' said Alice, rather alarmed at the Footman\'s head: it just missed her. Alice caught the flamingo and brought it back, the fight was over, and she crossed her.', 1, 0, 2377, 1, NULL, '2023-07-10 00:35:02', '2023-07-10 00:35:02', 1, 1, NULL, NULL, NULL),
(89, 'Bobbie', 'Ferry', 'Alice was rather.', NULL, 'denis08@hotmail.com', '$2y$10$GWoviHLnMg1udpP8btJ.w.hsr81g0ZC4y87Yo8RSK7zEuZlqsEl8O', 62, '1972-08-14', '+15305290362', '2023-07-10 07:35:02', NULL, 'employer', NULL, NULL, '3676 Pouros Ramp\nWest Ernestomouth, MD 14939-7202', 'Pigeon had finished. \'As if I would talk on such a puzzled expression that she still held the pieces of mushroom in her life before, and behind it when she noticed a curious plan!\' exclaimed Alice.', 1, 0, 1787, 0, NULL, '2023-07-10 00:35:02', '2023-07-10 00:35:02', 1, 1, NULL, NULL, NULL),
(90, 'Abbey', 'Schaden', 'The Fish-Footman.', NULL, 'tbernier@okon.net', '$2y$10$hCtJMGQUP7QKI0EfYVXdou6HP0HFWwa60iUE.zF6NCWARhErmYyQa', 61, '1995-02-27', '+19383133310', '2023-07-10 07:35:02', NULL, 'employer', NULL, NULL, '6725 Phyllis Shoal Apt. 532\nWest Celestine, SD 21111', 'Time!\' \'Perhaps not,\' Alice cautiously replied, not feeling at all what had become of me?\' Luckily for Alice, the little door, had vanished completely. Very soon the Rabbit just under the hedge. In.', 1, 0, 2502, 0, NULL, '2023-07-10 00:35:02', '2023-07-10 00:35:02', 0, 1, NULL, NULL, NULL),
(91, 'Demetris', 'Hayes', 'SAID was, \'Why is.', NULL, 'kaitlyn48@gmail.com', '$2y$10$TDJriCU2cvUA2ELY9NQlbO38kROSaFgiTrqppLEVW4Ydzt6MY4.6u', 59, '1975-02-24', '+14354648613', '2023-07-10 07:35:02', NULL, 'job-seeker', NULL, 'resume/01.pdf', '675 Osinski Mission\nCatherinemouth, ME 51778', 'I meant,\' the King replied. Here the Dormouse say?\' one of the same year for such a nice little dog near our house I should have liked teaching it tricks very much, if--if I\'d only been the right.', 1, 0, 3529, 1, NULL, '2023-07-10 00:35:02', '2023-07-10 00:35:02', 1, 1, NULL, NULL, NULL),
(92, 'Lera', 'Armstrong', 'Alice,) \'Well, I.', NULL, 'jaskolski.solon@bergnaum.com', '$2y$10$9Do/ZTusuy125rUbZlgZf.nKd96kVN4NP.fwM2r.OzNWL0CyJ.cku', 63, '1999-06-06', '+16308933877', '2023-07-10 07:35:02', NULL, 'employer', NULL, NULL, '66907 Dorris Trail\nWest Eldaview, KS 62821-7661', 'How puzzling all these changes are! I\'m never sure what I\'m going to begin with.\' \'A barrowful will do, to begin lessons: you\'d only have to fly; and the blades of grass, but she saw them, they set.', 1, 0, 3933, 0, NULL, '2023-07-10 00:35:02', '2023-07-10 00:35:02', 0, 1, NULL, NULL, NULL),
(93, 'Noble', 'Casper', 'How neatly spread.', NULL, 'freichel@yahoo.com', '$2y$10$xmA70OMQ1x2dacJjA0WhvuUL/qWyAWW1p8Cxbd/LCAhANOlQCGb0.', 63, '1992-12-30', '+18018948164', '2023-07-10 07:35:02', NULL, 'employer', NULL, NULL, '7673 Pagac Cliff\nWest Collin, ND 20908', 'Miss, we\'re doing our best, afore she comes, to--\' At this moment the King, \'that saves a world of trouble, you know, this sort of way to change the subject of conversation. \'Are you--are you.', 1, 0, 2583, 0, NULL, '2023-07-10 00:35:02', '2023-07-10 00:35:02', 1, 1, NULL, NULL, NULL),
(94, 'Ezequiel', 'O\'Reilly', 'I suppose?\' \'Yes,\'.', NULL, 'josiah.upton@langosh.com', '$2y$10$okilaGZWEdYIxxbBwmDxiuxjI.jZMIr0ArDeG.ujFPi9fOgyoC4Vm', 63, '1973-07-29', '+12515618039', '2023-07-10 07:35:02', NULL, 'employer', NULL, NULL, '423 Connor Squares Apt. 449\nGuststad, CA 39377-9500', 'This speech caused a remarkable sensation among the branches, and every now and then; such as, \'Sure, I don\'t believe there\'s an atom of meaning in them, after all. I needn\'t be so easily offended!\'.', 1, 0, 4332, 1, NULL, '2023-07-10 00:35:02', '2023-07-10 00:35:02', 0, 1, NULL, NULL, NULL),
(95, 'Asia', 'Will', 'Alice ventured to.', NULL, 'fritsch.clotilde@brown.com', '$2y$10$Z3YG6eh6HHqw8QiHNI5qbuI.9X2EF10EaDgN83z9J.dvo/2.Pn9dW', 63, '2013-03-11', '+17758073976', '2023-07-10 07:35:02', NULL, 'job-seeker', NULL, 'resume/01.pdf', '9805 Kristopher Alley Suite 432\nWest Ila, HI 01290', 'Tortoise, if he wasn\'t one?\' Alice asked. \'We called him Tortoise because he taught us,\' said the sage, as he spoke, \'we were trying--\' \'I see!\' said the Pigeon in a bit.\' \'Perhaps it doesn\'t matter.', 1, 0, 2184, 1, NULL, '2023-07-10 00:35:02', '2023-07-10 00:35:02', 0, 1, NULL, NULL, NULL),
(96, 'Wendy', 'Bahringer', 'White Rabbit as he.', NULL, 'kenya07@gmail.com', '$2y$10$tQRr.074p0JXUmYTL3KycOYHpywYtBDaOK80mO2PaqzJfFL9GR9LW', 61, '2015-01-07', '+15705935211', '2023-07-10 07:35:02', NULL, 'employer', NULL, NULL, '793 Karl Throughway Suite 775\nRodriguezton, DE 10314', 'Gryphon. \'Then, you know,\' said the King; and the small ones choked and had to stop and untwist it. After a minute or two, and the Queen say only yesterday you deserved to be a great thistle, to.', 1, 0, 3117, 0, NULL, '2023-07-10 00:35:02', '2023-07-10 00:35:02', 0, 1, NULL, NULL, NULL),
(97, 'Maggie', 'Heidenreich', 'The hedgehog was.', NULL, 'raphaelle.hamill@wolff.com', '$2y$10$OXxSNH0WfFqqH6e2kfbHZ.QD4c/gscfmWMsieZnOBYy78Ei3YKXSa', 59, '1991-01-26', '+17863223143', '2023-07-10 07:35:02', NULL, 'job-seeker', NULL, 'resume/01.pdf', '6560 Windler Overpass Apt. 549\nNikolausview, MN 87939', 'How funny it\'ll seem to have lessons to learn! No, I\'ve made up my mind about it; and the poor little thing howled so, that he shook both his shoes off. \'Give your evidence,\' said the King, \'and.', 1, 0, 4457, 0, NULL, '2023-07-10 00:35:02', '2023-07-10 00:35:02', 1, 1, NULL, NULL, NULL),
(98, 'Elza', 'Bode', 'Alice looked all.', NULL, 'farrell.brendon@yahoo.com', '$2y$10$3mmCikDr5yPy2vjNdhuATuYqAfiOFu9L/tJ6juGq4ESeNEc73A5eG', 62, '2015-04-23', '+12348132174', '2023-07-10 07:35:02', NULL, 'employer', NULL, NULL, '134 Liza Estate Apt. 957\nNew Winonaland, TN 46229', 'English, who wanted leaders, and had to kneel down on the top of his shrill little voice, the name of nearly everything there. \'That\'s the reason is--\' here the conversation a little. \'\'Tis so,\'.', 1, 0, 2669, 1, NULL, '2023-07-10 00:35:02', '2023-07-10 00:35:02', 0, 1, NULL, NULL, NULL),
(99, 'D\'angelo', 'Jacobs', 'Alice thought she.', NULL, 'kling.gregorio@yahoo.com', '$2y$10$4NQYnldIRHJuKvLWfFh//OSa0X1WdKgGBl87h6UkavX9tqdskqWFy', 60, '1971-06-25', '+14807543144', '2023-07-10 07:35:03', NULL, 'job-seeker', NULL, 'resume/01.pdf', '6332 Forest Pike Suite 138\nNew Keeley, MD 97894-2420', 'ONE.\' \'One, indeed!\' said Alice, (she had kept a piece of it had come back with the day and night! You see the Queen. \'Sentence first--verdict afterwards.\' \'Stuff and nonsense!\' said Alice loudly.', 1, 0, 3546, 1, NULL, '2023-07-10 00:35:03', '2023-07-10 00:35:03', 1, 1, NULL, NULL, NULL),
(100, 'Sammie', 'Wolff', 'No accounting for.', NULL, 'fconsidine@hotmail.com', '$2y$10$zYwBQbPY37G9HAttsvoD8usLtLDHc/KIuHmU/VCdmaxb68JuTUava', 63, '2001-01-27', '+12199017161', '2023-07-10 07:35:03', NULL, 'employer', NULL, NULL, '40374 Giovanny Street\nNorth Ottilie, RI 05928-6377', 'THAT. Then again--\"BEFORE SHE HAD THIS FIT--\" you never even introduced to a snail. \"There\'s a porpoise close behind it when she went nearer to watch them, and it\'ll sit up and beg for its dinner.', 1, 0, 2608, 1, NULL, '2023-07-10 00:35:03', '2023-07-10 00:35:03', 0, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jb_account_activity_logs`
--

CREATE TABLE `jb_account_activity_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(120) NOT NULL,
  `user_agent` text DEFAULT NULL,
  `reference_url` varchar(255) DEFAULT NULL,
  `reference_name` varchar(255) DEFAULT NULL,
  `ip_address` varchar(39) DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_account_educations`
--

CREATE TABLE `jb_account_educations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school` varchar(191) NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `specialized` varchar(191) DEFAULT NULL,
  `started_at` date NOT NULL,
  `ended_at` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jb_account_educations`
--

INSERT INTO `jb_account_educations` (`id`, `school`, `account_id`, `specialized`, `started_at`, `ended_at`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Associated Mennonite Biblical Seminary', 2, 'Culture and Technology Studies', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:56', '2023-07-10 00:34:56'),
(2, 'Gateway Technical College', 6, 'Anthropology', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(3, 'American Institute of Health Technology', 7, 'Economics', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(4, 'Antioch University McGregor', 12, 'Classical Studies', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(5, 'American Institute of Health Technology', 14, 'Culture and Technology Studies', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(6, 'Gateway Technical College', 15, 'Culture and Technology Studies', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(7, 'The University of the State of Alabama', 17, 'Art History', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(8, 'American Institute of Health Technology', 18, 'Anthropology', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(9, 'Associated Mennonite Biblical Seminary', 22, 'Classical Studies', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(10, 'Associated Mennonite Biblical Seminary', 30, 'Art History', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(11, 'American Institute of Health Technology', 32, 'Art History', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(12, 'Gateway Technical College', 33, 'Classical Studies', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(13, 'The University of the State of Alabama', 35, 'Culture and Technology Studies', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(14, 'Antioch University McGregor', 39, 'Classical Studies', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(15, 'Gateway Technical College', 41, 'Anthropology', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(16, 'American Institute of Health Technology', 45, 'Anthropology', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(17, 'The University of the State of Alabama', 46, 'Economics', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(18, 'American Institute of Health Technology', 49, 'Culture and Technology Studies', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(19, 'Antioch University McGregor', 50, 'Culture and Technology Studies', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(20, 'The University of the State of Alabama', 51, 'Anthropology', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(21, 'American Institute of Health Technology', 53, 'Art History', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(22, 'American Institute of Health Technology', 54, 'Culture and Technology Studies', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(23, 'The University of the State of Alabama', 57, 'Classical Studies', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(24, 'Antioch University McGregor', 59, 'Anthropology', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(25, 'American Institute of Health Technology', 61, 'Economics', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(26, 'Associated Mennonite Biblical Seminary', 63, 'Art History', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(27, 'Adams State College', 66, 'Anthropology', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(28, 'Associated Mennonite Biblical Seminary', 67, 'Anthropology', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(29, 'Adams State College', 68, 'Anthropology', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(30, 'Antioch University McGregor', 71, 'Classical Studies', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(31, 'The University of the State of Alabama', 72, 'Classical Studies', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(32, 'American Institute of Health Technology', 73, 'Art History', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(33, 'The University of the State of Alabama', 74, 'Classical Studies', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(34, 'Adams State College', 75, 'Classical Studies', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(35, 'The University of the State of Alabama', 77, 'Classical Studies', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(36, 'The University of the State of Alabama', 78, 'Classical Studies', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(37, 'Adams State College', 80, 'Culture and Technology Studies', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(38, 'American Institute of Health Technology', 85, 'Art History', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(39, 'American Institute of Health Technology', 86, 'Economics', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(40, 'Adams State College', 87, 'Economics', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(41, 'The University of the State of Alabama', 88, 'Art History', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(42, 'American Institute of Health Technology', 91, 'Art History', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(43, 'Associated Mennonite Biblical Seminary', 95, 'Art History', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(44, 'Antioch University McGregor', 97, 'Anthropology', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(45, 'Antioch University McGregor', 99, 'Classical Studies', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:03', '2023-07-10 00:35:03');

-- --------------------------------------------------------

--
-- Table structure for table `jb_account_experiences`
--

CREATE TABLE `jb_account_experiences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company` varchar(191) NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `position` varchar(191) DEFAULT NULL,
  `started_at` date NOT NULL,
  `ended_at` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jb_account_experiences`
--

INSERT INTO `jb_account_experiences` (`id`, `company`, `account_id`, `position`, `started_at`, `ended_at`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Darwin Travel', 2, 'President of Sales', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:56', '2023-07-10 00:34:56'),
(2, 'Spa Paragon', 6, 'Web Designer', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(3, 'Spa Paragon', 7, 'Marketing Coordinator', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(4, 'Party Plex', 12, 'Marketing Coordinator', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(5, 'Spa Paragon', 14, 'Web Designer', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(6, 'Darwin Travel', 15, 'President of Sales', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(7, 'Spa Paragon', 17, 'Project Manager', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(8, 'Exploration Kids', 18, 'Dog Trainer', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(9, 'Exploration Kids', 22, 'Marketing Coordinator', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(10, 'Exploration Kids', 30, 'Dog Trainer', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(11, 'Darwin Travel', 32, 'Project Manager', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(12, 'Spa Paragon', 33, 'President of Sales', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(13, 'Party Plex', 35, 'President of Sales', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(14, 'GameDay Catering', 39, 'Web Designer', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(15, 'Spa Paragon', 41, 'President of Sales', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(16, 'GameDay Catering', 45, 'Marketing Coordinator', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(17, 'Exploration Kids', 46, 'Project Manager', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(18, 'Spa Paragon', 49, 'Project Manager', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(19, 'Party Plex', 50, 'Web Designer', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(20, 'Exploration Kids', 51, 'Dog Trainer', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(21, 'GameDay Catering', 53, 'Project Manager', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(22, 'Exploration Kids', 54, 'Dog Trainer', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(23, 'GameDay Catering', 57, 'Dog Trainer', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(24, 'GameDay Catering', 59, 'Web Designer', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(25, 'Darwin Travel', 61, 'Project Manager', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(26, 'GameDay Catering', 63, 'Web Designer', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(27, 'Exploration Kids', 66, 'President of Sales', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(28, 'Darwin Travel', 67, 'Dog Trainer', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(29, 'Spa Paragon', 68, 'Project Manager', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(30, 'Spa Paragon', 71, 'Project Manager', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(31, 'Exploration Kids', 72, 'Marketing Coordinator', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(32, 'Spa Paragon', 73, 'President of Sales', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(33, 'Darwin Travel', 74, 'Dog Trainer', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(34, 'Darwin Travel', 75, 'Project Manager', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(35, 'Party Plex', 77, 'Marketing Coordinator', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(36, 'Spa Paragon', 78, 'Dog Trainer', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(37, 'GameDay Catering', 80, 'President of Sales', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(38, 'GameDay Catering', 85, 'Marketing Coordinator', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(39, 'Spa Paragon', 86, 'Dog Trainer', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(40, 'Darwin Travel', 87, 'Dog Trainer', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(41, 'GameDay Catering', 88, 'Web Designer', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(42, 'Darwin Travel', 91, 'Web Designer', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(43, 'Party Plex', 95, 'President of Sales', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(44, 'Party Plex', 97, 'Project Manager', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(45, 'Party Plex', 99, 'Project Manager', '2023-07-10', '2023-07-10', 'There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience', '2023-07-10 00:35:03', '2023-07-10 00:35:03');

-- --------------------------------------------------------

--
-- Table structure for table `jb_account_favorite_skills`
--

CREATE TABLE `jb_account_favorite_skills` (
  `skill_id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_account_favorite_tags`
--

CREATE TABLE `jb_account_favorite_tags` (
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_account_packages`
--

CREATE TABLE `jb_account_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_account_password_resets`
--

CREATE TABLE `jb_account_password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_analytics`
--

CREATE TABLE `jb_analytics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(10) DEFAULT NULL,
  `country_full` varchar(50) DEFAULT NULL,
  `referer` varchar(300) DEFAULT NULL,
  `ip_address` varchar(300) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_applications`
--

CREATE TABLE `jb_applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(120) DEFAULT NULL,
  `last_name` varchar(120) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(60) NOT NULL,
  `message` text DEFAULT NULL,
  `job_id` bigint(20) UNSIGNED NOT NULL,
  `resume` varchar(255) DEFAULT NULL,
  `cover_letter` varchar(255) DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_external_apply` tinyint(1) NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jb_applications`
--

INSERT INTO `jb_applications` (`id`, `first_name`, `last_name`, `phone`, `email`, `message`, `job_id`, `resume`, `cover_letter`, `account_id`, `is_external_apply`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Carissa', 'Greenfelder', '+14783942647', 'qortiz@hotmail.com', 'You MUST have meant some mischief, or else you\'d have signed your name like an arrow. The Cat\'s head with great curiosity. \'Soles and eels, of course,\' the Gryphon at the March Hare. Alice sighed.', 38, 'resume/01.pdf', 'resume/01.pdf', 39, 0, 'checked', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(2, 'Ezekiel', 'Gusikowski', '+12812942058', 'dickens.koby@gmail.com', 'I shall see it quite plainly through the air! Do you think you can have no notion how delightful it will be much the same thing with you,\' said the others. \'We must burn the house till she was.', 49, 'resume/01.pdf', 'resume/01.pdf', 66, 0, 'checked', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(3, 'D\'angelo', 'Jacobs', '+14807543144', 'kling.gregorio@yahoo.com', 'Quadrille The Mock Turtle\'s Story \'You can\'t think how glad I am to see a little bottle on it, (\'which certainly was not an encouraging tone. Alice looked very anxiously into her eyes; and once she.', 13, 'resume/01.pdf', 'resume/01.pdf', 99, 1, 'checked', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(4, 'Misael', 'Anderson', '+16828710478', 'schimmel.donna@hotmail.com', 'I know all sorts of things--I can\'t remember half of them--and it belongs to the Mock Turtle, suddenly dropping his voice; and the Gryphon only answered \'Come on!\' cried the Gryphon, \'she wants for.', 23, 'resume/01.pdf', 'resume/01.pdf', 63, 1, 'checked', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(5, 'Hattie', 'Trantow', '+12724793055', 'maxwell94@metz.biz', 'HE went mad, you know--\' (pointing with his head!\"\' \'How dreadfully savage!\' exclaimed Alice. \'That\'s very curious.\' \'It\'s all his fancy, that: they never executes nobody, you know. Which shall.', 5, 'resume/01.pdf', 'resume/01.pdf', 85, 0, 'checked', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(6, 'Mossie', 'Breitenberg', '+14459200575', 'elbert53@yahoo.com', 'Alice kept her waiting!\' Alice felt that she was beginning to write with one of the other two were using it as well as she tucked her arm affectionately into Alice\'s, and they all crowded round her.', 1, 'resume/01.pdf', 'resume/01.pdf', 14, 1, 'checked', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(7, 'Jarod', 'Kshlerin', '+19163678175', 'zora.vonrueden@zboncak.com', 'The baby grunted again, and Alice could bear: she got to the whiting,\' said Alice, (she had grown in the wind, and was delighted to find that the Gryphon said to the law, And argued each case with.', 34, 'resume/01.pdf', 'resume/01.pdf', 88, 0, 'checked', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(8, 'Lilliana', 'Hilpert', '+19514410898', 'kautzer.reynold@larkin.com', 'DON\'T know,\' said the Cat. \'I said pig,\' replied Alice; \'and I wish you wouldn\'t keep appearing and vanishing so suddenly: you make one repeat lessons!\' thought Alice; \'I might as well say this).', 22, 'resume/01.pdf', 'resume/01.pdf', 57, 1, 'checked', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(9, 'Maddison', 'Brekke', '+19726887756', 'cummings.tierra@hotmail.com', 'Alice heard the Queen\'s ears--\' the Rabbit coming to look through into the garden, called out \'The race is over!\' and they all stopped and looked at the sudden change, but very politely: \'Did you.', 42, 'resume/01.pdf', 'resume/01.pdf', 6, 0, 'checked', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(10, 'Demetris', 'Hayes', '+14354648613', 'kaitlyn48@gmail.com', 'And so it was done. They had a wink of sleep these three little sisters,\' the Dormouse fell asleep instantly, and Alice could see, as she came upon a little queer, won\'t you?\' \'Not a bit,\' she.', 14, 'resume/01.pdf', 'resume/01.pdf', 91, 1, 'checked', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(11, 'Bernita', 'McKenzie', '+19859881596', 'queenie03@spinka.com', 'Gryphon. \'Well, I hardly know--No more, thank ye; I\'m better now--but I\'m a deal faster than it does.\' \'Which would NOT be an advantage,\' said Alice, who always took a great hurry. \'You did!\' said.', 19, 'resume/01.pdf', 'resume/01.pdf', 30, 1, 'checked', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(12, 'Wilfred', 'Smith', '+15417279406', 'maximus70@yahoo.com', 'Alice angrily. \'It wasn\'t very civil of you to sit down without being seen, when she had been (Before she had not gone far before they saw the Mock Turtle: \'crumbs would all wash off in the act of.', 50, 'resume/01.pdf', 'resume/01.pdf', 22, 1, 'checked', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(13, 'Keven', 'Zulauf', '+13516531132', 'sabrina.leuschke@yahoo.com', 'And the Eaglet bent down its head impatiently, and said, \'That\'s right, Five! Always lay the blame on others!\' \'YOU\'D better not talk!\' said Five. \'I heard every word you fellows were saying.\' \'Tell.', 37, 'resume/01.pdf', 'resume/01.pdf', 45, 1, 'checked', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(14, 'Alta', 'Grady', '+15707404129', 'ygraham@hotmail.com', 'The poor little thing grunted in reply (it had left off quarrelling with the end of the what?\' said the March Hare interrupted, yawning. \'I\'m getting tired of being such a long tail, certainly,\'.', 39, 'resume/01.pdf', 'resume/01.pdf', 41, 0, 'checked', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(15, 'Daren', 'Kirlin', '+14346020548', 'edmond.conn@gmail.com', 'Bill! I wouldn\'t be so stingy about it, so she set to work nibbling at the door began sneezing all at once. The Dormouse had closed its eyes again, to see if she had hoped) a fan and gloves, and, as.', 27, 'resume/01.pdf', 'resume/01.pdf', 18, 0, 'checked', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(16, 'Adan', 'Paucek', '+13413284686', 'elsa32@hotmail.com', 'Alice could hear the Rabbit was still in sight, and no room at all fairly,\' Alice began, in a long, low hall, which was sitting between them, fast asleep, and the little door about fifteen inches.', 12, 'resume/01.pdf', 'resume/01.pdf', 53, 0, 'checked', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(17, 'Georgiana', 'Runolfsson', '+16787195809', 'friesen.golden@hotmail.com', 'Dodo managed it.) First it marked out a history of the tale was something like it,\' said the Duchess: \'flamingoes and mustard both bite. And the Gryphon only answered \'Come on!\' and ran off.', 2, 'resume/01.pdf', 'resume/01.pdf', 49, 0, 'checked', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(18, 'Abdul', 'Nienow', '+17544419127', 'witting.makayla@renner.net', 'HERE.\' \'But then,\' thought she, \'if people had all to lie down upon their faces, so that they had to stoop to save her neck kept getting entangled among the people near the door, and tried to look.', 10, 'resume/01.pdf', 'resume/01.pdf', 73, 0, 'checked', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(19, 'Zoila', 'Rowe', '+15405332612', 'nsanford@haag.net', 'Alice. \'Why, you don\'t even know what they\'re like.\' \'I believe so,\' Alice replied in an angry tone, \'Why, Mary Ann, what ARE you talking to?\' said one of its little eyes, but it just at first, but.', 36, 'resume/01.pdf', 'resume/01.pdf', 51, 1, 'checked', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(20, 'Maggie', 'Heidenreich', '+17863223143', 'raphaelle.hamill@wolff.com', 'Knave, \'I didn\'t know that cats COULD grin.\' \'They all can,\' said the Dormouse, not choosing to notice this question, but hurriedly went on, \'I must be collected at once set to work very carefully.', 43, 'resume/01.pdf', 'resume/01.pdf', 97, 1, 'checked', '2023-07-10 00:35:03', '2023-07-10 00:35:03');

-- --------------------------------------------------------

--
-- Table structure for table `jb_career_levels`
--

CREATE TABLE `jb_career_levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jb_career_levels`
--

INSERT INTO `jb_career_levels` (`id`, `name`, `order`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Department Head', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(2, 'Entry Level', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(3, 'Experienced Professional', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(4, 'GM / CEO / Country Head / President', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(5, 'Intern/Student', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53');

-- --------------------------------------------------------

--
-- Table structure for table `jb_career_levels_translations`
--

CREATE TABLE `jb_career_levels_translations` (
  `lang_code` varchar(191) NOT NULL,
  `jb_career_levels_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_categories`
--

CREATE TABLE `jb_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jb_categories`
--

INSERT INTO `jb_categories` (`id`, `name`, `description`, `order`, `is_default`, `is_featured`, `status`, `created_at`, `updated_at`, `parent_id`) VALUES
(1, 'IT &amp; Software', NULL, 0, 0, 1, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54', 0),
(2, 'Technology', NULL, 1, 0, 1, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54', 0),
(3, 'Government', NULL, 2, 0, 1, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54', 0),
(4, 'Accounting / Finance', NULL, 3, 0, 1, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54', 0),
(5, 'Construction / Facilities', NULL, 4, 0, 1, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54', 0),
(6, 'Tele-communications', NULL, 5, 0, 1, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54', 0),
(7, 'Design &amp; Multimedia', NULL, 6, 0, 1, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54', 0),
(8, 'Human Resource', NULL, 7, 0, 1, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54', 0),
(9, 'Consumer Packaged Goods (CPG)', NULL, 8, 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54', 0),
(10, 'Manufacturing', NULL, 9, 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54', 0),
(11, 'Retail', NULL, 10, 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54', 0),
(12, 'Distribution/Logistics', NULL, 11, 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54', 0),
(13, 'Supply Chain Operations', NULL, 12, 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54', 0),
(14, 'Healthcare &amp; Medical', NULL, 13, 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54', 0),
(15, 'Procurement / Sourcing', NULL, 14, 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54', 0),
(16, 'Information Technology (IT)', NULL, 15, 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54', 0),
(17, 'Sales/Business Development', NULL, 16, 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54', 0),
(18, 'Legal &amp; Professional Services', NULL, 17, 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54', 0),
(19, 'Life Sciences &amp; Healthcare', NULL, 18, 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jb_categories_translations`
--

CREATE TABLE `jb_categories_translations` (
  `lang_code` varchar(191) NOT NULL,
  `jb_categories_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_companies`
--

CREATE TABLE `jb_companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  `website` varchar(120) DEFAULT NULL,
  `logo` varchar(120) DEFAULT NULL,
  `latitude` varchar(25) DEFAULT NULL,
  `longitude` varchar(25) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT 1,
  `state_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `postal_code` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `year_founded` int(10) UNSIGNED DEFAULT NULL,
  `ceo` varchar(120) DEFAULT NULL,
  `number_of_offices` int(10) UNSIGNED DEFAULT NULL,
  `number_of_employees` varchar(60) DEFAULT NULL,
  `annual_revenue` varchar(60) DEFAULT NULL,
  `cover_image` varchar(120) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `views` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jb_companies`
--

INSERT INTO `jb_companies` (`id`, `name`, `email`, `description`, `content`, `website`, `logo`, `latitude`, `longitude`, `address`, `country_id`, `state_id`, `city_id`, `postal_code`, `phone`, `year_founded`, `ceo`, `number_of_offices`, `number_of_employees`, `annual_revenue`, `cover_image`, `facebook`, `twitter`, `linkedin`, `instagram`, `is_featured`, `status`, `views`, `created_at`, `updated_at`) VALUES
(1, 'Pinterest', NULL, 'Illo in qui dolor facere. Magnam fugiat et non voluptatem. Ut qui quaerat voluptate est dolorum. Laborum ea perspiciatis enim culpa.', '<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>', 'https://www.pinterest.com', 'companies/1.png', '42.54077', '-75.900945', '9598 Beulah Canyon\nJohnathonmouth, IN 26616-4782', 1, 19, 283, NULL, '+15867559446', 2006, NULL, 3, '8', '7M', NULL, NULL, NULL, NULL, NULL, 1, 'published', 0, '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(2, 'Linkedin', NULL, 'Sed ea molestiae tenetur suscipit. Dolor inventore fugit exercitationem facilis eveniet. Aliquid quis ipsa expedita accusantium et. Sint omnis sunt quidem id. Facere ut autem aut facilis eum.', '<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>', 'https://www.linkedin.com', 'companies/2.png', '43.743202', '-75.329594', '8561 Fred Point\nEast Devinport, AZ 57991-6196', 1, 18, 271, NULL, '+12565995807', 1996, 'Jeff Weiner', 7, '2', '10M', NULL, NULL, NULL, NULL, NULL, 1, 'published', 0, '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(3, 'Line', NULL, 'Porro eum quia odit reprehenderit mollitia. Aspernatur cupiditate enim sequi laudantium. Velit magnam consequatur consequatur. Minima recusandae numquam ut exercitationem omnis quae.', '<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>', 'https://line.me', 'companies/3.png', '42.692501', '-76.495036', '49378 Bradtke Shore\nEast Elsamouth, PA 06462-5868', 1, 28, 347, NULL, '+15648672898', 1976, 'Nakamura', 9, '6', '3M', NULL, NULL, NULL, NULL, NULL, 1, 'published', 0, '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(4, 'Uber', NULL, 'Repellendus quia fugit quaerat delectus. Enim omnis aliquam laudantium sunt. Deleniti nobis incidunt laborum. Amet aut aut ratione excepturi placeat consequatur in.', '<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>', 'https://www.uber.com', 'companies/4.png', '43.763018', '-75.166239', '215 Lebsack Green\nNew Samsonborough, MA 51650-3078', 1, 52, 521, NULL, '+18437825473', 1984, 'John Doe', 3, '2', '1M', NULL, NULL, NULL, NULL, NULL, 1, 'published', 0, '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(5, 'Flutter', NULL, 'Fuga dolore id soluta voluptatem. Optio aspernatur deserunt quia aut. Aut ratione ut ut laudantium eos voluptatibus.', '<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>', 'https://flutter.io', 'companies/5.png', '43.231833', '-76.120095', '1241 Mohr Road\nBridiefort, AZ 20716', 1, 51, 488, NULL, '+13368903973', 1970, 'John Doe', 4, '3', '8M', NULL, NULL, NULL, NULL, NULL, 1, 'published', 0, '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(6, 'Behance', NULL, 'Impedit accusantium itaque ut odio harum. Dolorem dolorum esse voluptatem velit tempore.', '<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>', 'https://www.behance.net', 'companies/6.png', '43.615571', '-74.999897', '5711 Macejkovic Row\nGorczanyborough, GA 05875', 1, 51, 489, NULL, '+16606550184', 2000, 'John Doe', 3, '1', '4M', NULL, NULL, NULL, NULL, NULL, 1, 'published', 0, '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(7, 'Apple', NULL, 'Temporibus voluptate laudantium eos qui officiis. Dolor magnam magni dolorem. Qui dolores quia similique molestiae qui officiis.', '<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>', 'https://www.apple.com', 'companies/7.png', '42.836488', '-75.057078', '54368 Edgar Cove Apt. 357\nMarastad, IN 78586-1731', 1, 12, 218, NULL, '+18044791568', 1971, 'Steve Jobs', 10, '3', '4M', NULL, NULL, NULL, NULL, NULL, 1, 'published', 0, '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(8, 'Adobe', NULL, 'Cumque ea magnam pariatur esse ipsam reiciendis adipisci. Consectetur rerum ut et neque iure dolorem corrupti. Alias nihil sed nam temporibus harum expedita totam.', '<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>', 'https://www.adobe.com', 'companies/8.png', '43.439448', '-75.503626', '7595 Hannah Estate Apt. 349\nBoyleland, WV 56073', 1, 55, 530, NULL, '+14803762665', 1995, 'John Doe', 9, '5', '10M', NULL, NULL, NULL, NULL, NULL, 1, 'published', 0, '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(9, 'Vibe', NULL, 'Ut beatae maxime velit doloribus eveniet aut. Facilis soluta neque quia nihil est qui qui et. Dolor dolor quia accusantium occaecati natus consequatur. Necessitatibus ducimus doloremque et iure.', '<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>', 'https://www.vibe.com', 'companies/9.png', '43.916201', '-75.067747', '51685 Hartmann Fall Apt. 269\nMayerttown, AR 29167', 1, 12, 221, NULL, '+16783539715', 1996, 'John Doe', 5, '10', '10M', NULL, NULL, NULL, NULL, NULL, 1, 'published', 0, '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(10, 'VKontakte', NULL, 'Eius porro id ipsa blanditiis. Dolorem aut expedita omnis magni sit. Ad sunt rerum vero maxime sed expedita blanditiis.', '<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>', 'https://vk.com', 'companies/10.png', '43.295915', '-75.97405', '41474 Daniel Fords\nDeckowland, KY 34461-1361', 1, 6, 89, NULL, '+16402433246', 1977, 'Vasya Pupkin', 6, '8', '4M', NULL, NULL, NULL, NULL, NULL, 1, 'published', 0, '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(11, 'WordPress', NULL, 'Cumque eaque voluptatem eos. Doloribus voluptatem ex et magnam culpa optio itaque. Debitis nostrum voluptas at unde vero. Et perferendis saepe explicabo nihil quasi.', '<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>', 'https://wordpress.org', 'companies/11.png', '43.341079', '-76.092561', '82529 Muller Brook\nManntown, IA 13613', 1, 56, 542, NULL, '+14785965965', 2008, 'Matt Mullenweg', 4, '3', '6M', NULL, NULL, NULL, NULL, NULL, 1, 'published', 0, '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(12, 'Envato', NULL, 'Nihil a fugiat dolores. Velit inventore voluptas amet recusandae atque et voluptatem dolor. Ut perferendis hic quos ad sit quia tenetur. Enim est corrupti cumque unde ab. Consequatur dolor sint et.', '<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>', 'https://envato.com', 'companies/12.png', '42.660042', '-74.995146', '9701 Lebsack Passage\nEmileton, UT 86454-2199', 1, 19, 283, NULL, '+16514600801', 2019, NULL, 3, '9', '4M', NULL, NULL, NULL, NULL, NULL, 1, 'published', 0, '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(13, 'Magento', NULL, 'Assumenda velit esse natus voluptatem incidunt sunt dicta. Est et et recusandae dolorem natus fugiat. Sunt inventore dolore quas ducimus a.', '<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>', 'https://magento.com', 'companies/13.png', '43.370876', '-75.595702', '1276 Claudine Skyway\nJamesonhaven, MD 75405', 1, 33, 364, NULL, '+18474984560', 1980, NULL, 5, '3', '2M', NULL, NULL, NULL, NULL, NULL, 1, 'published', 0, '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(14, 'Generic', NULL, 'Nobis error reiciendis doloribus beatae deserunt eaque. Recusandae qui dolorem ab ad qui sed. Beatae aut et est praesentium eum voluptate optio.', '<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>', 'https://generic.com', 'companies/14.png', '43.54496', '-74.909884', '1349 Jamey Mountain\nLake Cartertown, SD 48881-0938', 1, 6, 79, NULL, '+14587283537', 1981, NULL, 8, '10', '1M', NULL, NULL, NULL, NULL, NULL, 1, 'published', 0, '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(17, 'Company Name', NULL, 'Description', '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL, '', '', '', '', 0, 'published', 0, '2023-10-23 05:14:36', '2023-10-23 05:14:36');

-- --------------------------------------------------------

--
-- Table structure for table `jb_companies_accounts`
--

CREATE TABLE `jb_companies_accounts` (
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jb_companies_accounts`
--

INSERT INTO `jb_companies_accounts` (`company_id`, `account_id`) VALUES
(1, 1),
(1, 4),
(2, 1),
(2, 4),
(3, 1),
(3, 4),
(4, 1),
(4, 4),
(5, 1),
(5, 4),
(6, 1),
(6, 4),
(7, 1),
(7, 4),
(8, 1),
(8, 4),
(9, 1),
(9, 4),
(10, 1),
(10, 4),
(11, 1),
(11, 4),
(12, 1),
(12, 4),
(13, 1),
(13, 4),
(14, 1),
(14, 4);

-- --------------------------------------------------------

--
-- Table structure for table `jb_currencies`
--

CREATE TABLE `jb_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(60) NOT NULL,
  `symbol` varchar(10) NOT NULL,
  `is_prefix_symbol` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `decimals` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `exchange_rate` double NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jb_currencies`
--

INSERT INTO `jb_currencies` (`id`, `title`, `symbol`, `is_prefix_symbol`, `decimals`, `order`, `is_default`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(1, 'USD', '$', 1, 0, 0, 1, 1, '2023-07-10 00:34:56', '2023-07-10 00:34:56'),
(2, 'EUR', '€', 0, 0, 1, 0, 0.84, '2023-07-10 00:34:56', '2023-07-10 00:34:56'),
(3, 'VND', '₫', 0, 0, 1, 0, 23203, '2023-07-10 00:34:56', '2023-07-10 00:34:56');

-- --------------------------------------------------------

--
-- Table structure for table `jb_custom_fields`
--

CREATE TABLE `jb_custom_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 999,
  `is_global` tinyint(1) NOT NULL DEFAULT 0,
  `authorable_type` varchar(191) NOT NULL,
  `authorable_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_custom_fields_translations`
--

CREATE TABLE `jb_custom_fields_translations` (
  `lang_code` varchar(191) NOT NULL,
  `jb_custom_fields_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_custom_field_options`
--

CREATE TABLE `jb_custom_field_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `custom_field_id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(191) DEFAULT NULL,
  `value` varchar(191) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 999,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_custom_field_options_translations`
--

CREATE TABLE `jb_custom_field_options_translations` (
  `lang_code` varchar(191) NOT NULL,
  `jb_custom_field_options_id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_custom_field_values`
--

CREATE TABLE `jb_custom_field_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `value` varchar(191) DEFAULT NULL,
  `reference_type` varchar(191) NOT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `custom_field_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_custom_field_values_translations`
--

CREATE TABLE `jb_custom_field_values_translations` (
  `lang_code` varchar(191) NOT NULL,
  `jb_custom_field_values_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_degree_levels`
--

CREATE TABLE `jb_degree_levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jb_degree_levels`
--

INSERT INTO `jb_degree_levels` (`id`, `name`, `order`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Non-Matriculation', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(2, 'Matriculation/O-Level', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(3, 'Intermediate/A-Level', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(4, 'Bachelors', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(5, 'Masters', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(6, 'MPhil/MS', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(7, 'PHD/Doctorate', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(8, 'Certification', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(9, 'Diploma', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(10, 'Short Course', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53');

-- --------------------------------------------------------

--
-- Table structure for table `jb_degree_levels_translations`
--

CREATE TABLE `jb_degree_levels_translations` (
  `lang_code` varchar(191) NOT NULL,
  `jb_degree_levels_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_degree_types`
--

CREATE TABLE `jb_degree_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `degree_level_id` bigint(20) UNSIGNED NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jb_degree_types`
--

INSERT INTO `jb_degree_types` (`id`, `name`, `degree_level_id`, `order`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Matric in Arts', 2, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(2, 'Matric in Science', 2, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(3, 'O-Levels', 2, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(4, 'A-Levels', 3, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(5, 'Faculty of Arts', 3, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(6, 'Faculty of Science (Pre-medical)', 3, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(7, 'Faculty of Science (Pre-Engineering)', 3, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(8, 'Intermediate in Computer Science', 3, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(9, 'Intermediate in Commerce', 3, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(10, 'Intermediate in General Science', 3, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(11, 'Bachelors in Arts', 4, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(12, 'Bachelors in Architecture', 4, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(13, 'Bachelors in Business Administration', 4, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(14, 'Bachelors in Commerce', 4, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(15, 'Bachelors of Dental Surgery', 4, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(16, 'Bachelors of Education', 4, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(17, 'Bachelors in Engineering', 4, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(18, 'Bachelors in Pharmacy', 4, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(19, 'Bachelors in Science', 4, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(20, 'Bachelors of Science in Nursing (Registered Nursing)', 4, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(21, 'Bachelors in Law', 4, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(22, 'Bachelors in Technology', 4, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(23, 'BCS\\/BS', 4, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(24, 'Doctor of Veterinary Medicine', 4, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(25, 'MBBS', 4, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(26, 'Post Registered Nursing B.S.', 4, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(27, 'Masters in Arts', 5, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(28, 'Masters in Business Administration', 5, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(29, 'Masters in Commerce', 5, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(30, 'Masters of Education', 5, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(31, 'Masters in Law', 5, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(32, 'Masters in Science', 5, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(33, 'Executive Masters in Business Administration', 5, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53');

-- --------------------------------------------------------

--
-- Table structure for table `jb_degree_types_translations`
--

CREATE TABLE `jb_degree_types_translations` (
  `lang_code` varchar(191) NOT NULL,
  `jb_degree_types_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_functional_areas`
--

CREATE TABLE `jb_functional_areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jb_functional_areas`
--

INSERT INTO `jb_functional_areas` (`id`, `name`, `order`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Accountant', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(2, 'Accounts, Finance &amp; Financial Services', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(3, 'Admin', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(4, 'Admin Operation', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(5, 'Administration', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(6, 'Administration Clerical', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(7, 'Advertising', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(8, 'Advertising', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(9, 'Advertisement', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(10, 'Architects &amp; Construction', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(11, 'Architecture', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(12, 'Bank Operation', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(13, 'Business Development', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(14, 'Business Management', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(15, 'Business Systems Analyst', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(16, 'Clerical', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(17, 'Client Services &amp; Customer Support', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(18, 'Computer Hardware', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(19, 'Computer Networking', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(20, 'Consultant', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(21, 'Content Writer', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(22, 'Corporate Affairs', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(23, 'Creative Design', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(24, 'Creative Writer', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(25, 'Customer Support', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(26, 'Data Entry', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(27, 'Data Entry Operator', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(28, 'Database Administration (DBA)', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(29, 'Development', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(30, 'Distribution &amp; Logistics', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(31, 'Education &amp; Training', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(32, 'Electronics Technician', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(33, 'Engineering', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(34, 'Engineering Construction', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(35, 'Executive Management', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(36, 'Executive Secretary', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(37, 'Field Operations', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(38, 'Front Desk Clerk', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(39, 'Front Desk Officer', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(40, 'Graphic Design', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(41, 'Hardware', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(42, 'Health &amp; Medicine', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(43, 'Health &amp; Safety', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(44, 'Health Care', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(45, 'Health Related', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(46, 'Hotel Management', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(47, 'Hotel\\/Restaurant Management', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(48, 'HR', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(49, 'Human Resources', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(50, 'Import &amp; Export', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(51, 'Industrial Production', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(52, 'Installation &amp; Repair', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(53, 'Interior Designers &amp; Architects', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(54, 'Intern', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(55, 'Internship', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(56, 'Investment Operations', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(57, 'IT Security', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(58, 'IT Systems Analyst', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(59, 'Legal &amp; Corporate Affairs', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(60, 'Legal Affairs', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(61, 'Legal Research', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(62, 'Logistics &amp; Warehousing', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(63, 'Maintenance\\/Repair', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(64, 'Management Consulting', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(65, 'Management Information System (MIS)', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(66, 'Managerial', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(67, 'Manufacturing', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(68, 'Manufacturing &amp; Operations', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(69, 'Marketing', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(70, 'Marketing', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(71, 'Media - Print &amp; Electronic', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(72, 'Media &amp; Advertising', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(73, 'Medical', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(74, 'Medicine', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(75, 'Merchandising', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(76, 'Merchandising &amp; Product Management', 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(77, 'Monitoring &amp; Evaluation (M&amp;E)', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(78, 'Network Administration', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(79, 'Network Operation', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(80, 'Online Advertising', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(81, 'Online Marketing', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(82, 'Operations', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(83, 'Planning', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(84, 'Planning &amp; Development', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(85, 'PR', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(86, 'Print Media', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(87, 'Printing', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(88, 'Procurement', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(89, 'Product Developer', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(90, 'Product Development', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(91, 'Product Development', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(92, 'Product Management', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(93, 'Production', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(94, 'Production &amp; Quality Control', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(95, 'Project Management', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(96, 'Project Management Consultant', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(97, 'Public Relations', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(98, 'QA', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(99, 'QC', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(100, 'Qualitative Research', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(101, 'Quality Assurance (QA)', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(102, 'Quality Control', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(103, 'Quality Inspection', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(104, 'Recruiting', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(105, 'Recruitment', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(106, 'Repair &amp; Overhaul', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(107, 'Research &amp; Development (R&amp;D)', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(108, 'Research &amp; Evaluation', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(109, 'Research &amp; Fellowships', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(110, 'Researcher', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(111, 'Restaurant Management', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(112, 'Retail', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(113, 'Retail &amp; Wholesale', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(114, 'Retail Buyer', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(115, 'Retail Buying', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(116, 'Retail Merchandising', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(117, 'Safety &amp; Environment', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(118, 'Sales', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(119, 'Sales &amp; Business Development', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(120, 'Sales Support', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(121, 'Search Engine Optimization (SEO)', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(122, 'Secretarial, Clerical &amp; Front Office', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(123, 'Security', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(124, 'Security &amp; Environment', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(125, 'Security Guard', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(126, 'SEM', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(127, 'SMO', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(128, 'Software &amp; Web Development', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(129, 'Software Engineer', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(130, 'Software Testing', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(131, 'Stores &amp; Warehousing', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(132, 'Supply Chain', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(133, 'Supply Chain Management', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(134, 'Systems Analyst', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(135, 'Teachers\\/Education, Training &amp; Development', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(136, 'Technical Writer', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(137, 'Telephone Sale Representative', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(138, 'Telemarketing', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(139, 'Training &amp; Development', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(140, 'Transportation &amp; Warehousing', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(141, 'TSR', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(142, 'Typing', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(143, 'Warehousing', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(144, 'Web Developer', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(145, 'Web Marketing', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(146, 'Writer', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(147, 'PR', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(148, 'QA', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(149, 'QC', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(150, 'SEM', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(151, 'SMO', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(152, 'TSR', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(153, 'HR', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(154, 'QA', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(155, 'QC', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(156, 'SEM', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54');

-- --------------------------------------------------------

--
-- Table structure for table `jb_functional_areas_translations`
--

CREATE TABLE `jb_functional_areas_translations` (
  `lang_code` varchar(191) NOT NULL,
  `jb_functional_areas_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_invoices`
--

CREATE TABLE `jb_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_type` varchar(191) NOT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `customer_name` varchar(191) NOT NULL,
  `company_name` varchar(191) DEFAULT NULL,
  `company_logo` varchar(191) DEFAULT NULL,
  `customer_email` varchar(191) NOT NULL,
  `customer_phone` varchar(191) DEFAULT NULL,
  `customer_address` varchar(191) DEFAULT NULL,
  `customer_tax_id` varchar(191) DEFAULT NULL,
  `sub_total` decimal(15,2) UNSIGNED NOT NULL,
  `tax_amount` decimal(15,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `shipping_amount` decimal(15,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `discount_amount` decimal(15,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `amount` decimal(15,2) UNSIGNED NOT NULL,
  `payment_id` int(10) UNSIGNED DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'pending',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_invoice_items`
--

CREATE TABLE `jb_invoice_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `reference_type` varchar(191) NOT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `qty` int(10) UNSIGNED NOT NULL,
  `sub_total` decimal(15,2) UNSIGNED NOT NULL,
  `tax_amount` decimal(15,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `discount_amount` decimal(15,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `amount` decimal(15,2) UNSIGNED NOT NULL,
  `metadata` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_jobs`
--

CREATE TABLE `jb_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `description` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `apply_url` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT 1,
  `state_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_freelance` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `career_level_id` bigint(20) UNSIGNED DEFAULT NULL,
  `salary_from` decimal(15,2) UNSIGNED DEFAULT NULL,
  `salary_to` decimal(15,2) UNSIGNED DEFAULT NULL,
  `salary_range` varchar(30) NOT NULL DEFAULT 'hour',
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `degree_level_id` bigint(20) UNSIGNED DEFAULT NULL,
  `job_shift_id` bigint(20) UNSIGNED DEFAULT NULL,
  `job_experience_id` bigint(20) UNSIGNED DEFAULT NULL,
  `functional_area_id` bigint(20) UNSIGNED DEFAULT NULL,
  `hide_salary` tinyint(1) NOT NULL DEFAULT 0,
  `number_of_positions` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `expire_date` date DEFAULT NULL,
  `author_id` bigint(20) UNSIGNED DEFAULT NULL,
  `author_type` varchar(255) NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `number_of_applied` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `hide_company` tinyint(1) NOT NULL DEFAULT 0,
  `latitude` varchar(25) DEFAULT NULL,
  `longitude` varchar(25) DEFAULT NULL,
  `auto_renew` tinyint(1) NOT NULL DEFAULT 0,
  `external_apply_clicks` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `never_expired` tinyint(1) NOT NULL DEFAULT 0,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `moderation_status` varchar(60) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `employer_colleagues` text DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `application_closing_date` date DEFAULT NULL,
  `zip_code` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jb_jobs`
--

INSERT INTO `jb_jobs` (`id`, `name`, `description`, `content`, `apply_url`, `company_id`, `address`, `country_id`, `state_id`, `city_id`, `is_freelance`, `career_level_id`, `salary_from`, `salary_to`, `salary_range`, `currency_id`, `degree_level_id`, `job_shift_id`, `job_experience_id`, `functional_area_id`, `hide_salary`, `number_of_positions`, `expire_date`, `author_id`, `author_type`, `views`, `number_of_applied`, `hide_company`, `latitude`, `longitude`, `auto_renew`, `external_apply_clicks`, `never_expired`, `is_featured`, `status`, `moderation_status`, `created_at`, `updated_at`, `employer_colleagues`, `start_date`, `application_closing_date`, `zip_code`) VALUES
(2, 'Full Stack Engineer', 'Autem natus rerum qui dolores ut architecto. Repudiandae vel reprehenderit et est exercitationem non eaque. Tempora explicabo quod quidem soluta animi ipsa sequi.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', 'https://google.com', 11, NULL, 1, 56, 542, 0, 2, 1200.00, 2700.00, 'yearly', 0, 7, 4, 2, 141, 0, 8, '2023-08-16', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '43.341079', '-76.092561', 0, 0, 1, 1, 'published', 'approved', '2023-06-05 17:38:15', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(3, 'Java Software Engineer', 'Est deserunt omnis et ipsa autem. Qui distinctio soluta deleniti assumenda minima ex sunt. Molestias tenetur ut velit repudiandae esse quis.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 3, NULL, 1, 28, 347, 0, 1, 800.00, 2600.00, 'daily', 1, 2, 2, 3, 101, 0, 10, '2023-08-23', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '42.692501', '-76.495036', 0, 0, 1, 0, 'published', 'approved', '2023-07-06 11:38:47', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(4, 'Digital Marketing Manager', 'Debitis sunt nam hic maxime sint. Quisquam quasi magnam hic doloribus eligendi aut est. Quam tenetur non aut explicabo ex eos aut. Magnam doloremque ducimus dicta quae.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 6, NULL, 1, 51, 489, 0, 1, 900.00, 2800.00, 'hourly', 1, 1, 4, 1, 40, 0, 9, '2023-08-23', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '43.615571', '-74.999897', 0, 0, 1, 1, 'published', 'approved', '2023-05-31 05:36:52', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(5, 'Frontend Developer', 'Libero ipsum sunt numquam aut et. Saepe consequatur est nesciunt voluptas doloribus. Quasi tempore non quo amet harum. Blanditiis dolore molestiae velit temporibus. Itaque ipsam velit eius.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 1, NULL, 1, 19, 283, 0, 1, 1200.00, 2800.00, 'yearly', 0, 7, 3, 2, 64, 0, 5, '2023-08-28', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '42.54077', '-75.900945', 0, 0, 1, 0, 'published', 'approved', '2023-07-03 22:28:51', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(6, 'React Native Web Developer', 'Maxime sit quidem dolore non veritatis ad quibusdam ipsum. Voluptas sed illo voluptate quae. Perspiciatis numquam eos ratione fugit provident et consequatur. Ipsa rerum eum nemo non.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 3, NULL, 1, 28, 347, 0, 2, 1400.00, 2000.00, 'daily', 0, 10, 4, 4, 26, 0, 8, '2023-07-19', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '42.692501', '-76.495036', 0, 0, 0, 0, 'published', 'approved', '2023-06-25 13:04:24', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(7, 'Senior System Engineer', 'Iusto animi doloremque nobis accusantium sunt ipsam. Suscipit voluptatem hic odio autem ipsum blanditiis perferendis. Repudiandae magni sed vero et ab pariatur alias. Est soluta id ad distinctio.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 12, NULL, 1, 19, 283, 0, 5, 1500.00, 2400.00, 'daily', 1, 3, 1, 4, 69, 0, 3, '2023-08-01', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '42.660042', '-74.995146', 0, 0, 1, 0, 'published', 'approved', '2023-06-16 08:20:04', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(8, 'Products Manager', 'Repellat recusandae ratione officiis et qui delectus eligendi. Mollitia hic nihil aut maxime quos inventore. Nihil accusamus quae distinctio vel atque iste. Voluptas nesciunt qui laudantium et.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 12, NULL, 1, 19, 283, 0, 4, 700.00, 3000.00, 'daily', 0, 9, 2, 1, 134, 0, 8, '2023-08-04', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '42.660042', '-74.995146', 0, 0, 0, 0, 'published', 'approved', '2023-07-04 20:22:34', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(9, 'Lead Quality Control QA', 'Quae eos est quis impedit. Enim explicabo suscipit ea mollitia. Vel deserunt qui dolor vitae earum. Quia possimus nobis temporibus facilis blanditiis.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 8, NULL, 1, 55, 530, 0, 4, 900.00, 2600.00, 'daily', 0, 8, 4, 2, 83, 0, 9, '2023-08-25', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '43.439448', '-75.503626', 0, 0, 1, 1, 'published', 'approved', '2023-06-10 23:34:28', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(10, 'Principal Designer, Design Systems', 'Inventore voluptas aut ipsum maxime. Ea temporibus perspiciatis laborum quaerat voluptates ullam ut. Culpa unde neque natus et. Quo possimus et soluta optio voluptatum.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 14, NULL, 1, 6, 79, 0, 4, 500.00, 3000.00, 'daily', 0, 8, 4, 1, 53, 0, 3, '2023-09-09', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '43.54496', '-74.909884', 0, 0, 1, 0, 'published', 'approved', '2023-06-30 18:56:15', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(12, 'Senior Software Engineer, npm CLI', 'Ratione ea perspiciatis consectetur explicabo rerum iusto. Incidunt iure reiciendis aut et. Enim ea dolorum dolorum id doloremque.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 2, NULL, 1, 18, 271, 0, 4, 1200.00, 3000.00, 'hourly', 0, 5, 4, 1, 31, 0, 9, '2023-09-04', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '43.743202', '-75.329594', 0, 0, 1, 1, 'published', 'approved', '2023-05-22 15:40:28', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(13, 'Senior Systems Engineer', 'Voluptates quas in aut atque earum similique hic et. Quis consectetur ut accusamus minima veniam perspiciatis. Eaque aut reiciendis et.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 11, NULL, 1, 56, 542, 0, 1, 1200.00, 2800.00, 'monthly', 1, 3, 4, 2, 130, 0, 9, '2023-07-31', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '43.341079', '-76.092561', 0, 0, 0, 0, 'published', 'approved', '2023-07-02 16:12:38', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(14, 'Software Engineer Actions Platform', 'Ex repellendus et in sed repellendus iure quam. Dolores et ex qui veritatis deleniti. Et voluptas modi sed ut alias.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 13, NULL, 1, 33, 364, 0, 2, 900.00, 2000.00, 'weekly', 0, 3, 3, 4, 134, 0, 9, '2023-08-04', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '43.370876', '-75.595702', 0, 0, 1, 0, 'published', 'approved', '2023-06-09 16:37:05', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(15, 'Staff Engineering Manager, Actions', 'Repudiandae unde quas enim optio aut. Facere inventore inventore commodi aliquid omnis esse sunt. Est ullam rem dolores voluptas esse consequatur.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 1, NULL, 1, 19, 283, 0, 5, 700.00, 2000.00, 'monthly', 0, 8, 4, 5, 119, 0, 5, '2023-07-29', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '42.54077', '-75.900945', 0, 0, 0, 1, 'published', 'approved', '2023-05-24 08:22:59', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(16, 'Staff Engineering Manager: Actions Runtime', 'Occaecati quam numquam vel velit voluptatum placeat voluptates sint. Nihil excepturi voluptatem iusto suscipit et. Rem quia harum ea beatae. Qui quos ullam maxime consequatur.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 13, NULL, 1, 33, 364, 0, 2, 1500.00, 2200.00, 'daily', 0, 9, 4, 5, 39, 0, 2, '2023-07-17', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '43.370876', '-75.595702', 0, 0, 1, 1, 'published', 'approved', '2023-05-20 01:32:14', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(17, 'Staff Engineering Manager, Packages', 'Distinctio quia qui accusantium ea et. Aperiam et eius enim hic fugit officiis aliquid. Temporibus ipsum a eos cumque quos velit rem. Odio quis ut maiores est.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 5, NULL, 1, 51, 488, 0, 1, 1400.00, 2100.00, 'daily', 1, 6, 3, 4, 93, 0, 10, '2023-08-21', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '43.231833', '-76.120095', 0, 0, 0, 1, 'published', 'approved', '2023-06-28 13:59:18', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(18, 'Staff Software Engineer', 'Unde id et eveniet corporis aut possimus similique deleniti. Blanditiis maxime odio nihil quia beatae natus.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 7, NULL, 1, 12, 218, 0, 1, 900.00, 2700.00, 'yearly', 0, 2, 3, 1, 111, 0, 3, '2023-08-22', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '42.836488', '-75.057078', 0, 0, 1, 1, 'published', 'approved', '2023-05-10 01:43:30', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(19, 'Systems Software Engineer', 'Ipsa a neque sed perferendis. Eum itaque aspernatur optio. Adipisci aperiam pariatur et nesciunt. Ipsum ut ipsam aut nesciunt harum ad qui. Eum deserunt nam consequatur magni eaque est ut.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 4, NULL, 1, 52, 521, 0, 3, 700.00, 2700.00, 'yearly', 0, 10, 3, 5, 84, 0, 4, '2023-07-22', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '43.763018', '-75.166239', 0, 0, 0, 1, 'published', 'approved', '2023-05-14 09:58:32', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(20, 'Senior Compensation Analyst', 'Voluptatem repellat id tempora consequatur ea perspiciatis ut rem. Sit est eum quia ea quis distinctio. Repudiandae qui beatae rerum voluptatem fugiat.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 7, NULL, 1, 12, 218, 0, 4, 700.00, 2500.00, 'hourly', 0, 7, 3, 5, 51, 0, 10, '2023-09-02', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '42.836488', '-75.057078', 0, 0, 1, 1, 'published', 'approved', '2023-05-12 13:48:12', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(21, 'Senior Accessibility Program Manager', 'Sapiente minus architecto corrupti. Voluptas ut provident eos possimus quam hic.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 7, NULL, 1, 12, 218, 0, 2, 1500.00, 3000.00, 'daily', 1, 8, 3, 3, 36, 0, 8, '2023-09-08', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '42.836488', '-75.057078', 0, 0, 0, 0, 'published', 'approved', '2023-05-12 01:14:10', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(22, 'Analyst Relations Manager, Application Security', 'Quia consequatur earum qui minus laborum ullam. Et nobis quo nihil quaerat qui. Fugiat nulla voluptates omnis odio atque aperiam iure sit. Possimus praesentium officia ut tempora culpa sed.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 14, NULL, 1, 6, 79, 0, 3, 900.00, 3000.00, 'monthly', 1, 2, 1, 2, 13, 0, 6, '2023-07-26', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '43.54496', '-74.909884', 0, 0, 1, 0, 'published', 'approved', '2023-05-16 21:35:11', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(23, 'Senior Enterprise Advocate, EMEA', 'Perspiciatis iusto id laborum magnam rem cumque. Nulla eos sapiente cumque laudantium qui aut. Ea omnis quia rem provident et.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 10, NULL, 1, 6, 89, 0, 4, 500.00, 2100.00, 'hourly', 0, 3, 2, 4, 7, 0, 4, '2023-07-26', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '43.295915', '-75.97405', 0, 0, 1, 0, 'published', 'approved', '2023-06-16 08:00:00', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(24, 'Deal Desk Manager', 'Reiciendis iusto consequuntur enim qui. Maiores labore libero aut quas. Cumque exercitationem quia porro magnam.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 12, NULL, 1, 19, 283, 0, 5, 800.00, 3000.00, 'weekly', 1, 3, 1, 2, 91, 0, 8, '2023-08-10', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '42.660042', '-74.995146', 0, 0, 0, 1, 'published', 'approved', '2023-06-26 01:30:12', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(25, 'Director, Revenue Compensation', 'Doloribus ex sed blanditiis ut quia rerum. Culpa atque libero itaque suscipit. Voluptatum est blanditiis quis sequi dicta id. Excepturi ipsam eos nemo eveniet dolores sed tempora cupiditate.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 12, NULL, 1, 19, 283, 0, 3, 1200.00, 2600.00, 'monthly', 0, 8, 1, 2, 113, 0, 9, '2023-08-21', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '42.660042', '-74.995146', 0, 0, 0, 0, 'published', 'approved', '2023-06-23 16:27:48', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(26, 'Program Manager', 'Quod eligendi et enim. Dolor molestiae asperiores rerum aut quod et. Velit aut illo voluptas non. Sequi ut magni nobis ut eum aspernatur.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 10, NULL, 1, 6, 89, 0, 5, 1300.00, 2100.00, 'monthly', 1, 10, 3, 4, 54, 0, 4, '2023-08-22', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '43.295915', '-75.97405', 0, 0, 1, 0, 'published', 'approved', '2023-06-05 07:57:23', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(27, 'Sr. Manager, Deal Desk - INTL', 'Qui eum consequuntur expedita sit eos. Ut quod omnis recusandae dignissimos animi facilis quia. Reprehenderit enim quo ut ad nulla at voluptas. Iure minima voluptatibus a et ut.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 10, NULL, 1, 6, 89, 0, 4, 1500.00, 2100.00, 'monthly', 1, 7, 2, 1, 48, 0, 6, '2023-08-17', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '43.295915', '-75.97405', 0, 0, 1, 0, 'published', 'approved', '2023-06-21 07:07:09', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(28, 'Senior Director, Product Management, Actions Runners and Compute Services', 'Qui animi quaerat mollitia veritatis nemo voluptatem doloremque et. Earum exercitationem fugiat et quisquam maxime.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 6, NULL, 1, 51, 489, 0, 4, 1400.00, 2700.00, 'weekly', 0, 4, 2, 2, 22, 0, 7, '2023-08-25', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '43.615571', '-74.999897', 0, 0, 0, 0, 'published', 'approved', '2023-06-29 01:26:15', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(29, 'Alliances Director', 'Reiciendis quia corporis illo beatae velit velit aut. Esse placeat recusandae ut dolore molestias ut. Explicabo consequuntur voluptatem qui.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 12, NULL, 1, 19, 283, 0, 5, 900.00, 2000.00, 'hourly', 0, 6, 3, 4, 94, 0, 2, '2023-08-18', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '42.660042', '-74.995146', 0, 0, 1, 1, 'published', 'approved', '2023-06-18 12:11:32', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL);
INSERT INTO `jb_jobs` (`id`, `name`, `description`, `content`, `apply_url`, `company_id`, `address`, `country_id`, `state_id`, `city_id`, `is_freelance`, `career_level_id`, `salary_from`, `salary_to`, `salary_range`, `currency_id`, `degree_level_id`, `job_shift_id`, `job_experience_id`, `functional_area_id`, `hide_salary`, `number_of_positions`, `expire_date`, `author_id`, `author_type`, `views`, `number_of_applied`, `hide_company`, `latitude`, `longitude`, `auto_renew`, `external_apply_clicks`, `never_expired`, `is_featured`, `status`, `moderation_status`, `created_at`, `updated_at`, `employer_colleagues`, `start_date`, `application_closing_date`, `zip_code`) VALUES
(30, 'Corporate Sales Representative', 'Non voluptatem voluptatem voluptatem eum. Quia eum vel similique tempore doloribus. Dolorum odio labore asperiores voluptatem repellat. Et ipsam animi omnis et.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 6, NULL, 1, 51, 489, 0, 3, 1000.00, 2200.00, 'weekly', 0, 5, 2, 5, 27, 0, 2, '2023-08-12', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '43.615571', '-74.999897', 0, 0, 0, 1, 'published', 'approved', '2023-06-16 07:43:09', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(31, 'Country Leader', 'Qui odit voluptatem molestiae quia doloribus distinctio. Ut itaque ipsam mollitia explicabo. Ut pariatur aut veniam non voluptatibus quo sit quia.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 1, NULL, 1, 19, 283, 0, 3, 1000.00, 2600.00, 'yearly', 0, 10, 2, 1, 26, 0, 3, '2023-08-03', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '42.54077', '-75.900945', 0, 0, 0, 1, 'published', 'approved', '2023-07-08 16:18:34', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(32, 'Customer Success Architect', 'Accusamus assumenda ea ut nulla pariatur. Quod voluptatibus et fuga molestiae hic incidunt consequatur repellendus. Omnis quae laboriosam et doloremque nobis.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 1, NULL, 1, 19, 283, 0, 2, 1500.00, 2400.00, 'weekly', 1, 4, 2, 4, 97, 0, 5, '2023-08-14', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '42.54077', '-75.900945', 0, 0, 1, 1, 'published', 'approved', '2023-06-04 19:39:56', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(33, 'DevOps Account Executive - US Public Sector', 'Fugit rerum facilis qui incidunt quia est. Alias eos quia rerum eveniet. Facere vero excepturi id quibusdam. Sequi architecto voluptatibus eos libero sint cupiditate.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 5, NULL, 1, 51, 488, 0, 2, 700.00, 2900.00, 'monthly', 1, 3, 1, 4, 50, 0, 6, '2023-07-31', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '43.231833', '-76.120095', 0, 0, 0, 1, 'published', 'approved', '2023-07-01 08:22:42', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(34, 'Enterprise Account Executive', 'Rerum impedit velit aut quam totam. Doloremque eligendi reprehenderit corrupti aut ex.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 7, NULL, 1, 12, 218, 0, 2, 1100.00, 2800.00, 'daily', 1, 1, 1, 3, 115, 0, 5, '2023-08-04', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '42.836488', '-75.057078', 0, 0, 1, 1, 'published', 'approved', '2023-05-31 09:16:36', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(35, 'Senior Engineering Manager, Product Security Engineering - Paved Paths', 'Ut rem ea est recusandae. Ut nihil minus ut. Dolores et nobis quod a maiores sed. Ad est velit odit a non libero.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 7, NULL, 1, 12, 218, 0, 3, 1400.00, 2200.00, 'daily', 1, 10, 2, 2, 23, 0, 10, '2023-08-25', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '42.836488', '-75.057078', 0, 0, 0, 1, 'published', 'approved', '2023-06-28 14:29:34', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(36, 'Customer Reliability Engineer III', 'Consequatur sint recusandae labore mollitia et molestiae exercitationem. Ea occaecati facilis officia hic ipsa. Ullam et repudiandae ab occaecati ea quos.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 14, NULL, 1, 6, 79, 0, 5, 1300.00, 2400.00, 'yearly', 0, 10, 4, 2, 45, 0, 4, '2023-08-26', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '43.54496', '-74.909884', 0, 0, 1, 1, 'published', 'approved', '2023-06-13 12:16:51', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(37, 'Support Engineer (Enterprise Support Japanese)', 'Illo iure tempora aperiam vero. Vitae aliquid doloremque necessitatibus modi ea. Aut amet quae aperiam tempora consequuntur.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 11, NULL, 1, 56, 542, 0, 2, 1100.00, 2300.00, 'weekly', 0, 5, 3, 3, 44, 0, 5, '2023-07-17', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '43.341079', '-76.092561', 0, 0, 1, 1, 'published', 'approved', '2023-06-28 15:20:32', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(38, 'Technical Partner Manager', 'Possimus consequatur et ea. Dolorem ullam voluptates sit veniam. Mollitia totam atque aut numquam aut dicta.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 8, NULL, 1, 55, 530, 0, 5, 1200.00, 2700.00, 'daily', 1, 5, 1, 4, 46, 0, 5, '2023-07-23', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '43.439448', '-75.503626', 0, 0, 0, 1, 'published', 'approved', '2023-06-27 05:19:16', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(39, 'Sr Manager, Inside Account Management', 'Omnis beatae facere adipisci sunt est ratione. Velit et aut debitis et architecto aspernatur dolorem. Earum earum perferendis quis molestias.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 8, NULL, 1, 55, 530, 0, 2, 900.00, 2600.00, 'monthly', 0, 2, 4, 1, 104, 0, 2, '2023-08-06', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '43.439448', '-75.503626', 0, 0, 0, 0, 'published', 'approved', '2023-06-09 05:19:51', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(40, 'Services Sales Representative', 'Et nemo quis esse. Autem ipsum architecto consequatur dignissimos qui ut consequatur. Dolore sunt veniam amet aut.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 14, NULL, 1, 6, 79, 0, 1, 500.00, 2200.00, 'yearly', 1, 9, 1, 4, 122, 0, 3, '2023-08-25', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '43.54496', '-74.909884', 0, 0, 1, 0, 'published', 'approved', '2023-06-15 19:48:03', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(41, 'Services Delivery Manager', 'Quae a voluptatibus vel consequuntur numquam. Est praesentium asperiores sed ea consectetur est. Voluptatem pariatur eos eum et nemo dicta et.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 6, NULL, 1, 51, 489, 0, 4, 900.00, 2400.00, 'hourly', 0, 5, 1, 1, 144, 0, 6, '2023-07-27', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '43.615571', '-74.999897', 0, 0, 1, 0, 'published', 'approved', '2023-05-15 08:10:55', '2023-07-10 00:34:55', NULL, NULL, NULL, NULL),
(44, 'Senior Director, Global Sales Development', 'Non tempora hic ex ipsam aspernatur et possimus. Nesciunt non porro ad ut expedita. Dolorem et culpa numquam voluptas dolorum aut.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 11, NULL, 1, 56, 542, 0, 3, 500.00, 2400.00, 'hourly', 1, 2, 4, 5, 136, 0, 6, '2023-08-24', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '43.341079', '-76.092561', 0, 0, 0, 0, 'published', 'approved', '2023-05-11 10:48:15', '2023-07-10 00:34:56', NULL, NULL, NULL, NULL),
(45, 'Partner Program Manager', 'Consequuntur aut libero nihil aspernatur quia. Ea illo omnis voluptate quia minus quisquam. Suscipit minus neque ut iste corrupti provident. Qui culpa earum et quis nostrum.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 10, NULL, 1, 6, 89, 0, 1, 600.00, 2400.00, 'weekly', 1, 1, 2, 4, 123, 0, 2, '2023-08-06', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '43.295915', '-75.97405', 0, 0, 0, 0, 'published', 'approved', '2023-06-19 14:20:55', '2023-07-10 00:34:56', NULL, NULL, NULL, NULL),
(46, 'Principal Cloud Solutions Engineer', 'Facilis id sint dolor quam optio iure. Voluptas voluptatum nulla earum necessitatibus.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 8, NULL, 1, 55, 530, 0, 3, 800.00, 2500.00, 'daily', 1, 5, 4, 5, 21, 0, 2, '2023-08-24', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '43.439448', '-75.503626', 0, 0, 1, 0, 'published', 'approved', '2023-06-03 06:36:00', '2023-07-10 00:34:56', NULL, NULL, NULL, NULL),
(47, 'Senior Cloud Solutions Engineer', 'Eos aut fuga ratione recusandae. Eos perferendis provident saepe optio. Aut autem vitae ex ipsa est minima. Omnis eius maiores ex.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 13, NULL, 1, 33, 364, 0, 2, 800.00, 2700.00, 'yearly', 1, 4, 1, 4, 36, 0, 6, '2023-09-08', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '43.370876', '-75.595702', 0, 0, 1, 0, 'published', 'approved', '2023-06-07 22:29:47', '2023-07-10 00:34:56', NULL, NULL, NULL, NULL),
(48, 'Senior Customer Success Manager', 'Et qui voluptatem sed rerum fugiat a in. Occaecati voluptatem dolore voluptas asperiores amet dolorem. Neque perspiciatis minus non reiciendis. Accusamus eos ea ad nobis.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 2, NULL, 1, 18, 271, 0, 2, 600.00, 2600.00, 'weekly', 1, 3, 4, 2, 36, 0, 7, '2023-08-02', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '43.743202', '-75.329594', 0, 0, 1, 0, 'published', 'approved', '2023-07-05 11:49:34', '2023-07-10 00:34:56', NULL, NULL, NULL, NULL),
(49, 'Inside Account Manager', 'Qui minus sapiente voluptatem ea ut. Architecto a nostrum expedita autem. Aut mollitia molestiae qui provident dolorum quas enim. Voluptas voluptatem enim qui aut ipsa omnis nulla.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 9, NULL, 1, 12, 221, 0, 3, 700.00, 2600.00, 'hourly', 0, 3, 3, 4, 122, 0, 5, '2023-08-04', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '43.916201', '-75.067747', 0, 0, 0, 0, 'published', 'approved', '2023-06-16 04:54:56', '2023-07-10 00:34:56', NULL, NULL, NULL, NULL),
(50, 'UX Jobs Board', 'Vitae voluptatibus similique debitis et omnis. Ducimus inventore voluptatum et rem. Quos deleniti illo quas voluptate.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 2, NULL, 1, 18, 271, 0, 5, 700.00, 2500.00, 'yearly', 0, 3, 1, 2, 119, 0, 3, '2023-08-15', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '43.743202', '-75.329594', 0, 0, 0, 0, 'published', 'approved', '2023-06-01 02:26:32', '2023-07-10 00:34:56', NULL, NULL, NULL, NULL),
(51, 'Senior Laravel Developer (TALL Stack)', 'Animi non voluptate optio et voluptas id similique. Eos alias et maxime quia quo. Suscipit et qui et et sed. Aperiam non voluptatibus est ipsum quibusdam magnam.', '<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>', '', 14, NULL, 1, 6, 79, 0, 4, 800.00, 2800.00, 'hourly', 1, 4, 1, 2, 70, 0, 3, '2023-09-03', 1, 'Botble\\JobBoard\\Models\\Account', 0, 0, 0, '43.54496', '-74.909884', 0, 0, 0, 1, 'published', 'approved', '2023-06-10 20:20:57', '2023-07-10 00:34:56', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jb_jobs_categories`
--

CREATE TABLE `jb_jobs_categories` (
  `job_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jb_jobs_categories`
--

INSERT INTO `jb_jobs_categories` (`job_id`, `category_id`) VALUES
(1, 1),
(1, 2),
(1, 8),
(2, 1),
(2, 5),
(2, 7),
(3, 1),
(3, 3),
(3, 10),
(4, 1),
(4, 2),
(4, 7),
(5, 1),
(5, 2),
(5, 10),
(6, 1),
(6, 5),
(6, 6),
(7, 1),
(7, 5),
(7, 9),
(8, 1),
(8, 4),
(8, 9),
(9, 1),
(9, 1),
(9, 8),
(10, 1),
(10, 5),
(10, 10),
(11, 1),
(11, 3),
(11, 8),
(12, 1),
(12, 3),
(12, 9),
(13, 1),
(13, 5),
(13, 7),
(14, 1),
(14, 4),
(14, 7),
(15, 1),
(15, 1),
(15, 8),
(16, 1),
(16, 1),
(16, 10),
(17, 1),
(17, 4),
(17, 7),
(18, 1),
(18, 1),
(18, 8),
(19, 1),
(19, 2),
(19, 10),
(20, 1),
(20, 2),
(20, 7),
(21, 1),
(21, 4),
(21, 10),
(22, 1),
(22, 1),
(22, 10),
(23, 1),
(23, 4),
(23, 9),
(24, 1),
(24, 1),
(24, 9),
(25, 1),
(25, 5),
(25, 9),
(26, 1),
(26, 3),
(26, 10),
(27, 1),
(27, 4),
(27, 8),
(28, 1),
(28, 4),
(28, 9),
(29, 1),
(29, 2),
(29, 10),
(30, 1),
(30, 4),
(30, 9),
(31, 1),
(31, 4),
(31, 7),
(32, 1),
(32, 4),
(32, 10),
(33, 1),
(33, 2),
(33, 8),
(34, 1),
(34, 2),
(34, 9),
(35, 1),
(35, 4),
(35, 6),
(36, 1),
(36, 3),
(36, 8),
(37, 1),
(37, 3),
(37, 7),
(38, 1),
(38, 5),
(38, 6),
(39, 1),
(39, 3),
(39, 8),
(40, 1),
(40, 1),
(40, 10),
(41, 1),
(41, 5),
(41, 8),
(42, 1),
(42, 3),
(42, 7),
(43, 1),
(43, 5),
(43, 7),
(44, 1),
(44, 3),
(44, 9),
(45, 1),
(45, 3),
(45, 10),
(46, 1),
(46, 2),
(46, 9),
(47, 1),
(47, 5),
(47, 9),
(48, 1),
(48, 2),
(48, 10),
(49, 1),
(49, 4),
(49, 9),
(50, 1),
(50, 3),
(50, 9),
(51, 1),
(51, 3),
(51, 7);

-- --------------------------------------------------------

--
-- Table structure for table `jb_jobs_skills`
--

CREATE TABLE `jb_jobs_skills` (
  `job_id` bigint(20) UNSIGNED NOT NULL,
  `job_skill_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jb_jobs_skills`
--

INSERT INTO `jb_jobs_skills` (`job_id`, `job_skill_id`) VALUES
(1, 7),
(2, 10),
(3, 5),
(4, 10),
(5, 4),
(6, 4),
(7, 12),
(8, 2),
(9, 4),
(10, 12),
(11, 1),
(12, 11),
(13, 8),
(14, 5),
(15, 1),
(16, 4),
(17, 6),
(18, 12),
(19, 3),
(20, 10),
(21, 3),
(22, 5),
(23, 3),
(24, 1),
(25, 11),
(26, 2),
(27, 11),
(28, 10),
(29, 3),
(30, 11),
(31, 6),
(32, 3),
(33, 8),
(34, 5),
(35, 5),
(36, 7),
(37, 12),
(38, 3),
(39, 3),
(40, 9),
(41, 3),
(42, 6),
(43, 8),
(44, 5),
(45, 3),
(46, 12),
(47, 9),
(48, 3),
(49, 10),
(50, 4),
(51, 10);

-- --------------------------------------------------------

--
-- Table structure for table `jb_jobs_tags`
--

CREATE TABLE `jb_jobs_tags` (
  `job_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jb_jobs_tags`
--

INSERT INTO `jb_jobs_tags` (`job_id`, `tag_id`) VALUES
(1, 1),
(1, 8),
(2, 4),
(2, 8),
(3, 1),
(3, 7),
(4, 3),
(4, 6),
(5, 2),
(5, 8),
(6, 1),
(6, 5),
(7, 2),
(7, 7),
(8, 2),
(8, 7),
(9, 4),
(9, 6),
(10, 2),
(10, 5),
(11, 4),
(11, 6),
(12, 1),
(12, 5),
(13, 3),
(13, 5),
(14, 3),
(14, 6),
(15, 4),
(15, 6),
(16, 1),
(16, 5),
(17, 4),
(17, 8),
(18, 3),
(18, 8),
(19, 4),
(19, 8),
(20, 2),
(20, 8),
(21, 3),
(21, 7),
(22, 2),
(22, 5),
(23, 1),
(23, 5),
(24, 4),
(24, 8),
(25, 4),
(25, 7),
(26, 1),
(26, 7),
(27, 1),
(27, 8),
(28, 2),
(28, 7),
(29, 1),
(29, 7),
(30, 3),
(30, 6),
(31, 2),
(31, 8),
(32, 1),
(32, 8),
(33, 4),
(33, 5),
(34, 1),
(34, 7),
(35, 1),
(35, 7),
(36, 1),
(36, 5),
(37, 3),
(37, 8),
(38, 2),
(38, 5),
(39, 1),
(39, 7),
(40, 3),
(40, 6),
(41, 3),
(41, 6),
(42, 2),
(42, 6),
(43, 3),
(43, 5),
(44, 4),
(44, 6),
(45, 2),
(45, 5),
(46, 4),
(46, 8),
(47, 2),
(47, 5),
(48, 2),
(48, 6),
(49, 3),
(49, 5),
(50, 2),
(50, 6),
(51, 2),
(51, 8);

-- --------------------------------------------------------

--
-- Table structure for table `jb_jobs_translations`
--

CREATE TABLE `jb_jobs_translations` (
  `lang_code` varchar(191) NOT NULL,
  `jb_jobs_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `content` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_jobs_types`
--

CREATE TABLE `jb_jobs_types` (
  `job_id` bigint(20) UNSIGNED NOT NULL,
  `job_type_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jb_jobs_types`
--

INSERT INTO `jb_jobs_types` (`job_id`, `job_type_id`) VALUES
(1, 4),
(2, 5),
(3, 2),
(4, 4),
(5, 4),
(6, 4),
(7, 2),
(8, 4),
(9, 4),
(10, 2),
(11, 2),
(12, 1),
(13, 2),
(14, 3),
(15, 5),
(16, 1),
(17, 1),
(18, 2),
(19, 2),
(20, 5),
(21, 5),
(22, 3),
(23, 3),
(24, 4),
(25, 5),
(26, 2),
(27, 5),
(28, 2),
(29, 5),
(30, 1),
(31, 2),
(32, 1),
(33, 3),
(34, 1),
(35, 2),
(36, 3),
(37, 3),
(38, 1),
(39, 1),
(40, 3),
(41, 1),
(42, 5),
(43, 2),
(44, 4),
(45, 3),
(46, 1),
(47, 3),
(48, 2),
(49, 3),
(50, 2),
(51, 5);

-- --------------------------------------------------------

--
-- Table structure for table `jb_job_experiences`
--

CREATE TABLE `jb_job_experiences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jb_job_experiences`
--

INSERT INTO `jb_job_experiences` (`id`, `name`, `order`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Fresh', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(2, 'Less Than 1 Year', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(3, '1 Year', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(4, '2 Year', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(5, '3 Year', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(6, '4 Year', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(7, '5 Year', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(8, '6 Year', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(9, '7 Year', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(10, '8 Year', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(11, '9 Year', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(12, '10 Year', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54');

-- --------------------------------------------------------

--
-- Table structure for table `jb_job_experiences_translations`
--

CREATE TABLE `jb_job_experiences_translations` (
  `lang_code` varchar(191) NOT NULL,
  `jb_job_experiences_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_job_shifts`
--

CREATE TABLE `jb_job_shifts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jb_job_shifts`
--

INSERT INTO `jb_job_shifts` (`id`, `name`, `order`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(1, 'First Shift (Day)', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(2, 'Second Shift (Afternoon)', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(3, 'Third Shift (Night)', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(4, 'Rotating', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54');

-- --------------------------------------------------------

--
-- Table structure for table `jb_job_shifts_translations`
--

CREATE TABLE `jb_job_shifts_translations` (
  `lang_code` varchar(191) NOT NULL,
  `jb_job_shifts_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_job_skills`
--

CREATE TABLE `jb_job_skills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jb_job_skills`
--

INSERT INTO `jb_job_skills` (`id`, `name`, `order`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Javascript', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(2, 'PHP', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(3, 'Python', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(4, 'Laravel', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(5, 'CakePHP', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(6, 'Wordpress', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(7, 'JS', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(8, 'PHP', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(9, 'CSS', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(10, 'HTML', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(11, 'Laravel', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(12, 'WordPress', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54');

-- --------------------------------------------------------

--
-- Table structure for table `jb_job_skills_translations`
--

CREATE TABLE `jb_job_skills_translations` (
  `lang_code` varchar(191) NOT NULL,
  `jb_job_skills_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_job_types`
--

CREATE TABLE `jb_job_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jb_job_types`
--

INSERT INTO `jb_job_types` (`id`, `name`, `order`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Contract', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(2, 'Freelance', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(3, 'Full Time', 0, 1, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(4, 'Internship', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(5, 'Part Time', 0, 0, 'published', '2023-07-10 00:34:54', '2023-07-10 00:34:54');

-- --------------------------------------------------------

--
-- Table structure for table `jb_job_types_translations`
--

CREATE TABLE `jb_job_types_translations` (
  `lang_code` varchar(191) NOT NULL,
  `jb_job_types_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_language_levels`
--

CREATE TABLE `jb_language_levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jb_language_levels`
--

INSERT INTO `jb_language_levels` (`id`, `name`, `order`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Expert', 0, 0, 'published', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(2, 'Intermediate', 0, 0, 'published', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(3, 'Beginner', 0, 0, 'published', '2023-07-10 00:34:55', '2023-07-10 00:34:55');

-- --------------------------------------------------------

--
-- Table structure for table `jb_language_levels_translations`
--

CREATE TABLE `jb_language_levels_translations` (
  `lang_code` varchar(191) NOT NULL,
  `jb_language_levels_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_major_subjects`
--

CREATE TABLE `jb_major_subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_packages`
--

CREATE TABLE `jb_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `price` double(15,2) UNSIGNED NOT NULL,
  `currency_id` bigint(20) UNSIGNED NOT NULL,
  `percent_save` int(10) UNSIGNED DEFAULT 0,
  `number_of_listings` int(10) UNSIGNED NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `account_limit` int(10) UNSIGNED DEFAULT NULL,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jb_packages`
--

INSERT INTO `jb_packages` (`id`, `name`, `price`, `currency_id`, `percent_save`, `number_of_listings`, `order`, `account_limit`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Free First Post', 0.00, 1, 0, 1, 0, 1, 0, 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(2, 'Single Post', 250.00, 1, 0, 1, 0, NULL, 1, 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(3, '5 Posts', 1000.00, 1, 20, 5, 0, NULL, 0, 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03');

-- --------------------------------------------------------

--
-- Table structure for table `jb_packages_translations`
--

CREATE TABLE `jb_packages_translations` (
  `lang_code` varchar(191) NOT NULL,
  `jb_packages_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_reviews`
--

CREATE TABLE `jb_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reviewable_type` varchar(191) NOT NULL,
  `reviewable_id` bigint(20) UNSIGNED NOT NULL,
  `created_by_type` varchar(191) NOT NULL,
  `created_by_id` bigint(20) UNSIGNED NOT NULL,
  `star` double(8,2) NOT NULL,
  `review` text NOT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jb_reviews`
--

INSERT INTO `jb_reviews` (`id`, `reviewable_type`, `reviewable_id`, `created_by_type`, `created_by_id`, `star`, `review`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Botble\\JobBoard\\Models\\Company', 13, 'Botble\\JobBoard\\Models\\Account', 29, 5.00, 'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(2, 'Botble\\JobBoard\\Models\\Company', 13, 'Botble\\JobBoard\\Models\\Account', 86, 5.00, 'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(3, 'Botble\\JobBoard\\Models\\Company', 4, 'Botble\\JobBoard\\Models\\Account', 21, 2.00, 'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(4, 'Botble\\JobBoard\\Models\\Company', 6, 'Botble\\JobBoard\\Models\\Account', 85, 2.00, 'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(5, 'Botble\\JobBoard\\Models\\Company', 10, 'Botble\\JobBoard\\Models\\Account', 53, 3.00, 'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(6, 'Botble\\JobBoard\\Models\\Account', 44, 'Botble\\JobBoard\\Models\\Company', 9, 4.00, 'The code is good, in general, if you like it, can you give it 5 stars?', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(7, 'Botble\\JobBoard\\Models\\Account', 22, 'Botble\\JobBoard\\Models\\Company', 5, 2.00, 'Good app, good backup service and support. Good documentation.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(8, 'Botble\\JobBoard\\Models\\Account', 34, 'Botble\\JobBoard\\Models\\Company', 10, 3.00, 'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(9, 'Botble\\JobBoard\\Models\\Account', 13, 'Botble\\JobBoard\\Models\\Company', 4, 3.00, 'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(11, 'Botble\\JobBoard\\Models\\Account', 10, 'Botble\\JobBoard\\Models\\Company', 12, 1.00, 'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(12, 'Botble\\JobBoard\\Models\\Account', 38, 'Botble\\JobBoard\\Models\\Company', 13, 2.00, 'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(13, 'Botble\\JobBoard\\Models\\Account', 93, 'Botble\\JobBoard\\Models\\Company', 12, 5.00, 'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(14, 'Botble\\JobBoard\\Models\\Company', 9, 'Botble\\JobBoard\\Models\\Account', 69, 4.00, 'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(15, 'Botble\\JobBoard\\Models\\Account', 85, 'Botble\\JobBoard\\Models\\Company', 3, 4.00, 'Best ecommerce CMS online store!', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(16, 'Botble\\JobBoard\\Models\\Account', 88, 'Botble\\JobBoard\\Models\\Company', 2, 5.00, 'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(17, 'Botble\\JobBoard\\Models\\Account', 44, 'Botble\\JobBoard\\Models\\Company', 10, 2.00, 'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(18, 'Botble\\JobBoard\\Models\\Company', 2, 'Botble\\JobBoard\\Models\\Account', 73, 2.00, 'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(19, 'Botble\\JobBoard\\Models\\Account', 86, 'Botble\\JobBoard\\Models\\Company', 1, 3.00, 'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(21, 'Botble\\JobBoard\\Models\\Company', 1, 'Botble\\JobBoard\\Models\\Account', 20, 1.00, 'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(22, 'Botble\\JobBoard\\Models\\Account', 34, 'Botble\\JobBoard\\Models\\Company', 14, 2.00, 'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(23, 'Botble\\JobBoard\\Models\\Company', 5, 'Botble\\JobBoard\\Models\\Account', 88, 1.00, 'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(24, 'Botble\\JobBoard\\Models\\Account', 61, 'Botble\\JobBoard\\Models\\Company', 13, 4.00, 'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(25, 'Botble\\JobBoard\\Models\\Company', 12, 'Botble\\JobBoard\\Models\\Account', 79, 5.00, 'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(26, 'Botble\\JobBoard\\Models\\Company', 14, 'Botble\\JobBoard\\Models\\Account', 31, 4.00, 'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(27, 'Botble\\JobBoard\\Models\\Company', 6, 'Botble\\JobBoard\\Models\\Account', 2, 3.00, 'Best ecommerce CMS online store!', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(28, 'Botble\\JobBoard\\Models\\Company', 11, 'Botble\\JobBoard\\Models\\Account', 13, 4.00, 'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(29, 'Botble\\JobBoard\\Models\\Account', 73, 'Botble\\JobBoard\\Models\\Company', 10, 3.00, 'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(30, 'Botble\\JobBoard\\Models\\Company', 4, 'Botble\\JobBoard\\Models\\Account', 9, 1.00, 'Clean & perfect source code', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(31, 'Botble\\JobBoard\\Models\\Company', 7, 'Botble\\JobBoard\\Models\\Account', 25, 3.00, 'The code is good, in general, if you like it, can you give it 5 stars?', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(32, 'Botble\\JobBoard\\Models\\Account', 93, 'Botble\\JobBoard\\Models\\Company', 14, 3.00, 'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(33, 'Botble\\JobBoard\\Models\\Account', 49, 'Botble\\JobBoard\\Models\\Company', 10, 3.00, 'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(34, 'Botble\\JobBoard\\Models\\Company', 9, 'Botble\\JobBoard\\Models\\Account', 42, 4.00, 'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(35, 'Botble\\JobBoard\\Models\\Account', 98, 'Botble\\JobBoard\\Models\\Company', 12, 1.00, 'We have received brilliant service support and will be expanding the features with the developer. Nice product!', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(37, 'Botble\\JobBoard\\Models\\Account', 88, 'Botble\\JobBoard\\Models\\Company', 5, 5.00, 'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(38, 'Botble\\JobBoard\\Models\\Account', 78, 'Botble\\JobBoard\\Models\\Company', 16, 1.00, 'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(39, 'Botble\\JobBoard\\Models\\Account', 83, 'Botble\\JobBoard\\Models\\Company', 11, 1.00, 'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(40, 'Botble\\JobBoard\\Models\\Company', 5, 'Botble\\JobBoard\\Models\\Account', 49, 3.00, 'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(41, 'Botble\\JobBoard\\Models\\Company', 3, 'Botble\\JobBoard\\Models\\Account', 97, 1.00, 'The code is good, in general, if you like it, can you give it 5 stars?', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(42, 'Botble\\JobBoard\\Models\\Company', 11, 'Botble\\JobBoard\\Models\\Account', 77, 1.00, 'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(43, 'Botble\\JobBoard\\Models\\Company', 7, 'Botble\\JobBoard\\Models\\Account', 90, 3.00, 'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(44, 'Botble\\JobBoard\\Models\\Account', 57, 'Botble\\JobBoard\\Models\\Company', 8, 5.00, 'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(45, 'Botble\\JobBoard\\Models\\Account', 92, 'Botble\\JobBoard\\Models\\Company', 11, 1.00, 'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(46, 'Botble\\JobBoard\\Models\\Company', 5, 'Botble\\JobBoard\\Models\\Account', 27, 2.00, 'Good app, good backup service and support. Good documentation.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(47, 'Botble\\JobBoard\\Models\\Account', 61, 'Botble\\JobBoard\\Models\\Company', 5, 1.00, 'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(48, 'Botble\\JobBoard\\Models\\Company', 3, 'Botble\\JobBoard\\Models\\Account', 12, 2.00, 'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(49, 'Botble\\JobBoard\\Models\\Account', 77, 'Botble\\JobBoard\\Models\\Company', 11, 3.00, 'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(50, 'Botble\\JobBoard\\Models\\Account', 32, 'Botble\\JobBoard\\Models\\Company', 11, 5.00, 'Great E-commerce system. And much more : Wonderful Customer Support.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(51, 'Botble\\JobBoard\\Models\\Company', 3, 'Botble\\JobBoard\\Models\\Account', 72, 3.00, 'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(52, 'Botble\\JobBoard\\Models\\Company', 2, 'Botble\\JobBoard\\Models\\Account', 56, 5.00, 'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(53, 'Botble\\JobBoard\\Models\\Account', 34, 'Botble\\JobBoard\\Models\\Company', 1, 2.00, 'The code is good, in general, if you like it, can you give it 5 stars?', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(54, 'Botble\\JobBoard\\Models\\Account', 59, 'Botble\\JobBoard\\Models\\Company', 15, 4.00, 'The code is good, in general, if you like it, can you give it 5 stars?', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(55, 'Botble\\JobBoard\\Models\\Account', 45, 'Botble\\JobBoard\\Models\\Company', 4, 4.00, 'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(56, 'Botble\\JobBoard\\Models\\Account', 51, 'Botble\\JobBoard\\Models\\Company', 16, 3.00, 'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(57, 'Botble\\JobBoard\\Models\\Account', 76, 'Botble\\JobBoard\\Models\\Company', 7, 5.00, 'Best ecommerce CMS online store!', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(58, 'Botble\\JobBoard\\Models\\Account', 86, 'Botble\\JobBoard\\Models\\Company', 4, 4.00, 'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(59, 'Botble\\JobBoard\\Models\\Company', 11, 'Botble\\JobBoard\\Models\\Account', 55, 5.00, 'The code is good, in general, if you like it, can you give it 5 stars?', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(60, 'Botble\\JobBoard\\Models\\Company', 2, 'Botble\\JobBoard\\Models\\Account', 99, 4.00, 'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(61, 'Botble\\JobBoard\\Models\\Company', 13, 'Botble\\JobBoard\\Models\\Account', 71, 4.00, 'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(63, 'Botble\\JobBoard\\Models\\Company', 6, 'Botble\\JobBoard\\Models\\Account', 99, 2.00, 'Good app, good backup service and support. Good documentation.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(64, 'Botble\\JobBoard\\Models\\Company', 5, 'Botble\\JobBoard\\Models\\Account', 84, 2.00, 'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(65, 'Botble\\JobBoard\\Models\\Company', 12, 'Botble\\JobBoard\\Models\\Account', 87, 4.00, 'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(66, 'Botble\\JobBoard\\Models\\Account', 99, 'Botble\\JobBoard\\Models\\Company', 8, 2.00, 'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(68, 'Botble\\JobBoard\\Models\\Company', 5, 'Botble\\JobBoard\\Models\\Account', 55, 4.00, 'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(69, 'Botble\\JobBoard\\Models\\Account', 6, 'Botble\\JobBoard\\Models\\Company', 3, 4.00, 'It\'s not my first experience here on CodeCanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(70, 'Botble\\JobBoard\\Models\\Company', 5, 'Botble\\JobBoard\\Models\\Account', 71, 5.00, 'Great E-commerce system. And much more : Wonderful Customer Support.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(71, 'Botble\\JobBoard\\Models\\Company', 13, 'Botble\\JobBoard\\Models\\Account', 57, 5.00, 'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(72, 'Botble\\JobBoard\\Models\\Company', 8, 'Botble\\JobBoard\\Models\\Account', 59, 2.00, 'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(73, 'Botble\\JobBoard\\Models\\Account', 48, 'Botble\\JobBoard\\Models\\Company', 5, 1.00, 'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(74, 'Botble\\JobBoard\\Models\\Company', 9, 'Botble\\JobBoard\\Models\\Account', 5, 4.00, 'Best ecommerce CMS online store!', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(75, 'Botble\\JobBoard\\Models\\Account', 3, 'Botble\\JobBoard\\Models\\Company', 6, 3.00, 'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(76, 'Botble\\JobBoard\\Models\\Account', 32, 'Botble\\JobBoard\\Models\\Company', 12, 1.00, 'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(78, 'Botble\\JobBoard\\Models\\Company', 11, 'Botble\\JobBoard\\Models\\Account', 84, 3.00, 'Good app, good backup service and support. Good documentation.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(79, 'Botble\\JobBoard\\Models\\Account', 55, 'Botble\\JobBoard\\Models\\Company', 10, 5.00, 'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(80, 'Botble\\JobBoard\\Models\\Company', 13, 'Botble\\JobBoard\\Models\\Account', 65, 5.00, 'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(81, 'Botble\\JobBoard\\Models\\Company', 7, 'Botble\\JobBoard\\Models\\Account', 51, 5.00, 'Great E-commerce system. And much more : Wonderful Customer Support.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(82, 'Botble\\JobBoard\\Models\\Account', 10, 'Botble\\JobBoard\\Models\\Company', 9, 4.00, 'The code is good, in general, if you like it, can you give it 5 stars?', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(83, 'Botble\\JobBoard\\Models\\Company', 7, 'Botble\\JobBoard\\Models\\Account', 2, 1.00, 'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(86, 'Botble\\JobBoard\\Models\\Company', 5, 'Botble\\JobBoard\\Models\\Account', 38, 5.00, 'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(87, 'Botble\\JobBoard\\Models\\Company', 14, 'Botble\\JobBoard\\Models\\Account', 14, 4.00, 'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(88, 'Botble\\JobBoard\\Models\\Company', 7, 'Botble\\JobBoard\\Models\\Account', 94, 4.00, 'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(89, 'Botble\\JobBoard\\Models\\Company', 3, 'Botble\\JobBoard\\Models\\Account', 84, 5.00, 'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(90, 'Botble\\JobBoard\\Models\\Company', 4, 'Botble\\JobBoard\\Models\\Account', 94, 5.00, 'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(91, 'Botble\\JobBoard\\Models\\Account', 81, 'Botble\\JobBoard\\Models\\Company', 16, 5.00, 'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(92, 'Botble\\JobBoard\\Models\\Account', 50, 'Botble\\JobBoard\\Models\\Company', 16, 5.00, 'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(93, 'Botble\\JobBoard\\Models\\Company', 10, 'Botble\\JobBoard\\Models\\Account', 39, 5.00, 'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(94, 'Botble\\JobBoard\\Models\\Company', 8, 'Botble\\JobBoard\\Models\\Account', 48, 5.00, 'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(95, 'Botble\\JobBoard\\Models\\Account', 53, 'Botble\\JobBoard\\Models\\Company', 14, 5.00, 'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(97, 'Botble\\JobBoard\\Models\\Company', 13, 'Botble\\JobBoard\\Models\\Account', 13, 4.00, 'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(98, 'Botble\\JobBoard\\Models\\Company', 6, 'Botble\\JobBoard\\Models\\Account', 32, 1.00, 'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(99, 'Botble\\JobBoard\\Models\\Account', 27, 'Botble\\JobBoard\\Models\\Company', 11, 2.00, 'Clean & perfect source code', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(100, 'Botble\\JobBoard\\Models\\Account', 34, 'Botble\\JobBoard\\Models\\Company', 12, 2.00, 'We have received brilliant service support and will be expanding the features with the developer. Nice product!', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03');

-- --------------------------------------------------------

--
-- Table structure for table `jb_saved_jobs`
--

CREATE TABLE `jb_saved_jobs` (
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `job_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_tags`
--

CREATE TABLE `jb_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jb_tags`
--

INSERT INTO `jb_tags` (`id`, `name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Illustrator', '', 'published', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(2, 'Adobe XD', '', 'published', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(3, 'Figma', '', 'published', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(4, 'Sketch', '', 'published', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(5, 'Lunacy', '', 'published', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(6, 'PHP', '', 'published', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(7, 'Python', '', 'published', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(8, 'JavaScript', '', 'published', '2023-07-10 00:34:55', '2023-07-10 00:34:55');

-- --------------------------------------------------------

--
-- Table structure for table `jb_tags_translations`
--

CREATE TABLE `jb_tags_translations` (
  `lang_code` varchar(191) NOT NULL,
  `jb_tags_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jb_transactions`
--

CREATE TABLE `jb_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `credits` int(10) UNSIGNED NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(191) NOT NULL DEFAULT 'add',
  `payment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `lang_id` bigint(20) UNSIGNED NOT NULL,
  `lang_name` varchar(120) NOT NULL,
  `lang_locale` varchar(20) NOT NULL,
  `lang_code` varchar(20) NOT NULL,
  `lang_flag` varchar(20) DEFAULT NULL,
  `lang_is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lang_order` int(11) NOT NULL DEFAULT 0,
  `lang_is_rtl` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`lang_id`, `lang_name`, `lang_locale`, `lang_code`, `lang_flag`, `lang_is_default`, `lang_order`, `lang_is_rtl`) VALUES
(1, 'English', 'en', 'en_US', 'us', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `language_meta`
--

CREATE TABLE `language_meta` (
  `lang_meta_id` bigint(20) UNSIGNED NOT NULL,
  `lang_meta_code` text DEFAULT NULL,
  `lang_meta_origin` varchar(255) NOT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `reference_type` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media_files`
--

CREATE TABLE `media_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `alt` varchar(191) DEFAULT NULL,
  `folder_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `mime_type` varchar(120) NOT NULL,
  `size` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `options` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_files`
--

INSERT INTO `media_files` (`id`, `user_id`, `name`, `alt`, `folder_id`, `mime_type`, `size`, `url`, `options`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, '1', '1', 1, 'image/jpeg', 2165, 'news/1.jpg', '[]', '2023-07-10 00:34:49', '2023-07-10 00:34:49', NULL),
(2, 0, '10', '10', 1, 'image/jpeg', 2165, 'news/10.jpg', '[]', '2023-07-10 00:34:49', '2023-07-10 00:34:49', NULL),
(3, 0, '11', '11', 1, 'image/jpeg', 2165, 'news/11.jpg', '[]', '2023-07-10 00:34:50', '2023-07-10 00:34:50', NULL),
(4, 0, '12', '12', 1, 'image/jpeg', 2165, 'news/12.jpg', '[]', '2023-07-10 00:34:50', '2023-07-10 00:34:50', NULL),
(5, 0, '13', '13', 1, 'image/jpeg', 2165, 'news/13.jpg', '[]', '2023-07-10 00:34:50', '2023-07-10 00:34:50', NULL),
(6, 0, '14', '14', 1, 'image/jpeg', 2165, 'news/14.jpg', '[]', '2023-07-10 00:34:50', '2023-07-10 00:34:50', NULL),
(7, 0, '15', '15', 1, 'image/jpeg', 2165, 'news/15.jpg', '[]', '2023-07-10 00:34:50', '2023-07-10 00:34:50', NULL),
(8, 0, '16', '16', 1, 'image/jpeg', 2165, 'news/16.jpg', '[]', '2023-07-10 00:34:50', '2023-07-10 00:34:50', NULL),
(9, 0, '2', '2', 1, 'image/jpeg', 2165, 'news/2.jpg', '[]', '2023-07-10 00:34:50', '2023-07-10 00:34:50', NULL),
(10, 0, '3', '3', 1, 'image/jpeg', 2165, 'news/3.jpg', '[]', '2023-07-10 00:34:50', '2023-07-10 00:34:50', NULL),
(11, 0, '4', '4', 1, 'image/jpeg', 2165, 'news/4.jpg', '[]', '2023-07-10 00:34:50', '2023-07-10 00:34:50', NULL),
(12, 0, '5', '5', 1, 'image/jpeg', 2165, 'news/5.jpg', '[]', '2023-07-10 00:34:50', '2023-07-10 00:34:50', NULL),
(13, 0, '6', '6', 1, 'image/jpeg', 2165, 'news/6.jpg', '[]', '2023-07-10 00:34:50', '2023-07-10 00:34:50', NULL),
(14, 0, '7', '7', 1, 'image/jpeg', 2165, 'news/7.jpg', '[]', '2023-07-10 00:34:50', '2023-07-10 00:34:50', NULL),
(15, 0, '8', '8', 1, 'image/jpeg', 2165, 'news/8.jpg', '[]', '2023-07-10 00:34:50', '2023-07-10 00:34:50', NULL),
(16, 0, '9', '9', 1, 'image/jpeg', 2165, 'news/9.jpg', '[]', '2023-07-10 00:34:50', '2023-07-10 00:34:50', NULL),
(17, 0, '404', '404', 2, 'image/png', 2960, 'general/404.png', '[]', '2023-07-10 00:34:51', '2023-07-10 00:34:51', NULL),
(18, 0, 'animat-rocket-color', 'animat-rocket-color', 2, 'image/gif', 76878, 'general/animat-rocket-color.gif', '[]', '2023-07-10 00:34:51', '2023-07-10 00:34:51', NULL),
(19, 0, 'contact', 'contact', 2, 'image/png', 3145, 'general/contact.png', '[]', '2023-07-10 00:34:51', '2023-07-10 00:34:51', NULL),
(20, 0, 'cover-image', 'cover-image', 2, 'image/jpeg', 2908, 'general/cover-image.jpg', '[]', '2023-07-10 00:34:51', '2023-07-10 00:34:51', NULL),
(21, 0, 'favicon', 'favicon', 2, 'image/png', 3416, 'general/favicon.png', '[]', '2023-07-10 00:34:51', '2023-07-10 00:34:51', NULL),
(22, 0, 'how-it-work-1', 'how-it-work-1', 2, 'image/png', 2614, 'general/how-it-work-1.png', '[]', '2023-07-10 00:34:51', '2023-07-10 00:34:51', NULL),
(23, 0, 'how-it-work-2', 'how-it-work-2', 2, 'image/png', 2614, 'general/how-it-work-2.png', '[]', '2023-07-10 00:34:51', '2023-07-10 00:34:51', NULL),
(24, 0, 'how-it-work-3', 'how-it-work-3', 2, 'image/png', 2614, 'general/how-it-work-3.png', '[]', '2023-07-10 00:34:51', '2023-07-10 00:34:51', NULL),
(25, 0, 'img-01', 'img-01', 2, 'image/png', 8141, 'general/img-01.png', '[]', '2023-07-10 00:34:51', '2023-07-10 00:34:51', NULL),
(26, 0, 'img-02', 'img-02', 2, 'image/jpeg', 19080, 'general/img-02.jpg', '[]', '2023-07-10 00:34:51', '2023-07-10 00:34:51', NULL),
(27, 0, 'img-03', 'img-03', 2, 'image/jpeg', 17831, 'general/img-03.jpg', '[]', '2023-07-10 00:34:51', '2023-07-10 00:34:51', NULL),
(28, 0, 'img-04', 'img-04', 2, 'image/jpeg', 17898, 'general/img-04.jpg', '[]', '2023-07-10 00:34:51', '2023-07-10 00:34:51', NULL),
(29, 0, 'logo-light', 'logo-light', 2, 'image/png', 3762, 'general/logo-light.png', '[]', '2023-07-10 00:34:51', '2023-07-10 00:34:51', NULL),
(30, 0, 'logo', 'logo', 2, 'image/png', 3826, 'general/logo.png', '[]', '2023-07-10 00:34:51', '2023-07-10 00:34:51', NULL),
(31, 0, 'newsletter-image', 'newsletter-image', 2, 'image/png', 1741, 'general/newsletter-image.png', '[]', '2023-07-10 00:34:51', '2023-07-10 00:34:51', NULL),
(32, 0, 'process-02', 'process-02', 2, 'image/png', 2614, 'general/process-02.png', '[]', '2023-07-10 00:34:51', '2023-07-10 00:34:51', NULL),
(33, 0, '1', '1', 3, 'image/png', 2165, 'job-categories/1.png', '[]', '2023-07-10 00:34:54', '2023-07-10 00:34:54', NULL),
(34, 0, '2', '2', 3, 'image/png', 2165, 'job-categories/2.png', '[]', '2023-07-10 00:34:54', '2023-07-10 00:34:54', NULL),
(35, 0, '3', '3', 3, 'image/png', 2165, 'job-categories/3.png', '[]', '2023-07-10 00:34:54', '2023-07-10 00:34:54', NULL),
(36, 0, '4', '4', 3, 'image/png', 2165, 'job-categories/4.png', '[]', '2023-07-10 00:34:54', '2023-07-10 00:34:54', NULL),
(37, 0, '5', '5', 3, 'image/png', 2165, 'job-categories/5.png', '[]', '2023-07-10 00:34:54', '2023-07-10 00:34:54', NULL),
(38, 0, '6', '6', 3, 'image/png', 2165, 'job-categories/6.png', '[]', '2023-07-10 00:34:54', '2023-07-10 00:34:54', NULL),
(39, 0, '7', '7', 3, 'image/png', 2165, 'job-categories/7.png', '[]', '2023-07-10 00:34:54', '2023-07-10 00:34:54', NULL),
(40, 0, '8', '8', 3, 'image/png', 2165, 'job-categories/8.png', '[]', '2023-07-10 00:34:54', '2023-07-10 00:34:54', NULL),
(41, 0, '1', '1', 4, 'image/png', 183, 'companies/1.png', '[]', '2023-07-10 00:34:54', '2023-07-10 00:34:54', NULL),
(42, 0, '10', '10', 4, 'image/png', 183, 'companies/10.png', '[]', '2023-07-10 00:34:54', '2023-07-10 00:34:54', NULL),
(43, 0, '11', '11', 4, 'image/png', 183, 'companies/11.png', '[]', '2023-07-10 00:34:54', '2023-07-10 00:34:54', NULL),
(44, 0, '12', '12', 4, 'image/png', 183, 'companies/12.png', '[]', '2023-07-10 00:34:54', '2023-07-10 00:34:54', NULL),
(45, 0, '13', '13', 4, 'image/png', 183, 'companies/13.png', '[]', '2023-07-10 00:34:54', '2023-07-10 00:34:54', NULL),
(46, 0, '14', '14', 4, 'image/png', 183, 'companies/14.png', '[]', '2023-07-10 00:34:54', '2023-07-10 00:34:54', NULL),
(47, 0, '15', '15', 4, 'image/png', 183, 'companies/15.png', '[]', '2023-07-10 00:34:54', '2023-07-10 00:34:54', NULL),
(48, 0, '16', '16', 4, 'image/png', 183, 'companies/16.png', '[]', '2023-07-10 00:34:54', '2023-07-10 00:34:54', NULL),
(49, 0, '17', '17', 4, 'image/png', 183, 'companies/17.png', '[]', '2023-07-10 00:34:54', '2023-07-10 00:34:54', NULL),
(50, 0, '2', '2', 4, 'image/png', 183, 'companies/2.png', '[]', '2023-07-10 00:34:54', '2023-07-10 00:34:54', NULL),
(51, 0, '3', '3', 4, 'image/png', 183, 'companies/3.png', '[]', '2023-07-10 00:34:54', '2023-07-10 00:34:54', NULL),
(52, 0, '4', '4', 4, 'image/png', 183, 'companies/4.png', '[]', '2023-07-10 00:34:54', '2023-07-10 00:34:54', NULL),
(53, 0, '5', '5', 4, 'image/png', 183, 'companies/5.png', '[]', '2023-07-10 00:34:55', '2023-07-10 00:34:55', NULL),
(54, 0, '6', '6', 4, 'image/png', 183, 'companies/6.png', '[]', '2023-07-10 00:34:55', '2023-07-10 00:34:55', NULL),
(55, 0, '7', '7', 4, 'image/png', 183, 'companies/7.png', '[]', '2023-07-10 00:34:55', '2023-07-10 00:34:55', NULL),
(56, 0, '8', '8', 4, 'image/png', 183, 'companies/8.png', '[]', '2023-07-10 00:34:55', '2023-07-10 00:34:55', NULL),
(57, 0, '9', '9', 4, 'image/png', 183, 'companies/9.png', '[]', '2023-07-10 00:34:55', '2023-07-10 00:34:55', NULL),
(58, 0, '01', '01', 5, 'application/pdf', 43496, 'resume/01.pdf', '[]', '2023-07-10 00:34:56', '2023-07-10 00:34:56', NULL),
(59, 0, '1', '1', 6, 'image/jpeg', 2165, 'accounts/1.jpg', '[]', '2023-07-10 00:34:56', '2023-07-10 00:34:56', NULL),
(60, 0, '2', '2', 6, 'image/jpeg', 2165, 'accounts/2.jpg', '[]', '2023-07-10 00:34:56', '2023-07-10 00:34:56', NULL),
(61, 0, '3', '3', 6, 'image/jpeg', 2165, 'accounts/3.jpg', '[]', '2023-07-10 00:34:56', '2023-07-10 00:34:56', NULL),
(62, 0, '4', '4', 6, 'image/jpeg', 2165, 'accounts/4.jpg', '[]', '2023-07-10 00:34:56', '2023-07-10 00:34:56', NULL),
(63, 0, '5', '5', 6, 'image/jpeg', 2165, 'accounts/5.jpg', '[]', '2023-07-10 00:34:56', '2023-07-10 00:34:56', NULL),
(64, 0, 'cover1', 'cover1', 6, 'image/png', 2165, 'accounts/cover1.png', '[]', '2023-07-10 00:34:56', '2023-07-10 00:34:56', NULL),
(65, 0, 'cover2', 'cover2', 6, 'image/png', 2165, 'accounts/cover2.png', '[]', '2023-07-10 00:34:56', '2023-07-10 00:34:56', NULL),
(66, 0, 'cover3', 'cover3', 6, 'image/png', 2165, 'accounts/cover3.png', '[]', '2023-07-10 00:34:56', '2023-07-10 00:34:56', NULL),
(67, 0, '1', '1', 7, 'image/png', 2165, 'testimonials/1.png', '[]', '2023-07-10 00:35:03', '2023-07-10 00:35:03', NULL),
(68, 0, '2', '2', 7, 'image/png', 2165, 'testimonials/2.png', '[]', '2023-07-10 00:35:03', '2023-07-10 00:35:03', NULL),
(69, 0, '3', '3', 7, 'image/png', 2165, 'testimonials/3.png', '[]', '2023-07-10 00:35:03', '2023-07-10 00:35:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_folders`
--

CREATE TABLE `media_folders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_folders`
--

INSERT INTO `media_folders` (`id`, `user_id`, `name`, `slug`, `parent_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 'news', 'news', 0, '2023-07-10 00:34:49', '2023-07-10 00:34:49', NULL),
(2, 0, 'general', 'general', 0, '2023-07-10 00:34:51', '2023-07-10 00:34:51', NULL),
(3, 0, 'job-categories', 'job-categories', 0, '2023-07-10 00:34:54', '2023-07-10 00:34:54', NULL),
(4, 0, 'companies', 'companies', 0, '2023-07-10 00:34:54', '2023-07-10 00:34:54', NULL),
(5, 0, 'resume', 'resume', 0, '2023-07-10 00:34:56', '2023-07-10 00:34:56', NULL),
(6, 0, 'accounts', 'accounts', 0, '2023-07-10 00:34:56', '2023-07-10 00:34:56', NULL),
(7, 0, 'testimonials', 'testimonials', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_settings`
--

CREATE TABLE `media_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(120) NOT NULL,
  `value` text DEFAULT NULL,
  `media_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `slug` varchar(120) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Main menu', 'main-menu', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(2, 'Company', 'company', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(3, 'For Jobs', 'for-jobs', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(4, 'For Candidates', 'for-candidates', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(5, 'Support', 'support', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03');

-- --------------------------------------------------------

--
-- Table structure for table `menu_locations`
--

CREATE TABLE `menu_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `location` varchar(120) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_locations`
--

INSERT INTO `menu_locations` (`id`, `menu_id`, `location`, `created_at`, `updated_at`) VALUES
(1, 1, 'main-menu', '2023-07-10 00:35:03', '2023-07-10 00:35:03');

-- --------------------------------------------------------

--
-- Table structure for table `menu_nodes`
--

CREATE TABLE `menu_nodes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `reference_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reference_type` varchar(255) DEFAULT NULL,
  `url` varchar(120) DEFAULT NULL,
  `icon_font` varchar(50) DEFAULT NULL,
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(120) DEFAULT NULL,
  `css_class` varchar(120) DEFAULT NULL,
  `target` varchar(20) NOT NULL DEFAULT '_self',
  `has_child` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_nodes`
--

INSERT INTO `menu_nodes` (`id`, `menu_id`, `parent_id`, `reference_id`, `reference_type`, `url`, `icon_font`, `position`, `title`, `css_class`, `target`, `has_child`, `created_at`, `updated_at`) VALUES
(1, 1, 0, NULL, NULL, '/', NULL, 0, 'Home', NULL, '_self', 1, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(2, 1, 1, NULL, NULL, '/', NULL, 0, 'Homepage', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(3, 1, 1, 13, 'Botble\\Page\\Models\\Page', '/homepage-2', NULL, 0, 'Homepage 2', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(4, 1, 1, 14, 'Botble\\Page\\Models\\Page', '/homepage-3', NULL, 0, 'Homepage 3', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(5, 1, 0, NULL, NULL, '/jobs', NULL, 0, 'Jobs', NULL, '_self', 1, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(6, 1, 5, NULL, NULL, '/jobs', NULL, 0, 'Jobs', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(7, 1, 5, NULL, NULL, '/jobs/ui-ux-designer-full-time', NULL, 0, 'Job Detail', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(8, 1, 5, NULL, NULL, '/jobs/full-stack-engineer', NULL, 0, 'Job External', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(9, 1, 5, NULL, NULL, '/jobs/java-software-engineer', NULL, 0, 'Job Hide Company', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(10, 1, 0, 10, 'Botble\\Page\\Models\\Page', '/job-categories', NULL, 0, 'Categories', NULL, '_self', 1, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(11, 1, 10, 10, 'Botble\\Page\\Models\\Page', '/job-categories', NULL, 0, 'Categories', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(12, 1, 10, 1, 'Botble\\JobBoard\\Models\\Category', '/job-categories/it-software', NULL, 0, 'Category Detail', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(13, 1, 0, NULL, NULL, '#', NULL, 0, 'Pages', NULL, '_self', 1, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(14, 1, 13, 11, 'Botble\\Page\\Models\\Page', '/companies', NULL, 0, 'Companies', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(15, 1, 13, NULL, NULL, '/companies/pinterest', NULL, 0, 'Company Detail', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(16, 1, 13, 15, 'Botble\\Page\\Models\\Page', '/candidates', NULL, 0, 'Candidates Grid', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(17, 1, 13, 16, 'Botble\\Page\\Models\\Page', '/candidates-list', NULL, 0, 'Candidates List', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(18, 1, 13, NULL, NULL, '/candidates/karelle-hirthe', NULL, 0, 'Candidates Details', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(19, 1, 13, 8, 'Botble\\Page\\Models\\Page', '/terms-of-use', NULL, 0, 'Terms Of Use', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(20, 1, 13, 9, 'Botble\\Page\\Models\\Page', '/terms-conditions', NULL, 0, 'Terms & Conditions', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(21, 1, 13, 5, 'Botble\\Page\\Models\\Page', '/faq', NULL, 0, 'FAQ', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(22, 1, 13, 4, 'Botble\\Page\\Models\\Page', '/cookie-policy', NULL, 0, 'Cookie Policy', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(23, 1, 13, 12, 'Botble\\Page\\Models\\Page', '/coming-soon', NULL, 0, 'Coming Soon', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(24, 1, 0, 2, 'Botble\\Page\\Models\\Page', '/blog', NULL, 0, 'Blog', NULL, '_self', 1, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(25, 1, 24, 2, 'Botble\\Page\\Models\\Page', '/blog', NULL, 0, 'Blog', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(26, 1, 24, NULL, NULL, '/blog/the-top-2020-handbag-trends-to-know', NULL, 0, 'Post Detail', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(27, 1, 0, 3, 'Botble\\Page\\Models\\Page', '/contact', NULL, 0, 'Contact', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(28, 2, 0, 6, 'Botble\\Page\\Models\\Page', '/about-us', NULL, 0, 'About Us', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(29, 2, 0, 3, 'Botble\\Page\\Models\\Page', '/contact', NULL, 0, 'Contact Us', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(30, 2, 0, 7, 'Botble\\Page\\Models\\Page', '/services', NULL, 0, 'Services', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(31, 2, 0, 2, 'Botble\\Page\\Models\\Page', '/blog', NULL, 0, 'Blog', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(32, 3, 0, 10, 'Botble\\Page\\Models\\Page', '/job-categories', NULL, 0, 'Browse Categories', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(33, 3, 0, NULL, NULL, '/jobs', NULL, 0, 'Browse Jobs', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(34, 3, 0, NULL, NULL, '/jobs/ui-ux-designer-full-time', NULL, 0, 'Job Details', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(35, 3, 0, NULL, NULL, '/jobs/saved-jobs', NULL, 0, 'Saved Jobs', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(36, 3, 0, NULL, NULL, '/jobs/full-stack-engineer', NULL, 0, 'Job External', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(37, 3, 0, NULL, NULL, '/jobs/java-software-engineer', NULL, 0, 'Job Hide Company', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(38, 4, 0, 15, 'Botble\\Page\\Models\\Page', '/candidates', NULL, 0, 'Candidates List', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(39, 4, 0, 16, 'Botble\\Page\\Models\\Page', '/candidates-list', NULL, 0, 'Candidates Grid', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(40, 4, 0, NULL, NULL, '/candidates/karelle-hirthe', NULL, 0, 'Candidates Details', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(41, 5, 0, 8, 'Botble\\Page\\Models\\Page', '/terms-of-use', NULL, 0, 'Terms Of Use', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(42, 5, 0, 9, 'Botble\\Page\\Models\\Page', '/terms-conditions', NULL, 0, 'Terms & Conditions', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(43, 5, 0, 5, 'Botble\\Page\\Models\\Page', '/faq', NULL, 0, 'FAQ', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(44, 5, 0, 4, 'Botble\\Page\\Models\\Page', '/cookie-policy', NULL, 0, 'Cookie Policy', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(45, 5, 0, 12, 'Botble\\Page\\Models\\Page', '/coming-soon', NULL, 0, 'Coming Soon', NULL, '_self', 0, '2023-07-10 00:35:03', '2023-07-10 00:35:03');

-- --------------------------------------------------------

--
-- Table structure for table `meta_boxes`
--

CREATE TABLE `meta_boxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) NOT NULL,
  `meta_value` text DEFAULT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `reference_type` varchar(120) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meta_boxes`
--

INSERT INTO `meta_boxes` (`id`, `meta_key`, `meta_value`, `reference_id`, `reference_type`, `created_at`, `updated_at`) VALUES
(1, 'icon_image', '[\"job-categories\\/1.png\"]', 1, 'Botble\\JobBoard\\Models\\Category', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(2, 'icon_image', '[\"job-categories\\/2.png\"]', 2, 'Botble\\JobBoard\\Models\\Category', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(3, 'icon_image', '[\"job-categories\\/3.png\"]', 3, 'Botble\\JobBoard\\Models\\Category', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(4, 'icon_image', '[\"job-categories\\/4.png\"]', 4, 'Botble\\JobBoard\\Models\\Category', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(5, 'icon_image', '[\"job-categories\\/5.png\"]', 5, 'Botble\\JobBoard\\Models\\Category', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(6, 'icon_image', '[\"job-categories\\/6.png\"]', 6, 'Botble\\JobBoard\\Models\\Category', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(7, 'icon_image', '[\"job-categories\\/7.png\"]', 7, 'Botble\\JobBoard\\Models\\Category', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(8, 'icon_image', '[\"job-categories\\/8.png\"]', 8, 'Botble\\JobBoard\\Models\\Category', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(9, 'cover_image', '[\"accounts\\/cover1.png\"]', 1, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:56', '2023-07-10 00:34:56'),
(10, 'cover_image', '[\"accounts\\/cover1.png\"]', 2, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:56', '2023-07-10 00:34:56'),
(11, 'cover_image', '[\"accounts\\/cover1.png\"]', 3, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:56', '2023-07-10 00:34:56'),
(12, 'cover_image', '[\"accounts\\/cover1.png\"]', 4, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(13, 'cover_image', '[\"accounts\\/cover3.png\"]', 5, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(14, 'cover_image', '[\"accounts\\/cover2.png\"]', 6, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(15, 'cover_image', '[\"accounts\\/cover1.png\"]', 7, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(16, 'cover_image', '[\"accounts\\/cover2.png\"]', 8, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(17, 'cover_image', '[\"accounts\\/cover3.png\"]', 9, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(18, 'cover_image', '[\"accounts\\/cover2.png\"]', 10, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(19, 'cover_image', '[\"accounts\\/cover2.png\"]', 11, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(20, 'cover_image', '[\"accounts\\/cover3.png\"]', 12, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(21, 'cover_image', '[\"accounts\\/cover2.png\"]', 13, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(22, 'cover_image', '[\"accounts\\/cover1.png\"]', 14, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(23, 'cover_image', '[\"accounts\\/cover2.png\"]', 15, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(24, 'cover_image', '[\"accounts\\/cover2.png\"]', 16, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(25, 'cover_image', '[\"accounts\\/cover2.png\"]', 17, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(26, 'cover_image', '[\"accounts\\/cover3.png\"]', 18, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(27, 'cover_image', '[\"accounts\\/cover3.png\"]', 19, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(28, 'cover_image', '[\"accounts\\/cover1.png\"]', 20, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(29, 'cover_image', '[\"accounts\\/cover2.png\"]', 21, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(30, 'cover_image', '[\"accounts\\/cover3.png\"]', 22, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(31, 'cover_image', '[\"accounts\\/cover1.png\"]', 23, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(32, 'cover_image', '[\"accounts\\/cover1.png\"]', 24, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(33, 'cover_image', '[\"accounts\\/cover1.png\"]', 25, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(34, 'cover_image', '[\"accounts\\/cover3.png\"]', 26, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(35, 'cover_image', '[\"accounts\\/cover3.png\"]', 27, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(36, 'cover_image', '[\"accounts\\/cover1.png\"]', 28, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(37, 'cover_image', '[\"accounts\\/cover2.png\"]', 29, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(38, 'cover_image', '[\"accounts\\/cover3.png\"]', 30, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(39, 'cover_image', '[\"accounts\\/cover2.png\"]', 31, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(40, 'cover_image', '[\"accounts\\/cover2.png\"]', 32, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(41, 'cover_image', '[\"accounts\\/cover1.png\"]', 33, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(42, 'cover_image', '[\"accounts\\/cover1.png\"]', 34, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(43, 'cover_image', '[\"accounts\\/cover3.png\"]', 35, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(44, 'cover_image', '[\"accounts\\/cover2.png\"]', 36, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(45, 'cover_image', '[\"accounts\\/cover2.png\"]', 37, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(46, 'cover_image', '[\"accounts\\/cover1.png\"]', 38, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(47, 'cover_image', '[\"accounts\\/cover3.png\"]', 39, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(48, 'cover_image', '[\"accounts\\/cover3.png\"]', 40, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(49, 'cover_image', '[\"accounts\\/cover1.png\"]', 41, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(50, 'cover_image', '[\"accounts\\/cover2.png\"]', 42, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(51, 'cover_image', '[\"accounts\\/cover3.png\"]', 43, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(52, 'cover_image', '[\"accounts\\/cover2.png\"]', 44, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(53, 'cover_image', '[\"accounts\\/cover3.png\"]', 45, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(54, 'cover_image', '[\"accounts\\/cover3.png\"]', 46, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(55, 'cover_image', '[\"accounts\\/cover3.png\"]', 47, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(56, 'cover_image', '[\"accounts\\/cover2.png\"]', 48, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(57, 'cover_image', '[\"accounts\\/cover2.png\"]', 49, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(58, 'cover_image', '[\"accounts\\/cover2.png\"]', 50, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(59, 'cover_image', '[\"accounts\\/cover2.png\"]', 51, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(60, 'cover_image', '[\"accounts\\/cover3.png\"]', 52, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(61, 'cover_image', '[\"accounts\\/cover1.png\"]', 53, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(62, 'cover_image', '[\"accounts\\/cover1.png\"]', 54, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(63, 'cover_image', '[\"accounts\\/cover3.png\"]', 55, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(64, 'cover_image', '[\"accounts\\/cover3.png\"]', 56, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(65, 'cover_image', '[\"accounts\\/cover1.png\"]', 57, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(66, 'cover_image', '[\"accounts\\/cover1.png\"]', 58, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(67, 'cover_image', '[\"accounts\\/cover1.png\"]', 59, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(68, 'cover_image', '[\"accounts\\/cover3.png\"]', 60, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(69, 'cover_image', '[\"accounts\\/cover1.png\"]', 61, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(70, 'cover_image', '[\"accounts\\/cover3.png\"]', 62, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(71, 'cover_image', '[\"accounts\\/cover1.png\"]', 63, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(72, 'cover_image', '[\"accounts\\/cover2.png\"]', 64, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(73, 'cover_image', '[\"accounts\\/cover1.png\"]', 65, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(74, 'cover_image', '[\"accounts\\/cover1.png\"]', 66, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(75, 'cover_image', '[\"accounts\\/cover3.png\"]', 67, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(76, 'cover_image', '[\"accounts\\/cover3.png\"]', 68, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(77, 'cover_image', '[\"accounts\\/cover1.png\"]', 69, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(78, 'cover_image', '[\"accounts\\/cover1.png\"]', 70, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(79, 'cover_image', '[\"accounts\\/cover1.png\"]', 71, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(80, 'cover_image', '[\"accounts\\/cover2.png\"]', 72, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(81, 'cover_image', '[\"accounts\\/cover1.png\"]', 73, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(82, 'cover_image', '[\"accounts\\/cover2.png\"]', 74, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(83, 'cover_image', '[\"accounts\\/cover3.png\"]', 75, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(84, 'cover_image', '[\"accounts\\/cover2.png\"]', 76, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(85, 'cover_image', '[\"accounts\\/cover3.png\"]', 77, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(86, 'cover_image', '[\"accounts\\/cover3.png\"]', 78, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(87, 'cover_image', '[\"accounts\\/cover1.png\"]', 79, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(88, 'cover_image', '[\"accounts\\/cover3.png\"]', 80, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(89, 'cover_image', '[\"accounts\\/cover2.png\"]', 81, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(90, 'cover_image', '[\"accounts\\/cover2.png\"]', 82, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(91, 'cover_image', '[\"accounts\\/cover1.png\"]', 83, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(92, 'cover_image', '[\"accounts\\/cover2.png\"]', 84, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(93, 'cover_image', '[\"accounts\\/cover3.png\"]', 85, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(94, 'cover_image', '[\"accounts\\/cover2.png\"]', 86, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(95, 'cover_image', '[\"accounts\\/cover1.png\"]', 87, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(96, 'cover_image', '[\"accounts\\/cover1.png\"]', 88, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(97, 'cover_image', '[\"accounts\\/cover1.png\"]', 89, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(98, 'cover_image', '[\"accounts\\/cover3.png\"]', 90, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(99, 'cover_image', '[\"accounts\\/cover2.png\"]', 91, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(100, 'cover_image', '[\"accounts\\/cover3.png\"]', 92, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(101, 'cover_image', '[\"accounts\\/cover3.png\"]', 93, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(102, 'cover_image', '[\"accounts\\/cover2.png\"]', 94, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(103, 'cover_image', '[\"accounts\\/cover1.png\"]', 95, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(104, 'cover_image', '[\"accounts\\/cover1.png\"]', 96, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(105, 'cover_image', '[\"accounts\\/cover1.png\"]', 97, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(106, 'cover_image', '[\"accounts\\/cover2.png\"]', 98, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(107, 'cover_image', '[\"accounts\\/cover2.png\"]', 99, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(108, 'cover_image', '[\"accounts\\/cover1.png\"]', 100, 'Botble\\JobBoard\\Models\\Account', '2023-07-10 00:35:03', '2023-07-10 00:35:03');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_04_09_032329_create_base_tables', 1),
(2, '2013_04_09_062329_create_revisions_table', 1),
(3, '2014_10_12_000000_create_users_table', 1),
(4, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(5, '2016_06_10_230148_create_acl_tables', 1),
(6, '2016_06_14_230857_create_menus_table', 1),
(7, '2016_06_28_221418_create_pages_table', 1),
(8, '2016_10_05_074239_create_setting_table', 1),
(9, '2016_11_28_032840_create_dashboard_widget_tables', 1),
(10, '2016_12_16_084601_create_widgets_table', 1),
(11, '2017_05_09_070343_create_media_tables', 1),
(12, '2017_11_03_070450_create_slug_table', 1),
(13, '2019_01_05_053554_create_jobs_table', 1),
(14, '2019_08_19_000000_create_failed_jobs_table', 1),
(15, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(16, '2022_04_20_100851_add_index_to_media_table', 1),
(17, '2022_04_20_101046_add_index_to_menu_table', 1),
(18, '2022_07_10_034813_move_lang_folder_to_root', 1),
(19, '2022_08_04_051940_add_missing_column_expires_at', 1),
(20, '2022_09_01_000001_create_admin_notifications_tables', 1),
(21, '2022_10_14_024629_drop_column_is_featured', 1),
(22, '2022_11_18_063357_add_missing_timestamp_in_table_settings', 1),
(23, '2022_12_02_093615_update_slug_index_columns', 1),
(24, '2023_01_30_024431_add_alt_to_media_table', 1),
(25, '2023_02_16_042611_drop_table_password_resets', 1),
(26, '2023_04_23_005903_add_column_permissions_to_admin_notifications', 1),
(27, '2023_05_10_075124_drop_column_id_in_role_users_table', 1),
(28, '2015_06_29_025744_create_audit_history', 2),
(29, '2015_06_18_033822_create_blog_table', 3),
(30, '2021_02_16_092633_remove_default_value_for_author_type', 3),
(31, '2021_12_03_030600_create_blog_translations', 3),
(32, '2022_04_19_113923_add_index_to_table_posts', 3),
(33, '2016_06_17_091537_create_contacts_table', 4),
(34, '2018_07_09_221238_create_faq_table', 5),
(35, '2021_12_03_082134_create_faq_translations', 5),
(36, '2022_06_20_093259_create_job_board_tables', 6),
(37, '2022_09_12_061845_update_table_activity_logs', 6),
(38, '2022_09_13_042407_create_table_jb_jobs_types', 6),
(39, '2022_09_15_030017_update_jb_jobs_table', 6),
(40, '2022_09_15_094840_add_job_employer_colleagues', 6),
(41, '2022_09_27_000001_create_jb_invoices_tables', 6),
(42, '2022_09_30_144924_update_jobs_table', 6),
(43, '2022_10_04_085631_add_company_logo_to_jb_invoices', 6),
(44, '2022_10_10_030606_create_reviews_table', 6),
(45, '2022_11_09_065056_add_missing_jobs_page', 6),
(46, '2022_11_10_065056_add_columns_to_accounts', 6),
(47, '2022_11_16_034756_add_column_cover_letter_to_accounts', 6),
(48, '2022_11_29_304756_create_jb_account_favorite_skills_table', 6),
(49, '2022_11_29_304757_create_jb_account_favorite_tags', 6),
(50, '2022_12_26_304758_create_table_jb_experiences', 6),
(51, '2022_12_26_304759_create_table_jb_education', 6),
(52, '2023_01_31_023233_create_jb_custom_fields_table', 6),
(53, '2023_02_06_024257_add_package_translations', 6),
(54, '2023_02_08_062457_add_custom_fields_translation_table', 6),
(55, '2023_04_03_126927_add_parent_id_to_jb_categories_table', 6),
(56, '2023_05_04_000001_add_hide_cv_to_jb_accounts_table', 6),
(57, '2023_05_09_062031_unique_reviews_table', 6),
(58, '2023_05_13_180010_make_jb_reviews_table_morphable', 6),
(59, '2023_05_16_113126_fix_account_confirmed_at', 6),
(60, '2023_07_03_135746_add_zip_code_to_jb_jobs_table', 6),
(61, '2016_10_03_032336_create_languages_table', 7),
(62, '2021_10_25_021023_fix-priority-load-for-language-advanced', 8),
(63, '2021_12_03_075608_create_page_translations', 8),
(64, '2023_07_06_011444_create_slug_translations_table', 8),
(65, '2019_11_18_061011_create_country_table', 9),
(66, '2021_12_03_084118_create_location_translations', 9),
(67, '2021_12_03_094518_migrate_old_location_data', 9),
(68, '2021_12_10_034440_switch_plugin_location_to_use_language_advanced', 9),
(69, '2022_01_16_085908_improve_plugin_location', 9),
(70, '2022_08_04_052122_delete_location_backup_tables', 9),
(71, '2023_04_23_061847_increase_state_translations_abbreviation_column', 9),
(72, '2017_10_24_154832_create_newsletter_table', 10),
(73, '2017_05_18_080441_create_payment_tables', 11),
(74, '2021_03_27_144913_add_customer_type_into_table_payments', 11),
(75, '2021_05_24_034720_make_column_currency_nullable', 11),
(76, '2021_08_09_161302_add_metadata_column_to_payments_table', 11),
(77, '2021_10_19_020859_update_metadata_field', 11),
(78, '2022_06_28_151901_activate_paypal_stripe_plugin', 11),
(79, '2022_07_07_153354_update_charge_id_in_table_payments', 11),
(80, '2018_07_09_214610_create_testimonial_table', 12),
(81, '2021_12_03_083642_create_testimonials_translations', 12),
(82, '2016_10_07_193005_create_translations_table', 13);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(120) NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `content` longtext DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `template` varchar(60) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages_translations`
--

CREATE TABLE `pages_translations` (
  `lang_code` varchar(191) NOT NULL,
  `pages_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `content` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency` varchar(120) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `charge_id` varchar(255) DEFAULT NULL,
  `payment_channel` varchar(60) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `amount` decimal(15,2) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(60) DEFAULT 'pending',
  `payment_type` varchar(191) DEFAULT 'confirm',
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `refunded_amount` decimal(15,2) UNSIGNED DEFAULT NULL,
  `refund_note` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_type` varchar(255) DEFAULT NULL,
  `metadata` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `author_type` varchar(255) NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `format_type` varchar(30) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `name`, `description`, `content`, `status`, `author_id`, `author_type`, `is_featured`, `image`, `views`, `format_type`, `created_at`, `updated_at`) VALUES
(1, 'The Top 2020 Handbag Trends to Know', 'Perferendis velit nesciunt aut aspernatur cum voluptatibus. Qui et est deleniti non incidunt. Maxime et dignissimos error fuga vel nam. Est dignissimos et dolor assumenda et cupiditate. Debitis nobis placeat magni vitae.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>OUTSIDE.\' He unfolded the paper as he shook both his shoes off. \'Give your evidence,\' said the one who had not attended to this last remark that had made out that part.\' \'Well, at any rate, there\'s no room to grow larger again, and the pool a little worried. \'Just about as it was a sound of a large caterpillar, that was said, and went back for a long time with the birds hurried off to trouble myself about you: you must manage the best of educations--in fact, we went to school every day--\' \'I\'VE been to the jury. They were just beginning to grow larger again, and all must have prizes.\' \'But who is to find her way out. \'I shall sit here,\' he said, turning to Alice as he spoke, and then she noticed that the best way you go,\' said the King: \'leave out that she hardly knew what she was quite surprised to find that she tipped over the fire, licking her paws and washing her face--and she is such a thing as \"I get what I see\"!\' \'You might just as well say,\' added the Dormouse. \'Fourteenth of.</p><p class=\"text-center\"><img src=\"/storage/news/2-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>And here Alice began to repeat it, but her head on her toes when they passed too close, and waving their forepaws to mark the time, while the Mock Turtle repeated thoughtfully. \'I should have liked teaching it tricks very much, if--if I\'d only been the right size for ten minutes together!\' \'Can\'t remember WHAT things?\' said the Caterpillar. \'Well, perhaps you were INSIDE, you might like to be sure, this generally happens when you throw them, and it\'ll sit up and picking the daisies, when.</p><p class=\"text-center\"><img src=\"/storage/news/8-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Fish-Footman was gone, and, by the time at the Cat\'s head with great curiosity, and this was her dream:-- First, she tried her best to climb up one of them with large round eyes, and half of anger, and tried to speak, and no room at all this time, and was looking down with wonder at the Hatter, \'when the Queen said--\' \'Get to your places!\' shouted the Queen, and Alice was rather glad there WAS no one could possibly hear you.\' And certainly there was room for YOU, and no room to grow up any more questions about it, even if I fell off the subjects on his spectacles and looked at it uneasily, shaking it every now and then, if I can find out the answer to shillings and pence. \'Take off your hat,\' the King said to the Dormouse, not choosing to notice this question, but hurriedly went on, \'What HAVE you been doing here?\' \'May it please your Majesty,\' said the King: \'leave out that one of the Mock Turtle replied; \'and then the other, trying every door, she found a little before she had.</p><p class=\"text-center\"><img src=\"/storage/news/14-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I must have prizes.\' \'But who is Dinah, if I shall have to whisper a hint to Time, and round the neck of the treat. When the procession came opposite to Alice, and sighing. \'It IS a long time together.\' \'Which is just the case with my wife; And the moral of that is, but I shall be late!\' (when she thought there was Mystery,\' the Mock Turtle to the confused clamour of the Queen in front of the conversation. Alice felt that she was holding, and she felt sure she would get up and down looking for them, but they all crowded round her, about four inches deep and reaching half down the little golden key in the world go round!\"\' \'Somebody said,\' Alice whispered, \'that it\'s done by everybody minding their own business,\' the Duchess to play croquet with the Dormouse. \'Write that down,\' the King said to herself, \'after such a very little use, as it went, \'One side will make you a present of everything I\'ve said as yet.\' \'A cheap sort of thing never happened, and now here I am now? That\'ll be a.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/1.jpg', 1863, NULL, '2023-06-19 09:07:27', '2023-06-19 09:07:27'),
(2, 'Top Search Engine Optimization Strategies!', 'Quam est fugit eaque placeat. In quos asperiores autem aut saepe ratione occaecati incidunt. Repudiandae eos debitis autem eos aut iusto omnis.', '<p>OUTSIDE.\' He unfolded the paper as he spoke, and the pool rippling to the game. CHAPTER IX. The Mock Turtle with a little shriek and a sad tale!\' said the Rabbit just under the hedge. In another minute the whole court was a large rabbit-hole under the circumstances. There was a little scream of laughter. \'Oh, hush!\' the Rabbit just under the sea,\' the Gryphon replied rather crossly: \'of course you don\'t!\' the Hatter added as an explanation. \'Oh, you\'re sure to happen,\' she said to itself \'The Duchess! The Duchess! Oh my dear Dinah! I wonder if I must, I must,\' the King hastily said, and went by without noticing her. Then followed the Knave was standing before them, in chains, with a whiting. Now you know.\' \'Who is it directed to?\' said the Dormouse; \'VERY ill.\' Alice tried to get in at once.\' And in she went. Once more she found her way through the doorway; \'and even if I shall be late!\' (when she thought of herself, \'I don\'t think they play at all anxious to have wondered at this.</p><p class=\"text-center\"><img src=\"/storage/news/5-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>King, rubbing his hands; \'so now let the Dormouse denied nothing, being fast asleep. \'After that,\' continued the Hatter, and here the Mock Turtle. \'Seals, turtles, salmon, and so on.\' \'What a pity it wouldn\'t stay!\' sighed the Lory, as soon as it can\'t possibly make me larger, it must be the right size to do THAT in a large piece out of their hearing her; and when she heard one of the song. \'What trial is it?\' The Gryphon lifted up both its paws in surprise. \'What! Never heard of uglifying!\'.</p><p class=\"text-center\"><img src=\"/storage/news/9-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Who ever saw one that size? Why, it fills the whole she thought it must be Mabel after all, and I don\'t care which happens!\' She ate a little before she made out that it would all come wrong, and she did not quite sure whether it was not a VERY turn-up nose, much more like a telescope! I think that will be When they take us up and say \"Who am I to do anything but sit with its wings. \'Serpent!\' screamed the Gryphon. \'Of course,\' the Dodo suddenly called out \'The Queen! The Queen!\' and the m--\' But here, to Alice\'s great surprise, the Duchess\'s knee, while plates and dishes crashed around it--once more the pig-baby was sneezing on the ground near the entrance of the room again, no wonder she felt a violent shake at the March Hare, who had been all the things between whiles.\' \'Then you should say \"With what porpoise?\"\' \'Don\'t you mean by that?\' said the Mock Turtle replied in a great crash, as if she could not be denied, so she began fancying the sort of meaning in it, and yet it was.</p><p class=\"text-center\"><img src=\"/storage/news/12-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Mock Turtle replied, counting off the mushroom, and raised herself to some tea and bread-and-butter, and then she walked on in a great deal too flustered to tell me who YOU are, first.\' \'Why?\' said the Cat, and vanished again. Alice waited patiently until it chose to speak with. Alice waited till the Pigeon went on, \'What HAVE you been doing here?\' \'May it please your Majesty,\' said the cook. \'Treacle,\' said a whiting to a mouse, you know. Come on!\' \'Everybody says \"come on!\" here,\' thought Alice, \'and those twelve creatures,\' (she was obliged to have finished,\' said the Duchess; \'I never was so ordered about in all directions, tumbling up against each other; however, they got thrown out to sea!\" But the snail replied \"Too far, too far!\" and gave a little hot tea upon its forehead (the position in dancing.\' Alice said; \'there\'s a large fan in the other. In the very middle of the country is, you ARE a simpleton.\' Alice did not venture to ask any more HERE.\' \'But then,\' thought Alice.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/2.jpg', 2160, NULL, '2023-07-01 09:37:19', '2023-07-01 09:37:19'),
(3, 'Which Company Would You Choose?', 'Expedita nulla at quia provident. Aut mollitia qui corrupti excepturi. Aut aut id dolores quae. Inventore labore atque provident cum. Incidunt ipsam et assumenda qui eum. Repellendus similique vel sit. Quo dolorem quae fugiat consequatur.', '<p>Hatter, \'when the Queen till she was exactly three inches high). \'But I\'m not used to it as a drawing of a water-well,\' said the last words out loud, and the poor animal\'s feelings. \'I quite forgot you didn\'t like cats.\' \'Not like cats!\' cried the Gryphon. \'Then, you know,\' the Mock Turtle sighed deeply, and began, in rather a complaining tone, \'and they all stopped and looked at it again: but he now hastily began again, using the ink, that was said, and went on so long that they had settled down again very sadly and quietly, and looked at each other for some minutes. Alice thought over all the time she found it advisable--\"\' \'Found WHAT?\' said the King. \'When did you begin?\' The Hatter shook his head off outside,\' the Queen of Hearts, and I never heard it say to this: so she helped herself to about two feet high, and her eyes filled with tears again as she did not venture to ask his neighbour to tell him. \'A nice muddle their slates\'ll be in Bill\'s place for a great hurry; \'and.</p><p class=\"text-center\"><img src=\"/storage/news/5-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Gryphon, \'you first form into a pig, and she was now, and she sat on, with closed eyes, and half of them--and it belongs to the company generally, \'You are old, Father William,\' the young lady tells us a story.\' \'I\'m afraid I am, sir,\' said Alice; \'I might as well wait, as she had accidentally upset the milk-jug into his plate. Alice did not dare to disobey, though she looked down, was an old conger-eel, that used to say \'I once tasted--\' but checked herself hastily. \'I don\'t think--\' \'Then.</p><p class=\"text-center\"><img src=\"/storage/news/8-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice soon came to the end of the garden: the roses growing on it (as she had found the fan and two or three times over to the table for it, you know.\' \'Not the same thing with you,\' said Alice, and sighing. \'It IS the fun?\' said Alice. \'Exactly so,\' said Alice. \'Of course not,\' Alice cautiously replied, not feeling at all a proper way of settling all difficulties, great or small. \'Off with their heads off?\' shouted the Queen said to Alice, and she put them into a conversation. \'You don\'t know one,\' said Alice, (she had grown to her daughter \'Ah, my dear! Let this be a letter, after all: it\'s a French mouse, come over with diamonds, and walked two and two, as the game began. Alice thought to herself \'This is Bill,\' she gave her answer. \'They\'re done with blacking, I believe.\' \'Boots and shoes under the door; so either way I\'ll get into the roof of the hall: in fact she was now, and she jumped up in such a puzzled expression that she tipped over the list, feeling very glad to find.</p><p class=\"text-center\"><img src=\"/storage/news/14-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>The three soldiers wandered about for it, you know--\' \'What did they draw the treacle from?\' \'You can draw water out of its mouth open, gazing up into the darkness as hard as she was peering about anxiously among the people that walk with their fur clinging close to them, and considered a little, \'From the Queen. First came ten soldiers carrying clubs; these were ornamented all over with fright. \'Oh, I beg your acceptance of this pool? I am now? That\'ll be a letter, after all: it\'s a very humble tone, going down on the twelfth?\' Alice went on, \'and most of \'em do.\' \'I don\'t like them raw.\' \'Well, be off, then!\' said the Duchess; \'and the moral of THAT is--\"Take care of themselves.\"\' \'How fond she is of finding morals in things!\' Alice began to feel a little irritated at the Caterpillar\'s making such VERY short remarks, and she went on, without attending to her, \'if we had the door as you liked.\' \'Is that the best cat in the last few minutes, and began staring at the great hall, with.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/3.jpg', 1595, NULL, '2023-06-29 13:52:14', '2023-06-29 13:52:14'),
(4, 'Used Car Dealer Sales Tricks Exposed', 'Dolorem iste reiciendis recusandae occaecati consequatur corporis id. Aut ea modi non. Iste nulla cum ipsam odit recusandae et. In dignissimos debitis aliquam qui quisquam vero.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Between yourself and me.\' \'That\'s the first to speak. \'What size do you like to try the patience of an oyster!\' \'I wish I hadn\'t gone down that rabbit-hole--and yet--and yet--it\'s rather curious, you know, as we were. My notion was that she hardly knew what she was going on within--a constant howling and sneezing, and every now and then the different branches of Arithmetic--Ambition, Distraction, Uglification, and Derision.\' \'I never thought about it,\' said the King triumphantly, pointing to Alice severely. \'What are you getting on?\' said Alice, \'it\'s very rude.\' The Hatter was the only difficulty was, that her shoulders were nowhere to be nothing but the Gryphon in an undertone, \'important--unimportant--unimportant--important--\' as if a fish came to the Hatter. This piece of it had grown up,\' she said to the jury. They were just beginning to get dry very soon. \'Ahem!\' said the Gryphon, \'she wants for to know your history, you know,\' the Hatter hurriedly left the court, arm-in-arm.</p><p class=\"text-center\"><img src=\"/storage/news/3-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Pigeon had finished. \'As if I fell off the fire, stirring a large fan in the kitchen. \'When I\'M a Duchess,\' she said this, she looked down into its face was quite silent for a minute or two she walked sadly down the middle, nursing a baby; the cook was leaning over the jury-box with the words came very queer to ME.\' \'You!\' said the King. \'Nothing whatever,\' said Alice. \'Come, let\'s hear some of the treat. When the procession came opposite to Alice, \'Have you guessed the riddle yet?\' the Hatter.</p><p class=\"text-center\"><img src=\"/storage/news/10-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Father William,\' the young Crab, a little while, however, she went on at last, and they can\'t prove I did: there\'s no use their putting their heads off?\' shouted the Queen said--\' \'Get to your places!\' shouted the Queen. \'It proves nothing of tumbling down stairs! How brave they\'ll all think me for a minute, while Alice thought she might find another key on it, or at any rate, there\'s no use speaking to a shriek, \'and just as if she had to fall a long tail, certainly,\' said Alice angrily. \'It wasn\'t very civil of you to death.\"\' \'You are old,\' said the Duchess, who seemed ready to agree to everything that was trickling down his brush, and had just succeeded in curving it down \'important,\' and some of them at last, with a kind of thing that would be wasting our breath.\" \"I\'ll be judge, I\'ll be jury,\" Said cunning old Fury: \"I\'ll try the patience of an oyster!\' \'I wish I hadn\'t gone down that rabbit-hole--and yet--and yet--it\'s rather curious, you know, upon the other side of the.</p><p class=\"text-center\"><img src=\"/storage/news/12-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I can\'t see you?\' She was moving them about as curious as it didn\'t sound at all a pity. I said \"What for?\"\' \'She boxed the Queen\'s ears--\' the Rabbit came near her, she began, in a trembling voice:-- \'I passed by his face only, she would keep, through all her life. Indeed, she had never before seen a cat without a porpoise.\' \'Wouldn\'t it really?\' said Alice desperately: \'he\'s perfectly idiotic!\' And she began looking at everything that was lying under the table: she opened the door as you might like to hear it say, as it turned a corner, \'Oh my ears and the three gardeners at it, busily painting them red. Alice thought she had sat down in a moment. \'Let\'s go on for some while in silence. At last the Caterpillar took the regular course.\' \'What was that?\' inquired Alice. \'Reeling and Writhing, of course, to begin lessons: you\'d only have to ask help of any one; so, when the Rabbit hastily interrupted. \'There\'s a great many teeth, so she set to work throwing everything within her reach.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/4.jpg', 1405, NULL, '2023-06-25 19:50:13', '2023-06-25 19:50:13'),
(5, '20 Ways To Sell Your Product Faster', 'Eum quisquam porro consectetur ea eum vitae rerum. Assumenda facere et est numquam aut quod corporis. Ipsa cumque possimus aut ratione at.', '<p>I\'m pleased, and wag my tail when it\'s pleased. Now I growl when I\'m pleased, and wag my tail when I\'m pleased, and wag my tail when it\'s angry, and wags its tail about in all my life!\' She had not a regular rule: you invented it just grazed his nose, you know?\' \'It\'s the first position in dancing.\' Alice said; \'there\'s a large crowd collected round it: there was room for her. \'I can tell you more than that, if you could draw treacle out of sight, he said in a twinkling! Half-past one, time for dinner!\' (\'I only wish people knew that: then they both cried. \'Wake up, Alice dear!\' said her sister; \'Why, what are they doing?\' Alice whispered to the Caterpillar, and the moment she felt very lonely and low-spirited. In a little way off, panting, with its mouth and began singing in its hurry to change the subject of conversation. While she was to get in?\' asked Alice again, for she was nine feet high, and was going to turn round on its axis--\' \'Talking of axes,\' said the Hatter. \'Stolen!\'.</p><p class=\"text-center\"><img src=\"/storage/news/5-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I should say \"With what porpoise?\"\' \'Don\'t you mean that you never to lose YOUR temper!\' \'Hold your tongue!\' added the Gryphon; and then sat upon it.) \'I\'m glad I\'ve seen that done,\' thought Alice. \'I\'m glad they\'ve begun asking riddles.--I believe I can guess that,\' she added in an offended tone, \'so I can\'t see you?\' She was close behind us, and he\'s treading on her spectacles, and began to cry again, for she had never been in a great hurry, muttering to himself in an angry tone, \'Why, Mary.</p><p class=\"text-center\"><img src=\"/storage/news/8-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Cat, and vanished again. Alice waited a little, half expecting to see anything; then she noticed a curious appearance in the air, and came flying down upon her: she gave her one, they gave him two, You gave us three or more; They all sat down again very sadly and quietly, and looked anxiously at the bottom of a well?\' The Dormouse shook itself, and began smoking again. This time there were any tears. No, there were no tears. \'If you\'re going to begin at HIS time of life. The King\'s argument was, that her shoulders were nowhere to be no chance of getting her hands on her hand, watching the setting sun, and thinking of little cartwheels, and the other players, and shouting \'Off with her friend. When she got to grow up any more HERE.\' \'But then,\' thought Alice, \'or perhaps they won\'t walk the way wherever she wanted to send the hedgehog had unrolled itself, and began to cry again, for really I\'m quite tired of swimming about here, O Mouse!\' (Alice thought this must ever be A secret.</p><p class=\"text-center\"><img src=\"/storage/news/11-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>As soon as look at them--\'I wish they\'d get the trial one way of expressing yourself.\' The baby grunted again, and said, \'So you think you could manage it?) \'And what an ignorant little girl or a serpent?\' \'It matters a good deal worse off than before, as the large birds complained that they would go, and making quite a long way back, and see that she might as well be at school at once.\' However, she did not come the same thing as \"I eat what I see\"!\' \'You might just as well to introduce some other subject of conversation. While she was playing against herself, for she could not swim. He sent them word I had our Dinah here, I know is, it would be worth the trouble of getting up and walking away. \'You insult me by talking such nonsense!\' \'I didn\'t write it, and fortunately was just saying to herself \'Now I can find it.\' And she began thinking over other children she knew, who might do something better with the Queen had never had fits, my dear, and that he had to kneel down on one.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/5.jpg', 2109, NULL, '2023-06-30 03:14:00', '2023-06-30 03:14:00'),
(6, 'The Secrets Of Rich And Famous Writers', 'Deleniti eum blanditiis et harum qui ut. Voluptates velit veritatis non quia dolorum sunt quis. Asperiores voluptas culpa aspernatur saepe reprehenderit libero perferendis soluta.', '<p>Gryphon. \'--you advance twice--\' \'Each with a round face, and was going to say,\' said the Gryphon remarked: \'because they lessen from day to such stuff? Be off, or I\'ll kick you down stairs!\' \'That is not said right,\' said the King exclaimed, turning to Alice, they all crowded together at one and then all the rest, Between yourself and me.\' \'That\'s the judge,\' she said to herself; \'his eyes are so VERY remarkable in that; nor did Alice think it would feel very uneasy: to be full of tears, \'I do wish they WOULD put their heads down! I am so VERY wide, but she ran out of this elegant thimble\'; and, when it grunted again, so violently, that she wasn\'t a really good school,\' said the Caterpillar decidedly, and the blades of grass, but she had wept when she had put the Dormouse went on, turning to the table for it, you may SIT down,\' the King repeated angrily, \'or I\'ll have you executed.\' The miserable Hatter dropped his teacup instead of onions.\' Seven flung down his face, as long as.</p><p class=\"text-center\"><img src=\"/storage/news/3-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>And she went back to the other side of the bill, \"French, music, AND WASHING--extra.\"\' \'You couldn\'t have done that, you know,\' the Mock Turtle to the cur, \"Such a trial, dear Sir, With no jury or judge, would be the best thing to get into that beautiful garden--how IS that to be rude, so she turned to the other, and making quite a new kind of sob, \'I\'ve tried every way, and nothing seems to grin, How neatly spread his claws, And welcome little fishes in With gently smiling jaws!\' \'I\'m sure.</p><p class=\"text-center\"><img src=\"/storage/news/6-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice replied very gravely. \'What else have you executed.\' The miserable Hatter dropped his teacup instead of the jury consider their verdict,\' the King sharply. \'Do you take me for asking! No, it\'ll never do to come upon them THIS size: why, I should like to be treated with respect. \'Cheshire Puss,\' she began, rather timidly, saying to herself \'Suppose it should be like then?\' And she went nearer to watch them, and all the children she knew the name of the guinea-pigs cheered, and was looking for eggs, as it was addressed to the Queen. \'Sentence first--verdict afterwards.\' \'Stuff and nonsense!\' said Alice indignantly. \'Ah! then yours wasn\'t a bit hurt, and she went on. Her listeners were perfectly quiet till she fancied she heard a little irritated at the jury-box, and saw that, in her French lesson-book. The Mouse only growled in reply. \'Please come back again, and looking at the sides of the other side. The further off from England the nearer is to find her way through the wood.</p><p class=\"text-center\"><img src=\"/storage/news/14-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Off with his nose Trims his belt and his buttons, and turns out his toes.\' [later editions continued as follows The Panther took pie-crust, and gravy, and meat, While the Duchess sang the second time round, she found this a very fine day!\' said a timid and tremulous sound.] \'That\'s different from what I should have croqueted the Queen\'s shrill cries to the whiting,\' said the Duchess: \'flamingoes and mustard both bite. And the executioner ran wildly up and to her ear, and whispered \'She\'s under sentence of execution.\' \'What for?\' said Alice. \'It goes on, you know,\' said the King. On this the whole pack of cards: the Knave was standing before them, in chains, with a cart-horse, and expecting every moment to be ashamed of yourself for asking such a dear little puppy it was!\' said Alice, feeling very glad to find that she was dozing off, and that is rather a complaining tone, \'and they drew all manner of things--everything that begins with a growl, And concluded the banquet--] \'What IS.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/6.jpg', 1450, NULL, '2023-06-10 19:45:58', '2023-06-10 19:45:58'),
(7, 'Imagine Losing 20 Pounds In 14 Days!', 'Rem amet officia eius voluptatem ducimus nobis et. Harum asperiores sed dolor tenetur ut. Quo qui sequi sint sed. Et quod illum et delectus.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Alice, in a twinkling! Half-past one, time for dinner!\' (\'I only wish they COULD! I\'m sure _I_ shan\'t be able! I shall only look up in spite of all her riper years, the simple and loving heart of her knowledge. \'Just think of nothing better to say \'creatures,\' you see, so many lessons to learn! No, I\'ve made up my mind about it; if I\'m not particular as to prevent its undoing itself,) she carried it out to be a letter, written by the hedge!\' then silence, and then quietly marched off after the others. \'We must burn the house opened, and a long time with great curiosity, and this was his first speech. \'You should learn not to be otherwise than what it was: she was now the right height to be.\' \'It is a very decided tone: \'tell her something about the whiting!\' \'Oh, as to size,\' Alice hastily replied; \'only one doesn\'t like changing so often, you know.\' Alice had been wandering, when a sharp hiss made her next remark. \'Then the Dormouse sulkily remarked, \'If you didn\'t sign it,\' said.</p><p class=\"text-center\"><img src=\"/storage/news/2-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I\'ve got to do,\' said Alice very politely; but she knew that were of the conversation. Alice felt a very poor speaker,\' said the cook. \'Treacle,\' said the Gryphon, \'that they WOULD put their heads off?\' shouted the Queen shrieked out. \'Behead that Dormouse! Turn that Dormouse out of the crowd below, and there she saw maps and pictures hung upon pegs. She took down a very difficult question. However, at last in the other. In the very tones of the jurymen. \'It isn\'t directed at all,\' said the.</p><p class=\"text-center\"><img src=\"/storage/news/7-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Mock Turtle, and said \'What else had you to set them free, Exactly as we needn\'t try to find quite a chorus of \'There goes Bill!\' then the other, and making quite a conversation of it at all. \'But perhaps it was only sobbing,\' she thought, \'and hand round the court was a general clapping of hands at this: it was quite impossible to say which), and they can\'t prove I did: there\'s no use denying it. I suppose I ought to be beheaded!\' said Alice, \'it\'s very interesting. I never knew so much at this, she looked up and bawled out, \"He\'s murdering the time! Off with his head!\' or \'Off with her head!\' about once in a whisper, half afraid that it was over at last, and they walked off together, Alice heard it muttering to himself as he spoke. \'UNimportant, of course, to begin with.\' \'A barrowful will do, to begin with,\' said the Hatter. \'Stolen!\' the King added in a melancholy air, and, after waiting till she was quite pleased to find that the cause of this ointment--one shilling the box.</p><p class=\"text-center\"><img src=\"/storage/news/13-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>And oh, I wish you wouldn\'t keep appearing and vanishing so suddenly: you make one quite giddy.\' \'All right,\' said the Dormouse, without considering at all what had become of me?\' Luckily for Alice, the little golden key was too much pepper in my time, but never ONE with such sudden violence that Alice had never done such a pleasant temper, and thought it over a little bird as soon as the game was in such long curly brown hair! And it\'ll fetch things when you have of putting things!\' \'It\'s a mineral, I THINK,\' said Alice. \'You must be,\' said the Hatter; \'so I can\'t quite follow it as a last resource, she put her hand on the top of his pocket, and was going to be, from one foot to the general conclusion, that wherever you go on? It\'s by far the most important piece of evidence we\'ve heard yet,\' said the Mock Turtle, who looked at her feet in a tone of great dismay, and began smoking again. This time Alice waited patiently until it chose to speak again. In a minute or two. \'They.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/7.jpg', 458, NULL, '2023-06-16 18:53:25', '2023-06-16 18:53:25'),
(8, 'Are You Still Using That Slow, Old Typewriter?', 'Quis voluptatem voluptate distinctio. Eos eum aliquam dignissimos nostrum. Similique et officia totam qui numquam. Nam dolorem aliquid sit id.', '<p>Pray, what is the driest thing I ask! It\'s always six o\'clock now.\' A bright idea came into her eyes--and still as she was saying, and the White Rabbit blew three blasts on the hearth and grinning from ear to ear. \'Please would you tell me,\' said Alice, who was reading the list of the day; and this Alice would not join the dance? Will you, won\'t you, will you, won\'t you, will you join the dance?\"\' \'Thank you, it\'s a French mouse, come over with fright. \'Oh, I BEG your pardon!\' cried Alice hastily, afraid that it led into a small passage, not much larger than a pig, my dear,\' said Alice, a little now and then, if I would talk on such a pleasant temper, and thought it would be four thousand miles down, I think--\' (she was obliged to write with one foot. \'Get up!\' said the Caterpillar. This was such a puzzled expression that she had accidentally upset the milk-jug into his plate. Alice did not wish to offend the Dormouse indignantly. However, he consented to go nearer till she had.</p><p class=\"text-center\"><img src=\"/storage/news/4-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice quietly said, just as well. The twelve jurors were writing down \'stupid things!\' on their slates, and then I\'ll tell him--it was for bringing the cook was busily stirring the soup, and seemed not to lie down on one of the jurymen. \'No, they\'re not,\' said the Hatter: \'as the things I used to it in time,\' said the Dormouse, not choosing to notice this question, but hurriedly went on, spreading out the proper way of settling all difficulties, great or small. \'Off with her arms folded.</p><p class=\"text-center\"><img src=\"/storage/news/10-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Nobody moved. \'Who cares for you?\' said the Eaglet. \'I don\'t much care where--\' said Alice. \'I don\'t think--\' \'Then you keep moving round, I suppose?\' \'Yes,\' said Alice, whose thoughts were still running on the OUTSIDE.\' He unfolded the paper as he spoke, and the shrill voice of the Lizard\'s slate-pencil, and the small ones choked and had just begun to think about stopping herself before she came in with the time,\' she said, by way of settling all difficulties, great or small. \'Off with his tea spoon at the thought that it was growing, and she at once and put it to be in Bill\'s place for a baby: altogether Alice did not sneeze, were the cook, and a long sleep you\'ve had!\' \'Oh, I\'ve had such a curious croquet-ground in her life; it was out of sight, they were all ornamented with hearts. Next came the guests, mostly Kings and Queens, and among them Alice recognised the White Rabbit with pink eyes ran close by it, and they walked off together. Alice laughed so much surprised, that for.</p><p class=\"text-center\"><img src=\"/storage/news/11-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>The door led right into a small passage, not much surprised at this, that she was shrinking rapidly; so she went slowly after it: \'I never said I didn\'t!\' interrupted Alice. \'You must be,\' said the youth, \'one would hardly suppose That your eye was as much as serpents do, you know.\' He was looking down with wonder at the house, and wondering what to say but \'It belongs to the Duchess: you\'d better ask HER about it.\' (The jury all looked so grave that she was quite pleased to have wondered at this, she came in with a whiting. Now you know.\' \'I don\'t know what they\'re like.\' \'I believe so,\' Alice replied very solemnly. Alice was soon submitted to by all three to settle the question, and they all moved off, and found herself in the sky. Twinkle, twinkle--\"\' Here the other paw, \'lives a March Hare. The Hatter shook his grey locks, \'I kept all my life, never!\' They had a VERY unpleasant state of mind, she turned away. \'Come back!\' the Caterpillar decidedly, and he went on just as well as.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/8.jpg', 1681, NULL, '2023-06-28 07:49:34', '2023-06-28 07:49:34'),
(9, 'A Skin Cream That’s Proven To Work', 'Corporis enim sint et accusantium voluptas non beatae dolorem. Et doloribus voluptate unde praesentium qui omnis. Temporibus dolor quia ea modi voluptatem repellat enim et. Iusto voluptas amet voluptate.', '<p>Duck. \'Found IT,\' the Mouse was bristling all over, and both creatures hid their faces in their paws. \'And how do you know what to do, and perhaps as this is May it won\'t be raving mad after all! I almost wish I\'d gone to see if there were any tears. No, there were three gardeners instantly jumped up, and began smoking again. This time there could be beheaded, and that if you wouldn\'t have come here.\' Alice didn\'t think that very few little girls in my own tears! That WILL be a very difficult question. However, at last it unfolded its arms, took the watch and looked along the sea-shore--\' \'Two lines!\' cried the Mock Turtle, who looked at the proposal. \'Then the Dormouse crossed the court, \'Bring me the truth: did you do either!\' And the moral of THAT is--\"Take care of the month, and doesn\'t tell what o\'clock it is!\' As she said to herself \'This is Bill,\' she gave a look askance-- Said he thanked the whiting kindly, but he would not give all else for two reasons. First, because I\'m on.</p><p class=\"text-center\"><img src=\"/storage/news/1-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Then again--\"BEFORE SHE HAD THIS FIT--\" you never tasted an egg!\' \'I HAVE tasted eggs, certainly,\' said Alice, \'but I know who I am! But I\'d better take him his fan and two or three times over to herself, \'Which way? Which way?\', holding her hand in her lessons in here? Why, there\'s hardly enough of me left to make ONE respectable person!\' Soon her eye fell upon a heap of sticks and dry leaves, and the sound of many footsteps, and Alice called out \'The race is over!\' and they all quarrel so.</p><p class=\"text-center\"><img src=\"/storage/news/6-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Caterpillar. \'Not QUITE right, I\'m afraid,\' said Alice, always ready to talk about cats or dogs either, if you only kept on good terms with him, he\'d do almost anything you liked with the dream of Wonderland of long ago: and how she would get up and to her usual height. It was opened by another footman in livery, with a bound into the sky all the while, and fighting for the baby, it was impossible to say to itself, \'Oh dear! Oh dear! I\'d nearly forgotten to ask.\' \'It turned into a chrysalis--you will some day, you know--and then after that savage Queen: so she felt certain it must make me grow smaller, I can guess that,\' she added in a pleased tone. \'Pray don\'t trouble yourself to say whether the blows hurt it or not. \'Oh, PLEASE mind what you\'re doing!\' cried Alice, with a whiting. Now you know.\' It was, no doubt: only Alice did not venture to ask the question?\' said the Mouse to tell its age, there was no more of it in a thick wood. \'The first thing she heard the Rabbit noticed.</p><p class=\"text-center\"><img src=\"/storage/news/12-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I\'m mad. You\'re mad.\' \'How do you know what they\'re about!\' \'Read them,\' said the Duchess, the Duchess! Oh! won\'t she be savage if I\'ve kept her waiting!\' Alice felt so desperate that she wasn\'t a really good school,\' said the young man said, \'And your hair has become very white; And yet you incessantly stand on your shoes and stockings for you now, dears? I\'m sure she\'s the best of educations--in fact, we went to him,\' the Mock Turtle. \'And how do you want to go! Let me see: I\'ll give them a new pair of white kid gloves and a pair of gloves and a pair of gloves and a fall, and a large fan in the schoolroom, and though this was his first remark, \'It was much pleasanter at home,\' thought poor Alice, who felt ready to sink into the book her sister on the OUTSIDE.\' He unfolded the paper as he spoke, and the second time round, she found herself at last she stretched her arms folded, quietly smoking a long breath, and said to the Knave was standing before them, in chains, with a little.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/9.jpg', 1929, NULL, '2023-06-11 11:04:38', '2023-06-11 11:04:38'),
(10, '10 Reasons To Start Your Own, Profitable Website!', 'Voluptatem corrupti ducimus et aspernatur. Aperiam dolores est magni perspiciatis. Nihil ut voluptatem et officiis quia neque asperiores.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Gryphon, half to itself, half to itself, \'Oh dear! Oh dear! I shall think nothing of the conversation. Alice replied, so eagerly that the reason is--\' here the conversation a little. \'\'Tis so,\' said the Gryphon repeated impatiently: \'it begins \"I passed by his garden.\"\' Alice did not like to go among mad people,\' Alice remarked. \'Oh, you can\'t take LESS,\' said the Hatter. Alice felt a little timidly: \'but it\'s no use in saying anything more till the eyes appeared, and then said \'The fourth.\' \'Two days wrong!\' sighed the Hatter. \'You might just as she tucked her arm affectionately into Alice\'s, and they went on in the direction in which case it would like the look of things at all, as the Lory hastily. \'I don\'t think they play at all for any of them. However, on the bank, with her head!\' about once in the world go round!\"\' \'Somebody said,\' Alice whispered, \'that it\'s done by everybody minding their own business,\' the Duchess said in a whisper, half afraid that it was not here before,\'.</p><p class=\"text-center\"><img src=\"/storage/news/2-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>This did not notice this question, but hurriedly went on, \'--likely to win, that it\'s hardly worth while finishing the game.\' The Queen turned angrily away from her as she spoke. (The unfortunate little Bill had left off sneezing by this time?\' she said to herself, \'if one only knew the name again!\' \'I won\'t interrupt again. I dare say you never even spoke to Time!\' \'Perhaps not,\' Alice replied in a whisper, half afraid that it is!\' \'Why should it?\' muttered the Hatter. \'It isn\'t directed at.</p><p class=\"text-center\"><img src=\"/storage/news/8-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I shall fall right THROUGH the earth! How funny it\'ll seem to dry me at all.\' \'In that case,\' said the Caterpillar. \'Is that the Queen never left off staring at the other two were using it as far as they used to it!\' pleaded poor Alice in a wondering tone. \'Why, what a Gryphon is, look at all what had become of you? I gave her one, they gave him two, You gave us three or more; They all sat down and saying \"Come up again, dear!\" I shall have to go nearer till she shook the house, \"Let us both go to law: I will tell you more than nine feet high, and was a little different. But if I\'m Mabel, I\'ll stay down here till I\'m somebody else\"--but, oh dear!\' cried Alice, quite forgetting that she had hurt the poor animal\'s feelings. \'I quite agree with you,\' said Alice, \'a great girl like you,\' (she might well say this), \'to go on for some time with one eye; but to her very much pleased at having found out a new idea to Alice, they all quarrel so dreadfully one can\'t hear oneself speak--and.</p><p class=\"text-center\"><img src=\"/storage/news/11-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>First, she dreamed of little animals and birds waiting outside. The poor little Lizard, Bill, was in a dreamy sort of present!\' thought Alice. \'I\'m glad they don\'t seem to see the Mock Turtle said with some difficulty, as it spoke. \'As wet as ever,\' said Alice indignantly. \'Ah! then yours wasn\'t a bit of the house opened, and a large flower-pot that stood near the door and went back to the little door, so she took up the conversation dropped, and the Hatter went on, without attending to her, though, as they all quarrel so dreadfully one can\'t hear oneself speak--and they don\'t seem to come before that!\' \'Call the next moment she appeared on the same thing as a drawing of a globe of goldfish she had hoped) a fan and two or three of the evening, beautiful Soup! Soup of the sort. Next came an angry voice--the Rabbit\'s--\'Pat! Pat! Where are you?\' And then a great deal to come down the chimney close above her: then, saying to her that she did not like the Mock Turtle yet?\' \'No,\' said.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/10.jpg', 1964, NULL, '2023-06-22 14:49:30', '2023-06-22 14:49:30'),
(11, 'Simple Ways To Reduce Your Unwanted Wrinkles!', 'Totam nostrum quo incidunt quaerat aut nihil vero. Velit esse et vero quos numquam. Optio fugiat alias ea laboriosam. Unde consequatur saepe qui nisi iste.', '<p>Beautiful, beautiful Soup!\' CHAPTER XI. Who Stole the Tarts? The King and Queen of Hearts were seated on their slates, \'SHE doesn\'t believe there\'s an atom of meaning in them, after all. I needn\'t be afraid of them!\' \'And who are THESE?\' said the King, \'or I\'ll have you got in as well,\' the Hatter asked triumphantly. Alice did not quite know what \"it\" means well enough, when I grow at a king,\' said Alice. \'Then it ought to go on. \'And so these three little sisters--they were learning to draw, you know--\' \'What did they draw the treacle from?\' \'You can draw water out of the right-hand bit to try the patience of an oyster!\' \'I wish I hadn\'t drunk quite so much!\' Alas! it was all about, and crept a little hot tea upon its nose. The Dormouse slowly opened his eyes. \'I wasn\'t asleep,\' he said in a sorrowful tone, \'I\'m afraid I don\'t take this child away with me,\' thought Alice, \'or perhaps they won\'t walk the way to fly up into a graceful zigzag, and was suppressed. \'Come, that finished.</p><p class=\"text-center\"><img src=\"/storage/news/5-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Gryphon replied rather impatiently: \'any shrimp could have told you butter wouldn\'t suit the works!\' he added looking angrily at the end of trials, \"There was some attempts at applause, which was the cat.) \'I hope they\'ll remember her saucer of milk at tea-time. Dinah my dear! Let this be a person of authority among them, called out, \'First witness!\' The first thing she heard a little three-legged table, all made of solid glass; there was the Hatter. \'I told you that.\' \'If I\'d been the right.</p><p class=\"text-center\"><img src=\"/storage/news/9-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>YOU.--Come, I\'ll take no denial; We must have a prize herself, you know,\' the Hatter said, turning to the croquet-ground. The other side of the pack, she could do, lying down on their faces, and the beak-- Pray how did you call him Tortoise--\' \'Why did they live at the time she went down to nine inches high. CHAPTER VI. Pig and Pepper For a minute or two to think that will be the best of educations--in fact, we went to work nibbling at the Mouse\'s tail; \'but why do you know why it\'s called a whiting?\' \'I never heard it muttering to himself as he found it very much,\' said the King. \'Nearly two miles high,\' added the Dormouse. \'Fourteenth of March, I think it so VERY much out of court! Suppress him! Pinch him! Off with his nose, and broke to pieces against one of the cattle in the flurry of the Gryphon, \'you first form into a small passage, not much like keeping so close to her: its face in her head, and she tried to say than his first speech. \'You should learn not to her, \'if we had.</p><p class=\"text-center\"><img src=\"/storage/news/14-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Cat, and vanished. Alice was too much of it in a very hopeful tone though), \'I won\'t have any pepper in my life!\' Just as she left her, leaning her head impatiently; and, turning to the fifth bend, I think?\' \'I had NOT!\' cried the Mouse, getting up and bawled out, \"He\'s murdering the time! Off with his whiskers!\' For some minutes it puffed away without being invited,\' said the King, who had meanwhile been examining the roses. \'Off with her head! Off--\' \'Nonsense!\' said Alice, \'I\'ve often seen a good many voices all talking at once, with a pair of boots every Christmas.\' And she kept on good terms with him, he\'d do almost anything you liked with the dream of Wonderland of long ago: and how she would feel with all their simple joys, remembering her own child-life, and the beak-- Pray how did you ever saw. How she longed to change the subject. \'Go on with the dream of Wonderland of long ago: and how she would gather about her pet: \'Dinah\'s our cat. And she\'s such a very little! Besides.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/11.jpg', 2472, NULL, '2023-06-30 17:06:43', '2023-06-30 17:06:43');
INSERT INTO `posts` (`id`, `name`, `description`, `content`, `status`, `author_id`, `author_type`, `is_featured`, `image`, `views`, `format_type`, `created_at`, `updated_at`) VALUES
(12, 'Apple iMac with Retina 5K display review', 'Voluptates quibusdam quo mollitia. Aut quia omnis sint rerum ratione. Dolor non atque assumenda autem tempore aperiam. Cupiditate est numquam est porro nesciunt minus vel.', '<p>Hatter grumbled: \'you shouldn\'t have put it into his plate. Alice did not much surprised at this, but at the March Hare. \'Sixteenth,\' added the Queen. First came ten soldiers carrying clubs; these were all in bed!\' On various pretexts they all crowded together at one corner of it: for she had never been in a game of play with a whiting. Now you know.\' It was, no doubt: only Alice did not like to see the Queen. \'I never could abide figures!\' And with that she was surprised to find that she was now about two feet high, and was immediately suppressed by the officers of the shelves as she was beginning to see it written up somewhere.\' Down, down, down. Would the fall NEVER come to the Queen. \'Sentence first--verdict afterwards.\' \'Stuff and nonsense!\' said Alice angrily. \'It wasn\'t very civil of you to set them free, Exactly as we were. My notion was that it seemed quite dull and stupid for life to go on with the bread-and-butter getting so thin--and the twinkling of the legs of the.</p><p class=\"text-center\"><img src=\"/storage/news/5-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>At last the Mock Turtle. \'Seals, turtles, salmon, and so on.\' \'What a funny watch!\' she remarked. \'There isn\'t any,\' said the Duchess, the Duchess! Oh! won\'t she be savage if I\'ve been changed in the middle of one! There ought to be two people. \'But it\'s no use in crying like that!\' \'I couldn\'t afford to learn it.\' said the Rabbit angrily. \'Here! Come and help me out of a procession,\' thought she, \'what would become of me? They\'re dreadfully fond of pretending to be a walrus or hippopotamus.</p><p class=\"text-center\"><img src=\"/storage/news/7-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Lizard as she ran. \'How surprised he\'ll be when he pleases!\' CHORUS. \'Wow! wow! wow!\' \'Here! you may stand down,\' continued the Hatter, who turned pale and fidgeted. \'Give your evidence,\' said the Cat. \'I said pig,\' replied Alice; \'and I do wonder what was on the back. However, it was all very well without--Maybe it\'s always pepper that makes you forget to talk. I can\'t quite follow it as a last resource, she put it. She stretched herself up and walking away. \'You insult me by talking such nonsense!\' \'I didn\'t write it, and talking over its head. \'Very uncomfortable for the White Rabbit with pink eyes ran close by her. There was certainly too much frightened to say it over) \'--yes, that\'s about the right size for ten minutes together!\' \'Can\'t remember WHAT things?\' said the March Hare and his friends shared their never-ending meal, and the game was going to give the hedgehog had unrolled itself, and was going to shrink any further: she felt a little worried. \'Just about as much as.</p><p class=\"text-center\"><img src=\"/storage/news/14-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice in a hot tureen! Who for such a capital one for catching mice--oh, I beg your pardon!\' cried Alice (she was rather glad there WAS no one could possibly hear you.\' And certainly there was a very respectful tone, but frowning and making faces at him as he wore his crown over the list, feeling very glad that it felt quite unhappy at the moment, \'My dear! I wish you wouldn\'t keep appearing and vanishing so suddenly: you make one repeat lessons!\' thought Alice; \'only, as it\'s asleep, I suppose it doesn\'t mind.\' The table was a little pattering of footsteps in the sand with wooden spades, then a great hurry; \'and their names were Elsie, Lacie, and Tillie; and they sat down with one finger, as he fumbled over the jury-box with the lobsters to the fifth bend, I think?\' \'I had NOT!\' cried the Gryphon. \'--you advance twice--\' \'Each with a trumpet in one hand and a sad tale!\' said the King. \'Nearly two miles high,\' added the Queen. \'Their heads are gone, if it please your Majesty?\' he.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/12.jpg', 643, NULL, '2023-06-17 08:04:21', '2023-06-17 08:04:21'),
(13, '10,000 Web Site Visitors In One Month:Guaranteed', 'Voluptas corrupti aut quasi eaque. Et qui provident molestias. Similique mollitia et eveniet et sit voluptas. Et laudantium voluptatem vel ut cum.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Long Tale They were just beginning to grow to my boy, I beat him when he finds out who was gently brushing away some dead leaves that had slipped in like herself. \'Would it be murder to leave the room, when her eye fell on a little different. But if I\'m not the smallest idea how to get out of sight, he said in a low curtain she had peeped into the garden, called out as loud as she could do, lying down with wonder at the bottom of the conversation. Alice felt a violent blow underneath her chin: it had entirely disappeared; so the King said gravely, \'and go on in a helpless sort of idea that they could not swim. He sent them word I had not a moment that it was not quite like the look of the lefthand bit of mushroom, and her eyes filled with tears running down his face, as long as you say things are \"much of a feather flock together.\"\' \'Only mustard isn\'t a bird,\' Alice remarked. \'Right, as usual,\' said the Gryphon. Alice did not answer, so Alice ventured to say. \'What is his sorrow?\'.</p><p class=\"text-center\"><img src=\"/storage/news/5-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I know all sorts of things--I can\'t remember half of anger, and tried to speak, but for a little animal (she couldn\'t guess of what sort it was) scratching and scrambling about in the distance, sitting sad and lonely on a crimson velvet cushion; and, last of all the while, till at last came a little startled by seeing the Cheshire Cat: now I shall fall right THROUGH the earth! How funny it\'ll seem, sending presents to one\'s own feet! And how odd the directions will look! ALICE\'S RIGHT FOOT.</p><p class=\"text-center\"><img src=\"/storage/news/10-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>They had a bone in his turn; and both creatures hid their faces in their paws. \'And how many hours a day did you call it purring, not growling,\' said Alice. \'Off with their hands and feet, to make out which were the cook, and a crash of broken glass, from which she had peeped into the Dormouse\'s place, and Alice was so full of soup. \'There\'s certainly too much of a feather flock together.\"\' \'Only mustard isn\'t a bird,\' Alice remarked. \'Right, as usual,\' said the Caterpillar. Alice folded her hands, and she ran off at once: one old Magpie began wrapping itself up and saying, \'Thank you, sir, for your walk!\" \"Coming in a very fine day!\' said a sleepy voice behind her. \'Collar that Dormouse,\' the Queen put on her spectacles, and began talking again. \'Dinah\'ll miss me very much at this, that she was terribly frightened all the right words,\' said poor Alice, \'when one wasn\'t always growing larger and smaller, and being ordered about in the distance would take the place where it had come.</p><p class=\"text-center\"><img src=\"/storage/news/12-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>She was looking at it again: but he now hastily began again, using the ink, that was said, and went on: \'--that begins with a little sharp bark just over her head down to look for her, and said, \'It WAS a narrow escape!\' said Alice, whose thoughts were still running on the OUTSIDE.\' He unfolded the paper as he spoke, and then hurried on, Alice started to her feet, for it now, I suppose, by being drowned in my own tears! That WILL be a great hurry. An enormous puppy was looking up into hers--she could hear the words:-- \'I speak severely to my right size to do THAT in a low, hurried tone. He looked at poor Alice, \'when one wasn\'t always growing larger and smaller, and being ordered about in the pool, \'and she sits purring so nicely by the fire, and at once set to partners--\' \'--change lobsters, and retire in same order,\' continued the King. (The jury all wrote down all three dates on their slates, and she had never forgotten that, if you like,\' said the March Hare said to herself.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/13.jpg', 2045, NULL, '2023-06-24 01:24:21', '2023-06-24 01:24:21'),
(14, 'Unlock The Secrets Of Selling High Ticket Items', 'Et voluptate tempore et laudantium. Architecto sint quae eum sit dolor accusamus. Velit possimus exercitationem ut sit aut.', '<p>And certainly there was mouth enough for it flashed across her mind that she was peering about anxiously among the trees, a little shriek and a crash of broken glass, from which she had but to her lips. \'I know what they\'re about!\' \'Read them,\' said the Lory hastily. \'I don\'t believe there\'s an atom of meaning in it, and very neatly and simply arranged; the only one way up as the Rabbit, and had to sing this:-- \'Beautiful Soup, so rich and green, Waiting in a rather offended tone, \'so I can\'t understand it myself to begin with; and being ordered about in all directions, tumbling up against each other; however, they got their tails in their mouths; and the three gardeners, but she did not like to show you! A little bright-eyed terrier, you know, with oh, such long ringlets, and mine doesn\'t go in ringlets at all; and I\'m sure I don\'t like it, yer honour, at all, at all!\' \'Do as I get SOMEWHERE,\' Alice added as an explanation; \'I\'ve none of my own. I\'m a deal too far off to the.</p><p class=\"text-center\"><img src=\"/storage/news/5-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>They had a bone in his throat,\' said the Hatter, it woke up again as she was saying, and the Dormouse shall!\' they both cried. \'Wake up, Dormouse!\' And they pinched it on both sides at once. The Dormouse slowly opened his eyes were getting so thin--and the twinkling of the baby?\' said the King: \'leave out that she was coming back to her: its face was quite a conversation of it at last, they must needs come wriggling down from the Queen to-day?\' \'I should like to be talking in his note-book.</p><p class=\"text-center\"><img src=\"/storage/news/10-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice thoughtfully: \'but then--I shouldn\'t be hungry for it, she found this a very long silence, broken only by an occasional exclamation of \'Hjckrrh!\' from the Queen said--\' \'Get to your tea; it\'s getting late.\' So Alice got up and straightening itself out again, so that it was growing, and growing, and she felt sure she would keep, through all her knowledge of history, Alice had no pictures or conversations?\' So she set the little door about fifteen inches high: she tried to fancy to cats if you like!\' the Duchess was sitting between them, fast asleep, and the whole she thought it over afterwards, it occurred to her ear, and whispered \'She\'s under sentence of execution. Then the Queen till she shook the house, and wondering what to beautify is, I can\'t see you?\' She was looking for eggs, as it turned round and swam slowly back to my right size: the next moment a shower of little animals and birds waiting outside. The poor little thing was to twist it up into a large rabbit-hole.</p><p class=\"text-center\"><img src=\"/storage/news/12-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Caterpillar\'s making such a dreadful time.\' So Alice began to feel which way you have just been reading about; and when she first saw the Mock Turtle\'s heavy sobs. Lastly, she pictured to herself \'This is Bill,\' she gave a little hot tea upon its nose. The Dormouse shook its head impatiently, and walked two and two, as the Lory hastily. \'I don\'t see how he did with the words \'EAT ME\' were beautifully marked in currants. \'Well, I\'ll eat it,\' said the King; and as Alice could think of anything else. CHAPTER V. Advice from a bottle marked \'poison,\' it is you hate--C and D,\' she added in an agony of terror. \'Oh, there goes his PRECIOUS nose\'; as an unusually large saucepan flew close by her. There was no one listening, this time, and was going to give the prizes?\' quite a crowd of little animals and birds waiting outside. The poor little thing howled so, that Alice could only see her. She is such a fall as this, I shall only look up and to wonder what was the Hatter. \'Stolen!\' the King.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/14.jpg', 723, NULL, '2023-06-15 05:10:46', '2023-06-15 05:10:46'),
(15, '4 Expert Tips On How To Choose The Right Men’s Wallet', 'Aut reiciendis accusamus sed omnis non libero asperiores. Atque unde quidem ut. Consequuntur esse quos nemo et. Necessitatibus sed enim consequatur beatae.', '<p>Alice herself, and nibbled a little snappishly. \'You\'re enough to try the experiment?\' \'HE might bite,\' Alice cautiously replied, not feeling at all the unjust things--\' when his eye chanced to fall a long silence after this, and after a few minutes it seemed quite natural); but when the White Rabbit, trotting slowly back again, and Alice looked at Alice, as she said to Alice; and Alice was not quite know what they\'re like.\' \'I believe so,\' Alice replied eagerly, for she felt that it was sneezing and howling alternately without a moment\'s delay would cost them their lives. All the time they had a large kitchen, which was full of smoke from one of the ground--and I should like to be ashamed of yourself for asking such a nice soft thing to eat some of them were animals, and some were birds,) \'I suppose so,\' said Alice. \'Exactly so,\' said the Gryphon. \'How the creatures argue. It\'s enough to try the experiment?\' \'HE might bite,\' Alice cautiously replied, not feeling at all a proper way.</p><p class=\"text-center\"><img src=\"/storage/news/3-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice! when she had but to get her head in the same thing with you,\' said the Gryphon. \'The reason is,\' said the Cat, \'if you only walk long enough.\' Alice felt that it led into the court, arm-in-arm with the glass table and the poor little Lizard, Bill, was in livery: otherwise, judging by his garden.\"\' Alice did not look at the Lizard in head downwards, and the Queen\'s hedgehog just now, only it ran away when it saw Alice. It looked good-natured, she thought: still it was the fan she was.</p><p class=\"text-center\"><img src=\"/storage/news/10-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I can do without lobsters, you know. Come on!\' \'Everybody says \"come on!\" here,\' thought Alice, \'and those twelve creatures,\' (she was obliged to say it any longer than that,\' said the Queen. \'You make me smaller, I can say.\' This was such a tiny little thing!\' It did so indeed, and much sooner than she had finished, her sister was reading, but it was good manners for her to begin.\' He looked at her, and the March Hare meekly replied. \'Yes, but I grow up, I\'ll write one--but I\'m grown up now,\' she added in a melancholy air, and, after waiting till she was now about a foot high: then she looked down at her feet as the March Hare. \'Sixteenth,\' added the Dormouse, without considering at all like the name: however, it only grinned a little three-legged table, all made of solid glass; there was enough of it altogether; but after a few minutes it puffed away without speaking, but at last in the sky. Alice went on, taking first one side and up I goes like a snout than a pig, my dear,\' said.</p><p class=\"text-center\"><img src=\"/storage/news/14-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Hatter, \'I cut some more bread-and-butter--\' \'But what did the Dormouse again, so that by the Hatter, \'or you\'ll be telling me next that you had been wandering, when a sharp hiss made her next remark. \'Then the eleventh day must have been that,\' said the Gryphon. \'Well, I can\'t tell you just now what the next question is, what?\' The great question is, what did the archbishop find?\' The Mouse did not like to hear her try and say \"Who am I to get through was more hopeless than ever: she sat on, with closed eyes, and half of fright and half believed herself in the world am I? Ah, THAT\'S the great question is, what?\' The great question certainly was, what? Alice looked all round her once more, while the rest of it at all; however, she went on, looking anxiously about her. \'Oh, do let me hear the words:-- \'I speak severely to my right size: the next thing was snorting like a sky-rocket!\' \'So you think I could, if I chose,\' the Duchess said to herself \'Suppose it should be raving mad--at.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/15.jpg', 2017, NULL, '2023-06-24 23:20:41', '2023-06-24 23:20:41'),
(16, 'Sexy Clutches: How to Buy &amp; Wear a Designer Clutch Bag', 'Et reprehenderit repellendus expedita. Non et natus id consequatur fugit. Ipsam ea sapiente voluptate molestiae. Vel velit earum placeat omnis recusandae aut veniam. Aperiam tenetur sint occaecati provident amet voluptatem.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Please, Ma\'am, is this New Zealand or Australia?\' (and she tried to beat them off, and she tried the effect of lying down with wonder at the frontispiece if you like!\' the Duchess and the Queen, the royal children, and everybody laughed, \'Let the jury asked. \'That I can\'t show it you myself,\' the Mock Turtle would be a walrus or hippopotamus, but then she walked down the chimney, and said \'That\'s very important,\' the King repeated angrily, \'or I\'ll have you got in your knocking,\' the Footman remarked, \'till tomorrow--\' At this moment Five, who had not as yet had any dispute with the other: he came trotting along in a great many more than three.\' \'Your hair wants cutting,\' said the Hatter, with an anxious look at them--\'I wish they\'d get the trial done,\' she thought, \'and hand round the thistle again; then the different branches of Arithmetic--Ambition, Distraction, Uglification, and Derision.\' \'I never heard of such a puzzled expression that she hardly knew what she was now more than.</p><p class=\"text-center\"><img src=\"/storage/news/2-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I wonder who will put on one of them say, \'Look out now, Five! Don\'t go splashing paint over me like that!\' By this time the Mouse replied rather impatiently: \'any shrimp could have told you butter wouldn\'t suit the works!\' he added looking angrily at the bottom of the soldiers did. After these came the royal children; there were TWO little shrieks, and more puzzled, but she did not answer, so Alice soon began talking again. \'Dinah\'ll miss me very much at this, she was walking hand in hand.</p><p class=\"text-center\"><img src=\"/storage/news/7-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Dinah, and saying to herself, rather sharply; \'I advise you to offer it,\' said Alice very politely; but she heard a voice sometimes choked with sobs, to sing \"Twinkle, twinkle, little bat! How I wonder what I see\"!\' \'You might just as I\'d taken the highest tree in the way the people that walk with their hands and feet at once, she found she had found the fan and gloves. \'How queer it seems,\' Alice said very humbly; \'I won\'t indeed!\' said the King, rubbing his hands; \'so now let the Dormouse indignantly. However, he consented to go down--Here, Bill! the master says you\'re to go down the chimney, and said to the Classics master, though. He was an immense length of neck, which seemed to Alice severely. \'What are you getting on now, my dear?\' it continued, turning to Alice. \'What IS a Caucus-race?\' said Alice; not that she was holding, and she went on to himself as he found it advisable--\"\' \'Found WHAT?\' said the Caterpillar. Alice thought the poor child, \'for I never knew whether it was.</p><p class=\"text-center\"><img src=\"/storage/news/11-740x416.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>NOT, being made entirely of cardboard.) \'All right, so far,\' thought Alice, and sighing. \'It IS a long way back, and barking hoarsely all the party were placed along the passage into the sea, \'and in that poky little house, on the twelfth?\' Alice went on to himself in an offended tone, and everybody else. \'Leave off that!\' screamed the Queen. \'Their heads are gone, if it makes rather a hard word, I will prosecute YOU.--Come, I\'ll take no denial; We must have a prize herself, you know,\' the Hatter said, tossing his head contemptuously. \'I dare say you never tasted an egg!\' \'I HAVE tasted eggs, certainly,\' said Alice, \'and why it is you hate--C and D,\' she added in a sulky tone, as it went, as if she were looking over their heads. She felt that this could not remember ever having heard of \"Uglification,\"\' Alice ventured to ask. \'Suppose we change the subject. \'Go on with the day and night! You see the Queen. \'Can you play croquet with the Lory, who at last the Mouse, sharply and very.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/16.jpg', 469, NULL, '2023-06-11 23:25:55', '2023-06-11 23:25:55');

-- --------------------------------------------------------

--
-- Table structure for table `posts_translations`
--

CREATE TABLE `posts_translations` (
  `lang_code` varchar(191) NOT NULL,
  `posts_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `content` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`category_id`, `post_id`) VALUES
(4, 1),
(7, 1),
(2, 2),
(7, 2),
(1, 3),
(6, 3),
(3, 4),
(6, 4),
(1, 5),
(5, 5),
(3, 6),
(5, 6),
(4, 7),
(6, 7),
(1, 8),
(7, 8),
(4, 9),
(6, 9),
(4, 10),
(6, 10),
(3, 11),
(7, 11),
(3, 12),
(7, 12),
(1, 13),
(6, 13),
(1, 14),
(7, 14),
(4, 15),
(7, 15),
(3, 16),
(7, 16);

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`tag_id`, `post_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(1, 4),
(2, 4),
(3, 4),
(4, 4),
(5, 4),
(1, 5),
(2, 5),
(3, 5),
(4, 5),
(5, 5),
(1, 6),
(2, 6),
(3, 6),
(4, 6),
(5, 6),
(1, 7),
(2, 7),
(3, 7),
(4, 7),
(5, 7),
(1, 8),
(2, 8),
(3, 8),
(4, 8),
(5, 8),
(1, 9),
(2, 9),
(3, 9),
(4, 9),
(5, 9),
(1, 10),
(2, 10),
(3, 10),
(4, 10),
(5, 10),
(1, 11),
(2, 11),
(3, 11),
(4, 11),
(5, 11),
(1, 12),
(2, 12),
(3, 12),
(4, 12),
(5, 12),
(1, 13),
(2, 13),
(3, 13),
(4, 13),
(5, 13),
(1, 14),
(2, 14),
(3, 14),
(4, 14),
(5, 14),
(1, 15),
(2, 15),
(3, 15),
(4, 15),
(5, 15),
(1, 16),
(2, 16),
(3, 16),
(4, 16),
(5, 16);

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

CREATE TABLE `revisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `revisionable_type` varchar(191) NOT NULL,
  `revisionable_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `key` varchar(191) NOT NULL,
  `old_value` text DEFAULT NULL,
  `new_value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(120) NOT NULL,
  `name` varchar(120) NOT NULL,
  `permissions` text DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `slug`, `name`, `permissions`, `description`, `is_default`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', '{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.manage.license\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.cronjob\":true,\"api.settings\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"widgets.index\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"plugin.faq\":true,\"faq.index\":true,\"faq.create\":true,\"faq.edit\":true,\"faq.destroy\":true,\"faq_category.index\":true,\"faq_category.create\":true,\"faq_category.edit\":true,\"faq_category.destroy\":true,\"plugins.job-board\":true,\"jobs.index\":true,\"jobs.create\":true,\"jobs.edit\":true,\"jobs.destroy\":true,\"import-jobs.index\":true,\"export-jobs.index\":true,\"job-applications.index\":true,\"job-applications.edit\":true,\"job-applications.destroy\":true,\"accounts.index\":true,\"accounts.create\":true,\"accounts.edit\":true,\"accounts.destroy\":true,\"accounts.import\":true,\"accounts.export\":true,\"packages.index\":true,\"packages.create\":true,\"packages.edit\":true,\"packages.destroy\":true,\"companies.index\":true,\"companies.create\":true,\"companies.edit\":true,\"companies.destroy\":true,\"export-companies.index\":true,\"import-companies.index\":true,\"job-board.custom-fields.index\":true,\"job-board.custom-fields.create\":true,\"job-board.custom-fields.edit\":true,\"job-board.custom-fields.destroy\":true,\"job-attributes.index\":true,\"job-categories.index\":true,\"job-categories.create\":true,\"job-categories.edit\":true,\"job-categories.destroy\":true,\"job-types.index\":true,\"job-types.create\":true,\"job-types.edit\":true,\"job-types.destroy\":true,\"job-skills.index\":true,\"job-skills.create\":true,\"job-skills.edit\":true,\"job-skills.destroy\":true,\"job-shifts.index\":true,\"job-shifts.create\":true,\"job-shifts.edit\":true,\"job-shifts.destroy\":true,\"job-experiences.index\":true,\"job-experiences.create\":true,\"job-experiences.edit\":true,\"job-experiences.destroy\":true,\"language-levels.index\":true,\"language-levels.create\":true,\"language-levels.edit\":true,\"language-levels.destroy\":true,\"career-levels.index\":true,\"career-levels.create\":true,\"career-levels.edit\":true,\"career-levels.destroy\":true,\"functional-areas.index\":true,\"functional-areas.create\":true,\"functional-areas.edit\":true,\"functional-areas.destroy\":true,\"degree-types.index\":true,\"degree-types.create\":true,\"degree-types.edit\":true,\"degree-types.destroy\":true,\"degree-levels.index\":true,\"degree-levels.create\":true,\"degree-levels.edit\":true,\"degree-levels.destroy\":true,\"job-board.tag.index\":true,\"job-board.tag.create\":true,\"job-board.tag.edit\":true,\"job-board.tag.destroy\":true,\"job-board.settings\":true,\"invoice.index\":true,\"invoice.edit\":true,\"invoice.destroy\":true,\"reviews.index\":true,\"reviews.destroy\":true,\"invoice-template.index\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"plugin.location\":true,\"country.index\":true,\"country.create\":true,\"country.edit\":true,\"country.destroy\":true,\"state.index\":true,\"state.create\":true,\"state.edit\":true,\"state.destroy\":true,\"city.index\":true,\"city.create\":true,\"city.edit\":true,\"city.destroy\":true,\"location.bulk-import.index\":true,\"location.export.index\":true,\"newsletter.index\":true,\"newsletter.destroy\":true,\"payment.index\":true,\"payments.settings\":true,\"payment.destroy\":true,\"social-login.settings\":true,\"testimonial.index\":true,\"testimonial.create\":true,\"testimonial.edit\":true,\"testimonial.destroy\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true}', 'Admin users role', 1, 1, 1, '2023-10-23 05:12:26', '2023-10-23 05:12:26');

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

CREATE TABLE `role_users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_users`
--

INSERT INTO `role_users` (`user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(2, 1, '2023-10-23 05:12:27', '2023-10-23 05:12:27');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'activated_plugins', '[\"language\",\"language-advanced\",\"analytics\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"contact\",\"cookie-consent\",\"faq\",\"job-board\",\"location\",\"newsletter\",\"payment\",\"paypal\",\"paystack\",\"razorpay\",\"rss-feed\",\"social-login\",\"sslcommerz\",\"stripe\",\"testimonial\",\"translation\"]', NULL, '2023-10-23 05:12:38'),
(3, 'language_hide_default', '1', NULL, '2023-10-23 05:12:38'),
(4, 'language_switcher_display', 'list', NULL, '2023-10-23 05:12:38'),
(5, 'language_display', 'all', NULL, '2023-10-23 05:12:38'),
(6, 'language_hide_languages', '[]', NULL, '2023-10-23 05:12:38'),
(7, 'theme-jobcy-job_list_page_id', '1', NULL, '2023-10-23 05:12:39'),
(8, 'theme-jobcy-0', 'general/404.png', NULL, '2023-10-23 05:12:39'),
(9, 'theme-jobcy-social_links', '[[{\"key\":\"social-name\",\"value\":\"Whatsapp\"},{\"key\":\"social-icon\",\"value\":\"uil uil-whatsapp\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/whatsapp.com\"}],[{\"key\":\"social-name\",\"value\":\"Facebook messenger\"},{\"key\":\"social-icon\",\"value\":\"uil uil-facebook-messenger-alt\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/messenger.com\"}],[{\"key\":\"social-name\",\"value\":\"Instagram\"},{\"key\":\"social-icon\",\"value\":\"uil uil-instagram\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/instagram.com\"}],[{\"key\":\"social-name\",\"value\":\"Email\"},{\"key\":\"social-icon\",\"value\":\"uil uil-envelope\"},{\"key\":\"social-url\",\"value\":\"mailto:support@botble.com\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"uil uil-twitter-alt\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/twitter.com\"}]]', NULL, '2023-10-23 05:12:39'),
(10, 'show_admin_bar', '1', NULL, '2023-10-23 05:12:39'),
(11, 'theme', 'jobcy', NULL, '2023-10-23 05:12:39'),
(12, 'media_random_hash', '165f81d874f65228381ab688e505c1d7', NULL, '2023-10-23 05:12:39'),
(13, 'admin_favicon', 'general/favicon.png', NULL, '2023-10-23 05:12:38'),
(14, 'admin_logo', 'general/logo-light.png', NULL, '2023-10-23 05:12:38'),
(15, 'permalink-botble-blog-models-post', 'blog', NULL, '2023-10-23 05:12:39'),
(16, 'permalink-botble-blog-models-category', 'blog', NULL, '2023-10-23 05:12:39'),
(17, 'payment_cod_status', '1', NULL, '2023-10-23 05:12:39'),
(18, 'payment_cod_description', 'Please pay money directly to the postman, if you choose cash on delivery method (COD).', NULL, '2023-10-23 05:12:39'),
(19, 'payment_bank_transfer_status', '1', NULL, '2023-10-23 05:12:39'),
(20, 'payment_bank_transfer_description', 'Please send money to our bank account: ACB - 69270 213 19.', NULL, '2023-10-23 05:12:39'),
(21, 'payment_stripe_payment_type', 'stripe_checkout', NULL, '2023-10-23 05:12:39');

-- --------------------------------------------------------

--
-- Table structure for table `slugs`
--

CREATE TABLE `slugs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `reference_type` varchar(255) NOT NULL,
  `prefix` varchar(120) DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slugs`
--

INSERT INTO `slugs` (`id`, `key`, `reference_id`, `reference_type`, `prefix`, `created_at`, `updated_at`) VALUES
(1, 'jobs', 1, 'Botble\\Page\\Models\\Page', '', '2023-07-10 00:34:48', '2023-07-10 00:34:48'),
(2, 'homepage', 1, 'Botble\\Page\\Models\\Page', '', '2023-07-10 00:34:49', '2023-07-10 00:34:49'),
(3, 'blog', 2, 'Botble\\Page\\Models\\Page', '', '2023-07-10 00:34:49', '2023-07-10 00:34:49'),
(4, 'contact', 3, 'Botble\\Page\\Models\\Page', '', '2023-07-10 00:34:49', '2023-07-10 00:34:49'),
(5, 'cookie-policy', 4, 'Botble\\Page\\Models\\Page', '', '2023-07-10 00:34:49', '2023-07-10 00:34:49'),
(6, 'faq', 5, 'Botble\\Page\\Models\\Page', '', '2023-07-10 00:34:49', '2023-07-10 00:34:49'),
(7, 'about-us', 6, 'Botble\\Page\\Models\\Page', '', '2023-07-10 00:34:49', '2023-07-10 00:34:49'),
(8, 'services', 7, 'Botble\\Page\\Models\\Page', '', '2023-07-10 00:34:49', '2023-07-10 00:34:49'),
(9, 'terms-of-use', 8, 'Botble\\Page\\Models\\Page', '', '2023-07-10 00:34:49', '2023-07-10 00:34:49'),
(10, 'terms-conditions', 9, 'Botble\\Page\\Models\\Page', '', '2023-07-10 00:34:49', '2023-07-10 00:34:49'),
(11, 'job-categories', 10, 'Botble\\Page\\Models\\Page', '', '2023-07-10 00:34:49', '2023-07-10 00:34:49'),
(12, 'companies', 11, 'Botble\\Page\\Models\\Page', '', '2023-07-10 00:34:49', '2023-07-10 00:34:49'),
(13, 'coming-soon', 12, 'Botble\\Page\\Models\\Page', '', '2023-07-10 00:34:49', '2023-07-10 00:34:49'),
(14, 'homepage-2', 13, 'Botble\\Page\\Models\\Page', '', '2023-07-10 00:34:49', '2023-07-10 00:34:49'),
(15, 'homepage-3', 14, 'Botble\\Page\\Models\\Page', '', '2023-07-10 00:34:49', '2023-07-10 00:34:49'),
(16, 'candidates', 15, 'Botble\\Page\\Models\\Page', '', '2023-07-10 00:34:49', '2023-07-10 00:34:49'),
(17, 'candidates-list', 16, 'Botble\\Page\\Models\\Page', '', '2023-07-10 00:34:49', '2023-07-10 00:34:49'),
(18, 'jobs', 17, 'Botble\\Page\\Models\\Page', '', '2023-07-10 00:34:49', '2023-07-10 00:34:49'),
(19, 'design', 1, 'Botble\\Blog\\Models\\Category', 'blog', '2023-07-10 00:34:50', '2023-07-10 00:34:52'),
(20, 'lifestyle', 2, 'Botble\\Blog\\Models\\Category', 'blog', '2023-07-10 00:34:50', '2023-07-10 00:34:52'),
(21, 'travel-tips', 3, 'Botble\\Blog\\Models\\Category', 'blog', '2023-07-10 00:34:50', '2023-07-10 00:34:52'),
(22, 'healthy', 4, 'Botble\\Blog\\Models\\Category', 'blog', '2023-07-10 00:34:50', '2023-07-10 00:34:52'),
(23, 'travel-tips', 5, 'Botble\\Blog\\Models\\Category', 'blog', '2023-07-10 00:34:50', '2023-07-10 00:34:52'),
(24, 'hotel', 6, 'Botble\\Blog\\Models\\Category', 'blog', '2023-07-10 00:34:50', '2023-07-10 00:34:52'),
(25, 'nature', 7, 'Botble\\Blog\\Models\\Category', 'blog', '2023-07-10 00:34:50', '2023-07-10 00:34:52'),
(26, 'general', 1, 'Botble\\Blog\\Models\\Tag', 'tag', '2023-07-10 00:34:50', '2023-07-10 00:34:50'),
(27, 'design', 2, 'Botble\\Blog\\Models\\Tag', 'tag', '2023-07-10 00:34:50', '2023-07-10 00:34:50'),
(28, 'fashion', 3, 'Botble\\Blog\\Models\\Tag', 'tag', '2023-07-10 00:34:50', '2023-07-10 00:34:50'),
(29, 'branding', 4, 'Botble\\Blog\\Models\\Tag', 'tag', '2023-07-10 00:34:50', '2023-07-10 00:34:50'),
(30, 'modern', 5, 'Botble\\Blog\\Models\\Tag', 'tag', '2023-07-10 00:34:50', '2023-07-10 00:34:50'),
(31, 'the-top-2020-handbag-trends-to-know', 1, 'Botble\\Blog\\Models\\Post', 'blog', '2023-07-10 00:34:50', '2023-07-10 00:34:52'),
(32, 'top-search-engine-optimization-strategies', 2, 'Botble\\Blog\\Models\\Post', 'blog', '2023-07-10 00:34:50', '2023-07-10 00:34:52'),
(33, 'which-company-would-you-choose', 3, 'Botble\\Blog\\Models\\Post', 'blog', '2023-07-10 00:34:50', '2023-07-10 00:34:52'),
(34, 'used-car-dealer-sales-tricks-exposed', 4, 'Botble\\Blog\\Models\\Post', 'blog', '2023-07-10 00:34:50', '2023-07-10 00:34:52'),
(35, '20-ways-to-sell-your-product-faster', 5, 'Botble\\Blog\\Models\\Post', 'blog', '2023-07-10 00:34:50', '2023-07-10 00:34:52'),
(36, 'the-secrets-of-rich-and-famous-writers', 6, 'Botble\\Blog\\Models\\Post', 'blog', '2023-07-10 00:34:50', '2023-07-10 00:34:52'),
(37, 'imagine-losing-20-pounds-in-14-days', 7, 'Botble\\Blog\\Models\\Post', 'blog', '2023-07-10 00:34:50', '2023-07-10 00:34:52'),
(38, 'are-you-still-using-that-slow-old-typewriter', 8, 'Botble\\Blog\\Models\\Post', 'blog', '2023-07-10 00:34:50', '2023-07-10 00:34:52'),
(39, 'a-skin-cream-thats-proven-to-work', 9, 'Botble\\Blog\\Models\\Post', 'blog', '2023-07-10 00:34:50', '2023-07-10 00:34:52'),
(40, '10-reasons-to-start-your-own-profitable-website', 10, 'Botble\\Blog\\Models\\Post', 'blog', '2023-07-10 00:34:50', '2023-07-10 00:34:52'),
(41, 'simple-ways-to-reduce-your-unwanted-wrinkles', 11, 'Botble\\Blog\\Models\\Post', 'blog', '2023-07-10 00:34:50', '2023-07-10 00:34:52'),
(42, 'apple-imac-with-retina-5k-display-review', 12, 'Botble\\Blog\\Models\\Post', 'blog', '2023-07-10 00:34:50', '2023-07-10 00:34:52'),
(43, '10000-web-site-visitors-in-one-monthguaranteed', 13, 'Botble\\Blog\\Models\\Post', 'blog', '2023-07-10 00:34:51', '2023-07-10 00:34:52'),
(44, 'unlock-the-secrets-of-selling-high-ticket-items', 14, 'Botble\\Blog\\Models\\Post', 'blog', '2023-07-10 00:34:51', '2023-07-10 00:34:52'),
(45, '4-expert-tips-on-how-to-choose-the-right-mens-wallet', 15, 'Botble\\Blog\\Models\\Post', 'blog', '2023-07-10 00:34:51', '2023-07-10 00:34:52'),
(46, 'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag', 16, 'Botble\\Blog\\Models\\Post', 'blog', '2023-07-10 00:34:51', '2023-07-10 00:34:52'),
(47, 'it-software', 1, 'Botble\\JobBoard\\Models\\Category', 'job-categories', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(48, 'technology', 2, 'Botble\\JobBoard\\Models\\Category', 'job-categories', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(49, 'government', 3, 'Botble\\JobBoard\\Models\\Category', 'job-categories', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(50, 'accounting-finance', 4, 'Botble\\JobBoard\\Models\\Category', 'job-categories', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(51, 'construction-facilities', 5, 'Botble\\JobBoard\\Models\\Category', 'job-categories', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(52, 'tele-communications', 6, 'Botble\\JobBoard\\Models\\Category', 'job-categories', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(53, 'design-multimedia', 7, 'Botble\\JobBoard\\Models\\Category', 'job-categories', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(54, 'human-resource', 8, 'Botble\\JobBoard\\Models\\Category', 'job-categories', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(55, 'consumer-packaged-goods-cpg', 9, 'Botble\\JobBoard\\Models\\Category', 'job-categories', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(56, 'manufacturing', 10, 'Botble\\JobBoard\\Models\\Category', 'job-categories', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(57, 'retail', 11, 'Botble\\JobBoard\\Models\\Category', 'job-categories', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(58, 'distributionlogistics', 12, 'Botble\\JobBoard\\Models\\Category', 'job-categories', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(59, 'supply-chain-operations', 13, 'Botble\\JobBoard\\Models\\Category', 'job-categories', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(60, 'healthcare-medical', 14, 'Botble\\JobBoard\\Models\\Category', 'job-categories', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(61, 'procurement-sourcing', 15, 'Botble\\JobBoard\\Models\\Category', 'job-categories', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(62, 'information-technology-it', 16, 'Botble\\JobBoard\\Models\\Category', 'job-categories', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(63, 'salesbusiness-development', 17, 'Botble\\JobBoard\\Models\\Category', 'job-categories', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(64, 'legal-professional-services', 18, 'Botble\\JobBoard\\Models\\Category', 'job-categories', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(65, 'life-sciences-healthcare', 19, 'Botble\\JobBoard\\Models\\Category', 'job-categories', '2023-07-10 00:34:54', '2023-07-10 00:34:54'),
(66, 'pinterest', 1, 'Botble\\JobBoard\\Models\\Company', 'companies', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(67, 'linkedin', 2, 'Botble\\JobBoard\\Models\\Company', 'companies', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(68, 'line', 3, 'Botble\\JobBoard\\Models\\Company', 'companies', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(69, 'uber', 4, 'Botble\\JobBoard\\Models\\Company', 'companies', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(70, 'flutter', 5, 'Botble\\JobBoard\\Models\\Company', 'companies', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(71, 'behance', 6, 'Botble\\JobBoard\\Models\\Company', 'companies', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(72, 'apple', 7, 'Botble\\JobBoard\\Models\\Company', 'companies', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(73, 'adobe', 8, 'Botble\\JobBoard\\Models\\Company', 'companies', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(74, 'vibe', 9, 'Botble\\JobBoard\\Models\\Company', 'companies', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(75, 'vkontakte', 10, 'Botble\\JobBoard\\Models\\Company', 'companies', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(76, 'wordpress', 11, 'Botble\\JobBoard\\Models\\Company', 'companies', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(77, 'envato', 12, 'Botble\\JobBoard\\Models\\Company', 'companies', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(78, 'magento', 13, 'Botble\\JobBoard\\Models\\Company', 'companies', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(79, 'generic', 14, 'Botble\\JobBoard\\Models\\Company', 'companies', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(82, 'illustrator', 1, 'Botble\\JobBoard\\Models\\Tag', 'job-tags', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(83, 'adobe-xd', 2, 'Botble\\JobBoard\\Models\\Tag', 'job-tags', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(84, 'figma', 3, 'Botble\\JobBoard\\Models\\Tag', 'job-tags', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(85, 'sketch', 4, 'Botble\\JobBoard\\Models\\Tag', 'job-tags', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(86, 'lunacy', 5, 'Botble\\JobBoard\\Models\\Tag', 'job-tags', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(87, 'php', 6, 'Botble\\JobBoard\\Models\\Tag', 'job-tags', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(88, 'python', 7, 'Botble\\JobBoard\\Models\\Tag', 'job-tags', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(89, 'javascript', 8, 'Botble\\JobBoard\\Models\\Tag', 'job-tags', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(90, 'ui-ux-designer-full-time', 1, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(91, 'full-stack-engineer', 2, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(92, 'java-software-engineer', 3, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(93, 'digital-marketing-manager', 4, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(94, 'frontend-developer', 5, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(95, 'react-native-web-developer', 6, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(96, 'senior-system-engineer', 7, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(97, 'products-manager', 8, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(98, 'lead-quality-control-qa', 9, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(99, 'principal-designer-design-systems', 10, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(100, 'devops-architect', 11, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(101, 'senior-software-engineer-npm-cli', 12, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(102, 'senior-systems-engineer', 13, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(103, 'software-engineer-actions-platform', 14, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(104, 'staff-engineering-manager-actions', 15, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(105, 'staff-engineering-manager-actions-runtime', 16, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(106, 'staff-engineering-manager-packages', 17, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(107, 'staff-software-engineer', 18, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(108, 'systems-software-engineer', 19, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(109, 'senior-compensation-analyst', 20, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(110, 'senior-accessibility-program-manager', 21, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(111, 'analyst-relations-manager-application-security', 22, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(112, 'senior-enterprise-advocate-emea', 23, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(113, 'deal-desk-manager', 24, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(114, 'director-revenue-compensation', 25, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(115, 'program-manager', 26, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(116, 'sr-manager-deal-desk-intl', 27, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(117, 'senior-director-product-management-actions-runners-and-compute-services', 28, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(118, 'alliances-director', 29, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(119, 'corporate-sales-representative', 30, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(120, 'country-leader', 31, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(121, 'customer-success-architect', 32, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(122, 'devops-account-executive-us-public-sector', 33, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(123, 'enterprise-account-executive', 34, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(124, 'senior-engineering-manager-product-security-engineering-paved-paths', 35, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(125, 'customer-reliability-engineer-iii', 36, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(126, 'support-engineer-enterprise-support-japanese', 37, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(127, 'technical-partner-manager', 38, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(128, 'sr-manager-inside-account-management', 39, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(129, 'services-sales-representative', 40, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(130, 'services-delivery-manager', 41, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:55', '2023-07-10 00:34:55'),
(131, 'senior-solutions-engineer', 42, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:56', '2023-07-10 00:34:56'),
(132, 'senior-service-delivery-engineer', 43, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:56', '2023-07-10 00:34:56'),
(133, 'senior-director-global-sales-development', 44, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:56', '2023-07-10 00:34:56'),
(134, 'partner-program-manager', 45, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:56', '2023-07-10 00:34:56'),
(135, 'principal-cloud-solutions-engineer', 46, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:56', '2023-07-10 00:34:56'),
(136, 'senior-cloud-solutions-engineer', 47, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:56', '2023-07-10 00:34:56'),
(137, 'senior-customer-success-manager', 48, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:56', '2023-07-10 00:34:56'),
(138, 'inside-account-manager', 49, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:56', '2023-07-10 00:34:56'),
(139, 'ux-jobs-board', 50, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:56', '2023-07-10 00:34:56'),
(140, 'senior-laravel-developer-tall-stack', 51, 'Botble\\JobBoard\\Models\\Job', 'jobs', '2023-07-10 00:34:56', '2023-07-10 00:34:56'),
(141, 'gilda-quitzon', 1, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:56', '2023-07-10 00:34:56'),
(142, 'jocelyn-keebler', 2, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:56', '2023-07-10 00:34:56'),
(143, 'sarah-harding', 3, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:56', '2023-07-10 00:34:56'),
(144, 'steven-jobs', 4, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(145, 'william-kennedy', 5, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(146, 'maddison-brekke', 6, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(147, 'sheridan-ziemann', 7, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(148, 'tre-smith', 8, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(149, 'edgardo-marquardt', 9, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(150, 'glenda-mann', 10, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(151, 'reyes-abernathy', 11, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(152, 'anne-gulgowski', 12, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(153, 'meredith-kemmer', 13, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(154, 'mossie-breitenberg', 14, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(155, 'arch-dibbert', 15, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(156, 'antonio-robel', 16, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(157, 'idell-hodkiewicz', 17, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(158, 'daren-kirlin', 18, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(159, 'maurice-spencer', 19, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:57', '2023-07-10 00:34:57'),
(160, 'amanda-roberts', 20, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(161, 'shane-satterfield', 21, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(162, 'wilfred-smith', 22, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(163, 'danika-berge', 23, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(164, 'maryjane-heller', 24, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(165, 'earnest-lueilwitz', 25, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(166, 'alysa-yundt', 26, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(167, 'geovanni-parisian', 27, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(168, 'dovie-paucek', 28, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(169, 'della-abshire', 29, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(170, 'bernita-mckenzie', 30, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(171, 'hannah-feil', 31, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(172, 'marcel-vandervort', 32, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(173, 'kale-boyer', 33, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(174, 'maddison-corkery', 34, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(175, 'eric-donnelly', 35, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(176, 'richmond-runolfsdottir', 36, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:58', '2023-07-10 00:34:58'),
(177, 'kyla-kessler', 37, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(178, 'walter-mraz', 38, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(179, 'carissa-greenfelder', 39, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(180, 'annetta-lang', 40, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(181, 'alta-grady', 41, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(182, 'brittany-terry', 42, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(183, 'nicklaus-dietrich', 43, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(184, 'lia-runte', 44, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(185, 'keven-zulauf', 45, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(186, 'hyman-douglas', 46, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(187, 'ole-kub', 47, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(188, 'amelie-krajcik', 48, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(189, 'georgiana-runolfsson', 49, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(190, 'abdullah-zboncak', 50, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(191, 'zoila-rowe', 51, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:34:59', '2023-07-10 00:34:59'),
(192, 'tito-osinski', 52, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(193, 'adan-paucek', 53, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(194, 'jaron-schroeder', 54, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(195, 'katlyn-runte', 55, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(196, 'dahlia-senger', 56, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(197, 'lilliana-hilpert', 57, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(198, 'alycia-west', 58, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(199, 'dimitri-wisoky', 59, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(200, 'heaven-hayes', 60, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(201, 'aurelie-dietrich', 61, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(202, 'dexter-flatley', 62, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(203, 'misael-anderson', 63, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(204, 'breana-goldner', 64, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(205, 'edgar-cartwright', 65, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(206, 'ezekiel-gusikowski', 66, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:00', '2023-07-10 00:35:00'),
(207, 'ottilie-wilkinson', 67, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(208, 'lelia-white', 68, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(209, 'maurice-weber', 69, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(210, 'caesar-hansen', 70, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(211, 'hortense-huels', 71, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(212, 'fatima-zulauf', 72, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(213, 'abdul-nienow', 73, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(214, 'elwin-moen', 74, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(215, 'loren-farrell', 75, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(216, 'ubaldo-kessler', 76, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(217, 'velma-runolfsson', 77, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(218, 'erica-bartoletti', 78, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(219, 'mariam-gerhold', 79, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(220, 'constance-gusikowski', 80, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(221, 'jacinto-kovacek', 81, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(222, 'tyler-connelly', 82, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:01', '2023-07-10 00:35:01'),
(223, 'candice-kerluke', 83, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(224, 'lyric-bauch', 84, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(225, 'hattie-trantow', 85, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(226, 'karelle-hirthe', 86, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(227, 'aylin-weissnat', 87, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(228, 'jarod-kshlerin', 88, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(229, 'bobbie-ferry', 89, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(230, 'abbey-schaden', 90, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(231, 'demetris-hayes', 91, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(232, 'lera-armstrong', 92, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(233, 'noble-casper', 93, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(234, 'ezequiel-oreilly', 94, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(235, 'asia-will', 95, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(236, 'wendy-bahringer', 96, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(237, 'maggie-heidenreich', 97, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(238, 'elza-bode', 98, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:02', '2023-07-10 00:35:02'),
(239, 'dangelo-jacobs', 99, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(240, 'sammie-wolff', 100, 'Botble\\JobBoard\\Models\\Account', 'candidates', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(241, 'company-name', 17, 'Botble\\JobBoard\\Models\\Company', 'companies', '2023-10-23 05:14:36', '2023-10-23 05:14:36');

-- --------------------------------------------------------

--
-- Table structure for table `slugs_translations`
--

CREATE TABLE `slugs_translations` (
  `lang_code` varchar(191) NOT NULL,
  `slugs_id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `prefix` varchar(120) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `abbreviation` varchar(10) DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `abbreviation`, `country_id`, `order`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Alabama', 'AL', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(2, 'Alaska', 'AK', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(3, 'American Samoa', 'AS', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(4, 'Arizona', 'AZ', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(5, 'Arkansas', 'AR', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(6, 'California', 'CA', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(7, 'Colorado', 'CO', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(8, 'Connecticut', 'CT', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(9, 'Delaware', 'DE', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(10, 'District Of Columbia', 'DC', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(11, 'Federated States Of Micronesia', 'FM', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(12, 'Florida', 'FL', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(13, 'Georgia', 'GA', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(14, 'Guam', 'GU', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(15, 'Hawaii', 'HI', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(16, 'Idaho', 'ID', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(17, 'Illinois', 'IL', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(18, 'Indiana', 'IN', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(19, 'Iowa', 'IA', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(20, 'Kansas', 'KS', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(21, 'Kentucky', 'KY', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(22, 'Louisiana', 'LA', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(23, 'Maine', 'ME', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(24, 'Marshall Islands', 'MH', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(25, 'Maryland', 'MD', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(26, 'Massachusetts', 'MA', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(27, 'Michigan', 'MI', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(28, 'Minnesota', 'MN', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(29, 'Mississippi', 'MS', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(30, 'Missouri', 'MO', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(31, 'Montana', 'MT', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(32, 'Nebraska', 'NE', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(33, 'Nevada', 'NV', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(34, 'New Hampshire', 'NH', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(35, 'New Jersey', 'NJ', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(36, 'New Mexico', 'NM', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(37, 'New York', 'NY', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(38, 'North Carolina', 'NC', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(39, 'North Dakota', 'ND', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(40, 'Northern Mariana Islands', 'MP', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(41, 'Ohio', 'OH', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(42, 'Oklahoma', 'OK', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(43, 'Oregon', 'OR', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(44, 'Palau', 'PW', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(45, 'Pennsylvania', 'PA', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(46, 'Puerto Rico', 'PR', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(47, 'Rhode Island', 'RI', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(48, 'South Carolina', 'SC', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(49, 'South Dakota', 'SD', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(50, 'Tennessee', 'TN', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(51, 'Texas', 'TX', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(52, 'Utah', 'UT', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(53, 'Vermont', 'VT', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(54, 'Virgin Islands', 'VI', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(55, 'Virginia', 'VA', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(56, 'Washington', 'WA', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(57, 'West Virginia', 'WV', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(58, 'Wisconsin', 'WI', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53'),
(59, 'Wyoming', 'WY', 1, 0, 0, 'published', '2023-07-10 00:34:53', '2023-07-10 00:34:53');

-- --------------------------------------------------------

--
-- Table structure for table `states_translations`
--

CREATE TABLE `states_translations` (
  `lang_code` varchar(191) NOT NULL,
  `states_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `abbreviation` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `author_type` varchar(255) NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `description` varchar(400) DEFAULT '',
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `author_id`, `author_type`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'General', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2023-07-10 00:34:50', '2023-07-10 00:34:50'),
(2, 'Design', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2023-07-10 00:34:50', '2023-07-10 00:34:50'),
(3, 'Fashion', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2023-07-10 00:34:50', '2023-07-10 00:34:50'),
(4, 'Branding', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2023-07-10 00:34:50', '2023-07-10 00:34:50'),
(5, 'Modern', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2023-07-10 00:34:50', '2023-07-10 00:34:50');

-- --------------------------------------------------------

--
-- Table structure for table `tags_translations`
--

CREATE TABLE `tags_translations` (
  `lang_code` varchar(191) NOT NULL,
  `tags_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `company` varchar(120) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `content`, `image`, `company`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Jeffrey Montgomery', 'Very well thought out and articulate communication. Clear milestones, deadlines and fast work. Patience. Infinite patience. No shortcuts. Even if the client is being careless.', 'testimonials/1.png', 'Product Manager', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(2, 'Rebecca Swartz', 'Very well thought out and articulate communication. Clear milestones, deadlines and fast work. Patience. Infinite patience. No shortcuts. Even if the client is being careless.', 'testimonials/2.png', 'Creative Designer', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(3, 'Charles Dickens', 'Very well thought out and articulate communication. Clear milestones, deadlines and fast work. Patience. Infinite patience. No shortcuts. Even if the client is being careless.', 'testimonials/3.png', 'Store Assistant', 'published', '2023-07-10 00:35:03', '2023-07-10 00:35:03');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials_translations`
--

CREATE TABLE `testimonials_translations` (
  `lang_code` varchar(191) NOT NULL,
  `testimonials_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `company` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `locale` varchar(191) NOT NULL,
  `group` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'auth', 'failed', 'These credentials do not match our records.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(2, 1, 'en', 'auth', 'password', 'The provided password is incorrect.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(3, 1, 'en', 'auth', 'throttle', 'Too many login attempts. Please try again in :seconds seconds.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(4, 1, 'en', 'pagination', 'previous', '&laquo; Previous', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(5, 1, 'en', 'pagination', 'next', 'Next &raquo;', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(6, 1, 'en', 'passwords', 'reset', 'Your password has been reset!', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(7, 1, 'en', 'passwords', 'sent', 'We have emailed your password reset link!', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(8, 1, 'en', 'passwords', 'throttled', 'Please wait before retrying.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(9, 1, 'en', 'passwords', 'token', 'This password reset token is invalid.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(10, 1, 'en', 'passwords', 'user', 'We can\'t find a user with that email address.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(11, 1, 'en', 'validation', 'accepted', 'The :attribute must be accepted.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(12, 1, 'en', 'validation', 'accepted_if', 'The :attribute must be accepted when :other is :value.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(13, 1, 'en', 'validation', 'active_url', 'The :attribute is not a valid URL.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(14, 1, 'en', 'validation', 'after', 'The :attribute must be a date after :date.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(15, 1, 'en', 'validation', 'after_or_equal', 'The :attribute must be a date after or equal to :date.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(16, 1, 'en', 'validation', 'alpha', 'The :attribute must only contain letters.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(17, 1, 'en', 'validation', 'alpha_dash', 'The :attribute must only contain letters, numbers, dashes and underscores.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(18, 1, 'en', 'validation', 'alpha_num', 'The :attribute must only contain letters and numbers.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(19, 1, 'en', 'validation', 'array', 'The :attribute must be an array.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(20, 1, 'en', 'validation', 'before', 'The :attribute must be a date before :date.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(21, 1, 'en', 'validation', 'before_or_equal', 'The :attribute must be a date before or equal to :date.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(22, 1, 'en', 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(23, 1, 'en', 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(24, 1, 'en', 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(25, 1, 'en', 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(26, 1, 'en', 'validation', 'boolean', 'The :attribute field must be true or false.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(27, 1, 'en', 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(28, 1, 'en', 'validation', 'current_password', 'The password is incorrect.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(29, 1, 'en', 'validation', 'date', 'The :attribute is not a valid date.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(30, 1, 'en', 'validation', 'date_equals', 'The :attribute must be a date equal to :date.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(31, 1, 'en', 'validation', 'date_format', 'The :attribute does not match the format :format.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(32, 1, 'en', 'validation', 'declined', 'The :attribute must be declined.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(33, 1, 'en', 'validation', 'declined_if', 'The :attribute must be declined when :other is :value.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(34, 1, 'en', 'validation', 'different', 'The :attribute and :other must be different.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(35, 1, 'en', 'validation', 'digits', 'The :attribute must be :digits digits.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(36, 1, 'en', 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(37, 1, 'en', 'validation', 'dimensions', 'The :attribute has invalid image dimensions.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(38, 1, 'en', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(39, 1, 'en', 'validation', 'doesnt_start_with', 'The :attribute may not start with one of the following: :values.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(40, 1, 'en', 'validation', 'email', 'The :attribute must be a valid email address.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(41, 1, 'en', 'validation', 'ends_with', 'The :attribute must end with one of the following: :values.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(42, 1, 'en', 'validation', 'enum', 'The selected :attribute is invalid.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(43, 1, 'en', 'validation', 'exists', 'The selected :attribute is invalid.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(44, 1, 'en', 'validation', 'file', 'The :attribute must be a file.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(45, 1, 'en', 'validation', 'filled', 'The :attribute field must have a value.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(46, 1, 'en', 'validation', 'gt.array', 'The :attribute must have more than :value items.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(47, 1, 'en', 'validation', 'gt.file', 'The :attribute must be greater than :value kilobytes.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(48, 1, 'en', 'validation', 'gt.numeric', 'The :attribute must be greater than :value.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(49, 1, 'en', 'validation', 'gt.string', 'The :attribute must be greater than :value characters.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(50, 1, 'en', 'validation', 'gte.array', 'The :attribute must have :value items or more.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(51, 1, 'en', 'validation', 'gte.file', 'The :attribute must be greater than or equal to :value kilobytes.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(52, 1, 'en', 'validation', 'gte.numeric', 'The :attribute must be greater than or equal to :value.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(53, 1, 'en', 'validation', 'gte.string', 'The :attribute must be greater than or equal to :value characters.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(54, 1, 'en', 'validation', 'image', 'The :attribute must be an image.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(55, 1, 'en', 'validation', 'in', 'The selected :attribute is invalid.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(56, 1, 'en', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(57, 1, 'en', 'validation', 'integer', 'The :attribute must be an integer.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(58, 1, 'en', 'validation', 'ip', 'The :attribute must be a valid IP address.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(59, 1, 'en', 'validation', 'ipv4', 'The :attribute must be a valid IPv4 address.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(60, 1, 'en', 'validation', 'ipv6', 'The :attribute must be a valid IPv6 address.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(61, 1, 'en', 'validation', 'json', 'The :attribute must be a valid JSON string.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(62, 1, 'en', 'validation', 'lt.array', 'The :attribute must have less than :value items.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(63, 1, 'en', 'validation', 'lt.file', 'The :attribute must be less than :value kilobytes.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(64, 1, 'en', 'validation', 'lt.numeric', 'The :attribute must be less than :value.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(65, 1, 'en', 'validation', 'lt.string', 'The :attribute must be less than :value characters.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(66, 1, 'en', 'validation', 'lte.array', 'The :attribute must not have more than :value items.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(67, 1, 'en', 'validation', 'lte.file', 'The :attribute must be less than or equal to :value kilobytes.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(68, 1, 'en', 'validation', 'lte.numeric', 'The :attribute must be less than or equal to :value.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(69, 1, 'en', 'validation', 'lte.string', 'The :attribute must be less than or equal to :value characters.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(70, 1, 'en', 'validation', 'mac_address', 'The :attribute must be a valid MAC address.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(71, 1, 'en', 'validation', 'max.array', 'The :attribute must not have more than :max items.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(72, 1, 'en', 'validation', 'max.file', 'The :attribute must not be greater than :max kilobytes.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(73, 1, 'en', 'validation', 'max.numeric', 'The :attribute must not be greater than :max.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(74, 1, 'en', 'validation', 'max.string', 'The :attribute must not be greater than :max characters.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(75, 1, 'en', 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(76, 1, 'en', 'validation', 'mimetypes', 'The :attribute must be a file of type: :values.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(77, 1, 'en', 'validation', 'min.array', 'The :attribute must have at least :min items.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(78, 1, 'en', 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(79, 1, 'en', 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(80, 1, 'en', 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(81, 1, 'en', 'validation', 'multiple_of', 'The :attribute must be a multiple of :value.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(82, 1, 'en', 'validation', 'not_in', 'The selected :attribute is invalid.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(83, 1, 'en', 'validation', 'not_regex', 'The :attribute format is invalid.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(84, 1, 'en', 'validation', 'numeric', 'The :attribute must be a number.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(85, 1, 'en', 'validation', 'password.letters', 'The :attribute must contain at least one letter.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(86, 1, 'en', 'validation', 'password.mixed', 'The :attribute must contain at least one uppercase and one lowercase letter.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(87, 1, 'en', 'validation', 'password.numbers', 'The :attribute must contain at least one number.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(88, 1, 'en', 'validation', 'password.symbols', 'The :attribute must contain at least one symbol.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(89, 1, 'en', 'validation', 'password.uncompromised', 'The given :attribute has appeared in a data leak. Please choose a different :attribute.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(90, 1, 'en', 'validation', 'present', 'The :attribute field must be present.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(91, 1, 'en', 'validation', 'prohibited', 'The :attribute field is prohibited.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(92, 1, 'en', 'validation', 'prohibited_if', 'The :attribute field is prohibited when :other is :value.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(93, 1, 'en', 'validation', 'prohibited_unless', 'The :attribute field is prohibited unless :other is in :values.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(94, 1, 'en', 'validation', 'prohibits', 'The :attribute field prohibits :other from being present.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(95, 1, 'en', 'validation', 'regex', 'The :attribute format is invalid.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(96, 1, 'en', 'validation', 'required', 'The :attribute field is required.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(97, 1, 'en', 'validation', 'required_array_keys', 'The :attribute field must contain entries for: :values.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(98, 1, 'en', 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(99, 1, 'en', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(100, 1, 'en', 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(101, 1, 'en', 'validation', 'required_with_all', 'The :attribute field is required when :values are present.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(102, 1, 'en', 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(103, 1, 'en', 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(104, 1, 'en', 'validation', 'same', 'The :attribute and :other must match.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(105, 1, 'en', 'validation', 'size.array', 'The :attribute must contain :size items.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(106, 1, 'en', 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(107, 1, 'en', 'validation', 'size.numeric', 'The :attribute must be :size.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(108, 1, 'en', 'validation', 'size.string', 'The :attribute must be :size characters.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(109, 1, 'en', 'validation', 'starts_with', 'The :attribute must start with one of the following: :values.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(110, 1, 'en', 'validation', 'string', 'The :attribute must be a string.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(111, 1, 'en', 'validation', 'timezone', 'The :attribute must be a valid timezone.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(112, 1, 'en', 'validation', 'unique', 'The :attribute has already been taken.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(113, 1, 'en', 'validation', 'uploaded', 'The :attribute failed to upload.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(114, 1, 'en', 'validation', 'url', 'The :attribute must be a valid URL.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(115, 1, 'en', 'validation', 'uuid', 'The :attribute must be a valid UUID.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(116, 1, 'en', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(117, 1, 'en', 'core/acl/auth', 'login.username', 'Email/Username', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(118, 1, 'en', 'core/acl/auth', 'login.email', 'Email', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(119, 1, 'en', 'core/acl/auth', 'login.password', 'Password', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(120, 1, 'en', 'core/acl/auth', 'login.title', 'User Login', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(121, 1, 'en', 'core/acl/auth', 'login.remember', 'Remember me?', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(122, 1, 'en', 'core/acl/auth', 'login.login', 'Sign in', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(123, 1, 'en', 'core/acl/auth', 'login.placeholder.username', 'Please enter your username', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(124, 1, 'en', 'core/acl/auth', 'login.placeholder.email', 'Please enter your email', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(125, 1, 'en', 'core/acl/auth', 'login.success', 'Login successfully!', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(126, 1, 'en', 'core/acl/auth', 'login.fail', 'Wrong username or password.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(127, 1, 'en', 'core/acl/auth', 'login.not_active', 'Your account has not been activated yet!', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(128, 1, 'en', 'core/acl/auth', 'login.banned', 'This account is banned.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(129, 1, 'en', 'core/acl/auth', 'login.logout_success', 'Logout successfully!', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(130, 1, 'en', 'core/acl/auth', 'login.dont_have_account', 'You don\'t have account on this system, please contact administrator for more information!', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(131, 1, 'en', 'core/acl/auth', 'forgot_password.title', 'Forgot Password', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(132, 1, 'en', 'core/acl/auth', 'forgot_password.message', '<p>Have you forgotten your password?</p><p>Please enter your email account. System will send a email with active link to reset your password.</p>', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(133, 1, 'en', 'core/acl/auth', 'forgot_password.submit', 'Submit', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(134, 1, 'en', 'core/acl/auth', 'reset.new_password', 'New password', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(135, 1, 'en', 'core/acl/auth', 'reset.password_confirmation', 'Confirm new password', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(136, 1, 'en', 'core/acl/auth', 'reset.email', 'Email', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(137, 1, 'en', 'core/acl/auth', 'reset.title', 'Reset your password', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(138, 1, 'en', 'core/acl/auth', 'reset.update', 'Update', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(139, 1, 'en', 'core/acl/auth', 'reset.wrong_token', 'This link is invalid or expired. Please try using reset form again.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(140, 1, 'en', 'core/acl/auth', 'reset.user_not_found', 'This username is not exist.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(141, 1, 'en', 'core/acl/auth', 'reset.success', 'Reset password successfully!', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(142, 1, 'en', 'core/acl/auth', 'reset.fail', 'Token is invalid, the reset password link has been expired!', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(143, 1, 'en', 'core/acl/auth', 'reset.reset.title', 'Email reset password', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(144, 1, 'en', 'core/acl/auth', 'reset.send.success', 'A email was sent to your email account. Please check and complete this action.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(145, 1, 'en', 'core/acl/auth', 'reset.send.fail', 'Can not send email in this time. Please try again later.', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(146, 1, 'en', 'core/acl/auth', 'reset.new-password', 'New password', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(147, 1, 'en', 'core/acl/auth', 'email.reminder.title', 'Email reset password', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(148, 1, 'en', 'core/acl/auth', 'password_confirmation', 'Password confirm', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(149, 1, 'en', 'core/acl/auth', 'failed', 'Failed', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(150, 1, 'en', 'core/acl/auth', 'throttle', 'Throttle', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(151, 1, 'en', 'core/acl/auth', 'not_member', 'Not a member yet?', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(152, 1, 'en', 'core/acl/auth', 'register_now', 'Register now', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(153, 1, 'en', 'core/acl/auth', 'lost_your_password', 'Lost your password?', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(154, 1, 'en', 'core/acl/auth', 'login_title', 'Admin', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(155, 1, 'en', 'core/acl/auth', 'login_via_social', 'Login with social networks', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(156, 1, 'en', 'core/acl/auth', 'back_to_login', 'Back to login page', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(157, 1, 'en', 'core/acl/auth', 'sign_in_below', 'Sign In Below', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(158, 1, 'en', 'core/acl/auth', 'languages', 'Languages', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(159, 1, 'en', 'core/acl/auth', 'reset_password', 'Reset Password', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(160, 1, 'en', 'core/acl/auth', 'settings.email.title', 'ACL', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(161, 1, 'en', 'core/acl/auth', 'settings.email.description', 'ACL email configuration', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(162, 1, 'en', 'core/acl/permissions', 'notices.role_in_use', 'Cannot delete this role, it is still in use!', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(163, 1, 'en', 'core/acl/permissions', 'notices.role_delete_belong_user', 'You are not able to delete this role; it belongs to someone else!', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(164, 1, 'en', 'core/acl/permissions', 'notices.role_edit_belong_user', 'You are not able to edit this role; it belongs to someone else!', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(165, 1, 'en', 'core/acl/permissions', 'notices.delete_global_role', 'You are not allowed to delete global roles!', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(166, 1, 'en', 'core/acl/permissions', 'notices.delete_success', 'The selected role was deleted successfully!', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(167, 1, 'en', 'core/acl/permissions', 'notices.modified_success', 'The selected role was modified successfully!', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(168, 1, 'en', 'core/acl/permissions', 'notices.create_success', 'The new role was successfully created', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(169, 1, 'en', 'core/acl/permissions', 'notices.duplicated_success', 'The selected role was duplicated successfully', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(170, 1, 'en', 'core/acl/permissions', 'notices.no_select', 'Please select at least one record to take this action!', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(171, 1, 'en', 'core/acl/permissions', 'notices.not_found', 'Role not found', '2023-07-10 00:35:03', '2023-07-10 00:35:03'),
(172, 1, 'en', 'core/acl/permissions', 'name', 'Name', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(173, 1, 'en', 'core/acl/permissions', 'current_role', 'Current Role', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(174, 1, 'en', 'core/acl/permissions', 'no_role_assigned', 'No role assigned', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(175, 1, 'en', 'core/acl/permissions', 'role_assigned', 'Assigned Role', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(176, 1, 'en', 'core/acl/permissions', 'create_role', 'Create New Role', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(177, 1, 'en', 'core/acl/permissions', 'role_name', 'Name', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(178, 1, 'en', 'core/acl/permissions', 'role_description', 'Description', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(179, 1, 'en', 'core/acl/permissions', 'permission_flags', 'Permission Flags', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(180, 1, 'en', 'core/acl/permissions', 'cancel', 'Cancel', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(181, 1, 'en', 'core/acl/permissions', 'reset', 'Reset', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(182, 1, 'en', 'core/acl/permissions', 'save', 'Save', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(183, 1, 'en', 'core/acl/permissions', 'global_role_msg', 'This is a global role and cannot be modified.  You can use the Duplicate button to make a copy of this role that you can then modify.', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(184, 1, 'en', 'core/acl/permissions', 'details', 'Details', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(185, 1, 'en', 'core/acl/permissions', 'duplicate', 'Duplicate', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(186, 1, 'en', 'core/acl/permissions', 'all', 'All Permissions', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(187, 1, 'en', 'core/acl/permissions', 'list_role', 'List Roles', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(188, 1, 'en', 'core/acl/permissions', 'created_on', 'Created On', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(189, 1, 'en', 'core/acl/permissions', 'created_by', 'Created By', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(190, 1, 'en', 'core/acl/permissions', 'actions', 'Actions', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(191, 1, 'en', 'core/acl/permissions', 'role_in_use', 'Cannot delete this role, it is still in use!', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(192, 1, 'en', 'core/acl/permissions', 'role_delete_belong_user', 'You are not able to delete this role; it belongs to someone else!', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(193, 1, 'en', 'core/acl/permissions', 'delete_global_role', 'Can not delete global role', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(194, 1, 'en', 'core/acl/permissions', 'delete_success', 'Delete role successfully', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(195, 1, 'en', 'core/acl/permissions', 'no_select', 'Please select at least one role to take this action!', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(196, 1, 'en', 'core/acl/permissions', 'not_found', 'No role found!', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(197, 1, 'en', 'core/acl/permissions', 'role_edit_belong_user', 'You are not able to edit this role; it belongs to someone else!', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(198, 1, 'en', 'core/acl/permissions', 'modified_success', 'Modified successfully', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(199, 1, 'en', 'core/acl/permissions', 'create_success', 'Create successfully', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(200, 1, 'en', 'core/acl/permissions', 'duplicated_success', 'Duplicated successfully', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(201, 1, 'en', 'core/acl/permissions', 'options', 'Options', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(202, 1, 'en', 'core/acl/permissions', 'access_denied_message', 'You are not allowed to do this action', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(203, 1, 'en', 'core/acl/permissions', 'roles', 'Roles', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(204, 1, 'en', 'core/acl/permissions', 'role_permission', 'Roles and Permissions', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(205, 1, 'en', 'core/acl/permissions', 'user_management', 'User Management', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(206, 1, 'en', 'core/acl/permissions', 'super_user_management', 'Super User Management', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(207, 1, 'en', 'core/acl/permissions', 'action_unauthorized', 'This action is unauthorized.', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(208, 1, 'en', 'core/acl/users', 'delete_user_logged_in', 'Can\'t delete this user. This user is logged on!', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(209, 1, 'en', 'core/acl/users', 'no_select', 'Please select at least one record to take this action!', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(210, 1, 'en', 'core/acl/users', 'lock_user_logged_in', 'Can\'t lock this user. This user is logged on!', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(211, 1, 'en', 'core/acl/users', 'update_success', 'Update status successfully!', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(212, 1, 'en', 'core/acl/users', 'save_setting_failed', 'Something went wrong when save your setting', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(213, 1, 'en', 'core/acl/users', 'not_found', 'User not found', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(214, 1, 'en', 'core/acl/users', 'email_exist', 'That email address already belongs to an existing account', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(215, 1, 'en', 'core/acl/users', 'username_exist', 'That username address already belongs to an existing account', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(216, 1, 'en', 'core/acl/users', 'update_profile_success', 'Your profile changes were successfully saved', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(217, 1, 'en', 'core/acl/users', 'password_update_success', 'Password successfully changed', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(218, 1, 'en', 'core/acl/users', 'current_password_not_valid', 'Current password is not valid', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(219, 1, 'en', 'core/acl/users', 'user_exist_in', 'User is already a member', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(220, 1, 'en', 'core/acl/users', 'email', 'Email', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(221, 1, 'en', 'core/acl/users', 'role', 'Role', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(222, 1, 'en', 'core/acl/users', 'username', 'Username', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(223, 1, 'en', 'core/acl/users', 'last_name', 'Last Name', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(224, 1, 'en', 'core/acl/users', 'first_name', 'First Name', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(225, 1, 'en', 'core/acl/users', 'message', 'Message', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(226, 1, 'en', 'core/acl/users', 'cancel_btn', 'Cancel', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(227, 1, 'en', 'core/acl/users', 'change_password', 'Change password', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(228, 1, 'en', 'core/acl/users', 'current_password', 'Current password', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(229, 1, 'en', 'core/acl/users', 'new_password', 'New Password', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(230, 1, 'en', 'core/acl/users', 'confirm_new_password', 'Confirm New Password', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(231, 1, 'en', 'core/acl/users', 'password', 'Password', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(232, 1, 'en', 'core/acl/users', 'save', 'Save', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(233, 1, 'en', 'core/acl/users', 'cannot_delete', 'User could not be deleted', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(234, 1, 'en', 'core/acl/users', 'deleted', 'User deleted', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(235, 1, 'en', 'core/acl/users', 'last_login', 'Last Login', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(236, 1, 'en', 'core/acl/users', 'error_update_profile_image', 'Error when update profile image', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(237, 1, 'en', 'core/acl/users', 'email_reminder_template', '<h3>Hello :name</h3><p>The system has received a request to restore the password for your account, to complete this task please click the link below.</p><p><a href=\":link\">Reset password now</a></p><p>If not you ask recover password, please ignore this email.</p><p>This email is valid for 60 minutes after receiving the email.</p>', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(238, 1, 'en', 'core/acl/users', 'change_profile_image', 'Change Profile Image', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(239, 1, 'en', 'core/acl/users', 'new_image', 'New Image', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(240, 1, 'en', 'core/acl/users', 'loading', 'Loading', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(241, 1, 'en', 'core/acl/users', 'close', 'Close', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(242, 1, 'en', 'core/acl/users', 'update', 'Update', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(243, 1, 'en', 'core/acl/users', 'read_image_failed', 'Failed to read the image file', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(244, 1, 'en', 'core/acl/users', 'users', 'Users', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(245, 1, 'en', 'core/acl/users', 'update_avatar_success', 'Update profile image successfully!', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(246, 1, 'en', 'core/acl/users', 'info.title', 'User profile', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(247, 1, 'en', 'core/acl/users', 'info.first_name', 'First Name', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(248, 1, 'en', 'core/acl/users', 'info.last_name', 'Last Name', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(249, 1, 'en', 'core/acl/users', 'total_users', 'Total users', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(250, 1, 'en', 'core/acl/users', 'statuses.activated', 'Activated', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(251, 1, 'en', 'core/acl/users', 'statuses.deactivated', 'Deactivated', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(252, 1, 'en', 'core/acl/users', 'make_super', 'Make super', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(253, 1, 'en', 'core/acl/users', 'remove_super', 'Remove super', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(254, 1, 'en', 'core/acl/users', 'is_super', 'Is super?', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(255, 1, 'en', 'core/acl/users', 'email_placeholder', 'Ex: example@gmail.com', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(256, 1, 'en', 'core/acl/users', 'password_confirmation', 'Re-type password', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(257, 1, 'en', 'core/acl/users', 'select_role', 'Select role', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(258, 1, 'en', 'core/acl/users', 'create_new_user', 'Create a new user', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(259, 1, 'en', 'core/acl/users', 'cannot_delete_super_user', 'Permission denied. Cannot delete a super user!', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(260, 1, 'en', 'core/acl/users', 'assigned_role', 'Assigned Role', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(261, 1, 'en', 'core/acl/users', 'no_role_assigned', 'No role assigned', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(262, 1, 'en', 'core/acl/users', 'view_user_profile', 'View user\'s profile', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(263, 1, 'en', 'core/base/base', 'yes', 'Yes', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(264, 1, 'en', 'core/base/base', 'no', 'No', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(265, 1, 'en', 'core/base/base', 'is_default', 'Is default?', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(266, 1, 'en', 'core/base/base', 'proc_close_disabled_error', 'Function proc_close() is disabled. Please contact your hosting provider to enable\n    it. Or you can add to .env: CAN_EXECUTE_COMMAND=false to disable this feature.', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(267, 1, 'en', 'core/base/base', 'email_template.header', 'Email template header', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(268, 1, 'en', 'core/base/base', 'email_template.footer', 'Email template footer', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(269, 1, 'en', 'core/base/base', 'email_template.site_title', 'Site title', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(270, 1, 'en', 'core/base/base', 'email_template.site_url', 'Site URL', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(271, 1, 'en', 'core/base/base', 'email_template.site_logo', 'Site Logo', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(272, 1, 'en', 'core/base/base', 'email_template.date_time', 'Current date time', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(273, 1, 'en', 'core/base/base', 'email_template.date_year', 'Current year', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(274, 1, 'en', 'core/base/base', 'email_template.site_admin_email', 'Site admin email', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(275, 1, 'en', 'core/base/base', 'change_image', 'Change image', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(276, 1, 'en', 'core/base/base', 'delete_image', 'Delete image', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(277, 1, 'en', 'core/base/base', 'preview_image', 'Preview image', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(278, 1, 'en', 'core/base/base', 'image', 'Image', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(279, 1, 'en', 'core/base/base', 'using_button', 'Using button', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(280, 1, 'en', 'core/base/base', 'select_image', 'Select image', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(281, 1, 'en', 'core/base/base', 'to_add_more_image', 'to add more images', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(282, 1, 'en', 'core/base/base', 'add_image', 'Add image', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(283, 1, 'en', 'core/base/base', 'tools', 'Tools', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(284, 1, 'en', 'core/base/cache', 'cache_management', 'Cache management', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(285, 1, 'en', 'core/base/cache', 'cache_commands', 'Clear cache commands', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(286, 1, 'en', 'core/base/cache', 'commands.clear_cms_cache.title', 'Clear all CMS cache', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(287, 1, 'en', 'core/base/cache', 'commands.clear_cms_cache.description', 'Clear CMS caching: database caching, static blocks... Run this command when you don\'t see the changes after updating data.', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(288, 1, 'en', 'core/base/cache', 'commands.clear_cms_cache.success_msg', 'Cache cleaned', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(289, 1, 'en', 'core/base/cache', 'commands.refresh_compiled_views.title', 'Refresh compiled views', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(290, 1, 'en', 'core/base/cache', 'commands.refresh_compiled_views.description', 'Clear compiled views to make views up to date.', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(291, 1, 'en', 'core/base/cache', 'commands.refresh_compiled_views.success_msg', 'Cache view refreshed', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(292, 1, 'en', 'core/base/cache', 'commands.clear_config_cache.title', 'Clear config cache', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(293, 1, 'en', 'core/base/cache', 'commands.clear_config_cache.description', 'You might need to refresh the config caching when you change something on production environment.', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(294, 1, 'en', 'core/base/cache', 'commands.clear_config_cache.success_msg', 'Config cache cleaned', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(295, 1, 'en', 'core/base/cache', 'commands.clear_route_cache.title', 'Clear route cache', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(296, 1, 'en', 'core/base/cache', 'commands.clear_route_cache.description', 'Clear cache routing.', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(297, 1, 'en', 'core/base/cache', 'commands.clear_route_cache.success_msg', 'The route cache has been cleaned', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(298, 1, 'en', 'core/base/cache', 'commands.clear_log.title', 'Clear log', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(299, 1, 'en', 'core/base/cache', 'commands.clear_log.description', 'Clear system log files', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(300, 1, 'en', 'core/base/cache', 'commands.clear_log.success_msg', 'The system log has been cleaned', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(301, 1, 'en', 'core/base/enums', 'statuses.draft', 'Draft', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(302, 1, 'en', 'core/base/enums', 'statuses.pending', 'Pending', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(303, 1, 'en', 'core/base/enums', 'statuses.published', 'Published', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(304, 1, 'en', 'core/base/errors', '401_title', 'Permission Denied', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(305, 1, 'en', 'core/base/errors', '401_msg', '<li>You have not been granted access to the section by the administrator.</li>\n	                <li>You may have the wrong account type.</li>\n	                <li>You are not authorized to view the requested resource.</li>\n	                <li>Your subscription may have expired.</li>', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(306, 1, 'en', 'core/base/errors', '404_title', 'Page could not be found', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(307, 1, 'en', 'core/base/errors', '404_msg', '<li>The page you requested does not exist.</li>\n	                <li>The link you clicked is no longer.</li>\n	                <li>The page may have moved to a new location.</li>\n	                <li>An error may have occurred.</li>\n	                <li>You are not authorized to view the requested resource.</li>', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(308, 1, 'en', 'core/base/errors', '500_title', 'Page could not be loaded', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(309, 1, 'en', 'core/base/errors', '500_msg', '<li>The page you requested does not exist.</li>\n	                <li>The link you clicked is no longer.</li>\n	                <li>The page may have moved to a new location.</li>\n	                <li>An error may have occurred.</li>\n	                <li>You are not authorized to view the requested resource.</li>', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(310, 1, 'en', 'core/base/errors', 'reasons', 'This may have occurred because of several reasons', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(311, 1, 'en', 'core/base/errors', 'try_again', 'Please try again in a few minutes, or alternatively return to the homepage by <a href=\":link\">clicking here</a>.', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(312, 1, 'en', 'core/base/errors', 'not_found', 'Not Found', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(313, 1, 'en', 'core/base/errors', 'results_not_found', 'Results not found!', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(314, 1, 'en', 'core/base/forms', 'choose_image', 'Choose image', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(315, 1, 'en', 'core/base/forms', 'actions', 'Actions', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(316, 1, 'en', 'core/base/forms', 'save', 'Save & Exit', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(317, 1, 'en', 'core/base/forms', 'save_and_continue', 'Save', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(318, 1, 'en', 'core/base/forms', 'image', 'Image', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(319, 1, 'en', 'core/base/forms', 'image_placeholder', 'Insert path of image or click upload button', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(320, 1, 'en', 'core/base/forms', 'create', 'Create', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(321, 1, 'en', 'core/base/forms', 'edit', 'Edit', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(322, 1, 'en', 'core/base/forms', 'permalink', 'Permalink', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(323, 1, 'en', 'core/base/forms', 'ok', 'OK', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(324, 1, 'en', 'core/base/forms', 'cancel', 'Cancel', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(325, 1, 'en', 'core/base/forms', 'character_remain', 'character(s) remain', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(326, 1, 'en', 'core/base/forms', 'template', 'Template', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(327, 1, 'en', 'core/base/forms', 'choose_file', 'Choose file', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(328, 1, 'en', 'core/base/forms', 'file', 'File', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(329, 1, 'en', 'core/base/forms', 'content', 'Content', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(330, 1, 'en', 'core/base/forms', 'description', 'Description', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(331, 1, 'en', 'core/base/forms', 'name', 'Name', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(332, 1, 'en', 'core/base/forms', 'slug', 'Slug', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(333, 1, 'en', 'core/base/forms', 'title', 'Title', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(334, 1, 'en', 'core/base/forms', 'value', 'Value', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(335, 1, 'en', 'core/base/forms', 'name_placeholder', 'Name', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(336, 1, 'en', 'core/base/forms', 'alias_placeholder', 'Alias', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(337, 1, 'en', 'core/base/forms', 'description_placeholder', 'Short description', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(338, 1, 'en', 'core/base/forms', 'parent', 'Parent', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(339, 1, 'en', 'core/base/forms', 'icon', 'Icon', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(340, 1, 'en', 'core/base/forms', 'icon_placeholder', 'Ex: fa fa-home', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(341, 1, 'en', 'core/base/forms', 'order_by', 'Order by', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(342, 1, 'en', 'core/base/forms', 'order_by_placeholder', 'Order by', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(343, 1, 'en', 'core/base/forms', 'is_featured', 'Is featured?', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(344, 1, 'en', 'core/base/forms', 'is_default', 'Is default?', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(345, 1, 'en', 'core/base/forms', 'update', 'Update', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(346, 1, 'en', 'core/base/forms', 'publish', 'Publish', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(347, 1, 'en', 'core/base/forms', 'remove_image', 'Remove image', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(348, 1, 'en', 'core/base/forms', 'remove_file', 'Remove file', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(349, 1, 'en', 'core/base/forms', 'order', 'Order', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(350, 1, 'en', 'core/base/forms', 'alias', 'Alias', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(351, 1, 'en', 'core/base/forms', 'basic_information', 'Basic information', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(352, 1, 'en', 'core/base/forms', 'short_code', 'Shortcode', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(353, 1, 'en', 'core/base/forms', 'add_short_code', 'Add a shortcode', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(354, 1, 'en', 'core/base/forms', 'add', 'Add', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(355, 1, 'en', 'core/base/forms', 'link', 'Link', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(356, 1, 'en', 'core/base/forms', 'show_hide_editor', 'Show/Hide Editor', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(357, 1, 'en', 'core/base/forms', 'basic_info_title', 'Basic information', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(358, 1, 'en', 'core/base/forms', 'expand_all', 'Expand all', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(359, 1, 'en', 'core/base/forms', 'collapse_all', 'Collapse all', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(360, 1, 'en', 'core/base/forms', 'view_new_tab', 'Open in new tab', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(361, 1, 'en', 'core/base/forms', 'view_preview_image', 'View preview image', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(362, 1, 'en', 'core/base/forms', 'edit_item', 'Edit \":name\"', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(363, 1, 'en', 'core/base/layouts', 'platform_admin', 'Platform Administration', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(364, 1, 'en', 'core/base/layouts', 'dashboard', 'Dashboard', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(365, 1, 'en', 'core/base/layouts', 'widgets', 'Widgets', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(366, 1, 'en', 'core/base/layouts', 'plugins', 'Plugins', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(367, 1, 'en', 'core/base/layouts', 'settings', 'Settings', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(368, 1, 'en', 'core/base/layouts', 'setting_general', 'General', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(369, 1, 'en', 'core/base/layouts', 'setting_email', 'Email', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(370, 1, 'en', 'core/base/layouts', 'system_information', 'System information', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(371, 1, 'en', 'core/base/layouts', 'theme', 'Theme', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(372, 1, 'en', 'core/base/layouts', 'copyright', 'Copyright :year &copy; :company. Version: <span>:version</span>', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(373, 1, 'en', 'core/base/layouts', 'profile', 'Profile', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(374, 1, 'en', 'core/base/layouts', 'logout', 'Logout', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(375, 1, 'en', 'core/base/layouts', 'no_search_result', 'No results found, please try with different keywords.', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(376, 1, 'en', 'core/base/layouts', 'home', 'Home', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(377, 1, 'en', 'core/base/layouts', 'search', 'Search', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(378, 1, 'en', 'core/base/layouts', 'add_new', 'Add new', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(379, 1, 'en', 'core/base/layouts', 'n_a', 'N/A', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(380, 1, 'en', 'core/base/layouts', 'page_loaded_time', 'Page loaded in', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(381, 1, 'en', 'core/base/layouts', 'view_website', 'View website', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(382, 1, 'en', 'core/base/notices', 'create_success_message', 'Created successfully', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(383, 1, 'en', 'core/base/notices', 'update_success_message', 'Updated successfully', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(384, 1, 'en', 'core/base/notices', 'delete_success_message', 'Deleted successfully', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(385, 1, 'en', 'core/base/notices', 'success_header', 'Success!', '2023-07-10 00:35:04', '2023-07-10 00:35:04');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(386, 1, 'en', 'core/base/notices', 'error_header', 'Error!', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(387, 1, 'en', 'core/base/notices', 'no_select', 'Please select at least one record to perform this action!', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(388, 1, 'en', 'core/base/notices', 'processing_request', 'We are processing your request.', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(389, 1, 'en', 'core/base/notices', 'error', 'Error!', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(390, 1, 'en', 'core/base/notices', 'success', 'Success!', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(391, 1, 'en', 'core/base/notices', 'info', 'Info!', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(392, 1, 'en', 'core/base/notices', 'enum.validate_message', 'The :attribute value you have entered is invalid.', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(393, 1, 'en', 'core/base/notifications', 'notifications', 'Notifications', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(394, 1, 'en', 'core/base/notifications', 'mark_as_read', 'Mark as read', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(395, 1, 'en', 'core/base/notifications', 'clear', 'Clear', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(396, 1, 'en', 'core/base/notifications', 'no_notification_here', 'No notifications here', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(397, 1, 'en', 'core/base/notifications', 'please_check_again_later', 'Please check again later', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(398, 1, 'en', 'core/base/notifications', 'view_more', 'View more...', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(399, 1, 'en', 'core/base/notifications', 'view', 'View', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(400, 1, 'en', 'core/base/notifications', 'show_more', 'Show more', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(401, 1, 'en', 'core/base/notifications', 'show_less', 'Show less', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(402, 1, 'en', 'core/base/system', 'no_select', 'Please select at least one record to take this action!', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(403, 1, 'en', 'core/base/system', 'cannot_find_user', 'Unable to find specified user', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(404, 1, 'en', 'core/base/system', 'supper_revoked', 'Super user access revoked', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(405, 1, 'en', 'core/base/system', 'cannot_revoke_yourself', 'Can not revoke supper user access permission yourself!', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(406, 1, 'en', 'core/base/system', 'cant_remove_supper', 'You don\'t has permission to remove this super user', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(407, 1, 'en', 'core/base/system', 'cant_find_user_with_email', 'Unable to find user with specified email address', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(408, 1, 'en', 'core/base/system', 'supper_granted', 'Super user access granted', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(409, 1, 'en', 'core/base/system', 'delete_log_success', 'Delete log file successfully!', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(410, 1, 'en', 'core/base/system', 'get_member_success', 'Member list retrieved successfully', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(411, 1, 'en', 'core/base/system', 'error_occur', 'The following errors occurred', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(412, 1, 'en', 'core/base/system', 'user_management', 'User Management', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(413, 1, 'en', 'core/base/system', 'user_management_description', 'Manage users.', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(414, 1, 'en', 'core/base/system', 'role_and_permission', 'Roles and Permissions', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(415, 1, 'en', 'core/base/system', 'role_and_permission_description', 'Manage the available roles.', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(416, 1, 'en', 'core/base/system', 'user.list_super', 'List Super Users', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(417, 1, 'en', 'core/base/system', 'user.email', 'Email', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(418, 1, 'en', 'core/base/system', 'user.last_login', 'Last Login', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(419, 1, 'en', 'core/base/system', 'user.username', 'Username', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(420, 1, 'en', 'core/base/system', 'user.add_user', 'Add Super User', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(421, 1, 'en', 'core/base/system', 'user.cancel', 'Cancel', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(422, 1, 'en', 'core/base/system', 'user.create', 'Create', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(423, 1, 'en', 'core/base/system', 'options.features', 'Feature Access Control', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(424, 1, 'en', 'core/base/system', 'options.feature_description', 'Manage the available.', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(425, 1, 'en', 'core/base/system', 'options.manage_super', 'Super User Management', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(426, 1, 'en', 'core/base/system', 'options.manage_super_description', 'Add/remove super users.', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(427, 1, 'en', 'core/base/system', 'options.info', 'System information', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(428, 1, 'en', 'core/base/system', 'options.info_description', 'All information about current system configuration.', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(429, 1, 'en', 'core/base/system', 'info.title', 'System information', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(430, 1, 'en', 'core/base/system', 'info.cache', 'Cache', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(431, 1, 'en', 'core/base/system', 'info.locale', 'Active locale', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(432, 1, 'en', 'core/base/system', 'info.environment', 'Environment', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(433, 1, 'en', 'core/base/system', 'disabled_in_demo_mode', 'You cannot do it in demo mode!', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(434, 1, 'en', 'core/base/system', 'report_description', 'Please share this information for troubleshooting', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(435, 1, 'en', 'core/base/system', 'get_system_report', 'Get System Report', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(436, 1, 'en', 'core/base/system', 'system_environment', 'System Environment', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(437, 1, 'en', 'core/base/system', 'framework_version', 'Framework Version', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(438, 1, 'en', 'core/base/system', 'timezone', 'Timezone', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(439, 1, 'en', 'core/base/system', 'debug_mode', 'Debug Mode', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(440, 1, 'en', 'core/base/system', 'debug_mode_off', 'Debug Mode Off', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(441, 1, 'en', 'core/base/system', 'storage_dir_writable', 'Storage Dir Writable', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(442, 1, 'en', 'core/base/system', 'cache_dir_writable', 'Cache Dir Writable', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(443, 1, 'en', 'core/base/system', 'app_size', 'App Size', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(444, 1, 'en', 'core/base/system', 'server_environment', 'Server Environment', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(445, 1, 'en', 'core/base/system', 'php_version', 'PHP Version', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(446, 1, 'en', 'core/base/system', 'php_version_error', 'PHP must be >= :version', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(447, 1, 'en', 'core/base/system', 'server_software', 'Server Software', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(448, 1, 'en', 'core/base/system', 'server_os', 'Server OS', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(449, 1, 'en', 'core/base/system', 'database', 'Database', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(450, 1, 'en', 'core/base/system', 'ssl_installed', 'SSL Installed', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(451, 1, 'en', 'core/base/system', 'cache_driver', 'Cache Driver', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(452, 1, 'en', 'core/base/system', 'session_driver', 'Session Driver', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(453, 1, 'en', 'core/base/system', 'queue_connection', 'Queue Connection', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(454, 1, 'en', 'core/base/system', 'mbstring_ext', 'Mbstring Ext', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(455, 1, 'en', 'core/base/system', 'openssl_ext', 'OpenSSL Ext', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(456, 1, 'en', 'core/base/system', 'pdo_ext', 'PDO Ext', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(457, 1, 'en', 'core/base/system', 'curl_ext', 'CURL Ext', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(458, 1, 'en', 'core/base/system', 'exif_ext', 'Exif Ext', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(459, 1, 'en', 'core/base/system', 'file_info_ext', 'File info Ext', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(460, 1, 'en', 'core/base/system', 'tokenizer_ext', 'Tokenizer Ext', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(461, 1, 'en', 'core/base/system', 'extra_stats', 'Extra Stats', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(462, 1, 'en', 'core/base/system', 'installed_packages', 'Installed packages and their version numbers', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(463, 1, 'en', 'core/base/system', 'extra_information', 'Extra Information', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(464, 1, 'en', 'core/base/system', 'copy_report', 'Copy Report', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(465, 1, 'en', 'core/base/system', 'package_name', 'Package Name', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(466, 1, 'en', 'core/base/system', 'dependency_name', 'Dependency Name', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(467, 1, 'en', 'core/base/system', 'version', 'Version', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(468, 1, 'en', 'core/base/system', 'cms_version', 'CMS Version', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(469, 1, 'en', 'core/base/system', 'imagick_or_gd_ext', 'Imagick/GD Ext', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(470, 1, 'en', 'core/base/system', 'updater', 'System Updater', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(471, 1, 'en', 'core/base/system', 'zip', 'Zip Ext', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(472, 1, 'en', 'core/base/system', 'iconv', 'Iconv Ext', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(473, 1, 'en', 'core/base/system', 'memory_limit', 'Memory limit', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(474, 1, 'en', 'core/base/system', 'max_execution_time', 'Max execution time (s)', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(475, 1, 'en', 'core/base/system', 'allow_url_fopen_enabled', 'allow_url_fopen enabled', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(476, 1, 'en', 'core/base/system', 'cleanup.title', 'Cleanup System', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(477, 1, 'en', 'core/base/system', 'cleanup.table.name', 'Table Name', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(478, 1, 'en', 'core/base/system', 'cleanup.table.count', 'Records', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(479, 1, 'en', 'core/base/system', 'cleanup.backup_alert', 'Please backup your database and script files before cleanup, it will clear your data in database.', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(480, 1, 'en', 'core/base/system', 'cleanup.messenger_choose_without_table', 'Please choose to ignore tables that do not want to be cleaned', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(481, 1, 'en', 'core/base/system', 'cleanup.messenger_confirm_cleanup', 'Are you sure you want to database cleanup action, it will clear your data in database?', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(482, 1, 'en', 'core/base/system', 'cleanup.submit_button', 'Cleanup', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(483, 1, 'en', 'core/base/system', 'cleanup.success_message', 'Cleaned data successfully', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(484, 1, 'en', 'core/base/system', 'cleanup.not_enabled_yet', 'This featured is not enabled yet. <br />Please add into .env: <code>CMS_ENABLED_CLEANUP_DATABASE=true</code> to enable this feature!', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(485, 1, 'en', 'core/base/tables', 'id', 'ID', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(486, 1, 'en', 'core/base/tables', 'name', 'Name', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(487, 1, 'en', 'core/base/tables', 'slug', 'Slug', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(488, 1, 'en', 'core/base/tables', 'title', 'Title', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(489, 1, 'en', 'core/base/tables', 'order_by', 'Order By', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(490, 1, 'en', 'core/base/tables', 'order', 'Order', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(491, 1, 'en', 'core/base/tables', 'status', 'Status', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(492, 1, 'en', 'core/base/tables', 'created_at', 'Created At', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(493, 1, 'en', 'core/base/tables', 'updated_at', 'Updated At', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(494, 1, 'en', 'core/base/tables', 'description', 'Description', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(495, 1, 'en', 'core/base/tables', 'operations', 'Operations', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(496, 1, 'en', 'core/base/tables', 'url', 'URL', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(497, 1, 'en', 'core/base/tables', 'author', 'Author', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(498, 1, 'en', 'core/base/tables', 'notes', 'Notes', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(499, 1, 'en', 'core/base/tables', 'column', 'Column', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(500, 1, 'en', 'core/base/tables', 'origin', 'Origin', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(501, 1, 'en', 'core/base/tables', 'after_change', 'After changes', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(502, 1, 'en', 'core/base/tables', 'views', 'Views', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(503, 1, 'en', 'core/base/tables', 'browser', 'Browser', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(504, 1, 'en', 'core/base/tables', 'session', 'Session', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(505, 1, 'en', 'core/base/tables', 'activated', 'activated', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(506, 1, 'en', 'core/base/tables', 'deactivated', 'deactivated', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(507, 1, 'en', 'core/base/tables', 'is_featured', 'Is featured', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(508, 1, 'en', 'core/base/tables', 'edit', 'Edit', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(509, 1, 'en', 'core/base/tables', 'delete', 'Delete', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(510, 1, 'en', 'core/base/tables', 'restore', 'Restore', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(511, 1, 'en', 'core/base/tables', 'activate', 'Activate', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(512, 1, 'en', 'core/base/tables', 'deactivate', 'Deactivate', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(513, 1, 'en', 'core/base/tables', 'excel', 'Excel', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(514, 1, 'en', 'core/base/tables', 'export', 'Export', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(515, 1, 'en', 'core/base/tables', 'csv', 'CSV', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(516, 1, 'en', 'core/base/tables', 'pdf', 'PDF', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(517, 1, 'en', 'core/base/tables', 'print', 'Print', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(518, 1, 'en', 'core/base/tables', 'reset', 'Reset', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(519, 1, 'en', 'core/base/tables', 'reload', 'Reload', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(520, 1, 'en', 'core/base/tables', 'display', 'Display', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(521, 1, 'en', 'core/base/tables', 'all', 'All', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(522, 1, 'en', 'core/base/tables', 'add_new', 'Add New', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(523, 1, 'en', 'core/base/tables', 'action', 'Actions', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(524, 1, 'en', 'core/base/tables', 'delete_entry', 'Delete', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(525, 1, 'en', 'core/base/tables', 'view', 'View Detail', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(526, 1, 'en', 'core/base/tables', 'save', 'Save', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(527, 1, 'en', 'core/base/tables', 'show_from', 'Show from', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(528, 1, 'en', 'core/base/tables', 'to', 'to', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(529, 1, 'en', 'core/base/tables', 'in', 'in', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(530, 1, 'en', 'core/base/tables', 'records', 'records', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(531, 1, 'en', 'core/base/tables', 'no_data', 'No data to display', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(532, 1, 'en', 'core/base/tables', 'no_record', 'No record', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(533, 1, 'en', 'core/base/tables', 'confirm_delete', 'Confirm delete', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(534, 1, 'en', 'core/base/tables', 'confirm_delete_msg', 'Do you really want to delete this record?', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(535, 1, 'en', 'core/base/tables', 'confirm_delete_many_msg', 'Do you really want to delete selected record(s)?', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(536, 1, 'en', 'core/base/tables', 'cancel', 'Cancel', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(537, 1, 'en', 'core/base/tables', 'template', 'Template', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(538, 1, 'en', 'core/base/tables', 'email', 'Email', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(539, 1, 'en', 'core/base/tables', 'last_login', 'Last login', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(540, 1, 'en', 'core/base/tables', 'shortcode', 'Shortcode', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(541, 1, 'en', 'core/base/tables', 'image', 'Image', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(542, 1, 'en', 'core/base/tables', 'bulk_changes', 'Bulk changes', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(543, 1, 'en', 'core/base/tables', 'submit', 'Submit', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(544, 1, 'en', 'core/base/tables', 'please_select_record', 'Please select at least one record to perform this action!', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(545, 1, 'en', 'core/base/tabs', 'detail', 'Detail', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(546, 1, 'en', 'core/base/tabs', 'file', 'Files', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(547, 1, 'en', 'core/base/tabs', 'record_note', 'Record Note', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(548, 1, 'en', 'core/base/tabs', 'revision', 'Revision History', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(549, 1, 'en', 'core/dashboard/dashboard', 'update_position_success', 'Update widget position successfully!', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(550, 1, 'en', 'core/dashboard/dashboard', 'hide_success', 'Update widget successfully!', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(551, 1, 'en', 'core/dashboard/dashboard', 'confirm_hide', 'Are you sure?', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(552, 1, 'en', 'core/dashboard/dashboard', 'hide_message', 'Do you really want to hide this widget? It will be disappear on Dashboard!', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(553, 1, 'en', 'core/dashboard/dashboard', 'confirm_hide_btn', 'Yes, hide this widget', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(554, 1, 'en', 'core/dashboard/dashboard', 'cancel_hide_btn', 'Cancel', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(555, 1, 'en', 'core/dashboard/dashboard', 'collapse_expand', 'Collapse/Expand', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(556, 1, 'en', 'core/dashboard/dashboard', 'hide', 'Hide', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(557, 1, 'en', 'core/dashboard/dashboard', 'reload', 'Reload', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(558, 1, 'en', 'core/dashboard/dashboard', 'save_setting_success', 'Save widget settings successfully!', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(559, 1, 'en', 'core/dashboard/dashboard', 'widget_not_exists', 'Widget is not exits!', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(560, 1, 'en', 'core/dashboard/dashboard', 'manage_widgets', 'Manage Widgets', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(561, 1, 'en', 'core/dashboard/dashboard', 'fullscreen', 'Full screen', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(562, 1, 'en', 'core/dashboard/dashboard', 'title', 'Dashboard', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(563, 1, 'en', 'core/dashboard/dashboard', 'predefined_ranges.today', 'Today', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(564, 1, 'en', 'core/dashboard/dashboard', 'predefined_ranges.yesterday', 'Yesterday', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(565, 1, 'en', 'core/dashboard/dashboard', 'predefined_ranges.this_week', 'This Week', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(566, 1, 'en', 'core/dashboard/dashboard', 'predefined_ranges.last_7_days', 'Last 7 Days', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(567, 1, 'en', 'core/dashboard/dashboard', 'predefined_ranges.this_month', 'This Month', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(568, 1, 'en', 'core/dashboard/dashboard', 'predefined_ranges.last_30_days', 'Last 30 Days', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(569, 1, 'en', 'core/dashboard/dashboard', 'predefined_ranges.this_year', 'This Year', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(570, 1, 'en', 'core/media/media', 'filter', 'Filter', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(571, 1, 'en', 'core/media/media', 'everything', 'Everything', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(572, 1, 'en', 'core/media/media', 'image', 'Image', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(573, 1, 'en', 'core/media/media', 'video', 'Video', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(574, 1, 'en', 'core/media/media', 'document', 'Document', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(575, 1, 'en', 'core/media/media', 'view_in', 'View in', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(576, 1, 'en', 'core/media/media', 'all_media', 'All media', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(577, 1, 'en', 'core/media/media', 'trash', 'Trash', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(578, 1, 'en', 'core/media/media', 'recent', 'Recent', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(579, 1, 'en', 'core/media/media', 'favorites', 'Favorites', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(580, 1, 'en', 'core/media/media', 'upload', 'Upload', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(581, 1, 'en', 'core/media/media', 'create_folder', 'Create folder', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(582, 1, 'en', 'core/media/media', 'refresh', 'Refresh', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(583, 1, 'en', 'core/media/media', 'empty_trash', 'Empty trash', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(584, 1, 'en', 'core/media/media', 'search_file_and_folder', 'Search in current folder', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(585, 1, 'en', 'core/media/media', 'sort', 'Sort', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(586, 1, 'en', 'core/media/media', 'file_name_asc', 'File name - ASC', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(587, 1, 'en', 'core/media/media', 'file_name_desc', 'File name - DESC', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(588, 1, 'en', 'core/media/media', 'uploaded_date_asc', 'Uploaded date - ASC', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(589, 1, 'en', 'core/media/media', 'uploaded_date_desc', 'Uploaded date - DESC', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(590, 1, 'en', 'core/media/media', 'size_asc', 'Size - ASC', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(591, 1, 'en', 'core/media/media', 'size_desc', 'Size - DESC', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(592, 1, 'en', 'core/media/media', 'actions', 'Actions', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(593, 1, 'en', 'core/media/media', 'nothing_is_selected', 'Nothing is selected', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(594, 1, 'en', 'core/media/media', 'insert', 'Insert', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(595, 1, 'en', 'core/media/media', 'folder_name', 'Folder name', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(596, 1, 'en', 'core/media/media', 'create', 'Create', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(597, 1, 'en', 'core/media/media', 'rename', 'Rename', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(598, 1, 'en', 'core/media/media', 'crop', 'Crop', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(599, 1, 'en', 'core/media/media', 'close', 'Close', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(600, 1, 'en', 'core/media/media', 'save_changes', 'Save changes', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(601, 1, 'en', 'core/media/media', 'move_to_trash', 'Move items to trash', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(602, 1, 'en', 'core/media/media', 'confirm_trash', 'Are you sure you want to move these items to trash?', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(603, 1, 'en', 'core/media/media', 'confirm', 'Confirm', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(604, 1, 'en', 'core/media/media', 'confirm_delete', 'Delete item(s)', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(605, 1, 'en', 'core/media/media', 'confirm_delete_description', 'Your request cannot rollback. Are you sure you wanna delete these items?', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(606, 1, 'en', 'core/media/media', 'empty_trash_title', 'Empty trash', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(607, 1, 'en', 'core/media/media', 'empty_trash_description', 'Your request cannot rollback. Are you sure you wanna remove all items in trash?', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(608, 1, 'en', 'core/media/media', 'up_level', 'Up one level', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(609, 1, 'en', 'core/media/media', 'upload_progress', 'Upload progress', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(610, 1, 'en', 'core/media/media', 'alt_text', 'Alt text', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(611, 1, 'en', 'core/media/media', 'folder_created', 'Folder is created successfully!', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(612, 1, 'en', 'core/media/media', 'gallery', 'Media gallery', '2023-07-10 00:35:04', '2023-07-10 00:35:04'),
(613, 1, 'en', 'core/media/media', 'trash_error', 'Error when delete selected item(s)', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(614, 1, 'en', 'core/media/media', 'trash_success', 'Moved selected item(s) to trash successfully!', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(615, 1, 'en', 'core/media/media', 'restore_error', 'Error when restore selected item(s)', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(616, 1, 'en', 'core/media/media', 'restore_success', 'Restore selected item(s) successfully!', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(617, 1, 'en', 'core/media/media', 'copy_success', 'Copied selected item(s) successfully!', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(618, 1, 'en', 'core/media/media', 'delete_success', 'Deleted selected item(s) successfully!', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(619, 1, 'en', 'core/media/media', 'favorite_success', 'Favorite selected item(s) successfully!', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(620, 1, 'en', 'core/media/media', 'remove_favorite_success', 'Remove selected item(s) from favorites successfully!', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(621, 1, 'en', 'core/media/media', 'rename_error', 'Error when rename item(s)', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(622, 1, 'en', 'core/media/media', 'rename_success', 'Rename selected item(s) successfully!', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(623, 1, 'en', 'core/media/media', 'crop_success', 'Crop image successfully!', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(624, 1, 'en', 'core/media/media', 'empty_trash_success', 'Empty trash successfully!', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(625, 1, 'en', 'core/media/media', 'invalid_action', 'Invalid action!', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(626, 1, 'en', 'core/media/media', 'file_not_exists', 'File is not exists!', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(627, 1, 'en', 'core/media/media', 'download_file_error', 'Error when downloading files!', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(628, 1, 'en', 'core/media/media', 'missing_zip_archive_extension', 'Please enable ZipArchive extension to download file!', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(629, 1, 'en', 'core/media/media', 'can_not_download_file', 'Can not download this file!', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(630, 1, 'en', 'core/media/media', 'invalid_request', 'Invalid request!', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(631, 1, 'en', 'core/media/media', 'add_success', 'Add item successfully!', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(632, 1, 'en', 'core/media/media', 'file_too_big', 'File too big. Max file upload is :size bytes', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(633, 1, 'en', 'core/media/media', 'file_too_big_readable_size', 'File too big. Max file upload is :size.', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(634, 1, 'en', 'core/media/media', 'can_not_detect_file_type', 'File type is not allowed or can not detect file type!', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(635, 1, 'en', 'core/media/media', 'upload_failed', 'The file is NOT uploaded completely. The server allows max upload file size is :size . Please check your file size OR try to upload again in case of having network errors', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(636, 1, 'en', 'core/media/media', 'failed_to_crop_image', 'The file cropping must be image type', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(637, 1, 'en', 'core/media/media', 'menu_name', 'Media', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(638, 1, 'en', 'core/media/media', 'add', 'Add media', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(639, 1, 'en', 'core/media/media', 'javascript.name', 'Name', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(640, 1, 'en', 'core/media/media', 'javascript.url', 'URL', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(641, 1, 'en', 'core/media/media', 'javascript.full_url', 'Full URL', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(642, 1, 'en', 'core/media/media', 'javascript.alt', 'Alt text', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(643, 1, 'en', 'core/media/media', 'javascript.size', 'Size', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(644, 1, 'en', 'core/media/media', 'javascript.mime_type', 'Type', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(645, 1, 'en', 'core/media/media', 'javascript.created_at', 'Uploaded at', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(646, 1, 'en', 'core/media/media', 'javascript.updated_at', 'Modified at', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(647, 1, 'en', 'core/media/media', 'javascript.nothing_selected', 'Nothing is selected', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(648, 1, 'en', 'core/media/media', 'javascript.visit_link', 'Open link', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(649, 1, 'en', 'core/media/media', 'javascript.no_item.all_media.icon', 'fas fa-cloud-upload-alt', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(650, 1, 'en', 'core/media/media', 'javascript.no_item.all_media.title', 'Drop files and folders here', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(651, 1, 'en', 'core/media/media', 'javascript.no_item.all_media.message', 'Or use the upload button above', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(652, 1, 'en', 'core/media/media', 'javascript.no_item.trash.icon', 'fas fa-trash-alt', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(653, 1, 'en', 'core/media/media', 'javascript.no_item.trash.title', 'There is nothing in your trash currently', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(654, 1, 'en', 'core/media/media', 'javascript.no_item.trash.message', 'Delete files to move them to trash automatically. Delete files from trash to remove them permanently', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(655, 1, 'en', 'core/media/media', 'javascript.no_item.favorites.icon', 'fas fa-star', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(656, 1, 'en', 'core/media/media', 'javascript.no_item.favorites.title', 'You have not added anything to your favorites yet', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(657, 1, 'en', 'core/media/media', 'javascript.no_item.favorites.message', 'Add files to favorites to easily find them later', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(658, 1, 'en', 'core/media/media', 'javascript.no_item.recent.icon', 'far fa-clock', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(659, 1, 'en', 'core/media/media', 'javascript.no_item.recent.title', 'You did not opened anything yet', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(660, 1, 'en', 'core/media/media', 'javascript.no_item.recent.message', 'All recent files that you opened will be appeared here', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(661, 1, 'en', 'core/media/media', 'javascript.no_item.default.icon', 'fas fa-sync', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(662, 1, 'en', 'core/media/media', 'javascript.no_item.default.title', 'No items', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(663, 1, 'en', 'core/media/media', 'javascript.no_item.default.message', 'This directory has no item', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(664, 1, 'en', 'core/media/media', 'javascript.clipboard.success', 'These file links have been copied to clipboard', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(665, 1, 'en', 'core/media/media', 'javascript.message.error_header', 'Error', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(666, 1, 'en', 'core/media/media', 'javascript.message.success_header', 'Success', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(667, 1, 'en', 'core/media/media', 'javascript.download.error', 'No files selected or cannot download these files', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(668, 1, 'en', 'core/media/media', 'javascript.actions_list.basic.preview', 'Preview', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(669, 1, 'en', 'core/media/media', 'javascript.actions_list.basic.crop', 'Crop', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(670, 1, 'en', 'core/media/media', 'javascript.actions_list.file.copy_link', 'Copy link', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(671, 1, 'en', 'core/media/media', 'javascript.actions_list.file.rename', 'Rename', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(672, 1, 'en', 'core/media/media', 'javascript.actions_list.file.make_copy', 'Make a copy', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(673, 1, 'en', 'core/media/media', 'javascript.actions_list.file.alt_text', 'ALT text', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(674, 1, 'en', 'core/media/media', 'javascript.actions_list.user.favorite', 'Add to favorite', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(675, 1, 'en', 'core/media/media', 'javascript.actions_list.user.remove_favorite', 'Remove favorite', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(676, 1, 'en', 'core/media/media', 'javascript.actions_list.other.download', 'Download', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(677, 1, 'en', 'core/media/media', 'javascript.actions_list.other.trash', 'Move to trash', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(678, 1, 'en', 'core/media/media', 'javascript.actions_list.other.delete', 'Delete permanently', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(679, 1, 'en', 'core/media/media', 'javascript.actions_list.other.restore', 'Restore', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(680, 1, 'en', 'core/media/media', 'javascript.change_image', 'Change image', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(681, 1, 'en', 'core/media/media', 'javascript.delete_image', 'Delete image', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(682, 1, 'en', 'core/media/media', 'javascript.choose_image', 'Choose image', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(683, 1, 'en', 'core/media/media', 'javascript.preview_image', 'Preview image', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(684, 1, 'en', 'core/media/media', 'name_invalid', 'The folder name has invalid character(s).', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(685, 1, 'en', 'core/media/media', 'url_invalid', 'Please provide a valid URL', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(686, 1, 'en', 'core/media/media', 'path_invalid', 'Please provide a valid path', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(687, 1, 'en', 'core/media/media', 'download_link', 'Download', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(688, 1, 'en', 'core/media/media', 'url', 'URL', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(689, 1, 'en', 'core/media/media', 'download_explain', 'Enter one URL per line.', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(690, 1, 'en', 'core/media/media', 'downloading', 'Downloading...', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(691, 1, 'en', 'core/media/media', 'prepare_file_to_download', 'Preparing file to download...', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(692, 1, 'en', 'core/media/media', 'update_alt_text_success', 'Update alt text successfully!', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(693, 1, 'en', 'core/media/media', 'cropper.height', 'Height', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(694, 1, 'en', 'core/media/media', 'cropper.width', 'Width', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(695, 1, 'en', 'core/media/media', 'cropper.aspect_ratio', 'Aspect ratio?', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(696, 1, 'en', 'core/media/media', 'unable_to_write', 'Unable to write file. Please chmod folder \":folder\" to make it writeable!', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(697, 1, 'en', 'core/setting/setting', 'title', 'Settings', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(698, 1, 'en', 'core/setting/setting', 'email_setting_title', 'Email settings', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(699, 1, 'en', 'core/setting/setting', 'general.theme', 'Theme', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(700, 1, 'en', 'core/setting/setting', 'general.description', 'Setting site information', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(701, 1, 'en', 'core/setting/setting', 'general.title', 'General', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(702, 1, 'en', 'core/setting/setting', 'general.general_block', 'General Information', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(703, 1, 'en', 'core/setting/setting', 'general.rich_editor', 'Rich Editor', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(704, 1, 'en', 'core/setting/setting', 'general.site_title', 'Site title', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(705, 1, 'en', 'core/setting/setting', 'general.admin_email', 'Admin Email', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(706, 1, 'en', 'core/setting/setting', 'general.seo_block', 'SEO Configuration', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(707, 1, 'en', 'core/setting/setting', 'general.seo_title', 'SEO Title', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(708, 1, 'en', 'core/setting/setting', 'general.seo_description', 'SEO Description', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(709, 1, 'en', 'core/setting/setting', 'general.webmaster_tools_block', 'Google Webmaster Tools', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(710, 1, 'en', 'core/setting/setting', 'general.placeholder.site_title', 'Site Title (maximum 120 characters)', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(711, 1, 'en', 'core/setting/setting', 'general.placeholder.admin_email', 'Admin Email', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(712, 1, 'en', 'core/setting/setting', 'general.placeholder.seo_title', 'SEO Title (maximum 120 characters)', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(713, 1, 'en', 'core/setting/setting', 'general.placeholder.seo_description', 'SEO Description (maximum 120 characters)', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(714, 1, 'en', 'core/setting/setting', 'general.placeholder.google_analytics', 'Google Analytics', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(715, 1, 'en', 'core/setting/setting', 'general.cache_admin_menu', 'Cache admin menu?', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(716, 1, 'en', 'core/setting/setting', 'general.enable_send_error_reporting_via_email', 'Enable to send error reporting via email?', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(717, 1, 'en', 'core/setting/setting', 'general.time_zone', 'Timezone', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(718, 1, 'en', 'core/setting/setting', 'general.default_admin_theme', 'Default admin theme', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(719, 1, 'en', 'core/setting/setting', 'general.enable_change_admin_theme', 'Enable change admin theme?', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(720, 1, 'en', 'core/setting/setting', 'general.enable', 'Enable', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(721, 1, 'en', 'core/setting/setting', 'general.disable', 'Disable', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(722, 1, 'en', 'core/setting/setting', 'general.enable_cache', 'Enable cache?', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(723, 1, 'en', 'core/setting/setting', 'general.disable_cache_in_the_admin_panel', 'Disable cache in the admin panel?', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(724, 1, 'en', 'core/setting/setting', 'general.cache_time', 'Cache time (minutes)', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(725, 1, 'en', 'core/setting/setting', 'general.enable_cache_site_map', 'Enable cache site map?', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(726, 1, 'en', 'core/setting/setting', 'general.cache_time_site_map', 'Cache Time Site map (minutes)', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(727, 1, 'en', 'core/setting/setting', 'general.admin_logo', 'Admin logo', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(728, 1, 'en', 'core/setting/setting', 'general.admin_favicon', 'Admin favicon', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(729, 1, 'en', 'core/setting/setting', 'general.admin_title', 'Admin title', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(730, 1, 'en', 'core/setting/setting', 'general.admin_title_placeholder', 'Title show to tab of browser', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(731, 1, 'en', 'core/setting/setting', 'general.cache_block', 'Cache', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(732, 1, 'en', 'core/setting/setting', 'general.admin_appearance_title', 'Admin appearance', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(733, 1, 'en', 'core/setting/setting', 'general.admin_appearance_description', 'Setting admin appearance such as editor, language...', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(734, 1, 'en', 'core/setting/setting', 'general.seo_block_description', 'Setting site title, site meta description, site keyword for optimize SEO', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(735, 1, 'en', 'core/setting/setting', 'general.webmaster_tools_description', 'Google Webmaster Tools (GWT) is free software that helps you manage the technical side of your website', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(736, 1, 'en', 'core/setting/setting', 'general.cache_description', 'Config cache for system for optimize speed', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(737, 1, 'en', 'core/setting/setting', 'general.yes', 'Yes', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(738, 1, 'en', 'core/setting/setting', 'general.no', 'No', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(739, 1, 'en', 'core/setting/setting', 'general.show_on_front', 'Your homepage displays', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(740, 1, 'en', 'core/setting/setting', 'general.select', '— Select —', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(741, 1, 'en', 'core/setting/setting', 'general.show_site_name', 'Show site name after page title, separate with \"-\"?', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(742, 1, 'en', 'core/setting/setting', 'general.locale', 'Site language', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(743, 1, 'en', 'core/setting/setting', 'general.locale_direction', 'Front site language direction', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(744, 1, 'en', 'core/setting/setting', 'general.admin_locale_direction', 'Admin language direction', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(745, 1, 'en', 'core/setting/setting', 'general.admin_login_screen_backgrounds', 'Login screen backgrounds (~1366x768)', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(746, 1, 'en', 'core/setting/setting', 'general.minutes', 'minutes', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(747, 1, 'en', 'core/setting/setting', 'email.subject', 'Subject', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(748, 1, 'en', 'core/setting/setting', 'email.content', 'Content', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(749, 1, 'en', 'core/setting/setting', 'email.title', 'Setting for email template', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(750, 1, 'en', 'core/setting/setting', 'email.description', 'Email template using HTML & system variables.', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(751, 1, 'en', 'core/setting/setting', 'email.reset_to_default', 'Reset to default', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(752, 1, 'en', 'core/setting/setting', 'email.back', 'Back to settings', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(753, 1, 'en', 'core/setting/setting', 'email.reset_success', 'Reset back to default successfully', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(754, 1, 'en', 'core/setting/setting', 'email.confirm_reset', 'Confirm reset email template?', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(755, 1, 'en', 'core/setting/setting', 'email.confirm_message', 'Do you really want to reset this email template to default?', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(756, 1, 'en', 'core/setting/setting', 'email.continue', 'Continue', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(757, 1, 'en', 'core/setting/setting', 'email.sender_name', 'Sender name', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(758, 1, 'en', 'core/setting/setting', 'email.sender_name_placeholder', 'Name', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(759, 1, 'en', 'core/setting/setting', 'email.sender_email', 'Sender email', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(760, 1, 'en', 'core/setting/setting', 'email.mailer', 'Mailer', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(761, 1, 'en', 'core/setting/setting', 'email.port', 'Port', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(762, 1, 'en', 'core/setting/setting', 'email.port_placeholder', 'Ex: 587', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(763, 1, 'en', 'core/setting/setting', 'email.host', 'Host', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(764, 1, 'en', 'core/setting/setting', 'email.host_placeholder', 'Ex: smtp.gmail.com', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(765, 1, 'en', 'core/setting/setting', 'email.username', 'Username', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(766, 1, 'en', 'core/setting/setting', 'email.username_placeholder', 'Username to login to mail server', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(767, 1, 'en', 'core/setting/setting', 'email.password', 'Password', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(768, 1, 'en', 'core/setting/setting', 'email.password_placeholder', 'Password to login to mail server', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(769, 1, 'en', 'core/setting/setting', 'email.encryption', 'Encryption', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(770, 1, 'en', 'core/setting/setting', 'email.mail_gun_domain', 'Domain', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(771, 1, 'en', 'core/setting/setting', 'email.mail_gun_domain_placeholder', 'Domain', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(772, 1, 'en', 'core/setting/setting', 'email.mail_gun_secret', 'Secret', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(773, 1, 'en', 'core/setting/setting', 'email.mail_gun_secret_placeholder', 'Secret', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(774, 1, 'en', 'core/setting/setting', 'email.mail_gun_endpoint', 'Endpoint', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(775, 1, 'en', 'core/setting/setting', 'email.mail_gun_endpoint_placeholder', 'Endpoint', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(776, 1, 'en', 'core/setting/setting', 'email.log_channel', 'Log channel', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(777, 1, 'en', 'core/setting/setting', 'email.sendmail_path', 'Sendmail Path', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(778, 1, 'en', 'core/setting/setting', 'email.encryption_placeholder', 'Encryption: ssl or tls', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(779, 1, 'en', 'core/setting/setting', 'email.ses_key', 'Key', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(780, 1, 'en', 'core/setting/setting', 'email.ses_key_placeholder', 'Key', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(781, 1, 'en', 'core/setting/setting', 'email.ses_secret', 'Secret', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(782, 1, 'en', 'core/setting/setting', 'email.ses_secret_placeholder', 'Secret', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(783, 1, 'en', 'core/setting/setting', 'email.ses_region', 'Region', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(784, 1, 'en', 'core/setting/setting', 'email.ses_region_placeholder', 'Region', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(785, 1, 'en', 'core/setting/setting', 'email.postmark_token', 'Token', '2023-07-10 00:35:05', '2023-07-10 00:35:05');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(786, 1, 'en', 'core/setting/setting', 'email.postmark_token_placeholder', 'Token', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(787, 1, 'en', 'core/setting/setting', 'email.template_title', 'Email templates', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(788, 1, 'en', 'core/setting/setting', 'email.template_description', 'Base templates for all emails', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(789, 1, 'en', 'core/setting/setting', 'email.template_header', 'Email template header', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(790, 1, 'en', 'core/setting/setting', 'email.template_header_description', 'Template for header of emails', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(791, 1, 'en', 'core/setting/setting', 'email.template_footer', 'Email template footer', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(792, 1, 'en', 'core/setting/setting', 'email.template_footer_description', 'Template for footer of emails', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(793, 1, 'en', 'core/setting/setting', 'email.default', 'Default', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(794, 1, 'en', 'core/setting/setting', 'media.title', 'Media', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(795, 1, 'en', 'core/setting/setting', 'media.driver', 'Driver', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(796, 1, 'en', 'core/setting/setting', 'media.description', 'Settings for media', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(797, 1, 'en', 'core/setting/setting', 'media.aws_access_key_id', 'AWS Access Key ID', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(798, 1, 'en', 'core/setting/setting', 'media.aws_secret_key', 'AWS Secret Key', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(799, 1, 'en', 'core/setting/setting', 'media.aws_default_region', 'AWS Default Region', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(800, 1, 'en', 'core/setting/setting', 'media.aws_bucket', 'AWS Bucket', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(801, 1, 'en', 'core/setting/setting', 'media.aws_url', 'AWS URL', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(802, 1, 'en', 'core/setting/setting', 'media.aws_endpoint', 'AWS Endpoint (Optional)', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(803, 1, 'en', 'core/setting/setting', 'media.do_spaces_access_key_id', 'DO Spaces Access Key ID', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(804, 1, 'en', 'core/setting/setting', 'media.do_spaces_secret_key', 'DO Spaces Secret Key', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(805, 1, 'en', 'core/setting/setting', 'media.do_spaces_default_region', 'DO Spaces Default Region', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(806, 1, 'en', 'core/setting/setting', 'media.do_spaces_bucket', 'DO Spaces Bucket', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(807, 1, 'en', 'core/setting/setting', 'media.do_spaces_endpoint', 'DO Spaces Endpoint', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(808, 1, 'en', 'core/setting/setting', 'media.do_spaces_cdn_enabled', 'Is DO Spaces CDN enabled?', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(809, 1, 'en', 'core/setting/setting', 'media.media_do_spaces_cdn_custom_domain', 'Do Spaces CDN custom domain', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(810, 1, 'en', 'core/setting/setting', 'media.media_do_spaces_cdn_custom_domain_placeholder', 'https://your-custom-domain.com', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(811, 1, 'en', 'core/setting/setting', 'media.wasabi_access_key_id', 'Wasabi Access Key ID', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(812, 1, 'en', 'core/setting/setting', 'media.wasabi_secret_key', 'Wasabi Secret Key', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(813, 1, 'en', 'core/setting/setting', 'media.wasabi_default_region', 'Wasabi Default Region', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(814, 1, 'en', 'core/setting/setting', 'media.wasabi_bucket', 'Wasabi Bucket', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(815, 1, 'en', 'core/setting/setting', 'media.wasabi_root', 'Wasabi Root', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(816, 1, 'en', 'core/setting/setting', 'media.default_placeholder_image', 'Default placeholder image', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(817, 1, 'en', 'core/setting/setting', 'media.enable_chunk', 'Enable chunk size upload?', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(818, 1, 'en', 'core/setting/setting', 'media.chunk_size', 'Chunk size (Bytes)', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(819, 1, 'en', 'core/setting/setting', 'media.chunk_size_placeholder', 'Default: 1048576 ~ 1MB', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(820, 1, 'en', 'core/setting/setting', 'media.max_file_size', 'Chunk max file size (MB)', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(821, 1, 'en', 'core/setting/setting', 'media.max_file_size_placeholder', 'Default: 1048576 ~ 1GB', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(822, 1, 'en', 'core/setting/setting', 'media.enable_watermark', 'Enable watermark?', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(823, 1, 'en', 'core/setting/setting', 'media.watermark_source', 'Watermark image', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(824, 1, 'en', 'core/setting/setting', 'media.watermark_size', 'Size of watermark (%)', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(825, 1, 'en', 'core/setting/setting', 'media.watermark_size_placeholder', 'Default: 10 (%)', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(826, 1, 'en', 'core/setting/setting', 'media.watermark_opacity', 'Watermark Opacity (%)', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(827, 1, 'en', 'core/setting/setting', 'media.watermark_opacity_placeholder', 'Default: 70 (%)', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(828, 1, 'en', 'core/setting/setting', 'media.watermark_position', 'Watermark position', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(829, 1, 'en', 'core/setting/setting', 'media.watermark_position_x', 'Watermark position X', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(830, 1, 'en', 'core/setting/setting', 'media.watermark_position_y', 'Watermark position Y', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(831, 1, 'en', 'core/setting/setting', 'media.watermark_position_top_left', 'Top left', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(832, 1, 'en', 'core/setting/setting', 'media.watermark_position_top_right', 'Top right', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(833, 1, 'en', 'core/setting/setting', 'media.watermark_position_bottom_left', 'Bottom left', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(834, 1, 'en', 'core/setting/setting', 'media.watermark_position_bottom_right', 'Bottom right', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(835, 1, 'en', 'core/setting/setting', 'media.watermark_position_center', 'Center', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(836, 1, 'en', 'core/setting/setting', 'media.turn_off_automatic_url_translation_into_latin', 'Turn off automatic URL translation into Latin?', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(837, 1, 'en', 'core/setting/setting', 'media.bunnycdn_hostname', 'Hostname', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(838, 1, 'en', 'core/setting/setting', 'media.bunnycdn_zone', 'Zone Name (The name of your storage zone)', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(839, 1, 'en', 'core/setting/setting', 'media.bunnycdn_key', 'FTP & API Access Password (The storage zone API Access Password)', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(840, 1, 'en', 'core/setting/setting', 'media.bunnycdn_region', 'Region (The storage zone region)', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(841, 1, 'en', 'core/setting/setting', 'media.optional', 'Optional', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(842, 1, 'en', 'core/setting/setting', 'media.sizes', 'Media thumbnails sizes', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(843, 1, 'en', 'core/setting/setting', 'media.media_sizes_helper', 'Set width or height to 0 if you just want to crop by width or height. Need to click on \"Generate thumbnails\" to apply changes.', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(844, 1, 'en', 'core/setting/setting', 'media.width', 'Width', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(845, 1, 'en', 'core/setting/setting', 'media.height', 'Height', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(846, 1, 'en', 'core/setting/setting', 'media.default_size_value', 'Default: :size', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(847, 1, 'en', 'core/setting/setting', 'media.all', 'All', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(848, 1, 'en', 'core/setting/setting', 'media.media_folders_can_add_watermark', 'Add watermark for images in folders:', '2023-07-10 00:35:05', '2023-07-10 00:35:05'),
(849, 1, 'en', 'core/setting/setting', 'media.max_upload_filesize', 'Max upload filesize (MB)', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(850, 1, 'en', 'core/setting/setting', 'media.max_upload_filesize_placeholder', 'Default: :size, must less than :size.', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(851, 1, 'en', 'core/setting/setting', 'media.max_upload_filesize_helper', 'Your server allows to upload files maximum :size, you can change this value to limit upload filesize.', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(852, 1, 'en', 'core/setting/setting', 'media.image_processing_library', 'Image processing library', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(853, 1, 'en', 'core/setting/setting', 'license.purchase_code', 'Purchase code', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(854, 1, 'en', 'core/setting/setting', 'license.buyer', 'Buyer', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(855, 1, 'en', 'core/setting/setting', 'field_type_not_exists', 'This field type does not exist', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(856, 1, 'en', 'core/setting/setting', 'save_settings', 'Save settings', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(857, 1, 'en', 'core/setting/setting', 'template', 'Template', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(858, 1, 'en', 'core/setting/setting', 'description', 'Description', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(859, 1, 'en', 'core/setting/setting', 'enable', 'Enable', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(860, 1, 'en', 'core/setting/setting', 'send', 'Send', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(861, 1, 'en', 'core/setting/setting', 'test_email_description', 'To send test email, please make sure you are updated configuration to send mail!', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(862, 1, 'en', 'core/setting/setting', 'test_email_input_placeholder', 'Enter the email which you want to send test email.', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(863, 1, 'en', 'core/setting/setting', 'test_email_modal_title', 'Send a test email', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(864, 1, 'en', 'core/setting/setting', 'test_send_mail', 'Send test mail', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(865, 1, 'en', 'core/setting/setting', 'test_email_send_success', 'Send email successfully!', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(866, 1, 'en', 'core/setting/setting', 'locale_direction_ltr', 'Left to Right', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(867, 1, 'en', 'core/setting/setting', 'locale_direction_rtl', 'Right to Left', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(868, 1, 'en', 'core/setting/setting', 'saving', 'Saving...', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(869, 1, 'en', 'core/setting/setting', 'emails_warning', 'You can add up to :count emails', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(870, 1, 'en', 'core/setting/setting', 'email_add_more', 'Add more', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(871, 1, 'en', 'core/setting/setting', 'generate', 'Generate', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(872, 1, 'en', 'core/setting/setting', 'generate_thumbnails', 'Generate thumbnails', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(873, 1, 'en', 'core/setting/setting', 'generate_thumbnails_success', 'Generate thumbnails successfully. :count files are generated!', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(874, 1, 'en', 'core/setting/setting', 'generate_thumbnails_error', 'We are unable to regenerate thumbnail for these files :count files!', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(875, 1, 'en', 'core/setting/setting', 'generate_thumbnails_description', 'Are you sure you want to re-generate thumbnails for all images? It will take time so please DO NOT leave this page, wait until it is finished.', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(876, 1, 'en', 'core/setting/setting', 'enable_chunk_description', 'Chunk size upload is used to upload large file size.', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(877, 1, 'en', 'core/setting/setting', 'watermark_description', 'WARNING: Watermark is just added to new uploaded images, it won\'t be added to existing images. Disable watermark won\'t remove watermark from existing images.', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(878, 1, 'en', 'core/setting/setting', 'submit', 'Submit', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(879, 1, 'en', 'core/setting/setting', 'back', 'Back', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(880, 1, 'en', 'core/setting/setting', 'enter_sample_value', 'Enter sample values for testing', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(881, 1, 'en', 'core/setting/setting', 'preview', 'Preview', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(882, 1, 'en', 'core/setting/setting', 'media_size_width', ':size size width must be greater than 0', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(883, 1, 'en', 'core/setting/setting', 'media_size_height', ':size size height must be greater than 0', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(884, 1, 'en', 'core/setting/setting', 'cronjob.name', 'Cronjob', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(885, 1, 'en', 'core/setting/setting', 'cronjob.description', 'Cronjob allow you to automate certain commands or scripts on your site.', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(886, 1, 'en', 'core/setting/setting', 'cronjob.is_not_ready', 'To run the cronjob, follow the instructions below.', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(887, 1, 'en', 'core/setting/setting', 'cronjob.is_working', 'Congratulations! Your cronjob is running.', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(888, 1, 'en', 'core/setting/setting', 'cronjob.is_not_working', 'Your cronjob is not running. Please check your server\'s cronjob.', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(889, 1, 'en', 'core/setting/setting', 'cronjob.last_checked', 'Last checked at :time.', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(890, 1, 'en', 'core/setting/setting', 'cronjob.copy_button', 'Copy', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(891, 1, 'en', 'core/setting/setting', 'cronjob.setup.name', 'Setting up the Cronjob', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(892, 1, 'en', 'core/setting/setting', 'cronjob.setup.connect_to_server', 'Connect to your server via SSH or any preferred method.', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(893, 1, 'en', 'core/setting/setting', 'cronjob.setup.open_crontab', 'Open the crontab file using a text editor (e.g., `crontab -e`).', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(894, 1, 'en', 'core/setting/setting', 'cronjob.setup.add_cronjob', 'Add the above command to the crontab file and save it.', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(895, 1, 'en', 'core/setting/setting', 'cronjob.setup.done', 'The cronjob will now run at every minute and execute the specified command.', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(896, 1, 'en', 'core/setting/setting', 'cronjob.setup.learn_more', 'You can learn more about cronjob from the Laravel :documentation', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(897, 1, 'en', 'core/setting/setting', 'cronjob.setup.documentation', 'documentation', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(898, 1, 'en', 'core/setting/setting', 'cronjob.setup.copied', 'Copied', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(899, 1, 'en', 'core/table/table', 'operations', 'Operations', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(900, 1, 'en', 'core/table/table', 'loading_data', 'Loading data from server', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(901, 1, 'en', 'core/table/table', 'display', 'Display', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(902, 1, 'en', 'core/table/table', 'all', 'All', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(903, 1, 'en', 'core/table/table', 'edit_entry', 'Edit', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(904, 1, 'en', 'core/table/table', 'delete_entry', 'Delete', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(905, 1, 'en', 'core/table/table', 'show_from', 'Showing from', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(906, 1, 'en', 'core/table/table', 'to', 'to', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(907, 1, 'en', 'core/table/table', 'in', 'in', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(908, 1, 'en', 'core/table/table', 'records', 'records', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(909, 1, 'en', 'core/table/table', 'no_data', 'No data to display', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(910, 1, 'en', 'core/table/table', 'no_record', 'No record', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(911, 1, 'en', 'core/table/table', 'loading', 'Loading data from server', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(912, 1, 'en', 'core/table/table', 'confirm_delete', 'Confirm delete', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(913, 1, 'en', 'core/table/table', 'confirm_delete_msg', 'Do you really want to delete this record?', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(914, 1, 'en', 'core/table/table', 'cancel', 'Cancel', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(915, 1, 'en', 'core/table/table', 'delete', 'Delete', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(916, 1, 'en', 'core/table/table', 'close', 'Close', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(917, 1, 'en', 'core/table/table', 'contains', 'Contains', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(918, 1, 'en', 'core/table/table', 'is_equal_to', 'Is equal to', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(919, 1, 'en', 'core/table/table', 'greater_than', 'Greater than', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(920, 1, 'en', 'core/table/table', 'less_than', 'Less than', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(921, 1, 'en', 'core/table/table', 'value', 'Value', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(922, 1, 'en', 'core/table/table', 'select_field', 'Select field', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(923, 1, 'en', 'core/table/table', 'reset', 'Reset', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(924, 1, 'en', 'core/table/table', 'add_additional_filter', 'Add additional filter', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(925, 1, 'en', 'core/table/table', 'apply', 'Apply', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(926, 1, 'en', 'core/table/table', 'filters', 'Filters', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(927, 1, 'en', 'core/table/table', 'bulk_change', 'Bulk changes', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(928, 1, 'en', 'core/table/table', 'select_option', 'Select option', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(929, 1, 'en', 'core/table/table', 'bulk_actions', 'Bulk Actions', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(930, 1, 'en', 'core/table/table', 'save_bulk_change_success', 'Update data for selected record(s) successfully!', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(931, 1, 'en', 'core/table/table', 'please_select_record', 'Please select at least one record to perform this action!', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(932, 1, 'en', 'core/table/table', 'filtered', '(filtered from _MAX_ total records)', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(933, 1, 'en', 'core/table/table', 'search', 'Search...', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(934, 1, 'en', 'packages/api/api', 'settings', 'API Settings', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(935, 1, 'en', 'packages/api/api', 'save_settings', 'Save settings', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(936, 1, 'en', 'packages/api/api', 'setting_title', 'API settings', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(937, 1, 'en', 'packages/api/api', 'setting_description', 'Settings for API', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(938, 1, 'en', 'packages/api/api', 'api_enabled', 'API enabled?', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(939, 1, 'en', 'packages/get-started/get-started', 'welcome_title', 'Welcome to your admin dashboard!', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(940, 1, 'en', 'packages/get-started/get-started', 'welcome_description', 'In a few short steps, you can have your new dashboard up and running!', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(941, 1, 'en', 'packages/get-started/get-started', 'get_started', 'Get Started!', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(942, 1, 'en', 'packages/get-started/get-started', 'customize_branding_title', 'Customize branding', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(943, 1, 'en', 'packages/get-started/get-started', 'customize_branding_description', 'Customize your site with colors, logo and subdomain to match your business unique branding and identity.', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(944, 1, 'en', 'packages/get-started/get-started', 'colors', 'Colors', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(945, 1, 'en', 'packages/get-started/get-started', 'fonts', 'Fonts', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(946, 1, 'en', 'packages/get-started/get-started', 'primary_color', 'Primary color', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(947, 1, 'en', 'packages/get-started/get-started', 'primary_font', 'Primary font', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(948, 1, 'en', 'packages/get-started/get-started', 'setup_wizard_button', ':link to finish Quick setup Wizard!', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(949, 1, 'en', 'packages/get-started/get-started', 'click_here', 'Click here', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(950, 1, 'en', 'packages/get-started/get-started', 'site_title', 'Site title', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(951, 1, 'en', 'packages/get-started/get-started', 'identify', 'Identify', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(952, 1, 'en', 'packages/get-started/get-started', 'logo', 'Logo', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(953, 1, 'en', 'packages/get-started/get-started', 'admin_logo', 'Admin logo', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(954, 1, 'en', 'packages/get-started/get-started', 'favicon', 'Favicon', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(955, 1, 'en', 'packages/get-started/get-started', 'admin_favicon', 'Admin favicon', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(956, 1, 'en', 'packages/get-started/get-started', 'next_step', 'Next step', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(957, 1, 'en', 'packages/get-started/get-started', 'site_ready_title', 'Your site is ready!', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(958, 1, 'en', 'packages/get-started/get-started', 'site_ready_description', 'Welcome to your new site! Your website has been created and populated with sample data. You are in the admin area of your site where you can set up everything else needed to complete your site.', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(959, 1, 'en', 'packages/get-started/get-started', 'finish', 'Finish', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(960, 1, 'en', 'packages/get-started/get-started', 'exit_wizard_title', 'Are you sure you want to exit the Quick Setup Wizard?', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(961, 1, 'en', 'packages/get-started/get-started', 'exit_wizard_confirm', 'Yes, I\'ll finish it later', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(962, 1, 'en', 'packages/get-started/get-started', 'exit_wizard_cancel', 'No, take me back to the wizard', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(963, 1, 'en', 'packages/get-started/get-started', 'change_default_account_info_title', 'Change default account info', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(964, 1, 'en', 'packages/get-started/get-started', 'change_default_account_info_description', 'The default account is using a weak password. You need to change it to a complex password for better security.', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(965, 1, 'en', 'packages/get-started/get-started', 'username', 'Username', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(966, 1, 'en', 'packages/get-started/get-started', 'email', 'Email', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(967, 1, 'en', 'packages/get-started/get-started', 'password', 'Password', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(968, 1, 'en', 'packages/get-started/get-started', 'password_confirmation', 'Password confirmation', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(969, 1, 'en', 'packages/installer/installer', 'title', 'Installer', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(970, 1, 'en', 'packages/installer/installer', 'next', 'Next Step', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(971, 1, 'en', 'packages/installer/installer', 'back', 'Previous', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(972, 1, 'en', 'packages/installer/installer', 'finish', 'Install', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(973, 1, 'en', 'packages/installer/installer', 'installation', 'Installation', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(974, 1, 'en', 'packages/installer/installer', 'forms.errorTitle', 'The following errors occurred:', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(975, 1, 'en', 'packages/installer/installer', 'welcome.templateTitle', 'Welcome', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(976, 1, 'en', 'packages/installer/installer', 'welcome.title', 'Welcome', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(977, 1, 'en', 'packages/installer/installer', 'welcome.message', 'Before getting started, we need some information on the database. You will need to know the following items before proceeding.', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(978, 1, 'en', 'packages/installer/installer', 'welcome.next', 'Let\'s go', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(979, 1, 'en', 'packages/installer/installer', 'requirements.templateTitle', 'Step 1 | Server Requirements', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(980, 1, 'en', 'packages/installer/installer', 'requirements.title', 'Server Requirements', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(981, 1, 'en', 'packages/installer/installer', 'requirements.next', 'Check Permissions', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(982, 1, 'en', 'packages/installer/installer', 'permissions.templateTitle', 'Step 2 | Permissions', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(983, 1, 'en', 'packages/installer/installer', 'permissions.title', 'Permissions', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(984, 1, 'en', 'packages/installer/installer', 'permissions.next', 'Configure Environment', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(985, 1, 'en', 'packages/installer/installer', 'environment.wizard.templateTitle', 'Environment Settings', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(986, 1, 'en', 'packages/installer/installer', 'environment.wizard.title', 'Environment Settings', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(987, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.name_required', 'An environment name is required.', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(988, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.app_name_label', 'Site title', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(989, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.app_name_placeholder', 'Site title', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(990, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.app_url_label', 'URL', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(991, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.app_url_placeholder', 'URL', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(992, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_connection_label', 'Database Connection', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(993, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_connection_label_mysql', 'MySQL', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(994, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_connection_label_sqlite', 'SQLite', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(995, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_connection_label_pgsql', 'PostgreSQL', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(996, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_host_label', 'Database host', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(997, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_host_placeholder', 'Database host', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(998, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_port_label', 'Database port', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(999, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_port_placeholder', 'Database port', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1000, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_name_label', 'Database name', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1001, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_name_placeholder', 'Database name', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1002, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_username_label', 'Database username', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1003, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_username_placeholder', 'Database username', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1004, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_password_label', 'Database password', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1005, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_password_placeholder', 'Database password', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1006, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.buttons.install', 'Install', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1007, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_host_helper', 'If you use Laravel Sail, just change DB_HOST to DB_HOST=mysql. On some hosting DB_HOST can be localhost instead of 127.0.0.1', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1008, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_connections.mysql', 'MySQL', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1009, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_connections.sqlite', 'SQLite', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1010, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_connections.pgsql', 'PostgreSQL', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1011, 1, 'en', 'packages/installer/installer', 'environment.success', 'Your .env file settings have been saved.', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1012, 1, 'en', 'packages/installer/installer', 'environment.errors', 'Unable to save the .env file, Please create it manually.', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1013, 1, 'en', 'packages/installer/installer', 'install', 'Install', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1014, 1, 'en', 'packages/installer/installer', 'final.title', 'Installation Finished', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1015, 1, 'en', 'packages/installer/installer', 'final.templateTitle', 'Installation Finished', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1016, 1, 'en', 'packages/installer/installer', 'final.finished', 'Application has been successfully installed.', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1017, 1, 'en', 'packages/installer/installer', 'final.exit', 'Click here to exit', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1018, 1, 'en', 'packages/installer/installer', 'create_account', 'Create account', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1019, 1, 'en', 'packages/installer/installer', 'first_name', 'First name', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1020, 1, 'en', 'packages/installer/installer', 'last_name', 'Last name', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1021, 1, 'en', 'packages/installer/installer', 'username', 'Username', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1022, 1, 'en', 'packages/installer/installer', 'email', 'Email', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1023, 1, 'en', 'packages/installer/installer', 'password', 'Password', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1024, 1, 'en', 'packages/installer/installer', 'password_confirmation', 'Password confirmation', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1025, 1, 'en', 'packages/installer/installer', 'create', 'Create', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1026, 1, 'en', 'packages/installer/installer', 'install_success', 'Installed successfully!', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1027, 1, 'en', 'packages/menu/menu', 'name', 'Menus', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1028, 1, 'en', 'packages/menu/menu', 'key_name', 'Menu name (key: :key)', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1029, 1, 'en', 'packages/menu/menu', 'basic_info', 'Basic information', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1030, 1, 'en', 'packages/menu/menu', 'add_to_menu', 'Add to menu', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1031, 1, 'en', 'packages/menu/menu', 'custom_link', 'Custom link', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1032, 1, 'en', 'packages/menu/menu', 'add_link', 'Add link', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1033, 1, 'en', 'packages/menu/menu', 'structure', 'Menu structure', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1034, 1, 'en', 'packages/menu/menu', 'remove', 'Remove', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1035, 1, 'en', 'packages/menu/menu', 'cancel', 'Cancel', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1036, 1, 'en', 'packages/menu/menu', 'title', 'Title', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1037, 1, 'en', 'packages/menu/menu', 'icon', 'Icon', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1038, 1, 'en', 'packages/menu/menu', 'url', 'URL', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1039, 1, 'en', 'packages/menu/menu', 'target', 'Target', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1040, 1, 'en', 'packages/menu/menu', 'css_class', 'CSS class', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1041, 1, 'en', 'packages/menu/menu', 'self_open_link', 'Open link directly', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1042, 1, 'en', 'packages/menu/menu', 'blank_open_link', 'Open link in new tab', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1043, 1, 'en', 'packages/menu/menu', 'create', 'Create menu', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1044, 1, 'en', 'packages/menu/menu', 'menu_settings', 'Menu settings', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1045, 1, 'en', 'packages/menu/menu', 'display_location', 'Display location', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1046, 1, 'en', 'packages/menu/menu', 'title_placeholder', 'Title', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1047, 1, 'en', 'packages/menu/menu', 'icon_placeholder', 'Icon', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1048, 1, 'en', 'packages/menu/menu', 'url_placeholder', 'URL', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1049, 1, 'en', 'packages/menu/menu', 'css_class_placeholder', 'CSS class', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1050, 1, 'en', 'packages/menu/menu', 'menu_id', 'Menu ID', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1051, 1, 'en', 'packages/optimize/optimize', 'settings.title', 'Optimize page speed', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1052, 1, 'en', 'packages/optimize/optimize', 'settings.description', 'Minify HTML output, inline CSS, remove comments...', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1053, 1, 'en', 'packages/optimize/optimize', 'settings.enable', 'Enable optimize page speed?', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1054, 1, 'en', 'packages/optimize/optimize', 'collapse_white_space', 'Collapse white space', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1055, 1, 'en', 'packages/optimize/optimize', 'collapse_white_space_description', 'This filter reduces bytes transmitted in an HTML file by removing unnecessary whitespace.', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1056, 1, 'en', 'packages/optimize/optimize', 'elide_attributes', 'Elide attributes', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1057, 1, 'en', 'packages/optimize/optimize', 'elide_attributes_description', 'This filter reduces the transfer size of HTML files by removing attributes from tags when the specified value is equal to the default value for that attribute. This can save a modest number of bytes, and may make the document more compressible by canonicalizing the affected tags.', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1058, 1, 'en', 'packages/optimize/optimize', 'inline_css', 'Inline CSS', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1059, 1, 'en', 'packages/optimize/optimize', 'inline_css_description', 'This filter transforms the inline \"style\" attribute of tags into classes by moving the CSS to the header.', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1060, 1, 'en', 'packages/optimize/optimize', 'insert_dns_prefetch', 'Insert DNS prefetch', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1061, 1, 'en', 'packages/optimize/optimize', 'insert_dns_prefetch_description', 'This filter injects tags in the HEAD to enable the browser to do DNS prefetching.', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1062, 1, 'en', 'packages/optimize/optimize', 'remove_comments', 'Remove comments', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1063, 1, 'en', 'packages/optimize/optimize', 'remove_comments_description', 'This filter eliminates HTML, JS and CSS comments. The filter reduces the transfer size of HTML files by removing the comments. Depending on the HTML file, this filter can significantly reduce the number of bytes transmitted on the network.', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1064, 1, 'en', 'packages/optimize/optimize', 'remove_quotes', 'Remove quotes', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1065, 1, 'en', 'packages/optimize/optimize', 'remove_quotes_description', 'This filter eliminates unnecessary quotation marks from HTML attributes. While required by the various HTML specifications, browsers permit their omission when the value of an attribute is composed of a certain subset of characters (alphanumerics and some punctuation characters).', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1066, 1, 'en', 'packages/optimize/optimize', 'defer_javascript', 'Defer javascript', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1067, 1, 'en', 'packages/optimize/optimize', 'defer_javascript_description', 'Defers the execution of javascript in the HTML. If necessary cancel deferring in some script, use data-pagespeed-no-defer as script attribute to cancel deferring.', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1068, 1, 'en', 'packages/page/pages', 'create', 'Create new page', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1069, 1, 'en', 'packages/page/pages', 'form.name', 'Name', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1070, 1, 'en', 'packages/page/pages', 'form.name_placeholder', 'Page\'s name (Maximum 120 characters)', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1071, 1, 'en', 'packages/page/pages', 'form.content', 'Content', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1072, 1, 'en', 'packages/page/pages', 'form.note', 'Note content', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1073, 1, 'en', 'packages/page/pages', 'notices.no_select', 'Please select at least one record to take this action!', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1074, 1, 'en', 'packages/page/pages', 'notices.update_success_message', 'Update successfully', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1075, 1, 'en', 'packages/page/pages', 'cannot_delete', 'Page could not be deleted', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1076, 1, 'en', 'packages/page/pages', 'deleted', 'Page deleted', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1077, 1, 'en', 'packages/page/pages', 'pages', 'Pages', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1078, 1, 'en', 'packages/page/pages', 'menu', 'Pages', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1079, 1, 'en', 'packages/page/pages', 'menu_name', 'Pages', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1080, 1, 'en', 'packages/page/pages', 'edit_this_page', 'Edit this page', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1081, 1, 'en', 'packages/page/pages', 'total_pages', 'Total pages', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1082, 1, 'en', 'packages/page/pages', 'settings.show_on_front', 'Your homepage displays', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1083, 1, 'en', 'packages/page/pages', 'settings.select', '— Select —', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1084, 1, 'en', 'packages/page/pages', 'front_page', 'Front Page', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1085, 1, 'en', 'packages/plugin-management/marketplace', 'previous', '&laquo; Previous', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1086, 1, 'en', 'packages/plugin-management/marketplace', 'next', 'Next &raquo;', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1087, 1, 'en', 'packages/plugin-management/marketplace', 'showing', 'Showing', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1088, 1, 'en', 'packages/plugin-management/marketplace', 'to', 'to', '2023-07-10 00:35:06', '2023-07-10 00:35:06'),
(1089, 1, 'en', 'packages/plugin-management/marketplace', 'of', 'of', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1090, 1, 'en', 'packages/plugin-management/marketplace', 'results', 'results', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1091, 1, 'en', 'packages/plugin-management/marketplace', 'add_new', 'Add new', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1092, 1, 'en', 'packages/plugin-management/marketplace', 'installed', 'Installed', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1093, 1, 'en', 'packages/plugin-management/marketplace', 'install_now', 'Install now', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1094, 1, 'en', 'packages/plugin-management/marketplace', 'installing', 'Installing...', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1095, 1, 'en', 'packages/plugin-management/marketplace', 'detail', 'Details', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1096, 1, 'en', 'packages/plugin-management/marketplace', 'version', 'Version', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1097, 1, 'en', 'packages/plugin-management/marketplace', 'minimum_core_version', 'Minimum core version', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1098, 1, 'en', 'packages/plugin-management/marketplace', 'last_update', 'Last update', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1099, 1, 'en', 'packages/plugin-management/marketplace', 'compatible_version', 'Compatible with your version', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1100, 1, 'en', 'packages/plugin-management/marketplace', 'incompatible_version', 'Incompatible with your version', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1101, 1, 'en', 'packages/plugin-management/marketplace', 'deactivate', 'Deactivate', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1102, 1, 'en', 'packages/plugin-management/marketplace', 'activate', 'Activate', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1103, 1, 'en', 'packages/plugin-management/marketplace', 'activating', 'Activating...', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1104, 1, 'en', 'packages/plugin-management/marketplace', 'activated', 'Activated', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1105, 1, 'en', 'packages/plugin-management/marketplace', 'connection_aborted', 'Connection Aborted', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1106, 1, 'en', 'packages/plugin-management/marketplace', 'connection_aborted_description', 'Connection Aborted Description', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1107, 1, 'en', 'packages/plugin-management/marketplace', 'api_connect_error', 'Connect to Marketplace API Error, please contact support', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1108, 1, 'en', 'packages/plugin-management/marketplace', 'keyword', 'Keyword', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1109, 1, 'en', 'packages/plugin-management/marketplace', 'search', 'Search', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1110, 1, 'en', 'packages/plugin-management/marketplace', 'all', 'All', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1111, 1, 'en', 'packages/plugin-management/marketplace', 'featured', 'Featured', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1112, 1, 'en', 'packages/plugin-management/marketplace', 'popular', 'Popular', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1113, 1, 'en', 'packages/plugin-management/marketplace', 'top_rated', 'Top Rated', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1114, 1, 'en', 'packages/plugin-management/marketplace', 'install_plugin', 'Install plugin', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1115, 1, 'en', 'packages/plugin-management/marketplace', 'cancel', 'Cancel', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1116, 1, 'en', 'packages/plugin-management/marketplace', 'yes_install', ' Yes! Install', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1117, 1, 'en', 'packages/plugin-management/marketplace', 'message_alert', 'Are you sure you want to install this plugin?', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1118, 1, 'en', 'packages/plugin-management/marketplace', 'folder_permissions', 'Folder does not have permission to write file or the update file path could not be resolved, please contact support', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1119, 1, 'en', 'packages/plugin-management/marketplace', 'unzip_failed', 'Unzip extraction failed', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1120, 1, 'en', 'packages/plugin-management/marketplace', 'unzip_success', 'Download file extracted', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1121, 1, 'en', 'packages/plugin-management/marketplace', 'install_success', 'Installed plugin successfully!', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1122, 1, 'en', 'packages/plugin-management/marketplace', 'update_success', 'Updated plugin successfully!', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1123, 1, 'en', 'packages/plugin-management/marketplace', 'minimum_core_version_error', 'Cannot install this plugin. Minimum core version is :version.', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1124, 1, 'en', 'packages/plugin-management/plugin', 'enabled', 'Enabled', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1125, 1, 'en', 'packages/plugin-management/plugin', 'deactivated', 'Deactivated', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1126, 1, 'en', 'packages/plugin-management/plugin', 'activated', 'Activated', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1127, 1, 'en', 'packages/plugin-management/plugin', 'activate', 'Activate', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1128, 1, 'en', 'packages/plugin-management/plugin', 'deactivate', 'Deactivate', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1129, 1, 'en', 'packages/plugin-management/plugin', 'author', 'By', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1130, 1, 'en', 'packages/plugin-management/plugin', 'update_plugin_status_success', 'Update plugin successfully', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1131, 1, 'en', 'packages/plugin-management/plugin', 'plugins', 'Plugins', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1132, 1, 'en', 'packages/plugin-management/plugin', 'missing_required_plugins', 'Please activate plugin(s): :plugins before activate this plugin!', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1133, 1, 'en', 'packages/plugin-management/plugin', 'remove', 'Remove', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1134, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin_success', 'Remove plugin successfully!', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1135, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin', 'Remove plugin', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1136, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin_confirm_message', 'Do you really want to remove this plugin?', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1137, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin_confirm_yes', 'Yes, remove it!', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1138, 1, 'en', 'packages/plugin-management/plugin', 'total_plugins', 'Total plugins', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1139, 1, 'en', 'packages/plugin-management/plugin', 'invalid_plugin', 'This plugin is not a valid plugin, please check it again!', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1140, 1, 'en', 'packages/plugin-management/plugin', 'version', 'Version', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1141, 1, 'en', 'packages/plugin-management/plugin', 'invalid_json', 'Invalid plugin.json!', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1142, 1, 'en', 'packages/plugin-management/plugin', 'activate_success', 'Activate plugin successfully!', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1143, 1, 'en', 'packages/plugin-management/plugin', 'activated_already', 'This plugin is activated already!', '2023-07-10 00:35:07', '2023-07-10 00:35:07');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1144, 1, 'en', 'packages/plugin-management/plugin', 'plugin_not_exist', 'This plugin is not exists.', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1145, 1, 'en', 'packages/plugin-management/plugin', 'missing_json_file', 'Missing file plugin.json!', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1146, 1, 'en', 'packages/plugin-management/plugin', 'plugin_invalid', 'Plugin is valid!', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1147, 1, 'en', 'packages/plugin-management/plugin', 'published_assets_success', 'Publish assets for plugin :name successfully!', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1148, 1, 'en', 'packages/plugin-management/plugin', 'plugin_removed', 'Plugin has been removed!', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1149, 1, 'en', 'packages/plugin-management/plugin', 'deactivated_success', 'Deactivate plugin successfully!', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1150, 1, 'en', 'packages/plugin-management/plugin', 'deactivated_already', 'This plugin is deactivated already!', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1151, 1, 'en', 'packages/plugin-management/plugin', 'folder_is_not_writeable', 'Cannot write files! Folder :name is not writable. Please chmod to make it writable!', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1152, 1, 'en', 'packages/plugin-management/plugin', 'plugin_is_not_ready', 'Plugin :name is not ready to use', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1153, 1, 'en', 'packages/plugin-management/plugin', 'plugins_installed', 'Installed Plugins', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1154, 1, 'en', 'packages/plugin-management/plugin', 'plugins_add_new', 'Add new', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1155, 1, 'en', 'packages/plugin-management/plugin', 'update', 'Update', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1156, 1, 'en', 'packages/plugin-management/plugin', 'requirement_not_met', 'Plugin :plugin requires plugin(s): :required_plugins. Do you want to install them and activate :plugin now?', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1157, 1, 'en', 'packages/plugin-management/plugin', 'install', 'Install now', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1158, 1, 'en', 'packages/plugin-management/plugin', 'install_plugin', 'Install Plugin', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1159, 1, 'en', 'packages/plugin-management/plugin', 'minimum_core_version_not_met', 'Plugin :plugin requires :minimum_core_version version of core, but your core version is :current_core_version. Please upgrade your core to use this plugin!', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1160, 1, 'en', 'packages/seo-helper/seo-helper', 'meta_box_header', 'Search Engine Optimize', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1161, 1, 'en', 'packages/seo-helper/seo-helper', 'edit_seo_meta', 'Edit SEO meta', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1162, 1, 'en', 'packages/seo-helper/seo-helper', 'default_description', 'Setup meta title & description to make your site easy to discovered on search engines such as Google', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1163, 1, 'en', 'packages/seo-helper/seo-helper', 'seo_title', 'SEO Title', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1164, 1, 'en', 'packages/seo-helper/seo-helper', 'seo_description', 'SEO description', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1165, 1, 'en', 'packages/slug/slug', 'permalink_settings', 'Permalink', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1166, 1, 'en', 'packages/slug/slug', 'settings.title', 'Permalink settings', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1167, 1, 'en', 'packages/slug/slug', 'settings.description', 'Manage permalink for all modules.', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1168, 1, 'en', 'packages/slug/slug', 'settings.preview', 'Preview', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1169, 1, 'en', 'packages/slug/slug', 'settings.turn_off_automatic_url_translation_into_latin', 'Turn off automatic URL translation into Latin?', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1170, 1, 'en', 'packages/slug/slug', 'settings.available_variables', 'Available variables', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1171, 1, 'en', 'packages/slug/slug', 'preview', 'Preview', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1172, 1, 'en', 'packages/slug/slug', 'prefix_for', 'Prefix for :name', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1173, 1, 'en', 'packages/slug/slug', 'public_single_ending_url', 'Postfix for single page URL', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1174, 1, 'en', 'packages/slug/slug', 'current_year', 'Current year', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1175, 1, 'en', 'packages/slug/slug', 'current_month', 'Current month', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1176, 1, 'en', 'packages/slug/slug', 'current_day', 'Current day', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1177, 1, 'en', 'packages/theme/theme', 'name', 'Themes', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1178, 1, 'en', 'packages/theme/theme', 'theme', 'Theme', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1179, 1, 'en', 'packages/theme/theme', 'author', 'Author', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1180, 1, 'en', 'packages/theme/theme', 'version', 'Version', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1181, 1, 'en', 'packages/theme/theme', 'description', 'Description', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1182, 1, 'en', 'packages/theme/theme', 'active_success', 'Activate theme :name successfully!', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1183, 1, 'en', 'packages/theme/theme', 'active', 'Active', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1184, 1, 'en', 'packages/theme/theme', 'activated', 'Activated', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1185, 1, 'en', 'packages/theme/theme', 'appearance', 'Appearance', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1186, 1, 'en', 'packages/theme/theme', 'theme_options', 'Theme options', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1187, 1, 'en', 'packages/theme/theme', 'save_changes', 'Save Changes', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1188, 1, 'en', 'packages/theme/theme', 'developer_mode', 'Developer Mode Enabled', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1189, 1, 'en', 'packages/theme/theme', 'custom_css', 'Custom CSS', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1190, 1, 'en', 'packages/theme/theme', 'custom_js', 'Custom JS', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1191, 1, 'en', 'packages/theme/theme', 'custom_header_js', 'Header JS', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1192, 1, 'en', 'packages/theme/theme', 'custom_header_js_placeholder', 'JS in header of page, wrap it inside &#x3C;script&#x3E;&#x3C;/script&#x3E;', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1193, 1, 'en', 'packages/theme/theme', 'custom_body_js', 'Body JS', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1194, 1, 'en', 'packages/theme/theme', 'custom_body_js_placeholder', 'JS in body of page, wrap it inside &#x3C;script&#x3E;&#x3C;/script&#x3E;', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1195, 1, 'en', 'packages/theme/theme', 'custom_footer_js', 'Footer JS', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1196, 1, 'en', 'packages/theme/theme', 'custom_footer_js_placeholder', 'JS in footer of page, wrap it inside &#x3C;script&#x3E;&#x3C;/script&#x3E;', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1197, 1, 'en', 'packages/theme/theme', 'custom_html', 'Custom HTML', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1198, 1, 'en', 'packages/theme/theme', 'custom_header_html', 'Header HTML', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1199, 1, 'en', 'packages/theme/theme', 'custom_header_html_placeholder', 'HTML in header of page, no special tags: script, style, iframe...', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1200, 1, 'en', 'packages/theme/theme', 'custom_body_html', 'Body HTML', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1201, 1, 'en', 'packages/theme/theme', 'custom_body_html_placeholder', 'HTML in body of page, no special tags: script, style, iframe...', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1202, 1, 'en', 'packages/theme/theme', 'custom_footer_html', 'Footer HTML', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1203, 1, 'en', 'packages/theme/theme', 'custom_footer_html_placeholder', 'HTML in footer of page, no special tags: script, style, iframe...', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1204, 1, 'en', 'packages/theme/theme', 'remove_theme_success', 'Remove theme successfully!', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1205, 1, 'en', 'packages/theme/theme', 'theme_is_not_existed', 'This theme is not existed!', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1206, 1, 'en', 'packages/theme/theme', 'remove', 'Remove', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1207, 1, 'en', 'packages/theme/theme', 'remove_theme', 'Remove theme', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1208, 1, 'en', 'packages/theme/theme', 'remove_theme_confirm_message', 'Do you really want to remove this theme?', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1209, 1, 'en', 'packages/theme/theme', 'remove_theme_confirm_yes', 'Yes, remove it!', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1210, 1, 'en', 'packages/theme/theme', 'total_themes', 'Total themes', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1211, 1, 'en', 'packages/theme/theme', 'show_admin_bar', 'Show admin bar (When admin logged in, still show admin bar in website)?', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1212, 1, 'en', 'packages/theme/theme', 'settings.title', 'Theme', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1213, 1, 'en', 'packages/theme/theme', 'settings.description', 'Setting for theme', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1214, 1, 'en', 'packages/theme/theme', 'settings.redirect_404_to_homepage', 'Redirect all not found requests to homepage?', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1215, 1, 'en', 'packages/theme/theme', 'settings.show_guidelines', 'Show guidelines?', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1216, 1, 'en', 'packages/theme/theme', 'add_new', 'Add new', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1217, 1, 'en', 'packages/theme/theme', 'theme_activated_already', 'Theme \":name\" is activated already!', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1218, 1, 'en', 'packages/theme/theme', 'missing_json_file', 'Missing file theme.json!', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1219, 1, 'en', 'packages/theme/theme', 'theme_invalid', 'Theme is valid!', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1220, 1, 'en', 'packages/theme/theme', 'published_assets_success', 'Publish assets for :themes successfully!', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1221, 1, 'en', 'packages/theme/theme', 'cannot_remove_theme', 'Cannot remove activated theme, please activate another theme before removing \":name\"!', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1222, 1, 'en', 'packages/theme/theme', 'theme_deleted', 'Theme \":name\" has been destroyed.', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1223, 1, 'en', 'packages/theme/theme', 'removed_assets', 'Remove assets of a theme :name successfully!', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1224, 1, 'en', 'packages/theme/theme', 'update_custom_css_success', 'Update custom CSS successfully!', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1225, 1, 'en', 'packages/theme/theme', 'update_custom_js_success', 'Update custom JS successfully!', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1226, 1, 'en', 'packages/theme/theme', 'update_custom_html_success', 'Update custom HTML successfully!', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1227, 1, 'en', 'packages/theme/theme', 'go_to_dashboard', 'Go to dashboard', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1228, 1, 'en', 'packages/theme/theme', 'custom_css_placeholder', 'Using Ctrl + Space to autocomplete.', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1229, 1, 'en', 'packages/theme/theme', 'theme_option_general', 'General', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1230, 1, 'en', 'packages/theme/theme', 'theme_option_general_description', 'General settings', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1231, 1, 'en', 'packages/theme/theme', 'theme_option_seo_open_graph_image', 'SEO default Open Graph image', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1232, 1, 'en', 'packages/theme/theme', 'theme_option_logo', 'Logo', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1233, 1, 'en', 'packages/theme/theme', 'theme_option_favicon', 'Favicon', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1234, 1, 'en', 'packages/theme/theme', 'folder_is_not_writeable', 'Cannot write files! Folder :name is not writable. Please chmod to make it writable!', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1235, 1, 'en', 'packages/widget/widget', 'name', 'Widgets', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1236, 1, 'en', 'packages/widget/widget', 'create', 'New widget', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1237, 1, 'en', 'packages/widget/widget', 'edit', 'Edit widget', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1238, 1, 'en', 'packages/widget/widget', 'delete', 'Delete', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1239, 1, 'en', 'packages/widget/widget', 'available', 'Available Widgets', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1240, 1, 'en', 'packages/widget/widget', 'instruction', 'To activate a widget drag it to a sidebar or click on it. To deactivate a widget and delete its settings, drag it back.', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1241, 1, 'en', 'packages/widget/widget', 'number_tag_display', 'Number tags will be display', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1242, 1, 'en', 'packages/widget/widget', 'number_post_display', 'Number posts will be display', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1243, 1, 'en', 'packages/widget/widget', 'select_menu', 'Select Menu', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1244, 1, 'en', 'packages/widget/widget', 'widget_text', 'Text', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1245, 1, 'en', 'packages/widget/widget', 'widget_text_description', 'Arbitrary text or HTML.', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1246, 1, 'en', 'packages/widget/widget', 'widget_recent_post', 'Recent Posts', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1247, 1, 'en', 'packages/widget/widget', 'widget_recent_post_description', 'Recent posts widget.', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1248, 1, 'en', 'packages/widget/widget', 'widget_custom_menu', 'Custom Menu', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1249, 1, 'en', 'packages/widget/widget', 'widget_custom_menu_description', 'Add a custom menu to your widget area.', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1250, 1, 'en', 'packages/widget/widget', 'widget_tag', 'Tags', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1251, 1, 'en', 'packages/widget/widget', 'widget_tag_description', 'Popular tags', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1252, 1, 'en', 'packages/widget/widget', 'save_success', 'Save widget successfully!', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1253, 1, 'en', 'packages/widget/widget', 'delete_success', 'Delete widget successfully!', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1254, 1, 'en', 'packages/widget/widget', 'primary_sidebar_name', 'Primary sidebar', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1255, 1, 'en', 'packages/widget/widget', 'primary_sidebar_description', 'Primary sidebar section', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1256, 1, 'en', 'plugins/analytics/analytics', 'sessions', 'Sessions', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1257, 1, 'en', 'plugins/analytics/analytics', 'visitors', 'Visitors', '2023-07-10 00:35:07', '2023-07-10 00:35:07'),
(1258, 1, 'en', 'plugins/analytics/analytics', 'pageviews', 'Pageviews', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1259, 1, 'en', 'plugins/analytics/analytics', 'bounce_rate', 'Bounce Rate', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1260, 1, 'en', 'plugins/analytics/analytics', 'page_session', 'Pages/Session', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1261, 1, 'en', 'plugins/analytics/analytics', 'avg_duration', 'Avg. Duration', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1262, 1, 'en', 'plugins/analytics/analytics', 'percent_new_session', 'Percent new session', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1263, 1, 'en', 'plugins/analytics/analytics', 'new_users', 'New visitors', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1264, 1, 'en', 'plugins/analytics/analytics', 'visits', 'visits', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1265, 1, 'en', 'plugins/analytics/analytics', 'views', 'views', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1266, 1, 'en', 'plugins/analytics/analytics', 'property_id_not_specified', 'You must provide a valid view id. The document here: <a href=\"https://docs.botble.com/cms/master/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/master/plugin-analytics</a>', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1267, 1, 'en', 'plugins/analytics/analytics', 'credential_is_not_valid', 'Analytics credentials is not valid. The document here: <a href=\"https://docs.botble.com/cms/master/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/master/plugin-analytics</a>', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1268, 1, 'en', 'plugins/analytics/analytics', 'start_date_can_not_before_end_date', 'Start date :start_date cannot be after end date :end_date', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1269, 1, 'en', 'plugins/analytics/analytics', 'wrong_configuration', 'To view analytics you\'ll need to get a Google Analytics client id and add it to your settings. <br /> You also need JSON credential data. <br /> The document here: <a href=\"https://docs.botble.com/cms/master/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/master/plugin-analytics</a>', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1270, 1, 'en', 'plugins/analytics/analytics', 'property_id_is_invalid', 'Property ID is invalid. Check this: https://developers.google.com/analytics/devguides/reporting/data/v1/property-id', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1271, 1, 'en', 'plugins/analytics/analytics', 'settings.title', 'Google Analytics', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1272, 1, 'en', 'plugins/analytics/analytics', 'settings.description', 'Config Credentials for Google Analytics', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1273, 1, 'en', 'plugins/analytics/analytics', 'settings.google_tag_id', 'Google tag ID', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1274, 1, 'en', 'plugins/analytics/analytics', 'settings.google_tag_id_placeholder', 'Example: G-76NX8HY29D', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1275, 1, 'en', 'plugins/analytics/analytics', 'settings.analytics_property_id', 'Property ID for GA4', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1276, 1, 'en', 'plugins/analytics/analytics', 'settings.analytics_property_id_description', 'Google Analytics Property ID (GA4)', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1277, 1, 'en', 'plugins/analytics/analytics', 'settings.json_credential', 'Service Account Credentials', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1278, 1, 'en', 'plugins/analytics/analytics', 'settings.json_credential_description', 'Service Account Credentials', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1279, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_page', 'Top Most Visit Pages', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1280, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_browser', 'Top Browsers', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1281, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_referrer', 'Top Referrers', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1282, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_general', 'Site Analytics', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1283, 1, 'en', 'plugins/analytics/analytics', 'missing_library_warning', 'Analytics plugin error: Missing third-party libraries, please run \"composer update\" to install them.', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1284, 1, 'en', 'plugins/audit-log/history', 'name', 'Activities Logs', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1285, 1, 'en', 'plugins/audit-log/history', 'created', 'created', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1286, 1, 'en', 'plugins/audit-log/history', 'updated', 'updated', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1287, 1, 'en', 'plugins/audit-log/history', 'deleted', 'deleted', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1288, 1, 'en', 'plugins/audit-log/history', 'logged in', 'logged in', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1289, 1, 'en', 'plugins/audit-log/history', 'logged out', 'logged out', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1290, 1, 'en', 'plugins/audit-log/history', 'changed password', 'changed password', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1291, 1, 'en', 'plugins/audit-log/history', 'updated profile', 'updated profile', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1292, 1, 'en', 'plugins/audit-log/history', 'attached', 'attached', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1293, 1, 'en', 'plugins/audit-log/history', 'shared', 'shared', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1294, 1, 'en', 'plugins/audit-log/history', 'to the system', 'to the system', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1295, 1, 'en', 'plugins/audit-log/history', 'of the system', 'of the system', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1296, 1, 'en', 'plugins/audit-log/history', 'menu', 'menu', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1297, 1, 'en', 'plugins/audit-log/history', 'post', 'post', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1298, 1, 'en', 'plugins/audit-log/history', 'page', 'page', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1299, 1, 'en', 'plugins/audit-log/history', 'category', 'category', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1300, 1, 'en', 'plugins/audit-log/history', 'tag', 'tag', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1301, 1, 'en', 'plugins/audit-log/history', 'user', 'user', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1302, 1, 'en', 'plugins/audit-log/history', 'contact', 'contact', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1303, 1, 'en', 'plugins/audit-log/history', 'backup', 'backup', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1304, 1, 'en', 'plugins/audit-log/history', 'custom-field', 'custom field', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1305, 1, 'en', 'plugins/audit-log/history', 'widget_audit_logs', 'Activities Logs', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1306, 1, 'en', 'plugins/audit-log/history', 'action', 'Action', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1307, 1, 'en', 'plugins/audit-log/history', 'user_agent', 'User Agent', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1308, 1, 'en', 'plugins/audit-log/history', 'system', 'System', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1309, 1, 'en', 'plugins/audit-log/history', 'delete_all', 'Delete all records', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1310, 1, 'en', 'plugins/backup/backup', 'name', 'Backup', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1311, 1, 'en', 'plugins/backup/backup', 'backup_description', 'Backup database and uploads folder.', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1312, 1, 'en', 'plugins/backup/backup', 'create_backup_success', 'Created backup successfully!', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1313, 1, 'en', 'plugins/backup/backup', 'delete_backup_success', 'Delete backup successfully!', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1314, 1, 'en', 'plugins/backup/backup', 'restore_backup_success', 'Restore backup successfully!', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1315, 1, 'en', 'plugins/backup/backup', 'generate_btn', 'Generate backup', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1316, 1, 'en', 'plugins/backup/backup', 'create', 'Create a backup', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1317, 1, 'en', 'plugins/backup/backup', 'restore', 'Restore a backup', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1318, 1, 'en', 'plugins/backup/backup', 'create_btn', 'Create', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1319, 1, 'en', 'plugins/backup/backup', 'restore_btn', 'Restore', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1320, 1, 'en', 'plugins/backup/backup', 'restore_confirm_msg', 'Do you really want to restore this revision?', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1321, 1, 'en', 'plugins/backup/backup', 'download_uploads_folder', 'Download backup of uploads folder', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1322, 1, 'en', 'plugins/backup/backup', 'download_database', 'Download backup of database', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1323, 1, 'en', 'plugins/backup/backup', 'restore_tooltip', 'Restore this backup', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1324, 1, 'en', 'plugins/backup/backup', 'demo_alert', 'Hi guest, if you see demo site is destroyed, please help me <a href=\":link\">go here</a> and restore demo site to the latest revision! Thank you so much!', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1325, 1, 'en', 'plugins/backup/backup', 'menu_name', 'Backups', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1326, 1, 'en', 'plugins/backup/backup', 'size', 'Size', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1327, 1, 'en', 'plugins/backup/backup', 'no_backups', 'There is no backup now!', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1328, 1, 'en', 'plugins/backup/backup', 'proc_open_disabled_error', 'Function <strong>proc_open()</strong> has been disabled so the system cannot backup the database. Please contact your hosting provider to enable it.', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1329, 1, 'en', 'plugins/backup/backup', 'database_backup_not_existed', 'Backup database is not existed!', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1330, 1, 'en', 'plugins/backup/backup', 'uploads_folder_backup_not_existed', 'Backup uploads folder is not existed!', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1331, 1, 'en', 'plugins/backup/backup', 'important_message1', 'This is a simple backup feature, it is a solution for you if your site has < 1GB data and can be used for quickly backup your site.', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1332, 1, 'en', 'plugins/backup/backup', 'important_message2', 'If you have more than 1GB images/files in local storage, you should use backup feature of your hosting or VPS.', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1333, 1, 'en', 'plugins/backup/backup', 'important_message3', 'To backup your database, function <strong>proc_open()</strong> or <strong>system()</strong> must be enabled. Contact your hosting provider to enable it if it is disabled.', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1334, 1, 'en', 'plugins/backup/backup', 'important_message4', 'It is not a full backup, it is just back up uploaded files and your database.', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1335, 1, 'en', 'plugins/backup/backup', 'cannot_restore_database', 'Cannot restore database. The database backup is missing!', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1336, 1, 'en', 'plugins/blog/base', 'menu_name', 'Blog', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1337, 1, 'en', 'plugins/blog/base', 'blog_page', 'Blog Page', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1338, 1, 'en', 'plugins/blog/base', 'select', '-- Select --', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1339, 1, 'en', 'plugins/blog/base', 'blog_page_id', 'Blog page', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1340, 1, 'en', 'plugins/blog/base', 'number_posts_per_page', 'Number posts per page', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1341, 1, 'en', 'plugins/blog/base', 'write_some_tags', 'Write some tags', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1342, 1, 'en', 'plugins/blog/base', 'short_code_name', 'Blog posts', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1343, 1, 'en', 'plugins/blog/base', 'short_code_description', 'Add blog posts', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1344, 1, 'en', 'plugins/blog/base', 'number_posts_per_page_in_category', 'Number of posts per page in a category', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1345, 1, 'en', 'plugins/blog/base', 'number_posts_per_page_in_tag', 'Number of posts per page in a tag', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1346, 1, 'en', 'plugins/blog/base', 'settings.title', 'Blog', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1347, 1, 'en', 'plugins/blog/base', 'settings.description', 'Settings for Blog', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1348, 1, 'en', 'plugins/blog/base', 'settings.enable_blog_post_schema', 'Enable Blog Post Schema?', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1349, 1, 'en', 'plugins/blog/base', 'settings.enable_blog_post_schema_description', 'Learn more: https://schema.org/Article', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1350, 1, 'en', 'plugins/blog/base', 'settings.schema_type', 'Schema type', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1351, 1, 'en', 'plugins/blog/categories', 'create', 'Create new category', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1352, 1, 'en', 'plugins/blog/categories', 'menu', 'Categories', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1353, 1, 'en', 'plugins/blog/categories', 'edit_this_category', 'Edit this category', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1354, 1, 'en', 'plugins/blog/categories', 'menu_name', 'Categories', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1355, 1, 'en', 'plugins/blog/categories', 'none', 'None', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1356, 1, 'en', 'plugins/blog/categories', 'total_posts', 'Total posts: :total', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1357, 1, 'en', 'plugins/blog/member', 'dob', 'Born :date', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1358, 1, 'en', 'plugins/blog/member', 'draft_posts', 'Draft Posts', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1359, 1, 'en', 'plugins/blog/member', 'pending_posts', 'Pending Posts', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1360, 1, 'en', 'plugins/blog/member', 'published_posts', 'Published Posts', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1361, 1, 'en', 'plugins/blog/member', 'posts', 'Posts', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1362, 1, 'en', 'plugins/blog/member', 'write_post', 'Write a post', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1363, 1, 'en', 'plugins/blog/posts', 'create', 'Create new post', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1364, 1, 'en', 'plugins/blog/posts', 'form.name', 'Name', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1365, 1, 'en', 'plugins/blog/posts', 'form.name_placeholder', 'Post\'s name (Maximum :c characters)', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1366, 1, 'en', 'plugins/blog/posts', 'form.description', 'Description', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1367, 1, 'en', 'plugins/blog/posts', 'form.description_placeholder', 'Short description for post (Maximum :c characters)', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1368, 1, 'en', 'plugins/blog/posts', 'form.categories', 'Categories', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1369, 1, 'en', 'plugins/blog/posts', 'form.tags', 'Tags', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1370, 1, 'en', 'plugins/blog/posts', 'form.tags_placeholder', 'Tags', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1371, 1, 'en', 'plugins/blog/posts', 'form.content', 'Content', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1372, 1, 'en', 'plugins/blog/posts', 'form.is_featured', 'Is featured?', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1373, 1, 'en', 'plugins/blog/posts', 'form.note', 'Note content', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1374, 1, 'en', 'plugins/blog/posts', 'form.format_type', 'Format', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1375, 1, 'en', 'plugins/blog/posts', 'cannot_delete', 'Post could not be deleted', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1376, 1, 'en', 'plugins/blog/posts', 'post_deleted', 'Post deleted', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1377, 1, 'en', 'plugins/blog/posts', 'posts', 'Posts', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1378, 1, 'en', 'plugins/blog/posts', 'post', 'Post', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1379, 1, 'en', 'plugins/blog/posts', 'edit_this_post', 'Edit this post', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1380, 1, 'en', 'plugins/blog/posts', 'no_new_post_now', 'There is no new post now!', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1381, 1, 'en', 'plugins/blog/posts', 'menu_name', 'Posts', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1382, 1, 'en', 'plugins/blog/posts', 'widget_posts_recent', 'Recent Posts', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1383, 1, 'en', 'plugins/blog/posts', 'categories', 'Categories', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1384, 1, 'en', 'plugins/blog/posts', 'category', 'Category', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1385, 1, 'en', 'plugins/blog/posts', 'author', 'Author', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1386, 1, 'en', 'plugins/blog/tags', 'form.name', 'Name', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1387, 1, 'en', 'plugins/blog/tags', 'form.name_placeholder', 'Tag\'s name (Maximum 120 characters)', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1388, 1, 'en', 'plugins/blog/tags', 'form.description', 'Description', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1389, 1, 'en', 'plugins/blog/tags', 'form.description_placeholder', 'Short description for tag (Maximum 400 characters)', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1390, 1, 'en', 'plugins/blog/tags', 'form.categories', 'Categories', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1391, 1, 'en', 'plugins/blog/tags', 'notices.no_select', 'Please select at least one tag to take this action!', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1392, 1, 'en', 'plugins/blog/tags', 'create', 'Create new tag', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1393, 1, 'en', 'plugins/blog/tags', 'cannot_delete', 'Tag could not be deleted', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1394, 1, 'en', 'plugins/blog/tags', 'deleted', 'Tag deleted', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1395, 1, 'en', 'plugins/blog/tags', 'menu', 'Tags', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1396, 1, 'en', 'plugins/blog/tags', 'edit_this_tag', 'Edit this tag', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1397, 1, 'en', 'plugins/blog/tags', 'menu_name', 'Tags', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1398, 1, 'en', 'plugins/captcha/captcha', 'settings.title', 'Captcha', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1399, 1, 'en', 'plugins/captcha/captcha', 'settings.description', 'Settings for Google Captcha', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1400, 1, 'en', 'plugins/captcha/captcha', 'settings.captcha_site_key', 'Captcha Site Key', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1401, 1, 'en', 'plugins/captcha/captcha', 'settings.captcha_secret', 'Captcha Secret', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1402, 1, 'en', 'plugins/captcha/captcha', 'settings.enable_captcha', 'Enable Captcha?', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1403, 1, 'en', 'plugins/captcha/captcha', 'settings.helper', 'Go here to get credentials https://www.google.com/recaptcha/admin#list.', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1404, 1, 'en', 'plugins/captcha/captcha', 'settings.hide_badge', 'Hide recaptcha badge (for v3)', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1405, 1, 'en', 'plugins/captcha/captcha', 'settings.type', 'Type', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1406, 1, 'en', 'plugins/captcha/captcha', 'settings.v2_description', 'V2 (Verify requests with a challenge)', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1407, 1, 'en', 'plugins/captcha/captcha', 'settings.v3_description', 'V3 (Verify requests with a score)', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1408, 1, 'en', 'plugins/captcha/captcha', 'numbers.0', 'Zero', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1409, 1, 'en', 'plugins/captcha/captcha', 'numbers.1', 'One', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1410, 1, 'en', 'plugins/captcha/captcha', 'numbers.2', 'Two', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1411, 1, 'en', 'plugins/captcha/captcha', 'numbers.3', 'Three', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1412, 1, 'en', 'plugins/captcha/captcha', 'numbers.4', 'Four', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1413, 1, 'en', 'plugins/captcha/captcha', 'numbers.5', 'Five', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1414, 1, 'en', 'plugins/captcha/captcha', 'numbers.6', 'Six', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1415, 1, 'en', 'plugins/captcha/captcha', 'numbers.7', 'Seven', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1416, 1, 'en', 'plugins/captcha/captcha', 'numbers.8', 'Eight', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1417, 1, 'en', 'plugins/captcha/captcha', 'numbers.9', 'Nine', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1418, 1, 'en', 'plugins/captcha/captcha', 'numbers.10', 'Ten', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1419, 1, 'en', 'plugins/captcha/captcha', 'numbers.11', 'Eleven', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1420, 1, 'en', 'plugins/captcha/captcha', 'numbers.12', 'Twelve', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1421, 1, 'en', 'plugins/captcha/captcha', 'operands.+', 'plus', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1422, 1, 'en', 'plugins/captcha/captcha', 'operands.-', 'minus', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1423, 1, 'en', 'plugins/captcha/captcha', 'operands.*', 'times', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1424, 1, 'en', 'plugins/captcha/captcha', 'operands./', 'divided by', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1425, 1, 'en', 'plugins/contact/contact', 'menu', 'Contact', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1426, 1, 'en', 'plugins/contact/contact', 'edit', 'View contact', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1427, 1, 'en', 'plugins/contact/contact', 'tables.phone', 'Phone', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1428, 1, 'en', 'plugins/contact/contact', 'tables.email', 'Email', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1429, 1, 'en', 'plugins/contact/contact', 'tables.full_name', 'Full Name', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1430, 1, 'en', 'plugins/contact/contact', 'tables.time', 'Time', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1431, 1, 'en', 'plugins/contact/contact', 'tables.address', 'Address', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1432, 1, 'en', 'plugins/contact/contact', 'tables.subject', 'Subject', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1433, 1, 'en', 'plugins/contact/contact', 'tables.content', 'Content', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1434, 1, 'en', 'plugins/contact/contact', 'contact_information', 'Contact information', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1435, 1, 'en', 'plugins/contact/contact', 'replies', 'Replies', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1436, 1, 'en', 'plugins/contact/contact', 'email.header', 'Email', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1437, 1, 'en', 'plugins/contact/contact', 'email.title', 'New contact from your site', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1438, 1, 'en', 'plugins/contact/contact', 'form.name.required', 'Name is required', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1439, 1, 'en', 'plugins/contact/contact', 'form.email.required', 'Email is required', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1440, 1, 'en', 'plugins/contact/contact', 'form.email.email', 'The email address is not valid', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1441, 1, 'en', 'plugins/contact/contact', 'form.content.required', 'Content is required', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1442, 1, 'en', 'plugins/contact/contact', 'contact_sent_from', 'This contact information sent from', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1443, 1, 'en', 'plugins/contact/contact', 'sender', 'Sender', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1444, 1, 'en', 'plugins/contact/contact', 'sender_email', 'Email', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1445, 1, 'en', 'plugins/contact/contact', 'sender_address', 'Address', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1446, 1, 'en', 'plugins/contact/contact', 'sender_phone', 'Phone', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1447, 1, 'en', 'plugins/contact/contact', 'message_content', 'Message content', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1448, 1, 'en', 'plugins/contact/contact', 'sent_from', 'Email sent from', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1449, 1, 'en', 'plugins/contact/contact', 'form_name', 'Name', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1450, 1, 'en', 'plugins/contact/contact', 'form_email', 'Email', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1451, 1, 'en', 'plugins/contact/contact', 'form_address', 'Address', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1452, 1, 'en', 'plugins/contact/contact', 'form_subject', 'Subject', '2023-07-10 00:35:08', '2023-07-10 00:35:08'),
(1453, 1, 'en', 'plugins/contact/contact', 'form_phone', 'Phone', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1454, 1, 'en', 'plugins/contact/contact', 'form_message', 'Message', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1455, 1, 'en', 'plugins/contact/contact', 'required_field', 'The field with (<span style=\"color: red\">*</span>) is required.', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1456, 1, 'en', 'plugins/contact/contact', 'send_btn', 'Send message', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1457, 1, 'en', 'plugins/contact/contact', 'new_msg_notice', 'You have <span class=\"bold\">:count</span> New Messages', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1458, 1, 'en', 'plugins/contact/contact', 'view_all', 'View all', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1459, 1, 'en', 'plugins/contact/contact', 'statuses.read', 'Read', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1460, 1, 'en', 'plugins/contact/contact', 'statuses.unread', 'Unread', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1461, 1, 'en', 'plugins/contact/contact', 'phone', 'Phone', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1462, 1, 'en', 'plugins/contact/contact', 'address', 'Address', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1463, 1, 'en', 'plugins/contact/contact', 'message', 'Message', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1464, 1, 'en', 'plugins/contact/contact', 'settings.email.title', 'Contact', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1465, 1, 'en', 'plugins/contact/contact', 'settings.email.description', 'Contact email configuration', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1466, 1, 'en', 'plugins/contact/contact', 'settings.email.templates.notice_title', 'Send notice to administrator', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1467, 1, 'en', 'plugins/contact/contact', 'settings.email.templates.notice_description', 'Email template to send notice to administrator when system get new contact', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1468, 1, 'en', 'plugins/contact/contact', 'settings.title', 'Contact', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1469, 1, 'en', 'plugins/contact/contact', 'settings.description', 'Settings for contact plugin', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1470, 1, 'en', 'plugins/contact/contact', 'settings.blacklist_keywords', 'Blacklist keywords', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1471, 1, 'en', 'plugins/contact/contact', 'settings.blacklist_keywords_placeholder', 'keywords...', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1472, 1, 'en', 'plugins/contact/contact', 'settings.blacklist_keywords_helper', 'Blacklist contact requests if it includes those keywords in the content field (separate by comma).', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1473, 1, 'en', 'plugins/contact/contact', 'settings.blacklist_email_domains', 'Blacklist email domains', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1474, 1, 'en', 'plugins/contact/contact', 'settings.blacklist_email_domains_placeholder', 'domain...', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1475, 1, 'en', 'plugins/contact/contact', 'settings.blacklist_email_domains_helper', 'Blacklist contact requests if the email domain is in blacklist domains (separate by comma).', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1476, 1, 'en', 'plugins/contact/contact', 'settings.enable_math_captcha', 'Enable math captcha?', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1477, 1, 'en', 'plugins/contact/contact', 'no_reply', 'No reply yet!', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1478, 1, 'en', 'plugins/contact/contact', 'reply', 'Reply', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1479, 1, 'en', 'plugins/contact/contact', 'send', 'Send', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1480, 1, 'en', 'plugins/contact/contact', 'shortcode_name', 'Contact form', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1481, 1, 'en', 'plugins/contact/contact', 'shortcode_description', 'Add a contact form', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1482, 1, 'en', 'plugins/contact/contact', 'shortcode_content_description', 'Add shortcode [contact-form][/contact-form] to editor?', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1483, 1, 'en', 'plugins/contact/contact', 'message_sent_success', 'Message sent successfully!', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1484, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.name', 'Cookie Consent', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1485, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.description', 'Cookie consent settings', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1486, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.enable', 'Enable cookie consent?', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1487, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.message', 'Message', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1488, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.button_text', 'Button text', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1489, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.max_width', 'Max width (px)', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1490, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.background_color', 'Background color', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1491, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.text_color', 'Text color', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1492, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.learn_more_url', 'Learn more URL', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1493, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.learn_more_text', 'Learn more text', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1494, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.style', 'Style', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1495, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.full_width', 'Full width', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1496, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.minimal', 'Minimal', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1497, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'message', 'Your experience on this site will be improved by allowing cookies.', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1498, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'button_text', 'Allow cookies', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1499, 1, 'en', 'plugins/faq/faq-category', 'name', 'Categories', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1500, 1, 'en', 'plugins/faq/faq-category', 'create', 'New category', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1501, 1, 'en', 'plugins/faq/faq', 'name', 'FAQ', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1502, 1, 'en', 'plugins/faq/faq', 'create', 'New faq', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1503, 1, 'en', 'plugins/faq/faq', 'question', 'Question', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1504, 1, 'en', 'plugins/faq/faq', 'answer', 'Answer', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1505, 1, 'en', 'plugins/faq/faq', 'category', 'Category', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1506, 1, 'en', 'plugins/faq/faq', 'all', 'All', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1507, 1, 'en', 'plugins/faq/faq', 'faq_schema_config', 'FAQ schema configuration (:link)', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1508, 1, 'en', 'plugins/faq/faq', 'learn_more', 'Learn more', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1509, 1, 'en', 'plugins/faq/faq', 'settings.title', 'FAQ', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1510, 1, 'en', 'plugins/faq/faq', 'settings.description', 'Settings for FAQ', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1511, 1, 'en', 'plugins/faq/faq', 'settings.enable_faq_schema', 'Enable FAQ Schema?', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1512, 1, 'en', 'plugins/faq/faq', 'settings.enable_faq_schema_description', 'Learn more: https://developers.google.com/search/docs/data-types/faqpage', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1513, 1, 'en', 'plugins/faq/faq', 'select_category', 'Select a category', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1514, 1, 'en', 'plugins/faq/faq', 'add_item', 'Add item', '2023-07-10 00:35:09', '2023-07-10 00:35:09');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1515, 1, 'en', 'plugins/job-board/account', 'name', 'Accounts', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1516, 1, 'en', 'plugins/job-board/account', 'create', 'New account', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1517, 1, 'en', 'plugins/job-board/account', 'confirmation_subject', 'Email verification', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1518, 1, 'en', 'plugins/job-board/account', 'confirmation_subject_title', 'Verify your email', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1519, 1, 'en', 'plugins/job-board/account', 'not_confirmed', 'The given email address has not been confirmed. <a href=\":resend_link\">Resend confirmation link.</a>', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1520, 1, 'en', 'plugins/job-board/account', 'confirmation_successful', 'You successfully confirmed your email address.', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1521, 1, 'en', 'plugins/job-board/account', 'confirmation_info', 'We have sent you an email to verify your email. Please check and confirm your email address!', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1522, 1, 'en', 'plugins/job-board/account', 'confirmation_resent', 'We sent you another confirmation email. You should receive it shortly.', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1523, 1, 'en', 'plugins/job-board/account', 'form.email', 'Email', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1524, 1, 'en', 'plugins/job-board/account', 'form.password', 'Password', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1525, 1, 'en', 'plugins/job-board/account', 'form.password_confirmation', 'Password confirmation', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1526, 1, 'en', 'plugins/job-board/account', 'form.change_password', 'Change password?', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1527, 1, 'en', 'plugins/job-board/account', 'form.is_public_profile', 'Public your profile?', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1528, 1, 'en', 'plugins/job-board/account', 'form.hide_cv', 'Hide your CV?', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1529, 1, 'en', 'plugins/job-board/account', 'form.avatar_image', 'Avatar image', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1530, 1, 'en', 'plugins/job-board/account', 'form.gender', 'Gender', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1531, 1, 'en', 'plugins/job-board/account', 'form.resume', 'Resume', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1532, 1, 'en', 'plugins/job-board/account', 'form.available_for_hiring', 'Available for hiring?', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1533, 1, 'en', 'plugins/job-board/account', 'form.company', 'Company', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1534, 1, 'en', 'plugins/job-board/account', 'form.position', 'Position', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1535, 1, 'en', 'plugins/job-board/account', 'form.school', 'School', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1536, 1, 'en', 'plugins/job-board/account', 'form.specialized', 'Specialized', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1537, 1, 'en', 'plugins/job-board/account', 'form.started_at', 'Started At', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1538, 1, 'en', 'plugins/job-board/account', 'form.ended_at', 'Ended At', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1539, 1, 'en', 'plugins/job-board/account', 'form.description', 'Description', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1540, 1, 'en', 'plugins/job-board/account', 'form.company_placeholder', 'Enter company', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1541, 1, 'en', 'plugins/job-board/account', 'form.position_placeholder', 'Enter position', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1542, 1, 'en', 'plugins/job-board/account', 'form.school_placeholder', 'Enter school', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1543, 1, 'en', 'plugins/job-board/account', 'form.specialized_placeholder', 'Enter specialized', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1544, 1, 'en', 'plugins/job-board/account', 'form.number_of_credits', 'Number of credits', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1545, 1, 'en', 'plugins/job-board/account', 'confirm_delete', 'Are you sure you want to delete this item?', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1546, 1, 'en', 'plugins/job-board/account', 'forgot_password', 'Forgot password', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1547, 1, 'en', 'plugins/job-board/account', 'login', 'Login', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1548, 1, 'en', 'plugins/job-board/account', 'type', 'Type', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1549, 1, 'en', 'plugins/job-board/account', 'types.job-seeker', 'Job seeker', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1550, 1, 'en', 'plugins/job-board/account', 'types.employer', 'Employer', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1551, 1, 'en', 'plugins/job-board/account', 'buy_credits', 'Buy credits', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1552, 1, 'en', 'plugins/job-board/account', 'credits', 'credits', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1553, 1, 'en', 'plugins/job-board/account', 'emails.title', 'Account', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1554, 1, 'en', 'plugins/job-board/account', 'emails.description', 'Account email configuration', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1555, 1, 'en', 'plugins/job-board/account', 'enums.genders.male', 'Male', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1556, 1, 'en', 'plugins/job-board/account', 'enums.genders.female', 'Female', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1557, 1, 'en', 'plugins/job-board/account', 'enums.genders.other', 'Other', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1558, 1, 'en', 'plugins/job-board/account', 'table.educations.school', 'School', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1559, 1, 'en', 'plugins/job-board/account', 'table.educations.specialized', 'Specialized', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1560, 1, 'en', 'plugins/job-board/account', 'table.experiences.company', 'Company', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1561, 1, 'en', 'plugins/job-board/account', 'table.experiences.position', 'Position', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1562, 1, 'en', 'plugins/job-board/account', 'table.started_at', 'Started At', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1563, 1, 'en', 'plugins/job-board/account', 'table.ended_at', 'Ended At', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1564, 1, 'en', 'plugins/job-board/account', 'table.action', 'Action', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1565, 1, 'en', 'plugins/job-board/account', 'action_table.edit', 'Edit', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1566, 1, 'en', 'plugins/job-board/account', 'action_table.delete', 'Delete', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1567, 1, 'en', 'plugins/job-board/account', 'action_table.add', 'Add', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1568, 1, 'en', 'plugins/job-board/account', 'edit_education', 'Edit education', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1569, 1, 'en', 'plugins/job-board/account', 'add_education', 'Add education', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1570, 1, 'en', 'plugins/job-board/account', 'edit_experience', 'Edit experience', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1571, 1, 'en', 'plugins/job-board/account', 'add_experience', 'Add experience', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1572, 1, 'en', 'plugins/job-board/account', 'no_education', 'No educations', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1573, 1, 'en', 'plugins/job-board/account', 'no_experience', 'No experiences', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1574, 1, 'en', 'plugins/job-board/account', 'now', 'Now', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1575, 1, 'en', 'plugins/job-board/account', 'add_credit_to_account', 'Add credit to account', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1576, 1, 'en', 'plugins/job-board/account', 'no_transactions', 'No transactions', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1577, 1, 'en', 'plugins/job-board/account', 'transactions', 'Transactions', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1578, 1, 'en', 'plugins/job-board/account', 'add_credit', 'Add credit', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1579, 1, 'en', 'plugins/job-board/account', 'added', 'Added', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1580, 1, 'en', 'plugins/job-board/account', 'educations.store', 'Created education successfully!', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1581, 1, 'en', 'plugins/job-board/account', 'educations.update', 'Updated education successfully!', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1582, 1, 'en', 'plugins/job-board/account', 'educations.delete', 'Deleted education successfully!', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1583, 1, 'en', 'plugins/job-board/account', 'experiences.store', 'Created experience successfully!', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1584, 1, 'en', 'plugins/job-board/account', 'experiences.update', 'Updated experience successfully!', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1585, 1, 'en', 'plugins/job-board/account', 'experiences.delete', 'Deleted experience successfully!', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1586, 1, 'en', 'plugins/job-board/account', 'import.name', 'Import Accounts', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1587, 1, 'en', 'plugins/job-board/account', 'export.name', 'Export Accounts', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1588, 1, 'en', 'plugins/job-board/account', 'export.total', 'Total Accounts', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1589, 1, 'en', 'plugins/job-board/career-level', 'name', 'Career levels', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1590, 1, 'en', 'plugins/job-board/career-level', 'create', 'New career level', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1591, 1, 'en', 'plugins/job-board/company', 'name', 'Companies', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1592, 1, 'en', 'plugins/job-board/company', 'create', 'New company', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1593, 1, 'en', 'plugins/job-board/currency', 'currencies', 'Currencies', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1594, 1, 'en', 'plugins/job-board/currency', 'setting_description', 'List of currencies using on website', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1595, 1, 'en', 'plugins/job-board/currency', 'name', 'Name', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1596, 1, 'en', 'plugins/job-board/currency', 'symbol', 'Symbol', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1597, 1, 'en', 'plugins/job-board/currency', 'number_of_decimals', 'Number of decimals', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1598, 1, 'en', 'plugins/job-board/currency', 'exchange_rate', 'Exchange rate', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1599, 1, 'en', 'plugins/job-board/currency', 'is_prefix_symbol', 'Position of symbol', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1600, 1, 'en', 'plugins/job-board/currency', 'is_default', 'Is default?', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1601, 1, 'en', 'plugins/job-board/currency', 'remove', 'Remove', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1602, 1, 'en', 'plugins/job-board/currency', 'new_currency', 'Add a new currency', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1603, 1, 'en', 'plugins/job-board/currency', 'save_settings', 'Save settings', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1604, 1, 'en', 'plugins/job-board/currency', 'before_number', 'Before number', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1605, 1, 'en', 'plugins/job-board/currency', 'after_number', 'After number', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1606, 1, 'en', 'plugins/job-board/currency', 'require_at_least_one_currency', 'The system requires at least one currency!', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1607, 1, 'en', 'plugins/job-board/currency', 'enable_auto_detect_visitor_currency', 'Enable auto-detect visitor currency?', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1608, 1, 'en', 'plugins/job-board/currency', 'auto_detect_visitor_currency_description', 'It detects visitor currency based on browser language. It will override default currency selection.', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1609, 1, 'en', 'plugins/job-board/currency', 'add_space_between_price_and_currency', 'Add a space between price and currency?', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1610, 1, 'en', 'plugins/job-board/currency', 'invalid_currency_name', 'Invalid currency code, it must be in :currencies.', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1611, 1, 'en', 'plugins/job-board/currency', 'instruction', 'Please check list currency code here: https://en.wikipedia.org/wiki/ISO_4217', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1612, 1, 'en', 'plugins/job-board/currency', 'code', 'Code', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1613, 1, 'en', 'plugins/job-board/custom-fields', 'name', 'Custom Fields', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1614, 1, 'en', 'plugins/job-board/custom-fields', 'create', 'Create', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1615, 1, 'en', 'plugins/job-board/custom-fields', 'edit', 'Edit :name', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1616, 1, 'en', 'plugins/job-board/custom-fields', 'type', 'Type', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1617, 1, 'en', 'plugins/job-board/custom-fields', 'options', 'Options', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1618, 1, 'en', 'plugins/job-board/custom-fields', 'option.label', 'Label', '2023-07-10 00:35:09', '2023-07-10 00:35:09'),
(1619, 1, 'en', 'plugins/job-board/custom-fields', 'option.value', 'Value', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1620, 1, 'en', 'plugins/job-board/custom-fields', 'option.add_row', 'Add new row', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1621, 1, 'en', 'plugins/job-board/custom-fields', 'option.add_from_global', 'Add global custom field', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1622, 1, 'en', 'plugins/job-board/custom-fields', 'modal.heading', 'Add new custom field', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1623, 1, 'en', 'plugins/job-board/custom-fields', 'modal.select_field', 'Select field', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1624, 1, 'en', 'plugins/job-board/custom-fields', 'modal.button', 'Add new', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1625, 1, 'en', 'plugins/job-board/custom-fields', 'enums.fields.text', 'Text', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1626, 1, 'en', 'plugins/job-board/custom-fields', 'enums.fields.dropdown', 'Dropdown', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1627, 1, 'en', 'plugins/job-board/custom-fields', 'ask_for_select', 'Please select a custom field', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1628, 1, 'en', 'plugins/job-board/custom-fields', 'add_a_new_custom_field', 'Add a new custom field', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1629, 1, 'en', 'plugins/job-board/dashboard', 'joined_on', 'Joined :date', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1630, 1, 'en', 'plugins/job-board/dashboard', 'dob', 'Born :date', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1631, 1, 'en', 'plugins/job-board/dashboard', 'email', 'Email', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1632, 1, 'en', 'plugins/job-board/dashboard', 'password', 'Password', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1633, 1, 'en', 'plugins/job-board/dashboard', 'password-confirmation', 'Confirm Password', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1634, 1, 'en', 'plugins/job-board/dashboard', 'remember-me', 'Remember Me', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1635, 1, 'en', 'plugins/job-board/dashboard', 'login-title', 'Login', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1636, 1, 'en', 'plugins/job-board/dashboard', 'login-cta', 'Login', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1637, 1, 'en', 'plugins/job-board/dashboard', 'register-title', 'Register', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1638, 1, 'en', 'plugins/job-board/dashboard', 'register-cta', 'Register', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1639, 1, 'en', 'plugins/job-board/dashboard', 'forgot-password-cta', 'Forgot Your Password?', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1640, 1, 'en', 'plugins/job-board/dashboard', 'name', 'Name', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1641, 1, 'en', 'plugins/job-board/dashboard', 'reset-password-title', 'Reset Password', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1642, 1, 'en', 'plugins/job-board/dashboard', 'reset-password-cta', 'Reset Password', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1643, 1, 'en', 'plugins/job-board/dashboard', 'cancel-link', 'Cancel', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1644, 1, 'en', 'plugins/job-board/dashboard', 'logout-cta', 'Logout', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1645, 1, 'en', 'plugins/job-board/dashboard', 'header_profile_link', 'Profile', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1646, 1, 'en', 'plugins/job-board/dashboard', 'header_settings_link', 'Settings', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1647, 1, 'en', 'plugins/job-board/dashboard', 'header_logout_link', 'Logout', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1648, 1, 'en', 'plugins/job-board/dashboard', 'unknown_state', 'Unknown', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1649, 1, 'en', 'plugins/job-board/dashboard', 'close', 'Close', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1650, 1, 'en', 'plugins/job-board/dashboard', 'save', 'Save', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1651, 1, 'en', 'plugins/job-board/dashboard', 'loading', 'Loading...', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1652, 1, 'en', 'plugins/job-board/dashboard', 'new_image', 'New image', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1653, 1, 'en', 'plugins/job-board/dashboard', 'change_profile_image', 'Change avatar', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1654, 1, 'en', 'plugins/job-board/dashboard', 'save_cropped_image_failed', 'Save cropped image failed!', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1655, 1, 'en', 'plugins/job-board/dashboard', 'failed_to_crop_image', 'Failed to crop image', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1656, 1, 'en', 'plugins/job-board/dashboard', 'failed_to_load_data', 'Failed to load data', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1657, 1, 'en', 'plugins/job-board/dashboard', 'read_image_failed', 'Read image failed', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1658, 1, 'en', 'plugins/job-board/dashboard', 'update_avatar_success', 'Update avatar successfully!', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1659, 1, 'en', 'plugins/job-board/dashboard', 'change_avatar_description', 'Click on image to change avatar', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1660, 1, 'en', 'plugins/job-board/dashboard', 'notices.error', 'Error!', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1661, 1, 'en', 'plugins/job-board/dashboard', 'notices.success', 'Success!', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1662, 1, 'en', 'plugins/job-board/dashboard', 'sidebar_title', 'Personal settings', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1663, 1, 'en', 'plugins/job-board/dashboard', 'sidebar_information', 'Account Information', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1664, 1, 'en', 'plugins/job-board/dashboard', 'sidebar_security', 'Security', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1665, 1, 'en', 'plugins/job-board/dashboard', 'sidebar_packages', 'Packages', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1666, 1, 'en', 'plugins/job-board/dashboard', 'sidebar_transactions', 'Transactions', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1667, 1, 'en', 'plugins/job-board/dashboard', 'account_field_title', 'Account Information', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1668, 1, 'en', 'plugins/job-board/dashboard', 'profile-picture', 'Profile picture', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1669, 1, 'en', 'plugins/job-board/dashboard', 'uploading', 'Uploading...', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1670, 1, 'en', 'plugins/job-board/dashboard', 'phone', 'Phone', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1671, 1, 'en', 'plugins/job-board/dashboard', 'first_name', 'First name', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1672, 1, 'en', 'plugins/job-board/dashboard', 'last_name', 'Last name', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1673, 1, 'en', 'plugins/job-board/dashboard', 'description', 'Description', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1674, 1, 'en', 'plugins/job-board/dashboard', 'description_placeholder', 'Tell something about yourself...', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1675, 1, 'en', 'plugins/job-board/dashboard', 'verified', 'Verified', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1676, 1, 'en', 'plugins/job-board/dashboard', 'verify_require_desc', 'Please verify email by link we sent to you.', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1677, 1, 'en', 'plugins/job-board/dashboard', 'birthday', 'Birthday', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1678, 1, 'en', 'plugins/job-board/dashboard', 'year_lc', 'year', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1679, 1, 'en', 'plugins/job-board/dashboard', 'month_lc', 'month', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1680, 1, 'en', 'plugins/job-board/dashboard', 'day_lc', 'day', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1681, 1, 'en', 'plugins/job-board/dashboard', 'gender', 'Gender', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1682, 1, 'en', 'plugins/job-board/dashboard', 'gender_male', 'Male', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1683, 1, 'en', 'plugins/job-board/dashboard', 'gender_female', 'Female', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1684, 1, 'en', 'plugins/job-board/dashboard', 'gender_other', 'Other', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1685, 1, 'en', 'plugins/job-board/dashboard', 'security_title', 'Security', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1686, 1, 'en', 'plugins/job-board/dashboard', 'packages_title', 'Packages', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1687, 1, 'en', 'plugins/job-board/dashboard', 'transactions_title', 'Transactions', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1688, 1, 'en', 'plugins/job-board/dashboard', 'current_password', 'Current password', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1689, 1, 'en', 'plugins/job-board/dashboard', 'password_new', 'New password', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1690, 1, 'en', 'plugins/job-board/dashboard', 'password_new_confirmation', 'Confirmation password', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1691, 1, 'en', 'plugins/job-board/dashboard', 'password_update_btn', 'Update password', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1692, 1, 'en', 'plugins/job-board/dashboard', 'current_password_incorrect', 'The current password is incorrect!', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1693, 1, 'en', 'plugins/job-board/dashboard', 'password_update_success', 'Updated password successfully!', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1694, 1, 'en', 'plugins/job-board/dashboard', 'activity_logs', 'Activity Logs', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1695, 1, 'en', 'plugins/job-board/dashboard', 'oops', 'Oops!', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1696, 1, 'en', 'plugins/job-board/dashboard', 'no_activity_logs', 'You have no activity logs yet', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1697, 1, 'en', 'plugins/job-board/dashboard', 'actions.create_job', 'You have created job \":name\"', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1698, 1, 'en', 'plugins/job-board/dashboard', 'actions.update_job', 'You have updated job \":name\"', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1699, 1, 'en', 'plugins/job-board/dashboard', 'actions.delete_job', 'You have deleted job \":name\"', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1700, 1, 'en', 'plugins/job-board/dashboard', 'actions.renew_job', 'You have renewed job \":name\"', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1701, 1, 'en', 'plugins/job-board/dashboard', 'actions.update_setting', 'You have updated your settings', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1702, 1, 'en', 'plugins/job-board/dashboard', 'actions.update_security', 'You have updated your security settings', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1703, 1, 'en', 'plugins/job-board/dashboard', 'actions.your_job_updated_by_admin', 'Your job \":name\" is updated by administrator', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1704, 1, 'en', 'plugins/job-board/dashboard', 'actions.changed_avatar', 'You have changed your avatar', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1705, 1, 'en', 'plugins/job-board/dashboard', 'actions.update_company', 'You have updated company \":name\"', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1706, 1, 'en', 'plugins/job-board/dashboard', 'actions.create_company', 'You have created company \":name\"', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1707, 1, 'en', 'plugins/job-board/dashboard', 'actions.delete_company', 'You have deleted company \":name\"', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1708, 1, 'en', 'plugins/job-board/dashboard', 'load_more', 'Load more', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1709, 1, 'en', 'plugins/job-board/dashboard', 'loading_more', 'Loading...', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1710, 1, 'en', 'plugins/job-board/dashboard', 'back-to-login', 'Back to login page', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1711, 1, 'en', 'plugins/job-board/dashboard', 'no_transactions', 'No transactions', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1712, 1, 'en', 'plugins/job-board/dashboard', 'company_profile', 'Company profile', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1713, 1, 'en', 'plugins/job-board/dashboard', 'logo', 'Logo (~500x500)', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1714, 1, 'en', 'plugins/job-board/dashboard', 'cover_image', 'Cover image (~1920x300)', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1715, 1, 'en', 'plugins/job-board/dashboard', 'website', 'Website', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1716, 1, 'en', 'plugins/job-board/dashboard', 'address', 'Address', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1717, 1, 'en', 'plugins/job-board/dashboard', 'ceo', 'CEO', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1718, 1, 'en', 'plugins/job-board/dashboard', 'resume', 'Resume', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1719, 1, 'en', 'plugins/job-board/dashboard', 'resend', 'Resend', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1720, 1, 'en', 'plugins/job-board/dashboard', 'active_jobs', 'Active jobs', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1721, 1, 'en', 'plugins/job-board/dashboard', 'expired_jobs', 'Expired jobs', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1722, 1, 'en', 'plugins/job-board/dashboard', 'draft_jobs', 'Rejected jobs', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1723, 1, 'en', 'plugins/job-board/dashboard', 'jobs', 'Jobs', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1724, 1, 'en', 'plugins/job-board/dashboard', 'post_a_job', 'Post a Job', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1725, 1, 'en', 'plugins/job-board/dashboard', 'your_credits', 'Your Credits', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1726, 1, 'en', 'plugins/job-board/dashboard', 'credits', 'credits', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1727, 1, 'en', 'plugins/job-board/dashboard', 'purchase', 'Purchase', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1728, 1, 'en', 'plugins/job-board/dashboard', 'type', 'Type', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1729, 1, 'en', 'plugins/job-board/dashboard', 'cover_letter', 'Cover letter', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1730, 1, 'en', 'plugins/job-board/degree-level', 'name', 'Degree levels', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1731, 1, 'en', 'plugins/job-board/degree-level', 'create', 'New degree level', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1732, 1, 'en', 'plugins/job-board/degree-type', 'name', 'Degree types', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1733, 1, 'en', 'plugins/job-board/degree-type', 'create', 'New degree type', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1734, 1, 'en', 'plugins/job-board/degree-type', 'degree-level', 'Degree level', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1735, 1, 'en', 'plugins/job-board/export', 'jobs.name', 'Export Jobs', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1736, 1, 'en', 'plugins/job-board/export', 'jobs.total_jobs', 'Total Jobs', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1737, 1, 'en', 'plugins/job-board/export', 'companies.name', 'Export Companies', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1738, 1, 'en', 'plugins/job-board/export', 'companies.total_companies', 'Total Companies', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1739, 1, 'en', 'plugins/job-board/export', 'start_export', 'Start Export', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1740, 1, 'en', 'plugins/job-board/export', 'exporting', 'Exporting...', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1741, 1, 'en', 'plugins/job-board/functional-area', 'name', 'Functional areas', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1742, 1, 'en', 'plugins/job-board/functional-area', 'create', 'New functional area', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1743, 1, 'en', 'plugins/job-board/import', 'name', 'Import Jobs', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1744, 1, 'en', 'plugins/job-board/import', 'choose_file', 'Choose file', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1745, 1, 'en', 'plugins/job-board/import', 'choose_file_description', 'Choose file with mimes: :types.', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1746, 1, 'en', 'plugins/job-board/import', 'import_success_message', 'Imported successfully.', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1747, 1, 'en', 'plugins/job-board/import', 'import_failed_message', 'Import failed, please check the errors below!', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1748, 1, 'en', 'plugins/job-board/import', 'row', 'Row', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1749, 1, 'en', 'plugins/job-board/import', 'attribute', 'Attribute', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1750, 1, 'en', 'plugins/job-board/import', 'errors', 'Errors', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1751, 1, 'en', 'plugins/job-board/import', 'failures', 'Failures', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1752, 1, 'en', 'plugins/job-board/import', 'results', 'Result: :success success(es), :failed failure(s)', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1753, 1, 'en', 'plugins/job-board/import', 'rules', 'Rules', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1754, 1, 'en', 'plugins/job-board/import', 'column', 'Column', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1755, 1, 'en', 'plugins/job-board/import', 'template', 'Sample template', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1756, 1, 'en', 'plugins/job-board/import', 'download_csv_file', 'Download CSV file', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1757, 1, 'en', 'plugins/job-board/import', 'download_excel_file', 'Download Excel file', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1758, 1, 'en', 'plugins/job-board/import', 'downloading', 'Downloading', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1759, 1, 'en', 'plugins/job-board/import', 'company.name', 'Import Companies', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1760, 1, 'en', 'plugins/job-board/invoice-template', 'name', 'Invoice template', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1761, 1, 'en', 'plugins/job-board/invoice-template', 'setting', 'Invoice Settings', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1762, 1, 'en', 'plugins/job-board/invoice-template', 'setting_description', 'Settings for Invoice template', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1763, 1, 'en', 'plugins/job-board/invoice-template', 'setting_content', 'Content', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1764, 1, 'en', 'plugins/job-board/invoice-template', 'preview', 'Preview', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1765, 1, 'en', 'plugins/job-board/invoice-template', 'preview_heading', 'Preview Invoice template', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1766, 1, 'en', 'plugins/job-board/invoice', 'name', 'Invoices', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1767, 1, 'en', 'plugins/job-board/invoice', 'create', 'New invoice', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1768, 1, 'en', 'plugins/job-board/invoice', 'edit', 'Edit invoice', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1769, 1, 'en', 'plugins/job-board/invoice', 'print', 'Print Invoice', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1770, 1, 'en', 'plugins/job-board/invoice', 'download', 'Download Invoice', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1771, 1, 'en', 'plugins/job-board/invoice', 'heading', 'Invoice', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1772, 1, 'en', 'plugins/job-board/invoice', 'invoice_for_job', '', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1773, 1, 'en', 'plugins/job-board/invoice', 'table.code', 'Code', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1774, 1, 'en', 'plugins/job-board/invoice', 'table.amount', 'Amount', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1775, 1, 'en', 'plugins/job-board/invoice', 'detail.invoice_for', 'Invoice For', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1776, 1, 'en', 'plugins/job-board/invoice', 'detail.invoice_to', 'Invoice To', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1777, 1, 'en', 'plugins/job-board/invoice', 'detail.tax_id', 'Tax ID', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1778, 1, 'en', 'plugins/job-board/invoice', 'detail.code', 'Invoice Code', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1779, 1, 'en', 'plugins/job-board/invoice', 'detail.issue_at', 'Issue At', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1780, 1, 'en', 'plugins/job-board/invoice', 'detail.description', 'Description', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1781, 1, 'en', 'plugins/job-board/invoice', 'detail.qty', 'Qty', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1782, 1, 'en', 'plugins/job-board/invoice', 'detail.amount', 'Amount', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1783, 1, 'en', 'plugins/job-board/invoice', 'detail.discount', 'Discount', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1784, 1, 'en', 'plugins/job-board/invoice', 'detail.grand_total', 'Grand Total', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1785, 1, 'en', 'plugins/job-board/invoice', 'detail.shipping_fee', 'Shipping Fee', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1786, 1, 'en', 'plugins/job-board/invoice', 'detail.sub_total', 'Sub Total', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1787, 1, 'en', 'plugins/job-board/invoice', 'detail.tax', 'Tax', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1788, 1, 'en', 'plugins/job-board/invoice', 'detail.total', 'Total', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1789, 1, 'en', 'plugins/job-board/invoice', 'total_amount', 'Total Amount', '2023-07-10 00:35:10', '2023-07-10 00:35:10'),
(1790, 1, 'en', 'plugins/job-board/invoice', 'payment_info', 'Payment Info', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1791, 1, 'en', 'plugins/job-board/invoice', 'payment_method', 'Payment Method', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1792, 1, 'en', 'plugins/job-board/invoice', 'payment_status', 'Payment Status', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1793, 1, 'en', 'plugins/job-board/job-application', 'name', 'Job Applications', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1794, 1, 'en', 'plugins/job-board/job-application', 'edit', 'View job application', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1795, 1, 'en', 'plugins/job-board/job-application', 'tables.email', 'Email', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1796, 1, 'en', 'plugins/job-board/job-application', 'tables.phone', 'Phone', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1797, 1, 'en', 'plugins/job-board/job-application', 'tables.name', 'Name', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1798, 1, 'en', 'plugins/job-board/job-application', 'tables.first_name', 'First name', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1799, 1, 'en', 'plugins/job-board/job-application', 'tables.last_name', 'Last name', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1800, 1, 'en', 'plugins/job-board/job-application', 'tables.time', 'Time', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1801, 1, 'en', 'plugins/job-board/job-application', 'tables.message', 'Summary', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1802, 1, 'en', 'plugins/job-board/job-application', 'tables.resume', 'Resume', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1803, 1, 'en', 'plugins/job-board/job-application', 'tables.cover_letter', 'Cover Letter', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1804, 1, 'en', 'plugins/job-board/job-application', 'tables.position', 'Position', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1805, 1, 'en', 'plugins/job-board/job-application', 'tables.download_resume', 'Download Resume', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1806, 1, 'en', 'plugins/job-board/job-application', 'information', 'Information', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1807, 1, 'en', 'plugins/job-board/job-application', 'email.header', 'Email', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1808, 1, 'en', 'plugins/job-board/job-application', 'email.title', 'We received a new job application from the website!', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1809, 1, 'en', 'plugins/job-board/job-application', 'email.success', 'Applied successfully!', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1810, 1, 'en', 'plugins/job-board/job-application', 'email.failed', 'Can\'t apply on this time, please try again later!', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1811, 1, 'en', 'plugins/job-board/job-application', 'sender', 'Sender', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1812, 1, 'en', 'plugins/job-board/job-application', 'sender_email', 'Email', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1813, 1, 'en', 'plugins/job-board/job-application', 'statuses.pending', 'Pending', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1814, 1, 'en', 'plugins/job-board/job-application', 'statuses.checked', 'Checked', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1815, 1, 'en', 'plugins/job-board/job-board', 'name', 'Job Board', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1816, 1, 'en', 'plugins/job-board/job-board', 'settings', 'Settings', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1817, 1, 'en', 'plugins/job-board/job-board', 'emails.title', 'Job Board', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1818, 1, 'en', 'plugins/job-board/job-board', 'emails.description', 'Job Board email configuration', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1819, 1, 'en', 'plugins/job-board/job-board', 'emails.templates.admin_new_job_application_title', 'New job application (to admin users)', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1820, 1, 'en', 'plugins/job-board/job-board', 'emails.templates.admin_new_job_application_description', 'Email template to send notice to administrators when system get new job application', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1821, 1, 'en', 'plugins/job-board/job-board', 'emails.templates.employer_new_job_application_title', 'New job application (to employer and colleagues)', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1822, 1, 'en', 'plugins/job-board/job-board', 'emails.templates.employer_new_job_application_description', 'Email template to send notice to employer and colleagues when system get new job application', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1823, 1, 'en', 'plugins/job-board/job-board', 'company_settings', 'Company settings', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1824, 1, 'en', 'plugins/job-board/job-board', 'company_settings_description', 'Settings Company information for invoicing', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1825, 1, 'en', 'plugins/job-board/job-board', 'other_settings', 'Other settings', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1826, 1, 'en', 'plugins/job-board/job-board', 'other_settings_description', 'Settings for Job Board', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1827, 1, 'en', 'plugins/job-board/job-board', 'setting.thousands_separator', 'Thousands separator', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1828, 1, 'en', 'plugins/job-board/job-board', 'setting.decimal_separator', 'Decimal separator', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1829, 1, 'en', 'plugins/job-board/job-board', 'setting.separator_period', 'Period (.)', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1830, 1, 'en', 'plugins/job-board/job-board', 'setting.separator_comma', 'Comma (,)', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1831, 1, 'en', 'plugins/job-board/job-board', 'setting.separator_space', 'Space ( )', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1832, 1, 'en', 'plugins/job-board/job-board', 'setting.job_expired_after_days', 'Job Expired Time (days)', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1833, 1, 'en', 'plugins/job-board/job-board', 'setting.enable_post_approval', 'Enable post approval?', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1834, 1, 'en', 'plugins/job-board/job-board', 'setting.enable_credits_system', 'Enable credits system (employers need to buy credits to post their jobs)', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1835, 1, 'en', 'plugins/job-board/job-board', 'setting.display_views_count_in_detail_page', 'Display views count in the detail page?', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1836, 1, 'en', 'plugins/job-board/job-board', 'setting.enable_recaptcha_in_register_page', 'Enable Recaptcha in the registration page?', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1837, 1, 'en', 'plugins/job-board/job-board', 'setting.enable_recaptcha_in_pages_description', 'Need to setup Captcha in Admin -> Settings -> General first.', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1838, 1, 'en', 'plugins/job-board/job-board', 'setting.verify_account_email', 'Verify account\'s email?', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1839, 1, 'en', 'plugins/job-board/job-board', 'setting.verify_account_created_company', 'Verify account\'s created company?', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1840, 1, 'en', 'plugins/job-board/job-board', 'setting.enabled_register_as_employer', 'Allow visitors to register as employer and post their jobs?', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1841, 1, 'en', 'plugins/job-board/job-board', 'setting.enable_recaptcha_in_apply_job', 'Enable Recaptcha in the apply job?', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1842, 1, 'en', 'plugins/job-board/job-board', 'setting.add_space_between_price_and_currency', 'Add a space between price and currency?', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1843, 1, 'en', 'plugins/job-board/job-board', 'setting.enable_guest_apply', 'Enable guest apply?', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1844, 1, 'en', 'plugins/job-board/job-board', 'setting.enable_review_feature', 'Enable review feature?', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1845, 1, 'en', 'plugins/job-board/job-board', 'setting.default_account_avatar', 'Default account avatar', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1846, 1, 'en', 'plugins/job-board/job-board', 'setting.default_account_avatar_helper', 'It\'s used in case users don\'t have an avatar.', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1847, 1, 'en', 'plugins/job-board/job-board', 'setting.invoicing.company_name', 'Company name', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1848, 1, 'en', 'plugins/job-board/job-board', 'setting.invoicing.company_address', 'Company address', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1849, 1, 'en', 'plugins/job-board/job-board', 'setting.invoicing.company_email', 'Company email', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1850, 1, 'en', 'plugins/job-board/job-board', 'setting.invoicing.company_phone', 'Company phone', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1851, 1, 'en', 'plugins/job-board/job-board', 'setting.invoicing.company_logo', 'Company logo', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1852, 1, 'en', 'plugins/job-board/job-board', 'setting.using_custom_font_for_invoice', 'Using custom font for invoice?', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1853, 1, 'en', 'plugins/job-board/job-board', 'setting.invoice_font_family', 'Invoice font family (Only work for Latin language)', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1854, 1, 'en', 'plugins/job-board/job-board', 'setting.enable_invoice_stamp', 'Enable invoice stamp?', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1855, 1, 'en', 'plugins/job-board/job-board', 'setting.invoice_support_arabic_language', 'Support Arabic language in invoice?', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1856, 1, 'en', 'plugins/job-board/job-board', 'setting.invoice_code_prefix', 'Invoice code prefix', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1857, 1, 'en', 'plugins/job-board/job-board', 'setting.job_location_display', 'Job location display?', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1858, 1, 'en', 'plugins/job-board/job-board', 'setting.state_and_country', 'State & Country', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1859, 1, 'en', 'plugins/job-board/job-board', 'setting.city_and_state', 'City & State', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1860, 1, 'en', 'plugins/job-board/job-board', 'setting.city_state_and_country', 'City, State & Country', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1861, 1, 'en', 'plugins/job-board/job-board', 'setting.disabled_public_profile', 'Disable public profile?', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1862, 1, 'en', 'plugins/job-board/job-board', 'setting.enable_zip_code', 'Enable zip code (postal code)?', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1863, 1, 'en', 'plugins/job-board/job-board', 'setting.hide_company_email', 'Hide company email?', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1864, 1, 'en', 'plugins/job-board/job-board', 'job-attributes', 'Job Attributes', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1865, 1, 'en', 'plugins/job-board/job-board', 'theme_options.name', 'Job Board', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1866, 1, 'en', 'plugins/job-board/job-board', 'theme_options.description', 'Theme options for Job Board', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1867, 1, 'en', 'plugins/job-board/job-board', 'theme_options.logo_employer_dashboard', 'Logo in the employer dashboard (Default is the main logo)', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1868, 1, 'en', 'plugins/job-board/job-board', 'theme_options.default_company_cover_image', 'Default company cover image', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1869, 1, 'en', 'plugins/job-board/job-board', 'theme_options.default_company_logo', 'Default company logo (Default is the main logo)', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1870, 1, 'en', 'plugins/job-board/job-board', 'theme_options.job_companies_page_id', 'Job companies page', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1871, 1, 'en', 'plugins/job-board/job-board', 'theme_options.job_categories_page_id', 'Job categories page', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1872, 1, 'en', 'plugins/job-board/job-board', 'theme_options.job_candidates_page_id', 'Job candidates page', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1873, 1, 'en', 'plugins/job-board/job-board', 'theme_options.job_list_page_id', 'Job list page', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1874, 1, 'en', 'plugins/job-board/job-board', 'jobs_page', 'Jobs Page', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1875, 1, 'en', 'plugins/job-board/job-board', 'categories_page', 'Job Categories Page', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1876, 1, 'en', 'plugins/job-board/job-board', 'companies_page', 'Job Companies Page', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1877, 1, 'en', 'plugins/job-board/job-board', 'candidates_page', 'Job Candidates Page', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1878, 1, 'en', 'plugins/job-board/job-category', 'name', 'Job categories', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1879, 1, 'en', 'plugins/job-board/job-category', 'create', 'New category', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1880, 1, 'en', 'plugins/job-board/job-category', 'none', 'None', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1881, 1, 'en', 'plugins/job-board/job-experience', 'name', 'Job experiences', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1882, 1, 'en', 'plugins/job-board/job-experience', 'create', 'New job experience', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1883, 1, 'en', 'plugins/job-board/job-shift', 'name', 'Job shifts', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1884, 1, 'en', 'plugins/job-board/job-shift', 'create', 'New job shift', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1885, 1, 'en', 'plugins/job-board/job-skill', 'name', 'Job skills', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1886, 1, 'en', 'plugins/job-board/job-skill', 'create', 'New job skill', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1887, 1, 'en', 'plugins/job-board/job-type', 'name', 'Job types', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1888, 1, 'en', 'plugins/job-board/job-type', 'create', 'New job type', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1889, 1, 'en', 'plugins/job-board/job', 'name', 'Jobs', '2023-07-10 00:35:11', '2023-07-10 00:35:11');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1890, 1, 'en', 'plugins/job-board/job', 'create', 'New job', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1891, 1, 'en', 'plugins/job-board/job', 'moderation_status', 'Moderation status', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1892, 1, 'en', 'plugins/job-board/job', 'statuses.draft', 'Draft', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1893, 1, 'en', 'plugins/job-board/job', 'statuses.pending', 'Pending', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1894, 1, 'en', 'plugins/job-board/job', 'statuses.published', 'Published', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1895, 1, 'en', 'plugins/job-board/job', 'statuses.closed', 'Closed', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1896, 1, 'en', 'plugins/job-board/job', 'moderation_statuses.pending', 'Pending', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1897, 1, 'en', 'plugins/job-board/job', 'moderation_statuses.approved', 'Approved', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1898, 1, 'en', 'plugins/job-board/job', 'moderation_statuses.rejected', 'Rejected', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1899, 1, 'en', 'plugins/job-board/job', 'salary_periods.hourly', 'Hourly', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1900, 1, 'en', 'plugins/job-board/job', 'salary_periods.daily', 'Daily', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1901, 1, 'en', 'plugins/job-board/job', 'salary_periods.weekly', 'Weekly', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1902, 1, 'en', 'plugins/job-board/job', 'salary_periods.monthly', 'Monthly', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1903, 1, 'en', 'plugins/job-board/job', 'salary_periods.yearly', 'Yearly', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1904, 1, 'en', 'plugins/job-board/job', 'analytics.total_views', 'Total views', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1905, 1, 'en', 'plugins/job-board/job', 'analytics.views_today', 'Views today', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1906, 1, 'en', 'plugins/job-board/job', 'analytics.number_of_favorites', 'Number of favorites', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1907, 1, 'en', 'plugins/job-board/job', 'analytics.applicants', 'Applicants', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1908, 1, 'en', 'plugins/job-board/job', 'tags', 'Tags', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1909, 1, 'en', 'plugins/job-board/job', 'write_some_tags', 'Write some tags', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1910, 1, 'en', 'plugins/job-board/language-level', 'name', 'Language levels', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1911, 1, 'en', 'plugins/job-board/language-level', 'create', 'New language level', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1912, 1, 'en', 'plugins/job-board/major-subject', 'name', 'Major subjects', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1913, 1, 'en', 'plugins/job-board/major-subject', 'create', 'New major subject', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1914, 1, 'en', 'plugins/job-board/package', 'name', 'Packages', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1915, 1, 'en', 'plugins/job-board/package', 'create', 'New package', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1916, 1, 'en', 'plugins/job-board/package', 'price', 'Price', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1917, 1, 'en', 'plugins/job-board/package', 'currency', 'Currency', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1918, 1, 'en', 'plugins/job-board/package', 'percent_save', 'Percent save', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1919, 1, 'en', 'plugins/job-board/package', 'number_of_listings', 'Number of listings', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1920, 1, 'en', 'plugins/job-board/package', 'add_credit_success', 'Add credit successfully!', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1921, 1, 'en', 'plugins/job-board/package', 'setup_payment_methods', 'Please setup payment methods (PayPal, Stripe, COD, Bank transfer)', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1922, 1, 'en', 'plugins/job-board/package', 'add_credit_warning', 'Please add your credit to create your own posts here:', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1923, 1, 'en', 'plugins/job-board/package', 'add_credit', 'Add credit', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1924, 1, 'en', 'plugins/job-board/package', 'account_limit', 'Limit purchase by account', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1925, 1, 'en', 'plugins/job-board/package', 'account_limit_placeholder', 'An account can purchase x times', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1926, 1, 'en', 'plugins/job-board/package', 'subscribe_package', 'Subscribe package', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1927, 1, 'en', 'plugins/job-board/package', 'add_credit_alert', 'Please add your credit to create your own posts.', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1928, 1, 'en', 'plugins/job-board/result-type', 'name', 'Result types', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1929, 1, 'en', 'plugins/job-board/result-type', 'create', 'New result type', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1930, 1, 'en', 'plugins/job-board/review', 'name', 'Reviews', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1931, 1, 'en', 'plugins/job-board/review', 'company', 'Company', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1932, 1, 'en', 'plugins/job-board/review', 'user', 'User', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1933, 1, 'en', 'plugins/job-board/review', 'star', 'Star', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1934, 1, 'en', 'plugins/job-board/review', 'review', 'Review', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1935, 1, 'en', 'plugins/job-board/review', 'status', 'Status', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1936, 1, 'en', 'plugins/job-board/review', 'account_or_company', 'Account/Company', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1937, 1, 'en', 'plugins/job-board/review', 'reviewed_by', 'Reviewed by', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1938, 1, 'en', 'plugins/job-board/tag', 'name', 'Job tags', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1939, 1, 'en', 'plugins/job-board/tag', 'create', 'New tag', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1940, 1, 'en', 'plugins/language/language', 'name', 'Languages', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1941, 1, 'en', 'plugins/language/language', 'choose_language', 'Choose a language', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1942, 1, 'en', 'plugins/language/language', 'select_language', 'Select language', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1943, 1, 'en', 'plugins/language/language', 'choose_language_helper', 'You can choose a language in the list or directly edit it below.', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1944, 1, 'en', 'plugins/language/language', 'language_name', 'Language name', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1945, 1, 'en', 'plugins/language/language', 'language_name_helper', 'The name is how it is displayed on your site (for example: English).', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1946, 1, 'en', 'plugins/language/language', 'locale', 'Locale', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1947, 1, 'en', 'plugins/language/language', 'locale_helper', 'Laravel Locale for the language (for example: <code>en</code>).', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1948, 1, 'en', 'plugins/language/language', 'language_code', 'Language code', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1949, 1, 'en', 'plugins/language/language', 'language_code_helper', 'Language code - preferably 2-letters ISO 639-1 (for example: en)', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1950, 1, 'en', 'plugins/language/language', 'text_direction', 'Text direction', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1951, 1, 'en', 'plugins/language/language', 'text_direction_helper', 'Choose the text direction for the language', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1952, 1, 'en', 'plugins/language/language', 'left_to_right', 'Left to right', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1953, 1, 'en', 'plugins/language/language', 'right_to_left', 'Right to left', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1954, 1, 'en', 'plugins/language/language', 'flag', 'Flag', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1955, 1, 'en', 'plugins/language/language', 'flag_helper', 'Choose a flag for the language.', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1956, 1, 'en', 'plugins/language/language', 'order', 'Order', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1957, 1, 'en', 'plugins/language/language', 'order_helper', 'Position of the language in the language switcher', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1958, 1, 'en', 'plugins/language/language', 'add_new_language', 'Add new language', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1959, 1, 'en', 'plugins/language/language', 'code', 'Code', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1960, 1, 'en', 'plugins/language/language', 'default_language', 'Is default?', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1961, 1, 'en', 'plugins/language/language', 'actions', 'Actions', '2023-07-10 00:35:11', '2023-07-10 00:35:11'),
(1962, 1, 'en', 'plugins/language/language', 'translations', 'Translations', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1963, 1, 'en', 'plugins/language/language', 'edit', 'Edit', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1964, 1, 'en', 'plugins/language/language', 'edit_tooltip', 'Edit this language', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1965, 1, 'en', 'plugins/language/language', 'delete', 'Delete', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1966, 1, 'en', 'plugins/language/language', 'delete_tooltip', 'Delete this language and all its associated data', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1967, 1, 'en', 'plugins/language/language', 'choose_default_language', 'Choose :language as default language', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1968, 1, 'en', 'plugins/language/language', 'current_language', 'Current record\'s language', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1969, 1, 'en', 'plugins/language/language', 'edit_related', 'Edit related language for this record', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1970, 1, 'en', 'plugins/language/language', 'add_language_for_item', 'Add other language version for this record', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1971, 1, 'en', 'plugins/language/language', 'settings', 'Settings', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1972, 1, 'en', 'plugins/language/language', 'language_hide_default', 'Hide default language from URL?', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1973, 1, 'en', 'plugins/language/language', 'language_display_flag_only', 'Flag only', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1974, 1, 'en', 'plugins/language/language', 'language_display_name_only', 'Name only', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1975, 1, 'en', 'plugins/language/language', 'language_display_all', 'Display all flag and name', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1976, 1, 'en', 'plugins/language/language', 'language_display', 'Language display', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1977, 1, 'en', 'plugins/language/language', 'switcher_display', 'Switcher language display', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1978, 1, 'en', 'plugins/language/language', 'language_switcher_display_dropdown', 'Dropdown', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1979, 1, 'en', 'plugins/language/language', 'language_switcher_display_list', 'List', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1980, 1, 'en', 'plugins/language/language', 'current_language_edit_notification', 'You are editing \"<strong class=\"current_language_text\">:language</strong>\" version', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1981, 1, 'en', 'plugins/language/language', 'confirm-change-language', 'Confirm change language', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1982, 1, 'en', 'plugins/language/language', 'confirm-change-language-message', 'Do you really want to change language to \"<strong class=\"change_to_language_text\"></strong>\" ? This action will be override \"<strong class=\"change_to_language_text\"></strong>\" version if it\'s existed!', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1983, 1, 'en', 'plugins/language/language', 'confirm-change-language-btn', 'Confirm change', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1984, 1, 'en', 'plugins/language/language', 'hide_languages', 'Hide languages', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1985, 1, 'en', 'plugins/language/language', 'hide_languages_description', 'You can completely hide content in specific languages from visitors and search engines, but still view it yourself. This allows reviewing translations that are in progress.', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1986, 1, 'en', 'plugins/language/language', 'hide_languages_helper_display_hidden', '{0} All languages are currently displayed.|{1} :language is currently hidden to visitors.|[2, Inf] :language are currently hidden to visitors.', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1987, 1, 'en', 'plugins/language/language', 'show_all', 'Show all', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1988, 1, 'en', 'plugins/language/language', 'change_language', 'Language', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1989, 1, 'en', 'plugins/language/language', 'language_show_default_item_if_current_version_not_existed', 'Show item in default language if it is not existed in current language', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1990, 1, 'en', 'plugins/language/language', 'select_flag', 'Select a flag...', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1991, 1, 'en', 'plugins/language/language', 'delete_confirmation_message', 'Do you really want to delete this language? It also deletes all items in this language and cannot rollback!', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1992, 1, 'en', 'plugins/language/language', 'added_already', 'This language was added already!', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1993, 1, 'en', 'plugins/language/language', 'language_auto_detect_user_language', 'Auto detect user language?', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1994, 1, 'en', 'plugins/location/bulk-import', 'name', 'Bulk Import', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1995, 1, 'en', 'plugins/location/bulk-import', 'loading_text', 'Importing', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1996, 1, 'en', 'plugins/location/bulk-import', 'imported_successfully', 'Imported successfully.', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1997, 1, 'en', 'plugins/location/bulk-import', 'please_choose_the_file_mime', 'Please choose the file mime :types', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1998, 1, 'en', 'plugins/location/bulk-import', 'please_choose_the_file', 'Please choose the file', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(1999, 1, 'en', 'plugins/location/bulk-import', 'start_import', 'Start Import', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2000, 1, 'en', 'plugins/location/bulk-import', 'note', 'Note!', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2001, 1, 'en', 'plugins/location/bulk-import', 'warning_before_importing', 'If this is your first time using this feature, please read the documentation or contact the Administrator for access to the correct functionality!', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2002, 1, 'en', 'plugins/location/bulk-import', 'results', 'Result: :success successes, :failed failures', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2003, 1, 'en', 'plugins/location/bulk-import', 'failures', 'Failures', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2004, 1, 'en', 'plugins/location/bulk-import', 'tables.import', 'Import', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2005, 1, 'en', 'plugins/location/bulk-import', 'template', 'Template', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2006, 1, 'en', 'plugins/location/bulk-import', 'rules', 'Rules', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2007, 1, 'en', 'plugins/location/bulk-import', 'choose_file_with_mime', 'Choose file with mime: (:types)', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2008, 1, 'en', 'plugins/location/bulk-import', 'choose_file', 'Choose file', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2009, 1, 'en', 'plugins/location/bulk-import', 'menu', 'Import locations', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2010, 1, 'en', 'plugins/location/bulk-import', 'download-csv-file', 'Download CSV template', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2011, 1, 'en', 'plugins/location/bulk-import', 'download-excel-file', 'Download Excel template', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2012, 1, 'en', 'plugins/location/bulk-import', 'downloading', 'Downloading...', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2013, 1, 'en', 'plugins/location/bulk-import', 'export.template.input_error', 'Input error', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2014, 1, 'en', 'plugins/location/bulk-import', 'export.template.number_not_allowed', 'Number is not allowed!', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2015, 1, 'en', 'plugins/location/bulk-import', 'export.template.allowed_input', 'Allowed input', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2016, 1, 'en', 'plugins/location/bulk-import', 'export.template.prompt_decimal', 'Only numbers or decimals are accepted and greater than or equal to :min.', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2017, 1, 'en', 'plugins/location/bulk-import', 'export.template.prompt_whole_number', 'Only numbers are accepted and greater than or equal to :min.', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2018, 1, 'en', 'plugins/location/bulk-import', 'export.template.prompt_list', 'Please pick a value from the drop-down list.', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2019, 1, 'en', 'plugins/location/bulk-import', 'export.template.pick_from_list', 'Pick from list', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2020, 1, 'en', 'plugins/location/bulk-import', 'export.template.value_not_in_list', 'Value is not in list.', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2021, 1, 'en', 'plugins/location/bulk-import', 'export.template.max_text_length', 'Max text length', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2022, 1, 'en', 'plugins/location/bulk-import', 'export.template.prompt_max_text_length', 'Only accept text with length less than or equal to :max.', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2023, 1, 'en', 'plugins/location/bulk-import', 'import_failed_description', 'Import failed, please check the errors below!', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2024, 1, 'en', 'plugins/location/bulk-import', 'available_enable_multi_language', 'Only available when you enable \"Is Multi Language?\"', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2025, 1, 'en', 'plugins/location/bulk-import', 'import_type_required_if', 'The :attribute field is required when \"Import Type\" is :value.', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2026, 1, 'en', 'plugins/location/bulk-import', 'import_available_data', 'Import available data', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2027, 1, 'en', 'plugins/location/bulk-import', 'import', 'Import', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2028, 1, 'en', 'plugins/location/bulk-import', 'import_available_data_confirmation', 'Import available data confirmation', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2029, 1, 'en', 'plugins/location/bulk-import', 'import_available_data_confirmation_content', 'Do you really want to import states/cities for this country?', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2030, 1, 'en', 'plugins/location/city', 'name', 'Cities', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2031, 1, 'en', 'plugins/location/city', 'create', 'New city', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2032, 1, 'en', 'plugins/location/city', 'state', 'State', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2033, 1, 'en', 'plugins/location/city', 'select_state', 'Select state...', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2034, 1, 'en', 'plugins/location/city', 'select_city', 'Select city...', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2035, 1, 'en', 'plugins/location/city', 'country', 'Country', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2036, 1, 'en', 'plugins/location/city', 'select_country', 'Select country...', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2037, 1, 'en', 'plugins/location/city', 'city', 'City', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2038, 1, 'en', 'plugins/location/country', 'name', 'Countries', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2039, 1, 'en', 'plugins/location/country', 'create', 'New country', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2040, 1, 'en', 'plugins/location/country', 'nationality', 'Nationality', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2041, 1, 'en', 'plugins/location/country', 'code', 'Country ISO code', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2042, 1, 'en', 'plugins/location/country', 'code_placeholder', 'ISO country code, uppercase. Ex: US.', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2043, 1, 'en', 'plugins/location/country', 'code_helper', 'Find country ISO code from here: https://en.wikipedia.org/wiki/List_of_ISO_3166_country_codes', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2044, 1, 'en', 'plugins/location/location', 'name', 'Locations', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2045, 1, 'en', 'plugins/location/location', 'all_states', 'All states', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2046, 1, 'en', 'plugins/location/location', 'abbreviation', 'Abbreviation', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2047, 1, 'en', 'plugins/location/location', 'abbreviation_placeholder', 'E.g: CA', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2048, 1, 'en', 'plugins/location/location', 'exporting', 'Exporting', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2049, 1, 'en', 'plugins/location/location', 'total_country', 'Total countries', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2050, 1, 'en', 'plugins/location/location', 'total_state', 'Total states', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2051, 1, 'en', 'plugins/location/location', 'total_city', 'Total cities', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2052, 1, 'en', 'plugins/location/location', 'export_location', 'Export location', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2053, 1, 'en', 'plugins/location/location', 'start_export', 'Start exporting', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2054, 1, 'en', 'plugins/location/state', 'name', 'States', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2055, 1, 'en', 'plugins/location/state', 'create', 'New state', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2056, 1, 'en', 'plugins/location/state', 'country', 'Country', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2057, 1, 'en', 'plugins/location/state', 'select_country', 'Select a country...', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2058, 1, 'en', 'plugins/location/state', 'state', 'State', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2059, 1, 'en', 'plugins/newsletter/newsletter', 'name', 'Newsletters', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2060, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.title', 'Newsletter', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2061, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.description', 'Config newsletter email templates', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2062, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_admin.title', 'Email send to admin', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2063, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_admin.description', 'Template for sending email to admin', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2064, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_user.title', 'Email send to user', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2065, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_user.description', 'Template for sending email to subscriber', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2066, 1, 'en', 'plugins/newsletter/newsletter', 'settings.title', 'Newsletter', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2067, 1, 'en', 'plugins/newsletter/newsletter', 'settings.description', 'Settings for newsletter (auto send newsletter email to SendGrid, Mailchimp... when someone register newsletter on website).', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2068, 1, 'en', 'plugins/newsletter/newsletter', 'settings.mailchimp_api_key', 'Mailchimp API Key', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2069, 1, 'en', 'plugins/newsletter/newsletter', 'settings.mailchimp_list_id', 'Mailchimp List ID', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2070, 1, 'en', 'plugins/newsletter/newsletter', 'settings.mailchimp_list', 'Mailchimp List', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2071, 1, 'en', 'plugins/newsletter/newsletter', 'settings.sendgrid_api_key', 'Sendgrid API Key', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2072, 1, 'en', 'plugins/newsletter/newsletter', 'settings.sendgrid_list_id', 'Sendgrid List ID', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2073, 1, 'en', 'plugins/newsletter/newsletter', 'settings.sendgrid_list', 'Sendgrid List', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2074, 1, 'en', 'plugins/newsletter/newsletter', 'settings.enable_newsletter_contacts_list_api', 'Enable newsletter contacts list API?', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2075, 1, 'en', 'plugins/newsletter/newsletter', 'statuses.subscribed', 'Subscribed', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2076, 1, 'en', 'plugins/newsletter/newsletter', 'statuses.unsubscribed', 'Unsubscribed', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2077, 1, 'en', 'plugins/payment/payment', 'payments', 'Payments', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2078, 1, 'en', 'plugins/payment/payment', 'checkout_success', 'Checkout successfully!', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2079, 1, 'en', 'plugins/payment/payment', 'view_payment', 'View payment #', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2080, 1, 'en', 'plugins/payment/payment', 'charge_id', 'Charge ID', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2081, 1, 'en', 'plugins/payment/payment', 'amount', 'Amount', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2082, 1, 'en', 'plugins/payment/payment', 'currency', 'Currency', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2083, 1, 'en', 'plugins/payment/payment', 'user', 'User', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2084, 1, 'en', 'plugins/payment/payment', 'stripe', 'Stripe', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2085, 1, 'en', 'plugins/payment/payment', 'paypal', 'PayPal', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2086, 1, 'en', 'plugins/payment/payment', 'action', 'Action', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2087, 1, 'en', 'plugins/payment/payment', 'payment_via_card', 'Payment via card', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2088, 1, 'en', 'plugins/payment/payment', 'card_number', 'Card number', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2089, 1, 'en', 'plugins/payment/payment', 'full_name', 'Full name', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2090, 1, 'en', 'plugins/payment/payment', 'payment_via_paypal', 'Fast and safe online payment via PayPal.', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2091, 1, 'en', 'plugins/payment/payment', 'mm_yy', 'MM/YY', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2092, 1, 'en', 'plugins/payment/payment', 'cvc', 'CVC', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2093, 1, 'en', 'plugins/payment/payment', 'details', 'Details', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2094, 1, 'en', 'plugins/payment/payment', 'payer_name', 'Payer Name', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2095, 1, 'en', 'plugins/payment/payment', 'email', 'Email', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2096, 1, 'en', 'plugins/payment/payment', 'phone', 'Phone', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2097, 1, 'en', 'plugins/payment/payment', 'country', 'Country', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2098, 1, 'en', 'plugins/payment/payment', 'shipping_address', 'Shipping Address', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2099, 1, 'en', 'plugins/payment/payment', 'payment_details', 'Payment Details', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2100, 1, 'en', 'plugins/payment/payment', 'card', 'Card', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2101, 1, 'en', 'plugins/payment/payment', 'address', 'Address', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2102, 1, 'en', 'plugins/payment/payment', 'could_not_get_stripe_token', 'Could not get Stripe token to make a charge.', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2103, 1, 'en', 'plugins/payment/payment', 'payment_id', 'Payment ID', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2104, 1, 'en', 'plugins/payment/payment', 'payment_methods', 'Payment methods', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2105, 1, 'en', 'plugins/payment/payment', 'transactions', 'Transactions', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2106, 1, 'en', 'plugins/payment/payment', 'payment_methods_description', 'Setup payment methods for website', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2107, 1, 'en', 'plugins/payment/payment', 'paypal_description', 'Customer can buy product and pay directly via PayPal', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2108, 1, 'en', 'plugins/payment/payment', 'use', 'Use', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2109, 1, 'en', 'plugins/payment/payment', 'stripe_description', 'Customer can buy product and pay directly using Visa, Credit card via Stripe', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2110, 1, 'en', 'plugins/payment/payment', 'edit', 'Edit', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2111, 1, 'en', 'plugins/payment/payment', 'settings', 'Settings', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2112, 1, 'en', 'plugins/payment/payment', 'activate', 'Activate', '2023-07-10 00:35:12', '2023-07-10 00:35:12'),
(2113, 1, 'en', 'plugins/payment/payment', 'deactivate', 'Deactivate', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2114, 1, 'en', 'plugins/payment/payment', 'update', 'Update', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2115, 1, 'en', 'plugins/payment/payment', 'configuration_instruction', 'Configuration instruction for :name', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2116, 1, 'en', 'plugins/payment/payment', 'configuration_requirement', 'To use :name, you need', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2117, 1, 'en', 'plugins/payment/payment', 'service_registration', 'Register with :name', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2118, 1, 'en', 'plugins/payment/payment', 'after_service_registration_msg', 'After registration at :name, you will have Client ID, Client Secret', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2119, 1, 'en', 'plugins/payment/payment', 'enter_client_id_and_secret', 'Enter Client ID, Secret into the box in right hand', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2120, 1, 'en', 'plugins/payment/payment', 'method_name', 'Method name', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2121, 1, 'en', 'plugins/payment/payment', 'please_provide_information', 'Please provide information', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2122, 1, 'en', 'plugins/payment/payment', 'client_id', 'Client ID', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2123, 1, 'en', 'plugins/payment/payment', 'client_secret', 'Client Secret', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2124, 1, 'en', 'plugins/payment/payment', 'secret', 'Secret', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2125, 1, 'en', 'plugins/payment/payment', 'stripe_key', 'Stripe Public Key', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2126, 1, 'en', 'plugins/payment/payment', 'stripe_secret', 'Stripe Private Key', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2127, 1, 'en', 'plugins/payment/payment', 'stripe_after_service_registration_msg', 'After registration at :name, you will have Public, Secret keys', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2128, 1, 'en', 'plugins/payment/payment', 'stripe_enter_client_id_and_secret', 'Enter Public, Secret keys into the box in right hand', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2129, 1, 'en', 'plugins/payment/payment', 'pay_online_via', 'Pay online via :name', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2130, 1, 'en', 'plugins/payment/payment', 'sandbox_mode', 'Sandbox mode', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2131, 1, 'en', 'plugins/payment/payment', 'deactivate_payment_method', 'Deactivate payment method', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2132, 1, 'en', 'plugins/payment/payment', 'deactivate_payment_method_description', 'Do you really want to deactivate this payment method?', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2133, 1, 'en', 'plugins/payment/payment', 'agree', 'Agree', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2134, 1, 'en', 'plugins/payment/payment', 'name', 'Payments', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2135, 1, 'en', 'plugins/payment/payment', 'create', 'New payment', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2136, 1, 'en', 'plugins/payment/payment', 'go_back', 'Go back', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2137, 1, 'en', 'plugins/payment/payment', 'information', 'Information', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2138, 1, 'en', 'plugins/payment/payment', 'methods.paypal', 'PayPal', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2139, 1, 'en', 'plugins/payment/payment', 'methods.cod', 'Cash on delivery (COD)', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2140, 1, 'en', 'plugins/payment/payment', 'methods.bank_transfer', 'Bank transfer', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2141, 1, 'en', 'plugins/payment/payment', 'statuses.pending', 'Pending', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2142, 1, 'en', 'plugins/payment/payment', 'statuses.completed', 'Completed', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2143, 1, 'en', 'plugins/payment/payment', 'statuses.refunding', 'Refunding', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2144, 1, 'en', 'plugins/payment/payment', 'statuses.refunded', 'Refunded', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2145, 1, 'en', 'plugins/payment/payment', 'statuses.fraud', 'Fraud', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2146, 1, 'en', 'plugins/payment/payment', 'statuses.failed', 'Failed', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2147, 1, 'en', 'plugins/payment/payment', 'payment_methods_instruction', 'Guide customers to pay directly. You can choose to pay by delivery or bank transfer', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2148, 1, 'en', 'plugins/payment/payment', 'payment_method_description', 'Payment guide - (Displayed on the notice of successful purchase and payment page)', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2149, 1, 'en', 'plugins/payment/payment', 'payment_via_cod', 'Cash on delivery (COD)', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2150, 1, 'en', 'plugins/payment/payment', 'payment_via_bank_transfer', 'Bank transfer', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2151, 1, 'en', 'plugins/payment/payment', 'payment_pending', 'Checkout successfully. Your payment is pending and will be checked by our staff.', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2152, 1, 'en', 'plugins/payment/payment', 'created_at', 'Created At', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2153, 1, 'en', 'plugins/payment/payment', 'payment_channel', 'Payment Channel', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2154, 1, 'en', 'plugins/payment/payment', 'total', 'Total', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2155, 1, 'en', 'plugins/payment/payment', 'status', 'Status', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2156, 1, 'en', 'plugins/payment/payment', 'default_payment_method', 'Default payment method', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2157, 1, 'en', 'plugins/payment/payment', 'turn_off_success', 'Turn off payment method successfully!', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2158, 1, 'en', 'plugins/payment/payment', 'saved_payment_method_success', 'Saved payment method successfully!', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2159, 1, 'en', 'plugins/payment/payment', 'saved_payment_settings_success', 'Saved payment settings successfully!', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2160, 1, 'en', 'plugins/payment/payment', 'payment_name', 'Name', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2161, 1, 'en', 'plugins/payment/payment', 'payment_not_found', 'Payment not found!', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2162, 1, 'en', 'plugins/payment/payment', 'refunds.title', 'Refunds', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2163, 1, 'en', 'plugins/payment/payment', 'refunds.id', 'ID', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2164, 1, 'en', 'plugins/payment/payment', 'refunds.breakdowns', 'Breakdowns', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2165, 1, 'en', 'plugins/payment/payment', 'refunds.gross_amount', 'Gross amount', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2166, 1, 'en', 'plugins/payment/payment', 'refunds.paypal_fee', 'PayPal fee', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2167, 1, 'en', 'plugins/payment/payment', 'refunds.net_amount', 'Net amount', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2168, 1, 'en', 'plugins/payment/payment', 'refunds.total_refunded_amount', 'Total refunded amount', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2169, 1, 'en', 'plugins/payment/payment', 'refunds.create_time', 'Create time', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2170, 1, 'en', 'plugins/payment/payment', 'refunds.update_time', 'Update time', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2171, 1, 'en', 'plugins/payment/payment', 'refunds.status', 'Status', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2172, 1, 'en', 'plugins/payment/payment', 'refunds.description', 'Description', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2173, 1, 'en', 'plugins/payment/payment', 'refunds.refunded_at', 'Refunded at', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2174, 1, 'en', 'plugins/payment/payment', 'refunds.error_message', 'Error message', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2175, 1, 'en', 'plugins/payment/payment', 'view_response_source', 'View response source', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2176, 1, 'en', 'plugins/payment/payment', 'status_is_not_completed', 'Status is not COMPLETED', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2177, 1, 'en', 'plugins/payment/payment', 'cannot_found_capture_id', 'Can not found capture id with payment detail', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2178, 1, 'en', 'plugins/payment/payment', 'amount_refunded', 'Amount refunded', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2179, 1, 'en', 'plugins/payment/payment', 'amount_remaining', 'Amount remaining', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2180, 1, 'en', 'plugins/payment/payment', 'paid_at', 'Paid At', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2181, 1, 'en', 'plugins/payment/payment', 'invalid_settings', 'Settings for :name are invalid!', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2182, 1, 'en', 'plugins/payment/payment', 'view_transaction', 'Transaction \":charge_id\"', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2183, 1, 'en', 'plugins/payment/payment', 'payment_description', 'Pay for your order #:order_id at :site_url', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2184, 1, 'en', 'plugins/social-login/social-login', 'settings.title', 'Social Login settings', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2185, 1, 'en', 'plugins/social-login/social-login', 'settings.description', 'Configure social login options', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2186, 1, 'en', 'plugins/social-login/social-login', 'settings.facebook.title', 'Facebook login settings', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2187, 1, 'en', 'plugins/social-login/social-login', 'settings.facebook.description', 'Enable/disable & configure app credentials for Facebook login', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2188, 1, 'en', 'plugins/social-login/social-login', 'settings.facebook.app_id', 'App ID', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2189, 1, 'en', 'plugins/social-login/social-login', 'settings.facebook.app_secret', 'App Secret', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2190, 1, 'en', 'plugins/social-login/social-login', 'settings.facebook.helper', 'Please go to https://developers.facebook.com to create new app update App ID, App Secret. Callback URL is :callback', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2191, 1, 'en', 'plugins/social-login/social-login', 'settings.google.title', 'Google login settings', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2192, 1, 'en', 'plugins/social-login/social-login', 'settings.google.description', 'Enable/disable & configure app credentials for Google login', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2193, 1, 'en', 'plugins/social-login/social-login', 'settings.google.app_id', 'App ID', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2194, 1, 'en', 'plugins/social-login/social-login', 'settings.google.app_secret', 'App Secret', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2195, 1, 'en', 'plugins/social-login/social-login', 'settings.google.helper', 'Please go to https://console.developers.google.com/apis/dashboard to create new app update App ID, App Secret. Callback URL is :callback', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2196, 1, 'en', 'plugins/social-login/social-login', 'settings.github.title', 'Github login settings', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2197, 1, 'en', 'plugins/social-login/social-login', 'settings.github.description', 'Enable/disable & configure app credentials for Github login', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2198, 1, 'en', 'plugins/social-login/social-login', 'settings.github.app_id', 'App ID', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2199, 1, 'en', 'plugins/social-login/social-login', 'settings.github.app_secret', 'App Secret', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2200, 1, 'en', 'plugins/social-login/social-login', 'settings.github.helper', 'Please go to https://github.com/settings/developers to create new app update App ID, App Secret. Callback URL is :callback', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2201, 1, 'en', 'plugins/social-login/social-login', 'settings.linkedin.title', 'Linkedin login settings', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2202, 1, 'en', 'plugins/social-login/social-login', 'settings.linkedin.description', 'Enable/disable & configure app credentials for Linkedin login', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2203, 1, 'en', 'plugins/social-login/social-login', 'settings.linkedin.app_id', 'App ID', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2204, 1, 'en', 'plugins/social-login/social-login', 'settings.linkedin.app_secret', 'App Secret', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2205, 1, 'en', 'plugins/social-login/social-login', 'settings.linkedin.helper', 'Please go to https://www.linkedin.com/developers/apps/new to create new app update App ID, App Secret. Callback URL is :callback', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2206, 1, 'en', 'plugins/social-login/social-login', 'settings.enable', 'Enable?', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2207, 1, 'en', 'plugins/social-login/social-login', 'menu', 'Social Login', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2208, 1, 'en', 'plugins/testimonial/testimonial', 'name', 'Testimonials', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2209, 1, 'en', 'plugins/testimonial/testimonial', 'create', 'New testimonial', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2210, 1, 'en', 'plugins/testimonial/testimonial', 'company', 'Position/Company', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2211, 1, 'en', 'plugins/translation/translation', 'translations', 'Translations', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2212, 1, 'en', 'plugins/translation/translation', 'translations_description', 'Translate all words in system.', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2213, 1, 'en', 'plugins/translation/translation', 'export_warning', 'Warning, translations are not visible until they are exported back to lang folder. Please use \"Publish translations\" button to apply changes.', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2214, 1, 'en', 'plugins/translation/translation', 'import_done', 'Done importing, processed :counter items! Reload this page to refresh the groups!', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2215, 1, 'en', 'plugins/translation/translation', 'translation_manager', 'Translations Manager', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2216, 1, 'en', 'plugins/translation/translation', 'done_publishing', 'Done publishing the translations for group', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2217, 1, 'en', 'plugins/translation/translation', 'append_translation', 'Append new translations', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2218, 1, 'en', 'plugins/translation/translation', 'replace_translation', 'Replace existing translations', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2219, 1, 'en', 'plugins/translation/translation', 'import_group', 'Import group', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2220, 1, 'en', 'plugins/translation/translation', 'confirm_publish_group', 'Are you sure you want to publish the translations group \":group\"? This will overwrite existing language files.', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2221, 1, 'en', 'plugins/translation/translation', 'publish_translations', 'Publish translations', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2222, 1, 'en', 'plugins/translation/translation', 'back', 'Back', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2223, 1, 'en', 'plugins/translation/translation', 'edit_title', 'Enter translation', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2224, 1, 'en', 'plugins/translation/translation', 'choose_group_msg', 'Choose a group to display the group translations. If no groups are visible, make sure you have imported the translations.', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2225, 1, 'en', 'plugins/translation/translation', 'choose_a_group', 'Choose a group', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2226, 1, 'en', 'plugins/translation/translation', 'locales', 'Locales', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2227, 1, 'en', 'plugins/translation/translation', 'theme-translations', 'Theme translations', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2228, 1, 'en', 'plugins/translation/translation', 'admin-translations', 'Other translations', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2229, 1, 'en', 'plugins/translation/translation', 'translate_from', 'Translate from', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2230, 1, 'en', 'plugins/translation/translation', 'to', 'to', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2231, 1, 'en', 'plugins/translation/translation', 'no_other_languages', 'No other language to translate!', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2232, 1, 'en', 'plugins/translation/translation', 'edit', 'Edit', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2233, 1, 'en', 'plugins/translation/translation', 'locale', 'Locale', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2234, 1, 'en', 'plugins/translation/translation', 'locale_placeholder', 'Ex: en', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2235, 1, 'en', 'plugins/translation/translation', 'name', 'Name', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2236, 1, 'en', 'plugins/translation/translation', 'default_locale', 'Default locale?', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2237, 1, 'en', 'plugins/translation/translation', 'actions', 'Actions', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2238, 1, 'en', 'plugins/translation/translation', 'choose_language', 'Choose language', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2239, 1, 'en', 'plugins/translation/translation', 'add_new_language', 'Add new language', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2240, 1, 'en', 'plugins/translation/translation', 'select_language', 'Select language', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2241, 1, 'en', 'plugins/translation/translation', 'flag', 'Flag', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2242, 1, 'en', 'plugins/translation/translation', 'folder_is_not_writeable', 'Cannot write files! Folder :lang_path is not writable. Please chmod to make it writable!', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2243, 1, 'en', 'plugins/translation/translation', 'delete', 'Delete', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2244, 1, 'en', 'plugins/translation/translation', 'confirm_delete_message', 'Do you really want to delete this locale? It will delete all files/folders for this local in :lang_path!', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2245, 1, 'en', 'plugins/translation/translation', 'download', 'Download', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2246, 1, 'en', 'plugins/translation/translation', 'select_locale', 'Select locale', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2247, 1, 'en', 'plugins/translation/translation', 'theme_translations_instruction', 'Click on text to translate. Do NOT translate variables, Eg. :username, :query, :link...', '2023-07-10 00:35:13', '2023-07-10 00:35:13');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(2248, 1, 'en', 'plugins/translation/translation', 'import_available_locale', 'Or import available locale from our GitHub repository', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2249, 1, 'en', 'plugins/translation/translation', 'add_new_locale', 'Add new locale', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2250, 1, 'en', 'plugins/translation/translation', 'download_locale', 'Download locale', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2251, 1, 'en', 'plugins/translation/translation', 'import_available_locale_confirmation', 'Download locale from GitHub', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2252, 1, 'en', 'plugins/translation/translation', 'import_available_locale_confirmation_content', 'Are you sure you want to download this locale? It will be downloaded into :lang_path, you can delete it later if you want.', '2023-07-10 00:35:13', '2023-07-10 00:35:13'),
(2253, 1, 'en', 'plugins/translation/translation', 'is_default', 'Is default?', '2023-07-10 00:35:13', '2023-07-10 00:35:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(191) DEFAULT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `username` varchar(60) DEFAULT NULL,
  `avatar_id` bigint(20) UNSIGNED DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT 0,
  `manage_supers` tinyint(1) NOT NULL DEFAULT 0,
  `permissions` text DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `first_name`, `last_name`, `username`, `avatar_id`, `super_user`, `manage_supers`, `permissions`, `last_login`) VALUES
(1, 'sadmin@gmail.com', NULL, '$2y$10$v.zThdHYj2KsYZrLxDIrZO.rKFMsshvBwLAGrdu/DCoJYFbzFcLFq', 'ix5xlmVM0SuM94XuFjsz0VWvsEINOzajwIFnex06Q0OFtc7tHRsZUO1L3avy', '2023-10-23 05:12:26', '2023-10-23 08:29:17', 'Super', 'Admin', 'Armkhan', NULL, 1, 1, NULL, NULL),
(2, 'admin@gmail.com', NULL, '$2y$10$v.zThdHYj2KsYZrLxDIrZO.rKFMsshvBwLAGrdu/DCoJYFbzFcLFq', 'BSe4SLZiwPasd8Tt7Aq9wiEfd9cQeAD8gcg39QikiGtghtQ7dVTtx6cweYZT', '2023-10-23 05:12:27', '2023-10-23 05:12:27', 'Normal', 'Admin', 'admin', NULL, 0, 0, '{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.manage.license\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.cronjob\":true,\"api.settings\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"widgets.index\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"plugin.faq\":true,\"faq.index\":true,\"faq.create\":true,\"faq.edit\":true,\"faq.destroy\":true,\"faq_category.index\":true,\"faq_category.create\":true,\"faq_category.edit\":true,\"faq_category.destroy\":true,\"plugins.job-board\":true,\"jobs.index\":true,\"jobs.create\":true,\"jobs.edit\":true,\"jobs.destroy\":true,\"import-jobs.index\":true,\"export-jobs.index\":true,\"job-applications.index\":true,\"job-applications.edit\":true,\"job-applications.destroy\":true,\"accounts.index\":true,\"accounts.create\":true,\"accounts.edit\":true,\"accounts.destroy\":true,\"accounts.import\":true,\"accounts.export\":true,\"packages.index\":true,\"packages.create\":true,\"packages.edit\":true,\"packages.destroy\":true,\"companies.index\":true,\"companies.create\":true,\"companies.edit\":true,\"companies.destroy\":true,\"export-companies.index\":true,\"import-companies.index\":true,\"job-board.custom-fields.index\":true,\"job-board.custom-fields.create\":true,\"job-board.custom-fields.edit\":true,\"job-board.custom-fields.destroy\":true,\"job-attributes.index\":true,\"job-categories.index\":true,\"job-categories.create\":true,\"job-categories.edit\":true,\"job-categories.destroy\":true,\"job-types.index\":true,\"job-types.create\":true,\"job-types.edit\":true,\"job-types.destroy\":true,\"job-skills.index\":true,\"job-skills.create\":true,\"job-skills.edit\":true,\"job-skills.destroy\":true,\"job-shifts.index\":true,\"job-shifts.create\":true,\"job-shifts.edit\":true,\"job-shifts.destroy\":true,\"job-experiences.index\":true,\"job-experiences.create\":true,\"job-experiences.edit\":true,\"job-experiences.destroy\":true,\"language-levels.index\":true,\"language-levels.create\":true,\"language-levels.edit\":true,\"language-levels.destroy\":true,\"career-levels.index\":true,\"career-levels.create\":true,\"career-levels.edit\":true,\"career-levels.destroy\":true,\"functional-areas.index\":true,\"functional-areas.create\":true,\"functional-areas.edit\":true,\"functional-areas.destroy\":true,\"degree-types.index\":true,\"degree-types.create\":true,\"degree-types.edit\":true,\"degree-types.destroy\":true,\"degree-levels.index\":true,\"degree-levels.create\":true,\"degree-levels.edit\":true,\"degree-levels.destroy\":true,\"job-board.tag.index\":true,\"job-board.tag.create\":true,\"job-board.tag.edit\":true,\"job-board.tag.destroy\":true,\"job-board.settings\":true,\"invoice.index\":true,\"invoice.edit\":true,\"invoice.destroy\":true,\"reviews.index\":true,\"reviews.destroy\":true,\"invoice-template.index\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"plugin.location\":true,\"country.index\":true,\"country.create\":true,\"country.edit\":true,\"country.destroy\":true,\"state.index\":true,\"state.create\":true,\"state.edit\":true,\"state.destroy\":true,\"city.index\":true,\"city.create\":true,\"city.edit\":true,\"city.destroy\":true,\"location.bulk-import.index\":true,\"location.export.index\":true,\"newsletter.index\":true,\"newsletter.destroy\":true,\"payment.index\":true,\"payments.settings\":true,\"payment.destroy\":true,\"social-login.settings\":true,\"testimonial.index\":true,\"testimonial.create\":true,\"testimonial.edit\":true,\"testimonial.destroy\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true}', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_meta`
--

CREATE TABLE `user_meta` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) DEFAULT NULL,
  `value` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `widget_id` varchar(120) NOT NULL,
  `sidebar_id` varchar(120) NOT NULL,
  `theme` varchar(120) NOT NULL,
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `data` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `widget_id`, `sidebar_id`, `theme`, `position`, `data`, `created_at`, `updated_at`) VALUES
(1, 'NewsletterWidget', 'pre_footer_sidebar', 'jobcy', 0, '{\"id\":\"NewsletterWidget\",\"title\":\"Get New Jobs Notification!\",\"subtitle\":\"Subscribe & get all related jobs notification.\",\"image\":\"general\\/newsletter-image.png\"}', '2023-07-10 00:34:51', '2023-07-10 00:34:51'),
(2, 'SiteInfoWidget', 'footer_sidebar', 'jobcy', 0, '{\"id\":\"SiteInfoWidget\",\"name\":\"Jobcy\",\"about\":\"It is a long established fact that a reader will be of a page reader will be of at its layout.\",\"follow_us_heading\":\"Follow us on:\",\"social_links\":\"[[{\\\"key\\\":\\\"url\\\",\\\"value\\\":\\\"https:\\\\\\/\\\\\\/www.facebook.com\\\\\\/\\\"},{\\\"key\\\":\\\"icon\\\",\\\"value\\\":\\\"mdi mdi-facebook\\\"}],[{\\\"key\\\":\\\"url\\\",\\\"value\\\":\\\"https:\\\\\\/\\\\\\/www.twitter.com\\\\\\/\\\"},{\\\"key\\\":\\\"icon\\\",\\\"value\\\":\\\"mdi mdi-twitter\\\"}],[{\\\"key\\\":\\\"url\\\",\\\"value\\\":\\\"https:\\\\\\/\\\\\\/www.instagram.com\\\\\\/\\\"},{\\\"key\\\":\\\"icon\\\",\\\"value\\\":\\\"mdi mdi-instagram\\\"}],[{\\\"key\\\":\\\"url\\\",\\\"value\\\":\\\"https:\\\\\\/\\\\\\/www.pinterest.com\\\\\\/\\\"},{\\\"key\\\":\\\"icon\\\",\\\"value\\\":\\\"mdi mdi-pinterest\\\"}],[{\\\"key\\\":\\\"url\\\",\\\"value\\\":\\\"https:\\\\\\/\\\\\\/www.youtube.com\\\\\\/\\\"},{\\\"key\\\":\\\"icon\\\",\\\"value\\\":\\\"mdi mdi-youtube\\\"}]]\"}', '2023-07-10 00:34:51', '2023-07-10 00:34:51'),
(3, 'CustomMenuWidget', 'footer_sidebar', 'jobcy', 1, '{\"id\":\"CustomMenuWidget\",\"name\":\"Company\",\"menu_id\":\"company\"}', '2023-07-10 00:34:51', '2023-07-10 00:34:51'),
(4, 'CustomMenuWidget', 'footer_sidebar', 'jobcy', 2, '{\"id\":\"CustomMenuWidget\",\"name\":\"For Jobs\",\"menu_id\":\"for-jobs\"}', '2023-07-10 00:34:51', '2023-07-10 00:34:51'),
(5, 'CustomMenuWidget', 'footer_sidebar', 'jobcy', 3, '{\"id\":\"CustomMenuWidget\",\"name\":\"For Candidates\",\"menu_id\":\"for-candidates\"}', '2023-07-10 00:34:51', '2023-07-10 00:34:51'),
(6, 'CustomMenuWidget', 'footer_sidebar', 'jobcy', 4, '{\"id\":\"CustomMenuWidget\",\"name\":\"Support\",\"menu_id\":\"support\"}', '2023-07-10 00:34:51', '2023-07-10 00:34:51'),
(7, 'BlogSearchWidget', 'primary_sidebar', 'jobcy', 1, '{\"id\":\"BlogSearchWidget\",\"name\":\"Search\"}', '2023-07-10 00:34:51', '2023-07-10 00:34:51'),
(8, 'BlogCategoriesWidget', 'primary_sidebar', 'jobcy', 2, '{\"id\":\"BlogCategoriesWidget\",\"name\":\"Categories\"}', '2023-07-10 00:34:51', '2023-07-10 00:34:51'),
(9, 'BlogPostsWidget', 'primary_sidebar', 'jobcy', 3, '{\"id\":\"BlogPostsWidget\",\"type\":\"popular\",\"name\":\"Popular Posts\"}', '2023-07-10 00:34:51', '2023-07-10 00:34:51'),
(10, 'BlogTagsWidget', 'primary_sidebar', 'jobcy', 4, '{\"id\":\"BlogTagsWidget\",\"name\":\"Popular Tags\"}', '2023-07-10 00:34:51', '2023-07-10 00:34:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activations`
--
ALTER TABLE `activations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activations_user_id_index` (`user_id`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audit_histories`
--
ALTER TABLE `audit_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audit_histories_user_id_index` (`user_id`),
  ADD KEY `audit_histories_module_index` (`module`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `status` (`status`),
  ADD KEY `created_at` (`created_at`);

--
-- Indexes for table `categories_translations`
--
ALTER TABLE `categories_translations`
  ADD PRIMARY KEY (`lang_code`,`categories_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities_translations`
--
ALTER TABLE `cities_translations`
  ADD PRIMARY KEY (`lang_code`,`cities_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_replies`
--
ALTER TABLE `contact_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries_translations`
--
ALTER TABLE `countries_translations`
  ADD PRIMARY KEY (`lang_code`,`countries_id`);

--
-- Indexes for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dashboard_widget_settings`
--
ALTER TABLE `dashboard_widget_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  ADD KEY `dashboard_widget_settings_widget_id_index` (`widget_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs_translations`
--
ALTER TABLE `faqs_translations`
  ADD PRIMARY KEY (`lang_code`,`faqs_id`);

--
-- Indexes for table `faq_categories`
--
ALTER TABLE `faq_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq_categories_translations`
--
ALTER TABLE `faq_categories_translations`
  ADD PRIMARY KEY (`lang_code`,`faq_categories_id`);

--
-- Indexes for table `jb_accounts`
--
ALTER TABLE `jb_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `jb_accounts_email_unique` (`email`);

--
-- Indexes for table `jb_account_activity_logs`
--
ALTER TABLE `jb_account_activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jb_account_activity_logs_account_id_index` (`account_id`);

--
-- Indexes for table `jb_account_educations`
--
ALTER TABLE `jb_account_educations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_account_experiences`
--
ALTER TABLE `jb_account_experiences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_account_favorite_skills`
--
ALTER TABLE `jb_account_favorite_skills`
  ADD PRIMARY KEY (`skill_id`,`account_id`);

--
-- Indexes for table `jb_account_favorite_tags`
--
ALTER TABLE `jb_account_favorite_tags`
  ADD PRIMARY KEY (`tag_id`,`account_id`);

--
-- Indexes for table `jb_account_packages`
--
ALTER TABLE `jb_account_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_account_password_resets`
--
ALTER TABLE `jb_account_password_resets`
  ADD KEY `jb_account_password_resets_email_index` (`email`),
  ADD KEY `jb_account_password_resets_token_index` (`token`);

--
-- Indexes for table `jb_analytics`
--
ALTER TABLE `jb_analytics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_applications`
--
ALTER TABLE `jb_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_career_levels`
--
ALTER TABLE `jb_career_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_career_levels_translations`
--
ALTER TABLE `jb_career_levels_translations`
  ADD PRIMARY KEY (`lang_code`,`jb_career_levels_id`);

--
-- Indexes for table `jb_categories`
--
ALTER TABLE `jb_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_categories_translations`
--
ALTER TABLE `jb_categories_translations`
  ADD PRIMARY KEY (`lang_code`,`jb_categories_id`);

--
-- Indexes for table `jb_companies`
--
ALTER TABLE `jb_companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_currencies`
--
ALTER TABLE `jb_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_custom_fields`
--
ALTER TABLE `jb_custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jb_custom_fields_authorable_type_authorable_id_index` (`authorable_type`,`authorable_id`);

--
-- Indexes for table `jb_custom_fields_translations`
--
ALTER TABLE `jb_custom_fields_translations`
  ADD PRIMARY KEY (`lang_code`,`jb_custom_fields_id`);

--
-- Indexes for table `jb_custom_field_options`
--
ALTER TABLE `jb_custom_field_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_custom_field_options_translations`
--
ALTER TABLE `jb_custom_field_options_translations`
  ADD PRIMARY KEY (`lang_code`,`jb_custom_field_options_id`);

--
-- Indexes for table `jb_custom_field_values`
--
ALTER TABLE `jb_custom_field_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jb_custom_field_values_reference_type_reference_id_index` (`reference_type`,`reference_id`);

--
-- Indexes for table `jb_custom_field_values_translations`
--
ALTER TABLE `jb_custom_field_values_translations`
  ADD PRIMARY KEY (`lang_code`,`jb_custom_field_values_id`);

--
-- Indexes for table `jb_degree_levels`
--
ALTER TABLE `jb_degree_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_degree_levels_translations`
--
ALTER TABLE `jb_degree_levels_translations`
  ADD PRIMARY KEY (`lang_code`,`jb_degree_levels_id`);

--
-- Indexes for table `jb_degree_types`
--
ALTER TABLE `jb_degree_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_degree_types_translations`
--
ALTER TABLE `jb_degree_types_translations`
  ADD PRIMARY KEY (`lang_code`,`jb_degree_types_id`);

--
-- Indexes for table `jb_functional_areas`
--
ALTER TABLE `jb_functional_areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_functional_areas_translations`
--
ALTER TABLE `jb_functional_areas_translations`
  ADD PRIMARY KEY (`lang_code`,`jb_functional_areas_id`);

--
-- Indexes for table `jb_invoices`
--
ALTER TABLE `jb_invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `jb_invoices_code_unique` (`code`),
  ADD KEY `jb_invoices_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  ADD KEY `jb_invoices_payment_id_index` (`payment_id`),
  ADD KEY `jb_invoices_status_index` (`status`);

--
-- Indexes for table `jb_invoice_items`
--
ALTER TABLE `jb_invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jb_invoice_items_reference_type_reference_id_index` (`reference_type`,`reference_id`);

--
-- Indexes for table `jb_jobs`
--
ALTER TABLE `jb_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_jobs_tags`
--
ALTER TABLE `jb_jobs_tags`
  ADD PRIMARY KEY (`job_id`,`tag_id`),
  ADD KEY `jb_jobs_tags_job_id_index` (`job_id`),
  ADD KEY `jb_jobs_tags_tag_id_index` (`tag_id`);

--
-- Indexes for table `jb_jobs_translations`
--
ALTER TABLE `jb_jobs_translations`
  ADD PRIMARY KEY (`lang_code`,`jb_jobs_id`);

--
-- Indexes for table `jb_job_experiences`
--
ALTER TABLE `jb_job_experiences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_job_experiences_translations`
--
ALTER TABLE `jb_job_experiences_translations`
  ADD PRIMARY KEY (`lang_code`,`jb_job_experiences_id`);

--
-- Indexes for table `jb_job_shifts`
--
ALTER TABLE `jb_job_shifts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_job_shifts_translations`
--
ALTER TABLE `jb_job_shifts_translations`
  ADD PRIMARY KEY (`lang_code`,`jb_job_shifts_id`);

--
-- Indexes for table `jb_job_skills`
--
ALTER TABLE `jb_job_skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_job_skills_translations`
--
ALTER TABLE `jb_job_skills_translations`
  ADD PRIMARY KEY (`lang_code`,`jb_job_skills_id`);

--
-- Indexes for table `jb_job_types`
--
ALTER TABLE `jb_job_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_job_types_translations`
--
ALTER TABLE `jb_job_types_translations`
  ADD PRIMARY KEY (`lang_code`,`jb_job_types_id`);

--
-- Indexes for table `jb_language_levels`
--
ALTER TABLE `jb_language_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_language_levels_translations`
--
ALTER TABLE `jb_language_levels_translations`
  ADD PRIMARY KEY (`lang_code`,`jb_language_levels_id`);

--
-- Indexes for table `jb_major_subjects`
--
ALTER TABLE `jb_major_subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_packages`
--
ALTER TABLE `jb_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_packages_translations`
--
ALTER TABLE `jb_packages_translations`
  ADD PRIMARY KEY (`lang_code`,`jb_packages_id`);

--
-- Indexes for table `jb_reviews`
--
ALTER TABLE `jb_reviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reviews_unique` (`reviewable_id`,`reviewable_type`,`created_by_id`,`created_by_type`),
  ADD KEY `jb_reviews_reviewable_type_reviewable_id_index` (`reviewable_type`,`reviewable_id`),
  ADD KEY `jb_reviews_created_by_type_created_by_id_index` (`created_by_type`,`created_by_id`),
  ADD KEY `jb_reviews_reviewable_id_reviewable_type_status_index` (`reviewable_id`,`reviewable_type`,`status`);

--
-- Indexes for table `jb_saved_jobs`
--
ALTER TABLE `jb_saved_jobs`
  ADD PRIMARY KEY (`account_id`,`job_id`);

--
-- Indexes for table `jb_tags`
--
ALTER TABLE `jb_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jb_tags_translations`
--
ALTER TABLE `jb_tags_translations`
  ADD PRIMARY KEY (`lang_code`,`jb_tags_id`);

--
-- Indexes for table `jb_transactions`
--
ALTER TABLE `jb_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`lang_id`);

--
-- Indexes for table `language_meta`
--
ALTER TABLE `language_meta`
  ADD PRIMARY KEY (`lang_meta_id`),
  ADD KEY `language_meta_reference_id_index` (`reference_id`);

--
-- Indexes for table `media_files`
--
ALTER TABLE `media_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_files_user_id_index` (`user_id`),
  ADD KEY `media_files_index` (`folder_id`,`user_id`,`created_at`);

--
-- Indexes for table `media_folders`
--
ALTER TABLE `media_folders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_folders_user_id_index` (`user_id`),
  ADD KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`);

--
-- Indexes for table `media_settings`
--
ALTER TABLE `media_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_slug_unique` (`slug`);

--
-- Indexes for table `menu_locations`
--
ALTER TABLE `menu_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`);

--
-- Indexes for table `menu_nodes`
--
ALTER TABLE `menu_nodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_nodes_menu_id_index` (`menu_id`),
  ADD KEY `menu_nodes_parent_id_index` (`parent_id`),
  ADD KEY `reference_id` (`reference_id`),
  ADD KEY `reference_type` (`reference_type`);

--
-- Indexes for table `meta_boxes`
--
ALTER TABLE `meta_boxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meta_boxes_reference_id_index` (`reference_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pages_user_id_index` (`user_id`);

--
-- Indexes for table `pages_translations`
--
ALTER TABLE `pages_translations`
  ADD PRIMARY KEY (`lang_code`,`pages_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `author_type` (`author_type`),
  ADD KEY `created_at` (`created_at`);

--
-- Indexes for table `posts_translations`
--
ALTER TABLE `posts_translations`
  ADD PRIMARY KEY (`lang_code`,`posts_id`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD KEY `post_categories_category_id_index` (`category_id`),
  ADD KEY `post_categories_post_id_index` (`post_id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD KEY `post_tags_tag_id_index` (`tag_id`),
  ADD KEY `post_tags_post_id_index` (`post_id`);

--
-- Indexes for table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`),
  ADD KEY `roles_created_by_index` (`created_by`),
  ADD KEY `roles_updated_by_index` (`updated_by`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_users_user_id_index` (`user_id`),
  ADD KEY `role_users_role_id_index` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `slugs`
--
ALTER TABLE `slugs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slugs_reference_id_index` (`reference_id`);

--
-- Indexes for table `slugs_translations`
--
ALTER TABLE `slugs_translations`
  ADD PRIMARY KEY (`lang_code`,`slugs_id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states_translations`
--
ALTER TABLE `states_translations`
  ADD PRIMARY KEY (`lang_code`,`states_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags_translations`
--
ALTER TABLE `tags_translations`
  ADD PRIMARY KEY (`lang_code`,`tags_id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials_translations`
--
ALTER TABLE `testimonials_translations`
  ADD PRIMARY KEY (`lang_code`,`testimonials_id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `user_meta`
--
ALTER TABLE `user_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_meta_user_id_index` (`user_id`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activations`
--
ALTER TABLE `activations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audit_histories`
--
ALTER TABLE `audit_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=568;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `contact_replies`
--
ALTER TABLE `contact_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `dashboard_widget_settings`
--
ALTER TABLE `dashboard_widget_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `faq_categories`
--
ALTER TABLE `faq_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jb_accounts`
--
ALTER TABLE `jb_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `jb_account_activity_logs`
--
ALTER TABLE `jb_account_activity_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jb_account_educations`
--
ALTER TABLE `jb_account_educations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `jb_account_experiences`
--
ALTER TABLE `jb_account_experiences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `jb_account_packages`
--
ALTER TABLE `jb_account_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jb_analytics`
--
ALTER TABLE `jb_analytics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jb_applications`
--
ALTER TABLE `jb_applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `jb_career_levels`
--
ALTER TABLE `jb_career_levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jb_categories`
--
ALTER TABLE `jb_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `jb_companies`
--
ALTER TABLE `jb_companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `jb_currencies`
--
ALTER TABLE `jb_currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jb_custom_fields`
--
ALTER TABLE `jb_custom_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jb_custom_field_options`
--
ALTER TABLE `jb_custom_field_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jb_custom_field_values`
--
ALTER TABLE `jb_custom_field_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jb_degree_levels`
--
ALTER TABLE `jb_degree_levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `jb_degree_types`
--
ALTER TABLE `jb_degree_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `jb_functional_areas`
--
ALTER TABLE `jb_functional_areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `jb_invoices`
--
ALTER TABLE `jb_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jb_invoice_items`
--
ALTER TABLE `jb_invoice_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jb_jobs`
--
ALTER TABLE `jb_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `jb_job_experiences`
--
ALTER TABLE `jb_job_experiences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `jb_job_shifts`
--
ALTER TABLE `jb_job_shifts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jb_job_skills`
--
ALTER TABLE `jb_job_skills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `jb_job_types`
--
ALTER TABLE `jb_job_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jb_language_levels`
--
ALTER TABLE `jb_language_levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jb_major_subjects`
--
ALTER TABLE `jb_major_subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jb_packages`
--
ALTER TABLE `jb_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jb_reviews`
--
ALTER TABLE `jb_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `jb_tags`
--
ALTER TABLE `jb_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `jb_transactions`
--
ALTER TABLE `jb_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `lang_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `language_meta`
--
ALTER TABLE `language_meta`
  MODIFY `lang_meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media_files`
--
ALTER TABLE `media_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `media_folders`
--
ALTER TABLE `media_folders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `media_settings`
--
ALTER TABLE `media_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `menu_locations`
--
ALTER TABLE `menu_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_nodes`
--
ALTER TABLE `menu_nodes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `meta_boxes`
--
ALTER TABLE `meta_boxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `slugs`
--
ALTER TABLE `slugs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2254;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_meta`
--
ALTER TABLE `user_meta`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
