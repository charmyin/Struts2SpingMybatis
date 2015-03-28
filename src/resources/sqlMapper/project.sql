/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : project

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-03-28 16:22:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `applyplace`
-- ----------------------------
DROP TABLE IF EXISTS `applyplace`;
CREATE TABLE `applyplace` (
  `id` varchar(128) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `userId` varchar(128) DEFAULT NULL,
  `placeId` varchar(128) DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of applyplace
-- ----------------------------

-- ----------------------------
-- Table structure for `car`
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `id` varchar(128) NOT NULL,
  `plateNumber` varchar(64) DEFAULT NULL,
  `brand` varchar(64) DEFAULT NULL,
  `model` varchar(64) DEFAULT NULL,
  `ownerId` varchar(128) DEFAULT NULL,
  `engineNumber` varchar(128) DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES ('41ca048286ee4c6c9d3da1de419ea5e7c2f4ec45', 'asdf', 'asdf', 'asf', 'c44134ab91574729b6762cbbe00686173d0f170a', '阿萨德飞', null);
INSERT INTO `car` VALUES ('ed303eb5f23d483f959f01dc28cbb36e81f3d053', 'bbdddd', 'bb', 'bb', '989483372c164b87874b44819c3baa0a39d293d5', 'gggg', null);

-- ----------------------------
-- Table structure for `parkingplace`
-- ----------------------------
DROP TABLE IF EXISTS `parkingplace`;
CREATE TABLE `parkingplace` (
  `id` varchar(128) NOT NULL,
  `userId` varchar(128) DEFAULT NULL,
  `carplace` varchar(128) DEFAULT NULL,
  `code` varchar(128) DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parkingplace
-- ----------------------------
INSERT INTO `parkingplace` VALUES ('35103c9eb53c472cab432cf7e9575cd9096c1bcf', 'c44134ab91574729b6762cbbe00686173d0f170a', 'asdf', 'asdf', 'asdf');
INSERT INTO `parkingplace` VALUES ('f31b39b2c0684a729206a36963e0298b0935de15', '989483372c164b87874b44819c3baa0a39d293d5', 'asdf', '啊啊啊', 'asdfasdf');
INSERT INTO `parkingplace` VALUES ('f84d7e67fafd439fb181ea77b1d8254558afb63c', '989483372c164b87874b44819c3baa0a39d293d5', 'Test', 'Test', 'Tdasdf');

-- ----------------------------
-- Table structure for `parkingrecord`
-- ----------------------------
DROP TABLE IF EXISTS `parkingrecord`;
CREATE TABLE `parkingrecord` (
  `id` varchar(128) NOT NULL,
  `plateNumber` varchar(64) DEFAULT NULL,
  `carId` varchar(128) DEFAULT NULL,
  `userId` varchar(128) DEFAULT NULL,
  `parkingPlaceId` varchar(128) DEFAULT NULL,
  `inOrOut` int(11) DEFAULT NULL,
  `fee` float DEFAULT NULL,
  `happenTime` timestamp NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parkingrecord
-- ----------------------------
INSERT INTO `parkingrecord` VALUES ('2cbda68eafda4e54974024b2e08f7e290935de15', 'aaa', null, '', 'aaa', '0', '1', '2015-01-01 14:55:00', null);
INSERT INTO `parkingrecord` VALUES ('4d1c99c4ddff49f583822e4aa848cc563a000345', '啊啊', null, '', 'asdf', '1', '111', '2015-01-13 00:25:00', null);
INSERT INTO `parkingrecord` VALUES ('93102dbc5bcc4bfb9088ece6b1a1c7ebaec85032', 'bb', 'bbb', 'c44134ab91574729b6762cbbe00686173d0f170a', '11', '1', '111', '2015-03-02 00:00:00', null);
INSERT INTO `parkingrecord` VALUES ('b67f72dbfef9454ab889f80ea202355a0bdf3bc0', '阿萨德飞', 'asdf', 'c44134ab91574729b6762cbbe00686173d0f170a', 'asdf', '1', '12', '2015-01-20 13:05:00', null);

-- ----------------------------
-- Table structure for `test`
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `clientIp` varchar(128) DEFAULT NULL,
  `insertTm` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('0:0:0:0:0:0:0:1', '2015-03-22 23:23:30');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` varchar(128) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `loginId` varchar(64) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('989483372c164b87874b44819c3baa0a39d293d5', '殷昌明', 'aaa', 'admin', '12312341234', 'asdfasdf');
INSERT INTO `users` VALUES ('c44134ab91574729b6762cbbe00686173d0f170a', '小明', 'asdf', 'asdf', 'asdf', 'asdfasdf');
