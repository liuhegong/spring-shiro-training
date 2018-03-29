/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : shiro

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-03-29 16:51:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `principal` varchar(255) DEFAULT NULL COMMENT '负责人',
  `telephone` varchar(20) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL COMMENT '手机',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `status` int(11) DEFAULT NULL COMMENT '状态：0 正常  1停用',
  `description` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('1', '测试公司', '胡二', '3657812', '', '阳江', '0', 'test');
INSERT INTO `company` VALUES ('2', '建泓五金制品厂', '梁业达', '0662-2663196', '13664998169', '阳江市江城区新江北路1273号', '0', '');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `linkman` varchar(255) DEFAULT NULL COMMENT '联系人',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `telephone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `mobile` varchar(11) DEFAULT NULL COMMENT '手机',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', 'a', 'b', 'd', 'cc', null, 'a', null);
INSERT INTO `customer` VALUES ('2', 'b', 'b', 'b', 'b', null, 'b', null);

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单ID',
  `item_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `item_no` varchar(50) DEFAULT NULL COMMENT '货号',
  `item_unit` varchar(3) DEFAULT NULL COMMENT '单位',
  `num` int(11) DEFAULT NULL COMMENT '商品购买数量',
  `title` varchar(255) DEFAULT NULL COMMENT '商品标题',
  `price` decimal(10,2) DEFAULT NULL COMMENT '商品单价',
  `total_fee` decimal(10,2) DEFAULT NULL COMMENT '商品总金额',
  `pic_path` varchar(255) DEFAULT NULL COMMENT '商品图片地址',
  `description` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item` VALUES ('1', '4', null, '001', 'zhi', '1', '磨刀石', '222.00', '222.00', null, '');
INSERT INTO `order_item` VALUES ('2', '5', null, 'a', 'zhi', '1', 'b', '2.00', '2.00', null, '');

-- ----------------------------
-- Table structure for organization
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(64) NOT NULL COMMENT '组织名',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `code` varchar(64) NOT NULL COMMENT '编号',
  `icon` varchar(32) DEFAULT NULL COMMENT '图标',
  `pid` bigint(19) DEFAULT NULL COMMENT '父级主键',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='组织机构';

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO `organization` VALUES ('1', '总经办', '王家桥', '01', 'fi-social-windows', null, '0', '2014-02-19 01:00:00');
INSERT INTO `organization` VALUES ('3', '技术部', '', '02', 'fi-social-github', null, '1', '2015-10-01 13:10:42');
INSERT INTO `organization` VALUES ('5', '产品部', '', '03', 'fi-social-apple', null, '2', '2015-12-06 12:15:30');
INSERT INTO `organization` VALUES ('6', '测试组', '', '04', 'fi-social-snapchat', '3', '0', '2015-12-06 13:12:18');
INSERT INTO `organization` VALUES ('7', '测试公司', '', 'testcompany', 'fi-folder', null, '0', '2018-01-04 17:06:25');

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) NOT NULL COMMENT '资源名称',
  `url` varchar(100) DEFAULT NULL COMMENT '资源路径',
  `open_mode` varchar(32) DEFAULT NULL COMMENT '打开方式 ajax,iframe',
  `description` varchar(255) DEFAULT NULL COMMENT '资源介绍',
  `icon` varchar(32) DEFAULT NULL COMMENT '资源图标',
  `pid` bigint(19) DEFAULT NULL COMMENT '父级资源id',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `opened` tinyint(2) NOT NULL DEFAULT '1' COMMENT '打开状态',
  `resource_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '资源类别',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8 COMMENT='资源';

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('1', '权限管理', '', null, '系统管理', 'fi-folder', null, '0', '0', '1', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('11', '资源管理', '/resource/manager', 'ajax', '资源管理', 'fi-database', '1', '1', '0', '1', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('12', '角色管理', '/role/manager', 'ajax', '角色管理', 'fi-torso-business', '1', '2', '0', '1', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('13', '用户管理', '/user/manager', 'ajax', '用户管理', 'fi-torsos-all', '1', '3', '0', '1', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('14', '部门管理', '/organization/manager', 'ajax', '部门管理', 'fi-results-demographics', '1', '4', '0', '1', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('111', '列表', '/resource/treeGrid', 'ajax', '资源列表', 'fi-list', '11', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('112', '添加', '/resource/add', 'ajax', '资源添加', 'fi-page-add', '11', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('113', '编辑', '/resource/edit', 'ajax', '资源编辑', 'fi-page-edit', '11', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('114', '删除', '/resource/delete', 'ajax', '资源删除', 'fi-page-delete', '11', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('121', '列表', '/role/dataGrid', 'ajax', '角色列表', 'fi-list', '12', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('122', '添加', '/role/add', 'ajax', '角色添加', 'fi-page-add', '12', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('123', '编辑', '/role/edit', 'ajax', '角色编辑', 'fi-page-edit', '12', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('124', '删除', '/role/delete', 'ajax', '角色删除', 'fi-page-delete', '12', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('125', '授权', '/role/grant', 'ajax', '角色授权', 'fi-check', '12', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('131', '列表', '/user/dataGrid', 'ajax', '用户列表', 'fi-list', '13', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('132', '添加', '/user/add', 'ajax', '用户添加', 'fi-page-add', '13', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('133', '编辑', '/user/edit', 'ajax', '用户编辑', 'fi-page-edit', '13', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('134', '删除', '/user/delete', 'ajax', '用户删除', 'fi-page-delete', '13', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('141', '列表', '/organization/treeGrid', 'ajax', '用户列表', 'fi-list', '14', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('142', '添加', '/organization/add', 'ajax', '部门添加', 'fi-page-add', '14', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('143', '编辑', '/organization/edit', 'ajax', '部门编辑', 'fi-page-edit', '14', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('144', '删除', '/organization/delete', 'ajax', '部门删除', 'fi-page-delete', '14', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('221', '日志监控', '', null, null, 'fi-folder', null, '3', '0', '0', '0', '2015-12-01 11:44:20');
INSERT INTO `resource` VALUES ('222', '视频教程', '', null, null, 'fi-folder', null, '2', '0', '0', '0', '2015-12-06 12:40:42');
INSERT INTO `resource` VALUES ('223', '官方网站', 'https://www.dreamlu.net', 'iframe', null, 'fi-home', '222', '0', '0', '1', '0', '2015-12-06 12:42:42');
INSERT INTO `resource` VALUES ('224', 'jfinal视频', 'http://blog.dreamlu.net/blog/79', 'iframe', null, 'fi-video', '222', '1', '0', '1', '0', '2015-12-06 12:45:28');
INSERT INTO `resource` VALUES ('226', '修改密码', '/user/editPwdPage', 'ajax', null, 'fi-unlock', null, '4', '0', '1', '1', '2015-12-07 20:23:06');
INSERT INTO `resource` VALUES ('227', '登录日志', '/sysLog/manager', 'ajax', null, 'fi-info', '221', '0', '0', '1', '0', '2016-09-30 22:10:53');
INSERT INTO `resource` VALUES ('228', 'Druid监控', '/druid', 'iframe', null, 'fi-monitor', '221', '0', '0', '1', '0', '2016-09-30 22:12:50');
INSERT INTO `resource` VALUES ('229', '系统图标', '/icons.html', 'ajax', null, 'fi-photo', '221', '0', '0', '1', '0', '2016-12-24 15:53:47');
INSERT INTO `resource` VALUES ('230', '文章管理', '', 'ajax', null, 'fi-page-multiple', null, '1', '0', '0', '0', '2016-12-24 15:53:47');
INSERT INTO `resource` VALUES ('231', '新建文章', '/article/create', 'ajax', null, 'fi-page-edit', '230', '0', '0', '1', '0', '2016-12-24 15:53:47');
INSERT INTO `resource` VALUES ('232', '业务管理', '', null, null, '', null, '0', '0', '1', '0', '2018-01-04 11:53:22');
INSERT INTO `resource` VALUES ('233', '公司信息管理', '/company/manager', 'ajax', null, '', '232', '0', '0', '1', '0', '2018-01-04 15:12:19');
INSERT INTO `resource` VALUES ('234', '列表', '/company/dataGrid', 'ajax', null, 'fi-list', '233', '0', '0', '1', '1', '2018-01-04 15:13:45');
INSERT INTO `resource` VALUES ('235', '添加', '/company/add', 'ajax', null, 'fi-page-add', '233', '1', '0', '1', '1', '2018-01-04 15:14:39');
INSERT INTO `resource` VALUES ('236', '编辑', '/company/edit', 'ajax', null, 'fi-page-edit', '233', '2', '0', '1', '1', '2018-01-04 15:15:27');
INSERT INTO `resource` VALUES ('237', '删除', '/company/delete', 'ajax', null, 'fi-page-delete', '233', '3', '0', '1', '1', '2018-01-04 15:16:04');
INSERT INTO `resource` VALUES ('238', '送货单管理', '/order/manager', '', null, '', '232', '3', '0', '1', '0', '2018-01-04 17:23:43');
INSERT INTO `resource` VALUES ('239', '列表', '/order/dataGrid', 'ajax', null, ' fi-list', '238', '0', '0', '1', '1', '2018-01-04 17:32:20');
INSERT INTO `resource` VALUES ('240', '添加', '/order/add', 'ajax', null, 'fi-page-add', '238', '1', '0', '1', '1', '2018-01-04 17:32:56');
INSERT INTO `resource` VALUES ('241', '编辑', '/order/edit', 'ajax', null, 'fi-page-edit', '238', '2', '0', '1', '1', '2018-01-04 17:33:43');
INSERT INTO `resource` VALUES ('242', '删除', '/order/delete', 'ajax', null, 'fi-page-delete', '238', '0', '0', '1', '1', '2018-01-04 17:34:17');
INSERT INTO `resource` VALUES ('243', '客户信息管理', '/customer/manager', '', null, '', '232', '1', '0', '1', '0', '2018-01-29 16:54:41');
INSERT INTO `resource` VALUES ('244', '列表', '/customer/dataGrid', 'ajax', null, 'fi-list', '243', '0', '0', '1', '1', '2018-01-29 16:55:50');
INSERT INTO `resource` VALUES ('245', '添加', '/customer/add', 'ajax', null, 'fi-page-add', '243', '1', '0', '1', '1', '2018-01-29 16:56:50');
INSERT INTO `resource` VALUES ('246', '编辑', '/customer/edit', 'ajax', null, 'fi-page-edit', '243', '2', '0', '1', '1', '2018-01-29 16:57:28');
INSERT INTO `resource` VALUES ('247', '删除', '/customer/delete', 'ajax', null, 'fi-page-delete', '243', '3', '0', '1', '1', '2018-01-29 16:57:59');
INSERT INTO `resource` VALUES ('248', '单位管理', '/unit/manager', '', null, '', '232', '2', '0', '1', '0', '2018-02-02 17:37:17');
INSERT INTO `resource` VALUES ('249', '列表', '/unit/dataGrid', 'ajax', null, 'fi-list', '248', '0', '0', '1', '1', '2018-02-02 17:38:18');
INSERT INTO `resource` VALUES ('250', '添加', '/unit/add', 'ajax', null, 'fi-page-add', '248', '1', '0', '1', '1', '2018-02-02 17:39:01');
INSERT INTO `resource` VALUES ('251', '编辑', '/unit/edit', 'ajax', null, 'fi-page-edit', '248', '2', '0', '1', '1', '2018-02-02 17:39:46');
INSERT INTO `resource` VALUES ('252', '删除', '/unit/delete', 'ajax', null, 'fi-page-delete', '248', '3', '0', '1', '1', '2018-02-02 17:40:19');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(64) NOT NULL COMMENT '角色名',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序号',
  `description` varchar(255) DEFAULT NULL COMMENT '简介',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin', '0', '超级管理员', '0');
INSERT INTO `role` VALUES ('2', 'de', '0', '技术部经理', '0');
INSERT INTO `role` VALUES ('7', 'pm', '0', '产品部经理', '0');
INSERT INTO `role` VALUES ('8', 'test', '0', '测试账户', '0');
INSERT INTO `role` VALUES ('9', '公司运营', '0', '', '0');

-- ----------------------------
-- Table structure for role_resource
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` bigint(19) NOT NULL COMMENT '角色id',
  `resource_id` bigint(19) NOT NULL COMMENT '资源id',
  PRIMARY KEY (`id`),
  KEY `idx_role_resource_ids` (`role_id`,`resource_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=712 DEFAULT CHARSET=utf8 COMMENT='角色资源';

-- ----------------------------
-- Records of role_resource
-- ----------------------------
INSERT INTO `role_resource` VALUES ('660', '1', '1');
INSERT INTO `role_resource` VALUES ('661', '1', '11');
INSERT INTO `role_resource` VALUES ('666', '1', '12');
INSERT INTO `role_resource` VALUES ('672', '1', '13');
INSERT INTO `role_resource` VALUES ('677', '1', '14');
INSERT INTO `role_resource` VALUES ('662', '1', '111');
INSERT INTO `role_resource` VALUES ('663', '1', '112');
INSERT INTO `role_resource` VALUES ('664', '1', '113');
INSERT INTO `role_resource` VALUES ('665', '1', '114');
INSERT INTO `role_resource` VALUES ('667', '1', '121');
INSERT INTO `role_resource` VALUES ('668', '1', '122');
INSERT INTO `role_resource` VALUES ('669', '1', '123');
INSERT INTO `role_resource` VALUES ('670', '1', '124');
INSERT INTO `role_resource` VALUES ('671', '1', '125');
INSERT INTO `role_resource` VALUES ('673', '1', '131');
INSERT INTO `role_resource` VALUES ('674', '1', '132');
INSERT INTO `role_resource` VALUES ('675', '1', '133');
INSERT INTO `role_resource` VALUES ('676', '1', '134');
INSERT INTO `role_resource` VALUES ('678', '1', '141');
INSERT INTO `role_resource` VALUES ('679', '1', '142');
INSERT INTO `role_resource` VALUES ('680', '1', '143');
INSERT INTO `role_resource` VALUES ('681', '1', '144');
INSERT INTO `role_resource` VALUES ('708', '1', '221');
INSERT INTO `role_resource` VALUES ('705', '1', '222');
INSERT INTO `role_resource` VALUES ('706', '1', '223');
INSERT INTO `role_resource` VALUES ('707', '1', '224');
INSERT INTO `role_resource` VALUES ('711', '1', '226');
INSERT INTO `role_resource` VALUES ('709', '1', '227');
INSERT INTO `role_resource` VALUES ('710', '1', '228');
INSERT INTO `role_resource` VALUES ('703', '1', '230');
INSERT INTO `role_resource` VALUES ('704', '1', '231');
INSERT INTO `role_resource` VALUES ('682', '1', '232');
INSERT INTO `role_resource` VALUES ('683', '1', '233');
INSERT INTO `role_resource` VALUES ('684', '1', '234');
INSERT INTO `role_resource` VALUES ('685', '1', '235');
INSERT INTO `role_resource` VALUES ('686', '1', '236');
INSERT INTO `role_resource` VALUES ('687', '1', '237');
INSERT INTO `role_resource` VALUES ('693', '1', '238');
INSERT INTO `role_resource` VALUES ('694', '1', '239');
INSERT INTO `role_resource` VALUES ('696', '1', '240');
INSERT INTO `role_resource` VALUES ('697', '1', '241');
INSERT INTO `role_resource` VALUES ('695', '1', '242');
INSERT INTO `role_resource` VALUES ('688', '1', '243');
INSERT INTO `role_resource` VALUES ('689', '1', '244');
INSERT INTO `role_resource` VALUES ('690', '1', '245');
INSERT INTO `role_resource` VALUES ('691', '1', '246');
INSERT INTO `role_resource` VALUES ('692', '1', '247');
INSERT INTO `role_resource` VALUES ('698', '1', '248');
INSERT INTO `role_resource` VALUES ('699', '1', '249');
INSERT INTO `role_resource` VALUES ('700', '1', '250');
INSERT INTO `role_resource` VALUES ('701', '1', '251');
INSERT INTO `role_resource` VALUES ('702', '1', '252');
INSERT INTO `role_resource` VALUES ('437', '2', '1');
INSERT INTO `role_resource` VALUES ('438', '2', '13');
INSERT INTO `role_resource` VALUES ('439', '2', '131');
INSERT INTO `role_resource` VALUES ('440', '2', '132');
INSERT INTO `role_resource` VALUES ('441', '2', '133');
INSERT INTO `role_resource` VALUES ('445', '2', '221');
INSERT INTO `role_resource` VALUES ('442', '2', '222');
INSERT INTO `role_resource` VALUES ('443', '2', '223');
INSERT INTO `role_resource` VALUES ('444', '2', '224');
INSERT INTO `role_resource` VALUES ('446', '2', '227');
INSERT INTO `role_resource` VALUES ('447', '2', '228');
INSERT INTO `role_resource` VALUES ('158', '3', '1');
INSERT INTO `role_resource` VALUES ('159', '3', '11');
INSERT INTO `role_resource` VALUES ('164', '3', '12');
INSERT INTO `role_resource` VALUES ('170', '3', '13');
INSERT INTO `role_resource` VALUES ('175', '3', '14');
INSERT INTO `role_resource` VALUES ('160', '3', '111');
INSERT INTO `role_resource` VALUES ('161', '3', '112');
INSERT INTO `role_resource` VALUES ('162', '3', '113');
INSERT INTO `role_resource` VALUES ('163', '3', '114');
INSERT INTO `role_resource` VALUES ('165', '3', '121');
INSERT INTO `role_resource` VALUES ('166', '3', '122');
INSERT INTO `role_resource` VALUES ('167', '3', '123');
INSERT INTO `role_resource` VALUES ('168', '3', '124');
INSERT INTO `role_resource` VALUES ('169', '3', '125');
INSERT INTO `role_resource` VALUES ('171', '3', '131');
INSERT INTO `role_resource` VALUES ('172', '3', '132');
INSERT INTO `role_resource` VALUES ('173', '3', '133');
INSERT INTO `role_resource` VALUES ('174', '3', '134');
INSERT INTO `role_resource` VALUES ('176', '3', '141');
INSERT INTO `role_resource` VALUES ('177', '3', '142');
INSERT INTO `role_resource` VALUES ('178', '3', '143');
INSERT INTO `role_resource` VALUES ('179', '3', '144');
INSERT INTO `role_resource` VALUES ('359', '7', '1');
INSERT INTO `role_resource` VALUES ('360', '7', '14');
INSERT INTO `role_resource` VALUES ('361', '7', '141');
INSERT INTO `role_resource` VALUES ('362', '7', '142');
INSERT INTO `role_resource` VALUES ('363', '7', '143');
INSERT INTO `role_resource` VALUES ('367', '7', '221');
INSERT INTO `role_resource` VALUES ('364', '7', '222');
INSERT INTO `role_resource` VALUES ('365', '7', '223');
INSERT INTO `role_resource` VALUES ('366', '7', '224');
INSERT INTO `role_resource` VALUES ('368', '7', '226');
INSERT INTO `role_resource` VALUES ('448', '8', '1');
INSERT INTO `role_resource` VALUES ('449', '8', '11');
INSERT INTO `role_resource` VALUES ('451', '8', '12');
INSERT INTO `role_resource` VALUES ('453', '8', '13');
INSERT INTO `role_resource` VALUES ('455', '8', '14');
INSERT INTO `role_resource` VALUES ('450', '8', '111');
INSERT INTO `role_resource` VALUES ('452', '8', '121');
INSERT INTO `role_resource` VALUES ('454', '8', '131');
INSERT INTO `role_resource` VALUES ('456', '8', '141');
INSERT INTO `role_resource` VALUES ('460', '8', '221');
INSERT INTO `role_resource` VALUES ('457', '8', '222');
INSERT INTO `role_resource` VALUES ('458', '8', '223');
INSERT INTO `role_resource` VALUES ('459', '8', '224');
INSERT INTO `role_resource` VALUES ('461', '8', '227');
INSERT INTO `role_resource` VALUES ('462', '8', '228');
INSERT INTO `role_resource` VALUES ('478', '8', '229');
INSERT INTO `role_resource` VALUES ('479', '8', '230');
INSERT INTO `role_resource` VALUES ('480', '8', '231');
INSERT INTO `role_resource` VALUES ('562', '9', '232');
INSERT INTO `role_resource` VALUES ('563', '9', '233');
INSERT INTO `role_resource` VALUES ('564', '9', '234');
INSERT INTO `role_resource` VALUES ('565', '9', '236');
INSERT INTO `role_resource` VALUES ('566', '9', '238');
INSERT INTO `role_resource` VALUES ('567', '9', '239');
INSERT INTO `role_resource` VALUES ('569', '9', '240');
INSERT INTO `role_resource` VALUES ('570', '9', '241');
INSERT INTO `role_resource` VALUES ('568', '9', '242');

-- ----------------------------
-- Table structure for serial_no
-- ----------------------------
DROP TABLE IF EXISTS `serial_no`;
CREATE TABLE `serial_no` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `no` bigint(20) NOT NULL COMMENT '流水号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of serial_no
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `login_name` varchar(255) DEFAULT NULL COMMENT '登陆名',
  `role_name` varchar(255) DEFAULT NULL COMMENT '角色名',
  `opt_content` varchar(1024) DEFAULT NULL COMMENT '内容',
  `client_ip` varchar(255) DEFAULT NULL COMMENT '客户端ip',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=768 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('391', 'test', 'test', '[类名]:com.wangzhixuan.controller.CommonsController,[方法]:ueditor,[参数]:action=config&noCache=1514972088303&', '0:0:0:0:0:0:0:1', '2018-01-03 17:34:48');
INSERT INTO `sys_log` VALUES ('392', 'test', 'test', '[类名]:com.wangzhixuan.controller.CommonsController,[方法]:ueditor,[参数]:action=config&noCache=1514972186551&', '0:0:0:0:0:0:0:1', '2018-01-03 17:36:27');
INSERT INTO `sys_log` VALUES ('393', 'test', 'test', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-03 17:40:54');
INSERT INTO `sys_log` VALUES ('394', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:addPage,[参数]:', null, '2018-01-03 17:41:27');
INSERT INTO `sys_log` VALUES ('395', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1514972469579&', '0:0:0:0:0:0:0:1', '2018-01-03 17:41:37');
INSERT INTO `sys_log` VALUES ('396', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CommonsController,[方法]:ueditor,[参数]:action=config&noCache=1514972509884&', '0:0:0:0:0:0:0:1', '2018-01-03 17:41:50');
INSERT INTO `sys_log` VALUES ('397', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1514972469584&', '0:0:0:0:0:0:0:1', '2018-01-03 17:41:56');
INSERT INTO `sys_log` VALUES ('398', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,230,231,222,223,224,221,227,228,226&', '0:0:0:0:0:0:0:1', '2018-01-03 17:42:11');
INSERT INTO `sys_log` VALUES ('399', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=2&_=1514972469585&', '0:0:0:0:0:0:0:1', '2018-01-03 17:42:15');
INSERT INTO `sys_log` VALUES ('400', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=7&_=1514972469586&', '0:0:0:0:0:0:0:1', '2018-01-03 17:42:22');
INSERT INTO `sys_log` VALUES ('401', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=8&_=1514972469587&', '0:0:0:0:0:0:0:1', '2018-01-03 17:42:24');
INSERT INTO `sys_log` VALUES ('402', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2018-01-03 17:43:26');
INSERT INTO `sys_log` VALUES ('403', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=1&_=1514972469589&', '0:0:0:0:0:0:0:1', '2018-01-03 17:43:57');
INSERT INTO `sys_log` VALUES ('404', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=11&_=1514972469590&', '0:0:0:0:0:0:0:1', '2018-01-03 17:44:18');
INSERT INTO `sys_log` VALUES ('405', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=11&_=1514972469591&', '0:0:0:0:0:0:0:1', '2018-01-03 17:44:34');
INSERT INTO `sys_log` VALUES ('406', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:editPwdPage,[参数]:', null, '2018-01-03 17:46:04');
INSERT INTO `sys_log` VALUES ('407', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2018-01-03 17:46:15');
INSERT INTO `sys_log` VALUES ('408', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2018-01-04 10:53:11');
INSERT INTO `sys_log` VALUES ('409', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-04 11:52:19');
INSERT INTO `sys_log` VALUES ('410', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2018-01-04 11:52:59');
INSERT INTO `sys_log` VALUES ('411', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=业务管理&resourceType=0&url=&openMode=ajax&icon=&seq=0&status=0&opened=1&pid=&', '0:0:0:0:0:0:0:1', '2018-01-04 11:53:22');
INSERT INTO `sys_log` VALUES ('412', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2018-01-04 15:11:33');
INSERT INTO `sys_log` VALUES ('413', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=公司信息管理&resourceType=0&url=/company/manager&openMode=ajax&icon=&seq=0&status=0&opened=0&pid=232&', '0:0:0:0:0:0:0:1', '2018-01-04 15:12:19');
INSERT INTO `sys_log` VALUES ('414', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2018-01-04 15:12:51');
INSERT INTO `sys_log` VALUES ('415', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=列表&resourceType=1&url=/company/dataGrid&openMode=ajax&icon=fi-list&seq=0&status=0&opened=0&pid=233&', '0:0:0:0:0:0:0:1', '2018-01-04 15:13:45');
INSERT INTO `sys_log` VALUES ('416', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2018-01-04 15:13:50');
INSERT INTO `sys_log` VALUES ('417', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=添加&resourceType=1&url=/company/add&openMode=ajax&icon=fi-page-add&seq=1&status=0&opened=0&pid=233&', '0:0:0:0:0:0:0:1', '2018-01-04 15:14:39');
INSERT INTO `sys_log` VALUES ('418', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2018-01-04 15:14:55');
INSERT INTO `sys_log` VALUES ('419', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=编辑&resourceType=1&url=/company/edit&openMode=ajax&icon=fi-page-edit&seq=2&status=0&opened=0&pid=233&', '0:0:0:0:0:0:0:1', '2018-01-04 15:15:27');
INSERT INTO `sys_log` VALUES ('420', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2018-01-04 15:15:42');
INSERT INTO `sys_log` VALUES ('421', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=删除&resourceType=1&url=/company/delete&openMode=ajax&icon=fi-page-delete&seq=3&status=0&opened=0&pid=233&', '0:0:0:0:0:0:0:1', '2018-01-04 15:16:04');
INSERT INTO `sys_log` VALUES ('422', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1515037948593&', '0:0:0:0:0:0:0:1', '2018-01-04 15:16:11');
INSERT INTO `sys_log` VALUES ('423', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,232,233,234,230,231,222,223,224,221,227,228,226,235,236,237,230,231,222,223,224,221,227,228,226&', '0:0:0:0:0:0:0:1', '2018-01-04 15:17:18');
INSERT INTO `sys_log` VALUES ('424', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=233&_=1515037948594&', '0:0:0:0:0:0:0:1', '2018-01-04 15:17:44');
INSERT INTO `sys_log` VALUES ('425', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=232&_=1515037948595&', '0:0:0:0:0:0:0:1', '2018-01-04 15:18:05');
INSERT INTO `sys_log` VALUES ('426', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=233&_=1515037948596&', '0:0:0:0:0:0:0:1', '2018-01-04 15:18:30');
INSERT INTO `sys_log` VALUES ('427', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=233&name=公司信息管理&resourceType=0&url=/company/manager&openMode=ajax&icon=&seq=0&status=0&opened=1&pid=232&', '0:0:0:0:0:0:0:1', '2018-01-04 15:18:40');
INSERT INTO `sys_log` VALUES ('428', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=234&_=1515037948597&', '0:0:0:0:0:0:0:1', '2018-01-04 15:18:43');
INSERT INTO `sys_log` VALUES ('429', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=234&name=列表&resourceType=1&url=/company/dataGrid&openMode=ajax&icon=fi-list&seq=0&status=0&opened=1&pid=233&', '0:0:0:0:0:0:0:1', '2018-01-04 15:18:46');
INSERT INTO `sys_log` VALUES ('430', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=235&_=1515037948598&', '0:0:0:0:0:0:0:1', '2018-01-04 15:18:48');
INSERT INTO `sys_log` VALUES ('431', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=235&name=添加&resourceType=1&url=/company/add&openMode=ajax&icon=fi-page-add&seq=1&status=0&opened=1&pid=233&', '0:0:0:0:0:0:0:1', '2018-01-04 15:18:51');
INSERT INTO `sys_log` VALUES ('432', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=236&_=1515037948599&', '0:0:0:0:0:0:0:1', '2018-01-04 15:18:54');
INSERT INTO `sys_log` VALUES ('433', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=236&name=编辑&resourceType=1&url=/company/edit&openMode=ajax&icon=fi-page-edit&seq=2&status=0&opened=1&pid=233&', '0:0:0:0:0:0:0:1', '2018-01-04 15:18:57');
INSERT INTO `sys_log` VALUES ('434', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=237&_=1515037948600&', '0:0:0:0:0:0:0:1', '2018-01-04 15:19:02');
INSERT INTO `sys_log` VALUES ('435', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=237&name=删除&resourceType=1&url=/company/delete&openMode=ajax&icon=fi-page-delete&seq=3&status=0&opened=1&pid=233&', '0:0:0:0:0:0:0:1', '2018-01-04 15:19:05');
INSERT INTO `sys_log` VALUES ('436', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-04 15:19:14');
INSERT INTO `sys_log` VALUES ('437', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CompanyController,[方法]:addPage,[参数]:', null, '2018-01-04 15:19:49');
INSERT INTO `sys_log` VALUES ('438', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:editPage,[参数]:id=1&_=1515050363444&', '0:0:0:0:0:0:0:1', '2018-01-04 15:20:01');
INSERT INTO `sys_log` VALUES ('439', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1515050363445&', '0:0:0:0:0:0:0:1', '2018-01-04 15:20:04');
INSERT INTO `sys_log` VALUES ('440', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CompanyController,[方法]:addPage,[参数]:', null, '2018-01-04 15:22:47');
INSERT INTO `sys_log` VALUES ('441', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CompanyController,[方法]:addPage,[参数]:', null, '2018-01-04 15:28:14');
INSERT INTO `sys_log` VALUES ('442', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CompanyController,[方法]:addPage,[参数]:', null, '2018-01-04 15:28:54');
INSERT INTO `sys_log` VALUES ('443', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CompanyController,[方法]:addPage,[参数]:', null, '2018-01-04 15:30:02');
INSERT INTO `sys_log` VALUES ('444', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CompanyController,[方法]:addPage,[参数]:', null, '2018-01-04 16:51:29');
INSERT INTO `sys_log` VALUES ('445', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CompanyController,[方法]:add,[参数]:name=测试公司&principal=胡二&telephone=3657812&mobile=&address=阳江&status=0&description=test&', '0:0:0:0:0:0:0:1', '2018-01-04 16:51:53');
INSERT INTO `sys_log` VALUES ('446', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CompanyController,[方法]:editPage,[参数]:id=1&_=1515056057594&', '0:0:0:0:0:0:0:1', '2018-01-04 16:54:28');
INSERT INTO `sys_log` VALUES ('447', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CompanyController,[方法]:editPage,[参数]:id=1&_=1515056057596&', '0:0:0:0:0:0:0:1', '2018-01-04 16:59:34');
INSERT INTO `sys_log` VALUES ('448', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CompanyController,[方法]:editPage,[参数]:id=1&_=1515056388542&', '0:0:0:0:0:0:0:1', '2018-01-04 16:59:51');
INSERT INTO `sys_log` VALUES ('449', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:edit,[参数]:id=&name=测试公司&principal=胡二&telephone=3657812&mobile=&address=阳江&status=1&description=test&', '0:0:0:0:0:0:0:1', '2018-01-04 17:00:01');
INSERT INTO `sys_log` VALUES ('450', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CompanyController,[方法]:editPage,[参数]:id=1&_=1515056388544&', '0:0:0:0:0:0:0:1', '2018-01-04 17:00:07');
INSERT INTO `sys_log` VALUES ('451', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CompanyController,[方法]:editPage,[参数]:id=1&_=1515056572905&', '0:0:0:0:0:0:0:1', '2018-01-04 17:02:57');
INSERT INTO `sys_log` VALUES ('452', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CompanyController,[方法]:edit,[参数]:id=&name=测试公司&principal=胡二&telephone=3657812&mobile=&address=阳江&status=1&description=test&', '0:0:0:0:0:0:0:1', '2018-01-04 17:03:00');
INSERT INTO `sys_log` VALUES ('453', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CompanyController,[方法]:editPage,[参数]:id=1&_=1515056632212&', '0:0:0:0:0:0:0:1', '2018-01-04 17:03:55');
INSERT INTO `sys_log` VALUES ('454', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CompanyController,[方法]:edit,[参数]:id=1&name=测试公司&principal=胡二&telephone=3657812&mobile=&address=阳江&status=1&description=test&', '0:0:0:0:0:0:0:1', '2018-01-04 17:03:57');
INSERT INTO `sys_log` VALUES ('455', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CompanyController,[方法]:editPage,[参数]:id=1&_=1515056632213&', '0:0:0:0:0:0:0:1', '2018-01-04 17:04:09');
INSERT INTO `sys_log` VALUES ('456', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CompanyController,[方法]:edit,[参数]:id=1&name=测试公司&principal=胡二&telephone=3657812&mobile=&address=阳江&status=0&description=test&', '0:0:0:0:0:0:0:1', '2018-01-04 17:04:13');
INSERT INTO `sys_log` VALUES ('457', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:addPage,[参数]:', null, '2018-01-04 17:04:40');
INSERT INTO `sys_log` VALUES ('458', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:add,[参数]:name=公司运营&seq=0&status=0&description=&', '0:0:0:0:0:0:0:1', '2018-01-04 17:04:54');
INSERT INTO `sys_log` VALUES ('459', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:editPage,[参数]:id=9&_=1515056632216&', '0:0:0:0:0:0:0:1', '2018-01-04 17:04:57');
INSERT INTO `sys_log` VALUES ('460', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=9&_=1515056632217&', '0:0:0:0:0:0:0:1', '2018-01-04 17:05:00');
INSERT INTO `sys_log` VALUES ('461', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=9&resourceIds=232,233,234,236&', '0:0:0:0:0:0:0:1', '2018-01-04 17:05:15');
INSERT INTO `sys_log` VALUES ('462', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2018-01-04 17:05:56');
INSERT INTO `sys_log` VALUES ('463', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:add,[参数]:code=testcompany&name=测试公司&seq=0&icon=fi-folder&address=&pid=&', '0:0:0:0:0:0:0:1', '2018-01-04 17:06:25');
INSERT INTO `sys_log` VALUES ('464', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:addPage,[参数]:', null, '2018-01-04 17:06:46');
INSERT INTO `sys_log` VALUES ('465', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:add,[参数]:loginName=testCompany&name=测试公司管理理&password=abc123&sex=0&age=&userType=1&organizationId=7&roleIds=9&phone=&status=0&', '0:0:0:0:0:0:0:1', '2018-01-04 17:07:22');
INSERT INTO `sys_log` VALUES ('466', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-04 17:07:32');
INSERT INTO `sys_log` VALUES ('467', 'testCompany', 'testCompany', '[类名]:com.wangzhixuan.controller.CompanyController,[方法]:editPage,[参数]:id=1&_=1515056863255&', '0:0:0:0:0:0:0:1', '2018-01-04 17:07:54');
INSERT INTO `sys_log` VALUES ('468', 'testCompany', 'testCompany', '[类名]:com.wangzhixuan.controller.CompanyController,[方法]:editPage,[参数]:id=1&_=1515056863256&', '0:0:0:0:0:0:0:1', '2018-01-04 17:07:58');
INSERT INTO `sys_log` VALUES ('469', 'testCompany', 'testCompany', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-04 17:08:55');
INSERT INTO `sys_log` VALUES ('470', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2018-01-04 17:22:20');
INSERT INTO `sys_log` VALUES ('471', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=订单管理&resourceType=0&url=/order/manager&openMode=ajax&icon=&seq=0&status=0&opened=1&pid=232&', '0:0:0:0:0:0:0:1', '2018-01-04 17:23:43');
INSERT INTO `sys_log` VALUES ('472', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2018-01-04 17:31:38');
INSERT INTO `sys_log` VALUES ('473', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=列表&resourceType=1&url=/order/dataGrid&openMode=ajax&icon= fi-list&seq=0&status=0&opened=0&pid=238&', '0:0:0:0:0:0:0:1', '2018-01-04 17:32:20');
INSERT INTO `sys_log` VALUES ('474', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2018-01-04 17:32:28');
INSERT INTO `sys_log` VALUES ('475', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=添加&resourceType=1&url=/order/add&openMode=ajax&icon=fi-page-add&seq=1&status=0&opened=1&pid=238&', '0:0:0:0:0:0:0:1', '2018-01-04 17:32:55');
INSERT INTO `sys_log` VALUES ('476', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=239&_=1515056944517&', '0:0:0:0:0:0:0:1', '2018-01-04 17:32:58');
INSERT INTO `sys_log` VALUES ('477', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=239&name=列表&resourceType=1&url=/order/dataGrid&openMode=ajax&icon= fi-list&seq=0&status=0&opened=1&pid=238&', '0:0:0:0:0:0:0:1', '2018-01-04 17:33:01');
INSERT INTO `sys_log` VALUES ('478', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2018-01-04 17:33:12');
INSERT INTO `sys_log` VALUES ('479', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=编辑&resourceType=1&url=/order/edit&openMode=ajax&icon=fi-page-edit&seq=2&status=0&opened=1&pid=238&', '0:0:0:0:0:0:0:1', '2018-01-04 17:33:43');
INSERT INTO `sys_log` VALUES ('480', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2018-01-04 17:33:52');
INSERT INTO `sys_log` VALUES ('481', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=删除&resourceType=1&url=/order/delete&openMode=ajax&icon=fi-page-delete&seq=0&status=0&opened=1&pid=238&', '0:0:0:0:0:0:0:1', '2018-01-04 17:34:17');
INSERT INTO `sys_log` VALUES ('482', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=9&_=1515056944521&', '0:0:0:0:0:0:0:1', '2018-01-04 17:34:25');
INSERT INTO `sys_log` VALUES ('483', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=9&resourceIds=232,233,234,236,238,239,242,240,241&', '0:0:0:0:0:0:0:1', '2018-01-04 17:34:33');
INSERT INTO `sys_log` VALUES ('484', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CompanyController,[方法]:addPage,[参数]:', null, '2018-01-04 17:46:36');
INSERT INTO `sys_log` VALUES ('485', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-17 18:34:24');
INSERT INTO `sys_log` VALUES ('486', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1517209148499&', '0:0:0:0:0:0:0:1', '2018-01-29 14:59:37');
INSERT INTO `sys_log` VALUES ('487', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,232,233,234,235,236,237,238,239,242,240,241,230,231,222,223,224,221,227,228,226&', '0:0:0:0:0:0:0:1', '2018-01-29 14:59:49');
INSERT INTO `sys_log` VALUES ('488', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-29 14:59:55');
INSERT INTO `sys_log` VALUES ('489', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 15:27:43');
INSERT INTO `sys_log` VALUES ('490', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 15:28:31');
INSERT INTO `sys_log` VALUES ('491', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=238&_=1517209896816&', '0:0:0:0:0:0:0:1', '2018-01-29 15:29:10');
INSERT INTO `sys_log` VALUES ('492', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=238&name=送货单管理&resourceType=0&url=/order/manager&openMode=&icon=&seq=0&status=0&opened=1&pid=232&', '0:0:0:0:0:0:0:1', '2018-01-29 15:29:27');
INSERT INTO `sys_log` VALUES ('493', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 15:29:34');
INSERT INTO `sys_log` VALUES ('494', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 15:29:42');
INSERT INTO `sys_log` VALUES ('495', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 15:46:44');
INSERT INTO `sys_log` VALUES ('496', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 15:47:08');
INSERT INTO `sys_log` VALUES ('497', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 15:47:35');
INSERT INTO `sys_log` VALUES ('498', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 15:48:40');
INSERT INTO `sys_log` VALUES ('499', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 15:49:49');
INSERT INTO `sys_log` VALUES ('500', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 15:52:28');
INSERT INTO `sys_log` VALUES ('501', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 15:54:21');
INSERT INTO `sys_log` VALUES ('502', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 15:55:26');
INSERT INTO `sys_log` VALUES ('503', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-29 15:55:41');
INSERT INTO `sys_log` VALUES ('504', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 15:55:55');
INSERT INTO `sys_log` VALUES ('505', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 15:57:36');
INSERT INTO `sys_log` VALUES ('506', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 15:58:49');
INSERT INTO `sys_log` VALUES ('507', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 16:02:29');
INSERT INTO `sys_log` VALUES ('508', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 16:04:38');
INSERT INTO `sys_log` VALUES ('509', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 16:05:40');
INSERT INTO `sys_log` VALUES ('510', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 16:13:10');
INSERT INTO `sys_log` VALUES ('511', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 16:31:40');
INSERT INTO `sys_log` VALUES ('512', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 16:36:59');
INSERT INTO `sys_log` VALUES ('513', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 16:37:15');
INSERT INTO `sys_log` VALUES ('514', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CompanyController,[方法]:addPage,[参数]:', null, '2018-01-29 16:38:04');
INSERT INTO `sys_log` VALUES ('515', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 16:38:10');
INSERT INTO `sys_log` VALUES ('516', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 16:43:11');
INSERT INTO `sys_log` VALUES ('517', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 16:44:52');
INSERT INTO `sys_log` VALUES ('518', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 16:45:50');
INSERT INTO `sys_log` VALUES ('519', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 16:46:59');
INSERT INTO `sys_log` VALUES ('520', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 16:47:38');
INSERT INTO `sys_log` VALUES ('521', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 16:48:04');
INSERT INTO `sys_log` VALUES ('522', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 16:51:23');
INSERT INTO `sys_log` VALUES ('523', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2018-01-29 16:53:54');
INSERT INTO `sys_log` VALUES ('524', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=客户信息管理&resourceType=0&url=/customer/manager&openMode=ajax&icon=&seq=0&status=0&opened=1&pid=232&', '0:0:0:0:0:0:0:1', '2018-01-29 16:54:41');
INSERT INTO `sys_log` VALUES ('525', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2018-01-29 16:54:46');
INSERT INTO `sys_log` VALUES ('526', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=列表&resourceType=1&url=/customer/dataGrid&openMode=ajax&icon=fl-list&seq=0&status=0&opened=1&pid=243&', '0:0:0:0:0:0:0:1', '2018-01-29 16:55:50');
INSERT INTO `sys_log` VALUES ('527', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=244&_=1517215875114&', '0:0:0:0:0:0:0:1', '2018-01-29 16:56:00');
INSERT INTO `sys_log` VALUES ('528', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=244&name=列表&resourceType=1&url=/customer/dataGrid&openMode=ajax&icon=fi-list&seq=0&status=0&opened=1&pid=243&', '0:0:0:0:0:0:0:1', '2018-01-29 16:56:05');
INSERT INTO `sys_log` VALUES ('529', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2018-01-29 16:56:11');
INSERT INTO `sys_log` VALUES ('530', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=添加&resourceType=1&url=/customer/add&openMode=ajax&icon=fi-page-add&seq=1&status=0&opened=1&pid=243&', '0:0:0:0:0:0:0:1', '2018-01-29 16:56:50');
INSERT INTO `sys_log` VALUES ('531', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2018-01-29 16:56:54');
INSERT INTO `sys_log` VALUES ('532', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=编辑&resourceType=1&url=/customer/edit&openMode=ajax&icon=fi-page-edit&seq=2&status=0&opened=1&pid=243&', '0:0:0:0:0:0:0:1', '2018-01-29 16:57:28');
INSERT INTO `sys_log` VALUES ('533', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2018-01-29 16:57:33');
INSERT INTO `sys_log` VALUES ('534', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=删除&resourceType=1&url=/customer/delete&openMode=ajax&icon=fi-page-delete&seq=3&status=0&opened=1&pid=243&', '0:0:0:0:0:0:0:1', '2018-01-29 16:57:59');
INSERT INTO `sys_log` VALUES ('535', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1517215875119&', '0:0:0:0:0:0:0:1', '2018-01-29 16:58:05');
INSERT INTO `sys_log` VALUES ('536', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,232,233,234,235,236,237,238,239,242,240,241,243,244,245,246,247,230,231,222,223,224,221,227,228,226&', '0:0:0:0:0:0:0:1', '2018-01-29 16:58:15');
INSERT INTO `sys_log` VALUES ('537', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=243&_=1517215875120&', '0:0:0:0:0:0:0:1', '2018-01-29 17:00:40');
INSERT INTO `sys_log` VALUES ('538', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=243&name=客户信息管理&resourceType=0&url=/customer/manager&openMode=&icon=&seq=1&status=0&opened=1&pid=232&', '0:0:0:0:0:0:0:1', '2018-01-29 17:00:42');
INSERT INTO `sys_log` VALUES ('539', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=238&_=1517215875121&', '0:0:0:0:0:0:0:1', '2018-01-29 17:00:46');
INSERT INTO `sys_log` VALUES ('540', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=238&name=送货单管理&resourceType=0&url=/order/manager&openMode=&icon=&seq=1&status=0&opened=1&pid=232&', '0:0:0:0:0:0:0:1', '2018-01-29 17:00:49');
INSERT INTO `sys_log` VALUES ('541', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=238&_=1517216451582&', '0:0:0:0:0:0:0:1', '2018-01-29 17:01:13');
INSERT INTO `sys_log` VALUES ('542', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=238&name=送货单管理&resourceType=0&url=/order/manager&openMode=&icon=&seq=2&status=0&opened=1&pid=232&', '0:0:0:0:0:0:0:1', '2018-01-29 17:01:15');
INSERT INTO `sys_log` VALUES ('543', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1517218411419&', '0:0:0:0:0:0:0:1', '2018-01-29 17:33:40');
INSERT INTO `sys_log` VALUES ('544', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-29 17:33:45');
INSERT INTO `sys_log` VALUES ('545', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CustomerController,[方法]:addPage,[参数]:', null, '2018-01-29 17:34:20');
INSERT INTO `sys_log` VALUES ('546', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CustomerController,[方法]:addPage,[参数]:', null, '2018-01-29 17:36:53');
INSERT INTO `sys_log` VALUES ('547', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CustomerController,[方法]:addPage,[参数]:', null, '2018-01-29 17:45:11');
INSERT INTO `sys_log` VALUES ('548', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CustomerController,[方法]:add,[参数]:name=a&linkman=b&telephone=cc&address=d&description=a&', '0:0:0:0:0:0:0:1', '2018-01-29 17:45:23');
INSERT INTO `sys_log` VALUES ('549', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 17:45:43');
INSERT INTO `sys_log` VALUES ('550', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 18:24:41');
INSERT INTO `sys_log` VALUES ('551', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 18:25:42');
INSERT INTO `sys_log` VALUES ('552', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 18:26:05');
INSERT INTO `sys_log` VALUES ('553', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 18:26:26');
INSERT INTO `sys_log` VALUES ('554', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 18:27:51');
INSERT INTO `sys_log` VALUES ('555', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CustomerController,[方法]:addPage,[参数]:', null, '2018-01-29 18:28:22');
INSERT INTO `sys_log` VALUES ('556', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CustomerController,[方法]:add,[参数]:name=b&linkman=b&telephone=b&address=b&description=b&', '0:0:0:0:0:0:0:1', '2018-01-29 18:28:30');
INSERT INTO `sys_log` VALUES ('557', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 18:28:40');
INSERT INTO `sys_log` VALUES ('558', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 18:31:34');
INSERT INTO `sys_log` VALUES ('559', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 18:34:25');
INSERT INTO `sys_log` VALUES ('560', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-01-29 18:36:14');
INSERT INTO `sys_log` VALUES ('561', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-02-01 16:31:01');
INSERT INTO `sys_log` VALUES ('562', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-02-01 16:33:44');
INSERT INTO `sys_log` VALUES ('563', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-02-01 16:36:33');
INSERT INTO `sys_log` VALUES ('564', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-02-01 16:37:05');
INSERT INTO `sys_log` VALUES ('565', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-02-01 16:38:27');
INSERT INTO `sys_log` VALUES ('566', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-02-01 16:39:51');
INSERT INTO `sys_log` VALUES ('567', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-02-01 16:40:19');
INSERT INTO `sys_log` VALUES ('568', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-02-01 16:41:35');
INSERT INTO `sys_log` VALUES ('569', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-02-01 16:43:08');
INSERT INTO `sys_log` VALUES ('570', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-02-01 16:43:45');
INSERT INTO `sys_log` VALUES ('571', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-02-01 16:45:03');
INSERT INTO `sys_log` VALUES ('572', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-02-01 17:25:53');
INSERT INTO `sys_log` VALUES ('573', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-02-01 17:28:30');
INSERT INTO `sys_log` VALUES ('574', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-02-01 17:29:48');
INSERT INTO `sys_log` VALUES ('575', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-02-01 17:30:39');
INSERT INTO `sys_log` VALUES ('576', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-02-01 17:31:16');
INSERT INTO `sys_log` VALUES ('577', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-02-01 17:31:37');
INSERT INTO `sys_log` VALUES ('578', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-02-01 17:32:08');
INSERT INTO `sys_log` VALUES ('579', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-02-01 17:32:35');
INSERT INTO `sys_log` VALUES ('580', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-02-01 17:33:08');
INSERT INTO `sys_log` VALUES ('581', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-02-01 17:36:14');
INSERT INTO `sys_log` VALUES ('582', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-02-01 17:36:48');
INSERT INTO `sys_log` VALUES ('583', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-02-01 17:38:02');
INSERT INTO `sys_log` VALUES ('584', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-02-01 17:38:48');
INSERT INTO `sys_log` VALUES ('585', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CompanyController,[方法]:addPage,[参数]:', null, '2018-02-01 17:39:33');
INSERT INTO `sys_log` VALUES ('586', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CompanyController,[方法]:add,[参数]:name=建泓五金制品厂&principal=梁业达&telephone=0662-2663196&mobile=13664998169&address=阳江市江城区新江北路1273号&status=0&description=&', '0:0:0:0:0:0:0:1', '2018-02-01 17:42:25');
INSERT INTO `sys_log` VALUES ('587', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:', null, '2018-02-01 17:42:51');
INSERT INTO `sys_log` VALUES ('588', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1517478379444&', '0:0:0:0:0:0:0:1', '2018-02-01 17:46:23');
INSERT INTO `sys_log` VALUES ('589', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1517478379445&', '0:0:0:0:0:0:0:1', '2018-02-01 17:52:06');
INSERT INTO `sys_log` VALUES ('590', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1517478379446&', '0:0:0:0:0:0:0:1', '2018-02-01 17:53:30');
INSERT INTO `sys_log` VALUES ('591', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1517478816617&', '0:0:0:0:0:0:0:1', '2018-02-01 17:53:39');
INSERT INTO `sys_log` VALUES ('592', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1517478816618&', '0:0:0:0:0:0:0:1', '2018-02-01 17:54:56');
INSERT INTO `sys_log` VALUES ('593', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1517478816619&', '0:0:0:0:0:0:0:1', '2018-02-01 17:55:56');
INSERT INTO `sys_log` VALUES ('594', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1517478816620&', '0:0:0:0:0:0:0:1', '2018-02-01 17:56:14');
INSERT INTO `sys_log` VALUES ('595', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1517478816621&', '0:0:0:0:0:0:0:1', '2018-02-01 17:59:27');
INSERT INTO `sys_log` VALUES ('596', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1517478816622&', '0:0:0:0:0:0:0:1', '2018-02-01 18:00:41');
INSERT INTO `sys_log` VALUES ('597', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1517479315973&', '0:0:0:0:0:0:0:1', '2018-02-01 18:01:58');
INSERT INTO `sys_log` VALUES ('598', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1517479315974&', '0:0:0:0:0:0:0:1', '2018-02-01 18:03:57');
INSERT INTO `sys_log` VALUES ('599', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1517479315975&', '0:0:0:0:0:0:0:1', '2018-02-01 18:04:29');
INSERT INTO `sys_log` VALUES ('600', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1517479474313&', '0:0:0:0:0:0:0:1', '2018-02-01 18:04:37');
INSERT INTO `sys_log` VALUES ('601', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1517479513544&', '0:0:0:0:0:0:0:1', '2018-02-01 18:05:16');
INSERT INTO `sys_log` VALUES ('602', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1517554356755&', '0:0:0:0:0:0:0:1', '2018-02-02 14:52:48');
INSERT INTO `sys_log` VALUES ('603', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1517554356756&', '0:0:0:0:0:0:0:1', '2018-02-02 14:54:52');
INSERT INTO `sys_log` VALUES ('604', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1517557698207&', '0:0:0:0:0:0:0:1', '2018-02-02 15:48:21');
INSERT INTO `sys_log` VALUES ('605', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1517557698208&', '0:0:0:0:0:0:0:1', '2018-02-02 15:49:22');
INSERT INTO `sys_log` VALUES ('606', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1517557698209&', '0:0:0:0:0:0:0:1', '2018-02-02 15:49:27');
INSERT INTO `sys_log` VALUES ('607', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1517557698210&', '0:0:0:0:0:0:0:1', '2018-02-02 15:55:26');
INSERT INTO `sys_log` VALUES ('608', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1517557698211&', '0:0:0:0:0:0:0:1', '2018-02-02 16:59:41');
INSERT INTO `sys_log` VALUES ('609', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1517562340441&', '0:0:0:0:0:0:0:1', '2018-02-02 17:05:43');
INSERT INTO `sys_log` VALUES ('610', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1517562376626&', '0:0:0:0:0:0:0:1', '2018-02-02 17:06:19');
INSERT INTO `sys_log` VALUES ('611', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1517562448734&', '0:0:0:0:0:0:0:1', '2018-02-02 17:07:31');
INSERT INTO `sys_log` VALUES ('612', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1517562448735&', '0:0:0:0:0:0:0:1', '2018-02-02 17:09:24');
INSERT INTO `sys_log` VALUES ('613', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1517562448736&', '0:0:0:0:0:0:0:1', '2018-02-02 17:10:50');
INSERT INTO `sys_log` VALUES ('614', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1517562448737&', '0:0:0:0:0:0:0:1', '2018-02-02 17:11:55');
INSERT INTO `sys_log` VALUES ('615', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1517562448738&', '0:0:0:0:0:0:0:1', '2018-02-02 17:13:43');
INSERT INTO `sys_log` VALUES ('616', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1517562448739&', '0:0:0:0:0:0:0:1', '2018-02-02 17:15:39');
INSERT INTO `sys_log` VALUES ('617', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1517562448740&', '0:0:0:0:0:0:0:1', '2018-02-02 17:16:53');
INSERT INTO `sys_log` VALUES ('618', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1517562448741&', '0:0:0:0:0:0:0:1', '2018-02-02 17:18:34');
INSERT INTO `sys_log` VALUES ('619', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2018-02-02 17:36:00');
INSERT INTO `sys_log` VALUES ('620', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=单位管理&resourceType=0&url=/unit/unit&openMode=ajax&icon=&seq=3&status=0&opened=1&pid=232&', '0:0:0:0:0:0:0:1', '2018-02-02 17:37:17');
INSERT INTO `sys_log` VALUES ('621', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2018-02-02 17:37:27');
INSERT INTO `sys_log` VALUES ('622', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=列表&resourceType=1&url=/unit/dataGrid&openMode=ajax&icon=fi-list&seq=0&status=0&opened=1&pid=248&', '0:0:0:0:0:0:0:1', '2018-02-02 17:38:18');
INSERT INTO `sys_log` VALUES ('623', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2018-02-02 17:38:23');
INSERT INTO `sys_log` VALUES ('624', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=添加&resourceType=1&url=/unit/add&openMode=ajax&icon=fi-page-add&seq=1&status=0&opened=1&pid=248&', '0:0:0:0:0:0:0:1', '2018-02-02 17:39:01');
INSERT INTO `sys_log` VALUES ('625', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2018-02-02 17:39:07');
INSERT INTO `sys_log` VALUES ('626', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=编辑&resourceType=1&url=/unit/edit&openMode=ajax&icon=fi-page-edit&seq=2&status=0&opened=1&pid=248&', '0:0:0:0:0:0:0:1', '2018-02-02 17:39:46');
INSERT INTO `sys_log` VALUES ('627', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2018-02-02 17:39:49');
INSERT INTO `sys_log` VALUES ('628', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=删除&resourceType=1&url=/unit/delete&openMode=ajax&icon=fi-page-delete&seq=3&status=0&opened=1&pid=248&', '0:0:0:0:0:0:0:1', '2018-02-02 17:40:18');
INSERT INTO `sys_log` VALUES ('629', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1517564130813&', '0:0:0:0:0:0:0:1', '2018-02-02 17:40:30');
INSERT INTO `sys_log` VALUES ('630', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,232,233,234,235,236,237,243,244,245,246,247,238,239,242,240,241,248,249,250,251,252,230,231,222,223,224,221,227,228,226&', '0:0:0:0:0:0:0:1', '2018-02-02 17:40:35');
INSERT INTO `sys_log` VALUES ('631', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-02 17:40:38');
INSERT INTO `sys_log` VALUES ('632', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=248&_=1517564767434&', '0:0:0:0:0:0:0:1', '2018-02-02 17:46:48');
INSERT INTO `sys_log` VALUES ('633', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=248&name=单位管理&resourceType=0&url=/unit/manager&openMode=&icon=&seq=3&status=0&opened=1&pid=232&', '0:0:0:0:0:0:0:1', '2018-02-02 17:46:55');
INSERT INTO `sys_log` VALUES ('634', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UnitController,[方法]:addPage,[参数]:', null, '2018-02-02 17:54:07');
INSERT INTO `sys_log` VALUES ('635', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UnitController,[方法]:add,[参数]:unitCode=tiao&unitName=条&', '0:0:0:0:0:0:0:1', '2018-02-02 17:54:26');
INSERT INTO `sys_log` VALUES ('636', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UnitController,[方法]:editPage,[参数]:id=2&_=1517565243971&', '0:0:0:0:0:0:0:1', '2018-02-02 17:54:28');
INSERT INTO `sys_log` VALUES ('637', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UnitController,[方法]:edit,[参数]:id=2&unitCode=tia&unitName=条&', '0:0:0:0:0:0:0:1', '2018-02-02 17:54:32');
INSERT INTO `sys_log` VALUES ('638', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UnitController,[方法]:editPage,[参数]:id=2&_=1517565243972&', '0:0:0:0:0:0:0:1', '2018-02-02 17:54:34');
INSERT INTO `sys_log` VALUES ('639', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UnitController,[方法]:edit,[参数]:id=2&unitCode=tia0&unitName=条&', '0:0:0:0:0:0:0:1', '2018-02-02 17:54:37');
INSERT INTO `sys_log` VALUES ('640', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UnitController,[方法]:delete,[参数]:id=2&', '0:0:0:0:0:0:0:1', '2018-02-02 17:54:40');
INSERT INTO `sys_log` VALUES ('641', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=238&_=1517565243975&', '0:0:0:0:0:0:0:1', '2018-02-02 17:55:05');
INSERT INTO `sys_log` VALUES ('642', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=238&name=送货单管理&resourceType=0&url=/order/manager&openMode=&icon=&seq=3&status=0&opened=1&pid=232&', '0:0:0:0:0:0:0:1', '2018-02-02 17:55:08');
INSERT INTO `sys_log` VALUES ('643', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=248&_=1517565243976&', '0:0:0:0:0:0:0:1', '2018-02-02 17:55:11');
INSERT INTO `sys_log` VALUES ('644', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=248&name=单位管理&resourceType=0&url=/unit/manager&openMode=&icon=&seq=2&status=0&opened=1&pid=232&', '0:0:0:0:0:0:0:1', '2018-02-02 17:55:13');
INSERT INTO `sys_log` VALUES ('645', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1517565313953&', '0:0:0:0:0:0:0:1', '2018-02-02 17:55:58');
INSERT INTO `sys_log` VALUES ('646', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518169755955&', '0:0:0:0:0:0:0:1', '2018-02-09 17:49:23');
INSERT INTO `sys_log` VALUES ('647', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518170047606&', '0:0:0:0:0:0:0:1', '2018-02-09 17:54:15');
INSERT INTO `sys_log` VALUES ('648', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518170150874&', '0:0:0:0:0:0:0:1', '2018-02-09 17:55:54');
INSERT INTO `sys_log` VALUES ('649', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518170225446&', '0:0:0:0:0:0:0:1', '2018-02-09 17:57:08');
INSERT INTO `sys_log` VALUES ('650', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518170314507&', '0:0:0:0:0:0:0:1', '2018-02-09 17:58:37');
INSERT INTO `sys_log` VALUES ('651', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518170367889&', '0:0:0:0:0:0:0:1', '2018-02-09 17:59:30');
INSERT INTO `sys_log` VALUES ('652', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518170367890&', '0:0:0:0:0:0:0:1', '2018-02-09 18:00:57');
INSERT INTO `sys_log` VALUES ('653', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518170550599&', '0:0:0:0:0:0:0:1', '2018-02-09 18:02:33');
INSERT INTO `sys_log` VALUES ('654', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518171183800&', '0:0:0:0:0:0:0:1', '2018-02-09 18:13:07');
INSERT INTO `sys_log` VALUES ('655', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518171220930&', '0:0:0:0:0:0:0:1', '2018-02-09 18:13:43');
INSERT INTO `sys_log` VALUES ('656', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518171239111&', '0:0:0:0:0:0:0:1', '2018-02-09 18:14:01');
INSERT INTO `sys_log` VALUES ('657', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518171331714&', '0:0:0:0:0:0:0:1', '2018-02-09 18:15:34');
INSERT INTO `sys_log` VALUES ('658', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518171379864&', '0:0:0:0:0:0:0:1', '2018-02-09 18:16:22');
INSERT INTO `sys_log` VALUES ('659', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518227135986&', '0:0:0:0:0:0:0:1', '2018-02-10 09:45:41');
INSERT INTO `sys_log` VALUES ('660', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518227455558&', '0:0:0:0:0:0:0:1', '2018-02-10 09:50:58');
INSERT INTO `sys_log` VALUES ('661', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518227455559&', '0:0:0:0:0:0:0:1', '2018-02-10 09:53:59');
INSERT INTO `sys_log` VALUES ('662', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518227663885&', '0:0:0:0:0:0:0:1', '2018-02-10 09:54:27');
INSERT INTO `sys_log` VALUES ('663', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518227737621&', '0:0:0:0:0:0:0:1', '2018-02-10 09:55:40');
INSERT INTO `sys_log` VALUES ('664', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518227737622&', '0:0:0:0:0:0:0:1', '2018-02-10 09:56:35');
INSERT INTO `sys_log` VALUES ('665', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518227994761&', '0:0:0:0:0:0:0:1', '2018-02-10 09:59:57');
INSERT INTO `sys_log` VALUES ('666', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518228019086&', '0:0:0:0:0:0:0:1', '2018-02-10 10:00:22');
INSERT INTO `sys_log` VALUES ('667', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518228338547&', '0:0:0:0:0:0:0:1', '2018-02-10 10:05:41');
INSERT INTO `sys_log` VALUES ('668', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518228362767&', '0:0:0:0:0:0:0:1', '2018-02-10 10:06:05');
INSERT INTO `sys_log` VALUES ('669', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518228362768&', '0:0:0:0:0:0:0:1', '2018-02-10 10:06:45');
INSERT INTO `sys_log` VALUES ('670', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518228478496&', '0:0:0:0:0:0:0:1', '2018-02-10 10:08:01');
INSERT INTO `sys_log` VALUES ('671', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518228492901&', '0:0:0:0:0:0:0:1', '2018-02-10 10:08:22');
INSERT INTO `sys_log` VALUES ('672', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518228643736&', '0:0:0:0:0:0:0:1', '2018-02-10 10:10:46');
INSERT INTO `sys_log` VALUES ('673', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518229496933&', '0:0:0:0:0:0:0:1', '2018-02-10 10:25:00');
INSERT INTO `sys_log` VALUES ('674', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518229524784&', '0:0:0:0:0:0:0:1', '2018-02-10 10:25:27');
INSERT INTO `sys_log` VALUES ('675', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518229634746&', '0:0:0:0:0:0:0:1', '2018-02-10 10:27:17');
INSERT INTO `sys_log` VALUES ('676', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518229833992&', '0:0:0:0:0:0:0:1', '2018-02-10 10:30:36');
INSERT INTO `sys_log` VALUES ('677', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518229862452&', '0:0:0:0:0:0:0:1', '2018-02-10 10:31:05');
INSERT INTO `sys_log` VALUES ('678', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518229896905&', '0:0:0:0:0:0:0:1', '2018-02-10 10:31:39');
INSERT INTO `sys_log` VALUES ('679', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518230168825&', '0:0:0:0:0:0:0:1', '2018-02-10 10:36:11');
INSERT INTO `sys_log` VALUES ('680', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518230298672&', '0:0:0:0:0:0:0:1', '2018-02-10 10:38:21');
INSERT INTO `sys_log` VALUES ('681', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518230554699&', '0:0:0:0:0:0:0:1', '2018-02-10 10:42:38');
INSERT INTO `sys_log` VALUES ('682', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518230739861&', '0:0:0:0:0:0:0:1', '2018-02-10 10:45:49');
INSERT INTO `sys_log` VALUES ('683', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518230895345&', '0:0:0:0:0:0:0:1', '2018-02-10 10:48:18');
INSERT INTO `sys_log` VALUES ('684', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518230929121&', '0:0:0:0:0:0:0:1', '2018-02-10 10:48:51');
INSERT INTO `sys_log` VALUES ('685', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518231034666&', '0:0:0:0:0:0:0:1', '2018-02-10 10:50:37');
INSERT INTO `sys_log` VALUES ('686', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518231209515&', '0:0:0:0:0:0:0:1', '2018-02-10 10:53:32');
INSERT INTO `sys_log` VALUES ('687', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518231830834&', '0:0:0:0:0:0:0:1', '2018-02-10 11:03:53');
INSERT INTO `sys_log` VALUES ('688', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518231969751&', '0:0:0:0:0:0:0:1', '2018-02-10 11:06:12');
INSERT INTO `sys_log` VALUES ('689', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518232024833&', '0:0:0:0:0:0:0:1', '2018-02-10 11:07:07');
INSERT INTO `sys_log` VALUES ('690', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518232289066&', '0:0:0:0:0:0:0:1', '2018-02-10 11:11:33');
INSERT INTO `sys_log` VALUES ('691', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518232550477&', '0:0:0:0:0:0:0:1', '2018-02-10 11:15:53');
INSERT INTO `sys_log` VALUES ('692', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518232795257&', '0:0:0:0:0:0:0:1', '2018-02-10 11:19:57');
INSERT INTO `sys_log` VALUES ('693', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518232966160&', '0:0:0:0:0:0:0:1', '2018-02-10 11:22:48');
INSERT INTO `sys_log` VALUES ('694', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518233005884&', '0:0:0:0:0:0:0:1', '2018-02-10 11:23:28');
INSERT INTO `sys_log` VALUES ('695', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518233242665&', '0:0:0:0:0:0:0:1', '2018-02-10 11:27:25');
INSERT INTO `sys_log` VALUES ('696', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518233377546&', '0:0:0:0:0:0:0:1', '2018-02-10 11:29:40');
INSERT INTO `sys_log` VALUES ('697', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518233512744&', '0:0:0:0:0:0:0:1', '2018-02-10 11:31:55');
INSERT INTO `sys_log` VALUES ('698', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518233669373&', '0:0:0:0:0:0:0:1', '2018-02-10 11:34:32');
INSERT INTO `sys_log` VALUES ('699', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518233669374&', '0:0:0:0:0:0:0:1', '2018-02-10 11:35:48');
INSERT INTO `sys_log` VALUES ('700', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518234064680&', '0:0:0:0:0:0:0:1', '2018-02-10 11:41:11');
INSERT INTO `sys_log` VALUES ('701', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518234361641&', '0:0:0:0:0:0:0:1', '2018-02-10 11:46:04');
INSERT INTO `sys_log` VALUES ('702', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518234391821&', '0:0:0:0:0:0:0:1', '2018-02-10 11:46:39');
INSERT INTO `sys_log` VALUES ('703', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518234493062&', '0:0:0:0:0:0:0:1', '2018-02-10 11:48:15');
INSERT INTO `sys_log` VALUES ('704', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518234881812&', '0:0:0:0:0:0:0:1', '2018-02-10 11:54:44');
INSERT INTO `sys_log` VALUES ('705', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518235049948&', '0:0:0:0:0:0:0:1', '2018-02-10 11:57:32');
INSERT INTO `sys_log` VALUES ('706', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518235122126&', '0:0:0:0:0:0:0:1', '2018-02-10 11:58:44');
INSERT INTO `sys_log` VALUES ('707', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518235122128&', '0:0:0:0:0:0:0:1', '2018-02-10 12:15:30');
INSERT INTO `sys_log` VALUES ('708', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518236184525&', '0:0:0:0:0:0:0:1', '2018-02-10 12:16:27');
INSERT INTO `sys_log` VALUES ('709', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518243881353&', '0:0:0:0:0:0:0:1', '2018-02-10 14:24:44');
INSERT INTO `sys_log` VALUES ('710', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518243997518&', '0:0:0:0:0:0:0:1', '2018-02-10 14:26:41');
INSERT INTO `sys_log` VALUES ('711', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518244105062&', '0:0:0:0:0:0:0:1', '2018-02-10 14:28:27');
INSERT INTO `sys_log` VALUES ('712', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518244233997&', '0:0:0:0:0:0:0:1', '2018-02-10 14:30:36');
INSERT INTO `sys_log` VALUES ('713', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518244472567&', '0:0:0:0:0:0:0:1', '2018-02-10 14:34:35');
INSERT INTO `sys_log` VALUES ('714', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518244503700&', '0:0:0:0:0:0:0:1', '2018-02-10 14:35:06');
INSERT INTO `sys_log` VALUES ('715', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518244614037&', '0:0:0:0:0:0:0:1', '2018-02-10 14:36:56');
INSERT INTO `sys_log` VALUES ('716', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518244670402&', '0:0:0:0:0:0:0:1', '2018-02-10 14:37:53');
INSERT INTO `sys_log` VALUES ('717', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518244801552&', '0:0:0:0:0:0:0:1', '2018-02-10 14:40:04');
INSERT INTO `sys_log` VALUES ('718', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518244812994&', '0:0:0:0:0:0:0:1', '2018-02-10 14:40:15');
INSERT INTO `sys_log` VALUES ('719', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518244981930&', '0:0:0:0:0:0:0:1', '2018-02-10 14:43:04');
INSERT INTO `sys_log` VALUES ('720', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518245019128&', '0:0:0:0:0:0:0:1', '2018-02-10 14:43:42');
INSERT INTO `sys_log` VALUES ('721', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518245108642&', '0:0:0:0:0:0:0:1', '2018-02-10 14:45:11');
INSERT INTO `sys_log` VALUES ('722', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518245466301&', '0:0:0:0:0:0:0:1', '2018-02-10 14:51:09');
INSERT INTO `sys_log` VALUES ('723', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518245605678&', '0:0:0:0:0:0:0:1', '2018-02-10 14:53:28');
INSERT INTO `sys_log` VALUES ('724', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518246007664&', '0:0:0:0:0:0:0:1', '2018-02-10 15:00:10');
INSERT INTO `sys_log` VALUES ('725', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518246110803&', '0:0:0:0:0:0:0:1', '2018-02-10 15:01:53');
INSERT INTO `sys_log` VALUES ('726', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518246956147&', '0:0:0:0:0:0:0:1', '2018-02-10 15:15:59');
INSERT INTO `sys_log` VALUES ('727', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518247020955&', '0:0:0:0:0:0:0:1', '2018-02-10 15:17:04');
INSERT INTO `sys_log` VALUES ('728', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518247082819&', '0:0:0:0:0:0:0:1', '2018-02-10 15:18:05');
INSERT INTO `sys_log` VALUES ('729', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518247150602&', '0:0:0:0:0:0:0:1', '2018-02-10 15:19:13');
INSERT INTO `sys_log` VALUES ('730', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518247181520&', '0:0:0:0:0:0:0:1', '2018-02-10 15:19:44');
INSERT INTO `sys_log` VALUES ('731', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518247225022&', '0:0:0:0:0:0:0:1', '2018-02-10 15:20:27');
INSERT INTO `sys_log` VALUES ('732', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518247362596&', '0:0:0:0:0:0:0:1', '2018-02-10 15:22:45');
INSERT INTO `sys_log` VALUES ('733', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518247427667&', '0:0:0:0:0:0:0:1', '2018-02-10 15:23:50');
INSERT INTO `sys_log` VALUES ('734', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518247514044&', '0:0:0:0:0:0:0:1', '2018-02-10 15:25:16');
INSERT INTO `sys_log` VALUES ('735', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518247649271&', '0:0:0:0:0:0:0:1', '2018-02-10 15:27:31');
INSERT INTO `sys_log` VALUES ('736', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518247745657&', '0:0:0:0:0:0:0:1', '2018-02-10 15:29:08');
INSERT INTO `sys_log` VALUES ('737', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518248552354&', '0:0:0:0:0:0:0:1', '2018-02-10 15:42:34');
INSERT INTO `sys_log` VALUES ('738', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518248633831&', '0:0:0:0:0:0:0:1', '2018-02-10 15:43:56');
INSERT INTO `sys_log` VALUES ('739', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1518248727883&', '0:0:0:0:0:0:0:1', '2018-02-10 15:45:30');
INSERT INTO `sys_log` VALUES ('740', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1519181467198&', '0:0:0:0:0:0:0:1', '2018-02-21 10:51:13');
INSERT INTO `sys_log` VALUES ('741', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1519182262588&', '0:0:0:0:0:0:0:1', '2018-02-21 11:04:25');
INSERT INTO `sys_log` VALUES ('742', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1519182438835&', '0:0:0:0:0:0:0:1', '2018-02-21 11:07:21');
INSERT INTO `sys_log` VALUES ('743', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1519183134567&', '0:0:0:0:0:0:0:1', '2018-02-21 11:18:57');
INSERT INTO `sys_log` VALUES ('744', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1519183515377&', '0:0:0:0:0:0:0:1', '2018-02-21 11:25:18');
INSERT INTO `sys_log` VALUES ('745', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1519183978898&', '0:0:0:0:0:0:0:1', '2018-02-21 11:33:04');
INSERT INTO `sys_log` VALUES ('746', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1519185832962&', '0:0:0:0:0:0:0:1', '2018-02-21 12:03:57');
INSERT INTO `sys_log` VALUES ('747', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1519185863231&', '0:0:0:0:0:0:0:1', '2018-02-21 12:04:25');
INSERT INTO `sys_log` VALUES ('748', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1519194898771&', '0:0:0:0:0:0:0:1', '2018-02-21 14:35:03');
INSERT INTO `sys_log` VALUES ('749', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1519195231225&', '0:0:0:0:0:0:0:1', '2018-02-21 14:40:33');
INSERT INTO `sys_log` VALUES ('750', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1519196242690&', '0:0:0:0:0:0:0:1', '2018-02-21 14:57:29');
INSERT INTO `sys_log` VALUES ('751', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1519196615212&', '0:0:0:0:0:0:0:1', '2018-02-21 15:03:38');
INSERT INTO `sys_log` VALUES ('752', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:add,[参数]:orderDate=2018-02-21&customerName=1&mobile=请仔细核对货物型号和数量，如果有误请于3日内提出，并出具证明，协商解决。&address=&itemJSONStr=[{\"itemNo\":\"a\",\"title\":\"c\",\"itemUnit\":\"zhi\",\"num\":\"1\",\"price\":\"2.00\",\"totalFee\":\"2.00\",\"description\":\"222\"}]&', '0:0:0:0:0:0:0:1', '2018-02-21 15:06:18');
INSERT INTO `sys_log` VALUES ('753', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1519196964445&', '0:0:0:0:0:0:0:1', '2018-02-21 15:09:27');
INSERT INTO `sys_log` VALUES ('754', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:add,[参数]:orderDate=2018-02-21&customerName=1&customerId=1&mobile=请仔细核对货物型号和数量，如果有误请于3日内提出，并出具证明，协商解决。&address=&itemJSONStr=[{\"itemNo\":\"a\",\"title\":\"b\",\"itemUnit\":\"zhi\",\"num\":\"1\",\"price\":\"2.00\",\"totalFee\":\"2.00\",\"description\":\"2\"}]&', '0:0:0:0:0:0:0:1', '2018-02-21 15:09:51');
INSERT INTO `sys_log` VALUES ('755', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1519198926400&', '0:0:0:0:0:0:0:1', '2018-02-21 15:42:09');
INSERT INTO `sys_log` VALUES ('756', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1519199937893&', '0:0:0:0:0:0:0:1', '2018-02-21 15:59:01');
INSERT INTO `sys_log` VALUES ('757', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:add,[参数]:orderDate=2018-02-21&customerName=1&customerId=1&mobile=请仔细核对货物型号和数量，如果有误请于3日内提出，并出具证明，协商解决。&address=阳江市江城区新江北路1273号&telephone=0662-2663196&salesman=aa&prepareDocument=bb&audit=cc&itemJSONStr=[{\"itemNo\":\"a\",\"title\":\" b\",\"itemUnit\":\"zhi\",\"num\":\"1\",\"price\":\"2.00\",\"totalFee\":\"2.00\",\"description\":\"ss\"}]&', '0:0:0:0:0:0:0:1', '2018-02-21 15:59:30');
INSERT INTO `sys_log` VALUES ('758', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:add,[参数]:orderDate=2018-02-21&customerName=1&customerId=1&mobile=请仔细核对货物型号和数量，如果有误请于3日内提出，并出具证明，协商解决。&address=阳江市江城区新江北路1273号&telephone=0662-2663196&salesman=aa&prepareDocument=bb&audit=cc&itemJSONStr=[{\"itemNo\":\"a\",\"title\":\" b\",\"itemUnit\":\"zhi\",\"num\":\"1\",\"price\":\"2.00\",\"totalFee\":\"2.00\",\"description\":\"ss\"}]&', '0:0:0:0:0:0:0:1', '2018-02-21 16:01:58');
INSERT INTO `sys_log` VALUES ('759', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1519200242942&', '0:0:0:0:0:0:0:1', '2018-02-21 16:04:05');
INSERT INTO `sys_log` VALUES ('760', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:add,[参数]:orderDate=2018-02-21&customerName=2&customerId=2&mobile=请仔细核对货物型号和数量，如果有误请于3日内提出，并出具证明，协商解决。&address=阳江市江城区新江北路1273号&telephone=0662-2663196&salesman=a&prepareDocument=b&audit=c&itemJSONStr=[{\"itemNo\":\"001\",\"title\":\"磨刀石\",\"itemUnit\":\"zhi\",\"num\":\"1\",\"price\":\"200.00\",\"totalFee\":\"200.00\",\"description\":\"\"}]&', '0:0:0:0:0:0:0:1', '2018-02-21 16:04:54');
INSERT INTO `sys_log` VALUES ('761', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1519200368028&', '0:0:0:0:0:0:0:1', '2018-02-21 16:06:10');
INSERT INTO `sys_log` VALUES ('762', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:add,[参数]:orderDate=2018-02-21&customerName=2&customerId=2&description=请仔细核对货物型号和数量，如果有误请于3日内提出，并出具证明，协商解决。&address=阳江市江城区新江北路1273号&telephone=0662-2663196&mobile=13664998169&salesman=a&prepareDocument=b&audit=c&itemJSONStr=[{\"itemNo\":\"001\",\"title\":\"磨刀石\",\"itemUnit\":\"zhi\",\"num\":\"1\",\"price\":\"222.00\",\"totalFee\":\"222.00\",\"description\":\"\"}]&', '0:0:0:0:0:0:0:1', '2018-02-21 16:06:47');
INSERT INTO `sys_log` VALUES ('763', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:add,[参数]:orderDate=2018-02-21&customerName=2&customerId=2&description=请仔细核对货物型号和数量，如果有误请于3日内提出，并出具证明，协商解决。&address=阳江市江城区新江北路1273号&telephone=0662-2663196&mobile=13664998169&salesman=a&prepareDocument=b&audit=c&itemJSONStr=[{\"itemNo\":\"001\",\"title\":\"磨刀石\",\"itemUnit\":\"zhi\",\"num\":\"1\",\"price\":\"222.00\",\"totalFee\":\"222.00\",\"description\":\"\"}]&', '0:0:0:0:0:0:0:1', '2018-02-21 16:07:31');
INSERT INTO `sys_log` VALUES ('764', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:add,[参数]:orderDate=2018-02-21&customerName=2&customerId=2&description=请仔细核对货物型号和数量，如果有误请于3日内提出，并出具证明，协商解决。&address=阳江市江城区新江北路1273号&telephone=0662-2663196&mobile=13664998169&salesman=a&prepareDocument=b&audit=c&itemJSONStr=[{\"itemNo\":\"001\",\"title\":\"磨刀石\",\"itemUnit\":\"zhi\",\"num\":\"1\",\"price\":\"222.00\",\"totalFee\":\"222.00\",\"description\":\"\"}]&', '0:0:0:0:0:0:0:1', '2018-02-21 16:13:59');
INSERT INTO `sys_log` VALUES ('765', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:editPage,[参数]:id=4&_=1522313205409&', '0:0:0:0:0:0:0:1', '2018-03-29 16:47:48');
INSERT INTO `sys_log` VALUES ('766', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:addPage,[参数]:_=1522313205410&', '0:0:0:0:0:0:0:1', '2018-03-29 16:48:02');
INSERT INTO `sys_log` VALUES ('767', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrderController,[方法]:add,[参数]:orderDate=2018-03-06&customerName=1&customerId=1&description=请仔细核对货物型号和数量，如果有误请于3日内提出，并出具证明，协商解决。&address=阳江市江城区新江北路1273号&telephone=0662-2663196&mobile=13664998169&salesman=b&prepareDocument=c&audit=d&itemJSONStr=[{\"itemNo\":\"a\",\"title\":\"b\",\"itemUnit\":\"zhi\",\"num\":\"1\",\"price\":\"2.00\",\"totalFee\":\"2.00\",\"description\":\"\"}]&', '0:0:0:0:0:0:0:1', '2018-03-29 16:48:44');

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(100) DEFAULT NULL COMMENT '单号：年月日+四位流水号',
  `order_date` date DEFAULT NULL COMMENT '订单日期',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `description` varchar(500) DEFAULT NULL COMMENT '备注',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `telephone` varchar(20) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(11) DEFAULT NULL COMMENT '手机',
  `salesman` varchar(255) DEFAULT NULL COMMENT '业务员',
  `prepare_document` varchar(255) DEFAULT NULL COMMENT '制单',
  `audit` varchar(255) DEFAULT NULL COMMENT '审核员',
  `signfor` varchar(255) DEFAULT NULL COMMENT '签收',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('4', '201802210001', '2018-02-21', '2', '请仔细核对货物型号和数量，如果有误请于3日内提出，并出具证明，协商解决。', '阳江市江城区新江北路1273号', '0662-2663196', '13664998169', 'a', 'b', 'c', null, '2018-02-21 16:14:05');
INSERT INTO `tb_order` VALUES ('5', '201803290002', '2018-03-06', '1', '请仔细核对货物型号和数量，如果有误请于3日内提出，并出具证明，协商解决。', '阳江市江城区新江北路1273号', '0662-2663196', '13664998169', 'b', 'c', 'd', null, '2018-03-29 16:48:59');

-- ----------------------------
-- Table structure for tb_unit
-- ----------------------------
DROP TABLE IF EXISTS `tb_unit`;
CREATE TABLE `tb_unit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `unit_code` varchar(100) DEFAULT NULL COMMENT '单位编码',
  `unit_name` varchar(10) DEFAULT NULL COMMENT '单位名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='单位';

-- ----------------------------
-- Records of tb_unit
-- ----------------------------
INSERT INTO `tb_unit` VALUES ('1', 'zhi', '只');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `login_name` varchar(64) NOT NULL COMMENT '登陆名',
  `name` varchar(64) NOT NULL COMMENT '用户名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `salt` varchar(36) DEFAULT NULL COMMENT '密码加密盐',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别',
  `age` tinyint(2) DEFAULT '0' COMMENT '年龄',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `user_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '用户类别',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '用户状态',
  `organization_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属机构',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDx_user_login_name` (`login_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '05a671c66aefea124cc08b76ea6d30bb', 'test', '0', '25', '18707173376', '0', '0', '1', '2015-12-06 13:14:05');
INSERT INTO `user` VALUES ('13', 'snoopy', 'snoopy', '05a671c66aefea124cc08b76ea6d30bb', 'test', '0', '25', '18707173376', '1', '0', '3', '2015-10-01 13:12:07');
INSERT INTO `user` VALUES ('14', 'dreamlu', 'dreamlu', '05a671c66aefea124cc08b76ea6d30bb', 'test', '0', '25', '18707173376', '1', '0', '5', '2015-10-11 23:12:58');
INSERT INTO `user` VALUES ('15', 'test', 'test', '05a671c66aefea124cc08b76ea6d30bb', 'test', '0', '25', '18707173376', '1', '0', '6', '2015-12-06 13:13:03');
INSERT INTO `user` VALUES ('16', 'testCompany', '测试公司管理理', '799ce5fec6cb8e08c06553f670049a57', '7bc2c018-c391-46a6-ba25-9dfc3f8bf965', '0', '0', '', '1', '0', '7', '2018-01-04 17:07:22');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` bigint(19) NOT NULL COMMENT '用户id',
  `role_id` bigint(19) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`),
  KEY `idx_user_role_ids` (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='用户角色';

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('60', '1', '1');
INSERT INTO `user_role` VALUES ('61', '1', '2');
INSERT INTO `user_role` VALUES ('62', '1', '7');
INSERT INTO `user_role` VALUES ('65', '1', '8');
INSERT INTO `user_role` VALUES ('63', '13', '2');
INSERT INTO `user_role` VALUES ('64', '14', '7');
INSERT INTO `user_role` VALUES ('53', '15', '8');
INSERT INTO `user_role` VALUES ('66', '16', '9');
