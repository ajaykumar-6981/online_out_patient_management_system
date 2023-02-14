-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 14, 2023 at 06:39 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `out_patient_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `email`, `password`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin@123');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int(10) NOT NULL,
  `doctor_id` int(10) NOT NULL,
  `patient_id` int(10) NOT NULL,
  `doctor_schedule_id` int(10) NOT NULL,
  `reason_for_appointment` varchar(100) NOT NULL,
  `appointment_time` time NOT NULL,
  `status` varchar(100) NOT NULL,
  `patient_come_into_hospital` enum('No','Yes') DEFAULT NULL,
  `doctor_comment` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `doctor_id`, `patient_id`, `doctor_schedule_id`, `reason_for_appointment`, `appointment_time`, `status`, `patient_come_into_hospital`, `doctor_comment`) VALUES
(1, 1, 1, 1, 'headache', '00:00:15', 'Booked', 'No', ''),
(3, 1, 0, 1, 'Pain in Stomach', '09:00:00', 'Booked', 'No', ''),
(4, 1, 0, 2, 'Paint in stomach', '09:00:00', 'Booked', 'No', ''),
(5, 1, 0, 1, 'For Delivery', '09:30:00', 'Booked', 'Yes', 'She gave birth to boy baby.'),
(6, 2, 0, 1, 'Fever and cold.', '18:00:00', 'Booked', 'Yes', ''),
(7, 2, 0, 1, 'Pain in Stomach.', '15:30:00', 'Booked', 'Yes', 'Acidity Problem');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctor_id` int(10) NOT NULL,
  `doctor_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `dob` varchar(100) NOT NULL,
  `qualification` varchar(100) NOT NULL,
  `year_of_experience` int(10) NOT NULL,
  `specialty` varchar(100) NOT NULL,
  `availability_at_hospital` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctor_id`, `doctor_name`, `email`, `password`, `dob`, `qualification`, `year_of_experience`, `specialty`, `availability_at_hospital`) VALUES
(1, 'akash', 'akash@gmail.com', 'akash@123', '1992-04-1', 'MBBS', 2, 'dyntist', 'yes'),
(2, 'amit', 'amit@gmail.com', 'amit@123', '1992-05-3', 'MBBS', 1, 'artho', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_schedule_table`
--

CREATE TABLE `doctor_schedule_table` (
  `doctor_schedule_id` int(10) NOT NULL,
  `doctor_id` int(10) NOT NULL,
  `doctor_schedule_date` date NOT NULL,
  `doctor_schedule_start_time` varchar(100) NOT NULL,
  `doctor_schedule_end_time` varchar(100) NOT NULL,
  `average_consulting_time` int(10) NOT NULL,
  `doctor_scheduling_status` enum('active','inactive') DEFAULT NULL,
  `doctor_schedule_day` enum('sunday','monday','tuesday','wednesday','thursday','friday','saturday') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor_schedule_table`
--

INSERT INTO `doctor_schedule_table` (`doctor_schedule_id`, `doctor_id`, `doctor_schedule_date`, `doctor_schedule_start_time`, `doctor_schedule_end_time`, `average_consulting_time`, `doctor_scheduling_status`, `doctor_schedule_day`) VALUES
(1, 1, '2022-10-02', '10:00', '11:00', 15, 'active', 'monday'),
(2, 2, '2022-10-03', '15:00', '18:00', 15, 'active', 'tuesday');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `medicine_id` int(10) NOT NULL,
  `medicine_name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`medicine_id`, `medicine_name`, `price`, `quantity`) VALUES
(0, 'paracetamol', 60, 5),
(1, 'seridon', 20, 4),
(2, 'vics vaporub', 60, 1);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patient_id` int(10) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `father_name` varchar(100) NOT NULL,
  `dob` varchar(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `mobile` bigint(100) NOT NULL,
  `patient_add_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patient_id`, `fname`, `lname`, `email`, `password`, `father_name`, `dob`, `address`, `gender`, `mobile`, `patient_add_on`) VALUES
(0, 'mohit', '', 'mohit@gmail.com', 'mohit', 'mohit singh', '2022-10-11', 'Uttam Nagar', 'male', 8750125501, '2022-05-20'),
(1, 'rohit', 'sharma', 'rohit@gmail.com', 'rohit', 'fatherSaab', '2022-10-13', 'Tilak Nagar', 'male', 8750125504, '2022-10-10');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `prescription_id` int(10) NOT NULL,
  `dob` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `prescription` varchar(100) NOT NULL,
  `date_of_prescription` varchar(100) NOT NULL,
  `next_date_of_consultation` date NOT NULL,
  `medical_test` varchar(100) NOT NULL,
  `sign_of_doctor` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_schedule_id` (`doctor_schedule_id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctor_id`);

--
-- Indexes for table `doctor_schedule_table`
--
ALTER TABLE `doctor_schedule_table`
  ADD PRIMARY KEY (`doctor_schedule_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`medicine_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`prescription_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `prescription_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  ADD CONSTRAINT `appointments_ibfk_3` FOREIGN KEY (`doctor_schedule_id`) REFERENCES `doctor_schedule_table` (`doctor_schedule_id`);

--
-- Constraints for table `doctor_schedule_table`
--
ALTER TABLE `doctor_schedule_table`
  ADD CONSTRAINT `doctor_schedule_table_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
