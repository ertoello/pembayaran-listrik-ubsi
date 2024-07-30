-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Jul 2024 pada 07.04
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `listrik_ubsi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `agen`
--

CREATE TABLE `agen` (
  `id_agen` varchar(12) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `no_telepon` varchar(15) NOT NULL,
  `saldo` double NOT NULL,
  `biaya_admin` double NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `akses` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `agen`
--

INSERT INTO `agen` (`id_agen`, `nama`, `alamat`, `no_telepon`, `saldo`, `biaya_admin`, `username`, `password`, `akses`) VALUES
('A20180129001', 'Muhammad Ramdan', 'Bogor', '083811941421', 0, 5000, 'zidun', 'zidun123', 'agen'),
('A20240726001', 'YOHANES SERPIYANTO ELO', 'Narogong', '0881010930936', 0, 2000, 'ertoello', '12345', 'agen'),
('A20240729001', 'Antonia Yuliana Deru', 'Tambun', '0881010930936', 0, 2000, 'antoniayulianaderu', '12345', 'agen');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` varchar(14) NOT NULL,
  `no_meter` varchar(12) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `tenggang` varchar(2) NOT NULL,
  `id_tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `no_meter`, `nama`, `alamat`, `tenggang`, `id_tarif`) VALUES
('20240726130523', '207240751323', 'YOHANES SERPIYANTO ELO', 'Narogong', '26', 8),
('20240726132611', '207240751311', 'Erto Ello', 'Bekasi', '26', 5),
('20240726132913', '207240751313', 'Dewa Firmansyah', 'Tambun', '26', 8),
('20240726135049', '207240751349', 'Alfonsus Rodriques Elo', 'Poeng', '26', 5),
('20240729112227', '210240711127', 'Antonia Yuliana Deru', 'Tambun', '29', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` varchar(15) NOT NULL,
  `id_pelanggan` varchar(14) NOT NULL,
  `tgl_bayar` date NOT NULL,
  `waktu_bayar` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `bulan_bayar` varchar(2) NOT NULL,
  `tahun_bayar` year(4) NOT NULL,
  `jumlah_bayar` double NOT NULL,
  `biaya_admin` double NOT NULL,
  `total_akhir` double NOT NULL,
  `bayar` double NOT NULL,
  `kembali` double NOT NULL,
  `id_agen` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pelanggan`, `tgl_bayar`, `waktu_bayar`, `bulan_bayar`, `tahun_bayar`, `jumlah_bayar`, `biaya_admin`, `total_akhir`, `bayar`, `kembali`, `id_agen`) VALUES
('BYR201801260001', '20180126081200', '2018-01-26', '2018-01-26 08:07:41', '02', 2018, 15000, 2000, 17000, 20000, 3000, 'A20180125001'),
('BYR201801260002', '20180126081804', '2018-01-26', '2018-01-26 09:22:34', '02', 2018, 75000, 2000, 77000, 80000, 3000, 'A20180125001'),
('BYR201801260003', '20180126165945', '2018-01-26', '2018-01-26 10:04:01', '02', 2018, 150000, 2000, 152000, 160000, 8000, 'A20180125001'),
('BYR201801280001', '20180126081200', '2018-01-28', '2018-01-28 10:17:20', '03', 2018, 135000, 2000, 137000, 140000, 3000, 'A20180125001'),
('BYR201801280002', '20180126081200', '2018-01-28', '2018-01-28 10:18:52', '04', 2018, 1350000, 2000, 1352000, 1400000, 48000, 'A20180125001'),
('BYR201801290001', '20180129132711', '2018-01-29', '2018-01-29 06:29:58', '02', 2018, 140000, 2000, 142000, 150000, 8000, 'A20180125001'),
('BYR201801290002', '20180128141130', '2018-01-29', '2018-01-29 06:41:50', '02', 2018, 1500000, 2000, 1502000, 1510000, 8000, 'A20180125001'),
('BYR201801300001', '20180130165747', '2018-01-30', '2018-01-30 10:01:59', '02', 2018, 150000, 2000, 152000, 160000, 8000, 'A20180125001'),
('BYR201802010001', '20180128141026', '2018-02-01', '2018-02-01 01:33:50', '02', 2018, 75000, 2000, 77000, 80000, 3000, 'A20180125001'),
('BYR201802010002', '20180128141026', '2018-02-01', '2018-02-01 02:22:32', '03', 2018, 37500, 2000, 39500, 40000, 500, 'A20180125001'),
('BYR202407260001', '20240726130523', '2024-07-26', '2024-07-26 06:13:59', '08', 2024, 3000000, 2000, 3002000, 3002000, 0, 'A20180125001'),
('BYR202407260002', '20240726132611', '2024-07-26', '2024-07-26 06:41:09', '08', 2024, 1500000, 2000, 1502000, 1502000, 0, 'A20180125001'),
('BYR202407260003', '20240726132913', '2024-07-26', '2024-07-26 06:48:42', '08', 2024, 1350000, 2000, 1352000, 1357000, 5000, 'A20180125001'),
('BYR202407260004', '20240726135049', '2024-07-26', '2024-07-26 06:55:30', '08', 2024, 300000, 2000, 302000, 302000, 0, 'A20180125001'),
('BYR202407260005', '20240726130523', '2024-07-26', '2024-07-26 07:01:45', '09', 2024, 1500000, 2000, 1502000, 1502000, 0, 'A20180125001'),
('BYR202407260006', '20240726130523', '2024-07-26', '2024-07-26 07:02:18', '09', 2024, 1500000, 2000, 1502000, 1502000, 0, 'A20180125001'),
('BYR202407270001', '20240726135049', '2024-07-27', '2024-07-27 15:20:54', '09', 2024, 1950000, 2000, 1952000, 1952000, 0, 'A20240726001'),
('BYR202407290001', '20240729112227', '2024-07-29', '2024-07-29 04:59:46', '08', 2024, 1500000, 2000, 1502000, 1502000, 0, 'A20240729001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penggunaan`
--

