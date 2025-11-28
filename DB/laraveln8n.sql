-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 28, 2025 at 06:16 PM
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
-- Table structure for table `basers`
--

DROP TABLE IF EXISTS `basers`;
CREATE TABLE IF NOT EXISTS `basers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `catid` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filer` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `des` text COLLATE utf8mb4_unicode_ci,
  `dess` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `basers_name_unique` (`name`),
  KEY `basers_catid_foreign` (`catid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `basers`
--

INSERT INTO `basers` (`id`, `catid`, `name`, `img`, `img2`, `filer`, `des`, `dess`, `created_at`, `updated_at`) VALUES
(1, 182, 'trtre', 'uploads/img/base/trtre-1764240063_69282abf4e3dc.jpg', 'uploads/img/base/thumb/trtre-1764240063_69282abf4e3dc.jpg', 'uploads/files/base/trtre_1764240063_69282abf73192.pdf', 'trtr', '<p>trtr</p>', '2025-11-27 06:41:03', '2025-11-27 06:41:03'),
(2, 182, 'base222', 'uploads/img/base/base222-1764240114_69282af2846f4.jpg', 'uploads/img/base/thumb/base222-1764240114_69282af2846f4.jpg', 'uploads/files/base/base222_1764240114_69282af2919f7.docx', 'fefreqwr', '<p>gfgfgfg</p>', '2025-11-27 06:41:54', '2025-11-27 06:41:54'),
(3, 190, 'Services', NULL, NULL, NULL, 'Our services include programming, sofwteare, hardware, IT, information tehcnology', '<p><strong>Our services include programming, sofwteare, hardware, IT, information tehcnology</strong></p>', '2025-11-27 07:12:56', '2025-11-28 14:15:50'),
(4, 184, 'MCP Deployment Standard Operating Procedure (SOP)', NULL, NULL, 'uploads/files/base/MCP-Deployment-Standard-Operating-Procedure-(SOP)_1764242498_6928344285381.pdf', 'Essential checklist and procedural steps for deploying services on a Managed Cloud Provider platform.', '<p>This document details the step-by-step process for new service deployment, covering environment setup, security hardening requirements (firewall and IAM), resource tagging conventions, and final validation testing before going live on an MCP platform. Adherence to this SOP ensures compliance and consistency across all deployed assets.</p>', '2025-11-27 07:21:38', '2025-11-27 07:21:38'),
(5, 189, 'AI/ML Project Budget and Timeline Tracker', NULL, NULL, 'uploads/files/base/ML-Project-Budget-and-Timeline-Tracker_1764242911_692835df7ec62.xlsx', 'Template for tracking expenditure and milestones across multiple internal Artificial Intelligence and Machine Learning initiatives.', '<p>Use this standardized Excel spreadsheet to monitor allocated budgets, actual spending, and key milestones (Data Preparation, Model Training, Deployment) for all active AI projects. The file includes formulas for variance analysis and a summary dashboard sheet.</p>', '2025-11-27 07:28:31', '2025-11-27 07:28:31'),
(6, 190, 'Weekly MCP Instance Performance Snapshot', NULL, NULL, 'uploads/files/base/Weekly-MCP-Instance-Performance-Snapshot_1764252976_69285d3073f5f.csv', 'Raw data export of key performance metrics (CPU, Memory, Latency) for production servers over the last seven days.', '<p>This CSV file provides detailed weekly performance metrics, crucial for capacity planning and troubleshooting performance bottlenecks. It includes columns for instance ID, average CPU utilization, peak memory usage, and average network latency, allowing quick import into any data visualization tool for graphing and analysis.</p>', '2025-11-27 10:16:16', '2025-11-27 10:16:16'),
(7, 189, 'Current Configuration for Sentiment Analysis Model v3.1', NULL, NULL, 'uploads/files/base/Current-Configuration-for-Sentiment-Analysis-Model-v3.1_1764255348_6928667482467.json', 'JSON file detailing the hyperparameters, input schema, and training data source path for the production sentiment model.', '<p>This file provides a comprehensive, machine-readable configuration for our v3.1 sentiment analysis model. Key parameters include the model architecture (<code>BERT-Small</code>), the learning rate, epoch count, and the exact S3 bucket path to the final trained weights. Use this file to ensure environment parity before deployment or during re-training cycles.</p>', '2025-11-27 10:55:48', '2025-11-27 10:55:48'),
(9, 190, 'Example Server Log Snippet: Database Connection Failure', NULL, NULL, 'uploads/files/base/Example-Server-Log-Snippet:-Database-Connection-Failure_1764259435_6928766b1ae34.txt', 'A plain text file showing common log entries generated during an MCP database connection timeout and failure event.', '<table data-path-to-node=\"5\">\r\n<tbody>\r\n<tr>\r\n<td><span data-path-to-node=\"5,3,1,0\">This snippet is provided as a reference when debugging unexpected database connection failures on production servers. It highlights the typical sequence of events: connection attempt, timeout warning, and final connection failure error code (<code>SQLSTATE[HY000]</code>). Use this to compare against current server logs to quickly pinpoint similar issues and apply the corresponding fix (usually checking firewall rules or connection limits).</span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p data-path-to-node=\"6\">&nbsp;</p>\r\n<h4>&nbsp;</h4>', '2025-11-27 12:03:55', '2025-11-27 12:03:55'),
(10, 182, 'testt', 'uploads/img/base/testt-1764352862_6929e35e4e347.jpg', 'uploads/img/base/thumb/testt-1764352862_6929e35e4e347.jpg', 'uploads/files/base/testt_1764352862_6929e35ed4c85.pdf', 'test 1', '<p>test444</p>', '2025-11-28 14:01:02', '2025-11-28 14:01:02');

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
('laravel-cache-356a192b7913b04c54574d18c28d46e6395428ab:timer', 'i:1764001753;', 1764001753),
('laravel-cache-356a192b7913b04c54574d18c28d46e6395428ab', 'i:1;', 1764001753);

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
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cats`
--

INSERT INTO `cats` (`id`, `name`, `department`, `img`, `img2`, `filer`, `created_at`, `updated_at`) VALUES
(182, 'Only log no filessss', 'Marketing', NULL, NULL, NULL, '2025-11-20 13:32:35', '2025-11-20 13:32:35'),
(184, 'November 21 full 2', 'PR', 'uploads/img/cat/November-21-full-2-1763723063_6920473740249.jpg', 'uploads/img/cat/thumb/November-21-full-2-1763723063_6920473740249.jpg', 'uploads/files/cat/November-21-full-2_1763723063_692047375d3f8.docx', '2025-11-21 07:04:23', '2025-11-21 07:04:23'),
(189, 'November 22 oinly imaageeee', 'PR', 'uploads/img/cat/November-22-oinly-imaageeee-1763723703_692049b724c2c.jpg', 'uploads/img/cat/thumb/November-22-oinly-imaageeee-1763723703_692049b724c2c.jpg', NULL, '2025-11-21 07:15:03', '2025-11-21 07:15:03'),
(190, 'Managed Cloud & AI Documentation', NULL, NULL, NULL, NULL, '2025-11-21 07:15:52', '2025-11-27 13:15:31'),
(229, 'Technical & Operations (DevOps)', 'Sales', NULL, NULL, NULL, '2025-11-27 13:10:15', '2025-11-27 13:10:15');

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_11_07_185405_create_personal_access_tokens_table', 1),
(5, '2025_11_13_153925_create_cats_table', 2),
(6, '2025_11_26_174250_create_basers_table', 3),
(7, '2025_11_27_171932_add_catid_to_basers_table', 4);

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
(158, 'App\\Models\\User', 1, 'login', '4bff66c1f8397279e2458519f3a3bc96fe15d8f55358f634d0fd9f84f774fea3', '[\"*\"]', '2025-11-24 12:28:13', '2025-12-15 07:36:55', '2025-11-15 07:36:55', '2025-11-24 12:28:13');

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
('5WH6Omo4BhFPCpnPGESElWPkMLrSlDkElcznkvre', 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSnlqRU91UjlaQmxhSFpmYTJCNHZlb1ZqQmxrZ3RyUUJydjA4WGhLMyI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozOToiaHR0cDovL2xvY2FsaG9zdDo4MDAwL2FkbWluL2Jhc2Vycy92aWV3IjtzOjU6InJvdXRlIjtzOjE3OiJiYXNlcnMuaW5kZXhhZG1pbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1764353750);

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
