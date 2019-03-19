-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 19, 2019 at 08:42 AM
-- Server version: 5.7.22-0ubuntu18.04.1
-- PHP Version: 7.2.4-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(2, NULL, 1, 'Category 2', 'category-2', '2019-03-10 12:43:05', '2019-03-10 12:43:05');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 7, 'title', 'text', 'Наименование', 1, 1, 1, 1, 1, 1, '{}', 2),
(58, 7, 'slug', 'text', 'Slug', 1, 0, 0, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 3),
(59, 7, 'image', 'image', 'Изображение', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"null\",\"height\":\"600\"},\"quality\":\"90%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"new\",\"crop\":{\"width\":\"430\",\"height\":\"320\"}},{\"name\":\"medium\",\"crop\":{\"width\":\"508\",\"height\":\"336\"}},{\"name\":\"small\",\"crop\":{\"width\":\"196\",\"height\":\"155\"}},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 5),
(60, 7, 'link', 'select_dropdown', 'Ссылка', 0, 1, 1, 1, 1, 1, '{\"default\":\"0\",\"options\":{\"0\":\"\\u043d\\u0430 \\u043d\\u043e\\u0432\\u043e\\u0441\\u0442\\u044c\",\"1\":\"\\u043d\\u0430 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0443 1\",\"2\":\"\\u043d\\u0430 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0443 2\",\"3\":\"\\u043d\\u0430 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0443 3\",\"4\":\"\\u043d\\u0430 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0443 4\",\"5\":\"\\u043d\\u0430 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0443 5\",\"6\":\"\\u043d\\u0430 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0443 6\",\"7\":\"\\u043d\\u0430 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0443 7\",\"8\":\"\\u043d\\u0430 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0443 8\",\"9\":\"\\u043d\\u0430 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0443 9\",\"10\":\"\\u043d\\u0430 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0443 10\",\"11\":\"\\u043d\\u0430 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0443 11\",\"12\":\"\\u043d\\u0430 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0443 12\"}}', 6),
(61, 7, 'position', 'select_dropdown', 'Тема', 0, 1, 1, 1, 1, 1, '{\"default\":\"0\",\"options\":{\"0\":\"\\u0424\\u0438\\u043d\\u0430\\u043d\\u0441\\u044b\",\"1\":\"\\u041f\\u043e\\u043b\\u0438\\u0442\\u0438\\u043a\\u0430\",\"2\":\"\\u0428\\u043e\\u0443 \\u0431\\u0438\\u0437\\u043d\\u0435\\u0441\",\"3\":\"\\u0417\\u0434\\u043e\\u0432\\u0440\\u043e\\u044c\\u0435\",\"4\":\"\\u0410\\u0441\\u0442\\u0440\\u043e\\u043b\\u043e\\u0433\\u0438\\u044f\"}}', 9),
(62, 7, 'body1', 'rich_text_box', 'Текст новости 1', 0, 1, 1, 1, 1, 1, '{}', 10),
(63, 7, 'teaser1', 'text', 'Teaser1', 0, 0, 0, 0, 0, 1, '{}', 11),
(64, 7, 'body2', 'rich_text_box', 'Текст новости 2', 0, 0, 1, 1, 1, 1, '{}', 14),
(65, 7, 'teaser2', 'text', 'Teaser2', 0, 0, 0, 0, 0, 1, '{}', 15),
(66, 7, 'body3', 'rich_text_box', 'Текст новости 3', 0, 0, 1, 1, 1, 1, '{}', 18),
(67, 7, 'teaser3', 'select_dropdown', 'Отобразить тизер 3', 0, 0, 0, 0, 0, 1, '{\"null\":\"Nothing\"}', 19),
(68, 7, 'area2', 'select_dropdown', 'На главную', 0, 0, 1, 1, 1, 1, '{\"default\":\"0\",\"options\":{\"0\":\"\\u041d\\u0435\\u0442\",\"1\":\"\\u0414\\u0430\"}}', 4),
(69, 7, 'area3', 'select_dropdown', 'Отображение в зоне 3 - 3 крупных новости справа горизонтально', 0, 0, 0, 0, 0, 1, '{\"default\":\"0\",\"options\":{\"0\":\"\\u041d\\u0435\\u0442\",\"1\":\"\\u0414\\u0430\"}}', 22),
(70, 7, 'area4', 'select_dropdown', 'Отображение в зоне 4 - 5 мелких новостей в центре вертикально', 0, 0, 0, 0, 0, 1, '{\"default\":\"0\",\"options\":{\"0\":\"\\u041d\\u0435\\u0442\",\"1\":\"\\u0414\\u0430\"}}', 23),
(71, 7, 'area5', 'select_dropdown', 'Отображение в зоне 5 - 2 крупные новости справа вертикально', 0, 0, 0, 0, 0, 1, '{\"default\":\"0\",\"options\":{\"0\":\"\\u041d\\u0435\\u0442\",\"1\":\"\\u0414\\u0430\"}}', 24),
(72, 7, 'area6', 'select_dropdown', 'Отображение в зоне 6 - 6 крупных новостей горизонтально', 0, 0, 0, 0, 0, 1, '{\"default\":\"0\",\"options\":{\"0\":\"\\u041d\\u0435\\u0442\",\"1\":\"\\u0414\\u0430\"}}', 25),
(73, 7, 'area7', 'select_dropdown', 'Отображение в зоне 7 - 3 мелкие новости вертикально', 0, 0, 0, 0, 0, 1, '{\"default\":\"0\",\"options\":{\"0\":\"\\u041d\\u0435\\u0442\",\"1\":\"\\u0414\\u0430\"}}', 26),
(74, 7, 'area8', 'select_dropdown', 'Отображение в зоне 8 - 3 крупные новости горизонтально', 0, 0, 0, 0, 0, 1, '{\"default\":\"0\",\"options\":{\"0\":\"\\u041d\\u0435\\u0442\",\"1\":\"\\u0414\\u0430\"}}', 27),
(75, 7, 'area9', 'select_dropdown', 'Отобразить на главной', 0, 0, 0, 0, 0, 1, '{\"default\":\"0\",\"options\":{\"0\":\"\\u041d\\u0435\\u0442\",\"1\":\"\\u0414\\u0430\"}}', 7),
(76, 7, 'area10', 'select_dropdown', 'Отобразить в правом меню', 0, 0, 0, 0, 0, 1, '{\"default\":\"0\",\"options\":{\"0\":\"\\u041d\\u0435\\u0442\",\"1\":\"\\u0414\\u0430\"}}', 8),
(77, 7, 'loader', 'select_dropdown', 'Зона догрузки', 0, 0, 0, 0, 0, 1, '{\"default\":\"0\",\"options\":{\"0\":\"\\u041d\\u0435\\u0442\",\"1\":\"\\u0414\\u0430\"}}', 28),
(78, 7, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 29),
(79, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 30),
(80, 7, 'item_hasone_item_relationship', 'relationship', 'Тизер 1', 0, 0, 0, 0, 0, 1, '{\"model\":\"App\\\\Item\",\"table\":\"items\",\"type\":\"belongsTo\",\"column\":\"id\",\"key\":\"teaser1\",\"label\":\"title\",\"pivot_table\":\"items\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(81, 7, 'item_belongsto_item_relationship', 'relationship', 'Тизер 2', 0, 0, 0, 0, 0, 1, '{\"model\":\"App\\\\Item\",\"table\":\"items\",\"type\":\"belongsTo\",\"column\":\"id\",\"key\":\"teaser2\",\"label\":\"title\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 16),
(82, 7, 'item_belongsto_item_relationship_1', 'relationship', 'Тизер 3', 0, 0, 0, 0, 0, 1, '{\"model\":\"App\\\\Item\",\"table\":\"items\",\"type\":\"belongsTo\",\"column\":\"teaser3\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 20),
(83, 7, 'showt1', 'select_dropdown', 'Отобразить тизер 1', 0, 0, 0, 0, 0, 1, '{\"default\":\"0\",\"options\":{\"0\":\"\\u041d\\u0435\\u0442\",\"1\":\"\\u0414\\u0430\"}}', 13),
(84, 7, 'showt2', 'select_dropdown', 'Отобразить тизер 2', 0, 0, 0, 0, 0, 1, '{\"default\":\"0\",\"options\":{\"0\":\"\\u041d\\u0435\\u0442\",\"1\":\"\\u0414\\u0430\"}}', 17),
(85, 7, 'showt3', 'select_dropdown', 'Отобразить тизер 3', 0, 0, 0, 0, 0, 1, '{\"default\":\"0\",\"options\":{\"0\":\"\\u041d\\u0435\\u0442\",\"1\":\"\\u0414\\u0430\"}}', 21),
(86, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(87, 8, 'title', 'text', 'Наименование ссылки', 1, 1, 1, 1, 1, 1, '{}', 2),
(88, 8, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 3),
(89, 8, 'option', 'select_dropdown', 'Номер шаблона', 1, 1, 1, 1, 1, 1, '{\"default\":\"1\",\"options\":{\"1\":\"\\u043d\\u0430 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0443 1\",\"2\":\"\\u043d\\u0430 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0443 2\",\"3\":\"\\u043d\\u0430 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0443 3\",\"4\":\"\\u043d\\u0430 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0443 4\",\"5\":\"\\u043d\\u0430 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0443 5\",\"6\":\"\\u043d\\u0430 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0443 6\",\"7\":\"\\u043d\\u0430 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0443 7\",\"8\":\"\\u043d\\u0430 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0443 8\",\"9\":\"\\u043d\\u0430 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0443 9\",\"10\":\"\\u043d\\u0430 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0443 10\",\"11\":\"\\u043d\\u0430 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0443 11\",\"12\":\"\\u043d\\u0430 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0443 12\"}}', 4),
(90, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(91, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(92, 8, 'utm', 'text', 'Utm', 1, 1, 1, 1, 1, 1, '{}', 5),
(93, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(94, 9, 'var', 'text', 'значение', 1, 1, 1, 1, 1, 1, '{}', 2),
(95, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(96, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(97, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(98, 10, 'utm', 'text', 'Utm', 1, 1, 1, 1, 1, 1, '{}', 2),
(99, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(100, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2019-03-10 12:43:04', '2019-03-10 12:43:04'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2019-03-10 12:43:04', '2019-03-10 12:43:04'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2019-03-10 12:43:04', '2019-03-10 12:43:04'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(7, 'items', 'items', 'Новость', 'Новости', 'voyager-file-text', 'App\\Item', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-03-12 02:22:07', '2019-03-15 11:44:01'),
(8, 'links', 'links', 'Link', 'Links', NULL, 'App\\Link', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-03-13 13:27:59', '2019-03-13 14:01:35'),
(9, 'keys', 'keys', 'Ключ', 'Ключи', 'voyager-key', 'App\\Key', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-03-19 10:49:26', '2019-03-19 10:49:26'),
(10, 'utms', 'utms', 'Utm', 'Utms', 'voyager-browser', 'App\\Utm', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-03-19 11:00:27', '2019-03-19 11:00:27');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` text COLLATE utf8mb4_unicode_ci,
  `body1` text COLLATE utf8mb4_unicode_ci,
  `teaser1` text COLLATE utf8mb4_unicode_ci,
  `showt1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body2` text COLLATE utf8mb4_unicode_ci,
  `teaser2` text COLLATE utf8mb4_unicode_ci,
  `showt2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body3` text COLLATE utf8mb4_unicode_ci,
  `teaser3` text COLLATE utf8mb4_unicode_ci,
  `showt3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area6` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area7` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area8` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area9` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area10` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loader` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `title`, `slug`, `image`, `link`, `position`, `body1`, `teaser1`, `showt1`, `body2`, `teaser2`, `showt2`, `body3`, `teaser3`, `showt3`, `area2`, `area3`, `area4`, `area5`, `area6`, `area7`, `area8`, `area9`, `area10`, `loader`, `created_at`, `updated_at`) VALUES
(7, 'Qui ut dignissimos est eos cumque.', 'qui-ut-dignissimos-est-eos-cumque', 'items/March2019/SUpQvFPxIasSh5pSEWCX.jpg', '1', '0', 'Rerum voluptate voluptatum dignissimos dicta natus. Et modi quia delectus molestiae molestias delectus quidem. Non blanditiis ea harum eos. Vel reiciendis nisi veritatis qui laborum eligendi et. Facilis mollitia consequatur nihil in. Corporis commodi harum numquam reiciendis officia. Nemo quae commodi quo ea minus ipsam quaerat. Perferendis eius velit optio sapiente officiis. Aut eaque eligendi qui ullam corporis soluta consectetur. Voluptas odio aliquam nulla quae minus deserunt. Ut excepturi in reiciendis est odio. Cum maiores velit et sed recusandae. Soluta harum velit quis in repellat ratione et. Non quis eaque molestiae.', '0', '1', 'At perferendis perferendis non illum sunt recusandae velit. Non exercitationem non voluptatibus consequatur. Quod inventore dolor quia impedit. Omnis vel doloremque voluptate praesentium. Dignissimos dolorum eveniet et magnam. Libero quia quis ex et ea harum deserunt. Id fuga non aut mollitia molestiae quae repellat. Commodi illum eos alias itaque voluptas ut omnis. Dolores architecto hic sit accusamus qui. Sit eum et totam tempora suscipit. Et dolores esse aut corrupti atque eum voluptas. Accusamus non veniam in enim sed et. Et officiis dicta atque unde eius.', '0', '0', 'Accusantium est dolore quae qui in. Aut voluptatem qui enim quis tempore culpa temporibus ea. Occaecati officia velit pariatur minima quia autem. Autem tempore alias soluta illum facere. Omnis enim excepturi dignissimos dolorum quam vero. Consequuntur illum dolores laboriosam molestiae veritatis et non. Quia quia reiciendis ratione facere. Magni deserunt consectetur qui iste. Facere soluta cumque voluptas cum reiciendis consectetur et quia. Qui quis ex id delectus. Modi error velit libero eveniet doloremque occaecati non. Ullam quo magni fugiat aut tempore doloribus. Harum soluta dolorem magnam deleniti eveniet maiores blanditiis. Autem dolore sunt quia voluptatum impedit. Atque et natus labore quae quos similique impedit iusto.', '0', '1', '1', '1', '0', '0', '0', '1', '1', '1', '1', '0', '2019-03-13 09:04:55', '2019-03-13 09:04:55'),
(20, 'Sint aspernatur suscipit non quos ipsa in consectetur.', 'sint-aspernatur-suscipit-non-quos-ipsa-in-consectetur', 'items/March2019/SUpQvFPxIasSh5pSEWCX.jpg', '6', '0', 'Omnis perferendis molestiae qui quia est. Ducimus architecto laudantium repellendus debitis placeat est. Autem nobis itaque consequuntur dolores officiis. Neque aliquam reiciendis sint aut natus nulla atque. Qui dolores veniam nihil. Voluptate necessitatibus perferendis facilis voluptatem. Praesentium aperiam sed est facilis. Sed illo voluptatem error nesciunt. Temporibus possimus rerum vitae ipsam laborum dolorem. Corrupti eaque itaque vel esse. Temporibus et praesentium voluptatem sapiente odio aut enim ea. Rerum fugiat ipsum ea perspiciatis quisquam perferendis dolor. Laudantium consequuntur in quia magni necessitatibus eos velit. Vero accusamus est consequuntur neque.', '0', '1', 'Voluptatem non velit odio voluptatum dolorem amet. Ut amet est sit velit saepe magni omnis. At autem placeat ratione dolorem. Cupiditate sunt omnis qui qui perspiciatis non eos. Aut hic libero unde accusamus occaecati expedita. Doloribus saepe voluptates consequatur qui qui qui maxime. Porro magnam non facilis omnis commodi ea. Consequatur voluptas repudiandae reiciendis. Esse nihil cum iure quia eligendi. Aut aspernatur consequatur adipisci aspernatur esse. Minima aperiam aspernatur et exercitationem. Qui magnam eum repellat beatae eveniet eos. Perspiciatis aperiam occaecati tenetur est reprehenderit. Aut non ut expedita sed sit officia sunt. Consequuntur incidunt velit recusandae ea. Alias et doloremque facere laboriosam dolores nam. Illum voluptatibus nihil sequi minima quos doloribus omnis iure. Reiciendis magnam itaque consequatur vel accusantium quam.', '0', '0', 'Accusantium ea velit tempore sunt error non distinctio error. Illo possimus consequatur voluptates praesentium ut nihil amet repellendus. Veritatis aut magni soluta et vitae accusamus vitae. Amet quis laboriosam et et. Reiciendis quia suscipit reiciendis voluptatem. Repudiandae enim assumenda id. Aut qui quod voluptatem rerum similique amet in. Ut veritatis quidem deleniti. Recusandae iste consequuntur ipsum sequi sunt aliquid magni sit. In et cumque deserunt officiis nobis dolorum. Impedit qui vel similique. Dicta neque eveniet qui. Voluptatum non vitae voluptatibus sed sed. Veniam molestiae qui voluptatem praesentium dicta ut molestiae. Dicta fuga doloremque ut dolor. Consequatur minima ab ut est mollitia. Labore nobis quos iusto nemo assumenda.', '0', '0', '1', '0', '0', '1', '1', '0', '1', '1', '1', '1', '2019-03-13 09:04:55', '2019-03-13 09:04:55'),
(35, 'At cum dolorum modi autem tempore ut est.', 'at-cum-dolorum-modi-autem-tempore-ut-est', 'items/March2019/SUpQvFPxIasSh5pSEWCX.jpg', '2', '0', 'Qui ullam id adipisci sunt sequi cumque voluptas. Eos porro necessitatibus cumque cum debitis. Quo vero explicabo dolorem qui voluptatem vitae. Est necessitatibus quas sunt. Quo eligendi est suscipit dolores ducimus. Rerum dolorum vero ea aut dolor doloremque voluptates. Earum harum iste facilis rerum ipsa eum beatae. Vel at et at quibusdam voluptas. Quam nihil nam qui aliquam. Optio occaecati fugiat non sint minima aspernatur accusamus. Similique et unde amet voluptatum eum. Iste eveniet quia sit repellendus est. Et possimus suscipit voluptatibus ipsa mollitia placeat optio. Et ipsam qui quaerat debitis et corporis. Suscipit dolorem sed mollitia corporis numquam. Repudiandae et ab voluptate laborum qui itaque. Facere cupiditate eum nemo voluptatem. Commodi rerum et dolorum necessitatibus aliquam facere.', '0', '1', 'Aperiam deleniti alias libero. In nobis non praesentium est qui dolor. Expedita et doloremque porro aliquam delectus omnis. Non quis hic eos nobis. Non est voluptatem in dolor sint amet sunt. Qui voluptatibus nesciunt cupiditate amet aperiam impedit. Et vel atque ut. Veniam unde laborum iusto libero temporibus voluptas eaque eum. Aut voluptate sit corporis et ea omnis quam. Esse voluptatem non et fugit laboriosam autem et aut. Saepe aspernatur qui recusandae qui voluptate sit. Qui nobis officia fuga voluptatibus dicta voluptates veritatis.', '0', '1', 'Eligendi aut quod aut. Reprehenderit alias voluptatum illum qui. Nam sit est accusantium natus dicta consectetur. Et ex odit ea illum enim non. Numquam consectetur sint natus est et voluptate perspiciatis. Delectus laborum et est rerum et perferendis distinctio quae. Rem excepturi nam enim debitis qui aperiam eos. Et fugiat voluptas fugiat adipisci. Aliquam eos corrupti voluptas dolore repellat. Voluptates doloribus amet atque ut quos facilis veniam. Quia excepturi et distinctio aliquid sequi deleniti fugit. Nobis soluta delectus sit officia. Sed quis blanditiis veritatis nisi totam totam qui. Nihil non saepe incidunt. Deserunt perspiciatis rerum sint. Aut maxime delectus rerum consequatur. Eligendi illo eligendi velit aut impedit. Enim dolore delectus id sunt accusamus et dolores.', '0', '1', '1', '1', '1', '0', '1', '0', '1', '0', '1', '0', '2019-03-13 09:04:55', '2019-03-13 09:04:55'),
(47, 'Esse impedit et enim nihil excepturi quia.', 'esse-impedit-et-enim-nihil-excepturi-quia', 'items/March2019/SUpQvFPxIasSh5pSEWCX.jpg', '5', '0', 'Dolores porro qui ratione et. Qui dignissimos dicta sed eos nihil eligendi et ut. Officiis beatae aliquid molestias quia et aliquid non. Expedita vel voluptas officia. Officia nam aut odio officia quo repellat. Quas quaerat aliquid odio expedita qui minima. Nostrum perspiciatis est fugit ut. Eum similique quod ut eaque quae laborum numquam laborum. Est est aliquid dolor dolor dignissimos. Quisquam veniam quidem quis earum qui qui. Illo ipsam ex et dolorem. Rem magnam unde temporibus sit recusandae et adipisci. Qui cumque cumque rerum modi magnam quia architecto.', '0', '1', 'Expedita deserunt commodi sunt sapiente velit tempora. Sunt est consequatur qui vel delectus autem veritatis. Aut porro nam eum soluta vel dolore. Sunt vel recusandae dolor maxime officia voluptatem voluptas ea. Aut ad ea perferendis. Culpa explicabo corrupti recusandae fugiat quia deleniti. Qui tempore molestias itaque vero. Assumenda dolore consequatur dolorem. Quasi non vitae sunt et quos earum. Et cupiditate quod quam. Perspiciatis facere eveniet illo distinctio. Aut mollitia ipsam illum voluptatum molestiae. Labore et doloremque aut blanditiis dolores. Nisi earum dolorem labore. Consectetur id libero sint voluptas ut dolorem ut. Voluptate minus vel reiciendis et cupiditate voluptas. Enim vero maiores porro in maxime sit est. Et neque at nihil. Sit similique qui explicabo a perferendis veritatis. Rerum qui illum ut.', '0', '1', 'Ducimus laboriosam mollitia qui maiores et exercitationem. Distinctio laborum sed reprehenderit natus molestiae. Recusandae aut facere possimus ipsum quo voluptatem sint. Et consectetur quasi perspiciatis voluptatem sed qui. Quam nemo asperiores eos hic doloribus. Est accusamus minus exercitationem repellat architecto aut. Perferendis natus molestiae et asperiores. Recusandae voluptatem velit quis et non. Quia tempora voluptatibus libero ratione quos magnam. Ad dolor aut non vitae voluptas. Aut autem fugit et amet tempore. Iure aliquam numquam earum. Commodi expedita eos animi aut est cupiditate maxime. Doloribus minus minima et placeat molestiae consequatur. Molestiae quo pariatur debitis ut deleniti omnis. Beatae ducimus saepe doloribus eos illo.', '0', '0', '1', '0', '0', '0', '1', '0', '1', '0', '0', '1', '2019-03-13 09:04:55', '2019-03-13 09:04:55'),
(56, 'Deserunt optio inventore amet commodi ipsum non perferendis.', 'deserunt-optio-inventore-amet-commodi-ipsum-non-perferendis', 'items/March2019/BMGrMjDf9IPWUzKjiEJY.jpg', '0', '0', 'Et et at enim. Libero iusto error enim aut voluptas est quis. Aliquam possimus quo quos recusandae. Occaecati quo illo consequatur assumenda. Voluptatibus totam adipisci sit rerum sunt consequatur. Quis qui et fuga ea veniam in. Nihil enim occaecati quia eveniet. Adipisci non molestiae vitae quo quidem. Cupiditate optio voluptatem exercitationem esse labore et magnam. Omnis earum quo mollitia debitis non. Autem consequatur non incidunt sed autem corrupti sint. Distinctio beatae vel et deserunt et voluptatem. Sed et aut aut facere sequi architecto. Ab libero repudiandae quos accusamus. Quo incidunt sed sit totam error et et. Maiores aut qui dolore doloremque. Molestiae perspiciatis enim qui adipisci veniam. Natus ad dignissimos quod sit nostrum omnis id. Non necessitatibus aspernatur tempore odit. Eos corrupti aliquam vero nihil vero consequatur. Veniam corrupti qui qui eos fugiat quis et.', '0', '1', 'Eligendi cumque omnis molestiae maxime quis quis sed. Ea labore optio facilis fugiat voluptas sequi dolorem. Fugit adipisci vel voluptatem tenetur non consectetur aut. Ea et illo et numquam ut at. Nulla et pariatur voluptatibus nihil rerum qui. Blanditiis est corporis quia quia dolore. Neque officiis vero debitis non. In qui voluptate perferendis dolores exercitationem atque laborum ut. Nostrum corrupti odit qui. Sit optio necessitatibus esse et. Consequatur quis reprehenderit iste. Nihil voluptatem exercitationem et laudantium ut dolorem sapiente.', '0', '1', 'Expedita nihil consequatur est qui laudantium. Hic nihil sit dolores non eum nemo. Aut qui voluptatem nobis quo et quos unde dolorem. Sit eos voluptate itaque voluptatibus. Dignissimos fuga in dignissimos rerum. Distinctio minima doloribus qui sequi dicta optio. Maxime ea qui quam fuga est amet ex dolore. Iure sequi dolor cum. Est tenetur rerum harum dolores assumenda consequatur unde. Commodi fugit blanditiis ut possimus et quia suscipit aut. Omnis laborum voluptates aut voluptate sit rerum. Culpa nostrum et est voluptatem et nulla.', '0', '0', '1', '1', '0', '0', '1', '1', '0', '1', '0', '0', '2019-03-13 09:04:55', '2019-03-13 09:04:55'),
(63, 'Delectus sint voluptatem rerum iure vitae tempora.', 'delectus-sint-voluptatem-rerum-iure-vitae-tempora', 'items/March2019/SUpQvFPxIasSh5pSEWCX.jpg', '5', '0', 'Aperiam pariatur eos quo nobis veritatis. Ex qui reiciendis delectus a ut. Iure distinctio voluptatem molestias omnis veniam vero iste. Laborum dolor illum quaerat quae. Quaerat numquam quo aliquid omnis dolore vel molestiae placeat. Et commodi rerum illo ratione. Illum doloremque nihil quo deserunt ipsum omnis. Veniam et voluptate ex unde vel harum. Veritatis aut esse porro ab. Tempora quasi quidem voluptas qui quaerat. Deserunt ea et sed harum eum voluptas molestiae. Eius et odit nemo accusantium. Iure qui ipsum recusandae doloribus. Molestiae quia omnis et minima est excepturi rerum dicta. Sint voluptatum voluptatum qui laboriosam enim aperiam provident voluptatem.', '0', '0', 'Et suscipit repudiandae in asperiores. Laudantium consequatur voluptatem dolores dolorum consequatur. Qui doloribus ea voluptatum deleniti itaque. Eligendi eveniet omnis non recusandae rerum atque rerum. Velit ea harum qui consectetur voluptatem autem sapiente. Hic reiciendis fuga aut esse. Quam culpa dicta molestias. Nisi quos saepe numquam mollitia tempore culpa esse voluptas. Magni voluptatem pariatur sed dolores aut perspiciatis ut. Veritatis accusantium assumenda explicabo quam. Molestiae aut et nemo vitae possimus. Harum dolore repudiandae ipsa sit. Non ut ad ipsum enim. Aliquam quam facilis omnis iste eum quia veniam.', '0', '1', 'Et quo magnam consequatur nemo quo sed. Modi rerum magnam a soluta fugiat. Debitis dolore porro veniam sed aut. Vero vero cupiditate ex sint. Eius voluptatem minima ex omnis. Eligendi libero quam provident consequatur. Ipsam commodi sint rerum hic reiciendis. Et soluta aut aliquam. Libero nemo ipsum et ut. Consectetur inventore aliquid vel totam animi. Qui rerum sapiente delectus repudiandae voluptas et. Harum quo consequatur et aliquam ullam occaecati modi. Iusto ut perspiciatis omnis atque. Quidem omnis aperiam nesciunt voluptatum cumque. Corrupti provident officiis soluta hic fugit est tempora quisquam. Assumenda non recusandae qui itaque a quam possimus. Laborum voluptas quia voluptatem provident accusamus. Dignissimos in ad voluptatibus asperiores.', '0', '0', '1', '0', '1', '1', '1', '1', '1', '0', '0', '0', '2019-03-13 09:04:55', '2019-03-13 09:04:55'),
(89, 'Ea quisquam distinctio voluptas dolores sunt.', 'ea-quisquam-distinctio-voluptas-dolores-sunt', 'items/March2019/SUpQvFPxIasSh5pSEWCX.jpg', '1', '0', 'Eos eos aperiam asperiores. Doloremque nemo et deserunt explicabo. Ut quibusdam vero nihil enim molestiae molestiae officiis. Et enim laudantium reiciendis rerum sed qui labore. Quasi fugit aut aut ipsam voluptatem. Et aspernatur mollitia non ad. Dolores provident maxime magnam excepturi reiciendis voluptatibus non. Voluptatibus porro facilis pariatur aliquid. Repellat vitae illo sit repellat. Praesentium dolorum aut ducimus officia laboriosam iste ipsa. Dolore consequuntur et dolorem enim neque. Est sed molestiae distinctio et at omnis.', '0', '1', 'Quibusdam aliquam magni voluptatibus quaerat quia. Dolorem enim excepturi dolore ipsum. Tenetur delectus omnis eligendi. Nihil aspernatur veniam et nemo quo. Et voluptate ullam quos esse odit omnis. Dicta suscipit necessitatibus at sed reprehenderit rerum et. Repellat aliquid eum accusantium corporis. Harum omnis non ratione similique consectetur modi nulla. Vel nihil ut velit. Ducimus qui non aperiam voluptas quos perspiciatis ut. Minima amet totam placeat velit tenetur ut. Consectetur aut sed culpa aliquam deserunt tempora cupiditate. Illum ut nostrum excepturi.', '0', '0', 'At voluptate non possimus consequuntur. Optio vel ut repellendus sed est est. Voluptatum itaque ut magni deleniti enim. Aut vel est dolores. Officia unde ad sunt magni ipsum quos. Esse ad perferendis molestiae vel quasi iure. Illo laudantium aut officiis optio. Adipisci placeat autem sunt voluptates dolores. Eos dolorum tenetur maiores exercitationem nihil quo. Facilis perferendis cumque natus architecto consequatur. Voluptas et animi corrupti aut voluptatum neque eos nostrum. Facilis voluptatibus quia deleniti accusantium. Ea eum pariatur nisi quis. Nobis voluptates minus ut velit. Omnis aliquid et eos eveniet laboriosam id et repellat. Labore placeat nemo pariatur vel. Harum totam vitae et ad eaque id. Iusto dolorum repellat earum repellendus recusandae. Vel nam quae sunt quaerat tempore excepturi aliquam soluta.', '0', '0', '1', '1', '0', '0', '0', '0', '1', '1', '0', '1', '2019-03-13 09:04:56', '2019-03-13 09:04:56'),
(91, 'Explicabo dignissimos est accusantium aut consequatur ut ut.', 'explicabo-dignissimos-est-accusantium-aut-consequatur-ut-ut', 'items/March2019/SUpQvFPxIasSh5pSEWCX.jpg', '1', '0', 'Commodi reiciendis nulla rem voluptatem itaque qui et. Enim rerum perferendis est dignissimos dignissimos cum minus. Quam aut quis quam vel et. Est vel atque architecto quisquam architecto dolores. Esse consequuntur est enim et. Et vel accusantium fugit officiis sequi alias excepturi voluptas. Ipsa minus earum qui. Amet sit ab dolor provident molestiae tempora blanditiis. Voluptatum voluptatibus illo rerum qui sapiente dolor. Reiciendis vitae aut eos voluptatem consequuntur. Aut nulla eos tempore ratione quos sunt. Et dolorem officiis adipisci. Minus eius unde est qui libero. Tenetur sapiente placeat suscipit molestias. Fugit saepe optio impedit saepe.', '0', '1', 'Recusandae architecto architecto non aliquam ut id qui non. Quas rerum est unde ea consequatur quis. Vero quibusdam qui fuga temporibus rerum harum nesciunt. Sapiente nesciunt dolorem impedit aut perferendis numquam. Assumenda excepturi odit magni. Quae cupiditate ut in tempora nisi. Qui libero architecto aspernatur illum sint quas est. Cum iste laudantium esse non vero aliquam eos. Dolorem culpa maxime laboriosam quos. Natus commodi libero numquam dolorem eos debitis voluptatem. Sed vel quas eos et rerum est autem est. Asperiores tenetur ipsum quas aspernatur sed et hic. Facilis earum et quasi similique nostrum. Dolores aut sit in officiis. Reprehenderit alias quas et doloribus vel nihil tempora ratione.', '0', '1', 'Illo autem autem illum tempore nostrum odio neque. Tempore saepe voluptatum maiores harum et eius nam nisi. Mollitia dolores non sed. Laborum unde aut ducimus quos facere est. Optio accusantium illum iure eaque quis. Voluptatem vitae officia qui tempore assumenda dolores consequatur velit. Deserunt alias a ipsa velit. Alias ipsam officiis eveniet. Illum exercitationem perspiciatis voluptas unde velit adipisci eum. Ipsum deleniti sequi sapiente nihil labore repudiandae. Dolores fuga omnis rerum nostrum adipisci debitis rerum. Aut nihil nulla ut ea ab omnis.', '0', '0', '1', '1', '0', '0', '1', '1', '1', '0', '0', '0', '2019-03-13 09:04:56', '2019-03-13 09:04:56'),
(92, 'Consequatur harum deserunt et itaque sed vel quia dolorem.', 'consequatur-harum-deserunt-et-itaque-sed-vel-quia-dolorem', 'items/March2019/SUpQvFPxIasSh5pSEWCX.jpg', '3', '0', 'Iusto incidunt sunt sed earum iste itaque. Sed occaecati itaque voluptatem et alias dolor. Qui magnam deleniti pariatur enim reiciendis voluptatem officia. Totam unde iure incidunt blanditiis sint et placeat. Qui assumenda molestias autem nesciunt sunt beatae. Officia quo consequatur aut atque aut eaque occaecati culpa. Accusamus labore earum culpa blanditiis. Magnam officiis nihil qui voluptatem. Qui sed et inventore nesciunt soluta officia fuga. Aut repellendus voluptatem accusamus et mollitia natus sequi itaque. Odio sed mollitia nam dolorum et voluptates. Nulla dolore et repellendus rerum est corporis ut reprehenderit. Ipsa ut provident labore laudantium eos dolor. Ut molestias molestiae corrupti repellat praesentium. Non velit doloribus voluptatibus voluptate et maxime. In hic aliquam atque laudantium facilis nemo. Commodi quia qui alias.', '0', '1', 'Voluptas voluptatibus ratione sapiente beatae et repellendus nam. Repellendus quia modi dolor dolor. Et nesciunt itaque neque porro quam. Error modi unde aperiam aut aliquid aliquam nisi molestiae. Sunt est debitis vitae voluptatem illo. Accusamus dignissimos aperiam fuga veritatis sapiente magni. Enim laudantium nam in enim consequuntur. Laudantium eius ad est et quaerat asperiores. Iste et sed rem eum. Architecto a reprehenderit ea aliquid aut repellat. Fugiat sed qui illo sapiente aut voluptate. Nihil eum vero architecto. Illum quae voluptatem molestias debitis alias. Sed alias expedita culpa doloremque quas asperiores laborum fuga. Beatae ut omnis ut qui cupiditate atque soluta odit. Deserunt hic odio consectetur inventore possimus qui. Quas consectetur expedita rem aliquid quasi sunt. Eum voluptas quidem ullam.', '0', '1', 'Est voluptatibus ut rerum consequatur pariatur. Iusto harum possimus et nemo aut iste. Et doloribus error molestiae eaque. Qui nihil nihil accusantium vel animi odio dicta eos. Praesentium quis saepe maiores. Hic possimus dignissimos sunt nihil a est et. Velit ut natus numquam temporibus illum dolor praesentium. Incidunt officiis sed accusantium qui. Odio a fugiat quod laborum sit molestiae sit. Maxime ullam magni id assumenda sunt esse. Reprehenderit explicabo et dolorem velit tempora et.', '0', '1', '1', '0', '0', '1', '1', '0', '1', '0', '1', '1', '2019-03-13 09:04:56', '2019-03-13 09:04:56'),
(100, 'Eum occaecati et aut eligendi cupiditate laborum.', 'eum-occaecati-et-aut-eligendi-cupiditate-laborum', 'items/March2019/SUpQvFPxIasSh5pSEWCX.jpg', '0', '0', 'Molestias sit aut odit dignissimos tenetur ut ab dolorem. Vel quia ducimus omnis quo architecto saepe. Dolor provident et atque optio commodi et. Asperiores vel ut modi. Dolorum sapiente quia et iusto voluptas dignissimos dignissimos aut. Sit sed autem repellendus nesciunt dolores harum laborum. Voluptate et asperiores est ut dolore consequatur minus. Et maiores molestias beatae voluptas at quis fuga voluptatem. Ad ut rem id neque. Officia omnis optio iste aut quos fuga voluptatem quia. Et eaque cumque quos molestiae provident commodi ipsam dolor. Suscipit quos amet non eum dolor. Quis sint sit autem enim aliquid. Nihil cumque aperiam earum. Debitis expedita exercitationem eos dolorem provident. Deleniti pariatur recusandae quia quisquam aspernatur. Voluptatem voluptatibus ut voluptates labore atque. Neque repellat aut quaerat corrupti quaerat vel eos. Maxime architecto est qui accusamus.', '0', '1', 'Aut non quia non autem non. Eligendi quia dignissimos qui. Rerum in ut quod vel praesentium molestias ipsum. Natus eos ipsa illum autem et odio ea dolorum. Saepe est adipisci nobis voluptatem omnis molestias. Possimus inventore eveniet voluptas beatae nobis assumenda quae recusandae. Praesentium aut ut sed nam reiciendis dolorem facilis est. Voluptatum sint numquam quia minima omnis et voluptas. Quo eum vel ea numquam iure quisquam quasi excepturi. Ea id est repudiandae qui quia et omnis. Iusto eum aut incidunt sed cupiditate. Iure eaque facere ipsam. Veritatis laboriosam debitis suscipit ad vero inventore. Impedit ut iusto odit inventore aspernatur consectetur. Nesciunt doloremque quis dolorum quis fugiat quam. Ea quibusdam et veniam blanditiis veniam accusantium. Maiores provident sit molestiae deserunt occaecati dolor numquam. Et vel libero aliquam aut saepe atque et. Qui eum asperiores est accusantium quo.', '0', '0', 'A et necessitatibus tenetur ipsa voluptas. Nam eveniet necessitatibus consequuntur similique rerum ratione. Sequi odio consequuntur dolores saepe consequuntur deleniti. Cupiditate nostrum necessitatibus et animi quaerat aut laboriosam. Consequuntur voluptatibus culpa quam voluptates. Quia id dolore et est. Excepturi voluptatibus eum quia omnis animi est dolores. Perferendis quos aperiam aspernatur et perferendis. Consequatur hic aut eveniet assumenda. Blanditiis quia ipsam amet tempore reprehenderit ut tenetur.', '0', '0', '1', '0', '1', '1', '0', '1', '1', '1', '1', '1', '2019-03-13 09:04:56', '2019-03-13 09:04:56'),
(114, 'Beatae pariatur fugit ut.', 'beatae-pariatur-fugit-ut', 'items/March2019/BMGrMjDf9IPWUzKjiEJY.jpg', '6', '0', 'Maxime autem neque iusto aut aut incidunt. Ab distinctio delectus sit voluptas sint aut sed. Sequi expedita placeat voluptatem ducimus. Libero maxime molestiae esse doloribus. Esse vel iste autem corrupti sit nisi. At delectus quasi et quia nobis. Quo perferendis est consequuntur esse magnam sunt repudiandae at. Repellendus pariatur nihil sed perferendis consequatur ducimus. Molestias molestiae omnis blanditiis eaque. Amet autem totam in sequi quos excepturi.', '0', '1', 'Adipisci facilis molestiae dolor quas. Qui quaerat ab blanditiis veritatis. Quaerat qui et qui totam nihil. Eos hic sunt voluptas reprehenderit autem est voluptate. Eveniet repellendus blanditiis inventore numquam quos. Ea itaque doloremque possimus perferendis. Itaque explicabo et voluptatem blanditiis rerum labore quos facilis. Et cumque omnis ea numquam ut odit et. Aliquam eum dolor distinctio non qui. Necessitatibus iste iusto optio enim. Ut qui laborum nemo minima. Aliquam veritatis voluptas quia quis. Laudantium voluptas dolores molestias omnis accusamus sed. In impedit quia qui praesentium cum dolores quod. Rerum perspiciatis velit magni molestiae non. Molestias ab nemo similique deserunt molestias. Esse eligendi facere iure doloremque. Blanditiis molestiae omnis necessitatibus ut cupiditate qui. Fugit temporibus velit perspiciatis. Ut alias eaque ipsa modi velit.', '0', '0', 'Nemo sapiente velit harum eaque mollitia ea. Architecto occaecati exercitationem omnis qui asperiores rerum facere. Ipsam et et voluptatibus quam nihil minima sint. Harum earum consequatur aut qui in reprehenderit expedita laudantium. In nemo suscipit dolor nulla dolores quidem temporibus. Ea quia voluptatum quos officia neque amet voluptatem esse. Temporibus fugiat ea et aperiam aut. Consequuntur repudiandae consequuntur qui in doloribus id voluptatem. Repellat eos eos et error non. Provident quisquam et qui. Libero fugiat ut ut quas dolorem praesentium praesentium. Quaerat dolorem saepe dolores sed. Laborum ut facere dolores ut non recusandae. Sit maiores necessitatibus sunt nemo autem. Non porro eum fugiat commodi molestiae alias reiciendis.', '0', '1', '1', '0', '1', '0', '0', '0', '1', '1', '0', '1', '2019-03-13 09:04:56', '2019-03-13 09:04:56'),
(145, 'Minima consequuntur laboriosam suscipit asperiores impedit alias.', 'minima-consequuntur-laboriosam-suscipit-asperiores-impedit-alias', 'items/March2019/SUpQvFPxIasSh5pSEWCX.jpg', '2', '0', 'Autem et et sed quis et magnam. Incidunt aut cum nobis ullam. Autem eveniet id beatae id rerum id. Cupiditate expedita cumque iure repellendus enim unde. Culpa maiores fugiat et fuga est et fugit. Dolores est sed a ab velit. Laborum quia et magni et. Quis praesentium sunt quis fugiat. Cum nemo laudantium quasi. Error saepe ut fuga molestiae. Reiciendis iusto quis expedita illo. Distinctio excepturi odit expedita. Aut distinctio suscipit id ea. Itaque beatae ratione voluptates culpa fugiat occaecati. Eligendi et rerum ipsa dignissimos cum deleniti. Est placeat voluptas illum assumenda nulla id non sequi. Nam voluptatibus aut ut reprehenderit. Sint repellat rerum esse numquam voluptas. Quo possimus consequatur et ab praesentium minima suscipit. Et natus distinctio molestiae nam cupiditate rerum.', '0', '0', 'Omnis iusto aut dolorem sint totam. Perferendis rerum veniam praesentium inventore. Tempore ab alias qui eligendi. Adipisci quia pariatur harum veritatis excepturi. Iure quod itaque culpa dicta voluptatem cumque. Ut soluta vero et tempore est. Similique eos incidunt ipsam sunt alias. Libero distinctio in vero expedita sed. Placeat fugit in necessitatibus nesciunt aut. In animi cupiditate libero mollitia deleniti omnis provident.', '0', '0', 'Libero tempore omnis occaecati soluta qui doloribus architecto. Repellat vel vel nemo saepe. Placeat consequuntur cumque unde maxime cumque ut. Rem nobis non ex soluta harum. Consequatur qui excepturi consectetur necessitatibus libero et officiis. Voluptates officiis aut unde qui expedita. Quidem sit saepe vel aut corrupti. Blanditiis sapiente sed expedita aut sint. Corrupti libero ipsum ut ipsum et sint. Occaecati eligendi dolores fugit fugiat voluptatem saepe aut. Omnis reprehenderit veniam soluta.', '0', '0', '1', '0', '0', '1', '0', '1', '1', '0', '1', '0', '2019-03-13 09:04:56', '2019-03-13 09:04:56'),
(146, 'Magni nihil necessitatibus illo quis unde et.', 'magni-nihil-necessitatibus-illo-quis-unde-et', 'items/March2019/BMGrMjDf9IPWUzKjiEJY.jpg', '1', '0', 'Eligendi adipisci ut suscipit asperiores ducimus asperiores consequatur. Dolorem eos laborum sequi ea non voluptatum. Consectetur et et qui ullam nihil officiis atque. Omnis qui a doloribus perspiciatis earum. Recusandae laudantium aut voluptatem rerum aut. Ipsum accusamus blanditiis ea iusto. Consequatur voluptate incidunt molestias perspiciatis sunt voluptatibus sit iste. Ut ea quo tempore quam sint. Rerum non consequatur tenetur fuga nulla id. Sunt consequatur eum cumque voluptatem nemo ipsa nihil. Vel eveniet amet rem rerum.', '0', '0', 'Et et molestiae maiores porro error deleniti aut. Impedit illum blanditiis placeat vel molestiae. Doloremque expedita rerum reiciendis consequatur omnis excepturi. Nobis quo atque iure placeat. Blanditiis vel laudantium odit rerum distinctio voluptatum quis. Odit iure eaque laborum ipsa autem rerum. Cupiditate quia vel nobis possimus. Quos quia accusantium atque nisi accusamus voluptas aperiam repellat. Veritatis quia veniam sunt veniam. Atque placeat fuga porro. Sint inventore praesentium inventore quas dolorem.', '0', '1', 'Quas voluptatibus repudiandae reiciendis modi nihil aut quaerat. Vitae officiis voluptas minus soluta ut reiciendis. Rem illum ut voluptatem. Repellat quasi recusandae temporibus. Nisi quod natus eaque. Et ratione quia ullam iure. Natus nihil qui corrupti quis iste ullam est praesentium. Et animi voluptate praesentium quasi. Excepturi quia eum quod voluptatem omnis repellendus. Repudiandae at quia qui sapiente numquam deserunt fugiat. Atque illo est sequi dolor culpa rerum a. Maxime quia sit reiciendis ullam doloribus sed. Accusantium delectus debitis aut.', '0', '1', '1', '0', '1', '1', '0', '0', '0', '1', '1', '0', '2019-03-13 09:04:56', '2019-03-13 09:04:56'),
(147, 'Rerum dolorum eveniet non et est doloremque.', 'rerum-dolorum-eveniet-non-et-est-doloremque', 'items/March2019/BMGrMjDf9IPWUzKjiEJY.jpg', '3', '0', 'Possimus maiores dolorum fuga sed voluptas ipsa dolor. Ab placeat voluptatem fuga est molestiae ipsum distinctio sapiente. Aut natus minus consequatur quos suscipit quia rerum. Eos et quibusdam et iste qui. Minus non hic id sunt. Ex omnis repellat quasi nihil debitis illo sed. Odit deleniti consequuntur ea quia voluptates consectetur est sint. Et distinctio voluptatem ipsam deleniti quia nihil. Sequi sed voluptas officia sint omnis voluptatem sit non. Est fuga fugit quisquam et qui et. Sed iure facilis voluptatem dolores et adipisci. Corrupti provident quam quod id asperiores aut rerum. Ipsam autem voluptatem iusto et quidem excepturi. Soluta eaque est sint ducimus non in quae. Et neque molestiae autem. Fugiat quia dolores natus.', '0', '1', 'Veritatis amet quidem molestias sunt quia at eaque rerum. Ex neque explicabo soluta molestiae quidem dolore. Mollitia fugit perspiciatis magnam qui a asperiores. Placeat doloremque delectus animi sed. Minus minus dolorem cupiditate est nesciunt deserunt. Iste explicabo aut omnis et distinctio. Ab tempore sit molestiae hic alias. Cupiditate commodi fugiat ratione assumenda ipsam. Quisquam quia magnam reiciendis eius asperiores et illum dignissimos. Magni amet enim nesciunt consequatur minima ratione vel. Qui ut ipsum possimus est omnis suscipit ipsa qui. Iure molestias dolor aut corrupti maiores ab saepe. Dolorem reiciendis enim assumenda ea molestiae beatae fugit. Minima voluptatibus repudiandae vel voluptas nesciunt itaque.', '0', '1', 'Illo earum sequi aspernatur incidunt. Suscipit tenetur excepturi totam. Ut alias inventore iste beatae ducimus ex est. Ea similique porro dolorem molestiae sed velit recusandae sed. Minus voluptatem quae ut ipsum blanditiis ut asperiores. Aliquid esse architecto et est quia magni autem inventore. Ut iure aut maxime inventore cum voluptatem. Vitae quia unde et a est. Quibusdam explicabo quis magni nisi odit recusandae. Similique dolores veniam ipsa delectus. Quia deserunt et et sint perspiciatis vitae. Sit qui libero dignissimos molestiae. Tenetur voluptatem incidunt quas veniam. Consectetur velit non numquam dignissimos sint eos. Dolorum atque ipsum soluta aut quia temporibus. Eaque rerum inventore quis totam accusamus. Sunt labore ut veniam rerum voluptatum.', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1', '1', '0', '2019-03-13 09:04:56', '2019-03-13 09:04:56'),
(149, 'Facere laudantium similique ut qui rerum quia provident velit.', 'facere-laudantium-similique-ut-qui-rerum-quia-provident-velit', 'items/March2019/SUpQvFPxIasSh5pSEWCX.jpg', '3', '0', 'Cupiditate voluptate soluta possimus et consequuntur sint. Iusto magnam blanditiis eos ea. Provident nam qui non numquam velit. Aut eligendi id et qui et et aut. Vel hic quia repellat cupiditate qui est molestiae. Voluptatibus corporis adipisci sit quia laudantium illum consequatur. Temporibus aliquam numquam officiis. Eius ea atque quia et consequatur. Inventore omnis rem numquam vitae. Repellat qui accusamus cupiditate pariatur ex ducimus animi sit. Quae et unde est et. Accusantium dolores rerum velit eum aspernatur quo aliquid.', '0', '0', 'Et beatae numquam ducimus blanditiis quo ea id. Omnis mollitia at molestiae eos ut. Voluptatem rerum amet fugiat quibusdam minima. Incidunt voluptate et soluta. Dicta voluptatem blanditiis culpa. Beatae quasi quis adipisci id ea unde. Nesciunt placeat repellat voluptatem magni labore. Minus et dolor quia culpa beatae ipsa velit blanditiis. Voluptatum beatae voluptatem et ut accusamus. Facilis sed corrupti doloribus eos officiis consequatur voluptatum quidem.', '0', '0', 'Eum quidem laboriosam et id et culpa. Delectus praesentium aspernatur laudantium. Cum odio reiciendis eveniet blanditiis beatae excepturi consequatur aliquam. Debitis ut consectetur voluptatem libero sit eligendi recusandae. Voluptate minus repellat facere aut a. Sint voluptate eos nulla ut. Vel et dolorem dolore officia minima. Quia eos voluptas ipsam numquam corrupti error. Ipsum blanditiis non nostrum voluptates est ut. Nihil omnis commodi dolor a consectetur mollitia voluptatum beatae. Dolores ullam et nostrum et consequuntur. Ducimus aperiam consequuntur sequi architecto. Libero illum ut atque aliquid doloremque ut eius eaque. Distinctio assumenda non esse deleniti necessitatibus odit eum doloribus. Nesciunt ut placeat rem enim rerum. Expedita est minima qui voluptatibus. Maiores exercitationem modi natus omnis.', '0', '1', '1', '1', '1', '0', '0', '1', '1', '0', '0', '1', '2019-03-13 09:04:56', '2019-03-13 09:04:56'),
(172, 'Nesciunt et tempore dicta.', 'nesciunt-et-tempore-dicta', 'items/March2019/SUpQvFPxIasSh5pSEWCX.jpg', '2', '0', 'Perspiciatis qui ea et inventore consequatur aut inventore. Et repellat accusantium nihil corporis nostrum omnis sed. Labore et ab quo quia minima ad itaque. Itaque dolorem placeat quidem et occaecati perferendis. Voluptatem nulla est exercitationem vel et. Velit sed debitis ipsa qui. Et rerum hic ipsum hic. Qui aliquam tempora voluptatem voluptas unde dolore. Eos occaecati totam et sapiente. Voluptatem minima ullam tempora ea ut asperiores. Asperiores aperiam occaecati qui omnis inventore saepe. Dolorem natus ad consequatur ut laborum adipisci est. Eum iusto mollitia cumque sit doloremque cumque inventore. In repudiandae rerum rerum qui nesciunt facere modi. Velit qui esse repellendus ipsam nihil ipsam nobis. Voluptatem fugit optio perspiciatis provident repellendus est nam. Molestias omnis tempore enim consequatur.', '0', '1', 'Consequatur vel asperiores autem autem animi. Nesciunt libero minima quo facilis totam quae. Quasi facere labore nulla inventore. Dolorem expedita voluptatem ut doloremque rerum molestiae voluptatum. Est ea omnis est distinctio. Ea nemo explicabo excepturi sapiente est sed. Expedita veniam aut sit. Sequi saepe facere assumenda. Modi ipsa nam aut voluptas ratione et ea. Expedita sint est dicta accusamus vero odit. Eaque consequatur quia eos. Tempore ea sunt ullam sed eveniet illum consequatur vel. Aut qui sint repellendus vero totam voluptas dolore. Quia ut beatae alias pariatur minus eaque fuga. Ratione vero saepe doloribus et.', '0', '1', 'Minus sit ut consectetur consequatur. Qui minima minima est aut reiciendis. Quia omnis dolor est velit non illum hic. Consequatur delectus repudiandae dolorem sunt quam praesentium. Dolorem temporibus quasi dolor. Recusandae sit velit dolore modi consequuntur voluptate. Vero eveniet numquam quo officiis molestias quisquam aliquid. Architecto est itaque nisi voluptas. Dolorem voluptatem dolor sed vel quis perspiciatis voluptatem. Aut fugit aperiam ipsa architecto eaque. Ipsum omnis fugit illum reiciendis. Architecto nihil a qui quas. Deleniti eligendi explicabo illo. Earum ut nulla quod nemo id possimus. Ab mollitia cupiditate sit incidunt ipsum nulla. Quis aliquam ab qui modi quas ratione. Autem voluptas eveniet aut consequuntur perspiciatis. In harum qui asperiores non. Earum laborum itaque temporibus.', '0', '0', '1', '0', '1', '1', '0', '0', '1', '1', '1', '1', '2019-03-13 09:04:56', '2019-03-13 09:04:56'),
(175, 'Id sed corporis autem a distinctio autem alias.', 'id-sed-corporis-autem-a-distinctio-autem-alias', 'items/March2019/SUpQvFPxIasSh5pSEWCX.jpg', '4', '0', 'Officiis fugit sed quo vitae hic dignissimos dolorum. Perspiciatis officia sunt et rem hic tempora a corrupti. Ut in adipisci quia qui maxime. Perspiciatis voluptas assumenda accusantium voluptatibus sequi quas quos mollitia. In fugiat consequatur harum recusandae. Quam neque voluptatem veniam aut perspiciatis earum. Deleniti qui voluptatem quis in amet culpa optio repellat. Consequuntur illum et cumque dignissimos. Sequi a sed rem tenetur molestiae numquam impedit. Repellendus quae voluptas vitae quaerat vitae. Occaecati enim deserunt cum voluptatem veniam. Animi consequatur est aliquam.', '0', '0', 'Nesciunt quam inventore adipisci blanditiis voluptas. Explicabo et reiciendis et est. Dolorem consequatur voluptatem reprehenderit. Id et qui eos quidem similique. Quia est ducimus quibusdam eum voluptatem. Blanditiis eum neque sit officia. Eligendi vel similique aut tempore. Iusto asperiores fuga ut ut. Tempore ad id non et nesciunt. Dignissimos ut blanditiis vero sunt expedita facilis. Id nihil unde voluptates eum natus est culpa. Et maiores tenetur ratione non nesciunt porro eum. Eos quia aliquid id beatae molestiae excepturi. Molestiae in neque pariatur qui est sint. Praesentium quibusdam totam aut rerum aut autem. Dicta repellendus et rem doloribus et aperiam. Quis voluptas sit corporis modi. Soluta doloribus illo animi est ipsa voluptate. Non officiis quod quo vel est quae.', '0', '0', 'Reiciendis corporis autem consequatur consequatur facilis facere at. Veritatis inventore veniam pariatur iusto voluptatem sed. Molestiae architecto sint doloribus culpa. Omnis non quia maiores. Reiciendis vel numquam libero ad dolores. Quo ratione sequi ad qui inventore enim. Omnis illo sed cupiditate consequuntur odit eaque consequatur. Sit culpa id voluptas enim. Et aliquam et aliquam soluta et beatae. Pariatur qui omnis officia harum vel dolorum. Et id aut quas ratione consequuntur ut enim. Ipsam ea nulla aut. Quam voluptatibus officia voluptatem quos assumenda. Enim quia tempora aliquid nam cupiditate autem temporibus. Corrupti quis expedita dolorem et deleniti. Ipsa unde quis neque mollitia unde aut.', '0', '0', '1', '1', '1', '0', '1', '0', '1', '0', '0', '1', '2019-03-13 09:04:56', '2019-03-13 09:04:56'),
(177, 'Perferendis qui a ut qui.', 'perferendis-qui-a-ut-qui', 'items/March2019/SUpQvFPxIasSh5pSEWCX.jpg', '4', '0', 'Iusto corporis voluptatum cupiditate dolorem cumque. Sint in et exercitationem a. Facere voluptatibus doloremque blanditiis autem consequatur enim. Officiis ea totam dignissimos dolor occaecati non at occaecati. Facere vero iure a possimus vero et qui et. Alias consequatur sed suscipit et. Blanditiis et sint doloribus officia nihil enim ut. At qui dolor quo ipsum. Suscipit facere facere excepturi delectus. Sint delectus voluptatum qui tenetur nam ducimus culpa dolorem. Et quaerat nulla iure ullam et voluptatibus. Et rerum iste sit error aut consequatur aut qui.', '0', '0', 'Tenetur ut est aut minima. Rerum cum consequatur eos. Nemo harum optio nemo voluptates quibusdam ad omnis. Beatae minus dolorum eligendi vitae voluptatem. Occaecati dolor maxime eum est odit facere quis id. Et et dolorem qui inventore. Aliquam beatae laudantium porro eius perferendis. Officia accusamus tempore vel est pariatur quibusdam ex. Sed vero odio ipsam velit voluptas. Et ratione minus molestias est et sint. Odio omnis doloremque ea distinctio. Ut quam qui optio necessitatibus quia. Ratione nemo aut est nihil corrupti. Atque animi et veritatis voluptatem.', '0', '0', 'Ut velit aut quae molestiae. Eius aut excepturi nihil distinctio dolores quaerat sed minus. Ut et quasi rem voluptatibus sapiente. Est nesciunt explicabo autem enim nihil cupiditate quaerat nostrum. Tempore quidem ratione quia occaecati voluptate eum. Ipsam hic officiis nostrum in magnam. Ad omnis optio eius in velit necessitatibus illum. Nulla ea sunt quae doloribus ullam et veniam ut. Dolores dolorem id iusto. Omnis voluptatibus quaerat qui ullam modi nulla. Impedit sint a omnis id et dolor. A vero est voluptatem et placeat ab delectus. Voluptates nobis fugiat temporibus velit earum dignissimos accusamus.', '0', '0', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '2019-03-13 09:04:56', '2019-03-13 09:04:56'),
(181, 'Nostrum sed quo a nostrum deleniti.', 'nostrum-sed-quo-a-nostrum-deleniti', 'items/March2019/BMGrMjDf9IPWUzKjiEJY.jpg', '5', '0', 'Animi dolorem ut voluptatibus. Est voluptate distinctio numquam consequatur harum aspernatur consectetur. Quae placeat blanditiis laborum ea. Tempore deleniti ipsum natus aut saepe cumque culpa eaque. Blanditiis deleniti facilis laboriosam ut alias rerum consequuntur nostrum. Ea ratione distinctio voluptas consequuntur omnis praesentium possimus. Vel id sed ad aspernatur. Officiis sunt blanditiis eveniet omnis sequi dolorem. Alias voluptatem vel fugit. Vel sint quam labore ullam rerum molestiae nisi rerum. Quia voluptatem dolor dolore sint est. Consequatur magni eos sed qui. Id quia odio deserunt velit maiores enim. Explicabo dolore vitae quia. Et ullam et voluptatem mollitia esse doloribus quas cumque. Quos quis mollitia sapiente odit. Vel deleniti quaerat sed non at architecto veniam qui. Sint aut et sed sed laudantium omnis aut. Sed porro similique temporibus voluptatem.', '0', '0', 'Aut velit ea deserunt commodi excepturi. Quam dolorum vitae distinctio cum doloremque voluptas odit. Iure quia nisi eos eos explicabo doloribus animi voluptate. Dolor accusantium fugit quod dolor. At et ratione unde sed perspiciatis consequatur ex. Alias ut dolores eligendi quia porro eos. Animi reiciendis rem aliquam quasi sunt sint. Cum fugiat neque facere magni omnis vel. Laborum ut voluptatem excepturi alias qui ducimus. Vero optio temporibus accusamus hic consectetur debitis. Et ut ipsum et consequatur non optio. Quia voluptatibus ea sit possimus. Amet velit dicta et facere. Aliquid sit ut voluptatum molestias eligendi optio. Aut id et natus blanditiis. Iure minus rem blanditiis asperiores.', '0', '1', 'Nihil harum totam expedita excepturi nobis vel. Distinctio unde odit velit doloribus velit. Ipsam ad vitae voluptatem eligendi. Et non animi tempore qui consequatur perspiciatis reiciendis. Repellendus tempora voluptas ipsum consequatur voluptatum voluptatem. Repudiandae qui quos tenetur at sunt necessitatibus iure. Et non deserunt qui omnis enim sapiente voluptatibus dolores. Dicta distinctio sed eligendi impedit laudantium aspernatur mollitia. Quod neque error ea reiciendis. Est sequi vel eveniet nihil. Dicta debitis nisi ut quod. Quas quo provident velit sit officiis ullam ea facilis. Excepturi repudiandae nulla facilis sunt accusantium at quam. Id deleniti ut sed fugit quia. Est ea voluptatem dolorem ut aut placeat. Aut amet corporis sed quod doloremque quos dolorem ipsum. Repellendus aut rerum explicabo. Ullam accusantium error sed. Dolor aut omnis officia atque eum.', '0', '1', '1', '0', '1', '0', '1', '1', '1', '1', '1', '0', '2019-03-13 09:04:56', '2019-03-13 09:04:56'),
(187, 'Est occaecati ab mollitia vero.', 'est-occaecati-ab-mollitia-vero', 'items/March2019/SUpQvFPxIasSh5pSEWCX.jpg', '2', '0', 'Inventore eos dicta sed explicabo. Repellendus saepe omnis asperiores consequatur. Aperiam magni quos molestiae sed nihil. Sed itaque ut ipsam fugiat qui sit ipsum. Non quaerat vel dolores in saepe accusamus dolores aut. Aut velit occaecati possimus. Veniam enim fugiat molestiae ad velit. Officia alias et est necessitatibus. Ducimus repellendus nihil nihil magnam ex sit nihil. Non saepe ducimus quo rerum.', '0', '0', 'Molestiae iste ab ut. Nulla doloribus facere nihil sint distinctio iusto est numquam. Eum et molestiae architecto ipsa dolor. Consequatur delectus amet veniam. Labore saepe unde repudiandae repellat dolores incidunt. Officiis voluptatem laboriosam est id iure amet tempore. Voluptas sunt est culpa consequatur. Est autem illo quo est laborum vero. Quas in quibusdam aut dolorum non aliquid debitis. Totam quae et aperiam est. Ea ipsam a et aut cupiditate eos dolorum. Et iure provident enim quia. Magnam sint earum rerum voluptatem. Accusantium illum sapiente fuga velit minus quis doloribus. Voluptatem molestiae est qui pariatur.', '0', '0', 'Ea eaque tempore nesciunt fuga quas recusandae eaque. Omnis incidunt ut distinctio. Totam natus asperiores qui labore expedita voluptatibus. Ut est delectus ipsum omnis fugit et temporibus. Laboriosam delectus dolorem est ut eum enim. Architecto ratione quia adipisci. Sint quis voluptas fugiat animi et deserunt dolorem. A voluptatem earum quidem nobis sit nulla pariatur. Quos dolorem ullam cumque iure in voluptatem blanditiis. Blanditiis suscipit veniam aut sit animi corporis. Ratione vitae error officia. Pariatur vitae reprehenderit laborum. Nostrum repudiandae sit non vel non odio. Cumque voluptas dolorem sed. Laborum molestias aut aspernatur ullam omnis ab.', '0', '0', '1', '1', '1', '1', '1', '1', '0', '1', '1', '1', '2019-03-13 09:04:56', '2019-03-13 09:04:56'),
(203, 'Porro aut atque et nulla et quam.', 'porro-aut-atque-et-nulla-et-quam', 'items/March2019/BMGrMjDf9IPWUzKjiEJY.jpg', '1', '0', 'Vero ad dicta repellendus voluptas. Rerum eos eos sunt est placeat. Autem fuga dicta repudiandae quis sed ipsa. Enim aut suscipit est delectus. Cum reprehenderit veritatis aut quia consequatur sunt ut. Itaque saepe dolores possimus velit atque. Error facere est quod aut aut at. Aut accusantium nihil quae voluptas et. Sed perferendis dolore consequuntur. Molestiae enim reiciendis dignissimos sunt vel sed. Dolor eveniet dolore fuga suscipit pariatur. Rerum maxime placeat aliquid alias. Repellat non a quam sint nesciunt ullam fugit. Et nesciunt dolor dolorum. Iste minus tenetur necessitatibus eaque. Quo est odio sit officia consequatur. Et aperiam ratione eveniet. Temporibus provident numquam quisquam et ut odio.', '0', '0', 'Odio nihil eos sit eveniet ea iste blanditiis. Cumque ex ut quia non temporibus eos ea asperiores. Et maxime eum labore ipsa non delectus itaque. Molestias et rem corrupti eos quod. Quia maiores similique deserunt repellendus eos et. Deleniti magnam rem accusantium aliquid est. Qui officia iste sunt qui facilis at hic. Sunt adipisci ratione quia laboriosam nostrum magnam illo. Esse magni corporis dolores laudantium. Et voluptatem excepturi neque quia sit est. Beatae cumque eveniet dolores doloremque. Laborum quidem eius rerum nihil suscipit perspiciatis. Ducimus doloribus autem quo consequatur consequatur magnam aut non. Dolor ea sint nihil omnis est quasi est. Aut nostrum modi ea. Dolorum temporibus enim aut qui fuga ipsum exercitationem. Rerum amet delectus et ab. Aliquam sint perferendis assumenda beatae dolores illo perferendis debitis. Occaecati enim eum unde ullam quis. Blanditiis quo ipsam rerum perferendis doloribus fuga. Unde earum sit tenetur.', '0', '0', 'Magni maiores aut corporis in et autem omnis. Voluptatem voluptate et reprehenderit illo. Est ad ullam et occaecati. Quas autem omnis assumenda similique aut aut esse placeat. Et labore ullam molestias. In vero quo totam temporibus pariatur. Non vero quaerat perferendis rerum. Sit neque temporibus omnis quo. Eos id commodi repellat et. Mollitia eos harum ut est quia itaque tempore cum. Ipsa cupiditate qui laborum dignissimos molestiae nisi laudantium asperiores. Aliquam et molestiae eos ex. Eum sed et voluptas fugiat aut. Eveniet tempore suscipit saepe quibusdam. Et praesentium molestias et accusamus qui id tempore. Qui consequatur aut provident est possimus. Iste quasi eos omnis perspiciatis at odit. Dolor nobis quaerat consequuntur maiores nulla quos. Quibusdam dolor inventore accusantium repellendus fuga quasi reprehenderit.', '0', '1', '1', '0', '0', '0', '0', '0', '1', '1', '0', '1', '2019-03-13 09:04:57', '2019-03-13 09:04:57');
INSERT INTO `items` (`id`, `title`, `slug`, `image`, `link`, `position`, `body1`, `teaser1`, `showt1`, `body2`, `teaser2`, `showt2`, `body3`, `teaser3`, `showt3`, `area2`, `area3`, `area4`, `area5`, `area6`, `area7`, `area8`, `area9`, `area10`, `loader`, `created_at`, `updated_at`) VALUES
(208, 'Velit animi quam velit et voluptate aut.', 'velit-animi-quam-velit-et-voluptate-aut', 'items/March2019/SUpQvFPxIasSh5pSEWCX.jpg', '1', '0', 'Quasi officia consequatur nisi eaque numquam. Animi ullam molestiae velit. Vel totam culpa inventore dolores accusantium rerum. Expedita iusto maiores nam et officiis laudantium. Ducimus ut qui excepturi amet ab qui. Temporibus et at eos dolores enim. Delectus dolores a unde officiis eos culpa. Est asperiores cum et rerum. Fugit beatae ea voluptatem et. Soluta molestiae deleniti libero sed amet et quisquam. Molestiae ea velit rerum nisi. Eligendi ipsam placeat ipsam qui fugit. Nulla voluptatem est occaecati quaerat porro iure. In beatae quas harum qui nisi ipsam rerum. Laudantium et animi quo adipisci sed exercitationem. Culpa labore rerum molestias ut voluptatem minus dolores. Aliquid ex culpa ipsam accusamus aut.', '0', '0', 'Aliquid id ipsum sint molestiae rerum fugit consequatur. Ut dolor dolores rerum expedita iste. Rerum sint voluptatem iusto totam. Non rerum placeat placeat rem enim at. Omnis soluta ut consectetur ut. Delectus enim totam porro odit cumque est. Repellat minus et inventore autem. Voluptatem quia sed ipsa impedit et. Ipsam animi vel a repudiandae sint iure nam. Aperiam praesentium autem unde qui. Ut voluptatibus iusto veniam quia. Id in cupiditate facere consectetur veritatis molestias minima. Quis facere voluptate libero quod sint dignissimos laborum. Commodi aperiam quaerat quo fuga quia. Velit dolores est sequi exercitationem est. Fuga optio corrupti accusantium qui optio. Ab assumenda minus veniam rerum. Repudiandae maxime aut quod nihil qui rerum dicta omnis. Deserunt voluptas ut rerum quia quo aut saepe.', '0', '0', 'Voluptatibus commodi reiciendis voluptatem quia aut. Omnis error ipsam labore architecto doloribus. Molestias et quasi blanditiis voluptatem ut ut et. Nam ab sint quia blanditiis autem. Omnis neque in voluptas. Rerum aliquam rerum consequatur minima nemo reiciendis blanditiis nihil. Soluta quod perferendis libero doloribus dolores et sequi. Officia consequatur vero quibusdam consequuntur eum et. Nemo aut ea et. Rerum corrupti est labore doloremque id aut nihil. Architecto et non animi est doloribus tenetur dolores. Et quod vel exercitationem sunt. Itaque non ducimus sed totam voluptatem. Voluptas ut hic non cumque nisi facere est. Et ratione ullam eligendi et minus beatae. Modi nihil vel possimus voluptas vero. Harum pariatur ipsam expedita iste voluptas.', '0', '0', '1', '1', '1', '0', '0', '1', '0', '0', '0', '1', '2019-03-13 09:04:57', '2019-03-13 09:04:57'),
(215, 'Et velit facere labore harum nisi atque.', 'et-velit-facere-labore-harum-nisi-atque', 'items/March2019/SUpQvFPxIasSh5pSEWCX.jpg', '3', '0', 'Placeat rerum ea assumenda qui. Sapiente maiores corrupti ut ut pariatur. Sunt et blanditiis accusantium et dolores voluptates iure. Atque et praesentium quo non earum magni sit. Consequatur voluptate veniam facere perspiciatis culpa quo quo. Dolorem optio vel iure vel id qui voluptatibus. Odio accusantium libero sapiente numquam. Autem impedit porro voluptatum tempora voluptatem temporibus. Beatae sed provident odit ex deserunt. Minima adipisci qui quam voluptatem voluptatem iste voluptas. Quia porro illo minus ut distinctio.', '0', '0', 'Consequatur dicta autem vel quaerat suscipit est assumenda ipsam. Molestiae natus iusto molestias qui voluptatibus exercitationem eos. Ea modi nam sequi quo. Aut sunt in blanditiis et asperiores et. Hic consequatur molestias aut qui. Temporibus dolor velit commodi nihil aut quis veritatis assumenda. Saepe aperiam eligendi vel. Nulla nesciunt numquam consequatur aliquam. Atque esse facere praesentium omnis nihil. Eum asperiores natus quia eum.', '0', '0', 'Ipsa dicta velit autem. Sint esse veritatis sapiente est est assumenda. Est rerum odit voluptates in necessitatibus. Omnis quos tempora doloribus sit eveniet ducimus nihil aliquid. Nobis officiis eveniet suscipit sed laborum at. Ex amet officiis deserunt et consequatur omnis qui. Accusamus deserunt quibusdam pariatur iusto perspiciatis. Debitis temporibus necessitatibus sunt officiis quo labore. Consequatur aut beatae numquam perspiciatis beatae. Nisi sed tempore cum quia minus aspernatur. Cumque non in iusto enim sit iure rem aut.', '0', '1', '1', '0', '1', '0', '0', '1', '0', '1', '1', '0', '2019-03-13 09:04:57', '2019-03-13 09:04:57'),
(223, 'Eum et ab assumenda atque.', 'eum-et-ab-assumenda-atque', 'items/March2019/SUpQvFPxIasSh5pSEWCX.jpg', '2', '0', 'Dignissimos eligendi eum maiores omnis voluptatem. Ut mollitia qui fugit quasi quibusdam voluptatem. Laudantium ex eum tenetur et est aliquid aut. Eius quia omnis maxime. Ex ut occaecati ab dolore dignissimos voluptas expedita. Aut veritatis blanditiis eos ut. Architecto veniam omnis aperiam eum velit omnis. Repellendus vel ratione qui. Ex culpa eius dolores voluptate earum vitae. Modi ab quo ducimus nam iure occaecati ea. Autem repudiandae cupiditate non quaerat et et adipisci. Ut ut quia quia optio nostrum aut unde quia. Mollitia atque minima ipsam eius porro. Et ut enim optio ab tenetur aspernatur. Ut cupiditate harum sit in porro. Et saepe distinctio error eius fugiat reprehenderit. Deleniti illum debitis est expedita rem autem. Ullam est velit quis nesciunt eligendi aut ut. Perferendis aliquam soluta eos laborum possimus consequatur et. Repellendus alias mollitia veniam eum quis minima saepe iusto.', '0', '0', 'Eaque nihil et soluta consectetur corporis. Aut autem labore ut numquam. Numquam temporibus nobis inventore et. Aspernatur ut suscipit fuga vel voluptatem sit. Qui adipisci dolores necessitatibus quia. Commodi fugit veritatis soluta. Doloremque ut odio id nemo. Quia animi ipsum ea cumque eligendi consequatur nostrum. Sit saepe amet at quisquam fugit. Ut reiciendis quo sint natus voluptatem quasi debitis. Facere commodi vitae et at illum. Non ullam aut omnis non nulla. Aut odit voluptatem modi quidem provident repellendus quae. Consequatur repudiandae temporibus ab accusantium accusamus velit. Quas officiis doloribus eligendi sequi qui. Sequi doloremque quasi reprehenderit aut quasi eos porro. Harum iusto excepturi et repudiandae ratione qui. Aut in sunt quia ut et. Facere autem ea ad nostrum libero est. Saepe beatae veritatis dolores repudiandae nihil voluptatem. Sint autem corporis voluptas voluptas.', '0', '0', 'Vel ex quia voluptatibus numquam. Quos qui nostrum fugiat quisquam fuga. Aut sit ut est corporis rerum veritatis et. Repudiandae ut eaque voluptatem ut eum maxime temporibus. Ut vitae architecto consequatur earum voluptas aut veniam. Et quibusdam autem laborum nobis accusantium qui autem. Totam praesentium nam iusto voluptatem ut. Aliquam ipsa eos quis facere qui blanditiis aperiam. Similique provident nihil sint impedit. Sit et nihil quis. Porro eos dolor est sunt. Quia tempore possimus cupiditate eum aliquid perspiciatis. Consequatur harum nisi quaerat facilis. Culpa autem vel similique ea ad. Occaecati quia eveniet molestiae fugit cupiditate corrupti.', '0', '0', '1', '0', '0', '1', '1', '1', '1', '1', '0', '0', '2019-03-13 09:04:57', '2019-03-13 09:04:57'),
(228, 'Autem sint in dolorem voluptas recusandae repellat velit.', 'autem-sint-in-dolorem-voluptas-recusandae-repellat-velit', 'items/March2019/SUpQvFPxIasSh5pSEWCX.jpg', '2', '0', 'Velit commodi assumenda sit similique qui similique qui. Consectetur praesentium consectetur repudiandae maxime aut ut vero blanditiis. Illum debitis doloremque consequuntur et minus nisi expedita. Repudiandae sunt quod velit fugit eveniet rem. Vitae tempore non ut. Ea est numquam voluptates ea asperiores nam. Voluptatem molestiae vel molestias harum sunt molestiae nihil. Aperiam nisi dolorum totam nobis eveniet. Modi commodi odio impedit expedita. Enim incidunt aliquid optio enim modi aut eligendi. Et quod sapiente enim enim quo. Quisquam ab id qui ab voluptatem rerum voluptatem. Repudiandae non et ut perspiciatis. Illum eos sint aspernatur odit quisquam exercitationem at. Neque iusto voluptas distinctio ut et vel blanditiis autem. Ipsam perferendis et voluptatem voluptate quisquam cumque. Sequi voluptas qui tenetur consequatur. Quasi adipisci qui deleniti porro non sapiente voluptatibus. Dolor maxime sint rerum aliquid dolores sed perferendis iure. Eum quisquam sit animi sint quisquam. Et dolorem sequi ab.', '0', '0', 'Consequatur omnis qui sequi. Cumque blanditiis vel et voluptas eligendi ea. Eveniet ut aut quibusdam illum aut consectetur non. Voluptatem nisi fugiat aliquam maxime perferendis. Atque eum rerum amet deleniti consequatur maiores et occaecati. Illo quasi magnam harum at hic fugiat. Numquam quia blanditiis rerum qui minus beatae. Vel corporis maiores quia dolorem officiis voluptas. Voluptatem dolorum inventore architecto soluta aspernatur. Velit assumenda autem odio laudantium. Saepe dolore iste velit. Optio error nobis consequatur. Omnis illum impedit ab consequatur nulla quo. Earum ipsa reprehenderit ut dolores deleniti. Beatae modi repudiandae rerum vero tenetur dolores quo. Cupiditate dolorem eos necessitatibus id sequi. Voluptas non est beatae quis.', '0', '1', 'Sint dolor aut maxime et nihil libero molestias. Temporibus aliquid repellendus rerum laboriosam. Rerum magni eos ea optio laborum. Doloremque eveniet ducimus repudiandae dignissimos vitae cumque. Omnis eius ratione ullam sit mollitia. Sit ratione temporibus consequatur et. Sit deleniti iusto quasi libero iusto pariatur. Perferendis aut dolores molestiae cumque animi. Non odit quos aut voluptatum veritatis. Est voluptas sed expedita. Occaecati neque officiis voluptates voluptatem doloribus voluptates.', '0', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '1', '2019-03-13 09:04:57', '2019-03-13 09:04:57'),
(251, 'Quo commodi quo magni voluptatem inventore magnam praesentium.', 'quo-commodi-quo-magni-voluptatem-inventore-magnam-praesentium', 'items/March2019/SUpQvFPxIasSh5pSEWCX.jpg', '5', '0', 'Dolores nulla est occaecati dolores fuga distinctio. Dolore illo impedit aut et. Iure sunt odit est quia. At quibusdam dolor debitis laborum vel. Quibusdam corporis ut nulla delectus occaecati. Adipisci similique ducimus a ad ex cumque aut. Cupiditate perspiciatis similique ea. Esse perferendis corrupti eligendi unde expedita illum doloremque. Magni dolores quam dicta et voluptatem. Quia tempora qui quas quo deleniti. Modi at quia sit deserunt quia nesciunt. Quidem rem quae qui fugiat explicabo est ut. Velit saepe facilis autem delectus. Modi sint et enim ut et. Totam quia nam tenetur sed in. Accusamus sit laudantium id qui nemo sit. Vel perferendis accusantium consequuntur incidunt corporis aut quisquam architecto. Aliquam aut explicabo assumenda nam et voluptatibus vel. Autem iusto pariatur corrupti neque fugiat odit. Animi vel quas blanditiis earum. Laborum voluptatem reprehenderit ratione molestias rerum provident.', '0', '1', 'Veritatis maxime totam fugit quia assumenda delectus. Necessitatibus possimus nesciunt eligendi et quia quas maxime. Et qui sequi consequatur sequi quo. Quia provident ad dicta omnis unde natus incidunt. Qui porro non ad cumque inventore cum quia beatae. Earum aperiam omnis ab ab occaecati molestiae aperiam. Consequuntur quaerat qui fugit nihil aut dolor. Enim consequuntur qui veniam sequi aut rem voluptatibus. Adipisci rerum voluptas quia doloremque. Optio nostrum voluptatem iure nobis. Quis voluptatibus in quis quibusdam eos nostrum ducimus. Ut nemo adipisci animi qui possimus accusantium. Et odio culpa cupiditate et dolorem quaerat. Beatae autem dolorem ut. Hic sit sed deleniti voluptate harum qui non. Necessitatibus id et magni eveniet ex veniam quis. Cum qui voluptates quaerat et esse numquam nulla. Optio sed dolore culpa eum et ab laboriosam ut. Aut possimus rerum officiis pariatur sit.', '0', '0', 'Repellendus itaque cum et odio. Distinctio aperiam facilis non temporibus. Quia eos dolor inventore possimus ullam enim. Quod omnis impedit iste necessitatibus. Dolorem deserunt nihil itaque rerum commodi quod. Et sapiente blanditiis et at dolorem amet. Quo minima qui quia quaerat impedit. Quo aut odit aut facere provident omnis totam est. Quasi magnam consectetur enim laborum rerum ut. Nam corrupti autem illum maiores voluptatem. Ducimus ipsam quam officiis.', '0', '1', '1', '1', '1', '0', '1', '0', '1', '0', '0', '0', '2019-03-13 09:04:57', '2019-03-13 09:04:57'),
(252, 'Dignissimos similique aliquid ducimus et autem fugiat.', 'dignissimos-similique-aliquid-ducimus-et-autem-fugiat', 'items/March2019/BMGrMjDf9IPWUzKjiEJY.jpg', '3', '0', 'Qui culpa sunt alias incidunt. Ratione suscipit ab facere explicabo eaque. Reiciendis autem cumque commodi est ad. Exercitationem voluptas sint est delectus qui impedit sit similique. Quia nam voluptatibus et quibusdam quidem et laudantium. Quo rem labore unde sed animi et qui. Saepe aut consequatur ipsum earum accusamus. Aut aut corrupti soluta vitae quis possimus ipsam. Minus non ipsam sunt illo et. Nihil aliquam suscipit est totam quod. Voluptatem iure eveniet at odit placeat amet. Possimus tenetur aspernatur exercitationem impedit totam autem eveniet non. Nam nihil quia aut unde in ratione. Et quod ducimus ex ut aut aliquid. In assumenda enim est unde hic quasi tempora. Neque dolorum nihil a natus aliquid aut. Optio aut beatae voluptas sit. Repellendus animi est et occaecati et delectus.', '0', '0', 'Sit recusandae et fuga et enim quaerat at. Eum veniam corporis rerum nisi suscipit et non. Nesciunt magnam quo perferendis veritatis incidunt sit quam. Et sunt ut quasi quos id et quae sequi. Hic ducimus a voluptas porro et. Voluptatum in molestiae culpa debitis eius. Quaerat odio ea qui culpa cum minima necessitatibus. Illum eum aliquid deleniti dolores consectetur. Nobis molestiae debitis quos voluptatem consequatur. Fuga error distinctio libero autem. Mollitia veniam occaecati fuga qui neque nihil voluptatem ut. Ex odio tempore deleniti neque quos. Enim occaecati placeat assumenda qui velit officia. Qui cum qui perferendis impedit voluptatem quia eum vel. Eius vel perferendis aut ut nostrum explicabo ut.', '0', '0', 'Temporibus est dolores tempore non minus voluptas beatae. Saepe non sunt atque totam accusamus velit impedit. Soluta dolores aut temporibus. Velit quis quae aut amet exercitationem nostrum facilis. Ut et exercitationem iure vitae velit voluptas voluptate. Aut ipsam mollitia ut voluptas tempora et iste. Tempore rerum cum voluptatem esse sed. Ad esse et rerum blanditiis recusandae. Accusamus id sed assumenda odit tenetur quasi est aut. Neque eum aut et iusto dolores ratione. A totam facilis velit ratione. Qui veniam aliquam rem necessitatibus voluptas velit.', '0', '0', '1', '0', '0', '0', '1', '1', '0', '1', '1', '1', '2019-03-13 09:04:57', '2019-03-13 09:04:57'),
(292, 'Esse aliquid voluptatem tempora unde.', 'esse-aliquid-voluptatem-tempora-unde', 'items/March2019/BMGrMjDf9IPWUzKjiEJY.jpg', '5', '0', 'Assumenda ratione et quo deserunt natus. Commodi ut dignissimos beatae. Et id delectus eaque qui iure. Voluptas natus libero similique in. Fugit quos cupiditate sed id ex vitae. Et sint deleniti earum aliquam ratione odio sed. Dolore ut libero eius quia totam. Dicta et in dolores id laboriosam. Assumenda eos dolorem sit. Facere officia quaerat sapiente quas qui reiciendis. Et nam aliquam consequatur autem recusandae veniam consectetur. Officia aut quod quia voluptatem aliquid officiis. A non eum omnis tempore rerum quis. Dolores reprehenderit numquam mollitia delectus enim rerum.', '0', '1', 'Dignissimos nostrum facilis eveniet architecto sed tenetur. Cumque consequatur beatae est hic quibusdam. Et accusamus libero et ea voluptas. Ut quis qui voluptatibus aspernatur rerum et quaerat. Eius voluptates atque quia assumenda voluptatem. Doloremque iusto eos voluptas impedit corrupti facilis iste. Reiciendis beatae enim perferendis ratione non sunt magni illo. Rerum exercitationem autem culpa et. Necessitatibus repellendus non voluptatem dolores. Doloremque eaque accusamus ullam voluptatum exercitationem nemo molestiae. Dignissimos et quo est excepturi vero aperiam. Corporis quibusdam sint autem aut voluptate ut. Et aut mollitia tempora deleniti. Fugit nemo officiis eum vel aliquam beatae. Voluptatem ut in dolores dolorem et. Voluptatem fugiat at neque sunt rem molestiae laboriosam et. Blanditiis autem aut accusantium nam quo quia non. Est quia quo voluptatem perspiciatis. Magnam harum voluptate ut consequatur voluptatem animi. Nemo eos autem dolorem quam. Eius quasi quaerat tempora voluptas.', '0', '0', 'Temporibus quidem voluptatem dolore ut maiores aut. Reprehenderit harum voluptate aut vitae. Et vero rerum ex qui odio ullam. Amet iure sunt dignissimos quibusdam quod iste. Est corporis iusto est aspernatur vel. Aperiam est aspernatur eveniet. Voluptas minima aut quis et officiis quo alias. Dolor similique qui minima illum qui aut at. In nam qui cupiditate. Molestiae ut ex et magnam maxime aliquam aut excepturi. Enim earum mollitia culpa autem. Rerum soluta consequuntur vel id in non. Rerum tempore minus dolor provident. Corporis earum tempora excepturi quae occaecati.', '0', '1', '1', '0', '1', '1', '1', '1', '1', '0', '0', '0', '2019-03-13 09:04:57', '2019-03-13 09:04:57'),
(336, 'Distinctio rem illo ipsam asperiores.', 'distinctio-rem-illo-ipsam-asperiores', 'items/March2019/BMGrMjDf9IPWUzKjiEJY.jpg', '2', '0', 'Quo perferendis omnis voluptatem et. Aspernatur esse necessitatibus et consectetur. Rem necessitatibus est numquam qui non. Aliquam voluptas et est non voluptatem. Qui reprehenderit deleniti quidem laborum accusantium et dolore. Voluptatibus optio rerum cupiditate. Nisi sequi autem magnam officiis. Earum illo similique error ad quia unde et. Esse qui ratione officiis et doloribus architecto. Voluptatem magnam cupiditate tempora sit. Magni minus quis ea sed.', '0', '1', 'Voluptatem in velit id totam qui voluptas praesentium. Placeat non soluta in libero alias quo dolores. Inventore autem sed hic nihil et corporis. Et aut aut iste et voluptas et. Esse ullam velit et. Non nulla et illum et quasi libero. Aut et dolore earum itaque rem saepe. Quia expedita ut aut voluptatem. Nisi et aperiam sunt et ea esse quasi sit. Minus nihil cum ad neque. Maiores vel est quia quisquam enim quia ea.', '0', '1', 'Id alias odit ab aut. Cupiditate earum eum enim modi non eum et cumque. Autem iure in et eos voluptate est qui voluptas. Aspernatur aspernatur voluptates voluptatem laborum nulla sint. Nobis facere maxime eum et consequatur. Placeat tenetur quisquam reprehenderit et atque nihil corrupti nobis. Omnis et sequi nobis earum. Minima esse asperiores autem enim ad. Earum assumenda corrupti provident. Voluptatem tempore omnis est voluptatem.', '0', '1', '1', '0', '1', '0', '0', '1', '0', '1', '1', '0', '2019-03-13 09:04:57', '2019-03-13 09:04:57'),
(387, 'Deserunt ut nulla temporibus quis et cum.', 'deserunt-ut-nulla-temporibus-quis-et-cum', 'items/March2019/BMGrMjDf9IPWUzKjiEJY.jpg', '3', '0', 'Et perferendis optio voluptates. Laboriosam molestiae est deleniti labore et. Iure sunt quo hic sit enim qui. Aspernatur voluptas explicabo dolor dolores. Quis eum provident eveniet modi in repellendus. Qui fugit officiis eum omnis maxime aliquam accusantium. Assumenda velit deserunt quia dolorum rerum nam. Rerum expedita cupiditate eius nostrum. Sit in perspiciatis sed quas consectetur sapiente hic ut. Quam cupiditate aut odio provident eaque. Qui molestiae quam consequatur non corporis.', '0', '1', 'Deserunt ut quibusdam molestias ut quaerat. Numquam fugit maiores molestias soluta repellendus. Ut distinctio ut distinctio optio consequatur cum praesentium asperiores. Est expedita id id in occaecati dicta. Quis eum natus dolorem ut nobis laboriosam. Voluptatem sit id sed a voluptatibus veritatis distinctio. At dicta ab tenetur autem omnis temporibus dicta. Incidunt autem expedita omnis molestiae enim est. Deleniti id culpa et maxime quia provident nulla. Quae impedit similique laudantium et odio. Eius quia quos provident. Dolores quibusdam nemo eaque vel quos.', '0', '1', 'Exercitationem laborum maxime est numquam dolores dolore illum velit. Ut dicta vel odit et sunt ipsa. Officiis at consequuntur et qui architecto harum ea. Ea praesentium molestiae nihil dolor aperiam consequatur. Voluptas accusamus aut quis vel ut quis quos. Voluptatibus quasi vitae eveniet. Possimus aut molestias dolorem assumenda. Enim ipsa mollitia iste iste rem quis. Fugit ullam atque aut aliquid. Libero sequi reprehenderit quam mollitia et. Est voluptatem magnam tenetur et minima error.', '0', '0', '1', '0', '1', '0', '0', '0', '1', '0', '1', '1', '2019-03-13 09:04:57', '2019-03-13 09:04:57'),
(414, 'кух тиз 1 гл', 'kuh-tiz-1-gl', 'items/March2019/2mYa2DRvT1E4SEfwi6xN.jpg', '0', '5', '<p>1</p>', NULL, NULL, '<p>2</p>', NULL, NULL, '<p>3</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-14 18:53:16', '2019-03-14 18:53:16'),
(415, 'кух тиз 2 гл', 'kuh-tiz-2-gl', 'items/March2019/iJnKybb2bfrm0os8gYBq.jpg', '0', '5', '<p>1</p>', NULL, NULL, '<p>2</p>', NULL, NULL, '<p>3</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-14 18:53:00', '2019-03-14 18:54:08'),
(416, 'кух тиз 3 гл', 'kuh-tiz-3-gl', 'items/March2019/8hhFWXYhE9TD6N3aviwk.jpg', '0', '5', '<p>1</p>', NULL, NULL, '<p>2</p>', NULL, NULL, '<p>3</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-14 18:53:59', '2019-03-14 18:53:59'),
(417, 'кух тиз 4 гл', 'kuh-tiz-4-gl', 'items/March2019/POQwWBt4nrehsr8JgCEF.png', '0', '5', '<p>1</p>', NULL, NULL, '<p>2</p>', NULL, NULL, '<p>3</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-14 18:54:32', '2019-03-14 18:54:32'),
(418, 'кух тиз 5 гл', 'kuh-tiz-5-gl', 'items/March2019/JDmXDHBUOn4PlxJLllb5.jpg', '0', '5', '<p>1</p>', NULL, NULL, '<p>2</p>', NULL, NULL, '<p>3</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-14 18:55:00', '2019-03-14 18:55:00'),
(419, 'кух тиз 1 гл', 'kuh-tiz-1-gl', 'items/March2019/2oIUgpWJLms4Ry9ufDWr.jpg', '0', '5', '<p>1</p>', NULL, NULL, '<p>2</p>', NULL, NULL, '<p>3</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-14 18:55:17', '2019-03-14 18:55:17'),
(420, 'кух тиз 6 гл', 'kuh-tiz-6-gl', 'items/March2019/0yU9AcMvuRey7BovgPZK.jpg', '0', '5', '<p>1</p>', NULL, NULL, '<p>2</p>', NULL, NULL, '<p>3</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-14 18:55:00', '2019-03-14 18:56:10'),
(421, 'кух тиз 7 гл', 'kuh-tiz-7-gl', 'items/March2019/j2f76XtRErAhbi3Q6qVd.jpg', '0', '5', '<p>1</p>', NULL, NULL, '<p>2</p>', NULL, NULL, '<p>3</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-14 18:55:56', '2019-03-14 18:55:56'),
(422, 'кух тиз 8 гл', 'kuh-tiz-8-gl', 'items/March2019/HDtfHPtSKH7wIhHK4aQo.jpg', '0', '5', '<p>1</p>', NULL, NULL, '<p>2</p>', NULL, NULL, '<p>3</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-14 18:56:30', '2019-03-14 18:56:30'),
(423, 'кух тиз 9 гл   hghfgh fh tghdfg  авпапрврпрапрара', 'kuh-tiz-9-gl-hghfgh-fh-tghdfg-avpaprvrpraprara', 'items/March2019/aWD0nj3o4US0yGSnmXXg.jpg', '0', '5', '<p>1</p>', NULL, NULL, '<p>2</p>', NULL, NULL, '<p>3</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-14 18:56:00', '2019-03-15 10:04:12'),
(424, 'кух тиз 10 гл', 'kuh-tiz-10-gl', 'items/March2019/Dt89FgFrgF0tLfFAFEod.jpg', '0', '5', '<p>1</p>', NULL, NULL, '<p>2</p>', NULL, NULL, '<p>3</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-14 18:57:27', '2019-03-14 18:57:27'),
(471, '1 тиз политика главная. Супер важное событие наступило, узнай какое...', '1-tiz-politika-glavnaya-super-vazhnoe-sobytie-nastupilo-uznaj-kakoe', 'items/March2019/3PEoZCdMBdCw9iw2o3ZZ.jpg', '0', '1', '<p><span style=\"color: #333333; font-family: Arial, Helvetica, sans-serif;\"><span style=\"font-size: 13px;\">Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</span></span></p>', NULL, NULL, '<p><span style=\"color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 13px;\">Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</span></p>', NULL, NULL, '<p><span style=\"color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 13px;\">Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</span></p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:17:14', '2019-03-17 13:17:14'),
(472, '2 тиз политика главная. Супер важное событие наступило, узнай какое...', '2-tiz-politika-glavnaya-super-vazhnoe-sobytie-nastupilo-uznaj-kakoe', 'items/March2019/tOsDDNUJzcF0O0nHdfEp.jpeg', '0', '1', '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:17:00', '2019-03-17 13:18:35'),
(473, '3 тиз политика главная. Супер важное событие наступило, узнай какое...', '3-tiz-politika-glavnaya-super-vazhnoe-sobytie-nastupilo-uznaj-kakoe', 'items/March2019/lJp9SaF8x6sitFOdP7Pl.jpg', '0', '1', '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:18:00', '2019-03-17 13:22:40'),
(474, '4 тиз политика главная. Супер важное событие наступило, узнай какое...', '4-tiz-politika-glavnaya-super-vazhnoe-sobytie-nastupilo-uznaj-kakoe', 'items/March2019/usf5r3VoYnxMSNdPoTMf.jpg', '0', '1', '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:18:57', '2019-03-17 13:18:57'),
(475, '5 тиз политика главная. Супер важное событие наступило, узнай какое...', '5-tiz-politika-glavnaya-super-vazhnoe-sobytie-nastupilo-uznaj-kakoe', 'items/March2019/U8zSQdFvlglInN0zLkXs.jpg', '0', '1', '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:21:04', '2019-03-17 13:21:04'),
(476, '6 тиз политика главная. Супер важное событие наступило, узнай какое...', '6-tiz-politika-glavnaya-super-vazhnoe-sobytie-nastupilo-uznaj-kakoe', 'items/March2019/3MOGDGIdamMpBM4sP3fT.jpg', '0', '1', '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:21:15', '2019-03-17 13:21:15'),
(477, '7 тиз политика главная. Супер важное событие наступило, узнай какое...', '7-tiz-politika-glavnaya-super-vazhnoe-sobytie-nastupilo-uznaj-kakoe', 'items/March2019/uv4H4F9NEhrfgueaQAj1.jpg', '0', '1', '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:21:29', '2019-03-17 13:21:29'),
(478, '8 тиз политика главная. Супер важное событие наступило, узнай какое...', '8-tiz-politika-glavnaya-super-vazhnoe-sobytie-nastupilo-uznaj-kakoe', 'items/March2019/KNP67oNTE881XwYZbHuF.jpg', '0', '1', '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:21:41', '2019-03-17 13:21:41'),
(479, '9 тиз политика главная. Супер важное событие наступило, узнай какое...', '9-tiz-politika-glavnaya-super-vazhnoe-sobytie-nastupilo-uznaj-kakoe', 'items/March2019/Pf4PrlxHyX7TQIgCi7It.jpg', '0', '1', '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:21:54', '2019-03-17 13:21:54'),
(480, '10 тиз политика главная. Супер важное событие наступило, узнай какое...', '10-tiz-politika-glavnaya-super-vazhnoe-sobytie-nastupilo-uznaj-kakoe', 'items/March2019/rXqHQWYVFr9evqNAxuEM.jpg', '0', '1', '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:22:05', '2019-03-17 13:22:05'),
(481, '11 тиз политика главная. Супер важное событие наступило, узнай какое...', '11-tiz-politika-glavnaya-super-vazhnoe-sobytie-nastupilo-uznaj-kakoe', 'items/March2019/lJCjEBMKVNpUZUe7LwQd.jpg', '0', '1', '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:22:17', '2019-03-17 13:22:17'),
(482, '1 тиз шоу бизнес главная. Супер важное событие, узнай как...', '1-tiz-shou-biznes-glavnaya-super-vazhnoe-sobytie-uznaj-kak', 'items/March2019/9Yt6CXRyRS7soiXx8ZuG.jpg', '0', '2', '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:28:45', '2019-03-17 13:28:45'),
(483, '2 тиз шоу бизнес главная. Супер важное событие, узнай как...', '2-tiz-shou-biznes-glavnaya-super-vazhnoe-sobytie-uznaj-kak', 'items/March2019/8CMuQtFmchRVV17kzkkz.jpg', '0', '2', '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:31:03', '2019-03-17 13:31:03'),
(484, '3 тиз шоу бизнес главная. Супер важное событие, узнай как...', '3-tiz-shou-biznes-glavnaya-super-vazhnoe-sobytie-uznaj-kak', 'items/March2019/KdoTIsoM8miLaeuMb6En.jpg', '0', '2', '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:31:13', '2019-03-17 13:31:13'),
(485, '4 тиз шоу бизнес главная. Супер важное событие, узнай как...', '4-tiz-shou-biznes-glavnaya-super-vazhnoe-sobytie-uznaj-kak', 'items/March2019/MDB3Eb3YXQsYo6wIp0ud.jpg', '0', '2', '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:31:23', '2019-03-17 13:31:23'),
(486, '5 тиз шоу бизнес главная. Супер важное событие, узнай как...', '5-tiz-shou-biznes-glavnaya-super-vazhnoe-sobytie-uznaj-kak', 'items/March2019/8Vpx4kthgn17bNK6ljE4.jpg', '0', '2', '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:31:34', '2019-03-17 13:31:34'),
(487, '6 тиз шоу бизнес главная. Супер важное событие, узнай как...', '6-tiz-shou-biznes-glavnaya-super-vazhnoe-sobytie-uznaj-kak', 'items/March2019/TwC6XRj0wKKp2Tpwb1qQ.jpg', '0', '2', '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:31:45', '2019-03-17 13:31:45');
INSERT INTO `items` (`id`, `title`, `slug`, `image`, `link`, `position`, `body1`, `teaser1`, `showt1`, `body2`, `teaser2`, `showt2`, `body3`, `teaser3`, `showt3`, `area2`, `area3`, `area4`, `area5`, `area6`, `area7`, `area8`, `area9`, `area10`, `loader`, `created_at`, `updated_at`) VALUES
(488, '7 тиз шоу бизнес главная. Супер важное событие, узнай как...', '7-tiz-shou-biznes-glavnaya-super-vazhnoe-sobytie-uznaj-kak', 'items/March2019/J9eRRkuGC1jXSOuv8QkE.jpg', '0', '2', '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:31:56', '2019-03-17 13:31:56'),
(489, '8 тиз шоу бизнес главная. Супер важное событие, узнай как...', '8-tiz-shou-biznes-glavnaya-super-vazhnoe-sobytie-uznaj-kak', 'items/March2019/M2m6bD2UdhWoGvdHJVxT.jpg', '0', '2', '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:32:03', '2019-03-17 13:32:03'),
(490, '9 тиз шоу бизнес главная. Супер важное событие, узнай как...', '9-tiz-shou-biznes-glavnaya-super-vazhnoe-sobytie-uznaj-kak', 'items/March2019/BspzxvUslz3ZSezpbNT6.jpg', '0', '2', '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:32:12', '2019-03-17 13:32:12'),
(491, '10 тиз шоу бизнес главная. Супер важное событие, узнай как...', '10-tiz-shou-biznes-glavnaya-super-vazhnoe-sobytie-uznaj-kak', 'items/March2019/5uKKXjuoYUI0qUzkWtrI.jpg', '0', '2', '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:32:19', '2019-03-17 13:32:19'),
(492, '11 тиз шоу бизнес главная. Супер важное событие, узнай как...', '11-tiz-shou-biznes-glavnaya-super-vazhnoe-sobytie-uznaj-kak', 'items/March2019/JS0lfZR7rg7YEEzmpqum.jpg', '0', '2', '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:32:29', '2019-03-17 13:32:29'),
(494, '1 тиз шоу здоровье главная. Эта новость изменила мир, если..', '1-tiz-shou-zdorov-e-glavnaya-eta-novost-izmenila-mir-esli', 'items/March2019/d7z22S6DjxhEpLB2EbD2.jpg', '0', '3', '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:47:28', '2019-03-17 13:47:28'),
(495, '2 тиз шоу здоровье главная. Эта новость изменила мир, если..', '2-tiz-shou-zdorov-e-glavnaya-eta-novost-izmenila-mir-esli', 'items/March2019/hac5IKNWT0TVejOc76i4.jpg', '0', '3', '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:53:57', '2019-03-17 13:53:57'),
(496, '3 тиз шоу здоровье главная. Эта новость изменила мир, если..', '3-tiz-shou-zdorov-e-glavnaya-eta-novost-izmenila-mir-esli', 'items/March2019/E7xemKltqsm7dITtXbNX.jpg', '0', '3', '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:54:03', '2019-03-17 13:54:03'),
(497, '4 тиз шоу здоровье главная. Эта новость изменила мир, если..', '4-tiz-shou-zdorov-e-glavnaya-eta-novost-izmenila-mir-esli', 'items/March2019/bvPFyEddWgsfaufGMtpr.jpg', '0', '3', '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:54:09', '2019-03-17 13:54:09'),
(498, '5 тиз шоу здоровье главная. Эта новость изменила мир, если..', '5-tiz-shou-zdorov-e-glavnaya-eta-novost-izmenila-mir-esli', 'items/March2019/qqF589dqPO4KXhOcxvVz.jpg', '0', '3', '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:54:15', '2019-03-17 13:54:15'),
(499, '6 тиз шоу здоровье главная. Эта новость изменила мир, если..', '6-tiz-shou-zdorov-e-glavnaya-eta-novost-izmenila-mir-esli', 'items/March2019/JBXNL7FwNQtWa1EH0795.jpg', '0', '3', '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:54:21', '2019-03-17 13:54:21'),
(500, '7 тиз шоу здоровье главная. Эта новость изменила мир, если..', '7-tiz-shou-zdorov-e-glavnaya-eta-novost-izmenila-mir-esli', 'items/March2019/CG9FfEXAfxugMisw87bJ.jpg', '0', '3', '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:54:27', '2019-03-17 13:54:27'),
(501, '8 тиз шоу здоровье главная. Эта новость изменила мир, если..', '8-tiz-shou-zdorov-e-glavnaya-eta-novost-izmenila-mir-esli', 'items/March2019/BvNx2yQMxxqpSsXBWi7H.jpg', '0', '3', '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:54:34', '2019-03-17 13:54:34'),
(502, '9 тиз шоу здоровье главная. Эта новость изменила мир, если..', '9-tiz-shou-zdorov-e-glavnaya-eta-novost-izmenila-mir-esli', 'items/March2019/SgOqkHbsjYp1poHdsPuB.jpg', '0', '3', '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:54:40', '2019-03-17 13:54:40'),
(503, '10 тиз шоу здоровье главная. Эта новость изменила мир, если..', '10-tiz-shou-zdorov-e-glavnaya-eta-novost-izmenila-mir-esli', 'items/March2019/Sgxv6bjCj4OEhkyMDcCi.jpg', '0', '3', '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:54:46', '2019-03-17 13:54:46'),
(504, '11 тиз шоу здоровье главная. Эта новость изменила мир, если..', '11-tiz-shou-zdorov-e-glavnaya-eta-novost-izmenila-mir-esli', 'items/March2019/aj7po1SUBdoMzQXjRewn.jpg', '0', '3', '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:54:53', '2019-03-17 13:54:53'),
(505, '1 тиз 2го типа. Эта новость вызвала радость у этого политика..', '1-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/VTmEAwOiYkeDXkbsseYI.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:59:43', '2019-03-17 13:59:43'),
(506, '2 тиз 2го типа. Эта новость вызвала радость у этого политика..', '2-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/iUsxbiUuJqVT29ZPN2TZ.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:00:06', '2019-03-17 14:00:06'),
(507, '3 тиз 2го типа. Эта новость вызвала радость у этого политика.', '3-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/V4cDKcw3JThugC4ZVaej.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:00:00', '2019-03-17 14:00:38'),
(508, '4 тиз 2го типа. Эта новость вызвала радость у этого политика..', '4-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/TiYQTT9WtYYuLwRGuAN4.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:01:03', '2019-03-17 14:01:03'),
(509, '5 тиз 2го типа. Эта новость вызвала радость у этого политика..', '5-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/lkju7x4XFdWnuOlRbgU5.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:01:53', '2019-03-17 14:01:53'),
(510, '6 тиз 2го типа. Эта новость вызвала радость у этого политика..', '6-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/6m3p34wYENGoIQ7SPW8S.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:02:01', '2019-03-17 14:02:01'),
(511, '7 тиз 2го типа. Эта новость вызвала радость у этого политика..', '7-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/fO98j9CqIHEvjgcZZltR.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:02:19', '2019-03-17 14:02:19'),
(512, '8 тиз 2го типа. Эта новость вызвала радость у этого политика..', '8-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/1Kfi9jwVKsuVrrkv3wyK.jpeg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:02:35', '2019-03-17 14:02:35'),
(513, '9 тиз 2го типа. Эта новость вызвала радость у этого политика..', '9-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/wZEywrinVtAFxfopyq0I.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:02:49', '2019-03-17 14:02:49'),
(514, '10 тиз 2го типа. Эта новость вызвала радость у этого политика..', '10-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/JLiaqNgchiDp34kW9s8x.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:03:08', '2019-03-17 14:03:08'),
(515, '11 тиз 2го типа. Эта новость вызвала радость у этого политика..', '11-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/YSVR5hAnMgf22IcfiYoT.jpeg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:03:23', '2019-03-17 14:03:23'),
(516, '12 тиз 2го типа. Эта новость вызвала радость у этого политика..', '12-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/PL0LPgPIJjahDuAmskyH.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:03:37', '2019-03-17 14:03:37'),
(517, '13 тиз 2го типа. Эта новость вызвала радость у этого политика..', '13-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/Tz2F2Fnxw24TTj8tXCTV.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:03:52', '2019-03-17 14:03:52'),
(518, '14 тиз 2го типа. Эта новость вызвала радость у этого политика..', '14-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/tZioqG8xWtCiYfDp6bp5.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:04:11', '2019-03-17 14:04:11'),
(519, '15 тиз 2го типа. Эта новость вызвала радость у этого политика..', '15-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/8tYajBMIS2a0gUXKXcMQ.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:04:24', '2019-03-17 14:04:24'),
(520, '16 тиз 2го типа. Эта новость вызвала радость у этого политика..', '16-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/CMM08Qi1jJMPqpd8wrVa.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:06:52', '2019-03-17 14:06:52'),
(521, '17 тиз 2го типа. Эта новость вызвала радость у этого политика..', '17-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/4owXG8hHR2aGCBFQstt2.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:07:05', '2019-03-17 14:07:05'),
(522, '18 тиз 2го типа. Эта новость вызвала радость у этого политика..', '18-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/aFRHEY4YNPMtaiVS8jzs.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:07:25', '2019-03-17 14:07:25'),
(523, '19 тиз 2го типа. Эта новость вызвала радость у этого политика..', '19-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/O4iYIcdA67YlsILjjdTo.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:07:41', '2019-03-17 14:07:41'),
(524, '20 тиз 2го типа. Эта новость вызвала радость у этого политика..', '20-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/E3VbnjS6hljWVTzcgN5m.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:07:58', '2019-03-17 14:07:58'),
(525, '21 тиз 2го типа. Эта новость вызвала радость у этого политика..', '21-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/wTgbmxJHa5YHL3CDgku9.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:08:13', '2019-03-17 14:08:13'),
(526, '22 тиз 2го типа. Эта новость вызвала радость у этого политика..', '22-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/ClR5d8ebdLDJmww02vEH.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:08:32', '2019-03-17 14:08:32'),
(527, '23 тиз 2го типа. Эта новость вызвала радость у этого политика..', '23-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/h9q6bCoyCYrU95RrAgB8.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:08:47', '2019-03-17 14:08:47'),
(528, '24 тиз 2го типа. Эта новость вызвала радость у этого политика..', '24-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/EenSq5vNzlDRH3qfqafB.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:09:05', '2019-03-17 14:09:05'),
(529, '25 тиз 2го типа. Эта новость вызвала радость у этого политика..', '25-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/U4dmFztWRAflN7zq7NFg.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:09:25', '2019-03-17 14:09:25'),
(530, '26 тиз 2го типа. Эта новость вызвала радость у этого политика..', '26-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/526qa0q4aNUhH1QUlAWp.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:09:40', '2019-03-17 14:09:40'),
(531, '27 тиз 2го типа. Эта новость вызвала радость у этого политика..', '27-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/JwBQno32gdDHaomp4deG.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:10:01', '2019-03-17 14:10:01'),
(532, '28 тиз 2го типа. Эта новость вызвала радость у этого политика..', '28-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/2tKQOTnnWsVfbnpu4v32.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:10:16', '2019-03-17 14:10:16'),
(533, '29 тиз 2го типа. Эта новость вызвала радость у этого политика..', '29-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/OCf4ktPCqIAeAhAFGch8.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:10:30', '2019-03-17 14:10:30'),
(534, '30 тиз 2го типа. Эта новость вызвала радость у этого политика..', '30-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/fgxNmYGPeA2fuFlAFbdx.jpg', '2', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:10:46', '2019-03-17 14:10:46');

-- --------------------------------------------------------

--
-- Table structure for table `keys`
--

CREATE TABLE `keys` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `var` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `keys`
--

INSERT INTO `keys` (`id`, `var`, `created_at`, `updated_at`) VALUES
(1, '23ds-4fdsdfg', '2019-03-19 10:49:58', '2019-03-19 10:49:58');

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `utm` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `links`
--

INSERT INTO `links` (`id`, `title`, `slug`, `option`, `utm`, `created_at`, `updated_at`) VALUES
(1, 'supertest', 'supertest', '1', '?from=asdas', '2019-03-13 14:03:15', '2019-03-13 14:03:15'),
(2, 'dsffds', 'dsffds', '2', '?from=asdas', '2019-03-13 14:05:09', '2019-03-13 14:05:09'),
(3, 'тест3', 'test3', '3', '?from=asdas', '2019-03-13 14:05:20', '2019-03-13 14:05:20'),
(4, 'тест4', 'test4', '4', '?from=asdas', '2019-03-13 14:05:32', '2019-03-13 14:05:32');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2019-03-10 12:43:04', '2019-03-10 12:43:04');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2019-03-10 12:43:04', '2019-03-10 12:43:04', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 4, '2019-03-10 12:43:04', '2019-03-13 13:30:50', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2019-03-10 12:43:04', '2019-03-10 12:43:04', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2019-03-10 12:43:04', '2019-03-10 12:43:04', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 8, '2019-03-10 12:43:04', '2019-03-13 13:30:50', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2019-03-10 12:43:04', '2019-03-13 13:30:50', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2019-03-10 12:43:04', '2019-03-13 13:30:50', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2019-03-10 12:43:04', '2019-03-13 13:30:50', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2019-03-10 12:43:04', '2019-03-13 13:30:50', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 9, '2019-03-10 12:43:04', '2019-03-13 13:30:50', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 7, '2019-03-10 12:43:05', '2019-03-13 13:30:50', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 5, '2019-03-10 12:43:05', '2019-03-13 13:30:50', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 6, '2019-03-10 12:43:05', '2019-03-13 13:30:50', 'voyager.pages.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2019-03-10 12:43:06', '2019-03-13 13:30:50', 'voyager.hooks', NULL),
(15, 1, 'Новости', '', '_self', 'voyager-file-text', NULL, NULL, 10, '2019-03-12 02:22:08', '2019-03-13 13:30:50', 'voyager.items.index', NULL),
(17, 1, 'Ссылки', '/admin/links', '_self', 'voyager-news', '#000000', NULL, 11, '2019-03-13 13:32:58', '2019-03-13 13:32:58', NULL, ''),
(18, 1, 'Ключи', '', '_self', 'voyager-key', NULL, NULL, 12, '2019-03-19 10:49:26', '2019-03-19 10:49:26', 'voyager.keys.index', NULL),
(19, 1, 'Utms', '', '_self', 'voyager-browser', NULL, NULL, 13, '2019-03-19 11:00:28', '2019-03-19 11:00:28', 'voyager.utms.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_01_01_000000_create_pages_table', 1),
(6, '2016_01_01_000000_create_posts_table', 1),
(7, '2016_02_15_204651_create_categories_table', 1),
(8, '2016_05_19_173453_create_menu_table', 1),
(9, '2016_10_21_190000_create_roles_table', 1),
(10, '2016_10_21_190000_create_settings_table', 1),
(11, '2016_11_30_135954_create_permission_table', 1),
(12, '2016_11_30_141208_create_permission_role_table', 1),
(13, '2016_12_26_201236_data_types__add__server_side', 1),
(14, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(15, '2017_01_14_005015_create_translations_table', 1),
(16, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(17, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(18, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
(19, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(20, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(21, '2017_08_05_000000_add_group_to_settings_table', 1),
(22, '2017_11_26_013050_add_user_role_relationship', 1),
(23, '2017_11_26_015000_create_user_roles_table', 1),
(24, '2018_03_11_000000_add_user_settings', 1),
(25, '2018_03_14_000000_add_details_to_data_types_table', 1),
(26, '2018_03_16_000000_make_settings_value_nullable', 1),
(27, '2019_03_10_114139_create_news_table', 1),
(29, '2019_03_10_122444_create_items_table', 2),
(32, '2019_03_13_132327_create_links_table', 3),
(33, '2019_03_19_094130_create_keys_table', 4),
(34, '2019_03_19_105223_create_utms_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` text COLLATE utf8mb4_unicode_ci,
  `body1` text COLLATE utf8mb4_unicode_ci,
  `teaser1` text COLLATE utf8mb4_unicode_ci,
  `body2` text COLLATE utf8mb4_unicode_ci,
  `teaser2` text COLLATE utf8mb4_unicode_ci,
  `body3` text COLLATE utf8mb4_unicode_ci,
  `teaser3` text COLLATE utf8mb4_unicode_ci,
  `area2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area6` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area7` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area8` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area9` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area10` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loader` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2019-03-10 12:43:05', '2019-03-10 12:43:05');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2019-03-10 12:43:04', '2019-03-10 12:43:04'),
(2, 'browse_bread', NULL, '2019-03-10 12:43:04', '2019-03-10 12:43:04'),
(3, 'browse_database', NULL, '2019-03-10 12:43:04', '2019-03-10 12:43:04'),
(4, 'browse_media', NULL, '2019-03-10 12:43:04', '2019-03-10 12:43:04'),
(5, 'browse_compass', NULL, '2019-03-10 12:43:04', '2019-03-10 12:43:04'),
(6, 'browse_menus', 'menus', '2019-03-10 12:43:04', '2019-03-10 12:43:04'),
(7, 'read_menus', 'menus', '2019-03-10 12:43:04', '2019-03-10 12:43:04'),
(8, 'edit_menus', 'menus', '2019-03-10 12:43:04', '2019-03-10 12:43:04'),
(9, 'add_menus', 'menus', '2019-03-10 12:43:04', '2019-03-10 12:43:04'),
(10, 'delete_menus', 'menus', '2019-03-10 12:43:04', '2019-03-10 12:43:04'),
(11, 'browse_roles', 'roles', '2019-03-10 12:43:04', '2019-03-10 12:43:04'),
(12, 'read_roles', 'roles', '2019-03-10 12:43:04', '2019-03-10 12:43:04'),
(13, 'edit_roles', 'roles', '2019-03-10 12:43:04', '2019-03-10 12:43:04'),
(14, 'add_roles', 'roles', '2019-03-10 12:43:04', '2019-03-10 12:43:04'),
(15, 'delete_roles', 'roles', '2019-03-10 12:43:04', '2019-03-10 12:43:04'),
(16, 'browse_users', 'users', '2019-03-10 12:43:04', '2019-03-10 12:43:04'),
(17, 'read_users', 'users', '2019-03-10 12:43:04', '2019-03-10 12:43:04'),
(18, 'edit_users', 'users', '2019-03-10 12:43:04', '2019-03-10 12:43:04'),
(19, 'add_users', 'users', '2019-03-10 12:43:04', '2019-03-10 12:43:04'),
(20, 'delete_users', 'users', '2019-03-10 12:43:04', '2019-03-10 12:43:04'),
(21, 'browse_settings', 'settings', '2019-03-10 12:43:04', '2019-03-10 12:43:04'),
(22, 'read_settings', 'settings', '2019-03-10 12:43:04', '2019-03-10 12:43:04'),
(23, 'edit_settings', 'settings', '2019-03-10 12:43:04', '2019-03-10 12:43:04'),
(24, 'add_settings', 'settings', '2019-03-10 12:43:04', '2019-03-10 12:43:04'),
(25, 'delete_settings', 'settings', '2019-03-10 12:43:04', '2019-03-10 12:43:04'),
(26, 'browse_categories', 'categories', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(27, 'read_categories', 'categories', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(28, 'edit_categories', 'categories', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(29, 'add_categories', 'categories', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(30, 'delete_categories', 'categories', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(31, 'browse_posts', 'posts', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(32, 'read_posts', 'posts', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(33, 'edit_posts', 'posts', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(34, 'add_posts', 'posts', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(35, 'delete_posts', 'posts', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(36, 'browse_pages', 'pages', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(37, 'read_pages', 'pages', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(38, 'edit_pages', 'pages', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(39, 'add_pages', 'pages', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(40, 'delete_pages', 'pages', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(41, 'browse_hooks', NULL, '2019-03-10 12:43:06', '2019-03-10 12:43:06'),
(42, 'browse_items', 'items', '2019-03-12 02:22:07', '2019-03-12 02:22:07'),
(43, 'read_items', 'items', '2019-03-12 02:22:07', '2019-03-12 02:22:07'),
(44, 'edit_items', 'items', '2019-03-12 02:22:07', '2019-03-12 02:22:07'),
(45, 'add_items', 'items', '2019-03-12 02:22:07', '2019-03-12 02:22:07'),
(46, 'delete_items', 'items', '2019-03-12 02:22:07', '2019-03-12 02:22:07'),
(47, 'browse_links', 'links', '2019-03-13 13:27:59', '2019-03-13 13:27:59'),
(48, 'read_links', 'links', '2019-03-13 13:27:59', '2019-03-13 13:27:59'),
(49, 'edit_links', 'links', '2019-03-13 13:27:59', '2019-03-13 13:27:59'),
(50, 'add_links', 'links', '2019-03-13 13:27:59', '2019-03-13 13:27:59'),
(51, 'delete_links', 'links', '2019-03-13 13:27:59', '2019-03-13 13:27:59'),
(52, 'browse_keys', 'keys', '2019-03-19 10:49:26', '2019-03-19 10:49:26'),
(53, 'read_keys', 'keys', '2019-03-19 10:49:26', '2019-03-19 10:49:26'),
(54, 'edit_keys', 'keys', '2019-03-19 10:49:26', '2019-03-19 10:49:26'),
(55, 'add_keys', 'keys', '2019-03-19 10:49:26', '2019-03-19 10:49:26'),
(56, 'delete_keys', 'keys', '2019-03-19 10:49:26', '2019-03-19 10:49:26'),
(57, 'browse_utms', 'utms', '2019-03-19 11:00:27', '2019-03-19 11:00:27'),
(58, 'read_utms', 'utms', '2019-03-19 11:00:27', '2019-03-19 11:00:27'),
(59, 'edit_utms', 'utms', '2019-03-19 11:00:27', '2019-03-19 11:00:27'),
(60, 'add_utms', 'utms', '2019-03-19 11:00:27', '2019-03-19 11:00:27'),
(61, 'delete_utms', 'utms', '2019-03-19 11:00:27', '2019-03-19 11:00:27');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-03-10 12:43:05', '2019-03-10 12:43:05');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2019-03-10 12:43:04', '2019-03-10 12:43:04'),
(2, 'user', 'Normal User', '2019-03-10 12:43:04', '2019-03-10 12:43:04');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2019-03-10 12:43:05', '2019-03-10 12:43:05'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2019-03-10 12:43:05', '2019-03-10 12:43:05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$xRIRfBDCZklcoQFnxEnG2uEgpGIFHoTHBBs.Q1VUlDTygZ3IAXrL6', 'In7Tb8Mb0ex5KCi5SL0aqf83ed6mFtWzoMLUENvByvphReyCOECUx2KDDinN', NULL, '2019-03-10 12:43:05', '2019-03-10 12:43:05');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `utms`
--

CREATE TABLE `utms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `utm` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `utms`
--

INSERT INTO `utms` (`id`, `utm`, `created_at`, `updated_at`) VALUES
(1, 'utm_source', '2019-03-19 11:13:16', '2019-03-19 11:13:16'),
(2, 'utm_tid', '2019-03-19 11:13:16', '2019-03-19 11:13:16'),
(3, 'utm_campaign', '2019-03-19 11:13:16', '2019-03-19 11:13:16'),
(4, 'utm_gid', '2019-03-19 11:13:16', '2019-03-19 11:13:16'),
(5, 'utm_content', '2019-03-19 11:13:16', '2019-03-19 11:13:16'),
(6, 'utm_catid', '2019-03-19 11:13:16', '2019-03-19 11:13:16'),
(7, 'utm_addphrase', '2019-03-19 11:13:16', '2019-03-19 11:13:16'),
(8, 'clickid', '2019-03-19 11:13:16', '2019-03-19 11:13:16'),
(10, 'cost', '2019-03-19 11:13:17', '2019-03-19 11:13:17'),
(11, 'age', '2019-03-19 11:13:17', '2019-03-19 11:13:17'),
(12, 'tid', '2019-03-19 11:13:17', '2019-03-19 11:13:17'),
(13, 'utm_content', '2019-03-19 11:13:17', '2019-03-19 11:13:17'),
(14, 'gender', '2019-03-19 11:13:17', '2019-03-19 11:13:17'),
(15, 'geo', '2019-03-19 11:13:17', '2019-03-19 11:13:17'),
(16, 'impression_hour', '2019-03-19 11:13:17', '2019-03-19 11:13:17'),
(17, 'user_timezone', '2019-03-19 11:13:17', '2019-03-19 11:13:17'),
(18, 'placement', '2019-03-19 11:13:17', '2019-03-19 11:13:17'),
(19, 'campid', '2019-03-19 11:13:17', '2019-03-19 11:13:17'),
(20, 'creative', '2019-03-19 11:13:17', '2019-03-19 11:13:17'),
(21, 'adg', '2019-03-19 11:13:17', '2019-03-19 11:13:17'),
(22, 'utm_source', '2019-03-19 11:13:18', '2019-03-19 11:13:18'),
(23, 'utm_tid', '2019-03-19 11:13:18', '2019-03-19 11:13:18'),
(24, 'utm_campaign', '2019-03-19 11:13:18', '2019-03-19 11:13:18'),
(25, 'utm_gid', '2019-03-19 11:13:18', '2019-03-19 11:13:18'),
(26, 'utm_content', '2019-03-19 11:13:18', '2019-03-19 11:13:18'),
(27, 'utm_catid', '2019-03-19 11:13:18', '2019-03-19 11:13:18'),
(28, 'utm_addphrase', '2019-03-19 11:13:18', '2019-03-19 11:13:18'),
(29, 'clickid', '2019-03-19 11:13:18', '2019-03-19 11:13:18'),
(31, 'cost', '2019-03-19 11:13:18', '2019-03-19 11:13:18'),
(32, 'age', '2019-03-19 11:13:18', '2019-03-19 11:13:18'),
(33, 'tid', '2019-03-19 11:13:18', '2019-03-19 11:13:18'),
(34, 'utm_content', '2019-03-19 11:13:18', '2019-03-19 11:13:18'),
(35, 'gender', '2019-03-19 11:13:18', '2019-03-19 11:13:18'),
(36, 'geo', '2019-03-19 11:13:18', '2019-03-19 11:13:18'),
(37, 'impression_hour', '2019-03-19 11:13:18', '2019-03-19 11:13:18'),
(38, 'user_timezone', '2019-03-19 11:13:18', '2019-03-19 11:13:18'),
(39, 'placement', '2019-03-19 11:13:18', '2019-03-19 11:13:18'),
(40, 'campid', '2019-03-19 11:13:18', '2019-03-19 11:13:18'),
(41, 'creative', '2019-03-19 11:13:18', '2019-03-19 11:13:18'),
(42, 'adg', '2019-03-19 11:13:18', '2019-03-19 11:13:18'),
(43, 'key', '2019-03-19 11:22:44', '2019-03-19 11:22:44'),
(44, 'gid1', '2019-03-19 11:23:01', '2019-03-19 11:23:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- Indexes for table `utms`
--
ALTER TABLE `utms`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=535;

--
-- AUTO_INCREMENT for table `keys`
--
ALTER TABLE `keys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `utms`
--
ALTER TABLE `utms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
