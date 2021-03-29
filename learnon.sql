-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3304
-- Generation Time: Mar 29, 2021 at 02:06 PM
-- Server version: 8.0.18
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `learnon`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
CREATE TABLE IF NOT EXISTS `answers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `correct` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `question_id`, `answer`, `correct`, `created_at`, `updated_at`) VALUES
(1, 1, 'Yes', 1, NULL, NULL),
(2, 1, 'No', 0, NULL, NULL),
(3, 2, 'Not at all', 0, NULL, NULL),
(4, 2, 'It\'s not bad', 0, NULL, NULL),
(5, 2, 'It is good', 0, NULL, NULL),
(6, 2, 'It is awesome', 1, NULL, NULL),
(49, 34, 'prvi odgovor', 1, '2020-07-12 21:39:05', '2020-07-12 21:39:05'),
(50, 34, 'drugi odgovor', 1, '2020-07-12 21:39:09', '2020-07-12 21:39:09'),
(51, 34, 'treci odgovor', 1, '2020-07-12 21:39:18', '2020-07-12 21:39:18'),
(52, 35, 'prvi odgovor', 1, '2020-07-12 21:39:30', '2020-07-12 21:39:30'),
(53, 35, 'drugi odgovor', 1, '2020-07-12 21:39:34', '2020-07-12 21:39:34'),
(54, 35, 'treci odgovor', 1, '2020-07-12 21:39:38', '2020-07-12 21:39:38'),
(55, 36, 'prvi odgovor', 1, '2020-07-12 21:39:53', '2020-07-12 21:39:53'),
(56, 36, 'drugi odgovor', 1, '2020-07-12 21:40:10', '2020-07-12 21:40:10'),
(57, 36, 'treci odgovor', 1, '2020-07-12 21:40:16', '2020-07-12 21:40:16'),
(64, 40, 'not correct', 0, '2020-07-15 20:45:53', '2020-07-15 20:45:53'),
(65, 40, 'nat korekt', 0, '2020-07-15 20:46:02', '2020-07-15 20:46:02'),
(66, 40, 'correct', 1, '2020-07-15 20:46:09', '2020-07-15 20:46:09'),
(67, 40, 'not', 0, '2020-07-15 20:46:13', '2020-07-15 20:46:13'),
(68, 41, 'correct', 1, '2020-07-15 20:46:39', '2020-07-15 20:46:39'),
(69, 41, 'answer no', 0, '2020-07-15 20:46:53', '2020-07-15 20:46:53'),
(70, 41, 'no', 0, '2020-07-15 20:46:58', '2020-07-15 20:46:58'),
(71, 42, 'Yes', 1, '2020-08-18 07:16:48', '2020-08-18 07:16:48'),
(72, 42, 'No', 0, '2020-08-18 07:16:59', '2020-08-18 07:16:59'),
(73, 43, 'Yes', 1, '2020-08-18 07:17:27', '2020-08-18 07:17:27'),
(74, 43, 'No', 0, '2020-08-18 07:17:31', '2020-08-18 07:17:31'),
(92, 47, 'odgovor', 0, '2020-08-20 09:17:32', '2020-08-20 09:17:32'),
(93, 47, 'odgooovoooor', 0, '2020-08-20 09:17:38', '2020-08-20 09:17:38'),
(94, 47, 'onaj pravi', 1, '2020-08-20 09:17:47', '2020-08-20 09:17:47'),
(95, 48, 'odgovor', 1, '2020-08-20 09:18:02', '2020-08-20 09:18:02'),
(96, 48, 'netacni', 0, '2020-08-20 09:18:06', '2020-08-20 09:18:06'),
(97, 49, 'Nam venenatis', 1, '2021-02-16 21:25:18', '2021-02-16 21:30:41'),
(98, 49, 'Aenean ullamcorper risus dui', 0, '2021-02-16 21:25:33', '2021-02-16 21:25:33'),
(99, 50, 'Orci varius natoque', 0, '2021-02-16 21:26:04', '2021-02-16 21:26:04'),
(100, 50, 'Pellentesque a massa at nunc hendrerit vulputate ac sit amet mi.', 1, '2021-02-16 21:26:26', '2021-02-16 21:26:26');

-- --------------------------------------------------------

--
-- Table structure for table `answer_test_user`
--

DROP TABLE IF EXISTS `answer_test_user`;
CREATE TABLE IF NOT EXISTS `answer_test_user` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `test_user_id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `answer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `answer_test_user_test_user_id_foreign` (`test_user_id`),
  KEY `answer_test_user_question_id_foreign` (`question_id`),
  KEY `answer_test_user_answer_id_foreign` (`answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `answer_test_user`
--

