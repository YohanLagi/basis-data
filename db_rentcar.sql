CREATE DATABASE db_rentcar;
USE db_rentcar;

CREATE TABLE `divisi` (
  `kode_divisi` INT(11) NOT NULL,
  `nama_divisi` VARCHAR(20) NOT NULL,
  `deskripsi` TEXT NOT NULL
);
ALTER TABLE `divisi`
  ADD PRIMARY KEY (`kode_divisi`);
  
 CREATE TABLE `rentcar` (
  `id_rentcar` INT(11) NOT NULL,
  `nama_rentcar` VARCHAR(50) NOT NULL,
  `no_tlp` VARCHAR(14) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `jalan` VARCHAR(50) NOT NULL,
  `kecamatan` VARCHAR(50) NOT NULL,
  `kabupaten` VARCHAR(50) NOT NULL,
  `kode_pos` VARCHAR(5) NOT NULL
);
ALTER TABLE `rentcar`
  ADD PRIMARY KEY (`id_rentcar`);
  
CREATE TABLE `jenis_mobil` (
  `id_jenis` INT(11) NOT NULL,
  `nama_jenis` VARCHAR(20) NOT NULL,
  `deskripsi` TEXT NOT NULL
);
ALTER TABLE `jenis_mobil`
  ADD PRIMARY KEY (`id_jenis`);
  
CREATE TABLE `member` (
  `id_member` INT(11) NOT NULL,
  `nama_member` VARCHAR(20) NOT NULL,
  `deskripsi` TEXT NOT NULL
);
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_member`);
  
CREATE TABLE `merek` (
  `id_merek` INT(11) NOT NULL,
  `nama_merek` VARCHAR(20) NOT NULL,
  `deskripsi` TEXT NOT NULL
);
ALTER TABLE `merek`
  ADD PRIMARY KEY (`id_merek`);
  
CREATE TABLE `tipe_pembayaran` (
  `id_tipe_pembayaran` INT(11) NOT NULL,
  `nama_tipe` VARCHAR(20) NOT NULL
);
ALTER TABLE `tipe_pembayaran`
  ADD PRIMARY KEY (`id_tipe_pembayaran`);
  
CREATE TABLE `karyawan` (
  `id_karyawan` INT(11) NOT NULL,
  `nama_karyawan` VARCHAR(50) NOT NULL,
  `no_tlp` VARCHAR(14) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `kelamin` ENUM('laki-laki','perempuan') NOT NULL,
  `jalan` VARCHAR(50) NOT NULL,
  `kecamatan` VARCHAR(50) NOT NULL,
  `kabupaten` VARCHAR(50) NOT NULL,
  `kode_pos` INT(5) NOT NULL,
  `kode_divisi` INT(11) NOT NULL
);
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`),
  ADD KEY `kode_divisi` (`kode_divisi`);
  
CREATE TABLE `pelanggan` (
  `id_pelanggan` INT(11) NOT NULL,
  `nama_pelanggan` VARCHAR(50) NOT NULL,
  `no_tlp` VARCHAR(14) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `kelamin` ENUM('laki-laki','perempuan') NOT NULL,
  `jalan` VARCHAR(50) NOT NULL,
  `kecamatan` VARCHAR(50) NOT NULL,
  `kabupaten` VARCHAR(50) NOT NULL,
  `kode_pos` VARCHAR(5) NOT NULL,
  `id_member` INT(11) NOT NULL
);
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`),
  ADD KEY `id_member` (`id_member`);
  
CREATE TABLE `mobil` (
  `id_mobil` INT(11) NOT NULL,
  `nama_mobil` VARCHAR(50) NOT NULL,
  `plat_mobil` VARCHAR(10) NOT NULL,
  `deskripsi` TEXT NOT NULL,
  `id_jenis` INT(11) NOT NULL,
  `id_merek` INT(11) NOT NULL,
  `id_rentcar` INT(11) NOT NULL
);
ALTER TABLE `mobil`
  ADD PRIMARY KEY (`id_mobil`),
  ADD KEY `id_jenis` (`id_jenis`),
  ADD KEY `id_merek` (`id_merek`),
  ADD KEY `id_rentcar` (`id_rentcar`);
  
CREATE TABLE `sewa` (
  `id_sewa` INT(11) NOT NULL,
  `id_mobil` INT(11) NOT NULL,
  `id_pelanggan` INT(11) NOT NULL,
  `tanggal_sewa` DATE NOT NULL,
  `tanggal_kembali` DATE NOT NULL,
  `harga_sewa` DECIMAL(10,2) NOT NULL,
  `id_tipe_pembayaran` INT(11) NOT NULL,
  `id_karyawan` INT(11) NOT NULL
);
ALTER TABLE `sewa`
  ADD PRIMARY KEY (`id_sewa`),
  ADD KEY `id_mobil` (`id_mobil`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_tipe_pembayaran` (`id_tipe_pembayaran`),
  ADD KEY `fk_sewa_karyawan` (`id_karyawan`);
  
