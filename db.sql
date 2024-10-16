/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - kaoshixitong
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`kaoshixitong` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `kaoshixitong`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'轮播图1','upload/config1.jpg'),(2,'轮播图2','upload/config2.jpg'),(3,'轮播图3','upload/config3.jpg');

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int(11) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='字典';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`beizhu`,`create_time`) values (1,'sex_types','性别类型',1,'男',NULL,NULL,'2023-04-11 10:40:51'),(2,'sex_types','性别类型',2,'女',NULL,NULL,'2023-04-11 10:40:51'),(3,'gonggao_types','学习资料类型',1,'学习资料类型1',NULL,NULL,'2023-04-11 10:40:51'),(4,'gonggao_types','学习资料类型',2,'学习资料类型2',NULL,NULL,'2023-04-11 10:40:51'),(5,'forum_state_types','帖子状态',1,'发帖',NULL,NULL,'2023-04-11 10:40:51'),(6,'forum_state_types','帖子状态',2,'回帖',NULL,NULL,'2023-04-11 10:40:51'),(7,'zujuan_types','组卷方式',1,'自动组卷',NULL,NULL,'2023-04-11 10:40:51'),(8,'zujuan_types','组卷方式',2,'手动组卷',NULL,NULL,'2023-04-11 10:40:51'),(9,'kemu_types','科目',1,'语文',NULL,NULL,'2023-04-11 10:40:51'),(10,'kemu_types','科目',2,'数学',NULL,NULL,'2023-04-11 10:40:51'),(11,'exampaper_types','试卷状态',1,'启用',NULL,NULL,'2023-04-11 10:40:51'),(12,'exampaper_types','试卷状态',2,'禁用',NULL,NULL,'2023-04-11 10:40:51'),(13,'examquestion_types','试题类型',1,'单选题',NULL,NULL,'2023-04-11 10:40:51'),(14,'examquestion_types','试题类型',2,'多选题',NULL,NULL,'2023-04-11 10:40:51'),(15,'examquestion_types','试题类型',3,'判断题',NULL,NULL,'2023-04-11 10:40:52'),(16,'examquestion_types','试题类型',4,'填空题',NULL,NULL,'2023-04-11 10:40:52');

/*Table structure for table `exampaper` */

DROP TABLE IF EXISTS `exampaper`;

CREATE TABLE `exampaper` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `exampaper_name` varchar(200) NOT NULL COMMENT '试卷名称 Search111',
  `exampaper_date` int(11) DEFAULT NULL COMMENT '考试时长(分钟)',
  `exampaper_myscore` int(20) NOT NULL DEFAULT '0' COMMENT '试卷总分数',
  `kemu_types` int(11) DEFAULT NULL COMMENT '科目 Search111',
  `exampaper_types` int(11) NOT NULL DEFAULT '0' COMMENT '试卷状态 Search111',
  `zujuan_types` int(11) DEFAULT NULL COMMENT '组卷方式',
  `exampaper_delete` int(255) DEFAULT '0' COMMENT '逻辑删除（1代表未删除 2代表已删除）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='试卷';

/*Data for the table `exampaper` */

insert  into `exampaper`(`id`,`exampaper_name`,`exampaper_date`,`exampaper_myscore`,`kemu_types`,`exampaper_types`,`zujuan_types`,`exampaper_delete`,`create_time`) values (1,'测试试卷1',60,100,2,1,2,1,'2023-04-11 10:40:51'),(2,'测试试卷2',180,100,2,1,1,1,'2023-04-11 10:40:51');

/*Table structure for table `exampapertopic` */

DROP TABLE IF EXISTS `exampapertopic`;

CREATE TABLE `exampapertopic` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `exampaper_id` int(20) NOT NULL COMMENT '试卷',
  `examquestion_id` int(20) NOT NULL COMMENT '试题',
  `exampapertopic_number` int(20) NOT NULL COMMENT '试题分数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='试卷选题';

/*Data for the table `exampapertopic` */

insert  into `exampapertopic`(`id`,`exampaper_id`,`examquestion_id`,`exampapertopic_number`,`create_time`) values (7,1,5,10,'2023-04-11 10:40:51'),(8,1,4,10,'2023-04-11 10:40:51'),(9,1,6,70,'2023-04-11 10:40:51'),(18,2,5,15,'2023-04-11 10:40:51'),(19,2,11,15,'2023-04-11 10:40:51'),(20,2,9,15,'2023-04-11 10:40:51'),(21,2,1,15,'2023-04-11 10:40:51'),(22,2,10,20,'2023-04-11 10:40:51'),(23,2,3,20,'2023-04-11 10:40:51'),(31,1,7,10,'2023-04-11 10:40:51'),(33,1,9,0,'2023-04-11 10:40:51'),(34,1,12,0,'2023-04-11 10:40:51');

