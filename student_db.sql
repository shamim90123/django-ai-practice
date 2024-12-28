-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for student_db
CREATE DATABASE IF NOT EXISTS `student_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `student_db`;

-- Dumping structure for table student_db.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table student_db.auth_group: ~0 rows (approximately)
INSERT INTO `auth_group` (`id`, `name`) VALUES
	(1, 'student'),
	(2, 'UniversityManager');

-- Dumping structure for table student_db.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table student_db.auth_group_permissions: ~4 rows (approximately)
INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
	(5, 2, 29),
	(6, 2, 30),
	(7, 2, 31),
	(4, 2, 32);

-- Dumping structure for table student_db.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table student_db.auth_permission: ~28 rows (approximately)
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add student', 7, 'add_student'),
	(26, 'Can change student', 7, 'change_student'),
	(27, 'Can delete student', 7, 'delete_student'),
	(28, 'Can view student', 7, 'view_student'),
	(29, 'Can add university', 8, 'add_university'),
	(30, 'Can change university', 8, 'change_university'),
	(31, 'Can delete university', 8, 'delete_university'),
	(32, 'Can view university', 8, 'view_university'),
	(33, 'Can add student profile', 9, 'add_studentprofile'),
	(34, 'Can change student profile', 9, 'change_studentprofile'),
	(35, 'Can delete student profile', 9, 'delete_studentprofile'),
	(36, 'Can view student profile', 9, 'view_studentprofile'),
	(37, 'Can add age gender', 10, 'add_agegender'),
	(38, 'Can change age gender', 10, 'change_agegender'),
	(39, 'Can delete age gender', 10, 'delete_agegender'),
	(40, 'Can view age gender', 10, 'view_agegender');

-- Dumping structure for table student_db.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table student_db.auth_user: ~2 rows (approximately)
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$870000$36FKosGECxRGTYn7yxb0u3$vND1zrJvLAM6oJdq/5WMAeF8nUGJ95G5l0e5BA2kXRk=', '2024-12-28 07:02:55.156118', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2024-11-24 23:10:01.328245'),
	(2, 'pbkdf2_sha256$870000$fI6R3aPMPwMteplzTMuBzR$xmgRk4Rni5V2OKgcWQ8bBsqNg5SMIWMnVA+BkHDuo/w=', '2024-12-28 07:00:43.701384', 0, 'shamim901', '', '', 'shamim@gmail.com', 1, 1, '2024-11-25 00:14:50.000000');

-- Dumping structure for table student_db.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table student_db.auth_user_groups: ~1 rows (approximately)
INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
	(2, 2, 2);

-- Dumping structure for table student_db.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table student_db.auth_user_user_permissions: ~0 rows (approximately)

-- Dumping structure for table student_db.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table student_db.django_admin_log: ~18 rows (approximately)
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2024-11-24 23:13:38.540223', '1', 'Shamim Reza', 1, '[{"added": {}}]', 7, 1),
	(2, '2024-11-25 17:31:21.422022', '4', 'RUET', 1, '[{"added": {}}]', 8, 2),
	(3, '2024-12-04 01:58:23.344892', '1', 'student', 1, '[{"added": {}}]', 3, 1),
	(4, '2024-12-06 03:43:27.480344', '1', 'StudentProfile object (1)', 1, '[{"added": {}}]', 9, 2),
	(5, '2024-12-06 03:45:18.044451', '2', 'StudentProfile object (2)', 1, '[{"added": {}}]', 9, 2),
	(6, '2024-12-06 03:51:28.618396', '3', 'StudentProfile object (3)', 1, '[{"added": {}}]', 9, 2),
	(7, '2024-12-14 13:32:36.435873', '2', 'shamim901', 2, '[{"changed": {"fields": ["Superuser status"]}}]', 4, 1),
	(8, '2024-12-14 13:43:08.376292', '1', 'student', 2, '[]', 3, 1),
	(9, '2024-12-14 13:43:22.191495', '1', 'student', 2, '[{"changed": {"fields": ["Permissions"]}}]', 3, 1),
	(10, '2024-12-14 13:43:41.785729', '2', 'shamim901', 2, '[]', 4, 1),
	(11, '2024-12-14 13:43:52.331270', '2', 'shamim901', 2, '[{"changed": {"fields": ["Groups"]}}]', 4, 1),
	(12, '2024-12-14 13:45:10.177852', '1', 'student', 2, '[{"changed": {"fields": ["Permissions"]}}]', 3, 1),
	(13, '2024-12-14 17:07:53.274782', '4', 'StudentProfile object (4)', 1, '[{"added": {}}]', 9, 1),
	(14, '2024-12-14 17:08:26.857625', '3', 'StudentProfile object (3)', 2, '[{"changed": {"fields": ["Image"]}}]', 9, 1),
	(15, '2024-12-14 17:08:34.227831', '2', 'StudentProfile object (2)', 2, '[{"changed": {"fields": ["Image"]}}]', 9, 1),
	(16, '2024-12-14 17:08:42.333094', '1', 'StudentProfile object (1)', 2, '[{"changed": {"fields": ["Image"]}}]', 9, 1),
	(17, '2024-12-14 17:23:02.136619', '2', 'shamim901', 2, '[{"changed": {"fields": ["Superuser status"]}}]', 4, 1),
	(18, '2024-12-14 17:23:31.257146', '2', 'shamim901', 2, '[{"changed": {"fields": ["Superuser status"]}}]', 4, 1),
	(19, '2024-12-14 17:34:20.589291', '1', 'student', 2, '[{"changed": {"fields": ["Permissions"]}}]', 3, 1),
	(20, '2024-12-14 17:48:07.619557', '2', 'UniversityManager', 1, '[{"added": {}}]', 3, 1),
	(21, '2024-12-14 17:48:26.686069', '2', 'shamim901', 2, '[{"changed": {"fields": ["Groups"]}}]', 4, 1);

-- Dumping structure for table student_db.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table student_db.django_content_type: ~7 rows (approximately)
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(10, 'profiles', 'agegender'),
	(7, 'profiles', 'student'),
	(9, 'profiles', 'studentprofile'),
	(8, 'profiles', 'university'),
	(6, 'sessions', 'session');

-- Dumping structure for table student_db.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table student_db.django_migrations: ~19 rows (approximately)
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2024-11-24 23:03:07.945462'),
	(2, 'auth', '0001_initial', '2024-11-24 23:03:08.209627'),
	(3, 'admin', '0001_initial', '2024-11-24 23:03:08.305467'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2024-11-24 23:03:08.312476'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-11-24 23:03:08.319481'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2024-11-24 23:03:08.393687'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2024-11-24 23:03:08.429763'),
	(8, 'auth', '0003_alter_user_email_max_length', '2024-11-24 23:03:08.445478'),
	(9, 'auth', '0004_alter_user_username_opts', '2024-11-24 23:03:08.450032'),
	(10, 'auth', '0005_alter_user_last_login_null', '2024-11-24 23:03:08.483195'),
	(11, 'auth', '0006_require_contenttypes_0002', '2024-11-24 23:03:08.485195'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2024-11-24 23:03:08.488423'),
	(13, 'auth', '0008_alter_user_username_max_length', '2024-11-24 23:03:08.531769'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2024-11-24 23:03:08.565384'),
	(15, 'auth', '0010_alter_group_name_max_length', '2024-11-24 23:03:08.580008'),
	(16, 'auth', '0011_update_proxy_permissions', '2024-11-24 23:03:08.584006'),
	(17, 'auth', '0012_alter_user_first_name_max_length', '2024-11-24 23:03:08.617097'),
	(18, 'profiles', '0001_initial', '2024-11-24 23:03:08.643407'),
	(19, 'sessions', '0001_initial', '2024-11-24 23:03:08.663768'),
	(20, 'profiles', '0002_university', '2024-11-25 16:57:58.709373'),
	(21, 'profiles', '0003_remove_university_established_date_and_more', '2024-11-25 16:57:58.786329'),
	(22, 'profiles', '0004_studentprofile', '2024-12-06 03:27:19.791850'),
	(23, 'profiles', '0005_agegender', '2024-12-13 04:38:41.450243');

-- Dumping structure for table student_db.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table student_db.django_session: ~5 rows (approximately)
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('4ravetiu97ww3lowj9ladbv08236c4xc', '.eJxVjL0OwyAQg9-FuUKQ8Nuxe54B3eWgpK1ACslU9d0bpAztZNmf7TcLsG857C2uYSF2ZZJdfjOE-RlLB_SAcq98rmVbF-S9wk_a-FQpvm5n9-8gQ8vHWlhNSiSpvUs0goXB0qC6k9phHIVKZCgeYpICUEhWIfjZOOEdWss-X9qZN-c:1tRQoc:_0K1PNImMjeySMN_uFg2k6gqc9WCGEF5nlZJTsqGZ54', '2025-01-11 07:00:50.900831'),
	('iyodx8d3cufadmoqru7dw8je1dup2b2m', '.eJxVjEEOwiAQRe_C2hAKTKEu3fcMZGAYqRqalHZlvLtt0oVu_3v_vUXAbS1ha3kJE4mr0OLyu0VMz1wPQA-s91mmua7LFOWhyJM2Oc6UX7fT_QsUbGV_-6wi2ISKvR80A6JynHs0npXJkfdSNIPrLaakwHTUgXbkEIgNMVjx-QIDGTi7:1tHKBN:pgRzishOlCC-d9kpNEHLcZuK4pkEJfts60LNofLNuc0', '2024-12-14 09:54:33.233895'),
	('jjvt486pork69hf9h5325ckjw2zkm35q', '.eJxVjEEOwiAQRe_C2hAKTKEu3fcMZGAYqRqalHZlvLtt0oVu_3v_vUXAbS1ha3kJE4mr0OLyu0VMz1wPQA-s91mmua7LFOWhyJM2Oc6UX7fT_QsUbGV_-6wi2ISKvR80A6JynHs0npXJkfdSNIPrLaakwHTUgXbkEIgNMVjx-QIDGTi7:1tMVq4:_sXuq-SyWaCk2gFmzqhKxOEN_OkGN1r6Oik7bhRuej0', '2024-12-28 17:22:00.791372'),
	('my647hhuqf6npqzcjvndoe6acqjy78ex', '.eJxVjEEOwiAQRe_C2hAKTKEu3fcMZGAYqRqalHZlvLtt0oVu_3v_vUXAbS1ha3kJE4mr0OLyu0VMz1wPQA-s91mmua7LFOWhyJM2Oc6UX7fT_QsUbGV_-6wi2ISKvR80A6JynHs0npXJkfdSNIPrLaakwHTUgXbkEIgNMVjx-QIDGTi7:1tHDU8:abng2GcluMRxIvDd9zeiypVJCVrLC44mjeXixM7Rea0', '2024-12-14 02:45:28.207326'),
	('u5wstp2vfyix69zejz49rvjmuxo2lkcx', '.eJxVjEEOwiAQRe_C2hAKTKEu3fcMZGAYqRqalHZlvLtt0oVu_3v_vUXAbS1ha3kJE4mr0OLyu0VMz1wPQA-s91mmua7LFOWhyJM2Oc6UX7fT_QsUbGV_-6wi2ISKvR80A6JynHs0npXJkfdSNIPrLaakwHTUgXbkEIgNMVjx-QIDGTi7:1tMSR8:-ECX3EecqeLGikHQCYkIOr0_ZgO7hgzz9noT2_B7r8g', '2024-12-28 13:44:02.479941');

-- Dumping structure for table student_db.profiles_agegender
CREATE TABLE IF NOT EXISTS `profiles_agegender` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table student_db.profiles_agegender: ~59 rows (approximately)
INSERT INTO `profiles_agegender` (`id`, `image`, `uploaded_at`) VALUES
	(1, 'age_gender_prediction/Shakib_Al_Hasan_4_cropped_mIFsjnZ.jpg', '2024-12-13 04:39:00.688798'),
	(2, 'age_gender_prediction/Shakib_Al_Hasan_4_cropped_MNJ7QXZ.jpg', '2024-12-13 04:39:10.608123'),
	(3, 'age_gender_prediction/WhatsApp_Image_2024-10-11_at_12.00.11_f2394cad.jpg', '2024-12-13 04:39:16.537056'),
	(4, 'age_gender_prediction/WhatsApp_Image_2024-10-11_at_12_yC4AA3d.00.11_f2394cad.jpg', '2024-12-13 04:39:22.936278'),
	(5, 'age_gender_prediction/1200px-Mashrafe_Bin_Mortaza_cropped.jpg', '2024-12-13 04:39:41.953761'),
	(6, 'age_gender_prediction/1200px-Mashrafe_Bin_Mortaza_cropped.jpg', '2024-12-13 04:40:53.235684'),
	(7, 'age_gender_prediction/1200px-Mashrafe_Bin_Mortaza_cropped_Gc5FkOJ.jpg', '2024-12-13 04:41:01.635662'),
	(8, 'age_gender_prediction/1200px-Mashrafe_Bin_Mortaza_cropped_LLSAcZH.jpg', '2024-12-13 04:44:00.214838'),
	(9, 'age_gender_prediction/1200px-Mashrafe_Bin_Mortaza_cropped_edlaWK0.jpg', '2024-12-13 04:50:40.477312'),
	(10, 'age_gender_prediction/1200px-Mashrafe_Bin_Mortaza_cropped_JkYMeRF.jpg', '2024-12-13 04:54:21.868833'),
	(11, 'age_gender_prediction/1200px-Mashrafe_Bin_Mortaza_cropped_IUU3syu.jpg', '2024-12-13 04:54:22.916647'),
	(12, 'age_gender_prediction/Shakib_Al_Hasan_4_cropped.jpg', '2024-12-13 04:54:32.670294'),
	(13, 'age_gender_prediction/Shakib_Al_Hasan_4_cropped.jpg', '2024-12-13 04:56:01.264645'),
	(14, 'age_gender_prediction/1200px-Mashrafe_Bin_Mortaza_cropped.jpg', '2024-12-13 04:56:12.336535'),
	(15, 'age_gender_prediction/1200px-Mashrafe_Bin_Mortaza_cropped_FlnUF2r.jpg', '2024-12-13 04:57:01.697185'),
	(16, 'age_gender_prediction/mashrafe-mortaza.jpg', '2024-12-13 04:57:18.393302'),
	(17, 'age_gender_prediction/mashrafe-mortaza_AVXbtn9.jpg', '2024-12-13 04:57:45.919640'),
	(18, 'age_gender_prediction/1200px-Mashrafe_Bin_Mortaza_cropped_5RpXja0.jpg', '2024-12-13 04:57:57.074194'),
	(19, 'age_gender_prediction/Mashrafe_Mortaza_training_23_January_2009_Dhaka_SBNS.jpg', '2024-12-13 04:58:05.106779'),
	(20, 'age_gender_prediction/IMG_20240718_094403.jpg', '2024-12-13 05:02:13.312835'),
	(21, 'age_gender_prediction/IMG20230824194902.jpg', '2024-12-13 05:02:29.004386'),
	(22, 'age_gender_prediction/IMG-20220326-WA0001.jpg', '2024-12-13 05:02:39.201693'),
	(23, 'age_gender_prediction/trashed-1707649874-IMG20240112171052.jpg', '2024-12-13 05:02:45.568289'),
	(24, 'age_gender_prediction/Firefly_Inpaint_20230731013000_1.png', '2024-12-13 05:03:04.228754'),
	(25, 'age_gender_prediction/20200529_182900.jpg', '2024-12-13 05:03:14.882248'),
	(26, 'age_gender_prediction/20161016_165118.jpg', '2024-12-13 05:03:23.754725'),
	(27, 'age_gender_prediction/IMG_20161223_174939.jpg', '2024-12-13 05:03:32.624445'),
	(28, 'age_gender_prediction/1200px-Mashrafe_Bin_Mortaza_cropped_AnUxGYd.jpg', '2024-12-13 05:04:32.068654'),
	(29, 'age_gender_prediction/IMG20230824194902_T3sVaP2.jpg', '2024-12-13 05:04:42.394051'),
	(30, 'age_gender_prediction/IMG20231015182029.jpg', '2024-12-13 05:05:13.235035'),
	(31, 'age_gender_prediction/1200px-Mashrafe_Bin_Mortaza_cropped_Q0ERctf.jpg', '2024-12-13 05:05:25.294536'),
	(32, 'age_gender_prediction/mashrafe-mortaza_tJrlLrr.jpg', '2024-12-13 05:05:39.389557'),
	(33, 'age_gender_prediction/Shakib_Al_Hasan_4_cropped_5HLhW1U.jpg', '2024-12-13 05:05:50.486018'),
	(34, 'age_gender_prediction/IMG20231221191122.jpg', '2024-12-13 05:06:34.891688'),
	(35, 'age_gender_prediction/IMG20231221191135.jpg', '2024-12-13 05:06:43.405886'),
	(36, 'age_gender_prediction/916520c443f28123c971b89c699867ba.jpg', '2024-12-13 05:17:06.622847'),
	(37, 'age_gender_prediction/916520c443f28123c971b89c699867ba_u8Ks795.jpg', '2024-12-13 05:17:19.974123'),
	(38, 'age_gender_prediction/916520c443f28123c971b89c699867ba_kbRpj3r.jpg', '2024-12-13 05:17:36.447642'),
	(39, 'age_gender_prediction/1000_F_290100730_aMWGp0oLxzYSYEGR49P8xW1F1NEj057R.jpg', '2024-12-13 05:17:41.510367'),
	(40, 'age_gender_prediction/1000_F_475363187_nWNSiep47XGA52OfmntEt7SV0JHpfc7S.jpg', '2024-12-13 05:18:46.864079'),
	(41, 'age_gender_prediction/istockphoto-1201013432-612x612.jpg', '2024-12-13 05:19:27.008500'),
	(42, 'age_gender_prediction/37422.jpg', '2024-12-13 12:13:31.369766'),
	(43, 'age_gender_prediction/20200529_182900_r57wb8C.jpg', '2024-12-13 12:24:39.750133'),
	(44, 'age_gender_prediction/20200529_182900_ExiPPF9.jpg', '2024-12-13 12:25:57.119063'),
	(45, 'age_gender_prediction/37422_kOd1kKj.jpg', '2024-12-13 12:28:31.987543'),
	(46, 'age_gender_prediction/20200529_182900_qWpOtyl.jpg', '2024-12-13 12:39:10.881126'),
	(47, 'age_gender_prediction/1200px-Mashrafe_Bin_Mortaza_cropped_DB4MEBe.jpg', '2024-12-13 12:42:05.218625'),
	(48, 'age_gender_prediction/1000_F_475363187_nWNSiep47XGA52OfmntEt7SV0JHpfc7S.jpg', '2024-12-13 13:14:53.090209'),
	(49, 'age_gender_prediction/IMG20230824194902.jpg', '2024-12-13 13:18:40.620189'),
	(50, 'age_gender_prediction/istockphoto-172391981-612x612.jpg', '2024-12-13 13:19:41.043532'),
	(51, 'age_gender_prediction/istockphoto-172391981-612x612_5P4szHb.jpg', '2024-12-13 13:19:50.811985'),
	(52, 'age_gender_prediction/1200px-Mashrafe_Bin_Mortaza_cropped.jpg', '2024-12-14 16:45:38.030284'),
	(53, 'age_gender_prediction/1200px-Mashrafe_Bin_Mortaza_cropped_syrLfKl.jpg', '2024-12-14 16:46:41.182700'),
	(54, 'age_gender_prediction/1200px-Mashrafe_Bin_Mortaza_cropped_fQ4LDRA.jpg', '2024-12-14 16:47:29.503719'),
	(55, 'age_gender_prediction/1200px-Mashrafe_Bin_Mortaza_cropped_HoEpHvq.jpg', '2024-12-14 16:47:53.391628'),
	(56, 'age_gender_prediction/1200px-Mashrafe_Bin_Mortaza_cropped_ZU5aIru.jpg', '2024-12-14 16:47:54.023632'),
	(57, 'age_gender_prediction/1200px-Mashrafe_Bin_Mortaza_cropped_usa4DPT.jpg', '2024-12-14 16:48:15.915888'),
	(58, 'age_gender_prediction/1200px-Mashrafe_Bin_Mortaza_cropped_5BpkU2p.jpg', '2024-12-14 16:48:16.744052'),
	(59, 'age_gender_prediction/1200px-Mashrafe_Bin_Mortaza_cropped.jpg', '2024-12-14 16:57:08.187982'),
	(60, 'age_gender_prediction/1200px-Mashrafe_Bin_Mortaza_cropped_Tu7IIu9.jpg', '2024-12-14 16:57:13.320357'),
	(61, 'age_gender_prediction/20200529_182900.jpg', '2024-12-14 16:57:23.339216'),
	(62, 'age_gender_prediction/20200529_182900_zImVaUE.jpg', '2024-12-14 17:01:57.977456'),
	(63, 'age_gender_prediction/20200529_182900_IeDYv8M.jpg', '2024-12-14 17:02:57.730317'),
	(64, 'age_gender_prediction/mashrafe-mortaza-288.png', '2024-12-28 06:44:44.798802'),
	(65, 'age_gender_prediction/mashrafe-mortaza-288_zYzUHEu.png', '2024-12-28 06:50:34.545124'),
	(66, 'age_gender_prediction/mashrafe-mortaza-288_lSgyHi7.png', '2024-12-28 06:55:06.456651'),
	(67, 'age_gender_prediction/mashrafe-mortaza-288_v1tO0i3.png', '2024-12-28 07:01:10.942162'),
	(68, 'age_gender_prediction/mashrafe-mortaza-288_APNknMN.png', '2024-12-28 07:14:20.287068');

-- Dumping structure for table student_db.profiles_student
CREATE TABLE IF NOT EXISTS `profiles_student` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `date_of_birth` date NOT NULL,
  `enrollment_date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table student_db.profiles_student: ~0 rows (approximately)
