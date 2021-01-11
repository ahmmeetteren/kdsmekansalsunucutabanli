-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3308
-- Üretim Zamanı: 11 Oca 2021, 11:18:54
-- Sunucu sürümü: 8.0.18
-- PHP Sürümü: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `xddddddddddd`
--

DELIMITER $$
--
-- Yordamlar
--
DROP PROCEDURE IF EXISTS `1000uzeriMaasalanlar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `1000uzeriMaasalanlar` ()  NO SQL
SELECT CONCAT(personel.per_ad,personel.per_soyad) as adSoyad, personel.per_maas
FROM personel
WHERE personel.per_maas>1000$$

DROP PROCEDURE IF EXISTS `10uzeriBasariliGorev`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `10uzeriBasariliGorev` ()  NO SQL
SELECT CONCAT(personel.per_ad," ",personel.per_soyad) as adSoyad, personel.basarili_gorev
FROM personel
WHERE personel.basarili_gorev>10$$

DROP PROCEDURE IF EXISTS `20gunUzeriCalisma`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `20gunUzeriCalisma` ()  NO SQL
SELECT CONCAT(personel.per_ad," ",personel.per_soyad) as adSoyad, personel.calisilanGun
FROM personel
WHERE personel.calisilanGun>20$$

DROP PROCEDURE IF EXISTS `ahmetEreninMusterileri`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ahmetEreninMusterileri` ()  NO SQL
SELECT CONCAT(musteriler.mus_ad," ",musteriler.mus_soyad) as musteriADSOYAD
FROM musteriler, personel
WHERE musteriler.per_id=personel.per_id AND personel.per_ad="Ahmet Eren"$$

DROP PROCEDURE IF EXISTS `musteriEkle`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `musteriEkle` (IN `musID` INT(11), IN `perID` INT(11), IN `musAD` VARCHAR(255), IN `musSOYAD` VARCHAR(255))  NO SQL
INSERT INTO musteriler(mus_id,per_id,mus_ad,mus_soyad)
VALUES(musID,perID,musAD,musSOYAD)$$

DROP PROCEDURE IF EXISTS `musteriGuncelle(ID'ye Göre)`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `musteriGuncelle(ID'ye Göre)` (IN `musID` INT(11), IN `perID` INT(11), IN `AD` VARCHAR(255), IN `SOYAD` VARCHAR(255))  NO SQL
UPDATE musteriler SET mus_ad=AD, mus_soyad=SOYAD, per_id=perID WHERE musteri_id=ID$$

DROP PROCEDURE IF EXISTS `musteriSil(ID'ye Göre)`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `musteriSil(ID'ye Göre)` (IN `ID` INT(11))  NO SQL
DELETE FROM musteriler WHERE mus_id=ID$$

DROP PROCEDURE IF EXISTS `personelEKLE`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `personelEKLE` (IN `perID` INT(11), IN `perAD` VARCHAR(255), IN `perSOYAD` VARCHAR(255), IN `basariliGOREV` INT(11), IN `perMAAS` INT(11), IN `calisilanGUN` INT(11))  NO SQL
INSERT INTO personel(per_id,per_ad,per_soyad,basarili_gorev,per_maas,calisilanGun)
VALUES(perID,perAD,perSOYAD,basariliGOREV,perMAAS,calisilanGUN)$$

DROP PROCEDURE IF EXISTS `personelSIL(ID'ye GORE)`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `personelSIL(ID'ye GORE)` (IN `ID` INT(11))  NO SQL
DELETE FROM personel WHERE per_id=ID$$

DROP PROCEDURE IF EXISTS `verimlilik20Asagisi`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `verimlilik20Asagisi` ()  NO SQL
SELECT CONCAT(personel.per_ad," ",personel.per_soyad) as adSoyad, puan.verimlilik_puan
FROM personel, puan
WHERE personel.per_id = puan.per_id AND puan.verimlilik_puan<20$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `aylar`
--

