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
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table student_db.auth_group: ~0 rows (approximately)
INSERT INTO `auth_group` (`id`, `name`) VALUES
	(1, 'student');

-- Dumping structure for table student_db.auth_group_permissions
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table student_db.auth_group_permissions: ~0 rows (approximately)
INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
	(1, 1, 31);

-- Dumping structure for table student_db.auth_permission
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table student_db.auth_permission: ~32 rows (approximately)
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
DROP TABLE IF EXISTS `auth_user`;
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
	(1, 'pbkdf2_sha256$870000$36FKosGECxRGTYn7yxb0u3$vND1zrJvLAM6oJdq/5WMAeF8nUGJ95G5l0e5BA2kXRk=', '2024-12-05 03:24:50.855033', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2024-11-24 23:10:01.328245'),
	(2, 'pbkdf2_sha256$870000$fI6R3aPMPwMteplzTMuBzR$xmgRk4Rni5V2OKgcWQ8bBsqNg5SMIWMnVA+BkHDuo/w=', '2024-12-05 05:22:25.608643', 1, 'shamim901', '', '', 'shamim@gmail.com', 1, 1, '2024-11-25 00:14:50.397110');

-- Dumping structure for table student_db.auth_user_groups
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table student_db.auth_user_groups: ~0 rows (approximately)

-- Dumping structure for table student_db.auth_user_user_permissions
DROP TABLE IF EXISTS `auth_user_user_permissions`;
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
DROP TABLE IF EXISTS `django_admin_log`;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table student_db.django_admin_log: ~5 rows (approximately)
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2024-11-24 23:13:38.540223', '1', 'Shamim Reza', 1, '[{"added": {}}]', 7, 1),
	(2, '2024-11-25 17:31:21.422022', '4', 'RUET', 1, '[{"added": {}}]', 8, 2),
	(3, '2024-12-04 01:58:23.344892', '1', 'student', 1, '[{"added": {}}]', 3, 1),
	(4, '2024-12-06 03:43:27.480344', '1', 'StudentProfile object (1)', 1, '[{"added": {}}]', 9, 2),
	(5, '2024-12-06 03:45:18.044451', '2', 'StudentProfile object (2)', 1, '[{"added": {}}]', 9, 2),
	(6, '2024-12-06 03:51:28.618396', '3', 'StudentProfile object (3)', 1, '[{"added": {}}]', 9, 2);

-- Dumping structure for table student_db.django_content_type
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table student_db.django_content_type: ~8 rows (approximately)
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
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table student_db.django_migrations: ~20 rows (approximately)
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
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table student_db.django_session: ~3 rows (approximately)
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('ih2id2pm8ind6det930qrpwdipr6tz5i', '.eJxVjEEOwiAQRe_C2hAKTKEu3fcMZGAYqRqalHZlvLtt0oVu_3v_vUXAbS1ha3kJE4mr0OLyu0VMz1wPQA-s91mmua7LFOWhyJM2Oc6UX7fT_QsUbGV_-6wi2ISKvR80A6JynHs0npXJkfdSNIPrLaakwHTUgXbkEIgNMVjx-QIDGTi7:1tJ4Jl:_eipLusd-3peis_m5YmLQNpSl3snEHxD9EfSk0DhZ0A', '2024-12-19 05:22:25.610432'),
	('iyodx8d3cufadmoqru7dw8je1dup2b2m', '.eJxVjEEOwiAQRe_C2hAKTKEu3fcMZGAYqRqalHZlvLtt0oVu_3v_vUXAbS1ha3kJE4mr0OLyu0VMz1wPQA-s91mmua7LFOWhyJM2Oc6UX7fT_QsUbGV_-6wi2ISKvR80A6JynHs0npXJkfdSNIPrLaakwHTUgXbkEIgNMVjx-QIDGTi7:1tHKBN:pgRzishOlCC-d9kpNEHLcZuK4pkEJfts60LNofLNuc0', '2024-12-14 09:54:33.233895'),
	('my647hhuqf6npqzcjvndoe6acqjy78ex', '.eJxVjEEOwiAQRe_C2hAKTKEu3fcMZGAYqRqalHZlvLtt0oVu_3v_vUXAbS1ha3kJE4mr0OLyu0VMz1wPQA-s91mmua7LFOWhyJM2Oc6UX7fT_QsUbGV_-6wi2ISKvR80A6JynHs0npXJkfdSNIPrLaakwHTUgXbkEIgNMVjx-QIDGTi7:1tHDU8:abng2GcluMRxIvDd9zeiypVJCVrLC44mjeXixM7Rea0', '2024-12-14 02:45:28.207326');

-- Dumping structure for table student_db.profiles_agegender
DROP TABLE IF EXISTS `profiles_agegender`;
CREATE TABLE IF NOT EXISTS `profiles_agegender` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table student_db.profiles_agegender: ~0 rows (approximately)
INSERT INTO `profiles_agegender` (`id`, `image`, `uploaded_at`) VALUES
	(1, 'age_gender_prediction/Shakib_Al_Hasan_4_cropped_mIFsjnZ.jpg', '2024-12-13 04:39:00.688798'),
	(2, 'age_gender_prediction/Shakib_Al_Hasan_4_cropped_MNJ7QXZ.jpg', '2024-12-13 04:39:10.608123'),

-- Dumping structure for table student_db.profiles_student
DROP TABLE IF EXISTS `profiles_student`;
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
DROP TABLE IF EXISTS `profiles_studentprofile`;
CREATE TABLE IF NOT EXISTS `profiles_studentprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `face_encoding` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table student_db.profiles_studentprofile: ~2 rows (approximately)
INSERT INTO `profiles_studentprofile` (`id`, `name`, `image`, `face_encoding`) VALUES
	(1, 'Shamim Reza', 'student_images/464205714_1310911293614494_2315497819180808117_n.jpg', _binary 0x0000006077c5c8bf000000c03976b73f000000202ef987bf000000a03c6da4bf000000a08031ae3f000000c0ccefb0bf000000e067bd9c3f00000060071cb1bf00000000310ac63f000000804b41b1bf00000080f640c23f000000c070f0b4bf000000c08619ccbf00000020cd70c3bf000000003a7f693f000000e0e17cc43f000000e09235c5bf000000a051c5c3bf0000008058f8a3bf000000e09c28bbbf0000002079daad3f000000809379933f00000000d5c9a5bf000000e0c424b13f0000008042c1c3bf0000008002c0d6bf000000806fbba9bf000000803e2cc3bf00000000911495bf00000000a43bb2bf000000c0a3b9a53f000000c0d95ba03f000000602052babf000000c03bf680bf000000002224a03f000000604222c33f00000040612199bf000000809314ab3f000000a0cfe9c93f000000600832a23f000000201184c2bf000000a045928fbf00000020589ca83f000000c0a98bd83f0000004037c4c43f00000000d975b93f0000008055d07a3f0000000023307a3f000000c062e1be3f0000000089a0d0bf00000040bb648ebf000000004e8ec13f00000080dfe5b83f00000040e274ad3f00000000aa4bc03f000000c0c1d6c1bf00000040b02b8a3f000000c0f67fa63f00000000e047d1bf000000c0508fb83f0000000045597b3f000000409ec2b0bf000000207f7eafbf00000000c44f283f00000080b49ccf3f000000209bdfb43f00000060b698c6bf0000000037faafbf000000009405c83f0000002047edcbbf000000e0555d96bf000000e0b200ac3f000000e0c698aabf000000e0890ccebf000000c0c675cdbf000000a0898a9c3f00000020f867d73f000000c06d41c73f000000002a5fc7bf000000a045b9a53f00000080821b88bf00000060caf697bf00000060c1eac13f00000060df4ab63f000000602f57b2bf000000202394af3f00000060acf9b7bf000000808a8491bf000000005cf6c33f00000000538ca03f000000e04289a9bf000000403f17c83f00000000aa747fbf00000080cb0ca53f00000000866641bf00000040318b79bf00000000ca94b6bf00000040d4f36bbf000000e031cbbdbf000000e0fbfbb0bf000000004106b53f00000040e597b7bf000000404760a43f000000c0e936a83f0000000001a8c4bf000000404918cd3f000000200dab993f000000004369923f000000806338b6bf000000802395bc3f000000c093a8babf000000e09a33a63f00000020398cc33f000000a0df86d0bf000000a0444bcb3f000000c057c0cc3f000000402d8098bf0000000050b8c23f00000040004aa93f000000c05d9d713f000000a087a4843f00000020203f89bf0000000032b8c2bf000000203ea3bdbf00000080fad18fbf00000060d8819bbf00000060e6a6bd3f000000404bb0973f),
	(2, 'mash', 'student_images/1200px-Mashrafe_Bin_Mortaza_cropped.jpg', _binary 0x000000a01580c2bf00000000fa4f983f000000a037e8b13f000000009ffcb4bf000000a05e81a4bf000000400106b8bf000000602943afbf00000080a94f96bf00000020ebf6be3f00000000c574abbf000000006d9ccf3f00000000786e91bf000000404297d2bf00000000fa85c0bf000000e0b6009c3f0000006078dbbb3f000000a00401bebf00000060b88ec3bf0000004019dbb0bf000000c06469bdbf00000060c368a73f000000e08f8a913f000000e00e64963f000000206b90b03f000000003840c0bf000000c078d3d9bf000000009adcbabf000000e05ec8c4bf000000c05953b0bf00000000800fc3bf000000e05c7c903f00000020413674bf00000020ea9fcabf00000060b83cbbbf00000040a429a73f000000a09055c03f000000e0aa83a13f0000000066aca3bf000000a073d5c43f00000000c2765c3f00000020aa9bbfbf000000a0aa608bbf000000a03258b23f000000600ddad13f000000002fbdbf3f0000008004efae3f000000e0e4f09b3f0000008075a99f3f000000005347ba3f00000060fd09cebf00000020dcb3b83f0000008094f3c33f000000e0145ac13f000000e0b1557d3f00000080e209be3f0000000065ddafbf000000e039d6a63f000000c08ee8bd3f00000080795cd1bf000000a01d4aa53f000000c03a97b63f000000e08ab39dbf000000000284c0bf00000020381799bf00000060b016ca3f00000040eeb4bc3f0000002070e1c3bf000000a034eec1bf00000020fe83bf3f0000008027b9c5bf00000080dba8a4bf000000802051b13f00000060bb18c5bf000000808315c2bf000000600a85d2bf000000809d4fb03f000000208b61d63f00000080f87cb73f00000040ae94c5bf00000020b196a43f0000004089f2bcbf000000405651803f000000e02ebc86bf000000e0705595bf000000c093d9a4bf000000801883b33f00000060c31fc0bf000000c0e07bb63f00000020af48bd3f000000c0945fac3f000000c0ca1599bf00000020ce1fc73f000000c0852e8cbf0000000071819e3f00000080bcf0b13f000000801b09b33f00000020fcd2b7bf000000c03daebbbf000000e0299ec0bf000000402a3971bf000000c0c406ad3f000000204ae1a1bf000000803f94a5bf000000c08710b03f000000607158c5bf000000003bcfb53f000000e012d7a3bf000000c04e97a8bf00000060b8bab0bf000000e09f46a63f000000e03577bebf000000c04c41b4bf00000020dd76b93f000000404356d1bf0000000021bcc13f0000008067bdc83f000000a0c40760bf000000200718b33f000000c0fc2b883f000000c08b6894bf000000e067bb9fbf00000080262eafbf00000040940cc7bf00000000ecb2c1bf00000000a4ee76bf000000001319883f0000006048edad3f00000040c5fe84bf),
	(3, 'sakib', 'student_images/Shakib_Al_Hasan_4_cropped.jpg', _binary 0x000000402775bebf000000e05275c13f000000200956b33f00000060c7daadbf000000c0fd64bfbf00000080e1cdb5bf000000e0b04d973f000000a04588babf000000a03751cf3f0000006001f2b0bf00000000c9c8ca3f00000060974caa3f000000a06ea9cfbf000000400c5abebf000000c0357d713f000000e093d2b83f000000c0a22db4bf00000080a379cebf000000a0aa86933f00000040e261b2bf000000c078f1803f0000000027259dbf000000808efeb53f000000609d2db93f000000e06646c4bf000000801cadd7bf000000204c41a1bf00000060d6ddc1bf000000c0710ab33f000000a04527b4bf0000008078f2adbf000000004e76b03f00000020ee68cbbf00000040b0aebfbf000000802b90693f000000a07d6ec23f000000401fdd97bf000000e0bc53b0bf000000809650c93f00000000937a97bf000000000c71c5bf000000007bcab0bf000000805bc5a93f0000002004dad03f00000080bb0dbf3f000000c0f3baad3f00000040abc3be3f000000c0d8458fbf00000040acbcc03f000000800625c8bf000000609c6db53f000000a0d927b43f00000000e4a0c13f00000040dd43983f000000400103a03f000000e01d05cdbf000000c06e26a93f000000a0bba7aa3f00000040937fd0bf00000000effbb73f000000807008b33f000000000d29a6bf0000008060bbb4bf000000c021579d3f0000002061b0d13f00000020d182bf3f0000000028c4adbf000000c043beb9bf00000000be09c93f00000000cfc6cbbf000000000d53a8bf00000040c549af3f00000060b986bcbf000000c0c249b8bf00000060e13bcdbf00000020683b963f0000000032f4d43f00000080ed03c13f000000802b3fb8bf000000c06a44933f000000c0f963adbf0000002077f9aa3f00000080cbd3a4bf00000000d2eb373f000000803fe1c6bf00000080eca7b43f000000009d3bc8bf000000406185883f00000040057acb3f000000002ca3af3f000000e06ecea9bf00000040867dc73f000000204b2ea83f00000080da80b13f000000609d4cb33f000000a0e8f2ac3f00000080107dc0bf000000006e7c603f00000060d4dcc1bf00000080893891bf000000c0b27fb43f00000000ef68babf000000801ccc673f000000009a5ab83f0000002001d1cebf00000000e089b73f00000080be01b0bf00000000843e353f000000404078a5bf00000060491ab43f00000000fab3bcbf000000408019b7bf000000204719b93f000000e0c504c8bf000000e070c1cc3f000000e0236fc93f000000e0c278b13f000000c051dbc23f000000e0ec5cb03f00000000882b93bf00000080bbbea03f000000e0ac7fabbf0000002039a9b7bf000000006f15c0bf0000004069bca63f000000e02218babf000000403303c03f00000020c551b73f);

-- Dumping structure for table student_db.profiles_university
DROP TABLE IF EXISTS `profiles_university`;
CREATE TABLE IF NOT EXISTS `profiles_university` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `established_year` int NOT NULL,
  `website` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table student_db.profiles_university: ~4 rows (approximately)
INSERT INTO `profiles_university` (`id`, `name`, `location`, `established_year`, `website`) VALUES
	(2, 'DIU', 'Dhaka', 2003, 'https://www.qorecyqufaj.mobi'),
	(4, 'RUET', 'Rajshahi', 1997, 'https://www.ryneqej.com'),
	(5, 'DU', 'Dhaka', 2008, 'https://www.bevixaxeqe.org.au'),
	(6, 'UIU', 'Dhaka', 1995, 'https://www.vocisocenut.co');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
