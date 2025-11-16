-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 16, 2025 at 04:15 PM
-- Server version: 5.7.40
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laraveln8n`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-424f74a6a7ed4d4ed4761507ebcd209a6ef0937b:timer', 'i:1763206675;', 1763206675),
('laravel-cache-424f74a6a7ed4d4ed4761507ebcd209a6ef0937b', 'i:1;', 1763206675),
('laravel-cache-356a192b7913b04c54574d18c28d46e6395428ab:timer', 'i:1763302921;', 1763302921),
('laravel-cache-356a192b7913b04c54574d18c28d46e6395428ab', 'i:2;', 1763302921);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cats`
--

DROP TABLE IF EXISTS `cats`;
CREATE TABLE IF NOT EXISTS `cats` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filer` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cats_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cats`
--

INSERT INTO `cats` (`id`, `name`, `department`, `img`, `img2`, `filer`, `created_at`, `updated_at`) VALUES
(1, 'cat333', 'Marketing', 'uploads/img/cat/cat333-1763141701_691768450ee86.jpg', 'uploads/img/cat/thumb/cat333-1763141701_691768450ee86.jpg', 'uploads/files/cat/cat333_1763141701_6917684595c47.docx', '2025-11-14 13:35:01', '2025-11-14 13:35:01'),
(2, 'cat 222', 'Sales', 'uploads/img/cat/cat-222-1763141724_6917685ce5f05.jpg', 'uploads/img/cat/thumb/cat-222-1763141724_6917685ce5f05.jpg', NULL, '2025-11-14 13:35:24', '2025-11-14 13:35:25'),
(3, 'cat5555', 'Sales', NULL, NULL, NULL, '2025-11-14 13:35:44', '2025-11-14 13:35:44'),
(4, 'ccccc', 'PR', NULL, NULL, 'uploads/files/cat/ccccc_1763141770_6917688a66061.docx', '2025-11-14 13:36:10', '2025-11-14 13:36:10'),
(5, 'cat777', 'Sales', 'uploads/img/cat/cat777-1763143039_69176d7fc989a.jpg', 'uploads/img/cat/thumb/cat777-1763143039_69176d7fc989a.jpg', NULL, '2025-11-14 13:57:19', '2025-11-14 13:57:20'),
(6, 'cat67', NULL, 'uploads/img/cat/cat67-1763143096_69176db829652.jpg', 'uploads/img/cat/thumb/cat67-1763143096_69176db829652.jpg', NULL, '2025-11-14 13:58:16', '2025-11-14 13:58:17'),
(7, 'ca7888', NULL, 'uploads/img/cat/ca7888-1763143375_69176ecfd653c.jpg', 'uploads/img/cat/thumb/ca7888-1763143375_69176ecfd653c.jpg', NULL, '2025-11-14 14:02:55', '2025-11-14 14:02:56'),
(8, 'ddddd', NULL, NULL, NULL, NULL, '2025-11-14 14:09:08', '2025-11-14 14:09:08'),
(9, 'cat6788', 'PR', 'uploads/img/cat/cat6788-1763143763_6917705336b7f.jpg', 'uploads/img/cat/thumb/cat6788-1763143763_6917705336b7f.jpg', NULL, '2025-11-14 14:09:23', '2025-11-14 14:09:25'),
(10, 'ggfgfdfg', NULL, 'uploads/img/cat/ggfgfdfg-1763143779_691770630f1c3.jpg', 'uploads/img/cat/thumb/ggfgfdfg-1763143779_691770630f1c3.jpg', NULL, '2025-11-14 14:09:39', '2025-11-14 14:09:39'),
(21, 'pcuture333', 'Sales', 'uploads/img/cat/pcuture333-1763283023_6919904f6fd10.jpg', 'uploads/img/cat/thumb/pcuture333-1763283023_6919904f6fd10.jpg', NULL, '2025-11-16 04:50:23', '2025-11-16 04:50:24'),
(22, 'Picture3', 'Sales', 'uploads/img/cat/Picture3-1763283434_691991ea519f1.jpg', 'uploads/img/cat/thumb/Picture3-1763283434_691991ea519f1.jpg', NULL, '2025-11-16 04:57:14', '2025-11-16 04:57:14'),
(23, 'only picccc', 'Sales', 'uploads/img/cat/only-picccc-1763285256_69199908c2466.jpg', 'uploads/img/cat/thumb/only-picccc-1763285256_69199908c2466.jpg', 'uploads/files/cat/only-picccc_1763285256_69199908d1772.jpg', '2025-11-16 05:27:36', '2025-11-16 05:27:36'),
(24, 'pic5555', 'Marketing', 'uploads/img/cat/pic5555-1763286524_69199dfc8a723.jpg', 'uploads/img/cat/thumb/pic5555-1763286524_69199dfc8a723.jpg', NULL, '2025-11-16 05:48:44', '2025-11-16 05:48:44'),
(25, 'picertyuu', 'Sales', 'uploads/img/cat/picertyuu-1763286714_69199ebad1511.jpg', 'uploads/img/cat/thumb/picertyuu-1763286714_69199ebad1511.jpg', NULL, '2025-11-16 05:51:54', '2025-11-16 05:51:56'),
(26, 'picture567', 'Marketing', 'uploads/img/cat/picture567-1763287592_6919a2284ffb6.jpg', 'uploads/img/cat/thumb/picture567-1763287592_6919a2284ffb6.jpg', NULL, '2025-11-16 06:06:32', '2025-11-16 06:06:33'),
(27, 'number 45 - n89', 'HR', 'uploads/img/cat/number-45---n89-1763288639_6919a63fca8ed.jpg', 'uploads/img/cat/thumb/number-45---n89-1763288639_6919a63fca8ed.jpg', NULL, '2025-11-16 06:23:59', '2025-11-16 06:23:59'),
(28, 'approach 1', 'Sales', 'uploads/img/cat/approach-1-1763288945_6919a7718b305.jpg', 'uploads/img/cat/thumb/approach-1-1763288945_6919a7718b305.jpg', NULL, '2025-11-16 06:29:05', '2025-11-16 06:29:05'),
(29, '3333', 'Marketing', NULL, NULL, NULL, '2025-11-16 06:36:46', '2025-11-16 06:36:46'),
(30, '451', 'Sales', 'uploads/img/cat/451-1763296651_6919c58b4585f.jpg', 'uploads/img/cat/thumb/451-1763296651_6919c58b4585f.jpg', 'uploads/files/cat/451_1763296651_6919c58b681d3.jpg', '2025-11-16 08:37:31', '2025-11-16 08:37:31'),
(31, 'attack789', 'Sales', 'uploads/img/cat/attack789-1763296885_6919c675c6c8c.jpg', 'uploads/img/cat/thumb/attack789-1763296885_6919c675c6c8c.jpg', 'uploads/files/cat/attack789_1763296885_6919c675e7c7a.pdf', '2025-11-16 08:41:25', '2025-11-16 08:41:25'),
(32, 'Number345', 'Sales', 'uploads/img/cat/Number345-1763302628_6919dce453bc3.jpg', 'uploads/img/cat/thumb/Number345-1763302628_6919dce453bc3.jpg', 'uploads/files/cat/Number345_1763302630_6919dce68c32d.pdf', '2025-11-16 10:17:08', '2025-11-16 10:17:10'),
(33, 'From the web version', 'Sales', 'uploads/img/cat/From-the-web-version-1763302889_6919dde9c4773.jpg', 'uploads/img/cat/thumb/From-the-web-version-1763302889_6919dde9c4773.jpg', 'uploads/files/cat/From-the-web-version_1763302889_6919dde9d2973.pdf', '2025-11-16 10:21:29', '2025-11-16 10:21:29');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_11_07_185405_create_personal_access_tokens_table', 1),
(5, '2025_11_13_153925_create_cats_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=MyISAM AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(158, 'App\\Models\\User', 1, 'login', '4bff66c1f8397279e2458519f3a3bc96fe15d8f55358f634d0fd9f84f774fea3', '[\"*\"]', '2025-11-16 10:21:29', '2025-12-15 07:36:55', '2025-11-15 07:36:55', '2025-11-16 10:21:29');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('XjuCNjMPDwYLxg9UgqzCo4R6gaHHZ7itpUIsJilV', 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZGFRaXlGbFAzUUxPMFNON0tSMWJOd2RoRlhwbjFjNFBDUDVLcXFubiI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozNzoiaHR0cDovL2xvY2FsaG9zdDo4MDAwL2FkbWluL2NhdHMvdmlldyI7czo1OiJyb3V0ZSI7czoxNToiY2F0cy5pbmRleGFkbWluIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1763302896);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'n8n', 'bediktest@gmail.com', NULL, '$2y$12$taEXAmjy.78Qw5UoMrkGAeUMhslizqaqpKj2ppc34rcjyjvDNr2Oe', NULL, '2025-11-08 14:37:27', '2025-11-08 14:37:27'),
(2, 'Admin', 'bedikmanoukian07@gmail.com', NULL, '$2y$12$SHLkU.kT9CRoYI4yMCh8DeACUFUkb05SrlMp/6qDBfqvsJpoVtLhK', 'CgOEloMMkcfj5jArPt6AfgvvEC9NolSDMvCP63uIvscyGfAt8oideR6Ex67P', '2025-11-13 13:21:24', '2025-11-13 13:21:24');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
