-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Des 2023 pada 08.33
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `user_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `deskripsi` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `image`, `create_at`, `update_at`, `deskripsi`) VALUES
(34, 'SSD MidasForce', 350000, '/store/1702622897-b83fa6e768b1ed9b49d7a9a31d0cfced-midasforce.jpg', '2023-12-15 06:48:17', NULL, ''),
(35, 'SSD SATA', 290000, '/store/1703729232-a7e6c129ccda4a3cca99452d315777f6-sata.jpg', '2023-12-28 02:07:12', NULL, ''),
(36, 'SSD VENOM', 300000, '/store/1703729284-49b4b27eb6d607f9a9014d4f8d5d048a-ssd.jpg', '2023-12-28 02:08:04', NULL, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `service_requests`
--

CREATE TABLE `service_requests` (
  `id_pesan` int(50) NOT NULL,
  `merk` varchar(50) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `detail` text NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `token` varchar(100) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jam` varchar(20) DEFAULT NULL,
  `nama_lengkap` varchar(100) DEFAULT NULL,
  `telepon` varchar(20) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `price` int(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `service_requests`
--

INSERT INTO `service_requests` (`id_pesan`, `merk`, `foto`, `detail`, `create_at`, `token`, `tanggal`, `jam`, `nama_lengkap`, `telepon`, `status`, `price`) VALUES
(180, 'Acer', 'path/to/uploaded/files/1703735733-81a00e658151bb9b70737141472bc765-speaker tidak bunyi.jpeg', 'speaker tidak bunyi', '2023-12-28 03:55:33', '658cf1a120c09', '2023-12-28', '06.00 - 09.00', 'reffi fauzi', '088213456445', 'pending', 0),
(182, 'Asus', 'path/to/uploaded/files/1703735851-da2903a90ebac9f4231b4286a08c2713-baterai tidak mengisi.jpg', 'baterai tidak mengisi', '2023-12-28 03:57:31', '658cf20f847a2', '2023-12-29', '06.00 - 09.00', 'nizar zul islami', '088213456271', 'accepted', 0),
(183, 'Lenovo', 'path/to/uploaded/files/1703735876-c09c0989953bfa2d5c316d4365b4c2bf-keyboard tidak bisa ditekan.jpeg', 'keyboard tidak bisa ditekan', '2023-12-28 03:57:56', '658cf22b4e1d6', '2023-12-30', '06.00 - 09.00', 'amir syahrul ramadhan', '088213456271', 'sedang_proses', 125000),
(184, 'HP', 'path/to/uploaded/files/1703735910-3a80e779b74b07c1abb89ab02dec3929-port usb tidak berfugsi.jpeg', 'port usb tidak berfungsi', '2023-12-28 03:58:30', '658cf2444eb4e', '2023-12-31', '06.00 - 09.00', 'nizar zul islami', '088213456271', 'pesanan_selesai', 150000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_form`
--

CREATE TABLE `user_form` (
  `id` int(50) NOT NULL,
  `name` varchar(25) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `reset_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user_form`
--

INSERT INTO `user_form` (`id`, `name`, `email`, `password`, `user_type`, `reset_token`) VALUES
(1, 'amir', 'amir@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 'user', '487db696bafc80c981cd798f9733d7c9'),
(2, 'reffi', 'reffifauzi@gmail.com', '2fc262083f351d8413723dd136eb0ab5', 'admin', NULL),
(6, 'reffi', 'reffi@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 'user', NULL),
(7, 'anjay', 'anjay@gmail.com', 'ee11cbb19052e40b07aac0ca060c23ee', 'user', NULL),
(8, 'nizar', 'nizar@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 'admin', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `service_requests`
--
ALTER TABLE `service_requests`
  ADD PRIMARY KEY (`id_pesan`);

--
-- Indeks untuk tabel `user_form`
--
ALTER TABLE `user_form`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `service_requests`
--
ALTER TABLE `service_requests`
  MODIFY `id_pesan` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT untuk tabel `user_form`
--
ALTER TABLE `user_form`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
