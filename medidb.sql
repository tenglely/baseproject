/*
 Navicat MySQL Data Transfer

 Source Server         : teng
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : medidb

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 11/04/2019 15:28:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for agency
-- ----------------------------
DROP TABLE IF EXISTS `agency`;
CREATE TABLE `agency`  (
  `ano` int(12) NOT NULL AUTO_INCREMENT,
  `aname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `asex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `aphone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `aremark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apassword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `aclass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ano`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1006 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agency
-- ----------------------------
INSERT INTO `agency` VALUES (1001, '员工1', '男', '123456', '', 'qaz123', '经办人');
INSERT INTO `agency` VALUES (1002, '员工2', '男', '12345678', '', 'qaz123', '采购人员');
INSERT INTO `agency` VALUES (1005, '管理员1', '男', '12345678', '', 'qaz123', '管理员');

-- ----------------------------
-- Table structure for buy
-- ----------------------------
DROP TABLE IF EXISTS `buy`;
CREATE TABLE `buy`  (
  `sno` int(10) NOT NULL AUTO_INCREMENT,
  `ano` int(12) NOT NULL,
  `cno` int(10) NOT NULL,
  `mno` int(10) NOT NULL,
  `csymptom` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `num` int(10) NOT NULL,
  `price` int(10) NOT NULL,
  `date` datetime(0) NOT NULL,
  PRIMARY KEY (`sno`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20180089 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of buy
-- ----------------------------
INSERT INTO `buy` VALUES (20180085, 1001, 1102, 2013, '腿痛', 2, 50, '2018-12-04 12:00:13');
INSERT INTO `buy` VALUES (20180086, 1001, 1102, 2015, '腿痛', 1, 34, '2018-12-04 12:00:13');
INSERT INTO `buy` VALUES (20180087, 1001, 1103, 2014, '感冒', 2, 48, '2018-12-04 12:01:10');
INSERT INTO `buy` VALUES (20180088, 1001, 1104, 2016, '抽筋', 3, 132, '2018-12-04 12:02:09');

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client`  (
  `cno` int(12) NOT NULL AUTO_INCREMENT,
  `cname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `csex` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cage` int(6) NOT NULL,
  `caddress` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cphone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cremark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cno`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1105 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES (1102, '顾客1', '男', 23, '人民路23号', '13556511412', '');
INSERT INTO `client` VALUES (1103, '顾客2', '女', 24, '人民路24号', '121331267', '');
INSERT INTO `client` VALUES (1104, '顾客3', '女', 26, '人民路2号', '114243443', '');

-- ----------------------------
-- Table structure for medicine
-- ----------------------------
DROP TABLE IF EXISTS `medicine`;
CREATE TABLE `medicine`  (
  `mno` int(11) NOT NULL AUTO_INCREMENT,
  `mname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mmode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mefficacy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mprice` int(10) NOT NULL,
  `mcount` int(10) NOT NULL,
  PRIMARY KEY (`mno`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2018 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of medicine
-- ----------------------------
INSERT INTO `medicine` VALUES (2013, '药品1', '外服', '腿痛', 25, 228);
INSERT INTO `medicine` VALUES (2014, '药品2', '内服', '感冒', 24, 232);
INSERT INTO `medicine` VALUES (2015, '药品3', '内服', '腿痛', 34, 233);
INSERT INTO `medicine` VALUES (2016, '药品4', '外服', '抽筋', 44, 210);
INSERT INTO `medicine` VALUES (2017, '药品5', '外服', '骨折', 54, 231);

SET FOREIGN_KEY_CHECKS = 1;
