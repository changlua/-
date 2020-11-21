/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.5.15 : Database - ssm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` varchar(32) NOT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `member` */

insert  into `member`(`id`,`NAME`,`nickname`,`phoneNum`,`email`) values ('E61D65F673D54F68B0861025C69773DB','张三','小三','18888888888','zs@163.com');

/*Table structure for table `order_traveller` */

DROP TABLE IF EXISTS `order_traveller`;

CREATE TABLE `order_traveller` (
  `orderId` varchar(32) NOT NULL DEFAULT '',
  `travellerId` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`orderId`,`travellerId`),
  KEY `travellerId` (`travellerId`),
  CONSTRAINT `order_traveller_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_traveller_ibfk_2` FOREIGN KEY (`travellerId`) REFERENCES `traveller` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order_traveller` */

insert  into `order_traveller`(`orderId`,`travellerId`) values ('0E7231DC797C486290E8713CA3C6ECCC','3FE27DF2A4E44A6DBC5D0FE4651D3D3E'),('2FF351C4AC744E2092DCF08CFD314420','3FE27DF2A4E44A6DBC5D0FE4651D3D3E'),('5DC6A48DD4E94592AE904930EA866AFA','3FE27DF2A4E44A6DBC5D0FE4651D3D3E'),('A0657832D93E4B10AE88A2D4B70B1A28','3FE27DF2A4E44A6DBC5D0FE4651D3D3E'),('3081770BC3984EF092D9E99760FDABDE','EE7A71FB6945483FBF91543DBE851960'),('55F9AF582D5A4DB28FB4EC3199385762','EE7A71FB6945483FBF91543DBE851960'),('96CC8BD43C734CC2ACBFF09501B4DD5D','EE7A71FB6945483FBF91543DBE851960'),('CA005CF1BE3C4EF68F88ABC7DF30E976','EE7A71FB6945483FBF91543DBE851960'),('E4DD4C45EED84870ABA83574A801083E','EE7A71FB6945483FBF91543DBE851960');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` varchar(32) NOT NULL,
  `orderNum` varchar(20) NOT NULL,
  `orderTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `peopleCount` int(11) DEFAULT NULL,
  `orderDesc` varchar(500) DEFAULT NULL,
  `payType` int(11) DEFAULT NULL,
  `orderStatus` int(11) DEFAULT NULL,
  `productId` varchar(32) DEFAULT NULL,
  `memberId` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderNum` (`orderNum`),
  KEY `productId` (`productId`),
  KEY `memberId` (`memberId`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`id`,`orderNum`,`orderTime`,`peopleCount`,`orderDesc`,`payType`,`orderStatus`,`productId`,`memberId`) values ('0E7231DC797C486290E8713CA3C6ECCC','12345','2020-10-25 18:26:32',2,'没什么',0,1,'676C5BD1D35E429A8C2E114939C5685A','E61D65F673D54F68B0861025C69773DB'),('2FF351C4AC744E2092DCF08CFD314420','67890','2020-10-25 18:26:32',2,'没什么',0,1,'12B7ABF2A4C544568B0A7C69F36BF8B7','E61D65F673D54F68B0861025C69773DB'),('3081770BC3984EF092D9E99760FDABDE','55555','2020-10-25 18:26:32',2,'没什么',0,1,'9F71F01CB448476DAFB309AA6DF9497F','E61D65F673D54F68B0861025C69773DB'),('55F9AF582D5A4DB28FB4EC3199385762','33333','2020-10-25 18:26:32',2,'没什么',0,1,'9F71F01CB448476DAFB309AA6DF9497F','E61D65F673D54F68B0861025C69773DB'),('5DC6A48DD4E94592AE904930EA866AFA','54321','2020-10-25 18:26:32',2,'没什么',0,1,'676C5BD1D35E429A8C2E114939C5685A','E61D65F673D54F68B0861025C69773DB'),('96CC8BD43C734CC2ACBFF09501B4DD5D','22222','2020-10-25 18:26:32',2,'没什么',0,1,'12B7ABF2A4C544568B0A7C69F36BF8B7','E61D65F673D54F68B0861025C69773DB'),('A0657832D93E4B10AE88A2D4B70B1A28','98765','2020-10-25 18:26:32',2,'没什么',0,1,'12B7ABF2A4C544568B0A7C69F36BF8B7','E61D65F673D54F68B0861025C69773DB'),('CA005CF1BE3C4EF68F88ABC7DF30E976','44444','2020-10-25 18:26:32',2,'没什么',0,1,'9F71F01CB448476DAFB309AA6DF9497F','E61D65F673D54F68B0861025C69773DB'),('E4DD4C45EED84870ABA83574A801083E','11111','2020-10-25 18:26:32',2,'没什么',0,1,'12B7ABF2A4C544568B0A7C69F36BF8B7','E61D65F673D54F68B0861025C69773DB');

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `id` varchar(32) NOT NULL,
  `permissionName` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `permission` */

insert  into `permission`(`id`,`permissionName`,`url`) values ('0caa3bac200f11eb81d700ffba6ce622','user findAll','/user/findAll.do'),('0f2e0fd7200f11eb81d700ffba6ce622','user findById','/user/findById.do'),('5e3a13da211911eb81d700ffba6ce622','role findAll','/role/findAll.do');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` varchar(50) NOT NULL,
  `productNum` varchar(50) NOT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `cityName` varchar(50) DEFAULT NULL,
  `DepartureTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `productPrice` double DEFAULT NULL,
  `productDesc` varchar(500) DEFAULT NULL,
  `productStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product` (`id`,`productNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`id`,`productNum`,`productName`,`cityName`,`DepartureTime`,`productPrice`,`productDesc`,`productStatus`) values ('12B7ABF2A4C544568B0A7C69F36BF8B7','itcast-003','上海五日游','上海','2020-10-25 17:23:37',1800,'魔都我来了',0),('676C5BD1D35E429A8C2E114939C5685A','itcast-002','北京三日游','北京','2020-10-25 17:23:37',1200,'不错的旅行',1),('80d5f91c231e11eb93049828a640b46f','123456','黄河一日游','苏州','2020-11-11 02:10:00',1555,'长路今天就去一日游',1),('9F71F01CB448476DAFB309AA6DF9497F','itcast-001','北京三日游','北京','2020-10-25 17:23:37',1200,'不错的旅行',1),('d60de1ad16a511eba75c9828a640b46f','changlu的机票','深圳一日游','深圳','2020-10-07 10:35:00',1500,'去深圳看看',1);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` varchar(32) NOT NULL,
  `roleName` varchar(50) DEFAULT NULL,
  `roleDesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`id`,`roleName`,`roleDesc`) values ('1111','ADMIN','vip'),('34902936223311eb93049828a640b46f','teacher','老师'),('b17df66f211011eb81d700ffba6ce622','guest','测试账户');