INSERT INTO `profiles_student` (`id`, `first_name`, `last_name`, `email`, `date_of_birth`, `enrollment_date`) VALUES
	(1, 'Shamim', 'Reza', 'shamim@gmail.com', '2024-01-04', '2024-11-24');

-- Dumping structure for table student_db.profiles_studentprofile
CREATE TABLE IF NOT EXISTS `profiles_studentprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `face_encoding` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table student_db.profiles_studentprofile: ~2 rows (approximately)
INSERT INTO `profiles_studentprofile` (`id`, `name`, `image`, `face_encoding`) VALUES
	(1, 'Shamim Reza', 'student_images/20200529_182900.jpg', _binary 0x000000c0edb1b8bf00000000e83bc43f000000800a1b5abf0000000051e3b7bf000000803896a53f00000040bf77a7bf000000c01caa9abf000000e01ce4b5bf000000a08443c93f0000006040a6b3bf000000804857c73f000000402b8ca2bf00000020c36cccbf0000002074efc5bf000000a0b184a53f00000000d453c13f000000203b8cc6bf000000807c2ec2bf00000000f076993f00000080d75db0bf000000809fed943f0000006088bc813f0000002060d38dbf0000000002a0c03f00000020323abbbf00000040c64cd7bf000000e005deb3bf0000000065a5c7bf00000040efc9783f000000c02bfbb5bf000000e085a5a4bf000000c022ba923f00000040b832bfbf000000a076849abf000000406c9e7a3f000000400997bb3f000000a046dbb2bf00000080b7a6933f000000a04777c63f000000a05b1ab53f00000020a8cdb9bf00000000175e80bf0000000065db643f000000e0c804d73f00000080fedbcc3f000000408c63b23f00000000d272a53f00000000b4d9993f0000002039eab73f00000020a22ad0bf00000080395c76bf000000c063febf3f0000002082c4c23f0000000069ae9b3f000000009f31c03f000000c071e9c4bf00000080d7d888bf00000000b2fd42bf000000e0b2b7d2bf00000060862bc03f00000000792b953f000000807a1cb6bf000000409353b2bf000000e00b99a43f00000040b1afd23f000000601715c03f000000e01340c5bf000000e06fa4b2bf00000060883dca3f000000c059b1cbbf000000403d9691bf000000c02f33b43f000000609ed8b2bf000000200e40cbbf00000080faedc8bf000000406fb5ab3f000000c01b73d63f00000040696eca3f000000a0aef1c6bf0000008031ea913f000000401024b2bf0000008019f576bf000000c05571be3f00000080f637a73f000000008a71aebf000000a02d1f8fbf00000020d74bbfbf000000c0b89380bf00000060158bc13f00000040188a703f000000a04b1cacbf00000040c04ec83f000000c002e5a1bf000000802dd3b03f0000000088f6373f0000000006408cbf0000000033ceb3bf0000008082277c3f000000e03c6bc0bf000000002377a4bf000000404fcb913f00000000c15abcbf00000020125c873f000000805593af3f000000a0c392c3bf00000000b015c13f000000407343a43f0000006016d4a4bf00000080c530b4bf000000a0227bbd3f000000a0bf13c6bf0000008013558fbf000000208348c33f000000602969d3bf000000c0f530ce3f000000c08260ca3f00000080ad6b673f0000004016dcbf3f0000008070139a3f000000c0d84b823f00000060410a963f00000060e2b6babf0000006071eab9bf000000e01afabdbf00000000e23587bf00000020a4c573bf0000000047efb83f0000002047f780bf),
	(2, 'mash', 'student_images/1200px-Mashrafe_Bin_Mortaza_cropped.jpg', _binary 0x000000a01580c2bf00000000fa4f983f000000a037e8b13f000000009ffcb4bf000000a05e81a4bf000000400106b8bf000000602943afbf00000080a94f96bf00000020ebf6be3f00000000c574abbf000000006d9ccf3f00000000786e91bf000000404297d2bf00000000fa85c0bf000000e0b6009c3f0000006078dbbb3f000000a00401bebf00000060b88ec3bf0000004019dbb0bf000000c06469bdbf00000060c368a73f000000e08f8a913f000000e00e64963f000000206b90b03f000000003840c0bf000000c078d3d9bf000000009adcbabf000000e05ec8c4bf000000c05953b0bf00000000800fc3bf000000e05c7c903f00000020413674bf00000020ea9fcabf00000060b83cbbbf00000040a429a73f000000a09055c03f000000e0aa83a13f0000000066aca3bf000000a073d5c43f00000000c2765c3f00000020aa9bbfbf000000a0aa608bbf000000a03258b23f000000600ddad13f000000002fbdbf3f0000008004efae3f000000e0e4f09b3f0000008075a99f3f000000005347ba3f00000060fd09cebf00000020dcb3b83f0000008094f3c33f000000e0145ac13f000000e0b1557d3f00000080e209be3f0000000065ddafbf000000e039d6a63f000000c08ee8bd3f00000080795cd1bf000000a01d4aa53f000000c03a97b63f000000e08ab39dbf000000000284c0bf00000020381799bf00000060b016ca3f00000040eeb4bc3f0000002070e1c3bf000000a034eec1bf00000020fe83bf3f0000008027b9c5bf00000080dba8a4bf000000802051b13f00000060bb18c5bf000000808315c2bf000000600a85d2bf000000809d4fb03f000000208b61d63f00000080f87cb73f00000040ae94c5bf00000020b196a43f0000004089f2bcbf000000405651803f000000e02ebc86bf000000e0705595bf000000c093d9a4bf000000801883b33f00000060c31fc0bf000000c0e07bb63f00000020af48bd3f000000c0945fac3f000000c0ca1599bf00000020ce1fc73f000000c0852e8cbf0000000071819e3f00000080bcf0b13f000000801b09b33f00000020fcd2b7bf000000c03daebbbf000000e0299ec0bf000000402a3971bf000000c0c406ad3f000000204ae1a1bf000000803f94a5bf000000c08710b03f000000607158c5bf000000003bcfb53f000000e012d7a3bf000000c04e97a8bf00000060b8bab0bf000000e09f46a63f000000e03577bebf000000c04c41b4bf00000020dd76b93f000000404356d1bf0000000021bcc13f0000008067bdc83f000000a0c40760bf000000200718b33f000000c0fc2b883f000000c08b6894bf000000e067bb9fbf00000080262eafbf00000040940cc7bf00000000ecb2c1bf00000000a4ee76bf000000001319883f0000006048edad3f00000040c5fe84bf),
	(3, 'sakib', 'student_images/Shakib_Al_Hasan_4_cropped.jpg', _binary 0x000000402775bebf000000e05275c13f000000200956b33f00000060c7daadbf000000c0fd64bfbf00000080e1cdb5bf000000e0b04d973f000000a04588babf000000a03751cf3f0000006001f2b0bf00000000c9c8ca3f00000060974caa3f000000a06ea9cfbf000000400c5abebf000000c0357d713f000000e093d2b83f000000c0a22db4bf00000080a379cebf000000a0aa86933f00000040e261b2bf000000c078f1803f0000000027259dbf000000808efeb53f000000609d2db93f000000e06646c4bf000000801cadd7bf000000204c41a1bf00000060d6ddc1bf000000c0710ab33f000000a04527b4bf0000008078f2adbf000000004e76b03f00000020ee68cbbf00000040b0aebfbf000000802b90693f000000a07d6ec23f000000401fdd97bf000000e0bc53b0bf000000809650c93f00000000937a97bf000000000c71c5bf000000007bcab0bf000000805bc5a93f0000002004dad03f00000080bb0dbf3f000000c0f3baad3f00000040abc3be3f000000c0d8458fbf00000040acbcc03f000000800625c8bf000000609c6db53f000000a0d927b43f00000000e4a0c13f00000040dd43983f000000400103a03f000000e01d05cdbf000000c06e26a93f000000a0bba7aa3f00000040937fd0bf00000000effbb73f000000807008b33f000000000d29a6bf0000008060bbb4bf000000c021579d3f0000002061b0d13f00000020d182bf3f0000000028c4adbf000000c043beb9bf00000000be09c93f00000000cfc6cbbf000000000d53a8bf00000040c549af3f00000060b986bcbf000000c0c249b8bf00000060e13bcdbf00000020683b963f0000000032f4d43f00000080ed03c13f000000802b3fb8bf000000c06a44933f000000c0f963adbf0000002077f9aa3f00000080cbd3a4bf00000000d2eb373f000000803fe1c6bf00000080eca7b43f000000009d3bc8bf000000406185883f00000040057acb3f000000002ca3af3f000000e06ecea9bf00000040867dc73f000000204b2ea83f00000080da80b13f000000609d4cb33f000000a0e8f2ac3f00000080107dc0bf000000006e7c603f00000060d4dcc1bf00000080893891bf000000c0b27fb43f00000000ef68babf000000801ccc673f000000009a5ab83f0000002001d1cebf00000000e089b73f00000080be01b0bf00000000843e353f000000404078a5bf00000060491ab43f00000000fab3bcbf000000408019b7bf000000204719b93f000000e0c504c8bf000000e070c1cc3f000000e0236fc93f000000e0c278b13f000000c051dbc23f000000e0ec5cb03f00000000882b93bf00000080bbbea03f000000e0ac7fabbf0000002039a9b7bf000000006f15c0bf0000004069bca63f000000e02218babf000000403303c03f00000020c551b73f),
	(4, 'Sachin', 'student_images/Sachin-Tendulkars-Biography.jpg', _binary 0x000000c001d2afbf00000020794cc53f000000208a0db03f000000407b6fb3bf00000000dd58a3bf000000a07a979ebf000000c0564bbbbf000000406798b8bf000000c0624ec13f000000808531a2bf00000000c2e7d13f000000c0de1f693f000000c0ce0fcdbf000000807876c7bf000000409498b6bf00000080d84aba3f00000020082dbfbf000000405967bcbf00000060d433aabf00000060688cacbf000000e0ca8ab1bf000000a0182573bf000000e0c380a63f000000c0475594bf00000040be18a2bf00000000bb3ddabf000000c0fc85babf00000040cf02b1bf000000a035b8b53f000000400dedb4bf00000040f5c491bf000000207de3a83f000000a03f60c8bf000000a0f831b7bf000000c00161a83f000000200447a93f000000c06b777fbf0000000094a39b3f00000080ee18c73f000000e055a3a73f000000603f32b5bf0000004045c9a2bf00000080dea09f3f000000209453d23f0000008072dac73f000000c0bcbcbe3f000000a017faab3f000000c00738b2bf000000008af3b43f000000c0bb9dcabf000000c0d5fbc23f0000002065ccc13f00000020d1e1c63f00000080f7767c3f000000e0a70ac13f000000e0526dc4bf00000000fa9f4fbf00000080e371c33f000000c02e44d0bf000000a0106caf3f000000409c4d923f000000c0b880783f000000409a55b7bf00000040a5b68dbf000000e09bd5d13f0000008057c5c63f00000040c909babf00000020f948c2bf000000c0a369cf3f000000603dc8c3bf000000e02429a43f000000a038d8b33f000000a0a92a9bbf000000401069c2bf00000040e15bcfbf0000002027e8b13f000000e07429d43f000000402bdfca3f0000008081efc7bf0000004085f476bf000000203f07b5bf0000000030b7a6bf000000009085ad3f000000003712a2bf000000808f19c9bf0000008003cc943f00000080cf43b4bf000000a051abaebf00000040caafc03f000000c0ed29b53f000000c00615b2bf0000004003b6ca3f000000a0706fa1bf00000000c042a43f00000020f775b03f0000008086eea0bf000000a0c14bb7bf000000201523a0bf000000402501c4bf0000004034adb0bf000000400dab9a3f00000020d66eb9bf000000001cb63c3f00000000ec60b63f000000607e7ec5bf000000e0e16eb53f000000004886a1bf00000080be018fbf00000060d6d192bf00000000fa023f3f000000e0a724adbf000000e06133adbf00000080655ec63f0000000062ddd3bf00000060e11ecd3f00000060a8ebbe3f000000408813a13f00000000d707c43f00000080e7dfbc3f000000001375a13f000000c084eda23f000000c0c046c2bf00000040d95fb0bf000000009a91bbbf00000020a438903f000000008b39bebf0000000051b5ba3f000000c0ee98923f);

-- Dumping structure for table student_db.profiles_university
CREATE TABLE IF NOT EXISTS `profiles_university` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `established_year` int NOT NULL,
  `website` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table student_db.profiles_university: ~4 rows (approximately)
INSERT INTO `profiles_university` (`id`, `name`, `location`, `established_year`, `website`) VALUES
	(2, 'DIU', 'Dhaka', 2003, 'https://www.qorecyqufaj.mobi'),
	(4, 'RUET', 'Rajshahi', 1997, 'https://www.ryneqej.com'),
	(5, 'DU', 'Dhaka', 2008, 'https://www.bevixaxeqe.org.au'),
	(6, 'UIU', 'Dhaka', 1995, 'https://www.vocisocenut.co'),
	(7, 'BUET', 'Dhaka', 1995, 'https://www.ryneqej.com');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
