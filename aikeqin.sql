/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : aikeqin

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-09-30 18:03:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ai_admin`
-- ----------------------------
DROP TABLE IF EXISTS `ai_admin`;
CREATE TABLE `ai_admin` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '管理员用户名',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '管理员密码',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1 启用 0 禁用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(20) DEFAULT NULL COMMENT '最后登录IP',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of ai_admin
-- ----------------------------
INSERT INTO `ai_admin` VALUES ('2', 'admin', '21232f297a57a5a743894a0e4a801fc3', '1', '2016-10-18 15:28:37', '2017-09-30 15:01:32', '127.0.0.1');
INSERT INTO `ai_admin` VALUES ('3', 'hao', 'b63ddacba6c3835cc1b250c5d9de6ac1', '1', '2017-08-31 09:15:20', '2017-08-31 09:15:24', null);

-- ----------------------------
-- Table structure for `ai_admin_login`
-- ----------------------------
DROP TABLE IF EXISTS `ai_admin_login`;
CREATE TABLE `ai_admin_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` smallint(5) NOT NULL,
  `key` varchar(20) NOT NULL COMMENT '登录密钥',
  `time` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1：正常；2：失效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ai_admin_login
-- ----------------------------
INSERT INTO `ai_admin_login` VALUES ('1', '2', '21504144050', '2017-09-07 14:18:19', '1');
INSERT INTO `ai_admin_login` VALUES ('2', '2', '21504231461', '2017-09-01 14:47:01', '1');
INSERT INTO `ai_admin_login` VALUES ('3', '2', '21505467477', '2017-09-15 17:24:37', '1');
INSERT INTO `ai_admin_login` VALUES ('4', '2', '21505714647', '2017-09-18 14:04:07', '1');
INSERT INTO `ai_admin_login` VALUES ('5', '2', '21505719010', '2017-09-18 16:18:16', '1');
INSERT INTO `ai_admin_login` VALUES ('6', '2', '21505785720', '2017-09-19 11:29:54', '1');
INSERT INTO `ai_admin_login` VALUES ('7', '2', '21505811028', '2017-09-19 16:51:41', '1');
INSERT INTO `ai_admin_login` VALUES ('8', '2', '21505873691', '2017-09-20 11:45:45', '1');
INSERT INTO `ai_admin_login` VALUES ('9', '2', '21505889364', '2017-09-20 14:36:28', '1');
INSERT INTO `ai_admin_login` VALUES ('10', '2', '21506417599', '2017-09-26 17:39:00', '1');
INSERT INTO `ai_admin_login` VALUES ('11', '2', '21506501622', '2017-09-27 17:26:44', '1');
INSERT INTO `ai_admin_login` VALUES ('12', '2', '21506563142', '2017-09-28 11:43:35', '1');
INSERT INTO `ai_admin_login` VALUES ('13', '2', '21506580614', '2017-09-28 15:14:51', '1');
INSERT INTO `ai_admin_login` VALUES ('14', '2', '21506651197', '2017-09-29 11:36:17', '1');
INSERT INTO `ai_admin_login` VALUES ('15', '2', '21506668596', '2017-09-29 16:55:55', '1');
INSERT INTO `ai_admin_login` VALUES ('16', '2', '21506737729', '2017-09-30 10:58:51', '1');
INSERT INTO `ai_admin_login` VALUES ('17', '2', '21506754892', '2017-09-30 15:46:51', '1');

-- ----------------------------
-- Table structure for `ai_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `ai_auth_group`;
CREATE TABLE `ai_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` varchar(255) NOT NULL COMMENT '权限规则ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='权限组表';

-- ----------------------------
-- Records of ai_auth_group
-- ----------------------------
INSERT INTO `ai_auth_group` VALUES ('1', '超级管理组', '1', '1,2,3,5,6,7,8,9,10,11,12,39,40,41,42,43,14,13,20,21,22,23,24,15,25,26,27,28,29,30,16,17,44,45,46,47,48,18,49,50,51,52,53,19,31,32,33,34,35,36,37,54,55,57,58,59,60,61,56,62,63,64,65,66,67');
INSERT INTO `ai_auth_group` VALUES ('5', '测试组', '1', '74,75,77,78,79,80,81,76,82,83,84,85,86,16,17,44,45,46,47,48,18,105,106,49,50,51,52,53,87,89,90,91,92,93,111,113,115,88,94,95,96,97,98,114,116,99,100,101,102,103,104');

