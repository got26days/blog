-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 18, 2019 at 02:24 AM
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
(68, 7, 'area2', 'select_dropdown', 'На главную', 0, 1, 1, 1, 1, 1, '{\"default\":\"0\",\"options\":{\"0\":\"\\u041d\\u0435\\u0442\",\"1\":\"\\u0414\\u0430\"}}', 4),
(69, 7, 'area3', 'select_dropdown', 'Отображение в зоне 3 - 3 крупных новости справа горизонтально', 0, 0, 0, 0, 0, 1, '{\"default\":\"0\",\"options\":{\"0\":\"\\u041d\\u0435\\u0442\",\"1\":\"\\u0414\\u0430\"}}', 22),
(70, 7, 'area4', 'select_dropdown', 'Отображение в зоне 4 - 5 мелких новостей в центре вертикально', 0, 0, 0, 0, 0, 1, '{\"default\":\"0\",\"options\":{\"0\":\"\\u041d\\u0435\\u0442\",\"1\":\"\\u0414\\u0430\"}}', 23),
(71, 7, 'area5', 'select_dropdown', 'Отображение в зоне 5 - 2 крупные новости справа вертикально', 0, 0, 0, 0, 0, 1, '{\"default\":\"0\",\"options\":{\"0\":\"\\u041d\\u0435\\u0442\",\"1\":\"\\u0414\\u0430\"}}', 24),
(72, 7, 'area6', 'select_dropdown', 'Отображение в зоне 6 - 6 крупных новостей горизонтально', 0, 0, 0, 0, 0, 1, '{\"default\":\"0\",\"options\":{\"0\":\"\\u041d\\u0435\\u0442\",\"1\":\"\\u0414\\u0430\"}}', 25),
(73, 7, 'area7', 'select_dropdown', 'Отображение в зоне 7 - 3 мелкие новости вертикально', 0, 0, 0, 0, 0, 1, '{\"default\":\"0\",\"options\":{\"0\":\"\\u041d\\u0435\\u0442\",\"1\":\"\\u0414\\u0430\"}}', 26),
(74, 7, 'area8', 'select_dropdown', 'Отображение в зоне 8 - 3 крупные новости горизонтально', 0, 0, 0, 0, 0, 1, '{\"default\":\"0\",\"options\":{\"0\":\"\\u041d\\u0435\\u0442\",\"1\":\"\\u0414\\u0430\"}}', 27),
(75, 7, 'area9', 'select_dropdown', 'Отобразить на главной', 0, 0, 0, 0, 0, 1, '{\"default\":\"0\",\"options\":{\"0\":\"\\u041d\\u0435\\u0442\",\"1\":\"\\u0414\\u0430\"}}', 7),
(76, 7, 'area10', 'select_dropdown', 'Отобразить в правом меню', 0, 0, 0, 0, 0, 1, '{\"default\":\"0\",\"options\":{\"0\":\"\\u041d\\u0435\\u0442\",\"1\":\"\\u0414\\u0430\"}}', 8),
(77, 7, 'loader', 'select_dropdown', 'Зона догрузки', 0, 0, 0, 0, 0, 1, '{\"default\":\"0\",\"options\":{\"0\":\"\\u041d\\u0435\\u0442\",\"1\":\"\\u0414\\u0430\"}}', 28),
(78, 7, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 33),
(79, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 34),
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
(92, 8, 'utm', 'text', 'Key', 0, 1, 1, 1, 1, 1, '{}', 5),
(93, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(94, 9, 'var', 'text', 'значение', 1, 1, 1, 1, 1, 1, '{}', 2),
(95, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(96, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(97, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(98, 10, 'utm', 'text', 'Utm', 1, 1, 1, 1, 1, 1, '{}', 2),
(99, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(100, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(101, 7, 'market', 'number', 'Показать', 0, 1, 1, 1, 1, 1, '{}', 29),
(102, 7, 'view', 'text', 'Показы', 0, 1, 1, 0, 0, 0, '{}', 30),
(103, 7, 'click', 'text', 'Клики', 0, 1, 1, 0, 0, 0, '{}', 31),
(104, 7, 'result', 'number', 'CTR(%)', 0, 1, 1, 0, 0, 0, '{}', 32);

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
(7, 'items', 'items', 'Новость', 'Новости', 'voyager-file-text', 'App\\Item', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-03-12 02:22:07', '2019-04-18 05:20:42'),
(8, 'links', 'links', 'Link', 'Links', NULL, 'App\\Link', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-03-13 13:27:59', '2019-03-20 13:11:15'),
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
  `updated_at` timestamp NULL DEFAULT NULL,
  `market` int(11) DEFAULT NULL,
  `view` int(11) DEFAULT NULL,
  `click` int(11) DEFAULT NULL,
  `result` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `title`, `slug`, `image`, `link`, `position`, `body1`, `teaser1`, `showt1`, `body2`, `teaser2`, `showt2`, `body3`, `teaser3`, `showt3`, `area2`, `area3`, `area4`, `area5`, `area6`, `area7`, `area8`, `area9`, `area10`, `loader`, `created_at`, `updated_at`, `market`, `view`, `click`, `result`) VALUES
(471, '1 тиз политика главная. Супер важное событие наступило, узнай какое...', '1-tiz-politika-glavnaya-super-vazhnoe-sobytie-nastupilo-uznaj-kakoe', 'items/March2019/3PEoZCdMBdCw9iw2o3ZZ.jpg', '0', '1', '<p><span style=\"color: #333333; font-family: Arial, Helvetica, sans-serif;\"><span style=\"font-size: 13px;\">Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</span></span></p>', NULL, NULL, '<p><span style=\"color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 13px;\">Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</span></p>', NULL, NULL, '<p><span style=\"color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 13px;\">Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</span></p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:17:14', '2019-03-17 13:17:14', NULL, NULL, NULL, NULL),
(472, '2 тиз политика главная. Супер важное событие наступило, узнай какое...', '2-tiz-politika-glavnaya-super-vazhnoe-sobytie-nastupilo-uznaj-kakoe', 'items/March2019/tOsDDNUJzcF0O0nHdfEp.jpeg', '0', '1', '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:17:00', '2019-03-17 13:18:35', NULL, NULL, NULL, NULL),
(473, '3 тиз политика главная. Супер важное событие наступило, узнай какое...', '3-tiz-politika-glavnaya-super-vazhnoe-sobytie-nastupilo-uznaj-kakoe', 'items/March2019/lJp9SaF8x6sitFOdP7Pl.jpg', '0', '1', '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:18:00', '2019-03-17 13:22:40', NULL, NULL, NULL, NULL),
(474, '4 тиз политика главная. Супер важное событие наступило, узнай какое...', '4-tiz-politika-glavnaya-super-vazhnoe-sobytie-nastupilo-uznaj-kakoe', 'items/March2019/usf5r3VoYnxMSNdPoTMf.jpg', '0', '1', '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:18:57', '2019-03-17 13:18:57', NULL, NULL, NULL, NULL),
(475, '5 тиз политика главная. Супер важное событие наступило, узнай какое...', '5-tiz-politika-glavnaya-super-vazhnoe-sobytie-nastupilo-uznaj-kakoe', 'items/March2019/U8zSQdFvlglInN0zLkXs.jpg', '0', '1', '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:21:04', '2019-03-17 13:21:04', NULL, NULL, NULL, NULL),
(476, '6 тиз политика главная. Супер важное событие наступило, узнай какое...', '6-tiz-politika-glavnaya-super-vazhnoe-sobytie-nastupilo-uznaj-kakoe', 'items/March2019/3MOGDGIdamMpBM4sP3fT.jpg', '0', '1', '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:21:15', '2019-03-17 13:21:15', NULL, NULL, NULL, NULL),
(477, '7 тиз политика главная. Супер важное событие наступило, узнай какое...', '7-tiz-politika-glavnaya-super-vazhnoe-sobytie-nastupilo-uznaj-kakoe', 'items/March2019/uv4H4F9NEhrfgueaQAj1.jpg', '0', '1', '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:21:29', '2019-03-17 13:21:29', NULL, NULL, NULL, NULL),
(478, '8 тиз политика главная. Супер важное событие наступило, узнай какое...', '8-tiz-politika-glavnaya-super-vazhnoe-sobytie-nastupilo-uznaj-kakoe', 'items/March2019/KNP67oNTE881XwYZbHuF.jpg', '0', '1', '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:21:41', '2019-03-17 13:21:41', NULL, NULL, NULL, NULL),
(479, '9 тиз политика главная. Супер важное событие наступило, узнай какое...', '9-tiz-politika-glavnaya-super-vazhnoe-sobytie-nastupilo-uznaj-kakoe', 'items/March2019/Pf4PrlxHyX7TQIgCi7It.jpg', '0', '1', '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:21:54', '2019-03-17 13:21:54', NULL, NULL, NULL, NULL),
(480, '10 тиз политика главная. Супер важное событие наступило, узнай какое...', '10-tiz-politika-glavnaya-super-vazhnoe-sobytie-nastupilo-uznaj-kakoe', 'items/March2019/rXqHQWYVFr9evqNAxuEM.jpg', '0', '1', '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:22:05', '2019-03-17 13:22:05', NULL, NULL, NULL, NULL),
(481, '11 тиз политика главная. Супер важное событие наступило, узнай какое...', '11-tiz-politika-glavnaya-super-vazhnoe-sobytie-nastupilo-uznaj-kakoe', 'items/March2019/lJCjEBMKVNpUZUe7LwQd.jpg', '0', '1', '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '<p>Марк Цукерберг - основатель социальной сети Facebook, молодой миллиардер. Как он добился успеха? Какие жизненные принципы помогут вам достичь феноменальных результатов? Для того... ... Марк Цукерберг. История Успеха Facebook. &laquo;Самым главным в бизнесе является концентрация на создание чего-то достаточно важного. Работать над тем, чем бы и самому хотелось пользоваться &ndash; главная задача&raquo;</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:22:17', '2019-03-17 13:22:17', NULL, NULL, NULL, NULL),
(482, '1 тиз шоу бизнес главная. Супер важное событие, узнай как...', '1-tiz-shou-biznes-glavnaya-super-vazhnoe-sobytie-uznaj-kak', 'items/March2019/9Yt6CXRyRS7soiXx8ZuG.jpg', '0', '2', '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:28:45', '2019-03-17 13:28:45', NULL, NULL, NULL, NULL),
(483, '2 тиз шоу бизнес главная. Супер важное событие, узнай как...', '2-tiz-shou-biznes-glavnaya-super-vazhnoe-sobytie-uznaj-kak', 'items/March2019/8CMuQtFmchRVV17kzkkz.jpg', '0', '2', '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:31:03', '2019-03-17 13:31:03', NULL, NULL, NULL, NULL),
(484, '3 тиз шоу бизнес главная. Супер важное событие, узнай как...', '3-tiz-shou-biznes-glavnaya-super-vazhnoe-sobytie-uznaj-kak', 'items/March2019/KdoTIsoM8miLaeuMb6En.jpg', '0', '2', '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:31:13', '2019-03-17 13:31:13', NULL, NULL, NULL, NULL),
(485, '4 тиз шоу бизнес главная. Супер важное событие, узнай как...', '4-tiz-shou-biznes-glavnaya-super-vazhnoe-sobytie-uznaj-kak', 'items/March2019/MDB3Eb3YXQsYo6wIp0ud.jpg', '0', '2', '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:31:23', '2019-03-17 13:31:23', NULL, NULL, NULL, NULL),
(486, '5 тиз шоу бизнес главная. Супер важное событие, узнай как...', '5-tiz-shou-biznes-glavnaya-super-vazhnoe-sobytie-uznaj-kak', 'items/March2019/8Vpx4kthgn17bNK6ljE4.jpg', '0', '2', '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:31:34', '2019-03-17 13:31:34', NULL, NULL, NULL, NULL),
(487, '6 тиз шоу бизнес главная. Супер важное событие, узнай как...', '6-tiz-shou-biznes-glavnaya-super-vazhnoe-sobytie-uznaj-kak', 'items/March2019/TwC6XRj0wKKp2Tpwb1qQ.jpg', '0', '2', '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:31:45', '2019-03-17 13:31:45', NULL, NULL, NULL, NULL),
(488, '7 тиз шоу бизнес главная. Супер важное событие, узнай как...', '7-tiz-shou-biznes-glavnaya-super-vazhnoe-sobytie-uznaj-kak', 'items/March2019/J9eRRkuGC1jXSOuv8QkE.jpg', '0', '2', '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:31:56', '2019-03-17 13:31:56', NULL, NULL, NULL, NULL),
(489, '8 тиз шоу бизнес главная. Супер важное событие, узнай как...', '8-tiz-shou-biznes-glavnaya-super-vazhnoe-sobytie-uznaj-kak', 'items/March2019/M2m6bD2UdhWoGvdHJVxT.jpg', '0', '2', '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:32:03', '2019-03-17 13:32:03', NULL, NULL, NULL, NULL),
(490, '9 тиз шоу бизнес главная. Супер важное событие, узнай как...', '9-tiz-shou-biznes-glavnaya-super-vazhnoe-sobytie-uznaj-kak', 'items/March2019/BspzxvUslz3ZSezpbNT6.jpg', '0', '2', '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:32:12', '2019-03-17 13:32:12', NULL, NULL, NULL, NULL),
(491, '10 тиз шоу бизнес главная. Супер важное событие, узнай как...', '10-tiz-shou-biznes-glavnaya-super-vazhnoe-sobytie-uznaj-kak', 'items/March2019/5uKKXjuoYUI0qUzkWtrI.jpg', '0', '2', '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:32:19', '2019-03-17 13:32:19', NULL, NULL, NULL, NULL),
(492, '11 тиз шоу бизнес главная. Супер важное событие, узнай как...', '11-tiz-shou-biznes-glavnaya-super-vazhnoe-sobytie-uznaj-kak', 'items/March2019/JS0lfZR7rg7YEEzmpqum.jpg', '0', '2', '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '<p>С чего началась история успеха Билла Гейтса. Билл был очень стеснительным, замкнутым, необщительным ребенком. Родители мальчика сильно волновались... ... Мировой истории известно немалое количество успешных, знаменитых и богатых личностей. Но немногие из них внесли свой неотъемлемый вклад в развитие современной науки и техники.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:32:29', '2019-03-17 13:32:29', NULL, NULL, NULL, NULL),
(494, '1 тиз шоу здоровье главная. Эта новость изменила мир, если..', '1-tiz-shou-zdorov-e-glavnaya-eta-novost-izmenila-mir-esli', 'items/March2019/d7z22S6DjxhEpLB2EbD2.jpg', '0', '3', '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:47:28', '2019-03-17 13:47:28', NULL, NULL, NULL, NULL),
(495, '2 тиз шоу здоровье главная. Эта новость изменила мир, если..', '2-tiz-shou-zdorov-e-glavnaya-eta-novost-izmenila-mir-esli', 'items/March2019/hac5IKNWT0TVejOc76i4.jpg', '0', '3', '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:53:57', '2019-03-17 13:53:57', NULL, NULL, NULL, NULL),
(496, '3 тиз шоу здоровье главная. Эта новость изменила мир, если..', '3-tiz-shou-zdorov-e-glavnaya-eta-novost-izmenila-mir-esli', 'items/March2019/E7xemKltqsm7dITtXbNX.jpg', '0', '3', '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:54:03', '2019-03-17 13:54:03', NULL, NULL, NULL, NULL),
(497, '4 тиз шоу здоровье главная. Эта новость изменила мир, если..', '4-tiz-shou-zdorov-e-glavnaya-eta-novost-izmenila-mir-esli', 'items/March2019/bvPFyEddWgsfaufGMtpr.jpg', '0', '3', '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:54:09', '2019-03-17 13:54:09', NULL, NULL, NULL, NULL),
(498, '5 тиз шоу здоровье главная. Эта новость изменила мир, если..', '5-tiz-shou-zdorov-e-glavnaya-eta-novost-izmenila-mir-esli', 'items/March2019/qqF589dqPO4KXhOcxvVz.jpg', '0', '3', '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:54:15', '2019-03-17 13:54:15', NULL, NULL, NULL, NULL),
(499, '6 тиз шоу здоровье главная. Эта новость изменила мир, если..', '6-tiz-shou-zdorov-e-glavnaya-eta-novost-izmenila-mir-esli', 'items/March2019/JBXNL7FwNQtWa1EH0795.jpg', '0', '3', '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:54:21', '2019-03-17 13:54:21', NULL, NULL, NULL, NULL),
(500, '7 тиз шоу здоровье главная. Эта новость изменила мир, если..', '7-tiz-shou-zdorov-e-glavnaya-eta-novost-izmenila-mir-esli', 'items/March2019/CG9FfEXAfxugMisw87bJ.jpg', '0', '3', '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:54:27', '2019-03-17 13:54:27', NULL, NULL, NULL, NULL),
(501, '8 тиз шоу здоровье главная. Эта новость изменила мир, если..', '8-tiz-shou-zdorov-e-glavnaya-eta-novost-izmenila-mir-esli', 'items/March2019/BvNx2yQMxxqpSsXBWi7H.jpg', '0', '3', '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:54:34', '2019-03-17 13:54:34', NULL, NULL, NULL, NULL),
(502, '9 тиз шоу здоровье главная. Эта новость изменила мир, если..', '9-tiz-shou-zdorov-e-glavnaya-eta-novost-izmenila-mir-esli', 'items/March2019/SgOqkHbsjYp1poHdsPuB.jpg', '0', '3', '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:54:40', '2019-03-17 13:54:40', NULL, NULL, NULL, NULL),
(503, '10 тиз шоу здоровье главная. Эта новость изменила мир, если..', '10-tiz-shou-zdorov-e-glavnaya-eta-novost-izmenila-mir-esli', 'items/March2019/Sgxv6bjCj4OEhkyMDcCi.jpg', '0', '3', '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:54:46', '2019-03-17 13:54:46', NULL, NULL, NULL, NULL);
INSERT INTO `items` (`id`, `title`, `slug`, `image`, `link`, `position`, `body1`, `teaser1`, `showt1`, `body2`, `teaser2`, `showt2`, `body3`, `teaser3`, `showt3`, `area2`, `area3`, `area4`, `area5`, `area6`, `area7`, `area8`, `area9`, `area10`, `loader`, `created_at`, `updated_at`, `market`, `view`, `click`, `result`) VALUES
(504, '11 тиз шоу здоровье главная. Эта новость изменила мир, если..', '11-tiz-shou-zdorov-e-glavnaya-eta-novost-izmenila-mir-esli', 'items/March2019/aj7po1SUBdoMzQXjRewn.jpg', '0', '3', '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '<p>История успеха Стива Джобса. Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc. Его считают одной из ключевых фигур в компьютерной индустрии, человеком, который во многом определил ее развитие... ... Стивен Пол Джобс &ndash; американский инженер и предприниматель, основатель и исполнительный директор корпорации Apple Inc.</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:54:53', '2019-03-17 13:54:53', NULL, NULL, NULL, NULL),
(505, '1 тиз 2го типа. Эта новость вызвала радость у этого политика..', '1-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/VTmEAwOiYkeDXkbsseYI.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 13:59:43', '2019-04-18 05:22:39', NULL, 13, NULL, NULL),
(506, '2 тиз 2го типа. Эта новость вызвала радость у этого политика..', '2-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/iUsxbiUuJqVT29ZPN2TZ.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:00:06', '2019-04-18 05:22:39', NULL, 13, NULL, NULL),
(507, '3 тиз 2го типа. Эта новость вызвала радость у этого политика.', '3-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/V4cDKcw3JThugC4ZVaej.jpg', '2', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:00:00', '2019-04-18 05:22:40', NULL, 13, NULL, NULL),
(508, '4 тиз 2го типа. Эта новость вызвала радость у этого политика..', '4-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/TiYQTT9WtYYuLwRGuAN4.jpg', '2', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:01:00', '2019-04-18 05:22:40', NULL, 13, NULL, NULL),
(509, '5 тиз 2го типа. Эта новость вызвала радость у этого политика..', '5-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/lkju7x4XFdWnuOlRbgU5.jpg', '3', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:01:00', '2019-04-18 05:22:40', NULL, 13, NULL, NULL),
(510, '6 тиз 2го типа. Эта новость вызвала радость у этого политика..', '6-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/6m3p34wYENGoIQ7SPW8S.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:02:01', '2019-04-18 05:22:40', NULL, 13, NULL, NULL),
(511, '7 тиз 2го типа. Эта новость вызвала радость у этого политика..', '7-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/fO98j9CqIHEvjgcZZltR.jpg', '2', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:02:00', '2019-04-18 05:22:40', NULL, 13, NULL, NULL),
(512, '8 тиз 2го типа. Эта новость вызвала радость у этого политика..', '8-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/1Kfi9jwVKsuVrrkv3wyK.jpeg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:02:35', '2019-04-18 05:22:39', NULL, 13, NULL, NULL),
(513, '9 тиз 2го типа. Эта новость вызвала радость у этого политика..', '9-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/wZEywrinVtAFxfopyq0I.jpg', '3', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:02:00', '2019-04-18 05:22:39', NULL, 13, NULL, NULL),
(514, '10 тиз 2го типа. Эта новость вызвала радость у этого политика..', '10-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/JLiaqNgchiDp34kW9s8x.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:03:08', '2019-04-18 05:22:39', NULL, 13, NULL, NULL),
(515, '11 тиз 2го типа. Эта новость вызвала радость у этого политика..', '11-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/YSVR5hAnMgf22IcfiYoT.jpeg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:03:23', '2019-04-18 05:22:39', NULL, 13, NULL, NULL),
(516, '12 тиз 2го типа. Эта новость вызвала радость у этого политика..', '12-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/PL0LPgPIJjahDuAmskyH.jpg', '3', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:03:00', '2019-04-18 05:22:39', NULL, 13, NULL, NULL),
(517, '13 тиз 2го типа. Эта новость вызвала радость у этого политика..', '13-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/Tz2F2Fnxw24TTj8tXCTV.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:03:52', '2019-04-18 05:22:39', NULL, 13, NULL, NULL),
(518, '14 тиз 2го типа. Эта новость вызвала радость у этого политика..', '14-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/tZioqG8xWtCiYfDp6bp5.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:04:11', '2019-04-18 05:22:39', NULL, 13, NULL, NULL),
(519, '15 тиз 2го типа. Эта новость вызвала радость у этого политика..', '15-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/8tYajBMIS2a0gUXKXcMQ.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:04:24', '2019-04-18 05:22:39', NULL, 13, NULL, NULL),
(520, '16 тиз 2го типа. Эта новость вызвала радость у этого политика..', '16-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/CMM08Qi1jJMPqpd8wrVa.jpg', '2', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:06:00', '2019-04-18 05:22:39', NULL, 13, NULL, NULL),
(521, '17 тиз 2го типа. Эта новость вызвала радость у этого политика..', '17-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/4owXG8hHR2aGCBFQstt2.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:07:05', '2019-04-18 05:22:39', NULL, 13, NULL, NULL),
(522, '18 тиз 2го типа. Эта новость вызвала радость у этого политика..', '18-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/aFRHEY4YNPMtaiVS8jzs.jpg', '3', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:07:00', '2019-04-18 05:22:39', NULL, 13, NULL, NULL),
(523, '19 тиз 2го типа. Эта новость вызвала радость у этого политика..', '19-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/O4iYIcdA67YlsILjjdTo.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:07:41', '2019-04-18 05:22:39', NULL, 13, NULL, NULL),
(524, '20 тиз 2го типа. Эта новость вызвала радость у этого политика..', '20-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/E3VbnjS6hljWVTzcgN5m.jpg', '3', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:07:00', '2019-04-18 05:22:39', NULL, 13, NULL, NULL),
(525, '21 тиз 2го типа. Эта новость вызвала радость у этого политика..', '21-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/wTgbmxJHa5YHL3CDgku9.jpg', '2', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:08:00', '2019-04-18 05:22:39', NULL, 13, NULL, NULL),
(526, '22 тиз 2го типа. Эта новость вызвала радость у этого политика..', '22-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/ClR5d8ebdLDJmww02vEH.jpg', '2', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:08:00', '2019-04-18 05:22:39', NULL, 13, NULL, NULL),
(527, '23 тиз 2го типа. Эта новость вызвала радость у этого политика..', '23-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/h9q6bCoyCYrU95RrAgB8.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:08:47', '2019-04-18 05:22:39', NULL, 13, NULL, NULL),
(528, '24 тиз 2го типа. Эта новость вызвала радость у этого политика..', '24-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/EenSq5vNzlDRH3qfqafB.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:09:05', '2019-04-18 05:22:39', NULL, 13, NULL, NULL),
(529, '25 тиз 2го типа. Эта новость вызвала радость у этого политика..', '25-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/U4dmFztWRAflN7zq7NFg.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:09:25', '2019-04-18 05:22:39', NULL, 13, NULL, NULL),
(530, '26 тиз 2го типа. Эта новость вызвала радость у этого политика..', '26-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/526qa0q4aNUhH1QUlAWp.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:09:40', '2019-04-18 05:22:39', NULL, 13, NULL, NULL),
(531, '27 тиз 2го типа. Эта новость вызвала радость у этого политика..', '27-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/JwBQno32gdDHaomp4deG.jpg', '3', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:10:00', '2019-04-18 05:22:39', NULL, 13, NULL, NULL),
(532, '28 тиз 2го типа. Эта новость вызвала радость у этого политика..', '28-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/2tKQOTnnWsVfbnpu4v32.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:10:16', '2019-04-18 05:22:39', NULL, 13, NULL, NULL),
(533, '29 тиз 2го типа. Эта новость вызвала радость у этого политика..', '29-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/OCf4ktPCqIAeAhAFGch8.jpg', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:10:30', '2019-04-18 05:22:39', NULL, 13, NULL, NULL),
(534, '30 тиз 2го типа. Эта новость вызвала радость у этого политика..', '30-tiz-2go-tipa-eta-novost-vyzvala-radost-u-etogo-politika', 'items/March2019/fgxNmYGPeA2fuFlAFbdx.jpg', '5', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 14:10:00', '2019-04-18 05:22:39', NULL, 13, NULL, NULL),
(535, 'тиз 1 астрология главная. Невероятное преобразование  начиналось с...', 'tiz-1-astrologiya-glavnaya-neveroyatnoe-preobrazovanie-nachinalos-s', 'items/April2019/2PrYxp0u7Km67XWvaYZ4.jpg', '0', '4', '<p><span style=\"color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 13px;\">Бра́йан Хью Уо́рнер (англ. Brian Hugh Warner), более известный под псевдонимом Мэ́рилин&nbsp;</span><strong style=\"color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 13px;\">Мэ́нсон</strong><span style=\"color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 13px;\">&nbsp;(англ. Marilyn&nbsp;</span><strong style=\"color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 13px;\">Manson</strong><span style=\"color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 13px;\">; род. 5 января 1969, Кантон, Огайо, США) &mdash; американский рок-певец, композитор, актёр, поэт-песенник, художник и бывший музыкальный журналист, основатель и бессменный лидер рок-группы Marilyn&nbsp;</span><strong style=\"color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 13px;\">Manson</strong></p>', NULL, NULL, '<p><span style=\"color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 13px;\">Бра́йан Хью Уо́рнер (англ. Brian Hugh Warner), более известный под псевдонимом Мэ́рилин&nbsp;</span><strong style=\"color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 13px;\">Мэ́нсон</strong><span style=\"color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 13px;\">&nbsp;(англ. Marilyn&nbsp;</span><strong style=\"color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 13px;\">Manson</strong><span style=\"color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 13px;\">; род. 5 января 1969, Кантон, Огайо, США) &mdash; американский рок-певец, композитор, актёр, поэт-песенник, художник и бывший музыкальный журналист, основатель и бессменный лидер рок-группы Marilyn&nbsp;</span><strong style=\"color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 13px;\">Manson</strong></p>', NULL, NULL, '<p><span style=\"color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 13px;\">Бра́йан Хью Уо́рнер (англ. Brian Hugh Warner), более известный под псевдонимом Мэ́рилин&nbsp;</span><strong style=\"color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 13px;\">Мэ́нсон</strong><span style=\"color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 13px;\">&nbsp;(англ. Marilyn&nbsp;</span><strong style=\"color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 13px;\">Manson</strong><span style=\"color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 13px;\">; род. 5 января 1969, Кантон, Огайо, США) &mdash; американский рок-певец, композитор, актёр, поэт-песенник, художник и бывший музыкальный журналист, основатель и бессменный лидер рок-группы Marilyn&nbsp;</span><strong style=\"color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 13px;\">Manson</strong></p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-20 12:58:00', '2019-04-12 12:20:03', NULL, NULL, NULL, NULL),
(536, 'тиз 2 астрология главная. Невероятное преобразование  начиналось с...', 'tiz-2-astrologiya-glavnaya-neveroyatnoe-preobrazovanie-nachinalos-s', 'items/April2019/dC3Dm8UEtpzgNDXjAuUR.jpg', '0', '4', '<p><span style=\"color: #333333; font-family: Arial, Helvetica, sans-serif;\"><span style=\"font-size: 13px;\">Бра́йан Хью Уо́рнер (англ. Brian Hugh Warner), более известный под псевдонимом Мэ́рилин Мэ́нсон (англ. Marilyn Manson; род. 5 января 1969, Кантон, Огайо, США) &mdash; американский рок-певец, композитор, актёр, поэт-песенник, художник и бывший музыкальный журналист, основатель и бессменный лидер рок-группы Marilyn Manson</span></span></p>', NULL, NULL, '<p>Бра́йан Хью Уо́рнер (англ. Brian Hugh Warner), более известный под псевдонимом Мэ́рилин Мэ́нсон (англ. Marilyn Manson; род. 5 января 1969, Кантон, Огайо, США) &mdash; американский рок-певец, композитор, актёр, поэт-песенник, художник и бывший музыкальный журналист, основатель и бессменный лидер рок-группы Marilyn Manson</p>', NULL, NULL, '<p>Бра́йан Хью Уо́рнер (англ. Brian Hugh Warner), более известный под псевдонимом Мэ́рилин Мэ́нсон (англ. Marilyn Manson; род. 5 января 1969, Кантон, Огайо, США) &mdash; американский рок-певец, композитор, актёр, поэт-песенник, художник и бывший музыкальный журналист, основатель и бессменный лидер рок-группы Marilyn Manson</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-12 12:21:09', '2019-04-12 12:21:09', NULL, NULL, NULL, NULL),
(537, 'тиз 3 астрология главная. Невероятное преобразование начиналось с...', 'tiz-3-astrologiya-glavnaya-neveroyatnoe-preobrazovanie-nachinalos-s', 'items/April2019/CiUGhw8nqfIKVf5aBCfL.jpg', '0', '4', '<p>Бра́йан Хью Уо́рнер (англ. Brian Hugh Warner), более известный под псевдонимом Мэ́рилин Мэ́нсон (англ. Marilyn Manson; род. 5 января 1969, Кантон, Огайо, США) &mdash; американский рок-певец, композитор, актёр, поэт-песенник, художник и бывший музыкальный журналист, основатель и бессменный лидер рок-группы Marilyn Manson</p>', NULL, NULL, '<p>Бра́йан Хью Уо́рнер (англ. Brian Hugh Warner), более известный под псевдонимом Мэ́рилин Мэ́нсон (англ. Marilyn Manson; род. 5 января 1969, Кантон, Огайо, США) &mdash; американский рок-певец, композитор, актёр, поэт-песенник, художник и бывший музыкальный журналист, основатель и бессменный лидер рок-группы Marilyn Manson</p>', NULL, NULL, '<p>Бра́йан Хью Уо́рнер (англ. Brian Hugh Warner), более известный под псевдонимом Мэ́рилин Мэ́нсон (англ. Marilyn Manson; род. 5 января 1969, Кантон, Огайо, США) &mdash; американский рок-певец, композитор, актёр, поэт-песенник, художник и бывший музыкальный журналист, основатель и бессменный лидер рок-группы Marilyn Manson</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-12 12:21:00', '2019-04-12 12:22:34', NULL, NULL, NULL, NULL),
(538, 'тиз 4 астрология главная. Невероятное преобразование начиналось с...', 'tiz-4-astrologiya-glavnaya-neveroyatnoe-preobrazovanie-nachinalos-s', 'items/April2019/LLBaDsJe0QUYkolYxR1m.jpg', '0', '4', '<p>Бра́йан Хью Уо́рнер (англ. Brian Hugh Warner), более известный под псевдонимом Мэ́рилин Мэ́нсон (англ. Marilyn Manson; род. 5 января 1969, Кантон, Огайо, США) &mdash; американский рок-певец, композитор, актёр, поэт-песенник, художник и бывший музыкальный журналист, основатель и бессменный лидер рок-группы Marilyn Manson</p>', NULL, NULL, '<p>Бра́йан Хью Уо́рнер (англ. Brian Hugh Warner), более известный под псевдонимом Мэ́рилин Мэ́нсон (англ. Marilyn Manson; род. 5 января 1969, Кантон, Огайо, США) &mdash; американский рок-певец, композитор, актёр, поэт-песенник, художник и бывший музыкальный журналист, основатель и бессменный лидер рок-группы Marilyn Manson</p>', NULL, NULL, '<p>Бра́йан Хью Уо́рнер (англ. Brian Hugh Warner), более известный под псевдонимом Мэ́рилин Мэ́нсон (англ. Marilyn Manson; род. 5 января 1969, Кантон, Огайо, США) &mdash; американский рок-певец, композитор, актёр, поэт-песенник, художник и бывший музыкальный журналист, основатель и бессменный лидер рок-группы Marilyn Manson</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-12 12:23:24', '2019-04-12 12:23:24', NULL, NULL, NULL, NULL),
(539, 'тиз 5 астрология главная. Невероятное преобразование начиналось с...', 'tiz-5-astrologiya-glavnaya-neveroyatnoe-preobrazovanie-nachinalos-s', 'items/April2019/T7m37hFXRX6iktHdieYi.jpg', '0', '4', '<p>Бра́йан Хью Уо́рнер (англ. Brian Hugh Warner), более известный под псевдонимом Мэ́рилин Мэ́нсон (англ. Marilyn Manson; род. 5 января 1969, Кантон, Огайо, США) &mdash; американский рок-певец, композитор, актёр, поэт-песенник, художник и бывший музыкальный журналист, основатель и бессменный лидер рок-группы Marilyn Manson</p>', NULL, NULL, '<p>Бра́йан Хью Уо́рнер (англ. Brian Hugh Warner), более известный под псевдонимом Мэ́рилин Мэ́нсон (англ. Marilyn Manson; род. 5 января 1969, Кантон, Огайо, США) &mdash; американский рок-певец, композитор, актёр, поэт-песенник, художник и бывший музыкальный журналист, основатель и бессменный лидер рок-группы Marilyn Manson</p>', NULL, NULL, '<p>Бра́йан Хью Уо́рнер (англ. Brian Hugh Warner), более известный под псевдонимом Мэ́рилин Мэ́нсон (англ. Marilyn Manson; род. 5 января 1969, Кантон, Огайо, США) &mdash; американский рок-певец, композитор, актёр, поэт-песенник, художник и бывший музыкальный журналист, основатель и бессменный лидер рок-группы Marilyn Manson</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-12 12:24:46', '2019-04-12 12:24:46', NULL, NULL, NULL, NULL),
(540, 'тиз 6 астрология главная. Невероятное преобразование начиналось с...', 'tiz-6-astrologiya-glavnaya-neveroyatnoe-preobrazovanie-nachinalos-s', 'items/April2019/AgVPcYr6usaP4msUzkN1.jpg', '0', '4', '<p>Бра́йан Хью Уо́рнер (англ. Brian Hugh Warner), более известный под псевдонимом Мэ́рилин Мэ́нсон (англ. Marilyn Manson; род. 5 января 1969, Кантон, Огайо, США) &mdash; американский рок-певец, композитор, актёр, поэт-песенник, художник и бывший музыкальный журналист, основатель и бессменный лидер рок-группы Marilyn Manson</p>', NULL, NULL, '<p>Бра́йан Хью Уо́рнер (англ. Brian Hugh Warner), более известный под псевдонимом Мэ́рилин Мэ́нсон (англ. Marilyn Manson; род. 5 января 1969, Кантон, Огайо, США) &mdash; американский рок-певец, композитор, актёр, поэт-песенник, художник и бывший музыкальный журналист, основатель и бессменный лидер рок-группы Marilyn Manson</p>', NULL, NULL, '<p>Бра́йан Хью Уо́рнер (англ. Brian Hugh Warner), более известный под псевдонимом Мэ́рилин Мэ́нсон (англ. Marilyn Manson; род. 5 января 1969, Кантон, Огайо, США) &mdash; американский рок-певец, композитор, актёр, поэт-песенник, художник и бывший музыкальный журналист, основатель и бессменный лидер рок-группы Marilyn Manson</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-12 12:25:01', '2019-04-12 12:25:01', NULL, NULL, NULL, NULL),
(541, 'тиз 7 астрология главная. Невероятное преобразование начиналось с...', 'tiz-7-astrologiya-glavnaya-neveroyatnoe-preobrazovanie-nachinalos-s', 'items/April2019/LjHDadoDN4zvUJYn5Ej1.jpg', '0', '4', '<p>Бра́йан Хью Уо́рнер (англ. Brian Hugh Warner), более известный под псевдонимом Мэ́рилин Мэ́нсон (англ. Marilyn Manson; род. 5 января 1969, Кантон, Огайо, США) &mdash; американский рок-певец, композитор, актёр, поэт-песенник, художник и бывший музыкальный журналист, основатель и бессменный лидер рок-группы Marilyn Manson</p>', NULL, NULL, '<p>Бра́йан Хью Уо́рнер (англ. Brian Hugh Warner), более известный под псевдонимом Мэ́рилин Мэ́нсон (англ. Marilyn Manson; род. 5 января 1969, Кантон, Огайо, США) &mdash; американский рок-певец, композитор, актёр, поэт-песенник, художник и бывший музыкальный журналист, основатель и бессменный лидер рок-группы Marilyn Manson</p>', NULL, NULL, '<p>Бра́йан Хью Уо́рнер (англ. Brian Hugh Warner), более известный под псевдонимом Мэ́рилин Мэ́нсон (англ. Marilyn Manson; род. 5 января 1969, Кантон, Огайо, США) &mdash; американский рок-певец, композитор, актёр, поэт-песенник, художник и бывший музыкальный журналист, основатель и бессменный лидер рок-группы Marilyn Manson</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-12 12:25:16', '2019-04-12 12:25:16', NULL, NULL, NULL, NULL),
(542, 'тиз 8 астрология главная. Невероятное преобразование начиналось с...', 'tiz-8-astrologiya-glavnaya-neveroyatnoe-preobrazovanie-nachinalos-s', 'items/April2019/yvXRNpJUSP3TIpCw439l.jpg', '0', '4', '<p>Бра́йан Хью Уо́рнер (англ. Brian Hugh Warner), более известный под псевдонимом Мэ́рилин Мэ́нсон (англ. Marilyn Manson; род. 5 января 1969, Кантон, Огайо, США) &mdash; американский рок-певец, композитор, актёр, поэт-песенник, художник и бывший музыкальный журналист, основатель и бессменный лидер рок-группы Marilyn Manson</p>', NULL, NULL, '<p>Бра́йан Хью Уо́рнер (англ. Brian Hugh Warner), более известный под псевдонимом Мэ́рилин Мэ́нсон (англ. Marilyn Manson; род. 5 января 1969, Кантон, Огайо, США) &mdash; американский рок-певец, композитор, актёр, поэт-песенник, художник и бывший музыкальный журналист, основатель и бессменный лидер рок-группы Marilyn Manson</p>', NULL, NULL, '<p>Бра́йан Хью Уо́рнер (англ. Brian Hugh Warner), более известный под псевдонимом Мэ́рилин Мэ́нсон (англ. Marilyn Manson; род. 5 января 1969, Кантон, Огайо, США) &mdash; американский рок-певец, композитор, актёр, поэт-песенник, художник и бывший музыкальный журналист, основатель и бессменный лидер рок-группы Marilyn Manson</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-12 12:25:41', '2019-04-12 12:25:41', NULL, NULL, NULL, NULL),
(543, 'тиз 9 астрология главная. Невероятное преобразование начиналось с...', 'tiz-9-astrologiya-glavnaya-neveroyatnoe-preobrazovanie-nachinalos-s', 'items/April2019/1rlyHlfW8NAX5Vr22pbw.jpg', '0', '4', '<p>Бра́йан Хью Уо́рнер (англ. Brian Hugh Warner), более известный под псевдонимом Мэ́рилин Мэ́нсон (англ. Marilyn Manson; род. 5 января 1969, Кантон, Огайо, США) &mdash; американский рок-певец, композитор, актёр, поэт-песенник, художник и бывший музыкальный журналист, основатель и бессменный лидер рок-группы Marilyn Manson</p>', NULL, NULL, '<p>Бра́йан Хью Уо́рнер (англ. Brian Hugh Warner), более известный под псевдонимом Мэ́рилин Мэ́нсон (англ. Marilyn Manson; род. 5 января 1969, Кантон, Огайо, США) &mdash; американский рок-певец, композитор, актёр, поэт-песенник, художник и бывший музыкальный журналист, основатель и бессменный лидер рок-группы Marilyn Manson</p>', NULL, NULL, '<p>Бра́йан Хью Уо́рнер (англ. Brian Hugh Warner), более известный под псевдонимом Мэ́рилин Мэ́нсон (англ. Marilyn Manson; род. 5 января 1969, Кантон, Огайо, США) &mdash; американский рок-певец, композитор, актёр, поэт-песенник, художник и бывший музыкальный журналист, основатель и бессменный лидер рок-группы Marilyn Manson</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-12 12:25:59', '2019-04-12 12:25:59', NULL, NULL, NULL, NULL),
(544, 'тиз 10 астрология главная. Невероятное преобразование начиналось с...', 'tiz-10-astrologiya-glavnaya-neveroyatnoe-preobrazovanie-nachinalos-s', 'items/April2019/RTaVpdxyuwgePOOCMiUS.jpg', '0', '4', '<p>Бра́йан Хью Уо́рнер (англ. Brian Hugh Warner), более известный под псевдонимом Мэ́рилин Мэ́нсон (англ. Marilyn Manson; род. 5 января 1969, Кантон, Огайо, США) &mdash; американский рок-певец, композитор, актёр, поэт-песенник, художник и бывший музыкальный журналист, основатель и бессменный лидер рок-группы Marilyn Manson</p>', NULL, NULL, '<p>Бра́йан Хью Уо́рнер (англ. Brian Hugh Warner), более известный под псевдонимом Мэ́рилин Мэ́нсон (англ. Marilyn Manson; род. 5 января 1969, Кантон, Огайо, США) &mdash; американский рок-певец, композитор, актёр, поэт-песенник, художник и бывший музыкальный журналист, основатель и бессменный лидер рок-группы Marilyn Manson</p>', NULL, NULL, '<p>Бра́йан Хью Уо́рнер (англ. Brian Hugh Warner), более известный под псевдонимом Мэ́рилин Мэ́нсон (англ. Marilyn Manson; род. 5 января 1969, Кантон, Огайо, США) &mdash; американский рок-певец, композитор, актёр, поэт-песенник, художник и бывший музыкальный журналист, основатель и бессменный лидер рок-группы Marilyn Manson</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-12 12:26:13', '2019-04-12 12:26:13', NULL, NULL, NULL, NULL),
(545, 'тиз 11 астрология главная. Невероятное преобразование начиналось с...', 'tiz-11-astrologiya-glavnaya-neveroyatnoe-preobrazovanie-nachinalos-s', 'items/April2019/FKP435ZrDwkGZI7Ltexy.jpg', '0', '4', '<p>Бра́йан Хью Уо́рнер (англ. Brian Hugh Warner), более известный под псевдонимом Мэ́рилин Мэ́нсон (англ. Marilyn Manson; род. 5 января 1969, Кантон, Огайо, США) &mdash; американский рок-певец, композитор, актёр, поэт-песенник, художник и бывший музыкальный журналист, основатель и бессменный лидер рок-группы Marilyn Manson</p>', NULL, NULL, '<p>Бра́йан Хью Уо́рнер (англ. Brian Hugh Warner), более известный под псевдонимом Мэ́рилин Мэ́нсон (англ. Marilyn Manson; род. 5 января 1969, Кантон, Огайо, США) &mdash; американский рок-певец, композитор, актёр, поэт-песенник, художник и бывший музыкальный журналист, основатель и бессменный лидер рок-группы Marilyn Manson</p>', NULL, NULL, '<p>Бра́йан Хью Уо́рнер (англ. Brian Hugh Warner), более известный под псевдонимом Мэ́рилин Мэ́нсон (англ. Marilyn Manson; род. 5 января 1969, Кантон, Огайо, США) &mdash; американский рок-певец, композитор, актёр, поэт-песенник, художник и бывший музыкальный журналист, основатель и бессменный лидер рок-группы Marilyn Manson</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-12 12:26:25', '2019-04-12 12:26:25', NULL, NULL, NULL, NULL),
(546, 'тиз 1  финансы главная. Невероятное преобразование начиналось с...', 'tiz-1-finansy-glavnaya-neveroyatnoe-preobrazovanie-nachinalos-s', 'items/April2019/pC1qxza6FIeOuMvpSTYf.jpg', '0', '0', '<p>Баффет &mdash; невероятно экономный и умеренный в своих потребностях человек. Его экономность определяется ценностью товара. Вот что он говорит по этому поводу ... Вот правило, которое не так уж просто найти в учебниках по инвестированию: Если вы будете инвестировать в индексный фонд мелкими частями на протяжении 10 лет, вы будете в более выгодной ситуации, чем те, кто инвестирует в то же время, но всё за один раз. Согласно Баффету, инвестирование &mdash; это очень просто</p>', NULL, NULL, '<p>Баффет &mdash; невероятно экономный и умеренный в своих потребностях человек. Его экономность определяется ценностью товара. Вот что он говорит по этому поводу ... Вот правило, которое не так уж просто найти в учебниках по инвестированию: Если вы будете инвестировать в индексный фонд мелкими частями на протяжении 10 лет, вы будете в более выгодной ситуации, чем те, кто инвестирует в то же время, но всё за один раз. Согласно Баффету, инвестирование &mdash; это очень просто</p>', NULL, NULL, '<p>Баффет &mdash; невероятно экономный и умеренный в своих потребностях человек. Его экономность определяется ценностью товара. Вот что он говорит по этому поводу ... Вот правило, которое не так уж просто найти в учебниках по инвестированию: Если вы будете инвестировать в индексный фонд мелкими частями на протяжении 10 лет, вы будете в более выгодной ситуации, чем те, кто инвестирует в то же время, но всё за один раз. Согласно Баффету, инвестирование &mdash; это очень просто</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-12 12:40:42', '2019-04-12 12:40:42', NULL, NULL, NULL, NULL),
(547, 'тиз 2 финансы главная. Невероятное преобразование начиналось с...', 'tiz-2-finansy-glavnaya-neveroyatnoe-preobrazovanie-nachinalos-s', 'items/April2019/pWkWawsxzbM7mltx5zCD.JPG', '0', '0', '<p>Баффет &mdash; невероятно экономный и умеренный в своих потребностях человек. Его экономность определяется ценностью товара. Вот что он говорит по этому поводу ... Вот правило, которое не так уж просто найти в учебниках по инвестированию: Если вы будете инвестировать в индексный фонд мелкими частями на протяжении 10 лет, вы будете в более выгодной ситуации, чем те, кто инвестирует в то же время, но всё за один раз. Согласно Баффету, инвестирование &mdash; это очень просто</p>', NULL, NULL, '<p>Баффет &mdash; невероятно экономный и умеренный в своих потребностях человек. Его экономность определяется ценностью товара. Вот что он говорит по этому поводу ... Вот правило, которое не так уж просто найти в учебниках по инвестированию: Если вы будете инвестировать в индексный фонд мелкими частями на протяжении 10 лет, вы будете в более выгодной ситуации, чем те, кто инвестирует в то же время, но всё за один раз. Согласно Баффету, инвестирование &mdash; это очень просто</p>', NULL, NULL, '<p>Баффет &mdash; невероятно экономный и умеренный в своих потребностях человек. Его экономность определяется ценностью товара. Вот что он говорит по этому поводу ... Вот правило, которое не так уж просто найти в учебниках по инвестированию: Если вы будете инвестировать в индексный фонд мелкими частями на протяжении 10 лет, вы будете в более выгодной ситуации, чем те, кто инвестирует в то же время, но всё за один раз. Согласно Баффету, инвестирование &mdash; это очень просто</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-12 12:40:47', '2019-04-12 12:40:47', NULL, NULL, NULL, NULL),
(548, 'тиз 3 финансы главная. Невероятное преобразование начиналось с...', 'tiz-3-finansy-glavnaya-neveroyatnoe-preobrazovanie-nachinalos-s', 'items/April2019/hxeI71pPhGNx2r6jvBHo.jpg', '0', '0', '<p>Баффет &mdash; невероятно экономный и умеренный в своих потребностях человек. Его экономность определяется ценностью товара. Вот что он говорит по этому поводу ... Вот правило, которое не так уж просто найти в учебниках по инвестированию: Если вы будете инвестировать в индексный фонд мелкими частями на протяжении 10 лет, вы будете в более выгодной ситуации, чем те, кто инвестирует в то же время, но всё за один раз. Согласно Баффету, инвестирование &mdash; это очень просто</p>', NULL, NULL, '<p>Баффет &mdash; невероятно экономный и умеренный в своих потребностях человек. Его экономность определяется ценностью товара. Вот что он говорит по этому поводу ... Вот правило, которое не так уж просто найти в учебниках по инвестированию: Если вы будете инвестировать в индексный фонд мелкими частями на протяжении 10 лет, вы будете в более выгодной ситуации, чем те, кто инвестирует в то же время, но всё за один раз. Согласно Баффету, инвестирование &mdash; это очень просто</p>', NULL, NULL, '<p>Баффет &mdash; невероятно экономный и умеренный в своих потребностях человек. Его экономность определяется ценностью товара. Вот что он говорит по этому поводу ... Вот правило, которое не так уж просто найти в учебниках по инвестированию: Если вы будете инвестировать в индексный фонд мелкими частями на протяжении 10 лет, вы будете в более выгодной ситуации, чем те, кто инвестирует в то же время, но всё за один раз. Согласно Баффету, инвестирование &mdash; это очень просто</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-12 12:40:57', '2019-04-12 12:40:57', NULL, NULL, NULL, NULL),
(549, 'тиз 4 финансы главная. Невероятное преобразование начиналось с...', 'tiz-4-finansy-glavnaya-neveroyatnoe-preobrazovanie-nachinalos-s', 'items/April2019/FTDxUHKhyJtQiFzf9Qgw.jpg', '0', '0', '<p>Баффет &mdash; невероятно экономный и умеренный в своих потребностях человек. Его экономность определяется ценностью товара. Вот что он говорит по этому поводу ... Вот правило, которое не так уж просто найти в учебниках по инвестированию: Если вы будете инвестировать в индексный фонд мелкими частями на протяжении 10 лет, вы будете в более выгодной ситуации, чем те, кто инвестирует в то же время, но всё за один раз. Согласно Баффету, инвестирование &mdash; это очень просто</p>', NULL, NULL, '<p>Баффет &mdash; невероятно экономный и умеренный в своих потребностях человек. Его экономность определяется ценностью товара. Вот что он говорит по этому поводу ... Вот правило, которое не так уж просто найти в учебниках по инвестированию: Если вы будете инвестировать в индексный фонд мелкими частями на протяжении 10 лет, вы будете в более выгодной ситуации, чем те, кто инвестирует в то же время, но всё за один раз. Согласно Баффету, инвестирование &mdash; это очень просто</p>', NULL, NULL, '<p>Баффет &mdash; невероятно экономный и умеренный в своих потребностях человек. Его экономность определяется ценностью товара. Вот что он говорит по этому поводу ... Вот правило, которое не так уж просто найти в учебниках по инвестированию: Если вы будете инвестировать в индексный фонд мелкими частями на протяжении 10 лет, вы будете в более выгодной ситуации, чем те, кто инвестирует в то же время, но всё за один раз. Согласно Баффету, инвестирование &mdash; это очень просто</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-12 12:41:02', '2019-04-12 12:41:02', NULL, NULL, NULL, NULL),
(550, 'тиз 5 финансы главная. Невероятное преобразование начиналось с...', 'tiz-5-finansy-glavnaya-neveroyatnoe-preobrazovanie-nachinalos-s', 'items/April2019/ctfbLAYhHgj0eKhn2dgQ.jpg', '0', '0', '<p>Баффет &mdash; невероятно экономный и умеренный в своих потребностях человек. Его экономность определяется ценностью товара. Вот что он говорит по этому поводу ... Вот правило, которое не так уж просто найти в учебниках по инвестированию: Если вы будете инвестировать в индексный фонд мелкими частями на протяжении 10 лет, вы будете в более выгодной ситуации, чем те, кто инвестирует в то же время, но всё за один раз. Согласно Баффету, инвестирование &mdash; это очень просто</p>', NULL, NULL, '<p>Баффет &mdash; невероятно экономный и умеренный в своих потребностях человек. Его экономность определяется ценностью товара. Вот что он говорит по этому поводу ... Вот правило, которое не так уж просто найти в учебниках по инвестированию: Если вы будете инвестировать в индексный фонд мелкими частями на протяжении 10 лет, вы будете в более выгодной ситуации, чем те, кто инвестирует в то же время, но всё за один раз. Согласно Баффету, инвестирование &mdash; это очень просто</p>', NULL, NULL, '<p>Баффет &mdash; невероятно экономный и умеренный в своих потребностях человек. Его экономность определяется ценностью товара. Вот что он говорит по этому поводу ... Вот правило, которое не так уж просто найти в учебниках по инвестированию: Если вы будете инвестировать в индексный фонд мелкими частями на протяжении 10 лет, вы будете в более выгодной ситуации, чем те, кто инвестирует в то же время, но всё за один раз. Согласно Баффету, инвестирование &mdash; это очень просто</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-12 12:41:11', '2019-04-12 12:41:11', NULL, NULL, NULL, NULL),
(551, 'тиз 6 финансы главная. Невероятное преобразование начиналось с...', 'tiz-6-finansy-glavnaya-neveroyatnoe-preobrazovanie-nachinalos-s', 'items/April2019/hxfMcewD4bDzGhzt19u8.jpg', '0', '0', '<p>Баффет &mdash; невероятно экономный и умеренный в своих потребностях человек. Его экономность определяется ценностью товара. Вот что он говорит по этому поводу ... Вот правило, которое не так уж просто найти в учебниках по инвестированию: Если вы будете инвестировать в индексный фонд мелкими частями на протяжении 10 лет, вы будете в более выгодной ситуации, чем те, кто инвестирует в то же время, но всё за один раз. Согласно Баффету, инвестирование &mdash; это очень просто</p>', NULL, NULL, '<p>Баффет &mdash; невероятно экономный и умеренный в своих потребностях человек. Его экономность определяется ценностью товара. Вот что он говорит по этому поводу ... Вот правило, которое не так уж просто найти в учебниках по инвестированию: Если вы будете инвестировать в индексный фонд мелкими частями на протяжении 10 лет, вы будете в более выгодной ситуации, чем те, кто инвестирует в то же время, но всё за один раз. Согласно Баффету, инвестирование &mdash; это очень просто</p>', NULL, NULL, '<p>Баффет &mdash; невероятно экономный и умеренный в своих потребностях человек. Его экономность определяется ценностью товара. Вот что он говорит по этому поводу ... Вот правило, которое не так уж просто найти в учебниках по инвестированию: Если вы будете инвестировать в индексный фонд мелкими частями на протяжении 10 лет, вы будете в более выгодной ситуации, чем те, кто инвестирует в то же время, но всё за один раз. Согласно Баффету, инвестирование &mdash; это очень просто</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-12 12:41:14', '2019-04-12 12:41:14', NULL, NULL, NULL, NULL),
(552, 'тиз 7 финансы главная. Невероятное преобразование начиналось с...', 'tiz-7-finansy-glavnaya-neveroyatnoe-preobrazovanie-nachinalos-s', 'items/April2019/Mp5iipE58EOnaPX3ePUw.jpg', '0', '0', '<p>Баффет &mdash; невероятно экономный и умеренный в своих потребностях человек. Его экономность определяется ценностью товара. Вот что он говорит по этому поводу ... Вот правило, которое не так уж просто найти в учебниках по инвестированию: Если вы будете инвестировать в индексный фонд мелкими частями на протяжении 10 лет, вы будете в более выгодной ситуации, чем те, кто инвестирует в то же время, но всё за один раз. Согласно Баффету, инвестирование &mdash; это очень просто</p>', NULL, NULL, '<p>Баффет &mdash; невероятно экономный и умеренный в своих потребностях человек. Его экономность определяется ценностью товара. Вот что он говорит по этому поводу ... Вот правило, которое не так уж просто найти в учебниках по инвестированию: Если вы будете инвестировать в индексный фонд мелкими частями на протяжении 10 лет, вы будете в более выгодной ситуации, чем те, кто инвестирует в то же время, но всё за один раз. Согласно Баффету, инвестирование &mdash; это очень просто</p>', NULL, NULL, '<p>Баффет &mdash; невероятно экономный и умеренный в своих потребностях человек. Его экономность определяется ценностью товара. Вот что он говорит по этому поводу ... Вот правило, которое не так уж просто найти в учебниках по инвестированию: Если вы будете инвестировать в индексный фонд мелкими частями на протяжении 10 лет, вы будете в более выгодной ситуации, чем те, кто инвестирует в то же время, но всё за один раз. Согласно Баффету, инвестирование &mdash; это очень просто</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-12 12:41:20', '2019-04-12 12:41:20', NULL, NULL, NULL, NULL),
(553, 'тиз 8 финансы главная. Невероятное преобразование начиналось с...', 'tiz-8-finansy-glavnaya-neveroyatnoe-preobrazovanie-nachinalos-s', 'items/April2019/JY54Ucep2kgJCCZXzQ2p.jpg', '0', '0', '<p>Баффет &mdash; невероятно экономный и умеренный в своих потребностях человек. Его экономность определяется ценностью товара. Вот что он говорит по этому поводу ... Вот правило, которое не так уж просто найти в учебниках по инвестированию: Если вы будете инвестировать в индексный фонд мелкими частями на протяжении 10 лет, вы будете в более выгодной ситуации, чем те, кто инвестирует в то же время, но всё за один раз. Согласно Баффету, инвестирование &mdash; это очень просто</p>', NULL, NULL, '<p>Баффет &mdash; невероятно экономный и умеренный в своих потребностях человек. Его экономность определяется ценностью товара. Вот что он говорит по этому поводу ... Вот правило, которое не так уж просто найти в учебниках по инвестированию: Если вы будете инвестировать в индексный фонд мелкими частями на протяжении 10 лет, вы будете в более выгодной ситуации, чем те, кто инвестирует в то же время, но всё за один раз. Согласно Баффету, инвестирование &mdash; это очень просто</p>', NULL, NULL, '<p>Баффет &mdash; невероятно экономный и умеренный в своих потребностях человек. Его экономность определяется ценностью товара. Вот что он говорит по этому поводу ... Вот правило, которое не так уж просто найти в учебниках по инвестированию: Если вы будете инвестировать в индексный фонд мелкими частями на протяжении 10 лет, вы будете в более выгодной ситуации, чем те, кто инвестирует в то же время, но всё за один раз. Согласно Баффету, инвестирование &mdash; это очень просто</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-12 12:41:26', '2019-04-12 12:41:26', NULL, NULL, NULL, NULL),
(554, 'тиз 9 финансы главная. Невероятное преобразование начиналось с...', 'tiz-9-finansy-glavnaya-neveroyatnoe-preobrazovanie-nachinalos-s', 'items/April2019/QHo2FC8EBarHZyQLANME.jpg', '0', '0', '<p>Баффет &mdash; невероятно экономный и умеренный в своих потребностях человек. Его экономность определяется ценностью товара. Вот что он говорит по этому поводу ... Вот правило, которое не так уж просто найти в учебниках по инвестированию: Если вы будете инвестировать в индексный фонд мелкими частями на протяжении 10 лет, вы будете в более выгодной ситуации, чем те, кто инвестирует в то же время, но всё за один раз. Согласно Баффету, инвестирование &mdash; это очень просто</p>', NULL, NULL, '<p>Баффет &mdash; невероятно экономный и умеренный в своих потребностях человек. Его экономность определяется ценностью товара. Вот что он говорит по этому поводу ... Вот правило, которое не так уж просто найти в учебниках по инвестированию: Если вы будете инвестировать в индексный фонд мелкими частями на протяжении 10 лет, вы будете в более выгодной ситуации, чем те, кто инвестирует в то же время, но всё за один раз. Согласно Баффету, инвестирование &mdash; это очень просто</p>', NULL, NULL, '<p>Баффет &mdash; невероятно экономный и умеренный в своих потребностях человек. Его экономность определяется ценностью товара. Вот что он говорит по этому поводу ... Вот правило, которое не так уж просто найти в учебниках по инвестированию: Если вы будете инвестировать в индексный фонд мелкими частями на протяжении 10 лет, вы будете в более выгодной ситуации, чем те, кто инвестирует в то же время, но всё за один раз. Согласно Баффету, инвестирование &mdash; это очень просто</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-12 12:41:36', '2019-04-12 12:41:36', NULL, NULL, NULL, NULL),
(555, 'тиз 10 финансы главная. Невероятное преобразование начиналось с...', 'tiz-10-finansy-glavnaya-neveroyatnoe-preobrazovanie-nachinalos-s', 'items/April2019/HDQv7oc8OqHJs9xAI6Xr.jpg', '0', '0', '<p>Баффет &mdash; невероятно экономный и умеренный в своих потребностях человек. Его экономность определяется ценностью товара. Вот что он говорит по этому поводу ... Вот правило, которое не так уж просто найти в учебниках по инвестированию: Если вы будете инвестировать в индексный фонд мелкими частями на протяжении 10 лет, вы будете в более выгодной ситуации, чем те, кто инвестирует в то же время, но всё за один раз. Согласно Баффету, инвестирование &mdash; это очень просто</p>', NULL, NULL, '<p>Баффет &mdash; невероятно экономный и умеренный в своих потребностях человек. Его экономность определяется ценностью товара. Вот что он говорит по этому поводу ... Вот правило, которое не так уж просто найти в учебниках по инвестированию: Если вы будете инвестировать в индексный фонд мелкими частями на протяжении 10 лет, вы будете в более выгодной ситуации, чем те, кто инвестирует в то же время, но всё за один раз. Согласно Баффету, инвестирование &mdash; это очень просто</p>', NULL, NULL, '<p>Баффет &mdash; невероятно экономный и умеренный в своих потребностях человек. Его экономность определяется ценностью товара. Вот что он говорит по этому поводу ... Вот правило, которое не так уж просто найти в учебниках по инвестированию: Если вы будете инвестировать в индексный фонд мелкими частями на протяжении 10 лет, вы будете в более выгодной ситуации, чем те, кто инвестирует в то же время, но всё за один раз. Согласно Баффету, инвестирование &mdash; это очень просто</p>', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-12 12:41:39', '2019-04-18 05:17:34', NULL, 7, 7, 100),
(556, 'тиз 11 финансы главная. Невероятное преобразование начиналось с...', 'tiz-11-finansy-glavnaya-neveroyatnoe-preobrazovanie-nachinalos-s', 'items/April2019/o7dPejRKEWVjfUGhKKtp.jpg', '0', '0', '<p>Баффет &mdash; невероятно экономный и умеренный в своих потребностях человек. Его экономность определяется ценностью товара. Вот что он говорит по этому поводу ... Вот правило, которое не так уж просто найти в учебниках по инвестированию: Если вы будете инвестировать в индексный фонд мелкими частями на протяжении 10 лет, вы будете в более выгодной ситуации, чем те, кто инвестирует в то же время, но всё за один раз. Согласно Баффету, инвестирование &mdash; это очень просто</p>', NULL, NULL, '<p>Баффет &mdash; невероятно экономный и умеренный в своих потребностях человек. Его экономность определяется ценностью товара. Вот что он говорит по этому поводу ... Вот правило, которое не так уж просто найти в учебниках по инвестированию: Если вы будете инвестировать в индексный фонд мелкими частями на протяжении 10 лет, вы будете в более выгодной ситуации, чем те, кто инвестирует в то же время, но всё за один раз. Согласно Баффету, инвестирование &mdash; это очень просто</p>', NULL, NULL, '<p>Баффет &mdash; невероятно экономный и умеренный в своих потребностях человек. Его экономность определяется ценностью товара. Вот что он говорит по этому поводу ... Вот правило, которое не так уж просто найти в учебниках по инвестированию: Если вы будете инвестировать в индексный фонд мелкими частями на протяжении 10 лет, вы будете в более выгодной ситуации, чем те, кто инвестирует в то же время, но всё за один раз. Согласно Баффету, инвестирование &mdash; это очень просто</p>', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-12 12:41:00', '2019-04-18 05:22:39', 300, 13, 12, 100);

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
(2, 'макдак', 'makdak', '2', 'macd9037', '2019-03-13 14:05:00', '2019-04-12 13:42:33'),
(3, 'девушк турц', 'devushk-turc', '3', 'devushkturc98908', '2019-03-13 14:05:00', '2019-04-12 13:45:50'),
(5, 'мужик с моб', 'muzhik-s-mob', '1', 'muzhik7888', '2019-04-12 11:42:00', '2019-04-12 13:27:47');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=557;

--
-- AUTO_INCREMENT for table `keys`
--
ALTER TABLE `keys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
