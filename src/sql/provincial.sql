/*
Navicat MySQL Data Transfer

Source Server         : 阿里筑梦商
Source Server Version : 50704
Source Host           : 47.100.118.243:3306
Source Database       : zhumeng

Target Server Type    : MYSQL
Target Server Version : 50704
File Encoding         : 65001

Date: 2018-07-17 14:04:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for provincial
-- ----------------------------
DROP TABLE IF EXISTS `provincial`;
CREATE TABLE `provincial` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `proname` varchar(50) NOT NULL COMMENT '省级名称',
  `procode` varchar(45) NOT NULL COMMENT '省级代码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `proname` (`proname`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='省会表';

-- ----------------------------
-- Records of provincial
-- ----------------------------
INSERT INTO `provincial` VALUES ('1', '北京', 'BJ');
INSERT INTO `provincial` VALUES ('2', '上海', 'SH');
INSERT INTO `provincial` VALUES ('3', '天津', 'TJ');
INSERT INTO `provincial` VALUES ('4', '重庆', 'CQ');
INSERT INTO `provincial` VALUES ('5', '河北', 'HE');
INSERT INTO `provincial` VALUES ('6', '山西', 'SA');
INSERT INTO `provincial` VALUES ('7', '内蒙古自治区', 'NM');
INSERT INTO `provincial` VALUES ('8', '辽宁', 'LN');
INSERT INTO `provincial` VALUES ('9', '吉林', 'JL');
INSERT INTO `provincial` VALUES ('10', '黑龙江', 'HL');
INSERT INTO `provincial` VALUES ('11', '江苏', 'JS');
INSERT INTO `provincial` VALUES ('12', '浙江', 'ZJ');
INSERT INTO `provincial` VALUES ('13', '安徽', 'AH');
INSERT INTO `provincial` VALUES ('14', '福建', 'FJ');
INSERT INTO `provincial` VALUES ('15', '江西', 'JX');
INSERT INTO `provincial` VALUES ('16', '山东', 'SD');
INSERT INTO `provincial` VALUES ('17', '河南', 'HS');
INSERT INTO `provincial` VALUES ('18', '湖北', 'HB');
INSERT INTO `provincial` VALUES ('19', '湖南', 'HN');
INSERT INTO `provincial` VALUES ('20', '广东', 'GD');
INSERT INTO `provincial` VALUES ('21', '广西壮族自治区', 'GX');
INSERT INTO `provincial` VALUES ('22', '海南', 'HA');
INSERT INTO `provincial` VALUES ('23', '四川', 'SC');
INSERT INTO `provincial` VALUES ('24', '贵州', 'GZ');
INSERT INTO `provincial` VALUES ('25', '云南', 'YN');
INSERT INTO `provincial` VALUES ('26', '西藏自治区', 'XZ');
INSERT INTO `provincial` VALUES ('27', '陕西', 'SX');
INSERT INTO `provincial` VALUES ('28', '甘肃', 'GS');
INSERT INTO `provincial` VALUES ('29', '青海', 'QH');
INSERT INTO `provincial` VALUES ('30', '宁夏回族自治区', 'NX');
INSERT INTO `provincial` VALUES ('31', '新疆维吾尔自治区', 'XJ');
