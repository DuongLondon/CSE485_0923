-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 25, 2023 lúc 12:51 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `btth01_cse485`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `baiviet`
--

CREATE TABLE `baiviet` (
  `ma_bviet` int(10) UNSIGNED NOT NULL,
  `tieude` varchar(200) NOT NULL,
  `ten_bhat` varchar(100) NOT NULL,
  `ma_tloai` int(10) UNSIGNED NOT NULL,
  `tomtat` text NOT NULL,
  `noidung` text DEFAULT NULL,
  `ma_tgia` int(10) UNSIGNED NOT NULL,
  `ngayviet` datetime NOT NULL DEFAULT current_timestamp(),
  `hinhanh` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `baiviet`
--

INSERT INTO `baiviet` (`ma_bviet`, `tieude`, `ten_bhat`, `ma_tloai`, `tomtat`, `noidung`, `ma_tgia`, `ngayviet`, `hinhanh`) VALUES
(1, 'tuyetvoi', 'yeu em lam', 1, 'amazing', 'tinhyeutuoihoctro', 1, '0000-00-00 00:00:00', 'woaaaaa'),
(2, 'tuyetvoi', 'yeu em lam', 2, 'amazing', 'tinhyeutuoihoctro', 2, '0000-00-00 00:00:00', 'woaaaaa'),
(3, 'thuong nhau may nui cungtreo', 'anh yeu em', 3, 'amazing', 'tinhyeutuoihoctro', 3, '0000-00-00 00:00:00', 'woaaaaa'),
(4, 'thương nhau chin bo lam muoi', 'yeu em lam', 4, 'amazing', 'tinhyeutuoihoctro', 4, '0000-00-00 00:00:00', 'woaaaaa'),
(5, 'tuyetvoi', 'yeu em mai mai', 5, 'amazing', 'tinhyeutuoihoctro', 5, '0000-00-00 00:00:00', 'woaaaaa'),
(6, 'anh thuong em nhat ma', 'yeu em lam', 6, 'amazing', 'tinhyeutuoihoctro', 6, '0000-00-00 00:00:00', 'woaaaaa'),
(7, 'tuyetvoi', 'yeu em lam', 7, 'amazing', 'tinhyeutuoihoctro', 7, '0000-00-00 00:00:00', 'woaaaaa'),
(8, 'tuyetvoi', 'yeu em nhieu lam', 8, 'amazing', 'tinhyeutuoihoctro', 8, '0000-00-00 00:00:00', 'woaaaaa'),
(9, 'tuyetvoi', 'thuong em nhieu lam', 9, 'amazing', 'tinhyeutuoihoctro', 9, '0000-00-00 00:00:00', 'woaaaaa');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tacgia`
--

CREATE TABLE `tacgia` (
  `ma_tacgia` int(10) UNSIGNED NOT NULL,
  `ten_tacgia` varchar(100) NOT NULL,
  `hinh_tacgia` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tacgia`
--

INSERT INTO `tacgia` (`ma_tacgia`, `ten_tacgia`, `hinh_tacgia`) VALUES
(1, 'Nhacvietplus', 'tuyetvoi'),
(2, 'Zingmp3', 'tuyetvoi'),
(3, 'Ming', 'tuyetvoi'),
(4, '16Typh', 'tuyetvoi'),
(5, 'Ho Ngoc Ha', 'tuyetvoi'),
(6, 'Charlie Puth', 'tuyetvoi'),
(7, 'Taylor Swift', 'tuyetvoi'),
(8, 'Le Quyen', 'tuyetvoi'),
(9, 'Dam Vinh Hung', 'tuyetvoi'),
(10, 'Quang Le', 'tuyetvoi');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `theloai`
--

CREATE TABLE `theloai` (
  `ma_tloai` int(10) UNSIGNED NOT NULL,
  `ten_tloai` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `theloai`
--

INSERT INTO `theloai` (`ma_tloai`, `ten_tloai`) VALUES
(1, 'Nhac tru tinh'),
(2, 'Nhac cai luong'),
(3, 'Nhac do'),
(4, 'Nhac vang'),
(5, 'Nhac dan gian'),
(6, 'Nhac tinh yeu'),
(7, 'Nhac nonstop'),
(8, 'Nhac socala keo mut'),
(9, 'Nhac rap'),
(10, 'Nhac chill');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `baiviet`
--
ALTER TABLE `baiviet`
  ADD PRIMARY KEY (`ma_bviet`),
  ADD KEY `ma_tloai` (`ma_tloai`),
  ADD KEY `ma_tgia` (`ma_tgia`);

--
-- Chỉ mục cho bảng `tacgia`
--
ALTER TABLE `tacgia`
  ADD PRIMARY KEY (`ma_tacgia`);

--
-- Chỉ mục cho bảng `theloai`
--
ALTER TABLE `theloai`
  ADD PRIMARY KEY (`ma_tloai`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `baiviet`
--
ALTER TABLE `baiviet`
  ADD CONSTRAINT `baiviet_ibfk_1` FOREIGN KEY (`ma_tloai`) REFERENCES `baiviet` (`ma_bviet`),
  ADD CONSTRAINT `baiviet_ibfk_2` FOREIGN KEY (`ma_tgia`) REFERENCES `tacgia` (`ma_tacgia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
