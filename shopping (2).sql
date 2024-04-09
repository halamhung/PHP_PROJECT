-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 19, 2023 lúc 11:24 AM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shopping`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_accounts`
--

CREATE TABLE `tbl_accounts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phoneNumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_create_id` int(11) NOT NULL,
  `actived` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_accounts`
--

INSERT INTO `tbl_accounts` (`id`, `name`, `username`, `password`, `password_text`, `address`, `phoneNumber`, `email`, `salt`, `user_create_id`, `actived`, `created_at`, `updated_at`) VALUES
(15, 'Võ Khánh Duy', 'zzskillzzz', '$2y$10$kQh2T3EgN1Fo.dhmFCbIFuPEvsWXXVfa5mCPmHhhUxgb2cKeo87ea', '1', '', '', '', '', 0, 0, '2023-11-12 15:31:17', '0000-00-00 00:00:00'),
(18, 'Võ Khánh Duy 2', 'zzskillzzzz', '$2y$10$FiDePLWtdDSb0w.0oQl2L.U1PIH8pLvTTwvU9SEhg0b.KaMkw3IW.', '123', '', '', '', '', 0, 0, '2023-11-14 23:15:42', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `publish` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `username`, `password`, `fullname`, `publish`) VALUES
(1, 'admin', '$2y$10$TIUHEs/hMyapyI.rJJzL7u15Z5hvqqYWVF9FW8L0XPv7F1lGoeLFC', 'Võ Khánh Duy', 1),
(2, 'admin2', '$2y$10$kKBE7GPEAtYPSehWtPLjDO1qIRrxsUpRXzYc2/CWdlRl5vgRaY5mu', 'Võ Khánh Duy', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parentID` int(11) NOT NULL,
  `publish` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `slug`, `type`, `name`, `parentID`, `publish`, `created_at`, `updated_at`) VALUES
