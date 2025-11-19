-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 19, 2025 at 02:49 PM
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
('laravel-cache-356a192b7913b04c54574d18c28d46e6395428ab:timer', 'i:1763561227;', 1763561227),
('laravel-cache-356a192b7913b04c54574d18c28d46e6395428ab', 'i:2;', 1763561227);

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
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(50, 'case 3 - 1', 'Sales', 'uploads/img/cat/case-3---1-1763376928_691aff20da8b2.jpg', 'uploads/img/cat/thumb/case-3---1-1763376928_691aff20da8b2.jpg', 'uploads/files/cat/case-3---1_1763376928_691aff20ef093.pdf', '2025-11-17 06:55:28', '2025-11-17 06:55:28'),
(51, 'case 3 complete 1', 'Marketing', 'uploads/img/cat/case-3-complete-1-1763378012_691b035cea9a8.jpg', 'uploads/img/cat/thumb/case-3-complete-1-1763378012_691b035cea9a8.jpg', 'uploads/files/cat/case-3-complete-1_1763378013_691b035d0befd.pdf', '2025-11-17 07:13:32', '2025-11-17 07:13:33'),
(52, 'throw the 3', 'Sales', 'uploads/img/cat/throw-the-3-1763379912_691b0ac8c9b6e.jpg', 'uploads/img/cat/thumb/throw-the-3-1763379912_691b0ac8c9b6e.jpg', 'uploads/files/cat/throw-the-3_1763379913_691b0ac9f1e15.pdf', '2025-11-17 07:45:12', '2025-11-17 07:45:13'),
(53, 'full fielsd 3', 'Sales', 'uploads/img/cat/full-fielsd-3-1763380888_691b0e9886bce.jpg', 'uploads/img/cat/thumb/full-fielsd-3-1763380888_691b0e9886bce.jpg', 'uploads/files/cat/full-fielsd-3_1763380888_691b0e9894793.pdf', '2025-11-17 08:01:28', '2025-11-17 08:01:28'),
(54, 'img pdf and text num 1', 'Sales', 'uploads/img/cat/img-pdf-and-text-num-1-1763381418_691b10aa17e0a.jpg', 'uploads/img/cat/thumb/img-pdf-and-text-num-1-1763381418_691b10aa17e0a.jpg', 'uploads/files/cat/img-pdf-and-text-num-1_1763381418_691b10aa2f276.pdf', '2025-11-17 08:10:18', '2025-11-17 08:10:18'),
(55, 'picture 566', 'PR', 'uploads/img/cat/picture-566-1763381683_691b11b3a3b51.jpg', 'uploads/img/cat/thumb/picture-566-1763381683_691b11b3a3b51.jpg', NULL, '2025-11-17 08:14:43', '2025-11-17 08:14:44'),
(56, 'the file thjepicture/image and the text', 'Sales', 'uploads/img/cat/the-file-thjepicture/image-and-the-text-1763382120_691b1368ad69e.jpg', 'uploads/img/cat/thumb/the-file-thjepicture/image-and-the-text-1763382120_691b1368ad69e.jpg', 'uploads/files/cat/the-file-thjepicture/image-and-the-text_1763382120_691b1368ce611.pdf', '2025-11-17 08:22:00', '2025-11-17 08:22:00'),
(57, 'All of themeee', 'Sales', 'uploads/img/cat/All-of-themeee-1763382204_691b13bc0bae7.jpg', 'uploads/img/cat/thumb/All-of-themeee-1763382204_691b13bc0bae7.jpg', 'uploads/files/cat/All-of-themeee_1763382205_691b13bd30dc8.pdf', '2025-11-17 08:23:24', '2025-11-17 08:23:25'),
(58, 'photo1111', 'Sales', 'uploads/img/cat/photo1111-1763382236_691b13dc8cacf.jpg', 'uploads/img/cat/thumb/photo1111-1763382236_691b13dc8cacf.jpg', NULL, '2025-11-17 08:23:56', '2025-11-17 08:23:56'),
(59, 'Only PDFFFF', 'Marketing', NULL, NULL, 'uploads/files/cat/Only-PDFFFF_1763382679_691b15978afdc.pdf', '2025-11-17 08:31:19', '2025-11-17 08:31:19'),
(60, 'case 4 - full itemsss', 'PR', 'uploads/img/cat/case-4---full-itemsss-1763383231_691b17bfaa8f8.jpg', 'uploads/img/cat/thumb/case-4---full-itemsss-1763383231_691b17bfaa8f8.jpg', 'uploads/files/cat/case-4---full-itemsss_1763383232_691b17c070cf0.pdf', '2025-11-17 08:40:31', '2025-11-17 08:40:32'),
(61, 'case 4 part 22', NULL, 'uploads/img/cat/case-4-part-22-1763383286_691b17f6e4f61.jpg', 'uploads/img/cat/thumb/case-4-part-22-1763383286_691b17f6e4f61.jpg', 'uploads/files/cat/case-4-part-22_1763383288_691b17f81bc22.pdf', '2025-11-17 08:41:26', '2025-11-17 08:41:28'),
(62, 'image part 1', 'PR', 'uploads/img/cat/image-part-1-1763383315_691b18139bbac.jpg', 'uploads/img/cat/thumb/image-part-1-1763383315_691b18139bbac.jpg', NULL, '2025-11-17 08:41:55', '2025-11-17 08:41:56'),
(63, 'image part 222', NULL, 'uploads/img/cat/image-part-222-1763383345_691b183159551.jpg', 'uploads/img/cat/thumb/image-part-222-1763383345_691b183159551.jpg', NULL, '2025-11-17 08:42:25', '2025-11-17 08:42:25'),
(64, 'pdf 111', 'Sales', NULL, NULL, 'uploads/files/cat/pdf-111_1763383371_691b184b9b7bd.docx', '2025-11-17 08:42:51', '2025-11-17 08:42:51'),
(65, 'pdf part2', NULL, NULL, NULL, 'uploads/files/cat/pdf-part2_1763383398_691b18660fcf4.pdf', '2025-11-17 08:43:18', '2025-11-17 08:43:18'),
(66, 'empty 111', 'Sales', NULL, NULL, NULL, '2025-11-17 08:43:36', '2025-11-17 08:43:36'),
(67, 'emtyy345666', NULL, NULL, NULL, NULL, '2025-11-17 08:43:55', '2025-11-17 08:43:55'),
(68, 'Every single thigssss', NULL, 'uploads/img/cat/Every-single-thigssss-1763386049_691b22c15138d.jpg', 'uploads/img/cat/thumb/Every-single-thigssss-1763386049_691b22c15138d.jpg', 'uploads/files/cat/Every-single-thigssss_1763386050_691b22c28c9b0.pdf', '2025-11-17 09:27:29', '2025-11-17 09:27:30'),
(69, 'the trio 2222', 'Marketing', 'uploads/img/cat/the-trio-2222-1763386334_691b23de36a9b.jpg', 'uploads/img/cat/thumb/the-trio-2222-1763386334_691b23de36a9b.jpg', 'uploads/files/cat/the-trio-2222_1763386334_691b23de4b9ee.docx', '2025-11-17 09:32:14', '2025-11-17 09:32:14'),
(70, 'IMG ONLYYYYY', 'Sales', 'uploads/img/cat/IMG-ONLYYYYY-1763386372_691b24046b0ba.jpg', 'uploads/img/cat/thumb/IMG-ONLYYYYY-1763386372_691b24046b0ba.jpg', NULL, '2025-11-17 09:32:52', '2025-11-17 09:32:53'),
(71, 'only filleee', 'PR', NULL, NULL, 'uploads/files/cat/only-filleee_1763386805_691b25b525f52.pdf', '2025-11-17 09:40:05', '2025-11-17 09:40:05'),
(72, 'text 55555', NULL, NULL, NULL, NULL, '2025-11-17 09:42:38', '2025-11-17 09:42:38'),
(73, 'test 1 all 3 versionnnsss', 'Marketing', 'uploads/img/cat/test-1-all-3-versionnnsss-1763387139_691b270382164.jpg', 'uploads/img/cat/thumb/test-1-all-3-versionnnsss-1763387139_691b270382164.jpg', 'uploads/files/cat/test-1-all-3-versionnnsss_1763387139_691b27039363a.docx', '2025-11-17 09:45:39', '2025-11-17 09:45:39'),
(74, 'photorr567', 'PR', 'uploads/img/cat/photorr567-1763387301_691b27a5cf6cd.jpg', 'uploads/img/cat/thumb/photorr567-1763387301_691b27a5cf6cd.jpg', NULL, '2025-11-17 09:48:21', '2025-11-17 09:48:22'),
(75, 'only the fileeerr', 'Sales', NULL, NULL, 'uploads/files/cat/only-the-fileeerr_1763387544_691b28983864a.jpg', '2025-11-17 09:52:24', '2025-11-17 09:52:24'),
(76, 'testttxtt 456777', NULL, NULL, NULL, NULL, '2025-11-17 09:54:09', '2025-11-17 09:54:09'),
(77, '456', 'Sales', 'uploads/img/cat/456-1763448891_691c183b2b318.jpg', 'uploads/img/cat/thumb/456-1763448891_691c183b2b318.jpg', 'uploads/files/cat/456_1763448891_691c183bec7d8.docx', '2025-11-18 02:54:51', '2025-11-18 02:54:51'),
(78, 'only imageeee', 'Sales', 'uploads/img/cat/only-imageeee-1763449783_691c1bb798a46.jpg', 'uploads/img/cat/thumb/only-imageeee-1763449783_691c1bb798a46.jpg', NULL, '2025-11-18 03:09:43', '2025-11-18 03:09:44'),
(79, 'file578', NULL, NULL, NULL, 'uploads/files/cat/file578_1763453803_691c2b6bc8721.docx', '2025-11-18 04:16:43', '2025-11-18 04:16:43'),
(80, 'nov 1888 every fiels imag text', 'Sales', 'uploads/img/cat/nov-1888-every-fiels-imag-text-1763454707_691c2ef31f108.jpg', 'uploads/img/cat/thumb/nov-1888-every-fiels-imag-text-1763454707_691c2ef31f108.jpg', 'uploads/files/cat/nov-1888-every-fiels-imag-text_1763454707_691c2ef32ba30.pdf', '2025-11-18 04:31:47', '2025-11-18 04:31:47'),
(81, 'nov 18 img only', NULL, 'uploads/img/cat/nov-18-img-only-1763454733_691c2f0dbcd66.jpg', 'uploads/img/cat/thumb/nov-18-img-only-1763454733_691c2f0dbcd66.jpg', NULL, '2025-11-18 04:32:13', '2025-11-18 04:32:13'),
(82, 'nov 18 file only  rrr', 'Sales', NULL, NULL, 'uploads/files/cat/nov-18-file-only--rrr_1763454762_691c2f2a7682d.pdf', '2025-11-18 04:32:42', '2025-11-18 04:32:42'),
(83, 'textxtx - nov 18 txt', 'Sales', NULL, NULL, NULL, '2025-11-18 04:33:06', '2025-11-18 04:33:06'),
(84, 'add txt fileeee', 'Sales', 'uploads/img/cat/add-txt-fileeee-1763455032_691c3038f2a0c.jpg', 'uploads/img/cat/thumb/add-txt-fileeee-1763455032_691c3038f2a0c.jpg', NULL, '2025-11-18 04:37:12', '2025-11-18 04:37:13'),
(85, 'uyyuyiui', 'Sales', 'uploads/img/cat/uyyuyiui-1763455074_691c3062e6876.jpg', 'uploads/img/cat/thumb/uyyuyiui-1763455074_691c3062e6876.jpg', 'uploads/files/cat/uyyuyiui_1763455074_691c3062f0cdf.pdf', '2025-11-18 04:37:54', '2025-11-18 04:37:54'),
(86, 'texxggg', 'Sales', 'uploads/img/cat/texxggg-1763455146_691c30aad2ff6.jpg', 'uploads/img/cat/thumb/texxggg-1763455146_691c30aad2ff6.jpg', NULL, '2025-11-18 04:39:06', '2025-11-18 04:39:07'),
(87, 'uyuytexcellll', 'Sales', 'uploads/img/cat/uyuytexcellll-1763455204_691c30e4c4946.jpg', 'uploads/img/cat/thumb/uyuytexcellll-1763455204_691c30e4c4946.jpg', 'uploads/files/cat/uyuytexcellll_1763455205_691c30e587fa4.xlsx', '2025-11-18 04:40:04', '2025-11-18 04:40:05'),
(88, 'the xcelleeee', 'Marketing', NULL, NULL, 'uploads/files/cat/the-xcelleeee_1763456816_691c373052fc7.xlsx', '2025-11-18 05:06:56', '2025-11-18 05:06:56'),
(89, 'excceeelll456', 'Sales', 'uploads/img/cat/excceeelll456-1763456889_691c3779c1aa3.jpg', 'uploads/img/cat/thumb/excceeelll456-1763456889_691c3779c1aa3.jpg', 'uploads/files/cat/excceeelll456_1763456890_691c377a9c708.xlsx', '2025-11-18 05:08:09', '2025-11-18 05:08:10'),
(90, 'excel form laravel', NULL, NULL, NULL, 'uploads/files/cat/excel-form-laravel_1763457306_691c391aacfae.xlsx', '2025-11-18 05:15:06', '2025-11-18 05:15:06'),
(91, 'excel566', 'Sales', NULL, NULL, 'uploads/files/cat/excel566_1763462119_691c4be7ec15a.xlsx', '2025-11-18 06:35:19', '2025-11-18 06:35:19'),
(92, 'new excellel4444', NULL, NULL, NULL, 'uploads/files/cat/new-excellel4444_1763462140_691c4bfc19690.xlsx', '2025-11-18 06:35:40', '2025-11-18 06:35:40'),
(93, 'number 93', NULL, NULL, NULL, 'uploads/files/cat/number-93_1763462166_691c4c167172b.xlsx', '2025-11-18 06:36:06', '2025-11-18 06:36:06'),
(94, 'exel 94', 'Sales', NULL, NULL, 'uploads/files/cat/exel-94_1763462229_691c4c55dc28e.xlsx', '2025-11-18 06:37:09', '2025-11-18 06:37:09'),
(95, '95', 'Sales', NULL, NULL, NULL, '2025-11-18 06:38:03', '2025-11-18 06:38:03'),
(96, 'ytt', 'Sales', NULL, NULL, NULL, '2025-11-18 06:38:23', '2025-11-18 06:38:23'),
(97, 'ttytry', 'Sales', 'uploads/img/cat/ttytry-1763462316_691c4cac9a7aa.jpg', 'uploads/img/cat/thumb/ttytry-1763462316_691c4cac9a7aa.jpg', NULL, '2025-11-18 06:38:36', '2025-11-18 06:38:36'),
(98, 'accesss', 'Marketing', NULL, NULL, 'uploads/files/cat/accesss_1763463512_691c51586043d.accdb', '2025-11-18 06:58:32', '2025-11-18 06:58:32'),
(99, 'fffdd mpppp', 'Sales', NULL, NULL, 'uploads/files/cat/fffdd-mpppp_1763463625_691c51c93fc63.mp3', '2025-11-18 07:00:25', '2025-11-18 07:00:25'),
(100, 'mp67888', 'Sales', NULL, NULL, 'uploads/files/cat/mp67888_1763463771_691c525b0d432.mp3', '2025-11-18 07:02:51', '2025-11-18 07:02:51'),
(101, '456ttt', 'Sales', NULL, NULL, 'uploads/files/cat/456ttt_1763464482_691c55226c533.mp3', '2025-11-18 07:14:42', '2025-11-18 07:14:42'),
(102, '4ertyuNEW', NULL, NULL, NULL, 'uploads/files/cat/4ertyuNEW_1763464507_691c553bc20fe.mp3', '2025-11-18 07:15:07', '2025-11-18 07:15:07'),
(103, 'AGAIn tttt451', 'Sales', NULL, NULL, 'uploads/files/cat/AGAIn-tttt451_1763465092_691c578461b9f.pdf', '2025-11-18 07:24:52', '2025-11-18 07:24:52'),
(104, '54yu', 'HR', NULL, NULL, 'uploads/files/cat/54yu_1763465173_691c57d5666ea.pdf', '2025-11-18 07:26:13', '2025-11-18 07:26:13'),
(105, '455555', 'Sales', NULL, NULL, 'uploads/files/cat/455555_1763465200_691c57f087d46.pdf', '2025-11-18 07:26:40', '2025-11-18 07:26:40'),
(106, 'excel from n8n', NULL, NULL, NULL, NULL, '2025-11-18 07:48:23', '2025-11-18 07:48:23'),
(107, 'excel from the web laravel', NULL, NULL, NULL, NULL, '2025-11-18 07:49:09', '2025-11-18 07:49:09'),
(108, '678EX-worddd', 'Sales', NULL, NULL, NULL, '2025-11-18 07:49:48', '2025-11-18 07:49:48'),
(109, 'hhj', 'Sales', 'uploads/img/cat/hhj-1763466603_691c5d6bbd71d.jpg', 'uploads/img/cat/thumb/hhj-1763466603_691c5d6bbd71d.jpg', NULL, '2025-11-18 07:50:03', '2025-11-18 07:50:04'),
(110, 'jhjhjh', 'Sales', 'uploads/img/cat/jhjhjh-1763466633_691c5d8902336.jpg', 'uploads/img/cat/thumb/jhjhjh-1763466633_691c5d8902336.jpg', NULL, '2025-11-18 07:50:33', '2025-11-18 07:50:33'),
(111, '12333', 'Marketing', 'uploads/img/cat/12333-1763466781_691c5e1d5d0fa.jpg', 'uploads/img/cat/thumb/12333-1763466781_691c5e1d5d0fa.jpg', 'uploads/files/cat/12333_1763466781_691c5e1d76bcd.pdf', '2025-11-18 07:53:01', '2025-11-18 07:53:01'),
(112, '887887pdf', 'Sales', NULL, NULL, 'uploads/files/cat/887887pdf_1763467013_691c5f05d7fe4.pdf', '2025-11-18 07:56:53', '2025-11-18 07:56:53'),
(113, 'WORD17555', 'Sales', NULL, NULL, 'uploads/files/cat/WORD17555_1763467042_691c5f22e506f.docx', '2025-11-18 07:57:22', '2025-11-18 07:57:22'),
(114, 'excefffkk-excel', NULL, NULL, NULL, 'uploads/files/cat/excefffkk-excel_1763467063_691c5f377cabe.xlsx', '2025-11-18 07:57:43', '2025-11-18 07:57:43'),
(115, 'woprd from n8n', 'Sales', NULL, NULL, 'uploads/files/cat/woprd-from-n8n_1763467145_691c5f894f869.docx', '2025-11-18 07:59:05', '2025-11-18 07:59:05'),
(116, 'excel now from n8n', 'Sales', NULL, NULL, 'uploads/files/cat/excel-now-from-n8n_1763467171_691c5fa3d6855.xlsx', '2025-11-18 07:59:31', '2025-11-18 07:59:31'),
(117, '_testext', NULL, NULL, NULL, 'uploads/files/cat/_testext_1763467379_691c6073a5570.txt', '2025-11-18 08:02:59', '2025-11-18 08:02:59'),
(118, 'text from n8n', NULL, NULL, NULL, NULL, '2025-11-18 08:03:20', '2025-11-18 08:03:20'),
(119, 'tehe text from n8n', NULL, NULL, NULL, 'uploads/files/cat/tehe-text-from-n8n_1763467453_691c60bd17077.txt', '2025-11-18 08:04:13', '2025-11-18 08:04:13'),
(120, 'seconn time n8n sends text', NULL, NULL, NULL, NULL, '2025-11-18 08:04:45', '2025-11-18 08:04:45'),
(121, 'Excel second from n8nnnnn', NULL, NULL, NULL, 'uploads/files/cat/Excel-second-from-n8nnnnn_1763467528_691c6108cffc7.xlsx', '2025-11-18 08:05:28', '2025-11-18 08:05:28'),
(122, 'rthrid 3rd excel from n8n', 'Sales', NULL, NULL, 'uploads/files/cat/rthrid-3rd-excel-from-n8n_1763467558_691c6126cc171.xlsx', '2025-11-18 08:05:58', '2025-11-18 08:05:58'),
(123, 'word sent dfform n8n', 'Sales', NULL, NULL, 'uploads/files/cat/word-sent-dfform-n8n_1763467600_691c6150244db.docx', '2025-11-18 08:06:40', '2025-11-18 08:06:40'),
(124, 'sending the excel and image', 'Sales', 'uploads/img/cat/sending-the-excel-and-image-1763476175_691c82cf19f82.jpg', 'uploads/img/cat/thumb/sending-the-excel-and-image-1763476175_691c82cf19f82.jpg', 'uploads/files/cat/sending-the-excel-and-image_1763476175_691c82cf2d261.xlsx', '2025-11-18 10:29:35', '2025-11-18 10:29:35'),
(125, 'Number 1255555', 'HR', 'uploads/img/cat/Number-1255555-1763486962_691cacf280d31.jpg', 'uploads/img/cat/thumb/Number-1255555-1763486962_691cacf280d31.jpg', 'uploads/files/cat/Number-1255555_1763486962_691cacf2a8007.jpg', '2025-11-18 13:29:22', '2025-11-18 13:29:22'),
(126, 'Number 1266666-777777', 'Sales', 'uploads/img/cat/Number-1266666-777777-1763487198_691caddebff92.jpg', 'uploads/img/cat/thumb/Number-1266666-777777-1763487198_691caddebff92.jpg', 'uploads/files/cat/Number-1266666-777777_1763487199_691caddf7d911.xlsx', '2025-11-18 13:33:18', '2025-11-18 13:33:19'),
(127, 'Number 1277888', 'PR', 'uploads/img/cat/Number-1277888-1763487343_691cae6fe47c8.jpg', 'uploads/img/cat/thumb/Number-1277888-1763487343_691cae6fe47c8.jpg', 'uploads/files/cat/Number-1277888_1763487344_691cae7000ccb.pdf', '2025-11-18 13:35:43', '2025-11-18 13:35:44'),
(128, 'Sales Cat 1', 'Sales', 'uploads/img/cat/Sales-Cat-1-1763488643_691cb38398b98.jpg', 'uploads/img/cat/thumb/Sales-Cat-1-1763488643_691cb38398b98.jpg', 'uploads/files/cat/Sales-Cat-1_1763488644_691cb38460995.docx', '2025-11-18 13:57:23', '2025-11-18 13:57:24'),
(129, 'num999', 'Marketing', 'uploads/img/cat/num999-1763541663_691d829f45aaa.jpg', 'uploads/img/cat/thumb/num999-1763541663_691d829f45aaa.jpg', 'uploads/files/cat/num999_1763541664_691d82a04cca5.pdf', '2025-11-19 04:41:03', '2025-11-19 04:41:04'),
(130, '55555', 'Sales', 'uploads/img/cat/55555-1763541877_691d837500d8d.jpg', 'uploads/img/cat/thumb/55555-1763541877_691d837500d8d.jpg', 'uploads/files/cat/55555_1763541877_691d837596d7a.xlsx', '2025-11-19 04:44:36', '2025-11-19 04:44:37'),
(131, 'number1222', 'Sales', 'uploads/img/cat/number1222-1763543514_691d89da27a94.jpg', 'uploads/img/cat/thumb/number1222-1763543514_691d89da27a94.jpg', 'uploads/files/cat/number1222_1763543514_691d89dab3b14.xlsx', '2025-11-19 05:11:54', '2025-11-19 05:11:54'),
(132, 'yuyu', 'Sales', 'uploads/img/cat/yuyu-1763544632_691d8e3828204.jpg', 'uploads/img/cat/thumb/yuyu-1763544632_691d8e3828204.jpg', 'uploads/files/cat/yuyu_1763544632_691d8e38bca24.xlsx', '2025-11-19 05:30:32', '2025-11-19 05:30:32'),
(133, '67888', 'Marketing', 'uploads/img/cat/67888-1763544799_691d8edff0bb5.jpg', 'uploads/img/cat/thumb/67888-1763544799_691d8edff0bb5.jpg', 'uploads/files/cat/67888_1763544800_691d8ee091044.xlsx', '2025-11-19 05:33:19', '2025-11-19 05:33:20'),
(134, '34TTT', 'Sales', 'uploads/img/cat/34TTT-1763545481_691d9189bd8b5.jpg', 'uploads/img/cat/thumb/34TTT-1763545481_691d9189bd8b5.jpg', 'uploads/files/cat/34TTT_1763545481_691d9189cd239.xlsx', '2025-11-19 05:44:41', '2025-11-19 05:44:41'),
(135, 'ytrytytyty', 'Sales', 'uploads/img/cat/ytrytytyty-1763545676_691d924c40027.jpg', 'uploads/img/cat/thumb/ytrytytyty-1763545676_691d924c40027.jpg', 'uploads/files/cat/ytrytytyty_1763545676_691d924c5813d.xlsx', '2025-11-19 05:47:56', '2025-11-19 05:47:56'),
(136, 'uiui', 'PR', 'uploads/img/cat/uiui-1763545902_691d932e900ff.jpg', 'uploads/img/cat/thumb/uiui-1763545902_691d932e900ff.jpg', 'uploads/files/cat/uiui_1763545903_691d932f4783f.xlsx', '2025-11-19 05:51:42', '2025-11-19 05:51:43'),
(137, '16-16', 'PR', 'uploads/img/cat/16-16-1763550903_691da6b7f133f.jpg', 'uploads/img/cat/thumb/16-16-1763550903_691da6b7f133f.jpg', 'uploads/files/cat/16-16_1763550904_691da6b88695a.xlsx', '2025-11-19 07:15:03', '2025-11-19 07:15:04'),
(138, 'Nov 19 Full 1', 'Marketing', 'uploads/img/cat/Nov-19-Full-1-1763551811_691daa435c516.jpg', 'uploads/img/cat/thumb/Nov-19-Full-1-1763551811_691daa435c516.jpg', 'uploads/files/cat/Nov-19-Full-1_1763551812_691daa4443edf.xlsx', '2025-11-19 07:30:11', '2025-11-19 07:30:12'),
(139, 'Nov 19 Full 222', 'Sales', 'uploads/img/cat/Nov-19-Full-222-1763552127_691dab7f38e62.jpg', 'uploads/img/cat/thumb/Nov-19-Full-222-1763552127_691dab7f38e62.jpg', 'uploads/files/cat/Nov-19-Full-222_1763552127_691dab7fd0be3.xlsx', '2025-11-19 07:35:27', '2025-11-19 07:35:27'),
(140, 'uyuy', 'Marketing', 'uploads/img/cat/uyuy-1763552555_691dad2be8b56.jpg', 'uploads/img/cat/thumb/uyuy-1763552555_691dad2be8b56.jpg', 'uploads/files/cat/uyuy_1763552556_691dad2c923d3.xlsx', '2025-11-19 07:42:35', '2025-11-19 07:42:36'),
(141, 'Nov 19 FULl Number 3333', 'Sales', 'uploads/img/cat/Nov-19-FULl-Number-3333-1763553119_691daf5ff3708.jpg', 'uploads/img/cat/thumb/Nov-19-FULl-Number-3333-1763553119_691daf5ff3708.jpg', 'uploads/files/cat/Nov-19-FULl-Number-3333_1763553120_691daf608b5c0.xlsx', '2025-11-19 07:51:59', '2025-11-19 07:52:00'),
(142, 'number 25 fulll', 'Sales', 'uploads/img/cat/number-25-fulll-1763553662_691db17e5995e.jpg', 'uploads/img/cat/thumb/number-25-fulll-1763553662_691db17e5995e.jpg', 'uploads/files/cat/number-25-fulll_1763553663_691db17f1266a.xlsx', '2025-11-19 08:01:02', '2025-11-19 08:01:03'),
(143, 'rtrtretyyt', 'Sales', 'uploads/img/cat/rtrtretyyt-1763553816_691db218c3087.jpg', 'uploads/img/cat/thumb/rtrtretyyt-1763553816_691db218c3087.jpg', 'uploads/files/cat/rtrtretyyt_1763553817_691db2196f3ae.xlsx', '2025-11-19 08:03:36', '2025-11-19 08:03:37'),
(144, 'Number 27777', 'Sales', 'uploads/img/cat/Number-27777-1763554205_691db39d439a0.jpg', 'uploads/img/cat/thumb/Number-27777-1763554205_691db39d439a0.jpg', 'uploads/files/cat/Number-27777_1763554205_691db39dd559e.xlsx', '2025-11-19 08:10:05', '2025-11-19 08:10:05'),
(145, '456778888', 'Sales', 'uploads/img/cat/456778888-1763554608_691db530cb17c.jpg', 'uploads/img/cat/thumb/456778888-1763554608_691db530cb17c.jpg', 'uploads/files/cat/456778888_1763554609_691db5317a068.xlsx', '2025-11-19 08:16:48', '2025-11-19 08:16:49'),
(146, 'market 111', 'Sales', 'uploads/img/cat/market-111-1763555493_691db8a590c1d.jpg', 'uploads/img/cat/thumb/market-111-1763555493_691db8a590c1d.jpg', 'uploads/files/cat/market-111_1763555493_691db8a5a00bf.xlsx', '2025-11-19 08:31:33', '2025-11-19 08:31:33'),
(147, ',arkettt666', 'Marketing', 'uploads/img/cat/,arkettt666-1763555863_691dba1720ac7.jpg', 'uploads/img/cat/thumb/,arkettt666-1763555863_691dba1720ac7.jpg', 'uploads/files/cat/,arkettt666_1763555863_691dba17bd8bc.xlsx', '2025-11-19 08:37:43', '2025-11-19 08:37:43'),
(148, 'blankk4555', NULL, 'uploads/img/cat/blankk4555-1763555938_691dba626592b.jpg', 'uploads/img/cat/thumb/blankk4555-1763555938_691dba626592b.jpg', 'uploads/files/cat/blankk4555_1763555938_691dba62718cc.xlsx', '2025-11-19 08:38:58', '2025-11-19 08:38:58'),
(149, 'Nov 19 Only IMAGEEE - 111', 'Marketing', 'uploads/img/cat/Nov-19-Only-IMAGEEE---111-1763556345_691dbbf9cea67.jpg', 'uploads/img/cat/thumb/Nov-19-Only-IMAGEEE---111-1763556345_691dbbf9cea67.jpg', NULL, '2025-11-19 08:45:45', '2025-11-19 08:45:46'),
(150, 'Nov 19 Only image 2222', 'PR', 'uploads/img/cat/Nov-19-Only-image-2222-1763557037_691dbeadd9f0d.jpg', 'uploads/img/cat/thumb/Nov-19-Only-image-2222-1763557037_691dbeadd9f0d.jpg', NULL, '2025-11-19 08:57:17', '2025-11-19 08:57:17'),
(151, 'only mage 333', 'HR', 'uploads/img/cat/only-mage-333-1763557119_691dbeff09322.jpg', 'uploads/img/cat/thumb/only-mage-333-1763557119_691dbeff09322.jpg', NULL, '2025-11-19 08:58:39', '2025-11-19 08:58:39'),
(152, 'image blank 4', NULL, 'uploads/img/cat/image-blank-4-1763557185_691dbf41e3b24.jpg', 'uploads/img/cat/thumb/image-blank-4-1763557185_691dbf41e3b24.jpg', NULL, '2025-11-19 08:59:45', '2025-11-19 08:59:46'),
(153, 'Only File Nov 19', 'HR', NULL, NULL, 'uploads/files/cat/Only-File-Nov-19_1763557324_691dbfccd78bd.jpg', '2025-11-19 09:02:04', '2025-11-19 09:02:04'),
(154, 'Npov 19 Only file 111', NULL, NULL, NULL, 'uploads/files/cat/Npov-19-Only-file-111_1763557526_691dc09602eb0.xlsx', '2025-11-19 09:05:26', '2025-11-19 09:05:26'),
(155, 'November 19 Only File 2', 'HR', NULL, NULL, 'uploads/files/cat/November-19-Only-File-2_1763557912_691dc2183e99e.xlsx', '2025-11-19 09:11:52', '2025-11-19 09:11:52'),
(156, 'November 19 Only file 3', 'HR', NULL, NULL, 'uploads/files/cat/November-19-Only-file-3_1763558052_691dc2a4b5707.docx', '2025-11-19 09:14:12', '2025-11-19 09:14:12'),
(157, 'Only text Nov 19', 'PR', NULL, NULL, NULL, '2025-11-19 09:56:30', '2025-11-19 09:56:30'),
(158, 'Obnlt text November 19', 'Marketing', NULL, NULL, NULL, '2025-11-19 10:04:07', '2025-11-19 10:04:07'),
(159, 'Only text to blank Departmen November 19999', NULL, NULL, NULL, NULL, '2025-11-19 10:04:55', '2025-11-19 10:04:55');

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
(158, 'App\\Models\\User', 1, 'login', '4bff66c1f8397279e2458519f3a3bc96fe15d8f55358f634d0fd9f84f774fea3', '[\"*\"]', '2025-11-19 10:06:54', '2025-12-15 07:36:55', '2025-11-15 07:36:55', '2025-11-19 10:06:54');

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
('2mlQxxNEufsjIVxIU0BIDEVWTF5rbUQJdAmZNgYm', 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMURxY0wxRGJJVUxBaktsOTVDSHIxQ1ZKVXlOb0ROTlFlazJueUszQiI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czo0NDoiaHR0cDovL2xvY2FsaG9zdDo4MDAwL2FkbWluL2NhdHMvdmlldz9wYWdlPTEiO3M6NToicm91dGUiO3M6MTU6ImNhdHMuaW5kZXhhZG1pbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1763561101);

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
