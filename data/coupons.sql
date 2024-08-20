-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2024-08-16 16:27:11
-- 伺服器版本： 10.4.32-MariaDB
-- PHP 版本： 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `mfee57`
--

-- --------------------------------------------------------

--
-- 資料表結構 `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) NOT NULL,
  `name` varchar(20) NOT NULL COMMENT '優惠券名稱',
  `code` varchar(50) NOT NULL COMMENT '優惠券代碼',
  `type` enum('percentage','fixed') NOT NULL COMMENT '折扣類型(固定,百分比)',
  `discount` int(5) NOT NULL COMMENT '折扣數值',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `usage_limit` int(10) DEFAULT NULL COMMENT '次數限制',
  `used_count` int(10) DEFAULT 0 COMMENT '已使用次數',
  `min_spend` int(10) DEFAULT NULL COMMENT '最低消費金額',
  `valid` tinyint(4) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `coupons`
--

INSERT INTO `coupons` (`id`, `name`, `code`, `type`, `discount`, `start_date`, `end_date`, `usage_limit`, `used_count`, `min_spend`, `valid`, `created_time`, `updated_time`) VALUES
(1, '測試優惠券', 'hrgoirehgre', 'fixed', 100, '2024-08-15', '0000-00-00', 5, 0, 1000, 1, '2024-08-15 16:17:21', '2024-08-15 16:17:21'),
(2, '測試優惠券', 'testcode', 'percentage', 50, '2024-08-15', '0000-00-00', 10, 0, 1, 1, '2024-08-15 16:17:50', '2024-08-15 16:17:50'),
(3, '測試優惠券', '10101010', 'fixed', 1010, '2024-07-31', '0000-00-00', 1, 0, 0, 1, '2024-08-15 16:19:56', '2024-08-15 16:19:56'),
(4, '測試優惠券2', '101010102', 'fixed', 10102, '2024-07-31', '0000-00-00', 12, 0, 2, 1, '2024-08-15 16:25:00', '2024-08-15 16:25:00'),
(5, '測試優惠券功能', 'testcoupon', 'percentage', 50, '2024-08-01', '2024-08-31', 10, 0, 10000, 0, '2024-08-16 10:47:13', '2024-08-16 10:47:13'),
(6, '滿千折 $120', 'coupon120', 'fixed', 120, '2024-08-01', '2024-08-31', 10, 0, 1000, 0, '2024-08-16 10:47:13', '2024-08-16 10:47:13'),
(7, '滿千折100', 'coupon100', 'fixed', 100, '2024-08-01', '2024-08-31', 10, 0, 1000, 0, '2024-08-16 10:47:13', '2024-08-16 10:47:13'),
(8, '95折', 'coupon095', 'percentage', 95, '2024-08-01', '0000-00-00', 10, 0, 100, 0, '2024-08-16 10:47:13', '2024-08-16 10:47:13'),
(9, '夏季優惠碼', 'SUMMER2024', 'percentage', 80, '2024-08-01', '2024-08-31', 10, 0, 100, 0, '2024-08-16 10:47:13', '2024-08-16 10:47:13'),
(10, '兒童節', 'Happy0404', 'fixed', 300, '2024-04-04', '2024-04-04', 10, 0, 1000, 0, '2024-08-16 10:47:13', '2024-08-16 10:47:13'),
(11, '週年慶特惠', 'ANNIV10', 'percentage', 10, '2024-09-01', '2024-09-07', 500, 0, 1000, 1, '2024-08-18 09:00:00', '2024-08-18 09:00:00'),
(12, '中秋節月餅折扣', 'MOONCAKE', 'fixed', 100, '2024-09-15', '2024-09-21', 200, 0, 500, 1, '2024-08-18 10:15:00', '2024-08-18 10:15:00'),
(13, '國慶日優惠', 'NATIONAL10', 'percentage', 15, '2024-10-01', '2024-10-10', 1000, 0, 800, 1, '2024-08-18 11:30:00', '2024-08-18 11:30:00'),
(14, '感恩節特賣', 'THANKS25', 'fixed', 250, '2024-11-20', '2024-11-28', 300, 0, 1500, 1, '2024-08-18 13:45:00', '2024-08-18 13:45:00'),
(15, '冬季保暖折扣', 'WINTER20', 'percentage', 20, '2024-12-01', '2024-12-31', 400, 0, 1200, 1, '2024-08-18 15:00:00', '2024-08-18 15:00:00'),
(16, '新春福袋', 'LUCKYBAG', 'fixed', 888, '2025-02-01', '2025-02-15', 100, 0, 3000, 1, '2024-08-19 09:30:00', '2024-08-19 09:30:00'),
(17, '38女王節', 'QUEEN38', 'percentage', 30, '2025-03-08', '2025-03-08', 500, 0, 1000, 1, '2024-08-19 11:00:00', '2024-08-19 11:00:00'),
(18, '愚人節驚喜', 'FOOL0401', 'fixed', 401, '2025-04-01', '2025-04-01', 200, 0, 1500, 1, '2024-08-19 13:15:00', '2024-08-19 13:15:00'),
(19, '五一勞動節', 'LABOR501', 'percentage', 18, '2025-05-01', '2025-05-03', 300, 0, 800, 1, '2024-08-19 15:30:00', '2024-08-19 15:30:00'),
(20, '畢業季優惠', 'GRAD2025', 'fixed', 202, '2025-06-01', '2025-06-30', 1000, 0, 1000, 1, '2024-08-20 09:45:00', '2024-08-20 09:45:00'),
(21, '暑期旅遊折扣', 'TRAVEL25', 'percentage', 25, '2025-07-01', '2025-08-31', 500, 0, 2000, 1, '2024-08-20 11:00:00', '2024-08-20 11:00:00'),
(22, '開學文具特惠', 'SCHOOL15', 'fixed', 150, '2025-08-15', '2025-09-15', 800, 0, 500, 1, '2024-08-20 13:30:00', '2024-08-20 13:30:00'),
(23, '中元節優惠', 'GHOST15', 'percentage', 15, '2025-08-22', '2025-08-22', 200, 0, 1000, 1, '2024-08-20 15:45:00', '2024-08-20 15:45:00'),
(24, '教師節感恩', 'TEACHER928', 'fixed', 280, '2025-09-28', '2025-09-28', 300, 0, 1500, 1, '2024-08-21 09:00:00', '2024-08-21 09:00:00'),
(25, '重陽節敬老', 'ELDER99', 'percentage', 20, '2025-10-09', '2025-10-09', 100, 0, 800, 1, '2024-08-21 11:15:00', '2024-08-21 11:15:00'),
(26, '光棍節單身優惠', 'SINGLE11', 'fixed', 111, '2025-11-11', '2025-11-11', 1111, 0, 1111, 1, '2024-08-21 13:30:00', '2024-08-21 13:30:00'),
(27, '聖誕跨年套裝', 'XMASNEWYEAR', 'percentage', 30, '2025-12-24', '2026-01-01', 500, 0, 3000, 1, '2024-08-21 15:45:00', '2024-08-21 15:45:00'),
(28, '春節開運紅包', 'LUCKY888', 'fixed', 888, '2026-02-01', '2026-02-15', 888, 0, 8888, 1, '2024-08-22 09:00:00', '2024-08-22 09:00:00'),
(29, '元宵節猜燈謎', 'LANTERN15', 'percentage', 15, '2026-02-15', '2026-02-15', 200, 0, 500, 1, '2024-08-22 11:15:00', '2024-08-22 11:15:00'),
(30, '清明節踏青優惠', 'QINGMING10', 'fixed', 100, '2026-04-04', '2026-04-05', 300, 0, 1000, 1, '2024-08-22 13:30:00', '2024-08-22 13:30:00'),
(31, '端午節粽子節', 'DRAGON505', 'percentage', 20, '2026-05-31', '2026-06-02', 500, 0, 800, 1, '2024-08-22 15:45:00', '2024-08-22 15:45:00'),
(32, '父親節感恩', 'DAD2026', 'fixed', 520, '2026-08-08', '2026-08-08', 200, 0, 2000, 1, '2024-08-23 09:00:00', '2024-08-23 09:00:00'),
(33, '中秋賞月優惠', 'MOON926', 'percentage', 18, '2026-09-26', '2026-09-26', 300, 0, 1500, 1, '2024-08-23 11:15:00', '2024-08-23 11:15:00'),
(34, '雙12購物節', 'DOUBLE12', 'fixed', 1212, '2026-12-12', '2026-12-12', 1000, 0, 5000, 1, '2024-08-23 13:30:00', '2024-08-23 13:30:00'),
(35, '新年新氣象', 'NEW2027', 'percentage', 27, '2027-01-01', '2027-01-07', 500, 0, 2000, 1, '2024-08-23 15:45:00', '2024-08-23 15:45:00'),
(36, '情人節甜蜜特惠', 'SWEET214', 'fixed', 214, '2027-02-14', '2027-02-14', 214, 0, 1000, 1, '2024-08-24 09:00:00', '2024-08-24 09:00:00'),
(37, '春分好康日', 'SPRING321', 'percentage', 12, '2027-03-21', '2027-03-21', 300, 0, 800, 1, '2024-08-24 11:15:00', '2024-08-24 11:15:00'),
(38, '兒童節歡樂購', 'KIDS0404', 'fixed', 404, '2027-04-04', '2027-04-04', 404, 0, 1000, 1, '2024-08-24 13:30:00', '2024-08-24 13:30:00'),
(39, '母親節寵愛媽咪', 'MOM0509', 'percentage', 25, '2027-05-09', '2027-05-09', 500, 0, 2000, 1, '2024-08-24 15:45:00', '2024-08-24 15:45:00'),
(40, '端午節划龍舟', 'BOAT0614', 'fixed', 300, '2027-06-14', '2027-06-14', 200, 0, 1500, 1, '2024-08-25 09:00:00', '2024-08-25 09:00:00'),
(41, '夏至清涼特賣', 'SUMMER621', 'percentage', 30, '2027-06-21', '2027-06-27', 1000, 0, 1000, 1, '2024-08-25 11:15:00', '2024-08-25 11:15:00'),
(42, '七夕情人節', 'LOVE0807', 'fixed', 777, '2027-08-07', '2027-08-07', 77, 0, 2000, 1, '2024-08-25 13:30:00', '2024-08-25 13:30:00'),
(43, '開學季大促', 'BACKTOSCHOOL', 'percentage', 22, '2027-08-20', '2027-09-10', 500, 0, 1500, 1, '2024-08-25 15:45:00', '2024-08-25 15:45:00'),
(44, '中秋團圓價', 'REUNION915', 'fixed', 515, '2027-09-15', '2027-09-15', 300, 0, 2000, 1, '2024-08-26 09:00:00', '2024-08-26 09:00:00'),
(45, '國慶煙火夜', 'FIREWORK1010', 'percentage', 20, '2027-10-10', '2027-10-10', 1000, 0, 1000, 1, '2024-08-26 11:15:00', '2024-08-26 11:15:00'),
(46, '萬聖節搗蛋趣', 'TRICK1031', 'fixed', 666, '2027-10-31', '2027-10-31', 666, 0, 1500, 1, '2024-08-26 13:30:00', '2024-08-26 13:30:00'),
(47, '感恩節大餐', 'THANKS1125', 'percentage', 28, '2027-11-25', '2027-11-25', 200, 0, 2000, 1, '2024-08-26 15:45:00', '2024-08-26 15:45:00'),
(48, '聖誕跨年狂歡', 'XMAS2028', 'fixed', 2028, '2027-12-24', '2028-01-01', 500, 0, 5000, 1, '2024-08-27 09:00:00', '2024-08-27 09:00:00'),
(49, '元旦新年福袋', 'LUCKY2028', 'percentage', 28, '2028-01-01', '2028-01-07', 288, 0, 2000, 1, '2024-08-27 11:15:00', '2024-08-27 11:15:00'),
(50, '春節開運紅包', 'SPRING2028', 'fixed', 888, '2028-01-27', '2028-02-02', 888, 0, 8888, 1, '2024-08-27 13:30:00', '2024-08-27 13:30:00'),
(51, '元宵節賞燈會', 'LANTERN0215', 'percentage', 15, '2028-02-15', '2028-02-15', 300, 0, 1000, 1, '2024-08-27 15:45:00', '2024-08-27 15:45:00'),
(52, '38女神節寵愛', 'GODDESS38', 'fixed', 380, '2028-03-08', '2028-03-08', 380, 0, 1500, 1, '2024-08-28 09:00:00', '2024-08-28 09:00:00'),
(53, '清明踏青出遊', 'TOUR0404', 'percentage', 18, '2028-04-04', '2028-04-05', 500, 0, 2000, 1, '2024-08-28 11:15:00', '2024-08-28 11:15:00'),
(54, '勞動節優惠', 'LABOR0501', 'fixed', 501, '2028-05-01', '2028-05-01', 501, 0, 1000, 1, '2024-08-28 13:30:00', '2024-08-28 13:30:00'),
(55, '端午划龍舟', 'DRAGON0602', 'percentage', 22, '2028-06-02', '2028-06-02', 200, 0, 1500, 1, '2024-08-28 15:45:00', '2024-08-28 15:45:00'),
(56, '父親節感恩', 'FATHER0808', 'fixed', 588, '2028-08-08', '2028-08-08', 200, 0, 1500, 1, '2024-08-28 15:45:00', '2024-08-28 15:45:00');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
