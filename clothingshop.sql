/*
Navicat MySQL Data Transfer

Source Server         : database
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : clothingshop

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2015-07-31 12:06:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('1', 'Worn By');
INSERT INTO `brand` VALUES ('2', 'Hype');
INSERT INTO `brand` VALUES ('3', 'Topman');
INSERT INTO `brand` VALUES ('4', 'Levi');
INSERT INTO `brand` VALUES ('5', 'Antioch');
INSERT INTO `brand` VALUES ('6', 'Waven');
INSERT INTO `brand` VALUES ('7', 'BAQ');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `catid` int(11) NOT NULL AUTO_INCREMENT,
  `catname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`catid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'TShirt');
INSERT INTO `category` VALUES ('2', 'Shirt');
INSERT INTO `category` VALUES ('4', 'Jeans');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `fname` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `lname` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('Phu', 'Nguyen', 'tester@yahoo.com', 'Vanuatu', '123', '10diemnhathay', '2015-06-26 08:43:36', '21 cu xa tran qung dieu', '0925404004', '37');
INSERT INTO `member` VALUES ('Phu', 'Nguyen', 'just_like_the_wind@yahoo.com', 'Viet Nam', 'thikenphu95', 'thienphu95', '2015-06-26 08:46:17', '21 cu xa tran quang dieu', '0925404004', '38');
INSERT INTO `member` VALUES ('', '', '', 'Viet Nam', '123456', 'admin', '2015-06-26 09:36:49', '', '', '39');
INSERT INTO `member` VALUES ('Phu', 'Nguyen', 'test@yahoo.com', 'Viet Nam', 'sunshine', 'tester2015', '2015-06-26 14:44:39', '225 Nguyen Van Cu', '0925404004', '40');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `describe` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `catid` int(11) DEFAULT NULL,
  `b_id` int(11) DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `view` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('2', 'A', '25', 'By using bold prints, eye catching patterns', '1', '2', 'hypepink.jpg', '2015-05-19 18:55:34', '2021');
INSERT INTO `product` VALUES ('3', 'B', '18', 'Eye-Catching. Washable. Easy to wear', '1', '3', 'whiteaztec.jpg', '2015-05-19 18:55:37', '2026');
INSERT INTO `product` VALUES ('4', 'Topman Quality', '123', 'Add some subtle colour to your casual look with this white roller fit t-shirt updated with a multi-colour paint fleck finish.', '1', '3', 'burgundy89.jpg', '2015-05-19 18:55:40', '20');
INSERT INTO `product` VALUES ('5', 'Topman Mick', '123', 'Give your casual look a trend led edge with this white long sleeve raglan t-shirt, styled with zip side hems from our longline range. ', '1', '3', 'AO.jpg', '2015-05-19 18:55:44', '19');
INSERT INTO `product` VALUES ('6', 'Black Paint TShirt', '16', 'Add some subtle colour to your casual look with this black roller fit t-shirt updated with a multi-colour paint fleck finish.', '1', '3', 'blacksplat.jpg', '2015-05-19 18:55:47', '17');
INSERT INTO `product` VALUES ('7', 'Grey Ribbed Oversized', '20', 'Grey oversized fit on one of our oversized t-shirts with rib detail. 54% Polyester, 46% Acrylic.', '1', '3', 'greyoversize.jpg', '2015-05-19 18:55:50', '19');
INSERT INTO `product` VALUES ('8', 'Black Mono Knitted TShirt', '24', 'Sharpen up a casual look with this black knitted t-shirt completed with contrast white collar and sleeve detailing', '1', '3', 'blackmono.jpg', '2015-05-19 18:55:53', '20');
INSERT INTO `product` VALUES ('9', 'Burgundy 89 Slim Fit T-Shirt', '16', 'Give your everyday look a varsity inspired update with this burgundy 89 design t-shirt from our slim fit range. ', '1', '3', 'burgundy89.jpg', '2015-05-19 18:55:56', '29');
INSERT INTO `product` VALUES ('10', 'Worn By Black Kiss T-Shirt*', '123', 'Worn By are a brand that are dedicated to capturing the most iconic moments of rock & roll history by using premium graphics and prints. ', '1', '1', 'wornby2.jpg', '2015-05-19 18:56:00', '12');
INSERT INTO `product` VALUES ('11', 'Worn By Black T-Shirt*', '30', 'Worn By are a brand that are dedicated to capturing the most iconic moments of rock & roll history by using premium graphics and prints. ', '1', '1', 'wornby3.jpg', '2015-05-19 18:56:04', '15');
INSERT INTO `product` VALUES ('12', 'nhucc', '100000', 'nhucc', '1', '1', 'burgundy89.jpg', '2015-05-19 18:56:13', '14');
INSERT INTO `product` VALUES ('13', 'Worn By TShirt', '32', 'Worn By are a brand that are dedicated to capturing the most iconic moments of rock & roll history by using premium graphics and prints. ', '1', '1', 'wornby5.jpg', '2015-05-19 18:56:16', '15');
INSERT INTO `product` VALUES ('14', 'Hype Sunshine', '40', 'Long weeve', '1', '2', 'hype2.jpg', '2015-05-19 18:56:19', '16');
INSERT INTO `product` VALUES ('15', 'Hype Floral', '123', 'Easy to wear', '1', '2', 'hype3.jpg', '2015-05-19 18:56:21', '27');
INSERT INTO `product` VALUES ('16', 'Hype Mine', '231', 'By using bold prints, eye catching patterns', '1', '2', 'hype4.jpg', '2015-05-19 18:56:25', '26');
INSERT INTO `product` VALUES ('18', 'Levi\'s Blue 511 Slim Jeans*', '65', 'Levi’s jeans are the world’s leading denim manufacturer and created the first blue jean. ', '4', '4', 'levi1.jpg', '2015-05-19 18:56:31', '23');
INSERT INTO `product` VALUES ('19', 'Levi\'s Blue Check Shirt*', '65', 'Levi’s jeans are the world’s leading denim manufacturer and created the first blue jean. ', '2', '4', 'levi2.jpg', '2015-05-19 18:56:34', '23');
INSERT INTO `product` VALUES ('20', 'Levi\'s Blue Printed Shirt*', '50', 'Levi’s jeans are the world’s leading denim manufacturer and created the first blue jean. ', '2', '4', 'levi3.jpg', '2015-05-19 18:56:38', '24');
INSERT INTO `product` VALUES ('21', 'Levi\'s Grey Reversed T-Shirt*', '35', 'Levi’s jeans are the world’s leading denim manufacturer and created the first blue jean. ', '1', '4', 'levi4.jpg', '2015-05-19 18:56:40', '30');
INSERT INTO `product` VALUES ('22', 'Levi\'s Blue Denim Shirt*', '50', 'Levi’s jeans are the world’s leading denim manufacturer and created the first blue jean. ', '2', '4', 'levi5.jpg', '2015-05-19 18:56:43', '32');
INSERT INTO `product` VALUES ('23', 'Levis 501 Blue Jeans', '85', 'Levi’s jeans are the world’s leading denim manufacturer and created the first blue jean. ', '4', '4', 'levi6.jpg', '2015-05-19 18:56:45', '32');
INSERT INTO `product` VALUES ('24', 'Levis Black 522 Slim Jeans', '65', 'Levi’s jeans are the world’s leading denim manufacturer and created the first blue jean. ', '4', '4', 'levi7.jpg', '2015-05-19 18:56:46', '31');
INSERT INTO `product` VALUES ('25', 'Levis Blue Denim Jeans', '60', 'Levi’s jeans are the world’s leading denim manufacturer and created the first blue jean. ', '2', '4', 'levi9.jpg', '2015-05-19 18:56:49', '23');
INSERT INTO `product` VALUES ('26', 'Levi\'s Blue Denim Shirt*', '80', 'Levi’s jeans are the world’s leading denim manufacturer and created the first blue jean. ', '2', '4', 'levi8.jpg', '2015-05-19 18:56:52', '12');
INSERT INTO `product` VALUES ('27', 'Levi\'s Blue 510 Skinny Jeans*', '85', 'Levi’s jeans are the world’s leading denim manufacturer and created the first blue jean. ', '4', '4', 'levi10.jpg', '2015-05-19 18:56:56', '14');
INSERT INTO `product` VALUES ('28', 'Levi\'s 511 Grey Slim Jeans*', '65', 'Levi’s jeans are the world’s leading denim manufacturer and created the first blue jean. ', '4', '4', 'levi11.jpg', '2015-05-19 18:57:00', '16');
INSERT INTO `product` VALUES ('29', 'Levi\'s 511 Blue Slim Jeans*', '65', 'Levi’s jeans are the world’s leading denim manufacturer and created the first blue jean. ', '4', '4', 'levi12.jpg', '2015-05-19 18:57:03', '17');
INSERT INTO `product` VALUES ('30', 'Levis Blue 511 Slim Jeans*', '90', 'Levi’s jeans are the world’s leading denim manufacturer and created the first blue jean. ', '4', '4', 'levi13.jpg', '2015-05-19 18:57:06', '50');
INSERT INTO `product` VALUES ('31', 'Levi\'s 510 Black Skinny Jeans', '80', 'Levi’s jeans are the world’s leading denim manufacturer and created the first blue jean. ', '4', '4', 'levi14.jpg', '2015-05-19 18:57:08', '42');
INSERT INTO `product` VALUES ('32', 'Levi\'s 501 Blue Fit Jeans', '85', 'Levi’s jeans are the world’s leading denim manufacturer and created the first blue jean. ', '4', '4', 'levi15.jpg', '2015-05-19 18:57:13', '35');
INSERT INTO `product` VALUES ('33', 'Levi\'s 510 Skinny Grey Jeans', '85', 'Levi’s jeans are the world’s leading denim manufacturer and created the first blue jean. ', '4', '4', 'levi16.jpg', '2015-05-19 18:57:16', '22');
INSERT INTO `product` VALUES ('34', 'Antioch Grey Biker Jeans', '55', 'Antioch offer a streetwear range that is both subtle and expertly crafted with clean branding and simple designs.', '4', '5', 'antioch.jpg', '2015-05-19 18:57:19', '23');
INSERT INTO `product` VALUES ('35', 'Antioch Black Skinny Jeans', '55', 'Antioch offer a streetwear range that is both subtle and expertly crafted with clean branding and simple designs.', '4', '5', 'antioch2.jpg', '2015-05-19 18:57:23', '16');
INSERT INTO `product` VALUES ('36', 'Antioch Blue Skinny Jeans', '48', 'Antioch offer a streetwear range that is both subtle and expertly crafted with clean branding and simple designs.', '4', '5', 'antioch3.jpg', '2015-05-19 18:57:26', '44');
INSERT INTO `product` VALUES ('37', 'Antioch Blue Skinny Jeans', '48', 'Antioch offer a streetwear range that is both subtle and expertly crafted with clean branding and simple designs.', '4', '5', 'antioch4.jpg', '2015-05-19 18:57:29', '33');
INSERT INTO `product` VALUES ('38', 'Antioch Blue Jeans', '48', 'Antioch offer a streetwear range that is both subtle and expertly crafted with clean branding and simple designs.', '4', '5', 'antioch5.jpg', '2015-05-19 18:57:32', '35');
INSERT INTO `product` VALUES ('39', 'Wåven Grey Skinny Jeans', '50', 'Waven produce timeless pieces that combine contemporary fashion ideals with Scandinavian design influences with flawless results. ', '4', '6', 'waven.jpg', '2015-05-19 18:57:36', '37');
INSERT INTO `product` VALUES ('40', 'Wåven Blue Jeans', '54', 'Waven produce timeless pieces that combine contemporary fashion ideals with Scandinavian design influences with flawless results. ', '4', '6', 'waven2.jpg', '2015-05-19 18:57:38', '2');
INSERT INTO `product` VALUES ('41', 'Wåven Black Skinny Fit Jeans*', '50', 'Waven produce timeless pieces that combine contemporary fashion ideals with Scandinavian design influences with flawless results. ', '4', '6', 'waven3.jpg', '2015-05-19 18:57:42', '1');
INSERT INTO `product` VALUES ('42', 'Wåven Blue Ripped Fit Jean', '54', 'Waven produce timeless pieces that combine contemporary fashion ideals with Scandinavian design influences with flawless results. ', '4', '6', 'waven4.jpg', '2015-05-19 18:57:44', '16');
INSERT INTO `product` VALUES ('43', 'Wåven Blue Acid Jeans', '50', 'Waven produce timeless pieces that combine contemporary fashion ideals with Scandinavian design influences with flawless results. ', '4', '6', 'waven5.jpg', '2015-05-19 18:57:46', '14');
INSERT INTO `product` VALUES ('44', 'Wåven Blue Carot Jeans', '50', 'Waven produce timeless pieces that combine contemporary fashion ideals with Scandinavian design influences with flawless results. ', '4', '6', 'waven6.jpg', '2015-05-19 18:57:48', '36');
INSERT INTO `product` VALUES ('45', 'Wåven Black Ripped Jeans', '58', 'Antioch offer a streetwear range that is both subtle and expertly crafted with clean branding and simple designs.', '4', '6', 'waven7.jpg', '2015-05-19 18:57:49', '37');
INSERT INTO `product` VALUES ('48', 'Worn By Super', '250', 'Fashionable', '1', '1', 'wornby2.jpg', '2015-06-18 09:52:52', null);
INSERT INTO `product` VALUES ('49', 'Worn By Super', '250', 'Fashionable', '1', '1', 'wornby3.jpg', '2015-06-18 10:05:44', null);
INSERT INTO `product` VALUES ('50', 'Worn By Super', '250', 'Fashionable', '1', '1', 'wornby4.jpg', '2015-06-18 10:07:11', null);
INSERT INTO `product` VALUES ('51', 'Worn By Super', '250', 'Fashionable', '1', '1', 'wornby5.jpg', '2015-06-18 10:11:14', '2');
INSERT INTO `product` VALUES ('52', 'Worn By Super', '250', 'Fashionable', '1', '1', 'wornby5.jpg', '2015-06-18 10:13:05', null);
INSERT INTO `product` VALUES ('53', 'Worn By Super', '250', 'Fashionable', '1', '1', 'wornby5.jpg', '2015-06-18 10:17:55', '3');
INSERT INTO `product` VALUES ('54', 'VietNam Clothes', '123', 'Made from VN', '1', '1', '123.jpg', '2015-06-26 14:47:12', '4');

-- ----------------------------
-- Table structure for productdetail
-- ----------------------------
DROP TABLE IF EXISTS `productdetail`;
CREATE TABLE `productdetail` (
  `id` int(11) DEFAULT NULL,
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) DEFAULT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of productdetail
-- ----------------------------
INSERT INTO `productdetail` VALUES ('1', '1', '5', 'S');
INSERT INTO `productdetail` VALUES ('1', '2', '4', 'M');
INSERT INTO `productdetail` VALUES ('1', '3', '6', 'L');

-- ----------------------------
-- Table structure for receiptdetail
-- ----------------------------
DROP TABLE IF EXISTS `receiptdetail`;
CREATE TABLE `receiptdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipeID` int(255) DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `total` float DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of receiptdetail
-- ----------------------------
INSERT INTO `receiptdetail` VALUES ('53', '73', '2', 'A', '1', '25', '25', 'hypepink.jpg');
INSERT INTO `receiptdetail` VALUES ('54', '73', '3', 'B', '2', '18', '36', 'whiteaztec.jpg');
INSERT INTO `receiptdetail` VALUES ('55', '73', '5', 'Topman Mick', '1', '123', '123', 'AO.jpg');
INSERT INTO `receiptdetail` VALUES ('56', '74', '4', 'Topman Quality', '1', '123', '123', '11096492_749989201788174_6779176915303431234_n.jpg');
INSERT INTO `receiptdetail` VALUES ('57', '74', '7', 'Grey Ribbed Oversized', '8', '20', '160', 'greyoversize.jpg');
INSERT INTO `receiptdetail` VALUES ('58', '74', '8', 'Black Mono Knitted TShirt', '5', '24', '120', 'blackmono.jpg');
INSERT INTO `receiptdetail` VALUES ('59', '75', '2', 'A', '20000', '25', '500000', 'hypepink.jpg');

-- ----------------------------
-- Table structure for recipe
-- ----------------------------
DROP TABLE IF EXISTS `recipe`;
CREATE TABLE `recipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` float(11,0) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `datestatus` datetime DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of recipe
-- ----------------------------
INSERT INTO `recipe` VALUES ('73', 'thienphu95', 'Phu', '184', '2015-06-26 08:48:09', '1', '2015-06-26 00:00:00', '0925404004', '21 cu xa tran quang dieu');
INSERT INTO `recipe` VALUES ('74', 'thienphu95', 'Phu', '403', '2015-06-26 08:50:17', '1', '2015-06-26 00:00:00', '0925404004', '21 cu xa tran quang dieu');
INSERT INTO `recipe` VALUES ('75', 'tester2015', 'Phu', '500000', '2015-06-26 14:45:42', '1', '2015-06-26 00:00:00', '0925404004', '225 Nguyen Van Cu');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('Phu', 'Nguyen', 'sunshine', 'sunshine', 'Afghanistan', null);
INSERT INTO `user` VALUES ('Phu', 'Nguyen', 'sunshine', 'just_like_the_wind@yahoo.com', 'Afghanistan', null);
INSERT INTO `user` VALUES ('Phu', 'Nguyen', 'sunshine', 'just_like_the_wind@yahoo.com', 'Afghanistan', null);
INSERT INTO `user` VALUES ('a', 'b', 'sunshine', 'c', 'Afghanistan', null);
INSERT INTO `user` VALUES ('Phu', 'Nguyen', 'sunshine', 'just_like_the_wind@yahoo.com', 'Afghanistan', null);
INSERT INTO `user` VALUES ('Ph', 'Nguyen', 'sunshine', 'just_like_the_wind@yahoo.com', 'Afghanistan', null);
INSERT INTO `user` VALUES ('Nguyen VU', 'Thien Phu', 'sunshine', 'just_like_the_wind@yahoo.com', 'Afghanistan', null);
INSERT INTO `user` VALUES ('A', 'B ', 'sunshine', 'C', 'Afghanistan', '2015-05-22 10:37:12');
INSERT INTO `user` VALUES ('asd', 'asd', 'sunshine', 'asd', 'Afghanistan', '2015-05-22 10:41:44');
INSERT INTO `user` VALUES ('Tram', 'Hoang', 'sunshine', 'tramhoang', 'Afghanistan', '2015-05-22 10:43:43');
INSERT INTO `user` VALUES ('P', 'U', 'sunshine', 'K', 'Afghanistan', '2015-05-22 10:46:11');
INSERT INTO `user` VALUES ('o', 'i', 'a', 'js', 'Afghanistan', '2015-05-22 10:48:54');
INSERT INTO `user` VALUES ('', '', '', '', 'Vanuatu', '2015-05-22 10:49:59');
INSERT INTO `user` VALUES ('Phu', 'Nguyen', 'asd', 's', 'Viet Nam', '2015-05-22 13:22:33');
INSERT INTO `user` VALUES ('Phu', 'Nguyen', '123', 'admin@yahoo.com', 'Vietnam', 'admin');
