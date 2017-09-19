CREATE DATABASE IF NOT EXISTS `k2alpha_health` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE `k2alpha_health`;
/*
Navicat MySQL Data Transfer

Source Server         : 64
Source Server Version : 50631
Source Host           : 192.168.130.64:3306
Source Database       : k2alpha_health

Target Server Type    : MYSQL
Target Server Version : 50631
File Encoding         : 65001

Date: 2017-09-14 13:56:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for early_waring
-- ----------------------------
DROP TABLE IF EXISTS `early_waring`;
CREATE TABLE `early_waring` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `device_no` varchar(50) DEFAULT NULL,
  `device_name` varchar(255) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `level` varchar(50) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `waring_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `type` varchar(20) DEFAULT NULL COMMENT '预警类型:real预警 fault 故障预警',
  `deal_type` tinyint(4) DEFAULT '0' COMMENT '0 站内消息,未处理 1:站内消息忽略 2:站内消息生成工单 3:不显示 4:发送短信 5 发送邮件6不处理',
  `deal_user` varchar(255) DEFAULT NULL,
  `deal_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fault_name` varchar(500) DEFAULT NULL COMMENT '故障名称',
  `is_mq` tinyint(4) DEFAULT '0' COMMENT '是否站内通知，0:不通知 1:不处理 2:忽略 3:生成工单',
  `is_sms` tinyint(4) DEFAULT '0' COMMENT '是否短信通知，0:不通知 1:通知',
  `is_mail` tinyint(4) DEFAULT '0' COMMENT '是否邮件通知，0:不通知 1:通知',
  `model_id` bigint(20) DEFAULT NULL COMMENT '模型id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8371 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for job_task
-- ----------------------------
DROP TABLE IF EXISTS `job_task`;
CREATE TABLE `job_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) DEFAULT NULL COMMENT '作业id',
  `task_id` bigint(20) DEFAULT NULL COMMENT '任务id',
  `project_id` bigint(20) DEFAULT NULL COMMENT '模型id',
  `status` tinyint(4) DEFAULT '0' COMMENT '0:正在运行 1成功 2:失败',
  `is_deal_kmx` tinyint(4) DEFAULT '0' COMMENT '0:未导入kmx 1:正在导入 2:已导入 ',
  `message` varchar(255) DEFAULT '' COMMENT '消息内容',
  `start_time` datetime DEFAULT NULL COMMENT '作业执行条件开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '作业执行条件开始时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=468 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for model
-- ----------------------------
DROP TABLE IF EXISTS `model`;
CREATE TABLE `model` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `model_id` bigint(20) DEFAULT NULL COMMENT '模型的id',
  `icon` varchar(255) DEFAULT NULL COMMENT '关联图片',
  `useful` tinyint(4) DEFAULT '0' COMMENT '0: 可用  1:不可用',
  `update_by` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(200) DEFAULT NULL,
  `task_type` varchar(50) DEFAULT NULL COMMENT '自动,手动',
  `model_id_copy` bigint(255) DEFAULT NULL,
  `model_id` bigint(255) DEFAULT NULL,
  `device_parts` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `frequency` varchar(50) DEFAULT NULL,
  `details` varchar(500) DEFAULT NULL,
  `action` varchar(100) DEFAULT NULL,
  `result` varchar(100) DEFAULT NULL,
  `device_type` varchar(500) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `kmxVariableName` varchar(255) DEFAULT NULL,
  `kmx_sum_field` varchar(255) DEFAULT NULL,
  `deal_flag` tinyint(4) DEFAULT '0' COMMENT '0: 可用 1: 可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for task_device
-- ----------------------------
DROP TABLE IF EXISTS `task_device`;
CREATE TABLE `task_device` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) DEFAULT NULL,
  `device_id` bigint(20) DEFAULT NULL COMMENT '设备信息中的设备主键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=691 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for task_quartz
-- ----------------------------
DROP TABLE IF EXISTS `task_quartz`;
CREATE TABLE `task_quartz` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_id` varchar(200) DEFAULT NULL,
  `job_name` varchar(250) DEFAULT NULL,
  `job_group` varchar(255) DEFAULT NULL,
  `job_status` varchar(255) DEFAULT NULL COMMENT '0:正在运行 1成功 2:失败',
  `job_desc` varchar(255) DEFAULT NULL,
  `cron_expression` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
