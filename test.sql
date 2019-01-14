/*
 Navicat Premium Data Transfer

 Source Server         : MyDB
 Source Server Type    : MySQL
 Source Server Version : 50712
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 50712
 File Encoding         : 65001

 Date: 07/01/2019 01:33:57
*/


SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cityname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `provinceid` int(11) NULL DEFAULT NULL COMMENT '省id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES (1, '苏州', 1);
INSERT INTO `city` VALUES (2, '杭州', 4);
INSERT INTO `city` VALUES (3, '无锡', 1);
INSERT INTO `city` VALUES (4, '徐汇区', 2);
INSERT INTO `city` VALUES (5, '三环', 3);
INSERT INTO `city` VALUES (8, '淮安', 1);
INSERT INTO `city` VALUES (12, '盐城', 1);
INSERT INTO `city` VALUES (13, '宿迁', 1);

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `department` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES (1, '行政部');
INSERT INTO `dept` VALUES (2, '财务部');
INSERT INTO `dept` VALUES (3, '质量管理部');
INSERT INTO `dept` VALUES (4, '营运部');

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '123456',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES (1, 'xiaoming', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `login` VALUES (2, 'xiaohong', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `login` VALUES (3, 'xiaogang', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `login` VALUES (4, 'xiaozhao', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `login` VALUES (5, 'xiaoqian', 'e10adc3949ba59abbe56e057f20f883e');

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `postionname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位',
  `deptid` int(11) NULL DEFAULT NULL COMMENT '部门id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES (1, '行政', 1);
INSERT INTO `position` VALUES (2, '后勤', 1);
INSERT INTO `position` VALUES (3, '行政总监行政经理', 1);
INSERT INTO `position` VALUES (4, '主管', 1);
INSERT INTO `position` VALUES (5, '办公室主任', 1);
INSERT INTO `position` VALUES (6, '行政专员', 1);
INSERT INTO `position` VALUES (7, '助理', 1);
INSERT INTO `position` VALUES (8, '统计员', 2);
INSERT INTO `position` VALUES (9, '税务经理', 2);
INSERT INTO `position` VALUES (10, '主管', 2);
INSERT INTO `position` VALUES (11, '税务专员', 2);
INSERT INTO `position` VALUES (12, '助理', 2);
INSERT INTO `position` VALUES (13, '质量检验员', 3);
INSERT INTO `position` VALUES (14, '测试员', 3);
INSERT INTO `position` VALUES (15, '认证工程师', 3);
INSERT INTO `position` VALUES (16, '审核员', 3);
INSERT INTO `position` VALUES (17, '供应商', 3);
INSERT INTO `position` VALUES (18, '采购设备与材料质量管理', 3);
INSERT INTO `position` VALUES (19, '销售总监', 2);
INSERT INTO `position` VALUES (20, '区域销售经理', 4);

-- ----------------------------
-- Table structure for province
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `provincename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES (1, '江苏');
INSERT INTO `province` VALUES (2, '上海');
INSERT INTO `province` VALUES (3, '北京');
INSERT INTO `province` VALUES (4, '浙江');
INSERT INTO `province` VALUES (5, '北京');
INSERT INTO `province` VALUES (6, '广东');
INSERT INTO `province` VALUES (7, '福建');
INSERT INTO `province` VALUES (8, '江西');
INSERT INTO `province` VALUES (9, '安徽');
INSERT INTO `province` VALUES (10, '新疆');
INSERT INTO `province` VALUES (11, '内蒙古');
INSERT INTO `province` VALUES (12, '青海');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `loginid` int(11) NULL DEFAULT NULL COMMENT '登录id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名字',
  `iconhead` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `sex` int(10) NULL DEFAULT NULL COMMENT '性别',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `salary` decimal(10, 2) NULL DEFAULT NULL COMMENT '薪水',
  `education1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小学学历',
  `education2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '初中学历',
  `education3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '高中学历',
  `education4` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大学学历',
  `ishigheducation` int(255) NULL DEFAULT NULL COMMENT '是否研究生及本科',
  `deptpositionid` int(11) NULL DEFAULT NULL COMMENT '部门职位id',
  `addressid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址id',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 1, '王小明', '', '670482466@qq.com', '18115530702', 1, 18, 3000.00, 'asgdha小学', '奥数短时中学', '苏亲爱高中', '清华大学', 0, 1, '1', '2018-12-20 19:39:05');
INSERT INTO `user` VALUES (2, 2, '张小红', NULL, 'fghj@163.com', '18115540702', 2, 22, 3500.00, 'asdfa小学', '大是大非中学', '啊实打实打算高中', '北京大学', 0, 1, '2', '2018-12-20 19:39:07');
INSERT INTO `user` VALUES (3, 3, '瞿小刚', NULL, 'asdhaj@hotmail.com', '18115550702', 1, 34, 4000.00, 'd大苏打小学', '归还借款中学', '大苏打撒旦高中', '厦门大学', 1, 2, '3', '2018-12-20 19:39:13');

-- ----------------------------
-- Function structure for getAddress
-- ----------------------------
DROP FUNCTION IF EXISTS `getAddress`;
delimiter ;;
CREATE DEFINER=`njt123`@`%` FUNCTION `getAddress`(pid int(10)) RETURNS varchar(40) CHARSET utf8
BEGIN
	
	RETURN (select concat(p.provincename,c.cityname) from city c,province p where c.provinceid=p.id and c.id=pid);
END
;;
delimiter ;

-- ----------------------------
-- Function structure for getDeptPosition
-- ----------------------------
DROP FUNCTION IF EXISTS `getDeptPosition`;
delimiter ;;
CREATE DEFINER=`njt123`@`%` FUNCTION `getDeptPosition`(pid int(10)) RETURNS varchar(40) CHARSET utf8
BEGIN

	RETURN (select concat(d.department,p.postionname) from dept d,position p where d.id=p.deptid and p.id=pid);
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
