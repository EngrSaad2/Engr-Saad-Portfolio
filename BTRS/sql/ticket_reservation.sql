-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 17, 2018 at 03:19 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ticket_reservation`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin_info`
--

DROP TABLE IF EXISTS `tbl_admin_info`;
CREATE TABLE IF NOT EXISTS `tbl_admin_info` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `img_url` varchar(40) NOT NULL,
  `activation_status` tinyint(4) NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_admin_info`
--

INSERT INTO `tbl_admin_info` (`admin_id`, `name`, `email`, `phone_number`, `address`, `password`, `img_url`, `activation_status`) VALUES
(28, 'ABD', 'abdullah001rti@gmail.com', '15103029', 'Uttara', '202cb962ac59075b964b07152d234b70', 'agent_img/d4749b2ac8.jpg', 1),
(30, 'Abdullah', 'abd1@gmail.com', '15103029', 'Uttara', '202cb962ac59075b964b07152d234b70', 'agent_img/1a28626aa6.jpg', 1),
(31, 'Alif', 'bijorihossain06@gmail.com', '01610231323', 'Uttara-12, Dhaka', '202cb962ac59075b964b07152d234b70', 'agent_img/462b56a617.jpg', 1),
(32, 'Saad', 'raselhasandurjoy@gmail.com', '0167492524', 'Uttara, Dhaka', '202cb962ac59075b964b07152d234b70', 'agent_img/5bf5e9bdc0.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_agent_info`
--

