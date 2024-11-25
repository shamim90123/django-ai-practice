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

-- Dumping structure for table student_db.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table student_db.auth_group: ~0 rows (approximately)

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table student_db.auth_group_permissions: ~0 rows (approximately)

-- Dumping structure for table student_db.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
	(32, 'Can view university', 8, 'view_university');

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

-- Dumping data for table student_db.auth_user: ~0 rows (approximately)
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$870000$36FKosGECxRGTYn7yxb0u3$vND1zrJvLAM6oJdq/5WMAeF8nUGJ95G5l0e5BA2kXRk=', '2024-11-25 00:42:27.748231', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2024-11-24 23:10:01.328245'),
	(2, 'pbkdf2_sha256$870000$fI6R3aPMPwMteplzTMuBzR$xmgRk4Rni5V2OKgcWQ8bBsqNg5SMIWMnVA+BkHDuo/w=', '2024-11-25 17:33:08.766241', 1, 'shamim901', '', '', 'shamim@gmail.com', 1, 1, '2024-11-25 00:14:50.397110');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table student_db.auth_user_groups: ~0 rows (approximately)

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table student_db.django_admin_log: ~0 rows (approximately)
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2024-11-24 23:13:38.540223', '1', 'Shamim Reza', 1, '[{"added": {}}]', 7, 1),
	(2, '2024-11-25 17:31:21.422022', '4', 'RUET', 1, '[{"added": {}}]', 8, 2);

-- Dumping structure for table student_db.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table student_db.django_content_type: ~7 rows (approximately)
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(7, 'profiles', 'student'),
	(8, 'profiles', 'university'),
	(6, 'sessions', 'session');

-- Dumping structure for table student_db.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table student_db.django_migrations: ~5 rows (approximately)
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
	(21, 'profiles', '0003_remove_university_established_date_and_more', '2024-11-25 16:57:58.786329');

-- Dumping structure for table student_db.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table student_db.django_session: ~0 rows (approximately)
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('lck4fd8zn8kcmqyjb6hjiydyxnmaynyw', '.eJxVjEEOwiAQRe_C2hAKTKEu3fcMZGAYqRqalHZlvLtt0oVu_3v_vUXAbS1ha3kJE4mr0OLyu0VMz1wPQA-s91mmua7LFOWhyJM2Oc6UX7fT_QsUbGV_-6wi2ISKvR80A6JynHs0npXJkfdSNIPrLaakwHTUgXbkEIgNMVjx-QIDGTi7:1tFcxQ:f690ZKw-jjp-i7wArEYR30z4ezDqde_VwIq0ZPtHADI', '2024-12-09 17:33:08.768398');

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

-- Dumping structure for table student_db.profiles_university
CREATE TABLE IF NOT EXISTS `profiles_university` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `established_year` int NOT NULL,
  `website` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table student_db.profiles_university: ~0 rows (approximately)
INSERT INTO `profiles_university` (`id`, `name`, `location`, `established_year`, `website`) VALUES
	(2, 'DIU', 'Dhaka', 2003, 'https://www.qorecyqufaj.mobi'),
	(4, 'RUET', 'Dhaka', 1997, 'https://www.ryneqej.com'),
	(5, 'Veronica Burks', 'Adipisicing consequu', 2008, 'https://www.bevixaxeqe.org.au'),
	(6, 'Sybill Fulton', 'Tempore iusto in an3', 1995, 'https://www.vocisocenut.co');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
