/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.33 : Database - sub_eval
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sub_eval` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `sub_eval`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add assignedsubject_table',7,'add_assignedsubject_table'),
(26,'Can change assignedsubject_table',7,'change_assignedsubject_table'),
(27,'Can delete assignedsubject_table',7,'delete_assignedsubject_table'),
(28,'Can view assignedsubject_table',7,'view_assignedsubject_table'),
(29,'Can add course_table',8,'add_course_table'),
(30,'Can change course_table',8,'change_course_table'),
(31,'Can delete course_table',8,'delete_course_table'),
(32,'Can view course_table',8,'view_course_table'),
(33,'Can add department_table',9,'add_department_table'),
(34,'Can change department_table',9,'change_department_table'),
(35,'Can delete department_table',9,'delete_department_table'),
(36,'Can view department_table',9,'view_department_table'),
(37,'Can add exam_table',10,'add_exam_table'),
(38,'Can change exam_table',10,'change_exam_table'),
(39,'Can delete exam_table',10,'delete_exam_table'),
(40,'Can view exam_table',10,'view_exam_table'),
(41,'Can add login_table',11,'add_login_table'),
(42,'Can change login_table',11,'change_login_table'),
(43,'Can delete login_table',11,'delete_login_table'),
(44,'Can view login_table',11,'view_login_table'),
(45,'Can add subject_table',12,'add_subject_table'),
(46,'Can change subject_table',12,'change_subject_table'),
(47,'Can delete subject_table',12,'delete_subject_table'),
(48,'Can view subject_table',12,'view_subject_table'),
(49,'Can add video_table',13,'add_video_table'),
(50,'Can change video_table',13,'change_video_table'),
(51,'Can delete video_table',13,'delete_video_table'),
(52,'Can view video_table',13,'view_video_table'),
(53,'Can add student_table',14,'add_student_table'),
(54,'Can change student_table',14,'change_student_table'),
(55,'Can delete student_table',14,'delete_student_table'),
(56,'Can view student_table',14,'view_student_table'),
(57,'Can add staff_table',15,'add_staff_table'),
(58,'Can change staff_table',15,'change_staff_table'),
(59,'Can delete staff_table',15,'delete_staff_table'),
(60,'Can view staff_table',15,'view_staff_table'),
(61,'Can add questions_table',16,'add_questions_table'),
(62,'Can change questions_table',16,'change_questions_table'),
(63,'Can delete questions_table',16,'delete_questions_table'),
(64,'Can view questions_table',16,'view_questions_table'),
(65,'Can add materials_table',17,'add_materials_table'),
(66,'Can change materials_table',17,'change_materials_table'),
(67,'Can delete materials_table',17,'delete_materials_table'),
(68,'Can view materials_table',17,'view_materials_table'),
(69,'Can add hod_table',18,'add_hod_table'),
(70,'Can change hod_table',18,'change_hod_table'),
(71,'Can delete hod_table',18,'delete_hod_table'),
(72,'Can view hod_table',18,'view_hod_table'),
(73,'Can add complaint_table',19,'add_complaint_table'),
(74,'Can change complaint_table',19,'change_complaint_table'),
(75,'Can delete complaint_table',19,'delete_complaint_table'),
(76,'Can view complaint_table',19,'view_complaint_table');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(6,'sessions','session'),
(7,'subapp','assignedsubject_table'),
(19,'subapp','complaint_table'),
(8,'subapp','course_table'),
(9,'subapp','department_table'),
(10,'subapp','exam_table'),
(18,'subapp','hod_table'),
(11,'subapp','login_table'),
(17,'subapp','materials_table'),
(16,'subapp','questions_table'),
(15,'subapp','staff_table'),
(14,'subapp','student_table'),
(12,'subapp','subject_table'),
(13,'subapp','video_table');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2024-03-18 06:05:34.557179'),
(2,'auth','0001_initial','2024-03-18 06:05:35.075227'),
(3,'admin','0001_initial','2024-03-18 06:05:35.194688'),
(4,'admin','0002_logentry_remove_auto_add','2024-03-18 06:05:35.194688'),
(5,'admin','0003_logentry_add_action_flag_choices','2024-03-18 06:05:35.213223'),
(6,'contenttypes','0002_remove_content_type_name','2024-03-18 06:05:35.279728'),
(7,'auth','0002_alter_permission_name_max_length','2024-03-18 06:05:35.323781'),
(8,'auth','0003_alter_user_email_max_length','2024-03-18 06:05:35.341626'),
(9,'auth','0004_alter_user_username_opts','2024-03-18 06:05:35.357846'),
(10,'auth','0005_alter_user_last_login_null','2024-03-18 06:05:35.417267'),
(11,'auth','0006_require_contenttypes_0002','2024-03-18 06:05:35.417267'),
(12,'auth','0007_alter_validators_add_error_messages','2024-03-18 06:05:35.433978'),
(13,'auth','0008_alter_user_username_max_length','2024-03-18 06:05:35.487616'),
(14,'auth','0009_alter_user_last_name_max_length','2024-03-18 06:05:35.541404'),
(15,'auth','0010_alter_group_name_max_length','2024-03-18 06:05:35.559968'),
(16,'auth','0011_update_proxy_permissions','2024-03-18 06:05:35.575954'),
(17,'auth','0012_alter_user_first_name_max_length','2024-03-18 06:05:35.617990'),
(18,'sessions','0001_initial','2024-03-18 06:05:35.653689'),
(19,'subapp','0001_initial','2024-03-18 06:05:36.464051');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

/*Table structure for table `subapp_assignedsubject_table` */

DROP TABLE IF EXISTS `subapp_assignedsubject_table`;

CREATE TABLE `subapp_assignedsubject_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `staffid_id` bigint NOT NULL,
  `subject_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subapp_assignedsubje_staffid_id_b4604a92_fk_subapp_st` (`staffid_id`),
  KEY `subapp_assignedsubje_subject_id_00da96dc_fk_subapp_su` (`subject_id`),
  CONSTRAINT `subapp_assignedsubje_staffid_id_b4604a92_fk_subapp_st` FOREIGN KEY (`staffid_id`) REFERENCES `subapp_staff_table` (`id`),
  CONSTRAINT `subapp_assignedsubje_subject_id_00da96dc_fk_subapp_su` FOREIGN KEY (`subject_id`) REFERENCES `subapp_subject_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `subapp_assignedsubject_table` */

/*Table structure for table `subapp_complaint_table` */

DROP TABLE IF EXISTS `subapp_complaint_table`;

CREATE TABLE `subapp_complaint_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `complaint` varchar(200) NOT NULL,
  `reply` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `STUDENT_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subapp_complaint_tab_STUDENT_id_be41c393_fk_subapp_st` (`STUDENT_id`),
  CONSTRAINT `subapp_complaint_tab_STUDENT_id_be41c393_fk_subapp_st` FOREIGN KEY (`STUDENT_id`) REFERENCES `subapp_student_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `subapp_complaint_table` */

/*Table structure for table `subapp_course_table` */

DROP TABLE IF EXISTS `subapp_course_table`;

CREATE TABLE `subapp_course_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `coursename` varchar(100) NOT NULL,
  `department_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subapp_course_table_department_id_8b2a0d97_fk_subapp_de` (`department_id`),
  CONSTRAINT `subapp_course_table_department_id_8b2a0d97_fk_subapp_de` FOREIGN KEY (`department_id`) REFERENCES `subapp_department_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `subapp_course_table` */

/*Table structure for table `subapp_department_table` */

DROP TABLE IF EXISTS `subapp_department_table`;

CREATE TABLE `subapp_department_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `departmentname` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `subapp_department_table` */

