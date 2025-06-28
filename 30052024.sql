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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$720000$7Bw5HaZnN8V9X7lROjVI5f$2ROtS/vjX5wm2Rd7+FZZSNcFcCu+zkYDiarpuYOYXPg=','2024-05-29 05:31:37.611192',1,'admin','','','admin@gmail.com',1,1,'2024-05-14 07:00:20.301079');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `subapp_assignedsubject_table` */

insert  into `subapp_assignedsubject_table`(`id`,`staffid_id`,`subject_id`) values 
(1,1,1),
(2,2,4),
(3,3,5),
(4,4,3);

/*Table structure for table `subapp_attendexam_table` */

DROP TABLE IF EXISTS `subapp_attendexam_table`;

CREATE TABLE `subapp_attendexam_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `answers` varchar(500) NOT NULL,
  `mark` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `questions_id` bigint NOT NULL,
  `studentid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subapp_attendexam_ta_questions_id_3f1ce412_fk_subapp_qu` (`questions_id`),
  KEY `subapp_attendexam_ta_studentid_id_d93e1525_fk_subapp_st` (`studentid_id`),
  CONSTRAINT `subapp_attendexam_ta_questions_id_3f1ce412_fk_subapp_qu` FOREIGN KEY (`questions_id`) REFERENCES `subapp_questions_table` (`id`),
  CONSTRAINT `subapp_attendexam_ta_studentid_id_d93e1525_fk_subapp_st` FOREIGN KEY (`studentid_id`) REFERENCES `subapp_student_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `subapp_attendexam_table` */

insert  into `subapp_attendexam_table`(`id`,`date`,`answers`,`mark`,`status`,`questions_id`,`studentid_id`) values 
(56,'2024-05-20','stack is a data structure.used to store data in lasat in first out manner.insertion operation called push.deletion operation is called pop.','3.2399999999999998','pending',8,1),
(57,'2024-05-20','queue is first in first out principal ','2.82','pending',9,1),
(58,'2024-05-20','stack\nqueue \nlinked list \ntree\n','2.24','pending',10,1),
(59,'2024-05-30','Database Management Systems are software systems used to store, retrieve, and run queries on data. A DBMS serves as an interface between an end-user and a database, allowing users to create, read, update, and delete data in the database.','5.0','pending',15,1),
(60,'2024-05-30','DBMS  are software systems used to store, retrieve, and run queries on data. it  serves as an interface between an end-user and a database, allowing users to create, read, update, and delete data in the database.','4.800000000000001','pending',15,2);

/*Table structure for table `subapp_chat_table` */

DROP TABLE IF EXISTS `subapp_chat_table`;

CREATE TABLE `subapp_chat_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` varchar(500) NOT NULL,
  `date` date NOT NULL,
  `fromid_id` bigint NOT NULL,
  `toid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subapp_chat_table_fromid_id_fd7d4381_fk_subapp_login_table_id` (`fromid_id`),
  KEY `subapp_chat_table_toid_id_87cbc8be_fk_subapp_login_table_id` (`toid_id`),
  CONSTRAINT `subapp_chat_table_fromid_id_fd7d4381_fk_subapp_login_table_id` FOREIGN KEY (`fromid_id`) REFERENCES `subapp_login_table` (`id`),
  CONSTRAINT `subapp_chat_table_toid_id_87cbc8be_fk_subapp_login_table_id` FOREIGN KEY (`toid_id`) REFERENCES `subapp_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `subapp_chat_table` */

insert  into `subapp_chat_table`(`id`,`message`,`date`,`fromid_id`,`toid_id`) values 
(1,'Hlo miss','2024-05-14',9,5),
(2,'Hi nandana','2024-05-14',5,9),
(3,'','2024-05-14',5,9),
(4,'hlo','2024-05-15',5,9),
(5,'','2024-05-15',5,9);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `subapp_complaint_table` */

insert  into `subapp_complaint_table`(`id`,`complaint`,`reply`,`date`,`STUDENT_id`) values 
(1,'lap is not working ','bvdsgvcsdvf','2024-05-15',1),
(2,'lap is not working ','gg','2024-05-15',1),
(3,'sbbs','pending','2024-05-15',1),
(4,'lap is not working ','pending','2024-05-15',1);

/*Table structure for table `subapp_course_table` */

DROP TABLE IF EXISTS `subapp_course_table`;

CREATE TABLE `subapp_course_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `coursename` varchar(100) NOT NULL,
  `department_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subapp_course_table_department_id_8b2a0d97_fk_subapp_de` (`department_id`),
  CONSTRAINT `subapp_course_table_department_id_8b2a0d97_fk_subapp_de` FOREIGN KEY (`department_id`) REFERENCES `subapp_department_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `subapp_course_table` */

insert  into `subapp_course_table`(`id`,`coursename`,`department_id`) values 
(1,'MSc Computer Science',1),
(2,'BSc Computer Science',1),
(3,'MSc Mathematics',2),
(4,'Bsc Mathematics',2),
(5,'MSc Statistics',3),
(6,'BSc Statistics',3);

/*Table structure for table `subapp_department_table` */

DROP TABLE IF EXISTS `subapp_department_table`;

CREATE TABLE `subapp_department_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `departmentname` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `subapp_department_table` */

