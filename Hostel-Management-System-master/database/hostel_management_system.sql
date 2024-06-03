-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2024 at 01:43 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hostel_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `application`
--

CREATE TABLE `application` (
  `Application_id` int(100) NOT NULL,
  `Student_id` varchar(255) NOT NULL,
  `Hostel_id` varchar(255) NOT NULL,
  `room_No` int(100) NOT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hostel`
--

CREATE TABLE `hostel` (
  `Hostel_id` varchar(255) NOT NULL,
  `Hostel_name` varchar(255) NOT NULL,
  `current_no_of_rooms` varchar(255) DEFAULT NULL,
  `No_of_rooms` varchar(255) DEFAULT NULL,
  `No_of_students` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `hostel`
--

INSERT INTO `hostel` (`Hostel_id`, `Hostel_name`, `current_no_of_rooms`, `No_of_rooms`, `No_of_students`) VALUES
('1', 'Hostel A', '50', '25', '100'),
('10', 'Hostel J', '35', '15', '60'),
('2', 'Hostel B', '40', '20', '90'),
('3', 'Hostel C', '60', '30', '120'),
('4', 'Hostel D', '45', '15', '80'),
('5', 'Hostel E', '55', '25', '110'),
('6', 'Hostel F', '70', '40', '130'),
('7', 'Hostel G', '65', '35', '140'),
('8', 'Hostel H', '30', '10', '70'),
('9', 'Hostel I', '80', '50', '150');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `msg_id` int(10) NOT NULL,
  `sender_id` varchar(255) DEFAULT NULL,
  `receiver_id` varchar(255) DEFAULT NULL,
  `hostel_id` int(10) DEFAULT NULL,
  `subject_h` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `msg_date` varchar(255) DEFAULT NULL,
  `msg_time` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`msg_id`, `sender_id`, `receiver_id`, `hostel_id`, `subject_h`, `message`, `msg_date`, `msg_time`) VALUES
(1, 'B160497CS', '3', 1, 'Ground Floor Request', 'sfdbfbdf', '2018-10-27', '09:14 PM'),
(2, '3', 'B160497CS', 1, 'DVDSG', 'DDSCSDV', '2018-10-27', '09:15PM'),
(3, '3', 'B160497CS', 1, 'wddwd', 'xssss', '2018-10-28', '09-16 PM'),
(4, 'B160498EE', '1', 3, 'ROOM NEAR TOILET', 'I would like to change my room as it is near toilet', '2018-10-27', '10:06 PM'),
(5, '1', 'B160498EE', 3, 'Room Near Toilet', 'cdsdgdfhdfh', '2018-10-27', '10:48 PM');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `Room_id` int(10) NOT NULL,
  `Hostel_id` int(10) NOT NULL,
  `Room_No` int(10) NOT NULL,
  `Allocated` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `Student_id` varchar(255) NOT NULL,
  `Fname` varchar(255) NOT NULL,
  `Lname` varchar(255) NOT NULL,
  `Mob_no` varchar(255) NOT NULL,
  `Dept` varchar(255) NOT NULL,
  `Year_of_study` varchar(255) NOT NULL,
  `Pwd` longtext NOT NULL,
  `Hostel_id` int(10) DEFAULT NULL,
  `Room_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Student_id`, `Fname`, `Lname`, `Mob_no`, `Dept`, `Year_of_study`, `Pwd`, `Hostel_id`, `Room_id`) VALUES
('01203769D', 'Ampaw', 'Justice', '0548790987', 'Computer Science', '2006', '33380dfdb6ba09b28b34ee3e92173207', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`Application_id`),
  ADD KEY `Student_id` (`Student_id`),
  ADD KEY `Hostel_id` (`Hostel_id`);

--
-- Indexes for table `hostel`
--
ALTER TABLE `hostel`
  ADD PRIMARY KEY (`Hostel_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`msg_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`Room_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Student_id`),
  ADD KEY `Hostel_id` (`Hostel_id`),
  ADD KEY `Room_id` (`Room_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `application`
--
ALTER TABLE `application`
  MODIFY `Application_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `msg_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `Room_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `application`
--
ALTER TABLE `application`
  ADD CONSTRAINT `Application_ibfk_1` FOREIGN KEY (`Student_id`) REFERENCES `student` (`Student_id`),
  ADD CONSTRAINT `Application_ibfk_2` FOREIGN KEY (`Hostel_id`) REFERENCES `hostel` (`Hostel_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
