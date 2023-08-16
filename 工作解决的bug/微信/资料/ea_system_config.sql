/*
 Navicat Premium Data Transfer

 Source Server         : piao
 Source Server Type    : MySQL
 Source Server Version : 50740 (5.7.40-log)
 Source Host           : 175.178.116.107:3306
 Source Schema         : paio_juchangcn_c

 Target Server Type    : MySQL
 Target Server Version : 50740 (5.7.40-log)
 File Encoding         : 65001

 Date: 11/08/2023 09:50:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ea_system_config
-- ----------------------------
DROP TABLE IF EXISTS `ea_system_config`;
CREATE TABLE `ea_system_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sort` bigint(16) NULL DEFAULT 0 COMMENT '排序',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分组',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '变量值',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  `create_time` bigint(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(11) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` bigint(16) NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `group`(`group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统配置表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ea_system_config
-- ----------------------------
INSERT INTO `ea_system_config` VALUES (1, 0, 'web_appid', 'wechat', 'wxd2151aa83d4b5530', '公众号公钥', 1690766913, 1690766969, 0);
INSERT INTO `ea_system_config` VALUES (2, 0, 'web_appsecret', 'wechat', 'cb4db20ac570a8fef5b3eb8eb7cb3b18', '公众号私钥', 1690766928, 1690766975, 0);

SET FOREIGN_KEY_CHECKS = 1;