INSERT INTO `answer_test_user` (`id`, `test_user_id`, `question_id`, `answer_id`, `created_at`, `updated_at`) VALUES
(49, 39, 40, 66, NULL, NULL),
(50, 39, 41, 69, NULL, NULL),
(53, 41, 40, 66, NULL, NULL),
(54, 41, 41, 69, NULL, NULL),
(57, 43, 42, 71, NULL, NULL),
(58, 43, 43, 74, NULL, NULL),
(64, 46, 47, 94, NULL, NULL),
(65, 46, 48, 95, NULL, NULL),
(75, 51, 49, 98, NULL, NULL),
(76, 51, 50, 100, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Posts', NULL, NULL),
(2, 'Activities', NULL, NULL),
(3, 'Education', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_post`
--

DROP TABLE IF EXISTS `category_post`;
CREATE TABLE IF NOT EXISTS `category_post` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_post`
--

INSERT INTO `category_post` (`id`, `category_id`, `post_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 1, 3, NULL, NULL),
(4, 1, 4, NULL, NULL),
(5, 1, 5, NULL, NULL),
(6, 1, 6, NULL, NULL),
(7, 1, 7, NULL, NULL),
(8, 1, 8, NULL, NULL),
(9, 1, 9, NULL, NULL),
(10, 1, 10, NULL, NULL),
(11, 1, 11, NULL, NULL),
(12, 1, 12, NULL, NULL),
(13, 1, 13, NULL, NULL),
(14, 1, 14, NULL, NULL),
(15, 1, 15, NULL, NULL),
(16, 1, 16, NULL, NULL),
(17, 1, 17, NULL, NULL),
(18, 1, 18, NULL, NULL),
(19, 1, 19, NULL, NULL),
(20, 1, 20, NULL, NULL),
(21, 1, 21, NULL, NULL),
(22, 1, 22, NULL, NULL),
(23, 1, 23, NULL, NULL),
(24, 1, 24, NULL, NULL),
(26, 2, 25, NULL, NULL),
(27, 2, 26, NULL, NULL),
(28, 2, 27, NULL, NULL),
(29, 3, 28, NULL, NULL),
(30, 3, 29, NULL, NULL),
(31, 3, 30, NULL, NULL),
(34, 3, 32, NULL, NULL),
(35, 1, 34, NULL, NULL),
(37, 1, 37, NULL, NULL),
(38, 2, 43, NULL, NULL),
(39, 1, 44, NULL, NULL),
(41, 1, 46, NULL, NULL),
(42, 1, 45, NULL, NULL),
(43, 1, 40, NULL, NULL),
(44, 1, 47, NULL, NULL),
(45, 2, 47, NULL, NULL),
(46, 2, 45, NULL, NULL),
(47, 1, 30, NULL, NULL),
(48, 2, 30, NULL, NULL),
(49, 1, 48, NULL, NULL),
(50, 2, 49, NULL, NULL),
(51, 1, 50, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`) VALUES
(1, 1, 46, 'Eloquent relationships are defined as methods on your Eloquent model classes. Since, like Eloquent models themselves, relationships also serve as powerful query builders, defining relationships as methods provides powerful method chaining and querying capabilities. For example, we may chain additional constraints on this posts ', NULL, NULL),
(2, 2, 43, 'like Eloquent models themselves, relationships also serve as powerful query builders, defining relationships as methods provides powerful method chaining and querying capabilities. For example, we may chain additional constraints on this posts ', NULL, NULL),
(3, 5, 19, 'Novi komentar testiranje', '2020-06-26 11:34:33', '2020-06-26 11:34:33'),
(6, 5, 46, 'Novi komentar', '2020-06-26 14:30:09', '2020-06-26 14:30:09'),
(9, 1, 45, 'Stari komentar', '2020-06-26 23:01:12', '2020-06-26 23:01:12'),
(10, 5, 44, 'One comment', '2020-09-04 08:12:03', '2020-09-04 08:12:03');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int(11) NOT NULL DEFAULT '5',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cover_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'noimage.jpg',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `user_id`, `title`, `rating`, `status`, `created_at`, `updated_at`, `description`, `cover_image`) VALUES
(1, 1, 'Learning about our platform', 5, 1, '2020-06-26 22:00:00', '2021-03-28 21:12:48', 'Curabitur massa turpis, porttitor quis suscipit nec, pretium id orci. Vivamus a mattis orci. Cras non est consectetur, iaculis felis ac, rutrum turpis. Ut non tellus sit amet turpis tincidunt consequat ac vel lorem. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque elementum molestie sem, et pellentesque turpis iaculis sit amet. Aliquam ut erat lectus. Cras et leo vel purus sollicitudin rhoncus. Donec imperdiet eu ex quis venenatis. Duis varius erat sed leo posuere, sed vehicula justo fermentum.', 'about_1616973168.jpg'),
(2, 2, 'Prvi kurs ', 5, 1, '2020-06-26 22:00:00', '2020-06-26 22:00:00', 'Duis hendrerit lectus eu neque hendrerit, vitae sodales felis vestibulum. Sed aliquam risus non arcu sodales, quis aliquam arcu convallis. Sed rhoncus placerat euismod. Phasellus nec feugiat lectus. Suspendisse odio massa, pretium facilisis ornare ut, semper ut leo. Sed risus metus, porttitor non lobortis id, elementum quis quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque eu malesuada ligula, at cursus lacus. Mauris consequat eleifend molestie. Vestibulum ullamcorper ex turpis, non dapibus dui pulvinar eu. Morbi vestibulum velit vestibulum est consectetur, eu sollicitudin libero pulvinar. Vivamus mattis tincidunt nibh. Morbi quam ipsum, sollicitudin in quam a, mattis vestibulum lectus. ', 'noimage.jpg'),
(3, 5, 'Novi kurs- promjena naziva broj dva', 5, 0, '2020-06-27 21:33:32', '2020-09-14 06:08:37', 'opis kursa', 'noimage.jpg'),
(4, 5, 'Duis hendrerit lectus', 5, 0, '2020-06-24 22:00:00', '2021-03-28 21:22:32', 'Duis hendrerit lectus eu neque hendrerit, vitae sodales felis vestibulum. Sed aliquam risus non arcu sodales, quis aliquam arcu convallis. Sed rhoncus placerat euismod. Phasellus nec feugiat lectus. Suspendisse odio massa, pretium facilisis ornare ut, semper ut leo. Sed risus metus, porttitor non lobortis id, elementum quis quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque eu malesuada ligula, at cursus lacus. Mauris consequat eleifend molestie. Vestibulum ullamcorper ex turpis, non dapibus dui pulvinar eu. Morbi vestibulum velit vestibulum est consectetur, eu sollicitudin libero pulvinar. Vivamus mattis tincidunt nibh. Morbi quam ipsum, sollicitudin in quam a, mattis vestibulum lectus.', 'cover_1616973752.jpg'),
(70, 5, 'Cras eget', 5, 1, '2020-07-15 20:43:43', '2021-03-28 21:13:30', 'Cras eget diam quis turpis volutpat condimentum. Sed consectetur vehicula tellus id bibendum. Aliquam vitae ultricies risus. Aliquam ligula diam, sagittis ut condimentum at, lacinia vel nunc. Mauris in mattis odio.', 'cover_1616973210.jpg'),
(71, 1, 'Curabitur diam sapien', 5, 1, '2020-08-18 07:14:28', '2021-03-28 21:11:53', 'Fusce dapibus velit nec tincidunt scelerisque. Nullam convallis lobortis ex ac vehicula. Donec maximus diam at placerat lobortis. Integer lobortis ultrices tortor quis viverra. Mauris eu lorem nibh. Integer fringilla blandit nunc, quis lacinia sapien tincidunt at. Etiam neque purus, tristique id rhoncus ac, vulputate ac erat. Nulla elementum in orci in iaculis. Proin lobortis magna sed nibh cursus, ac porta odio rutrum. Fusce porta quis metus a sollicitudin. Integer et leo eu mauris sodales fringilla. Duis luctus est eu ex cursus, id pharetra erat suscipit. Nunc vitae pretium odio. Integer a tincidunt tortor, sollicitudin interdum lectus.', 'notebook1_1616973113.jpg'),
(72, 5, 'Nam molestie posuere felis', 5, 1, '2020-08-20 09:15:56', '2021-03-28 21:10:20', 'Quisque placerat ultricies leo eu aliquam. Etiam consectetur ante at lectus viverra, at gravida justo hendrerit. Sed quis gravida sapien, id posuere risus. Nulla tincidunt sed turpis elementum auctor. Donec vel ullamcorper lectus. Integer pretium vestibulum massa, at rhoncus magna maximus eget. Aenean condimentum, est vitae volutpat vestibulum, neque massa lobortis metus, a placerat tortor est non lectus. Quisque eget turpis quis enim mattis eleifend. Sed imperdiet, nulla non malesuada interdum, erat est elementum nulla, vitae tempus odio est quis nunc. Nam vitae arcu sit amet sem faucibus convallis non vel sapien.', 'course-cover_1616973020.jpg'),
(73, 5, 'Morbi ut magna', 5, 1, '2021-02-16 21:23:12', '2021-02-16 21:28:46', 'Morbi ut magna at ex accumsan rhoncus. Nam sed velit vel neque fermentum malesuada. Ut nec cursus quam. Praesent tincidunt commodo dolor sit amet dictum. Etiam facilisis tortor eget nisl sagittis, vel dapibus mauris placerat. Curabitur commodo urna non malesuada sagittis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Etiam vel tempus velit. Maecenas congue, magna vitae tempus dictum, quam libero cursus felis, vitae lobortis justo nulla eget justo.', 'cover_1613514192.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `course_user`
--

DROP TABLE IF EXISTS `course_user`;
CREATE TABLE IF NOT EXISTS `course_user` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `percent` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_user_user_id_foreign` (`user_id`),
  KEY `course_user_course_id_foreign` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_user`
--

INSERT INTO `course_user` (`id`, `user_id`, `course_id`, `percent`, `created_at`, `updated_at`) VALUES
(2, 3, 2, 0, NULL, NULL),
(10, 3, 1, 0, NULL, NULL),
(11, 3, 3, 0, NULL, NULL),
(12, 5, 4, 232, '2020-07-06 22:00:00', '2020-07-05 22:00:00'),
(13, 3, 4, 100, '2020-07-13 22:00:00', '2020-07-04 22:00:00'),
(16, 1, 4, 66, '2020-07-03 11:03:54', NULL),
(20, 5, 70, 66, '2020-07-15 20:47:18', NULL),
(21, 7, 70, 0, '2020-08-05 08:18:36', NULL),
(23, 7, 4, 66, '2020-08-05 08:19:46', NULL),
(27, 9, 70, 66, '2020-08-19 08:08:29', NULL),
(29, 9, 4, 0, '2020-08-19 08:10:09', NULL),
(30, 9, 71, 166, '2020-08-19 08:34:54', NULL),
(32, 5, 72, 100, '2020-08-20 09:18:56', NULL),
(33, 10, 72, 25, '2020-08-20 09:21:47', NULL),
(34, 5, 71, 100, '2020-09-04 08:19:41', NULL),
(37, 5, 1, 0, '2021-02-16 20:00:39', NULL),
(38, 5, 73, 100, '2021-02-16 21:26:39', NULL),
(39, 5, 2, 0, '2021-02-16 22:57:33', NULL),
(40, 8, 3, 0, '2021-02-17 19:50:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

DROP TABLE IF EXISTS `lessons`;
CREATE TABLE IF NOT EXISTS `lessons` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `lessont` longtext COLLATE utf8mb4_unicode_ci,
  `lessonv` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `course_id`, `title`, `description`, `lessont`, `lessonv`, `created_at`, `updated_at`) VALUES
(1, 4, 'Maecenas at augue ', 'Maecenas at augue placerat odio laoreet volutpat. Ut posuere laoreet quam non porttitor. Pellentesque ut porttitor dui. Integer mi magna, fermentum sit amet orci scelerisque, porttitor faucibus mi. Aenean dignissim, nunc quis efficitur vulputate, purus erat elementum ligula, ut pulvinar neque felis a justo. Donec sed magna in arcu consequat gravida eu sed tortor. Aenean blandit feugiat lobortis. Sed mollis lorem in massa elementum, eu accumsan dui pharetra. Praesent et tristique ipsum, sit amet interdum ipsum. Suspendisse gravida diam ut odio tempus convallis. In gravida nunc eu neque molestie, eget ultrices lacus vestibulum. Quisque massa dolor, imperdiet ut ante id, congue efficitur sem. ', '\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel elit arcu. Etiam dapibus ligula ut urna porttitor, id sagittis tellus venenatis. Ut id nisl a ex finibus vulputate a ut orci. Vivamus viverra ligula tempor volutpat lobortis. Etiam vitae pulvinar massa. Aenean sagittis ac justo at tristique. Aliquam in nunc sed neque volutpat tristique. Vestibulum tincidunt pellentesque leo. Nulla commodo sem dignissim nisl faucibus, vitae maximus diam lacinia. Mauris tincidunt, lectus in sagittis luctus, tellus massa eleifend eros, ac tincidunt magna ipsum et ex.\r\n\r\nMaecenas at augue placerat odio laoreet volutpat. Ut posuere laoreet quam non porttitor. Pellentesque ut porttitor dui. Integer mi magna, fermentum sit amet orci scelerisque, porttitor faucibus mi. Aenean dignissim, nunc quis efficitur vulputate, purus erat elementum ligula, ut pulvinar neque felis a justo. Donec sed magna in arcu consequat gravida eu sed tortor. Aenean blandit feugiat lobortis. Sed mollis lorem in massa elementum, eu accumsan dui pharetra. Praesent et tristique ipsum, sit amet interdum ipsum. Suspendisse gravida diam ut odio tempus convallis. In gravida nunc eu neque molestie, eget ultrices lacus vestibulum. Quisque massa dolor, imperdiet ut ante id, congue efficitur sem.\r\n\r\nInteger mollis dapibus odio, nec tincidunt nunc viverra at. Etiam tempus et elit in egestas. Morbi hendrerit auctor nulla, mattis porttitor tellus vestibulum at. Vestibulum tellus arcu, aliquet ac lorem at, fermentum ultrices elit. Phasellus eget urna mauris. Sed metus nibh, fermentum in posuere sit amet, viverra non diam. Nam purus sem, malesuada in sagittis vitae, faucibus non sem. In auctor massa a tincidunt faucibus. Ut accumsan sodales augue, at faucibus neque euismod in. Cras ullamcorper orci purus, et posuere ipsum gravida id.\r\n\r\nIn suscipit orci nec iaculis pellentesque. Sed leo est, auctor vitae efficitur in, lacinia eu est. Aliquam luctus massa eget ligula malesuada tristique. In et augue id sem hendrerit finibus. Mauris iaculis vitae mauris ac porttitor. Fusce congue congue eros et laoreet. Fusce dapibus sem non elit viverra tristique. Cras laoreet tortor a dolor congue feugiat.\r\n\r\nPraesent lobortis, magna vitae aliquet molestie, lorem purus tincidunt lacus, sed hendrerit nunc diam quis libero. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque vel pretium tortor. Quisque ultrices gravida erat, vel finibus ligula. Maecenas sit amet commodo quam. Aliquam massa risus, tristique nec fringilla nec, tincidunt eget nisl. Vivamus blandit sapien eu varius faucibus. Cras semper pretium ex, quis semper orci pretium at. Morbi auctor ipsum quis dui laoreet congue. ', 'https://www.youtube.com/embed/26ELh7P2ZtA', '2020-07-01 22:00:00', NULL),
(2, 4, 'Lorem ipsum', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', ' Maecenas at augue placerat odio laoreet volutpat. Ut posuere laoreet quam non porttitor. Pellentesque ut porttitor dui. Integer mi magna, fermentum sit amet orci scelerisque, porttitor faucibus mi. Aenean dignissim, nunc quis efficitur vulputate, purus erat elementum ligula, ut pulvinar neque felis a justo. Donec sed magna in arcu consequat gravida eu sed tortor. Aenean blandit feugiat lobortis. Sed mollis lorem in massa elementum, eu accumsan dui pharetra. Praesent et tristique ipsum, sit amet interdum ipsum. Suspendisse gravida diam ut odio tempus convallis. In gravida nunc eu neque molestie, eget ultrices lacus vestibulum. Quisque massa dolor, imperdiet ut ante id, congue efficitur sem.\r\n\r\nInteger mollis dapibus odio, nec tincidunt nunc viverra at. Etiam tempus et elit in egestas. Morbi hendrerit auctor nulla, mattis porttitor tellus vestibulum at. Vestibulum tellus arcu, aliquet ac lorem at, fermentum ultrices elit. Phasellus eget urna mauris. Sed metus nibh, fermentum in posuere sit amet, viverra non diam. Nam purus sem, malesuada in sagittis vitae, faucibus non sem. In auctor massa a tincidunt faucibus. Ut accumsan sodales augue, at faucibus neque euismod in. Cras ullamcorper orci purus, et posuere ipsum gravida id.\r\n\r\nIn suscipit orci nec iaculis pellentesque. Sed leo est, auctor vitae efficitur in, lacinia eu est. Aliquam luctus massa eget ligula malesuada tristique. In et augue id sem hendrerit finibus. Mauris iaculis vitae mauris ac porttitor. Fusce congue congue eros et laoreet. Fusce dapibus sem non elit viverra tristique. Cras laoreet tortor a dolor congue feugiat.\r\n\r\nPraesent lobortis, magna vitae aliquet molestie, lorem purus tincidunt lacus, sed hendrerit nunc diam quis libero. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque vel pretium tortor. Quisque ultrices gravida erat, vel finibus ligula. Maecenas sit amet commodo quam. Aliquam massa risus, tristique nec fringilla nec, tincidunt eget nisl. Vivamus blandit sapien eu varius faucibus. Cras semper pretium ex, quis semper orci pretium at. Morbi auctor ipsum quis dui laoreet congue. ', NULL, '2020-07-02 22:00:00', NULL),
(14, 70, 'first tajtl lesson', 'first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson', 'first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson first tajtl lesson', NULL, '2020-07-15 20:44:18', '2020-07-15 20:44:18'),
(15, 70, 'seccond tajtl bla bla bla', 'seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla', 'seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla seccond tajtl bla bla bla', NULL, '2020-07-15 20:44:50', '2020-07-15 20:44:50'),
(17, 71, 'Make Your First Drink of the Day Count', 'Iris Lami, an Ayurvedic therapist, recommends squeezing half of a lemon into warm water in the morning. She says it increases metabolism while cleansing your digestive system before you add anything else into your system for the day. Lemon is one of the 20 Natural Diuretics to Add to Your Diet.', 'Iris Lami, an Ayurvedic therapist, recommends squeezing half of a lemon into warm water in the morning. She says it increases metabolism while cleansing your digestive system before you add anything else into your system for the day. Lemon is one of the 20 Natural Diuretics to Add to Your Diet. Iris Lami, an Ayurvedic therapist, recommends squeezing half of a lemon into warm water in the morning. She says it increases metabolism while cleansing your digestive system before you add anything else into your system for the day. Lemon is one of the 20 Natural Diuretics to Add to Your Diet.\r\nIris Lami, an Ayurvedic therapist, recommends squeezing half of a lemon into warm water in the morning. She says it increases metabolism while cleansing your digestive system before you add anything else into your system for the day. Lemon is one of the 20 Natural Diuretics to Add to Your Diet.\r\nIris Lami, an Ayurvedic therapist, recommends squeezing half of a lemon into warm water in the morning. She says it increases metabolism while cleansing your digestive system before you add anything else into your system for the day. Lemon is one of the 20 Natural Diuretics to Add to Your Diet.', NULL, '2020-08-18 07:15:03', '2020-08-18 07:15:03'),
(18, 71, 'Move While Sitting at Your Desk', 'According to Tim Blake, owner and founder of superdads.com, the single biggest thing you can do to get your metabolism firing is to increase Non-Exercise Activity Thermogenesis (NEAT). \"Basically, that means adding movement to everything you do, whenever and wherever possible,\" he explains. This includes simple things like adding fidgeting hands and feet to five hours of desk work. \"That racks up an additional caloric expenditure equivalent to running 1.5 miles! Fundamentally, this should be your mantra: Never walk when you can run, never stand when you can walk, never sit when you can stand, never lie down when you can sit.\" If you have a desk job or other lifestyle in which you\'re sitting a lot, don\'t miss these 21 Tricks to Lose Weight While Sitting Down.', 'According to Tim Blake, owner and founder of superdads.com, the single biggest thing you can do to get your metabolism firing is to increase Non-Exercise Activity Thermogenesis (NEAT). \"Basically, that means adding movement to everything you do, whenever and wherever possible,\" he explains. This includes simple things like adding fidgeting hands and feet to five hours of desk work. \"That racks up an additional caloric expenditure equivalent to running 1.5 miles! Fundamentally, this should be your mantra: Never walk when you can run, never stand when you can walk, never sit when you can stand, never lie down when you can sit.\" If you have a desk job or other lifestyle in which you\'re sitting a lot, don\'t miss these 21 Tricks to Lose Weight While Sitting Down. According to Tim Blake, owner and founder of superdads.com, the single biggest thing you can do to get your metabolism firing is to increase Non-Exercise Activity Thermogenesis (NEAT). \"Basically, that means adding movement to everything you do, whenever and wherever possible,\" he explains. This includes simple things like adding fidgeting hands and feet to five hours of desk work. \"That racks up an additional caloric expenditure equivalent to running 1.5 miles! Fundamentally, this should be your mantra: Never walk when you can run, never stand when you can walk, never sit when you can stand, never lie down when you can sit.\" If you have a desk job or other lifestyle in which you\'re sitting a lot, don\'t miss these 21 Tricks to Lose Weight While Sitting Down. According to Tim Blake, owner and founder of superdads.com, the single biggest thing you can do to get your metabolism firing is to increase Non-Exercise Activity Thermogenesis (NEAT). \"Basically, that means adding movement to everything you do, whenever and wherever possible,\" he explains. This includes simple things like adding fidgeting hands and feet to five hours of desk work. \"That racks up an additional caloric expenditure equivalent to running 1.5 miles! Fundamentally, this should be your mantra: Never walk when you can run, never stand when you can walk, never sit when you can stand, never lie down when you can sit.\" If you have a desk job or other lifestyle in which you\'re sitting a lot, don\'t miss these 21 Tricks to Lose Weight While Sitting Down.', NULL, '2020-08-18 07:15:44', '2020-08-18 07:15:44'),
(20, 72, 'Lekcija prva', 'opis prve', 'tekst lekcije', NULL, '2020-08-20 09:16:17', '2020-08-20 09:16:17'),
(21, 72, 'lekcija druga', 'opis druge', 'tekst druge', NULL, '2020-08-20 09:16:30', '2020-08-20 09:16:30'),
(22, 72, 'Treca lekcija', 'opis trece', 'tekst trece', NULL, '2020-08-20 09:16:42', '2020-08-20 09:16:42'),
(23, 73, 'Morbi ut magna at ex accumsan rhoncus.', 'Cras blandit faucibus convallis. Donec eleifend sodales dui sed auctor. Vivamus quam ligula, mattis eget metus vel, vulputate posuere urna. Aliquam a pharetra nulla. Proin vel enim condimentum, eleifend arcu vel, lobortis purus. Nunc sodales sapien a nibh rhoncus vehicula. Nullam eu sem condimentum, faucibus enim et, hendrerit risus. Praesent pellentesque elit mauris, vitae efficitur ligula accumsan eget. Aliquam vitae sapien in urna fermentum iaculis.', 'Cras blandit faucibus convallis. Donec eleifend sodales dui sed auctor. Vivamus quam ligula, mattis eget metus vel, vulputate posuere urna. Aliquam a pharetra nulla. Proin vel enim condimentum, eleifend arcu vel, lobortis purus. Nunc sodales sapien a nibh rhoncus vehicula. Nullam eu sem condimentum, faucibus enim et, hendrerit risus. Praesent pellentesque elit mauris, vitae efficitur ligula accumsan eget. Aliquam vitae sapien in urna fermentum iaculis. \r\nCras blandit faucibus convallis. Donec eleifend sodales dui sed auctor. Vivamus quam ligula, mattis eget metus vel, vulputate posuere urna. Aliquam a pharetra nulla. Proin vel enim condimentum, eleifend arcu vel, lobortis purus. Nunc sodales sapien a nibh rhoncus vehicula. Nullam eu sem condimentum, faucibus enim et, hendrerit risus. Praesent pellentesque elit mauris, vitae efficitur ligula accumsan eget. Aliquam vitae sapien in urna fermentum iaculis. \r\nCras blandit faucibus convallis. Donec eleifend sodales dui sed auctor. Vivamus quam ligula, mattis eget metus vel, vulputate posuere urna. Aliquam a pharetra nulla. Proin vel enim condimentum, eleifend arcu vel, lobortis purus. Nunc sodales sapien a nibh rhoncus vehicula. Nullam eu sem condimentum, faucibus enim et, hendrerit risus. Praesent pellentesque elit mauris, vitae efficitur ligula accumsan eget. Aliquam vitae sapien in urna fermentum iaculis. \r\nCras blandit faucibus convallis. Donec eleifend sodales dui sed auctor. Vivamus quam ligula, mattis eget metus vel, vulputate posuere urna. Aliquam a pharetra nulla. Proin vel enim condimentum, eleifend arcu vel, lobortis purus. Nunc sodales sapien a nibh rhoncus vehicula. Nullam eu sem condimentum, faucibus enim et, hendrerit risus. Praesent pellentesque elit mauris, vitae efficitur ligula accumsan eget. Aliquam vitae sapien in urna fermentum iaculis.', NULL, '2021-02-16 21:23:44', '2021-02-16 21:23:44'),
(24, 73, 'Donec eleifend sodales', 'Donec eleifend sodales dui sed auctor. Vivamus quam ligula, mattis eget metus vel, vulputate posuere urna. Aliquam a pharetra nulla. Proin vel enim condimentum, eleifend arcu vel, lobortis purus. Nunc sodales sapien a nibh rhoncus vehicula. Nullam eu sem condimentum, faucibus enim et, hendrerit risus. Praesent pellentesque elit mauris, vitae efficitur ligula accumsan eget. Aliquam vitae sapien in urna fermentum iaculis.', 'Donec eleifend sodales dui sed auctor. Vivamus quam ligula, mattis eget metus vel, vulputate posuere urna. Aliquam a pharetra nulla. Proin vel enim condimentum, eleifend arcu vel, lobortis purus. Nunc sodales sapien a nibh rhoncus vehicula. Nullam eu sem condimentum, faucibus enim et, hendrerit risus. Praesent pellentesque elit mauris, vitae efficitur ligula accumsan eget. Aliquam vitae sapien in urna fermentum iaculis. Donec eleifend sodales dui sed auctor. Vivamus quam ligula, mattis eget metus vel, vulputate posuere urna. Aliquam a pharetra nulla. Proin vel enim condimentum, eleifend arcu vel, lobortis purus. Nunc sodales sapien a nibh rhoncus vehicula. Nullam eu sem condimentum, faucibus enim et, hendrerit risus. Praesent pellentesque elit mauris, vitae efficitur ligula accumsan eget. Aliquam vitae sapien in urna fermentum iaculis. Donec eleifend sodales dui sed auctor. Vivamus quam ligula, mattis eget metus vel, vulputate posuere urna. Aliquam a pharetra nulla. Proin vel enim condimentum, eleifend arcu vel, lobortis purus. Nunc sodales sapien a nibh rhoncus vehicula. Nullam eu sem condimentum, faucibus enim et, hendrerit risus. Praesent pellentesque elit mauris, vitae efficitur ligula accumsan eget. Aliquam vitae sapien in urna fermentum iaculis. Donec eleifend sodales dui sed auctor. Vivamus quam ligula, mattis eget metus vel, vulputate posuere urna. Aliquam a pharetra nulla. Proin vel enim condimentum, eleifend arcu vel, lobortis purus. Nunc sodales sapien a nibh rhoncus vehicula. Nullam eu sem condimentum, faucibus enim et, hendrerit risus. Praesent pellentesque elit mauris, vitae efficitur ligula accumsan eget. Aliquam vitae sapien in urna fermentum iaculis.', NULL, '2021-02-16 21:29:18', '2021-02-16 21:29:18');

-- --------------------------------------------------------

--
-- Table structure for table `lesson_user`
--

DROP TABLE IF EXISTS `lesson_user`;
CREATE TABLE IF NOT EXISTS `lesson_user` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lesson_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `completed` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `lesson_user_user_id_foreign` (`user_id`),
  KEY `lesson_user_lesson_id_foreign` (`lesson_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lesson_user`
--

INSERT INTO `lesson_user` (`id`, `lesson_id`, `user_id`, `completed`, `created_at`, `updated_at`) VALUES
(3, 1, 5, 1, '2020-07-11 19:41:07', '2020-07-11 19:41:07'),
(11, 2, 5, 1, '2020-07-11 20:50:02', '2020-07-11 20:50:02'),
(12, 1, 1, 1, '2020-07-11 21:06:04', '2020-07-11 21:06:04'),
(13, 2, 1, 1, '2020-07-11 21:18:31', '2020-07-11 21:18:31'),
(17, 14, 5, 1, '2020-07-15 22:47:33', '2020-07-15 22:47:33'),
(18, 15, 5, 1, '2020-07-15 22:47:41', '2020-07-15 22:47:41'),
(19, 14, 7, 1, '2020-08-05 10:16:59', '2020-08-05 10:16:59'),
(20, 15, 7, 1, '2020-08-05 10:17:32', '2020-08-05 10:17:32'),
(23, 1, 7, 1, '2020-08-05 10:19:50', '2020-08-05 10:19:50'),
(24, 2, 7, 1, '2020-08-05 10:19:54', '2020-08-05 10:19:54'),
(27, 14, 9, 1, '2020-08-19 10:08:37', '2020-08-19 10:08:37'),
(28, 15, 9, 1, '2020-08-19 10:08:43', '2020-08-19 10:08:43'),
(31, 17, 9, 1, '2020-08-19 10:53:33', '2020-08-19 10:53:33'),
(32, 18, 9, 1, '2020-08-19 10:53:49', '2020-08-19 10:53:49'),
(34, 20, 5, 1, '2020-08-20 11:19:02', '2020-08-20 11:19:02'),
(35, 20, 10, 1, '2020-08-20 11:26:33', '2020-08-20 11:26:33'),
(39, 18, 1, 1, '2021-01-16 10:24:20', '2021-01-16 10:24:20'),
(40, 23, 5, 1, '2021-02-16 22:26:52', '2021-02-16 22:26:52'),
(41, 1, 5, 1, '2021-03-29 00:07:09', '2021-03-29 00:07:09'),
(42, 1, 5, 1, '2021-03-29 00:08:08', '2021-03-29 00:08:08'),
(43, 1, 5, 1, '2021-03-29 00:08:41', '2021-03-29 00:08:41'),
(44, 1, 5, 1, '2021-03-29 00:09:26', '2021-03-29 00:09:26');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(6, '2020_06_15_110459_create_roles_table', 2),
(7, '2020_06_15_110729_create_role_user_table', 2),
(8, '2020_06_16_002354_create_foreign_keys_for_role_user_table', 3),
(9, '2020_06_16_185840_create_posts_table', 4),
(10, '2020_06_16_223657_add_user_id_to_posts', 5),
(11, '2020_06_22_215734_create_categories_table', 6),
(12, '2020_06_22_215946_create_category_post_table', 6),
(13, '2020_06_25_091100_create_courses_table', 7),
(14, '2020_06_25_223425_create_category_courses_table', 7),
(15, '2020_06_25_224045_create_contents_table', 7),
(16, '2020_06_25_224412_create_tests_table', 7),
(17, '2020_06_25_225153_create_reviews_table', 7),
(18, '2020_06_26_111309_create_comments_table', 8),
(19, '2020_06_26_143116_add_avatar_to_users', 9),
(20, '2020_06_26_232102_create_profils_table', 10),
(21, '2020_06_27_211207_create_courses_table', 11),
(22, '2020_06_27_212604_create_course_user_table', 11),
(23, '2020_06_27_230459_create_courses_table', 12),
(24, '2020_06_27_232540_create_courses_table', 13),
(25, '2020_06_27_232729_create_courses_table', 14),
(26, '2020_06_28_021124_create_reviews_table', 15),
(27, '2020_07_02_224524_add_description_to_courses', 16),
(28, '2020_07_03_001829_add_description_to_users', 17),
(31, '2020_07_03_133125_create_lessons_table', 18),
(32, '2020_07_03_134548_create_tests_table', 19),
(33, '2020_07_03_195511_create_questions_table', 20),
(34, '2020_07_03_195530_create_answers_table', 20),
(35, '2020_07_03_203728_create_test_user_table', 21),
(36, '2020_07_03_225010_create_results_table', 21),
(37, '2020_07_03_225217_create_answer_result_table', 21),
(38, '2020_07_03_230522_create_answer_test_user_table', 22),
(40, '2020_07_06_182459_create_test_users_table', 23),
(41, '2020_07_10_184440_create_lesson_user_table', 24),
(42, '2019_05_03_000001_create_customer_columns', 25),
(43, '2019_05_03_000002_create_subscriptions_table', 25),
(44, '2019_05_03_000003_create_subscription_items_table', 25),
(45, '2020_10_05_093625_create_payments_table', 26),
(46, '2021_02_16_110228_create_foreign_keys_for_course_user_table', 27),
(47, '2021_02_16_112520_create_foreign_keys_for_answer_test_user_table', 28),
(48, '2021_02_16_203922_create_foreign_keys_for_lesson_user_table', 29),
(49, '2021_02_16_203952_create_foreign_keys_for_test_user_table', 30);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `payment_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(10,2) NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cover_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `body`, `created_at`, `updated_at`, `cover_image`) VALUES
(1, 1, 'Quia occaecati vel consequatur sunt. Edited', 'Incidunt ea iste ut ipsam. Eaque magni et velit suscipit saepe at dolorum amet. Ad odit voluptas pariatur consequatur nobis quam impedit.', '2020-06-16 17:17:14', '2021-02-09 07:55:57', ''),
(2, 1, 'Dolorem voluptatem nisi odit optio.', 'Molestiae ab esse qui ut. Et aut quo sed quia. Cum sit voluptatibus eveniet fugit quisquam voluptatibus.', '2020-06-16 17:17:14', '2020-06-16 17:17:14', ''),
(3, 1, 'Rerum et asperiores ad et ut eaque sed.', 'Deserunt veritatis tempora repellat est tempore. Aspernatur voluptatum tenetur nemo. Saepe sit corporis ut. Blanditiis fuga harum voluptas aut inventore.', '2020-06-16 17:17:14', '2020-06-16 17:17:14', ''),
(4, 1, 'Sapiente qui sed odit eaque id totam.', 'Vitae enim voluptas omnis repellendus commodi consequatur est. Enim eos enim necessitatibus quaerat fugiat rerum est.', '2020-06-16 17:17:14', '2020-06-16 17:17:14', ''),
(5, 1, 'Qui ut voluptates et voluptatibus.', 'Quibusdam rerum nihil aut aut ut dolor saepe. Ut consequatur consequatur est eaque rerum. At tempore non sit. Ea numquam officia omnis qui.', '2020-06-16 17:17:14', '2020-06-16 17:17:14', ''),
(6, 1, 'Fugit consequatur voluptas molestiae.', 'Quia occaecati molestiae laboriosam quibusdam et tempora qui non. Reiciendis autem itaque eum magnam. Pariatur eius consequatur dolore voluptatem ut maxime corrupti non.', '2020-06-16 17:17:14', '2020-06-16 17:17:14', ''),
(7, 1, 'Sedmi post', 'Animi et voluptates impedit optio facere. Corrupti autem dolores repellat tempora aut autem qui. Voluptatibus omnis neque dolore quia voluptas.', '2020-06-16 17:17:14', '2020-06-17 01:38:54', ''),
(8, 1, 'Molestiae fugiat rem quia ut sit.', 'Adipisci quasi mollitia ut dolorum. Temporibus eaque ipsum ut a voluptas. Minima consequatur assumenda aspernatur consectetur est et. Recusandae ad asperiores quo iusto cum.', '2020-06-16 17:17:14', '2020-06-16 17:17:14', ''),
(9, 1, 'Eos ut non hic ea id.', 'Sed assumenda omnis distinctio unde iure. Consequatur qui sint illum dolore voluptas earum quasi. Laborum provident sit inventore nemo reiciendis qui exercitationem.', '2020-06-16 17:17:14', '2020-06-16 17:17:14', ''),
(10, 1, 'Repellat quisquam delectus placeat.', 'Distinctio non et nobis non. Quos omnis velit mollitia qui commodi corporis ipsum. Minima aut molestiae voluptatem id. Quidem ullam molestiae iusto cum perferendis.', '2020-06-16 17:17:14', '2020-06-16 17:17:14', ''),
(11, 1, 'Consequatur et quis sapiente enim.', 'Cumque qui voluptas vel. Totam qui ut nemo aut. Maxime sed exercitationem eum qui aut esse. Et sunt voluptatem asperiores.', '2020-06-16 17:17:14', '2020-06-16 17:17:14', ''),
(12, 1, 'Optio ipsam sit autem fugit deleniti.', 'Mollitia velit voluptatem dolorem placeat et temporibus. Molestiae odio ut quas laborum qui reiciendis. Temporibus nostrum voluptas harum quas non.', '2020-06-16 17:17:14', '2020-06-16 17:17:14', ''),
(13, 3, 'Consectetur cum sit qui omnis.', 'Molestias error provident quia doloremque fugiat similique ex. Eaque dolor et minima suscipit aut.', '2020-06-16 17:17:14', '2020-06-16 17:17:14', ''),
(14, 3, 'Natus vero id qui doloremque quae.', 'Aut est aut explicabo voluptatem impedit. Est voluptas dolor et quam praesentium ducimus. Natus facere qui corporis rerum quod saepe enim. Laborum omnis cum perferendis quidem.', '2020-06-16 17:17:14', '2020-06-16 17:17:14', ''),
(15, 3, 'Porro vel maiores odio ipsa.', 'Mollitia alias molestiae maiores nam. Voluptate quam velit ducimus quod omnis expedita beatae. Vero similique voluptatem iste.', '2020-06-16 17:17:14', '2020-06-16 17:17:14', ''),
(16, 3, 'Ratione est reprehenderit fuga.', 'Voluptate quisquam commodi et itaque ad ut. Delectus atque autem incidunt. Quae commodi et maxime deserunt eveniet. Dolore quia magni deserunt culpa iste libero. Corporis ut quidem necessitatibus.', '2020-06-16 17:17:14', '2020-06-16 17:17:14', ''),
(17, 3, 'Doloremque at nulla quod deleniti in.', 'Molestiae commodi deleniti ex et. Odio quas omnis ut facere sed aut. Exercitationem tenetur sequi quia vero.', '2020-06-16 17:17:14', '2020-06-16 17:17:14', ''),
(18, 4, 'EDITOVANO', 'Ut dolores ad voluptatem quasi eos quisquam. Porro impedit esse optio qui sed vitae. Necessitatibus suscipit est magni laborum molestiae. Quis et ut magnam quod sequi. Editovano', '2020-06-16 17:17:14', '2020-06-17 01:49:07', ''),
(19, 4, 'Repellat sed eum amet et qui.', 'Ab quibusdam dolor quia. Eum ut corporis ut ea totam est. Modi non possimus et totam libero blanditiis ullam voluptatum. Quod magnam magni sunt fugit. Heheheh', '2020-06-16 17:17:14', '2020-06-17 01:35:18', ''),
(20, 4, 'Et et nam similique animi quisquam.', 'Aspernatur blanditiis adipisci voluptatum. Et debitis libero deserunt aut ipsa. Nobis velit in est ut eos optio.', '2020-06-16 17:17:14', '2020-06-16 17:17:14', ''),
(21, 3, 'Rerum ad et cumque nisi necessitatibus.', 'Reiciendis voluptatem neque in modi. Consequatur exercitationem unde nesciunt rerum aut blanditiis. Vel non et enim voluptate quia.', '2020-06-16 17:17:14', '2020-06-16 17:17:14', ''),
(22, 3, 'Atque autem explicabo in in voluptas.', 'Quibusdam incidunt explicabo aut veritatis beatae et provident. Corrupti asperiores debitis nemo architecto omnis rerum ut rerum.', '2020-06-16 17:17:14', '2020-06-16 17:17:14', ''),
(23, 3, 'Sunt ullam dolores dolor ut.', 'Est perferendis aspernatur consequatur est ut non. Quos rerum eos consectetur ut architecto consectetur.', '2020-06-16 17:17:14', '2020-06-16 17:17:14', ''),
(24, 3, 'Molestiae illum ducimus similique.', 'Iste dolorum quia sed tenetur culpa. Totam sed repellendus et dicta blanditiis iure et corrupti. Tempora reprehenderit eveniet ex qui eaque deserunt quisquam.', '2020-06-16 17:17:14', '2020-06-16 17:17:14', ''),
(25, 3, 'Quaerat sequi nostrum enim fugit hic.', 'Earum deleniti rerum saepe sunt aspernatur. Dolor id placeat aut consequatur in ut. Id ut minima omnis nulla et vel molestiae nemo. Commodi fugiat ratione molestias quos dicta sit tempora.', '2020-06-16 17:17:14', '2020-06-16 17:17:14', ''),
(26, 2, 'Ut exercitationem aut autem.', 'Corrupti ipsam non aspernatur maiores aut numquam. Harum pariatur quaerat necessitatibus aliquid corrupti rem unde.', '2020-06-16 17:17:14', '2020-06-16 17:17:14', ''),
(27, 2, 'Autem quia et qui soluta id quod.', 'Et minima cumque repellendus quo harum. Reprehenderit labore optio enim aut explicabo sapiente. Voluptas in quas ut nisi dolore. Dolore quia sed natus quia.', '2020-06-16 17:17:14', '2020-06-16 17:17:14', ''),
(28, 2, 'Maiores error porro reiciendis.', 'Vitae libero dolorem laboriosam suscipit. Nihil et necessitatibus voluptates. Sit voluptatum velit enim ea. Exercitationem voluptate facere corrupti doloribus voluptatem ut sed dolor.', '2020-06-16 17:17:14', '2020-06-16 17:17:14', ''),
(29, 2, 'Ad autem quam autem minima ex.', 'Qui porro officia quos voluptatem laudantium omnis. Magni quo repudiandae porro et rerum ipsa. Laborum eos omnis alias quo.', '2020-06-16 17:17:14', '2020-06-16 17:17:14', ''),
(30, 2, 'At accusantium ut error eos est minus.', 'Doloremque sit alias blanditiis. Voluptatem dignissimos mollitia ipsa in quod. Harum occaecati ipsum ea porro. Voluptatem occaecati aperiam sed optio.', '2020-06-16 17:17:14', '2020-06-16 17:17:14', ''),
(32, 5, 'My first post', 'This is my story', '2020-06-16 21:12:55', '2020-06-16 21:12:55', 'noimage.png'),
(34, 5, 'Trial', 'Trial By Mistaken', '2020-06-23 00:23:23', '2020-06-26 23:16:29', 'noimage.png'),
(43, 1, 'novi test kategorije', 'test kategorije 2', '2020-06-24 21:07:05', '2020-06-24 21:07:05', 'noimage.jpg'),
(44, 1, 'Quisque', 'Morbi pulvinar dolor sem, in pharetra libero fringilla ac. Phasellus non maximus diam. Cras quam tellus, malesuada volutpat suscipit in, convallis blandit ex. Morbi maximus odio felis, et consectetur erat posuere sit amet. Cras vel vestibulum nulla.\r\n\r\nInteger non nulla ac augue elementum maximus. Fusce tristique dignissim augue, ac consequat lectus malesuada at. Etiam non turpis libero. Nam commodo, felis ac congue placerat, tortor orci semper tortor, id iaculis lorem nibh nec lacus. Nunc consectetur sagittis dui, vitae aliquam lacus. Vestibulum nec massa a eros tristique maximus ut quis mauris. Sed ut nisi vel urna suscipit dapibus. Etiam et eleifend justo, sit amet venenatis elit. Pellentesque ullamcorper facilisis massa eget bibendum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla facilisi. Aliquam est libero, euismod ut turpis vel, semper pellentesque lacus.\r\n\r\nCurabitur feugiat libero nisi, quis porttitor sem sollicitudin ac. Quisque ultricies felis vitae odio pellentesque elementum. Quisque tempor lectus id massa sodales facilisis. Aliquam egestas lobortis rutrum. Cras vitae dictum massa. Phasellus semper augue eros, vulputate euismod urna porta et. Suspendisse eget ex vel ex pellentesque facilisis ut et eros. Mauris ac lectus eros.', '2020-06-24 21:11:45', '2021-03-28 20:49:49', 'about_1616971789.jpg'),
(45, 5, 'Sed ut nisi vel urna', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut turpis sapien, molestie at risus sit amet, malesuada fermentum sapien. Mauris laoreet sed velit eu convallis. Quisque sollicitudin at urna sit amet vestibulum. Aliquam quis est vel lacus dignissim egestas. Quisque elementum placerat leo eget vulputate. Sed turpis sapien, fringilla quis tincidunt vitae, rhoncus et sapien. Sed commodo finibus lorem in sagittis. Praesent gravida nisl nibh, ultrices consequat nibh blandit a. In vel dolor ullamcorper, scelerisque mauris vel, semper velit. Nam eleifend lobortis tincidunt. Etiam non diam quis nibh viverra euismod. Donec tincidunt, neque et viverra pretium, odio quam accumsan ligula, sed volutpat lacus lacus euismod nibh. Ut interdum cursus nisi, eget rhoncus sapien pellentesque eu. Nam rutrum lacinia sapien auctor cursus.\r\n\r\nNunc porta enim eu auctor lobortis. Fusce viverra lacus ultricies, ultricies ipsum vitae, tincidunt nibh. Quisque ac tincidunt tellus. Curabitur consequat libero lorem, in vestibulum turpis sollicitudin nec. Phasellus dignissim turpis nisi, vel dictum erat gravida non. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nam scelerisque ornare nisi vitae bibendum.', '2020-06-24 21:12:36', '2021-03-28 20:10:57', 'notebook1_1616969457.jpg'),
(46, 5, 'Fusce viverra lacus', 'Nunc porta enim eu auctor lobortis. Fusce viverra lacus ultricies, ultricies ipsum vitae, tincidunt nibh. Quisque ac tincidunt tellus. Curabitur consequat libero lorem, in vestibulum turpis sollicitudin nec. Phasellus dignissim turpis nisi, vel dictum erat gravida non. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nam scelerisque ornare nisi vitae bibendum.\r\n\r\nUt ut velit lobortis, rutrum elit ac, dictum lectus. Proin gravida mollis ex, et tempor nisl hendrerit et. Curabitur odio justo, luctus vitae lorem sed, consequat accumsan arcu. Fusce varius mollis erat vel congue. Sed vel lacinia enim, sed maximus nisl. Proin lobortis mauris eu tempus efficitur. Nullam ut libero luctus, facilisis velit et, venenatis est. Etiam eget neque sed dui molestie vestibulum. Nunc vel leo sed erat sodales volutpat at quis sapien. Pellentesque efficitur gravida ex eget tempor. Nulla et elementum dolor. Morbi pulvinar dolor sem, in pharetra libero fringilla ac. Phasellus non maximus diam. Cras quam tellus, malesuada volutpat suscipit in, convallis blandit ex. Morbi maximus odio felis, et consectetur erat posuere sit amet. Cras vel vestibulum nulla.', '2020-06-24 21:17:25', '2021-03-28 20:49:18', 'course-cover_1616971758.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `test_id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `test_id`, `question`, `created_at`, `updated_at`) VALUES
(1, 1, 'Is this platform awesome? ', NULL, NULL),
(2, 1, 'How impressed are you? ', NULL, NULL),
(34, 30, 'Prvo pitanje', '2020-07-12 21:39:05', '2020-07-12 21:39:05'),
(35, 30, 'Drugo pitanje', '2020-07-12 21:39:30', '2020-07-12 21:39:30'),
(36, 30, 'Trece pitanje', '2020-07-12 21:39:53', '2020-07-12 21:39:53'),
(40, 33, 'first?', '2020-07-15 20:45:53', '2020-07-15 20:45:53'),
(41, 33, 'next question', '2020-07-15 20:46:39', '2020-07-15 20:46:39'),
(42, 34, 'Should you drink water?', '2020-08-18 07:16:48', '2020-08-18 07:16:48'),
(43, 34, 'Should you eat protein rich food?', '2020-08-18 07:17:27', '2020-08-18 07:17:27'),
(47, 35, 'Prvo pitanje', '2020-08-20 09:17:32', '2020-08-20 09:17:32'),
(48, 35, 'Novo pitanje', '2020-08-20 09:18:02', '2020-08-20 09:18:02'),
(49, 36, 'Vivamus non libero a dolor viverra scelerisque?', '2021-02-16 21:25:18', '2021-02-16 21:25:18'),
(50, 36, 'Pellentesque a massa at nunc', '2021-02-16 21:26:04', '2021-02-16 21:26:04');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `course_id`, `rate`, `body`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 4, 'Prety good.', NULL, NULL),
(2, 2, 1, 1, 'Terrible! ', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '2020-06-15 22:23:00', '2020-06-15 22:23:00'),
(2, 'Author', '2020-06-15 22:23:00', '2020-06-15 22:23:00'),
(3, 'Member', '2020-06-15 22:23:00', '2020-06-15 22:23:00'),
(4, 'User', '2020-06-15 22:23:00', '2020-06-15 22:23:00');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
CREATE TABLE IF NOT EXISTS `role_user` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_user_id_foreign` (`user_id`),
  KEY `role_user_role_id_foreign` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 2, 2, NULL, NULL),
(8, 4, 4, NULL, NULL),
(16, 1, 1, NULL, NULL),
(17, 1, 5, NULL, NULL),
(19, 4, 7, NULL, NULL),
(20, 4, 8, NULL, NULL),
(21, 4, 9, NULL, NULL),
(22, 4, 10, NULL, NULL),
(23, 4, 11, NULL, NULL),
(24, 4, 12, NULL, NULL),
(25, 4, 13, NULL, NULL),
(26, 4, 14, NULL, NULL),
(27, 4, 3, NULL, NULL),
(28, 4, 15, NULL, NULL),
(29, 4, 16, NULL, NULL),
(30, 4, 17, NULL, NULL),
(31, 4, 18, NULL, NULL),
(32, 4, 19, NULL, NULL),
(33, 4, 20, NULL, NULL),
(34, 4, 21, NULL, NULL),
(35, 4, 22, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
CREATE TABLE IF NOT EXISTS `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_plan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `user_id`, `name`, `stripe_id`, `stripe_status`, `stripe_plan`, `quantity`, `trial_ends_at`, `ends_at`, `created_at`, `updated_at`) VALUES
(26, 9, 'main', 'sub_Iujwht4JIVa3Dy', 'active', 'price_1I9dU0ED8dpSHnI3I1CXIKFw', 1, NULL, NULL, '2021-02-09 10:32:25', '2021-02-09 10:32:25'),
(27, 8, 'main', 'sub_Iv4QZ82w7kuefz', 'active', 'price_1I9dU0ED8dpSHnI3Dgzjt6SP', 1, NULL, '2021-03-10 07:42:25', '2021-02-10 07:42:27', '2021-02-10 22:27:27'),
(31, 7, 'main', 'sub_IvIaiO4eLKr18i', 'canceled', 'price_1I9dU0ED8dpSHnI3I1CXIKFw', 1, NULL, '2021-02-10 22:23:08', '2021-02-10 22:20:57', '2021-02-10 22:23:08'),
(32, 10, 'main', 'sub_IvIpPDAqhVfZoP', 'active', 'price_1IJG6ZED8dpSHnI3BAIvHwQf', 1, NULL, NULL, '2021-02-10 22:35:39', '2021-02-10 22:35:39'),
(33, 14, 'main', 'sub_IvIyNxPuwZhHNy', 'active', 'price_1IJG6ZED8dpSHnI3BAIvHwQf', 1, NULL, '2021-02-11 22:44:23', '2021-02-10 22:44:26', '2021-02-10 22:44:48'),
(34, 3, 'main', 'sub_IvRaFcEPV9OlaJ', 'active', 'price_1IJG6ZED8dpSHnI3BAIvHwQf', 1, NULL, NULL, '2021-02-11 07:38:52', '2021-02-11 07:38:52'),
(35, 15, 'main', 'sub_IvRfTHnC05tskR', 'active', 'price_1IJG6ZED8dpSHnI3BAIvHwQf', 1, NULL, '2021-02-12 07:44:16', '2021-02-11 07:44:18', '2021-02-11 07:44:44'),
(36, 16, 'main', 'sub_IvRl5kL7fUEuEN', 'active', 'price_1IJG6ZED8dpSHnI3BAIvHwQf', 1, NULL, NULL, '2021-02-11 07:49:31', '2021-02-11 07:49:31'),
(37, 17, 'main', 'sub_IvRnwKKKhouSDE', 'active', 'price_1IJG6ZED8dpSHnI3BAIvHwQf', 1, NULL, NULL, '2021-02-11 07:52:00', '2021-02-11 07:52:00'),
(38, 18, 'main', 'sub_IvRppD7ozP9sBX', 'active', 'price_1IJG6ZED8dpSHnI3BAIvHwQf', 1, NULL, '2021-02-12 07:53:41', '2021-02-11 07:53:43', '2021-02-11 07:55:17'),
(39, 19, 'main', 'sub_IvRrws2cYGgHRK', 'active', 'price_1IJG6ZED8dpSHnI3BAIvHwQf', 1, NULL, NULL, '2021-02-11 07:56:15', '2021-02-11 07:56:15'),
(40, 20, 'main', 'sub_IvRy7Mg9KSDIG3', 'active', 'price_1IJG6ZED8dpSHnI3BAIvHwQf', 1, NULL, '2021-02-12 08:02:26', '2021-02-11 08:02:28', '2021-02-11 08:04:57'),
(41, 21, 'main', 'sub_IvS3serN89p1eD', 'active', 'price_1IJG6ZED8dpSHnI3BAIvHwQf', 1, NULL, NULL, '2021-02-11 08:07:41', '2021-02-11 08:07:41'),
(42, 22, 'main', 'sub_IvS7roE3BRAvP5', 'active', 'price_1IJG6ZED8dpSHnI3BAIvHwQf', 1, NULL, NULL, '2021-02-11 08:11:45', '2021-02-11 08:11:45'),
(43, 23, 'main', 'sub_IvSEfk5PaVcfGN', 'active', 'price_1IJG6ZED8dpSHnI3BAIvHwQf', 1, NULL, NULL, '2021-02-11 08:19:05', '2021-02-11 08:19:05'),
(44, 14, 'main', 'sub_IvotSK7EGCoWvJ', 'active', 'price_1IJG6ZED8dpSHnI3BAIvHwQf', 1, NULL, NULL, '2021-02-12 07:44:04', '2021-02-12 07:44:04');

-- --------------------------------------------------------

--
-- Table structure for table `subscription_items`
--

DROP TABLE IF EXISTS `subscription_items`;
CREATE TABLE IF NOT EXISTS `subscription_items` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_plan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscription_items_subscription_id_stripe_plan_unique` (`subscription_id`,`stripe_plan`),
  KEY `subscription_items_stripe_id_index` (`stripe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscription_items`
--

INSERT INTO `subscription_items` (`id`, `subscription_id`, `stripe_id`, `stripe_plan`, `quantity`, `created_at`, `updated_at`) VALUES
(24, 24, 'si_Iuj7ytrB3VUVnh', 'price_1IIskfED8dpSHnI3yXuwxvgh', 1, '2021-02-09 09:41:49', '2021-02-09 09:41:49'),
(25, 25, 'si_IujiVN2R0HU1CJ', 'price_1IIskfED8dpSHnI3yXuwxvgh', 1, '2021-02-09 10:18:25', '2021-02-09 10:18:25'),
(26, 26, 'si_IujwGtP8T13PBl', 'price_1I9dU0ED8dpSHnI3I1CXIKFw', 1, '2021-02-09 10:32:25', '2021-02-09 10:32:25'),
(27, 27, 'si_Iv4QGUZWuQqj86', 'price_1I9dU0ED8dpSHnI3Dgzjt6SP', 1, '2021-02-10 07:42:27', '2021-02-10 07:42:27'),
(28, 28, 'si_Iv6To68XUUyRCq', 'price_1IJG6ZED8dpSHnI3BAIvHwQf', 1, '2021-02-10 09:49:27', '2021-02-10 09:49:27'),
(29, 29, 'si_IvHw17bMTiO6Ac', 'price_1IJG6ZED8dpSHnI3BAIvHwQf', 1, '2021-02-10 21:41:17', '2021-02-10 21:41:17'),
(30, 30, 'si_IvI0alxLd8oIxL', 'price_1IJG6ZED8dpSHnI3BAIvHwQf', 1, '2021-02-10 21:44:29', '2021-02-10 21:44:29'),
(31, 31, 'si_IvIaP34HKY1QZH', 'price_1I9dU0ED8dpSHnI3I1CXIKFw', 1, '2021-02-10 22:20:57', '2021-02-10 22:20:57'),
(32, 32, 'si_IvIpgtWJThRkzx', 'price_1IJG6ZED8dpSHnI3BAIvHwQf', 1, '2021-02-10 22:35:39', '2021-02-10 22:35:39'),
(33, 33, 'si_IvIy5QAXjsC6kR', 'price_1IJG6ZED8dpSHnI3BAIvHwQf', 1, '2021-02-10 22:44:26', '2021-02-10 22:44:26'),
(34, 34, 'si_IvRaV1ObM6OXBP', 'price_1IJG6ZED8dpSHnI3BAIvHwQf', 1, '2021-02-11 07:38:52', '2021-02-11 07:38:52'),
(35, 35, 'si_IvRfxerh8hBvQG', 'price_1IJG6ZED8dpSHnI3BAIvHwQf', 1, '2021-02-11 07:44:18', '2021-02-11 07:44:18'),
(36, 36, 'si_IvRlW8g52H0UVh', 'price_1IJG6ZED8dpSHnI3BAIvHwQf', 1, '2021-02-11 07:49:31', '2021-02-11 07:49:31'),
(37, 37, 'si_IvRnys9L5hDmsM', 'price_1IJG6ZED8dpSHnI3BAIvHwQf', 1, '2021-02-11 07:52:00', '2021-02-11 07:52:00'),
(38, 38, 'si_IvRpx4AUjGkGj9', 'price_1IJG6ZED8dpSHnI3BAIvHwQf', 1, '2021-02-11 07:53:43', '2021-02-11 07:53:43'),
(39, 39, 'si_IvRrIiE3lxM5rL', 'price_1IJG6ZED8dpSHnI3BAIvHwQf', 1, '2021-02-11 07:56:15', '2021-02-11 07:56:15'),
(40, 40, 'si_IvRyR1fgFBMbrf', 'price_1IJG6ZED8dpSHnI3BAIvHwQf', 1, '2021-02-11 08:02:28', '2021-02-11 08:02:28'),
(41, 41, 'si_IvS3MJcHApmjCJ', 'price_1IJG6ZED8dpSHnI3BAIvHwQf', 1, '2021-02-11 08:07:41', '2021-02-11 08:07:41'),
(42, 42, 'si_IvS7vpw7m5TsGw', 'price_1IJG6ZED8dpSHnI3BAIvHwQf', 1, '2021-02-11 08:11:45', '2021-02-11 08:11:45'),
(43, 43, 'si_IvSE97LvhtHM4i', 'price_1IJG6ZED8dpSHnI3BAIvHwQf', 1, '2021-02-11 08:19:05', '2021-02-11 08:19:05'),
(44, 44, 'si_IvotrmLeLjRwap', 'price_1IJG6ZED8dpSHnI3BAIvHwQf', 1, '2021-02-12 07:44:04', '2021-02-12 07:44:04');

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
CREATE TABLE IF NOT EXISTS `tests` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`id`, `course_id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 4, 'Curabitur id neque ', 'Curabitur id neque vitae dui condimentum varius in eget lorem. Donec feugiat sit amet lectus a rhoncus. Etiam nunc quam, sodales in erat ut, ultricies eleifend erat. Vestibulum faucibus viverra sagittis. Duis sagittis molestie diam vel gravida. Integer vel posuere urna, id imperdiet lacus. ', NULL, NULL),
(33, 70, 'test tajtl', 'opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa opis testa', '2020-07-15 20:45:21', '2020-07-15 20:45:21'),
(34, 71, 'Test your metabolisam', 'According to Tim Blake, owner and founder of superdads.com, the single biggest thing you can do to get your metabolism firing is to increase Non-Exercise Activity Thermogenesis (NEAT). \"Basically, that means adding movement to everything you do, whenever and wherever possible,\" he explains. This includes simple things like adding fidgeting hands and feet to five hours of desk work. \"That racks up an additional caloric expenditure equivalent to running 1.5 miles! Fundamentally, this should be your mantra: Never walk when you can run, never stand when you can walk, never sit when you can stand, never lie down when you can sit.\" If you have a desk job or other lifestyle in which you\'re sitting a lot, don\'t miss these 21 Tricks to Lose Weight While Sitting Down.', '2020-08-18 07:16:07', '2020-08-18 07:16:07'),
(35, 72, 'Quizz', 'test your knowledge', '2020-08-20 09:17:20', '2020-08-20 09:17:20'),
(36, 73, 'Morbi ut magna', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Mauris eleifend id magna vel egestas.', '2021-02-16 21:24:40', '2021-02-16 21:29:36');

-- --------------------------------------------------------

--
-- Table structure for table `test_users`
--

DROP TABLE IF EXISTS `test_users`;
CREATE TABLE IF NOT EXISTS `test_users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `test_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `result` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `test_users_user_id_foreign` (`user_id`),
  KEY `test_users_test_id_foreign` (`test_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_users`
--

INSERT INTO `test_users` (`id`, `test_id`, `user_id`, `result`, `created_at`, `updated_at`) VALUES
(39, 33, 7, 50, '2020-08-05 08:17:46', '2020-08-05 08:17:46'),
(41, 33, 9, 50, '2020-08-19 08:09:06', '2020-08-19 08:09:06'),
(43, 34, 9, 50, '2020-08-19 08:51:57', '2020-08-19 08:51:57'),
(46, 35, 5, 100, '2020-08-20 09:19:16', '2020-08-20 09:19:16'),
(51, 36, 5, 50, '2021-02-16 21:27:05', '2021-02-16 21:27:05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'noavatar.png',
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_brand` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last_four` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_stripe_id_index` (`stripe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `avatar`, `description`, `stripe_id`, `card_brand`, `card_last_four`, `trial_ends_at`) VALUES
(1, 'Admin', 'admin@admin.com', NULL, '$2y$10$1G7dtG04c.oWWuDXCqHV2OAcCUDAkyTrQYTAxevfMWaWR68ZUeXOi', NULL, '2020-06-15 22:23:00', '2020-09-28 20:38:42', 'photo1_1593215958.jpg', 'Admin\'s Bio', NULL, NULL, NULL, NULL),
(2, 'Author', 'author@author.com', NULL, '$2y$10$Ta76N3cdTSSt3AG17HWmAuzlf5EWMF9vfMh5Y6hVSO4BpxIai5B.W', NULL, '2020-06-15 22:23:00', '2020-06-26 16:37:02', 'noavatar.png', NULL, NULL, NULL, NULL, NULL),
(3, 'Member', 'member@member.com', NULL, '$2y$10$5oeBs.x2Sd2yXZM.1hq2uO2OSNfX4bk7S9F3wIKPLyq/lPGiDwE1y', NULL, '2020-06-15 22:23:00', '2021-02-11 07:38:50', 'photo4_1593222382.jpg', NULL, 'cus_IvRaHk97rHmhyE', 'visa', '4242', NULL),
(4, 'User', 'user@user.com', NULL, '$2y$10$hfUPOAOvnRZAUvHscdRlbO19MWVWzuKlmDIBTxasXXQ5YB1CUAuZO', NULL, '2020-06-15 22:23:00', '2021-02-15 10:18:33', 'noavatar.png', NULL, NULL, NULL, NULL, NULL),
(5, 'Adela', 'adela@adela.com', NULL, '$2y$10$yJb25o/rm1RJWrUzIF.ijOyVoI.Xa6KWAHqiG.rXdKNxYkuNYIcPq', '4RQcMJ0V4ClFIKYBhw2ZkNt8VrQ32GSrCKc71w0wnoaHLSXaEMCtfEfsiILW', '2020-06-16 21:01:13', '2021-02-09 08:26:15', 'photo5_1593223090.jpg', 'Adelin opis', 'cus_IuhtLJ8v90yT0N', NULL, NULL, NULL),
(7, 'User Novi', 'novi@novi.com', NULL, '$2y$10$7c/KuqjcLzfj45Pq8CCBJug.bN73Cth13WvUGLpCIWJEaYOtEdpdO', NULL, '2020-08-05 08:06:31', '2021-02-10 09:49:25', 'photo3_1596622017.jpg', NULL, 'cus_Iv6T9epDEok6GG', 'visa', '4242', NULL),
(8, 'Nova', 'nova@nova.com', NULL, '$2y$10$AusznpqhRmQtz7D3CS0SKuXmTBc/8L9jyLd6CS7io8lkkar.3ipR.', NULL, '2020-08-18 07:06:47', '2021-02-10 07:42:25', 'photo4_1593222382_1597741652.jpg', NULL, 'cus_Iv4Q7DqaFoPfN5', 'visa', '4242', NULL),
(9, 'Nova', 'novano@nova.com', NULL, '$2y$10$l.gF9xzSHETov6PVCPPTHeKjnSzI0OuGIC/ahpfjiU.r64a1MtEjO', NULL, '2020-08-19 08:07:47', '2021-02-09 10:32:23', 'photo1_1593215958_1597835879.jpg', NULL, 'cus_IujwLXuKOXWcM6', 'visa', '4242', NULL),
(10, 'Tester', 'tester@tester.com', NULL, '$2y$10$IO1qAL58RBW5znb.fRqhduWM8BivoC8HARjRF1euOP9PBYSO2OZ1.', NULL, '2020-08-20 08:17:36', '2021-02-09 10:18:22', 'avatar_1597920747.jpg', NULL, 'cus_Il9uvyU4vXw1Ee', 'visa', '4242', NULL),
(11, 'Sanja', 'sanja@sanja.com', NULL, '$2y$10$AhTc64WEPpqEVR42XmrHDuvc910GYtYNBAbYJ6A6/fAmDK/bqg56.', NULL, '2020-12-07 09:31:55', '2020-12-07 09:32:25', 'noavatar.png', NULL, NULL, NULL, NULL, NULL),
(12, 'Novi Student', 'student@student.com', NULL, '$2y$10$I2njPQ6EID/BUTgzlp6/relke3VvtkuCiMjGk.l0ersf4/hWj9u/G', NULL, '2021-01-03 09:37:10', '2021-01-03 09:37:10', 'noavatar.png', NULL, NULL, NULL, NULL, NULL),
(13, 'Joiner', 'join@join.com', NULL, '$2y$10$LGZ5NEkAVV5ClvWXuuj01ehlpFqzPAtY8LlbyDFR9khu6IthIW9Cy', NULL, '2021-02-09 09:41:19', '2021-02-09 09:41:47', 'noavatar.png', NULL, 'cus_Iuj7ddcfobws6c', 'visa', '4242', NULL),
(14, 'Proba', 'proba@proba.com', NULL, '$2y$10$DWZla6qDLFln/ORIIzR2ZeXr7jplDbxCttfbIK4PmBLy4qzFIqDx2', NULL, '2021-02-10 22:43:56', '2021-02-10 22:44:23', 'noavatar.png', NULL, 'cus_IvIyDFvGnwnN5I', 'visa', '4242', NULL),
(15, 'RegMemb', 'reg@reg.com', NULL, '$2y$10$2rH1UqTVzqBYIWglbKhKw.MpVhJOK.rvBAcqGpyIRA21s2zhtbqpO', NULL, '2021-02-11 07:43:45', '2021-02-11 07:44:16', 'noavatar.png', NULL, 'cus_IvRfl6whOJ5fhF', 'visa', '4242', NULL),
(16, 'New', 'new@new.com', NULL, '$2y$10$nBYiEl.KKlMrVKOB1LLf9eyns5KblrdkqsblOsBoBhOjUqFsi0GoC', NULL, '2021-02-11 07:48:50', '2021-02-11 07:49:29', 'noavatar.png', NULL, 'cus_IvRl4v8CheyEfh', 'visa', '4242', NULL),
(17, 'Debug', 'debug@debug.com', NULL, '$2y$10$lot3Dh4FQ3Smeaa2NfZpAuilwkLPJRbWGQWVJuPJWVLR8OyRmFyx.', NULL, '2021-02-11 07:51:29', '2021-02-11 07:51:57', 'noavatar.png', NULL, 'cus_IvRnht2sPrwYkH', 'visa', '4242', NULL),
(18, 'nista', 'nista@nista.com', NULL, '$2y$10$yri7jdkE.gbvkT71MFi5ouxFIYZpsewjdV9fbVgMXUaaZhthQygO2', NULL, '2021-02-11 07:53:07', '2021-02-11 07:53:41', 'noavatar.png', NULL, 'cus_IvRpQ9psUwSuLO', 'visa', '4242', NULL),
(19, 'opet', 'opet@opet.com', NULL, '$2y$10$Grz55GH6sFVc.ZfMVT/1pukR4Ou2OTjHY2CartZZVsccr/ml9qVVO', NULL, '2021-02-11 07:55:41', '2021-02-11 07:56:13', 'noavatar.png', NULL, 'cus_IvRrgueKdNg2ij', 'visa', '4242', NULL),
(20, 'Armin', 'armin@armin.com', NULL, '$2y$10$BYktf5e.jPqDhTf1ajNOI.zxtvWV6t2919.Zpo1bVXExQ.j3OxMxW', NULL, '2021-02-11 08:01:52', '2021-02-11 08:02:26', 'noavatar.png', NULL, 'cus_IvRyiUMJciMe9q', 'visa', '4242', NULL),
(21, 'brejk', 'brejk@brejk.com', NULL, '$2y$10$x/elitdXA0EmfZLL9Ev5ROHjyzqXJbC8Y5XAQkY9952WKtk/XjMta', NULL, '2021-02-11 08:07:06', '2021-02-11 08:07:38', 'noavatar.png', NULL, 'cus_IvS3C36fUMQmk9', 'visa', '4242', NULL),
(22, 'some', 'some@some.com', NULL, '$2y$10$XgsBqkGcohTrjRbghcudRe1RwppOUUqVYykBW/s2ZVTwPDb8/qim.', NULL, '2021-02-11 08:11:08', '2021-02-11 08:11:43', 'noavatar.png', NULL, 'cus_IvS7hZk9wDSa27', 'visa', '4242', NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answer_test_user`
--
ALTER TABLE `answer_test_user`
  ADD CONSTRAINT `answer_test_user_answer_id_foreign` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `answer_test_user_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `answer_test_user_test_user_id_foreign` FOREIGN KEY (`test_user_id`) REFERENCES `test_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_user`
--
ALTER TABLE `course_user`
  ADD CONSTRAINT `course_user_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lesson_user`
--
ALTER TABLE `lesson_user`
  ADD CONSTRAINT `lesson_user_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lesson_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `test_users`
--
ALTER TABLE `test_users`
  ADD CONSTRAINT `test_users_test_id_foreign` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `test_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
