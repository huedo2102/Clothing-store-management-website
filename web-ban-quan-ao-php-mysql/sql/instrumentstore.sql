-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 14, 2023 lúc 02:29 PM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `instrumentstore`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productPrice` decimal(10,0) NOT NULL,
  `productImage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `userId`, `productId`, `qty`, `productName`, `productPrice`, `productImage`) VALUES
(7, 33, 22, 1, 'ĐẦM XÒE PHỐI REN HOA', '1990000', 'ee4f67f716.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`) VALUES
(2, 'Quần áo nam', 1),
(4, 'Quần áo nữ', 1),
(5, 'Quần áo trẻ em', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdDate` date NOT NULL,
  `receivedDate` date DEFAULT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `userId`, `createdDate`, `receivedDate`, `status`) VALUES
(42, 32, '2023-05-06', '2023-05-09', 'Complete'),
(43, 33, '2023-05-10', '2023-05-10', 'Complete'),
(44, 34, '2023-05-10', '2023-05-10', 'Complete'),
(45, 34, '2023-05-10', NULL, 'Processing'),
(46, 34, '2023-05-10', '2023-05-13', 'Processed'),
(47, 34, '2023-05-10', '2023-05-13', 'Processed'),
(48, 34, '2023-05-10', NULL, 'Processing');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `productPrice` decimal(10,0) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productImage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `orderId`, `productId`, `qty`, `productPrice`, `productName`, `productImage`) VALUES
(42, 42, 20, 1, '1890000', 'Äáº¦M XÃ’E THáº®T DÃ‚Y EO', '0b23237d24.jpg'),
(43, 43, 23, 1, '1905000', 'ĐẦM SƠ MI EO NHÚM', '73ff9129c1.jpg'),
(44, 43, 26, 1, '324000', 'SET VÁY GÀ CON', '76305aa7ae.jpg'),
(45, 44, 19, 1, '1500000', 'ĐẦM XÒE THẮT DÂY EO', '20f4f45a0c.jpg'),
(46, 45, 23, 1, '1905000', 'ĐẦM SƠ MI EO NHÚM', '73ff9129c1.jpg'),
(47, 45, 19, 1, '1500000', 'ĐẦM XÒE THẮT DÂY EO', '20f4f45a0c.jpg'),
(48, 45, 20, 1, '1890000', 'ĐẦM XÒE THẮT DÂY EO', '0b23237d24.jpg'),
(49, 46, 20, 6, '1890000', 'ĐẦM XÒE THẮT DÂY EO', '0b23237d24.jpg'),
(50, 47, 27, 23, '234000', 'SET THUN I LOVE ART', '70d8f003a5.jpg'),
(51, 48, 27, 1, '234000', 'SET THUN I LOVE ART', '70d8f003a5.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `originalPrice` decimal(10,0) NOT NULL,
  `promotionPrice` decimal(10,0) NOT NULL,
  `image` varchar(50) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdDate` date NOT NULL,
  `cateId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `des` varchar(1000) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `soldCount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `originalPrice`, `promotionPrice`, `image`, `createdBy`, `createdDate`, `cateId`, `qty`, `des`, `status`, `soldCount`) VALUES
(19, 'ĐẦM XÒE THẮT DÂY EO', '1590000', '1500000', '20f4f45a0c.jpg', 32, '2023-05-06', 4, 565, 'Đầm xòe cổ tròn, tay áo kiểu sát nách, eo chun có dây rút dễ dàng điều chỉnh. Tùng váy dài qua gối tạo xòe. Vải họa tiết hoa.\r\n\r\nChất liệu lụa mềm mát, hợp tiết trời ngày hè oi bức, màu sắc ngọt ngào, có lớp lót cùng màu kín đáo giữ form dáng ổn định. Đầm hoa dáng chữ A khi thắt đai tạo ra dáng chiết eo hiệu quả. Một item xinh xắn cho nàng diện xuống phố trà chiều cùng bạn bè hay những chuyến du lịch sắp tới đấy. ', 1, 25),
(20, 'ĐẦM XÒE THẮT DÂY EO', '1890000', '1890000', '0b23237d24.jpg', 32, '2023-05-06', 4, 426, 'Đầm xòe cổ tròn, tay áo kiểu sát nách, eo chun có dây rút dễ dàng điều chỉnh. Tùng váy dài qua gối tạo xòe. Vải họa tiết hoa.\r\n\r\nChất liệu lụa mềm mát, hợp tiết trời ngày hè oi bức, màu sắc ngọt ngào, có lớp lót cùng màu kín đáo giữ form dáng ổn định. Đầm hoa dáng chữ A khi thắt đai tạo ra dáng chiết eo hiệu quả. Một item xinh xắn cho nàng diện xuống phố trà chiều cùng bạn bè hay những chuyến du lịch sắp tới đấy. ', 1, 8),
(22, 'ĐẦM XÒE PHỐI REN HOA', '1990000', '1990000', 'ee4f67f716.jpg', 32, '2023-05-09', 4, 34, 'Đầm xoè phối ren hoa với thiết kế tinh tế và sang trọng, được chế tác từ chất liệu tuytsi cùng lớp vải ren hoa cao cấp, sản phẩm mang đến cho người mặc cảm giác thoải mái và dễ chịu trên cơ thể.\r\n\r\nPhần vai của đầm được thiết kế với đường may lụa xuyên thấu, tạo nên nét đẹp quyến rũ cho sản phẩm và giúp tôn lên dáng hình của người diện. Chi tiết thân áo 2 lớp vải với lớp vải ren hoa bên ngoài được tô điểm giúp sản phẩm trở nên độc đáo và đẹp mắt hơn. Thân váy xoè nhẹ về đuôi, giúp người mặc trông thật thanh lịch và duyên dáng.\r\n\r\nThiết kế là một lựa chọn hoàn hảo cho các buổi tiệc, sự kiện hay các dịp quan trọng khác. Sản phẩm mang đến sự tự tin và quý phái cho người mặc, đồng thời tôn lên vẻ đẹp của người diện.', 1, 0),
(23, 'ĐẦM SƠ MI EO NHÚM', '1905000', '1905000', '73ff9129c1.jpg', 32, '2023-05-09', 4, 21, 'Từ dáng đầm sơ mi truyền thống, các nhà mốt IVY đã biến tấu thiết kế phần eo đầm may nhúm vừa tạo sự khác biệt, vừa tôn dáng người mặc. Tay đầm lửng được đính thêm hàng khuy kim loại, bởi vậy khi diện chiếc đầm này nàng chẳng cần phối phụ kiện cầu kì mà trông vẫn thật sang trọng. Đầm dáng xòe nhẹ, độ dài ngang đầu gối.\r\n\r\nChiếc đầm sơ mi với chất liệu vải tuysi cao cấp, dày dặn, ít nhăn giữ phom dáng đẹp.\r\n\r\nVới chiếc đầm màu sắc nhã nhặn và trẻ trung này, các nàng có thể lựa chọn kết hợp cùng túi xách bản nhỏ và giày cao gót, phù hợp để đi làm hoặc đi chơi lịch sự. \r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg', 1, 2),
(24, 'CHÂN VÁY XẾP LY LỆCH 1 BÊN', '495000', '495000', '38292b1e49.jpg', 32, '2023-05-09', 4, 54, 'Chân váy 2 lớp dáng ngắn, xếp ly lệch 1 bên phối hàng khuy tạo điểm nhấn. Chất liệu tuysi dày dặn, đứng phom. Thiết kế chân váy trẻ trung dành cho nàng diện trong nhiều dịp, dễ dàng mix&match cùng nhiều kiểu áo với các phong cách khác nhau.\r\n\r\nLưu ý: Màu sắc sản phẩm thực tế sẽ có sự chênh lệch nhỏ so với ảnh do điều kiện ánh sáng khi chụp và màu sắc hiển thị qua màn hình máy tính/ điện thoại. \r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 168 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng:80-62-95 cm\r\n\r\nMẫu mặc size S ', 1, 0),
(25, 'SET ÁO 2 DÂY VÀ QUẦN PHỐI BÈO', '377000', '377000', '50b2fff419.jpg', 32, '2023-05-09', 5, 43, 'Áo 2 dây bản to, thiết kế áo viền chun tạo độ xòe nhẹ. Quần cạp chun dáng ngắn. Chất liệu linen thoáng mát cùng màu sắc đáng yêu và chi tiết bèo nhúm tạo điềm nhấn.\r\n\r\nSet đồ mặc nhà là sự lựa chọn hoàn hảo của mẹ dành cho bé.', 1, 0),
(26, 'SET VÁY GÀ CON', '324000', '324000', '76305aa7ae.jpg', 32, '2023-05-09', 5, 55, 'Set đồ được làm từ chất liệu vải cotton kháng khuẩn. Đây là sự kết hợp giữa chất liệu cotton organic và lớp kháng khuẩn mạnh mẽ được phủ lên trong quá trình hoàn thiện vải cuối cùng. Bởi vậy cotton kháng khuẩn không chỉ mang lại sự thoáng mát mà còn rất an toàn với làn da nhạy cảm của bé.\r\n\r\nÁo cổ tròn tay ngắn phồng nhẹ. Chân váy đuôi cá xòe in hình họa tiết gà con đáng yêu.', 1, 1),
(27, 'SET THUN I LOVE ART', '234000', '234000', '70d8f003a5.jpg', 32, '2023-05-09', 5, -1, 'Bộ thun gồm áo và quần ngắn. Chất liệu mềm mại, thấm hút mồ hôi tốt. Áo được in hình ngộ nghĩnh phía trước. Thiết kế quần bao gồm họa tiết bắt mắt. Cạp quần chun có dãn tốt, phía trước có túi chéo. Quần được giao ngẫu nhiên giữa 2 phiên bản màu khác nhau.\r\n\r\nMàu sắc: Áo Trắng - Quần họa tiết Xanh lơ/ họa tiết Trắng\r\n\r\nMẫu mặc size 8-9:\r\n\r\nChiều cao 1m29\r\nCân nặng 29,5kg', 1, 24),
(28, 'ÁO THUN IN HÌNH', '450000', '450000', 'b558c94153.jpg', 32, '2023-05-09', 2, 34, 'Áo thun tay ngắn độ dài vừa phải mang phong cách trẻ trung năng động.\r\n\r\nHọa tiết được in trên áo sẽ giúp chàng nổi bật giữa đám đông. Là sản phẩm phù hợp cho những buổi đi chơi hay hoạt động thể thao.', 1, 0),
(29, 'ÁO THUN EMOTION', '90000', '90000', '96be6d51c2.jpg', 32, '2023-05-09', 2, 32, 'Áo thun nam cổ tròn, tay ngắn. Dáng xuông. Thêu chữ Emotion mặt trước. \r\n\r\nChất liệu vải thun mềm mịn có đặc tính thấm hút mồ hôi nhanh chóng, tạo cảm giác thông thoáng, dễ chịu khi mặc. Dễ giặt sạch, nhanh khô và khả năng bền màu cao trong thời gian dài. Đường may chắc chắn và tỉ mỉ, chống bung đứt. Form áo ôm nhẹ, tạo sự thoải mái khi vận động, đồng thời tôn lên đường nét săn chắc và nam tính của cơ thể.\r\n\r\nMàu sắc: Xanh Tím Than', 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Normal');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `address` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `email`, `fullname`, `dob`, `password`, `role_id`, `status`, `address`) VALUES
(1, 'admin@gmail.com', 'H', '2021-11-01', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, ''),
(31, 'lap@gmail.com', 'Hu', '2021-12-06', 'c4ca4238a0b923820dcc509a6f75849b', 2, 1, 'CanTho'),
(32, 'huedothi50984@gmail.com', 'Do Hue', '2023-05-10', 'c20ad4d76fe97759aa27a0c99bff6710', 1, 1, '101 MAIN ST PORT CHESTER NY 10573-4210 USA'),
(33, 'ngongocvan132@gmail.com', 'van', '2023-05-03', 'c20ad4d76fe97759aa27a0c99bff6710', 1, 1, 'ff'),
(34, 'ngongocvan@gmail.com', 'vana', '2023-05-09', 'c20ad4d76fe97759aa27a0c99bff6710', 2, 1, 'fsfs');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`userId`),
  ADD KEY `product_id` (`productId`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`userId`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`orderId`),
  ADD KEY `product_id` (`productId`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cate_id` (`cateId`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cateId`) REFERENCES `categories` (`id`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