DROP TABLE IF EXISTS `aylar`;
CREATE TABLE IF NOT EXISTS `aylar` (
  `ay_id` int(11) NOT NULL,
  `ay_ad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`ay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `aylar`
--

INSERT INTO `aylar` (`ay_id`, `ay_ad`) VALUES
(1, 'Ocak 2020'),
(2, 'Şubat 2020'),
(3, 'Mart 2020'),
(4, 'Nisan 2020'),
(5, 'Mayıs 2020'),
(6, 'Haziran 2020'),
(7, 'Temmuz 2020'),
(8, 'Ağustos 2020'),
(9, 'Eylül 2020'),
(10, 'Ekim 2020'),
(11, 'Kasım 2020'),
(12, 'Aralık 2020');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `departmanlar`
--

DROP TABLE IF EXISTS `departmanlar`;
CREATE TABLE IF NOT EXISTS `departmanlar` (
  `dep_id` int(11) NOT NULL,
  `dep_ad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`dep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `departmanlar`
--

INSERT INTO `departmanlar` (`dep_id`, `dep_ad`) VALUES
(100, 'Finans'),
(101, 'Front-End'),
(102, 'Back-End');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `dep_ay`
--

DROP TABLE IF EXISTS `dep_ay`;
CREATE TABLE IF NOT EXISTS `dep_ay` (
  `dep_id` int(11) NOT NULL,
  `ay_id` int(11) NOT NULL,
  `kar` int(11) NOT NULL,
  KEY `dep_id` (`dep_id`),
  KEY `ay_id` (`ay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `dep_ay`
--

INSERT INTO `dep_ay` (`dep_id`, `ay_id`, `kar`) VALUES
(100, 1, 1000),
(100, 2, 4000),
(100, 3, 3000),
(101, 1, 3000),
(101, 2, 2000),
(101, 3, 4000),
(102, 1, 3000),
(102, 2, 2000),
(102, 3, 5000),
(100, 4, 1000),
(101, 4, 1000),
(102, 4, 2000),
(100, 5, 2000),
(101, 5, 2000),
(102, 5, 2000),
(100, 6, 500),
(101, 6, 500),
(102, 6, 2000),
(100, 7, 2000),
(101, 7, 3000),
(102, 7, 1000),
(100, 8, 1500),
(101, 8, 3500),
(102, 8, 6000),
(100, 9, 3200),
(101, 9, 2300),
(102, 9, 1200),
(100, 10, 1250),
(101, 10, 3150),
(102, 10, 2300),
(100, 11, 1200),
(101, 11, 1120),
(102, 11, 3210),
(100, 12, 1220),
(101, 12, 3100),
(102, 12, 4100);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `musteriler`
--

DROP TABLE IF EXISTS `musteriler`;
CREATE TABLE IF NOT EXISTS `musteriler` (
  `mus_id` int(11) NOT NULL,
  `per_id` int(11) NOT NULL,
  `mus_ad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `mus_soyad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `degerlendirme` int(11) NOT NULL,
  PRIMARY KEY (`mus_id`),
  KEY `per_id` (`per_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `musteriler`
--

INSERT INTO `musteriler` (`mus_id`, `per_id`, `mus_ad`, `mus_soyad`, `degerlendirme`) VALUES
(1, 1, 'Burak', 'Yelken', 7),
(2, 2, 'Yaşar', 'Sarı', 8),
(3, 3, 'Kılıç', 'Aslan', 5);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `personel`
--

DROP TABLE IF EXISTS `personel`;
CREATE TABLE IF NOT EXISTS `personel` (
  `per_id` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `per_ad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `per_soyad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `basarili_gorev` int(11) NOT NULL,
  `basarisiz_gorev` int(11) NOT NULL,
  `per_maas` int(11) NOT NULL,
  `calisilanGun` int(11) NOT NULL,
  PRIMARY KEY (`per_id`),
  KEY `dep_id` (`dep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `personel`
--

INSERT INTO `personel` (`per_id`, `dep_id`, `per_ad`, `per_soyad`, `basarili_gorev`, `basarisiz_gorev`, `per_maas`, `calisilanGun`) VALUES
(1, 102, 'Tayfun', 'Kaya', 20, 8, 2500, 310),
(2, 101, 'Arda Batur', 'Şen', 20, 2, 4000, 310),
(3, 100, 'Mustafa', 'Şen', 30, 1, 5000, 350);

--
-- Tetikleyiciler `personel`
--
DROP TRIGGER IF EXISTS `verimlilikPuan`;
DELIMITER $$
CREATE TRIGGER `verimlilikPuan` AFTER INSERT ON `personel` FOR EACH ROW INSERT INTO puan(per_id, verimlilik_puan) VALUES(new.per_id, (new.calisilanGun+(select personel.basarili_gorev/personel.basarisiz_gorev FROM personel WHERE personel.per_id = new.per_id)*20)/10)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `puan`
--

DROP TABLE IF EXISTS `puan`;
CREATE TABLE IF NOT EXISTS `puan` (
  `per_id` int(11) NOT NULL,
  `verimlilik_puan` int(11) NOT NULL,
  KEY `per_id` (`per_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `puan`
--

INSERT INTO `puan` (`per_id`, `verimlilik_puan`) VALUES
(1, 36),
(2, 51),
(3, 95);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yoneticiler`
--

DROP TABLE IF EXISTS `yoneticiler`;
CREATE TABLE IF NOT EXISTS `yoneticiler` (
  `yon_id` int(11) NOT NULL,
  `yon_ad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `yon_soyad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `dep_id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `sifre` int(11) NOT NULL,
  `avatar` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`yon_id`),
  KEY `dep_id` (`dep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `yoneticiler`
--

INSERT INTO `yoneticiler` (`yon_id`, `yon_ad`, `yon_soyad`, `dep_id`, `email`, `sifre`, `avatar`) VALUES
(10, 'Faruk', 'Yılmaz', 100, 'farukyilmaz', 1234, 'img/faruk.jpg'),
(11, 'Ahmet Eren', 'Yılmaz', 102, 'ahmeterenyilmaz', 12345, 'img/ahmet.jpg'),
(12, 'Meltem', 'Uzun', 101, 'meltemuzun', 123, 'img/meltem.jpg');

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `dep_ay`
--
ALTER TABLE `dep_ay`
  ADD CONSTRAINT `dep_ay_ibfk_1` FOREIGN KEY (`dep_id`) REFERENCES `departmanlar` (`dep_id`),
  ADD CONSTRAINT `dep_ay_ibfk_2` FOREIGN KEY (`ay_id`) REFERENCES `aylar` (`ay_id`);

--
-- Tablo kısıtlamaları `musteriler`
--
ALTER TABLE `musteriler`
  ADD CONSTRAINT `musteriler_ibfk_1` FOREIGN KEY (`per_id`) REFERENCES `personel` (`per_id`);

--
-- Tablo kısıtlamaları `personel`
--
ALTER TABLE `personel`
  ADD CONSTRAINT `personel_ibfk_1` FOREIGN KEY (`dep_id`) REFERENCES `departmanlar` (`dep_id`);

--
-- Tablo kısıtlamaları `puan`
--
ALTER TABLE `puan`
  ADD CONSTRAINT `puan_ibfk_1` FOREIGN KEY (`per_id`) REFERENCES `personel` (`per_id`);

--
-- Tablo kısıtlamaları `yoneticiler`
--
ALTER TABLE `yoneticiler`
  ADD CONSTRAINT `yoneticiler_ibfk_1` FOREIGN KEY (`dep_id`) REFERENCES `departmanlar` (`dep_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
