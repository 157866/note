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

 Date: 11/08/2023 09:57:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ea_back_member
-- ----------------------------
DROP TABLE IF EXISTS `ea_back_member`;
CREATE TABLE `ea_back_member`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `openid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'openid',
  `is_concern` tinyint(1) NULL DEFAULT 0 COMMENT '是否关注(0:否;1:是)',
  `create_admin_id` bigint(20) NULL DEFAULT 0 COMMENT '创建者id',
  `update_admin_id` bigint(20) NULL DEFAULT 0 COMMENT '最后修改人id',
  `create_time` bigint(16) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(16) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` bigint(16) NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `openid`(`openid`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户列表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ea_back_member
-- ----------------------------
INSERT INTO `ea_back_member` VALUES (4, 0, '不说话的唐僧（小程序，软件开发）', NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/Gkh2zhb7BbqYST4hBbrI5Dic765kUwQeYh8KPT6IgGyBibiaAE20nic3kJBvTZbibpW0wVY0u6fcy1htaUINxDKTTZw/132', 'ofliixITwtMlzgzh59zw82ngQPlw', 1, 0, 0, 1691132421, NULL, 0);
INSERT INTO `ea_back_member` VALUES (5, 0, '梦想世界', NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/WCQMoLrZcOlwbt8TuH08ta5icOBLwotMmE7eHX4TBYiarPRS8M31HmRHBFZ0yulU1eibIcMIF9eQkmhMCibhjnrO4g/132', 'ofliixKxGzjOxGKkPjuRRebuSI5o', 1, 0, 0, 1691134318, NULL, 0);
INSERT INTO `ea_back_member` VALUES (6, 0, 'sea', NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKrzZT06vXePicLODQ352aBgG7cFEeHXSM6LZU1WKN4J58shy1e21jIDrfdTayXm6wdlnt5nzMxjTA/132', 'ofliixCnDpvIF4-lFaVZWH7JkUM8', 1, 0, 0, 1691393514, NULL, 0);
INSERT INTO `ea_back_member` VALUES (7, 0, '冯良坤 腾讯广告.软件开发', NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/eGtxv1gNkb4teK7vCfCbshpLKYj05bAhshHujE1UE3KCjWspFFxPs4xfXxK7KRCQSOqTCFwKHibLl8fyybSdt1Q/132', 'ofliixFEsd_2zGYAMdbN4P65ugwE', 1, 0, 0, 1691399114, NULL, 0);

SET FOREIGN_KEY_CHECKS = 1;
