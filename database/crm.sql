/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : crm

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2018-01-28 11:19:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for attendance
-- ----------------------------
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student` int(11) DEFAULT NULL,
  `attendance_date` int(11) DEFAULT NULL,
  `attendance_status` tinyint(1) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `student_attendance` (`student`),
  KEY `attendace_date_foreign_key` (`attendance_date`),
  CONSTRAINT `attendace_date_foreign_key` FOREIGN KEY (`attendance_date`) REFERENCES `attendance_dates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_attendance` FOREIGN KEY (`student`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of attendance
-- ----------------------------
INSERT INTO `attendance` VALUES ('2', '52', '6', '1', '2018-01-22 17:54:10');
INSERT INTO `attendance` VALUES ('3', '50', '6', '0', '2018-01-22 17:54:10');
INSERT INTO `attendance` VALUES ('4', '44', '6', '0', '2018-01-22 17:54:10');
INSERT INTO `attendance` VALUES ('5', '52', '7', '1', '2018-01-23 18:20:09');
INSERT INTO `attendance` VALUES ('6', '50', '7', '0', '2018-01-22 17:52:14');
INSERT INTO `attendance` VALUES ('7', '44', '7', '1', '2018-01-22 17:50:55');
INSERT INTO `attendance` VALUES ('8', '52', '8', '1', '2018-01-24 12:28:11');
INSERT INTO `attendance` VALUES ('9', '50', '8', '1', '2018-01-24 12:28:11');
INSERT INTO `attendance` VALUES ('10', '44', '8', '0', '2018-01-24 12:28:11');
INSERT INTO `attendance` VALUES ('11', '52', '9', '1', '2018-01-24 12:02:28');
INSERT INTO `attendance` VALUES ('12', '50', '9', '0', '2018-01-24 12:02:28');
INSERT INTO `attendance` VALUES ('13', '44', '9', '0', '2018-01-24 12:02:28');
INSERT INTO `attendance` VALUES ('14', '52', '10', '1', '2018-01-24 12:16:59');
INSERT INTO `attendance` VALUES ('15', '50', '10', '0', '2018-01-24 12:02:40');
INSERT INTO `attendance` VALUES ('16', '44', '10', '1', '2018-01-24 12:02:40');
INSERT INTO `attendance` VALUES ('17', '52', '11', null, null);
INSERT INTO `attendance` VALUES ('18', '50', '11', null, null);
INSERT INTO `attendance` VALUES ('19', '44', '11', null, null);
INSERT INTO `attendance` VALUES ('20', '52', '18', null, null);
INSERT INTO `attendance` VALUES ('21', '50', '18', null, null);
INSERT INTO `attendance` VALUES ('22', '44', '18', null, null);

-- ----------------------------
-- Table structure for attendance_dates
-- ----------------------------
DROP TABLE IF EXISTS `attendance_dates`;
CREATE TABLE `attendance_dates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attendance_date` int(12) DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `delete_date` int(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attendance_batch` (`batch`),
  CONSTRAINT `attendance_batch` FOREIGN KEY (`batch`) REFERENCES `batches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of attendance_dates
-- ----------------------------
INSERT INTO `attendance_dates` VALUES ('6', '1516489200', '93', '2018-01-21 15:20:27', null);
INSERT INTO `attendance_dates` VALUES ('7', '1516575600', '93', '2018-01-21 15:40:08', null);
INSERT INTO `attendance_dates` VALUES ('8', '1516662000', '93', '2018-01-21 15:44:07', null);
INSERT INTO `attendance_dates` VALUES ('9', '1516748400', '93', '2018-01-21 16:01:37', null);
INSERT INTO `attendance_dates` VALUES ('10', '1516834800', '93', '2018-01-21 16:02:03', null);
INSERT INTO `attendance_dates` VALUES ('11', '1516921200', '93', '2018-01-21 16:45:33', '1516707728');
INSERT INTO `attendance_dates` VALUES ('18', '1514847600', '93', '2018-01-22 18:08:42', '1516707708');
INSERT INTO `attendance_dates` VALUES ('19', '1516575600', '94', '2018-01-22 18:10:10', null);

-- ----------------------------
-- Table structure for batches
-- ----------------------------
DROP TABLE IF EXISTS `batches`;
CREATE TABLE `batches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_number` int(5) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `teacher` int(11) DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `class` int(11) DEFAULT NULL,
  `start_time` varchar(12) DEFAULT NULL,
  `end_time` varchar(12) DEFAULT NULL,
  `start_date` int(12) DEFAULT NULL,
  `end_date` int(12) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `delete_date` int(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `teacher` (`teacher`),
  KEY `period` (`period`),
  KEY `class` (`class`),
  CONSTRAINT `class` FOREIGN KEY (`class`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `period` FOREIGN KEY (`period`) REFERENCES `batch_periods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teacher` FOREIGN KEY (`teacher`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `type` FOREIGN KEY (`type`) REFERENCES `batch_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of batches
-- ----------------------------
INSERT INTO `batches` VALUES ('45', '56', '23', null, '1', null, '10:00', '12:00', '1507327200', '1509141600', '2017-10-07 13:22:24', '2017-10-10 15:32:17', '1507360993');
INSERT INTO `batches` VALUES ('46', '12', '23', null, '1', null, '10:08', '11:09', '1508882400', '1509404400', '2017-10-07 13:46:24', '2017-10-10 15:32:17', '1507362494');
INSERT INTO `batches` VALUES ('47', '12', '23', null, '1', null, '10:00', '12:00', '1508104800', '1509404400', '2017-10-07 13:49:22', '2017-10-10 15:32:24', '1507362566');
INSERT INTO `batches` VALUES ('48', '8', '23', null, '1', null, '10:08', '11:09', '1506895200', '1509228000', '2017-10-07 13:58:16', '2017-10-10 15:32:24', '1507363100');
INSERT INTO `batches` VALUES ('52', '56', '23', null, '2', null, '13:45', '16:23', '1507586400', '1509404400', '2017-10-10 16:23:55', '2017-10-14 11:17:38', '1507958258');
INSERT INTO `batches` VALUES ('63', '31', '23', null, '2', null, '13:55', '14:44', '1501538400', '1505167200', '2017-10-12 15:44:52', '2017-10-14 11:17:22', '1507958242');
INSERT INTO `batches` VALUES ('64', '12', '23', '47', '2', '30', '13:53', '15:53', '1506808800', '1509404400', '2017-10-14 15:53:22', '2017-10-15 11:08:59', '1508044139');
INSERT INTO `batches` VALUES ('65', '13', '23', null, '2', null, '13:50', '16:16', '1501538400', '1505340000', '2017-10-14 16:17:16', '2017-10-15 11:08:57', '1508044137');
INSERT INTO `batches` VALUES ('66', '15', '23', null, '2', null, '13:47', '15:48', '1507932000', '1509404400', '2017-10-14 16:48:14', '2017-10-15 11:08:54', '1508044134');
INSERT INTO `batches` VALUES ('67', '16', '23', '47', '2', '30', '13:48', '15:48', '1507932000', '1509404400', '2017-10-14 16:48:59', '2017-10-15 11:08:52', '1508044132');
INSERT INTO `batches` VALUES ('69', '14', '23', null, '2', null, '14:20', '16:30', '1507932000', '1509404400', '2017-10-14 16:54:06', '2017-10-15 11:08:48', '1508044128');
INSERT INTO `batches` VALUES ('71', '65', '23', '47', '3', '30', '17:45', '21:02', '1506808800', '1511996400', '2017-10-14 17:02:32', '2017-10-15 11:08:44', '1508044124');
INSERT INTO `batches` VALUES ('73', '84', '23', null, '2', null, '14:50', '17:22', '1504216800', '1510700400', '2017-10-14 17:23:14', '2017-10-15 11:08:39', '1508044119');
INSERT INTO `batches` VALUES ('74', '1', '23', null, '42', null, '11:12', '12:12', '1507154400', '1509318000', '2017-10-15 11:12:52', '2017-10-15 12:37:12', '1508049432');
INSERT INTO `batches` VALUES ('75', '2', '23', '47', '42', '30', '10:18', '12:00', '1508018400', '1508882400', '2017-10-15 11:19:02', '2017-10-15 12:37:14', '1508049434');
INSERT INTO `batches` VALUES ('76', '3', '23', null, '42', null, '11:20', '12:30', '1504216800', '1507845600', '2017-10-15 11:22:17', '2017-10-15 12:37:16', '1508049436');
INSERT INTO `batches` VALUES ('77', '12', '23', null, '2', null, '13:45', '14:42', '1506808800', '1509404400', '2017-10-15 11:42:27', '2017-10-15 12:37:18', '1508049438');
INSERT INTO `batches` VALUES ('78', '15', '23', '47', '2', '30', '16:00', '18:00', '1506808800', '1509404400', '2017-10-15 12:12:09', '2017-10-15 12:37:20', '1508049440');
INSERT INTO `batches` VALUES ('79', '78', '23', '47', '2', '30', '14:00', '16:00', '1506808800', '1509404400', '2017-10-15 12:13:16', '2017-10-15 12:37:22', '1508049442');
INSERT INTO `batches` VALUES ('80', '16', '23', '46', '2', '30', '17:33', '18:00', '1506808800', '1509404400', '2017-10-15 12:35:04', '2018-01-10 12:54:06', '1515567246');
INSERT INTO `batches` VALUES ('81', '17', '23', '47', '1', '30', '10:35', '12:35', '1509490800', '1511996400', '2017-10-15 12:35:54', '2017-10-16 13:36:49', null);
INSERT INTO `batches` VALUES ('82', '12', '23', '47', '1', '30', '10:07', '13:07', '1504216800', '1508104800', '2017-10-16 14:07:38', '2017-10-16 14:07:40', null);
INSERT INTO `batches` VALUES ('83', '1', '23', '40', '1', '31', '10:08', '13:08', '1506895200', '1509228000', '2017-10-16 14:08:36', '2017-10-16 14:08:39', null);
INSERT INTO `batches` VALUES ('84', '20', '23', '46', '1', '32', '10:53', '12:53', '1507759200', '1511996400', '2017-10-16 14:53:54', '2017-10-16 14:53:58', null);
INSERT INTO `batches` VALUES ('85', '21', '23', '47', '3', '30', '18:59', '20:59', '1502834400', '1505512800', '2017-10-16 14:59:45', '2017-10-16 14:59:48', null);
INSERT INTO `batches` VALUES ('86', '23', '23', '47', '3', '30', '19:01', '21:01', '1476568800', '1477692000', '2017-10-16 15:01:17', '2017-10-16 15:01:19', null);
INSERT INTO `batches` VALUES ('87', '48', '23', '47', '3', '30', '18:23', '21:23', '1506981600', '1509404400', '2017-10-16 17:23:38', '2017-10-16 17:23:40', null);
INSERT INTO `batches` VALUES ('88', '12', '28', '47', '2', '30', '13:50', '14:43', '1507327200', '1509404400', '2017-10-16 17:43:28', '2017-10-16 17:52:20', null);
INSERT INTO `batches` VALUES ('89', '56', '23', '47', '1', '30', '10:26', '12:26', '1508364000', '1509404400', '2017-10-19 15:26:41', '2017-10-19 15:26:58', null);
INSERT INTO `batches` VALUES ('90', '6', '30', '40', '3', '31', '17:51', '21:33', '1508364000', '1509404400', '2017-10-19 15:33:34', '2017-10-19 15:33:50', null);
INSERT INTO `batches` VALUES ('91', '48', '41', '46', '1', '31', '13:50', '14:10', '1506981600', '1509404400', '2017-10-19 15:44:12', '2017-10-19 15:48:20', null);
INSERT INTO `batches` VALUES ('92', '45', '23', null, '1', null, '10:00', '12:52', '1506808800', '1509404400', '2017-10-19 15:50:32', null, null);
INSERT INTO `batches` VALUES ('93', '98', '23', '47', '2', '30', '15:04', '16:04', '1506808800', '1517266800', '2017-10-19 16:04:14', '2017-12-23 12:39:13', null);
INSERT INTO `batches` VALUES ('94', '5', '23', '47', '1', '30', '09:51', '14:05', '1512428400', '1515106800', '2017-12-05 14:54:05', '2017-12-26 12:46:27', null);
INSERT INTO `batches` VALUES ('95', '1', '28', '46', '1', '31', '9:50', '10:48', '1514761200', '1517353200', '2018-01-10 12:48:43', '2018-01-10 12:54:54', null);

-- ----------------------------
-- Table structure for batch_changes
-- ----------------------------
DROP TABLE IF EXISTS `batch_changes`;
CREATE TABLE `batch_changes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch` int(11) DEFAULT NULL,
  `student` int(11) DEFAULT NULL,
  `roll` int(5) DEFAULT NULL,
  `changed_by_user` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `old_batch` (`batch`),
  KEY `associated_student_id` (`student`),
  KEY `changed_by_user` (`changed_by_user`),
  CONSTRAINT `associated_student_id` FOREIGN KEY (`student`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changed_by_user` FOREIGN KEY (`changed_by_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `old_batch` FOREIGN KEY (`batch`) REFERENCES `batches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of batch_changes
-- ----------------------------
INSERT INTO `batch_changes` VALUES ('3', '94', '44', null, '17', '2018-01-07 17:05:27');
INSERT INTO `batch_changes` VALUES ('4', '93', '44', null, '17', '2018-01-07 17:06:36');
INSERT INTO `batch_changes` VALUES ('5', '94', '44', null, '17', '2018-01-07 17:38:38');
INSERT INTO `batch_changes` VALUES ('6', '93', '44', null, '17', '2018-01-07 17:38:46');
INSERT INTO `batch_changes` VALUES ('7', '94', '44', '2', '17', '2018-01-07 18:03:58');
INSERT INTO `batch_changes` VALUES ('8', '93', '44', '3', '17', '2018-01-07 18:04:38');
INSERT INTO `batch_changes` VALUES ('9', '94', '49', '2', '17', '2018-01-25 17:34:28');
INSERT INTO `batch_changes` VALUES ('10', '94', '48', '3', '17', '2018-01-25 17:34:41');
INSERT INTO `batch_changes` VALUES ('11', '95', '43', '1', '17', '2018-01-25 17:36:29');

-- ----------------------------
-- Table structure for batch_days
-- ----------------------------
DROP TABLE IF EXISTS `batch_days`;
CREATE TABLE `batch_days` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch` int(11) DEFAULT NULL,
  `weekday` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `batch` (`batch`) USING BTREE,
  KEY `day` (`weekday`) USING BTREE,
  CONSTRAINT `day` FOREIGN KEY (`weekday`) REFERENCES `days_in_week` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=424 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of batch_days
-- ----------------------------
INSERT INTO `batch_days` VALUES ('35', '12', '1', '2017-09-28 16:40:13');
INSERT INTO `batch_days` VALUES ('36', '12', '3', '2017-09-28 16:40:13');
INSERT INTO `batch_days` VALUES ('37', '12', '5', '2017-09-28 16:40:13');
INSERT INTO `batch_days` VALUES ('38', '13', '1', '2017-09-28 17:10:01');
INSERT INTO `batch_days` VALUES ('39', '13', '3', '2017-09-28 17:10:01');
INSERT INTO `batch_days` VALUES ('40', '13', '5', '2017-09-28 17:10:01');
INSERT INTO `batch_days` VALUES ('41', '14', '1', '2017-09-28 17:12:05');
INSERT INTO `batch_days` VALUES ('42', '14', '3', '2017-09-28 17:12:06');
INSERT INTO `batch_days` VALUES ('43', '14', '5', '2017-09-28 17:12:06');
INSERT INTO `batch_days` VALUES ('44', '15', '1', '2017-10-02 12:33:01');
INSERT INTO `batch_days` VALUES ('45', '15', '3', '2017-10-02 12:33:01');
INSERT INTO `batch_days` VALUES ('46', '15', '5', '2017-10-02 12:33:01');
INSERT INTO `batch_days` VALUES ('47', '16', '1', '2017-10-02 13:42:39');
INSERT INTO `batch_days` VALUES ('48', '16', '3', '2017-10-02 13:42:39');
INSERT INTO `batch_days` VALUES ('49', '16', '5', '2017-10-02 13:42:39');
INSERT INTO `batch_days` VALUES ('56', '23', '1', '2017-10-03 17:41:29');
INSERT INTO `batch_days` VALUES ('57', '23', '3', '2017-10-03 17:41:29');
INSERT INTO `batch_days` VALUES ('58', '23', '5', '2017-10-03 17:41:29');
INSERT INTO `batch_days` VALUES ('59', '24', '1', '2017-10-03 17:47:02');
INSERT INTO `batch_days` VALUES ('60', '24', '3', '2017-10-03 17:47:02');
INSERT INTO `batch_days` VALUES ('61', '24', '5', '2017-10-03 17:47:02');
INSERT INTO `batch_days` VALUES ('62', '34', '1', '2017-10-03 18:16:19');
INSERT INTO `batch_days` VALUES ('63', '34', '3', '2017-10-03 18:16:19');
INSERT INTO `batch_days` VALUES ('64', '34', '5', '2017-10-03 18:16:20');
INSERT INTO `batch_days` VALUES ('68', '36', '1', '2017-10-03 18:22:09');
INSERT INTO `batch_days` VALUES ('69', '36', '3', '2017-10-03 18:22:09');
INSERT INTO `batch_days` VALUES ('70', '36', '5', '2017-10-03 18:22:09');
INSERT INTO `batch_days` VALUES ('71', '37', '1', '2017-10-03 18:23:23');
INSERT INTO `batch_days` VALUES ('72', '37', '3', '2017-10-03 18:23:23');
INSERT INTO `batch_days` VALUES ('73', '37', '5', '2017-10-03 18:23:23');
INSERT INTO `batch_days` VALUES ('104', '45', '1', '2017-10-07 13:22:24');
INSERT INTO `batch_days` VALUES ('105', '45', '3', '2017-10-07 13:22:24');
INSERT INTO `batch_days` VALUES ('106', '45', '5', '2017-10-07 13:22:24');
INSERT INTO `batch_days` VALUES ('107', '46', '1', '2017-10-07 13:46:24');
INSERT INTO `batch_days` VALUES ('108', '46', '3', '2017-10-07 13:46:25');
INSERT INTO `batch_days` VALUES ('109', '46', '5', '2017-10-07 13:46:25');
INSERT INTO `batch_days` VALUES ('110', '47', '2', '2017-10-07 13:49:22');
INSERT INTO `batch_days` VALUES ('111', '48', '1', '2017-10-07 13:58:16');
INSERT INTO `batch_days` VALUES ('112', '49', '1', '2017-10-07 14:06:23');
INSERT INTO `batch_days` VALUES ('113', '49', '2', '2017-10-07 14:06:23');
INSERT INTO `batch_days` VALUES ('114', '38', '1', '2017-10-07 14:11:07');
INSERT INTO `batch_days` VALUES ('115', '38', '3', '2017-10-07 14:11:07');
INSERT INTO `batch_days` VALUES ('116', '38', '5', '2017-10-07 14:11:07');
INSERT INTO `batch_days` VALUES ('123', '44', '1', '2017-10-07 15:48:33');
INSERT INTO `batch_days` VALUES ('124', '44', '2', '2017-10-07 15:48:33');
INSERT INTO `batch_days` VALUES ('125', '44', '3', '2017-10-07 15:48:33');
INSERT INTO `batch_days` VALUES ('126', '50', '1', '2017-10-10 15:08:32');
INSERT INTO `batch_days` VALUES ('127', '50', '3', '2017-10-10 15:08:32');
INSERT INTO `batch_days` VALUES ('128', '50', '5', '2017-10-10 15:08:32');
INSERT INTO `batch_days` VALUES ('129', '51', '1', '2017-10-10 15:09:11');
INSERT INTO `batch_days` VALUES ('130', '51', '3', '2017-10-10 15:09:11');
INSERT INTO `batch_days` VALUES ('131', '51', '5', '2017-10-10 15:09:11');
INSERT INTO `batch_days` VALUES ('132', '52', '1', '2017-10-10 16:23:55');
INSERT INTO `batch_days` VALUES ('133', '52', '3', '2017-10-10 16:23:56');
INSERT INTO `batch_days` VALUES ('134', '52', '5', '2017-10-10 16:23:56');
INSERT INTO `batch_days` VALUES ('135', '53', '1', '2017-10-10 16:51:47');
INSERT INTO `batch_days` VALUES ('136', '53', '3', '2017-10-10 16:51:47');
INSERT INTO `batch_days` VALUES ('137', '53', '5', '2017-10-10 16:51:47');
INSERT INTO `batch_days` VALUES ('138', '54', '1', '2017-10-10 17:57:11');
INSERT INTO `batch_days` VALUES ('139', '54', '3', '2017-10-10 17:57:11');
INSERT INTO `batch_days` VALUES ('140', '54', '5', '2017-10-10 17:57:12');
INSERT INTO `batch_days` VALUES ('141', '55', '1', '2017-10-10 17:57:50');
INSERT INTO `batch_days` VALUES ('142', '55', '3', '2017-10-10 17:57:50');
INSERT INTO `batch_days` VALUES ('143', '55', '5', '2017-10-10 17:57:50');
INSERT INTO `batch_days` VALUES ('147', '57', '1', '2017-10-10 18:13:39');
INSERT INTO `batch_days` VALUES ('148', '57', '3', '2017-10-10 18:13:39');
INSERT INTO `batch_days` VALUES ('149', '57', '5', '2017-10-10 18:13:39');
INSERT INTO `batch_days` VALUES ('150', '56', '1', '2017-10-10 18:13:53');
INSERT INTO `batch_days` VALUES ('151', '56', '3', '2017-10-10 18:13:53');
INSERT INTO `batch_days` VALUES ('152', '56', '5', '2017-10-10 18:13:53');
INSERT INTO `batch_days` VALUES ('153', '58', '1', '2017-10-10 18:24:11');
INSERT INTO `batch_days` VALUES ('154', '58', '3', '2017-10-10 18:24:11');
INSERT INTO `batch_days` VALUES ('155', '58', '5', '2017-10-10 18:24:11');
INSERT INTO `batch_days` VALUES ('156', '59', '1', '2017-10-10 18:24:40');
INSERT INTO `batch_days` VALUES ('157', '59', '3', '2017-10-10 18:24:40');
INSERT INTO `batch_days` VALUES ('158', '59', '5', '2017-10-10 18:24:40');
INSERT INTO `batch_days` VALUES ('159', '60', '1', '2017-10-10 18:25:08');
INSERT INTO `batch_days` VALUES ('160', '60', '3', '2017-10-10 18:25:08');
INSERT INTO `batch_days` VALUES ('161', '60', '5', '2017-10-10 18:25:08');
INSERT INTO `batch_days` VALUES ('162', '61', '1', '2017-10-10 18:25:36');
INSERT INTO `batch_days` VALUES ('163', '61', '3', '2017-10-10 18:25:36');
INSERT INTO `batch_days` VALUES ('164', '61', '5', '2017-10-10 18:25:36');
INSERT INTO `batch_days` VALUES ('168', '63', '1', '2017-10-12 15:44:53');
INSERT INTO `batch_days` VALUES ('169', '63', '3', '2017-10-12 15:44:53');
INSERT INTO `batch_days` VALUES ('170', '63', '5', '2017-10-12 15:44:53');
INSERT INTO `batch_days` VALUES ('171', '62', '1', '2017-10-12 18:33:52');
INSERT INTO `batch_days` VALUES ('172', '62', '3', '2017-10-12 18:33:52');
INSERT INTO `batch_days` VALUES ('173', '62', '5', '2017-10-12 18:33:52');
INSERT INTO `batch_days` VALUES ('174', '64', '1', '2017-10-14 15:53:22');
INSERT INTO `batch_days` VALUES ('175', '64', '3', '2017-10-14 15:53:22');
INSERT INTO `batch_days` VALUES ('176', '64', '5', '2017-10-14 15:53:22');
INSERT INTO `batch_days` VALUES ('177', '65', '1', '2017-10-14 16:17:16');
INSERT INTO `batch_days` VALUES ('178', '65', '3', '2017-10-14 16:17:16');
INSERT INTO `batch_days` VALUES ('179', '65', '5', '2017-10-14 16:17:16');
INSERT INTO `batch_days` VALUES ('183', '67', '2', '2017-10-14 16:48:59');
INSERT INTO `batch_days` VALUES ('184', '67', '4', '2017-10-14 16:48:59');
INSERT INTO `batch_days` VALUES ('185', '67', '6', '2017-10-14 16:48:59');
INSERT INTO `batch_days` VALUES ('186', '67', '7', '2017-10-14 16:48:59');
INSERT INTO `batch_days` VALUES ('187', '66', '1', '2017-10-14 16:49:50');
INSERT INTO `batch_days` VALUES ('188', '66', '3', '2017-10-14 16:49:50');
INSERT INTO `batch_days` VALUES ('189', '66', '5', '2017-10-14 16:49:50');
INSERT INTO `batch_days` VALUES ('190', '68', '1', '2017-10-14 16:52:36');
INSERT INTO `batch_days` VALUES ('191', '68', '3', '2017-10-14 16:52:36');
INSERT INTO `batch_days` VALUES ('192', '68', '5', '2017-10-14 16:52:36');
INSERT INTO `batch_days` VALUES ('196', '69', '1', '2017-10-14 16:54:19');
INSERT INTO `batch_days` VALUES ('197', '69', '3', '2017-10-14 16:54:20');
INSERT INTO `batch_days` VALUES ('198', '69', '5', '2017-10-14 16:54:20');
INSERT INTO `batch_days` VALUES ('199', '70', '1', '2017-10-14 17:02:04');
INSERT INTO `batch_days` VALUES ('200', '70', '3', '2017-10-14 17:02:04');
INSERT INTO `batch_days` VALUES ('201', '70', '5', '2017-10-14 17:02:04');
INSERT INTO `batch_days` VALUES ('222', '71', '1', '2017-10-14 17:06:36');
INSERT INTO `batch_days` VALUES ('223', '71', '4', '2017-10-14 17:06:36');
INSERT INTO `batch_days` VALUES ('224', '71', '6', '2017-10-14 17:06:36');
INSERT INTO `batch_days` VALUES ('225', '71', '7', '2017-10-14 17:06:36');
INSERT INTO `batch_days` VALUES ('235', '72', '1', '2017-10-14 17:09:43');
INSERT INTO `batch_days` VALUES ('236', '72', '3', '2017-10-14 17:09:43');
INSERT INTO `batch_days` VALUES ('237', '72', '5', '2017-10-14 17:09:43');
INSERT INTO `batch_days` VALUES ('269', '73', '1', '2017-10-14 17:41:32');
INSERT INTO `batch_days` VALUES ('322', '76', '1', '2017-10-15 11:31:27');
INSERT INTO `batch_days` VALUES ('323', '74', '3', '2017-10-15 11:31:38');
INSERT INTO `batch_days` VALUES ('324', '74', '5', '2017-10-15 11:31:38');
INSERT INTO `batch_days` VALUES ('325', '77', '1', '2017-10-15 11:42:27');
INSERT INTO `batch_days` VALUES ('326', '77', '3', '2017-10-15 11:42:27');
INSERT INTO `batch_days` VALUES ('327', '77', '5', '2017-10-15 11:42:27');
INSERT INTO `batch_days` VALUES ('328', '75', '2', '2017-10-15 12:09:56');
INSERT INTO `batch_days` VALUES ('329', '75', '4', '2017-10-15 12:09:56');
INSERT INTO `batch_days` VALUES ('330', '75', '6', '2017-10-15 12:09:56');
INSERT INTO `batch_days` VALUES ('334', '79', '1', '2017-10-15 12:13:16');
INSERT INTO `batch_days` VALUES ('335', '79', '3', '2017-10-15 12:13:16');
INSERT INTO `batch_days` VALUES ('336', '79', '5', '2017-10-15 12:13:17');
INSERT INTO `batch_days` VALUES ('337', '78', '1', '2017-10-15 12:14:46');
INSERT INTO `batch_days` VALUES ('338', '78', '3', '2017-10-15 12:14:46');
INSERT INTO `batch_days` VALUES ('339', '78', '5', '2017-10-15 12:14:46');
INSERT INTO `batch_days` VALUES ('352', '80', '1', '2017-10-15 12:39:34');
INSERT INTO `batch_days` VALUES ('353', '80', '3', '2017-10-15 12:39:34');
INSERT INTO `batch_days` VALUES ('354', '80', '5', '2017-10-15 12:39:34');
INSERT INTO `batch_days` VALUES ('355', '81', '4', '2017-10-15 12:41:21');
INSERT INTO `batch_days` VALUES ('356', '81', '6', '2017-10-15 12:41:21');
INSERT INTO `batch_days` VALUES ('357', '82', '1', '2017-10-16 14:07:38');
INSERT INTO `batch_days` VALUES ('358', '82', '3', '2017-10-16 14:07:38');
INSERT INTO `batch_days` VALUES ('359', '82', '5', '2017-10-16 14:07:38');
INSERT INTO `batch_days` VALUES ('360', '83', '1', '2017-10-16 14:08:36');
INSERT INTO `batch_days` VALUES ('361', '83', '3', '2017-10-16 14:08:36');
INSERT INTO `batch_days` VALUES ('362', '83', '5', '2017-10-16 14:08:36');
INSERT INTO `batch_days` VALUES ('363', '84', '1', '2017-10-16 14:53:54');
INSERT INTO `batch_days` VALUES ('364', '84', '3', '2017-10-16 14:53:54');
INSERT INTO `batch_days` VALUES ('365', '84', '5', '2017-10-16 14:53:55');
INSERT INTO `batch_days` VALUES ('366', '85', '1', '2017-10-16 14:59:45');
INSERT INTO `batch_days` VALUES ('367', '85', '3', '2017-10-16 14:59:45');
INSERT INTO `batch_days` VALUES ('368', '85', '5', '2017-10-16 14:59:45');
INSERT INTO `batch_days` VALUES ('369', '86', '1', '2017-10-16 15:01:17');
INSERT INTO `batch_days` VALUES ('370', '86', '3', '2017-10-16 15:01:17');
INSERT INTO `batch_days` VALUES ('371', '86', '5', '2017-10-16 15:01:17');
INSERT INTO `batch_days` VALUES ('372', '87', '1', '2017-10-16 17:23:38');
INSERT INTO `batch_days` VALUES ('373', '87', '3', '2017-10-16 17:23:39');
INSERT INTO `batch_days` VALUES ('374', '87', '5', '2017-10-16 17:23:39');
INSERT INTO `batch_days` VALUES ('378', '88', '1', '2017-10-16 17:52:13');
INSERT INTO `batch_days` VALUES ('379', '89', '1', '2017-10-19 15:26:41');
INSERT INTO `batch_days` VALUES ('380', '89', '3', '2017-10-19 15:26:41');
INSERT INTO `batch_days` VALUES ('381', '89', '5', '2017-10-19 15:26:41');
INSERT INTO `batch_days` VALUES ('382', '90', '1', '2017-10-19 15:33:34');
INSERT INTO `batch_days` VALUES ('383', '90', '3', '2017-10-19 15:33:34');
INSERT INTO `batch_days` VALUES ('384', '90', '5', '2017-10-19 15:33:34');
INSERT INTO `batch_days` VALUES ('385', '91', '1', '2017-10-19 15:44:12');
INSERT INTO `batch_days` VALUES ('386', '91', '3', '2017-10-19 15:44:12');
INSERT INTO `batch_days` VALUES ('387', '91', '5', '2017-10-19 15:44:12');
INSERT INTO `batch_days` VALUES ('388', '92', '1', '2017-10-19 15:50:32');
INSERT INTO `batch_days` VALUES ('389', '92', '3', '2017-10-19 15:50:32');
INSERT INTO `batch_days` VALUES ('390', '92', '5', '2017-10-19 15:50:32');
INSERT INTO `batch_days` VALUES ('394', '94', '1', '2017-12-05 14:54:05');
INSERT INTO `batch_days` VALUES ('395', '94', '3', '2017-12-05 14:54:05');
INSERT INTO `batch_days` VALUES ('396', '94', '5', '2017-12-05 14:54:06');
INSERT INTO `batch_days` VALUES ('403', '93', '1', '2017-12-23 12:39:10');
INSERT INTO `batch_days` VALUES ('404', '93', '3', '2017-12-23 12:39:10');
INSERT INTO `batch_days` VALUES ('405', '93', '5', '2017-12-23 12:39:11');
INSERT INTO `batch_days` VALUES ('421', '95', '1', '2018-01-10 12:53:38');
INSERT INTO `batch_days` VALUES ('422', '95', '3', '2018-01-10 12:53:38');
INSERT INTO `batch_days` VALUES ('423', '95', '5', '2018-01-10 12:53:38');

-- ----------------------------
-- Table structure for batch_periods
-- ----------------------------
DROP TABLE IF EXISTS `batch_periods`;
CREATE TABLE `batch_periods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `period` varchar(50) DEFAULT NULL,
  `start_time` varchar(10) DEFAULT NULL,
  `expand_start_time` int(2) DEFAULT NULL,
  `end_time` varchar(10) DEFAULT NULL,
  `expand_end_time` int(2) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `delete_date` int(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of batch_periods
-- ----------------------------
INSERT INTO `batch_periods` VALUES ('1', 'Morning', '10:00', '15', '14:00', '15', '2017-10-07 16:08:48', '2017-10-15 12:41:09', null);
INSERT INTO `batch_periods` VALUES ('2', 'Day', '14:00', '15', '18:00', '15', '2017-10-07 16:08:48', '2017-10-15 12:30:28', null);
INSERT INTO `batch_periods` VALUES ('3', 'Evening', '18:00', '15', '22:00', '0', '2017-10-07 16:08:48', '2017-10-10 18:17:35', null);
INSERT INTO `batch_periods` VALUES ('40', 'Xpunged', '01:26', '0', '04:26', '0', '2017-10-15 12:26:28', '2017-10-15 12:26:35', '1508048795');
INSERT INTO `batch_periods` VALUES ('41', 'Xpunged', '10:00', '15', '13:00', '15', '2017-10-15 12:27:58', '2017-10-15 12:29:19', '1508048959');
INSERT INTO `batch_periods` VALUES ('42', 'Xpunged', '10:00', '15', '14:00', '15', '2017-10-15 12:31:15', '2017-10-15 12:38:18', '1508049498');
INSERT INTO `batch_periods` VALUES ('43', 'Night', '22:05', '15', '23:58', '15', '2018-01-10 12:58:18', null, null);

-- ----------------------------
-- Table structure for batch_types
-- ----------------------------
DROP TABLE IF EXISTS `batch_types`;
CREATE TABLE `batch_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) DEFAULT NULL,
  `acronym` varchar(10) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `delete_date` int(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of batch_types
-- ----------------------------
INSERT INTO `batch_types` VALUES ('23', 'Hello New Batch Type Right', 'HNBTR', '2017-09-18 12:30:24', '2017-09-21 17:24:08', null);
INSERT INTO `batch_types` VALUES ('24', 'New Batch Type', 'NBT', '2017-09-19 10:28:23', null, '1505796961');
INSERT INTO `batch_types` VALUES ('25', 'New Batch Type', 'NBT', '2017-09-19 10:56:32', null, '1505805374');
INSERT INTO `batch_types` VALUES ('26', 'What Going On', 'WGO', '2017-09-19 11:03:16', null, '1505805386');
INSERT INTO `batch_types` VALUES ('27', 'New Batch For Delete', 'NBFD', '2017-09-19 13:06:32', null, '1505804796');
INSERT INTO `batch_types` VALUES ('28', 'Japanese Language Batch', 'JLB', '2017-09-19 13:08:09', null, null);
INSERT INTO `batch_types` VALUES ('29', 'International English Language Testing System', 'IELTS', '2017-09-19 13:09:16', null, null);
INSERT INTO `batch_types` VALUES ('30', 'What Going On', 'WGO', '2017-09-19 13:16:55', null, null);
INSERT INTO `batch_types` VALUES ('35', 'Tytytyty Tytytyty', 'TT', '2017-09-19 18:12:45', '2017-09-23 12:43:42', '1506149022');
INSERT INTO `batch_types` VALUES ('37', 'Delete This Batch Type', 'DTBT', '2017-09-20 10:37:02', null, '1505882227');
INSERT INTO `batch_types` VALUES ('38', 'Another New Batch', 'ANB', '2017-09-20 11:00:48', null, null);
INSERT INTO `batch_types` VALUES ('40', 'Another Batch For Checking ', 'ABFC', '2017-09-20 17:50:26', null, null);
INSERT INTO `batch_types` VALUES ('41', 'Another New Batch For Testing', 'ANBFT', '2017-09-20 17:57:11', null, null);
INSERT INTO `batch_types` VALUES ('42', 'New Batch Edited', 'NBE', '2017-09-23 11:27:19', '2017-09-24 12:51:56', null);
INSERT INTO `batch_types` VALUES ('43', 'New Batch Type For Checking Extention', 'NBTFCE', '2017-09-24 12:51:31', null, null);

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `delete_date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of classes
-- ----------------------------
INSERT INTO `classes` VALUES ('29', '01', '2017-09-25 15:20:15', '2017-09-25 15:20:15', '1506331215');
INSERT INTO `classes` VALUES ('30', '01', '2017-09-25 15:20:35', null, null);
INSERT INTO `classes` VALUES ('31', '02', '2017-09-25 15:20:39', null, null);
INSERT INTO `classes` VALUES ('32', '03', '2017-09-25 15:20:42', null, null);
INSERT INTO `classes` VALUES ('33', '04', '2017-09-25 15:20:44', null, null);

-- ----------------------------
-- Table structure for days_in_week
-- ----------------------------
DROP TABLE IF EXISTS `days_in_week`;
CREATE TABLE `days_in_week` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weekday` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of days_in_week
-- ----------------------------
INSERT INTO `days_in_week` VALUES ('1', 'Saturday');
INSERT INTO `days_in_week` VALUES ('2', 'Sunday');
INSERT INTO `days_in_week` VALUES ('3', 'Monday');
INSERT INTO `days_in_week` VALUES ('4', 'Tuesday');
INSERT INTO `days_in_week` VALUES ('5', 'Wednesday');
INSERT INTO `days_in_week` VALUES ('6', 'Thursday');
INSERT INTO `days_in_week` VALUES ('7', 'Friday');

-- ----------------------------
-- Table structure for degrees
-- ----------------------------
DROP TABLE IF EXISTS `degrees`;
CREATE TABLE `degrees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of degrees
-- ----------------------------
INSERT INTO `degrees` VALUES ('1', 'Primary School Certificate (PSC)');
INSERT INTO `degrees` VALUES ('2', 'Junior School Certificate (JSC)');
INSERT INTO `degrees` VALUES ('3', 'Secondary School Certificate (SSC) ');
INSERT INTO `degrees` VALUES ('4', 'Higher School Certificate (HSC)');
INSERT INTO `degrees` VALUES ('5', 'Diploma');
INSERT INTO `degrees` VALUES ('6', 'Associate of Arts (A.A.)');
INSERT INTO `degrees` VALUES ('7', 'Associate of Science (A.S.)');
INSERT INTO `degrees` VALUES ('8', 'Associate of Applied Science (AAS)');
INSERT INTO `degrees` VALUES ('9', 'Bachelor of Arts (B.A.)');
INSERT INTO `degrees` VALUES ('10', 'Bachelor of Science (B.S.)');
INSERT INTO `degrees` VALUES ('11', 'Bachelor of Fine Arts (BFA)');
INSERT INTO `degrees` VALUES ('12', 'Bachelor of Applied Science (BAS)');
INSERT INTO `degrees` VALUES ('13', 'Master of Arts (M.A.)');
INSERT INTO `degrees` VALUES ('14', 'Master of Science (M.S.)');
INSERT INTO `degrees` VALUES ('15', 'Master of Business Administration (MBA)');
INSERT INTO `degrees` VALUES ('16', 'Doctor of Philosophy (Ph.D.)');
INSERT INTO `degrees` VALUES ('17', 'Juris Doctor (J.D.)');
INSERT INTO `degrees` VALUES ('18', 'Doctor of Medicine (M.D.)');
INSERT INTO `degrees` VALUES ('19', 'Doctor of Dental Surgery (DDS)');
INSERT INTO `degrees` VALUES ('20', 'Other...');
INSERT INTO `degrees` VALUES ('21', 'None!');

-- ----------------------------
-- Table structure for education_record
-- ----------------------------
DROP TABLE IF EXISTS `education_record`;
CREATE TABLE `education_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `institude` varchar(255) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `degree` varchar(20) DEFAULT NULL,
  `start_date` int(12) DEFAULT NULL,
  `end_date` int(12) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `delete_date` int(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_qualificatoin` (`user_id`),
  CONSTRAINT `user_qualificatoin` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of education_record
-- ----------------------------
INSERT INTO `education_record` VALUES ('2', '52', 'sdfsdfsdfsdf', 'sdfsdfsdfsdf', '2', '1509490800', '1511996400', '2017-11-20 18:06:00', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `education_record` VALUES ('8', '52', 'fghfghfgh', 'fghfghfgh', '7', '1512082800', '1514588400', '2017-11-21 15:30:50', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `education_record` VALUES ('9', '52', 'fsdfsdfsdfsdf', 'sdfsdfsdf', '10', '1474408800', '1477000800', '2017-11-21 15:54:12', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `education_record` VALUES ('10', '52', 'sdfsdfsdfsdf', 'sdfsdfsdfsdf', '20', '1416524400', '1417302000', '2017-11-21 15:56:32', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `education_record` VALUES ('11', '52', 'sdfsdfsd', 'fsdfsdfsdf', '20', '1408572000', '1413842400', '2017-11-21 15:57:37', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `education_record` VALUES ('12', '52', 'sdfsdfsdfsdf', 'sdfsdfsdfsdf', '3', '1398031200', '1400623200', '2017-11-21 16:23:44', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `education_record` VALUES ('13', '52', 'fgdfgdf', 'gdfgdfgdf', '1', '1509490800', '1511996400', '2017-11-21 18:08:03', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `education_record` VALUES ('14', '52', 'asdasdsdfsdf', 'sdfsdfsdf', '20', '1501538400', '1506722400', '2017-11-21 18:10:00', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `education_record` VALUES ('15', '52', 'asdasdsdfsdf', 'sdfsdfsdf', '6', '1501538400', '1506722400', '2017-11-21 18:14:55', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `education_record` VALUES ('16', '52', 'dsfgdfgdf', 'gdfgdfg', '20', '1320102000', '1322607600', '2017-11-21 18:16:19', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `education_record` VALUES ('17', '52', 'asdasdasd', 'asdasdasd', '21', '1340229600', '1342821600', '2017-11-21 18:16:49', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `education_record` VALUES ('18', '52', 'sfsdfsdfsdf', 'sdfsdfsdfsdf', '16', '1516489200', '1519167600', '2017-11-21 18:17:13', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `education_record` VALUES ('19', '52', 'dsdfsdf', 'sdfsdfsd', '14', '1574290800', '1575068400', '2017-11-21 18:17:42', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `education_record` VALUES ('20', '52', 'dfgdfgdfg', 'dfgdfgdfgdfgdfg', '4', '1102633200', '1134169200', '2017-12-10 17:51:31', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `education_record` VALUES ('21', '52', 'gsdfgdfgdf', 'dfgdfgdfgdf', '20', '1007938800', '1039474800', '2017-12-10 17:55:36', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `education_record` VALUES ('22', '403', 'asdasdasd asdasd', 'asdasd', '1', '1514070000', '1516748400', '2018-01-24 17:56:42', '2018-01-24 17:57:59', '1516795079');
INSERT INTO `education_record` VALUES ('23', '403', 'asdasd', 'asdasdasd', '2', '1541026800', '1548284400', '2018-01-24 17:57:45', '2018-01-24 17:57:49', '1516795069');

-- ----------------------------
-- Table structure for exams
-- ----------------------------
DROP TABLE IF EXISTS `exams`;
CREATE TABLE `exams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `max_score` int(3) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `exam_date` int(12) DEFAULT NULL,
  `exam_time` varchar(5) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `delete_date` int(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_batch` (`batch`),
  CONSTRAINT `exam_batch` FOREIGN KEY (`batch`) REFERENCES `batches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of exams
-- ----------------------------
INSERT INTO `exams` VALUES ('12', '93', 'sdfsdf', '89', 'sdfsdfsdf', '1576105200', '16:06', '2017-12-23 16:06:22', '2017-12-23 17:47:38', '1514029658');
INSERT INTO `exams` VALUES ('13', '93', 'sdfsdf', '45', 'sdfsdfsdf', '1514242800', '17:14', '2017-12-23 17:15:25', '2017-12-23 17:41:38', '1514029298');
INSERT INTO `exams` VALUES ('14', '93', 'asdasd', '89', 'asdasdasd', '1515711600', '17:35', '2017-12-23 17:35:54', '2017-12-23 17:41:40', '1514029300');
INSERT INTO `exams` VALUES ('15', '93', 'asdasdasd', '89', 'asdasdas', '1519340400', '17:36', '2017-12-23 17:36:26', '2017-12-23 17:41:42', '1514029302');
INSERT INTO `exams` VALUES ('16', '93', 'asdasd', '45', 'asdasdasd', '1519426800', '17:37', '2017-12-23 17:37:29', '2017-12-23 17:43:06', '1514029386');
INSERT INTO `exams` VALUES ('17', '93', 'asdasdasd', '34', 'asdasdasd', '1514674800', '17:41', '2017-12-23 17:41:56', '2017-12-23 17:43:04', '1514029384');
INSERT INTO `exams` VALUES ('18', '93', 'asdasdasd', '34', 'asdasdasd', '1514588400', '17:41', '2017-12-23 17:42:42', '2017-12-23 17:43:02', '1514029382');
INSERT INTO `exams` VALUES ('19', '93', 'asdasdasd', '34', 'asdasdasd', '1514674800', '17:43', '2017-12-23 17:43:20', '2017-12-23 17:43:36', '1514029416');
INSERT INTO `exams` VALUES ('20', '93', 'asdasdasd', '89', 'asdasdasd', '1514674800', '17:43', '2017-12-23 17:44:16', '2017-12-23 17:44:40', '1514029480');
INSERT INTO `exams` VALUES ('21', '93', 'asdasd', '89', 'asdasdasd', '1514674800', '17:43', '2017-12-23 17:44:47', null, null);
INSERT INTO `exams` VALUES ('22', '93', 'asdasd', '45', 'asdasdasd', '1514502000', '17:46', '2017-12-23 17:46:14', null, null);
INSERT INTO `exams` VALUES ('23', '93', 'sdfsdfsdf', '45', 'asdasdasd', '1516662000', '18:06', '2017-12-23 18:06:35', '2017-12-23 18:06:54', '1514030814');
INSERT INTO `exams` VALUES ('24', '93', 'asdasd', '34', 'asdasdasd', '1516662000', '18:08', '2017-12-23 18:08:48', '2017-12-23 18:08:58', '1514030938');
INSERT INTO `exams` VALUES ('25', '93', 'sdfsdf', '34', 'sdfsdfsdf', '1516662000', '18:09', '2017-12-23 18:09:47', '2017-12-23 18:10:21', '1514031021');
INSERT INTO `exams` VALUES ('26', '93', 'dfgdfg', '45', 'sdfsdfsdf', '1514588400', '18:10', '2017-12-23 18:10:44', null, null);
INSERT INTO `exams` VALUES ('27', '93', 'sdfsdf', '56', 'sdfsdfsdf', '1517353200', '18:12', '2017-12-23 18:13:07', '2017-12-23 18:19:11', '1514031551');
INSERT INTO `exams` VALUES ('28', '93', 'Fortify', '56', 'asdasdasdasdasd', '1514502000', '17:23', '2017-12-28 17:23:45', '2018-01-03 16:30:43', null);
INSERT INTO `exams` VALUES ('29', '93', 'new', '20', 'sdfsdfsdf', '1515625200', '17:36', '2017-12-28 17:36:41', null, null);
INSERT INTO `exams` VALUES ('32', '93', 'asdasd', '34', 'asdasdasd', '1516575600', '15:24', '2018-01-02 15:27:06', null, null);
INSERT INTO `exams` VALUES ('33', '93', 'Madar', '89', 'asdasdasd', '1516057200', '15:12', '2018-01-03 15:12:50', null, null);
INSERT INTO `exams` VALUES ('34', '93', 'ghgh', '334', 'sdfsdfsdf', '1515020400', '16:31', '2018-01-03 16:31:50', null, null);
INSERT INTO `exams` VALUES ('35', '93', 'Changed Notification', '56', 'asasdasd', '1516748400', '15:56', '2018-01-04 15:56:10', '2018-01-04 15:56:35', '1515059795');
INSERT INTO `exams` VALUES ('36', '93', 'Changed Notification', '56', 'asasdasd', '1516748400', '15:56', '2018-01-04 15:57:00', '2018-01-04 15:59:25', '1515059965');
INSERT INTO `exams` VALUES ('37', '93', 'Changed', '56', 'asasdasd', '1516748400', '15:56', '2018-01-04 15:59:34', '2018-01-04 16:25:20', '1515061520');
INSERT INTO `exams` VALUES ('38', '93', 'Changed', '89', 'asdasda', '1515538800', '16:25', '2018-01-04 16:26:02', null, null);
INSERT INTO `exams` VALUES ('39', '93', 'try catch', '34', 'asdasdasd', '1517007600', '13:49', '2018-01-10 13:50:00', null, null);

-- ----------------------------
-- Table structure for exam_marks
-- ----------------------------
DROP TABLE IF EXISTS `exam_marks`;
CREATE TABLE `exam_marks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam` int(11) DEFAULT NULL,
  `student` int(11) DEFAULT NULL,
  `score` int(3) DEFAULT NULL,
  `exam_comment` varchar(500) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `delete_date` int(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mark_exam` (`exam`),
  KEY `mark_student` (`student`),
  CONSTRAINT `mark_exam` FOREIGN KEY (`exam`) REFERENCES `exams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mark_student` FOREIGN KEY (`student`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of exam_marks
-- ----------------------------
INSERT INTO `exam_marks` VALUES ('1', '21', '52', '45', 'dfgdfgFG', '2017-12-24 13:21:59', null);
INSERT INTO `exam_marks` VALUES ('2', '21', '50', '67', 'dfgdfIO', '2017-12-24 13:21:59', null);
INSERT INTO `exam_marks` VALUES ('3', '21', '44', '12', 'gdfgdfgdfIOUYY', '2017-12-24 13:21:59', null);
INSERT INTO `exam_marks` VALUES ('4', '22', '52', '45', 'yui', '2018-01-02 15:32:11', null);
INSERT INTO `exam_marks` VALUES ('5', '22', '50', '45', 'yuiyui', '2018-01-02 15:32:34', null);
INSERT INTO `exam_marks` VALUES ('6', '22', '44', '45', 'cghgh', '2018-01-02 15:32:34', null);
INSERT INTO `exam_marks` VALUES ('7', '26', '52', '45', 'sdfsdf', '2018-01-04 17:32:45', null);
INSERT INTO `exam_marks` VALUES ('8', '26', '50', '12', 'sdfsdf', '2018-01-04 17:32:46', null);
INSERT INTO `exam_marks` VALUES ('9', '26', '44', '24', 'sdfsdfsdf', '2018-01-04 17:32:46', null);
INSERT INTO `exam_marks` VALUES ('10', '27', '52', null, null, '2017-12-23 18:19:11', '1514031551');
INSERT INTO `exam_marks` VALUES ('11', '27', '50', null, null, '2017-12-23 18:19:11', '1514031551');
INSERT INTO `exam_marks` VALUES ('12', '27', '44', null, null, '2017-12-23 18:19:11', '1514031551');
INSERT INTO `exam_marks` VALUES ('13', '28', '52', '27', 'asdasdasd', '2018-01-10 13:51:03', null);
INSERT INTO `exam_marks` VALUES ('14', '28', '50', '35', 'asdasda', '2018-01-10 13:51:03', null);
INSERT INTO `exam_marks` VALUES ('15', '28', '44', '45', 'sdasdasdasd', '2018-01-10 13:51:03', null);
INSERT INTO `exam_marks` VALUES ('16', '29', '52', null, null, null, null);
INSERT INTO `exam_marks` VALUES ('17', '29', '50', null, null, null, null);
INSERT INTO `exam_marks` VALUES ('18', '29', '44', null, null, null, null);
INSERT INTO `exam_marks` VALUES ('25', '32', '52', null, null, null, null);
INSERT INTO `exam_marks` VALUES ('26', '32', '50', null, null, null, null);
INSERT INTO `exam_marks` VALUES ('27', '32', '44', null, null, null, null);
INSERT INTO `exam_marks` VALUES ('28', '33', '52', null, null, null, null);
INSERT INTO `exam_marks` VALUES ('29', '33', '50', null, null, null, null);
INSERT INTO `exam_marks` VALUES ('30', '33', '44', null, null, null, null);
INSERT INTO `exam_marks` VALUES ('31', '34', '52', null, null, null, null);
INSERT INTO `exam_marks` VALUES ('32', '34', '50', null, null, null, null);
INSERT INTO `exam_marks` VALUES ('33', '34', '44', null, null, null, null);
INSERT INTO `exam_marks` VALUES ('34', '35', '52', null, null, '2018-01-04 15:56:35', '1515059795');
INSERT INTO `exam_marks` VALUES ('35', '35', '50', null, null, '2018-01-04 15:56:35', '1515059795');
INSERT INTO `exam_marks` VALUES ('36', '35', '44', null, null, '2018-01-04 15:56:35', '1515059795');
INSERT INTO `exam_marks` VALUES ('37', '36', '52', null, null, '2018-01-04 15:59:25', '1515059965');
INSERT INTO `exam_marks` VALUES ('38', '36', '50', null, null, '2018-01-04 15:59:25', '1515059965');
INSERT INTO `exam_marks` VALUES ('39', '36', '44', null, null, '2018-01-04 15:59:25', '1515059965');
INSERT INTO `exam_marks` VALUES ('40', '37', '52', null, null, '2018-01-04 16:25:20', '1515061520');
INSERT INTO `exam_marks` VALUES ('41', '37', '50', null, null, '2018-01-04 16:25:20', '1515061520');
INSERT INTO `exam_marks` VALUES ('42', '37', '44', null, null, '2018-01-04 16:25:20', '1515061520');
INSERT INTO `exam_marks` VALUES ('43', '38', '52', null, null, null, null);
INSERT INTO `exam_marks` VALUES ('44', '38', '50', null, null, null, null);
INSERT INTO `exam_marks` VALUES ('45', '38', '44', null, null, null, null);
INSERT INTO `exam_marks` VALUES ('46', '39', '52', null, null, null, null);
INSERT INTO `exam_marks` VALUES ('47', '39', '50', null, null, null, null);
INSERT INTO `exam_marks` VALUES ('48', '39', '44', null, null, null, null);

-- ----------------------------
-- Table structure for japanese_language_levels
-- ----------------------------
DROP TABLE IF EXISTS `japanese_language_levels`;
CREATE TABLE `japanese_language_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of japanese_language_levels
-- ----------------------------
INSERT INTO `japanese_language_levels` VALUES ('1', 'N1');
INSERT INTO `japanese_language_levels` VALUES ('2', 'N2');
INSERT INTO `japanese_language_levels` VALUES ('3', 'N3');
INSERT INTO `japanese_language_levels` VALUES ('4', 'N4');
INSERT INTO `japanese_language_levels` VALUES ('5', 'N5');

-- ----------------------------
-- Table structure for japanese_language_tests
-- ----------------------------
DROP TABLE IF EXISTS `japanese_language_tests`;
CREATE TABLE `japanese_language_tests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of japanese_language_tests
-- ----------------------------
INSERT INTO `japanese_language_tests` VALUES ('1', 'NAT');
INSERT INTO `japanese_language_tests` VALUES ('2', 'JLPT');
INSERT INTO `japanese_language_tests` VALUES ('3', 'J ');

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(50) DEFAULT NULL,
  `message` varchar(10000) DEFAULT NULL,
  `sender` int(11) DEFAULT NULL,
  `reciever` int(11) DEFAULT NULL,
  `viewed_by_reciever` int(12) DEFAULT NULL,
  `delete_from_sender` int(12) DEFAULT NULL,
  `delete_from_reciever` int(12) DEFAULT NULL,
  `send_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `sender` (`sender`),
  KEY `reciever` (`reciever`),
  CONSTRAINT `reciever` FOREIGN KEY (`reciever`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sender` FOREIGN KEY (`sender`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of messages
-- ----------------------------
INSERT INTO `messages` VALUES ('1', '4c06fad1a0e7b0f44a318d46217cc750', '<p>asdasdasd</p>', '17', '34', null, null, null, '2017-09-12 11:36:45');
INSERT INTO `messages` VALUES ('2', '4c06fad1a0e7b0f44a318d46217cc750', '<p>asdasdasd</p>', '17', '34', null, null, null, '2017-09-12 11:36:47');
INSERT INTO `messages` VALUES ('3', '08b3f4b0ce926e546d0a760209b2915f', '<p>zzxczxczxc</p>', '17', '33', '1505194652', null, null, '2017-09-12 11:37:02');
INSERT INTO `messages` VALUES ('4', '08b3f4b0ce926e546d0a760209b2915f', '<p>zxczxc</p>', '17', '33', '1505194652', null, null, '2017-09-12 11:37:04');
INSERT INTO `messages` VALUES ('5', '08b3f4b0ce926e546d0a760209b2915f', '<p>vxcvxcvxcv</p>', '33', '17', '1505194696', null, null, '2017-09-12 11:37:37');
INSERT INTO `messages` VALUES ('6', '9b7c4cf09a3c871ee856651b59a3e3b8', '<p>zxczxczxc</p>', '33', '21', null, null, null, '2017-09-12 11:37:48');
INSERT INTO `messages` VALUES ('7', '08b3f4b0ce926e546d0a760209b2915f', '<p>hrllo</p>', '17', '33', null, null, null, '2017-09-12 11:39:18');
INSERT INTO `messages` VALUES ('12', '08b3f4b0ce926e546d0a760209b2915f', '<p>sdfsdfs</p>', '17', '33', null, null, null, '2017-09-12 11:48:25');
INSERT INTO `messages` VALUES ('13', '08b3f4b0ce926e546d0a760209b2915f', '<p>asdasdasd</p>', '17', '33', null, null, null, '2017-09-12 11:50:43');
INSERT INTO `messages` VALUES ('14', '08b3f4b0ce926e546d0a760209b2915f', '<p>zxczxczxc</p>', '17', '33', null, null, null, '2017-09-12 11:52:53');
INSERT INTO `messages` VALUES ('15', 'e8557f4dcc11a9324c0f29a78fa04b9c', '<p>sdfsdfsdf</p>', '17', '32', null, null, null, '2017-09-12 11:54:05');
INSERT INTO `messages` VALUES ('16', 'e8557f4dcc11a9324c0f29a78fa04b9c', '<p>sdfsdfsdf<img src=\"views/assets/plugins/tinymce/plugins/emoticons/img/smiley-money-mouth.gif\" alt=\"money-mouth\" /></p>', '17', '32', null, null, null, '2017-09-12 11:54:12');
INSERT INTO `messages` VALUES ('17', 'e8557f4dcc11a9324c0f29a78fa04b9c', '<p>zxczxczxc</p>', '17', '32', null, null, null, '2017-09-12 11:55:27');
INSERT INTO `messages` VALUES ('18', 'e8557f4dcc11a9324c0f29a78fa04b9c', '<p>zxczxczxc</p>', '17', '32', null, null, null, '2017-09-12 11:55:50');
INSERT INTO `messages` VALUES ('19', 'cfac3f33bf0ed9cb7b2e0d9ce5a13d09', '<p>xcvxcvxcv</p>', '17', '31', '1505209004', '1505209295', null, '2017-09-12 11:57:22');
INSERT INTO `messages` VALUES ('20', 'cfac3f33bf0ed9cb7b2e0d9ce5a13d09', '<p>bvnvbnvbn</p>', '17', '31', '1505209004', '1505209295', null, '2017-09-12 11:57:24');
INSERT INTO `messages` VALUES ('21', 'ca92277769290a149935446597ec9286', '<p>xcvxcvxcvxcv</p>', '17', '30', '1505197453', null, null, '2017-09-12 11:57:46');
INSERT INTO `messages` VALUES ('22', 'ca92277769290a149935446597ec9286', '<p>xcvbvnvbnv</p>', '17', '30', '1505197453', null, null, '2017-09-12 11:57:49');
INSERT INTO `messages` VALUES ('23', '9a8157d48f5932d16aa99d3459f7a32e', '<p>xcvxcvxcvxcv</p>', '17', '28', null, null, null, '2017-09-12 11:58:01');
INSERT INTO `messages` VALUES ('24', '9a8157d48f5932d16aa99d3459f7a32e', '<p>vcvbbbcvb</p>', '17', '28', null, null, null, '2017-09-12 11:58:04');
INSERT INTO `messages` VALUES ('25', 'b3804bb3a26936f1f9e6cb3a7671ea25', '<p>xcvxcvxcvxcvxcv</p>', '17', '27', '1505377032', null, null, '2017-09-12 11:58:16');
INSERT INTO `messages` VALUES ('26', 'b3804bb3a26936f1f9e6cb3a7671ea25', '<p>bcvbcvb</p>', '17', '27', '1505377032', null, null, '2017-09-12 11:58:18');
INSERT INTO `messages` VALUES ('27', 'e3b903b401844e26a56eb6aa6b8398ce', '<p>cvbcvbcvb</p>', '17', '26', null, null, null, '2017-09-12 11:58:28');
INSERT INTO `messages` VALUES ('28', 'e3b903b401844e26a56eb6aa6b8398ce', '<p>cvbcvbcvb</p>', '17', '26', null, null, null, '2017-09-12 11:58:30');
INSERT INTO `messages` VALUES ('29', '87e2ffbb814ad910a0751737499a287d', '<p>xcvxcvxcv</p>', '17', '24', '1505197428', null, null, '2017-09-12 11:58:43');
INSERT INTO `messages` VALUES ('30', '87e2ffbb814ad910a0751737499a287d', '<p>xcvxcvxcv</p>', '17', '24', '1505197428', null, null, '2017-09-12 11:58:45');
INSERT INTO `messages` VALUES ('31', '14d9bcc3c450ab1c1e4e54a5577b3b77', '<p>xcvxcvxcxcvxcv</p>', '17', '23', null, null, null, '2017-09-12 11:58:52');
INSERT INTO `messages` VALUES ('32', '14d9bcc3c450ab1c1e4e54a5577b3b77', '<p>vbvbvb</p>', '17', '23', null, null, null, '2017-09-12 11:58:55');
INSERT INTO `messages` VALUES ('33', 'dd6580387725c2c85eb733e1560600d0', '<p>vbvbvb</p>', '17', '22', null, null, null, '2017-09-12 11:59:12');
INSERT INTO `messages` VALUES ('34', 'dd6580387725c2c85eb733e1560600d0', '<p>nvbncvbvbn</p>', '17', '22', null, null, null, '2017-09-12 11:59:15');
INSERT INTO `messages` VALUES ('35', 'c9e5605da4c44591ba89fed33543f116', '<p>vbcvbcvb</p>', '17', '21', null, null, null, '2017-09-12 11:59:25');
INSERT INTO `messages` VALUES ('36', 'c9e5605da4c44591ba89fed33543f116', '<p>mnbnmbnm</p>', '17', '21', null, null, null, '2017-09-12 11:59:27');
INSERT INTO `messages` VALUES ('37', 'dd40f355a80c37dee6e654dc48180576', '<p>vcbcvbcvb</p>', '17', '20', null, null, null, '2017-09-12 11:59:33');
INSERT INTO `messages` VALUES ('38', 'dd40f355a80c37dee6e654dc48180576', '<p>bnvbnvbn</p>', '17', '20', null, null, null, '2017-09-12 11:59:35');
INSERT INTO `messages` VALUES ('39', 'f3bb7137bd49fdcd99de2d54f1848046', '<p>xcvxcv</p>', '17', '19', '1505198690', null, null, '2017-09-12 12:00:15');
INSERT INTO `messages` VALUES ('40', 'f3bb7137bd49fdcd99de2d54f1848046', '<p><img src=\"views/assets/plugins/tinymce/plugins/emoticons/img/smiley-wink.gif\" alt=\"wink\" /></p>', '17', '19', '1505198690', null, null, '2017-09-12 12:00:18');
INSERT INTO `messages` VALUES ('41', '29b47c2ec23f823553883ad6be143fe5', '<p>cvbcvbcb</p>', '17', '16', null, null, null, '2017-09-12 12:00:29');
INSERT INTO `messages` VALUES ('42', '29b47c2ec23f823553883ad6be143fe5', '<p><img src=\"views/assets/plugins/tinymce/plugins/emoticons/img/smiley-wink.gif\" alt=\"wink\" /></p>', '17', '16', null, null, null, '2017-09-12 12:00:33');
INSERT INTO `messages` VALUES ('43', '31aede0f81eeccab00b904b17a6f24da', '<p>xcvxcvxcv</p>', '17', '15', null, null, null, '2017-09-12 12:00:42');
INSERT INTO `messages` VALUES ('44', '31aede0f81eeccab00b904b17a6f24da', '<p>vbnvbn</p>', '17', '15', null, null, null, '2017-09-12 12:00:44');
INSERT INTO `messages` VALUES ('45', '33c539a25240596aac5446cb0260e725', '<p>xcvxcvxv</p>', '17', '14', null, null, null, '2017-09-12 12:00:50');
INSERT INTO `messages` VALUES ('46', '33c539a25240596aac5446cb0260e725', '<p>xcvxcvxv</p>', '17', '14', null, null, null, '2017-09-12 12:00:55');
INSERT INTO `messages` VALUES ('47', '29b47c2ec23f823553883ad6be143fe5', '<p>vcbcvbcvb</p>', '17', '16', null, null, null, '2017-09-12 12:17:03');
INSERT INTO `messages` VALUES ('48', 'dd6580387725c2c85eb733e1560600d0', '<h1>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas at purus eget erat varius laoreet non in est. Nunc fringilla augue eu quam venenatis tristique. Ut elementum, purus sed tempor maximus, est dui pretium dolor, et tincidunt arcu urna ut dui. Pellentesque ipsum tellus, dapibus a ipsum in, convallis iaculis ex. Donec vel ligula at nibh porttitor commodo. Nam nec imperdiet felis. Aenean condimentum sagittis purus, vestibulum pharetra quam tempor sed.</h1>\n<h1>Fusce a congue mauris. Sed a<em>c tellus sit amet ante tincidunt placerat. Nullam in dui volutpat, pharetra libero bibendum, hendrerit augue. Nulla nec vestibulum elit, vitae porttitor eros. Nam fermentum commodo lorem, vitae scelerisque turpis pharetra malesuada. Sed fermentum neque ac quam ali</em>quet imperdiet. Etiam ligula lorem, porta quis egestas quis, iaculis eu metus.</h1>\n<p>Ut interdum mattis velit n<strong>on egestas. Sed consequat pellentesque ligula, id bibendum leo sodales vitae. Sed ornare aliquet lectus et pellentesque. Pellentesque accumsan finibus lacinia. Quisque sagittis dolor justo, ut interdum lectus varius vel. Quisque euismod nisi enim, et interdum mi feugiat quis. Morbi scelerisque justo quis libero efficitur, in aliquet est malesuada. Sed vel ornare velit.</strong></p>\n<p><strong>Etiam lacinia, urna eget rutrum suscipit, velit ante viverra erat, ac luctus dolor ipsum sit amet ipsum. Pellentesque molestie turpis ut ante convallis euismod quis ac odio. Cras a mollis arcu. Sed congue ipsum vel fermentum rutrum. Nam eu mauris vitae purus pulvinar ultrices fermentum in metus. Duis sed malesuada purus, vitae finibus diam. Duis ullamcorper orci lectus, eleifend accumsan risus accumsan eu. Cras varius maximus mauris, ut fermentum mauris efficitur quis. Duis pretium vehicula luctus. Proin tempus elit ut quam fringilla, blandit condimentum arcu ornare. Ut</strong> tincidunt nisi eu nisl condimentum, non rutrum nisl tincidunt. Cras quis varius quam. Integer vulputate nulla at magna auctor tristique.</p>\n<p>In rutrum nisl ut faucibus euismod. Fusce dapibus, velit ac aliquam lacinia, augue tellus blandit tellus, at rhoncus nisi libero at neque. Phasellus suscipit leo eu est rhoncus consequat. Mauris sed tristique nisl. Mauris commodo fermentum mi, eget ullamcorper erat consequat non. Nulla semper arcu mauris, sit amet posuere ligula convallis non. Nullam bibendum ligula id nisl imperdiet, vel auctor felis sagittis. Integer eleifend sagittis nisi nec convallis. Donec pharetra, lacus vel fermentum porta, tellus sapien lobortis sem, ac vehicula neque nisi nec ligula.</p>', '17', '22', null, null, null, '2017-09-12 12:17:48');
INSERT INTO `messages` VALUES ('49', '87e2ffbb814ad910a0751737499a287d', '<p>asdasdasd</p>', '24', '17', '1505275535', null, null, '2017-09-12 12:23:51');
INSERT INTO `messages` VALUES ('50', '87e2ffbb814ad910a0751737499a287d', '<p>asdasdasd</p>', '24', '17', '1505275535', null, null, '2017-09-12 12:23:53');
INSERT INTO `messages` VALUES ('51', 'ca92277769290a149935446597ec9286', '<p>asdasdasdasd</p>', '30', '17', '1508235312', null, null, '2017-09-12 12:24:17');
INSERT INTO `messages` VALUES ('52', 'ca92277769290a149935446597ec9286', '<p>asdasdasd</p>', '30', '17', '1508235312', null, null, '2017-09-12 12:24:19');
INSERT INTO `messages` VALUES ('53', 'aa0fec08bd57f3031b31d0e8e26f0fda', '<p>asdasdasd</p>', '29', '17', '1505208744', null, null, '2017-09-12 12:26:01');
INSERT INTO `messages` VALUES ('54', 'f3bb7137bd49fdcd99de2d54f1848046', '<p>czxczxc</p>', '17', '19', '1505198690', null, null, '2017-09-12 12:38:46');
INSERT INTO `messages` VALUES ('55', 'f3bb7137bd49fdcd99de2d54f1848046', '<p>vcbcvbcv</p>', '17', '19', '1505198690', null, null, '2017-09-12 12:43:44');
INSERT INTO `messages` VALUES ('56', 'f3bb7137bd49fdcd99de2d54f1848046', '<p>zxczxczxc</p>', '19', '17', '1505198729', null, null, '2017-09-12 12:44:58');
INSERT INTO `messages` VALUES ('57', 'f3bb7137bd49fdcd99de2d54f1848046', '<p>zxczxczxczxc</p>', '17', '19', '1505198806', null, null, '2017-09-12 12:45:33');
INSERT INTO `messages` VALUES ('58', 'f3bb7137bd49fdcd99de2d54f1848046', '<p>asdasda</p>', '17', '19', '1505275563', null, null, '2017-09-12 12:54:53');
INSERT INTO `messages` VALUES ('59', 'f3bb7137bd49fdcd99de2d54f1848046', '<p>ererer</p>', '17', '19', '1505275563', null, null, '2017-09-12 12:55:07');
INSERT INTO `messages` VALUES ('60', 'b3804bb3a26936f1f9e6cb3a7671ea25', '<p>asdasdasdasd</p>', '17', '27', '1505377032', null, null, '2017-09-12 12:55:37');
INSERT INTO `messages` VALUES ('61', 'f3bb7137bd49fdcd99de2d54f1848046', '<p>asdasdasd</p>', '17', '19', '1505275563', null, null, '2017-09-12 12:57:29');
INSERT INTO `messages` VALUES ('62', 'b3804bb3a26936f1f9e6cb3a7671ea25', '<p>bvbvbvbv</p>', '17', '27', '1505377032', null, null, '2017-09-12 13:02:17');
INSERT INTO `messages` VALUES ('63', 'b3804bb3a26936f1f9e6cb3a7671ea25', '<p>ghfghfgh</p>', '17', '27', '1505377032', null, null, '2017-09-12 13:17:45');
INSERT INTO `messages` VALUES ('64', 'b3804bb3a26936f1f9e6cb3a7671ea25', '<p>fghfghfghfghfgh</p>', '17', '27', '1505377032', null, null, '2017-09-12 13:17:48');
INSERT INTO `messages` VALUES ('65', 'b3804bb3a26936f1f9e6cb3a7671ea25', '<p>bnmbnmbnm</p>', '17', '27', '1505377032', null, null, '2017-09-12 13:17:50');
INSERT INTO `messages` VALUES ('66', 'b3804bb3a26936f1f9e6cb3a7671ea25', '<p>bnmbnmbnm</p>', '17', '27', '1505377032', null, null, '2017-09-12 13:17:53');
INSERT INTO `messages` VALUES ('67', 'b3804bb3a26936f1f9e6cb3a7671ea25', '<p>bnmbnmbnmbnm</p>', '17', '27', '1505377032', null, null, '2017-09-12 13:17:55');
INSERT INTO `messages` VALUES ('68', 'b3804bb3a26936f1f9e6cb3a7671ea25', '<p>cvxcvxcv</p>', '17', '27', '1505377032', null, null, '2017-09-12 13:26:07');
INSERT INTO `messages` VALUES ('69', 'cfac3f33bf0ed9cb7b2e0d9ce5a13d09', '<p>dfgdfgdfgdfg</p>', '31', '17', '1505209071', null, '1505209295', '2017-09-12 15:37:18');
INSERT INTO `messages` VALUES ('70', 'aa0fec08bd57f3031b31d0e8e26f0fda', '<p>zxczxzxczxc</p>', '29', '17', null, null, null, '2017-09-13 10:06:25');
INSERT INTO `messages` VALUES ('71', 'dd6580387725c2c85eb733e1560600d0', '<p>Ut interdum mattis velit n<strong>on egestas. Sed consequat pellentesque ligula, id bibendum leo sodales vitae. Sed ornare aliquet lectus et pellentesque. Pellentesque accumsan finibus lacinia. Quisque sagittis dolor justo, ut interdum lectus varius vel. Quisque euismod nisi enim, et interdum mi feugiat quis. Morbi scelerisque justo quis libero efficitur, in aliquet est malesuada. Sed vel ornare velit.</strong></p>', '17', '22', null, null, null, '2017-09-13 15:25:13');
INSERT INTO `messages` VALUES ('72', 'b3804bb3a26936f1f9e6cb3a7671ea25', '<p>ioioi</p>', '17', '27', '1505377032', null, null, '2017-09-14 14:02:54');
INSERT INTO `messages` VALUES ('73', 'b3804bb3a26936f1f9e6cb3a7671ea25', '<p>ghjghj</p>', '17', '27', '1505377032', null, null, '2017-09-14 14:03:36');
INSERT INTO `messages` VALUES ('74', 'b3804bb3a26936f1f9e6cb3a7671ea25', '<p>asSSDFSDF</p>', '17', '27', '1505377032', null, null, '2017-09-14 14:09:47');
INSERT INTO `messages` VALUES ('75', 'b3804bb3a26936f1f9e6cb3a7671ea25', '<p>ioioio</p>', '17', '27', '1505377032', null, null, '2017-09-14 14:11:48');
INSERT INTO `messages` VALUES ('76', 'b3804bb3a26936f1f9e6cb3a7671ea25', '<p>uiouiouio</p>', '17', '27', '1505377032', null, null, '2017-09-14 14:13:39');
INSERT INTO `messages` VALUES ('77', 'b3804bb3a26936f1f9e6cb3a7671ea25', '<p>uipuiooui</p>', '17', '27', '1505377032', null, null, '2017-09-14 14:13:42');
INSERT INTO `messages` VALUES ('78', 'b3804bb3a26936f1f9e6cb3a7671ea25', '<p>opopopop</p>', '17', '27', '1505377032', null, null, '2017-09-14 14:13:45');
INSERT INTO `messages` VALUES ('79', 'b3804bb3a26936f1f9e6cb3a7671ea25', '<p>ghjghjghj</p>', '17', '27', '1505377032', null, null, '2017-09-14 14:14:18');
INSERT INTO `messages` VALUES ('80', 'b3804bb3a26936f1f9e6cb3a7671ea25', '<p>jkljklj</p>', '17', '27', '1505377032', null, null, '2017-09-14 14:14:20');
INSERT INTO `messages` VALUES ('81', 'b3804bb3a26936f1f9e6cb3a7671ea25', '<p>jkljkljkl</p>', '17', '27', '1505377032', null, null, '2017-09-14 14:14:23');
INSERT INTO `messages` VALUES ('82', 'b3804bb3a26936f1f9e6cb3a7671ea25', '<p>jkljkl</p>', '17', '27', '1505377032', null, null, '2017-09-14 14:14:29');
INSERT INTO `messages` VALUES ('83', 'b3804bb3a26936f1f9e6cb3a7671ea25', '<p>l;kl;kl;</p>', '17', '27', '1505377032', null, null, '2017-09-14 14:14:31');
INSERT INTO `messages` VALUES ('84', 'b3804bb3a26936f1f9e6cb3a7671ea25', '<p>kl;kl;</p>', '17', '27', '1505377032', null, null, '2017-09-14 14:14:33');
INSERT INTO `messages` VALUES ('85', 'b3804bb3a26936f1f9e6cb3a7671ea25', '<p>Thanks</p>', '27', '17', '1505377090', null, null, '2017-09-14 14:17:46');
INSERT INTO `messages` VALUES ('86', 'b3804bb3a26936f1f9e6cb3a7671ea25', '<p>fghfghfg</p>', '27', '17', '1505377136', null, null, '2017-09-14 14:18:44');
INSERT INTO `messages` VALUES ('87', 'b3804bb3a26936f1f9e6cb3a7671ea25', '<p>okay</p>', '17', '27', '1505377163', null, null, '2017-09-14 14:19:01');
INSERT INTO `messages` VALUES ('88', '31aede0f81eeccab00b904b17a6f24da', '<p>Hello</p>', '17', '15', null, null, null, '2017-09-14 18:03:34');
INSERT INTO `messages` VALUES ('89', '31aede0f81eeccab00b904b17a6f24da', '<p>are you okay?</p>', '17', '15', null, null, null, '2017-09-14 18:03:42');
INSERT INTO `messages` VALUES ('91', 'b3804bb3a26936f1f9e6cb3a7671ea25', '<p>Great</p>', '17', '27', null, null, null, '2017-09-20 10:55:38');
INSERT INTO `messages` VALUES ('92', '2ebea7488ff2a573382b1575879bcabb', '<p>Right Now</p>', '17', '35', null, null, null, '2017-09-20 12:55:36');
INSERT INTO `messages` VALUES ('93', '25e98a94bdedcd37696ba124b19c3e16', '<p>Hello</p>', '17', '44', '1515570298', null, null, '2017-09-23 11:27:33');
INSERT INTO `messages` VALUES ('94', '25e98a94bdedcd37696ba124b19c3e16', '<p>dgdfgdfg</p>', '17', '44', '1515570298', null, null, '2017-10-17 10:43:51');
INSERT INTO `messages` VALUES ('95', '61dbc5a3de91ad5df974afc9af7c2433', '<p>asdasdasdasd</p>', '17', '48', '1508238417', null, null, '2017-10-17 17:06:43');
INSERT INTO `messages` VALUES ('96', '61dbc5a3de91ad5df974afc9af7c2433', '<p>asdasdasdasdright</p>', '48', '17', null, null, null, '2017-10-17 17:07:03');
INSERT INTO `messages` VALUES ('97', '61dbc5a3de91ad5df974afc9af7c2433', '<p>asdgogogog</p>', '48', '17', null, null, null, '2017-10-17 17:07:39');
INSERT INTO `messages` VALUES ('98', '3d4caa081444ac585128efa4688f2427', '<p>Hello</p>', '17', '51', null, null, null, '2017-10-19 14:26:19');
INSERT INTO `messages` VALUES ('99', '87e2ffbb814ad910a0751737499a287d', '<p>asdasdasd</p>', '17', '24', '1508746953', null, null, '2017-10-19 14:47:04');
INSERT INTO `messages` VALUES ('100', '7dd36240e3b3ae199d49593347ed8e4a', '<p>hey boy let me tell you what you really wanna hear!</p>', '17', '50', null, null, null, '2017-10-21 15:03:36');
INSERT INTO `messages` VALUES ('101', 'd17ee992028f82210dbceffcf22d5ca6', '<p>Ratul</p>\n<p>&nbsp;</p>', '17', '43', '1508749046', null, null, '2017-10-23 14:56:59');
INSERT INTO `messages` VALUES ('102', 'd17ee992028f82210dbceffcf22d5ca6', '<p>&nbsp;asdasdasd</p>', '43', '17', '1510376682', null, null, '2017-10-23 14:57:34');
INSERT INTO `messages` VALUES ('103', '3d4caa081444ac585128efa4688f2427', '<p>klklkl</p>', '17', '51', null, null, null, '2017-11-08 15:01:09');
INSERT INTO `messages` VALUES ('104', '3d4caa081444ac585128efa4688f2427', '<p>dfgdf</p>', '17', '51', null, null, null, '2017-11-25 11:06:21');
INSERT INTO `messages` VALUES ('105', '3d4caa081444ac585128efa4688f2427', '<p>sdfsdfs</p>', '17', '51', null, null, null, '2017-11-25 17:33:24');
INSERT INTO `messages` VALUES ('106', '3d4caa081444ac585128efa4688f2427', '<p>asdasd</p>', '17', '51', null, null, null, '2017-11-25 17:37:54');
INSERT INTO `messages` VALUES ('107', '25e98a94bdedcd37696ba124b19c3e16', '<p>bbq</p>', '17', '44', '1515570298', null, null, '2017-12-11 14:58:27');
INSERT INTO `messages` VALUES ('108', 'b9bc7dc33653c1c1469fadd89bb246d2', '<p>Hi BETTER</p>', '17', '37', null, null, null, '2018-01-04 15:22:45');
INSERT INTO `messages` VALUES ('109', '25e98a94bdedcd37696ba124b19c3e16', '<p>sdfsdf</p>', '17', '44', '1515570298', null, null, '2018-01-10 13:44:46');
INSERT INTO `messages` VALUES ('110', '25e98a94bdedcd37696ba124b19c3e16', '<p>sdfsdfsdf</p>', '44', '17', '1515570365', null, null, '2018-01-10 13:45:49');
INSERT INTO `messages` VALUES ('111', '25e98a94bdedcd37696ba124b19c3e16', '<p>dfgdf</p>', '17', '44', null, null, null, '2018-01-10 13:46:09');
INSERT INTO `messages` VALUES ('112', '584ab1557f00993b65799676e84052e9', '<p>sdfsdfsdf</p>', '17', '17', '1515579896', null, null, '2018-01-10 16:24:56');
INSERT INTO `messages` VALUES ('113', '584ab1557f00993b65799676e84052e9', '<p>sdfsdfsdf asdasd</p>', '17', '17', '1515579918', null, null, '2018-01-10 16:25:18');
INSERT INTO `messages` VALUES ('114', '584ab1557f00993b65799676e84052e9', '<p>sdfsdfsdf asdasd</p>', '17', '17', '1515580029', null, null, '2018-01-10 16:27:09');
INSERT INTO `messages` VALUES ('115', '584ab1557f00993b65799676e84052e9', '<p>ASDASD</p>', '17', '17', '1515580040', null, null, '2018-01-10 16:27:20');
INSERT INTO `messages` VALUES ('116', '584ab1557f00993b65799676e84052e9', '<p>asdasdasd</p>', '17', '17', '1515580086', null, null, '2018-01-10 16:28:06');
INSERT INTO `messages` VALUES ('117', '584ab1557f00993b65799676e84052e9', '<p>asdasdasd</p>', '17', '17', '1515585176', null, null, '2018-01-10 17:52:56');
INSERT INTO `messages` VALUES ('118', '584ab1557f00993b65799676e84052e9', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam a volutpat diam. Duis vitae ante et ex laoreet scelerisque. Nunc vestibulum metus at imperdiet tempus. Cras massa ligula, sodales non ornare vitae, accumsan sit amet lorem. Suspendisse quis consectetur justo. Aliquam fringilla ultricies convallis. Fusce sodales semper lectus sed viverra. Cras nec posuere lorem, eget ultrices sapien. Phasellus scelerisque, est sed sagittis tristique, ligula justo ultrices enim, ut interdum justo est molestie lorem. Donec mi dui, dictum sit amet tempus et, tincidunt nec sem. In placerat mattis nulla, eu pellentesque erat vehicula nec. Donec dapibus consectetur tincidunt.</p>\n<p><strong>Donec mattis neque eu turpis finibus, at pulvinar est ornare. </strong></p>\n<p>Nullam enim libero, bibendum vel magna in, porttitor fringilla mauris. Proin rhoncus fringilla nisi in tempus. Curabitur non risus purus. Proin ligula risus, suscipit at euismod id, lobortis in nisl. Vivamus venenatis efficitur elit lobortis aliquet. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras commodo quam id nisi viverra pulvinar. Sed commodo lobortis elementum. Quisque ullamcorper libero justo, consequat elementum odio malesuada vitae. Nullam a luctus lacus, fringilla molestie lectus. Maecenas at luctus justo, sit amet bibendum nibh. Vestibulum suscipit ac turpis non pellentesque. Donec sodales ultrices rhoncus. Nulla id dui dolor.</p>\n<p>Proin vehicula malesuada urna ac accumsan. Maecenas vitae nulla nisi. Duis mauris felis, finibus vitae consectetur eu, iaculis vel turpis. Maecenas ultrices vestibulum augue a luctus. Vivamus convallis tortor ac nunc euismod aliquet. Phasellus in mauris mattis, vulputate nisl at, ornare urna. Fusce quis tellus quis tellus viverra venenatis. Nullam sit amet magna mauris. In porta purus turpis, interdum tincidunt ipsum malesuada eu. Proin vel ipsum iaculis, congue sem vel, auctor felis. Fusce eget vehicula lectus. Nullam tempor elementum tortor. Nullam eget hendrerit nulla. Quisque tristique mauris aliquet dictum pellentesque. Phasellus suscipit tincidunt pretium. Mauris vel placerat odio. Donec eu elit elit. Vestibulum sit amet tortor id purus mollis placerat. Maecenas consequat metus dui, quis gravida orci mattis ut. Nam vel diam in magna vehicula convallis. Quisque efficitur id enim eu faucibus. Ut faucibus nulla fermentum pretium aliquam. Nam non risus ac dolor porttitor sodales quis cursus ipsum. Duis ut ligula libero. Fusce mollis, nisl nec viverra rutrum, eros nisi mattis lorem, non mollis dui velit eget tortor. Vivamus consequat est id justo varius tincidunt.</p>\n<p>Integer vestibulum, mi tempus blandit aliquam, ante est sagittis metus, sit amet commodo eros mauris et justo. Nullam scelerisque mauris in elit scelerisque imperdiet. Etiam ac est libero.</p>', '17', '17', '1515586148', null, null, '2018-01-10 18:09:07');
INSERT INTO `messages` VALUES ('119', 'fd28caa73cf213aa9d4b54e1b5a44f1e', '<p>Hey Mahadi!</p>', '1', '1', '1515653688', null, null, '2018-01-11 12:54:48');
INSERT INTO `messages` VALUES ('120', 'c7d89bc3b2f5ecdc38ab291bcb8920fb', '<p>Check Image</p>', '21', '21', '1515654373', null, null, '2018-01-11 13:06:13');
INSERT INTO `messages` VALUES ('124', '584ab1557f00993b65799676e84052e9', '<p>Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit. Nam A Volutpat Diam. Duis Vitae Ante Et Ex Laoreet Scelerisque. Nunc Vestibulum Metus At Imperdiet Tempus. Cras Massa Ligula, Sodales Non Ornare Vitae, Accumsan Sit Amet Lorem. Suspendisse Quis Consectetur Justo. Aliquam Fringilla Ultricies Convallis. Fusce Sodales Semper Lectus Sed Viverra. Cras Nec Posuere Lorem, Eget Ultrices Sapien. Phasellus Scelerisque, Est Sed Sagittis Tristique, Ligula Justo Ultrices Enim, Ut Interdum Justo Est Molestie Lorem. Donec Mi Dui, Dictum Sit Amet Tempus Et, Tincidunt Nec Sem. In Placerat Mattis Nulla, Eu Pellentesque Erat Vehicula Nec. Donec Dapibus Consectetur Tincidunt.</p>\n<p><strong>Donec Mattis Neque Eu Turpis Finibus, At Pulvinar Est Ornare.</strong></p>\n<p>Nullam Enim Libero, Bibendum Vel Magna In, Porttitor Fringilla Mauris. Proin Rhoncus Fringilla Nisi In Tempus. Curabitur Non Risus Purus. Proin Ligula Risus, Suscipit At Euismod Id, Lobortis In Nisl. Vivamus Venenatis Efficitur Elit Lobortis Aliquet. Orci Varius Natoque Penatibus Et Magnis Dis Parturient Montes, Nascetur Ridiculus Mus. Cras Commodo Quam Id Nisi Viverra Pulvinar. Sed Commodo Lobortis Elementum. Quisque Ullamcorper Libero Justo, Consequat Elementum Odio Malesuada Vitae. Nullam A Luctus Lacus, Fringilla Molestie Lectus. Maecenas At Luctus Justo, Sit Amet Bibendum Nibh. Vestibulum Suscipit Ac Turpis Non Pellentesque. Donec Sodales Ultrices Rhoncus. Nulla Id Dui Dolor.</p>\n<p>Proin Vehicula Malesuada Urna Ac Accumsan. Maecenas Vitae Nulla Nisi. Duis Mauris Felis, Finibus Vitae Consectetur Eu, Iaculis Vel Turpis. Maecenas Ultrices Vestibulum Augue A Luctus. Vivamus Convallis Tortor Ac Nunc Euismod Aliquet. Phasellus In Mauris Mattis, Vulputate Nisl At, Ornare Urna. Fusce Quis Tellus Quis Tellus Viverra Venenatis. Nullam Sit Amet Magna Mauris. In Porta Purus Turpis, Interdum Tincidunt Ipsum Malesuada Eu. Proin Vel Ipsum Iaculis, Congue Sem Vel, Auctor Felis. Fusce Eget Vehicula Lectus. Nullam Tempor Elementum Tortor. Nullam Eget Hendrerit Nulla. Quisque Tristique Mauris Aliquet Dictum Pellentesque. Phasellus Suscipit Tincidunt Pretium. Mauris Vel Placerat Odio. Donec Eu Elit Elit. Vestibulum Sit Amet Tortor Id Purus Mollis Placerat. Maecenas Consequat Metus Dui, Quis Gravida Orci Mattis Ut. Nam Vel Diam In Magna Vehicula Convallis. Quisque Efficitur Id Enim Eu Faucibus. Ut Faucibus Nulla Fermentum Pretium Aliquam. Nam Non Risus Ac Dolor Porttitor Sodales Quis Cursus Ipsum. Duis Ut Ligula Libero. Fusce Mollis, Nisl Nec Viverra Rutrum, Eros Nisi Mattis Lorem, Non Mollis Dui Velit Eget Tortor. Vivamus Consequat Est Id Justo Varius Tincidunt.</p>\n<p>Integer Vestibulum, Mi Tempus Blandit Aliquam, Ante Est Sagittis Metus, Sit Amet Commodo Eros Mauris Et Justo. Nullam Scelerisque Mauris In Elit Scelerisque Imperdiet. Etiam Ac Est Libero.</p>\n<p>Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit. Nam A Volutpat Diam. Duis Vitae Ante Et Ex Laoreet Scelerisque. Nunc Vestibulum Metus At Imperdiet Tempus. Cras Massa Ligula, Sodales Non Ornare Vitae, Accumsan Sit Amet Lorem. Suspendisse Quis Consectetur Justo. Aliquam Fringilla Ultricies Convallis. Fusce Sodales Semper Lectus Sed Viverra. Cras Nec Posuere Lorem, Eget Ultrices Sapien. Phasellus Scelerisque, Est Sed Sagittis Tristique, Ligula Justo Ultrices Enim, Ut Interdum Justo Est Molestie Lorem. Donec Mi Dui, Dictum Sit Amet Tempus Et, Tincidunt Nec Sem. In Placerat Mattis Nulla, Eu Pellentesque Erat Vehicula Nec. Donec Dapibus Consectetur Tincidunt.</p>', '17', '17', '1515660945', null, null, '2018-01-11 14:55:45');
INSERT INTO `messages` VALUES ('125', '49f722a95103434bceb903d5fd46639b', '<p>Gogo dolls</p>', '52', '21', null, null, null, '2018-01-11 14:56:50');
INSERT INTO `messages` VALUES ('126', '584ab1557f00993b65799676e84052e9', '<p>sdfsdf</p>', '17', '17', '1515668453', null, null, '2018-01-11 17:00:53');
INSERT INTO `messages` VALUES ('127', '584ab1557f00993b65799676e84052e9', '<p>Lorem Epsum</p>', '17', '17', '1515669393', null, null, '2018-01-11 17:16:32');
INSERT INTO `messages` VALUES ('128', 'fd28caa73cf213aa9d4b54e1b5a44f1e', '<p>asdasd asdasd</p>', '1', '1', '1515669490', null, null, '2018-01-11 17:18:09');
INSERT INTO `messages` VALUES ('129', 'fd28caa73cf213aa9d4b54e1b5a44f1e', '<p>Alert boyo</p>', '1', '1', '1515669581', null, null, '2018-01-11 17:19:39');
INSERT INTO `messages` VALUES ('130', 'fd28caa73cf213aa9d4b54e1b5a44f1e', '<p>alert bab!</p>', '1', '1', '1515669613', null, null, '2018-01-11 17:20:11');
INSERT INTO `messages` VALUES ('131', 'fd28caa73cf213aa9d4b54e1b5a44f1e', '<p>sdfsdf</p>', '1', '1', '1515669630', null, null, '2018-01-11 17:20:29');
INSERT INTO `messages` VALUES ('138', 'fd28caa73cf213aa9d4b54e1b5a44f1e', '<p>asdasd</p>', '1', '1', '1515671677', null, null, '2018-01-11 17:54:36');
INSERT INTO `messages` VALUES ('139', 'fd28caa73cf213aa9d4b54e1b5a44f1e', '<p>asdasd</p>', '1', '1', '1515671688', null, null, '2018-01-11 17:54:46');
INSERT INTO `messages` VALUES ('140', 'fd28caa73cf213aa9d4b54e1b5a44f1e', '<p>asdasd</p>', '1', '1', '1515671695', null, null, '2018-01-11 17:54:53');
INSERT INTO `messages` VALUES ('142', '584ab1557f00993b65799676e84052e9', '<p>adasdasd</p>', '17', '17', '1515927619', null, null, '2018-01-14 17:00:19');
INSERT INTO `messages` VALUES ('143', '584ab1557f00993b65799676e84052e9', '<p>asdasdasd</p>', '17', '17', '1515928552', null, null, '2018-01-14 17:15:52');
INSERT INTO `messages` VALUES ('144', '584ab1557f00993b65799676e84052e9', '<p>sdfsdfsdfsdf</p>', '17', '17', '1515928750', null, null, '2018-01-14 17:19:10');
INSERT INTO `messages` VALUES ('145', '584ab1557f00993b65799676e84052e9', '<p>&nbsp;asdasdasd</p>', '17', '17', '1515929960', null, null, '2018-01-14 17:39:20');
INSERT INTO `messages` VALUES ('146', '584ab1557f00993b65799676e84052e9', '<p>asdasdasd</p>', '17', '17', '1515930293', null, null, '2018-01-14 17:44:53');
INSERT INTO `messages` VALUES ('147', '584ab1557f00993b65799676e84052e9', '<p>Legs</p>', '17', '17', '1515930697', null, null, '2018-01-14 17:51:37');
INSERT INTO `messages` VALUES ('148', '584ab1557f00993b65799676e84052e9', '<p>begs</p>', '17', '17', '1515930713', null, null, '2018-01-14 17:51:53');
INSERT INTO `messages` VALUES ('149', '584ab1557f00993b65799676e84052e9', '<p>tyty</p>', '17', '17', '1515931173', null, null, '2018-01-14 17:59:33');
INSERT INTO `messages` VALUES ('150', '584ab1557f00993b65799676e84052e9', '<p>asdasdasd</p>', '17', '17', '1515931293', null, null, '2018-01-14 18:01:33');
INSERT INTO `messages` VALUES ('151', '584ab1557f00993b65799676e84052e9', '<p>sdfsdf</p>', '17', '17', '1515931310', null, null, '2018-01-14 18:01:50');
INSERT INTO `messages` VALUES ('152', '584ab1557f00993b65799676e84052e9', '<p>asdasd rtrt</p>', '17', '17', '1515931454', null, null, '2018-01-14 18:04:14');
INSERT INTO `messages` VALUES ('153', '584ab1557f00993b65799676e84052e9', '<p>sdsdsdsd</p>', '17', '17', '1515931465', null, null, '2018-01-14 18:04:25');
INSERT INTO `messages` VALUES ('154', '584ab1557f00993b65799676e84052e9', '<p>1</p>', '17', '17', '1515931473', null, null, '2018-01-14 18:04:33');
INSERT INTO `messages` VALUES ('155', '584ab1557f00993b65799676e84052e9', '<p>2</p>', '17', '17', '1515931476', null, null, '2018-01-14 18:04:36');
INSERT INTO `messages` VALUES ('156', '584ab1557f00993b65799676e84052e9', '<p>3</p>', '17', '17', '1515931479', null, null, '2018-01-14 18:04:39');
INSERT INTO `messages` VALUES ('157', '584ab1557f00993b65799676e84052e9', '<p>4</p>', '17', '17', '1515931482', null, null, '2018-01-14 18:04:42');
INSERT INTO `messages` VALUES ('158', 'fd28caa73cf213aa9d4b54e1b5a44f1e', '<p>asdasdasd</p>', '1', '1', '1515931783', null, null, '2018-01-14 18:09:43');
INSERT INTO `messages` VALUES ('159', '584ab1557f00993b65799676e84052e9', '<p>dsfsdf</p>', '17', '17', '1515932086', null, null, '2018-01-14 18:14:46');
INSERT INTO `messages` VALUES ('160', '584ab1557f00993b65799676e84052e9', '<p>sdfsdfsdf</p>', '17', '17', '1516002453', null, null, '2018-01-15 13:47:33');
INSERT INTO `messages` VALUES ('161', '584ab1557f00993b65799676e84052e9', '<p>fghfgh</p>', '17', '17', '1516002511', null, null, '2018-01-15 13:48:31');
INSERT INTO `messages` VALUES ('162', '584ab1557f00993b65799676e84052e9', '<p>fghfgh</p>', '17', '17', '1516002512', null, null, '2018-01-15 13:48:32');
INSERT INTO `messages` VALUES ('163', '584ab1557f00993b65799676e84052e9', '<p>fghfgh</p>', '17', '17', '1516002512', null, null, '2018-01-15 13:48:32');
INSERT INTO `messages` VALUES ('164', '584ab1557f00993b65799676e84052e9', '<p>fghfgh</p>', '17', '17', '1516002513', null, null, '2018-01-15 13:48:33');
INSERT INTO `messages` VALUES ('165', '584ab1557f00993b65799676e84052e9', '<p>hfghgf</p>', '17', '17', '1516002516', null, null, '2018-01-15 13:48:36');
INSERT INTO `messages` VALUES ('166', '584ab1557f00993b65799676e84052e9', '<p>hfghgf</p>', '17', '17', '1516002517', null, null, '2018-01-15 13:48:37');
INSERT INTO `messages` VALUES ('167', '584ab1557f00993b65799676e84052e9', '<p>hfghgf</p>', '17', '17', '1516002518', null, null, '2018-01-15 13:48:38');
INSERT INTO `messages` VALUES ('168', '584ab1557f00993b65799676e84052e9', '<p>hfghgf</p>', '17', '17', '1516002518', null, null, '2018-01-15 13:48:38');
INSERT INTO `messages` VALUES ('169', '584ab1557f00993b65799676e84052e9', '<p>hfghgffghfgh</p>', '17', '17', '1516002520', null, null, '2018-01-15 13:48:39');
INSERT INTO `messages` VALUES ('170', '584ab1557f00993b65799676e84052e9', '<p>sdfsdf</p>', '17', '17', '1516002525', null, null, '2018-01-15 13:48:45');
INSERT INTO `messages` VALUES ('171', '584ab1557f00993b65799676e84052e9', '<p>High Esteem</p>', '17', '17', '1516003768', null, null, '2018-01-15 14:09:28');
INSERT INTO `messages` VALUES ('172', 'e70c1425bb597cd90eecacc7336272b1', '<p>&nbsp;sdfsdfsdf</p>', '52', '52', '1516004201', null, null, '2018-01-15 14:16:41');
INSERT INTO `messages` VALUES ('173', 'e70c1425bb597cd90eecacc7336272b1', '<p>sdfsdfsdf</p>', '52', '52', '1516004223', null, null, '2018-01-15 14:17:03');
INSERT INTO `messages` VALUES ('174', 'e70c1425bb597cd90eecacc7336272b1', '<p>asdasdasd</p>', '52', '52', '1516004227', null, null, '2018-01-15 14:17:07');
INSERT INTO `messages` VALUES ('175', 'e70c1425bb597cd90eecacc7336272b1', '<p>sdfsdfsdf</p>', '52', '52', '1516005527', null, null, '2018-01-15 14:38:47');
INSERT INTO `messages` VALUES ('176', 'e70c1425bb597cd90eecacc7336272b1', '<p>asdasdasd</p>', '52', '52', '1516006402', null, null, '2018-01-15 14:53:22');
INSERT INTO `messages` VALUES ('178', 'e70c1425bb597cd90eecacc7336272b1', '<p>asdadad</p>', '52', '52', '1516007419', null, null, '2018-01-15 15:10:19');
INSERT INTO `messages` VALUES ('181', 'e70c1425bb597cd90eecacc7336272b1', '<p>fgdfgd</p>', '52', '52', '1516007477', null, null, '2018-01-15 15:11:17');
INSERT INTO `messages` VALUES ('183', '584ab1557f00993b65799676e84052e9', '<p>sdfsdfsdf</p>', '17', '17', '1516010653', null, null, '2018-01-15 16:04:13');
INSERT INTO `messages` VALUES ('184', '584ab1557f00993b65799676e84052e9', '<p>sfdsdfsdf</p>', '17', '17', '1516011259', null, null, '2018-01-15 16:14:19');
INSERT INTO `messages` VALUES ('185', '584ab1557f00993b65799676e84052e9', '<p>sdfsdfsdf</p>', '17', '17', '1516011510', null, null, '2018-01-15 16:18:30');
INSERT INTO `messages` VALUES ('186', '584ab1557f00993b65799676e84052e9', '<p>asdasdasd</p>', '17', '17', '1516088573', null, null, '2018-01-16 13:42:53');
INSERT INTO `messages` VALUES ('187', '584ab1557f00993b65799676e84052e9', '<p>sdfsdfsdfsdf</p>', '17', '17', '1516103508', null, null, '2018-01-16 17:51:48');
INSERT INTO `messages` VALUES ('188', '584ab1557f00993b65799676e84052e9', '<p>sdsdf</p>', '17', '17', '1516103514', null, null, '2018-01-16 17:51:53');
INSERT INTO `messages` VALUES ('189', 'fd28caa73cf213aa9d4b54e1b5a44f1e', '<p>sdfsdfsdf</p>', '1', '1', '1516103588', null, null, '2018-01-16 17:53:08');
INSERT INTO `messages` VALUES ('190', 'fd28caa73cf213aa9d4b54e1b5a44f1e', '<p>sdfsdfsdf</p>', '1', '1', '1516103812', null, null, '2018-01-16 17:56:51');
INSERT INTO `messages` VALUES ('191', 'fd28caa73cf213aa9d4b54e1b5a44f1e', '<p>zxczxczc</p>', '1', '1', '1516103836', null, null, '2018-01-16 17:57:16');
INSERT INTO `messages` VALUES ('192', 'fd28caa73cf213aa9d4b54e1b5a44f1e', '<p>asdasdasd</p>', '1', '1', '1516103899', null, null, '2018-01-16 17:58:18');
INSERT INTO `messages` VALUES ('193', 'fd28caa73cf213aa9d4b54e1b5a44f1e', '<p>sdfsdfsdf</p>', '1', '1', '1516103985', null, null, '2018-01-16 17:59:44');
INSERT INTO `messages` VALUES ('194', '584ab1557f00993b65799676e84052e9', '<p>dfgdfgfdg</p>', '17', '17', '1516104019', null, null, '2018-01-16 18:00:19');
INSERT INTO `messages` VALUES ('195', 'e6c4668aca8f446bc2ee5e4b0b01705e', '<p>asdasdasd</p>', '44', '44', '1516104437', null, null, '2018-01-16 18:07:16');
INSERT INTO `messages` VALUES ('196', 'e6c4668aca8f446bc2ee5e4b0b01705e', '<p>asdasdasd</p>', '44', '44', '1516104489', null, null, '2018-01-16 18:08:08');
INSERT INTO `messages` VALUES ('197', 'e70c1425bb597cd90eecacc7336272b1', '<p>sdfsdfsdf</p>', '52', '52', '1516104521', null, null, '2018-01-16 18:08:40');
INSERT INTO `messages` VALUES ('201', '584ab1557f00993b65799676e84052e9', '<p>I have no fear because you are all that I have</p>', '17', '17', '1516170990', null, null, '2018-01-17 12:36:29');
INSERT INTO `messages` VALUES ('202', '584ab1557f00993b65799676e84052e9', '<p>dfsdfsdf</p>', '17', '17', '1516171419', null, null, '2018-01-17 12:43:38');
INSERT INTO `messages` VALUES ('203', '584ab1557f00993b65799676e84052e9', '<p>asdasdasd</p>', '17', '17', '1516172336', null, null, '2018-01-17 12:58:55');
INSERT INTO `messages` VALUES ('204', 'e70c1425bb597cd90eecacc7336272b1', '<p>asdasdasd</p>', '52', '52', '1516186952', null, null, '2018-01-17 17:02:31');
INSERT INTO `messages` VALUES ('205', 'e70c1425bb597cd90eecacc7336272b1', '<p>sadasdasd</p>', '52', '52', '1516188776', null, null, '2018-01-17 17:32:55');
INSERT INTO `messages` VALUES ('208', 'e70c1425bb597cd90eecacc7336272b1', '<p>sdfsdfsdf&nbsp; uiuiui</p>', '52', '52', '1516263257', null, null, '2018-01-18 14:14:15');
INSERT INTO `messages` VALUES ('209', '584ab1557f00993b65799676e84052e9', '<p>asdasdasd</p>', '17', '17', '1516271630', null, null, '2018-01-18 16:33:49');
INSERT INTO `messages` VALUES ('210', '584ab1557f00993b65799676e84052e9', '<p>asdasdasd</p>', '17', '17', '1516271647', null, null, '2018-01-18 16:34:07');
INSERT INTO `messages` VALUES ('211', '584ab1557f00993b65799676e84052e9', '<p>asdasdasd</p>', '17', '17', '1516271758', null, null, '2018-01-18 16:35:58');
INSERT INTO `messages` VALUES ('212', '584ab1557f00993b65799676e84052e9', '<p>asdasdasd</p>', '17', '17', '1516271819', null, null, '2018-01-18 16:36:59');
INSERT INTO `messages` VALUES ('213', '584ab1557f00993b65799676e84052e9', '<p>sdfsdfsdf</p>', '17', '17', '1516271870', null, null, '2018-01-18 16:37:50');
INSERT INTO `messages` VALUES ('214', '584ab1557f00993b65799676e84052e9', '<p>sdfsdf</p>', '17', '17', '1516271881', null, null, '2018-01-18 16:38:01');
INSERT INTO `messages` VALUES ('215', '584ab1557f00993b65799676e84052e9', '<p>sdfsdfsdf</p>', '17', '17', '1516272067', null, null, '2018-01-18 16:41:07');
INSERT INTO `messages` VALUES ('216', '584ab1557f00993b65799676e84052e9', '<p>sdfsdf</p>', '17', '17', '1516272135', null, null, '2018-01-18 16:42:15');
INSERT INTO `messages` VALUES ('217', '584ab1557f00993b65799676e84052e9', '<p>asdasd</p>', '17', '17', '1516272167', null, null, '2018-01-18 16:42:47');
INSERT INTO `messages` VALUES ('218', '584ab1557f00993b65799676e84052e9', '<p>asdasd</p>', '17', '17', '1516272170', null, null, '2018-01-18 16:42:50');
INSERT INTO `messages` VALUES ('225', '584ab1557f00993b65799676e84052e9', '<p>&nbsp;zxczxc</p>', '17', '17', '1516272888', null, null, '2018-01-18 16:54:48');
INSERT INTO `messages` VALUES ('226', '584ab1557f00993b65799676e84052e9', '<p>zcxzc</p>', '17', '17', '1516272893', null, null, '2018-01-18 16:54:52');
INSERT INTO `messages` VALUES ('227', '584ab1557f00993b65799676e84052e9', '<p>gdfgdfg</p>', '17', '17', '1516272930', null, null, '2018-01-18 16:55:30');
INSERT INTO `messages` VALUES ('228', '584ab1557f00993b65799676e84052e9', '<p>dfgdf</p>', '17', '17', '1516272985', null, null, '2018-01-18 16:56:25');
INSERT INTO `messages` VALUES ('230', 'e70c1425bb597cd90eecacc7336272b1', '<p>sdfsdf</p>', '52', '52', '1516273066', null, null, '2018-01-18 16:57:46');
INSERT INTO `messages` VALUES ('231', 'e70c1425bb597cd90eecacc7336272b1', '<p>sdfsdf</p>', '52', '52', '1516273082', null, null, '2018-01-18 16:58:01');
INSERT INTO `messages` VALUES ('232', 'e70c1425bb597cd90eecacc7336272b1', '<p>fsdf</p>', '52', '52', '1516273124', null, null, '2018-01-18 16:58:44');
INSERT INTO `messages` VALUES ('234', 'e70c1425bb597cd90eecacc7336272b1', '<p>dfsdf</p>', '52', '52', '1516273140', null, null, '2018-01-18 16:59:00');
INSERT INTO `messages` VALUES ('236', 'e70c1425bb597cd90eecacc7336272b1', '<p>dfsdfsdf</p>', '52', '52', '1516273184', null, null, '2018-01-18 16:59:44');
INSERT INTO `messages` VALUES ('237', 'e70c1425bb597cd90eecacc7336272b1', '<p>kjhjkh</p>', '52', '52', '1516273225', null, null, '2018-01-18 17:00:25');
INSERT INTO `messages` VALUES ('238', '584ab1557f00993b65799676e84052e9', '<p>asdasd</p>', '17', '17', '1516273335', null, null, '2018-01-18 17:02:15');
INSERT INTO `messages` VALUES ('239', '584ab1557f00993b65799676e84052e9', '<p>dfgdfg</p>', '17', '17', '1516273409', null, null, '2018-01-18 17:03:29');
INSERT INTO `messages` VALUES ('240', '584ab1557f00993b65799676e84052e9', '<p>dfgdfgdf</p>', '17', '17', '1516273475', null, null, '2018-01-18 17:04:35');
INSERT INTO `messages` VALUES ('242', '584ab1557f00993b65799676e84052e9', '<p>sdfgdfg</p>', '17', '17', '1516273608', null, null, '2018-01-18 17:06:48');
INSERT INTO `messages` VALUES ('243', 'e70c1425bb597cd90eecacc7336272b1', '<p>sfsdfsd</p>', '52', '52', '1516273657', null, null, '2018-01-18 17:07:37');
INSERT INTO `messages` VALUES ('244', 'e70c1425bb597cd90eecacc7336272b1', '<p>dfgdf</p>', '52', '52', '1516273813', null, null, '2018-01-18 17:10:12');
INSERT INTO `messages` VALUES ('246', 'e70c1425bb597cd90eecacc7336272b1', '<p>asdasdasd</p>', '52', '52', '1516274119', null, null, '2018-01-18 17:15:18');
INSERT INTO `messages` VALUES ('247', 'e70c1425bb597cd90eecacc7336272b1', '<p>asdasdasd</p>', '52', '52', '1516274154', null, null, '2018-01-18 17:15:53');
INSERT INTO `messages` VALUES ('248', 'e70c1425bb597cd90eecacc7336272b1', '<p>asdasd</p>', '52', '52', '1516274207', null, null, '2018-01-18 17:16:46');
INSERT INTO `messages` VALUES ('249', 'e70c1425bb597cd90eecacc7336272b1', '<p>Comment</p>', '52', '52', '1516274355', null, null, '2018-01-18 17:19:15');
INSERT INTO `messages` VALUES ('251', 'fd28caa73cf213aa9d4b54e1b5a44f1e', '<p>&nbsp;sdfsdfsdf</p>', '1', '1', '1516274761', null, null, '2018-01-18 17:26:01');
INSERT INTO `messages` VALUES ('252', 'e70c1425bb597cd90eecacc7336272b1', '<p>asdasd</p>', '52', '52', '1516274839', null, null, '2018-01-18 17:27:19');
INSERT INTO `messages` VALUES ('253', 'fd28caa73cf213aa9d4b54e1b5a44f1e', '<p>asdasdasd</p>', '1', '1', '1516274869', null, null, '2018-01-18 17:27:49');
INSERT INTO `messages` VALUES ('254', '584ab1557f00993b65799676e84052e9', '<p>sfsdfsdf</p>', '17', '17', '1516274999', null, null, '2018-01-18 17:29:59');
INSERT INTO `messages` VALUES ('256', '584ab1557f00993b65799676e84052e9', '<p>zxczxc</p>', '17', '17', '1516275037', null, null, '2018-01-18 17:30:37');
INSERT INTO `messages` VALUES ('257', 'e70c1425bb597cd90eecacc7336272b1', '<p>asdasd</p>', '52', '52', '1516275126', null, null, '2018-01-18 17:32:05');
INSERT INTO `messages` VALUES ('258', 'e70c1425bb597cd90eecacc7336272b1', '<p>asdasdasd</p>', '52', '52', '1516275144', null, null, '2018-01-18 17:32:23');
INSERT INTO `messages` VALUES ('259', 'e70c1425bb597cd90eecacc7336272b1', '<p>asdasd</p>', '52', '52', '1516275156', null, null, '2018-01-18 17:32:35');
INSERT INTO `messages` VALUES ('260', 'e70c1425bb597cd90eecacc7336272b1', '<p>asdasdasd</p>', '52', '52', '1516275165', null, null, '2018-01-18 17:32:45');
INSERT INTO `messages` VALUES ('262', 'e70c1425bb597cd90eecacc7336272b1', '<p>adasd</p>', '52', '52', '1516275183', null, null, '2018-01-18 17:33:03');
INSERT INTO `messages` VALUES ('263', 'e70c1425bb597cd90eecacc7336272b1', '<p>sdfsdf</p>', '52', '52', '1516275225', null, null, '2018-01-18 17:33:44');
INSERT INTO `messages` VALUES ('265', 'e70c1425bb597cd90eecacc7336272b1', '<p>asdasd</p>', '52', '52', '1516275364', null, null, '2018-01-18 17:36:04');
INSERT INTO `messages` VALUES ('266', 'e70c1425bb597cd90eecacc7336272b1', '<p>sdfsdf</p>', '52', '52', '1516275455', null, null, '2018-01-18 17:37:35');
INSERT INTO `messages` VALUES ('267', 'fd28caa73cf213aa9d4b54e1b5a44f1e', '<p>asdasd</p>', '1', '1', '1516275883', null, null, '2018-01-18 17:44:43');
INSERT INTO `messages` VALUES ('268', 'fd28caa73cf213aa9d4b54e1b5a44f1e', '<p>sdfsdf</p>', '1', '1', '1516275912', null, null, '2018-01-18 17:45:12');
INSERT INTO `messages` VALUES ('269', 'fd28caa73cf213aa9d4b54e1b5a44f1e', '<p>sdfsdf</p>', '1', '1', '1516276105', null, null, '2018-01-18 17:48:25');
INSERT INTO `messages` VALUES ('270', 'e70c1425bb597cd90eecacc7336272b1', '<p>asdasdas</p>', '52', '52', '1516276131', null, null, '2018-01-18 17:48:51');
INSERT INTO `messages` VALUES ('271', 'e70c1425bb597cd90eecacc7336272b1', '<p>asdasd</p>', '52', '52', '1516276169', null, null, '2018-01-18 17:49:29');
INSERT INTO `messages` VALUES ('272', '584ab1557f00993b65799676e84052e9', '<p>Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit. Nam A Volutpat Diam. Duis Vitae Ante Et Ex Laoreet Scelerisque. Nunc Vestibulum Metus At Imperdiet Tempus. Cras Massa Ligula, Sodales Non Ornare Vitae, Accumsan Sit Amet Lorem. Suspendisse Quis Consectetur Justo. Aliquam Fringilla Ultricies Convallis. Fusce Sodales Semper Lectus Sed Viverra. Cras Nec Posuere Lorem, Eget Ultrices Sapien. Phasellus Scelerisque, Est Sed Sagittis Tristique, Ligula Justo Ultrices Enim, Ut Interdum Justo Est Molestie Lorem. Donec Mi Dui, Dictum Sit Amet Tempus Et, Tincidunt Nec Sem. In Placerat Mattis Nulla, Eu Pellentesque Erat Vehicula Nec. Donec Dapibus Consectetur Tincidunt.</p>\n<p><strong>Donec Mattis Neque Eu Turpis Finibus, At Pulvinar Est Ornare.</strong></p>\n<p>Nullam Enim Libero, Bibendum Vel Magna In, Porttitor Fringilla Mauris. Proin Rhoncus Fringilla Nisi In Tempus. Curabitur Non Risus Purus. Proin Ligula Risus, Suscipit At Euismod Id, Lobortis In Nisl. Vivamus Venenatis Efficitur Elit Lobortis Aliquet. Orci Varius Natoque Penatibus Et Magnis Dis Parturient Montes, Nascetur Ridiculus Mus. Cras Commodo Quam Id Nisi Viverra Pulvinar. Sed Commodo Lobortis Elementum. Quisque Ullamcorper Libero Justo, Consequat Elementum Odio Malesuada Vitae. Nullam A Luctus Lacus, Fringilla Molestie Lectus. Maecenas At Luctus Justo, Sit Amet Bibendum Nibh. Vestibulum Suscipit Ac Turpis Non Pellentesque. Donec Sodales Ultrices Rhoncus. Nulla Id Dui Dolor.</p>\n<p>Proin Vehicula Malesuada Urna Ac Accumsan. Maecenas Vitae Nulla Nisi. Duis Mauris Felis, Finibus Vitae Consectetur Eu, Iaculis Vel Turpis. Maecenas Ultrices Vestibulum Augue A Luctus. Vivamus Convallis Tortor Ac Nunc Euismod Aliquet. Phasellus In Mauris Mattis, Vulputate Nisl At, Ornare Urna. Fusce Quis Tellus Quis Tellus Viverra Venenatis. Nullam Sit Amet Magna Mauris. In Porta Purus Turpis, Interdum Tincidunt Ipsum Malesuada Eu. Proin Vel Ipsum Iaculis, Congue Sem Vel, Auctor Felis. Fusce Eget Vehicula Lectus. Nullam Tempor Elementum Tortor. Nullam Eget Hendrerit Nulla. Quisque Tristique Mauris Aliquet Dictum Pellentesque. Phasellus Suscipit Tincidunt Pretium. Mauris Vel Placerat Odio. Donec Eu Elit Elit. Vestibulum Sit Amet Tortor Id Purus Mollis Placerat. Maecenas Consequat Metus Dui, Quis Gravida Orci Mattis Ut. Nam Vel Diam In Magna Vehicula Convallis. Quisque Efficitur Id Enim Eu Faucibus. Ut Faucibus Nulla Fermentum Pretium Aliquam. Nam Non Risus Ac Dolor Porttitor Sodales Quis Cursus Ipsum. Duis Ut Ligula Libero. Fusce Mollis, Nisl Nec Viverra Rutrum, Eros Nisi Mattis Lorem, Non Mollis Dui Velit Eget Tortor. Vivamus Consequat Est Id Justo Varius Tincidunt.</p>\n<p>Integer Vestibulum, Mi Tempus Blandit Aliquam, Ante Est Sagittis Metus, Sit Amet Commodo Eros Mauris Et Justo. Nullam Scelerisque Mauris In Elit Scelerisque Imperdiet. Etiam Ac Est Libero.</p>\n<p>Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit. Nam A Volutpat Diam. Duis Vitae Ante Et Ex Laoreet Scelerisque. Nunc Vestibulum Metus At Imperdiet Tempus. Cras Massa Ligula, Sodales Non Ornare Vitae, Accumsan Sit Amet Lorem. Suspendisse Quis Consectetur Justo. Aliquam Fringilla Ultricies Convallis. Fusce Sodales Semper Lectus Sed Viverra. Cras Nec Posuere Lorem, Eget Ultrices Sapien. Phasellus Scelerisque, Est Sed Sagittis Tristique, Ligula Justo Ultrices Enim, Ut Interdum Justo Est Molestie Lorem. Donec Mi Dui, Dictum Sit Amet Tempus Et, Tincidunt Nec Sem. In Placerat Mattis Nulla, Eu Pellentesque Erat Vehicula Nec. Donec Dapibus Consectetur Tincidunt.</p>', '17', '17', '1516440718', null, null, '2018-01-20 15:31:56');

-- ----------------------------
-- Table structure for notices
-- ----------------------------
DROP TABLE IF EXISTS `notices`;
CREATE TABLE `notices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) DEFAULT NULL,
  `details` varchar(5000) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `delete_date` int(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `announcemnt_user` (`user_id`),
  CONSTRAINT `announcemnt_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of notices
-- ----------------------------
INSERT INTO `notices` VALUES ('3', 'New Notice', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam a volutpat diam. Duis vitae ante et ex laoreet scelerisque. Nunc vestibulum metus at imperdiet tempus. Cras massa ligula, sodales non ornare vitae, accumsan sit amet lorem. Suspendisse quis consectetur justo. Aliquam fringilla ultricies convallis. Fusce sodales semper lectus sed viverra.\r\n\r\nCras nec posuere lorem, eget ultrices sapien. Phasellus scelerisque, est sed sagittis tristique, ligula justo ultrices enim, ut interdum justo est molestie lorem. Donec mi dui, dictum sit amet tempus et, tincidunt nec sem. In placerat mattis nulla, eu pellentesque erat vehicula nec. Donec dapibus consectetur tincidunt. Donec mattis neque eu turpis finibus, at pulvinar est ornare. Nullam enim libero, bibendum vel magna in, porttitor fringilla mauris. Proin rhoncus fringilla nisi in tempus. Curabitur non risus purus. Proin ligula risus, suscipit at euismod id, lobortis in nisl. Vivamus venenatis efficitur elit lobortis aliquet. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\r\n\r\nCras commodo quam id nisi viverra pulvinar. Sed commodo lobortis elementum. Quisque ullamcorper libero justo, consequat elementum odio malesuada vitae. Nullam a luctus lacus, fringilla molestie lectus. Maecenas at luctus justo, sit amet bibendum nibh. Vestibulum suscipit ac turpis non pellentesque. Donec sodales ultrices rhoncus. Nulla id dui dolor. Proin vehicula malesuada urna ac accumsan. Maecenas vitae nulla nisi. Duis mauris felis, finibus vitae consectetur eu, iaculis vel turpis. Maecenas ultrices vestibulum augue a luctus. Vivamus convallis tortor ac nunc euismod aliquet. Phasellus in mauris mattis, vulputate nisl at, ornare urna. Fusce quis tellus quis tellus viverra venenatis.\r\n\r\nNullam sit amet magna mauris. In porta purus turpis, interdum tincidunt ipsum malesuada eu. Proin vel ipsum iaculis, congue sem vel, auctor felis. Fusce eget vehicula lectus. Nullam tempor elementum tortor. Nullam eget hendrerit nulla. Quisque tristique mauris aliquet dictum pellentesque. Phasellus suscipit tincidunt pretium. Mauris vel placerat odio. Donec eu elit elit. Vestibulum sit amet tortor id purus mollis placerat. Maecenas consequat metus dui, quis gravida orci mattis ut. Nam vel diam in magna vehicula convallis. Quisque efficitur id enim eu faucibus.\r\n\r\nUt faucibus nulla fermentum pretium aliquam. Nam non risus ac dolor porttitor sodales quis cursus ipsum. Duis ut ligula libero. Fusce mollis, nisl nec viverra rutrum, eros nisi mattis lorem, non mollis dui velit eget tortor. Vivamus consequat est id justo varius tincidunt. Integer vestibulum, mi tempus blandit aliquam, ante est sagittis metus, sit amet commodo eros mauris et justo. Nullam scelerisque mauris in elit scelerisque imperdiet. Etiam ac est libero.', '1', '2018-01-09 17:47:53', '2018-01-11 14:54:19', '1515660859');
INSERT INTO `notices` VALUES ('4', 'Hey Sir!', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam a volutpat diam. Duis vitae ante et ex laoreet scelerisque. Nunc vestibulum metus at imperdiet tempus. Cras massa ligula, sodales non ornare vitae, accumsan sit amet lorem. Suspendisse quis consectetur justo. Aliquam fringilla ultricies convallis. Fusce sodales semper lectus sed viverra.\r\n\r\nCras nec posuere lorem, eget ultrices sapien. Phasellus scelerisque, est sed sagittis tristique, ligula justo ultrices enim, ut interdum justo est molestie lorem. Donec mi dui, dictum sit amet tempus et, tincidunt nec sem. In placerat mattis nulla, eu pellentesque erat vehicula nec. Donec dapibus consectetur tincidunt. Donec mattis neque eu turpis finibus, at pulvinar est ornare. Nullam enim libero, bibendum vel magna in, porttitor fringilla mauris. Proin rhoncus fringilla nisi in tempus. Curabitur non risus purus. Proin ligula risus, suscipit at euismod id, lobortis in nisl. Vivamus venenatis efficitur elit lobortis aliquet. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\r\n\r\nCras commodo quam id nisi viverra pulvinar. Sed commodo lobortis elementum. Quisque ullamcorper libero justo, consequat elementum odio malesuada vitae. Nullam a luctus lacus, fringilla molestie lectus. Maecenas at luctus justo, sit amet bibendum nibh. Vestibulum suscipit ac turpis non pellentesque. Donec sodales ultrices rhoncus. Nulla id dui dolor. Proin vehicula malesuada urna ac accumsan. Maecenas vitae nulla nisi. Duis mauris felis, finibus vitae consectetur eu, iaculis vel turpis. Maecenas ultrices vestibulum augue a luctus. Vivamus convallis tortor ac nunc euismod aliquet. Phasellus in mauris mattis, vulputate nisl at, ornare urna. Fusce quis tellus quis tellus viverra venenatis.\r\n\r\nNullam sit amet magna mauris. In porta purus turpis, interdum tincidunt ipsum malesuada eu. Proin vel ipsum iaculis, congue sem vel, auctor felis. Fusce eget vehicula lectus. Nullam tempor elementum tortor. Nullam eget hendrerit nulla. Quisque tristique mauris aliquet dictum pellentesque. Phasellus suscipit tincidunt pretium. Mauris vel placerat odio. Donec eu elit elit. Vestibulum sit amet tortor id purus mollis placerat. Maecenas consequat metus dui, quis gravida orci mattis ut. Nam vel diam in magna vehicula convallis. Quisque efficitur id enim eu faucibus.\r\n\r\nUt faucibus nulla fermentum pretium aliquam. Nam non risus ac dolor porttitor sodales quis cursus ipsum. Duis ut ligula libero. Fusce mollis, nisl nec viverra rutrum, eros nisi mattis lorem, non mollis dui velit eget tortor. Vivamus consequat est id justo varius tincidunt. Integer vestibulum, mi tempus blandit aliquam, ante est sagittis metus, sit amet commodo eros mauris et justo. Nullam scelerisque mauris in elit scelerisque imperdiet. Etiam ac est libero.', '1', '2018-01-09 17:48:02', '2018-01-10 17:52:59', '1515585179');
INSERT INTO `notices` VALUES ('5', 'Sdfsdfsdf', '<p>asdasdasd</p>', '17', '2018-01-10 16:28:06', '2018-01-10 17:52:30', '1515585150');
INSERT INTO `notices` VALUES ('6', 'Asdasdasdasdas Updated Again Again', '<p>asdasdasd&nbsp;Updated&nbsp;Again</p>', '17', '2018-01-10 17:52:56', '2018-01-11 13:55:25', '1515657325');
INSERT INTO `notices` VALUES ('7', 'Lorem Epsum', '<p>Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit. Nam A Volutpat Diam. Duis Vitae Ante Et Ex Laoreet Scelerisque. Nunc Vestibulum Metus At Imperdiet Tempus. Cras Massa Ligula, Sodales Non Ornare Vitae, Accumsan Sit Amet Lorem. Suspendisse Quis Consectetur Justo. Aliquam Fringilla Ultricies Convallis. Fusce Sodales Semper Lectus Sed Viverra. Cras Nec Posuere Lorem, Eget Ultrices Sapien. Phasellus Scelerisque, Est Sed Sagittis Tristique, Ligula Justo Ultrices Enim, Ut Interdum Justo Est Molestie Lorem. Donec Mi Dui, Dictum Sit Amet Tempus Et, Tincidunt Nec Sem. In Placerat Mattis Nulla, Eu Pellentesque Erat Vehicula Nec. Donec Dapibus Consectetur Tincidunt.</p>\r\n<p><strong>Donec Mattis Neque Eu Turpis Finibus, At Pulvinar Est Ornare. </strong></p>\r\n<p>Nullam Enim Libero, Bibendum Vel Magna In, Porttitor Fringilla Mauris. Proin Rhoncus Fringilla Nisi In Tempus. Curabitur Non Risus Purus. Proin Ligula Risus, Suscipit At Euismod Id, Lobortis In Nisl. Vivamus Venenatis Efficitur Elit Lobortis Aliquet. Orci Varius Natoque Penatibus Et Magnis Dis Parturient Montes, Nascetur Ridiculus Mus. Cras Commodo Quam Id Nisi Viverra Pulvinar. Sed Commodo Lobortis Elementum. Quisque Ullamcorper Libero Justo, Consequat Elementum Odio Malesuada Vitae. Nullam A Luctus Lacus, Fringilla Molestie Lectus. Maecenas At Luctus Justo, Sit Amet Bibendum Nibh. Vestibulum Suscipit Ac Turpis Non Pellentesque. Donec Sodales Ultrices Rhoncus. Nulla Id Dui Dolor.</p>\r\n<p>Proin Vehicula Malesuada Urna Ac Accumsan. Maecenas Vitae Nulla Nisi. Duis Mauris Felis, Finibus Vitae Consectetur Eu, Iaculis Vel Turpis. Maecenas Ultrices Vestibulum Augue A Luctus. Vivamus Convallis Tortor Ac Nunc Euismod Aliquet. Phasellus In Mauris Mattis, Vulputate Nisl At, Ornare Urna. Fusce Quis Tellus Quis Tellus Viverra Venenatis. Nullam Sit Amet Magna Mauris. In Porta Purus Turpis, Interdum Tincidunt Ipsum Malesuada Eu. Proin Vel Ipsum Iaculis, Congue Sem Vel, Auctor Felis. Fusce Eget Vehicula Lectus. Nullam Tempor Elementum Tortor. Nullam Eget Hendrerit Nulla. Quisque Tristique Mauris Aliquet Dictum Pellentesque. Phasellus Suscipit Tincidunt Pretium. Mauris Vel Placerat Odio. Donec Eu Elit Elit. Vestibulum Sit Amet Tortor Id Purus Mollis Placerat. Maecenas Consequat Metus Dui, Quis Gravida Orci Mattis Ut. Nam Vel Diam In Magna Vehicula Convallis. Quisque Efficitur Id Enim Eu Faucibus. Ut Faucibus Nulla Fermentum Pretium Aliquam. Nam Non Risus Ac Dolor Porttitor Sodales Quis Cursus Ipsum. Duis Ut Ligula Libero. Fusce Mollis, Nisl Nec Viverra Rutrum, Eros Nisi Mattis Lorem, Non Mollis Dui Velit Eget Tortor. Vivamus Consequat Est Id Justo Varius Tincidunt.</p>\r\n<p>Integer Vestibulum, Mi Tempus Blandit Aliquam, Ante Est Sagittis Metus, Sit Amet Commodo Eros Mauris Et Justo. Nullam Scelerisque Mauris In Elit Scelerisque Imperdiet. Etiam Ac Est Libero.</p>', '17', '2018-01-10 18:09:08', '2018-01-11 14:38:44', '1515659924');
INSERT INTO `notices` VALUES ('8', 'Mahadi', '<p>Hey Mahadi!</p>', '1', '2018-01-11 12:54:48', null, null);
INSERT INTO `notices` VALUES ('9', 'Image', '<p>Check Image</p>', '21', '2018-01-11 13:06:13', null, null);
INSERT INTO `notices` VALUES ('10', 'Lorem Ipsum', '<p>Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit. Nam A Volutpat Diam. Duis Vitae Ante Et Ex Laoreet Scelerisque. Nunc Vestibulum Metus At Imperdiet Tempus. Cras Massa Ligula, Sodales Non Ornare Vitae, Accumsan Sit Amet Lorem. Suspendisse Quis Consectetur Justo. Aliquam Fringilla Ultricies Convallis. Fusce Sodales Semper Lectus Sed Viverra. Cras Nec Posuere Lorem, Eget Ultrices Sapien. Phasellus Scelerisque, Est Sed Sagittis Tristique, Ligula Justo Ultrices Enim, Ut Interdum Justo Est Molestie Lorem. Donec Mi Dui, Dictum Sit Amet Tempus Et, Tincidunt Nec Sem. In Placerat Mattis Nulla, Eu Pellentesque Erat Vehicula Nec. Donec Dapibus Consectetur Tincidunt.</p>\r\n<p><strong>Donec Mattis Neque Eu Turpis Finibus, At Pulvinar Est Ornare.</strong></p>\r\n<p>Nullam Enim Libero, Bibendum Vel Magna In, Porttitor Fringilla Mauris. Proin Rhoncus Fringilla Nisi In Tempus. Curabitur Non Risus Purus. Proin Ligula Risus, Suscipit At Euismod Id, Lobortis In Nisl. Vivamus Venenatis Efficitur Elit Lobortis Aliquet. Orci Varius Natoque Penatibus Et Magnis Dis Parturient Montes, Nascetur Ridiculus Mus. Cras Commodo Quam Id Nisi Viverra Pulvinar. Sed Commodo Lobortis Elementum. Quisque Ullamcorper Libero Justo, Consequat Elementum Odio Malesuada Vitae. Nullam A Luctus Lacus, Fringilla Molestie Lectus. Maecenas At Luctus Justo, Sit Amet Bibendum Nibh. Vestibulum Suscipit Ac Turpis Non Pellentesque. Donec Sodales Ultrices Rhoncus. Nulla Id Dui Dolor.</p>\r\n<p>Proin Vehicula Malesuada Urna Ac Accumsan. Maecenas Vitae Nulla Nisi. Duis Mauris Felis, Finibus Vitae Consectetur Eu, Iaculis Vel Turpis. Maecenas Ultrices Vestibulum Augue A Luctus. Vivamus Convallis Tortor Ac Nunc Euismod Aliquet. Phasellus In Mauris Mattis, Vulputate Nisl At, Ornare Urna. Fusce Quis Tellus Quis Tellus Viverra Venenatis. Nullam Sit Amet Magna Mauris. In Porta Purus Turpis, Interdum Tincidunt Ipsum Malesuada Eu. Proin Vel Ipsum Iaculis, Congue Sem Vel, Auctor Felis. Fusce Eget Vehicula Lectus. Nullam Tempor Elementum Tortor. Nullam Eget Hendrerit Nulla. Quisque Tristique Mauris Aliquet Dictum Pellentesque. Phasellus Suscipit Tincidunt Pretium. Mauris Vel Placerat Odio. Donec Eu Elit Elit. Vestibulum Sit Amet Tortor Id Purus Mollis Placerat. Maecenas Consequat Metus Dui, Quis Gravida Orci Mattis Ut. Nam Vel Diam In Magna Vehicula Convallis. Quisque Efficitur Id Enim Eu Faucibus. Ut Faucibus Nulla Fermentum Pretium Aliquam. Nam Non Risus Ac Dolor Porttitor Sodales Quis Cursus Ipsum. Duis Ut Ligula Libero. Fusce Mollis, Nisl Nec Viverra Rutrum, Eros Nisi Mattis Lorem, Non Mollis Dui Velit Eget Tortor. Vivamus Consequat Est Id Justo Varius Tincidunt.</p>\r\n<p>Integer Vestibulum, Mi Tempus Blandit Aliquam, Ante Est Sagittis Metus, Sit Amet Commodo Eros Mauris Et Justo. Nullam Scelerisque Mauris In Elit Scelerisque Imperdiet. Etiam Ac Est Libero.</p>\r\n<p>Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit. Nam A Volutpat Diam. Duis Vitae Ante Et Ex Laoreet Scelerisque. Nunc Vestibulum Metus At Imperdiet Tempus. Cras Massa Ligula, Sodales Non Ornare Vitae, Accumsan Sit Amet Lorem. Suspendisse Quis Consectetur Justo. Aliquam Fringilla Ultricies Convallis. Fusce Sodales Semper Lectus Sed Viverra. Cras Nec Posuere Lorem, Eget Ultrices Sapien. Phasellus Scelerisque, Est Sed Sagittis Tristique, Ligula Justo Ultrices Enim, Ut Interdum Justo Est Molestie Lorem. Donec Mi Dui, Dictum Sit Amet Tempus Et, Tincidunt Nec Sem. In Placerat Mattis Nulla, Eu Pellentesque Erat Vehicula Nec. Donec Dapibus Consectetur Tincidunt.</p>', '17', '2018-01-11 14:55:45', null, null);
INSERT INTO `notices` VALUES ('11', 'Sdfsdf', '<p>sdfsdf</p>', '17', '2018-01-11 17:00:53', null, null);
INSERT INTO `notices` VALUES ('12', 'For Notification', '<p>Lorem Epsum</p>', '17', '2018-01-11 17:16:32', '2018-01-11 17:56:14', '1515671774');
INSERT INTO `notices` VALUES ('13', 'Another For Notification', '<p>asdasd Asdasd Updated You Again! Hello!</p>', '1', '2018-01-11 17:18:09', '2018-01-14 16:31:48', null);
INSERT INTO `notices` VALUES ('14', 'For Alert', '<p>Alert Boyo</p>', '1', '2018-01-11 17:19:40', null, null);
INSERT INTO `notices` VALUES ('15', 'For Alert', '<p>alert Bab!</p>', '1', '2018-01-11 17:20:11', '2018-01-11 17:20:46', '1515669646');
INSERT INTO `notices` VALUES ('16', 'Sdfsdf', '<p>sdfsdf</p>', '1', '2018-01-11 17:20:29', null, null);
INSERT INTO `notices` VALUES ('17', 'Asdasd', '<p>asdasd</p>', '1', '2018-01-11 17:54:36', '2018-01-11 17:56:19', '1515671779');
INSERT INTO `notices` VALUES ('18', 'Asdasd', '<p>asdasd</p>', '1', '2018-01-11 17:54:47', null, null);
INSERT INTO `notices` VALUES ('19', 'Asdasdsa', '<p>asdasd</p>', '1', '2018-01-11 17:54:53', null, null);
INSERT INTO `notices` VALUES ('20', 'Asdasd', '<p>asdasdasd</p>', '17', '2018-01-17 12:58:55', null, null);
INSERT INTO `notices` VALUES ('21', 'Lorem Ipsum', '<p>Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit. Nam A Volutpat Diam. Duis Vitae Ante Et Ex Laoreet Scelerisque. Nunc Vestibulum Metus At Imperdiet Tempus. Cras Massa Ligula, Sodales Non Ornare Vitae, Accumsan Sit Amet Lorem. Suspendisse Quis Consectetur Justo. Aliquam Fringilla Ultricies Convallis. Fusce Sodales Semper Lectus Sed Viverra. Cras Nec Posuere Lorem, Eget Ultrices Sapien. Phasellus Scelerisque, Est Sed Sagittis Tristique, Ligula Justo Ultrices Enim, Ut Interdum Justo Est Molestie Lorem. Donec Mi Dui, Dictum Sit Amet Tempus Et, Tincidunt Nec Sem. In Placerat Mattis Nulla, Eu Pellentesque Erat Vehicula Nec. Donec Dapibus Consectetur Tincidunt.</p>\r\n<p><strong>Donec Mattis Neque Eu Turpis Finibus, At Pulvinar Est Ornare.</strong></p>\r\n<p>Nullam Enim Libero, Bibendum Vel Magna In, Porttitor Fringilla Mauris. Proin Rhoncus Fringilla Nisi In Tempus. Curabitur Non Risus Purus. Proin Ligula Risus, Suscipit At Euismod Id, Lobortis In Nisl. Vivamus Venenatis Efficitur Elit Lobortis Aliquet. Orci Varius Natoque Penatibus Et Magnis Dis Parturient Montes, Nascetur Ridiculus Mus. Cras Commodo Quam Id Nisi Viverra Pulvinar. Sed Commodo Lobortis Elementum. Quisque Ullamcorper Libero Justo, Consequat Elementum Odio Malesuada Vitae. Nullam A Luctus Lacus, Fringilla Molestie Lectus. Maecenas At Luctus Justo, Sit Amet Bibendum Nibh. Vestibulum Suscipit Ac Turpis Non Pellentesque. Donec Sodales Ultrices Rhoncus. Nulla Id Dui Dolor.</p>\r\n<p>Proin Vehicula Malesuada Urna Ac Accumsan. Maecenas Vitae Nulla Nisi. Duis Mauris Felis, Finibus Vitae Consectetur Eu, Iaculis Vel Turpis. Maecenas Ultrices Vestibulum Augue A Luctus. Vivamus Convallis Tortor Ac Nunc Euismod Aliquet. Phasellus In Mauris Mattis, Vulputate Nisl At, Ornare Urna. Fusce Quis Tellus Quis Tellus Viverra Venenatis. Nullam Sit Amet Magna Mauris. In Porta Purus Turpis, Interdum Tincidunt Ipsum Malesuada Eu. Proin Vel Ipsum Iaculis, Congue Sem Vel, Auctor Felis. Fusce Eget Vehicula Lectus. Nullam Tempor Elementum Tortor. Nullam Eget Hendrerit Nulla. Quisque Tristique Mauris Aliquet Dictum Pellentesque. Phasellus Suscipit Tincidunt Pretium. Mauris Vel Placerat Odio. Donec Eu Elit Elit. Vestibulum Sit Amet Tortor Id Purus Mollis Placerat. Maecenas Consequat Metus Dui, Quis Gravida Orci Mattis Ut. Nam Vel Diam In Magna Vehicula Convallis. Quisque Efficitur Id Enim Eu Faucibus. Ut Faucibus Nulla Fermentum Pretium Aliquam. Nam Non Risus Ac Dolor Porttitor Sodales Quis Cursus Ipsum. Duis Ut Ligula Libero. Fusce Mollis, Nisl Nec Viverra Rutrum, Eros Nisi Mattis Lorem, Non Mollis Dui Velit Eget Tortor. Vivamus Consequat Est Id Justo Varius Tincidunt.</p>\r\n<p>Integer Vestibulum, Mi Tempus Blandit Aliquam, Ante Est Sagittis Metus, Sit Amet Commodo Eros Mauris Et Justo. Nullam Scelerisque Mauris In Elit Scelerisque Imperdiet. Etiam Ac Est Libero.</p>\r\n<p>Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit. Nam A Volutpat Diam. Duis Vitae Ante Et Ex Laoreet Scelerisque. Nunc Vestibulum Metus At Imperdiet Tempus. Cras Massa Ligula, Sodales Non Ornare Vitae, Accumsan Sit Amet Lorem. Suspendisse Quis Consectetur Justo. Aliquam Fringilla Ultricies Convallis. Fusce Sodales Semper Lectus Sed Viverra. Cras Nec Posuere Lorem, Eget Ultrices Sapien. Phasellus Scelerisque, Est Sed Sagittis Tristique, Ligula Justo Ultrices Enim, Ut Interdum Justo Est Molestie Lorem. Donec Mi Dui, Dictum Sit Amet Tempus Et, Tincidunt Nec Sem. In Placerat Mattis Nulla, Eu Pellentesque Erat Vehicula Nec. Donec Dapibus Consectetur Tincidunt.</p>', '17', '2018-01-20 15:31:56', null, null);

-- ----------------------------
-- Table structure for notice_comments
-- ----------------------------
DROP TABLE IF EXISTS `notice_comments`;
CREATE TABLE `notice_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_comment` varchar(5000) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `notice_id` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `delete_date` int(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notice_comment_user_id` (`user_id`),
  KEY `notice_id` (`notice_id`),
  CONSTRAINT `notice_comment_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notice_id` FOREIGN KEY (`notice_id`) REFERENCES `notices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of notice_comments
-- ----------------------------
INSERT INTO `notice_comments` VALUES ('2', '<p>asdasdasd</p>', '17', '13', '2018-01-14 17:15:52', null, null);
INSERT INTO `notice_comments` VALUES ('3', '<p>sdfsdfsdfsdf</p>', '17', '13', '2018-01-14 17:19:10', null, null);
INSERT INTO `notice_comments` VALUES ('4', '<p>&nbsp;asdasdasd</p>', '17', '13', '2018-01-14 17:39:20', null, null);
INSERT INTO `notice_comments` VALUES ('5', '<p>asdasdasd</p>', '17', '13', '2018-01-14 17:44:53', null, null);
INSERT INTO `notice_comments` VALUES ('6', '<p>Legs</p>', '17', '13', '2018-01-14 17:51:37', null, null);
INSERT INTO `notice_comments` VALUES ('7', '<p>begs</p>', '17', '13', '2018-01-14 17:51:53', null, null);
INSERT INTO `notice_comments` VALUES ('8', '<p>tyty Asdasdsdf Sdf</p>', '17', '13', '2018-01-14 17:59:33', '2018-01-18 16:45:15', null);
INSERT INTO `notice_comments` VALUES ('9', '<p>asdasdasd</p>', '17', '13', '2018-01-14 18:01:33', null, null);
INSERT INTO `notice_comments` VALUES ('10', '<p>sdfsdf</p>', '17', '13', '2018-01-14 18:01:50', null, null);
INSERT INTO `notice_comments` VALUES ('11', '<p>asdasd Rtrt</p>', '17', '13', '2018-01-14 18:04:14', null, null);
INSERT INTO `notice_comments` VALUES ('12', '<p>sdsdsdsd</p>', '17', '13', '2018-01-14 18:04:25', null, null);
INSERT INTO `notice_comments` VALUES ('13', '<p>1</p>', '17', '13', '2018-01-14 18:04:33', null, null);
INSERT INTO `notice_comments` VALUES ('14', '<p>2</p>', '17', '13', '2018-01-14 18:04:36', null, null);
INSERT INTO `notice_comments` VALUES ('15', '<p>3</p>', '17', '13', '2018-01-14 18:04:39', null, null);
INSERT INTO `notice_comments` VALUES ('16', '<p>4</p>', '17', '13', '2018-01-14 18:04:42', null, null);
INSERT INTO `notice_comments` VALUES ('17', '<p>asdasdasd</p>', '1', '13', '2018-01-14 18:09:43', null, null);
INSERT INTO `notice_comments` VALUES ('18', '<p>dsfsdf</p>', '17', '13', '2018-01-14 18:14:46', '2018-01-15 14:07:21', '1516003641');
INSERT INTO `notice_comments` VALUES ('19', '<p>sdfsdfsdf</p>', '17', '13', '2018-01-15 13:47:33', '2018-01-15 14:07:16', '1516003636');
INSERT INTO `notice_comments` VALUES ('20', '<p>sdfsdf</p>', '17', '13', '2018-01-15 13:48:45', '2018-01-15 14:07:11', '1516003631');
INSERT INTO `notice_comments` VALUES ('21', '<p>High Esteem</p>', '17', '13', '2018-01-15 14:09:28', '2018-01-15 14:09:36', '1516003776');
INSERT INTO `notice_comments` VALUES ('22', '<p>&nbsp;sdfsdfsdf</p>', '52', '13', '2018-01-15 14:16:41', '2018-01-15 14:16:45', '1516004205');
INSERT INTO `notice_comments` VALUES ('23', '<p>sdfsdfsdf</p>', '52', '13', '2018-01-15 14:17:03', null, null);
INSERT INTO `notice_comments` VALUES ('24', '<p>asdasdasd</p>', '52', '13', '2018-01-15 14:17:07', '2018-01-15 14:53:18', '1516006398');
INSERT INTO `notice_comments` VALUES ('25', '<p>sdfsdfsdf</p>', '52', '13', '2018-01-15 14:38:47', '2018-01-15 14:53:07', '1516006387');
INSERT INTO `notice_comments` VALUES ('26', '<p>asdasdasd Sdfsdf</p>', '52', '13', '2018-01-15 14:53:22', '2018-01-15 15:09:56', null);
INSERT INTO `notice_comments` VALUES ('27', '<p>asdadad Updated</p>', '52', '13', '2018-01-15 15:10:19', '2018-01-15 15:10:32', null);
INSERT INTO `notice_comments` VALUES ('28', '<p>fgdfgd Sdsdgdf</p>', '52', '13', '2018-01-15 15:11:17', '2018-01-15 16:01:13', '1516010473');
INSERT INTO `notice_comments` VALUES ('29', '<p>sdfsdfsdf</p>', '17', '13', '2018-01-15 16:04:13', null, null);
INSERT INTO `notice_comments` VALUES ('30', '<p>sfdsdfsdf</p>', '17', '13', '2018-01-15 16:14:19', null, null);
INSERT INTO `notice_comments` VALUES ('31', '<p>sdfsdfsdf</p>', '17', '13', '2018-01-15 16:18:30', '2018-01-15 16:19:40', '1516011580');
INSERT INTO `notice_comments` VALUES ('32', '<p>asdasdasd</p>', '17', '13', '2018-01-16 13:42:53', null, null);
INSERT INTO `notice_comments` VALUES ('33', '<p>sdfsdfsdfsdf</p>', '17', '13', '2018-01-16 17:51:48', null, null);
INSERT INTO `notice_comments` VALUES ('34', '<p>sdsdf</p>', '17', '13', '2018-01-16 17:51:53', null, null);
INSERT INTO `notice_comments` VALUES ('35', '<p>sdfsdfsdf</p>', '1', '13', '2018-01-16 17:53:08', null, null);
INSERT INTO `notice_comments` VALUES ('36', '<p>sdfsdfsdf</p>', '1', '13', '2018-01-16 17:56:52', null, null);
INSERT INTO `notice_comments` VALUES ('37', '<p>zxczxczc</p>', '1', '13', '2018-01-16 17:57:16', null, null);
INSERT INTO `notice_comments` VALUES ('38', '<p>asdasdasd</p>', '1', '13', '2018-01-16 17:58:18', null, null);
INSERT INTO `notice_comments` VALUES ('39', '<p>sdfsdfsdf</p>', '1', '13', '2018-01-16 17:59:44', null, null);
INSERT INTO `notice_comments` VALUES ('40', '<p>dfgdfgfdg</p>', '17', '13', '2018-01-16 18:00:19', null, null);
INSERT INTO `notice_comments` VALUES ('41', '<p>asdasdasd</p>', '44', '13', '2018-01-16 18:07:16', null, null);
INSERT INTO `notice_comments` VALUES ('42', '<p>asdasdasd</p>', '44', '13', '2018-01-16 18:08:08', null, null);
INSERT INTO `notice_comments` VALUES ('43', '<p>sdfsdfsdf Dfdfdf Sdfsdf Asdasd</p>', '52', '13', '2018-01-16 18:08:40', '2018-01-16 18:09:35', null);
INSERT INTO `notice_comments` VALUES ('44', '<p>I Have No Fear Because You Are All That I Have</p>', '17', '13', '2018-01-17 12:36:29', null, null);
INSERT INTO `notice_comments` VALUES ('45', '<p>dfsdfsdf</p>', '17', '13', '2018-01-17 12:43:38', null, null);
INSERT INTO `notice_comments` VALUES ('47', '<p>dfgdf Sdfsd</p>', '52', '10', '2018-01-18 17:10:12', '2018-01-18 17:10:19', null);

-- ----------------------------
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notification` varchar(500) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `viewed` tinyint(1) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `notification_user_id` (`user_id`),
  CONSTRAINT `notification_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1506 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of notifications
-- ----------------------------
INSERT INTO `notifications` VALUES ('10', 'New Exam has been added to batch HNBTR-D-98, titled- &#34;Fortify&#34;. Exam Date January 19 (Friday), 2018. Click for Details!', '52', '?controller=students&action=showStudentProfile&uname=geomatry', null, null, '1', '2017-12-28 17:23:45');
INSERT INTO `notifications` VALUES ('11', 'New Exam has been added to batch HNBTR-D-98, titled- &#34;Fortify&#34;. Exam Date January 19 (Friday), 2018. Click for Details!', '50', '?controller=students&action=showStudentProfile&uname=test_linksdfdfsdfhjk', null, null, '0', '2017-12-28 17:23:45');
INSERT INTO `notifications` VALUES ('12', 'New Exam has been added to batch HNBTR-D-98, titled- &#34;Fortify&#34;. Exam Date January 19 (Friday), 2018. Click for Details!', '44', '?controller=students&action=showStudentProfile&uname=peter_parker', null, null, '0', '2017-12-28 17:23:45');
INSERT INTO `notifications` VALUES ('13', 'New Exam has been added to batch HNBTR-D-98, titled- &#34;new&#34;. Exam Date January 11 (Thursday), 2018. Click for Details!', '52', '?controller=students&action=showStudentProfile&uname=geomatry', null, null, '1', '2017-12-28 17:36:41');
INSERT INTO `notifications` VALUES ('14', 'New Exam has been added to batch HNBTR-D-98, titled- &#34;new&#34;. Exam Date January 11 (Thursday), 2018. Click for Details!', '50', '?controller=students&action=showStudentProfile&uname=test_linksdfdfsdfhjk', null, null, '0', '2017-12-28 17:36:41');
INSERT INTO `notifications` VALUES ('15', 'New Exam has been added to batch HNBTR-D-98, titled- &#34;new&#34;. Exam Date January 11 (Thursday), 2018. Click for Details!', '44', '?controller=students&action=showStudentProfile&uname=peter_parker', null, null, '0', '2017-12-28 17:36:41');
INSERT INTO `notifications` VALUES ('16', 'New Exam has been added to batch HNBTR-D-98, titled- &#34;asdasd&#34;. Exam Date January 22 (Monday), 2018.', '52', '?controller=students&action=showStudentProfile&uname=geomatry', null, null, '1', '2018-01-02 15:27:06');
INSERT INTO `notifications` VALUES ('17', 'New Exam has been added to batch HNBTR-D-98, titled- &#34;asdasd&#34;. Exam Date January 22 (Monday), 2018.', '50', '?controller=students&action=showStudentProfile&uname=test_linksdfdfsdfhjk', null, null, '0', '2018-01-02 15:27:06');
INSERT INTO `notifications` VALUES ('18', 'New Exam has been added to batch HNBTR-D-98, titled- &#34;asdasd&#34;. Exam Date January 22 (Monday), 2018.', '44', '?controller=students&action=showStudentProfile&uname=peter_parker', null, null, '0', '2018-01-02 15:27:06');
INSERT INTO `notifications` VALUES ('19', 'Your score for exam asdasd has been updated! Click to view!', '52', '?controller=students&action=showStudentPerformance&uname=geomatry', null, null, '1', '2018-01-02 15:32:34');
INSERT INTO `notifications` VALUES ('20', 'Your score for exam asdasd has been updated! Click to view!', '50', '?controller=students&action=showStudentPerformance&uname=test_linksdfdfsdfhjk', null, null, '0', '2018-01-02 15:32:34');
INSERT INTO `notifications` VALUES ('21', 'Your score for exam asdasd has been updated! Click to view!', '44', '?controller=students&action=showStudentPerformance&uname=peter_parker', null, null, '0', '2018-01-02 15:32:34');
INSERT INTO `notifications` VALUES ('22', 'New Exam has been added to batch HNBTR-D-98, titled- &#34;Madar&#34;. Exam Date January 16 (Tuesday), 2018.', '52', '?controller=students&action=showStudentPerformance&uname=geomatry', 'assignment', 'deep-orange', '1', '2018-01-03 15:12:50');
INSERT INTO `notifications` VALUES ('23', 'New Exam has been added to batch HNBTR-D-98, titled- &#34;Madar&#34;. Exam Date January 16 (Tuesday), 2018.', '50', '?controller=students&action=showStudentPerformance&uname=test_linksdfdfsdfhjk', 'assignment', 'deep-orange', '0', '2018-01-03 15:12:50');
INSERT INTO `notifications` VALUES ('24', 'New Exam has been added to batch HNBTR-D-98, titled- &#34;Madar&#34;. Exam Date January 16 (Tuesday), 2018.', '44', '?controller=students&action=showStudentPerformance&uname=peter_parker', 'assignment', 'deep-orange', '1', '2018-01-03 15:12:50');
INSERT INTO `notifications` VALUES ('25', 'Your score for exam Fortify has been updated! Click to view!', '52', '?controller=students&action=showStudentPerformance&uname=geomatry', 'assignment_turned_in', 'light-green', '1', '2018-01-03 16:31:09');
INSERT INTO `notifications` VALUES ('26', 'Your score for exam Fortify has been updated! Click to view!', '50', '?controller=students&action=showStudentPerformance&uname=test_linksdfdfsdfhjk', 'assignment_turned_in', 'light-green', '0', '2018-01-03 16:31:09');
INSERT INTO `notifications` VALUES ('27', 'Your score for exam Fortify has been updated! Click to view!', '44', '?controller=students&action=showStudentPerformance&uname=peter_parker', 'assignment_turned_in', 'light-green', '0', '2018-01-03 16:31:09');
INSERT INTO `notifications` VALUES ('28', 'New Exam has been added to batch HNBTR-D-98, titled- &#34;ghgh&#34;. Exam Date January 04 (Thursday), 2018.', '52', '?controller=students&action=showStudentPerformance&uname=geomatry', 'assignment', 'deep-orange', '1', '2018-01-03 16:31:51');
INSERT INTO `notifications` VALUES ('29', 'New Exam has been added to batch HNBTR-D-98, titled- &#34;ghgh&#34;. Exam Date January 04 (Thursday), 2018.', '50', '?controller=students&action=showStudentPerformance&uname=test_linksdfdfsdfhjk', 'assignment', 'deep-orange', '0', '2018-01-03 16:31:51');
INSERT INTO `notifications` VALUES ('30', 'New Exam has been added to batch HNBTR-D-98, titled- &#34;ghgh&#34;. Exam Date January 04 (Thursday), 2018.', '44', '?controller=students&action=showStudentPerformance&uname=peter_parker', 'assignment', 'deep-orange', '0', '2018-01-03 16:31:51');
INSERT INTO `notifications` VALUES ('31', 'New Exam has been added to batch HNBTR-D-98, titled- &#34;Changed&#34;. Exam Date January 24 (Wednesday), 2018.', '52', '?controller=students&action=showStudentPerformance&uname=geomatry', 'assignment', 'deep-orange', '1', '2018-01-04 15:59:34');
INSERT INTO `notifications` VALUES ('32', 'New Exam has been added to batch HNBTR-D-98, titled- &#34;Changed&#34;. Exam Date January 24 (Wednesday), 2018.', '50', '?controller=students&action=showStudentPerformance&uname=test_linksdfdfsdfhjk', 'assignment', 'deep-orange', '0', '2018-01-04 15:59:34');
INSERT INTO `notifications` VALUES ('33', 'New Exam has been added to batch HNBTR-D-98, titled- &#34;Changed&#34;. Exam Date January 24 (Wednesday), 2018.', '44', '?controller=students&action=showStudentPerformance&uname=peter_parker', 'assignment', 'deep-orange', '0', '2018-01-04 15:59:34');
INSERT INTO `notifications` VALUES ('34', 'New Exam has been added to batch HNBTR-D-98, titled- &#34;Changed&#34;. Exam Date January 10 (Wednesday), 2018.', '52', '?controller=students&action=showStudentPerformance&uname=geomatry', 'assignment', 'deep-orange', '1', '2018-01-04 16:26:02');
INSERT INTO `notifications` VALUES ('35', 'New Exam has been added to batch HNBTR-D-98, titled- &#34;Changed&#34;. Exam Date January 10 (Wednesday), 2018.', '50', '?controller=students&action=showStudentPerformance&uname=test_linksdfdfsdfhjk', 'assignment', 'deep-orange', '0', '2018-01-04 16:26:02');
INSERT INTO `notifications` VALUES ('36', 'New Exam has been added to batch HNBTR-D-98, titled- &#34;Changed&#34;. Exam Date January 10 (Wednesday), 2018.', '44', '?controller=students&action=showStudentPerformance&uname=peter_parker', 'assignment', 'deep-orange', '1', '2018-01-04 16:26:02');
INSERT INTO `notifications` VALUES ('37', 'Your score for exam &#34;dfgdfg&#34; has been updated! Click to view!', '52', '?controller=students&action=showStudentPerformance&uname=geomatry', 'assignment_turned_in', 'light-green', '1', '2018-01-04 17:32:46');
INSERT INTO `notifications` VALUES ('38', 'Your score for exam &#34;dfgdfg&#34; has been updated! Click to view!', '50', '?controller=students&action=showStudentPerformance&uname=test_linksdfdfsdfhjk', 'assignment_turned_in', 'light-green', '0', '2018-01-04 17:32:46');
INSERT INTO `notifications` VALUES ('39', 'Your score for exam &#34;dfgdfg&#34; has been updated! Click to view!', '44', '?controller=students&action=showStudentPerformance&uname=peter_parker', 'assignment_turned_in', 'light-green', '0', '2018-01-04 17:32:46');
INSERT INTO `notifications` VALUES ('40', 'You have been migrated to batch HNBTR-M-5. Click to view!', '52', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '1', '2018-01-04 17:51:04');
INSERT INTO `notifications` VALUES ('41', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-M-5. Click to view!', '28', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:51:04');
INSERT INTO `notifications` VALUES ('42', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-M-5. Click to view!', '21', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:51:04');
INSERT INTO `notifications` VALUES ('43', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-M-5. Click to view!', '20', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:51:04');
INSERT INTO `notifications` VALUES ('44', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-M-5. Click to view!', '19', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:51:04');
INSERT INTO `notifications` VALUES ('45', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-M-5. Click to view!', '1', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '1', '2018-01-04 17:51:04');
INSERT INTO `notifications` VALUES ('46', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-M-5. Click to view!', '51', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:51:04');
INSERT INTO `notifications` VALUES ('47', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-M-5. Click to view!', '47', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:51:04');
INSERT INTO `notifications` VALUES ('48', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-M-5. Click to view!', '46', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:51:04');
INSERT INTO `notifications` VALUES ('49', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-M-5. Click to view!', '42', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:51:04');
INSERT INTO `notifications` VALUES ('50', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-M-5. Click to view!', '41', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:51:04');
INSERT INTO `notifications` VALUES ('51', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-M-5. Click to view!', '40', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:51:04');
INSERT INTO `notifications` VALUES ('52', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-M-5. Click to view!', '36', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:51:04');
INSERT INTO `notifications` VALUES ('53', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-M-5. Click to view!', '31', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:51:04');
INSERT INTO `notifications` VALUES ('54', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-M-5. Click to view!', '27', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:51:04');
INSERT INTO `notifications` VALUES ('55', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-M-5. Click to view!', '26', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:51:05');
INSERT INTO `notifications` VALUES ('56', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-M-5. Click to view!', '24', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:51:05');
INSERT INTO `notifications` VALUES ('57', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-M-5. Click to view!', '23', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:51:05');
INSERT INTO `notifications` VALUES ('58', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-M-5. Click to view!', '22', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:51:05');
INSERT INTO `notifications` VALUES ('59', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-M-5. Click to view!', '16', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:51:05');
INSERT INTO `notifications` VALUES ('60', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-M-5. Click to view!', '15', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:51:05');
INSERT INTO `notifications` VALUES ('61', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-M-5. Click to view!', '14', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:51:05');
INSERT INTO `notifications` VALUES ('62', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-M-5. Click to view!', '81', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:51:05');
INSERT INTO `notifications` VALUES ('63', 'You have been migrated to batch HNBTR-D-98. Click to view!', '52', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '1', '2018-01-04 17:54:32');
INSERT INTO `notifications` VALUES ('64', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-D-98. Click to view!', '28', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:54:32');
INSERT INTO `notifications` VALUES ('65', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-D-98. Click to view!', '21', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:54:32');
INSERT INTO `notifications` VALUES ('66', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-D-98. Click to view!', '20', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:54:32');
INSERT INTO `notifications` VALUES ('67', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-D-98. Click to view!', '19', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:54:32');
INSERT INTO `notifications` VALUES ('68', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-D-98. Click to view!', '1', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '1', '2018-01-04 17:54:32');
INSERT INTO `notifications` VALUES ('69', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-D-98. Click to view!', '51', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:54:32');
INSERT INTO `notifications` VALUES ('70', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-D-98. Click to view!', '47', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:54:32');
INSERT INTO `notifications` VALUES ('71', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-D-98. Click to view!', '46', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:54:32');
INSERT INTO `notifications` VALUES ('72', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-D-98. Click to view!', '42', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:54:33');
INSERT INTO `notifications` VALUES ('73', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-D-98. Click to view!', '41', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:54:33');
INSERT INTO `notifications` VALUES ('74', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-D-98. Click to view!', '40', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:54:33');
INSERT INTO `notifications` VALUES ('75', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-D-98. Click to view!', '36', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:54:33');
INSERT INTO `notifications` VALUES ('76', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-D-98. Click to view!', '31', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:54:33');
INSERT INTO `notifications` VALUES ('77', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-D-98. Click to view!', '27', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:54:33');
INSERT INTO `notifications` VALUES ('78', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-D-98. Click to view!', '26', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:54:33');
INSERT INTO `notifications` VALUES ('79', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-D-98. Click to view!', '24', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:54:33');
INSERT INTO `notifications` VALUES ('80', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-D-98. Click to view!', '23', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:54:33');
INSERT INTO `notifications` VALUES ('81', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-D-98. Click to view!', '22', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:54:33');
INSERT INTO `notifications` VALUES ('82', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-D-98. Click to view!', '16', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:54:33');
INSERT INTO `notifications` VALUES ('83', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-D-98. Click to view!', '15', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:54:33');
INSERT INTO `notifications` VALUES ('84', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-D-98. Click to view!', '14', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:54:33');
INSERT INTO `notifications` VALUES ('85', 'Batch of student Geomatry Chronicles has been updated to batch HNBTR-D-98. Click to view!', '81', '?controller=students&action=showStudentProfile&uname=geomatry', 'domain', 'teal', '0', '2018-01-04 17:54:33');
INSERT INTO `notifications` VALUES ('86', 'You have been migrated to batch HNBTR-M-5. Click to view!', '44', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:14:40');
INSERT INTO `notifications` VALUES ('87', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '28', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:14:40');
INSERT INTO `notifications` VALUES ('88', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '21', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:14:40');
INSERT INTO `notifications` VALUES ('89', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '20', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:14:40');
INSERT INTO `notifications` VALUES ('90', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '19', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:14:40');
INSERT INTO `notifications` VALUES ('91', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '1', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '1', '2018-01-07 16:14:40');
INSERT INTO `notifications` VALUES ('92', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '51', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:14:41');
INSERT INTO `notifications` VALUES ('93', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '47', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:14:41');
INSERT INTO `notifications` VALUES ('94', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '46', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:14:41');
INSERT INTO `notifications` VALUES ('95', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '42', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:14:41');
INSERT INTO `notifications` VALUES ('96', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '41', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:14:41');
INSERT INTO `notifications` VALUES ('97', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '40', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:14:41');
INSERT INTO `notifications` VALUES ('98', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '36', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:14:41');
INSERT INTO `notifications` VALUES ('99', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '31', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:14:41');
INSERT INTO `notifications` VALUES ('100', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '27', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:14:41');
INSERT INTO `notifications` VALUES ('101', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '26', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:14:41');
INSERT INTO `notifications` VALUES ('102', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '24', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:14:41');
INSERT INTO `notifications` VALUES ('103', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '23', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:14:41');
INSERT INTO `notifications` VALUES ('104', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '22', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:14:41');
INSERT INTO `notifications` VALUES ('105', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '16', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:14:41');
INSERT INTO `notifications` VALUES ('106', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '15', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:14:41');
INSERT INTO `notifications` VALUES ('107', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '14', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:14:41');
INSERT INTO `notifications` VALUES ('108', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '81', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:14:41');
INSERT INTO `notifications` VALUES ('109', 'You have been migrated to batch HNBTR-D-98. Click to view!', '44', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:45:23');
INSERT INTO `notifications` VALUES ('110', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '28', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:45:23');
INSERT INTO `notifications` VALUES ('111', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '21', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:45:23');
INSERT INTO `notifications` VALUES ('112', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '20', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:45:23');
INSERT INTO `notifications` VALUES ('113', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '19', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:45:23');
INSERT INTO `notifications` VALUES ('114', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '1', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '1', '2018-01-07 16:45:23');
INSERT INTO `notifications` VALUES ('115', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '51', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:45:23');
INSERT INTO `notifications` VALUES ('116', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '47', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:45:23');
INSERT INTO `notifications` VALUES ('117', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '46', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:45:24');
INSERT INTO `notifications` VALUES ('118', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '42', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:45:24');
INSERT INTO `notifications` VALUES ('119', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '41', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:45:24');
INSERT INTO `notifications` VALUES ('120', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '40', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:45:24');
INSERT INTO `notifications` VALUES ('121', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '36', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:45:24');
INSERT INTO `notifications` VALUES ('122', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '31', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:45:24');
INSERT INTO `notifications` VALUES ('123', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '27', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:45:24');
INSERT INTO `notifications` VALUES ('124', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '26', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:45:24');
INSERT INTO `notifications` VALUES ('125', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '24', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:45:24');
INSERT INTO `notifications` VALUES ('126', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '23', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:45:24');
INSERT INTO `notifications` VALUES ('127', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '22', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:45:24');
INSERT INTO `notifications` VALUES ('128', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '16', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:45:24');
INSERT INTO `notifications` VALUES ('129', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '15', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:45:25');
INSERT INTO `notifications` VALUES ('130', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '14', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:45:25');
INSERT INTO `notifications` VALUES ('131', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '81', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 16:45:25');
INSERT INTO `notifications` VALUES ('132', 'You have been migrated to batch HNBTR-M-5. Click to view!', '44', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:05:27');
INSERT INTO `notifications` VALUES ('133', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '28', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:05:27');
INSERT INTO `notifications` VALUES ('134', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '21', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:05:27');
INSERT INTO `notifications` VALUES ('135', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '20', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:05:27');
INSERT INTO `notifications` VALUES ('136', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '19', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:05:27');
INSERT INTO `notifications` VALUES ('137', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '1', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '1', '2018-01-07 17:05:27');
INSERT INTO `notifications` VALUES ('138', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '51', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:05:27');
INSERT INTO `notifications` VALUES ('139', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '47', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:05:27');
INSERT INTO `notifications` VALUES ('140', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '46', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:05:27');
INSERT INTO `notifications` VALUES ('141', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '42', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:05:27');
INSERT INTO `notifications` VALUES ('142', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '41', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:05:27');
INSERT INTO `notifications` VALUES ('143', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '40', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:05:27');
INSERT INTO `notifications` VALUES ('144', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '36', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:05:27');
INSERT INTO `notifications` VALUES ('145', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '31', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:05:27');
INSERT INTO `notifications` VALUES ('146', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '27', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:05:27');
INSERT INTO `notifications` VALUES ('147', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '26', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:05:27');
INSERT INTO `notifications` VALUES ('148', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '24', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:05:27');
INSERT INTO `notifications` VALUES ('149', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '23', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:05:27');
INSERT INTO `notifications` VALUES ('150', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '22', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:05:27');
INSERT INTO `notifications` VALUES ('151', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '16', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:05:27');
INSERT INTO `notifications` VALUES ('152', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '15', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:05:27');
INSERT INTO `notifications` VALUES ('153', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '14', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:05:27');
INSERT INTO `notifications` VALUES ('154', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '81', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:05:27');
INSERT INTO `notifications` VALUES ('155', 'You have been migrated to batch HNBTR-D-98. Click to view!', '44', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:06:36');
INSERT INTO `notifications` VALUES ('156', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '28', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:06:37');
INSERT INTO `notifications` VALUES ('157', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '21', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:06:37');
INSERT INTO `notifications` VALUES ('158', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '20', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:06:37');
INSERT INTO `notifications` VALUES ('159', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '19', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:06:37');
INSERT INTO `notifications` VALUES ('160', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '1', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '1', '2018-01-07 17:06:37');
INSERT INTO `notifications` VALUES ('161', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '51', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:06:37');
INSERT INTO `notifications` VALUES ('162', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '47', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:06:37');
INSERT INTO `notifications` VALUES ('163', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '46', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:06:37');
INSERT INTO `notifications` VALUES ('164', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '42', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:06:37');
INSERT INTO `notifications` VALUES ('165', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '41', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:06:37');
INSERT INTO `notifications` VALUES ('166', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '40', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:06:37');
INSERT INTO `notifications` VALUES ('167', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '36', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:06:37');
INSERT INTO `notifications` VALUES ('168', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '31', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:06:37');
INSERT INTO `notifications` VALUES ('169', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '27', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:06:37');
INSERT INTO `notifications` VALUES ('170', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '26', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:06:37');
INSERT INTO `notifications` VALUES ('171', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '24', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:06:37');
INSERT INTO `notifications` VALUES ('172', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '23', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:06:37');
INSERT INTO `notifications` VALUES ('173', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '22', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:06:37');
INSERT INTO `notifications` VALUES ('174', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '16', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:06:37');
INSERT INTO `notifications` VALUES ('175', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '15', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:06:37');
INSERT INTO `notifications` VALUES ('176', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '14', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:06:37');
INSERT INTO `notifications` VALUES ('177', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '81', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:06:37');
INSERT INTO `notifications` VALUES ('178', 'You have been migrated to batch HNBTR-M-5. Click to view!', '44', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:38');
INSERT INTO `notifications` VALUES ('179', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '28', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:39');
INSERT INTO `notifications` VALUES ('180', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '21', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:39');
INSERT INTO `notifications` VALUES ('181', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '20', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:39');
INSERT INTO `notifications` VALUES ('182', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '19', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:39');
INSERT INTO `notifications` VALUES ('183', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '1', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '1', '2018-01-07 17:38:39');
INSERT INTO `notifications` VALUES ('184', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '51', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:39');
INSERT INTO `notifications` VALUES ('185', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '47', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:39');
INSERT INTO `notifications` VALUES ('186', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '46', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:39');
INSERT INTO `notifications` VALUES ('187', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '42', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:39');
INSERT INTO `notifications` VALUES ('188', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '41', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:39');
INSERT INTO `notifications` VALUES ('189', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '40', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:39');
INSERT INTO `notifications` VALUES ('190', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '36', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:39');
INSERT INTO `notifications` VALUES ('191', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '31', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:39');
INSERT INTO `notifications` VALUES ('192', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '27', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:39');
INSERT INTO `notifications` VALUES ('193', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '26', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:39');
INSERT INTO `notifications` VALUES ('194', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '24', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:39');
INSERT INTO `notifications` VALUES ('195', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '23', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:39');
INSERT INTO `notifications` VALUES ('196', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '22', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:39');
INSERT INTO `notifications` VALUES ('197', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '16', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:39');
INSERT INTO `notifications` VALUES ('198', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '15', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:39');
INSERT INTO `notifications` VALUES ('199', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '14', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:39');
INSERT INTO `notifications` VALUES ('200', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '81', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:39');
INSERT INTO `notifications` VALUES ('201', 'You have been migrated to batch HNBTR-D-98. Click to view!', '44', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:46');
INSERT INTO `notifications` VALUES ('202', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '28', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:46');
INSERT INTO `notifications` VALUES ('203', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '21', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:46');
INSERT INTO `notifications` VALUES ('204', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '20', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:46');
INSERT INTO `notifications` VALUES ('205', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '19', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:46');
INSERT INTO `notifications` VALUES ('206', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '1', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '1', '2018-01-07 17:38:46');
INSERT INTO `notifications` VALUES ('207', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '51', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:46');
INSERT INTO `notifications` VALUES ('208', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '47', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:46');
INSERT INTO `notifications` VALUES ('209', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '46', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:46');
INSERT INTO `notifications` VALUES ('210', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '42', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:46');
INSERT INTO `notifications` VALUES ('211', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '41', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:46');
INSERT INTO `notifications` VALUES ('212', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '40', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:46');
INSERT INTO `notifications` VALUES ('213', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '36', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:46');
INSERT INTO `notifications` VALUES ('214', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '31', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:46');
INSERT INTO `notifications` VALUES ('215', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '27', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:46');
INSERT INTO `notifications` VALUES ('216', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '26', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:46');
INSERT INTO `notifications` VALUES ('217', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '24', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:46');
INSERT INTO `notifications` VALUES ('218', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '23', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:46');
INSERT INTO `notifications` VALUES ('219', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '22', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:46');
INSERT INTO `notifications` VALUES ('220', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '16', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:46');
INSERT INTO `notifications` VALUES ('221', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '15', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:46');
INSERT INTO `notifications` VALUES ('222', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '14', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:47');
INSERT INTO `notifications` VALUES ('223', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '81', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 17:38:47');
INSERT INTO `notifications` VALUES ('224', 'You have been migrated to batch HNBTR-M-5. Click to view!', '44', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:03:58');
INSERT INTO `notifications` VALUES ('225', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '28', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:03:58');
INSERT INTO `notifications` VALUES ('226', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '21', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:03:58');
INSERT INTO `notifications` VALUES ('227', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '20', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:03:58');
INSERT INTO `notifications` VALUES ('228', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '19', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:03:58');
INSERT INTO `notifications` VALUES ('229', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '1', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '1', '2018-01-07 18:03:58');
INSERT INTO `notifications` VALUES ('230', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '51', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:03:58');
INSERT INTO `notifications` VALUES ('231', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '47', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:03:58');
INSERT INTO `notifications` VALUES ('232', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '46', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:03:59');
INSERT INTO `notifications` VALUES ('233', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '42', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:03:59');
INSERT INTO `notifications` VALUES ('234', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '41', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:03:59');
INSERT INTO `notifications` VALUES ('235', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '40', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:03:59');
INSERT INTO `notifications` VALUES ('236', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '36', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:03:59');
INSERT INTO `notifications` VALUES ('237', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '31', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:03:59');
INSERT INTO `notifications` VALUES ('238', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '27', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:03:59');
INSERT INTO `notifications` VALUES ('239', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '26', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:03:59');
INSERT INTO `notifications` VALUES ('240', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '24', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:03:59');
INSERT INTO `notifications` VALUES ('241', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '23', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:03:59');
INSERT INTO `notifications` VALUES ('242', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '22', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:03:59');
INSERT INTO `notifications` VALUES ('243', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '16', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:03:59');
INSERT INTO `notifications` VALUES ('244', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '15', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:03:59');
INSERT INTO `notifications` VALUES ('245', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '14', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:03:59');
INSERT INTO `notifications` VALUES ('246', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-M-5. Click to view!', '81', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:03:59');
INSERT INTO `notifications` VALUES ('247', 'You have been migrated to batch HNBTR-D-98. Click to view!', '44', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '1', '2018-01-07 18:04:38');
INSERT INTO `notifications` VALUES ('248', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '28', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:04:38');
INSERT INTO `notifications` VALUES ('249', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '21', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:04:38');
INSERT INTO `notifications` VALUES ('250', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '20', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:04:38');
INSERT INTO `notifications` VALUES ('251', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '19', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:04:38');
INSERT INTO `notifications` VALUES ('252', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '1', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '1', '2018-01-07 18:04:39');
INSERT INTO `notifications` VALUES ('253', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '51', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:04:39');
INSERT INTO `notifications` VALUES ('254', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '47', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:04:39');
INSERT INTO `notifications` VALUES ('255', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '46', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:04:39');
INSERT INTO `notifications` VALUES ('256', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '42', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:04:39');
INSERT INTO `notifications` VALUES ('257', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '41', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:04:39');
INSERT INTO `notifications` VALUES ('258', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '40', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:04:39');
INSERT INTO `notifications` VALUES ('259', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '36', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:04:39');
INSERT INTO `notifications` VALUES ('260', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '31', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:04:39');
INSERT INTO `notifications` VALUES ('261', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '27', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:04:39');
INSERT INTO `notifications` VALUES ('262', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '26', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:04:39');
INSERT INTO `notifications` VALUES ('263', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '24', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:04:39');
INSERT INTO `notifications` VALUES ('264', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '23', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:04:39');
INSERT INTO `notifications` VALUES ('265', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '22', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:04:39');
INSERT INTO `notifications` VALUES ('266', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '16', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:04:39');
INSERT INTO `notifications` VALUES ('267', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '15', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:04:39');
INSERT INTO `notifications` VALUES ('268', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '14', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:04:39');
INSERT INTO `notifications` VALUES ('269', 'Batch of student Peter Perker Peter Perker has been updated to batch HNBTR-D-98. Click to view!', '81', '?controller=students&action=showStudentProfile&uname=peter_parker', 'domain', 'teal', '0', '2018-01-07 18:04:39');
INSERT INTO `notifications` VALUES ('270', 'New Exam has been added to batch HNBTR-D-98, titled- &#34;try catch&#34;. Exam Date January 27 (Saturday), 2018.', '52', '?controller=students&action=showStudentPerformance&uname=geomatry', 'assignment', 'deep-orange', '1', '2018-01-10 13:50:00');
INSERT INTO `notifications` VALUES ('271', 'New Exam has been added to batch HNBTR-D-98, titled- &#34;try catch&#34;. Exam Date January 27 (Saturday), 2018.', '50', '?controller=students&action=showStudentPerformance&uname=test_linksdfdfsdfhjk', 'assignment', 'deep-orange', '0', '2018-01-10 13:50:01');
INSERT INTO `notifications` VALUES ('272', 'New Exam has been added to batch HNBTR-D-98, titled- &#34;try catch&#34;. Exam Date January 27 (Saturday), 2018.', '44', '?controller=students&action=showStudentPerformance&uname=peter_parker', 'assignment', 'deep-orange', '1', '2018-01-10 13:50:01');
INSERT INTO `notifications` VALUES ('273', 'Your score for exam &#34;Fortify&#34; has been updated! Click to view!', '52', '?controller=students&action=showStudentPerformance&uname=geomatry', 'assignment_turned_in', 'light-green', '1', '2018-01-10 13:51:03');
INSERT INTO `notifications` VALUES ('274', 'Your score for exam &#34;Fortify&#34; has been updated! Click to view!', '50', '?controller=students&action=showStudentPerformance&uname=test_linksdfdfsdfhjk', 'assignment_turned_in', 'light-green', '0', '2018-01-10 13:51:03');
INSERT INTO `notifications` VALUES ('275', 'Your score for exam &#34;Fortify&#34; has been updated! Click to view!', '44', '?controller=students&action=showStudentPerformance&uname=peter_parker', 'assignment_turned_in', 'light-green', '1', '2018-01-10 13:51:03');
INSERT INTO `notifications` VALUES ('276', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '400', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:32');
INSERT INTO `notifications` VALUES ('277', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '52', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:32');
INSERT INTO `notifications` VALUES ('278', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '51', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:32');
INSERT INTO `notifications` VALUES ('279', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '50', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:32');
INSERT INTO `notifications` VALUES ('280', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '49', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:32');
INSERT INTO `notifications` VALUES ('281', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '48', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:32');
INSERT INTO `notifications` VALUES ('282', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '47', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:32');
INSERT INTO `notifications` VALUES ('283', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '46', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:32');
INSERT INTO `notifications` VALUES ('284', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '44', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:32');
INSERT INTO `notifications` VALUES ('285', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '43', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:32');
INSERT INTO `notifications` VALUES ('286', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '42', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:33');
INSERT INTO `notifications` VALUES ('287', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '41', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:33');
INSERT INTO `notifications` VALUES ('288', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '40', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:33');
INSERT INTO `notifications` VALUES ('289', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '39', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:33');
INSERT INTO `notifications` VALUES ('290', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '38', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:33');
INSERT INTO `notifications` VALUES ('291', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '37', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:33');
INSERT INTO `notifications` VALUES ('292', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '36', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:33');
INSERT INTO `notifications` VALUES ('293', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '35', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:33');
INSERT INTO `notifications` VALUES ('294', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '34', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:33');
INSERT INTO `notifications` VALUES ('295', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '33', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:33');
INSERT INTO `notifications` VALUES ('296', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '32', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:33');
INSERT INTO `notifications` VALUES ('297', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '31', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:33');
INSERT INTO `notifications` VALUES ('298', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '30', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:33');
INSERT INTO `notifications` VALUES ('299', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '29', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:33');
INSERT INTO `notifications` VALUES ('300', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '28', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:33');
INSERT INTO `notifications` VALUES ('301', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '27', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:33');
INSERT INTO `notifications` VALUES ('302', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '26', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:33');
INSERT INTO `notifications` VALUES ('303', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '25', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:33');
INSERT INTO `notifications` VALUES ('304', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '24', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:33');
INSERT INTO `notifications` VALUES ('305', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '23', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:33');
INSERT INTO `notifications` VALUES ('306', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '22', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:33');
INSERT INTO `notifications` VALUES ('307', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '21', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:33');
INSERT INTO `notifications` VALUES ('308', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '20', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:33');
INSERT INTO `notifications` VALUES ('309', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '19', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:33');
INSERT INTO `notifications` VALUES ('310', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '16', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:33');
INSERT INTO `notifications` VALUES ('311', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '15', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:33');
INSERT INTO `notifications` VALUES ('312', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '14', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:33');
INSERT INTO `notifications` VALUES ('313', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '1', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '1', '2018-01-11 17:16:33');
INSERT INTO `notifications` VALUES ('314', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '92', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:33');
INSERT INTO `notifications` VALUES ('315', 'Now announcement has been added, titled &quot;For Notification...&quot; by Super Admin! Click to view!', '81', '?controller=notices&action=viewNotice&id=12', 'notifications_active', 'cyan', '0', '2018-01-11 17:16:33');
INSERT INTO `notifications` VALUES ('316', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '400', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:09');
INSERT INTO `notifications` VALUES ('317', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '52', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:09');
INSERT INTO `notifications` VALUES ('318', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '51', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:09');
INSERT INTO `notifications` VALUES ('319', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '50', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:09');
INSERT INTO `notifications` VALUES ('320', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '49', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:09');
INSERT INTO `notifications` VALUES ('321', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '48', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:09');
INSERT INTO `notifications` VALUES ('322', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '47', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:09');
INSERT INTO `notifications` VALUES ('323', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '46', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:09');
INSERT INTO `notifications` VALUES ('324', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '44', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:09');
INSERT INTO `notifications` VALUES ('325', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '43', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:09');
INSERT INTO `notifications` VALUES ('326', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '42', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:09');
INSERT INTO `notifications` VALUES ('327', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '41', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:09');
INSERT INTO `notifications` VALUES ('328', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '40', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:09');
INSERT INTO `notifications` VALUES ('329', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '39', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:09');
INSERT INTO `notifications` VALUES ('330', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '38', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:09');
INSERT INTO `notifications` VALUES ('331', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '37', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:09');
INSERT INTO `notifications` VALUES ('332', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '36', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:09');
INSERT INTO `notifications` VALUES ('333', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '35', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:09');
INSERT INTO `notifications` VALUES ('334', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '34', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:09');
INSERT INTO `notifications` VALUES ('335', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '33', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:09');
INSERT INTO `notifications` VALUES ('336', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '32', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:09');
INSERT INTO `notifications` VALUES ('337', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '31', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:09');
INSERT INTO `notifications` VALUES ('338', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '30', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:09');
INSERT INTO `notifications` VALUES ('339', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '29', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:10');
INSERT INTO `notifications` VALUES ('340', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '28', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:10');
INSERT INTO `notifications` VALUES ('341', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '27', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:10');
INSERT INTO `notifications` VALUES ('342', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '26', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:10');
INSERT INTO `notifications` VALUES ('343', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '25', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:10');
INSERT INTO `notifications` VALUES ('344', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '24', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:10');
INSERT INTO `notifications` VALUES ('345', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '23', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:10');
INSERT INTO `notifications` VALUES ('346', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '22', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:10');
INSERT INTO `notifications` VALUES ('347', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '21', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:10');
INSERT INTO `notifications` VALUES ('348', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '20', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:10');
INSERT INTO `notifications` VALUES ('349', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '19', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:10');
INSERT INTO `notifications` VALUES ('350', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '16', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:10');
INSERT INTO `notifications` VALUES ('351', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '15', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:10');
INSERT INTO `notifications` VALUES ('352', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '14', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:10');
INSERT INTO `notifications` VALUES ('353', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '1', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '1', '2018-01-11 17:18:10');
INSERT INTO `notifications` VALUES ('354', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '92', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:10');
INSERT INTO `notifications` VALUES ('355', '<b>Notice</b>! Titled &quot;Another For Notifica...&quot; by Mahadi Hasan Bappy! Click to view!', '81', '?controller=notices&action=viewNotice&id=13', 'notifications_active', 'cyan', '0', '2018-01-11 17:18:10');
INSERT INTO `notifications` VALUES ('356', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '400', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('357', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '52', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('358', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '51', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('359', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '50', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('360', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '49', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('361', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '48', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('362', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '47', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('363', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '46', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('364', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '44', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('365', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '43', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('366', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '42', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('367', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '41', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('368', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '40', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('369', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '39', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('370', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '38', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('371', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '37', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('372', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '36', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('373', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '35', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('374', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '34', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('375', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '33', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('376', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '32', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('377', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '31', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('378', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '30', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('379', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '29', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('380', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '28', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('381', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '27', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('382', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '26', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('383', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '25', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('384', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '24', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('385', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '23', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('386', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '22', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('387', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '21', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('388', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '20', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('389', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '19', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('390', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '16', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:40');
INSERT INTO `notifications` VALUES ('391', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '15', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:41');
INSERT INTO `notifications` VALUES ('392', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '14', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:41');
INSERT INTO `notifications` VALUES ('393', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '1', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '1', '2018-01-11 17:19:41');
INSERT INTO `notifications` VALUES ('394', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '92', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:41');
INSERT INTO `notifications` VALUES ('395', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '81', '?controller=notices&action=viewNotice&id=14', 'error', 'deep-orange', '0', '2018-01-11 17:19:41');
INSERT INTO `notifications` VALUES ('396', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '400', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:11');
INSERT INTO `notifications` VALUES ('397', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '52', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:11');
INSERT INTO `notifications` VALUES ('398', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '51', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:11');
INSERT INTO `notifications` VALUES ('399', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '50', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:11');
INSERT INTO `notifications` VALUES ('400', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '49', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:11');
INSERT INTO `notifications` VALUES ('401', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '48', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:11');
INSERT INTO `notifications` VALUES ('402', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '47', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:11');
INSERT INTO `notifications` VALUES ('403', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '46', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:11');
INSERT INTO `notifications` VALUES ('404', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '44', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:11');
INSERT INTO `notifications` VALUES ('405', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '43', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:11');
INSERT INTO `notifications` VALUES ('406', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '42', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:11');
INSERT INTO `notifications` VALUES ('407', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '41', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:11');
INSERT INTO `notifications` VALUES ('408', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '40', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:12');
INSERT INTO `notifications` VALUES ('409', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '39', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:12');
INSERT INTO `notifications` VALUES ('410', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '38', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:12');
INSERT INTO `notifications` VALUES ('411', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '37', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:12');
INSERT INTO `notifications` VALUES ('412', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '36', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:12');
INSERT INTO `notifications` VALUES ('413', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '35', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:12');
INSERT INTO `notifications` VALUES ('414', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '34', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:12');
INSERT INTO `notifications` VALUES ('415', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '33', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:12');
INSERT INTO `notifications` VALUES ('416', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '32', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:12');
INSERT INTO `notifications` VALUES ('417', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '31', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:12');
INSERT INTO `notifications` VALUES ('418', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '30', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:12');
INSERT INTO `notifications` VALUES ('419', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '29', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:12');
INSERT INTO `notifications` VALUES ('420', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '28', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:12');
INSERT INTO `notifications` VALUES ('421', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '27', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:12');
INSERT INTO `notifications` VALUES ('422', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '26', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:12');
INSERT INTO `notifications` VALUES ('423', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '25', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:12');
INSERT INTO `notifications` VALUES ('424', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '24', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:12');
INSERT INTO `notifications` VALUES ('425', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '23', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:12');
INSERT INTO `notifications` VALUES ('426', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '22', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:12');
INSERT INTO `notifications` VALUES ('427', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '21', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:12');
INSERT INTO `notifications` VALUES ('428', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '20', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:12');
INSERT INTO `notifications` VALUES ('429', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '19', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:12');
INSERT INTO `notifications` VALUES ('430', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '16', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:12');
INSERT INTO `notifications` VALUES ('431', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '15', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:12');
INSERT INTO `notifications` VALUES ('432', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '14', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:12');
INSERT INTO `notifications` VALUES ('433', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '1', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '1', '2018-01-11 17:20:13');
INSERT INTO `notifications` VALUES ('434', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '92', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:13');
INSERT INTO `notifications` VALUES ('435', '<b>Notice</b>! Titled &quot;For Alert...&quot; by Mahadi Hasan Bappy! Click to view!', '81', '?controller=notices&action=viewNotice&id=15', 'warning', 'deep-orange', '0', '2018-01-11 17:20:13');
INSERT INTO `notifications` VALUES ('436', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '400', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:29');
INSERT INTO `notifications` VALUES ('437', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '52', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:29');
INSERT INTO `notifications` VALUES ('438', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '51', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:29');
INSERT INTO `notifications` VALUES ('439', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '50', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:29');
INSERT INTO `notifications` VALUES ('440', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '49', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:29');
INSERT INTO `notifications` VALUES ('441', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '48', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:29');
INSERT INTO `notifications` VALUES ('442', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '47', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:29');
INSERT INTO `notifications` VALUES ('443', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '46', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:29');
INSERT INTO `notifications` VALUES ('444', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '44', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:29');
INSERT INTO `notifications` VALUES ('445', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '43', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:29');
INSERT INTO `notifications` VALUES ('446', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '42', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:29');
INSERT INTO `notifications` VALUES ('447', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '41', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:29');
INSERT INTO `notifications` VALUES ('448', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '40', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:29');
INSERT INTO `notifications` VALUES ('449', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '39', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:29');
INSERT INTO `notifications` VALUES ('450', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '38', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:30');
INSERT INTO `notifications` VALUES ('451', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '37', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:30');
INSERT INTO `notifications` VALUES ('452', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '36', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:30');
INSERT INTO `notifications` VALUES ('453', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '35', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:30');
INSERT INTO `notifications` VALUES ('454', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '34', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:30');
INSERT INTO `notifications` VALUES ('455', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '33', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:30');
INSERT INTO `notifications` VALUES ('456', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '32', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:30');
INSERT INTO `notifications` VALUES ('457', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '31', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:30');
INSERT INTO `notifications` VALUES ('458', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '30', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:30');
INSERT INTO `notifications` VALUES ('459', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '29', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:30');
INSERT INTO `notifications` VALUES ('460', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '28', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:30');
INSERT INTO `notifications` VALUES ('461', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '27', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:30');
INSERT INTO `notifications` VALUES ('462', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '26', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:30');
INSERT INTO `notifications` VALUES ('463', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '25', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:30');
INSERT INTO `notifications` VALUES ('464', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '24', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:30');
INSERT INTO `notifications` VALUES ('465', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '23', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:30');
INSERT INTO `notifications` VALUES ('466', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '22', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:30');
INSERT INTO `notifications` VALUES ('467', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '21', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:30');
INSERT INTO `notifications` VALUES ('468', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '20', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:30');
INSERT INTO `notifications` VALUES ('469', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '19', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:30');
INSERT INTO `notifications` VALUES ('470', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '16', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:30');
INSERT INTO `notifications` VALUES ('471', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '15', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:30');
INSERT INTO `notifications` VALUES ('472', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '14', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:30');
INSERT INTO `notifications` VALUES ('473', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '1', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '1', '2018-01-11 17:20:30');
INSERT INTO `notifications` VALUES ('474', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '92', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:30');
INSERT INTO `notifications` VALUES ('475', '<b>Notice</b>! Titled &quot;Sdfsdf...&quot; by Mahadi Hasan Bappy! Click to view!', '81', '?controller=notices&action=viewNotice&id=16', 'warning', 'orange', '0', '2018-01-11 17:20:30');
INSERT INTO `notifications` VALUES ('476', 'Notice has been updated! Click to view!', '400', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:02');
INSERT INTO `notifications` VALUES ('477', 'Notice has been updated! Click to view!', '52', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:02');
INSERT INTO `notifications` VALUES ('478', 'Notice has been updated! Click to view!', '51', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:02');
INSERT INTO `notifications` VALUES ('479', 'Notice has been updated! Click to view!', '50', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:02');
INSERT INTO `notifications` VALUES ('480', 'Notice has been updated! Click to view!', '49', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:02');
INSERT INTO `notifications` VALUES ('481', 'Notice has been updated! Click to view!', '48', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:02');
INSERT INTO `notifications` VALUES ('482', 'Notice has been updated! Click to view!', '47', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:02');
INSERT INTO `notifications` VALUES ('483', 'Notice has been updated! Click to view!', '46', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:02');
INSERT INTO `notifications` VALUES ('484', 'Notice has been updated! Click to view!', '44', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:02');
INSERT INTO `notifications` VALUES ('485', 'Notice has been updated! Click to view!', '43', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:02');
INSERT INTO `notifications` VALUES ('486', 'Notice has been updated! Click to view!', '42', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:02');
INSERT INTO `notifications` VALUES ('487', 'Notice has been updated! Click to view!', '41', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:02');
INSERT INTO `notifications` VALUES ('488', 'Notice has been updated! Click to view!', '40', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:02');
INSERT INTO `notifications` VALUES ('489', 'Notice has been updated! Click to view!', '39', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:02');
INSERT INTO `notifications` VALUES ('490', 'Notice has been updated! Click to view!', '38', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:02');
INSERT INTO `notifications` VALUES ('491', 'Notice has been updated! Click to view!', '37', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:02');
INSERT INTO `notifications` VALUES ('492', 'Notice has been updated! Click to view!', '36', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:02');
INSERT INTO `notifications` VALUES ('493', 'Notice has been updated! Click to view!', '35', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:02');
INSERT INTO `notifications` VALUES ('494', 'Notice has been updated! Click to view!', '34', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:03');
INSERT INTO `notifications` VALUES ('495', 'Notice has been updated! Click to view!', '33', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:03');
INSERT INTO `notifications` VALUES ('496', 'Notice has been updated! Click to view!', '32', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:03');
INSERT INTO `notifications` VALUES ('497', 'Notice has been updated! Click to view!', '31', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:03');
INSERT INTO `notifications` VALUES ('498', 'Notice has been updated! Click to view!', '30', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:03');
INSERT INTO `notifications` VALUES ('499', 'Notice has been updated! Click to view!', '29', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:03');
INSERT INTO `notifications` VALUES ('500', 'Notice has been updated! Click to view!', '28', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:03');
INSERT INTO `notifications` VALUES ('501', 'Notice has been updated! Click to view!', '27', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:03');
INSERT INTO `notifications` VALUES ('502', 'Notice has been updated! Click to view!', '26', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:03');
INSERT INTO `notifications` VALUES ('503', 'Notice has been updated! Click to view!', '25', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:03');
INSERT INTO `notifications` VALUES ('504', 'Notice has been updated! Click to view!', '24', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:03');
INSERT INTO `notifications` VALUES ('505', 'Notice has been updated! Click to view!', '23', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:03');
INSERT INTO `notifications` VALUES ('506', 'Notice has been updated! Click to view!', '22', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:03');
INSERT INTO `notifications` VALUES ('507', 'Notice has been updated! Click to view!', '21', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:03');
INSERT INTO `notifications` VALUES ('508', 'Notice has been updated! Click to view!', '20', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:03');
INSERT INTO `notifications` VALUES ('509', 'Notice has been updated! Click to view!', '19', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:03');
INSERT INTO `notifications` VALUES ('510', 'Notice has been updated! Click to view!', '16', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:03');
INSERT INTO `notifications` VALUES ('511', 'Notice has been updated! Click to view!', '15', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:03');
INSERT INTO `notifications` VALUES ('512', 'Notice has been updated! Click to view!', '14', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:03');
INSERT INTO `notifications` VALUES ('513', 'Notice has been updated! Click to view!', '1', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '1', '2018-01-11 17:50:03');
INSERT INTO `notifications` VALUES ('514', 'Notice has been updated! Click to view!', '92', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:03');
INSERT INTO `notifications` VALUES ('515', 'Notice has been updated! Click to view!', '81', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-11 17:50:03');
INSERT INTO `notifications` VALUES ('516', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '400', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:36');
INSERT INTO `notifications` VALUES ('517', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '52', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:36');
INSERT INTO `notifications` VALUES ('518', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '51', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:36');
INSERT INTO `notifications` VALUES ('519', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '50', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:36');
INSERT INTO `notifications` VALUES ('520', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '49', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:36');
INSERT INTO `notifications` VALUES ('521', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '48', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:36');
INSERT INTO `notifications` VALUES ('522', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '47', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:36');
INSERT INTO `notifications` VALUES ('523', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '46', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:36');
INSERT INTO `notifications` VALUES ('524', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '44', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:36');
INSERT INTO `notifications` VALUES ('525', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '43', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:36');
INSERT INTO `notifications` VALUES ('526', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '42', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:36');
INSERT INTO `notifications` VALUES ('527', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '41', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:36');
INSERT INTO `notifications` VALUES ('528', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '40', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:36');
INSERT INTO `notifications` VALUES ('529', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '39', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:36');
INSERT INTO `notifications` VALUES ('530', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '38', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:36');
INSERT INTO `notifications` VALUES ('531', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '37', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:36');
INSERT INTO `notifications` VALUES ('532', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '36', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:36');
INSERT INTO `notifications` VALUES ('533', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '35', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:36');
INSERT INTO `notifications` VALUES ('534', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '34', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:36');
INSERT INTO `notifications` VALUES ('535', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '33', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:36');
INSERT INTO `notifications` VALUES ('536', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '32', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:36');
INSERT INTO `notifications` VALUES ('537', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '31', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:37');
INSERT INTO `notifications` VALUES ('538', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '30', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:37');
INSERT INTO `notifications` VALUES ('539', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '29', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:37');
INSERT INTO `notifications` VALUES ('540', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '28', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:37');
INSERT INTO `notifications` VALUES ('541', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '27', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:37');
INSERT INTO `notifications` VALUES ('542', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '26', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:37');
INSERT INTO `notifications` VALUES ('543', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '25', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:37');
INSERT INTO `notifications` VALUES ('544', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '24', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:37');
INSERT INTO `notifications` VALUES ('545', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '23', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:37');
INSERT INTO `notifications` VALUES ('546', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '22', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:37');
INSERT INTO `notifications` VALUES ('547', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '21', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:37');
INSERT INTO `notifications` VALUES ('548', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '20', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:37');
INSERT INTO `notifications` VALUES ('549', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '19', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:37');
INSERT INTO `notifications` VALUES ('550', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '16', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:37');
INSERT INTO `notifications` VALUES ('551', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '15', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:37');
INSERT INTO `notifications` VALUES ('552', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '14', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:37');
INSERT INTO `notifications` VALUES ('553', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '1', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '1', '2018-01-11 17:54:37');
INSERT INTO `notifications` VALUES ('554', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '92', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:37');
INSERT INTO `notifications` VALUES ('555', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '81', '?controller=notices&action=viewNotice&id=17', 'warning', 'orange', '0', '2018-01-11 17:54:37');
INSERT INTO `notifications` VALUES ('556', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '400', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('557', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '52', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('558', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '51', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('559', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '50', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('560', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '49', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('561', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '48', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('562', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '47', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('563', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '46', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('564', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '44', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('565', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '43', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('566', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '42', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('567', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '41', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('568', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '40', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('569', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '39', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('570', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '38', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('571', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '37', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('572', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '36', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('573', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '35', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('574', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '34', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('575', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '33', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('576', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '32', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('577', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '31', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('578', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '30', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('579', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '29', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('580', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '28', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('581', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '27', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('582', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '26', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('583', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '25', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('584', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '24', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('585', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '23', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('586', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '22', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('587', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '21', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('588', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '20', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('589', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '19', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('590', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '16', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('591', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '15', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:47');
INSERT INTO `notifications` VALUES ('592', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '14', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:48');
INSERT INTO `notifications` VALUES ('593', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '1', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '1', '2018-01-11 17:54:48');
INSERT INTO `notifications` VALUES ('594', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '92', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:48');
INSERT INTO `notifications` VALUES ('595', 'Notice! Titled &quot;Asdasd...&quot; by Mahadi Hasan Bappy! Click to view!', '81', '?controller=notices&action=viewNotice&id=18', 'warning', 'orange', '0', '2018-01-11 17:54:48');
INSERT INTO `notifications` VALUES ('596', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '400', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:53');
INSERT INTO `notifications` VALUES ('597', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '52', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:53');
INSERT INTO `notifications` VALUES ('598', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '51', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:53');
INSERT INTO `notifications` VALUES ('599', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '50', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:53');
INSERT INTO `notifications` VALUES ('600', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '49', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:53');
INSERT INTO `notifications` VALUES ('601', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '48', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:53');
INSERT INTO `notifications` VALUES ('602', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '47', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:53');
INSERT INTO `notifications` VALUES ('603', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '46', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:53');
INSERT INTO `notifications` VALUES ('604', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '44', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:53');
INSERT INTO `notifications` VALUES ('605', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '43', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:53');
INSERT INTO `notifications` VALUES ('606', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '42', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:53');
INSERT INTO `notifications` VALUES ('607', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '41', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:53');
INSERT INTO `notifications` VALUES ('608', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '40', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:53');
INSERT INTO `notifications` VALUES ('609', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '39', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:54');
INSERT INTO `notifications` VALUES ('610', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '38', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:54');
INSERT INTO `notifications` VALUES ('611', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '37', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:54');
INSERT INTO `notifications` VALUES ('612', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '36', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:54');
INSERT INTO `notifications` VALUES ('613', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '35', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:54');
INSERT INTO `notifications` VALUES ('614', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '34', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:54');
INSERT INTO `notifications` VALUES ('615', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '33', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:54');
INSERT INTO `notifications` VALUES ('616', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '32', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:54');
INSERT INTO `notifications` VALUES ('617', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '31', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:54');
INSERT INTO `notifications` VALUES ('618', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '30', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:54');
INSERT INTO `notifications` VALUES ('619', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '29', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:54');
INSERT INTO `notifications` VALUES ('620', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '28', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:54');
INSERT INTO `notifications` VALUES ('621', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '27', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:54');
INSERT INTO `notifications` VALUES ('622', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '26', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:54');
INSERT INTO `notifications` VALUES ('623', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '25', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:54');
INSERT INTO `notifications` VALUES ('624', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '24', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:54');
INSERT INTO `notifications` VALUES ('625', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '23', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:54');
INSERT INTO `notifications` VALUES ('626', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '22', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:54');
INSERT INTO `notifications` VALUES ('627', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '21', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:54');
INSERT INTO `notifications` VALUES ('628', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '20', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:54');
INSERT INTO `notifications` VALUES ('629', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '19', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:54');
INSERT INTO `notifications` VALUES ('630', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '16', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:55');
INSERT INTO `notifications` VALUES ('631', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '15', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:55');
INSERT INTO `notifications` VALUES ('632', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '14', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:55');
INSERT INTO `notifications` VALUES ('633', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '1', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '1', '2018-01-11 17:54:55');
INSERT INTO `notifications` VALUES ('634', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '92', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:55');
INSERT INTO `notifications` VALUES ('635', 'Notice! Titled &quot;Asdasdsa...&quot; by Mahadi Hasan Bappy! Click to view!', '81', '?controller=notices&action=viewNotice&id=19', 'warning', 'orange', '0', '2018-01-11 17:54:55');
INSERT INTO `notifications` VALUES ('636', 'Notice has been updated! Click to view!', '400', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:48');
INSERT INTO `notifications` VALUES ('637', 'Notice has been updated! Click to view!', '52', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '1', '2018-01-14 16:31:49');
INSERT INTO `notifications` VALUES ('638', 'Notice has been updated! Click to view!', '51', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:49');
INSERT INTO `notifications` VALUES ('639', 'Notice has been updated! Click to view!', '50', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:49');
INSERT INTO `notifications` VALUES ('640', 'Notice has been updated! Click to view!', '49', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:49');
INSERT INTO `notifications` VALUES ('641', 'Notice has been updated! Click to view!', '48', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:49');
INSERT INTO `notifications` VALUES ('642', 'Notice has been updated! Click to view!', '47', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:49');
INSERT INTO `notifications` VALUES ('643', 'Notice has been updated! Click to view!', '46', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:49');
INSERT INTO `notifications` VALUES ('644', 'Notice has been updated! Click to view!', '44', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '1', '2018-01-14 16:31:49');
INSERT INTO `notifications` VALUES ('645', 'Notice has been updated! Click to view!', '43', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:49');
INSERT INTO `notifications` VALUES ('646', 'Notice has been updated! Click to view!', '42', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:49');
INSERT INTO `notifications` VALUES ('647', 'Notice has been updated! Click to view!', '41', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:50');
INSERT INTO `notifications` VALUES ('648', 'Notice has been updated! Click to view!', '40', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:50');
INSERT INTO `notifications` VALUES ('649', 'Notice has been updated! Click to view!', '39', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:50');
INSERT INTO `notifications` VALUES ('650', 'Notice has been updated! Click to view!', '38', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:50');
INSERT INTO `notifications` VALUES ('651', 'Notice has been updated! Click to view!', '37', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:50');
INSERT INTO `notifications` VALUES ('652', 'Notice has been updated! Click to view!', '36', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:50');
INSERT INTO `notifications` VALUES ('653', 'Notice has been updated! Click to view!', '35', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:50');
INSERT INTO `notifications` VALUES ('654', 'Notice has been updated! Click to view!', '34', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:50');
INSERT INTO `notifications` VALUES ('655', 'Notice has been updated! Click to view!', '33', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:50');
INSERT INTO `notifications` VALUES ('656', 'Notice has been updated! Click to view!', '32', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:50');
INSERT INTO `notifications` VALUES ('657', 'Notice has been updated! Click to view!', '31', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:50');
INSERT INTO `notifications` VALUES ('658', 'Notice has been updated! Click to view!', '30', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:50');
INSERT INTO `notifications` VALUES ('659', 'Notice has been updated! Click to view!', '29', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:50');
INSERT INTO `notifications` VALUES ('660', 'Notice has been updated! Click to view!', '28', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:51');
INSERT INTO `notifications` VALUES ('661', 'Notice has been updated! Click to view!', '27', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:51');
INSERT INTO `notifications` VALUES ('662', 'Notice has been updated! Click to view!', '26', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:51');
INSERT INTO `notifications` VALUES ('663', 'Notice has been updated! Click to view!', '25', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:51');
INSERT INTO `notifications` VALUES ('664', 'Notice has been updated! Click to view!', '24', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:51');
INSERT INTO `notifications` VALUES ('665', 'Notice has been updated! Click to view!', '23', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:51');
INSERT INTO `notifications` VALUES ('666', 'Notice has been updated! Click to view!', '22', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:51');
INSERT INTO `notifications` VALUES ('667', 'Notice has been updated! Click to view!', '21', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:51');
INSERT INTO `notifications` VALUES ('668', 'Notice has been updated! Click to view!', '20', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:51');
INSERT INTO `notifications` VALUES ('669', 'Notice has been updated! Click to view!', '19', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:51');
INSERT INTO `notifications` VALUES ('670', 'Notice has been updated! Click to view!', '16', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:51');
INSERT INTO `notifications` VALUES ('671', 'Notice has been updated! Click to view!', '15', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:51');
INSERT INTO `notifications` VALUES ('672', 'Notice has been updated! Click to view!', '14', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:51');
INSERT INTO `notifications` VALUES ('673', 'Notice has been updated! Click to view!', '1', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '1', '2018-01-14 16:31:51');
INSERT INTO `notifications` VALUES ('674', 'Notice has been updated! Click to view!', '92', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:51');
INSERT INTO `notifications` VALUES ('675', 'Notice has been updated! Click to view!', '81', '?controller=notices&action=viewNotice&id=13', 'warning', 'orange', '0', '2018-01-14 16:31:52');
INSERT INTO `notifications` VALUES ('676', 'New comment has been added to an announcement you follow! Click to view!', '28', '?controller=notices&action=viewComments&id=13', 'comment', 'white', '0', '2018-01-16 17:58:18');
INSERT INTO `notifications` VALUES ('677', 'New comment has been added to an announcement you follow! Click to view!', '21', '?controller=notices&action=viewComments&id=13', 'comment', 'white', '0', '2018-01-16 17:58:18');
INSERT INTO `notifications` VALUES ('678', 'New comment has been added to an announcement you follow! Click to view!', '20', '?controller=notices&action=viewComments&id=13', 'comment', 'white', '0', '2018-01-16 17:58:18');
INSERT INTO `notifications` VALUES ('679', 'New comment has been added to an announcement you follow! Click to view!', '19', '?controller=notices&action=viewComments&id=13', 'comment', 'white', '0', '2018-01-16 17:58:18');
INSERT INTO `notifications` VALUES ('680', 'New comment has been added to an announcement you follow! Click to view!', '1', '?controller=notices&action=viewComments&id=13', 'comment', 'white', '1', '2018-01-16 17:58:18');
INSERT INTO `notifications` VALUES ('681', 'New comment has been added to an announcement you follow! Click to view!', '51', '?controller=notices&action=viewComments&id=13', 'comment', 'white', '0', '2018-01-16 17:58:18');
INSERT INTO `notifications` VALUES ('682', 'New comment has been added to an announcement you follow! Click to view!', '47', '?controller=notices&action=viewComments&id=13', 'comment', 'white', '0', '2018-01-16 17:58:18');
INSERT INTO `notifications` VALUES ('683', 'New comment has been added to an announcement you follow! Click to view!', '46', '?controller=notices&action=viewComments&id=13', 'comment', 'white', '0', '2018-01-16 17:58:18');
INSERT INTO `notifications` VALUES ('684', 'New comment has been added to an announcement you follow! Click to view!', '42', '?controller=notices&action=viewComments&id=13', 'comment', 'white', '0', '2018-01-16 17:58:19');
INSERT INTO `notifications` VALUES ('685', 'New comment has been added to an announcement you follow! Click to view!', '41', '?controller=notices&action=viewComments&id=13', 'comment', 'white', '0', '2018-01-16 17:58:19');
INSERT INTO `notifications` VALUES ('686', 'New comment has been added to an announcement you follow! Click to view!', '40', '?controller=notices&action=viewComments&id=13', 'comment', 'white', '0', '2018-01-16 17:58:19');
INSERT INTO `notifications` VALUES ('687', 'New comment has been added to an announcement you follow! Click to view!', '36', '?controller=notices&action=viewComments&id=13', 'comment', 'white', '0', '2018-01-16 17:58:19');
INSERT INTO `notifications` VALUES ('688', 'New comment has been added to an announcement you follow! Click to view!', '31', '?controller=notices&action=viewComments&id=13', 'comment', 'white', '0', '2018-01-16 17:58:19');
INSERT INTO `notifications` VALUES ('689', 'New comment has been added to an announcement you follow! Click to view!', '27', '?controller=notices&action=viewComments&id=13', 'comment', 'white', '0', '2018-01-16 17:58:19');
INSERT INTO `notifications` VALUES ('690', 'New comment has been added to an announcement you follow! Click to view!', '26', '?controller=notices&action=viewComments&id=13', 'comment', 'white', '0', '2018-01-16 17:58:19');
INSERT INTO `notifications` VALUES ('691', 'New comment has been added to an announcement you follow! Click to view!', '24', '?controller=notices&action=viewComments&id=13', 'comment', 'white', '0', '2018-01-16 17:58:19');
INSERT INTO `notifications` VALUES ('692', 'New comment has been added to an announcement you follow! Click to view!', '23', '?controller=notices&action=viewComments&id=13', 'comment', 'white', '0', '2018-01-16 17:58:19');
INSERT INTO `notifications` VALUES ('693', 'New comment has been added to an announcement you follow! Click to view!', '22', '?controller=notices&action=viewComments&id=13', 'comment', 'white', '0', '2018-01-16 17:58:19');
INSERT INTO `notifications` VALUES ('694', 'New comment has been added to an announcement you follow! Click to view!', '16', '?controller=notices&action=viewComments&id=13', 'comment', 'white', '0', '2018-01-16 17:58:19');
INSERT INTO `notifications` VALUES ('695', 'New comment has been added to an announcement you follow! Click to view!', '15', '?controller=notices&action=viewComments&id=13', 'comment', 'white', '0', '2018-01-16 17:58:19');
INSERT INTO `notifications` VALUES ('696', 'New comment has been added to an announcement you follow! Click to view!', '14', '?controller=notices&action=viewComments&id=13', 'comment', 'white', '0', '2018-01-16 17:58:19');
INSERT INTO `notifications` VALUES ('697', 'New comment has been added to an announcement you follow! Click to view!', '81', '?controller=notices&action=viewComments&id=13', 'comment', 'white', '0', '2018-01-16 17:58:19');
INSERT INTO `notifications` VALUES ('698', 'New comment has been added to an announcement you follow! Click to view!', '17', '?controller=notices&action=viewComments&id=13', 'comment', 'white', '0', '2018-01-16 17:58:19');
INSERT INTO `notifications` VALUES ('699', 'New comment has been added to an announcement you follow! Click to view!', '28', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 17:59:44');
INSERT INTO `notifications` VALUES ('700', 'New comment has been added to an announcement you follow! Click to view!', '21', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 17:59:44');
INSERT INTO `notifications` VALUES ('701', 'New comment has been added to an announcement you follow! Click to view!', '20', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 17:59:44');
INSERT INTO `notifications` VALUES ('702', 'New comment has been added to an announcement you follow! Click to view!', '19', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 17:59:44');
INSERT INTO `notifications` VALUES ('703', 'New comment has been added to an announcement you follow! Click to view!', '1', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '1', '2018-01-16 17:59:45');
INSERT INTO `notifications` VALUES ('704', 'New comment has been added to an announcement you follow! Click to view!', '51', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 17:59:45');
INSERT INTO `notifications` VALUES ('705', 'New comment has been added to an announcement you follow! Click to view!', '47', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 17:59:45');
INSERT INTO `notifications` VALUES ('706', 'New comment has been added to an announcement you follow! Click to view!', '46', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 17:59:45');
INSERT INTO `notifications` VALUES ('707', 'New comment has been added to an announcement you follow! Click to view!', '42', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 17:59:45');
INSERT INTO `notifications` VALUES ('708', 'New comment has been added to an announcement you follow! Click to view!', '41', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 17:59:45');
INSERT INTO `notifications` VALUES ('709', 'New comment has been added to an announcement you follow! Click to view!', '40', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 17:59:45');
INSERT INTO `notifications` VALUES ('710', 'New comment has been added to an announcement you follow! Click to view!', '36', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 17:59:45');
INSERT INTO `notifications` VALUES ('711', 'New comment has been added to an announcement you follow! Click to view!', '31', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 17:59:45');
INSERT INTO `notifications` VALUES ('712', 'New comment has been added to an announcement you follow! Click to view!', '27', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 17:59:45');
INSERT INTO `notifications` VALUES ('713', 'New comment has been added to an announcement you follow! Click to view!', '26', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 17:59:45');
INSERT INTO `notifications` VALUES ('714', 'New comment has been added to an announcement you follow! Click to view!', '24', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 17:59:45');
INSERT INTO `notifications` VALUES ('715', 'New comment has been added to an announcement you follow! Click to view!', '23', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 17:59:45');
INSERT INTO `notifications` VALUES ('716', 'New comment has been added to an announcement you follow! Click to view!', '22', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 17:59:45');
INSERT INTO `notifications` VALUES ('717', 'New comment has been added to an announcement you follow! Click to view!', '16', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 17:59:45');
INSERT INTO `notifications` VALUES ('718', 'New comment has been added to an announcement you follow! Click to view!', '15', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 17:59:45');
INSERT INTO `notifications` VALUES ('719', 'New comment has been added to an announcement you follow! Click to view!', '14', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 17:59:45');
INSERT INTO `notifications` VALUES ('720', 'New comment has been added to an announcement you follow! Click to view!', '81', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 17:59:45');
INSERT INTO `notifications` VALUES ('721', 'New comment has been added to an announcement you follow! Click to view!', '17', '?controller=notices&action=viewComments&id=13', 'comment', 'white', '1', '2018-01-16 17:59:45');
INSERT INTO `notifications` VALUES ('722', 'New comment has been added to an announcement you follow! Click to view!', '28', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:00:19');
INSERT INTO `notifications` VALUES ('723', 'New comment has been added to an announcement you follow! Click to view!', '21', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:00:19');
INSERT INTO `notifications` VALUES ('724', 'New comment has been added to an announcement you follow! Click to view!', '20', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:00:19');
INSERT INTO `notifications` VALUES ('725', 'New comment has been added to an announcement you follow! Click to view!', '19', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:00:19');
INSERT INTO `notifications` VALUES ('726', 'New comment has been added to an announcement you follow! Click to view!', '1', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '1', '2018-01-16 18:00:19');
INSERT INTO `notifications` VALUES ('727', 'New comment has been added to an announcement you follow! Click to view!', '51', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:00:19');
INSERT INTO `notifications` VALUES ('728', 'New comment has been added to an announcement you follow! Click to view!', '47', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:00:19');
INSERT INTO `notifications` VALUES ('729', 'New comment has been added to an announcement you follow! Click to view!', '46', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:00:19');
INSERT INTO `notifications` VALUES ('730', 'New comment has been added to an announcement you follow! Click to view!', '42', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:00:19');
INSERT INTO `notifications` VALUES ('731', 'New comment has been added to an announcement you follow! Click to view!', '41', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:00:19');
INSERT INTO `notifications` VALUES ('732', 'New comment has been added to an announcement you follow! Click to view!', '40', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:00:19');
INSERT INTO `notifications` VALUES ('733', 'New comment has been added to an announcement you follow! Click to view!', '36', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:00:19');
INSERT INTO `notifications` VALUES ('734', 'New comment has been added to an announcement you follow! Click to view!', '31', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:00:19');
INSERT INTO `notifications` VALUES ('735', 'New comment has been added to an announcement you follow! Click to view!', '27', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:00:19');
INSERT INTO `notifications` VALUES ('736', 'New comment has been added to an announcement you follow! Click to view!', '26', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:00:19');
INSERT INTO `notifications` VALUES ('737', 'New comment has been added to an announcement you follow! Click to view!', '24', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:00:19');
INSERT INTO `notifications` VALUES ('738', 'New comment has been added to an announcement you follow! Click to view!', '23', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:00:19');
INSERT INTO `notifications` VALUES ('739', 'New comment has been added to an announcement you follow! Click to view!', '22', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:00:19');
INSERT INTO `notifications` VALUES ('740', 'New comment has been added to an announcement you follow! Click to view!', '16', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:00:19');
INSERT INTO `notifications` VALUES ('741', 'New comment has been added to an announcement you follow! Click to view!', '15', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:00:19');
INSERT INTO `notifications` VALUES ('742', 'New comment has been added to an announcement you follow! Click to view!', '14', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:00:19');
INSERT INTO `notifications` VALUES ('743', 'New comment has been added to an announcement you follow! Click to view!', '81', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:00:19');
INSERT INTO `notifications` VALUES ('744', 'New comment has been added to an announcement you follow! Click to view!', '28', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:07:16');
INSERT INTO `notifications` VALUES ('745', 'New comment has been added to an announcement you follow! Click to view!', '21', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:07:16');
INSERT INTO `notifications` VALUES ('746', 'New comment has been added to an announcement you follow! Click to view!', '20', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:07:16');
INSERT INTO `notifications` VALUES ('747', 'New comment has been added to an announcement you follow! Click to view!', '19', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:07:16');
INSERT INTO `notifications` VALUES ('748', 'New comment has been added to an announcement you follow! Click to view!', '1', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '1', '2018-01-16 18:07:16');
INSERT INTO `notifications` VALUES ('749', 'New comment has been added to an announcement you follow! Click to view!', '51', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:07:16');
INSERT INTO `notifications` VALUES ('750', 'New comment has been added to an announcement you follow! Click to view!', '47', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:07:16');
INSERT INTO `notifications` VALUES ('751', 'New comment has been added to an announcement you follow! Click to view!', '46', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:07:16');
INSERT INTO `notifications` VALUES ('752', 'New comment has been added to an announcement you follow! Click to view!', '42', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:07:16');
INSERT INTO `notifications` VALUES ('753', 'New comment has been added to an announcement you follow! Click to view!', '41', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:07:16');
INSERT INTO `notifications` VALUES ('754', 'New comment has been added to an announcement you follow! Click to view!', '40', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:07:16');
INSERT INTO `notifications` VALUES ('755', 'New comment has been added to an announcement you follow! Click to view!', '36', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:07:16');
INSERT INTO `notifications` VALUES ('756', 'New comment has been added to an announcement you follow! Click to view!', '31', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:07:16');
INSERT INTO `notifications` VALUES ('757', 'New comment has been added to an announcement you follow! Click to view!', '27', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:07:16');
INSERT INTO `notifications` VALUES ('758', 'New comment has been added to an announcement you follow! Click to view!', '26', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:07:16');
INSERT INTO `notifications` VALUES ('759', 'New comment has been added to an announcement you follow! Click to view!', '24', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:07:16');
INSERT INTO `notifications` VALUES ('760', 'New comment has been added to an announcement you follow! Click to view!', '23', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:07:17');
INSERT INTO `notifications` VALUES ('761', 'New comment has been added to an announcement you follow! Click to view!', '22', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:07:17');
INSERT INTO `notifications` VALUES ('762', 'New comment has been added to an announcement you follow! Click to view!', '16', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:07:17');
INSERT INTO `notifications` VALUES ('763', 'New comment has been added to an announcement you follow! Click to view!', '15', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:07:17');
INSERT INTO `notifications` VALUES ('764', 'New comment has been added to an announcement you follow! Click to view!', '14', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:07:17');
INSERT INTO `notifications` VALUES ('765', 'New comment has been added to an announcement you follow! Click to view!', '81', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:07:17');
INSERT INTO `notifications` VALUES ('766', 'New comment has been added to an announcement you follow! Click to view!', '52', '?controller=notices&action=viewComments&id=13', 'comment', 'white', '1', '2018-01-16 18:07:17');
INSERT INTO `notifications` VALUES ('767', 'New comment has been added to an announcement you follow! Click to view!', '17', '?controller=notices&action=viewComments&id=13', 'comment', 'white', '0', '2018-01-16 18:07:17');
INSERT INTO `notifications` VALUES ('768', 'New comment has been added to an announcement you follow! Click to view!', '28', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:08');
INSERT INTO `notifications` VALUES ('769', 'New comment has been added to an announcement you follow! Click to view!', '21', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:08');
INSERT INTO `notifications` VALUES ('770', 'New comment has been added to an announcement you follow! Click to view!', '20', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:08');
INSERT INTO `notifications` VALUES ('771', 'New comment has been added to an announcement you follow! Click to view!', '19', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:08');
INSERT INTO `notifications` VALUES ('772', 'New comment has been added to an announcement you follow! Click to view!', '1', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '1', '2018-01-16 18:08:08');
INSERT INTO `notifications` VALUES ('773', 'New comment has been added to an announcement you follow! Click to view!', '51', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:08');
INSERT INTO `notifications` VALUES ('774', 'New comment has been added to an announcement you follow! Click to view!', '47', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:08');
INSERT INTO `notifications` VALUES ('775', 'New comment has been added to an announcement you follow! Click to view!', '46', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:08');
INSERT INTO `notifications` VALUES ('776', 'New comment has been added to an announcement you follow! Click to view!', '42', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:08');
INSERT INTO `notifications` VALUES ('777', 'New comment has been added to an announcement you follow! Click to view!', '41', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:08');
INSERT INTO `notifications` VALUES ('778', 'New comment has been added to an announcement you follow! Click to view!', '40', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:08');
INSERT INTO `notifications` VALUES ('779', 'New comment has been added to an announcement you follow! Click to view!', '36', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:08');
INSERT INTO `notifications` VALUES ('780', 'New comment has been added to an announcement you follow! Click to view!', '31', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:08');
INSERT INTO `notifications` VALUES ('781', 'New comment has been added to an announcement you follow! Click to view!', '27', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:08');
INSERT INTO `notifications` VALUES ('782', 'New comment has been added to an announcement you follow! Click to view!', '26', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:08');
INSERT INTO `notifications` VALUES ('783', 'New comment has been added to an announcement you follow! Click to view!', '24', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:08');
INSERT INTO `notifications` VALUES ('784', 'New comment has been added to an announcement you follow! Click to view!', '23', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:08');
INSERT INTO `notifications` VALUES ('785', 'New comment has been added to an announcement you follow! Click to view!', '22', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:08');
INSERT INTO `notifications` VALUES ('786', 'New comment has been added to an announcement you follow! Click to view!', '16', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:08');
INSERT INTO `notifications` VALUES ('787', 'New comment has been added to an announcement you follow! Click to view!', '15', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:08');
INSERT INTO `notifications` VALUES ('788', 'New comment has been added to an announcement you follow! Click to view!', '14', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:08');
INSERT INTO `notifications` VALUES ('789', 'New comment has been added to an announcement you follow! Click to view!', '81', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:09');
INSERT INTO `notifications` VALUES ('790', 'New comment has been added to an announcement you follow! Click to view!', '52', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '1', '2018-01-16 18:08:09');
INSERT INTO `notifications` VALUES ('791', 'New comment has been added to an announcement you follow! Click to view!', '17', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:09');
INSERT INTO `notifications` VALUES ('792', 'New comment has been added to an announcement you follow! Click to view!', '28', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:40');
INSERT INTO `notifications` VALUES ('793', 'New comment has been added to an announcement you follow! Click to view!', '21', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:40');
INSERT INTO `notifications` VALUES ('794', 'New comment has been added to an announcement you follow! Click to view!', '20', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:40');
INSERT INTO `notifications` VALUES ('795', 'New comment has been added to an announcement you follow! Click to view!', '19', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:40');
INSERT INTO `notifications` VALUES ('796', 'New comment has been added to an announcement you follow! Click to view!', '1', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '1', '2018-01-16 18:08:40');
INSERT INTO `notifications` VALUES ('797', 'New comment has been added to an announcement you follow! Click to view!', '51', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:40');
INSERT INTO `notifications` VALUES ('798', 'New comment has been added to an announcement you follow! Click to view!', '47', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:40');
INSERT INTO `notifications` VALUES ('799', 'New comment has been added to an announcement you follow! Click to view!', '46', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:40');
INSERT INTO `notifications` VALUES ('800', 'New comment has been added to an announcement you follow! Click to view!', '42', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:40');
INSERT INTO `notifications` VALUES ('801', 'New comment has been added to an announcement you follow! Click to view!', '41', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:40');
INSERT INTO `notifications` VALUES ('802', 'New comment has been added to an announcement you follow! Click to view!', '40', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:40');
INSERT INTO `notifications` VALUES ('803', 'New comment has been added to an announcement you follow! Click to view!', '36', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:40');
INSERT INTO `notifications` VALUES ('804', 'New comment has been added to an announcement you follow! Click to view!', '31', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:40');
INSERT INTO `notifications` VALUES ('805', 'New comment has been added to an announcement you follow! Click to view!', '27', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:40');
INSERT INTO `notifications` VALUES ('806', 'New comment has been added to an announcement you follow! Click to view!', '26', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:40');
INSERT INTO `notifications` VALUES ('807', 'New comment has been added to an announcement you follow! Click to view!', '24', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:40');
INSERT INTO `notifications` VALUES ('808', 'New comment has been added to an announcement you follow! Click to view!', '23', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:40');
INSERT INTO `notifications` VALUES ('809', 'New comment has been added to an announcement you follow! Click to view!', '22', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:40');
INSERT INTO `notifications` VALUES ('810', 'New comment has been added to an announcement you follow! Click to view!', '16', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:40');
INSERT INTO `notifications` VALUES ('811', 'New comment has been added to an announcement you follow! Click to view!', '15', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:40');
INSERT INTO `notifications` VALUES ('812', 'New comment has been added to an announcement you follow! Click to view!', '14', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:40');
INSERT INTO `notifications` VALUES ('813', 'New comment has been added to an announcement you follow! Click to view!', '81', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:40');
INSERT INTO `notifications` VALUES ('814', 'New comment has been added to an announcement you follow! Click to view!', '44', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:40');
INSERT INTO `notifications` VALUES ('815', 'New comment has been added to an announcement you follow! Click to view!', '17', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:08:40');
INSERT INTO `notifications` VALUES ('816', 'A user has updated his comment in an announcement! Click to view!', '28', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:09:35');
INSERT INTO `notifications` VALUES ('817', 'A user has updated his comment in an announcement! Click to view!', '21', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:09:35');
INSERT INTO `notifications` VALUES ('818', 'A user has updated his comment in an announcement! Click to view!', '20', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:09:35');
INSERT INTO `notifications` VALUES ('819', 'A user has updated his comment in an announcement! Click to view!', '19', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:09:36');
INSERT INTO `notifications` VALUES ('820', 'A user has updated his comment in an announcement! Click to view!', '1', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '1', '2018-01-16 18:09:36');
INSERT INTO `notifications` VALUES ('821', 'A user has updated his comment in an announcement! Click to view!', '51', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:09:36');
INSERT INTO `notifications` VALUES ('822', 'A user has updated his comment in an announcement! Click to view!', '47', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:09:36');
INSERT INTO `notifications` VALUES ('823', 'A user has updated his comment in an announcement! Click to view!', '46', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:09:36');
INSERT INTO `notifications` VALUES ('824', 'A user has updated his comment in an announcement! Click to view!', '42', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:09:36');
INSERT INTO `notifications` VALUES ('825', 'A user has updated his comment in an announcement! Click to view!', '41', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:09:36');
INSERT INTO `notifications` VALUES ('826', 'A user has updated his comment in an announcement! Click to view!', '40', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:09:36');
INSERT INTO `notifications` VALUES ('827', 'A user has updated his comment in an announcement! Click to view!', '36', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:09:36');
INSERT INTO `notifications` VALUES ('828', 'A user has updated his comment in an announcement! Click to view!', '31', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:09:36');
INSERT INTO `notifications` VALUES ('829', 'A user has updated his comment in an announcement! Click to view!', '27', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:09:36');
INSERT INTO `notifications` VALUES ('830', 'A user has updated his comment in an announcement! Click to view!', '26', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:09:36');
INSERT INTO `notifications` VALUES ('831', 'A user has updated his comment in an announcement! Click to view!', '24', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:09:36');
INSERT INTO `notifications` VALUES ('832', 'A user has updated his comment in an announcement! Click to view!', '23', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:09:36');
INSERT INTO `notifications` VALUES ('833', 'A user has updated his comment in an announcement! Click to view!', '22', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:09:36');
INSERT INTO `notifications` VALUES ('834', 'A user has updated his comment in an announcement! Click to view!', '16', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:09:36');
INSERT INTO `notifications` VALUES ('835', 'A user has updated his comment in an announcement! Click to view!', '15', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:09:36');
INSERT INTO `notifications` VALUES ('836', 'A user has updated his comment in an announcement! Click to view!', '14', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:09:36');
INSERT INTO `notifications` VALUES ('837', 'A user has updated his comment in an announcement! Click to view!', '81', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-16 18:09:36');
INSERT INTO `notifications` VALUES ('838', 'New comment has been added to an announcement you follow! Click to view!', '28', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:36:29');
INSERT INTO `notifications` VALUES ('839', 'New comment has been added to an announcement you follow! Click to view!', '21', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:36:29');
INSERT INTO `notifications` VALUES ('840', 'New comment has been added to an announcement you follow! Click to view!', '20', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:36:29');
INSERT INTO `notifications` VALUES ('841', 'New comment has been added to an announcement you follow! Click to view!', '19', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:36:29');
INSERT INTO `notifications` VALUES ('842', 'New comment has been added to an announcement you follow! Click to view!', '1', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '1', '2018-01-17 12:36:29');
INSERT INTO `notifications` VALUES ('843', 'New comment has been added to an announcement you follow! Click to view!', '51', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:36:29');
INSERT INTO `notifications` VALUES ('844', 'New comment has been added to an announcement you follow! Click to view!', '47', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:36:30');
INSERT INTO `notifications` VALUES ('845', 'New comment has been added to an announcement you follow! Click to view!', '46', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:36:30');
INSERT INTO `notifications` VALUES ('846', 'New comment has been added to an announcement you follow! Click to view!', '42', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:36:30');
INSERT INTO `notifications` VALUES ('847', 'New comment has been added to an announcement you follow! Click to view!', '41', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:36:30');
INSERT INTO `notifications` VALUES ('848', 'New comment has been added to an announcement you follow! Click to view!', '40', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:36:30');
INSERT INTO `notifications` VALUES ('849', 'New comment has been added to an announcement you follow! Click to view!', '36', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:36:30');
INSERT INTO `notifications` VALUES ('850', 'New comment has been added to an announcement you follow! Click to view!', '31', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:36:30');
INSERT INTO `notifications` VALUES ('851', 'New comment has been added to an announcement you follow! Click to view!', '27', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:36:30');
INSERT INTO `notifications` VALUES ('852', 'New comment has been added to an announcement you follow! Click to view!', '26', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:36:30');
INSERT INTO `notifications` VALUES ('853', 'New comment has been added to an announcement you follow! Click to view!', '24', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:36:30');
INSERT INTO `notifications` VALUES ('854', 'New comment has been added to an announcement you follow! Click to view!', '23', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:36:30');
INSERT INTO `notifications` VALUES ('855', 'New comment has been added to an announcement you follow! Click to view!', '22', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:36:30');
INSERT INTO `notifications` VALUES ('856', 'New comment has been added to an announcement you follow! Click to view!', '16', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:36:30');
INSERT INTO `notifications` VALUES ('857', 'New comment has been added to an announcement you follow! Click to view!', '15', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:36:30');
INSERT INTO `notifications` VALUES ('858', 'New comment has been added to an announcement you follow! Click to view!', '14', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:36:30');
INSERT INTO `notifications` VALUES ('859', 'New comment has been added to an announcement you follow! Click to view!', '81', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:36:30');
INSERT INTO `notifications` VALUES ('860', 'New comment has been added to an announcement you follow! Click to view!', '44', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:36:30');
INSERT INTO `notifications` VALUES ('861', 'New comment has been added to an announcement you follow! Click to view!', '52', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:36:30');
INSERT INTO `notifications` VALUES ('862', 'New comment has been added to an announcement you follow! Click to view!', '28', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:43:38');
INSERT INTO `notifications` VALUES ('863', 'New comment has been added to an announcement you follow! Click to view!', '21', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:43:38');
INSERT INTO `notifications` VALUES ('864', 'New comment has been added to an announcement you follow! Click to view!', '20', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:43:38');
INSERT INTO `notifications` VALUES ('865', 'New comment has been added to an announcement you follow! Click to view!', '19', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:43:38');
INSERT INTO `notifications` VALUES ('866', 'New comment has been added to an announcement you follow! Click to view!', '1', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '1', '2018-01-17 12:43:38');
INSERT INTO `notifications` VALUES ('867', 'New comment has been added to an announcement you follow! Click to view!', '51', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:43:38');
INSERT INTO `notifications` VALUES ('868', 'New comment has been added to an announcement you follow! Click to view!', '47', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:43:38');
INSERT INTO `notifications` VALUES ('869', 'New comment has been added to an announcement you follow! Click to view!', '46', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:43:38');
INSERT INTO `notifications` VALUES ('870', 'New comment has been added to an announcement you follow! Click to view!', '42', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:43:38');
INSERT INTO `notifications` VALUES ('871', 'New comment has been added to an announcement you follow! Click to view!', '41', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:43:38');
INSERT INTO `notifications` VALUES ('872', 'New comment has been added to an announcement you follow! Click to view!', '40', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:43:39');
INSERT INTO `notifications` VALUES ('873', 'New comment has been added to an announcement you follow! Click to view!', '36', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:43:39');
INSERT INTO `notifications` VALUES ('874', 'New comment has been added to an announcement you follow! Click to view!', '31', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:43:39');
INSERT INTO `notifications` VALUES ('875', 'New comment has been added to an announcement you follow! Click to view!', '27', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:43:39');
INSERT INTO `notifications` VALUES ('876', 'New comment has been added to an announcement you follow! Click to view!', '26', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:43:39');
INSERT INTO `notifications` VALUES ('877', 'New comment has been added to an announcement you follow! Click to view!', '24', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:43:39');
INSERT INTO `notifications` VALUES ('878', 'New comment has been added to an announcement you follow! Click to view!', '23', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:43:39');
INSERT INTO `notifications` VALUES ('879', 'New comment has been added to an announcement you follow! Click to view!', '22', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:43:39');
INSERT INTO `notifications` VALUES ('880', 'New comment has been added to an announcement you follow! Click to view!', '16', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:43:39');
INSERT INTO `notifications` VALUES ('881', 'New comment has been added to an announcement you follow! Click to view!', '15', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:43:39');
INSERT INTO `notifications` VALUES ('882', 'New comment has been added to an announcement you follow! Click to view!', '14', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:43:39');
INSERT INTO `notifications` VALUES ('883', 'New comment has been added to an announcement you follow! Click to view!', '81', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:43:39');
INSERT INTO `notifications` VALUES ('884', 'New comment has been added to an announcement you follow! Click to view!', '44', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:43:39');
INSERT INTO `notifications` VALUES ('885', 'New comment has been added to an announcement you follow! Click to view!', '52', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-17 12:43:39');
INSERT INTO `notifications` VALUES ('886', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '400', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:55');
INSERT INTO `notifications` VALUES ('887', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '52', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:55');
INSERT INTO `notifications` VALUES ('888', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '51', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:55');
INSERT INTO `notifications` VALUES ('889', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '50', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:55');
INSERT INTO `notifications` VALUES ('890', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '49', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:55');
INSERT INTO `notifications` VALUES ('891', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '48', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:55');
INSERT INTO `notifications` VALUES ('892', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '47', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:55');
INSERT INTO `notifications` VALUES ('893', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '46', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:55');
INSERT INTO `notifications` VALUES ('894', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '44', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:55');
INSERT INTO `notifications` VALUES ('895', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '43', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:55');
INSERT INTO `notifications` VALUES ('896', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '42', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:55');
INSERT INTO `notifications` VALUES ('897', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '41', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:55');
INSERT INTO `notifications` VALUES ('898', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '40', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:55');
INSERT INTO `notifications` VALUES ('899', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '39', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:55');
INSERT INTO `notifications` VALUES ('900', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '38', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:56');
INSERT INTO `notifications` VALUES ('901', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '37', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:56');
INSERT INTO `notifications` VALUES ('902', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '36', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:56');
INSERT INTO `notifications` VALUES ('903', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '35', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:56');
INSERT INTO `notifications` VALUES ('904', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '34', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:56');
INSERT INTO `notifications` VALUES ('905', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '33', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:56');
INSERT INTO `notifications` VALUES ('906', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '32', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:56');
INSERT INTO `notifications` VALUES ('907', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '31', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:56');
INSERT INTO `notifications` VALUES ('908', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '30', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:56');
INSERT INTO `notifications` VALUES ('909', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '29', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:56');
INSERT INTO `notifications` VALUES ('910', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '28', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:56');
INSERT INTO `notifications` VALUES ('911', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '27', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:56');
INSERT INTO `notifications` VALUES ('912', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '26', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:56');
INSERT INTO `notifications` VALUES ('913', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '25', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:56');
INSERT INTO `notifications` VALUES ('914', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '24', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:56');
INSERT INTO `notifications` VALUES ('915', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '23', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:56');
INSERT INTO `notifications` VALUES ('916', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '22', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:56');
INSERT INTO `notifications` VALUES ('917', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '21', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:56');
INSERT INTO `notifications` VALUES ('918', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '20', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:56');
INSERT INTO `notifications` VALUES ('919', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '19', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:56');
INSERT INTO `notifications` VALUES ('920', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '16', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:56');
INSERT INTO `notifications` VALUES ('921', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '15', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:56');
INSERT INTO `notifications` VALUES ('922', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '14', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:56');
INSERT INTO `notifications` VALUES ('923', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '1', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '1', '2018-01-17 12:58:56');
INSERT INTO `notifications` VALUES ('924', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '92', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:56');
INSERT INTO `notifications` VALUES ('925', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '81', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 12:58:56');
INSERT INTO `notifications` VALUES ('926', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '400', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:31');
INSERT INTO `notifications` VALUES ('927', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '52', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:31');
INSERT INTO `notifications` VALUES ('928', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '51', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:31');
INSERT INTO `notifications` VALUES ('929', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '50', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:31');
INSERT INTO `notifications` VALUES ('930', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '49', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:31');
INSERT INTO `notifications` VALUES ('931', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '48', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:31');
INSERT INTO `notifications` VALUES ('932', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '47', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:31');
INSERT INTO `notifications` VALUES ('933', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '46', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:32');
INSERT INTO `notifications` VALUES ('934', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '44', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:32');
INSERT INTO `notifications` VALUES ('935', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '43', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:32');
INSERT INTO `notifications` VALUES ('936', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '42', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:32');
INSERT INTO `notifications` VALUES ('937', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '41', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:32');
INSERT INTO `notifications` VALUES ('938', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '40', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:32');
INSERT INTO `notifications` VALUES ('939', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '39', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:32');
INSERT INTO `notifications` VALUES ('940', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '38', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:32');
INSERT INTO `notifications` VALUES ('941', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '37', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:32');
INSERT INTO `notifications` VALUES ('942', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '36', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:32');
INSERT INTO `notifications` VALUES ('943', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '35', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:32');
INSERT INTO `notifications` VALUES ('944', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '34', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:32');
INSERT INTO `notifications` VALUES ('945', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '33', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:32');
INSERT INTO `notifications` VALUES ('946', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '32', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:32');
INSERT INTO `notifications` VALUES ('947', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '31', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:32');
INSERT INTO `notifications` VALUES ('948', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '30', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:32');
INSERT INTO `notifications` VALUES ('949', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '29', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:32');
INSERT INTO `notifications` VALUES ('950', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '28', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:32');
INSERT INTO `notifications` VALUES ('951', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '27', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:32');
INSERT INTO `notifications` VALUES ('952', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '26', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:32');
INSERT INTO `notifications` VALUES ('953', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '25', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:32');
INSERT INTO `notifications` VALUES ('954', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '24', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:32');
INSERT INTO `notifications` VALUES ('955', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '23', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:32');
INSERT INTO `notifications` VALUES ('956', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '22', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:32');
INSERT INTO `notifications` VALUES ('957', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '21', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:32');
INSERT INTO `notifications` VALUES ('958', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '20', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:32');
INSERT INTO `notifications` VALUES ('959', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '19', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:32');
INSERT INTO `notifications` VALUES ('960', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '16', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:32');
INSERT INTO `notifications` VALUES ('961', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '15', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:32');
INSERT INTO `notifications` VALUES ('962', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '14', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:32');
INSERT INTO `notifications` VALUES ('963', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '1', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '1', '2018-01-17 17:02:32');
INSERT INTO `notifications` VALUES ('964', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '81', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:32');
INSERT INTO `notifications` VALUES ('965', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '92', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:02:32');
INSERT INTO `notifications` VALUES ('966', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '400', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:55');
INSERT INTO `notifications` VALUES ('967', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '52', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:55');
INSERT INTO `notifications` VALUES ('968', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '51', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:55');
INSERT INTO `notifications` VALUES ('969', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '50', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:55');
INSERT INTO `notifications` VALUES ('970', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '49', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:55');
INSERT INTO `notifications` VALUES ('971', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '48', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:55');
INSERT INTO `notifications` VALUES ('972', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '47', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:55');
INSERT INTO `notifications` VALUES ('973', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '46', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:55');
INSERT INTO `notifications` VALUES ('974', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '44', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:55');
INSERT INTO `notifications` VALUES ('975', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '43', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:55');
INSERT INTO `notifications` VALUES ('976', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '42', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:55');
INSERT INTO `notifications` VALUES ('977', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '41', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:55');
INSERT INTO `notifications` VALUES ('978', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '40', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:55');
INSERT INTO `notifications` VALUES ('979', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '39', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:55');
INSERT INTO `notifications` VALUES ('980', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '38', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:55');
INSERT INTO `notifications` VALUES ('981', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '37', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:55');
INSERT INTO `notifications` VALUES ('982', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '36', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:55');
INSERT INTO `notifications` VALUES ('983', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '35', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:55');
INSERT INTO `notifications` VALUES ('984', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '34', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:55');
INSERT INTO `notifications` VALUES ('985', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '33', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:55');
INSERT INTO `notifications` VALUES ('986', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '32', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:56');
INSERT INTO `notifications` VALUES ('987', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '31', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:56');
INSERT INTO `notifications` VALUES ('988', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '30', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:56');
INSERT INTO `notifications` VALUES ('989', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '29', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:56');
INSERT INTO `notifications` VALUES ('990', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '28', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:56');
INSERT INTO `notifications` VALUES ('991', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '27', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:56');
INSERT INTO `notifications` VALUES ('992', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '26', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:56');
INSERT INTO `notifications` VALUES ('993', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '25', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:56');
INSERT INTO `notifications` VALUES ('994', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '24', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:56');
INSERT INTO `notifications` VALUES ('995', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '23', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:56');
INSERT INTO `notifications` VALUES ('996', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '22', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:56');
INSERT INTO `notifications` VALUES ('997', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '21', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:56');
INSERT INTO `notifications` VALUES ('998', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '20', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:56');
INSERT INTO `notifications` VALUES ('999', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '19', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:56');
INSERT INTO `notifications` VALUES ('1000', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '16', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:56');
INSERT INTO `notifications` VALUES ('1001', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '15', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:56');
INSERT INTO `notifications` VALUES ('1002', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '14', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:56');
INSERT INTO `notifications` VALUES ('1003', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '1', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '1', '2018-01-17 17:32:56');
INSERT INTO `notifications` VALUES ('1004', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '81', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:56');
INSERT INTO `notifications` VALUES ('1005', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '92', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-17 17:32:56');
INSERT INTO `notifications` VALUES ('1006', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '400', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:15');
INSERT INTO `notifications` VALUES ('1007', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '52', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:15');
INSERT INTO `notifications` VALUES ('1008', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '51', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:15');
INSERT INTO `notifications` VALUES ('1009', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '50', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:15');
INSERT INTO `notifications` VALUES ('1010', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '49', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:15');
INSERT INTO `notifications` VALUES ('1011', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '48', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:15');
INSERT INTO `notifications` VALUES ('1012', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '47', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:15');
INSERT INTO `notifications` VALUES ('1013', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '46', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:16');
INSERT INTO `notifications` VALUES ('1014', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '44', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:16');
INSERT INTO `notifications` VALUES ('1015', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '43', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:16');
INSERT INTO `notifications` VALUES ('1016', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '42', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:16');
INSERT INTO `notifications` VALUES ('1017', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '41', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:16');
INSERT INTO `notifications` VALUES ('1018', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '40', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:16');
INSERT INTO `notifications` VALUES ('1019', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '39', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:16');
INSERT INTO `notifications` VALUES ('1020', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '38', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:16');
INSERT INTO `notifications` VALUES ('1021', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '37', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:16');
INSERT INTO `notifications` VALUES ('1022', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '36', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:16');
INSERT INTO `notifications` VALUES ('1023', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '35', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:16');
INSERT INTO `notifications` VALUES ('1024', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '34', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:16');
INSERT INTO `notifications` VALUES ('1025', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '33', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:16');
INSERT INTO `notifications` VALUES ('1026', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '32', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:16');
INSERT INTO `notifications` VALUES ('1027', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '31', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:16');
INSERT INTO `notifications` VALUES ('1028', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '30', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:17');
INSERT INTO `notifications` VALUES ('1029', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '29', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:17');
INSERT INTO `notifications` VALUES ('1030', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '28', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:17');
INSERT INTO `notifications` VALUES ('1031', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '27', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:17');
INSERT INTO `notifications` VALUES ('1032', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '26', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:17');
INSERT INTO `notifications` VALUES ('1033', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '25', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:17');
INSERT INTO `notifications` VALUES ('1034', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '24', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:17');
INSERT INTO `notifications` VALUES ('1035', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '23', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:17');
INSERT INTO `notifications` VALUES ('1036', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '22', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:17');
INSERT INTO `notifications` VALUES ('1037', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '21', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:17');
INSERT INTO `notifications` VALUES ('1038', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '20', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:17');
INSERT INTO `notifications` VALUES ('1039', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '19', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:17');
INSERT INTO `notifications` VALUES ('1040', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '16', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:17');
INSERT INTO `notifications` VALUES ('1041', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '15', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:17');
INSERT INTO `notifications` VALUES ('1042', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '14', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:17');
INSERT INTO `notifications` VALUES ('1043', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '1', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '1', '2018-01-18 14:14:17');
INSERT INTO `notifications` VALUES ('1044', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '92', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:17');
INSERT INTO `notifications` VALUES ('1045', 'Notice! Titled &quot;Asdasd...&quot; by Super Admin! Click to view!', '81', '?controller=notices&action=viewNotice&id=20', 'warning', 'orange', '0', '2018-01-18 14:14:17');
INSERT INTO `notifications` VALUES ('1046', 'A user has updated his comment in an announcement! Click to view!', '28', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:43:00');
INSERT INTO `notifications` VALUES ('1047', 'A user has updated his comment in an announcement! Click to view!', '21', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:43:00');
INSERT INTO `notifications` VALUES ('1048', 'A user has updated his comment in an announcement! Click to view!', '20', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:43:00');
INSERT INTO `notifications` VALUES ('1049', 'A user has updated his comment in an announcement! Click to view!', '19', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:43:00');
INSERT INTO `notifications` VALUES ('1050', 'A user has updated his comment in an announcement! Click to view!', '1', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '1', '2018-01-18 16:43:00');
INSERT INTO `notifications` VALUES ('1051', 'A user has updated his comment in an announcement! Click to view!', '51', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:43:01');
INSERT INTO `notifications` VALUES ('1052', 'A user has updated his comment in an announcement! Click to view!', '47', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:43:01');
INSERT INTO `notifications` VALUES ('1053', 'A user has updated his comment in an announcement! Click to view!', '46', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:43:01');
INSERT INTO `notifications` VALUES ('1054', 'A user has updated his comment in an announcement! Click to view!', '42', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:43:01');
INSERT INTO `notifications` VALUES ('1055', 'A user has updated his comment in an announcement! Click to view!', '41', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:43:01');
INSERT INTO `notifications` VALUES ('1056', 'A user has updated his comment in an announcement! Click to view!', '40', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:43:01');
INSERT INTO `notifications` VALUES ('1057', 'A user has updated his comment in an announcement! Click to view!', '36', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:43:01');
INSERT INTO `notifications` VALUES ('1058', 'A user has updated his comment in an announcement! Click to view!', '31', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:43:01');
INSERT INTO `notifications` VALUES ('1059', 'A user has updated his comment in an announcement! Click to view!', '27', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:43:01');
INSERT INTO `notifications` VALUES ('1060', 'A user has updated his comment in an announcement! Click to view!', '26', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:43:01');
INSERT INTO `notifications` VALUES ('1061', 'A user has updated his comment in an announcement! Click to view!', '24', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:43:01');
INSERT INTO `notifications` VALUES ('1062', 'A user has updated his comment in an announcement! Click to view!', '23', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:43:01');
INSERT INTO `notifications` VALUES ('1063', 'A user has updated his comment in an announcement! Click to view!', '22', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:43:01');
INSERT INTO `notifications` VALUES ('1064', 'A user has updated his comment in an announcement! Click to view!', '16', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:43:01');
INSERT INTO `notifications` VALUES ('1065', 'A user has updated his comment in an announcement! Click to view!', '15', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:43:01');
INSERT INTO `notifications` VALUES ('1066', 'A user has updated his comment in an announcement! Click to view!', '14', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:43:01');
INSERT INTO `notifications` VALUES ('1067', 'A user has updated his comment in an announcement! Click to view!', '81', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:43:01');
INSERT INTO `notifications` VALUES ('1068', 'A user has updated his comment in an announcement! Click to view!', '28', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:45:15');
INSERT INTO `notifications` VALUES ('1069', 'A user has updated his comment in an announcement! Click to view!', '21', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:45:15');
INSERT INTO `notifications` VALUES ('1070', 'A user has updated his comment in an announcement! Click to view!', '20', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:45:15');
INSERT INTO `notifications` VALUES ('1071', 'A user has updated his comment in an announcement! Click to view!', '19', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:45:15');
INSERT INTO `notifications` VALUES ('1072', 'A user has updated his comment in an announcement! Click to view!', '1', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '1', '2018-01-18 16:45:15');
INSERT INTO `notifications` VALUES ('1073', 'A user has updated his comment in an announcement! Click to view!', '51', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:45:15');
INSERT INTO `notifications` VALUES ('1074', 'A user has updated his comment in an announcement! Click to view!', '47', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:45:15');
INSERT INTO `notifications` VALUES ('1075', 'A user has updated his comment in an announcement! Click to view!', '46', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:45:15');
INSERT INTO `notifications` VALUES ('1076', 'A user has updated his comment in an announcement! Click to view!', '42', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:45:15');
INSERT INTO `notifications` VALUES ('1077', 'A user has updated his comment in an announcement! Click to view!', '41', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:45:15');
INSERT INTO `notifications` VALUES ('1078', 'A user has updated his comment in an announcement! Click to view!', '40', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:45:15');
INSERT INTO `notifications` VALUES ('1079', 'A user has updated his comment in an announcement! Click to view!', '36', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:45:15');
INSERT INTO `notifications` VALUES ('1080', 'A user has updated his comment in an announcement! Click to view!', '31', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:45:15');
INSERT INTO `notifications` VALUES ('1081', 'A user has updated his comment in an announcement! Click to view!', '27', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:45:15');
INSERT INTO `notifications` VALUES ('1082', 'A user has updated his comment in an announcement! Click to view!', '26', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:45:15');
INSERT INTO `notifications` VALUES ('1083', 'A user has updated his comment in an announcement! Click to view!', '24', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:45:15');
INSERT INTO `notifications` VALUES ('1084', 'A user has updated his comment in an announcement! Click to view!', '23', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:45:15');
INSERT INTO `notifications` VALUES ('1085', 'A user has updated his comment in an announcement! Click to view!', '22', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:45:15');
INSERT INTO `notifications` VALUES ('1086', 'A user has updated his comment in an announcement! Click to view!', '16', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:45:15');
INSERT INTO `notifications` VALUES ('1087', 'A user has updated his comment in an announcement! Click to view!', '15', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:45:15');
INSERT INTO `notifications` VALUES ('1088', 'A user has updated his comment in an announcement! Click to view!', '14', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:45:15');
INSERT INTO `notifications` VALUES ('1089', 'A user has updated his comment in an announcement! Click to view!', '81', '?controller=notices&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 16:45:15');
INSERT INTO `notifications` VALUES ('1090', 'New comment has been added to an announcement you follow! Click to view!', '28', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:12');
INSERT INTO `notifications` VALUES ('1091', 'New comment has been added to an announcement you follow! Click to view!', '21', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:12');
INSERT INTO `notifications` VALUES ('1092', 'New comment has been added to an announcement you follow! Click to view!', '20', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:12');
INSERT INTO `notifications` VALUES ('1093', 'New comment has been added to an announcement you follow! Click to view!', '19', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:12');
INSERT INTO `notifications` VALUES ('1094', 'New comment has been added to an announcement you follow! Click to view!', '1', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '1', '2018-01-18 17:10:12');
INSERT INTO `notifications` VALUES ('1095', 'New comment has been added to an announcement you follow! Click to view!', '51', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:12');
INSERT INTO `notifications` VALUES ('1096', 'New comment has been added to an announcement you follow! Click to view!', '47', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:12');
INSERT INTO `notifications` VALUES ('1097', 'New comment has been added to an announcement you follow! Click to view!', '46', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:12');
INSERT INTO `notifications` VALUES ('1098', 'New comment has been added to an announcement you follow! Click to view!', '42', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:12');
INSERT INTO `notifications` VALUES ('1099', 'New comment has been added to an announcement you follow! Click to view!', '41', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:12');
INSERT INTO `notifications` VALUES ('1100', 'New comment has been added to an announcement you follow! Click to view!', '40', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:12');
INSERT INTO `notifications` VALUES ('1101', 'New comment has been added to an announcement you follow! Click to view!', '36', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:12');
INSERT INTO `notifications` VALUES ('1102', 'New comment has been added to an announcement you follow! Click to view!', '31', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:12');
INSERT INTO `notifications` VALUES ('1103', 'New comment has been added to an announcement you follow! Click to view!', '27', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:12');
INSERT INTO `notifications` VALUES ('1104', 'New comment has been added to an announcement you follow! Click to view!', '26', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:13');
INSERT INTO `notifications` VALUES ('1105', 'New comment has been added to an announcement you follow! Click to view!', '24', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:13');
INSERT INTO `notifications` VALUES ('1106', 'New comment has been added to an announcement you follow! Click to view!', '23', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:13');
INSERT INTO `notifications` VALUES ('1107', 'New comment has been added to an announcement you follow! Click to view!', '22', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:13');
INSERT INTO `notifications` VALUES ('1108', 'New comment has been added to an announcement you follow! Click to view!', '16', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:13');
INSERT INTO `notifications` VALUES ('1109', 'New comment has been added to an announcement you follow! Click to view!', '15', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:13');
INSERT INTO `notifications` VALUES ('1110', 'New comment has been added to an announcement you follow! Click to view!', '14', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:13');
INSERT INTO `notifications` VALUES ('1111', 'New comment has been added to an announcement you follow! Click to view!', '81', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:13');
INSERT INTO `notifications` VALUES ('1112', 'A user has updated his comment in an announcement! Click to view!', '28', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:19');
INSERT INTO `notifications` VALUES ('1113', 'A user has updated his comment in an announcement! Click to view!', '21', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:19');
INSERT INTO `notifications` VALUES ('1114', 'A user has updated his comment in an announcement! Click to view!', '20', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:19');
INSERT INTO `notifications` VALUES ('1115', 'A user has updated his comment in an announcement! Click to view!', '19', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:19');
INSERT INTO `notifications` VALUES ('1116', 'A user has updated his comment in an announcement! Click to view!', '1', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '1', '2018-01-18 17:10:20');
INSERT INTO `notifications` VALUES ('1117', 'A user has updated his comment in an announcement! Click to view!', '51', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:20');
INSERT INTO `notifications` VALUES ('1118', 'A user has updated his comment in an announcement! Click to view!', '47', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:20');
INSERT INTO `notifications` VALUES ('1119', 'A user has updated his comment in an announcement! Click to view!', '46', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:20');
INSERT INTO `notifications` VALUES ('1120', 'A user has updated his comment in an announcement! Click to view!', '42', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:20');
INSERT INTO `notifications` VALUES ('1121', 'A user has updated his comment in an announcement! Click to view!', '41', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:20');
INSERT INTO `notifications` VALUES ('1122', 'A user has updated his comment in an announcement! Click to view!', '40', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:20');
INSERT INTO `notifications` VALUES ('1123', 'A user has updated his comment in an announcement! Click to view!', '36', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:20');
INSERT INTO `notifications` VALUES ('1124', 'A user has updated his comment in an announcement! Click to view!', '31', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:20');
INSERT INTO `notifications` VALUES ('1125', 'A user has updated his comment in an announcement! Click to view!', '27', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:20');
INSERT INTO `notifications` VALUES ('1126', 'A user has updated his comment in an announcement! Click to view!', '26', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:20');
INSERT INTO `notifications` VALUES ('1127', 'A user has updated his comment in an announcement! Click to view!', '24', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:20');
INSERT INTO `notifications` VALUES ('1128', 'A user has updated his comment in an announcement! Click to view!', '23', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:20');
INSERT INTO `notifications` VALUES ('1129', 'A user has updated his comment in an announcement! Click to view!', '22', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:20');
INSERT INTO `notifications` VALUES ('1130', 'A user has updated his comment in an announcement! Click to view!', '16', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:20');
INSERT INTO `notifications` VALUES ('1131', 'A user has updated his comment in an announcement! Click to view!', '15', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:20');
INSERT INTO `notifications` VALUES ('1132', 'A user has updated his comment in an announcement! Click to view!', '14', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:20');
INSERT INTO `notifications` VALUES ('1133', 'A user has updated his comment in an announcement! Click to view!', '81', '?controller=notices&action=viewComments&id=10', 'comment', 'grey', '0', '2018-01-18 17:10:20');
INSERT INTO `notifications` VALUES ('1134', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '28', '?controller=notices&action=viewNotice&id=7', 'warning', 'orange', '0', '2018-01-18 17:15:18');
INSERT INTO `notifications` VALUES ('1135', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '21', '?controller=notices&action=viewNotice&id=7', 'warning', 'orange', '0', '2018-01-18 17:15:18');
INSERT INTO `notifications` VALUES ('1136', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '20', '?controller=notices&action=viewNotice&id=7', 'warning', 'orange', '0', '2018-01-18 17:15:18');
INSERT INTO `notifications` VALUES ('1137', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '19', '?controller=notices&action=viewNotice&id=7', 'warning', 'orange', '0', '2018-01-18 17:15:18');
INSERT INTO `notifications` VALUES ('1138', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '1', '?controller=notices&action=viewNotice&id=7', 'warning', 'orange', '1', '2018-01-18 17:15:18');
INSERT INTO `notifications` VALUES ('1139', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '51', '?controller=notices&action=viewNotice&id=7', 'warning', 'orange', '0', '2018-01-18 17:15:18');
INSERT INTO `notifications` VALUES ('1140', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '47', '?controller=notices&action=viewNotice&id=7', 'warning', 'orange', '0', '2018-01-18 17:15:18');
INSERT INTO `notifications` VALUES ('1141', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '46', '?controller=notices&action=viewNotice&id=7', 'warning', 'orange', '0', '2018-01-18 17:15:18');
INSERT INTO `notifications` VALUES ('1142', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '42', '?controller=notices&action=viewNotice&id=7', 'warning', 'orange', '0', '2018-01-18 17:15:18');
INSERT INTO `notifications` VALUES ('1143', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '41', '?controller=notices&action=viewNotice&id=7', 'warning', 'orange', '0', '2018-01-18 17:15:18');
INSERT INTO `notifications` VALUES ('1144', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '40', '?controller=notices&action=viewNotice&id=7', 'warning', 'orange', '0', '2018-01-18 17:15:18');
INSERT INTO `notifications` VALUES ('1145', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '36', '?controller=notices&action=viewNotice&id=7', 'warning', 'orange', '0', '2018-01-18 17:15:18');
INSERT INTO `notifications` VALUES ('1146', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '31', '?controller=notices&action=viewNotice&id=7', 'warning', 'orange', '0', '2018-01-18 17:15:18');
INSERT INTO `notifications` VALUES ('1147', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '27', '?controller=notices&action=viewNotice&id=7', 'warning', 'orange', '0', '2018-01-18 17:15:18');
INSERT INTO `notifications` VALUES ('1148', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '26', '?controller=notices&action=viewNotice&id=7', 'warning', 'orange', '0', '2018-01-18 17:15:18');
INSERT INTO `notifications` VALUES ('1149', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '24', '?controller=notices&action=viewNotice&id=7', 'warning', 'orange', '0', '2018-01-18 17:15:18');
INSERT INTO `notifications` VALUES ('1150', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '23', '?controller=notices&action=viewNotice&id=7', 'warning', 'orange', '0', '2018-01-18 17:15:18');
INSERT INTO `notifications` VALUES ('1151', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '22', '?controller=notices&action=viewNotice&id=7', 'warning', 'orange', '0', '2018-01-18 17:15:18');
INSERT INTO `notifications` VALUES ('1152', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '16', '?controller=notices&action=viewNotice&id=7', 'warning', 'orange', '0', '2018-01-18 17:15:18');
INSERT INTO `notifications` VALUES ('1153', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '15', '?controller=notices&action=viewNotice&id=7', 'warning', 'orange', '0', '2018-01-18 17:15:18');
INSERT INTO `notifications` VALUES ('1154', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '14', '?controller=notices&action=viewNotice&id=7', 'warning', 'orange', '0', '2018-01-18 17:15:18');
INSERT INTO `notifications` VALUES ('1155', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '81', '?controller=notices&action=viewNotice&id=7', 'warning', 'orange', '0', '2018-01-18 17:15:19');
INSERT INTO `notifications` VALUES ('1156', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '28', '?controller=notices&action=viewNotice&id=8', 'live_help', 'light-green', '0', '2018-01-18 17:15:53');
INSERT INTO `notifications` VALUES ('1157', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '21', '?controller=notices&action=viewNotice&id=8', 'live_help', 'light-green', '0', '2018-01-18 17:15:53');
INSERT INTO `notifications` VALUES ('1158', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '20', '?controller=notices&action=viewNotice&id=8', 'live_help', 'light-green', '0', '2018-01-18 17:15:54');
INSERT INTO `notifications` VALUES ('1159', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '19', '?controller=notices&action=viewNotice&id=8', 'live_help', 'light-green', '0', '2018-01-18 17:15:54');
INSERT INTO `notifications` VALUES ('1160', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '1', '?controller=notices&action=viewNotice&id=8', 'live_help', 'light-green', '1', '2018-01-18 17:15:54');
INSERT INTO `notifications` VALUES ('1161', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '51', '?controller=notices&action=viewNotice&id=8', 'live_help', 'light-green', '0', '2018-01-18 17:15:54');
INSERT INTO `notifications` VALUES ('1162', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '47', '?controller=notices&action=viewNotice&id=8', 'live_help', 'light-green', '0', '2018-01-18 17:15:54');
INSERT INTO `notifications` VALUES ('1163', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '46', '?controller=notices&action=viewNotice&id=8', 'live_help', 'light-green', '0', '2018-01-18 17:15:54');
INSERT INTO `notifications` VALUES ('1164', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '42', '?controller=notices&action=viewNotice&id=8', 'live_help', 'light-green', '0', '2018-01-18 17:15:54');
INSERT INTO `notifications` VALUES ('1165', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '41', '?controller=notices&action=viewNotice&id=8', 'live_help', 'light-green', '0', '2018-01-18 17:15:54');
INSERT INTO `notifications` VALUES ('1166', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '40', '?controller=notices&action=viewNotice&id=8', 'live_help', 'light-green', '0', '2018-01-18 17:15:54');
INSERT INTO `notifications` VALUES ('1167', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '36', '?controller=notices&action=viewNotice&id=8', 'live_help', 'light-green', '0', '2018-01-18 17:15:54');
INSERT INTO `notifications` VALUES ('1168', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '31', '?controller=notices&action=viewNotice&id=8', 'live_help', 'light-green', '0', '2018-01-18 17:15:54');
INSERT INTO `notifications` VALUES ('1169', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '27', '?controller=notices&action=viewNotice&id=8', 'live_help', 'light-green', '0', '2018-01-18 17:15:54');
INSERT INTO `notifications` VALUES ('1170', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '26', '?controller=notices&action=viewNotice&id=8', 'live_help', 'light-green', '0', '2018-01-18 17:15:54');
INSERT INTO `notifications` VALUES ('1171', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '24', '?controller=notices&action=viewNotice&id=8', 'live_help', 'light-green', '0', '2018-01-18 17:15:54');
INSERT INTO `notifications` VALUES ('1172', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '23', '?controller=notices&action=viewNotice&id=8', 'live_help', 'light-green', '0', '2018-01-18 17:15:54');
INSERT INTO `notifications` VALUES ('1173', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '22', '?controller=notices&action=viewNotice&id=8', 'live_help', 'light-green', '0', '2018-01-18 17:15:54');
INSERT INTO `notifications` VALUES ('1174', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '16', '?controller=notices&action=viewNotice&id=8', 'live_help', 'light-green', '0', '2018-01-18 17:15:54');
INSERT INTO `notifications` VALUES ('1175', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '15', '?controller=notices&action=viewNotice&id=8', 'live_help', 'light-green', '0', '2018-01-18 17:15:54');
INSERT INTO `notifications` VALUES ('1176', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '14', '?controller=notices&action=viewNotice&id=8', 'live_help', 'light-green', '0', '2018-01-18 17:15:54');
INSERT INTO `notifications` VALUES ('1177', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '81', '?controller=notices&action=viewNotice&id=8', 'live_help', 'light-green', '0', '2018-01-18 17:15:54');
INSERT INTO `notifications` VALUES ('1178', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '28', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:16:46');
INSERT INTO `notifications` VALUES ('1179', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '21', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:16:46');
INSERT INTO `notifications` VALUES ('1180', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '20', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:16:46');
INSERT INTO `notifications` VALUES ('1181', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '19', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:16:46');
INSERT INTO `notifications` VALUES ('1182', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '1', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '1', '2018-01-18 17:16:46');
INSERT INTO `notifications` VALUES ('1183', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '51', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:16:46');
INSERT INTO `notifications` VALUES ('1184', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '47', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:16:46');
INSERT INTO `notifications` VALUES ('1185', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '46', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:16:46');
INSERT INTO `notifications` VALUES ('1186', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '42', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:16:46');
INSERT INTO `notifications` VALUES ('1187', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '41', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:16:46');
INSERT INTO `notifications` VALUES ('1188', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '40', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:16:46');
INSERT INTO `notifications` VALUES ('1189', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '36', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:16:46');
INSERT INTO `notifications` VALUES ('1190', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '31', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:16:46');
INSERT INTO `notifications` VALUES ('1191', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '27', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:16:47');
INSERT INTO `notifications` VALUES ('1192', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '26', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:16:47');
INSERT INTO `notifications` VALUES ('1193', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '24', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:16:47');
INSERT INTO `notifications` VALUES ('1194', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '23', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:16:47');
INSERT INTO `notifications` VALUES ('1195', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '22', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:16:47');
INSERT INTO `notifications` VALUES ('1196', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '16', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:16:47');
INSERT INTO `notifications` VALUES ('1197', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '15', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:16:47');
INSERT INTO `notifications` VALUES ('1198', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '14', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:16:47');
INSERT INTO `notifications` VALUES ('1199', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '81', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:16:47');
INSERT INTO `notifications` VALUES ('1200', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '28', '?controller=suggestions&action=viewSuggestion&id=10', 'live_help', 'light-green', '0', '2018-01-18 17:19:15');
INSERT INTO `notifications` VALUES ('1201', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '21', '?controller=suggestions&action=viewSuggestion&id=10', 'live_help', 'light-green', '0', '2018-01-18 17:19:15');
INSERT INTO `notifications` VALUES ('1202', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '20', '?controller=suggestions&action=viewSuggestion&id=10', 'live_help', 'light-green', '0', '2018-01-18 17:19:15');
INSERT INTO `notifications` VALUES ('1203', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '19', '?controller=suggestions&action=viewSuggestion&id=10', 'live_help', 'light-green', '0', '2018-01-18 17:19:15');
INSERT INTO `notifications` VALUES ('1204', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '1', '?controller=suggestions&action=viewSuggestion&id=10', 'live_help', 'light-green', '1', '2018-01-18 17:19:15');
INSERT INTO `notifications` VALUES ('1205', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '51', '?controller=suggestions&action=viewSuggestion&id=10', 'live_help', 'light-green', '0', '2018-01-18 17:19:15');
INSERT INTO `notifications` VALUES ('1206', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '47', '?controller=suggestions&action=viewSuggestion&id=10', 'live_help', 'light-green', '0', '2018-01-18 17:19:15');
INSERT INTO `notifications` VALUES ('1207', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '46', '?controller=suggestions&action=viewSuggestion&id=10', 'live_help', 'light-green', '0', '2018-01-18 17:19:15');
INSERT INTO `notifications` VALUES ('1208', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '42', '?controller=suggestions&action=viewSuggestion&id=10', 'live_help', 'light-green', '0', '2018-01-18 17:19:15');
INSERT INTO `notifications` VALUES ('1209', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '41', '?controller=suggestions&action=viewSuggestion&id=10', 'live_help', 'light-green', '0', '2018-01-18 17:19:15');
INSERT INTO `notifications` VALUES ('1210', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '40', '?controller=suggestions&action=viewSuggestion&id=10', 'live_help', 'light-green', '0', '2018-01-18 17:19:15');
INSERT INTO `notifications` VALUES ('1211', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '36', '?controller=suggestions&action=viewSuggestion&id=10', 'live_help', 'light-green', '0', '2018-01-18 17:19:15');
INSERT INTO `notifications` VALUES ('1212', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '31', '?controller=suggestions&action=viewSuggestion&id=10', 'live_help', 'light-green', '0', '2018-01-18 17:19:15');
INSERT INTO `notifications` VALUES ('1213', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '27', '?controller=suggestions&action=viewSuggestion&id=10', 'live_help', 'light-green', '0', '2018-01-18 17:19:15');
INSERT INTO `notifications` VALUES ('1214', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '26', '?controller=suggestions&action=viewSuggestion&id=10', 'live_help', 'light-green', '0', '2018-01-18 17:19:15');
INSERT INTO `notifications` VALUES ('1215', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '24', '?controller=suggestions&action=viewSuggestion&id=10', 'live_help', 'light-green', '0', '2018-01-18 17:19:15');
INSERT INTO `notifications` VALUES ('1216', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '23', '?controller=suggestions&action=viewSuggestion&id=10', 'live_help', 'light-green', '0', '2018-01-18 17:19:15');
INSERT INTO `notifications` VALUES ('1217', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '22', '?controller=suggestions&action=viewSuggestion&id=10', 'live_help', 'light-green', '0', '2018-01-18 17:19:15');
INSERT INTO `notifications` VALUES ('1218', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '16', '?controller=suggestions&action=viewSuggestion&id=10', 'live_help', 'light-green', '0', '2018-01-18 17:19:15');
INSERT INTO `notifications` VALUES ('1219', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '15', '?controller=suggestions&action=viewSuggestion&id=10', 'live_help', 'light-green', '0', '2018-01-18 17:19:15');
INSERT INTO `notifications` VALUES ('1220', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '14', '?controller=suggestions&action=viewSuggestion&id=10', 'live_help', 'light-green', '0', '2018-01-18 17:19:15');
INSERT INTO `notifications` VALUES ('1221', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '81', '?controller=suggestions&action=viewSuggestion&id=10', 'live_help', 'light-green', '0', '2018-01-18 17:19:15');
INSERT INTO `notifications` VALUES ('1222', 'A suggestion has been updated! Click to view!', '28', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:19:47');
INSERT INTO `notifications` VALUES ('1223', 'A suggestion has been updated! Click to view!', '21', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:19:47');
INSERT INTO `notifications` VALUES ('1224', 'A suggestion has been updated! Click to view!', '20', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:19:47');
INSERT INTO `notifications` VALUES ('1225', 'A suggestion has been updated! Click to view!', '19', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:19:47');
INSERT INTO `notifications` VALUES ('1226', 'A suggestion has been updated! Click to view!', '1', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '1', '2018-01-18 17:19:47');
INSERT INTO `notifications` VALUES ('1227', 'A suggestion has been updated! Click to view!', '51', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:19:47');
INSERT INTO `notifications` VALUES ('1228', 'A suggestion has been updated! Click to view!', '47', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:19:47');
INSERT INTO `notifications` VALUES ('1229', 'A suggestion has been updated! Click to view!', '46', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:19:47');
INSERT INTO `notifications` VALUES ('1230', 'A suggestion has been updated! Click to view!', '42', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:19:47');
INSERT INTO `notifications` VALUES ('1231', 'A suggestion has been updated! Click to view!', '41', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:19:47');
INSERT INTO `notifications` VALUES ('1232', 'A suggestion has been updated! Click to view!', '40', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:19:47');
INSERT INTO `notifications` VALUES ('1233', 'A suggestion has been updated! Click to view!', '36', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:19:47');
INSERT INTO `notifications` VALUES ('1234', 'A suggestion has been updated! Click to view!', '31', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:19:47');
INSERT INTO `notifications` VALUES ('1235', 'A suggestion has been updated! Click to view!', '27', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:19:48');
INSERT INTO `notifications` VALUES ('1236', 'A suggestion has been updated! Click to view!', '26', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:19:48');
INSERT INTO `notifications` VALUES ('1237', 'A suggestion has been updated! Click to view!', '24', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:19:48');
INSERT INTO `notifications` VALUES ('1238', 'A suggestion has been updated! Click to view!', '23', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:19:48');
INSERT INTO `notifications` VALUES ('1239', 'A suggestion has been updated! Click to view!', '22', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:19:48');
INSERT INTO `notifications` VALUES ('1240', 'A suggestion has been updated! Click to view!', '16', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:19:48');
INSERT INTO `notifications` VALUES ('1241', 'A suggestion has been updated! Click to view!', '15', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:19:48');
INSERT INTO `notifications` VALUES ('1242', 'A suggestion has been updated! Click to view!', '14', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:19:48');
INSERT INTO `notifications` VALUES ('1243', 'A suggestion has been updated! Click to view!', '81', '?controller=suggestions&action=viewSuggestion&id=9', 'live_help', 'light-green', '0', '2018-01-18 17:19:48');
INSERT INTO `notifications` VALUES ('1244', 'Daffodil Japan IT has replied to one of your suggestions! Click to view!', '52', '?controller=suggestions&action=viewSuggestions&id=10', 'comment', 'grey', '1', '2018-01-18 17:26:01');
INSERT INTO `notifications` VALUES ('1245', 'Daffodil Japan IT has replied to one of your suggestions! Click to view!', '52', '?controller=suggestions&action=viewComments&id=9', 'comment', 'grey', '1', '2018-01-18 17:27:49');
INSERT INTO `notifications` VALUES ('1246', 'Daffodil Japan IT has replied to one of your suggestions! Click to view!', '52', '?controller=suggestions&action=viewComments&id=9', 'comment', 'grey', '0', '2018-01-18 17:29:59');
INSERT INTO `notifications` VALUES ('1247', 'Daffodil Japan IT has replied to one of your suggestions! Click to view!', '52', '?controller=suggestions&action=viewComments&id=9', 'comment', 'grey', '1', '2018-01-18 17:30:37');
INSERT INTO `notifications` VALUES ('1248', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '28', '?controller=suggestions&action=viewSuggestion&id=11', 'live_help', 'light-green', '0', '2018-01-18 17:32:05');
INSERT INTO `notifications` VALUES ('1249', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '21', '?controller=suggestions&action=viewSuggestion&id=11', 'live_help', 'light-green', '0', '2018-01-18 17:32:05');
INSERT INTO `notifications` VALUES ('1250', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '20', '?controller=suggestions&action=viewSuggestion&id=11', 'live_help', 'light-green', '0', '2018-01-18 17:32:05');
INSERT INTO `notifications` VALUES ('1251', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '19', '?controller=suggestions&action=viewSuggestion&id=11', 'live_help', 'light-green', '0', '2018-01-18 17:32:05');
INSERT INTO `notifications` VALUES ('1252', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '1', '?controller=suggestions&action=viewSuggestion&id=11', 'live_help', 'light-green', '1', '2018-01-18 17:32:05');
INSERT INTO `notifications` VALUES ('1253', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '51', '?controller=suggestions&action=viewSuggestion&id=11', 'live_help', 'light-green', '0', '2018-01-18 17:32:05');
INSERT INTO `notifications` VALUES ('1254', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '47', '?controller=suggestions&action=viewSuggestion&id=11', 'live_help', 'light-green', '0', '2018-01-18 17:32:05');
INSERT INTO `notifications` VALUES ('1255', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '46', '?controller=suggestions&action=viewSuggestion&id=11', 'live_help', 'light-green', '0', '2018-01-18 17:32:05');
INSERT INTO `notifications` VALUES ('1256', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '42', '?controller=suggestions&action=viewSuggestion&id=11', 'live_help', 'light-green', '0', '2018-01-18 17:32:05');
INSERT INTO `notifications` VALUES ('1257', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '41', '?controller=suggestions&action=viewSuggestion&id=11', 'live_help', 'light-green', '0', '2018-01-18 17:32:05');
INSERT INTO `notifications` VALUES ('1258', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '40', '?controller=suggestions&action=viewSuggestion&id=11', 'live_help', 'light-green', '0', '2018-01-18 17:32:05');
INSERT INTO `notifications` VALUES ('1259', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '36', '?controller=suggestions&action=viewSuggestion&id=11', 'live_help', 'light-green', '0', '2018-01-18 17:32:05');
INSERT INTO `notifications` VALUES ('1260', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '31', '?controller=suggestions&action=viewSuggestion&id=11', 'live_help', 'light-green', '0', '2018-01-18 17:32:05');
INSERT INTO `notifications` VALUES ('1261', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '27', '?controller=suggestions&action=viewSuggestion&id=11', 'live_help', 'light-green', '0', '2018-01-18 17:32:05');
INSERT INTO `notifications` VALUES ('1262', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '26', '?controller=suggestions&action=viewSuggestion&id=11', 'live_help', 'light-green', '0', '2018-01-18 17:32:05');
INSERT INTO `notifications` VALUES ('1263', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '24', '?controller=suggestions&action=viewSuggestion&id=11', 'live_help', 'light-green', '0', '2018-01-18 17:32:05');
INSERT INTO `notifications` VALUES ('1264', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '23', '?controller=suggestions&action=viewSuggestion&id=11', 'live_help', 'light-green', '0', '2018-01-18 17:32:06');
INSERT INTO `notifications` VALUES ('1265', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '22', '?controller=suggestions&action=viewSuggestion&id=11', 'live_help', 'light-green', '0', '2018-01-18 17:32:06');
INSERT INTO `notifications` VALUES ('1266', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '16', '?controller=suggestions&action=viewSuggestion&id=11', 'live_help', 'light-green', '0', '2018-01-18 17:32:06');
INSERT INTO `notifications` VALUES ('1267', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '15', '?controller=suggestions&action=viewSuggestion&id=11', 'live_help', 'light-green', '0', '2018-01-18 17:32:06');
INSERT INTO `notifications` VALUES ('1268', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '14', '?controller=suggestions&action=viewSuggestion&id=11', 'live_help', 'light-green', '0', '2018-01-18 17:32:06');
INSERT INTO `notifications` VALUES ('1269', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '81', '?controller=suggestions&action=viewSuggestion&id=11', 'live_help', 'light-green', '0', '2018-01-18 17:32:06');
INSERT INTO `notifications` VALUES ('1270', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '28', '?controller=suggestions&action=viewSuggestion&id=12', 'live_help', 'light-green', '0', '2018-01-18 17:32:24');
INSERT INTO `notifications` VALUES ('1271', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '21', '?controller=suggestions&action=viewSuggestion&id=12', 'live_help', 'light-green', '0', '2018-01-18 17:32:24');
INSERT INTO `notifications` VALUES ('1272', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '20', '?controller=suggestions&action=viewSuggestion&id=12', 'live_help', 'light-green', '0', '2018-01-18 17:32:24');
INSERT INTO `notifications` VALUES ('1273', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '19', '?controller=suggestions&action=viewSuggestion&id=12', 'live_help', 'light-green', '0', '2018-01-18 17:32:24');
INSERT INTO `notifications` VALUES ('1274', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '1', '?controller=suggestions&action=viewSuggestion&id=12', 'live_help', 'light-green', '1', '2018-01-18 17:32:24');
INSERT INTO `notifications` VALUES ('1275', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '51', '?controller=suggestions&action=viewSuggestion&id=12', 'live_help', 'light-green', '0', '2018-01-18 17:32:24');
INSERT INTO `notifications` VALUES ('1276', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '47', '?controller=suggestions&action=viewSuggestion&id=12', 'live_help', 'light-green', '0', '2018-01-18 17:32:24');
INSERT INTO `notifications` VALUES ('1277', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '46', '?controller=suggestions&action=viewSuggestion&id=12', 'live_help', 'light-green', '0', '2018-01-18 17:32:24');
INSERT INTO `notifications` VALUES ('1278', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '42', '?controller=suggestions&action=viewSuggestion&id=12', 'live_help', 'light-green', '0', '2018-01-18 17:32:24');
INSERT INTO `notifications` VALUES ('1279', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '41', '?controller=suggestions&action=viewSuggestion&id=12', 'live_help', 'light-green', '0', '2018-01-18 17:32:24');
INSERT INTO `notifications` VALUES ('1280', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '40', '?controller=suggestions&action=viewSuggestion&id=12', 'live_help', 'light-green', '0', '2018-01-18 17:32:24');
INSERT INTO `notifications` VALUES ('1281', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '36', '?controller=suggestions&action=viewSuggestion&id=12', 'live_help', 'light-green', '0', '2018-01-18 17:32:24');
INSERT INTO `notifications` VALUES ('1282', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '31', '?controller=suggestions&action=viewSuggestion&id=12', 'live_help', 'light-green', '0', '2018-01-18 17:32:24');
INSERT INTO `notifications` VALUES ('1283', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '27', '?controller=suggestions&action=viewSuggestion&id=12', 'live_help', 'light-green', '0', '2018-01-18 17:32:24');
INSERT INTO `notifications` VALUES ('1284', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '26', '?controller=suggestions&action=viewSuggestion&id=12', 'live_help', 'light-green', '0', '2018-01-18 17:32:24');
INSERT INTO `notifications` VALUES ('1285', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '24', '?controller=suggestions&action=viewSuggestion&id=12', 'live_help', 'light-green', '0', '2018-01-18 17:32:24');
INSERT INTO `notifications` VALUES ('1286', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '23', '?controller=suggestions&action=viewSuggestion&id=12', 'live_help', 'light-green', '0', '2018-01-18 17:32:24');
INSERT INTO `notifications` VALUES ('1287', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '22', '?controller=suggestions&action=viewSuggestion&id=12', 'live_help', 'light-green', '0', '2018-01-18 17:32:24');
INSERT INTO `notifications` VALUES ('1288', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '16', '?controller=suggestions&action=viewSuggestion&id=12', 'live_help', 'light-green', '0', '2018-01-18 17:32:24');
INSERT INTO `notifications` VALUES ('1289', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '15', '?controller=suggestions&action=viewSuggestion&id=12', 'live_help', 'light-green', '0', '2018-01-18 17:32:24');
INSERT INTO `notifications` VALUES ('1290', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '14', '?controller=suggestions&action=viewSuggestion&id=12', 'live_help', 'light-green', '0', '2018-01-18 17:32:24');
INSERT INTO `notifications` VALUES ('1291', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '81', '?controller=suggestions&action=viewSuggestion&id=12', 'live_help', 'light-green', '0', '2018-01-18 17:32:24');
INSERT INTO `notifications` VALUES ('1292', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '28', '?controller=suggestions&action=viewSuggestion&id=13', 'live_help', 'light-green', '0', '2018-01-18 17:32:35');
INSERT INTO `notifications` VALUES ('1293', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '21', '?controller=suggestions&action=viewSuggestion&id=13', 'live_help', 'light-green', '0', '2018-01-18 17:32:35');
INSERT INTO `notifications` VALUES ('1294', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '20', '?controller=suggestions&action=viewSuggestion&id=13', 'live_help', 'light-green', '0', '2018-01-18 17:32:35');
INSERT INTO `notifications` VALUES ('1295', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '19', '?controller=suggestions&action=viewSuggestion&id=13', 'live_help', 'light-green', '0', '2018-01-18 17:32:35');
INSERT INTO `notifications` VALUES ('1296', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '1', '?controller=suggestions&action=viewSuggestion&id=13', 'live_help', 'light-green', '1', '2018-01-18 17:32:35');
INSERT INTO `notifications` VALUES ('1297', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '51', '?controller=suggestions&action=viewSuggestion&id=13', 'live_help', 'light-green', '0', '2018-01-18 17:32:35');
INSERT INTO `notifications` VALUES ('1298', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '47', '?controller=suggestions&action=viewSuggestion&id=13', 'live_help', 'light-green', '0', '2018-01-18 17:32:35');
INSERT INTO `notifications` VALUES ('1299', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '46', '?controller=suggestions&action=viewSuggestion&id=13', 'live_help', 'light-green', '0', '2018-01-18 17:32:35');
INSERT INTO `notifications` VALUES ('1300', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '42', '?controller=suggestions&action=viewSuggestion&id=13', 'live_help', 'light-green', '0', '2018-01-18 17:32:35');
INSERT INTO `notifications` VALUES ('1301', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '41', '?controller=suggestions&action=viewSuggestion&id=13', 'live_help', 'light-green', '0', '2018-01-18 17:32:35');
INSERT INTO `notifications` VALUES ('1302', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '40', '?controller=suggestions&action=viewSuggestion&id=13', 'live_help', 'light-green', '0', '2018-01-18 17:32:35');
INSERT INTO `notifications` VALUES ('1303', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '36', '?controller=suggestions&action=viewSuggestion&id=13', 'live_help', 'light-green', '0', '2018-01-18 17:32:35');
INSERT INTO `notifications` VALUES ('1304', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '31', '?controller=suggestions&action=viewSuggestion&id=13', 'live_help', 'light-green', '0', '2018-01-18 17:32:35');
INSERT INTO `notifications` VALUES ('1305', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '27', '?controller=suggestions&action=viewSuggestion&id=13', 'live_help', 'light-green', '0', '2018-01-18 17:32:35');
INSERT INTO `notifications` VALUES ('1306', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '26', '?controller=suggestions&action=viewSuggestion&id=13', 'live_help', 'light-green', '0', '2018-01-18 17:32:35');
INSERT INTO `notifications` VALUES ('1307', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '24', '?controller=suggestions&action=viewSuggestion&id=13', 'live_help', 'light-green', '0', '2018-01-18 17:32:35');
INSERT INTO `notifications` VALUES ('1308', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '23', '?controller=suggestions&action=viewSuggestion&id=13', 'live_help', 'light-green', '0', '2018-01-18 17:32:35');
INSERT INTO `notifications` VALUES ('1309', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '22', '?controller=suggestions&action=viewSuggestion&id=13', 'live_help', 'light-green', '0', '2018-01-18 17:32:35');
INSERT INTO `notifications` VALUES ('1310', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '16', '?controller=suggestions&action=viewSuggestion&id=13', 'live_help', 'light-green', '0', '2018-01-18 17:32:36');
INSERT INTO `notifications` VALUES ('1311', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '15', '?controller=suggestions&action=viewSuggestion&id=13', 'live_help', 'light-green', '0', '2018-01-18 17:32:36');
INSERT INTO `notifications` VALUES ('1312', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '14', '?controller=suggestions&action=viewSuggestion&id=13', 'live_help', 'light-green', '0', '2018-01-18 17:32:36');
INSERT INTO `notifications` VALUES ('1313', 'New suggestion has been added by Geomatry Chronicles! Click to view!', '81', '?controller=suggestions&action=viewSuggestion&id=13', 'live_help', 'light-green', '0', '2018-01-18 17:32:36');
INSERT INTO `notifications` VALUES ('1314', 'A suggestion has been updated! Click to view!', '28', '?controller=suggestions&action=viewSuggestion&id=7', 'live_help', 'light-green', '0', '2018-01-18 17:33:59');
INSERT INTO `notifications` VALUES ('1315', 'A suggestion has been updated! Click to view!', '21', '?controller=suggestions&action=viewSuggestion&id=7', 'live_help', 'light-green', '0', '2018-01-18 17:33:59');
INSERT INTO `notifications` VALUES ('1316', 'A suggestion has been updated! Click to view!', '20', '?controller=suggestions&action=viewSuggestion&id=7', 'live_help', 'light-green', '0', '2018-01-18 17:33:59');
INSERT INTO `notifications` VALUES ('1317', 'A suggestion has been updated! Click to view!', '19', '?controller=suggestions&action=viewSuggestion&id=7', 'live_help', 'light-green', '0', '2018-01-18 17:33:59');
INSERT INTO `notifications` VALUES ('1318', 'A suggestion has been updated! Click to view!', '1', '?controller=suggestions&action=viewSuggestion&id=7', 'live_help', 'light-green', '1', '2018-01-18 17:33:59');
INSERT INTO `notifications` VALUES ('1319', 'A suggestion has been updated! Click to view!', '51', '?controller=suggestions&action=viewSuggestion&id=7', 'live_help', 'light-green', '0', '2018-01-18 17:33:59');
INSERT INTO `notifications` VALUES ('1320', 'A suggestion has been updated! Click to view!', '47', '?controller=suggestions&action=viewSuggestion&id=7', 'live_help', 'light-green', '0', '2018-01-18 17:33:59');
INSERT INTO `notifications` VALUES ('1321', 'A suggestion has been updated! Click to view!', '46', '?controller=suggestions&action=viewSuggestion&id=7', 'live_help', 'light-green', '0', '2018-01-18 17:33:59');
INSERT INTO `notifications` VALUES ('1322', 'A suggestion has been updated! Click to view!', '42', '?controller=suggestions&action=viewSuggestion&id=7', 'live_help', 'light-green', '0', '2018-01-18 17:33:59');
INSERT INTO `notifications` VALUES ('1323', 'A suggestion has been updated! Click to view!', '41', '?controller=suggestions&action=viewSuggestion&id=7', 'live_help', 'light-green', '0', '2018-01-18 17:33:59');
INSERT INTO `notifications` VALUES ('1324', 'A suggestion has been updated! Click to view!', '40', '?controller=suggestions&action=viewSuggestion&id=7', 'live_help', 'light-green', '0', '2018-01-18 17:33:59');
INSERT INTO `notifications` VALUES ('1325', 'A suggestion has been updated! Click to view!', '36', '?controller=suggestions&action=viewSuggestion&id=7', 'live_help', 'light-green', '0', '2018-01-18 17:33:59');
INSERT INTO `notifications` VALUES ('1326', 'A suggestion has been updated! Click to view!', '31', '?controller=suggestions&action=viewSuggestion&id=7', 'live_help', 'light-green', '0', '2018-01-18 17:33:59');
INSERT INTO `notifications` VALUES ('1327', 'A suggestion has been updated! Click to view!', '27', '?controller=suggestions&action=viewSuggestion&id=7', 'live_help', 'light-green', '0', '2018-01-18 17:33:59');
INSERT INTO `notifications` VALUES ('1328', 'A suggestion has been updated! Click to view!', '26', '?controller=suggestions&action=viewSuggestion&id=7', 'live_help', 'light-green', '0', '2018-01-18 17:33:59');
INSERT INTO `notifications` VALUES ('1329', 'A suggestion has been updated! Click to view!', '24', '?controller=suggestions&action=viewSuggestion&id=7', 'live_help', 'light-green', '0', '2018-01-18 17:33:59');
INSERT INTO `notifications` VALUES ('1330', 'A suggestion has been updated! Click to view!', '23', '?controller=suggestions&action=viewSuggestion&id=7', 'live_help', 'light-green', '0', '2018-01-18 17:33:59');
INSERT INTO `notifications` VALUES ('1331', 'A suggestion has been updated! Click to view!', '22', '?controller=suggestions&action=viewSuggestion&id=7', 'live_help', 'light-green', '0', '2018-01-18 17:34:00');
INSERT INTO `notifications` VALUES ('1332', 'A suggestion has been updated! Click to view!', '16', '?controller=suggestions&action=viewSuggestion&id=7', 'live_help', 'light-green', '0', '2018-01-18 17:34:00');
INSERT INTO `notifications` VALUES ('1333', 'A suggestion has been updated! Click to view!', '15', '?controller=suggestions&action=viewSuggestion&id=7', 'live_help', 'light-green', '0', '2018-01-18 17:34:00');
INSERT INTO `notifications` VALUES ('1334', 'A suggestion has been updated! Click to view!', '14', '?controller=suggestions&action=viewSuggestion&id=7', 'live_help', 'light-green', '0', '2018-01-18 17:34:00');
INSERT INTO `notifications` VALUES ('1335', 'A suggestion has been updated! Click to view!', '81', '?controller=suggestions&action=viewSuggestion&id=7', 'live_help', 'light-green', '0', '2018-01-18 17:34:00');
INSERT INTO `notifications` VALUES ('1336', 'Daffodil Japan IT has replied to one of your suggestions! Click to view!', '52', '?controller=suggestions&action=viewComments&id=7', 'comment', 'grey', '0', '2018-01-18 17:44:43');
INSERT INTO `notifications` VALUES ('1337', 'Daffodil Japan IT has replied to one of your suggestions! Click to view!', '52', '?controller=suggestions&action=viewComments&id=13', 'comment', 'grey', '0', '2018-01-18 17:45:12');
INSERT INTO `notifications` VALUES ('1338', 'Daffodil Japan IT has replied to one of your suggestions! Click to view!', '52', '?controller=suggestions&action=viewComments&id=7', 'comment', 'grey', '0', '2018-01-18 17:48:25');
INSERT INTO `notifications` VALUES ('1339', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '400', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:56');
INSERT INTO `notifications` VALUES ('1340', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '52', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:56');
INSERT INTO `notifications` VALUES ('1341', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '51', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:56');
INSERT INTO `notifications` VALUES ('1342', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '50', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:56');
INSERT INTO `notifications` VALUES ('1343', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '49', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:56');
INSERT INTO `notifications` VALUES ('1344', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '48', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:56');
INSERT INTO `notifications` VALUES ('1345', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '47', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:56');
INSERT INTO `notifications` VALUES ('1346', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '46', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:56');
INSERT INTO `notifications` VALUES ('1347', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '44', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:56');
INSERT INTO `notifications` VALUES ('1348', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '43', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:56');
INSERT INTO `notifications` VALUES ('1349', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '42', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:56');
INSERT INTO `notifications` VALUES ('1350', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '41', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:56');
INSERT INTO `notifications` VALUES ('1351', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '40', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:56');
INSERT INTO `notifications` VALUES ('1352', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '39', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:56');
INSERT INTO `notifications` VALUES ('1353', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '38', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:56');
INSERT INTO `notifications` VALUES ('1354', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '37', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:56');
INSERT INTO `notifications` VALUES ('1355', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '36', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:57');
INSERT INTO `notifications` VALUES ('1356', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '35', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:57');
INSERT INTO `notifications` VALUES ('1357', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '34', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:57');
INSERT INTO `notifications` VALUES ('1358', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '33', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:57');
INSERT INTO `notifications` VALUES ('1359', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '32', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:57');
INSERT INTO `notifications` VALUES ('1360', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '31', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:57');
INSERT INTO `notifications` VALUES ('1361', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '30', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:57');
INSERT INTO `notifications` VALUES ('1362', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '29', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:57');
INSERT INTO `notifications` VALUES ('1363', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '28', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:57');
INSERT INTO `notifications` VALUES ('1364', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '27', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:57');
INSERT INTO `notifications` VALUES ('1365', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '26', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:57');
INSERT INTO `notifications` VALUES ('1366', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '25', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:57');
INSERT INTO `notifications` VALUES ('1367', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '24', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:57');
INSERT INTO `notifications` VALUES ('1368', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '23', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:57');
INSERT INTO `notifications` VALUES ('1369', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '22', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:58');
INSERT INTO `notifications` VALUES ('1370', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '21', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:58');
INSERT INTO `notifications` VALUES ('1371', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '20', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:58');
INSERT INTO `notifications` VALUES ('1372', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '19', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:58');
INSERT INTO `notifications` VALUES ('1373', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '16', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:58');
INSERT INTO `notifications` VALUES ('1374', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '15', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:58');
INSERT INTO `notifications` VALUES ('1375', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '14', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:58');
INSERT INTO `notifications` VALUES ('1376', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '1', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:58');
INSERT INTO `notifications` VALUES ('1377', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '92', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:58');
INSERT INTO `notifications` VALUES ('1378', 'Notice! Titled &quot;Lorem Ipsum...&quot; by Super Admin! Click to view!', '81', '?controller=notices&action=viewNotice&id=21', 'warning', 'orange', '0', '2018-01-20 15:31:58');
INSERT INTO `notifications` VALUES ('1379', null, '403', '?controller=users&action=showUser&uname=cooluser', 'person', 'green', '1', '2018-01-24 16:18:38');
INSERT INTO `notifications` VALUES ('1380', 'Congratulations Haja Haja! Your user profile has been created. Click to view your profile!', '404', '?controller=users&action=showUser&uname=hajat', 'person', 'green', '1', '2018-01-24 16:19:48');
INSERT INTO `notifications` VALUES ('1381', 'Your user profile has been updated! Click to view your profile!', '404', '?controller=users&action=showUser&uname=hajat', 'person', 'orange', '1', '2018-01-24 16:27:41');
INSERT INTO `notifications` VALUES ('1382', 'Your Student profile has been created! Click to view your profile!', null, '?controller=users&action=showUser&uname=hajat', 'school', 'green', '0', '2018-01-24 16:51:42');
INSERT INTO `notifications` VALUES ('1383', 'Your Student profile has been created! Click to view your profile!', '404', '?controller=users&action=showUser&uname=hajat', 'school', 'green', '0', '2018-01-24 16:54:10');
INSERT INTO `notifications` VALUES ('1384', 'Information on your Student profile has been updated! Click to view your profile!', null, '?controller=users&action=showUser&uname=cooluser', 'school', 'orange', '0', '2018-01-24 17:13:44');
INSERT INTO `notifications` VALUES ('1388', 'Information on your Student profile has been updated! Click to view your profile!', '403', '?controller=users&action=showUser&uname=cooluser', 'school', 'orange', '0', '2018-01-24 17:17:41');
INSERT INTO `notifications` VALUES ('1389', 'Information on your Student profile has been updated! Click to view your profile!', '403', '?controller=users&action=showUser&uname=cooluser', 'school', 'orange', '0', '2018-01-24 17:22:28');
INSERT INTO `notifications` VALUES ('1390', 'Information on your Student profile has been updated! Click to view your profile!', '403', '?controller=users&action=showUser&uname=cooluser', 'school', 'orange', '0', '2018-01-24 17:22:52');
INSERT INTO `notifications` VALUES ('1391', 'Information on your Student profile has been updated! Click to view your profile!', '403', '?controller=users&action=showUser&uname=cooluser', 'school', 'orange', '0', '2018-01-24 17:23:42');
INSERT INTO `notifications` VALUES ('1392', 'Information on your Student profile has been updated! Click to view your profile!', '403', '?controller=users&action=showUser&uname=cooluser', 'school', 'orange', '0', '2018-01-24 17:24:22');
INSERT INTO `notifications` VALUES ('1393', 'Information on your Student profile has been updated! Click to view your profile!', '403', '?controller=users&action=showUser&uname=cooluser', 'school', 'orange', '0', '2018-01-24 17:24:52');
INSERT INTO `notifications` VALUES ('1394', 'Information on your Student profile has been updated! Click to view your profile!', '403', '?controller=users&action=showUser&uname=cooluser', 'school', 'orange', '0', '2018-01-24 17:25:03');
INSERT INTO `notifications` VALUES ('1395', 'Your Student profile has been created! Click to view your profile!', '404', '?controller=users&action=showUser&uname=hajat', 'school', 'green', '0', '2018-01-24 17:30:37');
INSERT INTO `notifications` VALUES ('1396', 'Information on your Student profile has been updated! Click to view your profile!', '403', '?controller=users&action=showUser&uname=cooluser', 'school', 'orange', '0', '2018-01-24 17:53:31');
INSERT INTO `notifications` VALUES ('1397', 'Information on your Student profile has been updated! Click to view your profile!', '403', '?controller=users&action=showUser&uname=cooluser', 'school', 'orange', '0', '2018-01-24 17:54:03');
INSERT INTO `notifications` VALUES ('1398', 'Information on your Student profile has been updated! Click to view your profile!', '403', '?controller=users&action=showUser&uname=cooluser', 'school', 'orange', '0', '2018-01-24 17:54:11');
INSERT INTO `notifications` VALUES ('1399', 'Information on your Student profile has been updated! Click to view your profile!', '403', '?controller=users&action=showUser&uname=cooluser', 'school', 'orange', '0', '2018-01-24 17:56:42');
INSERT INTO `notifications` VALUES ('1400', 'Information on your Student profile has been updated! Click to view your profile!', '403', '?controller=users&action=showUser&uname=cooluser', 'school', 'orange', '0', '2018-01-24 17:56:56');
INSERT INTO `notifications` VALUES ('1401', 'Information on your Student profile has been updated! Click to view your profile!', '403', '?controller=users&action=showUser&uname=cooluser', 'school', 'orange', '0', '2018-01-24 17:57:05');
INSERT INTO `notifications` VALUES ('1402', 'Information on your Student profile has been updated! Click to view your profile!', '403', '?controller=users&action=showUser&uname=cooluser', 'school', 'orange', '0', '2018-01-24 17:57:45');
INSERT INTO `notifications` VALUES ('1403', 'Information on your Student profile has been updated! Click to view your profile!', '403', '?controller=users&action=showUser&uname=cooluser', 'school', 'orange', '0', '2018-01-24 17:57:49');
INSERT INTO `notifications` VALUES ('1404', 'Information on your Student profile has been updated! Click to view your profile!', '403', '?controller=users&action=showUser&uname=cooluser', 'school', 'orange', '0', '2018-01-24 17:57:59');
INSERT INTO `notifications` VALUES ('1405', 'Information on your Student profile has been updated! Click to view your profile!', '403', '?controller=users&action=showUser&uname=cooluser', 'school', 'orange', '0', '2018-01-24 17:59:33');
INSERT INTO `notifications` VALUES ('1406', 'Information on your Student profile has been updated! Click to view your profile!', '403', '?controller=users&action=showUser&uname=cooluser', 'school', 'orange', '0', '2018-01-24 17:59:42');
INSERT INTO `notifications` VALUES ('1407', 'Information on your Student profile has been updated! Click to view your profile!', '403', '?controller=users&action=showUser&uname=cooluser', 'school', 'orange', '0', '2018-01-24 17:59:48');
INSERT INTO `notifications` VALUES ('1408', 'Information on your Student profile has been updated! Click to view your profile!', '403', '?controller=users&action=showUser&uname=cooluser', 'school', 'orange', '0', '2018-01-24 18:01:48');
INSERT INTO `notifications` VALUES ('1409', 'Information on your Student profile has been updated! Click to view your profile!', '403', '?controller=users&action=showUser&uname=cooluser', 'school', 'orange', '0', '2018-01-24 18:02:03');
INSERT INTO `notifications` VALUES ('1410', 'Information on your Student profile has been updated! Click to view your profile!', '403', '?controller=users&action=showUser&uname=cooluser', 'school', 'orange', '0', '2018-01-24 18:02:19');
INSERT INTO `notifications` VALUES ('1411', 'Information on your Student profile has been updated! Click to view your profile!', '403', '?controller=users&action=showUser&uname=cooluser', 'school', 'orange', '0', '2018-01-24 18:02:36');
INSERT INTO `notifications` VALUES ('1412', 'Information on your Student profile has been updated! Click to view your profile!', '403', '?controller=users&action=showUser&uname=cooluser', 'school', 'orange', '0', '2018-01-24 18:03:41');
INSERT INTO `notifications` VALUES ('1413', 'Information on your Student profile has been updated! Click to view your profile!', '403', '?controller=users&action=showUser&uname=cooluser', 'school', 'orange', '0', '2018-01-24 18:04:59');
INSERT INTO `notifications` VALUES ('1414', 'Information on your Student profile has been updated! Click to view your profile!', '52', '?controller=users&action=showUser&uname=geomatry', 'school', 'orange', '0', '2018-01-24 18:18:19');
INSERT INTO `notifications` VALUES ('1415', 'A suggestion has been updated! Click to view!', '28', '?controller=suggestions&action=viewSuggestion&id=6', 'live_help', 'light-green', '0', '2018-01-24 18:22:44');
INSERT INTO `notifications` VALUES ('1416', 'A suggestion has been updated! Click to view!', '21', '?controller=suggestions&action=viewSuggestion&id=6', 'live_help', 'light-green', '0', '2018-01-24 18:22:44');
INSERT INTO `notifications` VALUES ('1417', 'A suggestion has been updated! Click to view!', '20', '?controller=suggestions&action=viewSuggestion&id=6', 'live_help', 'light-green', '0', '2018-01-24 18:22:44');
INSERT INTO `notifications` VALUES ('1418', 'A suggestion has been updated! Click to view!', '19', '?controller=suggestions&action=viewSuggestion&id=6', 'live_help', 'light-green', '0', '2018-01-24 18:22:44');
INSERT INTO `notifications` VALUES ('1419', 'A suggestion has been updated! Click to view!', '1', '?controller=suggestions&action=viewSuggestion&id=6', 'live_help', 'light-green', '0', '2018-01-24 18:22:44');
INSERT INTO `notifications` VALUES ('1420', 'A suggestion has been updated! Click to view!', '51', '?controller=suggestions&action=viewSuggestion&id=6', 'live_help', 'light-green', '0', '2018-01-24 18:22:44');
INSERT INTO `notifications` VALUES ('1421', 'A suggestion has been updated! Click to view!', '47', '?controller=suggestions&action=viewSuggestion&id=6', 'live_help', 'light-green', '0', '2018-01-24 18:22:44');
INSERT INTO `notifications` VALUES ('1422', 'A suggestion has been updated! Click to view!', '46', '?controller=suggestions&action=viewSuggestion&id=6', 'live_help', 'light-green', '0', '2018-01-24 18:22:44');
INSERT INTO `notifications` VALUES ('1423', 'A suggestion has been updated! Click to view!', '42', '?controller=suggestions&action=viewSuggestion&id=6', 'live_help', 'light-green', '0', '2018-01-24 18:22:44');
INSERT INTO `notifications` VALUES ('1424', 'A suggestion has been updated! Click to view!', '41', '?controller=suggestions&action=viewSuggestion&id=6', 'live_help', 'light-green', '0', '2018-01-24 18:22:44');
INSERT INTO `notifications` VALUES ('1425', 'A suggestion has been updated! Click to view!', '40', '?controller=suggestions&action=viewSuggestion&id=6', 'live_help', 'light-green', '0', '2018-01-24 18:22:44');
INSERT INTO `notifications` VALUES ('1426', 'A suggestion has been updated! Click to view!', '36', '?controller=suggestions&action=viewSuggestion&id=6', 'live_help', 'light-green', '0', '2018-01-24 18:22:44');
INSERT INTO `notifications` VALUES ('1427', 'A suggestion has been updated! Click to view!', '31', '?controller=suggestions&action=viewSuggestion&id=6', 'live_help', 'light-green', '0', '2018-01-24 18:22:44');
INSERT INTO `notifications` VALUES ('1428', 'A suggestion has been updated! Click to view!', '27', '?controller=suggestions&action=viewSuggestion&id=6', 'live_help', 'light-green', '0', '2018-01-24 18:22:44');
INSERT INTO `notifications` VALUES ('1429', 'A suggestion has been updated! Click to view!', '26', '?controller=suggestions&action=viewSuggestion&id=6', 'live_help', 'light-green', '0', '2018-01-24 18:22:44');
INSERT INTO `notifications` VALUES ('1430', 'A suggestion has been updated! Click to view!', '24', '?controller=suggestions&action=viewSuggestion&id=6', 'live_help', 'light-green', '0', '2018-01-24 18:22:44');
INSERT INTO `notifications` VALUES ('1431', 'A suggestion has been updated! Click to view!', '23', '?controller=suggestions&action=viewSuggestion&id=6', 'live_help', 'light-green', '0', '2018-01-24 18:22:44');
INSERT INTO `notifications` VALUES ('1432', 'A suggestion has been updated! Click to view!', '22', '?controller=suggestions&action=viewSuggestion&id=6', 'live_help', 'light-green', '0', '2018-01-24 18:22:44');
INSERT INTO `notifications` VALUES ('1433', 'A suggestion has been updated! Click to view!', '16', '?controller=suggestions&action=viewSuggestion&id=6', 'live_help', 'light-green', '0', '2018-01-24 18:22:44');
INSERT INTO `notifications` VALUES ('1434', 'A suggestion has been updated! Click to view!', '15', '?controller=suggestions&action=viewSuggestion&id=6', 'live_help', 'light-green', '0', '2018-01-24 18:22:44');
INSERT INTO `notifications` VALUES ('1435', 'A suggestion has been updated! Click to view!', '14', '?controller=suggestions&action=viewSuggestion&id=6', 'live_help', 'light-green', '0', '2018-01-24 18:22:44');
INSERT INTO `notifications` VALUES ('1436', 'A suggestion has been updated! Click to view!', '81', '?controller=suggestions&action=viewSuggestion&id=6', 'live_help', 'light-green', '0', '2018-01-24 18:22:44');
INSERT INTO `notifications` VALUES ('1437', 'You have been migrated to batch HNBTR-M-5. Click to view!', '49', '?controller=students&action=showStudentProfile&uname=test_linkadsasd', 'domain', 'teal', '0', '2018-01-25 17:34:28');
INSERT INTO `notifications` VALUES ('1438', 'Batch of student Asdasdasd Asdasdasd has been updated to batch HNBTR-M-5. Click to view!', '28', '?controller=students&action=showStudentProfile&uname=test_linkadsasd', 'domain', 'teal', '0', '2018-01-25 17:34:28');
INSERT INTO `notifications` VALUES ('1439', 'Batch of student Asdasdasd Asdasdasd has been updated to batch HNBTR-M-5. Click to view!', '21', '?controller=students&action=showStudentProfile&uname=test_linkadsasd', 'domain', 'teal', '0', '2018-01-25 17:34:28');
INSERT INTO `notifications` VALUES ('1440', 'Batch of student Asdasdasd Asdasdasd has been updated to batch HNBTR-M-5. Click to view!', '20', '?controller=students&action=showStudentProfile&uname=test_linkadsasd', 'domain', 'teal', '0', '2018-01-25 17:34:28');
INSERT INTO `notifications` VALUES ('1441', 'Batch of student Asdasdasd Asdasdasd has been updated to batch HNBTR-M-5. Click to view!', '19', '?controller=students&action=showStudentProfile&uname=test_linkadsasd', 'domain', 'teal', '0', '2018-01-25 17:34:28');
INSERT INTO `notifications` VALUES ('1442', 'Batch of student Asdasdasd Asdasdasd has been updated to batch HNBTR-M-5. Click to view!', '1', '?controller=students&action=showStudentProfile&uname=test_linkadsasd', 'domain', 'teal', '0', '2018-01-25 17:34:28');
INSERT INTO `notifications` VALUES ('1443', 'Batch of student Asdasdasd Asdasdasd has been updated to batch HNBTR-M-5. Click to view!', '51', '?controller=students&action=showStudentProfile&uname=test_linkadsasd', 'domain', 'teal', '0', '2018-01-25 17:34:28');
INSERT INTO `notifications` VALUES ('1444', 'Batch of student Asdasdasd Asdasdasd has been updated to batch HNBTR-M-5. Click to view!', '47', '?controller=students&action=showStudentProfile&uname=test_linkadsasd', 'domain', 'teal', '0', '2018-01-25 17:34:28');
INSERT INTO `notifications` VALUES ('1445', 'Batch of student Asdasdasd Asdasdasd has been updated to batch HNBTR-M-5. Click to view!', '46', '?controller=students&action=showStudentProfile&uname=test_linkadsasd', 'domain', 'teal', '0', '2018-01-25 17:34:28');
INSERT INTO `notifications` VALUES ('1446', 'Batch of student Asdasdasd Asdasdasd has been updated to batch HNBTR-M-5. Click to view!', '42', '?controller=students&action=showStudentProfile&uname=test_linkadsasd', 'domain', 'teal', '0', '2018-01-25 17:34:28');
INSERT INTO `notifications` VALUES ('1447', 'Batch of student Asdasdasd Asdasdasd has been updated to batch HNBTR-M-5. Click to view!', '41', '?controller=students&action=showStudentProfile&uname=test_linkadsasd', 'domain', 'teal', '0', '2018-01-25 17:34:28');
INSERT INTO `notifications` VALUES ('1448', 'Batch of student Asdasdasd Asdasdasd has been updated to batch HNBTR-M-5. Click to view!', '40', '?controller=students&action=showStudentProfile&uname=test_linkadsasd', 'domain', 'teal', '0', '2018-01-25 17:34:28');
INSERT INTO `notifications` VALUES ('1449', 'Batch of student Asdasdasd Asdasdasd has been updated to batch HNBTR-M-5. Click to view!', '36', '?controller=students&action=showStudentProfile&uname=test_linkadsasd', 'domain', 'teal', '0', '2018-01-25 17:34:29');
INSERT INTO `notifications` VALUES ('1450', 'Batch of student Asdasdasd Asdasdasd has been updated to batch HNBTR-M-5. Click to view!', '31', '?controller=students&action=showStudentProfile&uname=test_linkadsasd', 'domain', 'teal', '0', '2018-01-25 17:34:29');
INSERT INTO `notifications` VALUES ('1451', 'Batch of student Asdasdasd Asdasdasd has been updated to batch HNBTR-M-5. Click to view!', '27', '?controller=students&action=showStudentProfile&uname=test_linkadsasd', 'domain', 'teal', '0', '2018-01-25 17:34:29');
INSERT INTO `notifications` VALUES ('1452', 'Batch of student Asdasdasd Asdasdasd has been updated to batch HNBTR-M-5. Click to view!', '26', '?controller=students&action=showStudentProfile&uname=test_linkadsasd', 'domain', 'teal', '0', '2018-01-25 17:34:29');
INSERT INTO `notifications` VALUES ('1453', 'Batch of student Asdasdasd Asdasdasd has been updated to batch HNBTR-M-5. Click to view!', '24', '?controller=students&action=showStudentProfile&uname=test_linkadsasd', 'domain', 'teal', '0', '2018-01-25 17:34:29');
INSERT INTO `notifications` VALUES ('1454', 'Batch of student Asdasdasd Asdasdasd has been updated to batch HNBTR-M-5. Click to view!', '23', '?controller=students&action=showStudentProfile&uname=test_linkadsasd', 'domain', 'teal', '0', '2018-01-25 17:34:29');
INSERT INTO `notifications` VALUES ('1455', 'Batch of student Asdasdasd Asdasdasd has been updated to batch HNBTR-M-5. Click to view!', '22', '?controller=students&action=showStudentProfile&uname=test_linkadsasd', 'domain', 'teal', '0', '2018-01-25 17:34:29');
INSERT INTO `notifications` VALUES ('1456', 'Batch of student Asdasdasd Asdasdasd has been updated to batch HNBTR-M-5. Click to view!', '16', '?controller=students&action=showStudentProfile&uname=test_linkadsasd', 'domain', 'teal', '0', '2018-01-25 17:34:29');
INSERT INTO `notifications` VALUES ('1457', 'Batch of student Asdasdasd Asdasdasd has been updated to batch HNBTR-M-5. Click to view!', '15', '?controller=students&action=showStudentProfile&uname=test_linkadsasd', 'domain', 'teal', '0', '2018-01-25 17:34:29');
INSERT INTO `notifications` VALUES ('1458', 'Batch of student Asdasdasd Asdasdasd has been updated to batch HNBTR-M-5. Click to view!', '14', '?controller=students&action=showStudentProfile&uname=test_linkadsasd', 'domain', 'teal', '0', '2018-01-25 17:34:29');
INSERT INTO `notifications` VALUES ('1459', 'Batch of student Asdasdasd Asdasdasd has been updated to batch HNBTR-M-5. Click to view!', '81', '?controller=students&action=showStudentProfile&uname=test_linkadsasd', 'domain', 'teal', '0', '2018-01-25 17:34:29');
INSERT INTO `notifications` VALUES ('1460', 'You have been migrated to batch HNBTR-M-5. Click to view!', '48', '?controller=students&action=showStudentProfile&uname=test_link', 'domain', 'teal', '0', '2018-01-25 17:34:41');
INSERT INTO `notifications` VALUES ('1461', 'Batch of student Test Link Test Link has been updated to batch HNBTR-M-5. Click to view!', '28', '?controller=students&action=showStudentProfile&uname=test_link', 'domain', 'teal', '0', '2018-01-25 17:34:41');
INSERT INTO `notifications` VALUES ('1462', 'Batch of student Test Link Test Link has been updated to batch HNBTR-M-5. Click to view!', '21', '?controller=students&action=showStudentProfile&uname=test_link', 'domain', 'teal', '0', '2018-01-25 17:34:41');
INSERT INTO `notifications` VALUES ('1463', 'Batch of student Test Link Test Link has been updated to batch HNBTR-M-5. Click to view!', '20', '?controller=students&action=showStudentProfile&uname=test_link', 'domain', 'teal', '0', '2018-01-25 17:34:41');
INSERT INTO `notifications` VALUES ('1464', 'Batch of student Test Link Test Link has been updated to batch HNBTR-M-5. Click to view!', '19', '?controller=students&action=showStudentProfile&uname=test_link', 'domain', 'teal', '0', '2018-01-25 17:34:41');
INSERT INTO `notifications` VALUES ('1465', 'Batch of student Test Link Test Link has been updated to batch HNBTR-M-5. Click to view!', '1', '?controller=students&action=showStudentProfile&uname=test_link', 'domain', 'teal', '0', '2018-01-25 17:34:41');
INSERT INTO `notifications` VALUES ('1466', 'Batch of student Test Link Test Link has been updated to batch HNBTR-M-5. Click to view!', '51', '?controller=students&action=showStudentProfile&uname=test_link', 'domain', 'teal', '0', '2018-01-25 17:34:41');
INSERT INTO `notifications` VALUES ('1467', 'Batch of student Test Link Test Link has been updated to batch HNBTR-M-5. Click to view!', '47', '?controller=students&action=showStudentProfile&uname=test_link', 'domain', 'teal', '0', '2018-01-25 17:34:41');
INSERT INTO `notifications` VALUES ('1468', 'Batch of student Test Link Test Link has been updated to batch HNBTR-M-5. Click to view!', '46', '?controller=students&action=showStudentProfile&uname=test_link', 'domain', 'teal', '0', '2018-01-25 17:34:41');
INSERT INTO `notifications` VALUES ('1469', 'Batch of student Test Link Test Link has been updated to batch HNBTR-M-5. Click to view!', '42', '?controller=students&action=showStudentProfile&uname=test_link', 'domain', 'teal', '0', '2018-01-25 17:34:41');
INSERT INTO `notifications` VALUES ('1470', 'Batch of student Test Link Test Link has been updated to batch HNBTR-M-5. Click to view!', '41', '?controller=students&action=showStudentProfile&uname=test_link', 'domain', 'teal', '0', '2018-01-25 17:34:41');
INSERT INTO `notifications` VALUES ('1471', 'Batch of student Test Link Test Link has been updated to batch HNBTR-M-5. Click to view!', '40', '?controller=students&action=showStudentProfile&uname=test_link', 'domain', 'teal', '0', '2018-01-25 17:34:41');
INSERT INTO `notifications` VALUES ('1472', 'Batch of student Test Link Test Link has been updated to batch HNBTR-M-5. Click to view!', '36', '?controller=students&action=showStudentProfile&uname=test_link', 'domain', 'teal', '0', '2018-01-25 17:34:41');
INSERT INTO `notifications` VALUES ('1473', 'Batch of student Test Link Test Link has been updated to batch HNBTR-M-5. Click to view!', '31', '?controller=students&action=showStudentProfile&uname=test_link', 'domain', 'teal', '0', '2018-01-25 17:34:41');
INSERT INTO `notifications` VALUES ('1474', 'Batch of student Test Link Test Link has been updated to batch HNBTR-M-5. Click to view!', '27', '?controller=students&action=showStudentProfile&uname=test_link', 'domain', 'teal', '0', '2018-01-25 17:34:42');
INSERT INTO `notifications` VALUES ('1475', 'Batch of student Test Link Test Link has been updated to batch HNBTR-M-5. Click to view!', '26', '?controller=students&action=showStudentProfile&uname=test_link', 'domain', 'teal', '0', '2018-01-25 17:34:42');
INSERT INTO `notifications` VALUES ('1476', 'Batch of student Test Link Test Link has been updated to batch HNBTR-M-5. Click to view!', '24', '?controller=students&action=showStudentProfile&uname=test_link', 'domain', 'teal', '0', '2018-01-25 17:34:42');
INSERT INTO `notifications` VALUES ('1477', 'Batch of student Test Link Test Link has been updated to batch HNBTR-M-5. Click to view!', '23', '?controller=students&action=showStudentProfile&uname=test_link', 'domain', 'teal', '0', '2018-01-25 17:34:42');
INSERT INTO `notifications` VALUES ('1478', 'Batch of student Test Link Test Link has been updated to batch HNBTR-M-5. Click to view!', '22', '?controller=students&action=showStudentProfile&uname=test_link', 'domain', 'teal', '0', '2018-01-25 17:34:42');
INSERT INTO `notifications` VALUES ('1479', 'Batch of student Test Link Test Link has been updated to batch HNBTR-M-5. Click to view!', '16', '?controller=students&action=showStudentProfile&uname=test_link', 'domain', 'teal', '0', '2018-01-25 17:34:42');
INSERT INTO `notifications` VALUES ('1480', 'Batch of student Test Link Test Link has been updated to batch HNBTR-M-5. Click to view!', '15', '?controller=students&action=showStudentProfile&uname=test_link', 'domain', 'teal', '0', '2018-01-25 17:34:42');
INSERT INTO `notifications` VALUES ('1481', 'Batch of student Test Link Test Link has been updated to batch HNBTR-M-5. Click to view!', '14', '?controller=students&action=showStudentProfile&uname=test_link', 'domain', 'teal', '0', '2018-01-25 17:34:42');
INSERT INTO `notifications` VALUES ('1482', 'Batch of student Test Link Test Link has been updated to batch HNBTR-M-5. Click to view!', '81', '?controller=students&action=showStudentProfile&uname=test_link', 'domain', 'teal', '0', '2018-01-25 17:34:42');
INSERT INTO `notifications` VALUES ('1483', 'You have been migrated to batch JLB-M-1. Click to view!', '43', '?controller=students&action=showStudentProfile&uname=student_8989', 'domain', 'teal', '0', '2018-01-25 17:36:29');
INSERT INTO `notifications` VALUES ('1484', 'Batch of student Student 8989 Student 8989 has been updated to batch JLB-M-1. Click to view!', '28', '?controller=students&action=showStudentProfile&uname=student_8989', 'domain', 'teal', '0', '2018-01-25 17:36:29');
INSERT INTO `notifications` VALUES ('1485', 'Batch of student Student 8989 Student 8989 has been updated to batch JLB-M-1. Click to view!', '21', '?controller=students&action=showStudentProfile&uname=student_8989', 'domain', 'teal', '0', '2018-01-25 17:36:29');
INSERT INTO `notifications` VALUES ('1486', 'Batch of student Student 8989 Student 8989 has been updated to batch JLB-M-1. Click to view!', '20', '?controller=students&action=showStudentProfile&uname=student_8989', 'domain', 'teal', '0', '2018-01-25 17:36:29');
INSERT INTO `notifications` VALUES ('1487', 'Batch of student Student 8989 Student 8989 has been updated to batch JLB-M-1. Click to view!', '19', '?controller=students&action=showStudentProfile&uname=student_8989', 'domain', 'teal', '0', '2018-01-25 17:36:29');
INSERT INTO `notifications` VALUES ('1488', 'Batch of student Student 8989 Student 8989 has been updated to batch JLB-M-1. Click to view!', '1', '?controller=students&action=showStudentProfile&uname=student_8989', 'domain', 'teal', '0', '2018-01-25 17:36:29');
INSERT INTO `notifications` VALUES ('1489', 'Batch of student Student 8989 Student 8989 has been updated to batch JLB-M-1. Click to view!', '51', '?controller=students&action=showStudentProfile&uname=student_8989', 'domain', 'teal', '0', '2018-01-25 17:36:29');
INSERT INTO `notifications` VALUES ('1490', 'Batch of student Student 8989 Student 8989 has been updated to batch JLB-M-1. Click to view!', '47', '?controller=students&action=showStudentProfile&uname=student_8989', 'domain', 'teal', '0', '2018-01-25 17:36:29');
INSERT INTO `notifications` VALUES ('1491', 'Batch of student Student 8989 Student 8989 has been updated to batch JLB-M-1. Click to view!', '46', '?controller=students&action=showStudentProfile&uname=student_8989', 'domain', 'teal', '0', '2018-01-25 17:36:29');
INSERT INTO `notifications` VALUES ('1492', 'Batch of student Student 8989 Student 8989 has been updated to batch JLB-M-1. Click to view!', '42', '?controller=students&action=showStudentProfile&uname=student_8989', 'domain', 'teal', '0', '2018-01-25 17:36:29');
INSERT INTO `notifications` VALUES ('1493', 'Batch of student Student 8989 Student 8989 has been updated to batch JLB-M-1. Click to view!', '41', '?controller=students&action=showStudentProfile&uname=student_8989', 'domain', 'teal', '0', '2018-01-25 17:36:29');
INSERT INTO `notifications` VALUES ('1494', 'Batch of student Student 8989 Student 8989 has been updated to batch JLB-M-1. Click to view!', '40', '?controller=students&action=showStudentProfile&uname=student_8989', 'domain', 'teal', '0', '2018-01-25 17:36:29');
INSERT INTO `notifications` VALUES ('1495', 'Batch of student Student 8989 Student 8989 has been updated to batch JLB-M-1. Click to view!', '36', '?controller=students&action=showStudentProfile&uname=student_8989', 'domain', 'teal', '0', '2018-01-25 17:36:29');
INSERT INTO `notifications` VALUES ('1496', 'Batch of student Student 8989 Student 8989 has been updated to batch JLB-M-1. Click to view!', '31', '?controller=students&action=showStudentProfile&uname=student_8989', 'domain', 'teal', '0', '2018-01-25 17:36:29');
INSERT INTO `notifications` VALUES ('1497', 'Batch of student Student 8989 Student 8989 has been updated to batch JLB-M-1. Click to view!', '27', '?controller=students&action=showStudentProfile&uname=student_8989', 'domain', 'teal', '0', '2018-01-25 17:36:29');
INSERT INTO `notifications` VALUES ('1498', 'Batch of student Student 8989 Student 8989 has been updated to batch JLB-M-1. Click to view!', '26', '?controller=students&action=showStudentProfile&uname=student_8989', 'domain', 'teal', '0', '2018-01-25 17:36:29');
INSERT INTO `notifications` VALUES ('1499', 'Batch of student Student 8989 Student 8989 has been updated to batch JLB-M-1. Click to view!', '24', '?controller=students&action=showStudentProfile&uname=student_8989', 'domain', 'teal', '0', '2018-01-25 17:36:29');
INSERT INTO `notifications` VALUES ('1500', 'Batch of student Student 8989 Student 8989 has been updated to batch JLB-M-1. Click to view!', '23', '?controller=students&action=showStudentProfile&uname=student_8989', 'domain', 'teal', '0', '2018-01-25 17:36:29');
INSERT INTO `notifications` VALUES ('1501', 'Batch of student Student 8989 Student 8989 has been updated to batch JLB-M-1. Click to view!', '22', '?controller=students&action=showStudentProfile&uname=student_8989', 'domain', 'teal', '0', '2018-01-25 17:36:29');
INSERT INTO `notifications` VALUES ('1502', 'Batch of student Student 8989 Student 8989 has been updated to batch JLB-M-1. Click to view!', '16', '?controller=students&action=showStudentProfile&uname=student_8989', 'domain', 'teal', '0', '2018-01-25 17:36:29');
INSERT INTO `notifications` VALUES ('1503', 'Batch of student Student 8989 Student 8989 has been updated to batch JLB-M-1. Click to view!', '15', '?controller=students&action=showStudentProfile&uname=student_8989', 'domain', 'teal', '0', '2018-01-25 17:36:29');
INSERT INTO `notifications` VALUES ('1504', 'Batch of student Student 8989 Student 8989 has been updated to batch JLB-M-1. Click to view!', '14', '?controller=students&action=showStudentProfile&uname=student_8989', 'domain', 'teal', '0', '2018-01-25 17:36:29');
INSERT INTO `notifications` VALUES ('1505', 'Batch of student Student 8989 Student 8989 has been updated to batch JLB-M-1. Click to view!', '81', '?controller=students&action=showStudentProfile&uname=student_8989', 'domain', 'teal', '0', '2018-01-25 17:36:29');

-- ----------------------------
-- Table structure for relationships
-- ----------------------------
DROP TABLE IF EXISTS `relationships`;
CREATE TABLE `relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of relationships
-- ----------------------------
INSERT INTO `relationships` VALUES ('1', 'Father', '1');
INSERT INTO `relationships` VALUES ('2', 'Mother', '1');
INSERT INTO `relationships` VALUES ('3', 'Son', '2');
INSERT INTO `relationships` VALUES ('4', 'Daughter', '2');
INSERT INTO `relationships` VALUES ('5', 'Brother', '2');
INSERT INTO `relationships` VALUES ('6', 'Sister', '2');
INSERT INTO `relationships` VALUES ('7', 'Husband', '1');
INSERT INTO `relationships` VALUES ('8', 'Wife', '1');
INSERT INTO `relationships` VALUES ('9', 'Grandfather', '1');
INSERT INTO `relationships` VALUES ('10', 'Grandmother', '1');
INSERT INTO `relationships` VALUES ('11', 'Cousin', '2');
INSERT INTO `relationships` VALUES ('12', 'Grandson', '2');
INSERT INTO `relationships` VALUES ('13', 'Granddaughter', '2');
INSERT INTO `relationships` VALUES ('14', 'Uncle', '2');
INSERT INTO `relationships` VALUES ('15', 'Aunt', '2');
INSERT INTO `relationships` VALUES ('16', 'Nephew', '2');
INSERT INTO `relationships` VALUES ('17', 'Niece', '2');
INSERT INTO `relationships` VALUES ('18', 'Other', '2');

-- ----------------------------
-- Table structure for reset_password_links
-- ----------------------------
DROP TABLE IF EXISTS `reset_password_links`;
CREATE TABLE `reset_password_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `exp` tinyint(1) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `reset_user` (`user_id`),
  CONSTRAINT `reset_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of reset_password_links
-- ----------------------------
INSERT INTO `reset_password_links` VALUES ('13', '1', 'f34ce5d450b32936a95645581f4cbf3f', '1', '2018-01-09 10:48:42');
INSERT INTO `reset_password_links` VALUES ('14', '1', '6f6beda67ad8281f883bef66845c5d6c', '1', '2018-01-09 11:00:05');
INSERT INTO `reset_password_links` VALUES ('15', '1', 'e8634045b3f35c003afb75b9486d1f04', '1', '2018-01-09 11:06:26');
INSERT INTO `reset_password_links` VALUES ('16', '1', '5b1096e67f36ab46e8234bfb9c45e9cb', '1', '2018-01-09 11:31:28');
INSERT INTO `reset_password_links` VALUES ('17', '1', '8f8fde5b70da079e8f575845e9032d65', '1', '2018-01-09 11:33:00');
INSERT INTO `reset_password_links` VALUES ('18', '1', '6a3bdf4a581247bf3c0cfba64683390a', '1', '2018-01-09 11:34:50');
INSERT INTO `reset_password_links` VALUES ('19', '1', 'd198eebd6d020ce1e81038ad6290e6e2', '1', '2018-01-09 11:35:56');
INSERT INTO `reset_password_links` VALUES ('20', '1', 'ddb2c9232440e32965b51addd3af1501', '1', '2018-01-09 11:42:04');
INSERT INTO `reset_password_links` VALUES ('21', '1', '494141808f928ad115bce465b40299c5', '1', '2018-01-09 11:44:02');
INSERT INTO `reset_password_links` VALUES ('22', '1', '03d79914f23d85ff759d95600a9f2494', '1', '2018-01-09 11:44:44');
INSERT INTO `reset_password_links` VALUES ('23', '1', '28d35bcb638ed8b3d738911b84c1f92a', '1', '2018-01-09 11:46:18');
INSERT INTO `reset_password_links` VALUES ('24', '1', 'ee289e98147e6674ddb87a784528daf5', '1', '2018-01-09 11:47:18');
INSERT INTO `reset_password_links` VALUES ('27', '1', '5839077ddbc606d192845257830fc2db', null, '2018-01-10 10:27:18');
INSERT INTO `reset_password_links` VALUES ('28', '401', '09f274803d781e05c90dc191942a7d0f', '1', '2018-01-10 14:02:14');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'SuperAdministrator');
INSERT INTO `roles` VALUES ('2', 'Administrator');
INSERT INTO `roles` VALUES ('3', 'Employee');
INSERT INTO `roles` VALUES ('4', 'Student');

-- ----------------------------
-- Table structure for sexes
-- ----------------------------
DROP TABLE IF EXISTS `sexes`;
CREATE TABLE `sexes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sexes
-- ----------------------------
INSERT INTO `sexes` VALUES ('1', 'Male');
INSERT INTO `sexes` VALUES ('2', 'Female');
INSERT INTO `sexes` VALUES ('3', 'Other...');

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `roll` int(10) DEFAULT NULL,
  `fatherName` varchar(100) DEFAULT NULL,
  `motherName` varchar(100) DEFAULT NULL,
  `nationality` varchar(100) DEFAULT NULL,
  `dob` int(12) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `contact1` varchar(11) DEFAULT NULL,
  `contact2` varchar(11) DEFAULT NULL,
  `contact3` varchar(11) DEFAULT NULL,
  `presentAddress` varchar(500) DEFAULT NULL,
  `permanentAddress` varchar(500) DEFAULT NULL,
  `passport_no` varchar(30) DEFAULT NULL,
  `passport_issue` int(12) DEFAULT NULL,
  `passport_expiration` int(12) DEFAULT NULL,
  `study_status` int(11) DEFAULT NULL,
  `school_to_enroll` varchar(100) DEFAULT NULL,
  `study_subject` varchar(100) DEFAULT NULL,
  `study_plan_details` varchar(500) DEFAULT NULL,
  `supporter_name` varchar(100) DEFAULT NULL,
  `supporter_relationship` int(11) DEFAULT NULL,
  `supporter_address` varchar(500) DEFAULT NULL,
  `supporter_contact` varchar(11) DEFAULT NULL,
  `supporter_income` int(10) DEFAULT NULL,
  `supporter_expense` int(10) DEFAULT NULL,
  `mothod_of_payment` varchar(50) DEFAULT NULL,
  `support_other_students` varchar(1000) DEFAULT NULL,
  `study_purpose` varchar(10000) DEFAULT NULL,
  `additional` varchar(10000) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `delete_date` int(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `batch` (`batch`),
  KEY `sex` (`sex`),
  KEY `study_status` (`study_status`),
  KEY `supporter_relation` (`supporter_relationship`),
  CONSTRAINT `batch` FOREIGN KEY (`batch`) REFERENCES `batches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sex` FOREIGN KEY (`sex`) REFERENCES `sexes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `study_status` FOREIGN KEY (`study_status`) REFERENCES `study_statuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supporter_relation` FOREIGN KEY (`supporter_relationship`) REFERENCES `relationships` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES ('14', '52', '93', '1', 'Father Updated', 'Mother Updated', 'Bangladeshi Updated', '689295600', '1', '01712423410', '01552399900', '029005800', 'Mirpur, Dhaka, Bangladesh', 'Monipur, Dhaka, Bangladesh', 'ertergfghfghbnvbnvcbnvvnvbnvbe', '2070000', '65833200', '1', 'Hello dfg', 'Gello fgf', 'Ello fgf', 'sdfsdf', '6', 'sdfsdfsdfsdfsd', '01712046546', '46544', '45645', 'sdfsdfsdfsdfsdf', 'sdfsdf', 'A bit of code where I am looping through all the select boxes on a page and binding a .hover event to them to do a bit of twiddling with their width on mouse on/off updated.\n\nThis happens on page ready and works just fine. Okay! sdfgsdfgdf asdasd sdf\n\nThe problem I have is that any select boxes I add via Ajax or DOM after the initial loop won\'t have the event bound.', '<ul>\n<li>dwindle dfdf</li>\n<li>ghure&nbsp;</li>\n<li>gayvbnvbn</li>\n<li>&nbsp;not gaysdfsdf</li>\n<li>gayty sadfsdfsdf</li>\n</ul>', '2017-11-04 12:14:46', '2018-01-24 18:18:19', null);
INSERT INTO `students` VALUES ('15', '50', '93', '2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-11-04 12:15:59', '2017-12-26 17:39:48', null);
INSERT INTO `students` VALUES ('16', '49', '94', '2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-11-04 12:16:55', '2018-01-25 17:34:28', null);
INSERT INTO `students` VALUES ('17', '48', '94', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-11-04 12:18:00', '2018-01-25 17:34:41', null);
INSERT INTO `students` VALUES ('18', '48', '94', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-11-04 12:19:30', '2018-01-25 17:34:41', '1514288378');
INSERT INTO `students` VALUES ('19', '48', '94', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-11-04 12:20:13', '2018-01-25 17:34:41', '1514288378');
INSERT INTO `students` VALUES ('20', '44', '93', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-11-04 12:22:52', '2018-01-07 18:04:38', '1514288378');
INSERT INTO `students` VALUES ('21', '44', '93', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-11-04 12:53:45', '2018-01-07 18:04:38', '1514288378');
INSERT INTO `students` VALUES ('22', '44', '93', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-11-04 12:56:35', '2018-01-07 18:04:38', null);
INSERT INTO `students` VALUES ('30', '92', '94', '1', 'null', 'null', 'null', '0', '1', 'null', 'null', 'null', 'null', 'null', 'null', '0', '0', '1', 'null', 'null', 'null', 'null', '1', 'null', 'null', '0', '0', 'null', 'null', 'null', 'null', '0000-00-00 00:00:00', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `students` VALUES ('31', '43', '95', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-12-26 17:41:57', '2018-01-25 17:36:29', null);
INSERT INTO `students` VALUES ('34', '402', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-01-24 16:48:19', null, null);
INSERT INTO `students` VALUES ('37', '404', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-01-24 16:54:10', '2018-01-24 17:30:43', '1516793443');
INSERT INTO `students` VALUES ('38', '403', null, null, 'Father', 'Mother', 'Asdasdsdssdssd', '-3600', '1', '01712423414', '01552399908', '02960585', 'sdasdasdasd', 'asdasdasdasd', 'asdasdasdasdasdasdasdasdasd', '-3600', '2588400', '4', 'asdasdasd', 'asdasdasd', 'asdasdasd', 'asdasd', '1', 'asdasdasd', '01712423414', '250006', '343568', 'asdasdasd', '', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', '<p><strong style=\"margin: 0px; padding: 0px; font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</span></p>', '2018-01-24 16:54:50', '2018-01-24 17:56:56', null);
INSERT INTO `students` VALUES ('39', '404', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-01-24 17:30:37', '2018-01-24 17:30:43', '1516793443');

-- ----------------------------
-- Table structure for student_carrer_records
-- ----------------------------
DROP TABLE IF EXISTS `student_carrer_records`;
CREATE TABLE `student_carrer_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `organization` varchar(100) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `occupation` varchar(100) DEFAULT NULL,
  `start_date` int(12) DEFAULT NULL,
  `end_date` int(12) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `delete_date` int(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cr_user_id` (`user_id`),
  CONSTRAINT `cr_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of student_carrer_records
-- ----------------------------
INSERT INTO `student_carrer_records` VALUES ('1', '52', 'sdfsdfsdf Organization', 'sdfsdfsdf Address', 'sdfsdfsdf Occupation', '1506808800', '1514588400', '2017-11-23 16:38:36', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `student_carrer_records` VALUES ('2', '52', 'new Organization', 'new updated updated Address', 'new updated Organization', '1477954800', '1480460400', '2017-11-23 17:10:38', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `student_carrer_records` VALUES ('3', '52', 'sdfsdfsdf uiiui', 'qwqwqwqw', 'klklklkl', '1498168800', '1500760800', '2017-11-23 17:13:48', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `student_carrer_records` VALUES ('4', '52', 'xcvxcv', 'xcvxcv', 'xcvxcv', '1448233200', '1448838000', '2017-11-23 17:17:35', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `student_carrer_records` VALUES ('5', '52', 'sdfsdf', 'sdfsdfsdf', 'sdfsdf', '1471903200', '1474581600', '2017-11-23 17:27:53', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `student_carrer_records` VALUES ('6', '52', 'fghfg', 'hfghfghfg', 'fghfg', '1414537200', '1417215600', '2017-11-29 16:32:57', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `student_carrer_records` VALUES ('7', '52', 'DJITR', 'SDFSDFSDF', 'GOTO', '1515538800', '1517353200', '2018-01-10 13:22:59', '2018-01-10 13:23:43', null);
INSERT INTO `student_carrer_records` VALUES ('8', '403', 'New Aloa asdasd', 'asdasdasd', 'Aloaoa', '1516748400', '1519772400', '2018-01-24 17:52:36', '2018-01-24 17:54:03', null);
INSERT INTO `student_carrer_records` VALUES ('9', '403', 'asdasd', 'asdasd', 'asdasdasd', '1453590000', '1485212400', '2018-01-24 17:52:59', null, null);
INSERT INTO `student_carrer_records` VALUES ('10', '403', 'asdasd', 'asdasdasd', 'asdasd', '1548284400', '1579820400', '2018-01-24 17:53:31', '2018-01-24 17:54:11', '1516794851');

-- ----------------------------
-- Table structure for student_family
-- ----------------------------
DROP TABLE IF EXISTS `student_family`;
CREATE TABLE `student_family` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `relationship` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `dob` int(12) DEFAULT NULL,
  `nationality` varchar(100) DEFAULT NULL,
  `occupation` varchar(100) DEFAULT NULL,
  `present_address` varchar(500) DEFAULT NULL,
  `permanent_address` varchar(500) DEFAULT NULL,
  `residence_with_applicant` tinyint(1) DEFAULT NULL,
  `school_employment_place` varchar(100) DEFAULT NULL,
  `residence_card_status` varchar(100) DEFAULT NULL,
  `residence_card_number` varchar(20) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `delete_date` int(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `family_user_id` (`user_id`),
  KEY `relationship` (`relationship`),
  CONSTRAINT `family_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relationship` FOREIGN KEY (`relationship`) REFERENCES `relationships` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of student_family
-- ----------------------------
INSERT INTO `student_family` VALUES ('1', '52', '1', 'Asdasdasd Dfgdfg', '565138800', 'Asdasd Ds', 'asdasd', 'asdasd fg', 'asdasdasdasd fgf', '0', null, null, null, '2017-11-29 14:42:31', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `student_family` VALUES ('9', '52', '10', 'Dfgdfgdf', '186447600', 'Dfgdf', 'gdfgdf', 'gdfgdfg', 'dfgdfgdfg', '0', null, null, null, '2017-11-29 16:07:51', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `student_family` VALUES ('11', '52', '11', 'Sdfsdfsdf', '249606000', 'Sdfsdf', 'sdfsdf', 'sdfsdfsdf', 'sdfsdfsdfsdfsdf', '1', 'sdfsdf', 'sdfsdf', 'sdfsdfsdf', '2017-11-29 16:42:37', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `student_family` VALUES ('12', '52', '16', 'Fghfghfgh Fgfg', '691369200', 'Fghfg Fgfg', 'hfghfg fgfg', 'fghfgh fgfg', 'fghfgh fgfg', '0', '', '', '', '2017-11-29 17:15:47', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `student_family` VALUES ('13', '52', '7', 'Asdasdasd', '628297200', 'Asdasdasd', 'asdasdasdasd', 'asdasdasd', 'asdasdasdasdasdasdasdasd', '0', null, null, null, '2017-11-29 17:22:00', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `student_family` VALUES ('14', '52', '12', 'Zxczxczxc', '565138800', 'Zxczxc', 'zxczxc', 'zxczxc', 'zxczxcz', '0', null, null, null, '2017-11-29 17:46:23', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `student_family` VALUES ('15', '52', '12', 'Dfgdfgdfg', '565225200', 'Dfgdf', 'dfgdf', 'gdfgdfgdf', 'gdfgdfgdfgdfg', '2', 'sdfsd', 'fsdfsdf', 'sdfsdfsdf', '2017-11-30 11:28:51', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `student_family` VALUES ('16', '52', '5', 'Sdfsdf', '565225200', 'Sdfsdf', 'sdfsdf', 'sdfsdf', 'sdfsdfsdf', '1', 'dsfsdfsd', 'sdfsdf', 'sdfsdfsdf', '2017-11-30 11:30:23', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `student_family` VALUES ('17', '52', '1', 'Fsdfsdfsdf', '284770800', 'Sdfsdfsdf', 'sdfsdf', 'sdfsdf', 'sdfsdfsdfsdf', '0', '', '', '', '2018-01-10 13:26:17', '2018-01-10 13:31:21', null);
INSERT INTO `student_family` VALUES ('18', '52', '3', 'Sdfsdfsdf', '253234800', 'Sfsdfsdf', 'sdfsdf', 'sdfsdfsdf', 'sdfsdfsdfsdf', '0', '', '', '', '2018-01-10 13:27:05', null, null);
INSERT INTO `student_family` VALUES ('19', '52', '6', 'Dfdfgdfg', '947458800', 'Dfgdfgdfg', 'dfgdfg', 'dfgdfg', 'dfgdfg', '1', 'dfgdfgdfg', 'dfgdfg', 'dfgdfg', '2018-01-10 13:30:13', null, null);
INSERT INTO `student_family` VALUES ('20', '403', '1', 'Asdasd Sdsd Asd', '664671600', 'Asdasd', 'asdasdasd', 'asdasdasd', 'asdasdasdasd', '0', '', '', '', '2018-01-24 18:01:48', '2018-01-24 18:02:36', '1516795356');
INSERT INTO `student_family` VALUES ('21', '403', '1', 'Asdasd', '790902000', 'Asdasd', 'asdasd', 'asdasdasdasd', 'asdasdasd', '0', '', '', '', '2018-01-24 18:03:41', null, null);

-- ----------------------------
-- Table structure for student_langauge_certificates
-- ----------------------------
DROP TABLE IF EXISTS `student_langauge_certificates`;
CREATE TABLE `student_langauge_certificates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `start_date` int(12) DEFAULT NULL,
  `end_date` int(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `test_id` (`test_id`),
  KEY `test_user_id` (`user_id`),
  CONSTRAINT `test_id` FOREIGN KEY (`test_id`) REFERENCES `japanese_language_tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `test_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of student_langauge_certificates
-- ----------------------------
INSERT INTO `student_langauge_certificates` VALUES ('4', '1', '52', '1484002800', '1489100400');
INSERT INTO `student_langauge_certificates` VALUES ('5', '2', '52', null, null);
INSERT INTO `student_langauge_certificates` VALUES ('6', '3', '52', null, null);
INSERT INTO `student_langauge_certificates` VALUES ('16', '1', '403', '1508796000', '1517353200');
INSERT INTO `student_langauge_certificates` VALUES ('17', '2', '403', null, null);
INSERT INTO `student_langauge_certificates` VALUES ('18', '3', '403', null, null);
INSERT INTO `student_langauge_certificates` VALUES ('25', '1', '402', null, null);
INSERT INTO `student_langauge_certificates` VALUES ('26', '2', '402', null, null);
INSERT INTO `student_langauge_certificates` VALUES ('27', '3', '402', null, null);
INSERT INTO `student_langauge_certificates` VALUES ('37', '1', '403', null, null);
INSERT INTO `student_langauge_certificates` VALUES ('38', '2', '403', null, null);
INSERT INTO `student_langauge_certificates` VALUES ('39', '3', '403', null, null);

-- ----------------------------
-- Table structure for student_past_entry
-- ----------------------------
DROP TABLE IF EXISTS `student_past_entry`;
CREATE TABLE `student_past_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `residence_status` varchar(20) DEFAULT NULL,
  `entry_purpose` varchar(500) DEFAULT NULL,
  `start_date` int(12) DEFAULT NULL,
  `end_date` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `delete_date` int(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_user_id` (`user_id`),
  CONSTRAINT `entry_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of student_past_entry
-- ----------------------------
INSERT INTO `student_past_entry` VALUES ('5', '52', 'ghfghfgh', 'fghfghfghfgh', '1477954800', '1480460400', '2017-11-26 17:49:21', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `student_past_entry` VALUES ('6', '52', 'sfsdfsdf', 'sdfsdf', '1414796400', '1448838000', '2017-11-26 18:09:37', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `student_past_entry` VALUES ('7', '52', 'sdfsdfsdf', 'sdfsdfsdf', '1469484000', '1475186400', '2017-11-26 18:11:07', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `student_past_entry` VALUES ('8', '52', 'dfgdfg', 'dfgdfgdfg', '1353884400', '1356476400', '2017-11-26 18:23:23', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `student_past_entry` VALUES ('9', '52', 'dfgdf', 'gdfgdfg', '1509490800', '1510959600', '2017-11-27 10:41:45', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `student_past_entry` VALUES ('10', '52', 'sdfsd', 'sdfsdf', '1480374000', '1482966000', '2017-11-29 11:45:27', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `student_past_entry` VALUES ('11', '52', 'sdfsdf', 'sdfsdf', '1477692000', '1480374000', '2017-11-29 16:32:32', '2017-12-26 17:39:38', '1514288378');
INSERT INTO `student_past_entry` VALUES ('12', '52', 'dsfsdf', 'sdfsdf', '1484089200', '1485817200', '2018-01-10 13:23:23', '2018-01-10 13:23:34', null);
INSERT INTO `student_past_entry` VALUES ('13', '403', 'asdasd asd', 'asdasd', '1485212400', '1485644400', '2018-01-24 17:59:33', '2018-01-24 17:59:48', '1516795188');

-- ----------------------------
-- Table structure for study_statuses
-- ----------------------------
DROP TABLE IF EXISTS `study_statuses`;
CREATE TABLE `study_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of study_statuses
-- ----------------------------
INSERT INTO `study_statuses` VALUES ('1', 'Registered Enrollment');
INSERT INTO `study_statuses` VALUES ('2', 'Graduated');
INSERT INTO `study_statuses` VALUES ('3', 'In School');
INSERT INTO `study_statuses` VALUES ('4', 'Temporary Absence');
INSERT INTO `study_statuses` VALUES ('5', 'Withdrew From School');

-- ----------------------------
-- Table structure for suggestions
-- ----------------------------
DROP TABLE IF EXISTS `suggestions`;
CREATE TABLE `suggestions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) DEFAULT NULL,
  `details` varchar(5000) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `delete_date` int(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `suggestion_user_id` (`user_id`),
  CONSTRAINT `suggestion_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of suggestions
-- ----------------------------
INSERT INTO `suggestions` VALUES ('1', 'Asdasd', '<p>asdasdasd</p>', '52', '2018-01-17 17:02:31', '2018-01-18 16:52:38', '1516272758');
INSERT INTO `suggestions` VALUES ('2', 'Asdasd Updated', '<p>sadasdasd Updated</p>', '52', '2018-01-17 17:32:55', '2018-01-18 14:13:48', '1516263228');
INSERT INTO `suggestions` VALUES ('3', null, null, null, '2018-01-17 17:56:28', null, null);
INSERT INTO `suggestions` VALUES ('4', null, null, null, '2018-01-17 17:56:30', null, null);
INSERT INTO `suggestions` VALUES ('5', 'Tyuty', '<p>sdfsdfsdf&nbsp; Uiuiui</p>', '52', '2018-01-18 14:14:15', null, null);
INSERT INTO `suggestions` VALUES ('6', 'Sdfsdf', '<p>dfsdfsdf Asd</p>', '52', '2018-01-18 16:59:44', '2018-01-24 18:22:44', null);
INSERT INTO `suggestions` VALUES ('7', 'Asdasd Ui', '<p>asdasdasd Ui</p>', '52', '2018-01-18 17:15:18', '2018-01-18 17:50:08', '1516276208');
INSERT INTO `suggestions` VALUES ('8', 'Asdasd', '<p>asdasdasd</p>', '52', '2018-01-18 17:15:53', null, null);
INSERT INTO `suggestions` VALUES ('9', 'Asdasd Updated', '<p>asdasd Updated</p>', '52', '2018-01-18 17:16:46', '2018-01-18 17:51:20', '1516276280');
INSERT INTO `suggestions` VALUES ('10', 'New Suggestion', '<p>Comment</p>', '52', '2018-01-18 17:19:15', null, null);
INSERT INTO `suggestions` VALUES ('11', 'Asdasd', '<p>asdasd</p>', '52', '2018-01-18 17:32:05', '2018-01-18 17:36:42', '1516275402');
INSERT INTO `suggestions` VALUES ('12', 'Asdasd', '<p>asdasdasd</p>', '52', '2018-01-18 17:32:23', '2018-01-18 17:33:35', '1516275215');
INSERT INTO `suggestions` VALUES ('13', 'Asdasd', '<p>asdasd</p>', '52', '2018-01-18 17:32:35', null, null);

-- ----------------------------
-- Table structure for suggestion_comments
-- ----------------------------
DROP TABLE IF EXISTS `suggestion_comments`;
CREATE TABLE `suggestion_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suggestion_comment` varchar(5000) NOT NULL,
  `user_id` int(11) NOT NULL,
  `suggestion_id` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `delete_date` int(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `suggestion_comment_user_id` (`user_id`),
  KEY `comment_suggestion_id` (`suggestion_id`),
  CONSTRAINT `comment_suggestion_id` FOREIGN KEY (`suggestion_id`) REFERENCES `suggestions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `suggestion_comment_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of suggestion_comments
-- ----------------------------
INSERT INTO `suggestion_comments` VALUES ('1', '<p>asdasdasd</p>', '17', '1', '2018-01-18 16:36:51', null, null);
INSERT INTO `suggestion_comments` VALUES ('2', '<p>asdasdasd</p>', '17', '1', '2018-01-18 16:36:59', null, null);
INSERT INTO `suggestion_comments` VALUES ('3', '<p>sdfsdfsdf</p>', '17', '1', '2018-01-18 16:37:50', null, null);
INSERT INTO `suggestion_comments` VALUES ('4', '<p>sdfsdf</p>', '17', '1', '2018-01-18 16:38:01', null, null);
INSERT INTO `suggestion_comments` VALUES ('5', '<p>sdfsdfsdf</p>', '17', '1', '2018-01-18 16:41:07', null, null);
INSERT INTO `suggestion_comments` VALUES ('6', '<p>sdfsdf</p>', '17', '1', '2018-01-18 16:42:15', null, null);
INSERT INTO `suggestion_comments` VALUES ('7', '<p>asdasd Updated</p>', '17', '1', '2018-01-18 16:42:47', '2018-01-18 16:51:42', null);
INSERT INTO `suggestion_comments` VALUES ('8', '<p>asdasd Updated</p>', '17', '1', '2018-01-18 16:42:50', '2018-01-18 16:51:59', '1516272719');
INSERT INTO `suggestion_comments` VALUES ('9', '<p>&nbsp;zxczxc</p>', '17', '5', '2018-01-18 16:54:48', null, null);
INSERT INTO `suggestion_comments` VALUES ('10', '<p>zcxzc</p>', '17', '5', '2018-01-18 16:54:53', null, null);
INSERT INTO `suggestion_comments` VALUES ('11', '<p>gdfgdfg</p>', '17', '5', '2018-01-18 16:55:30', null, null);
INSERT INTO `suggestion_comments` VALUES ('12', '<p>dfgdfdfg&nbsp;</p>', '17', '5', '2018-01-18 16:56:25', '2018-01-18 16:56:33', null);
INSERT INTO `suggestion_comments` VALUES ('13', '<p>sdfsdf</p>', '52', '5', '2018-01-18 16:57:46', '2018-01-18 16:57:58', '1516273078');
INSERT INTO `suggestion_comments` VALUES ('14', '<p>sdfsdf Sdf</p>', '52', '5', '2018-01-18 16:58:01', '2018-01-18 16:58:53', null);
INSERT INTO `suggestion_comments` VALUES ('15', '<p>fsdf</p>', '52', '5', '2018-01-18 16:58:44', null, null);
INSERT INTO `suggestion_comments` VALUES ('16', '<p>dfsdf Asd</p>', '52', '5', '2018-01-18 16:59:00', '2018-01-18 16:59:06', null);
INSERT INTO `suggestion_comments` VALUES ('17', '<p>kjhjkh</p>', '52', '6', '2018-01-18 17:00:25', null, null);
INSERT INTO `suggestion_comments` VALUES ('18', '<p>asdasd</p>', '17', '5', '2018-01-18 17:02:15', null, null);
INSERT INTO `suggestion_comments` VALUES ('19', '<p>dfgdfg</p>', '17', '5', '2018-01-18 17:03:29', null, null);
INSERT INTO `suggestion_comments` VALUES ('20', '<p>dfgdfgdf Gf</p>', '17', '5', '2018-01-18 17:04:35', '2018-01-18 17:04:47', null);
INSERT INTO `suggestion_comments` VALUES ('21', '<p>sdfgdfg</p>', '17', '5', '2018-01-18 17:06:48', null, null);
INSERT INTO `suggestion_comments` VALUES ('22', '<p>sfsdfsd</p>', '52', '5', '2018-01-18 17:07:37', null, null);
INSERT INTO `suggestion_comments` VALUES ('23', '<p>&nbsp;sdfsdfsdf</p>', '1', '10', '2018-01-18 17:26:01', null, null);
INSERT INTO `suggestion_comments` VALUES ('24', '<p>asdasd</p>', '52', '9', '2018-01-18 17:27:19', '2018-01-18 17:30:31', '1516275031');
INSERT INTO `suggestion_comments` VALUES ('25', '<p>asdasdasd Jlkj</p>', '1', '9', '2018-01-18 17:27:49', '2018-01-18 17:30:27', null);
INSERT INTO `suggestion_comments` VALUES ('26', '<p>sfsdfsdf</p>', '17', '9', '2018-01-18 17:29:59', '2018-01-18 17:30:35', '1516275035');
INSERT INTO `suggestion_comments` VALUES ('27', '<p>zxczxc</p>', '17', '9', '2018-01-18 17:30:37', null, null);
INSERT INTO `suggestion_comments` VALUES ('28', '<p>asdasdasd Ads</p>', '52', '9', '2018-01-18 17:32:45', '2018-01-18 17:33:00', '1516275180');
INSERT INTO `suggestion_comments` VALUES ('29', '<p>adasd</p>', '52', '9', '2018-01-18 17:33:03', null, null);
INSERT INTO `suggestion_comments` VALUES ('30', '<p>sdfsdf</p>', '52', '9', '2018-01-18 17:33:45', null, null);
INSERT INTO `suggestion_comments` VALUES ('31', '<p>asdasd</p>', '52', '7', '2018-01-18 17:36:04', null, null);
INSERT INTO `suggestion_comments` VALUES ('32', '<p>sdfsdf</p>', '52', '9', '2018-01-18 17:37:35', null, null);
INSERT INTO `suggestion_comments` VALUES ('33', '<p>asdasd</p>', '1', '7', '2018-01-18 17:44:43', null, null);
INSERT INTO `suggestion_comments` VALUES ('34', '<p>sdfsdf</p>', '1', '13', '2018-01-18 17:45:12', null, null);
INSERT INTO `suggestion_comments` VALUES ('35', '<p>sdfsdf</p>', '1', '7', '2018-01-18 17:48:25', null, null);
INSERT INTO `suggestion_comments` VALUES ('36', '<p>asdasdas</p>', '52', '7', '2018-01-18 17:48:51', null, null);
INSERT INTO `suggestion_comments` VALUES ('37', '<p>asdasd</p>', '52', '7', '2018-01-18 17:49:29', null, null);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `family_name` varchar(100) DEFAULT NULL,
  `given_name` varchar(100) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `role` int(1) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `attempts` varchar(255) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `delete_date` int(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role` (`role`),
  CONSTRAINT `role` FOREIGN KEY (`role`) REFERENCES `roles` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=405 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'bappy', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'Mahadi Hasan', 'Bappy', 'Programmer Edited', '2', 'mahadi@djit.ac', '0', '0', 'mahadidjit.jpg', '2017-07-05 15:25:38', '2018-01-24 18:09:52', null);
INSERT INTO `users` VALUES ('14', 'newuser', '$2y$10$CRLEwsVUNzZmnqw2JCylaul4LvxshGT/GODYeboWut7MwFbdosYX6', 'New User', 'New User', 'Programmer', '3', 'newuser@gmail.com', '0', '0', 'newuser.jpg', '2017-07-20 15:47:09', '2017-10-19 13:13:06', null);
INSERT INTO `users` VALUES ('15', 'another', '$2y$10$VecLZ456mUkZN9iX8Zz3LOdjIrC12.mTN2LcWTrFZgqdnaXV3FnhK', 'Another New User', 'Another New User', 'New Designation tested', '3', 'anothertested@gmail.com', '0', '0', 'another.jpg', '2017-07-20 17:16:22', '2017-10-19 13:13:17', null);
INSERT INTO `users` VALUES ('16', 'anothertestuser', '$2y$10$CIM/LgQaXPQVSwrJT4m0meY6nsYjwHncgXxkJdcZl2dvqybUP8GKa', 'This is to test another user', 'another user', 'Test User', '3', 'testuser@gmail.com', '0', '0', 'anothertestuser.jpg', '2017-07-20 17:17:18', '2017-10-19 13:13:23', null);
INSERT INTO `users` VALUES ('17', 'superadmin', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'Super', 'Admin', 'Administrator', '1', 'info@djit.ac', '0', '0', null, '2017-07-22 11:42:44', '2018-01-24 15:01:30', null);
INSERT INTO `users` VALUES ('19', 'emplyee1', '$2y$10$ZtRKqzZXvr2zi/OmXgcdrumiBnq/2rce6mBcrIB3WRuF9.K4HTP/q', 'Employee 1', 'Employee 1', 'New Employee', '2', 'emplyee1@gmail.com', '0', '0', 'emplyee1.jpg', '2017-07-24 16:12:05', '2017-10-19 13:13:40', null);
INSERT INTO `users` VALUES ('20', 'employee2', '$2y$10$TTbrX8N2lcKPCX1S2cjmb.82by6Jw2XwgnVJpfndtzPi.Ufp0OWpy', 'Employee 2', 'Employee 2', 'New employee', '2', 'employee2@gmail.com', '2', '0', 'employee2.jpg', '2017-07-24 16:12:40', '2017-12-26 17:26:20', null);
INSERT INTO `users` VALUES ('21', 'employee3', '$2y$10$UKAhpg.n4MQCvy2B/cmvJuZ/HjT88SBNDPI8Pz/SB4L4KsqZe.dji', 'Employee 3', 'Employee 3', 'New Employee', '2', 'employee3@gmail.com', '0', '0', 'employee3.jpg', '2017-07-24 16:13:19', '2018-01-11 13:05:59', null);
INSERT INTO `users` VALUES ('22', 'student1', '$2y$10$keF/cFQFvbD98.V/3WbtpOuOACr1CxcRhCloJl8r0jUC4MXDwEQqa', 'Student 1', 'Student 1', 'Student', '3', 'student1@gmail.com', '0', '0', 'student1.jpg', '2017-07-24 16:14:40', '2017-10-19 13:13:52', null);
INSERT INTO `users` VALUES ('23', 'student2', '$2y$10$BPrllVRIMWHZcll.0QEFieOWH1N3wbmYOzzCfXla9i8C8IVN6pkLO', 'Student 2', 'Student 2', 'New Student', '3', 'student2@gmail.com', null, null, 'student2.jpg', '2017-07-24 16:15:17', '2017-10-19 13:13:56', null);
INSERT INTO `users` VALUES ('24', 'student3', '$2y$10$aaUqR8y.SS7JmLOlMuCtBOBGBbP1NlLwNqJtgz5E9ioa5mnnL5Aha', 'Student 3', 'Student 3', 'Employee', '3', 'student3@gmail.com', '0', '0', 'student3.jpg', '2017-07-24 16:15:44', '2017-10-19 13:13:59', null);
INSERT INTO `users` VALUES ('25', 'student4', '$2y$10$sIfRpB.8AbVxBXj17Btpw.9JAqS.NI5bwS2gmW9fMmnXWBFNMOw/C', 'Student 4', 'Student 4', 'Student ', '4', 'student4@gmail.com', '0', '0', 'student4.jpg', '2017-07-26 17:10:02', '2017-10-19 13:14:03', null);
INSERT INTO `users` VALUES ('26', 'student5', '$2y$10$Sl9I5MObEYbYiRGQYPOhZOvAKUTSTi9fbCfh/T63vnQaFG2Ic5wtq', 'Student 5', 'Student 5', 'Student Awesomeness', '3', 'student5@gmail.com', '0', '0', 'student5.jpg', '2017-07-26 17:58:35', '2017-10-19 13:14:07', null);
INSERT INTO `users` VALUES ('27', 'mahmudaalam', '$2y$10$.JaTn06aVQxWqw1L/nCmj.m10Vd6/Rzuk00dXDLGBDJyc7BUkxJOO', 'Mahmuda Alam', 'Mahmuda Alam', 'Student', '3', 'mahmuda@gmail.com', '0', '0', 'mahmudaalam.jpg', '2017-07-27 11:41:26', '2017-10-19 13:14:16', null);
INSERT INTO `users` VALUES ('28', 'student8', '$2y$10$QNbUeDh7zdhdOxmaUFdCoOSqD4uerWDf8oqGBJaFRmFWeyfGgBWoG', 'Admin 8', 'Admin 8', 'sdfsdf', '2', 'admin8@sdsdf', '1', null, 'student8.jpg', '2017-07-27 17:04:03', '2018-01-11 12:57:29', null);
INSERT INTO `users` VALUES ('29', 'student9', '$2y$10$L8ubEGXHSBl39rpaiM5jW.TQ1PjQkj441jRfvz32sfhz4maMjITs.', 'Student9', 'Student9', 'Student', '4', 'student@gmail.com', '0', '0', 'student9.jpg', '2017-07-27 17:20:29', '2017-10-19 13:14:25', null);
INSERT INTO `users` VALUES ('30', 'student35', '$2y$10$TZRTRxHVmEiFKVr3wHKee.V/kV4l3MnIqBPrk.sHJtL/.e.5afKMO', 'Another New Student', 'Another New Student', 'Student', '4', 'student35@gmail.com', '0', '0', 'student35.jpg', '2017-07-27 17:25:52', '2017-10-19 13:14:29', null);
INSERT INTO `users` VALUES ('31', 'newemployee', '$2y$10$bXj5nhqWdaeEKhxDsw7zPedfaUvbPnIgWC2rGVM290Xhf4THMVmRu', 'Absolutely New Employee', 'Absolutely New Employee', 'Absolutely New Employee', '3', 'newemployee@gmail.com', '0', '0', 'New Employee.jpg', '2017-08-01 14:29:34', '2017-10-19 13:14:32', null);
INSERT INTO `users` VALUES ('32', 'newawesomestudent', '$2y$10$FK941GU2WdIgCzlN9Oiy4uji2LaVJL6Euh0C4LDDvKOPFNeILMgDG', 'Student Awesome Edited', 'Student Awesome Edited', 'Awesome Student Edited', '4', 'studentedited@gmail.com', null, null, 'newawesomestudent.jpg', '2017-08-01 17:12:26', '2017-10-19 13:14:36', null);
INSERT INTO `users` VALUES ('33', 'studentgreater', '$2y$10$oE85d5KLRGdALqbf7L6kJukGZ3c3xkw/dE9ZIIXOlmzitE85NsKW.', 'Student edtied', 'Student edtied', 'Edited Student', '4', 'edited@gmail.com', '0', '0', 'studentgreater.jpg', '2017-08-19 17:32:09', '2017-10-19 13:14:40', null);
INSERT INTO `users` VALUES ('34', 'uppercase', '$2y$10$3SedXNYVVrEk.iN1GsOHX.Cg3rHhgL6sI2J1TOCukVK0Ofo.Igqqy', 'Student Lowercase', 'Student Lowercase', 'student', '4', 'uppercase@gmail.com', null, null, 'uppercase.jpg', '2017-09-07 11:54:24', '2017-10-19 13:14:43', null);
INSERT INTO `users` VALUES ('35', 'replace_space', '$2y$10$FKt7gqD3C2/ql5EqnVJ4aOnHEXeVQ4L3xPB00.3VZ8Um1BLA2z/OW', 'Replace Space', 'Replace Space', 'student', '4', 'space@gmail.com', '0', '0', 'Replace Space.jpg', '2017-09-12 16:20:03', '2017-10-19 13:14:48', null);
INSERT INTO `users` VALUES ('36', 'greatemployee', '$2y$10$ou5muNiX4bCsheiyantIxui91fCBFKhKLypRz1M7uPB1g7GH8YzVm', 'New Employee Great', 'New Employee Great', 'Great Employee', '3', 'great_employee@gmail.com', null, null, 'greatEmployee.jpg', '2017-09-14 12:20:41', '2017-10-19 13:14:51', null);
INSERT INTO `users` VALUES ('37', 'even_better', '$2y$10$sS/RZkDqJy1S5F8kdtVN9e6eoSRkm/0JNtWw3abY6lcjHUbMa.F8C', 'New Student Even Better', 'New Student Even Better', 'DJIT Student', '4', 'asdasd@asdasd', null, null, 'Even Better.jpg', '2017-09-14 12:48:03', '2017-10-19 13:14:55', null);
INSERT INTO `users` VALUES ('38', 'student', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'Student 456465', 'Student 456465', 'DJIT Student', '4', 'student456465@gmail.com', null, null, 'Student 456465.jpg', '2017-09-14 12:58:02', '2017-10-19 13:14:59', null);
INSERT INTO `users` VALUES ('39', 'student_2132132', '$2y$10$eF9zPFltziy/U95y.5hv7eaqjbGcm5WdmAYXFyADxUG2tYdWXjAsm', 'Student 879798', 'Student 879798', 'DJIT Student', '4', 'assad@asdasd', null, null, 'student 2132132.jpg', '2017-09-14 12:58:38', '2017-10-19 13:15:03', null);
INSERT INTO `users` VALUES ('40', 'employee_456465', '$2y$10$habt6kKRfkt.xLMTGK3rvee6ZZqs1l7t5/pVOADAv9S9QthpHqBiy', 'Employee 454654', 'Employee 454654', 'Japanese Language Teacher', '3', 'employee4564@gmail.com', null, null, 'Employee 456465.jpg', '2017-09-14 12:59:15', '2017-10-19 13:15:07', null);
INSERT INTO `users` VALUES ('41', 'employee_2323', '$2y$10$bbx24kcuvmaItV/ZwZWcKePzQxKeQdB1KporKPmUO.PnaZ42FZXva', 'Employee 2323', 'Employee 2323', 'Executive', '3', 'employee2323@gmail.com', null, null, 'Employee 2323.jpg', '2017-09-14 13:06:51', '2017-10-19 13:15:10', null);
INSERT INTO `users` VALUES ('42', 'employee_78889865465', '$2y$10$rdSARfTvyW2mVC.Idb6AIer.OZttMNMkc2g3rvHeUdRrH3Di/pkjy', 'Employee 78889865465', 'Employee 78889865465', 'Executive', '3', 'sdfsdfsfsdfsd@asdasd89', '0', '0', 'Employee 78889865465.jpg', '2017-09-14 13:08:27', '2017-10-19 13:15:15', null);
INSERT INTO `users` VALUES ('43', 'student_8989', '$2y$10$oxyDEIvq.LzZk81ZK2HGbu5zjrLvei2SqzBbKxOZPDK05rEwTTfbW', 'Student 8989', 'Student 8989', 'DJIT Student', '4', 'studentasdasdasd@fsdfsd', '0', '0', 'Student 8989.jpg', '2017-09-14 13:09:26', '2017-10-23 14:42:48', null);
INSERT INTO `users` VALUES ('44', 'peter_parker', '$2y$10$Gwan.cDlh7aDEIWuapm60ehVIxrmPZgPUmXzolccOSLVfG0Mu4klq', 'Peter Perker', 'Peter Perker', 'DJIT Student', '4', 'peterparker@gmail.com', '0', '0', 'Peter Parker.jpg', '2017-09-14 13:16:18', '2017-10-19 13:15:22', null);
INSERT INTO `users` VALUES ('45', 'test_empty_user', '$2y$10$u0FyI8rlWooOqBqYCf4igeWDuHE6gI5RujnYNP.oecm6NBDaUu53C', 'Test Empty User', 'Test Empty User', 'eMPLOY', '3', 'testempty@gmail.com', null, null, 'Test Empty User.jpg', '2017-09-20 11:35:37', '2017-10-19 13:15:26', '1505885747');
INSERT INTO `users` VALUES ('46', 'alamgir', '$2y$10$oYCDfw95Mvhifq6YxD1RhuYidPkx0BIIlPaMLAwaDKNsWakR3vnWK', 'Alamgir Sir', 'Alamgir Sir', 'Japanese Language Teacher', '3', 'alamgir@gmail.com', null, null, 'alamgir.jpg', '2017-09-25 17:16:25', '2017-10-19 13:15:29', null);
INSERT INTO `users` VALUES ('47', 'shohel', '$2y$10$33gA0STZRywN2CPKhWKwOOyyElW0oMTjMxCGNxenewJonXPFvga/2', 'Shohel Sir', 'Shohel Sir', 'Language Instructor', '3', 'sohel96@gmail.com', '0', '0', 'shohel.jpg', '2017-09-25 17:17:08', '2018-01-04 17:32:11', null);
INSERT INTO `users` VALUES ('48', 'test_link', '$2y$10$q6yGiAnZO2V4JQuE2CwQ6eg5sRxjfJ3KBjFFG9Prx5hkilpODCKHK', 'Test Link', 'Test Link', 'None', '4', 'linktest@gmail.com', '0', '0', 'test_link.jpg', '2017-09-28 12:01:30', '2017-10-19 13:15:36', null);
INSERT INTO `users` VALUES ('49', 'test_linkadsasd', '$2y$10$sXcDUUO0l5W22mUur1loyuh6KxIzXby./WJe5Pkm8wP8w6od6s7Em', 'Asdasdasd', 'Asdasdasd', 'None', '4', 'linktestdfgdfdfgdf@gmail.com', null, null, 'test_linkadsasd.jpg', '2017-10-09 17:27:25', '2017-10-19 13:15:39', null);
INSERT INTO `users` VALUES ('50', 'test_linksdfdfsdfhjk', '$2y$10$VcWQrN9sgoWING7OgXgo2uZWwELZNbQcyQuh6PpbGJOaFD6ur21Ue', 'Asdasdasd', 'Asdasdasd', 'None', '4', 'linktestsdfdfsdfhjk@gmail.com', null, null, 'test_linksdfdfsdfhjk.jpg', '2017-10-09 17:41:39', '2017-10-19 13:15:43', null);
INSERT INTO `users` VALUES ('51', 'sadsaadi', '$2y$10$0E5rBMOzgGo9.PHkPAkZO.7EnnrMBwjNjMHKQyAgBPxYRkB.vCoua', 'Saad Bin Hasan', 'Saadi', 'Marketing Manager', '3', 'sad@djit.ac', '0', '0', 'sadsaadi.jpg', '2017-10-19 13:39:27', '2018-01-23 17:54:19', null);
INSERT INTO `users` VALUES ('52', 'geomatry', '$2y$10$0LzCLpwJ46ynGr9tqb.efO9Q0hVOkrDTG5cFMqYM.j5Fo0uqp0UjC', 'Geomatry', 'Chronicles', 'None', '4', 'geomatry@gmail.com', '0', '0', 'geomatry.jpg', '2017-10-23 15:39:15', '2017-12-26 12:17:53', null);
INSERT INTO `users` VALUES ('81', 'employee', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'New User', 'New User', 'Programmer', '3', 'newuser74589@gmail.com', null, null, 'newuser.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null);
INSERT INTO `users` VALUES ('92', 'newuser8945', '$2y$10$CRLEwsVUNzZmnqw2JCylaul4LvxshGT/GODYeboWut7MwFbdosYX6', 'New User', 'New User', 'Programmer', '4', 'newuser7458945@gmail.com', null, null, 'newuser.jpg', '2017-09-20 11:35:37', '2018-01-27 17:33:55', '1505885747');
INSERT INTO `users` VALUES ('400', 'legituser', '$2y$10$wwbkKDEqDTb7c7mc0f/lv.EwlFmupsiy.H6wfQTzRFpCwpxFTUpki', 'Legit New User', 'Legit', 'None', '4', 'legit@gmail.com', '0', '0', 'legituser.jpg', '2018-01-09 10:42:19', '2018-01-09 10:44:01', null);
INSERT INTO `users` VALUES ('401', 'sdfsdf', '$2y$10$TxE2knE2on4afjIuMFxaaeFsYe3rGbD2bQS48foH1rE81rWb2dcVm', 'Fsdfsdf Sdfsdf', 'Sdfsdf Sdfsdf', 'Sdfsdfrt', '3', 'sdfsdf@sdfsdfrt', '0', '0', 'sdfsdf.jpg', '2018-01-10 13:55:59', '2018-01-10 14:04:04', '1515571444');
INSERT INTO `users` VALUES ('402', 'userawesome', '$2y$10$GayDa9bPpzXdK9DU0ukV6.ZrzE/JF30aRW2le9mOG1yBd/xYaYnd6', 'Awesome User', 'User', 'None', '4', 'user@gmail.com', null, null, 'Userawesome.jpg', '2018-01-24 16:16:23', null, null);
INSERT INTO `users` VALUES ('403', 'cooluser', '$2y$10$KoVJBGTaOJMJxefhWTWf1eXFfJnMOUv.IlIfIp4lkKW2CrG6ibeqa', 'Cool User', 'User', 'None', '4', 'cooluser@gmail.com', '0', '0', 'cooluser.jpg', '2018-01-24 16:18:38', '2018-01-24 16:18:48', null);
INSERT INTO `users` VALUES ('404', 'hajat', '$2y$10$zjzWqykw44lTS2U/qO6LoeqkdbARHXjtw9dF4ay3mQVuYjwcpdgcm', 'Haja Daja', 'Haja', 'None', '4', 'hajat@gmail.com', '0', '0', 'hajat.jpg', '2018-01-24 16:19:48', '2018-01-24 16:27:41', null);

-- ----------------------------
-- View structure for attendance_view
-- ----------------------------
DROP VIEW IF EXISTS `attendance_view`;
CREATE VIEW `attendance_view` AS SELECT a.id AS id, ad.batch as batch_id, p.period as period, t.acronym as acronym, b.batch_number as batch_number,
ad.id as attendance_date_id, ad.attendance_date as attendance_date, a.student as user_id, 
u.username AS username, u.image as image, u.family_name AS family_name, u.given_name AS given_name, 
u.role AS role, r.role AS role_name, u.email AS email, a.attendance_status as attendance,
ad.create_date AS create_date, a.update_date as update_date
from attendance a, attendance_dates ad, batch_types t, batches b, batch_periods as p, users u, roles r 
WHERE a.student = u.id
AND ad.batch = b.id
AND b.type = t.id
AND b.period = p.id
AND u.role = r.id 
AND ad.id = a.attendance_date
AND ad.delete_date IS NULL
ORDER BY ad.attendance_date DESC ;

-- ----------------------------
-- View structure for auth_users
-- ----------------------------
DROP VIEW IF EXISTS `auth_users`;
CREATE VIEW `auth_users` AS select `u`.`id` AS `id`,`u`.`username` AS `username`,`u`.`password` AS `password`,`u`.`family_name` AS `family_name`,`u`.`given_name` AS `given_name`,`u`.`designation` AS `designation`,`u`.`role` AS `role`,`r`.`role` AS `role_name`,`u`.`email` AS `email`,`u`.`attempts` AS `attempts`,`u`.`timestamp` AS `timestamp`,`u`.`image` AS `image`,`u`.`create_date` AS `create_date`,`u`.`update_date` AS `update_date`,`u`.`delete_date` AS `delete_date` from (`users` `u` join `roles` `r`) where ((`u`.`role` = `r`.`id`) and isnull(`u`.`delete_date`)) order by `u`.`create_date` desc ;

-- ----------------------------
-- View structure for batches_detailed_view
-- ----------------------------
DROP VIEW IF EXISTS `batches_detailed_view`;
CREATE VIEW `batches_detailed_view` AS select `b`.`id` AS `id`,`b`.`batch_number` AS `batch_number`,`b`.`type` AS `type_id`,`bt`.`type` AS `type`,`bt`.`acronym` AS `acronym`,`b`.`teacher` AS `teacher_id`,`u`.`family_name` AS `teacher_family_name`,`u`.`given_name` AS `teacher_given_name`, `u`.`username` AS `teacher_username`,`b`.`period` AS `period_id`,`bp`.`period` AS `period`,`b`.`class` AS `class_id`,`cl`.`name` AS `class`,`b`.`start_time` AS `start_time`,`b`.`end_time` AS `end_time`,`b`.`start_date` AS `start_date`,`b`.`end_date` AS `end_date`,`b`.`create_date` AS `create_date`,`b`.`update_date` AS `update_date` from ((((`batches` `b` join `users` `u`) join `classes` `cl`) join `batch_periods` `bp`) join `batch_types` `bt`) where ((`u`.`id` = `b`.`teacher`) and (`cl`.`id` = `b`.`class`) and (`bp`.`id` = `b`.`period`) and (`bt`.`id` = `b`.`type`) and isnull(`b`.`delete_date`)) order by `b`.`create_date` desc ;

-- ----------------------------
-- View structure for batches_view
-- ----------------------------
DROP VIEW IF EXISTS `batches_view`;
CREATE VIEW `batches_view` AS select `b`.`id` AS `id`,`b`.`batch_number` AS `batch_number`,`b`.`type` AS `type_id`,`bt`.`type` AS `type`,`bt`.`acronym` AS `acronym`,`b`.`teacher` AS `teacher`,`b`.`period` AS `period_id`,`bp`.`period` AS `period`,`b`.`class` AS `class`,`b`.`start_time` AS `start_time`,`b`.`end_time` AS `end_time`,`b`.`start_date` AS `start_date`,`b`.`end_date` AS `end_date`,`b`.`create_date` AS `create_date`,`b`.`update_date` AS `update_date` from ((`batches` `b` join `batch_periods` `bp`) join `batch_types` `bt`) where ((`bp`.`id` = `b`.`period`) and (`bt`.`id` = `b`.`type`) and isnull(`b`.`delete_date`)) order by `b`.`create_date` desc ;

-- ----------------------------
-- View structure for batch_assigned_students_view
-- ----------------------------
DROP VIEW IF EXISTS `batch_assigned_students_view`;
CREATE VIEW `batch_assigned_students_view` AS select u.id as id, u.family_name as family_name, u.given_name as given_name, u.username as username, u.role as role, u.email as email, s.contact1 as contact, u.image as image, 
s.roll as roll, s.batch as batch, b.batch_number as batch_number, bt.type as batch_type, bt.acronym as acronym, bp.period as period, 
s.create_date, s.update_date 
from users u, students s, batches b, batch_types bt, batch_periods bp
where s.user_id = u.id
AND s.batch = b.id
AND b.type = bt.id
AND b.period = bp.id
AND s.delete_date is NULL ;

-- ----------------------------
-- View structure for batch_changes_view
-- ----------------------------
DROP VIEW IF EXISTS `batch_changes_view`;
CREATE VIEW `batch_changes_view` AS select bc.id as id, 
bc.batch as batch_id, p.period as period, t.acronym as acronym, b.batch_number as batch_number,
bc.student as student_id, u.family_name as family_name, u.given_name as given_name, u.username as username, bc.roll as roll,
bc.changed_by_user as changed_by_user_id, cb.family_name as changed_by_family_name, cb.given_name as changed_by_given_name, cb.username as changed_by_username,  
bc.create_date as create_date
from batch_changes bc, users u, users cb, batch_types t, batches b, batch_periods p
where bc.student = u.id
and bc.changed_by_user = cb.id
and bc.batch = b.id
and b.type = t.id
and b.period = p.id ;

-- ----------------------------
-- View structure for batch_days_view
-- ----------------------------
DROP VIEW IF EXISTS `batch_days_view`;
CREATE VIEW `batch_days_view` AS select `bd`.`id` AS `id`,`bd`.`batch` AS `batch`,`bd`.`weekday` AS `day_id`,`d`.`weekday` AS `weekday`,`bd`.`create_date` AS `create_date` from (`batch_days` `bd` join `days_in_week` `d`) where (`bd`.`weekday` = `d`.`id`) order by `bd`.`id` ;

-- ----------------------------
-- View structure for batch_periods_view
-- ----------------------------
DROP VIEW IF EXISTS `batch_periods_view`;
CREATE VIEW `batch_periods_view` AS select `batch_periods`.`id` AS `id`,`batch_periods`.`period` AS `period`,`batch_periods`.`start_time` AS `start_time`,`batch_periods`.`expand_start_time` AS `expand_start_time`,`batch_periods`.`end_time` AS `end_time`,`batch_periods`.`expand_end_time` AS `expand_end_time`,`batch_periods`.`create_date` AS `create_date`,`batch_periods`.`update_date` AS `update_date` from `batch_periods` where isnull(`batch_periods`.`delete_date`) ;

-- ----------------------------
-- View structure for batch_types_view
-- ----------------------------
DROP VIEW IF EXISTS `batch_types_view`;
CREATE VIEW `batch_types_view` AS select `batch_types`.`id` AS `id`,`batch_types`.`type` AS `type`,`batch_types`.`acronym` AS `acronym`,`batch_types`.`create_date` AS `create_date`,`batch_types`.`update_date` AS `update_date` from `batch_types` where isnull(`batch_types`.`delete_date`) ;

-- ----------------------------
-- View structure for classes_view
-- ----------------------------
DROP VIEW IF EXISTS `classes_view`;
CREATE VIEW `classes_view` AS select `classes`.`id` AS `id`,`classes`.`name` AS `name`,`classes`.`create_date` AS `create_date`,`classes`.`update_date` AS `update_date` from `classes` where isnull(`classes`.`delete_date`) ;

-- ----------------------------
-- View structure for education_record_view
-- ----------------------------
DROP VIEW IF EXISTS `education_record_view`;
CREATE VIEW `education_record_view` AS select e.id as id, e.user_id as user_id, u.username as username, u.family_name, u.given_name,
e.institude as institude, e.address as address, e.degree as degree, d.name as degree_name, 
e.start_date as start_date, e.end_date as end_date, e.create_date as create_date, e.update_date as update_date
from users u, education_record e, degrees d
where e.user_id = u.id
AND d.id = e.degree
AND e.delete_date is NULL ;

-- ----------------------------
-- View structure for exams_view
-- ----------------------------
DROP VIEW IF EXISTS `exams_view`;
CREATE VIEW `exams_view` AS select e.id as id, e.batch as batch, p.period as period, t.acronym as acronym, b.batch_number as batch_number,
b.teacher as teacher_id, u.family_name as teacher_family_name, u.given_name as teacher_given_name,  
e.title as title, e.max_score as max_score, e.description as description, e.exam_date as exam_date, e.exam_time as exam_time, 
e.create_date as create_date , e.update_date as update_date
from users u, exams e, batch_types t, batches b, batch_periods as p
where b.teacher = u.id
and b.type = t.id
and b.period = p.id
and e.batch = b.id
and e.delete_date is NULL 
order by e.exam_date DESC ;

-- ----------------------------
-- View structure for exam_marks_view
-- ----------------------------
DROP VIEW IF EXISTS `exam_marks_view`;
CREATE VIEW `exam_marks_view` AS select em.id as id, e.id as exam, e.batch as batch, p.period as period, t.acronym as acronym, b.batch_number as batch_number,
em.student as student, s.roll as roll, u.family_name as family_name, u.given_name as given_name, u.username as username,
tc.id as teacher_id, tc.family_name as teacher_family_name, tc.given_name as teacher_given_name, tc.username as teacher_username,  
e.title as title, e.max_score as max_score, e.description as description, e.exam_date as exam_date, e.exam_time as exam_time, 
em.score as score, em.exam_comment as exam_comment, em.update_date as update_date
from users u, users tc, students s, exams e, exam_marks em, batch_types t, batches b, batch_periods p
where em.student = u.id
and s.user_id = u.id
and b.teacher = tc.id
and b.type = t.id
and b.period = p.id
and e.batch = b.id
and em.exam = e.id
and em.delete_date is NULL 
and s.delete_date is NULL
and u.delete_date is NULL 
ORDER BY s.roll ;

-- ----------------------------
-- View structure for messages_view
-- ----------------------------
DROP VIEW IF EXISTS `messages_view`;
CREATE VIEW `messages_view` AS select `m`.`id` AS `id`,`m`.`token` AS `token`,`m`.`message` AS `message`,`m`.`reciever` AS `reciever`,`r`.`username` AS `reciever_username`,`r`.`given_name` AS `reciever_given_name`,`r`.`family_name` AS `reciever_family_name`,`r`.`role_name` AS `reciever_role`,`r`.`email` AS `reciever_email`,`r`.`image` AS `reciever_image`,`m`.`sender` AS `sender`,`s`.`username` AS `sender_username`,`s`.`given_name` AS `sender_given_name`,`s`.`family_name` AS `sender_family_name`,`s`.`role_name` AS `sender_role`,`s`.`email` AS `sender_email`,`s`.`image` AS `sender_image`,`m`.`viewed_by_reciever` AS `viewed_by_reciever`,`m`.`delete_from_reciever` AS `delete_from_reciever`,`m`.`delete_from_sender` AS `delete_from_sender`,`m`.`send_date` AS `send_date` from ((`auth_users` `r` join `auth_users` `s`) join `messages` `m`) where ((`m`.`reciever` = `r`.`id`) and (`m`.`sender` = `s`.`id`) and isnull(`r`.`delete_date`) and isnull(`s`.`delete_date`)) order by `m`.`send_date` desc ;

-- ----------------------------
-- View structure for new_notifications_view
-- ----------------------------
DROP VIEW IF EXISTS `new_notifications_view`;
CREATE VIEW `new_notifications_view` AS select n.id as id, n.notification as notification, n.link as link, n.icon as icon, n.color as color,
n.user_id as user_id, u.username as username, u.family_name as family_name, u.given_name as given_name,
n.create_date as create_date
from users u, notifications n
where n.user_id = u.id
and n.viewed = 0 
order by n.create_date DESC ;

-- ----------------------------
-- View structure for notices_view
-- ----------------------------
DROP VIEW IF EXISTS `notices_view`;
CREATE VIEW `notices_view` AS SELECT n.id AS id, n.title as title, n.details as details, n.user_id as user_id,
u.username AS username, u.image as image, u.family_name AS family_name, u.given_name AS given_name, 
u.role AS role, r.role AS role_name,
u.email AS email,
n.create_date AS create_date, n.update_date as update_date
from notices n, users u, roles r 
WHERE n.user_id = u.id
AND u.role = r.id 
AND n.delete_date IS NULL
ORDER BY n.create_date DESC ;

-- ----------------------------
-- View structure for notice_comments_view
-- ----------------------------
DROP VIEW IF EXISTS `notice_comments_view`;
CREATE VIEW `notice_comments_view` AS SELECT 
nc.id AS id, nc.notice_comment as notice_comment,
nc.notice_id AS notice_id, n.title as notice_title, 
nc.user_id as user_id, u.username AS username, u.image as image, u.family_name AS family_name, u.given_name AS given_name, 
u.role AS role, r.role AS role_name, u.email AS email,
nc.create_date AS create_date, nc.update_date as update_date
from notice_comments nc, notices n, users u, roles r 
WHERE nc.user_id = u.id
AND nc.notice_id = n.id
AND u.role = r.id
AND nc.delete_date IS NULL 
AND n.delete_date IS NULL 
ORDER BY nc.create_date DESC ;

-- ----------------------------
-- View structure for notifications_view
-- ----------------------------
DROP VIEW IF EXISTS `notifications_view`;
CREATE VIEW `notifications_view` AS select n.id as id, n.notification as notification, n.link as link, n.create_date as create_date, n.viewed as viewed,
n.user_id as user_id, u.username as username, u.family_name as family_name, u.given_name as given_name
from users u, notifications n
where n.user_id = u.id
order by n.create_date DESC ;

-- ----------------------------
-- View structure for profile_pending_students_view
-- ----------------------------
DROP VIEW IF EXISTS `profile_pending_students_view`;
CREATE VIEW `profile_pending_students_view` AS select `u`.`id` AS `id`,`u`.`username` AS `username`,`u`.`family_name` AS `family_name`,`u`.`given_name` AS `given_name`,`u`.`email` AS `email`,
`u`.`create_date` AS `create_date`,`u`.`update_date` AS `update_date` 
from (`users` `u` left join `students` `s` on((`u`.`id` = `s`.`user_id`) and isnull(`s`.`delete_date`))) 
where (isnull(`s`.`user_id`) and `u`.`role` = 4) order by `u`.`create_date` desc ;

-- ----------------------------
-- View structure for reset_password_links_view
-- ----------------------------
DROP VIEW IF EXISTS `reset_password_links_view`;
CREATE VIEW `reset_password_links_view` AS SELECT rs.id AS id, rs.link as link, rs.user_id as user_id,
u.username AS username, u.family_name AS family_name, u.given_name AS given_name, 
u.role AS role, r.role AS role_name,
u.email AS email,
rs.create_date AS create_date
from reset_password_links rs, users u, roles r 
WHERE rs.user_id = u.id
AND u.role = r.id 
AND u.role <> 1 
AND rs.exp IS NULL
AND u.delete_date IS NULL ;

-- ----------------------------
-- View structure for search_user
-- ----------------------------
DROP VIEW IF EXISTS `search_user`;
CREATE VIEW `search_user` AS select `u`.`id` AS `id`,`u`.`username` AS `username`,`u`.`password` AS `password`,`u`.`family_name` AS `family_name`,`u`.`given_name` AS `given_name`,`u`.`designation` AS `designation`,`u`.`role` AS `role`,`r`.`role` AS `role_name`,`u`.`email` AS `email`,`u`.`attempts` AS `attempts`,`u`.`timestamp` AS `timestamp`,`u`.`image` AS `image`,`u`.`create_date` AS `create_date`,`u`.`update_date` AS `update_date`,`u`.`delete_date` AS `delete_date` from (`users` `u` join `roles` `r`) where (`u`.`role` = `r`.`id`) order by `u`.`create_date` desc ;

-- ----------------------------
-- View structure for students_view
-- ----------------------------
DROP VIEW IF EXISTS `students_view`;
CREATE VIEW `students_view` AS select `u`.`id` AS `id`,`u`.`username` AS `username`,`u`.`family_name` AS `family_name`,`u`.`given_name` AS `given_name`,`u`.`email` AS `email`,
`s`.`sex` as `sex`, `s`.`batch` as `batch`,  `s`.`roll` as `roll`, 
`s`.`fatherName` as `fatherName`, `s`.`motherName` as `motherName`, `s`.`nationality` as `nationality`, `s`.`dob` as `dob`,
`s`.`contact1` as `contact1`, `s`.`contact2` as `contact2`, `s`.`contact3` as `contact3`, `s`.`study_status` as `study_status`,
`s`.`supporter_name` as `supporter_name`, `s`.`supporter_relationship` as `supporter_relationship`,`s`.`supporter_address` as `supporter_address`,
`s`.`school_to_enroll` as `school_to_enroll`, `s`.`study_subject` as `study_subject`,`s`.`study_plan_details` as `study_plan_details`, 
`s`.`supporter_contact` as `supporter_contact`, `s`.`supporter_income` as `supporter_income`, 
`s`.`supporter_expense` as `supporter_expense`,`s`.`mothod_of_payment` as `mothod_of_payment`, `s`.`support_other_students` as `support_other_students`,
`s`.`presentAddress` as `presentAddress`, `s`.`permanentAddress` as `permanentAddress`,
`s`.`study_purpose` as `study_purpose`, `s`.`additional` as `additional`,
`s`.`passport_no` as `passport_no`, `s`.`passport_issue` as `passport_issue`, `s`.`passport_expiration` as `passport_expiration`, 
`s`.`create_date` AS `create_date`,`s`.`update_date` AS `update_date` from (`users` `u` join `students` `s`) 
where ((`u`.`id` = `s`.`user_id`) 
and (`u`.`role` = 4)  
and isnull(`s`.`delete_date`)) ;

-- ----------------------------
-- View structure for student_carrer_records_view
-- ----------------------------
DROP VIEW IF EXISTS `student_carrer_records_view`;
CREATE VIEW `student_carrer_records_view` AS select cr.id as id, cr.user_id as user_id, u.username as username, u.family_name, u.given_name,
cr.organization as organization, cr.address as address, cr.occupation as occupation,
cr.start_date as start_date, cr.end_date as end_date, cr.create_date as create_date, cr.update_date as update_date
from users u, student_carrer_records cr
where cr.user_id = u.id
AND cr.delete_date is NULL ;

-- ----------------------------
-- View structure for student_family_in_bangladesh_view
-- ----------------------------
DROP VIEW IF EXISTS `student_family_in_bangladesh_view`;
CREATE VIEW `student_family_in_bangladesh_view` AS select s.id as id,
u.id as user_id, u.username as username, u.family_name as family_name, u.given_name as given_name,
s.relationship as relationship, r.name as relationship_name, r.type as relationship_type,
s.name as name, s.dob as dob, s.nationality as nationality, s.occupation as occupation, s.present_address as present_address, s.permanent_address as permanent_address,
s.create_date as create_date, s.update_date as update_date
from users u, student_family s, relationships r
where u.id = s.user_id
and s.relationship = r.id
and s.residence_with_applicant = 0 
and s.delete_date is NULL ;

-- ----------------------------
-- View structure for student_family_in_japan_view
-- ----------------------------
DROP VIEW IF EXISTS `student_family_in_japan_view`;
CREATE VIEW `student_family_in_japan_view` AS select s.id as id,
u.id as user_id, u.username as username, u.family_name as family_name, u.given_name as given_name,
s.relationship as relationship, r.name as relationship_name, r.type as relationship_type,
s.name as name, s.dob as dob, s.nationality as nationality, s.occupation as occupation, s.present_address as present_address, s.permanent_address as permanent_address,
s.residence_with_applicant as residence_with_applicant,
s.school_employment_place as school_employment_place, s.residence_card_status as residence_card_status, s.residence_card_number as residence_card_number,
s.create_date as create_date, s.update_date as update_date
from users u, student_family s, relationships r
where u.id = s.user_id
and s.relationship = r.id
and s.residence_with_applicant != 0 
and s.delete_date is NULL ;

-- ----------------------------
-- View structure for student_family_view
-- ----------------------------
DROP VIEW IF EXISTS `student_family_view`;
CREATE VIEW `student_family_view` AS select s.id as id,
u.id as user_id, u.username as username, u.family_name as family_name, u.given_name as given_name,
s.relationship as relationship, r.name as relationship_name, r.type as relationship_type,
s.name as name, s.dob as dob, s.nationality as nationality, s.occupation as occupation, s.present_address as present_address, s.permanent_address as permanent_address,
s.residence_with_applicant as residence_with_applicant,
s.school_employment_place as school_employment_place, s.residence_card_status as residence_card_status, s.residence_card_number as residence_card_number,
s.create_date as create_date, s.update_date as update_date
from users u, student_family s, relationships r
where u.id = s.user_id
and s.relationship = r.id
and s.delete_date is NULL ;

-- ----------------------------
-- View structure for student_language_certificates_view
-- ----------------------------
DROP VIEW IF EXISTS `student_language_certificates_view`;
CREATE VIEW `student_language_certificates_view` AS select c.id as id, c.user_id as user_id, u.username as username, u.family_name, u.given_name,
c.test_id as test_id, t.name as name,
c.start_date as start_date, c.end_date as end_date
from users u, student_langauge_certificates c, japanese_language_tests t
where c.user_id = u.id
AND t.id = c.test_id ;

-- ----------------------------
-- View structure for student_past_entry_view
-- ----------------------------
DROP VIEW IF EXISTS `student_past_entry_view`;
CREATE VIEW `student_past_entry_view` AS select p.id as id, p.user_id as user_id, u.username as username, u.family_name, u.given_name,
p.residence_status as residence_status, p.entry_purpose as entry_purpose,
p.start_date as start_date, p.end_date as end_date, p.create_date as create_date, p.update_date as update_date
from users u, student_past_entry p
where p.user_id = u.id
AND p.delete_date is NULL ;

-- ----------------------------
-- View structure for suggestions_view
-- ----------------------------
DROP VIEW IF EXISTS `suggestions_view`;
CREATE VIEW `suggestions_view` AS SELECT s.id AS id, s.title as title, s.details as details, s.user_id as user_id,
u.username AS username, u.image as image, u.family_name AS family_name, u.given_name AS given_name, 
u.role AS role, r.role AS role_name,
u.email AS email,
s.create_date AS create_date, s.update_date as update_date
from suggestions s, users u, roles r 
WHERE s.user_id = u.id
AND u.role = r.id 
AND s.delete_date IS NULL
ORDER BY s.create_date DESC ;

-- ----------------------------
-- View structure for suggestion_comments_view
-- ----------------------------
DROP VIEW IF EXISTS `suggestion_comments_view`;
CREATE VIEW `suggestion_comments_view` AS SELECT 
sc.id AS id, sc.suggestion_comment as suggestion_comment,
sc.suggestion_id AS suggestion_id, s.title as suggestion_title, 
sc.user_id as user_id, u.username AS username, u.image as image, u.family_name AS family_name, u.given_name AS given_name, 
u.role AS role, r.role AS role_name, u.email AS email,
sc.create_date AS create_date, sc.update_date as update_date
from suggestion_comments sc, suggestions s, users u, roles r 
WHERE sc.user_id = u.id
AND sc.suggestion_id = s.id
AND u.role = r.id
AND sc.delete_date IS NULL 
AND s.delete_date IS NULL 
ORDER BY sc.create_date DESC ;

-- ----------------------------
-- View structure for users_view
-- ----------------------------
DROP VIEW IF EXISTS `users_view`;
CREATE VIEW `users_view` AS select `u`.`id` AS `id`,`u`.`username` AS `username`,`u`.`password` AS `password`,`u`.`family_name` AS `family_name`,`u`.`given_name` AS `given_name`,`u`.`designation` AS `designation`,`u`.`role` AS `role`,`r`.`role` AS `role_name`,`u`.`email` AS `email`,`u`.`attempts` AS `attempts`,`u`.`timestamp` AS `timestamp`,`u`.`image` AS `image`,`u`.`create_date` AS `create_date`,`u`.`update_date` AS `update_date` from (`users` `u` join `roles` `r`) where ((`u`.`role` = `r`.`id`) and isnull(`u`.`delete_date`) and (`u`.`role` <> 1)) order by `u`.`create_date` desc ;
