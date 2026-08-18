-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2026 at 06:58 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `krishi_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointmentId` int(100) NOT NULL,
  `f_contact` varchar(10) NOT NULL,
  `e_contact` varchar(10) NOT NULL,
  `date` varchar(15) NOT NULL,
  `time` varchar(15) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointmentId`, `f_contact`, `e_contact`, `date`, `time`, `status`) VALUES
(1, '9876543210', '9090909090', '2025-10-31', '12:00', 'Not Confirm');

-- --------------------------------------------------------

--
-- Table structure for table `crops`
--

CREATE TABLE `crops` (
  `c_Id` int(100) NOT NULL,
  `soilType` varchar(50) NOT NULL,
  `season` varchar(100) NOT NULL,
  `recommendedCrops` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `crops`
--

INSERT INTO `crops` (`c_Id`, `soilType`, `season`, `recommendedCrops`) VALUES
(1, 'Alluvial Soil', 'Kharif', 'Rice, Maize, Sugarca'),
(2, 'Black Cotton Soil (Regur Soil)', 'Rabi', 'Cotton, Wheat, Jawar'),
(3, 'Red Soil', 'Kharif & Rabi', 'Millets, Pulses, Gro'),
(4, 'Laterite Soil', 'Rabi', 'Tea, Coffee, Cashew,'),
(5, 'Desert Soil', 'Kharif', 'Bajra (Pearl Millet)');

-- --------------------------------------------------------

--
-- Table structure for table `expert`
--

CREATE TABLE `expert` (
  `e_contact` varchar(10) NOT NULL,
  `e_name` varchar(30) NOT NULL,
  `specialization` varchar(50) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expert`
--

