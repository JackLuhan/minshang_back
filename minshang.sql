/*
 Navicat Premium Data Transfer

 Source Server         : anshaoye
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : 192.168.2.156:3306
 Source Schema         : minshang

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 25/12/2018 19:28:57
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
INSERT INTO `qrtz_cron_triggers` VALUES ('quartzScheduler', 'SampleJob', 'DEFAULT', '0/1 * * * * ? ', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('quartzScheduler', 'SampleParamJob', 'DEFAULT', '0/1 * * * * ? ', 'Asia/Shanghai');

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
INSERT INTO `qrtz_job_details` VALUES ('quartzScheduler', 'SampleJob', 'DEFAULT', NULL, 'SampleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C77080000001000000001740009706172616D657465727400007800);
INSERT INTO `qrtz_job_details` VALUES ('quartzScheduler', 'SampleParamJob', 'DEFAULT', NULL, 'SampleParamJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C77080000001000000001740009706172616D65746572740005576F726C647800);

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
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('quartzScheduler', 'SampleJob', 'DEFAULT', 'SampleJob', 'DEFAULT', NULL, 1534080837000, 1534080836000, 5, 'PAUSED', 'CRON', 1534080790000, 0, NULL, 0, '');
INSERT INTO `qrtz_triggers` VALUES ('quartzScheduler', 'SampleParamJob', 'DEFAULT', 'SampleParamJob', 'DEFAULT', NULL, 1537715980000, 1537715979000, 5, 'PAUSED', 'CRON', 1534081976000, 0, NULL, 0, '');

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_department
-- ----------------------------
INSERT INTO `t_department` VALUES ('40327253309001728', '', '2018-08-10 20:58:27', 0, '', '2018-08-11 17:26:38', '40322811096469504', 3.00, -1, '人工智障', NULL, NULL);
INSERT INTO `t_department` VALUES ('40322777781112832', '', '2018-08-10 20:40:40', 0, '', '2018-08-11 00:03:06', '0', 1.00, 0, '总部', b'1', NULL);
INSERT INTO `t_department` VALUES ('40322811096469504', '', '2018-08-10 20:40:48', 0, '', '2018-08-11 00:27:05', '40322777781112832', 1.00, 0, '技术部', b'1', NULL);
INSERT INTO `t_department` VALUES ('40322852833988608', '', '2018-08-10 20:40:58', 0, '', '2018-08-11 01:29:42', '40322811096469504', 1.00, 0, '研发中心', NULL, NULL);
INSERT INTO `t_department` VALUES ('40327204755738624', '', '2018-08-10 20:58:15', 0, '', '2018-08-10 22:02:15', '40322811096469504', 2.00, 0, '大数据', NULL, NULL);
INSERT INTO `t_department` VALUES ('40343262766043136', '', '2018-08-10 22:02:04', 0, '', '2018-08-11 00:02:53', '0', 2.00, 0, '成都分部', b'1', NULL);
INSERT INTO `t_department` VALUES ('40681289119961088', '', '2018-08-11 20:25:16', 0, '', '2018-08-11 22:47:48', '40652270295060480', 2.00, 0, 'VIP', b'0', NULL);
INSERT INTO `t_department` VALUES ('40344005342400512', '', '2018-08-10 22:05:01', 0, '', '2018-08-11 17:48:44', '40343262766043136', 2.00, 0, 'Vue', NULL, NULL);
INSERT INTO `t_department` VALUES ('40652270295060480', '', '2018-08-11 18:29:57', 0, '', '2018-08-12 18:45:01', '0', 3.00, 0, '人事部', b'1', NULL);
INSERT INTO `t_department` VALUES ('40389030113710080', '', '2018-08-11 01:03:56', 0, '', '2018-08-11 17:50:04', '40343262766043136', 1.00, 0, 'JAVA', b'0', NULL);
INSERT INTO `t_department` VALUES ('40652338142121984', NULL, '2018-08-11 18:30:13', 0, NULL, '2018-08-11 18:30:13', '40652270295060480', 1.00, 0, '游客', b'0', NULL);

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
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜品库表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_food_lib
-- ----------------------------
INSERT INTO `t_food_lib` VALUES ('89884865356369920', '湖南菜库', 0, 0, 'admin', '2018-12-25 15:02:47', 'admin', '2018-12-25 16:43:14', '安业公司');
INSERT INTO `t_food_lib` VALUES ('89885284358950912', '山西菜库', 0, 0, 'admin', '2018-12-25 15:04:23', 'admin', '2018-12-25 16:43:14', '安业公司');
INSERT INTO `t_food_lib` VALUES ('89885310351052800', '广东菜库', 0, 0, 'admin', '2018-12-25 15:04:29', 'admin', '2018-12-25 16:43:14', '安业公司');
INSERT INTO `t_food_lib` VALUES ('89885332970934272', '合肥菜库', 0, 0, 'admin', '2018-12-25 15:04:34', 'admin', '2018-12-25 16:43:14', '安业公司');
INSERT INTO `t_food_lib` VALUES ('89885370665144320', '河南菜库', 0, 0, 'admin', '2018-12-25 15:04:43', 'admin', '2018-12-25 16:43:14', '安业公司');
INSERT INTO `t_food_lib` VALUES ('89885399865888768', '广州菜库', 0, 0, 'admin', '2018-12-25 15:04:50', 'admin', '2018-12-25 16:43:14', '安业公司');
INSERT INTO `t_food_lib` VALUES ('89885424134131712', '上海菜库', 0, 0, 'admin', '2018-12-25 15:04:56', 'admin', '2018-12-25 16:43:14', '安业公司');
INSERT INTO `t_food_lib` VALUES ('89885445948706816', '江苏菜库', 0, 0, 'admin', '2018-12-25 15:05:01', 'admin', '2018-12-25 16:43:14', '安业公司');
INSERT INTO `t_food_lib` VALUES ('89885465636769792', '山东菜库', 0, 0, 'admin', '2018-12-25 15:05:06', 'admin', '2018-12-25 16:43:14', '安业公司');
INSERT INTO `t_food_lib` VALUES ('89885482996994048', '武汉菜库', 0, 0, 'admin', '2018-12-25 15:05:10', 'admin', '2018-12-25 16:43:14', '安业公司');
INSERT INTO `t_food_lib` VALUES ('89885538890289152', '江西菜库', 0, 0, 'admin', '2018-12-25 15:05:24', 'admin', '2018-12-25 16:43:14', '安业公司');
INSERT INTO `t_food_lib` VALUES ('89885598881419264', '11', 1, 0, '11', '2019-01-01 17:40:49', 'admin', '2018-12-25 18:43:13', '安业公司');

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
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES ('89466531603288064', NULL, '2018-12-24 11:20:25', 0, NULL, '2018-12-24 11:20:25', 272, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, NULL);
INSERT INTO `t_log` VALUES ('89504323876163584', NULL, '2018-12-24 13:50:35', 0, NULL, '2018-12-24 13:50:35', 305, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, NULL);
INSERT INTO `t_log` VALUES ('89507116179525632', NULL, '2018-12-24 14:01:42', 0, NULL, '2018-12-24 14:01:42', 1423, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, NULL);
INSERT INTO `t_log` VALUES ('89507460095676416', NULL, '2018-12-24 14:03:03', 0, NULL, '2018-12-24 14:03:03', 220, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, NULL);
INSERT INTO `t_log` VALUES ('89507492991602688', NULL, '2018-12-24 14:03:10', 0, NULL, '2018-12-24 14:03:10', 135, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, NULL);
INSERT INTO `t_log` VALUES ('89507513157816320', NULL, '2018-12-24 14:03:15', 0, NULL, '2018-12-24 14:03:15', 112, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, NULL);
INSERT INTO `t_log` VALUES ('89507526990630912', NULL, '2018-12-24 14:03:19', 0, NULL, '2018-12-24 14:03:19', 110, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, NULL);
INSERT INTO `t_log` VALUES ('89513184100093952', NULL, '2018-12-24 14:25:47', 0, NULL, '2018-12-24 14:25:47', 124, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, NULL);
INSERT INTO `t_log` VALUES ('89515805946941440', NULL, '2018-12-24 14:36:13', 0, NULL, '2018-12-24 14:36:13', 227, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, NULL);
INSERT INTO `t_log` VALUES ('89538101566771200', NULL, '2018-12-24 16:04:48', 0, NULL, '2018-12-24 16:04:48', 250, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', 0, NULL);
INSERT INTO `t_log` VALUES ('89538124635443200', NULL, '2018-12-24 16:04:54', 0, NULL, '2018-12-24 16:04:54', 116, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', 0, NULL);
INSERT INTO `t_log` VALUES ('89560681602355200', NULL, '2018-12-24 17:34:32', 0, NULL, '2018-12-24 17:34:32', 330, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', 0, NULL);
INSERT INTO `t_log` VALUES ('89561845181976576', NULL, '2018-12-24 17:39:09', 0, NULL, '2018-12-24 17:39:09', 181, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', 0, NULL);
INSERT INTO `t_log` VALUES ('89803107277475840', NULL, '2018-12-25 09:37:51', 0, NULL, '2018-12-25 09:37:51', 639, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', 0, NULL);
INSERT INTO `t_log` VALUES ('89805404007043072', NULL, '2018-12-25 09:46:58', 0, NULL, '2018-12-25 09:46:58', 200, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', 0, NULL);
INSERT INTO `t_log` VALUES ('89809337513414656', NULL, '2018-12-25 10:02:36', 0, NULL, '2018-12-25 10:02:36', 183, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', 0, NULL);
INSERT INTO `t_log` VALUES ('89812491613245440', NULL, '2018-12-25 10:15:08', 0, NULL, '2018-12-25 10:15:08', 177, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', 0, NULL);
INSERT INTO `t_log` VALUES ('89818389932937216', NULL, '2018-12-25 10:38:35', 0, NULL, '2018-12-25 10:38:35', 1486, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', 0, NULL);
INSERT INTO `t_log` VALUES ('89833394199859200', NULL, '2018-12-25 11:38:12', 0, NULL, '2018-12-25 11:38:12', 295, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('89833546838970368', NULL, '2018-12-25 11:38:48', 0, NULL, '2018-12-25 11:38:48', 207, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('89837798592352256', NULL, '2018-12-25 11:55:42', 0, NULL, '2018-12-25 11:55:42', 297, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('89865164974723072', NULL, '2018-12-25 13:44:26', 0, NULL, '2018-12-25 13:44:26', 288, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('89869645971984384', NULL, '2018-12-25 14:02:15', 0, NULL, '2018-12-25 14:02:15', 210, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('89881718219083776', NULL, '2018-12-25 14:50:13', 0, NULL, '2018-12-25 14:50:13', 278, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('89885986430914560', NULL, '2018-12-25 15:07:10', 0, NULL, '2018-12-25 15:07:10', 204, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('89898672606679040', NULL, '2018-12-25 15:57:35', 0, NULL, '2018-12-25 15:57:35', 270, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('89913225784594432', NULL, '2018-12-25 16:55:25', 0, NULL, '2018-12-25 16:55:25', 270, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('89917012771344384', NULL, '2018-12-25 17:10:28', 0, NULL, '2018-12-25 17:10:28', 258, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('89923451518717952', NULL, '2018-12-25 17:36:03', 0, NULL, '2018-12-25 17:36:03', 520, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);
INSERT INTO `t_log` VALUES ('89940243477696512', NULL, '2018-12-25 18:42:46', 0, NULL, '2018-12-25 18:42:46', 183, '192.168.2.239', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/minshang/login', 'admin', NULL, 0);

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
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES ('43615268366192640', '', '2018-08-19 22:43:51', 0, '', '2018-08-24 23:02:13', b'1', '欢迎您注册账号使用X-Boot 点我查看使用须知', 0, '<p style=\"text-align: center;\">X-Boot是很棒的Web前后端分离开发平台，开源版本请遵循GPL v3.0开源协议，不得闭源，商用需求请联系作者签署授权协议。</p><p style=\"text-align: center;\">捐赠获取完整版：<a href=\"http://xpay.houyi.cn/pay?minshang\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255);\">立即去捐赠获取</a></p><p style=\"text-align: center;\"><img src=\"https://i.loli.net/2018/08/24/5b801c8652227.png\" style=\"max-width:150px;\"><br></p><p style=\"text-align: center;\">（支持手机扫码支付）</p><p style=\"text-align: center;\">获取商用授权：<a href=\"http://wpa.qq.com/msgrd?v=3&amp;uin=1012139570&amp;site=qq&amp;menu=yes\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255);\">立即联系作者获取商用授权</a></p>', NULL, NULL);

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
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_message_send
-- ----------------------------
INSERT INTO `t_message_send` VALUES ('43615268663988224', NULL, '2018-08-19 22:43:51', 0, NULL, '2018-08-19 22:43:51', '43615268366192640', 0, '682265633886209', NULL);
INSERT INTO `t_message_send` VALUES ('43615268663988225', NULL, '2018-08-19 22:43:51', 0, NULL, '2018-08-19 22:43:51', '43615268366192640', 0, '16739222421508096', NULL);
INSERT INTO `t_message_send` VALUES ('43615268663988226', '', '2018-08-19 22:43:51', 0, '', '2018-08-24 12:41:24', '43615268366192640', 2, '4363087427670016', NULL);
INSERT INTO `t_message_send` VALUES ('43615268663988227', '', '2018-08-19 22:43:51', 0, '', '2018-10-11 00:03:12', '43615268366192640', 1, '682265633886208', NULL);

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组织机构' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_organization
-- ----------------------------
INSERT INTO `t_organization` VALUES ('89838476689674240', '-1', '安业公司', 'admin', '2018-12-25 11:58:27', 0, 'admin', '2018-12-25 11:58:27', 0);
INSERT INTO `t_organization` VALUES ('89869690112839680', '89838476689674240', '安业公司瑶海店', 'admin', '2018-12-25 14:02:42', 0, 'admin', '2018-12-25 14:02:42', 0);
INSERT INTO `t_organization` VALUES ('89870067138826240', '89838476689674240', '安业公司晋安店', 'admin', '2018-12-25 14:03:55', 0, 'admin', '2018-12-25 14:03:55', 0);
INSERT INTO `t_organization` VALUES ('89870101624393728', '89838476689674240', '安业公司长江店', 'admin', '2018-12-25 14:04:03', 0, 'admin', '2018-12-25 14:04:03', 0);
INSERT INTO `t_organization` VALUES ('89870134574845952', '89838476689674240', '安业公司望江店', 'admin', '2018-12-25 14:04:11', 0, 'admin', '2018-12-25 14:04:11', 0);
INSERT INTO `t_organization` VALUES ('89870158994083840', '89838476689674240', '安业公司芜湖店', 'admin', '2018-12-25 14:04:17', 0, 'admin', '2018-12-25 14:04:17', 0);
INSERT INTO `t_organization` VALUES ('89870186554855424', '89838476689674240', '安业公司步行街店', 'admin', '2018-12-25 14:04:23', 0, 'admin', '2018-12-25 14:04:23', 0);
INSERT INTO `t_organization` VALUES ('89870210927955968', '89838476689674240', '安业公司巢湖店', 'admin', '2018-12-25 14:04:29', 0, 'admin', '2018-12-25 14:04:29', 0);
INSERT INTO `t_organization` VALUES ('89870244390113280', '89838476689674240', '安业公司肥东店', 'admin', '2018-12-25 14:04:37', 0, 'admin', '2018-12-25 14:04:37', 0);
INSERT INTO `t_organization` VALUES ('89870290128998400', '89838476689674240', '安业公司肥西店', 'admin', '2018-12-25 14:04:48', 0, 'admin', '2018-12-25 14:04:48', 0);
INSERT INTO `t_organization` VALUES ('89870322697768960', '89838476689674240', '安业公司长风店', 'admin', '2018-12-25 14:04:56', 0, 'admin', '2018-12-25 14:04:56', 0);
INSERT INTO `t_organization` VALUES ('89870361297948672', '89838476689674240', '安业公司惠南店', 'admin', '2018-12-25 14:05:05', 0, 'admin', '2018-12-25 14:05:05', 0);

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
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `t_permission` VALUES ('39916171171991552', '', '2018-08-09 17:44:57', 0, '', '2018-08-25 12:13:11', '', 'druid', '39915540965232640', 0, 2.40, 'sys/monitor/monitor', 'druid', 'SQL监控', 'md-analytics', 2, '', 0, 'http://minshang.houyi.cn/druid/login.html', NULL);
INSERT INTO `t_permission` VALUES ('39918482854252544', '', '2018-08-09 17:54:08', 0, '', '2018-08-25 12:13:27', '', 'swagger', '39915540965232640', 0, 2.50, 'sys/monitor/monitor', 'swagger', '接口文档', 'md-document', 2, '', 0, 'http://minshang.houyi.cn/swagger-ui.html', NULL);
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
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_quartz_job
-- ----------------------------
INSERT INTO `t_quartz_job` VALUES ('41065738420621312', '', '2018-08-12 21:52:56', 0, '', '2018-09-23 23:19:39', '0/1 * * * * ? ', '带参测试 后台将每隔1秒执行输出日志', 'SampleParamJob', 'World', -1, NULL);
INSERT INTO `t_quartz_job` VALUES ('41060689401352192', '', '2018-08-12 20:32:52', 0, '', '2018-08-12 21:33:56', '0/1 * * * * ? ', '无参测试 后台将每隔1秒执行输出日志', 'SampleJob', '', -1, NULL);

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
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('682265633886209', '鲁寒', '2018-04-30 23:28:42', 'admin', '2018-09-26 20:07:00', '', 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', '', '1012@qq.com', '18782059033', '', '$2a$10$PS04ecXfknNd3V8d.ymLTObQciapMU4xU8.GADBZZsuTZr7ymnagy', 1, -1, 0, 'houyi', 0, '40322777781112832', NULL, '弱', NULL);
INSERT INTO `t_user` VALUES ('16739222421508096', '鲁寒', '2018-06-06 18:48:02', 'admin', '2018-10-08 00:04:32', '', 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', '', '1012139570@qq.com', '18782059033', '', '$2a$10$PS04ecXfknNd3V8d.ymLTObQciapMU4xU8.GADBZZsuTZr7ymnagy', 1, 0, 0, 'test2', 0, '40652338142121984', '', '弱', NULL);
INSERT INTO `t_user` VALUES ('4363087427670016', '鲁寒', '2018-05-03 15:09:42', 'admin', '2018-10-08 00:04:46', '[\"510000\",\"510100\",\"510114\"]', 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', '', '1012139570@qq.com', '18782059033', '', '$2a$10$PS04ecXfknNd3V8d.ymLTObQciapMU4xU8.GADBZZsuTZr7ymnagy', 1, 0, 0, 'test', 0, '40652338142121984', '', '弱', NULL);
INSERT INTO `t_user` VALUES ('682265633886208', '鲁寒', '2018-05-01 16:13:51', 'admin', '2018-11-01 17:00:47', '[\"510000\",\"510100\",\"510104\"]', 'http://p77xsahe9.bkt.clouddn.com/788eb3e78206429eb34fc7cd3e1e46f4.jpg', 'test', '2549575805@qq.com', '18782059038', 'houyi', '$2a$10$bINR/VMje12C88mQOsgu9OvzLSbj6nS.3KlYgayD7WSFsDTQqI9AC', 1, 0, 1, 'admin', 0, '40322777781112832', '天府1街', '弱', NULL);

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
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
