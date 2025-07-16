-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2025 at 08:48 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointmenttable`
--

CREATE TABLE `appointmenttable` (
  `AppointmentID` int(11) NOT NULL,
  `PatientID` int(11) DEFAULT NULL,
  `DoctorID` int(11) DEFAULT NULL,
  `AppointmentDate` date DEFAULT NULL,
  `AppointmentTime` time DEFAULT NULL,
  `ReasonForVisit` text DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointmenttable`
--

INSERT INTO `appointmenttable` (`AppointmentID`, `PatientID`, `DoctorID`, `AppointmentDate`, `AppointmentTime`, `ReasonForVisit`, `Status`) VALUES
(7, 1, 2, '2025-07-18', '21:36:00', 'nblbjhbjhl', 'Scheduled'),
(8, 1, 2, '2025-07-09', '21:48:00', 'kjhoui', 'Scheduled'),
(9, 2, 2, '2025-07-10', '23:55:00', 'cghgg,dh', 'Scheduled'),
(10, 1, 1, '2025-07-12', '22:00:00', 'rii6tgtyufhghghhj', 'Scheduled'),
(11, 1, 1, '2025-07-17', '23:43:00', 'gunafa', 'Scheduled'),
(12, 3, 3, '2025-07-17', '12:46:00', 'gubb', 'Scheduled');

-- --------------------------------------------------------

--
-- Table structure for table `doctortable`
--

CREATE TABLE `doctortable` (
  `DoctorID` int(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Specialty` varchar(255) DEFAULT NULL,
  `ContactInfo` varchar(255) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctortable`
--

INSERT INTO `doctortable` (`DoctorID`, `FirstName`, `LastName`, `Specialty`, `ContactInfo`, `Salary`) VALUES
(1, 'Helen', 'Mekonnen', 'Cardiology', 'helen.m@hospital.com', 50000.00),
(2, 'Samuel', 'Girma', 'General Medicine', 'samuel.g@hospital.com', 45000.00),
(3, 'Sara', 'Tesfaye', 'Cardiology', 'sara.t@hospital.com', 52000.00);

-- --------------------------------------------------------

--
-- Table structure for table `patienttable`
--

CREATE TABLE `patienttable` (
  `PatientID` int(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `EmergencyContact` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patienttable`
--

INSERT INTO `patienttable` (`PatientID`, `FirstName`, `LastName`, `Gender`, `DateOfBirth`, `Age`, `Address`, `EmergencyContact`) VALUES
(1, 'Abebe', 'Bekele', 'Male', '1990-05-15', 34, '123 Arat Kilo, Addis Ababa', '0911123456'),
(2, 'Fatuma', 'Hassan', 'Female', '1985-02-20', 39, '456 Bole, Addis Ababa', '0912234567'),
(3, 'Kebede', 'Tadesse', 'Male', '2001-11-10', 22, '789 Piassa, Addis Ababa', '0913345678');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointmenttable`
--
ALTER TABLE `appointmenttable`
  ADD PRIMARY KEY (`AppointmentID`),
  ADD KEY `PatientID` (`PatientID`),
  ADD KEY `DoctorID` (`DoctorID`);

--
-- Indexes for table `doctortable`
--
ALTER TABLE `doctortable`
  ADD PRIMARY KEY (`DoctorID`);

--
-- Indexes for table `patienttable`
--
ALTER TABLE `patienttable`
  ADD PRIMARY KEY (`PatientID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointmenttable`
--
ALTER TABLE `appointmenttable`
  MODIFY `AppointmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `doctortable`
--
ALTER TABLE `doctortable`
  MODIFY `DoctorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `patienttable`
--
ALTER TABLE `patienttable`
  MODIFY `PatientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointmenttable`
--
ALTER TABLE `appointmenttable`
  ADD CONSTRAINT `appointmenttable_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patienttable` (`PatientID`),
  ADD CONSTRAINT `appointmenttable_ibfk_2` FOREIGN KEY (`DoctorID`) REFERENCES `doctortable` (`DoctorID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