DROP TABLE IF EXISTS `tbl_agent_info`;
CREATE TABLE IF NOT EXISTS `tbl_agent_info` (
  `agent_id` int(11) NOT NULL AUTO_INCREMENT,
  `counter_id` int(11) NOT NULL,
  `name` char(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(33) NOT NULL,
  `address` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `img_url` varchar(40) NOT NULL,
  `active_status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`agent_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_agent_info`
--

INSERT INTO `tbl_agent_info` (`agent_id`, `counter_id`, `name`, `email`, `phone_number`, `address`, `password`, `img_url`, `active_status`) VALUES
(36, 2, 'Md. Abdullah', 'abd@gmail.com', '01738868597', 'Uttara', '202cb962ac59075b964b07152d234b70', 'agent_img/de0d462188.jpg', 1),
(37, 4, 'Saad', 'raselhasandurjoy@gmail.com', '01738868597', 'Uttara', '202cb962ac59075b964b07152d234b70', 'agent_img/ffc4dc4f76.jpg', 1),
(38, 3, 'Alif', 'bijorihossain06@gmail.com', '01934249849', 'mirpur, Dhaka', '202cb962ac59075b964b07152d234b70', 'agent_img/55a83cf8df.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_booked_seats`
--

DROP TABLE IF EXISTS `tbl_booked_seats`;
CREATE TABLE IF NOT EXISTS `tbl_booked_seats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pnr_no` int(40) NOT NULL,
  `trip_id` int(40) NOT NULL,
  `passenger_id` int(11) NOT NULL,
  `seat_no` varchar(5) NOT NULL,
  `date` date NOT NULL,
  `seat_status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_booked_seats`
--

INSERT INTO `tbl_booked_seats` (`id`, `pnr_no`, `trip_id`, `passenger_id`, `seat_no`, `date`, `seat_status`) VALUES
(120, 4468, 13, 1, 'A3', '2018-04-22', 1),
(121, 4468, 13, 1, 'A4', '2018-04-22', 1),
(122, 4468, 13, 1, 'A1', '2018-04-22', 1),
(123, 4468, 13, 1, 'A2', '2018-04-22', 1),
(124, 8867, 13, 6, 'B3', '2018-04-22', 1),
(125, 8867, 13, 6, 'C3', '2018-04-22', 1),
(130, 7521, 5, 7, 'C4', '2018-04-19', 0),
(131, 7521, 5, 7, 'B4', '2018-04-19', 0),
(132, 7521, 5, 7, 'C3', '2018-04-19', 0),
(133, 7521, 5, 7, 'B3', '2018-04-19', 0),
(134, 9408, 4, 7, 'A1', '2018-04-17', 1),
(135, 9408, 4, 7, 'A2', '2018-04-17', 1),
(136, 6364, 5, 7, 'D2', '2018-04-18', 1),
(137, 6364, 5, 7, 'C2', '2018-04-18', 1),
(138, 6364, 5, 7, 'B2', '2018-04-18', 1),
(139, 6364, 5, 7, 'A2', '2018-04-18', 1),
(143, 3461, 5, 1, 'B4', '2018-04-18', 1),
(144, 3461, 5, 1, 'C3', '2018-04-18', 1),
(145, 3461, 5, 1, 'A3', '2018-04-18', 1),
(146, 3461, 5, 1, 'B3', '2018-04-18', 1),
(147, 5823, 15, 1, 'B2', '2018-04-21', 1),
(148, 5823, 15, 1, 'B1', '2018-04-21', 1),
(149, 3740, 5, 1, 'B1', '2018-04-28', 0),
(150, 3740, 5, 1, 'B2', '2018-04-28', 0),
(151, 3740, 5, 1, 'A2', '2018-04-28', 0),
(152, 3740, 5, 1, 'A1', '2018-04-28', 0),
(153, 5717, 15, 1, 'A2', '2018-04-19', 0),
(154, 8685, 5, 8, 'B2', '2018-04-19', 1),
(155, 8685, 5, 8, 'B1', '2018-04-19', 1),
(156, 8685, 5, 8, 'A2', '2018-04-19', 1),
(157, 8685, 5, 8, 'A1', '2018-04-19', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_booking_info`
--

DROP TABLE IF EXISTS `tbl_booking_info`;
CREATE TABLE IF NOT EXISTS `tbl_booking_info` (
  `booking_id` int(40) NOT NULL AUTO_INCREMENT,
  `pnr_no` int(40) NOT NULL,
  `trip_id` int(40) NOT NULL,
  `counter_id` int(40) NOT NULL,
  `passenger_id` int(11) NOT NULL,
  `reference_no` varchar(60) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `journey_date` date NOT NULL,
  `booking_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `booking_status` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_booking_info`
--

INSERT INTO `tbl_booking_info` (`booking_id`, `pnr_no`, `trip_id`, `counter_id`, `passenger_id`, `reference_no`, `total_amount`, `journey_date`, `booking_date`, `booking_status`) VALUES
(24, 4468, 13, 1, 1, 'b852dtagh', 4960, '2018-04-22', '2018-04-17 13:49:31', 1),
(25, 8867, 13, 5, 6, '642rtes', 2480, '2018-04-22', '2018-04-17 13:48:46', 1),
(28, 7521, 5, 2, 7, '76fdestfgd4', 6000, '2018-04-19', '2018-04-17 13:51:54', 2),
(29, 9408, 4, 3, 7, 'jhyf4323', 1060, '2018-04-17', '2018-04-17 13:52:22', 1),
(30, 6364, 5, 4, 7, 'sae1231', 6000, '2018-04-18', '2018-04-17 13:49:56', 1),
(32, 3461, 5, 1, 1, 'sadqwe42343', 6000, '2018-04-18', '2018-04-17 13:47:33', 1),
(33, 5823, 15, 8, 1, 'srwe123413', 2480, '2018-04-21', '2018-04-17 13:47:00', 1),
(34, 3740, 5, 5, 1, 'sdef32412', 6000, '2018-04-28', '2018-04-17 14:01:53', 0),
(35, 5717, 15, 8, 1, '12312', 1240, '2018-04-19', '2018-04-17 14:02:38', 0),
(36, 8685, 5, 2, 8, 'anbfgd32423', 6000, '2018-04-19', '2018-04-17 15:18:30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bus_info`
--

DROP TABLE IF EXISTS `tbl_bus_info`;
CREATE TABLE IF NOT EXISTS `tbl_bus_info` (
  `bus_id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_no` varchar(11) NOT NULL,
  `bus_type` char(20) NOT NULL,
  `img_bus` varchar(40) NOT NULL,
  `no_of_seats` int(11) NOT NULL DEFAULT '40',
  PRIMARY KEY (`bus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_bus_info`
--

INSERT INTO `tbl_bus_info` (`bus_id`, `bus_no`, `bus_type`, `img_bus`, `no_of_seats`) VALUES
(1, 'Shohag-01', 'A/C Sleeper', 'img/74626c9da5.jpg', 40),
(2, 'Shohag-02', 'Non A/C', 'img/9846.jpg', 40),
(3, 'ENA-01', 'A/C Sleeper', 'img/32537.jpg', 40),
(4, 'ENA-02', 'Non A/C', 'img/27614.jpg', 40),
(5, 'Hanif 110', 'A/C Sleeper', 'img/1b6404fe09.jpg', 40),
(6, 'Ena 009', 'Non A/C', 'img/2bc9752f20.jpg', 40);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cancel_request`
--

DROP TABLE IF EXISTS `tbl_cancel_request`;
CREATE TABLE IF NOT EXISTS `tbl_cancel_request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `passenger_id` int(11) NOT NULL,
  `pnr_no` int(40) NOT NULL,
  `counter_id` int(40) NOT NULL,
  `bkash_no` varchar(15) NOT NULL,
  `refund` int(11) NOT NULL,
  `cancel_status` int(15) NOT NULL DEFAULT '0',
  `cancel_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_cancel_request`
--

INSERT INTO `tbl_cancel_request` (`request_id`, `passenger_id`, `pnr_no`, `counter_id`, `bkash_no`, `refund`, `cancel_status`, `cancel_date`) VALUES
(13, 1, 2583, 7, '01738868597', 2400, 1, '2018-04-17 09:29:05'),
(14, 7, 1046, 5, '01738868597', 900, 1, '2018-04-17 13:59:59'),
(15, 6, 2038, 2, '01738868597', 3600, 1, '2018-04-17 13:59:22'),
(16, 1, 5823, 8, '01738868597', 1984, 2, '2018-04-17 13:59:04'),
(17, 1, 3461, 1, '01738868597', 3600, 0, '2018-04-17 15:12:21');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cities`
--

DROP TABLE IF EXISTS `tbl_cities`;
CREATE TABLE IF NOT EXISTS `tbl_cities` (
  `city_id` int(40) NOT NULL AUTO_INCREMENT,
  `city_name` char(40) NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_cities`
--

INSERT INTO `tbl_cities` (`city_id`, `city_name`) VALUES
(1, 'Dhaka'),
(4, 'Sylhet'),
(5, 'Gazipur'),
(6, 'Barguna'),
(7, 'BARISAL'),
(8, 'Bhola'),
(9, 'Jhalokati'),
(10, 'Patuakhali'),
(11, 'Pirojpur'),
(12, 'Bandarban'),
(13, 'Brahmanbaria'),
(14, 'Chandpur'),
(15, 'Chittagong'),
(16, 'Comilla'),
(17, 'Cox\'s Bazar'),
(18, 'Feni'),
(19, 'Khagrachhari'),
(20, 'Lakshmipur'),
(21, 'Noakhali'),
(22, 'Rangamati'),
(24, 'Faridpur'),
(25, 'Gopalganj'),
(27, 'Kishoreganj'),
(28, 'Madaripur'),
(29, 'Manikganj'),
(30, 'Munshiganj'),
(31, 'Narayanganj'),
(32, 'Narsingdi'),
(33, 'Rajbari'),
(34, 'Shariatpur'),
(35, 'Tangail'),
(36, 'Bagerhat'),
(37, 'Chuadanga'),
(38, 'Jessore'),
(39, 'Jhenaidah'),
(40, 'Khulna'),
(41, 'Kushtia'),
(42, 'Magura'),
(43, 'Meherpur'),
(44, 'Narail'),
(45, 'Satkhira'),
(46, 'Jamalpur'),
(47, 'Mymensingh'),
(48, 'Netrakona'),
(49, 'Sherpur'),
(50, 'Bogra'),
(51, 'Joypurhat'),
(52, 'Naogaon'),
(53, 'Natore'),
(54, 'Chapainawabganj'),
(55, 'Pabna'),
(56, 'Rajshahi'),
(57, 'Sirajgonj'),
(58, 'Dinajpur'),
(59, 'Gaibandha'),
(60, 'Kurigram'),
(61, 'Lalmonirhat'),
(62, 'Nilphamari'),
(63, 'Panchagarh'),
(64, 'Rangpur'),
(65, 'Thakurgaon'),
(66, 'Habiganj'),
(67, 'Moulvibazar'),
(68, 'Sunamganj');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_counter_info`
--

DROP TABLE IF EXISTS `tbl_counter_info`;
CREATE TABLE IF NOT EXISTS `tbl_counter_info` (
  `counter_id` int(40) NOT NULL AUTO_INCREMENT,
  `city_name` char(40) NOT NULL,
  `counter_name` char(50) NOT NULL,
  `contact_no` varchar(15) NOT NULL,
  `location_counter` text NOT NULL,
  PRIMARY KEY (`counter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_counter_info`
--

INSERT INTO `tbl_counter_info` (`counter_id`, `city_name`, `counter_name`, `contact_no`, `location_counter`) VALUES
(1, 'Dhaka', 'Mohakhali Bus Stand', '01754598965 ', 'Mohakhali, Dhaka'),
(2, 'Dhaka', 'Abdullahpur', '01754598965', 'Abdullahpur, Uttara, Dhaka'),
(3, 'Dhaka', 'Kuril Bus Point', '01754598965 ', 'Kuril Bishw Road, Dhaka'),
(4, 'Dhaka', 'Middle Badda Bus Poin', '01745485478', 'Middle Badda, Dhaka'),
(5, 'Dhaka', 'Kuril Bus Point', '01645874557', 'Kuril Bishw Road, Dhaka'),
(7, 'Dhaka', 'Sohagh, Abdullahpur', '03489498412', 'Uttara, Sector 11, Dhaka'),
(8, 'Satkhira', 'Satkhira Sadar', '016724213', 'Satkhira, Palashpol, Stakhira');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_passenger_info`
--

DROP TABLE IF EXISTS `tbl_passenger_info`;
CREATE TABLE IF NOT EXISTS `tbl_passenger_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_passenger_info`
--

INSERT INTO `tbl_passenger_info` (`id`, `name`, `address`, `email`, `mobile`, `password`) VALUES
(1, 'Abdullah', 'Uttara', 'abdullah001rti@gmail.com', '01738868597', '202cb962ac59075b964b07152d234b70'),
(4, 'Abdullah', 'Uttara', 'abd@gmail.com', '01738868597', '41a60377ba920919939d83326ebee5a1'),
(6, 'ALif', 'uttara', 'bijorihossain06@gmail.com', '01610656565', '202cb962ac59075b964b07152d234b70'),
(7, 'Saad', 'uttar', 'raselhasandurjoy@gmail.com', '0173532479', '202cb962ac59075b964b07152d234b70'),
(8, 'Haris', 'Bamnartek', 'haris13.ag@gmail.com', '01740123513', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reserved_seat`
--

DROP TABLE IF EXISTS `tbl_reserved_seat`;
CREATE TABLE IF NOT EXISTS `tbl_reserved_seat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trip_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `bus_id` int(11) NOT NULL,
  `booked_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date` date NOT NULL,
  `seat_no` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1429 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_trip_info`
--

DROP TABLE IF EXISTS `tbl_trip_info`;
CREATE TABLE IF NOT EXISTS `tbl_trip_info` (
  `trip_id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_id` int(11) NOT NULL,
  `from_city` char(40) NOT NULL,
  `to_city` char(40) NOT NULL,
  `fare` varchar(40) NOT NULL,
  `departure_time` varchar(12) NOT NULL,
  `arrival_time` varchar(12) NOT NULL,
  PRIMARY KEY (`trip_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_trip_info`
--

INSERT INTO `tbl_trip_info` (`trip_id`, `bus_id`, `from_city`, `to_city`, `fare`, `departure_time`, `arrival_time`) VALUES
(2, 2, 'Dhaka', 'Chittagong', '650', '14:46', '04:51'),
(3, 3, 'Dhaka', 'Chittagong', '1400', '17:46', '05:46'),
(4, 4, 'Dhaka', 'Chittagong', '530', '16:56', '06:54'),
(5, 1, 'Dhaka', 'Chittagong', '1500', '07:30', '18:00'),
(8, 4, 'Dhaka', 'Chittagong', '500', '10:40', '21:30'),
(12, 2, 'Bogra', 'Feni', '450', '03:02', '23:00'),
(13, 5, 'Dhaka', 'Satkhira', '1240', '07:58', '17:59'),
(14, 6, 'Dhaka', 'Satkhira', '560', '12:30', '04:10'),
(15, 3, 'Satkhira', 'Dhaka', '1240', '20:30', '05:10'),
(16, 5, 'Satkhira', 'Dhaka', '1240', '20:30', '04:30');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
