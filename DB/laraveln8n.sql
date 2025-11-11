-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 11, 2025 at 05:43 PM
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
('laravel-cache-424f74a6a7ed4d4ed4761507ebcd209a6ef0937b:timer', 'i:1762873251;', 1762873251),
('laravel-cache-424f74a6a7ed4d4ed4761507ebcd209a6ef0937b', 'i:2;', 1762873251),
('laravel-cache-356a192b7913b04c54574d18c28d46e6395428ab:timer', 'i:1762873416;', 1762873416),
('laravel-cache-356a192b7913b04c54574d18c28d46e6395428ab', 'i:1;', 1762873416);

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_11_07_185405_create_personal_access_tokens_table', 1);

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
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'login', '6c3207babd1fc07a9deb174e39909daabbc58484aeca6cf5a5766b294d2cb5ed', '[\"*\"]', NULL, '2025-12-09 13:54:00', '2025-11-09 13:54:00', '2025-11-09 13:54:00'),
(2, 'App\\Models\\User', 1, 'login', '2d239df1a0309ce8a3f13616f802ac76fff6e1d5238da20af8229a793ea90aac', '[\"*\"]', NULL, '2025-12-09 13:56:18', '2025-11-09 13:56:18', '2025-11-09 13:56:18'),
(3, 'App\\Models\\User', 1, 'login', '41eede0de74f13d0d191088791dbf5d6479c66fc8ec0ceb989abbca53f7007c5', '[\"*\"]', NULL, '2025-12-09 14:00:07', '2025-11-09 14:00:07', '2025-11-09 14:00:07'),
(4, 'App\\Models\\User', 1, 'login', '405c5b93fcde0fbfd34e9cd4f17bde7386c50931c7c6a236a282b798f013ac43', '[\"*\"]', NULL, '2025-12-09 14:07:29', '2025-11-09 14:07:29', '2025-11-09 14:07:29'),
(5, 'App\\Models\\User', 1, 'login', '078859f94dec8c3a6bd753c44f3726efb2a69ce9b19dbdfb889c1bfce9096419', '[\"*\"]', NULL, '2025-12-09 14:17:59', '2025-11-09 14:17:59', '2025-11-09 14:17:59'),
(6, 'App\\Models\\User', 1, 'login', 'c920154f3251370781dc95f7b84eac3dcfdb5d24931425c20e98189b8d59111f', '[\"*\"]', NULL, '2025-12-09 14:20:04', '2025-11-09 14:20:04', '2025-11-09 14:20:04'),
(7, 'App\\Models\\User', 1, 'login', 'ffccf80d8452aab1839c77d4ab193fd9cd26c1416b0a591854d7f6a25ab1ef62', '[\"*\"]', NULL, '2025-12-09 14:23:09', '2025-11-09 14:23:09', '2025-11-09 14:23:09'),
(8, 'App\\Models\\User', 1, 'login', '6b843d3f71fd05556e9cc543593d516ca456a7b8b177a14cf3d57f1eb986cd04', '[\"*\"]', NULL, '2025-12-09 14:29:32', '2025-11-09 14:29:32', '2025-11-09 14:29:32'),
(9, 'App\\Models\\User', 1, 'login', 'ea6c9a6726795512fbc0e72ac8798a86fb3d879141fbdbe3d96377b46cf6a548', '[\"*\"]', NULL, '2025-12-09 14:49:59', '2025-11-09 14:49:59', '2025-11-09 14:49:59'),
(10, 'App\\Models\\User', 1, 'login', '4d929a8254d7767b1613558b6d1915ea248a689516619d06ecab3ff214956d43', '[\"*\"]', NULL, '2025-12-09 14:53:13', '2025-11-09 14:53:13', '2025-11-09 14:53:13'),
(11, 'App\\Models\\User', 1, 'login', '251db1d11d0be2f249cd15b01de2252f5f603bbeda65094464d52fbef1e12cfa', '[\"*\"]', NULL, '2025-12-09 14:54:12', '2025-11-09 14:54:12', '2025-11-09 14:54:12'),
(12, 'App\\Models\\User', 1, 'login', '973863f066a08136ab8d2a4585c025f802eec94e9f40920889edf6171ddf7db7', '[\"*\"]', NULL, '2025-12-09 15:02:32', '2025-11-09 15:02:32', '2025-11-09 15:02:32'),
(13, 'App\\Models\\User', 1, 'login', '1c32e59f8e53bf70782ad636652a7355aac80f516fee8c38a156332afde5904f', '[\"*\"]', NULL, '2025-12-09 15:07:18', '2025-11-09 15:07:18', '2025-11-09 15:07:18'),
(14, 'App\\Models\\User', 1, 'login', '1971c2f94c48de5b86bb7cdb11a94555555d9b5bd8052d9155e8deb4467744e9', '[\"*\"]', NULL, '2025-12-09 15:17:14', '2025-11-09 15:17:14', '2025-11-09 15:17:14'),
(15, 'App\\Models\\User', 1, 'login', '88b5a8b45d033967092d97f67ed153115d552226ddb22330a33a918e5668463f', '[\"*\"]', NULL, '2025-12-10 02:33:37', '2025-11-10 02:33:37', '2025-11-10 02:33:37'),
(16, 'App\\Models\\User', 1, 'login', 'ed7c521543c2398f13af626b6a96d00a82aaac9ecf004c9d76b03f48a415beb7', '[\"*\"]', NULL, '2025-12-10 02:53:22', '2025-11-10 02:53:22', '2025-11-10 02:53:22'),
(17, 'App\\Models\\User', 1, 'login', '0339e7d007e531f71161f73f029675fb5365a16388bd7d4c1853c4cf72c141e8', '[\"*\"]', NULL, '2025-12-10 03:24:52', '2025-11-10 03:24:52', '2025-11-10 03:24:52'),
(18, 'App\\Models\\User', 1, 'login', '77a629a4e2437c4e22aa4335f07581f61cf611779ff42bd4a62e8c48d4288405', '[\"*\"]', NULL, '2025-12-10 03:28:00', '2025-11-10 03:28:00', '2025-11-10 03:28:00'),
(19, 'App\\Models\\User', 1, 'login', '30831589fffce4e4a0e5106c85cc09631d03a12e0a5b502b0595f59af3a3caf5', '[\"*\"]', NULL, '2025-12-10 04:09:34', '2025-11-10 04:09:34', '2025-11-10 04:09:34'),
(20, 'App\\Models\\User', 1, 'login', 'a97777ec6e7ad11a6839b1aa7893e6e4ef6351141dced80fe4ff0129f96dada6', '[\"*\"]', NULL, '2025-12-10 06:38:39', '2025-11-10 06:38:39', '2025-11-10 06:38:39'),
(21, 'App\\Models\\User', 1, 'login', 'a9c7ae4e0fd470fa5cfe09e5c3b930cdf0550995137ec35a2db665bbbb1167dc', '[\"*\"]', NULL, '2025-12-10 06:58:53', '2025-11-10 06:58:53', '2025-11-10 06:58:53'),
(22, 'App\\Models\\User', 1, 'login', 'a3a73855777b795caf23bedcbf452ef95449b15016e685911b280f64d0376beb', '[\"*\"]', NULL, '2025-12-10 07:03:13', '2025-11-10 07:03:13', '2025-11-10 07:03:13'),
(23, 'App\\Models\\User', 1, 'login', 'e6d9193a56051618286ca874000493eec9cb0cad95ae31db44d3396144242ec6', '[\"*\"]', NULL, '2025-12-10 07:14:20', '2025-11-10 07:14:20', '2025-11-10 07:14:20'),
(24, 'App\\Models\\User', 1, 'login', '978d9344f4d2bb6c540ac187aea4ebfbbef9722848cf03804565a9e4e8646820', '[\"*\"]', NULL, '2025-12-10 07:16:17', '2025-11-10 07:16:17', '2025-11-10 07:16:17'),
(25, 'App\\Models\\User', 1, 'login', '335d0d357acd19d319786d09dc82b453aa0465cd3328d34149f624adabcce307', '[\"*\"]', NULL, '2025-12-10 07:18:40', '2025-11-10 07:18:40', '2025-11-10 07:18:40'),
(26, 'App\\Models\\User', 1, 'login', '05670bc64b1ec0446d840e890ded69550484e3dc8bba5c2b8d2747e602fde7bb', '[\"*\"]', NULL, '2025-12-10 07:21:46', '2025-11-10 07:21:46', '2025-11-10 07:21:46'),
(27, 'App\\Models\\User', 1, 'login', '72f1cdc634c1a3bc6eaa1ac35e680c4786057a4f61bfa14a727cbfc5cdcb15b3', '[\"*\"]', NULL, '2025-12-10 07:35:27', '2025-11-10 07:35:27', '2025-11-10 07:35:27'),
(28, 'App\\Models\\User', 1, 'login', '5dfe782ea04958467dd0406eb0b93bef660476d178776d70bc705cefd6766391', '[\"*\"]', NULL, '2025-12-10 07:44:10', '2025-11-10 07:44:10', '2025-11-10 07:44:10'),
(29, 'App\\Models\\User', 1, 'login', '2f51c4e12cb1d2aab40fb680200ad4350967b552886e7478d6fe2f56411c5fe0', '[\"*\"]', NULL, '2025-12-10 07:52:23', '2025-11-10 07:52:23', '2025-11-10 07:52:23'),
(30, 'App\\Models\\User', 1, 'login', 'e5d25482d162c69e1d2f0948124ca6e7e609f2ef5669434d48aa61f528b6d0f9', '[\"*\"]', NULL, '2025-12-10 07:55:58', '2025-11-10 07:55:58', '2025-11-10 07:55:58'),
(31, 'App\\Models\\User', 1, 'login', '9a68183ce8e14199308a40f959c7759e1bd0f554997edef60da2de87505ae696', '[\"*\"]', NULL, '2025-12-10 07:56:33', '2025-11-10 07:56:34', '2025-11-10 07:56:34'),
(32, 'App\\Models\\User', 1, 'login', 'fbdfd2dda4cccb911829b3201258efc9a5fd1bdd59cd6aaf34abd0c8fc193449', '[\"*\"]', NULL, '2025-12-10 08:04:13', '2025-11-10 08:04:13', '2025-11-10 08:04:13'),
(33, 'App\\Models\\User', 1, 'login', 'a027324a688007db6e9eef7faafd8abc2d364095c90e54c1e4eac797eb46b293', '[\"*\"]', NULL, '2025-12-10 08:05:08', '2025-11-10 08:05:08', '2025-11-10 08:05:08'),
(34, 'App\\Models\\User', 1, 'login', '3b375eaceea50a71f7a95daec1d07dfd5cd3c48ff98cfbc423887cf64d3ef922', '[\"*\"]', NULL, '2025-12-10 08:06:01', '2025-11-10 08:06:01', '2025-11-10 08:06:01'),
(35, 'App\\Models\\User', 1, 'login', '8262e1ba9cc5083a7db360fce8a8333dd1f0f1decf1afc291c40989bba3f490e', '[\"*\"]', NULL, '2025-12-10 08:09:37', '2025-11-10 08:09:37', '2025-11-10 08:09:37'),
(36, 'App\\Models\\User', 1, 'login', '783d7f4c764497d1c8665ad30b1bf28c462da830aa5061b1a65c9fabfd13bb62', '[\"*\"]', NULL, '2025-12-10 08:10:04', '2025-11-10 08:10:04', '2025-11-10 08:10:04'),
(37, 'App\\Models\\User', 1, 'login', 'a30f692faa3db51e443d665b93439118697f43f2e095052c03f91e6ada78a754', '[\"*\"]', NULL, '2025-12-10 08:17:33', '2025-11-10 08:17:33', '2025-11-10 08:17:33'),
(38, 'App\\Models\\User', 1, 'login', '591346d342c8673f6a0b280e7f153bd1986c5a17a28263d364d7df01f7181be0', '[\"*\"]', NULL, '2025-12-10 08:20:12', '2025-11-10 08:20:12', '2025-11-10 08:20:12'),
(39, 'App\\Models\\User', 1, 'login', '046bd2cc40e8d4d8fd86df36b4afc159db1e4d2172111f61666b5d22d694099c', '[\"*\"]', NULL, '2025-12-10 08:32:30', '2025-11-10 08:32:30', '2025-11-10 08:32:30'),
(40, 'App\\Models\\User', 1, 'login', 'bb4d3e5c2a72a695f4cfbed54f9eb37449931d1adb98f856ae9f60a273c60eef', '[\"*\"]', NULL, '2025-12-10 08:36:36', '2025-11-10 08:36:36', '2025-11-10 08:36:36'),
(41, 'App\\Models\\User', 1, 'login', 'd0d80a7eda3306b48d4b3ac70dbae71bdf5783476b77fe73d5f95bf7383ee4bc', '[\"*\"]', NULL, '2025-12-10 08:40:51', '2025-11-10 08:40:51', '2025-11-10 08:40:51'),
(42, 'App\\Models\\User', 1, 'login', '22b2194cbb173cd80f76860bd2a361b19acc5b5c90ab8366d6774e70378e645f', '[\"*\"]', NULL, '2025-12-10 08:43:19', '2025-11-10 08:43:19', '2025-11-10 08:43:19'),
(43, 'App\\Models\\User', 1, 'login', 'e528431d33a41eb3a167b33af4884776a4b411f9b7aa1bc12a2b62782faac6f7', '[\"*\"]', NULL, '2025-12-10 08:47:14', '2025-11-10 08:47:14', '2025-11-10 08:47:14'),
(44, 'App\\Models\\User', 1, 'login', '0d06f361c13d3d3471868e9a9d49d6af2835f929de24c6aaba5f9373b7f2eeb5', '[\"*\"]', NULL, '2025-12-10 08:56:15', '2025-11-10 08:56:15', '2025-11-10 08:56:15'),
(45, 'App\\Models\\User', 1, 'login', 'd09022974e5326b42cb0c12b1762068b013b65e59d15fdff850ef2e7305727a1', '[\"*\"]', NULL, '2025-12-10 09:08:07', '2025-11-10 09:08:07', '2025-11-10 09:08:07'),
(46, 'App\\Models\\User', 1, 'login', '580d21224635e7f14335e7f7c0ce9cdbb0ce5c17578afdadb4acf04d2518feb1', '[\"*\"]', NULL, '2025-12-10 09:23:25', '2025-11-10 09:23:25', '2025-11-10 09:23:25'),
(47, 'App\\Models\\User', 1, 'login', 'fc665cfce7e9b395f5f1082b49dcd133a20d0012daba826efa3c70f9977ef81a', '[\"*\"]', NULL, '2025-12-10 09:58:17', '2025-11-10 09:58:17', '2025-11-10 09:58:17'),
(48, 'App\\Models\\User', 1, 'login', 'b1b497caac817db94db6fc96960f63d32d8a7067967ffd395b34089cd53cce4f', '[\"*\"]', NULL, '2025-12-10 10:03:59', '2025-11-10 10:03:59', '2025-11-10 10:03:59'),
(49, 'App\\Models\\User', 1, 'login', '61db108ba5c94161251c62f91b69f96754a5fbab049089cbf420e3bfeabac8ca', '[\"*\"]', NULL, '2025-12-10 10:04:40', '2025-11-10 10:04:40', '2025-11-10 10:04:40'),
(50, 'App\\Models\\User', 1, 'login', 'e140fa3318c46568f749d85d711b555eada9555f9e65257152da022f1302ee99', '[\"*\"]', NULL, '2025-12-10 10:11:54', '2025-11-10 10:11:54', '2025-11-10 10:11:54'),
(51, 'App\\Models\\User', 1, 'login', '50f02552694897fa875c5a44a9a5638e9ddb3d18303a931315cc7e6a3f516421', '[\"*\"]', NULL, '2025-12-10 10:15:55', '2025-11-10 10:15:55', '2025-11-10 10:15:55'),
(52, 'App\\Models\\User', 1, 'login', 'e787080f0fef6d7960d984d83549be1aeac38c05ef96158a639dba863d2ac1c4', '[\"*\"]', NULL, '2025-12-10 10:23:58', '2025-11-10 10:23:58', '2025-11-10 10:23:58'),
(53, 'App\\Models\\User', 1, 'login', '523b4a46d53544a7ed0ec5162f41db8b79b563fcc96e1efae68563b3c107819a', '[\"*\"]', NULL, '2025-12-10 10:28:29', '2025-11-10 10:28:29', '2025-11-10 10:28:29'),
(54, 'App\\Models\\User', 1, 'login', 'a3e04d73844fa695aaed119ff5653140b828025ad5275c020f2de589e2fe86b8', '[\"*\"]', NULL, '2025-12-10 10:29:34', '2025-11-10 10:29:34', '2025-11-10 10:29:34'),
(55, 'App\\Models\\User', 1, 'login', '3245f369f36f420445e210197e44afd4c451e51bc3969fdc4d8af0bcf3adab83', '[\"*\"]', NULL, '2025-12-10 10:58:16', '2025-11-10 10:58:16', '2025-11-10 10:58:16'),
(56, 'App\\Models\\User', 1, 'login', '99526c64deb4e5fa2ea6e723ff8c1818dc585c3a3d6065defbe2032213a24172', '[\"*\"]', NULL, '2025-12-10 10:59:09', '2025-11-10 10:59:09', '2025-11-10 10:59:09'),
(57, 'App\\Models\\User', 1, 'login', 'ea0f6429f4e0339d0e358e84ba9fabf947e8d3a597c87d5f1cf0711ef85e836a', '[\"*\"]', NULL, '2025-12-10 11:15:06', '2025-11-10 11:15:06', '2025-11-10 11:15:06'),
(58, 'App\\Models\\User', 1, 'login', '7dd587786a9737de4fd32f3b027227a22c9d26c78030a95ff7b39fadfe93a176', '[\"*\"]', NULL, '2025-12-10 11:23:00', '2025-11-10 11:23:00', '2025-11-10 11:23:00'),
(59, 'App\\Models\\User', 1, 'login', 'f9c833de44892269dbefcc62cc1050583417dc4121b9702df8acc297ecc57bfc', '[\"*\"]', NULL, '2025-12-10 11:23:40', '2025-11-10 11:23:40', '2025-11-10 11:23:40'),
(60, 'App\\Models\\User', 1, 'login', '472d687197e78780b41115e1bb54630a5095b0aeefef36666143f1d33f50b306', '[\"*\"]', NULL, '2025-12-10 11:34:57', '2025-11-10 11:34:57', '2025-11-10 11:34:57'),
(61, 'App\\Models\\User', 1, 'login', '1ade1d983f263fe096a5d76fb5f1f5588bc22e7f0640419dbda65b2c75f54003', '[\"*\"]', NULL, '2025-12-10 11:35:28', '2025-11-10 11:35:28', '2025-11-10 11:35:28'),
(62, 'App\\Models\\User', 1, 'login', '090c3079c97cc9f347bc6158745e7e8c23244802e2b169271fbd9d66eb738397', '[\"*\"]', NULL, '2025-12-10 11:41:36', '2025-11-10 11:41:36', '2025-11-10 11:41:36'),
(63, 'App\\Models\\User', 1, 'login', 'bcb25a313539c6695764d79433f810e6fac3ea5a0d42a42b1fbace4c4dcbc02c', '[\"*\"]', NULL, '2025-12-10 11:42:50', '2025-11-10 11:42:50', '2025-11-10 11:42:50'),
(64, 'App\\Models\\User', 1, 'login', '433522c2c7d5264b97995e6cd676056ad36cc80e48417ff35e8f01ac8f002c39', '[\"*\"]', NULL, '2025-12-10 11:57:11', '2025-11-10 11:57:11', '2025-11-10 11:57:11'),
(65, 'App\\Models\\User', 1, 'login', '883ac915ffda6f54abd852a3dcb25d44103989602459176a0bdbcf4b15fd880c', '[\"*\"]', NULL, '2025-12-10 11:58:37', '2025-11-10 11:58:37', '2025-11-10 11:58:38'),
(66, 'App\\Models\\User', 1, 'login', '6dbc3d377892dc2a282f830d3972709f50155fbabd2b74941a7edd3e11fea7a4', '[\"*\"]', NULL, '2025-12-10 11:59:56', '2025-11-10 11:59:56', '2025-11-10 11:59:56'),
(67, 'App\\Models\\User', 1, 'login', '01a95e96112c3eb184f7a77b1ec94216469f1f3d41a3ccbeb314dfa6d6c0e97d', '[\"*\"]', NULL, '2025-12-10 12:00:31', '2025-11-10 12:00:31', '2025-11-10 12:00:31'),
(68, 'App\\Models\\User', 1, 'login', '6c232021c5c6a80b10eb7a9b339f643463848750832ba20b744a046105fd9d31', '[\"*\"]', '2025-11-10 12:39:44', '2025-12-10 12:01:16', '2025-11-10 12:01:16', '2025-11-10 12:39:44'),
(69, 'App\\Models\\User', 1, 'login', '3917b4a444bfb6ba808a6feaf59e5059a1a22f8d5e265cc4d7a98dab4b29d870', '[\"*\"]', '2025-11-10 14:47:28', '2025-12-10 14:47:19', '2025-11-10 14:47:19', '2025-11-10 14:47:28'),
(70, 'App\\Models\\User', 1, 'login', '1469092da1e07063c210e59e67551d6444c025837802fbd74295ee9e501319a6', '[\"*\"]', '2025-11-11 02:09:08', '2025-12-10 14:48:29', '2025-11-10 14:48:29', '2025-11-11 02:09:08'),
(71, 'App\\Models\\User', 1, 'login', 'ab4aa59456f66770cd1b1da322aa555448acd9694bfe18d62abe1ea96c808000', '[\"*\"]', '2025-11-11 03:30:23', '2025-12-11 03:29:04', '2025-11-11 03:29:04', '2025-11-11 03:30:23'),
(72, 'App\\Models\\User', 1, 'login', '91b77cc87e941248fc51df37a87bc7d19e6d692bbce478aca31022af829c7687', '[\"*\"]', '2025-11-11 05:06:09', '2025-12-11 05:06:01', '2025-11-11 05:06:01', '2025-11-11 05:06:09'),
(73, 'App\\Models\\User', 1, 'login', '167c6c4c9a9c4bc79293e4cd2c0b4703588ecc923be6a20a9af67da2bd683e46', '[\"*\"]', '2025-11-11 05:14:36', '2025-12-11 05:09:44', '2025-11-11 05:09:44', '2025-11-11 05:14:36'),
(74, 'App\\Models\\User', 1, 'login', '43f68c2960293535b504391188666f81beb6b702fde5044bdc78d70acd50be46', '[\"*\"]', NULL, '2025-11-11 08:57:42', '2025-11-11 06:57:42', '2025-11-11 06:57:42'),
(75, 'App\\Models\\User', 1, 'login', '69455f48030771c78db4e85f424c247a1f17d9259145b069641b0049ce4d481d', '[\"*\"]', NULL, '2025-11-11 08:58:54', '2025-11-11 06:58:54', '2025-11-11 06:58:54'),
(76, 'App\\Models\\User', 1, 'login', '466fa20e35868a3537bd6d2ac9a2fa7d88e98f4a6b1912f3d3394f09b93f33a4', '[\"*\"]', '2025-11-11 07:28:37', '2025-11-11 09:27:16', '2025-11-11 07:27:16', '2025-11-11 07:28:37'),
(77, 'App\\Models\\User', 1, 'login', '1fa2f90dc6bfe6795e0b7c9342890e0f78df4cafd7160ecdd550d1c69f313f0c', '[\"*\"]', NULL, '2025-11-11 10:52:36', '2025-11-11 08:52:36', '2025-11-11 08:52:36'),
(78, 'App\\Models\\User', 1, 'login', '19a286e88bb9d724bfbb1f7dae174c8ba6256e9bb00b212f742907a04defdff5', '[\"*\"]', '2025-11-11 10:06:32', '2025-11-11 11:56:33', '2025-11-11 09:56:33', '2025-11-11 10:06:32'),
(79, 'App\\Models\\User', 1, 'login', 'f18c764cba589c66b5d845e0f947a46fda17a65033e4d55d5ea3c121fdc71991', '[\"*\"]', NULL, '2025-11-11 12:40:57', '2025-11-11 10:40:57', '2025-11-11 10:40:57'),
(80, 'App\\Models\\User', 1, 'login', '91f5fb95a7a686dda41cb4bbc85f251742e9046cfeb6d4d960b4bee278212b0a', '[\"*\"]', NULL, '2025-11-11 12:43:44', '2025-11-11 10:43:44', '2025-11-11 10:43:44'),
(81, 'App\\Models\\User', 1, 'login', 'c6e807d0da74b85912a8d4494c47d9aaf1c40f5596158f9feba17c4103fef7e2', '[\"*\"]', '2025-11-11 10:50:09', '2025-11-11 12:45:42', '2025-11-11 10:45:42', '2025-11-11 10:50:09'),
(82, 'App\\Models\\User', 1, 'login', '6f697ff66a2cffc28dcb905b6dd123791d1005b9952eae7a77a16f2b030e175d', '[\"*\"]', '2025-11-11 11:02:36', '2025-11-11 13:00:43', '2025-11-11 11:00:43', '2025-11-11 11:02:36');

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
('JeuAK6xJvuCfIbM3cZ866LOtHjznqgBpA14KkLFn', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNWZNNXdjWEdlR3NwSDNXdml6S0dhYThreGhQRGU4YmVPSXFhM3NabCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762713288),
('rO94EAdPjMlCKEEItmrjx8IlmWaQK4ZvaKZXphgw', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNFM0a281Tk53UlFhNEhQejFlaTB0eGlhTUxqYkdUWXNGMnVma2FTbSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9fQ==', 1762675030),
('Ww7VW9aJ9nxGxrn0OeRLPw6UZ7jeNtPlOxbKuyi3', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoicTFKbHRkenhPQzZWVmdnT3Q1MDNiNEpkY2VGMzNtREJOYUZuejJneSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9ob21lIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6NDoiYXV0aCI7YToxOntzOjIxOiJwYXNzd29yZF9jb25maXJtZWRfYXQiO2k6MTc2MjY4NzM3MTt9fQ==', 1762687387),
('wqMhG9xOCo75ECF1apBQQ7MLmAAmaD9DOg0yqMON', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVXVoMG5TTUt6V1liNklZRGxReHJXY1RDWk5EOGRTRVZHQU1OZ3AwOSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9fQ==', 1762629195),
('eETeKK9FuI5RQrmQxoYZATT7DlGL5xJplbf8z53g', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYUNEOVNCQzhhOGhwZkcyTk43ODJZVEp6MGgwZ3RLTVB5R25TRU1xUyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762869343);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'n8n', 'bediktest@gmail.com', NULL, '$2y$12$taEXAmjy.78Qw5UoMrkGAeUMhslizqaqpKj2ppc34rcjyjvDNr2Oe', NULL, '2025-11-08 14:37:27', '2025-11-08 14:37:27');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
