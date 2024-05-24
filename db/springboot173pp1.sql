/*
Navicat MySQL Data Transfer

Source Server         : localhost3307
Source Server Version : 50727
Source Host           : localhost:3307
Source Database       : springboot173pp

Target Server Type    : MYSQL
Target Server Version : 50727
File Encoding         : 65001

Date: 2024-05-20 10:46:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='配置文件';

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('1', 'picture1', 'http://localhost:8080/springboot173pp/upload/picture1.jpg');
INSERT INTO `config` VALUES ('2', 'picture2', 'http://localhost:8080/springboot173pp/upload/picture2.jpg');
INSERT INTO `config` VALUES ('3', 'picture3', 'http://localhost:8080/springboot173pp/upload/picture3.jpg');
INSERT INTO `config` VALUES ('6', 'homepage', null);

-- ----------------------------
-- Table structure for discusskefangxinxi
-- ----------------------------
DROP TABLE IF EXISTS `discusskefangxinxi`;
CREATE TABLE `discusskefangxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `nickname` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext NOT NULL COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='客房信息评论表';

-- ----------------------------
-- Records of discusskefangxinxi
-- ----------------------------
INSERT INTO `discusskefangxinxi` VALUES ('111', '2021-03-09 01:33:19', '1', '1', '用户名1', '评论内容1', '回复内容1');
INSERT INTO `discusskefangxinxi` VALUES ('112', '2021-03-09 01:33:19', '2', '2', '用户名2', '评论内容2', '回复内容2');
INSERT INTO `discusskefangxinxi` VALUES ('113', '2021-03-09 01:33:19', '3', '3', '用户名3', '评论内容3', '回复内容3');
INSERT INTO `discusskefangxinxi` VALUES ('114', '2021-03-09 01:33:19', '4', '4', '用户名4', '评论内容4', '回复内容4');
INSERT INTO `discusskefangxinxi` VALUES ('115', '2021-03-09 01:33:19', '5', '5', '用户名5', '评论内容5', '回复内容5');
INSERT INTO `discusskefangxinxi` VALUES ('116', '2021-03-09 01:33:19', '6', '6', '用户名6', '评论内容6', '回复内容6');

-- ----------------------------
-- Table structure for fuwufeiyong
-- ----------------------------
DROP TABLE IF EXISTS `fuwufeiyong`;
CREATE TABLE `fuwufeiyong` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `fangjianhao` varchar(200) DEFAULT NULL COMMENT '房间号',
  `fuwuxiangmu` varchar(200) DEFAULT NULL COMMENT '服务项目',
  `fuwufeiyong` varchar(200) DEFAULT NULL COMMENT '服务费用',
  `dengjishijian` datetime DEFAULT NULL COMMENT '登记时间',
  `beizhu` longtext COMMENT '备注',
  `ispay` varchar(200) DEFAULT '未支付' COMMENT '是否支付',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='服务费用';

-- ----------------------------
-- Records of fuwufeiyong
-- ----------------------------
INSERT INTO `fuwufeiyong` VALUES ('71', '2021-03-09 01:33:19', '用户账号1', '用户姓名1', '房间号1', '服务项目1', '服务费用1', '2021-03-09 01:33:19', '备注1', '未支付');
INSERT INTO `fuwufeiyong` VALUES ('72', '2021-03-09 01:33:19', '用户账号2', '用户姓名2', '房间号2', '服务项目2', '服务费用2', '2021-03-09 01:33:19', '备注2', '未支付');
INSERT INTO `fuwufeiyong` VALUES ('73', '2021-03-09 01:33:19', '用户账号3', '用户姓名3', '房间号3', '服务项目3', '服务费用3', '2021-03-09 01:33:19', '备注3', '未支付');
INSERT INTO `fuwufeiyong` VALUES ('74', '2021-03-09 01:33:19', '用户账号4', '用户姓名4', '房间号4', '服务项目4', '服务费用4', '2021-03-09 01:33:19', '备注4', '未支付');
INSERT INTO `fuwufeiyong` VALUES ('75', '2021-03-09 01:33:19', '用户账号5', '用户姓名5', '房间号5', '服务项目5', '服务费用5', '2021-03-09 01:33:19', '备注5', '未支付');
INSERT INTO `fuwufeiyong` VALUES ('76', '2021-03-09 01:33:19', '用户账号6', '用户姓名6', '房间号6', '服务项目6', '服务费用6', '2021-03-09 01:33:19', '备注6', '未支付');

-- ----------------------------
-- Table structure for kefangfuwu
-- ----------------------------
DROP TABLE IF EXISTS `kefangfuwu`;
CREATE TABLE `kefangfuwu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `fuwuxiangmu` varchar(200) DEFAULT NULL COMMENT '服务项目',
  `fuwufeiyong` varchar(200) DEFAULT NULL COMMENT '服务费用',
  `fengmian` varchar(200) DEFAULT NULL COMMENT '封面',
  `shijianduan` varchar(200) DEFAULT NULL COMMENT '时间段',
  `fuwuxiangqing` longtext COMMENT '服务详情',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='客房服务';

-- ----------------------------
-- Records of kefangfuwu
-- ----------------------------
INSERT INTO `kefangfuwu` VALUES ('31', '2021-03-09 01:33:19', '服务项目1', '服务费用1', 'http://localhost:8080/springboot173pp/upload/kefangfuwu_fengmian1.jpg', '时间段1', '服务详情1');
INSERT INTO `kefangfuwu` VALUES ('32', '2021-03-09 01:33:19', '服务项目2', '服务费用2', 'http://localhost:8080/springboot173pp/upload/kefangfuwu_fengmian2.jpg', '时间段2', '服务详情2');
INSERT INTO `kefangfuwu` VALUES ('33', '2021-03-09 01:33:19', '服务项目3', '服务费用3', 'http://localhost:8080/springboot173pp/upload/kefangfuwu_fengmian3.jpg', '时间段3', '服务详情3');
INSERT INTO `kefangfuwu` VALUES ('34', '2021-03-09 01:33:19', '服务项目4', '服务费用4', 'http://localhost:8080/springboot173pp/upload/kefangfuwu_fengmian4.jpg', '时间段4', '服务详情4');
INSERT INTO `kefangfuwu` VALUES ('35', '2021-03-09 01:33:19', '服务项目5', '服务费用5', 'http://localhost:8080/springboot173pp/upload/kefangfuwu_fengmian5.jpg', '时间段5', '服务详情5');
INSERT INTO `kefangfuwu` VALUES ('36', '2021-03-09 01:33:19', '服务项目6', '服务费用6', 'http://localhost:8080/springboot173pp/upload/kefangfuwu_fengmian6.jpg', '时间段6', '服务详情6');

-- ----------------------------
-- Table structure for kefangleixing
-- ----------------------------
DROP TABLE IF EXISTS `kefangleixing`;
CREATE TABLE `kefangleixing` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kefangleixing` varchar(200) NOT NULL COMMENT '客房类型',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kefangleixing` (`kefangleixing`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='客房类型';

-- ----------------------------
-- Records of kefangleixing
-- ----------------------------
INSERT INTO `kefangleixing` VALUES ('21', '2021-03-09 01:33:19', '总统套房');
INSERT INTO `kefangleixing` VALUES ('22', '2021-03-09 01:33:19', '天字一号');
INSERT INTO `kefangleixing` VALUES ('23', '2021-03-09 01:33:19', '地字一号');
INSERT INTO `kefangleixing` VALUES ('24', '2021-03-09 01:33:19', '大床房');
INSERT INTO `kefangleixing` VALUES ('25', '2021-03-09 01:33:19', '标间');
INSERT INTO `kefangleixing` VALUES ('26', '2021-03-09 01:33:19', '单人间');

-- ----------------------------
-- Table structure for kefangxinxi
-- ----------------------------
DROP TABLE IF EXISTS `kefangxinxi`;
CREATE TABLE `kefangxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kefangmingcheng` varchar(200) NOT NULL COMMENT '客房名称',
  `kefangleixing` varchar(200) NOT NULL COMMENT '客房类型',
  `kefangtupian` varchar(200) NOT NULL COMMENT '客房图片',
  `kefangjiage` int(11) NOT NULL COMMENT '客房价格',
  `kefangsheshi` longtext COMMENT '客房设施',
  `shuliang` varchar(200) DEFAULT NULL COMMENT '数量',
  `jiudianmingcheng` varchar(200) DEFAULT NULL COMMENT '酒店名称',
  `jiudiandizhi` varchar(200) DEFAULT NULL COMMENT '酒店地址',
  `kefangjieshao` longtext COMMENT '客房介绍',
  `clicknum` int(11) DEFAULT '0' COMMENT '点击次数',
  `rooms` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1716144192682 DEFAULT CHARSET=utf8 COMMENT='客房信息';

-- ----------------------------
-- Records of kefangxinxi
-- ----------------------------
INSERT INTO `kefangxinxi` VALUES ('41', '2021-03-09 01:33:19', '总统003', '总统套房', 'http://localhost:8080/springboot173pp/upload/kefangxinxi_kefangtupian1.jpg', '1', '客房设施1', '2', '亚朵', '酒店地址1', '<p>客房介绍1</p>', '103', '');
INSERT INTO `kefangxinxi` VALUES ('42', '2021-03-09 01:33:19', '总统002', '单人间', 'http://localhost:8080/springboot173pp/upload/kefangxinxi_kefangtupian2.jpg', '2', '客房设施2', '3', '亚朵', '酒店地址2', '<p>客房介绍2</p>', '44', '');
INSERT INTO `kefangxinxi` VALUES ('43', '2021-03-09 01:33:19', '地字一号房', '地字一号', 'http://localhost:8080/springboot173pp/upload/kefangxinxi_kefangtupian3.jpg', '3', '客房设施3', '1', '亚朵', '酒店地址3', '<p>客房介绍3</p>', '23', '');
INSERT INTO `kefangxinxi` VALUES ('44', '2021-03-09 01:33:19', '速7总统豪华房', '总统套房', 'http://localhost:8080/springboot173pp/upload/kefangxinxi_kefangtupian4.jpg', '4', '客房设施4', '4', '速7', '酒店地址4', '<p>客房介绍4</p>', '10', '');
INSERT INTO `kefangxinxi` VALUES ('45', '2021-03-09 01:33:19', '天字002', '天字二号', 'http://localhost:8080/springboot173pp/upload/kefangxinxi_kefangtupian5.jpg', '5', '客房设施5', '0', '速7', '酒店地址5', '客房介绍5', '6', null);
INSERT INTO `kefangxinxi` VALUES ('46', '2021-03-09 01:33:19', '天字001', '天字一号', 'http://localhost:8080/springboot173pp/upload/kefangxinxi_kefangtupian6.jpg', '6', '客房设施6', '3', '速7', '酒店地址6', '<p>客房介绍6</p>', '21', '36,37,38');
INSERT INTO `kefangxinxi` VALUES ('1716103829623', '2024-05-19 15:30:29', '如家豪华单人间', '大床房', 'http://localhost:8080/springboot173pp/upload/1716103797186.png', '12', 'wqereqwrqwrqwr', '5', '如家', '北京市', '<p>五千二人翁群若无群wqerweqreqwr</p>', '32', '20,22,31,32,33');
INSERT INTO `kefangxinxi` VALUES ('1716144192681', '2024-05-20 02:43:12', '12', '单人间', 'http://localhost:8080/springboot173pp/upload/1716143910546.jpg', '12', 'wq', '1', '12312', '1213123', '<p>qwqwq</p>', '2', '');

-- ----------------------------
-- Table structure for kefangyuding
-- ----------------------------
DROP TABLE IF EXISTS `kefangyuding`;
CREATE TABLE `kefangyuding` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yudingbianhao` varchar(200) DEFAULT NULL COMMENT '预订编号',
  `kefangmingcheng` varchar(200) DEFAULT NULL COMMENT '客房名称',
  `kefangleixing` varchar(200) DEFAULT NULL COMMENT '客房类型',
  `kefangtupian` varchar(200) DEFAULT NULL COMMENT '客房图片',
  `jiudianmingcheng` varchar(200) DEFAULT NULL COMMENT '酒店名称',
  `jiudiandizhi` varchar(200) DEFAULT NULL COMMENT '酒店地址',
  `kefangjiage` int(11) DEFAULT NULL COMMENT '客房价格',
  `shuliang` int(11) NOT NULL COMMENT '数量',
  `zongjiage` int(11) DEFAULT NULL COMMENT '总价格',
  `ruzhurenshu` int(11) NOT NULL COMMENT '入住人数',
  `xiadanshijian` datetime DEFAULT NULL COMMENT '下单时间',
  `yonghuzhanghao` varchar(200) DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `lianxidianhua` varchar(200) DEFAULT NULL COMMENT '联系电话',
  `beizhu` longtext COMMENT '备注',
  `sfsh` varchar(200) DEFAULT '否' COMMENT '是否审核',
  `shhf` longtext COMMENT '审核回复',
  `ispay` varchar(200) DEFAULT '未支付' COMMENT '是否支付',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yudingbianhao` (`yudingbianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=1716172761938 DEFAULT CHARSET=utf8 COMMENT='客房预订';

-- ----------------------------
-- Records of kefangyuding
-- ----------------------------
INSERT INTO `kefangyuding` VALUES ('51', '2021-03-09 01:33:19', '预订编号1', '客房名称1', '客房类型1', 'http://localhost:8080/springboot173pp/upload/kefangyuding_kefangtupian1.jpg', '酒店名称1', '酒店地址1', '1', '1', '1', '1', '2021-03-09 01:33:19', '用户账号1', '用户姓名1', '联系电话1', '备注1', '是', '', '未支付');
INSERT INTO `kefangyuding` VALUES ('52', '2021-03-09 01:33:19', '预订编号2', '客房名称2', '客房类型2', 'http://localhost:8080/springboot173pp/upload/kefangyuding_kefangtupian2.jpg', '酒店名称2', '酒店地址2', '2', '2', '2', '2', '2021-03-09 01:33:19', '用户账号2', '用户姓名2', '联系电话2', '备注2', '是', '', '未支付');
INSERT INTO `kefangyuding` VALUES ('53', '2021-03-09 01:33:19', '预订编号3', '客房名称3', '客房类型3', 'http://localhost:8080/springboot173pp/upload/kefangyuding_kefangtupian3.jpg', '酒店名称3', '酒店地址3', '3', '3', '3', '3', '2021-03-09 01:33:19', '用户账号3', '用户姓名3', '联系电话3', '备注3', '是', '', '未支付');
INSERT INTO `kefangyuding` VALUES ('54', '2021-03-09 01:33:19', '预订编号4', '客房名称4', '客房类型4', 'http://localhost:8080/springboot173pp/upload/kefangyuding_kefangtupian4.jpg', '酒店名称4', '酒店地址4', '4', '4', '4', '4', '2021-03-09 01:33:19', '用户账号4', '用户姓名4', '联系电话4', '备注4', '是', '', '未支付');
INSERT INTO `kefangyuding` VALUES ('55', '2021-03-09 01:33:19', '预订编号5', '客房名称5', '客房类型5', 'http://localhost:8080/springboot173pp/upload/kefangyuding_kefangtupian5.jpg', '酒店名称5', '酒店地址5', '5', '5', '5', '5', '2021-03-09 01:33:19', '用户账号5', '用户姓名5', '联系电话5', '备注5', '是', '', '未支付');
INSERT INTO `kefangyuding` VALUES ('56', '2021-03-09 01:33:19', '预订编号6', '客房名称6', '客房类型6', 'http://localhost:8080/springboot173pp/upload/kefangyuding_kefangtupian6.jpg', '酒店名称6', '酒店地址6', '6', '6', '6', '6', '2021-03-09 01:33:19', '用户账号6', '用户姓名6', '联系电话6', '备注6', '是', '', '未支付');
INSERT INTO `kefangyuding` VALUES ('1715349629049', '2024-05-10 22:00:28', '20245102201484400469', '客房名称2', '客房类型2', 'http://localhost:8080/springboot173pp/upload/kefangxinxi_kefangtupian2.jpg', '酒店名称2', '酒店地址2', '2', '0', '0', '1', '2024-05-10 00:00:00', '用户1', '用户姓名1', '13823888881', '<p>test111111111</p>', '否', null, '已支付');
INSERT INTO `kefangyuding` VALUES ('1715350146751', '2024-05-10 22:09:06', '20245102284442552385', '客房名称2', '客房类型2', 'http://localhost:8080/springboot173pp/upload/kefangxinxi_kefangtupian2.jpg', '酒店名称2', '酒店地址2', '2', '1', '2', '1', '2024-05-10 00:00:00', '用户1', '用户姓名1', '13823888881', '<p>哈哈哈哈哈哈或或或或或或13823888881</p>', '否', null, '已支付');
INSERT INTO `kefangyuding` VALUES ('1715352241041', '2024-05-10 22:44:00', '202451022434744932536', '客房名称1', '客房类型1', 'http://localhost:8080/springboot173pp/upload/kefangxinxi_kefangtupian1.jpg', '酒店名称1', '酒店地址1', '1', '1', '1', '1', '2024-05-10 22:43:56', '用户2', '用户姓名2', '13823888882', '<p>请输入备注11111</p>', '是', null, '已支付');
INSERT INTO `kefangyuding` VALUES ('1716144707024', '2024-05-20 02:51:46', '2024520251325878574', '如家豪华单人间', '大床房', 'http://localhost:8080/springboot173pp/upload/1716103797186.png', '如家', '北京市', '12', '2', '24', '2', '2024-05-20 00:00:00', '22082119800801002x', 'admin111', '13532323223', '<p>123123123123</p>', '是', null, '已入住');
INSERT INTO `kefangyuding` VALUES ('1716144875125', '2024-05-20 02:54:34', '20245202542476417715', '如家豪华单人间', '大床房', 'http://localhost:8080/springboot173pp/upload/1716103797186.png', '如家', '北京市', '12', '1', '12', '1', '2024-05-20 00:00:00', '440102198001021230', 'jocker', '12312312312', '<p>请输入备注1111111111111111111</p>', '是', null, '已支付');
INSERT INTO `kefangyuding` VALUES ('1716172761937', '2024-05-20 10:39:22', '20245201039674589269', '天字001', '天字一号', 'http://localhost:8080/springboot173pp/upload/kefangxinxi_kefangtupian6.jpg', '速7', '酒店地址6', '6', '1', '6', '1', '2024-05-20 10:39:16', '440102198001021230', 'jocker', '12312312312', '<p>请输入备注1111111111</p>', '是', null, '已入住');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `introduction` longtext COMMENT '简介',
  `picture` varchar(200) NOT NULL COMMENT '图片',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COMMENT='酒店公告';

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('101', '2021-03-09 01:33:19', '标题1', '简介1', 'http://localhost:8080/springboot173pp/upload/news_picture1.jpg', '内容1');
INSERT INTO `news` VALUES ('102', '2021-03-09 01:33:19', '标题2', '简介2', 'http://localhost:8080/springboot173pp/upload/news_picture2.jpg', '内容2');
INSERT INTO `news` VALUES ('103', '2021-03-09 01:33:19', '标题3', '简介3', 'http://localhost:8080/springboot173pp/upload/news_picture3.jpg', '内容3');
INSERT INTO `news` VALUES ('104', '2021-03-09 01:33:19', '标题4', '简介4', 'http://localhost:8080/springboot173pp/upload/news_picture4.jpg', '内容4');
INSERT INTO `news` VALUES ('105', '2021-03-09 01:33:19', '标题5', '简介5', 'http://localhost:8080/springboot173pp/upload/news_picture5.jpg', '内容5');
INSERT INTO `news` VALUES ('106', '2021-03-09 01:33:19', '标题6', '简介6', 'http://localhost:8080/springboot173pp/upload/news_picture6.jpg', '内容6');

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) DEFAULT NULL,
  `xinxiid` bigint(20) DEFAULT NULL,
  `roomnum` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('20', 'http://localhost:8080/springboot173pp/upload/1716144636184.jpg', '41', '101', '2024-05-19 23:58:36');
INSERT INTO `room` VALUES ('21', 'http://localhost:8080/springboot173pp/upload/1716143794884.jpg', '41', '121', '2024-05-20 00:09:00');
INSERT INTO `room` VALUES ('22', 'http://localhost:8080/springboot173pp/upload/1716144640177.jpg', '41', '102', '2024-05-20 00:19:03');
INSERT INTO `room` VALUES ('23', 'http://localhost:8080/springboot173pp/upload/1716143849980.jpg', '41', '111', '2024-05-20 00:24:23');
INSERT INTO `room` VALUES ('24', 'http://localhost:8080/springboot173pp/upload/1716143929009.jpg', '1716144192681', '111', '2024-05-20 01:23:12');
INSERT INTO `room` VALUES ('25', null, '41', '112', '2024-05-20 02:09:34');
INSERT INTO `room` VALUES ('26', null, '41', '113', '2024-05-20 02:31:56');
INSERT INTO `room` VALUES ('27', null, '41', '11', '2024-05-20 02:32:01');
INSERT INTO `room` VALUES ('28', null, '41', '117', '2024-05-20 02:32:11');
INSERT INTO `room` VALUES ('29', null, '1716103829623', '101', '2024-05-20 02:50:10');
INSERT INTO `room` VALUES ('30', null, '1716103829623', '102', '2024-05-20 02:50:15');
INSERT INTO `room` VALUES ('31', 'http://localhost:8080/springboot173pp/upload/1716144644770.jpg', '1716103829623', '103', '2024-05-20 02:50:17');
INSERT INTO `room` VALUES ('32', 'http://localhost:8080/springboot173pp/upload/1716144648547.jpg', '1716103829623', '104', '2024-05-20 02:50:20');
INSERT INTO `room` VALUES ('33', 'http://localhost:8080/springboot173pp/upload/1716144652187.jpg', '1716103829623', '105', '2024-05-20 02:50:22');
INSERT INTO `room` VALUES ('34', null, '41', '104', '2024-05-20 10:36:14');
INSERT INTO `room` VALUES ('35', null, '41', '114', '2024-05-20 10:36:18');
INSERT INTO `room` VALUES ('36', 'http://localhost:8080/springboot173pp/upload/1716172684266.jpg', '46', '201', '2024-05-20 10:37:48');
INSERT INTO `room` VALUES ('37', 'http://localhost:8080/springboot173pp/upload/1716172688788.jpg', '46', '202', '2024-05-20 10:37:52');
INSERT INTO `room` VALUES ('38', 'http://localhost:8080/springboot173pp/upload/1716172693232.jpg', '46', '203', '2024-05-20 10:37:56');

-- ----------------------------
-- Table structure for ruzhudengji
-- ----------------------------
DROP TABLE IF EXISTS `ruzhudengji`;
CREATE TABLE `ruzhudengji` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yudingbianhao` varchar(200) DEFAULT NULL COMMENT '预订编号',
  `kefangmingcheng` varchar(200) DEFAULT NULL COMMENT '客房名称',
  `kefangleixing` varchar(200) DEFAULT NULL COMMENT '客房类型',
  `fangjianhao` varchar(200) DEFAULT NULL COMMENT '房间号',
  `yonghuzhanghao` varchar(200) DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `lianxidianhua` varchar(200) DEFAULT NULL COMMENT '联系电话',
  `dengjishijian` datetime DEFAULT NULL COMMENT '登记时间',
  `yajin` varchar(200) DEFAULT NULL COMMENT '押金',
  `beizhu` longtext COMMENT '备注',
  `room` varchar(255) DEFAULT NULL,
  `ispay` varchar(200) DEFAULT '未支付' COMMENT '是否支付',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1716172841436 DEFAULT CHARSET=utf8 COMMENT='入住登记';

-- ----------------------------
-- Records of ruzhudengji
-- ----------------------------
INSERT INTO `ruzhudengji` VALUES ('61', '2021-03-09 01:33:19', '预订编号1', '客房名称1', '客房类型1', '房间号1', '用户账号1', '用户姓名1', '联系电话1', '2021-03-09 01:33:19', '12', '备注1', null, '已退房');
INSERT INTO `ruzhudengji` VALUES ('62', '2021-03-09 01:33:19', '预订编号2', '客房名称2', '客房类型2', '房间号2', '用户账号2', '用户姓名2', '联系电话2', '2021-03-09 01:33:19', '23', '备注2', null, '已退房');
INSERT INTO `ruzhudengji` VALUES ('63', '2021-03-09 01:33:19', '预订编号3', '客房名称3', '客房类型3', '房间号3', '用户账号3', '用户姓名3', '联系电话3', '2021-03-09 01:33:19', '23', '备注3', null, '已退房');
INSERT INTO `ruzhudengji` VALUES ('64', '2021-03-09 01:33:19', '预订编号4', '客房名称4', '客房类型4', '房间号4', '用户账号4', '用户姓名4', '联系电话4', '2021-03-09 01:33:19', '11', '备注4', null, '已退房');
INSERT INTO `ruzhudengji` VALUES ('65', '2021-03-09 01:33:19', '预订编号5', '客房名称5', '客房类型5', '房间号5', '用户账号5', '用户姓名5', '联系电话5', '2021-03-09 01:33:19', '11', '备注5', null, '已退房');
INSERT INTO `ruzhudengji` VALUES ('66', '2021-03-09 01:33:19', '预订编号6', '客房名称6', '客房类型6', '房间号6', '用户账号6', '用户姓名6', '联系电话6', '2021-03-09 01:33:19', '15', '备注6', null, '已退房');
INSERT INTO `ruzhudengji` VALUES ('1716144818357', '2024-05-20 02:53:38', '2024520251325878574', '如家豪华单人间', '大床房', '101,102', '22082119800801002x', 'admin111', '13532323223', '2024-05-20 02:53:38', '100', null, '101,102', '已支付');
INSERT INTO `ruzhudengji` VALUES ('1716172841435', '2024-05-20 10:40:41', '20245201039674589269', '天字001', '天字一号', '201', '440102198001021230', 'jocker', '12312312312', '2024-05-20 10:40:41', '100', null, '201', '已支付');

-- ----------------------------
-- Table structure for storeup
-- ----------------------------
DROP TABLE IF EXISTS `storeup`;
CREATE TABLE `storeup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `refid` bigint(20) DEFAULT NULL COMMENT '收藏id',
  `tablename` varchar(200) DEFAULT NULL COMMENT '表名',
  `name` varchar(200) NOT NULL COMMENT '收藏名称',
  `picture` varchar(200) NOT NULL COMMENT '收藏图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏表';

-- ----------------------------
-- Records of storeup
-- ----------------------------

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='token表';

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES ('1', '1', 'abo', 'users', '管理员', '9usto9b9nsz2tr28gewffnrqpsbtubrh', '2021-03-09 01:35:16', '2024-05-20 11:34:53');
INSERT INTO `token` VALUES ('2', '11', '用户1', 'yonghu', '用户', 'iot50eszato4lr5fgzuh0ki94wurc60c', '2024-05-10 21:59:17', '2024-05-11 10:23:10');
INSERT INTO `token` VALUES ('3', '12', '用户2', 'yonghu', '用户', 'qhfny87mqp589bcr2mquqi9m64f246bd', '2024-05-10 22:43:00', '2024-05-11 09:51:10');
INSERT INTO `token` VALUES ('4', '13', '用户3', 'yonghu', '用户', '9hb1one1kri9mdtopq81o0so81nbjylb', '2024-05-10 23:02:25', '2024-05-11 00:11:47');
INSERT INTO `token` VALUES ('5', '15', '用户5', 'yonghu', '用户', 'z206wvjc9s4l1pkpl1qxgdmtbqfcrudj', '2024-05-10 23:12:26', '2024-05-11 00:14:31');
INSERT INTO `token` VALUES ('6', '14', '用户4', 'yonghu', '用户', '2pyip87384xa5gbv8t6lampcmxw6308u', '2024-05-11 08:52:05', '2024-05-11 10:00:13');
INSERT INTO `token` VALUES ('7', '1715390764641', '440102198001021230', 'yonghu', '用户', 'bqrhdlpriirziz7phcz0t1qnio3td9wp', '2024-05-11 09:26:18', '2024-05-20 11:38:48');
INSERT INTO `token` VALUES ('8', '1715391481873', '22082119800801002x', 'yonghu', '用户', 'uazwz3qiqg8ua200t4pufj38g230p160', '2024-05-19 20:05:54', '2024-05-20 03:52:59');

-- ----------------------------
-- Table structure for tuifangdengji
-- ----------------------------
DROP TABLE IF EXISTS `tuifangdengji`;
CREATE TABLE `tuifangdengji` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yudingbianhao` varchar(200) DEFAULT NULL COMMENT '预订编号',
  `kefangmingcheng` varchar(200) DEFAULT NULL COMMENT '客房名称',
  `kefangleixing` varchar(200) DEFAULT NULL COMMENT '客房类型',
  `fangjianhao` varchar(200) DEFAULT NULL COMMENT '房间号',
  `yonghuzhanghao` varchar(200) DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `lianxidianhua` varchar(200) DEFAULT NULL COMMENT '联系电话',
  `tuifangshijian` datetime DEFAULT NULL COMMENT '退房时间',
  `beizhu` longtext COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='退房登记';

-- ----------------------------
-- Records of tuifangdengji
-- ----------------------------
INSERT INTO `tuifangdengji` VALUES ('81', '2021-03-09 01:33:19', '预订编号1', '客房名称1', '客房类型1', '房间号1', '用户账号1', '用户姓名1', '联系电话1', '2021-03-09 01:33:19', '备注1');
INSERT INTO `tuifangdengji` VALUES ('82', '2021-03-09 01:33:19', '预订编号2', '客房名称2', '客房类型2', '房间号2', '用户账号2', '用户姓名2', '联系电话2', '2021-03-09 01:33:19', '备注2');
INSERT INTO `tuifangdengji` VALUES ('83', '2021-03-09 01:33:19', '预订编号3', '客房名称3', '客房类型3', '房间号3', '用户账号3', '用户姓名3', '联系电话3', '2021-03-09 01:33:19', '备注3');
INSERT INTO `tuifangdengji` VALUES ('84', '2021-03-09 01:33:19', '预订编号4', '客房名称4', '客房类型4', '房间号4', '用户账号4', '用户姓名4', '联系电话4', '2021-03-09 01:33:19', '备注4');
INSERT INTO `tuifangdengji` VALUES ('85', '2021-03-09 01:33:19', '预订编号5', '客房名称5', '客房类型5', '房间号5', '用户账号5', '用户姓名5', '联系电话5', '2021-03-09 01:33:19', '备注5');
INSERT INTO `tuifangdengji` VALUES ('86', '2021-03-09 01:33:19', '预订编号6', '客房名称6', '客房类型6', '房间号6', '用户账号6', '用户姓名6', '联系电话6', '2021-03-09 01:33:19', '备注6');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'abo', 'abo', '管理员', '2021-03-09 01:33:19');

-- ----------------------------
-- Table structure for yonghu
-- ----------------------------
DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE `yonghu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) NOT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) NOT NULL COMMENT '用户姓名',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `nianling` int(11) DEFAULT NULL COMMENT '年龄',
  `lianxidianhua` varchar(200) DEFAULT NULL COMMENT '联系电话',
  `dianziyouxiang` varchar(200) DEFAULT NULL COMMENT '电子邮箱',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yonghuzhanghao` (`yonghuzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1715391481874 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of yonghu
-- ----------------------------
INSERT INTO `yonghu` VALUES ('11', '2021-03-09 01:33:19', '用户1', '用户姓名1', '123456', '男', '1', '13823888881', '773890001@qq.com');
INSERT INTO `yonghu` VALUES ('12', '2021-03-09 01:33:19', '用户2', '用户姓名2', '123456', '男', '2', '13823888882', '773890002@qq.com');
INSERT INTO `yonghu` VALUES ('13', '2021-03-09 01:33:19', '用户3', '用户姓名3', '123456', '男', '3', '13823888883', '773890003@qq.com');
INSERT INTO `yonghu` VALUES ('14', '2021-03-09 01:33:19', '用户4', '用户姓名4', '123456', '男', '4', '13823888884', '773890004@qq.com');
INSERT INTO `yonghu` VALUES ('15', '2021-03-09 01:33:19', '用户5', '用户姓名5', '123456', '男', '5', '13823888885', '773890005@qq.com');
INSERT INTO `yonghu` VALUES ('16', '2021-03-09 01:33:19', '用户6', '用户姓名6', '123456', '男', '6', '13823888886', '773890006@qq.com');
INSERT INTO `yonghu` VALUES ('1715390764641', '2024-05-11 09:26:04', '440102198001021230', 'jocker', '123', '男', '12', '12312312312', '68737821@qq.com');
INSERT INTO `yonghu` VALUES ('1715391481873', '2024-05-11 09:38:01', '22082119800801002x', 'admin111', '123', null, '11', '13532323223', '323@qq.com');
