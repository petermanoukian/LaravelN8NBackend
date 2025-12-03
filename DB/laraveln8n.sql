-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 03, 2025 at 06:52 PM
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
  `name` varchar(191) NOT NULL,
  `img` varchar(191) DEFAULT NULL,
  `img2` varchar(191) DEFAULT NULL,
  `filer` varchar(191) DEFAULT NULL,
  `des` text,
  `dess` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `basers_name_unique` (`name`),
  KEY `basers_catid_foreign` (`catid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

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
(10, 182, 'testt', 'uploads/img/base/testt-1764352862_6929e35e4e347.jpg', 'uploads/img/base/thumb/testt-1764352862_6929e35e4e347.jpg', 'uploads/files/base/testt_1764352862_6929e35ed4c85.pdf', 'test 1', '<p>test444</p>', '2025-11-28 14:01:02', '2025-11-28 14:01:02'),
(11, 230, 'Knowledge Entry Updated', 'uploads/img/base/entry_updated.png', 'uploads/img/base/thumb/entry_updated.png', '[{\"path\":\"uploads/files/base/entry_updated.pdf\",\"type\":\"pdf\"}]', 'Updated description', 'Updated longer description', '2025-11-30 10:50:51', '2025-11-30 12:06:16'),
(15, 231, 'Finance Entry', 'uploads/img/base/finance.png', 'uploads/img/base/thumb/finance.png', '[{\"path\":\"uploads/files/base/finance.pdf\",\"type\":\"pdf\"}]', 'This entry covers finance operations.', 'Includes budgeting and forecasting.', '2025-12-01 12:37:03', '2025-12-01 12:37:03');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(191) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-356a192b7913b04c54574d18c28d46e6395428ab:timer', 'i:1764784177;', 1764784177),
('laravel-cache-356a192b7913b04c54574d18c28d46e6395428ab', 'i:1;', 1764784177),
('laravel-cache-424f74a6a7ed4d4ed4761507ebcd209a6ef0937b:timer', 'i:1764615703;', 1764615703),
('laravel-cache-424f74a6a7ed4d4ed4761507ebcd209a6ef0937b', 'i:1;', 1764615703);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(191) NOT NULL,
  `owner` varchar(191) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cats`
--

DROP TABLE IF EXISTS `cats`;
CREATE TABLE IF NOT EXISTS `cats` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `department` varchar(255) DEFAULT NULL,
  `img` varchar(191) DEFAULT NULL,
  `img2` varchar(191) DEFAULT NULL,
  `filer` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cats_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cats`
--

INSERT INTO `cats` (`id`, `name`, `department`, `img`, `img2`, `filer`, `created_at`, `updated_at`) VALUES
(182, 'Only log no filessss updated 555', 'Marketing', NULL, NULL, NULL, '2025-11-20 13:32:35', '2025-12-02 09:31:43'),
(184, 'November 21 full 2', 'PR', 'uploads/img/cat/November-21-full-2-1763723063_6920473740249.jpg', 'uploads/img/cat/thumb/November-21-full-2-1763723063_6920473740249.jpg', 'uploads/files/cat/November-21-full-2_1763723063_692047375d3f8.docx', '2025-11-21 07:04:23', '2025-11-21 07:04:23'),
(189, 'November 22 oinly imaageeee', 'PR', 'uploads/img/cat/November-22-oinly-imaageeee-1763723703_692049b724c2c.jpg', 'uploads/img/cat/thumb/November-22-oinly-imaageeee-1763723703_692049b724c2c.jpg', NULL, '2025-11-21 07:15:03', '2025-11-21 07:15:03'),
(190, 'Managed Cloud & AI Documentation', 'Sales', NULL, NULL, NULL, '2025-11-21 07:15:52', '2025-12-01 08:55:03'),
(229, 'Technical & Operations (DevOps)', 'Sales', NULL, NULL, NULL, '2025-11-27 13:10:15', '2025-11-27 13:10:15'),
(230, 'Knowledge Management Updated', 'Marketing', 'uploads/img/cat/Knowledge-Management-Updated-1764679247_692ede4f33992.jfif', 'uploads/img/cat/thumb/Knowledge-Management-Updated-1764679247_692ede4f33992.jfif', 'uploads/files/cat/Knowledge-Management-Updated_1764764958_69302d1e6fef6.pdf', '2025-11-30 10:25:56', '2025-12-03 08:29:18'),
(231, 'Software', 'HR', 'uploads/img/cat/Software-1764679271_692ede678cf25.jpg', 'uploads/img/cat/thumb/Software-1764679271_692ede678cf25.jpg', 'uploads/files/cat/Software_1764764935_69302d07b178f.csv', '2025-11-30 10:49:20', '2025-12-03 08:28:55'),
(233, 'SoftwareNew', 'Sales', 'uploads/img/cat/SoftwareNew-1764679687_692ee007368c1.jfif', 'uploads/img/cat/thumb/SoftwareNew-1764679687_692ee007368c1.jfif', 'uploads/files/cat/SoftwareNew_1764679687_692ee0073e4fe.xlsx', '2025-12-01 10:03:56', '2025-12-02 08:48:07'),
(234, 'SoftwareNew2', 'HR', 'uploads/img/cat/SoftwareNew2-1764679666_692edff28368e.jpg', 'uploads/img/cat/thumb/SoftwareNew2-1764679666_692edff28368e.jpg', 'uploads/files/cat/SoftwareNew2_1764679667_692edff322aab.jpg', '2025-12-01 10:16:01', '2025-12-02 08:47:47'),
(235, 'Software The Traditional Way', 'Marketing', 'uploads/img/cat/Software-The-Traditional-Way-1764679702_692ee016c6aa9.jpg', 'uploads/img/cat/thumb/Software-The-Traditional-Way-1764679702_692ee016c6aa9.jpg', 'uploads/files/cat/Software-The-Traditional-Way_1764679703_692ee017620e9.csv', '2025-12-01 10:19:11', '2025-12-02 08:48:23'),
(236, 'Software By prompt', 'HR', 'uploads/img/cat/Software-By-prompt-1764679647_692edfdfe9223.jpg', 'uploads/img/cat/thumb/Software-By-prompt-1764679647_692edfdfe9223.jpg', 'uploads/files/cat/Software-By-prompt_1764679648_692edfe07988b.pdf', '2025-12-01 10:19:25', '2025-12-02 08:47:28'),
(237, 'Software By the new which is prompt', 'PR', 'uploads/img/cat/Software-By-the-new-which-is-prompt-1764679626_692edfcad9e22.jfif', 'uploads/img/cat/thumb/Software-By-the-new-which-is-prompt-1764679626_692edfcad9e22.jfif', 'uploads/files/cat/Software-By-the-new-which-is-prompt_1764679626_692edfcae05c1.csv', '2025-12-01 10:20:25', '2025-12-02 08:47:06'),
(238, 'Software Traditional', NULL, 'uploads/img/cat/Software-Traditional-1764679605_692edfb531817.jpg', 'uploads/img/cat/thumb/Software-Traditional-1764679605_692edfb531817.jpg', 'uploads/files/cat/Software-Traditional_1764679605_692edfb5b2612.xlsx', '2025-12-01 10:28:29', '2025-12-02 08:46:45'),
(239, 'Software Prompt', 'HR', 'uploads/img/cat/Software-Prompt-1764679587_692edfa328b90.jpg', 'uploads/img/cat/thumb/Software-Prompt-1764679587_692edfa328b90.jpg', 'uploads/files/cat/Software-Prompt_1764679587_692edfa3a9adf.pdf', '2025-12-01 10:29:25', '2025-12-02 08:46:27'),
(240, 'Category Updated', NULL, NULL, NULL, NULL, '2025-12-02 08:26:14', '2025-12-02 09:31:30'),
(241, 'cat2 updated', 'Marketing', NULL, NULL, NULL, '2025-12-02 08:26:30', '2025-12-02 09:31:22'),
(242, 'Cat 3 uodatredddd', 'Sales', NULL, NULL, NULL, '2025-12-02 08:26:49', '2025-12-02 09:31:12'),
(243, 'new category', 'Sales', 'uploads/img/cat/new-category-1764682260_692eea14d8cb7.jpg', 'uploads/img/cat/thumb/new-category-1764682260_692eea14d8cb7.jpg', 'uploads/files/cat/new-category_1764682261_692eea156d07e.docx', '2025-12-02 09:31:00', '2025-12-02 09:31:01'),
(244, 'market555', 'Marketing', NULL, NULL, 'uploads/files/cat/market555_1764775567_6930568f08471.txt', '2025-12-03 11:26:07', '2025-12-03 11:26:07'),
(245, 'mrket456', 'Marketing', NULL, NULL, 'uploads/files/cat/mrket456_1764775610_693056ba334a5.xlsx', '2025-12-03 11:26:50', '2025-12-03 11:26:50'),
(246, 'market7', 'Marketing', NULL, NULL, NULL, '2025-12-03 11:27:10', '2025-12-03 11:27:10'),
(247, 'market8', 'Marketing', NULL, NULL, NULL, '2025-12-03 11:27:46', '2025-12-03 11:27:46'),
(248, 'market888', 'Marketing', NULL, NULL, NULL, '2025-12-03 11:28:10', '2025-12-03 11:28:10'),
(249, 'Markee887tt', 'Marketing', NULL, NULL, 'uploads/files/cat/Markee887tt_1764775870_693057be00336.csv', '2025-12-03 11:31:09', '2025-12-03 11:33:19'),
(250, 'MArket99', 'Marketing', NULL, NULL, 'uploads/files/cat/MArket99_1764775927_693057f78b894.csv', '2025-12-03 11:32:07', '2025-12-03 11:32:07'),
(251, 'market10', 'Marketing', 'uploads/img/cat/market10-1764775974_69305826acbd8.jpg', 'uploads/img/cat/thumb/market10-1764775974_69305826acbd8.jpg', 'uploads/files/cat/market10_1764775975_693058275642b.pdf', '2025-12-03 11:32:54', '2025-12-03 11:32:55'),
(252, 'MArket756', 'Marketing', NULL, NULL, 'uploads/files/cat/MArket756_1764776042_6930586ab18c4.docx', '2025-12-03 11:34:02', '2025-12-03 11:34:02');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

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
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=MyISAM AUTO_INCREMENT=162 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(161, 'App\\Models\\User', 1, 'login', '79cb87c2a789c594accd36e743ccc2536893faddf233f4403f760a6b4ac42bc0', '[\"*\"]', '2025-12-03 13:48:37', '2025-12-31 15:00:43', '2025-12-01 15:00:43', '2025-12-03 13:48:37');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Zh4ycQAypi8fAT2YSV5i9UIxX1Z3Q9ZwsVCLScSK', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSGFvRTdsREtLVWJGN3dQdjJjVTMxaG5IcHBuU2pORld0Z3Jyb1Q4MSI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozNzoiaHR0cDovL2xvY2FsaG9zdDo4MDAwL2FkbWluL2NhdHMvdmlldyI7czo1OiJyb3V0ZSI7czoxNToiY2F0cy5pbmRleGFkbWluIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764776044);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'n8n', 'bediktest@gmail.com', NULL, '$2y$12$Y6JvORv.hsyfNoxWJgxw9.Du43BPAM3l/GEIP.YKk10D4HwIkpsL.', 'puXvrssLuNAwmqyI8fn7is2ToR0cIu5p9l88T1RzUrHYsFw9Q4haibFrhCPN', '2025-11-08 14:37:27', '2025-11-08 14:37:27'),
(2, 'Admin', 'bedikmanoukian07@gmail.com', NULL, '$2y$12$SHLkU.kT9CRoYI4yMCh8DeACUFUkb05SrlMp/6qDBfqvsJpoVtLhK', 'WGkHX7ggFo40INh8xB0KtMHcvOcPMa7pLosx7MPBkIajMHODlCwF2XrCNocW', '2025-11-13 13:21:24', '2025-11-13 13:21:24'),
(3, 'test', 'test@test.com', NULL, '$2y$12$Y6JvORv.hsyfNoxWJgxw9.Du43BPAM3l/GEIP.YKk10D4HwIkpsL.', NULL, '2025-12-01 14:01:09', '2025-12-01 14:01:09');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
