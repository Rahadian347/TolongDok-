
create database tolongDok_db

use tolongDok_db

DROP TABLE IF EXISTS Dokter;
CREATE TABLE Dokter (
  DokterID VARCHAR(50) NOT NULL,
  NamaDokter TEXT NOT NULL,
  NamaOrtu TEXT NOT NULL,
  Alamat TEXT NOT NULL,
  NoKontak TEXT NOT NULL,
  Email TEXT NOT NULL,
  kualifikasi TEXT NOT NULL,
  spesialisasi TEXT NOT NULL,
  JenisKelamin TEXT NOT NULL,
  GolDarah TEXT NOT NULL,
  TanggalBergabung TEXT NOT NULL,
  PRIMARY KEY (DokterID)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Definisi Untuk table RegistrasiPatient
--
DROP TABLE IF EXISTS RegistrasiPatient;
CREATE TABLE RegistrasiPatient (
  PatientID VARCHAR(50) NOT NULL,
  NamaPatient TEXT NOT NULL,
  NamaOrtu TEXT NOT NULL,
  Alamat TEXT NOT NULL,
  NoKontak TEXT NOT NULL,
  Email TEXT NOT NULL,
  Umur INT(11) NOT NULL,
  JenisKelamin TEXT NOT NULL,
  GolDarah TEXT NOT NULL,
  Catatan TEXT NOT NULL,
  PRIMARY KEY (PatientID)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Definisi Untuk table Registrasi
--
DROP TABLE IF EXISTS Registrasi;
CREATE TABLE Registrasi (
  NamaUser VARCHAR(100) NOT NULL,
  UserPassword VARCHAR(50) NOT NULL,
  NamaLengkap VARCHAR(250) NOT NULL,
  NoKontak VARCHAR(15) NOT NULL,
  Email VARCHAR(250) NOT NULL,
  PRIMARY KEY (NamaUser)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Definisi Untuk table Ruangan
--
DROP TABLE IF EXISTS Ruangan;
CREATE TABLE Ruangan (
  NoRuangan VARCHAR(50) NOT NULL,
  TipeRuangan VARCHAR(100) NOT NULL,
  TarifRuangan INT(11) NOT NULL,
  StatusRuangan VARCHAR(100) NOT NULL,
  PRIMARY KEY (NoRuangan)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 8192
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Definisi Untuk table Layanan
--
DROP TABLE IF EXISTS Layanan;
CREATE TABLE Layanan (
  LayananID INT(11) NOT NULL AUTO_INCREMENT,
  NamaLayanan VARCHAR(250) NOT NULL,
  TanggalLayanan VARCHAR(50) NOT NULL,
  PatientID VARCHAR(50) NOT NULL,
  TarifLayanan INT(11) NOT NULL,
  PRIMARY KEY (LayananID)
)
ENGINE = INNODB
AUTO_INCREMENT = 2
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Definisi Untuk table Petugas_perawat_tbl
--
DROP TABLE IF EXISTS Petugas_perawat_tbl;
CREATE TABLE Petugas_perawat_tbl (
  ID VARCHAR(50) NOT NULL,
  Petugas_Perawat_Nama VARCHAR(250) NOT NULL,
  Kategori VARCHAR(250) NOT NULL,
  Alamat VARCHAR(250) NOT NULL,
  NoKontak VARCHAR(15) NOT NULL,
  Email VARCHAR(250) NOT NULL,
  kualifikasi VARCHAR(250) NOT NULL,
  GolDarah VARCHAR(50) NOT NULL,
  TanggalBergabung VARCHAR(50) NOT NULL,
  PRIMARY KEY (ID)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Definisi Untuk table PatientMasuk_Ruangan
--
DROP TABLE IF EXISTS PatientMasuk_Ruangan;
CREATE TABLE PatientMasuk_Ruangan (
  MasukID INT(11) NOT NULL AUTO_INCREMENT,
  PatientID VARCHAR(50) NOT NULL,
  Penyakit TEXT NOT NULL,
  NoRuangan VARCHAR(50) NOT NULL,
  TanggalMasuk TEXT NOT NULL,
  DokterID VARCHAR(50) NOT NULL,
  Catatan_Masuk TEXT NOT NULL,
  PRIMARY KEY (MasukID),
  INDEX DokterID (DokterID),
  INDEX DokterID_2 (DokterID),
  INDEX PatientID (PatientID),
  INDEX NoRuangan (NoRuangan),
  CONSTRAINT PatientMasuk_Ruangan_ibfk_1 FOREIGN KEY (PatientID)
    REFERENCES RegistrasiPatient(PatientID) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT PatientMasuk_Ruangan_ibfk_2 FOREIGN KEY (NoRuangan)
    REFERENCES Ruangan(NoRuangan) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT PatientMasuk_Ruangan_ibfk_3 FOREIGN KEY (DokterID)
    REFERENCES Dokter(DokterID) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 2
CHARACTER SET utf8
COLLATE utf8_general_ci;


--
-- Definisi Untuk table Users
--
DROP TABLE IF EXISTS Users;
CREATE TABLE Users (
  NamaUser VARCHAR(100) NOT NULL,
  UserPassword VARCHAR(50) NOT NULL,
  PRIMARY KEY (NamaUser),
  CONSTRAINT Users_ibfk_1 FOREIGN KEY (NamaUser)
    REFERENCES Registrasi(NamaUser) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Definisi Untuk table PatientKeluar_Ruangan
--
DROP TABLE IF EXISTS PatientKeluar_Ruangan;
CREATE TABLE PatientKeluar_Ruangan (
  ID INT(11) NOT NULL AUTO_INCREMENT,
  MasukID INT(11) NOT NULL,
  TanggalKeluar TEXT NOT NULL,
  Catatan_Keluar TEXT NOT NULL,
  PRIMARY KEY (ID),
  INDEX MasukID (MasukID),
  CONSTRAINT PatientKeluar_Ruangan_ibfk_1 FOREIGN KEY (MasukID)
    REFERENCES PatientMasuk_Ruangan(MasukID) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 2
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Definisi Untuk table tagihan_Ruangan
--
DROP TABLE IF EXISTS Tagihan_Ruangan;
CREATE TABLE Tagihan_Ruangan (
  NoTagihan INT(11) NOT NULL AUTO_INCREMENT,
  KeluarID INT(11) NOT NULL,
  TanggalTagihan TEXT NOT NULL,
  JumlahHari INT(11) NOT NULL,
  TarifRuangan DOUBLE NOT NULL,
  TotalTarifRuangan DOUBLE NOT NULL,
  TarifLayanan DOUBLE NOT NULL,
  TotalBiaya DOUBLE NOT NULL,
  MetodePembayaran TEXT NOT NULL,
  DetailMetodePembayaran TEXT NOT NULL,
  BiayaTerbayar DOUBLE NOT NULL,
  BiayaJatuhTempo DOUBLE NOT NULL,
  PRIMARY KEY (NoTagihan),
  INDEX KeluarID (KeluarID),
  INDEX KeluarID_2 (KeluarID),
  CONSTRAINT Tagihan_Ruangan_ibfk_1 FOREIGN KEY (KeluarID)
    REFERENCES PatientKeluar_Ruangan(ID) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 2
CHARACTER SET utf8
COLLATE utf8_general_ci;

INSERT INTO Dokter VALUES
('1', 'Rahadian', 'Permana', 'Bandung', '089515670869', 'mrahadian.permana@tolongdok.com', 'Sp.JP', 'Jantung', 'L', 'O+', '10/10/2014'),
('2', 'Irawati', 'Khoirul', 'Bandung', '0895159872661', 'irawati@tolongdok.com', 'Sp.A', 'Anak', 'P', 'AB', '10/08/2014'),
('3', 'Risna', 'Wati', 'Bogor', '62895918726171', 'risna@tolongdok.com', 'Sp.KK', 'Kelamin', 'P', 'B', '10/07/2015'),
('4', 'Anwar', 'Fuadi', 'Jakarta', '6289591828192', 'anwar@tolongdok.com', 'Sp.OG', 'Kelamin', 'L', 'B', '10/07/2015'),
('5', 'Fajar', 'Aminoto', 'Depok', '08918271821', 'fajar@tolongdok.com', 'Sp.DT', 'Kelamin', 'L', 'A-', '10/07/2015'),
('6', 'Barry', 'Juna', 'Jakarta Selatan', '081271628121', 'barry@tolongdok.com', 'Sp.EG', 'Kelamin', 'L', 'A+', '10/07/2015');
-- 
-- Dumping data untuk table RegistrasiPatient
--
INSERT INTO RegistrasiPatient VALUES
('P-1', 'Joko', 'Widodo', 'Palembang', '08765654567', 'joko@gmail.com', 23, 'L', 'A+', '');
('P-2', 'Adrian', 'Maranata', 'Bandung', '08760192817', 'adrian@gmail.com', 24, 'L', 'O+', ''),
('P-3', 'Dwi', 'Korota', 'Bandung', '08781718191', 'dwi@gmail.com', 49, 'L', 'O', ''),
('P-4', 'Rian', 'Jodi', 'Jakarta', '08791028172', 'rian@gmail.com', 61, 'L', 'AB', ''),
('P-5', 'Pamela', 'Julianti', 'Ambon', '08761928172', 'pamela@gmail.com', 52, 'P', 'A+', ''),
('P-6', 'Vanesha', 'Angel', 'Pemalang', '0891826172', 'vanesha@gmail.com', 51, 'P', 'AB+', ''),
('P-7', 'Julian', 'Adinata', 'Pemalang', '08917581721', 'julian@gmail.com', 12, 'L', 'AB-', ''),
('P-8', 'Zulkarnain', 'Faqruq', 'Madiun', '08914718212', 'zul@gmail.com',35, 'L', 'B', ''),
('P-9', 'Mohammad', 'Bakri', 'Sukoharjo', '08124581712', 'bakri@gmail.com', 56, 'L', 'B', ''),
('P-10', 'Jaka', 'Tukimin', 'Banyumas', '081391827123', 'jaka@gmail.com', 27, 'L', 'A+', ''),
('P-11', 'Junaidi', 'Hisbulah', 'Surakarta', '0815718271821', 'junaidi@gmail.com', 21, 'L', 'B', '');

-- 
-- Dumping data untuk table Registrasi
--
INSERT INTO Registrasi VALUES
('Admin_Poliklinik', '12345', 'Aden Smith', '09827858191', 'aden@gmail.com');

-- 
-- Dumping data untuk table Ruangan
--
INSERT INTO Ruangan VALUES
('101', 'Umum', 400000, 'Kosong'),
('102', 'Umum', 400000, 'Kosong'),
('103', 'Umum', 500000, 'Kosong'),
('104', 'VIP', 1200000, 'Kosong'),
('105', 'VIP', 1200000, 'Kosong'),
('106', 'VVIP', 2200000, 'Kosong');

-- 
-- Dumping data untuk table layanan
--
INSERT INTO Layanan VALUES
(1, 'Rontgen Test', '23/10/2019', 'P-1', 500000),
(2, 'EKG Test', '23/02/2019', 'P-2', 500000),
(3, 'ECG Rontgen Test', '23/02/2015', 'P-3', 500000),
(4, 'EEG Test', '23/02/2019', 'P-4', 500000),
(5, 'Dental Test', '23/02/2019', 'P-5', 500000);


-- 
-- Dumping data untuk table PatientMasuk_Ruangan
--
INSERT INTO PatientMasuk_Ruangan VALUES
(1, 'P-1', 'TBC', '101', '22/01/2019', '1', 'Lunas'),
(2, 'P-2', 'Malaria', '102', '22/01/2019', '2', 'Lunas'),
(3, 'P-3', 'Bronchitis', '101', '22/01/2019', '2', 'Lunas'),
(4, 'P-4', 'Cikungunya', '103', '22/01/2019', '3', 'Lunas'),
(5, 'P-5', 'Hepatitis A', '106', '22/01/2019', '1', 'Lunas'),
(6, 'P-6', 'Radang Tenggorokan', '104', '22/01/2019', '2', 'Lunas');

-- 
-- Dumping data untuk table Users
--
INSERT INTO Users VALUES
('admin_poliklinik', '12345');

-- 
-- Dumping data untuk table PatientKeluar_Ruangan
--
INSERT INTO PatientKeluar_Ruangan VALUES
(1, 1, '24/03/2019', 'Sehat'),
(2, 2, '12/04/2019', 'Sehat'),
(3, 3, '23/03/2019', 'Rawat Jalan'),
(4, 4, '14/03/2019', 'Rawat jalan');


-- 
-- Dumping data untuk table tagihan_Ruangan
--
-- Data akan Dikalkulasi di program --
