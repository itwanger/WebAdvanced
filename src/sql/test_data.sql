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

 Date: 05/09/2018 20:58:41 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `test_data`
-- ----------------------------
DROP TABLE IF EXISTS `test_data`;
CREATE TABLE `test_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '标题',
  `content` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '内容',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_date` bigint(13) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_date` bigint(13) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `del_flag` tinyint(2) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务数据表';

-- ----------------------------
--  Records of `test_data`
-- ----------------------------
BEGIN;
INSERT INTO `test_data` VALUES ('1', '丝绸之路，听话', '童年时，听话', '0', '1503629997902', '1503629997902', '0'), ('2', '丝绸之路，自律', '青年时，自律', '0', '1503629997902', '1496808670602', '0'), ('3', '丝绸之路，正义', '成年时，正义', '0', '1503629997902', '1497672670902', '0'), ('4', '丝绸之路，智慧', '老年时，智慧', '0', '1503629997902', '1503629997902', '0'), ('5', '丝绸之路，安详', '死去时，安详', '0', '1503629997902', '1502899200902', '0'), ('6', '沉默王二', '学习加载远程页面弹出层', '0', '1503629997902', '1503763200902', '1'), ('7', '沉默王二1', '学习加载远程页面弹出层1', '0', '1503630791049', '1502943070049', '1'), ('8', '沉默王二', '学习ajaxToDialog', '0', '1512637582173', '1512637582173', '0');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
