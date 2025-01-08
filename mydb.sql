-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Jan 2025 pada 10.56
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pesanan`
--

CREATE TABLE `detail_pesanan` (
  `idDetail_Pesanan` int(11) NOT NULL,
  `Pesanan_idPesanan` int(11) NOT NULL,
  `Produk_idProduk` int(11) NOT NULL,
  `Jumlah_Produk_Pesanan` int(11) DEFAULT NULL,
  `Subtotal_Harga_Pesanan` decimal(9,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelompok`
--

CREATE TABLE `kelompok` (
  `id` int(11) NOT NULL,
  `nama` varchar(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `angkatan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kelompok`
--

INSERT INTO `kelompok` (`id`, `nama`, `kelas`, `angkatan`) VALUES
(1, 'ajax', 3, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai_toko`
--

CREATE TABLE `pegawai_toko` (
  `idPegawai_Toko` int(11) NOT NULL,
  `Pemilik_Toko` int(11) NOT NULL,
  `Nama_Pegawai_Toko` varchar(45) DEFAULT NULL,
  `No_Telepon_Pegawai_Toko` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pegawai_toko`
--

INSERT INTO `pegawai_toko` (`idPegawai_Toko`, `Pemilik_Toko`, `Nama_Pegawai_Toko`, `No_Telepon_Pegawai_Toko`) VALUES
(11, 1, 'sultan', NULL),
(22, 2, 'andre', '081333571788'),
(33, 3, 'william', '081333571709'),
(44, 4, 'marco', '081333571777'),
(55, 5, 'jojo', '0813335717683');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `idPelanggan` int(11) NOT NULL,
  `Nama_Pelanggan` varchar(45) DEFAULT NULL,
  `Alamat_Pelanggan` varchar(255) DEFAULT NULL,
  `No_Telepon_Pelanggan` varchar(15) DEFAULT NULL,
  `Email_Pelanggan` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`idPelanggan`, `Nama_Pelanggan`, `Alamat_Pelanggan`, `No_Telepon_Pelanggan`, `Email_Pelanggan`) VALUES
(9, 'santos', 'wiyung', '081', 'santosopinaringan@gmail.com'),
(301, 'Andi Kusuma', 'Jl. Melati No. 7', '081333571799', 'santos@gmail.com'),
(302, 'Budi Santoso', 'Jl. Cempaka No. 4', '081333571792', 'rere@gmail.com'),
(303, 'Siti Rahmawati', 'Jl. Flamboyan No. 2', '081333571794', 'teknik@gmail.com'),
(304, 'Agung Pratama', 'Jl. Dahlia No. 8', '081333571765', 'yoscheer@gmail.com'),
(305, 'Wati Suryani', 'Jl. Mawar Putih No. 5', '081333571788', 'yoyus@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `idPembayaran` int(11) NOT NULL,
  `Tanggal_Pembayaran` date DEFAULT NULL,
  `Metode_Pembayaran` varchar(45) DEFAULT NULL,
  `Status_Pembayaran` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`idPembayaran`, `Tanggal_Pembayaran`, `Metode_Pembayaran`, `Status_Pembayaran`) VALUES
(8, '2024-12-04', 'qris', 'done'),
(5000, '2024-12-01', 'TRANSFER BANK', 'LUNAS'),
(5001, '2024-12-01', 'TRANSFER BANK', 'LUNAS'),
(5002, '2024-12-02', 'QRIS', 'PENDING'),
(5003, '2024-12-03', 'E-WALLET', 'LUNAS'),
(5004, '2024-12-04', 'QRIS', 'MENUNGGU'),
(5005, '2024-12-05', 'TRANSFER BANK', 'LUNAS'),
(6000, '2024-12-02', 'QRIS', 'PENDING'),
(7000, '2024-12-03', 'E-WALLET', 'LUNAS'),
(8000, '2024-12-04', 'QRIS', 'MENUNGGU'),
(9000, '2024-12-05', 'TRANSFER BANK', 'LUNAS');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemilik_toko`
--

CREATE TABLE `pemilik_toko` (
  `idPemilik_Toko` int(11) NOT NULL,
  `Nama_Pemilik_Toko` varchar(45) DEFAULT NULL,
  `No_Telepon_Pemilik_Toko` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pemilik_toko`
--

INSERT INTO `pemilik_toko` (`idPemilik_Toko`, `Nama_Pemilik_Toko`, `No_Telepon_Pemilik_Toko`) VALUES
(1, 'Ahmad Subri', '08123456789'),
(2, 'Budi Santoso', '08129876543'),
(3, 'Cynthia Li', '08345678912'),
(4, 'Dewi Arini', '08167892345'),
(5, 'Eko Prasetyo', '08567890123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengiriman`
--

CREATE TABLE `pengiriman` (
  `idPengiriman` int(11) NOT NULL,
  `Nomor_Resi` varchar(45) DEFAULT NULL,
  `Tanggal_Pengiriman` date DEFAULT NULL,
  `Status_Pengiriman` varchar(45) DEFAULT NULL,
  `Kurir` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengiriman`
--

INSERT INTO `pengiriman` (`idPengiriman`, `Nomor_Resi`, `Tanggal_Pengiriman`, `Status_Pengiriman`, `Kurir`) VALUES
(2, 'jp55', '2024-12-04', 'berjalan', 'jnt');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `idPesanan` int(11) NOT NULL,
  `Pelanggan_idPelanggan` int(11) NOT NULL,
  `Pembayaran_idPembayaran` int(11) NOT NULL,
  `Pengiriman_idPengiriman` int(11) NOT NULL,
  `Tanggal_Pesanan` date DEFAULT NULL,
  `Total_Harga_Pesanan` decimal(9,0) DEFAULT NULL,
  `Status_Pesanan` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`idPesanan`, `Pelanggan_idPelanggan`, `Pembayaran_idPembayaran`, `Pengiriman_idPengiriman`, `Tanggal_Pesanan`, `Total_Harga_Pesanan`, `Status_Pesanan`) VALUES
(1, 9, 8, 2, '2024-12-02', 9001, 'y'),
(4001, 9, 5001, 2, '2024-12-01', 120, 'PROSES'),
(4002, 9, 5002, 2, '2024-12-02', 85, 'SELESAI'),
(4003, 9, 5003, 2, '2024-12-03', 90, 'DALAM PROSES'),
(4004, 9, 5004, 2, '2024-12-04', 99, 'MENUNGGU BAYAR'),
(4005, 9, 5005, 2, '2024-12-05', 55, 'SELESAI');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `idProduk` int(11) NOT NULL,
  `Toko_idToko` int(11) NOT NULL,
  `Nama_Produk` varchar(45) DEFAULT NULL,
  `Deskripsi_Produk` varchar(255) DEFAULT NULL,
  `Harga_Produk` decimal(9,0) DEFAULT NULL,
  `Jumlah_Stok_Produk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `toko`
--

CREATE TABLE `toko` (
  `idToko` int(11) NOT NULL,
  `Pegawai_Toko_idPegawai_Toko` int(11) NOT NULL,
  `Nama_Toko` varchar(255) DEFAULT NULL,
  `Alamat_Toko` varchar(255) DEFAULT NULL,
  `Nomor_Telepon_Toko` varchar(255) DEFAULT NULL,
  `Jam_Operasional_Toko` time DEFAULT NULL,
  `NPWP` varchar(255) DEFAULT NULL,
  `Rekening_Toko` varchar(255) DEFAULT NULL,
  `idPemilik` int(11) DEFAULT NULL,
  `NamaToko` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `toko`
--

INSERT INTO `toko` (`idToko`, `Pegawai_Toko_idPegawai_Toko`, `Nama_Toko`, `Alamat_Toko`, `Nomor_Telepon_Toko`, `Jam_Operasional_Toko`, `NPWP`, `Rekening_Toko`, `idPemilik`, `NamaToko`) VALUES
(111, 22, 'Toko Berkah Jaya', 'Jl. Merdeka No.10', '0317523929', '06:55:35', '9999', '2345', 1, ''),
(222, 55, 'TELKOM', 'Jl. Mawar No. 5', '0317523928', '11:55:35', '5555', '3456', 2, ''),
(333, 44, 'Toko Maju Sejahtera', 'Jl. Anggrek No. 15', '0317523927', '15:03:46', '6666', '4567', 3, ''),
(444, 11, 'Toko Sumber Rezeki', 'Jl. Kemuning No. 8', '0317523926', '14:03:46', '7777', '5678', 4, ''),
(555, 33, 'Toko Laris Manis', 'Jl. Kenanga No. 3', '0317523925', '14:03:46', '8888', '6789', 5, '');
(666, 12, 'Toko Amanah', 'Jl. Pelangi No. 2', '0317523924', '08:00:00', '1234', '7890', 6, ''),
(777, 23, 'Toko Murah Meriah', 'Jl. Sejahtera No. 9', '0317523923', '09:00:00', '2345', '8901', 7, ''),
(888, 34, 'Toko Hemat', 'Jl. Surya No. 11', '0317523922', '10:00:00', '3456', '9012', 8, ''),
(999, 45, 'Toko Bahagia', 'Jl. Melati No. 7', '0317523921', '11:30:00', '4567', '0123', 9, ''),
(1010, 56, 'Toko Prima', 'Jl. Cempaka No. 4', '0317523920', '12:30:00', '5678', '1234', 10, ''),
(1111, 13, 'Toko Jaya Abadi', 'Jl. Dahlia No. 8', '0317523919', '13:00:00', '6789', '2345', 11, ''),
(1212, 24, 'Toko Sentosa', 'Jl. Anggrek No. 15', '0317523918', '14:00:00', '7890', '3456', 12, ''),
(1313, 35, 'Toko Sukses', 'Jl. Mawar Putih No. 5', '0317523917', '15:30:00', '8901', '4567', 13, ''),
(1414, 46, 'Toko Terpercaya', 'Jl. Merpati No. 10', '0317523916', '16:00:00', '9012', '5678', 14, ''),
(1515, 57, 'Toko Mega', 'Jl. Kenanga No. 3', '0317523915', '17:00:00', '0123', '6789', 15, '');
(1616, 14, 'Toko Sejahtera', 'Jl. Mawar Merah No. 10', '0317523914', '08:30:00', '1123', '7891', 16, ''),
(1717, 25, 'Toko Bintang', 'Jl. Kenari No. 5', '0317523913', '09:15:00', '2234', '8902', 17, ''),
(1818, 36, 'Toko Galaxy', 'Jl. Sakura No. 6', '0317523912', '10:45:00', '3345', '9013', 18, ''),
(1919, 47, 'Toko Harmoni', 'Jl. Angkasa No. 9', '0317523911', '11:00:00', '4456', '0124', 19, ''),
(2020, 58, 'Toko Pelangi', 'Jl. Kemuning No. 3', '0317523910', '12:00:00', '5567', '1235', 20, ''),
(2121, 15, 'Toko Inspirasi', 'Jl. Cendana No. 2', '0317523909', '13:00:00', '6678', '2346', 21, ''),
(2222, 26, 'Toko Ceria', 'Jl. Teratai No. 12', '0317523908', '14:30:00', '7789', '3457', 22, ''),
(2323, 37, 'Toko Mandiri', 'Jl. Lili No. 8', '0317523907', '15:45:00', '8890', '4568', 23, ''),
(2424, 48, 'Toko Sumber Bahagia', 'Jl. Mawar Ungu No. 4', '0317523906', '16:15:00', '9901', '5679', 24, ''),
(2525, 59, 'Toko Nusantara', 'Jl. Bunga Matahari No. 5', '0317523905', '17:45:00', '0012', '6780', 25, '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD PRIMARY KEY (`idDetail_Pesanan`),
  ADD KEY `fk_Detail_Pesanan_Pesanan1_idx` (`Pesanan_idPesanan`),
  ADD KEY `fk_Detail_Pesanan_Produk1_idx` (`Produk_idProduk`);

--
-- Indeks untuk tabel `kelompok`
--
ALTER TABLE `kelompok`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pegawai_toko`
--
ALTER TABLE `pegawai_toko`
  ADD PRIMARY KEY (`idPegawai_Toko`),
  ADD KEY `fk_Pegawai_Toko_Pemilik_Toko_idx` (`Pemilik_Toko`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`idPelanggan`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`idPembayaran`);

--
-- Indeks untuk tabel `pemilik_toko`
--
ALTER TABLE `pemilik_toko`
  ADD PRIMARY KEY (`idPemilik_Toko`);

--
-- Indeks untuk tabel `pengiriman`
--
ALTER TABLE `pengiriman`
  ADD PRIMARY KEY (`idPengiriman`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`idPesanan`),
  ADD KEY `fk_Pesanan_Pelanggan1_idx` (`Pelanggan_idPelanggan`),
  ADD KEY `fk_Pesanan_Pembayaran1_idx` (`Pembayaran_idPembayaran`),
  ADD KEY `fk_Pesanan_Pengiriman1_idx` (`Pengiriman_idPengiriman`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`idProduk`),
  ADD KEY `fk_Produk_Toko1_idx` (`Toko_idToko`);

--
-- Indeks untuk tabel `toko`
--
ALTER TABLE `toko`
  ADD PRIMARY KEY (`idToko`),
  ADD KEY `fk_Toko_Pegawai_Toko1_idx` (`Pegawai_Toko_idPegawai_Toko`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  MODIFY `idDetail_Pesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `kelompok`
--
ALTER TABLE `kelompok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD CONSTRAINT `fk_Detail_Pesanan_Pesanan1` FOREIGN KEY (`Pesanan_idPesanan`) REFERENCES `pesanan` (`idPesanan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Detail_Pesanan_Produk1` FOREIGN KEY (`Produk_idProduk`) REFERENCES `produk` (`idProduk`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `pegawai_toko`
--
ALTER TABLE `pegawai_toko`
  ADD CONSTRAINT `fk_Pegawai_Toko_Pemilik_Toko` FOREIGN KEY (`Pemilik_Toko`) REFERENCES `pemilik_toko` (`idPemilik_Toko`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `fk_Pesanan_Pelanggan1` FOREIGN KEY (`Pelanggan_idPelanggan`) REFERENCES `pelanggan` (`idPelanggan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pesanan_Pembayaran1` FOREIGN KEY (`Pembayaran_idPembayaran`) REFERENCES `pembayaran` (`idPembayaran`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pesanan_Pengiriman1` FOREIGN KEY (`Pengiriman_idPengiriman`) REFERENCES `pengiriman` (`idPengiriman`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `fk_Produk_Toko1` FOREIGN KEY (`Toko_idToko`) REFERENCES `toko` (`idToko`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `toko`
--
ALTER TABLE `toko`
  ADD CONSTRAINT `fk_Toko_Pegawai_Toko1` FOREIGN KEY (`Pegawai_Toko_idPegawai_Toko`) REFERENCES `pegawai_toko` (`idPegawai_Toko`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