/*Table structure for table `role_permission` */

DROP TABLE IF EXISTS `role_permission`;

CREATE TABLE `role_permission` (
  `permissionId` varchar(32) NOT NULL DEFAULT '',
  `roleId` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`permissionId`,`roleId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`),
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role_permission` */

insert  into `role_permission`(`permissionId`,`roleId`) values ('0caa3bac200f11eb81d700ffba6ce622','1111'),('0f2e0fd7200f11eb81d700ffba6ce622','1111'),('5e3a13da211911eb81d700ffba6ce622','1111');

/*Table structure for table `syslog` */

DROP TABLE IF EXISTS `syslog`;

CREATE TABLE `syslog` (
  `id` varchar(32) NOT NULL,
  `visitTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(50) DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `executionTime` int(11) DEFAULT NULL,
  `method` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `syslog` */

insert  into `syslog`(`id`,`visitTime`,`username`,`ip`,`url`,`executionTime`,`method`) values ('01e615fe23cf11eb93049828a640b46f','2020-11-11 11:35:59','tom','0:0:0:0:0:0:0:1','/permission/findAll.do',13,'[类名]com.changlu.ssm.controller.PermissionController [方法名]findAll'),('02fce811259711eb8bea9828a640b46f','2020-11-13 18:00:10','tom','0:0:0:0:0:0:0:1','/orders/findAll.do',10,'[类名]com.changlu.ssm.controller.OrdersController [方法名]findAll'),('0487840e259811eb8bea9828a640b46f','2020-11-13 18:07:22','tom','0:0:0:0:0:0:0:1','/user/findAll.do',26,'[类名]com.changlu.ssm.controller.UsersController [方法名]findAll'),('04a1efc823cf11eb93049828a640b46f','2020-11-11 11:36:03','tom','0:0:0:0:0:0:0:1','/permission/findAll.do',3,'[类名]com.changlu.ssm.controller.PermissionController [方法名]findAll'),('04c7311e264311ebb7a39828a640b46f','2020-11-14 14:31:26','tom','0:0:0:0:0:0:0:1','/user/findAll.do',4,'[类名]com.changlu.ssm.controller.UsersController [方法名]findAll'),('0627fc1f259811eb8bea9828a640b46f','2020-11-13 18:07:25','tom','0:0:0:0:0:0:0:1','/user/findAll.do',3,'[类名]com.changlu.ssm.controller.UsersController [方法名]findAll'),('06efc0b2259711eb8bea9828a640b46f','2020-11-13 18:00:16','tom','0:0:0:0:0:0:0:1','/product/findAll.do',19,'[类名]com.changlu.ssm.controller.ProductController [方法名]findAll'),('093bd89e259711eb8bea9828a640b46f','2020-11-13 18:00:20','tom','0:0:0:0:0:0:0:1','/orders/findAll.do',10,'[类名]com.changlu.ssm.controller.OrdersController [方法名]findAll'),('09b1fb4023e511eb8bea9828a640b46f','2020-11-11 14:13:38','tom','0:0:0:0:0:0:0:1','/sysLog/findAll.do',24,'[类名]com.changlu.ssm.controller.SysLogController [方法名]findAll'),('0ea589d12ba811eba80e00ffba6ce622','2020-11-21 11:17:23','tom','0:0:0:0:0:0:0:1','/user/findAll.do',34,'[类名]com.changlu.ssm.controller.UsersController [方法名]findAll'),('13e9c7f42ba811eba80e00ffba6ce622','2020-11-21 11:17:32','tom','0:0:0:0:0:0:0:1','/user/findAll.do',3,'[类名]com.changlu.ssm.controller.UsersController [方法名]findAll'),('1520cac22ba811eba80e00ffba6ce622','2020-11-21 11:17:34','tom','0:0:0:0:0:0:0:1','/role/findAll.do',12,'[类名]com.changlu.ssm.controller.RoleController [方法名]findAll'),('174a4de72ba811eba80e00ffba6ce622','2020-11-21 11:17:38','tom','0:0:0:0:0:0:0:1','/role/findAll.do',3,'[类名]com.changlu.ssm.controller.RoleController [方法名]findAll'),('18db18cd23e611eb8bea9828a640b46f','2020-11-11 14:21:13','tom','0:0:0:0:0:0:0:1','/sysLog/findAll.do',30,'[类名]com.changlu.ssm.controller.SysLogController [方法名]findAll'),('19412d992ba811eba80e00ffba6ce622','2020-11-21 11:17:41','tom','0:0:0:0:0:0:0:1','/permission/findAll.do',7,'[类名]com.changlu.ssm.controller.PermissionController [方法名]findAll'),('1a13f9c423cd11eb93049828a640b46f','2020-11-11 11:22:20','tom','0:0:0:0:0:0:0:1','/product/findAll.do',23,'[类名]com.changlu.ssm.controller.ProductController [方法名]findAll'),('1b046ba12ba811eba80e00ffba6ce622','2020-11-21 11:17:44','tom','0:0:0:0:0:0:0:1','/permission/findAll.do',4,'[类名]com.changlu.ssm.controller.PermissionController [方法名]findAll'),('1b82a22a23cd11eb93049828a640b46f','2020-11-11 11:22:23','tom','0:0:0:0:0:0:0:1','/orders/findAll.do',1,'[类名]com.changlu.ssm.controller.OrdersController [方法名]findAll'),('1d76509d2ba811eba80e00ffba6ce622','2020-11-21 11:17:48','tom','0:0:0:0:0:0:0:1','/product/findAll.do',18,'[类名]com.changlu.ssm.controller.ProductController [方法名]findAll'),('2494bd1423e611eb8bea9828a640b46f','2020-11-11 14:21:32','tom','0:0:0:0:0:0:0:1','/sysLog/findAll.do',8,'[类名]com.changlu.ssm.controller.SysLogController [方法名]findAll'),('24c93c2f2ba811eba80e00ffba6ce622','2020-11-21 11:18:00','tom','0:0:0:0:0:0:0:1','/orders/findAll.do',63,'[类名]com.changlu.ssm.controller.OrdersController [方法名]findAll'),('2657159c27eb11eba80e00ffba6ce622','2020-11-16 17:07:29','tom','0:0:0:0:0:0:0:1','/user/findAll.do',4,'[类名]com.changlu.ssm.controller.UsersController [方法名]findAll'),('3372a6ad23cd11eb93049828a640b46f','2020-11-11 11:23:03','tom','0:0:0:0:0:0:0:1','/product/findAll.do',5,'[类名]com.changlu.ssm.controller.ProductController [方法名]findAll'),('37a23947259811eb8bea9828a640b46f','2020-11-13 18:08:48','tom','0:0:0:0:0:0:0:1','/user/findAll.do',5,'[类名]com.changlu.ssm.controller.UsersController [方法名]findAll'),('39b38991259811eb8bea9828a640b46f','2020-11-13 18:08:51','tom','0:0:0:0:0:0:0:1','/user/findAll.do',4,'[类名]com.changlu.ssm.controller.UsersController [方法名]findAll'),('3a6ecf3b259411eb8bea9828a640b46f','2020-11-13 17:40:14','tom','0:0:0:0:0:0:0:1','/user/findAll.do',30,'[类名]com.changlu.ssm.controller.UsersController [方法名]findAll'),('3d941181259411eb8bea9828a640b46f','2020-11-13 17:40:20','tom','0:0:0:0:0:0:0:1','/user/findUserByIdAndAllRole.do',29,'[类名]com.changlu.ssm.controller.UsersController [方法名]findUserByIdAndAllRole'),('40984132259411eb8bea9828a640b46f','2020-11-13 17:40:25','tom','0:0:0:0:0:0:0:1','/user/findAll.do',3,'[类名]com.changlu.ssm.controller.UsersController [方法名]findAll'),('41ffe6c3259211eb8bea9828a640b46f','2020-11-13 17:26:08','tom','0:0:0:0:0:0:0:1','/user/findAll.do',18,'[类名]com.changlu.ssm.controller.UsersController [方法名]findAll'),('4f4890c3259211eb8bea9828a640b46f','2020-11-13 17:26:30','tom','0:0:0:0:0:0:0:1','/user/findAll.do',17,'[类名]com.changlu.ssm.controller.UsersController [方法名]findAll'),('5547b17a27e911eba80e00ffba6ce622','2020-11-16 16:54:29','tom','0:0:0:0:0:0:0:1','/user/findAll.do',17,'[类名]com.changlu.ssm.controller.UsersController [方法名]findAll'),('5b5597c2259211eb8bea9828a640b46f','2020-11-13 17:26:51','tom','0:0:0:0:0:0:0:1','/role/findAll.do',30,'[类名]com.changlu.ssm.controller.RoleController [方法名]findAll'),('5c97fb1023e711eb8bea9828a640b46f','2020-11-11 14:30:16','tom','0:0:0:0:0:0:0:1','/sysLog/findAll.do',20,'[类名]com.changlu.ssm.controller.SysLogController [方法名]findAll'),('6e695b15259211eb8bea9828a640b46f','2020-11-13 17:27:23','tom','0:0:0:0:0:0:0:1','/user/findAll.do',3,'[类名]com.changlu.ssm.controller.UsersController [方法名]findAll'),('723a890a259211eb8bea9828a640b46f','2020-11-13 17:27:29','tom','0:0:0:0:0:0:0:1','/user/findAll.do',3,'[类名]com.changlu.ssm.controller.UsersController [方法名]findAll'),('73d96664259211eb8bea9828a640b46f','2020-11-13 17:27:32','tom','0:0:0:0:0:0:0:1','/role/findAll.do',7,'[类名]com.changlu.ssm.controller.RoleController [方法名]findAll'),('8c09fc9127e911eba80e00ffba6ce622','2020-11-16 16:56:01','tom','0:0:0:0:0:0:0:1','/role/findAll.do',13,'[类名]com.changlu.ssm.controller.RoleController [方法名]findAll'),('999a5f53275911eba80e00ffba6ce622','2020-11-15 23:45:36','tom','0:0:0:0:0:0:0:1','/user/findAll.do',18,'[类名]com.changlu.ssm.controller.UsersController [方法名]findAll'),('9c69ca5227e911eba80e00ffba6ce622','2020-11-16 16:56:28','tom','0:0:0:0:0:0:0:1','/user/findAll.do',3,'[类名]com.changlu.ssm.controller.UsersController [方法名]findAll'),('9cd6df0623cc11eb93049828a640b46f','2020-11-11 11:18:50','tom','0:0:0:0:0:0:0:1','/user/findAll.do',34,'[类名]com.changlu.ssm.controller.UsersController [方法名]findAll'),('bc5e560327e911eba80e00ffba6ce622','2020-11-16 16:57:22','tom','0:0:0:0:0:0:0:1','/role/findAll.do',4,'[类名]com.changlu.ssm.controller.RoleController [方法名]findAll'),('c3eac6fa27e911eba80e00ffba6ce622','2020-11-16 16:57:35','tom','0:0:0:0:0:0:0:1','/permission/findAll.do',8,'[类名]com.changlu.ssm.controller.PermissionController [方法名]findAll'),('eaa293f923cd11eb93049828a640b46f','2020-11-11 11:28:10','tom','0:0:0:0:0:0:0:1','/orders/findAll.do',111,'[类名]com.changlu.ssm.controller.OrdersController [方法名]findAll'),('f3c56d85259811eb8bea9828a640b46f','2020-11-13 18:14:03','tom','0:0:0:0:0:0:0:1','/user/findAll.do',19,'[类名]com.changlu.ssm.controller.UsersController [方法名]findAll'),('f52a1fc4264211ebb7a39828a640b46f','2020-11-14 14:31:00','tom','0:0:0:0:0:0:0:1','/user/findAll.do',21,'[类名]com.changlu.ssm.controller.UsersController [方法名]findAll'),('fc621a5323ce11eb93049828a640b46f','2020-11-11 11:35:50','tom','0:0:0:0:0:0:0:1','/product/findAll.do',35,'[类名]com.changlu.ssm.controller.ProductController [方法名]findAll'),('fde5aab923ce11eb93049828a640b46f','2020-11-11 11:35:52','tom','0:0:0:0:0:0:0:1','/orders/findAll.do',88,'[类名]com.changlu.ssm.controller.OrdersController [方法名]findAll'),('feeb541223ce11eb93049828a640b46f','2020-11-11 11:35:54','tom','0:0:0:0:0:0:0:1','/user/findAll.do',16,'[类名]com.changlu.ssm.controller.UsersController [方法名]findAll'),('ffb1f88023ce11eb93049828a640b46f','2020-11-11 11:35:55','tom','0:0:0:0:0:0:0:1','/role/findAll.do',16,'[类名]com.changlu.ssm.controller.RoleController [方法名]findAll'),('ffcd17b1259611eb8bea9828a640b46f','2020-11-13 18:00:04','tom','0:0:0:0:0:0:0:1','/orders/findAll.do',274,'[类名]com.changlu.ssm.controller.OrdersController [方法名]findAll');

