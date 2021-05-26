-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2021 at 06:00 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `danu_311810241`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `kode_barang` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga_satuan` int(11) NOT NULL,
  `stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `kode_barang`, `nama_barang`, `harga_satuan`, `stok`) VALUES
(1, 158826, 'AMDK CLUB 220 ML', 17800, 100),
(2, 143018, 'AMDK CLUB 330 ML', 29000, 100),
(3, 143019, 'AMDK CLUB 600 ML', 31500, 100),
(4, 143020, 'AMDK CLUB1500 ML', 32000, 100);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_cust` int(11) NOT NULL,
  `kode_salesman` int(11) NOT NULL,
  `kode_cust` int(11) NOT NULL,
  `nama_cust` varchar(50) NOT NULL,
  `alamat_cust` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id_cust`, `kode_salesman`, `kode_cust`, `nama_cust`, `alamat_cust`) VALUES
(1, 745, 11855, 'TOKO SIMAUNG', 'PASIR JENGKOL RT 18/18 MAJALAYA KARAWANG'),
(2, 746, 11856, 'TOKO BERKAH', 'JL TUPAREV KARAWANGPAWITAN KARAWANG'),
(3, 744, 11857, 'TOKO 256', 'JL PARAHIYANGAN ADIARSA KARAWANG');

-- --------------------------------------------------------

--
-- Table structure for table `distribusi`
--

CREATE TABLE `distribusi` (
  `id_distribusi` int(11) NOT NULL,
  `no_faktur` int(11) NOT NULL,
  `kode_barang` int(11) NOT NULL,
  `kode_cust` int(11) NOT NULL,
  `kode_salesman` int(11) NOT NULL,
  `tgl_distribusi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `jmlh_barang` smallint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `distribusi`
--

INSERT INTO `distribusi` (`id_distribusi`, `no_faktur`, `kode_barang`, `kode_cust`, `kode_salesman`, `tgl_distribusi`, `jmlh_barang`) VALUES
(1, 152311, 143019, 11855, 745, '2021-05-26 13:58:19', 185),
(2, 152312, 158826, 11856, 746, '2021-05-26 13:58:24', 20),
(3, 152310, 143018, 11857, 744, '2021-05-26 13:58:27', 10);

-- --------------------------------------------------------

--
-- Table structure for table `salesman`
--

CREATE TABLE `salesman` (
  `id_salesman` int(11) NOT NULL,
  `kode_salesman` int(11) NOT NULL,
  `no_faktur` int(11) NOT NULL,
  `nama_salesman` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salesman`
--

INSERT INTO `salesman` (`id_salesman`, `kode_salesman`, `no_faktur`, `nama_salesman`) VALUES
(1, 744, 152310, 'SUHENDAR'),
(2, 745, 152311, 'DANU'),
(3, 746, 152312, 'INDRA');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_cust`),
  ADD KEY `kode_cust` (`kode_cust`),
  ADD KEY `kode_salesman` (`kode_salesman`);

--
-- Indexes for table `distribusi`
--
ALTER TABLE `distribusi`
  ADD PRIMARY KEY (`id_distribusi`),
  ADD KEY `kode_barang` (`kode_barang`),
  ADD KEY `kode_cust` (`kode_cust`),
  ADD KEY `kode_salesman` (`kode_salesman`),
  ADD KEY `no_faktur` (`no_faktur`);

--
-- Indexes for table `salesman`
--
ALTER TABLE `salesman`
  ADD PRIMARY KEY (`id_salesman`),
  ADD KEY `id_salesman` (`kode_salesman`),
  ADD KEY `no_faktur` (`no_faktur`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id_cust` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `distribusi`
--
ALTER TABLE `distribusi`
  MODIFY `id_distribusi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `salesman`
--
ALTER TABLE `salesman`
  MODIFY `id_salesman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`kode_salesman`) REFERENCES `salesman` (`kode_salesman`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`kode_cust`) REFERENCES `distribusi` (`kode_cust`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `distribusi`
--
ALTER TABLE `distribusi`
  ADD CONSTRAINT `distribusi_ibfk_1` FOREIGN KEY (`kode_barang`) REFERENCES `barang` (`kode_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `distribusi_ibfk_2` FOREIGN KEY (`kode_cust`) REFERENCES `customer` (`kode_cust`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `distribusi_ibfk_3` FOREIGN KEY (`kode_salesman`) REFERENCES `salesman` (`kode_salesman`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `distribusi_ibfk_4` FOREIGN KEY (`no_faktur`) REFERENCES `salesman` (`no_faktur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salesman`
--
ALTER TABLE `salesman`
  ADD CONSTRAINT `salesman_ibfk_1` FOREIGN KEY (`kode_salesman`) REFERENCES `distribusi` (`kode_salesman`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
