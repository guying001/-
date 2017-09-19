/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : aikeqin

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-09-15 17:08:08
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
INSERT INTO `ai_admin` VALUES ('2', 'admin', 'b63ddacba6c3835cc1b250c5d9de6ac1', '1', '2016-10-18 15:28:37', '2017-09-01 10:04:21', '127.0.0.1');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ai_admin_login
-- ----------------------------
INSERT INTO `ai_admin_login` VALUES ('1', '2', '21504144050', '2017-09-07 14:18:19', '1');
INSERT INTO `ai_admin_login` VALUES ('2', '2', '21504231461', '2017-09-01 14:47:01', '1');

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