CREATE TABLE `penggunaan` (
  `id_penggunaan` varchar(20) NOT NULL,
  `id_pelanggan` varchar(14) NOT NULL,
  `bulan` varchar(2) NOT NULL,
  `tahun` year(4) NOT NULL,
  `meter_awal` int(11) NOT NULL,
  `meter_akhir` int(11) NOT NULL,
  `tgl_cek` date NOT NULL,
  `id_petugas` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penggunaan`
--

INSERT INTO `penggunaan` (`id_penggunaan`, `id_pelanggan`, `bulan`, `tahun`, `meter_awal`, `meter_akhir`, `tgl_cek`, `id_petugas`) VALUES
('20180126081200022018', '20180126081200', '02', 2018, 0, 10, '2018-02-23', 'P20180125001'),
('20180126081200032018', '20180126081200', '03', 2018, 10, 100, '2018-02-26', 'P20180125001'),
('20180126081200042018', '20180126081200', '04', 2018, 100, 1000, '2018-04-26', 'P20180125001'),
('20180126081200052018', '20180126081200', '05', 2018, 1000, 0, '0000-00-00', ''),
('20180126081257022018', '20180126081257', '02', 2018, 0, 80, '2018-02-26', 'P20180125001'),
('20180126081257032018', '20180126081257', '03', 2018, 80, 0, '0000-00-00', ''),
('20180126081804022018', '20180126081804', '02', 2018, 0, 100, '2018-02-26', 'P20180125001'),
('20180126081804032018', '20180126081804', '03', 2018, 100, 0, '0000-00-00', ''),
('20180126165945022018', '20180126165945', '02', 2018, 0, 100, '2018-02-26', 'P20180125001'),
('20180126165945032018', '20180126165945', '03', 2018, 100, 0, '0000-00-00', ''),
('20180128141026022018', '20180128141026', '02', 2018, 0, 100, '2018-02-01', 'P20180125001'),
('20180128141026032018', '20180128141026', '03', 2018, 100, 150, '2018-03-01', 'P20180125001'),
('20180128141026042018', '20180128141026', '04', 2018, 150, 200, '2018-04-23', 'P20180125001'),
('20180128141026052018', '20180128141026', '05', 2018, 200, 0, '0000-00-00', ''),
('20180128141049022018', '20180128141049', '02', 2018, 0, 0, '0000-00-00', ''),
('20180128141130022018', '20180128141130', '02', 2018, 0, 1000, '2018-02-26', 'P20180125001'),
('20180128141130032018', '20180128141130', '03', 2018, 1000, 2000, '2018-01-01', 'P20180125001'),
('20180128141130042018', '20180128141130', '04', 2018, 2000, 0, '0000-00-00', ''),
('20180128141244022018', '20180128141244', '02', 2018, 0, 0, '0000-00-00', ''),
('20180128141336022018', '20180128141336', '02', 2018, 0, 0, '0000-00-00', ''),
('20180128141409022018', '20180128141409', '02', 2018, 0, 0, '0000-00-00', ''),
('20180129132711022018', '20180129132711', '02', 2018, 0, 100, '2018-01-29', 'P20180125001'),
('20180129132711032018', '20180129132711', '03', 2018, 100, 0, '0000-00-00', ''),
('20180129135850022018', '20180129135850', '02', 2018, 0, 50, '2018-02-25', 'P20180125001'),
('20180129135850032018', '20180129135850', '03', 2018, 50, 70, '2018-03-25', 'P20180125001'),
('20240726130523082024', '20240726130523', '08', 2024, 0, 2000, '2024-07-26', 'P20180125001'),
('20240726130523092024', '20240726130523', '09', 2024, 2000, 3000, '2024-07-26', 'P20180125001'),
('20240726132611082024', '20240726132611', '08', 2024, 0, 2000, '2024-07-26', 'P20240726001'),
('2024072613291301', '20240726132913', '01', 0000, 2000, 0, '0000-00-00', ''),
('20240726132913082024', '20240726132913', '08', 2024, 0, 900, '2024-07-26', 'P20240726001'),
('20240726135049010202', '20240726135049', '01', 2024, 3000, 0, '0000-00-00', ''),
('20240726135049082024', '20240726135049', '08', 2024, 0, 400, '2024-07-26', 'P20240726001'),
('20240726135049092024', '20240726135049', '09', 2024, 400, 3000, '2024-07-27', 'P20240726001'),
('20240729112227082024', '20240729112227', '08', 2024, 0, 2000, '2024-07-29', 'P20240729001'),
('20240729112227092024', '20240729112227', '09', 2024, 2000, 0, '0000-00-00', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` varchar(12) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `no_telepon` varchar(15) NOT NULL,
  `jk` varchar(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `akses` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama`, `alamat`, `no_telepon`, `jk`, `username`, `password`, `akses`) VALUES
('P20180125001', 'Muhammad Ramdan', 'Sukabirus', '083811941421', 'L', 'petugas', 'petugas123', 'petugas'),
('P20240726001', 'YOHANES SERPIYANTO ELO', 'Narogong', '0881010930936', 'L', 'ertoello', '12345', 'petugas'),
('P20240729001', 'Antonia Yuliana Deru', 'Tambun', '0881010930936', 'P', 'antoniayulianaderu', '12345', 'petugas');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `qw_pembayaran`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `qw_pembayaran` (
`id_pembayaran` varchar(15)
,`id_pelanggan` varchar(14)
,`tgl_bayar` date
,`waktu_bayar` timestamp
,`bulan_bayar` varchar(2)
,`tahun_bayar` year(4)
,`jumlah_bayar` double
,`biaya_admin` double
,`total_akhir` double
,`bayar` double
,`kembali` double
,`id_agen` varchar(12)
,`nama_pelanggan` varchar(50)
,`nama_agen` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `qw_penggunaan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `qw_penggunaan` (
`id_penggunaan` varchar(20)
,`id_pelanggan` varchar(14)
,`bulan` varchar(2)
,`tahun` year(4)
,`meter_awal` int(11)
,`meter_akhir` int(11)
,`tgl_cek` date
,`id_petugas` varchar(12)
,`nama_pelanggan` varchar(50)
,`nama_petugas` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `qw_tagihan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `qw_tagihan` (
`id_tagihan` int(11)
,`id_pelanggan` varchar(14)
,`bulan` varchar(2)
,`tahun` year(4)
,`jumlah_meter` int(11)
,`tarif_perkwh` double
,`jumlah_bayar` double
,`status` varchar(15)
,`id_petugas` varchar(12)
,`nama_pelanggan` varchar(50)
,`id_tarif` int(11)
,`nama_petugas` varchar(50)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tagihan`
--

CREATE TABLE `tagihan` (
  `id_tagihan` int(11) NOT NULL,
  `id_pelanggan` varchar(14) NOT NULL,
  `bulan` varchar(2) NOT NULL,
  `tahun` year(4) NOT NULL,
  `jumlah_meter` int(11) NOT NULL,
  `tarif_perkwh` double NOT NULL,
  `jumlah_bayar` double NOT NULL,
  `status` varchar(15) NOT NULL,
  `id_petugas` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tagihan`
--

INSERT INTO `tagihan` (`id_tagihan`, `id_pelanggan`, `bulan`, `tahun`, `jumlah_meter`, `tarif_perkwh`, `jumlah_bayar`, `status`, `id_petugas`) VALUES
(25, '20240726130523', '08', 2024, 2000, 1500, 3000000, 'Terbayar', 'P20180125001'),
(26, '20240726130523', '09', 2024, 1000, 1500, 1500000, 'Terbayar', 'P20180125001'),
(27, '20240726132611', '08', 2024, 2000, 750, 1500000, 'Terbayar', 'P20240726001'),
(28, '20240726132913', '08', 2024, 900, 1500, 1350000, 'Terbayar', 'P20240726001'),
(29, '20240726135049', '08', 2024, 400, 750, 300000, 'Terbayar', 'P20240726001'),
(30, '20240726135049', '09', 2024, 2600, 750, 1950000, 'Terbayar', 'P20240726001'),
(31, '20240726132913', '', 0000, 2000, 1500, 3000000, 'Belum Bayar', 'P20240726001'),
(32, '20240729112227', '08', 2024, 2000, 750, 1500000, 'Terbayar', 'P20240729001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tarif`
--

CREATE TABLE `tarif` (
  `id_tarif` int(11) NOT NULL,
  `kode_tarif` varchar(20) NOT NULL,
  `golongan` varchar(10) NOT NULL,
  `daya` varchar(10) NOT NULL,
  `tarif_perkwh` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tarif`
--

INSERT INTO `tarif` (`id_tarif`, `kode_tarif`, `golongan`, `daya`, `tarif_perkwh`) VALUES
(3, 'R3/450VA', 'R3', '450VA', 1000),
(4, 'R1/900VA', 'R1', '900VA', 1500),
(5, 'R2/450VA', 'R2', '450VA', 750),
(8, 'R2/900VA', 'R2', '900VA', 1500),
(9, 'B1/1500VA', 'B1', '1500VA', 2000),
(10, 'R3/900VA', 'R3', '900VA', 1400),
(13, 'R1/450VA', 'R1', '450VA', 1000),
(16, 'R3/1300VA', 'R3', '1300VA', 1500);

-- --------------------------------------------------------

--
-- Struktur untuk view `qw_pembayaran`
--
DROP TABLE IF EXISTS `qw_pembayaran`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `qw_pembayaran`  AS  select `pembayaran`.`id_pembayaran` AS `id_pembayaran`,`pembayaran`.`id_pelanggan` AS `id_pelanggan`,`pembayaran`.`tgl_bayar` AS `tgl_bayar`,`pembayaran`.`waktu_bayar` AS `waktu_bayar`,`pembayaran`.`bulan_bayar` AS `bulan_bayar`,`pembayaran`.`tahun_bayar` AS `tahun_bayar`,`pembayaran`.`jumlah_bayar` AS `jumlah_bayar`,`pembayaran`.`biaya_admin` AS `biaya_admin`,`pembayaran`.`total_akhir` AS `total_akhir`,`pembayaran`.`bayar` AS `bayar`,`pembayaran`.`kembali` AS `kembali`,`pembayaran`.`id_agen` AS `id_agen`,`pelanggan`.`nama` AS `nama_pelanggan`,`agen`.`nama` AS `nama_agen` from ((`pembayaran` join `pelanggan` on((`pelanggan`.`id_pelanggan` = `pembayaran`.`id_pelanggan`))) join `agen` on((`agen`.`id_agen` = `pembayaran`.`id_agen`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `qw_penggunaan`
--
DROP TABLE IF EXISTS `qw_penggunaan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `qw_penggunaan`  AS  select `penggunaan`.`id_penggunaan` AS `id_penggunaan`,`penggunaan`.`id_pelanggan` AS `id_pelanggan`,`penggunaan`.`bulan` AS `bulan`,`penggunaan`.`tahun` AS `tahun`,`penggunaan`.`meter_awal` AS `meter_awal`,`penggunaan`.`meter_akhir` AS `meter_akhir`,`penggunaan`.`tgl_cek` AS `tgl_cek`,`penggunaan`.`id_petugas` AS `id_petugas`,`pelanggan`.`nama` AS `nama_pelanggan`,`petugas`.`nama` AS `nama_petugas` from ((`penggunaan` join `pelanggan` on((`penggunaan`.`id_pelanggan` = `pelanggan`.`id_pelanggan`))) join `petugas` on((`penggunaan`.`id_petugas` = `petugas`.`id_petugas`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `qw_tagihan`
--
DROP TABLE IF EXISTS `qw_tagihan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `qw_tagihan`  AS  select `tagihan`.`id_tagihan` AS `id_tagihan`,`tagihan`.`id_pelanggan` AS `id_pelanggan`,`tagihan`.`bulan` AS `bulan`,`tagihan`.`tahun` AS `tahun`,`tagihan`.`jumlah_meter` AS `jumlah_meter`,`tagihan`.`tarif_perkwh` AS `tarif_perkwh`,`tagihan`.`jumlah_bayar` AS `jumlah_bayar`,`tagihan`.`status` AS `status`,`tagihan`.`id_petugas` AS `id_petugas`,`pelanggan`.`nama` AS `nama_pelanggan`,`pelanggan`.`id_tarif` AS `id_tarif`,`petugas`.`nama` AS `nama_petugas` from ((`tagihan` join `pelanggan` on((`pelanggan`.`id_pelanggan` = `tagihan`.`id_pelanggan`))) join `petugas` on((`petugas`.`id_petugas` = `tagihan`.`id_petugas`))) ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `agen`
--
ALTER TABLE `agen`
  ADD PRIMARY KEY (`id_agen`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indeks untuk tabel `penggunaan`
--
ALTER TABLE `penggunaan`
  ADD PRIMARY KEY (`id_penggunaan`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indeks untuk tabel `tagihan`
--
ALTER TABLE `tagihan`
  ADD PRIMARY KEY (`id_tagihan`);

--
-- Indeks untuk tabel `tarif`
--
ALTER TABLE `tarif`
  ADD PRIMARY KEY (`id_tarif`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tagihan`
--
ALTER TABLE `tagihan`
  MODIFY `id_tagihan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `tarif`
--
ALTER TABLE `tarif`
  MODIFY `id_tarif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