/*Table structure for table `traveller` */

DROP TABLE IF EXISTS `traveller`;

CREATE TABLE `traveller` (
  `id` varchar(32) NOT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `credentialsType` int(11) DEFAULT NULL,
  `credentialsNum` varchar(50) DEFAULT NULL,
  `travellerType` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `traveller` */

insert  into `traveller`(`id`,`NAME`,`sex`,`phoneNum`,`credentialsType`,`credentialsNum`,`travellerType`) values ('3FE27DF2A4E44A6DBC5D0FE4651D3D3E','张龙','男','13333333333',0,'123456789009876543',0),('EE7A71FB6945483FBF91543DBE851960','张小龙','男','15555555555',0,'987654321123456789',1);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` varchar(32) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(100) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`email`,`username`,`PASSWORD`,`phoneNum`,`STATUS`) values ('111-222','tom@itcast.cn','tom','$2a$10$4ZNoWVbMiGonUPMJ5t4jsu2npufHpC.rIqxNuikUE4329aZ4xILgK','133333333',1),('f4d4a2c21f1411eb8c5d9828a640b46f','939974883@qq.com','changlu','$2a$10$aedPpJL4HiXpu3rPOfEpv.HRg4VaoM1EfF1nukoebtZM9mSCTIC4K','1779548124',1);

/*Table structure for table `users_role` */

DROP TABLE IF EXISTS `users_role`;

CREATE TABLE `users_role` (
  `userId` varchar(32) NOT NULL DEFAULT '',
  `roleId` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`userId`,`roleId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `users_role_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `users_role_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users_role` */

insert  into `users_role`(`userId`,`roleId`) values ('111-222','1111'),('f4d4a2c21f1411eb8c5d9828a640b46f','1111'),('111-222','34902936223311eb93049828a640b46f'),('111-222','b17df66f211011eb81d700ffba6ce622');

/* Trigger structure for table `member` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `member_id_trigger` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `member_id_trigger` BEFORE INSERT ON `member` FOR EACH ROW BEGIN
		SET new.id=REPLACE(UUID(),'-',''); -- 触发器执行的逻辑
    END */$$


DELIMITER ;

/* Trigger structure for table `orders` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `orders_id_trigger` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `orders_id_trigger` BEFORE INSERT ON `orders` FOR EACH ROW BEGIN
		SET new.id=REPLACE(UUID(),'-',''); -- 触发器执行的逻辑
    END */$$


DELIMITER ;

/* Trigger structure for table `permission` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `permission_id_trigger` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `permission_id_trigger` BEFORE INSERT ON `permission` FOR EACH ROW BEGIN
    SET new.id=REPLACE(UUID(),'-',''); -- 触发器执行的逻辑
    END */$$


DELIMITER ;

/* Trigger structure for table `product` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `product_id_trigger` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `product_id_trigger` BEFORE INSERT ON `product` FOR EACH ROW BEGIN
		SET new.id=REPLACE(UUID(),'-',''); -- 触发器执行的逻辑
    END */$$


DELIMITER ;

/* Trigger structure for table `role` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `role_id_trigger` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `role_id_trigger` BEFORE INSERT ON `role` FOR EACH ROW BEGIN
    SET new.id=REPLACE(UUID(),'-',''); -- 触发器执行的逻辑
    END */$$


DELIMITER ;

/* Trigger structure for table `syslog` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `syslog_id_trigger` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `syslog_id_trigger` BEFORE INSERT ON `syslog` FOR EACH ROW BEGIN
    SET new.id=REPLACE(UUID(),'-',''); -- 触发器执行的逻辑
    END */$$


DELIMITER ;

/* Trigger structure for table `traveller` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `travller_id_trigger` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `travller_id_trigger` BEFORE INSERT ON `traveller` FOR EACH ROW BEGIN
		SET new.id=REPLACE(UUID(),'-',''); -- 触发器执行的逻辑
    END */$$


DELIMITER ;

/* Trigger structure for table `users` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `users_id_trigger` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `users_id_trigger` BEFORE INSERT ON `users` FOR EACH ROW BEGIN
    SET new.id=REPLACE(UUID(),'-',''); -- 触发器执行的逻辑
    END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
