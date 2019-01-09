/*
 Navicat Premium Data Transfer

 Source Server         : 47.104.134.122
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : 47.104.134.122:3306
 Source Schema         : minshang

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 09/01/2019 13:39:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('quartzScheduler', 'cn.exrick.xboot.quartz.jobs.SampleJob', 'DEFAULT', '0/1 * * * * ? ', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('quartzScheduler', 'cn.exrick.xboot.quartz.jobs.SampleParamJob', 'DEFAULT', '0/1 * * * * ? ', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('quartzScheduler', 'cn.exrick.xboot.quartz.jobs.SampleJob', 'DEFAULT', NULL, 'cn.exrick.xboot.quartz.jobs.SampleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C77080000001000000001740009706172616D657465727400007800);
INSERT INTO `qrtz_job_details` VALUES ('quartzScheduler', 'cn.exrick.xboot.quartz.jobs.SampleParamJob', 'DEFAULT', NULL, 'cn.exrick.xboot.quartz.jobs.SampleParamJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C77080000001000000001740009706172616D65746572740005576F726C647800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('quartzScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(11) NULL DEFAULT NULL,
  `INT_PROP_2` int(11) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(20) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(20) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PRIORITY` int(11) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('quartzScheduler', 'cn.exrick.xboot.quartz.jobs.SampleJob', 'DEFAULT', 'cn.exrick.xboot.quartz.jobs.SampleJob', 'DEFAULT', NULL, 1534080837000, 1534080836000, 5, 'PAUSED', 'CRON', 1534080790000, 0, NULL, 0, '');
INSERT INTO `qrtz_triggers` VALUES ('quartzScheduler', 'cn.exrick.xboot.quartz.jobs.SampleParamJob', 'DEFAULT', 'cn.exrick.xboot.quartz.jobs.SampleParamJob', 'DEFAULT', NULL, 1537715980000, 1537715979000, 5, 'PAUSED', 'CRON', 1534081976000, 0, NULL, 0, '');

-- ----------------------------
-- Table structure for t_brand_area
-- ----------------------------
DROP TABLE IF EXISTS `t_brand_area`;
CREATE TABLE `t_brand_area`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `areaname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `brandname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_brand_area
-- ----------------------------
INSERT INTO `t_brand_area` VALUES ('90978217430618112', 'admin', '2018-12-28 15:27:18', 0, 1, 'admin', '2018-12-28 15:27:18', '合肥', '安少爷米线');
INSERT INTO `t_brand_area` VALUES ('90978232517529600', 'admin', '2018-12-28 15:27:25', 0, 0, 'admin', '2019-01-04 15:44:37', '合肥', '安全门');
INSERT INTO `t_brand_area` VALUES ('90978245368877056', 'admin', '2018-12-28 15:27:25', 0, 1, 'admin', '2018-12-28 15:27:25', '合肥', '麦当劳');
INSERT INTO `t_brand_area` VALUES ('90978254566985728', 'admin', '2018-12-28 15:27:27', 0, 1, 'admin', '2018-12-28 15:27:27', '合肥', '老乡鸡');
INSERT INTO `t_brand_area` VALUES ('93517185019809792', 'admin', '2019-01-04 15:36:16', 0, 1, 'admin', '2019-01-04 15:36:16', '合肥', '永和豆浆');

-- ----------------------------
-- Table structure for t_department
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `parent_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort_order` decimal(10, 2) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_parent` bit(1) NULL DEFAULT NULL,
  `staus` int(11) NULL DEFAULT NULL,
  `org_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_department
-- ----------------------------
INSERT INTO `t_department` VALUES ('40327253309001728', '', '2018-08-10 20:58:27', 0, '', '2018-08-11 17:26:38', '40322811096469504', 3.00, -1, '人工智障', NULL, 0, '89838476689674240');
INSERT INTO `t_department` VALUES ('40322777781112832', '', '2018-08-10 20:40:40', 0, '', '2018-08-11 00:03:06', '0', 1.00, 0, '总部', b'1', 0, '89838476689674240');
INSERT INTO `t_department` VALUES ('40322811096469504', '', '2018-08-10 20:40:48', 0, '', '2018-08-11 00:27:05', '40322777781112832', 1.00, 0, '技术部', b'1', 0, '89838476689674240');
INSERT INTO `t_department` VALUES ('40322852833988608', '', '2018-08-10 20:40:58', 0, '', '2018-08-11 01:29:42', '40322811096469504', 1.00, 0, '研发中心', NULL, 0, '89838476689674240');
INSERT INTO `t_department` VALUES ('40327204755738624', '', '2018-08-10 20:58:15', 0, '', '2018-08-10 22:02:15', '40322811096469504', 2.00, 0, '大数据', NULL, 0, '89838476689674240');
INSERT INTO `t_department` VALUES ('40343262766043136', '', '2018-08-10 22:02:04', 0, '', '2018-08-11 00:02:53', '0', 2.00, 0, '成都分部', b'1', 0, '89870067138826240');
INSERT INTO `t_department` VALUES ('40681289119961088', '', '2018-08-11 20:25:16', 0, '', '2018-08-11 22:47:48', '40652270295060480', 2.00, 0, 'VIP', b'0', 0, '89870067138826240');
INSERT INTO `t_department` VALUES ('40344005342400512', '', '2018-08-10 22:05:01', 0, '', '2018-08-11 17:48:44', '40343262766043136', 2.00, 0, 'Vue', NULL, 0, '89870067138826240');
INSERT INTO `t_department` VALUES ('40652270295060480', '', '2018-08-11 18:29:57', 0, '', '2018-08-12 18:45:01', '0', 3.00, 0, '人事部', b'1', 0, '89870067138826240');
INSERT INTO `t_department` VALUES ('40389030113710080', '', '2018-08-11 01:03:56', 0, '', '2018-08-11 17:50:04', '40343262766043136', 1.00, 0, 'JAVA', b'0', 0, '89870067138826240');
INSERT INTO `t_department` VALUES ('40652338142121984', NULL, '2018-08-11 18:30:13', 0, NULL, '2018-08-11 18:30:13', '40652270295060480', 1.00, 0, '游客', b'0', 0, '89870067138826240');

-- ----------------------------
-- Table structure for t_employee
-- ----------------------------
DROP TABLE IF EXISTS `t_employee`;
CREATE TABLE `t_employee`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `detail_id` bigint(20) NULL DEFAULT NULL,
  `job_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for t_employee_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_employee_detail`;
CREATE TABLE `t_employee_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `age` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_file
-- ----------------------------
DROP TABLE IF EXISTS `t_file`;
CREATE TABLE `t_file`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `size` bigint(20) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `f_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `location` int(11) NULL DEFAULT NULL,
  `staus` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_food
-- ----------------------------
DROP TABLE IF EXISTS `t_food`;
CREATE TABLE `t_food`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `food_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `food_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `food_price` decimal(19, 2) NULL DEFAULT NULL,
  `food_type_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_price` int(11) NULL DEFAULT NULL,
  `is_recommend_food` int(11) NULL DEFAULT NULL,
  `shop_unit_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shop_unit_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_food_charge
-- ----------------------------
DROP TABLE IF EXISTS `t_food_charge`;
CREATE TABLE `t_food_charge`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `food_charge_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `food_charge_type_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `food_charge_type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `org_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `food_charge_price` decimal(19, 2) NULL DEFAULT NULL,
  `food_lib_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_food_charge
-- ----------------------------
INSERT INTO `t_food_charge` VALUES ('92708099470659584', 'admin', '2019-01-02 10:01:14', 0, 0, 'admin', '2019-01-02 10:01:14', '加料1', '92699957491929088', '加料分类1', '-1', 5.00, '89884865356369920');
INSERT INTO `t_food_charge` VALUES ('92708129426378752', 'admin', '2019-01-02 10:01:22', 0, 0, 'admin', '2019-01-02 10:01:22', '加料2', '92699957491929088', '加料分类1', '-1', 5.00, '89884865356369920');
INSERT INTO `t_food_charge` VALUES ('92708143393411072', 'admin', '2019-01-02 10:01:25', 0, 0, 'admin', '2019-01-02 10:01:25', '加料3', '92699957491929088', '加料分类1', '-1', 5.00, '89884865356369920');
INSERT INTO `t_food_charge` VALUES ('92708160803966976', 'admin', '2019-01-02 10:01:29', 0, 0, 'admin', '2019-01-02 10:01:29', '加料4', '92699957491929088', '加料分类1', '-1', 5.00, '89884865356369920');
INSERT INTO `t_food_charge` VALUES ('92708174506758144', 'admin', '2019-01-02 10:01:32', 0, 0, 'admin', '2019-01-02 10:01:32', '加料5', '92699957491929088', '加料分类1', '-1', 5.00, '89884865356369920');
INSERT INTO `t_food_charge` VALUES ('92708192160583680', 'admin', '2019-01-02 10:01:36', 0, 0, 'admin', '2019-01-02 10:01:36', '加料5', '92699975657459712', '加料分类2', '-1', 5.00, '89885284358950912');
INSERT INTO `t_food_charge` VALUES ('92708206207307776', 'admin', '2019-01-02 10:01:40', 0, 0, 'admin', '2019-01-02 10:01:40', '加料4', '92699975657459712', '加料分类2', '-1', 5.00, '89885284358950912');
INSERT INTO `t_food_charge` VALUES ('92708225245253632', 'admin', '2019-01-02 10:01:44', 0, 0, 'admin', '2019-01-02 10:01:44', '加料3', '92699975657459712', '加料分类2', '-1', 5.00, '89885284358950912');
INSERT INTO `t_food_charge` VALUES ('92708245910589440', 'admin', '2019-01-02 10:01:49', 0, 0, 'admin', '2019-01-02 10:01:49', '加料2', '92699975657459712', '加料分类2', '-1', 5.00, '89885284358950912');

-- ----------------------------
-- Table structure for t_food_charge_type
-- ----------------------------
DROP TABLE IF EXISTS `t_food_charge_type`;
CREATE TABLE `t_food_charge_type`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `food_charge_type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_food_charge_type
-- ----------------------------
INSERT INTO `t_food_charge_type` VALUES ('92699957491929088', 'admin', '2019-01-02 09:28:53', 0, 0, 'admin', '2019-01-02 09:28:53', '加料分类1');
INSERT INTO `t_food_charge_type` VALUES ('92699975657459712', 'admin', '2019-01-02 09:28:58', 0, 0, 'admin', '2019-01-02 09:28:58', '加料分类2');
INSERT INTO `t_food_charge_type` VALUES ('92699988273926144', 'admin', '2019-01-02 09:29:01', 0, 0, 'admin', '2019-01-02 09:29:01', '加料分类3');
INSERT INTO `t_food_charge_type` VALUES ('92700002861715456', 'admin', '2019-01-02 09:29:04', 0, 0, 'admin', '2019-01-02 09:29:04', '加料分类4');
INSERT INTO `t_food_charge_type` VALUES ('92700014861619200', 'admin', '2019-01-02 09:29:07', 0, 0, 'admin', '2019-01-02 09:29:07', '加料分类5');
INSERT INTO `t_food_charge_type` VALUES ('92700028690239488', 'admin', '2019-01-02 09:29:10', 0, 0, 'admin', '2019-01-02 09:29:10', '加料分类6');
INSERT INTO `t_food_charge_type` VALUES ('92700042149761024', 'admin', '2019-01-02 09:29:13', 0, 0, 'admin', '2019-01-02 09:29:13', '加料分类7');
INSERT INTO `t_food_charge_type` VALUES ('92700058306220032', 'admin', '2019-01-02 09:29:17', 0, 0, 'admin', '2019-01-02 09:29:17', '加料分类8');
INSERT INTO `t_food_charge_type` VALUES ('92700070851383296', 'admin', '2019-01-02 09:29:20', 0, 0, 'admin', '2019-01-02 09:29:20', '加料分类9');
INSERT INTO `t_food_charge_type` VALUES ('92700085812465664', 'admin', '2019-01-02 09:29:24', 0, 0, 'admin', '2019-01-02 09:29:24', '加料分类10');

-- ----------------------------
-- Table structure for t_food_combo
-- ----------------------------
DROP TABLE IF EXISTS `t_food_combo`;
CREATE TABLE `t_food_combo`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `food_combo_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `food_combo_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `original_price` decimal(19, 2) NULL DEFAULT NULL,
  `price` decimal(19, 2) NULL DEFAULT NULL,
  `vip_price` decimal(19, 2) NULL DEFAULT NULL,
  `food_type_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_food_combo
-- ----------------------------
INSERT INTO `t_food_combo` VALUES ('94574390703820800', 'admin', '2019-01-07 13:37:13', 0, 0, 'admin', '2019-01-07 13:37:13', '套餐1', '套餐类型111', 1.00, 1.00, 1.00, '90181297112092672');

-- ----------------------------
-- Table structure for t_food_lib
-- ----------------------------
DROP TABLE IF EXISTS `t_food_lib`;
CREATE TABLE `t_food_lib`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜品库id',
  `food_lib_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜品库名称',
  `status` int(11) NULL DEFAULT NULL COMMENT '菜品库状态（0 停用 1. 启用）',
  `del_flag` int(11) NULL DEFAULT NULL COMMENT '菜品库是否删除（0 删除 1 未删除）',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `org_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `org_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜品库表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_food_lib
-- ----------------------------
INSERT INTO `t_food_lib` VALUES ('89884865356369920', '湖南菜库', 0, 0, 'admin', '2018-12-25 15:02:47', 'admin', '2018-12-25 16:43:14', '安业公司', '89870067138826240');
INSERT INTO `t_food_lib` VALUES ('89885284358950912', '山西菜库', 0, 0, 'admin', '2018-12-25 15:04:23', 'admin', '2018-12-25 16:43:14', '安业公司', '89870067138826240');
INSERT INTO `t_food_lib` VALUES ('89885310351052800', '广东菜库', 0, 0, 'admin', '2018-12-25 15:04:29', 'admin', '2018-12-25 16:43:14', '安业公司', '89838476689674240');
INSERT INTO `t_food_lib` VALUES ('89885332970934272', '合肥菜库', 0, 0, 'admin', '2018-12-25 15:04:34', 'admin', '2018-12-25 16:43:14', '安业公司', '89838476689674240');
INSERT INTO `t_food_lib` VALUES ('89885370665144320', '河南菜库', 0, 0, 'admin', '2018-12-25 15:04:43', 'admin', '2018-12-25 16:43:14', '安业公司', '89838476689674240');
INSERT INTO `t_food_lib` VALUES ('89885399865888768', '广州菜库', 0, 0, 'admin', '2018-12-25 15:04:50', 'admin', '2018-12-25 16:43:14', '安业公司', '89838476689674240');
INSERT INTO `t_food_lib` VALUES ('89885424134131712', '上海菜库', 0, 0, 'admin', '2018-12-25 15:04:56', 'admin', '2018-12-25 16:43:14', '安业公司', '89838476689674240');
INSERT INTO `t_food_lib` VALUES ('89885445948706816', '江苏菜库', 0, 0, 'admin', '2018-12-25 15:05:01', 'admin', '2018-12-25 16:43:14', '安业公司', '89838476689674240');
INSERT INTO `t_food_lib` VALUES ('89885465636769792', '山东菜库', 0, 0, 'admin', '2018-12-25 15:05:06', 'admin', '2018-12-25 16:43:14', '安业公司', '89838476689674240');
INSERT INTO `t_food_lib` VALUES ('89885482996994048', '武汉菜库', 0, 0, 'admin', '2018-12-25 15:05:10', 'admin', '2018-12-25 16:43:14', '安业公司', '89838476689674240');
INSERT INTO `t_food_lib` VALUES ('89885538890289152', '江西菜库', 0, 0, 'admin', '2018-12-25 15:05:24', 'admin', '2018-12-25 16:43:14', '安业公司', '89838476689674240');
INSERT INTO `t_food_lib` VALUES ('93528320838209536', '托斯卡纳菜库', 0, 0, 'admin', '2019-01-04 16:21:07', 'admin', '2019-01-04 16:21:07', '安业公司', '89838476689674240');
INSERT INTO `t_food_lib` VALUES ('93528928043405312', '瑞泰上园菜库', 0, 0, 'admin', '2019-01-04 16:23:01', 'admin', '2019-01-04 16:23:01', '安业公司瑶海店', '89870067138826240');
INSERT INTO `t_food_lib` VALUES ('93529576185008128', '南路菜库', 0, 0, 'admin', '2019-01-04 16:25:33', 'admin', '2019-01-04 16:25:33', '安业公司晋安店', '89870067138826240');
INSERT INTO `t_food_lib` VALUES ('94523191166242816', '南路菜库', 0, 0, 'admin', '2019-01-07 10:13:49', 'admin', '2019-01-07 10:13:49', '安业公司晋安店', '89870067138826240');

-- ----------------------------
-- Table structure for t_food_practice
-- ----------------------------
DROP TABLE IF EXISTS `t_food_practice`;
CREATE TABLE `t_food_practice`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `food_practice_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `food_practice_type_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `food_practice_type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `org_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price_up_type` int(11) NULL DEFAULT NULL,
  `price_up_value` decimal(19, 2) NULL DEFAULT NULL,
  `food_lib_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_food_practice
-- ----------------------------
INSERT INTO `t_food_practice` VALUES ('91369562175442944', 'admin', '2018-12-29 17:22:48', 0, 0, 'admin', '2018-12-29 17:22:48', '做法1', '91351379376869376', '做法分类1', '-1', 0, 0.00, '89869690112839680');
INSERT INTO `t_food_practice` VALUES ('91369875875827712', 'admin', '2018-12-29 17:23:50', 0, 0, 'admin', '2018-12-29 17:23:50', '做法2', '91351379376869376', '做法分类1', '-1', 0, 0.00, '89869690112839680');
INSERT INTO `t_food_practice` VALUES ('91369955005566976', 'admin', '2018-12-29 17:23:56', 0, 0, 'admin', '2018-12-29 17:23:56', '做法3', '91351379376869376', '做法分类1', '-1', 0, 0.00, '89869690112839680');
INSERT INTO `t_food_practice` VALUES ('91369969828237312', 'admin', '2018-12-29 17:23:59', 0, 0, 'admin', '2018-12-29 17:23:59', '做法4', '91351379376869376', '做法分类1', '-1', 0, 0.00, '89869690112839680');
INSERT INTO `t_food_practice` VALUES ('91369981786198016', 'admin', '2018-12-29 17:24:02', 0, 0, 'admin', '2018-12-29 17:24:02', '做法5', '91351379376869376', '做法分类1', '-1', 0, 0.00, '89869690112839680');
INSERT INTO `t_food_practice` VALUES ('91370086559911936', 'admin', '2018-12-29 17:24:27', 0, 0, 'admin', '2018-12-29 17:24:27', '做法11', '91351395701100544', '做法分类2', '-1', 0, 0.00, '89884865356369920');
INSERT INTO `t_food_practice` VALUES ('91370098811473920', 'admin', '2018-12-29 17:24:30', 0, 0, 'admin', '2018-12-29 17:24:30', '做法22', '91351395701100544', '做法分类2', '-1', 0, 0.00, '89884865356369920');
INSERT INTO `t_food_practice` VALUES ('91370112287772672', 'admin', '2018-12-29 17:24:33', 0, 0, 'admin', '2018-12-29 17:24:33', '做法33', '91351395701100544', '做法分类2', '-1', 0, 0.00, '89884865356369920');
INSERT INTO `t_food_practice` VALUES ('91370125571133440', 'admin', '2018-12-29 17:24:37', 0, 0, 'admin', '2018-12-29 17:24:37', '做法44', '91351395701100544', '做法分类2', '-1', 0, 0.00, '89884865356369920');
INSERT INTO `t_food_practice` VALUES ('91370138544115712', 'admin', '2018-12-29 17:24:40', 0, 0, 'admin', '2018-12-29 17:24:40', '做法55', '91351395701100544', '做法分类2', '-1', 0, 0.00, '89884865356369920');

-- ----------------------------
-- Table structure for t_food_practice_type
-- ----------------------------
DROP TABLE IF EXISTS `t_food_practice_type`;
CREATE TABLE `t_food_practice_type`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `food_practice_type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_food_practice_type
-- ----------------------------
INSERT INTO `t_food_practice_type` VALUES ('91351379376869376', 'admin', '2018-12-29 16:10:07', 0, 0, 'admin', '2018-12-29 16:10:07', '做法分类1');
INSERT INTO `t_food_practice_type` VALUES ('91351395701100544', 'admin', '2018-12-29 16:10:11', 0, 0, 'admin', '2018-12-29 16:10:11', '做法分类2');
INSERT INTO `t_food_practice_type` VALUES ('91351408351121408', 'admin', '2018-12-29 16:10:14', 0, 0, 'admin', '2018-12-29 16:10:14', '做法分类3');
INSERT INTO `t_food_practice_type` VALUES ('91351420657209344', 'admin', '2018-12-29 16:10:17', 0, 0, 'admin', '2018-12-29 16:10:17', '做法分类4');
INSERT INTO `t_food_practice_type` VALUES ('91351431763726336', 'admin', '2018-12-29 16:10:20', 0, 0, 'admin', '2018-12-29 16:10:20', '做法分类5');
INSERT INTO `t_food_practice_type` VALUES ('91351444996755456', 'admin', '2018-12-29 16:10:23', 0, 0, 'admin', '2018-12-29 16:10:23', '做法分类6');
INSERT INTO `t_food_practice_type` VALUES ('91351455952277504', 'admin', '2018-12-29 16:10:25', 0, 0, 'admin', '2018-12-29 16:10:25', '做法分类7');
INSERT INTO `t_food_practice_type` VALUES ('91351467931209728', 'admin', '2018-12-29 16:10:28', 0, 0, 'admin', '2018-12-29 16:10:28', '做法分类8');
INSERT INTO `t_food_practice_type` VALUES ('91351480090497024', 'admin', '2018-12-29 16:10:31', 0, 0, 'admin', '2018-12-29 16:10:31', '做法分类9');
INSERT INTO `t_food_practice_type` VALUES ('91352169466302464', 'admin', '2018-12-29 16:13:15', 0, 0, 'admin', '2018-12-29 16:13:15', '做法分类10');
INSERT INTO `t_food_practice_type` VALUES ('91352180795117568', 'admin', '2018-12-29 16:13:18', 0, 0, 'admin', '2018-12-29 16:13:18', '做法分类11');

-- ----------------------------
-- Table structure for t_food_spec
-- ----------------------------
DROP TABLE IF EXISTS `t_food_spec`;
CREATE TABLE `t_food_spec`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `food_lib_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `food_spec_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `org_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_food_spec
-- ----------------------------
INSERT INTO `t_food_spec` VALUES ('91327470820659200', 'admin', '2018-12-29 14:35:07', 0, 0, 'admin', '2018-12-29 14:35:07', '89884865356369920', '规格1', '-1');
INSERT INTO `t_food_spec` VALUES ('91327492744286208', 'admin', '2018-12-29 14:35:12', 0, 0, 'admin', '2018-12-29 14:35:12', '89884865356369920', '规格2', '-1');
INSERT INTO `t_food_spec` VALUES ('91327505377529856', 'admin', '2018-12-29 14:35:15', 0, 0, 'admin', '2018-12-29 14:35:15', '89884865356369920', '规格3', '-1');
INSERT INTO `t_food_spec` VALUES ('91327517201272832', 'admin', '2018-12-29 14:35:18', 0, 0, 'admin', '2018-12-29 14:35:18', '89884865356369920', '规格4', '-1');
INSERT INTO `t_food_spec` VALUES ('91327533898797056', 'admin', '2018-12-29 14:35:22', 0, 0, 'admin', '2018-12-29 14:35:22', '89884865356369920', '规格5', '-1');
INSERT INTO `t_food_spec` VALUES ('91327545135337472', 'admin', '2018-12-29 14:35:25', 0, 0, 'admin', '2018-12-29 14:35:25', '89884865356369920', '规格6', '-1');
INSERT INTO `t_food_spec` VALUES ('91327556145385472', 'admin', '2018-12-29 14:35:27', 0, 0, 'admin', '2018-12-29 14:35:27', '89884865356369920', '规格7', '-1');
INSERT INTO `t_food_spec` VALUES ('91327567826522112', 'admin', '2018-12-29 14:35:30', 0, 0, 'admin', '2018-12-29 14:35:30', '89884865356369920', '规格8', '-1');
INSERT INTO `t_food_spec` VALUES ('91327580992442368', 'admin', '2018-12-29 14:35:33', 0, 0, 'admin', '2018-12-29 14:35:33', '89884865356369920', '规格9', '-1');
INSERT INTO `t_food_spec` VALUES ('91327599501905920', 'admin', '2018-12-29 14:35:38', 0, 0, 'admin', '2018-12-29 15:39:32', '89884865356369920', '规格12', '-1');
INSERT INTO `t_food_spec` VALUES ('94962428319633408', 'admin', '2019-01-08 15:19:08', 0, 0, 'admin', '2019-01-08 15:19:08', '89884865356369920', '规格13', '-1');
INSERT INTO `t_food_spec` VALUES ('94962467427323904', 'admin', '2019-01-08 15:19:18', 0, 0, 'admin', '2019-01-08 15:19:18', '89884865356369920', '规格14', '-1');
INSERT INTO `t_food_spec` VALUES ('94963667610636288', 'admin', '2019-01-08 15:24:04', 0, 0, 'admin', '2019-01-08 15:24:04', '89884865356369920', '规格14', '-1');
INSERT INTO `t_food_spec` VALUES ('94987112847249408', 'admin', '2019-01-08 16:57:14', 0, 0, 'admin', '2019-01-08 16:57:14', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_food_type
-- ----------------------------
DROP TABLE IF EXISTS `t_food_type`;
CREATE TABLE `t_food_type`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `food_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `food_lib_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `food_type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_food_type
-- ----------------------------
INSERT INTO `t_food_type` VALUES ('90181297112092672', 'admin', '2018-12-26 10:40:38', 0, 0, 'admin', '2018-12-29 14:18:59', '0001', '89884865356369920', '套餐', NULL);
INSERT INTO `t_food_type` VALUES ('90181532823588864', 'admin', '2018-12-26 10:41:34', 0, 0, 'admin', '2018-12-26 10:41:34', '0002', '89884865356369920', '午餐', NULL);
INSERT INTO `t_food_type` VALUES ('90181573869047808', 'admin', '2018-12-26 10:41:44', 0, 0, 'admin', '2018-12-26 10:41:44', '0003', '89884865356369920', '早餐', NULL);
INSERT INTO `t_food_type` VALUES ('90181625094082560', 'admin', '2018-12-26 10:41:56', 0, 0, 'admin', '2018-12-26 10:41:56', '0004', '89884865356369920', '晚餐', NULL);
INSERT INTO `t_food_type` VALUES ('90181665594281984', 'admin', '2018-12-26 10:42:06', 0, 0, 'admin', '2018-12-26 10:42:06', '0005', '89884865356369920', '夜宵', NULL);
INSERT INTO `t_food_type` VALUES ('90181814345273344', 'admin', '2018-12-26 10:42:41', 0, 0, 'admin', '2018-12-26 10:42:41', '0006', '89885284358950912', '海鲜', NULL);
INSERT INTO `t_food_type` VALUES ('90181870767050752', 'admin', '2018-12-26 10:42:55', 0, 0, 'admin', '2018-12-26 10:42:55', '0007', '89885284358950912', '川菜', NULL);
INSERT INTO `t_food_type` VALUES ('90182027277504512', 'admin', '2018-12-26 10:43:32', 0, 0, 'admin', '2018-12-26 10:43:32', '0008', '89885284358950912', '湖南菜', NULL);
INSERT INTO `t_food_type` VALUES ('90182080897486848', 'admin', '2018-12-26 10:43:45', 0, 0, 'admin', '2018-12-26 10:43:45', '0009', '89885284358950912', '湘西菜', NULL);
INSERT INTO `t_food_type` VALUES ('90182148715188224', 'admin', '2018-12-26 10:44:01', 0, 0, 'admin', '2018-12-26 10:44:01', '0010', '89885284358950912', '广西菜', NULL);
INSERT INTO `t_food_type` VALUES ('90182188661739520', 'admin', '2018-12-26 10:44:10', 0, 0, 'admin', '2018-12-26 10:44:10', '0011', '89885284358950912', '湖北菜', NULL);

-- ----------------------------
-- Table structure for t_foodlib_organization
-- ----------------------------
DROP TABLE IF EXISTS `t_foodlib_organization`;
CREATE TABLE `t_foodlib_organization`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `food_lib_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `org_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_foodlib_organization
-- ----------------------------
INSERT INTO `t_foodlib_organization` VALUES ('89885572822208512', 'admin', '2018-12-25 15:05:32', 0, 0, 'admin', '2018-12-25 15:05:32', '89885572784459776', '-1');
INSERT INTO `t_foodlib_organization` VALUES ('89885539011923968', 'admin', '2018-12-25 15:05:24', 0, 0, 'admin', '2018-12-25 15:05:24', '89885538890289152', '-1');
INSERT INTO `t_foodlib_organization` VALUES ('89885483114434560', 'admin', '2018-12-25 15:05:10', 0, 0, 'admin', '2018-12-25 15:05:10', '89885482996994048', '-1');
INSERT INTO `t_foodlib_organization` VALUES ('89885465682907136', 'admin', '2018-12-25 15:05:06', 0, 0, 'admin', '2018-12-25 15:05:06', '89885465636769792', '-1');
INSERT INTO `t_foodlib_organization` VALUES ('89885445982261249', 'admin', '2018-12-25 15:05:01', 0, 0, 'admin', '2018-12-25 15:05:01', '89885445948706816', '-1');
INSERT INTO `t_foodlib_organization` VALUES ('89885424176074752', 'admin', '2018-12-25 15:04:56', 0, 0, 'admin', '2018-12-25 15:04:56', '89885424134131712', '-1');
INSERT INTO `t_foodlib_organization` VALUES ('89885399912026112', 'admin', '2018-12-25 15:04:50', 0, 0, 'admin', '2018-12-25 15:04:50', '89885399865888768', '-1');
INSERT INTO `t_foodlib_organization` VALUES ('89885370698698753', 'admin', '2018-12-25 15:04:43', 0, 0, 'admin', '2018-12-25 15:04:43', '89885370665144320', '-1');
INSERT INTO `t_foodlib_organization` VALUES ('89885333008683008', 'admin', '2018-12-25 15:04:34', 0, 0, 'admin', '2018-12-25 15:04:34', '89885332970934272', '-1');
INSERT INTO `t_foodlib_organization` VALUES ('89885310405578752', 'admin', '2018-12-25 15:04:29', 0, 0, 'admin', '2018-12-25 15:04:29', '89885310351052800', '-1');
INSERT INTO `t_foodlib_organization` VALUES ('89885284468002816', 'admin', '2018-12-25 15:04:23', 0, 0, 'admin', '2018-12-25 15:04:23', '89885284358950912', '-1');
INSERT INTO `t_foodlib_organization` VALUES ('89884888840278016', 'admin', '2018-12-25 15:02:54', 0, 0, 'admin', '2018-12-25 15:02:54', '89884865356369920', '-1');
INSERT INTO `t_foodlib_organization` VALUES ('89885598910779393', 'admin', '2018-12-25 15:05:38', 0, 0, 'admin', '2018-12-25 15:05:38', '89885598881419264', '-1');
INSERT INTO `t_foodlib_organization` VALUES ('90597081919524864', 'admin', '2018-12-27 14:12:49', 0, 0, 'admin', '2018-12-27 14:12:49', '90597081252630528', '-1');
INSERT INTO `t_foodlib_organization` VALUES ('90598794588065792', 'admin', '2018-12-27 14:19:48', 0, 0, 'admin', '2018-12-27 14:19:48', '90598768327528448', '-1');
INSERT INTO `t_foodlib_organization` VALUES ('90621460409749504', 'admin', '2018-12-27 15:49:41', 0, 0, 'admin', '2018-12-27 15:49:41', '89869690112839680', '-1');
INSERT INTO `t_foodlib_organization` VALUES ('93527890745888768', 'admin', '2019-01-04 16:18:48', 0, 0, 'admin', '2019-01-04 16:18:48', '93527890594893824', '-1');
INSERT INTO `t_foodlib_organization` VALUES ('93528515160313856', 'admin', '2019-01-04 16:21:22', 0, 0, 'admin', '2019-01-04 16:21:22', '93528320838209536', '-1');
INSERT INTO `t_foodlib_organization` VALUES ('93528955730006016', 'admin', '2019-01-04 16:23:04', 0, 0, 'admin', '2019-01-04 16:23:04', '93528928043405312', '89869690112839680');
INSERT INTO `t_foodlib_organization` VALUES ('93529589258653696', 'admin', '2019-01-04 16:25:33', 0, 0, 'admin', '2019-01-04 16:25:33', '93529576185008128', '89870067138826240');
INSERT INTO `t_foodlib_organization` VALUES ('94512476908949504', 'admin', '2019-01-07 09:31:11', 0, 0, 'admin', '2019-01-07 09:31:11', '94512449734053888', '89870067138826240');
INSERT INTO `t_foodlib_organization` VALUES ('94523204579627008', 'admin', '2019-01-07 10:13:49', 0, 0, 'admin', '2019-01-07 10:13:49', '94523191166242816', '89870067138826240');

-- ----------------------------
-- Table structure for t_foods
-- ----------------------------
DROP TABLE IF EXISTS `t_foods`;
CREATE TABLE `t_foods`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `food_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `food_price` decimal(19, 2) NULL DEFAULT NULL,
  `is_price` int(11) NULL DEFAULT NULL,
  `is_recommend_food` int(11) NULL DEFAULT NULL,
  `level` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shop_unit_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shop_unit_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `food_lib_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `food_spec_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `food_lib_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `food_spec_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_foods
-- ----------------------------
INSERT INTO `t_foods` VALUES ('93175964619509760', 'admin', '2019-01-03 17:00:22', 0, 0, 'admin', '2019-01-03 17:00:22', NULL, NULL, 1, 1, 1, '早餐', '', NULL, '', '89884865356369920', '91327470820659200', '', '');
INSERT INTO `t_foods` VALUES ('93176485669507072', 'admin', '2019-01-03 17:02:26', 0, 0, 'admin', '2019-01-03 17:02:26', '图片1', 1.00, 1, 1, 2, '油条', '93175964619509760', '90624073561804800', '个', '89884865356369920', '91327470820659200', '湖南菜库', '规格1');
INSERT INTO `t_foods` VALUES ('93176541864792064', 'admin', '2019-01-03 17:02:40', 0, 0, 'admin', '2019-01-03 17:02:40', '图片2', 1.00, 1, 1, 2, '馒头', '93175964619509760', '90624073561804800', '个', '89884865356369920', '91327470820659200', '湖南菜库', '规格1');
INSERT INTO `t_foods` VALUES ('93176578397179904', 'admin', '2019-01-03 17:02:48', 0, 0, 'admin', '2019-01-03 17:02:48', '图片3', 1.00, 1, 1, 2, '豆浆', '93175964619509760', '90624073561804800', '个', '89884865356369920', '91327470820659200', '湖南菜库', '规格1');
INSERT INTO `t_foods` VALUES ('93176709951524864', 'admin', '2019-01-03 17:03:20', 0, 0, 'admin', '2019-01-03 17:03:20', NULL, NULL, 1, 1, 1, '午餐', NULL, NULL, NULL, '89885284358950912', '91327492744286208', '', '');
INSERT INTO `t_foods` VALUES ('93176956207501312', 'admin', '2019-01-03 17:04:19', 0, 0, 'admin', '2019-01-03 17:04:19', '图片11', 1.00, 1, 1, 2, '红烧肉', '93176709951524864', '90624073561804800', '个', '89885284358950912', '91327492744286208', '山西菜库', '规格2');
INSERT INTO `t_foods` VALUES ('93176998666440704', 'admin', '2019-01-03 17:04:29', 0, 0, 'admin', '2019-01-03 17:04:29', '图片22', 1.00, 1, 1, 2, '牛肉', '93176709951524864', '90624073561804800', '个', '89885284358950912', '91327492744286208', '山西菜库', '规格2');
INSERT INTO `t_foods` VALUES ('93177045164494848', 'admin', '2019-01-03 17:04:40', 0, 0, 'admin', '2019-01-03 17:04:40', '图片33', 1.00, 1, 1, 2, '猪蹄', '93176709951524864', '90624073561804800', '个', '89885284358950912', '91327492744286208', '山西菜库', '规格2');
INSERT INTO `t_foods` VALUES ('93177079419375616', 'admin', '2019-01-03 17:04:48', 0, 0, 'admin', '2019-01-03 17:04:48', '图片44', 1.00, 1, 1, 2, '青菜', '93176709951524864', '90624073561804800', '个', '89885284358950912', '91327492744286208', '山西菜库', '规格2');
INSERT INTO `t_foods` VALUES ('93177133291016192', 'admin', '2019-01-03 17:05:01', 0, 0, 'admin', '2019-01-03 17:05:01', NULL, NULL, 1, 1, 1, '晚餐', NULL, NULL, NULL, '89885310351052800', '91327505377529856', '', '');
INSERT INTO `t_foods` VALUES ('93177275872186368', 'admin', '2019-01-03 17:05:35', 0, 0, 'admin', '2019-01-03 17:05:35', '图片111', 1.00, 1, 1, 2, '牛奶', '93177133291016192', '90624073561804800', '个', '89885310351052800', '91327505377529856', '广东菜库', '规格3');
INSERT INTO `t_foods` VALUES ('93177312492654592', 'admin', '2019-01-03 17:05:43', 0, 0, 'admin', '2019-01-03 17:05:43', '图片222', 1.00, 1, 1, 2, '香蕉', '93177133291016192', '90624073561804800', '个', '89885310351052800', '91327505377529856', '广东菜库', '规格3');
INSERT INTO `t_foods` VALUES ('93177342695837696', 'admin', '2019-01-03 17:05:51', 0, 0, 'admin', '2019-01-03 17:05:51', '图片333', 1.00, 1, 1, 2, '苹果', '93177133291016192', '90624073561804800', '个', '89885310351052800', '91327505377529856', '广东菜库', '规格3');
INSERT INTO `t_foods` VALUES ('93177371313573888', 'admin', '2019-01-03 17:05:57', 0, 0, 'admin', '2019-01-03 17:05:57', '图片444', 1.00, 1, 1, 2, '梨子', '93177133291016192', '90624073561804800', '个', '89885310351052800', '91327505377529856', '广东菜库', '规格3');
INSERT INTO `t_foods` VALUES ('93177408378638336', 'admin', '2019-01-03 17:06:06', 0, 0, 'admin', '2019-01-03 17:06:06', '图片555', 1.00, 1, 1, 2, '橙子', '93177133291016192', '90624073561804800', '个', '89885310351052800', '91327505377529856', '广东菜库', '规格3');
INSERT INTO `t_foods` VALUES ('93179217499394048', 'admin', '2019-01-03 17:13:21', 0, 0, 'admin', '2019-01-03 17:13:21', '图片555', 1.00, 1, 1, 2, '人参', '93177133291016192', '90624073561804800', '个', '89885310351052800', '91327505377529856', '广东菜库', '规格3');
INSERT INTO `t_foods` VALUES ('94987785525530624', 'admin', '2019-01-08 16:59:54', 0, 0, 'admin', '2019-01-08 16:59:54', NULL, 1.00, 1, 1, 1, '我是测试的', NULL, NULL, '', '89885310351052800', '91327505377529856', NULL, '');
INSERT INTO `t_foods` VALUES ('94999461473816576', 'admin', '2019-01-08 17:46:32', 0, 0, 'admin', '2019-01-08 17:46:32', NULL, 1.00, 1, 1, 2, '我是测试的下面的菜品', '94987785525530624', '90613964198645760', '批', '89885310351052800', '91327505377529856', '广东菜库', '规格3');
INSERT INTO `t_foods` VALUES ('95007003327336448', 'admin', '2019-01-08 18:16:16', 0, 0, 'admin', '2019-01-08 18:16:16', NULL, 1.00, 1, 1, 2, '我是测试的下面的菜品2', NULL, '90613964198645760', '批', '89885310351052800', '91327505377529856', '广东菜库', '规格3');
INSERT INTO `t_foods` VALUES ('95006458164285440', 'admin', '2019-01-08 18:14:06', 0, 0, 'admin', '2019-01-08 18:14:06', NULL, 1.00, 1, 1, 2, '我是测试的下面的菜品1', NULL, '90613964198645760', '批', '89885310351052800', '91327505377529856', '广东菜库', '规格3');

-- ----------------------------
-- Table structure for t_github
-- ----------------------------
DROP TABLE IF EXISTS `t_github`;
CREATE TABLE `t_github`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_related` bit(1) NULL DEFAULT NULL,
  `open_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `relate_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staus` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_head_depot
-- ----------------------------
DROP TABLE IF EXISTS `t_head_depot`;
CREATE TABLE `t_head_depot`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `depot_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `depot_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_head_depot
-- ----------------------------
INSERT INTO `t_head_depot` VALUES ('93549111675981824', 'admin', '2019-01-04 17:43:07', 0, 0, 'admin', '2019-01-04 17:43:07', 'YCLC', '原材料仓');
INSERT INTO `t_head_depot` VALUES ('94519186834853888', NULL, NULL, 0, 0, 'admin', '2019-01-07 10:09:53', 'CCPC', '产成品仓');

-- ----------------------------
-- Table structure for t_head_goods_order
-- ----------------------------
DROP TABLE IF EXISTS `t_head_goods_order`;
CREATE TABLE `t_head_goods_order`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `delivery_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_price` decimal(19, 2) NULL DEFAULT NULL,
  `indent_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shop_goods_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shop_unit_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shop_unit_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `document_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `headrderoid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_head_goods_order
-- ----------------------------
INSERT INTO `t_head_goods_order` VALUES ('94960105132396544', 'admin', '2019-01-08 15:09:55', 0, 0, 'admin', '2019-01-08 15:20:14', '30', '00001', '土豆牛肉', 100.00, '15', '1', '93062423237365760', '90624073561804800', '块', NULL, NULL);
INSERT INTO `t_head_goods_order` VALUES ('94969056376918016', 'admin', '2019-01-08 15:45:29', 0, 0, 'admin', '2019-01-08 15:45:29', '10', '007', '扇贝', 120.00, '10', '123', '93062423237365760', '90624073561804800', '个', '201901081043183889', '94893012777177088');

-- ----------------------------
-- Table structure for t_head_order
-- ----------------------------
DROP TABLE IF EXISTS `t_head_order`;
CREATE TABLE `t_head_order`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `buy_sum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `delivery_time` datetime(0) NULL DEFAULT NULL,
  `document_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `purchase_time` datetime(0) NULL DEFAULT NULL,
  `supplier_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_head_order
-- ----------------------------
INSERT INTO `t_head_order` VALUES ('94643613325070336', 'admin', NULL, 0, 0, 'admin', '2019-01-07 18:12:17', '111', NULL, '201901071812166278', '2019-01-07 18:12:17', '94583877296721920');
INSERT INTO `t_head_order` VALUES ('94890173090762752', 'test', NULL, 0, 0, 'test', '2019-01-08 10:32:01', '111', NULL, '201901081032015711', '2019-01-08 10:32:01', '94583877296721920');
INSERT INTO `t_head_order` VALUES ('94890358193786880', 'test', NULL, 0, 0, 'test', '2019-01-08 10:32:46', '111', NULL, '20190108103245914', '2019-01-08 10:32:46', '94583877296721920');
INSERT INTO `t_head_order` VALUES ('94893012777177088', 'admin', NULL, 0, 0, 'admin', '2019-01-08 10:43:19', '111', NULL, '201901081043183889', '2019-01-08 10:43:19', '94583877296721920');
INSERT INTO `t_head_order` VALUES ('94905267912708096', 'admin', '2019-01-08 11:32:00', 0, 0, 'admin', NULL, '111', '2019-01-08 11:32:00', '201901081132008562', NULL, '94583877296721920');

-- ----------------------------
-- Table structure for t_head_stock_inventory
-- ----------------------------
DROP TABLE IF EXISTS `t_head_stock_inventory`;
CREATE TABLE `t_head_stock_inventory`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `document_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stock_types` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_head_supplier
-- ----------------------------
DROP TABLE IF EXISTS `t_head_supplier`;
CREATE TABLE `t_head_supplier`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `linkman` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `linkman_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sfds` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplier_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplier_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_head_supplier
-- ----------------------------
INSERT INTO `t_head_supplier` VALUES ('94583877296721920', 'admin', '2019-01-07 14:14:55', 0, 0, 'admin', '2019-01-07 14:14:55', '马素英', '', '', '月结', 'ZYCF01', '中央厨房');

-- ----------------------------
-- Table structure for t_job
-- ----------------------------
DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `cost_time` int(11) NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `request_param` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `request_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `request_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staus` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES ('89466531603288064', NULL, '2018-12-24 11:20:25', 0, NULL, '2018-12-24 11:20:25', 272, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', NULL, NULL);
INSERT INTO `t_log` VALUES ('89504323876163584', NULL, '2018-12-24 13:50:35', 0, NULL, '2018-12-24 13:50:35', 305, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', NULL, NULL);
INSERT INTO `t_log` VALUES ('89507116179525632', NULL, '2018-12-24 14:01:42', 0, NULL, '2018-12-24 14:01:42', 1423, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', NULL, NULL);
INSERT INTO `t_log` VALUES ('89507460095676416', NULL, '2018-12-24 14:03:03', 0, NULL, '2018-12-24 14:03:03', 220, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', NULL, NULL);
INSERT INTO `t_log` VALUES ('89507492991602688', NULL, '2018-12-24 14:03:10', 0, NULL, '2018-12-24 14:03:10', 135, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', NULL, NULL);
INSERT INTO `t_log` VALUES ('89507513157816320', NULL, '2018-12-24 14:03:15', 0, NULL, '2018-12-24 14:03:15', 112, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', NULL, NULL);
INSERT INTO `t_log` VALUES ('89507526990630912', NULL, '2018-12-24 14:03:19', 0, NULL, '2018-12-24 14:03:19', 110, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', NULL, NULL);
INSERT INTO `t_log` VALUES ('89513184100093952', NULL, '2018-12-24 14:25:47', 0, NULL, '2018-12-24 14:25:47', 124, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', NULL, NULL);
INSERT INTO `t_log` VALUES ('89515805946941440', NULL, '2018-12-24 14:36:13', 0, NULL, '2018-12-24 14:36:13', 227, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', NULL, NULL);
INSERT INTO `t_log` VALUES ('89538101566771200', NULL, '2018-12-24 16:04:48', 0, NULL, '2018-12-24 16:04:48', 250, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 0, NULL);
INSERT INTO `t_log` VALUES ('89538124635443200', NULL, '2018-12-24 16:04:54', 0, NULL, '2018-12-24 16:04:54', 116, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 0, NULL);
INSERT INTO `t_log` VALUES ('89560681602355200', NULL, '2018-12-24 17:34:32', 0, NULL, '2018-12-24 17:34:32', 330, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 0, NULL);
INSERT INTO `t_log` VALUES ('89561845181976576', NULL, '2018-12-24 17:39:09', 0, NULL, '2018-12-24 17:39:09', 181, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 0, NULL);
INSERT INTO `t_log` VALUES ('89803107277475840', NULL, '2018-12-25 09:37:51', 0, NULL, '2018-12-25 09:37:51', 639, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 0, NULL);
INSERT INTO `t_log` VALUES ('89805404007043072', NULL, '2018-12-25 09:46:58', 0, NULL, '2018-12-25 09:46:58', 200, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 0, NULL);
INSERT INTO `t_log` VALUES ('89809337513414656', NULL, '2018-12-25 10:02:36', 0, NULL, '2018-12-25 10:02:36', 183, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 0, NULL);
INSERT INTO `t_log` VALUES ('89812491613245440', NULL, '2018-12-25 10:15:08', 0, NULL, '2018-12-25 10:15:08', 177, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 0, NULL);
INSERT INTO `t_log` VALUES ('89818389932937216', NULL, '2018-12-25 10:38:35', 0, NULL, '2018-12-25 10:38:35', 1486, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 0, NULL);
INSERT INTO `t_log` VALUES ('89833394199859200', NULL, '2018-12-25 11:38:12', 0, NULL, '2018-12-25 11:38:12', 295, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('89833546838970368', NULL, '2018-12-25 11:38:48', 0, NULL, '2018-12-25 11:38:48', 207, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('89837798592352256', NULL, '2018-12-25 11:55:42', 0, NULL, '2018-12-25 11:55:42', 297, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('89865164974723072', NULL, '2018-12-25 13:44:26', 0, NULL, '2018-12-25 13:44:26', 288, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('89869645971984384', NULL, '2018-12-25 14:02:15', 0, NULL, '2018-12-25 14:02:15', 210, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('89881718219083776', NULL, '2018-12-25 14:50:13', 0, NULL, '2018-12-25 14:50:13', 278, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('89885986430914560', NULL, '2018-12-25 15:07:10', 0, NULL, '2018-12-25 15:07:10', 204, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('89898672606679040', NULL, '2018-12-25 15:57:35', 0, NULL, '2018-12-25 15:57:35', 270, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('89913225784594432', NULL, '2018-12-25 16:55:25', 0, NULL, '2018-12-25 16:55:25', 270, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('89917012771344384', NULL, '2018-12-25 17:10:28', 0, NULL, '2018-12-25 17:10:28', 258, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('89923451518717952', NULL, '2018-12-25 17:36:03', 0, NULL, '2018-12-25 17:36:03', 520, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('89940243477696512', NULL, '2018-12-25 18:42:46', 0, NULL, '2018-12-25 18:42:46', 183, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90162347234037760', NULL, '2018-12-26 09:25:20', 0, NULL, '2018-12-26 09:25:20', 340, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90180954152243200', NULL, '2018-12-26 10:39:16', 0, NULL, '2018-12-26 10:39:16', 289, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90228886461222912', NULL, '2018-12-26 13:49:44', 0, NULL, '2018-12-26 13:49:44', 268, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90260383599693824', NULL, '2018-12-26 15:54:54', 0, NULL, '2018-12-26 15:54:54', 401, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90260603305725952', NULL, '2018-12-26 15:55:46', 0, NULL, '2018-12-26 15:55:46', 200, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90529776636268544', NULL, '2018-12-27 09:45:24', 0, NULL, '2018-12-27 09:45:24', 2144, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90531601129148416', NULL, '2018-12-27 09:52:37', 0, NULL, '2018-12-27 09:52:37', 184, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90547869840314368', NULL, '2018-12-27 10:57:16', 0, NULL, '2018-12-27 10:57:16', 212, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90548887684648960', NULL, '2018-12-27 11:01:19', 0, NULL, '2018-12-27 11:01:19', 573, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90551983261356032', NULL, '2018-12-27 11:13:37', 0, NULL, '2018-12-27 11:13:37', 332, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90558256165949440', NULL, '2018-12-27 11:38:32', 0, NULL, '2018-12-27 11:38:32', 394, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90588181623214080', NULL, '2018-12-27 13:37:27', 0, NULL, '2018-12-27 13:37:27', 297, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90592867243790336', NULL, '2018-12-27 13:56:04', 0, NULL, '2018-12-27 13:56:04', 285, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90613908573786112', NULL, '2018-12-27 15:19:41', 0, NULL, '2018-12-27 15:19:41', 446, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90616971996958720', NULL, '2018-12-27 15:31:51', 0, NULL, '2018-12-27 15:31:51', 207, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90621098277736448', NULL, '2018-12-27 15:48:15', 0, NULL, '2018-12-27 15:48:15', 294, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90624034470891520', NULL, '2018-12-27 15:59:55', 0, NULL, '2018-12-27 15:59:55', 389, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90631912393019392', NULL, '2018-12-27 16:31:13', 0, NULL, '2018-12-27 16:31:13', 294, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90634766746914816', NULL, '2018-12-27 16:42:34', 0, NULL, '2018-12-27 16:42:34', 309, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90904520237780992', NULL, '2018-12-28 10:34:28', 0, NULL, '2018-12-28 10:34:28', 356, '192.168.2.173', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90916131862220800', NULL, '2018-12-28 11:20:37', 0, NULL, '2018-12-28 11:20:37', 597, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90916997650452480', NULL, '2018-12-28 11:24:03', 0, NULL, '2018-12-28 11:24:03', 321, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90917340182482944', NULL, '2018-12-28 11:25:24', 0, NULL, '2018-12-28 11:25:24', 168, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90917366816313344', NULL, '2018-12-28 11:25:31', 0, NULL, '2018-12-28 11:25:31', 125, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90917384256229376', NULL, '2018-12-28 11:25:35', 0, NULL, '2018-12-28 11:25:35', 121, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90951881542602752', NULL, '2018-12-28 13:42:40', 0, NULL, '2018-12-28 13:42:40', 325, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90952792453156864', NULL, '2018-12-28 13:46:17', 0, NULL, '2018-12-28 13:46:17', 130, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90961434061574144', NULL, '2018-12-28 14:20:38', 0, NULL, '2018-12-28 14:20:38', 453, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90963423579344896', NULL, '2018-12-28 14:28:32', 0, NULL, '2018-12-28 14:28:32', 363, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90969717258326016', NULL, '2018-12-28 14:53:32', 0, NULL, '2018-12-28 14:53:32', 391, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90977272336486400', NULL, '2018-12-28 15:23:33', 0, NULL, '2018-12-28 15:23:33', 406, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90980477199978496', NULL, '2018-12-28 15:36:18', 0, NULL, '2018-12-28 15:36:18', 406, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90981743741374464', NULL, '2018-12-28 15:41:20', 0, NULL, '2018-12-28 15:41:20', 377, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90984163716370432', NULL, '2018-12-28 15:50:58', 0, NULL, '2018-12-28 15:50:58', 343, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('90988892643135488', NULL, '2018-12-28 16:09:44', 0, NULL, '2018-12-28 16:09:44', 364, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('91322911830315008', NULL, '2018-12-29 14:17:01', 0, NULL, '2018-12-29 14:17:01', 487, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('91325469068103680', NULL, '2018-12-29 14:27:10', 0, NULL, '2018-12-29 14:27:10', 217, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('91331449046700032', NULL, '2018-12-29 14:50:56', 0, NULL, '2018-12-29 14:50:56', 402, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('91338928832909312', NULL, '2018-12-29 15:20:39', 0, NULL, '2018-12-29 15:20:39', 231, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('91349348339683328', NULL, '2018-12-29 16:02:03', 0, NULL, '2018-12-29 16:02:03', 466, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('91351273122566144', NULL, '2018-12-29 16:09:42', 0, NULL, '2018-12-29 16:09:42', 469, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('91354278026809344', NULL, '2018-12-29 16:21:39', 0, NULL, '2018-12-29 16:21:39', 372, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('91365465238016000', NULL, '2018-12-29 17:06:06', 0, NULL, '2018-12-29 17:06:06', 569, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('91366668759994368', NULL, '2018-12-29 17:10:53', 0, NULL, '2018-12-29 17:10:53', 416, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('91372765923250176', NULL, '2018-12-29 17:35:07', 0, NULL, '2018-12-29 17:35:07', 475, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92696132177629184', NULL, '2019-01-02 09:13:42', 0, NULL, '2019-01-02 09:13:42', 431, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92698379078864896', NULL, '2019-01-02 09:22:37', 0, NULL, '2019-01-02 09:22:37', 346, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92699756018536448', NULL, '2019-01-02 09:28:05', 0, NULL, '2019-01-02 09:28:05', 330, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92702009718738944', NULL, '2019-01-02 09:37:03', 0, NULL, '2019-01-02 09:37:03', 481, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92704678613094400', NULL, '2019-01-02 09:47:40', 0, NULL, '2019-01-02 09:47:40', 878, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92707065172070400', NULL, '2019-01-02 09:57:08', 0, NULL, '2019-01-02 09:57:08', 455, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92710026560409600', NULL, '2019-01-02 10:08:54', 0, NULL, '2019-01-02 10:08:54', 463, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92709965852053504', NULL, '2019-01-02 10:08:40', 0, NULL, '2019-01-02 10:08:40', 215, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92713273417273344', NULL, '2019-01-02 10:21:48', 0, NULL, '2019-01-02 10:21:48', 361, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92714979337179136', NULL, '2019-01-02 10:28:36', 0, NULL, '2019-01-02 10:28:36', 906, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92716174894174208', NULL, '2019-01-02 10:33:20', 0, NULL, '2019-01-02 10:33:20', 211, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92717771581820928', NULL, '2019-01-02 10:39:41', 0, NULL, '2019-01-02 10:39:41', 188, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92717434389139456', NULL, '2019-01-02 10:38:20', 0, NULL, '2019-01-02 10:38:20', 123, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92717716795822080', NULL, '2019-01-02 10:39:28', 0, NULL, '2019-01-02 10:39:28', 259, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92718652528267264', NULL, '2019-01-02 10:43:11', 0, NULL, '2019-01-02 10:43:11', 284, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92718467483963392', NULL, '2019-01-02 10:42:27', 0, NULL, '2019-01-02 10:42:27', 213, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92727514211815424', NULL, '2019-01-02 11:18:24', 0, NULL, '2019-01-02 11:18:24', 299, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92728822146797568', NULL, '2019-01-02 11:23:35', 0, NULL, '2019-01-02 11:23:35', 296, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92747267265531904', NULL, '2019-01-02 12:36:53', 0, NULL, '2019-01-02 12:36:53', 492, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92763904425332736', NULL, '2019-01-02 13:43:00', 0, NULL, '2019-01-02 13:43:00', 375, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92769211729842176', NULL, '2019-01-02 14:04:06', 0, NULL, '2019-01-02 14:04:06', 902, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92774250829582336', NULL, '2019-01-02 14:24:07', 0, NULL, '2019-01-02 14:24:07', 570, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92777526396456960', NULL, '2019-01-02 14:37:08', 0, NULL, '2019-01-02 14:37:08', 487, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92780106128297984', NULL, '2019-01-02 14:47:23', 0, NULL, '2019-01-02 14:47:23', 224, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92784556951736320', NULL, '2019-01-02 15:05:04', 0, NULL, '2019-01-02 15:05:04', 369, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92791365380870144', NULL, '2019-01-02 15:32:07', 0, NULL, '2019-01-02 15:32:07', 495, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92796988197703680', NULL, '2019-01-02 15:54:28', 0, NULL, '2019-01-02 15:54:28', 457, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92797648695726080', NULL, '2019-01-02 15:57:06', 0, NULL, '2019-01-02 15:57:06', 783, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92798355272372224', NULL, '2019-01-02 15:59:53', 0, NULL, '2019-01-02 15:59:53', 257, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92801548169515008', NULL, '2019-01-02 16:12:36', 0, NULL, '2019-01-02 16:12:36', 1044, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92804858662359040', NULL, '2019-01-02 16:25:45', 0, NULL, '2019-01-02 16:25:45', 939, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92806536245547008', NULL, '2019-01-02 16:32:25', 0, NULL, '2019-01-02 16:32:25', 1211, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92816901272506368', NULL, '2019-01-02 17:13:35', 0, NULL, '2019-01-02 17:13:35', 390, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92828603879788544', NULL, '2019-01-02 18:00:06', 0, NULL, '2019-01-02 18:00:06', 1053, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92834603651305472', NULL, '2019-01-02 18:23:56', 0, NULL, '2019-01-02 18:23:56', 556, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('92836705471565824', NULL, '2019-01-02 18:32:17', 0, NULL, '2019-01-02 18:32:17', 208, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93060769922420736', NULL, '2019-01-03 09:22:38', 0, NULL, '2019-01-03 09:22:38', 450, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93085498557337600', NULL, '2019-01-03 11:00:54', 0, NULL, '2019-01-03 11:00:54', 379, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93089451877601280', NULL, '2019-01-03 11:16:36', 0, NULL, '2019-01-03 11:16:36', 475, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93096186516344832', NULL, '2019-01-03 11:43:22', 0, NULL, '2019-01-03 11:43:22', 362, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93133475334328320', NULL, '2019-01-03 14:11:32', 0, NULL, '2019-01-03 14:11:32', 327, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93138475238297600', NULL, '2019-01-03 14:31:24', 0, NULL, '2019-01-03 14:31:24', 407, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93139138970128384', NULL, '2019-01-03 14:34:03', 0, NULL, '2019-01-03 14:34:03', 307, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93151247539900416', NULL, '2019-01-03 15:22:09', 0, NULL, '2019-01-03 15:22:09', 330, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"test\"}', 'POST', '/minshang/login', 'test', NULL, 0);
INSERT INTO `t_log` VALUES ('93154823595102208', NULL, '2019-01-03 15:36:22', 0, NULL, '2019-01-03 15:36:22', 200, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93154854863638528', NULL, '2019-01-03 15:36:30', 0, NULL, '2019-01-03 15:36:30', 372, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"test\"}', 'POST', '/minshang/login', 'test', NULL, 0);
INSERT INTO `t_log` VALUES ('93157445169319936', NULL, '2019-01-03 15:46:47', 0, NULL, '2019-01-03 15:46:47', 201, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93163607684026368', NULL, '2019-01-03 16:11:16', 0, NULL, '2019-01-03 16:11:16', 280, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93175072591712256', NULL, '2019-01-03 16:56:51', 0, NULL, '2019-01-03 16:56:51', 1295, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"test\"}', 'POST', '/minshang/login', 'test', NULL, 0);
INSERT INTO `t_log` VALUES ('93175566118686720', NULL, '2019-01-03 16:58:48', 0, NULL, '2019-01-03 16:58:48', 1104, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93175909992894464', NULL, '2019-01-03 17:00:10', 0, NULL, '2019-01-03 17:00:10', 1039, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93179007469621248', NULL, '2019-01-03 17:12:29', 0, NULL, '2019-01-03 17:12:29', 1115, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93181814893449216', NULL, '2019-01-03 17:23:38', 0, NULL, '2019-01-03 17:23:38', 1295, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93182603829448704', NULL, '2019-01-03 17:26:46', 0, NULL, '2019-01-03 17:26:46', 1160, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93190844256882688', NULL, '2019-01-03 17:59:31', 0, NULL, '2019-01-03 17:59:31', 1199, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93191582689267712', NULL, '2019-01-03 18:02:27', 0, NULL, '2019-01-03 18:02:27', 1107, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93192015155564544', NULL, '2019-01-03 18:04:10', 0, NULL, '2019-01-03 18:04:10', 1183, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93192221968306176', NULL, '2019-01-03 18:04:59', 0, NULL, '2019-01-03 18:04:59', 1039, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"test\"}', 'POST', '/minshang/login', 'test', NULL, 0);
INSERT INTO `t_log` VALUES ('93418379896950784', NULL, '2019-01-04 09:03:39', 0, NULL, '2019-01-04 09:03:39', 329, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93424645130162176', NULL, '2019-01-04 09:28:33', 0, NULL, '2019-01-04 09:28:33', 458, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93426692017623040', NULL, '2019-01-04 09:36:41', 0, NULL, '2019-01-04 09:36:41', 505, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93428273169567744', NULL, '2019-01-04 09:42:58', 0, NULL, '2019-01-04 09:42:58', 500, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93429489157017600', NULL, '2019-01-04 09:47:47', 0, NULL, '2019-01-04 09:47:47', 255, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"test\"}', 'POST', '/minshang/login', 'test', NULL, 0);
INSERT INTO `t_log` VALUES ('93431488963416064', NULL, '2019-01-04 09:55:44', 0, NULL, '2019-01-04 09:55:44', 252, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"test\"}', 'POST', '/minshang/login', 'test', NULL, 0);
INSERT INTO `t_log` VALUES ('93438086532304896', NULL, '2019-01-04 10:22:00', 0, NULL, '2019-01-04 10:22:00', 3211, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93439303589302272', NULL, '2019-01-04 10:26:47', 0, NULL, '2019-01-04 10:26:47', 298, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93445468087914496', NULL, '2019-01-04 10:51:17', 0, NULL, '2019-01-04 10:51:17', 341, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93446717801762816', NULL, '2019-01-04 10:56:15', 0, NULL, '2019-01-04 10:56:15', 235, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"test\"}', 'POST', '/minshang/login', 'test', NULL, 0);
INSERT INTO `t_log` VALUES ('93448764156547072', NULL, '2019-01-04 11:04:23', 0, NULL, '2019-01-04 11:04:23', 465, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93453443011710976', NULL, '2019-01-04 11:22:58', 0, NULL, '2019-01-04 11:22:58', 238, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93461548340613120', NULL, '2019-01-04 11:55:11', 0, NULL, '2019-01-04 11:55:11', 370, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"test\"}', 'POST', '/minshang/login', 'test', NULL, 0);
INSERT INTO `t_log` VALUES ('93488735043194880', NULL, '2019-01-04 13:43:13', 0, NULL, '2019-01-04 13:43:13', 282, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93489613221400576', NULL, '2019-01-04 13:46:42', 0, NULL, '2019-01-04 13:46:42', 269, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93500325423484928', NULL, '2019-01-04 14:29:16', 0, NULL, '2019-01-04 14:29:16', 387, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93505700184985600', NULL, '2019-01-04 14:50:38', 0, NULL, '2019-01-04 14:50:38', 299, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93513149604433920', NULL, '2019-01-04 15:20:14', 0, NULL, '2019-01-04 15:20:14', 236, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93512867688484864', NULL, '2019-01-04 15:19:07', 0, NULL, '2019-01-04 15:19:07', 393, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93513590849409024', NULL, '2019-01-04 15:21:59', 0, NULL, '2019-01-04 15:21:59', 361, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"test\"}', 'POST', '/minshang/login', 'test', NULL, 0);
INSERT INTO `t_log` VALUES ('93514086293180416', NULL, '2019-01-04 15:23:57', 0, NULL, '2019-01-04 15:23:57', 203, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"test\"}', 'POST', '/minshang/login', 'test', NULL, 0);
INSERT INTO `t_log` VALUES ('93517150609739776', NULL, '2019-01-04 15:36:08', 0, NULL, '2019-01-04 15:36:08', 379, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93517918188343296', NULL, '2019-01-04 15:39:11', 0, NULL, '2019-01-04 15:39:11', 294, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93520398259326976', NULL, '2019-01-04 15:49:02', 0, NULL, '2019-01-04 15:49:02', 373, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"test\"}', 'POST', '/minshang/login', 'test', NULL, 0);
INSERT INTO `t_log` VALUES ('93521937245933568', NULL, '2019-01-04 15:55:09', 0, NULL, '2019-01-04 15:55:09', 287, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"test\"}', 'POST', '/minshang/login', 'test', NULL, 0);
INSERT INTO `t_log` VALUES ('93525624060121088', NULL, '2019-01-04 16:09:48', 0, NULL, '2019-01-04 16:09:48', 255, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"test\"}', 'POST', '/minshang/login', 'test', NULL, 0);
INSERT INTO `t_log` VALUES ('93526265625055232', NULL, '2019-01-04 16:12:21', 0, NULL, '2019-01-04 16:12:21', 460, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93543613820047360', NULL, '2019-01-04 17:21:17', 0, NULL, '2019-01-04 17:21:17', 454, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('93545132254564352', NULL, '2019-01-04 17:27:19', 0, NULL, '2019-01-04 17:27:19', 262, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"test\"}', 'POST', '/minshang/login', 'test', NULL, 0);
INSERT INTO `t_log` VALUES ('94512402917232640', NULL, '2019-01-07 09:30:54', 0, NULL, '2019-01-07 09:30:54', 334, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('94513191886786560', NULL, '2019-01-07 09:34:03', 0, NULL, '2019-01-07 09:34:03', 536, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('94515384647946240', NULL, '2019-01-07 09:42:45', 0, NULL, '2019-01-07 09:42:45', 419, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"test\"}', 'POST', '/minshang/login', 'test', NULL, 0);
INSERT INTO `t_log` VALUES ('94523152306016256', NULL, '2019-01-07 10:13:37', 0, NULL, '2019-01-07 10:13:37', 283, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('94522858797010944', NULL, '2019-01-07 10:12:27', 0, NULL, '2019-01-07 10:12:27', 124, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"test\"}', 'POST', '/minshang/login', 'test', NULL, 0);
INSERT INTO `t_log` VALUES ('94522995489378304', NULL, '2019-01-07 10:12:59', 0, NULL, '2019-01-07 10:12:59', 126, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"test\"}', 'POST', '/minshang/login', 'test', NULL, 0);
INSERT INTO `t_log` VALUES ('94524122586943488', NULL, '2019-01-07 10:17:28', 0, NULL, '2019-01-07 10:17:28', 283, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"test\"}', 'POST', '/minshang/login', 'test', NULL, 0);
INSERT INTO `t_log` VALUES ('94525683291656192', NULL, '2019-01-07 10:23:41', 0, NULL, '2019-01-07 10:23:41', 366, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"test\"}', 'POST', '/minshang/login', 'test', NULL, 0);
INSERT INTO `t_log` VALUES ('94538917633593344', NULL, '2019-01-07 11:16:16', 0, NULL, '2019-01-07 11:16:16', 183, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('94548737585582080', NULL, '2019-01-07 11:55:17', 0, NULL, '2019-01-07 11:55:17', 400, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('94549679735312384', NULL, '2019-01-07 11:59:02', 0, NULL, '2019-01-07 11:59:02', 275, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('94573967158808576', NULL, '2019-01-07 13:35:32', 0, NULL, '2019-01-07 13:35:32', 124, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('94577748651020288', NULL, '2019-01-07 13:50:34', 0, NULL, '2019-01-07 13:50:34', 194, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('94578951720013824', NULL, '2019-01-07 13:55:21', 0, NULL, '2019-01-07 13:55:21', 268, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('94580290470547456', NULL, '2019-01-07 14:00:40', 0, NULL, '2019-01-07 14:00:40', 490, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('94580024543285248', NULL, '2019-01-07 13:59:36', 0, NULL, '2019-01-07 13:59:36', 261, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('94586103993995264', NULL, '2019-01-07 14:23:46', 0, NULL, '2019-01-07 14:23:46', 350, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"test\"}', 'POST', '/minshang/login', 'test', NULL, 0);
INSERT INTO `t_log` VALUES ('94590478393020416', NULL, '2019-01-07 14:41:09', 0, NULL, '2019-01-07 14:41:09', 284, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"test\"}', 'POST', '/minshang/login', 'test', NULL, 0);
INSERT INTO `t_log` VALUES ('94599109750558720', NULL, '2019-01-07 15:15:27', 0, NULL, '2019-01-07 15:15:27', 291, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"test\"}', 'POST', '/minshang/login', 'test', NULL, 0);
INSERT INTO `t_log` VALUES ('94602513537306624', NULL, '2019-01-07 15:28:58', 0, NULL, '2019-01-07 15:28:58', 404, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('94616309194559488', NULL, '2019-01-07 16:23:47', 0, NULL, '2019-01-07 16:23:47', 258, '192.168.2.156', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('94616179821252608', NULL, '2019-01-07 16:23:19', 0, NULL, '2019-01-07 16:23:19', 3219, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"test\"}', 'POST', '/minshang/login', 'test', NULL, 0);
INSERT INTO `t_log` VALUES ('94617045458489344', NULL, '2019-01-07 16:26:43', 0, NULL, '2019-01-07 16:26:43', 315, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"test\"}', 'POST', '/minshang/login', 'test', NULL, 0);
INSERT INTO `t_log` VALUES ('94618013227028480', NULL, '2019-01-07 16:30:34', 0, NULL, '2019-01-07 16:30:34', 1107, '192.168.2.148', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('94619536409497600', NULL, '2019-01-07 16:36:37', 0, NULL, '2019-01-07 16:36:37', 299, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"test\"}', 'POST', '/minshang/login', 'test', NULL, 0);
INSERT INTO `t_log` VALUES ('94620463438761984', NULL, '2019-01-07 16:40:18', 0, NULL, '2019-01-07 16:40:18', 277, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"test\"}', 'POST', '/minshang/login', 'test', NULL, 0);
INSERT INTO `t_log` VALUES ('94623224817520640', NULL, '2019-01-07 16:51:16', 0, NULL, '2019-01-07 16:51:16', 126, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"test\"}', 'POST', '/minshang/login', 'test', NULL, 0);
INSERT INTO `t_log` VALUES ('94625775927431168', NULL, '2019-01-07 17:01:25', 0, NULL, '2019-01-07 17:01:25', 377, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"test\"}', 'POST', '/minshang/login', 'test', NULL, 0);
INSERT INTO `t_log` VALUES ('94637257352286208', NULL, '2019-01-07 17:47:02', 0, NULL, '2019-01-07 17:47:02', 369, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"test\"}', 'POST', '/minshang/login', 'test', NULL, 0);
INSERT INTO `t_log` VALUES ('94643176165347328', NULL, '2019-01-07 18:10:33', 0, NULL, '2019-01-07 18:10:33', 461, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('94875290274107392', NULL, '2019-01-08 09:32:53', 0, NULL, '2019-01-08 09:32:53', 266, '192.168.2.156', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('94875484256473088', NULL, '2019-01-08 09:33:40', 0, NULL, '2019-01-08 09:33:40', 477, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('94876041486536704', NULL, '2019-01-08 09:35:53', 0, NULL, '2019-01-08 09:35:53', 387, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"test\"}', 'POST', '/minshang/login', 'test', NULL, 0);
INSERT INTO `t_log` VALUES ('94878374446501888', NULL, '2019-01-08 09:45:09', 0, NULL, '2019-01-08 09:45:09', 1353, '192.168.2.148', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('94883283979997184', NULL, '2019-01-08 10:04:39', 0, NULL, '2019-01-08 10:04:39', 203, '192.168.2.156', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('94890097421324288', NULL, '2019-01-08 10:31:44', 0, NULL, '2019-01-08 10:31:44', 377, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"test\"}', 'POST', '/minshang/login', 'test', NULL, 0);
INSERT INTO `t_log` VALUES ('94892962583941120', NULL, '2019-01-08 10:43:07', 0, NULL, '2019-01-08 10:43:07', 377, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('94905191085641728', NULL, '2019-01-08 11:31:42', 0, NULL, '2019-01-08 11:31:42', 414, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('94940223154163712', NULL, '2019-01-08 13:50:55', 0, NULL, '2019-01-08 13:50:55', 302, '192.168.2.156', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('94940813884133376', NULL, '2019-01-08 13:53:15', 0, NULL, '2019-01-08 13:53:15', 406, '192.168.2.156', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('94943869082275840', NULL, '2019-01-08 14:05:24', 0, NULL, '2019-01-08 14:05:24', 286, '192.168.2.156', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('94944415973380096', NULL, '2019-01-08 14:07:34', 0, NULL, '2019-01-08 14:07:34', 321, '192.168.2.156', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('94945110332018688', NULL, '2019-01-08 14:10:20', 0, NULL, '2019-01-08 14:10:20', 216, '192.168.2.156', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('94947404377231360', NULL, '2019-01-08 14:19:27', 0, NULL, '2019-01-08 14:19:27', 468, '192.168.2.156', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('94947671512453120', NULL, '2019-01-08 14:20:30', 0, NULL, '2019-01-08 14:20:30', 225, '192.168.2.156', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('94948221301821440', NULL, '2019-01-08 14:22:41', 0, NULL, '2019-01-08 14:22:41', 210, '192.168.2.156', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('94948575703732224', NULL, '2019-01-08 14:24:06', 0, NULL, '2019-01-08 14:24:06', 294, '192.168.2.156', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('94959547130580992', NULL, '2019-01-08 15:07:42', 0, NULL, '2019-01-08 15:07:42', 416, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('94961875900436480', NULL, '2019-01-08 15:16:57', 0, NULL, '2019-01-08 15:16:57', 282, '192.168.2.156', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('94962645311950848', NULL, '2019-01-08 15:20:01', 0, NULL, '2019-01-08 15:20:01', 513, '192.168.2.162', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('94972079950008320', NULL, '2019-01-08 15:57:30', 0, NULL, '2019-01-08 15:57:30', 446, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"test\"}', 'POST', '/minshang/login', 'test', NULL, 0);

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `create_send` bit(1) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `staus` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES ('43615268366192640', '', '2018-08-19 22:43:51', 0, '', '2018-08-24 23:02:13', b'1', '欢迎您注册账号使用X-Boot 点我查看使用须知', 0, '<p style=\"text-align: center;\">X-Boot是很棒的Web前后端分离开发平台，开源版本请遵循GPL v3.0开源协议，不得闭源，商用需求请联系作者签署授权协议。</p><p style=\"text-align: center;\">捐赠获取完整版：<a href=\"http://xpay.exrick.cn/pay?xboot\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255);\">立即去捐赠获取</a></p><p style=\"text-align: center;\"><img src=\"https://i.loli.net/2018/08/24/5b801c8652227.png\" style=\"max-width:150px;\"><br></p><p style=\"text-align: center;\">（支持手机扫码支付）</p><p style=\"text-align: center;\">获取商用授权：<a href=\"http://wpa.qq.com/msgrd?v=3&amp;uin=1012139570&amp;site=qq&amp;menu=yes\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255);\">立即联系作者获取商用授权</a></p>', NULL, NULL);

-- ----------------------------
-- Table structure for t_message_send
-- ----------------------------
DROP TABLE IF EXISTS `t_message_send`;
CREATE TABLE `t_message_send`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `message_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staus` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_message_send
-- ----------------------------
INSERT INTO `t_message_send` VALUES ('43615268663988224', NULL, '2018-08-19 22:43:51', 0, NULL, '2018-08-19 22:43:51', '43615268366192640', 0, '682265633886209', NULL);
INSERT INTO `t_message_send` VALUES ('43615268663988225', NULL, '2018-08-19 22:43:51', 0, NULL, '2018-08-19 22:43:51', '43615268366192640', 0, '16739222421508096', NULL);
INSERT INTO `t_message_send` VALUES ('43615268663988226', '', '2018-08-19 22:43:51', 0, '', '2018-08-24 12:41:24', '43615268366192640', 2, '4363087427670016', NULL);
INSERT INTO `t_message_send` VALUES ('43615268663988227', '', '2018-08-19 22:43:51', 0, '', '2018-10-11 00:03:12', '43615268366192640', 1, '682265633886208', NULL);

-- ----------------------------
-- Table structure for t_org_brandarea
-- ----------------------------
DROP TABLE IF EXISTS `t_org_brandarea`;
CREATE TABLE `t_org_brandarea`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `brand_area_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `org_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_org_brandarea
-- ----------------------------
INSERT INTO `t_org_brandarea` VALUES ('1', 'admin', '2019-01-03 11:20:05', 0, 0, 'admin', '2019-01-03 11:20:31', '90978217430618112', '89838476689674240');
INSERT INTO `t_org_brandarea` VALUES ('2', 'admin', '2018-11-02 23:47:49', 0, 0, 'admin', '2018-11-02 23:47:49', '90978217430618112', '89869690112839680');
INSERT INTO `t_org_brandarea` VALUES ('3', 'admin', '2018-11-02 23:47:49', 0, 0, 'admin', '2018-11-02 23:47:49', NULL, '89869690112839680');
INSERT INTO `t_org_brandarea` VALUES ('4', 'admin', '2018-11-02 23:47:49', 0, 0, 'admin', '2018-11-02 23:47:49', NULL, '89869690112839680');
INSERT INTO `t_org_brandarea` VALUES ('5', 'admin', '2018-11-02 23:47:49', 0, 0, 'admin', '2018-11-02 23:47:49', NULL, '89869690112839680');
INSERT INTO `t_org_brandarea` VALUES ('6', 'admin', '2018-11-02 23:47:49', 0, 0, 'admin', '2018-11-02 23:47:49', NULL, '89869690112839680');
INSERT INTO `t_org_brandarea` VALUES ('7', 'admin', '2018-11-02 23:47:49', 0, 0, 'admin', '2018-11-02 23:47:49', NULL, '89869690112839680');
INSERT INTO `t_org_brandarea` VALUES ('8', 'admin', '2018-11-02 23:47:49', 0, 0, 'admin', '2018-11-02 23:47:49', NULL, '89869690112839680');
INSERT INTO `t_org_brandarea` VALUES ('9', 'admin', '2018-11-02 23:47:49', 0, 0, 'admin', '2018-11-02 23:47:49', NULL, '89869690112839680');
INSERT INTO `t_org_brandarea` VALUES ('10', 'admin', '2018-11-02 23:47:49', 0, 0, 'admin', '2018-11-02 23:47:49', NULL, '89869690112839680');

-- ----------------------------
-- Table structure for t_organization
-- ----------------------------
DROP TABLE IF EXISTS `t_organization`;
CREATE TABLE `t_organization`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机构id',
  `parent_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级id',
  `org_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构名称',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `activationkey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `brand_area_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `org_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shop_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shoptype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telphoneno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组织机构' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_organization
-- ----------------------------
INSERT INTO `t_organization` VALUES ('89838476689674240', '-1', '安业公司', 'admin', '2018-12-25 11:58:27', 0, 'admin', '2018-12-25 11:58:27', 0, '4032281165499504', '合肥', '90978217430618112', '1', 'asdbuh', '1', '18782059038');
INSERT INTO `t_organization` VALUES ('89869690112839680', '89838476689674240', '安业公司瑶海店', 'admin', '2018-12-25 14:02:42', 0, 'admin', '2018-12-25 14:02:42', 0, '0', '合肥', '90978232517529600', '0', '320561', '0', '18782059038');
INSERT INTO `t_organization` VALUES ('89870067138826240', '89838476689674240', '安业公司晋安店', 'admin', '2018-12-25 14:03:55', 0, 'admin', '2018-12-25 14:03:55', 0, '403245989848832', '合肥', '90978245368877056', '0', '啥丢', '0', '18782059038');
INSERT INTO `t_organization` VALUES ('89870101624393728', '89838476689674240', '安业公司长江店', 'admin', '2018-12-25 14:04:03', 0, 'admin', '2018-12-25 14:04:03', 0, '403228165498504', '合肥', '90978254566985728', '1', '654爱迪生', '1', '18782059038');
INSERT INTO `t_organization` VALUES ('89870134574845952', '89838476689674240', '安业公司望江店', 'admin', '2018-12-25 14:04:11', 0, 'admin', '2018-12-25 14:04:11', 0, '40322811518949504', '合肥', '90978217430618112', '1', '1是第三次', '1', '18782059038');
INSERT INTO `t_organization` VALUES ('89870158994083840', '89838476689674240', '安业公司芜湖店', 'admin', '2018-12-25 14:04:17', 0, 'admin', '2018-12-25 14:04:17', 0, '0', '合肥', '90978232517529600', '0', '他柔肤水', '0', '18782059038');
INSERT INTO `t_organization` VALUES ('89870186554855424', '89838476689674240', '安业公司步行街店', 'admin', '2018-12-25 14:04:23', 0, 'admin', '2018-12-25 14:04:23', 0, '40652270196169880', '合肥', '90978245368877056', '0', 's4dvj 4', '0', '18782059038');
INSERT INTO `t_organization` VALUES ('89870210927955968', '89838476689674240', '安业公司巢湖店', 'admin', '2018-12-25 14:04:29', 0, 'admin', '2018-12-25 14:04:29', 0, '403497849816043136', '合肥', '90978254566985728', '1', '受到客户', '1', '18782059038');
INSERT INTO `t_organization` VALUES ('89870244390113280', '89838476689674240', '安业公司肥东店', 'admin', '2018-12-25 14:04:37', 0, 'admin', '2018-12-25 14:04:37', 0, '0', '合肥', '90978217430618112', '1', '你是', '1', '18782059038');
INSERT INTO `t_organization` VALUES ('89870290128998400', '89838476689674240', '安业公司肥西店', 'admin', '2018-12-25 14:04:48', 0, 'admin', '2018-12-25 14:04:48', 0, '4034354984164615536', '合肥', '90978232517529600', '1', '是的扭花', '1', '18782059038');
INSERT INTO `t_organization` VALUES ('89870361297948672', '89838476689674240', '安业公司惠南店', 'admin', '2018-12-25 14:05:05', 0, 'admin', '2018-12-25 14:05:05', 0, '552145516566556256', '合肥', '90978254566985728', '1', '的水族馆', '1', '18782059038');

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `sort_order` decimal(10, 2) NULL DEFAULT NULL,
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` int(11) NULL DEFAULT NULL,
  `button_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staus` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES ('5129710648430592', '', '2018-06-04 19:02:29', 0, '', '2018-09-29 23:11:56', '', 'sys', '', 0, 1.00, 'Main', '/sys', '系统管理', 'ios-settings', 1, '', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('5129710648430593', '', '2018-06-04 19:02:32', 0, '', '2018-08-13 15:15:33', '', 'user-manage', '5129710648430592', 0, 1.10, 'sys/user-manage/userManage', 'user-manage', '用户管理', 'md-person', 2, '', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('5129710648430594', '', '2018-06-04 19:02:35', 0, '', '2018-10-13 13:51:36', '', 'role-manage', '5129710648430592', 0, 1.60, 'sys/role-manage/roleManage', 'role-manage', '角色权限管理', 'md-contacts', 2, '', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('5129710648430595', '', '2018-06-04 19:02:37', 0, '', '2018-09-23 23:32:02', '', 'menu-manage', '5129710648430592', 0, 1.70, 'sys/menu-manage/menuManage', 'menu-manage', '菜单权限管理', 'md-menu', 2, '', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('41375330996326400', '', '2018-08-13 18:23:08', 0, 'admin', '2018-10-20 22:47:07', '', 'simple-table', '41373430515240960', 0, 3.10, 'minshang-vue-template/simple-table/simpleTable', 'simple-table', '简单表格', 'ios-grid-outline', 2, '', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('15701400130424832', '', '2018-06-03 22:04:06', 0, '', '2018-09-19 22:16:44', '', '', '5129710648430593', 1, 1.11, '', '/minshang/user/admin/add*', '添加用户', '', 3, 'add', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('15701915807518720', '', '2018-06-03 22:06:09', 0, '', '2018-06-06 14:46:51', '', '', '5129710648430593', 1, 1.13, '', '/minshang/user/admin/disable/**', '禁用用户', '', 3, 'disable', 0, NULL, NULL);
INSERT INTO `t_permission` VALUES ('15708892205944832', '', '2018-06-03 22:33:52', 0, '', '2018-06-28 16:44:48', '', '', '5129710648430593', 1, 1.14, '', '/minshang/user/admin/enable/**', '启用用户', '', 3, 'enable', 0, NULL, NULL);
INSERT INTO `t_permission` VALUES ('16392452747300864', '', '2018-06-05 19:50:06', 0, 'admin', '2018-10-23 12:34:21', '', 'access', '', 0, 5.00, 'Main', '/access', '权限按钮测试页', 'md-lock', 1, '', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('16392767785668608', '', '2018-06-05 19:51:21', 0, 'admin', '2018-10-23 12:34:38', '', 'access_index', '16392452747300864', 0, 5.10, 'access/access', 'index', '权限按钮测试页', 'md-lock', 2, '', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('16438800255291392', '', '2018-06-05 22:54:18', 0, 'admin', '2018-10-23 12:34:51', '', '', '16392767785668608', 1, 5.11, '', 'test-add', '添加按钮测试', '', 3, 'add', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('16438962738434048', '', '2018-06-05 22:54:55', 0, 'admin', '2018-10-23 12:35:05', '', '', '16392767785668608', 1, 5.12, '', 'edit-test', '编辑按钮测试', '', 3, 'edit', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('16439068543946752', '', '2018-06-05 22:55:20', 0, 'admin', '2018-10-23 12:34:54', '', '', '16392767785668608', 1, 5.13, '', 'delete-test', '删除按钮测试', '', 3, 'delete', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('16678126574637056', '', '2018-06-06 14:45:16', 0, '', '2018-09-19 22:16:48', '', '', '5129710648430593', 1, 1.12, '', '/minshang/user/admin/edit*', '编辑用户', '', 3, 'edit', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('16678447719911424', '', '2018-06-06 14:46:32', 0, '', '2018-08-10 21:41:16', '', '', '5129710648430593', 1, 1.15, '', '/minshang/user/delByIds/**', '删除用户', '', 3, 'delete', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('16687383932047360', '', '2018-06-06 15:22:03', 0, '', '2018-09-19 22:07:34', '', '', '5129710648430594', 1, 1.21, '', '/minshang/role/save*', '添加角色', '', 3, 'add', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('16689632049631232', '', '2018-06-06 15:30:59', 0, '', '2018-09-19 22:07:37', '', '', '5129710648430594', 1, 1.22, '', '/minshang/role/edit*', '编辑角色', '', 3, 'edit', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('16689745006432256', '', '2018-06-06 15:31:26', 0, '', '2018-08-10 21:41:23', '', '', '5129710648430594', 1, 1.23, '', '/minshang/role/delAllByIds/**', '删除角色', '', 3, 'delete', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('16689883993083904', NULL, '2018-06-06 15:31:59', 0, NULL, '2018-06-06 15:31:59', NULL, NULL, '5129710648430594', 1, 1.24, NULL, '/minshang/role/editRolePerm/**', '分配权限', NULL, 3, 'editPerm', 0, NULL, NULL);
INSERT INTO `t_permission` VALUES ('16690313745666048', '', '2018-06-06 15:33:41', 0, '', '2018-09-19 22:07:46', '', '', '5129710648430594', 1, 1.25, '', '/minshang/role/setDefault*', '设为默认角色', '', 3, 'setDefault', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('16694861252005888', '', '2018-06-06 15:51:46', 0, '', '2018-09-19 22:07:52', '', '', '5129710648430595', 1, 1.31, '', '/minshang/permission/add*', '添加菜单', '', 3, 'add', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('16695107491205120', '', '2018-06-06 15:52:44', 0, '', '2018-09-19 22:07:57', '', '', '5129710648430595', 1, 1.32, '', '/minshang/permission/edit*', '编辑菜单', '', 3, 'edit', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('16695243126607872', '', '2018-06-06 15:53:17', 0, '', '2018-08-10 21:41:33', '', '', '5129710648430595', 1, 1.33, '', '/minshang/permission/delByIds/**', '删除菜单', '', 3, 'delete', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('41371711400054784', '', '2018-08-13 18:08:45', 0, '', '2018-08-14 12:31:15', '', 'actuator', '39915540965232640', 0, 2.30, 'sys/actuator/actuator', 'actuator', 'Actuator监控[付费]', 'logo-angular', 2, '', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('41370251991977984', NULL, '2018-08-13 18:02:57', 0, NULL, '2018-08-13 18:02:57', NULL, 'quartz-job', '39915540965232640', 0, 2.10, 'sys/quartz-manage/quartzManage', 'quartz-job', '定时任务', 'md-time', 2, '', 0, NULL, NULL);
INSERT INTO `t_permission` VALUES ('25014528525733888', '', '2018-06-29 14:51:09', 0, '', '2018-10-08 11:13:27', '', '', '5129710648430593', 1, 1.16, '', '无', '上传图片', '', 3, 'upload', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('39915540965232640', NULL, '2018-08-09 17:42:28', 0, NULL, '2018-08-09 17:42:28', NULL, 'monitor', NULL, 0, 2.00, 'Main', '/monitor', '系统监控', 'ios-analytics', 1, NULL, 0, NULL, NULL);
INSERT INTO `t_permission` VALUES ('39916171171991552', '', '2018-08-09 17:44:57', 0, '', '2018-08-25 12:13:11', '', 'druid', '39915540965232640', 0, 2.40, 'sys/monitor/monitor', 'druid', 'SQL监控', 'md-analytics', 2, '', 0, 'http://minshang.exrick.cn/druid/login.html', NULL);
INSERT INTO `t_permission` VALUES ('39918482854252544', '', '2018-08-09 17:54:08', 0, '', '2018-08-25 12:13:27', '', 'swagger', '39915540965232640', 0, 2.50, 'sys/monitor/monitor', 'swagger', '接口文档', 'md-document', 2, '', 0, 'http://minshang.exrick.cn/swagger-ui.html', NULL);
INSERT INTO `t_permission` VALUES ('40238597734928384', NULL, '2018-08-10 15:06:10', 0, NULL, '2018-08-10 15:06:10', NULL, 'department-manage', '5129710648430592', 0, 1.20, 'sys/department-manage/departmentManage', 'department-manage', '部门管理', 'md-git-branch', 2, '', 0, NULL, NULL);
INSERT INTO `t_permission` VALUES ('42082442672082944', '', '2018-08-15 17:12:57', 0, 'admin', '2018-10-20 22:47:22', '', 'new-window', '41373430515240960', 0, 3.30, 'minshang-vue-template/new-window/newWindow', 'new-window', '新窗口操作[付费]', 'ios-browsers', 2, '', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('41373430515240960', '', '2018-08-13 18:15:35', 0, '', '2018-10-16 00:05:28', '', 'minshang-vue-template', '', 0, 3.00, 'Main', '/minshang-vue-template', '后台Vue模版', 'ios-albums', 1, '', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('41363147411427328', '', '2018-08-13 17:34:43', 0, '', '2018-08-20 20:05:21', '', 'log-manage', '39915540965232640', 0, 2.20, 'sys/log-manage/logManage', 'log-manage', '操作日志管理', 'md-list-box', 2, '', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('41363537456533504', '', '2018-08-13 17:36:16', 0, '', '2018-08-13 17:56:11', '', '', '41363147411427328', 1, 2.11, '', '/minshang/log/delByIds/**', '删除日志', '', 3, 'delete', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('41364927394353152', '', '2018-08-13 17:41:48', 0, '', '2018-09-19 22:08:57', '', '', '41363147411427328', 1, 2.12, '', '/minshang/log/delAll*', '清空日志', '', 3, 'undefined', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('41376192166629376', '', '2018-08-13 18:26:33', 0, 'admin', '2018-10-20 22:47:26', '', 'search-table', '41373430515240960', 0, 3.40, 'minshang-vue-template/search-table/searchTable', 'search-table', '搜索表格[付费]', 'md-grid', 2, '', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('41377034236071936', '', '2018-08-13 18:29:54', 0, 'admin', '2018-10-20 22:47:33', '', 'complex-table', '41373430515240960', 0, 3.50, 'minshang-vue-template/complex-table/complexTable', 'complex-table', '复杂表格[付费]', 'ios-grid', 2, '', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('41378916912336896', '', '2018-08-13 18:37:23', 0, 'admin', '2018-10-20 22:47:39', '', 'tree', '41373430515240960', 0, 3.70, 'minshang-vue-template/tree/tree', 'tree', '树形结构[付费]', 'ios-git-network', 2, '', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('41469219249852416', NULL, '2018-08-14 00:36:13', 0, NULL, '2018-08-14 00:36:13', NULL, '', '41371711400054784', 1, 2.31, '', '无', '查看数据', '', 3, 'view', 0, NULL, NULL);
INSERT INTO `t_permission` VALUES ('42087054753927168', '', '2018-08-15 17:31:16', 0, 'admin', '2018-10-22 21:33:53', '', 'html-edit', '41373430515240960', 0, 3.92, 'minshang-vue-template/html-edit/htmlEdit', 'html-edit', '富文本编辑[付费]', 'ios-create', 2, '', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('43117268627886080', '', '2018-08-18 13:44:58', 0, '', '2018-08-18 20:55:04', '', 'message-manage', '5129710648430592', 0, 1.30, 'sys/message-manage/messageManage', 'message-manage', '消息管理[付费]', 'md-mail', 2, '', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('44986029924421632', '', '2018-08-23 17:30:46', 0, '', '2018-09-23 23:26:53', '', 'social-manage', '5129710648430592', 0, 1.50, 'sys/social-manage/socialManage', 'social-manage', '社交账号绑定[付费]', 'md-share', 2, '', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('45069342940860416', '', '2018-08-23 23:01:49', 0, '', '2018-08-24 10:01:09', '', '', '44986029924421632', 1, 1.42, '', '无', '查看社交账号数据', '', 3, 'view', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('45235228800716800', '', '2018-08-24 10:01:00', 0, '', '2018-09-19 22:07:23', '', '', '44986029924421632', 1, 1.41, '', '/minshang/relate/delByIds*', '删除解绑', '', 3, 'delete', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('45235621697949696', '', '2018-08-24 10:02:33', 0, '', '2018-09-19 22:06:57', '', '', '40238597734928384', 1, 1.21, '', '/minshang/department/add*', '添加部门', '', 3, 'add', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('45235787867885568', '', '2018-08-24 10:03:13', 0, '', '2018-09-19 22:07:02', '', '', '40238597734928384', 1, 1.22, '', '/minshang/department/edit*', '编辑部门', '', 3, 'edit', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('45235939278065664', NULL, '2018-08-24 10:03:49', 0, NULL, '2018-08-24 10:03:49', NULL, '', '40238597734928384', 1, 1.23, '', '/minshang/department/delByIds/*', '删除部门', '', 3, 'delete', 0, NULL, NULL);
INSERT INTO `t_permission` VALUES ('45236734832676864', '', '2018-08-24 10:06:59', 0, '', '2018-09-19 22:07:07', '', '', '43117268627886080', 1, 1.31, '', '/minshang/message/add*', '添加消息', '', 3, 'add', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('45237010692050944', '', '2018-08-24 10:08:04', 0, '', '2018-09-19 22:07:12', '', '', '43117268627886080', 1, 1.32, '', '/minshang/message/edit*', '编辑消息', '', 3, 'edit', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('45237170029465600', NULL, '2018-08-24 10:08:42', 0, NULL, '2018-08-24 10:08:42', NULL, '', '43117268627886080', 1, 1.33, '', '/minshang/message/delByIds/*', '删除消息', '', 3, 'delete', 0, NULL, NULL);
INSERT INTO `t_permission` VALUES ('45264987354042368', '', '2018-08-24 11:59:14', 0, '', '2018-09-19 22:08:11', '', '', '41370251991977984', 1, 2.11, '', '/minshang/quartzJob/add*', '添加定时任务', '', 3, 'add', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('45265487029866496', '', '2018-08-24 12:01:14', 0, '', '2018-09-19 22:08:17', '', '', '41370251991977984', 1, 2.12, '', '/minshang/quartzJob/edit*', '编辑定时任务', '', 3, 'edit', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('45265762415284224', '', '2018-08-24 12:02:19', 0, '', '2018-09-19 22:08:24', '', '', '41370251991977984', 1, 2.13, '', '/minshang/quartzJob/pause*', '暂停定时任务', '', 3, 'disable', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('45265886315024384', '', '2018-08-24 12:02:49', 0, '', '2018-09-19 22:09:13', '', '', '41370251991977984', 1, 2.14, '', '/minshang/quartzJob/resume*', '恢复定时任务', '', 3, 'enable', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('45266070000373760', NULL, '2018-08-24 12:03:33', 0, NULL, '2018-08-24 12:03:33', NULL, '', '41370251991977984', 1, 2.15, '', '/minshang/quartzJob/delByIds/*', '删除定时任务', '', 3, 'delete', 0, NULL, NULL);
INSERT INTO `t_permission` VALUES ('56309618086776832', NULL, '2018-09-23 23:26:40', 0, NULL, '2018-09-23 23:26:40', NULL, 'oss-manage', '5129710648430592', 0, 1.40, 'sys/oss-manage/ossManage', 'oss-manage', 'OSS对象存储[付费]', 'ios-folder', 2, '', 0, NULL, NULL);
INSERT INTO `t_permission` VALUES ('56898976661639168', '', '2018-09-25 14:28:34', 0, '', '2018-09-25 15:12:46', '', '', '5129710648430593', 1, 1.17, '', '/minshang/user/importData*', '导入用户', '', 3, 'input', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('56911328312299520', '', '2018-09-25 15:17:39', 0, 'admin', '2018-10-20 22:47:36', '', 'excel', '41373430515240960', 0, 3.60, 'minshang-vue-template/excel/excel', 'excel', 'Excel导入导出[付费]', 'md-exit', 2, '', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('57009544286441472', NULL, '2018-09-25 21:47:55', 0, NULL, '2018-09-25 21:47:55', NULL, '', '43117268627886080', 1, 1.40, '', '/minshang/messageSend/save*', '添加已发送消息', '', 3, 'add', 0, NULL, NULL);
INSERT INTO `t_permission` VALUES ('57009744761589760', NULL, '2018-09-25 21:48:43', 0, NULL, '2018-09-25 21:48:43', NULL, '', '43117268627886080', 1, 1.50, '', '/minshang/messageSend/update*', '编辑已发送消息', '', 3, 'edit', 0, NULL, NULL);
INSERT INTO `t_permission` VALUES ('57009981228060672', NULL, '2018-09-25 21:49:39', 0, NULL, '2018-09-25 21:49:39', NULL, '', '43117268627886080', 1, 1.60, '', '/minshang/messageSend/delByIds/*', '删除已发送消息', '', 3, 'delete', 0, NULL, NULL);
INSERT INTO `t_permission` VALUES ('57212882168844288', '', '2018-09-26 11:15:55', 0, '', '2018-10-08 11:10:05', '', '', '56309618086776832', 1, 1.41, '', '无', '上传文件', '', 3, 'upload', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('58480609315524608', '', '2018-09-29 23:13:24', 0, '', '2018-09-29 23:17:59', '', 'setting', '5129710648430592', 0, 1.80, 'sys/setting-manage/settingManage', 'setting', '系统配置[付费]', 'ios-settings-outline', 2, '', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('61394706252173312', NULL, '2018-10-08 00:12:59', 0, NULL, '2018-10-08 00:12:59', NULL, '', '58480609315524608', 1, 1.81, '', '/minshang/setting/seeSecret/**', '查看私密配置', '', 3, 'view', 0, NULL, NULL);
INSERT INTO `t_permission` VALUES ('61417744146370560', '', '2018-10-08 01:44:32', 0, '', '2018-10-08 01:50:03', '', '', '58480609315524608', 1, 1.82, '', '/minshang/setting/*/set*', '编辑配置', '', 3, 'edit', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('61560480518377472', NULL, '2018-10-08 11:11:43', 0, NULL, '2018-10-08 11:11:43', NULL, '', '56309618086776832', 1, 1.44, '', '/minshang/file/delete/*', '删除文件', '', 3, 'delete', 0, NULL, NULL);
INSERT INTO `t_permission` VALUES ('61560275261722624', NULL, '2018-10-08 11:10:54', 0, NULL, '2018-10-08 11:10:54', NULL, '', '56309618086776832', 1, 1.43, '', '/minshang/file/copy*', '复制文件', '', 3, 'edit', 0, NULL, NULL);
INSERT INTO `t_permission` VALUES ('61560041605435392', NULL, '2018-10-08 11:09:58', 0, NULL, '2018-10-08 11:09:58', NULL, '', '56309618086776832', 1, 1.42, '', '/minshang/file/rename*', '重命名文件', '', 3, 'edit', 0, NULL, NULL);
INSERT INTO `t_permission` VALUES ('63482475359244288', '', '2018-10-13 18:29:02', 0, 'admin', '2018-10-20 22:47:45', '', 'custom-tree', '41373430515240960', 0, 3.80, 'minshang-vue-template/custom-tree/customTree', 'custom-tree', '自定义树[付费]', 'md-git-network', 2, '', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('63741744973352960', '', '2018-10-14 11:39:17', 0, 'admin', '2018-10-20 22:47:18', '', 'render', '41373430515240960', 0, 3.20, 'minshang-vue-template/render/render', 'render', 'Render函数示例[付费]', 'md-aperture', 2, '', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('64290663792906240', '', '2018-10-16 00:00:29', 0, 'admin', '2018-10-20 22:47:49', '', 'tree&table', '41373430515240960', 0, 3.90, 'minshang-vue-template/tree&table/tree&table', 'tree&table', '树+表格[付费]', 'md-list', 2, '', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('66790433014943744', 'admin', '2018-10-22 21:33:42', 0, 'admin', '2018-10-22 21:37:12', '', 'card-list', '41373430515240960', 0, 3.91, 'minshang-vue-template/card-list/cardList', 'card-list', '卡片列表[付费]', 'md-card', 2, '', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('67027909637836800', 'admin', '2018-10-23 13:17:19', 0, 'admin', '2018-10-23 14:57:46', '', 'banner', '67027338952445952', 0, 4.10, 'product-template/banner/Banner', 'banner', '轮播组件[付费]', 'md-book', 2, '', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('67027338952445952', 'admin', '2018-10-23 13:15:03', 0, 'admin', '2018-10-23 14:57:38', '', 'product-template', '', 0, 4.00, 'Main', '/product-template', '前台产品级组件', 'md-ribbon', 1, '', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('67042515441684480', 'admin', '2018-10-23 14:15:22', 0, 'admin', '2018-10-23 14:57:51', '', 'product', '67027338952445952', 0, 4.20, 'product-template/product/Product', 'product', '产品组件[付费]', 'md-pricetags', 2, '', 0, '', NULL);
INSERT INTO `t_permission` VALUES ('67082402312228864', 'admin', '2018-10-23 16:53:53', 0, 'admin', '2018-10-23 16:53:53', NULL, 'category', '67027338952445952', 0, 4.30, 'product-template/category/Category', 'category', '分类栏组件[付费]', 'md-apps', 2, '', 0, NULL, NULL);

-- ----------------------------
-- Table structure for t_qq
-- ----------------------------
DROP TABLE IF EXISTS `t_qq`;
CREATE TABLE `t_qq`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_related` bit(1) NULL DEFAULT NULL,
  `open_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `relate_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staus` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_quartz_job
-- ----------------------------
DROP TABLE IF EXISTS `t_quartz_job`;
CREATE TABLE `t_quartz_job`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parameter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `staus` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_quartz_job
-- ----------------------------
INSERT INTO `t_quartz_job` VALUES ('41065738420621312', '', '2018-08-12 21:52:56', 0, '', '2018-09-23 23:19:39', '0/1 * * * * ? ', '带参测试 后台将每隔1秒执行输出日志', 'cn.exrick.xboot.quartz.jobs.SampleParamJob', 'World', -1, NULL);
INSERT INTO `t_quartz_job` VALUES ('41060689401352192', '', '2018-08-12 20:32:52', 0, '', '2018-08-12 21:33:56', '0/1 * * * * ? ', '无参测试 后台将每隔1秒执行输出日志', 'cn.exrick.xboot.quartz.jobs.SampleJob', '', -1, NULL);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `default_role` bit(1) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `data_type` int(11) NULL DEFAULT NULL,
  `staus` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('496138616573952', '', '2018-04-22 23:03:49', 'admin', '2018-11-02 20:40:18', 'ROLE_ADMIN', 0, NULL, '超级管理员 拥有所有权限', 0, NULL, NULL);
INSERT INTO `t_role` VALUES ('496138616573953', '', '2018-05-02 21:40:03', 'admin', '2018-11-01 22:59:48', 'ROLE_USER', 0, b'1', '普通注册用户 路过看看', 0, NULL, NULL);
INSERT INTO `t_role` VALUES ('16457350655250432', '', '2018-06-06 00:08:00', 'admin', '2018-11-02 20:42:24', 'ROLE_TEST', 0, NULL, '测试权限按钮显示', 1, NULL, NULL);

-- ----------------------------
-- Table structure for t_role_department
-- ----------------------------
DROP TABLE IF EXISTS `t_role_department`;
CREATE TABLE `t_role_department`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `department_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staus` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role_department
-- ----------------------------
INSERT INTO `t_role_department` VALUES ('70763874256687105', 'admin', '2018-11-02 20:42:43', 0, 'admin', '2018-11-02 20:42:43', '40322777781112832', '16457350655250432', NULL, NULL);
INSERT INTO `t_role_department` VALUES ('70763874265075712', 'admin', '2018-11-02 20:42:43', 0, 'admin', '2018-11-02 20:42:43', '40322811096469504', '16457350655250432', NULL, NULL);
INSERT INTO `t_role_department` VALUES ('70763874277658624', 'admin', '2018-11-02 20:42:43', 0, 'admin', '2018-11-02 20:42:43', '40322852833988608', '16457350655250432', NULL, NULL);

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `permission_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staus` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES ('70810453487390721', 'admin', '2018-11-02 23:47:49', 0, 'admin', '2018-11-02 23:47:49', '16439068543946752', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810453483196416', 'admin', '2018-11-02 23:47:49', 0, 'admin', '2018-11-02 23:47:49', '16438962738434048', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810453479002112', 'admin', '2018-11-02 23:47:49', 0, 'admin', '2018-11-02 23:47:49', '16438800255291392', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810453470613504', 'admin', '2018-11-02 23:47:49', 0, 'admin', '2018-11-02 23:47:49', '16392767785668608', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810453466419200', 'admin', '2018-11-02 23:47:49', 0, 'admin', '2018-11-02 23:47:49', '16392452747300864', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810453458030592', 'admin', '2018-11-02 23:47:49', 0, 'admin', '2018-11-02 23:47:49', '67082402312228864', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810453453836288', 'admin', '2018-11-02 23:47:49', 0, 'admin', '2018-11-02 23:47:49', '67042515441684480', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810453445447681', 'admin', '2018-11-02 23:47:49', 0, 'admin', '2018-11-02 23:47:49', '67027909637836800', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810453441253376', 'admin', '2018-11-02 23:47:49', 0, 'admin', '2018-11-02 23:47:49', '67027338952445952', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810453432864768', 'admin', '2018-11-02 23:47:49', 0, 'admin', '2018-11-02 23:47:49', '42087054753927168', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810453424476160', 'admin', '2018-11-02 23:47:49', 0, 'admin', '2018-11-02 23:47:49', '66790433014943744', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810453416087552', 'admin', '2018-11-02 23:47:49', 0, 'admin', '2018-11-02 23:47:49', '64290663792906240', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810453407698945', 'admin', '2018-11-02 23:47:49', 0, 'admin', '2018-11-02 23:47:49', '63482475359244288', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810453403504640', 'admin', '2018-11-02 23:47:49', 0, 'admin', '2018-11-02 23:47:49', '41378916912336896', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810453399310336', 'admin', '2018-11-02 23:47:49', 0, 'admin', '2018-11-02 23:47:49', '56911328312299520', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810453390921728', 'admin', '2018-11-02 23:47:49', 0, 'admin', '2018-11-02 23:47:49', '41377034236071936', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810453382533121', 'admin', '2018-11-02 23:47:49', 0, 'admin', '2018-11-02 23:47:49', '41376192166629376', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810453374144512', 'admin', '2018-11-02 23:47:49', 0, 'admin', '2018-11-02 23:47:49', '42082442672082944', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694487658496', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '16439068543946752', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694458298368', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '16392452747300864', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694466686976', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '16392767785668608', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694475075584', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '16438800255291392', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694479269889', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '16438962738434048', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694441521152', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '67027909637836800', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810453369950208', 'admin', '2018-11-02 23:47:49', 0, 'admin', '2018-11-02 23:47:49', '63741744973352960', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810453365755904', 'admin', '2018-11-02 23:47:49', 0, 'admin', '2018-11-02 23:47:49', '41375330996326400', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810453193789440', 'admin', '2018-11-02 23:47:49', 0, 'admin', '2018-11-02 23:47:49', '41373430515240960', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810453185400832', 'admin', '2018-11-02 23:47:49', 0, 'admin', '2018-11-02 23:47:49', '39918482854252544', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810453177012225', 'admin', '2018-11-02 23:47:49', 0, 'admin', '2018-11-02 23:47:49', '39916171171991552', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810453172817920', 'admin', '2018-11-02 23:47:49', 0, 'admin', '2018-11-02 23:47:49', '41469219249852416', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810453164429312', 'admin', '2018-11-02 23:47:49', 0, 'admin', '2018-11-02 23:47:49', '41371711400054784', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810452493340672', 'admin', '2018-11-02 23:47:49', 0, 'admin', '2018-11-02 23:47:49', '41364927394353152', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810452489146368', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '41363537456533504', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810452480757760', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '41363147411427328', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810452476563456', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '45266070000373760', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810452468174848', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '45265886315024384', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810452463980544', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '45265762415284224', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810452455591936', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '45265487029866496', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810452443009024', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '45264987354042368', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810452434620416', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '41370251991977984', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810452426231809', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '39915540965232640', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694445715457', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '67042515441684480', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694449909761', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '67082402312228864', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694403772416', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '67027338952445952', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694399578112', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '42087054753927168', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694386995200', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '66790433014943744', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694382800896', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '64290663792906240', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694378606592', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '63482475359244288', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694370217984', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '41378916912336896', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694361829376', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '56911328312299520', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694357635072', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '41377034236071936', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694353440768', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '41376192166629376', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694345052160', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '42082442672082944', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694340857856', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '63741744973352960', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694332469248', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '41375330996326400', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694315692033', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '41373430515240960', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694311497728', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '39918482854252544', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694307303424', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '39916171171991552', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694298914816', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '41371711400054784', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694294720512', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '41363147411427328', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694290526208', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '41370251991977984', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694282137600', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '39915540965232640', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694277943296', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '58480609315524608', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694269554688', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '5129710648430595', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694261166080', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '5129710648430594', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694248583168', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '44986029924421632', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694240194560', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '56309618086776832', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694236000256', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '43117268627886080', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810452422037504', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '61417744146370560', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810452413648897', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '61394706252173312', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810452409454592', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '58480609315524608', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810452401065984', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '16695243126607872', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810451167940608', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '16695107491205120', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810451159552000', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '16694861252005888', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810451155357696', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '5129710648430595', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810451146969088', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '16690313745666048', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810451138580480', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '16689883993083904', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810451134386176', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '16689745006432256', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810451125997568', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '16689632049631232', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810451117608960', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '16687383932047360', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810451109220352', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '5129710648430594', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810451100831745', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '45069342940860416', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810451096637440', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '45235228800716800', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810451088248833', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '44986029924421632', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810451084054528', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '61560480518377472', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810451075665921', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '61560275261722624', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810451071471616', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '61560041605435392', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810451067277312', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '57212882168844288', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810451058888704', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '56309618086776832', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810451046305792', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '57009981228060672', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810451037917184', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '57009744761589760', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810451033722880', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '57009544286441472', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810451025334273', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '45237170029465600', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810451021139968', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '45237010692050944', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810451016945664', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '45236734832676864', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810451008557056', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '43117268627886080', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810451000168448', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '45235939278065664', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810450995974144', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '45235787867885568', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810450987585536', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '45235621697949696', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810450983391232', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '40238597734928384', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810450975002624', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '56898976661639168', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810450966614016', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '25014528525733888', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810450962419712', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '16678447719911424', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810450954031104', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '15708892205944832', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810450949836800', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '15701915807518720', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810450941448192', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '16678126574637056', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810450937253888', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '15701400130424832', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694227611648', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '40238597734928384', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094694223417344', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '5129710648430593', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('67094693963370496', 'admin', '2018-10-23 17:42:42', 0, 'admin', '2018-10-23 17:42:42', '5129710648430592', '496138616573953', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810450924670976', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '5129710648430593', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70810445975392256', 'admin', '2018-11-02 23:47:48', 0, 'admin', '2018-11-02 23:47:48', '5129710648430592', '496138616573952', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70764045665308672', 'admin', '2018-11-02 20:43:24', 0, 'admin', '2018-11-02 20:43:24', '5129710648430592', '16457350655250432', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70764045707251712', 'admin', '2018-11-02 20:43:24', 0, 'admin', '2018-11-02 20:43:24', '5129710648430593', '16457350655250432', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70764045719834624', 'admin', '2018-11-02 20:43:24', 0, 'admin', '2018-11-02 20:43:24', '40238597734928384', '16457350655250432', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70764045732417536', 'admin', '2018-11-02 20:43:24', 0, 'admin', '2018-11-02 20:43:24', '16392452747300864', '16457350655250432', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70764045740806144', 'admin', '2018-11-02 20:43:24', 0, 'admin', '2018-11-02 20:43:24', '16392767785668608', '16457350655250432', NULL, NULL);
INSERT INTO `t_role_permission` VALUES ('70764045753389056', 'admin', '2018-11-02 20:43:24', 0, 'admin', '2018-11-02 20:43:24', '16439068543946752', '16457350655250432', NULL, NULL);

-- ----------------------------
-- Table structure for t_section
-- ----------------------------
DROP TABLE IF EXISTS `t_section`;
CREATE TABLE `t_section`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `org_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sectionname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_section
-- ----------------------------
INSERT INTO `t_section` VALUES ('93425315149254656', 'admin', '2019-01-04 09:31:12', 0, 0, 'admin', '2019-01-04 11:06:52', '92836045095178240', '营运中心');
INSERT INTO `t_section` VALUES ('93445807256113152', 'admin', '2019-01-04 10:52:38', 0, 0, 'admin', '2019-01-04 10:52:38', '89870134574845952', '中央厨房');
INSERT INTO `t_section` VALUES ('93445901846056960', 'admin', '2019-01-04 10:53:00', 0, 0, 'admin', '2019-01-04 10:53:00', '92830587361955840', '公司办公室');

-- ----------------------------
-- Table structure for t_shop
-- ----------------------------
DROP TABLE IF EXISTS `t_shop`;
CREATE TABLE `t_shop`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `shop_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_shop_buyer_order
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_buyer_order`;
CREATE TABLE `t_shop_buyer_order`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `audit_date` datetime(0) NULL DEFAULT NULL,
  `delivery_time` datetime(0) NULL DEFAULT NULL,
  `document_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `org_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `org_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(19, 2) NULL DEFAULT NULL,
  `purchase_date` datetime(0) NULL DEFAULT NULL,
  `shop_goods_order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplier_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplier_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_shop_buyer_order
-- ----------------------------
INSERT INTO `t_shop_buyer_order` VALUES ('94973118442901504', 'test', '2019-01-08 16:01:37', 0, 0, 'test', '2019-01-08 16:16:02', NULL, NULL, '0123456789', '1', '89870101624393728', '安业公司长江店', 1.00, NULL, '94886678157594624', '94583877296721920', '中央厨房');
INSERT INTO `t_shop_buyer_order` VALUES ('94975019037233152', 'test', '2019-01-08 16:09:10', 0, 0, 'test', '2019-01-08 16:09:10', NULL, NULL, NULL, '1', '89870101624393728', '安业公司长江店', 1000.00, NULL, '94886678157594624', '94583877296721920', '中央厨房');
INSERT INTO `t_shop_buyer_order` VALUES ('94975933328396288', 'test', '2019-01-08 16:12:48', 0, 0, 'test', '2019-01-08 16:12:48', NULL, NULL, '0123456789', '1', '89870101624393728', '安业公司长江店', 1000.00, NULL, '94886678157594624', '94583877296721920', '中央厨房');
INSERT INTO `t_shop_buyer_order` VALUES ('95010727378554880', 'test', '2019-01-08 18:31:04', 0, 0, 'test', '2019-01-08 18:31:04', NULL, NULL, '0123456789', '1', '89870101624393728', '安业公司长江店', 1000.00, NULL, '94886655336386560', '94583877296721920', '中央厨房');

-- ----------------------------
-- Table structure for t_shop_buyer_stat
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_buyer_stat`;
CREATE TABLE `t_shop_buyer_stat`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `current_inventory` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `indent_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shop_goods_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shop_unit_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shop_unit_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total_delivered` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_shop_buyer_stat
-- ----------------------------
INSERT INTO `t_shop_buyer_stat` VALUES ('94516953619632128', 'test', '2019-01-07 09:48:59', 0, 0, 'test', '2019-01-07 09:48:59', '100', '1', 'W23', '1', '93196697110319104', '90624182060060672', '条', '1');
INSERT INTO `t_shop_buyer_stat` VALUES ('94517000981712896', 'test', '2019-01-07 09:49:10', 0, 0, 'test', '2019-01-07 10:09:22', '100', '2', '00001', '10', '93197446196236288', '90624182060060672', '只', '10');

-- ----------------------------
-- Table structure for t_shop_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_goods`;
CREATE TABLE `t_shop_goods`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `check_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_price` decimal(19, 2) NULL DEFAULT NULL,
  `headquarters_highest_inventory` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `headquarters_minimum_inventory` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shop_unit_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shop_unit_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shop_goods_type_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKk1m0vgux2634ixqe3owew1vlc`(`shop_unit_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_shop_goods
-- ----------------------------
INSERT INTO `t_shop_goods` VALUES ('92835776789745664', 'admin', '2019-01-02 18:28:35', 0, 0, 'admin', '2019-01-02 18:28:35', '月盘点', '001', '鱼', 10.00, '100', '10', '天', '条', '1', NULL, NULL);
INSERT INTO `t_shop_goods` VALUES ('93436803003977728', 'test', '2019-01-04 10:16:51', 0, 0, 'test', '2019-01-04 10:16:51', '日盘点', '00001', '手抓饼', 100.00, '99', '1', '日采集', '批', '90613964198645760', '半成品', '92714943576543232');
INSERT INTO `t_shop_goods` VALUES ('92836108391419904', 'admin', '2019-01-02 18:29:55', 0, 0, 'test', '2019-01-04 11:50:25', NULL, '03', '红烧肉', NULL, NULL, NULL, NULL, '条', '90624182060060672', NULL, '92714943576543232');
INSERT INTO `t_shop_goods` VALUES ('93062423237365760', 'admin', '2019-01-03 09:29:12', 0, 0, 'admin', '2019-01-03 09:29:12', '月盘点', '007', '扇贝', 120.00, '10', '1', '个', '个', '1', NULL, NULL);
INSERT INTO `t_shop_goods` VALUES ('93436974773309440', 'test', '2019-01-04 10:17:32', 0, 0, 'test', '2019-01-04 10:17:32', '日盘点', '00001', '酸菜鱼', 100.00, '99', '1', '日采集', '批', '90613964198645760', '半成品', '92714943576543232');
INSERT INTO `t_shop_goods` VALUES ('93196697110319104', 'test', '2019-01-03 18:22:45', 0, 0, 'test', '2019-01-03 18:22:45', '日盘点', 'W23', '虾', 100.00, '10', '1', '天', '批', '90613964198645760', '半成品', '92714943576543232');
INSERT INTO `t_shop_goods` VALUES ('93197446196236288', 'test', '2019-01-03 18:25:44', 0, 0, 'test', '2019-01-03 18:25:44', '日盘点', 'W23', '汉堡', 100.00, '10', '1', '天', '批', '90613964198645760', '半成品', '92714943576543232');
INSERT INTO `t_shop_goods` VALUES ('93437077206601728', 'test', '2019-01-04 10:17:56', 0, 0, 'test', '2019-01-04 10:17:56', '日盘点', '00001', '土豆牛肉', 100.00, '99', '1', '日采集', '批', '90613964198645760', '半成品', '92714943576543232');
INSERT INTO `t_shop_goods` VALUES ('93461722504892416', 'test', '2019-01-04 11:55:52', 0, 0, 'test', '2019-01-04 11:57:42', NULL, '03', '红烧肉', NULL, NULL, NULL, NULL, '条', '90624182060060672', NULL, '92714823351013376');

-- ----------------------------
-- Table structure for t_shop_goods_order
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_goods_order`;
CREATE TABLE `t_shop_goods_order`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `document_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `indent_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `org_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `org_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shop_unit_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shop_unit_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total_delivered` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_shop_goods_order
-- ----------------------------
INSERT INTO `t_shop_goods_order` VALUES ('94886443624697856', 'test', '2019-01-08 10:17:12', 0, 0, 'test', '2019-01-08 10:20:29', '987654321', '1', '89870158994083840', '安业公司瑶海店', '90624182060060672', '块', '1');
INSERT INTO `t_shop_goods_order` VALUES ('94886655336386560', 'test', '2019-01-08 10:18:03', 0, 0, 'test', '2019-01-08 10:18:03', '0123456789', '100', '89870158994083840', '安业公司芜湖店', '90624182060060672', '条', '10');
INSERT INTO `t_shop_goods_order` VALUES ('94886678157594624', 'test', '2019-01-08 10:18:08', 0, 0, 'test', '2019-01-08 10:18:08', '0123456789', '1000', '89870158994083840', '安业公司芜湖店', '90624182060060672', '条', '100');
INSERT INTO `t_shop_goods_order` VALUES ('94886687481532416', 'test', '2019-01-08 10:18:10', 0, 0, 'test', '2019-01-08 10:18:10', '0123456789', '1000', '89870158994083840', '安业公司芜湖店', '90624182060060672', '条', '1000');

-- ----------------------------
-- Table structure for t_shop_goods_type
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_goods_type`;
CREATE TABLE `t_shop_goods_type`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `goods_type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_shop_goods_type
-- ----------------------------
INSERT INTO `t_shop_goods_type` VALUES ('92714823351013376', 'admin', '2019-01-02 10:27:57', 0, 0, 'admin', '2019-01-02 10:27:57', '001', '熟食');
INSERT INTO `t_shop_goods_type` VALUES ('92714901272793088', 'admin', '2019-01-02 10:28:16', 0, 0, 'admin', '2019-01-02 10:28:16', '002', '冷冻');
INSERT INTO `t_shop_goods_type` VALUES ('92714943576543232', 'admin', '2019-01-02 10:28:26', 0, 0, 'admin', '2019-01-02 10:28:26', '003', '半成品');
INSERT INTO `t_shop_goods_type` VALUES ('92715003567673344', 'admin', '2019-01-02 10:28:40', 0, 0, 'admin', '2019-01-02 10:28:40', '004', '成品');
INSERT INTO `t_shop_goods_type` VALUES ('93182780355121152', 'admin', '2019-01-03 17:27:27', 0, 0, 'admin', '2019-01-03 17:27:27', '110', '酒');

-- ----------------------------
-- Table structure for t_shop_order_management
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_order_management`;
CREATE TABLE `t_shop_order_management`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `delivery_amount` decimal(19, 2) NULL DEFAULT NULL,
  `goods_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_price` decimal(19, 2) NULL DEFAULT NULL,
  `headquarters_remark` decimal(19, 2) NULL DEFAULT NULL,
  `indent_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quantity_shipped` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shop_goods_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shop_remark` decimal(19, 2) NULL DEFAULT NULL,
  `shop_unit_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shop_unit_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_shop_order_management
-- ----------------------------
INSERT INTO `t_shop_order_management` VALUES ('93515449685250048', 'test', '2019-01-04 15:29:22', 0, 0, 'test', '2019-01-04 15:29:22', 10.00, '00001', '酸菜鱼', 100.00, 11.00, '1', '1', '93436974773309440', 11.00, '90613964198645760', '批');
INSERT INTO `t_shop_order_management` VALUES ('93515892326928384', 'test', '2019-01-04 15:31:07', 0, 0, 'test', '2019-01-04 16:00:56', 100.00, 'W23', '虾', 100.00, 12.00, '1', '1', '93436803003977728', 12.00, '90613964198645760', '块');
INSERT INTO `t_shop_order_management` VALUES ('93515953949642752', 'test', '2019-01-04 15:31:22', 0, 0, 'test', '2019-01-04 15:31:22', 10.00, 'W23', '汉堡', 100.00, 11.00, '1', '1', '93197446196236288', 11.00, '90613964198645760', '批');

-- ----------------------------
-- Table structure for t_shop_storage
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_storage`;
CREATE TABLE `t_shop_storage`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `storage_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `storage_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `storage_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_shop_storage
-- ----------------------------
INSERT INTO `t_shop_storage` VALUES ('90962353041969152', 'admin', '2018-12-28 14:24:16', 0, 0, 'admin', '2018-12-28 14:24:16', '003', '3号仓', '总部仓库');
INSERT INTO `t_shop_storage` VALUES ('90962380707598336', NULL, NULL, 0, 0, 'admin', '2018-12-28 15:52:41', '5号', NULL, NULL);

-- ----------------------------
-- Table structure for t_shop_unit
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_unit`;
CREATE TABLE `t_shop_unit`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `shop_unit_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shop_unit_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_shop_unit
-- ----------------------------
INSERT INTO `t_shop_unit` VALUES ('90624073561804800', 'admin', '2018-12-27 16:00:04', 0, 0, 'admin', '2018-12-27 16:00:04', 'DW001', '个');
INSERT INTO `t_shop_unit` VALUES ('90613964198645760', 'admin', '2018-12-27 15:19:54', 0, 0, 'admin', '2018-12-27 15:19:54', 'DW004', '批');
INSERT INTO `t_shop_unit` VALUES ('90624118327611392', 'admin', '2018-12-27 16:00:15', 0, 0, 'admin', '2018-12-27 16:00:15', 'DW002', '只');
INSERT INTO `t_shop_unit` VALUES ('90624182060060672', 'admin', '2018-12-27 16:00:30', 0, 0, 'admin', '2018-12-27 16:00:30', 'DW005', '条');
INSERT INTO `t_shop_unit` VALUES ('90624217887805440', 'admin', '2018-12-27 16:00:38', 0, 0, 'admin', '2018-12-27 16:00:38', 'DW006', '块');

-- ----------------------------
-- Table structure for t_shop_vendor
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_vendor`;
CREATE TABLE `t_shop_vendor`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `close_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vendor_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vendor_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vendor_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_shop_vendor
-- ----------------------------
INSERT INTO `t_shop_vendor` VALUES ('92729901240553472', 'admin', '2019-01-02 11:27:52', 0, 0, 'admin', '2019-01-02 11:27:52', '中国', '自结', '马云', '110', '123456', '002', '淘宝', '1');
INSERT INTO `t_shop_vendor` VALUES ('92730071210528768', 'admin', '2019-01-02 11:28:33', 0, 0, 'admin', '2019-01-02 11:28:33', '中国', '自结', '马云', '110', '123456', '003', '淘宝', '1');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatar` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `department_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `street` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pass_strength` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staus` int(11) NULL DEFAULT NULL,
  `birth` datetime(0) NULL DEFAULT NULL,
  `hobby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `org_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('682265633886209', '鲁寒', '2018-04-30 23:28:42', 'admin', '2018-09-26 20:07:00', '', 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', '', '1012@qq.com', '18782059033', '', '$2a$10$PS04ecXfknNd3V8d.ymLTObQciapMU4xU8.GADBZZsuTZr7ymnagy', 1, -1, 0, 'Exrick', 0, '40322777781112832', NULL, '弱', 0, '2018-12-29 15:41:10', '吃', '鲁一', '89838476689674240');
INSERT INTO `t_user` VALUES ('16739222421508096', '鲁寒', '2018-06-06 18:48:02', 'admin', '2018-10-08 00:04:32', '', 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', '', '1012139570@qq.com', '18782059033', '', '$2a$10$PS04ecXfknNd3V8d.ymLTObQciapMU4xU8.GADBZZsuTZr7ymnagy', 1, 0, 0, 'test2', 0, '40652338142121984', '', '弱', 0, '2018-12-29 15:41:15', '喝', '鲁二', '89870101624393728');
INSERT INTO `t_user` VALUES ('4363087427670016', '鲁寒', '2018-05-03 15:09:42', 'admin', '2018-10-08 00:04:46', '[\"510000\",\"510100\",\"510114\"]', 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', '', '1012139570@qq.com', '18782059033', '', '$2a$10$PS04ecXfknNd3V8d.ymLTObQciapMU4xU8.GADBZZsuTZr7ymnagy', 1, 0, 0, 'test', 0, '40652338142121984', '', '弱', 0, '2018-12-29 15:41:17', '玩', '鲁三', '89870134574845952');
INSERT INTO `t_user` VALUES ('682265633886208', '鲁寒', '2018-05-01 16:13:51', 'admin', '2018-11-01 17:00:47', '[\"510000\",\"510100\",\"510104\"]', 'http://p77xsahe9.bkt.clouddn.com/788eb3e78206429eb34fc7cd3e1e46f4.jpg', 'test', '2549575805@qq.com', '18782059038', 'Exrick', '$2a$10$bINR/VMje12C88mQOsgu9OvzLSbj6nS.3KlYgayD7WSFsDTQqI9AC', 1, 0, 1, 'admin', 0, '40322777781112832', '天府1街', '弱', 0, '2018-12-29 15:41:20', '乐', '鲁四', '89870322697768960');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `role_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staus` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('70669807116095488', NULL, '2018-11-02 14:28:56', 0, NULL, '2018-11-02 14:28:56', '496138616573952', '682265633886208', NULL, NULL);
INSERT INTO `t_user_role` VALUES ('40720091502874624', NULL, '2018-08-11 22:59:27', 0, NULL, '2018-08-11 22:59:27', '496138616573952', '682265633886209', NULL, NULL);
INSERT INTO `t_user_role` VALUES ('61392579396112384', NULL, '2018-10-08 00:04:32', 0, NULL, '2018-10-08 00:04:32', '16457350655250432', '16739222421508096', NULL, NULL);
INSERT INTO `t_user_role` VALUES ('61392637076180992', NULL, '2018-10-08 00:04:46', 0, NULL, '2018-10-08 00:04:46', '496138616573953', '4363087427670016', NULL, NULL);
INSERT INTO `t_user_role` VALUES ('40720091490291713', NULL, '2018-08-11 22:59:27', 0, NULL, '2018-08-11 22:59:27', '496138616573953', '682265633886209', NULL, NULL);

-- ----------------------------
-- Table structure for t_weibo
-- ----------------------------
DROP TABLE IF EXISTS `t_weibo`;
CREATE TABLE `t_weibo`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_related` bit(1) NULL DEFAULT NULL,
  `open_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `relate_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staus` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
