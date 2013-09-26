-- phpMyAdmin SQL Dump
-- version 4.0.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 25, 2013 at 03:02 PM
-- Server version: 5.5.32-0ubuntu0.13.04.1
-- PHP Version: 5.4.9-4ubuntu2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `OTM`
--

-- --------------------------------------------------------

--
-- Table structure for table `content_billing`
--

CREATE TABLE IF NOT EXISTS `content_billing` (
  `content_id` varchar(20) NOT NULL,
  `point` int(11) DEFAULT NULL,
  `diskon` int(11) DEFAULT NULL,
  `paket` varchar(20) DEFAULT NULL,
  UNIQUE KEY `content_id_UNIQUE` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `content_creator`
--

CREATE TABLE IF NOT EXISTS `content_creator` (
  `content_id` varchar(20) NOT NULL,
  `creator_id` int(11) NOT NULL,
  UNIQUE KEY `bp_unq` (`content_id`,`creator_id`),
  KEY `fk_cc_buku_idx` (`content_id`),
  KEY `fk_cc_creator_idx` (`creator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `content_publish`
--

CREATE TABLE IF NOT EXISTS `content_publish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` varchar(20) NOT NULL,
  `publish_at` datetime DEFAULT NULL,
  `edisi` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cp_content_idx` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `grp`
--

CREATE TABLE IF NOT EXISTS `grp` (
  `id` varchar(20) NOT NULL,
  `nama` varchar(45) DEFAULT NULL,
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `grpmodul`
--

CREATE TABLE IF NOT EXISTS `grpmodul` (
  `grp_id` varchar(20) NOT NULL,
  `modul_id` varchar(20) NOT NULL,
  UNIQUE KEY `index1` (`grp_id`,`modul_id`),
  KEY `fk_grpmodul_modul_idx` (`modul_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `grpusr`
--

CREATE TABLE IF NOT EXISTS `grpusr` (
  `grp_id` varchar(20) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  UNIQUE KEY `grpusr_unq` (`grp_id`,`user_id`),
  KEY `fk_grpusr_user_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `invoicepenerbit`
--

CREATE TABLE IF NOT EXISTS `invoicepenerbit` (
  `no` varchar(20) NOT NULL,
  `penerbit_id` int(11) DEFAULT NULL,
  `jumlah` double DEFAULT NULL,
  `is_bayar` int(11) DEFAULT '0',
  UNIQUE KEY `no_UNIQUE` (`no`),
  KEY `fk_ipm_penerbit_idx` (`penerbit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `invoicepenerbitd`
--

CREATE TABLE IF NOT EXISTS `invoicepenerbitd` (
  `no` int(11) NOT NULL,
  `invoice_no` varchar(20) DEFAULT NULL,
  `content_id` varchar(20) DEFAULT NULL,
  `sale_no` varchar(20) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  UNIQUE KEY `no_UNIQUE` (`no`),
  UNIQUE KEY `content_unq` (`content_id`,`sale_no`),
  KEY `fk_ip_main_idx` (`invoice_no`),
  KEY `fk_ip_sale_idx` (`sale_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE IF NOT EXISTS `kategori` (
  `id` varchar(100) NOT NULL,
  `keterangan` varchar(45) DEFAULT NULL,
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kategori_sub`
--

CREATE TABLE IF NOT EXISTS `kategori_sub` (
  `sub_id` varchar(100) NOT NULL,
  `main_id` varchar(100) NOT NULL,
  UNIQUE KEY `ks_unq` (`sub_id`,`main_id`),
  KEY `fk_ks_sub_idx` (`sub_id`),
  KEY `fk_ks_main_idx` (`main_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE IF NOT EXISTS `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `lahir_at` datetime DEFAULT NULL,
  `alamat` varchar(45) DEFAULT NULL,
  `tlp` varchar(45) DEFAULT NULL,
  `kelamin` int(11) DEFAULT NULL,
  `kabupaten_id` varchar(45) DEFAULT NULL,
  `kota_id` varchar(20) DEFAULT NULL,
  `kodepos` varchar(15) DEFAULT NULL,
  `negara` varchar(20) DEFAULT NULL,
  `sekolah_id` varchar(20) DEFAULT NULL,
  `user_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_m_user_idx` (`user_id`),
  KEY `fk_m_sekolah_idx` (`sekolah_id`),
  KEY `fk_m_kota_idx` (`kota_id`),
  KEY `fk_m_kabupaten_idx` (`kabupaten_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `modul`
--

CREATE TABLE IF NOT EXISTS `modul` (
  `id` varchar(20) NOT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `is_enabled` int(1) DEFAULT NULL,
  `versi` varchar(20) DEFAULT NULL,
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salecontent`
--

CREATE TABLE IF NOT EXISTS `salecontent` (
  `no` varchar(20) NOT NULL,
  `beli_at` datetime DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  UNIQUE KEY `id_UNIQUE` (`no`),
  KEY `fk_sale_member_idx` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salecontentd`
--

CREATE TABLE IF NOT EXISTS `salecontentd` (
  `no` int(11) NOT NULL,
  `sale_no` varchar(20) NOT NULL,
  `content_id` varchar(20) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL,
  `is_claim` int(11) DEFAULT NULL,
  UNIQUE KEY `fk_scd_unq` (`no`,`sale_no`),
  KEY `fk_saled_main_idx` (`sale_no`),
  KEY `fk_saled_vid_idx` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `saledeposit`
--

CREATE TABLE IF NOT EXISTS `saledeposit` (
  `id` varchar(20) NOT NULL,
  `member_id` int(11) NOT NULL,
  `beli_at` datetime DEFAULT NULL,
  `konfirmasi_at` datetime DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `payment_id` varchar(20) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_sdeposit_payment_idx` (`payment_id`),
  KEY `fk_sdeposit_member_idx` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `schema_version`
--

CREATE TABLE IF NOT EXISTS `schema_version` (
  `version` varchar(32) NOT NULL,
  `applied_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `duration` int(11) NOT NULL,
  UNIQUE KEY `version` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `id` varchar(20) NOT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` varchar(100) NOT NULL,
  `keterangan` varchar(45) DEFAULT NULL,
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tags_content`
--

CREATE TABLE IF NOT EXISTS `tags_content` (
  `tag_id` varchar(100) NOT NULL,
  `content_id` varchar(45) NOT NULL,
  UNIQUE KEY `tc_unq` (`tag_id`,`content_id`),
  KEY `fk_tc_buku_idx` (`content_id`),
  KEY `fk_tc_tag_idx` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_app`
--

CREATE TABLE IF NOT EXISTS `tb_app` (
  `id` varchar(20) NOT NULL,
  `judul` varchar(45) DEFAULT NULL,
  `deskripsi` text,
  `feature` text,
  `penerbit_id` int(11) DEFAULT NULL,
  `kategori_id` varchar(100) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `lokasi` varchar(255) DEFAULT NULL,
  `status_id` varchar(20) DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL,
  `platform` varchar(20) DEFAULT NULL,
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_app_penerbit_idx` (`penerbit_id`),
  KEY `fk_app_kategori_idx` (`kategori_id`),
  KEY `fk_app_status_idx` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_buku`
--

CREATE TABLE IF NOT EXISTS `tb_buku` (
  `id` varchar(20) NOT NULL,
  `isbn` varchar(45) NOT NULL,
  `judul` varchar(45) DEFAULT NULL,
  `penerbit_id` int(11) DEFAULT NULL,
  `kategori_id` varchar(100) DEFAULT NULL,
  `deskripsi` text,
  `sinopsis` text,
  `daftarisi` text,
  `status_id` varchar(20) DEFAULT NULL,
  `lokasi` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `isbn_UNIQUE` (`isbn`),
  KEY `fk_tb_buku_penerbit_idx` (`penerbit_id`),
  KEY `fk_tb_buku_status_idx` (`status_id`),
  KEY `fk_tb_buku_kategori_idx` (`kategori_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_creator`
--

CREATE TABLE IF NOT EXISTS `tb_creator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(45) DEFAULT NULL,
  `alamat` varchar(45) DEFAULT NULL,
  `telepon` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kabupaten`
--

CREATE TABLE IF NOT EXISTS `tb_kabupaten` (
  `id` varchar(20) NOT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kota`
--

CREATE TABLE IF NOT EXISTS `tb_kota` (
  `id` varchar(20) NOT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_payment`
--

CREATE TABLE IF NOT EXISTS `tb_payment` (
  `id` varchar(20) NOT NULL,
  `keterangan` varchar(45) DEFAULT NULL,
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_penerbit`
--

CREATE TABLE IF NOT EXISTS `tb_penerbit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `npwp` varchar(45) DEFAULT NULL,
  `rekening` varchar(45) DEFAULT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `alamat` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telepon` varchar(45) DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  `user_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_p_user_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_sekolah`
--

CREATE TABLE IF NOT EXISTS `tb_sekolah` (
  `id` varchar(20) NOT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `alamat` text,
  `tlp` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `kepsek_nama` varchar(20) DEFAULT NULL,
  `kepsek_tlp` varchar(20) DEFAULT NULL,
  `kepsek_email` varchar(20) DEFAULT NULL,
  `jenis` varchar(20) DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_video`
--

CREATE TABLE IF NOT EXISTS `tb_video` (
  `id` varchar(20) NOT NULL,
  `judul` varchar(45) DEFAULT NULL,
  `deskripsi` text,
  `penerbit_id` int(11) DEFAULT NULL,
  `kategori_id` varchar(100) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `lokasi` varchar(255) DEFAULT NULL,
  `status_id` varchar(20) DEFAULT NULL,
  `durasi` time DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL,
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_vid_kategori_idx` (`kategori_id`),
  KEY `fk_vid_penerbit_idx` (`penerbit_id`),
  KEY `fk_vid_status_idx` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` varchar(20) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `flag` int(1) DEFAULT NULL,
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `content_billing`
--
ALTER TABLE `content_billing`
  ADD CONSTRAINT `fk_cb_app` FOREIGN KEY (`content_id`) REFERENCES `tb_app` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cb_content` FOREIGN KEY (`content_id`) REFERENCES `tb_buku` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cb_vid` FOREIGN KEY (`content_id`) REFERENCES `tb_video` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `content_creator`
--
ALTER TABLE `content_creator`
  ADD CONSTRAINT `fk_cc_app` FOREIGN KEY (`content_id`) REFERENCES `tb_app` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cc_buku` FOREIGN KEY (`content_id`) REFERENCES `tb_buku` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cc_creator` FOREIGN KEY (`creator_id`) REFERENCES `tb_creator` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cc_video` FOREIGN KEY (`content_id`) REFERENCES `tb_video` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `content_publish`
--
ALTER TABLE `content_publish`
  ADD CONSTRAINT `fk_cp_app` FOREIGN KEY (`content_id`) REFERENCES `tb_app` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cp_buku` FOREIGN KEY (`content_id`) REFERENCES `tb_buku` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cp_vid` FOREIGN KEY (`content_id`) REFERENCES `tb_video` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `grpmodul`
--
ALTER TABLE `grpmodul`
  ADD CONSTRAINT `fk_grpmodul_grp` FOREIGN KEY (`grp_id`) REFERENCES `grp` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_grpmodul_modul` FOREIGN KEY (`modul_id`) REFERENCES `modul` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `grpusr`
--
ALTER TABLE `grpusr`
  ADD CONSTRAINT `fk_grpusr_grp` FOREIGN KEY (`grp_id`) REFERENCES `grp` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_grpusr_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `invoicepenerbit`
--
ALTER TABLE `invoicepenerbit`
  ADD CONSTRAINT `fk_ipm_penerbit` FOREIGN KEY (`penerbit_id`) REFERENCES `tb_penerbit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `invoicepenerbitd`
--
ALTER TABLE `invoicepenerbitd`
  ADD CONSTRAINT `fk_ip_app` FOREIGN KEY (`content_id`) REFERENCES `tb_app` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ip_buku` FOREIGN KEY (`content_id`) REFERENCES `tb_buku` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ip_main` FOREIGN KEY (`invoice_no`) REFERENCES `invoicepenerbit` (`no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ip_sale` FOREIGN KEY (`sale_no`) REFERENCES `salecontent` (`no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ip_vid` FOREIGN KEY (`content_id`) REFERENCES `tb_video` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `kategori_sub`
--
ALTER TABLE `kategori_sub`
  ADD CONSTRAINT `fk_ks_main` FOREIGN KEY (`main_id`) REFERENCES `kategori` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ks_sub` FOREIGN KEY (`sub_id`) REFERENCES `kategori` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `fk_m_kabupaten` FOREIGN KEY (`kabupaten_id`) REFERENCES `tb_kabupaten` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_m_kota` FOREIGN KEY (`kota_id`) REFERENCES `tb_kota` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_m_sekolah` FOREIGN KEY (`sekolah_id`) REFERENCES `tb_sekolah` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_m_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `salecontent`
--
ALTER TABLE `salecontent`
  ADD CONSTRAINT `fk_sale_member` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `salecontentd`
--
ALTER TABLE `salecontentd`
  ADD CONSTRAINT `fk_saled_app` FOREIGN KEY (`content_id`) REFERENCES `tb_app` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_saled_buk` FOREIGN KEY (`content_id`) REFERENCES `tb_buku` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_saled_main` FOREIGN KEY (`sale_no`) REFERENCES `salecontent` (`no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_saled_vid` FOREIGN KEY (`content_id`) REFERENCES `tb_video` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `saledeposit`
--
ALTER TABLE `saledeposit`
  ADD CONSTRAINT `fk_sdeposit_member` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sdeposit_payment` FOREIGN KEY (`payment_id`) REFERENCES `tb_payment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tags_content`
--
ALTER TABLE `tags_content`
  ADD CONSTRAINT `fk_tc_app` FOREIGN KEY (`content_id`) REFERENCES `tb_app` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tc_buku` FOREIGN KEY (`content_id`) REFERENCES `tb_buku` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tc_tag` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tc_vid` FOREIGN KEY (`content_id`) REFERENCES `tb_video` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tb_app`
--
ALTER TABLE `tb_app`
  ADD CONSTRAINT `fk_app_kategori` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_app_penerbit` FOREIGN KEY (`penerbit_id`) REFERENCES `tb_penerbit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_app_status` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tb_buku`
--
ALTER TABLE `tb_buku`
  ADD CONSTRAINT `fk_tb_buku_kategori` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tb_buku_penerbit` FOREIGN KEY (`penerbit_id`) REFERENCES `tb_penerbit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tb_buku_status` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tb_penerbit`
--
ALTER TABLE `tb_penerbit`
  ADD CONSTRAINT `fk_p_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tb_video`
--
ALTER TABLE `tb_video`
  ADD CONSTRAINT `fk_vid_kategori` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vid_penerbit` FOREIGN KEY (`penerbit_id`) REFERENCES `tb_penerbit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vid_status` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