insert  into `subapp_department_table`(`id`,`departmentname`) values 
(1,'Computer Science'),
(2,'Mathematics'),
(3,'Statistics');

/*Table structure for table `subapp_exam_table` */

DROP TABLE IF EXISTS `subapp_exam_table`;

CREATE TABLE `subapp_exam_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `examname` varchar(100) NOT NULL,
  `examdate` date NOT NULL,
  `uploaddate` varchar(200) NOT NULL,
  `subjectassignedid_id` bigint NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subapp_exam_table_subjectassignedid_id_c17a40bf_fk_subapp_as` (`subjectassignedid_id`),
  CONSTRAINT `subapp_exam_table_subjectassignedid_id_c17a40bf_fk_subapp_as` FOREIGN KEY (`subjectassignedid_id`) REFERENCES `subapp_assignedsubject_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `subapp_exam_table` */

insert  into `subapp_exam_table`(`id`,`examname`,`examdate`,`uploaddate`,`subjectassignedid_id`,`status`) values 
(1,'database management system','2024-05-14','2024-05-14',1,'stoped'),
(2,'introduction to data structures ','2024-05-15','2024-05-15',1,'stoped'),
(3,'data structures ','2024-05-15','2024-05-15',1,'pending'),
(4,'types of data structure','2024-05-24','2024-05-15',1,'pending');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `subapp_hod_table` */

insert  into `subapp_hod_table`(`id`,`name`,`email`,`phone`,`place`,`pin`,`post`,`dep_id`,`login_id`) values 
(1,'Dr.Lajish V L','lajish07@gmail.com',9495793094,'Malappuram',676504,'Kohinoor',1,2),
(2,'Deepa K','deepa02@gmail.com',8755898989,'Kannur',678787,'Taliparamba',2,3),
(3,'Veena V K','veenavk007@gmail.com',9878656744,'Kasargod',670982,'Kottancherry',3,4);

/*Table structure for table `subapp_login_table` */

DROP TABLE IF EXISTS `subapp_login_table`;

CREATE TABLE `subapp_login_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `subapp_login_table` */

insert  into `subapp_login_table`(`id`,`username`,`password`,`type`) values 
(1,'admin','admin','admin'),
(2,'Lajish','Lajish123','hod'),
(3,'Deepa','Deepa123','hod'),
(4,'Veena','Veena123','hod'),
(5,'Aljinu','Aljinu123','staff'),
(6,'Ishaque','Ishaque123','staff'),
(7,'Hridya','Hridya123','staff'),
(8,'Manjula','Manjula123','staff'),
(9,'Nandana','Nandana123','student'),
(10,'Navajyothi','Navajyothi123','student'),
(11,'Indhu ','Indhu123','student'),
(12,'Sithara','Sithara123','student'),
(13,'Bijitha','Bijitha123','student'),
(14,'Helna','Helna123','student'),
(15,'Anjana','Anjana123','student'),
(16,'Sanaga','Sanaga123','student'),
(17,'Atheena','Atheena123','student'),
(18,'Aneena','Aneena123','student');

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
  `Mark` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subapp_questions_table_Exam_id_f897340c_fk_subapp_exam_table_id` (`Exam_id`),
  CONSTRAINT `subapp_questions_table_Exam_id_f897340c_fk_subapp_exam_table_id` FOREIGN KEY (`Exam_id`) REFERENCES `subapp_exam_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `subapp_questions_table` */