insert  into `subapp_department_table`(`id`,`departmentname`) values 
(1,''),
(2,'hknmbmn'),
(3,'');

/*Table structure for table `subapp_exam_table` */

DROP TABLE IF EXISTS `subapp_exam_table`;

CREATE TABLE `subapp_exam_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `examname` varchar(100) NOT NULL,
  `examdate` date NOT NULL,
  `uploaddata` varchar(200) NOT NULL,
  `subjectassignedid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subapp_exam_table_subjectassignedid_id_c17a40bf_fk_subapp_as` (`subjectassignedid_id`),
  CONSTRAINT `subapp_exam_table_subjectassignedid_id_c17a40bf_fk_subapp_as` FOREIGN KEY (`subjectassignedid_id`) REFERENCES `subapp_assignedsubject_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `subapp_exam_table` */

/*Table structure for table `subapp_hod_table` */

DROP TABLE IF EXISTS `subapp_hod_table`;

CREATE TABLE `subapp_hod_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` bigint NOT NULL,
  `place` varchar(100) NOT NULL,
  `pin` int NOT NULL,
  `post` varchar(100) NOT NULL,
  `dep_id` bigint NOT NULL,
  `login_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subapp_hod_table_dep_id_e1135dab_fk_subapp_department_table_id` (`dep_id`),
  KEY `subapp_hod_table_login_id_f3245a5d_fk_subapp_login_table_id` (`login_id`),
  CONSTRAINT `subapp_hod_table_dep_id_e1135dab_fk_subapp_department_table_id` FOREIGN KEY (`dep_id`) REFERENCES `subapp_department_table` (`id`),
  CONSTRAINT `subapp_hod_table_login_id_f3245a5d_fk_subapp_login_table_id` FOREIGN KEY (`login_id`) REFERENCES `subapp_login_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `subapp_hod_table` */

/*Table structure for table `subapp_login_table` */

DROP TABLE IF EXISTS `subapp_login_table`;

CREATE TABLE `subapp_login_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `subapp_login_table` */

