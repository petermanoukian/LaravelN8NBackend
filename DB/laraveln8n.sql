-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 10, 2025 at 02:28 PM
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
-- Table structure for table `baser_suggestions`
--

DROP TABLE IF EXISTS `baser_suggestions`;
CREATE TABLE IF NOT EXISTS `baser_suggestions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sheetid` int(10) UNSIGNED DEFAULT NULL,
  `baser_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `des` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `baser_suggestions_baser_id_foreign` (`baser_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `baser_suggestions`
--

INSERT INTO `baser_suggestions` (`id`, `sheetid`, `baser_id`, `name`, `des`, `published`, `created_at`, `updated_at`) VALUES
(1, 1, 15, 'Suggection1', 'Details 1', 'No', '2025-12-10 09:31:11', '2025-12-10 09:31:11'),
(2, 3, 9, 'Server Log Snippet sugegstion 22', 'Details 3', 'No', '2025-12-10 09:31:11', '2025-12-10 09:31:11'),
(3, 4, 3, 'Services sugg1', 'details 5', 'No', '2025-12-10 09:31:11', '2025-12-10 09:31:11'),
(4, 6, 9, 'Brand New', 'So many sugegstions', 'No', '2025-12-10 09:31:11', '2025-12-10 09:31:11'),
(5, 7, 9, 'new 2', 'Example Server Log Snippet: Database Connection Failure', 'No', '2025-12-10 09:31:11', '2025-12-10 09:31:11'),
(6, 8, 9, 'closer', 'hghghghgg', 'No', '2025-12-10 09:31:11', '2025-12-10 09:31:11'),
(7, 10, 6, 'trytr', 'yytt', 'No', '2025-12-10 09:31:12', '2025-12-10 09:31:12'),
(8, 11, 7, '12', '24', 'No', '2025-12-10 09:31:12', '2025-12-10 09:31:12'),
(9, 14, 7, 'title1 version 1', 'suggestion 111', 'No', '2025-12-10 09:31:14', '2025-12-10 09:57:06'),
(10, 15, 7, 'lorem impusserr version 2', 'loremme ipmsumeerrr', 'No', '2025-12-10 09:31:14', '2025-12-10 09:57:06'),
(11, 16, 7, 'place thect hereee version 3', 'tetx detailsss', 'No', '2025-12-10 09:31:14', '2025-12-10 09:57:06'),
(12, 17, 7, 'title 4 version 4', 'detials 4', 'No', '2025-12-10 09:31:14', '2025-12-10 09:57:06'),
(13, 18, 7, 'a menaingful title', 'menaingfuld etials', 'No', '2025-12-10 09:31:14', '2025-12-10 09:57:06'),
(14, 19, 7, 'second emaniningful title', 'lorem impuse 0000', 'No', '2025-12-10 09:31:14', '2025-12-10 09:57:06'),
(15, 20, 7, 'soemtjhgn emaningful', 'lorem ipsum 1', 'No', '2025-12-10 09:31:15', '2025-12-10 09:57:06'),
(16, 21, 7, 'soemthgn that has a emaning', 'lorem ipsum 2', 'No', '2025-12-10 09:31:15', '2025-12-10 09:57:06'),
(17, 22, 15, 'strings words and text insetd of number', 'lorem impusm 3', 'No', '2025-12-10 09:31:15', '2025-12-10 09:57:06'),
(18, 25, 4, 'the oen with baseid', 'the oen wth baeid detailss', 'No', '2025-12-10 09:31:15', '2025-12-10 09:57:06'),
(19, 26, 7, 'New Tow', 'new tewod etuialssss', 'No', '2025-12-10 09:31:15', '2025-12-10 09:57:06'),
(20, 23, 9, 'text 8nstead of number', 'these are my suggestions regardingint', 'No', '2025-12-10 09:31:15', '2025-12-10 09:57:06'),
(21, 24, 7, 'NEW ONE version 5', 'NEW ONE details', 'No', '2025-12-10 09:31:15', '2025-12-10 09:57:06'),
(22, 28, 6, 'Performance Snapshot sugg', 'suggerettold', 'No', '2025-12-10 09:31:15', '2025-12-10 09:57:06'),
(23, 29, 6, 'gfgf version 666666', 'gfgffggd', 'No', '2025-12-10 09:31:15', '2025-12-10 09:57:06'),
(24, 30, 6, 'fgf version 77777', 'gfggggf', 'No', '2025-12-10 09:31:15', '2025-12-10 09:57:06'),
(25, 31, 6, 'NEW threee version 1', 'NRw threeeeeee detials', 'No', '2025-12-10 09:31:15', '2025-12-10 09:57:06'),
(26, 32, 5, 'new4 new 4 update version 1', 'new4 detial update 1', 'No', '2025-12-10 09:31:15', '2025-12-10 09:57:06'),
(27, 34, 5, 'new6 new 6 update version 3', 'new6', 'No', '2025-12-10 09:31:15', '2025-12-10 09:57:06'),
(28, 35, 5, 'new7 new 7 update version 4', 'new7', 'No', '2025-12-10 09:31:15', '2025-12-10 09:57:07'),
(29, 36, 4, 'new8 new 8 update', 'new8', 'No', '2025-12-10 09:31:15', '2025-12-10 09:57:07'),
(30, 37, 3, 'Sheet 37 upd 1', 'new 9 details det upd 1', 'No', '2025-12-10 09:31:15', '2025-12-10 09:57:07'),
(31, 38, 3, 'Sheet 38 upd 1', 'new 10d etailsss det upd 1', 'No', '2025-12-10 09:31:15', '2025-12-10 09:57:07'),
(32, 39, 7, 'new 11 upd1', 'new 11 detials update the detyaisl of new 11', 'No', '2025-12-10 09:31:15', '2025-12-10 09:57:07'),
(33, 40, 7, 'new12 upd2', '12 deetails update the12th details', 'No', '2025-12-10 09:31:15', '2025-12-10 09:57:07'),
(34, 41, 7, 'new 13 upd 3', '13th detaillss updatng the detailsss', 'No', '2025-12-10 09:31:15', '2025-12-10 09:57:07'),
(35, 43, 7, 'new 15 updating one more', 'new 15 details upd222222 upddaae number 15 updateing', 'No', '2025-12-10 09:31:16', '2025-12-10 09:57:07'),
(36, 44, 7, 'new 16 Frank 5', 'new 16 details Frank 5', 'No', '2025-12-10 09:31:16', '2025-12-10 09:57:07'),
(37, 45, 7, 'new 17 Frank 4', 'new 17 details Frank 4', 'No', '2025-12-10 09:31:16', '2025-12-10 09:57:07'),
(38, 46, 7, 'new 18 Frank 3', 'new 18 detials Frank 3', 'No', '2025-12-10 09:31:16', '2025-12-10 09:57:07'),
(39, 47, 3, 'new 19 Frank 2', 'new 19 detailssss Frank 2', 'No', '2025-12-10 09:31:16', '2025-12-10 09:57:07'),
(40, 48, 3, 'new 20 Frank 1', 'new 20 detials Frank 1', 'No', '2025-12-10 09:31:16', '2025-12-10 09:57:07'),
(41, 49, 3, 'frank 22222', 'newwrtyyuu', 'No', '2025-12-10 09:37:03', '2025-12-10 09:57:07'),
(42, 50, 3, 'grfrank17 lorem ipsum', 'jhjjhhhhh', 'No', '2025-12-10 09:37:34', '2025-12-10 09:57:07'),
(43, 55, 15, 'Frank 19 update', 'Lorem ipsum 19', 'No', '2025-12-10 09:45:42', '2025-12-10 09:57:07'),
(44, 56, 15, 'Frank 20 tttt Finance Entry', 'Lorem Ipsum 20 update23444', 'No', '2025-12-10 09:45:42', '2025-12-10 09:57:07'),
(45, 57, 15, 'Frank 21 ghr5667', 'Loprem Ipsum 21 update', 'No', '2025-12-10 09:46:34', '2025-12-10 09:57:08'),
(46, 51, 4, 'November 22 oinly imaageeee', 'Loem pmus45677', 'No', '2025-12-10 09:49:03', '2025-12-10 09:57:07'),
(47, 52, 2, 'lorem ipsum55333', 'lorem ipluss 51234', 'No', '2025-12-10 09:49:08', '2025-12-10 09:57:07'),
(48, 53, 4, 'November 22 oinly imaageee lorem ipsum3', 'lorem 1psum543', 'No', '2025-12-10 09:49:08', '2025-12-10 09:57:07'),
(49, 54, 15, 'Frnak 18 base222', 'Lorem ipsum frank 18 base222', 'No', '2025-12-10 09:49:08', '2025-12-10 09:57:07'),
(50, 59, 9, 'frank 23 Timeline Tracker', 'frank 23 lorem ppsum', 'No', '2025-12-10 09:50:02', '2025-12-10 09:57:08'),
(51, 58, 9, 'frank 22 yyupfdtae 2333', 'Frank 22 German', 'No', '2025-12-10 09:50:03', '2025-12-10 09:57:08'),
(52, 60, 9, 'frank24 German', 'frank24', 'No', '2025-12-10 09:50:07', '2025-12-10 09:57:08'),
(53, 61, 9, 'framk25 German', 'frank25', 'No', '2025-12-10 09:50:07', '2025-12-10 09:57:08'),
(54, 62, 15, 'frank26 German', 'frank 26 detailsss German', 'No', '2025-12-10 09:50:34', '2025-12-10 09:57:08'),
(55, 63, 9, 'frank 27 German 1', 'frank 27 detailssss', 'No', '2025-12-10 09:51:02', '2025-12-10 09:57:08'),
(56, 64, 9, 'base 1 Server Log Snippet', 'base 1', 'No', '2025-12-10 09:53:02', '2025-12-10 09:57:08'),
(57, 65, 9, 'base 2 Server Log Snippet', 'base 2', 'No', '2025-12-10 09:53:09', '2025-12-10 09:57:08'),
(58, 66, 15, 'Timeline Tracker 1 Server Log Snippet', 'Timeline Tracker 2222', 'No', '2025-12-10 09:53:34', '2025-12-10 09:57:08');

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
('laravel-cache-356a192b7913b04c54574d18c28d46e6395428ab:timer', 'i:1765375296;', 1765375296),
('laravel-cache-356a192b7913b04c54574d18c28d46e6395428ab', 'i:2;', 1765375296);

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
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8;

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
(252, 'MArket756', 'Marketing', NULL, NULL, 'uploads/files/cat/MArket756_1764776042_6930586ab18c4.docx', '2025-12-03 11:34:02', '2025-12-03 11:34:02'),
(253, 'dec777', 'Marketing', 'uploads/img/cat/dec777-1765134300_6935cfdcb9e64.jpg', 'uploads/img/cat/thumb/dec777-1765134300_6935cfdcb9e64.jpg', NULL, '2025-12-07 15:05:00', '2025-12-07 15:05:00'),
(254, 'ASSSS', 'Sales', 'uploads/img/cat/ASSSS-1765134530_6935d0c25cdb6.jpg', 'uploads/img/cat/thumb/ASSSS-1765134530_6935d0c25cdb6.jpg', NULL, '2025-12-07 15:08:50', '2025-12-07 15:08:50'),
(255, 'imhhhggg', 'Sales', 'uploads/img/cat/imhhhggg-1765134602_6935d10a52f27.jpg', 'uploads/img/cat/thumb/imhhhggg-1765134602_6935d10a52f27.jpg', NULL, '2025-12-07 15:10:02', '2025-12-07 15:10:02'),
(256, 'onluyt textttt', NULL, NULL, NULL, NULL, '2025-12-07 15:13:09', '2025-12-07 15:13:09'),
(257, 'rt5677', NULL, NULL, NULL, NULL, '2025-12-07 15:15:18', '2025-12-07 15:15:18'),
(258, 'Decembr8', NULL, NULL, NULL, NULL, '2025-12-08 04:59:14', '2025-12-08 04:59:14');

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
) ENGINE=MyISAM AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(170, 'App\\Models\\User', 1, 'login', '3b763706c0cfd6b0f93a1f2030be60307a15957b342a44b1ad8c7c0e6e07641a', '[\"*\"]', '2025-12-10 10:00:42', '2026-01-06 13:48:08', '2025-12-07 13:48:08', '2025-12-10 10:00:42'),
(169, 'App\\Models\\User', 1, 'login', '4f03c3ea3135cc7da0a73c5823e7dc661c486fa19f3442ed2f548eb0eebffa0c', '[\"*\"]', '2025-12-07 13:47:23', '2026-01-06 12:50:56', '2025-12-07 12:50:56', '2025-12-07 13:47:23');

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
('2QPZlHTJ9GPxDaXIuteYjfhKdfFkLdSTouwkaiCW', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiSW9oU2NuaWZyTzUwbjhTU3FZUXB0Q3FEb3NpZVRvNENxWVFGRGZCWiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjM3OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYWRtaW4vY2F0cy92aWV3IjtzOjU6InJvdXRlIjtzOjE1OiJjYXRzLmluZGV4YWRtaW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6NDoiYXV0aCI7YToxOntzOjIxOiJwYXNzd29yZF9jb25maXJtZWRfYXQiO2k6MTc2NTE4MjY0Mzt9fQ==', 1765184360),
('OkfWhM48o2omtRI0GTzUyet1y8cOtSPDTE4NvaJf', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiNWU5RHZIVWJRbkNZNWF2ODZSbnBMbUZBOFVicE41bDVXbndmcU5OUiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hZG1pbi9jYXRzL3ZpZXciO3M6NToicm91dGUiO3M6MTU6ImNhdHMuaW5kZXhhZG1pbiI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjM7czo0OiJhdXRoIjthOjE6e3M6MjE6InBhc3N3b3JkX2NvbmZpcm1lZF9hdCI7aToxNzY1MTI2MjI0O319', 1765134923),
('wm24KDIQ5hRVqGb1b3Bcruhl1xHPSTyiBGFPPR5k', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiM0dBWmNGeWZDYlhMOXFuNUgxU3NxUWZCREMyMzM4Ymdab2RoMkNITyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjM5OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYWRtaW4vYmFzZXJzL3ZpZXciO3M6NToicm91dGUiO3M6MTc6ImJhc2Vycy5pbmRleGFkbWluIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjQ6ImF1dGgiO2E6MTp7czoyMToicGFzc3dvcmRfY29uZmlybWVkX2F0IjtpOjE3NjUxOTI1NjE7fX0=', 1765192579),
('tEcwzVPbei7zK4v2dIpU8OChyyd16RHbapZMXSzd', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiMzVOdE9FYzRwRjVTRE5yZlRiUWQ2UFRHZVl5aGloTFJTN3pWTmhpVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hZG1pbi9iYXNlcnMvdmlldyI7czo1OiJyb3V0ZSI7czoxNzoiYmFzZXJzLmluZGV4YWRtaW4iO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6NDoiYXV0aCI7YToxOntzOjIxOiJwYXNzd29yZF9jb25maXJtZWRfYXQiO2k6MTc2NTIxNjEyNzt9fQ==', 1765217156),
('O9ZNccCkYAh0X4WmJyI32DYTjakF22nKcu67qDON', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRDB6NjV1czBUQUNLRVZMRTZQbEZJWUZSMmFldUtqVkRLeG83clRiTSI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozOToiaHR0cDovL2xvY2FsaG9zdDo4MDAwL2FkbWluL2Jhc2Vycy92aWV3IjtzOjU6InJvdXRlIjtzOjE3OiJiYXNlcnMuaW5kZXhhZG1pbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1765283901),
('deK383OSB8ItrU3EdWau3nk7C204SBj9grJ1eHfj', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQzdaeXVPSzVzc0U1UkhzVHRqMlAyUWdkT083ZXh6bUlObTZNRzRGNCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozOToiaHR0cDovL2xvY2FsaG9zdDo4MDAwL2FkbWluL2Jhc2Vycy92aWV3IjtzOjU6InJvdXRlIjtzOjE3OiJiYXNlcnMuaW5kZXhhZG1pbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1765363198);

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
(1, 'n8n', 'bediktest@gmail.com', NULL, '$2y$12$Y6JvORv.hsyfNoxWJgxw9.Du43BPAM3l/GEIP.YKk10D4HwIkpsL.', 'wJGLooEpgnd4OvERNvv9jyyIVR41oRYHNSrskaUgWdvCTYCsU6ASkghY7iC1', '2025-11-08 14:37:27', '2025-11-08 14:37:27'),
(2, 'Admin', 'bedikmanoukian07@gmail.com', NULL, '$2y$12$Y6JvORv.hsyfNoxWJgxw9.Du43BPAM3l/GEIP.YKk10D4HwIkpsL.', '', '2025-11-13 13:21:24', '2025-11-13 13:21:24'),
(3, 'test', 'test@test.com', NULL, '$2y$12$Y6JvORv.hsyfNoxWJgxw9.Du43BPAM3l/GEIP.YKk10D4HwIkpsL.', NULL, '2025-12-01 14:01:09', '2025-12-01 14:01:09');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