/*Table structure for table `examquestion` */

DROP TABLE IF EXISTS `examquestion`;

CREATE TABLE `examquestion` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `examquestion_name` varchar(200) DEFAULT NULL COMMENT '试题名称 Search111',
  `kemu_types` int(11) DEFAULT NULL COMMENT '科目 Search111',
  `examquestion_options` longtext COMMENT '选项，json字符串',
  `examquestion_answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `examquestion_analysis` longtext COMMENT '答案解析',
  `examquestion_types` int(20) DEFAULT '0' COMMENT '试题类型 Search111',
  `examquestion_sequence` int(20) DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='试题表';

/*Data for the table `examquestion` */

insert  into `examquestion`(`id`,`examquestion_name`,`kemu_types`,`examquestion_options`,`examquestion_answer`,`examquestion_analysis`,`examquestion_types`,`examquestion_sequence`,`create_time`) values (1,'1-1=1',2,'[{\"text\":\"对\",\"code\":\"A\"},{\"text\":\"错\",\"code\":\"B\"}]','B','1-1=0',3,1,'2023-04-11 10:40:52'),(2,'1+1=？',2,'[{\"text\":\"1\",\"code\":\"A\"},{\"text\":\"2\",\"code\":\"B\"},{\"text\":\"3\",\"code\":\"C\"},{\"text\":\"4\",\"code\":\"D\"}]','B','1+1=2',1,2,'2023-04-11 10:40:52'),(3,'1+1-1=?',2,'[]','1','1+1-1=1',4,3,'2023-04-11 10:40:52'),(4,'2+2=?',2,'[]','4','2+2=4',4,4,'2023-04-11 10:40:52'),(5,'1-1-1+6=?',2,'[{\"text\":\"4\",\"code\":\"A\"},{\"text\":\"5\",\"code\":\"B\"},{\"text\":\"6\",\"code\":\"C\"},{\"text\":\"3\",\"code\":\"D\"}]','B','1-1-1+6=5',1,5,'2023-04-11 10:40:52'),(6,'3+3=9',2,'[{\"text\":\"对\",\"code\":\"A\"},{\"text\":\"错\",\"code\":\"B\"}]','B','3+3=6',3,6,'2023-04-11 10:40:52'),(7,'试题名称1',2,'[{\"text\":\"内容1\",\"code\":\"A\"},{\"text\":\"内容2\",\"code\":\"B\"},{\"text\":\"内容3\",\"code\":\"C\"},{\"text\":\"内容4\",\"code\":\"D\"}]','A,B,C','答案解析1',2,7,'2023-04-11 10:40:52'),(8,'试题名称2',2,'[]','正确答案2','答案解析2',4,8,'2023-04-11 10:40:52'),(9,'试题名称3',2,'[{\"text\":\"对\",\"code\":\"A\"},{\"text\":\"错\",\"code\":\"B\"}]','A','答案解析3',3,9,'2023-04-11 10:40:52'),(10,'试题名称4',2,'[]','正确答案4','答案解析4',4,10,'2023-04-11 10:40:52'),(11,'试题名称5',2,'[{\"text\":\"内容1\",\"code\":\"A\"},{\"text\":\"内容2\",\"code\":\"B\"},{\"text\":\"内容3\",\"code\":\"C\"},{\"text\":\"内容4\",\"code\":\"D\"}]','B','答案解析5',1,11,'2023-04-11 10:40:52'),(12,'试题名称6',2,'[{\"text\":\"内容1\",\"code\":\"A\"},{\"text\":\"内容2\",\"code\":\"B\"},{\"text\":\"内容3\",\"code\":\"C\"},{\"text\":\"内容4\",\"code\":\"D\"}]','A','答案解析6',1,12,'2023-04-11 10:40:52');

/*Table structure for table `examrecord` */

DROP TABLE IF EXISTS `examrecord`;

CREATE TABLE `examrecord` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `examrecord_uuid_number` varchar(200) DEFAULT NULL COMMENT '考试编号',
  `yonghu_id` int(20) NOT NULL COMMENT '考试用户',
  `exampaper_id` int(20) NOT NULL COMMENT '所属试卷id（外键）',
  `total_score` int(200) DEFAULT NULL COMMENT '所得总分',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '考试时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='考试记录表';

/*Data for the table `examrecord` */

insert  into `examrecord`(`id`,`examrecord_uuid_number`,`yonghu_id`,`exampaper_id`,`total_score`,`insert_time`,`create_time`) values (1,'1681181297230',1,2,15,'2023-04-11 10:48:17','2023-04-11 10:48:17'),(2,'1681181402409',1,2,50,'2023-04-11 10:50:02','2023-04-11 10:50:02');

/*Table structure for table `examredetails` */

DROP TABLE IF EXISTS `examredetails`;

CREATE TABLE `examredetails` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `examredetails_uuid_number` varchar(200) DEFAULT NULL COMMENT '试卷编号',
  `yonghu_id` int(20) NOT NULL COMMENT '用户id',
  `examquestion_id` int(20) NOT NULL COMMENT '试题id（外键）',
  `examredetails_myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  `examredetails_myscore` int(20) NOT NULL DEFAULT '0' COMMENT '试题得分',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='答题详情表';

