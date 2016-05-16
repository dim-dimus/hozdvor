-- phpMyAdmin SQL Dump
-- version 4.4.11
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Май 16 2016 г., 09:53
-- Версия сервера: 10.0.19-MariaDB-cll-lve
-- Версия PHP: 5.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `hozdvor_yupe`
--

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_blog_blog`
--

CREATE TABLE IF NOT EXISTS `yupe_blog_blog` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `description` text,
  `icon` varchar(250) NOT NULL DEFAULT '',
  `slug` varchar(150) NOT NULL,
  `lang` char(2) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '1',
  `create_user_id` int(11) NOT NULL,
  `update_user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `member_status` int(11) NOT NULL DEFAULT '1',
  `post_status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_blog_post`
--

CREATE TABLE IF NOT EXISTS `yupe_blog_post` (
  `id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `create_user_id` int(11) NOT NULL,
  `update_user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `publish_time` int(11) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `lang` char(2) DEFAULT NULL,
  `title` varchar(250) NOT NULL,
  `quote` text,
  `content` text NOT NULL,
  `link` varchar(250) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `comment_status` int(11) NOT NULL DEFAULT '1',
  `create_user_ip` varchar(20) NOT NULL,
  `access_type` int(11) NOT NULL DEFAULT '1',
  `keywords` varchar(250) NOT NULL DEFAULT '',
  `description` varchar(250) NOT NULL DEFAULT '',
  `image` varchar(300) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_blog_post_to_tag`
--

CREATE TABLE IF NOT EXISTS `yupe_blog_post_to_tag` (
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_blog_tag`
--

CREATE TABLE IF NOT EXISTS `yupe_blog_tag` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_blog_user_to_blog`
--

CREATE TABLE IF NOT EXISTS `yupe_blog_user_to_blog` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `role` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '1',
  `note` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_callback`
--

CREATE TABLE IF NOT EXISTS `yupe_callback` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_category_category`
--

CREATE TABLE IF NOT EXISTS `yupe_category_category` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(150) NOT NULL,
  `lang` char(2) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `short_description` text,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_comment_comment`
--

CREATE TABLE IF NOT EXISTS `yupe_comment_comment` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `model` varchar(100) NOT NULL,
  `model_id` int(11) NOT NULL,
  `url` varchar(150) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `text` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(20) DEFAULT NULL,
  `level` int(11) DEFAULT '0',
  `root` int(11) DEFAULT '0',
  `lft` int(11) DEFAULT '0',
  `rgt` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_contentblock_content_block`
--

CREATE TABLE IF NOT EXISTS `yupe_contentblock_content_block` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `code` varchar(100) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  `content` text NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_feedback_feedback`
--

CREATE TABLE IF NOT EXISTS `yupe_feedback_feedback` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `answer_user` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(150) DEFAULT NULL,
  `theme` varchar(250) NOT NULL,
  `text` text NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `answer` text NOT NULL,
  `answer_time` datetime DEFAULT NULL,
  `is_faq` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_gallery_gallery`
--

CREATE TABLE IF NOT EXISTS `yupe_gallery_gallery` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text,
  `status` int(11) NOT NULL DEFAULT '1',
  `owner` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_gallery_image_to_gallery`
--

CREATE TABLE IF NOT EXISTS `yupe_gallery_image_to_gallery` (
  `id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `gallery_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_image_image`
--

CREATE TABLE IF NOT EXISTS `yupe_image_image` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `description` text,
  `file` varchar(250) NOT NULL,
  `create_time` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `alt` varchar(250) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `sort` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_mail_mail_event`
--

CREATE TABLE IF NOT EXISTS `yupe_mail_mail_event` (
  `id` int(11) NOT NULL,
  `code` varchar(150) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_mail_mail_template`
--

CREATE TABLE IF NOT EXISTS `yupe_mail_mail_template` (
  `id` int(11) NOT NULL,
  `code` varchar(150) NOT NULL,
  `event_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` text,
  `from` varchar(150) NOT NULL,
  `to` varchar(150) NOT NULL,
  `theme` text NOT NULL,
  `body` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_menu_menu`
--

CREATE TABLE IF NOT EXISTS `yupe_menu_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `yupe_menu_menu`
--

INSERT INTO `yupe_menu_menu` (`id`, `name`, `code`, `description`, `status`) VALUES
(1, 'Верхнее меню', 'top-menu', 'Основное меню сайта, расположенное сверху в блоке mainmenu.', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_menu_menu_item`
--

CREATE TABLE IF NOT EXISTS `yupe_menu_menu_item` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `regular_link` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(150) NOT NULL,
  `href` varchar(150) NOT NULL,
  `class` varchar(150) NOT NULL,
  `title_attr` varchar(150) NOT NULL,
  `before_link` varchar(150) NOT NULL,
  `after_link` varchar(150) NOT NULL,
  `target` varchar(150) NOT NULL,
  `rel` varchar(150) NOT NULL,
  `condition_name` varchar(150) DEFAULT '0',
  `condition_denial` int(11) DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `yupe_menu_menu_item`
--

INSERT INTO `yupe_menu_menu_item` (`id`, `parent_id`, `menu_id`, `regular_link`, `title`, `href`, `class`, `title_attr`, `before_link`, `after_link`, `target`, `rel`, `condition_name`, `condition_denial`, `sort`, `status`) VALUES
(1, 0, 1, 0, 'Главная', '/', '', 'Главная страница сайта', '', '', '', '', '', 0, 1, 1),
(2, 0, 1, 0, 'Блоги', '/blog/blog/index', '', 'Блоги', '', '', '', '', '', 0, 2, 0),
(3, 2, 1, 0, 'Пользователи', '/user/people/index', '', 'Пользователи', '', '', '', '', '', 0, 3, 0),
(4, 0, 1, 0, 'Wiki', '/wiki/default/index', '', 'Wiki', '', '', '', '', '', 0, 9, 0),
(5, 0, 1, 0, 'Войти', '/user/account/login', 'login-text', 'Войти на сайт', '', '', '', '', 'isAuthenticated', 1, 11, 1),
(6, 0, 1, 0, 'Выйти', '/user/account/logout', 'login-text', 'Выйти', '', '', '', '', 'isAuthenticated', 0, 12, 1),
(7, 0, 1, 0, 'Регистрация', '/user/account/registration', 'login-text', 'Регистрация на сайте', '', '', '', '', 'isAuthenticated', 1, 10, 1),
(8, 0, 1, 0, 'Панель управления', '/yupe/backend/index', 'login-text', 'Панель управления сайтом', '', '', '', '', 'isSuperUser', 0, 13, 1),
(9, 0, 1, 0, 'FAQ', '/feedback/contact/faq', '', 'FAQ', '', '', '', '', '', 0, 7, 0),
(10, 0, 1, 0, 'Контакты', '/feedback/contact/index', '', 'Контакты', '', '', '', '', '', 0, 7, 1),
(11, 0, 1, 0, 'Магазин', '/store/product/index', '', 'Магазин', '', '', '', '', '', 0, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_migrations`
--

CREATE TABLE IF NOT EXISTS `yupe_migrations` (
  `id` int(11) NOT NULL,
  `module` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `yupe_migrations`
--

INSERT INTO `yupe_migrations` (`id`, `module`, `version`, `apply_time`) VALUES
(1, 'user', 'm000000_000000_user_base', 1459324576),
(2, 'user', 'm131019_212911_user_tokens', 1459324576),
(3, 'user', 'm131025_152911_clean_user_table', 1459324577),
(4, 'user', 'm131026_002234_prepare_hash_user_password', 1459324577),
(5, 'user', 'm131106_111552_user_restore_fields', 1459324577),
(6, 'user', 'm131121_190850_modify_tokes_table', 1459324577),
(7, 'user', 'm140812_100348_add_expire_to_token_table', 1459324577),
(8, 'user', 'm150416_113652_rename_fields', 1459324577),
(9, 'user', 'm151006_000000_user_add_phone', 1459324577),
(10, 'yupe', 'm000000_000000_yupe_base', 1459324577),
(11, 'yupe', 'm130527_154455_yupe_change_unique_index', 1459324579),
(12, 'yupe', 'm150416_125517_rename_fields', 1459324579),
(13, 'category', 'm000000_000000_category_base', 1459324579),
(14, 'category', 'm150415_150436_rename_fields', 1459324579),
(15, 'mail', 'm000000_000000_mail_base', 1459324579),
(16, 'store', 'm140812_160000_store_attribute_group_base', 1459324579),
(17, 'store', 'm140812_170000_store_attribute_base', 1459324579),
(18, 'store', 'm140812_180000_store_attribute_option_base', 1459324579),
(19, 'store', 'm140813_200000_store_category_base', 1459324579),
(20, 'store', 'm140813_210000_store_type_base', 1459324579),
(21, 'store', 'm140813_220000_store_type_attribute_base', 1459324579),
(22, 'store', 'm140813_230000_store_producer_base', 1459324579),
(23, 'store', 'm140814_000000_store_product_base', 1459324579),
(24, 'store', 'm140814_000010_store_product_category_base', 1459324579),
(25, 'store', 'm140814_000013_store_product_attribute_eav_base', 1459324579),
(26, 'store', 'm140814_000018_store_product_image_base', 1459324579),
(27, 'store', 'm140814_000020_store_product_variant_base', 1459324579),
(28, 'store', 'm141014_210000_store_product_category_column', 1459324580),
(29, 'store', 'm141015_170000_store_product_image_column', 1459324580),
(30, 'store', 'm141218_091834_default_null', 1459324580),
(31, 'store', 'm150210_063409_add_store_menu_item', 1459324580),
(32, 'store', 'm150210_105811_add_price_column', 1459324580),
(33, 'store', 'm150210_131238_order_category', 1459324580),
(34, 'store', 'm150211_105453_add_position_for_product_variant', 1459324580),
(35, 'store', 'm150226_065935_add_product_position', 1459324580),
(36, 'store', 'm150416_112008_rename_fields', 1459324580),
(37, 'store', 'm150417_180000_store_product_link_base', 1459324580),
(38, 'store', 'm150825_184407_change_store_url', 1459324580),
(39, 'store', 'm150907_084604_new_attributes', 1459324580),
(40, 'store', 'm151218_081635_add_external_id_fields', 1459324580),
(41, 'store', 'm151218_082939_add_external_id_ix', 1459324580),
(42, 'store', 'm151218_142113_add_product_index', 1459324580),
(43, 'store', 'm151223_140722_drop_product_type_categories', 1459324580),
(44, 'image', 'm000000_000000_image_base', 1459324580),
(45, 'image', 'm150226_121100_image_order', 1459324580),
(46, 'image', 'm150416_080008_rename_fields', 1459324580),
(47, 'payment', 'm140815_170000_store_payment_base', 1459324580),
(48, 'comment', 'm000000_000000_comment_base', 1459324585),
(49, 'comment', 'm130704_095200_comment_nestedsets', 1459324585),
(50, 'comment', 'm150415_151804_rename_fields', 1459324585),
(51, 'blog', 'm000000_000000_blog_base', 1459324585),
(52, 'blog', 'm130503_091124_BlogPostImage', 1459324585),
(53, 'blog', 'm130529_151602_add_post_category', 1459324586),
(54, 'blog', 'm140226_052326_add_community_fields', 1459324586),
(55, 'blog', 'm140714_110238_blog_post_quote_type', 1459324586),
(56, 'blog', 'm150406_094809_blog_post_quote_type', 1459324586),
(57, 'blog', 'm150414_180119_rename_date_fields', 1459324586),
(58, 'delivery', 'm140815_190000_store_delivery_base', 1459324586),
(59, 'delivery', 'm140815_200000_store_delivery_payment_base', 1459324586),
(60, 'order', 'm140814_200000_store_order_base', 1459324586),
(61, 'order', 'm150324_105949_order_status_table', 1459324586),
(62, 'order', 'm150416_100212_rename_fields', 1459324586),
(63, 'order', 'm150514_065554_change_order_price', 1459324586),
(64, 'order', 'm151209_185124_split_address', 1459324586),
(65, 'order', 'm151211_115447_add_appartment_field', 1459324586),
(66, 'coupon', 'm140816_200000_store_coupon_base', 1459324587),
(67, 'coupon', 'm150414_124659_add_order_coupon_table', 1459324587),
(68, 'coupon', 'm150415_153218_rename_fields', 1459324587),
(69, 'page', 'm000000_000000_page_base', 1459324590),
(70, 'page', 'm130115_155600_columns_rename', 1459324590),
(71, 'page', 'm140115_083618_add_layout', 1459324590),
(72, 'page', 'm140620_072543_add_view', 1459324590),
(73, 'page', 'm150312_151049_change_body_type', 1459324590),
(74, 'page', 'm150416_101038_rename_fields', 1459324590),
(75, 'news', 'm000000_000000_news_base', 1459324591),
(76, 'news', 'm150416_081251_rename_fields', 1459324591),
(77, 'rbac', 'm140115_131455_auth_item', 1459324592),
(78, 'rbac', 'm140115_132045_auth_item_child', 1459324592),
(79, 'rbac', 'm140115_132319_auth_item_assign', 1459324592),
(80, 'rbac', 'm140702_230000_initial_role_data', 1459324592),
(81, 'gallery', 'm000000_000000_gallery_base', 1459324592),
(82, 'gallery', 'm130427_120500_gallery_creation_user', 1459324592),
(83, 'gallery', 'm150416_074146_rename_fields', 1459324592),
(84, 'queue', 'm000000_000000_queue_base', 1459324594),
(85, 'queue', 'm131007_031000_queue_fix_index', 1459324594),
(86, 'notify', 'm141031_091039_add_notify_table', 1459324595),
(87, 'feedback', 'm000000_000000_feedback_base', 1459324595),
(88, 'feedback', 'm150415_184108_rename_fields', 1459324595),
(89, 'sitemap', 'm141004_130000_sitemap_page', 1459324597),
(90, 'sitemap', 'm141004_140000_sitemap_page_data', 1459324597),
(91, 'social', 'm000000_000000_social_profile', 1459324597),
(92, 'callback', 'm150926_083350_callback_base', 1459324598),
(93, 'contentblock', 'm000000_000000_contentblock_base', 1459324598),
(94, 'contentblock', 'm140715_130737_add_category_id', 1459324598),
(95, 'contentblock', 'm150127_130425_add_status_column', 1459324598),
(96, 'menu', 'm000000_000000_menu_base', 1459324598),
(97, 'menu', 'm121220_001126_menu_test_data', 1459324598);

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_news_news`
--

CREATE TABLE IF NOT EXISTS `yupe_news_news` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `lang` char(2) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `date` date NOT NULL,
  `title` varchar(250) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `short_text` text,
  `full_text` text NOT NULL,
  `image` varchar(300) DEFAULT NULL,
  `link` varchar(300) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `is_protected` tinyint(1) NOT NULL DEFAULT '0',
  `keywords` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_notify_settings`
--

CREATE TABLE IF NOT EXISTS `yupe_notify_settings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `my_post` tinyint(1) NOT NULL DEFAULT '1',
  `my_comment` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_page_page`
--

CREATE TABLE IF NOT EXISTS `yupe_page_page` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `lang` char(2) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `change_user_id` int(11) DEFAULT NULL,
  `title_short` varchar(150) NOT NULL,
  `title` varchar(250) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `body` mediumtext NOT NULL,
  `keywords` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL,
  `status` int(11) NOT NULL,
  `is_protected` tinyint(1) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `layout` varchar(250) DEFAULT NULL,
  `view` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_queue_queue`
--

CREATE TABLE IF NOT EXISTS `yupe_queue_queue` (
  `id` int(11) NOT NULL,
  `worker` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `task` text NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `complete_time` datetime DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '0',
  `notice` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_sitemap_page`
--

CREATE TABLE IF NOT EXISTS `yupe_sitemap_page` (
  `id` int(11) NOT NULL,
  `url` varchar(250) NOT NULL,
  `changefreq` varchar(20) NOT NULL,
  `priority` float NOT NULL DEFAULT '0.5',
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `yupe_sitemap_page`
--

INSERT INTO `yupe_sitemap_page` (`id`, `url`, `changefreq`, `priority`, `status`) VALUES
(1, '/', 'daily', 0.5, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_social_user`
--

CREATE TABLE IF NOT EXISTS `yupe_social_user` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `provider` varchar(250) NOT NULL,
  `uid` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_store_attribute`
--

CREATE TABLE IF NOT EXISTS `yupe_store_attribute` (
  `id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `unit` varchar(30) DEFAULT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_store_attribute_group`
--

CREATE TABLE IF NOT EXISTS `yupe_store_attribute_group` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_store_attribute_option`
--

CREATE TABLE IF NOT EXISTS `yupe_store_attribute_option` (
  `id` int(11) NOT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `position` tinyint(4) DEFAULT NULL,
  `value` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_store_category`
--

CREATE TABLE IF NOT EXISTS `yupe_store_category` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(150) NOT NULL,
  `name` varchar(250) NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `short_description` text,
  `description` text,
  `meta_title` varchar(250) DEFAULT NULL,
  `meta_description` varchar(250) DEFAULT NULL,
  `meta_keywords` varchar(250) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort` int(11) NOT NULL DEFAULT '1',
  `external_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_store_coupon`
--

CREATE TABLE IF NOT EXISTS `yupe_store_coupon` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `code` varchar(255) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `value` decimal(10,2) NOT NULL DEFAULT '0.00',
  `min_order_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `registered_user` tinyint(4) NOT NULL DEFAULT '0',
  `free_shipping` tinyint(4) NOT NULL DEFAULT '0',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `quantity_per_user` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_store_delivery`
--

CREATE TABLE IF NOT EXISTS `yupe_store_delivery` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `price` float(10,2) NOT NULL DEFAULT '0.00',
  `free_from` float(10,2) DEFAULT NULL,
  `available_from` float(10,2) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '1',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `separate_payment` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_store_delivery_payment`
--

CREATE TABLE IF NOT EXISTS `yupe_store_delivery_payment` (
  `delivery_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_store_order`
--

CREATE TABLE IF NOT EXISTS `yupe_store_order` (
  `id` int(11) NOT NULL,
  `delivery_id` int(11) DEFAULT NULL,
  `delivery_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payment_method_id` int(11) DEFAULT NULL,
  `paid` tinyint(4) DEFAULT '0',
  `payment_time` datetime DEFAULT NULL,
  `payment_details` text,
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `coupon_discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `separate_delivery` tinyint(4) DEFAULT '0',
  `status_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `comment` varchar(1024) NOT NULL DEFAULT '',
  `ip` varchar(15) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `note` varchar(1024) NOT NULL DEFAULT '',
  `modified` datetime DEFAULT NULL,
  `zipcode` varchar(30) DEFAULT NULL,
  `country` varchar(150) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `house` varchar(50) DEFAULT NULL,
  `apartment` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_store_order_coupon`
--

CREATE TABLE IF NOT EXISTS `yupe_store_order_coupon` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_store_order_product`
--

CREATE TABLE IF NOT EXISTS `yupe_store_order_product` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `variants` text,
  `variants_text` varchar(1024) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `sku` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_store_order_status`
--

CREATE TABLE IF NOT EXISTS `yupe_store_order_status` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_system` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `yupe_store_order_status`
--

INSERT INTO `yupe_store_order_status` (`id`, `name`, `is_system`) VALUES
(1, 'Новый', 1),
(2, 'Принят', 1),
(3, 'Выполнен', 1),
(4, 'Удален', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_store_payment`
--

CREATE TABLE IF NOT EXISTS `yupe_store_payment` (
  `id` int(11) NOT NULL,
  `module` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `settings` text,
  `currency_id` int(11) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '1',
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_store_producer`
--

CREATE TABLE IF NOT EXISTS `yupe_store_producer` (
  `id` int(11) NOT NULL,
  `name_short` varchar(150) NOT NULL,
  `name` varchar(250) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `short_description` text,
  `description` text,
  `meta_title` varchar(250) DEFAULT NULL,
  `meta_keywords` varchar(250) DEFAULT NULL,
  `meta_description` varchar(250) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_store_product`
--

CREATE TABLE IF NOT EXISTS `yupe_store_product` (
  `id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `producer_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sku` varchar(100) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `price` decimal(19,3) NOT NULL DEFAULT '0.000',
  `discount_price` decimal(19,3) DEFAULT NULL,
  `discount` decimal(19,3) DEFAULT NULL,
  `description` text,
  `short_description` text,
  `data` text,
  `is_special` tinyint(1) NOT NULL DEFAULT '0',
  `length` decimal(19,3) DEFAULT NULL,
  `width` decimal(19,3) DEFAULT NULL,
  `height` decimal(19,3) DEFAULT NULL,
  `weight` decimal(19,3) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `in_stock` tinyint(4) NOT NULL DEFAULT '1',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `meta_title` varchar(250) DEFAULT NULL,
  `meta_keywords` varchar(250) DEFAULT NULL,
  `meta_description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `average_price` decimal(19,3) DEFAULT NULL,
  `purchase_price` decimal(19,3) DEFAULT NULL,
  `recommended_price` decimal(19,3) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '1',
  `external_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_store_product_attribute_value`
--

CREATE TABLE IF NOT EXISTS `yupe_store_product_attribute_value` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `number_value` double DEFAULT NULL,
  `string_value` varchar(250) DEFAULT NULL,
  `text_value` text,
  `option_value` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_store_product_category`
--

CREATE TABLE IF NOT EXISTS `yupe_store_product_category` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_store_product_image`
--

CREATE TABLE IF NOT EXISTS `yupe_store_product_image` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `title` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_store_product_link`
--

CREATE TABLE IF NOT EXISTS `yupe_store_product_link` (
  `id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `linked_product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_store_product_link_type`
--

CREATE TABLE IF NOT EXISTS `yupe_store_product_link_type` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `yupe_store_product_link_type`
--

INSERT INTO `yupe_store_product_link_type` (`id`, `code`, `title`) VALUES
(1, 'similar', 'Похожие'),
(2, 'related', 'Сопутствующие');

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_store_product_variant`
--

CREATE TABLE IF NOT EXISTS `yupe_store_product_variant` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `attribute_value` varchar(255) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `type` tinyint(4) NOT NULL,
  `sku` varchar(50) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_store_type`
--

CREATE TABLE IF NOT EXISTS `yupe_store_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_store_type_attribute`
--

CREATE TABLE IF NOT EXISTS `yupe_store_type_attribute` (
  `type_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_user_tokens`
--

CREATE TABLE IF NOT EXISTS `yupe_user_tokens` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `expire_time` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `yupe_user_tokens`
--

INSERT INTO `yupe_user_tokens` (`id`, `user_id`, `token`, `type`, `status`, `create_time`, `update_time`, `ip`, `expire_time`) VALUES
(1, 1, 'fvw3Js4wf1~tarb4Yr4iUTTvd9keQWHN', 4, 0, '2016-04-15 16:35:50', '2016-04-15 16:35:50', '178.165.103.91', '2016-04-22 16:35:50');

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_user_user`
--

CREATE TABLE IF NOT EXISTS `yupe_user_user` (
  `id` int(11) NOT NULL,
  `update_time` datetime NOT NULL,
  `first_name` varchar(250) DEFAULT NULL,
  `middle_name` varchar(250) DEFAULT NULL,
  `last_name` varchar(250) DEFAULT NULL,
  `nick_name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `gender` tinyint(1) NOT NULL DEFAULT '0',
  `birth_date` date DEFAULT NULL,
  `site` varchar(250) NOT NULL DEFAULT '',
  `about` varchar(250) NOT NULL DEFAULT '',
  `location` varchar(250) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '2',
  `access_level` int(11) NOT NULL DEFAULT '0',
  `visit_time` datetime DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `avatar` varchar(150) DEFAULT NULL,
  `hash` varchar(255) NOT NULL DEFAULT 'c1430f908b479718845b33dc37c243480.02252600 1459324577',
  `email_confirm` tinyint(1) NOT NULL DEFAULT '0',
  `phone` char(30) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `yupe_user_user`
--

INSERT INTO `yupe_user_user` (`id`, `update_time`, `first_name`, `middle_name`, `last_name`, `nick_name`, `email`, `gender`, `birth_date`, `site`, `about`, `location`, `status`, `access_level`, `visit_time`, `create_time`, `avatar`, `hash`, `email_confirm`, `phone`) VALUES
(1, '2016-03-30 10:57:44', '', '', '', 'first_admin', 'dmitryod@mail.ru', 0, NULL, '', '', '', 1, 1, '2016-04-15 16:35:50', '2016-03-30 10:57:44', NULL, '$2y$13$WdUo2Cd2LVsjQe3UZcQzY.BNRQxapA79GzjvzxVzpOLodlo6CzStK', 1, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_user_user_auth_assignment`
--

CREATE TABLE IF NOT EXISTS `yupe_user_user_auth_assignment` (
  `itemname` char(64) NOT NULL,
  `userid` int(11) NOT NULL,
  `bizrule` text,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `yupe_user_user_auth_assignment`
--

INSERT INTO `yupe_user_user_auth_assignment` (`itemname`, `userid`, `bizrule`, `data`) VALUES
('admin', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_user_user_auth_item`
--

CREATE TABLE IF NOT EXISTS `yupe_user_user_auth_item` (
  `name` char(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `yupe_user_user_auth_item`
--

INSERT INTO `yupe_user_user_auth_item` (`name`, `type`, `description`, `bizrule`, `data`) VALUES
('admin', 2, 'Администратор', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_user_user_auth_item_child`
--

CREATE TABLE IF NOT EXISTS `yupe_user_user_auth_item_child` (
  `parent` char(64) NOT NULL,
  `child` char(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `yupe_yupe_settings`
--

CREATE TABLE IF NOT EXISTS `yupe_yupe_settings` (
  `id` int(11) NOT NULL,
  `module_id` varchar(100) NOT NULL,
  `param_name` varchar(100) NOT NULL,
  `param_value` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `yupe_yupe_settings`
--

INSERT INTO `yupe_yupe_settings` (`id`, `module_id`, `param_name`, `param_value`, `create_time`, `update_time`, `user_id`, `type`) VALUES
(1, 'yupe', 'siteDescription', 'Магазин хозтоваров', '2016-03-30 10:58:47', '2016-03-30 10:58:47', 1, 1),
(2, 'yupe', 'siteName', 'Hozdvor.org', '2016-03-30 10:58:47', '2016-03-30 10:58:47', 1, 1),
(3, 'yupe', 'siteKeyWords', 'hozdvor.org\r\nhozdvor', '2016-03-30 10:58:47', '2016-03-30 10:58:47', 1, 1),
(4, 'yupe', 'email', 'dmitryod@mail.ru', '2016-03-30 10:58:47', '2016-03-30 10:58:47', 1, 1),
(5, 'yupe', 'theme', 'default', '2016-03-30 10:58:47', '2016-03-30 10:58:47', 1, 1),
(6, 'yupe', 'backendTheme', '', '2016-03-30 10:58:47', '2016-03-30 10:58:47', 1, 1),
(7, 'yupe', 'defaultLanguage', 'ru', '2016-03-30 10:58:47', '2016-03-30 10:58:47', 1, 1),
(8, 'yupe', 'defaultBackendLanguage', 'ru', '2016-03-30 10:58:47', '2016-03-30 10:58:47', 1, 1),
(9, 'homepage', 'mode', '3', '2016-03-30 10:59:37', '2016-03-30 10:59:37', 1, 1),
(10, 'homepage', 'target', '', '2016-03-30 10:59:37', '2016-03-30 10:59:37', 1, 1),
(11, 'homepage', 'limit', '', '2016-03-30 10:59:37', '2016-03-30 10:59:37', 1, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `yupe_blog_blog`
--
ALTER TABLE `yupe_blog_blog`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ux_yupe_blog_blog_slug_lang` (`slug`,`lang`),
  ADD KEY `ix_yupe_blog_blog_create_user` (`create_user_id`),
  ADD KEY `ix_yupe_blog_blog_update_user` (`update_user_id`),
  ADD KEY `ix_yupe_blog_blog_status` (`status`),
  ADD KEY `ix_yupe_blog_blog_type` (`type`),
  ADD KEY `ix_yupe_blog_blog_create_date` (`create_time`),
  ADD KEY `ix_yupe_blog_blog_update_date` (`update_time`),
  ADD KEY `ix_yupe_blog_blog_lang` (`lang`),
  ADD KEY `ix_yupe_blog_blog_slug` (`slug`),
  ADD KEY `ix_yupe_blog_blog_category_id` (`category_id`);

--
-- Индексы таблицы `yupe_blog_post`
--
ALTER TABLE `yupe_blog_post`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ux_yupe_blog_post_lang_slug` (`slug`,`lang`),
  ADD KEY `ix_yupe_blog_post_blog_id` (`blog_id`),
  ADD KEY `ix_yupe_blog_post_create_user_id` (`create_user_id`),
  ADD KEY `ix_yupe_blog_post_update_user_id` (`update_user_id`),
  ADD KEY `ix_yupe_blog_post_status` (`status`),
  ADD KEY `ix_yupe_blog_post_access_type` (`access_type`),
  ADD KEY `ix_yupe_blog_post_comment_status` (`comment_status`),
  ADD KEY `ix_yupe_blog_post_lang` (`lang`),
  ADD KEY `ix_yupe_blog_post_slug` (`slug`),
  ADD KEY `ix_yupe_blog_post_publish_date` (`publish_time`),
  ADD KEY `ix_yupe_blog_post_category_id` (`category_id`);

--
-- Индексы таблицы `yupe_blog_post_to_tag`
--
ALTER TABLE `yupe_blog_post_to_tag`
  ADD PRIMARY KEY (`post_id`,`tag_id`),
  ADD KEY `ix_yupe_blog_post_to_tag_post_id` (`post_id`),
  ADD KEY `ix_yupe_blog_post_to_tag_tag_id` (`tag_id`);

--
-- Индексы таблицы `yupe_blog_tag`
--
ALTER TABLE `yupe_blog_tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ux_yupe_blog_tag_tag_name` (`name`);

--
-- Индексы таблицы `yupe_blog_user_to_blog`
--
ALTER TABLE `yupe_blog_user_to_blog`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ux_yupe_blog_user_to_blog_blog_user_to_blog_u_b` (`user_id`,`blog_id`),
  ADD KEY `ix_yupe_blog_user_to_blog_blog_user_to_blog_user_id` (`user_id`),
  ADD KEY `ix_yupe_blog_user_to_blog_blog_user_to_blog_id` (`blog_id`),
  ADD KEY `ix_yupe_blog_user_to_blog_blog_user_to_blog_status` (`status`),
  ADD KEY `ix_yupe_blog_user_to_blog_blog_user_to_blog_role` (`role`);

--
-- Индексы таблицы `yupe_callback`
--
ALTER TABLE `yupe_callback`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `yupe_category_category`
--
ALTER TABLE `yupe_category_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ux_yupe_category_category_alias_lang` (`slug`,`lang`),
  ADD KEY `ix_yupe_category_category_parent_id` (`parent_id`),
  ADD KEY `ix_yupe_category_category_status` (`status`);

--
-- Индексы таблицы `yupe_comment_comment`
--
ALTER TABLE `yupe_comment_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_yupe_comment_comment_status` (`status`),
  ADD KEY `ix_yupe_comment_comment_model_model_id` (`model`,`model_id`),
  ADD KEY `ix_yupe_comment_comment_model` (`model`),
  ADD KEY `ix_yupe_comment_comment_model_id` (`model_id`),
  ADD KEY `ix_yupe_comment_comment_user_id` (`user_id`),
  ADD KEY `ix_yupe_comment_comment_parent_id` (`parent_id`),
  ADD KEY `ix_yupe_comment_comment_level` (`level`),
  ADD KEY `ix_yupe_comment_comment_root` (`root`),
  ADD KEY `ix_yupe_comment_comment_lft` (`lft`),
  ADD KEY `ix_yupe_comment_comment_rgt` (`rgt`);

--
-- Индексы таблицы `yupe_contentblock_content_block`
--
ALTER TABLE `yupe_contentblock_content_block`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ux_yupe_contentblock_content_block_code` (`code`),
  ADD KEY `ix_yupe_contentblock_content_block_type` (`type`),
  ADD KEY `ix_yupe_contentblock_content_block_status` (`status`);

--
-- Индексы таблицы `yupe_feedback_feedback`
--
ALTER TABLE `yupe_feedback_feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_yupe_feedback_feedback_category` (`category_id`),
  ADD KEY `ix_yupe_feedback_feedback_type` (`type`),
  ADD KEY `ix_yupe_feedback_feedback_status` (`status`),
  ADD KEY `ix_yupe_feedback_feedback_isfaq` (`is_faq`),
  ADD KEY `ix_yupe_feedback_feedback_answer_user` (`answer_user`);

--
-- Индексы таблицы `yupe_gallery_gallery`
--
ALTER TABLE `yupe_gallery_gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_yupe_gallery_gallery_status` (`status`),
  ADD KEY `ix_yupe_gallery_gallery_owner` (`owner`);

--
-- Индексы таблицы `yupe_gallery_image_to_gallery`
--
ALTER TABLE `yupe_gallery_image_to_gallery`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ux_yupe_gallery_image_to_gallery_gallery_to_image` (`image_id`,`gallery_id`),
  ADD KEY `ix_yupe_gallery_image_to_gallery_gallery_to_image_image` (`image_id`),
  ADD KEY `ix_yupe_gallery_image_to_gallery_gallery_to_image_gallery` (`gallery_id`);

--
-- Индексы таблицы `yupe_image_image`
--
ALTER TABLE `yupe_image_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_yupe_image_image_status` (`status`),
  ADD KEY `ix_yupe_image_image_user` (`user_id`),
  ADD KEY `ix_yupe_image_image_type` (`type`),
  ADD KEY `ix_yupe_image_image_category_id` (`category_id`),
  ADD KEY `fk_yupe_image_image_parent_id` (`parent_id`);

--
-- Индексы таблицы `yupe_mail_mail_event`
--
ALTER TABLE `yupe_mail_mail_event`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ux_yupe_mail_mail_event_code` (`code`);

--
-- Индексы таблицы `yupe_mail_mail_template`
--
ALTER TABLE `yupe_mail_mail_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ux_yupe_mail_mail_template_code` (`code`),
  ADD KEY `ix_yupe_mail_mail_template_status` (`status`),
  ADD KEY `ix_yupe_mail_mail_template_event_id` (`event_id`);

--
-- Индексы таблицы `yupe_menu_menu`
--
ALTER TABLE `yupe_menu_menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ux_yupe_menu_menu_code` (`code`),
  ADD KEY `ix_yupe_menu_menu_status` (`status`);

--
-- Индексы таблицы `yupe_menu_menu_item`
--
ALTER TABLE `yupe_menu_menu_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_yupe_menu_menu_item_menu_id` (`menu_id`),
  ADD KEY `ix_yupe_menu_menu_item_sort` (`sort`),
  ADD KEY `ix_yupe_menu_menu_item_status` (`status`);

--
-- Индексы таблицы `yupe_migrations`
--
ALTER TABLE `yupe_migrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_migrations_module` (`module`);

--
-- Индексы таблицы `yupe_news_news`
--
ALTER TABLE `yupe_news_news`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ux_yupe_news_news_alias_lang` (`slug`,`lang`),
  ADD KEY `ix_yupe_news_news_status` (`status`),
  ADD KEY `ix_yupe_news_news_user_id` (`user_id`),
  ADD KEY `ix_yupe_news_news_category_id` (`category_id`),
  ADD KEY `ix_yupe_news_news_date` (`date`);

--
-- Индексы таблицы `yupe_notify_settings`
--
ALTER TABLE `yupe_notify_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_yupe_notify_settings_user_id` (`user_id`);

--
-- Индексы таблицы `yupe_page_page`
--
ALTER TABLE `yupe_page_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ux_yupe_page_page_slug_lang` (`slug`,`lang`),
  ADD KEY `ix_yupe_page_page_status` (`status`),
  ADD KEY `ix_yupe_page_page_is_protected` (`is_protected`),
  ADD KEY `ix_yupe_page_page_user_id` (`user_id`),
  ADD KEY `ix_yupe_page_page_change_user_id` (`change_user_id`),
  ADD KEY `ix_yupe_page_page_menu_order` (`order`),
  ADD KEY `ix_yupe_page_page_category_id` (`category_id`);

--
-- Индексы таблицы `yupe_queue_queue`
--
ALTER TABLE `yupe_queue_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ux_yupe_queue_queue_worker` (`worker`),
  ADD KEY `ux_yupe_queue_queue_priority` (`priority`);

--
-- Индексы таблицы `yupe_sitemap_page`
--
ALTER TABLE `yupe_sitemap_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ux_yupe_sitemap_page_url` (`url`);

--
-- Индексы таблицы `yupe_social_user`
--
ALTER TABLE `yupe_social_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ux_yupe_social_user_uid` (`uid`),
  ADD KEY `ix_yupe_social_user_provider` (`provider`),
  ADD KEY `fk_yupe_social_user_user_id` (`user_id`);

--
-- Индексы таблицы `yupe_store_attribute`
--
ALTER TABLE `yupe_store_attribute`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ux_yupe_store_attribute_name_group` (`name`,`group_id`),
  ADD KEY `ix_yupe_store_attribute_title` (`title`),
  ADD KEY `fk_yupe_store_attribute_group` (`group_id`);

--
-- Индексы таблицы `yupe_store_attribute_group`
--
ALTER TABLE `yupe_store_attribute_group`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `yupe_store_attribute_option`
--
ALTER TABLE `yupe_store_attribute_option`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_yupe_store_attribute_option_attribute_id` (`attribute_id`),
  ADD KEY `ix_yupe_store_attribute_option_position` (`position`);

--
-- Индексы таблицы `yupe_store_category`
--
ALTER TABLE `yupe_store_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ux_yupe_store_category_alias` (`slug`),
  ADD KEY `ix_yupe_store_category_parent_id` (`parent_id`),
  ADD KEY `ix_yupe_store_category_status` (`status`),
  ADD KEY `yupe_store_category_external_id_ix` (`external_id`);

--
-- Индексы таблицы `yupe_store_coupon`
--
ALTER TABLE `yupe_store_coupon`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `yupe_store_delivery`
--
ALTER TABLE `yupe_store_delivery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_yupe_store_delivery_position` (`position`);

--
-- Индексы таблицы `yupe_store_delivery_payment`
--
ALTER TABLE `yupe_store_delivery_payment`
  ADD PRIMARY KEY (`delivery_id`,`payment_id`),
  ADD KEY `fk_yupe_store_delivery_payment_payment` (`payment_id`);

--
-- Индексы таблицы `yupe_store_order`
--
ALTER TABLE `yupe_store_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `udx_yupe_store_order_url` (`url`),
  ADD KEY `idx_yupe_store_order_user_id` (`user_id`),
  ADD KEY `idx_yupe_store_order_date` (`date`),
  ADD KEY `idx_yupe_store_order_status` (`status_id`),
  ADD KEY `idx_yupe_store_order_paid` (`paid`),
  ADD KEY `fk_yupe_store_order_delivery` (`delivery_id`),
  ADD KEY `fk_yupe_store_order_payment` (`payment_method_id`);

--
-- Индексы таблицы `yupe_store_order_coupon`
--
ALTER TABLE `yupe_store_order_coupon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_yupe_store_order_coupon_order` (`order_id`),
  ADD KEY `fk_yupe_store_order_coupon_coupon` (`coupon_id`);

--
-- Индексы таблицы `yupe_store_order_product`
--
ALTER TABLE `yupe_store_order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_yupe_store_order_product_order_id` (`order_id`),
  ADD KEY `idx_yupe_store_order_product_product_id` (`product_id`);

--
-- Индексы таблицы `yupe_store_order_status`
--
ALTER TABLE `yupe_store_order_status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `yupe_store_payment`
--
ALTER TABLE `yupe_store_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_yupe_store_payment_position` (`position`);

--
-- Индексы таблицы `yupe_store_producer`
--
ALTER TABLE `yupe_store_producer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_yupe_store_producer_slug` (`slug`);

--
-- Индексы таблицы `yupe_store_product`
--
ALTER TABLE `yupe_store_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ux_yupe_store_product_alias` (`slug`),
  ADD KEY `ix_yupe_store_product_status` (`status`),
  ADD KEY `ix_yupe_store_product_type_id` (`type_id`),
  ADD KEY `ix_yupe_store_product_producer_id` (`producer_id`),
  ADD KEY `ix_yupe_store_product_price` (`price`),
  ADD KEY `ix_yupe_store_product_discount_price` (`discount_price`),
  ADD KEY `ix_yupe_store_product_create_time` (`create_time`),
  ADD KEY `ix_yupe_store_product_update_time` (`update_time`),
  ADD KEY `fk_yupe_store_product_category` (`category_id`),
  ADD KEY `yupe_store_product_external_id_ix` (`external_id`),
  ADD KEY `ix_yupe_store_product_sku` (`sku`),
  ADD KEY `ix_yupe_store_product_name` (`name`);

--
-- Индексы таблицы `yupe_store_product_attribute_value`
--
ALTER TABLE `yupe_store_product_attribute_value`
  ADD PRIMARY KEY (`id`),
  ADD KEY `yupe_fk_product_attribute_product` (`product_id`),
  ADD KEY `yupe_fk_product_attribute_attribute` (`attribute_id`),
  ADD KEY `yupe_fk_product_attribute_option` (`option_value`),
  ADD KEY `yupe_ix_product_attribute_number_value` (`number_value`),
  ADD KEY `yupe_ix_product_attribute_string_value` (`string_value`);

--
-- Индексы таблицы `yupe_store_product_category`
--
ALTER TABLE `yupe_store_product_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_yupe_store_product_category_product_id` (`product_id`),
  ADD KEY `ix_yupe_store_product_category_category_id` (`category_id`);

--
-- Индексы таблицы `yupe_store_product_image`
--
ALTER TABLE `yupe_store_product_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_yupe_store_product_image_product` (`product_id`);

--
-- Индексы таблицы `yupe_store_product_link`
--
ALTER TABLE `yupe_store_product_link`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ux_yupe_store_product_link_product` (`product_id`,`linked_product_id`),
  ADD KEY `fk_yupe_store_product_link_linked_product` (`linked_product_id`),
  ADD KEY `fk_yupe_store_product_link_type` (`type_id`);

--
-- Индексы таблицы `yupe_store_product_link_type`
--
ALTER TABLE `yupe_store_product_link_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ux_yupe_store_product_link_type_code` (`code`),
  ADD UNIQUE KEY `ux_yupe_store_product_link_type_title` (`title`);

--
-- Индексы таблицы `yupe_store_product_variant`
--
ALTER TABLE `yupe_store_product_variant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_yupe_store_product_variant_product` (`product_id`),
  ADD KEY `idx_yupe_store_product_variant_attribute` (`attribute_id`),
  ADD KEY `idx_yupe_store_product_variant_value` (`attribute_value`);

--
-- Индексы таблицы `yupe_store_type`
--
ALTER TABLE `yupe_store_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ux_yupe_store_type_name` (`name`);

--
-- Индексы таблицы `yupe_store_type_attribute`
--
ALTER TABLE `yupe_store_type_attribute`
  ADD PRIMARY KEY (`type_id`,`attribute_id`);

--
-- Индексы таблицы `yupe_user_tokens`
--
ALTER TABLE `yupe_user_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_yupe_user_tokens_user_id` (`user_id`);

--
-- Индексы таблицы `yupe_user_user`
--
ALTER TABLE `yupe_user_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ux_yupe_user_user_nick_name` (`nick_name`),
  ADD UNIQUE KEY `ux_yupe_user_user_email` (`email`),
  ADD KEY `ix_yupe_user_user_status` (`status`);

--
-- Индексы таблицы `yupe_user_user_auth_assignment`
--
ALTER TABLE `yupe_user_user_auth_assignment`
  ADD PRIMARY KEY (`itemname`,`userid`),
  ADD KEY `fk_yupe_user_user_auth_assignment_user` (`userid`);

--
-- Индексы таблицы `yupe_user_user_auth_item`
--
ALTER TABLE `yupe_user_user_auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `ix_yupe_user_user_auth_item_type` (`type`);

--
-- Индексы таблицы `yupe_user_user_auth_item_child`
--
ALTER TABLE `yupe_user_user_auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `fk_yupe_user_user_auth_item_child_child` (`child`);

--
-- Индексы таблицы `yupe_yupe_settings`
--
ALTER TABLE `yupe_yupe_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ux_yupe_yupe_settings_module_id_param_name_user_id` (`module_id`,`param_name`,`user_id`),
  ADD KEY `ix_yupe_yupe_settings_module_id` (`module_id`),
  ADD KEY `ix_yupe_yupe_settings_param_name` (`param_name`),
  ADD KEY `fk_yupe_yupe_settings_user_id` (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `yupe_blog_blog`
--
ALTER TABLE `yupe_blog_blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_blog_post`
--
ALTER TABLE `yupe_blog_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_blog_tag`
--
ALTER TABLE `yupe_blog_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_blog_user_to_blog`
--
ALTER TABLE `yupe_blog_user_to_blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_callback`
--
ALTER TABLE `yupe_callback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_category_category`
--
ALTER TABLE `yupe_category_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_comment_comment`
--
ALTER TABLE `yupe_comment_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_contentblock_content_block`
--
ALTER TABLE `yupe_contentblock_content_block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_feedback_feedback`
--
ALTER TABLE `yupe_feedback_feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_gallery_gallery`
--
ALTER TABLE `yupe_gallery_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_gallery_image_to_gallery`
--
ALTER TABLE `yupe_gallery_image_to_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_image_image`
--
ALTER TABLE `yupe_image_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_mail_mail_event`
--
ALTER TABLE `yupe_mail_mail_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_mail_mail_template`
--
ALTER TABLE `yupe_mail_mail_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_menu_menu`
--
ALTER TABLE `yupe_menu_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `yupe_menu_menu_item`
--
ALTER TABLE `yupe_menu_menu_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT для таблицы `yupe_migrations`
--
ALTER TABLE `yupe_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=98;
--
-- AUTO_INCREMENT для таблицы `yupe_news_news`
--
ALTER TABLE `yupe_news_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_notify_settings`
--
ALTER TABLE `yupe_notify_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_page_page`
--
ALTER TABLE `yupe_page_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_queue_queue`
--
ALTER TABLE `yupe_queue_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_sitemap_page`
--
ALTER TABLE `yupe_sitemap_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `yupe_social_user`
--
ALTER TABLE `yupe_social_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_store_attribute`
--
ALTER TABLE `yupe_store_attribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_store_attribute_group`
--
ALTER TABLE `yupe_store_attribute_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_store_attribute_option`
--
ALTER TABLE `yupe_store_attribute_option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_store_category`
--
ALTER TABLE `yupe_store_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_store_coupon`
--
ALTER TABLE `yupe_store_coupon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_store_delivery`
--
ALTER TABLE `yupe_store_delivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_store_order`
--
ALTER TABLE `yupe_store_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_store_order_coupon`
--
ALTER TABLE `yupe_store_order_coupon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_store_order_product`
--
ALTER TABLE `yupe_store_order_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_store_order_status`
--
ALTER TABLE `yupe_store_order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `yupe_store_payment`
--
ALTER TABLE `yupe_store_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_store_producer`
--
ALTER TABLE `yupe_store_producer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_store_product`
--
ALTER TABLE `yupe_store_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_store_product_attribute_value`
--
ALTER TABLE `yupe_store_product_attribute_value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_store_product_category`
--
ALTER TABLE `yupe_store_product_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_store_product_image`
--
ALTER TABLE `yupe_store_product_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_store_product_link`
--
ALTER TABLE `yupe_store_product_link`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_store_product_link_type`
--
ALTER TABLE `yupe_store_product_link_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `yupe_store_product_variant`
--
ALTER TABLE `yupe_store_product_variant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_store_type`
--
ALTER TABLE `yupe_store_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `yupe_user_tokens`
--
ALTER TABLE `yupe_user_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `yupe_user_user`
--
ALTER TABLE `yupe_user_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `yupe_yupe_settings`
--
ALTER TABLE `yupe_yupe_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `yupe_blog_blog`
--
ALTER TABLE `yupe_blog_blog`
  ADD CONSTRAINT `fk_yupe_blog_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `yupe_category_category` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_yupe_blog_blog_create_user` FOREIGN KEY (`create_user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_yupe_blog_blog_update_user` FOREIGN KEY (`update_user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `yupe_blog_post`
--
ALTER TABLE `yupe_blog_post`
  ADD CONSTRAINT `fk_yupe_blog_post_blog` FOREIGN KEY (`blog_id`) REFERENCES `yupe_blog_blog` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_yupe_blog_post_category_id` FOREIGN KEY (`category_id`) REFERENCES `yupe_category_category` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_yupe_blog_post_create_user` FOREIGN KEY (`create_user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_yupe_blog_post_update_user` FOREIGN KEY (`update_user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `yupe_blog_post_to_tag`
--
ALTER TABLE `yupe_blog_post_to_tag`
  ADD CONSTRAINT `fk_yupe_blog_post_to_tag_post_id` FOREIGN KEY (`post_id`) REFERENCES `yupe_blog_post` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_yupe_blog_post_to_tag_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `yupe_blog_tag` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `yupe_blog_user_to_blog`
--
ALTER TABLE `yupe_blog_user_to_blog`
  ADD CONSTRAINT `fk_yupe_blog_user_to_blog_blog_user_to_blog_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `yupe_blog_blog` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_yupe_blog_user_to_blog_blog_user_to_blog_user_id` FOREIGN KEY (`user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `yupe_category_category`
--
ALTER TABLE `yupe_category_category`
  ADD CONSTRAINT `fk_yupe_category_category_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `yupe_category_category` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `yupe_comment_comment`
--
ALTER TABLE `yupe_comment_comment`
  ADD CONSTRAINT `fk_yupe_comment_comment_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `yupe_comment_comment` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_yupe_comment_comment_user_id` FOREIGN KEY (`user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `yupe_feedback_feedback`
--
ALTER TABLE `yupe_feedback_feedback`
  ADD CONSTRAINT `fk_yupe_feedback_feedback_answer_user` FOREIGN KEY (`answer_user`) REFERENCES `yupe_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_yupe_feedback_feedback_category` FOREIGN KEY (`category_id`) REFERENCES `yupe_category_category` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `yupe_gallery_gallery`
--
ALTER TABLE `yupe_gallery_gallery`
  ADD CONSTRAINT `fk_yupe_gallery_gallery_owner` FOREIGN KEY (`owner`) REFERENCES `yupe_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `yupe_gallery_image_to_gallery`
--
ALTER TABLE `yupe_gallery_image_to_gallery`
  ADD CONSTRAINT `fk_yupe_gallery_image_to_gallery_gallery_to_image_gallery` FOREIGN KEY (`gallery_id`) REFERENCES `yupe_gallery_gallery` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_yupe_gallery_image_to_gallery_gallery_to_image_image` FOREIGN KEY (`image_id`) REFERENCES `yupe_image_image` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `yupe_image_image`
--
ALTER TABLE `yupe_image_image`
  ADD CONSTRAINT `fk_yupe_image_image_category_id` FOREIGN KEY (`category_id`) REFERENCES `yupe_category_category` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_yupe_image_image_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `yupe_image_image` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_yupe_image_image_user_id` FOREIGN KEY (`user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `yupe_mail_mail_template`
--
ALTER TABLE `yupe_mail_mail_template`
  ADD CONSTRAINT `fk_yupe_mail_mail_template_event_id` FOREIGN KEY (`event_id`) REFERENCES `yupe_mail_mail_event` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `yupe_menu_menu_item`
--
ALTER TABLE `yupe_menu_menu_item`
  ADD CONSTRAINT `fk_yupe_menu_menu_item_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `yupe_menu_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `yupe_news_news`
--
ALTER TABLE `yupe_news_news`
  ADD CONSTRAINT `fk_yupe_news_news_category_id` FOREIGN KEY (`category_id`) REFERENCES `yupe_category_category` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_yupe_news_news_user_id` FOREIGN KEY (`user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `yupe_notify_settings`
--
ALTER TABLE `yupe_notify_settings`
  ADD CONSTRAINT `fk_yupe_notify_settings_user_id` FOREIGN KEY (`user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `yupe_page_page`
--
ALTER TABLE `yupe_page_page`
  ADD CONSTRAINT `fk_yupe_page_page_category_id` FOREIGN KEY (`category_id`) REFERENCES `yupe_category_category` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_yupe_page_page_change_user_id` FOREIGN KEY (`change_user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_yupe_page_page_user_id` FOREIGN KEY (`user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `yupe_social_user`
--
ALTER TABLE `yupe_social_user`
  ADD CONSTRAINT `fk_yupe_social_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `yupe_store_attribute`
--
ALTER TABLE `yupe_store_attribute`
  ADD CONSTRAINT `fk_yupe_store_attribute_group` FOREIGN KEY (`group_id`) REFERENCES `yupe_store_attribute_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `yupe_store_attribute_option`
--
ALTER TABLE `yupe_store_attribute_option`
  ADD CONSTRAINT `fk_yupe_store_attribute_option_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `yupe_store_attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `yupe_store_category`
--
ALTER TABLE `yupe_store_category`
  ADD CONSTRAINT `fk_yupe_store_category_parent` FOREIGN KEY (`parent_id`) REFERENCES `yupe_store_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `yupe_store_delivery_payment`
--
ALTER TABLE `yupe_store_delivery_payment`
  ADD CONSTRAINT `fk_yupe_store_delivery_payment_delivery` FOREIGN KEY (`delivery_id`) REFERENCES `yupe_store_delivery` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_yupe_store_delivery_payment_payment` FOREIGN KEY (`payment_id`) REFERENCES `yupe_store_payment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `yupe_store_order`
--
ALTER TABLE `yupe_store_order`
  ADD CONSTRAINT `fk_yupe_store_order_delivery` FOREIGN KEY (`delivery_id`) REFERENCES `yupe_store_delivery` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_yupe_store_order_payment` FOREIGN KEY (`payment_method_id`) REFERENCES `yupe_store_payment` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_yupe_store_order_status` FOREIGN KEY (`status_id`) REFERENCES `yupe_store_order_status` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_yupe_store_order_user` FOREIGN KEY (`user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `yupe_store_order_coupon`
--
ALTER TABLE `yupe_store_order_coupon`
  ADD CONSTRAINT `fk_yupe_store_order_coupon_coupon` FOREIGN KEY (`coupon_id`) REFERENCES `yupe_store_coupon` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_yupe_store_order_coupon_order` FOREIGN KEY (`order_id`) REFERENCES `yupe_store_order` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `yupe_store_order_product`
--
ALTER TABLE `yupe_store_order_product`
  ADD CONSTRAINT `fk_yupe_store_order_product_order` FOREIGN KEY (`order_id`) REFERENCES `yupe_store_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_yupe_store_order_product_product` FOREIGN KEY (`product_id`) REFERENCES `yupe_store_product` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `yupe_store_product`
--
ALTER TABLE `yupe_store_product`
  ADD CONSTRAINT `fk_yupe_store_product_category` FOREIGN KEY (`category_id`) REFERENCES `yupe_store_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_yupe_store_product_producer` FOREIGN KEY (`producer_id`) REFERENCES `yupe_store_producer` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_yupe_store_product_type` FOREIGN KEY (`type_id`) REFERENCES `yupe_store_type` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `yupe_store_product_attribute_value`
--
ALTER TABLE `yupe_store_product_attribute_value`
  ADD CONSTRAINT `yupe_fk_product_attribute_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `yupe_store_attribute` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `yupe_fk_product_attribute_option` FOREIGN KEY (`option_value`) REFERENCES `yupe_store_attribute_option` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `yupe_fk_product_attribute_product` FOREIGN KEY (`product_id`) REFERENCES `yupe_store_product` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `yupe_store_product_category`
--
ALTER TABLE `yupe_store_product_category`
  ADD CONSTRAINT `fk_yupe_store_product_category_category` FOREIGN KEY (`category_id`) REFERENCES `yupe_store_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_yupe_store_product_category_product` FOREIGN KEY (`product_id`) REFERENCES `yupe_store_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `yupe_store_product_image`
--
ALTER TABLE `yupe_store_product_image`
  ADD CONSTRAINT `fk_yupe_store_product_image_product` FOREIGN KEY (`product_id`) REFERENCES `yupe_store_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `yupe_store_product_link`
--
ALTER TABLE `yupe_store_product_link`
  ADD CONSTRAINT `fk_yupe_store_product_link_linked_product` FOREIGN KEY (`linked_product_id`) REFERENCES `yupe_store_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_yupe_store_product_link_product` FOREIGN KEY (`product_id`) REFERENCES `yupe_store_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_yupe_store_product_link_type` FOREIGN KEY (`type_id`) REFERENCES `yupe_store_product_link_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `yupe_store_product_variant`
--
ALTER TABLE `yupe_store_product_variant`
  ADD CONSTRAINT `fk_yupe_store_product_variant_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `yupe_store_attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_yupe_store_product_variant_product` FOREIGN KEY (`product_id`) REFERENCES `yupe_store_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `yupe_store_type_attribute`
--
ALTER TABLE `yupe_store_type_attribute`
  ADD CONSTRAINT `fk_yupe_store_type_attribute_type` FOREIGN KEY (`type_id`) REFERENCES `yupe_store_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `yupe_user_tokens`
--
ALTER TABLE `yupe_user_tokens`
  ADD CONSTRAINT `fk_yupe_user_tokens_user_id` FOREIGN KEY (`user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `yupe_user_user_auth_assignment`
--
ALTER TABLE `yupe_user_user_auth_assignment`
  ADD CONSTRAINT `fk_yupe_user_user_auth_assignment_item` FOREIGN KEY (`itemname`) REFERENCES `yupe_user_user_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_yupe_user_user_auth_assignment_user` FOREIGN KEY (`userid`) REFERENCES `yupe_user_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `yupe_user_user_auth_item_child`
--
ALTER TABLE `yupe_user_user_auth_item_child`
  ADD CONSTRAINT `fk_yupe_user_user_auth_item_child_child` FOREIGN KEY (`child`) REFERENCES `yupe_user_user_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_yupe_user_user_auth_itemchild_parent` FOREIGN KEY (`parent`) REFERENCES `yupe_user_user_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `yupe_yupe_settings`
--
ALTER TABLE `yupe_yupe_settings`
  ADD CONSTRAINT `fk_yupe_yupe_settings_user_id` FOREIGN KEY (`user_id`) REFERENCES `yupe_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
