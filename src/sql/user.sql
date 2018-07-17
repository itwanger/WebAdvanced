SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(4) COLLATE utf8_bin NOT NULL COMMENT '用户编号',
  `password` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `create_date` bigint(13) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_date` bigint(13) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `del_flag` tinyint(2) DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户数据表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'wang', 'e10adc3949ba59abbe56e057f20f883e', '1501477805028', '1501477805028', '0');
