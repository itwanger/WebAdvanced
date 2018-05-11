/*
 Navicat MySQL Data Transfer

 Source Server         : 115.29.188.62
 Source Server Type    : MySQL
 Source Server Version : 50537
 Source Host           : 115.29.188.62
 Source Database       : cmower

 Target Server Type    : MySQL
 Target Server Version : 50537
 File Encoding         : utf-8

 Date: 05/09/2018 21:01:35 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(4) COLLATE utf8_bin NOT NULL COMMENT '用户编号',
  `password` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `create_date` bigint(13) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_date` bigint(13) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `del_flag` tinyint(2) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户数据表';

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('8', 'wang', '96e79218965eb72c92a549dd5a330112', '0', '0', '0');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