insert  into `subapp_questions_table`(`id`,`questions`,`answers`,`Exam_id`,`Mark`) values 
(8,'what is stack?','A Stack is a linear data structure that holds a linear, ordered sequence of elements. It is an abstract data type. A Stack works on the LIFO process (Last In First Out), i.e., the element that was inserted last will be removed first.',2,'6'),
(9,'what is queue?','A queue is a linear data structure that stores the elements sequentially. It uses the FIFO (First In First Out) approach for accessing elements. Queues are typically used to manage threads in multithreading and implementing priority queuing systems.',2,'6'),
(10,'what are the different types of data structures?','Array: A collection of elements of the same type stored in contiguous memory locations.\n\nLinked List: A collection of elements linked together by pointers, allowing for dynamic insertion and deletion.\n\nQueue: A First-In-First-Out (FIFO) structure where elements are added at the end and removed from the beginning.\n\nStack: A Last-In-First-Out (LIFO) structure where elements are added and removed from the top.\n\n',2,'8'),
(15,'what is dbms','Database Management Systems are software systems used to store, retrieve, and run queries on data. A DBMS serves as an interface between an end-user and a database, allowing users to create, read, update, and delete data in the database.',1,'5');

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
  `hod_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subapp_staff_table_login_id_e6f8beb2_fk_subapp_login_table_id` (`login_id`),
  KEY `subapp_staff_table_hod_id_d411b71b_fk_subapp_hod_table_id` (`hod_id`),
  CONSTRAINT `subapp_staff_table_hod_id_d411b71b_fk_subapp_hod_table_id` FOREIGN KEY (`hod_id`) REFERENCES `subapp_hod_table` (`id`),
  CONSTRAINT `subapp_staff_table_login_id_e6f8beb2_fk_subapp_login_table_id` FOREIGN KEY (`login_id`) REFERENCES `subapp_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `subapp_staff_table` */

insert  into `subapp_staff_table`(`id`,`name`,`email`,`phone`,`place`,`pin`,`post`,`image`,`login_id`,`hod_id`) values 
(1,'Dr.Aljinu Khadar k v','aljinukhadar@gmail.com',7559816123,'Farook',673632,'Chungam','aljinumiss.jpeg',5,1),
(2,'Ishaque','ishaque@gmail.com',8129984544,'Malappuram',678556,'Chelari','ishaque.jpeg',6,1),
(3,'Hridya E','hridya123@gmail.com',8547793226,'Calicut',678546,'Mukkam','hridya.jpg',7,1),
(4,'Manjula K A','manjulaka@gmail.com',9867554552,'Malappuram',673633,'Tirur','manjula.png',8,1);

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
  `hod_table_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subapp_student_table_course_id_e956c22f_fk_subapp_co` (`course_id`),
  KEY `subapp_student_table_login_id_d1db49a7_fk_subapp_login_table_id` (`login_id`),
  KEY `subapp_student_table_hod_table_id_863a3555_fk_subapp_ho` (`hod_table_id`),
  CONSTRAINT `subapp_student_table_course_id_e956c22f_fk_subapp_co` FOREIGN KEY (`course_id`) REFERENCES `subapp_course_table` (`id`),
  CONSTRAINT `subapp_student_table_hod_table_id_863a3555_fk_subapp_ho` FOREIGN KEY (`hod_table_id`) REFERENCES `subapp_hod_table` (`id`),
  CONSTRAINT `subapp_student_table_login_id_d1db49a7_fk_subapp_login_table_id` FOREIGN KEY (`login_id`) REFERENCES `subapp_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `subapp_student_table` */

insert  into `subapp_student_table`(`id`,`name`,`email`,`phone`,`place`,`pin`,`post`,`image`,`course_id`,`login_id`,`hod_table_id`) values 
(1,'Nandana c','nandanacbaskar@gmail.com',9544917661,'Calicut',673529,'Moodadi','nandana.jpeg',1,9,1),
(2,'Navajyothi','navajyothi@gmail.com',7306399217,'Kuttiyadi',674545,'Thinoor','navajyothi.jpeg',1,10,1),
(3,'Indhu','indhuss@gmail.com',9562359636,'Palakkad',686752,'Kollamkode','indhu.jpeg',1,11,1),
(4,'Fathima Sithara','sithara@gmail.com',9878656799,'Palakkad',678551,'Pattambi','sithara.jpeg',1,12,1),
(5,'Bijitha','biji123@gmail.com',9961195866,'Palakkad',697565,'Nemmara','biji.jpeg',1,13,1),
(6,'Helna','helna@gmail.com',9496943724,'Wayanad',654767,'Ellumannam','helna.jpeg',1,14,1),
(7,'Anjana','anj@gmail.com',9878656744,'Calicut',670508,'Balussery','anjana.jpeg',1,15,1),
(8,'Sanaga','sanaga@gmail.com',9876895856,'Calicut',658765,'Payyoli','sanaga.jpeg',1,16,1),
(9,'Atheena','atheenababu@gmail.com',9765784754,'Koyilandy',673529,'Payyoli','atheena.jpeg',1,17,1),
(10,'Aneena','neenakrishnan1234@gmai.com',8086349760,'Koyilandy',673529,'Thikkodi','aneena.jpeg',1,18,1);

/*Table structure for table `subapp_subject_table` */

DROP TABLE IF EXISTS `subapp_subject_table`;

CREATE TABLE `subapp_subject_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subjectname` varchar(100) NOT NULL,
  `courseid_id` bigint NOT NULL,
  `sem` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subapp_subject_table_courseid_id_7a0a37bb_fk_subapp_co` (`courseid_id`),
  CONSTRAINT `subapp_subject_table_courseid_id_7a0a37bb_fk_subapp_co` FOREIGN KEY (`courseid_id`) REFERENCES `subapp_course_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `subapp_subject_table` */

insert  into `subapp_subject_table`(`id`,`subjectname`,`courseid_id`,`sem`) values 
(1,'Discrete Mathematical Structures',1,'1'),
(2,'Advanced Data Structures and Algorithms',1,'1'),
(3,'Principles of Programming Methodology',1,'1'),
(4,'Theory of Computation',1,'1'),
(5,'Computer Organization and Architecture',1,'1'),
(7,'Design and Analysis of Algorithm',1,'2'),
(8,'Advanced Database Management System',1,'2'),
(9,'Operating System and Virtualization',1,'2'),
(10,'Object Oriented Programming with Java',1,'2'),
(11,'Principles of Compiler Design',1,'3'),
(12,'Data Communication and Networking ',1,'3'),
(13,'Web Technology',1,'3'),
(14,'Software Engineering',1,'4'),
(15,'Mobile Communication',1,'4');

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