insert  into `subapp_login_table`(`id`,`username`,`password`,`type`) values 
(1,'admin','admin','admin');

/*Table structure for table `subapp_materials_table` */

DROP TABLE IF EXISTS `subapp_materials_table`;

CREATE TABLE `subapp_materials_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `studymaterial` varchar(100) NOT NULL,
  `subject_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subapp_materials_tab_subject_id_a5d65c39_fk_subapp_su` (`subject_id`),
  CONSTRAINT `subapp_materials_tab_subject_id_a5d65c39_fk_subapp_su` FOREIGN KEY (`subject_id`) REFERENCES `subapp_subject_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `subapp_materials_table` */

/*Table structure for table `subapp_questions_table` */

DROP TABLE IF EXISTS `subapp_questions_table`;

CREATE TABLE `subapp_questions_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `questions` varchar(500) NOT NULL,
  `answers` varchar(500) NOT NULL,
  `Exam_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subapp_questions_table_Exam_id_f897340c_fk_subapp_exam_table_id` (`Exam_id`),
  CONSTRAINT `subapp_questions_table_Exam_id_f897340c_fk_subapp_exam_table_id` FOREIGN KEY (`Exam_id`) REFERENCES `subapp_exam_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `subapp_questions_table` */

/*Table structure for table `subapp_staff_table` */

DROP TABLE IF EXISTS `subapp_staff_table`;

CREATE TABLE `subapp_staff_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` bigint NOT NULL,
  `place` varchar(100) NOT NULL,
  `pin` int NOT NULL,
  `post` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `login_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subapp_staff_table_login_id_e6f8beb2_fk_subapp_login_table_id` (`login_id`),
  CONSTRAINT `subapp_staff_table_login_id_e6f8beb2_fk_subapp_login_table_id` FOREIGN KEY (`login_id`) REFERENCES `subapp_login_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `subapp_staff_table` */

/*Table structure for table `subapp_student_table` */

DROP TABLE IF EXISTS `subapp_student_table`;

CREATE TABLE `subapp_student_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` bigint NOT NULL,
  `place` varchar(100) NOT NULL,
  `pin` int NOT NULL,
  `post` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `course_id` bigint NOT NULL,
  `login_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subapp_student_table_course_id_e956c22f_fk_subapp_co` (`course_id`),
  KEY `subapp_student_table_login_id_d1db49a7_fk_subapp_login_table_id` (`login_id`),
  CONSTRAINT `subapp_student_table_course_id_e956c22f_fk_subapp_co` FOREIGN KEY (`course_id`) REFERENCES `subapp_course_table` (`id`),
  CONSTRAINT `subapp_student_table_login_id_d1db49a7_fk_subapp_login_table_id` FOREIGN KEY (`login_id`) REFERENCES `subapp_login_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `subapp_student_table` */

/*Table structure for table `subapp_subject_table` */

DROP TABLE IF EXISTS `subapp_subject_table`;

CREATE TABLE `subapp_subject_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subjectname` varchar(100) NOT NULL,
  `courseid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subapp_subject_table_courseid_id_7a0a37bb_fk_subapp_co` (`courseid_id`),
  CONSTRAINT `subapp_subject_table_courseid_id_7a0a37bb_fk_subapp_co` FOREIGN KEY (`courseid_id`) REFERENCES `subapp_course_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `subapp_subject_table` */

/*Table structure for table `subapp_video_table` */

DROP TABLE IF EXISTS `subapp_video_table`;

CREATE TABLE `subapp_video_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `video` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `subject_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subapp_video_table_subject_id_9cce0724_fk_subapp_su` (`subject_id`),
  CONSTRAINT `subapp_video_table_subject_id_9cce0724_fk_subapp_su` FOREIGN KEY (`subject_id`) REFERENCES `subapp_subject_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `subapp_video_table` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