/*Data for the table `examredetails` */

insert  into `examredetails`(`id`,`examredetails_uuid_number`,`yonghu_id`,`examquestion_id`,`examredetails_myanswer`,`examredetails_myscore`,`create_time`) values (1,'1681181297230',1,3,'312',0,'2023-04-11 10:48:17'),(2,'1681181297230',1,10,'216',0,'2023-04-11 10:48:17'),(3,'1681181297230',1,1,'A',0,'2023-04-11 10:48:17'),(4,'1681181297230',1,9,'A',15,'2023-04-11 10:48:17'),(5,'1681181297230',1,11,'A',0,'2023-04-11 10:48:17'),(6,'1681181297230',1,5,'A',0,'2023-04-11 10:48:17'),(7,'1681181402409',1,3,'1',20,'2023-04-11 10:50:02'),(8,'1681181402409',1,10,'试题名称4',0,'2023-04-11 10:50:02'),(9,'1681181402409',1,1,'B',15,'2023-04-11 10:50:02'),(10,'1681181402409',1,9,'A',15,'2023-04-11 10:50:02'),(11,'1681181402409',1,11,'D',0,'2023-04-11 10:50:02'),(12,'1681181402409',1,5,'D',0,'2023-04-11 10:50:02');

/*Table structure for table `examrewrongquestion` */

DROP TABLE IF EXISTS `examrewrongquestion`;

CREATE TABLE `examrewrongquestion` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yonghu_id` int(20) NOT NULL COMMENT '用户id',
  `exampaper_id` int(20) NOT NULL COMMENT '试卷（外键）',
  `examquestion_id` int(20) NOT NULL COMMENT '试题id（外键）',
  `examredetails_myanswer` varchar(200) DEFAULT NULL COMMENT '考生作答',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间 show3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='错题表';

/*Data for the table `examrewrongquestion` */

insert  into `examrewrongquestion`(`id`,`yonghu_id`,`exampaper_id`,`examquestion_id`,`examredetails_myanswer`,`insert_time`,`create_time`) values (1,1,2,3,'312','2023-04-11 10:48:17','2023-04-11 10:48:17'),(2,1,2,10,'216','2023-04-11 10:48:17','2023-04-11 10:48:17'),(3,1,2,1,'A','2023-04-11 10:48:17','2023-04-11 10:48:17'),(4,1,2,11,'A','2023-04-11 10:48:17','2023-04-11 10:48:17'),(5,1,2,5,'A','2023-04-11 10:48:17','2023-04-11 10:48:17'),(6,1,2,10,'试题名称4','2023-04-11 10:50:02','2023-04-11 10:50:02'),(7,1,2,11,'D','2023-04-11 10:50:02','2023-04-11 10:50:02'),(8,1,2,5,'D','2023-04-11 10:50:02','2023-04-11 10:50:02');

/*Table structure for table `forum` */

DROP TABLE IF EXISTS `forum`;

CREATE TABLE `forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `forum_name` varchar(200) DEFAULT NULL COMMENT '帖子标题  Search111 ',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `laoshi_id` int(11) DEFAULT NULL COMMENT '老师',
  `users_id` int(11) DEFAULT NULL COMMENT '管理员',
  `forum_content` longtext COMMENT '发布内容',
  `super_ids` int(11) DEFAULT NULL COMMENT '父id',
  `forum_state_types` int(11) DEFAULT NULL COMMENT '帖子状态',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '发帖时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='论坛';

/*Data for the table `forum` */

