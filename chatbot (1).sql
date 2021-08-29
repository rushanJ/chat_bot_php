-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2020 at 02:57 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chatbot`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `addCommenQuestion` (IN `name` VARCHAR(30))  NO SQL
INSERT INTO `commenquestion`(`id`, `question`) VALUES ('',name)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addItem` (IN `name` VARCHAR(30))  NO SQL
INSERT INTO `item`(`id`, `name`) VALUES ('',name)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addItemSpecs` (IN `itemId` INT, IN `spec` INT, IN `description` TEXT)  INSERT INTO `itemspecs`(`id`, `item`, `spec`, `description`) VALUES ('',itemId,spec,description)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addUnslovedQuestion` (IN `sessionId` VARCHAR(20), IN `question` TEXT)  INSERT INTO `userquestion`(`id`, `session`, `question`) VALUES ('',sessionId,question)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getCommenQuestions` ()  SELECT * FROM `commenquestion`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getItemByName` (IN `name` VARCHAR(30))  SELECT * FROM `item` WHERE `item`.`name` like name$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getItems` ()  SELECT * FROM `item`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getItemSpecs` (IN `itemId` INT)  SELECT`itemspecs`.`id`,`itemspecs`.`description` , `commenQuestion`.`question` AS `spec`FROM `itemspecs`,`commenQuestion` WHERE  `itemspecs`.`spec`=`commenquestion`.`id` AND `itemspecs`.`item`=itemId$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `markCombinationForQuestion` (IN `sessionId` INT, IN `ref` INT)  UPDATE `userquestion` SET `ref` = ref WHERE `userquestion`.`session`=sessionId AND `userquestion`.`ref`=0$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `searchAnswerLevel0` (IN `question` TEXT, IN `itemId` INT)  SELECT `itemspecs`.`description`,`commenquestion`.`id` FROM `itemspecs`,`commenquestion`,`userquestion` WHERE `itemspecs`.`spec`=`commenquestion`.`id` AND
`userquestion`.`ref`=`commenquestion`.`id` AND

( Upper(`commenquestion`.`question`) LIKE UPPER(question) OR   Upper(`userquestion`.`question`) LIKE UPPER(question))
 
 AND `itemspecs`.`item`=itemId$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `searchAnswerLevel1` (IN `question` TEXT, IN `itemId` INT)  NO SQL
SELECT `itemspecs`.`description` FROM `itemspecs`,`userquestion` WHERE`itemspecs`.`spec`=`userquestion`.`id` AND Upper(`userquestion`.`question`) LIKE UPPER(question) AND `itemspecs`.`item`=itemId$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `commenquestion`
--

CREATE TABLE `commenquestion` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `commenquestion`
--

INSERT INTO `commenquestion` (`id`, `question`) VALUES
(1, 'Display'),
(3, 'RAM'),
(4, 'Storage'),
(5, 'Processor'),
(6, 'Front camera'),
(7, 'Back camera'),
(8, 'Charging type'),
(9, 'Network technology'),
(10, 'Finger print'),
(11, 'Facial recognition'),
(12, 'Colour'),
(13, 'OS'),
(14, 'Sound'),
(15, 'Battery capacity'),
(16, 'Price'),
(17, 'Model'),
(18, 'External memory slot'),
(19, 'Dual sim'),
(20, 'Chipset');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `name`) VALUES
(1, 'Iphone 11'),
(2, 'Samsung J 7 2017'),
(3, 'Samsung A30'),
(4, 'Xiaomi K20'),
(5, 'iPhone 11 pro'),
(6, 'Xiaomi Pocophone F1'),
(7, 'iPhone SE 2020'),
(8, 'Samsung Galaxy S20'),
(9, 'Nokia 6.1'),
(10, 'Oppo f1'),
(11, 'Xiaomi Note 8'),
(12, 'Samsung Note 10'),
(14, 'Samsung A20'),
(15, 'Huawei p30 pro'),
(16, 'HTC Desire 626'),
(17, 'Huawei Nova 3i'),
(18, 'Samsung J7 pro'),
(19, 'Xiaomi Alpha'),
(20, 'Nokia 2.2'),
(21, 'Nokia 9');

