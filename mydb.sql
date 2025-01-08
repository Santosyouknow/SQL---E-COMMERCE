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
(11, 1, 'Sultan', '081234567891'),
(22, 2, 'Andre', '081333571788'),
(33, 3, 'William', '081333571709'),
(44, 4, 'Marco', '081333571777'),
(55, 5, 'Jojo', '0813335717683'),
(66, 6, 'Kevin', '081333571890'),
(77, 7, 'Michael', '081333571891'),
(88, 8, 'David', '081333571892'),
(99, 9, 'Jessica', '081333571893'),
(100, 10, 'Sarah', '081333571894'),
(111, 11, 'Robert', '081333571895'),
(122, 12, 'Linda', '081333571896');
-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE pelanggan (
  idPelanggan int(11) NOT NULL,
  Nama_Pelanggan varchar(45) DEFAULT NULL,
  Alamat_Pelanggan varchar(255) DEFAULT NULL,
  No_Telepon_Pelanggan varchar(15) DEFAULT NULL,
  Email_Pelanggan varchar(45) DEFAULT NULL,
  idPegawai_Toko int(11) NOT NULL,  -- Kolom untuk menghubungkan pelanggan dengan pegawai
  PRIMARY KEY (idPelanggan),
  CONSTRAINT fk_idPegawai_Toko
    FOREIGN KEY (idPegawai_Toko) REFERENCES pegawai_toko(idPegawai_Toko)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Menambahkan data ke tabel pelanggan dengan idPegawai_Toko
INSERT INTO pelanggan (idPelanggan, Nama_Pelanggan, Alamat_Pelanggan, No_Telepon_Pelanggan, Email_Pelanggan, idPegawai_Toko) VALUES
(9, 'santos', 'wiyung', '081', 'santosopinaringan@gmail.com', 11),
(301, 'Andi Kusuma', 'Jl. Melati No. 7', '081333571799', 'santos@gmail.com', 22),
(302, 'Budi Santoso', 'Jl. Cempaka No. 4', '081333571792', 'rere@gmail.com', 33),
(303, 'Siti Rahmawati', 'Jl. Flamboyan No. 2', '081333571794', 'teknik@gmail.com', 44),
(304, 'Agung Pratama', 'Jl. Dahlia No. 8', '081333571765', 'yoscheer@gmail.com', 55),
(305, 'Wati Suryani', 'Jl. Mawar Putih No. 5', '081333571788', 'yoyus@gmail.com', 66),
(306, 'Woody Roundop', 'Jl. Benang Indah No. 2', '08133567990', 'woody@gmail.com', 77),
(307, 'Buzz Lightyear', 'Jl. Angkasa No. 4', '085366786577', 'buzz@gmail.com', 88),
(308, 'Denis Sangar', 'Jl. Flamboyan No. 1', '08012901382', 'denis@gmail.com', 99),
(309, 'Adit Pratama', 'Jl. Dahlia No. 8', '0821826472732', 'adit@gmail.com', 100),
(310, 'Dilan Dautang', 'Jl. Mawar Putih No. 19', '08721352782', 'dilan@gmail.com', 111);

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
(6, 'Fajar Hidayat', '08134567890'),
(7, 'Gina Lestari', '08198765432'),
(8, 'Hendra Wijaya', '08212345678'),
(9, 'Irma Kusuma', '08324567891'),
(10, 'Joko Riyadi', '08523456789'),
(11, 'Kirana Putri', '08456789123'),
(12, 'Lukman Hakim', '08567891234');

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
-- Struktur dari tabel alamat_tujuan_pengiriman
--

CREATE TABLE alamat_tujuan_pengiriman (
  idAlamat int(11) NOT NULL,
  idPelanggan int(11) NOT NULL,
  Alamat_Lengkap varchar(255) NOT NULL,
  Kota varchar(100) NOT NULL,
  Provinsi varchar(100) NOT NULL,
  Kode_Pos varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Indeks untuk tabel alamat_tujuan_pengiriman
--
ALTER TABLE alamat_tujuan_pengiriman
  ADD PRIMARY KEY (idAlamat),
  ADD KEY fk_Alamat_Pelanggan_idx (idPelanggan);

-- AUTO_INCREMENT untuk tabel alamat_tujuan_pengiriman
--
ALTER TABLE alamat_tujuan_pengiriman
  MODIFY idAlamat int(11) NOT NULL AUTO_INCREMENT;

-- Ketidakleluasaan untuk tabel alamat_tujuan_pengiriman
--
ALTER TABLE alamat_tujuan_pengiriman
  ADD CONSTRAINT fk_Alamat_Pelanggan FOREIGN KEY (idPelanggan) REFERENCES pelanggan (idPelanggan) ON DELETE CASCADE ON UPDATE CASCADE;

-- Contoh data untuk tabel alamat_tujuan_pengiriman
--
INSERT INTO alamat_tujuan_pengiriman (idAlamat, idPelanggan, Alamat_Lengkap, Kota, Provinsi, Kode_Pos) VALUES
(1, 9, 'Jl. Cendana No. 5', 'Surabaya', 'Jawa Timur', '60225'),
(2, 301, 'Jl. Mawar No. 10', 'Malang', 'Jawa Timur', '65111'),
(3, 302, 'Jl. Melati No. 7', 'Bandung', 'Jawa Barat', '40123'),
(4, 303, 'Jl. Flamboyan No. 2', 'Yogyakarta', 'DIY', '55281'),
(5, 304, 'Jl. Dahlia No. 8', 'Semarang', 'Jawa Tengah', '50135'),
(6, 305, 'Jl. Kenanga No. 3', 'Denpasar', 'Bali', '80361'),
(7, 306, 'Jl. Pelangi No. 12', 'Makassar', 'Sulawesi Selatan', '90114'),
(8, 307, 'Jl. Mawar Merah No. 8', 'Medan', 'Sumatera Utara', '20111'),
(9, 308, 'Jl. Anggrek No. 4', 'Balikpapan', 'Kalimantan Timur', '76114'),
(10, 309, 'Jl. Sakura No. 5', 'Palembang', 'Sumatera Selatan', '30137'),
(11, 310, 'Jl. Teratai No. 2', 'Pekanbaru', 'Riau', '28292');
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
(111, 11, 'Toko Berkah Jaya', 'Jl. Merdeka No.10', '0317523929', '06:55:35', '9999', '2345', 1, 'Toko Berkah Jaya'),
(222, 22, 'Toko Murah Meriah', 'Jl. Mawar No. 5', '0317523928', '11:55:35', '5555', '3456', 2, 'Toko Murah Meriah'),
(333, 33, 'Toko Hemat', 'Jl. Anggrek No. 4', '0317523927', '15:03:46', '6666', '4567', 3, 'Toko Hemat'),
(444, 44, 'Toko Sumber Rezeki', 'Jl. Kemuning No. 8', '0317523926', '14:03:46', '7777', '5678', 4, 'Toko Sumber Rezeki'),
(555, 55, 'Toko Laris Manis', 'Jl. Kenanga No. 3', '0317523925', '14:03:46', '8888', '6789', 5, 'Toko Laris Manis'),
(666, 66, 'Toko Amanah', 'Jl. Pelangi No. 2', '0317523924', '08:00:00', '1234', '7890', 6, 'Toko Amanah'),
(777, 77, 'Toko Murah Sejahtera', 'Jl. Sejahtera No. 9', '0317523923', '09:00:00', '2345', '8901', 7, 'Toko Murah Sejahtera'),
(888, 88, 'Toko Hemat Jaya', 'Jl. Surya No. 11', '0317523922', '10:00:00', '3456', '9012', 8, 'Toko Hemat Jaya'),
(999, 99, 'Toko Bahagia', 'Jl. Melati No. 7', '0317523921', '11:30:00', '4567', '0123', 9, 'Toko Bahagia'),
(1010, 100, 'Toko Prima', 'Jl. Cempaka No. 4', '0317523920', '12:30:00', '5678', '1234', 10, 'Toko Prima'),
(1111, 111, 'Toko Jaya Abadi', 'Jl. Dahlia No. 8', '0317523919', '13:00:00', '6789', '2345', 11, 'Toko Jaya Abadi'),
(1212, 122, 'Toko Sentosa', 'Jl. Anggrek No. 15', '0317523918', '14:00:00', '7890', '3456', 12, 'Toko Sentosa');

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
