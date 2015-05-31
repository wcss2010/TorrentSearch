/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tsh

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2015-05-31 15:19:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `msc_perm`
-- ----------------------------
DROP TABLE IF EXISTS `msc_perm`;
CREATE TABLE `msc_perm` (
  `id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '菜单所属的上级ID',
  `perm_type` int(11) DEFAULT NULL COMMENT '0.是菜单项，1是api',
  `perm_name` varchar(100) DEFAULT NULL COMMENT '权限的名称',
  `perm_desc` varchar(1000) DEFAULT NULL COMMENT '权限的描述',
  `child_num` int(11) DEFAULT NULL COMMENT '拥有子元素的个数',
  `action_url` varchar(120) DEFAULT NULL COMMENT '权限执行的url目录',
  `menu_layer` int(11) DEFAULT NULL COMMENT '单位目录层次深度',
  `menu_path` varchar(50) DEFAULT NULL COMMENT '单位层次路径',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_date` datetime DEFAULT NULL COMMENT '最后一次的修改时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of msc_perm
-- ----------------------------
INSERT INTO `msc_perm` VALUES ('1', '0', '0', '平台信息管理模块', '基础信息管理模块', '14', 'base', '0', '002000000000000000', null, '2014-11-26 15:04:42', '1');
INSERT INTO `msc_perm` VALUES ('9', '0', '0', '系统设置模块', '系统设置模块', '6', 'sys', '0', '004000000000000000', null, '2014-10-15 18:42:38', '1');
INSERT INTO `msc_perm` VALUES ('10', '9', '0', '系统设置', '系统设置', '0', '/sys/sysConf', '1', '004001000000000000', null, '2013-12-20 16:23:36', '1');
INSERT INTO `msc_perm` VALUES ('11', '9', '0', '系统授权信息', '系统授权信息', '0', '/sys/displayLicense', '1', '004002000000000000', null, '2013-12-20 16:24:10', '1');
INSERT INTO `msc_perm` VALUES ('13', '28', '0', '鉴权信息管理', '鉴权信息管理', '0', '/msc/actionLog', '1', '001004000000000000', null, '2014-10-14 17:57:28', '1');
INSERT INTO `msc_perm` VALUES ('21', '0', '0', '系统报表支持模块', '系统报表支持模块', '13', 'report', '0', '003000000000000000', null, '2013-12-20 16:24:17', '1');
INSERT INTO `msc_perm` VALUES ('28', '0', '0', '平台管理账户', '平台管理账户', '7', 'msc', '0', '001001000000000000', null, '2014-11-24 16:05:48', '1');
INSERT INTO `msc_perm` VALUES ('29', '28', '0', '平台管理用户', '管理用户权限、删除、冻结、编辑等操作', '0', '/msc/user', '1', '001001000000000000', null, '2014-11-26 15:01:44', '1');
INSERT INTO `msc_perm` VALUES ('31', '28', '0', 'WEB在线用户管理', '在线用户管理', '0', '/msc/userOnline', '1', '001003000000000000', null, '2013-08-01 15:31:21', '1');
INSERT INTO `msc_perm` VALUES ('32', '28', '0', 'WEB权限管理', 'WEB权限管理', '0', '/msc/webPerm', '1', '001004000000000000', null, '2013-08-14 20:41:31', '1');
INSERT INTO `msc_perm` VALUES ('33', '0', '0', '我的信息', '查看个人信息', '2', 'my', '0', '005000000000000000', null, '2013-12-20 16:25:35', '1');
INSERT INTO `msc_perm` VALUES ('34', '33', '0', '修改个人信息', '修改个人信息', '0', '/my/myInfo', '1', '005001000000000000', null, '2013-12-20 16:25:51', '1');
INSERT INTO `msc_perm` VALUES ('35', '33', '0', '修改个人密码', '修改个人密码', '0', '/my/modifyPasswd', '1', '005002000000000000', null, '2013-12-20 16:26:00', '1');
INSERT INTO `msc_perm` VALUES ('152', '21', '0', '系统运行图', '系统运行图', '0', '/report/sys', '1', '003001000000000000', '2014-11-26 15:13:31', '2014-11-26 15:13:31', '1');
INSERT INTO `msc_perm` VALUES ('154', '21', '0', '用户在线状态', '用户在线状态', '0', '/report/user', '1', '003002000000000000', '2014-11-26 15:14:16', '2014-11-26 16:37:01', '1');
INSERT INTO `msc_perm` VALUES ('160', '1', '0', '用户帐号管理', '用户帐号管理', '0', '/base/user', '1', '002001000000000000', '2014-11-26 16:30:22', '2015-02-02 11:28:48', '1');
INSERT INTO `msc_perm` VALUES ('162', '1', '0', '聚合搜索管理', '聚合搜索管理', '0', '/base/search', '1', '002002000000000000', '2015-04-12 01:02:10', '2015-04-12 01:03:49', '1');
INSERT INTO `msc_perm` VALUES ('163', '1', '0', '消息管理', '消息管理', '0', '/base/msg', '1', '002003000000000000', '2015-04-12 01:03:21', null, '1');

-- ----------------------------
-- Table structure for `msc_user`
-- ----------------------------
DROP TABLE IF EXISTS `msc_user`;
CREATE TABLE `msc_user` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `username` varchar(100) DEFAULT NULL COMMENT '登录的用户名',
  `passwd` varchar(100) DEFAULT NULL COMMENT '登录的密码',
  `msc_perm` varchar(1000) DEFAULT NULL COMMENT '对应菜单权限',
  `org_perm` varchar(1000) DEFAULT NULL COMMENT '可管理单位的权限',
  `org_name` varchar(100) DEFAULT NULL COMMENT '单位名称',
  `alias_name` varchar(20) DEFAULT NULL COMMENT '联系人',
  `telephone` varchar(20) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机',
  `email` varchar(120) DEFAULT NULL COMMENT 'Email',
  `last_logon_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `last_logon_ip` varchar(20) DEFAULT NULL COMMENT '最后登录IP',
  `create_date` datetime DEFAULT NULL COMMENT '建立时间',
  `modify_date` datetime DEFAULT NULL COMMENT '最后修改时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of msc_user
-- ----------------------------
INSERT INTO `msc_user` VALUES ('0', 'admin', '596b233069bad4bae2e834cbe6fe6e8e', '*', '', 'aaa', '444', '010-1234567', '15111111444', '4n@123.com', '2015-04-12 22:24:02', '192.168.128.100', null, '2015-01-26 10:33:20', '1');

-- ----------------------------
-- Table structure for `ngn_msg`
-- ----------------------------
DROP TABLE IF EXISTS `ngn_msg`;
CREATE TABLE `ngn_msg` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'ID',
  `userId` bigint(20) DEFAULT NULL COMMENT '发送者ID',
  `toUserId` bigint(20) DEFAULT NULL COMMENT '接收者ID',
  `msg` varchar(500) DEFAULT NULL COMMENT '消息内容',
  `sendDate` datetime DEFAULT NULL COMMENT '发送日期',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ngn_msg
-- ----------------------------
INSERT INTO `ngn_msg` VALUES ('1', '10000', '333', '14414', '2015-04-12 01:54:26', '-1');
INSERT INTO `ngn_msg` VALUES ('3', '10000', '0', '焰火磁力聚合搜索1.0版本上线，这个版本算是完成了基本的功能吧，有问题欢迎提出来！', '2015-04-12 09:34:22', '1');

-- ----------------------------
-- Table structure for `ngn_say`
-- ----------------------------
DROP TABLE IF EXISTS `ngn_say`;
CREATE TABLE `ngn_say` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `userSay` varchar(500) DEFAULT NULL,
  `sysCmd` varchar(300) DEFAULT NULL,
  `cmdContent` varchar(1000) DEFAULT NULL,
  `cmdP1` varchar(300) DEFAULT NULL,
  `cmdP2` varchar(300) DEFAULT NULL,
  `cmdP3` varchar(300) DEFAULT NULL,
  `cmdP4` varchar(300) DEFAULT NULL,
  `cmdP5` varchar(300) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ngn_say
-- ----------------------------

-- ----------------------------
-- Table structure for `ngn_search`
-- ----------------------------
DROP TABLE IF EXISTS `ngn_search`;
CREATE TABLE `ngn_search` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `sname` varchar(100) DEFAULT NULL COMMENT '名称',
  `searchUrl` varchar(500) DEFAULT NULL COMMENT '搜索引擎URL关键字部分以{key}为占位符,如果是需要中文转译的关键字则是用{ekey}为占位符',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ngn_search
-- ----------------------------
INSERT INTO `ngn_search` VALUES ('8', '10000', '手撕包菜', 'http://www.shousibaocai.com/list/{SKey}/1', '1');
INSERT INTO `ngn_search` VALUES ('9', '10000', 'BT樱桃', 'http://www.btcherry.com/search?keyword={SKey}', '1');

-- ----------------------------
-- Table structure for `ngn_timer`
-- ----------------------------
DROP TABLE IF EXISTS `ngn_timer`;
CREATE TABLE `ngn_timer` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `timerType` tinyint(1) DEFAULT NULL,
  `timer` datetime DEFAULT NULL,
  `timerUrl` varchar(200) DEFAULT NULL,
  `p1` varchar(200) DEFAULT NULL,
  `p2` varchar(200) DEFAULT NULL,
  `p3` varchar(200) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ngn_timer
-- ----------------------------

-- ----------------------------
-- Table structure for `ngn_user`
-- ----------------------------
DROP TABLE IF EXISTS `ngn_user`;
CREATE TABLE `ngn_user` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'ID',
  `user_type` tinyint(1) DEFAULT '1' COMMENT '用户类型，0VIP用户，1普通用户',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `passwd` varchar(50) DEFAULT NULL COMMENT '密码',
  `mobile` varchar(15) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(100) DEFAULT NULL COMMENT 'Email地址',
  `alias_name` varchar(50) DEFAULT NULL COMMENT '昵称',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `age` tinyint(2) DEFAULT NULL COMMENT '年龄',
  `gender` tinyint(1) DEFAULT NULL COMMENT '性别(0女1男)',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `school` varchar(50) DEFAULT NULL COMMENT '学校',
  `company` varchar(50) DEFAULT NULL COMMENT '公司',
  `occupation` varchar(50) DEFAULT NULL COMMENT '职业',
  `industry` varchar(50) DEFAULT NULL COMMENT '行业',
  `user_point` int(11) DEFAULT NULL COMMENT '用户积分',
  `last_logon_date` datetime DEFAULT NULL COMMENT '上次登录时间',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_date` datetime DEFAULT NULL COMMENT '修改时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ngn_user
-- ----------------------------
INSERT INTO `ngn_user` VALUES ('2', '1', '00000000000', 'b6ae0aa4981ec6a9bf8b6a40b20eaf66', '13333333333', '3@3.com', 'User001', null, null, null, null, null, null, null, null, null, null, '2015-01-25 17:28:19', '2015-03-24 19:31:09', '-1');
INSERT INTO `ngn_user` VALUES ('4', '0', 'bjadmin', '0cd5abe174e0c89bc56273ca726830ce', '13333333333', '3@3.com', 'BJ Node Admin', null, null, null, null, null, null, null, null, '666666', null, '2015-02-02 12:09:44', '2015-04-12 00:47:46', '1');
INSERT INTO `ngn_user` VALUES ('5', '0', '11111111111', 'b6ae0aa4981ec6a9bf8b6a40b20eaf66', '13333333333', '3@3.com', 'user02', null, null, null, null, null, null, null, null, '333333', null, '2015-02-09 20:09:24', '2015-04-12 00:51:03', '1');
INSERT INTO `ngn_user` VALUES ('6', '1', '22222222222', 'b6ae0aa4981ec6a9bf8b6a40b20eaf66', '13333333333', '3@e.com', '22222', null, null, null, null, null, null, null, null, null, null, '2015-04-03 15:56:23', '2015-04-09 00:25:46', '-1');
INSERT INTO `ngn_user` VALUES ('8', '1', '44444444444', 'b6ae0aa4981ec6a9bf8b6a40b20eaf66', '13333333333', '3@e.com', '4444333', null, '0', '0', '', '', '', '', '', '5555', null, '2015-04-09 19:36:08', '2015-04-12 00:49:34', '1');
INSERT INTO `ngn_user` VALUES ('9', '1', '88888', 'b6ae0aa4981ec6a9bf8b6a40b20eaf66', '13333333333', 'e@q.com', '88888', null, '0', '0', '', '', '', '', '', '88888', null, '2015-04-12 00:51:29', null, '1');

-- ----------------------------
-- Table structure for `sys_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_action_log`;
CREATE TABLE `sys_action_log` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL COMMENT '操作的用户',
  `action_type` tinyint(4) DEFAULT NULL COMMENT '操作类型。1.访问日志 2.操作日志',
  `action_module` varchar(10) DEFAULT NULL COMMENT '操作的模块',
  `action_command` varchar(20) DEFAULT NULL COMMENT '操作的指令',
  `action_body` varchar(500) DEFAULT NULL COMMENT '操作的内容',
  `action_ip` varchar(20) DEFAULT NULL COMMENT '操作的IP',
  `action_date` datetime DEFAULT NULL COMMENT '操作的日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_action_log_201504`
-- ----------------------------
DROP TABLE IF EXISTS `sys_action_log_201504`;
CREATE TABLE `sys_action_log_201504` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `action_type` tinyint(4) DEFAULT NULL COMMENT '操作类型',
  `action_module` varchar(100) DEFAULT NULL COMMENT '操作的模块',
  `action_command` varchar(20) DEFAULT NULL COMMENT '操作的指令',
  `action_body` varchar(500) DEFAULT NULL COMMENT '操作的内容',
  `action_ip` varchar(20) DEFAULT NULL COMMENT '操作的ip地址',
  `action_date` datetime DEFAULT NULL COMMENT '操作的日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_action_log_201504
-- ----------------------------
INSERT INTO `sys_action_log_201504` VALUES ('8686', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 09:28:38');
INSERT INTO `sys_action_log_201504` VALUES ('8687', '0', '1', '/workspace/welcome.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/workspace/welcome.jsp\n页面参数为：\n来源页面:http://192.168.128.100:8080/workspace/', '192.168.128.100', '2015-04-12 09:28:49');
INSERT INTO `sys_action_log_201504` VALUES ('8688', '0', '1', '/my/modifyPasswd', '', '当前访问的页面是:http://192.168.128.100:8080/modules/my/modifyPasswd/\n页面参数为：\n来源页面:http://192.168.128.100:8080/workspace/menu.jsp', '192.168.128.100', '2015-04-12 09:28:53');
INSERT INTO `sys_action_log_201504` VALUES ('8689', '0', '1', '/my/modifyPasswd', '', '当前访问的页面是:http://192.168.128.100:8080/modules/my/modifyPasswd/\n页面参数为：\n来源页面:http://192.168.128.100:8080/workspace/menu.jsp', '192.168.128.100', '2015-04-12 09:32:23');
INSERT INTO `sys_action_log_201504` VALUES ('8690', '0', '2', '/my/modifyPasswd', '修改密码', 'admin修改了密码,操作人为：admin', '192.168.128.100', '2015-04-12 09:32:34');
INSERT INTO `sys_action_log_201504` VALUES ('8691', '0', '1', '/my/modifyPasswd', '', '当前访问的页面是:http://192.168.128.100:8080/modules/my/modifyPasswd/\n页面参数为：\n来源页面:http://192.168.128.100:8080/workspace/menu.jsp', '192.168.128.100', '2015-04-12 09:32:37');
INSERT INTO `sys_action_log_201504` VALUES ('8692', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 09:33:15');
INSERT INTO `sys_action_log_201504` VALUES ('8693', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keyword= 狼图腾\n来源页面:http://192.168.128.100:8080/', '192.168.128.100', '2015-04-12 09:33:19');
INSERT INTO `sys_action_log_201504` VALUES ('8694', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword= 狼图腾\n来源页面:http://192.168.128.100:8080/btSearch.jsp?keyword=%20%E7%8B%BC%E5%9B%BE%E8%85%BE', '192.168.128.100', '2015-04-12 09:33:19');
INSERT INTO `sys_action_log_201504` VALUES ('8695', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword= 狼图腾\n来源页面:http://192.168.128.100:8080/btSearch.jsp?keyword=%20%E7%8B%BC%E5%9B%BE%E8%85%BE', '192.168.128.100', '2015-04-12 09:33:19');
INSERT INTO `sys_action_log_201504` VALUES ('8696', '0', '1', '/base/msg', '', '当前访问的页面是:http://192.168.128.100:8080/modules/base/msg/\n页面参数为：\n来源页面:http://192.168.128.100:8080/workspace/menu.jsp', '192.168.128.100', '2015-04-12 09:34:14');
INSERT INTO `sys_action_log_201504` VALUES ('8697', '0', '1', '/base/msg', '', '当前访问的页面是:http://192.168.128.100:8080/modules/base/msg/modify.jsp\n页面参数为：id=3&t=1428802456258\n来源页面:http://192.168.128.100:8080/modules/base/msg/', '192.168.128.100', '2015-04-12 09:34:16');
INSERT INTO `sys_action_log_201504` VALUES ('8698', '0', '2', '/base/msg', '修改NgnMsg', '操作人：admin，修改了NgnMsg数据，ID为：3，内容为：\r\n************************************\r\n表NgnMsg，主键\"3\"变更信息为:\r\n字段msg由\"fdsfsdafaf\"修改为\"焰火磁力聚合搜索1.0版本上线，这个版本算是完成了基本的功能吧，有问题欢迎提出来！\"\r\n字段senddate由\"2015-04-12 02:10:07.0\"修改为\"Sun Apr 12 09:34:22 CST 2015\"\r\n************************************\r\n\r\n操作成功！', '192.168.128.100', '2015-04-12 09:34:22');
INSERT INTO `sys_action_log_201504` VALUES ('8699', '0', '1', '/base/msg', '', '当前访问的页面是:http://192.168.128.100:8080/modules/base/msg/\n页面参数为：\n来源页面:http://192.168.128.100:8080/modules/base/msg/', '192.168.128.100', '2015-04-12 09:34:23');
INSERT INTO `sys_action_log_201504` VALUES ('8700', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keyword= 狼图腾\n来源页面:http://192.168.128.100:8080/', '192.168.128.100', '2015-04-12 09:34:30');
INSERT INTO `sys_action_log_201504` VALUES ('8701', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword= 狼图腾\n来源页面:http://192.168.128.100:8080/btSearch.jsp?keyword=%20%E7%8B%BC%E5%9B%BE%E8%85%BE', '192.168.128.100', '2015-04-12 09:34:30');
INSERT INTO `sys_action_log_201504` VALUES ('8702', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword= 狼图腾\n来源页面:http://192.168.128.100:8080/btSearch.jsp?keyword=%20%E7%8B%BC%E5%9B%BE%E8%85%BE', '192.168.128.100', '2015-04-12 09:34:30');
INSERT INTO `sys_action_log_201504` VALUES ('8703', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keyword= 狼图腾\n来源页面:http://192.168.128.100:8080/', '192.168.128.100', '2015-04-12 09:34:58');
INSERT INTO `sys_action_log_201504` VALUES ('8704', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword= 狼图腾\n来源页面:http://192.168.128.100:8080/btSearch.jsp?keyword=%20%E7%8B%BC%E5%9B%BE%E8%85%BE', '192.168.128.100', '2015-04-12 09:34:58');
INSERT INTO `sys_action_log_201504` VALUES ('8705', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword= 狼图腾\n来源页面:http://192.168.128.100:8080/btSearch.jsp?keyword=%20%E7%8B%BC%E5%9B%BE%E8%85%BE', '192.168.128.100', '2015-04-12 09:34:58');
INSERT INTO `sys_action_log_201504` VALUES ('8706', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 09:54:51');
INSERT INTO `sys_action_log_201504` VALUES ('8707', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：\n来源页面:http://192.168.128.100:8080/', '192.168.128.100', '2015-04-12 09:55:03');
INSERT INTO `sys_action_log_201504` VALUES ('8708', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 09:55:04');
INSERT INTO `sys_action_log_201504` VALUES ('8709', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 09:55:04');
INSERT INTO `sys_action_log_201504` VALUES ('8710', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：\n来源页面:http://192.168.128.100:8080/', '192.168.128.100', '2015-04-12 09:55:49');
INSERT INTO `sys_action_log_201504` VALUES ('8711', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 09:55:49');
INSERT INTO `sys_action_log_201504` VALUES ('8712', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 09:55:49');
INSERT INTO `sys_action_log_201504` VALUES ('8713', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 09:56:33');
INSERT INTO `sys_action_log_201504` VALUES ('8714', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keyword=全\n来源页面:http://192.168.128.100:8080/', '192.168.128.100', '2015-04-12 09:56:38');
INSERT INTO `sys_action_log_201504` VALUES ('8715', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=全\n来源页面:http://192.168.128.100:8080/btSearch.jsp?keyword=%E5%85%A8', '192.168.128.100', '2015-04-12 09:56:38');
INSERT INTO `sys_action_log_201504` VALUES ('8716', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=全\n来源页面:http://192.168.128.100:8080/btSearch.jsp?keyword=%E5%85%A8', '192.168.128.100', '2015-04-12 09:56:38');
INSERT INTO `sys_action_log_201504` VALUES ('8717', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 09:57:13');
INSERT INTO `sys_action_log_201504` VALUES ('8718', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keyword=肯\n来源页面:http://192.168.128.100:8080/', '192.168.128.100', '2015-04-12 09:57:18');
INSERT INTO `sys_action_log_201504` VALUES ('8719', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=肯\n来源页面:http://192.168.128.100:8080/btSearch.jsp?keyword=%E8%82%AF', '192.168.128.100', '2015-04-12 09:57:18');
INSERT INTO `sys_action_log_201504` VALUES ('8720', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=肯\n来源页面:http://192.168.128.100:8080/btSearch.jsp?keyword=%E8%82%AF', '192.168.128.100', '2015-04-12 09:57:18');
INSERT INTO `sys_action_log_201504` VALUES ('8721', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 09:58:27');
INSERT INTO `sys_action_log_201504` VALUES ('8722', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keyword=哈\n来源页面:http://192.168.128.100:8080/', '192.168.128.100', '2015-04-12 09:58:32');
INSERT INTO `sys_action_log_201504` VALUES ('8723', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=哈\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 09:58:32');
INSERT INTO `sys_action_log_201504` VALUES ('8724', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=哈\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 09:58:32');
INSERT INTO `sys_action_log_201504` VALUES ('8725', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 10:00:07');
INSERT INTO `sys_action_log_201504` VALUES ('8726', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keyword=哈哈\n来源页面:http://192.168.128.100:8080/', '192.168.128.100', '2015-04-12 10:00:15');
INSERT INTO `sys_action_log_201504` VALUES ('8727', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=哈哈\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:00:15');
INSERT INTO `sys_action_log_201504` VALUES ('8728', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=哈哈\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:00:15');
INSERT INTO `sys_action_log_201504` VALUES ('8729', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 10:22:22');
INSERT INTO `sys_action_log_201504` VALUES ('8730', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 10:24:03');
INSERT INTO `sys_action_log_201504` VALUES ('8731', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keywords=飓风营救3\n来源页面:http://192.168.128.100:8080/', '192.168.128.100', '2015-04-12 10:24:10');
INSERT INTO `sys_action_log_201504` VALUES ('8732', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=\n来源页面:http://192.168.128.100:8080/btSearch.jsp?keywords=%E9%A3%93%E9%A3%8E%E8%90%A5%E6%95%913', '192.168.128.100', '2015-04-12 10:24:10');
INSERT INTO `sys_action_log_201504` VALUES ('8733', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=\n来源页面:http://192.168.128.100:8080/btSearch.jsp?keywords=%E9%A3%93%E9%A3%8E%E8%90%A5%E6%95%913', '192.168.128.100', '2015-04-12 10:24:10');
INSERT INTO `sys_action_log_201504` VALUES ('8734', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keyword=fdfdfa\n来源页面:http://192.168.128.100:8080/', '192.168.128.100', '2015-04-12 10:29:47');
INSERT INTO `sys_action_log_201504` VALUES ('8735', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=fdfdfa\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:29:48');
INSERT INTO `sys_action_log_201504` VALUES ('8736', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=fdfdfa\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:29:48');
INSERT INTO `sys_action_log_201504` VALUES ('8737', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keyword=哈\n来源页面:http://192.168.128.100:8080/', '192.168.128.100', '2015-04-12 10:30:04');
INSERT INTO `sys_action_log_201504` VALUES ('8738', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=哈\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:30:04');
INSERT INTO `sys_action_log_201504` VALUES ('8739', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=哈\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:30:04');
INSERT INTO `sys_action_log_201504` VALUES ('8740', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 10:37:07');
INSERT INTO `sys_action_log_201504` VALUES ('8741', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keyword=全哈哈\n来源页面:http://192.168.128.100:8080/', '192.168.128.100', '2015-04-12 10:37:17');
INSERT INTO `sys_action_log_201504` VALUES ('8742', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=???\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:37:18');
INSERT INTO `sys_action_log_201504` VALUES ('8743', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=???\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:37:18');
INSERT INTO `sys_action_log_201504` VALUES ('8744', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keywords=战狼\n来源页面:http://192.168.128.100:8080/', '192.168.128.100', '2015-04-12 10:37:27');
INSERT INTO `sys_action_log_201504` VALUES ('8745', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=\n来源页面:http://192.168.128.100:8080/btSearch.jsp?keywords=%E6%88%98%E7%8B%BC', '192.168.128.100', '2015-04-12 10:37:27');
INSERT INTO `sys_action_log_201504` VALUES ('8746', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=\n来源页面:http://192.168.128.100:8080/btSearch.jsp?keywords=%E6%88%98%E7%8B%BC', '192.168.128.100', '2015-04-12 10:37:27');
INSERT INTO `sys_action_log_201504` VALUES ('8747', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 10:37:40');
INSERT INTO `sys_action_log_201504` VALUES ('8748', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 10:38:31');
INSERT INTO `sys_action_log_201504` VALUES ('8749', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 10:38:32');
INSERT INTO `sys_action_log_201504` VALUES ('8750', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 10:38:33');
INSERT INTO `sys_action_log_201504` VALUES ('8751', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 10:38:33');
INSERT INTO `sys_action_log_201504` VALUES ('8752', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 10:38:43');
INSERT INTO `sys_action_log_201504` VALUES ('8753', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 10:38:47');
INSERT INTO `sys_action_log_201504` VALUES ('8754', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 10:38:49');
INSERT INTO `sys_action_log_201504` VALUES ('8755', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 10:38:49');
INSERT INTO `sys_action_log_201504` VALUES ('8756', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 10:38:49');
INSERT INTO `sys_action_log_201504` VALUES ('8757', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 10:38:49');
INSERT INTO `sys_action_log_201504` VALUES ('8758', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 10:38:49');
INSERT INTO `sys_action_log_201504` VALUES ('8759', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 10:38:50');
INSERT INTO `sys_action_log_201504` VALUES ('8760', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 10:38:50');
INSERT INTO `sys_action_log_201504` VALUES ('8761', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keywords=飓风营救3\n来源页面:http://192.168.128.100:8080/', '192.168.128.100', '2015-04-12 10:39:06');
INSERT INTO `sys_action_log_201504` VALUES ('8762', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=\n来源页面:http://192.168.128.100:8080/btSearch.jsp?keywords=%E9%A3%93%E9%A3%8E%E8%90%A5%E6%95%913', '192.168.128.100', '2015-04-12 10:39:06');
INSERT INTO `sys_action_log_201504` VALUES ('8763', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=\n来源页面:http://192.168.128.100:8080/btSearch.jsp?keywords=%E9%A3%93%E9%A3%8E%E8%90%A5%E6%95%913', '192.168.128.100', '2015-04-12 10:39:06');
INSERT INTO `sys_action_log_201504` VALUES ('8764', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 10:40:47');
INSERT INTO `sys_action_log_201504` VALUES ('8765', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keywords=超能陆战队\n来源页面:http://192.168.128.100:8080/', '192.168.128.100', '2015-04-12 10:41:11');
INSERT INTO `sys_action_log_201504` VALUES ('8766', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=\n来源页面:http://192.168.128.100:8080/btSearch.jsp?keywords=%E8%B6%85%E8%83%BD%E9%99%86%E6%88%98%E9%98%9F', '192.168.128.100', '2015-04-12 10:41:11');
INSERT INTO `sys_action_log_201504` VALUES ('8767', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=\n来源页面:http://192.168.128.100:8080/btSearch.jsp?keywords=%E8%B6%85%E8%83%BD%E9%99%86%E6%88%98%E9%98%9F', '192.168.128.100', '2015-04-12 10:41:11');
INSERT INTO `sys_action_log_201504` VALUES ('8768', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keywords=超能陆战队\n来源页面:http://192.168.128.100:8080/', '192.168.128.100', '2015-04-12 10:41:51');
INSERT INTO `sys_action_log_201504` VALUES ('8769', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=\n来源页面:http://192.168.128.100:8080/btSearch.jsp?keywords=%E8%B6%85%E8%83%BD%E9%99%86%E6%88%98%E9%98%9F', '192.168.128.100', '2015-04-12 10:41:52');
INSERT INTO `sys_action_log_201504` VALUES ('8770', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=\n来源页面:http://192.168.128.100:8080/btSearch.jsp?keywords=%E8%B6%85%E8%83%BD%E9%99%86%E6%88%98%E9%98%9F', '192.168.128.100', '2015-04-12 10:41:52');
INSERT INTO `sys_action_log_201504` VALUES ('8771', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keywords=超能陆战队\n来源页面:http://192.168.128.100:8080/', '192.168.128.100', '2015-04-12 10:42:07');
INSERT INTO `sys_action_log_201504` VALUES ('8772', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=\n来源页面:http://192.168.128.100:8080/btSearch.jsp?keywords=%E8%B6%85%E8%83%BD%E9%99%86%E6%88%98%E9%98%9F', '192.168.128.100', '2015-04-12 10:42:08');
INSERT INTO `sys_action_log_201504` VALUES ('8773', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=\n来源页面:http://192.168.128.100:8080/btSearch.jsp?keywords=%E8%B6%85%E8%83%BD%E9%99%86%E6%88%98%E9%98%9F', '192.168.128.100', '2015-04-12 10:42:08');
INSERT INTO `sys_action_log_201504` VALUES ('8774', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keywords=帕丁顿熊\n来源页面:http://192.168.128.100:8080/', '192.168.128.100', '2015-04-12 10:42:32');
INSERT INTO `sys_action_log_201504` VALUES ('8775', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=\n来源页面:http://192.168.128.100:8080/btSearch.jsp?keywords=%E5%B8%95%E4%B8%81%E9%A1%BF%E7%86%8A', '192.168.128.100', '2015-04-12 10:42:32');
INSERT INTO `sys_action_log_201504` VALUES ('8776', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=\n来源页面:http://192.168.128.100:8080/btSearch.jsp?keywords=%E5%B8%95%E4%B8%81%E9%A1%BF%E7%86%8A', '192.168.128.100', '2015-04-12 10:42:32');
INSERT INTO `sys_action_log_201504` VALUES ('8777', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keywords=帕丁顿熊\n来源页面:http://192.168.128.100:8080/', '192.168.128.100', '2015-04-12 10:43:02');
INSERT INTO `sys_action_log_201504` VALUES ('8778', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=\n来源页面:http://192.168.128.100:8080/btSearch.jsp?keywords=%E5%B8%95%E4%B8%81%E9%A1%BF%E7%86%8A', '192.168.128.100', '2015-04-12 10:43:02');
INSERT INTO `sys_action_log_201504` VALUES ('8779', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=\n来源页面:http://192.168.128.100:8080/btSearch.jsp?keywords=%E5%B8%95%E4%B8%81%E9%A1%BF%E7%86%8A', '192.168.128.100', '2015-04-12 10:43:03');
INSERT INTO `sys_action_log_201504` VALUES ('8780', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 10:43:09');
INSERT INTO `sys_action_log_201504` VALUES ('8781', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：words=飓风营救3\n来源页面:http://192.168.128.100:8080/', '192.168.128.100', '2015-04-12 10:43:14');
INSERT INTO `sys_action_log_201504` VALUES ('8782', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=\n来源页面:http://192.168.128.100:8080/btSearch.jsp?words=%E9%A3%93%E9%A3%8E%E8%90%A5%E6%95%913', '192.168.128.100', '2015-04-12 10:43:14');
INSERT INTO `sys_action_log_201504` VALUES ('8783', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=\n来源页面:http://192.168.128.100:8080/btSearch.jsp?words=%E9%A3%93%E9%A3%8E%E8%90%A5%E6%95%913', '192.168.128.100', '2015-04-12 10:43:14');
INSERT INTO `sys_action_log_201504` VALUES ('8784', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keyword=哈\n来源页面:http://192.168.128.100:8080/', '192.168.128.100', '2015-04-12 10:44:13');
INSERT INTO `sys_action_log_201504` VALUES ('8785', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=?\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:44:13');
INSERT INTO `sys_action_log_201504` VALUES ('8786', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=?\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:44:13');
INSERT INTO `sys_action_log_201504` VALUES ('8787', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keyword=哈哈哈哈\n来源页面:http://192.168.128.100:8080/', '192.168.128.100', '2015-04-12 10:44:45');
INSERT INTO `sys_action_log_201504` VALUES ('8788', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=????\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:44:45');
INSERT INTO `sys_action_log_201504` VALUES ('8789', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=????\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:44:45');
INSERT INTO `sys_action_log_201504` VALUES ('8790', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：words=飓风营救3\n来源页面:http://192.168.128.100:8080/', '192.168.128.100', '2015-04-12 10:46:37');
INSERT INTO `sys_action_log_201504` VALUES ('8791', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=\n来源页面:http://192.168.128.100:8080/btSearch.jsp?words=%E9%A3%93%E9%A3%8E%E8%90%A5%E6%95%913', '192.168.128.100', '2015-04-12 10:46:37');
INSERT INTO `sys_action_log_201504` VALUES ('8792', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=\n来源页面:http://192.168.128.100:8080/btSearch.jsp?words=%E9%A3%93%E9%A3%8E%E8%90%A5%E6%95%913', '192.168.128.100', '2015-04-12 10:46:37');
INSERT INTO `sys_action_log_201504` VALUES ('8793', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 10:48:14');
INSERT INTO `sys_action_log_201504` VALUES ('8794', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keyword=哈哈\n来源页面:http://192.168.128.100:8080/', '192.168.128.100', '2015-04-12 10:48:23');
INSERT INTO `sys_action_log_201504` VALUES ('8795', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=??\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:48:23');
INSERT INTO `sys_action_log_201504` VALUES ('8796', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 10:49:04');
INSERT INTO `sys_action_log_201504` VALUES ('8797', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keyword=哈哈\n来源页面:http://192.168.128.100:8080/', '192.168.128.100', '2015-04-12 10:49:09');
INSERT INTO `sys_action_log_201504` VALUES ('8798', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=哈哈\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:49:09');
INSERT INTO `sys_action_log_201504` VALUES ('8799', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keyword=哈哈\n来源页面:http://192.168.128.100:8080/', '192.168.128.100', '2015-04-12 10:49:19');
INSERT INTO `sys_action_log_201504` VALUES ('8800', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=哈哈\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:49:19');
INSERT INTO `sys_action_log_201504` VALUES ('8801', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：words=澳门风云2\n来源页面:http://192.168.128.100:8080/', '192.168.128.100', '2015-04-12 10:49:42');
INSERT INTO `sys_action_log_201504` VALUES ('8802', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=\n来源页面:http://192.168.128.100:8080/btSearch.jsp?words=%E6%BE%B3%E9%97%A8%E9%A3%8E%E4%BA%912', '192.168.128.100', '2015-04-12 10:49:42');
INSERT INTO `sys_action_log_201504` VALUES ('8803', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 10:50:16');
INSERT INTO `sys_action_log_201504` VALUES ('8804', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：words=澳门风云2\n来源页面:http://192.168.128.100:8080/', '192.168.128.100', '2015-04-12 10:50:18');
INSERT INTO `sys_action_log_201504` VALUES ('8805', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=\n来源页面:http://192.168.128.100:8080/btSearch.jsp?words=%E6%BE%B3%E9%97%A8%E9%A3%8E%E4%BA%912', '192.168.128.100', '2015-04-12 10:50:18');
INSERT INTO `sys_action_log_201504` VALUES ('8806', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=\n来源页面:http://192.168.128.100:8080/btSearch.jsp?words=%E6%BE%B3%E9%97%A8%E9%A3%8E%E4%BA%912', '192.168.128.100', '2015-04-12 10:50:18');
INSERT INTO `sys_action_log_201504` VALUES ('8807', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 10:50:53');
INSERT INTO `sys_action_log_201504` VALUES ('8808', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keyword=哈哈\n来源页面:http://192.168.128.100:8080/', '192.168.128.100', '2015-04-12 10:50:57');
INSERT INTO `sys_action_log_201504` VALUES ('8809', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=哈哈\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:50:57');
INSERT INTO `sys_action_log_201504` VALUES ('8810', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=哈哈\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:50:57');
INSERT INTO `sys_action_log_201504` VALUES ('8811', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keyword=哈哈哈哈\n来源页面:http://192.168.128.100:8080/search/topBar.jsp?keyword=%E5%93%88%E5%93%88', '192.168.128.100', '2015-04-12 10:51:21');
INSERT INTO `sys_action_log_201504` VALUES ('8812', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=哈哈哈哈\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:51:22');
INSERT INTO `sys_action_log_201504` VALUES ('8813', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=哈哈哈哈\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:51:22');
INSERT INTO `sys_action_log_201504` VALUES ('8814', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keyword=哈哈哈哈\n来源页面:http://192.168.128.100:8080/search/topBar.jsp?keyword=%E5%93%88%E5%93%88%E5%93%88%E5%93%88', '192.168.128.100', '2015-04-12 10:51:26');
INSERT INTO `sys_action_log_201504` VALUES ('8815', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=哈哈哈哈\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:51:26');
INSERT INTO `sys_action_log_201504` VALUES ('8816', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=哈哈哈哈\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:51:26');
INSERT INTO `sys_action_log_201504` VALUES ('8817', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keyword=哈哈哈哈\n来源页面:http://192.168.128.100:8080/search/topBar.jsp?keyword=%E5%93%88%E5%93%88%E5%93%88%E5%93%88', '192.168.128.100', '2015-04-12 10:51:28');
INSERT INTO `sys_action_log_201504` VALUES ('8818', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=哈哈哈哈\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:51:28');
INSERT INTO `sys_action_log_201504` VALUES ('8819', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=哈哈哈哈\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:51:28');
INSERT INTO `sys_action_log_201504` VALUES ('8820', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keyword=哈哈哈哈\n来源页面:http://192.168.128.100:8080/search/topBar.jsp?keyword=%E5%93%88%E5%93%88%E5%93%88%E5%93%88', '192.168.128.100', '2015-04-12 10:51:29');
INSERT INTO `sys_action_log_201504` VALUES ('8821', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=哈哈哈哈\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:51:29');
INSERT INTO `sys_action_log_201504` VALUES ('8822', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=哈哈哈哈\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:51:29');
INSERT INTO `sys_action_log_201504` VALUES ('8823', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keyword=哈哈哈哈\n来源页面:http://192.168.128.100:8080/search/topBar.jsp?keyword=%E5%93%88%E5%93%88%E5%93%88%E5%93%88', '192.168.128.100', '2015-04-12 10:51:30');
INSERT INTO `sys_action_log_201504` VALUES ('8824', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=哈哈哈哈\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:51:30');
INSERT INTO `sys_action_log_201504` VALUES ('8825', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=哈哈哈哈\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:51:30');
INSERT INTO `sys_action_log_201504` VALUES ('8826', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keyword=哈哈哈哈\n来源页面:http://192.168.128.100:8080/search/topBar.jsp?keyword=%E5%93%88%E5%93%88%E5%93%88%E5%93%88', '192.168.128.100', '2015-04-12 10:51:31');
INSERT INTO `sys_action_log_201504` VALUES ('8827', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=哈哈哈哈\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:51:31');
INSERT INTO `sys_action_log_201504` VALUES ('8828', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=哈哈哈哈\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:51:31');
INSERT INTO `sys_action_log_201504` VALUES ('8829', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keyword=哈哈哈哈\n来源页面:http://192.168.128.100:8080/search/topBar.jsp?keyword=%E5%93%88%E5%93%88%E5%93%88%E5%93%88', '192.168.128.100', '2015-04-12 10:51:32');
INSERT INTO `sys_action_log_201504` VALUES ('8830', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=哈哈哈哈\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:51:32');
INSERT INTO `sys_action_log_201504` VALUES ('8831', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=哈哈哈哈\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:51:32');
INSERT INTO `sys_action_log_201504` VALUES ('8832', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keyword=哈哈哈哈\n来源页面:http://192.168.128.100:8080/search/topBar.jsp?keyword=%E5%93%88%E5%93%88%E5%93%88%E5%93%88', '192.168.128.100', '2015-04-12 10:51:33');
INSERT INTO `sys_action_log_201504` VALUES ('8833', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=哈哈哈哈\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:51:33');
INSERT INTO `sys_action_log_201504` VALUES ('8834', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=哈哈哈哈\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:51:33');
INSERT INTO `sys_action_log_201504` VALUES ('8835', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 10:52:14');
INSERT INTO `sys_action_log_201504` VALUES ('8836', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 10:52:15');
INSERT INTO `sys_action_log_201504` VALUES ('8837', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keyword=哈哈\n来源页面:http://192.168.128.100:8080/', '192.168.128.100', '2015-04-12 10:52:21');
INSERT INTO `sys_action_log_201504` VALUES ('8838', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=哈哈\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:52:21');
INSERT INTO `sys_action_log_201504` VALUES ('8839', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=哈哈\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:52:21');
INSERT INTO `sys_action_log_201504` VALUES ('8840', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keyword=哈哈文文\n来源页面:http://192.168.128.100:8080/search/topBar.jsp?keyword=%E5%93%88%E5%93%88', '192.168.128.100', '2015-04-12 10:52:29');
INSERT INTO `sys_action_log_201504` VALUES ('8841', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=哈哈文文\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:52:29');
INSERT INTO `sys_action_log_201504` VALUES ('8842', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=哈哈文文\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 10:52:29');
INSERT INTO `sys_action_log_201504` VALUES ('8843', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 10:52:53');
INSERT INTO `sys_action_log_201504` VALUES ('8844', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 10:52:54');
INSERT INTO `sys_action_log_201504` VALUES ('8845', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 22:08:03');
INSERT INTO `sys_action_log_201504` VALUES ('8846', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keyword=哈哈哈\n来源页面:http://192.168.128.100:8080/', '192.168.128.100', '2015-04-12 22:08:22');
INSERT INTO `sys_action_log_201504` VALUES ('8847', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=哈哈哈\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 22:08:22');
INSERT INTO `sys_action_log_201504` VALUES ('8848', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=哈哈哈\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 22:08:23');
INSERT INTO `sys_action_log_201504` VALUES ('8849', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keyword=???\n来源页面:http://192.168.128.100:8080/search/topBar.jsp?keyword=%E5%93%88%E5%93%88%E5%93%88', '192.168.128.100', '2015-04-12 22:08:41');
INSERT INTO `sys_action_log_201504` VALUES ('8850', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=???\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 22:08:42');
INSERT INTO `sys_action_log_201504` VALUES ('8851', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=???\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 22:08:42');
INSERT INTO `sys_action_log_201504` VALUES ('8852', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keyword=???\n来源页面:http://192.168.128.100:8080/search/topBar.jsp?keyword=???', '192.168.128.100', '2015-04-12 22:08:44');
INSERT INTO `sys_action_log_201504` VALUES ('8853', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=???\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 22:08:44');
INSERT INTO `sys_action_log_201504` VALUES ('8854', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=???\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 22:08:44');
INSERT INTO `sys_action_log_201504` VALUES ('8855', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：keyword=???\n来源页面:http://192.168.128.100:8080/search/topBar.jsp?keyword=???', '192.168.128.100', '2015-04-12 22:09:11');
INSERT INTO `sys_action_log_201504` VALUES ('8856', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=???\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 22:09:11');
INSERT INTO `sys_action_log_201504` VALUES ('8857', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=???\n来源页面:http://192.168.128.100:8080/btSearch.jsp', '192.168.128.100', '2015-04-12 22:09:11');
INSERT INTO `sys_action_log_201504` VALUES ('8858', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 22:20:13');
INSERT INTO `sys_action_log_201504` VALUES ('8859', '0', '1', '/btSearch.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/btSearch.jsp\n页面参数为：words=澳门风云2\n来源页面:http://192.168.128.100:8080/', '192.168.128.100', '2015-04-12 22:20:16');
INSERT INTO `sys_action_log_201504` VALUES ('8860', '0', '1', '/search/topBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/topBar.jsp\n页面参数为：keyword=????2\n来源页面:http://192.168.128.100:8080/btSearch.jsp?words=%E6%BE%B3%E9%97%A8%E9%A3%8E%E4%BA%912', '192.168.128.100', '2015-04-12 22:20:16');
INSERT INTO `sys_action_log_201504` VALUES ('8861', '0', '1', '/search/mainBar.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/search/mainBar.jsp\n页面参数为：keyword=????2\n来源页面:http://192.168.128.100:8080/btSearch.jsp?words=%E6%BE%B3%E9%97%A8%E9%A3%8E%E4%BA%912', '192.168.128.100', '2015-04-12 22:20:17');
INSERT INTO `sys_action_log_201504` VALUES ('8862', '0', '1', '/index.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/\n页面参数为：', '192.168.128.100', '2015-04-12 22:23:44');
INSERT INTO `sys_action_log_201504` VALUES ('8863', '0', '1', '/workspace/welcome.jsp', '', '当前访问的页面是:http://192.168.128.100:8080/workspace/welcome.jsp\n页面参数为：\n来源页面:http://192.168.128.100:8080/workspace/', '192.168.128.100', '2015-04-12 22:24:02');
INSERT INTO `sys_action_log_201504` VALUES ('8864', '0', '1', '/sys/sysConf', '', '当前访问的页面是:http://192.168.128.100:8080/modules/sys/sysConf/\n页面参数为：\n来源页面:http://192.168.128.100:8080/workspace/menu.jsp', '192.168.128.100', '2015-04-12 22:24:10');
INSERT INTO `sys_action_log_201504` VALUES ('8865', '0', '1', '/sys/sysConf', '', '当前访问的页面是:http://192.168.128.100:8080/modules/sys/sysConf/createProp.jsp\n页面参数为：pid=11\n来源页面:http://192.168.128.100:8080/modules/sys/sysConf/', '192.168.128.100', '2015-04-12 22:24:15');
INSERT INTO `sys_action_log_201504` VALUES ('8866', '0', '2', '/sys/sysConf', '添加属性', '操作人：admin,在首页参数类别下添加了URIEncoding的属性', '192.168.128.100', '2015-04-12 22:24:57');
INSERT INTO `sys_action_log_201504` VALUES ('8867', '0', '1', '/sys/sysConf', '', '当前访问的页面是:http://192.168.128.100:8080/modules/sys/sysConf/\n页面参数为：\n来源页面:http://192.168.128.100:8080/workspace/menu.jsp', '192.168.128.100', '2015-04-12 22:25:00');
INSERT INTO `sys_action_log_201504` VALUES ('8868', '0', '1', '/sys/sysConf', '', '当前访问的页面是:http://192.168.128.100:8080/modules/sys/sysConf/update.jsp\n页面参数为：id=20\n来源页面:http://192.168.128.100:8080/modules/sys/sysConf/', '192.168.128.100', '2015-04-12 22:25:02');
INSERT INTO `sys_action_log_201504` VALUES ('8870', '0', '1', '/sys/sysConf', '', '当前访问的页面是:http://192.168.128.100:8080/modules/sys/sysConf/\n页面参数为：\n来源页面:http://192.168.128.100:8080/workspace/menu.jsp', '192.168.128.100', '2015-04-12 22:25:11');

-- ----------------------------
-- Table structure for `sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL,
  `cat_name` varchar(20) DEFAULT NULL COMMENT '分类名',
  `prop_name` varchar(100) DEFAULT NULL COMMENT '属性名',
  `prop_value` varchar(500) DEFAULT NULL COMMENT '属性数值',
  `prop_comment` varchar(100) DEFAULT NULL COMMENT '属性备注',
  `input_comment` varchar(200) DEFAULT NULL COMMENT '输入说明',
  `display_order` varchar(6) DEFAULT NULL COMMENT '显示排序',
  `create_date` datetime DEFAULT NULL COMMENT '建立时间',
  `modify_date` datetime DEFAULT NULL COMMENT '最后修改时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态。1为正常，-1为标记删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('7', 'aaa', null, null, 'aaa', '', '001000', '2015-04-12 01:31:40', null, '-1');
INSERT INTO `sys_config` VALUES ('8', 'aaa', 'vvvv', 'dddd', 'aaaa', 'ffff', '001002', '2015-04-12 01:32:24', null, '-1');
INSERT INTO `sys_config` VALUES ('9', 'aaa', 'aaaaa', 'ddddd333dffafdaffafffaf', 'ff', 'www', '001003', '2015-04-12 01:43:50', '2015-04-12 01:45:24', '-1');
INSERT INTO `sys_config` VALUES ('10', 'aaa', '1111', '2222', '3333', '4444', '001004', '2015-04-12 01:44:17', null, '-1');
INSERT INTO `sys_config` VALUES ('11', 'homepage', null, null, '首页参数', '', '002000', '2015-04-12 03:25:36', null, '1');
INSERT INTO `sys_config` VALUES ('12', 'homepage', 'keywords', '磁力搜索,磁力链接,种子搜索网站,BT搜索,DHT搜索', '搜索关键字', '搜索关键字', '002002', '2015-04-12 03:26:26', null, '1');
INSERT INTO `sys_config` VALUES ('13', 'homepage', 'description', '焰火磁力搜索是一个提供多个磁力搜索结果聚合的网站，通过融合多个网站的结果以方便大家使用，又被誉为BT种子搜索神器。也是国内最强大的磁力聚合搜索网站。', '描述', '描述', '002003', '2015-04-12 03:33:25', '2015-04-12 03:43:07', '1');
INSERT INTO `sys_config` VALUES ('14', 'homepage', 'logo', '/images/logo.png', '图标', '图标', '002004', '2015-04-12 03:34:02', '2015-04-12 04:35:02', '1');
INSERT INTO `sys_config` VALUES ('15', 'homepage', 'websitename', '焰火磁力聚合搜索', '标题显示', '标题显示', '002005', '2015-04-12 03:39:02', '2015-04-12 03:57:54', '1');
INSERT INTO `sys_config` VALUES ('16', 'homepage', 'hotSearch', '战狼,飓风营救3,帕丁顿熊,澳门风云2,超能陆战队, 狼图腾,国家地理,探索频道,耶鲁大学开放课程', '热门搜索', '热门搜索', '002006', '2015-04-12 04:00:53', null, '1');
INSERT INTO `sys_config` VALUES ('17', 'homepage', 'email', 'wcss2020@gmail.com', '联系方式', '联系方式', '002007', '2015-04-12 04:02:24', null, '1');
INSERT INTO `sys_config` VALUES ('18', 'homepage', 'htmlcount', 'empty', '网页统计', '网页统计', '002008', '2015-04-12 04:12:08', '2015-04-12 04:39:24', '1');
INSERT INTO `sys_config` VALUES ('19', 'homepage', 'codeA', 'empty', '广告区域A', '广告区域A', '002009', '2015-04-12 04:27:40', '2015-04-12 04:39:31', '1');
INSERT INTO `sys_config` VALUES ('20', 'homepage', 'URIEncoding', 'utf8', '连接默认字符集', '连接默认字符集', '002010', '2015-04-12 22:24:57', '2015-04-12 22:25:08', '1');

-- ----------------------------
-- Table structure for `sys_sequence`
-- ----------------------------
DROP TABLE IF EXISTS `sys_sequence`;
CREATE TABLE `sys_sequence` (
  `table_name` varchar(200) DEFAULT NULL,
  `sequence_id` bigint(20) DEFAULT NULL,
  `table_desc` varchar(200) DEFAULT NULL,
  `increment_num` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_update` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_sequence
-- ----------------------------
INSERT INTO `sys_sequence` VALUES ('sys_action_log', '8871', 'sys_action_log', '1', '2014-06-11 12:09:54', '2015-04-12 22:25:11');
INSERT INTO `sys_sequence` VALUES ('msc_perm', '164', 'msc_perm', '1', '2014-11-26 15:06:30', '2015-04-12 01:03:21');
INSERT INTO `sys_sequence` VALUES ('sys_config', '21', 'sys_config', '1', '2014-11-26 15:28:21', '2015-04-12 22:24:57');
INSERT INTO `sys_sequence` VALUES ('ngn_org', '7', 'ngn_org', '1', '2014-11-26 17:59:06', '2015-01-25 14:18:51');
INSERT INTO `sys_sequence` VALUES ('ngn_group', '8', 'ngn_group', '1', '2014-11-27 23:19:09', '2015-01-25 16:38:18');
INSERT INTO `sys_sequence` VALUES ('ngn_node', '77', 'ngn_node', '1', '2014-12-01 17:16:38', '2015-02-09 20:06:49');
INSERT INTO `sys_sequence` VALUES ('msc_user', '7', 'msc_user', '1', '2015-01-22 16:23:15', '2015-01-25 18:49:39');
INSERT INTO `sys_sequence` VALUES ('ngn_admin', '9', 'ngn_admin', '1', '2015-01-23 17:32:06', '2015-01-25 16:03:49');
INSERT INTO `sys_sequence` VALUES ('ngn_user', '11', 'ngn_user', '1', '2015-01-23 17:32:16', '2015-04-12 00:56:07');
INSERT INTO `sys_sequence` VALUES ('ngn_msg', '4', 'ngn_msg', '1', '2015-04-12 01:54:26', '2015-04-12 02:10:07');
INSERT INTO `sys_sequence` VALUES ('ngn_search', '10', 'ngn_search', '1', '2015-04-12 02:31:33', '2015-04-12 04:59:22');