CREATE TABLE `denda` (
  `id_denda` INT(11) NOT NULL,
  `id_sewa` INT(11) NOT NULL,
  `nama_denda` VARCHAR(50) NOT NULL,
  `harga_denda` DECIMAL(10,2) NOT NULL,
  `tanggal_denda` DATE NOT NULL
);
ALTER TABLE `denda`
  ADD PRIMARY KEY (`id_denda`),
  ADD KEY `id_sewa` (`id_sewa`);
  
--
-- AUTO_INCREMENT untuk tabel `denda`
--
ALTER TABLE `denda`
  MODIFY `id_denda` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `divisi`
--
ALTER TABLE `divisi`
  MODIFY `kode_divisi` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `jenis_mobil`
--
ALTER TABLE `jenis_mobil`
  MODIFY `id_jenis` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id_karyawan` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `member`
--
ALTER TABLE `member`
  MODIFY `id_member` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `merek`
--
ALTER TABLE `merek`
  MODIFY `id_merek` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `mobil`
--
ALTER TABLE `mobil`
  MODIFY `id_mobil` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `rentcar`
--
ALTER TABLE `rentcar`
  MODIFY `id_rentcar` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `sewa`
--
ALTER TABLE `sewa`
  MODIFY `id_sewa` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tipe_pembayaran`
--
ALTER TABLE `tipe_pembayaran`
  MODIFY `id_tipe_pembayaran` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
  