INSERT INTO `expert` (`e_contact`, `e_name`, `specialization`, `email`, `password`) VALUES
('9090909090', 'Dr. Neha Sharma', 'Agri-Technology & Precision Farming', 'n@gmail.com', '12345'),
('9823456789', 'Ms. Priya Iyer  ', 'Organic Farming & Sustainable Agriculture', 'p@gmail.com', '12345'),
('9876543210', 'Harshali Patil ', 'Agri', 'h@gmail.com', '12345'),
('9876543211', 'Dr. Ramesh Patil', 'Soil Health & Fertilizer Management', 'r@gmail.com', '12345'),
('9988776655', 'Mr. Suresh Naik', 'Irrigation & Water Resource Optimization', 's@gmail.com', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `farmer`
--

CREATE TABLE `farmer` (
  `f_contact` varchar(10) NOT NULL,
  `f_name` varchar(30) NOT NULL,
  `address` varchar(50) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `farmer`
--

INSERT INTO `farmer` (`f_contact`, `f_name`, `address`, `email`, `password`) VALUES
('9876543210', 'Sanika', 'Amalner', 's@gmail.com', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `fertilizer_recommendations`
--

CREATE TABLE `fertilizer_recommendations` (
  `fr_Id` int(10) NOT NULL,
  `crop_name` varchar(20) NOT NULL,
  `soiltype` varchar(25) NOT NULL,
  `season` varchar(30) NOT NULL,
  `fertilizertype` varchar(25) NOT NULL,
  `quntity` varchar(30) NOT NULL,
  `recommendationNotes` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fertilizer_recommendations`
--

INSERT INTO `fertilizer_recommendations` (`fr_Id`, `crop_name`, `soiltype`, `season`, `fertilizertype`, `quntity`, `recommendationNotes`) VALUES
(1, 'Rice (Paddy)', 'Alluvial Soil', 'Kharif', 'Urea, DAP, Potash (NPK – ', '120 kg Nitrogen, 60 kg Phospho', 'Apply nitrogen in 3 splits — at transplanting, tillering, and panicle initiation for best yield.'),
(2, 'Cotton', 'Black Cotton Soil (Regur ', 'Kharif', 'NPK + Micronutrients (Bor', '100:50:50 NPK per hectare + 25', 'Add farmyard manure before sowing; maintain proper soil moisture during flowering.'),
(3, 'Wheat', 'Loamy Soil', 'Rabi', 'NPK (Urea, DAP, MOP)', '120:60:40 NPK kg/ha', 'Apply ½ nitrogen and full phosphorus and potassium before sowing; rest nitrogen at crown root initia'),
(4, 'Groundnut', 'Red Sandy Soil', 'Kharif', 'Gypsum + SSP + Urea', '0:40:40 NPK kg/ha + 500 kg Gyp', 'Apply gypsum at flowering to improve pod filling and calcium content.'),
(5, 'Tea', 'Laterite Soil', 'Annual Crop (Evergreen)', 'NPK (25:5:5) + Organic Co', '150 kg/ha annually', 'Split doses every 3 months; maintain soil pH 4.5–5.5 for best nutrient uptake.');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `r_Id` int(10) NOT NULL,
  `appointmentId` int(10) NOT NULL,
  `e_contact` varchar(10) NOT NULL,
  `notesText` varchar(40) NOT NULL,
  `date` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`r_Id`, `appointmentId`, `e_contact`, `notesText`, `date`) VALUES
(1, 0, '9090909090', 'xyz', '2025-11-31'),
(2, 0, '9090909090', 'xyz', '2025-10-17'),
(3, 0, '9090909090', 'xyz', '13/07/2025'),
(4, 0, '9090909090', 'xyz', '13/07/2025'),
(5, 0, '9090909090', 'xyz', '13/07/2025'),
(6, 0, '9090909090', 'xyz', '2025-10-17');

-- --------------------------------------------------------

--
-- Table structure for table `schemes`
--

CREATE TABLE `schemes` (
  `s_Id` int(100) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `region` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schemes`
--

INSERT INTO `schemes` (`s_Id`, `title`, `description`, `region`) VALUES
(1, 'Pradhan Mantri Fasal Bima Yojana (PMFBY)', 'A crop insurance scheme launched to provide financial support to farmers in case of crop failure due', 'All India'),
(2, 'Pradhan Mantri Krishi Sinchayee Yojana (PMKSY)', 'Aims to achieve “Har Khet Ko Pani” by ensuring access to irrigation water for every farm, improving ', 'Pan India (with focu'),
(3, 'Kisan Credit Card (KCC) Scheme', 'Provides timely access to short-term credit for farmers to meet their cultivation expenses, post-har', 'All India'),
(4, 'Paramparagat Krishi Vikas Yojana (PKVY)', 'Promotes organic farming through cluster-based approaches and certification, encouraging sustainable', 'All India (with focu'),
(5, 'Rashtriya Krishi Vikas Yojana (RKVY)', 'Provides states with flexibility and autonomy to develop and implement agricultural plans for the ov', 'All India');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointmentId`);

--
-- Indexes for table `crops`
--
ALTER TABLE `crops`
  ADD PRIMARY KEY (`c_Id`);

--
-- Indexes for table `expert`
--
ALTER TABLE `expert`
  ADD PRIMARY KEY (`e_contact`);

--
-- Indexes for table `farmer`
--
ALTER TABLE `farmer`
  ADD PRIMARY KEY (`f_contact`);

--
-- Indexes for table `fertilizer_recommendations`
--
ALTER TABLE `fertilizer_recommendations`
  ADD PRIMARY KEY (`fr_Id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`r_Id`);

--
-- Indexes for table `schemes`
--
ALTER TABLE `schemes`
  ADD PRIMARY KEY (`s_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointmentId` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `crops`
--
ALTER TABLE `crops`
  MODIFY `c_Id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fertilizer_recommendations`
--
ALTER TABLE `fertilizer_recommendations`
  MODIFY `fr_Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `r_Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `schemes`
--
ALTER TABLE `schemes`
  MODIFY `s_Id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