-- ----------------------------
-- Table structure for `ai_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `ai_auth_group_access`;
CREATE TABLE `ai_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限组规则表';

-- ----------------------------
-- Records of ai_auth_group_access
-- ----------------------------
INSERT INTO `ai_auth_group_access` VALUES ('2', '1');
INSERT INTO `ai_auth_group_access` VALUES ('3', '5');

-- ----------------------------
-- Table structure for `ai_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `ai_auth_rule`;
CREATE TABLE `ai_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(20) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `pid` smallint(5) unsigned NOT NULL COMMENT '父级ID',
  `icon` varchar(50) DEFAULT '' COMMENT '图标',
  `sort` tinyint(4) unsigned NOT NULL COMMENT '排序',
  `condition` char(100) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COMMENT='规则表';

-- ----------------------------
-- Records of ai_auth_rule
-- ----------------------------
INSERT INTO `ai_auth_rule` VALUES ('1', 'admin/System/default', '系统配置', '1', '1', '0', 'fa fa-gears', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('2', 'admin/System/siteConfig', '站点配置', '1', '1', '1', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('3', 'admin/System/updateSiteConfig', '更新配置', '1', '0', '2', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('5', 'admin/Menu/default', '菜单管理', '1', '1', '0', 'fa fa-bars', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('6', 'admin/Menu/index', '后台菜单', '1', '1', '5', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('7', 'admin/Menu/add', '添加菜单', '1', '0', '6', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('8', 'admin/Menu/save', '保存菜单', '1', '0', '6', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('9', 'admin/Menu/edit', '编辑菜单', '1', '0', '6', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('10', 'admin/Menu/update', '更新菜单', '1', '0', '6', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('11', 'admin/Menu/delete', '删除菜单', '1', '0', '6', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('13', 'admin/Category/index', '栏目管理', '1', '1', '14', 'fa fa-sitemap', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('14', 'admin/Content/default', '内容管理', '1', '1', '0', 'fa fa-file-text', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('15', 'admin/Article/index', '文章管理', '1', '1', '14', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('16', 'admin/User/default', '用户管理', '1', '1', '0', 'fa fa-users', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('17', 'admin/User/index', '普通用户', '1', '1', '16', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('18', 'admin/AdminUser/index', '管理员', '1', '1', '16', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('19', 'admin/AuthGroup/index', '权限组', '1', '1', '16', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('20', 'admin/Category/add', '添加栏目', '1', '0', '13', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('21', 'admin/Category/save', '保存栏目', '1', '0', '13', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('22', 'admin/Category/edit', '编辑栏目', '1', '0', '13', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('23', 'admin/Category/update', '更新栏目', '1', '0', '13', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('24', 'admin/Category/delete', '删除栏目', '1', '0', '13', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('25', 'admin/Article/add', '添加文章', '1', '0', '15', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('26', 'admin/Article/save', '保存文章', '1', '0', '15', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('27', 'admin/Article/edit', '编辑文章', '1', '0', '15', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('28', 'admin/Article/update', '更新文章', '1', '0', '15', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('29', 'admin/Article/delete', '删除文章', '1', '0', '15', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('30', 'admin/Article/toggle', '文章审核', '1', '0', '15', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('31', 'admin/AuthGroup/add', '添加权限组', '1', '0', '19', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('32', 'admin/AuthGroup/save', '保存权限组', '1', '0', '19', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('33', 'admin/AuthGroup/edit', '编辑权限组', '1', '0', '19', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('34', 'admin/AuthGroup/update', '更新权限组', '1', '0', '19', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('35', 'admin/AuthGroup/delete', '删除权限组', '1', '0', '19', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('36', 'admin/AuthGroup/auth', '授权', '1', '0', '19', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('37', 'admin/AuthGroup/updateAuthGroupRule', '更新权限组规则', '1', '0', '19', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('44', 'admin/User/add', '添加用户', '1', '0', '17', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('45', 'admin/User/save', '保存用户', '1', '0', '17', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('46', 'admin/User/edit', '编辑用户', '1', '0', '17', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('47', 'admin/User/update', '更新用户', '1', '0', '17', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('48', 'admin/User/delete', '删除用户', '1', '0', '17', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('49', 'admin/AdminUser/add', '添加管理员', '1', '0', '18', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('50', 'admin/AdminUser/save', '保存管理员', '1', '0', '18', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('51', 'admin/AdminUser/edit', '编辑管理员', '1', '0', '18', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('52', 'admin/AdminUser/update', '更新管理员', '1', '0', '18', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('53', 'admin/AdminUser/delete', '删除管理员', '1', '0', '18', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('74', 'admin/Site/defult', '站点管理', '1', '1', '0', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('75', 'admin/Area/index', '地区管理', '1', '1', '74', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('76', 'admin/Place/index', '地点管理', '1', '1', '74', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('77', 'admin/Area/add', '新增地区', '1', '0', '75', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('78', 'admin/Area/save', '保存地区', '1', '0', '75', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('79', 'admin/Area/edit', '编辑地区', '1', '0', '75', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('80', 'admin/Area/update', '更新地区', '1', '0', '75', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('81', 'admin/Area/delete', '删除地区', '1', '0', '75', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('82', 'admin/Place/add', '新增地点', '1', '0', '76', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('83', 'admin/Place/save', '保存地点', '1', '0', '76', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('84', 'admin/Place/edit', '编辑地点', '1', '0', '76', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('85', 'admin/Place/update', '更新地点', '1', '0', '76', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('86', 'admin/Place/delete', '删除地点', '1', '0', '76', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('87', 'admin/Line/index', '线路管理', '1', '1', '0', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('88', 'admin/Order/index', '订单管理', '1', '1', '0', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('89', 'admin/Line/add', '新增线路', '1', '0', '87', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('90', 'admin/Line/save', '保存线路', '1', '0', '87', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('91', 'admin/Line/edit', '编辑线路', '1', '0', '87', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('92', 'admin/Line/update', '更新线路', '1', '0', '87', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('93', 'admin/Line/delete', '删除线路', '1', '0', '87', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('94', 'admin/Order/add', '新增订单', '1', '0', '88', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('95', 'admin/Order/save', '保存订单', '1', '0', '88', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('96', 'admin/Order/edit', '手动退票', '1', '0', '88', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('97', 'admin/Order/update', '更新订单', '1', '0', '88', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('98', 'admin/Order/delete', '删除订单', '1', '0', '88', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('99', 'admin/Advertising/index', '广告位', '1', '1', '0', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('100', 'admin/advertising/add', '新增广告', '1', '0', '99', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('101', 'admin/advertising/save', '保存广告', '1', '0', '99', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('102', 'admin/advertising/edit', '编辑广告', '1', '0', '99', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('103', 'admin/advertising/update', '更新广告', '1', '0', '99', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('104', 'admin/advertising/delete', '删除广告', '1', '0', '99', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('105', 'admin/AdminUser/updatepwd', '编辑密码', '1', '0', '18', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('106', 'admin/AdminUser/updateSave', '更新密码', '1', '0', '18', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('111', 'admin/place/place', '线路地点', '1', '0', '87', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('113', 'admin/Line/fuzhi', '复制路线', '1', '0', '87', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('114', 'admin/Order/getList', '手动订单', '1', '0', '88', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('115', 'admin/Line/zanting', '暂停线路', '1', '0', '87', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('116', 'admin/Order/excel', '导出订单', '1', '0', '88', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('117', 'admin/Setting/index', '线路设定', '1', '1', '0', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('118', 'admin/Setting/add', '添加设定', '1', '0', '117', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('119', 'admin/Setting/save', '保存设定', '1', '0', '117', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('120', 'admin/Setting/edit', '编辑设定', '1', '0', '117', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('121', 'admin/Setting/update', '更新设定', '1', '0', '117', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('122', 'admin/Setting/delete', '删除设定', '1', '0', '117', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('123', 'admin/Inspect/index', '工作人员', '1', '1', '16', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('124', 'admin/Inspect/edit', '编辑信息', '1', '0', '123', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('125', 'admin/Inspect/update', '更新信息', '1', '0', '123', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('126', 'admin/Inspect/delete', '删除信息', '1', '0', '123', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('127', 'admin/Evaluate/defaule', '评价模块', '1', '1', '0', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('128', 'admin/Type/index', '评价类型', '1', '1', '127', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('129', 'admin/Evaluate/index', '评价管理', '1', '1', '127', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('130', 'admin/Type/add', '新增类型', '1', '0', '128', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('131', 'admin/Type/save', '保存类型', '1', '0', '128', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('132', 'admin/Type/edit', '编辑类型', '1', '0', '128', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('133', 'admin/Type/update', '更新类型', '1', '0', '128', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('134', 'admin/Type/delete', '删除类型', '1', '0', '128', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('135', 'admin/Evaluate/add', '新增评价', '1', '0', '129', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('136', 'admin/Evaluate/save', '保存评价', '1', '0', '129', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('137', 'admin/Evaluate/edit', '编辑评价', '1', '0', '129', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('138', 'admin/Evaluate/update', '更新评价', '1', '0', '129', '', '0', '');
INSERT INTO `ai_auth_rule` VALUES ('139', 'admin/Evaluate/delete', '删除评价', '1', '0', '129', '', '0', '');

-- ----------------------------
-- Table structure for `ai_banner`
-- ----------------------------
DROP TABLE IF EXISTS `ai_banner`;
CREATE TABLE `ai_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL COMMENT '分类id',
  `banner_name` varchar(128) NOT NULL COMMENT '分类名称',
  `file` varchar(500) DEFAULT NULL COMMENT '图片地址',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `creat_time` datetime NOT NULL COMMENT '创建时间',
  `admin_id` int(11) DEFAULT '1' COMMENT '管理员id',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态  1->正常  2->禁止',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ai_banner
-- ----------------------------
INSERT INTO `ai_banner` VALUES ('1', '0', '广告图1', '/public/uploads/banner/20170930/8962691008_7f489395c9_m.jpg', '0', '2017-09-30 15:42:56', '2', '1');
INSERT INTO `ai_banner` VALUES ('2', '0', '广告图2', '/public/uploads/banner/20170930/8985207189_01ea27882d_m.jpg', '0', '2017-09-30 15:43:12', '2', '1');
INSERT INTO `ai_banner` VALUES ('3', '0', '广告图3', '/public/uploads/banner/20170930/9036958611_fa1bb7f827_m.jpg', '0', '2017-09-30 15:43:20', '2', '1');

-- ----------------------------
-- Table structure for `ai_category`
-- ----------------------------
DROP TABLE IF EXISTS `ai_category`;
CREATE TABLE `ai_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL COMMENT '分类id',
  `category_name` varchar(128) NOT NULL COMMENT '分类名称',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `creat_time` datetime NOT NULL COMMENT '创建时间',
  `admin_id` int(11) DEFAULT '1' COMMENT '管理员id',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态  1->正常  2->禁止',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ai_category
-- ----------------------------
INSERT INTO `ai_category` VALUES ('1', '0', '宝宝奶粉', '1', '2017-09-30 15:29:42', '2', '1');
INSERT INTO `ai_category` VALUES ('2', '0', '尿裤湿巾', '2', '2017-09-30 15:30:00', '2', '1');
INSERT INTO `ai_category` VALUES ('3', '0', '洗护用品', '3', '2017-09-30 15:30:29', '2', '1');
INSERT INTO `ai_category` VALUES ('4', '0', '哺育喂养', '4', '2017-09-30 15:30:56', '2', '1');
INSERT INTO `ai_category` VALUES ('5', '0', '婴幼家纺', '5', '2017-09-30 15:31:20', '2', '1');
INSERT INTO `ai_category` VALUES ('6', '0', '车床玩具', '6', '2017-09-30 15:31:35', '2', '1');

-- ----------------------------
-- Table structure for `ai_product`
-- ----------------------------
DROP TABLE IF EXISTS `ai_product`;
CREATE TABLE `ai_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_id` int(11) DEFAULT NULL COMMENT '分类id',
  `pro_name` varchar(128) NOT NULL COMMENT '分类名称',
  `stock` int(11) DEFAULT '1' COMMENT '库存',
  `market_price` float(8,2) DEFAULT '0.00' COMMENT '市场价格',
  `price` float(8,2) DEFAULT '0.00' COMMENT '本店价格',
  `spec_id` int(11) DEFAULT '0' COMMENT '规格id',
  `sales` int(11) DEFAULT '0' COMMENT '销量',
  `image` varchar(128) DEFAULT NULL COMMENT '商品图片',
  `content` text COMMENT '商品详情',
  `para` text COMMENT '商品参数',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `creat_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `admin_id` int(11) DEFAULT '1' COMMENT '管理员id',
  `hot` tinyint(1) DEFAULT '1' COMMENT '是否热门  1：否 2：是',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态  1->未上架  2->上架  3->推荐',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ai_product
-- ----------------------------
INSERT INTO `ai_product` VALUES ('4', '6', '商品发布', '100', '60.00', '49.99', '1', '0', 'img_url', '商品详情2', '商品参数2', '0', '2017-09-20 11:44:09', null, '2', '2', '1');
INSERT INTO `ai_product` VALUES ('3', '6', '商品发布3333', '100', '30.00', '29.99', '1', '0', 'img_url', '商品详情2', '商品参数2', '0', '2017-09-20 11:43:55', null, '2', '2', '1');
INSERT INTO `ai_product` VALUES ('5', '5', '商品发布', '100', '60.00', '49.99', '1', '0', 'img_url', '商品详情2', '商品参数2', '0', '2017-09-20 11:44:10', null, '2', '1', '1');
INSERT INTO `ai_product` VALUES ('6', '4', '商品发布', '100', '60.00', '49.99', '1', '0', 'img_url', '商品详情2', '商品参数2', '0', '2017-09-20 11:44:10', null, '2', '2', '1');
INSERT INTO `ai_product` VALUES ('7', '3', '商品发布', '100', '60.00', '49.99', '1', '0', 'img_url', '商品详情2', '商品参数2', '0', '2017-09-20 11:44:11', null, '2', '2', '1');
INSERT INTO `ai_product` VALUES ('8', '3', '商品发布', '100', '60.00', '49.99', '1', '0', 'img_url', '商品详情2', '商品参数2', '0', '2017-09-20 11:44:11', null, '2', '2', '1');
INSERT INTO `ai_product` VALUES ('9', '2', '商品发布', '100', '60.00', '49.99', '1', '0', 'img_url', '商品详情2', '商品参数2', '0', '2017-09-20 11:44:11', null, '2', '1', '1');

-- ----------------------------
-- Table structure for `ai_spec`
-- ----------------------------
DROP TABLE IF EXISTS `ai_spec`;
CREATE TABLE `ai_spec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spec_name` varchar(128) NOT NULL COMMENT '分类名称',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `creat_time` datetime NOT NULL COMMENT '创建时间',
  `admin_id` int(11) DEFAULT '1' COMMENT '管理员id',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态  1->正常  2->禁止',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ai_spec
-- ----------------------------
INSERT INTO `ai_spec` VALUES ('2', '规格1修改', '0', '2017-09-26 17:22:42', '2', '1');

-- ----------------------------
-- Table structure for `ai_user_address`
-- ----------------------------
DROP TABLE IF EXISTS `ai_user_address`;
CREATE TABLE `ai_user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `province` varchar(128) NOT NULL COMMENT '省份',
  `city` varchar(128) NOT NULL COMMENT '城市',
  `area` varchar(128) NOT NULL COMMENT '县/区',
  `address` varchar(500) DEFAULT NULL COMMENT '详细地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态/1：正常，2：删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ai_user_address
-- ----------------------------
INSERT INTO `ai_user_address` VALUES ('1', '1', '0', '100', '2', null, '2017-09-04 15:59:32', null, '1');
INSERT INTO `ai_user_address` VALUES ('2', '2', '101', '200', '2', null, '2017-09-04 16:00:06', null, '1');
INSERT INTO `ai_user_address` VALUES ('3', '3', '201', '300', '2', null, '2017-09-04 16:44:07', null, '1');
INSERT INTO `ai_user_address` VALUES ('4', '4', '301', '400', '2', null, '2017-09-04 16:44:19', null, '1');
INSERT INTO `ai_user_address` VALUES ('5', '5', '401', '500', '2', null, '2017-09-04 16:44:33', null, '1');
INSERT INTO `ai_user_address` VALUES ('6', '6', '501', '600', '2', null, '2017-09-04 16:44:56', null, '1');

-- ----------------------------
-- Table structure for `ai_user_info`
-- ----------------------------
DROP TABLE IF EXISTS `ai_user_info`;
CREATE TABLE `ai_user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL COMMENT '分类id',
  `password` varchar(500) DEFAULT NULL COMMENT '用户密码',
  `openid` varchar(200) NOT NULL DEFAULT '' COMMENT '用户openid',
  `headimgurl` varchar(500) DEFAULT '' COMMENT '用户头像地址',
  `name` varchar(128) DEFAULT '' COMMENT '用户名称',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `sex` tinyint(1) DEFAULT '0' COMMENT '性别 0：未知   1：男 2：女',
  `city` varchar(50) DEFAULT '' COMMENT '城市',
  `phone` int(11) DEFAULT NULL COMMENT '手机号',
  `content` text COMMENT '备注 签名',
  `point` int(11) DEFAULT '0' COMMENT '用户积分',
  `active` tinyint(1) DEFAULT '1' COMMENT '是否停用 1:启用 2:停用',
  `ip` varchar(20) DEFAULT '' COMMENT 'ip地址',
  `level_id` int(5) DEFAULT '1' COMMENT '等级id',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `creat_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `admin_id` int(11) DEFAULT '1' COMMENT '管理员id',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态  1->正常 2->删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ai_user_info
-- ----------------------------
INSERT INTO `ai_user_info` VALUES ('5', null, 'e10adc3949ba59abbe56e057f20f883e', '', '', 'testas', '2486079595@qq.com', '0', '', null, null, '0', '2', '127.0.0.1', '1', '0', '2017-09-28 11:02:09', null, '2', '1');
INSERT INTO `ai_user_info` VALUES ('6', null, 'e10adc3949ba59abbe56e057f20f883e', '', '', 'testaa', '2486095@qq.com', '0', '', null, null, '0', '1', '127.0.0.1', '1', '0', '2017-09-28 11:02:15', null, '2', '1');
INSERT INTO `ai_user_info` VALUES ('3', null, 'e10adc3949ba59abbe56e057f20f883e', '', '', 'testab', '2486079825@qq.com', '0', '', null, null, '0', '1', '', '1', '0', '2017-09-27 17:25:55', null, '2', '1');
INSERT INTO `ai_user_info` VALUES ('4', null, 'e10adc3949ba59abbe56e057f20f883e', '', '', 'testac', '2486079895@qq.com', '0', '', null, null, '0', '1', '', '1', '0', '2017-09-27 17:26:43', null, '2', '1');
INSERT INTO `ai_user_info` VALUES ('7', null, '9cf6f9edb58e7f3dadc1f65fdbe58b7a', '', '', 'testad', '24860895@qq.com', '0', '', null, null, '0', '1', '127.0.0.1', '1', '0', '2017-09-28 11:02:20', null, '2', '1');
INSERT INTO `ai_user_info` VALUES ('8', null, 'e10adc3949ba59abbe56e057f20f883e', '', '', 'testae', '24869995@qq.com', '0', '', null, null, '0', '1', '127.0.0.1', '1', '0', '2017-09-28 11:02:23', null, '2', '1');
INSERT INTO `ai_user_info` VALUES ('9', null, 'e10adc3949ba59abbe56e057f20f883e', '', '', 'testaf', '248691295@qq.com', '0', '', null, null, '0', '1', '127.0.0.1', '1', '0', '2017-09-28 11:02:26', null, '2', '1');
INSERT INTO `ai_user_info` VALUES ('10', null, 'e10adc3949ba59abbe56e057f20f883e', '', '', 'testag', '24869195@qq.com', '0', '', null, null, '0', '1', '127.0.0.1', '1', '0', '2017-09-28 11:02:28', null, '2', '1');

-- ----------------------------
-- Table structure for `ai_user_level`
-- ----------------------------
DROP TABLE IF EXISTS `ai_user_level`;
CREATE TABLE `ai_user_level` (
  `id` mediumint(5) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(20) NOT NULL COMMENT '等级名称',
  `range_min` int(11) NOT NULL COMMENT '最小范围',
  `range_max` int(11) NOT NULL COMMENT '最大范围',
  `creator_id` mediumint(5) NOT NULL COMMENT '创建管理员id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `change_id` mediumint(5) NOT NULL COMMENT '更改管理员id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `sort` int(11) DEFAULT '1' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态/1：正常，2：删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ai_user_level
-- ----------------------------
INSERT INTO `ai_user_level` VALUES ('1', '青铜', '10', '100', '2', '2017-09-30 10:30:19', '0', null, '1', '1');
INSERT INTO `ai_user_level` VALUES ('2', '白银', '100', '1000', '2', '2017-09-30 10:30:39', '0', null, '1', '1');
INSERT INTO `ai_user_level` VALUES ('3', '黄金', '1000', '10000', '2', '2017-09-30 10:30:52', '0', null, '1', '1');
INSERT INTO `ai_user_level` VALUES ('4', '钻石', '100000', '1000000', '2', '2017-09-30 10:31:04', '2', null, '1', '1');
INSERT INTO `ai_user_level` VALUES ('5', '铂金', '10000', '100000', '2', '2017-09-30 10:31:23', '0', null, '1', '1');
INSERT INTO `ai_user_level` VALUES ('6', '星耀', '1000000', '100000000', '2', '2017-09-30 10:31:43', '0', null, '1', '1');
INSERT INTO `ai_user_level` VALUES ('7', '最强王者', '10000000', '1000000000', '2', '2017-09-30 10:32:03', '0', null, '1', '1');
