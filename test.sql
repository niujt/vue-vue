/*
 Navicat Premium Data Transfer

 Source Server         : mysqldb
 Source Server Type    : MySQL
 Source Server Version : 50712
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 50712
 File Encoding         : 65001

 Date: 18/12/2018 16:36:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES (1, '江苏', '苏州');
INSERT INTO `city` VALUES (2, '浙江', '杭州');
INSERT INTO `city` VALUES (3, '江苏', '无锡');
INSERT INTO `city` VALUES (4, '上海', '徐汇区');
INSERT INTO `city` VALUES (5, '北京', '三环');
INSERT INTO `city` VALUES (6, '上海', '闵行区');
INSERT INTO `city` VALUES (7, '广东', '深圳');

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES (1, 'xiaoming', '123456', 1);
INSERT INTO `login` VALUES (2, 'xiaohong', '123456', 2);
INSERT INTO `login` VALUES (3, 'xiaogang', '123456', 3);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `salary` decimal(10, 2) NULL DEFAULT NULL,
  `addressid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '王小明', 18, 3000.00, '1');
INSERT INTO `user` VALUES (2, '张小红', 22, 3500.00, '2');
INSERT INTO `user` VALUES (3, '瞿小刚', 34, 4000.00, '3');

SET FOREIGN_KEY_CHECKS = 1;
