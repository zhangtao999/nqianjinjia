/*
Navicat MySQL Data Transfer

Source Server         : 192.168.3.33
Source Server Version : 50714
Source Host           : 192.168.3.33:3306
Source Database       : qianjinjia

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-07-03 17:36:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `real_name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
  `created_at` timestamp NULL,
  `updated_at` timestamp NULL,
  `status` int(11) DEFAULT '1' COMMENT '账户状态：-1无效，1有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='后台管理用户表';

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'a5a30bc4c47888cd59c4e9df68d80242', '管理员', '2017-03-07 09:41:20', '2017-06-14 12:59:30', '1');
INSERT INTO `admin` VALUES ('2', 'jackal', 'a5a30bc4c47888cd59c4e9df68d80242', '马守超', '2017-04-20 17:24:32', '2018-04-04 06:37:27', '1');
INSERT INTO `admin` VALUES ('3', 'dalaoban', 'a5a30bc4c47888cd59c4e9df68d80242', '大老板', '2017-04-20 17:34:00', '2017-07-04 10:37:25', '1');
INSERT INTO `admin` VALUES ('5', '111', 'bcbe3365e6ac95ea2c0343a2395834dd', 'www', '2017-06-14 16:21:45', '2017-06-19 14:40:59', '1');
INSERT INTO `admin` VALUES ('6', '111', 'bcbe3365e6ac95ea2c0343a2395834dd', 'yyy', '2017-06-14 16:22:22', '2018-06-21 09:46:26', '1');
INSERT INTO `admin` VALUES ('7', 'aaa', 'a5a30bc4c47888cd59c4e9df68d80242', 'aaa', '2017-06-21 13:30:18', '2018-06-20 15:23:41', '1');

-- ----------------------------
-- Table structure for `admin_action`
-- ----------------------------
DROP TABLE IF EXISTS `admin_action`;
CREATE TABLE `admin_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL COMMENT '父级菜单id',
  `action_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '权限名字',
  `type` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT 'menu' COMMENT 'menu 菜单\nopt 操作项',
  `key` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '所在目录路径',
  `created_at` timestamp NULL,
  `updated_at` timestamp NULL,
  `status` int(11) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='后台管理用户权限表';

-- ----------------------------
-- Records of admin_action
-- ----------------------------
INSERT INTO `admin_action` VALUES ('1', '0', '客户管理', 'menu', 'users', 'user', '/', '2017-04-18 15:12:55', '2017-04-20 14:50:23', '1');
INSERT INTO `admin_action` VALUES ('2', '0', '借款管理', 'menu', 'products', 'appstore-o', '/', '2017-04-18 15:12:55', '2018-04-04 16:20:57', '1');
INSERT INTO `admin_action` VALUES ('3', '0', '理财管理', 'menu', 'orders', 'copy', '/', '2017-04-18 15:12:55', '2018-04-23 14:53:28', '1');
INSERT INTO `admin_action` VALUES ('4', '0', '贷后管理', 'menu', 'repayment', 'file-text', '/', '2018-04-23 14:41:20', '2018-04-24 16:34:46', '1');
INSERT INTO `admin_action` VALUES ('5', '0', '内容管理', 'menu', 'contents', 'tablet', '/', '2017-04-18 15:12:55', '2018-04-23 14:46:04', '1');
INSERT INTO `admin_action` VALUES ('6', '0', '活动管理', 'menu', 'activity', 'gift', '/', '2017-04-18 15:12:55', '2018-04-23 14:45:59', '1');
INSERT INTO `admin_action` VALUES ('7', '0', '消息管理', 'menu', 'messages', 'notification', '/', '2017-04-18 15:12:55', '2018-04-23 14:45:57', '1');
INSERT INTO `admin_action` VALUES ('8', '0', '财务中心', 'menu', 'finance', 'pay-circle-o', '/', '2017-04-18 15:12:56', '2018-04-23 14:45:55', '1');
INSERT INTO `admin_action` VALUES ('9', '0', '客服中心', 'menu', 'services', 'customer-service', '/', '2017-04-18 15:12:56', '2018-04-23 14:45:54', '1');
INSERT INTO `admin_action` VALUES ('10', '0', '数据统计', 'menu', 'data', 'line-chart', '/', '2017-04-18 15:12:56', '2018-04-23 14:45:52', '1');
INSERT INTO `admin_action` VALUES ('11', '0', '系统设置', 'menu', 'system', 'setting', '/', '2017-04-18 15:12:56', '2018-04-23 14:45:50', '1');
INSERT INTO `admin_action` VALUES ('12', '1', '注册用户', 'menu', 'list', null, '/客户管理', '2017-04-18 15:29:56', '2018-04-23 14:45:49', '1');
INSERT INTO `admin_action` VALUES ('13', '1', '借款人', 'menu', 'prolist', null, '/客户管理', '2017-04-18 15:29:57', '2018-04-23 14:45:47', '-1');
INSERT INTO `admin_action` VALUES ('14', '1', '风险测评', 'menu', 'risk', null, '/客户管理', '2017-04-18 15:29:57', '2018-04-23 14:45:45', '-1');
INSERT INTO `admin_action` VALUES ('15', '2', '产品发布', 'menu', 'post', null, '/借款管理', '2017-04-18 15:29:57', '2018-04-23 14:45:43', '-1');
INSERT INTO `admin_action` VALUES ('16', '2', '借款列表', 'menu', 'approve', null, '/借款管理', '2017-04-18 15:29:57', '2018-04-23 14:45:42', '1');
INSERT INTO `admin_action` VALUES ('17', '2', '散标管理', 'menu', 'list', null, '/借款管理', '2017-04-18 15:29:57', '2018-05-22 15:34:23', '1');
INSERT INTO `admin_action` VALUES ('18', '2', '合标管理', 'menu', 'merge_list', null, '/借款管理', '2017-04-18 15:29:57', '2018-06-01 14:45:27', '1');
INSERT INTO `admin_action` VALUES ('19', '3', '出借记录', 'menu', 'list', null, '/订单管理', '2017-04-18 15:29:57', '2018-06-05 11:21:12', '1');
INSERT INTO `admin_action` VALUES ('20', '3', '提现审核', 'menu', 'with_draw', null, '/订单管理', '2017-04-18 15:29:57', '2018-06-06 13:24:32', '1');
INSERT INTO `admin_action` VALUES ('21', '3', '申购订单', 'menu', 'buy', null, '/订单管理', '2017-04-18 15:29:57', '2018-04-23 14:45:33', '-1');
INSERT INTO `admin_action` VALUES ('22', '3', '兑付订单', 'menu', 'pay', null, '/订单管理', '2017-04-18 15:29:57', '2018-04-23 14:45:32', '-1');
INSERT INTO `admin_action` VALUES ('23', '5', 'Banner管理', 'menu', 'banner', null, '/内容管理', '2017-04-18 15:29:57', '2018-04-23 14:48:44', '1');
INSERT INTO `admin_action` VALUES ('24', '5', '新闻动态', 'menu', 'news', null, '/内容管理', '2017-04-18 15:29:57', '2018-04-23 14:48:43', '1');
INSERT INTO `admin_action` VALUES ('25', '5', '发现频道', 'menu', 'find', null, '/内容管理', '2017-04-18 15:29:57', '2018-04-23 14:48:41', '1');
INSERT INTO `admin_action` VALUES ('26', '6', '优惠券', 'menu', 'coupon', null, '/活动管理', '2017-04-18 15:29:57', '2018-04-23 14:48:26', '1');
INSERT INTO `admin_action` VALUES ('27', '6', '红包', 'menu', 'packet', null, '/活动管理', '2017-04-18 15:29:57', '2018-04-23 14:48:48', '1');
INSERT INTO `admin_action` VALUES ('28', '6', '积分', 'menu', 'points', null, '/活动管理', '2017-04-18 15:29:57', '2018-04-23 14:48:50', '1');
INSERT INTO `admin_action` VALUES ('29', '7', '系统消息', 'menu', 'systeminfo', null, '/消息管理', '2017-04-18 15:29:57', '2018-04-23 14:48:55', '1');
INSERT INTO `admin_action` VALUES ('30', '7', '运营通知', 'menu', 'notice', null, '/消息管理', '2017-04-18 15:29:57', '2018-04-23 14:48:56', '1');
INSERT INTO `admin_action` VALUES ('31', '7', '短信记录', 'menu', 'sms', null, '/消息管理', '2017-04-18 15:29:57', '2018-04-23 14:48:57', '1');
INSERT INTO `admin_action` VALUES ('32', '3', '订单审核', 'menu', 'orderreview', null, '/投资管理', '2017-04-18 15:29:57', '2018-04-23 14:49:31', '1');
INSERT INTO `admin_action` VALUES ('33', '8', '佣金结算', 'menu', 'commission', null, '/财务中心', '2017-04-18 15:29:57', '2018-04-23 14:49:38', '1');
INSERT INTO `admin_action` VALUES ('34', '9', '合同管理', 'menu', 'contract', null, '/客服中心', '2017-04-18 15:29:57', '2018-04-23 14:49:43', '1');
INSERT INTO `admin_action` VALUES ('35', '9', '论坛管理', 'menu', 'forum', null, '/客服中心', '2017-04-18 15:29:57', '2018-04-23 14:49:44', '1');
INSERT INTO `admin_action` VALUES ('36', '9', '用户反馈', 'menu', 'feedback', null, '/客服中心', '2017-04-18 15:29:57', '2018-04-23 14:49:45', '1');
INSERT INTO `admin_action` VALUES ('37', '10', '入账管理', 'menu', 'recorded', null, '/数据统计', '2017-04-18 15:29:58', '2018-04-23 14:49:50', '1');
INSERT INTO `admin_action` VALUES ('38', '10', '佣金报表', 'menu', 'commissionreport', null, '/数据统计', '2017-04-18 15:29:58', '2018-04-23 14:49:51', '1');
INSERT INTO `admin_action` VALUES ('39', '10', '产品销售报表', 'menu', 'salesreport', null, '/数据统计', '2017-04-18 15:29:58', '2018-04-23 14:49:53', '1');
INSERT INTO `admin_action` VALUES ('40', '10', '申购统计报表', 'menu', 'buystatistics', null, '/数据统计', '2017-04-18 15:29:58', '2018-04-23 14:49:55', '1');
INSERT INTO `admin_action` VALUES ('41', '10', '预约统计报表', 'menu', 'appointstatistics', null, '/数据统计', '2017-04-18 15:29:58', '2018-04-23 14:50:04', '1');
INSERT INTO `admin_action` VALUES ('42', '11', '帮助中心', 'menu', 'help', null, '/系统设置', '2017-04-18 15:29:58', '2018-04-23 14:50:15', '-1');
INSERT INTO `admin_action` VALUES ('43', '11', '测评问卷', 'menu', 'questionnaire', null, '/系统设置', '2017-04-18 15:29:58', '2018-04-23 14:50:17', '-1');
INSERT INTO `admin_action` VALUES ('44', '11', '申明须知', 'menu', 'declare', null, '/系统设置', '2017-04-18 15:29:58', '2018-04-23 14:50:20', '-1');
INSERT INTO `admin_action` VALUES ('45', '11', '系统用户', 'menu', 'sysaccount', null, '/系统设置', '2017-04-18 15:29:58', '2018-04-23 14:50:23', '1');
INSERT INTO `admin_action` VALUES ('46', '25', '热播', 'menu', 'hot', null, '/内容管理/发现频道', '2017-04-18 15:38:29', '2018-04-23 14:50:38', '1');
INSERT INTO `admin_action` VALUES ('47', '25', '产品路演', 'menu', 'show', null, '/内容管理/发现频道', '2017-04-18 15:38:30', '2018-04-23 14:50:40', '1');
INSERT INTO `admin_action` VALUES ('48', '25', '财富讲坛', 'menu', 'bema', null, '/内容管理/发现频道', '2017-04-18 15:38:30', '2018-04-23 14:50:42', '1');
INSERT INTO `admin_action` VALUES ('49', '34', '合同列表', 'menu', 'list', null, '/客服中心/合同管理', '2017-04-18 15:38:30', '2018-04-23 14:50:52', '1');
INSERT INTO `admin_action` VALUES ('50', '34', '合同审核', 'menu', 'review', null, '/客服中心/合同管理', '2017-04-18 15:38:30', '2018-04-23 14:50:53', '1');
INSERT INTO `admin_action` VALUES ('51', '34', '帖子列表', 'menu', 'thread', null, '/客服中心/论坛管理', '2017-04-18 15:38:30', '2018-04-23 14:43:55', '1');
INSERT INTO `admin_action` VALUES ('52', '35', '评论列表', 'menu', 'comments', null, '/客服中心/论坛管理', '2017-04-18 15:38:30', '2018-04-23 14:51:05', '1');
INSERT INTO `admin_action` VALUES ('53', '42', '注册登陆', 'menu', 'rl', null, '/系统设置/帮助中心', '2017-04-18 15:38:30', '2018-04-23 14:51:08', '-1');
INSERT INTO `admin_action` VALUES ('54', '42', '充值提现', 'menu', 'moy', null, '/系统设置/帮助中心', '2017-04-18 15:38:30', '2018-04-23 14:51:10', '-1');
INSERT INTO `admin_action` VALUES ('55', '42', '投资回报', 'menu', 'invest', null, '/系统设置/帮助中心', '2017-04-18 15:38:30', '2018-04-23 14:51:11', '-1');
INSERT INTO `admin_action` VALUES ('56', '42', '名词解释', 'menu', 'exp', null, '/系统设置/帮助中心', '2017-04-18 15:38:30', '2018-04-23 14:51:12', '-1');
INSERT INTO `admin_action` VALUES ('57', '42', '账户安全', 'menu', 'sec', null, '/系统设置/帮助中心', '2017-04-18 15:38:30', '2018-04-23 14:51:14', '-1');
INSERT INTO `admin_action` VALUES ('58', '42', '客服热线', 'menu', 'tel', null, '/系统设置/帮助中心', '2017-04-18 15:38:30', '2018-04-23 14:51:15', '-1');
INSERT INTO `admin_action` VALUES ('59', '43', '客户问卷', 'menu', 'users', null, '/系统设置/测评问卷', '2017-04-18 15:38:30', '2018-04-23 14:51:17', '-1');
INSERT INTO `admin_action` VALUES ('60', '43', '基金经理人问卷', 'menu', 'managers', null, '/系统设置/测评问卷', '2017-04-18 15:38:30', '2018-04-23 14:51:19', '-1');
INSERT INTO `admin_action` VALUES ('61', '45', '角色管理', 'menu', 'roles', null, '/系统设置/系统用户', '2017-04-18 15:38:30', '2018-04-23 14:51:22', '1');
INSERT INTO `admin_action` VALUES ('62', '45', '用户管理', 'menu', 'accounts', null, '/系统设置/系统用户', '2017-04-18 15:38:30', '2018-04-23 14:51:23', '1');
INSERT INTO `admin_action` VALUES ('63', '45', '权限管理', 'menu', 'actions', null, '/系统设置/系统用户', '2017-04-18 15:38:30', '2018-04-23 14:51:31', '1');
INSERT INTO `admin_action` VALUES ('64', '9', '官方投资顾问', 'menu', 'adviser', null, '/客服中心/官方投资顾问', '2017-07-19 11:43:39', '2018-04-23 14:51:37', '1');
INSERT INTO `admin_action` VALUES ('65', '11', '客户端升级', 'menu', 'app', null, '/系统设置', '2017-09-04 11:10:37', '2018-04-23 14:51:39', '1');
INSERT INTO `admin_action` VALUES ('66', '1', '推荐投资顾问', 'menu', 'rrolist', '', '/客户管理', '2017-12-23 10:06:02', '2018-04-23 14:43:06', '-1');
INSERT INTO `admin_action` VALUES ('67', '8', '佣金设置', 'menu', 'commissionset', '', '/财务中心', '2017-12-25 15:52:27', '2018-04-23 14:51:43', '1');
INSERT INTO `admin_action` VALUES ('68', '8', '佣金记录', 'menu', 'commissionlog', null, '/财务中心', '2017-12-26 18:48:14', '2018-04-23 14:51:44', '1');
INSERT INTO `admin_action` VALUES ('69', '4', '还款列表', 'menu', 'list', '', '/贷后管理', '2018-04-24 10:07:36', '2018-04-24 10:07:36', '1');
INSERT INTO `admin_action` VALUES ('70', '2', '产品分类', 'menu', 'cat', null, '/借款管理', '2017-04-18 15:29:57', '2018-05-22 15:39:04', '1');
INSERT INTO `admin_action` VALUES ('71', '3', '债权转让', 'menu', 'debtlist', null, '/理财管理', '2018-06-11 10:28:32', '2018-06-11 10:30:59', '1');

-- ----------------------------
-- Table structure for `admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名',
  `created_at` timestamp NULL,
  `updated_at` timestamp NULL,
  `status` int(11) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='后台管理用户角色表';

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES ('1', '总裁', '2017-04-01 14:33:37', '2017-04-01 14:33:37', '1');
INSERT INTO `admin_role` VALUES ('2', '副总裁', '2017-04-01 14:33:37', '2017-04-01 14:33:37', '1');
INSERT INTO `admin_role` VALUES ('3', '基金总经理', '2017-04-01 14:33:37', '2017-04-01 14:33:37', '1');
INSERT INTO `admin_role` VALUES ('4', '基金运营专员', '2017-04-01 14:33:37', '2017-04-01 14:33:37', '1');
INSERT INTO `admin_role` VALUES ('5', '销售主管', '2017-04-01 14:33:37', '2017-04-01 14:33:37', '1');
INSERT INTO `admin_role` VALUES ('6', '销售内勤', '2017-04-01 14:33:37', '2017-04-01 14:33:37', '1');
INSERT INTO `admin_role` VALUES ('7', '产品部经理', '2017-04-01 14:33:37', '2017-04-01 14:33:37', '1');
INSERT INTO `admin_role` VALUES ('8', '产品专员', '2017-04-01 14:33:37', '2017-04-01 14:33:37', '1');
INSERT INTO `admin_role` VALUES ('9', '客服总监', '2017-04-01 14:33:37', '2017-04-01 14:33:37', '1');
INSERT INTO `admin_role` VALUES ('10', '客服主管', '2017-04-01 14:33:37', '2017-04-01 14:33:37', '1');
INSERT INTO `admin_role` VALUES ('11', '客服专员', '2017-04-01 14:33:37', '2017-04-01 14:33:37', '1');
INSERT INTO `admin_role` VALUES ('12', '财务出纳', '2017-04-01 14:33:37', '2017-04-01 14:33:37', '1');
INSERT INTO `admin_role` VALUES ('13', '财务对账', '2017-04-01 14:33:37', '2017-04-01 14:33:37', '1');
INSERT INTO `admin_role` VALUES ('14', '财务审核', '2017-04-01 14:33:37', '2017-04-01 14:33:37', '1');
INSERT INTO `admin_role` VALUES ('15', '财务总监', '2017-04-01 14:33:37', '2017-04-01 14:33:37', '1');
INSERT INTO `admin_role` VALUES ('16', '品牌策划', '2017-04-01 14:33:37', '2017-04-13 14:00:52', '1');
INSERT INTO `admin_role` VALUES ('17', '培训', '2017-04-01 14:33:37', '2017-04-01 14:33:37', '1');

-- ----------------------------
-- Table structure for `app_version`
-- ----------------------------
DROP TABLE IF EXISTS `app_version`;
CREATE TABLE `app_version` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `version_num` int(10) NOT NULL DEFAULT '1' COMMENT '版本号',
  `platform` varchar(15) NOT NULL COMMENT 'ios/android',
  `client` varchar(11) DEFAULT NULL COMMENT '理财端invest，借款端loan',
  `version` varchar(10) NOT NULL DEFAULT '5.0.0' COMMENT '版本名',
  `info` varchar(255) DEFAULT NULL COMMENT '版本更新信息',
  `url` varchar(255) DEFAULT NULL COMMENT 'app更新地址',
  `version_update` varchar(10) DEFAULT '' COMMENT '强制更新版本',
  `start_page` varchar(255) DEFAULT NULL COMMENT '启动页的第二页',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='APP版本更新表';

-- ----------------------------
-- Records of app_version
-- ----------------------------
INSERT INTO `app_version` VALUES ('1', '41', 'ios', 'invest', '4.0.1', '钱进家苹果理财端新版本上线，邀您体验更丰富内容!', 'https://itunes.apple.com/us/app/%E9%92%B1%E8%BF%9B%E5%AE%B6%E8%B4%A2%E5%AF%8C/id1035560712?l=zh&ls=1&mt=8', '', '', '2016-09-28 17:08:22', '2018-05-30 16:09:47');
INSERT INTO `app_version` VALUES ('2', '40', 'android', 'invest', '4.0.1', '钱进家安卓理财端新版本上线，邀您体验更丰富内容!', 'http://7xsdhl.com1.z0.glb.clouddn.com/qjj/v33.apk', '', '', '2017-06-21 10:35:48', '2018-05-28 14:42:58');
INSERT INTO `app_version` VALUES ('3', '42', 'ios', 'loan', '4.0.3', '钱进家苹果借款端新版本上线，邀您体验更丰富内容!', 'https://itunes.apple.com/cn/app/id1325993367?mt=8', '', '', '2017-09-13 13:22:39', '2018-06-21 20:37:05');
INSERT INTO `app_version` VALUES ('4', '40', 'android', 'loan', '4.0.1', '钱进家安卓借款端新版本上线，邀您体验更丰富内容!', 'http://7xsdhl.com1.z0.glb.clouddn.com/qjj/v33loan.apk', '', '', '2017-09-13 13:22:39', '2018-05-28 14:43:21');

-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(300) DEFAULT '' COMMENT '文章标题',
  `small_title` varchar(255) DEFAULT NULL COMMENT '短标题',
  `type` int(5) DEFAULT NULL COMMENT '1:帮助中心 2新闻 3公告',
  `cate_id` int(11) DEFAULT NULL COMMENT '文章分类id',
  `content` text COMMENT '文章内容',
  `created_at` timestamp NULL,
  `updated_at` timestamp NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='文章管理表';

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '新手必读', '123', '1', '1', '<p>\r\n    1、钱进家是怎样的平台？\r\n</p>\r\n<p>\r\n    钱进家是上海挖宝金融信息服务有限公司在“互联网+”时代背景下开发的一款网络借贷信息中介服务工具，钱进家通过先进的智能匹配算法和严格的风控体系，极大降低用户的选择难度，轻松享受理财带来的收益和快乐，让用户在钱进家获得安全、简便的理财出借体验。\r\n</p>\r\n<p>\r\n    2、钱进家提供的服务是否合法合规？\r\n</p>\r\n<p>\r\n    钱进家的所有业务都遵守国家法律法规，在国家相关部门的监管下运营。同时，钱进家的企业信息可在工商局网站查询。\r\n</p>\r\n<p>\r\n    3、作为新手，如何在钱进家进行理财？\r\n</p>\r\n<p>\r\n    1)&nbsp; 注册成为钱进家的用户；\r\n</p>\r\n<p>\r\n    2)&nbsp; 完成实名绑卡认证；\r\n</p>\r\n<p>\r\n    3)&nbsp; 选择出借项目；\r\n</p>\r\n<p>\r\n    4)&nbsp; 完成第三方专业机构开户；\r\n</p>\r\n<p>\r\n    5)&nbsp; 完成出借。&nbsp;&nbsp;\r\n</p>\r\n<p>\r\n    4、针对新用户，有什么福利活动？\r\n</p>\r\n<p>\r\n    目前平台已上线注册出借就返现金的活动，只要新人完成注册并出借就可获得相应的现金。当然平台还会不定期上线更多的福利活动，请随时关注钱进家的官网和APP，了解最新资讯。\r\n</p>\r\n<p>\r\n    <br/>\r\n</p>', '2018-04-17 18:45:06', '2018-06-21 13:02:58');
INSERT INTO `article` VALUES ('2', '注册登录', '123', '1', '2', '<p>\r\n    1、 如何加入钱进家？\r\n</p>\r\n<p>\r\n    用户下载钱进家APP，利用手机号进行注册；\r\n</p>\r\n<p>\r\n    2、同一个手机号码可以注册多个账号吗？\r\n</p>\r\n<p>\r\n    手机号码作为用户的登录名，同一个手机号码只允许注册一次；\r\n</p>\r\n<p>\r\n    3、为什么要绑定手机？\r\n</p>\r\n<p>\r\n    通过绑定手机，可以提高您账户的安全级别，一旦您的账户有充值出借或者提现操作，您都能第一时间收到信息，随时掌控账户动态；\r\n</p>\r\n<p>\r\n    4、手机收不到验证短信怎么办？\r\n</p>\r\n<p>\r\n    短信可能被您手机所安装的软件进行拦截，如您收到短信，可先至该拦截软件中查看。\r\n</p>\r\n<p>\r\n    5、为什么要实名绑卡？\r\n</p>\r\n<p>\r\n    实名绑卡是为了验证您所绑定的账户是否属于您本人，为了确保您的资金安全，您需要首次出借前进行第三方开户绑卡。\r\n</p>\r\n<p>\r\n    6、“登录密码”与“交易密码”有何区别？\r\n</p>\r\n<p>\r\n    “登录密码”用于用户登录平台账户；“支付密码”供用户在出借及提现申请操作时使用，作为用户承认本人操作的密码。注册完成后交易密码默认为登录密码。\r\n</p>\r\n<p>\r\n    <br/>\r\n</p>', '2018-04-17 18:45:07', '2018-06-21 13:01:22');
INSERT INTO `article` VALUES ('3', '开户绑卡', '123', '1', '3', '<p>\r\n    1、如何进行实名认证？\r\n</p>\r\n<p>\r\n    您需要在专业第三方存管机构完成开户操作，在实名绑卡页面输入姓名、身份证号、银行卡号，手机验证码在确认无误后，点击提交第三方进行校验。\r\n</p>\r\n<p>\r\n    2、同一账户能绑定几张卡？\r\n</p>\r\n<p>\r\n    为了您的资金安全，目前钱进家严格执行资金同卡进出，同一账号同时只能绑定一张银行卡。为了便于理财，请选择充值限额较大的银行。\r\n</p>\r\n<p>\r\n    3、绑定的银行卡有什么要求？\r\n</p>\r\n<p>\r\n    只需绑定您本人（需与民生开户时身份信息一致）持有的银行储蓄卡，并填写正确的银行预留手机号即可。快捷充值无需开通网银。\r\n</p>\r\n<p>\r\n    4、绑卡成功后可以解绑吗？\r\n</p>\r\n<p>\r\n    目前暂时不允许解绑。\r\n</p>\r\n<p>\r\n    <br/>\r\n</p>', '2018-04-17 18:45:07', '2018-04-27 10:46:28');
INSERT INTO `article` VALUES ('4', '充值提现', '123', '1', '4', '<p>\r\n    1、充值有多少种方式？\r\n</p>\r\n<p>\r\n    用户可以在钱进家财富客户端通过充值绑卡进行快捷充值\r\n</p>\r\n<p>\r\n    2、充值可提现是否有限额？\r\n</p>\r\n<p>\r\n    快捷充值限额请查看快捷充值页面“支持银行及限额列表”，网银充值限额视具体银行情况而定， 提现目前限额是单笔100W。如出现提现不成功的情况，请与平台客服联系。\r\n</p>\r\n<p>\r\n    3、充值提现有费用吗？\r\n</p>\r\n<p>\r\n    充值免手续费；提现免手续费。\r\n</p>\r\n<p>\r\n    <br/>\r\n</p>', '2018-04-17 18:45:07', '2018-06-21 11:46:37');
INSERT INTO `article` VALUES ('12', '四部门印发规范金融机构资管业务指导意见', '《意见》按照产品类型统一监管标准，坚持防范风险与有序规范相结合，合理设置过渡期', '2', null, '<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; font-family: 宋体; font-size: 14px; line-height: 2; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    本报北京4月27日讯 记者周琰报道 为规范金融机构资产管理业务，统一同类资产管理产品监管标准，有效防控金融风险，更好地服务实体经济，经国务院同意，中国人民银行、中国银行保险监督管理委员会、中国证券监督管理委员会、国家外汇管理局今天联合印发了《关于规范金融机构资产管理业务的指导意见》。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; font-family: 宋体; font-size: 14px; line-height: 2; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    　　《意见》根据党中央、国务院“服务实体经济、防控金融风险、深化金融改革”的总体要求，按照“坚决打好防范化解重大风险攻坚战”的决策部署，坚持严控风险的底线思维，坚持服务实体经济的根本目标，坚持宏观审慎管理与微观审慎监管相结合的监管理念，坚持有的放矢的问题导向，坚持积极稳妥审慎推进的基本思路，全面覆盖、统一规制各类金融机构的资产管理业务，实行公平的市场准入和监管，最大程度地消除监管套利空间，切实保护金融消费者合法权益。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; font-family: 宋体; font-size: 14px; line-height: 2; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    　　《意见》按照产品类型统一监管标准，从募集方式和投资性质两个维度对资产管理产品进行分类，分别统一投资范围、杠杆约束、信息披露等要求。坚持产品和投资者匹配原则，加强投资者适当性管理，强化金融机构的勤勉尽责和信息披露义务。明确资产管理业务不得承诺保本保收益，打破刚性兑付。严格非标准化债权类资产投资要求，禁止资金池，防范影子银行风险和流动性风险。分类统一负债和分级杠杆要求，消除多层嵌套，抑制通道业务。加强监管协调，强化宏观审慎管理和功能监管。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; font-family: 宋体; font-size: 14px; line-height: 2; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    　　《意见》坚持防范风险与有序规范相结合，合理设置过渡期，给予金融机构资产管理业务有序整改和转型时间，确保金融市场稳定运行。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; font-family: 宋体; font-size: 14px; line-height: 2; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    　　下一步，各相关部门将按照职责分工，认真贯彻落实《意见》的各项要求。金融机构应按照《意见》的相关规定，依法合规开展资产管理业务。\r\n</p>\r\n<p>\r\n    <br/>\r\n</p>', '2018-04-29 11:09:51', '2018-04-29 11:11:08');
INSERT INTO `article` VALUES ('13', '三部门联合发文：加强非金融企业投资金融机构监管', '本报北京4月27日讯 记者周琰报道 为规范非金融企业投资金融机构行为，强化对非金融企业投资金融机构的监管，促进实业和金融业良性互动发展', '2', null, '<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; font-family: 宋体; font-size: 14px; line-height: 2; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    本报北京4月27日讯 记者周琰报道 为规范非金融企业投资金融机构行为，强化对非金融企业投资金融机构的监管，促进实业和金融业良性互动发展，经党中央、国务院同意，中国人民银行、中国银行保险监督管理委员会、中国证券监督管理委员会今天联合印发《关于加强非金融企业投资金融机构监管的指导意见》。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; font-family: 宋体; font-size: 14px; line-height: 2; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    　　《指导意见》根据党中央、国务院决策部署和全国金融工作会议要求，按照问题导向，补齐监管短板，坚持规范市场秩序与激发市场活力并重。一方面，要求非金融企业依法依规投资金融机构，立足主业，审慎经营，隔离风险，避免盲目扩张和脱实向虚；另一方面，按照党的十九大报告提出的两个“毫不动摇”，尊重各类产权，鼓励扎根于为实体经济服务的金融创新，让非金融企业和金融机构都能从真实合规的投资行为中受益，实现经济金融健康可持续发展。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; font-family: 宋体; font-size: 14px; line-height: 2; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    　　《指导意见》对金融机构的不同类型股东实施差异化监管：对一般性财务投资，不作过多限制；对于主要股东特别是控股股东，进行严格规范。《指导意见》强化金融机构控股股东的资质要求，从正面清单和负面清单明确金融机构控股股东的具体条件，加强金融机构股权质押、转让和拍卖管理。规范非金融企业投资金融机构的资金来源，加强资本的真实性合规性监管。完善股权结构和公司治理，规范关联交易，健全风险隔离机制，防止滥用控制权，严禁不当干预金融机构经营。加强对非金融企业和金融机构的穿透监管，强化部门之间的监管协调和信息共享。《指导意见》充分考虑市场影响，按照“新老划断”原则，积极稳妥组织实施。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; font-family: 宋体; font-size: 14px; line-height: 2; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    　　下一步，各相关部门将按照职责分工，认真贯彻落实《指导意见》的各项要求。非金融企业和金融机构应当按照《指导意见》的规定，依法依规开展相关经营活动。\r\n</p>\r\n<p>\r\n    <br/>\r\n</p>', '2018-04-29 11:09:52', '2018-04-29 11:17:06');
INSERT INTO `article` VALUES ('14', '银保监会加快落实对外开放措施\r\n近期将推出一系列实质性举措', '4月27日，中国银行保险监督管理委员会表示，将积极贯彻党中央、国务院提出要积极推动形成全面开放新格局的决策部署，尽早推动以下各项开放措施落地。', '2', null, '<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; font-family: 宋体; font-size: 14px; line-height: 2; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    第一，推动外资投资便利化，包括取消对中资银行和金融资产管理公司的外资持股比例限制，实施内外一致的股权投资比例规则；对商业银行新发起设立的金融资产投资公司和理财公司，外资持股比例不设置限制；鼓励信托、金融租赁、汽车金融、货币经纪、消费金融等各类银行业金融机构引进境外专业投资者；将外资人身险公司外方股比放宽至51%，3年后不再设限。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; font-family: 宋体; font-size: 14px; line-height: 2; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    　　第二，放宽外资设立机构条件，包括允许外国银行在中国境内同时设有子行和分行，以及在全国范围内取消外资保险机构设立前需开设两年代表处的要求。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; font-family: 宋体; font-size: 14px; line-height: 2; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    　　第三，扩大外资机构业务范围，包括全面取消外资银行申请人民币业务需满足开业1年的等待期要求，允许外国银行分行从事“代理发行、代理兑付、承销政府债券”业务，降低外国银行分行吸收单笔人民币定期零售存款的门槛至50万元，允许符合条件的境外投资者来华经营保险代理业务和保险公估业务。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    &nbsp; &nbsp; 第四，优化外资机构监管规则，对外国银行境内分行实施合并考核，调整外国银行分行营运资金管理要求。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　为确保上述措施及早落地，中国银行保险监督管理委员会正在加快完善相关法律法规和配套制度建设，近期即将推出以下一系列实质性举措：\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　一、发布《关于进一步放宽外资银行市场准入相关事项的通知》，明确允许外资银行可以开展代理发行、代理兑付、承销政府债券业务，允许符合条件的外国银行在中国境内的管理行授权中国境内其他分行经营人民币业务和衍生产品交易业务，对外国银行在中国境内多家分行营运资金采取合并计算。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　二、发布《关于放开外资保险经纪公司经营范围的通知》，放开保险经纪公司经营范围，与中资一致。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　三、就《中国银行保险监督管理委员会关于废止和修改部分规章的决定》公开征求意见。该决定将宣布废止《境外金融机构投资入股中资金融机构管理办法》，同时修改多部行政许可事项实施办法相关条款，落实取消中资银行和金融资产管理公司的外资持股比例限制的开放措施。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　银保监会表示，上述新开放举措旨在进一步完善银行业和保险业投资和经营环境，激发外资参与中国金融业发展的活力，丰富金融服务和产品体系，提升金融业服务实体经济的质效。在平等互利的基础上，银保监会欢迎和支持更多符合条件的外资金融机构参与中国银行业和保险业对外开放进程，共同构建更加开放、互利共赢的金融市场环境。与此同时，银保监会将立足中国国情，全面借鉴金融业对外开放的历史与国际经验，持续完善法规和配套制度建设，坚决守住不发生系统性风险的底线。\r\n</p>\r\n<p>\r\n    <br/>\r\n</p>', '2018-04-29 11:09:52', '2018-04-29 11:23:03');
INSERT INTO `article` VALUES ('15', '加强实业与金融业风险隔离 防范风险跨机构跨业态传递', '中国人民银行有关负责人就《关于加强非金融企业投资金融机构监管的指导意见》答记者问', '2', null, '<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; font-family: 宋体; font-size: 14px; line-height: 2; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    4月27日，中国人民银行、中国银行保险监督管理委员会、中国证券监督管理委员会联合发布《关于加强非金融企业投资金融机构监管的指导意见》（以下简称《指导意见》）。针对社会各界关心的主要问题，中国人民银行有关负责人回答了记者提问。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; font-family: 宋体; font-size: 14px; line-height: 2; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    　　问：为什么要制定《指导意见》？\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; font-family: 宋体; font-size: 14px; line-height: 2; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    　　答：近年来，我国金融业改革开放力度不断加大，大量非金融企业通过发起设立、并购、参股等方式投资金融机构。一些实力较强、行为规范的非金融企业投资金融机构，有助于优化自身的资本配置，提升竞争力，也有利于金融机构扩大资本来源，改善股权结构，增强了金融业与实体经济的相互认知和理解。但实践中也暴露出一些问题，部分非金融企业忽视自身主营业务发展，盲目向金融业扩张，助长了脱实向虚和导致杠杆率高企；一些非金融企业以非自有资金进行虚假注资、循环注资，导致金融机构没有获得真正能够抵御风险的资本；还有少数非金融企业不当干预金融机构经营，将金融机构作为“提款机”，使得实业板块与金融板块风险交叉传递。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; font-family: 宋体; font-size: 14px; line-height: 2; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    　　为规范非金融企业投资金融机构行为，强化对非金融企业投资金融机构的监管，有效防范风险传递，促进非金融企业与金融机构良性互动发展，人民银行会同相关部门，立足于当前金融行业监管实践，制定了《指导意见》。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; font-family: 宋体; font-size: 14px; line-height: 2; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    　　问：《指导意见》的指导思想和基本原则是什么？\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; font-family: 宋体; font-size: 14px; line-height: 2; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    　　答：《指导意见》的指导思想是，全面贯彻党的十九大精神，以习近平新时代中国特色社会主义思想为指导，根据党中央、国务院决策部署和全国金融工作会议要求，按照问题导向、补齐监管短板，明确非金融企业投资金融机构的政策导向，强化股东资质、股权结构、投资资金、公司治理和关联交易监管，加强实业与金融业的风险隔离，防范风险跨机构跨业态传递。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; font-family: 宋体; font-size: 14px; line-height: 2; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    　　《指导意见》遵循以下基本原则：一是立足主业，服务实体经济。非金融企业应围绕自身主业发展需要，科学布局对金融机构投资，审慎稳健经营，强化资本约束，控制杠杆率，避免盲目扩张和脱实向虚。二是分类监管，防范风险。对金融机构股东按照类型不同实施差异化监管，明确不同的准入和资质要求：对一般性财务投资，不作过多限制；对于主要股东特别是控股股东，建立规范的股东资质、资金来源真实性、公司治理、关联交易等监管制度，不得对金融机构不当干预。三是规范市场秩序与激发市场活力并重。按照党的十九大报告提出的“毫不动摇巩固和发展公有制经济，毫不动摇鼓励、支持、引导非公有制经济发展”要求，尊重各类产权，鼓励扎根于为实体经济服务的金融创新，允许具备核心主业突出、财务状况良好、公司治理规范、发展战略合理等条件的非金融企业依法依规投资金融机构，支持金融机构股权多元化，完善公司治理，拓宽资本补充渠道，让非金融企业和金融机构都能从真实合规的投资行为中受益，实现经济金融健康可持续发展。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; font-family: 宋体; font-size: 14px; line-height: 2; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    　　问：《指导意见》在哪些方面强化了金融机构股东的资质要求？\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; font-family: 宋体; font-size: 14px; line-height: 2; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    　　答：《指导意见》对金融机构的不同类型股东实施差异化监管，主要规范金融机构的主要股东或控股股东，通过正面清单和负面清单的方式，强化股东资质要求。从正面清单看，金融机构的主要股东和控股股东应当核心主业突出、资本实力雄厚、公司治理规范、股权结构清晰、管理能力达标、财务状况良好、资产负债和杠杆水平适度，制定合理明晰的投资金融业的商业计划，并且控股股东原则上还要满足连续3年盈利、净资产不低于总资产40%等要求。从负面清单看，非金融企业脱离主业需要盲目向金融业扩张、风险管控薄弱、进行高杠杆投资、关联交易频繁且异常的，不得成为金融机构的控股股东。对所投资金融机构经营失败或重大违规行为负有重大责任的非金融企业，在一定期限内不得再成为金融机构的控股股东。此外，还加强了对金融机构股权质押、转让和拍卖的管理，避免非金融企业违规恶意质押、转让所持有金融机构股权。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; font-family: 宋体; font-size: 14px; line-height: 2; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    　　问：《指导意见》对投资金融机构的资金来源有哪些要求？\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; font-family: 宋体; font-size: 14px; line-height: 2; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    　　答：非金融企业投资金融机构必须使用自有资金。但近年来，一些非金融企业将银行贷款、发债资金、理财资金等用来投资金融机构，甚至虚假注资、循环注资，导致金融机构资本不实，抵御风险能力削弱。为此，《指导意见》要求非金融企业投资金融机构应当以自有资金出资，资金来源真实合法，不得以委托资金、负债资金、“名股实债”等非自有资金投资金融机构，不得虚假注资、循环注资和抽逃资本。穿透识别实际控制人和最终受益人，禁止以代持、违规关联等方式持有金融机构股权。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; font-family: 宋体; font-size: 14px; line-height: 2; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    　　问：《指导意见》如何加强公司治理监管？\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; font-family: 宋体; font-size: 14px; line-height: 2; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    　　答：针对一些非金融企业投资金融机构中存在的股权结构复杂、交叉持股、多层持股、信息披露不足、受益所有人不明确等情况，《指导意见》规定，一是非金融企业的股权结构应简明清晰，简化投资层级，提高组织架构的透明度。金融机构的控股股东为企业集团或处于企业集团、控股公司结构之中的，必须全面完整地报告或披露集团的股权结构、实际控制人、受益所有人及其变动情况，包括匿名、代持等相关情况，防止隐匿所有权架构，规避监管。二是金融机构应当建立有效的决策、执行、监督相互制衡的机制，强化董事会决策机制，避免大股东或实际控制人滥用控制权。三是成为金融机构控股股东的非金融企业，应当建立资金、人员、信息等方面的防火墙，对业务往来、信息共享、共用营业设施等行为进行有效规范。四是规范非金融企业与金融机构之间交叉持股和交叉任职行为，避免利益输送和利益冲突。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; font-family: 宋体; font-size: 14px; line-height: 2; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    　　问：《指导意见》如何加强关联交易监管？\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; font-family: 宋体; font-size: 14px; line-height: 2; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    　　答：针对一些非金融企业与金融机构之间通过不当关联交易输送利益和套取金融机构资金的行为，《指导意见》强化关联交易监管，要求一般关联交易应当定期报告，重大关联交易应当逐笔报告。非金融企业在成为金融机构主要股东或控股股东时，应当提交与关联方外其他股东无关联关系、不进行不当关联交易的承诺函。非金融企业不得滥用控制权干预金融机构的独立自主经营，不得直接或变相套取、挪用、挤占金融机构及其客户资金。金融机构应当遵循穿透原则要求，建立有效的关联交易管理制度，防止利益输送和风险转移。严禁通过各种手段隐匿关联交易和资金真实去向，规避监管。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; font-family: 宋体; font-size: 14px; line-height: 2; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    　　问：《指导意见》如何组织实施？\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; font-family: 宋体; font-size: 14px; line-height: 2; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    　　答：金融机构股东和股权管理监管制度与《指导意见》不一致的，金融监督管理部门相应进行修改。同时，在充分考虑市场影响的基础上，按照“新老划断”原则，对新发生的非金融企业投资金融机构行为，严格按照新的监管要求执行；对《指导意见》发布前，涉及以非自有资金投资、通过不正当关联交易投资等行为，进行规范。对于不符合要求、确需市场退出的，依法积极稳妥实施市场化退出。下一步，各相关部门将按照职责分工，认真贯彻落实《指导意见》的各项要求。非金融企业和金融机构应当按照《指导意见》的规定，依法依规开展相关经营活动。\r\n</p>\r\n<p>\r\n    <br/>\r\n</p>', '2018-04-29 11:09:52', '2018-04-29 11:23:21');
INSERT INTO `article` VALUES ('16', '促进资产管理业务规范发展 降低金融风险', '中国人民银行有关负责人就《关于规范金融机构资产管理业务的指导意见》答记者问', '2', null, '<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    4月27日，经国务院同意，《关于规范金融机构资产管理业务的指导意见》（以下简称《意见》）正式发布。日前，中国人民银行有关负责人就《意见》相关问题回答了记者提问。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　问：公开征求意见及吸收情况如何？\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　答：经国务院批准，《意见》于2017年11月17日起向社会公开征求意见，为期一个月。征求意见过程中，金融机构、专家学者、社会公众等各方给予了广泛关注。中国人民银行会同相关部门对反馈意见进行反复研究和审慎决策，充分吸收了其中科学合理的意见，结合市场影响评估结果，对相关条款进行了以下修改和完善。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　在非标准化债权类资产投资方面，《意见》明确标准化债权类资产的核心要素，提出期限匹配、限额管理等监管措施，引导商业银行有序压缩非标存量规模。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　在产品净值化管理方面，《意见》要求资产管理（以下简称“资管”）业务不得承诺保本保收益，明确刚性兑付的认定及处罚标准，鼓励以市值计量所投金融资产，同时考虑到部分资产尚不具备以市值计量的条件，兼顾市场诉求，允许对符合一定条件的金融资产以摊余成本计量。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　在消除多层嵌套方面，《意见》统一同类资管产品的监管标准，要求监管部门对资管业务实行平等准入，促进资管产品获得平等主体地位，从根源上消除多层嵌套的动机。同时，将嵌套层级限制为一层，禁止开展多层嵌套和通道业务。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　在统一杠杆水平方面，《意见》充分考虑了市场需求和承受力，根据不同产品的风险等级设置了不同的负债杠杆，参照行业监管标准，对允许分级的产品设定了不同的分级比例。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　在合理设置过渡期方面，经过深入的测算评估，相比征求意见稿，《意见》将过渡期延长至2020年底，给予金融机构充足的调整和转型时间。对过渡期结束后仍未到期的非标等存量资产也作出妥善安排，引导金融机构转回资产负债表内，确保市场稳定。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　问：制定出台《意见》的背景是什么？\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　答：近年来，我国金融机构资管业务快速发展，规模不断攀升，截至2017年末，不考虑交叉持有因素，总规模已达百万亿元。其中，银行表外理财产品资金余额为22.2万亿元，信托公司受托管理的资金信托余额为21.9万亿元，公募基金、私募基金、证券公司资管计划、基金及其子公司资管计划、保险资管计划余额分别为11.6万亿元、11.1万亿元、16.8万亿元、13.9万亿元、2.5万亿元。同时，互联网企业、各类投资顾问公司等非金融机构开展资管业务也十分活跃。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　资管业务在满足居民财富管理需求、增强金融机构盈利能力、优化社会融资结构、支持实体经济等方面发挥了积极作用。但由于同类资管业务的监管规则和标准不一致，导致监管套利活动频繁，一些产品多层嵌套，风险底数不清，资金池模式蕴含流动性风险，部分产品成为信贷出表的渠道，刚性兑付普遍，在正规金融体系之外形成监管不足的“影子银行”，一定程度上干扰了宏观调控，提高了社会融资成本，影响了金融服务实体经济的质效，加剧了风险的跨行业、跨市场传递。在党中央、国务院的领导下，中国人民银行会同中国银行保险监督管理委员会、中国证券监督管理委员会、国家外汇管理局等部门，坚持问题导向，从弥补监管短板、提高监管有效性入手，在充分立足各行业金融机构资管业务开展情况和监管实践的基础上制定了《意见》。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　问：《意见》的总体思路和原则是什么？\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　答：《意见》的总体思路是，按照资管产品的类型制定统一的监管标准，对同类资管业务作出一致性规定，实行公平的市场准入和监管，最大程度地消除监管套利空间，为资管业务健康发展创造良好的制度环境。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　《意见》遵循以下基本原则：一是坚持严控风险的底线思维，减少存量风险，严防增量风险。二是坚持服务实体经济的根本目标，既充分发挥资管业务功能，切实服务实体经济投融资需求，又严格规范引导，避免资金脱实向虚，防止产品过于复杂加剧风险跨行业、跨市场、跨区域传递。三是坚持宏观审慎管理与微观审慎监管相结合、机构监管与功能监管相结合的监管理念，实现对各类金融机构开展资管业务的全面、统一覆盖，采取有效监管措施，加强金融消费者权益保护。四是坚持有的放矢的问题导向，重点针对资管业务的多层嵌套、杠杆不清、套利严重、投机频繁等问题，设定统一的监管标准，同时对金融创新坚持趋利避害、一分为二，留出发展空间。五是坚持积极稳妥审慎推进，防范风险与有序规范相结合，充分考虑市场承受能力，合理设置过渡期，加强市场沟通，有效引导市场预期。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　问：《意见》的适用范围是什么？包括哪些机构的哪些产品？\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　答：《意见》主要适用于金融机构的资管业务，即银行、信托、证券、基金、期货、保险资管机构、金融资产投资公司等金融机构接受投资者委托，对受托的投资者财产进行投资和管理的金融服务。金融机构为委托人利益履行诚实信用、勤勉尽责义务并收取相应的管理费用，委托人自担投资风险并获得收益，金融机构可以收取合理的业绩报酬，但需计入管理费并与产品一一对应。资管产品包括银行非保本理财产品、资金信托及证券公司、证券公司子公司、基金管理公司、基金管理子公司、期货公司、期货公司子公司、保险资管机构、金融资产投资公司发行的资管产品等。依据金融管理部门颁布规则开展的资产证券化业务、依据人力资源社会保障部门颁布规则发行的养老金产品不适用本意见。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　针对非金融机构违法违规开展资管业务的乱象，《意见》也按照“未经批准不得从事金融业务，金融业务必须接受金融监管”的理念，明确提出除国家另有规定外，非金融机构不得发行、销售资管产品。“国家另有规定的除外”主要指私募投资基金的发行和销售。私募投资基金适用私募投资基金专门法律、行政法规，其中没有明确规定的，适用《意见》，创业投资基金、政府出资产业投资基金的相关规定另行制定。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　问：《意见》对资管产品分类的依据和目的是什么？对不同类型产品监管的主要区别是什么？\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　答：对资管产品进行分类，对同类产品适用统一的监管规则，是《意见》的基础。《意见》从两个维度对资管产品进行分类。一是从资金来源端，按照募集方式分为公募产品和私募产品两大类。公募产品面向风险识别和承受能力偏弱的社会公众发行，风险外溢性强，在投资范围等方面监管要求较私募产品严格，主要投资标准化债权类资产以及上市交易的股票，除法律法规和金融管理部门另有规定外，不得投资未上市企业股权。私募产品面向风险识别和承受能力较强的合格投资者发行，监管要求相对宽松，更加尊重市场主体的意思自治，可以投资债权类资产、上市或挂牌交易的股票、未上市企业股权和受（收）益权以及符合法律法规规定的其他资产。二是从资金运用端，根据投资性质分为固定收益类产品、权益类产品、商品及金融衍生品类产品、混合类产品四大类。按照投资风险越高、分级杠杆约束越严的原则，设定不同的分级比例限制，各类产品的信息披露重点也不同。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　对产品从以上两个维度进行分类的目的在于：一是按照“实质重于形式”原则强化功能监管。实践中，不同行业金融机构开展资管业务，按照机构类型适用不同的监管规则和标准，为监管套利创造了空间，因而需要按照业务功能对资管产品进行分类，对同类产品适用统一的监管标准。二是贯彻“合适的产品卖给合适的投资者”理念：一方面，公募产品和私募产品分别对应社会公众和合格投资者两类不同的投资群体，体现不同的投资者适当性管理要求；另一方面，根据投资性质将资管产品分为不同类型，以此可区分产品的风险等级，同时要求资管产品发行时明示产品类型，可避免“挂羊头卖狗肉”，切实保护金融消费者权益。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　问：《意见》在哪些方面强化了金融机构开展资管业务的资质要求和管理职责？\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　答：资管业务是“受人之托、代人理财”的金融服务，为保障委托人的合法权益，《意见》要求金融机构符合一定的资质要求，并切实履行管理职责。一是金融机构应当建立与资管业务发展相适应的管理体系和管理制度，公司治理良好，风险管理、内部控制和问责机制健全。二是金融机构应当健全资管业务人员的资格认定、培训、考核评价和问责制度，确保其具备必要的专业知识、行业经验和管理能力，遵守行为准则和职业道德。三是对于违反相关法律法规以及《意见》规定的金融机构资管业务从业人员，依法采取处罚措施直至取消从业资格。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　问：标准化债权类资产的认定标准是什么？《意见》如何对资管产品投资非标准化债权类资产进行规范？\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　答：《意见》明确，标准化债权类资产应当具备以下特征：等分化、可交易、信息披露充分、集中登记、独立托管、公允定价、流动性机制完善、在经国务院同意设立的交易市场上交易等。具体认定规则由中国人民银行会同金融监督管理部门另行制定。标准化债权类资产之外的债权类资产均为非标。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　非标具有期限、流动性和信用转换功能，透明度较低，流动性较弱，规避了宏观调控政策和资本约束等监管要求，部分投向限制性领域，“影子银行”特征明显。为此，《意见》规定，资管产品投资非标应当遵守金融监督管理部门有关限额管理、流动性管理等监管标准，并且严格期限匹配。作出上述规范的目的是，避免资管业务沦为变相的信贷业务，防控“影子银行”风险，缩短融资链条，降低融资成本，提高金融服务实体经济的效率和水平。在规范非标投资的同时，为了更好地满足实体经济的融资需求，还需要大力发展直接融资，建设多层次资本市场体系，进一步深化金融体制改革，增强金融服务实体经济的效率和水平。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　问：《意见》如何防范资管产品的流动性风险？如何规范金融机构的资金池运作？\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　答：部分金融机构在开展资管业务过程中，通过滚动发行、集合运作、分离定价的方式，对募集资金进行资金池运作。在这种运作模式下，多只资管产品对应多项资产，每只产品的收益来自哪些资产无法辨识，风险也难以衡量。同时，将募集的短期资金投放到长期的债权或股权项目，加大了资管产品的流动性风险，一旦难以募集到后续资金，容易发生流动性紧张。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　《意见》在禁止资金池业务、强调资管产品单独管理、单独建账、单独核算的基础上，要求金融机构加强产品久期管理，规定封闭式资管产品期限不得低于90天，以此纠正资管产品短期化倾向，切实减少和消除资金来源端和运用端的期限错配和流动性风险。此外，对于部分机构通过为单一融资项目设立多只资管产品变相突破投资人数限制的行为，《意见》明确予以禁止。为防止同一资产发生风险波及多只产品，《意见》要求同一金融机构发行多只资管产品投资同一资产的资金总规模不得超过300亿元，如果超出该规模，需经金融监督管理部门批准。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　问：《意见》关于资管产品的风险准备金计提或资本计量要求与现有各类机构的相关标准是何种关系？二者如何衔接？\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　答：资管业务属于金融机构的表外业务，投资风险应由投资者自担，但为了应对操作风险或其他非预期风险，仍需建立一定的风险补偿机制，计提相应的风险准备金，或在资本计量时考虑相关风险因素。目前，各行业资管产品的风险准备金计提或资本计量要求不同：银行实行资本监管，按照理财业务收入计量一定比例的操作风险资本；证券公司资管计划、公募基金、基金子公司特定客户资管计划、部分保险资管计划按照管理费收入计提风险准备金，但比例不一；信托公司则按照税后利润的5%计提信托赔偿准备金。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　综合考虑现行要求，《意见》规定，金融机构应当按照资管产品管理费收入的10%计提风险准备金，或者按照规定计量操作风险资本或相应风险资本准备。风险准备金余额达到产品余额的1%时可以不再提取。风险准备金主要用于弥补因金融机构违法违规、违反资管产品协议、操作错误或技术故障等给资管产品财产或者投资者造成的损失。金融机构应当定期将风险准备金的使用情况报告金融管理部门。需要说明的是，对于目前不适用风险准备金计提或资本计量的金融机构，如信托公司，《意见》并非要求在此基础上进行双重计提，而是由金融监督管理部门按照《意见》的标准，在具体细则中进行规范。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　问：为什么要打破资管产品的刚性兑付？如何实行产品净值化管理？\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　答：刚性兑付偏离了资管产品“受人之托、代人理财”的本质，抬高无风险收益率水平，干扰资金价格，不仅影响发挥市场在资源配置中的决定性作用，还弱化了市场纪律，导致一些投资者冒险投机，金融机构不尽职尽责，道德风险较为严重。打破刚性兑付已经成为社会共识，为此，《意见》作出了一系列细化安排。首先，在定义资管业务时，要求金融机构不得承诺保本保收益，产品出现兑付困难时不得以任何形式垫资兑付。第二，引导金融机构转变预期收益率模式，强化产品净值化管理，并明确核算原则。第三，明示刚性兑付的认定情形，包括违反净值确定原则对产品进行保本保收益、采取滚动发行等方式保本保收益、自行筹集资金偿付或委托其他机构代偿等。第四，分类进行惩处。存款类金融机构发生刚性兑付，足额补缴存款准备金和存款保险保费，非存款类持牌金融机构由金融监督管理部门和中国人民银行依法纠正并予以处罚。此外，强化了外部审计机构的审计责任和报告要求。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　实践中，部分资管产品采取预期收益率模式，过度使用摊余成本法计量所投资金融资产，基础资产的风险不能及时反映到产品的价值变化中，投资者不清楚自身承担的风险大小，进而缺少风险自担意识；而金融机构将投资收益超过预期收益的部分转化为管理费或直接纳入中间业务收入，而非给予投资者，也难以要求投资者自担风险。为了推动预期收益型产品向净值型产品转型，让投资者在明晰风险、尽享收益的基础上自担风险，《意见》强调金融机构的业绩报酬需计入管理费并与产品一一对应，要求金融机构强化产品净值化管理，并由托管机构核算、外部审计机构审计确认，同时明确了具体的核算原则。首先，要求资管产品投资的金融资产坚持公允价值计量原则，鼓励使用市值计量。同时，允许符合以下条件之一的部分资产以摊余成本计量：一是产品封闭式运作，且所投金融资产以收取合同现金流量为目的并持有到期；二是产品封闭式运作，且所投金融资产暂不具备活跃交易市场，或者在活跃市场中没有报价、也不能采用估值技术可靠计量公允价值。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　问：如何规范资管产品的杠杆水平？\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　答：为维护债券、股票等金融市场平稳运行，抑制资产价格泡沫，应当控制资管产品的杠杆水平。资管产品的杠杆分为两类，一类是负债杠杆，即产品募集后，金融机构通过拆借、质押回购等负债行为，增加投资杠杆；另一类是分级杠杆，即金融机构对产品进行优先、劣后的份额分级，优先级投资者向劣后级投资者提供融资杠杆。在负债杠杆方面，《意见》对开放式公募、封闭式公募、分级私募和其他私募资管产品分别设定了140%、200%、140%和200%的负债比例（总资产/净资产）上限，并禁止金融机构以受托管理的产品份额进行质押融资。在分级产品方面，《意见》禁止公募产品和开放式私募产品进行份额分级。在可以分级的封闭式私募产品中，固定收益类产品的分级比例（优先级份额/劣后级份额）不得超过3：1，权益类产品不得超过1：1，商品及金融衍生品类产品、混合类产品均不得超过2：1。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　问：如何消除多层嵌套并限制通道业务？\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　答：资管产品多层嵌套，不仅增加了产品的复杂程度，导致底层资产不清，也拉长了资金链条，抬高了社会融资成本。大量分级产品的嵌入，还导致杠杆成倍聚集，加剧市场波动。为从根本上抑制多层嵌套的动机，《意见》明确资管产品应当在账户开立、产权登记、法律诉讼等方面享有平等地位，要求金融监督管理部门对各类金融机构开展资管业务平等准入。同时，规范嵌套层级，允许资管产品再投资一层资管产品，但所投资的产品不得再投资公募证券投资基金以外的产品，禁止开展规避投资范围、杠杆约束等监管要求的通道业务。考虑到现实情况，投资能力不足的金融机构仍然可以委托其他机构投资，但不得因此而免除自身应当承担的责任，公募资管产品的受托机构必须为金融机构，受托机构不得再进行转委托。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　问：《意见》对智能投顾业务作出了哪些规范？主要考虑是什么？\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　答：金融科技的发展正在深刻改变金融业的服务方式，在资管领域就突出体现在智能投资顾问。近年来，智能投资顾问在美国市场快速崛起，在国内也发展迅速，目前已有数十家机构推出该项业务。但运用人工智能技术开展投资顾问、资管等业务，由于服务对象多为长尾客户，风险承受能力较低，如果投资者适当性管理、风险提示不到位，容易引发不稳定事件。而且，算法同质化可能引发顺周期高频交易，加剧市场波动，算法的“黑箱属性”还可能使其成为规避监管的工具，技术局限、网络安全等风险也不容忽视。为此，《意见》从前瞻性角度，区分金融机构运用人工智能技术开展投资顾问和资管业务两种情形，分别进行了规范。一方面，取得投资顾问资质的机构在具备相应技术条件的情况下，可以运用人工智能技术开展投资顾问业务，非金融机构不得借助智能投资顾问超范围经营或变相开展资管业务；另一方面，金融机构运用人工智能技术开展资管业务，不得夸大宣传或误导投资者，应当报备模型主要参数及资产配置主要逻辑，明晰交易流程，强化留痕管理，避免算法同质化，因算法模型缺陷或信息系统异常引发羊群效应时，应当强制人工介入。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　问：对资管业务的监管理念是什么？监管协调包括哪些举措？\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　答：针对分业监管下标准差异催生套利空间的弊端，加强监管协调，强化宏观审慎管理，按照“实质重于形式”原则实施功能监管，是规范资管业务的必要举措。《意见》明确，中国人民银行负责对资管业务实施宏观审慎管理，按照产品类型而非机构类型统一标准规制，同类产品适用同一监管标准，减少监管真空，消除套利空间。金融监督管理部门在资管业务的市场准入和日常监管中，要强化功能监管。中国人民银行牵头建立资管产品统一报告制度和信息系统，对产品的发售、投资、兑付等各个环节进行实时、全面、动态监测，为穿透监管奠定坚实基础。继续加强监管协调，金融监督管理部门在《意见》框架内，研究制定配套细则，配套细则之间要相互衔接，避免产生新的监管套利和不公平竞争。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　问：非金融机构开展资管业务需要符合哪些规定？\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　答：当前，除金融机构外，互联网企业、各类投资顾问公司等非金融机构开展资管业务也十分活跃，由于缺乏市场准入和持续监管，产品分拆、误导宣传、资金侵占等问题较为突出，甚至演变为非法集资、非法吸收公众存款、非法发行证券，扰乱金融秩序，威胁社会稳定。为规范市场秩序，切实保障投资者合法权益，《意见》明确提出，资管业务作为金融业务，必须纳入金融监管，非金融机构不得发行、销售资管产品，国家另有规定的除外。“国家另有规定的除外”主要指私募投资基金的发行和销售，私募投资基金适用私募投资基金专门法律、行政法规，私募投资基金专门法律、行政法规中没有明确规定的，适用《意见》。非金融机构和个人未经金融监督管理部门许可，不得代销资管产品。针对非金融机构违法违规开展资管业务的情况，尤其是利用互联网平台等分拆销售具有投资门槛的投资标的、通过增信措施掩盖产品风险、设立产品二级交易市场等行为，按照国家规定进行规范清理。非金融机构违法违规开展资管业务的，依法予以处罚，同时承诺或进行刚性兑付的，依法从重处罚。\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　问：《意见》的过渡期如何设置？“新老划断”具体如何实施？\r\n</p>\r\n<p style=\"padding: 0px; margin-top: 1em; margin-bottom: 0em; line-height: 2;\">\r\n    　　答：为确保平稳过渡，《意见》充分考虑存量资管产品期限、市场规模及其所投资资产的期限和规模，兼顾增量资管产品的合理发行，提出按照“新老划断”原则设置过渡期。过渡期设置为“自《意见》发布之日起至2020年底”，相比征求意见稿而言，延长了一年半的时间，给予金融机构更为充足的整改和转型时间。过渡期内，金融机构发行新产品应当符合《意见》的规定；为接续存量产品所投资的未到期资产，维持必要的流动性和市场稳定，可以发行老产品对接，但应当严格控制在存量产品整体规模内，并有序压缩递减，防止过渡期结束时出现断崖效应。金融机构还需制定过渡期内的整改计划，明确时间进度安排，并报送相关金融监督管理部门，由其认可并监督实施，同时报备中国人民银行，对提前完成整改的机构，给予适当监管激励。过渡期结束后，金融机构的资管产品按照《意见》进行全面规范（因子公司尚未成立而达不到第三方独立托管要求的情形除外），金融机构不得再发行或存续违反《意见》规定的资管产品。\r\n</p>\r\n<ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\">\r\n    <li>\r\n        <p>\r\n            <br/>\r\n        </p>\r\n    </li>\r\n</ul>\r\n<p>\r\n    责任编辑：虫儿飞hsj\r\n</p>\r\n<p>\r\n    <span style=\"line-height: 27px; background-color: rgb(204, 0, 0); display: block; width: 74px; text-align: center; color: rgb(255, 255, 255); font-size: 14px;\">相关稿件</span>\r\n</p>\r\n<p>\r\n    <br/>\r\n</p>', '2018-04-29 11:09:52', '2018-04-29 11:24:58');

-- ----------------------------
-- Table structure for `authentic`
-- ----------------------------
DROP TABLE IF EXISTS `authentic`;
CREATE TABLE `authentic` (
  `uid` int(11) NOT NULL COMMENT '用户ID，关联users.id',
  `full_name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `id_card` varchar(20) DEFAULT NULL COMMENT '身份证',
  `birth` int(11) DEFAULT NULL COMMENT '出生日期',
  `sex` tinyint(4) DEFAULT NULL COMMENT '性别，1/男 2/女',
  `address` varchar(50) DEFAULT NULL COMMENT '身份证地址',
  `nation` varchar(20) DEFAULT NULL COMMENT '民族',
  `valid_begin` int(11) DEFAULT NULL COMMENT '签发日期',
  `valid_end` int(11) DEFAULT NULL COMMENT '失效日期',
  `department` varchar(50) DEFAULT NULL COMMENT '签发机关',
  `identity_status` tinyint(4) DEFAULT '1' COMMENT '实名认证结果，1/未认证 2/已认证',
  `matching` tinyint(4) DEFAULT '0' COMMENT '人脸识别匹配度，单位为百分之一',
  `matching_status` tinyint(4) DEFAULT '0' COMMENT '人脸识别结果，1/正确 2/不正确',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='实名认证表';

-- ----------------------------
-- Records of authentic
-- ----------------------------
INSERT INTO `authentic` VALUES ('110', '潘嘉伟', '34082719921023137X', '19921023', '1', '安徽省安庆市望江县杨湾镇曾墩村马丰组461号', '汉', '20100802', '20200802', '望江县公安局', '2', '1', '1', '2018-04-27 10:10:52', '2018-06-07 15:05:38');
INSERT INTO `authentic` VALUES ('115', '赵晨光', '32128419940912301X', '19940912', '1', '江苏省姜堰市姜堰镇双寿村六组17号', '汉', '20150817', '20250817', '姜堰市公安局', '2', '1', '1', '2018-04-27 18:46:25', '2018-04-27 18:46:46');
INSERT INTO `authentic` VALUES ('117', '马守超', '320721198611192816', '19861119', '1', '江苏省苏州市虎丘区致能大道106号', '汉', '20070510', '20170510', '苏州市公安局苏州国际教育园分局', '2', '95', '1', '2018-04-29 16:33:50', '2018-04-29 16:35:17');
INSERT INTO `authentic` VALUES ('129', '王晶晶', '360424198612140014', '19861214', '1', '江西省九江市修水县义宁镇西摆街29号', '汉', '20170518', '20370518', '修水县公安局', '2', '93', '1', '2018-04-29 17:04:55', '2018-04-29 17:05:20');
INSERT INTO `authentic` VALUES ('150', '孙韡', '310115198710203611', '19871020', '1', '上海市浦东新区思浦路8号105室', '汉', '20150622', '20350622', '上海市公安局浦东分局', '2', null, null, '2018-05-03 15:01:20', '2018-05-03 15:01:20');
INSERT INTO `authentic` VALUES ('178', '孟祥', '411122199209120153', '19920912', '1', '河南省临颍县城关镇娘娘庙村95号', '汉', '20090815', '20190815', '临颍县公安局', '2', '93', '1', '2018-06-21 09:43:39', '2018-06-21 09:44:13');
INSERT INTO `authentic` VALUES ('188', '冯晓杰', '610322199102103916', '19910210', '1', '陕西省凤翔县唐村乡邱村四组014号', '汉', '20170531', '20370531', '凤翔县公安局', '2', '92', '1', '2018-05-28 16:36:37', '2018-05-28 16:37:01');
INSERT INTO `authentic` VALUES ('229', '唐庆斌', '350103199309204219', '19930920', '1', '福建省福州市台江区河下小区9座302单元', '汉', '20100806', '20200806', '福州市公安局台江分局', '2', '91', '1', '2018-05-31 11:30:38', '2018-05-31 11:52:16');
INSERT INTO `authentic` VALUES ('248', '陈慧清', '140721199306250048', '19930625', '2', '山西省榆社县郝北镇云安村迎春路3号', '汉', '20110210', '20210210', '榆社县公安局', '2', '92', '1', '2018-06-10 11:17:56', '2018-06-10 11:18:14');
INSERT INTO `authentic` VALUES ('249', '房尧鑫', '142703199209033315', '19920903', '1', '山西省河津市铝基地太华区8栋2门2号', '汉', '20081212', '20181212', '河津市公安局', '2', '93', '1', '2018-06-22 09:40:54', '2018-06-22 09:41:47');
INSERT INTO `authentic` VALUES ('264', '李冲冲', '411422199302283025', '19930228', '2', '河南省睢县孙聚寨乡西李村230号', '汉', '20140404', '20240404', '睢县公安局', '2', '93', '1', '2018-05-28 16:15:52', '2018-06-20 14:04:24');
INSERT INTO `authentic` VALUES ('266', '柳恒博', '410421199310091018', '19931009', '1', '河南省宝丰县闹店镇火神庙村谷官营村50号', '汉', '20110718', '20210718', '宝丰县公安局', '2', '91', '1', '2018-06-21 09:36:45', '2018-06-21 09:37:33');
INSERT INTO `authentic` VALUES ('267', '许睿杰', '352201199501052133', '19950105', '1', '福建省宁德市蕉城区七都镇六都村永兴西路11号', '汉', '20150804', '20250804', '宁德市公安局蕉城分局', '2', '92', '1', '2018-06-21 09:48:02', '2018-06-21 09:48:27');
INSERT INTO `authentic` VALUES ('273', '郑寅材', '510321199603012158', '19960301', '1', '四川省自贡市贡井区桥头镇团结村2组56号', '汉', '20130830', '20230830', '自贡市公安局贡井分局', '2', '96', '1', '2018-07-03 15:39:08', '2018-07-03 15:39:34');

-- ----------------------------
-- Table structure for `auto_repay_log`
-- ----------------------------
DROP TABLE IF EXISTS `auto_repay_log`;
CREATE TABLE `auto_repay_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `br_id` int(11) DEFAULT NULL COMMENT '借款人还款计划ID，关联borrower_repay.id',
  `fy_fr_id` int(11) DEFAULT NULL COMMENT '富友资金记录ID，关联fy_fund_record.id',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态，1/还款成功 2/还款失败',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `exec_time` int(11) DEFAULT NULL COMMENT '执行时间',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `br_id` (`br_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='自动还款日志(已废用)';

-- ----------------------------
-- Records of auto_repay_log
-- ----------------------------
INSERT INTO `auto_repay_log` VALUES ('4', '746', null, '2', '自动还款划拨失败', '1526793447', '2018-05-20 13:16:09', '2018-05-20 13:16:09');
INSERT INTO `auto_repay_log` VALUES ('6', '746', null, '2', '自动还款划拨失败', '1526793493', '2018-05-20 13:16:55', '2018-05-20 13:16:55');
INSERT INTO `auto_repay_log` VALUES ('7', '746', '426', '1', null, '1526793595', '2018-05-20 13:18:37', '2018-05-20 13:18:37');
INSERT INTO `auto_repay_log` VALUES ('8', '746', '428', '1', null, '1526793823', '2018-05-20 13:22:24', '2018-05-20 13:22:24');
INSERT INTO `auto_repay_log` VALUES ('9', '746', '430', '1', null, '1526793982', '2018-05-20 13:25:03', '2018-05-20 13:25:03');
INSERT INTO `auto_repay_log` VALUES ('11', '746', null, '2', '自动还款划拨失败', '1526794185', '2018-05-20 13:28:26', '2018-05-20 13:28:26');
INSERT INTO `auto_repay_log` VALUES ('12', '746', '438', '1', null, '1526807635', '2018-05-20 17:15:09', '2018-05-20 17:15:09');
INSERT INTO `auto_repay_log` VALUES ('13', '746', '440', '1', null, '1526807825', '2018-05-20 17:18:19', '2018-05-20 17:18:19');
INSERT INTO `auto_repay_log` VALUES ('14', '746', '442', '1', null, '1526807853', '2018-05-20 17:18:46', '2018-05-20 17:18:46');
INSERT INTO `auto_repay_log` VALUES ('15', '746', '444', '1', null, '1526807892', '2018-05-20 17:19:25', '2018-05-20 17:19:25');
INSERT INTO `auto_repay_log` VALUES ('16', '816', '697', '1', null, '1527127753', '2018-05-24 10:10:30', '2018-05-24 10:10:30');
INSERT INTO `auto_repay_log` VALUES ('17', '816', '699', '1', null, '1527127810', '2018-05-24 10:11:27', '2018-05-24 10:11:27');
INSERT INTO `auto_repay_log` VALUES ('18', '816', '701', '1', null, '1527127846', '2018-05-24 10:12:03', '2018-05-24 10:12:03');
INSERT INTO `auto_repay_log` VALUES ('19', '816', '703', '1', null, '1527128021', '2018-05-24 10:14:58', '2018-05-24 10:14:58');
INSERT INTO `auto_repay_log` VALUES ('20', '816', '705', '1', null, '1527128190', '2018-05-24 10:17:47', '2018-05-24 10:17:47');
INSERT INTO `auto_repay_log` VALUES ('21', '821', '707', '1', null, '1527128229', '2018-05-24 10:18:26', '2018-05-24 10:18:26');
INSERT INTO `auto_repay_log` VALUES ('22', '821', '709', '1', null, '1527132010', '2018-05-24 11:21:27', '2018-05-24 11:21:27');
INSERT INTO `auto_repay_log` VALUES ('23', '821', '711', '1', null, '1527132206', '2018-05-24 11:24:43', '2018-05-24 11:24:43');
INSERT INTO `auto_repay_log` VALUES ('24', '821', '713', '1', null, '1527132305', '2018-05-24 11:26:22', '2018-05-24 11:26:22');
INSERT INTO `auto_repay_log` VALUES ('25', '1314', null, '2', '银行卡代扣失败', '1527674041', '2018-05-30 17:52:40', '2018-05-30 17:52:40');
INSERT INTO `auto_repay_log` VALUES ('26', '1314', null, '2', '银行卡代扣失败', '1527674969', '2018-05-30 18:08:08', '2018-05-30 18:08:08');

-- ----------------------------
-- Table structure for `banner`
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` tinyint(1) NOT NULL COMMENT 'banner 类型   1借款端  2理财端',
  `url` varchar(1000) NOT NULL COMMENT 'banner url',
  `href` varchar(255) DEFAULT NULL COMMENT '活动地址',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1：正常  2删除',
  `created_at` timestamp NULL,
  `updated_at` timestamp NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COMMENT='Banner表';

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('1', '2', 'https://s31.postimg.cc/ax74b7kyj/20180426192850.png', 'http://wap.mymoneygohome.com/info-publish.html', '1', '2018-04-25 16:36:40', '2018-04-26 20:16:34');
INSERT INTO `banner` VALUES ('14', '1', 'https://s31.postimg.cc/6qhoib3qj/20180426171213.png', 'http://wap.mymoneygohome.com/loanStrategy.html', '1', '2018-04-26 05:38:11', '2018-04-26 20:10:08');
INSERT INTO `banner` VALUES ('15', '1', 'https://s31.postimg.cc/6qhoib3qj/20180426171213.png', 'https://www.baidu.com/', '-1', '2018-06-06 09:53:15', '2018-06-06 09:54:04');

-- ----------------------------
-- Table structure for `borrower`
-- ----------------------------
DROP TABLE IF EXISTS `borrower`;
CREATE TABLE `borrower` (
  `uid` int(11) NOT NULL COMMENT '用户ID，关联users.id',
  `loan_money` int(11) NOT NULL DEFAULT '0' COMMENT '总共借款金额，单位为分',
  `no_repay_money` int(11) NOT NULL DEFAULT '0' COMMENT '待还金额，单位为分',
  `education` varchar(50) DEFAULT NULL COMMENT '学历',
  `live_address` varchar(50) DEFAULT NULL COMMENT '居住地址',
  `detail_address` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `industry` varchar(50) DEFAULT NULL COMMENT '单位所属行业',
  `work_nature` varchar(50) DEFAULT NULL COMMENT '工作性质',
  `corporate_name` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `income` varchar(50) DEFAULT NULL COMMENT '收入情况',
  `liabilities` varchar(50) DEFAULT NULL COMMENT '负债情况',
  `contacts1_relation` varchar(50) DEFAULT NULL COMMENT '联系人关系1',
  `contacts1_fullname` varchar(50) DEFAULT NULL COMMENT '联系人姓名1',
  `contacts1_mobile` varchar(20) DEFAULT NULL COMMENT '联系人手机号1',
  `contacts2_relation` varchar(50) DEFAULT NULL COMMENT '联系人关系2',
  `contacts2_fullname` varchar(50) DEFAULT NULL COMMENT '联系人姓名2',
  `contacts2_mobile` varchar(20) DEFAULT NULL COMMENT '联系人手机号2',
  `profile_status` tinyint(4) DEFAULT '0' COMMENT '个人资料是否验证，0/未验证 1/已验证',
  `communi_status` tinyint(4) DEFAULT '0' COMMENT '通信验证状态，0/未验证 1/已验证',
  `bee_score` double(10,2) DEFAULT '0.00' COMMENT '小蜜分分数',
  `phone_gray_score` double(10,2) DEFAULT '0.00' COMMENT '灰度分分数',
  `quota` int(11) DEFAULT '0' COMMENT '可借额度，单位为元',
  `test_quota_time` int(11) DEFAULT '0' COMMENT '上次测试额度的时间戳',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='借款人表';

-- ----------------------------
-- Records of borrower
-- ----------------------------
INSERT INTO `borrower` VALUES ('10', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-01 22:15:14', '2018-06-07 15:06:27');
INSERT INTO `borrower` VALUES ('11', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-01 21:37:30', '2018-06-07 15:06:46');
INSERT INTO `borrower` VALUES ('132', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, null, '20', '0', '2018-05-11 20:17:55', '2018-05-16 13:27:04');
INSERT INTO `borrower` VALUES ('133', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, null, '20000', '0', '2018-05-01 14:40:05', '2018-05-11 20:21:28');
INSERT INTO `borrower` VALUES ('137', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-01 15:14:52', '2018-05-01 15:14:52');
INSERT INTO `borrower` VALUES ('139', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-01 16:31:44', '2018-05-01 16:31:44');
INSERT INTO `borrower` VALUES ('140', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-01 16:51:04', '2018-05-01 16:51:04');
INSERT INTO `borrower` VALUES ('141', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-01 21:28:07', '2018-05-01 21:28:07');
INSERT INTO `borrower` VALUES ('142', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-01 21:32:56', '2018-05-01 21:32:56');
INSERT INTO `borrower` VALUES ('143', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-01 21:35:02', '2018-05-01 21:35:02');
INSERT INTO `borrower` VALUES ('150', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-03 14:22:34', '2018-05-03 14:22:34');
INSERT INTO `borrower` VALUES ('151', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-07 15:34:03', '2018-05-07 15:34:03');
INSERT INTO `borrower` VALUES ('152', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-07 15:35:22', '2018-05-07 15:35:22');
INSERT INTO `borrower` VALUES ('153', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-07 15:39:05', '2018-05-07 15:39:05');
INSERT INTO `borrower` VALUES ('154', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-07 15:40:29', '2018-05-07 15:40:29');
INSERT INTO `borrower` VALUES ('155', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-07 15:41:43', '2018-05-07 15:41:43');
INSERT INTO `borrower` VALUES ('156', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-07 15:43:25', '2018-05-07 15:43:25');
INSERT INTO `borrower` VALUES ('157', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-07 16:11:34', '2018-05-07 16:11:34');
INSERT INTO `borrower` VALUES ('158', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-07 16:24:16', '2018-05-07 16:24:16');
INSERT INTO `borrower` VALUES ('159', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-07 16:27:08', '2018-05-07 16:27:08');
INSERT INTO `borrower` VALUES ('160', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-07 16:37:46', '2018-05-07 16:37:46');
INSERT INTO `borrower` VALUES ('161', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-08 09:44:17', '2018-05-08 09:44:17');
INSERT INTO `borrower` VALUES ('162', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-08 13:17:33', '2018-05-08 13:17:33');
INSERT INTO `borrower` VALUES ('163', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-08 13:21:03', '2018-05-08 13:21:03');
INSERT INTO `borrower` VALUES ('164', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-08 13:26:47', '2018-05-08 13:26:47');
INSERT INTO `borrower` VALUES ('165', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-08 13:30:34', '2018-05-08 13:30:34');
INSERT INTO `borrower` VALUES ('166', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-08 13:49:21', '2018-05-08 13:49:21');
INSERT INTO `borrower` VALUES ('167', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-08 14:06:49', '2018-05-08 14:06:49');
INSERT INTO `borrower` VALUES ('168', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-08 14:08:17', '2018-05-08 14:08:17');
INSERT INTO `borrower` VALUES ('169', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-08 14:57:15', '2018-05-08 14:57:15');
INSERT INTO `borrower` VALUES ('170', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-08 15:15:18', '2018-05-08 15:15:18');
INSERT INTO `borrower` VALUES ('171', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-08 15:17:44', '2018-05-08 15:17:44');
INSERT INTO `borrower` VALUES ('172', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-08 15:23:14', '2018-05-08 15:23:14');
INSERT INTO `borrower` VALUES ('173', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-09 13:34:02', '2018-05-09 13:34:02');
INSERT INTO `borrower` VALUES ('174', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-09 17:06:04', '2018-05-09 17:06:04');
INSERT INTO `borrower` VALUES ('175', '0', '0', '100', '1', '1', '1', '1', '1', '1', '1', '0000001', '1', '1000', '1000', '1', '1', '1', '0', '0.00', '0.00', '0', '0', '2018-05-14 16:07:06', '2018-06-26 15:04:05');
INSERT INTO `borrower` VALUES ('176', '0', '0', '大学专科', '上海/上海/虹口区', '淞虹路218号', '金融、保险业', '上班族', '上海挖宝金融', '10000元以上', '3000-5000元', '母亲', '谢素菊', '16602153447', '同事', '李林建', '13755740375', '1', '1', '493.00', '0.00', '0', '1526380113', '2018-05-15 18:15:28', '2018-05-15 18:28:33');
INSERT INTO `borrower` VALUES ('177', '0', '0', null, '上海/上海/虹口区', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-21 14:49:51', '2018-05-30 19:54:28');
INSERT INTO `borrower` VALUES ('178', '500000', '522500', '大学专科', '河南/漯河/临颍县', '南街村', '信息传输、计算机服务和软件业', '上班族', '上海挖宝', '3000-5000元', '3000元以下', '父亲', '孟', '13939506859', '朋友', '李', '18699424471', '1', '1', '412.00', '27.67', '50000', '1529484666', '2018-05-22 13:49:59', '2018-06-25 10:49:47');
INSERT INTO `borrower` VALUES ('179', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-22 17:10:46', '2018-05-22 17:10:46');
INSERT INTO `borrower` VALUES ('180', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-22 18:13:10', '2018-05-22 18:13:10');
INSERT INTO `borrower` VALUES ('181', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-22 19:45:53', '2018-05-22 19:45:53');
INSERT INTO `borrower` VALUES ('182', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-22 20:06:56', '2018-05-22 20:06:56');
INSERT INTO `borrower` VALUES ('186', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-28 14:54:22', '2018-05-28 14:54:22');
INSERT INTO `borrower` VALUES ('187', '0', '0', '大学专科', '上海/上海/浦东新区', '世纪公园', '信息传输、计算机服务和软件业', '上班族', '上海棋至', '3000-5000元', '3000元以下', '子女', '礼拜天', '18236968869', '朋友', '雷雷', '15000916088', '1', '1', '493.00', '49.52', '5000', '1528441320', '2018-05-28 16:07:43', '2018-06-08 15:02:00');
INSERT INTO `borrower` VALUES ('188', '600000', '600000', '大学本科', '上海/上海/青浦区', '徐泾镇徐泾新区24号', '信息传输、计算机服务和软件业', '上班族', '上海挖宝金融信息服务有限公司', '10000元以上', '3000-5000元', '父亲', '冯', '18291791589', '朋友', '冯', '13571742638', '1', '1', '464.00', '18.19', '5000', '1529478694', '2018-05-28 16:31:50', '2018-06-21 14:44:19');
INSERT INTO `borrower` VALUES ('189', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-28 17:24:39', '2018-05-28 17:24:39');
INSERT INTO `borrower` VALUES ('190', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-28 17:56:59', '2018-05-28 17:56:59');
INSERT INTO `borrower` VALUES ('192', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-29 10:42:27', '2018-05-29 10:42:27');
INSERT INTO `borrower` VALUES ('194', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-29 10:43:52', '2018-05-29 10:43:52');
INSERT INTO `borrower` VALUES ('200', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-29 14:17:26', '2018-05-29 14:17:26');
INSERT INTO `borrower` VALUES ('201', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-29 14:28:44', '2018-05-29 14:28:44');
INSERT INTO `borrower` VALUES ('202', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-29 14:51:06', '2018-05-29 14:51:06');
INSERT INTO `borrower` VALUES ('204', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-29 15:13:02', '2018-05-29 15:13:02');
INSERT INTO `borrower` VALUES ('205', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-29 15:26:05', '2018-05-29 15:26:05');
INSERT INTO `borrower` VALUES ('206', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-29 15:40:54', '2018-05-29 15:40:54');
INSERT INTO `borrower` VALUES ('207', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-29 16:08:02', '2018-05-29 16:08:02');
INSERT INTO `borrower` VALUES ('208', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-29 16:08:42', '2018-05-29 16:08:42');
INSERT INTO `borrower` VALUES ('209', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-29 16:11:23', '2018-05-29 16:11:23');
INSERT INTO `borrower` VALUES ('210', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-29 16:12:10', '2018-05-29 16:12:10');
INSERT INTO `borrower` VALUES ('211', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-29 16:14:01', '2018-05-29 16:14:01');
INSERT INTO `borrower` VALUES ('212', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-29 16:14:20', '2018-05-29 16:14:20');
INSERT INTO `borrower` VALUES ('213', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-29 16:17:48', '2018-05-29 16:17:48');
INSERT INTO `borrower` VALUES ('214', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-29 16:18:48', '2018-05-29 16:18:48');
INSERT INTO `borrower` VALUES ('215', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-29 16:19:40', '2018-05-29 16:19:40');
INSERT INTO `borrower` VALUES ('216', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-29 16:20:12', '2018-05-29 16:20:12');
INSERT INTO `borrower` VALUES ('217', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-29 16:20:47', '2018-05-29 16:20:47');
INSERT INTO `borrower` VALUES ('218', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-29 16:24:02', '2018-05-29 16:24:02');
INSERT INTO `borrower` VALUES ('219', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-29 16:24:55', '2018-05-29 16:24:55');
INSERT INTO `borrower` VALUES ('220', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-29 16:27:47', '2018-05-29 16:27:47');
INSERT INTO `borrower` VALUES ('221', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-29 16:37:23', '2018-05-29 16:37:23');
INSERT INTO `borrower` VALUES ('222', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-29 16:39:23', '2018-05-29 16:39:23');
INSERT INTO `borrower` VALUES ('223', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-29 16:44:03', '2018-05-29 16:44:03');
INSERT INTO `borrower` VALUES ('224', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-29 16:54:26', '2018-05-29 16:54:26');
INSERT INTO `borrower` VALUES ('226', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-31 11:00:36', '2018-05-31 11:00:36');
INSERT INTO `borrower` VALUES ('227', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-31 11:05:22', '2018-05-31 11:05:22');
INSERT INTO `borrower` VALUES ('228', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-05-31 11:07:09', '2018-05-31 11:07:09');
INSERT INTO `borrower` VALUES ('229', '200000', '209000', '大学本科', '上海/上海/长宁区', '啦啦啦啦啦', '农、林、牧、渔业', '个体', '阿里巴巴', '10000元以上', '3000元以下', '子女', '孙仲谋', '13663666666', '朋友', '王思聪', '13663866666', '1', '1', '486.00', '87.37', '5000', '1527744039', '2018-05-31 11:24:08', '2018-06-25 14:42:10');
INSERT INTO `borrower` VALUES ('230', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-04 13:24:51', '2018-06-04 13:24:51');
INSERT INTO `borrower` VALUES ('231', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-04 13:28:10', '2018-06-04 13:28:10');
INSERT INTO `borrower` VALUES ('232', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-04 19:13:12', '2018-06-04 19:13:12');
INSERT INTO `borrower` VALUES ('233', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-04 19:24:28', '2018-06-04 19:24:28');
INSERT INTO `borrower` VALUES ('234', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-04 19:27:12', '2018-06-04 19:27:12');
INSERT INTO `borrower` VALUES ('235', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-05 13:30:42', '2018-06-05 13:30:42');
INSERT INTO `borrower` VALUES ('236', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-05 13:32:44', '2018-06-05 13:32:44');
INSERT INTO `borrower` VALUES ('237', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-05 13:37:01', '2018-06-05 13:37:01');
INSERT INTO `borrower` VALUES ('238', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-05 13:38:08', '2018-06-05 13:38:08');
INSERT INTO `borrower` VALUES ('239', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-05 13:41:28', '2018-06-05 13:41:28');
INSERT INTO `borrower` VALUES ('240', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-05 13:45:53', '2018-06-05 13:45:53');
INSERT INTO `borrower` VALUES ('241', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-05 14:13:57', '2018-06-05 14:13:57');
INSERT INTO `borrower` VALUES ('242', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-05 14:22:43', '2018-06-05 14:22:43');
INSERT INTO `borrower` VALUES ('243', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-06 16:08:33', '2018-06-06 16:08:33');
INSERT INTO `borrower` VALUES ('244', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-08 14:25:09', '2018-06-08 14:25:09');
INSERT INTO `borrower` VALUES ('245', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-08 15:19:54', '2018-06-08 15:19:54');
INSERT INTO `borrower` VALUES ('246', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-08 15:28:32', '2018-06-08 15:28:32');
INSERT INTO `borrower` VALUES ('247', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-08 15:39:27', '2018-06-08 15:39:27');
INSERT INTO `borrower` VALUES ('248', '300000', '200000', '大学专科', '上海/上海/浦东新区', '浦东新区', '信息传输、计算机服务和软件业', '上班族', '挖宝金融', '3000元以下', '3000元以下', '子女', '小蔡', '18334795112', '朋友', '小红', '18334795112', '1', '1', '415.00', '63.08', '5000', '1528600979', '2018-06-10 11:17:01', '2018-07-02 14:22:39');
INSERT INTO `borrower` VALUES ('249', '0', '0', '研究生及以上', '北京/北京/朝阳区', '朝阳区东三环中路', '信息传输、计算机服务和软件业', '上班族', '上海有限责任公司', '3000元以下', '3000元以下', '子女', '张小小', '15000019498', '同事', '张大大', '15000019498', '1', '1', '0.00', '0.00', '0', '0', '2018-06-12 13:16:11', '2018-06-22 09:47:53');
INSERT INTO `borrower` VALUES ('250', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-12 20:20:30', '2018-06-12 20:20:30');
INSERT INTO `borrower` VALUES ('251', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-12 20:22:22', '2018-06-12 20:22:22');
INSERT INTO `borrower` VALUES ('252', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-12 20:28:22', '2018-06-12 20:28:22');
INSERT INTO `borrower` VALUES ('253', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-12 20:54:44', '2018-06-12 20:54:44');
INSERT INTO `borrower` VALUES ('254', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-13 09:52:53', '2018-06-13 09:52:53');
INSERT INTO `borrower` VALUES ('255', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-13 10:00:54', '2018-06-13 10:00:54');
INSERT INTO `borrower` VALUES ('256', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-13 10:12:10', '2018-06-13 10:12:10');
INSERT INTO `borrower` VALUES ('257', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-13 10:15:03', '2018-06-13 10:15:03');
INSERT INTO `borrower` VALUES ('258', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-13 10:16:14', '2018-06-13 10:16:14');
INSERT INTO `borrower` VALUES ('259', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-13 10:19:40', '2018-06-13 10:19:40');
INSERT INTO `borrower` VALUES ('260', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-13 10:21:04', '2018-06-13 10:21:04');
INSERT INTO `borrower` VALUES ('261', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-13 10:22:28', '2018-06-13 10:22:28');
INSERT INTO `borrower` VALUES ('262', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-13 10:25:14', '2018-06-13 10:25:14');
INSERT INTO `borrower` VALUES ('263', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-13 10:27:13', '2018-06-13 10:27:13');
INSERT INTO `borrower` VALUES ('264', '300000', '100000', '大学本科', '上海市/上海/浦东新区', '淞虹路218号', '农、林、牧、渔业', '上班族', '挖宝金融', '10000元以上', '3000元以下', '子女', '拜拜', '18236968869', '朋友', '雷雷', '15000916081', '1', '1', '493.00', '49.52', '50000', '1529546401', '2018-05-01 15:04:51', '2018-07-02 14:22:38');
INSERT INTO `borrower` VALUES ('266', '0', '0', '大学本科', '北京/北京/东城区', '11路', '信息传输、计算机服务和软件业', '上班族', '上海挖宝', '5000-10000元', '3000元以下', '父亲', '刘志以', '18339919633', '朋友', '及其', '18339919633', '1', '1', '360.00', '26.85', '3000', '1529545206', '2018-06-21 09:35:59', '2018-06-21 09:40:06');
INSERT INTO `borrower` VALUES ('267', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-21 09:46:53', '2018-06-21 09:46:53');
INSERT INTO `borrower` VALUES ('268', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-27 09:43:06', '2018-06-27 09:43:06');
INSERT INTO `borrower` VALUES ('271', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0.00', '0.00', '0', '0', '2018-06-28 19:51:21', '2018-06-28 19:51:21');
INSERT INTO `borrower` VALUES ('273', '0', '0', '大学专科', '北京/北京/东城区', '楼房', '信息传输、计算机服务和软件业', '上班族', '棋至文化', '5000-10000元', '3000元以下', '父亲', '还没', '13285225852', '朋友', '后者', '13285214785', '1', '1', '488.00', '55.73', '5000', '1530604450', '2018-07-03 15:38:29', '2018-07-03 15:54:10');

-- ----------------------------
-- Table structure for `borrower_contact_info`
-- ----------------------------
DROP TABLE IF EXISTS `borrower_contact_info`;
CREATE TABLE `borrower_contact_info` (
  `uid` int(10) unsigned NOT NULL,
  `borrower_info_json` mediumtext COMMENT '借款人信息json',
  `created_at` timestamp NULL,
  `updated_at` timestamp NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='借款人通讯信息表';

-- ----------------------------
-- Records of borrower_contact_info
-- ----------------------------
INSERT INTO `borrower_contact_info` VALUES ('81', '{\"note\":\"\",\"report_data\":{\"user_info_check\":{\"check_black_info\":{\"contacts_class1_blacklist_cnt\":0,\"contacts_router_ratio\":0.44117647058823528,\"contacts_class2_blacklist_cnt\":270,\"contacts_router_cnt\":15,\"contacts_class1_cnt\":34,\"phone_gray_score\":52},\"check_search_info\":{\"arised_open_web\":[],\"phone_with_other_idcards\":[\"410421199310091018\"],\"idcard_with_other_phones\":[\"17621133265\",\"18299092235\"],\"register_org_cnt\":0,\"idcard_with_other_names\":[],\"searched_org_type\":[\"\\u7ebf\\u4e0a\\u6d88\\u8d39\\u5206\\u671f\",\"\\u5176\\u4ed6\"],\"searched_org_cnt\":2,\"register_org_type\":[],\"phone_with_other_names\":[\"\\u67f3\\u6052\\u535a\"]}},\"main_service\":[{\"service_details\":[{\"interact_cnt\":11,\"interact_mth\":\"2017-10\"},{\"interact_cnt\":9,\"interact_mth\":\"2017-11\"},{\"interact_cnt\":9,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":5,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":5,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":3,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":5,\"interact_mth\":\"2018-04\"}],\"total_service_cnt\":47,\"company_type\":\"\\u94f6\\u884c\",\"company_name\":\"\\u4e2d\\u56fd\\u62db\\u5546\\u94f6\\u884c\\u5ba2\\u670d\\u7535\\u8bdd\"},{\"service_details\":[{\"interact_cnt\":2,\"interact_mth\":\"2017-10\"},{\"interact_cnt\":0,\"interact_mth\":\"2017-11\"},{\"interact_cnt\":5,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":2,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":3,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":27,\"interact_mth\":\"2018-04\"}],\"total_service_cnt\":39,\"company_type\":\"\\u8fd0\\u8425\\u5546\",\"company_name\":\"\\u4e2d\\u56fd\\u79fb\\u52a8\"},{\"service_details\":[{\"interact_cnt\":3,\"interact_mth\":\"2017-10\"},{\"interact_cnt\":4,\"interact_mth\":\"2017-11\"},{\"interact_cnt\":7,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":1,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-04\"}],\"total_service_cnt\":15,\"company_type\":\"\\u8fd0\\u8425\\u5546\",\"company_name\":\"\\u4e2d\\u56fd\\u79fb\\u52a8\\u5ba2\\u670d\\u70ed\\u7ebf\"},{\"service_details\":[{\"interact_cnt\":0,\"interact_mth\":\"2017-10\"},{\"interact_cnt\":4,\"interact_mth\":\"2017-11\"},{\"interact_cnt\":0,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-04\"}],\"total_service_cnt\":4,\"company_type\":\"\\u652f\\u4ed8\",\"company_name\":\"\\u4e2d\\u56fd\\u94f6\\u8054\\u5ba2\\u670d\\u7535\\u8bdd\"},{\"service_details\":[{\"interact_cnt\":0,\"interact_mth\":\"2017-10\"},{\"interact_cnt\":1,\"interact_mth\":\"2017-11\"},{\"interact_cnt\":2,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":1,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":1,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":1,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":1,\"interact_mth\":\"2018-04\"}],\"total_service_cnt\":7,\"company_type\":\"\\u623f\\u5730\\u4ea7\",\"company_name\":\"\\u4f4f\\u623f\\u516c\\u79ef\\u91d1\\u70ed\\u7ebf\"},{\"service_details\":[{\"interact_cnt\":4,\"interact_mth\":\"2017-10\"},{\"interact_cnt\":6,\"interact_mth\":\"2017-11\"},{\"interact_cnt\":0,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":12,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":5,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":8,\"interact_mth\":\"2018-04\"}],\"total_service_cnt\":35,\"company_type\":\"\\u94f6\\u884c\",\"company_name\":\"\\u5de5\\u5546\\u94f6\\u884c\\u5ba2\\u670d\\u7535\\u8bdd\"},{\"service_details\":[{\"interact_cnt\":1,\"interact_mth\":\"2017-10\"},{\"interact_cnt\":27,\"interact_mth\":\"2017-11\"},{\"interact_cnt\":12,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":4,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":8,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":9,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":5,\"interact_mth\":\"2018-04\"}],\"total_service_cnt\":66,\"company_type\":\"\\u94f6\\u884c\",\"company_name\":\"\\u62db\\u5546\\u94f6\\u884c\"},{\"service_details\":[{\"interact_cnt\":0,\"interact_mth\":\"2017-10\"},{\"interact_cnt\":3,\"interact_mth\":\"2017-11\"},{\"interact_cnt\":4,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":5,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":6,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":4,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":5,\"interact_mth\":\"2018-04\"}],\"total_service_cnt\":27,\"company_type\":\"\\u652f\\u4ed8\",\"company_name\":\"\\u652f\\u4ed8\\u5b9d\"},{\"service_details\":[{\"interact_cnt\":0,\"interact_mth\":\"2017-10\"},{\"interact_cnt\":0,\"interact_mth\":\"2017-11\"},{\"interact_cnt\":0,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":4,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":3,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-04\"}],\"total_service_cnt\":7,\"company_type\":\"\\u4e92\\u8054\\u7f51\",\"company_name\":\"\\u7f51\\u6613\"},{\"service_details\":[{\"interact_cnt\":0,\"interact_mth\":\"2017-10\"},{\"interact_cnt\":2,\"interact_mth\":\"2017-11\"},{\"interact_cnt\":0,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":1,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-04\"}],\"total_service_cnt\":3,\"company_type\":\"\\u7535\\u5546\",\"company_name\":\"\\u94c1\\u8def\\u552e\\u7968\"}],\"behavior_check\":[{\"check_point\":\"regular_circle\",\"score\":0,\"check_point_cn\":\"\\u670b\\u53cb\\u5708\\u5728\\u54ea\\u91cc\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740\"},{\"check_point\":\"phone_used_time\",\"score\":1,\"check_point_cn\":\"\\u53f7\\u7801\\u4f7f\\u7528\\u65f6\\u95f4\",\"result\":\"\\u81f3\\u5c11\\u4f7f\\u7528\\u4e86\\u534a\\u5e74\\u4ee5\\u4e0a(6-24\\u4e2a\\u6708\\uff0c\\u5305\\u542b6)\",\"evidence\":\"\\u6839\\u636e\\u53f7\\u7801[18221503642]\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u8ba4\\u8bc1\\u65f6\\u95f4,\\u63a8\\u7b97\\u8be5\\u53f7\\u7801\\u4f7f\\u752822\\u4e2a\\u6708\"},{\"check_point\":\"phone_silent\",\"score\":1,\"check_point_cn\":\"\\u624b\\u673a\\u9759\\u9ed8\\u60c5\\u51b5(\\u8fde\\u7eed24\\u5c0f\\u65f6\\u5185\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\\u8ba1\\u4e3a\\u9759\\u9ed8\\u4e00\\u5929)\",\"result\":\"200\\u5929\\u5185\\u670991\\u5929\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u6839\\u636e\\u8fd0\\u8425\\u5546\\u8be6\\u5355\\u6570\\u636e\\uff0c\\u8fde\\u7eed\\u4e09\\u5929\\u4ee5\\u4e0a\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f550\\u6b21\"},{\"check_point\":\"contact_each_other\",\"score\":1,\"check_point_cn\":\"\\u4e92\\u901a\\u8fc7\\u7535\\u8bdd\\u7684\\u53f7\\u7801\\u6570\\u91cf\",\"result\":\"\\u6570\\u91cf\\u6b63\\u5e38(10-100)\",\"evidence\":\"\\u4e92\\u901a\\u8fc7\\u7535\\u8bdd\\u7684\\u53f7\\u7801\\u670920\\u4e2a\\uff0c\\u6bd4\\u4f8b\\u4e3a15.75%\"},{\"check_point\":\"contact_macao\",\"score\":1,\"check_point_cn\":\"\\u6fb3\\u95e8\\u7535\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u6fb3\\u95e8\\u5730\\u533a\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_110\",\"score\":1,\"check_point_cn\":\"110\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e110\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_120\",\"score\":1,\"check_point_cn\":\"120\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e120\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_lawyer\",\"score\":1,\"check_point_cn\":\"\\u5f8b\\u5e08\\u53f7\\u7801\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e\\u5f8b\\u5e08\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_court\",\"score\":1,\"check_point_cn\":\"\\u6cd5\\u9662\\u53f7\\u7801\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e\\u6cd5\\u9662\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_night\",\"score\":1,\"check_point_cn\":\"\\u591c\\u95f4\\u6d3b\\u52a8\\u60c5\\u51b5(23\\u70b9-6\\u70b9)\",\"result\":\"\\u5f88\\u5c11\\u591c\\u95f4\\u6d3b\\u52a8(\\u591c\\u95f4\\u901a\\u8bdd\\u6bd4\\u4f8b\\u4f4e\\u4e8e20%)\",\"evidence\":\"\\u665a\\u95f4\\u6d3b\\u8dc3\\u9891\\u7387\\u5360\\u5168\\u5929\\u76844.49%\"},{\"check_point\":\"contact_loan\",\"score\":1,\"check_point_cn\":\"\\u8d37\\u6b3e\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u5f88\\u5c11\\u88ab\\u8054\\u7cfb(\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u5185\\uff0c\\u6216\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u4e0a\\u4e14\\u4e3b\\u52a8\\u547c\\u53eb\\u5360\\u6bd4\\u4f4e\\u4e8e20%)\",\"evidence\":\"\\u8054\\u7cfb\\u5217\\u8868:[\\u62db\\u5546\\u94f6\\u884c\\u4fe1\\u7528\\u5361]\\u4e3b\\u53eb3\\u6b21\\u51716.65\\u5206\\u949f\\uff0c\\u88ab\\u53eb0\\u6b21\\u51710.0\\u5206\\u949f\"},{\"check_point\":\"contact_bank\",\"score\":1,\"check_point_cn\":\"\\u94f6\\u884c\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u5f88\\u5c11\\u88ab\\u8054\\u7cfb(\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u5185\\uff0c\\u6216\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u4e0a\\u4e14\\u4e3b\\u52a8\\u547c\\u53eb\\u5360\\u6bd4\\u4f4e\\u4e8e20%)\",\"evidence\":\"\\u8054\\u7cfb\\u5217\\u8868:[\\u62db\\u5546\\u94f6\\u884c]\\u4e3b\\u53eb0\\u6b21\\u51710.0\\u5206\\u949f\\uff0c\\u88ab\\u53eb3\\u6b21\\u51712.85\\u5206\\u949f\"},{\"check_point\":\"contact_credit_card\",\"score\":1,\"check_point_cn\":\"\\u4fe1\\u7528\\u5361\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u8be5\\u7c7b\\u53f7\\u7801\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u627e\\u5230\\u4fe1\\u7528\\u5361\\u7c7b\\u76f8\\u5173\\u53f7\\u7801\"},{\"check_point\":\"dwell_used_time\",\"score\":0,\"check_point_cn\":\"\\u5c45\\u4f4f\\u5730\\u672c\\u5730\\uff08\\u7701\\u4efd\\uff09\\u5730\\u5740\\u5728\\u7535\\u5546\\u4e2d\\u4f7f\\u7528\\u65f6\\u957f\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740\"},{\"check_point\":\"ebusiness_info\",\"score\":0,\"check_point_cn\":\"\\u603b\\u4f53\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"person_ebusiness_info\",\"score\":0,\"check_point_cn\":\"\\u7533\\u8bf7\\u4eba\\u672c\\u4eba\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"virtual_buying\",\"score\":0,\"check_point_cn\":\"\\u865a\\u62df\\u5546\\u54c1\\u8d2d\\u4e70\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"lottery_buying\",\"score\":0,\"check_point_cn\":\"\\u5f69\\u7968\\u8d2d\\u4e70\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"person_addr_changed\",\"score\":0,\"check_point_cn\":\"\\u7533\\u8bf7\\u4eba\\u672c\\u4eba\\u5730\\u5740\\u53d8\\u5316\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"}],\"collection_contact\":[],\"ebusiness_expense\":[],\"contact_region\":[{\"region_loc\":\"\\u4e0a\\u6d77\",\"region_uniq_num_cnt\":64,\"region_call_out_time\":84.349999999999994,\"region_avg_call_in_time\":3.1721014492753623,\"region_call_in_time\":291.83333333333331,\"region_call_out_cnt\":27,\"region_avg_call_out_time\":3.1240740740740738,\"region_call_in_cnt_pct\":0.35797665369649806,\"region_call_in_time_pct\":0.37597698187752293,\"region_call_in_cnt\":92,\"region_call_out_time_pct\":0.34685765197724622,\"region_call_out_cnt_pct\":0.25233644859813081},{\"region_loc\":\"\\u5168\\u56fd\",\"region_uniq_num_cnt\":3,\"region_call_out_time\":9.7166666666666668,\"region_avg_call_in_time\":0,\"region_call_in_time\":0,\"region_call_out_cnt\":5,\"region_avg_call_out_time\":1.9433333333333334,\"region_call_in_cnt_pct\":0,\"region_call_in_time_pct\":0,\"region_call_in_cnt\":0,\"region_call_out_time_pct\":0.039956137344938664,\"region_call_out_cnt_pct\":0.046728971962616821},{\"region_loc\":\"\\u5317\\u4eac\",\"region_uniq_num_cnt\":11,\"region_call_out_time\":110.84999999999999,\"region_avg_call_in_time\":5.5992753623188412,\"region_call_in_time\":386.35000000000002,\"region_call_out_cnt\":34,\"region_avg_call_out_time\":3.2602941176470588,\"region_call_in_cnt_pct\":0.26848249027237353,\"region_call_in_time_pct\":0.49774542643648545,\"region_call_in_cnt\":69,\"region_call_out_time_pct\":0.45582893564526072,\"region_call_out_cnt_pct\":0.31775700934579437},{\"region_loc\":\"\\u56db\\u5ddd\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.11666666666666667,\"region_call_in_time\":0.11666666666666667,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.0038910505836575876,\"region_call_in_time_pct\":0.00015030490423430386,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u5b89\\u5fbd\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":2.8166666666666669,\"region_avg_call_in_time\":0.27500000000000002,\"region_call_in_time\":0.55000000000000004,\"region_call_out_cnt\":1,\"region_avg_call_out_time\":2.8166666666666669,\"region_call_in_cnt_pct\":0.0077821011673151752,\"region_call_in_time_pct\":0.00070858026281886118,\"region_call_in_cnt\":2,\"region_call_out_time_pct\":0.011582482352134878,\"region_call_out_cnt_pct\":0.0093457943925233638},{\"region_loc\":\"\\u5c71\\u4e1c\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.29999999999999999,\"region_call_in_time\":0.29999999999999999,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.0038910505836575876,\"region_call_in_time_pct\":0.00038649832517392423,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u5e7f\\u4e1c\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.31666666666666665,\"region_call_in_time\":0.6333333333333333,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.0077821011673151752,\"region_call_in_time_pct\":0.00081594090870050668,\"region_call_in_cnt\":2,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u65b0\\u7586\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":1.5666666666666667,\"region_avg_call_in_time\":1.1333333333333333,\"region_call_in_time\":5.666666666666667,\"region_call_out_cnt\":2,\"region_avg_call_out_time\":0.78333333333333333,\"region_call_in_cnt_pct\":0.019455252918287938,\"region_call_in_time_pct\":0.0073005239199519026,\"region_call_in_cnt\":5,\"region_call_out_time_pct\":0.0064423274621341923,\"region_call_out_cnt_pct\":0.018691588785046728},{\"region_loc\":\"\\u6c5f\\u82cf\",\"region_uniq_num_cnt\":20,\"region_call_out_time\":10.883333333333333,\"region_avg_call_in_time\":1.4299999999999999,\"region_call_in_time\":35.75,\"region_call_out_cnt\":7,\"region_avg_call_out_time\":1.5547619047619048,\"region_call_in_cnt_pct\":0.09727626459143969,\"region_call_in_time_pct\":0.046057717083225973,\"region_call_in_cnt\":25,\"region_call_out_time_pct\":0.044753615242272629,\"region_call_out_cnt_pct\":0.065420560747663545},{\"region_loc\":\"\\u6c5f\\u897f\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.13333333333333333,\"region_call_in_time\":0.26666666666666666,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.0077821011673151752,\"region_call_in_time_pct\":0.00034355406682126595,\"region_call_in_cnt\":2,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u6cb3\\u5317\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.18333333333333332,\"region_call_in_time\":0.18333333333333332,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.0038910505836575876,\"region_call_in_time_pct\":0.00023619342093962034,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u6cb3\\u5357\",\"region_uniq_num_cnt\":6,\"region_call_out_time\":17.283333333333335,\"region_avg_call_in_time\":0.73100775193798451,\"region_call_in_time\":31.433333333333334,\"region_call_out_cnt\":26,\"region_avg_call_out_time\":0.66474358974358982,\"region_call_in_cnt_pct\":0.16731517509727625,\"region_call_in_time_pct\":0.040496435626556727,\"region_call_in_cnt\":43,\"region_call_out_time_pct\":0.071071208279076148,\"region_call_out_cnt_pct\":0.24299065420560748},{\"region_loc\":\"\\u6d59\\u6c5f\",\"region_uniq_num_cnt\":7,\"region_call_out_time\":0.55000000000000004,\"region_avg_call_in_time\":0.54000000000000004,\"region_call_in_time\":5.4000000000000004,\"region_call_out_cnt\":1,\"region_avg_call_out_time\":0.55000000000000004,\"region_call_in_cnt_pct\":0.038910505836575876,\"region_call_in_time_pct\":0.0069569698531306368,\"region_call_in_cnt\":10,\"region_call_out_time_pct\":0.0022616681516003019,\"region_call_out_cnt_pct\":0.0093457943925233638},{\"region_loc\":\"\\u798f\\u5efa\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":10.25,\"region_call_in_time\":10.25,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.0038910505836575876,\"region_call_in_time_pct\":0.013205359443442411,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u8fd0\\u8425\\u5546\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":3.3166666666666669,\"region_avg_call_in_time\":0.8833333333333333,\"region_call_in_time\":0.8833333333333333,\"region_call_out_cnt\":2,\"region_avg_call_out_time\":1.6583333333333334,\"region_call_in_cnt_pct\":0.0038910505836575876,\"region_call_in_time_pct\":0.0011380228463454434,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0.013638544308135152,\"region_call_out_cnt_pct\":0.018691588785046728},{\"region_loc\":\"\\u9655\\u897f\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":1.8500000000000001,\"region_avg_call_in_time\":3.2916666666666665,\"region_call_in_time\":6.583333333333333,\"region_call_out_cnt\":2,\"region_avg_call_out_time\":0.92500000000000004,\"region_call_in_cnt_pct\":0.0077821011673151752,\"region_call_in_time_pct\":0.0084814910246500032,\"region_call_in_cnt\":2,\"region_call_out_time_pct\":0.0076074292372010147,\"region_call_out_cnt_pct\":0.018691588785046728}],\"application_check\":[{\"check_points\":{\"key_value\":\"\\u8d75\\u6668\\u5149\"},\"app_point\":\"user_name\"},{\"check_points\":{\"province\":\"\\u6c5f\\u82cf\\u7701\",\"city\":\"\\u6cf0\\u5dde\\u5e02\",\"key_value\":\"32128419940912301X\",\"gender\":\"\\u7537\",\"age\":23,\"financial_blacklist\":{\"arised\":false,\"black_type\":[]},\"court_blacklist\":{\"arised\":false,\"black_type\":[]},\"region\":\"\\u59dc\\u5830\\u5e02\"},\"app_point\":\"id_card\"},{\"check_points\":{\"website\":\"\\u4e0a\\u6d77\\u79fb\\u52a8\",\"check_ebusiness\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u53f7\\u7801\\u7684\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5(\\u65e0\\u7535\\u5546\\u6570\\u636e)\",\"key_value\":\"18221503642\",\"check_name\":\"\\u7528\\u6237\\u59d3\\u540d\\u4e0e\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u59d3\\u540d[*\\u6668\\u5149]\\u5339\\u914d\\u6210\\u529f\",\"reg_time\":\"2016-06-28 00:00:00\",\"financial_blacklist\":{\"arised\":false,\"black_type\":[]},\"reliability\":\"\\u5b9e\\u540d\\u8ba4\\u8bc1\",\"check_idcard\":\"\\u7528\\u6237\\u8eab\\u4efd\\u8bc1\\u53f7\\u4e0e\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u8eab\\u4efd\\u8bc1\\u53f7\\u7801[321284********301*]\\u5339\\u914d\\u6210\\u529f\"},\"app_point\":\"cell_phone\"},{\"check_points\":{\"check_ebusiness\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u5c45\\u4f4f\\u5730\\u5740\\u7684\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5(\\u65e0\\u7535\\u5546\\u6570\\u636e)\",\"key_value\":\"\",\"check_addr\":\"\\u65e0\\u6cd5\\u5b9a\\u4f4d\\u5c45\\u4f4f\\u5730\\u5740(\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740)\"},\"app_point\":\"home_addr\"},{\"check_points\":{\"check_mobile\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u5bb6\\u5ead\\u7535\\u8bdd\\u7684\\u901a\\u8bdd\\u60c5\\u51b5(\\u65e0\\u5bb6\\u5ead\\u7535\\u8bdd)\",\"key_value\":\"\"},\"app_point\":\"home_phone\"}],\"deliver_address\":[],\"report\":{\"rpt_id\":\"201804231659540004\",\"token\":\"1ea29483b91f45d983b32242cbb9348d\",\"version\":\"4.2\",\"update_time\":\"2018-04-23T08:59:54.000Z\"},\"trip_info\":[{\"trip_dest\":\"\\u6c5f\\u82cf\",\"trip_leave\":\"\\u4e0a\\u6d77\",\"trip_end_time\":\"2017-10-12\",\"trip_type\":\"\\u5de5\\u4f5c\\u65e5\",\"trip_start_time\":\"2017-10-10\"},{\"trip_dest\":\"\\u6d59\\u6c5f\",\"trip_leave\":\"\\u4e0a\\u6d77\",\"trip_end_time\":\"2017-11-11\",\"trip_type\":\"\\u53cc\\u4f11\\u65e5\",\"trip_start_time\":\"2017-11-09\"},{\"trip_dest\":\"\\u6c5f\\u82cf\",\"trip_leave\":\"\\u4e0a\\u6d77\",\"trip_end_time\":\"2018-02-21\",\"trip_type\":\"\\u8282\\u5047\\u65e5\",\"trip_start_time\":\"2018-02-12\"}],\"_id\":\"5adda08da2a3ad0f4f38c14b\",\"cell_behavior\":[{\"phone_num\":\"18221503642\",\"behavior\":[{\"sms_cnt\":120,\"cell_phone_num\":\"18221503642\",\"net_flow\":-1,\"total_amount\":-1,\"call_out_time\":65.583333333333329,\"cell_mth\":\"2018-04\",\"cell_loc\":\"\\u4e0a\\u6d77\",\"call_cnt\":30,\"cell_operator_zh\":\"\\u4e0a\\u6d77\\u79fb\\u52a8\",\"call_out_cnt\":9,\"cell_operator\":\"chinamobilesh\",\"call_in_time\":162,\"call_in_cnt\":21},{\"sms_cnt\":114,\"cell_phone_num\":\"18221503642\",\"net_flow\":0,\"total_amount\":21.239999999999998,\"call_out_time\":12.550000000000001,\"cell_mth\":\"2018-03\",\"cell_loc\":\"\\u4e0a\\u6d77\",\"call_cnt\":36,\"cell_operator_zh\":\"\\u4e0a\\u6d77\\u79fb\\u52a8\",\"call_out_cnt\":9,\"cell_operator\":\"chinamobilesh\",\"call_in_time\":127.91666666666667,\"call_in_cnt\":27},{\"sms_cnt\":127,\"cell_phone_num\":\"18221503642\",\"net_flow\":0,\"total_amount\":32.289999999999999,\"call_out_time\":58.18333333333333,\"cell_mth\":\"2018-02\",\"cell_loc\":\"\\u4e0a\\u6d77\",\"call_cnt\":65,\"cell_operator_zh\":\"\\u4e0a\\u6d77\\u79fb\\u52a8\",\"call_out_cnt\":23,\"cell_operator\":\"chinamobilesh\",\"call_in_time\":102.01666666666667,\"call_in_cnt\":42},{\"sms_cnt\":200,\"cell_phone_num\":\"18221503642\",\"net_flow\":0.00390625,\"total_amount\":27.690000000000001,\"call_out_time\":24.116666666666667,\"cell_mth\":\"2018-01\",\"cell_loc\":\"\\u4e0a\\u6d77\",\"call_cnt\":52,\"cell_operator_zh\":\"\\u4e0a\\u6d77\\u79fb\\u52a8\",\"call_out_cnt\":13,\"cell_operator\":\"chinamobilesh\",\"call_in_time\":122.88333333333334,\"call_in_cnt\":39},{\"sms_cnt\":198,\"cell_phone_num\":\"18221503642\",\"net_flow\":0,\"total_amount\":27.649999999999999,\"call_out_time\":37.116666666666667,\"cell_mth\":\"2017-12\",\"cell_loc\":\"\\u4e0a\\u6d77\",\"call_cnt\":60,\"cell_operator_zh\":\"\\u4e0a\\u6d77\\u79fb\\u52a8\",\"call_out_cnt\":18,\"cell_operator\":\"chinamobilesh\",\"call_in_time\":99.466666666666669,\"call_in_cnt\":42},{\"sms_cnt\":249,\"cell_phone_num\":\"18221503642\",\"net_flow\":0.3232421875,\"total_amount\":23.609999999999999,\"call_out_time\":23.216666666666665,\"cell_mth\":\"2017-11\",\"cell_loc\":\"\\u4e0a\\u6d77\",\"call_cnt\":53,\"cell_operator_zh\":\"\\u4e0a\\u6d77\\u79fb\\u52a8\",\"call_out_cnt\":8,\"cell_operator\":\"chinamobilesh\",\"call_in_time\":68.433333333333337,\"call_in_cnt\":45},{\"sms_cnt\":176,\"cell_phone_num\":\"18221503642\",\"net_flow\":0.51171875,\"total_amount\":27.5,\"call_out_time\":22.416666666666668,\"cell_mth\":\"2017-10\",\"cell_loc\":\"\\u4e0a\\u6d77\",\"call_cnt\":68,\"cell_operator_zh\":\"\\u4e0a\\u6d77\\u79fb\\u52a8\",\"call_out_cnt\":27,\"cell_operator\":\"chinamobilesh\",\"call_in_time\":93.483333333333334,\"call_in_cnt\":41}]}]},\"success\":\"true\"}', '2018-04-23 17:29:52', '2018-04-23 17:29:52');
INSERT INTO `borrower_contact_info` VALUES ('85', '{\"note\":\"\",\"report_data\":{\"user_info_check\":{\"check_black_info\":{\"contacts_class1_blacklist_cnt\":1,\"contacts_router_ratio\":1,\"contacts_class2_blacklist_cnt\":2,\"contacts_router_cnt\":1,\"contacts_class1_cnt\":1,\"phone_gray_score\":53},\"check_search_info\":{\"arised_open_web\":[],\"phone_with_other_idcards\":[],\"idcard_with_other_phones\":[],\"register_org_cnt\":0,\"idcard_with_other_names\":[],\"searched_org_type\":[\"\\u5176\\u4ed6\"],\"searched_org_cnt\":1,\"register_org_type\":[],\"phone_with_other_names\":[]}},\"main_service\":[],\"behavior_check\":[{\"check_point\":\"regular_circle\",\"score\":0,\"check_point_cn\":\"\\u670b\\u53cb\\u5708\\u5728\\u54ea\\u91cc\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740\"},{\"check_point\":\"phone_used_time\",\"score\":1,\"check_point_cn\":\"\\u53f7\\u7801\\u4f7f\\u7528\\u65f6\\u95f4\",\"result\":\"\\u81f3\\u5c11\\u4f7f\\u7528\\u4e86\\u534a\\u5e74\\u4ee5\\u4e0a(6-24\\u4e2a\\u6708\\uff0c\\u5305\\u542b6)\",\"evidence\":\"\\u6839\\u636e\\u53f7\\u7801[13120733632]\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u8ba4\\u8bc1\\u65f6\\u95f4,\\u63a8\\u7b97\\u8be5\\u53f7\\u7801\\u4f7f\\u752822\\u4e2a\\u6708\"},{\"check_point\":\"phone_silent\",\"score\":2,\"check_point_cn\":\"\\u624b\\u673a\\u9759\\u9ed8\\u60c5\\u51b5(\\u8fde\\u7eed24\\u5c0f\\u65f6\\u5185\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\\u8ba1\\u4e3a\\u9759\\u9ed8\\u4e00\\u5929)\",\"result\":\"174\\u5929\\u5185\\u6709116\\u5929\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u6839\\u636e\\u8fd0\\u8425\\u5546\\u8be6\\u5355\\u6570\\u636e\\uff0c\\u8fde\\u7eed\\u4e09\\u5929\\u4ee5\\u4e0a\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f559\\u6b21: 2017-11-27 - 2017-11-29, 3\\u5929 \\/ 2018-01-11 - 2018-01-15, 5\\u5929 \\/ 2018-03-08 - 2018-03-10, 3\\u5929 \\/ 2018-03-12 - 2018-03-16, 5\\u5929 \\/ 2018-03-19 - 2018-03-22, 4\\u5929 \\/ 2018-03-25 - 2018-03-27, 3\\u5929 \\/ 2018-04-02 - 2018-04-05, 4\\u5929 \\/ 2018-04-09 - 2018-04-11, 3\\u5929 \\/ 2018-04-17 - 2018-04-19, 3\\u5929\"},{\"check_point\":\"contact_each_other\",\"score\":2,\"check_point_cn\":\"\\u4e92\\u901a\\u8fc7\\u7535\\u8bdd\\u7684\\u53f7\\u7801\\u6570\\u91cf\",\"result\":\"\\u6570\\u91cf\\u7a00\\u5c11(10\\u4ee5\\u5185\\uff0c\\u4e0d\\u542b10)\",\"evidence\":\"\\u4e92\\u901a\\u8fc7\\u7535\\u8bdd\\u7684\\u53f7\\u7801\\u67098\\u4e2a\\uff0c\\u6bd4\\u4f8b\\u4e3a7.27%\"},{\"check_point\":\"contact_macao\",\"score\":1,\"check_point_cn\":\"\\u6fb3\\u95e8\\u7535\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u6fb3\\u95e8\\u5730\\u533a\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_110\",\"score\":1,\"check_point_cn\":\"110\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e110\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_120\",\"score\":1,\"check_point_cn\":\"120\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e120\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_lawyer\",\"score\":1,\"check_point_cn\":\"\\u5f8b\\u5e08\\u53f7\\u7801\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e\\u5f8b\\u5e08\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_court\",\"score\":1,\"check_point_cn\":\"\\u6cd5\\u9662\\u53f7\\u7801\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e\\u6cd5\\u9662\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_night\",\"score\":1,\"check_point_cn\":\"\\u591c\\u95f4\\u6d3b\\u52a8\\u60c5\\u51b5(23\\u70b9-6\\u70b9)\",\"result\":\"\\u5f88\\u5c11\\u591c\\u95f4\\u6d3b\\u52a8(\\u591c\\u95f4\\u901a\\u8bdd\\u6bd4\\u4f8b\\u4f4e\\u4e8e20%)\",\"evidence\":\"\\u665a\\u95f4\\u6d3b\\u8dc3\\u9891\\u7387\\u5360\\u5168\\u5929\\u76846.77%\"},{\"check_point\":\"contact_loan\",\"score\":1,\"check_point_cn\":\"\\u8d37\\u6b3e\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u8be5\\u7c7b\\u53f7\\u7801\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u627e\\u5230\\u8d37\\u6b3e\\u7c7b\\u76f8\\u5173\\u53f7\\u7801\"},{\"check_point\":\"contact_bank\",\"score\":1,\"check_point_cn\":\"\\u94f6\\u884c\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u5f88\\u5c11\\u88ab\\u8054\\u7cfb(\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u5185\\uff0c\\u6216\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u4e0a\\u4e14\\u4e3b\\u52a8\\u547c\\u53eb\\u5360\\u6bd4\\u4f4e\\u4e8e20%)\",\"evidence\":\"\\u8054\\u7cfb\\u5217\\u8868:[\\u5174\\u4e1a\\u94f6\\u884c\\u5ba2\\u670d\\u7535\\u8bdd]\\u4e3b\\u53eb0\\u6b21\\u51710.0\\u5206\\u949f\\uff0c\\u88ab\\u53eb1\\u6b21\\u51710.9\\u5206\\u949f\"},{\"check_point\":\"contact_credit_card\",\"score\":1,\"check_point_cn\":\"\\u4fe1\\u7528\\u5361\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u8be5\\u7c7b\\u53f7\\u7801\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u627e\\u5230\\u4fe1\\u7528\\u5361\\u7c7b\\u76f8\\u5173\\u53f7\\u7801\"},{\"check_point\":\"dwell_used_time\",\"score\":0,\"check_point_cn\":\"\\u5c45\\u4f4f\\u5730\\u672c\\u5730\\uff08\\u7701\\u4efd\\uff09\\u5730\\u5740\\u5728\\u7535\\u5546\\u4e2d\\u4f7f\\u7528\\u65f6\\u957f\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740\"},{\"check_point\":\"ebusiness_info\",\"score\":0,\"check_point_cn\":\"\\u603b\\u4f53\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"person_ebusiness_info\",\"score\":0,\"check_point_cn\":\"\\u7533\\u8bf7\\u4eba\\u672c\\u4eba\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"virtual_buying\",\"score\":0,\"check_point_cn\":\"\\u865a\\u62df\\u5546\\u54c1\\u8d2d\\u4e70\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"lottery_buying\",\"score\":0,\"check_point_cn\":\"\\u5f69\\u7968\\u8d2d\\u4e70\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"person_addr_changed\",\"score\":0,\"check_point_cn\":\"\\u7533\\u8bf7\\u4eba\\u672c\\u4eba\\u5730\\u5740\\u53d8\\u5316\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"}],\"collection_contact\":[],\"ebusiness_expense\":[],\"contact_region\":[{\"region_loc\":\"\\u4e0a\\u6d77\",\"region_uniq_num_cnt\":66,\"region_call_out_time\":23.183333333333334,\"region_avg_call_in_time\":0.55029239766081872,\"region_call_in_time\":31.366666666666667,\"region_call_out_cnt\":27,\"region_avg_call_out_time\":0.85864197530864195,\"region_call_in_cnt_pct\":0.4956521739130435,\"region_call_in_time_pct\":0.50919913419913421,\"region_call_in_cnt\":57,\"region_call_out_time_pct\":0.29564293304994688,\"region_call_out_cnt_pct\":0.39705882352941174},{\"region_loc\":\"\\u4e91\\u5357\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.29999999999999999,\"region_call_in_time\":0.29999999999999999,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.0086956521739130436,\"region_call_in_time_pct\":0.00487012987012987,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u5168\\u56fd\",\"region_uniq_num_cnt\":6,\"region_call_out_time\":23.183333333333334,\"region_avg_call_in_time\":0.65000000000000002,\"region_call_in_time\":1.3,\"region_call_out_cnt\":9,\"region_avg_call_out_time\":2.575925925925926,\"region_call_in_cnt_pct\":0.017391304347826087,\"region_call_in_time_pct\":0.021103896103896104,\"region_call_in_cnt\":2,\"region_call_out_time_pct\":0.29564293304994688,\"region_call_out_cnt_pct\":0.13235294117647059},{\"region_loc\":\"\\u5317\\u4eac\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.033333333333333333,\"region_call_in_time\":0.033333333333333333,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.0086956521739130436,\"region_call_in_time_pct\":0.00054112554112554113,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u5929\\u6d25\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":0,\"region_avg_call_in_time\":1,\"region_call_in_time\":2,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.017391304347826087,\"region_call_in_time_pct\":0.032467532467532464,\"region_call_in_cnt\":2,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u5b89\\u5fbd\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.36249999999999999,\"region_call_in_time\":1.45,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.034782608695652174,\"region_call_in_time_pct\":0.023538961038961036,\"region_call_in_cnt\":4,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u5c71\\u4e1c\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.60833333333333328,\"region_call_in_time\":1.2166666666666666,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.017391304347826087,\"region_call_in_time_pct\":0.019751082251082248,\"region_call_in_cnt\":2,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u5e7f\\u4e1c\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.20833333333333334,\"region_call_in_time\":0.41666666666666669,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.017391304347826087,\"region_call_in_time_pct\":0.006764069264069264,\"region_call_in_cnt\":2,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u672a\\u77e5\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.125,\"region_call_in_time\":0.25,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.017391304347826087,\"region_call_in_time_pct\":0.0040584415584415581,\"region_call_in_cnt\":2,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u6c5f\\u82cf\",\"region_uniq_num_cnt\":7,\"region_call_out_time\":3.2333333333333334,\"region_avg_call_in_time\":1.0523809523809524,\"region_call_in_time\":7.3666666666666663,\"region_call_out_cnt\":4,\"region_avg_call_out_time\":0.80833333333333335,\"region_call_in_cnt_pct\":0.060869565217391307,\"region_call_in_time_pct\":0.11958874458874458,\"region_call_in_cnt\":7,\"region_call_out_time_pct\":0.041232731137088204,\"region_call_out_cnt_pct\":0.058823529411764705},{\"region_loc\":\"\\u6c5f\\u897f\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":8.3000000000000007,\"region_avg_call_in_time\":0.42249999999999999,\"region_call_in_time\":8.4499999999999993,\"region_call_out_cnt\":18,\"region_avg_call_out_time\":0.46111111111111114,\"region_call_in_cnt_pct\":0.17391304347826086,\"region_call_in_time_pct\":0.13717532467532467,\"region_call_in_cnt\":20,\"region_call_out_time_pct\":0.10584484590860786,\"region_call_out_cnt_pct\":0.26470588235294118},{\"region_loc\":\"\\u6cb3\\u5317\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.43333333333333335,\"region_call_in_time\":0.43333333333333335,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.0086956521739130436,\"region_call_in_time_pct\":0.007034632034632035,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u6cb3\\u5357\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.375,\"region_call_in_time\":0.75,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.017391304347826087,\"region_call_in_time_pct\":0.012175324675324676,\"region_call_in_cnt\":2,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u6d59\\u6c5f\",\"region_uniq_num_cnt\":3,\"region_call_out_time\":10.133333333333333,\"region_avg_call_in_time\":0.56666666666666665,\"region_call_in_time\":0.56666666666666665,\"region_call_out_cnt\":2,\"region_avg_call_out_time\":5.0666666666666664,\"region_call_in_cnt_pct\":0.0086956521739130436,\"region_call_in_time_pct\":0.0091991341991341982,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0.1292242295430393,\"region_call_out_cnt_pct\":0.029411764705882353},{\"region_loc\":\"\\u798f\\u5efa\",\"region_uniq_num_cnt\":8,\"region_call_out_time\":8.1999999999999993,\"region_avg_call_in_time\":0.59285714285714286,\"region_call_in_time\":4.1500000000000004,\"region_call_out_cnt\":6,\"region_avg_call_out_time\":1.3666666666666665,\"region_call_in_cnt_pct\":0.060869565217391307,\"region_call_in_time_pct\":0.067370129870129872,\"region_call_in_cnt\":7,\"region_call_out_time_pct\":0.10456960680127522,\"region_call_out_cnt_pct\":0.088235294117647065},{\"region_loc\":\"\\u82f1\\u56fd\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.18333333333333332,\"region_call_in_time\":0.18333333333333332,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.0086956521739130436,\"region_call_in_time_pct\":0.002976190476190476,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u8fbd\\u5b81\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.78333333333333333,\"region_call_in_time\":0.78333333333333333,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.0086956521739130436,\"region_call_in_time_pct\":0.012716450216450216,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u8fd0\\u8425\\u5546\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":2.1833333333333331,\"region_avg_call_in_time\":0,\"region_call_in_time\":0,\"region_call_out_cnt\":2,\"region_avg_call_out_time\":1.0916666666666666,\"region_call_in_cnt_pct\":0,\"region_call_in_time_pct\":0,\"region_call_in_cnt\":0,\"region_call_out_time_pct\":0.027842720510095637,\"region_call_out_cnt_pct\":0.029411764705882353},{\"region_loc\":\"\\u9655\\u897f\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.29166666666666669,\"region_call_in_time\":0.58333333333333337,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.017391304347826087,\"region_call_in_time_pct\":0.00946969696969697,\"region_call_in_cnt\":2,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0}],\"application_check\":[{\"check_points\":{\"key_value\":\"\\u5510\\u5e86\\u658c\"},\"app_point\":\"user_name\"},{\"check_points\":{\"province\":\"\\u798f\\u5efa\\u7701\",\"city\":\"\\u798f\\u5dde\\u5e02\",\"key_value\":\"350103199309204219\",\"gender\":\"\\u7537\",\"age\":24,\"financial_blacklist\":{\"arised\":false,\"black_type\":[]},\"court_blacklist\":{\"arised\":false,\"black_type\":[]},\"region\":\"\\u53f0\\u6c5f\\u533a\"},\"app_point\":\"id_card\"},{\"check_points\":{\"website\":\"\\u4e2d\\u56fd\\u8054\\u901a\",\"check_ebusiness\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u53f7\\u7801\\u7684\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5(\\u65e0\\u7535\\u5546\\u6570\\u636e)\",\"key_value\":\"13120733632\",\"check_name\":\"\\u7528\\u6237\\u59d3\\u540d\\u4e0e\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u59d3\\u540d[\\u5510\\u5e86\\u658c]\\u5339\\u914d\\u6210\\u529f\",\"reg_time\":\"2016-07-02 00:00:00\",\"financial_blacklist\":{\"arised\":false,\"black_type\":[]},\"reliability\":\"\\u5b9e\\u540d\\u8ba4\\u8bc1\",\"check_idcard\":\"\\u7528\\u6237\\u8eab\\u4efd\\u8bc1\\u53f7\\u4e0e\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u8eab\\u4efd\\u8bc1\\u53f7\\u7801[3501****4219]\\u5339\\u914d\\u6210\\u529f\"},\"app_point\":\"cell_phone\"},{\"check_points\":{\"check_ebusiness\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u5c45\\u4f4f\\u5730\\u5740\\u7684\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5(\\u65e0\\u7535\\u5546\\u6570\\u636e)\",\"key_value\":\"\",\"check_addr\":\"\\u65e0\\u6cd5\\u5b9a\\u4f4d\\u5c45\\u4f4f\\u5730\\u5740(\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740)\"},\"app_point\":\"home_addr\"},{\"check_points\":{\"check_mobile\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u5bb6\\u5ead\\u7535\\u8bdd\\u7684\\u901a\\u8bdd\\u60c5\\u51b5(\\u65e0\\u5bb6\\u5ead\\u7535\\u8bdd)\",\"key_value\":\"\"},\"app_point\":\"home_phone\"}],\"deliver_address\":[],\"report\":{\"rpt_id\":\"201804251834430001\",\"token\":\"ce888a67a92c472395376c65a8733db6\",\"version\":\"4.2\",\"update_time\":\"2018-04-25T10:34:43.000Z\"},\"trip_info\":[],\"_id\":\"5ae059ca13cc060248f18146\",\"cell_behavior\":[{\"phone_num\":\"13120733632\",\"behavior\":[{\"sms_cnt\":2,\"cell_phone_num\":\"13120733632\",\"net_flow\":215.939453125,\"total_amount\":-1,\"call_out_time\":2.6000000000000001,\"cell_mth\":\"2018-04\",\"cell_loc\":\"\\u4e0a\\u6d77\",\"call_cnt\":22,\"cell_operator_zh\":\"\\u4e2d\\u56fd\\u8054\\u901a\",\"call_out_cnt\":4,\"cell_operator\":\"chinaunicom\",\"call_in_time\":9.5833333333333339,\"call_in_cnt\":18},{\"sms_cnt\":7,\"cell_phone_num\":\"13120733632\",\"net_flow\":290.2724609375,\"total_amount\":47.299999999999997,\"call_out_time\":8.5666666666666664,\"cell_mth\":\"2018-03\",\"cell_loc\":\"\\u4e0a\\u6d77\",\"call_cnt\":37,\"cell_operator_zh\":\"\\u4e2d\\u56fd\\u8054\\u901a\",\"call_out_cnt\":13,\"cell_operator\":\"chinaunicom\",\"call_in_time\":16.633333333333333,\"call_in_cnt\":24},{\"sms_cnt\":15,\"cell_phone_num\":\"13120733632\",\"net_flow\":306.267578125,\"total_amount\":45.100000000000001,\"call_out_time\":27.333333333333332,\"cell_mth\":\"2018-02\",\"cell_loc\":\"\\u4e0a\\u6d77\",\"call_cnt\":26,\"cell_operator_zh\":\"\\u4e2d\\u56fd\\u8054\\u901a\",\"call_out_cnt\":12,\"cell_operator\":\"chinaunicom\",\"call_in_time\":5.2000000000000002,\"call_in_cnt\":14},{\"sms_cnt\":5,\"cell_phone_num\":\"13120733632\",\"net_flow\":575.5009765625,\"total_amount\":40.899999999999999,\"call_out_time\":8.1666666666666661,\"cell_mth\":\"2018-01\",\"cell_loc\":\"\\u4e0a\\u6d77\",\"call_cnt\":26,\"cell_operator_zh\":\"\\u4e2d\\u56fd\\u8054\\u901a\",\"call_out_cnt\":7,\"cell_operator\":\"chinaunicom\",\"call_in_time\":11.9,\"call_in_cnt\":19},{\"sms_cnt\":9,\"cell_phone_num\":\"13120733632\",\"net_flow\":724.1162109375,\"total_amount\":59.899999999999999,\"call_out_time\":8,\"cell_mth\":\"2017-12\",\"cell_loc\":\"\\u4e0a\\u6d77\",\"call_cnt\":36,\"cell_operator_zh\":\"\\u4e2d\\u56fd\\u8054\\u901a\",\"call_out_cnt\":13,\"cell_operator\":\"chinaunicom\",\"call_in_time\":10.983333333333333,\"call_in_cnt\":23},{\"sms_cnt\":15,\"cell_phone_num\":\"13120733632\",\"net_flow\":445.1787109375,\"total_amount\":51.100000000000001,\"call_out_time\":23.75,\"cell_mth\":\"2017-11\",\"cell_loc\":\"\\u4e0a\\u6d77\",\"call_cnt\":36,\"cell_operator_zh\":\"\\u4e2d\\u56fd\\u8054\\u901a\",\"call_out_cnt\":19,\"cell_operator\":\"chinaunicom\",\"call_in_time\":7.2999999999999998,\"call_in_cnt\":17}]}]},\"success\":\"true\"}', '2018-04-25 18:36:10', '2018-04-25 18:36:10');
INSERT INTO `borrower_contact_info` VALUES ('88', '{\"note\":\"\",\"report_data\":{\"user_info_check\":{\"check_black_info\":{\"contacts_class1_blacklist_cnt\":null,\"contacts_router_ratio\":null,\"contacts_class2_blacklist_cnt\":null,\"contacts_router_cnt\":null,\"contacts_class1_cnt\":null,\"phone_gray_score\":null},\"check_search_info\":{\"arised_open_web\":[],\"phone_with_other_idcards\":[\"34082719921024137X\"],\"idcard_with_other_phones\":[\"18221243631\"],\"register_org_cnt\":0,\"idcard_with_other_names\":[],\"searched_org_type\":[\"\\u5176\\u4ed6\"],\"searched_org_cnt\":1,\"register_org_type\":[],\"phone_with_other_names\":[]}},\"main_service\":[],\"behavior_check\":[{\"check_point\":\"regular_circle\",\"score\":0,\"check_point_cn\":\"\\u670b\\u53cb\\u5708\\u5728\\u54ea\\u91cc\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740\"},{\"check_point\":\"phone_used_time\",\"score\":1,\"check_point_cn\":\"\\u53f7\\u7801\\u4f7f\\u7528\\u65f6\\u95f4\",\"result\":\"\\u81f3\\u5c11\\u4f7f\\u7528\\u4e863\\u4e2a\\u6708\\u4ee5\\u4e0a\\u4f46\\u4e0d\\u8db3\\u534a\\u5e74\",\"evidence\":\"\\u6839\\u636e\\u53f7\\u7801[17601279633]\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u8ba4\\u8bc1\\u65f6\\u95f4,\\u63a8\\u7b97\\u8be5\\u53f7\\u7801\\u4f7f\\u75285\\u4e2a\\u6708\"},{\"check_point\":\"phone_silent\",\"score\":2,\"check_point_cn\":\"\\u624b\\u673a\\u9759\\u9ed8\\u60c5\\u51b5(\\u8fde\\u7eed24\\u5c0f\\u65f6\\u5185\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\\u8ba1\\u4e3a\\u9759\\u9ed8\\u4e00\\u5929)\",\"result\":\"153\\u5929\\u5185\\u670988\\u5929\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u6839\\u636e\\u8fd0\\u8425\\u5546\\u8be6\\u5355\\u6570\\u636e\\uff0c\\u8fde\\u7eed\\u4e09\\u5929\\u4ee5\\u4e0a\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f556\\u6b21: 2018-02-17 - 2018-02-20, 4\\u5929 \\/ 2018-03-03 - 2018-03-08, 6\\u5929 \\/ 2018-03-19 - 2018-03-22, 4\\u5929 \\/ 2018-04-05 - 2018-04-07, 3\\u5929 \\/ 2018-04-09 - 2018-04-12, 4\\u5929 \\/ 2018-04-22 - 2018-04-25, 4\\u5929\"},{\"check_point\":\"contact_each_other\",\"score\":1,\"check_point_cn\":\"\\u4e92\\u901a\\u8fc7\\u7535\\u8bdd\\u7684\\u53f7\\u7801\\u6570\\u91cf\",\"result\":\"\\u6570\\u91cf\\u6b63\\u5e38(10-100)\",\"evidence\":\"\\u4e92\\u901a\\u8fc7\\u7535\\u8bdd\\u7684\\u53f7\\u7801\\u670917\\u4e2a\\uff0c\\u6bd4\\u4f8b\\u4e3a18.68%\"},{\"check_point\":\"contact_macao\",\"score\":1,\"check_point_cn\":\"\\u6fb3\\u95e8\\u7535\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u6fb3\\u95e8\\u5730\\u533a\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_110\",\"score\":1,\"check_point_cn\":\"110\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e110\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_120\",\"score\":1,\"check_point_cn\":\"120\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e120\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_lawyer\",\"score\":1,\"check_point_cn\":\"\\u5f8b\\u5e08\\u53f7\\u7801\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e\\u5f8b\\u5e08\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_court\",\"score\":1,\"check_point_cn\":\"\\u6cd5\\u9662\\u53f7\\u7801\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e\\u6cd5\\u9662\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_night\",\"score\":1,\"check_point_cn\":\"\\u591c\\u95f4\\u6d3b\\u52a8\\u60c5\\u51b5(23\\u70b9-6\\u70b9)\",\"result\":\"\\u5f88\\u5c11\\u591c\\u95f4\\u6d3b\\u52a8(\\u591c\\u95f4\\u901a\\u8bdd\\u6bd4\\u4f8b\\u4f4e\\u4e8e20%)\",\"evidence\":\"\\u665a\\u95f4\\u6d3b\\u8dc3\\u9891\\u7387\\u5360\\u5168\\u5929\\u76847.01%\"},{\"check_point\":\"contact_loan\",\"score\":1,\"check_point_cn\":\"\\u8d37\\u6b3e\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u5f88\\u5c11\\u88ab\\u8054\\u7cfb(\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u5185\\uff0c\\u6216\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u4e0a\\u4e14\\u4e3b\\u52a8\\u547c\\u53eb\\u5360\\u6bd4\\u4f4e\\u4e8e20%)\",\"evidence\":\"\\u8054\\u7cfb\\u5217\\u8868:[\\u62db\\u5546\\u94f6\\u884c\\u4fe1\\u7528\\u5361]\\u4e3b\\u53eb1\\u6b21\\u51714.58\\u5206\\u949f\\uff0c\\u88ab\\u53eb0\\u6b21\\u51710.0\\u5206\\u949f\"},{\"check_point\":\"contact_bank\",\"score\":1,\"check_point_cn\":\"\\u94f6\\u884c\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u5f88\\u5c11\\u88ab\\u8054\\u7cfb(\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u5185\\uff0c\\u6216\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u4e0a\\u4e14\\u4e3b\\u52a8\\u547c\\u53eb\\u5360\\u6bd4\\u4f4e\\u4e8e20%)\",\"evidence\":\"\\u8054\\u7cfb\\u5217\\u8868:[\\u5de5\\u5546\\u94f6\\u884c\\u5ba2\\u670d\\u7535\\u8bdd]\\u4e3b\\u53eb1\\u6b21\\u51714.35\\u5206\\u949f\\uff0c\\u88ab\\u53eb0\\u6b21\\u51710.0\\u5206\\u949f\"},{\"check_point\":\"contact_credit_card\",\"score\":1,\"check_point_cn\":\"\\u4fe1\\u7528\\u5361\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u5f88\\u5c11\\u88ab\\u8054\\u7cfb(\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u5185\\uff0c\\u6216\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u4e0a\\u4e14\\u4e3b\\u52a8\\u547c\\u53eb\\u5360\\u6bd4\\u4f4e\\u4e8e20%)\",\"evidence\":\"\\u8054\\u7cfb\\u5217\\u8868:[\\u4e2d\\u4fe1\\u94f6\\u884c\\u4fe1\\u7528\\u5361\\u70ed\\u7ebf]\\u4e3b\\u53eb0\\u6b21\\u51710.0\\u5206\\u949f\\uff0c\\u88ab\\u53eb1\\u6b21\\u51710.55\\u5206\\u949f;[\\u62db\\u884c\\u4fe1\\u7528\\u5361]\\u4e3b\\u53eb0\\u6b21\\u51710.0\\u5206\\u949f\\uff0c\\u88ab\\u53eb1\\u6b21\\u51711.17\\u5206\\u949f\"},{\"check_point\":\"dwell_used_time\",\"score\":0,\"check_point_cn\":\"\\u5c45\\u4f4f\\u5730\\u672c\\u5730\\uff08\\u7701\\u4efd\\uff09\\u5730\\u5740\\u5728\\u7535\\u5546\\u4e2d\\u4f7f\\u7528\\u65f6\\u957f\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740\"},{\"check_point\":\"ebusiness_info\",\"score\":0,\"check_point_cn\":\"\\u603b\\u4f53\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"person_ebusiness_info\",\"score\":0,\"check_point_cn\":\"\\u7533\\u8bf7\\u4eba\\u672c\\u4eba\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"virtual_buying\",\"score\":0,\"check_point_cn\":\"\\u865a\\u62df\\u5546\\u54c1\\u8d2d\\u4e70\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"lottery_buying\",\"score\":0,\"check_point_cn\":\"\\u5f69\\u7968\\u8d2d\\u4e70\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"person_addr_changed\",\"score\":0,\"check_point_cn\":\"\\u7533\\u8bf7\\u4eba\\u672c\\u4eba\\u5730\\u5740\\u53d8\\u5316\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"}],\"collection_contact\":[],\"ebusiness_expense\":[],\"contact_region\":[{\"region_loc\":\"\\u4e0a\\u6d77\",\"region_uniq_num_cnt\":58,\"region_call_out_time\":245.40000000000001,\"region_avg_call_in_time\":2.5814159292035397,\"region_call_in_time\":291.69999999999999,\"region_call_out_cnt\":59,\"region_avg_call_out_time\":4.159322033898305,\"region_call_in_cnt_pct\":0.8188405797101449,\"region_call_in_time_pct\":0.8719175011209086,\"region_call_in_cnt\":113,\"region_call_out_time_pct\":0.62297440236936741,\"region_call_out_cnt_pct\":0.49579831932773111},{\"region_loc\":\"\\u5168\\u56fd\",\"region_uniq_num_cnt\":7,\"region_call_out_time\":33.200000000000003,\"region_avg_call_in_time\":1.375,\"region_call_in_time\":2.75,\"region_call_out_cnt\":8,\"region_avg_call_out_time\":4.1500000000000004,\"region_call_in_cnt_pct\":0.014492753623188406,\"region_call_in_time_pct\":0.008219997010910177,\"region_call_in_cnt\":2,\"region_call_out_time_pct\":0.084281785487624286,\"region_call_out_cnt_pct\":0.067226890756302518},{\"region_loc\":\"\\u5317\\u4eac\",\"region_uniq_num_cnt\":12,\"region_call_out_time\":28.916666666666668,\"region_avg_call_in_time\":0.68611111111111101,\"region_call_in_time\":4.1166666666666663,\"region_call_out_cnt\":11,\"region_avg_call_out_time\":2.6287878787878789,\"region_call_in_cnt_pct\":0.043478260869565216,\"region_call_in_time_pct\":0.012305086434514022,\"region_call_in_cnt\":6,\"region_call_out_time_pct\":0.073408081235455891,\"region_call_out_cnt_pct\":0.092436974789915971},{\"region_loc\":\"\\u5b89\\u5fbd\",\"region_uniq_num_cnt\":7,\"region_call_out_time\":59.700000000000003,\"region_avg_call_in_time\":2.3722222222222222,\"region_call_in_time\":28.466666666666665,\"region_call_out_cnt\":31,\"region_avg_call_out_time\":1.9258064516129034,\"region_call_in_cnt_pct\":0.086956521739130432,\"region_call_in_time_pct\":0.085089423603845957,\"region_call_in_cnt\":12,\"region_call_out_time_pct\":0.1515548973979268,\"region_call_out_cnt_pct\":0.26050420168067229},{\"region_loc\":\"\\u5e7f\\u4e1c\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.55000000000000004,\"region_call_in_time\":0.55000000000000004,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.007246376811594203,\"region_call_in_time_pct\":0.0016439994021820357,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u6c5f\\u82cf\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":8,\"region_avg_call_in_time\":1.3999999999999999,\"region_call_in_time\":1.3999999999999999,\"region_call_out_cnt\":3,\"region_avg_call_out_time\":2.6666666666666665,\"region_call_in_cnt_pct\":0.007246376811594203,\"region_call_in_time_pct\":0.004184725751008817,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0.020308863972921514,\"region_call_out_cnt_pct\":0.025210084033613446},{\"region_loc\":\"\\u6e56\\u5317\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":9.1166666666666671,\"region_avg_call_in_time\":3.0833333333333335,\"region_call_in_time\":3.0833333333333335,\"region_call_out_cnt\":3,\"region_avg_call_out_time\":3.0388888888888892,\"region_call_in_cnt_pct\":0.007246376811594203,\"region_call_in_time_pct\":0.0092163602849598958,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0.023143642902475142,\"region_call_out_cnt_pct\":0.025210084033613446},{\"region_loc\":\"\\u8fbd\\u5b81\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.84999999999999998,\"region_call_in_time\":0.84999999999999998,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.007246376811594203,\"region_call_in_time_pct\":0.0025407263488267822,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u8fd0\\u8425\\u5546\",\"region_uniq_num_cnt\":3,\"region_call_out_time\":9.5833333333333339,\"region_avg_call_in_time\":1.6333333333333333,\"region_call_in_time\":1.6333333333333333,\"region_call_out_cnt\":4,\"region_avg_call_out_time\":2.3958333333333335,\"region_call_in_cnt_pct\":0.007246376811594203,\"region_call_in_time_pct\":0.0048821800428436209,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0.024328326634228899,\"region_call_out_cnt_pct\":0.033613445378151259}],\"application_check\":[{\"check_points\":{\"key_value\":\"\\u6f58\\u5609\\u4f1f\"},\"app_point\":\"user_name\"},{\"check_points\":{\"province\":\"\\u5b89\\u5fbd\\u7701\",\"city\":\"\\u5b89\\u5e86\\u5e02\",\"key_value\":\"34082719921023137X\",\"gender\":\"\\u7537\",\"age\":25,\"financial_blacklist\":{\"arised\":false,\"black_type\":[]},\"court_blacklist\":{\"arised\":false,\"black_type\":[]},\"region\":\"\\u671b\\u6c5f\\u53bf\"},\"app_point\":\"id_card\"},{\"check_points\":{\"website\":\"\\u4e2d\\u56fd\\u8054\\u901a\",\"check_ebusiness\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u53f7\\u7801\\u7684\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5(\\u65e0\\u7535\\u5546\\u6570\\u636e)\",\"key_value\":\"17601279633\",\"check_name\":\"\\u7528\\u6237\\u59d3\\u540d\\u4e0e\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u59d3\\u540d[\\u6f58\\u5609\\u4f1f]\\u5339\\u914d\\u6210\\u529f\",\"reg_time\":\"2017-11-23 00:00:00\",\"financial_blacklist\":{\"arised\":false,\"black_type\":[]},\"reliability\":\"\\u5b9e\\u540d\\u8ba4\\u8bc1\",\"check_idcard\":\"\\u7528\\u6237\\u8eab\\u4efd\\u8bc1\\u53f7\\u4e0e\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u8eab\\u4efd\\u8bc1\\u53f7\\u7801[3408****137X]\\u5339\\u914d\\u6210\\u529f\"},\"app_point\":\"cell_phone\"},{\"check_points\":{\"check_ebusiness\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u5c45\\u4f4f\\u5730\\u5740\\u7684\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5(\\u65e0\\u7535\\u5546\\u6570\\u636e)\",\"key_value\":\"\",\"check_addr\":\"\\u65e0\\u6cd5\\u5b9a\\u4f4d\\u5c45\\u4f4f\\u5730\\u5740(\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740)\"},\"app_point\":\"home_addr\"},{\"check_points\":{\"check_mobile\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u5bb6\\u5ead\\u7535\\u8bdd\\u7684\\u901a\\u8bdd\\u60c5\\u51b5(\\u65e0\\u5bb6\\u5ead\\u7535\\u8bdd)\",\"key_value\":\"\"},\"app_point\":\"home_phone\"}],\"deliver_address\":[],\"report\":{\"rpt_id\":\"201804261105310005\",\"token\":\"a51d5d3d7434493aa104702daf1f3bad\",\"version\":\"4.2\",\"update_time\":\"2018-04-26T03:05:31.000Z\"},\"trip_info\":[],\"_id\":\"5ae14202b8479063effe5d07\",\"cell_behavior\":[{\"phone_num\":\"17601279633\",\"behavior\":[{\"sms_cnt\":1,\"cell_phone_num\":\"17601279633\",\"net_flow\":382.296875,\"total_amount\":-1,\"call_out_time\":9.1166666666666671,\"cell_mth\":\"2018-04\",\"cell_loc\":\"\\u4e0a\\u6d77\",\"call_cnt\":23,\"cell_operator_zh\":\"\\u4e2d\\u56fd\\u8054\\u901a\",\"call_out_cnt\":3,\"cell_operator\":\"chinaunicom\",\"call_in_time\":64.316666666666663,\"call_in_cnt\":20},{\"sms_cnt\":6,\"cell_phone_num\":\"17601279633\",\"net_flow\":1016.9775390625,\"total_amount\":36.5,\"call_out_time\":31.616666666666667,\"cell_mth\":\"2018-03\",\"cell_loc\":\"\\u4e0a\\u6d77\",\"call_cnt\":40,\"cell_operator_zh\":\"\\u4e2d\\u56fd\\u8054\\u901a\",\"call_out_cnt\":11,\"cell_operator\":\"chinaunicom\",\"call_in_time\":59.31666666666667,\"call_in_cnt\":29},{\"sms_cnt\":0,\"cell_phone_num\":\"17601279633\",\"net_flow\":358.861328125,\"total_amount\":36.100000000000001,\"call_out_time\":31.800000000000001,\"cell_mth\":\"2018-02\",\"cell_loc\":\"\\u4e0a\\u6d77\",\"call_cnt\":28,\"cell_operator_zh\":\"\\u4e2d\\u56fd\\u8054\\u901a\",\"call_out_cnt\":14,\"cell_operator\":\"chinaunicom\",\"call_in_time\":15.166666666666666,\"call_in_cnt\":14},{\"sms_cnt\":0,\"cell_phone_num\":\"17601279633\",\"net_flow\":391.6298828125,\"total_amount\":36,\"call_out_time\":43.716666666666669,\"cell_mth\":\"2018-01\",\"cell_loc\":\"\\u4e0a\\u6d77\",\"call_cnt\":48,\"cell_operator_zh\":\"\\u4e2d\\u56fd\\u8054\\u901a\",\"call_out_cnt\":25,\"cell_operator\":\"chinaunicom\",\"call_in_time\":37.200000000000003,\"call_in_cnt\":23},{\"sms_cnt\":2,\"cell_phone_num\":\"17601279633\",\"net_flow\":466.126953125,\"total_amount\":52.299999999999997,\"call_out_time\":232.11666666666667,\"cell_mth\":\"2017-12\",\"cell_loc\":\"\\u4e0a\\u6d77\",\"call_cnt\":110,\"cell_operator_zh\":\"\\u4e2d\\u56fd\\u8054\\u901a\",\"call_out_cnt\":61,\"cell_operator\":\"chinaunicom\",\"call_in_time\":155.90000000000001,\"call_in_cnt\":49},{\"sms_cnt\":0,\"cell_phone_num\":\"17601279633\",\"net_flow\":77.099609375,\"total_amount\":0,\"call_out_time\":45.549999999999997,\"cell_mth\":\"2017-11\",\"cell_loc\":\"\\u4e0a\\u6d77\",\"call_cnt\":8,\"cell_operator_zh\":\"\\u4e2d\\u56fd\\u8054\\u901a\",\"call_out_cnt\":5,\"cell_operator\":\"chinaunicom\",\"call_in_time\":2.6499999999999999,\"call_in_cnt\":3}]}]},\"success\":\"true\"}', '2018-04-26 11:06:58', '2018-04-26 11:06:58');
INSERT INTO `borrower_contact_info` VALUES ('115', '{\"note\":\"\",\"report_data\":{\"user_info_check\":{\"check_black_info\":{\"contacts_class1_blacklist_cnt\":0,\"contacts_router_ratio\":0.44117647058823528,\"contacts_class2_blacklist_cnt\":270,\"contacts_router_cnt\":15,\"contacts_class1_cnt\":34,\"phone_gray_score\":52},\"check_search_info\":{\"arised_open_web\":[],\"phone_with_other_idcards\":[\"410421199310091018\"],\"idcard_with_other_phones\":[\"17621133265\",\"18299092235\"],\"register_org_cnt\":0,\"idcard_with_other_names\":[],\"searched_org_type\":[\"\\u7ebf\\u4e0a\\u6d88\\u8d39\\u5206\\u671f\",\"\\u5176\\u4ed6\"],\"searched_org_cnt\":2,\"register_org_type\":[],\"phone_with_other_names\":[\"\\u67f3\\u6052\\u535a\"]}},\"main_service\":[{\"service_details\":[{\"interact_cnt\":11,\"interact_mth\":\"2017-10\"},{\"interact_cnt\":9,\"interact_mth\":\"2017-11\"},{\"interact_cnt\":9,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":5,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":5,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":3,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":8,\"interact_mth\":\"2018-04\"}],\"total_service_cnt\":50,\"company_type\":\"\\u94f6\\u884c\",\"company_name\":\"\\u4e2d\\u56fd\\u62db\\u5546\\u94f6\\u884c\\u5ba2\\u670d\\u7535\\u8bdd\"},{\"service_details\":[{\"interact_cnt\":2,\"interact_mth\":\"2017-10\"},{\"interact_cnt\":0,\"interact_mth\":\"2017-11\"},{\"interact_cnt\":5,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":2,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":3,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":27,\"interact_mth\":\"2018-04\"}],\"total_service_cnt\":39,\"company_type\":\"\\u8fd0\\u8425\\u5546\",\"company_name\":\"\\u4e2d\\u56fd\\u79fb\\u52a8\"},{\"service_details\":[{\"interact_cnt\":3,\"interact_mth\":\"2017-10\"},{\"interact_cnt\":4,\"interact_mth\":\"2017-11\"},{\"interact_cnt\":7,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":1,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-04\"}],\"total_service_cnt\":15,\"company_type\":\"\\u8fd0\\u8425\\u5546\",\"company_name\":\"\\u4e2d\\u56fd\\u79fb\\u52a8\\u5ba2\\u670d\\u70ed\\u7ebf\"},{\"service_details\":[{\"interact_cnt\":0,\"interact_mth\":\"2017-10\"},{\"interact_cnt\":4,\"interact_mth\":\"2017-11\"},{\"interact_cnt\":0,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-04\"}],\"total_service_cnt\":4,\"company_type\":\"\\u652f\\u4ed8\",\"company_name\":\"\\u4e2d\\u56fd\\u94f6\\u8054\\u5ba2\\u670d\\u7535\\u8bdd\"},{\"service_details\":[{\"interact_cnt\":0,\"interact_mth\":\"2017-10\"},{\"interact_cnt\":1,\"interact_mth\":\"2017-11\"},{\"interact_cnt\":2,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":1,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":1,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":1,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":1,\"interact_mth\":\"2018-04\"}],\"total_service_cnt\":7,\"company_type\":\"\\u623f\\u5730\\u4ea7\",\"company_name\":\"\\u4f4f\\u623f\\u516c\\u79ef\\u91d1\\u70ed\\u7ebf\"},{\"service_details\":[{\"interact_cnt\":4,\"interact_mth\":\"2017-10\"},{\"interact_cnt\":6,\"interact_mth\":\"2017-11\"},{\"interact_cnt\":0,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":12,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":5,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":12,\"interact_mth\":\"2018-04\"}],\"total_service_cnt\":39,\"company_type\":\"\\u94f6\\u884c\",\"company_name\":\"\\u5de5\\u5546\\u94f6\\u884c\\u5ba2\\u670d\\u7535\\u8bdd\"},{\"service_details\":[{\"interact_cnt\":1,\"interact_mth\":\"2017-10\"},{\"interact_cnt\":27,\"interact_mth\":\"2017-11\"},{\"interact_cnt\":12,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":4,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":8,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":9,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":6,\"interact_mth\":\"2018-04\"}],\"total_service_cnt\":67,\"company_type\":\"\\u94f6\\u884c\",\"company_name\":\"\\u62db\\u5546\\u94f6\\u884c\"},{\"service_details\":[{\"interact_cnt\":0,\"interact_mth\":\"2017-10\"},{\"interact_cnt\":3,\"interact_mth\":\"2017-11\"},{\"interact_cnt\":4,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":5,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":6,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":4,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":5,\"interact_mth\":\"2018-04\"}],\"total_service_cnt\":27,\"company_type\":\"\\u652f\\u4ed8\",\"company_name\":\"\\u652f\\u4ed8\\u5b9d\"},{\"service_details\":[{\"interact_cnt\":0,\"interact_mth\":\"2017-10\"},{\"interact_cnt\":0,\"interact_mth\":\"2017-11\"},{\"interact_cnt\":0,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":4,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":3,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-04\"}],\"total_service_cnt\":7,\"company_type\":\"\\u4e92\\u8054\\u7f51\",\"company_name\":\"\\u7f51\\u6613\"},{\"service_details\":[{\"interact_cnt\":0,\"interact_mth\":\"2017-10\"},{\"interact_cnt\":2,\"interact_mth\":\"2017-11\"},{\"interact_cnt\":0,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":1,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-04\"}],\"total_service_cnt\":3,\"company_type\":\"\\u7535\\u5546\",\"company_name\":\"\\u94c1\\u8def\\u552e\\u7968\"}],\"behavior_check\":[{\"check_point\":\"regular_circle\",\"score\":0,\"check_point_cn\":\"\\u670b\\u53cb\\u5708\\u5728\\u54ea\\u91cc\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740\"},{\"check_point\":\"phone_used_time\",\"score\":1,\"check_point_cn\":\"\\u53f7\\u7801\\u4f7f\\u7528\\u65f6\\u95f4\",\"result\":\"\\u81f3\\u5c11\\u4f7f\\u7528\\u4e86\\u534a\\u5e74\\u4ee5\\u4e0a(6-24\\u4e2a\\u6708\\uff0c\\u5305\\u542b6)\",\"evidence\":\"\\u6839\\u636e\\u53f7\\u7801[18221503642]\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u8ba4\\u8bc1\\u65f6\\u95f4,\\u63a8\\u7b97\\u8be5\\u53f7\\u7801\\u4f7f\\u752822\\u4e2a\\u6708\"},{\"check_point\":\"phone_silent\",\"score\":1,\"check_point_cn\":\"\\u624b\\u673a\\u9759\\u9ed8\\u60c5\\u51b5(\\u8fde\\u7eed24\\u5c0f\\u65f6\\u5185\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\\u8ba1\\u4e3a\\u9759\\u9ed8\\u4e00\\u5929)\",\"result\":\"205\\u5929\\u5185\\u670992\\u5929\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u6839\\u636e\\u8fd0\\u8425\\u5546\\u8be6\\u5355\\u6570\\u636e\\uff0c\\u8fde\\u7eed\\u4e09\\u5929\\u4ee5\\u4e0a\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f550\\u6b21\"},{\"check_point\":\"contact_each_other\",\"score\":1,\"check_point_cn\":\"\\u4e92\\u901a\\u8fc7\\u7535\\u8bdd\\u7684\\u53f7\\u7801\\u6570\\u91cf\",\"result\":\"\\u6570\\u91cf\\u6b63\\u5e38(10-100)\",\"evidence\":\"\\u4e92\\u901a\\u8fc7\\u7535\\u8bdd\\u7684\\u53f7\\u7801\\u670921\\u4e2a\\uff0c\\u6bd4\\u4f8b\\u4e3a15.11%\"},{\"check_point\":\"contact_macao\",\"score\":1,\"check_point_cn\":\"\\u6fb3\\u95e8\\u7535\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u6fb3\\u95e8\\u5730\\u533a\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_110\",\"score\":1,\"check_point_cn\":\"110\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e110\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_120\",\"score\":1,\"check_point_cn\":\"120\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e120\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_lawyer\",\"score\":1,\"check_point_cn\":\"\\u5f8b\\u5e08\\u53f7\\u7801\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e\\u5f8b\\u5e08\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_court\",\"score\":1,\"check_point_cn\":\"\\u6cd5\\u9662\\u53f7\\u7801\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e\\u6cd5\\u9662\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_night\",\"score\":1,\"check_point_cn\":\"\\u591c\\u95f4\\u6d3b\\u52a8\\u60c5\\u51b5(23\\u70b9-6\\u70b9)\",\"result\":\"\\u5f88\\u5c11\\u591c\\u95f4\\u6d3b\\u52a8(\\u591c\\u95f4\\u901a\\u8bdd\\u6bd4\\u4f8b\\u4f4e\\u4e8e20%)\",\"evidence\":\"\\u665a\\u95f4\\u6d3b\\u8dc3\\u9891\\u7387\\u5360\\u5168\\u5929\\u76844.31%\"},{\"check_point\":\"contact_loan\",\"score\":1,\"check_point_cn\":\"\\u8d37\\u6b3e\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u5f88\\u5c11\\u88ab\\u8054\\u7cfb(\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u5185\\uff0c\\u6216\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u4e0a\\u4e14\\u4e3b\\u52a8\\u547c\\u53eb\\u5360\\u6bd4\\u4f4e\\u4e8e20%)\",\"evidence\":\"\\u8054\\u7cfb\\u5217\\u8868:[\\u62db\\u5546\\u94f6\\u884c\\u4fe1\\u7528\\u5361]\\u4e3b\\u53eb3\\u6b21\\u51716.65\\u5206\\u949f\\uff0c\\u88ab\\u53eb0\\u6b21\\u51710.0\\u5206\\u949f\"},{\"check_point\":\"contact_bank\",\"score\":1,\"check_point_cn\":\"\\u94f6\\u884c\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u5f88\\u5c11\\u88ab\\u8054\\u7cfb(\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u5185\\uff0c\\u6216\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u4e0a\\u4e14\\u4e3b\\u52a8\\u547c\\u53eb\\u5360\\u6bd4\\u4f4e\\u4e8e20%)\",\"evidence\":\"\\u8054\\u7cfb\\u5217\\u8868:[\\u62db\\u5546\\u94f6\\u884c]\\u4e3b\\u53eb0\\u6b21\\u51710.0\\u5206\\u949f\\uff0c\\u88ab\\u53eb3\\u6b21\\u51712.85\\u5206\\u949f\"},{\"check_point\":\"contact_credit_card\",\"score\":1,\"check_point_cn\":\"\\u4fe1\\u7528\\u5361\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u8be5\\u7c7b\\u53f7\\u7801\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u627e\\u5230\\u4fe1\\u7528\\u5361\\u7c7b\\u76f8\\u5173\\u53f7\\u7801\"},{\"check_point\":\"dwell_used_time\",\"score\":0,\"check_point_cn\":\"\\u5c45\\u4f4f\\u5730\\u672c\\u5730\\uff08\\u7701\\u4efd\\uff09\\u5730\\u5740\\u5728\\u7535\\u5546\\u4e2d\\u4f7f\\u7528\\u65f6\\u957f\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740\"},{\"check_point\":\"ebusiness_info\",\"score\":0,\"check_point_cn\":\"\\u603b\\u4f53\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"person_ebusiness_info\",\"score\":0,\"check_point_cn\":\"\\u7533\\u8bf7\\u4eba\\u672c\\u4eba\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"virtual_buying\",\"score\":0,\"check_point_cn\":\"\\u865a\\u62df\\u5546\\u54c1\\u8d2d\\u4e70\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"lottery_buying\",\"score\":0,\"check_point_cn\":\"\\u5f69\\u7968\\u8d2d\\u4e70\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"person_addr_changed\",\"score\":0,\"check_point_cn\":\"\\u7533\\u8bf7\\u4eba\\u672c\\u4eba\\u5730\\u5740\\u53d8\\u5316\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"}],\"collection_contact\":[],\"ebusiness_expense\":[],\"contact_region\":[{\"region_loc\":\"\\u4e0a\\u6d77\",\"region_uniq_num_cnt\":74,\"region_call_out_time\":154.80000000000001,\"region_avg_call_in_time\":2.951557632398754,\"region_call_in_time\":315.81666666666666,\"region_call_out_cnt\":36,\"region_avg_call_out_time\":4.3000000000000007,\"region_call_in_cnt_pct\":0.39051094890510951,\"region_call_in_time_pct\":0.39438466501550568,\"region_call_in_cnt\":107,\"region_call_out_time_pct\":0.49356998618344144,\"region_call_out_cnt_pct\":0.31034482758620691},{\"region_loc\":\"\\u5168\\u56fd\",\"region_uniq_num_cnt\":4,\"region_call_out_time\":9.7166666666666668,\"region_avg_call_in_time\":0.53333333333333333,\"region_call_in_time\":0.53333333333333333,\"region_call_out_cnt\":5,\"region_avg_call_out_time\":1.9433333333333334,\"region_call_in_cnt_pct\":0.0036496350364963502,\"region_call_in_time_pct\":0.00066601452744187981,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0.030980975661600595,\"region_call_out_cnt_pct\":0.043103448275862072},{\"region_loc\":\"\\u5317\\u4eac\",\"region_uniq_num_cnt\":11,\"region_call_out_time\":110.84999999999999,\"region_avg_call_in_time\":5.5992753623188412,\"region_call_in_time\":386.35000000000002,\"region_call_out_cnt\":34,\"region_avg_call_out_time\":3.2602941176470588,\"region_call_in_cnt_pct\":0.2518248175182482,\"region_call_in_time_pct\":0.48246508626969431,\"region_call_in_cnt\":69,\"region_call_out_time_pct\":0.35343819747050698,\"region_call_out_cnt_pct\":0.29310344827586204},{\"region_loc\":\"\\u56db\\u5ddd\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.11666666666666667,\"region_call_in_time\":0.11666666666666667,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.0036496350364963502,\"region_call_in_time_pct\":0.00014569067787791122,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u5b89\\u5fbd\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":2.8166666666666669,\"region_avg_call_in_time\":0.27500000000000002,\"region_call_in_time\":0.55000000000000004,\"region_call_out_cnt\":1,\"region_avg_call_out_time\":2.8166666666666669,\"region_call_in_cnt_pct\":0.0072992700729927005,\"region_call_in_time_pct\":0.00068682748142443861,\"region_call_in_cnt\":2,\"region_call_out_time_pct\":0.0089807630991603788,\"region_call_out_cnt_pct\":0.0086206896551724137},{\"region_loc\":\"\\u5c71\\u4e1c\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.29999999999999999,\"region_call_in_time\":0.29999999999999999,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.0036496350364963502,\"region_call_in_time_pct\":0.00037463317168605738,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u5e7f\\u4e1c\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.31666666666666665,\"region_call_in_time\":0.6333333333333333,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.0072992700729927005,\"region_call_in_time_pct\":0.00079089225133723224,\"region_call_in_cnt\":2,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u65b0\\u7586\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":1.5666666666666667,\"region_avg_call_in_time\":1.1333333333333333,\"region_call_in_time\":5.666666666666667,\"region_call_out_cnt\":2,\"region_avg_call_out_time\":0.78333333333333333,\"region_call_in_cnt_pct\":0.01824817518248175,\"region_call_in_time_pct\":0.0070764043540699735,\"region_call_in_cnt\":5,\"region_call_out_time_pct\":0.0049952173450951215,\"region_call_out_cnt_pct\":0.017241379310344827},{\"region_loc\":\"\\u6c5f\\u82cf\",\"region_uniq_num_cnt\":20,\"region_call_out_time\":10.883333333333333,\"region_avg_call_in_time\":1.4299999999999999,\"region_call_in_time\":35.75,\"region_call_out_cnt\":7,\"region_avg_call_out_time\":1.5547619047619048,\"region_call_in_cnt_pct\":0.091240875912408759,\"region_call_in_time_pct\":0.044643786292588507,\"region_call_in_cnt\":25,\"region_call_out_time_pct\":0.034700818365394834,\"region_call_out_cnt_pct\":0.060344827586206899},{\"region_loc\":\"\\u6c5f\\u897f\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.13333333333333333,\"region_call_in_time\":0.26666666666666666,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.0072992700729927005,\"region_call_in_time_pct\":0.00033300726372093991,\"region_call_in_cnt\":2,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u6cb3\\u5317\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.18333333333333332,\"region_call_in_time\":0.18333333333333332,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.0036496350364963502,\"region_call_in_time_pct\":0.00022894249380814619,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u6cb3\\u5357\",\"region_uniq_num_cnt\":6,\"region_call_out_time\":17.283333333333335,\"region_avg_call_in_time\":0.73100775193798451,\"region_call_in_time\":31.433333333333334,\"region_call_out_cnt\":26,\"region_avg_call_out_time\":0.66474358974358982,\"region_call_in_cnt_pct\":0.15693430656934307,\"region_call_in_time_pct\":0.039253231211105792,\"region_call_in_cnt\":43,\"region_call_out_time_pct\":0.055106812626208958,\"region_call_out_cnt_pct\":0.22413793103448276},{\"region_loc\":\"\\u6d59\\u6c5f\",\"region_uniq_num_cnt\":7,\"region_call_out_time\":0.55000000000000004,\"region_avg_call_in_time\":0.54000000000000004,\"region_call_in_time\":5.4000000000000004,\"region_call_out_cnt\":1,\"region_avg_call_out_time\":0.55000000000000004,\"region_call_in_cnt_pct\":0.036496350364963501,\"region_call_in_time_pct\":0.0067433970903490337,\"region_call_in_cnt\":10,\"region_call_out_time_pct\":0.0017536401317887131,\"region_call_out_cnt_pct\":0.0086206896551724137},{\"region_loc\":\"\\u798f\\u5efa\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":10.25,\"region_call_in_time\":10.25,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.0036496350364963502,\"region_call_in_time_pct\":0.012799966699273628,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u8fd0\\u8425\\u5546\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":3.3166666666666669,\"region_avg_call_in_time\":0.8833333333333333,\"region_call_in_time\":0.8833333333333333,\"region_call_out_cnt\":2,\"region_avg_call_out_time\":1.6583333333333334,\"region_call_in_cnt_pct\":0.0036496350364963502,\"region_call_in_time_pct\":0.0011030865610756136,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0.010574981400786483,\"region_call_out_cnt_pct\":0.017241379310344827},{\"region_loc\":\"\\u9655\\u897f\",\"region_uniq_num_cnt\":3,\"region_call_out_time\":1.8500000000000001,\"region_avg_call_in_time\":2.2166666666666668,\"region_call_in_time\":6.6500000000000004,\"region_call_out_cnt\":2,\"region_avg_call_out_time\":0.92500000000000004,\"region_call_in_cnt_pct\":0.010948905109489052,\"region_call_in_time_pct\":0.0083043686390409394,\"region_call_in_cnt\":3,\"region_call_out_time_pct\":0.0058986077160165804,\"region_call_out_cnt_pct\":0.017241379310344827}],\"application_check\":[{\"check_points\":{\"key_value\":\"\\u8d75\\u6668\\u5149\"},\"app_point\":\"user_name\"},{\"check_points\":{\"province\":\"\\u6c5f\\u82cf\\u7701\",\"city\":\"\\u6cf0\\u5dde\\u5e02\",\"key_value\":\"32128419940912301X\",\"gender\":\"\\u7537\",\"age\":23,\"financial_blacklist\":{\"arised\":false,\"black_type\":[]},\"court_blacklist\":{\"arised\":false,\"black_type\":[]},\"region\":\"\\u59dc\\u5830\\u5e02\"},\"app_point\":\"id_card\"},{\"check_points\":{\"website\":\"\\u4e0a\\u6d77\\u79fb\\u52a8\",\"check_ebusiness\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u53f7\\u7801\\u7684\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5(\\u65e0\\u7535\\u5546\\u6570\\u636e)\",\"key_value\":\"18221503642\",\"check_name\":\"\\u7528\\u6237\\u59d3\\u540d\\u4e0e\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u59d3\\u540d[*\\u6668\\u5149]\\u5339\\u914d\\u6210\\u529f\",\"reg_time\":\"2016-06-28 00:00:00\",\"financial_blacklist\":{\"arised\":false,\"black_type\":[]},\"reliability\":\"\\u5b9e\\u540d\\u8ba4\\u8bc1\",\"check_idcard\":\"\\u7528\\u6237\\u8eab\\u4efd\\u8bc1\\u53f7\\u4e0e\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u8eab\\u4efd\\u8bc1\\u53f7\\u7801[321284********301*]\\u5339\\u914d\\u6210\\u529f\"},\"app_point\":\"cell_phone\"},{\"check_points\":{\"check_ebusiness\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u5c45\\u4f4f\\u5730\\u5740\\u7684\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5(\\u65e0\\u7535\\u5546\\u6570\\u636e)\",\"key_value\":\"\",\"check_addr\":\"\\u65e0\\u6cd5\\u5b9a\\u4f4d\\u5c45\\u4f4f\\u5730\\u5740(\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740)\"},\"app_point\":\"home_addr\"},{\"check_points\":{\"check_mobile\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u5bb6\\u5ead\\u7535\\u8bdd\\u7684\\u901a\\u8bdd\\u60c5\\u51b5(\\u65e0\\u5bb6\\u5ead\\u7535\\u8bdd)\",\"key_value\":\"\"},\"app_point\":\"home_phone\"}],\"deliver_address\":[],\"report\":{\"rpt_id\":\"201804271846590002\",\"token\":\"903cef82236440d889f2620e728c1496\",\"version\":\"4.2\",\"update_time\":\"2018-04-27T10:46:59.000Z\"},\"trip_info\":[{\"trip_dest\":\"\\u6c5f\\u82cf\",\"trip_leave\":\"\\u4e0a\\u6d77\",\"trip_end_time\":\"2017-10-12\",\"trip_type\":\"\\u5de5\\u4f5c\\u65e5\",\"trip_start_time\":\"2017-10-10\"},{\"trip_dest\":\"\\u6d59\\u6c5f\",\"trip_leave\":\"\\u4e0a\\u6d77\",\"trip_end_time\":\"2017-11-11\",\"trip_type\":\"\\u53cc\\u4f11\\u65e5\",\"trip_start_time\":\"2017-11-09\"},{\"trip_dest\":\"\\u6c5f\\u82cf\",\"trip_leave\":\"\\u4e0a\\u6d77\",\"trip_end_time\":\"2018-02-21\",\"trip_type\":\"\\u8282\\u5047\\u65e5\",\"trip_start_time\":\"2018-02-12\"}],\"_id\":\"5ae2ffa6026d49449c111fa5\",\"cell_behavior\":[{\"phone_num\":\"18221503642\",\"behavior\":[{\"sms_cnt\":152,\"cell_phone_num\":\"18221503642\",\"net_flow\":15.4169921875,\"total_amount\":-1,\"call_out_time\":136.03333333333333,\"cell_mth\":\"2018-04\",\"cell_loc\":\"\\u4e0a\\u6d77\",\"call_cnt\":56,\"cell_operator_zh\":\"\\u4e0a\\u6d77\\u79fb\\u52a8\",\"call_out_cnt\":18,\"cell_operator\":\"chinamobilesh\",\"call_in_time\":186.58333333333334,\"call_in_cnt\":38},{\"sms_cnt\":114,\"cell_phone_num\":\"18221503642\",\"net_flow\":0,\"total_amount\":21.239999999999998,\"call_out_time\":12.550000000000001,\"cell_mth\":\"2018-03\",\"cell_loc\":\"\\u4e0a\\u6d77\",\"call_cnt\":36,\"cell_operator_zh\":\"\\u4e0a\\u6d77\\u79fb\\u52a8\",\"call_out_cnt\":9,\"cell_operator\":\"chinamobilesh\",\"call_in_time\":127.91666666666667,\"call_in_cnt\":27},{\"sms_cnt\":127,\"cell_phone_num\":\"18221503642\",\"net_flow\":0,\"total_amount\":32.289999999999999,\"call_out_time\":58.18333333333333,\"cell_mth\":\"2018-02\",\"cell_loc\":\"\\u4e0a\\u6d77\",\"call_cnt\":65,\"cell_operator_zh\":\"\\u4e0a\\u6d77\\u79fb\\u52a8\",\"call_out_cnt\":23,\"cell_operator\":\"chinamobilesh\",\"call_in_time\":102.01666666666667,\"call_in_cnt\":42},{\"sms_cnt\":200,\"cell_phone_num\":\"18221503642\",\"net_flow\":0.00390625,\"total_amount\":27.690000000000001,\"call_out_time\":24.116666666666667,\"cell_mth\":\"2018-01\",\"cell_loc\":\"\\u4e0a\\u6d77\",\"call_cnt\":52,\"cell_operator_zh\":\"\\u4e0a\\u6d77\\u79fb\\u52a8\",\"call_out_cnt\":13,\"cell_operator\":\"chinamobilesh\",\"call_in_time\":122.88333333333334,\"call_in_cnt\":39},{\"sms_cnt\":198,\"cell_phone_num\":\"18221503642\",\"net_flow\":0,\"total_amount\":27.649999999999999,\"call_out_time\":37.116666666666667,\"cell_mth\":\"2017-12\",\"cell_loc\":\"\\u4e0a\\u6d77\",\"call_cnt\":60,\"cell_operator_zh\":\"\\u4e0a\\u6d77\\u79fb\\u52a8\",\"call_out_cnt\":18,\"cell_operator\":\"chinamobilesh\",\"call_in_time\":99.466666666666669,\"call_in_cnt\":42},{\"sms_cnt\":249,\"cell_phone_num\":\"18221503642\",\"net_flow\":0.3232421875,\"total_amount\":23.609999999999999,\"call_out_time\":23.216666666666665,\"cell_mth\":\"2017-11\",\"cell_loc\":\"\\u4e0a\\u6d77\",\"call_cnt\":53,\"cell_operator_zh\":\"\\u4e0a\\u6d77\\u79fb\\u52a8\",\"call_out_cnt\":8,\"cell_operator\":\"chinamobilesh\",\"call_in_time\":68.433333333333337,\"call_in_cnt\":45},{\"sms_cnt\":176,\"cell_phone_num\":\"18221503642\",\"net_flow\":0.51171875,\"total_amount\":27.5,\"call_out_time\":22.416666666666668,\"cell_mth\":\"2017-10\",\"cell_loc\":\"\\u4e0a\\u6d77\",\"call_cnt\":68,\"cell_operator_zh\":\"\\u4e0a\\u6d77\\u79fb\\u52a8\",\"call_out_cnt\":27,\"cell_operator\":\"chinamobilesh\",\"call_in_time\":93.483333333333334,\"call_in_cnt\":41}]}]},\"success\":\"true\"}', '2018-04-27 18:48:20', '2018-04-27 18:48:20');
INSERT INTO `borrower_contact_info` VALUES ('134', '{\"note\":\"\",\"report_data\":{\"user_info_check\":{\"check_black_info\":{\"contacts_class1_blacklist_cnt\":0,\"contacts_router_ratio\":0.40000000000000002,\"contacts_class2_blacklist_cnt\":3,\"contacts_router_cnt\":2,\"contacts_class1_cnt\":5,\"phone_gray_score\":65},\"check_search_info\":{\"arised_open_web\":[],\"phone_with_other_idcards\":[],\"idcard_with_other_phones\":[],\"register_org_cnt\":0,\"idcard_with_other_names\":[],\"searched_org_type\":[\"\\u7ebf\\u4e0a\\u6d88\\u8d39\\u5206\\u671f\",\"\\u5176\\u4ed6\"],\"searched_org_cnt\":2,\"register_org_type\":[],\"phone_with_other_names\":[]}},\"main_service\":[{\"service_details\":[{\"interact_cnt\":0,\"interact_mth\":\"2017-11\"},{\"interact_cnt\":0,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":1,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-04\"}],\"total_service_cnt\":1,\"company_type\":\"\\u94f6\\u884c\",\"company_name\":\"\\u4e2d\\u4fe1\\u4fe1\\u7528\\u5361\"},{\"service_details\":[{\"interact_cnt\":0,\"interact_mth\":\"2017-11\"},{\"interact_cnt\":0,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":1,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":3,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-04\"}],\"total_service_cnt\":4,\"company_type\":\"\\u8fd0\\u8425\\u5546\",\"company_name\":\"\\u4e2d\\u56fd\\u79fb\\u52a8\\u5ba2\\u670d\\u70ed\\u7ebf\"},{\"service_details\":[{\"interact_cnt\":0,\"interact_mth\":\"2017-11\"},{\"interact_cnt\":0,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":1,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":1,\"interact_mth\":\"2018-04\"}],\"total_service_cnt\":2,\"company_type\":\"\\u94f6\\u884c\",\"company_name\":\"\\u4ea4\\u901a\\u94f6\\u884c\"},{\"service_details\":[{\"interact_cnt\":0,\"interact_mth\":\"2017-11\"},{\"interact_cnt\":0,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":1,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-04\"}],\"total_service_cnt\":1,\"company_type\":\"\\u623f\\u5730\\u4ea7\",\"company_name\":\"\\u4fde\\u4e09\\u59b9(\\u5e97\\u94fa)\"},{\"service_details\":[{\"interact_cnt\":0,\"interact_mth\":\"2017-11\"},{\"interact_cnt\":0,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":6,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-04\"}],\"total_service_cnt\":6,\"company_type\":\"\\u94f6\\u884c\",\"company_name\":\"\\u6c11\\u751f\\u4fe1\\u7528\\u5361\"},{\"service_details\":[{\"interact_cnt\":0,\"interact_mth\":\"2017-11\"},{\"interact_cnt\":0,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":1,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-04\"}],\"total_service_cnt\":1,\"company_type\":\"\\u94f6\\u884c\",\"company_name\":\"\\u6c11\\u751f\\u94f6\\u884c\"}],\"behavior_check\":[{\"check_point\":\"regular_circle\",\"score\":0,\"check_point_cn\":\"\\u670b\\u53cb\\u5708\\u5728\\u54ea\\u91cc\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740\"},{\"check_point\":\"phone_used_time\",\"score\":1,\"check_point_cn\":\"\\u53f7\\u7801\\u4f7f\\u7528\\u65f6\\u95f4\",\"result\":\"\\u957f\\u671f\\u4f7f\\u7528(24\\u4e2a\\u6708\\u4ee5\\u4e0a\\uff0c\\u5305\\u542b24)\",\"evidence\":\"\\u6839\\u636e\\u53f7\\u7801[18236968869]\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u8ba4\\u8bc1\\u65f6\\u95f4,\\u63a8\\u7b97\\u8be5\\u53f7\\u7801\\u4f7f\\u752840\\u4e2a\\u6708\"},{\"check_point\":\"phone_silent\",\"score\":2,\"check_point_cn\":\"\\u624b\\u673a\\u9759\\u9ed8\\u60c5\\u51b5(\\u8fde\\u7eed24\\u5c0f\\u65f6\\u5185\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\\u8ba1\\u4e3a\\u9759\\u9ed8\\u4e00\\u5929)\",\"result\":\"174\\u5929\\u5185\\u6709109\\u5929\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u6839\\u636e\\u8fd0\\u8425\\u5546\\u8be6\\u5355\\u6570\\u636e\\uff0c\\u8fde\\u7eed\\u4e09\\u5929\\u4ee5\\u4e0a\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f5514\\u6b21: 2017-11-08 - 2017-11-10, 3\\u5929 \\/ 2017-11-22 - 2017-11-24, 3\\u5929 \\/ 2017-11-30 - 2017-12-02, 3\\u5929 \\/ 2017-12-20 - 2017-12-22, 3\\u5929 \\/ 2017-12-24 - 2017-12-26, 3\\u5929 \\/ 2017-12-28 - 2017-12-30, 3\\u5929 \\/ 2018-01-04 - 2018-01-07, 4\\u5929 \\/ 2018-01-18 - 2018-01-21, 4\\u5929 \\/ 2018-01-31 - 2018-02-02, 3\\u5929 \\/ 2018-02-05 - 2018-02-07, 3\\u5929 \\/ 2018-02-09 - 2018-02-12, 4\\u5929 \\/ 2018-02-21 - 2018-02-23, 3\\u5929 \\/ 2018-03-01 - 2018-03-06, 6\\u5929 \\/ 2018-04-06 - 2018-04-09, 4\\u5929\"},{\"check_point\":\"contact_each_other\",\"score\":1,\"check_point_cn\":\"\\u4e92\\u901a\\u8fc7\\u7535\\u8bdd\\u7684\\u53f7\\u7801\\u6570\\u91cf\",\"result\":\"\\u6570\\u91cf\\u6b63\\u5e38(10-100)\",\"evidence\":\"\\u4e92\\u901a\\u8fc7\\u7535\\u8bdd\\u7684\\u53f7\\u7801\\u670914\\u4e2a\\uff0c\\u6bd4\\u4f8b\\u4e3a9.93%\"},{\"check_point\":\"contact_macao\",\"score\":1,\"check_point_cn\":\"\\u6fb3\\u95e8\\u7535\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u6fb3\\u95e8\\u5730\\u533a\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_110\",\"score\":1,\"check_point_cn\":\"110\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e110\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_120\",\"score\":1,\"check_point_cn\":\"120\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e120\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_lawyer\",\"score\":1,\"check_point_cn\":\"\\u5f8b\\u5e08\\u53f7\\u7801\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e\\u5f8b\\u5e08\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_court\",\"score\":1,\"check_point_cn\":\"\\u6cd5\\u9662\\u53f7\\u7801\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e\\u6cd5\\u9662\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_night\",\"score\":1,\"check_point_cn\":\"\\u591c\\u95f4\\u6d3b\\u52a8\\u60c5\\u51b5(23\\u70b9-6\\u70b9)\",\"result\":\"\\u5f88\\u5c11\\u591c\\u95f4\\u6d3b\\u52a8(\\u591c\\u95f4\\u901a\\u8bdd\\u6bd4\\u4f8b\\u4f4e\\u4e8e20%)\",\"evidence\":\"\\u665a\\u95f4\\u6d3b\\u8dc3\\u9891\\u7387\\u5360\\u5168\\u5929\\u76846.24%\"},{\"check_point\":\"contact_loan\",\"score\":1,\"check_point_cn\":\"\\u8d37\\u6b3e\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u5f88\\u5c11\\u88ab\\u8054\\u7cfb(\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u5185\\uff0c\\u6216\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u4e0a\\u4e14\\u4e3b\\u52a8\\u547c\\u53eb\\u5360\\u6bd4\\u4f4e\\u4e8e20%)\",\"evidence\":\"\\u8054\\u7cfb\\u5217\\u8868:[\\u6c11\\u751f\\u94f6\\u884c\\u4fe1\\u7528\\u5361]\\u4e3b\\u53eb3\\u6b21\\u51717.92\\u5206\\u949f\\uff0c\\u88ab\\u53eb0\\u6b21\\u51710.0\\u5206\\u949f\"},{\"check_point\":\"contact_bank\",\"score\":2,\"check_point_cn\":\"\\u94f6\\u884c\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u7ecf\\u5e38\\u88ab\\u8054\\u7cfb(\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u4e0a\\uff0c\\u5305\\u542b5\\u6b21\\uff0c\\u4e14\\u4e3b\\u52a8\\u547c\\u53eb\\u5360\\u6bd4\\u5927\\u4e8e50%\\uff0c\\u5305\\u542b50%)\",\"evidence\":\"\\u8054\\u7cfb\\u5217\\u8868:[\\u4ea4\\u901a\\u94f6\\u884c\\u5ba2\\u670d\\u7535\\u8bdd]\\u4e3b\\u53eb0\\u6b21\\u51710.0\\u5206\\u949f\\uff0c\\u88ab\\u53eb1\\u6b21\\u51712.33\\u5206\\u949f;[\\u5de5\\u5546\\u94f6\\u884c\\u5ba2\\u670d\\u7535\\u8bdd]\\u4e3b\\u53eb3\\u6b21\\u51713.08\\u5206\\u949f\\uff0c\\u88ab\\u53eb0\\u6b21\\u51710.0\\u5206\\u949f;[\\u6c11\\u751f\\u94f6\\u884c\\u5ba2\\u670d\\u7535\\u8bdd]\\u4e3b\\u53eb0\\u6b21\\u51710.0\\u5206\\u949f\\uff0c\\u88ab\\u53eb2\\u6b21\\u51711.5\\u5206\\u949f\"},{\"check_point\":\"contact_credit_card\",\"score\":1,\"check_point_cn\":\"\\u4fe1\\u7528\\u5361\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u5f88\\u5c11\\u88ab\\u8054\\u7cfb(\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u5185\\uff0c\\u6216\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u4e0a\\u4e14\\u4e3b\\u52a8\\u547c\\u53eb\\u5360\\u6bd4\\u4f4e\\u4e8e20%)\",\"evidence\":\"\\u8054\\u7cfb\\u5217\\u8868:[\\u4ea4\\u901a\\u94f6\\u884c\\u4fe1\\u7528\\u5361\\u70ed\\u7ebf]\\u4e3b\\u53eb2\\u6b21\\u51714.82\\u5206\\u949f\\uff0c\\u88ab\\u53eb0\\u6b21\\u51710.0\\u5206\\u949f;[\\u534e\\u590f\\u94f6\\u884c\\u4fe1\\u7528\\u5361\\u70ed\\u7ebf]\\u4e3b\\u53eb2\\u6b21\\u51712.48\\u5206\\u949f\\uff0c\\u88ab\\u53eb0\\u6b21\\u51710.0\\u5206\\u949f\"},{\"check_point\":\"dwell_used_time\",\"score\":0,\"check_point_cn\":\"\\u5c45\\u4f4f\\u5730\\u672c\\u5730\\uff08\\u7701\\u4efd\\uff09\\u5730\\u5740\\u5728\\u7535\\u5546\\u4e2d\\u4f7f\\u7528\\u65f6\\u957f\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740\"},{\"check_point\":\"ebusiness_info\",\"score\":0,\"check_point_cn\":\"\\u603b\\u4f53\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"person_ebusiness_info\",\"score\":0,\"check_point_cn\":\"\\u7533\\u8bf7\\u4eba\\u672c\\u4eba\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"virtual_buying\",\"score\":0,\"check_point_cn\":\"\\u865a\\u62df\\u5546\\u54c1\\u8d2d\\u4e70\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"lottery_buying\",\"score\":0,\"check_point_cn\":\"\\u5f69\\u7968\\u8d2d\\u4e70\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"person_addr_changed\",\"score\":0,\"check_point_cn\":\"\\u7533\\u8bf7\\u4eba\\u672c\\u4eba\\u5730\\u5740\\u53d8\\u5316\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"}],\"collection_contact\":[],\"ebusiness_expense\":[],\"contact_region\":[{\"region_loc\":\"\\u4e0a\\u6d77\",\"region_uniq_num_cnt\":66,\"region_call_out_time\":78.433333333333337,\"region_avg_call_in_time\":0.93532338308457708,\"region_call_in_time\":62.666666666666664,\"region_call_out_cnt\":40,\"region_avg_call_out_time\":1.9608333333333334,\"region_call_in_cnt_pct\":0.43225806451612903,\"region_call_in_time_pct\":0.28724216959511079,\"region_call_in_cnt\":67,\"region_call_out_time_pct\":0.31503547998393361,\"region_call_out_cnt_pct\":0.43478260869565216},{\"region_loc\":\"\\u5168\\u56fd\",\"region_uniq_num_cnt\":12,\"region_call_out_time\":22.083333333333332,\"region_avg_call_in_time\":0.73518518518518516,\"region_call_in_time\":6.6166666666666663,\"region_call_out_cnt\":13,\"region_avg_call_out_time\":1.6987179487179487,\"region_call_in_cnt_pct\":0.058064516129032261,\"region_call_in_time_pct\":0.030328495034377387,\"region_call_in_cnt\":9,\"region_call_out_time_pct\":0.088699959833980449,\"region_call_out_cnt_pct\":0.14130434782608695},{\"region_loc\":\"\\u5317\\u4eac\",\"region_uniq_num_cnt\":6,\"region_call_out_time\":3.3666666666666667,\"region_avg_call_in_time\":0.911904761904762,\"region_call_in_time\":6.3833333333333337,\"region_call_out_cnt\":1,\"region_avg_call_out_time\":3.3666666666666667,\"region_call_in_cnt_pct\":0.045161290322580643,\"region_call_in_time_pct\":0.029258976317799851,\"region_call_in_cnt\":7,\"region_call_out_time_pct\":0.013522559914312492,\"region_call_out_cnt_pct\":0.010869565217391304},{\"region_loc\":\"\\u56db\\u5ddd\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.18333333333333332,\"region_call_in_time\":0.18333333333333332,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.0064516129032258064,\"region_call_in_time_pct\":0.00084033613445378145,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u5929\\u6d25\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.69999999999999996,\"region_call_in_time\":0.69999999999999996,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.0064516129032258064,\"region_call_in_time_pct\":0.0032085561497326204,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u5b89\\u5fbd\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":0.55000000000000004,\"region_avg_call_in_time\":0.34999999999999998,\"region_call_in_time\":0.34999999999999998,\"region_call_out_cnt\":1,\"region_avg_call_out_time\":0.55000000000000004,\"region_call_in_cnt_pct\":0.0064516129032258064,\"region_call_in_time_pct\":0.0016042780748663102,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0.0022091310751104565,\"region_call_out_cnt_pct\":0.010869565217391304},{\"region_loc\":\"\\u672a\\u77e5\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.66666666666666663,\"region_call_in_time\":0.66666666666666663,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.0064516129032258064,\"region_call_in_time_pct\":0.0030557677616501145,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u6c5f\\u82cf\",\"region_uniq_num_cnt\":5,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.5,\"region_call_in_time\":2.5,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.032258064516129031,\"region_call_in_time_pct\":0.01145912910618793,\"region_call_in_cnt\":5,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u6cb3\\u5357\",\"region_uniq_num_cnt\":38,\"region_call_out_time\":142.90000000000001,\"region_avg_call_in_time\":2.4112121212121211,\"region_call_in_time\":132.61666666666667,\"region_call_out_cnt\":33,\"region_avg_call_out_time\":4.3303030303030301,\"region_call_in_cnt_pct\":0.35483870967741937,\"region_call_in_time_pct\":0.60786860198624915,\"region_call_in_cnt\":55,\"region_call_out_time_pct\":0.57397241933324405,\"region_call_out_cnt_pct\":0.35869565217391303},{\"region_loc\":\"\\u6d59\\u6c5f\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":1.1333333333333333,\"region_avg_call_in_time\":0.93333333333333335,\"region_call_in_time\":0.93333333333333335,\"region_call_out_cnt\":1,\"region_avg_call_out_time\":1.1333333333333333,\"region_call_in_cnt_pct\":0.0064516129032258064,\"region_call_in_time_pct\":0.0042780748663101605,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0.0045521488820457895,\"region_call_out_cnt_pct\":0.010869565217391304},{\"region_loc\":\"\\u8d35\\u5dde\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.20555555555555557,\"region_call_in_time\":0.6166666666666667,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.01935483870967742,\"region_call_in_time_pct\":0.0028265851795263564,\"region_call_in_cnt\":3,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u8fd0\\u8425\\u5546\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0.5,\"region_avg_call_in_time\":0,\"region_call_in_time\":0,\"region_call_out_cnt\":3,\"region_avg_call_out_time\":0.16666666666666666,\"region_call_in_cnt_pct\":0,\"region_call_in_time_pct\":0,\"region_call_in_cnt\":0,\"region_call_out_time_pct\":0.0020083009773731422,\"region_call_out_cnt_pct\":0.032608695652173912},{\"region_loc\":\"\\u91cd\\u5e86\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.45000000000000001,\"region_call_in_time\":0.45000000000000001,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.0064516129032258064,\"region_call_in_time_pct\":0.0020626432391138276,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u9655\\u897f\",\"region_uniq_num_cnt\":3,\"region_call_out_time\":0,\"region_avg_call_in_time\":1.1611111111111112,\"region_call_in_time\":3.4833333333333334,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.01935483870967742,\"region_call_in_time_pct\":0.015966386554621851,\"region_call_in_cnt\":3,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0}],\"application_check\":[{\"check_points\":{\"key_value\":\"\\u674e\\u51b2\\u51b2\"},\"app_point\":\"user_name\"},{\"check_points\":{\"province\":\"\\u6cb3\\u5357\\u7701\",\"city\":\"\\u5546\\u4e18\\u5e02\",\"key_value\":\"411422199302283025\",\"gender\":\"\\u5973\",\"age\":25,\"financial_blacklist\":{\"arised\":false,\"black_type\":[]},\"court_blacklist\":{\"arised\":false,\"black_type\":[]},\"region\":\"\\u7762\\u53bf\"},\"app_point\":\"id_card\"},{\"check_points\":{\"website\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"check_ebusiness\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u53f7\\u7801\\u7684\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5(\\u65e0\\u7535\\u5546\\u6570\\u636e)\",\"key_value\":\"18236968869\",\"check_name\":\"\\u7528\\u6237\\u59d3\\u540d\\u4e0e\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u59d3\\u540d[\\u674e** ]\\u5339\\u914d\\u6210\\u529f\",\"reg_time\":\"2015-01-20 00:00:00\",\"financial_blacklist\":{\"arised\":false,\"black_type\":[]},\"reliability\":\"\\u5b9e\\u540d\\u8ba4\\u8bc1\",\"check_idcard\":\"\\u7528\\u6237\\u8eab\\u4efd\\u8bc1\\u53f7\\u4e0e\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u8eab\\u4efd\\u8bc1\\u53f7\\u7801[**************3025]\\u5339\\u914d\\u6210\\u529f\"},\"app_point\":\"cell_phone\"},{\"check_points\":{\"check_ebusiness\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u5c45\\u4f4f\\u5730\\u5740\\u7684\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5(\\u65e0\\u7535\\u5546\\u6570\\u636e)\",\"key_value\":\"\",\"check_addr\":\"\\u65e0\\u6cd5\\u5b9a\\u4f4d\\u5c45\\u4f4f\\u5730\\u5740(\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740)\"},\"app_point\":\"home_addr\"},{\"check_points\":{\"check_mobile\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u5bb6\\u5ead\\u7535\\u8bdd\\u7684\\u901a\\u8bdd\\u60c5\\u51b5(\\u65e0\\u5bb6\\u5ead\\u7535\\u8bdd)\",\"key_value\":\"\"},\"app_point\":\"home_phone\"}],\"deliver_address\":[],\"report\":{\"rpt_id\":\"201804261704510002\",\"token\":\"5de8fa1e6012457c936c85deea08872c\",\"version\":\"4.2\",\"update_time\":\"2018-04-26T09:04:51.000Z\"},\"trip_info\":[{\"trip_dest\":\"\\u6c5f\\u82cf\",\"trip_leave\":\"\\u4e0a\\u6d77\",\"trip_end_time\":\"2017-11-26\",\"trip_type\":\"\\u53cc\\u4f11\\u65e5\",\"trip_start_time\":\"2017-11-25\"},{\"trip_dest\":\"\\u6cb3\\u5357\",\"trip_leave\":\"\\u4e0a\\u6d77\",\"trip_end_time\":\"2018-01-02\",\"trip_type\":\"\\u8282\\u5047\\u65e5\",\"trip_start_time\":\"2017-12-22\"},{\"trip_dest\":\"\\u6cb3\\u5357\",\"trip_leave\":\"\\u4e0a\\u6d77\",\"trip_end_time\":\"2018-02-27\",\"trip_type\":\"\\u8282\\u5047\\u65e5\",\"trip_start_time\":\"2018-02-13\"},{\"trip_dest\":\"\\u6d59\\u6c5f\",\"trip_leave\":\"\\u4e0a\\u6d77\",\"trip_end_time\":\"2018-03-10\",\"trip_type\":\"\\u53cc\\u4f11\\u65e5\",\"trip_start_time\":\"2018-03-10\"}],\"_id\":\"5ae196370a07d36c920a23e6\",\"cell_behavior\":[{\"phone_num\":\"18236968869\",\"behavior\":[{\"sms_cnt\":7,\"cell_phone_num\":\"18236968869\",\"net_flow\":790.888671875,\"total_amount\":-1,\"call_out_time\":50.799999999999997,\"cell_mth\":\"2018-04\",\"cell_loc\":\"\\u6cb3\\u5357\",\"call_cnt\":32,\"cell_operator_zh\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"call_out_cnt\":8,\"cell_operator\":\"chinamobileha\",\"call_in_time\":25.699999999999999,\"call_in_cnt\":24},{\"sms_cnt\":19,\"cell_phone_num\":\"18236968869\",\"net_flow\":1142.44140625,\"total_amount\":106.54000000000001,\"call_out_time\":90.416666666666671,\"cell_mth\":\"2018-03\",\"cell_loc\":\"\\u6cb3\\u5357\",\"call_cnt\":96,\"cell_operator_zh\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"call_out_cnt\":47,\"cell_operator\":\"chinamobileha\",\"call_in_time\":93.433333333333337,\"call_in_cnt\":49},{\"sms_cnt\":8,\"cell_phone_num\":\"18236968869\",\"net_flow\":1356.306640625,\"total_amount\":73.200000000000003,\"call_out_time\":12.9,\"cell_mth\":\"2018-02\",\"cell_loc\":\"\\u6cb3\\u5357\",\"call_cnt\":29,\"cell_operator_zh\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"call_out_cnt\":13,\"cell_operator\":\"chinamobileha\",\"call_in_time\":15.449999999999999,\"call_in_cnt\":16},{\"sms_cnt\":23,\"cell_phone_num\":\"18236968869\",\"net_flow\":742.083984375,\"total_amount\":74.400000000000006,\"call_out_time\":8.0333333333333332,\"cell_mth\":\"2018-01\",\"cell_loc\":\"\\u6cb3\\u5357\",\"call_cnt\":30,\"cell_operator_zh\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"call_out_cnt\":6,\"cell_operator\":\"chinamobileha\",\"call_in_time\":40.350000000000001,\"call_in_cnt\":24},{\"sms_cnt\":5,\"cell_phone_num\":\"18236968869\",\"net_flow\":944.66796875,\"total_amount\":74.519999999999996,\"call_out_time\":55.083333333333336,\"cell_mth\":\"2017-12\",\"cell_loc\":\"\\u6cb3\\u5357\",\"call_cnt\":32,\"cell_operator_zh\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"call_out_cnt\":7,\"cell_operator\":\"chinamobileha\",\"call_in_time\":12.483333333333333,\"call_in_cnt\":25},{\"sms_cnt\":12,\"cell_phone_num\":\"18236968869\",\"net_flow\":645.498046875,\"total_amount\":73.400000000000006,\"call_out_time\":31.733333333333334,\"cell_mth\":\"2017-11\",\"cell_loc\":\"\\u6cb3\\u5357\",\"call_cnt\":28,\"cell_operator_zh\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"call_out_cnt\":11,\"cell_operator\":\"chinamobileha\",\"call_in_time\":30.75,\"call_in_cnt\":17}]}]},\"success\":\"true\"}', '2018-04-26 17:06:15', '2018-05-01 14:42:33');
INSERT INTO `borrower_contact_info` VALUES ('135', '{\"note\":\"\",\"report_data\":{\"user_info_check\":{\"check_black_info\":{\"contacts_class1_blacklist_cnt\":0,\"contacts_router_ratio\":0.40000000000000002,\"contacts_class2_blacklist_cnt\":3,\"contacts_router_cnt\":2,\"contacts_class1_cnt\":5,\"phone_gray_score\":65},\"check_search_info\":{\"arised_open_web\":[],\"phone_with_other_idcards\":[],\"idcard_with_other_phones\":[],\"register_org_cnt\":0,\"idcard_with_other_names\":[],\"searched_org_type\":[\"\\u7ebf\\u4e0a\\u6d88\\u8d39\\u5206\\u671f\",\"\\u5176\\u4ed6\"],\"searched_org_cnt\":2,\"register_org_type\":[],\"phone_with_other_names\":[]}},\"main_service\":[{\"service_details\":[{\"interact_cnt\":0,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":1,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-04\"}],\"total_service_cnt\":1,\"company_type\":\"\\u94f6\\u884c\",\"company_name\":\"\\u4e2d\\u4fe1\\u4fe1\\u7528\\u5361\"},{\"service_details\":[{\"interact_cnt\":0,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":1,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":3,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-04\"}],\"total_service_cnt\":4,\"company_type\":\"\\u8fd0\\u8425\\u5546\",\"company_name\":\"\\u4e2d\\u56fd\\u79fb\\u52a8\\u5ba2\\u670d\\u70ed\\u7ebf\"},{\"service_details\":[{\"interact_cnt\":0,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":1,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":1,\"interact_mth\":\"2018-04\"}],\"total_service_cnt\":2,\"company_type\":\"\\u94f6\\u884c\",\"company_name\":\"\\u4ea4\\u901a\\u94f6\\u884c\"},{\"service_details\":[{\"interact_cnt\":0,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":1,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-04\"}],\"total_service_cnt\":1,\"company_type\":\"\\u623f\\u5730\\u4ea7\",\"company_name\":\"\\u4fde\\u4e09\\u59b9(\\u5e97\\u94fa)\"},{\"service_details\":[{\"interact_cnt\":0,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":6,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-04\"}],\"total_service_cnt\":6,\"company_type\":\"\\u94f6\\u884c\",\"company_name\":\"\\u6c11\\u751f\\u4fe1\\u7528\\u5361\"},{\"service_details\":[{\"interact_cnt\":0,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":1,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-04\"}],\"total_service_cnt\":1,\"company_type\":\"\\u94f6\\u884c\",\"company_name\":\"\\u6c11\\u751f\\u94f6\\u884c\"}],\"behavior_check\":[{\"check_point\":\"regular_circle\",\"score\":0,\"check_point_cn\":\"\\u670b\\u53cb\\u5708\\u5728\\u54ea\\u91cc\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740\"},{\"check_point\":\"phone_used_time\",\"score\":1,\"check_point_cn\":\"\\u53f7\\u7801\\u4f7f\\u7528\\u65f6\\u95f4\",\"result\":\"\\u957f\\u671f\\u4f7f\\u7528(24\\u4e2a\\u6708\\u4ee5\\u4e0a\\uff0c\\u5305\\u542b24)\",\"evidence\":\"\\u6839\\u636e\\u53f7\\u7801[18236968869]\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u8ba4\\u8bc1\\u65f6\\u95f4,\\u63a8\\u7b97\\u8be5\\u53f7\\u7801\\u4f7f\\u752840\\u4e2a\\u6708\"},{\"check_point\":\"phone_silent\",\"score\":2,\"check_point_cn\":\"\\u624b\\u673a\\u9759\\u9ed8\\u60c5\\u51b5(\\u8fde\\u7eed24\\u5c0f\\u65f6\\u5185\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\\u8ba1\\u4e3a\\u9759\\u9ed8\\u4e00\\u5929)\",\"result\":\"149\\u5929\\u5185\\u670989\\u5929\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u6839\\u636e\\u8fd0\\u8425\\u5546\\u8be6\\u5355\\u6570\\u636e\\uff0c\\u8fde\\u7eed\\u4e09\\u5929\\u4ee5\\u4e0a\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f5511\\u6b21: 2017-12-20 - 2017-12-22, 3\\u5929 \\/ 2017-12-24 - 2017-12-26, 3\\u5929 \\/ 2017-12-28 - 2017-12-30, 3\\u5929 \\/ 2018-01-04 - 2018-01-07, 4\\u5929 \\/ 2018-01-18 - 2018-01-21, 4\\u5929 \\/ 2018-01-31 - 2018-02-02, 3\\u5929 \\/ 2018-02-05 - 2018-02-07, 3\\u5929 \\/ 2018-02-09 - 2018-02-12, 4\\u5929 \\/ 2018-02-21 - 2018-02-23, 3\\u5929 \\/ 2018-03-01 - 2018-03-06, 6\\u5929 \\/ 2018-04-06 - 2018-04-09, 4\\u5929\"},{\"check_point\":\"contact_each_other\",\"score\":1,\"check_point_cn\":\"\\u4e92\\u901a\\u8fc7\\u7535\\u8bdd\\u7684\\u53f7\\u7801\\u6570\\u91cf\",\"result\":\"\\u6570\\u91cf\\u6b63\\u5e38(10-100)\",\"evidence\":\"\\u4e92\\u901a\\u8fc7\\u7535\\u8bdd\\u7684\\u53f7\\u7801\\u670911\\u4e2a\\uff0c\\u6bd4\\u4f8b\\u4e3a8.4%\"},{\"check_point\":\"contact_macao\",\"score\":1,\"check_point_cn\":\"\\u6fb3\\u95e8\\u7535\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u6fb3\\u95e8\\u5730\\u533a\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_110\",\"score\":1,\"check_point_cn\":\"110\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e110\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_120\",\"score\":1,\"check_point_cn\":\"120\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e120\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_lawyer\",\"score\":1,\"check_point_cn\":\"\\u5f8b\\u5e08\\u53f7\\u7801\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e\\u5f8b\\u5e08\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_court\",\"score\":1,\"check_point_cn\":\"\\u6cd5\\u9662\\u53f7\\u7801\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e\\u6cd5\\u9662\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_night\",\"score\":1,\"check_point_cn\":\"\\u591c\\u95f4\\u6d3b\\u52a8\\u60c5\\u51b5(23\\u70b9-6\\u70b9)\",\"result\":\"\\u5f88\\u5c11\\u591c\\u95f4\\u6d3b\\u52a8(\\u591c\\u95f4\\u901a\\u8bdd\\u6bd4\\u4f8b\\u4f4e\\u4e8e20%)\",\"evidence\":\"\\u665a\\u95f4\\u6d3b\\u8dc3\\u9891\\u7387\\u5360\\u5168\\u5929\\u76846.2%\"},{\"check_point\":\"contact_loan\",\"score\":1,\"check_point_cn\":\"\\u8d37\\u6b3e\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u5f88\\u5c11\\u88ab\\u8054\\u7cfb(\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u5185\\uff0c\\u6216\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u4e0a\\u4e14\\u4e3b\\u52a8\\u547c\\u53eb\\u5360\\u6bd4\\u4f4e\\u4e8e20%)\",\"evidence\":\"\\u8054\\u7cfb\\u5217\\u8868:[\\u6c11\\u751f\\u94f6\\u884c\\u4fe1\\u7528\\u5361]\\u4e3b\\u53eb3\\u6b21\\u51717.92\\u5206\\u949f\\uff0c\\u88ab\\u53eb0\\u6b21\\u51710.0\\u5206\\u949f\"},{\"check_point\":\"contact_bank\",\"score\":2,\"check_point_cn\":\"\\u94f6\\u884c\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u5076\\u5c14\\u88ab\\u8054\\u7cfb(\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u4e0a\\uff0c\\u5305\\u542b5\\u6b21\\uff0c\\u4e14\\u4e3b\\u52a8\\u547c\\u53eb\\u5360\\u6bd4 20%-50%\\u4e4b\\u95f4\\uff0c\\u5305\\u542b20%)\",\"evidence\":\"\\u8054\\u7cfb\\u5217\\u8868:[\\u4ea4\\u901a\\u94f6\\u884c\\u5ba2\\u670d\\u7535\\u8bdd]\\u4e3b\\u53eb0\\u6b21\\u51710.0\\u5206\\u949f\\uff0c\\u88ab\\u53eb1\\u6b21\\u51712.33\\u5206\\u949f;[\\u5de5\\u5546\\u94f6\\u884c\\u5ba2\\u670d\\u7535\\u8bdd]\\u4e3b\\u53eb3\\u6b21\\u51713.08\\u5206\\u949f\\uff0c\\u88ab\\u53eb0\\u6b21\\u51710.0\\u5206\\u949f;[\\u6c11\\u751f\\u94f6\\u884c\\u5ba2\\u670d\\u7535\\u8bdd]\\u4e3b\\u53eb0\\u6b21\\u51710.0\\u5206\\u949f\\uff0c\\u88ab\\u53eb1\\u6b21\\u51711.05\\u5206\\u949f\"},{\"check_point\":\"contact_credit_card\",\"score\":1,\"check_point_cn\":\"\\u4fe1\\u7528\\u5361\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u5f88\\u5c11\\u88ab\\u8054\\u7cfb(\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u5185\\uff0c\\u6216\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u4e0a\\u4e14\\u4e3b\\u52a8\\u547c\\u53eb\\u5360\\u6bd4\\u4f4e\\u4e8e20%)\",\"evidence\":\"\\u8054\\u7cfb\\u5217\\u8868:[\\u4ea4\\u901a\\u94f6\\u884c\\u4fe1\\u7528\\u5361\\u70ed\\u7ebf]\\u4e3b\\u53eb2\\u6b21\\u51714.82\\u5206\\u949f\\uff0c\\u88ab\\u53eb0\\u6b21\\u51710.0\\u5206\\u949f;[\\u534e\\u590f\\u94f6\\u884c\\u4fe1\\u7528\\u5361\\u70ed\\u7ebf]\\u4e3b\\u53eb2\\u6b21\\u51712.48\\u5206\\u949f\\uff0c\\u88ab\\u53eb0\\u6b21\\u51710.0\\u5206\\u949f\"},{\"check_point\":\"dwell_used_time\",\"score\":0,\"check_point_cn\":\"\\u5c45\\u4f4f\\u5730\\u672c\\u5730\\uff08\\u7701\\u4efd\\uff09\\u5730\\u5740\\u5728\\u7535\\u5546\\u4e2d\\u4f7f\\u7528\\u65f6\\u957f\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740\"},{\"check_point\":\"ebusiness_info\",\"score\":0,\"check_point_cn\":\"\\u603b\\u4f53\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"person_ebusiness_info\",\"score\":0,\"check_point_cn\":\"\\u7533\\u8bf7\\u4eba\\u672c\\u4eba\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"virtual_buying\",\"score\":0,\"check_point_cn\":\"\\u865a\\u62df\\u5546\\u54c1\\u8d2d\\u4e70\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"lottery_buying\",\"score\":0,\"check_point_cn\":\"\\u5f69\\u7968\\u8d2d\\u4e70\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"person_addr_changed\",\"score\":0,\"check_point_cn\":\"\\u7533\\u8bf7\\u4eba\\u672c\\u4eba\\u5730\\u5740\\u53d8\\u5316\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"}],\"collection_contact\":[],\"ebusiness_expense\":[],\"contact_region\":[{\"region_loc\":\"\\u4e0a\\u6d77\",\"region_uniq_num_cnt\":64,\"region_call_out_time\":77.099999999999994,\"region_avg_call_in_time\":0.95999999999999996,\"region_call_in_time\":62.399999999999999,\"region_call_out_cnt\":37,\"region_avg_call_out_time\":2.0837837837837836,\"region_call_in_cnt_pct\":0.45454545454545453,\"region_call_in_time_pct\":0.32833464877663771,\"region_call_in_cnt\":65,\"region_call_out_time_pct\":0.34233700880633461,\"region_call_out_cnt_pct\":0.45121951219512196},{\"region_loc\":\"\\u5168\\u56fd\",\"region_uniq_num_cnt\":12,\"region_call_out_time\":22.083333333333332,\"region_avg_call_in_time\":0.77083333333333337,\"region_call_in_time\":6.166666666666667,\"region_call_out_cnt\":13,\"region_avg_call_out_time\":1.6987179487179487,\"region_call_in_cnt_pct\":0.055944055944055944,\"region_call_in_time_pct\":0.032447601508374987,\"region_call_in_cnt\":8,\"region_call_out_time_pct\":0.098053726041589573,\"region_call_out_cnt_pct\":0.15853658536585366},{\"region_loc\":\"\\u5317\\u4eac\",\"region_uniq_num_cnt\":7,\"region_call_out_time\":3.3666666666666667,\"region_avg_call_in_time\":0.8125,\"region_call_in_time\":6.5,\"region_call_out_cnt\":1,\"region_avg_call_out_time\":3.3666666666666667,\"region_call_in_cnt_pct\":0.055944055944055944,\"region_call_in_time_pct\":0.034201525914233095,\"region_call_in_cnt\":8,\"region_call_out_time_pct\":0.014948568045585732,\"region_call_out_cnt_pct\":0.012195121951219513},{\"region_loc\":\"\\u56db\\u5ddd\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.18333333333333332,\"region_call_in_time\":0.18333333333333332,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.006993006993006993,\"region_call_in_time_pct\":0.00096465842322195896,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u5929\\u6d25\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.69999999999999996,\"region_call_in_time\":0.69999999999999996,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.006993006993006993,\"region_call_in_time_pct\":0.0036832412523020255,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u5b89\\u5fbd\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":0.55000000000000004,\"region_avg_call_in_time\":0.34999999999999998,\"region_call_in_time\":0.34999999999999998,\"region_call_out_cnt\":1,\"region_avg_call_out_time\":0.55000000000000004,\"region_call_in_cnt_pct\":0.006993006993006993,\"region_call_in_time_pct\":0.0018416206261510127,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0.002442092799526382,\"region_call_out_cnt_pct\":0.012195121951219513},{\"region_loc\":\"\\u672a\\u77e5\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.66666666666666663,\"region_call_in_time\":0.66666666666666663,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.006993006993006993,\"region_call_in_time_pct\":0.0035078488117162147,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u6c5f\\u82cf\",\"region_uniq_num_cnt\":5,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.5,\"region_call_in_time\":2.5,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.034965034965034968,\"region_call_in_time_pct\":0.013154433043935805,\"region_call_in_cnt\":5,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u6cb3\\u5357\",\"region_uniq_num_cnt\":30,\"region_call_out_time\":120.5,\"region_avg_call_in_time\":2.3050724637681159,\"region_call_in_time\":106.03333333333333,\"region_call_out_cnt\":27,\"region_avg_call_out_time\":4.4629629629629628,\"region_call_in_cnt_pct\":0.32167832167832167,\"region_call_in_time_pct\":0.557923353503464,\"region_call_in_cnt\":46,\"region_call_out_time_pct\":0.53504033153259822,\"region_call_out_cnt_pct\":0.32926829268292684},{\"region_loc\":\"\\u6d59\\u6c5f\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":1.1333333333333333,\"region_avg_call_in_time\":0,\"region_call_in_time\":0,\"region_call_out_cnt\":1,\"region_avg_call_out_time\":1.1333333333333333,\"region_call_in_cnt_pct\":0,\"region_call_in_time_pct\":0,\"region_call_in_cnt\":0,\"region_call_out_time_pct\":0.0050321912232664835,\"region_call_out_cnt_pct\":0.012195121951219513},{\"region_loc\":\"\\u8d35\\u5dde\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.20555555555555557,\"region_call_in_time\":0.6166666666666667,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.02097902097902098,\"region_call_in_time_pct\":0.0032447601508374989,\"region_call_in_cnt\":3,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u8fd0\\u8425\\u5546\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0.48333333333333334,\"region_avg_call_in_time\":0,\"region_call_in_time\":0,\"region_call_out_cnt\":2,\"region_avg_call_out_time\":0.24166666666666667,\"region_call_in_cnt_pct\":0,\"region_call_in_time_pct\":0,\"region_call_in_cnt\":0,\"region_call_out_time_pct\":0.0021460815510989419,\"region_call_out_cnt_pct\":0.024390243902439025},{\"region_loc\":\"\\u91cd\\u5e86\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.45000000000000001,\"region_call_in_time\":0.45000000000000001,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.006993006993006993,\"region_call_in_time_pct\":0.0023677979479084449,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u9655\\u897f\",\"region_uniq_num_cnt\":3,\"region_call_out_time\":0,\"region_avg_call_in_time\":1.1611111111111112,\"region_call_in_time\":3.4833333333333334,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.02097902097902098,\"region_call_in_time_pct\":0.018328510041217223,\"region_call_in_cnt\":3,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0}],\"application_check\":[{\"check_points\":{\"key_value\":\"\\u674e\\u51b2\\u51b2\"},\"app_point\":\"user_name\"},{\"check_points\":{\"province\":\"\\u6cb3\\u5357\\u7701\",\"city\":\"\\u5546\\u4e18\\u5e02\",\"key_value\":\"411422199302283025\",\"gender\":\"\\u5973\",\"age\":25,\"financial_blacklist\":{\"arised\":false,\"black_type\":[]},\"court_blacklist\":{\"arised\":false,\"black_type\":[]},\"region\":\"\\u7762\\u53bf\"},\"app_point\":\"id_card\"},{\"check_points\":{\"website\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"check_ebusiness\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u53f7\\u7801\\u7684\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5(\\u65e0\\u7535\\u5546\\u6570\\u636e)\",\"key_value\":\"18236968869\",\"check_name\":\"\\u7528\\u6237\\u59d3\\u540d\\u4e0e\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u59d3\\u540d[\\u674e** ]\\u5339\\u914d\\u6210\\u529f\",\"reg_time\":\"2015-01-20 00:00:00\",\"financial_blacklist\":{\"arised\":false,\"black_type\":[]},\"reliability\":\"\\u5b9e\\u540d\\u8ba4\\u8bc1\",\"check_idcard\":\"\\u7528\\u6237\\u8eab\\u4efd\\u8bc1\\u53f7\\u4e0e\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u8eab\\u4efd\\u8bc1\\u53f7\\u7801[**************3025]\\u5339\\u914d\\u6210\\u529f\"},\"app_point\":\"cell_phone\"},{\"check_points\":{\"check_ebusiness\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u5c45\\u4f4f\\u5730\\u5740\\u7684\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5(\\u65e0\\u7535\\u5546\\u6570\\u636e)\",\"key_value\":\"\",\"check_addr\":\"\\u65e0\\u6cd5\\u5b9a\\u4f4d\\u5c45\\u4f4f\\u5730\\u5740(\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740)\"},\"app_point\":\"home_addr\"},{\"check_points\":{\"check_mobile\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u5bb6\\u5ead\\u7535\\u8bdd\\u7684\\u901a\\u8bdd\\u60c5\\u51b5(\\u65e0\\u5bb6\\u5ead\\u7535\\u8bdd)\",\"key_value\":\"\"},\"app_point\":\"home_phone\"}],\"deliver_address\":[],\"report\":{\"rpt_id\":\"201805011457330002\",\"token\":\"ed17ac21621a4ad6885ed207c86be0c7\",\"version\":\"4.2\",\"update_time\":\"2018-05-01T06:57:33.000Z\"},\"trip_info\":[{\"trip_dest\":\"\\u6cb3\\u5357\",\"trip_leave\":\"\\u4e0a\\u6d77\",\"trip_end_time\":\"2018-01-02\",\"trip_type\":\"\\u8282\\u5047\\u65e5\",\"trip_start_time\":\"2017-12-22\"},{\"trip_dest\":\"\\u6cb3\\u5357\",\"trip_leave\":\"\\u4e0a\\u6d77\",\"trip_end_time\":\"2018-02-27\",\"trip_type\":\"\\u8282\\u5047\\u65e5\",\"trip_start_time\":\"2018-02-13\"},{\"trip_dest\":\"\\u6d59\\u6c5f\",\"trip_leave\":\"\\u4e0a\\u6d77\",\"trip_end_time\":\"2018-03-10\",\"trip_type\":\"\\u53cc\\u4f11\\u65e5\",\"trip_start_time\":\"2018-03-10\"}],\"_id\":\"5ae80fe2d6755b1565d09c44\",\"cell_behavior\":[{\"phone_num\":\"18236968869\",\"behavior\":[{\"sms_cnt\":0,\"cell_phone_num\":\"18236968869\",\"net_flow\":52.1162109375,\"total_amount\":-1,\"call_out_time\":7.9833333333333334,\"cell_mth\":\"2018-05\",\"cell_loc\":\"\\u6cb3\\u5357\",\"call_cnt\":1,\"cell_operator_zh\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"call_out_cnt\":1,\"cell_operator\":\"chinamobileha\",\"call_in_time\":0,\"call_in_cnt\":0},{\"sms_cnt\":7,\"cell_phone_num\":\"18236968869\",\"net_flow\":1223.6279296875,\"total_amount\":80.450000000000003,\"call_out_time\":50.799999999999997,\"cell_mth\":\"2018-04\",\"cell_loc\":\"\\u6cb3\\u5357\",\"call_cnt\":37,\"cell_operator_zh\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"call_out_cnt\":8,\"cell_operator\":\"chinamobileha\",\"call_in_time\":28.333333333333332,\"call_in_cnt\":29},{\"sms_cnt\":19,\"cell_phone_num\":\"18236968869\",\"net_flow\":1142.44140625,\"total_amount\":106.54000000000001,\"call_out_time\":90.416666666666671,\"cell_mth\":\"2018-03\",\"cell_loc\":\"\\u6cb3\\u5357\",\"call_cnt\":96,\"cell_operator_zh\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"call_out_cnt\":47,\"cell_operator\":\"chinamobileha\",\"call_in_time\":93.433333333333337,\"call_in_cnt\":49},{\"sms_cnt\":8,\"cell_phone_num\":\"18236968869\",\"net_flow\":1356.306640625,\"total_amount\":73.200000000000003,\"call_out_time\":12.9,\"cell_mth\":\"2018-02\",\"cell_loc\":\"\\u6cb3\\u5357\",\"call_cnt\":29,\"cell_operator_zh\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"call_out_cnt\":13,\"cell_operator\":\"chinamobileha\",\"call_in_time\":15.449999999999999,\"call_in_cnt\":16},{\"sms_cnt\":23,\"cell_phone_num\":\"18236968869\",\"net_flow\":742.083984375,\"total_amount\":74.400000000000006,\"call_out_time\":8.0333333333333332,\"cell_mth\":\"2018-01\",\"cell_loc\":\"\\u6cb3\\u5357\",\"call_cnt\":30,\"cell_operator_zh\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"call_out_cnt\":6,\"cell_operator\":\"chinamobileha\",\"call_in_time\":40.350000000000001,\"call_in_cnt\":24},{\"sms_cnt\":5,\"cell_phone_num\":\"18236968869\",\"net_flow\":944.66796875,\"total_amount\":74.519999999999996,\"call_out_time\":55.083333333333336,\"cell_mth\":\"2017-12\",\"cell_loc\":\"\\u6cb3\\u5357\",\"call_cnt\":32,\"cell_operator_zh\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"call_out_cnt\":7,\"cell_operator\":\"chinamobileha\",\"call_in_time\":12.483333333333333,\"call_in_cnt\":25}]}]},\"success\":\"true\"}', '2018-05-01 14:59:02', '2018-05-01 14:59:02');
INSERT INTO `borrower_contact_info` VALUES ('136', '{\"note\":\"\",\"report_data\":{\"user_info_check\":{\"check_black_info\":{\"contacts_class1_blacklist_cnt\":0,\"contacts_router_ratio\":0.5,\"contacts_class2_blacklist_cnt\":6,\"contacts_router_cnt\":5,\"contacts_class1_cnt\":10,\"phone_gray_score\":62},\"check_search_info\":{\"arised_open_web\":[],\"phone_with_other_idcards\":[],\"idcard_with_other_phones\":[\"17621133265\",\"18221503642\"],\"register_org_cnt\":0,\"idcard_with_other_names\":[],\"searched_org_type\":[\"\\u5176\\u4ed6\"],\"searched_org_cnt\":1,\"register_org_type\":[],\"phone_with_other_names\":[]}},\"main_service\":[],\"behavior_check\":[{\"check_point\":\"regular_circle\",\"score\":0,\"check_point_cn\":\"\\u670b\\u53cb\\u5708\\u5728\\u54ea\\u91cc\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740\"},{\"check_point\":\"phone_used_time\",\"score\":1,\"check_point_cn\":\"\\u53f7\\u7801\\u4f7f\\u7528\\u65f6\\u95f4\",\"result\":\"\\u957f\\u671f\\u4f7f\\u7528(24\\u4e2a\\u6708\\u4ee5\\u4e0a\\uff0c\\u5305\\u542b24)\",\"evidence\":\"\\u6839\\u636e\\u53f7\\u7801[18339919633]\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u8ba4\\u8bc1\\u65f6\\u95f4,\\u63a8\\u7b97\\u8be5\\u53f7\\u7801\\u4f7f\\u752868\\u4e2a\\u6708\"},{\"check_point\":\"phone_silent\",\"score\":2,\"check_point_cn\":\"\\u624b\\u673a\\u9759\\u9ed8\\u60c5\\u51b5(\\u8fde\\u7eed24\\u5c0f\\u65f6\\u5185\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\\u8ba1\\u4e3a\\u9759\\u9ed8\\u4e00\\u5929)\",\"result\":\"149\\u5929\\u5185\\u670977\\u5929\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u6839\\u636e\\u8fd0\\u8425\\u5546\\u8be6\\u5355\\u6570\\u636e\\uff0c\\u8fde\\u7eed\\u4e09\\u5929\\u4ee5\\u4e0a\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f554\\u6b21: 2017-12-27 - 2017-12-29, 3\\u5929 \\/ 2018-01-01 - 2018-01-03, 3\\u5929 \\/ 2018-02-25 - 2018-02-28, 4\\u5929 \\/ 2018-04-16 - 2018-04-18, 3\\u5929\"},{\"check_point\":\"contact_each_other\",\"score\":1,\"check_point_cn\":\"\\u4e92\\u901a\\u8fc7\\u7535\\u8bdd\\u7684\\u53f7\\u7801\\u6570\\u91cf\",\"result\":\"\\u6570\\u91cf\\u6b63\\u5e38(10-100)\",\"evidence\":\"\\u4e92\\u901a\\u8fc7\\u7535\\u8bdd\\u7684\\u53f7\\u7801\\u670920\\u4e2a\\uff0c\\u6bd4\\u4f8b\\u4e3a23.81%\"},{\"check_point\":\"contact_macao\",\"score\":1,\"check_point_cn\":\"\\u6fb3\\u95e8\\u7535\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u6fb3\\u95e8\\u5730\\u533a\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_110\",\"score\":1,\"check_point_cn\":\"110\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e110\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_120\",\"score\":1,\"check_point_cn\":\"120\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e120\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_lawyer\",\"score\":1,\"check_point_cn\":\"\\u5f8b\\u5e08\\u53f7\\u7801\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e\\u5f8b\\u5e08\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_court\",\"score\":1,\"check_point_cn\":\"\\u6cd5\\u9662\\u53f7\\u7801\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e\\u6cd5\\u9662\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_night\",\"score\":1,\"check_point_cn\":\"\\u591c\\u95f4\\u6d3b\\u52a8\\u60c5\\u51b5(23\\u70b9-6\\u70b9)\",\"result\":\"\\u5076\\u5c14\\u591c\\u95f4\\u6d3b\\u52a8(\\u591c\\u95f4\\u901a\\u8bdd\\u6bd4\\u4f8b20%-50%\\uff0c \\u5305\\u542b20%)\",\"evidence\":\"\\u665a\\u95f4\\u6d3b\\u8dc3\\u9891\\u7387\\u5360\\u5168\\u5929\\u768422.66%\"},{\"check_point\":\"contact_loan\",\"score\":1,\"check_point_cn\":\"\\u8d37\\u6b3e\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u8be5\\u7c7b\\u53f7\\u7801\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u627e\\u5230\\u8d37\\u6b3e\\u7c7b\\u76f8\\u5173\\u53f7\\u7801\"},{\"check_point\":\"contact_bank\",\"score\":1,\"check_point_cn\":\"\\u94f6\\u884c\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u8be5\\u7c7b\\u53f7\\u7801\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u627e\\u5230\\u94f6\\u884c\\u7c7b\\u76f8\\u5173\\u53f7\\u7801\"},{\"check_point\":\"contact_credit_card\",\"score\":1,\"check_point_cn\":\"\\u4fe1\\u7528\\u5361\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u8be5\\u7c7b\\u53f7\\u7801\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u627e\\u5230\\u4fe1\\u7528\\u5361\\u7c7b\\u76f8\\u5173\\u53f7\\u7801\"},{\"check_point\":\"dwell_used_time\",\"score\":0,\"check_point_cn\":\"\\u5c45\\u4f4f\\u5730\\u672c\\u5730\\uff08\\u7701\\u4efd\\uff09\\u5730\\u5740\\u5728\\u7535\\u5546\\u4e2d\\u4f7f\\u7528\\u65f6\\u957f\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740\"},{\"check_point\":\"ebusiness_info\",\"score\":0,\"check_point_cn\":\"\\u603b\\u4f53\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"person_ebusiness_info\",\"score\":0,\"check_point_cn\":\"\\u7533\\u8bf7\\u4eba\\u672c\\u4eba\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"virtual_buying\",\"score\":0,\"check_point_cn\":\"\\u865a\\u62df\\u5546\\u54c1\\u8d2d\\u4e70\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"lottery_buying\",\"score\":0,\"check_point_cn\":\"\\u5f69\\u7968\\u8d2d\\u4e70\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"person_addr_changed\",\"score\":0,\"check_point_cn\":\"\\u7533\\u8bf7\\u4eba\\u672c\\u4eba\\u5730\\u5740\\u53d8\\u5316\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"}],\"collection_contact\":[],\"ebusiness_expense\":[],\"contact_region\":[{\"region_loc\":\"\\u4e0a\\u6d77\",\"region_uniq_num_cnt\":45,\"region_call_out_time\":77.25,\"region_avg_call_in_time\":1.7813888888888889,\"region_call_in_time\":106.88333333333334,\"region_call_out_cnt\":42,\"region_avg_call_out_time\":1.8392857142857142,\"region_call_in_cnt_pct\":0.34883720930232559,\"region_call_in_time_pct\":0.42532166069770527,\"region_call_in_cnt\":60,\"region_call_out_time_pct\":0.22926250185487462,\"region_call_out_cnt_pct\":0.2857142857142857},{\"region_loc\":\"\\u5168\\u56fd\",\"region_uniq_num_cnt\":4,\"region_call_out_time\":89,\"region_avg_call_in_time\":0.27500000000000002,\"region_call_in_time\":0.55000000000000004,\"region_call_out_cnt\":17,\"region_avg_call_out_time\":5.2352941176470589,\"region_call_in_cnt_pct\":0.011627906976744186,\"region_call_in_time_pct\":0.0021886191802626344,\"region_call_in_cnt\":2,\"region_call_out_time_pct\":0.26413414453182965,\"region_call_out_cnt_pct\":0.11564625850340136},{\"region_loc\":\"\\u5317\\u4eac\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":1.1499999999999999,\"region_avg_call_in_time\":0.59166666666666667,\"region_call_in_time\":1.1833333333333333,\"region_call_out_cnt\":2,\"region_avg_call_out_time\":0.57499999999999996,\"region_call_in_cnt_pct\":0.011627906976744186,\"region_call_in_time_pct\":0.0047088473272317282,\"region_call_in_cnt\":2,\"region_call_out_time_pct\":0.0034129692832764505,\"region_call_out_cnt_pct\":0.013605442176870748},{\"region_loc\":\"\\u6c5f\\u82cf\",\"region_uniq_num_cnt\":3,\"region_call_out_time\":1.25,\"region_avg_call_in_time\":0.23333333333333334,\"region_call_in_time\":0.46666666666666667,\"region_call_out_cnt\":1,\"region_avg_call_out_time\":1.25,\"region_call_in_cnt_pct\":0.011627906976744186,\"region_call_in_time_pct\":0.0018570102135561746,\"region_call_in_cnt\":2,\"region_call_out_time_pct\":0.0037097492209526638,\"region_call_out_cnt_pct\":0.0068027210884353739},{\"region_loc\":\"\\u6cb3\\u5357\",\"region_uniq_num_cnt\":26,\"region_call_out_time\":167.40000000000001,\"region_avg_call_in_time\":1.366504854368932,\"region_call_in_time\":140.75,\"region_call_out_cnt\":84,\"region_avg_call_out_time\":1.9928571428571429,\"region_call_in_cnt_pct\":0.59883720930232553,\"region_call_in_time_pct\":0.56008754476721045,\"region_call_in_cnt\":103,\"region_call_out_time_pct\":0.49680961566998072,\"region_call_out_cnt_pct\":0.5714285714285714},{\"region_loc\":\"\\u6d59\\u6c5f\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":0.90000000000000002,\"region_avg_call_in_time\":0.45000000000000001,\"region_call_in_time\":0.45000000000000001,\"region_call_out_cnt\":1,\"region_avg_call_out_time\":0.90000000000000002,\"region_call_in_cnt_pct\":0.0058139534883720929,\"region_call_in_time_pct\":0.0017906884202148826,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0.002671019439085918,\"region_call_out_cnt_pct\":0.0068027210884353739},{\"region_loc\":\"\\u8fd0\\u8425\\u5546\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.48333333333333334,\"region_call_in_time\":0.48333333333333334,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.0058139534883720929,\"region_call_in_time_pct\":0.0019233320068974664,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u9655\\u897f\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.53333333333333333,\"region_call_in_time\":0.53333333333333333,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.0058139534883720929,\"region_call_in_time_pct\":0.0021222973869213422,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0}],\"application_check\":[{\"check_points\":{\"key_value\":\"\\u67f3\\u6052\\u535a\"},\"app_point\":\"user_name\"},{\"check_points\":{\"province\":\"\\u6cb3\\u5357\\u7701\",\"city\":\"\\u5e73\\u9876\\u5c71\\u5e02\",\"key_value\":\"410421199310091018\",\"gender\":\"\\u7537\",\"age\":24,\"financial_blacklist\":{\"arised\":false,\"black_type\":[]},\"court_blacklist\":{\"arised\":false,\"black_type\":[]},\"region\":\"\\u5b9d\\u4e30\\u53bf\"},\"app_point\":\"id_card\"},{\"check_points\":{\"website\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"check_ebusiness\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u53f7\\u7801\\u7684\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5(\\u65e0\\u7535\\u5546\\u6570\\u636e)\",\"key_value\":\"18339919633\",\"check_name\":\"\\u7528\\u6237\\u59d3\\u540d\\u4e0e\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u59d3\\u540d[\\u67f3** ]\\u5339\\u914d\\u6210\\u529f\",\"reg_time\":\"2012-09-15 00:00:00\",\"financial_blacklist\":{\"arised\":false,\"black_type\":[]},\"reliability\":\"\\u5b9e\\u540d\\u8ba4\\u8bc1\",\"check_idcard\":\"\\u7528\\u6237\\u8eab\\u4efd\\u8bc1\\u53f7\\u4e0e\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u8eab\\u4efd\\u8bc1\\u53f7\\u7801[**************1018]\\u5339\\u914d\\u6210\\u529f\"},\"app_point\":\"cell_phone\"},{\"check_points\":{\"check_ebusiness\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u5c45\\u4f4f\\u5730\\u5740\\u7684\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5(\\u65e0\\u7535\\u5546\\u6570\\u636e)\",\"key_value\":\"\",\"check_addr\":\"\\u65e0\\u6cd5\\u5b9a\\u4f4d\\u5c45\\u4f4f\\u5730\\u5740(\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740)\"},\"app_point\":\"home_addr\"},{\"check_points\":{\"check_mobile\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u5bb6\\u5ead\\u7535\\u8bdd\\u7684\\u901a\\u8bdd\\u60c5\\u51b5(\\u65e0\\u5bb6\\u5ead\\u7535\\u8bdd)\",\"key_value\":\"\"},\"app_point\":\"home_phone\"}],\"deliver_address\":[],\"report\":{\"rpt_id\":\"201805011508450001\",\"token\":\"061938bb6b4b45a6abc0a5e627db8baa\",\"version\":\"4.2\",\"update_time\":\"2018-05-01T07:08:45.000Z\"},\"trip_info\":[{\"trip_dest\":\"\\u6cb3\\u5357\",\"trip_leave\":\"\\u4e0a\\u6d77\",\"trip_end_time\":\"2018-02-21\",\"trip_type\":\"\\u8282\\u5047\\u65e5\",\"trip_start_time\":\"2018-02-09\"},{\"trip_dest\":\"\\u6c5f\\u82cf\",\"trip_leave\":\"\\u4e0a\\u6d77\",\"trip_end_time\":\"2018-03-25\",\"trip_type\":\"\\u53cc\\u4f11\\u65e5\",\"trip_start_time\":\"2018-03-25\"},{\"trip_dest\":\"\\u6c5f\\u82cf\",\"trip_leave\":\"\\u4e0a\\u6d77\",\"trip_end_time\":\"2018-04-07\",\"trip_type\":\"\\u8282\\u5047\\u65e5\",\"trip_start_time\":\"2018-04-05\"}],\"_id\":\"5ae812811c32372b5abe4a28\",\"cell_behavior\":[{\"phone_num\":\"18339919633\",\"behavior\":[{\"sms_cnt\":0,\"cell_phone_num\":\"18339919633\",\"net_flow\":52.3720703125,\"total_amount\":-1,\"call_out_time\":0,\"cell_mth\":\"2018-05\",\"cell_loc\":\"\\u6cb3\\u5357\",\"call_cnt\":2,\"cell_operator_zh\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"call_out_cnt\":0,\"cell_operator\":\"chinamobileha\",\"call_in_time\":4.0999999999999996,\"call_in_cnt\":2},{\"sms_cnt\":13,\"cell_phone_num\":\"18339919633\",\"net_flow\":1153.4873046875,\"total_amount\":70,\"call_out_time\":33.633333333333333,\"cell_mth\":\"2018-04\",\"cell_loc\":\"\\u6cb3\\u5357\",\"call_cnt\":59,\"cell_operator_zh\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"call_out_cnt\":30,\"cell_operator\":\"chinamobileha\",\"call_in_time\":54.950000000000003,\"call_in_cnt\":29},{\"sms_cnt\":10,\"cell_phone_num\":\"18339919633\",\"net_flow\":765.328125,\"total_amount\":70,\"call_out_time\":46.366666666666667,\"cell_mth\":\"2018-03\",\"cell_loc\":\"\\u6cb3\\u5357\",\"call_cnt\":47,\"cell_operator_zh\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"call_out_cnt\":13,\"cell_operator\":\"chinamobileha\",\"call_in_time\":45.216666666666669,\"call_in_cnt\":34},{\"sms_cnt\":14,\"cell_phone_num\":\"18339919633\",\"net_flow\":1425.669921875,\"total_amount\":70,\"call_out_time\":43.200000000000003,\"cell_mth\":\"2018-02\",\"cell_loc\":\"\\u6cb3\\u5357\",\"call_cnt\":87,\"cell_operator_zh\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"call_out_cnt\":40,\"cell_operator\":\"chinamobileha\",\"call_in_time\":40.166666666666664,\"call_in_cnt\":47},{\"sms_cnt\":14,\"cell_phone_num\":\"18339919633\",\"net_flow\":945.08984375,\"total_amount\":70,\"call_out_time\":54.033333333333331,\"cell_mth\":\"2018-01\",\"cell_loc\":\"\\u6cb3\\u5357\",\"call_cnt\":32,\"cell_operator_zh\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"call_out_cnt\":14,\"cell_operator\":\"chinamobileha\",\"call_in_time\":41.516666666666666,\"call_in_cnt\":18},{\"sms_cnt\":11,\"cell_phone_num\":\"18339919633\",\"net_flow\":1047.85546875,\"total_amount\":90.530000000000001,\"call_out_time\":159.71666666666667,\"cell_mth\":\"2017-12\",\"cell_loc\":\"\\u6cb3\\u5357\",\"call_cnt\":92,\"cell_operator_zh\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"call_out_cnt\":50,\"cell_operator\":\"chinamobileha\",\"call_in_time\":65.349999999999994,\"call_in_cnt\":42}]}]},\"success\":\"true\"}', '2018-05-01 15:10:11', '2018-05-01 15:10:11');
INSERT INTO `borrower_contact_info` VALUES ('187', '{\"note\":\"\",\"report_data\":{\"user_info_check\":{\"check_black_info\":{\"contacts_class1_blacklist_cnt\":0,\"contacts_router_ratio\":0.3793103448275862,\"contacts_class2_blacklist_cnt\":36,\"contacts_router_cnt\":11,\"contacts_class1_cnt\":29,\"phone_gray_score\":58},\"check_search_info\":{\"arised_open_web\":[],\"phone_with_other_idcards\":[],\"idcard_with_other_phones\":[],\"register_org_cnt\":0,\"idcard_with_other_names\":[],\"searched_org_type\":[\"\\u7ebf\\u4e0a\\u6d88\\u8d39\\u5206\\u671f\",\"\\u5176\\u4ed6\"],\"searched_org_cnt\":2,\"register_org_type\":[],\"phone_with_other_names\":[]}},\"main_service\":[{\"service_details\":[{\"interact_cnt\":0,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":1,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-04\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-05\"}],\"total_service_cnt\":1,\"company_type\":\"\\u94f6\\u884c\",\"company_name\":\"\\u4e2d\\u4fe1\\u4fe1\\u7528\\u5361\"},{\"service_details\":[{\"interact_cnt\":0,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":1,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":3,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-04\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-05\"}],\"total_service_cnt\":4,\"company_type\":\"\\u8fd0\\u8425\\u5546\",\"company_name\":\"\\u4e2d\\u56fd\\u79fb\\u52a8\\u5ba2\\u670d\\u70ed\\u7ebf\"},{\"service_details\":[{\"interact_cnt\":0,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":1,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":1,\"interact_mth\":\"2018-04\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-05\"}],\"total_service_cnt\":2,\"company_type\":\"\\u94f6\\u884c\",\"company_name\":\"\\u4ea4\\u901a\\u94f6\\u884c\"},{\"service_details\":[{\"interact_cnt\":0,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":1,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-04\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-05\"}],\"total_service_cnt\":1,\"company_type\":\"\\u623f\\u5730\\u4ea7\",\"company_name\":\"\\u4fde\\u4e09\\u59b9(\\u5e97\\u94fa)\"},{\"service_details\":[{\"interact_cnt\":0,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":6,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-04\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-05\"}],\"total_service_cnt\":6,\"company_type\":\"\\u94f6\\u884c\",\"company_name\":\"\\u6c11\\u751f\\u4fe1\\u7528\\u5361\"},{\"service_details\":[{\"interact_cnt\":0,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":1,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-04\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-05\"}],\"total_service_cnt\":1,\"company_type\":\"\\u94f6\\u884c\",\"company_name\":\"\\u6c11\\u751f\\u94f6\\u884c\"}],\"behavior_check\":[{\"check_point\":\"regular_circle\",\"score\":0,\"check_point_cn\":\"\\u670b\\u53cb\\u5708\\u5728\\u54ea\\u91cc\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740\"},{\"check_point\":\"phone_used_time\",\"score\":1,\"check_point_cn\":\"\\u53f7\\u7801\\u4f7f\\u7528\\u65f6\\u95f4\",\"result\":\"\\u957f\\u671f\\u4f7f\\u7528(24\\u4e2a\\u6708\\u4ee5\\u4e0a\\uff0c\\u5305\\u542b24)\",\"evidence\":\"\\u6839\\u636e\\u53f7\\u7801[18236968869]\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u8ba4\\u8bc1\\u65f6\\u95f4,\\u63a8\\u7b97\\u8be5\\u53f7\\u7801\\u4f7f\\u752841\\u4e2a\\u6708\"},{\"check_point\":\"phone_silent\",\"score\":2,\"check_point_cn\":\"\\u624b\\u673a\\u9759\\u9ed8\\u60c5\\u51b5(\\u8fde\\u7eed24\\u5c0f\\u65f6\\u5185\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\\u8ba1\\u4e3a\\u9759\\u9ed8\\u4e00\\u5929)\",\"result\":\"176\\u5929\\u5185\\u6709101\\u5929\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u6839\\u636e\\u8fd0\\u8425\\u5546\\u8be6\\u5355\\u6570\\u636e\\uff0c\\u8fde\\u7eed\\u4e09\\u5929\\u4ee5\\u4e0a\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f5511\\u6b21: 2017-12-20 - 2017-12-22, 3\\u5929 \\/ 2017-12-24 - 2017-12-26, 3\\u5929 \\/ 2017-12-28 - 2017-12-30, 3\\u5929 \\/ 2018-01-04 - 2018-01-07, 4\\u5929 \\/ 2018-01-18 - 2018-01-21, 4\\u5929 \\/ 2018-01-31 - 2018-02-02, 3\\u5929 \\/ 2018-02-05 - 2018-02-07, 3\\u5929 \\/ 2018-02-09 - 2018-02-12, 4\\u5929 \\/ 2018-02-21 - 2018-02-23, 3\\u5929 \\/ 2018-03-01 - 2018-03-06, 6\\u5929 \\/ 2018-04-06 - 2018-04-09, 4\\u5929\"},{\"check_point\":\"contact_each_other\",\"score\":1,\"check_point_cn\":\"\\u4e92\\u901a\\u8fc7\\u7535\\u8bdd\\u7684\\u53f7\\u7801\\u6570\\u91cf\",\"result\":\"\\u6570\\u91cf\\u6b63\\u5e38(10-100)\",\"evidence\":\"\\u4e92\\u901a\\u8fc7\\u7535\\u8bdd\\u7684\\u53f7\\u7801\\u670912\\u4e2a\\uff0c\\u6bd4\\u4f8b\\u4e3a8.16%\"},{\"check_point\":\"contact_macao\",\"score\":1,\"check_point_cn\":\"\\u6fb3\\u95e8\\u7535\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u6fb3\\u95e8\\u5730\\u533a\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_110\",\"score\":1,\"check_point_cn\":\"110\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e110\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_120\",\"score\":1,\"check_point_cn\":\"120\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e120\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_lawyer\",\"score\":1,\"check_point_cn\":\"\\u5f8b\\u5e08\\u53f7\\u7801\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e\\u5f8b\\u5e08\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_court\",\"score\":1,\"check_point_cn\":\"\\u6cd5\\u9662\\u53f7\\u7801\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e\\u6cd5\\u9662\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_night\",\"score\":1,\"check_point_cn\":\"\\u591c\\u95f4\\u6d3b\\u52a8\\u60c5\\u51b5(23\\u70b9-6\\u70b9)\",\"result\":\"\\u5f88\\u5c11\\u591c\\u95f4\\u6d3b\\u52a8(\\u591c\\u95f4\\u901a\\u8bdd\\u6bd4\\u4f8b\\u4f4e\\u4e8e20%)\",\"evidence\":\"\\u665a\\u95f4\\u6d3b\\u8dc3\\u9891\\u7387\\u5360\\u5168\\u5929\\u76847.79%\"},{\"check_point\":\"contact_loan\",\"score\":1,\"check_point_cn\":\"\\u8d37\\u6b3e\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u5f88\\u5c11\\u88ab\\u8054\\u7cfb(\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u5185\\uff0c\\u6216\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u4e0a\\u4e14\\u4e3b\\u52a8\\u547c\\u53eb\\u5360\\u6bd4\\u4f4e\\u4e8e20%)\",\"evidence\":\"\\u8054\\u7cfb\\u5217\\u8868:[\\u6c11\\u751f\\u94f6\\u884c\\u4fe1\\u7528\\u5361]\\u4e3b\\u53eb3\\u6b21\\u51717.92\\u5206\\u949f\\uff0c\\u88ab\\u53eb0\\u6b21\\u51710.0\\u5206\\u949f\"},{\"check_point\":\"contact_bank\",\"score\":2,\"check_point_cn\":\"\\u94f6\\u884c\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u5076\\u5c14\\u88ab\\u8054\\u7cfb(\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u4e0a\\uff0c\\u5305\\u542b5\\u6b21\\uff0c\\u4e14\\u4e3b\\u52a8\\u547c\\u53eb\\u5360\\u6bd4 20%-50%\\u4e4b\\u95f4\\uff0c\\u5305\\u542b20%)\",\"evidence\":\"\\u8054\\u7cfb\\u5217\\u8868:[\\u4ea4\\u901a\\u94f6\\u884c\\u5ba2\\u670d\\u7535\\u8bdd]\\u4e3b\\u53eb0\\u6b21\\u51710.0\\u5206\\u949f\\uff0c\\u88ab\\u53eb1\\u6b21\\u51712.33\\u5206\\u949f;[\\u5de5\\u5546\\u94f6\\u884c\\u5ba2\\u670d\\u7535\\u8bdd]\\u4e3b\\u53eb3\\u6b21\\u51713.08\\u5206\\u949f\\uff0c\\u88ab\\u53eb0\\u6b21\\u51710.0\\u5206\\u949f;[\\u6c11\\u751f\\u94f6\\u884c\\u5ba2\\u670d\\u7535\\u8bdd]\\u4e3b\\u53eb0\\u6b21\\u51710.0\\u5206\\u949f\\uff0c\\u88ab\\u53eb1\\u6b21\\u51711.05\\u5206\\u949f\"},{\"check_point\":\"contact_credit_card\",\"score\":1,\"check_point_cn\":\"\\u4fe1\\u7528\\u5361\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u5f88\\u5c11\\u88ab\\u8054\\u7cfb(\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u5185\\uff0c\\u6216\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u4e0a\\u4e14\\u4e3b\\u52a8\\u547c\\u53eb\\u5360\\u6bd4\\u4f4e\\u4e8e20%)\",\"evidence\":\"\\u8054\\u7cfb\\u5217\\u8868:[\\u4ea4\\u901a\\u94f6\\u884c\\u4fe1\\u7528\\u5361\\u70ed\\u7ebf]\\u4e3b\\u53eb2\\u6b21\\u51714.82\\u5206\\u949f\\uff0c\\u88ab\\u53eb0\\u6b21\\u51710.0\\u5206\\u949f;[\\u534e\\u590f\\u94f6\\u884c\\u4fe1\\u7528\\u5361\\u70ed\\u7ebf]\\u4e3b\\u53eb2\\u6b21\\u51712.48\\u5206\\u949f\\uff0c\\u88ab\\u53eb0\\u6b21\\u51710.0\\u5206\\u949f\"},{\"check_point\":\"dwell_used_time\",\"score\":0,\"check_point_cn\":\"\\u5c45\\u4f4f\\u5730\\u672c\\u5730\\uff08\\u7701\\u4efd\\uff09\\u5730\\u5740\\u5728\\u7535\\u5546\\u4e2d\\u4f7f\\u7528\\u65f6\\u957f\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740\"},{\"check_point\":\"ebusiness_info\",\"score\":0,\"check_point_cn\":\"\\u603b\\u4f53\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"person_ebusiness_info\",\"score\":0,\"check_point_cn\":\"\\u7533\\u8bf7\\u4eba\\u672c\\u4eba\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"virtual_buying\",\"score\":0,\"check_point_cn\":\"\\u865a\\u62df\\u5546\\u54c1\\u8d2d\\u4e70\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"lottery_buying\",\"score\":0,\"check_point_cn\":\"\\u5f69\\u7968\\u8d2d\\u4e70\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"person_addr_changed\",\"score\":0,\"check_point_cn\":\"\\u7533\\u8bf7\\u4eba\\u672c\\u4eba\\u5730\\u5740\\u53d8\\u5316\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"}],\"collection_contact\":[],\"ebusiness_expense\":[],\"contact_region\":[{\"region_loc\":\"\\u4e0a\\u6d77\",\"region_uniq_num_cnt\":72,\"region_call_out_time\":87.53333333333333,\"region_avg_call_in_time\":0.9380341880341881,\"region_call_in_time\":73.16666666666667,\"region_call_out_cnt\":42,\"region_avg_call_out_time\":2.0841269841269843,\"region_call_in_cnt_pct\":0.4642857142857143,\"region_call_in_time_pct\":0.33539613415845365,\"region_call_in_cnt\":78,\"region_call_out_time_pct\":0.2994981751824818,\"region_call_out_cnt_pct\":0.4421052631578947},{\"region_loc\":\"\\u4e91\\u5357\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.44166666666666665,\"region_call_in_time\":1.7666666666666666,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.023809523809523808,\"region_call_in_time_pct\":0.008098403239361295,\"region_call_in_cnt\":4,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u5168\\u56fd\",\"region_uniq_num_cnt\":13,\"region_call_out_time\":26.966666666666665,\"region_avg_call_in_time\":0.7222222222222222,\"region_call_in_time\":6.5,\"region_call_out_cnt\":17,\"region_avg_call_out_time\":1.5862745098039215,\"region_call_in_cnt_pct\":0.05357142857142857,\"region_call_in_time_pct\":0.029796011918404766,\"region_call_in_cnt\":9,\"region_call_out_time_pct\":0.09226733576642336,\"region_call_out_cnt_pct\":0.17894736842105263},{\"region_loc\":\"\\u5317\\u4eac\",\"region_uniq_num_cnt\":9,\"region_call_out_time\":3.3666666666666667,\"region_avg_call_in_time\":0.7516666666666667,\"region_call_in_time\":7.516666666666667,\"region_call_out_cnt\":1,\"region_avg_call_out_time\":3.3666666666666667,\"region_call_in_cnt_pct\":0.05952380952380952,\"region_call_in_time_pct\":0.03445641378256551,\"region_call_in_cnt\":10,\"region_call_out_time_pct\":0.011519160583941607,\"region_call_out_cnt_pct\":0.010526315789473684},{\"region_loc\":\"\\u56db\\u5ddd\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.18333333333333332,\"region_call_in_time\":0.18333333333333332,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.005952380952380952,\"region_call_in_time_pct\":0.0008404003361601344,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u5929\\u6d25\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.7,\"region_call_in_time\":0.7,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.005952380952380952,\"region_call_in_time_pct\":0.0032088012835205133,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u5b89\\u5fbd\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":0.55,\"region_avg_call_in_time\":0.35,\"region_call_in_time\":0.35,\"region_call_out_cnt\":1,\"region_avg_call_out_time\":0.55,\"region_call_in_cnt_pct\":0.005952380952380952,\"region_call_in_time_pct\":0.0016044006417602567,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0.001881843065693431,\"region_call_out_cnt_pct\":0.010526315789473684},{\"region_loc\":\"\\u672a\\u77e5\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.6666666666666666,\"region_call_in_time\":0.6666666666666666,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.005952380952380952,\"region_call_in_time_pct\":0.0030560012224004887,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u6c5f\\u82cf\",\"region_uniq_num_cnt\":6,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.4611111111111111,\"region_call_in_time\":2.7666666666666666,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.03571428571428571,\"region_call_in_time_pct\":0.012682405072962028,\"region_call_in_cnt\":6,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u6cb3\\u5357\",\"region_uniq_num_cnt\":32,\"region_call_out_time\":172.23333333333332,\"region_avg_call_in_time\":2.3996666666666666,\"region_call_in_time\":119.98333333333333,\"region_call_out_cnt\":31,\"region_avg_call_out_time\":5.555913978494623,\"region_call_in_cnt_pct\":0.2976190476190476,\"region_call_in_time_pct\":0.550003820001528,\"region_call_in_cnt\":50,\"region_call_out_time_pct\":0.5893020072992701,\"region_call_out_cnt_pct\":0.3263157894736842},{\"region_loc\":\"\\u6d59\\u6c5f\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":1.1333333333333333,\"region_avg_call_in_time\":0,\"region_call_in_time\":0,\"region_call_out_cnt\":1,\"region_avg_call_out_time\":1.1333333333333333,\"region_call_in_cnt_pct\":0,\"region_call_in_time_pct\":0,\"region_call_in_cnt\":0,\"region_call_out_time_pct\":0.0038777372262773723,\"region_call_out_cnt_pct\":0.010526315789473684},{\"region_loc\":\"\\u8d35\\u5dde\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.20555555555555557,\"region_call_in_time\":0.6166666666666667,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.017857142857142856,\"region_call_in_time_pct\":0.002826801130720452,\"region_call_in_cnt\":3,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u8fd0\\u8425\\u5546\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0.48333333333333334,\"region_avg_call_in_time\":0,\"region_call_in_time\":0,\"region_call_out_cnt\":2,\"region_avg_call_out_time\":0.24166666666666667,\"region_call_in_cnt_pct\":0,\"region_call_in_time_pct\":0,\"region_call_in_cnt\":0,\"region_call_out_time_pct\":0.001653740875912409,\"region_call_out_cnt_pct\":0.021052631578947368},{\"region_loc\":\"\\u91cd\\u5e86\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.45,\"region_call_in_time\":0.45,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.005952380952380952,\"region_call_in_time_pct\":0.00206280082512033,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u9655\\u897f\",\"region_uniq_num_cnt\":3,\"region_call_out_time\":0,\"region_avg_call_in_time\":1.1611111111111112,\"region_call_in_time\":3.4833333333333334,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.017857142857142856,\"region_call_in_time_pct\":0.015967606387042553,\"region_call_in_cnt\":3,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0}],\"application_check\":[{\"check_points\":{\"key_value\":\"\\u674e\\u51b2\\u51b2\"},\"app_point\":\"user_name\"},{\"check_points\":{\"province\":\"\\u6cb3\\u5357\\u7701\",\"city\":\"\\u5546\\u4e18\\u5e02\",\"key_value\":\"411422199302283025\",\"gender\":\"\\u5973\",\"age\":25,\"financial_blacklist\":{\"arised\":false,\"black_type\":[]},\"court_blacklist\":{\"arised\":false,\"black_type\":[]},\"region\":\"\\u7762\\u53bf\"},\"app_point\":\"id_card\"},{\"check_points\":{\"website\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"check_ebusiness\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u53f7\\u7801\\u7684\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5(\\u65e0\\u7535\\u5546\\u6570\\u636e)\",\"key_value\":\"18236968869\",\"check_name\":\"\\u7528\\u6237\\u59d3\\u540d\\u4e0e\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u59d3\\u540d[\\u674e** ]\\u5339\\u914d\\u6210\\u529f\",\"reg_time\":\"2015-01-20 00:00:00\",\"financial_blacklist\":{\"arised\":false,\"black_type\":[]},\"reliability\":\"\\u5b9e\\u540d\\u8ba4\\u8bc1\",\"check_idcard\":\"\\u7528\\u6237\\u8eab\\u4efd\\u8bc1\\u53f7\\u4e0e\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u8eab\\u4efd\\u8bc1\\u53f7\\u7801[**************3025]\\u5339\\u914d\\u6210\\u529f\"},\"app_point\":\"cell_phone\"},{\"check_points\":{\"check_ebusiness\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u5c45\\u4f4f\\u5730\\u5740\\u7684\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5(\\u65e0\\u7535\\u5546\\u6570\\u636e)\",\"key_value\":\"\",\"check_addr\":\"\\u65e0\\u6cd5\\u5b9a\\u4f4d\\u5c45\\u4f4f\\u5730\\u5740(\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740)\"},\"app_point\":\"home_addr\"},{\"check_points\":{\"check_mobile\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u5bb6\\u5ead\\u7535\\u8bdd\\u7684\\u901a\\u8bdd\\u60c5\\u51b5(\\u65e0\\u5bb6\\u5ead\\u7535\\u8bdd)\",\"key_value\":\"\"},\"app_point\":\"home_phone\"}],\"deliver_address\":[],\"report\":{\"rpt_id\":\"201805281624540003\",\"token\":\"4d3f4be8587b4f59b295bf71dfb23a1c\",\"version\":\"4.2\",\"update_time\":\"2018-05-28T08:24:54.000Z\"},\"trip_info\":[{\"trip_dest\":\"\\u6cb3\\u5357\",\"trip_leave\":\"\\u4e0a\\u6d77\",\"trip_end_time\":\"2018-01-02\",\"trip_type\":\"\\u8282\\u5047\\u65e5\",\"trip_start_time\":\"2017-12-22\"},{\"trip_dest\":\"\\u6cb3\\u5357\",\"trip_leave\":\"\\u4e0a\\u6d77\",\"trip_end_time\":\"2018-02-27\",\"trip_type\":\"\\u8282\\u5047\\u65e5\",\"trip_start_time\":\"2018-02-13\"},{\"trip_dest\":\"\\u6d59\\u6c5f\",\"trip_leave\":\"\\u4e0a\\u6d77\",\"trip_end_time\":\"2018-03-10\",\"trip_type\":\"\\u53cc\\u4f11\\u65e5\",\"trip_start_time\":\"2018-03-10\"},{\"trip_dest\":\"\\u6c5f\\u82cf\",\"trip_leave\":\"\\u4e0a\\u6d77\",\"trip_end_time\":\"2018-05-12\",\"trip_type\":\"\\u53cc\\u4f11\\u65e5\",\"trip_start_time\":\"2018-05-11\"}],\"_id\":\"5b0bbcdd4a790169e5ae6a33\",\"cell_behavior\":[{\"phone_num\":\"18236968869\",\"behavior\":[{\"sms_cnt\":5,\"cell_phone_num\":\"18236968869\",\"net_flow\":986.154296875,\"total_amount\":-1,\"call_out_time\":75.03333333333333,\"cell_mth\":\"2018-05\",\"cell_loc\":\"\\u6cb3\\u5357\",\"call_cnt\":39,\"cell_operator_zh\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"call_out_cnt\":14,\"cell_operator\":\"chinamobileha\",\"call_in_time\":28.1,\"call_in_cnt\":25},{\"sms_cnt\":7,\"cell_phone_num\":\"18236968869\",\"net_flow\":1223.6279296875,\"total_amount\":80.45,\"call_out_time\":50.8,\"cell_mth\":\"2018-04\",\"cell_loc\":\"\\u6cb3\\u5357\",\"call_cnt\":37,\"cell_operator_zh\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"call_out_cnt\":8,\"cell_operator\":\"chinamobileha\",\"call_in_time\":28.333333333333332,\"call_in_cnt\":29},{\"sms_cnt\":19,\"cell_phone_num\":\"18236968869\",\"net_flow\":1142.44140625,\"total_amount\":106.54,\"call_out_time\":90.41666666666667,\"cell_mth\":\"2018-03\",\"cell_loc\":\"\\u6cb3\\u5357\",\"call_cnt\":96,\"cell_operator_zh\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"call_out_cnt\":47,\"cell_operator\":\"chinamobileha\",\"call_in_time\":93.43333333333334,\"call_in_cnt\":49},{\"sms_cnt\":8,\"cell_phone_num\":\"18236968869\",\"net_flow\":1356.306640625,\"total_amount\":73.2,\"call_out_time\":12.9,\"cell_mth\":\"2018-02\",\"cell_loc\":\"\\u6cb3\\u5357\",\"call_cnt\":29,\"cell_operator_zh\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"call_out_cnt\":13,\"cell_operator\":\"chinamobileha\",\"call_in_time\":15.45,\"call_in_cnt\":16},{\"sms_cnt\":23,\"cell_phone_num\":\"18236968869\",\"net_flow\":742.083984375,\"total_amount\":74.4,\"call_out_time\":8.033333333333333,\"cell_mth\":\"2018-01\",\"cell_loc\":\"\\u6cb3\\u5357\",\"call_cnt\":30,\"cell_operator_zh\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"call_out_cnt\":6,\"cell_operator\":\"chinamobileha\",\"call_in_time\":40.35,\"call_in_cnt\":24},{\"sms_cnt\":5,\"cell_phone_num\":\"18236968869\",\"net_flow\":944.66796875,\"total_amount\":74.52,\"call_out_time\":55.083333333333336,\"cell_mth\":\"2017-12\",\"cell_loc\":\"\\u6cb3\\u5357\",\"call_cnt\":32,\"cell_operator_zh\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"call_out_cnt\":7,\"cell_operator\":\"chinamobileha\",\"call_in_time\":12.483333333333333,\"call_in_cnt\":25}]}]},\"success\":\"true\"}', '2018-05-28 16:26:21', '2018-05-28 16:26:21');
INSERT INTO `borrower_contact_info` VALUES ('225', '{\"note\":\"\",\"report_data\":{\"user_info_check\":{\"check_black_info\":{\"contacts_class1_blacklist_cnt\":0,\"contacts_router_ratio\":0.3333333333333333,\"contacts_class2_blacklist_cnt\":21,\"contacts_router_cnt\":1,\"contacts_class1_cnt\":3,\"phone_gray_score\":65},\"check_search_info\":{\"arised_open_web\":[],\"phone_with_other_idcards\":[],\"idcard_with_other_phones\":[],\"register_org_cnt\":0,\"idcard_with_other_names\":[],\"searched_org_type\":[\"\\u7ebf\\u4e0a\\u6d88\\u8d39\\u5206\\u671f\",\"\\u5176\\u4ed6\"],\"searched_org_cnt\":2,\"register_org_type\":[],\"phone_with_other_names\":[]}},\"main_service\":[{\"service_details\":[{\"interact_cnt\":0,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":2,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-04\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-05\"}],\"total_service_cnt\":2,\"company_type\":\"\\u5176\\u5b83\",\"company_name\":\"\\u2014\"},{\"service_details\":[{\"interact_cnt\":1,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-04\"},{\"interact_cnt\":1,\"interact_mth\":\"2018-05\"}],\"total_service_cnt\":2,\"company_type\":\"\\u8fd0\\u8425\\u5546\",\"company_name\":\"\\u4e2d\\u56fd\\u79fb\\u52a8\"},{\"service_details\":[{\"interact_cnt\":0,\"interact_mth\":\"2017-12\"},{\"interact_cnt\":3,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-04\"},{\"interact_cnt\":1,\"interact_mth\":\"2018-05\"}],\"total_service_cnt\":4,\"company_type\":\"\\u94f6\\u884c\",\"company_name\":\"\\u5efa\\u8bbe\\u94f6\\u884c\"}],\"behavior_check\":[{\"check_point\":\"regular_circle\",\"score\":0,\"check_point_cn\":\"\\u670b\\u53cb\\u5708\\u5728\\u54ea\\u91cc\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740\"},{\"check_point\":\"phone_used_time\",\"score\":1,\"check_point_cn\":\"\\u53f7\\u7801\\u4f7f\\u7528\\u65f6\\u95f4\",\"result\":\"\\u957f\\u671f\\u4f7f\\u7528(24\\u4e2a\\u6708\\u4ee5\\u4e0a\\uff0c\\u5305\\u542b24)\",\"evidence\":\"\\u6839\\u636e\\u53f7\\u7801[18334795116]\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u8ba4\\u8bc1\\u65f6\\u95f4,\\u63a8\\u7b97\\u8be5\\u53f7\\u7801\\u4f7f\\u752858\\u4e2a\\u6708\"},{\"check_point\":\"phone_silent\",\"score\":2,\"check_point_cn\":\"\\u624b\\u673a\\u9759\\u9ed8\\u60c5\\u51b5(\\u8fde\\u7eed24\\u5c0f\\u65f6\\u5185\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\\u8ba1\\u4e3a\\u9759\\u9ed8\\u4e00\\u5929)\",\"result\":\"163\\u5929\\u5185\\u670972\\u5929\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u6839\\u636e\\u8fd0\\u8425\\u5546\\u8be6\\u5355\\u6570\\u636e\\uff0c\\u8fde\\u7eed\\u4e09\\u5929\\u4ee5\\u4e0a\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f555\\u6b21: 2018-01-03 - 2018-01-08, 6\\u5929 \\/ 2018-03-04 - 2018-03-06, 3\\u5929 \\/ 2018-03-23 - 2018-03-25, 3\\u5929 \\/ 2018-03-30 - 2018-04-01, 3\\u5929 \\/ 2018-04-18 - 2018-04-20, 3\\u5929\"},{\"check_point\":\"contact_each_other\",\"score\":1,\"check_point_cn\":\"\\u4e92\\u901a\\u8fc7\\u7535\\u8bdd\\u7684\\u53f7\\u7801\\u6570\\u91cf\",\"result\":\"\\u6570\\u91cf\\u6b63\\u5e38(10-100)\",\"evidence\":\"\\u4e92\\u901a\\u8fc7\\u7535\\u8bdd\\u7684\\u53f7\\u7801\\u670922\\u4e2a\\uff0c\\u6bd4\\u4f8b\\u4e3a16.18%\"},{\"check_point\":\"contact_macao\",\"score\":1,\"check_point_cn\":\"\\u6fb3\\u95e8\\u7535\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u6fb3\\u95e8\\u5730\\u533a\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_110\",\"score\":1,\"check_point_cn\":\"110\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e110\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_120\",\"score\":1,\"check_point_cn\":\"120\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e120\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_lawyer\",\"score\":1,\"check_point_cn\":\"\\u5f8b\\u5e08\\u53f7\\u7801\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e\\u5f8b\\u5e08\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_court\",\"score\":1,\"check_point_cn\":\"\\u6cd5\\u9662\\u53f7\\u7801\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e\\u6cd5\\u9662\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_night\",\"score\":1,\"check_point_cn\":\"\\u591c\\u95f4\\u6d3b\\u52a8\\u60c5\\u51b5(23\\u70b9-6\\u70b9)\",\"result\":\"\\u5f88\\u5c11\\u591c\\u95f4\\u6d3b\\u52a8(\\u591c\\u95f4\\u901a\\u8bdd\\u6bd4\\u4f8b\\u4f4e\\u4e8e20%)\",\"evidence\":\"\\u665a\\u95f4\\u6d3b\\u8dc3\\u9891\\u7387\\u5360\\u5168\\u5929\\u76842.97%\"},{\"check_point\":\"contact_loan\",\"score\":1,\"check_point_cn\":\"\\u8d37\\u6b3e\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u8be5\\u7c7b\\u53f7\\u7801\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u627e\\u5230\\u8d37\\u6b3e\\u7c7b\\u76f8\\u5173\\u53f7\\u7801\"},{\"check_point\":\"contact_bank\",\"score\":1,\"check_point_cn\":\"\\u94f6\\u884c\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u5f88\\u5c11\\u88ab\\u8054\\u7cfb(\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u5185\\uff0c\\u6216\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u4e0a\\u4e14\\u4e3b\\u52a8\\u547c\\u53eb\\u5360\\u6bd4\\u4f4e\\u4e8e20%)\",\"evidence\":\"\\u8054\\u7cfb\\u5217\\u8868:[\\u5efa\\u8bbe\\u94f6\\u884c]\\u4e3b\\u53eb2\\u6b21\\u51712.55\\u5206\\u949f\\uff0c\\u88ab\\u53eb0\\u6b21\\u51710.0\\u5206\\u949f\"},{\"check_point\":\"contact_credit_card\",\"score\":1,\"check_point_cn\":\"\\u4fe1\\u7528\\u5361\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u8be5\\u7c7b\\u53f7\\u7801\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u627e\\u5230\\u4fe1\\u7528\\u5361\\u7c7b\\u76f8\\u5173\\u53f7\\u7801\"},{\"check_point\":\"dwell_used_time\",\"score\":0,\"check_point_cn\":\"\\u5c45\\u4f4f\\u5730\\u672c\\u5730\\uff08\\u7701\\u4efd\\uff09\\u5730\\u5740\\u5728\\u7535\\u5546\\u4e2d\\u4f7f\\u7528\\u65f6\\u957f\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740\"},{\"check_point\":\"ebusiness_info\",\"score\":0,\"check_point_cn\":\"\\u603b\\u4f53\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"person_ebusiness_info\",\"score\":0,\"check_point_cn\":\"\\u7533\\u8bf7\\u4eba\\u672c\\u4eba\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"virtual_buying\",\"score\":0,\"check_point_cn\":\"\\u865a\\u62df\\u5546\\u54c1\\u8d2d\\u4e70\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"lottery_buying\",\"score\":0,\"check_point_cn\":\"\\u5f69\\u7968\\u8d2d\\u4e70\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"person_addr_changed\",\"score\":0,\"check_point_cn\":\"\\u7533\\u8bf7\\u4eba\\u672c\\u4eba\\u5730\\u5740\\u53d8\\u5316\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"}],\"collection_contact\":[],\"ebusiness_expense\":[],\"contact_region\":[{\"region_loc\":\"\\u4e0a\\u6d77\",\"region_uniq_num_cnt\":71,\"region_call_out_time\":48.45,\"region_avg_call_in_time\":1.4478947368421053,\"region_call_in_time\":137.55,\"region_call_out_cnt\":42,\"region_avg_call_out_time\":1.1535714285714287,\"region_call_in_cnt_pct\":0.3784860557768924,\"region_call_in_time_pct\":0.3879383284760741,\"region_call_in_cnt\":95,\"region_call_out_time_pct\":0.35686226368769947,\"region_call_out_cnt_pct\":0.328125},{\"region_loc\":\"\\u5168\\u56fd\",\"region_uniq_num_cnt\":12,\"region_call_out_time\":25.683333333333334,\"region_avg_call_in_time\":0.8611111111111112,\"region_call_in_time\":2.5833333333333335,\"region_call_out_cnt\":13,\"region_avg_call_out_time\":1.9756410256410257,\"region_call_in_cnt_pct\":0.01195219123505976,\"region_call_in_time_pct\":0.0072858888784431705,\"region_call_in_cnt\":3,\"region_call_out_time_pct\":0.18917260004910383,\"region_call_out_cnt_pct\":0.1015625},{\"region_loc\":\"\\u5317\\u4eac\",\"region_uniq_num_cnt\":3,\"region_call_out_time\":0.13333333333333333,\"region_avg_call_in_time\":7.391666666666667,\"region_call_in_time\":44.35,\"region_call_out_cnt\":1,\"region_avg_call_out_time\":0.13333333333333333,\"region_call_in_cnt_pct\":0.02390438247011952,\"region_call_in_time_pct\":0.12508226003572437,\"region_call_in_cnt\":6,\"region_call_out_time_pct\":0.0009820770930518044,\"region_call_out_cnt_pct\":0.0078125},{\"region_loc\":\"\\u56db\\u5ddd\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":3.2666666666666666,\"region_call_in_time\":3.2666666666666666,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.00398406374501992,\"region_call_in_time_pct\":0.009213124001128137,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u5b89\\u5fbd\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.06666666666666667,\"region_call_in_time\":0.06666666666666667,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.00398406374501992,\"region_call_in_time_pct\":0.00018802293879853342,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u5c71\\u4e1c\",\"region_uniq_num_cnt\":3,\"region_call_out_time\":0.21666666666666667,\"region_avg_call_in_time\":0.2111111111111111,\"region_call_in_time\":0.6333333333333333,\"region_call_out_cnt\":1,\"region_avg_call_out_time\":0.21666666666666667,\"region_call_in_cnt_pct\":0.01195219123505976,\"region_call_in_time_pct\":0.0017862179185860673,\"region_call_in_cnt\":3,\"region_call_out_time_pct\":0.0015958752762091823,\"region_call_out_cnt_pct\":0.0078125},{\"region_loc\":\"\\u5c71\\u897f\",\"region_uniq_num_cnt\":23,\"region_call_out_time\":45.333333333333336,\"region_avg_call_in_time\":0.7152173913043478,\"region_call_in_time\":82.25,\"region_call_out_cnt\":51,\"region_avg_call_out_time\":0.888888888888889,\"region_call_in_cnt_pct\":0.4581673306772908,\"region_call_in_time_pct\":0.23197330074269062,\"region_call_in_cnt\":115,\"region_call_out_time_pct\":0.3339062116376135,\"region_call_out_cnt_pct\":0.3984375},{\"region_loc\":\"\\u5e7f\\u4e1c\",\"region_uniq_num_cnt\":5,\"region_call_out_time\":1.4833333333333334,\"region_avg_call_in_time\":0.25833333333333336,\"region_call_in_time\":1.0333333333333334,\"region_call_out_cnt\":4,\"region_avg_call_out_time\":0.37083333333333335,\"region_call_in_cnt_pct\":0.01593625498007968,\"region_call_in_time_pct\":0.0029143555513772685,\"region_call_in_cnt\":4,\"region_call_out_time_pct\":0.010925607660201325,\"region_call_out_cnt_pct\":0.03125},{\"region_loc\":\"\\u5e7f\\u897f\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":1.1666666666666667,\"region_call_in_time\":1.1666666666666667,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.00398406374501992,\"region_call_in_time_pct\":0.0032904014289743353,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u672a\\u77e5\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":1.6333333333333333,\"region_avg_call_in_time\":0,\"region_call_in_time\":0,\"region_call_out_cnt\":1,\"region_avg_call_out_time\":1.6333333333333333,\"region_call_in_cnt_pct\":0,\"region_call_in_time_pct\":0,\"region_call_in_cnt\":0,\"region_call_out_time_pct\":0.012030444389884605,\"region_call_out_cnt_pct\":0.0078125},{\"region_loc\":\"\\u6c5f\\u82cf\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":5.566666666666666,\"region_avg_call_in_time\":4.25,\"region_call_in_time\":12.75,\"region_call_out_cnt\":3,\"region_avg_call_out_time\":1.8555555555555554,\"region_call_in_cnt_pct\":0.01195219123505976,\"region_call_in_time_pct\":0.03595938704521952,\"region_call_in_cnt\":3,\"region_call_out_time_pct\":0.04100171863491284,\"region_call_out_cnt_pct\":0.0234375},{\"region_loc\":\"\\u6cb3\\u5357\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.25,\"region_call_in_time\":0.5,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.00796812749003984,\"region_call_in_time_pct\":0.0014101720409890007,\"region_call_in_cnt\":2,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u6d59\\u6c5f\",\"region_uniq_num_cnt\":3,\"region_call_out_time\":0.7833333333333333,\"region_avg_call_in_time\":1.6666666666666667,\"region_call_in_time\":3.3333333333333335,\"region_call_out_cnt\":1,\"region_avg_call_out_time\":0.7833333333333333,\"region_call_in_cnt_pct\":0.00796812749003984,\"region_call_in_time_pct\":0.009401146939926672,\"region_call_in_cnt\":2,\"region_call_out_time_pct\":0.005769702921679352,\"region_call_out_cnt_pct\":0.0078125},{\"region_loc\":\"\\u6e56\\u5317\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0.5833333333333334,\"region_avg_call_in_time\":4.772222222222222,\"region_call_in_time\":14.316666666666666,\"region_call_out_cnt\":1,\"region_avg_call_out_time\":0.5833333333333334,\"region_call_in_cnt_pct\":0.01195219123505976,\"region_call_in_time_pct\":0.040377926106985054,\"region_call_in_cnt\":3,\"region_call_out_time_pct\":0.004296587282101645,\"region_call_out_cnt_pct\":0.0078125},{\"region_loc\":\"\\u8fbd\\u5b81\",\"region_uniq_num_cnt\":5,\"region_call_out_time\":1.8833333333333333,\"region_avg_call_in_time\":4.230555555555555,\"region_call_in_time\":50.766666666666666,\"region_call_out_cnt\":4,\"region_avg_call_out_time\":0.4708333333333333,\"region_call_in_cnt_pct\":0.04780876494023904,\"region_call_in_time_pct\":0.1431794678950832,\"region_call_in_cnt\":12,\"region_call_out_time_pct\":0.013871838939356737,\"region_call_out_cnt_pct\":0.03125},{\"region_loc\":\"\\u8fd0\\u8425\\u5546\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":4.016666666666667,\"region_avg_call_in_time\":0,\"region_call_in_time\":0,\"region_call_out_cnt\":6,\"region_avg_call_out_time\":0.6694444444444444,\"region_call_in_cnt_pct\":0,\"region_call_in_time_pct\":0,\"region_call_in_cnt\":0,\"region_call_out_time_pct\":0.02958507242818561,\"region_call_out_cnt_pct\":0.046875}],\"application_check\":[{\"check_points\":{\"key_value\":\"\\u9648\\u6167\\u6e05\"},\"app_point\":\"user_name\"},{\"check_points\":{\"province\":\"\\u5c71\\u897f\\u7701\",\"city\":\"\\u664b\\u4e2d\\u5e02\",\"key_value\":\"140721199306250048\",\"gender\":\"\\u5973\",\"age\":24,\"financial_blacklist\":{\"arised\":false,\"black_type\":[]},\"court_blacklist\":{\"arised\":false,\"black_type\":[]},\"region\":\"\\u6986\\u793e\\u53bf\"},\"app_point\":\"id_card\"},{\"check_points\":{\"website\":\"\\u5c71\\u897f\\u79fb\\u52a8\",\"check_ebusiness\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u53f7\\u7801\\u7684\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5(\\u65e0\\u7535\\u5546\\u6570\\u636e)\",\"key_value\":\"18334795116\",\"check_name\":\"\\u7528\\u6237\\u59d3\\u540d\\u4e0e\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u59d3\\u540d[\\u9648**]\\u5339\\u914d\\u6210\\u529f\",\"reg_time\":\"2013-08-18 08:48:22\",\"financial_blacklist\":{\"arised\":false,\"black_type\":[]},\"reliability\":\"\\u5b9e\\u540d\\u8ba4\\u8bc1\",\"check_idcard\":\"\\u7528\\u6237\\u8eab\\u4efd\\u8bc1\\u53f7\\u4e0e\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u8eab\\u4efd\\u8bc1\\u53f7\\u7801[140721********0048]\\u5339\\u914d\\u6210\\u529f\"},\"app_point\":\"cell_phone\"},{\"check_points\":{\"check_ebusiness\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u5c45\\u4f4f\\u5730\\u5740\\u7684\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5(\\u65e0\\u7535\\u5546\\u6570\\u636e)\",\"key_value\":\"\",\"check_addr\":\"\\u65e0\\u6cd5\\u5b9a\\u4f4d\\u5c45\\u4f4f\\u5730\\u5740(\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740)\"},\"app_point\":\"home_addr\"},{\"check_points\":{\"check_mobile\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u5bb6\\u5ead\\u7535\\u8bdd\\u7684\\u901a\\u8bdd\\u60c5\\u51b5(\\u65e0\\u5bb6\\u5ead\\u7535\\u8bdd)\",\"key_value\":\"\"},\"app_point\":\"home_phone\"}],\"deliver_address\":[],\"report\":{\"rpt_id\":\"201805311051470005\",\"token\":\"762d3ac20e1a46d8ae492a1982f278db\",\"version\":\"4.2\",\"update_time\":\"2018-05-31T02:51:47.000Z\"},\"trip_info\":[{\"trip_dest\":\"\\u5c71\\u897f\",\"trip_leave\":\"\\u4e0a\\u6d77\",\"trip_end_time\":\"2018-01-01\",\"trip_type\":\"\\u8282\\u5047\\u65e5\",\"trip_start_time\":\"2017-12-28\"},{\"trip_dest\":\"\\u5c71\\u897f\",\"trip_leave\":\"\\u4e0a\\u6d77\",\"trip_end_time\":\"2018-02-26\",\"trip_type\":\"\\u8282\\u5047\\u65e5\",\"trip_start_time\":\"2018-02-08\"},{\"trip_dest\":\"\\u5c71\\u897f\",\"trip_leave\":\"\\u4e0a\\u6d77\",\"trip_end_time\":\"2018-03-18\",\"trip_type\":\"\\u5de5\\u4f5c\\u65e5\",\"trip_start_time\":\"2018-03-08\"},{\"trip_dest\":\"\\u5c71\\u897f\",\"trip_leave\":\"\\u4e0a\\u6d77\",\"trip_end_time\":\"2018-04-07\",\"trip_type\":\"\\u8282\\u5047\\u65e5\",\"trip_start_time\":\"2018-04-04\"},{\"trip_dest\":\"\\u5c71\\u897f\",\"trip_leave\":\"\\u4e0a\\u6d77\",\"trip_end_time\":\"2018-05-15\",\"trip_type\":\"\\u5de5\\u4f5c\\u65e5\",\"trip_start_time\":\"2018-04-22\"}],\"_id\":\"5b0f63481d3d657a6799f12a\",\"cell_behavior\":[{\"phone_num\":\"18334795116\",\"behavior\":[{\"sms_cnt\":3,\"cell_phone_num\":\"18334795116\",\"net_flow\":37.732421875,\"total_amount\":26.11,\"call_out_time\":17.95,\"cell_mth\":\"2018-05\",\"cell_loc\":\"\\u5c71\\u897f\",\"call_cnt\":72,\"cell_operator_zh\":\"\\u5c71\\u897f\\u79fb\\u52a8\",\"call_out_cnt\":24,\"cell_operator\":\"chinamobilesx\",\"call_in_time\":99.26666666666667,\"call_in_cnt\":48},{\"sms_cnt\":0,\"cell_phone_num\":\"18334795116\",\"net_flow\":140.8505859375,\"total_amount\":26.11,\"call_out_time\":28.033333333333335,\"cell_mth\":\"2018-04\",\"cell_loc\":\"\\u5c71\\u897f\",\"call_cnt\":60,\"cell_operator_zh\":\"\\u5c71\\u897f\\u79fb\\u52a8\",\"call_out_cnt\":18,\"cell_operator\":\"chinamobilesx\",\"call_in_time\":28.483333333333334,\"call_in_cnt\":42},{\"sms_cnt\":5,\"cell_phone_num\":\"18334795116\",\"net_flow\":179.20703125,\"total_amount\":30.5,\"call_out_time\":7.933333333333334,\"cell_mth\":\"2018-03\",\"cell_loc\":\"\\u5c71\\u897f\",\"call_cnt\":55,\"cell_operator_zh\":\"\\u5c71\\u897f\\u79fb\\u52a8\",\"call_out_cnt\":12,\"cell_operator\":\"chinamobilesx\",\"call_in_time\":56.266666666666666,\"call_in_cnt\":43},{\"sms_cnt\":0,\"cell_phone_num\":\"18334795116\",\"net_flow\":11.8349609375,\"total_amount\":33.15,\"call_out_time\":27.1,\"cell_mth\":\"2018-02\",\"cell_loc\":\"\\u5c71\\u897f\",\"call_cnt\":84,\"cell_operator_zh\":\"\\u5c71\\u897f\\u79fb\\u52a8\",\"call_out_cnt\":30,\"cell_operator\":\"chinamobilesx\",\"call_in_time\":66.88333333333334,\"call_in_cnt\":54},{\"sms_cnt\":8,\"cell_phone_num\":\"18334795116\",\"net_flow\":111.7734375,\"total_amount\":37.9,\"call_out_time\":46.5,\"cell_mth\":\"2018-01\",\"cell_loc\":\"\\u5c71\\u897f\",\"call_cnt\":79,\"cell_operator_zh\":\"\\u5c71\\u897f\\u79fb\\u52a8\",\"call_out_cnt\":35,\"cell_operator\":\"chinamobilesx\",\"call_in_time\":95.03333333333333,\"call_in_cnt\":44},{\"sms_cnt\":2,\"cell_phone_num\":\"18334795116\",\"net_flow\":128.4462890625,\"total_amount\":37.9,\"call_out_time\":8.25,\"cell_mth\":\"2017-12\",\"cell_loc\":\"\\u5c71\\u897f\",\"call_cnt\":29,\"cell_operator_zh\":\"\\u5c71\\u897f\\u79fb\\u52a8\",\"call_out_cnt\":9,\"cell_operator\":\"chinamobilesx\",\"call_in_time\":8.633333333333333,\"call_in_cnt\":20}]}]},\"success\":\"true\"}', '2018-05-31 10:53:16', '2018-05-31 10:53:16');
INSERT INTO `borrower_contact_info` VALUES ('248', '{\"note\":\"\",\"report_data\":{\"user_info_check\":{\"check_black_info\":{\"contacts_class1_blacklist_cnt\":0,\"contacts_router_ratio\":0.3142857142857143,\"contacts_class2_blacklist_cnt\":46,\"contacts_router_cnt\":11,\"contacts_class1_cnt\":35,\"phone_gray_score\":60},\"check_search_info\":{\"arised_open_web\":[],\"phone_with_other_idcards\":[],\"idcard_with_other_phones\":[],\"register_org_cnt\":0,\"idcard_with_other_names\":[],\"searched_org_type\":[\"\\u7ebf\\u4e0a\\u6d88\\u8d39\\u5206\\u671f\",\"\\u5176\\u4ed6\"],\"searched_org_cnt\":2,\"register_org_type\":[],\"phone_with_other_names\":[]}},\"main_service\":[{\"service_details\":[{\"interact_cnt\":0,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":2,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-04\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-05\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-06\"}],\"total_service_cnt\":2,\"company_type\":\"\\u5176\\u5b83\",\"company_name\":\"\\u2014\"},{\"service_details\":[{\"interact_cnt\":0,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-04\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-05\"},{\"interact_cnt\":1,\"interact_mth\":\"2018-06\"}],\"total_service_cnt\":1,\"company_type\":\"\\u94f6\\u884c\",\"company_name\":\"\\u4e2d\\u56fd\\u519c\\u4e1a\\u94f6\\u884c\\u5ba2\\u670d\\u7535\\u8bdd\"},{\"service_details\":[{\"interact_cnt\":0,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-04\"},{\"interact_cnt\":2,\"interact_mth\":\"2018-05\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-06\"}],\"total_service_cnt\":2,\"company_type\":\"\\u8fd0\\u8425\\u5546\",\"company_name\":\"\\u4e2d\\u56fd\\u79fb\\u52a8\"},{\"service_details\":[{\"interact_cnt\":3,\"interact_mth\":\"2018-01\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-02\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-03\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-04\"},{\"interact_cnt\":2,\"interact_mth\":\"2018-05\"},{\"interact_cnt\":0,\"interact_mth\":\"2018-06\"}],\"total_service_cnt\":5,\"company_type\":\"\\u94f6\\u884c\",\"company_name\":\"\\u5efa\\u8bbe\\u94f6\\u884c\"}],\"behavior_check\":[{\"check_point\":\"regular_circle\",\"score\":0,\"check_point_cn\":\"\\u670b\\u53cb\\u5708\\u5728\\u54ea\\u91cc\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740\"},{\"check_point\":\"phone_used_time\",\"score\":1,\"check_point_cn\":\"\\u53f7\\u7801\\u4f7f\\u7528\\u65f6\\u95f4\",\"result\":\"\\u957f\\u671f\\u4f7f\\u7528(24\\u4e2a\\u6708\\u4ee5\\u4e0a\\uff0c\\u5305\\u542b24)\",\"evidence\":\"\\u6839\\u636e\\u53f7\\u7801[18334795116]\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u8ba4\\u8bc1\\u65f6\\u95f4,\\u63a8\\u7b97\\u8be5\\u53f7\\u7801\\u4f7f\\u752859\\u4e2a\\u6708\"},{\"check_point\":\"phone_silent\",\"score\":2,\"check_point_cn\":\"\\u624b\\u673a\\u9759\\u9ed8\\u60c5\\u51b5(\\u8fde\\u7eed24\\u5c0f\\u65f6\\u5185\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\\u8ba1\\u4e3a\\u9759\\u9ed8\\u4e00\\u5929)\",\"result\":\"157\\u5929\\u5185\\u670972\\u5929\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u6839\\u636e\\u8fd0\\u8425\\u5546\\u8be6\\u5355\\u6570\\u636e\\uff0c\\u8fde\\u7eed\\u4e09\\u5929\\u4ee5\\u4e0a\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f556\\u6b21: 2018-01-03 - 2018-01-08, 6\\u5929 \\/ 2018-03-04 - 2018-03-06, 3\\u5929 \\/ 2018-03-23 - 2018-03-25, 3\\u5929 \\/ 2018-03-30 - 2018-04-01, 3\\u5929 \\/ 2018-04-18 - 2018-04-20, 3\\u5929 \\/ 2018-06-01 - 2018-06-05, 5\\u5929\"},{\"check_point\":\"contact_each_other\",\"score\":1,\"check_point_cn\":\"\\u4e92\\u901a\\u8fc7\\u7535\\u8bdd\\u7684\\u53f7\\u7801\\u6570\\u91cf\",\"result\":\"\\u6570\\u91cf\\u6b63\\u5e38(10-100)\",\"evidence\":\"\\u4e92\\u901a\\u8fc7\\u7535\\u8bdd\\u7684\\u53f7\\u7801\\u670921\\u4e2a\\uff0c\\u6bd4\\u4f8b\\u4e3a16.41%\"},{\"check_point\":\"contact_macao\",\"score\":1,\"check_point_cn\":\"\\u6fb3\\u95e8\\u7535\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u6fb3\\u95e8\\u5730\\u533a\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_110\",\"score\":1,\"check_point_cn\":\"110\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e110\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_120\",\"score\":1,\"check_point_cn\":\"120\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e120\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_lawyer\",\"score\":1,\"check_point_cn\":\"\\u5f8b\\u5e08\\u53f7\\u7801\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e\\u5f8b\\u5e08\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_court\",\"score\":1,\"check_point_cn\":\"\\u6cd5\\u9662\\u53f7\\u7801\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e\\u6cd5\\u9662\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_night\",\"score\":1,\"check_point_cn\":\"\\u591c\\u95f4\\u6d3b\\u52a8\\u60c5\\u51b5(23\\u70b9-6\\u70b9)\",\"result\":\"\\u5f88\\u5c11\\u591c\\u95f4\\u6d3b\\u52a8(\\u591c\\u95f4\\u901a\\u8bdd\\u6bd4\\u4f8b\\u4f4e\\u4e8e20%)\",\"evidence\":\"\\u665a\\u95f4\\u6d3b\\u8dc3\\u9891\\u7387\\u5360\\u5168\\u5929\\u76843.16%\"},{\"check_point\":\"contact_loan\",\"score\":1,\"check_point_cn\":\"\\u8d37\\u6b3e\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u8be5\\u7c7b\\u53f7\\u7801\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u627e\\u5230\\u8d37\\u6b3e\\u7c7b\\u76f8\\u5173\\u53f7\\u7801\"},{\"check_point\":\"contact_bank\",\"score\":1,\"check_point_cn\":\"\\u94f6\\u884c\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u5f88\\u5c11\\u88ab\\u8054\\u7cfb(\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u5185\\uff0c\\u6216\\u8054\\u7cfb\\u6b21\\u6570\\u57285\\u6b21\\u4ee5\\u4e0a\\u4e14\\u4e3b\\u52a8\\u547c\\u53eb\\u5360\\u6bd4\\u4f4e\\u4e8e20%)\",\"evidence\":\"\\u8054\\u7cfb\\u5217\\u8868:[\\u5efa\\u8bbe\\u94f6\\u884c]\\u4e3b\\u53eb2\\u6b21\\u51712.55\\u5206\\u949f\\uff0c\\u88ab\\u53eb0\\u6b21\\u51710.0\\u5206\\u949f\"},{\"check_point\":\"contact_credit_card\",\"score\":1,\"check_point_cn\":\"\\u4fe1\\u7528\\u5361\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u8be5\\u7c7b\\u53f7\\u7801\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u627e\\u5230\\u4fe1\\u7528\\u5361\\u7c7b\\u76f8\\u5173\\u53f7\\u7801\"},{\"check_point\":\"dwell_used_time\",\"score\":0,\"check_point_cn\":\"\\u5c45\\u4f4f\\u5730\\u672c\\u5730\\uff08\\u7701\\u4efd\\uff09\\u5730\\u5740\\u5728\\u7535\\u5546\\u4e2d\\u4f7f\\u7528\\u65f6\\u957f\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740\"},{\"check_point\":\"ebusiness_info\",\"score\":0,\"check_point_cn\":\"\\u603b\\u4f53\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"person_ebusiness_info\",\"score\":0,\"check_point_cn\":\"\\u7533\\u8bf7\\u4eba\\u672c\\u4eba\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"virtual_buying\",\"score\":0,\"check_point_cn\":\"\\u865a\\u62df\\u5546\\u54c1\\u8d2d\\u4e70\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"lottery_buying\",\"score\":0,\"check_point_cn\":\"\\u5f69\\u7968\\u8d2d\\u4e70\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"person_addr_changed\",\"score\":0,\"check_point_cn\":\"\\u7533\\u8bf7\\u4eba\\u672c\\u4eba\\u5730\\u5740\\u53d8\\u5316\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"}],\"collection_contact\":[],\"ebusiness_expense\":[],\"contact_region\":[{\"region_loc\":\"\\u4e0a\\u6d77\",\"region_uniq_num_cnt\":68,\"region_call_out_time\":46.166666666666664,\"region_avg_call_in_time\":1.5339080459770114,\"region_call_in_time\":133.45,\"region_call_out_cnt\":42,\"region_avg_call_out_time\":1.099206349206349,\"region_call_in_cnt_pct\":0.3670886075949367,\"region_call_in_time_pct\":0.38322006317603136,\"region_call_in_cnt\":87,\"region_call_out_time_pct\":0.3607710341234696,\"region_call_out_cnt_pct\":0.35},{\"region_loc\":\"\\u5168\\u56fd\",\"region_uniq_num_cnt\":11,\"region_call_out_time\":25.116666666666667,\"region_avg_call_in_time\":0.8611111111111112,\"region_call_in_time\":2.5833333333333335,\"region_call_out_cnt\":12,\"region_avg_call_out_time\":2.0930555555555554,\"region_call_in_cnt_pct\":0.012658227848101266,\"region_call_in_time_pct\":0.00741839762611276,\"region_call_in_cnt\":3,\"region_call_out_time_pct\":0.19627507163323782,\"region_call_out_cnt_pct\":0.1},{\"region_loc\":\"\\u5317\\u4eac\",\"region_uniq_num_cnt\":4,\"region_call_out_time\":0.13333333333333333,\"region_avg_call_in_time\":6.521428571428571,\"region_call_in_time\":45.65,\"region_call_out_cnt\":1,\"region_avg_call_out_time\":0.13333333333333333,\"region_call_in_cnt_pct\":0.029535864978902954,\"region_call_in_time_pct\":0.13109026514788932,\"region_call_in_cnt\":7,\"region_call_out_time_pct\":0.001041938004688721,\"region_call_out_cnt_pct\":0.008333333333333333},{\"region_loc\":\"\\u56db\\u5ddd\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":3.2666666666666666,\"region_call_in_time\":3.2666666666666666,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.004219409282700422,\"region_call_in_time_pct\":0.0093806834497942,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u5c71\\u4e1c\",\"region_uniq_num_cnt\":3,\"region_call_out_time\":0.21666666666666667,\"region_avg_call_in_time\":0.2111111111111111,\"region_call_in_time\":0.6333333333333333,\"region_call_out_cnt\":1,\"region_avg_call_out_time\":0.21666666666666667,\"region_call_in_cnt_pct\":0.012658227848101266,\"region_call_in_time_pct\":0.0018187039341437733,\"region_call_in_cnt\":3,\"region_call_out_time_pct\":0.0016931492576191718,\"region_call_out_cnt_pct\":0.008333333333333333},{\"region_loc\":\"\\u5c71\\u897f\",\"region_uniq_num_cnt\":17,\"region_call_out_time\":40.516666666666666,\"region_avg_call_in_time\":0.7339563862928349,\"region_call_in_time\":78.53333333333333,\"region_call_out_cnt\":45,\"region_avg_call_out_time\":0.9003703703703704,\"region_call_in_cnt_pct\":0.45147679324894513,\"region_call_in_time_pct\":0.22551928783382788,\"region_call_in_cnt\":107,\"region_call_out_time_pct\":0.3166189111747851,\"region_call_out_cnt_pct\":0.375},{\"region_loc\":\"\\u5e7f\\u4e1c\",\"region_uniq_num_cnt\":5,\"region_call_out_time\":1.4833333333333334,\"region_avg_call_in_time\":0.25833333333333336,\"region_call_in_time\":1.0333333333333334,\"region_call_out_cnt\":4,\"region_avg_call_out_time\":0.37083333333333335,\"region_call_in_cnt_pct\":0.016877637130801686,\"region_call_in_time_pct\":0.002967359050445104,\"region_call_in_cnt\":4,\"region_call_out_time_pct\":0.011591560302162022,\"region_call_out_cnt_pct\":0.03333333333333333},{\"region_loc\":\"\\u5e7f\\u897f\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":1.1666666666666667,\"region_call_in_time\":1.1666666666666667,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.004219409282700422,\"region_call_in_time_pct\":0.003350244089212214,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u672a\\u77e5\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":1.6333333333333333,\"region_avg_call_in_time\":0,\"region_call_in_time\":0,\"region_call_out_cnt\":1,\"region_avg_call_out_time\":1.6333333333333333,\"region_call_in_cnt_pct\":0,\"region_call_in_time_pct\":0,\"region_call_in_cnt\":0,\"region_call_out_time_pct\":0.012763740557436832,\"region_call_out_cnt_pct\":0.008333333333333333},{\"region_loc\":\"\\u6c5f\\u82cf\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":5.566666666666666,\"region_avg_call_in_time\":4.25,\"region_call_in_time\":12.75,\"region_call_out_cnt\":3,\"region_avg_call_out_time\":1.8555555555555554,\"region_call_in_cnt_pct\":0.012658227848101266,\"region_call_in_time_pct\":0.036613381832104906,\"region_call_in_cnt\":3,\"region_call_out_time_pct\":0.0435009116957541,\"region_call_out_cnt_pct\":0.025},{\"region_loc\":\"\\u6cb3\\u5357\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.25,\"region_call_in_time\":0.5,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.008438818565400843,\"region_call_in_time_pct\":0.0014358188953766632,\"region_call_in_cnt\":2,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u6d59\\u6c5f\",\"region_uniq_num_cnt\":4,\"region_call_out_time\":0.7833333333333333,\"region_avg_call_in_time\":1.1500000000000001,\"region_call_in_time\":3.45,\"region_call_out_cnt\":1,\"region_avg_call_out_time\":0.7833333333333333,\"region_call_in_cnt_pct\":0.012658227848101266,\"region_call_in_time_pct\":0.009907150378098976,\"region_call_in_cnt\":3,\"region_call_out_time_pct\":0.006121385777546236,\"region_call_out_cnt_pct\":0.008333333333333333},{\"region_loc\":\"\\u6e56\\u5317\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0.5833333333333334,\"region_avg_call_in_time\":4.772222222222222,\"region_call_in_time\":14.316666666666666,\"region_call_out_cnt\":1,\"region_avg_call_out_time\":0.5833333333333334,\"region_call_in_cnt_pct\":0.012658227848101266,\"region_call_in_time_pct\":0.04111228103761845,\"region_call_in_cnt\":3,\"region_call_out_time_pct\":0.0045584787705131545,\"region_call_out_cnt_pct\":0.008333333333333333},{\"region_loc\":\"\\u8fbd\\u5b81\",\"region_uniq_num_cnt\":6,\"region_call_out_time\":1.8833333333333333,\"region_avg_call_in_time\":3.9153846153846152,\"region_call_in_time\":50.9,\"region_call_out_cnt\":4,\"region_avg_call_out_time\":0.4708333333333333,\"region_call_in_cnt_pct\":0.05485232067510549,\"region_call_in_time_pct\":0.14616636354934429,\"region_call_in_cnt\":13,\"region_call_out_time_pct\":0.014717374316228184,\"region_call_out_cnt_pct\":0.03333333333333333},{\"region_loc\":\"\\u8fd0\\u8425\\u5546\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":3.8833333333333333,\"region_avg_call_in_time\":0,\"region_call_in_time\":0,\"region_call_out_cnt\":5,\"region_avg_call_out_time\":0.7766666666666666,\"region_call_in_cnt_pct\":0,\"region_call_in_time_pct\":0,\"region_call_in_cnt\":0,\"region_call_out_time_pct\":0.030346444386559,\"region_call_out_cnt_pct\":0.041666666666666664}],\"application_check\":[{\"check_points\":{\"key_value\":\"\\u9648\\u6167\\u6e05\"},\"app_point\":\"user_name\"},{\"check_points\":{\"province\":\"\\u5c71\\u897f\\u7701\",\"city\":\"\\u664b\\u4e2d\\u5e02\",\"key_value\":\"140721199306250048\",\"gender\":\"\\u5973\",\"age\":24,\"financial_blacklist\":{\"arised\":false,\"black_type\":[]},\"court_blacklist\":{\"arised\":false,\"black_type\":[]},\"region\":\"\\u6986\\u793e\\u53bf\"},\"app_point\":\"id_card\"},{\"check_points\":{\"website\":\"\\u5c71\\u897f\\u79fb\\u52a8\",\"check_ebusiness\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u53f7\\u7801\\u7684\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5(\\u65e0\\u7535\\u5546\\u6570\\u636e)\",\"key_value\":\"18334795116\",\"check_name\":\"\\u7528\\u6237\\u59d3\\u540d\\u4e0e\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u59d3\\u540d[\\u9648**]\\u5339\\u914d\\u6210\\u529f\",\"reg_time\":\"2013-08-18 00:00:00\",\"financial_blacklist\":{\"arised\":false,\"black_type\":[]},\"reliability\":\"\\u5b9e\\u540d\\u8ba4\\u8bc1\",\"check_idcard\":\"\\u7528\\u6237\\u8eab\\u4efd\\u8bc1\\u53f7\\u4e0e\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u8eab\\u4efd\\u8bc1\\u53f7\\u7801[140721********0048]\\u5339\\u914d\\u6210\\u529f\"},\"app_point\":\"cell_phone\"},{\"check_points\":{\"check_ebusiness\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u5c45\\u4f4f\\u5730\\u5740\\u7684\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5(\\u65e0\\u7535\\u5546\\u6570\\u636e)\",\"key_value\":\"\",\"check_addr\":\"\\u65e0\\u6cd5\\u5b9a\\u4f4d\\u5c45\\u4f4f\\u5730\\u5740(\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740)\"},\"app_point\":\"home_addr\"},{\"check_points\":{\"check_mobile\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u5bb6\\u5ead\\u7535\\u8bdd\\u7684\\u901a\\u8bdd\\u60c5\\u51b5(\\u65e0\\u5bb6\\u5ead\\u7535\\u8bdd)\",\"key_value\":\"\"},\"app_point\":\"home_phone\"}],\"deliver_address\":[],\"report\":{\"rpt_id\":\"201806101119350002\",\"token\":\"17330e7a3c9d47a2995fe18dad0469e2\",\"version\":\"4.2\",\"update_time\":\"2018-06-10T03:19:35.000Z\"},\"trip_info\":[{\"trip_dest\":\"\\u5c71\\u897f\",\"trip_leave\":\"\\u4e0a\\u6d77\",\"trip_end_time\":\"2018-02-26\",\"trip_type\":\"\\u8282\\u5047\\u65e5\",\"trip_start_time\":\"2018-02-08\"},{\"trip_dest\":\"\\u5c71\\u897f\",\"trip_leave\":\"\\u4e0a\\u6d77\",\"trip_end_time\":\"2018-03-18\",\"trip_type\":\"\\u5de5\\u4f5c\\u65e5\",\"trip_start_time\":\"2018-03-08\"},{\"trip_dest\":\"\\u5c71\\u897f\",\"trip_leave\":\"\\u4e0a\\u6d77\",\"trip_end_time\":\"2018-04-07\",\"trip_type\":\"\\u8282\\u5047\\u65e5\",\"trip_start_time\":\"2018-04-04\"},{\"trip_dest\":\"\\u5c71\\u897f\",\"trip_leave\":\"\\u4e0a\\u6d77\",\"trip_end_time\":\"2018-05-15\",\"trip_type\":\"\\u5de5\\u4f5c\\u65e5\",\"trip_start_time\":\"2018-04-22\"}],\"_id\":\"5b1c98cada617907425807d9\",\"cell_behavior\":[{\"phone_num\":\"18334795116\",\"behavior\":[{\"sms_cnt\":1,\"cell_phone_num\":\"18334795116\",\"net_flow\":0,\"total_amount\":-1,\"call_out_time\":0,\"cell_mth\":\"2018-06\",\"cell_loc\":\"\\u5c71\\u897f\",\"call_cnt\":6,\"cell_operator_zh\":\"\\u5c71\\u897f\\u79fb\\u52a8\",\"call_out_cnt\":0,\"cell_operator\":\"chinamobilesx\",\"call_in_time\":2.3,\"call_in_cnt\":6},{\"sms_cnt\":6,\"cell_phone_num\":\"18334795116\",\"net_flow\":37.732421875,\"total_amount\":23.3,\"call_out_time\":18.4,\"cell_mth\":\"2018-05\",\"cell_loc\":\"\\u5c71\\u897f\",\"call_cnt\":73,\"cell_operator_zh\":\"\\u5c71\\u897f\\u79fb\\u52a8\",\"call_out_cnt\":25,\"cell_operator\":\"chinamobilesx\",\"call_in_time\":99.26666666666667,\"call_in_cnt\":48},{\"sms_cnt\":0,\"cell_phone_num\":\"18334795116\",\"net_flow\":140.8505859375,\"total_amount\":26.11,\"call_out_time\":28.033333333333335,\"cell_mth\":\"2018-04\",\"cell_loc\":\"\\u5c71\\u897f\",\"call_cnt\":60,\"cell_operator_zh\":\"\\u5c71\\u897f\\u79fb\\u52a8\",\"call_out_cnt\":18,\"cell_operator\":\"chinamobilesx\",\"call_in_time\":28.483333333333334,\"call_in_cnt\":42},{\"sms_cnt\":5,\"cell_phone_num\":\"18334795116\",\"net_flow\":179.20703125,\"total_amount\":30.5,\"call_out_time\":7.933333333333334,\"cell_mth\":\"2018-03\",\"cell_loc\":\"\\u5c71\\u897f\",\"call_cnt\":55,\"cell_operator_zh\":\"\\u5c71\\u897f\\u79fb\\u52a8\",\"call_out_cnt\":12,\"cell_operator\":\"chinamobilesx\",\"call_in_time\":56.266666666666666,\"call_in_cnt\":43},{\"sms_cnt\":0,\"cell_phone_num\":\"18334795116\",\"net_flow\":11.8349609375,\"total_amount\":33.15,\"call_out_time\":27.1,\"cell_mth\":\"2018-02\",\"cell_loc\":\"\\u5c71\\u897f\",\"call_cnt\":84,\"cell_operator_zh\":\"\\u5c71\\u897f\\u79fb\\u52a8\",\"call_out_cnt\":30,\"cell_operator\":\"chinamobilesx\",\"call_in_time\":66.88333333333334,\"call_in_cnt\":54},{\"sms_cnt\":8,\"cell_phone_num\":\"18334795116\",\"net_flow\":111.7734375,\"total_amount\":37.9,\"call_out_time\":46.5,\"cell_mth\":\"2018-01\",\"cell_loc\":\"\\u5c71\\u897f\",\"call_cnt\":79,\"cell_operator_zh\":\"\\u5c71\\u897f\\u79fb\\u52a8\",\"call_out_cnt\":35,\"cell_operator\":\"chinamobilesx\",\"call_in_time\":95.03333333333333,\"call_in_cnt\":44}]}]},\"success\":\"true\"}', '2018-06-10 11:21:12', '2018-06-10 11:21:12');
INSERT INTO `borrower_contact_info` VALUES ('265', '{\"note\":\"\",\"report_data\":{\"user_info_check\":{\"check_black_info\":{\"contacts_class1_blacklist_cnt\":0,\"contacts_router_ratio\":0.6666666666666666,\"contacts_class2_blacklist_cnt\":31,\"contacts_router_cnt\":4,\"contacts_class1_cnt\":6,\"phone_gray_score\":60},\"check_search_info\":{\"arised_open_web\":[],\"phone_with_other_idcards\":[],\"idcard_with_other_phones\":[],\"register_org_cnt\":0,\"idcard_with_other_names\":[],\"searched_org_type\":[\"\\u5176\\u4ed6\"],\"searched_org_cnt\":1,\"register_org_type\":[],\"phone_with_other_names\":[]}},\"main_service\":[],\"behavior_check\":[{\"check_point\":\"regular_circle\",\"score\":0,\"check_point_cn\":\"\\u670b\\u53cb\\u5708\\u5728\\u54ea\\u91cc\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740\"},{\"check_point\":\"phone_used_time\",\"score\":1,\"check_point_cn\":\"\\u53f7\\u7801\\u4f7f\\u7528\\u65f6\\u95f4\",\"result\":\"\\u81f3\\u5c11\\u4f7f\\u7528\\u4e86\\u534a\\u5e74\\u4ee5\\u4e0a(6-24\\u4e2a\\u6708\\uff0c\\u5305\\u542b6)\",\"evidence\":\"\\u6839\\u636e\\u53f7\\u7801[17607155535]\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u8ba4\\u8bc1\\u65f6\\u95f4,\\u63a8\\u7b97\\u8be5\\u53f7\\u7801\\u4f7f\\u752819\\u4e2a\\u6708\"},{\"check_point\":\"phone_silent\",\"score\":1,\"check_point_cn\":\"\\u624b\\u673a\\u9759\\u9ed8\\u60c5\\u51b5(\\u8fde\\u7eed24\\u5c0f\\u65f6\\u5185\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\\u8ba1\\u4e3a\\u9759\\u9ed8\\u4e00\\u5929)\",\"result\":\"150\\u5929\\u5185\\u670952\\u5929\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u6839\\u636e\\u8fd0\\u8425\\u5546\\u8be6\\u5355\\u6570\\u636e\\uff0c\\u8fde\\u7eed\\u4e09\\u5929\\u4ee5\\u4e0a\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f550\\u6b21\"},{\"check_point\":\"contact_each_other\",\"score\":1,\"check_point_cn\":\"\\u4e92\\u901a\\u8fc7\\u7535\\u8bdd\\u7684\\u53f7\\u7801\\u6570\\u91cf\",\"result\":\"\\u6570\\u91cf\\u6b63\\u5e38(10-100)\",\"evidence\":\"\\u4e92\\u901a\\u8fc7\\u7535\\u8bdd\\u7684\\u53f7\\u7801\\u670931\\u4e2a\\uff0c\\u6bd4\\u4f8b\\u4e3a17.42%\"},{\"check_point\":\"contact_macao\",\"score\":1,\"check_point_cn\":\"\\u6fb3\\u95e8\\u7535\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u6fb3\\u95e8\\u5730\\u533a\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_110\",\"score\":1,\"check_point_cn\":\"110\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e110\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_120\",\"score\":1,\"check_point_cn\":\"120\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e120\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_lawyer\",\"score\":1,\"check_point_cn\":\"\\u5f8b\\u5e08\\u53f7\\u7801\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e\\u5f8b\\u5e08\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_court\",\"score\":1,\"check_point_cn\":\"\\u6cd5\\u9662\\u53f7\\u7801\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e\\u6cd5\\u9662\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_night\",\"score\":2,\"check_point_cn\":\"\\u591c\\u95f4\\u6d3b\\u52a8\\u60c5\\u51b5(23\\u70b9-6\\u70b9)\",\"result\":\"\\u9891\\u7e41\\u591c\\u95f4\\u6d3b\\u52a8(\\u591c\\u95f4\\u901a\\u8bdd\\u6bd4\\u4f8b\\u5927\\u4e8e50%\\uff0c\\u5305\\u542b50%)\",\"evidence\":\"\\u665a\\u95f4\\u6d3b\\u8dc3\\u9891\\u7387\\u5360\\u5168\\u5929\\u768454.93%\"},{\"check_point\":\"contact_loan\",\"score\":1,\"check_point_cn\":\"\\u8d37\\u6b3e\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u8be5\\u7c7b\\u53f7\\u7801\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u627e\\u5230\\u8d37\\u6b3e\\u7c7b\\u76f8\\u5173\\u53f7\\u7801\"},{\"check_point\":\"contact_bank\",\"score\":1,\"check_point_cn\":\"\\u94f6\\u884c\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u8be5\\u7c7b\\u53f7\\u7801\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u627e\\u5230\\u94f6\\u884c\\u7c7b\\u76f8\\u5173\\u53f7\\u7801\"},{\"check_point\":\"contact_credit_card\",\"score\":1,\"check_point_cn\":\"\\u4fe1\\u7528\\u5361\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u8be5\\u7c7b\\u53f7\\u7801\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u627e\\u5230\\u4fe1\\u7528\\u5361\\u7c7b\\u76f8\\u5173\\u53f7\\u7801\"},{\"check_point\":\"dwell_used_time\",\"score\":0,\"check_point_cn\":\"\\u5c45\\u4f4f\\u5730\\u672c\\u5730\\uff08\\u7701\\u4efd\\uff09\\u5730\\u5740\\u5728\\u7535\\u5546\\u4e2d\\u4f7f\\u7528\\u65f6\\u957f\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740\"},{\"check_point\":\"ebusiness_info\",\"score\":0,\"check_point_cn\":\"\\u603b\\u4f53\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"person_ebusiness_info\",\"score\":0,\"check_point_cn\":\"\\u7533\\u8bf7\\u4eba\\u672c\\u4eba\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"virtual_buying\",\"score\":0,\"check_point_cn\":\"\\u865a\\u62df\\u5546\\u54c1\\u8d2d\\u4e70\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"lottery_buying\",\"score\":0,\"check_point_cn\":\"\\u5f69\\u7968\\u8d2d\\u4e70\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"person_addr_changed\",\"score\":0,\"check_point_cn\":\"\\u7533\\u8bf7\\u4eba\\u672c\\u4eba\\u5730\\u5740\\u53d8\\u5316\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"}],\"collection_contact\":[],\"ebusiness_expense\":[],\"contact_region\":[{\"region_loc\":\"\\u4e0a\\u6d77\",\"region_uniq_num_cnt\":74,\"region_call_out_time\":73.31666666666666,\"region_avg_call_in_time\":1.3829004329004329,\"region_call_in_time\":106.48333333333333,\"region_call_out_cnt\":56,\"region_avg_call_out_time\":1.3092261904761904,\"region_call_in_cnt_pct\":0.308,\"region_call_in_time_pct\":0.25350156727373724,\"region_call_in_cnt\":77,\"region_call_out_time_pct\":0.12189309761977334,\"region_call_out_cnt_pct\":0.22580645161290322},{\"region_loc\":\"\\u5168\\u56fd\",\"region_uniq_num_cnt\":5,\"region_call_out_time\":11.783333333333333,\"region_avg_call_in_time\":0,\"region_call_in_time\":0,\"region_call_out_cnt\":5,\"region_avg_call_out_time\":2.3566666666666665,\"region_call_in_cnt_pct\":0,\"region_call_in_time_pct\":0,\"region_call_in_cnt\":0,\"region_call_out_time_pct\":0.01959045692593311,\"region_call_out_cnt_pct\":0.020161290322580645},{\"region_loc\":\"\\u5317\\u4eac\",\"region_uniq_num_cnt\":5,\"region_call_out_time\":6.533333333333333,\"region_avg_call_in_time\":2.379166666666667,\"region_call_in_time\":9.516666666666667,\"region_call_out_cnt\":4,\"region_avg_call_out_time\":1.6333333333333333,\"region_call_in_cnt_pct\":0.016,\"region_call_in_time_pct\":0.022656033011943025,\"region_call_in_cnt\":4,\"region_call_out_time_pct\":0.010862035523289645,\"region_call_out_cnt_pct\":0.016129032258064516},{\"region_loc\":\"\\u56db\\u5ddd\",\"region_uniq_num_cnt\":56,\"region_call_out_time\":215.51666666666668,\"region_avg_call_in_time\":1.9126780626780626,\"region_call_in_time\":223.78333333333333,\"region_call_out_cnt\":90,\"region_avg_call_out_time\":2.39462962962963,\"region_call_in_cnt_pct\":0.468,\"region_call_in_time_pct\":0.5327540372177915,\"region_call_in_cnt\":117,\"region_call_out_time_pct\":0.3583086258970878,\"region_call_out_cnt_pct\":0.3629032258064516},{\"region_loc\":\"\\u5b89\\u5fbd\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":1.1833333333333333,\"region_avg_call_in_time\":0,\"region_call_in_time\":0,\"region_call_out_cnt\":1,\"region_avg_call_out_time\":1.1833333333333333,\"region_call_in_cnt_pct\":0,\"region_call_in_time_pct\":0,\"region_call_in_cnt\":0,\"region_call_out_time_pct\":0.0019673584748815427,\"region_call_out_cnt_pct\":0.004032258064516129},{\"region_loc\":\"\\u5c71\\u4e1c\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.275,\"region_call_in_time\":0.55,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.008,\"region_call_in_time_pct\":0.0013093679323890014,\"region_call_in_cnt\":2,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u5e7f\\u4e1c\",\"region_uniq_num_cnt\":5,\"region_call_out_time\":198.33333333333334,\"region_avg_call_in_time\":2.0064102564102564,\"region_call_in_time\":26.083333333333332,\"region_call_out_cnt\":58,\"region_avg_call_out_time\":3.4195402298850577,\"region_call_in_cnt_pct\":0.052,\"region_call_in_time_pct\":0.062095782248145055,\"region_call_in_cnt\":13,\"region_call_out_time_pct\":0.32974036409986424,\"region_call_out_cnt_pct\":0.23387096774193547},{\"region_loc\":\"\\u672a\\u77e5\",\"region_uniq_num_cnt\":3,\"region_call_out_time\":1.4833333333333334,\"region_avg_call_in_time\":0.18333333333333332,\"region_call_in_time\":0.18333333333333332,\"region_call_out_cnt\":3,\"region_avg_call_out_time\":0.49444444444444446,\"region_call_in_cnt_pct\":0.004,\"region_call_in_time_pct\":0.0004364559774630004,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0.0024661254121754552,\"region_call_out_cnt_pct\":0.012096774193548387},{\"region_loc\":\"\\u6c5f\\u82cf\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":1.4666666666666666,\"region_avg_call_in_time\":0.65,\"region_call_in_time\":1.3,\"region_call_out_cnt\":1,\"region_avg_call_out_time\":1.4666666666666666,\"region_call_in_cnt_pct\":0.008,\"region_call_in_time_pct\":0.003094869658374003,\"region_call_in_cnt\":2,\"region_call_out_time_pct\":0.002438416137881349,\"region_call_out_cnt_pct\":0.004032258064516129},{\"region_loc\":\"\\u6cb3\\u5317\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.3,\"region_call_in_time\":0.3,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.004,\"region_call_in_time_pct\":0.0007142006903940007,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u6cb3\\u5357\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":1.25,\"region_avg_call_in_time\":0.8555555555555556,\"region_call_in_time\":2.566666666666667,\"region_call_out_cnt\":2,\"region_avg_call_out_time\":0.625,\"region_call_in_cnt_pct\":0.012,\"region_call_in_time_pct\":0.006110383684482006,\"region_call_in_cnt\":3,\"region_call_out_time_pct\":0.002078195572057968,\"region_call_out_cnt_pct\":0.008064516129032258},{\"region_loc\":\"\\u6d59\\u6c5f\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.7333333333333333,\"region_call_in_time\":0.7333333333333333,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.004,\"region_call_in_time_pct\":0.0017458239098520015,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u6e56\\u5317\",\"region_uniq_num_cnt\":18,\"region_call_out_time\":49.55,\"region_avg_call_in_time\":1.7220238095238096,\"region_call_in_time\":48.21666666666667,\"region_call_out_cnt\":25,\"region_avg_call_out_time\":1.982,\"region_call_in_cnt_pct\":0.112,\"region_call_in_time_pct\":0.11478792207276911,\"region_call_in_cnt\":28,\"region_call_out_time_pct\":0.08237967247637784,\"region_call_out_cnt_pct\":0.10080645161290322},{\"region_loc\":\"\\u91cd\\u5e86\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":41.06666666666667,\"region_avg_call_in_time\":0,\"region_call_in_time\":0,\"region_call_out_cnt\":3,\"region_avg_call_out_time\":13.68888888888889,\"region_call_in_cnt_pct\":0,\"region_call_in_time_pct\":0,\"region_call_in_cnt\":0,\"region_call_out_time_pct\":0.06827565186067777,\"region_call_out_cnt_pct\":0.012096774193548387},{\"region_loc\":\"\\u9655\\u897f\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.3333333333333333,\"region_call_in_time\":0.3333333333333333,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.004,\"region_call_in_time_pct\":0.0007935563226600008,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0}],\"application_check\":[{\"check_points\":{\"key_value\":\"\\u90d1\\u5bc5\\u6750\"},\"app_point\":\"user_name\"},{\"check_points\":{\"province\":\"\\u56db\\u5ddd\\u7701\",\"city\":\"\\u81ea\\u8d21\\u5e02\",\"key_value\":\"510321199603012158\",\"gender\":\"\\u7537\",\"age\":22,\"financial_blacklist\":{\"arised\":false,\"black_type\":[]},\"court_blacklist\":{\"arised\":false,\"black_type\":[]},\"region\":\"\\u8363\\u53bf\"},\"app_point\":\"id_card\"},{\"check_points\":{\"website\":\"\\u4e2d\\u56fd\\u8054\\u901a\",\"check_ebusiness\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u53f7\\u7801\\u7684\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5(\\u65e0\\u7535\\u5546\\u6570\\u636e)\",\"key_value\":\"17607155535\",\"check_name\":\"\\u7528\\u6237\\u59d3\\u540d\\u4e0e\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u59d3\\u540d[\\u90d1\\u5bc5\\u6750]\\u5339\\u914d\\u6210\\u529f\",\"reg_time\":\"2016-12-20 00:00:00\",\"financial_blacklist\":{\"arised\":false,\"black_type\":[]},\"reliability\":\"\\u5b9e\\u540d\\u8ba4\\u8bc1\",\"check_idcard\":\"\\u7528\\u6237\\u8eab\\u4efd\\u8bc1\\u53f7\\u4e0e\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u8eab\\u4efd\\u8bc1\\u53f7\\u7801[5103****2158]\\u5339\\u914d\\u6210\\u529f\"},\"app_point\":\"cell_phone\"},{\"check_points\":{\"check_ebusiness\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u5c45\\u4f4f\\u5730\\u5740\\u7684\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5(\\u65e0\\u7535\\u5546\\u6570\\u636e)\",\"key_value\":\"\",\"check_addr\":\"\\u65e0\\u6cd5\\u5b9a\\u4f4d\\u5c45\\u4f4f\\u5730\\u5740(\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740)\"},\"app_point\":\"home_addr\"},{\"check_points\":{\"check_mobile\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u5bb6\\u5ead\\u7535\\u8bdd\\u7684\\u901a\\u8bdd\\u60c5\\u51b5(\\u65e0\\u5bb6\\u5ead\\u7535\\u8bdd)\",\"key_value\":\"\"},\"app_point\":\"home_phone\"}],\"deliver_address\":[],\"report\":{\"rpt_id\":\"201807021405240003\",\"token\":\"8e6266a8b1c84994a13fe93d9a3ae6cc\",\"version\":\"4.2\",\"update_time\":\"2018-07-02T06:05:24.000Z\"},\"trip_info\":[],\"_id\":\"5b39c0aea30e6d3c5b3d6c62\",\"cell_behavior\":[{\"phone_num\":\"17607155535\",\"behavior\":[{\"sms_cnt\":0,\"cell_phone_num\":\"17607155535\",\"net_flow\":27.4638671875,\"total_amount\":-1,\"call_out_time\":20.25,\"cell_mth\":\"2018-07\",\"cell_loc\":\"\\u6e56\\u5317\",\"call_cnt\":4,\"cell_operator_zh\":\"\\u4e2d\\u56fd\\u8054\\u901a\",\"call_out_cnt\":1,\"cell_operator\":\"chinaunicom\",\"call_in_time\":0.7333333333333333,\"call_in_cnt\":3},{\"sms_cnt\":11,\"cell_phone_num\":\"17607155535\",\"net_flow\":1788.2646484375,\"total_amount\":73.6,\"call_out_time\":173.43333333333334,\"cell_mth\":\"2018-06\",\"cell_loc\":\"\\u6e56\\u5317\",\"call_cnt\":110,\"cell_operator_zh\":\"\\u4e2d\\u56fd\\u8054\\u901a\",\"call_out_cnt\":53,\"cell_operator\":\"chinaunicom\",\"call_in_time\":89.81666666666666,\"call_in_cnt\":57},{\"sms_cnt\":0,\"cell_phone_num\":\"17607155535\",\"net_flow\":2028.041015625,\"total_amount\":70,\"call_out_time\":88.16666666666667,\"cell_mth\":\"2018-05\",\"cell_loc\":\"\\u6e56\\u5317\",\"call_cnt\":67,\"cell_operator_zh\":\"\\u4e2d\\u56fd\\u8054\\u901a\",\"call_out_cnt\":32,\"cell_operator\":\"chinaunicom\",\"call_in_time\":62.03333333333333,\"call_in_cnt\":35},{\"sms_cnt\":1,\"cell_phone_num\":\"17607155535\",\"net_flow\":1663.6240234375,\"total_amount\":73.9,\"call_out_time\":49.916666666666664,\"cell_mth\":\"2018-04\",\"cell_loc\":\"\\u6e56\\u5317\",\"call_cnt\":37,\"cell_operator_zh\":\"\\u4e2d\\u56fd\\u8054\\u901a\",\"call_out_cnt\":20,\"cell_operator\":\"chinaunicom\",\"call_in_time\":8.983333333333333,\"call_in_cnt\":17},{\"sms_cnt\":7,\"cell_phone_num\":\"17607155535\",\"net_flow\":1645.7109375,\"total_amount\":75.3,\"call_out_time\":91.3,\"cell_mth\":\"2018-03\",\"cell_loc\":\"\\u6e56\\u5317\",\"call_cnt\":98,\"cell_operator_zh\":\"\\u4e2d\\u56fd\\u8054\\u901a\",\"call_out_cnt\":43,\"cell_operator\":\"chinaunicom\",\"call_in_time\":63.21666666666667,\"call_in_cnt\":55},{\"sms_cnt\":3,\"cell_phone_num\":\"17607155535\",\"net_flow\":1408.3603515625,\"total_amount\":78.3,\"call_out_time\":178.41666666666666,\"cell_mth\":\"2018-02\",\"cell_loc\":\"\\u6e56\\u5317\",\"call_cnt\":182,\"cell_operator_zh\":\"\\u4e2d\\u56fd\\u8054\\u901a\",\"call_out_cnt\":99,\"cell_operator\":\"chinaunicom\",\"call_in_time\":195.26666666666668,\"call_in_cnt\":83}]}]},\"success\":\"true\"}', '2018-07-02 14:06:55', '2018-07-02 14:06:55');
INSERT INTO `borrower_contact_info` VALUES ('266', '{\"note\":\"\",\"report_data\":{\"user_info_check\":{\"check_black_info\":{\"contacts_class1_blacklist_cnt\":0,\"contacts_router_ratio\":0.3225806451612903,\"contacts_class2_blacklist_cnt\":21,\"contacts_router_cnt\":10,\"contacts_class1_cnt\":31,\"phone_gray_score\":61},\"check_search_info\":{\"arised_open_web\":[],\"phone_with_other_idcards\":[],\"idcard_with_other_phones\":[\"17621133265\",\"18221503642\"],\"register_org_cnt\":0,\"idcard_with_other_names\":[],\"searched_org_type\":[\"\\u5176\\u4ed6\"],\"searched_org_cnt\":1,\"register_org_type\":[],\"phone_with_other_names\":[]}},\"main_service\":[],\"behavior_check\":[{\"check_point\":\"regular_circle\",\"score\":0,\"check_point_cn\":\"\\u670b\\u53cb\\u5708\\u5728\\u54ea\\u91cc\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740\"},{\"check_point\":\"phone_used_time\",\"score\":1,\"check_point_cn\":\"\\u53f7\\u7801\\u4f7f\\u7528\\u65f6\\u95f4\",\"result\":\"\\u957f\\u671f\\u4f7f\\u7528(24\\u4e2a\\u6708\\u4ee5\\u4e0a\\uff0c\\u5305\\u542b24)\",\"evidence\":\"\\u6839\\u636e\\u53f7\\u7801[18339919633]\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u8ba4\\u8bc1\\u65f6\\u95f4,\\u63a8\\u7b97\\u8be5\\u53f7\\u7801\\u4f7f\\u752870\\u4e2a\\u6708\"},{\"check_point\":\"phone_silent\",\"score\":2,\"check_point_cn\":\"\\u624b\\u673a\\u9759\\u9ed8\\u60c5\\u51b5(\\u8fde\\u7eed24\\u5c0f\\u65f6\\u5185\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\\u8ba1\\u4e3a\\u9759\\u9ed8\\u4e00\\u5929)\",\"result\":\"167\\u5929\\u5185\\u670994\\u5929\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u6839\\u636e\\u8fd0\\u8425\\u5546\\u8be6\\u5355\\u6570\\u636e\\uff0c\\u8fde\\u7eed\\u4e09\\u5929\\u4ee5\\u4e0a\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f553\\u6b21: 2018-02-25 - 2018-02-28, 4\\u5929 \\/ 2018-04-16 - 2018-04-18, 3\\u5929 \\/ 2018-05-25 - 2018-05-27, 3\\u5929\"},{\"check_point\":\"contact_each_other\",\"score\":1,\"check_point_cn\":\"\\u4e92\\u901a\\u8fc7\\u7535\\u8bdd\\u7684\\u53f7\\u7801\\u6570\\u91cf\",\"result\":\"\\u6570\\u91cf\\u6b63\\u5e38(10-100)\",\"evidence\":\"\\u4e92\\u901a\\u8fc7\\u7535\\u8bdd\\u7684\\u53f7\\u7801\\u670917\\u4e2a\\uff0c\\u6bd4\\u4f8b\\u4e3a23.29%\"},{\"check_point\":\"contact_macao\",\"score\":1,\"check_point_cn\":\"\\u6fb3\\u95e8\\u7535\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u6fb3\\u95e8\\u5730\\u533a\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_110\",\"score\":1,\"check_point_cn\":\"110\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e110\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_120\",\"score\":1,\"check_point_cn\":\"120\\u8bdd\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e120\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_lawyer\",\"score\":1,\"check_point_cn\":\"\\u5f8b\\u5e08\\u53f7\\u7801\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e\\u5f8b\\u5e08\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_court\",\"score\":1,\"check_point_cn\":\"\\u6cd5\\u9662\\u53f7\\u7801\\u901a\\u8bdd\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u901a\\u8bdd\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u53d1\\u73b0\\u4e0e\\u6cd5\\u9662\\u7535\\u8bdd\\u901a\\u8bdd\\u8bb0\\u5f55\"},{\"check_point\":\"contact_night\",\"score\":1,\"check_point_cn\":\"\\u591c\\u95f4\\u6d3b\\u52a8\\u60c5\\u51b5(23\\u70b9-6\\u70b9)\",\"result\":\"\\u5076\\u5c14\\u591c\\u95f4\\u6d3b\\u52a8(\\u591c\\u95f4\\u901a\\u8bdd\\u6bd4\\u4f8b20%-50%\\uff0c \\u5305\\u542b20%)\",\"evidence\":\"\\u665a\\u95f4\\u6d3b\\u8dc3\\u9891\\u7387\\u5360\\u5168\\u5929\\u768421.85%\"},{\"check_point\":\"contact_loan\",\"score\":1,\"check_point_cn\":\"\\u8d37\\u6b3e\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u8be5\\u7c7b\\u53f7\\u7801\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u627e\\u5230\\u8d37\\u6b3e\\u7c7b\\u76f8\\u5173\\u53f7\\u7801\"},{\"check_point\":\"contact_bank\",\"score\":1,\"check_point_cn\":\"\\u94f6\\u884c\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u8be5\\u7c7b\\u53f7\\u7801\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u627e\\u5230\\u94f6\\u884c\\u7c7b\\u76f8\\u5173\\u53f7\\u7801\"},{\"check_point\":\"contact_credit_card\",\"score\":1,\"check_point_cn\":\"\\u4fe1\\u7528\\u5361\\u7c7b\\u53f7\\u7801\\u8054\\u7cfb\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u8be5\\u7c7b\\u53f7\\u7801\\u8bb0\\u5f55\",\"evidence\":\"\\u672a\\u627e\\u5230\\u4fe1\\u7528\\u5361\\u7c7b\\u76f8\\u5173\\u53f7\\u7801\"},{\"check_point\":\"dwell_used_time\",\"score\":0,\"check_point_cn\":\"\\u5c45\\u4f4f\\u5730\\u672c\\u5730\\uff08\\u7701\\u4efd\\uff09\\u5730\\u5740\\u5728\\u7535\\u5546\\u4e2d\\u4f7f\\u7528\\u65f6\\u957f\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740\"},{\"check_point\":\"ebusiness_info\",\"score\":0,\"check_point_cn\":\"\\u603b\\u4f53\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"person_ebusiness_info\",\"score\":0,\"check_point_cn\":\"\\u7533\\u8bf7\\u4eba\\u672c\\u4eba\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"virtual_buying\",\"score\":0,\"check_point_cn\":\"\\u865a\\u62df\\u5546\\u54c1\\u8d2d\\u4e70\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"lottery_buying\",\"score\":0,\"check_point_cn\":\"\\u5f69\\u7968\\u8d2d\\u4e70\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"},{\"check_point\":\"person_addr_changed\",\"score\":0,\"check_point_cn\":\"\\u7533\\u8bf7\\u4eba\\u672c\\u4eba\\u5730\\u5740\\u53d8\\u5316\\u60c5\\u51b5\",\"result\":\"\\u65e0\\u6570\\u636e\",\"evidence\":\"\\u672a\\u63d0\\u4f9b\\u7535\\u5546\\u6570\\u636e\"}],\"collection_contact\":[],\"ebusiness_expense\":[],\"contact_region\":[{\"region_loc\":\"\\u4e0a\\u6d77\",\"region_uniq_num_cnt\":27,\"region_call_out_time\":24.716666666666665,\"region_avg_call_in_time\":1.4508333333333332,\"region_call_in_time\":58.03333333333333,\"region_call_out_cnt\":25,\"region_avg_call_out_time\":0.9886666666666666,\"region_call_in_cnt_pct\":0.2484472049689441,\"region_call_in_time_pct\":0.2699434064656175,\"region_call_in_cnt\":40,\"region_call_out_time_pct\":0.08820030926608777,\"region_call_out_cnt_pct\":0.2032520325203252},{\"region_loc\":\"\\u5168\\u56fd\",\"region_uniq_num_cnt\":3,\"region_call_out_time\":0.1,\"region_avg_call_in_time\":0.22777777777777777,\"region_call_in_time\":0.6833333333333333,\"region_call_out_cnt\":1,\"region_avg_call_out_time\":0.1,\"region_call_in_cnt_pct\":0.018633540372670808,\"region_call_in_time_pct\":0.0031785409721683854,\"region_call_in_cnt\":3,\"region_call_out_time_pct\":0.0003568454859046033,\"region_call_out_cnt_pct\":0.008130081300813009},{\"region_loc\":\"\\u5317\\u4eac\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.425,\"region_call_in_time\":0.85,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.012422360248447204,\"region_call_in_time_pct\":0.003953794867819211,\"region_call_in_cnt\":2,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0},{\"region_loc\":\"\\u56db\\u5ddd\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":2.2,\"region_avg_call_in_time\":5.075,\"region_call_in_time\":10.15,\"region_call_out_cnt\":2,\"region_avg_call_out_time\":1.1,\"region_call_in_cnt_pct\":0.012422360248447204,\"region_call_in_time_pct\":0.047212962245135284,\"region_call_in_cnt\":2,\"region_call_out_time_pct\":0.007850600689901273,\"region_call_out_cnt_pct\":0.016260162601626018},{\"region_loc\":\"\\u6c5f\\u82cf\",\"region_uniq_num_cnt\":2,\"region_call_out_time\":1.25,\"region_avg_call_in_time\":0.11666666666666667,\"region_call_in_time\":0.11666666666666667,\"region_call_out_cnt\":1,\"region_avg_call_out_time\":1.25,\"region_call_in_cnt_pct\":0.006211180124223602,\"region_call_in_time_pct\":0.000542677726955578,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0.004460568573807541,\"region_call_out_cnt_pct\":0.008130081300813009},{\"region_loc\":\"\\u6cb3\\u5357\",\"region_uniq_num_cnt\":36,\"region_call_out_time\":251.06666666666666,\"region_avg_call_in_time\":1.2916666666666665,\"region_call_in_time\":144.66666666666666,\"region_call_out_cnt\":93,\"region_avg_call_out_time\":2.6996415770609317,\"region_call_in_cnt_pct\":0.6956521739130435,\"region_call_in_time_pct\":0.6729203814249166,\"region_call_in_cnt\":112,\"region_call_out_time_pct\":0.8959200666111573,\"region_call_out_cnt_pct\":0.7560975609756098},{\"region_loc\":\"\\u6d59\\u6c5f\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0.9,\"region_avg_call_in_time\":0,\"region_call_in_time\":0,\"region_call_out_cnt\":1,\"region_avg_call_out_time\":0.9,\"region_call_in_cnt_pct\":0,\"region_call_in_time_pct\":0,\"region_call_in_cnt\":0,\"region_call_out_time_pct\":0.0032116093731414295,\"region_call_out_cnt_pct\":0.008130081300813009},{\"region_loc\":\"\\u8fd0\\u8425\\u5546\",\"region_uniq_num_cnt\":1,\"region_call_out_time\":0,\"region_avg_call_in_time\":0.48333333333333334,\"region_call_in_time\":0.48333333333333334,\"region_call_out_cnt\":0,\"region_avg_call_out_time\":0,\"region_call_in_cnt_pct\":0.006211180124223602,\"region_call_in_time_pct\":0.0022482362973873945,\"region_call_in_cnt\":1,\"region_call_out_time_pct\":0,\"region_call_out_cnt_pct\":0}],\"application_check\":[{\"check_points\":{\"key_value\":\"\\u67f3\\u6052\\u535a\"},\"app_point\":\"user_name\"},{\"check_points\":{\"province\":\"\\u6cb3\\u5357\\u7701\",\"city\":\"\\u5e73\\u9876\\u5c71\\u5e02\",\"key_value\":\"410421199310091018\",\"gender\":\"\\u7537\",\"age\":24,\"financial_blacklist\":{\"arised\":false,\"black_type\":[]},\"court_blacklist\":{\"arised\":false,\"black_type\":[]},\"region\":\"\\u5b9d\\u4e30\\u53bf\"},\"app_point\":\"id_card\"},{\"check_points\":{\"website\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"check_ebusiness\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u53f7\\u7801\\u7684\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5(\\u65e0\\u7535\\u5546\\u6570\\u636e)\",\"key_value\":\"18339919633\",\"check_name\":\"\\u7528\\u6237\\u59d3\\u540d\\u4e0e\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u59d3\\u540d[**\\u535a]\\u5339\\u914d\\u6210\\u529f\",\"reg_time\":\"2012-09-15 10:52:04\",\"financial_blacklist\":{\"arised\":false,\"black_type\":[]},\"reliability\":\"\\u5b9e\\u540d\\u8ba4\\u8bc1\",\"check_idcard\":\"\\u7528\\u6237\\u8eab\\u4efd\\u8bc1\\u53f7\\u4e0e\\u8fd0\\u8425\\u5546\\u63d0\\u4f9b\\u7684\\u8eab\\u4efd\\u8bc1\\u53f7\\u7801[**************1018]\\u5339\\u914d\\u6210\\u529f\"},\"app_point\":\"cell_phone\"},{\"check_points\":{\"check_ebusiness\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u5c45\\u4f4f\\u5730\\u5740\\u7684\\u7535\\u5546\\u4f7f\\u7528\\u60c5\\u51b5(\\u65e0\\u7535\\u5546\\u6570\\u636e)\",\"key_value\":\"\",\"check_addr\":\"\\u65e0\\u6cd5\\u5b9a\\u4f4d\\u5c45\\u4f4f\\u5730\\u5740(\\u672a\\u63d0\\u4f9b\\u5c45\\u4f4f\\u5730\\u5740)\"},\"app_point\":\"home_addr\"},{\"check_points\":{\"check_mobile\":\"\\u65e0\\u6cd5\\u5224\\u65ad\\u8be5\\u5bb6\\u5ead\\u7535\\u8bdd\\u7684\\u901a\\u8bdd\\u60c5\\u51b5(\\u65e0\\u5bb6\\u5ead\\u7535\\u8bdd)\",\"key_value\":\"\"},\"app_point\":\"home_phone\"}],\"deliver_address\":[],\"report\":{\"rpt_id\":\"201806210938210003\",\"token\":\"13b0cb4dfedc4104a1042cf1f82f5145\",\"version\":\"4.2\",\"update_time\":\"2018-06-21T01:38:21.000Z\"},\"trip_info\":[{\"trip_dest\":\"\\u6cb3\\u5357\",\"trip_leave\":\"\\u4e0a\\u6d77\",\"trip_end_time\":\"2018-02-21\",\"trip_type\":\"\\u8282\\u5047\\u65e5\",\"trip_start_time\":\"2018-02-09\"},{\"trip_dest\":\"\\u6c5f\\u82cf\",\"trip_leave\":\"\\u4e0a\\u6d77\",\"trip_end_time\":\"2018-03-25\",\"trip_type\":\"\\u53cc\\u4f11\\u65e5\",\"trip_start_time\":\"2018-03-25\"},{\"trip_dest\":\"\\u6c5f\\u82cf\",\"trip_leave\":\"\\u4e0a\\u6d77\",\"trip_end_time\":\"2018-04-07\",\"trip_type\":\"\\u8282\\u5047\\u65e5\",\"trip_start_time\":\"2018-04-05\"}],\"_id\":\"5b2b0192a243fe0b23fc7b60\",\"cell_behavior\":[{\"phone_num\":\"18339919633\",\"behavior\":[{\"sms_cnt\":8,\"cell_phone_num\":\"18339919633\",\"net_flow\":777.23828125,\"total_amount\":-1,\"call_out_time\":18.333333333333332,\"cell_mth\":\"2018-06\",\"cell_loc\":\"\\u6cb3\\u5357\",\"call_cnt\":30,\"cell_operator_zh\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"call_out_cnt\":11,\"cell_operator\":\"chinamobileha\",\"call_in_time\":20.466666666666665,\"call_in_cnt\":19},{\"sms_cnt\":9,\"cell_phone_num\":\"18339919633\",\"net_flow\":1085.5556640625,\"total_amount\":72.87,\"call_out_time\":84.66666666666667,\"cell_mth\":\"2018-05\",\"cell_loc\":\"\\u6cb3\\u5357\",\"call_cnt\":29,\"cell_operator_zh\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"call_out_cnt\":15,\"cell_operator\":\"chinamobileha\",\"call_in_time\":12.666666666666666,\"call_in_cnt\":14},{\"sms_cnt\":13,\"cell_phone_num\":\"18339919633\",\"net_flow\":1153.4892578125,\"total_amount\":70,\"call_out_time\":33.63333333333333,\"cell_mth\":\"2018-04\",\"cell_loc\":\"\\u6cb3\\u5357\",\"call_cnt\":59,\"cell_operator_zh\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"call_out_cnt\":30,\"cell_operator\":\"chinamobileha\",\"call_in_time\":54.95,\"call_in_cnt\":29},{\"sms_cnt\":10,\"cell_phone_num\":\"18339919633\",\"net_flow\":765.328125,\"total_amount\":70,\"call_out_time\":46.36666666666667,\"cell_mth\":\"2018-03\",\"cell_loc\":\"\\u6cb3\\u5357\",\"call_cnt\":47,\"cell_operator_zh\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"call_out_cnt\":13,\"cell_operator\":\"chinamobileha\",\"call_in_time\":45.21666666666667,\"call_in_cnt\":34},{\"sms_cnt\":14,\"cell_phone_num\":\"18339919633\",\"net_flow\":1425.669921875,\"total_amount\":70,\"call_out_time\":43.2,\"cell_mth\":\"2018-02\",\"cell_loc\":\"\\u6cb3\\u5357\",\"call_cnt\":87,\"cell_operator_zh\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"call_out_cnt\":40,\"cell_operator\":\"chinamobileha\",\"call_in_time\":40.166666666666664,\"call_in_cnt\":47},{\"sms_cnt\":14,\"cell_phone_num\":\"18339919633\",\"net_flow\":945.08984375,\"total_amount\":70,\"call_out_time\":54.03333333333333,\"cell_mth\":\"2018-01\",\"cell_loc\":\"\\u6cb3\\u5357\",\"call_cnt\":32,\"cell_operator_zh\":\"\\u6cb3\\u5357\\u79fb\\u52a8\",\"call_out_cnt\":14,\"cell_operator\":\"chinamobileha\",\"call_in_time\":41.516666666666666,\"call_in_cnt\":18}]}]},\"success\":\"true\"}', '2018-06-21 09:40:04', '2018-06-21 09:40:04');

-- ----------------------------
-- Table structure for `borrower_fund_record`
-- ----------------------------
DROP TABLE IF EXISTS `borrower_fund_record`;
CREATE TABLE `borrower_fund_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID，关联users.id',
  `amt` int(11) NOT NULL COMMENT '资金金额，单位为分',
  `deal` tinyint(4) NOT NULL COMMENT '交易类型，1/借款 2/还款 3/手续费 4/自动还款银行卡代扣',
  `entry` tinyint(4) NOT NULL COMMENT '出入类型，1/入账 2/出账',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8 COMMENT='借款人资金记录';

-- ----------------------------
-- Records of borrower_fund_record
-- ----------------------------
INSERT INTO `borrower_fund_record` VALUES ('359', '264', '100000', '1', '1', '2018-07-02 14:22:38', '2018-07-02 14:22:38');
INSERT INTO `borrower_fund_record` VALUES ('360', '248', '200000', '1', '1', '2018-07-02 14:22:39', '2018-07-02 14:22:39');

-- ----------------------------
-- Table structure for `borrower_repay`
-- ----------------------------
DROP TABLE IF EXISTS `borrower_repay`;
CREATE TABLE `borrower_repay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID，关联users.id',
  `pid` int(11) NOT NULL COMMENT '项目标的ID，关联project.id',
  `lid` int(11) NOT NULL COMMENT '借款申请ID，关联loan_apply.id',
  `corpus` int(11) NOT NULL COMMENT '还款本金，单位为分',
  `interest` int(11) NOT NULL COMMENT '还款利息(借款利息)，单位为分',
  `invest_interest` int(11) NOT NULL COMMENT '还款利息(投资利息)，单位为分',
  `period` int(11) NOT NULL COMMENT '还款期数',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态，0/无效数据 1/未还 2/正常还款 3/逾期还款 4/逾期未还',
  `repay_time` int(11) NOT NULL COMMENT '应还日期，时间戳',
  `overdue_date` int(11) NOT NULL DEFAULT '0' COMMENT '逾期日期',
  `overdue_day` int(11) NOT NULL DEFAULT '0' COMMENT '逾期天数',
  `overdue_interest` int(11) NOT NULL DEFAULT '0' COMMENT '逾期罚息，单位为分',
  `overdue_repay_time` int(11) NOT NULL DEFAULT '0' COMMENT '逾期还款时间',
  `repay_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '还款类型，1/自动还款 2/提前还款',
  `working_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '执行状态，0/无异常 1/还款异常',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `pid` (`pid`),
  KEY `lid` (`lid`),
  KEY `repay_time` (`repay_time`)
) ENGINE=InnoDB AUTO_INCREMENT=352 DEFAULT CHARSET=utf8 COMMENT='借款人还款记录';

-- ----------------------------
-- Records of borrower_repay
-- ----------------------------
INSERT INTO `borrower_repay` VALUES ('346', '264', '113', '123', '33333', '1500', '699', '1', '1', '1533139200', '0', '0', '0', '0', '1', '0', '2018-07-02 14:22:38', '2018-07-02 14:22:38');
INSERT INTO `borrower_repay` VALUES ('347', '264', '113', '123', '33333', '1500', '699', '2', '1', '1535817600', '0', '0', '0', '0', '1', '0', '2018-07-02 14:22:38', '2018-07-02 14:22:38');
INSERT INTO `borrower_repay` VALUES ('348', '264', '113', '123', '33334', '1500', '702', '3', '1', '1538409600', '0', '0', '0', '0', '1', '0', '2018-07-02 14:22:38', '2018-07-02 14:22:38');
INSERT INTO `borrower_repay` VALUES ('349', '248', '114', '124', '66666', '3000', '1399', '1', '1', '1533139200', '0', '0', '0', '0', '1', '0', '2018-07-02 14:22:39', '2018-07-02 14:22:39');
INSERT INTO `borrower_repay` VALUES ('350', '248', '114', '124', '66666', '3000', '1399', '2', '1', '1535817600', '0', '0', '0', '0', '1', '0', '2018-07-02 14:22:39', '2018-07-02 14:22:39');
INSERT INTO `borrower_repay` VALUES ('351', '248', '114', '124', '66668', '3000', '1402', '3', '1', '1538409600', '0', '0', '0', '0', '1', '0', '2018-07-02 14:22:39', '2018-07-02 14:22:39');

-- ----------------------------
-- Table structure for `debt_assignment`
-- ----------------------------
DROP TABLE IF EXISTS `debt_assignment`;
CREATE TABLE `debt_assignment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_uid` int(11) DEFAULT NULL COMMENT '出手人id',
  `to_uid` int(11) DEFAULT NULL COMMENT '接手人id',
  `from_lender_invest_num` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '债转的投资记录出借编号',
  `status` tinyint(2) DEFAULT NULL COMMENT '1:转让中 2:成功 3:失败',
  `all_terms` int(11) DEFAULT '0' COMMENT '总期数',
  `left_terms` int(11) DEFAULT '0' COMMENT '剩余期数 单位是月',
  `debt_money` int(11) DEFAULT '0' COMMENT '债转金额 单位分',
  `fact_all_amount` int(11) DEFAULT '0' COMMENT '回款本息',
  `debt_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '债转编号',
  `created_at` timestamp NULL,
  `updated_at` timestamp NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='投资人债转表';

-- ----------------------------
-- Records of debt_assignment
-- ----------------------------
INSERT INTO `debt_assignment` VALUES ('61', '178', '178', 'SB201807021421061783496', '1', '3', '3', '133000', '144172', 'JQ201807021426411781669', '2018-07-02 14:26:41', '2018-07-02 14:26:41');
INSERT INTO `debt_assignment` VALUES ('62', '178', '266', 'HB201807021420191783127', '2', '3', '3', '100000', '99800', 'JQ201807021426481788832', '2018-07-02 14:26:48', '2018-07-02 14:28:21');
INSERT INTO `debt_assignment` VALUES ('63', '266', '178', 'SB201807021428202668457', '2', '3', '3', '100000', '100000', 'JQ201807021426481788832', '2018-07-02 14:34:59', '2018-07-02 14:35:58');
INSERT INTO `debt_assignment` VALUES ('64', '266', '178', 'HB201807021421432667558', '2', '3', '3', '67000', '67000', 'JQ201807021439242663646', '2018-07-02 14:39:24', '2018-07-02 14:39:35');

-- ----------------------------
-- Table structure for `feedback`
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL COMMENT '反馈内容',
  `mobile` varchar(20) DEFAULT NULL COMMENT '联系方式',
  `type` tinyint(4) NOT NULL COMMENT '类型  1/借款端  2/理财端',
  `feedback_type` tinyint(4) NOT NULL COMMENT '反馈类型',
  `create_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='意见反馈表';

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES ('38', '在借款页点击“常见问题”点击“借款攻略”在产品详情页在产品详情页，点击“个人信息授权协议” 在产品详情页，点击“立即申请”按钮在产品详情页，点击个人资料的“待验证”在个人资料验证页面基本信息--学历信', null, '1', '1', '2018-04-27 17:15:51');
INSERT INTO `feedback` VALUES ('39', '1234567890', null, '1', '1', '2018-04-27 17:17:18');
INSERT INTO `feedback` VALUES ('40', '发个皇冠夫妇刚好紧急集合', '1346899323699632359', '2', '0', '2018-04-27 17:25:00');
INSERT INTO `feedback` VALUES ('41', '鳄鱼湖人缘好大概好久徐黄金回购', '喝会', '2', '0', '2018-04-28 14:29:50');
INSERT INTO `feedback` VALUES ('42', '鳄鱼湖DJ会计从业资格证吗', null, '2', '0', '2018-05-01 13:25:20');
INSERT INTO `feedback` VALUES ('43', 'Rhkjhgy', null, '2', '0', '2018-05-01 16:36:58');
INSERT INTO `feedback` VALUES ('44', '哼哼唧唧姐姐你能健健康康', '抱抱你', '2', '0', '2018-05-01 17:41:10');
INSERT INTO `feedback` VALUES ('45', '日i发个红i看2饿康康的时候到了', '135u899', '2', '0', '2018-05-01 21:28:32');
INSERT INTO `feedback` VALUES ('46', '不能注册，搞啥子！？？？？？？？？？？？？？，字少了不能体检也不提示！！！！！！！！！！！！', null, '1', '3', '2018-05-15 09:53:34');
INSERT INTO `feedback` VALUES ('47', '考虑考虑啦咯啦咯啦咯啦咯急急急', '11111111', '2', '0', '2018-06-01 15:40:52');
INSERT INTO `feedback` VALUES ('48', '啦咯啦咯啦咯啦咯考虑考虑', null, '1', '1', '2018-06-04 10:51:30');
INSERT INTO `feedback` VALUES ('49', '啊啊啊吧backKKK急急急', null, '2', '1', '2018-06-05 09:55:27');
INSERT INTO `feedback` VALUES ('50', '啊啊啊啊啦咯啦咯啦咯啦咯啊啊啊吧', null, '1', '1', '2018-06-06 16:03:16');
INSERT INTO `feedback` VALUES ('51', '啊啊啊啊啊啊啊吧啊啊啊', null, '1', '1', '2018-06-10 13:52:53');
INSERT INTO `feedback` VALUES ('52', '试试', '15000019498', '2', '1', '2018-06-22 10:04:59');

-- ----------------------------
-- Table structure for `fund_freeze_record`
-- ----------------------------
DROP TABLE IF EXISTS `fund_freeze_record`;
CREATE TABLE `fund_freeze_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial_num` varchar(50) NOT NULL COMMENT '流水号',
  `pid` int(11) NOT NULL COMMENT '产品ID，关联project.id',
  `table_name` tinyint(4) NOT NULL COMMENT '交易来源的表名，1/lender_invest 2/borrower_repay',
  `amt` int(11) NOT NULL COMMENT '交易金额，单位为分',
  `from_uid` int(11) NOT NULL COMMENT '出账用户ID',
  `to_uid` int(11) DEFAULT NULL COMMENT '入账用户ID',
  `status` tinyint(4) NOT NULL COMMENT '状态，1/划拨预冻结 2/解冻 3/冻结',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serial_num` (`serial_num`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8 COMMENT='资金冻结记录表';

-- ----------------------------
-- Records of fund_freeze_record
-- ----------------------------
INSERT INTO `fund_freeze_record` VALUES ('247', '201807021420191781135402', '113', '1', '33333', '178', '264', '2', '2018-07-02 14:20:19', '2018-07-02 14:22:39');
INSERT INTO `fund_freeze_record` VALUES ('248', '201807021420191781147073', '114', '1', '66667', '178', '248', '2', '2018-07-02 14:20:19', '2018-07-02 14:22:40');
INSERT INTO `fund_freeze_record` VALUES ('249', '201807021421069064', '114', '1', '133000', '178', '248', '2', '2018-07-02 14:21:06', '2018-07-02 14:22:40');
INSERT INTO `fund_freeze_record` VALUES ('250', '201807021421432661132014', '113', '1', '66667', '266', '264', '2', '2018-07-02 14:21:43', '2018-07-02 14:22:39');
INSERT INTO `fund_freeze_record` VALUES ('251', '201807021421432661147218', '114', '1', '333', '266', '248', '2', '2018-07-02 14:21:43', '2018-07-02 14:22:40');

-- ----------------------------
-- Table structure for `fy_account`
-- ----------------------------
DROP TABLE IF EXISTS `fy_account`;
CREATE TABLE `fy_account` (
  `uid` varchar(20) NOT NULL COMMENT '用户ID，关联users.id',
  `full_name` varchar(10) NOT NULL COMMENT '姓名',
  `id_card` varchar(18) NOT NULL COMMENT '身份证号码',
  `mobile` varchar(11) NOT NULL COMMENT '预留手机号',
  `sign_status` tinyint(3) DEFAULT '0' COMMENT '签约状态，用于快捷充值和委托充值，0/未签约 1/已签约',
  `usci` varchar(50) DEFAULT NULL COMMENT '统一社会信用代码',
  `org_name` varchar(50) DEFAULT NULL COMMENT '机构名称',
  `tw_user_id` varchar(50) DEFAULT NULL COMMENT '天威合同用户编号',
  `bank_card` varchar(20) NOT NULL COMMENT '银行卡号',
  `bank_code` varchar(10) NOT NULL COMMENT '银行编号',
  `area_code` varchar(10) NOT NULL COMMENT '地区编号',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='富友账户表';

-- ----------------------------
-- Records of fy_account
-- ----------------------------
INSERT INTO `fy_account` VALUES ('140', '潘嘉伟', '34082719921023137X', '17601279633', '0', null, null, '', '6217000010113912132', '0105', '1000', '2018-04-24 02:35:10', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('177', '朱玲玲', '412702198907201042', '15939464866', '0', '', '', '', '6214832144277006', '0308', '2900', '2018-04-23 10:18:20', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('178', '孟祥', '411122199209120153', '15518212052', '1', null, null, 'd92bdc8b-7044-4d2c-a485-6d8ef0516c8f', '6217003810026896707', '0105', '3771', '2018-06-08 16:07:10', '2018-07-02 14:22:58');
INSERT INTO `fy_account` VALUES ('188', '冯晓杰', '610322199102103916', '15618320519', '1', null, null, '', '6214832158164948', '0308', '2900', '2018-05-22 17:55:39', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('229', '唐庆斌', '350103199309204219', '13120733632', '1', null, '', '', '6212261405366661234', '0102', '6872', '2018-04-25 01:59:52', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('246', '李维勇', '341125199010188733', '17621626013', null, null, null, '', '6217880800014087458', '0104', '2900', '2018-06-08 15:41:41', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('247', '宋邦', '642101196602033759', '18334795112', null, null, null, '', '6227002470170278193', '0105', '5956', '2018-06-08 15:43:39', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('248', '陈慧清', '140721199306250048', '18334795116', '1', null, null, '2218ffa0-bb05-443d-be32-71f78b825c71', '6227000260310117968', '0403', '3363', '2018-05-31 10:42:54', '2018-07-02 14:22:58');
INSERT INTO `fy_account` VALUES ('249', '房尧鑫', '142703199209033315', '15000019498', '0', null, null, '', '6214832132290425', '0308', '2900', '2018-06-22 09:34:37', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('261', '巴辉', '451302196805217831', '18621389073', '0', null, null, '', '4367421147620083682', '0105', '6872', '2018-06-20 13:48:20', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('264', '李冲冲', '411422199302283025', '18236968869', '1', null, null, 'd5c92e44-5e1b-4a9b-bad5-8a94860c3396', '6212261001030245010', '0102', '2900', '2018-06-12 11:43:31', '2018-07-02 14:24:31');
INSERT INTO `fy_account` VALUES ('265', '郑寅材', '510321199603012158', '17607155535', '1', null, null, '', '621756080009241489', '0104', '2900', '2018-06-20 14:08:19', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('266', '柳恒博', '410421199310091018', '18339919633', '1', null, null, 'd8c071c0-296c-43d1-8725-cd45e32f145c', '6217920110814170', '0310', '2900', '2018-06-21 09:41:49', '2018-07-02 14:34:32');
INSERT INTO `fy_account` VALUES ('267', '许睿杰', '352201199501052133', '18018568025', '0', null, null, '', '6214832154293703', '0308', '2900', '2018-06-21 09:50:52', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('A1', '胡雄', '422324198309261617', '13817075080', '0', '913101095631246804', '上海挖宝金融信息服务有限公司', '485ab27c-efce-40e4-80c1-cbfa895791db', '', '', '', '2018-04-10 19:05:39', '2018-07-02 14:22:58');
INSERT INTO `fy_account` VALUES ('B115', '赵晨光', '32128419940912301X', '18221503642', '0', null, null, '', '6214832144277006', '0308', '2900', '2018-04-27 18:52:32', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('B119', '赵国庆', '410928198909012256', '18321003076', '0', null, '', '', '6214832140721593', '0308', '2900', '2018-04-25 14:47:20', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('B133', '朱玲玲', '412702198907201042', '17612163365', '0', null, null, '', '6214832144277006', '0308', '1000', '2018-05-02 01:52:44', '2018-05-22 17:12:38');
INSERT INTO `fy_account` VALUES ('B139', '王晶晶', '360424198612140014', '13472551505', '0', null, null, '', '6214830212447931', '0308', '2900', '2018-05-02 01:24:39', '2018-05-22 17:12:39');
INSERT INTO `fy_account` VALUES ('B140', '田文涛', '310105198209303616', '18616831588', '0', null, null, '', '6226090215483807', '0308', '2900', '2018-05-02 01:49:38', '2018-05-22 17:12:41');
INSERT INTO `fy_account` VALUES ('B202', '何春艳', '342423198803141169', '18616711570', '0', null, null, '', '6227001217940154497', '0105', '2900', '2018-05-15 23:26:51', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('B204', '陈琴', '511324199101195409', '18321177331', '0', null, null, '', '6212251001002942794', '0102', '2900', '2018-05-16 11:07:23', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC10', '顾军', '320623197904273516', '13901470052', '0', null, null, '', '6228480424000595613', '0103', '3060', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC100', '滕云青', '330523196806300025', '15857241060', '0', null, null, '', '6228480359410593578', '0103', '3363', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC101', '王国芳', '330523197201160749', '13362217771', '0', null, null, '', '6230210810023998', '0304', '3360', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC103', '应红', '330523197411101122', '18606727858', '0', null, null, '', '6222021205007829322', '0102', '3363', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC104', '徐学平', '320911197511121950', '13921888893', '0', null, null, '', '6214835151908777', '0308', '3110', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC105', '陈锦然', '320624196502125010', '18451082373', '0', null, null, '', '6217001270003421684', '0105', '3060', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC111', '张选民', '330523195403190015', '13666538489', '0', null, null, '', '6222801447191121712', '0105', '3363', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC1111', '潘强龙', '430624199505244217', '13548911897', null, null, null, '', '6217002970103443574', '0105', '3310', '2018-06-08 10:11:09', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC1112', '简军', '510603198605212232', '13568239936', null, null, null, '', '6217003600003718481', '0105', '6580', '2018-06-08 10:16:53', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC113', '许洁', '320203198707080325', '15251522341', '0', null, null, '', '6222600150013367876', '0301', '3020', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC120', '徐立', '321020197103200017', '18936008766', '0', null, null, '', '6013826107009499684', '0104', '3128', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC123', '徐亮', '321202198710071213', '15052804231', '0', null, null, '', '6216666100000372473', '0104', '3128', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC125', '陈丽芳', '32090219830506106X', '15906173512', '0', null, null, '', '6217866100002062086', '0104', '3020', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC127', '朱悦', '320911199301011226', '18262380530', '0', null, null, '', '6214852102443242', '0308', '2900', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC128', '李志清', '320901196602280028', '18305103723', '0', null, null, '', '6217856100071755554', '0104', '3110', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC133', '王吉云', '320624195904184326', '15189412821', '0', null, null, '', '6217001270006460465', '0105', '3060', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC134', '龚大芳', '330523196310205016', '15167218802', '0', null, null, '', '6217001440008022064', '0105', '3363', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC137', '邢潇', '330683198805231225', '18368261988', '0', null, null, '', '6214835756035109', '0308', '3370', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC139', '吕生钗', '330623197103127529', '15068559000', '0', null, null, '', '6228480373259853811', '0103', '3370', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC140', '金丹青', '330623197207051944', '13567505005', '0', null, null, '', '6222021211001118597', '0102', '3373', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC143', '娄丽', '330623198207143886', '15381666196', '0', null, null, '', '6222021211006335469', '0102', '3373', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC152', '段志华', '432502197105021013', '15773894228', '0', null, null, '', '6236683030000797303', '0105', '5620', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC153', '周元营', '371324196702021914', '15689579679', '0', null, null, '', '6236682290002760334', '0105', '4730', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC155', '陆俊秀', '32092319710712184X', '18921882488', '0', null, null, '', '6225210402933197', '0310', '3110', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC158', '徐成平', '330523197109186217', '13587270586', '0', null, null, '', '4367421447170018637', '0105', '3363', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC168', '叶美红', '330523197001203222', '13957270167', '0', null, null, '', '6236681440000059376', '0105', '3360', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC17', '浦祖浩', '310109195711213239', '13386136589', '0', null, null, '', '6222021001021760787', '0102', '2900', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC170', '张稳兰', '321020196608230022', '18651165579', '0', null, null, '', '6217001310000931432', '0105', '3128', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC175', '尹曼丽', '330502196901081025', '13588511501', '0', null, null, '', '6222021211000028201', '0102', '3370', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC179', '裘淑萍', '330522196501291029', '13362289922', '0', null, null, '', '9558821205000490599', '0102', '3362', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC180', '王凌仙', '330502196211220446', '13705729179', '0', null, null, '', '6214855720011812', '0308', '3360', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC182', '陈丽新', '330502196806271023', '13705720830', '0', null, null, '', '6228430359639250175', '0103', '3360', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC184', '李小萍', '330523196201225245', '18957275339', '0', null, null, '', '6222081205000787565', '0102', '3360', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC19', '林君瑶', '330323197312114437', '13868762555', '0', null, null, '', '6228480332939469216', '0103', '3333', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC190', '伊玲玲', '330523195304160021', '15306721620', '0', null, null, '', '6236681440000871184', '0105', '3363', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC193', '褚占丰', '330501198205137999', '15325477156', '0', null, null, '', '6222021205002204455', '0102', '3360', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC198', '张荣富', '330523194810023914', '13058945536', '0', null, null, '', '6217001440006733498', '0105', '3363', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC20', '余永兰', '532625196607140521', '15096529917', '0', null, null, '', '6217003920005562350', '0105', '7450', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC207', '张思凡', '230103199309074816', '15636083269', '0', null, null, '', '6212261001090004604', '0102', '2900', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC22', '吴丹红', '310228197808161467', '13681955960', '0', null, null, '', '6214852102435339', '0308', '2900', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC25', '韩亮', '320219198304058511', '15052151808', '0', null, null, '', '6222021103017677700', '0102', '3020', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC26', '吴晓龙', '320281198804178016', '13921205085', '0', null, null, '', '6214855110443195', '0308', '3022', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC27', '冯凌波', '320281198803202774', '13771294544', '0', null, null, '', '6225885110792785', '0308', '3022', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC29', '马守超', '320721198611192816', '18616396346', '0', null, null, '', '6212261001024433416', '0102', '2900', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC3', '徐鹏', '61030219780610201X', '13795384523', '0', null, null, '', '6214850214013325', '0308', '2900', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC33', '张帆', '330523197712070032', '18657299033', '0', null, null, '', '6217231205003962933', '0102', '3360', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC34', '方红英', '330523197009173224', '15557230377', '0', null, null, '', '6217231205003259033', '0102', '3360', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC36', '胡超', '330421198412023513', '13868049840', '0', null, null, '', '6222021202040175680', '0102', '3310', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC4', '李国', '310228198208312430', '13774456044', '0', null, null, '', '6214832137042862', '0308', '2900', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC40', '赵迪', '230802198806191316', '15052127989', '0', null, null, '', '6214835104565138', '0308', '3020', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC42', '李宗培', '342501198810295614', '13636547050', '0', null, null, '', '6222021001104119232', '0102', '2900', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC45', '刘怡雯', '320203199805012523', '15961818085', '0', null, null, '', '6212811103000712386', '0102', '3020', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC50', '周宇逸', '320682199404220038', '13912203051', '0', null, null, '', '6217906100008477603', '0104', '3060', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC53', '於小琴', '320623197911073520', '13814705558', '0', null, null, '', '6228450420017380813', '0103', '3060', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC58', '何国英', '330523196205161824', '13567273856', '0', null, null, '', '6222081205001140160', '0102', '3363', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC60', '王玉宇', '330523194910060042', '13666535057', '0', null, null, '', '6228480350237504716', '0103', '3363', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC62', '傅丹华', '330423196312050622', '13705731392', '0', null, null, '', '6222081204000243703', '0102', '3350', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC63', '王瑞芬', '330523195203260023', '18006636171', '0', null, null, '', '4340621440138471', '0105', '3363', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC64', '周加园', '33052319640714001x', '13967273061', '0', null, null, '', '4340611440082621', '0105', '3363', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC65', '方红菊', '33052319690131322x', '15067254952', '0', null, null, '', '6228480350695892314', '0103', '3363', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC67', '贺欣', '330501198211100842', '13735123878', '0', null, null, '', '6217001440002250588', '0105', '3363', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC68', '钱冬妹', '33048219811211212X', '13705830658', '0', null, null, '', '6214835731185706', '0308', '3350', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC69', '万志江', '330421197809011516', '13757311162', '0', null, null, '', '6212261204005179350', '0102', '3351', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC71', '沈水珍', '330523194908070022', '15968238299', '0', null, null, '', '6217001440007777106', '0105', '3363', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC73', '黄华锋', '452423197607144419', '18666466748', '0', null, null, '', '6228480606693370474', '0103', '6020', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC74', '汤爱珍', '330523195809240027', '13175221077', '0', null, null, '', '6228480351145150014', '0103', '3363', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC82', '吴法琴', '33052319640629472x', '13666535516', '0', null, null, '', '6228480358683881272', '0103', '3363', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC89', '叶利平', '330523196903240917', '13735176900', '0', null, null, '', '6216616204000594622', '0104', '3363', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC9', '章燕华', '652823197912083025', '13918647830', '0', null, null, '', '6222001001105550801', '0102', '2900', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC94', '王幸秀', '320219196707297024', '13961697988', '0', null, null, '', '6222600150010674977', '0301', '3022', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC95', '王双凤', '330523194505095428', '13587914071', '0', null, null, '', '6217231205001029628', '0102', '3363', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC98', '王兆火', '33052319440816361x', '13094849327', '0', null, null, '', '6222081205002073220', '0102', '3363', '2018-05-16 16:06:36', '2018-06-28 16:32:18');
INSERT INTO `fy_account` VALUES ('BC99', '章蕴珠', '330523196312316262', '13868285323', '0', null, null, '', '6217993300002035662', '0403', '3363', '2018-05-16 16:06:36', '2018-06-28 16:32:18');

-- ----------------------------
-- Table structure for `fy_bank`
-- ----------------------------
DROP TABLE IF EXISTS `fy_bank`;
CREATE TABLE `fy_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '银行名称',
  `code` varchar(10) CHARACTER SET utf8 NOT NULL COMMENT '银行编码',
  `entrust_once_money` int(11) NOT NULL COMMENT '快速/委托充值，次限额（元）',
  `entrust_day_money` int(11) NOT NULL COMMENT '快速/委托充值，日限额（元）',
  `entrust_day_num` int(11) NOT NULL COMMENT '快速/委托充值，日限次数（次）',
  `entrust_month_money` int(11) NOT NULL COMMENT '快速/委托充值，月限额（元）',
  `quick_once_money` int(11) NOT NULL COMMENT '手机快捷充值，次限额（元）',
  `quick_day_money` int(11) NOT NULL COMMENT '手机快捷充值，日限额（元）',
  `quick_day_num` int(11) NOT NULL COMMENT '手机快捷充值，日限次数（次）',
  `quick_month_money` int(11) NOT NULL COMMENT '手机快捷充值，月限额（元）',
  `remark` varchar(150) CHARACTER SET utf8 NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='富友支付的银行和限额';

-- ----------------------------
-- Records of fy_bank
-- ----------------------------
INSERT INTO `fy_bank` VALUES ('1', '中国工商银行', '0102', '50000', '50000', '0', '500000', '50000', '50000', '0', '1000000', '银行系统处理能力较弱，代收常报：“无效商户”，建议上午处理较好。常见不支持银行卡见充值失败常见银行卡菜单。');
INSERT INTO `fy_bank` VALUES ('3', '中国银行', '0104', '50000', '500000', '0', '0', '50000', '1000000', '0', '1000000', '芯片卡暂不支持签约');
INSERT INTO `fy_bank` VALUES ('4', ' 中国建设银行 ', '0105', '50000', '100000', '0', '500000', '50000', '100000', '0', '1000000', '621700，622707准贷记卡，421349、434061、434062开头的乐当家白金卡，不支持交易。');
INSERT INTO `fy_bank` VALUES ('5', '中国交通银行', '0301', '50000', '50000', '0', '0', '50000', '50000', '0', '1000000', '常见不支持银行卡见充值失败常见银行卡菜单。');
INSERT INTO `fy_bank` VALUES ('6', '中信实业银行', '0302', '1000', '1000', '0', '2000', '1000', '1000', '0', '20000', '常见不支持银行卡见充值失败常见银行卡菜单。');
INSERT INTO `fy_bank` VALUES ('7', '中国光大银行 ', '0303', '50000', '50000', '0', '500000', '50000', '50000', '0', '1000000', '常见不支持银行卡见充值失败常见银行卡菜单。');
INSERT INTO `fy_bank` VALUES ('10', '广东发展银行', '0306', '50000', '500000', '0', '0', '100000', '200000', '0', '1000000', '常见不支持银行卡见充值失败常见银行卡菜单。');
INSERT INTO `fy_bank` VALUES ('11', '平安银行股份有限公司', '0307', '50000', '50000', '0', '500000', '50000', '50000', '0', '1000000', '卡号以623058开头的卡不支持交易。芯片卡暂不支持签约。');
INSERT INTO `fy_bank` VALUES ('13', '兴业银行', '0309', '50000', '50000', '0', '500000', '50000', '50000', '0', '1000000', '卡号以622908，622909，966666开头的兴业自然人生理财卡，不支持交易。');
INSERT INTO `fy_bank` VALUES ('14', '上海浦东发展银行', '0310', '50000', '300000', '0', '500000', '50000', '200000', '0', '1000000', '常见不支持银行卡见充值失败常见银行卡菜单。');
INSERT INTO `fy_bank` VALUES ('15', '国家邮政局邮政储汇局', '0403', '5000', '5000', '0', '500000', '5000', '5000', '0', '1000000', '广东地区的邮储不支持交易。');

-- ----------------------------
-- Table structure for `fy_bank_area`
-- ----------------------------
DROP TABLE IF EXISTS `fy_bank_area`;
CREATE TABLE `fy_bank_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '地区名称',
  `code` varchar(10) CHARACTER SET utf8 NOT NULL COMMENT '城市/县编码',
  `level` tinyint(4) NOT NULL COMMENT '地区级别，1/省份 2/市，县',
  `code_id` varchar(10) CHARACTER SET utf8 NOT NULL DEFAULT '0' COMMENT '省份编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2187 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='富友银行卡所属地区';

-- ----------------------------
-- Records of fy_bank_area
-- ----------------------------
INSERT INTO `fy_bank_area` VALUES ('1', '彭水县', '6875', '2', '500');
INSERT INTO `fy_bank_area` VALUES ('2', '塞浦路斯', '0357', '2', '000');
INSERT INTO `fy_bank_area` VALUES ('3', '中国', '0086', '2', '000');
INSERT INTO `fy_bank_area` VALUES ('4', '日本', '0081', '2', '000');
INSERT INTO `fy_bank_area` VALUES ('5', '香港', '0852', '2', '000');
INSERT INTO `fy_bank_area` VALUES ('6', '新加坡', '0065', '2', '000');
INSERT INTO `fy_bank_area` VALUES ('7', '马来西亚', '0060', '2', '000');
INSERT INTO `fy_bank_area` VALUES ('8', '北京市', '1000', '2', '110');
INSERT INTO `fy_bank_area` VALUES ('9', '天津市', '1100', '2', '120');
INSERT INTO `fy_bank_area` VALUES ('10', '石家庄市', '1210', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('11', '唐山市', '1240', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('12', '滦县', '1243', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('13', '滦南县', '1244', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('14', '乐亭县', '1245', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('15', '迁安市', '1246', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('16', '迁西县', '1247', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('17', '遵化市', '1248', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('18', '玉田县', '1249', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('19', '唐海县', '1251', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('20', '秦皇岛市', '1260', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('21', '青龙满族自治县', '1261', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('22', '昌黎县', '1262', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('23', '抚宁县', '1263', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('24', '卢龙县', '1264', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('25', '邯郸市', '1270', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('26', '邯郸县', '1271', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('27', '大名县', '1281', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('28', '魏县', '1282', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('29', '曲周县', '1283', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('30', '邱县', '1284', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('31', '鸡泽县', '1285', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('32', '肥乡县', '1286', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('33', '广平县', '1287', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('34', '成安县', '1288', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('35', '临漳县', '1289', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('36', '磁县', '1291', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('37', '涉县', '1292', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('38', '永年县', '1293', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('39', '馆陶县', '1294', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('40', '武安市', '1295', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('41', '邢台市', '1310', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('42', '邢台县', '1311', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('43', '南宫市', '1321', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('44', '沙河市', '1322', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('45', '临城县', '1323', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('46', '内丘县', '1324', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('47', '柏乡县', '1325', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('48', '隆尧县', '1326', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('49', '任县', '1327', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('50', '南和县', '1328', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('51', '宁晋县', '1329', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('52', '巨鹿县', '1331', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('53', '新河县', '1332', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('54', '广宗县', '1333', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('55', '平乡县', '1334', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('56', '威县', '1335', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('57', '清河县', '1336', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('58', '临西县', '1337', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('59', '保定市', '1340', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('60', '满城县', '1341', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('61', '清苑县', '1342', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('62', '定州市', '1351', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('63', '涿州市', '1352', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('64', '易县', '1353', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('65', '徐水县', '1354', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('66', '涞源县', '1355', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('67', '定兴县', '1356', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('68', '顺平县', '1357', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('69', '唐县', '1358', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('70', '望都县', '1359', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('71', '涞水县', '1361', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('72', '高阳县', '1362', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('73', '安新县', '1363', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('74', '雄县', '1364', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('75', '容城县', '1365', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('76', '高碑店市', '1366', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('77', '曲阳县', '1367', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('78', '阜平县', '1368', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('79', '安国市', '1369', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('80', '博野县', '1371', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('81', '蠡县', '1372', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('82', '张家口市', '1380', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('83', '宣化县', '1381', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('84', '张北县', '1391', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('85', '康保县', '1392', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('86', '沽源县', '1393', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('87', '尚义县', '1394', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('88', '蔚县', '1395', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('89', '阳原县', '1396', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('90', '怀安县', '1397', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('91', '万全县', '1398', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('92', '怀来县', '1399', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('93', '涿鹿县', '1401', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('94', '赤城县', '1402', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('95', '崇礼县', '1403', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('96', '承德市', '1410', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('97', '承德县', '1411', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('98', '宽城县', '1421', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('99', '兴隆县', '1422', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('100', '平泉县', '1423', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('101', '滦平县', '1424', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('102', '丰宁满族自治县', '1425', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('103', '隆化县', '1426', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('104', '围场县', '1427', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('105', '沧州市', '1430', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('106', '沧县', '1431', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('107', '青县', '1432', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('108', '泊头市', '1441', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('109', '任丘市', '1442', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('110', '河间市', '1443', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('111', '肃宁县', '1444', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('112', '献县', '1445', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('113', '吴桥县', '1446', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('114', '东光县', '1447', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('115', '南皮县', '1448', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('116', '盐山县', '1449', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('117', '黄骅市', '1451', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('118', '孟村回族自治县', '1452', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('119', '海兴县', '1453', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('120', '廊坊市', '1460', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('121', '三河市', '1461', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('122', '固安县', '1462', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('123', '永清县', '1463', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('124', '香河县', '1464', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('125', '大城县', '1465', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('126', '文安县', '1466', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('127', '霸州', '1467', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('128', '大厂回族自治县', '1468', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('129', '衡水市', '1480', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('130', '冀州', '1482', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('131', '枣强县', '1483', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('132', '武邑县', '1484', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('133', '深州市', '1485', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('134', '武强县', '1486', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('135', '饶阳县', '1487', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('136', '安平县', '1488', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('137', '故城县', '1489', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('138', '景县', '1491', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('139', '阜城县', '1492', '2', '130');
INSERT INTO `fy_bank_area` VALUES ('140', '兴县', '1735', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('141', '临县', '1736', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('142', '阳泉市', '1630', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('143', '应县', '1636', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('144', '右玉县', '1638', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('145', '怀仁县', '1641', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('146', '岚县', '1739', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('147', '长治市', '1640', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('148', '太原市', '1610', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('149', '大同市', '1620', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('150', '阳高县', '1631', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('151', '天镇县', '1632', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('152', '广灵县', '1633', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('153', '灵丘县', '1634', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('154', '浑源县', '1635', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('155', '左云县', '1637', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('156', '大同县', '1639', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('157', '平定县', '1651', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('158', '盂县', '1652', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('159', '长治县', '1661', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('160', '潞城市', '1662', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('161', '襄垣县', '1663', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('162', '屯留县', '1664', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('163', '平顺县', '1665', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('164', '黎城县', '1666', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('165', '壶关县', '1667', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('166', '长子县', '1668', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('167', '武乡县', '1669', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('168', '沁县', '1671', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('169', '沁源县', '1672', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('170', '晋城市', '1680', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('171', '沁水县', '1681', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('172', '阳城县', '1682', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('173', '高平市', '1683', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('174', '陵川县', '1684', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('175', '朔州市', '1690', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('176', '山阴县', '1691', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('177', '忻州市', '1710', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('178', '定襄县', '1712', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('179', '五台县', '1713', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('180', '原平市', '1714', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('181', '代县', '1715', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('182', '繁峙县', '1716', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('183', '宁武县', '1717', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('184', '静乐县', '1718', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('185', '神池县', '1719', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('186', '五寨县', '1721', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('187', '岢岚县', '1722', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('188', '河曲县', '1723', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('189', '保德县', '1724', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('190', '偏关县', '1725', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('191', '吕梁市', '1730', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('192', '汾阳市', '1731', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('193', '文水县', '1732', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('194', '交城县', '1733', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('195', '孝义市', '1734', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('196', '柳林县', '1737', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('197', '石楼县', '1738', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('198', '方山县', '1741', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('199', '中阳县', '1743', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('200', '交口县', '1744', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('201', '晋中市', '1750', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('202', '榆社县', '1752', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('203', '左权县', '1753', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('204', '和顺县', '1754', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('205', '昔阳县', '1755', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('206', '寿阳县', '1756', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('207', '太谷县', '1757', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('208', '祁县', '1758', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('209', '平遥县', '1759', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('210', '介休市', '1761', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('211', '灵石县', '1762', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('212', '临汾市', '1770', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('213', '侯马市', '1772', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('214', '曲沃县', '1773', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('215', '翼城县', '1774', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('216', '襄汾县', '1775', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('217', '洪洞县', '1776', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('218', '霍州市', '1777', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('219', '古县', '1778', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('220', '安泽县', '1779', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('221', '浮山县', '1781', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('222', '吉县', '1782', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('223', '乡宁县', '1783', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('224', '蒲县', '1784', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('225', '大宁县', '1785', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('226', '永和县', '1786', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('227', '隰县', '1787', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('228', '汾西县', '1788', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('229', '运城市', '1810', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('230', '永济市', '1812', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('231', '芮城县', '1813', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('232', '临猗县', '1814', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('233', '万荣县', '1815', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('234', '新绛县', '1816', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('235', '稷山县', '1817', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('236', '河津市', '1818', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('237', '闻喜县', '1819', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('238', '夏县', '1821', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('239', '绛县', '1822', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('240', '平陆县', '1823', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('241', '垣曲县', '1824', '2', '140');
INSERT INTO `fy_bank_area` VALUES ('242', '包头市', '1920', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('243', '土默特右旗', '1921', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('244', '固阳县', '1922', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('245', '乌海市', '1930', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('246', '赤峰市', '1940', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('247', '阿鲁科尔沁旗', '1941', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('248', '巴林左旗', '1942', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('249', '巴林右旗', '1943', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('250', '林西县', '1944', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('251', '克什克腾', '1945', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('252', '翁牛特旗', '1946', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('253', '喀喇沁旗', '1947', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('254', '宁城县', '1948', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('255', '敖汉旗', '1949', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('256', '呼伦贝尔市', '1960', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('257', '满州里市', '1962', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('258', '扎兰屯市', '1963', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('259', '牙克石市', '1964', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('260', '阿荣旗', '1965', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('261', '莫力达瓦达斡尔族旗', '1966', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('262', '额尔古纳市', '1967', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('263', '根河市', '1968', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('264', '鄂伦春自治旗', '1969', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('265', '鄂温克族自治旗', '1971', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('266', '新巴尔虎右旗', '1972', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('267', '新巴尔虎左旗', '1973', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('268', '陈巴尔虎旗', '1974', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('269', '兴安盟', '1980', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('270', '科尔沁右翼中旗', '1983', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('271', '扎赉特旗', '1984', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('272', '突泉县', '1985', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('273', '阿尔山市', '1986', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('274', '通辽市', '1990', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('275', '霍林郭勒市', '1992', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('276', '科尔沁左翼中旗', '1993', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('277', '科尔沁左翼后旗', '1994', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('278', '开鲁县', '1995', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('279', '库伦旗', '1996', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('280', '奈曼旗', '1997', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('281', '扎鲁特旗', '1998', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('282', '锡林郭勒盟', '2010', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('283', '二连浩特市', '2011', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('284', '阿巴嘎旗', '2013', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('285', '苏尼特左旗', '2014', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('286', '苏尼特右旗', '2015', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('287', '东乌珠穆沁旗', '2016', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('288', '西乌珠穆沁旗', '2017', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('289', '太仆寺旗', '2018', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('290', '镶黄旗', '2019', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('291', '正镶白旗', '2021', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('292', '正蓝旗', '2022', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('293', '多伦县', '2023', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('294', '乌兰察布市', '2030', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('295', '卓资县', '2035', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('296', '化德县', '2036', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('297', '商都县', '2037', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('298', '兴和县', '2038', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('299', '丰镇市', '2039', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('300', '凉城县', '2041', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('301', '察哈尔右翼前旗', '2042', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('302', '察哈尔右翼中旗', '2043', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('303', '察哈尔右翼后旗', '2044', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('304', '四子王旗', '2046', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('305', '鄂尔多斯市', '2050', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('306', '达拉特旗', '2052', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('307', '准格尔旗', '2053', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('308', '鄂托克前旗', '2054', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('309', '鄂托克旗', '2055', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('310', '杭锦旗', '2056', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('311', '乌审旗', '2057', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('312', '伊金霍洛旗', '2058', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('313', '巴彦淖尔市', '2070', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('314', '五原县', '2072', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('315', '磴口县', '2073', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('316', '乌拉特前旗', '2074', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('317', '乌拉特中旗', '2075', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('318', '乌拉特后旗', '2076', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('319', '杭锦后旗', '2077', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('320', '阿拉善盟', '2080', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('321', '阿拉善右旗', '2082', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('322', '额济纳旗', '2083', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('323', '达尔罕茂明安联合旗', '2045', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('324', '呼和浩特市', '1910', '2', '150');
INSERT INTO `fy_bank_area` VALUES ('325', '沈阳市', '2210', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('326', '大连市', '2220', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('327', '普兰店市', '2222', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('328', '庄河市', '2223', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('329', '瓦房店市', '2224', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('330', '鞍山市', '2230', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('331', '台安县', '2231', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('332', '海城市', '2232', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('333', '抚顺市', '2240', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('334', '抚顺县', '2241', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('335', '新宾满族自治县', '2242', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('336', '清原满族自治县', '2243', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('337', '本溪市', '2250', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('338', '本溪满族自治县', '2251', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('339', '桓仁满族自治县', '2252', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('340', '丹东市', '2260', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('341', '凤城市', '2261', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('342', '东港市', '2263', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('343', '宽甸满族自治县', '2264', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('344', '锦州市', '2270', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('345', '凌海市', '2272', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('346', '北宁市', '2273', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('347', '黑山县', '2274', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('348', '义县', '2275', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('349', '营口市', '2280', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('350', '盖州市', '2282', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('351', '阜新市', '2290', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('352', '阜新蒙古族自治县', '2291', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('353', '彰武县', '2292', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('354', '辽阳市', '2310', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('355', '辽阳县', '2311', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('356', '灯塔市', '2312', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('357', '盘锦市', '2320', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('358', '大洼县', '2321', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('359', '盘山县', '2322', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('360', '铁岭市', '2330', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('361', '西丰县', '2332', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('362', '昌图县', '2333', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('363', '调兵山市', '2336', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('364', '开原市', '2337', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('365', '朝阳市', '2340', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('366', '建平县', '2342', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('367', '凌源市', '2343', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('368', '喀喇沁左翼蒙古族自治县', '2344', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('369', '北票市', '2346', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('370', '长海县', '2225', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('371', '大石桥市', '2262', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('372', '葫芦岛市', '2276', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('373', '绥中县', '2271', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('374', '建昌县', '2345', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('375', '兴城市', '2277', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('376', '岫岩县', '2265', '2', '210');
INSERT INTO `fy_bank_area` VALUES ('377', '长春市', '2410', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('378', '吉林市', '2420', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('379', '永吉县', '2421', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('380', '临江市', '2422', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('381', '磐石市', '2423', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('382', '蛟河市', '2424', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('383', '桦甸市', '2425', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('384', '四平市', '2430', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('385', '梨树县', '2431', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('386', '伊通满族自治县', '2432', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('387', '双辽市', '2433', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('388', '公主岭市', '2434', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('389', '辽源市', '2440', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('390', '东丰县', '2441', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('391', '东辽县', '2442', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('392', '通化市', '2450', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('393', '通化县', '2451', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('394', '辉南县', '2452', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('395', '柳河县', '2453', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('396', '梅河口市', '2454', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('397', '集安市', '2455', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('398', '白山市', '2460', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('399', '抚松县', '2461', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('400', '靖宇县', '2462', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('401', '长白朝鲜族自治县', '2463', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('402', '江源县', '2464', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('403', '白城市', '2470', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('404', '洮南市', '2472', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('405', '大安市', '2474', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('406', '镇赉县', '2477', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('407', '通榆县', '2478', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('408', '延边朝鲜族自治州', '2490', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('409', '图们市', '2492', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('410', '敦化市', '2493', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('411', '珲春市', '2494', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('412', '龙井市', '2495', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('413', '和龙市', '2496', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('414', '汪清县', '2497', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('415', '安图县', '2498', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('416', '舒兰市', '2426', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('417', '松原市', '2520', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('418', '扶余县', '2473', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('419', '长岭县', '2475', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('420', '乾安县', '2479', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('421', '前郭县', '2476', '2', '220');
INSERT INTO `fy_bank_area` VALUES ('422', '哈尔滨市', '2610', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('423', '齐齐哈尔市', '2640', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('424', '龙江县', '2641', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('425', '讷河市', '2642', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('426', '依安县', '2643', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('427', '泰来县', '2644', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('428', '甘南县', '2645', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('429', '富裕县', '2647', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('430', '克山县', '2649', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('431', '克东县', '2651', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('432', '拜泉县', '2652', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('433', '鸡西市', '2660', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('434', '鸡东县', '2661', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('435', '鹤岗市', '2670', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('436', '萝北县', '2671', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('437', '绥滨县', '2672', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('438', '双鸭山市', '2680', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('439', '集贤县', '2681', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('440', '佳木斯市', '2690', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('441', '伊春市', '2710', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('442', '嘉荫县', '2711', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('443', '铁力市', '2712', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('444', '牡丹江市', '2720', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('445', '桦南县', '2721', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('446', '桦川县', '2723', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('447', '汤原县', '2725', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('448', '抚远县', '2727', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('449', '同江市', '2729', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('450', '富锦市', '2731', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('451', '七台河市', '2740', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('452', '勃利县', '2741', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('453', '宁安市', '2751', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('454', '海林市', '2752', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('455', '穆棱市', '2753', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('456', '东宁县', '2754', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('457', '林口县', '2755', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('458', '绥芬河市', '2757', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('459', '绥化市', '2760', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('460', '安达市', '2762', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('461', '肇东市', '2763', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('462', '海伦市', '2764', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('463', '望奎县', '2765', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('464', '兰西县', '2766', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('465', '青冈县', '2767', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('466', '庆安县', '2771', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('467', '明水县', '2772', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('468', '绥棱县', '2773', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('469', '黑河市', '2780', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('470', '北安市', '2782', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('471', '五大连池市', '2783', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('472', '嫩江县', '2784', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('473', '逊克县', '2786', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('474', '孙吴县', '2787', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('475', '大兴安岭地区', '2790', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('476', '呼玛县', '2791', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('477', '塔河县', '2792', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('478', '漠河县', '2793', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('479', '虎林市', '2756', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('480', '密山市', '2758', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('481', '宝清县', '2724', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('482', '饶河县', '2726', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('483', '友谊县', '2728', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('484', '大庆市', '2650', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('485', '林甸县', '2648', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('486', '肇源县', '2768', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('487', '肇州县', '2769', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('488', '杜蒙县', '2646', '2', '230');
INSERT INTO `fy_bank_area` VALUES ('489', '上海', '2900', '2', '310');
INSERT INTO `fy_bank_area` VALUES ('490', '南京', '3010', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('491', '无锡市', '3020', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('492', '江阴市', '3022', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('493', '宜兴市', '3023', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('494', '徐州市', '3030', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('495', '丰县', '3031', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('496', '沛县', '3032', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('497', '铜山县', '3033', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('498', '睢宁县', '3034', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('499', '邳州市', '3035', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('500', '新沂市', '3036', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('501', '常州市', '3040', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('502', '金坛市', '3042', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('503', '溧阳市', '3043', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('504', '苏州市', '3050', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('505', '太仓市', '3051', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('506', '昆山市', '3052', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('507', '吴江市', '3054', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('508', '常熟市', '3055', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('509', '张家港市', '3056', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('510', '南通市', '3060', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('511', '海安县', '3061', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('512', '如皋市', '3062', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('513', '如东县', '3063', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('514', '海门市', '3065', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('515', '启东市', '3066', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('516', '连云港市', '3070', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('517', '赣榆县', '3071', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('518', '东海县', '3072', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('519', '灌云县', '3073', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('520', '淮安市', '3080', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('521', '涟水县', '3085', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('522', '洪泽县', '3087', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('523', '盱眙县', '3088', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('524', '金湖县', '3089', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('525', '盐城市', '3110', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('526', '响水县', '3111', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('527', '滨海县', '3112', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('528', '阜宁县', '3113', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('529', '射阳县', '3114', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('530', '建湖县', '3115', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('531', '大丰市', '3116', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('532', '东台市', '3117', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('533', '扬州市', '3120', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('534', '高邮市', '3121', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('535', '宝应县', '3122', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('536', '江都市', '3125', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('537', '仪征市', '3129', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('538', '镇江市', '3140', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('539', '句容市', '3142', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('541', '通州市', '3084', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('542', '灌南县', '3082', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('543', '丹阳市', '3141', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('544', '泰州市', '3128', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('545', '兴化市', '3131', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('546', '靖江市', '3123', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('547', '泰兴市', '3124', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('548', '姜堰市', '3132', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('549', '宿迁市', '3090', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('550', '沭阳县', '3083', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('551', '泗阳县', '3093', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('552', '泗洪县', '3086', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('553', '宿豫县', '3094', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('554', '盐都县', '3118', '2', '320');
INSERT INTO `fy_bank_area` VALUES ('555', '舟山市', '3420', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('556', '杭州市', '3310', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('557', '宁波市', '3320', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('558', '象山县', '3321', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('559', '宁海县', '3322', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('560', '余姚市', '3324', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('561', '慈溪市', '3325', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('562', '奉化市', '3326', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('563', '温州市', '3330', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('564', '洞头县', '3332', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('565', '乐清市', '3333', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('566', '永嘉县', '3334', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('567', '平阳县', '3335', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('568', '苍南县', '3336', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('569', '文成县', '3337', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('570', '泰顺县', '3338', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('571', '瑞安市', '3339', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('572', '嘉兴市', '3350', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('573', '嘉善县', '3351', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('574', '平湖市', '3352', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('575', '海盐县', '3353', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('576', '桐乡市', '3354', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('577', '海宁市', '3355', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('578', '湖州市', '3360', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('579', '德清县', '3361', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('580', '长兴县', '3362', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('581', '安吉县', '3363', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('582', '绍兴市', '3370', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('583', '绍兴县', '3371', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('584', '上虞市', '3372', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('585', '嵊州市', '3373', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('586', '新昌县', '3374', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('587', '诸暨市', '3375', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('588', '金华市', '3380', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('589', '永康市', '3382', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('590', '武义县', '3383', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('591', '浦江县', '3384', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('592', '磐安县', '3385', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('593', '兰溪市', '3386', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('594', '义乌市', '3387', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('595', '东阳市', '3388', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('596', '衢州市', '3410', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('597', '常山县', '3412', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('598', '开化县', '3413', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('599', '龙游县', '3414', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('600', '江山市', '3415', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('601', '岱山县', '3421', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('602', '嵊泗县', '3422', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('603', '丽水市', '3430', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('604', '青田县', '3432', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('605', '云和县', '3433', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('606', '庆元县', '3434', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('607', '缙云县', '3435', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('608', '遂昌县', '3436', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('609', '松阳县', '3437', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('610', '景宁畲族自治县', '3438', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('611', '龙泉市', '3439', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('612', '台州市', '3450', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('613', '临海市', '3452', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('614', '温岭市', '3454', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('615', '仙居县', '3455', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('616', '天台县', '3456', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('617', '三门县', '3457', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('618', '玉环县', '3458', '2', '330');
INSERT INTO `fy_bank_area` VALUES ('619', '宣城市', '3771', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('620', '巢湖市', '3781', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('621', '涡阳县', '3726', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('622', '蒙城县', '3727', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('623', '利辛县', '3732', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('624', '亳州市', '3722', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('625', '合肥市', '3610', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('626', '芜湖市', '3620', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('627', '芜湖县', '3621', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('628', '繁昌县', '3622', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('629', '南陵县', '3623', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('630', '蚌埠市', '3630', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('631', '怀远县', '3631', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('632', '五河县', '3632', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('633', '固镇县', '3633', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('634', '淮南市', '3640', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('635', '凤台县', '3641', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('636', '马鞍山市', '3650', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('637', '当涂县', '3651', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('638', '淮北市', '3660', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('639', '濉溪县', '3661', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('640', '铜陵市', '3670', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('641', '铜陵县', '3671', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('642', '安庆市', '3680', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('643', '桐城市', '3681', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('644', '怀宁县', '3682', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('645', '枞阳县', '3683', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('646', '潜山县', '3684', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('647', '太湖县', '3685', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('648', '宿松县', '3686', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('649', '望江县', '3687', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('650', '岳西县', '3688', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('651', '黄山市', '3710', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('652', '歙县', '3711', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('653', '休宁县', '3712', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('654', '黟县', '3713', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('655', '祁门县', '3714', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('656', '阜阳市', '3720', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('657', '临泉县', '3724', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('658', '太和县', '3725', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('659', '阜南县', '3728', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('660', '颍上县', '3729', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('661', '界首市', '3731', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('662', '宿州市', '3740', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('663', '砀山县', '3742', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('664', '萧县', '3743', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('665', '灵璧县', '3745', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('666', '泗县', '3746', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('667', '滁州市', '3750', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('668', '天长市', '3752', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('669', '来安县', '3753', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('670', '全椒县', '3754', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('671', '定远县', '3755', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('672', '凤阳县', '3756', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('673', '明光市', '3757', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('674', '六安市', '3760', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('675', '寿县', '3763', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('676', '霍邱县', '3764', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('677', '舒城县', '3765', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('678', '金寨县', '3766', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('679', '霍山县', '3767', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('680', '郎溪县', '3772', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('681', '广德县', '3773', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('682', '宁国市', '3774', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('683', '泾县', '3775', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('684', '旌德县', '3776', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('685', '绩溪县', '3777', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('686', '庐江县', '3782', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('687', '无为县', '3783', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('688', '含山县', '3784', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('689', '和县', '3785', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('690', '池州市', '3790', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('691', '东至县', '3792', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('692', '石台县', '3793', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('693', '青阳县', '3794', '2', '340');
INSERT INTO `fy_bank_area` VALUES ('694', '连城县', '4057', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('695', '永安市', '3960', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('696', '武夷山市', '4022', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('697', '莆田县', '3941', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('698', '福州市', '3910', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('699', '厦门市', '3930', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('700', '莆田市', '3940', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('701', '仙游县', '3942', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('702', '三明市', '3950', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('703', '明溪县', '3951', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('704', '清流县', '3952', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('705', '宁化县', '3953', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('706', '大田县', '3954', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('707', '尤溪县', '3955', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('708', '沙县', '3956', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('709', '将乐县', '3957', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('710', '泰宁县', '3958', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('711', '建宁县', '3959', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('712', '泉州市', '3970', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('713', '惠安县', '3971', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('714', '晋江市', '3972', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('715', '南安市', '3973', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('716', '安溪县', '3974', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('717', '永春县', '3975', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('718', '德化县', '3976', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('719', '石狮市', '3978', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('720', '漳州市', '3990', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('721', '龙海市', '3991', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('722', '云霄县', '3992', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('723', '漳浦县', '3993', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('724', '诏安县', '3994', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('725', '长泰县', '3995', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('726', '东山县', '3996', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('727', '南靖县', '3997', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('728', '平和县', '3998', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('729', '华安县', '3999', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('730', '南平市', '4010', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('731', '邵武市', '4012', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('732', '顺昌县', '4013', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('733', '建阳市', '4014', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('734', '建瓯市', '4015', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('735', '浦城县', '4016', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('736', '光泽县', '4018', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('737', '松溪县', '4019', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('738', '政和县', '4021', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('739', '宁德市', '4030', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('740', '福鼎市', '4032', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('741', '霞浦县', '4033', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('742', '福安市', '4034', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('743', '古田县', '4035', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('744', '屏南县', '4036', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('745', '寿宁县', '4037', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('746', '周宁县', '4038', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('747', '柘荣县', '4039', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('748', '龙岩市', '4050', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('749', '长汀县', '4052', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('750', '永定县', '4053', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('751', '上杭县', '4054', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('752', '武平县', '4055', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('753', '漳平市', '4056', '2', '350');
INSERT INTO `fy_bank_area` VALUES ('754', '南昌', '4210', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('755', '景德镇市', '4220', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('756', '乐平市', '4221', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('757', '浮梁县', '4222', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('758', '萍乡市', '4230', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('759', '上栗县', '4231', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('760', '芦溪县', '4232', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('761', '九江市', '4240', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('762', '九江县', '4241', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('763', '瑞昌市', '4242', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('764', '武宁县', '4243', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('765', '修水县', '4244', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('766', '永修县', '4245', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('767', '德安县', '4246', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('768', '星子县', '4247', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('769', '都昌县', '4248', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('770', '湖口县', '4249', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('771', '彭泽县', '4251', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('772', '新余市', '4260', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('773', '分宜县', '4261', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('774', '鹰潭市', '4270', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('775', '贵溪市', '4271', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('776', '余江县', '4272', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('777', '赣州市', '4280', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('778', '赣县', '4282', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('779', '南康市', '4283', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('780', '信丰县', '4284', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('781', '大余县', '4285', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('782', '上犹县', '4286', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('783', '崇义县', '4287', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('784', '安远县', '4288', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('785', '龙南县', '4289', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('786', '定南县', '4291', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('787', '全南县', '4292', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('788', '宁都县', '4293', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('789', '于都县', '4294', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('790', '兴国县', '4295', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('791', '瑞金市', '4296', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('792', '会昌县', '4297', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('793', '寻乌县', '4298', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('794', '石城县', '4299', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('795', '宜春市', '4310', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('796', '丰城市', '4312', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('797', '樟树市', '4313', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('798', '高安市', '4314', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('799', '奉新县', '4315', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('800', '万载县', '4316', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('801', '上高县', '4317', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('802', '宜丰县', '4318', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('803', '靖安县', '4319', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('804', '铜鼓县', '4321', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('805', '上饶市', '4330', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('806', '上饶县', '4332', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('807', '广丰县', '4333', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('808', '玉山县', '4334', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('809', '铅山县', '4335', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('810', '横峰县', '4336', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('811', '弋阳县', '4337', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('812', '余干县', '4338', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('813', '波阳县', '4339', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('814', '万年县', '4341', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('815', '德兴市', '4342', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('816', '婺源县', '4343', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('817', '吉安市', '4350', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('818', '井冈山市', '4352', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('819', '吉安县', '4353', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('820', '吉水县', '4354', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('821', '峡江县', '4355', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('822', '新干县', '4356', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('823', '永丰县', '4357', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('824', '泰和县', '4358', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('825', '遂川县', '4359', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('826', '万安县', '4361', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('827', '安福县', '4362', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('828', '永新县', '4363', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('829', '抚州市', '4370', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('830', '南城县', '4372', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('831', '黎川县', '4373', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('832', '南丰县', '4374', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('833', '崇仁县', '4375', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('834', '乐安县', '4376', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('835', '宜黄县', '4377', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('836', '金溪县', '4378', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('837', '资溪县', '4379', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('838', '东乡县', '4381', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('839', '广昌县', '4382', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('840', '莲花县', '4364', '2', '360');
INSERT INTO `fy_bank_area` VALUES ('841', '昌邑市', '4585', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('842', '高密市', '4586', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('843', '青州市', '4588', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('844', '诸城市', '4589', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('845', '济宁市', '4610', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('846', '兖州市', '4611', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('847', '邹城市', '4612', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('848', '微山县', '4613', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('849', '鱼台县', '4614', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('850', '金乡县', '4615', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('851', '嘉祥县', '4616', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('852', '汶上县', '4617', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('853', '泗水县', '4618', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('854', '曲阜市', '4619', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('855', '泰安市', '4630', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('856', '宁阳县', '4631', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('857', '肥城市', '4632', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('858', '东平县', '4633', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('859', '新泰市', '4635', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('860', '威海市', '4650', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('861', '乳山市', '4651', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('862', '文登市', '4652', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('863', '荣成市', '4653', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('864', '滨州市', '4660', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('865', '惠民县', '4662', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('866', '阳信县', '4663', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('867', '无棣县', '4664', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('868', '沾化县', '4665', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('869', '博兴县', '4666', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('870', '邹平县', '4667', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('871', '德州市', '4680', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('872', '乐陵市', '4682', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('873', '陵县', '4683', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('874', '平原县', '4684', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('875', '夏津县', '4685', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('876', '武城县', '4686', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('877', '齐河县', '4687', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('878', '禹城市', '4688', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('879', '临邑县', '4689', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('880', '宁津县', '4693', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('881', '庆云县', '4694', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('882', '聊城市', '4710', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('883', '临清市', '4712', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('884', '阳谷县', '4713', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('885', '莘县', '4714', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('886', '茌平县', '4715', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('887', '东阿县', '4716', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('888', '冠县', '4717', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('889', '高唐县', '4718', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('890', '临沂市', '4730', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('891', '郯城县', '4733', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('892', '苍山县', '4734', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('893', '莒南县', '4735', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('894', '沂水县', '4737', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('895', '蒙阴县', '4739', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('896', '费县', '4742', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('897', '沂南县', '4743', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('898', '临沭县', '4744', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('899', '菏泽市', '4750', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('900', '曹县', '4752', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('901', '定陶县', '4753', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('902', '成武县', '4754', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('903', '单县', '4755', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('904', '巨野县', '4756', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('905', '郓城县', '4758', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('906', '鄄城县', '4759', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('907', '东明县', '4761', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('908', '济南市', '4510', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('909', '青岛市', '4520', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('910', '即墨市', '4521', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('911', '胶南市', '4522', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('912', '莱西市', '4523', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('913', '平度市', '4524', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('914', '胶州市', '4525', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('915', '淄博市', '4530', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('916', '桓台县', '4531', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('917', '枣庄市', '4540', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('918', '滕州市', '4541', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('919', '东营市', '4550', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('920', '垦利县', '4551', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('921', '利津县', '4552', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('922', '广饶县', '4553', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('923', '烟台市', '4560', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('924', '蓬莱市', '4561', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('925', '招远市', '4562', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('926', '栖霞市', '4563', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('927', '海阳市', '4564', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('928', '长岛县', '4566', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('929', '龙口市', '4567', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('930', '莱阳市', '4568', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('931', '莱州市', '4569', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('932', '潍坊市', '4580', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('933', '安丘市', '4581', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('934', '寿光市', '4582', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('935', '临朐县', '4583', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('936', '昌乐县', '4584', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('937', '梁山县', '4757', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('938', '日照市', '4732', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('939', '五莲县', '4587', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('940', '莒县', '4736', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('941', '莱芜市', '4634', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('942', '高青县', '4535', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('943', '沂源县', '4536', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('944', '平邑县', '4741', '2', '370');
INSERT INTO `fy_bank_area` VALUES ('945', '伊川县', '4939', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('946', '郑州市', '4910', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('947', '开封市', '4920', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('948', '杞县', '4921', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('949', '通许县', '4922', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('950', '尉氏县', '4923', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('951', '开封县', '4924', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('952', '兰考县', '4925', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('953', '洛阳市', '4930', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('954', '偃师市', '4931', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('955', '孟津县', '4932', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('956', '新安县', '4933', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('957', '栾川县', '4934', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('958', '嵩县', '4935', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('959', '汝阳县', '4936', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('960', '宜阳县', '4937', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('961', '洛宁县', '4938', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('962', '平顶山市', '4950', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('963', '宝丰县', '4951', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('964', '叶县', '4952', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('965', '鲁山县', '4953', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('966', '郏县', '4954', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('967', '汝州市', '4956', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('968', '安阳市', '4960', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('969', '林州市', '4961', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('970', '安阳县', '4962', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('971', '汤阴县', '4963', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('972', '滑县', '4964', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('973', '内黄县', '4965', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('974', '鹤壁市', '4970', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('975', '浚县', '4971', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('976', '淇县', '4972', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('977', '新乡市', '4980', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('978', '新乡县', '4981', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('979', '获嘉县', '4982', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('980', '原阳县', '4983', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('981', '延津县', '4984', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('982', '封丘县', '4985', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('983', '长垣县', '4986', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('984', '卫辉市', '4987', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('985', '辉县市', '4988', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('986', '焦作市', '5010', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('987', '修武县', '5011', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('988', '博爱县', '5012', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('989', '武陟县', '5013', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('990', '沁阳市', '5014', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('991', '温县', '5015', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('992', '孟州市', '5016', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('993', '濮阳市', '5020', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('994', '清丰县', '5021', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('995', '南乐县', '5022', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('996', '范县', '5023', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('997', '台前县', '5024', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('998', '濮阳县', '5025', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('999', '许昌市', '5030', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1000', '长葛市', '5031', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1001', '许昌县', '5032', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1002', '鄢陵县', '5033', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1003', '禹州市', '5034', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1004', '漯河市', '5040', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1005', '舞阳县', '5041', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1006', '临颍县', '5042', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1007', '三门峡市', '5050', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1008', '渑池县', '5051', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1009', '陕县', '5052', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1010', '灵宝市', '5053', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1011', '卢氏县', '5054', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1012', '义马市', '5055', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1013', '商丘市', '5060', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1014', '虞城县', '5062', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1015', '民权县', '5064', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1016', '宁陵县', '5065', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1017', '睢县', '5066', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1018', '夏邑县', '5067', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1019', '柘城县', '5068', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1020', '永城市', '5069', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1021', '周口市', '5080', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1022', '扶沟县', '5082', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1023', '西华县', '5083', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1024', '商水县', '5084', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1025', '太康县', '5085', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1026', '鹿邑县', '5086', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1027', '郸城县', '5087', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1028', '淮阳县', '5088', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1029', '沈丘县', '5089', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1030', '项城市', '5091', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1031', '驻马店市', '5110', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1032', '确山县', '5112', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1033', '泌阳县', '5113', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1034', '遂平县', '5114', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1035', '西平县', '5115', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1036', '上蔡县', '5116', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1037', '汝南县', '5117', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1038', '平舆县', '5118', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1039', '新蔡县', '5119', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1040', '正阳县', '5121', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1041', '南阳市', '5130', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1042', '邓州市', '5132', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1043', '南召县', '5133', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1044', '方城县', '5134', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1045', '西峡县', '5135', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1046', '镇平县', '5137', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1047', '内乡县', '5138', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1048', '淅川县', '5139', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1049', '社旗县', '5141', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1050', '唐河县', '5142', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1051', '新野县', '5143', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1052', '桐柏县', '5144', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1053', '信阳市', '5150', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1054', '息县', '5152', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1055', '淮滨县', '5153', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1056', '潢川县', '5155', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1057', '光山县', '5156', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1058', '固始县', '5157', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1059', '商城县', '5158', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1060', '罗山县', '5159', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1061', '新县', '5161', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1062', '舞钢市', '5044', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1063', '襄城县', '4955', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1064', '郾城县', '5043', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1065', '信阳县', '5154', '2', '410');
INSERT INTO `fy_bank_area` VALUES ('1066', '武汉市', '5210', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1067', '黄石市', '5220', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1068', '大冶市', '5221', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1069', '十堰市', '5230', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1070', '当阳市', '5262', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1071', '枝江市', '5264', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1072', '远安县', '5265', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1073', '兴山县', '5266', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1074', '秭归县', '5267', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1075', '长阳土家族自治县', '5268', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1076', '五峰土家族自治县', '5269', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1077', '襄阳市', '5280', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1078', '宜城县', '5282', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1079', '南漳县', '5283', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1080', '谷城县', '5284', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1081', '保康县', '5285', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1082', '老河口市', '5287', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1083', '鄂州市', '5310', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1084', '神农架林区', '5311', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1085', '荆门市', '5320', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1086', '黄冈市', '5330', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1087', '麻城市', '5331', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1088', '武穴县', '5332', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1089', '团风县', '5333', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1090', '红安县', '5334', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1091', '罗田县', '5335', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1092', '英山县', '5336', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1093', '浠水县', '5337', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1094', '蕲春县', '5338', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1095', '黄梅县', '5339', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1096', '孝感市', '5350', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1097', '孝昌县', '5351', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1098', '应城市', '5352', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1099', '安陆市', '5353', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1100', '大悟县', '5355', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1101', '云梦县', '5356', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1102', '汉川县', '5357', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1103', '咸宁市', '5360', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1104', '嘉鱼县', '5363', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1105', '通城县', '5364', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1106', '崇阳县', '5365', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1107', '通山县', '5366', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1108', '荆州市', '5370', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1109', '仙桃市', '5371', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1110', '石首市', '5372', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1111', '洪湖市', '5373', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1112', '天门市', '5374', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1113', '潜江市', '5375', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1114', '松滋市', '5377', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1115', '公安县', '5378', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1116', '监利县', '5379', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1117', '恩施土家族苗族自治州', '5410', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1118', '利川市', '5412', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1119', '建始县', '5413', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1120', '巴东县', '5414', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1121', '宣恩县', '5415', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1122', '咸丰县', '5416', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1123', '来凤县', '5417', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1124', '鹤峰县', '5418', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1125', '枣阳市', '5288', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1126', '阳新县', '5367', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1127', '郧县', '5392', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1128', '郧西县', '5393', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1129', '竹山县', '5394', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1130', '竹溪县', '5395', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1131', '房县', '5396', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1132', '丹江口市', '5391', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1133', '宜昌市', '5260', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1134', '宜都市', '5261', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1135', '京山县', '5382', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1136', '沙洋县', '5383', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1137', '钟祥市', '5381', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1138', '宜昌县', '5263', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1139', '随州市', '5286', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1140', '广水市', '5354', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1141', '赤壁市', '5362', '2', '420');
INSERT INTO `fy_bank_area` VALUES ('1142', '长沙', '5510', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1143', '株洲市', '5520', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1144', '株洲县', '5521', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1145', '攸县', '5522', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1146', '茶陵县', '5523', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1147', '澧县', '5583', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1148', '醴陵市', '5525', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1149', '湘潭市', '5530', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1150', '湘乡市', '5532', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1151', '韶山县', '5533', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1152', '衡阳市', '5540', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1153', '衡阳县', '5541', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1154', '衡南县', '5542', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1155', '衡山县', '5543', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1156', '衡东县', '5544', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1157', '常宁县', '5545', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1158', '祁东县', '5546', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1159', '耒阳县', '5547', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1160', '邵阳市', '5550', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1161', '邵东县', '5551', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1162', '新邵县', '5552', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1163', '邵阳县', '5553', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1164', '隆回县', '5554', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1165', '洞口县', '5555', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1166', '武冈县', '5556', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1167', '绥宁县', '5557', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1168', '新宁县', '5558', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1169', '城步苗族自治县', '5559', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1170', '岳阳市', '5570', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1171', '岳阳县', '5571', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1172', '临湘县', '5572', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1173', '华容县', '5573', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1174', '湘阴县', '5574', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1175', '平江县', '5575', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1176', '汩罗市', '5576', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1177', '常德市', '5580', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1178', '安乡县', '5581', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1179', '汉寿县', '5582', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1180', '临澧县', '5584', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1181', '桃源县', '5585', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1182', '石门县', '5586', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1183', '津市市', '5587', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1184', '张家界市', '5590', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1185', '慈利县', '5591', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1186', '桑植县', '5592', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1187', '益阳市', '5610', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1188', '沅江县', '5612', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1189', '南县', '5614', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1190', '桃江县', '5615', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1191', '安化县', '5616', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1192', '娄底市', '5620', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1193', '冷水江市', '5622', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1194', '涟源县', '5623', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1195', '道县', '5654', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1196', '宁远县', '5655', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1197', '江永县', '5656', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1198', '江华瑶族自治县', '5657', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1199', '蓝山县', '5658', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1200', '新田县', '5659', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1201', '双牌县', '5661', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1202', '祁阳县', '5662', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1203', '怀化市', '5670', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1204', '洪江市', '5672', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1205', '沅陵县', '5674', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1206', '辰溪县', '5675', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1207', '溆浦县', '5676', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1208', '麻阳苗族自治县', '5677', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1209', '新晃侗族自治县', '5678', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1210', '芷江侗族自治县', '5679', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1211', '会同县', '5681', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1212', '靖州县', '5682', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1213', '通道侗族自治县', '5683', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1214', '湘西土家族苗族自治州', '5690', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1215', '泸溪县', '5692', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1216', '凤凰县', '5693', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1217', '花垣县', '5694', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1218', '保靖县', '5695', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1219', '古丈县', '5696', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1220', '永顺县', '5697', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1221', '龙山县', '5698', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1222', '双峰县', '5624', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1223', '新化县', '5625', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1224', '郴州市', '5630', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1225', '资兴市', '5632', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1226', '桂阳县', '5634', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1227', '永兴县', '5635', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1228', '宜章县', '5636', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1229', '嘉禾县', '5637', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1230', '临武县', '5638', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1231', '汝城县', '5639', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1232', '桂东县', '5641', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1233', '安仁县', '5642', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1234', '永州市', '5650', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1235', '东安县', '5653', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1236', '炎陵县', '5526', '2', '430');
INSERT INTO `fy_bank_area` VALUES ('1237', '广州', '5810', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1238', '韶关市', '5820', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1239', '始兴县', '5822', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1240', '南雄市', '5823', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1241', '仁化县', '5824', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1242', '乐昌市', '5825', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1243', '翁源县', '5826', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1244', '乳源瑶族自治县', '5827', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1245', '新丰县', '5828', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1246', '深圳', '5840', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1247', '珠海市', '5850', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1248', '汕头市', '5860', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1249', '南澳县', '5863', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1250', '佛山市', '5880', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1251', '江门市', '5890', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1252', '台山市', '5892', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1253', '恩平市', '5893', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1254', '开平市', '5894', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1255', '鹤山市', '5895', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1256', '湛江市', '5910', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1257', '吴川市', '5911', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1258', '廉江市', '5912', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1259', '遂溪县', '5913', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1260', '雷州市', '5914', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1261', '徐闻县', '5915', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1262', '茂名市', '5920', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1263', '信宜市', '5921', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1264', '高州市', '5922', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1265', '电白县', '5923', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1266', '化州市', '5924', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1267', '肇庆市', '5930', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1268', '高要市', '5931', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1269', '四会市', '5932', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1270', '广宁县', '5933', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1271', '怀集县', '5934', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1272', '封开县', '5935', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1273', '德庆县', '5936', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1274', '惠州市', '5950', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1275', '博罗县', '5952', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1276', '惠东县', '5953', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1277', '龙门县', '5954', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1278', '梅州市', '5960', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1279', '大埔县', '5962', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1280', '丰顺县', '5963', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1281', '五华县', '5964', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1282', '兴宁市', '5965', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1283', '平远县', '5966', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1284', '蕉岭县', '5967', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1285', '汕尾市', '5970', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1286', '海丰县', '5971', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1287', '陆丰市', '5972', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1288', '陆河县', '5973', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1289', '河源市', '5980', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1290', '紫金县', '5981', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1291', '龙川县', '5982', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1292', '连平县', '5983', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1293', '和平县', '5984', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1294', '东源县', '5985', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1295', '阳江市', '5990', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1296', '阳西县', '5991', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1297', '阳春市', '5992', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1298', '阳东县', '5993', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1299', '清远市', '6010', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1300', '佛冈县', '6011', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1301', '英德市', '6012', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1302', '阳山县', '6013', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1303', '连州市', '6014', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1304', '连山壮族瑶族自治县', '6015', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1305', '连南瑶族自治县', '6016', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1306', '清新县', '6017', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1307', '东莞市', '6020', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1308', '中山市', '6030', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1309', '潮州市', '5869', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1310', '饶平县', '5862', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1311', '揭阳市', '5865', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1312', '揭东县', '5871', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1313', '揭西县', '5866', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1314', '惠来县', '5868', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1315', '普宁市', '5867', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1316', '云浮市', '5937', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1317', '新兴县', '5938', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1318', '郁南县', '5939', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1319', '罗定市', '5941', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1320', '曲江县', '5821', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1321', '澄海市', '5861', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1322', '潮阳市', '5864', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1323', '潮安营业部', '5872', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1324', '大亚湾营业部', '5956', '2', '440');
INSERT INTO `fy_bank_area` VALUES ('1325', '南宁市', '6110', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1326', '柳州市', '6140', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1327', '柳江县', '6141', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1328', '柳城县', '6142', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1329', '鹿寨县', '6152', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1330', '融安县', '6156', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1331', '三江侗族自治县', '6157', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1332', '融水苗族自治县', '6158', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1333', '桂林市', '6170', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1334', '阳朔县', '6171', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1335', '临桂县', '6172', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1336', '灵川县', '6181', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1337', '全州县', '6182', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1338', '兴安县', '6183', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1339', '永福县', '6184', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1340', '灌阳县', '6185', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1341', '龙胜各族自治县', '6186', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1342', '资源县', '6187', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1343', '平乐县', '6188', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1344', '荔蒲县', '6189', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1345', '恭城瑶族自治县', '6191', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1346', '梧州市', '6210', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1347', '苍梧县', '6211', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1348', '岑溪市', '6221', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1349', '藤县', '6222', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1350', '蒙山县', '6224', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1351', '北海市', '6230', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1352', '合浦县', '6231', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1353', '玉林市', '6240', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1354', '容县', '6245', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1355', '北流市', '6246', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1356', '陆川县', '6247', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1357', '博白县', '6248', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1358', '兴业县', '6249', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1359', '田阳县', '6262', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1360', '田东县', '6263', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1361', '平果县', '6264', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1362', '靖西县', '6266', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1363', '那坡县', '6267', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1364', '凌云县', '6268', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1365', '乐业县', '6269', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1366', '田林县', '6271', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1367', '隆林各族自治县', '6272', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1368', '西林县', '6273', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1369', '宜州市', '6282', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1370', '罗城仫佬族自治县', '6283', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1371', '环江毛南族自治县', '6284', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1372', '南丹县', '6285', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1373', '天峨县', '6286', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1374', '凤山县', '6287', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1375', '东兰县', '6288', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1376', '巴马瑶族自治县', '6289', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1377', '都安瑶族自治县', '6291', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1378', '大化瑶族自治县', '6292', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1379', '灵山县', '6314', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1380', '浦北县', '6315', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1381', '防城港市', '6330', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1382', '东兴市', '6331', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1383', '百色市', '6261', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1384', '德保县', '6275', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1385', '河池市', '6281', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1386', '钦州市', '6311', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1387', '上思县', '6312', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1388', '贵港市', '6242', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1389', '平南县', '6244', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1390', '桂平市', '6243', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1391', '贺州市', '6225', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1392', '昭平县', '6223', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1393', '钟山县', '6226', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1394', '来宾市', '6155', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1395', '忻城县', '6161', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1396', '武宣县', '6154', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1397', '合山市', '6151', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1398', '崇左市', '6128', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1399', '扶绥县', '6127', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1400', '宁明县', '6132', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1401', '龙州县', '6133', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1402', '大新县', '6129', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1403', '天等县', '6131', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1404', '凭祥市', '6121', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1405', '象州市', '6153', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1406', '金秀县', '6159', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1407', '富山县', '6227', '2', '450');
INSERT INTO `fy_bank_area` VALUES ('1408', '海口', '6410', '2', '460');
INSERT INTO `fy_bank_area` VALUES ('1409', '三亚', '6420', '2', '460');
INSERT INTO `fy_bank_area` VALUES ('1410', '秀山土家族苗族自治县', '6872', '2', '500');
INSERT INTO `fy_bank_area` VALUES ('1411', '重庆市', '6530', '2', '500');
INSERT INTO `fy_bank_area` VALUES ('1412', '万州区', '6670', '2', '500');
INSERT INTO `fy_bank_area` VALUES ('1413', '涪陵区', '6690', '2', '500');
INSERT INTO `fy_bank_area` VALUES ('1414', '垫江县', '6692', '2', '500');
INSERT INTO `fy_bank_area` VALUES ('1415', '南川市', '6693', '2', '500');
INSERT INTO `fy_bank_area` VALUES ('1416', '丰都县', '6694', '2', '500');
INSERT INTO `fy_bank_area` VALUES ('1417', '黔江区', '6870', '2', '500');
INSERT INTO `fy_bank_area` VALUES ('1418', '城口县', '6681', '2', '500');
INSERT INTO `fy_bank_area` VALUES ('1419', '武隆县', '6695', '2', '500');
INSERT INTO `fy_bank_area` VALUES ('1420', '云阳县', '6676', '2', '500');
INSERT INTO `fy_bank_area` VALUES ('1421', '奉节县', '6677', '2', '500');
INSERT INTO `fy_bank_area` VALUES ('1422', '巫山县', '6678', '2', '500');
INSERT INTO `fy_bank_area` VALUES ('1423', '巫溪县', '6679', '2', '500');
INSERT INTO `fy_bank_area` VALUES ('1424', '酉阳县', '6874', '2', '500');
INSERT INTO `fy_bank_area` VALUES ('1425', '石柱县', '6871', '2', '500');
INSERT INTO `fy_bank_area` VALUES ('1426', '成都市', '6510', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1427', '自贡市', '6550', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1428', '荣县', '6551', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1429', '富顺县', '6552', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1430', '攀枝花市', '6560', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1431', '米易县', '6561', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1432', '盐边县', '6562', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1433', '泸州市', '6570', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1434', '泸县', '6571', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1435', '合江县', '6572', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1436', '叙永县', '6574', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1437', '古蔺县', '6575', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1438', '德阳市', '6580', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1439', '绵竹县', '6581', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1440', '中江县', '6582', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1441', '什邡县', '6583', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1442', '广汉市', '6584', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1443', '罗江县', '6585', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1444', '绵阳市', '6590', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1445', '三台县', '6591', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1446', '盐亭县', '6592', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1447', '安县', '6593', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1448', '梓潼县', '6594', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1449', '北川羌族自治县', '6595', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1450', '平武县', '6596', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1451', '江油市', '6597', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1452', '广元市', '6610', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1453', '旺苍县', '6611', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1454', '青川县', '6612', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1455', '剑阁县', '6613', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1456', '苍溪县', '6614', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1457', '遂宁市', '6620', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1458', '蓬溪县', '6621', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1459', '射洪县', '6622', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1460', '大英县', '6623', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1461', '内江市', '6630', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1462', '威远县', '6634', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1463', '资中县', '6635', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1464', '隆昌县', '6638', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1465', '乐山市', '6650', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1466', '犍为县', '6653', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1467', '井研县', '6654', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1468', '夹江县', '6655', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1469', '沐川县', '6658', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1470', '峨边彝族自治县', '6662', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1471', '马边彝族自治县', '6663', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1472', '峨眉山市', '6664', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1473', '宜宾市', '6710', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1474', '宜宾县', '6712', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1475', '南溪县', '6713', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1476', '江安县', '6714', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1477', '长宁县', '6715', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1478', '高县', '6716', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1479', '筠连县', '6717', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1480', '珙县', '6718', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1481', '兴文县', '6719', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1482', '屏山县', '6721', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1483', '南充市', '6730', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1484', '南部县', '6734', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1485', '营山县', '6736', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1486', '蓬安县', '6738', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1487', '仪陇县', '6739', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1488', '西充县', '6742', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1489', '阆中县', '6743', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1490', '达州市', '6750', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1491', '达县', '6752', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1492', '宣汉县', '6753', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1493', '开江县', '6754', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1494', '万源县', '6755', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1495', '大竹县', '6761', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1496', '渠县', '6762', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1497', '雅安市', '6770', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1498', '名山县', '6772', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1499', '荥经县', '6773', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1500', '汉源县', '6774', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1501', '石棉县', '6775', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1502', '天全县', '6776', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1503', '芦山县', '6777', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1504', '宝兴县', '6778', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1505', '阿坝藏族羌族自治州', '6790', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1506', '汶川县', '6791', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1507', '理县', '6792', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1508', '茂县', '6793', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1509', '松潘县', '6794', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1510', '九寨沟县', '6795', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1511', '小金县', '6797', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1512', '黑水县', '6798', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1513', '壤塘县', '6801', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1514', '阿坝县', '6802', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1515', '若尔盖县', '6803', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1516', '红原县', '6804', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1517', '甘孜藏族自治州', '6810', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1518', '泸定县', '6812', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1519', '丹巴县', '6813', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1520', '九龙县', '6814', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1521', '雅江县', '6815', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1522', '道孚县', '6816', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1523', '炉霍县', '6817', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1524', '甘孜县', '6818', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1525', '新龙县', '6819', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1526', '德格县', '6821', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1527', '白玉县', '6822', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1528', '石渠县', '6823', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1529', '色达县', '6824', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1530', '理塘县', '6825', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1531', '巴塘县', '6826', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1532', '乡城县', '6827', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1533', '稻城县', '6828', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1534', '得荣县', '6829', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1535', '凉山彝族自治州', '6840', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1536', '木里藏族自治县', '6842', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1537', '盐源县', '6843', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1538', '会理县', '6845', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1539', '会东县', '6846', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1540', '宁南县', '6847', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1541', '普格县', '6848', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1542', '布拖县', '6849', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1543', '金阳县', '6851', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1544', '昭觉县', '6852', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1545', '喜德县', '6853', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1546', '冕宁县', '6854', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1547', '越西县', '6855', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1548', '甘洛县', '6856', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1549', '美姑县', '6857', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1550', '雷波县', '6858', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1551', '金川县', '6805', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1552', '德昌县', '6859', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1553', '眉山市', '6652', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1554', '仁寿县', '6651', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1555', '彭山县', '6657', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1556', '洪雅县', '6656', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1557', '丹棱县', '6665', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1558', '青神县', '6659', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1559', '广安市', '6737', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1560', '岳池县', '6735', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1561', '武胜县', '6741', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1562', '邻水县', '6763', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1563', '华蓥市', '6732', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1564', '巴中市', '6758', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1565', '通江县', '6756', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1566', '南江县', '6757', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1567', '平昌县', '6759', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1568', '安岳县', '6633', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1569', '乐至县', '6632', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1570', '简阳市', '6637', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1571', '纳溪县', '6573', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1572', '资阳市', '6636', '2', '510');
INSERT INTO `fy_bank_area` VALUES ('1573', '贵阳市', '7010', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1574', '六盘水市', '7020', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1575', '水城县', '7021', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1576', '盘县', '7022', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1577', '遵义市', '7030', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1578', '遵义县', '7032', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1579', '桐梓县', '7033', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1580', '绥阳县', '7034', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1581', '正安县', '7035', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1582', '道真县', '7036', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1583', '务川县', '7037', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1584', '凤冈县', '7038', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1585', '湄潭县', '7039', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1586', '余庆县', '7041', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1587', '仁怀市', '7042', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1588', '赤水市', '7043', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1589', '习水县', '7044', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1590', '铜仁地区', '7050', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1591', '江口县', '7052', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1592', '玉屏侗族自治县', '7053', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1593', '石阡县', '7054', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1594', '思南县', '7055', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1595', '印江县', '7056', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1596', '德江县', '7057', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1597', '沿河土家族自治县', '7058', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1598', '松桃苗族自治县', '7059', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1599', '万山', '7061', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1600', '黔西南布依族苗族自治州', '7070', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1601', '兴仁县', '7072', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1602', '普安县', '7073', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1603', '晴隆县', '7074', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1604', '贞丰县', '7075', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1605', '望谟县', '7076', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1606', '册亨县', '7077', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1607', '安龙县', '7078', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1608', '毕节地区', '7090', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1609', '大方县', '7092', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1610', '黔西县', '7093', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1611', '金沙县', '7094', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1612', '织金县', '7095', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1613', '纳雍县', '7096', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1614', '威宁县', '7097', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1615', '赫章县', '7098', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1616', '安顺市', '7110', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1617', '平坝县', '7117', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1618', '普定县', '7118', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1619', '关岭县', '7119', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1620', '镇宁县', '7121', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1621', '紫云县', '7122', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1622', '黔东南苗族侗族自治州', '7130', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1623', '黄平县', '7132', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1624', '施秉县', '7133', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1625', '三穗县', '7134', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1626', '镇远县', '7135', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1627', '岑巩县', '7136', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1628', '天柱县', '7137', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1629', '锦屏县', '7138', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1630', '剑河县', '7139', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1631', '台江县', '7141', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1632', '黎平县', '7142', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1633', '榕江县', '7143', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1634', '从江县', '7144', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1635', '雷山县', '7145', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1636', '麻江县', '7146', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1637', '丹寨县', '7147', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1638', '黔南布依族苗族自治州', '7150', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1639', '荔波县', '7152', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1640', '贵定县', '7153', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1641', '福泉县', '7154', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1642', '瓮安县', '7155', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1643', '独山县', '7156', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1644', '平塘县', '7157', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1645', '罗甸县', '7158', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1646', '长顺县', '7159', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1647', '龙里县', '7161', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1648', '惠水县', '7162', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1649', '三都水族自治县', '7163', '2', '520');
INSERT INTO `fy_bank_area` VALUES ('1650', '梁河县', '7543', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1651', '昆明市', '7310', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1652', '昭通市', '7340', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1653', '鲁甸县', '7342', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1654', '巧家县', '7343', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1655', '盐津县', '7344', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1656', '大关县', '7345', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1657', '永善县', '7346', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1658', '绥江县', '7347', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1659', '镇雄县', '7348', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1660', '彝良县', '7349', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1661', '威信县', '7351', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1662', '永富县', '7352', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1663', '曲靖市', '7360', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1664', '马龙县', '7362', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1665', '宣威市', '7363', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1666', '富源县', '7364', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1667', '罗平县', '7365', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1668', '师宗县', '7366', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1669', '陆良县', '7367', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1670', '会泽县', '7369', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1671', '沾益县', '7371', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1672', '楚雄彝族自治州', '7380', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1673', '双柏县', '7382', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1674', '牟定县', '7383', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1675', '南华县', '7384', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1676', '姚安县', '7385', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1677', '大姚县', '7386', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1678', '永仁县', '7387', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1679', '元谋县', '7388', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1680', '武定县', '7389', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1681', '禄丰县', '7391', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1682', '玉溪市', '7410', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1683', '江川县', '7412', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1684', '澄江县', '7413', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1685', '通海县', '7414', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1686', '华宁县', '7415', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1687', '易门县', '7416', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1688', '峨山县', '7417', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1689', '新平县', '7418', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1690', '元江县', '7419', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1691', '红河哈尼族彝族自治州', '7430', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1692', '开远市', '7432', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1693', '蒙自县', '7433', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1694', '屏边苗族自治县', '7434', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1695', '建水县', '7435', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1696', '石屏县', '7436', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1697', '弥勒县', '7437', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1698', '泸西县', '7438', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1699', '元阳县', '7439', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1700', '红河县', '7441', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1701', '金平苗族瑶族傣族自治县', '7442', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1702', '绿春县', '7443', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1703', '河口县', '7444', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1704', '文山壮族苗族自治州', '7450', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1705', '砚山县', '7452', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1706', '西畴县', '7453', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1707', '麻栗坡县', '7454', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1708', '马关县', '7455', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1709', '丘北县', '7456', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1710', '广南县', '7457', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1711', '富宁县', '7458', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1712', '普洱市', '7470', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1713', '宁洱哈尼族彝族自治县', '7472', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1714', '墨江哈尼族自治县', '7473', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1715', '景东彝族自治县', '7474', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1716', '景谷县', '7475', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1717', '镇沅彝族哈尼族拉祜族自治县', '7476', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1718', '江城哈尼族彝族自治县', '7477', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1719', '孟连傣族拉祜族佤族自治县', '7478', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1720', '澜沧拉祜族自治县', '7479', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1721', '西盟佤族自治县', '7481', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1722', '西双版纳傣族自治州', '7490', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1723', '勐海县', '7492', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1724', '勐腊县', '7493', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1725', '大理白族自治州', '7510', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1726', '漾濞彝族自治县', '7512', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1727', '祥云县', '7513', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1728', '宾川县', '7514', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1729', '弥渡县', '7515', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1730', '南涧彝族自治县', '7516', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1731', '巍山彝族回族自治县', '7517', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1732', '永平县', '7518', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1733', '云龙县', '7519', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1734', '洱源县', '7521', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1735', '剑川县', '7522', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1736', '鹤庆县', '7523', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1737', '保山市', '7530', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1738', '施甸县', '7532', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1739', '腾冲县', '7533', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1740', '龙陵县', '7534', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1741', '昌宁县', '7535', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1742', '德宏傣族景颇族自治州', '7540', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1743', '盈江县', '7544', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1744', '陇川县', '7545', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1745', '瑞丽市', '7546', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1746', '丽江市', '7550', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1747', '永胜县', '7552', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1748', '华坪县', '7553', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1749', '宁蒗彝族自治县', '7554', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1750', '怒江傈僳族自治州', '7560', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1751', '福贡县', '7562', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1752', '贡山独龙族怒族自治县', '7563', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1753', '兰坪白族普米族自治县', '7564', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1754', '迪庆藏族自治州', '7570', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1755', '德钦县', '7572', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1756', '维西傈僳族自治县', '7573', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1757', '临沧市', '7580', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1758', '凤庆县', '7582', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1759', '云县', '7583', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1760', '永德县', '7584', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1761', '镇康县', '7585', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1762', '双江拉祜族佤族布朗族傣族自治县', '7586', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1763', '耿马县', '7587', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1764', '沧源佤族自治县', '7588', '2', '530');
INSERT INTO `fy_bank_area` VALUES ('1765', '安多县', '7794', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1766', '申扎县', '7795', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1767', '索县', '7796', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1768', '班戈县', '7797', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1769', '巴青县', '7798', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1770', '尼玛县', '7799', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1771', '阿里地区', '7810', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1772', '普兰县', '7811', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1773', '札达县', '7812', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1774', '日土县', '7813', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1775', '革吉县', '7814', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1776', '改则县', '7815', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1777', '措勤县', '7816', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1778', '林芝地区', '7830', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1779', '工布江达县', '7831', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1780', '米林县', '7832', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1781', '墨脱县', '7833', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1782', '波密县', '7834', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1783', '察隅县', '7835', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1784', '朗县', '7836', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1785', '边坝县', '7730', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1786', '错那县', '7750', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1787', '康马县', '7770', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1788', '拉萨市', '7700', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1789', '双湖', '7800', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1790', '樟木口岸', '7711', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1791', '昌都地区', '7720', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1792', '江达县', '7721', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1793', '贡觉县', '7722', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1794', '类乌齐县', '7723', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1795', '丁青县', '7724', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1796', '察雅县', '7725', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1797', '八宿县', '7726', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1798', '左贡县', '7727', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1799', '芒康县', '7728', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1800', '洛隆县', '7729', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1801', '山南地区', '7740', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1802', '扎囊县', '7741', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1803', '贡嘎县', '7742', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1804', '桑日县', '7743', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1805', '琼结县', '7744', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1806', '曲松县', '7745', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1807', '措美县', '7746', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1808', '洛扎县', '7747', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1809', '加查县', '7748', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1810', '隆子县', '7749', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1811', '浪卡子县', '7751', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1812', '日喀则地区', '7760', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1813', '南木林县', '7761', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1814', '江孜县', '7762', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1815', '定日县', '7763', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1816', '萨迦县', '7764', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1817', '拉孜县', '7765', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1818', '昂仁县', '7766', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1819', '谢通门县', '7767', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1820', '白朗县', '7768', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1821', '仁布县', '7769', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1822', '定结县', '7771', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1823', '仲巴县', '7772', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1824', '亚东县', '7773', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1825', '吉隆县', '7774', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1826', '聂拉木县', '7775', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1827', '萨嘎县', '7776', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1828', '岗巴县', '7777', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1829', '那曲地区', '7790', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1830', '嘉黎县', '7791', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1831', '比如县', '7792', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1832', '聂荣县', '7793', '2', '540');
INSERT INTO `fy_bank_area` VALUES ('1833', '西安市', '7910', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1834', '铜川市', '7920', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1835', '宜君县', '7922', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1836', '宝鸡市', '7930', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1837', '凤翔县', '7932', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1838', '岐山县', '7933', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1839', '扶风县', '7934', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1840', '眉县', '7935', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1841', '陇县', '7936', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1842', '千阳县', '7937', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1843', '麟游县', '7938', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1844', '凤县', '7939', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1845', '太白县', '7941', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1846', '咸阳市', '7950', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1847', '兴平市', '7951', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1848', '三原县', '7952', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1849', '泾阳县', '7953', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1850', '乾县', '7954', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1851', '礼泉县', '7955', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1852', '永寿县', '7956', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1853', '彬县', '7957', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1854', '长武县', '7958', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1855', '旬邑县', '7959', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1856', '淳化县', '7961', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1857', '武功县', '7962', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1858', '渭南市', '7970', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1859', '韩城市', '7972', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1860', '华县', '7973', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1861', '华阴市', '7974', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1862', '潼关县', '7975', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1863', '大荔县', '7976', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1864', '蒲城县', '7977', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1865', '澄城县', '7978', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1866', '白水县', '7979', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1867', '合阳县', '7981', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1868', '富平县', '7982', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1869', '汉中市', '7990', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1870', '南郑县', '7992', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1871', '城固县', '7993', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1872', '洋县', '7994', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1873', '西乡县', '7995', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1874', '勉县', '7996', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1875', '宁强县', '7997', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1876', '略阳县', '7998', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1877', '镇巴县', '7999', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1878', '留坝县', '8001', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1879', '佛坪县', '8002', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1880', '安康市', '8010', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1881', '汉阴县', '8012', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1882', '石泉县', '8013', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1883', '宁陕县', '8014', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1884', '紫阳县', '8015', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1885', '岚皋县', '8016', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1886', '平利县', '8017', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1887', '镇坪县', '8018', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1888', '旬阳县', '8019', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1889', '白河县', '8021', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1890', '商洛市', '8030', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1891', '洛南县', '8032', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1892', '丹凤县', '8033', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1893', '商南县', '8034', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1894', '山阳县', '8035', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1895', '镇安县', '8036', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1896', '柞水县', '8037', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1897', '延安市', '8040', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1898', '延长县', '8042', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1899', '延川县', '8043', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1900', '子长县', '8044', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1901', '安塞县', '8045', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1902', '志丹县', '8046', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1903', '吴起县', '8047', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1904', '甘泉县', '8048', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1905', '富县', '8049', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1906', '洛川县', '8051', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1907', '宜川县', '8052', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1908', '黄龙县', '8053', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1909', '黄陵县', '8054', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1910', '榆林市', '8060', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1911', '神木县', '8062', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1912', '府谷县', '8063', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1913', '横山县', '8064', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1914', '靖边县', '8065', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1915', '定边县', '8066', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1916', '绥德县', '8067', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1917', '米脂县', '8068', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1918', '佳县', '8069', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1919', '吴堡县', '8071', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1920', '清涧县', '8072', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1921', '子洲县', '8073', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1922', '耀县', '7921', '2', '610');
INSERT INTO `fy_bank_area` VALUES ('1923', '兰州市', '8210', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1924', '嘉峪关市', '8220', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1925', '金昌市', '8230', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1926', '永昌县', '8231', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1927', '白银市', '8240', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1928', '靖远县', '8241', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1929', '会宁县', '8242', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1930', '景泰县', '8243', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1931', '天水市', '8250', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1932', '清水县', '8251', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1933', '秦安县', '8252', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1934', '甘谷县', '8253', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1935', '武山县', '8254', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1936', '张家川回族自治县', '8255', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1937', '酒泉市', '8260', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1938', '玉门市', '8261', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1939', '敦煌市', '8263', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1940', '金塔县', '8264', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1941', '肃北蒙古族自治县', '8265', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1942', '阿克塞县', '8266', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1943', '瓜州县', '8267', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1944', '张掖市', '8270', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1945', '肃南裕固族自治县', '8272', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1946', '民乐县', '8273', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1947', '临泽县', '8274', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1948', '高台县', '8275', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1949', '山丹县', '8276', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1950', '武威市', '8280', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1951', '民勤县', '8282', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1952', '古浪县', '8283', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1953', '天祝藏族自治县', '8284', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1954', '定西市', '8290', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1955', '通渭县', '8292', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1956', '陇西县', '8293', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1957', '渭源县', '8294', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1958', '临洮县', '8295', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1959', '漳县', '8296', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1960', '岷县', '8297', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1961', '陇南市', '8310', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1962', '宕昌县', '8312', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1963', '成县', '8313', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1964', '康县', '8314', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1965', '文县', '8315', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1966', '西和县', '8316', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1967', '礼县', '8317', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1968', '两当县', '8318', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1969', '徽县', '8319', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1970', '平凉市', '8330', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1971', '泾川县', '8332', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1972', '灵台县', '8333', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1973', '崇信县', '8334', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1974', '华亭县', '8335', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1975', '庄浪县', '8336', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1976', '静宁县', '8337', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1977', '庆阳市', '8340', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1978', '庆城县', '8342', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1979', '环县', '8343', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1980', '华池县', '8344', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1981', '合水县', '8345', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1982', '正宁县', '8346', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1983', '宁县', '8347', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1984', '镇原县', '8348', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1985', '临夏回族自治州', '8360', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1986', '临夏县', '8362', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1987', '康乐县', '8363', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1988', '永靖县', '8364', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1989', '广河县', '8365', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1990', '和政县', '8366', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1991', '东乡族自治县', '8367', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1992', '积石山县', '8368', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1993', '甘南藏族自治州', '8380', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1994', '临潭县', '8381', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1995', '卓尼县', '8382', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1996', '舟曲县', '8383', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1997', '迭部县', '8384', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1998', '玛曲县', '8385', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('1999', '碌曲县', '8386', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('2000', '夏河县', '8387', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('2001', '平川', '8244', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('2002', '武都县', '8311', '2', '620');
INSERT INTO `fy_bank_area` VALUES ('2003', '西宁市', '8510', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2004', '海东地区', '8520', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2005', '平安县', '8521', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2006', '民和回族土族自治县', '8522', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2007', '乐都县', '8523', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2008', '互助土族自治县', '8526', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2009', '化隆回族自治县', '8527', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2010', '循化撒拉族自治县', '8528', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2011', '海北藏族自治州', '8540', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2012', '门源回族自治县', '8541', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2013', '祁连县', '8542', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2014', '海晏县', '8543', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2015', '刚察县', '8544', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2016', '黄南藏族自治州', '8550', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2017', '同仁县', '8551', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2018', '尖扎县', '8552', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2019', '泽库县', '8553', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2020', '河南蒙古族自治县', '8554', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2021', '海南藏族自治州', '8560', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2022', '共和县', '8561', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2023', '同德县', '8562', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2024', '贵德县', '8563', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2025', '兴海县', '8564', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2026', '贵南县', '8565', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2027', '果洛藏族自治州', '8570', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2028', '玛沁县', '8571', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2029', '班玛县', '8572', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2030', '甘德县', '8573', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2031', '达日县', '8574', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2032', '久治县', '8575', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2033', '玛多县', '8576', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2034', '玉树藏族自治州', '8580', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2035', '玉树县', '8581', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2036', '杂多县', '8582', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2037', '称多县', '8583', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2038', '治多县', '8584', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2039', '囊谦县', '8585', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2040', '曲麻莱县', '8586', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2041', '海西蒙古族藏族自治州', '8590', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2042', '格尔木市', '8591', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2043', '德令哈市', '8592', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2044', '乌兰县', '8593', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2045', '都兰县', '8594', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2046', '天峻县', '8595', '2', '630');
INSERT INTO `fy_bank_area` VALUES ('2047', '银川市', '8710', '2', '640');
INSERT INTO `fy_bank_area` VALUES ('2048', '石嘴山市', '8720', '2', '640');
INSERT INTO `fy_bank_area` VALUES ('2049', '平罗县', '8721', '2', '640');
INSERT INTO `fy_bank_area` VALUES ('2050', '青铜峡市', '8732', '2', '640');
INSERT INTO `fy_bank_area` VALUES ('2051', '盐池县', '8736', '2', '640');
INSERT INTO `fy_bank_area` VALUES ('2052', '同心县', '8737', '2', '640');
INSERT INTO `fy_bank_area` VALUES ('2053', '西吉县', '8743', '2', '640');
INSERT INTO `fy_bank_area` VALUES ('2054', '隆德县', '8744', '2', '640');
INSERT INTO `fy_bank_area` VALUES ('2055', '泾源县', '8745', '2', '640');
INSERT INTO `fy_bank_area` VALUES ('2056', '彭阳县', '8746', '2', '640');
INSERT INTO `fy_bank_area` VALUES ('2057', '吴忠市', '8731', '2', '640');
INSERT INTO `fy_bank_area` VALUES ('2058', '固原市', '8741', '2', '640');
INSERT INTO `fy_bank_area` VALUES ('2059', '中宁县', '8734', '2', '640');
INSERT INTO `fy_bank_area` VALUES ('2060', '海原县', '8742', '2', '640');
INSERT INTO `fy_bank_area` VALUES ('2061', '陶乐县', '8722', '2', '640');
INSERT INTO `fy_bank_area` VALUES ('2062', '惠农县', '8723', '2', '640');
INSERT INTO `fy_bank_area` VALUES ('2063', '中卫县', '8733', '2', '640');
INSERT INTO `fy_bank_area` VALUES ('2064', '乌鲁木齐', '8810', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2065', '克拉玛依市', '8820', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2066', '吐鲁番地区', '8830', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2067', '鄯善县', '8832', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2068', '托克逊县', '8833', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2069', '哈密地区', '8840', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2070', '巴里坤哈萨克自治县', '8842', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2071', '伊吾县', '8843', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2072', '昌吉回族自治州', '8850', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2073', '米泉市', '8852', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2074', '呼图壁县', '8853', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2075', '玛纳斯县', '8854', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2076', '奇台县', '8855', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2077', '阜康市', '8856', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2078', '吉木萨尔县', '8857', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2079', '五家渠市', '8858', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2080', '博尔塔拉蒙古自治州', '8870', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2081', '木垒哈萨克自治县', '8859', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2082', '北屯县', '8844', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2083', '新疆博州阿拉山口口岸', '8847', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2084', '石河子市', '9028', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2085', '三道岭县', '9029', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2086', '阿拉尔市', '9031', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2087', '图木舒克市', '9032', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2088', '精河县', '8872', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2089', '温泉县', '8873', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2090', '巴音郭楞蒙古自治州', '8880', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2091', '轮台县', '8882', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2092', '尉犁县', '8883', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2093', '若羌县', '8884', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2094', '且末县', '8885', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2095', '焉耆回族自治县', '8886', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2096', '和静县', '8887', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2097', '和硕县', '8888', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2098', '博湖县', '8889', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2099', '阿克苏地区', '8910', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2100', '温宿县', '8912', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2101', '库车县', '8913', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2102', '沙雅县', '8914', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2103', '新和县', '8915', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2104', '拜城县', '8916', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2105', '乌什县', '8917', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2106', '阿瓦提县', '8918', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2107', '柯坪县', '8919', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2108', '克孜勒苏柯尔克孜自治州', '8930', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2109', '阿克陶县', '8932', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2110', '阿合奇县', '8933', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2111', '乌恰县', '8934', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2112', '喀什地区', '8940', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2113', '疏附县', '8942', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2114', '疏勒县', '8943', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2115', '英吉沙县', '8944', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2116', '泽普县', '8945', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2117', '莎车县', '8946', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2118', '叶城县', '8947', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2119', '麦盖提县', '8948', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2120', '岳普湖县', '8949', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2121', '伽师县', '8951', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2122', '巴楚县', '8952', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2123', '塔什库尔干塔吉克县', '8953', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2124', '和田地区', '8960', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2125', '墨玉县', '8963', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2126', '皮山县', '8964', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2127', '洛浦县', '8965', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2128', '策勒县', '8966', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2129', '于田县', '8967', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2130', '民丰县', '8968', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2131', '伊犁哈萨克自治州', '8980', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2132', '奎屯市', '8981', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2133', '伊宁县', '8992', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2134', '察布查尔锡伯自治县', '8993', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2135', '霍城县', '8994', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2136', '巩留县', '8995', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2137', '新源县', '8996', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2138', '昭苏县', '8997', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2139', '特克斯县', '8998', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2140', '尼勒克县', '8999', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2141', '塔城地区', '9010', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2142', '额敏县', '9012', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2143', '乌苏市', '9013', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2144', '沙湾县', '9014', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2145', '托里县', '9015', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2146', '裕民县', '9016', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2147', '和布克赛尔蒙古自治县', '9017', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2148', '阿勒泰地区', '9020', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2149', '布尔津县', '9022', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2150', '富蕴县', '9023', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2151', '福海县', '9024', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2152', '哈巴河县', '9025', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2153', '青河县', '9026', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2154', '吉木乃县', '9027', '2', '650');
INSERT INTO `fy_bank_area` VALUES ('2155', '重庆市', '500', '1', '500');
INSERT INTO `fy_bank_area` VALUES ('2156', '境外', '000', '1', '000');
INSERT INTO `fy_bank_area` VALUES ('2157', '北京市', '110', '1', '110');
INSERT INTO `fy_bank_area` VALUES ('2158', '天津市', '120', '1', '120');
INSERT INTO `fy_bank_area` VALUES ('2159', '河北省', '130', '1', '130');
INSERT INTO `fy_bank_area` VALUES ('2160', '山西省', '140', '1', '140');
INSERT INTO `fy_bank_area` VALUES ('2161', '内蒙古自治区', '150', '1', '150');
INSERT INTO `fy_bank_area` VALUES ('2162', '辽宁省', '210', '1', '210');
INSERT INTO `fy_bank_area` VALUES ('2163', '吉林省', '220', '1', '220');
INSERT INTO `fy_bank_area` VALUES ('2164', '黑龙江省', '230', '1', '230');
INSERT INTO `fy_bank_area` VALUES ('2165', '上海市', '310', '1', '310');
INSERT INTO `fy_bank_area` VALUES ('2166', '江苏省', '320', '1', '320');
INSERT INTO `fy_bank_area` VALUES ('2167', '浙江省', '330', '1', '330');
INSERT INTO `fy_bank_area` VALUES ('2168', '安徽省', '340', '1', '340');
INSERT INTO `fy_bank_area` VALUES ('2169', '福建省', '350', '1', '350');
INSERT INTO `fy_bank_area` VALUES ('2170', '江西省', '360', '1', '360');
INSERT INTO `fy_bank_area` VALUES ('2171', '山东省', '370', '1', '370');
INSERT INTO `fy_bank_area` VALUES ('2172', '河南省', '410', '1', '410');
INSERT INTO `fy_bank_area` VALUES ('2173', '湖北省', '420', '1', '420');
INSERT INTO `fy_bank_area` VALUES ('2174', '湖南省', '430', '1', '430');
INSERT INTO `fy_bank_area` VALUES ('2175', '广东省', '440', '1', '440');
INSERT INTO `fy_bank_area` VALUES ('2176', '广西壮族自治区', '450', '1', '450');
INSERT INTO `fy_bank_area` VALUES ('2177', '海南省', '460', '1', '460');
INSERT INTO `fy_bank_area` VALUES ('2178', '四川省', '510', '1', '510');
INSERT INTO `fy_bank_area` VALUES ('2179', '贵州省', '520', '1', '520');
INSERT INTO `fy_bank_area` VALUES ('2180', '云南省', '530', '1', '530');
INSERT INTO `fy_bank_area` VALUES ('2181', '西藏自治区', '540', '1', '540');
INSERT INTO `fy_bank_area` VALUES ('2182', '陕西省', '610', '1', '610');
INSERT INTO `fy_bank_area` VALUES ('2183', '甘肃省', '620', '1', '620');
INSERT INTO `fy_bank_area` VALUES ('2184', '青海省', '630', '1', '630');
INSERT INTO `fy_bank_area` VALUES ('2185', '宁夏回族自治区', '640', '1', '640');
INSERT INTO `fy_bank_area` VALUES ('2186', '新疆维吾尔自治区', '650', '1', '650');

-- ----------------------------
-- Table structure for `fy_fund_record`
-- ----------------------------
DROP TABLE IF EXISTS `fy_fund_record`;
CREATE TABLE `fy_fund_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(20) NOT NULL COMMENT '用户ID，关联users.id',
  `serial_num` varchar(50) DEFAULT NULL COMMENT '流水号',
  `pay_for_serial_num` varchar(50) DEFAULT NULL COMMENT '债转时垫付利息对应的出借编号',
  `amt` int(11) NOT NULL COMMENT '交易金额，单位为分',
  `deal` tinyint(4) NOT NULL COMMENT '交易类型，1/充值 2/提现 3/划拨 4/提现手续费 5/放款提现 6/流标退款 7/奖励 8/划拨预冻结 9/债转时,平台垫付利息',
  `status` tinyint(4) NOT NULL COMMENT '操作状态，1/请求成功 2/成功 3/失败',
  `to_uid` varchar(20) DEFAULT NULL COMMENT '划拨到别的用户',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `serial_num` (`serial_num`)
) ENGINE=InnoDB AUTO_INCREMENT=468 DEFAULT CHARSET=utf8 COMMENT='富友资金记录表';

-- ----------------------------
-- Records of fy_fund_record
-- ----------------------------
INSERT INTO `fy_fund_record` VALUES ('1', '225', null, null, '160000', '8', '2', '187', '2018-06-01 16:02:01', '2018-06-01 16:02:01');
INSERT INTO `fy_fund_record` VALUES ('2', '136', null, null, '40000', '8', '2', '187', '2018-06-01 16:05:30', '2018-06-01 16:05:30');
INSERT INTO `fy_fund_record` VALUES ('3', '187', '201806011607008791', null, '200000', '5', '1', null, '2018-06-01 16:07:02', '2018-06-01 16:07:02');
INSERT INTO `fy_fund_record` VALUES ('4', '187', null, null, '1600', '3', '2', 'user112', '2018-06-01 16:12:24', '2018-06-01 16:12:24');
INSERT INTO `fy_fund_record` VALUES ('5', '187', null, null, '1600', '3', '2', 'user112', '2018-06-01 16:12:27', '2018-06-01 16:12:27');
INSERT INTO `fy_fund_record` VALUES ('6', '187', null, null, '1600', '3', '2', 'user112', '2018-06-01 16:12:28', '2018-06-01 16:12:28');
INSERT INTO `fy_fund_record` VALUES ('7', '187', null, null, '1600', '3', '2', 'user112', '2018-06-01 16:12:31', '2018-06-01 16:12:31');
INSERT INTO `fy_fund_record` VALUES ('8', '187', null, null, '1600', '3', '2', 'user112', '2018-06-01 16:12:33', '2018-06-01 16:12:33');
INSERT INTO `fy_fund_record` VALUES ('9', '187', null, null, '1600', '3', '2', 'user112', '2018-06-01 16:12:35', '2018-06-01 16:12:35');
INSERT INTO `fy_fund_record` VALUES ('10', '136', null, null, '110000', '8', '2', '187', '2018-06-01 16:19:04', '2018-06-01 16:19:04');
INSERT INTO `fy_fund_record` VALUES ('11', '136', null, null, '300000', '8', '2', '187', '2018-06-01 16:56:09', '2018-06-01 16:56:09');
INSERT INTO `fy_fund_record` VALUES ('12', '136', null, null, '100000', '8', '2', '187', '2018-06-01 17:12:06', '2018-06-01 17:12:06');
INSERT INTO `fy_fund_record` VALUES ('13', '18236968869', null, null, '100000', '6', '2', '136', '2018-06-01 17:15:15', '2018-06-01 17:15:15');
INSERT INTO `fy_fund_record` VALUES ('14', '136', null, null, '350000', '8', '2', '187', '2018-06-01 17:21:53', '2018-06-01 17:21:53');
INSERT INTO `fy_fund_record` VALUES ('15', '225', null, null, '250000', '8', '2', '187', '2018-06-01 17:23:02', '2018-06-01 17:23:02');
INSERT INTO `fy_fund_record` VALUES ('16', '187', '201806011723121699', null, '600000', '5', '1', null, '2018-06-01 17:23:13', '2018-06-01 17:23:13');
INSERT INTO `fy_fund_record` VALUES ('17', '187', null, null, '5000', '3', '2', 'user112', '2018-06-01 17:31:09', '2018-06-01 17:31:09');
INSERT INTO `fy_fund_record` VALUES ('18', '187', null, null, '5000', '3', '2', 'user112', '2018-06-01 17:31:11', '2018-06-01 17:31:11');
INSERT INTO `fy_fund_record` VALUES ('19', '187', null, null, '5000', '3', '2', 'user112', '2018-06-01 17:31:13', '2018-06-01 17:31:13');
INSERT INTO `fy_fund_record` VALUES ('20', '187', null, null, '5000', '3', '2', 'user112', '2018-06-01 17:31:15', '2018-06-01 17:31:15');
INSERT INTO `fy_fund_record` VALUES ('21', '187', null, null, '5000', '3', '2', 'user112', '2018-06-01 17:31:17', '2018-06-01 17:31:17');
INSERT INTO `fy_fund_record` VALUES ('22', '187', null, null, '5000', '3', '2', 'user112', '2018-06-01 17:31:19', '2018-06-01 17:31:19');
INSERT INTO `fy_fund_record` VALUES ('23', '136', null, null, '300000', '8', '2', '187', '2018-06-01 17:46:46', '2018-06-01 17:46:46');
INSERT INTO `fy_fund_record` VALUES ('24', '136', null, null, '160000', '8', '2', '187', '2018-06-04 10:08:34', '2018-06-04 10:08:34');
INSERT INTO `fy_fund_record` VALUES ('25', '225', null, null, '140000', '8', '2', '187', '2018-06-04 10:13:54', '2018-06-04 10:13:54');
INSERT INTO `fy_fund_record` VALUES ('26', 'user112', null, null, '300000', '3', '2', '187', '2018-06-04 10:17:58', '2018-06-04 10:17:58');
INSERT INTO `fy_fund_record` VALUES ('27', '187', '201806041017587508', null, '300000', '5', '1', null, '2018-06-04 10:17:58', '2018-06-04 10:17:58');
INSERT INTO `fy_fund_record` VALUES ('28', '187', null, null, '2400', '3', '2', 'user112', '2018-06-04 10:23:50', '2018-06-04 10:23:50');
INSERT INTO `fy_fund_record` VALUES ('29', '225', null, null, '360000', '8', '2', '187', '2018-06-04 10:30:03', '2018-06-04 10:30:03');
INSERT INTO `fy_fund_record` VALUES ('30', '136', null, null, '140000', '8', '2', '187', '2018-06-04 10:31:37', '2018-06-04 10:31:37');
INSERT INTO `fy_fund_record` VALUES ('31', '187', '201806041034469606', null, '500000', '5', '1', null, '2018-06-04 10:34:47', '2018-06-04 10:34:47');
INSERT INTO `fy_fund_record` VALUES ('32', '187', null, null, '4083', '3', '2', 'user112', '2018-06-04 10:40:16', '2018-06-04 10:40:16');
INSERT INTO `fy_fund_record` VALUES ('33', '187', null, null, '4083', '3', '2', 'user112', '2018-06-04 10:40:17', '2018-06-04 10:40:17');
INSERT INTO `fy_fund_record` VALUES ('34', '187', null, null, '4083', '3', '2', 'user112', '2018-06-04 10:40:20', '2018-06-04 10:40:20');
INSERT INTO `fy_fund_record` VALUES ('35', '187', null, null, '4083', '3', '2', 'user112', '2018-06-04 10:40:21', '2018-06-04 10:40:21');
INSERT INTO `fy_fund_record` VALUES ('36', '187', null, null, '4083', '3', '2', 'user112', '2018-06-04 10:40:23', '2018-06-04 10:40:23');
INSERT INTO `fy_fund_record` VALUES ('37', '187', null, null, '4083', '3', '2', 'user112', '2018-06-04 10:40:25', '2018-06-04 10:40:25');
INSERT INTO `fy_fund_record` VALUES ('38', '225', '201806041702042397', null, '10000', '1', '2', null, '2018-06-04 17:02:10', '2018-06-04 17:02:10');
INSERT INTO `fy_fund_record` VALUES ('39', '225', '201806061505489233', null, '1010', '2', '1', null, '2018-06-06 15:05:50', '2018-06-06 15:05:50');
INSERT INTO `fy_fund_record` VALUES ('40', '225', '201806061506281088', null, '100', '2', '1', null, '2018-06-06 15:06:28', '2018-06-06 15:06:28');
INSERT INTO `fy_fund_record` VALUES ('41', '225', '201806061539527579', null, '1000', '1', '2', null, '2018-06-06 15:39:58', '2018-06-06 15:39:58');
INSERT INTO `fy_fund_record` VALUES ('42', '225', '201806061549366185', null, '1000', '1', '2', null, '2018-06-06 15:49:46', '2018-06-06 15:49:46');
INSERT INTO `fy_fund_record` VALUES ('43', '225', '201806061551357296', null, '1000', '2', '1', null, '2018-06-06 15:51:36', '2018-06-06 15:51:36');
INSERT INTO `fy_fund_record` VALUES ('44', '187', null, null, '10000', '8', '2', '225', '2018-06-06 15:55:45', '2018-06-06 15:55:45');
INSERT INTO `fy_fund_record` VALUES ('45', '187', '201806061556546974', null, '1000', '2', '1', null, '2018-06-06 15:56:55', '2018-06-06 15:56:55');
INSERT INTO `fy_fund_record` VALUES ('46', '187', '201806061706399338', null, '1000', '1', '2', null, '2018-06-06 17:06:44', '2018-06-06 17:06:44');
INSERT INTO `fy_fund_record` VALUES ('47', '187', null, null, '10000', '8', '2', '225', '2018-06-06 17:07:32', '2018-06-06 17:07:32');
INSERT INTO `fy_fund_record` VALUES ('48', '187', '201806061724018132', null, '1000', '2', '1', null, '2018-06-06 17:24:02', '2018-06-06 17:24:02');
INSERT INTO `fy_fund_record` VALUES ('49', 'user112', null, null, '10100', '7', '2', '187', '2018-06-06 17:25:01', '2018-06-06 17:25:01');
INSERT INTO `fy_fund_record` VALUES ('50', '187', null, null, '10000', '8', '2', '225', '2018-06-07 10:14:54', '2018-06-07 10:14:54');
INSERT INTO `fy_fund_record` VALUES ('51', '187', null, null, '70000', '8', '2', '225', '2018-06-07 10:16:06', '2018-06-07 10:16:06');
INSERT INTO `fy_fund_record` VALUES ('52', '225', '201806071017005919', null, '100000', '5', '1', null, '2018-06-07 10:17:00', '2018-06-07 10:17:00');
INSERT INTO `fy_fund_record` VALUES ('53', '225', '201806071138059859', null, '10000', '1', '2', null, '2018-06-07 11:38:14', '2018-06-07 11:38:14');
INSERT INTO `fy_fund_record` VALUES ('59', '136', null, null, '90909', '8', '2', '188', '2018-06-08 15:36:49', '2018-06-08 15:36:49');
INSERT INTO `fy_fund_record` VALUES ('60', '136', null, null, '90909', '8', '2', '188', '2018-06-08 15:37:47', '2018-06-08 15:37:47');
INSERT INTO `fy_fund_record` VALUES ('61', '136', null, null, '90909', '8', '2', '188', '2018-06-08 15:38:41', '2018-06-08 15:38:41');
INSERT INTO `fy_fund_record` VALUES ('62', '136', null, null, '90909', '8', '2', '188', '2018-06-08 15:39:02', '2018-06-08 15:39:03');
INSERT INTO `fy_fund_record` VALUES ('63', '136', null, null, '90909', '8', '2', '188', '2018-06-08 15:54:48', '2018-06-08 15:54:48');
INSERT INTO `fy_fund_record` VALUES ('64', '136', null, null, '45455', '8', '2', '188', '2018-06-08 16:17:34', '2018-06-08 16:17:34');
INSERT INTO `fy_fund_record` VALUES ('65', '136', null, null, '136364', '8', '2', '188', '2018-06-08 16:26:25', '2018-06-08 16:26:26');
INSERT INTO `fy_fund_record` VALUES ('68', '136', null, null, '45454', '8', '2', '188', '2018-06-08 16:40:28', '2018-06-08 16:40:28');
INSERT INTO `fy_fund_record` VALUES ('79', '136', null, null, '45455', '8', '2', '188', '2018-06-11 16:15:24', '2018-06-11 16:15:24');
INSERT INTO `fy_fund_record` VALUES ('83', '136', null, null, '45454', '8', '2', '188', '2018-06-11 16:23:03', '2018-06-11 16:23:03');
INSERT INTO `fy_fund_record` VALUES ('84', '140', null, null, '4545', '8', '2', '188', '2018-06-11 16:23:53', '2018-06-11 16:23:53');
INSERT INTO `fy_fund_record` VALUES ('85', '136', null, null, '455', '8', '2', '188', '2018-06-11 16:34:41', '2018-06-11 16:34:41');
INSERT INTO `fy_fund_record` VALUES ('86', '140', null, null, '455', '8', '2', '188', '2018-06-11 16:37:43', '2018-06-11 16:37:43');
INSERT INTO `fy_fund_record` VALUES ('87', '136', null, null, '455', '8', '2', '188', '2018-06-11 16:37:56', '2018-06-11 16:37:56');
INSERT INTO `fy_fund_record` VALUES ('88', '140', null, null, '455', '8', '2', '188', '2018-06-11 19:21:48', '2018-06-11 19:21:48');
INSERT INTO `fy_fund_record` VALUES ('89', '140', null, null, '455', '8', '2', '188', '2018-06-11 19:25:42', '2018-06-11 19:25:42');
INSERT INTO `fy_fund_record` VALUES ('90', '140', null, null, '455', '8', '2', '188', '2018-06-11 19:26:46', '2018-06-11 19:26:46');
INSERT INTO `fy_fund_record` VALUES ('91', '140', null, null, '455', '8', '2', '188', '2018-06-11 19:28:08', '2018-06-11 19:28:08');
INSERT INTO `fy_fund_record` VALUES ('92', '140', null, null, '4545', '8', '2', '188', '2018-06-11 19:29:46', '2018-06-11 19:29:46');
INSERT INTO `fy_fund_record` VALUES ('93', '140', null, null, '455', '8', '2', '188', '2018-06-11 19:32:49', '2018-06-11 19:32:49');
INSERT INTO `fy_fund_record` VALUES ('94', '140', null, null, '455', '8', '2', '188', '2018-06-11 19:37:20', '2018-06-11 19:37:20');
INSERT INTO `fy_fund_record` VALUES ('95', '140', null, null, '455', '8', '2', '188', '2018-06-11 19:42:10', '2018-06-11 19:42:10');
INSERT INTO `fy_fund_record` VALUES ('96', '140', null, null, '455', '8', '2', '188', '2018-06-11 19:44:38', '2018-06-11 19:44:38');
INSERT INTO `fy_fund_record` VALUES ('97', 'user112', null, null, '1000000', '7', '2', '248', '2018-06-12 16:41:22', '2018-06-12 16:41:22');
INSERT INTO `fy_fund_record` VALUES ('98', '140', null, null, '179089', '8', '2', '188', '2018-06-12 17:02:23', '2018-06-12 17:02:23');
INSERT INTO `fy_fund_record` VALUES ('99', '140', null, null, '97726', '8', '2', '188', '2018-06-12 17:03:09', '2018-06-12 17:03:09');
INSERT INTO `fy_fund_record` VALUES ('100', '140', null, null, '1000', '8', '2', '187', '2018-06-20 11:36:06', '2018-06-20 11:36:06');
INSERT INTO `fy_fund_record` VALUES ('101', '140', null, null, '1000', '8', '2', '187', '2018-06-20 11:36:45', '2018-06-20 11:36:45');
INSERT INTO `fy_fund_record` VALUES ('102', '140', null, null, '10000', '8', '2', '248', '2018-06-20 13:41:31', '2018-06-20 13:41:31');
INSERT INTO `fy_fund_record` VALUES ('103', '136', null, null, '10000', '8', '2', '229', '2018-06-20 13:43:51', '2018-06-20 13:43:51');
INSERT INTO `fy_fund_record` VALUES ('104', '140', null, null, '10000', '8', '2', '248', '2018-06-20 13:44:05', '2018-06-20 13:44:05');
INSERT INTO `fy_fund_record` VALUES ('105', '136', null, null, '10000', '8', '2', '229', '2018-06-20 13:47:15', '2018-06-20 13:47:15');
INSERT INTO `fy_fund_record` VALUES ('106', '136', null, null, '10000', '8', '2', '229', '2018-06-20 13:47:56', '2018-06-20 13:47:56');
INSERT INTO `fy_fund_record` VALUES ('107', '261', null, null, '10000', '8', '2', '229', '2018-06-20 13:48:44', '2018-06-20 13:48:44');
INSERT INTO `fy_fund_record` VALUES ('108', '140', null, null, '6667', '8', '2', '229', '2018-06-20 13:50:19', '2018-06-20 13:50:19');
INSERT INTO `fy_fund_record` VALUES ('109', '140', null, null, '3333', '8', '2', '248', '2018-06-20 13:50:19', '2018-06-20 13:50:19');
INSERT INTO `fy_fund_record` VALUES ('110', '261', null, null, '12000', '8', '2', '229', '2018-06-20 13:50:48', '2018-06-20 13:50:48');
INSERT INTO `fy_fund_record` VALUES ('111', '140', null, null, '6483', '8', '2', '229', '2018-06-20 13:52:13', '2018-06-20 13:52:13');
INSERT INTO `fy_fund_record` VALUES ('112', '140', null, null, '3517', '8', '2', '248', '2018-06-20 13:52:13', '2018-06-20 13:52:13');
INSERT INTO `fy_fund_record` VALUES ('113', '140', null, null, '6483', '8', '2', '229', '2018-06-20 13:53:42', '2018-06-20 13:53:42');
INSERT INTO `fy_fund_record` VALUES ('114', '140', null, null, '3517', '8', '2', '248', '2018-06-20 13:53:42', '2018-06-20 13:53:42');
INSERT INTO `fy_fund_record` VALUES ('115', '261', '201806201353295198', null, '200000', '1', '2', null, '2018-06-20 13:53:47', '2018-06-20 13:53:47');
INSERT INTO `fy_fund_record` VALUES ('116', '136', null, null, '10000', '8', '2', '229', '2018-06-20 14:04:10', '2018-06-20 14:04:10');
INSERT INTO `fy_fund_record` VALUES ('117', '261', null, null, '62000', '8', '2', '248', '2018-06-20 14:03:06', '2018-06-20 14:03:06');
INSERT INTO `fy_fund_record` VALUES ('118', '140', '201806201407203860', null, '10000', '1', '2', null, '2018-06-20 14:07:40', '2018-06-20 14:07:40');
INSERT INTO `fy_fund_record` VALUES ('119', '136', null, null, '7633', '8', '2', '248', '2018-06-20 14:14:26', '2018-06-20 14:14:26');
INSERT INTO `fy_fund_record` VALUES ('120', '140', null, null, '10000', '8', '2', '229', '2018-06-20 14:23:50', '2018-06-20 14:23:50');
INSERT INTO `fy_fund_record` VALUES ('121', '248', '201806201430474487', null, '100000', '5', '1', null, '2018-06-20 14:30:47', '2018-06-20 14:30:47');
INSERT INTO `fy_fund_record` VALUES ('122', '136', null, null, '10000', '8', '2', '229', '2018-06-20 14:42:11', '2018-06-20 14:42:11');
INSERT INTO `fy_fund_record` VALUES ('123', '136', null, null, '98367', '8', '2', '229', '2018-06-20 14:42:33', '2018-06-20 14:42:33');
INSERT INTO `fy_fund_record` VALUES ('130', '136', null, null, '1667', '8', '2', '248', '2018-06-20 16:43:27', '2018-06-20 16:43:27');
INSERT INTO `fy_fund_record` VALUES ('131', '136', null, null, '8333', '8', '2', '188', '2018-06-20 16:43:27', '2018-06-20 16:43:27');
INSERT INTO `fy_fund_record` VALUES ('132', '136', null, null, '18333', '8', '2', '248', '2018-06-20 16:45:13', '2018-06-20 16:45:13');
INSERT INTO `fy_fund_record` VALUES ('133', '136', null, null, '91667', '8', '2', '188', '2018-06-20 16:45:13', '2018-06-20 16:45:13');
INSERT INTO `fy_fund_record` VALUES ('134', '136', null, null, '50000', '8', '2', '188', '2018-06-20 16:45:53', '2018-06-20 16:45:53');
INSERT INTO `fy_fund_record` VALUES ('135', '136', null, null, '80000', '8', '2', '248', '2018-06-20 16:46:59', '2018-06-20 16:46:59');
INSERT INTO `fy_fund_record` VALUES ('136', '136', null, null, '350000', '8', '2', '188', '2018-06-20 16:46:59', '2018-06-20 16:46:59');
INSERT INTO `fy_fund_record` VALUES ('137', '261', null, null, '10000', '8', '2', '229', '2018-06-20 17:06:26', '2018-06-20 17:06:26');
INSERT INTO `fy_fund_record` VALUES ('138', '261', null, null, '6897', '8', '2', '264', '2018-06-20 17:09:08', '2018-06-20 17:09:08');
INSERT INTO `fy_fund_record` VALUES ('139', '261', null, null, '3103', '8', '2', '229', '2018-06-20 17:09:08', '2018-06-20 17:09:08');
INSERT INTO `fy_fund_record` VALUES ('140', '248', '201806201732207072', null, '100000', '5', '1', null, '2018-06-20 17:32:20', '2018-06-20 17:32:20');
INSERT INTO `fy_fund_record` VALUES ('141', '188', '201806201732212005', null, '500000', '5', '1', null, '2018-06-20 17:32:22', '2018-06-20 17:32:22');
INSERT INTO `fy_fund_record` VALUES ('142', '261', null, null, '80000', '8', '2', '229', '2018-06-20 17:45:59', '2018-06-20 17:45:59');
INSERT INTO `fy_fund_record` VALUES ('149', '266', null, null, '10000', '8', '2', '178', '2018-06-21 10:08:16', '2018-06-21 10:08:16');
INSERT INTO `fy_fund_record` VALUES ('150', '266', null, null, '10000', '8', '2', '264', '2018-06-21 10:08:16', '2018-06-21 10:08:16');
INSERT INTO `fy_fund_record` VALUES ('153', '266', null, null, '90000', '8', '2', '178', '2018-06-21 10:10:03', '2018-06-21 10:10:03');
INSERT INTO `fy_fund_record` VALUES ('154', '266', null, null, '90000', '8', '2', '264', '2018-06-21 10:10:03', '2018-06-21 10:10:03');
INSERT INTO `fy_fund_record` VALUES ('155', '178', '201806211010531763', null, '100000', '5', '1', null, '2018-06-21 10:10:53', '2018-06-21 10:10:53');
INSERT INTO `fy_fund_record` VALUES ('156', '264', '201806211010555749', null, '100000', '5', '1', null, '2018-06-21 10:10:55', '2018-06-21 10:10:55');
INSERT INTO `fy_fund_record` VALUES ('157', '267', null, null, '100000', '8', '2', '229', '2018-06-21 10:17:27', '2018-06-21 10:17:27');
INSERT INTO `fy_fund_record` VALUES ('158', '229', '201806211021507598', null, '100000', '5', '1', null, '2018-06-21 10:21:51', '2018-06-21 10:21:51');
INSERT INTO `fy_fund_record` VALUES ('159', '266', null, null, '20000', '8', '2', '248', '2018-06-21 10:33:12', '2018-06-21 10:33:12');
INSERT INTO `fy_fund_record` VALUES ('160', '266', null, null, '180000', '8', '2', '248', '2018-06-21 10:34:00', '2018-06-21 10:34:00');
INSERT INTO `fy_fund_record` VALUES ('161', '248', '201806211036324434', null, '200000', '5', '1', null, '2018-06-21 10:36:33', '2018-06-21 10:36:33');
INSERT INTO `fy_fund_record` VALUES ('168', '267', null, null, '10000', '8', '2', '229', '2018-06-21 13:14:25', '2018-06-21 13:14:25');
INSERT INTO `fy_fund_record` VALUES ('169', '261', null, null, '11000', '8', '2', '229', '2018-06-21 13:16:23', '2018-06-21 13:16:23');
INSERT INTO `fy_fund_record` VALUES ('170', '267', null, null, '179000', '8', '2', '229', '2018-06-21 13:30:25', '2018-06-21 13:30:25');
INSERT INTO `fy_fund_record` VALUES ('171', '267', null, null, '10000', '8', '2', '264', '2018-06-21 13:32:51', '2018-06-21 13:32:51');
INSERT INTO `fy_fund_record` VALUES ('172', '229', '201806211334459309', null, '200000', '5', '1', null, '2018-06-21 13:34:46', '2018-06-21 13:34:46');
INSERT INTO `fy_fund_record` VALUES ('209', '261', null, null, '10000', '3', '2', '267', '2018-06-21 14:14:18', '2018-06-21 14:14:18');
INSERT INTO `fy_fund_record` VALUES ('210', '266', null, null, '490000', '8', '2', '264', '2018-06-21 14:14:46', '2018-06-21 14:14:46');
INSERT INTO `fy_fund_record` VALUES ('211', '264', '201806211415314771', null, '500000', '5', '1', null, '2018-06-21 14:15:32', '2018-06-21 14:15:32');
INSERT INTO `fy_fund_record` VALUES ('213', '267', null, null, '90000', '8', '2', '188', '2018-06-21 14:41:50', '2018-06-21 14:41:50');
INSERT INTO `fy_fund_record` VALUES ('214', '266', null, null, '10000', '8', '2', '188', '2018-06-21 14:43:28', '2018-06-21 14:43:28');
INSERT INTO `fy_fund_record` VALUES ('215', '188', '201806211444216903', null, '100000', '5', '1', null, '2018-06-21 14:44:22', '2018-06-21 14:44:22');
INSERT INTO `fy_fund_record` VALUES ('216', '248', null, null, '90000', '3', '2', '267', '2018-06-21 15:01:06', '2018-06-21 15:01:06');
INSERT INTO `fy_fund_record` VALUES ('217', '267', null, null, '10000', '3', '2', '261', '2018-06-21 15:17:24', '2018-06-21 15:17:24');
INSERT INTO `fy_fund_record` VALUES ('218', '248', '201806211626542852', null, '2000', '2', '1', null, '2018-06-21 16:26:55', '2018-06-21 16:26:55');
INSERT INTO `fy_fund_record` VALUES ('219', '248', '201806211627417449', null, '2000', '2', '1', null, '2018-06-21 16:27:56', '2018-06-21 16:27:56');
INSERT INTO `fy_fund_record` VALUES ('220', '248', '201806211632188294', null, '2300', '2', '1', null, '2018-06-21 16:32:20', '2018-06-21 16:32:20');
INSERT INTO `fy_fund_record` VALUES ('222', '266', null, null, '11000', '3', '2', '261', '2018-06-21 16:47:14', '2018-06-21 16:47:14');
INSERT INTO `fy_fund_record` VALUES ('223', '266', '201806211719192863', null, '1000000', '1', '2', null, '2018-06-21 17:19:47', '2018-06-21 17:19:47');
INSERT INTO `fy_fund_record` VALUES ('224', '266', '201806211727293478', null, '400', '1', '2', null, '2018-06-21 17:27:38', '2018-06-21 17:27:38');
INSERT INTO `fy_fund_record` VALUES ('226', '266', '201806211730362193', null, '1000', '2', '1', null, '2018-06-21 17:30:37', '2018-06-21 17:30:37');
INSERT INTO `fy_fund_record` VALUES ('227', '266', '201806211802066528', null, '400', '1', '2', null, '2018-06-21 18:02:20', '2018-06-21 18:02:20');
INSERT INTO `fy_fund_record` VALUES ('232', '266', '201806211820019949', null, '100000', '1', '2', null, '2018-06-21 18:20:12', '2018-06-21 18:20:12');
INSERT INTO `fy_fund_record` VALUES ('233', '261', '201806211837462903', null, '10000', '1', '2', null, '2018-06-21 18:37:54', '2018-06-21 18:37:54');
INSERT INTO `fy_fund_record` VALUES ('234', '266', '201806211841298362', null, '10000', '2', '1', null, '2018-06-21 18:41:30', '2018-06-21 18:41:30');
INSERT INTO `fy_fund_record` VALUES ('235', '266', '201806211842398449', null, '10000', '2', '1', null, '2018-06-21 18:42:39', '2018-06-21 18:42:39');
INSERT INTO `fy_fund_record` VALUES ('236', '229', null, null, '1600', '3', '2', 'user112', '2018-06-21 18:43:37', '2018-06-21 18:43:37');
INSERT INTO `fy_fund_record` VALUES ('237', '261', '201806211852134722', null, '5000000', '1', '2', null, '2018-06-21 18:52:20', '2018-06-21 18:52:20');
INSERT INTO `fy_fund_record` VALUES ('238', '261', '201806211854582851', null, '10000', '2', '1', null, '2018-06-21 18:54:59', '2018-06-21 18:54:59');
INSERT INTO `fy_fund_record` VALUES ('239', '261', null, null, '10000', '8', '2', '229', '2018-06-21 19:06:55', '2018-06-21 19:06:55');
INSERT INTO `fy_fund_record` VALUES ('240', '261', null, null, '10000', '8', '2', '229', '2018-06-21 19:07:36', '2018-06-21 19:07:36');
INSERT INTO `fy_fund_record` VALUES ('241', '261', null, null, '80000', '8', '2', '229', '2018-06-21 19:10:01', '2018-06-21 19:10:01');
INSERT INTO `fy_fund_record` VALUES ('242', '266', '201806211909487828', null, '400', '1', '2', null, '2018-06-21 19:10:04', '2018-06-21 19:10:04');
INSERT INTO `fy_fund_record` VALUES ('244', '229', '201806211910497563', null, '100000', '5', '1', null, '2018-06-21 19:10:50', '2018-06-21 19:10:50');
INSERT INTO `fy_fund_record` VALUES ('246', '229', null, null, '800', '3', '2', 'user112', '2018-06-21 19:13:52', '2018-06-21 19:13:52');
INSERT INTO `fy_fund_record` VALUES ('247', '266', '201806211920084983', null, '400', '1', '2', null, '2018-06-21 19:20:22', '2018-06-21 19:20:22');
INSERT INTO `fy_fund_record` VALUES ('249', '266', '201806211921344252', null, '400', '1', '2', null, '2018-06-21 19:22:11', '2018-06-21 19:22:11');
INSERT INTO `fy_fund_record` VALUES ('251', '266', '201806211923405792', null, '400', '1', '2', null, '2018-06-21 19:23:56', '2018-06-21 19:23:56');
INSERT INTO `fy_fund_record` VALUES ('253', '266', '201806211924279700', null, '400', '1', '2', null, '2018-06-21 19:24:36', '2018-06-21 19:24:36');
INSERT INTO `fy_fund_record` VALUES ('257', '248', null, null, '100000', '8', '2', '229', '2018-06-22 10:26:39', '2018-06-22 10:26:39');
INSERT INTO `fy_fund_record` VALUES ('258', '248', null, null, '99900', '8', '2', '229', '2018-06-22 10:28:20', '2018-06-22 10:28:20');
INSERT INTO `fy_fund_record` VALUES ('259', '248', null, null, '100', '8', '2', '229', '2018-06-22 10:28:44', '2018-06-22 10:28:44');
INSERT INTO `fy_fund_record` VALUES ('260', '229', '201806221029168644', null, '200000', '5', '1', null, '2018-06-22 10:29:16', '2018-06-22 10:29:16');
INSERT INTO `fy_fund_record` VALUES ('261', '267', null, null, '60000', '8', '2', '229', '2018-06-22 11:03:53', '2018-06-22 11:03:53');
INSERT INTO `fy_fund_record` VALUES ('262', '267', null, null, '40000', '8', '2', '229', '2018-06-22 11:07:03', '2018-06-22 11:07:03');
INSERT INTO `fy_fund_record` VALUES ('263', '229', '201806221107463116', null, '100000', '5', '1', null, '2018-06-22 11:07:47', '2018-06-22 11:07:47');
INSERT INTO `fy_fund_record` VALUES ('264', '261', null, null, '40000', '3', '2', '267', '2018-06-22 11:16:10', '2018-06-22 11:16:10');
INSERT INTO `fy_fund_record` VALUES ('265', '265', null, null, '150000', '8', '2', '264', '2018-06-22 11:28:51', '2018-06-22 11:28:51');
INSERT INTO `fy_fund_record` VALUES ('266', '261', null, null, '60000', '3', '2', '267', '2018-06-22 11:31:26', '2018-06-22 11:31:26');
INSERT INTO `fy_fund_record` VALUES ('267', '248', null, null, '60000', '3', '2', '261', '2018-06-22 11:35:24', '2018-06-22 11:35:24');
INSERT INTO `fy_fund_record` VALUES ('268', '266', null, null, '150000', '8', '2', '264', '2018-06-22 11:39:13', '2018-06-22 11:39:13');
INSERT INTO `fy_fund_record` VALUES ('269', '264', '201806221141319052', null, '300000', '5', '1', null, '2018-06-22 11:41:32', '2018-06-22 11:41:32');
INSERT INTO `fy_fund_record` VALUES ('270', '229', null, null, '800', '3', '2', 'user112', '2018-06-22 11:45:27', '2018-06-22 11:45:27');
INSERT INTO `fy_fund_record` VALUES ('271', '266', '201806221320203476', null, '40000', '1', '2', null, '2018-06-22 13:20:44', '2018-06-22 13:20:44');
INSERT INTO `fy_fund_record` VALUES ('273', '266', null, null, '20000', '8', '2', '248', '2018-06-22 13:37:34', '2018-06-22 13:37:34');
INSERT INTO `fy_fund_record` VALUES ('275', '266', null, null, '10000', '8', '2', '248', '2018-06-22 13:42:20', '2018-06-22 13:42:20');
INSERT INTO `fy_fund_record` VALUES ('277', '266', null, null, '10000', '8', '2', '248', '2018-06-22 13:43:48', '2018-06-22 13:43:48');
INSERT INTO `fy_fund_record` VALUES ('284', '266', null, null, '129231', '8', '2', '248', '2018-06-22 13:55:11', '2018-06-22 13:55:11');
INSERT INTO `fy_fund_record` VALUES ('285', '266', null, null, '80769', '8', '2', '229', '2018-06-22 13:55:11', '2018-06-22 13:55:11');
INSERT INTO `fy_fund_record` VALUES ('288', '266', null, null, '18461', '8', '2', '248', '2018-06-22 13:58:56', '2018-06-22 13:58:56');
INSERT INTO `fy_fund_record` VALUES ('289', '266', null, null, '11539', '8', '2', '229', '2018-06-22 13:58:56', '2018-06-22 13:58:56');
INSERT INTO `fy_fund_record` VALUES ('292', '261', null, null, '12308', '8', '2', '248', '2018-06-22 14:03:31', '2018-06-22 14:03:31');
INSERT INTO `fy_fund_record` VALUES ('293', '261', null, null, '7692', '8', '2', '229', '2018-06-22 14:03:31', '2018-06-22 14:03:31');
INSERT INTO `fy_fund_record` VALUES ('294', '248', '201806221404113610', null, '200000', '5', '1', null, '2018-06-22 14:04:32', '2018-06-22 14:04:32');
INSERT INTO `fy_fund_record` VALUES ('295', '229', '201806221404585594', null, '100000', '5', '1', null, '2018-06-22 14:05:02', '2018-06-22 14:05:02');
INSERT INTO `fy_fund_record` VALUES ('296', '248', '201806221405053650', null, '200000', '5', '1', null, '2018-06-22 14:05:10', '2018-06-22 14:05:10');
INSERT INTO `fy_fund_record` VALUES ('297', '229', '201806221405172379', null, '100000', '5', '1', null, '2018-06-22 14:05:32', '2018-06-22 14:05:32');
INSERT INTO `fy_fund_record` VALUES ('298', '266', '201806221408165026', null, '100', '1', '2', null, '2018-06-22 14:08:49', '2018-06-22 14:08:49');
INSERT INTO `fy_fund_record` VALUES ('302', '261', '201806221421437434', null, '20000', '1', '2', null, '2018-06-22 14:22:15', '2018-06-22 14:22:15');
INSERT INTO `fy_fund_record` VALUES ('304', '266', null, null, '20000', '3', '2', '261', '2018-06-22 14:36:29', '2018-06-22 14:36:29');
INSERT INTO `fy_fund_record` VALUES ('306', '266', null, null, '40000', '3', '2', '261', '2018-06-22 14:37:35', '2018-06-22 14:37:35');
INSERT INTO `fy_fund_record` VALUES ('307', '229', null, null, '3360', '3', '2', '261', '2018-06-22 14:37:45', '2018-06-22 14:37:45');
INSERT INTO `fy_fund_record` VALUES ('308', '267', null, null, '200000', '8', '2', '229', '2018-06-22 14:47:37', '2018-06-22 14:47:37');
INSERT INTO `fy_fund_record` VALUES ('309', '266', null, null, '160000', '8', '2', '264', '2018-06-22 14:50:49', '2018-06-22 14:50:49');
INSERT INTO `fy_fund_record` VALUES ('310', '266', null, null, '10000', '8', '2', '264', '2018-06-22 14:52:12', '2018-06-22 14:52:12');
INSERT INTO `fy_fund_record` VALUES ('311', '266', null, null, '10000', '8', '2', '264', '2018-06-22 14:53:27', '2018-06-22 14:53:27');
INSERT INTO `fy_fund_record` VALUES ('312', '229', '201806221453413405', null, '200000', '5', '1', null, '2018-06-22 14:53:42', '2018-06-22 14:53:42');
INSERT INTO `fy_fund_record` VALUES ('313', '261', null, null, '200000', '3', '2', '267', '2018-06-22 14:58:19', '2018-06-22 14:58:19');
INSERT INTO `fy_fund_record` VALUES ('314', '265', null, null, '120000', '8', '2', '264', '2018-06-22 14:59:06', '2018-06-22 14:59:06');
INSERT INTO `fy_fund_record` VALUES ('315', '264', '201806221500023276', null, '300000', '5', '1', null, '2018-06-22 15:00:03', '2018-06-22 15:00:03');
INSERT INTO `fy_fund_record` VALUES ('316', '266', null, null, '100000', '8', '2', '178', '2018-06-22 15:08:45', '2018-06-22 15:08:45');
INSERT INTO `fy_fund_record` VALUES ('317', '266', '201806221509268385', null, '200000', '1', '2', null, '2018-06-22 15:09:36', '2018-06-22 15:09:36');
INSERT INTO `fy_fund_record` VALUES ('318', '266', null, null, '200000', '3', '2', '261', '2018-06-22 15:09:36', '2018-06-22 15:09:36');
INSERT INTO `fy_fund_record` VALUES ('319', '266', null, null, '100000', '8', '2', '178', '2018-06-22 15:10:14', '2018-06-22 15:10:14');
INSERT INTO `fy_fund_record` VALUES ('320', '265', '201806221511083095', null, '200', '1', '2', null, '2018-06-22 15:11:17', '2018-06-22 15:11:17');
INSERT INTO `fy_fund_record` VALUES ('321', '265', '201806221511444514', null, '200', '1', '2', null, '2018-06-22 15:11:59', '2018-06-22 15:11:59');
INSERT INTO `fy_fund_record` VALUES ('324', '261', '201806221537145234', null, '10000', '2', '1', null, '2018-06-22 15:37:14', '2018-06-22 15:37:14');
INSERT INTO `fy_fund_record` VALUES ('325', '264', null, null, '200000', '3', '2', '266', '2018-06-22 15:41:21', '2018-06-22 15:41:21');
INSERT INTO `fy_fund_record` VALUES ('326', '188', '201806221555389654', null, '100', '1', '2', null, '2018-06-22 15:55:46', '2018-06-22 15:55:46');
INSERT INTO `fy_fund_record` VALUES ('328', '266', null, null, '100000', '8', '2', '178', '2018-06-22 16:02:21', '2018-06-22 16:02:21');
INSERT INTO `fy_fund_record` VALUES ('330', '188', '201806221614011496', null, '120000', '1', '2', null, '2018-06-22 16:14:11', '2018-06-22 16:14:11');
INSERT INTO `fy_fund_record` VALUES ('331', '188', null, null, '120000', '3', '2', '265', '2018-06-22 16:14:12', '2018-06-22 16:14:12');
INSERT INTO `fy_fund_record` VALUES ('332', '261', '201806221627554971', null, '120000', '1', '2', null, '2018-06-22 16:28:10', '2018-06-22 16:28:10');
INSERT INTO `fy_fund_record` VALUES ('333', '261', null, null, '120000', '3', '2', '188', '2018-06-22 16:28:11', '2018-06-22 16:28:11');
INSERT INTO `fy_fund_record` VALUES ('334', '264', null, null, '2289', '3', '2', 'user112', '2018-06-22 17:02:44', '2018-06-22 17:02:44');
INSERT INTO `fy_fund_record` VALUES ('335', '265', null, null, '200000', '8', '2', '178', '2018-06-22 17:09:49', '2018-06-22 17:09:49');
INSERT INTO `fy_fund_record` VALUES ('336', '178', '201806221710188319', null, '500000', '5', '1', null, '2018-06-22 17:10:20', '2018-06-22 17:10:20');
INSERT INTO `fy_fund_record` VALUES ('337', '266', '201806221721415510', null, '200000', '1', '2', null, '2018-06-22 17:21:50', '2018-06-22 17:21:50');
INSERT INTO `fy_fund_record` VALUES ('338', '266', null, null, '200000', '3', '2', '265', '2018-06-22 17:21:50', '2018-06-22 17:21:50');
INSERT INTO `fy_fund_record` VALUES ('339', '265', '201806221725208153', null, '200000', '1', '2', null, '2018-06-22 17:25:28', '2018-06-22 17:25:28');
INSERT INTO `fy_fund_record` VALUES ('340', '265', null, null, '200000', '3', '2', '266', '2018-06-22 17:25:28', '2018-06-22 17:25:28');
INSERT INTO `fy_fund_record` VALUES ('341', '178', null, null, '4162', '3', '2', 'user112', '2018-06-22 17:26:57', '2018-06-22 17:26:57');
INSERT INTO `fy_fund_record` VALUES ('342', '266', null, null, '500000', '8', '2', '178', '2018-06-22 17:28:48', '2018-06-22 17:28:48');
INSERT INTO `fy_fund_record` VALUES ('343', '178', '201806221728553793', null, '500000', '5', '1', null, '2018-06-22 17:28:55', '2018-06-22 17:28:55');
INSERT INTO `fy_fund_record` VALUES ('344', '265', null, null, '100000', '8', '2', '264', '2018-06-23 13:20:23', '2018-06-23 13:20:23');
INSERT INTO `fy_fund_record` VALUES ('345', '264', '201806231322056959', null, '100000', '5', '1', null, '2018-06-23 13:22:06', '2018-06-23 13:22:06');
INSERT INTO `fy_fund_record` VALUES ('346', '265', '201806231332451328', null, '100000', '1', '2', null, '2018-06-23 13:32:54', '2018-06-23 13:32:54');
INSERT INTO `fy_fund_record` VALUES ('348', '266', null, null, '100000', '3', '2', '265', '2018-06-23 13:41:35', '2018-06-23 13:41:35');
INSERT INTO `fy_fund_record` VALUES ('349', '265', '201806231443282155', null, '100', '1', '2', null, '2018-06-23 14:43:33', '2018-06-23 14:43:33');
INSERT INTO `fy_fund_record` VALUES ('350', '264', null, null, '666', '3', '2', 'user112', '2018-06-23 14:46:53', '2018-06-23 14:46:53');
INSERT INTO `fy_fund_record` VALUES ('351', '140', null, null, '100000', '8', '2', '264', '2018-06-23 15:30:55', '2018-06-23 15:30:55');
INSERT INTO `fy_fund_record` VALUES ('352', '266', null, null, '42857', '8', '2', '178', '2018-06-23 15:34:03', '2018-06-23 15:34:03');
INSERT INTO `fy_fund_record` VALUES ('353', '266', null, null, '57143', '8', '2', '264', '2018-06-23 15:34:03', '2018-06-23 15:34:03');
INSERT INTO `fy_fund_record` VALUES ('354', '140', null, null, '200000', '8', '2', '178', '2018-06-23 15:53:55', '2018-06-23 15:53:55');
INSERT INTO `fy_fund_record` VALUES ('355', '140', null, null, '14286', '8', '2', '178', '2018-06-23 15:54:36', '2018-06-23 15:54:36');
INSERT INTO `fy_fund_record` VALUES ('356', '140', null, null, '85714', '8', '2', '264', '2018-06-23 15:54:36', '2018-06-23 15:54:36');
INSERT INTO `fy_fund_record` VALUES ('357', '265', null, null, '42857', '8', '2', '178', '2018-06-23 16:07:51', '2018-06-23 16:07:51');
INSERT INTO `fy_fund_record` VALUES ('358', '265', null, null, '257143', '8', '2', '264', '2018-06-23 16:07:51', '2018-06-23 16:07:51');
INSERT INTO `fy_fund_record` VALUES ('359', '178', '201806231626467727', null, '300000', '5', '1', null, '2018-06-23 16:26:47', '2018-06-23 16:26:47');
INSERT INTO `fy_fund_record` VALUES ('360', '264', '201806231626481805', null, '500000', '5', '1', null, '2018-06-23 16:26:49', '2018-06-23 16:26:49');
INSERT INTO `fy_fund_record` VALUES ('361', '266', null, null, '300000', '3', '2', '265', '2018-06-23 16:36:36', '2018-06-23 16:36:36');
INSERT INTO `fy_fund_record` VALUES ('362', '266', '201806241219383113', null, '10000', '2', '1', null, '2018-06-24 12:19:38', '2018-06-24 12:19:38');
INSERT INTO `fy_fund_record` VALUES ('363', '265', '201806241222556505', null, '10000', '2', '1', null, '2018-06-24 12:22:56', '2018-06-24 12:22:56');
INSERT INTO `fy_fund_record` VALUES ('364', '248', '201806241319321771', null, '10000', '2', '1', null, '2018-06-24 13:19:33', '2018-06-24 13:19:33');
INSERT INTO `fy_fund_record` VALUES ('365', '265', null, null, '112500', '8', '2', '178', '2018-06-24 13:32:50', '2018-06-24 13:32:50');
INSERT INTO `fy_fund_record` VALUES ('366', '265', null, null, '187500', '8', '2', '264', '2018-06-24 13:32:50', '2018-06-24 13:32:50');
INSERT INTO `fy_fund_record` VALUES ('367', '267', null, null, '214286', '8', '2', '229', '2018-06-24 13:33:34', '2018-06-24 13:33:34');
INSERT INTO `fy_fund_record` VALUES ('368', '267', null, null, '85714', '8', '2', '248', '2018-06-24 13:33:34', '2018-06-24 13:33:34');
INSERT INTO `fy_fund_record` VALUES ('369', '267', null, null, '110000', '8', '2', '248', '2018-06-24 13:34:22', '2018-06-24 13:34:22');
INSERT INTO `fy_fund_record` VALUES ('370', '267', null, null, '4286', '8', '2', '248', '2018-06-24 13:35:02', '2018-06-24 13:35:02');
INSERT INTO `fy_fund_record` VALUES ('371', '248', '201806241336008084', null, '200000', '5', '1', null, '2018-06-24 13:36:01', '2018-06-24 13:36:01');
INSERT INTO `fy_fund_record` VALUES ('372', '267', null, null, '10000', '8', '2', '229', '2018-06-24 13:36:35', '2018-06-24 13:36:35');
INSERT INTO `fy_fund_record` VALUES ('373', '266', null, null, '187500', '8', '2', '178', '2018-06-24 13:38:20', '2018-06-24 13:38:20');
INSERT INTO `fy_fund_record` VALUES ('374', '266', null, null, '312500', '8', '2', '264', '2018-06-24 13:38:21', '2018-06-24 13:38:21');
INSERT INTO `fy_fund_record` VALUES ('375', '178', '201806241344528261', null, '300000', '5', '1', null, '2018-06-24 13:44:52', '2018-06-24 13:44:52');
INSERT INTO `fy_fund_record` VALUES ('376', '264', '201806241344536796', null, '500000', '5', '1', null, '2018-06-24 13:44:54', '2018-06-24 13:44:54');
INSERT INTO `fy_fund_record` VALUES ('377', '261', null, null, '4286', '3', '2', '267', '2018-06-24 13:47:38', '2018-06-24 13:47:38');
INSERT INTO `fy_fund_record` VALUES ('378', '264', null, null, '3000', '3', '2', 'user112', '2018-06-24 13:53:06', '2018-06-24 13:53:06');
INSERT INTO `fy_fund_record` VALUES ('379', '248', null, null, '4286', '3', '2', '261', '2018-06-24 13:56:46', '2018-06-24 13:56:46');
INSERT INTO `fy_fund_record` VALUES ('380', '267', null, null, '200000', '8', '2', '229', '2018-06-24 14:20:25', '2018-06-24 14:20:25');
INSERT INTO `fy_fund_record` VALUES ('381', '267', null, null, '70000', '8', '2', '229', '2018-06-24 14:21:14', '2018-06-24 14:21:14');
INSERT INTO `fy_fund_record` VALUES ('382', '248', null, null, '5714', '8', '2', '229', '2018-06-24 14:26:18', '2018-06-24 14:26:18');
INSERT INTO `fy_fund_record` VALUES ('383', '229', '201806241426348521', null, '500000', '5', '1', null, '2018-06-24 14:26:35', '2018-06-24 14:26:35');
INSERT INTO `fy_fund_record` VALUES ('384', '265', '201806241443026814', null, '100000', '1', '2', null, '2018-06-24 14:43:07', '2018-06-24 14:43:07');
INSERT INTO `fy_fund_record` VALUES ('386', '248', null, null, '1600', '3', '2', 'user112', '2018-06-24 14:53:08', '2018-06-24 14:53:08');
INSERT INTO `fy_fund_record` VALUES ('387', '229', null, null, '4000', '3', '2', 'user112', '2018-06-24 14:57:41', '2018-06-24 14:57:41');
INSERT INTO `fy_fund_record` VALUES ('388', '261', '201806241509486610', null, '5050670', '2', '1', null, '2018-06-24 15:09:48', '2018-06-24 15:09:48');
INSERT INTO `fy_fund_record` VALUES ('389', '266', null, null, '300000', '3', '2', '265', '2018-06-24 15:13:15', '2018-06-24 15:13:15');
INSERT INTO `fy_fund_record` VALUES ('390', '265', '201806241515297784', null, '10000', '2', '1', null, '2018-06-24 15:15:29', '2018-06-24 15:15:29');
INSERT INTO `fy_fund_record` VALUES ('391', '265', '201806241521511603', null, '5000', '2', '1', null, '2018-06-24 15:21:51', '2018-06-24 15:21:51');
INSERT INTO `fy_fund_record` VALUES ('392', '261', '201806241522192646', null, '300000', '1', '2', null, '2018-06-24 15:22:29', '2018-06-24 15:22:29');
INSERT INTO `fy_fund_record` VALUES ('393', '261', null, null, '300000', '3', '2', '267', '2018-06-24 15:22:29', '2018-06-24 15:22:29');
INSERT INTO `fy_fund_record` VALUES ('394', '229', null, null, '18000', '3', '2', '267', '2018-06-24 15:22:30', '2018-06-24 15:22:30');
INSERT INTO `fy_fund_record` VALUES ('395', '248', null, null, '7199', '3', '2', '267', '2018-06-24 15:22:31', '2018-06-24 15:22:31');
INSERT INTO `fy_fund_record` VALUES ('396', '265', null, null, '52632', '8', '2', '248', '2018-06-24 15:46:31', '2018-06-24 15:46:31');
INSERT INTO `fy_fund_record` VALUES ('397', '265', null, null, '10526', '8', '2', '229', '2018-06-24 15:46:31', '2018-06-24 15:46:31');
INSERT INTO `fy_fund_record` VALUES ('398', '265', null, null, '73684', '8', '2', '264', '2018-06-24 15:46:31', '2018-06-24 15:46:31');
INSERT INTO `fy_fund_record` VALUES ('399', '265', null, null, '63158', '8', '2', '178', '2018-06-24 15:46:31', '2018-06-24 15:46:31');
INSERT INTO `fy_fund_record` VALUES ('400', '265', null, null, '50000', '8', '2', '229', '2018-06-24 15:54:18', '2018-06-24 15:54:18');
INSERT INTO `fy_fund_record` VALUES ('401', '261', null, null, '27113', '8', '2', '248', '2018-06-24 15:54:58', '2018-06-24 15:54:58');
INSERT INTO `fy_fund_record` VALUES ('402', '261', null, null, '2392', '8', '2', '229', '2018-06-24 15:54:58', '2018-06-24 15:54:58');
INSERT INTO `fy_fund_record` VALUES ('403', '261', null, null, '37959', '8', '2', '264', '2018-06-24 15:54:58', '2018-06-24 15:54:58');
INSERT INTO `fy_fund_record` VALUES ('404', '261', null, null, '32536', '8', '2', '178', '2018-06-24 15:54:58', '2018-06-24 15:54:58');
INSERT INTO `fy_fund_record` VALUES ('405', '265', null, null, '30000', '8', '2', '229', '2018-06-24 15:58:36', '2018-06-24 15:58:36');
INSERT INTO `fy_fund_record` VALUES ('406', '266', null, null, '7082', '8', '2', '229', '2018-06-24 16:28:15', '2018-06-24 16:28:15');
INSERT INTO `fy_fund_record` VALUES ('407', '266', null, null, '2778', '8', '2', '248', '2018-06-24 16:29:20', '2018-06-24 16:29:20');
INSERT INTO `fy_fund_record` VALUES ('408', '266', null, null, '3889', '8', '2', '264', '2018-06-24 16:29:20', '2018-06-24 16:29:20');
INSERT INTO `fy_fund_record` VALUES ('409', '266', null, null, '3333', '8', '2', '178', '2018-06-24 16:29:20', '2018-06-24 16:29:20');
INSERT INTO `fy_fund_record` VALUES ('410', '229', '201806241630189111', null, '100000', '5', '1', null, '2018-06-24 16:30:19', '2018-06-24 16:30:19');
INSERT INTO `fy_fund_record` VALUES ('411', '261', '201806241632513270', null, '30000', '1', '2', null, '2018-06-24 16:33:00', '2018-06-24 16:33:00');
INSERT INTO `fy_fund_record` VALUES ('412', '261', null, null, '30000', '3', '2', '265', '2018-06-24 16:33:00', '2018-06-24 16:33:00');
INSERT INTO `fy_fund_record` VALUES ('413', '265', null, null, '410000', '8', '2', '248', '2018-06-24 16:57:52', '2018-06-24 16:57:52');
INSERT INTO `fy_fund_record` VALUES ('414', '265', null, null, '7477', '8', '2', '248', '2018-06-24 16:58:32', '2018-06-24 16:58:32');
INSERT INTO `fy_fund_record` VALUES ('415', '248', '201806241659028175', null, '500000', '5', '1', null, '2018-06-24 16:59:02', '2018-06-24 16:59:02');
INSERT INTO `fy_fund_record` VALUES ('416', '261', '201806241703053624', null, '7400', '1', '2', null, '2018-06-24 17:03:15', '2018-06-24 17:03:15');
INSERT INTO `fy_fund_record` VALUES ('418', '267', '201806241704145414', null, '7400', '1', '2', null, '2018-06-24 17:04:23', '2018-06-24 17:04:23');
INSERT INTO `fy_fund_record` VALUES ('419', '267', null, null, '7477', '3', '2', '265', '2018-06-24 17:04:24', '2018-06-24 17:04:24');
INSERT INTO `fy_fund_record` VALUES ('420', '266', '201806241707404345', null, '50000', '1', '2', null, '2018-06-24 17:07:48', '2018-06-24 17:07:48');
INSERT INTO `fy_fund_record` VALUES ('421', '266', null, null, '50000', '3', '2', '265', '2018-06-24 17:07:48', '2018-06-24 17:07:48');
INSERT INTO `fy_fund_record` VALUES ('422', '265', null, null, '50000', '3', '2', '266', '2018-06-24 17:12:06', '2018-06-24 17:12:06');
INSERT INTO `fy_fund_record` VALUES ('423', '248', null, null, '3997', '3', '2', 'user112', '2018-06-24 17:14:48', '2018-06-24 17:14:48');
INSERT INTO `fy_fund_record` VALUES ('424', '266', null, null, '584231', '8', '2', '264', '2018-06-24 17:26:14', '2018-06-24 17:26:14');
INSERT INTO `fy_fund_record` VALUES ('425', '266', null, null, '500769', '8', '2', '178', '2018-06-24 17:26:14', '2018-06-24 17:26:14');
INSERT INTO `fy_fund_record` VALUES ('426', '266', null, null, '237', '8', '2', '264', '2018-06-24 17:26:34', '2018-06-24 17:26:34');
INSERT INTO `fy_fund_record` VALUES ('427', '266', null, null, '204', '8', '2', '178', '2018-06-24 17:26:34', '2018-06-24 17:26:34');
INSERT INTO `fy_fund_record` VALUES ('428', '264', '201806241727453273', null, '700000', '5', '1', null, '2018-06-24 17:27:45', '2018-06-24 17:27:45');
INSERT INTO `fy_fund_record` VALUES ('429', '178', '201806241727491329', null, '600000', '5', '1', null, '2018-06-24 17:27:50', '2018-06-24 17:27:50');
INSERT INTO `fy_fund_record` VALUES ('433', '178', null, null, '4797', '3', '2', 'user112', '2018-06-25 10:04:59', '2018-06-25 10:04:59');
INSERT INTO `fy_fund_record` VALUES ('434', '265', null, null, '100000', '8', '2', '178', '2018-06-25 10:07:31', '2018-06-25 10:07:31');
INSERT INTO `fy_fund_record` VALUES ('435', '265', null, null, '400000', '8', '2', '178', '2018-06-25 10:08:10', '2018-06-25 10:08:10');
INSERT INTO `fy_fund_record` VALUES ('436', '178', '201806251008186993', null, '500000', '5', '1', null, '2018-06-25 10:08:19', '2018-06-25 10:08:19');
INSERT INTO `fy_fund_record` VALUES ('438', '266', null, null, '400000', '3', '2', '265', '2018-06-25 10:11:05', '2018-06-25 10:11:05');
INSERT INTO `fy_fund_record` VALUES ('439', '140', null, null, '10000', '8', '2', '229', '2018-06-25 10:11:18', '2018-06-25 10:11:18');
INSERT INTO `fy_fund_record` VALUES ('440', '178', null, null, '3332', '3', '2', 'user112', '2018-06-25 10:22:29', '2018-06-25 10:22:29');
INSERT INTO `fy_fund_record` VALUES ('441', '140', null, null, '190000', '8', '2', '229', '2018-06-25 10:51:44', '2018-06-25 10:51:44');
INSERT INTO `fy_fund_record` VALUES ('442', '229', '201806251052155151', null, '200000', '5', '1', null, '2018-06-25 10:52:15', '2018-06-25 10:52:15');
INSERT INTO `fy_fund_record` VALUES ('443', '266', null, null, '1000', '8', '2', '248', '2018-06-25 10:55:10', '2018-06-25 10:55:10');
INSERT INTO `fy_fund_record` VALUES ('444', '266', null, null, '100000', '8', '2', '264', '2018-06-25 11:16:39', '2018-06-25 11:16:39');
INSERT INTO `fy_fund_record` VALUES ('445', '266', null, null, '100000', '8', '2', '264', '2018-06-25 11:19:26', '2018-06-25 11:19:26');
INSERT INTO `fy_fund_record` VALUES ('446', '140', null, null, '99000', '8', '2', '248', '2018-06-25 11:45:37', '2018-06-25 11:45:37');
INSERT INTO `fy_fund_record` VALUES ('447', '140', '201806251354269138', null, '1000000', '1', '2', null, '2018-06-25 13:54:37', '2018-06-25 13:54:37');
INSERT INTO `fy_fund_record` VALUES ('448', '266', '201806251359553227', null, '10000', '1', '2', null, '2018-06-25 14:00:03', '2018-06-25 14:00:03');
INSERT INTO `fy_fund_record` VALUES ('449', '267', null, null, '100000', '8', '2', '264', '2018-06-25 14:02:30', '2018-06-25 14:02:30');
INSERT INTO `fy_fund_record` VALUES ('450', '264', '201806251402584529', null, '200000', '5', '1', null, '2018-06-25 14:02:58', '2018-06-25 14:02:58');
INSERT INTO `fy_fund_record` VALUES ('451', '261', '201806251411083159', null, '500000', '1', '2', null, '2018-06-25 14:11:16', '2018-06-25 14:11:16');
INSERT INTO `fy_fund_record` VALUES ('452', '261', null, null, '100000', '3', '2', '267', '2018-06-25 14:11:34', '2018-06-25 14:11:34');
INSERT INTO `fy_fund_record` VALUES ('453', '248', '201806251423593701', null, '100000', '5', '1', null, '2018-06-25 14:24:01', '2018-06-25 14:24:01');
INSERT INTO `fy_fund_record` VALUES ('454', '264', null, null, '1664', '3', '2', 'user112', '2018-06-25 16:41:20', '2018-06-25 16:41:20');
INSERT INTO `fy_fund_record` VALUES ('455', '248', null, null, '800', '3', '2', 'user112', '2018-06-25 16:54:48', '2018-06-25 16:54:48');
INSERT INTO `fy_fund_record` VALUES ('456', '178', '201807021419329230', null, '100000', '2', '1', null, '2018-07-02 14:19:32', '2018-07-02 14:19:32');
INSERT INTO `fy_fund_record` VALUES ('457', '178', null, null, '33333', '8', '2', '264', '2018-07-02 14:20:19', '2018-07-02 14:20:19');
INSERT INTO `fy_fund_record` VALUES ('458', '178', null, null, '66667', '8', '2', '248', '2018-07-02 14:20:19', '2018-07-02 14:20:19');
INSERT INTO `fy_fund_record` VALUES ('459', '178', null, null, '133000', '8', '2', '248', '2018-07-02 14:21:06', '2018-07-02 14:21:06');
INSERT INTO `fy_fund_record` VALUES ('460', '266', null, null, '66667', '8', '2', '264', '2018-07-02 14:21:43', '2018-07-02 14:21:43');
INSERT INTO `fy_fund_record` VALUES ('461', '266', null, null, '333', '8', '2', '248', '2018-07-02 14:21:43', '2018-07-02 14:21:43');
INSERT INTO `fy_fund_record` VALUES ('462', '264', '201807021422397069', null, '100000', '5', '1', null, '2018-07-02 14:22:39', '2018-07-02 14:22:39');
INSERT INTO `fy_fund_record` VALUES ('463', '248', '201807021422402749', null, '200000', '5', '1', null, '2018-07-02 14:22:40', '2018-07-02 14:22:40');
INSERT INTO `fy_fund_record` VALUES ('464', '266', null, '0', '100000', '3', '2', '178', '2018-07-02 14:28:20', '2018-07-02 14:28:20');
INSERT INTO `fy_fund_record` VALUES ('465', '178', '201807021435422631', null, '100000', '1', '2', null, '2018-07-02 14:35:57', '2018-07-02 14:35:57');
INSERT INTO `fy_fund_record` VALUES ('466', '178', null, '0', '100000', '3', '2', '266', '2018-07-02 14:35:57', '2018-07-02 14:35:57');
INSERT INTO `fy_fund_record` VALUES ('467', '178', null, '0', '67000', '3', '2', '266', '2018-07-02 14:39:35', '2018-07-02 14:39:35');

-- ----------------------------
-- Table structure for `lender`
-- ----------------------------
DROP TABLE IF EXISTS `lender`;
CREATE TABLE `lender` (
  `uid` int(11) NOT NULL COMMENT '用户ID，关联users.id',
  `all_assets` int(11) NOT NULL DEFAULT '0' COMMENT '总资产，单位为分',
  `balance` int(11) NOT NULL DEFAULT '0' COMMENT '余额，单位为分',
  `invest_money` int(11) NOT NULL DEFAULT '0' COMMENT '在投资金，单位为分',
  `all_profit` int(11) NOT NULL DEFAULT '0' COMMENT '累计收益，单位为分',
  `risk_lvl` int(11) DEFAULT '0' COMMENT '风险等级,关联risk_type表主键',
  `score_risk` int(6) DEFAULT '0' COMMENT '风险评测分数',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出借人表';

-- ----------------------------
-- Records of lender
-- ----------------------------
INSERT INTO `lender` VALUES ('140', '6881000', '6880000', '1000', '0', '0', '0', '2018-05-31 10:23:22', '2018-06-25 13:54:38');
INSERT INTO `lender` VALUES ('186', '0', '3510100', '500000', '0', '0', '0', '2018-05-28 14:54:22', '2018-05-31 09:29:58');
INSERT INTO `lender` VALUES ('187', '-31000', '-31000', '0', '0', '0', '0', '2018-05-28 16:07:43', '2018-06-06 17:24:02');
INSERT INTO `lender` VALUES ('188', '1100300', '1114500', '100000', '0', '0', '0', '2018-05-28 16:31:50', '2018-06-22 16:28:11');
INSERT INTO `lender` VALUES ('189', '0', '0', '0', '0', '0', '0', '2018-05-28 17:24:39', '2018-05-28 17:24:39');
INSERT INTO `lender` VALUES ('190', '0', '0', '0', '0', '0', '0', '2018-05-28 17:56:59', '2018-05-28 17:56:59');
INSERT INTO `lender` VALUES ('192', '0', '0', '0', '0', '0', '0', '2018-05-29 10:42:27', '2018-05-29 10:42:27');
INSERT INTO `lender` VALUES ('194', '0', '0', '0', '0', '0', '0', '2018-05-29 10:43:52', '2018-05-29 10:43:52');
INSERT INTO `lender` VALUES ('200', '0', '0', '0', '0', '0', '0', '2018-05-29 14:17:26', '2018-05-29 14:17:26');
INSERT INTO `lender` VALUES ('201', '0', '0', '0', '0', '0', '0', '2018-05-29 14:28:44', '2018-05-29 14:28:44');
INSERT INTO `lender` VALUES ('202', '0', '0', '0', '0', '0', '0', '2018-05-29 14:51:06', '2018-05-29 14:51:06');
INSERT INTO `lender` VALUES ('204', '0', '0', '0', '0', '0', '0', '2018-05-29 15:13:02', '2018-05-29 15:13:02');
INSERT INTO `lender` VALUES ('205', '0', '0', '0', '0', '0', '0', '2018-05-29 15:26:05', '2018-05-29 15:26:05');
INSERT INTO `lender` VALUES ('206', '0', '0', '0', '0', '0', '0', '2018-05-29 15:40:54', '2018-05-29 15:40:54');
INSERT INTO `lender` VALUES ('207', '0', '0', '0', '0', '0', '0', '2018-05-29 16:08:02', '2018-05-29 16:08:02');
INSERT INTO `lender` VALUES ('208', '0', '0', '0', '0', '0', '0', '2018-05-29 16:08:42', '2018-05-29 16:08:42');
INSERT INTO `lender` VALUES ('209', '0', '0', '0', '0', '0', '0', '2018-05-29 16:11:23', '2018-05-29 16:11:23');
INSERT INTO `lender` VALUES ('210', '0', '0', '0', '0', '0', '0', '2018-05-29 16:12:10', '2018-05-29 16:12:10');
INSERT INTO `lender` VALUES ('211', '0', '0', '0', '0', '0', '0', '2018-05-29 16:14:01', '2018-05-29 16:14:01');
INSERT INTO `lender` VALUES ('212', '0', '0', '0', '0', '0', '0', '2018-05-29 16:14:20', '2018-05-29 16:14:20');
INSERT INTO `lender` VALUES ('213', '0', '0', '0', '0', '0', '0', '2018-05-29 16:17:48', '2018-05-29 16:17:48');
INSERT INTO `lender` VALUES ('214', '0', '0', '0', '0', '0', '0', '2018-05-29 16:18:48', '2018-05-29 16:18:48');
INSERT INTO `lender` VALUES ('215', '0', '0', '0', '0', '0', '0', '2018-05-29 16:19:40', '2018-05-29 16:19:40');
INSERT INTO `lender` VALUES ('216', '0', '0', '0', '0', '0', '0', '2018-05-29 16:20:12', '2018-05-29 16:20:12');
INSERT INTO `lender` VALUES ('217', '0', '0', '0', '0', '0', '0', '2018-05-29 16:20:47', '2018-05-29 16:20:47');
INSERT INTO `lender` VALUES ('218', '0', '0', '0', '0', '0', '0', '2018-05-29 16:24:02', '2018-05-29 16:24:02');
INSERT INTO `lender` VALUES ('219', '0', '0', '0', '0', '0', '0', '2018-05-29 16:24:55', '2018-05-29 16:24:55');
INSERT INTO `lender` VALUES ('220', '0', '0', '0', '0', '0', '0', '2018-05-29 16:27:47', '2018-05-29 16:27:47');
INSERT INTO `lender` VALUES ('221', '0', '0', '0', '0', '0', '0', '2018-05-29 16:37:23', '2018-05-29 16:37:23');
INSERT INTO `lender` VALUES ('222', '0', '0', '0', '0', '0', '0', '2018-05-29 16:39:23', '2018-05-29 16:39:23');
INSERT INTO `lender` VALUES ('223', '0', '0', '0', '0', '0', '0', '2018-05-29 16:44:03', '2018-05-29 16:44:03');
INSERT INTO `lender` VALUES ('224', '0', '0', '0', '0', '0', '0', '2018-05-29 16:54:26', '2018-05-29 16:54:26');
INSERT INTO `lender` VALUES ('226', '0', '0', '0', '0', '0', '0', '2018-05-31 11:00:36', '2018-05-31 11:00:36');
INSERT INTO `lender` VALUES ('227', '0', '0', '0', '0', '0', '0', '2018-05-31 11:05:22', '2018-05-31 11:05:22');
INSERT INTO `lender` VALUES ('228', '0', '0', '0', '0', '0', '0', '2018-05-31 11:07:09', '2018-05-31 11:07:09');
INSERT INTO `lender` VALUES ('229', '0', '0', '0', '0', '0', '0', '2018-05-31 11:24:08', '2018-05-31 11:24:08');
INSERT INTO `lender` VALUES ('230', '0', '0', '0', '0', '0', '0', '2018-06-04 13:24:51', '2018-06-04 13:24:51');
INSERT INTO `lender` VALUES ('231', '0', '0', '0', '0', '0', '0', '2018-06-04 13:28:10', '2018-06-04 13:28:10');
INSERT INTO `lender` VALUES ('232', '0', '0', '0', '0', '0', '0', '2018-06-04 19:13:12', '2018-06-04 19:13:12');
INSERT INTO `lender` VALUES ('233', '0', '0', '0', '0', '0', '0', '2018-06-04 19:24:28', '2018-06-04 19:24:28');
INSERT INTO `lender` VALUES ('234', '0', '0', '0', '0', '0', '0', '2018-06-04 19:27:12', '2018-06-04 19:27:12');
INSERT INTO `lender` VALUES ('235', '0', '0', '0', '0', '0', '0', '2018-06-05 13:30:42', '2018-06-05 13:30:42');
INSERT INTO `lender` VALUES ('236', '0', '0', '0', '0', '0', '0', '2018-06-05 13:32:44', '2018-06-05 13:32:44');
INSERT INTO `lender` VALUES ('237', '0', '0', '0', '0', '0', '0', '2018-06-05 13:37:01', '2018-06-05 13:37:01');
INSERT INTO `lender` VALUES ('238', '0', '0', '0', '0', '0', '0', '2018-06-05 13:38:08', '2018-06-05 13:38:08');
INSERT INTO `lender` VALUES ('239', '0', '0', '0', '0', '0', '0', '2018-06-05 13:41:28', '2018-06-05 13:41:28');
INSERT INTO `lender` VALUES ('240', '0', '0', '0', '0', '0', '0', '2018-06-05 13:45:53', '2018-06-05 13:45:53');
INSERT INTO `lender` VALUES ('241', '0', '0', '0', '0', '0', '0', '2018-06-05 14:13:57', '2018-06-05 14:13:57');
INSERT INTO `lender` VALUES ('242', '0', '0', '0', '0', '0', '0', '2018-06-05 14:22:43', '2018-06-05 14:22:43');
INSERT INTO `lender` VALUES ('243', '0', '0', '0', '0', '0', '0', '2018-06-06 16:08:33', '2018-06-06 16:08:33');
INSERT INTO `lender` VALUES ('244', '0', '0', '0', '0', '0', '0', '2018-06-08 14:25:09', '2018-06-08 14:25:09');
INSERT INTO `lender` VALUES ('245', '0', '0', '0', '0', '0', '0', '2018-06-08 15:19:54', '2018-06-08 15:19:54');
INSERT INTO `lender` VALUES ('246', '0', '0', '0', '0', '0', '0', '2018-06-08 15:28:32', '2018-06-08 15:28:32');
INSERT INTO `lender` VALUES ('247', '0', '0', '0', '0', '0', '0', '2018-06-08 15:39:27', '2018-06-08 15:39:27');
INSERT INTO `lender` VALUES ('248', '-2300', '-156586', '154286', '0', '0', '0', '2018-06-10 11:17:01', '2018-06-24 13:56:47');
INSERT INTO `lender` VALUES ('249', '0', '0', '0', '0', '8', '17', '2018-06-12 13:16:11', '2018-06-22 10:03:31');
INSERT INTO `lender` VALUES ('250', '0', '0', '0', '0', '0', '0', '2018-06-12 20:20:30', '2018-06-12 20:20:30');
INSERT INTO `lender` VALUES ('251', '0', '0', '0', '0', '0', '0', '2018-06-12 20:22:22', '2018-06-12 20:22:22');
INSERT INTO `lender` VALUES ('252', '0', '0', '0', '0', '0', '0', '2018-06-12 20:28:22', '2018-06-12 20:28:22');
INSERT INTO `lender` VALUES ('253', '0', '0', '0', '0', '0', '0', '2018-06-12 20:54:44', '2018-06-12 20:54:44');
INSERT INTO `lender` VALUES ('254', '0', '0', '0', '0', '0', '0', '2018-06-13 09:52:53', '2018-06-13 09:52:53');
INSERT INTO `lender` VALUES ('255', '0', '0', '0', '0', '0', '0', '2018-06-13 10:00:54', '2018-06-13 10:00:54');
INSERT INTO `lender` VALUES ('256', '0', '0', '0', '0', '0', '0', '2018-06-13 10:12:10', '2018-06-13 10:12:10');
INSERT INTO `lender` VALUES ('257', '0', '0', '0', '0', '0', '0', '2018-06-13 10:15:03', '2018-06-13 10:15:03');
INSERT INTO `lender` VALUES ('258', '0', '0', '0', '0', '0', '0', '2018-06-13 10:16:14', '2018-06-13 10:16:14');
INSERT INTO `lender` VALUES ('259', '0', '0', '0', '0', '0', '0', '2018-06-13 10:19:40', '2018-06-13 10:19:40');
INSERT INTO `lender` VALUES ('260', '0', '0', '0', '0', '0', '0', '2018-06-13 10:21:04', '2018-06-13 10:21:04');
INSERT INTO `lender` VALUES ('261', '25990760', '25471760', '519000', '3360', '0', '0', '2018-06-13 10:22:28', '2018-06-25 14:11:34');
INSERT INTO `lender` VALUES ('262', '0', '0', '0', '0', '0', '0', '2018-06-13 10:25:14', '2018-06-13 10:25:14');
INSERT INTO `lender` VALUES ('263', '0', '0', '0', '0', '0', '0', '2018-06-13 10:27:13', '2018-06-13 10:27:13');
INSERT INTO `lender` VALUES ('264', '0', '-200000', '200000', '0', '0', '0', '2018-06-20 14:02:59', '2018-06-22 15:41:21');
INSERT INTO `lender` VALUES ('265', '400500', '1657977', '-1257477', '0', '0', '0', '2018-06-20 14:05:36', '2018-06-25 10:11:05');
INSERT INTO `lender` VALUES ('266', '1582900', '411900', '1171000', '0', '10', '28', '2018-06-21 09:35:59', '2018-06-25 14:00:03');
INSERT INTO `lender` VALUES ('267', '32599', '819408', '-786809', '25199', '10', '28', '2018-06-21 09:46:53', '2018-06-25 14:11:34');
INSERT INTO `lender` VALUES ('268', '0', '0', '0', '0', '0', '0', '2018-06-27 09:43:06', '2018-06-27 09:43:06');
INSERT INTO `lender` VALUES ('271', '0', '0', '0', '0', '0', '0', '2018-06-28 19:51:21', '2018-06-28 19:51:21');
INSERT INTO `lender` VALUES ('272', '0', '0', '0', '0', '0', '0', '2018-07-03 10:35:36', '2018-07-03 10:35:36');
INSERT INTO `lender` VALUES ('273', '0', '0', '0', '0', '0', '0', '2018-07-03 15:38:29', '2018-07-03 15:38:29');

-- ----------------------------
-- Table structure for `lender_every_payment`
-- ----------------------------
DROP TABLE IF EXISTS `lender_every_payment`;
CREATE TABLE `lender_every_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '出借人ID，关联users.id',
  `pid` int(11) NOT NULL COMMENT '项目ID，关联project.id',
  `pay_id` int(11) NOT NULL COMMENT '回款ID，关联lender_payment.id',
  `amt` int(11) NOT NULL COMMENT '回款本金，单位为分',
  `profit` int(11) NOT NULL COMMENT '回款利息，单位为分',
  `period` int(11) NOT NULL COMMENT '回款期数',
  `status` tinyint(4) NOT NULL COMMENT '状态，1/未回款 2/废用 3/借款人资金解冻并划拨',
  `freeze_time` int(11) DEFAULT NULL COMMENT '划拨预冻结时间',
  `unfreeze_time` int(11) DEFAULT NULL COMMENT '解冻时间',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pay_id` (`pay_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1207 DEFAULT CHARSET=utf8 COMMENT='出借人每期回款数据';

-- ----------------------------
-- Records of lender_every_payment
-- ----------------------------
INSERT INTO `lender_every_payment` VALUES ('1192', '178', '113', '329', '11111', '233', '1', '1', null, null, '2018-07-02 14:20:19', '2018-07-02 14:20:19');
INSERT INTO `lender_every_payment` VALUES ('1193', '178', '113', '329', '11111', '233', '2', '1', null, null, '2018-07-02 14:20:19', '2018-07-02 14:20:19');
INSERT INTO `lender_every_payment` VALUES ('1194', '178', '113', '329', '11111', '234', '3', '1', null, null, '2018-07-02 14:20:19', '2018-07-02 14:20:19');
INSERT INTO `lender_every_payment` VALUES ('1195', '178', '114', '330', '22222', '466', '1', '1', null, null, '2018-07-02 14:20:19', '2018-07-02 14:20:19');
INSERT INTO `lender_every_payment` VALUES ('1196', '178', '114', '330', '22222', '466', '2', '1', null, null, '2018-07-02 14:20:19', '2018-07-02 14:20:19');
INSERT INTO `lender_every_payment` VALUES ('1197', '178', '114', '330', '22223', '468', '3', '1', null, null, '2018-07-02 14:20:19', '2018-07-02 14:20:19');
INSERT INTO `lender_every_payment` VALUES ('1198', '178', '114', '331', '44333', '931', '1', '1', null, null, '2018-07-02 14:21:06', '2018-07-02 14:21:06');
INSERT INTO `lender_every_payment` VALUES ('1199', '178', '114', '331', '44333', '931', '2', '1', null, null, '2018-07-02 14:21:06', '2018-07-02 14:21:06');
INSERT INTO `lender_every_payment` VALUES ('1200', '178', '114', '331', '44334', '931', '3', '1', null, null, '2018-07-02 14:21:06', '2018-07-02 14:21:06');
INSERT INTO `lender_every_payment` VALUES ('1201', '266', '113', '332', '22222', '466', '1', '1', null, null, '2018-07-02 14:21:43', '2018-07-02 14:21:43');
INSERT INTO `lender_every_payment` VALUES ('1202', '266', '113', '332', '22222', '466', '2', '1', null, null, '2018-07-02 14:21:43', '2018-07-02 14:21:43');
INSERT INTO `lender_every_payment` VALUES ('1203', '266', '113', '332', '22223', '468', '3', '1', null, null, '2018-07-02 14:21:43', '2018-07-02 14:21:43');
INSERT INTO `lender_every_payment` VALUES ('1204', '266', '114', '333', '111', '2', '1', '1', null, null, '2018-07-02 14:21:43', '2018-07-02 14:21:43');
INSERT INTO `lender_every_payment` VALUES ('1205', '266', '114', '333', '111', '2', '2', '1', null, null, '2018-07-02 14:21:43', '2018-07-02 14:21:43');
INSERT INTO `lender_every_payment` VALUES ('1206', '266', '114', '333', '111', '3', '3', '1', null, null, '2018-07-02 14:21:43', '2018-07-02 14:21:43');

-- ----------------------------
-- Table structure for `lender_fund_record`
-- ----------------------------
DROP TABLE IF EXISTS `lender_fund_record`;
CREATE TABLE `lender_fund_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID，关联users.id',
  `amt` int(11) NOT NULL COMMENT '资金金额，单位为分',
  `deal` tinyint(4) NOT NULL COMMENT '交易类型，1/充值 2/提现 3/投资 4/回款 5/流标 6/提现失败退款 7/奖励 8/划拨预冻结 9/转让本金利息',
  `entry` tinyint(4) NOT NULL COMMENT '出入类型，1/入账 2/出账',
  `pid` int(11) DEFAULT NULL COMMENT '理财产品项目ID，关联project.id',
  `pay_id` int(11) DEFAULT NULL COMMENT '回款ID，关联lender_payment.id',
  `remarks` varchar(50) DEFAULT NULL COMMENT '备注',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=438 DEFAULT CHARSET=utf8 COMMENT='出借人资金记录';

-- ----------------------------
-- Records of lender_fund_record
-- ----------------------------
INSERT INTO `lender_fund_record` VALUES ('426', '178', '100000', '2', '2', null, null, '提现', '2018-07-02 14:19:32', '2018-07-02 14:19:32');
INSERT INTO `lender_fund_record` VALUES ('427', '178', '33333', '8', '2', '113', null, null, '2018-07-02 14:20:19', '2018-07-02 14:20:19');
INSERT INTO `lender_fund_record` VALUES ('428', '178', '66667', '8', '2', '114', null, null, '2018-07-02 14:20:19', '2018-07-02 14:20:19');
INSERT INTO `lender_fund_record` VALUES ('429', '178', '133000', '8', '2', '114', null, null, '2018-07-02 14:21:06', '2018-07-02 14:21:06');
INSERT INTO `lender_fund_record` VALUES ('430', '266', '66667', '8', '2', '113', null, null, '2018-07-02 14:21:43', '2018-07-02 14:21:43');
INSERT INTO `lender_fund_record` VALUES ('431', '266', '333', '8', '2', '114', null, null, '2018-07-02 14:21:43', '2018-07-02 14:21:43');
INSERT INTO `lender_fund_record` VALUES ('432', '266', '100000', '3', '2', null, null, null, '2018-07-02 14:28:20', '2018-07-02 14:28:20');
INSERT INTO `lender_fund_record` VALUES ('433', '178', '99800', '9', '1', null, null, null, '2018-07-02 14:28:21', '2018-07-02 14:28:21');
INSERT INTO `lender_fund_record` VALUES ('434', '178', '100000', '3', '2', null, null, null, '2018-07-02 14:35:57', '2018-07-02 14:35:57');
INSERT INTO `lender_fund_record` VALUES ('435', '266', '100000', '9', '1', null, null, null, '2018-07-02 14:35:58', '2018-07-02 14:35:58');
INSERT INTO `lender_fund_record` VALUES ('436', '178', '67000', '3', '2', null, null, null, '2018-07-02 14:39:35', '2018-07-02 14:39:35');
INSERT INTO `lender_fund_record` VALUES ('437', '266', '67000', '9', '1', null, null, null, '2018-07-02 14:39:35', '2018-07-02 14:39:35');

-- ----------------------------
-- Table structure for `lender_invest`
-- ----------------------------
DROP TABLE IF EXISTS `lender_invest`;
CREATE TABLE `lender_invest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial_num` varchar(50) DEFAULT NULL COMMENT '出借编号',
  `debt_no` varchar(50) DEFAULT NULL COMMENT '债转编号',
  `uid` int(11) NOT NULL COMMENT '用户ID，关联users.id',
  `pid` int(11) NOT NULL COMMENT '散标ID，关联project.id',
  `ppid` int(11) NOT NULL DEFAULT '0' COMMENT '合标ID，关联project.id',
  `pay_id` int(11) DEFAULT NULL COMMENT '回款ID，关联lender_payment.id',
  `amt` int(11) NOT NULL COMMENT '投资金额，单位为分',
  `rate` int(11) NOT NULL COMMENT '年化利率，单位万分之一',
  `tw_contract_id` varchar(50) DEFAULT NULL COMMENT '天威在线合同编号',
  `local_contract_id` varchar(50) DEFAULT NULL COMMENT '本地合同编号',
  `sign_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否签约，0/否 1/是',
  `debt_time_limit` int(12) DEFAULT NULL COMMENT '债转最大期限',
  `debt_status` tinyint(4) DEFAULT '0' COMMENT '0:未债转 1:提交债转,未有人接盘 2:债转成功 3:有效期已过',
  `amt_return` tinyint(4) NOT NULL DEFAULT '0' COMMENT '流标资金回退状态，0/无操作 1/已回退',
  `surplus_periods` tinyint(4) DEFAULT NULL COMMENT '未还款的剩余期数',
  `debt_periods` tinyint(4) DEFAULT NULL COMMENT '债转成功后剩余期数',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `pid` (`pid`),
  KEY `serial_num` (`serial_num`)
) ENGINE=InnoDB AUTO_INCREMENT=328 DEFAULT CHARSET=utf8 COMMENT='出借人投资记录';

-- ----------------------------
-- Records of lender_invest
-- ----------------------------
INSERT INTO `lender_invest` VALUES ('317', 'HB201807021420191783127', 'JQ201807021426481788832', '178', '113', '115', '329', '33333', '840', '0a836481-9c9e-49fb-8145-a5a29ea35579', 'QJJXY20180702317', '1', null, '2', '0', '3', '3', '2018-07-02 14:20:19', '2018-07-02 14:28:20');
INSERT INTO `lender_invest` VALUES ('318', 'HB201807021420191783127', 'JQ201807021426481788832', '178', '114', '115', '330', '66667', '840', 'b57d1adc-c696-40a3-9a7e-b3db07d83765', 'QJJXY20180702318', '1', null, '2', '0', '3', '3', '2018-07-02 14:20:19', '2018-07-02 14:28:20');
INSERT INTO `lender_invest` VALUES ('319', 'SB201807021421061783496', 'JQ201807021426411781669', '178', '114', '0', '331', '133000', '840', 'cae80bd0-007d-44ae-abee-d255fc918724', 'QJJXY20180702319', '1', null, '1', '0', '3', null, '2018-07-02 14:21:06', '2018-07-02 14:26:41');
INSERT INTO `lender_invest` VALUES ('320', 'HB201807021421432667558', 'JQ201807021439242663646', '266', '113', '115', '332', '66667', '840', '69c81b50-aaad-4c4c-91f6-41822efbb977', 'QJJXY20180702320', '1', null, '2', '0', '3', '3', '2018-07-02 14:21:43', '2018-07-02 14:39:35');
INSERT INTO `lender_invest` VALUES ('321', 'HB201807021421432667558', 'JQ201807021439242663646', '266', '114', '115', '333', '333', '840', '491ac939-a6a2-4900-9f16-45bebe926c22', 'QJJXY20180702321', '1', null, '2', '0', '3', '3', '2018-07-02 14:21:43', '2018-07-02 14:39:35');
INSERT INTO `lender_invest` VALUES ('322', 'SB201807021428202668457', 'JQ201807021426481788832', '266', '113', '115', '334', '33333', '840', 'c19ac7f6-75a6-4708-ba5b-51706744f597', 'QJJXY20180702322', '1', null, '2', '0', '3', '3', '2018-07-02 14:28:20', '2018-07-02 14:35:57');
INSERT INTO `lender_invest` VALUES ('323', 'SB201807021428202668457', 'JQ201807021426481788832', '266', '114', '115', '335', '66667', '840', 'ad38ec3d-9172-4455-a22d-baabe4c15606', 'QJJXY20180702323', '1', null, '2', '0', '3', '3', '2018-07-02 14:28:20', '2018-07-02 14:35:57');
INSERT INTO `lender_invest` VALUES ('324', 'SB201807021435571785379', 'JQ201807021426481788832', '178', '113', '115', '336', '33333', '840', null, null, '0', null, '0', '0', '3', '3', '2018-07-02 14:35:57', '2018-07-02 14:35:57');
INSERT INTO `lender_invest` VALUES ('325', 'SB201807021435571785379', 'JQ201807021426481788832', '178', '114', '115', '337', '66667', '840', null, null, '0', null, '0', '0', '3', '3', '2018-07-02 14:35:57', '2018-07-02 14:35:57');
INSERT INTO `lender_invest` VALUES ('326', 'SB201807021439351783917', 'JQ201807021439242663646', '178', '113', '115', '338', '66667', '840', null, null, '0', null, '0', '0', '3', '3', '2018-07-02 14:39:35', '2018-07-02 14:39:35');
INSERT INTO `lender_invest` VALUES ('327', 'SB201807021439351783917', 'JQ201807021439242663646', '178', '114', '115', '339', '333', '840', null, null, '0', null, '0', '0', '3', '3', '2018-07-02 14:39:35', '2018-07-02 14:39:35');

-- ----------------------------
-- Table structure for `lender_payment`
-- ----------------------------
DROP TABLE IF EXISTS `lender_payment`;
CREATE TABLE `lender_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID，关联users.id',
  `serial_num` varchar(50) DEFAULT '' COMMENT '投资编号',
  `pid` int(11) NOT NULL COMMENT '项目标的ID，关联project.id',
  `amt` int(11) NOT NULL COMMENT '投资金额，单位为分',
  `profit` int(11) NOT NULL COMMENT '利息金额，单位为分',
  `actual_profit` int(11) NOT NULL DEFAULT '0' COMMENT '实际利息，单位为分(不包括锁定期手续费)',
  `lock_commission_charge` int(11) DEFAULT '0' COMMENT '锁定期转出收的手续费',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '回款状态，1/未回款 2/已回款 3/流标 4/债权已经申请转让,未接手 5/转让成功',
  `repay_time` int(11) DEFAULT NULL COMMENT '回款时间',
  `debt_repay_time` int(11) DEFAULT NULL COMMENT '债转成功 钱划拨的时间',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=340 DEFAULT CHARSET=utf8 COMMENT='出借人回款记录';

-- ----------------------------
-- Records of lender_payment
-- ----------------------------
INSERT INTO `lender_payment` VALUES ('329', '178', 'HB201807021420191783127', '113', '33333', '700', '0', '66', '5', '1538547758', '1530512901', '2018-07-02 14:20:19', '2018-07-02 14:28:21');
INSERT INTO `lender_payment` VALUES ('330', '178', 'HB201807021420191783127', '114', '66667', '1400', '0', '133', '5', '1538547759', '1530512901', '2018-07-02 14:20:19', '2018-07-02 14:28:21');
INSERT INTO `lender_payment` VALUES ('331', '178', 'SB201807021421061783496', '114', '133000', '2793', '0', '0', '4', '1538547759', null, '2018-07-02 14:21:06', '2018-07-02 14:26:41');
INSERT INTO `lender_payment` VALUES ('332', '266', 'HB201807021421432667558', '113', '66667', '1400', '0', '0', '5', '1538547758', '1530513575', '2018-07-02 14:21:43', '2018-07-02 14:39:35');
INSERT INTO `lender_payment` VALUES ('333', '266', 'HB201807021421432667558', '114', '333', '7', '0', '0', '5', '1538547759', '1530513575', '2018-07-02 14:21:43', '2018-07-02 14:39:35');
INSERT INTO `lender_payment` VALUES ('334', '266', 'SB201807021428202668457', '113', '33333', '700', '0', '0', '5', '1538547758', '1530513358', '2018-07-02 14:28:20', '2018-07-02 14:35:58');
INSERT INTO `lender_payment` VALUES ('335', '266', 'SB201807021428202668457', '114', '66667', '1400', '0', '0', '5', '1538547759', '1530513358', '2018-07-02 14:28:20', '2018-07-02 14:35:58');
INSERT INTO `lender_payment` VALUES ('336', '178', 'SB201807021435571785379', '113', '33333', '700', '0', '0', '1', '1538547758', null, '2018-07-02 14:35:57', '2018-07-02 14:35:57');
INSERT INTO `lender_payment` VALUES ('337', '178', 'SB201807021435571785379', '114', '66667', '1400', '0', '0', '1', '1538547759', null, '2018-07-02 14:35:57', '2018-07-02 14:35:57');
INSERT INTO `lender_payment` VALUES ('338', '178', 'SB201807021439351783917', '113', '66667', '1400', '0', '0', '1', '1538547758', null, '2018-07-02 14:39:35', '2018-07-02 14:39:35');
INSERT INTO `lender_payment` VALUES ('339', '178', 'SB201807021439351783917', '114', '333', '7', '0', '0', '1', '1538547759', null, '2018-07-02 14:39:35', '2018-07-02 14:39:35');

-- ----------------------------
-- Table structure for `loan`
-- ----------------------------
DROP TABLE IF EXISTS `loan`;
CREATE TABLE `loan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '0' COMMENT '借款标题',
  `banner` varchar(250) DEFAULT NULL COMMENT 'Banner',
  `age_start` tinyint(4) NOT NULL COMMENT '年龄下限',
  `age_end` tinyint(4) NOT NULL COMMENT '年龄上限',
  `material1` varchar(50) NOT NULL COMMENT '材料1',
  `material2` varchar(50) NOT NULL COMMENT '材料2',
  `quota_start` int(11) NOT NULL COMMENT '借款额度下限，单位为元',
  `quota_end` int(11) NOT NULL COMMENT '借款额度上限，单位为元',
  `quota_unit` int(11) NOT NULL COMMENT '借款单元，如1000元一个借款单位',
  `term_rate` text NOT NULL COMMENT '借款期限对应月利率，利率单位是万分之一',
  `audit_method` tinyint(4) NOT NULL DEFAULT '1' COMMENT '审批方式，1/实时审核（周末放款延迟）',
  `repay_method` tinyint(4) NOT NULL DEFAULT '1' COMMENT '还款方式，1/等额本息',
  `highest_money` varchar(50) NOT NULL COMMENT '最高金额',
  `highest_term` varchar(50) NOT NULL COMMENT '最高期限',
  `lowest_rate_str` varchar(50) NOT NULL COMMENT '最低利率',
  `lowest_rate` varchar(50) NOT NULL COMMENT '最低利率',
  `status` tinyint(4) NOT NULL COMMENT '状态，1/正常使用',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='借款产品表';

-- ----------------------------
-- Records of loan
-- ----------------------------
INSERT INTO `loan` VALUES ('1', '闪电贷', '/img/loan_banner_01.png', '18', '45', '中国大陆居民二代身份证，本人实名制手机号', '手机号运营商认证', '1000', '200000', '1000', 'a:4:{i:0;a:2:{s:4:\"term\";i:3;s:4:\"rate\";i:150;}i:1;a:2:{s:4:\"term\";i:6;s:4:\"rate\";i:150;}i:2;a:2:{s:4:\"term\";i:12;s:4:\"rate\";i:160;}i:3;a:2:{s:4:\"term\";i:24;s:4:\"rate\";i:170;}}', '1', '1', '最高20万', '最高24个月', '千分之4起', '4‰起', '1', '1522735358', '1522735358');

-- ----------------------------
-- Table structure for `loan_apply`
-- ----------------------------
DROP TABLE IF EXISTS `loan_apply`;
CREATE TABLE `loan_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID，关联users.id',
  `loan_id` int(11) DEFAULT NULL COMMENT 'loan借款产品编号',
  `order_no` varchar(35) DEFAULT NULL COMMENT '借款订单编号',
  `quota` int(11) NOT NULL COMMENT '额度，单位为分',
  `term` int(11) NOT NULL COMMENT '期限，单位为月',
  `repay_method` tinyint(4) NOT NULL DEFAULT '1' COMMENT '还款方式，1/等额本息',
  `rate` int(11) NOT NULL COMMENT '月利率，单位万分之一',
  `purpose` varchar(50) NOT NULL COMMENT '借款用途',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '申请状态，1/已申请 2/审核通过 3/审核失败 4/筹集中 5/放款中 6/已借完 7/借款失败 8/已还款 9/放款失败',
  `fail_reason` varchar(50) DEFAULT NULL COMMENT '审核失败原因',
  `adopt_time` int(11) DEFAULT NULL COMMENT '审核通过时间',
  `fail_time` int(11) DEFAULT NULL COMMENT '审核失败时间',
  `raise_time` int(11) DEFAULT NULL COMMENT '满标时间',
  `loan_time` int(11) DEFAULT NULL COMMENT '放款中时间',
  `end_time` int(11) DEFAULT NULL COMMENT '放款到账时间',
  `flow_time` int(11) DEFAULT NULL COMMENT '流标时间',
  `serial_num` varchar(50) DEFAULT NULL COMMENT '放款提现的流水号',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 COMMENT='借款申请表';

-- ----------------------------
-- Records of loan_apply
-- ----------------------------
INSERT INTO `loan_apply` VALUES ('123', '264', '1', 'JK1807021414478179', '100000', '3', '1', '150', '生活消费', '6', null, '1530512087', null, null, '1530512558', null, null, '201807021422397069', '2018-07-02 14:14:39', '2018-07-02 14:22:39');
INSERT INTO `loan_apply` VALUES ('124', '248', '1', 'JK1807021415428717', '200000', '3', '1', '150', '生活消费', '6', null, '1530512142', null, null, '1530512559', null, null, '201807021422402749', '2018-07-02 14:15:37', '2018-07-02 14:22:40');

-- ----------------------------
-- Table structure for `loan_apply_project`
-- ----------------------------
DROP TABLE IF EXISTS `loan_apply_project`;
CREATE TABLE `loan_apply_project` (
  `aid` int(11) DEFAULT NULL COMMENT '借款申请记录ID',
  `pid` int(11) NOT NULL COMMENT '产品项目ID',
  `created_at` timestamp NULL,
  `updated_at` timestamp NULL,
  KEY `aid` (`aid`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='借款申请关联产品项目表';

-- ----------------------------
-- Records of loan_apply_project
-- ----------------------------
INSERT INTO `loan_apply_project` VALUES ('123', '113', '2018-07-02 14:14:47', '2018-07-02 14:14:47');
INSERT INTO `loan_apply_project` VALUES ('124', '114', '2018-07-02 14:15:42', '2018-07-02 14:15:42');

-- ----------------------------
-- Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `merge_id` int(11) DEFAULT NULL COMMENT '合标id,有此id则被合过标',
  `serial_no` varchar(25) CHARACTER SET ascii DEFAULT NULL COMMENT '编号',
  `title` varchar(50) DEFAULT NULL COMMENT '项目标题',
  `basis_rate` int(11) DEFAULT NULL COMMENT '基础年化利率，单位万分之一',
  `extra_rate` int(11) DEFAULT '0' COMMENT '额外年化利率，单位万分之一',
  `loan_amount` int(11) DEFAULT '0' COMMENT '借款金额，单位为分',
  `surplus_amount` int(11) DEFAULT '0' COMMENT '剩余金额，单位为分',
  `lowest_amount` int(11) DEFAULT '0' COMMENT '最低出借金额，单位为分',
  `quota_unit` int(11) DEFAULT '0' COMMENT '出借单位金额，单位为分',
  `loan_term` smallint(6) DEFAULT NULL COMMENT '借款期限，单位为月',
  `profit_calcula` tinyint(4) DEFAULT '1' COMMENT '收益计算方式，1/满标D+1起息',
  `repay_method` tinyint(4) DEFAULT '1' COMMENT '还款方式，1/到期返本付息',
  `raise_term` int(11) DEFAULT NULL COMMENT '募集期限，单位为天',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态，1/审核中 2/募集中 3/满标 4/流标 5/已放款 6/还款结束 7/部分满标',
  `display` tinyint(4) DEFAULT '1' COMMENT '是否显示，0/隐藏 1/显示',
  `type` tinyint(4) DEFAULT '1' COMMENT '产品类型，1/散标 2/合并标',
  `is_novice` tinyint(3) DEFAULT '0' COMMENT '是否新手标，0/否  1/是',
  `lock_day` int(11) DEFAULT NULL COMMENT '锁定天数',
  `introduce` text COMMENT '产品介绍',
  `release_time` int(11) DEFAULT NULL COMMENT '发布时间',
  `full_scale_time` int(11) unsigned zerofill DEFAULT NULL COMMENT '满标时间',
  `part_full_time` int(11) DEFAULT NULL COMMENT '部分满标时间',
  `loss_time` int(11) DEFAULT NULL COMMENT '流标时间',
  `grant_time` int(11) DEFAULT NULL COMMENT '放款时间',
  `early_repay_time` int(11) DEFAULT NULL COMMENT '提前还款时间',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serial_no` (`serial_no`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COMMENT='产品项目表';

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('113', '115', 'SB1807021414471374', '李冲冲散标', '840', '0', '100000', '0', '100000', '100000', '3', '1', '1', '2', '5', '1', '1', '0', '30', '李冲冲散标', '1530512209', '01526745600', null, null, '1530512558', null, '2018-07-02 14:14:47', '2018-07-03 15:08:12');
INSERT INTO `project` VALUES ('114', '115', 'SB1807021415424378', '陈慧清散标', '840', '0', '200000', '0', '100000', '100000', '3', '1', '1', '2', '5', '1', '1', '0', '30', '陈慧清散标', '1530512179', '01526745600', null, null, '1530512559', null, '2018-07-02 14:15:42', '2018-07-03 15:07:52');
INSERT INTO `project` VALUES ('115', null, 'HB1820180702141708', '李陈合标', '840', '0', '300000', '0', '100000', '100000', '3', '1', '1', '2', '5', '1', '2', '0', '30', '李陈合标', '1530512288', '01526745600', null, null, '1530512558', null, '2018-07-02 14:17:08', '2018-07-02 14:42:12');

-- ----------------------------
-- Table structure for `region`
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL COMMENT '父级id',
  `name` varchar(50) NOT NULL COMMENT '地区名',
  `type` tinyint(4) NOT NULL COMMENT '类型，0/国家 1/省份 2/城市 3/县区',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='全国地区表';

-- ----------------------------
-- Records of region
-- ----------------------------
INSERT INTO `region` VALUES ('1', '0', '中国', '0');
INSERT INTO `region` VALUES ('2', '1', '北京', '1');
INSERT INTO `region` VALUES ('3', '1', '安徽', '1');
INSERT INTO `region` VALUES ('4', '1', '福建', '1');
INSERT INTO `region` VALUES ('5', '1', '甘肃', '1');
INSERT INTO `region` VALUES ('6', '1', '广东', '1');
INSERT INTO `region` VALUES ('7', '1', '广西', '1');
INSERT INTO `region` VALUES ('8', '1', '贵州', '1');
INSERT INTO `region` VALUES ('9', '1', '海南', '1');
INSERT INTO `region` VALUES ('10', '1', '河北', '1');
INSERT INTO `region` VALUES ('11', '1', '河南', '1');
INSERT INTO `region` VALUES ('12', '1', '黑龙江', '1');
INSERT INTO `region` VALUES ('13', '1', '湖北', '1');
INSERT INTO `region` VALUES ('14', '1', '湖南', '1');
INSERT INTO `region` VALUES ('15', '1', '吉林', '1');
INSERT INTO `region` VALUES ('16', '1', '江苏', '1');
INSERT INTO `region` VALUES ('17', '1', '江西', '1');
INSERT INTO `region` VALUES ('18', '1', '辽宁', '1');
INSERT INTO `region` VALUES ('19', '1', '内蒙古', '1');
INSERT INTO `region` VALUES ('20', '1', '宁夏', '1');
INSERT INTO `region` VALUES ('21', '1', '青海', '1');
INSERT INTO `region` VALUES ('22', '1', '山东', '1');
INSERT INTO `region` VALUES ('23', '1', '山西', '1');
INSERT INTO `region` VALUES ('24', '1', '陕西', '1');
INSERT INTO `region` VALUES ('25', '1', '上海', '1');
INSERT INTO `region` VALUES ('26', '1', '四川', '1');
INSERT INTO `region` VALUES ('27', '1', '天津', '1');
INSERT INTO `region` VALUES ('28', '1', '西藏', '1');
INSERT INTO `region` VALUES ('29', '1', '新疆', '1');
INSERT INTO `region` VALUES ('30', '1', '云南', '1');
INSERT INTO `region` VALUES ('31', '1', '浙江', '1');
INSERT INTO `region` VALUES ('32', '1', '重庆', '1');
INSERT INTO `region` VALUES ('33', '1', '香港', '1');
INSERT INTO `region` VALUES ('34', '1', '澳门', '1');
INSERT INTO `region` VALUES ('35', '1', '台湾', '1');
INSERT INTO `region` VALUES ('36', '3', '安庆', '2');
INSERT INTO `region` VALUES ('37', '3', '蚌埠', '2');
INSERT INTO `region` VALUES ('38', '3', '巢湖', '2');
INSERT INTO `region` VALUES ('39', '3', '池州', '2');
INSERT INTO `region` VALUES ('40', '3', '滁州', '2');
INSERT INTO `region` VALUES ('41', '3', '阜阳', '2');
INSERT INTO `region` VALUES ('42', '3', '淮北', '2');
INSERT INTO `region` VALUES ('43', '3', '淮南', '2');
INSERT INTO `region` VALUES ('44', '3', '黄山', '2');
INSERT INTO `region` VALUES ('45', '3', '六安', '2');
INSERT INTO `region` VALUES ('46', '3', '马鞍山', '2');
INSERT INTO `region` VALUES ('47', '3', '宿州', '2');
INSERT INTO `region` VALUES ('48', '3', '铜陵', '2');
INSERT INTO `region` VALUES ('49', '3', '芜湖', '2');
INSERT INTO `region` VALUES ('50', '3', '宣城', '2');
INSERT INTO `region` VALUES ('51', '3', '亳州', '2');
INSERT INTO `region` VALUES ('52', '2', '北京', '2');
INSERT INTO `region` VALUES ('53', '4', '福州', '2');
INSERT INTO `region` VALUES ('54', '4', '龙岩', '2');
INSERT INTO `region` VALUES ('55', '4', '南平', '2');
INSERT INTO `region` VALUES ('56', '4', '宁德', '2');
INSERT INTO `region` VALUES ('57', '4', '莆田', '2');
INSERT INTO `region` VALUES ('58', '4', '泉州', '2');
INSERT INTO `region` VALUES ('59', '4', '三明', '2');
INSERT INTO `region` VALUES ('60', '4', '厦门', '2');
INSERT INTO `region` VALUES ('61', '4', '漳州', '2');
INSERT INTO `region` VALUES ('62', '5', '兰州', '2');
INSERT INTO `region` VALUES ('63', '5', '白银', '2');
INSERT INTO `region` VALUES ('64', '5', '定西', '2');
INSERT INTO `region` VALUES ('65', '5', '甘南', '2');
INSERT INTO `region` VALUES ('66', '5', '嘉峪关', '2');
INSERT INTO `region` VALUES ('67', '5', '金昌', '2');
INSERT INTO `region` VALUES ('68', '5', '酒泉', '2');
INSERT INTO `region` VALUES ('69', '5', '临夏', '2');
INSERT INTO `region` VALUES ('70', '5', '陇南', '2');
INSERT INTO `region` VALUES ('71', '5', '平凉', '2');
INSERT INTO `region` VALUES ('72', '5', '庆阳', '2');
INSERT INTO `region` VALUES ('73', '5', '天水', '2');
INSERT INTO `region` VALUES ('74', '5', '武威', '2');
INSERT INTO `region` VALUES ('75', '5', '张掖', '2');
INSERT INTO `region` VALUES ('76', '6', '广州', '2');
INSERT INTO `region` VALUES ('77', '6', '深圳', '2');
INSERT INTO `region` VALUES ('78', '6', '潮州', '2');
INSERT INTO `region` VALUES ('79', '6', '东莞', '2');
INSERT INTO `region` VALUES ('80', '6', '佛山', '2');
INSERT INTO `region` VALUES ('81', '6', '河源', '2');
INSERT INTO `region` VALUES ('82', '6', '惠州', '2');
INSERT INTO `region` VALUES ('83', '6', '江门', '2');
INSERT INTO `region` VALUES ('84', '6', '揭阳', '2');
INSERT INTO `region` VALUES ('85', '6', '茂名', '2');
INSERT INTO `region` VALUES ('86', '6', '梅州', '2');
INSERT INTO `region` VALUES ('87', '6', '清远', '2');
INSERT INTO `region` VALUES ('88', '6', '汕头', '2');
INSERT INTO `region` VALUES ('89', '6', '汕尾', '2');
INSERT INTO `region` VALUES ('90', '6', '韶关', '2');
INSERT INTO `region` VALUES ('91', '6', '阳江', '2');
INSERT INTO `region` VALUES ('92', '6', '云浮', '2');
INSERT INTO `region` VALUES ('93', '6', '湛江', '2');
INSERT INTO `region` VALUES ('94', '6', '肇庆', '2');
INSERT INTO `region` VALUES ('95', '6', '中山', '2');
INSERT INTO `region` VALUES ('96', '6', '珠海', '2');
INSERT INTO `region` VALUES ('97', '7', '南宁', '2');
INSERT INTO `region` VALUES ('98', '7', '桂林', '2');
INSERT INTO `region` VALUES ('99', '7', '百色', '2');
INSERT INTO `region` VALUES ('100', '7', '北海', '2');
INSERT INTO `region` VALUES ('101', '7', '崇左', '2');
INSERT INTO `region` VALUES ('102', '7', '防城港', '2');
INSERT INTO `region` VALUES ('103', '7', '贵港', '2');
INSERT INTO `region` VALUES ('104', '7', '河池', '2');
INSERT INTO `region` VALUES ('105', '7', '贺州', '2');
INSERT INTO `region` VALUES ('106', '7', '来宾', '2');
INSERT INTO `region` VALUES ('107', '7', '柳州', '2');
INSERT INTO `region` VALUES ('108', '7', '钦州', '2');
INSERT INTO `region` VALUES ('109', '7', '梧州', '2');
INSERT INTO `region` VALUES ('110', '7', '玉林', '2');
INSERT INTO `region` VALUES ('111', '8', '贵阳', '2');
INSERT INTO `region` VALUES ('112', '8', '安顺', '2');
INSERT INTO `region` VALUES ('113', '8', '毕节', '2');
INSERT INTO `region` VALUES ('114', '8', '六盘水', '2');
INSERT INTO `region` VALUES ('115', '8', '黔东南', '2');
INSERT INTO `region` VALUES ('116', '8', '黔南', '2');
INSERT INTO `region` VALUES ('117', '8', '黔西南', '2');
INSERT INTO `region` VALUES ('118', '8', '铜仁', '2');
INSERT INTO `region` VALUES ('119', '8', '遵义', '2');
INSERT INTO `region` VALUES ('120', '9', '海口', '2');
INSERT INTO `region` VALUES ('121', '9', '三亚', '2');
INSERT INTO `region` VALUES ('122', '9', '白沙', '2');
INSERT INTO `region` VALUES ('123', '9', '保亭', '2');
INSERT INTO `region` VALUES ('124', '9', '昌江', '2');
INSERT INTO `region` VALUES ('125', '9', '澄迈县', '2');
INSERT INTO `region` VALUES ('126', '9', '定安县', '2');
INSERT INTO `region` VALUES ('127', '9', '东方', '2');
INSERT INTO `region` VALUES ('128', '9', '乐东', '2');
INSERT INTO `region` VALUES ('129', '9', '临高县', '2');
INSERT INTO `region` VALUES ('130', '9', '陵水', '2');
INSERT INTO `region` VALUES ('131', '9', '琼海', '2');
INSERT INTO `region` VALUES ('132', '9', '琼中', '2');
INSERT INTO `region` VALUES ('133', '9', '屯昌县', '2');
INSERT INTO `region` VALUES ('134', '9', '万宁', '2');
INSERT INTO `region` VALUES ('135', '9', '文昌', '2');
INSERT INTO `region` VALUES ('136', '9', '五指山', '2');
INSERT INTO `region` VALUES ('137', '9', '儋州', '2');
INSERT INTO `region` VALUES ('138', '10', '石家庄', '2');
INSERT INTO `region` VALUES ('139', '10', '保定', '2');
INSERT INTO `region` VALUES ('140', '10', '沧州', '2');
INSERT INTO `region` VALUES ('141', '10', '承德', '2');
INSERT INTO `region` VALUES ('142', '10', '邯郸', '2');
INSERT INTO `region` VALUES ('143', '10', '衡水', '2');
INSERT INTO `region` VALUES ('144', '10', '廊坊', '2');
INSERT INTO `region` VALUES ('145', '10', '秦皇岛', '2');
INSERT INTO `region` VALUES ('146', '10', '唐山', '2');
INSERT INTO `region` VALUES ('147', '10', '邢台', '2');
INSERT INTO `region` VALUES ('148', '10', '张家口', '2');
INSERT INTO `region` VALUES ('149', '11', '郑州', '2');
INSERT INTO `region` VALUES ('150', '11', '洛阳', '2');
INSERT INTO `region` VALUES ('151', '11', '开封', '2');
INSERT INTO `region` VALUES ('152', '11', '安阳', '2');
INSERT INTO `region` VALUES ('153', '11', '鹤壁', '2');
INSERT INTO `region` VALUES ('154', '11', '济源', '2');
INSERT INTO `region` VALUES ('155', '11', '焦作', '2');
INSERT INTO `region` VALUES ('156', '11', '南阳', '2');
INSERT INTO `region` VALUES ('157', '11', '平顶山', '2');
INSERT INTO `region` VALUES ('158', '11', '三门峡', '2');
INSERT INTO `region` VALUES ('159', '11', '商丘', '2');
INSERT INTO `region` VALUES ('160', '11', '新乡', '2');
INSERT INTO `region` VALUES ('161', '11', '信阳', '2');
INSERT INTO `region` VALUES ('162', '11', '许昌', '2');
INSERT INTO `region` VALUES ('163', '11', '周口', '2');
INSERT INTO `region` VALUES ('164', '11', '驻马店', '2');
INSERT INTO `region` VALUES ('165', '11', '漯河', '2');
INSERT INTO `region` VALUES ('166', '11', '濮阳', '2');
INSERT INTO `region` VALUES ('167', '12', '哈尔滨', '2');
INSERT INTO `region` VALUES ('168', '12', '大庆', '2');
INSERT INTO `region` VALUES ('169', '12', '大兴安岭', '2');
INSERT INTO `region` VALUES ('170', '12', '鹤岗', '2');
INSERT INTO `region` VALUES ('171', '12', '黑河', '2');
INSERT INTO `region` VALUES ('172', '12', '鸡西', '2');
INSERT INTO `region` VALUES ('173', '12', '佳木斯', '2');
INSERT INTO `region` VALUES ('174', '12', '牡丹江', '2');
INSERT INTO `region` VALUES ('175', '12', '七台河', '2');
INSERT INTO `region` VALUES ('176', '12', '齐齐哈尔', '2');
INSERT INTO `region` VALUES ('177', '12', '双鸭山', '2');
INSERT INTO `region` VALUES ('178', '12', '绥化', '2');
INSERT INTO `region` VALUES ('179', '12', '伊春', '2');
INSERT INTO `region` VALUES ('180', '13', '武汉', '2');
INSERT INTO `region` VALUES ('181', '13', '仙桃', '2');
INSERT INTO `region` VALUES ('182', '13', '鄂州', '2');
INSERT INTO `region` VALUES ('183', '13', '黄冈', '2');
INSERT INTO `region` VALUES ('184', '13', '黄石', '2');
INSERT INTO `region` VALUES ('185', '13', '荆门', '2');
INSERT INTO `region` VALUES ('186', '13', '荆州', '2');
INSERT INTO `region` VALUES ('187', '13', '潜江', '2');
INSERT INTO `region` VALUES ('188', '13', '神农架林区', '2');
INSERT INTO `region` VALUES ('189', '13', '十堰', '2');
INSERT INTO `region` VALUES ('190', '13', '随州', '2');
INSERT INTO `region` VALUES ('191', '13', '天门', '2');
INSERT INTO `region` VALUES ('192', '13', '咸宁', '2');
INSERT INTO `region` VALUES ('193', '13', '襄樊', '2');
INSERT INTO `region` VALUES ('194', '13', '孝感', '2');
INSERT INTO `region` VALUES ('195', '13', '宜昌', '2');
INSERT INTO `region` VALUES ('196', '13', '恩施', '2');
INSERT INTO `region` VALUES ('197', '14', '长沙', '2');
INSERT INTO `region` VALUES ('198', '14', '张家界', '2');
INSERT INTO `region` VALUES ('199', '14', '常德', '2');
INSERT INTO `region` VALUES ('200', '14', '郴州', '2');
INSERT INTO `region` VALUES ('201', '14', '衡阳', '2');
INSERT INTO `region` VALUES ('202', '14', '怀化', '2');
INSERT INTO `region` VALUES ('203', '14', '娄底', '2');
INSERT INTO `region` VALUES ('204', '14', '邵阳', '2');
INSERT INTO `region` VALUES ('205', '14', '湘潭', '2');
INSERT INTO `region` VALUES ('206', '14', '湘西', '2');
INSERT INTO `region` VALUES ('207', '14', '益阳', '2');
INSERT INTO `region` VALUES ('208', '14', '永州', '2');
INSERT INTO `region` VALUES ('209', '14', '岳阳', '2');
INSERT INTO `region` VALUES ('210', '14', '株洲', '2');
INSERT INTO `region` VALUES ('211', '15', '长春', '2');
INSERT INTO `region` VALUES ('212', '15', '吉林', '2');
INSERT INTO `region` VALUES ('213', '15', '白城', '2');
INSERT INTO `region` VALUES ('214', '15', '白山', '2');
INSERT INTO `region` VALUES ('215', '15', '辽源', '2');
INSERT INTO `region` VALUES ('216', '15', '四平', '2');
INSERT INTO `region` VALUES ('217', '15', '松原', '2');
INSERT INTO `region` VALUES ('218', '15', '通化', '2');
INSERT INTO `region` VALUES ('219', '15', '延边', '2');
INSERT INTO `region` VALUES ('220', '16', '南京', '2');
INSERT INTO `region` VALUES ('221', '16', '苏州', '2');
INSERT INTO `region` VALUES ('222', '16', '无锡', '2');
INSERT INTO `region` VALUES ('223', '16', '常州', '2');
INSERT INTO `region` VALUES ('224', '16', '淮安', '2');
INSERT INTO `region` VALUES ('225', '16', '连云港', '2');
INSERT INTO `region` VALUES ('226', '16', '南通', '2');
INSERT INTO `region` VALUES ('227', '16', '宿迁', '2');
INSERT INTO `region` VALUES ('228', '16', '泰州', '2');
INSERT INTO `region` VALUES ('229', '16', '徐州', '2');
INSERT INTO `region` VALUES ('230', '16', '盐城', '2');
INSERT INTO `region` VALUES ('231', '16', '扬州', '2');
INSERT INTO `region` VALUES ('232', '16', '镇江', '2');
INSERT INTO `region` VALUES ('233', '17', '南昌', '2');
INSERT INTO `region` VALUES ('234', '17', '抚州', '2');
INSERT INTO `region` VALUES ('235', '17', '赣州', '2');
INSERT INTO `region` VALUES ('236', '17', '吉安', '2');
INSERT INTO `region` VALUES ('237', '17', '景德镇', '2');
INSERT INTO `region` VALUES ('238', '17', '九江', '2');
INSERT INTO `region` VALUES ('239', '17', '萍乡', '2');
INSERT INTO `region` VALUES ('240', '17', '上饶', '2');
INSERT INTO `region` VALUES ('241', '17', '新余', '2');
INSERT INTO `region` VALUES ('242', '17', '宜春', '2');
INSERT INTO `region` VALUES ('243', '17', '鹰潭', '2');
INSERT INTO `region` VALUES ('244', '18', '沈阳', '2');
INSERT INTO `region` VALUES ('245', '18', '大连', '2');
INSERT INTO `region` VALUES ('246', '18', '鞍山', '2');
INSERT INTO `region` VALUES ('247', '18', '本溪', '2');
INSERT INTO `region` VALUES ('248', '18', '朝阳', '2');
INSERT INTO `region` VALUES ('249', '18', '丹东', '2');
INSERT INTO `region` VALUES ('250', '18', '抚顺', '2');
INSERT INTO `region` VALUES ('251', '18', '阜新', '2');
INSERT INTO `region` VALUES ('252', '18', '葫芦岛', '2');
INSERT INTO `region` VALUES ('253', '18', '锦州', '2');
INSERT INTO `region` VALUES ('254', '18', '辽阳', '2');
INSERT INTO `region` VALUES ('255', '18', '盘锦', '2');
INSERT INTO `region` VALUES ('256', '18', '铁岭', '2');
INSERT INTO `region` VALUES ('257', '18', '营口', '2');
INSERT INTO `region` VALUES ('258', '19', '呼和浩特', '2');
INSERT INTO `region` VALUES ('259', '19', '阿拉善盟', '2');
INSERT INTO `region` VALUES ('260', '19', '巴彦淖尔盟', '2');
INSERT INTO `region` VALUES ('261', '19', '包头', '2');
INSERT INTO `region` VALUES ('262', '19', '赤峰', '2');
INSERT INTO `region` VALUES ('263', '19', '鄂尔多斯', '2');
INSERT INTO `region` VALUES ('264', '19', '呼伦贝尔', '2');
INSERT INTO `region` VALUES ('265', '19', '通辽', '2');
INSERT INTO `region` VALUES ('266', '19', '乌海', '2');
INSERT INTO `region` VALUES ('267', '19', '乌兰察布市', '2');
INSERT INTO `region` VALUES ('268', '19', '锡林郭勒盟', '2');
INSERT INTO `region` VALUES ('269', '19', '兴安盟', '2');
INSERT INTO `region` VALUES ('270', '20', '银川', '2');
INSERT INTO `region` VALUES ('271', '20', '固原', '2');
INSERT INTO `region` VALUES ('272', '20', '石嘴山', '2');
INSERT INTO `region` VALUES ('273', '20', '吴忠', '2');
INSERT INTO `region` VALUES ('274', '20', '中卫', '2');
INSERT INTO `region` VALUES ('275', '21', '西宁', '2');
INSERT INTO `region` VALUES ('276', '21', '果洛', '2');
INSERT INTO `region` VALUES ('277', '21', '海北', '2');
INSERT INTO `region` VALUES ('278', '21', '海东', '2');
INSERT INTO `region` VALUES ('279', '21', '海南', '2');
INSERT INTO `region` VALUES ('280', '21', '海西', '2');
INSERT INTO `region` VALUES ('281', '21', '黄南', '2');
INSERT INTO `region` VALUES ('282', '21', '玉树', '2');
INSERT INTO `region` VALUES ('283', '22', '济南', '2');
INSERT INTO `region` VALUES ('284', '22', '青岛', '2');
INSERT INTO `region` VALUES ('285', '22', '滨州', '2');
INSERT INTO `region` VALUES ('286', '22', '德州', '2');
INSERT INTO `region` VALUES ('287', '22', '东营', '2');
INSERT INTO `region` VALUES ('288', '22', '菏泽', '2');
INSERT INTO `region` VALUES ('289', '22', '济宁', '2');
INSERT INTO `region` VALUES ('290', '22', '莱芜', '2');
INSERT INTO `region` VALUES ('291', '22', '聊城', '2');
INSERT INTO `region` VALUES ('292', '22', '临沂', '2');
INSERT INTO `region` VALUES ('293', '22', '日照', '2');
INSERT INTO `region` VALUES ('294', '22', '泰安', '2');
INSERT INTO `region` VALUES ('295', '22', '威海', '2');
INSERT INTO `region` VALUES ('296', '22', '潍坊', '2');
INSERT INTO `region` VALUES ('297', '22', '烟台', '2');
INSERT INTO `region` VALUES ('298', '22', '枣庄', '2');
INSERT INTO `region` VALUES ('299', '22', '淄博', '2');
INSERT INTO `region` VALUES ('300', '23', '太原', '2');
INSERT INTO `region` VALUES ('301', '23', '长治', '2');
INSERT INTO `region` VALUES ('302', '23', '大同', '2');
INSERT INTO `region` VALUES ('303', '23', '晋城', '2');
INSERT INTO `region` VALUES ('304', '23', '晋中', '2');
INSERT INTO `region` VALUES ('305', '23', '临汾', '2');
INSERT INTO `region` VALUES ('306', '23', '吕梁', '2');
INSERT INTO `region` VALUES ('307', '23', '朔州', '2');
INSERT INTO `region` VALUES ('308', '23', '忻州', '2');
INSERT INTO `region` VALUES ('309', '23', '阳泉', '2');
INSERT INTO `region` VALUES ('310', '23', '运城', '2');
INSERT INTO `region` VALUES ('311', '24', '西安', '2');
INSERT INTO `region` VALUES ('312', '24', '安康', '2');
INSERT INTO `region` VALUES ('313', '24', '宝鸡', '2');
INSERT INTO `region` VALUES ('314', '24', '汉中', '2');
INSERT INTO `region` VALUES ('315', '24', '商洛', '2');
INSERT INTO `region` VALUES ('316', '24', '铜川', '2');
INSERT INTO `region` VALUES ('317', '24', '渭南', '2');
INSERT INTO `region` VALUES ('318', '24', '咸阳', '2');
INSERT INTO `region` VALUES ('319', '24', '延安', '2');
INSERT INTO `region` VALUES ('320', '24', '榆林', '2');
INSERT INTO `region` VALUES ('321', '25', '上海', '2');
INSERT INTO `region` VALUES ('322', '26', '成都', '2');
INSERT INTO `region` VALUES ('323', '26', '绵阳', '2');
INSERT INTO `region` VALUES ('324', '26', '阿坝', '2');
INSERT INTO `region` VALUES ('325', '26', '巴中', '2');
INSERT INTO `region` VALUES ('326', '26', '达州', '2');
INSERT INTO `region` VALUES ('327', '26', '德阳', '2');
INSERT INTO `region` VALUES ('328', '26', '甘孜', '2');
INSERT INTO `region` VALUES ('329', '26', '广安', '2');
INSERT INTO `region` VALUES ('330', '26', '广元', '2');
INSERT INTO `region` VALUES ('331', '26', '乐山', '2');
INSERT INTO `region` VALUES ('332', '26', '凉山', '2');
INSERT INTO `region` VALUES ('333', '26', '眉山', '2');
INSERT INTO `region` VALUES ('334', '26', '南充', '2');
INSERT INTO `region` VALUES ('335', '26', '内江', '2');
INSERT INTO `region` VALUES ('336', '26', '攀枝花', '2');
INSERT INTO `region` VALUES ('337', '26', '遂宁', '2');
INSERT INTO `region` VALUES ('338', '26', '雅安', '2');
INSERT INTO `region` VALUES ('339', '26', '宜宾', '2');
INSERT INTO `region` VALUES ('340', '26', '资阳', '2');
INSERT INTO `region` VALUES ('341', '26', '自贡', '2');
INSERT INTO `region` VALUES ('342', '26', '泸州', '2');
INSERT INTO `region` VALUES ('343', '27', '天津', '2');
INSERT INTO `region` VALUES ('344', '28', '拉萨', '2');
INSERT INTO `region` VALUES ('345', '28', '阿里', '2');
INSERT INTO `region` VALUES ('346', '28', '昌都', '2');
INSERT INTO `region` VALUES ('347', '28', '林芝', '2');
INSERT INTO `region` VALUES ('348', '28', '那曲', '2');
INSERT INTO `region` VALUES ('349', '28', '日喀则', '2');
INSERT INTO `region` VALUES ('350', '28', '山南', '2');
INSERT INTO `region` VALUES ('351', '29', '乌鲁木齐', '2');
INSERT INTO `region` VALUES ('352', '29', '阿克苏', '2');
INSERT INTO `region` VALUES ('353', '29', '阿拉尔', '2');
INSERT INTO `region` VALUES ('354', '29', '巴音郭楞', '2');
INSERT INTO `region` VALUES ('355', '29', '博尔塔拉', '2');
INSERT INTO `region` VALUES ('356', '29', '昌吉', '2');
INSERT INTO `region` VALUES ('357', '29', '哈密', '2');
INSERT INTO `region` VALUES ('358', '29', '和田', '2');
INSERT INTO `region` VALUES ('359', '29', '喀什', '2');
INSERT INTO `region` VALUES ('360', '29', '克拉玛依', '2');
INSERT INTO `region` VALUES ('361', '29', '克孜勒苏', '2');
INSERT INTO `region` VALUES ('362', '29', '石河子', '2');
INSERT INTO `region` VALUES ('363', '29', '图木舒克', '2');
INSERT INTO `region` VALUES ('364', '29', '吐鲁番', '2');
INSERT INTO `region` VALUES ('365', '29', '五家渠', '2');
INSERT INTO `region` VALUES ('366', '29', '伊犁', '2');
INSERT INTO `region` VALUES ('367', '30', '昆明', '2');
INSERT INTO `region` VALUES ('368', '30', '怒江', '2');
INSERT INTO `region` VALUES ('369', '30', '普洱', '2');
INSERT INTO `region` VALUES ('370', '30', '丽江', '2');
INSERT INTO `region` VALUES ('371', '30', '保山', '2');
INSERT INTO `region` VALUES ('372', '30', '楚雄', '2');
INSERT INTO `region` VALUES ('373', '30', '大理', '2');
INSERT INTO `region` VALUES ('374', '30', '德宏', '2');
INSERT INTO `region` VALUES ('375', '30', '迪庆', '2');
INSERT INTO `region` VALUES ('376', '30', '红河', '2');
INSERT INTO `region` VALUES ('377', '30', '临沧', '2');
INSERT INTO `region` VALUES ('378', '30', '曲靖', '2');
INSERT INTO `region` VALUES ('379', '30', '文山', '2');
INSERT INTO `region` VALUES ('380', '30', '西双版纳', '2');
INSERT INTO `region` VALUES ('381', '30', '玉溪', '2');
INSERT INTO `region` VALUES ('382', '30', '昭通', '2');
INSERT INTO `region` VALUES ('383', '31', '杭州', '2');
INSERT INTO `region` VALUES ('384', '31', '湖州', '2');
INSERT INTO `region` VALUES ('385', '31', '嘉兴', '2');
INSERT INTO `region` VALUES ('386', '31', '金华', '2');
INSERT INTO `region` VALUES ('387', '31', '丽水', '2');
INSERT INTO `region` VALUES ('388', '31', '宁波', '2');
INSERT INTO `region` VALUES ('389', '31', '绍兴', '2');
INSERT INTO `region` VALUES ('390', '31', '台州', '2');
INSERT INTO `region` VALUES ('391', '31', '温州', '2');
INSERT INTO `region` VALUES ('392', '31', '舟山', '2');
INSERT INTO `region` VALUES ('393', '31', '衢州', '2');
INSERT INTO `region` VALUES ('394', '32', '重庆', '2');
INSERT INTO `region` VALUES ('395', '33', '香港', '2');
INSERT INTO `region` VALUES ('396', '34', '澳门', '2');
INSERT INTO `region` VALUES ('397', '35', '台湾', '2');
INSERT INTO `region` VALUES ('398', '36', '迎江区', '3');
INSERT INTO `region` VALUES ('399', '36', '大观区', '3');
INSERT INTO `region` VALUES ('400', '36', '宜秀区', '3');
INSERT INTO `region` VALUES ('401', '36', '桐城市', '3');
INSERT INTO `region` VALUES ('402', '36', '怀宁县', '3');
INSERT INTO `region` VALUES ('403', '36', '枞阳县', '3');
INSERT INTO `region` VALUES ('404', '36', '潜山县', '3');
INSERT INTO `region` VALUES ('405', '36', '太湖县', '3');
INSERT INTO `region` VALUES ('406', '36', '宿松县', '3');
INSERT INTO `region` VALUES ('407', '36', '望江县', '3');
INSERT INTO `region` VALUES ('408', '36', '岳西县', '3');
INSERT INTO `region` VALUES ('409', '37', '中市区', '3');
INSERT INTO `region` VALUES ('410', '37', '东市区', '3');
INSERT INTO `region` VALUES ('411', '37', '西市区', '3');
INSERT INTO `region` VALUES ('412', '37', '郊区', '3');
INSERT INTO `region` VALUES ('413', '37', '怀远县', '3');
INSERT INTO `region` VALUES ('414', '37', '五河县', '3');
INSERT INTO `region` VALUES ('415', '37', '固镇县', '3');
INSERT INTO `region` VALUES ('416', '38', '居巢区', '3');
INSERT INTO `region` VALUES ('417', '38', '庐江县', '3');
INSERT INTO `region` VALUES ('418', '38', '无为县', '3');
INSERT INTO `region` VALUES ('419', '38', '含山县', '3');
INSERT INTO `region` VALUES ('420', '38', '和县', '3');
INSERT INTO `region` VALUES ('421', '39', '贵池区', '3');
INSERT INTO `region` VALUES ('422', '39', '东至县', '3');
INSERT INTO `region` VALUES ('423', '39', '石台县', '3');
INSERT INTO `region` VALUES ('424', '39', '青阳县', '3');
INSERT INTO `region` VALUES ('425', '40', '琅琊区', '3');
INSERT INTO `region` VALUES ('426', '40', '南谯区', '3');
INSERT INTO `region` VALUES ('427', '40', '天长市', '3');
INSERT INTO `region` VALUES ('428', '40', '明光市', '3');
INSERT INTO `region` VALUES ('429', '40', '来安县', '3');
INSERT INTO `region` VALUES ('430', '40', '全椒县', '3');
INSERT INTO `region` VALUES ('431', '40', '定远县', '3');
INSERT INTO `region` VALUES ('432', '40', '凤阳县', '3');
INSERT INTO `region` VALUES ('433', '41', '蚌山区', '3');
INSERT INTO `region` VALUES ('434', '41', '龙子湖区', '3');
INSERT INTO `region` VALUES ('435', '41', '禹会区', '3');
INSERT INTO `region` VALUES ('436', '41', '淮上区', '3');
INSERT INTO `region` VALUES ('437', '41', '颍州区', '3');
INSERT INTO `region` VALUES ('438', '41', '颍东区', '3');
INSERT INTO `region` VALUES ('439', '41', '颍泉区', '3');
INSERT INTO `region` VALUES ('440', '41', '界首市', '3');
INSERT INTO `region` VALUES ('441', '41', '临泉县', '3');
INSERT INTO `region` VALUES ('442', '41', '太和县', '3');
INSERT INTO `region` VALUES ('443', '41', '阜南县', '3');
INSERT INTO `region` VALUES ('444', '41', '颖上县', '3');
INSERT INTO `region` VALUES ('445', '42', '相山区', '3');
INSERT INTO `region` VALUES ('446', '42', '杜集区', '3');
INSERT INTO `region` VALUES ('447', '42', '烈山区', '3');
INSERT INTO `region` VALUES ('448', '42', '濉溪县', '3');
INSERT INTO `region` VALUES ('449', '43', '田家庵区', '3');
INSERT INTO `region` VALUES ('450', '43', '大通区', '3');
INSERT INTO `region` VALUES ('451', '43', '谢家集区', '3');
INSERT INTO `region` VALUES ('452', '43', '八公山区', '3');
INSERT INTO `region` VALUES ('453', '43', '潘集区', '3');
INSERT INTO `region` VALUES ('454', '43', '凤台县', '3');
INSERT INTO `region` VALUES ('455', '44', '屯溪区', '3');
INSERT INTO `region` VALUES ('456', '44', '黄山区', '3');
INSERT INTO `region` VALUES ('457', '44', '徽州区', '3');
INSERT INTO `region` VALUES ('458', '44', '歙县', '3');
INSERT INTO `region` VALUES ('459', '44', '休宁县', '3');
INSERT INTO `region` VALUES ('460', '44', '黟县', '3');
INSERT INTO `region` VALUES ('461', '44', '祁门县', '3');
INSERT INTO `region` VALUES ('462', '45', '金安区', '3');
INSERT INTO `region` VALUES ('463', '45', '裕安区', '3');
INSERT INTO `region` VALUES ('464', '45', '寿县', '3');
INSERT INTO `region` VALUES ('465', '45', '霍邱县', '3');
INSERT INTO `region` VALUES ('466', '45', '舒城县', '3');
INSERT INTO `region` VALUES ('467', '45', '金寨县', '3');
INSERT INTO `region` VALUES ('468', '45', '霍山县', '3');
INSERT INTO `region` VALUES ('469', '46', '雨山区', '3');
INSERT INTO `region` VALUES ('470', '46', '花山区', '3');
INSERT INTO `region` VALUES ('471', '46', '金家庄区', '3');
INSERT INTO `region` VALUES ('472', '46', '当涂县', '3');
INSERT INTO `region` VALUES ('473', '47', '埇桥区', '3');
INSERT INTO `region` VALUES ('474', '47', '砀山县', '3');
INSERT INTO `region` VALUES ('475', '47', '萧县', '3');
INSERT INTO `region` VALUES ('476', '47', '灵璧县', '3');
INSERT INTO `region` VALUES ('477', '47', '泗县', '3');
INSERT INTO `region` VALUES ('478', '48', '铜官山区', '3');
INSERT INTO `region` VALUES ('479', '48', '狮子山区', '3');
INSERT INTO `region` VALUES ('480', '48', '郊区', '3');
INSERT INTO `region` VALUES ('481', '48', '铜陵县', '3');
INSERT INTO `region` VALUES ('482', '49', '镜湖区', '3');
INSERT INTO `region` VALUES ('483', '49', '弋江区', '3');
INSERT INTO `region` VALUES ('484', '49', '鸠江区', '3');
INSERT INTO `region` VALUES ('485', '49', '三山区', '3');
INSERT INTO `region` VALUES ('486', '49', '芜湖县', '3');
INSERT INTO `region` VALUES ('487', '49', '繁昌县', '3');
INSERT INTO `region` VALUES ('488', '49', '南陵县', '3');
INSERT INTO `region` VALUES ('489', '50', '宣州区', '3');
INSERT INTO `region` VALUES ('490', '50', '宁国市', '3');
INSERT INTO `region` VALUES ('491', '50', '郎溪县', '3');
INSERT INTO `region` VALUES ('492', '50', '广德县', '3');
INSERT INTO `region` VALUES ('493', '50', '泾县', '3');
INSERT INTO `region` VALUES ('494', '50', '绩溪县', '3');
INSERT INTO `region` VALUES ('495', '50', '旌德县', '3');
INSERT INTO `region` VALUES ('496', '51', '涡阳县', '3');
INSERT INTO `region` VALUES ('497', '51', '蒙城县', '3');
INSERT INTO `region` VALUES ('498', '51', '利辛县', '3');
INSERT INTO `region` VALUES ('499', '51', '谯城区', '3');
INSERT INTO `region` VALUES ('500', '52', '东城区', '3');
INSERT INTO `region` VALUES ('501', '52', '西城区', '3');
INSERT INTO `region` VALUES ('502', '52', '海淀区', '3');
INSERT INTO `region` VALUES ('503', '52', '朝阳区', '3');
INSERT INTO `region` VALUES ('504', '52', '崇文区', '3');
INSERT INTO `region` VALUES ('505', '52', '宣武区', '3');
INSERT INTO `region` VALUES ('506', '52', '丰台区', '3');
INSERT INTO `region` VALUES ('507', '52', '石景山区', '3');
INSERT INTO `region` VALUES ('508', '52', '房山区', '3');
INSERT INTO `region` VALUES ('509', '52', '门头沟区', '3');
INSERT INTO `region` VALUES ('510', '52', '通州区', '3');
INSERT INTO `region` VALUES ('511', '52', '顺义区', '3');
INSERT INTO `region` VALUES ('512', '52', '昌平区', '3');
INSERT INTO `region` VALUES ('513', '52', '怀柔区', '3');
INSERT INTO `region` VALUES ('514', '52', '平谷区', '3');
INSERT INTO `region` VALUES ('515', '52', '大兴区', '3');
INSERT INTO `region` VALUES ('516', '52', '密云县', '3');
INSERT INTO `region` VALUES ('517', '52', '延庆县', '3');
INSERT INTO `region` VALUES ('518', '53', '鼓楼区', '3');
INSERT INTO `region` VALUES ('519', '53', '台江区', '3');
INSERT INTO `region` VALUES ('520', '53', '仓山区', '3');
INSERT INTO `region` VALUES ('521', '53', '马尾区', '3');
INSERT INTO `region` VALUES ('522', '53', '晋安区', '3');
INSERT INTO `region` VALUES ('523', '53', '福清市', '3');
INSERT INTO `region` VALUES ('524', '53', '长乐市', '3');
INSERT INTO `region` VALUES ('525', '53', '闽侯县', '3');
INSERT INTO `region` VALUES ('526', '53', '连江县', '3');
INSERT INTO `region` VALUES ('527', '53', '罗源县', '3');
INSERT INTO `region` VALUES ('528', '53', '闽清县', '3');
INSERT INTO `region` VALUES ('529', '53', '永泰县', '3');
INSERT INTO `region` VALUES ('530', '53', '平潭县', '3');
INSERT INTO `region` VALUES ('531', '54', '新罗区', '3');
INSERT INTO `region` VALUES ('532', '54', '漳平市', '3');
INSERT INTO `region` VALUES ('533', '54', '长汀县', '3');
INSERT INTO `region` VALUES ('534', '54', '永定县', '3');
INSERT INTO `region` VALUES ('535', '54', '上杭县', '3');
INSERT INTO `region` VALUES ('536', '54', '武平县', '3');
INSERT INTO `region` VALUES ('537', '54', '连城县', '3');
INSERT INTO `region` VALUES ('538', '55', '延平区', '3');
INSERT INTO `region` VALUES ('539', '55', '邵武市', '3');
INSERT INTO `region` VALUES ('540', '55', '武夷山市', '3');
INSERT INTO `region` VALUES ('541', '55', '建瓯市', '3');
INSERT INTO `region` VALUES ('542', '55', '建阳市', '3');
INSERT INTO `region` VALUES ('543', '55', '顺昌县', '3');
INSERT INTO `region` VALUES ('544', '55', '浦城县', '3');
INSERT INTO `region` VALUES ('545', '55', '光泽县', '3');
INSERT INTO `region` VALUES ('546', '55', '松溪县', '3');
INSERT INTO `region` VALUES ('547', '55', '政和县', '3');
INSERT INTO `region` VALUES ('548', '56', '蕉城区', '3');
INSERT INTO `region` VALUES ('549', '56', '福安市', '3');
INSERT INTO `region` VALUES ('550', '56', '福鼎市', '3');
INSERT INTO `region` VALUES ('551', '56', '霞浦县', '3');
INSERT INTO `region` VALUES ('552', '56', '古田县', '3');
INSERT INTO `region` VALUES ('553', '56', '屏南县', '3');
INSERT INTO `region` VALUES ('554', '56', '寿宁县', '3');
INSERT INTO `region` VALUES ('555', '56', '周宁县', '3');
INSERT INTO `region` VALUES ('556', '56', '柘荣县', '3');
INSERT INTO `region` VALUES ('557', '57', '城厢区', '3');
INSERT INTO `region` VALUES ('558', '57', '涵江区', '3');
INSERT INTO `region` VALUES ('559', '57', '荔城区', '3');
INSERT INTO `region` VALUES ('560', '57', '秀屿区', '3');
INSERT INTO `region` VALUES ('561', '57', '仙游县', '3');
INSERT INTO `region` VALUES ('562', '58', '鲤城区', '3');
INSERT INTO `region` VALUES ('563', '58', '丰泽区', '3');
INSERT INTO `region` VALUES ('564', '58', '洛江区', '3');
INSERT INTO `region` VALUES ('565', '58', '清濛开发区', '3');
INSERT INTO `region` VALUES ('566', '58', '泉港区', '3');
INSERT INTO `region` VALUES ('567', '58', '石狮市', '3');
INSERT INTO `region` VALUES ('568', '58', '晋江市', '3');
INSERT INTO `region` VALUES ('569', '58', '南安市', '3');
INSERT INTO `region` VALUES ('570', '58', '惠安县', '3');
INSERT INTO `region` VALUES ('571', '58', '安溪县', '3');
INSERT INTO `region` VALUES ('572', '58', '永春县', '3');
INSERT INTO `region` VALUES ('573', '58', '德化县', '3');
INSERT INTO `region` VALUES ('574', '58', '金门县', '3');
INSERT INTO `region` VALUES ('575', '59', '梅列区', '3');
INSERT INTO `region` VALUES ('576', '59', '三元区', '3');
INSERT INTO `region` VALUES ('577', '59', '永安市', '3');
INSERT INTO `region` VALUES ('578', '59', '明溪县', '3');
INSERT INTO `region` VALUES ('579', '59', '清流县', '3');
INSERT INTO `region` VALUES ('580', '59', '宁化县', '3');
INSERT INTO `region` VALUES ('581', '59', '大田县', '3');
INSERT INTO `region` VALUES ('582', '59', '尤溪县', '3');
INSERT INTO `region` VALUES ('583', '59', '沙县', '3');
INSERT INTO `region` VALUES ('584', '59', '将乐县', '3');
INSERT INTO `region` VALUES ('585', '59', '泰宁县', '3');
INSERT INTO `region` VALUES ('586', '59', '建宁县', '3');
INSERT INTO `region` VALUES ('587', '60', '思明区', '3');
INSERT INTO `region` VALUES ('588', '60', '海沧区', '3');
INSERT INTO `region` VALUES ('589', '60', '湖里区', '3');
INSERT INTO `region` VALUES ('590', '60', '集美区', '3');
INSERT INTO `region` VALUES ('591', '60', '同安区', '3');
INSERT INTO `region` VALUES ('592', '60', '翔安区', '3');
INSERT INTO `region` VALUES ('593', '61', '芗城区', '3');
INSERT INTO `region` VALUES ('594', '61', '龙文区', '3');
INSERT INTO `region` VALUES ('595', '61', '龙海市', '3');
INSERT INTO `region` VALUES ('596', '61', '云霄县', '3');
INSERT INTO `region` VALUES ('597', '61', '漳浦县', '3');
INSERT INTO `region` VALUES ('598', '61', '诏安县', '3');
INSERT INTO `region` VALUES ('599', '61', '长泰县', '3');
INSERT INTO `region` VALUES ('600', '61', '东山县', '3');
INSERT INTO `region` VALUES ('601', '61', '南靖县', '3');
INSERT INTO `region` VALUES ('602', '61', '平和县', '3');
INSERT INTO `region` VALUES ('603', '61', '华安县', '3');
INSERT INTO `region` VALUES ('604', '62', '皋兰县', '3');
INSERT INTO `region` VALUES ('605', '62', '城关区', '3');
INSERT INTO `region` VALUES ('606', '62', '七里河区', '3');
INSERT INTO `region` VALUES ('607', '62', '西固区', '3');
INSERT INTO `region` VALUES ('608', '62', '安宁区', '3');
INSERT INTO `region` VALUES ('609', '62', '红古区', '3');
INSERT INTO `region` VALUES ('610', '62', '永登县', '3');
INSERT INTO `region` VALUES ('611', '62', '榆中县', '3');
INSERT INTO `region` VALUES ('612', '63', '白银区', '3');
INSERT INTO `region` VALUES ('613', '63', '平川区', '3');
INSERT INTO `region` VALUES ('614', '63', '会宁县', '3');
INSERT INTO `region` VALUES ('615', '63', '景泰县', '3');
INSERT INTO `region` VALUES ('616', '63', '靖远县', '3');
INSERT INTO `region` VALUES ('617', '64', '临洮县', '3');
INSERT INTO `region` VALUES ('618', '64', '陇西县', '3');
INSERT INTO `region` VALUES ('619', '64', '通渭县', '3');
INSERT INTO `region` VALUES ('620', '64', '渭源县', '3');
INSERT INTO `region` VALUES ('621', '64', '漳县', '3');
INSERT INTO `region` VALUES ('622', '64', '岷县', '3');
INSERT INTO `region` VALUES ('623', '64', '安定区', '3');
INSERT INTO `region` VALUES ('624', '64', '安定区', '3');
INSERT INTO `region` VALUES ('625', '65', '合作市', '3');
INSERT INTO `region` VALUES ('626', '65', '临潭县', '3');
INSERT INTO `region` VALUES ('627', '65', '卓尼县', '3');
INSERT INTO `region` VALUES ('628', '65', '舟曲县', '3');
INSERT INTO `region` VALUES ('629', '65', '迭部县', '3');
INSERT INTO `region` VALUES ('630', '65', '玛曲县', '3');
INSERT INTO `region` VALUES ('631', '65', '碌曲县', '3');
INSERT INTO `region` VALUES ('632', '65', '夏河县', '3');
INSERT INTO `region` VALUES ('633', '66', '嘉峪关市', '3');
INSERT INTO `region` VALUES ('634', '67', '金川区', '3');
INSERT INTO `region` VALUES ('635', '67', '永昌县', '3');
INSERT INTO `region` VALUES ('636', '68', '肃州区', '3');
INSERT INTO `region` VALUES ('637', '68', '玉门市', '3');
INSERT INTO `region` VALUES ('638', '68', '敦煌市', '3');
INSERT INTO `region` VALUES ('639', '68', '金塔县', '3');
INSERT INTO `region` VALUES ('640', '68', '瓜州县', '3');
INSERT INTO `region` VALUES ('641', '68', '肃北', '3');
INSERT INTO `region` VALUES ('642', '68', '阿克塞', '3');
INSERT INTO `region` VALUES ('643', '69', '临夏市', '3');
INSERT INTO `region` VALUES ('644', '69', '临夏县', '3');
INSERT INTO `region` VALUES ('645', '69', '康乐县', '3');
INSERT INTO `region` VALUES ('646', '69', '永靖县', '3');
INSERT INTO `region` VALUES ('647', '69', '广河县', '3');
INSERT INTO `region` VALUES ('648', '69', '和政县', '3');
INSERT INTO `region` VALUES ('649', '69', '东乡族自治县', '3');
INSERT INTO `region` VALUES ('650', '69', '积石山', '3');
INSERT INTO `region` VALUES ('651', '70', '成县', '3');
INSERT INTO `region` VALUES ('652', '70', '徽县', '3');
INSERT INTO `region` VALUES ('653', '70', '康县', '3');
INSERT INTO `region` VALUES ('654', '70', '礼县', '3');
INSERT INTO `region` VALUES ('655', '70', '两当县', '3');
INSERT INTO `region` VALUES ('656', '70', '文县', '3');
INSERT INTO `region` VALUES ('657', '70', '西和县', '3');
INSERT INTO `region` VALUES ('658', '70', '宕昌县', '3');
INSERT INTO `region` VALUES ('659', '70', '武都区', '3');
INSERT INTO `region` VALUES ('660', '71', '崇信县', '3');
INSERT INTO `region` VALUES ('661', '71', '华亭县', '3');
INSERT INTO `region` VALUES ('662', '71', '静宁县', '3');
INSERT INTO `region` VALUES ('663', '71', '灵台县', '3');
INSERT INTO `region` VALUES ('664', '71', '崆峒区', '3');
INSERT INTO `region` VALUES ('665', '71', '庄浪县', '3');
INSERT INTO `region` VALUES ('666', '71', '泾川县', '3');
INSERT INTO `region` VALUES ('667', '72', '合水县', '3');
INSERT INTO `region` VALUES ('668', '72', '华池县', '3');
INSERT INTO `region` VALUES ('669', '72', '环县', '3');
INSERT INTO `region` VALUES ('670', '72', '宁县', '3');
INSERT INTO `region` VALUES ('671', '72', '庆城县', '3');
INSERT INTO `region` VALUES ('672', '72', '西峰区', '3');
INSERT INTO `region` VALUES ('673', '72', '镇原县', '3');
INSERT INTO `region` VALUES ('674', '72', '正宁县', '3');
INSERT INTO `region` VALUES ('675', '73', '甘谷县', '3');
INSERT INTO `region` VALUES ('676', '73', '秦安县', '3');
INSERT INTO `region` VALUES ('677', '73', '清水县', '3');
INSERT INTO `region` VALUES ('678', '73', '秦州区', '3');
INSERT INTO `region` VALUES ('679', '73', '麦积区', '3');
INSERT INTO `region` VALUES ('680', '73', '武山县', '3');
INSERT INTO `region` VALUES ('681', '73', '张家川', '3');
INSERT INTO `region` VALUES ('682', '74', '古浪县', '3');
INSERT INTO `region` VALUES ('683', '74', '民勤县', '3');
INSERT INTO `region` VALUES ('684', '74', '天祝', '3');
INSERT INTO `region` VALUES ('685', '74', '凉州区', '3');
INSERT INTO `region` VALUES ('686', '75', '高台县', '3');
INSERT INTO `region` VALUES ('687', '75', '临泽县', '3');
INSERT INTO `region` VALUES ('688', '75', '民乐县', '3');
INSERT INTO `region` VALUES ('689', '75', '山丹县', '3');
INSERT INTO `region` VALUES ('690', '75', '肃南', '3');
INSERT INTO `region` VALUES ('691', '75', '甘州区', '3');
INSERT INTO `region` VALUES ('692', '76', '从化市', '3');
INSERT INTO `region` VALUES ('693', '76', '天河区', '3');
INSERT INTO `region` VALUES ('694', '76', '东山区', '3');
INSERT INTO `region` VALUES ('695', '76', '白云区', '3');
INSERT INTO `region` VALUES ('696', '76', '海珠区', '3');
INSERT INTO `region` VALUES ('697', '76', '荔湾区', '3');
INSERT INTO `region` VALUES ('698', '76', '越秀区', '3');
INSERT INTO `region` VALUES ('699', '76', '黄埔区', '3');
INSERT INTO `region` VALUES ('700', '76', '番禺区', '3');
INSERT INTO `region` VALUES ('701', '76', '花都区', '3');
INSERT INTO `region` VALUES ('702', '76', '增城区', '3');
INSERT INTO `region` VALUES ('703', '76', '从化区', '3');
INSERT INTO `region` VALUES ('704', '76', '市郊', '3');
INSERT INTO `region` VALUES ('705', '77', '福田区', '3');
INSERT INTO `region` VALUES ('706', '77', '罗湖区', '3');
INSERT INTO `region` VALUES ('707', '77', '南山区', '3');
INSERT INTO `region` VALUES ('708', '77', '宝安区', '3');
INSERT INTO `region` VALUES ('709', '77', '龙岗区', '3');
INSERT INTO `region` VALUES ('710', '77', '盐田区', '3');
INSERT INTO `region` VALUES ('711', '78', '湘桥区', '3');
INSERT INTO `region` VALUES ('712', '78', '潮安县', '3');
INSERT INTO `region` VALUES ('713', '78', '饶平县', '3');
INSERT INTO `region` VALUES ('714', '79', '南城区', '3');
INSERT INTO `region` VALUES ('715', '79', '东城区', '3');
INSERT INTO `region` VALUES ('716', '79', '万江区', '3');
INSERT INTO `region` VALUES ('717', '79', '莞城区', '3');
INSERT INTO `region` VALUES ('718', '79', '石龙镇', '3');
INSERT INTO `region` VALUES ('719', '79', '虎门镇', '3');
INSERT INTO `region` VALUES ('720', '79', '麻涌镇', '3');
INSERT INTO `region` VALUES ('721', '79', '道滘镇', '3');
INSERT INTO `region` VALUES ('722', '79', '石碣镇', '3');
INSERT INTO `region` VALUES ('723', '79', '沙田镇', '3');
INSERT INTO `region` VALUES ('724', '79', '望牛墩镇', '3');
INSERT INTO `region` VALUES ('725', '79', '洪梅镇', '3');
INSERT INTO `region` VALUES ('726', '79', '茶山镇', '3');
INSERT INTO `region` VALUES ('727', '79', '寮步镇', '3');
INSERT INTO `region` VALUES ('728', '79', '大岭山镇', '3');
INSERT INTO `region` VALUES ('729', '79', '大朗镇', '3');
INSERT INTO `region` VALUES ('730', '79', '黄江镇', '3');
INSERT INTO `region` VALUES ('731', '79', '樟木头', '3');
INSERT INTO `region` VALUES ('732', '79', '凤岗镇', '3');
INSERT INTO `region` VALUES ('733', '79', '塘厦镇', '3');
INSERT INTO `region` VALUES ('734', '79', '谢岗镇', '3');
INSERT INTO `region` VALUES ('735', '79', '厚街镇', '3');
INSERT INTO `region` VALUES ('736', '79', '清溪镇', '3');
INSERT INTO `region` VALUES ('737', '79', '常平镇', '3');
INSERT INTO `region` VALUES ('738', '79', '桥头镇', '3');
INSERT INTO `region` VALUES ('739', '79', '横沥镇', '3');
INSERT INTO `region` VALUES ('740', '79', '东坑镇', '3');
INSERT INTO `region` VALUES ('741', '79', '企石镇', '3');
INSERT INTO `region` VALUES ('742', '79', '石排镇', '3');
INSERT INTO `region` VALUES ('743', '79', '长安镇', '3');
INSERT INTO `region` VALUES ('744', '79', '中堂镇', '3');
INSERT INTO `region` VALUES ('745', '79', '高埗镇', '3');
INSERT INTO `region` VALUES ('746', '80', '禅城区', '3');
INSERT INTO `region` VALUES ('747', '80', '南海区', '3');
INSERT INTO `region` VALUES ('748', '80', '顺德区', '3');
INSERT INTO `region` VALUES ('749', '80', '三水区', '3');
INSERT INTO `region` VALUES ('750', '80', '高明区', '3');
INSERT INTO `region` VALUES ('751', '81', '东源县', '3');
INSERT INTO `region` VALUES ('752', '81', '和平县', '3');
INSERT INTO `region` VALUES ('753', '81', '源城区', '3');
INSERT INTO `region` VALUES ('754', '81', '连平县', '3');
INSERT INTO `region` VALUES ('755', '81', '龙川县', '3');
INSERT INTO `region` VALUES ('756', '81', '紫金县', '3');
INSERT INTO `region` VALUES ('757', '82', '惠阳区', '3');
INSERT INTO `region` VALUES ('758', '82', '惠城区', '3');
INSERT INTO `region` VALUES ('759', '82', '大亚湾', '3');
INSERT INTO `region` VALUES ('760', '82', '博罗县', '3');
INSERT INTO `region` VALUES ('761', '82', '惠东县', '3');
INSERT INTO `region` VALUES ('762', '82', '龙门县', '3');
INSERT INTO `region` VALUES ('763', '83', '江海区', '3');
INSERT INTO `region` VALUES ('764', '83', '蓬江区', '3');
INSERT INTO `region` VALUES ('765', '83', '新会区', '3');
INSERT INTO `region` VALUES ('766', '83', '台山市', '3');
INSERT INTO `region` VALUES ('767', '83', '开平市', '3');
INSERT INTO `region` VALUES ('768', '83', '鹤山市', '3');
INSERT INTO `region` VALUES ('769', '83', '恩平市', '3');
INSERT INTO `region` VALUES ('770', '84', '榕城区', '3');
INSERT INTO `region` VALUES ('771', '84', '普宁市', '3');
INSERT INTO `region` VALUES ('772', '84', '揭东县', '3');
INSERT INTO `region` VALUES ('773', '84', '揭西县', '3');
INSERT INTO `region` VALUES ('774', '84', '惠来县', '3');
INSERT INTO `region` VALUES ('775', '85', '茂南区', '3');
INSERT INTO `region` VALUES ('776', '85', '茂港区', '3');
INSERT INTO `region` VALUES ('777', '85', '高州市', '3');
INSERT INTO `region` VALUES ('778', '85', '化州市', '3');
INSERT INTO `region` VALUES ('779', '85', '信宜市', '3');
INSERT INTO `region` VALUES ('780', '85', '电白县', '3');
INSERT INTO `region` VALUES ('781', '86', '梅县', '3');
INSERT INTO `region` VALUES ('782', '86', '梅江区', '3');
INSERT INTO `region` VALUES ('783', '86', '兴宁市', '3');
INSERT INTO `region` VALUES ('784', '86', '大埔县', '3');
INSERT INTO `region` VALUES ('785', '86', '丰顺县', '3');
INSERT INTO `region` VALUES ('786', '86', '五华县', '3');
INSERT INTO `region` VALUES ('787', '86', '平远县', '3');
INSERT INTO `region` VALUES ('788', '86', '蕉岭县', '3');
INSERT INTO `region` VALUES ('789', '87', '清城区', '3');
INSERT INTO `region` VALUES ('790', '87', '英德市', '3');
INSERT INTO `region` VALUES ('791', '87', '连州市', '3');
INSERT INTO `region` VALUES ('792', '87', '佛冈县', '3');
INSERT INTO `region` VALUES ('793', '87', '阳山县', '3');
INSERT INTO `region` VALUES ('794', '87', '清新县', '3');
INSERT INTO `region` VALUES ('795', '87', '连山', '3');
INSERT INTO `region` VALUES ('796', '87', '连南', '3');
INSERT INTO `region` VALUES ('797', '88', '南澳县', '3');
INSERT INTO `region` VALUES ('798', '88', '潮阳区', '3');
INSERT INTO `region` VALUES ('799', '88', '澄海区', '3');
INSERT INTO `region` VALUES ('800', '88', '龙湖区', '3');
INSERT INTO `region` VALUES ('801', '88', '金平区', '3');
INSERT INTO `region` VALUES ('802', '88', '濠江区', '3');
INSERT INTO `region` VALUES ('803', '88', '潮南区', '3');
INSERT INTO `region` VALUES ('804', '89', '城区', '3');
INSERT INTO `region` VALUES ('805', '89', '陆丰市', '3');
INSERT INTO `region` VALUES ('806', '89', '海丰县', '3');
INSERT INTO `region` VALUES ('807', '89', '陆河县', '3');
INSERT INTO `region` VALUES ('808', '90', '曲江县', '3');
INSERT INTO `region` VALUES ('809', '90', '浈江区', '3');
INSERT INTO `region` VALUES ('810', '90', '武江区', '3');
INSERT INTO `region` VALUES ('811', '90', '曲江区', '3');
INSERT INTO `region` VALUES ('812', '90', '乐昌市', '3');
INSERT INTO `region` VALUES ('813', '90', '南雄市', '3');
INSERT INTO `region` VALUES ('814', '90', '始兴县', '3');
INSERT INTO `region` VALUES ('815', '90', '仁化县', '3');
INSERT INTO `region` VALUES ('816', '90', '翁源县', '3');
INSERT INTO `region` VALUES ('817', '90', '新丰县', '3');
INSERT INTO `region` VALUES ('818', '90', '乳源', '3');
INSERT INTO `region` VALUES ('819', '91', '江城区', '3');
INSERT INTO `region` VALUES ('820', '91', '阳春市', '3');
INSERT INTO `region` VALUES ('821', '91', '阳西县', '3');
INSERT INTO `region` VALUES ('822', '91', '阳东县', '3');
INSERT INTO `region` VALUES ('823', '92', '云城区', '3');
INSERT INTO `region` VALUES ('824', '92', '罗定市', '3');
INSERT INTO `region` VALUES ('825', '92', '新兴县', '3');
INSERT INTO `region` VALUES ('826', '92', '郁南县', '3');
INSERT INTO `region` VALUES ('827', '92', '云安县', '3');
INSERT INTO `region` VALUES ('828', '93', '赤坎区', '3');
INSERT INTO `region` VALUES ('829', '93', '霞山区', '3');
INSERT INTO `region` VALUES ('830', '93', '坡头区', '3');
INSERT INTO `region` VALUES ('831', '93', '麻章区', '3');
INSERT INTO `region` VALUES ('832', '93', '廉江市', '3');
INSERT INTO `region` VALUES ('833', '93', '雷州市', '3');
INSERT INTO `region` VALUES ('834', '93', '吴川市', '3');
INSERT INTO `region` VALUES ('835', '93', '遂溪县', '3');
INSERT INTO `region` VALUES ('836', '93', '徐闻县', '3');
INSERT INTO `region` VALUES ('837', '94', '肇庆市', '3');
INSERT INTO `region` VALUES ('838', '94', '高要市', '3');
INSERT INTO `region` VALUES ('839', '94', '四会市', '3');
INSERT INTO `region` VALUES ('840', '94', '广宁县', '3');
INSERT INTO `region` VALUES ('841', '94', '怀集县', '3');
INSERT INTO `region` VALUES ('842', '94', '封开县', '3');
INSERT INTO `region` VALUES ('843', '94', '德庆县', '3');
INSERT INTO `region` VALUES ('844', '95', '石岐街道', '3');
INSERT INTO `region` VALUES ('845', '95', '东区街道', '3');
INSERT INTO `region` VALUES ('846', '95', '西区街道', '3');
INSERT INTO `region` VALUES ('847', '95', '环城街道', '3');
INSERT INTO `region` VALUES ('848', '95', '中山港街道', '3');
INSERT INTO `region` VALUES ('849', '95', '五桂山街道', '3');
INSERT INTO `region` VALUES ('850', '96', '香洲区', '3');
INSERT INTO `region` VALUES ('851', '96', '斗门区', '3');
INSERT INTO `region` VALUES ('852', '96', '金湾区', '3');
INSERT INTO `region` VALUES ('853', '97', '邕宁区', '3');
INSERT INTO `region` VALUES ('854', '97', '青秀区', '3');
INSERT INTO `region` VALUES ('855', '97', '兴宁区', '3');
INSERT INTO `region` VALUES ('856', '97', '良庆区', '3');
INSERT INTO `region` VALUES ('857', '97', '西乡塘区', '3');
INSERT INTO `region` VALUES ('858', '97', '江南区', '3');
INSERT INTO `region` VALUES ('859', '97', '武鸣县', '3');
INSERT INTO `region` VALUES ('860', '97', '隆安县', '3');
INSERT INTO `region` VALUES ('861', '97', '马山县', '3');
INSERT INTO `region` VALUES ('862', '97', '上林县', '3');
INSERT INTO `region` VALUES ('863', '97', '宾阳县', '3');
INSERT INTO `region` VALUES ('864', '97', '横县', '3');
INSERT INTO `region` VALUES ('865', '98', '秀峰区', '3');
INSERT INTO `region` VALUES ('866', '98', '叠彩区', '3');
INSERT INTO `region` VALUES ('867', '98', '象山区', '3');
INSERT INTO `region` VALUES ('868', '98', '七星区', '3');
INSERT INTO `region` VALUES ('869', '98', '雁山区', '3');
INSERT INTO `region` VALUES ('870', '98', '阳朔县', '3');
INSERT INTO `region` VALUES ('871', '98', '临桂县', '3');
INSERT INTO `region` VALUES ('872', '98', '灵川县', '3');
INSERT INTO `region` VALUES ('873', '98', '全州县', '3');
INSERT INTO `region` VALUES ('874', '98', '平乐县', '3');
INSERT INTO `region` VALUES ('875', '98', '兴安县', '3');
INSERT INTO `region` VALUES ('876', '98', '灌阳县', '3');
INSERT INTO `region` VALUES ('877', '98', '荔浦县', '3');
INSERT INTO `region` VALUES ('878', '98', '资源县', '3');
INSERT INTO `region` VALUES ('879', '98', '永福县', '3');
INSERT INTO `region` VALUES ('880', '98', '龙胜', '3');
INSERT INTO `region` VALUES ('881', '98', '恭城', '3');
INSERT INTO `region` VALUES ('882', '99', '右江区', '3');
INSERT INTO `region` VALUES ('883', '99', '凌云县', '3');
INSERT INTO `region` VALUES ('884', '99', '平果县', '3');
INSERT INTO `region` VALUES ('885', '99', '西林县', '3');
INSERT INTO `region` VALUES ('886', '99', '乐业县', '3');
INSERT INTO `region` VALUES ('887', '99', '德保县', '3');
INSERT INTO `region` VALUES ('888', '99', '田林县', '3');
INSERT INTO `region` VALUES ('889', '99', '田阳县', '3');
INSERT INTO `region` VALUES ('890', '99', '靖西县', '3');
INSERT INTO `region` VALUES ('891', '99', '田东县', '3');
INSERT INTO `region` VALUES ('892', '99', '那坡县', '3');
INSERT INTO `region` VALUES ('893', '99', '隆林', '3');
INSERT INTO `region` VALUES ('894', '100', '海城区', '3');
INSERT INTO `region` VALUES ('895', '100', '银海区', '3');
INSERT INTO `region` VALUES ('896', '100', '铁山港区', '3');
INSERT INTO `region` VALUES ('897', '100', '合浦县', '3');
INSERT INTO `region` VALUES ('898', '101', '江州区', '3');
INSERT INTO `region` VALUES ('899', '101', '凭祥市', '3');
INSERT INTO `region` VALUES ('900', '101', '宁明县', '3');
INSERT INTO `region` VALUES ('901', '101', '扶绥县', '3');
INSERT INTO `region` VALUES ('902', '101', '龙州县', '3');
INSERT INTO `region` VALUES ('903', '101', '大新县', '3');
INSERT INTO `region` VALUES ('904', '101', '天等县', '3');
INSERT INTO `region` VALUES ('905', '102', '港口区', '3');
INSERT INTO `region` VALUES ('906', '102', '防城区', '3');
INSERT INTO `region` VALUES ('907', '102', '东兴市', '3');
INSERT INTO `region` VALUES ('908', '102', '上思县', '3');
INSERT INTO `region` VALUES ('909', '103', '港北区', '3');
INSERT INTO `region` VALUES ('910', '103', '港南区', '3');
INSERT INTO `region` VALUES ('911', '103', '覃塘区', '3');
INSERT INTO `region` VALUES ('912', '103', '桂平市', '3');
INSERT INTO `region` VALUES ('913', '103', '平南县', '3');
INSERT INTO `region` VALUES ('914', '104', '金城江区', '3');
INSERT INTO `region` VALUES ('915', '104', '宜州市', '3');
INSERT INTO `region` VALUES ('916', '104', '天峨县', '3');
INSERT INTO `region` VALUES ('917', '104', '凤山县', '3');
INSERT INTO `region` VALUES ('918', '104', '南丹县', '3');
INSERT INTO `region` VALUES ('919', '104', '东兰县', '3');
INSERT INTO `region` VALUES ('920', '104', '都安', '3');
INSERT INTO `region` VALUES ('921', '104', '罗城', '3');
INSERT INTO `region` VALUES ('922', '104', '巴马', '3');
INSERT INTO `region` VALUES ('923', '104', '环江', '3');
INSERT INTO `region` VALUES ('924', '104', '大化', '3');
INSERT INTO `region` VALUES ('925', '105', '八步区', '3');
INSERT INTO `region` VALUES ('926', '105', '钟山县', '3');
INSERT INTO `region` VALUES ('927', '105', '昭平县', '3');
INSERT INTO `region` VALUES ('928', '105', '富川', '3');
INSERT INTO `region` VALUES ('929', '106', '兴宾区', '3');
INSERT INTO `region` VALUES ('930', '106', '合山市', '3');
INSERT INTO `region` VALUES ('931', '106', '象州县', '3');
INSERT INTO `region` VALUES ('932', '106', '武宣县', '3');
INSERT INTO `region` VALUES ('933', '106', '忻城县', '3');
INSERT INTO `region` VALUES ('934', '106', '金秀', '3');
INSERT INTO `region` VALUES ('935', '107', '城中区', '3');
INSERT INTO `region` VALUES ('936', '107', '鱼峰区', '3');
INSERT INTO `region` VALUES ('937', '107', '柳北区', '3');
INSERT INTO `region` VALUES ('938', '107', '柳南区', '3');
INSERT INTO `region` VALUES ('939', '107', '柳江县', '3');
INSERT INTO `region` VALUES ('940', '107', '柳城县', '3');
INSERT INTO `region` VALUES ('941', '107', '鹿寨县', '3');
INSERT INTO `region` VALUES ('942', '107', '融安县', '3');
INSERT INTO `region` VALUES ('943', '107', '融水', '3');
INSERT INTO `region` VALUES ('944', '107', '三江', '3');
INSERT INTO `region` VALUES ('945', '108', '钦南区', '3');
INSERT INTO `region` VALUES ('946', '108', '钦北区', '3');
INSERT INTO `region` VALUES ('947', '108', '灵山县', '3');
INSERT INTO `region` VALUES ('948', '108', '浦北县', '3');
INSERT INTO `region` VALUES ('949', '109', '万秀区', '3');
INSERT INTO `region` VALUES ('950', '109', '蝶山区', '3');
INSERT INTO `region` VALUES ('951', '109', '长洲区', '3');
INSERT INTO `region` VALUES ('952', '109', '岑溪市', '3');
INSERT INTO `region` VALUES ('953', '109', '苍梧县', '3');
INSERT INTO `region` VALUES ('954', '109', '藤县', '3');
INSERT INTO `region` VALUES ('955', '109', '蒙山县', '3');
INSERT INTO `region` VALUES ('956', '110', '玉州区', '3');
INSERT INTO `region` VALUES ('957', '110', '北流市', '3');
INSERT INTO `region` VALUES ('958', '110', '容县', '3');
INSERT INTO `region` VALUES ('959', '110', '陆川县', '3');
INSERT INTO `region` VALUES ('960', '110', '博白县', '3');
INSERT INTO `region` VALUES ('961', '110', '兴业县', '3');
INSERT INTO `region` VALUES ('962', '111', '南明区', '3');
INSERT INTO `region` VALUES ('963', '111', '云岩区', '3');
INSERT INTO `region` VALUES ('964', '111', '花溪区', '3');
INSERT INTO `region` VALUES ('965', '111', '乌当区', '3');
INSERT INTO `region` VALUES ('966', '111', '白云区', '3');
INSERT INTO `region` VALUES ('967', '111', '小河区', '3');
INSERT INTO `region` VALUES ('968', '111', '金阳新区', '3');
INSERT INTO `region` VALUES ('969', '111', '新天园区', '3');
INSERT INTO `region` VALUES ('970', '111', '清镇市', '3');
INSERT INTO `region` VALUES ('971', '111', '开阳县', '3');
INSERT INTO `region` VALUES ('972', '111', '修文县', '3');
INSERT INTO `region` VALUES ('973', '111', '息烽县', '3');
INSERT INTO `region` VALUES ('974', '112', '西秀区', '3');
INSERT INTO `region` VALUES ('975', '112', '关岭', '3');
INSERT INTO `region` VALUES ('976', '112', '镇宁', '3');
INSERT INTO `region` VALUES ('977', '112', '紫云', '3');
INSERT INTO `region` VALUES ('978', '112', '平坝县', '3');
INSERT INTO `region` VALUES ('979', '112', '普定县', '3');
INSERT INTO `region` VALUES ('980', '113', '毕节市', '3');
INSERT INTO `region` VALUES ('981', '113', '大方县', '3');
INSERT INTO `region` VALUES ('982', '113', '黔西县', '3');
INSERT INTO `region` VALUES ('983', '113', '金沙县', '3');
INSERT INTO `region` VALUES ('984', '113', '织金县', '3');
INSERT INTO `region` VALUES ('985', '113', '纳雍县', '3');
INSERT INTO `region` VALUES ('986', '113', '赫章县', '3');
INSERT INTO `region` VALUES ('987', '113', '威宁', '3');
INSERT INTO `region` VALUES ('988', '114', '钟山区', '3');
INSERT INTO `region` VALUES ('989', '114', '六枝特区', '3');
INSERT INTO `region` VALUES ('990', '114', '水城县', '3');
INSERT INTO `region` VALUES ('991', '114', '盘县', '3');
INSERT INTO `region` VALUES ('992', '115', '凯里市', '3');
INSERT INTO `region` VALUES ('993', '115', '黄平县', '3');
INSERT INTO `region` VALUES ('994', '115', '施秉县', '3');
INSERT INTO `region` VALUES ('995', '115', '三穗县', '3');
INSERT INTO `region` VALUES ('996', '115', '镇远县', '3');
INSERT INTO `region` VALUES ('997', '115', '岑巩县', '3');
INSERT INTO `region` VALUES ('998', '115', '天柱县', '3');
INSERT INTO `region` VALUES ('999', '115', '锦屏县', '3');
INSERT INTO `region` VALUES ('1000', '115', '剑河县', '3');
INSERT INTO `region` VALUES ('1001', '115', '台江县', '3');
INSERT INTO `region` VALUES ('1002', '115', '黎平县', '3');
INSERT INTO `region` VALUES ('1003', '115', '榕江县', '3');
INSERT INTO `region` VALUES ('1004', '115', '从江县', '3');
INSERT INTO `region` VALUES ('1005', '115', '雷山县', '3');
INSERT INTO `region` VALUES ('1006', '115', '麻江县', '3');
INSERT INTO `region` VALUES ('1007', '115', '丹寨县', '3');
INSERT INTO `region` VALUES ('1008', '116', '都匀市', '3');
INSERT INTO `region` VALUES ('1009', '116', '福泉市', '3');
INSERT INTO `region` VALUES ('1010', '116', '荔波县', '3');
INSERT INTO `region` VALUES ('1011', '116', '贵定县', '3');
INSERT INTO `region` VALUES ('1012', '116', '瓮安县', '3');
INSERT INTO `region` VALUES ('1013', '116', '独山县', '3');
INSERT INTO `region` VALUES ('1014', '116', '平塘县', '3');
INSERT INTO `region` VALUES ('1015', '116', '罗甸县', '3');
INSERT INTO `region` VALUES ('1016', '116', '长顺县', '3');
INSERT INTO `region` VALUES ('1017', '116', '龙里县', '3');
INSERT INTO `region` VALUES ('1018', '116', '惠水县', '3');
INSERT INTO `region` VALUES ('1019', '116', '三都', '3');
INSERT INTO `region` VALUES ('1020', '117', '兴义市', '3');
INSERT INTO `region` VALUES ('1021', '117', '兴仁县', '3');
INSERT INTO `region` VALUES ('1022', '117', '普安县', '3');
INSERT INTO `region` VALUES ('1023', '117', '晴隆县', '3');
INSERT INTO `region` VALUES ('1024', '117', '贞丰县', '3');
INSERT INTO `region` VALUES ('1025', '117', '望谟县', '3');
INSERT INTO `region` VALUES ('1026', '117', '册亨县', '3');
INSERT INTO `region` VALUES ('1027', '117', '安龙县', '3');
INSERT INTO `region` VALUES ('1028', '118', '铜仁市', '3');
INSERT INTO `region` VALUES ('1029', '118', '江口县', '3');
INSERT INTO `region` VALUES ('1030', '118', '石阡县', '3');
INSERT INTO `region` VALUES ('1031', '118', '思南县', '3');
INSERT INTO `region` VALUES ('1032', '118', '德江县', '3');
INSERT INTO `region` VALUES ('1033', '118', '玉屏', '3');
INSERT INTO `region` VALUES ('1034', '118', '印江', '3');
INSERT INTO `region` VALUES ('1035', '118', '沿河', '3');
INSERT INTO `region` VALUES ('1036', '118', '松桃', '3');
INSERT INTO `region` VALUES ('1037', '118', '万山特区', '3');
INSERT INTO `region` VALUES ('1038', '119', '红花岗区', '3');
INSERT INTO `region` VALUES ('1039', '119', '务川县', '3');
INSERT INTO `region` VALUES ('1040', '119', '道真县', '3');
INSERT INTO `region` VALUES ('1041', '119', '汇川区', '3');
INSERT INTO `region` VALUES ('1042', '119', '赤水市', '3');
INSERT INTO `region` VALUES ('1043', '119', '仁怀市', '3');
INSERT INTO `region` VALUES ('1044', '119', '遵义县', '3');
INSERT INTO `region` VALUES ('1045', '119', '桐梓县', '3');
INSERT INTO `region` VALUES ('1046', '119', '绥阳县', '3');
INSERT INTO `region` VALUES ('1047', '119', '正安县', '3');
INSERT INTO `region` VALUES ('1048', '119', '凤冈县', '3');
INSERT INTO `region` VALUES ('1049', '119', '湄潭县', '3');
INSERT INTO `region` VALUES ('1050', '119', '余庆县', '3');
INSERT INTO `region` VALUES ('1051', '119', '习水县', '3');
INSERT INTO `region` VALUES ('1052', '119', '道真', '3');
INSERT INTO `region` VALUES ('1053', '119', '务川', '3');
INSERT INTO `region` VALUES ('1054', '120', '秀英区', '3');
INSERT INTO `region` VALUES ('1055', '120', '龙华区', '3');
INSERT INTO `region` VALUES ('1056', '120', '琼山区', '3');
INSERT INTO `region` VALUES ('1057', '120', '美兰区', '3');
INSERT INTO `region` VALUES ('1058', '137', '市区', '3');
INSERT INTO `region` VALUES ('1059', '137', '洋浦开发区', '3');
INSERT INTO `region` VALUES ('1060', '137', '那大镇', '3');
INSERT INTO `region` VALUES ('1061', '137', '王五镇', '3');
INSERT INTO `region` VALUES ('1062', '137', '雅星镇', '3');
INSERT INTO `region` VALUES ('1063', '137', '大成镇', '3');
INSERT INTO `region` VALUES ('1064', '137', '中和镇', '3');
INSERT INTO `region` VALUES ('1065', '137', '峨蔓镇', '3');
INSERT INTO `region` VALUES ('1066', '137', '南丰镇', '3');
INSERT INTO `region` VALUES ('1067', '137', '白马井镇', '3');
INSERT INTO `region` VALUES ('1068', '137', '兰洋镇', '3');
INSERT INTO `region` VALUES ('1069', '137', '和庆镇', '3');
INSERT INTO `region` VALUES ('1070', '137', '海头镇', '3');
INSERT INTO `region` VALUES ('1071', '137', '排浦镇', '3');
INSERT INTO `region` VALUES ('1072', '137', '东成镇', '3');
INSERT INTO `region` VALUES ('1073', '137', '光村镇', '3');
INSERT INTO `region` VALUES ('1074', '137', '木棠镇', '3');
INSERT INTO `region` VALUES ('1075', '137', '新州镇', '3');
INSERT INTO `region` VALUES ('1076', '137', '三都镇', '3');
INSERT INTO `region` VALUES ('1077', '137', '其他', '3');
INSERT INTO `region` VALUES ('1078', '138', '长安区', '3');
INSERT INTO `region` VALUES ('1079', '138', '桥东区', '3');
INSERT INTO `region` VALUES ('1080', '138', '桥西区', '3');
INSERT INTO `region` VALUES ('1081', '138', '新华区', '3');
INSERT INTO `region` VALUES ('1082', '138', '裕华区', '3');
INSERT INTO `region` VALUES ('1083', '138', '井陉矿区', '3');
INSERT INTO `region` VALUES ('1084', '138', '高新区', '3');
INSERT INTO `region` VALUES ('1085', '138', '辛集市', '3');
INSERT INTO `region` VALUES ('1086', '138', '藁城市', '3');
INSERT INTO `region` VALUES ('1087', '138', '晋州市', '3');
INSERT INTO `region` VALUES ('1088', '138', '新乐市', '3');
INSERT INTO `region` VALUES ('1089', '138', '鹿泉市', '3');
INSERT INTO `region` VALUES ('1090', '138', '井陉县', '3');
INSERT INTO `region` VALUES ('1091', '138', '正定县', '3');
INSERT INTO `region` VALUES ('1092', '138', '栾城县', '3');
INSERT INTO `region` VALUES ('1093', '138', '行唐县', '3');
INSERT INTO `region` VALUES ('1094', '138', '灵寿县', '3');
INSERT INTO `region` VALUES ('1095', '138', '高邑县', '3');
INSERT INTO `region` VALUES ('1096', '138', '深泽县', '3');
INSERT INTO `region` VALUES ('1097', '138', '赞皇县', '3');
INSERT INTO `region` VALUES ('1098', '138', '无极县', '3');
INSERT INTO `region` VALUES ('1099', '138', '平山县', '3');
INSERT INTO `region` VALUES ('1100', '138', '元氏县', '3');
INSERT INTO `region` VALUES ('1101', '138', '赵县', '3');
INSERT INTO `region` VALUES ('1102', '139', '新市区', '3');
INSERT INTO `region` VALUES ('1103', '139', '南市区', '3');
INSERT INTO `region` VALUES ('1104', '139', '北市区', '3');
INSERT INTO `region` VALUES ('1105', '139', '涿州市', '3');
INSERT INTO `region` VALUES ('1106', '139', '定州市', '3');
INSERT INTO `region` VALUES ('1107', '139', '安国市', '3');
INSERT INTO `region` VALUES ('1108', '139', '高碑店市', '3');
INSERT INTO `region` VALUES ('1109', '139', '满城县', '3');
INSERT INTO `region` VALUES ('1110', '139', '清苑县', '3');
INSERT INTO `region` VALUES ('1111', '139', '涞水县', '3');
INSERT INTO `region` VALUES ('1112', '139', '阜平县', '3');
INSERT INTO `region` VALUES ('1113', '139', '徐水县', '3');
INSERT INTO `region` VALUES ('1114', '139', '定兴县', '3');
INSERT INTO `region` VALUES ('1115', '139', '唐县', '3');
INSERT INTO `region` VALUES ('1116', '139', '高阳县', '3');
INSERT INTO `region` VALUES ('1117', '139', '容城县', '3');
INSERT INTO `region` VALUES ('1118', '139', '涞源县', '3');
INSERT INTO `region` VALUES ('1119', '139', '望都县', '3');
INSERT INTO `region` VALUES ('1120', '139', '安新县', '3');
INSERT INTO `region` VALUES ('1121', '139', '易县', '3');
INSERT INTO `region` VALUES ('1122', '139', '曲阳县', '3');
INSERT INTO `region` VALUES ('1123', '139', '蠡县', '3');
INSERT INTO `region` VALUES ('1124', '139', '顺平县', '3');
INSERT INTO `region` VALUES ('1125', '139', '博野县', '3');
INSERT INTO `region` VALUES ('1126', '139', '雄县', '3');
INSERT INTO `region` VALUES ('1127', '140', '运河区', '3');
INSERT INTO `region` VALUES ('1128', '140', '新华区', '3');
INSERT INTO `region` VALUES ('1129', '140', '泊头市', '3');
INSERT INTO `region` VALUES ('1130', '140', '任丘市', '3');
INSERT INTO `region` VALUES ('1131', '140', '黄骅市', '3');
INSERT INTO `region` VALUES ('1132', '140', '河间市', '3');
INSERT INTO `region` VALUES ('1133', '140', '沧县', '3');
INSERT INTO `region` VALUES ('1134', '140', '青县', '3');
INSERT INTO `region` VALUES ('1135', '140', '东光县', '3');
INSERT INTO `region` VALUES ('1136', '140', '海兴县', '3');
INSERT INTO `region` VALUES ('1137', '140', '盐山县', '3');
INSERT INTO `region` VALUES ('1138', '140', '肃宁县', '3');
INSERT INTO `region` VALUES ('1139', '140', '南皮县', '3');
INSERT INTO `region` VALUES ('1140', '140', '吴桥县', '3');
INSERT INTO `region` VALUES ('1141', '140', '献县', '3');
INSERT INTO `region` VALUES ('1142', '140', '孟村', '3');
INSERT INTO `region` VALUES ('1143', '141', '双桥区', '3');
INSERT INTO `region` VALUES ('1144', '141', '双滦区', '3');
INSERT INTO `region` VALUES ('1145', '141', '鹰手营子矿区', '3');
INSERT INTO `region` VALUES ('1146', '141', '承德县', '3');
INSERT INTO `region` VALUES ('1147', '141', '兴隆县', '3');
INSERT INTO `region` VALUES ('1148', '141', '平泉县', '3');
INSERT INTO `region` VALUES ('1149', '141', '滦平县', '3');
INSERT INTO `region` VALUES ('1150', '141', '隆化县', '3');
INSERT INTO `region` VALUES ('1151', '141', '丰宁', '3');
INSERT INTO `region` VALUES ('1152', '141', '宽城', '3');
INSERT INTO `region` VALUES ('1153', '141', '围场', '3');
INSERT INTO `region` VALUES ('1154', '142', '从台区', '3');
INSERT INTO `region` VALUES ('1155', '142', '复兴区', '3');
INSERT INTO `region` VALUES ('1156', '142', '邯山区', '3');
INSERT INTO `region` VALUES ('1157', '142', '峰峰矿区', '3');
INSERT INTO `region` VALUES ('1158', '142', '武安市', '3');
INSERT INTO `region` VALUES ('1159', '142', '邯郸县', '3');
INSERT INTO `region` VALUES ('1160', '142', '临漳县', '3');
INSERT INTO `region` VALUES ('1161', '142', '成安县', '3');
INSERT INTO `region` VALUES ('1162', '142', '大名县', '3');
INSERT INTO `region` VALUES ('1163', '142', '涉县', '3');
INSERT INTO `region` VALUES ('1164', '142', '磁县', '3');
INSERT INTO `region` VALUES ('1165', '142', '肥乡县', '3');
INSERT INTO `region` VALUES ('1166', '142', '永年县', '3');
INSERT INTO `region` VALUES ('1167', '142', '邱县', '3');
INSERT INTO `region` VALUES ('1168', '142', '鸡泽县', '3');
INSERT INTO `region` VALUES ('1169', '142', '广平县', '3');
INSERT INTO `region` VALUES ('1170', '142', '馆陶县', '3');
INSERT INTO `region` VALUES ('1171', '142', '魏县', '3');
INSERT INTO `region` VALUES ('1172', '142', '曲周县', '3');
INSERT INTO `region` VALUES ('1173', '143', '桃城区', '3');
INSERT INTO `region` VALUES ('1174', '143', '冀州市', '3');
INSERT INTO `region` VALUES ('1175', '143', '深州市', '3');
INSERT INTO `region` VALUES ('1176', '143', '枣强县', '3');
INSERT INTO `region` VALUES ('1177', '143', '武邑县', '3');
INSERT INTO `region` VALUES ('1178', '143', '武强县', '3');
INSERT INTO `region` VALUES ('1179', '143', '饶阳县', '3');
INSERT INTO `region` VALUES ('1180', '143', '安平县', '3');
INSERT INTO `region` VALUES ('1181', '143', '故城县', '3');
INSERT INTO `region` VALUES ('1182', '143', '景县', '3');
INSERT INTO `region` VALUES ('1183', '143', '阜城县', '3');
INSERT INTO `region` VALUES ('1184', '144', '安次区', '3');
INSERT INTO `region` VALUES ('1185', '144', '广阳区', '3');
INSERT INTO `region` VALUES ('1186', '144', '霸州市', '3');
INSERT INTO `region` VALUES ('1187', '144', '三河市', '3');
INSERT INTO `region` VALUES ('1188', '144', '固安县', '3');
INSERT INTO `region` VALUES ('1189', '144', '永清县', '3');
INSERT INTO `region` VALUES ('1190', '144', '香河县', '3');
INSERT INTO `region` VALUES ('1191', '144', '大城县', '3');
INSERT INTO `region` VALUES ('1192', '144', '文安县', '3');
INSERT INTO `region` VALUES ('1193', '144', '大厂', '3');
INSERT INTO `region` VALUES ('1194', '145', '海港区', '3');
INSERT INTO `region` VALUES ('1195', '145', '山海关区', '3');
INSERT INTO `region` VALUES ('1196', '145', '北戴河区', '3');
INSERT INTO `region` VALUES ('1197', '145', '昌黎县', '3');
INSERT INTO `region` VALUES ('1198', '145', '抚宁县', '3');
INSERT INTO `region` VALUES ('1199', '145', '卢龙县', '3');
INSERT INTO `region` VALUES ('1200', '145', '青龙', '3');
INSERT INTO `region` VALUES ('1201', '146', '路北区', '3');
INSERT INTO `region` VALUES ('1202', '146', '路南区', '3');
INSERT INTO `region` VALUES ('1203', '146', '古冶区', '3');
INSERT INTO `region` VALUES ('1204', '146', '开平区', '3');
INSERT INTO `region` VALUES ('1205', '146', '丰南区', '3');
INSERT INTO `region` VALUES ('1206', '146', '丰润区', '3');
INSERT INTO `region` VALUES ('1207', '146', '遵化市', '3');
INSERT INTO `region` VALUES ('1208', '146', '迁安市', '3');
INSERT INTO `region` VALUES ('1209', '146', '滦县', '3');
INSERT INTO `region` VALUES ('1210', '146', '滦南县', '3');
INSERT INTO `region` VALUES ('1211', '146', '乐亭县', '3');
INSERT INTO `region` VALUES ('1212', '146', '迁西县', '3');
INSERT INTO `region` VALUES ('1213', '146', '玉田县', '3');
INSERT INTO `region` VALUES ('1214', '146', '唐海县', '3');
INSERT INTO `region` VALUES ('1215', '147', '桥东区', '3');
INSERT INTO `region` VALUES ('1216', '147', '桥西区', '3');
INSERT INTO `region` VALUES ('1217', '147', '南宫市', '3');
INSERT INTO `region` VALUES ('1218', '147', '沙河市', '3');
INSERT INTO `region` VALUES ('1219', '147', '邢台县', '3');
INSERT INTO `region` VALUES ('1220', '147', '临城县', '3');
INSERT INTO `region` VALUES ('1221', '147', '内丘县', '3');
INSERT INTO `region` VALUES ('1222', '147', '柏乡县', '3');
INSERT INTO `region` VALUES ('1223', '147', '隆尧县', '3');
INSERT INTO `region` VALUES ('1224', '147', '任县', '3');
INSERT INTO `region` VALUES ('1225', '147', '南和县', '3');
INSERT INTO `region` VALUES ('1226', '147', '宁晋县', '3');
INSERT INTO `region` VALUES ('1227', '147', '巨鹿县', '3');
INSERT INTO `region` VALUES ('1228', '147', '新河县', '3');
INSERT INTO `region` VALUES ('1229', '147', '广宗县', '3');
INSERT INTO `region` VALUES ('1230', '147', '平乡县', '3');
INSERT INTO `region` VALUES ('1231', '147', '威县', '3');
INSERT INTO `region` VALUES ('1232', '147', '清河县', '3');
INSERT INTO `region` VALUES ('1233', '147', '临西县', '3');
INSERT INTO `region` VALUES ('1234', '148', '桥西区', '3');
INSERT INTO `region` VALUES ('1235', '148', '桥东区', '3');
INSERT INTO `region` VALUES ('1236', '148', '宣化区', '3');
INSERT INTO `region` VALUES ('1237', '148', '下花园区', '3');
INSERT INTO `region` VALUES ('1238', '148', '宣化县', '3');
INSERT INTO `region` VALUES ('1239', '148', '张北县', '3');
INSERT INTO `region` VALUES ('1240', '148', '康保县', '3');
INSERT INTO `region` VALUES ('1241', '148', '沽源县', '3');
INSERT INTO `region` VALUES ('1242', '148', '尚义县', '3');
INSERT INTO `region` VALUES ('1243', '148', '蔚县', '3');
INSERT INTO `region` VALUES ('1244', '148', '阳原县', '3');
INSERT INTO `region` VALUES ('1245', '148', '怀安县', '3');
INSERT INTO `region` VALUES ('1246', '148', '万全县', '3');
INSERT INTO `region` VALUES ('1247', '148', '怀来县', '3');
INSERT INTO `region` VALUES ('1248', '148', '涿鹿县', '3');
INSERT INTO `region` VALUES ('1249', '148', '赤城县', '3');
INSERT INTO `region` VALUES ('1250', '148', '崇礼县', '3');
INSERT INTO `region` VALUES ('1251', '149', '金水区', '3');
INSERT INTO `region` VALUES ('1252', '149', '邙山区', '3');
INSERT INTO `region` VALUES ('1253', '149', '二七区', '3');
INSERT INTO `region` VALUES ('1254', '149', '管城区', '3');
INSERT INTO `region` VALUES ('1255', '149', '中原区', '3');
INSERT INTO `region` VALUES ('1256', '149', '上街区', '3');
INSERT INTO `region` VALUES ('1257', '149', '惠济区', '3');
INSERT INTO `region` VALUES ('1258', '149', '郑东新区', '3');
INSERT INTO `region` VALUES ('1259', '149', '经济技术开发区', '3');
INSERT INTO `region` VALUES ('1260', '149', '高新开发区', '3');
INSERT INTO `region` VALUES ('1261', '149', '出口加工区', '3');
INSERT INTO `region` VALUES ('1262', '149', '巩义市', '3');
INSERT INTO `region` VALUES ('1263', '149', '荥阳市', '3');
INSERT INTO `region` VALUES ('1264', '149', '新密市', '3');
INSERT INTO `region` VALUES ('1265', '149', '新郑市', '3');
INSERT INTO `region` VALUES ('1266', '149', '登封市', '3');
INSERT INTO `region` VALUES ('1267', '149', '中牟县', '3');
INSERT INTO `region` VALUES ('1268', '150', '西工区', '3');
INSERT INTO `region` VALUES ('1269', '150', '老城区', '3');
INSERT INTO `region` VALUES ('1270', '150', '涧西区', '3');
INSERT INTO `region` VALUES ('1271', '150', '瀍河回族区', '3');
INSERT INTO `region` VALUES ('1272', '150', '洛龙区', '3');
INSERT INTO `region` VALUES ('1273', '150', '吉利区', '3');
INSERT INTO `region` VALUES ('1274', '150', '偃师市', '3');
INSERT INTO `region` VALUES ('1275', '150', '孟津县', '3');
INSERT INTO `region` VALUES ('1276', '150', '新安县', '3');
INSERT INTO `region` VALUES ('1277', '150', '栾川县', '3');
INSERT INTO `region` VALUES ('1278', '150', '嵩县', '3');
INSERT INTO `region` VALUES ('1279', '150', '汝阳县', '3');
INSERT INTO `region` VALUES ('1280', '150', '宜阳县', '3');
INSERT INTO `region` VALUES ('1281', '150', '洛宁县', '3');
INSERT INTO `region` VALUES ('1282', '150', '伊川县', '3');
INSERT INTO `region` VALUES ('1283', '151', '鼓楼区', '3');
INSERT INTO `region` VALUES ('1284', '151', '龙亭区', '3');
INSERT INTO `region` VALUES ('1285', '151', '顺河回族区', '3');
INSERT INTO `region` VALUES ('1286', '151', '金明区', '3');
INSERT INTO `region` VALUES ('1287', '151', '禹王台区', '3');
INSERT INTO `region` VALUES ('1288', '151', '杞县', '3');
INSERT INTO `region` VALUES ('1289', '151', '通许县', '3');
INSERT INTO `region` VALUES ('1290', '151', '尉氏县', '3');
INSERT INTO `region` VALUES ('1291', '151', '开封县', '3');
INSERT INTO `region` VALUES ('1292', '151', '兰考县', '3');
INSERT INTO `region` VALUES ('1293', '152', '北关区', '3');
INSERT INTO `region` VALUES ('1294', '152', '文峰区', '3');
INSERT INTO `region` VALUES ('1295', '152', '殷都区', '3');
INSERT INTO `region` VALUES ('1296', '152', '龙安区', '3');
INSERT INTO `region` VALUES ('1297', '152', '林州市', '3');
INSERT INTO `region` VALUES ('1298', '152', '安阳县', '3');
INSERT INTO `region` VALUES ('1299', '152', '汤阴县', '3');
INSERT INTO `region` VALUES ('1300', '152', '滑县', '3');
INSERT INTO `region` VALUES ('1301', '152', '内黄县', '3');
INSERT INTO `region` VALUES ('1302', '153', '淇滨区', '3');
INSERT INTO `region` VALUES ('1303', '153', '山城区', '3');
INSERT INTO `region` VALUES ('1304', '153', '鹤山区', '3');
INSERT INTO `region` VALUES ('1305', '153', '浚县', '3');
INSERT INTO `region` VALUES ('1306', '153', '淇县', '3');
INSERT INTO `region` VALUES ('1307', '154', '济源市', '3');
INSERT INTO `region` VALUES ('1308', '155', '解放区', '3');
INSERT INTO `region` VALUES ('1309', '155', '中站区', '3');
INSERT INTO `region` VALUES ('1310', '155', '马村区', '3');
INSERT INTO `region` VALUES ('1311', '155', '山阳区', '3');
INSERT INTO `region` VALUES ('1312', '155', '沁阳市', '3');
INSERT INTO `region` VALUES ('1313', '155', '孟州市', '3');
INSERT INTO `region` VALUES ('1314', '155', '修武县', '3');
INSERT INTO `region` VALUES ('1315', '155', '博爱县', '3');
INSERT INTO `region` VALUES ('1316', '155', '武陟县', '3');
INSERT INTO `region` VALUES ('1317', '155', '温县', '3');
INSERT INTO `region` VALUES ('1318', '156', '卧龙区', '3');
INSERT INTO `region` VALUES ('1319', '156', '宛城区', '3');
INSERT INTO `region` VALUES ('1320', '156', '邓州市', '3');
INSERT INTO `region` VALUES ('1321', '156', '南召县', '3');
INSERT INTO `region` VALUES ('1322', '156', '方城县', '3');
INSERT INTO `region` VALUES ('1323', '156', '西峡县', '3');
INSERT INTO `region` VALUES ('1324', '156', '镇平县', '3');
INSERT INTO `region` VALUES ('1325', '156', '内乡县', '3');
INSERT INTO `region` VALUES ('1326', '156', '淅川县', '3');
INSERT INTO `region` VALUES ('1327', '156', '社旗县', '3');
INSERT INTO `region` VALUES ('1328', '156', '唐河县', '3');
INSERT INTO `region` VALUES ('1329', '156', '新野县', '3');
INSERT INTO `region` VALUES ('1330', '156', '桐柏县', '3');
INSERT INTO `region` VALUES ('1331', '157', '新华区', '3');
INSERT INTO `region` VALUES ('1332', '157', '卫东区', '3');
INSERT INTO `region` VALUES ('1333', '157', '湛河区', '3');
INSERT INTO `region` VALUES ('1334', '157', '石龙区', '3');
INSERT INTO `region` VALUES ('1335', '157', '舞钢市', '3');
INSERT INTO `region` VALUES ('1336', '157', '汝州市', '3');
INSERT INTO `region` VALUES ('1337', '157', '宝丰县', '3');
INSERT INTO `region` VALUES ('1338', '157', '叶县', '3');
INSERT INTO `region` VALUES ('1339', '157', '鲁山县', '3');
INSERT INTO `region` VALUES ('1340', '157', '郏县', '3');
INSERT INTO `region` VALUES ('1341', '158', '湖滨区', '3');
INSERT INTO `region` VALUES ('1342', '158', '义马市', '3');
INSERT INTO `region` VALUES ('1343', '158', '灵宝市', '3');
INSERT INTO `region` VALUES ('1344', '158', '渑池县', '3');
INSERT INTO `region` VALUES ('1345', '158', '陕县', '3');
INSERT INTO `region` VALUES ('1346', '158', '卢氏县', '3');
INSERT INTO `region` VALUES ('1347', '159', '梁园区', '3');
INSERT INTO `region` VALUES ('1348', '159', '睢阳区', '3');
INSERT INTO `region` VALUES ('1349', '159', '永城市', '3');
INSERT INTO `region` VALUES ('1350', '159', '民权县', '3');
INSERT INTO `region` VALUES ('1351', '159', '睢县', '3');
INSERT INTO `region` VALUES ('1352', '159', '宁陵县', '3');
INSERT INTO `region` VALUES ('1353', '159', '虞城县', '3');
INSERT INTO `region` VALUES ('1354', '159', '柘城县', '3');
INSERT INTO `region` VALUES ('1355', '159', '夏邑县', '3');
INSERT INTO `region` VALUES ('1356', '160', '卫滨区', '3');
INSERT INTO `region` VALUES ('1357', '160', '红旗区', '3');
INSERT INTO `region` VALUES ('1358', '160', '凤泉区', '3');
INSERT INTO `region` VALUES ('1359', '160', '牧野区', '3');
INSERT INTO `region` VALUES ('1360', '160', '卫辉市', '3');
INSERT INTO `region` VALUES ('1361', '160', '辉县市', '3');
INSERT INTO `region` VALUES ('1362', '160', '新乡县', '3');
INSERT INTO `region` VALUES ('1363', '160', '获嘉县', '3');
INSERT INTO `region` VALUES ('1364', '160', '原阳县', '3');
INSERT INTO `region` VALUES ('1365', '160', '延津县', '3');
INSERT INTO `region` VALUES ('1366', '160', '封丘县', '3');
INSERT INTO `region` VALUES ('1367', '160', '长垣县', '3');
INSERT INTO `region` VALUES ('1368', '161', '浉河区', '3');
INSERT INTO `region` VALUES ('1369', '161', '平桥区', '3');
INSERT INTO `region` VALUES ('1370', '161', '罗山县', '3');
INSERT INTO `region` VALUES ('1371', '161', '光山县', '3');
INSERT INTO `region` VALUES ('1372', '161', '新县', '3');
INSERT INTO `region` VALUES ('1373', '161', '商城县', '3');
INSERT INTO `region` VALUES ('1374', '161', '固始县', '3');
INSERT INTO `region` VALUES ('1375', '161', '潢川县', '3');
INSERT INTO `region` VALUES ('1376', '161', '淮滨县', '3');
INSERT INTO `region` VALUES ('1377', '161', '息县', '3');
INSERT INTO `region` VALUES ('1378', '162', '魏都区', '3');
INSERT INTO `region` VALUES ('1379', '162', '禹州市', '3');
INSERT INTO `region` VALUES ('1380', '162', '长葛市', '3');
INSERT INTO `region` VALUES ('1381', '162', '许昌县', '3');
INSERT INTO `region` VALUES ('1382', '162', '鄢陵县', '3');
INSERT INTO `region` VALUES ('1383', '162', '襄城县', '3');
INSERT INTO `region` VALUES ('1384', '163', '川汇区', '3');
INSERT INTO `region` VALUES ('1385', '163', '项城市', '3');
INSERT INTO `region` VALUES ('1386', '163', '扶沟县', '3');
INSERT INTO `region` VALUES ('1387', '163', '西华县', '3');
INSERT INTO `region` VALUES ('1388', '163', '商水县', '3');
INSERT INTO `region` VALUES ('1389', '163', '沈丘县', '3');
INSERT INTO `region` VALUES ('1390', '163', '郸城县', '3');
INSERT INTO `region` VALUES ('1391', '163', '淮阳县', '3');
INSERT INTO `region` VALUES ('1392', '163', '太康县', '3');
INSERT INTO `region` VALUES ('1393', '163', '鹿邑县', '3');
INSERT INTO `region` VALUES ('1394', '164', '驿城区', '3');
INSERT INTO `region` VALUES ('1395', '164', '西平县', '3');
INSERT INTO `region` VALUES ('1396', '164', '上蔡县', '3');
INSERT INTO `region` VALUES ('1397', '164', '平舆县', '3');
INSERT INTO `region` VALUES ('1398', '164', '正阳县', '3');
INSERT INTO `region` VALUES ('1399', '164', '确山县', '3');
INSERT INTO `region` VALUES ('1400', '164', '泌阳县', '3');
INSERT INTO `region` VALUES ('1401', '164', '汝南县', '3');
INSERT INTO `region` VALUES ('1402', '164', '遂平县', '3');
INSERT INTO `region` VALUES ('1403', '164', '新蔡县', '3');
INSERT INTO `region` VALUES ('1404', '165', '郾城区', '3');
INSERT INTO `region` VALUES ('1405', '165', '源汇区', '3');
INSERT INTO `region` VALUES ('1406', '165', '召陵区', '3');
INSERT INTO `region` VALUES ('1407', '165', '舞阳县', '3');
INSERT INTO `region` VALUES ('1408', '165', '临颍县', '3');
INSERT INTO `region` VALUES ('1409', '166', '华龙区', '3');
INSERT INTO `region` VALUES ('1410', '166', '清丰县', '3');
INSERT INTO `region` VALUES ('1411', '166', '南乐县', '3');
INSERT INTO `region` VALUES ('1412', '166', '范县', '3');
INSERT INTO `region` VALUES ('1413', '166', '台前县', '3');
INSERT INTO `region` VALUES ('1414', '166', '濮阳县', '3');
INSERT INTO `region` VALUES ('1415', '167', '道里区', '3');
INSERT INTO `region` VALUES ('1416', '167', '南岗区', '3');
INSERT INTO `region` VALUES ('1417', '167', '动力区', '3');
INSERT INTO `region` VALUES ('1418', '167', '平房区', '3');
INSERT INTO `region` VALUES ('1419', '167', '香坊区', '3');
INSERT INTO `region` VALUES ('1420', '167', '太平区', '3');
INSERT INTO `region` VALUES ('1421', '167', '道外区', '3');
INSERT INTO `region` VALUES ('1422', '167', '阿城区', '3');
INSERT INTO `region` VALUES ('1423', '167', '呼兰区', '3');
INSERT INTO `region` VALUES ('1424', '167', '松北区', '3');
INSERT INTO `region` VALUES ('1425', '167', '尚志市', '3');
INSERT INTO `region` VALUES ('1426', '167', '双城市', '3');
INSERT INTO `region` VALUES ('1427', '167', '五常市', '3');
INSERT INTO `region` VALUES ('1428', '167', '方正县', '3');
INSERT INTO `region` VALUES ('1429', '167', '宾县', '3');
INSERT INTO `region` VALUES ('1430', '167', '依兰县', '3');
INSERT INTO `region` VALUES ('1431', '167', '巴彦县', '3');
INSERT INTO `region` VALUES ('1432', '167', '通河县', '3');
INSERT INTO `region` VALUES ('1433', '167', '木兰县', '3');
INSERT INTO `region` VALUES ('1434', '167', '延寿县', '3');
INSERT INTO `region` VALUES ('1435', '168', '萨尔图区', '3');
INSERT INTO `region` VALUES ('1436', '168', '红岗区', '3');
INSERT INTO `region` VALUES ('1437', '168', '龙凤区', '3');
INSERT INTO `region` VALUES ('1438', '168', '让胡路区', '3');
INSERT INTO `region` VALUES ('1439', '168', '大同区', '3');
INSERT INTO `region` VALUES ('1440', '168', '肇州县', '3');
INSERT INTO `region` VALUES ('1441', '168', '肇源县', '3');
INSERT INTO `region` VALUES ('1442', '168', '林甸县', '3');
INSERT INTO `region` VALUES ('1443', '168', '杜尔伯特', '3');
INSERT INTO `region` VALUES ('1444', '169', '呼玛县', '3');
INSERT INTO `region` VALUES ('1445', '169', '漠河县', '3');
INSERT INTO `region` VALUES ('1446', '169', '塔河县', '3');
INSERT INTO `region` VALUES ('1447', '170', '兴山区', '3');
INSERT INTO `region` VALUES ('1448', '170', '工农区', '3');
INSERT INTO `region` VALUES ('1449', '170', '南山区', '3');
INSERT INTO `region` VALUES ('1450', '170', '兴安区', '3');
INSERT INTO `region` VALUES ('1451', '170', '向阳区', '3');
INSERT INTO `region` VALUES ('1452', '170', '东山区', '3');
INSERT INTO `region` VALUES ('1453', '170', '萝北县', '3');
INSERT INTO `region` VALUES ('1454', '170', '绥滨县', '3');
INSERT INTO `region` VALUES ('1455', '171', '爱辉区', '3');
INSERT INTO `region` VALUES ('1456', '171', '五大连池市', '3');
INSERT INTO `region` VALUES ('1457', '171', '北安市', '3');
INSERT INTO `region` VALUES ('1458', '171', '嫩江县', '3');
INSERT INTO `region` VALUES ('1459', '171', '逊克县', '3');
INSERT INTO `region` VALUES ('1460', '171', '孙吴县', '3');
INSERT INTO `region` VALUES ('1461', '172', '鸡冠区', '3');
INSERT INTO `region` VALUES ('1462', '172', '恒山区', '3');
INSERT INTO `region` VALUES ('1463', '172', '城子河区', '3');
INSERT INTO `region` VALUES ('1464', '172', '滴道区', '3');
INSERT INTO `region` VALUES ('1465', '172', '梨树区', '3');
INSERT INTO `region` VALUES ('1466', '172', '虎林市', '3');
INSERT INTO `region` VALUES ('1467', '172', '密山市', '3');
INSERT INTO `region` VALUES ('1468', '172', '鸡东县', '3');
INSERT INTO `region` VALUES ('1469', '173', '前进区', '3');
INSERT INTO `region` VALUES ('1470', '173', '郊区', '3');
INSERT INTO `region` VALUES ('1471', '173', '向阳区', '3');
INSERT INTO `region` VALUES ('1472', '173', '东风区', '3');
INSERT INTO `region` VALUES ('1473', '173', '同江市', '3');
INSERT INTO `region` VALUES ('1474', '173', '富锦市', '3');
INSERT INTO `region` VALUES ('1475', '173', '桦南县', '3');
INSERT INTO `region` VALUES ('1476', '173', '桦川县', '3');
INSERT INTO `region` VALUES ('1477', '173', '汤原县', '3');
INSERT INTO `region` VALUES ('1478', '173', '抚远县', '3');
INSERT INTO `region` VALUES ('1479', '174', '爱民区', '3');
INSERT INTO `region` VALUES ('1480', '174', '东安区', '3');
INSERT INTO `region` VALUES ('1481', '174', '阳明区', '3');
INSERT INTO `region` VALUES ('1482', '174', '西安区', '3');
INSERT INTO `region` VALUES ('1483', '174', '绥芬河市', '3');
INSERT INTO `region` VALUES ('1484', '174', '海林市', '3');
INSERT INTO `region` VALUES ('1485', '174', '宁安市', '3');
INSERT INTO `region` VALUES ('1486', '174', '穆棱市', '3');
INSERT INTO `region` VALUES ('1487', '174', '东宁县', '3');
INSERT INTO `region` VALUES ('1488', '174', '林口县', '3');
INSERT INTO `region` VALUES ('1489', '175', '桃山区', '3');
INSERT INTO `region` VALUES ('1490', '175', '新兴区', '3');
INSERT INTO `region` VALUES ('1491', '175', '茄子河区', '3');
INSERT INTO `region` VALUES ('1492', '175', '勃利县', '3');
INSERT INTO `region` VALUES ('1493', '176', '龙沙区', '3');
INSERT INTO `region` VALUES ('1494', '176', '昂昂溪区', '3');
INSERT INTO `region` VALUES ('1495', '176', '铁峰区', '3');
INSERT INTO `region` VALUES ('1496', '176', '建华区', '3');
INSERT INTO `region` VALUES ('1497', '176', '富拉尔基区', '3');
INSERT INTO `region` VALUES ('1498', '176', '碾子山区', '3');
INSERT INTO `region` VALUES ('1499', '176', '梅里斯达斡尔区', '3');
INSERT INTO `region` VALUES ('1500', '176', '讷河市', '3');
INSERT INTO `region` VALUES ('1501', '176', '龙江县', '3');
INSERT INTO `region` VALUES ('1502', '176', '依安县', '3');
INSERT INTO `region` VALUES ('1503', '176', '泰来县', '3');
INSERT INTO `region` VALUES ('1504', '176', '甘南县', '3');
INSERT INTO `region` VALUES ('1505', '176', '富裕县', '3');
INSERT INTO `region` VALUES ('1506', '176', '克山县', '3');
INSERT INTO `region` VALUES ('1507', '176', '克东县', '3');
INSERT INTO `region` VALUES ('1508', '176', '拜泉县', '3');
INSERT INTO `region` VALUES ('1509', '177', '尖山区', '3');
INSERT INTO `region` VALUES ('1510', '177', '岭东区', '3');
INSERT INTO `region` VALUES ('1511', '177', '四方台区', '3');
INSERT INTO `region` VALUES ('1512', '177', '宝山区', '3');
INSERT INTO `region` VALUES ('1513', '177', '集贤县', '3');
INSERT INTO `region` VALUES ('1514', '177', '友谊县', '3');
INSERT INTO `region` VALUES ('1515', '177', '宝清县', '3');
INSERT INTO `region` VALUES ('1516', '177', '饶河县', '3');
INSERT INTO `region` VALUES ('1517', '178', '北林区', '3');
INSERT INTO `region` VALUES ('1518', '178', '安达市', '3');
INSERT INTO `region` VALUES ('1519', '178', '肇东市', '3');
INSERT INTO `region` VALUES ('1520', '178', '海伦市', '3');
INSERT INTO `region` VALUES ('1521', '178', '望奎县', '3');
INSERT INTO `region` VALUES ('1522', '178', '兰西县', '3');
INSERT INTO `region` VALUES ('1523', '178', '青冈县', '3');
INSERT INTO `region` VALUES ('1524', '178', '庆安县', '3');
INSERT INTO `region` VALUES ('1525', '178', '明水县', '3');
INSERT INTO `region` VALUES ('1526', '178', '绥棱县', '3');
INSERT INTO `region` VALUES ('1527', '179', '伊春区', '3');
INSERT INTO `region` VALUES ('1528', '179', '带岭区', '3');
INSERT INTO `region` VALUES ('1529', '179', '南岔区', '3');
INSERT INTO `region` VALUES ('1530', '179', '金山屯区', '3');
INSERT INTO `region` VALUES ('1531', '179', '西林区', '3');
INSERT INTO `region` VALUES ('1532', '179', '美溪区', '3');
INSERT INTO `region` VALUES ('1533', '179', '乌马河区', '3');
INSERT INTO `region` VALUES ('1534', '179', '翠峦区', '3');
INSERT INTO `region` VALUES ('1535', '179', '友好区', '3');
INSERT INTO `region` VALUES ('1536', '179', '上甘岭区', '3');
INSERT INTO `region` VALUES ('1537', '179', '五营区', '3');
INSERT INTO `region` VALUES ('1538', '179', '红星区', '3');
INSERT INTO `region` VALUES ('1539', '179', '新青区', '3');
INSERT INTO `region` VALUES ('1540', '179', '汤旺河区', '3');
INSERT INTO `region` VALUES ('1541', '179', '乌伊岭区', '3');
INSERT INTO `region` VALUES ('1542', '179', '铁力市', '3');
INSERT INTO `region` VALUES ('1543', '179', '嘉荫县', '3');
INSERT INTO `region` VALUES ('1544', '180', '江岸区', '3');
INSERT INTO `region` VALUES ('1545', '180', '武昌区', '3');
INSERT INTO `region` VALUES ('1546', '180', '江汉区', '3');
INSERT INTO `region` VALUES ('1547', '180', '硚口区', '3');
INSERT INTO `region` VALUES ('1548', '180', '汉阳区', '3');
INSERT INTO `region` VALUES ('1549', '180', '青山区', '3');
INSERT INTO `region` VALUES ('1550', '180', '洪山区', '3');
INSERT INTO `region` VALUES ('1551', '180', '东西湖区', '3');
INSERT INTO `region` VALUES ('1552', '180', '汉南区', '3');
INSERT INTO `region` VALUES ('1553', '180', '蔡甸区', '3');
INSERT INTO `region` VALUES ('1554', '180', '江夏区', '3');
INSERT INTO `region` VALUES ('1555', '180', '黄陂区', '3');
INSERT INTO `region` VALUES ('1556', '180', '新洲区', '3');
INSERT INTO `region` VALUES ('1557', '180', '经济开发区', '3');
INSERT INTO `region` VALUES ('1558', '181', '仙桃市', '3');
INSERT INTO `region` VALUES ('1559', '182', '鄂城区', '3');
INSERT INTO `region` VALUES ('1560', '182', '华容区', '3');
INSERT INTO `region` VALUES ('1561', '182', '梁子湖区', '3');
INSERT INTO `region` VALUES ('1562', '183', '黄州区', '3');
INSERT INTO `region` VALUES ('1563', '183', '麻城市', '3');
INSERT INTO `region` VALUES ('1564', '183', '武穴市', '3');
INSERT INTO `region` VALUES ('1565', '183', '团风县', '3');
INSERT INTO `region` VALUES ('1566', '183', '红安县', '3');
INSERT INTO `region` VALUES ('1567', '183', '罗田县', '3');
INSERT INTO `region` VALUES ('1568', '183', '英山县', '3');
INSERT INTO `region` VALUES ('1569', '183', '浠水县', '3');
INSERT INTO `region` VALUES ('1570', '183', '蕲春县', '3');
INSERT INTO `region` VALUES ('1571', '183', '黄梅县', '3');
INSERT INTO `region` VALUES ('1572', '184', '黄石港区', '3');
INSERT INTO `region` VALUES ('1573', '184', '西塞山区', '3');
INSERT INTO `region` VALUES ('1574', '184', '下陆区', '3');
INSERT INTO `region` VALUES ('1575', '184', '铁山区', '3');
INSERT INTO `region` VALUES ('1576', '184', '大冶市', '3');
INSERT INTO `region` VALUES ('1577', '184', '阳新县', '3');
INSERT INTO `region` VALUES ('1578', '185', '东宝区', '3');
INSERT INTO `region` VALUES ('1579', '185', '掇刀区', '3');
INSERT INTO `region` VALUES ('1580', '185', '钟祥市', '3');
INSERT INTO `region` VALUES ('1581', '185', '京山县', '3');
INSERT INTO `region` VALUES ('1582', '185', '沙洋县', '3');
INSERT INTO `region` VALUES ('1583', '186', '沙市区', '3');
INSERT INTO `region` VALUES ('1584', '186', '荆州区', '3');
INSERT INTO `region` VALUES ('1585', '186', '石首市', '3');
INSERT INTO `region` VALUES ('1586', '186', '洪湖市', '3');
INSERT INTO `region` VALUES ('1587', '186', '松滋市', '3');
INSERT INTO `region` VALUES ('1588', '186', '公安县', '3');
INSERT INTO `region` VALUES ('1589', '186', '监利县', '3');
INSERT INTO `region` VALUES ('1590', '186', '江陵县', '3');
INSERT INTO `region` VALUES ('1591', '187', '潜江市', '3');
INSERT INTO `region` VALUES ('1592', '188', '神农架林区', '3');
INSERT INTO `region` VALUES ('1593', '189', '张湾区', '3');
INSERT INTO `region` VALUES ('1594', '189', '茅箭区', '3');
INSERT INTO `region` VALUES ('1595', '189', '丹江口市', '3');
INSERT INTO `region` VALUES ('1596', '189', '郧县', '3');
INSERT INTO `region` VALUES ('1597', '189', '郧西县', '3');
INSERT INTO `region` VALUES ('1598', '189', '竹山县', '3');
INSERT INTO `region` VALUES ('1599', '189', '竹溪县', '3');
INSERT INTO `region` VALUES ('1600', '189', '房县', '3');
INSERT INTO `region` VALUES ('1601', '190', '曾都区', '3');
INSERT INTO `region` VALUES ('1602', '190', '广水市', '3');
INSERT INTO `region` VALUES ('1603', '191', '天门市', '3');
INSERT INTO `region` VALUES ('1604', '192', '咸安区', '3');
INSERT INTO `region` VALUES ('1605', '192', '赤壁市', '3');
INSERT INTO `region` VALUES ('1606', '192', '嘉鱼县', '3');
INSERT INTO `region` VALUES ('1607', '192', '通城县', '3');
INSERT INTO `region` VALUES ('1608', '192', '崇阳县', '3');
INSERT INTO `region` VALUES ('1609', '192', '通山县', '3');
INSERT INTO `region` VALUES ('1610', '193', '襄城区', '3');
INSERT INTO `region` VALUES ('1611', '193', '樊城区', '3');
INSERT INTO `region` VALUES ('1612', '193', '襄阳区', '3');
INSERT INTO `region` VALUES ('1613', '193', '老河口市', '3');
INSERT INTO `region` VALUES ('1614', '193', '枣阳市', '3');
INSERT INTO `region` VALUES ('1615', '193', '宜城市', '3');
INSERT INTO `region` VALUES ('1616', '193', '南漳县', '3');
INSERT INTO `region` VALUES ('1617', '193', '谷城县', '3');
INSERT INTO `region` VALUES ('1618', '193', '保康县', '3');
INSERT INTO `region` VALUES ('1619', '194', '孝南区', '3');
INSERT INTO `region` VALUES ('1620', '194', '应城市', '3');
INSERT INTO `region` VALUES ('1621', '194', '安陆市', '3');
INSERT INTO `region` VALUES ('1622', '194', '汉川市', '3');
INSERT INTO `region` VALUES ('1623', '194', '孝昌县', '3');
INSERT INTO `region` VALUES ('1624', '194', '大悟县', '3');
INSERT INTO `region` VALUES ('1625', '194', '云梦县', '3');
INSERT INTO `region` VALUES ('1626', '195', '长阳', '3');
INSERT INTO `region` VALUES ('1627', '195', '五峰', '3');
INSERT INTO `region` VALUES ('1628', '195', '西陵区', '3');
INSERT INTO `region` VALUES ('1629', '195', '伍家岗区', '3');
INSERT INTO `region` VALUES ('1630', '195', '点军区', '3');
INSERT INTO `region` VALUES ('1631', '195', '猇亭区', '3');
INSERT INTO `region` VALUES ('1632', '195', '夷陵区', '3');
INSERT INTO `region` VALUES ('1633', '195', '宜都市', '3');
INSERT INTO `region` VALUES ('1634', '195', '当阳市', '3');
INSERT INTO `region` VALUES ('1635', '195', '枝江市', '3');
INSERT INTO `region` VALUES ('1636', '195', '远安县', '3');
INSERT INTO `region` VALUES ('1637', '195', '兴山县', '3');
INSERT INTO `region` VALUES ('1638', '195', '秭归县', '3');
INSERT INTO `region` VALUES ('1639', '196', '恩施市', '3');
INSERT INTO `region` VALUES ('1640', '196', '利川市', '3');
INSERT INTO `region` VALUES ('1641', '196', '建始县', '3');
INSERT INTO `region` VALUES ('1642', '196', '巴东县', '3');
INSERT INTO `region` VALUES ('1643', '196', '宣恩县', '3');
INSERT INTO `region` VALUES ('1644', '196', '咸丰县', '3');
INSERT INTO `region` VALUES ('1645', '196', '来凤县', '3');
INSERT INTO `region` VALUES ('1646', '196', '鹤峰县', '3');
INSERT INTO `region` VALUES ('1647', '197', '岳麓区', '3');
INSERT INTO `region` VALUES ('1648', '197', '芙蓉区', '3');
INSERT INTO `region` VALUES ('1649', '197', '天心区', '3');
INSERT INTO `region` VALUES ('1650', '197', '开福区', '3');
INSERT INTO `region` VALUES ('1651', '197', '雨花区', '3');
INSERT INTO `region` VALUES ('1652', '197', '开发区', '3');
INSERT INTO `region` VALUES ('1653', '197', '浏阳市', '3');
INSERT INTO `region` VALUES ('1654', '197', '长沙县', '3');
INSERT INTO `region` VALUES ('1655', '197', '望城县', '3');
INSERT INTO `region` VALUES ('1656', '197', '宁乡县', '3');
INSERT INTO `region` VALUES ('1657', '198', '永定区', '3');
INSERT INTO `region` VALUES ('1658', '198', '武陵源区', '3');
INSERT INTO `region` VALUES ('1659', '198', '慈利县', '3');
INSERT INTO `region` VALUES ('1660', '198', '桑植县', '3');
INSERT INTO `region` VALUES ('1661', '199', '武陵区', '3');
INSERT INTO `region` VALUES ('1662', '199', '鼎城区', '3');
INSERT INTO `region` VALUES ('1663', '199', '津市市', '3');
INSERT INTO `region` VALUES ('1664', '199', '安乡县', '3');
INSERT INTO `region` VALUES ('1665', '199', '汉寿县', '3');
INSERT INTO `region` VALUES ('1666', '199', '澧县', '3');
INSERT INTO `region` VALUES ('1667', '199', '临澧县', '3');
INSERT INTO `region` VALUES ('1668', '199', '桃源县', '3');
INSERT INTO `region` VALUES ('1669', '199', '石门县', '3');
INSERT INTO `region` VALUES ('1670', '200', '北湖区', '3');
INSERT INTO `region` VALUES ('1671', '200', '苏仙区', '3');
INSERT INTO `region` VALUES ('1672', '200', '资兴市', '3');
INSERT INTO `region` VALUES ('1673', '200', '桂阳县', '3');
INSERT INTO `region` VALUES ('1674', '200', '宜章县', '3');
INSERT INTO `region` VALUES ('1675', '200', '永兴县', '3');
INSERT INTO `region` VALUES ('1676', '200', '嘉禾县', '3');
INSERT INTO `region` VALUES ('1677', '200', '临武县', '3');
INSERT INTO `region` VALUES ('1678', '200', '汝城县', '3');
INSERT INTO `region` VALUES ('1679', '200', '桂东县', '3');
INSERT INTO `region` VALUES ('1680', '200', '安仁县', '3');
INSERT INTO `region` VALUES ('1681', '201', '雁峰区', '3');
INSERT INTO `region` VALUES ('1682', '201', '珠晖区', '3');
INSERT INTO `region` VALUES ('1683', '201', '石鼓区', '3');
INSERT INTO `region` VALUES ('1684', '201', '蒸湘区', '3');
INSERT INTO `region` VALUES ('1685', '201', '南岳区', '3');
INSERT INTO `region` VALUES ('1686', '201', '耒阳市', '3');
INSERT INTO `region` VALUES ('1687', '201', '常宁市', '3');
INSERT INTO `region` VALUES ('1688', '201', '衡阳县', '3');
INSERT INTO `region` VALUES ('1689', '201', '衡南县', '3');
INSERT INTO `region` VALUES ('1690', '201', '衡山县', '3');
INSERT INTO `region` VALUES ('1691', '201', '衡东县', '3');
INSERT INTO `region` VALUES ('1692', '201', '祁东县', '3');
INSERT INTO `region` VALUES ('1693', '202', '鹤城区', '3');
INSERT INTO `region` VALUES ('1694', '202', '靖州', '3');
INSERT INTO `region` VALUES ('1695', '202', '麻阳', '3');
INSERT INTO `region` VALUES ('1696', '202', '通道', '3');
INSERT INTO `region` VALUES ('1697', '202', '新晃', '3');
INSERT INTO `region` VALUES ('1698', '202', '芷江', '3');
INSERT INTO `region` VALUES ('1699', '202', '沅陵县', '3');
INSERT INTO `region` VALUES ('1700', '202', '辰溪县', '3');
INSERT INTO `region` VALUES ('1701', '202', '溆浦县', '3');
INSERT INTO `region` VALUES ('1702', '202', '中方县', '3');
INSERT INTO `region` VALUES ('1703', '202', '会同县', '3');
INSERT INTO `region` VALUES ('1704', '202', '洪江市', '3');
INSERT INTO `region` VALUES ('1705', '203', '娄星区', '3');
INSERT INTO `region` VALUES ('1706', '203', '冷水江市', '3');
INSERT INTO `region` VALUES ('1707', '203', '涟源市', '3');
INSERT INTO `region` VALUES ('1708', '203', '双峰县', '3');
INSERT INTO `region` VALUES ('1709', '203', '新化县', '3');
INSERT INTO `region` VALUES ('1710', '204', '城步', '3');
INSERT INTO `region` VALUES ('1711', '204', '双清区', '3');
INSERT INTO `region` VALUES ('1712', '204', '大祥区', '3');
INSERT INTO `region` VALUES ('1713', '204', '北塔区', '3');
INSERT INTO `region` VALUES ('1714', '204', '武冈市', '3');
INSERT INTO `region` VALUES ('1715', '204', '邵东县', '3');
INSERT INTO `region` VALUES ('1716', '204', '新邵县', '3');
INSERT INTO `region` VALUES ('1717', '204', '邵阳县', '3');
INSERT INTO `region` VALUES ('1718', '204', '隆回县', '3');
INSERT INTO `region` VALUES ('1719', '204', '洞口县', '3');
INSERT INTO `region` VALUES ('1720', '204', '绥宁县', '3');
INSERT INTO `region` VALUES ('1721', '204', '新宁县', '3');
INSERT INTO `region` VALUES ('1722', '205', '岳塘区', '3');
INSERT INTO `region` VALUES ('1723', '205', '雨湖区', '3');
INSERT INTO `region` VALUES ('1724', '205', '湘乡市', '3');
INSERT INTO `region` VALUES ('1725', '205', '韶山市', '3');
INSERT INTO `region` VALUES ('1726', '205', '湘潭县', '3');
INSERT INTO `region` VALUES ('1727', '206', '吉首市', '3');
INSERT INTO `region` VALUES ('1728', '206', '泸溪县', '3');
INSERT INTO `region` VALUES ('1729', '206', '凤凰县', '3');
INSERT INTO `region` VALUES ('1730', '206', '花垣县', '3');
INSERT INTO `region` VALUES ('1731', '206', '保靖县', '3');
INSERT INTO `region` VALUES ('1732', '206', '古丈县', '3');
INSERT INTO `region` VALUES ('1733', '206', '永顺县', '3');
INSERT INTO `region` VALUES ('1734', '206', '龙山县', '3');
INSERT INTO `region` VALUES ('1735', '207', '赫山区', '3');
INSERT INTO `region` VALUES ('1736', '207', '资阳区', '3');
INSERT INTO `region` VALUES ('1737', '207', '沅江市', '3');
INSERT INTO `region` VALUES ('1738', '207', '南县', '3');
INSERT INTO `region` VALUES ('1739', '207', '桃江县', '3');
INSERT INTO `region` VALUES ('1740', '207', '安化县', '3');
INSERT INTO `region` VALUES ('1741', '208', '江华', '3');
INSERT INTO `region` VALUES ('1742', '208', '冷水滩区', '3');
INSERT INTO `region` VALUES ('1743', '208', '零陵区', '3');
INSERT INTO `region` VALUES ('1744', '208', '祁阳县', '3');
INSERT INTO `region` VALUES ('1745', '208', '东安县', '3');
INSERT INTO `region` VALUES ('1746', '208', '双牌县', '3');
INSERT INTO `region` VALUES ('1747', '208', '道县', '3');
INSERT INTO `region` VALUES ('1748', '208', '江永县', '3');
INSERT INTO `region` VALUES ('1749', '208', '宁远县', '3');
INSERT INTO `region` VALUES ('1750', '208', '蓝山县', '3');
INSERT INTO `region` VALUES ('1751', '208', '新田县', '3');
INSERT INTO `region` VALUES ('1752', '209', '岳阳楼区', '3');
INSERT INTO `region` VALUES ('1753', '209', '君山区', '3');
INSERT INTO `region` VALUES ('1754', '209', '云溪区', '3');
INSERT INTO `region` VALUES ('1755', '209', '汨罗市', '3');
INSERT INTO `region` VALUES ('1756', '209', '临湘市', '3');
INSERT INTO `region` VALUES ('1757', '209', '岳阳县', '3');
INSERT INTO `region` VALUES ('1758', '209', '华容县', '3');
INSERT INTO `region` VALUES ('1759', '209', '湘阴县', '3');
INSERT INTO `region` VALUES ('1760', '209', '平江县', '3');
INSERT INTO `region` VALUES ('1761', '210', '天元区', '3');
INSERT INTO `region` VALUES ('1762', '210', '荷塘区', '3');
INSERT INTO `region` VALUES ('1763', '210', '芦淞区', '3');
INSERT INTO `region` VALUES ('1764', '210', '石峰区', '3');
INSERT INTO `region` VALUES ('1765', '210', '醴陵市', '3');
INSERT INTO `region` VALUES ('1766', '210', '株洲县', '3');
INSERT INTO `region` VALUES ('1767', '210', '攸县', '3');
INSERT INTO `region` VALUES ('1768', '210', '茶陵县', '3');
INSERT INTO `region` VALUES ('1769', '210', '炎陵县', '3');
INSERT INTO `region` VALUES ('1770', '211', '朝阳区', '3');
INSERT INTO `region` VALUES ('1771', '211', '宽城区', '3');
INSERT INTO `region` VALUES ('1772', '211', '二道区', '3');
INSERT INTO `region` VALUES ('1773', '211', '南关区', '3');
INSERT INTO `region` VALUES ('1774', '211', '绿园区', '3');
INSERT INTO `region` VALUES ('1775', '211', '双阳区', '3');
INSERT INTO `region` VALUES ('1776', '211', '净月潭开发区', '3');
INSERT INTO `region` VALUES ('1777', '211', '高新技术开发区', '3');
INSERT INTO `region` VALUES ('1778', '211', '经济技术开发区', '3');
INSERT INTO `region` VALUES ('1779', '211', '汽车产业开发区', '3');
INSERT INTO `region` VALUES ('1780', '211', '德惠市', '3');
INSERT INTO `region` VALUES ('1781', '211', '九台市', '3');
INSERT INTO `region` VALUES ('1782', '211', '榆树市', '3');
INSERT INTO `region` VALUES ('1783', '211', '农安县', '3');
INSERT INTO `region` VALUES ('1784', '212', '船营区', '3');
INSERT INTO `region` VALUES ('1785', '212', '昌邑区', '3');
INSERT INTO `region` VALUES ('1786', '212', '龙潭区', '3');
INSERT INTO `region` VALUES ('1787', '212', '丰满区', '3');
INSERT INTO `region` VALUES ('1788', '212', '蛟河市', '3');
INSERT INTO `region` VALUES ('1789', '212', '桦甸市', '3');
INSERT INTO `region` VALUES ('1790', '212', '舒兰市', '3');
INSERT INTO `region` VALUES ('1791', '212', '磐石市', '3');
INSERT INTO `region` VALUES ('1792', '212', '永吉县', '3');
INSERT INTO `region` VALUES ('1793', '213', '洮北区', '3');
INSERT INTO `region` VALUES ('1794', '213', '洮南市', '3');
INSERT INTO `region` VALUES ('1795', '213', '大安市', '3');
INSERT INTO `region` VALUES ('1796', '213', '镇赉县', '3');
INSERT INTO `region` VALUES ('1797', '213', '通榆县', '3');
INSERT INTO `region` VALUES ('1798', '214', '江源区', '3');
INSERT INTO `region` VALUES ('1799', '214', '八道江区', '3');
INSERT INTO `region` VALUES ('1800', '214', '长白', '3');
INSERT INTO `region` VALUES ('1801', '214', '临江市', '3');
INSERT INTO `region` VALUES ('1802', '214', '抚松县', '3');
INSERT INTO `region` VALUES ('1803', '214', '靖宇县', '3');
INSERT INTO `region` VALUES ('1804', '215', '龙山区', '3');
INSERT INTO `region` VALUES ('1805', '215', '西安区', '3');
INSERT INTO `region` VALUES ('1806', '215', '东丰县', '3');
INSERT INTO `region` VALUES ('1807', '215', '东辽县', '3');
INSERT INTO `region` VALUES ('1808', '216', '铁西区', '3');
INSERT INTO `region` VALUES ('1809', '216', '铁东区', '3');
INSERT INTO `region` VALUES ('1810', '216', '伊通', '3');
INSERT INTO `region` VALUES ('1811', '216', '公主岭市', '3');
INSERT INTO `region` VALUES ('1812', '216', '双辽市', '3');
INSERT INTO `region` VALUES ('1813', '216', '梨树县', '3');
INSERT INTO `region` VALUES ('1814', '217', '前郭尔罗斯', '3');
INSERT INTO `region` VALUES ('1815', '217', '宁江区', '3');
INSERT INTO `region` VALUES ('1816', '217', '长岭县', '3');
INSERT INTO `region` VALUES ('1817', '217', '乾安县', '3');
INSERT INTO `region` VALUES ('1818', '217', '扶余县', '3');
INSERT INTO `region` VALUES ('1819', '218', '东昌区', '3');
INSERT INTO `region` VALUES ('1820', '218', '二道江区', '3');
INSERT INTO `region` VALUES ('1821', '218', '梅河口市', '3');
INSERT INTO `region` VALUES ('1822', '218', '集安市', '3');
INSERT INTO `region` VALUES ('1823', '218', '通化县', '3');
INSERT INTO `region` VALUES ('1824', '218', '辉南县', '3');
INSERT INTO `region` VALUES ('1825', '218', '柳河县', '3');
INSERT INTO `region` VALUES ('1826', '219', '延吉市', '3');
INSERT INTO `region` VALUES ('1827', '219', '图们市', '3');
INSERT INTO `region` VALUES ('1828', '219', '敦化市', '3');
INSERT INTO `region` VALUES ('1829', '219', '珲春市', '3');
INSERT INTO `region` VALUES ('1830', '219', '龙井市', '3');
INSERT INTO `region` VALUES ('1831', '219', '和龙市', '3');
INSERT INTO `region` VALUES ('1832', '219', '安图县', '3');
INSERT INTO `region` VALUES ('1833', '219', '汪清县', '3');
INSERT INTO `region` VALUES ('1834', '220', '玄武区', '3');
INSERT INTO `region` VALUES ('1835', '220', '鼓楼区', '3');
INSERT INTO `region` VALUES ('1836', '220', '白下区', '3');
INSERT INTO `region` VALUES ('1837', '220', '建邺区', '3');
INSERT INTO `region` VALUES ('1838', '220', '秦淮区', '3');
INSERT INTO `region` VALUES ('1839', '220', '雨花台区', '3');
INSERT INTO `region` VALUES ('1840', '220', '下关区', '3');
INSERT INTO `region` VALUES ('1841', '220', '栖霞区', '3');
INSERT INTO `region` VALUES ('1842', '220', '浦口区', '3');
INSERT INTO `region` VALUES ('1843', '220', '江宁区', '3');
INSERT INTO `region` VALUES ('1844', '220', '六合区', '3');
INSERT INTO `region` VALUES ('1845', '220', '溧水县', '3');
INSERT INTO `region` VALUES ('1846', '220', '高淳县', '3');
INSERT INTO `region` VALUES ('1847', '221', '沧浪区', '3');
INSERT INTO `region` VALUES ('1848', '221', '金阊区', '3');
INSERT INTO `region` VALUES ('1849', '221', '平江区', '3');
INSERT INTO `region` VALUES ('1850', '221', '虎丘区', '3');
INSERT INTO `region` VALUES ('1851', '221', '吴中区', '3');
INSERT INTO `region` VALUES ('1852', '221', '相城区', '3');
INSERT INTO `region` VALUES ('1853', '221', '园区', '3');
INSERT INTO `region` VALUES ('1854', '221', '新区', '3');
INSERT INTO `region` VALUES ('1855', '221', '常熟市', '3');
INSERT INTO `region` VALUES ('1856', '221', '张家港市', '3');
INSERT INTO `region` VALUES ('1857', '221', '玉山镇', '3');
INSERT INTO `region` VALUES ('1858', '221', '巴城镇', '3');
INSERT INTO `region` VALUES ('1859', '221', '周市镇', '3');
INSERT INTO `region` VALUES ('1860', '221', '陆家镇', '3');
INSERT INTO `region` VALUES ('1861', '221', '花桥镇', '3');
INSERT INTO `region` VALUES ('1862', '221', '淀山湖镇', '3');
INSERT INTO `region` VALUES ('1863', '221', '张浦镇', '3');
INSERT INTO `region` VALUES ('1864', '221', '周庄镇', '3');
INSERT INTO `region` VALUES ('1865', '221', '千灯镇', '3');
INSERT INTO `region` VALUES ('1866', '221', '锦溪镇', '3');
INSERT INTO `region` VALUES ('1867', '221', '开发区', '3');
INSERT INTO `region` VALUES ('1868', '221', '吴江市', '3');
INSERT INTO `region` VALUES ('1869', '221', '太仓市', '3');
INSERT INTO `region` VALUES ('1870', '222', '崇安区', '3');
INSERT INTO `region` VALUES ('1871', '222', '北塘区', '3');
INSERT INTO `region` VALUES ('1872', '222', '南长区', '3');
INSERT INTO `region` VALUES ('1873', '222', '锡山区', '3');
INSERT INTO `region` VALUES ('1874', '222', '惠山区', '3');
INSERT INTO `region` VALUES ('1875', '222', '滨湖区', '3');
INSERT INTO `region` VALUES ('1876', '222', '新区', '3');
INSERT INTO `region` VALUES ('1877', '222', '江阴市', '3');
INSERT INTO `region` VALUES ('1878', '222', '宜兴市', '3');
INSERT INTO `region` VALUES ('1879', '223', '天宁区', '3');
INSERT INTO `region` VALUES ('1880', '223', '钟楼区', '3');
INSERT INTO `region` VALUES ('1881', '223', '戚墅堰区', '3');
INSERT INTO `region` VALUES ('1882', '223', '郊区', '3');
INSERT INTO `region` VALUES ('1883', '223', '新北区', '3');
INSERT INTO `region` VALUES ('1884', '223', '武进区', '3');
INSERT INTO `region` VALUES ('1885', '223', '溧阳市', '3');
INSERT INTO `region` VALUES ('1886', '223', '金坛市', '3');
INSERT INTO `region` VALUES ('1887', '224', '清河区', '3');
INSERT INTO `region` VALUES ('1888', '224', '清浦区', '3');
INSERT INTO `region` VALUES ('1889', '224', '楚州区', '3');
INSERT INTO `region` VALUES ('1890', '224', '淮阴区', '3');
INSERT INTO `region` VALUES ('1891', '224', '涟水县', '3');
INSERT INTO `region` VALUES ('1892', '224', '洪泽县', '3');
INSERT INTO `region` VALUES ('1893', '224', '盱眙县', '3');
INSERT INTO `region` VALUES ('1894', '224', '金湖县', '3');
INSERT INTO `region` VALUES ('1895', '225', '新浦区', '3');
INSERT INTO `region` VALUES ('1896', '225', '连云区', '3');
INSERT INTO `region` VALUES ('1897', '225', '海州区', '3');
INSERT INTO `region` VALUES ('1898', '225', '赣榆县', '3');
INSERT INTO `region` VALUES ('1899', '225', '东海县', '3');
INSERT INTO `region` VALUES ('1900', '225', '灌云县', '3');
INSERT INTO `region` VALUES ('1901', '225', '灌南县', '3');
INSERT INTO `region` VALUES ('1902', '226', '崇川区', '3');
INSERT INTO `region` VALUES ('1903', '226', '港闸区', '3');
INSERT INTO `region` VALUES ('1904', '226', '经济开发区', '3');
INSERT INTO `region` VALUES ('1905', '226', '启东市', '3');
INSERT INTO `region` VALUES ('1906', '226', '如皋市', '3');
INSERT INTO `region` VALUES ('1907', '226', '通州市', '3');
INSERT INTO `region` VALUES ('1908', '226', '海门市', '3');
INSERT INTO `region` VALUES ('1909', '226', '海安县', '3');
INSERT INTO `region` VALUES ('1910', '226', '如东县', '3');
INSERT INTO `region` VALUES ('1911', '227', '宿城区', '3');
INSERT INTO `region` VALUES ('1912', '227', '宿豫区', '3');
INSERT INTO `region` VALUES ('1913', '227', '宿豫县', '3');
INSERT INTO `region` VALUES ('1914', '227', '沭阳县', '3');
INSERT INTO `region` VALUES ('1915', '227', '泗阳县', '3');
INSERT INTO `region` VALUES ('1916', '227', '泗洪县', '3');
INSERT INTO `region` VALUES ('1917', '228', '海陵区', '3');
INSERT INTO `region` VALUES ('1918', '228', '高港区', '3');
INSERT INTO `region` VALUES ('1919', '228', '兴化市', '3');
INSERT INTO `region` VALUES ('1920', '228', '靖江市', '3');
INSERT INTO `region` VALUES ('1921', '228', '泰兴市', '3');
INSERT INTO `region` VALUES ('1922', '228', '姜堰市', '3');
INSERT INTO `region` VALUES ('1923', '229', '云龙区', '3');
INSERT INTO `region` VALUES ('1924', '229', '鼓楼区', '3');
INSERT INTO `region` VALUES ('1925', '229', '九里区', '3');
INSERT INTO `region` VALUES ('1926', '229', '贾汪区', '3');
INSERT INTO `region` VALUES ('1927', '229', '泉山区', '3');
INSERT INTO `region` VALUES ('1928', '229', '新沂市', '3');
INSERT INTO `region` VALUES ('1929', '229', '邳州市', '3');
INSERT INTO `region` VALUES ('1930', '229', '丰县', '3');
INSERT INTO `region` VALUES ('1931', '229', '沛县', '3');
INSERT INTO `region` VALUES ('1932', '229', '铜山县', '3');
INSERT INTO `region` VALUES ('1933', '229', '睢宁县', '3');
INSERT INTO `region` VALUES ('1934', '230', '城区', '3');
INSERT INTO `region` VALUES ('1935', '230', '亭湖区', '3');
INSERT INTO `region` VALUES ('1936', '230', '盐都区', '3');
INSERT INTO `region` VALUES ('1937', '230', '盐都县', '3');
INSERT INTO `region` VALUES ('1938', '230', '东台市', '3');
INSERT INTO `region` VALUES ('1939', '230', '大丰市', '3');
INSERT INTO `region` VALUES ('1940', '230', '响水县', '3');
INSERT INTO `region` VALUES ('1941', '230', '滨海县', '3');
INSERT INTO `region` VALUES ('1942', '230', '阜宁县', '3');
INSERT INTO `region` VALUES ('1943', '230', '射阳县', '3');
INSERT INTO `region` VALUES ('1944', '230', '建湖县', '3');
INSERT INTO `region` VALUES ('1945', '231', '广陵区', '3');
INSERT INTO `region` VALUES ('1946', '231', '维扬区', '3');
INSERT INTO `region` VALUES ('1947', '231', '邗江区', '3');
INSERT INTO `region` VALUES ('1948', '231', '仪征市', '3');
INSERT INTO `region` VALUES ('1949', '231', '高邮市', '3');
INSERT INTO `region` VALUES ('1950', '231', '江都市', '3');
INSERT INTO `region` VALUES ('1951', '231', '宝应县', '3');
INSERT INTO `region` VALUES ('1952', '232', '京口区', '3');
INSERT INTO `region` VALUES ('1953', '232', '润州区', '3');
INSERT INTO `region` VALUES ('1954', '232', '丹徒区', '3');
INSERT INTO `region` VALUES ('1955', '232', '丹阳市', '3');
INSERT INTO `region` VALUES ('1956', '232', '扬中市', '3');
INSERT INTO `region` VALUES ('1957', '232', '句容市', '3');
INSERT INTO `region` VALUES ('1958', '233', '东湖区', '3');
INSERT INTO `region` VALUES ('1959', '233', '西湖区', '3');
INSERT INTO `region` VALUES ('1960', '233', '青云谱区', '3');
INSERT INTO `region` VALUES ('1961', '233', '湾里区', '3');
INSERT INTO `region` VALUES ('1962', '233', '青山湖区', '3');
INSERT INTO `region` VALUES ('1963', '233', '红谷滩新区', '3');
INSERT INTO `region` VALUES ('1964', '233', '昌北区', '3');
INSERT INTO `region` VALUES ('1965', '233', '高新区', '3');
INSERT INTO `region` VALUES ('1966', '233', '南昌县', '3');
INSERT INTO `region` VALUES ('1967', '233', '新建县', '3');
INSERT INTO `region` VALUES ('1968', '233', '安义县', '3');
INSERT INTO `region` VALUES ('1969', '233', '进贤县', '3');
INSERT INTO `region` VALUES ('1970', '234', '临川区', '3');
INSERT INTO `region` VALUES ('1971', '234', '南城县', '3');
INSERT INTO `region` VALUES ('1972', '234', '黎川县', '3');
INSERT INTO `region` VALUES ('1973', '234', '南丰县', '3');
INSERT INTO `region` VALUES ('1974', '234', '崇仁县', '3');
INSERT INTO `region` VALUES ('1975', '234', '乐安县', '3');
INSERT INTO `region` VALUES ('1976', '234', '宜黄县', '3');
INSERT INTO `region` VALUES ('1977', '234', '金溪县', '3');
INSERT INTO `region` VALUES ('1978', '234', '资溪县', '3');
INSERT INTO `region` VALUES ('1979', '234', '东乡县', '3');
INSERT INTO `region` VALUES ('1980', '234', '广昌县', '3');
INSERT INTO `region` VALUES ('1981', '235', '章贡区', '3');
INSERT INTO `region` VALUES ('1982', '235', '于都县', '3');
INSERT INTO `region` VALUES ('1983', '235', '瑞金市', '3');
INSERT INTO `region` VALUES ('1984', '235', '南康市', '3');
INSERT INTO `region` VALUES ('1985', '235', '赣县', '3');
INSERT INTO `region` VALUES ('1986', '235', '信丰县', '3');
INSERT INTO `region` VALUES ('1987', '235', '大余县', '3');
INSERT INTO `region` VALUES ('1988', '235', '上犹县', '3');
INSERT INTO `region` VALUES ('1989', '235', '崇义县', '3');
INSERT INTO `region` VALUES ('1990', '235', '安远县', '3');
INSERT INTO `region` VALUES ('1991', '235', '龙南县', '3');
INSERT INTO `region` VALUES ('1992', '235', '定南县', '3');
INSERT INTO `region` VALUES ('1993', '235', '全南县', '3');
INSERT INTO `region` VALUES ('1994', '235', '宁都县', '3');
INSERT INTO `region` VALUES ('1995', '235', '兴国县', '3');
INSERT INTO `region` VALUES ('1996', '235', '会昌县', '3');
INSERT INTO `region` VALUES ('1997', '235', '寻乌县', '3');
INSERT INTO `region` VALUES ('1998', '235', '石城县', '3');
INSERT INTO `region` VALUES ('1999', '236', '安福县', '3');
INSERT INTO `region` VALUES ('2000', '236', '吉州区', '3');
INSERT INTO `region` VALUES ('2001', '236', '青原区', '3');
INSERT INTO `region` VALUES ('2002', '236', '井冈山市', '3');
INSERT INTO `region` VALUES ('2003', '236', '吉安县', '3');
INSERT INTO `region` VALUES ('2004', '236', '吉水县', '3');
INSERT INTO `region` VALUES ('2005', '236', '峡江县', '3');
INSERT INTO `region` VALUES ('2006', '236', '新干县', '3');
INSERT INTO `region` VALUES ('2007', '236', '永丰县', '3');
INSERT INTO `region` VALUES ('2008', '236', '泰和县', '3');
INSERT INTO `region` VALUES ('2009', '236', '遂川县', '3');
INSERT INTO `region` VALUES ('2010', '236', '万安县', '3');
INSERT INTO `region` VALUES ('2011', '236', '永新县', '3');
INSERT INTO `region` VALUES ('2012', '237', '珠山区', '3');
INSERT INTO `region` VALUES ('2013', '237', '昌江区', '3');
INSERT INTO `region` VALUES ('2014', '237', '乐平市', '3');
INSERT INTO `region` VALUES ('2015', '237', '浮梁县', '3');
INSERT INTO `region` VALUES ('2016', '238', '浔阳区', '3');
INSERT INTO `region` VALUES ('2017', '238', '庐山区', '3');
INSERT INTO `region` VALUES ('2018', '238', '瑞昌市', '3');
INSERT INTO `region` VALUES ('2019', '238', '九江县', '3');
INSERT INTO `region` VALUES ('2020', '238', '武宁县', '3');
INSERT INTO `region` VALUES ('2021', '238', '修水县', '3');
INSERT INTO `region` VALUES ('2022', '238', '永修县', '3');
INSERT INTO `region` VALUES ('2023', '238', '德安县', '3');
INSERT INTO `region` VALUES ('2024', '238', '星子县', '3');
INSERT INTO `region` VALUES ('2025', '238', '都昌县', '3');
INSERT INTO `region` VALUES ('2026', '238', '湖口县', '3');
INSERT INTO `region` VALUES ('2027', '238', '彭泽县', '3');
INSERT INTO `region` VALUES ('2028', '239', '安源区', '3');
INSERT INTO `region` VALUES ('2029', '239', '湘东区', '3');
INSERT INTO `region` VALUES ('2030', '239', '莲花县', '3');
INSERT INTO `region` VALUES ('2031', '239', '芦溪县', '3');
INSERT INTO `region` VALUES ('2032', '239', '上栗县', '3');
INSERT INTO `region` VALUES ('2033', '240', '信州区', '3');
INSERT INTO `region` VALUES ('2034', '240', '德兴市', '3');
INSERT INTO `region` VALUES ('2035', '240', '上饶县', '3');
INSERT INTO `region` VALUES ('2036', '240', '广丰县', '3');
INSERT INTO `region` VALUES ('2037', '240', '玉山县', '3');
INSERT INTO `region` VALUES ('2038', '240', '铅山县', '3');
INSERT INTO `region` VALUES ('2039', '240', '横峰县', '3');
INSERT INTO `region` VALUES ('2040', '240', '弋阳县', '3');
INSERT INTO `region` VALUES ('2041', '240', '余干县', '3');
INSERT INTO `region` VALUES ('2042', '240', '波阳县', '3');
INSERT INTO `region` VALUES ('2043', '240', '万年县', '3');
INSERT INTO `region` VALUES ('2044', '240', '婺源县', '3');
INSERT INTO `region` VALUES ('2045', '241', '渝水区', '3');
INSERT INTO `region` VALUES ('2046', '241', '分宜县', '3');
INSERT INTO `region` VALUES ('2047', '242', '袁州区', '3');
INSERT INTO `region` VALUES ('2048', '242', '丰城市', '3');
INSERT INTO `region` VALUES ('2049', '242', '樟树市', '3');
INSERT INTO `region` VALUES ('2050', '242', '高安市', '3');
INSERT INTO `region` VALUES ('2051', '242', '奉新县', '3');
INSERT INTO `region` VALUES ('2052', '242', '万载县', '3');
INSERT INTO `region` VALUES ('2053', '242', '上高县', '3');
INSERT INTO `region` VALUES ('2054', '242', '宜丰县', '3');
INSERT INTO `region` VALUES ('2055', '242', '靖安县', '3');
INSERT INTO `region` VALUES ('2056', '242', '铜鼓县', '3');
INSERT INTO `region` VALUES ('2057', '243', '月湖区', '3');
INSERT INTO `region` VALUES ('2058', '243', '贵溪市', '3');
INSERT INTO `region` VALUES ('2059', '243', '余江县', '3');
INSERT INTO `region` VALUES ('2060', '244', '沈河区', '3');
INSERT INTO `region` VALUES ('2061', '244', '皇姑区', '3');
INSERT INTO `region` VALUES ('2062', '244', '和平区', '3');
INSERT INTO `region` VALUES ('2063', '244', '大东区', '3');
INSERT INTO `region` VALUES ('2064', '244', '铁西区', '3');
INSERT INTO `region` VALUES ('2065', '244', '苏家屯区', '3');
INSERT INTO `region` VALUES ('2066', '244', '东陵区', '3');
INSERT INTO `region` VALUES ('2067', '244', '沈北新区', '3');
INSERT INTO `region` VALUES ('2068', '244', '于洪区', '3');
INSERT INTO `region` VALUES ('2069', '244', '浑南新区', '3');
INSERT INTO `region` VALUES ('2070', '244', '新民市', '3');
INSERT INTO `region` VALUES ('2071', '244', '辽中县', '3');
INSERT INTO `region` VALUES ('2072', '244', '康平县', '3');
INSERT INTO `region` VALUES ('2073', '244', '法库县', '3');
INSERT INTO `region` VALUES ('2074', '245', '西岗区', '3');
INSERT INTO `region` VALUES ('2075', '245', '中山区', '3');
INSERT INTO `region` VALUES ('2076', '245', '沙河口区', '3');
INSERT INTO `region` VALUES ('2077', '245', '甘井子区', '3');
INSERT INTO `region` VALUES ('2078', '245', '旅顺口区', '3');
INSERT INTO `region` VALUES ('2079', '245', '金州区', '3');
INSERT INTO `region` VALUES ('2080', '245', '开发区', '3');
INSERT INTO `region` VALUES ('2081', '245', '瓦房店市', '3');
INSERT INTO `region` VALUES ('2082', '245', '普兰店市', '3');
INSERT INTO `region` VALUES ('2083', '245', '庄河市', '3');
INSERT INTO `region` VALUES ('2084', '245', '长海县', '3');
INSERT INTO `region` VALUES ('2085', '246', '铁东区', '3');
INSERT INTO `region` VALUES ('2086', '246', '铁西区', '3');
INSERT INTO `region` VALUES ('2087', '246', '立山区', '3');
INSERT INTO `region` VALUES ('2088', '246', '千山区', '3');
INSERT INTO `region` VALUES ('2089', '246', '岫岩', '3');
INSERT INTO `region` VALUES ('2090', '246', '海城市', '3');
INSERT INTO `region` VALUES ('2091', '246', '台安县', '3');
INSERT INTO `region` VALUES ('2092', '247', '本溪', '3');
INSERT INTO `region` VALUES ('2093', '247', '平山区', '3');
INSERT INTO `region` VALUES ('2094', '247', '明山区', '3');
INSERT INTO `region` VALUES ('2095', '247', '溪湖区', '3');
INSERT INTO `region` VALUES ('2096', '247', '南芬区', '3');
INSERT INTO `region` VALUES ('2097', '247', '桓仁', '3');
INSERT INTO `region` VALUES ('2098', '248', '双塔区', '3');
INSERT INTO `region` VALUES ('2099', '248', '龙城区', '3');
INSERT INTO `region` VALUES ('2100', '248', '喀喇沁左翼蒙古族自治县', '3');
INSERT INTO `region` VALUES ('2101', '248', '北票市', '3');
INSERT INTO `region` VALUES ('2102', '248', '凌源市', '3');
INSERT INTO `region` VALUES ('2103', '248', '朝阳县', '3');
INSERT INTO `region` VALUES ('2104', '248', '建平县', '3');
INSERT INTO `region` VALUES ('2105', '249', '振兴区', '3');
INSERT INTO `region` VALUES ('2106', '249', '元宝区', '3');
INSERT INTO `region` VALUES ('2107', '249', '振安区', '3');
INSERT INTO `region` VALUES ('2108', '249', '宽甸', '3');
INSERT INTO `region` VALUES ('2109', '249', '东港市', '3');
INSERT INTO `region` VALUES ('2110', '249', '凤城市', '3');
INSERT INTO `region` VALUES ('2111', '250', '顺城区', '3');
INSERT INTO `region` VALUES ('2112', '250', '新抚区', '3');
INSERT INTO `region` VALUES ('2113', '250', '东洲区', '3');
INSERT INTO `region` VALUES ('2114', '250', '望花区', '3');
INSERT INTO `region` VALUES ('2115', '250', '清原', '3');
INSERT INTO `region` VALUES ('2116', '250', '新宾', '3');
INSERT INTO `region` VALUES ('2117', '250', '抚顺县', '3');
INSERT INTO `region` VALUES ('2118', '251', '阜新', '3');
INSERT INTO `region` VALUES ('2119', '251', '海州区', '3');
INSERT INTO `region` VALUES ('2120', '251', '新邱区', '3');
INSERT INTO `region` VALUES ('2121', '251', '太平区', '3');
INSERT INTO `region` VALUES ('2122', '251', '清河门区', '3');
INSERT INTO `region` VALUES ('2123', '251', '细河区', '3');
INSERT INTO `region` VALUES ('2124', '251', '彰武县', '3');
INSERT INTO `region` VALUES ('2125', '252', '龙港区', '3');
INSERT INTO `region` VALUES ('2126', '252', '南票区', '3');
INSERT INTO `region` VALUES ('2127', '252', '连山区', '3');
INSERT INTO `region` VALUES ('2128', '252', '兴城市', '3');
INSERT INTO `region` VALUES ('2129', '252', '绥中县', '3');
INSERT INTO `region` VALUES ('2130', '252', '建昌县', '3');
INSERT INTO `region` VALUES ('2131', '253', '太和区', '3');
INSERT INTO `region` VALUES ('2132', '253', '古塔区', '3');
INSERT INTO `region` VALUES ('2133', '253', '凌河区', '3');
INSERT INTO `region` VALUES ('2134', '253', '凌海市', '3');
INSERT INTO `region` VALUES ('2135', '253', '北镇市', '3');
INSERT INTO `region` VALUES ('2136', '253', '黑山县', '3');
INSERT INTO `region` VALUES ('2137', '253', '义县', '3');
INSERT INTO `region` VALUES ('2138', '254', '白塔区', '3');
INSERT INTO `region` VALUES ('2139', '254', '文圣区', '3');
INSERT INTO `region` VALUES ('2140', '254', '宏伟区', '3');
INSERT INTO `region` VALUES ('2141', '254', '太子河区', '3');
INSERT INTO `region` VALUES ('2142', '254', '弓长岭区', '3');
INSERT INTO `region` VALUES ('2143', '254', '灯塔市', '3');
INSERT INTO `region` VALUES ('2144', '254', '辽阳县', '3');
INSERT INTO `region` VALUES ('2145', '255', '双台子区', '3');
INSERT INTO `region` VALUES ('2146', '255', '兴隆台区', '3');
INSERT INTO `region` VALUES ('2147', '255', '大洼县', '3');
INSERT INTO `region` VALUES ('2148', '255', '盘山县', '3');
INSERT INTO `region` VALUES ('2149', '256', '银州区', '3');
INSERT INTO `region` VALUES ('2150', '256', '清河区', '3');
INSERT INTO `region` VALUES ('2151', '256', '调兵山市', '3');
INSERT INTO `region` VALUES ('2152', '256', '开原市', '3');
INSERT INTO `region` VALUES ('2153', '256', '铁岭县', '3');
INSERT INTO `region` VALUES ('2154', '256', '西丰县', '3');
INSERT INTO `region` VALUES ('2155', '256', '昌图县', '3');
INSERT INTO `region` VALUES ('2156', '257', '站前区', '3');
INSERT INTO `region` VALUES ('2157', '257', '西市区', '3');
INSERT INTO `region` VALUES ('2158', '257', '鲅鱼圈区', '3');
INSERT INTO `region` VALUES ('2159', '257', '老边区', '3');
INSERT INTO `region` VALUES ('2160', '257', '盖州市', '3');
INSERT INTO `region` VALUES ('2161', '257', '大石桥市', '3');
INSERT INTO `region` VALUES ('2162', '258', '回民区', '3');
INSERT INTO `region` VALUES ('2163', '258', '玉泉区', '3');
INSERT INTO `region` VALUES ('2164', '258', '新城区', '3');
INSERT INTO `region` VALUES ('2165', '258', '赛罕区', '3');
INSERT INTO `region` VALUES ('2166', '258', '清水河县', '3');
INSERT INTO `region` VALUES ('2167', '258', '土默特左旗', '3');
INSERT INTO `region` VALUES ('2168', '258', '托克托县', '3');
INSERT INTO `region` VALUES ('2169', '258', '和林格尔县', '3');
INSERT INTO `region` VALUES ('2170', '258', '武川县', '3');
INSERT INTO `region` VALUES ('2171', '259', '阿拉善左旗', '3');
INSERT INTO `region` VALUES ('2172', '259', '阿拉善右旗', '3');
INSERT INTO `region` VALUES ('2173', '259', '额济纳旗', '3');
INSERT INTO `region` VALUES ('2174', '260', '临河区', '3');
INSERT INTO `region` VALUES ('2175', '260', '五原县', '3');
INSERT INTO `region` VALUES ('2176', '260', '磴口县', '3');
INSERT INTO `region` VALUES ('2177', '260', '乌拉特前旗', '3');
INSERT INTO `region` VALUES ('2178', '260', '乌拉特中旗', '3');
INSERT INTO `region` VALUES ('2179', '260', '乌拉特后旗', '3');
INSERT INTO `region` VALUES ('2180', '260', '杭锦后旗', '3');
INSERT INTO `region` VALUES ('2181', '261', '昆都仑区', '3');
INSERT INTO `region` VALUES ('2182', '261', '青山区', '3');
INSERT INTO `region` VALUES ('2183', '261', '东河区', '3');
INSERT INTO `region` VALUES ('2184', '261', '九原区', '3');
INSERT INTO `region` VALUES ('2185', '261', '石拐区', '3');
INSERT INTO `region` VALUES ('2186', '261', '白云矿区', '3');
INSERT INTO `region` VALUES ('2187', '261', '土默特右旗', '3');
INSERT INTO `region` VALUES ('2188', '261', '固阳县', '3');
INSERT INTO `region` VALUES ('2189', '261', '达尔罕茂明安联合旗', '3');
INSERT INTO `region` VALUES ('2190', '262', '红山区', '3');
INSERT INTO `region` VALUES ('2191', '262', '元宝山区', '3');
INSERT INTO `region` VALUES ('2192', '262', '松山区', '3');
INSERT INTO `region` VALUES ('2193', '262', '阿鲁科尔沁旗', '3');
INSERT INTO `region` VALUES ('2194', '262', '巴林左旗', '3');
INSERT INTO `region` VALUES ('2195', '262', '巴林右旗', '3');
INSERT INTO `region` VALUES ('2196', '262', '林西县', '3');
INSERT INTO `region` VALUES ('2197', '262', '克什克腾旗', '3');
INSERT INTO `region` VALUES ('2198', '262', '翁牛特旗', '3');
INSERT INTO `region` VALUES ('2199', '262', '喀喇沁旗', '3');
INSERT INTO `region` VALUES ('2200', '262', '宁城县', '3');
INSERT INTO `region` VALUES ('2201', '262', '敖汉旗', '3');
INSERT INTO `region` VALUES ('2202', '263', '东胜区', '3');
INSERT INTO `region` VALUES ('2203', '263', '达拉特旗', '3');
INSERT INTO `region` VALUES ('2204', '263', '准格尔旗', '3');
INSERT INTO `region` VALUES ('2205', '263', '鄂托克前旗', '3');
INSERT INTO `region` VALUES ('2206', '263', '鄂托克旗', '3');
INSERT INTO `region` VALUES ('2207', '263', '杭锦旗', '3');
INSERT INTO `region` VALUES ('2208', '263', '乌审旗', '3');
INSERT INTO `region` VALUES ('2209', '263', '伊金霍洛旗', '3');
INSERT INTO `region` VALUES ('2210', '264', '海拉尔区', '3');
INSERT INTO `region` VALUES ('2211', '264', '莫力达瓦', '3');
INSERT INTO `region` VALUES ('2212', '264', '满洲里市', '3');
INSERT INTO `region` VALUES ('2213', '264', '牙克石市', '3');
INSERT INTO `region` VALUES ('2214', '264', '扎兰屯市', '3');
INSERT INTO `region` VALUES ('2215', '264', '额尔古纳市', '3');
INSERT INTO `region` VALUES ('2216', '264', '根河市', '3');
INSERT INTO `region` VALUES ('2217', '264', '阿荣旗', '3');
INSERT INTO `region` VALUES ('2218', '264', '鄂伦春自治旗', '3');
INSERT INTO `region` VALUES ('2219', '264', '鄂温克族自治旗', '3');
INSERT INTO `region` VALUES ('2220', '264', '陈巴尔虎旗', '3');
INSERT INTO `region` VALUES ('2221', '264', '新巴尔虎左旗', '3');
INSERT INTO `region` VALUES ('2222', '264', '新巴尔虎右旗', '3');
INSERT INTO `region` VALUES ('2223', '265', '科尔沁区', '3');
INSERT INTO `region` VALUES ('2224', '265', '霍林郭勒市', '3');
INSERT INTO `region` VALUES ('2225', '265', '科尔沁左翼中旗', '3');
INSERT INTO `region` VALUES ('2226', '265', '科尔沁左翼后旗', '3');
INSERT INTO `region` VALUES ('2227', '265', '开鲁县', '3');
INSERT INTO `region` VALUES ('2228', '265', '库伦旗', '3');
INSERT INTO `region` VALUES ('2229', '265', '奈曼旗', '3');
INSERT INTO `region` VALUES ('2230', '265', '扎鲁特旗', '3');
INSERT INTO `region` VALUES ('2231', '266', '海勃湾区', '3');
INSERT INTO `region` VALUES ('2232', '266', '乌达区', '3');
INSERT INTO `region` VALUES ('2233', '266', '海南区', '3');
INSERT INTO `region` VALUES ('2234', '267', '化德县', '3');
INSERT INTO `region` VALUES ('2235', '267', '集宁区', '3');
INSERT INTO `region` VALUES ('2236', '267', '丰镇市', '3');
INSERT INTO `region` VALUES ('2237', '267', '卓资县', '3');
INSERT INTO `region` VALUES ('2238', '267', '商都县', '3');
INSERT INTO `region` VALUES ('2239', '267', '兴和县', '3');
INSERT INTO `region` VALUES ('2240', '267', '凉城县', '3');
INSERT INTO `region` VALUES ('2241', '267', '察哈尔右翼前旗', '3');
INSERT INTO `region` VALUES ('2242', '267', '察哈尔右翼中旗', '3');
INSERT INTO `region` VALUES ('2243', '267', '察哈尔右翼后旗', '3');
INSERT INTO `region` VALUES ('2244', '267', '四子王旗', '3');
INSERT INTO `region` VALUES ('2245', '268', '二连浩特市', '3');
INSERT INTO `region` VALUES ('2246', '268', '锡林浩特市', '3');
INSERT INTO `region` VALUES ('2247', '268', '阿巴嘎旗', '3');
INSERT INTO `region` VALUES ('2248', '268', '苏尼特左旗', '3');
INSERT INTO `region` VALUES ('2249', '268', '苏尼特右旗', '3');
INSERT INTO `region` VALUES ('2250', '268', '东乌珠穆沁旗', '3');
INSERT INTO `region` VALUES ('2251', '268', '西乌珠穆沁旗', '3');
INSERT INTO `region` VALUES ('2252', '268', '太仆寺旗', '3');
INSERT INTO `region` VALUES ('2253', '268', '镶黄旗', '3');
INSERT INTO `region` VALUES ('2254', '268', '正镶白旗', '3');
INSERT INTO `region` VALUES ('2255', '268', '正蓝旗', '3');
INSERT INTO `region` VALUES ('2256', '268', '多伦县', '3');
INSERT INTO `region` VALUES ('2257', '269', '乌兰浩特市', '3');
INSERT INTO `region` VALUES ('2258', '269', '阿尔山市', '3');
INSERT INTO `region` VALUES ('2259', '269', '科尔沁右翼前旗', '3');
INSERT INTO `region` VALUES ('2260', '269', '科尔沁右翼中旗', '3');
INSERT INTO `region` VALUES ('2261', '269', '扎赉特旗', '3');
INSERT INTO `region` VALUES ('2262', '269', '突泉县', '3');
INSERT INTO `region` VALUES ('2263', '270', '西夏区', '3');
INSERT INTO `region` VALUES ('2264', '270', '金凤区', '3');
INSERT INTO `region` VALUES ('2265', '270', '兴庆区', '3');
INSERT INTO `region` VALUES ('2266', '270', '灵武市', '3');
INSERT INTO `region` VALUES ('2267', '270', '永宁县', '3');
INSERT INTO `region` VALUES ('2268', '270', '贺兰县', '3');
INSERT INTO `region` VALUES ('2269', '271', '原州区', '3');
INSERT INTO `region` VALUES ('2270', '271', '海原县', '3');
INSERT INTO `region` VALUES ('2271', '271', '西吉县', '3');
INSERT INTO `region` VALUES ('2272', '271', '隆德县', '3');
INSERT INTO `region` VALUES ('2273', '271', '泾源县', '3');
INSERT INTO `region` VALUES ('2274', '271', '彭阳县', '3');
INSERT INTO `region` VALUES ('2275', '272', '惠农县', '3');
INSERT INTO `region` VALUES ('2276', '272', '大武口区', '3');
INSERT INTO `region` VALUES ('2277', '272', '惠农区', '3');
INSERT INTO `region` VALUES ('2278', '272', '陶乐县', '3');
INSERT INTO `region` VALUES ('2279', '272', '平罗县', '3');
INSERT INTO `region` VALUES ('2280', '273', '利通区', '3');
INSERT INTO `region` VALUES ('2281', '273', '中卫县', '3');
INSERT INTO `region` VALUES ('2282', '273', '青铜峡市', '3');
INSERT INTO `region` VALUES ('2283', '273', '中宁县', '3');
INSERT INTO `region` VALUES ('2284', '273', '盐池县', '3');
INSERT INTO `region` VALUES ('2285', '273', '同心县', '3');
INSERT INTO `region` VALUES ('2286', '274', '沙坡头区', '3');
INSERT INTO `region` VALUES ('2287', '274', '海原县', '3');
INSERT INTO `region` VALUES ('2288', '274', '中宁县', '3');
INSERT INTO `region` VALUES ('2289', '275', '城中区', '3');
INSERT INTO `region` VALUES ('2290', '275', '城东区', '3');
INSERT INTO `region` VALUES ('2291', '275', '城西区', '3');
INSERT INTO `region` VALUES ('2292', '275', '城北区', '3');
INSERT INTO `region` VALUES ('2293', '275', '湟中县', '3');
INSERT INTO `region` VALUES ('2294', '275', '湟源县', '3');
INSERT INTO `region` VALUES ('2295', '275', '大通', '3');
INSERT INTO `region` VALUES ('2296', '276', '玛沁县', '3');
INSERT INTO `region` VALUES ('2297', '276', '班玛县', '3');
INSERT INTO `region` VALUES ('2298', '276', '甘德县', '3');
INSERT INTO `region` VALUES ('2299', '276', '达日县', '3');
INSERT INTO `region` VALUES ('2300', '276', '久治县', '3');
INSERT INTO `region` VALUES ('2301', '276', '玛多县', '3');
INSERT INTO `region` VALUES ('2302', '277', '海晏县', '3');
INSERT INTO `region` VALUES ('2303', '277', '祁连县', '3');
INSERT INTO `region` VALUES ('2304', '277', '刚察县', '3');
INSERT INTO `region` VALUES ('2305', '277', '门源', '3');
INSERT INTO `region` VALUES ('2306', '278', '平安县', '3');
INSERT INTO `region` VALUES ('2307', '278', '乐都县', '3');
INSERT INTO `region` VALUES ('2308', '278', '民和', '3');
INSERT INTO `region` VALUES ('2309', '278', '互助', '3');
INSERT INTO `region` VALUES ('2310', '278', '化隆', '3');
INSERT INTO `region` VALUES ('2311', '278', '循化', '3');
INSERT INTO `region` VALUES ('2312', '279', '共和县', '3');
INSERT INTO `region` VALUES ('2313', '279', '同德县', '3');
INSERT INTO `region` VALUES ('2314', '279', '贵德县', '3');
INSERT INTO `region` VALUES ('2315', '279', '兴海县', '3');
INSERT INTO `region` VALUES ('2316', '279', '贵南县', '3');
INSERT INTO `region` VALUES ('2317', '280', '德令哈市', '3');
INSERT INTO `region` VALUES ('2318', '280', '格尔木市', '3');
INSERT INTO `region` VALUES ('2319', '280', '乌兰县', '3');
INSERT INTO `region` VALUES ('2320', '280', '都兰县', '3');
INSERT INTO `region` VALUES ('2321', '280', '天峻县', '3');
INSERT INTO `region` VALUES ('2322', '281', '同仁县', '3');
INSERT INTO `region` VALUES ('2323', '281', '尖扎县', '3');
INSERT INTO `region` VALUES ('2324', '281', '泽库县', '3');
INSERT INTO `region` VALUES ('2325', '281', '河南蒙古族自治县', '3');
INSERT INTO `region` VALUES ('2326', '282', '玉树县', '3');
INSERT INTO `region` VALUES ('2327', '282', '杂多县', '3');
INSERT INTO `region` VALUES ('2328', '282', '称多县', '3');
INSERT INTO `region` VALUES ('2329', '282', '治多县', '3');
INSERT INTO `region` VALUES ('2330', '282', '囊谦县', '3');
INSERT INTO `region` VALUES ('2331', '282', '曲麻莱县', '3');
INSERT INTO `region` VALUES ('2332', '283', '市中区', '3');
INSERT INTO `region` VALUES ('2333', '283', '历下区', '3');
INSERT INTO `region` VALUES ('2334', '283', '天桥区', '3');
INSERT INTO `region` VALUES ('2335', '283', '槐荫区', '3');
INSERT INTO `region` VALUES ('2336', '283', '历城区', '3');
INSERT INTO `region` VALUES ('2337', '283', '长清区', '3');
INSERT INTO `region` VALUES ('2338', '283', '章丘市', '3');
INSERT INTO `region` VALUES ('2339', '283', '平阴县', '3');
INSERT INTO `region` VALUES ('2340', '283', '济阳县', '3');
INSERT INTO `region` VALUES ('2341', '283', '商河县', '3');
INSERT INTO `region` VALUES ('2342', '284', '市南区', '3');
INSERT INTO `region` VALUES ('2343', '284', '市北区', '3');
INSERT INTO `region` VALUES ('2344', '284', '城阳区', '3');
INSERT INTO `region` VALUES ('2345', '284', '四方区', '3');
INSERT INTO `region` VALUES ('2346', '284', '李沧区', '3');
INSERT INTO `region` VALUES ('2347', '284', '黄岛区', '3');
INSERT INTO `region` VALUES ('2348', '284', '崂山区', '3');
INSERT INTO `region` VALUES ('2349', '284', '胶州市', '3');
INSERT INTO `region` VALUES ('2350', '284', '即墨市', '3');
INSERT INTO `region` VALUES ('2351', '284', '平度市', '3');
INSERT INTO `region` VALUES ('2352', '284', '胶南市', '3');
INSERT INTO `region` VALUES ('2353', '284', '莱西市', '3');
INSERT INTO `region` VALUES ('2354', '285', '滨城区', '3');
INSERT INTO `region` VALUES ('2355', '285', '惠民县', '3');
INSERT INTO `region` VALUES ('2356', '285', '阳信县', '3');
INSERT INTO `region` VALUES ('2357', '285', '无棣县', '3');
INSERT INTO `region` VALUES ('2358', '285', '沾化县', '3');
INSERT INTO `region` VALUES ('2359', '285', '博兴县', '3');
INSERT INTO `region` VALUES ('2360', '285', '邹平县', '3');
INSERT INTO `region` VALUES ('2361', '286', '德城区', '3');
INSERT INTO `region` VALUES ('2362', '286', '陵县', '3');
INSERT INTO `region` VALUES ('2363', '286', '乐陵市', '3');
INSERT INTO `region` VALUES ('2364', '286', '禹城市', '3');
INSERT INTO `region` VALUES ('2365', '286', '宁津县', '3');
INSERT INTO `region` VALUES ('2366', '286', '庆云县', '3');
INSERT INTO `region` VALUES ('2367', '286', '临邑县', '3');
INSERT INTO `region` VALUES ('2368', '286', '齐河县', '3');
INSERT INTO `region` VALUES ('2369', '286', '平原县', '3');
INSERT INTO `region` VALUES ('2370', '286', '夏津县', '3');
INSERT INTO `region` VALUES ('2371', '286', '武城县', '3');
INSERT INTO `region` VALUES ('2372', '287', '东营区', '3');
INSERT INTO `region` VALUES ('2373', '287', '河口区', '3');
INSERT INTO `region` VALUES ('2374', '287', '垦利县', '3');
INSERT INTO `region` VALUES ('2375', '287', '利津县', '3');
INSERT INTO `region` VALUES ('2376', '287', '广饶县', '3');
INSERT INTO `region` VALUES ('2377', '288', '牡丹区', '3');
INSERT INTO `region` VALUES ('2378', '288', '曹县', '3');
INSERT INTO `region` VALUES ('2379', '288', '单县', '3');
INSERT INTO `region` VALUES ('2380', '288', '成武县', '3');
INSERT INTO `region` VALUES ('2381', '288', '巨野县', '3');
INSERT INTO `region` VALUES ('2382', '288', '郓城县', '3');
INSERT INTO `region` VALUES ('2383', '288', '鄄城县', '3');
INSERT INTO `region` VALUES ('2384', '288', '定陶县', '3');
INSERT INTO `region` VALUES ('2385', '288', '东明县', '3');
INSERT INTO `region` VALUES ('2386', '289', '市中区', '3');
INSERT INTO `region` VALUES ('2387', '289', '任城区', '3');
INSERT INTO `region` VALUES ('2388', '289', '曲阜市', '3');
INSERT INTO `region` VALUES ('2389', '289', '兖州市', '3');
INSERT INTO `region` VALUES ('2390', '289', '邹城市', '3');
INSERT INTO `region` VALUES ('2391', '289', '微山县', '3');
INSERT INTO `region` VALUES ('2392', '289', '鱼台县', '3');
INSERT INTO `region` VALUES ('2393', '289', '金乡县', '3');
INSERT INTO `region` VALUES ('2394', '289', '嘉祥县', '3');
INSERT INTO `region` VALUES ('2395', '289', '汶上县', '3');
INSERT INTO `region` VALUES ('2396', '289', '泗水县', '3');
INSERT INTO `region` VALUES ('2397', '289', '梁山县', '3');
INSERT INTO `region` VALUES ('2398', '290', '莱城区', '3');
INSERT INTO `region` VALUES ('2399', '290', '钢城区', '3');
INSERT INTO `region` VALUES ('2400', '291', '东昌府区', '3');
INSERT INTO `region` VALUES ('2401', '291', '临清市', '3');
INSERT INTO `region` VALUES ('2402', '291', '阳谷县', '3');
INSERT INTO `region` VALUES ('2403', '291', '莘县', '3');
INSERT INTO `region` VALUES ('2404', '291', '茌平县', '3');
INSERT INTO `region` VALUES ('2405', '291', '东阿县', '3');
INSERT INTO `region` VALUES ('2406', '291', '冠县', '3');
INSERT INTO `region` VALUES ('2407', '291', '高唐县', '3');
INSERT INTO `region` VALUES ('2408', '292', '兰山区', '3');
INSERT INTO `region` VALUES ('2409', '292', '罗庄区', '3');
INSERT INTO `region` VALUES ('2410', '292', '河东区', '3');
INSERT INTO `region` VALUES ('2411', '292', '沂南县', '3');
INSERT INTO `region` VALUES ('2412', '292', '郯城县', '3');
INSERT INTO `region` VALUES ('2413', '292', '沂水县', '3');
INSERT INTO `region` VALUES ('2414', '292', '苍山县', '3');
INSERT INTO `region` VALUES ('2415', '292', '费县', '3');
INSERT INTO `region` VALUES ('2416', '292', '平邑县', '3');
INSERT INTO `region` VALUES ('2417', '292', '莒南县', '3');
INSERT INTO `region` VALUES ('2418', '292', '蒙阴县', '3');
INSERT INTO `region` VALUES ('2419', '292', '临沭县', '3');
INSERT INTO `region` VALUES ('2420', '293', '东港区', '3');
INSERT INTO `region` VALUES ('2421', '293', '岚山区', '3');
INSERT INTO `region` VALUES ('2422', '293', '五莲县', '3');
INSERT INTO `region` VALUES ('2423', '293', '莒县', '3');
INSERT INTO `region` VALUES ('2424', '294', '泰山区', '3');
INSERT INTO `region` VALUES ('2425', '294', '岱岳区', '3');
INSERT INTO `region` VALUES ('2426', '294', '新泰市', '3');
INSERT INTO `region` VALUES ('2427', '294', '肥城市', '3');
INSERT INTO `region` VALUES ('2428', '294', '宁阳县', '3');
INSERT INTO `region` VALUES ('2429', '294', '东平县', '3');
INSERT INTO `region` VALUES ('2430', '295', '荣成市', '3');
INSERT INTO `region` VALUES ('2431', '295', '乳山市', '3');
INSERT INTO `region` VALUES ('2432', '295', '环翠区', '3');
INSERT INTO `region` VALUES ('2433', '295', '文登市', '3');
INSERT INTO `region` VALUES ('2434', '296', '潍城区', '3');
INSERT INTO `region` VALUES ('2435', '296', '寒亭区', '3');
INSERT INTO `region` VALUES ('2436', '296', '坊子区', '3');
INSERT INTO `region` VALUES ('2437', '296', '奎文区', '3');
INSERT INTO `region` VALUES ('2438', '296', '青州市', '3');
INSERT INTO `region` VALUES ('2439', '296', '诸城市', '3');
INSERT INTO `region` VALUES ('2440', '296', '寿光市', '3');
INSERT INTO `region` VALUES ('2441', '296', '安丘市', '3');
INSERT INTO `region` VALUES ('2442', '296', '高密市', '3');
INSERT INTO `region` VALUES ('2443', '296', '昌邑市', '3');
INSERT INTO `region` VALUES ('2444', '296', '临朐县', '3');
INSERT INTO `region` VALUES ('2445', '296', '昌乐县', '3');
INSERT INTO `region` VALUES ('2446', '297', '芝罘区', '3');
INSERT INTO `region` VALUES ('2447', '297', '福山区', '3');
INSERT INTO `region` VALUES ('2448', '297', '牟平区', '3');
INSERT INTO `region` VALUES ('2449', '297', '莱山区', '3');
INSERT INTO `region` VALUES ('2450', '297', '开发区', '3');
INSERT INTO `region` VALUES ('2451', '297', '龙口市', '3');
INSERT INTO `region` VALUES ('2452', '297', '莱阳市', '3');
INSERT INTO `region` VALUES ('2453', '297', '莱州市', '3');
INSERT INTO `region` VALUES ('2454', '297', '蓬莱市', '3');
INSERT INTO `region` VALUES ('2455', '297', '招远市', '3');
INSERT INTO `region` VALUES ('2456', '297', '栖霞市', '3');
INSERT INTO `region` VALUES ('2457', '297', '海阳市', '3');
INSERT INTO `region` VALUES ('2458', '297', '长岛县', '3');
INSERT INTO `region` VALUES ('2459', '298', '市中区', '3');
INSERT INTO `region` VALUES ('2460', '298', '山亭区', '3');
INSERT INTO `region` VALUES ('2461', '298', '峄城区', '3');
INSERT INTO `region` VALUES ('2462', '298', '台儿庄区', '3');
INSERT INTO `region` VALUES ('2463', '298', '薛城区', '3');
INSERT INTO `region` VALUES ('2464', '298', '滕州市', '3');
INSERT INTO `region` VALUES ('2465', '299', '张店区', '3');
INSERT INTO `region` VALUES ('2466', '299', '临淄区', '3');
INSERT INTO `region` VALUES ('2467', '299', '淄川区', '3');
INSERT INTO `region` VALUES ('2468', '299', '博山区', '3');
INSERT INTO `region` VALUES ('2469', '299', '周村区', '3');
INSERT INTO `region` VALUES ('2470', '299', '桓台县', '3');
INSERT INTO `region` VALUES ('2471', '299', '高青县', '3');
INSERT INTO `region` VALUES ('2472', '299', '沂源县', '3');
INSERT INTO `region` VALUES ('2473', '300', '杏花岭区', '3');
INSERT INTO `region` VALUES ('2474', '300', '小店区', '3');
INSERT INTO `region` VALUES ('2475', '300', '迎泽区', '3');
INSERT INTO `region` VALUES ('2476', '300', '尖草坪区', '3');
INSERT INTO `region` VALUES ('2477', '300', '万柏林区', '3');
INSERT INTO `region` VALUES ('2478', '300', '晋源区', '3');
INSERT INTO `region` VALUES ('2479', '300', '高新开发区', '3');
INSERT INTO `region` VALUES ('2480', '300', '民营经济开发区', '3');
INSERT INTO `region` VALUES ('2481', '300', '经济技术开发区', '3');
INSERT INTO `region` VALUES ('2482', '300', '清徐县', '3');
INSERT INTO `region` VALUES ('2483', '300', '阳曲县', '3');
INSERT INTO `region` VALUES ('2484', '300', '娄烦县', '3');
INSERT INTO `region` VALUES ('2485', '300', '古交市', '3');
INSERT INTO `region` VALUES ('2486', '301', '城区', '3');
INSERT INTO `region` VALUES ('2487', '301', '郊区', '3');
INSERT INTO `region` VALUES ('2488', '301', '沁县', '3');
INSERT INTO `region` VALUES ('2489', '301', '潞城市', '3');
INSERT INTO `region` VALUES ('2490', '301', '长治县', '3');
INSERT INTO `region` VALUES ('2491', '301', '襄垣县', '3');
INSERT INTO `region` VALUES ('2492', '301', '屯留县', '3');
INSERT INTO `region` VALUES ('2493', '301', '平顺县', '3');
INSERT INTO `region` VALUES ('2494', '301', '黎城县', '3');
INSERT INTO `region` VALUES ('2495', '301', '壶关县', '3');
INSERT INTO `region` VALUES ('2496', '301', '长子县', '3');
INSERT INTO `region` VALUES ('2497', '301', '武乡县', '3');
INSERT INTO `region` VALUES ('2498', '301', '沁源县', '3');
INSERT INTO `region` VALUES ('2499', '302', '城区', '3');
INSERT INTO `region` VALUES ('2500', '302', '矿区', '3');
INSERT INTO `region` VALUES ('2501', '302', '南郊区', '3');
INSERT INTO `region` VALUES ('2502', '302', '新荣区', '3');
INSERT INTO `region` VALUES ('2503', '302', '阳高县', '3');
INSERT INTO `region` VALUES ('2504', '302', '天镇县', '3');
INSERT INTO `region` VALUES ('2505', '302', '广灵县', '3');
INSERT INTO `region` VALUES ('2506', '302', '灵丘县', '3');
INSERT INTO `region` VALUES ('2507', '302', '浑源县', '3');
INSERT INTO `region` VALUES ('2508', '302', '左云县', '3');
INSERT INTO `region` VALUES ('2509', '302', '大同县', '3');
INSERT INTO `region` VALUES ('2510', '303', '城区', '3');
INSERT INTO `region` VALUES ('2511', '303', '高平市', '3');
INSERT INTO `region` VALUES ('2512', '303', '沁水县', '3');
INSERT INTO `region` VALUES ('2513', '303', '阳城县', '3');
INSERT INTO `region` VALUES ('2514', '303', '陵川县', '3');
INSERT INTO `region` VALUES ('2515', '303', '泽州县', '3');
INSERT INTO `region` VALUES ('2516', '304', '榆次区', '3');
INSERT INTO `region` VALUES ('2517', '304', '介休市', '3');
INSERT INTO `region` VALUES ('2518', '304', '榆社县', '3');
INSERT INTO `region` VALUES ('2519', '304', '左权县', '3');
INSERT INTO `region` VALUES ('2520', '304', '和顺县', '3');
INSERT INTO `region` VALUES ('2521', '304', '昔阳县', '3');
INSERT INTO `region` VALUES ('2522', '304', '寿阳县', '3');
INSERT INTO `region` VALUES ('2523', '304', '太谷县', '3');
INSERT INTO `region` VALUES ('2524', '304', '祁县', '3');
INSERT INTO `region` VALUES ('2525', '304', '平遥县', '3');
INSERT INTO `region` VALUES ('2526', '304', '灵石县', '3');
INSERT INTO `region` VALUES ('2527', '305', '尧都区', '3');
INSERT INTO `region` VALUES ('2528', '305', '侯马市', '3');
INSERT INTO `region` VALUES ('2529', '305', '霍州市', '3');
INSERT INTO `region` VALUES ('2530', '305', '曲沃县', '3');
INSERT INTO `region` VALUES ('2531', '305', '翼城县', '3');
INSERT INTO `region` VALUES ('2532', '305', '襄汾县', '3');
INSERT INTO `region` VALUES ('2533', '305', '洪洞县', '3');
INSERT INTO `region` VALUES ('2534', '305', '吉县', '3');
INSERT INTO `region` VALUES ('2535', '305', '安泽县', '3');
INSERT INTO `region` VALUES ('2536', '305', '浮山县', '3');
INSERT INTO `region` VALUES ('2537', '305', '古县', '3');
INSERT INTO `region` VALUES ('2538', '305', '乡宁县', '3');
INSERT INTO `region` VALUES ('2539', '305', '大宁县', '3');
INSERT INTO `region` VALUES ('2540', '305', '隰县', '3');
INSERT INTO `region` VALUES ('2541', '305', '永和县', '3');
INSERT INTO `region` VALUES ('2542', '305', '蒲县', '3');
INSERT INTO `region` VALUES ('2543', '305', '汾西县', '3');
INSERT INTO `region` VALUES ('2544', '306', '离石市', '3');
INSERT INTO `region` VALUES ('2545', '306', '离石区', '3');
INSERT INTO `region` VALUES ('2546', '306', '孝义市', '3');
INSERT INTO `region` VALUES ('2547', '306', '汾阳市', '3');
INSERT INTO `region` VALUES ('2548', '306', '文水县', '3');
INSERT INTO `region` VALUES ('2549', '306', '交城县', '3');
INSERT INTO `region` VALUES ('2550', '306', '兴县', '3');
INSERT INTO `region` VALUES ('2551', '306', '临县', '3');
INSERT INTO `region` VALUES ('2552', '306', '柳林县', '3');
INSERT INTO `region` VALUES ('2553', '306', '石楼县', '3');
INSERT INTO `region` VALUES ('2554', '306', '岚县', '3');
INSERT INTO `region` VALUES ('2555', '306', '方山县', '3');
INSERT INTO `region` VALUES ('2556', '306', '中阳县', '3');
INSERT INTO `region` VALUES ('2557', '306', '交口县', '3');
INSERT INTO `region` VALUES ('2558', '307', '朔城区', '3');
INSERT INTO `region` VALUES ('2559', '307', '平鲁区', '3');
INSERT INTO `region` VALUES ('2560', '307', '山阴县', '3');
INSERT INTO `region` VALUES ('2561', '307', '应县', '3');
INSERT INTO `region` VALUES ('2562', '307', '右玉县', '3');
INSERT INTO `region` VALUES ('2563', '307', '怀仁县', '3');
INSERT INTO `region` VALUES ('2564', '308', '忻府区', '3');
INSERT INTO `region` VALUES ('2565', '308', '原平市', '3');
INSERT INTO `region` VALUES ('2566', '308', '定襄县', '3');
INSERT INTO `region` VALUES ('2567', '308', '五台县', '3');
INSERT INTO `region` VALUES ('2568', '308', '代县', '3');
INSERT INTO `region` VALUES ('2569', '308', '繁峙县', '3');
INSERT INTO `region` VALUES ('2570', '308', '宁武县', '3');
INSERT INTO `region` VALUES ('2571', '308', '静乐县', '3');
INSERT INTO `region` VALUES ('2572', '308', '神池县', '3');
INSERT INTO `region` VALUES ('2573', '308', '五寨县', '3');
INSERT INTO `region` VALUES ('2574', '308', '岢岚县', '3');
INSERT INTO `region` VALUES ('2575', '308', '河曲县', '3');
INSERT INTO `region` VALUES ('2576', '308', '保德县', '3');
INSERT INTO `region` VALUES ('2577', '308', '偏关县', '3');
INSERT INTO `region` VALUES ('2578', '309', '城区', '3');
INSERT INTO `region` VALUES ('2579', '309', '矿区', '3');
INSERT INTO `region` VALUES ('2580', '309', '郊区', '3');
INSERT INTO `region` VALUES ('2581', '309', '平定县', '3');
INSERT INTO `region` VALUES ('2582', '309', '盂县', '3');
INSERT INTO `region` VALUES ('2583', '310', '盐湖区', '3');
INSERT INTO `region` VALUES ('2584', '310', '永济市', '3');
INSERT INTO `region` VALUES ('2585', '310', '河津市', '3');
INSERT INTO `region` VALUES ('2586', '310', '临猗县', '3');
INSERT INTO `region` VALUES ('2587', '310', '万荣县', '3');
INSERT INTO `region` VALUES ('2588', '310', '闻喜县', '3');
INSERT INTO `region` VALUES ('2589', '310', '稷山县', '3');
INSERT INTO `region` VALUES ('2590', '310', '新绛县', '3');
INSERT INTO `region` VALUES ('2591', '310', '绛县', '3');
INSERT INTO `region` VALUES ('2592', '310', '垣曲县', '3');
INSERT INTO `region` VALUES ('2593', '310', '夏县', '3');
INSERT INTO `region` VALUES ('2594', '310', '平陆县', '3');
INSERT INTO `region` VALUES ('2595', '310', '芮城县', '3');
INSERT INTO `region` VALUES ('2596', '311', '莲湖区', '3');
INSERT INTO `region` VALUES ('2597', '311', '新城区', '3');
INSERT INTO `region` VALUES ('2598', '311', '碑林区', '3');
INSERT INTO `region` VALUES ('2599', '311', '雁塔区', '3');
INSERT INTO `region` VALUES ('2600', '311', '灞桥区', '3');
INSERT INTO `region` VALUES ('2601', '311', '未央区', '3');
INSERT INTO `region` VALUES ('2602', '311', '阎良区', '3');
INSERT INTO `region` VALUES ('2603', '311', '临潼区', '3');
INSERT INTO `region` VALUES ('2604', '311', '长安区', '3');
INSERT INTO `region` VALUES ('2605', '311', '蓝田县', '3');
INSERT INTO `region` VALUES ('2606', '311', '周至县', '3');
INSERT INTO `region` VALUES ('2607', '311', '户县', '3');
INSERT INTO `region` VALUES ('2608', '311', '高陵县', '3');
INSERT INTO `region` VALUES ('2609', '312', '汉滨区', '3');
INSERT INTO `region` VALUES ('2610', '312', '汉阴县', '3');
INSERT INTO `region` VALUES ('2611', '312', '石泉县', '3');
INSERT INTO `region` VALUES ('2612', '312', '宁陕县', '3');
INSERT INTO `region` VALUES ('2613', '312', '紫阳县', '3');
INSERT INTO `region` VALUES ('2614', '312', '岚皋县', '3');
INSERT INTO `region` VALUES ('2615', '312', '平利县', '3');
INSERT INTO `region` VALUES ('2616', '312', '镇坪县', '3');
INSERT INTO `region` VALUES ('2617', '312', '旬阳县', '3');
INSERT INTO `region` VALUES ('2618', '312', '白河县', '3');
INSERT INTO `region` VALUES ('2619', '313', '陈仓区', '3');
INSERT INTO `region` VALUES ('2620', '313', '渭滨区', '3');
INSERT INTO `region` VALUES ('2621', '313', '金台区', '3');
INSERT INTO `region` VALUES ('2622', '313', '凤翔县', '3');
INSERT INTO `region` VALUES ('2623', '313', '岐山县', '3');
INSERT INTO `region` VALUES ('2624', '313', '扶风县', '3');
INSERT INTO `region` VALUES ('2625', '313', '眉县', '3');
INSERT INTO `region` VALUES ('2626', '313', '陇县', '3');
INSERT INTO `region` VALUES ('2627', '313', '千阳县', '3');
INSERT INTO `region` VALUES ('2628', '313', '麟游县', '3');
INSERT INTO `region` VALUES ('2629', '313', '凤县', '3');
INSERT INTO `region` VALUES ('2630', '313', '太白县', '3');
INSERT INTO `region` VALUES ('2631', '314', '汉台区', '3');
INSERT INTO `region` VALUES ('2632', '314', '南郑县', '3');
INSERT INTO `region` VALUES ('2633', '314', '城固县', '3');
INSERT INTO `region` VALUES ('2634', '314', '洋县', '3');
INSERT INTO `region` VALUES ('2635', '314', '西乡县', '3');
INSERT INTO `region` VALUES ('2636', '314', '勉县', '3');
INSERT INTO `region` VALUES ('2637', '314', '宁强县', '3');
INSERT INTO `region` VALUES ('2638', '314', '略阳县', '3');
INSERT INTO `region` VALUES ('2639', '314', '镇巴县', '3');
INSERT INTO `region` VALUES ('2640', '314', '留坝县', '3');
INSERT INTO `region` VALUES ('2641', '314', '佛坪县', '3');
INSERT INTO `region` VALUES ('2642', '315', '商州区', '3');
INSERT INTO `region` VALUES ('2643', '315', '洛南县', '3');
INSERT INTO `region` VALUES ('2644', '315', '丹凤县', '3');
INSERT INTO `region` VALUES ('2645', '315', '商南县', '3');
INSERT INTO `region` VALUES ('2646', '315', '山阳县', '3');
INSERT INTO `region` VALUES ('2647', '315', '镇安县', '3');
INSERT INTO `region` VALUES ('2648', '315', '柞水县', '3');
INSERT INTO `region` VALUES ('2649', '316', '耀州区', '3');
INSERT INTO `region` VALUES ('2650', '316', '王益区', '3');
INSERT INTO `region` VALUES ('2651', '316', '印台区', '3');
INSERT INTO `region` VALUES ('2652', '316', '宜君县', '3');
INSERT INTO `region` VALUES ('2653', '317', '临渭区', '3');
INSERT INTO `region` VALUES ('2654', '317', '韩城市', '3');
INSERT INTO `region` VALUES ('2655', '317', '华阴市', '3');
INSERT INTO `region` VALUES ('2656', '317', '华县', '3');
INSERT INTO `region` VALUES ('2657', '317', '潼关县', '3');
INSERT INTO `region` VALUES ('2658', '317', '大荔县', '3');
INSERT INTO `region` VALUES ('2659', '317', '合阳县', '3');
INSERT INTO `region` VALUES ('2660', '317', '澄城县', '3');
INSERT INTO `region` VALUES ('2661', '317', '蒲城县', '3');
INSERT INTO `region` VALUES ('2662', '317', '白水县', '3');
INSERT INTO `region` VALUES ('2663', '317', '富平县', '3');
INSERT INTO `region` VALUES ('2664', '318', '秦都区', '3');
INSERT INTO `region` VALUES ('2665', '318', '渭城区', '3');
INSERT INTO `region` VALUES ('2666', '318', '杨陵区', '3');
INSERT INTO `region` VALUES ('2667', '318', '兴平市', '3');
INSERT INTO `region` VALUES ('2668', '318', '三原县', '3');
INSERT INTO `region` VALUES ('2669', '318', '泾阳县', '3');
INSERT INTO `region` VALUES ('2670', '318', '乾县', '3');
INSERT INTO `region` VALUES ('2671', '318', '礼泉县', '3');
INSERT INTO `region` VALUES ('2672', '318', '永寿县', '3');
INSERT INTO `region` VALUES ('2673', '318', '彬县', '3');
INSERT INTO `region` VALUES ('2674', '318', '长武县', '3');
INSERT INTO `region` VALUES ('2675', '318', '旬邑县', '3');
INSERT INTO `region` VALUES ('2676', '318', '淳化县', '3');
INSERT INTO `region` VALUES ('2677', '318', '武功县', '3');
INSERT INTO `region` VALUES ('2678', '319', '吴起县', '3');
INSERT INTO `region` VALUES ('2679', '319', '宝塔区', '3');
INSERT INTO `region` VALUES ('2680', '319', '延长县', '3');
INSERT INTO `region` VALUES ('2681', '319', '延川县', '3');
INSERT INTO `region` VALUES ('2682', '319', '子长县', '3');
INSERT INTO `region` VALUES ('2683', '319', '安塞县', '3');
INSERT INTO `region` VALUES ('2684', '319', '志丹县', '3');
INSERT INTO `region` VALUES ('2685', '319', '甘泉县', '3');
INSERT INTO `region` VALUES ('2686', '319', '富县', '3');
INSERT INTO `region` VALUES ('2687', '319', '洛川县', '3');
INSERT INTO `region` VALUES ('2688', '319', '宜川县', '3');
INSERT INTO `region` VALUES ('2689', '319', '黄龙县', '3');
INSERT INTO `region` VALUES ('2690', '319', '黄陵县', '3');
INSERT INTO `region` VALUES ('2691', '320', '榆阳区', '3');
INSERT INTO `region` VALUES ('2692', '320', '神木县', '3');
INSERT INTO `region` VALUES ('2693', '320', '府谷县', '3');
INSERT INTO `region` VALUES ('2694', '320', '横山县', '3');
INSERT INTO `region` VALUES ('2695', '320', '靖边县', '3');
INSERT INTO `region` VALUES ('2696', '320', '定边县', '3');
INSERT INTO `region` VALUES ('2697', '320', '绥德县', '3');
INSERT INTO `region` VALUES ('2698', '320', '米脂县', '3');
INSERT INTO `region` VALUES ('2699', '320', '佳县', '3');
INSERT INTO `region` VALUES ('2700', '320', '吴堡县', '3');
INSERT INTO `region` VALUES ('2701', '320', '清涧县', '3');
INSERT INTO `region` VALUES ('2702', '320', '子洲县', '3');
INSERT INTO `region` VALUES ('2703', '321', '长宁区', '3');
INSERT INTO `region` VALUES ('2704', '321', '闸北区', '3');
INSERT INTO `region` VALUES ('2705', '321', '闵行区', '3');
INSERT INTO `region` VALUES ('2706', '321', '徐汇区', '3');
INSERT INTO `region` VALUES ('2707', '321', '浦东新区', '3');
INSERT INTO `region` VALUES ('2708', '321', '杨浦区', '3');
INSERT INTO `region` VALUES ('2709', '321', '普陀区', '3');
INSERT INTO `region` VALUES ('2710', '321', '静安区', '3');
INSERT INTO `region` VALUES ('2711', '321', '卢湾区', '3');
INSERT INTO `region` VALUES ('2712', '321', '虹口区', '3');
INSERT INTO `region` VALUES ('2713', '321', '黄浦区', '3');
INSERT INTO `region` VALUES ('2714', '321', '南汇区', '3');
INSERT INTO `region` VALUES ('2715', '321', '松江区', '3');
INSERT INTO `region` VALUES ('2716', '321', '嘉定区', '3');
INSERT INTO `region` VALUES ('2717', '321', '宝山区', '3');
INSERT INTO `region` VALUES ('2718', '321', '青浦区', '3');
INSERT INTO `region` VALUES ('2719', '321', '金山区', '3');
INSERT INTO `region` VALUES ('2720', '321', '奉贤区', '3');
INSERT INTO `region` VALUES ('2721', '321', '崇明县', '3');
INSERT INTO `region` VALUES ('2722', '322', '青羊区', '3');
INSERT INTO `region` VALUES ('2723', '322', '锦江区', '3');
INSERT INTO `region` VALUES ('2724', '322', '金牛区', '3');
INSERT INTO `region` VALUES ('2725', '322', '武侯区', '3');
INSERT INTO `region` VALUES ('2726', '322', '成华区', '3');
INSERT INTO `region` VALUES ('2727', '322', '龙泉驿区', '3');
INSERT INTO `region` VALUES ('2728', '322', '青白江区', '3');
INSERT INTO `region` VALUES ('2729', '322', '新都区', '3');
INSERT INTO `region` VALUES ('2730', '322', '温江区', '3');
INSERT INTO `region` VALUES ('2731', '322', '高新区', '3');
INSERT INTO `region` VALUES ('2732', '322', '高新西区', '3');
INSERT INTO `region` VALUES ('2733', '322', '都江堰市', '3');
INSERT INTO `region` VALUES ('2734', '322', '彭州市', '3');
INSERT INTO `region` VALUES ('2735', '322', '邛崃市', '3');
INSERT INTO `region` VALUES ('2736', '322', '崇州市', '3');
INSERT INTO `region` VALUES ('2737', '322', '金堂县', '3');
INSERT INTO `region` VALUES ('2738', '322', '双流县', '3');
INSERT INTO `region` VALUES ('2739', '322', '郫县', '3');
INSERT INTO `region` VALUES ('2740', '322', '大邑县', '3');
INSERT INTO `region` VALUES ('2741', '322', '蒲江县', '3');
INSERT INTO `region` VALUES ('2742', '322', '新津县', '3');
INSERT INTO `region` VALUES ('2743', '322', '都江堰市', '3');
INSERT INTO `region` VALUES ('2744', '322', '彭州市', '3');
INSERT INTO `region` VALUES ('2745', '322', '邛崃市', '3');
INSERT INTO `region` VALUES ('2746', '322', '崇州市', '3');
INSERT INTO `region` VALUES ('2747', '322', '金堂县', '3');
INSERT INTO `region` VALUES ('2748', '322', '双流县', '3');
INSERT INTO `region` VALUES ('2749', '322', '郫县', '3');
INSERT INTO `region` VALUES ('2750', '322', '大邑县', '3');
INSERT INTO `region` VALUES ('2751', '322', '蒲江县', '3');
INSERT INTO `region` VALUES ('2752', '322', '新津县', '3');
INSERT INTO `region` VALUES ('2753', '323', '涪城区', '3');
INSERT INTO `region` VALUES ('2754', '323', '游仙区', '3');
INSERT INTO `region` VALUES ('2755', '323', '江油市', '3');
INSERT INTO `region` VALUES ('2756', '323', '盐亭县', '3');
INSERT INTO `region` VALUES ('2757', '323', '三台县', '3');
INSERT INTO `region` VALUES ('2758', '323', '平武县', '3');
INSERT INTO `region` VALUES ('2759', '323', '安县', '3');
INSERT INTO `region` VALUES ('2760', '323', '梓潼县', '3');
INSERT INTO `region` VALUES ('2761', '323', '北川县', '3');
INSERT INTO `region` VALUES ('2762', '324', '马尔康县', '3');
INSERT INTO `region` VALUES ('2763', '324', '汶川县', '3');
INSERT INTO `region` VALUES ('2764', '324', '理县', '3');
INSERT INTO `region` VALUES ('2765', '324', '茂县', '3');
INSERT INTO `region` VALUES ('2766', '324', '松潘县', '3');
INSERT INTO `region` VALUES ('2767', '324', '九寨沟县', '3');
INSERT INTO `region` VALUES ('2768', '324', '金川县', '3');
INSERT INTO `region` VALUES ('2769', '324', '小金县', '3');
INSERT INTO `region` VALUES ('2770', '324', '黑水县', '3');
INSERT INTO `region` VALUES ('2771', '324', '壤塘县', '3');
INSERT INTO `region` VALUES ('2772', '324', '阿坝县', '3');
INSERT INTO `region` VALUES ('2773', '324', '若尔盖县', '3');
INSERT INTO `region` VALUES ('2774', '324', '红原县', '3');
INSERT INTO `region` VALUES ('2775', '325', '巴州区', '3');
INSERT INTO `region` VALUES ('2776', '325', '通江县', '3');
INSERT INTO `region` VALUES ('2777', '325', '南江县', '3');
INSERT INTO `region` VALUES ('2778', '325', '平昌县', '3');
INSERT INTO `region` VALUES ('2779', '326', '通川区', '3');
INSERT INTO `region` VALUES ('2780', '326', '万源市', '3');
INSERT INTO `region` VALUES ('2781', '326', '达县', '3');
INSERT INTO `region` VALUES ('2782', '326', '宣汉县', '3');
INSERT INTO `region` VALUES ('2783', '326', '开江县', '3');
INSERT INTO `region` VALUES ('2784', '326', '大竹县', '3');
INSERT INTO `region` VALUES ('2785', '326', '渠县', '3');
INSERT INTO `region` VALUES ('2786', '327', '旌阳区', '3');
INSERT INTO `region` VALUES ('2787', '327', '广汉市', '3');
INSERT INTO `region` VALUES ('2788', '327', '什邡市', '3');
INSERT INTO `region` VALUES ('2789', '327', '绵竹市', '3');
INSERT INTO `region` VALUES ('2790', '327', '罗江县', '3');
INSERT INTO `region` VALUES ('2791', '327', '中江县', '3');
INSERT INTO `region` VALUES ('2792', '328', '康定县', '3');
INSERT INTO `region` VALUES ('2793', '328', '丹巴县', '3');
INSERT INTO `region` VALUES ('2794', '328', '泸定县', '3');
INSERT INTO `region` VALUES ('2795', '328', '炉霍县', '3');
INSERT INTO `region` VALUES ('2796', '328', '九龙县', '3');
INSERT INTO `region` VALUES ('2797', '328', '甘孜县', '3');
INSERT INTO `region` VALUES ('2798', '328', '雅江县', '3');
INSERT INTO `region` VALUES ('2799', '328', '新龙县', '3');
INSERT INTO `region` VALUES ('2800', '328', '道孚县', '3');
INSERT INTO `region` VALUES ('2801', '328', '白玉县', '3');
INSERT INTO `region` VALUES ('2802', '328', '理塘县', '3');
INSERT INTO `region` VALUES ('2803', '328', '德格县', '3');
INSERT INTO `region` VALUES ('2804', '328', '乡城县', '3');
INSERT INTO `region` VALUES ('2805', '328', '石渠县', '3');
INSERT INTO `region` VALUES ('2806', '328', '稻城县', '3');
INSERT INTO `region` VALUES ('2807', '328', '色达县', '3');
INSERT INTO `region` VALUES ('2808', '328', '巴塘县', '3');
INSERT INTO `region` VALUES ('2809', '328', '得荣县', '3');
INSERT INTO `region` VALUES ('2810', '329', '广安区', '3');
INSERT INTO `region` VALUES ('2811', '329', '华蓥市', '3');
INSERT INTO `region` VALUES ('2812', '329', '岳池县', '3');
INSERT INTO `region` VALUES ('2813', '329', '武胜县', '3');
INSERT INTO `region` VALUES ('2814', '329', '邻水县', '3');
INSERT INTO `region` VALUES ('2815', '330', '利州区', '3');
INSERT INTO `region` VALUES ('2816', '330', '元坝区', '3');
INSERT INTO `region` VALUES ('2817', '330', '朝天区', '3');
INSERT INTO `region` VALUES ('2818', '330', '旺苍县', '3');
INSERT INTO `region` VALUES ('2819', '330', '青川县', '3');
INSERT INTO `region` VALUES ('2820', '330', '剑阁县', '3');
INSERT INTO `region` VALUES ('2821', '330', '苍溪县', '3');
INSERT INTO `region` VALUES ('2822', '331', '峨眉山市', '3');
INSERT INTO `region` VALUES ('2823', '331', '乐山市', '3');
INSERT INTO `region` VALUES ('2824', '331', '犍为县', '3');
INSERT INTO `region` VALUES ('2825', '331', '井研县', '3');
INSERT INTO `region` VALUES ('2826', '331', '夹江县', '3');
INSERT INTO `region` VALUES ('2827', '331', '沐川县', '3');
INSERT INTO `region` VALUES ('2828', '331', '峨边', '3');
INSERT INTO `region` VALUES ('2829', '331', '马边', '3');
INSERT INTO `region` VALUES ('2830', '332', '西昌市', '3');
INSERT INTO `region` VALUES ('2831', '332', '盐源县', '3');
INSERT INTO `region` VALUES ('2832', '332', '德昌县', '3');
INSERT INTO `region` VALUES ('2833', '332', '会理县', '3');
INSERT INTO `region` VALUES ('2834', '332', '会东县', '3');
INSERT INTO `region` VALUES ('2835', '332', '宁南县', '3');
INSERT INTO `region` VALUES ('2836', '332', '普格县', '3');
INSERT INTO `region` VALUES ('2837', '332', '布拖县', '3');
INSERT INTO `region` VALUES ('2838', '332', '金阳县', '3');
INSERT INTO `region` VALUES ('2839', '332', '昭觉县', '3');
INSERT INTO `region` VALUES ('2840', '332', '喜德县', '3');
INSERT INTO `region` VALUES ('2841', '332', '冕宁县', '3');
INSERT INTO `region` VALUES ('2842', '332', '越西县', '3');
INSERT INTO `region` VALUES ('2843', '332', '甘洛县', '3');
INSERT INTO `region` VALUES ('2844', '332', '美姑县', '3');
INSERT INTO `region` VALUES ('2845', '332', '雷波县', '3');
INSERT INTO `region` VALUES ('2846', '332', '木里', '3');
INSERT INTO `region` VALUES ('2847', '333', '东坡区', '3');
INSERT INTO `region` VALUES ('2848', '333', '仁寿县', '3');
INSERT INTO `region` VALUES ('2849', '333', '彭山县', '3');
INSERT INTO `region` VALUES ('2850', '333', '洪雅县', '3');
INSERT INTO `region` VALUES ('2851', '333', '丹棱县', '3');
INSERT INTO `region` VALUES ('2852', '333', '青神县', '3');
INSERT INTO `region` VALUES ('2853', '334', '阆中市', '3');
INSERT INTO `region` VALUES ('2854', '334', '南部县', '3');
INSERT INTO `region` VALUES ('2855', '334', '营山县', '3');
INSERT INTO `region` VALUES ('2856', '334', '蓬安县', '3');
INSERT INTO `region` VALUES ('2857', '334', '仪陇县', '3');
INSERT INTO `region` VALUES ('2858', '334', '顺庆区', '3');
INSERT INTO `region` VALUES ('2859', '334', '高坪区', '3');
INSERT INTO `region` VALUES ('2860', '334', '嘉陵区', '3');
INSERT INTO `region` VALUES ('2861', '334', '西充县', '3');
INSERT INTO `region` VALUES ('2862', '335', '市中区', '3');
INSERT INTO `region` VALUES ('2863', '335', '东兴区', '3');
INSERT INTO `region` VALUES ('2864', '335', '威远县', '3');
INSERT INTO `region` VALUES ('2865', '335', '资中县', '3');
INSERT INTO `region` VALUES ('2866', '335', '隆昌县', '3');
INSERT INTO `region` VALUES ('2867', '336', '东  区', '3');
INSERT INTO `region` VALUES ('2868', '336', '西  区', '3');
INSERT INTO `region` VALUES ('2869', '336', '仁和区', '3');
INSERT INTO `region` VALUES ('2870', '336', '米易县', '3');
INSERT INTO `region` VALUES ('2871', '336', '盐边县', '3');
INSERT INTO `region` VALUES ('2872', '337', '船山区', '3');
INSERT INTO `region` VALUES ('2873', '337', '安居区', '3');
INSERT INTO `region` VALUES ('2874', '337', '蓬溪县', '3');
INSERT INTO `region` VALUES ('2875', '337', '射洪县', '3');
INSERT INTO `region` VALUES ('2876', '337', '大英县', '3');
INSERT INTO `region` VALUES ('2877', '338', '雨城区', '3');
INSERT INTO `region` VALUES ('2878', '338', '名山县', '3');
INSERT INTO `region` VALUES ('2879', '338', '荥经县', '3');
INSERT INTO `region` VALUES ('2880', '338', '汉源县', '3');
INSERT INTO `region` VALUES ('2881', '338', '石棉县', '3');
INSERT INTO `region` VALUES ('2882', '338', '天全县', '3');
INSERT INTO `region` VALUES ('2883', '338', '芦山县', '3');
INSERT INTO `region` VALUES ('2884', '338', '宝兴县', '3');
INSERT INTO `region` VALUES ('2885', '339', '翠屏区', '3');
INSERT INTO `region` VALUES ('2886', '339', '宜宾县', '3');
INSERT INTO `region` VALUES ('2887', '339', '南溪县', '3');
INSERT INTO `region` VALUES ('2888', '339', '江安县', '3');
INSERT INTO `region` VALUES ('2889', '339', '长宁县', '3');
INSERT INTO `region` VALUES ('2890', '339', '高县', '3');
INSERT INTO `region` VALUES ('2891', '339', '珙县', '3');
INSERT INTO `region` VALUES ('2892', '339', '筠连县', '3');
INSERT INTO `region` VALUES ('2893', '339', '兴文县', '3');
INSERT INTO `region` VALUES ('2894', '339', '屏山县', '3');
INSERT INTO `region` VALUES ('2895', '340', '雁江区', '3');
INSERT INTO `region` VALUES ('2896', '340', '简阳市', '3');
INSERT INTO `region` VALUES ('2897', '340', '安岳县', '3');
INSERT INTO `region` VALUES ('2898', '340', '乐至县', '3');
INSERT INTO `region` VALUES ('2899', '341', '大安区', '3');
INSERT INTO `region` VALUES ('2900', '341', '自流井区', '3');
INSERT INTO `region` VALUES ('2901', '341', '贡井区', '3');
INSERT INTO `region` VALUES ('2902', '341', '沿滩区', '3');
INSERT INTO `region` VALUES ('2903', '341', '荣县', '3');
INSERT INTO `region` VALUES ('2904', '341', '富顺县', '3');
INSERT INTO `region` VALUES ('2905', '342', '江阳区', '3');
INSERT INTO `region` VALUES ('2906', '342', '纳溪区', '3');
INSERT INTO `region` VALUES ('2907', '342', '龙马潭区', '3');
INSERT INTO `region` VALUES ('2908', '342', '泸县', '3');
INSERT INTO `region` VALUES ('2909', '342', '合江县', '3');
INSERT INTO `region` VALUES ('2910', '342', '叙永县', '3');
INSERT INTO `region` VALUES ('2911', '342', '古蔺县', '3');
INSERT INTO `region` VALUES ('2912', '343', '和平区', '3');
INSERT INTO `region` VALUES ('2913', '343', '河西区', '3');
INSERT INTO `region` VALUES ('2914', '343', '南开区', '3');
INSERT INTO `region` VALUES ('2915', '343', '河北区', '3');
INSERT INTO `region` VALUES ('2916', '343', '河东区', '3');
INSERT INTO `region` VALUES ('2917', '343', '红桥区', '3');
INSERT INTO `region` VALUES ('2918', '343', '东丽区', '3');
INSERT INTO `region` VALUES ('2919', '343', '津南区', '3');
INSERT INTO `region` VALUES ('2920', '343', '西青区', '3');
INSERT INTO `region` VALUES ('2921', '343', '北辰区', '3');
INSERT INTO `region` VALUES ('2922', '343', '塘沽区', '3');
INSERT INTO `region` VALUES ('2923', '343', '汉沽区', '3');
INSERT INTO `region` VALUES ('2924', '343', '大港区', '3');
INSERT INTO `region` VALUES ('2925', '343', '武清区', '3');
INSERT INTO `region` VALUES ('2926', '343', '宝坻区', '3');
INSERT INTO `region` VALUES ('2927', '343', '经济开发区', '3');
INSERT INTO `region` VALUES ('2928', '343', '宁河县', '3');
INSERT INTO `region` VALUES ('2929', '343', '静海县', '3');
INSERT INTO `region` VALUES ('2930', '343', '蓟县', '3');
INSERT INTO `region` VALUES ('2931', '344', '城关区', '3');
INSERT INTO `region` VALUES ('2932', '344', '林周县', '3');
INSERT INTO `region` VALUES ('2933', '344', '当雄县', '3');
INSERT INTO `region` VALUES ('2934', '344', '尼木县', '3');
INSERT INTO `region` VALUES ('2935', '344', '曲水县', '3');
INSERT INTO `region` VALUES ('2936', '344', '堆龙德庆县', '3');
INSERT INTO `region` VALUES ('2937', '344', '达孜县', '3');
INSERT INTO `region` VALUES ('2938', '344', '墨竹工卡县', '3');
INSERT INTO `region` VALUES ('2939', '345', '噶尔县', '3');
INSERT INTO `region` VALUES ('2940', '345', '普兰县', '3');
INSERT INTO `region` VALUES ('2941', '345', '札达县', '3');
INSERT INTO `region` VALUES ('2942', '345', '日土县', '3');
INSERT INTO `region` VALUES ('2943', '345', '革吉县', '3');
INSERT INTO `region` VALUES ('2944', '345', '改则县', '3');
INSERT INTO `region` VALUES ('2945', '345', '措勤县', '3');
INSERT INTO `region` VALUES ('2946', '346', '昌都县', '3');
INSERT INTO `region` VALUES ('2947', '346', '江达县', '3');
INSERT INTO `region` VALUES ('2948', '346', '贡觉县', '3');
INSERT INTO `region` VALUES ('2949', '346', '类乌齐县', '3');
INSERT INTO `region` VALUES ('2950', '346', '丁青县', '3');
INSERT INTO `region` VALUES ('2951', '346', '察雅县', '3');
INSERT INTO `region` VALUES ('2952', '346', '八宿县', '3');
INSERT INTO `region` VALUES ('2953', '346', '左贡县', '3');
INSERT INTO `region` VALUES ('2954', '346', '芒康县', '3');
INSERT INTO `region` VALUES ('2955', '346', '洛隆县', '3');
INSERT INTO `region` VALUES ('2956', '346', '边坝县', '3');
INSERT INTO `region` VALUES ('2957', '347', '林芝县', '3');
INSERT INTO `region` VALUES ('2958', '347', '工布江达县', '3');
INSERT INTO `region` VALUES ('2959', '347', '米林县', '3');
INSERT INTO `region` VALUES ('2960', '347', '墨脱县', '3');
INSERT INTO `region` VALUES ('2961', '347', '波密县', '3');
INSERT INTO `region` VALUES ('2962', '347', '察隅县', '3');
INSERT INTO `region` VALUES ('2963', '347', '朗县', '3');
INSERT INTO `region` VALUES ('2964', '348', '那曲县', '3');
INSERT INTO `region` VALUES ('2965', '348', '嘉黎县', '3');
INSERT INTO `region` VALUES ('2966', '348', '比如县', '3');
INSERT INTO `region` VALUES ('2967', '348', '聂荣县', '3');
INSERT INTO `region` VALUES ('2968', '348', '安多县', '3');
INSERT INTO `region` VALUES ('2969', '348', '申扎县', '3');
INSERT INTO `region` VALUES ('2970', '348', '索县', '3');
INSERT INTO `region` VALUES ('2971', '348', '班戈县', '3');
INSERT INTO `region` VALUES ('2972', '348', '巴青县', '3');
INSERT INTO `region` VALUES ('2973', '348', '尼玛县', '3');
INSERT INTO `region` VALUES ('2974', '349', '日喀则市', '3');
INSERT INTO `region` VALUES ('2975', '349', '南木林县', '3');
INSERT INTO `region` VALUES ('2976', '349', '江孜县', '3');
INSERT INTO `region` VALUES ('2977', '349', '定日县', '3');
INSERT INTO `region` VALUES ('2978', '349', '萨迦县', '3');
INSERT INTO `region` VALUES ('2979', '349', '拉孜县', '3');
INSERT INTO `region` VALUES ('2980', '349', '昂仁县', '3');
INSERT INTO `region` VALUES ('2981', '349', '谢通门县', '3');
INSERT INTO `region` VALUES ('2982', '349', '白朗县', '3');
INSERT INTO `region` VALUES ('2983', '349', '仁布县', '3');
INSERT INTO `region` VALUES ('2984', '349', '康马县', '3');
INSERT INTO `region` VALUES ('2985', '349', '定结县', '3');
INSERT INTO `region` VALUES ('2986', '349', '仲巴县', '3');
INSERT INTO `region` VALUES ('2987', '349', '亚东县', '3');
INSERT INTO `region` VALUES ('2988', '349', '吉隆县', '3');
INSERT INTO `region` VALUES ('2989', '349', '聂拉木县', '3');
INSERT INTO `region` VALUES ('2990', '349', '萨嘎县', '3');
INSERT INTO `region` VALUES ('2991', '349', '岗巴县', '3');
INSERT INTO `region` VALUES ('2992', '350', '乃东县', '3');
INSERT INTO `region` VALUES ('2993', '350', '扎囊县', '3');
INSERT INTO `region` VALUES ('2994', '350', '贡嘎县', '3');
INSERT INTO `region` VALUES ('2995', '350', '桑日县', '3');
INSERT INTO `region` VALUES ('2996', '350', '琼结县', '3');
INSERT INTO `region` VALUES ('2997', '350', '曲松县', '3');
INSERT INTO `region` VALUES ('2998', '350', '措美县', '3');
INSERT INTO `region` VALUES ('2999', '350', '洛扎县', '3');
INSERT INTO `region` VALUES ('3000', '350', '加查县', '3');
INSERT INTO `region` VALUES ('3001', '350', '隆子县', '3');
INSERT INTO `region` VALUES ('3002', '350', '错那县', '3');
INSERT INTO `region` VALUES ('3003', '350', '浪卡子县', '3');
INSERT INTO `region` VALUES ('3004', '351', '天山区', '3');
INSERT INTO `region` VALUES ('3005', '351', '沙依巴克区', '3');
INSERT INTO `region` VALUES ('3006', '351', '新市区', '3');
INSERT INTO `region` VALUES ('3007', '351', '水磨沟区', '3');
INSERT INTO `region` VALUES ('3008', '351', '头屯河区', '3');
INSERT INTO `region` VALUES ('3009', '351', '达坂城区', '3');
INSERT INTO `region` VALUES ('3010', '351', '米东区', '3');
INSERT INTO `region` VALUES ('3011', '351', '乌鲁木齐县', '3');
INSERT INTO `region` VALUES ('3012', '352', '阿克苏市', '3');
INSERT INTO `region` VALUES ('3013', '352', '温宿县', '3');
INSERT INTO `region` VALUES ('3014', '352', '库车县', '3');
INSERT INTO `region` VALUES ('3015', '352', '沙雅县', '3');
INSERT INTO `region` VALUES ('3016', '352', '新和县', '3');
INSERT INTO `region` VALUES ('3017', '352', '拜城县', '3');
INSERT INTO `region` VALUES ('3018', '352', '乌什县', '3');
INSERT INTO `region` VALUES ('3019', '352', '阿瓦提县', '3');
INSERT INTO `region` VALUES ('3020', '352', '柯坪县', '3');
INSERT INTO `region` VALUES ('3021', '353', '阿拉尔市', '3');
INSERT INTO `region` VALUES ('3022', '354', '库尔勒市', '3');
INSERT INTO `region` VALUES ('3023', '354', '轮台县', '3');
INSERT INTO `region` VALUES ('3024', '354', '尉犁县', '3');
INSERT INTO `region` VALUES ('3025', '354', '若羌县', '3');
INSERT INTO `region` VALUES ('3026', '354', '且末县', '3');
INSERT INTO `region` VALUES ('3027', '354', '焉耆', '3');
INSERT INTO `region` VALUES ('3028', '354', '和静县', '3');
INSERT INTO `region` VALUES ('3029', '354', '和硕县', '3');
INSERT INTO `region` VALUES ('3030', '354', '博湖县', '3');
INSERT INTO `region` VALUES ('3031', '355', '博乐市', '3');
INSERT INTO `region` VALUES ('3032', '355', '精河县', '3');
INSERT INTO `region` VALUES ('3033', '355', '温泉县', '3');
INSERT INTO `region` VALUES ('3034', '356', '呼图壁县', '3');
INSERT INTO `region` VALUES ('3035', '356', '米泉市', '3');
INSERT INTO `region` VALUES ('3036', '356', '昌吉市', '3');
INSERT INTO `region` VALUES ('3037', '356', '阜康市', '3');
INSERT INTO `region` VALUES ('3038', '356', '玛纳斯县', '3');
INSERT INTO `region` VALUES ('3039', '356', '奇台县', '3');
INSERT INTO `region` VALUES ('3040', '356', '吉木萨尔县', '3');
INSERT INTO `region` VALUES ('3041', '356', '木垒', '3');
INSERT INTO `region` VALUES ('3042', '357', '哈密市', '3');
INSERT INTO `region` VALUES ('3043', '357', '伊吾县', '3');
INSERT INTO `region` VALUES ('3044', '357', '巴里坤', '3');
INSERT INTO `region` VALUES ('3045', '358', '和田市', '3');
INSERT INTO `region` VALUES ('3046', '358', '和田县', '3');
INSERT INTO `region` VALUES ('3047', '358', '墨玉县', '3');
INSERT INTO `region` VALUES ('3048', '358', '皮山县', '3');
INSERT INTO `region` VALUES ('3049', '358', '洛浦县', '3');
INSERT INTO `region` VALUES ('3050', '358', '策勒县', '3');
INSERT INTO `region` VALUES ('3051', '358', '于田县', '3');
INSERT INTO `region` VALUES ('3052', '358', '民丰县', '3');
INSERT INTO `region` VALUES ('3053', '359', '喀什市', '3');
INSERT INTO `region` VALUES ('3054', '359', '疏附县', '3');
INSERT INTO `region` VALUES ('3055', '359', '疏勒县', '3');
INSERT INTO `region` VALUES ('3056', '359', '英吉沙县', '3');
INSERT INTO `region` VALUES ('3057', '359', '泽普县', '3');
INSERT INTO `region` VALUES ('3058', '359', '莎车县', '3');
INSERT INTO `region` VALUES ('3059', '359', '叶城县', '3');
INSERT INTO `region` VALUES ('3060', '359', '麦盖提县', '3');
INSERT INTO `region` VALUES ('3061', '359', '岳普湖县', '3');
INSERT INTO `region` VALUES ('3062', '359', '伽师县', '3');
INSERT INTO `region` VALUES ('3063', '359', '巴楚县', '3');
INSERT INTO `region` VALUES ('3064', '359', '塔什库尔干', '3');
INSERT INTO `region` VALUES ('3065', '360', '克拉玛依市', '3');
INSERT INTO `region` VALUES ('3066', '361', '阿图什市', '3');
INSERT INTO `region` VALUES ('3067', '361', '阿克陶县', '3');
INSERT INTO `region` VALUES ('3068', '361', '阿合奇县', '3');
INSERT INTO `region` VALUES ('3069', '361', '乌恰县', '3');
INSERT INTO `region` VALUES ('3070', '362', '石河子市', '3');
INSERT INTO `region` VALUES ('3071', '363', '图木舒克市', '3');
INSERT INTO `region` VALUES ('3072', '364', '吐鲁番市', '3');
INSERT INTO `region` VALUES ('3073', '364', '鄯善县', '3');
INSERT INTO `region` VALUES ('3074', '364', '托克逊县', '3');
INSERT INTO `region` VALUES ('3075', '365', '五家渠市', '3');
INSERT INTO `region` VALUES ('3076', '366', '阿勒泰市', '3');
INSERT INTO `region` VALUES ('3077', '366', '布克赛尔', '3');
INSERT INTO `region` VALUES ('3078', '366', '伊宁市', '3');
INSERT INTO `region` VALUES ('3079', '366', '布尔津县', '3');
INSERT INTO `region` VALUES ('3080', '366', '奎屯市', '3');
INSERT INTO `region` VALUES ('3081', '366', '乌苏市', '3');
INSERT INTO `region` VALUES ('3082', '366', '额敏县', '3');
INSERT INTO `region` VALUES ('3083', '366', '富蕴县', '3');
INSERT INTO `region` VALUES ('3084', '366', '伊宁县', '3');
INSERT INTO `region` VALUES ('3085', '366', '福海县', '3');
INSERT INTO `region` VALUES ('3086', '366', '霍城县', '3');
INSERT INTO `region` VALUES ('3087', '366', '沙湾县', '3');
INSERT INTO `region` VALUES ('3088', '366', '巩留县', '3');
INSERT INTO `region` VALUES ('3089', '366', '哈巴河县', '3');
INSERT INTO `region` VALUES ('3090', '366', '托里县', '3');
INSERT INTO `region` VALUES ('3091', '366', '青河县', '3');
INSERT INTO `region` VALUES ('3092', '366', '新源县', '3');
INSERT INTO `region` VALUES ('3093', '366', '裕民县', '3');
INSERT INTO `region` VALUES ('3094', '366', '和布克赛尔', '3');
INSERT INTO `region` VALUES ('3095', '366', '吉木乃县', '3');
INSERT INTO `region` VALUES ('3096', '366', '昭苏县', '3');
INSERT INTO `region` VALUES ('3097', '366', '特克斯县', '3');
INSERT INTO `region` VALUES ('3098', '366', '尼勒克县', '3');
INSERT INTO `region` VALUES ('3099', '366', '察布查尔', '3');
INSERT INTO `region` VALUES ('3100', '367', '盘龙区', '3');
INSERT INTO `region` VALUES ('3101', '367', '五华区', '3');
INSERT INTO `region` VALUES ('3102', '367', '官渡区', '3');
INSERT INTO `region` VALUES ('3103', '367', '西山区', '3');
INSERT INTO `region` VALUES ('3104', '367', '东川区', '3');
INSERT INTO `region` VALUES ('3105', '367', '安宁市', '3');
INSERT INTO `region` VALUES ('3106', '367', '呈贡县', '3');
INSERT INTO `region` VALUES ('3107', '367', '晋宁县', '3');
INSERT INTO `region` VALUES ('3108', '367', '富民县', '3');
INSERT INTO `region` VALUES ('3109', '367', '宜良县', '3');
INSERT INTO `region` VALUES ('3110', '367', '嵩明县', '3');
INSERT INTO `region` VALUES ('3111', '367', '石林县', '3');
INSERT INTO `region` VALUES ('3112', '367', '禄劝', '3');
INSERT INTO `region` VALUES ('3113', '367', '寻甸', '3');
INSERT INTO `region` VALUES ('3114', '368', '兰坪', '3');
INSERT INTO `region` VALUES ('3115', '368', '泸水县', '3');
INSERT INTO `region` VALUES ('3116', '368', '福贡县', '3');
INSERT INTO `region` VALUES ('3117', '368', '贡山', '3');
INSERT INTO `region` VALUES ('3118', '369', '宁洱', '3');
INSERT INTO `region` VALUES ('3119', '369', '思茅区', '3');
INSERT INTO `region` VALUES ('3120', '369', '墨江', '3');
INSERT INTO `region` VALUES ('3121', '369', '景东', '3');
INSERT INTO `region` VALUES ('3122', '369', '景谷', '3');
INSERT INTO `region` VALUES ('3123', '369', '镇沅', '3');
INSERT INTO `region` VALUES ('3124', '369', '江城', '3');
INSERT INTO `region` VALUES ('3125', '369', '孟连', '3');
INSERT INTO `region` VALUES ('3126', '369', '澜沧', '3');
INSERT INTO `region` VALUES ('3127', '369', '西盟', '3');
INSERT INTO `region` VALUES ('3128', '370', '古城区', '3');
INSERT INTO `region` VALUES ('3129', '370', '宁蒗', '3');
INSERT INTO `region` VALUES ('3130', '370', '玉龙', '3');
INSERT INTO `region` VALUES ('3131', '370', '永胜县', '3');
INSERT INTO `region` VALUES ('3132', '370', '华坪县', '3');
INSERT INTO `region` VALUES ('3133', '371', '隆阳区', '3');
INSERT INTO `region` VALUES ('3134', '371', '施甸县', '3');
INSERT INTO `region` VALUES ('3135', '371', '腾冲县', '3');
INSERT INTO `region` VALUES ('3136', '371', '龙陵县', '3');
INSERT INTO `region` VALUES ('3137', '371', '昌宁县', '3');
INSERT INTO `region` VALUES ('3138', '372', '楚雄市', '3');
INSERT INTO `region` VALUES ('3139', '372', '双柏县', '3');
INSERT INTO `region` VALUES ('3140', '372', '牟定县', '3');
INSERT INTO `region` VALUES ('3141', '372', '南华县', '3');
INSERT INTO `region` VALUES ('3142', '372', '姚安县', '3');
INSERT INTO `region` VALUES ('3143', '372', '大姚县', '3');
INSERT INTO `region` VALUES ('3144', '372', '永仁县', '3');
INSERT INTO `region` VALUES ('3145', '372', '元谋县', '3');
INSERT INTO `region` VALUES ('3146', '372', '武定县', '3');
INSERT INTO `region` VALUES ('3147', '372', '禄丰县', '3');
INSERT INTO `region` VALUES ('3148', '373', '大理市', '3');
INSERT INTO `region` VALUES ('3149', '373', '祥云县', '3');
INSERT INTO `region` VALUES ('3150', '373', '宾川县', '3');
INSERT INTO `region` VALUES ('3151', '373', '弥渡县', '3');
INSERT INTO `region` VALUES ('3152', '373', '永平县', '3');
INSERT INTO `region` VALUES ('3153', '373', '云龙县', '3');
INSERT INTO `region` VALUES ('3154', '373', '洱源县', '3');
INSERT INTO `region` VALUES ('3155', '373', '剑川县', '3');
INSERT INTO `region` VALUES ('3156', '373', '鹤庆县', '3');
INSERT INTO `region` VALUES ('3157', '373', '漾濞', '3');
INSERT INTO `region` VALUES ('3158', '373', '南涧', '3');
INSERT INTO `region` VALUES ('3159', '373', '巍山', '3');
INSERT INTO `region` VALUES ('3160', '374', '潞西市', '3');
INSERT INTO `region` VALUES ('3161', '374', '瑞丽市', '3');
INSERT INTO `region` VALUES ('3162', '374', '梁河县', '3');
INSERT INTO `region` VALUES ('3163', '374', '盈江县', '3');
INSERT INTO `region` VALUES ('3164', '374', '陇川县', '3');
INSERT INTO `region` VALUES ('3165', '375', '香格里拉县', '3');
INSERT INTO `region` VALUES ('3166', '375', '德钦县', '3');
INSERT INTO `region` VALUES ('3167', '375', '维西', '3');
INSERT INTO `region` VALUES ('3168', '376', '泸西县', '3');
INSERT INTO `region` VALUES ('3169', '376', '蒙自县', '3');
INSERT INTO `region` VALUES ('3170', '376', '个旧市', '3');
INSERT INTO `region` VALUES ('3171', '376', '开远市', '3');
INSERT INTO `region` VALUES ('3172', '376', '绿春县', '3');
INSERT INTO `region` VALUES ('3173', '376', '建水县', '3');
INSERT INTO `region` VALUES ('3174', '376', '石屏县', '3');
INSERT INTO `region` VALUES ('3175', '376', '弥勒县', '3');
INSERT INTO `region` VALUES ('3176', '376', '元阳县', '3');
INSERT INTO `region` VALUES ('3177', '376', '红河县', '3');
INSERT INTO `region` VALUES ('3178', '376', '金平', '3');
INSERT INTO `region` VALUES ('3179', '376', '河口', '3');
INSERT INTO `region` VALUES ('3180', '376', '屏边', '3');
INSERT INTO `region` VALUES ('3181', '377', '临翔区', '3');
INSERT INTO `region` VALUES ('3182', '377', '凤庆县', '3');
INSERT INTO `region` VALUES ('3183', '377', '云县', '3');
INSERT INTO `region` VALUES ('3184', '377', '永德县', '3');
INSERT INTO `region` VALUES ('3185', '377', '镇康县', '3');
INSERT INTO `region` VALUES ('3186', '377', '双江', '3');
INSERT INTO `region` VALUES ('3187', '377', '耿马', '3');
INSERT INTO `region` VALUES ('3188', '377', '沧源', '3');
INSERT INTO `region` VALUES ('3189', '378', '麒麟区', '3');
INSERT INTO `region` VALUES ('3190', '378', '宣威市', '3');
INSERT INTO `region` VALUES ('3191', '378', '马龙县', '3');
INSERT INTO `region` VALUES ('3192', '378', '陆良县', '3');
INSERT INTO `region` VALUES ('3193', '378', '师宗县', '3');
INSERT INTO `region` VALUES ('3194', '378', '罗平县', '3');
INSERT INTO `region` VALUES ('3195', '378', '富源县', '3');
INSERT INTO `region` VALUES ('3196', '378', '会泽县', '3');
INSERT INTO `region` VALUES ('3197', '378', '沾益县', '3');
INSERT INTO `region` VALUES ('3198', '379', '文山县', '3');
INSERT INTO `region` VALUES ('3199', '379', '砚山县', '3');
INSERT INTO `region` VALUES ('3200', '379', '西畴县', '3');
INSERT INTO `region` VALUES ('3201', '379', '麻栗坡县', '3');
INSERT INTO `region` VALUES ('3202', '379', '马关县', '3');
INSERT INTO `region` VALUES ('3203', '379', '丘北县', '3');
INSERT INTO `region` VALUES ('3204', '379', '广南县', '3');
INSERT INTO `region` VALUES ('3205', '379', '富宁县', '3');
INSERT INTO `region` VALUES ('3206', '380', '景洪市', '3');
INSERT INTO `region` VALUES ('3207', '380', '勐海县', '3');
INSERT INTO `region` VALUES ('3208', '380', '勐腊县', '3');
INSERT INTO `region` VALUES ('3209', '381', '红塔区', '3');
INSERT INTO `region` VALUES ('3210', '381', '江川县', '3');
INSERT INTO `region` VALUES ('3211', '381', '澄江县', '3');
INSERT INTO `region` VALUES ('3212', '381', '通海县', '3');
INSERT INTO `region` VALUES ('3213', '381', '华宁县', '3');
INSERT INTO `region` VALUES ('3214', '381', '易门县', '3');
INSERT INTO `region` VALUES ('3215', '381', '峨山', '3');
INSERT INTO `region` VALUES ('3216', '381', '新平', '3');
INSERT INTO `region` VALUES ('3217', '381', '元江', '3');
INSERT INTO `region` VALUES ('3218', '382', '昭阳区', '3');
INSERT INTO `region` VALUES ('3219', '382', '鲁甸县', '3');
INSERT INTO `region` VALUES ('3220', '382', '巧家县', '3');
INSERT INTO `region` VALUES ('3221', '382', '盐津县', '3');
INSERT INTO `region` VALUES ('3222', '382', '大关县', '3');
INSERT INTO `region` VALUES ('3223', '382', '永善县', '3');
INSERT INTO `region` VALUES ('3224', '382', '绥江县', '3');
INSERT INTO `region` VALUES ('3225', '382', '镇雄县', '3');
INSERT INTO `region` VALUES ('3226', '382', '彝良县', '3');
INSERT INTO `region` VALUES ('3227', '382', '威信县', '3');
INSERT INTO `region` VALUES ('3228', '382', '水富县', '3');
INSERT INTO `region` VALUES ('3229', '383', '西湖区', '3');
INSERT INTO `region` VALUES ('3230', '383', '上城区', '3');
INSERT INTO `region` VALUES ('3231', '383', '下城区', '3');
INSERT INTO `region` VALUES ('3232', '383', '拱墅区', '3');
INSERT INTO `region` VALUES ('3233', '383', '滨江区', '3');
INSERT INTO `region` VALUES ('3234', '383', '江干区', '3');
INSERT INTO `region` VALUES ('3235', '383', '萧山区', '3');
INSERT INTO `region` VALUES ('3236', '383', '余杭区', '3');
INSERT INTO `region` VALUES ('3237', '383', '市郊', '3');
INSERT INTO `region` VALUES ('3238', '383', '建德市', '3');
INSERT INTO `region` VALUES ('3239', '383', '富阳市', '3');
INSERT INTO `region` VALUES ('3240', '383', '临安市', '3');
INSERT INTO `region` VALUES ('3241', '383', '桐庐县', '3');
INSERT INTO `region` VALUES ('3242', '383', '淳安县', '3');
INSERT INTO `region` VALUES ('3243', '384', '吴兴区', '3');
INSERT INTO `region` VALUES ('3244', '384', '南浔区', '3');
INSERT INTO `region` VALUES ('3245', '384', '德清县', '3');
INSERT INTO `region` VALUES ('3246', '384', '长兴县', '3');
INSERT INTO `region` VALUES ('3247', '384', '安吉县', '3');
INSERT INTO `region` VALUES ('3248', '385', '南湖区', '3');
INSERT INTO `region` VALUES ('3249', '385', '秀洲区', '3');
INSERT INTO `region` VALUES ('3250', '385', '海宁市', '3');
INSERT INTO `region` VALUES ('3251', '385', '嘉善县', '3');
INSERT INTO `region` VALUES ('3252', '385', '平湖市', '3');
INSERT INTO `region` VALUES ('3253', '385', '桐乡市', '3');
INSERT INTO `region` VALUES ('3254', '385', '海盐县', '3');
INSERT INTO `region` VALUES ('3255', '386', '婺城区', '3');
INSERT INTO `region` VALUES ('3256', '386', '金东区', '3');
INSERT INTO `region` VALUES ('3257', '386', '兰溪市', '3');
INSERT INTO `region` VALUES ('3258', '386', '市区', '3');
INSERT INTO `region` VALUES ('3259', '386', '佛堂镇', '3');
INSERT INTO `region` VALUES ('3260', '386', '上溪镇', '3');
INSERT INTO `region` VALUES ('3261', '386', '义亭镇', '3');
INSERT INTO `region` VALUES ('3262', '386', '大陈镇', '3');
INSERT INTO `region` VALUES ('3263', '386', '苏溪镇', '3');
INSERT INTO `region` VALUES ('3264', '386', '赤岸镇', '3');
INSERT INTO `region` VALUES ('3265', '386', '东阳市', '3');
INSERT INTO `region` VALUES ('3266', '386', '永康市', '3');
INSERT INTO `region` VALUES ('3267', '386', '武义县', '3');
INSERT INTO `region` VALUES ('3268', '386', '浦江县', '3');
INSERT INTO `region` VALUES ('3269', '386', '磐安县', '3');
INSERT INTO `region` VALUES ('3270', '387', '莲都区', '3');
INSERT INTO `region` VALUES ('3271', '387', '龙泉市', '3');
INSERT INTO `region` VALUES ('3272', '387', '青田县', '3');
INSERT INTO `region` VALUES ('3273', '387', '缙云县', '3');
INSERT INTO `region` VALUES ('3274', '387', '遂昌县', '3');
INSERT INTO `region` VALUES ('3275', '387', '松阳县', '3');
INSERT INTO `region` VALUES ('3276', '387', '云和县', '3');
INSERT INTO `region` VALUES ('3277', '387', '庆元县', '3');
INSERT INTO `region` VALUES ('3278', '387', '景宁', '3');
INSERT INTO `region` VALUES ('3279', '388', '海曙区', '3');
INSERT INTO `region` VALUES ('3280', '388', '江东区', '3');
INSERT INTO `region` VALUES ('3281', '388', '江北区', '3');
INSERT INTO `region` VALUES ('3282', '388', '镇海区', '3');
INSERT INTO `region` VALUES ('3283', '388', '北仑区', '3');
INSERT INTO `region` VALUES ('3284', '388', '鄞州区', '3');
INSERT INTO `region` VALUES ('3285', '388', '余姚市', '3');
INSERT INTO `region` VALUES ('3286', '388', '慈溪市', '3');
INSERT INTO `region` VALUES ('3287', '388', '奉化市', '3');
INSERT INTO `region` VALUES ('3288', '388', '象山县', '3');
INSERT INTO `region` VALUES ('3289', '388', '宁海县', '3');
INSERT INTO `region` VALUES ('3290', '389', '越城区', '3');
INSERT INTO `region` VALUES ('3291', '389', '上虞市', '3');
INSERT INTO `region` VALUES ('3292', '389', '嵊州市', '3');
INSERT INTO `region` VALUES ('3293', '389', '绍兴县', '3');
INSERT INTO `region` VALUES ('3294', '389', '新昌县', '3');
INSERT INTO `region` VALUES ('3295', '389', '诸暨市', '3');
INSERT INTO `region` VALUES ('3296', '390', '椒江区', '3');
INSERT INTO `region` VALUES ('3297', '390', '黄岩区', '3');
INSERT INTO `region` VALUES ('3298', '390', '路桥区', '3');
INSERT INTO `region` VALUES ('3299', '390', '温岭市', '3');
INSERT INTO `region` VALUES ('3300', '390', '临海市', '3');
INSERT INTO `region` VALUES ('3301', '390', '玉环县', '3');
INSERT INTO `region` VALUES ('3302', '390', '三门县', '3');
INSERT INTO `region` VALUES ('3303', '390', '天台县', '3');
INSERT INTO `region` VALUES ('3304', '390', '仙居县', '3');
INSERT INTO `region` VALUES ('3305', '391', '鹿城区', '3');
INSERT INTO `region` VALUES ('3306', '391', '龙湾区', '3');
INSERT INTO `region` VALUES ('3307', '391', '瓯海区', '3');
INSERT INTO `region` VALUES ('3308', '391', '瑞安市', '3');
INSERT INTO `region` VALUES ('3309', '391', '乐清市', '3');
INSERT INTO `region` VALUES ('3310', '391', '洞头县', '3');
INSERT INTO `region` VALUES ('3311', '391', '永嘉县', '3');
INSERT INTO `region` VALUES ('3312', '391', '平阳县', '3');
INSERT INTO `region` VALUES ('3313', '391', '苍南县', '3');
INSERT INTO `region` VALUES ('3314', '391', '文成县', '3');
INSERT INTO `region` VALUES ('3315', '391', '泰顺县', '3');
INSERT INTO `region` VALUES ('3316', '392', '定海区', '3');
INSERT INTO `region` VALUES ('3317', '392', '普陀区', '3');
INSERT INTO `region` VALUES ('3318', '392', '岱山县', '3');
INSERT INTO `region` VALUES ('3319', '392', '嵊泗县', '3');
INSERT INTO `region` VALUES ('3320', '393', '衢州市', '3');
INSERT INTO `region` VALUES ('3321', '393', '江山市', '3');
INSERT INTO `region` VALUES ('3322', '393', '常山县', '3');
INSERT INTO `region` VALUES ('3323', '393', '开化县', '3');
INSERT INTO `region` VALUES ('3324', '393', '龙游县', '3');
INSERT INTO `region` VALUES ('3325', '394', '合川区', '3');
INSERT INTO `region` VALUES ('3326', '394', '江津区', '3');
INSERT INTO `region` VALUES ('3327', '394', '南川区', '3');
INSERT INTO `region` VALUES ('3328', '394', '永川区', '3');
INSERT INTO `region` VALUES ('3329', '394', '南岸区', '3');
INSERT INTO `region` VALUES ('3330', '394', '渝北区', '3');
INSERT INTO `region` VALUES ('3331', '394', '万盛区', '3');
INSERT INTO `region` VALUES ('3332', '394', '大渡口区', '3');
INSERT INTO `region` VALUES ('3333', '394', '万州区', '3');
INSERT INTO `region` VALUES ('3334', '394', '北碚区', '3');
INSERT INTO `region` VALUES ('3335', '394', '沙坪坝区', '3');
INSERT INTO `region` VALUES ('3336', '394', '巴南区', '3');
INSERT INTO `region` VALUES ('3337', '394', '涪陵区', '3');
INSERT INTO `region` VALUES ('3338', '394', '江北区', '3');
INSERT INTO `region` VALUES ('3339', '394', '九龙坡区', '3');
INSERT INTO `region` VALUES ('3340', '394', '渝中区', '3');
INSERT INTO `region` VALUES ('3341', '394', '黔江开发区', '3');
INSERT INTO `region` VALUES ('3342', '394', '长寿区', '3');
INSERT INTO `region` VALUES ('3343', '394', '双桥区', '3');
INSERT INTO `region` VALUES ('3344', '394', '綦江县', '3');
INSERT INTO `region` VALUES ('3345', '394', '潼南县', '3');
INSERT INTO `region` VALUES ('3346', '394', '铜梁县', '3');
INSERT INTO `region` VALUES ('3347', '394', '大足县', '3');
INSERT INTO `region` VALUES ('3348', '394', '荣昌县', '3');
INSERT INTO `region` VALUES ('3349', '394', '璧山县', '3');
INSERT INTO `region` VALUES ('3350', '394', '垫江县', '3');
INSERT INTO `region` VALUES ('3351', '394', '武隆县', '3');
INSERT INTO `region` VALUES ('3352', '394', '丰都县', '3');
INSERT INTO `region` VALUES ('3353', '394', '城口县', '3');
INSERT INTO `region` VALUES ('3354', '394', '梁平县', '3');
INSERT INTO `region` VALUES ('3355', '394', '开县', '3');
INSERT INTO `region` VALUES ('3356', '394', '巫溪县', '3');
INSERT INTO `region` VALUES ('3357', '394', '巫山县', '3');
INSERT INTO `region` VALUES ('3358', '394', '奉节县', '3');
INSERT INTO `region` VALUES ('3359', '394', '云阳县', '3');
INSERT INTO `region` VALUES ('3360', '394', '忠县', '3');
INSERT INTO `region` VALUES ('3361', '394', '石柱', '3');
INSERT INTO `region` VALUES ('3362', '394', '彭水', '3');
INSERT INTO `region` VALUES ('3363', '394', '酉阳', '3');
INSERT INTO `region` VALUES ('3364', '394', '秀山', '3');
INSERT INTO `region` VALUES ('3365', '395', '沙田区', '3');
INSERT INTO `region` VALUES ('3366', '395', '东区', '3');
INSERT INTO `region` VALUES ('3367', '395', '观塘区', '3');
INSERT INTO `region` VALUES ('3368', '395', '黄大仙区', '3');
INSERT INTO `region` VALUES ('3369', '395', '九龙城区', '3');
INSERT INTO `region` VALUES ('3370', '395', '屯门区', '3');
INSERT INTO `region` VALUES ('3371', '395', '葵青区', '3');
INSERT INTO `region` VALUES ('3372', '395', '元朗区', '3');
INSERT INTO `region` VALUES ('3373', '395', '深水埗区', '3');
INSERT INTO `region` VALUES ('3374', '395', '西贡区', '3');
INSERT INTO `region` VALUES ('3375', '395', '大埔区', '3');
INSERT INTO `region` VALUES ('3376', '395', '湾仔区', '3');
INSERT INTO `region` VALUES ('3377', '395', '油尖旺区', '3');
INSERT INTO `region` VALUES ('3378', '395', '北区', '3');
INSERT INTO `region` VALUES ('3379', '395', '南区', '3');
INSERT INTO `region` VALUES ('3380', '395', '荃湾区', '3');
INSERT INTO `region` VALUES ('3381', '395', '中西区', '3');
INSERT INTO `region` VALUES ('3382', '395', '离岛区', '3');
INSERT INTO `region` VALUES ('3383', '396', '澳门', '3');
INSERT INTO `region` VALUES ('3384', '397', '台北', '3');
INSERT INTO `region` VALUES ('3385', '397', '高雄', '3');
INSERT INTO `region` VALUES ('3386', '397', '基隆', '3');
INSERT INTO `region` VALUES ('3387', '397', '台中', '3');
INSERT INTO `region` VALUES ('3388', '397', '台南', '3');
INSERT INTO `region` VALUES ('3389', '397', '新竹', '3');
INSERT INTO `region` VALUES ('3390', '397', '嘉义', '3');
INSERT INTO `region` VALUES ('3391', '397', '宜兰县', '3');
INSERT INTO `region` VALUES ('3392', '397', '桃园县', '3');
INSERT INTO `region` VALUES ('3393', '397', '苗栗县', '3');
INSERT INTO `region` VALUES ('3394', '397', '彰化县', '3');
INSERT INTO `region` VALUES ('3395', '397', '南投县', '3');
INSERT INTO `region` VALUES ('3396', '397', '云林县', '3');
INSERT INTO `region` VALUES ('3397', '397', '屏东县', '3');
INSERT INTO `region` VALUES ('3398', '397', '台东县', '3');
INSERT INTO `region` VALUES ('3399', '397', '花莲县', '3');
INSERT INTO `region` VALUES ('3400', '397', '澎湖县', '3');
INSERT INTO `region` VALUES ('3401', '3', '合肥', '2');
INSERT INTO `region` VALUES ('3402', '3401', '庐阳区', '3');
INSERT INTO `region` VALUES ('3403', '3401', '瑶海区', '3');
INSERT INTO `region` VALUES ('3404', '3401', '蜀山区', '3');
INSERT INTO `region` VALUES ('3405', '3401', '包河区', '3');
INSERT INTO `region` VALUES ('3406', '3401', '长丰县', '3');
INSERT INTO `region` VALUES ('3407', '3401', '肥东县', '3');
INSERT INTO `region` VALUES ('3408', '3401', '肥西县', '3');
INSERT INTO `region` VALUES ('3409', '0', '国外', '0');

-- ----------------------------
-- Table structure for `relation_admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `relation_admin_role`;
CREATE TABLE `relation_admin_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL COMMENT '用户id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `status` int(11) DEFAULT '1' COMMENT '状态',
  `created_at` timestamp NULL,
  `updated_at` timestamp NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户角色对应表';

-- ----------------------------
-- Records of relation_admin_role
-- ----------------------------
INSERT INTO `relation_admin_role` VALUES ('29', '2', '15', '1', '2017-04-20 17:29:25', '2017-04-20 17:29:25');
INSERT INTO `relation_admin_role` VALUES ('30', '3', '1', '1', '2017-04-20 17:33:53', '2017-04-20 17:33:53');
INSERT INTO `relation_admin_role` VALUES ('31', '2', '1', '1', '2017-04-21 10:52:09', '2017-04-21 10:52:09');
INSERT INTO `relation_admin_role` VALUES ('32', '2', '3', '1', '2017-04-27 13:44:13', '2017-04-27 13:44:13');
INSERT INTO `relation_admin_role` VALUES ('33', '1', '1', '1', '2017-05-02 13:33:24', '2017-05-02 13:33:24');
INSERT INTO `relation_admin_role` VALUES ('34', '1', '2', '1', '2017-05-02 13:33:24', '2017-05-02 13:33:24');
INSERT INTO `relation_admin_role` VALUES ('35', '1', '8', '1', '2017-05-02 13:33:24', '2017-05-02 13:33:24');
INSERT INTO `relation_admin_role` VALUES ('36', '7', '1', '1', '2018-06-21 09:49:27', '2018-06-21 09:49:27');

-- ----------------------------
-- Table structure for `relation_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `relation_role_menu`;
CREATE TABLE `relation_role_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `menus` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '权限id',
  `status` int(11) DEFAULT '1' COMMENT '状态',
  `created_at` timestamp NULL,
  `updated_at` timestamp NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色权限对应表';

-- ----------------------------
-- Records of relation_role_menu
-- ----------------------------
INSERT INTO `relation_role_menu` VALUES ('5', '1', '11,16,18,19,20,21,3,31,32,7', '1', '2017-04-20 17:30:48', '2017-04-21 10:51:31');
INSERT INTO `relation_role_menu` VALUES ('6', '15', '31,32,7,49,50', '1', '2017-04-20 17:32:04', '2017-04-20 17:32:04');
INSERT INTO `relation_role_menu` VALUES ('7', '7', '14,17', '1', '2017-05-02 13:58:25', '2017-05-02 13:58:25');
INSERT INTO `relation_role_menu` VALUES ('8', '5', '13', '1', '2017-07-03 17:28:50', '2017-07-03 17:29:06');
INSERT INTO `relation_role_menu` VALUES ('9', '3', '11,12,13,65,1', '1', '2018-04-04 16:18:58', '2018-04-04 16:18:58');

-- ----------------------------
-- Table structure for `risk_question`
-- ----------------------------
DROP TABLE IF EXISTS `risk_question`;
CREATE TABLE `risk_question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `questions` varchar(85) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '问题',
  `options` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '选项',
  `created_at` timestamp NULL,
  `updated_at` timestamp NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='题库';

-- ----------------------------
-- Records of risk_question
-- ----------------------------
INSERT INTO `risk_question` VALUES ('95', '您的年龄是?', '{\"A\":{\"option\":\"\\u9ad8\\u4e8e60\\u5c81\",\"score\":\"1\"},\"B\":{\"option\":\"51\\u201460\\u5c81\",\"score\":\"2\"},\"C\":{\"option\":\"31\\u201450\\u5c81\",\"score\":\"3\"},\"D\":{\"option\":\"18\\u201430\\u5c81\",\"score\":\"4\"}}', '2018-04-23 11:20:14', '2018-04-23 11:33:04');
INSERT INTO `risk_question` VALUES ('96', '您的家庭年收入？', '{\"A\":{\"option\":\"10\\u4e07\\u5143\\u4ee5\\u4e0b\",\"score\":\"1\"},\"B\":{\"option\":\"10\\u201450\\u4e07\\u5143\",\"score\":\"2\"},\"C\":{\"option\":\"50\\u2014100\\u4e07\\u5143\",\"score\":\"3\"},\"D\":{\"option\":\"100\\u4e07\\u5143\\u4ee5\\u4e0a\",\"score\":\"4\"}}', '2018-04-23 11:20:15', '2018-04-23 11:33:12');
INSERT INTO `risk_question` VALUES ('97', '在您的家庭收入中，理财资金\r\n\r\n占比是多少？', '{\"A\":{\"option\":\"\\u5c0f\\u4e8e10%\",\"score\":\"1\"},\"B\":{\"option\":\"10%\\u81f325%\",\"score\":\"2\"},\"C\":{\"option\":\"25%\\u81f350%\",\"score\":\"3\"},\"D\":{\"option\":\"\\u5927\\u4e8e50%\",\"score\":\"4\"}}', '2018-04-23 11:20:15', '2018-04-23 11:33:25');
INSERT INTO `risk_question` VALUES ('98', '当您进行投资时，您的首页目\r\n\r\n标是？', '{\"A\":{\"option\":\"\\u8d44\\u4ea7\\u4fdd\\u503c\\uff0c\\u6211\\u4e0d\\u613f\\u610f\\u627f\\u62c5\\u4efb\\u4f55\\u98ce\\u9669\",\"score\":\"1\"},\"B\":{\"option\":\"\\u5c3d\\u53ef\\u80fd\\u4fdd\\u969c\\u8d44\\u91d1\\u5b89\\u5168\\uff0c\\u4e0d\\u5728\\u4e4e\\u6536\\u76ca\\u7387\\u6bd4\\u8f83\\u4f4e\",\"score\":\"2\"},\"C\":{\"option\":\"\\u4ea7\\u751f\\u8f83\\u591a\\u7684\\u6536\\u76ca\\uff0c\\u53ef\\u4ee5\\u627f\\u62c5\\u4e00\\u5b9a\\u7684\\u6295\\u8d44\\u98ce\\u9669\",\"score\":\"3\"},\"D\":{\"option\":\"\\u5b9e\\u73b0\\u8d44\\u91d1\\u5927\\u5e45\\u589e\\u957f\\uff0c\\u613f\\u610f\\u627f\\u62c5\\u5f88\\u5927\\u7684\\u6295\\u8d44\\u98ce\\u9669\",\"score\":\"4\"}}', '2018-04-23 11:20:15', '2018-04-23 11:33:33');
INSERT INTO `risk_question` VALUES ('99', '您期望的投资年化收益率？', '{\"A\":{\"option\":\"\\u9ad8\\u4e8e\\u540c\\u671f\\u5b9a\\u671f\\u5b58\\u6b3e\",\"score\":\"1\"},\"B\":{\"option\":\"5%\\u5de6\\u53f3\\u3001\\u8981\\u6c42\\u76f8\\u5bf9\\u98ce\\u9669\\u4f4e\",\"score\":\"2\"},\"C\":{\"option\":\"5%-15%\\uff0c\\u53ef\\u627f\\u53d7\\u4e2d\\u7b49\\u98ce\\u9669\",\"score\":\"3\"},\"D\":{\"option\":\"15%\\u4ee5\\u4e0a\\uff0c\\u53ef\\u627f\\u62c5\\u8f83\\u9ad8\\u98ce\\u9669\",\"score\":\"4\"}}', '2018-04-23 11:20:15', '2018-04-23 11:33:40');
INSERT INTO `risk_question` VALUES ('100', '您的投资出现何种程度的波动\r\n\r\n时，您会呈现明显的焦虑？', '{\"A\":{\"option\":\"\\u51fa\\u73b0\\u8f7b\\u5fae\\u672c\\u91d1\\u635f\\u5931\",\"score\":\"1\"},\"B\":{\"option\":\"\\u672c\\u91d110%\\u4ee5\\u5185\\u7684\\u635f\\u5931\",\"score\":\"2\"},\"C\":{\"option\":\"\\u672c\\u91d120%-50%\\u7684\\u635f\\u5931\",\"score\":\"3\"},\"D\":{\"option\":\"\\u672c\\u91d150%\\u4ee5\\u4e0a\\u7684\\u635f\\u5931\",\"score\":\"4\"}}', '2018-04-23 11:20:15', '2018-04-23 11:33:49');
INSERT INTO `risk_question` VALUES ('101', '以下情况，您会选择哪一种？', '{\"A\":{\"option\":\"\\u6709100%\\u7684\\u673a\\u4f1a\\u8d62\\u53d61000\\u5143\\u73b0\\u91d1\",\"score\":\"1\"},\"B\":{\"option\":\"\\u670950%\\u7684\\u673a\\u4f1a\\u8d62\\u53d65\\u4e07\\u5143\\u73b0\\u91d1\",\"score\":\"2\"},\"C\":{\"option\":\"\\u670925%\\u7684\\u673a\\u4f1a\\u8d62\\u53d650\\u4e07\\u5143\\u73b0\\u91d1\",\"score\":\"3\"},\"D\":{\"option\":\"\\u670910%\\u7684\\u673a\\u4f1a\\u8d62\\u53d6100\\u4e07\\u5143\\u73b0\\u91d1\",\"score\":\"4\"}}', '2018-04-23 11:20:16', '2018-04-23 11:33:50');

-- ----------------------------
-- Table structure for `risk_type`
-- ----------------------------
DROP TABLE IF EXISTS `risk_type`;
CREATE TABLE `risk_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `high_score` int(11) DEFAULT NULL COMMENT '最高分',
  `low_score` int(11) DEFAULT NULL COMMENT '最低分',
  `name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '风险类型，稳健型／激进型',
  `desc` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '关于风险等级的说明',
  `created_at` timestamp NULL,
  `updated_at` timestamp NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='风险类型';

-- ----------------------------
-- Records of risk_type
-- ----------------------------
INSERT INTO `risk_type` VALUES ('6', '10', '7', '保守型', '您对风险十分敏感，十分关注本金安全；您投资经验较少，可通过持续投资及财智课堂来提升投资能力。您倾向于投资期限很短的产品。', '2018-04-08 10:43:47', '2018-04-23 13:24:18');
INSERT INTO `risk_type` VALUES ('7', '14', '11', '稳健型', '您具备一定的风险成熟能力，注重稳定的投资收入和长期资本增值之间的平衡，希望在风险较小的情况下获得一定回报，不适合高风险、较高风险的金融产品。', '2018-04-08 10:43:47', '2018-04-23 13:24:25');
INSERT INTO `risk_type` VALUES ('8', '18', '15', '平衡型', '您具备一定的投资经验，愿意投资与较高风险产品，期待获取较高的回报率，投资期限偏重中长期', '2018-04-08 10:43:48', '2018-04-23 13:24:29');
INSERT INTO `risk_type` VALUES ('9', '23', '19', '成长型', '您对风险持乐观态度，能承受较高风险，愿意为高收益承担较大风险；您具备很强投资经验，结合专业机构观点可进一步优化资产组合。您倾向于投资长期险的产品。且愿意使用杠杆进行投资', '2018-04-08 10:43:48', '2018-04-23 13:24:34');
INSERT INTO `risk_type` VALUES ('10', '28', '24', '进取型', '您渴望较高的投资收益，具备丰富的投资经验和长期投资目标；无需从投资中获得稳定的现金流以支付生活费用；渴望较高的投资收益，并愿意为此承担较大的风险。', '2018-04-08 10:43:53', '2018-04-23 13:24:36');

-- ----------------------------
-- Table structure for `sms`
-- ----------------------------
DROP TABLE IF EXISTS `sms`;
CREATE TABLE `sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户ID，关联users.id',
  `area_code` int(11) DEFAULT NULL COMMENT '手机号区号',
  `mobile` varchar(11) NOT NULL COMMENT '手机号',
  `code` varchar(10) DEFAULT NULL COMMENT '验证码',
  `scene` tinyint(4) NOT NULL COMMENT '应用场景，1/通用验证码  2/忘记密码  3/通知',
  `message` varchar(100) NOT NULL COMMENT '短信内容',
  `status` tinyint(4) NOT NULL COMMENT '状态 1发送成功并验证成功，-1发送失败，0发送成功未验证',
  `response` varchar(1000) DEFAULT NULL COMMENT '短信运营商的响应',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=2381 DEFAULT CHARSET=utf8 COMMENT='短信验证码';

-- ----------------------------
-- Records of sms
-- ----------------------------
INSERT INTO `sms` VALUES ('2328', null, null, '18328811091', '318855', '1', '【钱进家】您的验证码为318855，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"18328811091\",\"sid\":25450267524}}', '2018-06-27 09:30:56', '2018-06-27 09:43:06');
INSERT INTO `sms` VALUES ('2329', null, null, '18696178832', '416826', '1', '【钱进家】您的验证码为416826，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"18696178832\",\"sid\":25450538416}}', '2018-06-27 09:40:21', '2018-06-27 09:43:06');
INSERT INTO `sms` VALUES ('2330', null, null, '18696176632', '222128', '1', '【钱进家】您的验证码为222128，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"18696176632\",\"sid\":25450560384}}', '2018-06-27 09:41:22', '2018-06-27 09:43:06');
INSERT INTO `sms` VALUES ('2331', null, null, '15518212052', '675294', '1', '【钱进家】您的验证码为675294，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"15518212052\",\"sid\":25456162212}}', '2018-06-27 11:23:35', '2018-06-28 15:41:16');
INSERT INTO `sms` VALUES ('2332', null, null, '13062692010', '210798', '1', '【钱进家】您的验证码为210798，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"13062692010\",\"sid\":25497489500}}', '2018-06-28 15:40:55', '2018-06-28 15:41:16');
INSERT INTO `sms` VALUES ('2333', null, null, '13062692010', '389864', '1', '【钱进家】您的验证码为389864，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"13062692010\",\"sid\":25497947242}}', '2018-06-28 15:46:11', '2018-06-28 15:46:30');
INSERT INTO `sms` VALUES ('2334', null, null, '13062692010', '647646', '1', '【钱进家】您的验证码为647646，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"13062692010\",\"sid\":25498186142}}', '2018-06-28 15:50:17', '2018-06-28 15:50:35');
INSERT INTO `sms` VALUES ('2335', null, null, '13062692010', '321857', '1', '【钱进家】您的验证码为321857，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"13062692010\",\"sid\":25499197240}}', '2018-06-28 16:15:14', '2018-06-28 16:46:46');
INSERT INTO `sms` VALUES ('2336', null, null, '13062692010', '915480', '1', '【钱进家】您的验证码为915480，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"13062692010\",\"sid\":25499306300}}', '2018-06-28 16:19:16', '2018-06-28 16:46:46');
INSERT INTO `sms` VALUES ('2337', null, null, '13062692010', '169470', '1', '【钱进家】您的验证码为169470，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"13062692010\",\"sid\":25499323678}}', '2018-06-28 16:20:04', '2018-06-28 16:46:46');
INSERT INTO `sms` VALUES ('2338', null, null, '13062692010', '257812', '1', '【钱进家】您的验证码为257812，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"13062692010\",\"sid\":25499448418}}', '2018-06-28 16:23:06', '2018-06-28 16:46:46');
INSERT INTO `sms` VALUES ('2339', null, null, '13062692010', '795487', '1', '【钱进家】您的验证码为795487，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"13062692010\",\"sid\":25499506536}}', '2018-06-28 16:25:53', '2018-06-28 16:46:46');
INSERT INTO `sms` VALUES ('2340', null, null, '13062692010', '549789', '1', '【钱进家】您的验证码为549789，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"13062692010\",\"sid\":25499529434}}', '2018-06-28 16:26:57', '2018-06-28 16:46:46');
INSERT INTO `sms` VALUES ('2341', null, null, '13062692010', '340999', '1', '【钱进家】您的验证码为340999，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"13062692010\",\"sid\":25499640914}}', '2018-06-28 16:29:44', '2018-06-28 16:46:46');
INSERT INTO `sms` VALUES ('2342', null, null, '13062692010', '368057', '1', '【钱进家】您的验证码为368057，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":33,\"msg\":\"\\u53f7\\u7801\\uff1a13062692010, \\u8d85\\u8fc7\\u9891\\u7387\\uff0c\\u540c\\u4e00\\u4e2a\\u624b\\u673a\\u53f7\\u540c\\u4e00\\u9a8c\\u8bc1\\u7801\\u6a21\\u677f\\u6bcf30\\u79d2\\u53ea\\u80fd\\u53d1\\u9001\\u4e00\\u6761\",\"data\":null}', '2018-06-28 16:30:10', '2018-06-28 16:46:46');
INSERT INTO `sms` VALUES ('2343', null, null, '13062692010', '898147', '1', '【钱进家】您的验证码为898147，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"13062692010\",\"sid\":25499715888}}', '2018-06-28 16:32:15', '2018-06-28 16:46:46');
INSERT INTO `sms` VALUES ('2344', null, null, '13062692010', '952255', '1', '【钱进家】您的验证码为952255，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"13062692010\",\"sid\":25499772644}}', '2018-06-28 16:34:11', '2018-06-28 16:46:46');
INSERT INTO `sms` VALUES ('2345', null, null, '13062692010', '971263', '1', '【钱进家】您的验证码为971263，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"13062692010\",\"sid\":25499817546}}', '2018-06-28 16:34:56', '2018-06-28 16:46:46');
INSERT INTO `sms` VALUES ('2346', null, null, '13062692010', '343514', '1', '【钱进家】您的验证码为343514，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"13062692010\",\"sid\":25499850480}}', '2018-06-28 16:35:30', '2018-06-28 16:46:46');
INSERT INTO `sms` VALUES ('2347', null, null, '13062692010', '363264', '1', '【钱进家】您的验证码为363264，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":33,\"msg\":\"\\u53f7\\u7801\\uff1a13062692010, \\u8d85\\u8fc7\\u9891\\u7387\\uff0c\\u540c\\u4e00\\u4e2a\\u624b\\u673a\\u53f7\\u540c\\u4e00\\u9a8c\\u8bc1\\u7801\\u6a21\\u677f\\u6bcf30\\u79d2\\u53ea\\u80fd\\u53d1\\u9001\\u4e00\\u6761\",\"data\":null}', '2018-06-28 16:35:55', '2018-06-28 16:46:46');
INSERT INTO `sms` VALUES ('2348', null, null, '13062692010', '211402', '1', '【钱进家】您的验证码为211402，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"13062692010\",\"sid\":25499928780}}', '2018-06-28 16:36:28', '2018-06-28 16:46:46');
INSERT INTO `sms` VALUES ('2349', null, null, '13062692010', '643002', '1', '【钱进家】您的验证码为643002，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"13062692010\",\"sid\":25500207050}}', '2018-06-28 16:40:12', '2018-06-28 16:46:46');
INSERT INTO `sms` VALUES ('2350', null, null, '13062692010', '731498', '1', '【钱进家】您的验证码为731498，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"13062692010\",\"sid\":25500427566}}', '2018-06-28 16:46:32', '2018-06-28 16:46:46');
INSERT INTO `sms` VALUES ('2351', null, null, '13062692010', '171825', '1', '【钱进家】您的验证码为171825，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"13062692010\",\"sid\":25500452610}}', '2018-06-28 16:47:36', '2018-06-28 16:47:50');
INSERT INTO `sms` VALUES ('2352', null, null, '13062692010', '180989', '1', '【钱进家】您的验证码为180989，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"13062692010\",\"sid\":25500505268}}', '2018-06-28 16:50:09', '2018-06-28 16:50:33');
INSERT INTO `sms` VALUES ('2353', null, null, '13062692010', '487402', '1', '【钱进家】您的验证码为487402，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"13062692010\",\"sid\":25501974060}}', '2018-06-28 17:46:12', '2018-06-28 17:46:40');
INSERT INTO `sms` VALUES ('2354', null, null, '13062692010', '303901', '1', '【钱进家】您的验证码为303901，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"13062692010\",\"sid\":25502186462}}', '2018-06-28 17:48:51', '2018-06-28 17:49:10');
INSERT INTO `sms` VALUES ('2355', null, null, '13062692010', '305039', '1', '【钱进家】您的验证码为305039，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"13062692010\",\"sid\":25506304722}}', '2018-06-28 19:26:24', '2018-06-28 19:26:45');
INSERT INTO `sms` VALUES ('2356', null, null, '13062692010', '477260', '1', '【钱进家】您的验证码为477260，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"13062692010\",\"sid\":25506405494}}', '2018-06-28 19:28:33', '2018-06-28 19:28:54');
INSERT INTO `sms` VALUES ('2357', null, null, '13062692010', '978709', '1', '【钱进家】您的验证码为978709，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"13062692010\",\"sid\":25506718738}}', '2018-06-28 19:32:17', '2018-06-28 19:32:34');
INSERT INTO `sms` VALUES ('2358', null, null, '13062692010', '257804', '1', '【钱进家】您的验证码为257804，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"13062692010\",\"sid\":25507030080}}', '2018-06-28 19:45:45', '2018-06-28 19:46:02');
INSERT INTO `sms` VALUES ('2359', null, null, '13062692010', '343128', '1', '【钱进家】您的验证码为343128，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"13062692010\",\"sid\":25507066768}}', '2018-06-28 19:47:18', '2018-06-28 19:47:33');
INSERT INTO `sms` VALUES ('2360', null, null, '13062692010', '559507', '1', '【钱进家】您的验证码为559507，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"13062692010\",\"sid\":25507145060}}', '2018-06-28 19:51:07', '2018-06-28 19:51:21');
INSERT INTO `sms` VALUES ('2361', null, null, '18236968869', null, '3', '【钱进家】尊敬的用户李冲冲，您的借款申请已提交请等待审核。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"18236968869\",\"sid\":25623818094}}', '2018-07-02 14:14:39', '2018-07-02 14:24:43');
INSERT INTO `sms` VALUES ('2362', null, null, '18236968869', null, '3', '【钱进家】尊敬的用户李冲冲，您的借款申请审核成功，请登录app查看详情。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"18236968869\",\"sid\":25623824104}}', '2018-07-02 14:14:48', '2018-07-02 14:24:43');
INSERT INTO `sms` VALUES ('2363', null, null, '18334795116', null, '3', '【钱进家】尊敬的用户陈慧清，您的借款申请已提交请等待审核。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"18334795116\",\"sid\":25623853084}}', '2018-07-02 14:15:38', '2018-07-02 14:24:43');
INSERT INTO `sms` VALUES ('2364', null, null, '18334795116', null, '3', '【钱进家】尊敬的用户陈慧清，您的借款申请审核成功，请登录app查看详情。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"18334795116\",\"sid\":25623856168}}', '2018-07-02 14:15:43', '2018-07-02 14:24:43');
INSERT INTO `sms` VALUES ('2365', null, null, '18334795116', null, '3', '【钱进家】尊敬的用户陈慧清，您的借款正在筹集中，请登录app查看详情。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"18334795116\",\"sid\":25623876482}}', '2018-07-02 14:16:19', '2018-07-02 14:24:43');
INSERT INTO `sms` VALUES ('2366', null, null, '18236968869', null, '3', '【钱进家】尊敬的用户李冲冲，您的借款正在筹集中，请登录app查看详情。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"18236968869\",\"sid\":25623895796}}', '2018-07-02 14:16:50', '2018-07-02 14:24:43');
INSERT INTO `sms` VALUES ('2367', null, null, '15518212052', null, '3', '【钱进家】尊敬的用户15518212052您的一笔1000元的提现申请成功，资金将于1-2个工作日内汇入您的银行卡账户，请注意查收。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"15518212052\",\"sid\":25624059560}}', '2018-07-02 14:19:33', '2018-07-02 14:24:43');
INSERT INTO `sms` VALUES ('2368', null, null, '15518212052', null, '3', '【钱进家】尊敬的用户15518212052您已成功出借1000.00元（李陈合标），您可以去“出借记录”中查看详情。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"15518212052\",\"sid\":25624105286}}', '2018-07-02 14:20:22', '2018-07-02 14:24:43');
INSERT INTO `sms` VALUES ('2369', null, null, '15518212052', null, '3', '【钱进家】尊敬的用户15518212052您已成功出借1330元（陈慧清散标），您可以去“出借记录”中查看详情。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"15518212052\",\"sid\":25624138228}}', '2018-07-02 14:21:09', '2018-07-02 14:24:43');
INSERT INTO `sms` VALUES ('2370', null, null, '15518212052', null, '3', '【钱进家】尊敬的用户15518212052您已成功出借1330元（陈慧清散标），您可以去“出借记录”中查看详情。', '1', '{\"code\":8,\"msg\":\"\\u540c\\u4e00\\u4e2a\\u624b\\u673a\\u53f7 15518212052 30\\u79d2\\u5185\\u91cd\\u590d\\u63d0\\u4ea4\\u76f8\\u540c\\u7684\\u5185\\u5bb9\",\"data\":null}', '2018-07-02 14:21:09', '2018-07-02 14:24:43');
INSERT INTO `sms` VALUES ('2371', null, null, '18339919633', null, '3', '【钱进家】尊敬的用户18339919633您已成功出借670.00元（李陈合标），您可以去“出借记录”中查看详情。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"18339919633\",\"sid\":25624165918}}', '2018-07-02 14:21:45', '2018-07-02 14:24:43');
INSERT INTO `sms` VALUES ('2372', null, null, '18236968869', null, '3', '【钱进家】尊敬的用户李冲冲，您的借款申请已筹集结束正在发放中预计1-2个工作日会到账请注意查收。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"18236968869\",\"sid\":25624211192}}', '2018-07-02 14:22:39', '2018-07-02 14:24:43');
INSERT INTO `sms` VALUES ('2373', null, null, '18334795116', null, '3', '【钱进家】尊敬的用户陈慧清，您的借款申请已筹集结束正在发放中预计1-2个工作日会到账请注意查收。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"18334795116\",\"sid\":25624211996}}', '2018-07-02 14:22:40', '2018-07-02 14:24:43');
INSERT INTO `sms` VALUES ('2374', null, null, '15518212052', '457895', '1', '【钱进家】您的验证码为457895，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"15518212052\",\"sid\":25624232860}}', '2018-07-02 14:23:04', '2018-07-02 14:24:43');
INSERT INTO `sms` VALUES ('2375', null, null, '15518212052', '389262', '1', '【钱进家】您的验证码为389262，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"15518212052\",\"sid\":25624298696}}', '2018-07-02 14:24:34', '2018-07-02 14:24:43');
INSERT INTO `sms` VALUES ('2376', null, null, '18339919633', '314022', '1', '【钱进家】您的验证码为314022，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"18339919633\",\"sid\":25625208818}}', '2018-07-02 14:34:37', '2018-07-02 14:34:46');
INSERT INTO `sms` VALUES ('2377', null, null, '18339919633', '650780', '1', '【钱进家】您的验证码为650780，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"18339919633\",\"sid\":25625726690}}', '2018-07-02 14:39:04', '2018-07-02 14:39:10');
INSERT INTO `sms` VALUES ('2378', null, null, '17607155535', '297854', '1', '【钱进家】您的验证码为297854，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"17607155535\",\"sid\":25660229034}}', '2018-07-03 10:35:16', '2018-07-03 10:35:35');
INSERT INTO `sms` VALUES ('2379', null, null, '17607155535', '615974', '1', '【钱进家】您的验证码为615974，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"17607155535\",\"sid\":25680016858}}', '2018-07-03 15:36:33', '2018-07-03 15:38:29');
INSERT INTO `sms` VALUES ('2380', null, null, '17607155535', '375243', '1', '【钱进家】您的验证码为375243，有效期20分钟，感谢您的关注和支持。', '1', '{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"data\":{\"code\":0,\"msg\":\"\\u53d1\\u9001\\u6210\\u529f\",\"count\":1,\"fee\":0.031,\"unit\":\"RMB\",\"mobile\":\"17607155535\",\"sid\":25680088152}}', '2018-07-03 15:38:08', '2018-07-03 15:38:29');

-- ----------------------------
-- Table structure for `user_account_safe`
-- ----------------------------
DROP TABLE IF EXISTS `user_account_safe`;
CREATE TABLE `user_account_safe` (
  `uid` int(11) NOT NULL COMMENT '用户id',
  `login_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '登陆状态  1/正常  2/锁定',
  `login_locking_time` int(11) DEFAULT NULL COMMENT '锁定时间，登陆失败5次，自动锁定24小时，改时间之前都不能登陆',
  `login_fail_time` int(11) DEFAULT NULL COMMENT '第一次登陆密码错误时间，半小时内登陆失败5次，锁定账户并短信提醒用户',
  `login_fail_count` tinyint(4) DEFAULT '0' COMMENT '登陆密码错误次数',
  `deal_fail_time` int(11) DEFAULT NULL COMMENT '第一次交易密码错误时间，半小时内交易密码错误3次，需短信提醒用户',
  `deal_fail_count` tinyint(4) DEFAULT '0' COMMENT '交易密码错误次数',
  `created_at` timestamp NULL,
  `updated_at` timestamp NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='锁定用户';

-- ----------------------------
-- Records of user_account_safe
-- ----------------------------
INSERT INTO `user_account_safe` VALUES ('130', '1', null, null, '0', null, '0', '2018-05-01 13:18:52', '2018-05-01 13:18:52');
INSERT INTO `user_account_safe` VALUES ('131', '1', null, null, '0', null, '0', '2018-05-01 14:35:27', '2018-05-01 14:35:27');
INSERT INTO `user_account_safe` VALUES ('132', '1', null, null, '0', null, '0', '2018-05-01 14:36:16', '2018-05-10 17:49:06');
INSERT INTO `user_account_safe` VALUES ('133', '1', null, null, '0', null, '0', '2018-05-01 14:38:41', '2018-05-01 14:38:41');
INSERT INTO `user_account_safe` VALUES ('134', '1', null, null, '0', null, '0', '2018-05-01 14:40:28', '2018-05-01 14:40:28');
INSERT INTO `user_account_safe` VALUES ('135', '1', null, null, '0', null, '0', '2018-05-01 14:43:49', '2018-05-03 13:30:33');
INSERT INTO `user_account_safe` VALUES ('136', '1', null, null, '0', null, '0', '2018-05-01 15:03:27', '2018-06-20 11:05:44');
INSERT INTO `user_account_safe` VALUES ('137', '1', null, null, '0', null, '0', '2018-05-01 15:13:28', '2018-05-01 15:13:28');
INSERT INTO `user_account_safe` VALUES ('138', '1', null, null, '0', null, '0', '2018-05-01 15:52:50', '2018-05-23 17:46:26');
INSERT INTO `user_account_safe` VALUES ('139', '1', null, null, '0', null, '0', '2018-05-01 16:30:20', '2018-05-01 16:30:20');
INSERT INTO `user_account_safe` VALUES ('140', '1', null, null, '0', null, '0', '2018-05-01 16:49:39', '2018-05-01 16:49:39');
INSERT INTO `user_account_safe` VALUES ('141', '1', null, null, '0', null, '0', '2018-05-01 21:26:43', '2018-05-01 21:27:08');
INSERT INTO `user_account_safe` VALUES ('142', '1', null, null, '0', null, '0', '2018-05-01 21:31:32', '2018-05-01 21:31:32');
INSERT INTO `user_account_safe` VALUES ('143', '1', null, null, '0', null, '0', '2018-05-01 21:33:37', '2018-05-01 21:33:37');
INSERT INTO `user_account_safe` VALUES ('144', '1', null, null, '0', null, '0', '2018-05-01 21:36:05', '2018-07-03 14:17:00');
INSERT INTO `user_account_safe` VALUES ('145', '1', null, null, '0', null, '0', '2018-05-01 22:13:49', '2018-05-04 14:28:26');
INSERT INTO `user_account_safe` VALUES ('146', '1', null, null, '0', null, '0', '2018-05-03 13:33:07', '2018-05-03 13:33:07');
INSERT INTO `user_account_safe` VALUES ('147', '1', null, null, '0', null, '0', '2018-05-03 13:52:09', '2018-05-03 13:57:04');
INSERT INTO `user_account_safe` VALUES ('148', '1', null, null, '0', null, '0', '2018-05-03 14:07:22', '2018-05-03 14:07:22');
INSERT INTO `user_account_safe` VALUES ('149', '1', null, null, '0', null, '0', '2018-05-03 14:15:01', '2018-05-23 16:30:36');
INSERT INTO `user_account_safe` VALUES ('150', '1', null, '1529995579', '1', null, '0', '2018-05-03 14:21:09', '2018-06-26 14:47:35');
INSERT INTO `user_account_safe` VALUES ('151', '1', null, null, '0', null, '0', '2018-05-07 15:34:03', '2018-05-07 15:34:03');
INSERT INTO `user_account_safe` VALUES ('152', '1', null, null, '0', null, '0', '2018-05-07 15:35:22', '2018-05-07 15:35:22');
INSERT INTO `user_account_safe` VALUES ('153', '1', null, null, '0', null, '0', '2018-05-07 15:39:05', '2018-05-07 15:39:05');
INSERT INTO `user_account_safe` VALUES ('154', '1', null, null, '0', null, '0', '2018-05-07 15:40:29', '2018-05-07 15:40:29');
INSERT INTO `user_account_safe` VALUES ('155', '1', null, null, '0', null, '0', '2018-05-07 15:41:43', '2018-05-07 15:41:43');
INSERT INTO `user_account_safe` VALUES ('156', '1', null, null, '0', null, '0', '2018-05-07 15:43:25', '2018-05-07 15:43:25');
INSERT INTO `user_account_safe` VALUES ('157', '1', null, null, '0', null, '0', '2018-05-07 16:11:34', '2018-05-07 16:11:34');
INSERT INTO `user_account_safe` VALUES ('158', '1', null, null, '0', null, '0', '2018-05-07 16:24:16', '2018-05-07 16:24:16');
INSERT INTO `user_account_safe` VALUES ('159', '1', null, null, '0', null, '0', '2018-05-07 16:27:08', '2018-05-07 16:27:08');
INSERT INTO `user_account_safe` VALUES ('160', '1', null, null, '0', null, '0', '2018-05-07 16:37:46', '2018-05-07 16:37:46');
INSERT INTO `user_account_safe` VALUES ('161', '1', null, null, '0', null, '0', '2018-05-08 09:44:17', '2018-05-08 09:44:17');
INSERT INTO `user_account_safe` VALUES ('162', '1', null, null, '0', null, '0', '2018-05-08 13:17:33', '2018-05-08 13:17:33');
INSERT INTO `user_account_safe` VALUES ('163', '1', null, null, '0', null, '0', '2018-05-08 13:21:03', '2018-05-08 13:21:03');
INSERT INTO `user_account_safe` VALUES ('164', '1', null, null, '0', null, '0', '2018-05-08 13:26:47', '2018-05-08 13:26:47');
INSERT INTO `user_account_safe` VALUES ('165', '1', null, null, '0', null, '0', '2018-05-08 13:30:34', '2018-05-08 13:30:34');
INSERT INTO `user_account_safe` VALUES ('166', '1', null, null, '0', null, '0', '2018-05-08 13:49:21', '2018-05-08 13:49:21');
INSERT INTO `user_account_safe` VALUES ('167', '1', null, null, '0', null, '0', '2018-05-08 14:06:49', '2018-05-08 14:06:49');
INSERT INTO `user_account_safe` VALUES ('168', '1', null, null, '0', null, '0', '2018-05-08 14:08:17', '2018-05-08 14:08:17');
INSERT INTO `user_account_safe` VALUES ('169', '1', null, null, '0', null, '0', '2018-05-08 14:57:15', '2018-05-08 14:57:15');
INSERT INTO `user_account_safe` VALUES ('170', '1', null, null, '0', null, '0', '2018-05-08 15:15:18', '2018-05-08 15:15:18');
INSERT INTO `user_account_safe` VALUES ('171', '1', null, null, '0', null, '0', '2018-05-08 15:17:44', '2018-05-08 15:17:44');
INSERT INTO `user_account_safe` VALUES ('172', '1', null, null, '0', null, '0', '2018-05-08 15:23:14', '2018-05-08 15:23:14');
INSERT INTO `user_account_safe` VALUES ('173', '1', null, null, '0', null, '0', '2018-05-09 13:34:02', '2018-05-09 13:34:02');
INSERT INTO `user_account_safe` VALUES ('174', '1', null, null, '0', null, '0', '2018-05-09 17:06:04', '2018-05-09 17:06:04');
INSERT INTO `user_account_safe` VALUES ('175', '1', null, null, '0', null, '0', '2018-05-14 16:08:28', '2018-05-14 16:08:28');
INSERT INTO `user_account_safe` VALUES ('176', '1', null, null, '0', null, '0', '2018-05-15 18:14:02', '2018-05-15 18:14:18');
INSERT INTO `user_account_safe` VALUES ('177', '1', null, null, '0', null, '0', '2018-05-21 14:49:51', '2018-05-23 19:57:54');
INSERT INTO `user_account_safe` VALUES ('178', '1', null, null, '0', null, '0', '2018-05-22 13:49:59', '2018-06-20 11:09:28');
INSERT INTO `user_account_safe` VALUES ('179', '1', null, null, '0', null, '0', '2018-05-22 17:10:46', '2018-05-22 17:10:46');
INSERT INTO `user_account_safe` VALUES ('180', '1', null, null, '0', null, '0', '2018-05-22 18:13:10', '2018-05-22 18:13:10');
INSERT INTO `user_account_safe` VALUES ('181', '1', null, null, '0', null, '0', '2018-05-22 19:45:53', '2018-05-22 19:46:06');
INSERT INTO `user_account_safe` VALUES ('182', '1', null, null, '0', null, '0', '2018-05-22 20:06:56', '2018-05-22 20:06:56');
INSERT INTO `user_account_safe` VALUES ('185', '1', null, null, '0', null, '0', '2018-05-28 14:00:28', '2018-05-31 09:10:23');
INSERT INTO `user_account_safe` VALUES ('186', '1', null, null, '0', null, '0', '2018-05-28 14:54:22', '2018-05-28 14:54:22');
INSERT INTO `user_account_safe` VALUES ('187', '1', null, null, '0', null, '0', '2018-05-28 16:07:43', '2018-06-07 16:14:22');
INSERT INTO `user_account_safe` VALUES ('188', '1', null, null, '0', null, '0', '2018-05-28 16:31:50', '2018-05-31 09:29:49');
INSERT INTO `user_account_safe` VALUES ('189', '1', null, null, '0', null, '0', '2018-05-28 17:25:56', '2018-05-28 17:25:56');
INSERT INTO `user_account_safe` VALUES ('190', '1', null, null, '0', null, '0', '2018-05-28 17:58:17', '2018-05-28 17:58:17');
INSERT INTO `user_account_safe` VALUES ('192', '1', null, null, '0', null, '0', '2018-05-29 10:42:27', '2018-05-29 10:42:27');
INSERT INTO `user_account_safe` VALUES ('194', '1', null, null, '0', null, '0', '2018-05-29 10:43:52', '2018-05-29 10:43:52');
INSERT INTO `user_account_safe` VALUES ('200', '1', null, null, '0', null, '0', '2018-05-29 14:18:45', '2018-05-29 14:18:45');
INSERT INTO `user_account_safe` VALUES ('201', '1', null, null, '0', null, '0', '2018-05-29 14:30:03', '2018-05-29 14:30:03');
INSERT INTO `user_account_safe` VALUES ('202', '1', null, null, '0', null, '0', '2018-05-29 14:51:06', '2018-05-29 14:51:06');
INSERT INTO `user_account_safe` VALUES ('204', '1', null, null, '0', null, '0', '2018-05-29 15:13:02', '2018-05-29 15:13:02');
INSERT INTO `user_account_safe` VALUES ('205', '1', null, null, '0', null, '0', '2018-05-29 15:27:24', '2018-05-29 15:27:24');
INSERT INTO `user_account_safe` VALUES ('206', '1', null, null, '0', null, '0', '2018-05-29 15:40:54', '2018-05-29 15:40:54');
INSERT INTO `user_account_safe` VALUES ('207', '1', null, null, '0', null, '0', '2018-05-29 16:08:02', '2018-05-29 16:08:02');
INSERT INTO `user_account_safe` VALUES ('208', '1', null, null, '0', null, '0', '2018-05-29 16:08:42', '2018-05-29 16:08:42');
INSERT INTO `user_account_safe` VALUES ('209', '1', null, null, '0', null, '0', '2018-05-29 16:11:23', '2018-05-29 16:11:23');
INSERT INTO `user_account_safe` VALUES ('210', '1', null, null, '0', null, '0', '2018-05-29 16:12:10', '2018-05-29 16:12:10');
INSERT INTO `user_account_safe` VALUES ('211', '1', null, null, '0', null, '0', '2018-05-29 16:14:01', '2018-05-29 16:14:01');
INSERT INTO `user_account_safe` VALUES ('212', '1', null, null, '0', null, '0', '2018-05-29 16:14:20', '2018-05-29 16:14:20');
INSERT INTO `user_account_safe` VALUES ('213', '1', null, null, '0', null, '0', '2018-05-29 16:17:48', '2018-05-29 16:17:48');
INSERT INTO `user_account_safe` VALUES ('214', '1', null, null, '0', null, '0', '2018-05-29 16:18:48', '2018-05-29 16:18:48');
INSERT INTO `user_account_safe` VALUES ('215', '1', null, null, '0', null, '0', '2018-05-29 16:19:40', '2018-05-29 16:19:40');
INSERT INTO `user_account_safe` VALUES ('216', '1', null, null, '0', null, '0', '2018-05-29 16:20:12', '2018-05-29 16:20:12');
INSERT INTO `user_account_safe` VALUES ('217', '1', null, null, '0', null, '0', '2018-05-29 16:20:47', '2018-05-29 16:20:47');
INSERT INTO `user_account_safe` VALUES ('218', '1', null, null, '0', null, '0', '2018-05-29 16:24:02', '2018-05-29 16:24:02');
INSERT INTO `user_account_safe` VALUES ('219', '1', null, null, '0', null, '0', '2018-05-29 16:24:55', '2018-05-29 16:24:55');
INSERT INTO `user_account_safe` VALUES ('220', '1', null, null, '0', null, '0', '2018-05-29 16:27:47', '2018-05-29 16:27:47');
INSERT INTO `user_account_safe` VALUES ('221', '1', null, null, '0', null, '0', '2018-05-29 16:37:23', '2018-05-29 16:37:23');
INSERT INTO `user_account_safe` VALUES ('222', '1', null, null, '0', null, '0', '2018-05-29 16:39:23', '2018-05-29 16:39:23');
INSERT INTO `user_account_safe` VALUES ('223', '1', null, null, '0', null, '0', '2018-05-29 16:44:03', '2018-05-29 16:44:03');
INSERT INTO `user_account_safe` VALUES ('224', '1', null, null, '0', null, '0', '2018-05-29 16:54:26', '2018-05-29 16:54:26');
INSERT INTO `user_account_safe` VALUES ('225', '1', null, null, '0', null, '0', '2018-05-31 09:58:22', '2018-06-08 14:59:25');
INSERT INTO `user_account_safe` VALUES ('226', '1', null, null, '0', null, '0', '2018-05-31 11:00:36', '2018-05-31 11:00:36');
INSERT INTO `user_account_safe` VALUES ('227', '1', null, null, '0', null, '0', '2018-05-31 11:05:22', '2018-05-31 11:05:22');
INSERT INTO `user_account_safe` VALUES ('228', '1', null, null, '0', null, '0', '2018-05-31 11:07:09', '2018-05-31 11:07:09');
INSERT INTO `user_account_safe` VALUES ('229', '1', null, null, '0', null, '0', '2018-05-31 11:24:08', '2018-06-24 14:57:28');
INSERT INTO `user_account_safe` VALUES ('230', '1', null, null, '0', null, '0', '2018-06-04 13:24:51', '2018-06-04 13:24:51');
INSERT INTO `user_account_safe` VALUES ('231', '1', null, null, '0', null, '0', '2018-06-04 13:28:10', '2018-06-04 13:28:10');
INSERT INTO `user_account_safe` VALUES ('232', '1', null, null, '0', null, '0', '2018-06-04 19:13:12', '2018-06-04 19:13:12');
INSERT INTO `user_account_safe` VALUES ('233', '1', null, null, '0', null, '0', '2018-06-04 19:24:28', '2018-06-04 19:24:28');
INSERT INTO `user_account_safe` VALUES ('234', '1', null, null, '0', null, '0', '2018-06-04 19:27:12', '2018-06-04 19:27:12');
INSERT INTO `user_account_safe` VALUES ('235', '1', null, null, '0', null, '0', '2018-06-05 13:30:42', '2018-06-05 13:30:42');
INSERT INTO `user_account_safe` VALUES ('236', '1', null, null, '0', null, '0', '2018-06-05 13:32:44', '2018-06-05 13:32:44');
INSERT INTO `user_account_safe` VALUES ('237', '1', null, null, '0', null, '0', '2018-06-05 13:37:01', '2018-06-05 13:37:01');
INSERT INTO `user_account_safe` VALUES ('238', '1', null, null, '0', null, '0', '2018-06-05 13:38:08', '2018-06-05 13:38:08');
INSERT INTO `user_account_safe` VALUES ('239', '1', null, null, '0', null, '0', '2018-06-05 13:41:28', '2018-06-05 13:41:28');
INSERT INTO `user_account_safe` VALUES ('240', '1', null, null, '0', null, '0', '2018-06-05 13:45:53', '2018-06-05 13:45:53');
INSERT INTO `user_account_safe` VALUES ('241', '1', null, null, '0', null, '0', '2018-06-05 14:13:57', '2018-06-05 14:13:57');
INSERT INTO `user_account_safe` VALUES ('242', '1', null, null, '0', null, '0', '2018-06-05 14:22:43', '2018-06-25 09:51:46');
INSERT INTO `user_account_safe` VALUES ('243', '1', null, null, '0', null, '0', '2018-06-06 16:09:57', '2018-06-06 16:09:57');
INSERT INTO `user_account_safe` VALUES ('244', '1', null, null, '0', null, '0', '2018-06-08 14:25:09', '2018-06-08 14:25:09');
INSERT INTO `user_account_safe` VALUES ('245', '1', null, null, '0', null, '0', '2018-06-08 15:19:54', '2018-06-08 15:19:54');
INSERT INTO `user_account_safe` VALUES ('246', '1', null, null, '0', null, '0', '2018-06-08 15:28:32', '2018-06-08 15:28:32');
INSERT INTO `user_account_safe` VALUES ('247', '1', null, null, '0', null, '0', '2018-06-08 15:39:27', '2018-06-08 15:39:27');
INSERT INTO `user_account_safe` VALUES ('248', '1', null, null, '0', null, '0', '2018-06-10 11:17:01', '2018-06-22 10:21:11');
INSERT INTO `user_account_safe` VALUES ('249', '1', null, null, '0', null, '0', '2018-06-12 13:16:11', '2018-06-12 13:16:11');
INSERT INTO `user_account_safe` VALUES ('250', '1', null, null, '0', null, '0', '2018-06-12 20:20:30', '2018-06-12 20:20:30');
INSERT INTO `user_account_safe` VALUES ('251', '1', null, null, '0', null, '0', '2018-06-12 20:22:22', '2018-06-12 20:22:22');
INSERT INTO `user_account_safe` VALUES ('252', '1', null, null, '0', null, '0', '2018-06-12 20:28:22', '2018-06-12 20:28:22');
INSERT INTO `user_account_safe` VALUES ('253', '1', null, null, '0', null, '0', '2018-06-12 20:54:44', '2018-06-12 20:54:44');
INSERT INTO `user_account_safe` VALUES ('254', '1', null, null, '0', null, '0', '2018-06-13 09:52:53', '2018-06-13 09:52:53');
INSERT INTO `user_account_safe` VALUES ('255', '1', null, null, '0', null, '0', '2018-06-13 10:00:54', '2018-06-13 10:00:54');
INSERT INTO `user_account_safe` VALUES ('256', '1', null, null, '0', null, '0', '2018-06-13 10:12:10', '2018-06-13 10:12:10');
INSERT INTO `user_account_safe` VALUES ('257', '1', null, null, '0', null, '0', '2018-06-13 10:15:03', '2018-06-13 10:15:03');
INSERT INTO `user_account_safe` VALUES ('258', '1', null, null, '0', null, '0', '2018-06-13 10:16:14', '2018-06-13 10:16:14');
INSERT INTO `user_account_safe` VALUES ('259', '1', null, null, '0', null, '0', '2018-06-13 10:19:40', '2018-06-13 10:19:40');
INSERT INTO `user_account_safe` VALUES ('260', '1', null, null, '0', null, '0', '2018-06-13 10:21:04', '2018-06-13 10:21:04');
INSERT INTO `user_account_safe` VALUES ('261', '1', null, null, '0', null, '0', '2018-06-13 10:22:28', '2018-06-22 17:01:52');
INSERT INTO `user_account_safe` VALUES ('262', '1', null, null, '0', null, '0', '2018-06-13 10:25:14', '2018-06-13 10:25:14');
INSERT INTO `user_account_safe` VALUES ('263', '1', null, null, '0', null, '0', '2018-06-13 10:27:13', '2018-06-13 10:27:13');
INSERT INTO `user_account_safe` VALUES ('264', '1', null, null, '0', null, '0', '2018-06-20 14:02:59', '2018-06-21 09:14:20');
INSERT INTO `user_account_safe` VALUES ('265', '1', null, null, '0', null, '0', '2018-06-20 14:05:36', '2018-06-28 20:27:54');
INSERT INTO `user_account_safe` VALUES ('266', '1', null, null, '0', null, '0', '2018-06-21 09:35:59', '2018-06-21 09:35:59');
INSERT INTO `user_account_safe` VALUES ('267', '1', null, null, '0', null, '0', '2018-06-21 09:46:53', '2018-06-24 14:29:27');
INSERT INTO `user_account_safe` VALUES ('268', '1', null, null, '0', null, '0', '2018-06-27 09:43:06', '2018-06-27 09:43:06');
INSERT INTO `user_account_safe` VALUES ('271', '1', null, null, '0', null, '0', '2018-06-28 19:51:21', '2018-06-28 19:51:21');
INSERT INTO `user_account_safe` VALUES ('272', '1', null, null, '0', null, '0', '2018-07-03 10:35:36', '2018-07-03 10:35:36');
INSERT INTO `user_account_safe` VALUES ('273', '2', null, null, '0', null, '0', '2018-07-03 15:38:29', '2018-07-03 16:35:00');

-- ----------------------------
-- Table structure for `user_platform`
-- ----------------------------
DROP TABLE IF EXISTS `user_platform`;
CREATE TABLE `user_platform` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `device_id` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '设备号\n',
  `platform` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ios/android\n',
  `version` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '版本\n',
  `register_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '推送服务设备号',
  `logindate` timestamp NULL DEFAULT NULL COMMENT '登陆时间',
  `logoutdate` timestamp NULL DEFAULT NULL COMMENT '退出时间',
  `user_id` int(11) DEFAULT '0' COMMENT '用户编号',
  `created_at` timestamp NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='手机设备信息';

-- ----------------------------
-- Records of user_platform
-- ----------------------------
INSERT INTO `user_platform` VALUES ('89', 'c66d0aa5-10bd-3a29-a4cc-5e741a60a943', 'android', '3.3.0', null, '2018-01-11 09:19:51', null, '491', '2017-09-18 13:48:16', '2018-05-01 21:51:00');
INSERT INTO `user_platform` VALUES ('90', '5c8fc7b17da84f881af6f40429175c28b3f6c87a', 'Android', '1.0.0', '071f54a0242', '2018-03-29 11:32:39', null, '486', '2017-09-18 13:52:54', '2018-03-29 11:32:39');
INSERT INTO `user_platform` VALUES ('91', '9930f045-25a4-3da8-92fa-74fbf39cf4ee', 'android', '4.0.1', null, '2018-02-02 10:17:18', null, '489', '2017-09-18 13:53:45', '2018-06-22 17:40:10');
INSERT INTO `user_platform` VALUES ('92', '5398a1ca-d571-3add-badc-5c49637ba75c', 'Android', '1.0.0', null, '2017-09-27 09:42:46', null, '395', '2017-09-18 14:01:23', '2017-09-27 09:42:46');
INSERT INTO `user_platform` VALUES ('93', null, 'iOS', '4.0.3', null, null, null, '0', '2017-09-18 14:12:43', '2018-07-03 16:03:12');
INSERT INTO `user_platform` VALUES ('94', 'd69617fb-8f2e-3625-95fd-42e51269ad37', 'Android', '2.1.0', null, '2017-10-11 16:20:33', null, '400', '2017-09-18 14:32:34', '2017-10-18 22:08:59');
INSERT INTO `user_platform` VALUES ('95', '35727ba55697c1faf70f9cfdcca10fb33d504e51', 'iOS', '1.0.0', null, '2017-09-18 17:04:48', null, '384', '2017-09-18 16:13:10', '2017-09-18 17:04:48');
INSERT INTO `user_platform` VALUES ('96', '543bee38-3328-301f-aefd-99272e2e57fa', 'android', '4.0.0', null, '2018-01-24 11:51:40', null, '486', '2017-09-19 11:01:59', '2018-05-21 13:42:52');
INSERT INTO `user_platform` VALUES ('97', '9b8ee4c8d01924b73c1d31d122e1428b01d140cd', 'iOS', '1.0.0', null, null, null, '0', '2017-09-27 10:34:16', '2017-09-27 10:34:16');
INSERT INTO `user_platform` VALUES ('98', '12a875c6ad16383ff4d93207e2c5563eaf558643', 'iOS', '2.3', null, '2017-12-26 14:29:49', null, '426', '2017-09-29 14:19:53', '2017-12-26 17:29:13');
INSERT INTO `user_platform` VALUES ('99', '4f62084be20f09dd0f06e4cf4ef09a3e6d90beaa', 'iOS', '2.1', '18171adc030924579ca', '2017-10-13 14:50:44', null, '408', '2017-10-11 14:03:48', '2017-10-13 14:50:44');
INSERT INTO `user_platform` VALUES ('100', '2f5e632d803c4e640f35f0d0e2a0616c8e1f793f', 'iOS', '1.0.0', null, '2017-10-11 15:36:30', null, '404', '2017-10-11 15:00:12', '2017-10-11 17:16:56');
INSERT INTO `user_platform` VALUES ('101', '913b00c7337b42aad5e07d67ed03ba0a3fbbc217', 'iOS', '1.0.0', '1517bfd3f7c3a61f184', '2017-10-13 14:26:46', null, '355', '2017-10-11 17:33:33', '2017-10-13 14:26:46');
INSERT INTO `user_platform` VALUES ('102', '715f67470790b12ef73a0247221dc321cc3cf488', 'iOS', '2.1.0', null, '2017-11-08 00:31:19', null, '412', '2017-10-12 11:26:02', '2017-11-08 01:06:51');
INSERT INTO `user_platform` VALUES ('103', 'a596ee93-6853-3e79-b4e9-a55b7f221442', 'Android', '1.0.0', null, '2017-10-14 16:40:25', null, '361', '2017-10-13 10:15:14', '2017-10-14 16:40:25');
INSERT INTO `user_platform` VALUES ('104', '17a264053ea3bca4f0fae8fa27e5b6c4f4d326b1', 'iOS', '2.1.0', '161a3797c800569af9c', '2017-11-28 21:53:14', null, '426', '2017-10-20 23:09:27', '2017-11-29 01:54:33');
INSERT INTO `user_platform` VALUES ('105', '6f27509dab6a34b60c45b0facd32bdbb08eee2b9', 'iOS', '2.1.0', null, '2017-10-26 19:48:22', null, '408', '2017-10-26 19:47:44', '2017-10-28 00:21:31');
INSERT INTO `user_platform` VALUES ('106', '57b9b8db26827381358f15455ffa79af2986ee5a', 'iOS', '2.1.0', null, '2017-10-26 19:51:54', null, '408', '2017-10-26 19:51:32', '2017-11-02 23:44:45');
INSERT INTO `user_platform` VALUES ('107', 'a1f8fbafebd65077e0815411919c08f9b9a4d2d4', 'iOS', '2.1.0', null, null, null, '0', '2017-10-26 23:31:39', '2017-10-26 23:31:39');
INSERT INTO `user_platform` VALUES ('108', '2096ee90045ff9f30de7cf0b7dd813cbb1a7697d', 'iOS', '2.1.0', null, '2017-10-26 23:35:18', null, '412', '2017-10-26 23:34:44', '2017-10-26 23:35:18');
INSERT INTO `user_platform` VALUES ('109', '60116e9b-f2ae-3e01-9eec-a49446e3c747', 'Android', '2.1.0', null, '2017-10-27 22:00:44', null, '409', '2017-10-27 21:59:42', '2018-03-27 16:51:58');
INSERT INTO `user_platform` VALUES ('110', '28016c3dea252ea6ffff5f940e36c63b06515269', 'iOS', '2.1.0', null, '2017-10-30 17:48:35', null, '408', '2017-10-30 17:48:13', '2017-11-01 03:04:29');
INSERT INTO `user_platform` VALUES ('111', 'eed4a725af72e77af5d142a78a8ef6a914c7cad1', 'iOS', '2.1.0', '1114a89792ad4465d48', '2017-11-01 22:11:15', null, '355', '2017-10-31 18:38:29', '2017-11-01 22:28:30');
INSERT INTO `user_platform` VALUES ('112', 'a186429b-ada3-3075-8765-9840c8fbf8b4', 'Android', '2.1.0', null, '2017-11-06 18:53:18', null, '406', '2017-10-31 22:02:24', '2017-11-06 18:53:18');
INSERT INTO `user_platform` VALUES ('113', '3c1d0e7b-6f78-3561-a94e-e89d4685e512', 'Android', '1.0.0', null, null, null, '0', '2017-11-01 22:02:22', '2017-11-01 22:02:22');
INSERT INTO `user_platform` VALUES ('114', 'ae4b33e0-6e8c-3d50-babc-a2f30e867787', 'Android', '2.1.0', null, '2017-12-05 23:16:13', null, '430', '2017-11-03 18:58:46', '2017-12-05 23:22:51');
INSERT INTO `user_platform` VALUES ('115', '7428a0d62471dcd8e6c90eb539a8a8a468d953f1', 'iOS', '2.3', '141fe1da9eae6d87f7a', '2017-12-27 18:16:05', null, '460', '2017-11-10 17:44:15', '2017-12-27 18:16:05');
INSERT INTO `user_platform` VALUES ('116', '52151621f7de728f68a5ea91706703a3e8cd74eb', 'iOS', '2.1.0', null, '2017-11-10 21:34:54', null, '414', '2017-11-10 21:33:50', '2017-11-16 19:16:38');
INSERT INTO `user_platform` VALUES ('117', 'd8b0bf67-55ae-3653-98ca-3c08cbae3495', 'Android', '2.1.0', null, '2017-12-01 22:35:38', null, '429', '2017-11-15 23:54:07', '2017-12-01 23:46:18');
INSERT INTO `user_platform` VALUES ('118', '8e8f788c-5137-339f-826c-8f96e1069486', 'Android', '2.1.0', null, null, null, '0', '2017-11-29 01:58:50', '2017-12-01 17:08:50');
INSERT INTO `user_platform` VALUES ('119', '2f5fc3d795e5ea4dbc7b35737b34cdca5fc5679f', 'iOS', '2.4', null, '2018-01-22 13:26:11', null, '487', '2017-11-29 02:04:22', '2018-01-22 13:27:40');
INSERT INTO `user_platform` VALUES ('120', 'e5e4a128ae34391b32ac08535187b0d0c6f3f5ab', 'iOS', '2.1.0', null, '2017-12-14 10:03:29', null, '426', '2017-12-08 14:48:18', '2017-12-14 11:46:21');
INSERT INTO `user_platform` VALUES ('121', 'd506fd1beb792657d3282e65a7c219b91450ff80', 'iOS', '1.0.0', null, null, null, '0', '2017-12-11 11:21:12', '2017-12-11 11:21:12');
INSERT INTO `user_platform` VALUES ('122', '3293e0c95ed3d2166a63da75563a7a5009664eee', 'iOS', '2.1.0', null, '2017-12-14 17:49:58', null, '437', '2017-12-14 15:04:46', '2018-03-01 10:04:41');
INSERT INTO `user_platform` VALUES ('123', '239f950137b7ed6f003e38fd2fd2052656c6d197', 'iOS', '2.3', null, '2018-01-11 09:22:41', null, '491', '2017-12-14 15:55:48', '2018-01-11 09:22:41');
INSERT INTO `user_platform` VALUES ('124', 'fa4b5a9ea2557512d97a4fc9395cf3f6bbad3147', 'iOS', '1.0.0', null, null, null, '0', '2017-12-15 15:13:46', '2017-12-15 15:13:46');
INSERT INTO `user_platform` VALUES ('125', '4f05db50-d7b9-3975-87d6-ca73c3ca4753', 'Android', '2.4', null, '2018-01-17 17:06:12', null, '489', '2017-12-21 17:48:35', '2018-01-17 17:06:12');
INSERT INTO `user_platform` VALUES ('126', 'fca687594713ad819448868d15f0cec0ab7f212f', 'iOS', '2.3', null, '2017-12-25 10:30:53', null, '426', '2017-12-25 10:30:21', '2017-12-25 11:39:11');
INSERT INTO `user_platform` VALUES ('127', 'ac87a64ae83f16ca401c8e20a225fcb18258cf2a', 'iOS', '2.3', null, '2017-12-25 11:45:39', null, '426', '2017-12-25 11:43:42', '2017-12-26 09:41:14');
INSERT INTO `user_platform` VALUES ('128', '1ac9196dc48f5e3e01cbc0ae9fef7f332e8013fb', 'iOS', '2.3', '121c83f760216d61cc1', '2018-01-22 13:25:44', null, '487', '2017-12-28 14:45:09', '2018-01-22 13:25:44');
INSERT INTO `user_platform` VALUES ('129', '4deda61d-1b6d-3a27-8d4a-e18118b9f095', 'Android', '2.4', null, '2018-01-19 15:47:02', null, '489', '2018-01-18 13:47:31', '2018-01-19 15:47:02');
INSERT INTO `user_platform` VALUES ('130', '5e23ad90-9b66-3ac5-9988-487f613bc53d', 'Android', '2.4', null, null, null, '0', '2018-01-22 11:57:31', '2018-01-22 11:57:31');
INSERT INTO `user_platform` VALUES ('131', '36e2a293-1f7f-3a21-a2f9-770f70048857', 'Android', '2.4', null, '2018-01-25 16:22:06', null, '489', '2018-01-23 10:04:47', '2018-01-25 16:22:06');
INSERT INTO `user_platform` VALUES ('132', 'e1535b65ed304c7e52ec43553e5a7d3b799faf2d', 'iOS', '2.4', null, '2018-03-04 14:50:05', null, '487', '2018-03-04 14:49:36', '2018-03-04 14:53:12');
INSERT INTO `user_platform` VALUES ('133', 'e039ac2c1ec3e953c7ecbbc0ac3e22e5b8a40d7e', 'iOS', '2.4', null, null, null, '0', '2018-03-22 18:00:35', '2018-03-22 18:00:35');
INSERT INTO `user_platform` VALUES ('134', '3234234234', 'ios', '3.2', null, null, null, '0', '2018-04-03 05:50:48', '2018-04-03 05:54:13');
INSERT INTO `user_platform` VALUES ('135', 's s s', 'android', '3.2', null, null, null, '0', '2018-04-04 01:53:19', '2018-04-04 01:54:04');
INSERT INTO `user_platform` VALUES ('136', '1', 'android', '3.2', '1', null, null, '0', '2018-04-04 03:07:12', '2018-04-04 03:07:38');
INSERT INTO `user_platform` VALUES ('137', 'er', 'ios', '3.2', null, null, null, '0', '2018-04-04 07:27:42', '2018-04-04 07:27:42');
INSERT INTO `user_platform` VALUES ('138', '123456', 'ios', '3.2', null, null, null, '0', '2018-04-04 09:31:06', '2018-04-04 09:31:06');
INSERT INTO `user_platform` VALUES ('139', '3242', 'ios', '3.2', null, null, null, '0', '2018-04-06 08:41:25', '2018-04-06 08:41:40');
INSERT INTO `user_platform` VALUES ('140', '112333', 'ios', '3.2', null, null, null, '0', '2018-04-08 01:55:34', '2018-04-08 01:55:34');
INSERT INTO `user_platform` VALUES ('141', '8241e025-085d-36d3-b6c2-172ade1af012', 'android', '4.0.1', null, null, null, '0', '2018-04-08 06:21:05', '2018-05-28 14:44:49');
INSERT INTO `user_platform` VALUES ('142', '3333', 'ios', '3.2', null, null, null, '0', '2018-04-09 02:28:14', '2018-04-09 02:28:14');
INSERT INTO `user_platform` VALUES ('143', 'b3ac517b-ddb6-3d80-85df-9ab6cfdd96a6', 'android', '4.0.0', null, null, null, '0', '2018-04-10 07:00:46', '2018-05-04 10:52:08');
INSERT INTO `user_platform` VALUES ('144', 'C4B0E6B5-8C57-4A58-A801-6D6AECB408B1', 'iOS', '3.3.0', null, null, null, '0', '2018-04-11 06:34:50', '2018-04-29 15:26:10');
INSERT INTO `user_platform` VALUES ('145', 'CDF9743E-FB50-4F35-9644-9FFF643EA8DC', 'iOS', '3.3.0', null, null, null, '0', '2018-04-11 07:37:15', '2018-04-29 11:30:26');
INSERT INTO `user_platform` VALUES ('146', '939D919C-ADF5-4AAE-A254-8C02862A26DC', 'iOS', '3.2.0', null, null, null, '0', '2018-04-12 12:52:48', '2018-04-26 01:43:24');
INSERT INTO `user_platform` VALUES ('147', '123445656546565', 'ios', '3.2', null, null, null, '0', '2018-04-12 13:09:59', '2018-04-12 13:09:59');
INSERT INTO `user_platform` VALUES ('148', '8B073D0D-E856-443C-A0DC-EA0AA728034D', 'iOS', '3.2.0', null, null, null, '0', '2018-04-12 13:10:10', '2018-04-19 02:43:45');
INSERT INTO `user_platform` VALUES ('149', 'ff5c9798-bbea-3423-8968-14097d29c57f', 'android', '4.0.1', null, null, null, '0', '2018-04-12 13:28:39', '2018-06-25 16:20:10');
INSERT INTO `user_platform` VALUES ('150', '158FD5F0-8667-4403-BD55-1E80DBAA3FC2', 'iOS', '3.2.0', null, null, null, '0', '2018-04-16 09:11:28', '2018-04-16 09:11:28');
INSERT INTO `user_platform` VALUES ('151', 'C169EC0F-0FBC-4230-B818-0B36EE39775F', 'iOS', '3.2.0', null, null, null, '0', '2018-04-16 09:12:03', '2018-04-16 09:56:12');
INSERT INTO `user_platform` VALUES ('152', '02648134-2E0E-460C-83F8-FA6B4AD643BA', 'iOS', '3.3.0', null, null, null, '0', '2018-04-17 07:03:52', '2018-04-30 15:26:55');
INSERT INTO `user_platform` VALUES ('153', 'C4F33963-99B7-4CB8-AB29-C2C3AB4E7E13', 'iOS', '3.3.0', null, null, null, '0', '2018-04-18 09:03:55', '2018-04-29 17:37:18');
INSERT INTO `user_platform` VALUES ('154', 'A3928653-9256-49AB-B5B4-A50145E4153C', 'iOS', '3.2.0', null, null, null, '0', '2018-04-19 06:10:21', '2018-04-26 20:19:04');
INSERT INTO `user_platform` VALUES ('155', 'e826a9ac-6a6f-3929-8b0e-eea40b7b4800', 'Android', '3.2.0', null, null, null, '0', '2018-04-23 02:45:28', '2018-04-23 09:09:25');
INSERT INTO `user_platform` VALUES ('156', 'C9465A5F-CCF8-4CCD-A6DF-BDE6A440E7D7', 'iOS', '3.3.0', null, null, null, '0', '2018-04-25 02:39:11', '2018-05-02 04:15:43');
INSERT INTO `user_platform` VALUES ('157', 'C7D96FA6-2B8C-42B9-B95B-9F6AA979EC21', 'iOS', '3.3.0', null, null, null, '0', '2018-04-27 11:20:21', '2018-04-27 11:20:21');
INSERT INTO `user_platform` VALUES ('158', '8E6800E4-95C4-4962-AA7F-79D60575E6E6', 'iOS', '3.3.0', null, null, null, '0', '2018-04-29 16:53:48', '2018-04-29 17:00:47');
INSERT INTO `user_platform` VALUES ('159', '6ed1abef30caa46fac7c350aaf7011454bf16aa5', 'iOS', '3.3.0', null, null, null, '0', '2018-04-29 17:46:20', '2018-04-29 18:05:35');
INSERT INTO `user_platform` VALUES ('160', 'b77359791544ce67b3536765306e4d04aecfd3f1', 'iOS', '4.0.1', null, null, null, '0', '2018-04-30 09:52:09', '2018-05-31 10:16:54');
INSERT INTO `user_platform` VALUES ('161', '5dc7594513aa482332750714e27b2dd51b798469', 'iOS', '4.0.0', null, null, null, '0', '2018-04-30 09:54:04', '2018-05-23 18:50:14');
INSERT INTO `user_platform` VALUES ('162', '021865be5ff49e1e174b4642ae0fe125c8bc9e0e', 'iOS', '3.3.0', null, null, null, '0', '2018-04-30 14:45:13', '2018-05-01 15:48:13');
INSERT INTO `user_platform` VALUES ('163', '6ffcd14d1256b30d41f334fd95c5391c94a1134c', 'iOS', '3.3.0', null, null, null, '0', '2018-04-30 18:07:25', '2018-05-02 00:24:34');
INSERT INTO `user_platform` VALUES ('164', '6c15f43b2c7cb09ca59cac108890ec07378eb71e', 'iOS', '4.1.0', null, null, null, '0', '2018-05-01 10:57:02', '2018-06-26 10:27:50');
INSERT INTO `user_platform` VALUES ('165', 'c97710798d63dbcdb2202c708959934e54bb5094', 'iOS', '4.0.1', null, null, null, '0', '2018-05-03 11:48:09', '2018-05-30 16:58:02');
INSERT INTO `user_platform` VALUES ('166', '7b66bf3ea5c98afdf0677eac7a0747756bafb371', 'iOS', '4.0.1', null, null, null, '0', '2018-05-03 14:58:39', '2018-06-05 10:52:30');
INSERT INTO `user_platform` VALUES ('167', '4e5a29a6ad73fc32778de9f8fdf76e2ef8b73de2', 'iOS', '4.0.0', null, null, null, '0', '2018-05-03 15:00:27', '2018-05-04 09:06:35');
INSERT INTO `user_platform` VALUES ('168', 'ca729eee22820f4f5331200b78eb38a67e0c79d2', 'iOS', '4.0.0', null, null, null, '0', '2018-05-10 13:58:07', '2018-05-10 19:05:42');
INSERT INTO `user_platform` VALUES ('169', '814f8a28-9625-394a-b07a-702b41539dad', 'android', '4.0.0', null, null, null, '0', '2018-05-10 15:25:32', '2018-05-23 20:23:20');
INSERT INTO `user_platform` VALUES ('170', '7df78ae0ae232a63be6019116dbc32a1eae2200b', 'iOS', '4.0.1', null, null, null, '0', '2018-05-16 17:06:03', '2018-05-30 11:25:59');
INSERT INTO `user_platform` VALUES ('171', 'e472e6a3-6f39-3079-8f42-5fc61448f254', 'android', '4.0.0', null, null, null, '0', '2018-05-20 10:34:28', '2018-05-20 16:03:08');
INSERT INTO `user_platform` VALUES ('172', '8de348b3ac3933fedad9f6828e165df0482a003a', 'iOS', '4.1.0', null, null, null, '0', '2018-05-20 13:39:31', '2018-07-03 14:16:34');
INSERT INTO `user_platform` VALUES ('173', '768279d5-324e-3b8f-9030-106631988983', 'android', '4.1.0', null, null, null, '0', '2018-05-21 15:01:28', '2018-07-02 14:37:21');
INSERT INTO `user_platform` VALUES ('174', '1c1fee92-d4cd-37ce-8dfb-a64d5a115d35', 'android', '4.0.0', null, null, null, '0', '2018-05-22 13:56:27', '2018-05-22 15:45:56');
INSERT INTO `user_platform` VALUES ('175', '451392da31ac65eda6e63648c60916fe50a9c67a', 'iOS', '4.1.0', null, null, null, '0', '2018-05-22 16:48:08', '2018-06-22 15:19:23');
INSERT INTO `user_platform` VALUES ('176', 'eeba40f17038314a9e91bb334e80d76a5bd46c13', 'iOS', '4.0.1', null, null, null, '0', '2018-05-28 09:21:46', '2018-05-31 10:12:23');
INSERT INTO `user_platform` VALUES ('177', '2c26b16a-d114-36a9-9628-7de25a41b94b', 'android', '4.0.1', null, null, null, '0', '2018-05-28 14:09:23', '2018-06-08 16:24:59');
INSERT INTO `user_platform` VALUES ('178', 'b0d3b9c6b51d09d4b3378045ecf8a6aa9954b7d2', 'iOS', '4.0.1', null, null, null, '0', '2018-05-30 14:29:44', '2018-06-13 09:39:43');
INSERT INTO `user_platform` VALUES ('179', 'fca6cda035fc9e0db329e9d443d101cfdf8b93b0', 'iOS', '4.0.1', null, null, null, '0', '2018-05-30 14:37:01', '2018-05-30 14:37:01');
INSERT INTO `user_platform` VALUES ('180', '0756cf31973fb97b591703f14d5874207831ae19', 'iOS', '4.1.0', null, null, null, '0', '2018-05-31 09:39:03', '2018-07-02 15:05:35');
INSERT INTO `user_platform` VALUES ('181', 'ce006c7e-2317-33c7-b939-808e6ef6a2b7', 'android', '4.0.1', null, null, null, '0', '2018-05-31 11:23:41', '2018-05-31 11:24:42');
INSERT INTO `user_platform` VALUES ('182', 'b9dd6750fa8bf3679f76e2c1b9ab37b10dd34973', 'iOS', '4.0.1', null, null, null, '0', '2018-06-05 14:29:18', '2018-06-05 14:29:18');
INSERT INTO `user_platform` VALUES ('183', 'e4c95176-858e-3be1-9902-97bdf149077c', 'android', '4.0.1', null, null, null, '0', '2018-06-06 10:08:01', '2018-06-22 14:41:52');
INSERT INTO `user_platform` VALUES ('184', '4f14e457-bef3-3202-8a21-071792c1b275', 'android', '4.0.1', null, null, null, '0', '2018-06-06 15:43:30', '2018-06-21 20:46:36');
INSERT INTO `user_platform` VALUES ('185', '4b94e76fd81c233929f72f45380d0b0326c98999', 'iOS', '4.0.1', null, null, null, '0', '2018-06-07 15:32:55', '2018-06-07 15:32:55');
INSERT INTO `user_platform` VALUES ('186', 'fa88843e131f4f1185a17bedd3d6da4f0c3a4168', 'iOS', '4.1.0', null, null, null, '0', '2018-06-20 11:04:22', '2018-06-25 16:48:13');
INSERT INTO `user_platform` VALUES ('187', '4fea26e923d47f86e1ae684c6ab34e9a38363e84', 'iOS', '4.1.0', null, null, null, '0', '2018-06-20 11:09:36', '2018-07-03 10:31:29');
INSERT INTO `user_platform` VALUES ('188', '65e83ead-db89-36c6-bb04-28f38ce8a1ce', 'android', '4.0.1', null, null, null, '0', '2018-06-20 13:43:11', '2018-06-25 14:28:11');
INSERT INTO `user_platform` VALUES ('189', 'd4857234568cb6d6efd324978c28543effedc91f', 'iOS', '4.0.1', null, null, null, '0', '2018-06-22 09:31:07', '2018-06-22 10:29:32');
INSERT INTO `user_platform` VALUES ('190', '261b7756e2aa432cd723df46a37170e44f273d39', 'iOS', '4.1.0', null, null, null, '0', '2018-06-22 11:01:25', '2018-06-22 13:37:38');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) NOT NULL COMMENT '手机号',
  `name` varchar(11) NOT NULL COMMENT '用户名',
  `pay_password` varchar(128) NOT NULL DEFAULT '' COMMENT '支付密码',
  `password` varchar(128) NOT NULL COMMENT '密码',
  `from_uid` int(11) NOT NULL DEFAULT '0' COMMENT '邀请用户ID',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `source` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '注册来源',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=utf8 COMMENT='注册用户表';

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('132', '15939464866', '15939464866', 'e10adc3949ba59abbe56e057f20f883e', '$2y$10$utq04SlFZJVjp/f.61aDn.IzeuAjc8TLc1pk6KlG9z9.nGOJSub6m', '0', '2018-05-01 14:37:40', '2018-05-10 13:43:31', '');
INSERT INTO `users` VALUES ('133', '17612163365', '17612163365', 'e807f1fcf82d132f9bb018ca6738a19f', '$2y$10$A.BsKAsGBNWZcXcu.MqkO.eiW4evYOv3ubhVZ4xM5zZzTK2B396Si', '0', '2018-05-01 14:40:05', '2018-05-01 15:02:14', '');
INSERT INTO `users` VALUES ('140', '17601279633', '17601279633', 'e10adc3949ba59abbe56e057f20f883e', '$2y$10$iAqRz8tK5pnTclp2eO1ek.GI1gggm6yZdFysG.Hh9jRofUUWCuEHe', '0', '2018-05-01 16:51:04', '2018-05-23 15:42:31', '');
INSERT INTO `users` VALUES ('144', '18321003076', '18321003076', 'e10adc3949ba59abbe56e057f20f883e', '$2y$10$hGc3v3o2qOmxIkqV79qX.uTiVIERN4HnT3KnJtPpuBEkMVSa9vCtq', '132', '2018-05-01 21:37:30', '2018-05-01 21:37:30', '');
INSERT INTO `users` VALUES ('145', '13472551505', '13472551505', 'e10adc3949ba59abbe56e057f20f883e', '$2y$10$JkwgSUgH2qxtqsLvYM5UXurcS2/dpqV4nwdjyG7QwLOe7OK0gbQaK', '0', '2018-05-01 22:15:14', '2018-05-01 22:15:14', '');
INSERT INTO `users` VALUES ('150', '18616712731', '18616712731', '8a13a331eb3d9f675dc8449f72f13a16', '$2y$10$pbwVlv4vyG/AM.fPEpkE8ulxWR.3KiirH22/3pvAc.OcIy2vVmose', '0', '2018-05-03 14:22:34', '2018-05-03 14:22:34', '');
INSERT INTO `users` VALUES ('175', '17621133265', '17621133265', 'e10adc3949ba59abbe56e057f20f883e', '$2y$10$vcYHQtxJlSdItb.tOUruC.Fx4MlytmR26i7kgV2BOGEJrtUrAy8Yy', '0', '2018-05-14 16:07:06', '2018-05-15 10:06:23', '');
INSERT INTO `users` VALUES ('176', '17621626013', '17621626013', '0', '$2y$10$PR.oOmU7vYf.KXo9xrEsW./HKFArmSzIR0DIRVGSPLlTBHNyUR.aO', '0', '2018-05-15 18:15:28', '2018-05-15 18:15:28', '');
INSERT INTO `users` VALUES ('177', '15268812232', '15268812232', 'e10adc3949ba59abbe56e057f20f883e', '$2y$10$JhGumVg47JUiycYd7pd6OugSTkmW3a8g5B4H74sHpWGTpCrTB6uN.', '0', '2018-05-21 14:49:51', '2018-05-23 20:27:31', '');
INSERT INTO `users` VALUES ('178', '15518212052', '15518212052', 'e10adc3949ba59abbe56e057f20f883e', '$2y$10$OxLSt35HRSyMPZQ8aovnL.AicYXUABVz5hRQP/N88wmYQV8W.Cvrm', '0', '2018-05-22 13:49:59', '2018-06-20 17:07:05', '');
INSERT INTO `users` VALUES ('182', '17301750848', '17301750848', '96e79218965eb72c92a549dd5a330112', '$2y$10$bYKbaJPY2Eb11OH/0.xHn.PAP6OjbhsdGPpxA77QvB8Vfwq/KY.lu', '0', '2018-05-22 20:06:56', '2018-05-22 20:07:38', '');
INSERT INTO `users` VALUES ('184', '13126826307', '13126826307', '111111', '11111', '0', '2018-05-24 15:24:24', '2018-05-24 15:24:24', '');
INSERT INTO `users` VALUES ('188', '15618320519', '15618320519', 'e10adc3949ba59abbe56e057f20f883e', '$2y$10$ukPqiKdv/8Qk5AazzQoM..RSlyBDvtVSx/UTEkyig90Gae3HRQK2.', '0', '2018-05-28 16:31:50', '2018-05-30 16:10:19', '');
INSERT INTO `users` VALUES ('199', '13126826308', '13126826308', '0', '$2y$10$UwV1Z2bZvy.i1SnOqALf/.O5hv96jop9DjRvKKpTIYvzTZpcKy6q6', '0', '2018-05-29 14:17:40', '2018-05-29 14:17:40', '');
INSERT INTO `users` VALUES ('200', '13126826300', '13126826300', '0', '$2y$10$p3oj7I36Icccbw5.cI91QuIU2WWZcvaCyC3BhBjh8ShXu6b2LHFZ.', '0', '2018-05-29 14:18:45', '2018-05-29 14:18:45', '');
INSERT INTO `users` VALUES ('201', '13126826320', '13126826320', '0', '$2y$10$EnvLBHHCIVNjdWGibksPde.yBidpD1kSMJmp4/URKbZ8xOJfH/nEW', '0', '2018-05-29 14:30:03', '2018-05-29 14:30:03', '');
INSERT INTO `users` VALUES ('206', '17621916347', '17621916347', '0', '$2y$10$W7lb1bCswZpV4z7Adjtesu0qUye1TelVVr/izfyXTUvx6UPDT11re', '0', '2018-05-29 15:40:54', '2018-05-29 15:40:54', '');
INSERT INTO `users` VALUES ('208', '15921040001', '15921040001', '0', '$2y$10$FwZiL8H3/a.GWCCoMq3JGO57GhTO6u0Vprms679tp2oa/wmb6G7Yy', '0', '2018-05-29 16:08:42', '2018-05-29 16:08:42', '');
INSERT INTO `users` VALUES ('209', '13062692015', '13062692015', '0', '$2y$10$tAgw4QbbtBP85zjl4KVrX.riq1VPt/Nsh7j/VEiP2q3vMkGrlriT6', '0', '2018-05-29 16:11:23', '2018-05-29 16:11:23', '');
INSERT INTO `users` VALUES ('210', '13062692045', '13062692045', '0', '$2y$10$CzUVkEV7ScBwIDpU8v7X2upN3HQ5/30WWmleViirb7g8oYZ0iUvMW', '0', '2018-05-29 16:12:10', '2018-05-29 16:12:10', '');
INSERT INTO `users` VALUES ('211', '13062682819', '13062682819', '0', '$2y$10$AYy7gW9UMXmO0ahkwhds3uKAJKYPfT9ZcXbi6pZ7YHINnUCtxAYia', '0', '2018-05-29 16:14:01', '2018-05-29 16:14:01', '');
INSERT INTO `users` VALUES ('212', '13062682818', '13062682818', '0', '$2y$10$VwPSknRqx31dD3yJDI60hOlnqiPo7bXcygngnf3lFE6A1PdpD.EzK', '0', '2018-05-29 16:14:20', '2018-05-29 16:14:20', '');
INSERT INTO `users` VALUES ('213', '13087262181', '13087262181', '0', '$2y$10$haZrKA0wmif4O0e4QYn37ew6DTRu9w6YzmKzHHL5ENcLjRXojrVc2', '0', '2018-05-29 16:17:48', '2018-05-29 16:17:48', '');
INSERT INTO `users` VALUES ('214', '13062692030', '13062692030', '0', '$2y$10$JTL9nVCcdTU4V1Kdp1n/ie2aLz2tFCJql9aepKabd9eTqiPpHhOVi', '0', '2018-05-29 16:18:48', '2018-05-29 16:18:48', '');
INSERT INTO `users` VALUES ('215', '13062892090', '13062892090', '0', '$2y$10$nrJeLZe2tyxSWWeplHHV.ebepVEahW2Req9tO4mIb2u6nyrahm3sm', '0', '2018-05-29 16:19:40', '2018-05-29 16:19:40', '');
INSERT INTO `users` VALUES ('216', '13061629201', '13061629201', '0', '$2y$10$4sf2ITnI1TJAQvVFY7yq0OVpIMImtLayOtVyaiXusnv2cWbpEupZK', '0', '2018-05-29 16:20:12', '2018-05-29 16:20:12', '');
INSERT INTO `users` VALUES ('217', '13062692048', '13062692048', '0', '$2y$10$jiTBgm/ZLnALpK8f0YJgWOQTC.tK/KYAJiveotAu4mfWnm27agcIq', '0', '2018-05-29 16:20:47', '2018-05-29 16:20:47', '');
INSERT INTO `users` VALUES ('219', '13062692020', '13062692020', '0', '$2y$10$9rpXjYmDXNzbN/h2g45QF.F7klw.SLZ..dToy8F6aTjueyUhDtorK', '0', '2018-05-29 16:24:55', '2018-05-29 16:24:55', '');
INSERT INTO `users` VALUES ('229', '13120733632', '13120733632', 'e10adc3949ba59abbe56e057f20f883e', '$2y$10$iyYTJG0pVPVa2lG7jsNREeo/WAWqka/QF4zBTsnpOPVD3uDyY7uuS', '0', '2018-05-31 11:24:08', '2018-06-06 10:08:26', '');
INSERT INTO `users` VALUES ('231', '18621389071', '18621389071', '0', '$2y$10$eb0s5jYs6U.UIdvACQRCDO3XXJESt4gEEht/0Fj83wAUaDp7pgfb2', '0', '2018-06-04 13:28:10', '2018-06-04 13:31:45', '');
INSERT INTO `users` VALUES ('242', '17601617060', '17601617060', '0', '$2y$10$JklIKFZ1gXNTzSpn88A63uoPhlthI41jEzksn2Hb7lFSaNIatFV5i', '0', '2018-06-05 14:22:43', '2018-06-05 14:22:43', '');
INSERT INTO `users` VALUES ('243', '13126826311', '13126826311', '0', '$2y$10$f2t1PRdfyxKLpCj.FtZ.ZuqHoC0eVDaGh./gVDIogkQOqptxgR0La', '0', '2018-06-06 16:09:57', '2018-06-06 16:09:57', '');
INSERT INTO `users` VALUES ('244', '18221503642', '18221503642', 'e10adc3949ba59abbe56e057f20f883e', '$2y$10$fOj00QcbVTVxCXk5U0Ev6O0sBzCo3DsNCCjILzzqE.AmIz4UTYRKy', '0', '2018-06-08 14:25:09', '2018-06-08 14:32:47', '');
INSERT INTO `users` VALUES ('246', '15921040010', '15921040010', '0', '$2y$10$F5Inh0rBtYvX1jrEzF2REODqfyHVGx5VTy8n/LJpOFTR5Z4lFUOsm', '0', '2018-06-08 15:28:32', '2018-06-08 15:28:32', '');
INSERT INTO `users` VALUES ('247', '18334795115', '18334795115', '0', '$2y$10$wfAilvINT.Az8Ztw7vQr4uY9HWFQh.z13sDIh56tg5EV/2NmCx0O.', '0', '2018-06-08 15:39:27', '2018-06-08 15:39:27', '');
INSERT INTO `users` VALUES ('248', '18334795116', '18334795116', 'e10adc3949ba59abbe56e057f20f883e', '$2y$10$e2XWdbdsPbeVjsZluURY7OkOS3JPTDf7LhNEm/d78k.aPaKhW2B96', '0', '2018-06-10 11:17:01', '2018-06-12 09:37:19', '');
INSERT INTO `users` VALUES ('249', '15000019498', '15000019498', 'e10adc3949ba59abbe56e057f20f883e', '$2y$10$BcTeyymkbsRceDigLdZhIurCpM3cpTA1yKZj9DEV6VD1lFcmG7YNu', '0', '2018-06-12 13:16:11', '2018-06-22 09:32:14', '');
INSERT INTO `users` VALUES ('250', '13062692099', '13062692099', '0', '$2y$10$Bo3rlKiuUPVTHGyqF2H2CemPDqkaVtTjMBVhJccioI.XUXNqFbw9O', '0', '2018-06-12 20:20:30', '2018-06-12 20:20:30', '');
INSERT INTO `users` VALUES ('251', '13062692088', '13062692088', '0', '$2y$10$cDgKXyybvpDq09yDjdnEsu5gxlt3REMcXk5uc0SdU4upZXoCickOm', '0', '2018-06-12 20:22:22', '2018-06-12 20:22:22', '');
INSERT INTO `users` VALUES ('252', '13062692066', '13062692066', '0', '$2y$10$MFAj/mX.vehxqU0eY7ZEbei29IVl3j7fy2dcwSCWWpoxJ.B3KW0Ce', '0', '2018-06-12 20:28:22', '2018-06-12 20:28:22', '');
INSERT INTO `users` VALUES ('253', '13062692086', '13062692086', '0', '$2y$10$X56S6dp/d6q7QBw91gSQjeHMFsI.MjHP5rSR8hA9UXtdvzmBGZRO.', '0', '2018-06-12 20:54:44', '2018-06-12 20:54:44', '');
INSERT INTO `users` VALUES ('261', '18621389073', '18621389073', 'e10adc3949ba59abbe56e057f20f883e', '$2y$10$/D9e69DQj6FK8E8qgkXUCeMiHvDvg0D/FQSbadwj34sx3.D6.i9JO', '0', '2018-06-13 10:22:28', '2018-06-20 13:46:12', '');
INSERT INTO `users` VALUES ('263', '18236968868', '18236968868', '0', '$2y$10$UYruCIYNpR6jcT1nOWzu3.tFcdSzyOh.E80lD4oH4ea0I80jcVn9S', '0', '2018-06-13 10:27:13', '2018-06-13 10:27:13', '');
INSERT INTO `users` VALUES ('264', '18236968869', '18236968869', 'e10adc3949ba59abbe56e057f20f883e', '$2y$10$En0MBSJ6qoDjXrdMrQYG7uAK0WSbOykbc9JkrfB1YiRFzhrgp6Xny', '0', '2018-06-20 14:02:59', '2018-06-22 15:40:43', '');
INSERT INTO `users` VALUES ('266', '18339919633', '18339919633', 'e10adc3949ba59abbe56e057f20f883e', '$2y$10$cpDz6KGlGbpjbd76tj2PtupKLujAA4/yi6yCPUSE4Hq3e3Wq0Aule', '0', '2018-06-21 09:35:59', '2018-06-21 10:06:08', '');
INSERT INTO `users` VALUES ('267', '18018568025', '18018568025', 'e10adc3949ba59abbe56e057f20f883e', '$2y$10$7x5BNPwf/lu9PkNfG5.mK.OdbbD9xgNhINqF.OdM7SEQT24sCgGA.', '0', '2018-06-21 09:46:53', '2018-06-21 10:04:22', '');
INSERT INTO `users` VALUES ('268', '18696176632', '18696176632', '0', '$2y$10$ZnNpDUZiJIfjMk5TdIwsgusja6E1ybecFgjS/G0s6fKhaj40lBBlO', '0', '2018-06-27 09:43:06', '2018-06-27 09:43:06', '');
INSERT INTO `users` VALUES ('271', '13062692010', '13062692010', '0', '$2y$10$houwlz/6dpQMPxgu/otJxuhjwalXGC9FG8KfXHyilDbLWodKfDKJm', '0', '2018-06-28 19:51:21', '2018-06-28 19:51:21', '3333');
INSERT INTO `users` VALUES ('273', '17607155535', '17607155535', '0', '$2y$10$qlJmfBB82nuXZFG2HjNCA.LWS7aEM1toCOiv9aPpyEKFdVGOHfxte', '0', '2018-07-03 15:38:29', '2018-07-03 15:38:29', null);

-- ----------------------------
-- Table structure for `withdraw_cash_review`
-- ----------------------------
DROP TABLE IF EXISTS `withdraw_cash_review`;
CREATE TABLE `withdraw_cash_review` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '提现人的id',
  `amount` int(11) DEFAULT '0' COMMENT '提现的金额数 单位为分',
  `service_money` int(11) DEFAULT '0' COMMENT '服务费,单位分',
  `service_rate` int(11) DEFAULT '0' COMMENT '服务费率 单位万分之一',
  `to_account_money` int(11) DEFAULT '0' COMMENT '到账金额, 单位为分',
  `remain_money` int(11) DEFAULT '0' COMMENT '账户余额,单位为分',
  `review_status` tinyint(2) DEFAULT NULL COMMENT '审核状态 1:待审核 2:审核通过 3:审核拒绝',
  `review_person` varchar(30) DEFAULT '' COMMENT '审核人',
  `refuse_reason` tinytext COMMENT '拒绝原因',
  `review_date` timestamp NULL DEFAULT NULL COMMENT '审核日期',
  `created_at` timestamp NULL,
  `updated_at` timestamp NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='提现记录审核表';

-- ----------------------------
-- Records of withdraw_cash_review
-- ----------------------------
INSERT INTO `withdraw_cash_review` VALUES ('1', '178', '100000', '0', '0', '0', '100000', '2', 'admin', '', '2018-07-03 16:33:38', '2018-07-02 14:19:32', '2018-07-03 16:33:38');

-- ----------------------------
-- Table structure for `working_abnormal`
-- ----------------------------
DROP TABLE IF EXISTS `working_abnormal`;
CREATE TABLE `working_abnormal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` tinyint(4) DEFAULT NULL COMMENT '来源表，1/borrower_repay',
  `working_id` int(11) DEFAULT NULL COMMENT '数据ID，关联的表取自于table_name',
  `describe` text COMMENT '异常描述',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='异常日志';

-- ----------------------------
-- Records of working_abnormal
-- ----------------------------
