-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2022 at 08:53 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `datakaryawan`
--

-- --------------------------------------------------------

--
-- Table structure for table `golongan_gaji`
--

CREATE TABLE `golongan_gaji` (
  `id_golongan` int(6) NOT NULL,
  `nama_golongan` varchar(50) NOT NULL,
  `golongan` int(6) NOT NULL,
  `gaji_pokok` double NOT NULL,
  `tunjangan` double NOT NULL,
  `lembur` double NOT NULL,
  `bpjs` double NOT NULL,
  `pajak` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `golongan_gaji`
--

INSERT INTO `golongan_gaji` (`id_golongan`, `nama_golongan`, `golongan`, `gaji_pokok`, `tunjangan`, `lembur`, `bpjs`, `pajak`) VALUES
(1, 'Manajer', 1, 5000000, 1000000, 500000, 150000, 50000),
(2, 'Supervisor', 2, 4000000, 1000000, 250000, 150000, 35000),
(3, 'Staff', 3, 3000000, 1000000, 150000, 150000, 15000);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` varchar(50) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `username`, `password`) VALUES
('1', 'Admin', '12345678');

-- --------------------------------------------------------

--
-- Table structure for table `summary`
--

CREATE TABLE `summary` (
  `id_summary` int(6) NOT NULL,
  `NIK` int(8) NOT NULL,
  `id_golongan` int(6) NOT NULL,
  `gaji_pokok` double NOT NULL,
  `tunjangan` double NOT NULL,
  `lembur` double NOT NULL,
  `bpjs` double NOT NULL,
  `pajak` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tablekaryawan`
--

CREATE TABLE `tablekaryawan` (
  `NIK` int(8) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Tanggal_Lahir` varchar(10) NOT NULL,
  `Jenis_Kelamin` varchar(10) NOT NULL,
  `Alamat` varchar(255) NOT NULL,
  `No_Telepon` varchar(13) NOT NULL,
  `Golongan` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tablekaryawan`
--

INSERT INTO `tablekaryawan` (`NIK`, `Nama`, `Tanggal_Lahir`, `Jenis_Kelamin`, `Alamat`, `No_Telepon`, `Golongan`) VALUES
(16200003, 'Muhamad Reza Saputra', '09-05-2000', 'Pria', 'Komp.BBA Jelekong', '081224263611', 1),
(16200010, 'Revi Dermawan', '06-20-2000', 'Pria', 'Pameutingan Banjaran', '087722291264', 3),
(16201001, 'Fajar Arya Iskandar', '01-22-2000', 'Pria', 'BMI Andir', '081313141598', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `golongan_gaji`
--
ALTER TABLE `golongan_gaji`
  ADD PRIMARY KEY (`id_golongan`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `summary`
--
ALTER TABLE `summary`
  ADD PRIMARY KEY (`id_summary`),
  ADD KEY `nik` (`NIK`),
  ADD KEY `id_golongan` (`id_golongan`);

--
-- Indexes for table `tablekaryawan`
--
ALTER TABLE `tablekaryawan`
  ADD PRIMARY KEY (`NIK`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `golongan_gaji`
--
ALTER TABLE `golongan_gaji`
  MODIFY `id_golongan` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `summary`
--
ALTER TABLE `summary`
  MODIFY `id_summary` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tablekaryawan`
--
ALTER TABLE `tablekaryawan`
  MODIFY `NIK` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20180028;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `summary`
--
ALTER TABLE `summary`
  ADD CONSTRAINT `id_golongan` FOREIGN KEY (`id_golongan`) REFERENCES `golongan_gaji` (`id_golongan`),
  ADD CONSTRAINT `nik` FOREIGN KEY (`NIK`) REFERENCES `tablekaryawan` (`NIK`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