insert  into `forum`(`id`,`forum_name`,`yonghu_id`,`laoshi_id`,`users_id`,`forum_content`,`super_ids`,`forum_state_types`,`insert_time`,`update_time`,`create_time`) values (1,'帖子标题1',3,NULL,NULL,'发布内容1',222,1,'2023-04-11 10:41:58','2023-04-11 10:41:58','2023-04-11 10:41:58'),(2,'帖子标题2',1,NULL,NULL,'发布内容2',201,1,'2023-04-11 10:41:58','2023-04-11 10:41:58','2023-04-11 10:41:58'),(3,'帖子标题3',2,NULL,NULL,'发布内容3',476,1,'2023-04-11 10:41:58','2023-04-11 10:41:58','2023-04-11 10:41:58'),(4,'帖子标题4',3,NULL,NULL,'发布内容4',290,1,'2023-04-11 10:41:58','2023-04-11 10:41:58','2023-04-11 10:41:58'),(5,'帖子标题5',2,NULL,NULL,'发布内容5',199,1,'2023-04-11 10:41:58','2023-04-11 10:41:58','2023-04-11 10:41:58'),(6,'帖子标题6',3,NULL,NULL,'发布内容6',101,1,'2023-04-11 10:41:58','2023-04-11 10:41:58','2023-04-11 10:41:58'),(7,'帖子标题7',2,NULL,NULL,'发布内容7',107,1,'2023-04-11 10:41:58','2023-04-11 10:41:58','2023-04-11 10:41:58'),(8,'帖子标题8',3,NULL,NULL,'发布内容8',310,1,'2023-04-11 10:41:58','2023-04-11 10:41:58','2023-04-11 10:41:58'),(9,'帖子标题9',3,NULL,NULL,'发布内容9',70,1,'2023-04-11 10:41:58','2023-04-11 10:41:58','2023-04-11 10:41:58'),(10,'帖子标题10',3,NULL,NULL,'发布内容10',208,1,'2023-04-11 10:41:58','2023-04-11 10:41:58','2023-04-11 10:41:58'),(11,'帖子标题11',2,NULL,NULL,'发布内容11',407,1,'2023-04-11 10:41:58','2023-04-11 10:41:58','2023-04-11 10:41:58'),(12,'帖子标题12',2,NULL,NULL,'发布内容12',353,1,'2023-04-11 10:41:58','2023-04-11 10:41:58','2023-04-11 10:41:58'),(13,'帖子标题13',1,NULL,NULL,'发布内容13',32,1,'2023-04-11 10:41:58','2023-04-11 10:41:58','2023-04-11 10:41:58'),(14,'帖子标题14',2,NULL,NULL,'发布内容14',138,1,'2023-04-11 10:41:58','2023-04-11 10:41:58','2023-04-11 10:41:58'),(15,'帖子',1,NULL,NULL,'<p>123123</p>',NULL,1,'2023-04-11 10:50:11',NULL,'2023-04-11 10:50:11'),(17,NULL,NULL,1,NULL,'213213',15,2,'2023-04-11 10:51:37',NULL,'2023-04-11 10:51:37'),(18,NULL,NULL,NULL,1,'手打阿萨德啊',15,2,'2023-04-11 10:52:50',NULL,'2023-04-11 10:52:50');

/*Table structure for table `gonggao` */

DROP TABLE IF EXISTS `gonggao`;

CREATE TABLE `gonggao` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `gonggao_name` varchar(200) DEFAULT NULL COMMENT '学习资料名称 Search111  ',
  `gonggao_photo` varchar(200) DEFAULT NULL COMMENT '学习资料图片 ',
  `gonggao_types` int(11) NOT NULL COMMENT '学习资料类型 Search111 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '发布时间',
  `gonggao_content` longtext COMMENT '学习资料详情 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='学习资料';

/*Data for the table `gonggao` */