(1, 'iphone', 1, 'Iphone', 0, 1, '2023-11-11 00:33:08', '0000-00-00 00:00:00'),
(2, 'sam-sung', 1, 'Sam sung', 0, 1, '2023-11-11 01:04:16', '0000-00-00 00:00:00'),
(3, 'xiaomi', 1, 'Xiaomi', 0, 1, '2023-11-12 22:56:44', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_contact`
--

CREATE TABLE `tbl_contact` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_contact`
--

INSERT INTO `tbl_contact` (`id`, `email`, `created_at`) VALUES
(1, 'vkduy240398@gmail.com', '2023-11-18 23:20:42'),
(2, 'vkduy240398@gmail.com', '2023-11-18 23:21:29'),
(3, 'vkduy240398@gmail.com', '2023-11-18 23:23:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cateID` int(11) NOT NULL,
  `parentID` int(11) NOT NULL,
  `publish` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_menu`
--

INSERT INTO `tbl_menu` (`id`, `name`, `url`, `cateID`, `parentID`, `publish`, `sort`, `type`) VALUES
(1, 'Sản phẩm', '', 0, 0, 1, 0, 0),
(2, 'Iphone', 'Array', 1, 1, 1, 0, 1),
(3, 'Trang chủ', '', 0, 0, 1, 0, 0),
(4, 'Sam sung', 'Array', 2, 1, 1, 0, 1),
(5, 'Xiaomi', 'Array', 3, 1, 1, 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_module`
--

CREATE TABLE `tbl_module` (
  `id` int(11) NOT NULL,
  `parentID` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `controller` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `publish` tinyint(4) NOT NULL,
  `sort` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_module`
--

INSERT INTO `tbl_module` (`id`, `parentID`, `name`, `link`, `controller`, `icon`, `publish`, `sort`, `created_at`, `updated_at`) VALUES
(1, 0, 'Quản lý sản phẩm', '', '', '<i class=\"fas fa-user-shield\"></i>', 1, 1, '2023-11-11 00:23:55', '0000-00-00 00:00:00'),
(2, 1, 'Danh mục', 'cpanel/category/index', 'category', '<i class=\"fas fa-user-shield\"></i>', 1, 2, '2023-11-11 00:24:27', '0000-00-00 00:00:00'),
(3, 0, 'Quản lý module', 'cpanel/module/index', 'module', '<i class=\"fas fa-user-shield\"></i>', 1, 3, '2023-11-11 00:28:14', '0000-00-00 00:00:00'),
(4, 1, 'Sản phẩm', 'cpanel/product/index', 'product', '<i class=\"fas fa-user-shield\"></i>', 1, 4, '2023-11-11 00:29:23', '0000-00-00 00:00:00'),
(5, 0, 'Quản lý admin', 'cpanel/admin/index', 'admin', '<i class=\"fas fa-user-shield\"></i>', 1, 5, '2023-11-11 00:31:14', '0000-00-00 00:00:00'),
(6, 0, 'Quản lý menu', 'cpanel/menu/index', 'menu', '<i class=\"fas fa-user-shield\"></i>', 1, 6, '2023-11-11 00:31:38', '0000-00-00 00:00:00'),
(7, 0, 'Quản lý đơn hàng', 'cpanel/order/index', 'order', '<i class=\"fas fa-user-shield\"></i>', 1, 7, '2023-11-13 21:49:36', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_orders`
--

CREATE TABLE `tbl_orders` (
  `id` int(11) NOT NULL,
  `accountId` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_orders`
--

INSERT INTO `tbl_orders` (`id`, `accountId`, `address`, `phone`, `email`, `note`, `total`, `created_at`) VALUES
(49, 15, 'Số 22 Hàng Gai, Phường Hàng Gai, Quận Hoàn Kiếm, Thành phố Hà Nội', '0982824398', 'vkduy240398@gmail.com', 'asdsad á', 6980000, '2023-11-13 21:35:37'),
(50, 15, '22 Hàng Gai, Hàng Đào, Hoàn Kiếm, Hà Nội, Việt Nam', '0982824398', 'vkduy240398@gmail.com', 'asd sdasd asd sa', 89600000, '2023-11-13 21:37:19'),
(52, 18, 'Đình Phú Lạc,  phường Bình Lợi,  quận Bình Chánh,  thành phố Hồ Chí Minh', '0982824398', 'vkduy240398@gmail.com', 'Boom hàng', 92700000, '2023-11-14 23:40:15'),
(53, 18, 'Đình Phú Lạc,  phường Bình Lợi,  quận Bình Chánh,  thành phố Hồ Chí Minh', '0982824398', 'vkduy240398@gmail.com', '465454', 110200000, '2023-11-14 23:46:39'),
(54, 15, 'Đình Phú Lạc,  phường Bình Lợi,  quận Bình Chánh,  thành phố Hồ Chí Minh', '0982824398', 'vkduy240398@gmail.com', 'ádasd', 37390000, '2023-11-18 23:17:06'),
(55, 15, 'Đình Phú Lạc,  phường Bình Lợi,  quận Bình Chánh,  thành phố Hồ Chí Minh', '0982824398', 'vkduy240398@gmail.com', 'fsedfesdf', 19800000, '2023-11-19 00:40:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order_detail`
--

CREATE TABLE `tbl_order_detail` (
  `id` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_order_detail`
--

INSERT INTO `tbl_order_detail` (`id`, `orderId`, `productId`, `price`, `qty`) VALUES
(55, 49, 18, 3490000, 2),
(56, 50, 8, 18900000, 2),
(57, 50, 10, 25900000, 2),
(63, 52, 14, 30900000, 3),
(64, 53, 8, 18900000, 3),
(65, 53, 13, 13500000, 1),
(66, 53, 11, 20000000, 2),
(67, 54, 17, 14900000, 1),
(68, 54, 12, 22490000, 1),
(69, 55, 16, 19800000, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_photo`
--

CREATE TABLE `tbl_photo` (
  `id` int(11) NOT NULL,
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `thumb` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `productID` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_photo`
--

INSERT INTO `tbl_photo` (`id`, `uuid`, `image`, `thumb`, `productID`, `created_at`) VALUES
(1, '5963fd94-7ed0-482a-baef-84dd2c209b86', 'public/uploads/images/product/detail/5963fd94-7ed0-482a-baef-84dd2c209b86-XS4VMrtmBJTFZiDsjf2HRzhQPy0du5aDNE8L1Ogwoklc6eq9nAU7CY3bKxGvW.jpg', 'public/uploads/images/product/detail/thumb/5963fd94-7ed0-482a-baef-84dd2c209b86-i5wHWClSUzFRYXg4NuBGesEmxVyQ6JfLcP2vkr81ZajqDn9A3TMo0DdhbKOt7.jpg', 1, '2023-11-11 00:44:08'),
(2, '03d077c6-36f1-429a-b162-42ec29593a25', 'public/uploads/images/product/detail/03d077c6-36f1-429a-b162-42ec29593a25-mDdKysq51nX6ae0SJrN8FLfvtkcO9gWPEDGbVuhR7CZ3AzwBoTMl4jUQ2YxHi.jpg', 'public/uploads/images/product/detail/thumb/03d077c6-36f1-429a-b162-42ec29593a25-fPgik9A4KE21Ld0VOhmDRByQUYXsquSrnWc3GaN6TDxewM8jHlZzt7FvoJC5b.jpg', 2, '2023-11-11 00:51:04'),
(3, '1a9f77f6-027d-4f98-b62f-22190ac318e6', 'public/uploads/images/product/detail/1a9f77f6-027d-4f98-b62f-22190ac318e6-Mng7oz24TmDerHxyaASiVuQ6EDK9swb1cCkXULB5OJ8N3vqZFt0WfldhGRjYP.jpg', 'public/uploads/images/product/detail/thumb/1a9f77f6-027d-4f98-b62f-22190ac318e6-sMZDPVdlX18bq3EQBungSi9aYFfGxHJUmLNezoCRjt5wAD24ky6hvOWr0K7cT.jpg', 2, '2023-11-11 00:51:05'),
(4, 'bc910c6d-cae5-44a9-982f-59306ada3294', 'public/uploads/images/product/detail/bc910c6d-cae5-44a9-982f-59306ada3294-AfMVrdmhQGz3WvE9gPiZ5KxDuCe16lb8qSoNHUaYj7RDOT04tJc2wByLXnkFs.jpg', 'public/uploads/images/product/detail/thumb/bc910c6d-cae5-44a9-982f-59306ada3294-x3UQoEkeaCv9Pm8r1TYz6Wl7nDMuSdtj5G4s2Bw0KcAVhZNHFRgiOqLJbyXfD.jpg', 3, '2023-11-11 00:57:06'),
(5, '82318cfe-2428-4d74-9c47-487ae2095e4a', 'public/uploads/images/product/detail/82318cfe-2428-4d74-9c47-487ae2095e4a-5zR1uKd4leH0qEY9rC2fLA7kn3gQJv6hZoxV8jFwUcbBytPSmNiOsGTDWaDMX.jpg', 'public/uploads/images/product/detail/thumb/82318cfe-2428-4d74-9c47-487ae2095e4a-DqwDPmsykVaOUu2fojZt4gS7HWCB9QMYlhdi0XNGTKbJ8Ae5LRznF3vrExc16.jpg', 3, '2023-11-11 00:57:11'),
(6, 'c071398e-4214-4a42-9dee-38707ae57290', 'public/uploads/images/product/detail/c071398e-4214-4a42-9dee-38707ae57290-DNe6vZWoHf3CgT9t4lqm0b8PjsLrnhGY5zUSMAkuaRJEXyi7QcKxOB2dDwF1V.png', 'public/uploads/images/product/detail/thumb/c071398e-4214-4a42-9dee-38707ae57290-BbYPox8UsOj7e4Z6DGucwSNg0mahTfk1KdE92JRAVLFWl5HqzQM3nivryXtDC.png', 4, '2023-11-11 00:57:51'),
(7, 'c999b47c-63f0-48e0-b2e4-b4a3da636005', 'public/uploads/images/product/detail/c999b47c-63f0-48e0-b2e4-b4a3da636005-2Oa7stT8RN5Zqhl3y6wzGrEnJoAmHeKixDWBvCDugYQ9M04UjF1cSPVXdbfLk.jpg', 'public/uploads/images/product/detail/thumb/c999b47c-63f0-48e0-b2e4-b4a3da636005-9deBlVMrYT0zEN1gGiJ2FUQxL57AC6tmoDPfbyhSXW4HDkv8RZjsuwOncKqa3.jpg', 4, '2023-11-11 00:58:02'),
(8, '2a8e11d5-c803-4d67-9c53-98b76fbb4a23', 'public/uploads/images/product/detail/2a8e11d5-c803-4d67-9c53-98b76fbb4a23-PyDL90Mco3zHGJ6kuU4VmYvb5FOr8Aj2SwNnXlKxhtdBfqEiD7QW1aTZsgeRC.png', 'public/uploads/images/product/detail/thumb/2a8e11d5-c803-4d67-9c53-98b76fbb4a23-3BSjiY1Eu9NaHULKqXotD0xJWcR5OMzwTr7ynCAs6bGmPvfQgl4eFkD82dhVZ.png', 4, '2023-11-11 00:58:02'),
(9, '52ece38c-76a6-410f-9e7b-cbd324038ab1', 'public/uploads/images/product/detail/52ece38c-76a6-410f-9e7b-cbd324038ab1-z8OtJA7wr9ciLaqKHMFSDek6ZBRWn4x1lV0fdouTXENhGQsU5vDjbPm3y2CYg.jpg', 'public/uploads/images/product/detail/thumb/52ece38c-76a6-410f-9e7b-cbd324038ab1-B58MukCalSAreUQYtoJ6Z4dvyPWDXcqmHV1nh0iDz37bK2LsxwRjgOfTFG9NE.jpg', 5, '2023-11-11 00:58:48'),
(10, '50c1e64a-1ffd-47a6-ac84-d3c9813ad2b7', 'public/uploads/images/product/detail/50c1e64a-1ffd-47a6-ac84-d3c9813ad2b7-Kk9z5CZbYU71NtceBwnG8yMuaL3VhFQijJPrOoAW0qED6vgd2THXR4mlsSfDx.jpg', 'public/uploads/images/product/detail/thumb/50c1e64a-1ffd-47a6-ac84-d3c9813ad2b7-YNS4zEkqDHTFQ2Zx9Wrg7GjPoaheCmisDOyvR1VlXBfdUuLMJw53bnAtKc806.jpg', 6, '2023-11-11 01:00:35'),
(13, '6095c361-1456-429e-af0d-84fecac50fa8', 'public/uploads/images/product/detail/6095c361-1456-429e-af0d-84fecac50fa8-UGFj5u79TblJQofAzD1iZ2ncCsDw0BM6VRmarqdvtK43WhSgPeNkLyYHXxO8E.jpg', 'public/uploads/images/product/detail/thumb/6095c361-1456-429e-af0d-84fecac50fa8-MFTBt3yZUgHwVdvjGQ64YSEr7L9sOKuNkblfqAn5DP2z1DCmo0Ji8ecRhxWXa.jpg', 7, '2023-11-11 01:05:04'),
(14, '108649dc-381e-4e2a-af9d-b2bad267e1f0', 'public/uploads/images/product/detail/108649dc-381e-4e2a-af9d-b2bad267e1f0-ngX14EWMjDO5NrPDyZGzbC6QAaFV8tdviw03kB9RcxmKsuHohql7SeULYT2Jf.jpg', 'public/uploads/images/product/detail/thumb/108649dc-381e-4e2a-af9d-b2bad267e1f0-Dr5zTdLOWQmH3VgnGba4fJtMAqsUl7YxBNPv0FC16yRXuS2EDw8choZeKji9k.jpg', 8, '2023-11-12 22:12:42'),
(15, '7ad8736c-4b36-4b27-93a1-b217361da768', 'public/uploads/images/product/detail/7ad8736c-4b36-4b27-93a1-b217361da768-DgJLrGjWsRia3Qz9XTUvAK8lymYFqkZ7Hoe2uwtOP1Nh40BSVbD6MfxnCdE5c.jpg', 'public/uploads/images/product/detail/thumb/7ad8736c-4b36-4b27-93a1-b217361da768-ag8E5JTCQBiz3Zlh7VPqSU9XjsM0tRDdwAHNybmLvoKOukDnFYcW61fe24Grx.jpg', 8, '2023-11-12 22:12:42'),
(16, 'b4c7ebae-b5f6-493a-b436-c8b2c91d2a24', 'public/uploads/images/product/detail/b4c7ebae-b5f6-493a-b436-c8b2c91d2a24-CJXlh3qFTy0dgmsHb6OUvfYA8SxWwQEr1NkDKjPDaMnGZ2R4VioB9L7ztc5eu.jpg', 'public/uploads/images/product/detail/thumb/b4c7ebae-b5f6-493a-b436-c8b2c91d2a24-41yE2zBeHDXdCV9WUDRZkurlvm3PwQcfoJnai7AS0jtLbYq8KgO56MNsGxFhT.jpg', 8, '2023-11-12 22:12:42'),
(17, '4e31f2ea-4abe-4ce6-adb4-c92ad63fe430', 'public/uploads/images/product/detail/4e31f2ea-4abe-4ce6-adb4-c92ad63fe430-eOWxhP1tygJBXLbCZ0NrmASDUERzHDiQGqlwd9oMKkafs82cTVjFu7n3Y6v54.jpg', 'public/uploads/images/product/detail/thumb/4e31f2ea-4abe-4ce6-adb4-c92ad63fe430-1Q8LAabOUFN9MmyDJZwSPrvdslGuh4zXWqV2E5txCRnHekgBc3KioY76T0jfD.jpg', 8, '2023-11-12 22:12:42'),
(18, 'c495e7f8-736e-4dd8-bd5a-52d8b109307f', 'public/uploads/images/product/detail/c495e7f8-736e-4dd8-bd5a-52d8b109307f-m12Eg6YcySbDACnJoW3hZQfRxFG50derUPqNvTzXwHKiau8DVBMltOs4k7L9j.jpg', 'public/uploads/images/product/detail/thumb/c495e7f8-736e-4dd8-bd5a-52d8b109307f-DYg5vPDkiULC6WQfAN3Em19Zdyr08bOsBntoSH2McluxwRKXhaGF7eJzjV4qT.jpg', 9, '2023-11-12 22:27:08'),
(19, '3a54473a-d446-4541-aa88-9a5303d60600', 'public/uploads/images/product/detail/3a54473a-d446-4541-aa88-9a5303d60600-fwsdLQ7zaXg0lqDDPvEeoNSuiAcWFCh1Rnt34B9m5YGMbZrT2jyJ8KUxVOHk6.jpg', 'public/uploads/images/product/detail/thumb/3a54473a-d446-4541-aa88-9a5303d60600-vzFWgAUyR63jV72XwbEPMum41eQBOTdfDohaZNrJ0K589lxDYiqknHCsSGctL.jpg', 9, '2023-11-12 22:27:08'),
(20, '9994457e-2f6f-4b27-a1a0-a9e68b329ddc', 'public/uploads/images/product/detail/9994457e-2f6f-4b27-a1a0-a9e68b329ddc-CXPg2Ue6bwJltFHMq4EVjdD8ZSnsv3Qa5zNWoLurAycRBGOTiD1h9mY7fx0kK.jpg', 'public/uploads/images/product/detail/thumb/9994457e-2f6f-4b27-a1a0-a9e68b329ddc-n7GbM0eRuxUtEF2AX6C3OTV4vrLKgykBwijsSHDcoqJl95hPNzfZYaW18QdmD.jpg', 9, '2023-11-12 22:27:08'),
(21, '56520d6a-9325-4ed4-83e8-596a3abb89a5', 'public/uploads/images/product/detail/56520d6a-9325-4ed4-83e8-596a3abb89a5-Lg8jY1M5zRiG0WJb6ckFXtNDSseQqOlK7PrA9hUCnuawEH4T2yBVfvDo3dxZm.jpg', 'public/uploads/images/product/detail/thumb/56520d6a-9325-4ed4-83e8-596a3abb89a5-qJAWPHkyK8sgUECB034ubeT16VvcOFazxjo2G57mD9dMLnSrXRQNYwlfZDith.jpg', 9, '2023-11-12 22:27:08'),
(22, '8df20220-374d-494c-80cd-b829f1abe6f4', 'public/uploads/images/product/detail/8df20220-374d-494c-80cd-b829f1abe6f4-0D8MjALY1QmngXDHEcZaBuf2Sd37NvUwC5Vzr9bGlhtKs6x4PFROoyekWqJiT.jpg', 'public/uploads/images/product/detail/thumb/8df20220-374d-494c-80cd-b829f1abe6f4-67Db4hRdXyzZ8L2EkHa0CMBqD5rWtUsFQloVASf3PxOjeGiTuJvmwKY9cnN1g.jpg', 10, '2023-11-12 22:31:32'),
(23, '993cfa09-86fd-47b8-96c8-31c3eae494c2', 'public/uploads/images/product/detail/993cfa09-86fd-47b8-96c8-31c3eae494c2-2fadomUiw3l5cGYSChAJ6EXV8POWK4TvbZnzkgBq9LDuts7Qyjr1HxRDMF0eN.jpg', 'public/uploads/images/product/detail/thumb/993cfa09-86fd-47b8-96c8-31c3eae494c2-Oo3MhurkgbvcDdZFwjfY6yJXiC7K5sPU42VSQGl9W1qnxTeNDAHatBLzE08mR.jpg', 10, '2023-11-12 22:31:32'),
(24, 'c57c5411-8cf6-406d-8d7e-4228440b16fa', 'public/uploads/images/product/detail/c57c5411-8cf6-406d-8d7e-4228440b16fa-SKVbBrQuDFkJmhROEgC596l7PdLiyjYv23ocwHNz8XDTxUZqAtGsaWn01eM4f.jpg', 'public/uploads/images/product/detail/thumb/c57c5411-8cf6-406d-8d7e-4228440b16fa-GYqjWiUrHzDNVtsu7nvcOEXxk43eDb0RSoF62dP5TK8CyMQhglZwaL9BJfmA1.jpg', 10, '2023-11-12 22:31:33'),
(25, '2622c9ce-0106-408a-aaf9-456727cf5be4', 'public/uploads/images/product/detail/2622c9ce-0106-408a-aaf9-456727cf5be4-sVNxOmJ7KFCT5cSEw803huR6DHLlyjMY9d1ofDWnBqtiGAzvrkZg2ebUXQP4a.jpg', 'public/uploads/images/product/detail/thumb/2622c9ce-0106-408a-aaf9-456727cf5be4-3qlLU4TzrCO8P7DkeF0B6RnEu2cXh9KNW1moVgdwSAyjDiQM5HxtfZavGJYbs.jpg', 10, '2023-11-12 22:31:33'),
(26, '3ffccede-437e-470f-9800-6832bb5f0ea2', 'public/uploads/images/product/detail/3ffccede-437e-470f-9800-6832bb5f0ea2-D0w9x1sNRqB2UTCudD4flyHG7ajKZXVre6hSnPgY5it8MkWmLcJFbO3ozvEQA.jpg', 'public/uploads/images/product/detail/thumb/3ffccede-437e-470f-9800-6832bb5f0ea2-UiuD6hsEkCrOM0d7gFKmAcGL1l2ZyRwPzQX38BnJbxfSVHtov4jDaYeWN5q9T.jpg', 11, '2023-11-12 22:34:56'),
(27, '8bb7e7b2-be8d-4706-9004-2d8fd8eb2205', 'public/uploads/images/product/detail/8bb7e7b2-be8d-4706-9004-2d8fd8eb2205-4iWAyxqanCwKjJBoDbsktOHSZGFQ982EufzlNMevdrVYP6L0371XDhmUcR5Tg.jpg', 'public/uploads/images/product/detail/thumb/8bb7e7b2-be8d-4706-9004-2d8fd8eb2205-iV0AHbXSz7r12UMwNK93dZf4uyEODmksvYlCLnaPGthj8QTBDWgRF5eqoc6Jx.jpg', 11, '2023-11-12 22:34:56'),
(28, '579e8d55-1e2a-494c-bda1-a9cb6faa32ac', 'public/uploads/images/product/detail/579e8d55-1e2a-494c-bda1-a9cb6faa32ac-DVMWjtEsTQbwhLX3RlraGze4YydPcqDBn69gmA0k1vf25Juo7OZ8SHKiUCNxF.jpg', 'public/uploads/images/product/detail/thumb/579e8d55-1e2a-494c-bda1-a9cb6faa32ac-n6hF2lWKEoX1k4dsce3i5Gga9NquSBxzDbLQDtvTMr0HfYARJUPVwCm8yOjZ7.jpg', 11, '2023-11-12 22:34:56'),
(29, 'ae1d5207-e750-4bc2-8d39-886278cd493a', 'public/uploads/images/product/detail/ae1d5207-e750-4bc2-8d39-886278cd493a-vLRdU0AHwkCKl8hz6FZfsQEueXPDmNg5D2yWi4qBTr3bxGMO7jn9tYcoaSJ1V.jpg', 'public/uploads/images/product/detail/thumb/ae1d5207-e750-4bc2-8d39-886278cd493a-1zwsjGA8uqZ6OcKeU50FVlYtdDMgHDJxL9Qv2iWoXay3r4EfRCPkb7NSTmhBn.jpg', 12, '2023-11-12 22:37:09'),
(30, '6f7f74de-7d22-4ad2-90b5-7e8694b280d7', 'public/uploads/images/product/detail/6f7f74de-7d22-4ad2-90b5-7e8694b280d7-O28sbRENWFzVlerutd0oUMS51c9X6JxyGmLDZjYwvfkP4K7QgiTBqn3AahHCD.jpg', 'public/uploads/images/product/detail/thumb/6f7f74de-7d22-4ad2-90b5-7e8694b280d7-id5DsAkBjfrl7GgactM02NY96LhFqSRKWwzumJ8ynVoZeQ3Xv1OHPDET4xUCb.jpg', 12, '2023-11-12 22:37:09'),
(31, '461af873-866c-49ea-910d-5d9efc9133b0', 'public/uploads/images/product/detail/461af873-866c-49ea-910d-5d9efc9133b0-bQJg8Ykfx2NSMiC1sTUdqVmt6XDhuLB3G59rlOPwRj7EHce0WD4aFoyAnKZvz.jpg', 'public/uploads/images/product/detail/thumb/461af873-866c-49ea-910d-5d9efc9133b0-ThgCE1OurcMoRlvGLZAWFUH3PV45DjqD96xSns2eYim078KNbzkyaBtwQXdJf.jpg', 12, '2023-11-12 22:37:10'),
(32, 'fc755205-556f-4944-9d06-6b4bf7b0bc83', 'public/uploads/images/product/detail/fc755205-556f-4944-9d06-6b4bf7b0bc83-LnGrClzyFDvDJ04BwAdhKQcbEmZXutMokYSx6sj8OeHUg2V3q5NfaTRP9W1i7.jpg', 'public/uploads/images/product/detail/thumb/fc755205-556f-4944-9d06-6b4bf7b0bc83-SVLR4fo03cTPEK62GuDbXsYh7te1lOvUkndQJHxrZWMw9aDAiB5Ng8qjmzCFy.jpg', 12, '2023-11-12 22:37:10'),
(33, '5339a381-41a4-4c4a-b952-2385c6c940ff', 'public/uploads/images/product/detail/5339a381-41a4-4c4a-b952-2385c6c940ff-fqK9kVOCuLWHD4nr6NP8tcAvRJiD1SjlXobx7dUmYZwQzT5haE2seBGy30gMF.jpg', 'public/uploads/images/product/detail/thumb/5339a381-41a4-4c4a-b952-2385c6c940ff-zr1an9dCtwVUxvMWJQEXl45FDfZiLSAY6gD3K8eBTOkbRcPGjo0H2hyNsmuq7.jpg', 12, '2023-11-12 22:37:10'),
(34, 'b98585fa-340b-47e9-ae6d-93592f7203a3', 'public/uploads/images/product/detail/b98585fa-340b-47e9-ae6d-93592f7203a3-RZbMJq04cTjPGS3EilkuKNyYmUVWrHwaL9Cv7Q6OF1DgodfDztneX5As28xBh.jpg', 'public/uploads/images/product/detail/thumb/b98585fa-340b-47e9-ae6d-93592f7203a3-PjMXYGo1HJzdv3lQ4fUagEx9DqFsRryKT0Z2mDOcti5N8B6WuhLVbekn7CAwS.jpg', 13, '2023-11-12 22:40:24'),
(35, '4a2b7d2a-b4c6-4539-9063-e303a46b8271', 'public/uploads/images/product/detail/4a2b7d2a-b4c6-4539-9063-e303a46b8271-HNbUzyQFJ4D2VMxsWXtlwTOei6nhdqGo95Rj170BSPEf8A3ucLgvZKDYCrkma.jpg', 'public/uploads/images/product/detail/thumb/4a2b7d2a-b4c6-4539-9063-e303a46b8271-TMjqaVmxLz71YgAy5trEBbSPRKd049DOskcvQilwGCenNhu62UFZW8DJ3fXoH.jpg', 13, '2023-11-12 22:40:24'),
(36, 'ae7f6be1-1417-410a-926b-7bf61e026e71', 'public/uploads/images/product/detail/ae7f6be1-1417-410a-926b-7bf61e026e71-jDusKTgERty734aHYGCbiPO9xJnvUQ5f1e6czrdoXwVkDZWLqSBFlN8MhAm20.jpg', 'public/uploads/images/product/detail/thumb/ae7f6be1-1417-410a-926b-7bf61e026e71-3L650GuXwEevcgz2ojsyRHrVW4xKmdh1nBZ87JbPMYDkClq9OfStFaQNUTDAi.jpg', 14, '2023-11-12 22:43:30'),
(37, '7e6c5a5f-baaa-45ba-a112-090b8d831c61', 'public/uploads/images/product/detail/7e6c5a5f-baaa-45ba-a112-090b8d831c61-igePDjnvyuH9b0aV7FYGsDMRoB5x812c3UKhzXSEANCwkt4WZqdLOlrQTfmJ6.jpg', 'public/uploads/images/product/detail/thumb/7e6c5a5f-baaa-45ba-a112-090b8d831c61-9Na4m7RbM1HL683ovxQVXGgdhkY2EKjJi0ulqDswzCteZfPcUFrOS5ADTyWBn.jpg', 14, '2023-11-12 22:43:30'),
(38, 'd3f09257-678a-424d-9a77-972575e50aeb', 'public/uploads/images/product/detail/d3f09257-678a-424d-9a77-972575e50aeb-qBdvCbtamXYfQ41DgFKZP90DoH5Az6eVniMNjlWw7OsTxhuEcrR3yLUS2kGJ8.jpg', 'public/uploads/images/product/detail/thumb/d3f09257-678a-424d-9a77-972575e50aeb-aBgeslkFyxmNX2iDjJ1WRhoTPvr0ZAbVcKfUznOHdCY475D8QG63EtSuwMq9L.jpg', 14, '2023-11-12 22:43:30'),
(39, '3014c300-3dc6-4dea-bd49-e73087fc35a7', 'public/uploads/images/product/detail/3014c300-3dc6-4dea-bd49-e73087fc35a7-Em36D8iXqtMsjA7rVYl1NbkvRJZ4uDnz0TC52eKyd9GBWUPQhaxOFcLfwHgSo.jpg', 'public/uploads/images/product/detail/thumb/3014c300-3dc6-4dea-bd49-e73087fc35a7-PDLQE0Uxiuh5ycl8vrZSsKj9TYOGBwDatCAV1N64Mz2dfkHR3Fnb7mJWeXoqg.jpg', 15, '2023-11-12 22:50:49'),
(40, 'dfd0bd14-9672-423e-b806-2445df9c8801', 'public/uploads/images/product/detail/dfd0bd14-9672-423e-b806-2445df9c8801-Jfa6zNjhvCM7wDyK3sd92SePOViUF0lxBHYEZqGR5mTrc4o8WQX1bDkALntug.jpg', 'public/uploads/images/product/detail/thumb/dfd0bd14-9672-423e-b806-2445df9c8801-fXqaO7ljQmWTAyJEYcw0uNknixKVHv45g8PZhCGFUdbBo36ReMS12tsDr9zDL.jpg', 15, '2023-11-12 22:50:49'),
(41, '3468d588-d683-4997-9404-55f0a1d39433', 'public/uploads/images/product/detail/3468d588-d683-4997-9404-55f0a1d39433-56UtelymzZwjH9R8G0XW4FB2JPinfuVdDqrTbSY7Kc1xgQAECN3aMOLDshokv.jpg', 'public/uploads/images/product/detail/thumb/3468d588-d683-4997-9404-55f0a1d39433-boW1eydDKNBfSV2aYrlxFnT04A6ztq9QkwgRZXsLmjG7MEDJ8H5UOchivP3uC.jpg', 15, '2023-11-12 22:50:49'),
(42, '6267a678-0903-42ab-85d2-e3577c1359ad', 'public/uploads/images/product/detail/6267a678-0903-42ab-85d2-e3577c1359ad-8Li7SzglouWjDmnd16KEMUchxfXakqbQtCeROZGNvHwB0sT2FDJV4A59rYyP3.jpg', 'public/uploads/images/product/detail/thumb/6267a678-0903-42ab-85d2-e3577c1359ad-iWXg4rqlsQODmHVTUhaL5C2t09jKbP6SMuZox1yndvecwGkF8YBN3zJADEfR7.jpg', 15, '2023-11-12 22:50:49'),
(43, 'eff9659e-4522-4938-91d8-4747a2a2bd47', 'public/uploads/images/product/detail/eff9659e-4522-4938-91d8-4747a2a2bd47-BKaxXyTu0iHvdDoznf1ZbV2gA8FYr7lU5qhE4Ce3kP9jSLOMDcsNwm6WJGQtR.jpg', 'public/uploads/images/product/detail/thumb/eff9659e-4522-4938-91d8-4747a2a2bd47-2G7sendhkF8WTOj9US3yrQZPJDwm4ifB1uqVg0DvYCHbKLxcNla5RAM6XzEot.jpg', 16, '2023-11-12 22:52:58'),
(44, 'aa2f2ef0-2e35-478b-bbcb-a76ed8fbf0cb', 'public/uploads/images/product/detail/aa2f2ef0-2e35-478b-bbcb-a76ed8fbf0cb-DEjXitclYhw7UQHdWe15GnP6DBSx2C4oJazusM0gFOLRk8K9fZmbrv3AyqVTN.jpg', 'public/uploads/images/product/detail/thumb/aa2f2ef0-2e35-478b-bbcb-a76ed8fbf0cb-ORFYAD6VeJcyntPHwfvl17EKXB4TWMsS2m8q53C9aDijguGdbxkzoQLU0NZrh.jpg', 16, '2023-11-12 22:52:58'),
(45, 'df7e3a44-6628-4f72-8689-93a4f16dce51', 'public/uploads/images/product/detail/df7e3a44-6628-4f72-8689-93a4f16dce51-o6zFEC3c01DsnXU9e2mORi7WAK4vthYbH8xdBDNGPZTuj5qyLrSMQgJakVlwf.jpg', 'public/uploads/images/product/detail/thumb/df7e3a44-6628-4f72-8689-93a4f16dce51-QrGwf3juB17kcYhN4DHCnXF98qsg5SmEVJM0zZO6tlLxaURyPeAvoDTWi2Kdb.jpg', 16, '2023-11-12 22:52:58'),
(46, 'c3b7f9aa-f44c-41e8-8965-4e4c8f0f44d8', 'public/uploads/images/product/detail/c3b7f9aa-f44c-41e8-8965-4e4c8f0f44d8-EDcSTbtCxV45yWoDjeGRfF1w3BdYhQJPXlrk0OZ6igq92s8uzmAvaKHLn7NMU.jpg', 'public/uploads/images/product/detail/thumb/c3b7f9aa-f44c-41e8-8965-4e4c8f0f44d8-TklMRKtYDVWj2iObhx03sHJzwFcNGZ6BroU45gEQAunmLvqyeaXSdfD91PC87.jpg', 16, '2023-11-12 22:52:59'),
(47, 'cf89e051-6a36-43f0-8b34-c2eeca60dd39', 'public/uploads/images/product/detail/cf89e051-6a36-43f0-8b34-c2eeca60dd39-vXHbK10Nr8QycTS6DOJAVtGxdiRh9Zla7j4UfqsgBCwY2LnkMP3zoeDEmuWF5.jpg', 'public/uploads/images/product/detail/thumb/cf89e051-6a36-43f0-8b34-c2eeca60dd39-0F1M3WetaVufqBGoS9LXRE2PJsN4ndrwCKhHD7QZAmi6YDc8kylOxU5bgvjzT.jpg', 17, '2023-11-12 22:54:42'),
(48, 'ea1264a4-cacd-4a90-bebb-5ded350e2e4e', 'public/uploads/images/product/detail/ea1264a4-cacd-4a90-bebb-5ded350e2e4e-4Sx61GFlTebUot0hjWgCPKs9c2VrH3uJBydkQXAaiNmD758zOMqEwYLfZDvRn.jpg', 'public/uploads/images/product/detail/thumb/ea1264a4-cacd-4a90-bebb-5ded350e2e4e-qCDy82A7FUZVHsYJzNOm4EjQK0xl9egRG31okw6hvDMtX5LucnirbPWSdBfTa.jpg', 17, '2023-11-12 22:54:42'),
(49, '13a10a23-c2d1-437a-95f7-88d766020ee5', 'public/uploads/images/product/detail/13a10a23-c2d1-437a-95f7-88d766020ee5-blivDO2Unhf4cH3BW81T6CtKLVMoAXqwPRQ07EzjyYJZsaDxd9mg5eGNukFSr.jpg', 'public/uploads/images/product/detail/thumb/13a10a23-c2d1-437a-95f7-88d766020ee5-VA9yw6aKet7uhiHk0D1OS4Jsl5dCmLvUEWZGYoxbz382rXMfDRTNPFBcnqgQj.jpg', 17, '2023-11-12 22:54:42'),
(50, '164908d1-b9cc-46ba-b29f-d5e77b8e7bdc', 'public/uploads/images/product/detail/164908d1-b9cc-46ba-b29f-d5e77b8e7bdc-CLHWbjamd7reAOnsQqYwZS3kV14DRlJu0cMxP29TgzGtF6y5hNKvoXB8UEiDf.jpg', 'public/uploads/images/product/detail/thumb/164908d1-b9cc-46ba-b29f-d5e77b8e7bdc-bgwzLjPfnTX6OxeGMDB254C9o7ildkvZRWmrQtchDyUHEFaNqKAJuY0sS81V3.jpg', 18, '2023-11-12 22:57:10'),
(51, '501980fe-afb3-460a-9d07-e68311f5e911', 'public/uploads/images/product/detail/501980fe-afb3-460a-9d07-e68311f5e911-7qE2RdBgSkKMxCnvwfZAzlOoebXjVLshDuJ0GPQU51W38Y9cDH6mrTNti4aFy.jpg', 'public/uploads/images/product/detail/thumb/501980fe-afb3-460a-9d07-e68311f5e911-BY9QbcaseP8HXC4qJ6iuxwZydDTGOFzLo3NKgDWj17Emh2tAl5SRvMrfUV0nk.jpg', 18, '2023-11-12 22:57:10'),
(52, 'a51fa512-648d-4631-b3f2-bc828aab3094', 'public/uploads/images/product/detail/a51fa512-648d-4631-b3f2-bc828aab3094-Ta3LKcuq6JUQ8ng2RkD4dG0HOblfDVEhzXN5sBrYAmw1MeSxjtFvP7CW9oyZi.jpg', 'public/uploads/images/product/detail/thumb/a51fa512-648d-4631-b3f2-bc828aab3094-3of5teQgrsiyJPGu2WECL6mZ9d7TYjnvcVqDHxk8NlFRU0OAhMa1SbDXwz4KB.jpg', 18, '2023-11-12 22:57:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_product`
--

CREATE TABLE `tbl_product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cateID` int(11) NOT NULL,
  `price` double NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `thumb` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `publish` int(11) NOT NULL,
  `contents` longtext COLLATE utf8_unicode_ci NOT NULL,
  `properties` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_product`
--

INSERT INTO `tbl_product` (`id`, `name`, `slug`, `cateID`, `price`, `image`, `thumb`, `publish`, `contents`, `properties`, `created_at`, `updated_at`) VALUES
(8, 'Iphone 12', 'iphone-12', 1, 18900000, 'public/uploads/images/product/6550ec656667d-tY1L567cmWwKrviQDHkyNaRBbxJ93O8MnUT0DdusXEGFSAZjolV2gChqfPe4z.jpg', 'public/uploads/images/product/thumb/6550ec656667d-RUl4a6mDAcd7wjCT9iB85tYZOWoQVnDK3qrMhzX1fHLPJFeNsvEGby2gukSx0.jpg', 1, '<h3><a href=\"https://www.thegioididong.com/apple\" target=\"_blank\" title=\"Tham khảo các sản phẩm đến từ Apple chính hãng tại Thegioididong.com\">Apple</a>&nbsp;đ&atilde; tr&igrave;nh diện đến người d&ugrave;ng mẫu&nbsp;<a href=\"https://www.thegioididong.com/dtdd/iphone-12-128gb\" target=\"_blank\" title=\"Tham khảo iPhone 12 128GB tại Thegioididong.com\">điện thoại iPhone 12 128GB</a>&nbsp;với sự tuy&ecirc;n bố về một kỷ nguy&ecirc;n mới của iPhone 5G, n&acirc;ng cấp về m&agrave;n h&igrave;nh v&agrave; hiệu năng hứa hẹn đ&acirc;y sẽ l&agrave; smartphone cao cấp đ&aacute;ng để mọi người đầu tư sở hữu.&nbsp;</h3>\r\n\r\n<h3>Hiệu năng vượt trội, th&aacute;ch thức mọi giới hạn</h3>\r\n\r\n<p>iPhone 12 được trang bị&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-ve-chip-apple-a14-bionic-tren-iphone-12-va-ipad-1290695\" target=\"_blank\" title=\"Tìm hiểu chip A14 Bionic tại Thegioididong.com\">chipset A14 Bionic&nbsp;</a>- bộ xử l&yacute; được trang bị lần đầu tr&ecirc;n iPad Air 4 vừa cho ra mắt c&aacute;ch đ&acirc;y kh&ocirc;ng l&acirc;u, mở đầu xu thế chip 5 nm thương mại tr&ecirc;n to&agrave;n thế giới.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://localhost/shopping/public/cpanel/ckfinder/userfiles/images/iphone-12-den-1-org.jpg\" style=\"height:533px; width:800px\" /></p>\r\n\r\n<p>Apple cho biết A14 Bionic sẽ mạnh hơn gần 40%&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/chip-apple-a13-bionic-tren-iphone-11-that-su-rat-manh-1197492\" title=\"Tìm hiểu chip A13 Bionic tại Thegioididong.com\">chipset A13 Bionic</a>, trong đ&oacute; khả năng xử l&yacute; đồ họa nhanh hơn 50% cũng như c&aacute;c t&aacute;c vụ học m&aacute;y mượt m&agrave; hơn 80% khi so s&aacute;nh với bộ xử l&yacute; tiền nhiệm.</p>\r\n\r\n<p>Apple cũng đ&atilde; hỗ trợ kết nối mạng 5G tốc độ load cực nhanh cho mọi trải nghiệm lướt web, xem phim lu&ocirc;n được ổn định v&agrave; mượt m&agrave; hơn.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://localhost/shopping/public/cpanel/ckfinder/userfiles/images/iphone-12-128gb-143520-043510.jpg\" style=\"height:533px; width:800px\" /></p>\r\n', '[{\"name\":\"C\\u00f4ng ngh\\u1ec7 m\\u00e0n h\\u00ecnh\",\"value\":\"OLED\"},{\"name\":\"\\u0110\\u1ed9 ph\\u00e2n gi\\u1ea3i\",\"value\":\"Super Retina XDR (1170 x 2532 Pixels)\"},{\"name\":\"M\\u00e0n h\\u00ecnh r\\u1ed9ng\",\"value\":\"6.1\\\" - T\\u1ea7n s\\u1ed1 qu\\u00e9t 60 Hz\"},{\"name\":\"\\u0110\\u1ed9 s\\u00e1ng t\\u1ed1i \\u0111a\",\"value\":\"1200 nits\"},{\"name\":\"M\\u1eb7t k\\u00ednh c\\u1ea3m \\u1ee9ng\",\"value\":\"K\\u00ednh c\\u01b0\\u1eddng l\\u1ef1c Ceramic Shield\"},{\"name\":\"\\u0110\\u00e8n Flash\",\"value\":\"\\u0110\\u00e8n LED k\\u00e9p\"},{\"name\":\"Chip x\\u1eed l\\u00fd (CPU)\",\"value\":\"Apple A14 Bionic 6 nh\\u00e2n\"},{\"name\":\"H\\u1ec7 \\u0111i\\u1ec1u h\\u00e0nh\",\"value\":\"iOS 15\"},{\"name\":\"T\\u1ed1c \\u0111\\u1ed9 CPU\",\"value\":\"2 nh\\u00e2n 3.1 GHz & 4 nh\\u00e2n 1.8 GHz\"},{\"name\":\"RAM\",\"value\":\"4 GB\"},{\"name\":\"Dung l\\u01b0\\u1ee3ng l\\u01b0u tr\\u1eef\",\"value\":\"128 GB\"},{\"name\":\"Dung l\\u01b0\\u1ee3ng c\\u00f2n l\\u1ea1i (kh\\u1ea3 d\\u1ee5ng) kho\\u1ea3ng\",\"value\":\"115 GB\"}]', '2023-11-12 22:16:53', '0000-00-00'),
(9, 'Iphone 15 Pro max 256GB', 'iphone-15-pro-max-256gb', 1, 31200000, 'public/uploads/images/product/6550ef5f24e08-JvfAcHlqNyXmdRQSBsEUn8YKOroZ96WFka2ihM30wCVGx1Tz4t5Dj7ugLDbeP.jpg', 'public/uploads/images/product/thumb/6550ef5f24e08-N9Xt04J8kgcQj2CdDEWZb1wFfnr3y5s7aSUYGKDRHALhzueov6VxliTPMOBmq.jpg', 1, '<p style=\"text-align:center\"><img alt=\"\" src=\"http://localhost/shopping/public/cpanel/ckfinder/userfiles/images/iphone-15-pro-131023-034959.jpg\" style=\"height:606px; width:1020px\" /></p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://localhost/shopping/public/cpanel/ckfinder/userfiles/images/iphone-15-pro-131023-035001.jpg\" style=\"height:1200px; width:464px\" /></p>\r\n\r\n<h3>L&yacute; do chọn mua iPhone 15 Pro Max tại Thế Giới Di Động</h3>\r\n\r\n<p>iPhone 15 Pro Max l&agrave; một chiếc điện thoại th&ocirc;ng minh cao cấp được mong đợi nhất năm 2023. Với nhiều t&iacute;nh năng mới v&agrave; cải tiến, iPhone 15 Pro Max chắc chắn sẽ l&agrave; một lựa chọn tuyệt vời cho những người d&ugrave;ng đang t&igrave;m kiếm một chiếc điện thoại c&oacute; hiệu năng mạnh mẽ, camera chất lượng v&agrave; thiết kế sang trọng.</p>\r\n\r\n<p><strong>&bull; Sản phẩm ch&iacute;nh h&atilde;ng, đảm bảo chất lượng:&nbsp;</strong>Thế Giới Di Động l&agrave; nh&agrave; b&aacute;n lẻ điện thoại di động lớn nhất Việt Nam, cam kết cung cấp sản phẩm ch&iacute;nh h&atilde;ng, đảm bảo chất lượng. Bạn c&oacute; thể y&ecirc;n t&acirc;m về xuất xứ sản phẩm v&agrave; c&oacute; thể tận hưởng trải nghiệm sử dụng tốt nhất.</p>\r\n\r\n<p><strong>&bull; Ưu đ&atilde;i v&agrave; khuyến m&atilde;i hấp dẫn:</strong>&nbsp;Thế Giới Di Động thường xuy&ecirc;n c&oacute; c&aacute;c chương tr&igrave;nh khuyến m&atilde;i, giảm gi&aacute; v&agrave; tặng qu&agrave; k&egrave;m, gi&uacute;p bạn tiết kiệm được một khoản tiền khi mua iPhone 15 Pro Max.</p>\r\n\r\n<p><strong>&bull; Hệ thống cửa h&agrave;ng rộng khắp:</strong>&nbsp;Thế Giới Di Động c&oacute; mạng lưới cửa h&agrave;ng rộng khắp tr&ecirc;n to&agrave;n quốc, gi&uacute;p bạn dễ d&agrave;ng t&igrave;m được một cửa h&agrave;ng gần nh&agrave; để mua sắm. Bạn cũng c&oacute; thể trực tiếp kiểm tra sản phẩm v&agrave; nhận sự hỗ trợ từ nh&acirc;n vi&ecirc;n tại cửa h&agrave;ng.</p>\r\n\r\n<p><strong>&bull; Dịch vụ hậu m&atilde;i chuy&ecirc;n nghiệp:&nbsp;</strong>Thế Giới Di Động cung cấp dịch vụ hậu m&atilde;i chuy&ecirc;n nghiệp, bao gồm bảo h&agrave;nh, sửa chữa v&agrave; hỗ trợ kỹ thuật. Điều n&agrave;y gi&uacute;p bạn y&ecirc;n t&acirc;m về việc sử dụng trong thời gian d&agrave;i.</p>\r\n\r\n<p><strong>&bull; Trả g&oacute;p linh hoạt:</strong>&nbsp;Thế Giới Di Động cung cấp c&aacute;c lựa chọn trả g&oacute;p ph&ugrave; hợp với ng&acirc;n s&aacute;ch của bạn, gi&uacute;p bạn mua được sản phẩm mong muốn m&agrave; kh&ocirc;ng cần thanh to&aacute;n to&agrave;n bộ số tiền một l&uacute;c.</p>\r\n\r\n<p><strong>&bull; Uy t&iacute;n v&agrave; kinh nghiệm l&acirc;u năm:&nbsp;</strong>Với hơn 15 năm hoạt động tr&ecirc;n thị trường, Thế Giới Di Động đ&atilde; x&acirc;y dựng được một uy t&iacute;n mạnh mẽ trong ng&agrave;nh c&ocirc;ng nghiệp điện thoại di động. Điều n&agrave;y gi&uacute;p bạn y&ecirc;n t&acirc;m về việc mua sắm tại Thế Giới Di Động.</p>\r\n', '[{\"name\":\"C\\u00f4ng ngh\\u1ec7 m\\u00e0n h\\u00ecnh\",\"value\":\"OLED\"},{\"name\":\"\\u0110\\u1ed9 ph\\u00e2n gi\\u1ea3i\",\"value\":\"Super Retina XDR (1290 x 2796 Pixels)\"},{\"name\":\"M\\u00e0n h\\u00ecnh r\\u1ed9ng\",\"value\":\"6.7\\\" - T\\u1ea7n s\\u1ed1 qu\\u00e9t 120 Hz\"},{\"name\":\"\\u0110\\u1ed9 s\\u00e1ng t\\u1ed1i \\u0111a\",\"value\":\"2000 nits\"},{\"name\":\"M\\u1eb7t k\\u00ednh c\\u1ea3m \\u1ee9ng\",\"value\":\"K\\u00ednh c\\u01b0\\u1eddng l\\u1ef1c Ceramic Shield\"},{\"name\":\"\\u0110\\u00e8n Flash\",\"value\":\"C\\u00f3\"},{\"name\":\"Chip x\\u1eed l\\u00fd (CPU)\",\"value\":\"Apple A17 Pro 6 nh\\u00e2n\"},{\"name\":\"H\\u1ec7 \\u0111i\\u1ec1u h\\u00e0nh\",\"value\":\"iOS 17\"},{\"name\":\"RAM\",\"value\":\"8 GB\"},{\"name\":\"Dung l\\u01b0\\u1ee3ng l\\u01b0u tr\\u1eef\",\"value\":\"256 GB\"}]', '2023-11-12 22:29:35', '0000-00-00'),
(10, 'Iphone 15 plus', 'iphone-15-plus', 1, 25900000, 'public/uploads/images/product/6550f04c18bb7-Ekwb5GmdBWOVgxNiUlfADe74QyDZscuSFn96toJCR1aTL28hX0rqHPMvz3jKY.jpg', 'public/uploads/images/product/thumb/6550f04c18bb7-AaDUyCwXmfsg1DndrObe42vVM9i0utRN63GYTE5zQjkK7hlZqx8JWLSoPcHFB.jpg', 1, '<p style=\"text-align:center\"><img alt=\"\" src=\"http://localhost/shopping/public/cpanel/ckfinder/userfiles/images/iphone-15-512gb-131023-110626.jpg\" style=\"height:1200px; width:391px\" /></p>\r\n\r\n<p>Thế Giới Di Động l&agrave; một trong những nh&agrave; b&aacute;n lẻ điện thoại di động lớn nhất Việt Nam, cung cấp đa dạng c&aacute;c sản phẩm iPhone 15 ch&iacute;nh h&atilde;ng với mức gi&aacute; cạnh tranh. Dưới đ&acirc;y l&agrave; một số l&yacute; do khiến bạn n&ecirc;n chọn mua iPhone 15 tại Thế Giới Di Động:</p>\r\n\r\n<p><strong>&bull;&nbsp;Chất lượng sản phẩm:</strong>&nbsp;Thế Giới Di Động cam kết cung cấp sản phẩm&nbsp;<a href=\"https://www.thegioididong.com/dtdd-apple-iphone-15-series\" target=\"_blank\" title=\"Tham khảo iPhone 15 series tại Thegioididong.com \">iPhone 15</a>&nbsp;ch&iacute;nh h&atilde;ng. Điều n&agrave;y gi&uacute;p bạn y&ecirc;n t&acirc;m về chất lượng sản phẩm v&agrave; được hưởng đầy đủ c&aacute;c quyền lợi bảo h&agrave;nh của Apple.</p>\r\n\r\n<p><strong>&bull;&nbsp;Ưu đ&atilde;i v&agrave; khuyến m&atilde;i:</strong>&nbsp;Thế Giới Di Động thường xuy&ecirc;n c&oacute; c&aacute;c chương tr&igrave;nh khuyến m&atilde;i, giảm gi&aacute; v&agrave; tặng qu&agrave; k&egrave;m theo, gi&uacute;p bạn tiết kiệm chi ph&iacute; khi mua sắm.</p>\r\n\r\n<p><strong>&bull;&nbsp;Hệ thống cửa h&agrave;ng rộng r&atilde;i:</strong>&nbsp;Thế Giới Di Động c&oacute; mạng lưới cửa h&agrave;ng rộng khắp tr&ecirc;n to&agrave;n quốc, gi&uacute;p bạn dễ d&agrave;ng t&igrave;m kiếm v&agrave; mua sắm. Bạn cũng c&oacute; thể trải nghiệm sản phẩm trực tiếp tại cửa h&agrave;ng v&agrave; nhận sự hỗ trợ từ nh&acirc;n vi&ecirc;n.</p>\r\n\r\n<p><strong>&bull;&nbsp;Dịch vụ hậu m&atilde;i tốt:</strong>&nbsp;Thế Giới Di Động cung cấp dịch vụ hậu m&atilde;i chuy&ecirc;n nghiệp, bao gồm bảo h&agrave;nh, sửa chữa v&agrave; hỗ trợ kỹ thuật gi&uacute;p bạn y&ecirc;n t&acirc;m khi sử dụng sản phẩm.</p>\r\n\r\n<p><strong>&bull;&nbsp;Hệ thống trả g&oacute;p linh hoạt:</strong>&nbsp;Thế Giới Di Động cung cấp c&aacute;c lựa chọn trả g&oacute;p ph&ugrave; hợp với ng&acirc;n s&aacute;ch của bạn, gi&uacute;p bạn mua được sản phẩm mong muốn m&agrave; kh&ocirc;ng cần thanh to&aacute;n to&agrave;n bộ số tiền một l&uacute;c.</p>\r\n\r\n<p><strong>&bull;&nbsp;Uy t&iacute;n v&agrave; kinh nghiệm:</strong>&nbsp;Với hơn 15 năm hoạt động tr&ecirc;n thị trường, Thế Giới Di Động đ&atilde; x&acirc;y dựng được một uy t&iacute;n mạnh mẽ trong ng&agrave;nh c&ocirc;ng nghiệp điện thoại di động. Điều n&agrave;y gi&uacute;p bạn y&ecirc;n t&acirc;m khi mua sắm tại đ&acirc;y.</p>\r\n\r\n<p><strong>&bull;&nbsp;Dịch vụ mua sắm trực tuyến:</strong>&nbsp;Ngo&agrave;i c&aacute;c hệ thống cửa h&agrave;ng si&ecirc;u thị, Thế Giới Di Động c&ograve;n cung cấp dịch vụ mua sắm trực tuyến, gi&uacute;p bạn mua h&agrave;ng mọi l&uacute;c, mọi nơi v&agrave; dễ d&agrave;ng so s&aacute;nh gi&aacute; cả.</p>\r\n', '[{\"name\":\"C\\u00f4ng ngh\\u1ec7 m\\u00e0n h\\u00ecnh\",\"value\":\"OLED\"},{\"name\":\"\\u0110\\u1ed9 ph\\u00e2n gi\\u1ea3i\",\"value\":\" Super Retina XDR (1290 x 2796 Pixels)\"},{\"name\":\"M\\u00e0n h\\u00ecnh r\\u1ed9ng\",\"value\":\"6.7\\\" - T\\u1ea7n s\\u1ed1 qu\\u00e9t 60 Hz\"},{\"name\":\"\\u0110\\u1ed9 s\\u00e1ng t\\u1ed1i \\u0111a\",\"value\":\"2000 nits\"},{\"name\":\"M\\u1eb7t k\\u00ednh c\\u1ea3m \\u1ee9ng\",\"value\":\"K\\u00ednh c\\u01b0\\u1eddng l\\u1ef1c Ceramic Shield\"},{\"name\":\"\\u0110\\u00e8n Flash\",\"value\":\"\\u0110\\u00e8n LED k\\u00e9p\"},{\"name\":\"Chip x\\u1eed l\\u00fd (CPU)\",\"value\":\"Apple A14 Bionic 6 nh\\u00e2n\"},{\"name\":\"H\\u1ec7 \\u0111i\\u1ec1u h\\u00e0nh\",\"value\":\"iOS 15\"},{\"name\":\"T\\u1ed1c \\u0111\\u1ed9 CPU\",\"value\":\"2 nh\\u00e2n 3.1 GHz & 4 nh\\u00e2n 1.8 GHz\"}]', '2023-11-12 22:33:32', '0000-00-00'),
(11, 'Iphone 14 Pro max 128GB', 'iphone-14-pro-max-128gb', 1, 20000000, 'public/uploads/images/product/6550f0d53f8a0-YePiMjzB1Zfvs6OklSTxULQnN0otWD94RJqKEGVh8yXdbrFC7gDAca3u2w5mH.jpg', 'public/uploads/images/product/thumb/6550f0d53f8a0-NL7S4oPf5vy6Rj09MWnzeugdCm1kGDBxHEisbJtr2hQV8UOYcqXZFwlDa3KTA.jpg', 1, '<p style=\"text-align:center\"><img alt=\"\" src=\"http://localhost/shopping/public/cpanel/ckfinder/userfiles/images/iphone-14-pro-max-note.jpg\" style=\"height:600px; width:800px\" /></p>\r\n\r\n<h3><a href=\"https://www.thegioididong.com/dtdd/iphone-14-pro-max\" target=\"_blank\" title=\"Tham khảo điện thoại iPhone 14 Pro Max tại Thế Giới Di Động\">iPhone 14 Pro Max</a>&nbsp;một si&ecirc;u phẩm trong giới smartphone được nh&agrave; T&aacute;o tung ra thị trường v&agrave;o th&aacute;ng 09/2022. M&aacute;y trang bị con chip Apple A16 Bionic v&ocirc; c&ugrave;ng mạnh mẽ, đi k&egrave;m theo đ&oacute; l&agrave; thiết kế h&igrave;nh m&agrave;n h&igrave;nh mới, hứa hẹn mang lại những trải nghiệm đầy mới mẻ cho người d&ugrave;ng iPhone.</h3>\r\n\r\n<h3>Thiết kế cao cấp bền bỉ</h3>\r\n\r\n<p>iPhone năm nay sẽ được thừa hưởng n&eacute;t đặc trưng từ người anh&nbsp;<a href=\"https://www.thegioididong.com/dtdd/iphone-13-pro-max-1tb\" target=\"_blank\" title=\"Tham khảo iPhone 13 Pro Max tại Thế Giới Di Động\">iPhone 13 Pro Max</a>, vẫn sẽ l&agrave; khung th&eacute;p kh&ocirc;ng gỉ v&agrave; mặt lưng k&iacute;nh cường lực kết hợp với tạo h&igrave;nh vu&ocirc;ng vức hiện đại th&ocirc;ng qua c&aacute;ch tạo h&igrave;nh phẳng ở c&aacute;c cạnh v&agrave; phần mặt lưng.</p>\r\n', '[{\"name\":\"C\\u00f4ng ngh\\u1ec7 m\\u00e0n h\\u00ecnh\",\"value\":\"OLED\"},{\"name\":\"\\u0110\\u1ed9 ph\\u00e2n gi\\u1ea3i\",\"value\":\"Super Retina XDR (1170 x 2532 Pixels)\"},{\"name\":\"H\\u1ec7 \\u0111i\\u1ec1u h\\u00e0nh\",\"value\":\"IOS\"},{\"name\":\"\\u0110\\u1ed9 s\\u00e1ng t\\u1ed1i \\u0111a\",\"value\":\"2000 nits\"},{\"name\":\"M\\u1eb7t k\\u00ednh c\\u1ea3m \\u1ee9ng\",\"value\":\"K\\u00ednh c\\u01b0\\u1eddng l\\u1ef1c Ceramic Shield\"},{\"name\":\"\\u0110\\u00e8n Flash\",\"value\":\"\\u0110\\u00e8n LED k\\u00e9p\"},{\"name\":\"Chip x\\u1eed l\\u00fd (CPU)\",\"value\":\"Apple A14 Bionic 6 nh\\u00e2n\"},{\"name\":\"H\\u1ec7 \\u0111i\\u1ec1u h\\u00e0nh\",\"value\":\"iOS 15\"},{\"name\":\"RAM\",\"value\":\"8 GB\"},{\"name\":\"Dung l\\u01b0\\u1ee3ng l\\u01b0u tr\\u1eef\",\"value\":\"256 GB\"}]', '2023-11-12 22:35:49', '2023-11-12'),
(12, 'Iphone 15', 'iphone-15', 1, 22490000, 'public/uploads/images/product/6550f18183b78-DSFle20Ncv3zDORxb4hH6rQYUoBuEVAtsf8JqdZGCw5mXMyKL9n1ik7TagjWP.jpg', 'public/uploads/images/product/thumb/6550f18183b78-o9VJNMgzDmswB5hStKRZdciOC3Leb21P7XTlDky8jG6HxUqvfWYr4EFaQ0Aun.jpg', 1, '<p style=\"text-align:center\"><img alt=\"\" src=\"http://localhost/shopping/public/cpanel/ckfinder/userfiles/images/iphone-15-512gb-131023-110624.jpg\" style=\"height:435px; width:1020px\" /></p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://localhost/shopping/public/cpanel/ckfinder/userfiles/images/iphone-12-128gb-143520-043510.jpg\" style=\"height:533px; width:800px\" /></p>\r\n\r\n<h3>L&yacute; do chọn mua iPhone 15 tại Thế Giới Di Động</h3>\r\n\r\n<p><strong>&bull; Chất lượng sản phẩm:</strong>&nbsp;Thế Giới Di Động cam kết cung cấp sản phẩm iPhone 15 ch&iacute;nh h&atilde;ng v&agrave; đảm bảo chất lượng. Điều n&agrave;y gi&uacute;p bạn y&ecirc;n t&acirc;m về xuất xứ sản phẩm nhằm mang đến sự an t&acirc;m cho việc chọn mua sản phẩm.</p>\r\n\r\n<p><strong>&bull; Ưu đ&atilde;i v&agrave; khuyến m&atilde;i:</strong>&nbsp;Thế Giới Di Động thường xuy&ecirc;n c&oacute; c&aacute;c chương tr&igrave;nh khuyến m&atilde;i, giảm gi&aacute; v&agrave; tặng qu&agrave; k&egrave;m, điều n&agrave;y gi&uacute;p cho việc mua sắm iPhone 15 trở n&ecirc;n dễ d&agrave;ng tiếp cận.</p>\r\n\r\n<p><strong>&bull; Hệ thống cửa h&agrave;ng trải rộng:</strong>&nbsp;Thế Giới Di Động c&oacute; mạng lưới cửa h&agrave;ng trải rộng tr&ecirc;n to&agrave;n quốc, dễ d&agrave;ng tiếp cận v&agrave; mua sắm. Bạn c&oacute; thể kiểm tra sản phẩm trực tiếp v&agrave; nhận sự hỗ trợ từ nh&acirc;n vi&ecirc;n tại cửa h&agrave;ng.</p>\r\n\r\n<p><strong>&bull; Dịch vụ hậu m&atilde;i tốt:</strong>&nbsp;Thế Giới Di Động cung cấp dịch vụ hậu m&atilde;i chuy&ecirc;n nghiệp, bao gồm bảo h&agrave;nh, sửa chữa v&agrave; hỗ trợ kỹ thuật. Điều n&agrave;y gi&uacute;p bạn giải quyết mọi vấn đề kỹ thuật hoặc sự cố về sản phẩm dễ d&agrave;ng.</p>\r\n\r\n<p><strong>&bull; Hệ thống trả g&oacute;p linh hoạt:</strong>&nbsp;Thế Giới Di Động cung cấp c&aacute;c lựa chọn trả g&oacute;p ph&ugrave; hợp với ng&acirc;n s&aacute;ch của bạn, gi&uacute;p bạn mua được sản phẩm mong muốn m&agrave; kh&ocirc;ng cần thanh to&aacute;n to&agrave;n bộ số tiền một l&uacute;c.</p>\r\n\r\n<p><strong>&bull; Uy t&iacute;n v&agrave; kinh nghiệm:</strong>&nbsp;Với hơn 15 năm hoạt động tr&ecirc;n thị trường, Thế Giới Di Động đ&atilde; x&acirc;y dựng được một uy t&iacute;n mạnh mẽ trong ng&agrave;nh c&ocirc;ng nghiệp điện thoại di động.</p>\r\n\r\n<p><strong>&bull; Dịch vụ mua sắm trực tuyến:&nbsp;</strong>Ngo&agrave;i c&aacute;c hệ thống cửa h&agrave;ng si&ecirc;u thị, Thế Giới Di Động c&ograve;n cung cấp dịch vụ mua sắm trực tuyến, gi&uacute;p bạn mua h&agrave;ng mọi l&uacute;c, mọi nơi v&agrave; dễ d&agrave;ng so s&aacute;nh gi&aacute; cả.</p>\r\n', '[{\"name\":\"C\\u00f4ng ngh\\u1ec7 m\\u00e0n h\\u00ecnh\",\"value\":\"OLED\"},{\"name\":\"\\u0110\\u1ed9 ph\\u00e2n gi\\u1ea3i\",\"value\":\"Super Retina XDR (1170 x 2532 Pixels)\"},{\"name\":\"M\\u00e0n h\\u00ecnh r\\u1ed9ng\",\"value\":\"6.1\\\" - T\\u1ea7n s\\u1ed1 qu\\u00e9t 60 Hz\"},{\"name\":\"\\u0110\\u1ed9 s\\u00e1ng t\\u1ed1i \\u0111a\",\"value\":\"2000 nits\"},{\"name\":\"M\\u1eb7t k\\u00ednh c\\u1ea3m \\u1ee9ng\",\"value\":\"K\\u00ednh c\\u01b0\\u1eddng l\\u1ef1c Ceramic Shield\"},{\"name\":\"\\u0110\\u00e8n Flash\",\"value\":\"\\u0110\\u00e8n LED k\\u00e9p\"},{\"name\":\"Chip x\\u1eed l\\u00fd (CPU)\",\"value\":\"Apple A14 Bionic 6 nh\\u00e2n\"},{\"name\":\"H\\u1ec7 \\u0111i\\u1ec1u h\\u00e0nh\",\"value\":\"iOS 15\"},{\"name\":\"T\\u1ed1c \\u0111\\u1ed9 CPU\",\"value\":\"2 nh\\u00e2n 3.1 GHz & 4 nh\\u00e2n 1.8 GHz\"},{\"name\":\"Dung l\\u01b0\\u1ee3ng l\\u01b0u tr\\u1eef\",\"value\":\"256 GB\"}]', '2023-11-12 22:38:41', '0000-00-00'),
(13, 'Samsung Galaxy S23 FE 5G', 'samsung-galaxy-s23-fe-5g', 2, 13500000, 'public/uploads/images/product/6550f267402c5-XTKDu9NicQ6SDUoJzat5GnqvOxCYLZhlkm7FB8Mewf1bWsREP0A4V2jHy3dgr.jpg', 'public/uploads/images/product/thumb/6550f267402c5-RWDynlw0uOB7QLvMU68FtK93PS5brYmGjDcCxdqioJkTH21fXzEZN4VAeghsa.jpg', 1, '<p style=\"text-align:center\"><img alt=\"\" src=\"http://localhost/shopping/public/cpanel/ckfinder/userfiles/images/iphone-15-pro-131023-034959.jpg\" style=\"height:606px; width:1020px\" /></p>\r\n\r\n<h3>Samsung tiếp tục chinh phục thị trường điện thoại th&ocirc;ng minh với phi&ecirc;n bản&nbsp;<a href=\"https://www.thegioididong.com/dtdd/samsung-galaxy-s23-fe\" target=\"_blank\" title=\"Tham khảo điện thoại Samsung Galaxy S23 FE 5G tại Thế Giới Di Động\">Samsung Galaxy S23 FE 5G</a>&nbsp;mới. Mẫu điện thoại n&agrave;y được định h&igrave;nh l&agrave; sản phẩm cận cao cấp với những điểm nổi bật c&oacute; thể kể đến như: Cấu h&igrave;nh mạnh, camera 50 MP c&oacute; khả năng quay video 8K đi c&ugrave;ng m&agrave;n h&igrave;nh 120 Hz.</h3>\r\n\r\n<h3>Thiết kế thanh mảnh sang trọng</h3>\r\n\r\n<p>Mặt lưng v&agrave; m&agrave;n h&igrave;nh phẳng của Galaxy S23 FE 5G l&agrave; điểm nổi bật đầu ti&ecirc;n khiến người ta phải trầm trồ. Với việc giữ lại m&agrave;n h&igrave;nh phẳng, Samsung đ&atilde; tạo ra một thiết kế thanh lịch v&agrave; sang trọng, tận dụng tối đa kh&ocirc;ng gian hiển thị m&agrave; kh&ocirc;ng l&agrave;m mất đi vẻ đẹp tự nhi&ecirc;n của thiết bị.</p>\r\n\r\n<p>Bộ khung bo cong mang lại cảm gi&aacute;c cầm nắm thoải m&aacute;i, đồng thời l&agrave;m t&ocirc;n l&ecirc;n vẻ đẹp tự nhi&ecirc;n của m&agrave;n h&igrave;nh v&agrave; mặt lưng nhờ sự tương phản với kiểu phẳng.&nbsp;</p>\r\n', '[{\"name\":\"M\\u00e0n h\\u00ecnh\",\"value\":\"Dynamic AMOLED 2X 6.4\\\" Full HD+\"},{\"name\":\"H\\u1ec7 \\u0111i\\u1ec1u h\\u00e0nh\",\"value\":\"Android 13\"},{\"name\":\"Camera sau\",\"value\":\"Ch\\u00ednh 50 MP & Ph\\u1ee5 12 MP, 8 MP\"},{\"name\":\"Camera tr\\u01b0\\u1edbc\",\"value\":\"10 MP\"},{\"name\":\"Chip\",\"value\":\"Exynos 2200 8 nh\\u00e2n\"},{\"name\":\"RAM\",\"value\":\"8 GB\"},{\"name\":\"Pin, S\\u1ea1c\",\"value\":\"4500 mAh25 W\"},{\"name\":\"SIM\",\"value\":\"\\t2 Nano SIM ho\\u1eb7c 1 Nano SIM + 1 eSIMH\\u1ed7 tr\\u1ee3 5G\"}]', '2023-11-12 22:42:31', '0000-00-00'),
(14, 'Samsung Galaxy Z Fold5 5G', 'samsung-galaxy-z-fold5-5g', 2, 30900000, 'public/uploads/images/product/6550f30c6aea0-NyXMcEtjfDHVdSmskn5l9LoP4TiKGhU6OxBw3qgYJrza8FeDZbW7QuCRA21v0.jpg', 'public/uploads/images/product/thumb/6550f30c6aea0-kXiVxg5YZbC6and8UBOFcmq1vKETLPuhjDNtAzMs3frwS9Jy7G2lQDWH0Reo4.jpg', 1, '<h3>Thiết kế gập mở linh hoạt</h3>\r\n\r\n<p>Samsung Galaxy Z Fold5 vẫn tiếp tục giữ nguy&ecirc;n thiết kế gập độc đ&aacute;o dạng ngang của d&ograve;ng Galaxy Z Fold trước đ&oacute;. Với k&iacute;ch thước nhỏ gọn khi gập lại,&nbsp;<a href=\"https://www.thegioididong.com/dtdd\" target=\"_blank\" title=\"Tham khảo điện thoại đang kinh doanh tại Thế Giới Di Động\">điện thoại</a>&nbsp;n&agrave;y trở n&ecirc;n dễ d&agrave;ng mang theo v&agrave; cất giữ trong t&uacute;i &aacute;o hay t&uacute;i x&aacute;ch của bạn. Khi mở ra, Galaxy Z Fold5 trở th&agrave;nh một chiếc điện thoại th&ocirc;ng thường với m&agrave;n h&igrave;nh lớn hơn, mang đến trải nghiệm sử dụng rộng lớn v&agrave; ấn tượng.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://localhost/shopping/public/cpanel/ckfinder/userfiles/images/samsung-galaxy-z-fold5-260723-095313.jpg\" style=\"height:570px; width:1020px\" /></p>\r\n\r\n<p>Samsung lu&ocirc;n hướng đến chất lượng v&agrave; đẳng cấp trong việc chọn chất liệu cho sản phẩm của m&igrave;nh. Với Galaxy Z Fold5, khung b&ecirc;n ngo&agrave;i của m&aacute;y được l&agrave;m từ hợp kim nh&ocirc;m Armor Aluminum, mang đến cảm gi&aacute;c cứng c&aacute;p v&agrave; đẳng cấp trong việc cầm nắm.</p>\r\n\r\n<p>Bản lề của Samsung Galaxy Z Fold5 được thiết kế đặc biệt để đảm bảo t&iacute;nh ổn định v&agrave; sự mở đ&oacute;ng mượt m&agrave;. Đ&acirc;y l&agrave; một phần quan trọng trong thiết kế của điện thoại gập, v&igrave; thế Samsung đ&atilde; đầu tư nghi&ecirc;n cứu v&agrave; ph&aacute;t triển để cải thiện, tối ưu bản lề v&agrave; cho ra c&ocirc;ng nghệ r&atilde;nh k&eacute;p, n&oacute; gi&uacute;p gập mở dễ d&agrave;ng v&agrave; tối ưu được độ mờ nếp gấp.</p>\r\n', '[{\"name\":\"M\\u00e0n h\\u00ecnh\",\"value\":\"Dynamic AMOLED 2XCh\\u00ednh 7.6\\\" & Ph\\u1ee5 6.2\\\"Quad HD+ (2K+)\"},{\"name\":\"H\\u1ec7 \\u0111i\\u1ec1u h\\u00e0nh\",\"value\":\"Android 13\"},{\"name\":\"Camera sau\",\"value\":\"Ch\\u00ednh 50 MP & Ph\\u1ee5 12 MP, 10 MP\"},{\"name\":\"Camera tr\\u01b0\\u1edbc\",\"value\":\"10 MP & 4 MP\"},{\"name\":\"Chip\",\"value\":\"Snapdragon 8 Gen 2 for Galaxy\"},{\"name\":\"RAM\",\"value\":\"12GB\"},{\"name\":\"Dung l\\u01b0\\u1ee3ng l\\u01b0u tr\\u1eef\",\"value\":\"256GB\"},{\"name\":\"SIM\",\"value\":\"2 Nano SIM ho\\u1eb7c 1 Nano SIM + 1 eSIMH\\u1ed7 tr\\u1ee3 5G\"},{\"name\":\"Pin, S\\u1ea1c\",\"value\":\"4400 mAh25 W\"}]', '2023-11-12 22:45:16', '0000-00-00'),
(15, 'Samsung Galaxy S23 Ultra 5G', 'samsung-galaxy-s23-ultra-5g', 2, 22990000, 'public/uploads/images/product/6550f49a7e7a5-ldLJPKqtW7k2yYxMch1ADFmzXBuDTGS5aVer8OnsR9N4U3g60jvQfEwoHbCiZ.jpg', 'public/uploads/images/product/thumb/6550f49a7e7a5-NygfXz8UaA5WZn4tFkrSVBi73meLwR1MCPEuosqbKJdQcD06T9hGOjDHvYx2l.jpg', 1, '<p><img alt=\"\" src=\"http://localhost/shopping/public/cpanel/ckfinder/userfiles/images/iphone-12-den-1-org.jpg\" style=\"height:680px; width:1020px\" /></p>\r\n\r\n<h3>Th&ocirc;ng tin sản phẩm</h3>\r\n\r\n<h3><a href=\"https://www.thegioididong.com/dtdd/samsung-galaxy-s23-ultra\" target=\"_blank\" title=\"Tham khảo điện thoại Samsung Galaxy S23 Ultra 5G 256GB tại Thế Giới Di Động\">Samsung Galaxy S23 Ultra 5G 256GB</a>&nbsp;l&agrave; chiếc smartphone cao cấp nhất của nh&agrave; Samsung, sở hữu cấu h&igrave;nh kh&ocirc;ng tưởng với con chip khủng được&nbsp;Qualcomm tối ưu ri&ecirc;ng cho d&ograve;ng Galaxy&nbsp;v&agrave; camera l&ecirc;n đến 200 MP, xứng danh l&agrave; chiếc flagship Android được mong đợi nhất trong năm 2023.</h3>\r\n\r\n<h3>Tạo h&igrave;nh sang trọng đầy tinh tế</h3>\r\n\r\n<p>Về thiết kế th&igrave; Samsung Galaxy S23 Ultra sẽ tiếp tục thừa hưởng kiểu d&aacute;ng sang trọng đến từ thế hệ trước, vẫn l&agrave; bộ khung kim loại, mặt lưng k&iacute;nh c&ugrave;ng kiểu tạo h&igrave;nh bo cong nhẹ ở cạnh b&ecirc;n v&agrave; m&agrave;n h&igrave;nh.</p>\r\n', '[{\"name\":\"C\\u00f4ng ngh\\u1ec7 m\\u00e0n h\\u00ecnh\",\"value\":\"Dynamic AMOLED 2X 6.4\\\" Full HD+\"},{\"name\":\"H\\u1ec7 \\u0111i\\u1ec1u h\\u00e0nh\",\"value\":\"Android 13\"},{\"name\":\"Camera sau\",\"value\":\"Ch\\u00ednh 50 MP & Ph\\u1ee5 12 MP, 8 MP\"},{\"name\":\"Camera tr\\u01b0\\u1edbc\",\"value\":\"2000 nits\"},{\"name\":\"Chip\",\"value\":\"Exynos 2200 8 nh\\u00e2n\"},{\"name\":\"RAM\",\"value\":\"8 GB\"},{\"name\":\"Pin, S\\u1ea1c\",\"value\":\"4500 mAh25 W\"},{\"name\":\"SIM\",\"value\":\"2 Nano SIM ho\\u1eb7c 1 Nano SIM + 1 eSIMH\\u1ed7 tr\\u1ee3 5G\"}]', '2023-11-12 22:51:54', '0000-00-00'),
(16, 'Samsung Galaxy S23 5G 256GB ', 'samsung-galaxy-s23-5g-256gb-', 2, 19800000, 'public/uploads/images/product/6550f50784b1b-YlTRhgBaq0E9sdv6Hi82ADNmw1fDFX5QrxMukjcyS3zPGZ4oCeKJb7tVLUnWO.jpg', 'public/uploads/images/product/thumb/6550f50784b1b-xnvKL3qoeM6yOgXZr80Jh7ml2sbAkQVPDYGiSNFjdWHtcTfU9zEDw54CRBua1.jpg', 1, '<h3>Th&ocirc;ng tin sản phẩm</h3>\r\n\r\n<h3><a href=\"https://www.thegioididong.com/dtdd/samsung-galaxy-s23-plus\" target=\"_blank\" title=\"Tham khảo mẫu điện thoại Samsung Galaxy S23 Plus 5G 256GB đang kinh doanh tại Thế Giới Di Động \">Samsung Galaxy S23+ 5G 256GB</a>&nbsp;l&agrave; chiếc điện thoại thuộc d&ograve;ng cao cấp nhất của Samsung được giới thiệu v&agrave;o th&aacute;ng 02/2023. M&aacute;y sở hữu một v&agrave;i điểm ấn tượng như camera c&oacute; khả năng quay video 8K, c&ugrave;ng với đ&oacute; l&agrave; con chip Snapdragon 8 Gen 2 mạnh mẽ h&agrave;ng đầu giới điện thoại Android.</h3>\r\n\r\n<h3>Vẻ ngo&agrave;i đẳng cấp xứng danh flagship</h3>\r\n\r\n<p>Ấn tượng đầu ti&ecirc;n của m&igrave;nh khi tr&ecirc;n tay chiếc Galaxy S23+ l&agrave; c&aacute;i nh&igrave;n vu&ocirc;ng vắn sang trọng, tổng thể m&aacute;y được ho&agrave;n thiện từ c&aacute;c loại chất liệu cao cấp gi&uacute;p mang đến trải nghiệm cầm nắm đầm tay hơn.&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"http://localhost/shopping/public/cpanel/ckfinder/userfiles/images/samsung-galaxy-z-fold5-260723-095313.jpg\" style=\"height:570px; width:1020px\" /></p>\r\n', '[{\"name\":\"C\\u00f4ng ngh\\u1ec7 m\\u00e0n h\\u00ecnh\",\"value\":\"OLED\"},{\"name\":\"H\\u1ec7 \\u0111i\\u1ec1u h\\u00e0nh\",\"value\":\"Android 13\"},{\"name\":\"Camera sau\",\"value\":\"Ch\\u00ednh 50 MP & Ph\\u1ee5 12 MP, 8 MP\"},{\"name\":\"Camera tr\\u01b0\\u1edbc\",\"value\":\"10 MP & 4 MP\"},{\"name\":\"Chip\",\"value\":\"Exynos 2200 8 nh\\u00e2n\"},{\"name\":\"RAM\",\"value\":\"12GB\"}]', '2023-11-12 22:53:43', '2023-11-12'),
(17, 'Samsung Galaxy Z Flip4 5G 128GB ', 'samsung-galaxy-z-flip4-5g-128gb-', 2, 14900000, 'public/uploads/images/product/6550f5856700e-Q5dSfWtJlcCxGjoqiD1UA6Ra2FwmM4XOgPNs3DrEby9nuzvYh7HLKTVZe0B8k.jpg', 'public/uploads/images/product/thumb/6550f5856700e-GQ5CFdExOLoPY6U9KkvseWHMcmT1fiB7g2SDNRthbulJ0jVwaXA4nzZyqrD38.jpg', 1, '<h3>Th&ocirc;ng tin sản phẩm</h3>\r\n\r\n<h3><a href=\"https://www.thegioididong.com/dtdd/samsung-galaxy-z-flip4\" target=\"_blank\" title=\"Tham khảo điện thoại đang kinh doanh tại Thế Giới Di Động\">Samsung Galaxy Z Flip4 128GB</a>&nbsp;đ&atilde; ch&iacute;nh thức ra mắt thị trường c&ocirc;ng nghệ, đ&aacute;nh dấu sự trở lại của Samsung tr&ecirc;n con đường định hướng người d&ugrave;ng về sự tiện lợi tr&ecirc;n những chiếc điện thoại gập. Với độ bền được gia tăng c&ugrave;ng kiểu thiết kế đẹp mắt gi&uacute;p Flip4 trở th&agrave;nh một trong những t&acirc;m điểm s&aacute;ng gi&aacute; cho nửa cuối năm 2022.</h3>\r\n\r\n<h3>Dẫn đầu xu hướng thiết kế mới&nbsp;</h3>\r\n\r\n<p>C&oacute; lẽ điện thoại gập đ&atilde; kh&ocirc;ng c&ograve;n l&agrave; c&aacute;i t&ecirc;n qu&aacute; xa lạ bởi nhiều &ocirc;ng lớn trong ng&agrave;nh sản xuất thiết bị di động đ&atilde; cho ra mắt kh&aacute; nhiều sản phẩm c&oacute; thiết kế tương tự, gần đ&acirc;y nhất th&igrave; c&oacute; sự g&oacute;p mặt của chiếc flagship đến từ nh&agrave; Samsung mang t&ecirc;n Galaxy Z Flip4.&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://localhost/shopping/public/cpanel/ckfinder/userfiles/images/iphone-15-512gb-131023-110626(1).jpg\" style=\"height:1200px; width:391px\" /></p>\r\n', '[{\"name\":\"M\\u00e0n h\\u00ecnh\",\"value\":\"Ch\\u00ednh: Dynamic AMOLED 2X, Ph\\u1ee5: Super AMOLEDChi\\u0301nh 6.7\"},{\"name\":\"H\\u1ec7 \\u0111i\\u1ec1u h\\u00e0nh\",\"value\":\"Android 12\"},{\"name\":\"Camera sau\",\"value\":\"Ch\\u00ednh 50 MP & Ph\\u1ee5 12 MP, 10 MP\"},{\"name\":\"Camera tr\\u01b0\\u1edbc\",\"value\":\"10 MP & 4 MP\"},{\"name\":\"Chip\",\"value\":\"Snapdragon 8 Gen 2 for Galaxy\"},{\"name\":\"RAM\",\"value\":\"8 GB\"}]', '2023-11-12 22:55:49', '2023-11-12'),
(18, 'Xiaomi Redmi 12 4GB', 'xiaomi-redmi-12-4gb', 3, 3490000, 'public/uploads/images/product/6550f60513097-DGiQ7Yvu45OshAVmyDbK6w1C2eM0HftgRTWzqcUoXSExBJ38ar9jZlndNLFkP.jpg', 'public/uploads/images/product/thumb/6550f60513097-mv9Vn01hKgbAQo2SMxBtfHrO6wDc4z5J8yYGqukW7siaFDeT3NCUlEjdLRXPZ.jpg', 1, '<h3>Th&ocirc;ng tin sản phẩm</h3>\r\n\r\n<h3>Xiaomi Redmi 12 mẫu điện thoại mới nhất được nh&agrave;&nbsp;<a href=\"https://www.thegioididong.com/dtdd-xiaomi\" target=\"_blank\" title=\"Tham khảo một số mẫu điện thoại Xiaomi tại Thế Giới Di Động \">Xiaomi</a>&nbsp;tung ra v&agrave;o th&aacute;ng 06/2023 khiến cho cộng đồng đam m&ecirc; c&ocirc;ng nghệ v&ocirc; c&ugrave;ng th&iacute;ch th&uacute;. M&aacute;y kho&aacute;c l&ecirc;n m&igrave;nh một vẻ ngo&agrave;i c&aacute; t&iacute;nh, m&agrave;n h&igrave;nh lớn đem đến trải nghiệm đ&atilde; mắt c&ugrave;ng một hiệu năng ổn định với mọi t&aacute;c vụ.</h3>\r\n\r\n<h3>Vẻ ngo&agrave;i đơn giản</h3>\r\n\r\n<p>Thiết kế của&nbsp;<a href=\"https://www.thegioididong.com/dtdd/xiaomi-redmi-12-4gb\" target=\"_blank\" title=\"Tham khảo một số mẫu điện thoại Xiaomi Redmi 12 4GB tại Thế Giới Di Động \">Xiaomi Redmi 12 4GB&nbsp;</a>được lấy cảm hứng từ sự tối giản khi mặt lưng được l&agrave;m từ k&iacute;nh b&oacute;ng bẩy đi c&ugrave;ng với th&acirc;n m&aacute;y kh&aacute; mỏng nhẹ mang đến vẻ ngo&agrave;i thời trang, trẻ trung c&ugrave;ng khả năng cầm nắm tốt hơn khi sử dụng trong thời gian d&agrave;i.&nbsp;</p>\r\n', '[{\"name\":\"M\\u00e0n h\\u00ecnh\",\"value\":\"IPS LCD6.79\\\"Full HD+\"},{\"name\":\"H\\u1ec7 \\u0111i\\u1ec1u h\\u00e0nh\",\"value\":\"Android 13\"},{\"name\":\"Camera sau\",\"value\":\"Ch\\u00ednh 50 MP & Ph\\u1ee5 12 MP, 8 MP\"},{\"name\":\"Camera tr\\u01b0\\u1edbc\",\"value\":\"10 MP & 4 MP\"},{\"name\":\"Chip\",\"value\":\"Exynos 2200 8 nh\\u00e2n\"},{\"name\":\"RAM\",\"value\":\"8 GB\"},{\"name\":\"Pin, S\\u1ea1c\",\"value\":\"4500 mAh25 W\"}]', '2023-11-12 22:57:57', '0000-00-00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_slug`
--

CREATE TABLE `tbl_slug` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_slug`
--

INSERT INTO `tbl_slug` (`id`, `name`, `type`) VALUES
(1, 'iphone', 1),
(8, 'sam-sung', 1),
(10, 'iphone-12', 2),
(11, 'iphone-15-pro-max-256gb', 2),
(12, 'iphone-15-plus', 2),
(13, 'iphone-14-pro-max-128gb', 2),
(14, 'iphone-15', 2),
(15, 'samsung-galaxy-s23-fe-5g', 2),
(16, 'samsung-galaxy-z-fold5-5g', 2),
(17, 'samsung-galaxy-s23-ultra-5g', 2),
(18, 'samsung-galaxy-s23-5g-256gb-', 2),
(19, 'samsung-galaxy-z-flip4-5g-128gb-', 2),
(20, 'xiaomi', 1),
(21, 'xiaomi-redmi-12-4gb', 2);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_accounts`
--
ALTER TABLE `tbl_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_contact`
--
ALTER TABLE `tbl_contact`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_module`
--
ALTER TABLE `tbl_module`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_photo`
--
ALTER TABLE `tbl_photo`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_slug`
--
ALTER TABLE `tbl_slug`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_accounts`
--
ALTER TABLE `tbl_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `tbl_contact`
--
ALTER TABLE `tbl_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tbl_module`
--
ALTER TABLE `tbl_module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `tbl_orders`
--
ALTER TABLE `tbl_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT cho bảng `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT cho bảng `tbl_photo`
--
ALTER TABLE `tbl_photo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `tbl_slug`
--
ALTER TABLE `tbl_slug`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