--
-- Ketidakleluasaan untuk tabel `denda`
--
ALTER TABLE `denda`
  ADD CONSTRAINT `denda_ibfk_1` FOREIGN KEY (`id_sewa`) REFERENCES `sewa` (`id_sewa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD CONSTRAINT `karyawan_ibfk_1` FOREIGN KEY (`kode_divisi`) REFERENCES `divisi` (`kode_divisi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `mobil`
--
ALTER TABLE `mobil`
  ADD CONSTRAINT `mobil_ibfk_1` FOREIGN KEY (`id_merek`) REFERENCES `merek` (`id_merek`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mobil_ibfk_2` FOREIGN KEY (`id_jenis`) REFERENCES `jenis_mobil` (`id_jenis`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mobil_ibfk_3` FOREIGN KEY (`id_rentcar`) REFERENCES `rentcar` (`id_rentcar`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD CONSTRAINT `pelanggan_ibfk_1` FOREIGN KEY (`id_member`) REFERENCES `member` (`id_member`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `sewa`
--
ALTER TABLE `sewa`
  ADD CONSTRAINT `fk_sewa_karyawan` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`),
  ADD CONSTRAINT `sewa_ibfk_1` FOREIGN KEY (`id_tipe_pembayaran`) REFERENCES `tipe_pembayaran` (`id_tipe_pembayaran`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sewa_ibfk_2` FOREIGN KEY (`id_mobil`) REFERENCES `mobil` (`id_mobil`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sewa_ibfk_3` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE;


INSERT INTO `jenis_mobil` (`id_jenis`, `nama_jenis`, `deskripsi`) VALUES
(1, 'Mobil Sport', 'Mobil harga mahal.'),
(2, 'Mobil Pick Up', 'Mobil angkut barang.');

INSERT INTO `divisi` (`kode_divisi`, `nama_divisi`, `deskripsi`) VALUES
(1, 'Operasional', 'Bertanggung jawab atas operasional sehari-hari penyewaan mobil.'),
(2, 'Layanan Pelanggan', 'Menangani pertanyaan pelanggan, memberikan bantuan, dan menyelesaikan masalah atau keluhan.');

INSERT INTO `member` (`id_member`, `nama_member`, `deskripsi`) VALUES
(1, 'Kartu Member Press', 'Jenis kartu ini terbuat dari bahan baku berupa plastik PVC dengan ketebalan 0.76mm.'),
(2, 'Kartu Member Metalik', 'Bahan pembuatan kartu ini adalah plastik PVC.');

INSERT INTO `merek` (`id_merek`, `nama_merek`, `deskripsi`) VALUES
(1, 'TOYOTA', 'Produk Jepang'),
(2, 'HONDA', 'Produk Jepang');

INSERT INTO `rentcar` (`id_rentcar`, `nama_rentcar`, `no_tlp`, `email`, `jalan`, `kecamatan`, `kabupaten`, `kode_pos`) VALUES
(1, 'Cahaya', '089999911', 'cahaya@gmail.com', 'Jalan Batubulan', 'Sukawati', 'Gianyar', '6666'),
(2, 'Jaya Abadi', '08678432222', 'jaya@gmail.com', 'Jalan Abadi', 'Kesiman', 'Denpasar', '9999');

INSERT INTO `tipe_pembayaran` (`id_tipe_pembayaran`, `nama_tipe`) VALUES
(1, 'Kredit'),
(2, 'Transfer');

INSERT INTO `karyawan` (`id_karyawan`, `nama_karyawan`, `no_tlp`, `email`, `kelamin`, `jalan`, `kecamatan`, `kabupaten`, `kode_pos`, `kode_divisi`) VALUES
(1, 'Putu Mega Wati', '087654321', 'putu@gmail.com', 'perempuan', 'Jalan Batuyang', 'Sukawati', 'Gianyar', 6666, 2),
(2, 'Made Ganjar Putra', '081234567', 'ganjar@gmail.com', 'laki-laki', 'Jalan Sudirman', 'Renon', 'Denpasar', 3333, 1);

INSERT INTO `mobil` (`id_mobil`, `nama_mobil`, `plat_mobil`, `deskripsi`, `id_jenis`, `id_merek`, `id_rentcar`) VALUES
(1, 'Civic', 'DK123FT', 'Mobil anak starboy.', 1, 2, 1),
(2, 'Fortuner', 'DK666NS', 'Mobil anak skena.', 1, 1, 2);

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `no_tlp`, `email`, `kelamin`, `jalan`, `kecamatan`, `kabupaten`, `kode_pos`, `id_member`) VALUES
(1, 'Kadek Sisna Selalu Jaya', '084357655', 'sisna@gmail.com', 'laki-laki', 'Jalan Klumpu', 'Nusa Penida', 'Klungkung', '1234', 1),
(2, 'Made Yohan Putra', '08678432111', 'gede@gmail.com', 'laki-laki', 'Jalan Dewi Sri', 'Kubu', 'Bangli', '9999', 2);

INSERT INTO `sewa` (`id_sewa`, `id_mobil`, `id_pelanggan`, `tanggal_sewa`, `tanggal_kembali`, `harga_sewa`, `id_tipe_pembayaran`, `id_karyawan`) VALUES
(1, 1, 2, '2023-12-13', '2023-12-14', '200000.00', 1, 2),
(2, 2, 1, '2023-12-01', '2023-12-03', '150000.00', 2, 1);

INSERT INTO `denda` (`id_denda`, `id_sewa`, `nama_denda`, `harga_denda`, `tanggal_denda`) VALUES
(1, 1, 'Telat', '50000.00', '2023-12-14'),
(2, 2, 'Tidak ada', '0.00', '2023-12-03');