insert  into `gonggao`(`id`,`gonggao_name`,`gonggao_photo`,`gonggao_types`,`insert_time`,`gonggao_content`,`create_time`) values (1,'学习资料名称1','upload/gonggao1.jpg',1,'2023-04-11 10:41:58','学习资料详情1','2023-04-11 10:41:58'),(2,'学习资料名称2','upload/gonggao2.jpg',1,'2023-04-11 10:41:58','学习资料详情2','2023-04-11 10:41:58'),(3,'学习资料名称3','upload/gonggao3.jpg',2,'2023-04-11 10:41:58','学习资料详情3','2023-04-11 10:41:58'),(4,'学习资料名称4','upload/gonggao4.jpg',1,'2023-04-11 10:41:58','学习资料详情4','2023-04-11 10:41:58'),(5,'学习资料名称5','upload/gonggao5.jpg',1,'2023-04-11 10:41:58','学习资料详情5','2023-04-11 10:41:58'),(6,'学习资料名称6','upload/gonggao6.jpg',2,'2023-04-11 10:41:58','学习资料详情6','2023-04-11 10:41:58'),(7,'学习资料名称7','upload/gonggao7.jpg',1,'2023-04-11 10:41:58','学习资料详情7','2023-04-11 10:41:58'),(8,'学习资料名称8','upload/gonggao8.jpg',2,'2023-04-11 10:41:58','学习资料详情8','2023-04-11 10:41:58'),(9,'学习资料名称9','upload/gonggao9.jpg',2,'2023-04-11 10:41:58','学习资料详情9','2023-04-11 10:41:58'),(10,'学习资料名称10','upload/gonggao10.jpg',1,'2023-04-11 10:41:58','学习资料详情10','2023-04-11 10:41:58'),(11,'学习资料名称11','upload/gonggao11.jpg',2,'2023-04-11 10:41:58','学习资料详情11','2023-04-11 10:41:58'),(12,'学习资料名称12','upload/gonggao12.jpg',1,'2023-04-11 10:41:58','学习资料详情12','2023-04-11 10:41:58'),(13,'学习资料名称13','upload/gonggao13.jpg',1,'2023-04-11 10:41:58','学习资料详情13','2023-04-11 10:41:58'),(14,'学习资料名称14','upload/gonggao14.jpg',1,'2023-04-11 10:41:58','学习资料详情14','2023-04-11 10:41:58');

/*Table structure for table `laoshi` */

DROP TABLE IF EXISTS `laoshi`;

CREATE TABLE `laoshi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `laoshi_name` varchar(200) DEFAULT NULL COMMENT '老师姓名 Search111 ',
  `laoshi_photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `laoshi_phone` varchar(200) DEFAULT NULL COMMENT '老师手机号',
  `laoshi_id_number` varchar(200) DEFAULT NULL COMMENT '老师身份证号 ',
  `laoshi_email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别 Search111 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='老师';

/*Data for the table `laoshi` */

insert  into `laoshi`(`id`,`username`,`password`,`laoshi_name`,`laoshi_photo`,`laoshi_phone`,`laoshi_id_number`,`laoshi_email`,`sex_types`,`create_time`) values (1,'a1','123456','老师姓名1','upload/laoshi1.jpg','17703786901','410224199010102001','1@qq.com',1,'2023-04-11 10:41:58'),(2,'a2','123456','老师姓名2','upload/laoshi2.jpg','17703786902','410224199010102002','2@qq.com',2,'2023-04-11 10:41:58'),(3,'a3','123456','老师姓名3','upload/laoshi3.jpg','17703786903','410224199010102003','3@qq.com',2,'2023-04-11 10:41:58');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '儿童id',
  `username` varchar(100) NOT NULL COMMENT '儿童名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1,'a1','yonghu','用户','84y1l5b1xuk4ijczb920wnfwr0npbgh1','2023-04-11 10:47:52','2023-04-11 11:49:27'),(2,1,'a1','laoshi','老师','31p7izd08myfkywfyriu2ow0opuaopgl','2023-04-11 10:48:33','2023-04-11 11:50:45'),(3,1,'admin','users','管理员','3pg8i8ul2qbtmxeakdu8pgbjpzimsbxq','2023-04-11 10:51:51','2023-04-11 11:51:52');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '儿童名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','admin','管理员','2023-04-11 10:40:51');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '用户姓名 Search111 ',
  `yonghu_photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '用户手机号',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '用户身份证号 ',
  `yonghu_email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别 Search111 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`username`,`password`,`yonghu_name`,`yonghu_photo`,`yonghu_phone`,`yonghu_id_number`,`yonghu_email`,`sex_types`,`create_time`) values (1,'a1','123456','用户姓名1','upload/yonghu1.jpg','17703786901','410224199010102001','1@qq.com',2,'2023-04-11 10:41:58'),(2,'a2','123456','用户姓名2','upload/yonghu2.jpg','17703786902','410224199010102002','2@qq.com',1,'2023-04-11 10:41:58'),(3,'a3','123456','用户姓名3','upload/yonghu3.jpg','17703786903','410224199010102003','3@qq.com',2,'2023-04-11 10:41:58');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
