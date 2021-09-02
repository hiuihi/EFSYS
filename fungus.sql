/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 80019
Source Host           : localhost:3306
Source Database       : fungus

Target Server Type    : MYSQL
Target Server Version : 80019
File Encoding         : 65001

Date: 2021-09-02 23:33:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(64) DEFAULT NULL COMMENT '用户名',
  `admin_password` varchar(64) DEFAULT NULL COMMENT '密码',
  `icon` varchar(500) DEFAULT NULL COMMENT '头像',
  `nick_name` varchar(200) DEFAULT NULL COMMENT '昵称',
  `note` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `admin_status` int DEFAULT '1' COMMENT '帐号启用状态：0->禁用；1->启用',
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='后台用户表';

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin', null, null, null, null, null, '1', '浙江省丽水市庆元县食用菌生产基地');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT '0' COMMENT '用户id',
  `goods_id` int DEFAULT '0' COMMENT '商品id',
  `goods_name` char(60) DEFAULT NULL COMMENT '商品名',
  `images` char(255) DEFAULT NULL COMMENT '封面图片',
  `price` decimal(10,2) unsigned DEFAULT NULL COMMENT '销售价格',
  `promotion_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '促销价格',
  `stock` int DEFAULT '0' COMMENT '购买数量',
  `total_price` decimal(10,2) DEFAULT '0.00' COMMENT '总价',
  `spec` char(255) DEFAULT NULL COMMENT '规格',
  `is_enable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示（0否，1是）',
  `upd_time` date DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `goods_id` (`goods_id`),
  KEY `goods_name` (`goods_name`),
  KEY `stock` (`stock`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='购物车';

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('30', '13533422222', '102', '椴木香菇', '/other/img/product/product-2/product.png', '49.00', '0.00', '1', '49.00', '250克', '0', null);
INSERT INTO `cart` VALUES ('31', '13533422222', '104', '花菇', '/other/img/product/product-4/product.png', '45.00', '0.00', '1', '45.00', '500克', '0', null);
INSERT INTO `cart` VALUES ('32', '13533422222', '103', '香信菇', '/other/img/product/product-3/product.png', '39.00', '0.00', '1', '39.00', '250克', '0', null);
INSERT INTO `cart` VALUES ('33', '13533422222', '102', '椴木香菇', '/other/img/product/product-2/product.png', '49.00', '0.00', '1', '49.00', '250克', '0', null);
INSERT INTO `cart` VALUES ('34', '13533422222', '301', '椴木银耳', '/other/img/product/product-8/product.png', '42.00', '0.00', '1', '42.00', '500克', '0', null);
INSERT INTO `cart` VALUES ('35', '13533422222', '302', '银耳', '/other/img/product/product-9/product.png', '35.00', '0.00', '1', '35.00', '250克', '0', null);
INSERT INTO `cart` VALUES ('36', '13533422222', '501', '虫草花', '/other/img/product/product-11/product.png', '75.00', '0.00', '1', '75.00', '500克', '0', null);
INSERT INTO `cart` VALUES ('37', null, '201', '灰树花', '/other/img/product/product-7/product.png', '67.00', '0.00', '1', '67.00', '500克', '1', null);
INSERT INTO `cart` VALUES ('38', null, '201', '灰树花', '/other/img/product/product-7/product.png', '67.00', '0.00', '1', '67.00', '500克', '1', null);
INSERT INTO `cart` VALUES ('39', null, '201', '灰树花', '/other/img/product/product-7/product.png', '67.00', '0.00', '1', '67.00', '500克', '1', null);
INSERT INTO `cart` VALUES ('40', null, '201', '灰树花', '/other/img/product/product-7/product.png', '67.00', '0.00', '1', '67.00', '500克', '1', null);
INSERT INTO `cart` VALUES ('41', null, '201', '灰树花', '/other/img/product/product-7/product.png', '67.00', '0.00', '1', '67.00', '500克', '1', null);
INSERT INTO `cart` VALUES ('42', null, '201', '灰树花', '/other/img/product/product-7/product.png', '67.00', '0.00', '1', '67.00', '500克', '1', null);
INSERT INTO `cart` VALUES ('43', null, '201', '灰树花', '/other/img/product/product-7/product.png', '67.00', '0.00', '1', '67.00', '500克', '1', null);
INSERT INTO `cart` VALUES ('44', '13533422222', '105', '厚冬菇', '/other/img/product/product-5/product.png', '36.00', '0.00', '2', '72.00', '500克', '0', null);
INSERT INTO `cart` VALUES ('45', '13533422222', '102', '椴木香菇', '/other/img/product/product-2/product.png', '49.00', '0.00', '1', '49.00', '250克', '0', null);
INSERT INTO `cart` VALUES ('46', '13533422222', '104', '花菇', '/other/img/product/product-4/product.png', '45.00', '0.00', '1', '45.00', '500克', '0', null);
INSERT INTO `cart` VALUES ('47', '13533422222', '101', '241香菇', '/other/img/product/product-1/product.png', '59.00', '0.00', '1', '59.00', '250克', '0', null);
INSERT INTO `cart` VALUES ('48', '13533422222', '102', '椴木香菇', '/other/img/product/product-2/product.png', '49.00', '0.00', '1', '49.00', '250克', '0', null);
INSERT INTO `cart` VALUES ('49', '13533422222', '104', '花菇', '/other/img/product/product-4/product.png', '45.00', '0.00', '1', '45.00', '500克', '0', null);
INSERT INTO `cart` VALUES ('50', '13533422222', '105', '厚冬菇', '/other/img/product/product-5/product.png', '36.00', '0.00', '1', '36.00', '500克', '0', null);
INSERT INTO `cart` VALUES ('51', '13533422222', '106', '高山冬菇', '/other/img/product/product-6/product.png', '55.00', '0.00', '1', '55.00', '250克', '0', null);
INSERT INTO `cart` VALUES ('52', '13533422222', '201', '灰树花', '/other/img/product/product-7/product.png', '67.00', '0.00', '1', '67.00', '500克', '0', null);
INSERT INTO `cart` VALUES ('53', '13533422222', '301', '椴木银耳', '/other/img/product/product-8/product.png', '42.00', '0.00', '1', '42.00', '500克', '0', null);
INSERT INTO `cart` VALUES ('54', '13533422222', '302', '银耳', '/other/img/product/product-9/product.png', '35.00', '0.00', '1', '35.00', '250克', '0', null);
INSERT INTO `cart` VALUES ('55', '13533422222', '401', '羊肚菌', '/other/img/product/product-10/product.png', '59.00', '0.00', '1', '59.00', '500克', '0', null);
INSERT INTO `cart` VALUES ('56', '13533422222', '501', '虫草花', '/other/img/product/product-11/product.png', '75.00', '0.00', '1', '75.00', '500克', '0', null);
INSERT INTO `cart` VALUES ('57', '13533422222', '601', '木耳', '/other/img/product/product-12/product.png', '35.00', '0.00', '1', '35.00', '250克', '0', null);
INSERT INTO `cart` VALUES ('58', '13533422222', '701', '茶树菇', '/other/img/product/product-13/product.png', '52.00', '35.00', '1', '35.00', '500克', '0', null);
INSERT INTO `cart` VALUES ('59', '13533422222', '801', '竹荪', '/other/img/product/product-14/product.png', '65.00', '0.00', '1', '65.00', '500克', '0', null);
INSERT INTO `cart` VALUES ('60', '13533422222', '901', '姬松茸', '/other/img/product/product-15/product.png', '85.00', '0.00', '1', '85.00', '250克', '0', null);
INSERT INTO `cart` VALUES ('61', '13533422222', '1101', '杏鲍菇', '/other/img/product/product-17/product.png', '41.00', '0.00', '1', '41.00', '500克', '0', null);
INSERT INTO `cart` VALUES ('62', '13533422222', '102', '椴木香菇', '/other/img/product/product-2/product.png', '49.00', '0.00', '2', '98.00', '250克', '1', null);
INSERT INTO `cart` VALUES ('63', '13533422222', '104', '花菇', '/other/img/product/product-4/product.png', '45.00', '0.00', '1', '45.00', '500克', '0', null);
INSERT INTO `cart` VALUES ('64', '13533422222', '105', '厚冬菇', '/other/img/product/product-5/product.png', '36.00', '0.00', '1', '36.00', '500克', '0', null);
INSERT INTO `cart` VALUES ('65', '13533422222', '101', '241香菇', '/other/img/product/product-1/product.png', '59.00', '0.00', '1', '59.00', '250克', '0', null);
INSERT INTO `cart` VALUES ('66', '13533422222', '106', '高山冬菇', '/other/img/product/product-6/product.png', '55.00', '0.00', '1', '55.00', '250克', '0', null);
INSERT INTO `cart` VALUES ('67', '13533422222', '201', '灰树花', '/other/img/product/product-7/product.png', '67.00', '0.00', '1', '67.00', '500克', '0', null);
INSERT INTO `cart` VALUES ('68', '13533422222', '301', '椴木银耳', '/other/img/product/product-8/product.png', '42.00', '0.00', '4', '168.00', '500克', '0', null);

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT '0' COMMENT '用户id',
  `goods_id` bigint DEFAULT '0' COMMENT '商品id',
  `goods_name` char(60) DEFAULT NULL COMMENT '商品名',
  `images` char(255) DEFAULT NULL COMMENT '封面图片',
  `price` decimal(10,2) unsigned DEFAULT NULL COMMENT '销售价格',
  `promotion_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '促销价格',
  `is_enable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示（0否，1是）',
  `upd_time` date DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `goods_id` (`goods_id`),
  KEY `goods_name` (`goods_name`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='收藏';

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES ('24', '13533422222', '302', '银耳', '/other/img/product/product-9/product.png', '35.00', '0.00', '1', null);
INSERT INTO `collect` VALUES ('25', null, '201', '灰树花', '/other/img/product/product-7/product.png', '67.00', '0.00', '1', null);
INSERT INTO `collect` VALUES ('26', null, '201', '灰树花', '/other/img/product/product-7/product.png', '67.00', '0.00', '1', null);
INSERT INTO `collect` VALUES ('27', null, '201', '灰树花', '/other/img/product/product-7/product.png', '67.00', '0.00', '1', null);
INSERT INTO `collect` VALUES ('28', null, '201', '灰树花', '/other/img/product/product-7/product.png', '67.00', '0.00', '1', null);
INSERT INTO `collect` VALUES ('29', null, '201', '灰树花', '/other/img/product/product-7/product.png', '67.00', '0.00', '1', null);
INSERT INTO `collect` VALUES ('30', null, '201', '灰树花', '/other/img/product/product-7/product.png', '67.00', '0.00', '1', null);
INSERT INTO `collect` VALUES ('31', null, '201', '灰树花', '/other/img/product/product-7/product.png', '67.00', '0.00', '1', null);
INSERT INTO `collect` VALUES ('32', null, '201', '灰树花', '/other/img/product/product-7/product.png', '67.00', '0.00', '1', null);
INSERT INTO `collect` VALUES ('33', null, '201', '灰树花', '/other/img/product/product-7/product.png', '67.00', '0.00', '1', null);
INSERT INTO `collect` VALUES ('34', null, '201', '灰树花', '/other/img/product/product-7/product.png', '67.00', '0.00', '1', null);
INSERT INTO `collect` VALUES ('35', null, '201', '灰树花', '/other/img/product/product-7/product.png', '67.00', '0.00', '1', null);
INSERT INTO `collect` VALUES ('36', null, '201', '灰树花', '/other/img/product/product-7/product.png', '67.00', '0.00', '1', null);
INSERT INTO `collect` VALUES ('37', null, '201', '灰树花', '/other/img/product/product-7/product.png', '67.00', '0.00', '1', null);
INSERT INTO `collect` VALUES ('38', null, '201', '灰树花', '/other/img/product/product-7/product.png', '67.00', '0.00', '1', null);
INSERT INTO `collect` VALUES ('39', null, '201', '灰树花', '/other/img/product/product-7/product.png', '67.00', '0.00', '1', null);
INSERT INTO `collect` VALUES ('40', null, '201', '灰树花', '/other/img/product/product-7/product.png', '67.00', '0.00', '1', null);
INSERT INTO `collect` VALUES ('41', null, '201', '灰树花', '/other/img/product/product-7/product.png', '67.00', '0.00', '1', null);
INSERT INTO `collect` VALUES ('42', '13533422222', '102', '椴木香菇', '/other/img/product/product-2/product.png', '49.00', '0.00', '1', null);
INSERT INTO `collect` VALUES ('43', null, '105', '厚冬菇', '/other/img/product/product-5/product.png', '36.00', '0.00', '1', null);
INSERT INTO `collect` VALUES ('44', null, '105', '厚冬菇', '/other/img/product/product-5/product.png', '36.00', '0.00', '1', null);
INSERT INTO `collect` VALUES ('45', null, '105', '厚冬菇', '/other/img/product/product-5/product.png', '36.00', '0.00', '1', null);
INSERT INTO `collect` VALUES ('46', null, '105', '厚冬菇', '/other/img/product/product-5/product.png', '36.00', '0.00', '1', null);
INSERT INTO `collect` VALUES ('47', null, '105', '厚冬菇', '/other/img/product/product-5/product.png', '36.00', '0.00', '1', null);
INSERT INTO `collect` VALUES ('48', null, '105', '厚冬菇', '/other/img/product/product-5/product.png', '36.00', '0.00', '1', null);
INSERT INTO `collect` VALUES ('49', null, '105', '厚冬菇', '/other/img/product/product-5/product.png', '36.00', '0.00', '1', null);
INSERT INTO `collect` VALUES ('50', null, '105', '厚冬菇', '/other/img/product/product-5/product.png', '36.00', '0.00', '1', null);
INSERT INTO `collect` VALUES ('51', null, '105', '厚冬菇', '/other/img/product/product-5/product.png', '36.00', '0.00', '1', null);
INSERT INTO `collect` VALUES ('52', null, '105', '厚冬菇', '/other/img/product/product-5/product.png', '36.00', '0.00', '1', null);
INSERT INTO `collect` VALUES ('53', null, '105', '厚冬菇', '/other/img/product/product-5/product.png', '36.00', '0.00', '1', null);
INSERT INTO `collect` VALUES ('54', null, '105', '厚冬菇', '/other/img/product/product-5/product.png', '36.00', '0.00', '1', null);
INSERT INTO `collect` VALUES ('55', null, '105', '厚冬菇', '/other/img/product/product-5/product.png', '36.00', '0.00', '1', null);
INSERT INTO `collect` VALUES ('56', '13533422222', '105', '厚冬菇', '/other/img/product/product-5/product.png', '36.00', '0.00', '1', null);
INSERT INTO `collect` VALUES ('57', '13533422222', '501', '虫草花', '/other/img/product/product-11/product.png', '75.00', '0.00', '1', null);
INSERT INTO `collect` VALUES ('58', '13533422222', '301', '椴木银耳', '/other/img/product/product-8/product.png', '42.00', '0.00', '1', null);

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` bigint DEFAULT NULL COMMENT '商品id',
  `goods_name` varchar(64) DEFAULT NULL COMMENT '商品名',
  `icon` varchar(255) DEFAULT NULL COMMENT '封面图',
  `pic` varchar(255) DEFAULT NULL COMMENT '主图，以逗号分隔，第一个为路径，后续为文件名',
  `sub_pic` varchar(255) DEFAULT NULL COMMENT '副图，以逗号分隔',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `grade` int DEFAULT '0' COMMENT '评分1-5，默认为0',
  `simple_desc` char(255) DEFAULT NULL COMMENT '简述',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `stock` int DEFAULT NULL COMMENT '库存',
  `low_stock` int DEFAULT NULL COMMENT '库存预警值',
  `spec` char(255) DEFAULT NULL COMMENT '规格，以逗号分隔',
  `sale` int DEFAULT NULL COMMENT '销量',
  `unit` varchar(16) DEFAULT '克' COMMENT '单位，默认为克',
  `weight` decimal(10,2) DEFAULT NULL COMMENT '商品重量',
  `description` text COMMENT '商品描述',
  `album_pics` varchar(255) DEFAULT NULL COMMENT '画册图片，连产品图片限制为5张，以逗号分割',
  `promotion_price` decimal(10,2) DEFAULT '0.00' COMMENT '促销价格',
  `promotion_start_time` datetime DEFAULT NULL COMMENT '促销开始时间',
  `promotion_end_time` datetime DEFAULT NULL COMMENT '促销结束时间',
  `promotion_per_limit` int DEFAULT NULL COMMENT '活动限购数量',
  `delete_status` int DEFAULT '0' COMMENT '删除状态：0->未删除；1->已删除',
  `publish_status` int DEFAULT '1' COMMENT '上架状态：0->下架；1->上架',
  `new_status` int DEFAULT '0' COMMENT '新品状态:0->不是新品；1->新品',
  `recommand_status` int DEFAULT NULL COMMENT '推荐状态；0->不推荐；1->推荐',
  `discount_status` int DEFAULT '0' COMMENT '折扣状态；0->无折扣；1->折扣',
  `category_id` int DEFAULT NULL COMMENT '商品分类id',
  `upd_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='商品信息';

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '1', '香菇', '/other/img/product/product-1/product-1.png', '/other/img/product/product-1/,product-1.png,product-2.png,product-3.png,product-4.png,product-5.png,product-6.png', '/other/img/product/product-1/,product-details-1.png,product-details-2.png,product-details-3.png,product-details-4.png', '香菇肉质肥厚细嫩，味道鲜美，香气独特，营养丰富，是一种食药同源的食物，具有很高的营养、药用和保健价值。', '0', '', '56.00', '364', '100', '500克,1000克', '2', '克', null, '', null, '45.00', '1970-01-01 08:00:00', '2021-05-15 08:00:00', null, '1', '1', '0', '0', '1', '1001', '2021-05-04 16:26:13');
INSERT INTO `goods` VALUES ('2', '2', '木耳', '/other/img/product/product-2/product-1.png', '/other/img/product/product-2/,product-1.png,product-2.png,product-3.png,product-4.png', '/other/img/product/product-2/,product-details-1.png,product-details-2.png,product-details-3.png,product-details-4.png', '木耳质地柔软，口感细嫩，味道鲜美，风味特殊，而且富含蛋白质、脂肪、糖类及多种维生素和矿物质，有很高的营养价值，现代营养学家盛赞其为“素中之荤”。', '4', null, '82.00', '562', '100', '500克,1500克,2000克', '3', '克', null, null, null, '0.00', '2021-05-03 19:43:25', '2021-05-14 19:43:29', null, '1', '1', '1', '0', '1', '1002', '2021-05-04 16:26:14');
INSERT INTO `goods` VALUES ('3', '3', '银耳', '/other/img/product/product-3/product-1.png', '/other/img/product/product-3/,product-1.png,product-2.png,product-3.png,product-4.png,product-5.png', '/other/img/product/product-3/,product-details-1.png,product-details-2.png,product-details-3.png,product-details-4.png,product-details-5.png,product-details-6.png', '银耳作为我国传统的食用菌，历来都是深受广大人民所喜爱的食物，其中所含有的活性成分-银耳多糖具有特殊的保健功能。', '4', null, '75.00', '53', '100', '500克,1000克,1500克,2000克', '1', '克', null, null, null, '59.00', null, null, null, '1', '1', '1', null, '1', '1003', '2021-05-04 16:26:14');
INSERT INTO `goods` VALUES ('4', '1044', '灵芝', '/other/img/product/product-4/product-1.png', '/other/img/product/product-4/,product-1.png,product-2.png,product-3.png,product-4.png,product-5.png,product-6.png,product-7.png', '/other/img/product/product-4/,product-details-1.png,product-details-2.png,product-details-3.png,product-details-4.png,product-details-5.png,product-details-6.png,product-details-7.png', '灵芝别名赤芝、红芝、灵芝草、菌灵芝、木灵，属于一种真菌种类，是我国传统的真菌药物 , 被喻为“仙草”。 灵芝被认为是补品中的王者，它在补气养血、补肝理气、调经活血等方面有着良好的功效。', '5', null, '45.00', '84', '100', '1000克,1500克,2000克', '2', '克', null, null, null, '0.00', null, null, null, '1', '1', '1', null, '1', '1004', '2021-05-04 16:26:15');
INSERT INTO `goods` VALUES ('5', '1055', '平菇', '/other/img/product/product-5/product-1.png', '/other/img/product/product-5/,product-1.png,product-2.png,product-3.png,product-4.png,product-5.png', '/other/img/product/product-5/,product-details-1.png,product-details-2.png,product-details-3.png,product-details-4.png,product-details-5.png', '平菇含丰富的营养物质，每百克于品含蛋白质20—23 克，而且氨基酸成分种类齐全，矿物质含量十分丰富。', '4', null, '86.00', '454', '100', '500克,1000克,1500克', '2', '克', null, null, null, '66.00', null, null, null, '1', '1', '0', null, '1', '1005', '2021-05-04 16:26:16');
INSERT INTO `goods` VALUES ('6', '1066', '猴头菇', '/other/img/product/product-6/product-1.png', '/other/img/product/product-6/,product-1.png,product-2.png,product-3.png,product-4.png,product-5.png,product-6.png,product-7.png,product-8.png', '/other/img/product/product-6/,product-details-1.png,product-details-2.png,product-details-3.png,product-details-4.png,product-details-5.png,product-details-6.png,product-details-7.png,product-details-8.png', '作为食用菌王国的珍品 , 猴头菇属于药食两用真菌 , 尤其是其医药方面的药用价值，受到广大消费者的青睐，具有健脾养胃、安神、抗癌的功效 , 对体虚乏力、消化不良、失眠、胃与十二指肠溃疡、慢性胃炎、消化道肿瘤等症有特效。', '0', null, '95.00', '545', '100', '500克,1000克,2000克', '1', '克', null, null, null, '86.00', null, null, null, '1', '1', '0', null, '1', '1006', '2021-05-04 16:26:16');
INSERT INTO `goods` VALUES ('7', '1077', '灰树花', '/other/img/product/product-7/product-1.png', '/other/img/product/product-7/,product-1.png,product-2.png,product-3.png,product-4.png,product-5.png,product-6.png', '/other/img/product/product-7/,product-details-1.png,product-details-2.png,product-details-3.png,product-details-4.png,product-details-5.png,product-details-6.png', '灰树花，俗称“舞菇”，是食、药兼用蕈菌，夏秋间常野生于栗树周围。子实体肉质，柄短呈珊瑚状分枝，重叠成丛，其外观，婀娜多姿、层叠似菊；其气味、清香四溢，沁人心脾；其肉质脆嫩爽口，百吃不厌。其营养具有好的保健作用和很高的药用价值。', '4', null, '25.00', '54654', '100', '500克,1000克,1500克', '2', '克', null, null, '1', '0.00', null, null, null, '1', '1', '1', null, '1', '1007', '2021-05-04 16:26:17');
INSERT INTO `goods` VALUES ('26', '101', '241香菇', '/other/img/product/product-1/product.png', '/other/img/product/product-1/,product-details-1.png,product-details-2.png,product-details-3.png,product-details-4.png', '/other/img/product/product-1/sub.png', '241-4香菇，清香“味”美 营养丰富', '5', null, '59.00', '465', '100', '250克', '2', '克', null, null, '/other/img/product/product-1/album/,album1.jpg,album2.jpg,album3.jpg,album4.jpg,album5.jpg,album6.jpg,album7.jpg,album8.jpg,album9.jpg,album10.jpg', '0.00', null, null, null, '0', '1', '0', null, '0', '1001', '2021-05-11 14:40:04');
INSERT INTO `goods` VALUES ('27', '102', '椴木香菇', '/other/img/product/product-2/product.png', '/other/img/product/product-2/,product-details-1.png,product-details-2.png,product-details-3.png,product-details-4.png', '/other/img/product/product-2/sub.png', '以传统椴木栽培的菌菇，产量低，但是香菇品质好', '4', null, '49.00', '75', '100', '250克', '4', '克', null, null, '/other/img/product/product-2/album/,album1.jpg,album2.jpg,album3.jpg,album4.jpg,album5.jpg,album6.jpg,album7.jpg,album8.jpg,album9.jpg,album10.jpg,album11.jpg', '0.00', null, null, null, '0', '1', '0', null, '0', '1001', '2021-05-11 13:30:32');
INSERT INTO `goods` VALUES ('28', '103', '香信菇', '/other/img/product/product-3/product.png', '/other/img/product/product-3/,product-details-1.png,product-details-2.png,product-details-3.png,product-details-4.png', '/other/img/product/product-3/sub.png', '香信菇也是香菇的一种，菌盖圆薄且均匀；肉薄鲜嫩，汁香浓郁，深受吃货的喜爱', '4', null, '39.00', '60', '100', '250克', null, '克', null, null, '/other/img/product/product-3/album/,album1.jpg,album2.jpg,album3.jpg,album4.jpg,album5.jpg,album6.jpg,album7.jpg,album8.jpg,album9.jpg,album10.jpg', '0.00', null, null, null, '0', '0', '0', null, '0', '1001', '2021-05-08 20:41:34');
INSERT INTO `goods` VALUES ('29', '104', '花菇', '/other/img/product/product-4/product.png', '/other/img/product/product-4/,product-details-1.png,product-details-2.png,product-details-3.png,product-details-4.png,product-details-5.png', '/other/img/product/product-4/sub.png', '花菇是香菇中的上品，菌盖成白相间的裂纹；肉厚、细嫩，鲜美，食之有爽口感', '5', null, '45.00', '785', '100', '500克', '4', '克', null, null, '/other/img/product/product-4/album/,album1.jpg,album2.jpg,album3.jpg,album4.jpg,album5.jpg,album6.jpg,album7.jpg,album8.jpg,album9.jpg', '0.00', null, null, null, '0', '1', '0', null, '0', '1001', '2021-05-11 15:13:51');
INSERT INTO `goods` VALUES ('30', '105', '厚冬菇', '/other/img/product/product-5/product.png', '/other/img/product/product-5/,product-details-1.png,product-details-2.png,product-details-3.png,product-details-4.png', '/other/img/product/product-5/sub.png', '经天然干燥而成，伞盖圆润丰腴，口感脆嫩鲜美', '4', '', '36.00', '47', '100', '500克', '3', '克', null, '', '/other/img/product/product-5/album/,album1.jpg,album2.jpg,album3.jpg,album4.jpg,album5.jpg', '0.00', null, null, null, '0', '1', '0', '0', '0', '1001', '2021-05-11 17:12:58');
INSERT INTO `goods` VALUES ('31', '106', '高山冬菇', '/other/img/product/product-6/product.png', '/other/img/product/product-6/,product-details-1.png,product-details-2.png,product-details-3.png', '/other/img/product/product-6/sub.png', '肉制鲜美 香气怡人，口感鲜美，爽滑细腻，香味醇厚', '0', null, '55.00', '4532', '100', '250克', '2', '克', null, null, '/other/img/product/product-6/album/,album1.jpg,album2.jpg,album3.jpg,album4.jpg,album5.jpg', '50.00', '2021-05-05 13:24:06', '2021-05-20 13:24:15', null, '0', '1', '0', '1', '1', '1001', '2021-05-11 16:54:38');
INSERT INTO `goods` VALUES ('32', '201', '灰树花', '/other/img/product/product-7/product.png', '/other/img/product/product-7/,product-details-1.png,product-details-2.png,product-details-3.png,product-details-4.png', '/other/img/product/product-7/sub.png', '灰树花，俗称“舞菇”，是食、药兼用菌，夏秋间常野生与栗树周围。子实体肉质，柄短呈珊瑚状分枝，重叠成群', '0', null, '67.00', '64', '100', '500克', '2', '克', null, null, '/other/img/product/product-7/album/,album1.png,album2.png,album3.jpg,album4.jpg,album5.jpg,album6.jpg,album7.jpg,album8.jpg', '0.00', '2021-04-28 13:24:19', '2021-05-21 13:25:02', null, '0', '1', '1', '1', '0', '1002', '2021-05-11 14:03:37');
INSERT INTO `goods` VALUES ('33', '301', '椴木银耳', '/other/img/product/product-8/product.png', '/other/img/product/product-8/,product-details-1.png,product-details-2.png,product-details-3.png,product-details-4.png', '/other/img/product/product-8/sub.png', '不同于传统种植方式，户外自然生长，历经山风鱼露，营养价值高', '0', null, '42.00', '64', '100', '500克', '2', '克', null, null, '/other/img/product/product-8/album/,album1.jpg,album2.jpg,album3.jpg,album4.jpg,album5.jpg,album6.jpg,album7.jpg,album8.jpg,album9.jpg,album10.jpg,album11.jpg,album12.jpg', '0.00', null, null, null, '0', '1', '0', null, '0', '1003', '2021-05-11 17:12:58');
INSERT INTO `goods` VALUES ('34', '302', '银耳', '/other/img/product/product-9/product.png', '/other/img/product/product-9/,product-details-1.png,product-details-2.png,product-details-3.png,product-details-4.png,product-details-5.png', '/other/img/product/product-9/sub.png', '银耳作为我国传统的食用菌，历来都是深受广大人民所喜爱的食物，其中所含有的活性成分-银耳多糖具有特殊的保健功能。', '0', null, '35.00', '98', '100', '250克', '1', '克', null, null, '/other/img/product/product-9/album/,album1.jpg,album2.png,album3.png,album4.jpg,album5.jpg', '0.00', '2021-05-03 13:24:29', '2021-05-14 13:24:34', null, '0', '1', '0', null, '1', '1004', '2021-05-11 13:26:42');
INSERT INTO `goods` VALUES ('35', '401', '羊肚菌', '/other/img/product/product-10/product.png', '/other/img/product/product-10/,product-details-1.png,product-details-2.png,product-details-3.png,product-details-4.png,product-details-5.png', '/other/img/product/product-10/sub.png', '它是世界公认的著名珍稀食药兼用菌，其香味独特，营养丰富，功能齐全，食效显著。富含多种人体需要的氨基酸和有机锗，具补肾、壮阳、补脑，提神等功效。', '0', null, '59.00', '99', '100', '500克', '1', '克', null, null, '/other/img/product/product-10/album/,album1.jpg,album2.jpg,album3.jpg,album4.jpg,album5.jpg,album6.jpg,album7.jpg,album8.jpg,album9.jpg', '0.00', '2021-05-01 13:25:10', '2021-05-28 13:25:15', null, '0', '1', '0', null, '0', '1005', '2021-05-11 13:27:45');
INSERT INTO `goods` VALUES ('36', '501', '虫草花', '/other/img/product/product-11/product.png', '/other/img/product/product-11/,product-details-1.png,product-details-2.png,product-details-3.png,product-details-4.png', '/other/img/product/product-11/sub.png', '具有有效的抗癌活性的天然产物。', '0', null, '75.00', '65', '100', '500克', '1', '克', null, null, '/other/img/product/product-11/album/,album1.jpg,album2.jpg,album3.jpg,album4.jpg,album5.jpg,album6.jpg,album7.jpg', '0.00', null, null, null, '0', '1', '0', null, '0', '1006', '2021-05-11 11:42:09');
INSERT INTO `goods` VALUES ('37', '601', '木耳', '/other/img/product/product-12/product.png', '/other/img/product/product-12/,product-details-1.png,product-details-2.png,product-details-3.png,product-details-4.png', '/other/img/product/product-12/sub.png', '木耳质地柔软，口感细嫩，味道鲜美，风味特殊，而且富含蛋白质、脂肪、糖类及多种维生素和矿物质，有很高的营养价值，', '0', null, '35.00', '9', '100', '250克', '1', '克', null, null, '/other/img/product/product-12/album/,album1.jpg,album2.jpg,album3.jpg,album4.jpg,album5.jpg,album6.jpg,album7.jpg,album8.jpg,album9.jpg,album10.jpg,album11.jpg', '0.00', null, null, null, '0', '1', '0', null, '0', '1006', '2021-05-11 11:41:36');
INSERT INTO `goods` VALUES ('38', '701', '茶树菇', '/other/img/product/product-13/product.png', '/other/img/product/product-13/,product-details-1.png,product-details-2.png,product-details-3.png,product-details-4.png', '/other/img/product/product-13/sub.png', '含有丰富的B族维生素和钾、钠、钙、镁、铁、锌等矿质元素。柱状田头菇具有清热、平肝、明目、利尿、健脾之功效', '0', null, '52.00', '212', '100', '500克', '1', '克', null, null, '/other/img/product/product-13/album/,album1.jpg,album2.jpg,album3.jpg,album4.jpg,album5.jpg,album6.jpg,album7.jpg,album8.jpg,album9.jpg,album10.jpg', '35.00', '2021-05-04 18:30:40', '2021-05-20 18:30:36', null, '0', '1', '0', null, '1', '1007', '2021-05-11 11:41:05');
INSERT INTO `goods` VALUES ('39', '801', '竹荪', '/other/img/product/product-14/product.png', '/other/img/product/product-14/,product-details-1.png,product-details-2.png,product-details-3.png,product-details-4.png', '/other/img/product/product-14/sub.png', '竹荪营养丰富，香味浓郁，滋味鲜美，自古就列为“草八珍”之一。', '0', null, '65.00', '6755', '100', '500克', '1', '克', null, null, '/other/img/product/product-14/album/,album1.jpg,album2.jpg,album3.jpg,album4.jpg,album5.jpg,album6.jpg,album7.jpg,album8.jpg,album9.jpg,album10.jpg,album11.jpg', '0.00', null, null, null, '0', '1', '0', null, '0', '1008', '2021-05-11 11:33:13');
INSERT INTO `goods` VALUES ('40', '901', '姬松茸', '/other/img/product/product-15/product.png', '/other/img/product/product-15/,product-details-1.png,product-details-2.png,product-details-3.png,product-details-4.png,product-details-5.png', '/other/img/product/product-15/sub.png', '姬松茸Agaricus blazei Murr.（又名巴西蘑菇），原产巴西、秘鲁。它是一种夏秋生长的腐生菌，生活在高温、多湿、通风的环境中，具杏仁香味，口感脆嫩。', '0', null, '85.00', '65', '100', '250克', '1', '克', null, null, '/other/img/product/product-15/album/,album1.png,album2.jpg,album3.jpg,album4.jpg,album5.jpg,album6.jpg,album7.jpg', '0.00', null, null, null, '0', '1', '0', null, '0', '1009', '2021-05-11 11:42:30');
INSERT INTO `goods` VALUES ('41', '1001', '猴头菇', '/other/img/product/product-16/product.png', '/other/img/product/product-16/,product-details-1.png,product-details-2.png,product-details-3.png,product-details-4.png,product-details-5.png', '/other/img/product/product-16/sub.png', '猴头菇为齿菌科真菌猴头菌的子实体，只因外形酷似猴头而得名。猴蘑，猴头，猴菇，是中国传统的名贵菜肴，肉嫩、味香、鲜美可口。', '0', null, '65.00', '66', '100', '500克', null, '克', null, null, '/other/img/product/product-16/album/,album1.png,album2.png,album3.jpg,album4.jpg,album5.jpg,album6.jpg,album7.jpg', '0.00', null, null, null, '0', '0', '0', null, '0', '1010', '2021-05-11 11:34:13');
INSERT INTO `goods` VALUES ('42', '1101', '杏鲍菇', '/other/img/product/product-17/product.png', '/other/img/product/product-17/,product-details-1.png,product-details-2.png,product-details-3.png,product-details-4.png', '/other/img/product/product-17/sub.png', '含有大量的寡糖，是灰树花的15倍、金针菇的3.5倍、真姬菇的2倍，它与胃肠中的双岐菌一起作用，具有很好的促进消化、吸收功能。', '0', null, '41.00', '65', '100', '500克', '1', '克', null, null, '/other/img/product/product-17/album/,album1.jpg,album2.jpg,album3.jpg,album4.jpg,album5.jpg,album6.jpg,album7.jpg,album8.jpg', '0.00', null, null, null, '0', '1', '0', null, '0', '1011', '2021-05-11 11:34:34');
INSERT INTO `goods` VALUES ('49', '123213', '312321', '', '', null, '1', '0', '3123', '21312.00', '3123', '3123', '3,1,2,3', null, '3123', null, '', null, null, null, null, null, '1', '0', '0', '0', '0', '3123', '2021-05-11 15:22:14');
INSERT INTO `goods` VALUES ('50', '213', '3123', '/other/img/product/213/icon/85609241.jpeg', '/other/img/product/213/pic/,14537260.jpeg,81632504.jpeg', null, '213', '0', '3213', '123.00', '312', '12', '3,2,1,3', null, '312', '3.00', '', null, null, null, null, null, '0', '0', '0', '0', '0', '312', '2021-05-11 15:25:31');

-- ----------------------------
-- Table structure for goods_category
-- ----------------------------
DROP TABLE IF EXISTS `goods_category`;
CREATE TABLE `goods_category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pid` int DEFAULT '0' COMMENT '父id',
  `icon` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'icon图标',
  `name` char(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `vice_name` char(80) DEFAULT NULL COMMENT '副标题',
  `describe` char(255) DEFAULT NULL COMMENT '描述',
  `is_home` tinyint DEFAULT '0' COMMENT '是否首页推荐（0否, 1是）',
  `sort` tinyint DEFAULT '0' COMMENT '排序',
  `is_enable` tinyint(1) DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `upd_time` date DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `sort` (`sort`),
  KEY `is_enable` (`is_enable`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='商品分类';

-- ----------------------------
-- Records of goods_category
-- ----------------------------
INSERT INTO `goods_category` VALUES ('1', '1001', '/other/img/categories/cat-1.png', '香菇', null, null, '1', '0', '1', null);
INSERT INTO `goods_category` VALUES ('2', '1002', '/other/img/categories/cat-2.png', '灰树花', null, null, '1', '0', '1', null);
INSERT INTO `goods_category` VALUES ('3', '1003', '/other/img/categories/cat-3.png', '银耳', null, null, '0', '0', '1', null);
INSERT INTO `goods_category` VALUES ('7', '1004', '/other/img/categories/cat-4.png', '羊肚菌', null, null, '1', '0', '1', null);
INSERT INTO `goods_category` VALUES ('8', '1005', '/other/img/categories/cat-5.png', '虫草花', null, null, '1', '0', '1', null);
INSERT INTO `goods_category` VALUES ('9', '1006', '/other/img/categories/cat-6.png', '木耳', null, null, '0', '0', '1', null);
INSERT INTO `goods_category` VALUES ('10', '1007', '/other/img/categories/cat-7.png', '茶树菇', null, null, '0', '0', '1', null);
INSERT INTO `goods_category` VALUES ('11', '1008', null, '竹荪', null, null, '0', '0', '1', null);
INSERT INTO `goods_category` VALUES ('12', '1009', null, '姬松茸', null, null, '0', '0', '1', null);
INSERT INTO `goods_category` VALUES ('13', '1010', null, '猴头菇', null, null, '0', '0', '1', null);
INSERT INTO `goods_category` VALUES ('14', '1011', null, '杏鲍菇', null, null, '0', '0', '1', null);

-- ----------------------------
-- Table structure for goods_comment
-- ----------------------------
DROP TABLE IF EXISTS `goods_comment`;
CREATE TABLE `goods_comment` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `order_sn` varchar(255) DEFAULT NULL COMMENT '订单编号',
  `goods_id` bigint DEFAULT NULL COMMENT '商品id',
  `goods_spec` varchar(255) DEFAULT NULL COMMENT '购买时的商品属性',
  `user_icon` varchar(255) DEFAULT NULL COMMENT '评论用户头像',
  `content` char(255) DEFAULT NULL COMMENT '评价内容',
  `pics` varchar(1000) DEFAULT NULL COMMENT '评价图片，以逗号隔开',
  `rating` tinyint(1) DEFAULT '0' COMMENT '评价级别（默认0 1~5）',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '是否显示（0否, 1是）',
  `is_anonymous` tinyint(1) DEFAULT '0' COMMENT '是否匿名（0否，1是）',
  `reply` char(255) DEFAULT NULL COMMENT '回复内容',
  `is_reply` tinyint(1) DEFAULT '0' COMMENT '是否回复（0否，1是）',
  `comment_time` datetime DEFAULT NULL COMMENT '评价时间',
  `reply_time` datetime DEFAULT NULL COMMENT '回复时间',
  `upd_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='商品评论';

-- ----------------------------
-- Records of goods_comment
-- ----------------------------
INSERT INTO `goods_comment` VALUES ('1', '123', '29480176', '102', 'S', '/other/img/product/product-2/sub.png', '好好吃', '/other/img/comment/102/123/03145679.jpeg', '4', '1', '1', null, '0', '2021-04-22 18:34:33', null, '2021-05-11 13:29:18');
INSERT INTO `goods_comment` VALUES ('2', '123', '29480176', '105', 'S', '/other/img/product/product-4/sub.png', '此用户没有填写评价。', '/other/img/comment/105/123/,14089265.jpeg,24650719.jpeg,65291438.jpeg', '5', '1', '0', null, '0', '2021-04-22 18:34:33', null, '2021-05-11 13:30:07');
INSERT INTO `goods_comment` VALUES ('3', '123', '29480176', '107', 'S', '/other/img/product/product-4/sub.png', '此用户没有填写评价。', null, '4', '1', '0', null, '0', '2021-04-22 18:34:33', null, '2021-05-11 13:29:58');
INSERT INTO `goods_comment` VALUES ('8', '13533422222', '71695840', '105', 'S', '/other/img/product/product-4/sub.png', '老板性格好，宝贝也好，超赞. 还不错.质量挺好的.速度也快. 真不错，', '/other/img/comment/105/13533422222/28174506.jpeg', '5', '1', '0', null, '0', '2021-04-26 23:58:01', null, '2021-05-11 13:29:59');
INSERT INTO `goods_comment` VALUES ('9', '13533422222', '80925416', '103', 'S', '/other/img/product/product-13/,product-details-1.png,product-details-2.png,product-details-3.png,product-details-4.png', '服务态度也超好， 很有心的店家，以后常光顾', '/other/img/comment/103/13533422222/81342057.jpeg', '4', '1', '1', null, '0', '2021-04-27 00:01:14', null, '2021-05-11 13:30:20');
INSERT INTO `goods_comment` VALUES ('27', '13533422222', '24587369', '103', 'S', '/other/img/product/product-13/,product-details-1.png,product-details-2.png,product-details-3.png,product-details-4.png', '此用户没有填写评价。', '/other/img/comment/103/13533422222/10739528.jpg', '5', '1', '1', null, '0', '2021-04-28 13:50:12', null, '2021-05-11 13:30:22');
INSERT INTO `goods_comment` VALUES ('28', '13533422222', '24587369', '104', 'S', '/other/img/product/product-13/,product-details-1.png,product-details-2.png,product-details-3.png,product-details-4.png', '此用户没有填写评价。', null, '5', '1', '0', null, '0', '2021-04-28 13:50:12', null, '2021-05-11 13:30:23');
INSERT INTO `goods_comment` VALUES ('29', '13533422222', '24587369', '105', 'S', '/other/img/product/product-13/,product-details-1.png,product-details-2.png,product-details-3.png,product-details-4.png', '此用户没有填写评价。', null, '3', '1', '0', null, '0', '2021-04-28 13:50:12', null, '2021-05-11 13:30:25');
INSERT INTO `goods_comment` VALUES ('30', '13533422222', '21807345', '102', 'S', '/other/img/product/product-2/product.png', '炖汤特别好', '/other/img/comment/102/13533422222/,24315690.jpeg,62781943.jpeg,16547982.jpeg', '5', '1', '1', null, '0', '2021-04-29 14:44:59', null, '2021-05-11 13:29:11');
INSERT INTO `goods_comment` VALUES ('31', '13533422222', '02143875', '102', '500克', '/other/img/product/product-10/sub.png', '此用户没有填写评价。', null, '5', '1', '0', null, '0', '2021-05-02 20:50:07', null, '2021-05-11 13:30:09');
INSERT INTO `goods_comment` VALUES ('32', '13533422222', '02143875', '107', '500克', '/other/img/product/product-10/sub.png', '灰树花非常好吃，做汤一流', null, '5', '1', '1', null, '0', '2021-05-02 20:50:07', null, '2021-05-11 13:30:18');
INSERT INTO `goods_comment` VALUES ('33', '13533422222', '34186059', '101', '250克', '/other/img/defaultavatar/icon.png', '好吃', '/other/img/comment/101/13533422222/71532048.jpeg', '5', '1', '0', null, '0', '2021-05-11 14:39:57', null, '2021-05-11 14:39:56');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户id',
  `order_sn` varchar(255) NOT NULL DEFAULT '0' COMMENT '订单编号',
  `goods_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT '商品id：逗号分隔',
  `create_time` datetime DEFAULT NULL COMMENT '提交时间',
  `total_amount` decimal(10,2) DEFAULT NULL COMMENT '订单总金额',
  `order_status` int DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已收货；4->已评价；5->已关闭；6->退货退款',
  `payment_time` datetime DEFAULT NULL COMMENT '支付时间',
  `trade_no` varchar(255) DEFAULT NULL COMMENT '交易号',
  `delivery_company` varchar(64) DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) DEFAULT NULL COMMENT '物流单号',
  `address_id` bigint DEFAULT '0' COMMENT '用户地址id',
  `user_address_name` char(60) DEFAULT NULL COMMENT '姓名',
  `tel` char(15) DEFAULT NULL COMMENT '电话',
  `province` char(80) DEFAULT NULL COMMENT '所在省',
  `city` char(80) DEFAULT NULL COMMENT '所在市',
  `county` char(80) DEFAULT NULL COMMENT '所在县/区',
  `address` char(80) DEFAULT NULL COMMENT '详细地址',
  `delivery_time` datetime DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime DEFAULT NULL COMMENT '评价时间',
  `refund_price` decimal(10,2) DEFAULT '0.00' COMMENT '退款金额',
  `returned_quantity` int DEFAULT '0' COMMENT '退货数量',
  `is_del` int DEFAULT '0' COMMENT '是否删除，0：否，1：是',
  `upd_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='订单';

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('33', '13533422222', '74230851', '102', '2021-05-05 18:28:49', '49.00', '6', '2021-05-05 18:30:04', '2021050522001400300501091935', null, null, '2', '吴一名', '13589689875', '山西省', '大同市', '左云县', '长平东街与炎帝大道交叉路口往东南约200米秦庄新园小区', null, null, null, '0.00', '0', '0', '2021-05-09 02:34:12');
INSERT INTO `order` VALUES ('34', '13533422222', '79524806', '105', '2021-05-06 21:33:16', '72.00', '6', '2021-05-06 21:34:55', '2021050622001400300501093306', null, null, '10', '赵钱', '18965487541', '天津市', '天津城区', '河东区', '万腾道与顺达路交叉口东北50米天津市华英中学', null, null, null, '0.00', '0', '0', '2021-05-06 22:06:50');
INSERT INTO `order` VALUES ('36', '13533422222', '78549631', '104', '2021-05-09 04:17:14', '45.00', '6', null, null, null, null, '12', '周天二', '17856451256', '北京市', '北京城区', '东城区', '\r\n北京市东城区景山前街4号故宫博物院', null, null, null, '0.00', '0', '0', '2021-05-09 04:17:51');
INSERT INTO `order` VALUES ('37', '13533422222', '28196035', '102', '2021-05-09 04:42:27', '49.00', '6', null, null, null, null, '12', '周天二', '17856451256', '北京市', '北京城区', '东城区', '\r\n北京市东城区景山前街4号故宫博物院', null, null, null, '0.00', '0', '0', '2021-05-09 04:42:45');
INSERT INTO `order` VALUES ('38', '13533422222', '79304156', '101,102,104,105,106,201,301,302,401,501,601,701,801,901,1101', '2021-05-11 02:04:07', '783.00', '6', null, null, null, null, '12', '周天二', '17856451256', '北京市', '北京城区', '东城区', '\r\n北京市东城区景山前街4号故宫博物院', null, null, null, '0.00', '0', '0', '2021-05-11 14:36:31');
INSERT INTO `order` VALUES ('39', '13533422222', '82650934', '106,201', '2021-05-11 14:03:37', '122.00', '6', '2021-05-11 14:07:05', '2021051122001400300501095576', '圆通', 'YT5252197463821', '2', '吴一名', '13589689875', '山西省', '大同市', '左云县', '长平东街与炎帝大道交叉路口往东南约200米秦庄新园小区', '2021-05-11 14:10:41', null, null, '0.00', '0', '0', '2021-05-11 14:17:26');
INSERT INTO `order` VALUES ('40', '13533422222', '34186059', '101', '2021-05-11 14:37:32', '59.00', '4', '2021-05-11 14:38:38', '2021051122001400300501095428', '圆通', 'YT5157019164938', '12', '周天二', '17856451256', '北京市', '北京城区', '东城区', '\r\n北京市东城区景山前街4号故宫博物院', '2021-05-11 14:39:05', null, null, '0.00', '0', '0', '2021-05-11 14:39:56');
INSERT INTO `order` VALUES ('41', '13533422222', '14037598', '104', '2021-05-11 15:13:51', '45.00', '0', null, null, null, null, '12', '周天二', '17856451256', '北京市', '北京城区', '东城区', '\r\n北京市东城区景山前街4号故宫博物院', null, null, null, '0.00', '0', '0', '2021-05-11 15:13:51');
INSERT INTO `order` VALUES ('42', '13533422222', '46398512', '105,301', '2021-05-11 17:12:59', '204.00', '6', '2021-05-11 17:13:29', '2021051122001400300501096033', '圆通', 'YT5294719399493', '12', '周天二', '17856451256', '北京市', '北京城区', '东城区', '\r\n北京市东城区景山前街4号故宫博物院', '2021-05-11 17:14:32', null, null, '0.00', '0', '0', '2021-05-11 17:15:56');

-- ----------------------------
-- Table structure for order_goods
-- ----------------------------
DROP TABLE IF EXISTS `order_goods`;
CREATE TABLE `order_goods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(255) DEFAULT NULL COMMENT '订单编号',
  `user_id` bigint DEFAULT '0' COMMENT '用户id',
  `goods_id` int DEFAULT '0' COMMENT '商品id',
  `goods_name` char(60) DEFAULT NULL COMMENT '商品名',
  `images` char(255) DEFAULT NULL COMMENT '封面图片',
  `spec` char(255) DEFAULT NULL COMMENT '规格',
  `price` decimal(10,2) unsigned DEFAULT NULL COMMENT '价格',
  `stock` int DEFAULT '0' COMMENT '购买数量',
  `total_price` decimal(10,2) DEFAULT '0.00' COMMENT '总价',
  `upd_time` date DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 COMMENT='订单商品表';

-- ----------------------------
-- Records of order_goods
-- ----------------------------
INSERT INTO `order_goods` VALUES ('92', '81359204', '13533422222', '104', '花菇', '/other/img/product/product-4/product.png', '500克', '45.00', '1', '45.00', '2021-05-05');
INSERT INTO `order_goods` VALUES ('93', '74230851', '13533422222', '102', '椴木香菇', '/other/img/product/product-2/product.png', '250克', '49.00', '1', '49.00', '2021-05-01');
INSERT INTO `order_goods` VALUES ('94', '79524806', '13533422222', '105', '厚冬菇', '/other/img/product/product-5/product.png', '500克', '36.00', '2', '72.00', '2021-04-14');
INSERT INTO `order_goods` VALUES ('95', '40632718', '13533422222', '102', '椴木香菇', '/other/img/product/product-2/product.png', '250克', '49.00', '1', '49.00', '2021-04-15');
INSERT INTO `order_goods` VALUES ('96', '78549631', '13533422222', '104', '花菇', '/other/img/product/product-4/product.png', '500克', '45.00', '1', '45.00', '2021-02-16');
INSERT INTO `order_goods` VALUES ('97', '28196035', '13533422222', '102', '椴木香菇', '/other/img/product/product-2/product.png', '250克', '49.00', '1', '49.00', '2021-04-28');
INSERT INTO `order_goods` VALUES ('99', '79304156', '13533422222', '101', '241香菇', '/other/img/product/product-1/product.png', '250克', '59.00', '1', '59.00', '2021-05-11');
INSERT INTO `order_goods` VALUES ('100', '79304156', '13533422222', '102', '椴木香菇', '/other/img/product/product-2/product.png', '250克', '49.00', '1', '49.00', '2021-05-11');
INSERT INTO `order_goods` VALUES ('101', '79304156', '13533422222', '104', '花菇', '/other/img/product/product-4/product.png', '500克', '45.00', '1', '45.00', '2021-05-11');
INSERT INTO `order_goods` VALUES ('102', '79304156', '13533422222', '105', '厚冬菇', '/other/img/product/product-5/product.png', '500克', '36.00', '1', '36.00', '2021-05-11');
INSERT INTO `order_goods` VALUES ('103', '79304156', '13533422222', '106', '高山冬菇', '/other/img/product/product-6/product.png', '250克', '55.00', '1', '55.00', '2021-05-11');
INSERT INTO `order_goods` VALUES ('104', '79304156', '13533422222', '201', '灰树花', '/other/img/product/product-7/product.png', '500克', '67.00', '1', '67.00', '2021-05-11');
INSERT INTO `order_goods` VALUES ('105', '79304156', '13533422222', '301', '椴木银耳', '/other/img/product/product-8/product.png', '500克', '42.00', '1', '42.00', '2021-05-11');
INSERT INTO `order_goods` VALUES ('106', '79304156', '13533422222', '302', '银耳', '/other/img/product/product-9/product.png', '250克', '35.00', '1', '35.00', '2021-05-11');
INSERT INTO `order_goods` VALUES ('107', '79304156', '13533422222', '401', '羊肚菌', '/other/img/product/product-10/product.png', '500克', '59.00', '1', '59.00', '2021-05-11');
INSERT INTO `order_goods` VALUES ('108', '79304156', '13533422222', '501', '虫草花', '/other/img/product/product-11/product.png', '500克', '75.00', '1', '75.00', '2021-05-11');
INSERT INTO `order_goods` VALUES ('109', '79304156', '13533422222', '601', '木耳', '/other/img/product/product-12/product.png', '250克', '35.00', '1', '35.00', '2021-05-11');
INSERT INTO `order_goods` VALUES ('110', '79304156', '13533422222', '701', '茶树菇', '/other/img/product/product-13/product.png', '500克', '35.00', '1', '35.00', '2021-05-11');
INSERT INTO `order_goods` VALUES ('111', '79304156', '13533422222', '801', '竹荪', '/other/img/product/product-14/product.png', '500克', '65.00', '1', '65.00', '2021-05-11');
INSERT INTO `order_goods` VALUES ('112', '79304156', '13533422222', '901', '姬松茸', '/other/img/product/product-15/product.png', '250克', '85.00', '1', '85.00', '2021-05-11');
INSERT INTO `order_goods` VALUES ('113', '79304156', '13533422222', '1101', '杏鲍菇', '/other/img/product/product-17/product.png', '500克', '41.00', '1', '41.00', '2021-05-11');
INSERT INTO `order_goods` VALUES ('114', '82650934', '13533422222', '106', '高山冬菇', '/other/img/product/product-6/product.png', '250克', '55.00', '1', '55.00', '2021-05-11');
INSERT INTO `order_goods` VALUES ('115', '82650934', '13533422222', '201', '灰树花', '/other/img/product/product-7/product.png', '500克', '67.00', '1', '67.00', '2021-05-11');
INSERT INTO `order_goods` VALUES ('116', '34186059', '13533422222', '101', '241香菇', '/other/img/product/product-1/product.png', '250克', '59.00', '1', '59.00', '2021-05-11');
INSERT INTO `order_goods` VALUES ('117', '14037598', '13533422222', '104', '花菇', '/other/img/product/product-4/product.png', '500克', '45.00', '1', '45.00', '2021-05-11');
INSERT INTO `order_goods` VALUES ('118', '46398512', '13533422222', '105', '厚冬菇', '/other/img/product/product-5/product.png', '500克', '36.00', '1', '36.00', '2021-05-11');
INSERT INTO `order_goods` VALUES ('119', '46398512', '13533422222', '301', '椴木银耳', '/other/img/product/product-8/product.png', '500克', '42.00', '4', '168.00', '2021-05-11');

-- ----------------------------
-- Table structure for reimburse
-- ----------------------------
DROP TABLE IF EXISTS `reimburse`;
CREATE TABLE `reimburse` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(255) DEFAULT '0' COMMENT '订单编号',
  `goods_ids` varchar(255) DEFAULT '0' COMMENT '商品id：逗号分隔',
  `is_received_goods` int DEFAULT NULL COMMENT '是否收到货，0：否；1：是',
  `is_retutn_goods` int DEFAULT NULL COMMENT '是否退货，0：否；1：是',
  `is_all_reimburse` int DEFAULT NULL COMMENT '是否全部退款，0：否；1：是',
  `price` decimal(10,2) DEFAULT NULL COMMENT '退款金额',
  `reason` varchar(255) DEFAULT NULL COMMENT '退款理由',
  `caption` varchar(255) DEFAULT NULL COMMENT '退款说明',
  `images` varchar(255) DEFAULT NULL COMMENT '照片凭证,首个路径,后续为文件名,逗号分隔',
  `seller_opinion` int DEFAULT NULL COMMENT '卖家意见:0:不同意，1：同意',
  `seller_caption` varchar(255) DEFAULT NULL COMMENT '卖家说明',
  `delivery` varchar(255) DEFAULT NULL COMMENT '物流单号',
  `delivery_company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '物流公司',
  `address` varchar(255) DEFAULT NULL COMMENT '卖家地址',
  `delivery_status` int DEFAULT NULL COMMENT '退款状态：0:买家发起请求，1：商家处理，2:买家退货，3：退款成功',
  `order_status` int DEFAULT NULL COMMENT '原订单状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='退款表';

-- ----------------------------
-- Records of reimburse
-- ----------------------------
INSERT INTO `reimburse` VALUES ('2', '21807345', '102', '0', '0', '1', '145.00', '商品错发,漏发', '213', '/other/img/reimburse/13533422222/,45219837.jpeg:82549176.jpeg', '0', '12345', null, null, null, '1', null);
INSERT INTO `reimburse` VALUES ('4', '19820763', '2', '1', '1', '1', '82.00', '商品质量有问题', '11', '0', '1', null, '12768', null, '浙江省丽水市庆元县食用菌生产基地', '3', null);
INSERT INTO `reimburse` VALUES ('6', '62831547', '101', '0', '0', '1', '45.00', '商品错发,漏发', '不喜欢', '/other/img/reimburse/13533422222/,63850179.jpeg,65832974.jpeg', '1', null, null, null, '浙江省丽水市庆元县食用菌生产基地', '3', null);
INSERT INTO `reimburse` VALUES ('7', '09863124', '105', '1', '0', '0', '66.00', '其他', 'qt', '0', '1', null, null, null, null, '3', null);
INSERT INTO `reimburse` VALUES ('8', '26890471', '102', '1', '1', '1', '82.00', '收到商品破损', '12312', '0', '0', '不允许', null, null, null, '1', null);
INSERT INTO `reimburse` VALUES ('9', '68524317', '103,106', '0', '0', '1', '144.00', '商品质量有问题', '12321', '0', '1', '无退款凭证', null, null, null, '3', null);
INSERT INTO `reimburse` VALUES ('10', '02143875', '102', '1', '0', '0', '82.00', '商品错发,漏发', '木耳漏发', '0', '0', '无照片凭证', null, null, null, '1', null);
INSERT INTO `reimburse` VALUES ('11', '81359204', '104', '0', '0', '1', '45.00', '产品颜色等与描述不符', '大苏打撒', '0', '1', null, null, null, null, '3', null);
INSERT INTO `reimburse` VALUES ('12', '40632718', '102', '0', '0', '1', '49.00', '商品错发,漏发', '漏发', '0', '1', null, null, null, null, '3', '3');
INSERT INTO `reimburse` VALUES ('13', '79524806', '105', '0', '0', '1', '72.00', '收到商品破损', '商品破损', '0', '0', '无凭证', null, null, null, '1', '2');
INSERT INTO `reimburse` VALUES ('19', '86123750', '1', '1', '1', '1', '135.00', '快递太久无法本人收到', '123123', '0', '1', null, '213123213', null, '浙江省丽水市庆元县食用菌生产基地', '3', '2');
INSERT INTO `reimburse` VALUES ('20', '86193204', '5,8', '0', '0', '1', '152.00', '收到商品破损', '123', '0', '0', '无照片凭证', null, null, null, '1', '3');
INSERT INTO `reimburse` VALUES ('21', '78549631', '104', '1', '1', '0', '45.00', '商品质量有问题', '商品破了', '0', '1', null, 'YT5294719399493', '圆通', '浙江省丽水市庆元县食用菌生产基地', '2', '0');
INSERT INTO `reimburse` VALUES ('22', '28196035', '102', '1', '1', '1', '49.00', '产品颜色等与描述不符', '去恶趣味', '0', '1', null, null, null, '浙江省丽水市庆元县食用菌生产基地', '2', '0');
INSERT INTO `reimburse` VALUES ('23', '82650934', '106,201', '1', '1', '1', '122.00', '收到商品破损', '破了', '/other/img/reimburse/13533422222/73162598.jpeg', '1', null, 'YT5294719399493', '圆通', '浙江省丽水市庆元县食用菌生产基地', '3', '2');
INSERT INTO `reimburse` VALUES ('24', '79304156', '101,102,104,105,106,201,301,302,401,501,601,701,801,901,1101', '0', '0', '1', '435.00', '商品质量有问题', '12321', '0', null, null, null, null, null, '0', '0');
INSERT INTO `reimburse` VALUES ('25', '46398512', '105,301', '1', '1', '1', '200.00', '产品颜色等与描述不符', 'sadjashk', '0', '1', null, 'YT5017974477519', '圆通', '浙江省丽水市庆元县食用菌生产基地', '3', '2');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `nickname` varchar(64) DEFAULT NULL COMMENT '昵称',
  `phone` bigint DEFAULT NULL COMMENT '手机号码',
  `user_status` int DEFAULT '1' COMMENT '帐号启用状态:0禁用；1启用',
  `create_time` datetime DEFAULT NULL COMMENT '注册时间',
  `icon` varchar(500) DEFAULT '/other/img/defaultavatar/icon.png' COMMENT '头像',
  `gender` int DEFAULT '0' COMMENT '性别：0未知；1男；2女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `city` varchar(64) DEFAULT NULL COMMENT '城市',
  `job` varchar(100) DEFAULT NULL COMMENT '职业',
  `security_question` varchar(100) DEFAULT NULL COMMENT '密保问题',
  `answer` varchar(100) DEFAULT NULL COMMENT '答案',
  `is_delete` int DEFAULT '0' COMMENT '是否删除：0->未删除；1->已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '13589659874', 'zhangsan', 'zs', '张三', '13589659874', '1', '2008-04-06 16:56:45', '/other/img/icon/13589659874/76e61697a9b0441b932a520d840bdd68.jpeg', '1', '2000-04-17', '杭州', '杂工', '你毕业于哪个初中', '一中', '0');
INSERT INTO `user` VALUES ('2', '13533422222', 'lisi', 'ls', '李四', '15986987458', '1', '2021-05-10 16:56:45', '/other/img/defaultavatar/icon.png', '0', '2001-05-10', '上海', '瓜农', '你喜欢看的电影', '斗牛', '0');
INSERT INTO `user` VALUES ('3', '17856954152', 'wangwu', 'ww', '王五', '17856954152', '0', '2020-06-16 16:56:45', '/other/img/defaultavatar/icon.png', '2', '2010-05-27', '北京', '电子', '你的生日', '2月1', '0');
INSERT INTO `user` VALUES ('4', '19856854852', 'zhaoliu', 'zl', '赵六', '19856854852', '1', '2017-04-14 16:56:45', '/other/img/defaultavatar/icon.png', '2', '2003-01-06', '广州', '装配工', '对你影响最大的人名字是', '陈陈', '0');
INSERT INTO `user` VALUES ('5', '14869523654', 'qianqi', 'qq', '钱七', '14869523654', '1', '2013-07-10 16:56:45', '/other/img/defaultavatar/icon.png', '0', '2006-12-07', '重庆', '电工', '你小学班主任的名字是', '刘六', '0');
INSERT INTO `user` VALUES ('6', '16548521565', 'zhouba', 'zb', '周八', '16548521565', '0', '2007-01-16 16:56:45', '/other/img/defaultavatar/icon.png', '1', '2000-11-30', '郑州', '力工', '你喜欢看的电影', '大赛', '0');
INSERT INTO `user` VALUES ('7', '13645484555', 'zhengjiu', 'zj', '郑九', '13645484555', '1', '2019-12-02 16:56:45', '/other/img/defaultavatar/icon.png', '1', '2002-04-28', '天津', '修理工', '你毕业于哪个初中', '撒点', '0');
INSERT INTO `user` VALUES ('8', '13545675435', '3213213', '123', null, '13545675435', '0', null, '/other/img/defaultavatar/icon.png', '0', null, null, null, '你小学班主任的名字是', '123123123', '0');
INSERT INTO `user` VALUES ('9', '13567894565', '12321321', '123', null, '13567894565', '1', null, '/other/img/defaultavatar/icon.png', '0', null, null, null, '你的生日', '123213213', '0');
INSERT INTO `user` VALUES ('10', '123', '123', '123', null, '13588392132', '1', null, '/other/img/defaultavatar/icon.png', '0', null, null, null, '你毕业于哪个初中', '123', '0');
INSERT INTO `user` VALUES ('11', '13534211233', '13123123', '123', null, '13534211233', '1', null, '/other/img/defaultavatar/icon.png', '0', null, null, null, '你喜欢看的电影', '3123213', '1');
INSERT INTO `user` VALUES ('12', '3123', '213213', '3213', '3213', '13569885858', '1', null, '/other/img/defaultavatar/icon.png', '0', null, '', '', null, null, '0');
INSERT INTO `user` VALUES ('13', '1111', '11', '11111', '11', '13569858585', '0', null, '/other/img/defaultavatar/icon.png', '1', null, '', '', null, null, '0');

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `alias` char(60) DEFAULT NULL COMMENT '别名',
  `user_address_name` char(60) DEFAULT NULL COMMENT '姓名',
  `tel` char(15) DEFAULT NULL COMMENT '电话',
  `province` char(80) DEFAULT NULL COMMENT '所在省',
  `city` char(80) DEFAULT NULL COMMENT '所在市',
  `county` char(80) DEFAULT NULL COMMENT '所在县/区',
  `address` char(80) DEFAULT NULL COMMENT '详细地址',
  `is_default` tinyint(1) DEFAULT '0' COMMENT '是否默认地址（0否, 1是）',
  `is_delete_time` tinyint(1) DEFAULT '0' COMMENT '是否删除（0否，1是）',
  `upd_time` date DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `is_delete_time` (`is_delete_time`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='用户地址';

-- ----------------------------
-- Records of user_address
-- ----------------------------
INSERT INTO `user_address` VALUES ('2', '13533422222', null, '吴一名', '13589689875', '山西省', '大同市', '左云县', '长平东街与炎帝大道交叉路口往东南约200米秦庄新园小区', '0', '0', null);
INSERT INTO `user_address` VALUES ('3', '13533422222', null, '胡天', '15986547852', '黑龙江省', '鸡西市', '鸡冠区', '库伦街道新城西路兴原小区321', '0', '0', null);
INSERT INTO `user_address` VALUES ('10', '13533422222', null, '赵钱', '18965487541', '天津市', '天津城区', '河东区', '万腾道与顺达路交叉口东北50米天津市华英中学', '0', '0', null);
INSERT INTO `user_address` VALUES ('12', '13533422222', null, '周天二', '17856451256', '北京市', '北京城区', '东城区', '\r\n北京市东城区景山前街4号故宫博物院', '1', '0', null);
INSERT INTO `user_address` VALUES ('14', '123', null, '123123', '312312', '天津市', '天津城区', '河西区', '123123', '0', '0', null);
INSERT INTO `user_address` VALUES ('15', '123', null, '3123', '3213', '河北省', '石家庄市', '裕华区', '21321', '0', '0', null);
INSERT INTO `user_address` VALUES ('16', '123', null, '123123', '3213123', '天津市', '天津城区', '河东区', '312', '0', '0', null);
INSERT INTO `user_address` VALUES ('17', '13589659874', null, '1232', '3123213', '湖北省', '黄石市', '西塞山区', '312321', '0', '0', null);
DROP TRIGGER IF EXISTS `goods_create_time`;
DELIMITER ;;
CREATE TRIGGER `goods_create_time` BEFORE INSERT ON `goods` FOR EACH ROW begin
				
        set new.upd_time = now();
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `goods_upd_time`;
DELIMITER ;;
CREATE TRIGGER `goods_upd_time` BEFORE UPDATE ON `goods` FOR EACH ROW BEGIN
     set new.upd_time = now();
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `comment_create_time`;
DELIMITER ;;
CREATE TRIGGER `comment_create_time` BEFORE INSERT ON `goods_comment` FOR EACH ROW begin
				
        set new.upd_time = now();
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `comment_upd_time`;
DELIMITER ;;
CREATE TRIGGER `comment_upd_time` BEFORE UPDATE ON `goods_comment` FOR EACH ROW BEGIN
      set new.upd_time = now();
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `order_create_time`;
DELIMITER ;;
CREATE TRIGGER `order_create_time` BEFORE INSERT ON `order` FOR EACH ROW begin
				
        set new.upd_time = now();
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `order_upd_time`;
DELIMITER ;;
CREATE TRIGGER `order_upd_time` BEFORE UPDATE ON `order` FOR EACH ROW begin
				
        set new.upd_time = now();
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `og_create_time`;
DELIMITER ;;
CREATE TRIGGER `og_create_time` BEFORE INSERT ON `order_goods` FOR EACH ROW begin
				
        set new.upd_time = now();
end
;;
DELIMITER ;