-- --------------------------------------------------------

--
-- Table structure for table `itemspecs`
--

CREATE TABLE `itemspecs` (
  `id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `spec` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `itemspecs`
--

INSERT INTO `itemspecs` (`id`, `item`, `spec`, `description`) VALUES
(1, 1, 1, 'Type:Liquid Retina IPS LCD capacitive touchscreen, 16M colors <br>Size:6.1 inches, 90.3 cm2 (~79.0% screen-to-body ratio) <br>Resolution:828 x 1792 pixels, 19.5:9 ratio (~326 ppi density)'),
(2, 1, 3, '4GB RAM'),
(3, 1, 4, '64GB  / 128GB/ 256GB '),
(4, 1, 5, 'Hexa-core (2x2.65 GHz Lightning + 4x1.8 GHz Thunder)'),
(5, 1, 6, '12 MP, f/2.2, 23mm (wide) SL 3D, (depth/biometrics sensor)'),
(6, 1, 7, '12 MP, f/1.8, 26mm (wide), 1/2.55\", 1.4Âµm, dual pixel PDAF, OIS 12 MP, f/2.4, 13mm (ultrawide)'),
(7, 1, 8, 'Fast charging 18W, 50% in 30 min (advertised) USB Power Delivery 2.0 Qi wireless charging'),
(8, 1, 9, 'GSM/CDMA/HSPA/EVDO/LTE'),
(9, 1, 10, 'not available'),
(10, 1, 11, 'available'),
(11, 1, 12, 'Black, Green, Yellow, Purple, Red, White'),
(12, 1, 13, 'iOS'),
(13, 1, 14, 'Noise -94.2dB / Crosstalk -80.8dB'),
(14, 1, 15, 'Non-removable Li-Ion 3110 mAh battery (11.91 Wh)'),
(15, 1, 16, '$â€‰669.00'),
(16, 1, 17, 'A2221, A2111, A2223'),
(17, 1, 18, 'not available'),
(18, 1, 19, 'Single SIM (Nano-SIM and/or eSIM) or Dual SIM (Nano-SIM, dual stand-by) - for China'),
(19, 1, 20, 'Apple A13 Bionic (7 nm+)'),
(20, 2, 1, 'Type:Super AMOLED capacitive touchscreen, 16M colors <br>Size:5.5 inches, 83.4 cm2 (~69.6% screen-to-body ratio) <br>Resolution:	720 x 1280 pixels, 16:9 ratio (~267 ppi density)'),
(21, 2, 3, '1.5GB'),
(22, 2, 4, '16GB '),
(23, 2, 5, 'Octa-core (4x1.4 GHz Cortex-A53 & 4x1.0 GHz Cortex-A53) Octa-core 1.5 GHz Cortex-A53'),
(24, 2, 6, '5 MP, f/2.2, 23mm (wide)'),
(25, 2, 7, '13 MP, f/1.9, 28mm (wide), AF'),
(26, 2, 8, 'Normal'),
(27, 2, 9, 'GSM/HSPA/LTE'),
(28, 2, 10, 'available'),
(29, 2, 12, 'White, Black, Gold'),
(30, 2, 13, 'Android 5.1 (Lollipop), upgradable to 7.1.1 (Nougat)'),
(31, 2, 14, 'Noise -96.1dB / Crosstalk -73.2dB'),
(32, 2, 15, 'Removable Li-Ion 3000 mAh battery'),
(33, 2, 16, '200 EUR'),
(34, 2, 17, 'SM-J700F, SM-J700H, SM-J700M, SM-J700T, J7, SM-J700T1, SM-J700K, SM-J700P, SM-j7008'),
(35, 2, 18, 'microSDXC (dedicated slot)'),
(36, 2, 19, 'available'),
(37, 2, 20, 'Qualcomm MSM8939 Snapdragon 615 (28 nm) Exynos 7580 Octa (28 nm)'),
(38, 3, 1, 'Type:Super AMOLED capacitive touchscreen, 16M colors <br>Size:	6.4 inches, 100.5 cm2 (~84.9% screen-to-body ratio) <br>Resolution:1080 x 2340 pixels, 19.5:9 ratio (~403 ppi density)'),
(39, 3, 3, '3GB/4GB '),
(40, 3, 4, '32GB /64GB '),
(41, 3, 5, 'Octa-core (2x1.8 GHz Cortex-A73 & 6x1.6 GHz Cortex-A53)'),
(42, 3, 6, '16 MP, f/2.0, 26mm (wide), 1/3.06\", 1.0Âµm'),
(43, 3, 7, '16 MP, f/1.7, 27mm (wide), PDAF 5 MP, f/2.2, 12mm, (ultrawide)'),
(44, 3, 8, 'Fast charging 15W'),
(45, 3, 9, 'GSM/HSPA/LTE'),
(46, 3, 10, 'available'),
(47, 3, 11, 'available'),
(48, 3, 12, 'Black, Blue, Red, White'),
(49, 3, 13, 'Android 9.0 (Pie), upgradable to Android 10, One UI 2.0'),
(50, 21, 1, 'Type:P-OLED capacitive touchscreen, 16M colors <br>Size:5.99 inches, 92.6 cm2 (~79.7% screen-to-body ratio)<br> Resolution:1440 x 2880 pixels, 18:9 ratio (~538 ppi density)'),
(51, 21, 3, '6GB '),
(52, 21, 4, '128GB'),
(53, 3, 14, 'Noise -93.3dB / Crosstalk -88.9dB'),
(54, 21, 5, 'Octa-core (4x2.8 GHz Kryo 385 Gold & 4x1.7 GHz Kryo 385 Silver)'),
(55, 3, 15, 'Non-removable Li-Po 4000 mAh battery'),
(56, 21, 6, '20 MP, f/2.0, (wide), 1/2.8\", 1.0Âµm'),
(57, 3, 16, '$â€‰235.00'),
(58, 21, 7, '5x 12 MP, f/1.8, 28mm (wide), 1/2.9\", 1.25Âµm (2x RGB & 3x B/W cameras, working simultaneously) TOF 3D, (depth)'),
(59, 3, 17, 'SM-A305F, SM-A305FN, SM-A305G, SM-A305GN, SM-A305YN, SM-A3050, SM-A305N, SM-A305GT'),
(60, 21, 8, 'Fast charging 18W Quick Charge 3.0 USB Power Delivery Fast wireless charging 10W - Qi Fast wireless charging 5W - PMA'),
(61, 3, 18, 'microSDXC (dedicated slot)'),
(62, 21, 9, 'GSM/HSPA/LTE'),
(63, 21, 10, 'available'),
(64, 21, 11, 'available'),
(65, 21, 12, 'Midnight Blue'),
(66, 3, 19, 'available'),
(67, 21, 13, 'Android 9.0 (Pie), upgradable to Android 10, Android One'),
(68, 3, 20, 'Exynos 7904 (14 nm)'),
(69, 21, 14, 'Noise -94.0dB / Crosstalk -93.2dB'),
(70, 21, 15, 'Non-removable Li-Po 3320 mAh battery'),
(71, 21, 16, '$â€‰654.00'),
(72, 4, 9, 'GSM/HSPA/LTE'),
(73, 21, 17, 'TA-1094, A-1087, TA-1082'),
(74, 21, 18, 'not available'),
(75, 21, 19, 'available'),
(76, 21, 20, 'Qualcomm SDM845 Snapdragon 845 (10 nm)'),
(77, 20, 1, 'Type:IPS LCD capacitive touchscreen, 16M colors<br> Size:5.71 inches, 81.4 cm2 (~79.0% screen-to-body ratio)<br> Resolution:720 x 1520 pixels, 19:9 ratio (~295 ppi density)  Always-on display'),
(78, 20, 3, '2GB'),
(79, 20, 4, '16GB/32GB'),
(80, 20, 5, 'Quad-core 2.0 GHz Cortex-A53'),
(81, 20, 6, '5 MP'),
(82, 4, 1, 'Type:Super AMOLED capacitive touchscreen, 16M colors <br>Size	6.39 inches, 100.2 cm2 (~86.1% screen-to-body ratio) <br>Resolution:1080 x 2340 pixels, 19.5:9 ratio (~403 ppi density)'),
(83, 20, 7, '13 MP, f/2.2, 1/3.1\", 1.12Âµm, AF'),
(84, 4, 13, 'Android 9.0 (Pie), upgradable to Android 10, MIUI 11'),
(85, 4, 20, 'Qualcomm SDM730 Snapdragon 730 (8 nm)'),
(86, 20, 8, 'normal'),
(87, 4, 5, 'Octa-core (2x2.2 GHz Kryo 470 Gold & 6x1.8 GHz Kryo 470 Silver)'),
(88, 20, 9, 'GSM/HSPA/LTE'),
(89, 4, 4, '64GB /128GB /256GB '),
(90, 20, 10, 'not available'),
(91, 20, 11, 'available'),
(92, 4, 3, '6GB /8GB '),
(93, 20, 12, 'Steel, Tungsten Black'),
(94, 20, 13, 'Android 9.0 (Pie), upgradable to Android 10, Android One'),
(95, 4, 7, '48 MP, f/1.8, 26mm (wide), 1/2.0\", 0.8Âµm, PDAF 8 MP, f/2.4, 53mm (telephoto), 1/4.0\", 1.12Âµm, PDAF, 2x optical zoom 13 MP, f/2.4, 12mm (ultrawide), 1/3.1\", 1.12Âµm'),
(96, 4, 6, 'Motorized pop-up 20 MP, f/2.2, (wide), 1/3.4\", 0.8Âµm'),
(97, 20, 14, 'available'),
(98, 20, 15, 'Removable Li-Ion 3000 mAh battery'),
(99, 20, 16, '$â€‰99.99'),
(100, 4, 15, 'Non-removable Li-Po 4000 mAh battery'),
(101, 4, 17, 'M1903F10I'),
(102, 20, 17, 'TA-1183, TA-1179, TA-1191, TA-1188'),
(103, 4, 8, 'Fast charging 18W'),
(104, 20, 18, 'microSDXC (uses shared SIM slot)'),
(105, 4, 10, 'available'),
(106, 20, 19, 'available'),
(107, 4, 12, 'Carbon black, Red flame, Glacier blue, Pearl White'),
(108, 20, 20, 'Mediatek MT6761 Helio A22 (12 nm)'),
(109, 4, 16, 'â‚¹â€‰20,790'),
(110, 19, 1, 'Type:Flexible Super AMOLED capacitive touchscreen, 16M colors<br>Size:7.92 inches, 201.8 cm2 (~180.8% screen-to-body ratio)<br> Resolution:2088 x 2250 pixels (~388 ppi density)'),
(111, 4, 16, 'â‚¹â€‰20,790'),
(112, 19, 3, '12GB'),
(113, 19, 4, '512GB'),
(114, 19, 5, 'Octa-core (1x2.96 GHz Kryo 485 & 3x2.42 GHz Kryo 485 & 4x1.8 GHz Kryo 485)'),
(115, 19, 6, 'No - uses main camera'),
(116, 19, 7, '108 MP, f/1.7, (wide), 1/1.33\", 0.8Âµm, PDAF, Laser AF 12 MP, f/2.0, 54mm (telephoto), 1/2.55\", 1.4Âµm, Dual Pixel PDAF, 2x optical zoom 20 MP, f/2.2, 13mm (ultrawide), 1/2.8\", 1.0Âµm'),
(117, 19, 8, 'Fast charging 40W'),
(118, 19, 9, 'GSM/CDMA/HSPA/LTE/5G'),
(119, 19, 10, 'available'),
(120, 19, 11, 'available'),
(121, 19, 12, 'Black'),
(122, 19, 13, 'Android 10, MIUI 11'),
(123, 19, 14, 'available'),
(124, 19, 15, 'Non-removable Li-Po 4050 mAh battery'),
(125, 19, 16, '2500 EUR'),
(126, 19, 17, 'Xiaomi Mi Mix Alpha'),
(127, 19, 18, 'not available'),
(128, 19, 19, 'available'),
(129, 19, 20, 'Qualcomm SM8150 Snapdragon 855+ (7 nm)'),
(130, 5, 1, 'Type:Super Retina XDR OLED capacitive touchscreen, 16M colors<br> Size	5.8 inches, 84.4 cm2 (~82.1% screen-to-body ratio)<br> Resolution:1125 x 2436 pixels, 19.5:9 ratio (~458 ppi density)'),
(131, 5, 13, 'iOS'),
(132, 5, 20, 'Apple A13 Bionic (7 nm+)'),
(133, 18, 1, 'Type:Super AMOLED capacitive touchscreen, 16M colors<br>Size:5.5 inches, 83.4 cm2 (~73.1% screen-to-body ratio)<br>Resolution:1080 x 1920 pixels, 16:9 ratio (~401 ppi density) Always-on display'),
(134, 18, 3, '3GB'),
(135, 5, 5, 'Hexa-core (2x2.65 GHz Lightning + 4x1.8 GHz Thunder)'),
(136, 18, 4, '32GB /64GB'),
(137, 18, 5, 'Octa-core 1.6 GHz Cortex-A53'),
(138, 5, 4, '64GB /256GB /512GB '),
(139, 18, 6, '13 MP, f/1.9, 28mm (wide)'),
(140, 18, 7, '13 MP, f/1.7, 27mm (wide), AF'),
(141, 18, 8, 'normal'),
(142, 18, 9, 'GSM/HSPA/LTE'),
(143, 18, 10, 'available'),
(144, 5, 1, '4GB RAM'),
(145, 18, 11, 'available'),
(146, 5, 6, '12 MP, f/1.8, 26mm (wide), 1/2.55\", 1.4Âµm, dual pixel PDAF, OIS 12 MP, f/2.0, 52mm (telephoto), 1/3.4\", 1.0Âµm, PDAF, OIS, 2x optical zoom 12 MP, f/2.4, 13mm (ultrawide)'),
(147, 18, 12, 'Black, Blue, Gold, Rose Gold'),
(148, 5, 7, '12 MP, f/2.2, 23mm (wide) SL 3D, (depth/biometrics sensor)'),
(149, 18, 13, 'Android 7.0 (Nougat), upgradable to Android 9.0 (Pie), One UI'),
(150, 18, 14, 'available'),
(151, 18, 15, 'Non-removable Li-Ion 3600 mAh battery'),
(152, 18, 16, '200 EUR'),
(153, 18, 17, 'SM-J730G, SM-J730GM'),
(154, 18, 18, 'microSDXC (dedicated slot)'),
(155, 18, 19, 'available'),
(156, 5, 8, 'available'),
(157, 18, 20, 'Exynos 7870 Octa (14 nm)'),
(158, 5, 12, 'Matte Space Gray, Matte Silver, Matte Gold, Matte Midnight Green'),
(159, 5, 17, 'A2215, A2160, A2217'),
(160, 5, 16, '$â€‰999.00'),
(161, 5, 14, 'Noise -94.2dB / Crosstalk -81.0dB'),
(162, 5, 3, '4GB RAM'),
(163, 5, 9, 'GSM/CDMA/HSPA/EVDO/LTE'),
(164, 5, 11, 'available'),
(165, 5, 15, 'Non-removable Li-Ion 3046 mAh battery (11.67 Wh)'),
(166, 5, 18, 'available'),
(167, 6, 1, 'Type	IPS LCD capacitive touchscreen, 16M colors Size	6.18 inches, 96.2 cm2 (~82.2% screen-to-body ratio) Resolution	1080 x 2246 pixels, 18.7:9 ratio (~403 ppi density)'),
(168, 6, 3, '6GB/ 8GB '),
(169, 6, 4, '64GB /128GB /256GB '),
(170, 6, 5, 'Octa-core (4x2.8 GHz Kryo 385 Gold & 4x1.8 GHz Kryo 385 Silver)'),
(171, 6, 8, 'Fast charging 18W'),
(172, 6, 6, '20 MP, f/2.0, (wide), 1/3\", 0.9Âµm'),
(173, 6, 9, 'GSM/HSPA/LTE'),
(174, 6, 10, 'available'),
(175, 6, 11, 'available'),
(176, 6, 12, ''),
(177, 6, 13, 'Android 8.1 (Oreo), upgradable to Android 9.0 (Pie), MIUI 11'),
(178, 6, 14, 'Noise -93.6dB / Crosstalk -93.8dB'),
(179, 6, 15, 'Non-removable Li-Po 4000 mAh battery'),
(180, 6, 16, '$â€‰400.00'),
(181, 6, 17, 'M1805E10A'),
(182, 6, 18, 'microSDXC (uses shared SIM slot)'),
(183, 6, 19, 'available'),
(184, 6, 20, 'Qualcomm SDM845 Snapdragon 845 (10 nm)'),
(185, 7, 1, 'Retina IPS LCD capacitive touchscreen, 16M colors Size	4.7 inches, 60.9 cm2 (~65.4% screen-to-body ratio)'),
(186, 7, 3, '3GB '),
(187, 7, 5, 'Hexa-core (2x2.65 GHz Lightning + 4x1.8 GHz Thunder)'),
(188, 7, 6, '7 MP, f/2.2'),
(189, 7, 7, '12 MP, f/1.8 (wide), PDAF, OIS'),
(190, 7, 9, 'GSM/CDMA/HSPA/EVDO/LTE'),
(191, 7, 10, 'available'),
(192, 7, 11, 'available'),
(193, 7, 12, 'Black, White, Red'),
(194, 7, 13, 'iOS'),
(195, 7, 14, '-24.1 LUFS (Very good)'),
(196, 7, 15, 'Non-removable Li-Ion 1821 mAh battery (6.96 Wh)'),
(197, 7, 16, '$â€‰381.29'),
(198, 7, 17, 'A2275, A2296, A2298'),
(199, 7, 18, 'available'),
(200, 7, 19, 'available'),
(201, 7, 20, 'Apple A13 Bionic (7 nm+)');

-- --------------------------------------------------------

--
-- Table structure for table `userquestion`
--

CREATE TABLE `userquestion` (
  `id` int(11) NOT NULL,
  `session` varchar(20) NOT NULL,
  `question` text NOT NULL,
  `ref` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userquestion`
--

INSERT INTO `userquestion` (`id`, `session`, `question`, `ref`) VALUES
(1, '1q2w3e4r5t', 'Display?', 1),
(2, '1q2w3e4r', 'What are the information of Display?', 1),
(16, '1qw2e33r45t', 'What is the display?', 1),
(17, '1qw2e33r45t', 'What is the display?', 1),
(18, '1qw2e33r45t', 'Ram', 3),
(19, '1qw2e33r45t', 'RAM', 3),
(20, '1qw2e33r45t', 'Storage', 4),
(21, '1qw2e33r45t', 'Storage?', 4),
(22, '', 'Processor', 5),
(23, '', 'Front camera\r\n', 6),
(24, '', 'Back camera', 7),
(25, '', 'Charging type', 8),
(26, '', 'Network technology', 9),
(27, '', 'Finger print\r\n', 10),
(28, '', 'Facial recognition', 11),
(29, '', 'Colour', 12),
(30, '', 'OS', 13),
(31, '', 'Sound', 14),
(32, '', 'Battery capacity', 15),
(33, '', 'Price', 16),
(34, '', 'Model', 17),
(35, '', 'External memory slot', 18),
(36, '', 'Dual sim', 19),
(37, '', 'Chipset', 20),
(38, '1qw2e33r45t', 'What is the OS?', 13),
(39, '1qw2e33r45t', 'OS?', 13),
(40, '1qw2e33r45t', 'What is the display size?', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `commenquestion`
--
ALTER TABLE `commenquestion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `itemspecs`
--
ALTER TABLE `itemspecs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userquestion`
--
ALTER TABLE `userquestion`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `commenquestion`
--
ALTER TABLE `commenquestion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `itemspecs`
--
ALTER TABLE `itemspecs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT for table `userquestion`
--
ALTER TABLE `userquestion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
