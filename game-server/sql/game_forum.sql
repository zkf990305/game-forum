/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : game_forum

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 17/04/2022 17:23:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gf_game
-- ----------------------------
DROP TABLE IF EXISTS `gf_game`;
CREATE TABLE `gf_game`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '游戏名称',
  `image` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `official_website` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏官网',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容详情',
  `status` int NOT NULL DEFAULT 0 COMMENT '状态0为可用 1位不可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '游戏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gf_game
-- ----------------------------
INSERT INTO `gf_game` VALUES (1, '英雄联盟', '/files/1-英雄联盟.jpeg', 'https://lol.qq.com/main.shtml', '《英雄联盟》是由腾讯控股的首家美国公司Riot Games开发的3D竞技场战网游戏，其主创团队是由实力强劲的Dota-Allstars的核心人物，以及暴雪等著名游戏公司的美术、程序、策划人员组成，将DOTA的玩法从对战平台延伸到网络游戏世界。除了DotA的游戏节奏、即时战略、团队作战外，《英雄联盟》拥有特色的英雄、自动匹配的战网平台，包括天赋树、召唤师系统、符文等元素，让玩家感受全新的英雄对战。', 0);
INSERT INTO `gf_game` VALUES (2, 'DOTA2', '/files/2-DOTA2.png', 'https://www.dota2.com.cn/main.htm', '《刀塔2》也被称作《DOTA2》，由《DOTA》的地图核心制作者IceFrog（冰蛙）联手美国Valve公司研发的一款游戏，于2013年4月28日开始测试，发布中文名为“刀塔”，是该系列的第二部作品。\n\n《刀塔2》完整继承了原作《DotA》一百多位的英雄，并脱离了上一代作品《DOTA》所依赖的《魔兽争霸Ⅲ》引擎的多人即时对战游戏，《刀塔2》的世界由天辉和夜魇两个阵营所辖区域组成，有上、中、下三条主要的作战道路相连接，中间以河流为界。每个阵营分别由五位玩家所扮演的英雄担任守护者，他们将以守护己方远古遗迹并摧毁敌方远古遗迹为使命，通过提升等级、赚取金钱、购买装备和击杀敌方英雄等手段达成胜利。', 0);
INSERT INTO `gf_game` VALUES (3, '绝地求生', '/files/3-绝地求生.jpg', 'https://cn.pubg.com/', '《绝地求生》(PUBG) 是由韩国Krafton工作室开发的一款战术竞技型射击类沙盒游戏 [1]  [36-37]  。\r\n在该游戏中，玩家需要在游戏地图上收集各种资源，并在不断缩小的安全区域内对抗其他玩家，让自己生存到最后 [2]  。\r\n游戏《绝地求生》除获得G-STAR最高奖项总统奖以及其他五项大奖 [3]  ，还打破了7项吉尼斯纪录。\r\n2018年8月9日，《绝地求生》官方宣布，将开启“百日行动”，进行持续数月的自查运动，为玩家提供一个更好的游戏体验 [4]  ；11月，有超过200万个账户被冻结 [5]  。该游戏于2018年12月7日登陆PS4平台 [6]  。\r\n《绝地求生》将于2022年1月12日在主机和PC上变成免费游戏 [43] ', 0);
INSERT INTO `gf_game` VALUES (4, '穿越火线HD', '/files/4-穿越火线HD.jpeg', 'https://cf.qq.com/main.shtml', '《穿越火线HD》是一款的免费多人游戏，具有多种惊险的游戏模式、独特的角色和电影般的视觉效果，是由开发商Smliegte制作，腾讯发行的第一人称射击游戏。', 0);
INSERT INTO `gf_game` VALUES (5, '反恐精英：全球攻势', '/files/5-反恐精英：全球攻势.png', 'https://blog.counter-strike.net/', '《反恐精英：全球攻势》，原名《Counter-Strike: Global Offensive》，是一款由VALVE与Hidden Path Entertainment合作开发、Valve Software发行的第一人称射击游戏，于2012年8月21日在欧美地区正式发售，国服发布会于2017年4月11日在北京召开。游戏为《反恐精英》系列游戏的第四款作品（不包括Neo和Online等衍生作品）。\r\n\r\n游戏玩家分为反恐精英（CT阵营）与恐怖份子（T阵营）两个阵营，双方需在一个地图上进行多回合的战斗，达到地图要求目标或消灭全部敌方则取得胜利。', 0);
INSERT INTO `gf_game` VALUES (6, '欢乐斗地主', '/files/6-欢乐斗地主.png', 'https://hlddz.qq.com/web202112/', '《欢乐斗地主》是腾讯移动游戏平台的首款实时对战棋牌手游，是根据扑克牌游戏“跑得快”改编而成的三人游戏。通过扑克牌来决定游戏的胜负。该游戏于2008年4月发布。\r\n\r\n《斗地主》最初流行于湖北武汉汉阳区，两个农民联合对抗一名地主，由于其规则简单、娱乐性强，迅速风靡全国。《欢乐斗地主》是在传统规则的基础上，引入“欢乐豆”积分，并且增加抢地主、明牌、癞子等一系列新玩法，而推出的一款更紧张刺激、更富于变化的“斗地主”游戏。', 0);
INSERT INTO `gf_game` VALUES (7, '1', '/files/c908497c971c4246bc4b4105a2a52cf1', '23', '123', 0);
INSERT INTO `gf_game` VALUES (9, '王者荣耀', '/files/fdac8e720a2443989602d6166bc6b1f1', 'https://pvp.qq.com/', '王者荣耀', 0);
INSERT INTO `gf_game` VALUES (10, '122', '', '122', '22', 0);
INSERT INTO `gf_game` VALUES (11, '333', '', '333', '33', 0);
INSERT INTO `gf_game` VALUES (12, '英雄联盟1', '/files/1-英雄联盟.jpeg', 'https://lol.qq.com/main.shtml', '《英雄联盟》是由腾讯控股的首家美国公司Riot Games开发的3D竞技场战网游戏，其主创团队是由实力强劲的Dota-Allstars的核心人物，以及暴雪等著名游戏公司的美术、程序、策划人员组成，将DOTA的玩法从对战平台延伸到网络游戏世界。除了DotA的游戏节奏、即时战略、团队作战外，《英雄联盟》拥有特色的英雄、自动匹配的战网平台，包括天赋树、召唤师系统、符文等元素，让玩家感受全新的英雄对战。', 0);
INSERT INTO `gf_game` VALUES (13, 'DOTA2-1', '/files/2-DOTA2.png', 'https://www.dota2.com.cn/main.htm', '《刀塔2》也被称作《DOTA2》，由《DOTA》的地图核心制作者IceFrog（冰蛙）联手美国Valve公司研发的一款游戏，于2013年4月28日开始测试，发布中文名为“刀塔”，是该系列的第二部作品。\n\n《刀塔2》完整继承了原作《DotA》一百多位的英雄，并脱离了上一代作品《DOTA》所依赖的《魔兽争霸Ⅲ》引擎的多人即时对战游戏，《刀塔2》的世界由天辉和夜魇两个阵营所辖区域组成，有上、中、下三条主要的作战道路相连接，中间以河流为界。每个阵营分别由五位玩家所扮演的英雄担任守护者，他们将以守护己方远古遗迹并摧毁敌方远古遗迹为使命，通过提升等级、赚取金钱、购买装备和击杀敌方英雄等手段达成胜利。', 0);
INSERT INTO `gf_game` VALUES (14, '绝地求生-1', '/files/3-绝地求生.jpg', 'https://cn.pubg.com/', '《绝地求生》(PUBG) 是由韩国Krafton工作室开发的一款战术竞技型射击类沙盒游戏 [1]  [36-37]  。\r\n在该游戏中，玩家需要在游戏地图上收集各种资源，并在不断缩小的安全区域内对抗其他玩家，让自己生存到最后 [2]  。\r\n游戏《绝地求生》除获得G-STAR最高奖项总统奖以及其他五项大奖 [3]  ，还打破了7项吉尼斯纪录。\r\n2018年8月9日，《绝地求生》官方宣布，将开启“百日行动”，进行持续数月的自查运动，为玩家提供一个更好的游戏体验 [4]  ；11月，有超过200万个账户被冻结 [5]  。该游戏于2018年12月7日登陆PS4平台 [6]  。\r\n《绝地求生》将于2022年1月12日在主机和PC上变成免费游戏 [43] ', 0);
INSERT INTO `gf_game` VALUES (15, '穿越火线HD-1', '/files/4-穿越火线HD.jpeg', 'https://cf.qq.com/main.shtml', '《穿越火线HD》是一款的免费多人游戏，具有多种惊险的游戏模式、独特的角色和电影般的视觉效果，是由开发商Smliegte制作，腾讯发行的第一人称射击游戏。', 0);
INSERT INTO `gf_game` VALUES (16, '欢乐斗地主-1', '/files/6-欢乐斗地主.png', 'https://hlddz.qq.com/web202112/', '《欢乐斗地主》是腾讯移动游戏平台的首款实时对战棋牌手游，是根据扑克牌游戏“跑得快”改编而成的三人游戏。通过扑克牌来决定游戏的胜负。该游戏于2008年4月发布。\r\n\r\n《斗地主》最初流行于湖北武汉汉阳区，两个农民联合对抗一名地主，由于其规则简单、娱乐性强，迅速风靡全国。《欢乐斗地主》是在传统规则的基础上，引入“欢乐豆”积分，并且增加抢地主、明牌、癞子等一系列新玩法，而推出的一款更紧张刺激、更富于变化的“斗地主”游戏。', 0);
INSERT INTO `gf_game` VALUES (17, '反恐精英：全球攻势', '/files/5-反恐精英：全球攻势.png', 'https://blog.counter-strike.net/', '《反恐精英：全球攻势》，原名《Counter-Strike: Global Offensive》，是一款由VALVE与Hidden Path Entertainment合作开发、Valve Software发行的第一人称射击游戏，于2012年8月21日在欧美地区正式发售，国服发布会于2017年4月11日在北京召开。游戏为《反恐精英》系列游戏的第四款作品（不包括Neo和Online等衍生作品）。\r\n\r\n游戏玩家分为反恐精英（CT阵营）与恐怖份子（T阵营）两个阵营，双方需在一个地图上进行多回合的战斗，达到地图要求目标或消灭全部敌方则取得胜利。', 0);

-- ----------------------------
-- Table structure for gf_game__gf_game_type
-- ----------------------------
DROP TABLE IF EXISTS `gf_game__gf_game_type`;
CREATE TABLE `gf_game__gf_game_type`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `gid` int NOT NULL COMMENT '游戏id',
  `type_id` int NOT NULL COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `gid`(`gid`) USING BTREE,
  INDEX `type_id`(`type_id`) USING BTREE,
  CONSTRAINT `gf_game__gf_game_type_ibfk_1` FOREIGN KEY (`gid`) REFERENCES `gf_game` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gf_game__gf_game_type_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `gf_game_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '游戏表 \r\n《中间表》\r\n游戏类型表\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gf_game__gf_game_type
-- ----------------------------
INSERT INTO `gf_game__gf_game_type` VALUES (1, 6, 12);
INSERT INTO `gf_game__gf_game_type` VALUES (2, 1, 9);
INSERT INTO `gf_game__gf_game_type` VALUES (3, 2, 9);
INSERT INTO `gf_game__gf_game_type` VALUES (4, 7, 5);
INSERT INTO `gf_game__gf_game_type` VALUES (5, 7, 4);
INSERT INTO `gf_game__gf_game_type` VALUES (8, 9, 3);
INSERT INTO `gf_game__gf_game_type` VALUES (9, 9, 5);
INSERT INTO `gf_game__gf_game_type` VALUES (10, 9, 11);
INSERT INTO `gf_game__gf_game_type` VALUES (11, 9, 15);
INSERT INTO `gf_game__gf_game_type` VALUES (14, 17, 4);
INSERT INTO `gf_game__gf_game_type` VALUES (15, 14, 5);
INSERT INTO `gf_game__gf_game_type` VALUES (16, 17, 5);
INSERT INTO `gf_game__gf_game_type` VALUES (17, 17, 3);
INSERT INTO `gf_game__gf_game_type` VALUES (18, 13, 3);
INSERT INTO `gf_game__gf_game_type` VALUES (19, 13, 4);
INSERT INTO `gf_game__gf_game_type` VALUES (20, 13, 5);
INSERT INTO `gf_game__gf_game_type` VALUES (21, 13, 6);
INSERT INTO `gf_game__gf_game_type` VALUES (22, 13, 7);
INSERT INTO `gf_game__gf_game_type` VALUES (23, 13, 8);
INSERT INTO `gf_game__gf_game_type` VALUES (24, 13, 9);
INSERT INTO `gf_game__gf_game_type` VALUES (25, 13, 10);
INSERT INTO `gf_game__gf_game_type` VALUES (26, 13, 11);
INSERT INTO `gf_game__gf_game_type` VALUES (27, 13, 12);
INSERT INTO `gf_game__gf_game_type` VALUES (28, 13, 13);
INSERT INTO `gf_game__gf_game_type` VALUES (29, 13, 14);
INSERT INTO `gf_game__gf_game_type` VALUES (30, 14, 3);
INSERT INTO `gf_game__gf_game_type` VALUES (31, 14, 4);
INSERT INTO `gf_game__gf_game_type` VALUES (32, 14, 5);
INSERT INTO `gf_game__gf_game_type` VALUES (33, 14, 6);
INSERT INTO `gf_game__gf_game_type` VALUES (34, 14, 7);
INSERT INTO `gf_game__gf_game_type` VALUES (35, 14, 8);
INSERT INTO `gf_game__gf_game_type` VALUES (36, 14, 9);
INSERT INTO `gf_game__gf_game_type` VALUES (37, 14, 10);
INSERT INTO `gf_game__gf_game_type` VALUES (38, 14, 11);
INSERT INTO `gf_game__gf_game_type` VALUES (39, 14, 12);
INSERT INTO `gf_game__gf_game_type` VALUES (40, 14, 13);
INSERT INTO `gf_game__gf_game_type` VALUES (41, 14, 14);
INSERT INTO `gf_game__gf_game_type` VALUES (42, 15, 3);
INSERT INTO `gf_game__gf_game_type` VALUES (43, 15, 4);
INSERT INTO `gf_game__gf_game_type` VALUES (44, 15, 5);
INSERT INTO `gf_game__gf_game_type` VALUES (45, 15, 6);
INSERT INTO `gf_game__gf_game_type` VALUES (46, 15, 7);
INSERT INTO `gf_game__gf_game_type` VALUES (47, 15, 8);
INSERT INTO `gf_game__gf_game_type` VALUES (48, 15, 9);
INSERT INTO `gf_game__gf_game_type` VALUES (49, 15, 10);
INSERT INTO `gf_game__gf_game_type` VALUES (50, 15, 11);
INSERT INTO `gf_game__gf_game_type` VALUES (51, 15, 12);
INSERT INTO `gf_game__gf_game_type` VALUES (52, 15, 13);
INSERT INTO `gf_game__gf_game_type` VALUES (53, 15, 14);
INSERT INTO `gf_game__gf_game_type` VALUES (54, 16, 3);
INSERT INTO `gf_game__gf_game_type` VALUES (55, 16, 4);
INSERT INTO `gf_game__gf_game_type` VALUES (56, 16, 5);
INSERT INTO `gf_game__gf_game_type` VALUES (57, 16, 6);
INSERT INTO `gf_game__gf_game_type` VALUES (58, 16, 7);
INSERT INTO `gf_game__gf_game_type` VALUES (59, 16, 8);
INSERT INTO `gf_game__gf_game_type` VALUES (60, 16, 9);
INSERT INTO `gf_game__gf_game_type` VALUES (61, 16, 10);
INSERT INTO `gf_game__gf_game_type` VALUES (62, 16, 11);
INSERT INTO `gf_game__gf_game_type` VALUES (63, 16, 12);
INSERT INTO `gf_game__gf_game_type` VALUES (64, 16, 13);
INSERT INTO `gf_game__gf_game_type` VALUES (65, 16, 14);

-- ----------------------------
-- Table structure for gf_game_rank
-- ----------------------------
DROP TABLE IF EXISTS `gf_game_rank`;
CREATE TABLE `gf_game_rank`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `gid` int NOT NULL COMMENT '游戏id',
  `score` int NOT NULL DEFAULT 0 COMMENT '分数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid`(`uid`, `gid`) USING BTREE COMMENT '保证每人只能评价同一游戏一次',
  INDEX `gid`(`gid`) USING BTREE,
  CONSTRAINT `gf_game_rank_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `gf_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `gf_game_rank_ibfk_2` FOREIGN KEY (`gid`) REFERENCES `gf_game` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '游戏评价分数表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gf_game_rank
-- ----------------------------
INSERT INTO `gf_game_rank` VALUES (1, 'b3bd92d8c40f4e6f864192d4ea5e2c95', 1, 3);
INSERT INTO `gf_game_rank` VALUES (2, 'b3bd92d8c40f4e6f864192d4ea5e2c95', 2, 7);
INSERT INTO `gf_game_rank` VALUES (5, 'b3bd92d8c40f4e6f864192d4ea5e2c95', 4, 9);
INSERT INTO `gf_game_rank` VALUES (14, 'b3bd92d8c40f4e6f864192d4ea5e2c95', 6, 10);
INSERT INTO `gf_game_rank` VALUES (16, 'f5ffe55f0ddb479381d7a37344f88fbc', 1, 8);
INSERT INTO `gf_game_rank` VALUES (17, 'f5ffe55f0ddb479381d7a37344f88fbc', 3, 7);
INSERT INTO `gf_game_rank` VALUES (18, 'f5ffe55f0ddb479381d7a37344f88fbc', 2, 8);
INSERT INTO `gf_game_rank` VALUES (24, 'f5ffe55f0ddb479381d7a37344f88fbc', 6, 6);
INSERT INTO `gf_game_rank` VALUES (25, 'f5ffe55f0ddb479381d7a37344f88fbc', 7, 10);
INSERT INTO `gf_game_rank` VALUES (26, 'f5ffe55f0ddb479381d7a37344f88fbc', 4, 1);
INSERT INTO `gf_game_rank` VALUES (27, 'f5ffe55f0ddb479381d7a37344f88fbc', 9, 10);
INSERT INTO `gf_game_rank` VALUES (28, 'f5ffe55f0ddb479381d7a37344f88fbc', 13, 8);
INSERT INTO `gf_game_rank` VALUES (29, 'f5ffe55f0ddb479381d7a37344f88fbc', 14, 9);
INSERT INTO `gf_game_rank` VALUES (30, 'f5ffe55f0ddb479381d7a37344f88fbc', 15, 10);
INSERT INTO `gf_game_rank` VALUES (31, 'f5ffe55f0ddb479381d7a37344f88fbc', 16, 9);
INSERT INTO `gf_game_rank` VALUES (32, '88a7e7de0b274c2aa438640aea31652d', 1, 7);
INSERT INTO `gf_game_rank` VALUES (33, '87e10bfcc9714fb296a01b6f1c19463d', 1, 6);
INSERT INTO `gf_game_rank` VALUES (34, 'f5ffe55f0ddb479381d7a37344f88fbc', 5, 2);
INSERT INTO `gf_game_rank` VALUES (35, '3eb923c1a7894783bb31a4c97d708785', 1, 8);
INSERT INTO `gf_game_rank` VALUES (36, '75945c07515a428e851e9e44f924b351', 1, 5);

-- ----------------------------
-- Table structure for gf_game_type
-- ----------------------------
DROP TABLE IF EXISTS `gf_game_type`;
CREATE TABLE `gf_game_type`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '游戏类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gf_game_type
-- ----------------------------
INSERT INTO `gf_game_type` VALUES (1, '全部');
INSERT INTO `gf_game_type` VALUES (3, '体育竞技SPG游戏');
INSERT INTO `gf_game_type` VALUES (4, '模拟类游戏');
INSERT INTO `gf_game_type` VALUES (5, '即时战略游戏');
INSERT INTO `gf_game_type` VALUES (6, '赛车竞速RAC');
INSERT INTO `gf_game_type` VALUES (7, '冒险解谜AVG');
INSERT INTO `gf_game_type` VALUES (8, '休闲益智PUZ');
INSERT INTO `gf_game_type` VALUES (9, '经营游戏SIM');
INSERT INTO `gf_game_type` VALUES (10, '动作射击游戏STG');
INSERT INTO `gf_game_type` VALUES (11, '格斗游戏FTG');
INSERT INTO `gf_game_type` VALUES (12, '桌面棋牌TAB');
INSERT INTO `gf_game_type` VALUES (13, '飞行射击FLY');
INSERT INTO `gf_game_type` VALUES (14, '恋爱养成LVG');
INSERT INTO `gf_game_type` VALUES (15, '动作游戏');
INSERT INTO `gf_game_type` VALUES (16, 'ETC游戏');
INSERT INTO `gf_game_type` VALUES (23, '11');

-- ----------------------------
-- Table structure for gf_links
-- ----------------------------
DROP TABLE IF EXISTS `gf_links`;
CREATE TABLE `gf_links`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '友链封面图片',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '友链名称',
  `website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '友链网址',
  `createDate` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '友情链接表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gf_links
-- ----------------------------
INSERT INTO `gf_links` VALUES (1, '/files/1-vue.png', 'vue.js', 'https://v3.cn.vuejs.org/', '2022-01-24 17:08:28');
INSERT INTO `gf_links` VALUES (2, '/files/2-mybatis-plus.jpg', 'mybatis-plus', 'https://baomidou.com/', '2022-01-24 17:10:48');
INSERT INTO `gf_links` VALUES (3, '/files/3-VueRouter.png', 'Vue Router', 'https://router.vuejs.org/zh/', '2022-01-24 17:11:52');
INSERT INTO `gf_links` VALUES (4, '/files/4-wangEditor.png', 'wangEditor', 'https://www.wangeditor.com/', '2022-01-24 17:16:33');
INSERT INTO `gf_links` VALUES (5, '/files/5-Hutool.jpg', 'Hutool', 'https://hutool.cn/docs/#/', '2022-01-24 17:17:26');
INSERT INTO `gf_links` VALUES (6, '/files/6-渐变颜色.ico', '渐变颜色', 'http://color.oulu.me/', '2022-01-24 17:19:07');
INSERT INTO `gf_links` VALUES (7, '/files/7-iconfont.jpg', 'iconfont-阿里巴巴矢量图标库', 'https://www.iconfont.cn/', '2022-01-24 17:20:22');
INSERT INTO `gf_links` VALUES (8, '/files/8-gitee.jpg', 'gitee', 'https://gitee.com/', '2022-01-24 17:21:50');
INSERT INTO `gf_links` VALUES (12, '/files/44c1a9f091be4ffe853f3d0a7d4c7b1b', '1', '1', '2022-02-21 23:41:51');
INSERT INTO `gf_links` VALUES (13, '/files/e667870e91474281becb31ce639178ff', '2', '2', '2022-02-21 23:43:54');
INSERT INTO `gf_links` VALUES (14, '/files/a5b1dbe534ba4a0aa411263a4f82ad02', '3', '4', '2022-02-21 23:44:24');
INSERT INTO `gf_links` VALUES (18, '', '1', '1', '2022-03-31 15:59:31');

-- ----------------------------
-- Table structure for gf_message
-- ----------------------------
DROP TABLE IF EXISTS `gf_message`;
CREATE TABLE `gf_message`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '留言表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gf_message
-- ----------------------------
INSERT INTO `gf_message` VALUES (5, '5', '5', '5');
INSERT INTO `gf_message` VALUES (6, '12', '12', '12');
INSERT INTO `gf_message` VALUES (7, '123', '123', '123');
INSERT INTO `gf_message` VALUES (8, '123', '123', '123');
INSERT INTO `gf_message` VALUES (9, '123', '123', '123');
INSERT INTO `gf_message` VALUES (10, '12333', '12333', '123');
INSERT INTO `gf_message` VALUES (11, '43', '43', '43');
INSERT INTO `gf_message` VALUES (12, '1', '1', '1');
INSERT INTO `gf_message` VALUES (13, '12', '2', '2');
INSERT INTO `gf_message` VALUES (14, '10', '11', '111');
INSERT INTO `gf_message` VALUES (15, '·1', '·', '11');
INSERT INTO `gf_message` VALUES (16, '5', '5', '5');
INSERT INTO `gf_message` VALUES (17, '12', '23', '12');
INSERT INTO `gf_message` VALUES (18, '12', '12', '23');
INSERT INTO `gf_message` VALUES (19, '12', '12', '3');
INSERT INTO `gf_message` VALUES (20, '1', '1', '1');
INSERT INTO `gf_message` VALUES (21, '1', '1', '1');
INSERT INTO `gf_message` VALUES (22, '12', '12', '12');
INSERT INTO `gf_message` VALUES (23, '小明明明米米', '1234567809', '小明明明米米\n检验');
INSERT INTO `gf_message` VALUES (24, '11', '11', '11');
INSERT INTO `gf_message` VALUES (25, '222', '222', '222');
INSERT INTO `gf_message` VALUES (26, 'kkkk', 'kkk', 'kkk');
INSERT INTO `gf_message` VALUES (27, '11', '22', '343');
INSERT INTO `gf_message` VALUES (28, '测试', '测试', '测试');
INSERT INTO `gf_message` VALUES (29, '郑火火', '13413413457', '【测试】留言 某某帖子数量太少');
INSERT INTO `gf_message` VALUES (30, '郑', '134515', '留言测试');

-- ----------------------------
-- Table structure for gf_news
-- ----------------------------
DROP TABLE IF EXISTS `gf_news`;
CREATE TABLE `gf_news`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '通知标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '通知内容',
  `createtime` datetime NOT NULL COMMENT '发布时间',
  `gmt_updatetime` datetime NOT NULL COMMENT '最后一次修改时间',
  `author_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '作者id',
  `author_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '作者名字',
  `author_avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '作者头像',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `author_id`(`author_id`) USING BTREE,
  CONSTRAINT `gf_news_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `gf_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通告板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gf_news
-- ----------------------------
INSERT INTO `gf_news` VALUES (2, '苞米豆生态圈', 'MybatisX (opens new window)- 一款全免费且强大的 IDEA 插件，支持跳转，自动补全生成 SQL，代码生成。\r\nMybatis-Mate (opens new window)- 为 MyBatis-Plus 企业级模块，支持分库分表、数据审计、字段加密、数据绑定、数据权限、表结构自动生成 SQL 维护等高级特性。\r\nDynamic-Datasource (opens new window)- 基于 SpringBoot 的多数据源组件，功能强悍，支持 Seata 分布式事务。\r\nShuan (opens new window)- 基于 Pac4J-JWT 的 WEB 安全组件, 快速集成。\r\nKisso (opens new window)- 基于 Cookie 的单点登录组件。\r\nLock4j (opens new window)- 基于 SpringBoot 同时支持 RedisTemplate、Redission、Zookeeper 的分布式锁组件。\r\nKaptcha (opens new window)- 基于 SpringBoot 和 Google Kaptcha 的简单验证码组件，简单验证码就选它。\r\nAizuda 爱组搭 (opens new window)- 低代码开发平台组件库。', '2022-02-10 15:55:15', '2022-02-10 15:55:53', 'b3bd92d8c40f4e6f864192d4ea5e2c95', 'fan111', '/files/avator.jpg');
INSERT INTO `gf_news` VALUES (12, '测试', '<p>测试</p><p>公告<br/></p>', '2022-03-17 22:10:23', '2022-03-17 22:10:23', 'f5ffe55f0ddb479381d7a37344f88fbc', 'admin', '/files/74134e4b1e574546ac58bff3db3be42d');
INSERT INTO `gf_news` VALUES (13, '测试12', '<p>测试</p><p>公告</p><p>12<br/></p>', '2022-03-17 22:11:55', '2022-03-17 22:11:55', 'f5ffe55f0ddb479381d7a37344f88fbc', 'admin', '/files/74134e4b1e574546ac58bff3db3be42d');
INSERT INTO `gf_news` VALUES (14, '青春无惧，自信登场!第八届王者荣耀高校联赛下半程赛事今日开赛!', '<p><strong>3月18日</strong>，是素有“小奥运会”之称 的“世界大学生运动会”，即成都第31届世界大学生夏季运动会(以下简称“大运会”)倒计时100天的日子。<strong>由腾讯承办的“世界大学生运动会-数智竞技邀请赛”(以下简称“邀请赛”)正式启动。</strong>在仪式现场，官方不仅发布了《成都大运会数智竞技》主题视频，还邀请到国内外顶尖高校共同参与人工智能竞技，为全球大学生提供了一个AI科技和电子竞技的交流舞台。在后续的”大运会“的赛场上，王者AI将首次进入到传统体育赛事中，两者发生碰撞的同时，也发挥着科技力量，未来以期能在更多行业发挥作用，为大学生们提供交流电竞文化、实现电竞梦想的大舞台。</p><p>不仅仅是邀请赛和大运会，同为国内高校学子的体育盛会——王者荣耀高校联赛也将为大学生们提供追逐梦的机会。<strong>3月19日，第八届王者荣耀高校联赛下半程赛事也正式拉开赛事帷幕!</strong></p><p>与希望“成就每一个梦想”的“大运会”一样，高校联赛作为王者荣耀大众赛事体系重要组成部分，也致力于打造专属于高校学子展现自我高光时刻，追求电竞梦想的舞台。同时，也希望各位高校学子能在比赛中培养团队协作的意识，展示年轻电竞人的不惧困难、有自信、有担当、敢于拼搏的电竞精神。高校联赛在“大运会”倒计时100天的次日开赛，也意在为“大运会”应援，并为不同赛场上的参赛选手送上鼓励与支持：<strong>“虽然赛场不同，但体育精神一脉相通。祝愿参赛的学子们，在各自的赛场上，青春无惧，自信登场!”</strong></p><p><strong><br/></strong></p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/df026172f89e79583c7720442d776837/0/?width=1261&amp;height=707\" title=\"\" style=\"\"/></p><p><br/></p><p><strong>【共建模式正式官宣 学以致用秀出高光】</strong></p><p>在开赛当日，官方在线上宣布了本次高校联赛的新内容：<strong>共建模式正式启动!</strong></p><p><strong>共建模式，是全国首个高校、师生、官方三方合力打造的比赛舞台</strong>，旨在让更多的高校学子能够站上高校电竞舞台。高校联赛基于往届赛事的共创活动积淀，所全新提出并倡导的校园电竞赛事共建新模式，官方学校和师生将组成组委会，共同规划设计开场表演、解说、舞台设计、赛事主持等内容模块，让所有对电竞报以热忱的学子们，都有机会发挥专业所学，展示个性魅力，沉浸式参与到赛事的任何模块之中。并且，参与共建活动的同学们，将获得纳入赛事培养人才库的机会;并有机会获得学校学分、学校课题、学校认证证书、企业实习证明等认证奖励。</p><p>目前，南京传媒学院、四川音乐学院、上海音乐学院、天津美术学院、武汉理工大学、西安美术学院、星海音乐学院、厦门大学、中国传媒大学、郑州大学(以上排名不分先后)等众多高校已加入共建模式，希望广大学子，可以抓住机会，学以致用，在高校联赛的舞台上拥有自己的高光时刻!</p><p><strong>【海选阶段正式启动 青春无惧等你登场】</strong></p><p><strong>本届赛事将仍然采用淘汰制，分为海选赛、分站赛、大区赛和总决赛四个阶段。</strong>去年的海选赛点冠军也将和上半年的海选冠军一同晋级到分站赛，区域总决选冠亚军战队将直通全国总决赛，而总决选的落选战队也将在5月的大区赛与从分站赛晋级上来的战队再次一争高下。海选赛将从开赛日当天持续至四月底，该阶段采取BO1单败淘汰制，从四强起采用BO3单败淘汰制，决出赛点冠军可晋级分站赛。自五月一日到五月五日，将进行分站赛。该赛段将采用BO3单循环积分制，最终胜场积分排名前2位的战队将代表所在省份出征大区赛。五月十四日到五月十五日，进行大区赛。大区赛将以省份为单位，分为小组赛和淘汰赛。最终决出的冠亚军将晋级2022年高校联赛的全国总决赛阶段。</p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/d9cc601a870a7243f894a67c59ee5d41/0/?width=1268&amp;height=679\" alt=\"\" title=\"\" style=\"\"/></p><p>王者荣耀高校联赛作为王者荣耀全国大赛重要组成的一部分，<strong>在本届王者荣耀高校联赛中获得冠军的队伍，可以直接参加第五届王者荣耀全国大赛资格赛</strong>，与全国大赛各赛道优胜者队伍争夺全国大赛决赛阶段名额。实力更甚者，还有机会获得与职业战队同场竞技的机会。</p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/4b7d280ae3148bdf4fdebaa2c53d985b/0/?width=1065&amp;height=633\" alt=\"\" title=\"\" style=\"\"/></p><p>第八届王者荣耀高校联赛下半程赛事将在游戏内、官网页面、微信公众号、王者人生app内开辟报名通道，报名海选赛完赛后必得高校联赛专属击杀播报(体验卡)及王者生涯称号-新秀选手奖励!不仅如此，只要参与高校联赛，从海选赛起，获得相应名次的同学都能收获限定游戏道具和现金奖励!快来报名参加本次全新高校联赛吧，青春无惧，自信登场!</p><p><strong>报名链接：</strong><a href=\"https://igame.qq.com/newcss/admin/pvp-horizontal/#/index/topic-match/1632129852\">&gt;&gt;点击报名&lt;&lt;</a></p><p><strong>特别说明：</strong></p><p>本届高校联赛海选赛的线下办赛安排，将根据当地防疫政策进行实时调整。关注微博、微信公众号《王者荣耀全国大赛》官方账号，或者王者人生APP等，开赛前会进行公告与通知。感谢大家理解与支持!</p><p><strong>合作品牌</strong></p><p>iQOO是秉承“生而为赢”的竞技精神，不断在电竞领域进行探索的新锐科技品牌，致力于成为全球电竞行业的领军代表之一，用技术推动中国移动电竞产业更好地发展。iQOO与KPL合作多年，针对“快，稳，准”的电竞赛事标准进行手机产品研发，多款产品通过职业选手与赛事的严格测试，成为KPL官方赛事用机。</p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/310dcf0cc8483ba1c80e9a384b298475/0/?width=524&amp;height=188\" alt=\"\"/></p>', '2022-03-31 12:59:19', '2022-03-31 12:59:19', 'f5ffe55f0ddb479381d7a37344f88fbc', 'admin', '/files/74134e4b1e574546ac58bff3db3be42d');
INSERT INTO `gf_news` VALUES (15, '王者荣耀校园行走进中山大学，名师分享共讨教学经济时代的体育营销', '<p><img src=\"https://shp.qpic.cn/cfwebcap/0/4d11735db108dcc044140a59e773a1d4/0/?width=1080&amp;height=1155\" alt=\"\" title=\"\" style=\"\"/><img src=\"https://shp.qpic.cn/cfwebcap/0/86b337fe7405e3648837c6cb6f2c5cc8/0/?width=1080&amp;height=1175\" alt=\"\"/><img src=\"https://shp.qpic.cn/cfwebcap/0/fb2b83c4e1e8428cb5b987dbeb2afa90/0/?width=1080&amp;height=1077\" alt=\"\" title=\"\" style=\"\"/><img src=\"https://shp.qpic.cn/cfwebcap/0/e872202e2de652daeb07a11529c6b0f1/0/?width=1080&amp;height=3497\" alt=\"\" title=\"\" style=\"\"/><br/></p>', '2022-03-31 13:05:25', '2022-03-31 13:05:25', 'f5ffe55f0ddb479381d7a37344f88fbc', 'admin', '/files/74134e4b1e574546ac58bff3db3be42d');
INSERT INTO `gf_news` VALUES (16, '第一届王者荣耀高校区域总决赛打响 谁能夺得总冠军', '<p>12月11日至12月13日，第一届王者荣耀高校区域总决赛圆满落幕，恭喜湖南赛区获得冠军；四川赛区获得亚军；辽宁赛区获得季军，在这短短三天时间里，来自全国九大赛区的十八支精英队在王者峡谷里贡献了一场场精彩绝伦的比赛，象牙塔中的热血少年在王者峡谷中大显身手，为荣誉而战。</p><p>&nbsp;<img src=\"https://shp.qpic.cn/cfwebcap/0/c558380ea857fe2e67a9fb4bf0162581/0/?width=554&amp;height=312\" alt=\"\" title=\"\" style=\"\"/></p><p><strong>第一届王者荣耀高校区域总决选荣耀时刻</strong></p><p>&nbsp;</p><p>在高校学子们激烈比拼中，四川赛区【四川大学锦城学院】vs辽宁赛区【沈阳大学】和四川赛区【成都大学】vs湖南赛区【湖南大众传媒学院】的比拼都非常精彩，下面一起来看看那些精彩瞬间吧!</p><p><strong>四川赛区【四川大学锦城学院】vs辽宁赛区【沈阳大学】</strong></p><p>【四川大学锦城学院】这边阵容更加偏向前中期，前期橘右京、猪八戒和张良会对【沈阳大学】野区造成一定威胁，而【沈阳大学】的马超前期相对比较弱势，嫦娥的选择十分关键，【沈阳大学】的嫦娥对阵到【四川大学锦城学院】的张良也能保有不错的对线实力，对野区的防守也能更加方便。</p><p>&nbsp;<img src=\"https://shp.qpic.cn/cfwebcap/0/7e14f1c51af3f6cc4dc3f958cda4f0ab/0/?width=554&amp;height=311\" alt=\"\"/></p><p><strong>双方阵容预览</strong></p><p>&nbsp;</p><p>开局【四川大学】方的下路优先支援己方中路夺取线权，兵线清空后向下路游走发现【四川大学锦城学院】正在反蓝buff的八戒，帮嫦娥抢回蓝buff，随后将八戒击杀。</p><p>&nbsp;<img src=\"https://shp.qpic.cn/cfwebcap/0/f0e296ff01c8da36d40882fb12f13de3/0/?width=554&amp;height=312\" alt=\"\"/></p><p><strong>【四川大学锦城学院】八戒即将交出一血</strong></p><p>&nbsp;</p><p>在【沈阳大学】击杀八戒的同时，【四川大学锦城学院】将【沈阳大学】的红buff区啃得干干净净，但是一血的人头对于【四川大学锦城学院】的八戒个人来讲非常伤。对团队来说，一个人头换来己方3buff开局，同时扰乱【沈阳大学】下路发育节奏，总体来说是不亏的。比赛进行到2分钟时，【沈阳大学】中路河道草丛廉颇、嫦娥、马超和孙膑蹲到【四川大学锦城学院】的橘右京，从上路河道迟迟赶来的马可波罗收下了橘右京的人头，但是马超还未成型，被【四川大学锦城学院】的八戒拉回击杀，【沈阳大学】的孙膑也仅剩丝血，被【四川大学锦城学院】的瑶妹带走。这波团战因为【四川大学锦城学院】橘右京没有很好的视野被对方蹲守，所幸己方的八戒和瑶妹及时反杀强行1换2，保证了己方的优势。</p><p>&nbsp;<img src=\"https://shp.qpic.cn/cfwebcap/0/6696cce4a1ea065d9af3c79981e59cd2/0/?width=554&amp;height=312\" alt=\"\"/></p><p><strong>【四川大学锦城学院】瑶和八戒强行输出一换二</strong></p><p>&nbsp;</p><p>比赛进行到7分钟，【四川大学锦城学院】击杀先知，带着兵线下路推塔，橘右京一人上路偷塔，【四川大学锦城学院】四人在下路掩护，成功吸引了【沈阳大学】全员的注意力，橘右京在【沈阳大学】的马可波罗赶来前成功推掉了【沈阳大学】的上路二塔，然后【沈阳大学】的孙膑、马超到达上路拦截【四川大学锦城学院】的橘右京，【沈阳大学】的马可波罗转回下路和嫦娥、廉颇一起想要拦截【四川大学锦城学院】的攻势，但是没有成功，【沈阳大学】的下路二塔也被击破，红蓝buff也被【四川大学锦城学院】收走。</p><p>&nbsp;<img src=\"https://shp.qpic.cn/cfwebcap/0/4382c9a3d34adb0d790bebd7287c64c6/0/?width=554&amp;height=312\" alt=\"\"/></p><p><strong>【沈阳大学】上下两路外塔全部被推</strong></p><p>&nbsp;</p><p>比赛进行到10分钟，【四川大学锦城学院】趁【沈阳大学】回城休养拿下了黑暗暴君，中路带线想要一波，被【沈阳大学】马可波罗塔下远程清掉，【四川大学锦城学院】转手去拿先知主宰，带着龙兵的【四川大学锦城学院】在清理完3路兵线后中路集合，八戒用大招框柱中路二塔将【沈阳大学】的廉颇和队友分开，集火廉颇打至残血后廉颇闪现逃生。【四川大学锦城学院】中路兵线被清无奈转移到下路，但在下路也没有打出伤害，兵线被清理。中路第二波龙兵到来，【沈阳大学】廉颇跳大，马可波罗追击想要打出伤害，却被【四川大学锦城学院】的公孙离击杀，【沈阳大学】的马超在和【四川大学锦城学院】的八戒对刚时被橘右京所击杀，【沈阳大学】的孙膑也被【四川大学锦城学院】的八戒击杀。【沈阳大学】的廉颇击杀了【四川大学锦城学院】的张良，但是自己丝血难以逃生，被【四川大学锦城学院】的公孙离击杀。【沈阳大学】仅剩嫦娥一人血量比较健康，带走了【四川大学锦城学院】残血的猪八戒。</p><p>&nbsp;<img src=\"https://shp.qpic.cn/cfwebcap/0/634c2f37a7a42e26446f7604e697eab8/0/?width=554&amp;height=301\" alt=\"\"/></p><p><strong>【四川大学锦城学院】八戒击杀【沈阳大学】孙膑</strong></p><p>&nbsp;</p><p>比赛进行到15分钟，【四川大学锦城学院】拿下双龙buff，想要再次推高地，中路带兵线想推高地没有成功，带着龙兵游走下路。【沈阳大学】的廉颇塔下被【四川大学锦城学院】的张良击杀，【沈阳大学】的马可波罗同时将【四川大学锦城学院】的八戒击杀，双方前排都倒下，没有前排的双方下路高地塔开战，塔下【四川大学锦城学院】公孙离优先击杀【沈阳大学】马超，【沈阳大学】的马可波罗击杀了【四川大学锦城学院】的瑶，【沈阳大学】的嫦娥击杀了【四川大学锦城学院】的张良，【沈阳大学】的孙膑击杀了【四川大学锦城学院】的公孙离，【沈阳大学】的马可波罗二连击破，击杀了【四川大学锦城学院】的橘右京，【四川大学锦城学院】团灭，对于【沈阳大学】来说是守卫成功。</p><p>&nbsp;<img src=\"https://shp.qpic.cn/cfwebcap/0/cd3695a2e62b6dab201f68eaef95f8ed/0/?width=554&amp;height=312\" alt=\"\"/></p><p><strong>【四川大学锦城学院】没有前排，被打至团灭</strong></p><p>&nbsp;</p><p>【沈阳大学】嫦娥，马可波罗，孙膑三人直推中路一塔，【四川大学锦城学院】八戒及时复活清理掉【沈阳大学】兵线，【沈阳大学】三人选择进入【四川大学锦城学院】红buff野区发育一波等待队友复活。双方复活后【沈阳大学】由于三路兵线被推，集中在中路高地塔防守，黑暗暴君再次被【四川大学锦城学院】拿下，拿到黑暗暴君的【四川大学锦城学院】再次冲击【沈阳大学】高地，此时比赛进行到19分钟，团战此时有人员阵亡将直接影响争夺风暴龙王，因此【四川大学锦城学院】没有选择进行冲击，而是交换完一波技能后选择后撤保存实力，争夺风暴龙王。双方在【沈阳大学】的红buff野区开启团战，【沈阳大学】的马超率先击杀【四川大学锦城学院】的公孙离和张良，【沈阳大学】马可波罗秒掉了【四川大学锦城学院】的瑶，【四川大学锦城学院】的橘右京在乱战中击杀了【沈阳大学】的孙膑，而后被马超反杀，【四川大学锦城学院】仅剩猪八戒一人，被【沈阳大学】的嫦娥和廉颇多次拉扯，由嫦娥收下人头，【沈阳大学】趁着【四川大学锦城学院】团灭，没有选择击杀风暴龙王，直接带着兵线中路推塔，【四川大学锦城学院】中路2塔高地塔被破，推到水晶处，龙兵及时刷新拖延了【沈阳大学】击破水晶的节奏，给【四川大学锦城学院】的公孙离和瑶的反攻争取了时间，公孙离首先击杀丝血的马超和廉颇，二技能拦截马可波罗的伤害，水晶仅剩丝血，公孙离在最后关头将【沈阳大学】的马可波罗击杀，水晶保住，【沈阳大学】仅剩孙膑一人。</p><p>&nbsp;<img src=\"https://shp.qpic.cn/cfwebcap/0/9e1d25028580d5eb86ffb51117219534/0/?width=554&amp;height=312\" alt=\"\"/></p><p><strong>【四川大学锦城学院】公孙离极限翻盘0换3</strong></p><p>&nbsp;</p><p>【四川大学锦城学院】全员复活跟着中路推至高地处，带下路龙兵推掉下路高地塔直点水晶，【沈阳大学】孙膑一人难以支撑，被【四川大学锦城学院】橘右京塔下强杀，水晶被破，【四川大学锦城学院】获得胜利。</p><p>&nbsp;<img src=\"https://shp.qpic.cn/cfwebcap/0/ce3c969a80d0f4182affd60b908c1c01/0/?width=554&amp;height=301\" alt=\"\"/></p><p><strong>【四川大学锦城学院】团队赢得胜利</strong></p><p>&nbsp;</p><p><strong>四川赛区【成都大学】vs湖南赛区【湖南大众传媒学院】</strong></p><p>湖南大众传媒学院选择了前期强势阵容，成都大学选择了后期强势阵容，谁能在自己的强势期夺得更多优势发挥出更出色的实力将成为比赛的关键。</p><p>&nbsp;<img src=\"https://shp.qpic.cn/cfwebcap/0/14194c24e0c45782897dd198d017c6cd/0/?width=554&amp;height=312\" alt=\"\"/></p><p><strong>双方阵容一览</strong></p><p>&nbsp;</p><p>开局【成都大学】的周瑜、大乔抢先进入中路，周瑜铺火抢到了更多的线权优势，【湖南大众传媒学院】的裴擒虎随后赶到，带领周瑜和大乔赶到【成都大学】的红buff区，【湖南大众传媒学院】的裴擒虎拿下红buff后被【成都大学】的吕布追杀，裴擒虎在被追杀的过程中见【成都大学】的马可波罗站位靠前，一口咬死拿下一血，随后被【成都大学】法刺不知火舞击杀。</p><p>&nbsp;<img src=\"https://shp.qpic.cn/cfwebcap/0/fe8e99b639f7c530868511395820b79a/0/?width=554&amp;height=312\" alt=\"\"/></p><p><strong>裴擒虎走位失误交出红buff</strong></p><p>&nbsp;</p><p>比赛进行到3分钟，【成都大学】的橘右京直接切入到【湖南大众传媒学院】白起和蒙恬脸上，没能一套带走被白起反杀。【湖南大众传媒学院】张飞丝血开大逃生，【成都大学】的不知火舞塔下想要逃生，却被【湖南大众传媒学院】的白起给烫死，【湖南大众传媒学院】的裴擒虎击杀【成都大学】的吕布，【湖南大众传媒学院】一换二，除白起外其余人集合中路推塔，然后顺河道游走下路，下路一塔也被拆。</p><p>&nbsp;<img src=\"https://shp.qpic.cn/cfwebcap/0/3a7f571ac46cdb40a63a35853dff7161/0/?width=554&amp;height=310\" alt=\"\"/></p><p><strong>【成都大学】下路一塔被破</strong></p><p>&nbsp;</p><p>双方上路摩擦，【成都大学】的张飞开干扰选择保护己方防御塔，【湖南大众传媒学院】兵线被清，但兵线即将到达不愿撤退，想要带着兵线反推中【成都大学】的吕布跳大进场，吕布击杀了【湖南大众传媒学院】的蒙恬，【成都大学】的马可波罗击杀了【湖南大众传媒学院】的周瑜，【湖南大众传媒学院】的裴擒虎顶着张飞和马可波罗的压力反杀【成都大学】的马可波罗，【湖南大众传媒学院】的大乔电梯及时赶到，将裴擒虎保下。</p><p>比赛进行到13分钟，【湖南大众传媒学院】持有双龙buff，选择三路带线想要趁强势期一波推塔直点水晶，【成都大学】此时三路外塔全破，选择高地抱团防守。【湖南大众传媒学院】周瑜点火烧上路高地塔，蒙恬开大直点中路高地塔，【成都大学】频繁奔波于两塔之间，上路高地塔仅剩丝血，中路高地塔也仅剩残血，但是因为输出不够，兵线被清，【湖南大众传媒学院】未能推上高地，buff结束【湖南大众传媒学院】后撤，打算再拿一条黑暗暴君，然后回野区发育一波，准备再次三路带线。这一波【成都大学】的上路高地塔被破，中路高地塔仅剩五分之一血量，红buff野区也被清光。</p><p>&nbsp;<img src=\"https://shp.qpic.cn/cfwebcap/0/5c6cdaba2638916fa41a57cff9f857ad/0/?width=554&amp;height=312\" alt=\"\"/></p><p><strong>【湖南大众传媒学院】裴擒虎周瑜磨掉【成都大学】上路高地塔</strong></p><p>&nbsp;</p><p>【湖南大众传媒学院】的大乔趁【成都大学】防守成功去拿先知主宰，趁机中路偷塔，【成都大学】的中路高地塔被破。【湖南大众传媒学院】仗着自己有大乔，蒙恬和裴擒虎上路佯装偷家，迫使【成都大学】游离黑暗暴君，同时【湖南大众传媒学院】的大乔传送，进场的裴擒虎优先击杀威胁最大的【成都大学】的马可波罗，【成都大学】的吕布开大想要反杀【成都大学】的白起，但对方有复活甲，【成都大学】吕布守尸，复活后再次击杀，【湖南大众传媒学院】的裴擒虎咬死【成都大学】的不知火舞，【成都大学】的张飞击杀【湖南大众传媒学院】的蒙恬，【成都大学】的橘右京击杀【湖南大众传媒学院】的大乔，【湖南大众传媒学院】周瑜击杀【成都大学】的吕布，【成都大学】的橘右京随后反杀周瑜，【成都大学】仅剩橘右京，【湖南大众传媒学院】仅剩裴擒虎，二人短暂交锋后裴擒虎击杀橘右京，上路此时还有兵线，裴擒虎带着上路超级兵推掉水晶，拿下胜利。</p><p>&nbsp;<img src=\"https://shp.qpic.cn/cfwebcap/0/afebf6e6d705a744ef196dae37475ac8/0/?width=554&amp;height=312\" alt=\"\"/></p><p><strong>【成都大学】全员团灭，【湖南大众传媒学院】的裴擒虎即将夺得胜利</strong></p><p>&nbsp;</p><p>让我们再次恭喜获得冠军的湖南赛区，12月23日-27日，第二届王者荣耀全国大赛将在广东佛山举行，哪支队伍可以摘得桂冠呢？还请准时收看直播，为你喜欢的队伍加油哦。</p><p>在王者荣耀的赛场上，选手们听从指挥目标一致剑指冠军，在这充满霓虹灯光的绚丽舞台上，期待见到你的身影。</p>', '2022-03-31 13:07:19', '2022-03-31 13:07:19', 'f5ffe55f0ddb479381d7a37344f88fbc', 'admin', '/files/74134e4b1e574546ac58bff3db3be42d');
INSERT INTO `gf_news` VALUES (17, '【高校区域总决赛】赛后回顾', '<p><strong>【首届区域总决选圆满落幕】</strong></p><p>2020年的冬天，似乎来的格外的早，但在祖国南部的美丽海岛上，一簇由高校电竞爱好者们共同点燃的电竞热情之火温暖了整个冬日。12月11日，来自全国9大赛区的18支精英战队将在海南省省会海口进行为期三日的最强赛区争夺战！12月13日，首届王者荣耀高校联赛：区域总决选圆满落幕。来自湖南赛区的湖南大众传媒学院战队与湖南民政学院战队，历经3天的不懈努力，在最终决战中力克四川赛区，拔得头筹，这也是王者荣耀高校联赛举办七届以来，首次有赛区、战队获此殊荣！<br/><img src=\"https://shp.qpic.cn/cfwebcap/0/500e06579f66506696e0045f87c2eb85/0?width=554&amp;height=370\" alt=\"\"/></p><p><strong>冠军终归这里！</strong><strong>第一届王者荣耀高校区域总决选</strong><strong>荣耀时刻</strong></p><p>12月13日，王者荣耀高校区域总决赛进入最激烈的比赛环节。湖南赛区的湖南大众传媒学院战队和四川赛区的锦城学院战队率先展开了第一轮的比拼，打响了王者荣耀高校区域总决赛的第一枪。<br/><img src=\"https://shp.qpic.cn/cfwebcap/0/8aca82b6b5b83c5aa6a9108b57690294/0?width=553&amp;height=311\" alt=\"\"/><br/>第一局前期双方节奏激烈，双方频繁集结中路支援，4分钟双方集结中路小团战，湖南赛区率先拿下一血随后频繁互换人头。湖南赛区在中期节奏渐入佳境，人头在落后四川赛区的同时，经济超过四川赛区5k经济。中期湖南赛区在节奏领先下轻松拿下暴君和主宰。18分钟湖南赛区高歌猛进，携巨大的经济游戏和主宰BUFF轻松在四川赛区高地团灭四川赛区，拿下比赛胜利。<br/><br/><img src=\"https://shp.qpic.cn/cfwebcap/0/cbf476542141e081409f837dd7c64eed/0?width=554&amp;height=312\" alt=\"\"/></p><p>第二局四川赛局更换战队为成都大学战队，而湖南赛区继续让湖南大众传媒学院战队继续战斗。双方开局节奏非常稳。<br/><img src=\"https://shp.qpic.cn/cfwebcap/0/b399e8dbd1589c40bc9be20b77cd6d83/0?width=553&amp;height=309\" alt=\"\"/></p><p>4分钟四川赛区集结下路，用精彩的游走和配合带走湖南赛区两人，在下路取得优势后进入了四川赛区的运营节奏，不断扩大经济优势和推塔以及暴君数量优势。10分钟双方再次在中路展开团战，湖南赛区配合不到位导致被四川赛区3换5被团灭。<br/><img src=\"https://shp.qpic.cn/cfwebcap/0/4c6beb4664fc686f283d6d01c29fb23e/0?width=554&amp;height=312\" alt=\"\"/></p><p>而湖南赛区不屈不挠，在14分钟蓄势待发先斩下四川赛区吕布后再0换2，完成了经济和人头的反超。18分钟湖南赛区托大一波孙尚香脸探草丛被四川赛区抓住机会，险些被四川赛区一波。21分钟一直保持优势姿态的湖南赛区反复拉扯后拿下风暴龙王，四川赛区高地纷纷告破。<br/><img src=\"https://shp.qpic.cn/cfwebcap/0/4f75ce1c6aaa828f2e60f88e1b249e2b/0?width=534&amp;height=300\" alt=\"\"/></p><p>27分钟，湖南赛区在丢掉风暴龙王后，孙尚香挺身而出，一个人打四川赛区三人后再度上演和关羽2打4，凯瑞全场让湖南赛区拿下第二场比赛的胜利。<br/><br/><img src=\"https://shp.qpic.cn/cfwebcap/0/bfcb524f5a72e9778e5d8fd3e6f0093d/0?width=554&amp;height=309\" alt=\"\"/></p><p>第三局湖南赛区依旧是湖南大众传媒学院战队出战，四川赛区换成了第一局的锦城学院战队。双方开局频频爆发小规模团战，四川赛区稍占优势。中期四川赛区运营独到，经济碾压湖南赛区。<br/><img src=\"https://shp.qpic.cn/cfwebcap/0/67642e71f3abc6b25a3ea3e4e46b469c/0?width=554&amp;height=305\" alt=\"\"/></p><p>13分钟四川赛区拆掉湖南赛区，频繁交火后拔掉湖南赛区高地，扳回一分。<br/><br/><img src=\"https://shp.qpic.cn/cfwebcap/0/b38884e898d798be320ac76d2319d31e/0?width=553&amp;height=314\" alt=\"\"/></p><p>第四局湖南赛区依旧是湖南大众传媒学院战队出战，四川赛区换成了第一局的锦城学院战队。前期湖南赛区前期节奏碾压，四川赛区节节败退。湖南赛区优势一直持续到了14分钟，湖南赛区暴君团力压四川赛区，直接一波带走。<br/><br/><img src=\"https://shp.qpic.cn/cfwebcap/0/74cf000d354393b8852cd36121c7eb0f/0?width=554&amp;height=310\" alt=\"\"/></p><p>第五局湖南赛区民政学院出战，四川赛区成都大学出战。前期四川赛区推进迅猛。步步紧逼湖南赛区。而湖南赛区防守完美，在15分钟反超经济，双方进入均势。关键局18分钟四川赛区在湖南赛区高地1换5，拿下第四局。<br/><br/><img src=\"https://shp.qpic.cn/cfwebcap/0/cd23aba40ba7bf5935341e1c2dd693e3/0?width=553&amp;height=309\" alt=\"\"/></p><p>第六局湖南大众传媒学院出战，四川赛区成都大学出战，前期湖南赛区小优，21分钟主宰大战湖南赛区一波极限拉扯下血战至4换5，裴擒虎一波带走四川赛区，恭喜湖南赛区获得冠军。</p>', '2022-03-31 13:15:45', '2022-03-31 13:15:45', 'f5ffe55f0ddb479381d7a37344f88fbc', 'admin', '/files/74134e4b1e574546ac58bff3db3be42d');
INSERT INTO `gf_news` VALUES (18, '王者高校区域总决赛最全观赛指南', '<p><img src=\"https://shp.qpic.cn/cfwebcap/0/52a223649ac5cb5c09669fd625567ef0/0?width=1024&amp;height=1513\" alt=\"\" title=\"\" style=\"\"/></p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/a6f82a729acabd100529ac95bd178710/0?width=1024&amp;height=918\" alt=\"\" title=\"\" style=\"\"/></p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/dc137610e69cfd7aac05f7bb09e7b011/0?width=1024&amp;height=2187\" alt=\"\"/></p><p>&nbsp;</p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/af932be8dd8197c72dbdbea04251442f/0?width=1024&amp;height=3623\" alt=\"\"/></p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/f2ee419f9b3ce823c74a65ae008d484c/0?width=1024&amp;height=1403\" alt=\"\"/></p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/98f019fbf8d5e8ab92a3979cd1e070a7/0?width=1024&amp;height=1299\" alt=\"\"/></p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/892064c4a933b27862e1ef5982f9b763/0?width=1024&amp;height=1312\" alt=\"\"/></p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/c8f1a8b765c8bbb3d804b8cf845881ba/0?width=1024&amp;height=2064\" alt=\"\"/></p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/98c593b83cbba446965171694075c2e0/0?width=1024&amp;height=1221\" alt=\"\"/></p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/9402ca78eb78794c2917ba41ce645849/0?width=1024&amp;height=1347\" alt=\"\"/></p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/e431ed8c6c07583b140c77dae81350d7/0?width=1024&amp;height=1365\" alt=\"\"/></p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/1bc87764599f83d31975036c02ceb7dc/0?width=1024&amp;height=1548\" alt=\"\"/></p><p>&nbsp;</p><p><strong>今日赛程</strong></p><p>&nbsp;</p><p><strong><img src=\"https://shp.qpic.cn/cfwebcap/0/2cb3331c1f396915f8ca52647eaa9067/0?width=1920&amp;height=1080\" alt=\"\"/></strong></p><p>&nbsp;</p><p>自2008年国家体育总局将电子竞技改批为第78号正式体育竞赛项目以来，电竞行业的高速发展有目共睹。作为移动端电竞最为重要的产业支撑项目，国民级手游——王者荣耀，近些年同样为电竞产业的蓬勃发展起到了至关重要的作用。而创新赛事——“王者荣耀高校联赛”的推行更是为电竞产业不断注入新的能量！</p><p>&nbsp;</p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/8a79c198a4067fde8c9901b86ad9380b/0?width=1269&amp;height=846\" alt=\"\"/></p><p>&nbsp;</p><p>【2020上半年高校联赛回顾】</p><p>回顾2020上半年，八支高校强队齐聚古都金陵，历经三天激烈的角逐，最终武汉光谷职业学院的GZ战队成功折桂，成为了王者荣耀高校联赛的新科状元。虽未在之后的总决赛中，问鼎全国，但却也足够以王者之姿傲视群雄，为各路豪强选手以及热情的观众留下了不可磨灭的印象。</p><p>&nbsp;</p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/d15787d0dd00c8f04bd74a23f97c3f0d/0?width=550&amp;height=350\" alt=\"\"/></p><p>&nbsp;</p><p>【首届王者荣耀高校联赛区域总决选】<br/>着眼于在12月11日-13日打响的王者荣耀高校赛，又一次让这一“老牌赛事”换发新生。和往届不同的是，本次高校联赛，是高校联赛，首次引入了“区域总决选”这个概念。往届王者荣耀高校联赛，各路王牌高校都是各自为战。而本次联赛，来自9个赛区的18支高校队伍将在各区域教练的带领下，剑指最强赛区，通过灵活的排兵布阵和自身绝对强大的实力，共同为自己所在的赛区斩获荣耀。也正如联赛的新slogan所述——王者荣耀十八般兵器，角逐校园高地。本届联赛打通了向上晋级的通路，也为促进各个赛区高校之间的电竞交流，起到了绝佳的促进作用。</p><p>&nbsp;</p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/93c108cf8dd09f571455f71313709e63/0?width=1268&amp;height=714\" alt=\"\"/></p><p>&nbsp;</p><p>【创新的赛事玩法】</p><p>本次赛事采用了小组积分赛、BO7团队赛和特殊的KOF赛制。KOF赛制指的就是在比赛过程中，两队轮番上阵较量，输者离场后，换另外一队上场，直至两支队伍全部被击败为止，从而分出胜负。在这样刺激的赛制下，我们很可能见到逆风翻盘一串二的好戏。以往在格斗中才能见到的比赛形式，今天你可以在王者荣耀高校区域总决选的舞台亲眼见证。</p><p>&nbsp;</p><p>【地方政府赋能赛事】</p><p>本届王者荣耀高校联赛区域总决选的举办地在美丽的海南省省会——海口。这也让本该寒冷的冬日，变得格外的“火热”。总决选的赛场选取在拥有3万学子，也是海南省最具电竞氛围的院校——海口经济学院。来自海南省旅游和文化广电体育厅的领导 将为比赛致辞，并为最终获得冠军的赛区进行颁奖。地方政府的赋能，不仅说明了电竞行业正在不断的趋于规范化和产业化，也从侧面说明了，电竞行业正在被越来越多的人认同。</p><p>&nbsp;</p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/a69a541ea0d277a25189a3094e0355b5/0?width=768&amp;height=428\" alt=\"\"/></p><p>&nbsp;</p><p>【特殊期间的安全保障】</p><p>2020年是格外特殊的一年，虽在“疫情”已经较为稳定的今天，但赛事承办方依然保持对防疫安全的高度重视以及警惕。为了确保赛事期间的防疫安全，每日开赛前及赛后，承办方都将为场馆进行全方位无死角的消杀。每日开赛前，全部入场人员均须进行体温检测，且必须严格佩戴口罩，选手们每日可领取由承办方发放的专用口罩。高度的重视，最大限度的保障了赛事期间所有人员的健康安全，也体现了其专业、负责的承办态度！</p><p>&nbsp;</p><p>【环保的舞美搭建理念】</p><p>一场异彩纷呈的赛事，怎么能离得开优秀的舞美搭建？，本次王者荣耀高校联赛区域总决选的舞美汲取了赛博朋克风格的霓虹灯带并改进了更阳光的配色，采用了超大异形LED屏幕的整体设计，减少了一次性大型舞美材料制作，不仅在设计理念上，更为年轻态，也倡导了阳光、环保的理念。</p><p>&nbsp;</p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/bb6b77229776e7605f57b64ba94d9d12/0?width=1269&amp;height=847\" alt=\"\"/></p><p>&nbsp;</p><p>电竞行业的蓬勃发展，与每一位电竞人、每一场电竞赛事背后的努力密不可分。而无论是赛制上的创新玩法、赛事概念的不断迭代，还是办赛理念的不断优化，每一届王者荣耀高校联赛都在为促进电竞产业的发展创新，为让更多群体了解电竞、参与电竞、体验电子竞技行业的独特魅力不懈的努力着，也让广大的电竞爱好者们对这一赛事增加了更多的期待！</p>', '2022-03-31 13:24:03', '2022-03-31 13:24:03', 'f5ffe55f0ddb479381d7a37344f88fbc', 'admin', '/files/74134e4b1e574546ac58bff3db3be42d');
INSERT INTO `gf_news` VALUES (19, '目标-最强赛区！王者荣耀高校区域总决选正式开幕！', '<div data-v-1d16f0b4=\"\"><p>&nbsp;</p><p>12月11日-13日，由海南省旅游和文化广电体育厅指导、海南省电子竞技运动协会支持、海南省亚太电子竞技有限公司作为执行单位的第一届王者荣耀高校联赛-区域总决选即将在海南海口举办。自10月2日开启面向全国的线上海选以来，经历了长达2个月的线上下选拔，来自全国9个赛区高校的18支顶尖战队齐聚海口经济学院，争夺“最强赛区”的荣耀。</p><p>&nbsp;<img src=\"https://shp.qpic.cn/cfwebcap/0/2162f8c895d33d034836a15e3f565216/0/?width=1920&amp;height=1080\" alt=\"\" title=\"\" style=\"\"/></p><p>（本次赛事的主视觉海报）</p><p>直播地址：</p><p><a href=\"https://www.huya.com/kclzone\">虎牙直播</a></p><p><a href=\"https://www.douyu.com/5011734\">斗鱼直播</a></p><p><a href=\"https://egame.qq.com/363971861\">企鹅电竞</a></p><p><a href=\"https://live.bilibili.com/21420576\">B站直播</a></p><p><a href=\"https://live.kuaishou.com/u/Jesinzhang\">快手直播</a></p><p><a href=\"https://v.qq.com/live/p/topic/103584/preview.html\">腾讯视频</a></p><p><a href=\"https://sports.qq.com/kbsweb/game.htm?mid=100002:20211505\">腾讯体育</a></p><p><a href=\"http://view.inews.qq.com/a/GAM2020121001203800\">腾讯新闻</a></p><p>&nbsp;</p><p>与以往王者荣耀高校赛制不同，今年的赛制不再是各个学校的队伍各自为战，而来自同一赛区的战队将不分彼此，共同为本赛区争夺荣耀。本次赛事采用了小组积分赛、BO7团队赛和特殊的KOF赛制。KOF赛制指的就是在比赛过程中，两队轮番上阵较量，输者离场后，换另外一队上场，直至两支队伍全部被击败为止，从而分出胜负。在这样刺激的赛制下，我们很可能见到逆风翻盘一串二的好戏。以往在格斗中才能见到的比赛形式，今天你可以在王者荣耀高校区域总决选的舞台亲眼见证。</p><p>&nbsp;</p><p>本次区域总决选共有来自9个赛区的18支顶尖校园队伍参赛。他们被分到了A、B、C三个组别代表学校、赛区出战。</p><p>&nbsp;<img src=\"https://shp.qpic.cn/cfwebcap/0/04d7b5dc72bd255c0037d407bca251a8/0/?width=1212&amp;height=1622\" alt=\"\" title=\"\" style=\"\"/></p><p>（本次赛事分组情况）</p><p>&nbsp;</p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/47cdf7888767841fb23d03e3e25361b6/0/?width=1920&amp;height=3000\" alt=\"\" title=\"\" style=\"\"/></p><p>（本次赛事赛程图）</p><p>&nbsp;</p><p>在赛场上，选手们听从指挥，目标一致、相互援助；在赛场下，高校学子们还发挥专业特长，运用自身所学，创造出海量精彩有趣的创意实践，为母校助威。这也让王者荣耀赛事IP文化在年轻一代学子的新颖表达下，形成更有生命力的文化符号，同时也让电竞文化增添了东方美学的历史内涵。</p><p>&nbsp;<img src=\"https://shp.qpic.cn/cfwebcap/0/da5f884b3caffb907454f5b520918b40/0/?width=1620&amp;height=1080\" alt=\"\" title=\"\" style=\"\"/></p><p>（学生纸雕创意）</p><p>&nbsp;</p><p>本届区域总决选还以王者荣耀中最为用户熟悉的十八位英雄的兵器为背景进行创作，每一种兵器代表一支参加比赛的高校队伍。拥有着鲜明的中国文化烙印，高校联赛通过高校学子的专业共创和赛事主办的创意策划，把中华文化中精彩的内容以与时俱进的方式呈现给世界，吸引更多的外部用户关注。在这里，高校联赛可以成为电竞与高校学子之间的重要纽带，更可以成为传统文化与当代年轻人之间的桥梁。</p><p>&nbsp;<img src=\"https://shp.qpic.cn/cfwebcap/0/247acf57a797d00781935a8f44406879/0/?width=1252&amp;height=750\" alt=\"\" title=\"\" style=\"\"/></p><p>（十八般武器冰雕图）</p><p>&nbsp;</p><p>比赛之外，本次的舞台设计也实现了创新，尽力为每一位观众提供最为极致的观赛体验。本次整体舞美采用了赛博朋克风格的霓虹灯带并改进了更阳光的配色，采用了超大异形LED屏幕的整体设计，同时，通过行业领先的LED控制技术，区别于以往大部分的电竞赛事，让屏幕可以真正地“动起来”。在这样的舞台上，还将举办人气COSER大赛，百位COSER将在舞台上表演节目，展现自己的才艺，结合赛事特点展现COSPLAY的魅力，为线上线下的电竞爱好者和COSPLAY爱好者带来沉浸式的活动体验。12月11日-13日，王者荣耀高校区域总决选期待你的关注与观看！</p><p>&nbsp;<img src=\"https://shp.qpic.cn/cfwebcap/0/7adf7e4f674a4284a87be44f1a4faa25/0/?width=1600&amp;height=750\" alt=\"\"/></p><p>（主舞美效果图图）</p><p>&nbsp;</p><p>在本届区域总决选后，还将有分站赛、大区赛，以及最终将于2021年6月举办的全国总决赛。相信每一位选手都会全力以赴去追寻那份梦想中的荣耀，也让我们为各个赛区参赛学校的少年们加油！</p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/0a0ce5de08fdf618acdcfa8ac553060e/0?width=912&amp;height=580\" alt=\"\"/></p><p>即日起至12月27日，各位召唤师们还可以参与王者荣耀高校区域总决赛限时活动，通过任务或与好友互赠分享集换象征着总决赛各路赛区的王者十八般英雄武器卡，前三百位幸运召唤师即可兑换百元红包；此外，参加总决赛冠军预测还有机会瓜分四万奖池！快来为你心仪的高校赛区加油助威~</p><p><a href=\"https://pvp.qq.com/act/4363/a20201113wzry/index.html\">点击参与</a><br/></p></div>', '2022-03-31 13:25:08', '2022-03-31 13:30:25', 'f5ffe55f0ddb479381d7a37344f88fbc', 'admin', '/files/74134e4b1e574546ac58bff3db3be42d');
INSERT INTO `gf_news` VALUES (20, '24日战报：四场零封彰显风范，虎牙XYG、成都TG等4支战队强势挺进8强', '<div data-v-1d16f0b4=\"\"><p>&nbsp;</p><p>12月11日-13日，由海南省旅游和文化广电体育厅指导、海南省电子竞技运动协会支持、海南省亚太电子竞技有限公司作为执行单位的第一届王者荣耀高校联赛-区域总决选即将在海南海口举办。自10月2日开启面向全国的线上海选以来，经历了长达2个月的线上下选拔，来自全国9个赛区高校的18支顶尖战队齐聚海口经济学院，争夺“最强赛区”的荣耀。</p><p>&nbsp;<img src=\"https://shp.qpic.cn/cfwebcap/0/2162f8c895d33d034836a15e3f565216/0/?width=1920&amp;height=1080\" alt=\"\" title=\"\" style=\"\"/></p><p>（本次赛事的主视觉海报）</p><p>直播地址：</p><p><a href=\"https://www.huya.com/kclzone\">虎牙直播</a></p><p><a href=\"https://www.douyu.com/5011734\">斗鱼直播</a></p><p><a href=\"https://egame.qq.com/363971861\">企鹅电竞</a></p><p><a href=\"https://live.bilibili.com/21420576\">B站直播</a></p><p><a href=\"https://live.kuaishou.com/u/Jesinzhang\">快手直播</a></p><p><a href=\"https://v.qq.com/live/p/topic/103584/preview.html\">腾讯视频</a></p><p><a href=\"https://sports.qq.com/kbsweb/game.htm?mid=100002:20211505\">腾讯体育</a></p><p><a href=\"http://view.inews.qq.com/a/GAM2020121001203800\">腾讯新闻</a></p><p>&nbsp;</p><p>与以往王者荣耀高校赛制不同，今年的赛制不再是各个学校的队伍各自为战，而来自同一赛区的战队将不分彼此，共同为本赛区争夺荣耀。本次赛事采用了小组积分赛、BO7团队赛和特殊的KOF赛制。KOF赛制指的就是在比赛过程中，两队轮番上阵较量，输者离场后，换另外一队上场，直至两支队伍全部被击败为止，从而分出胜负。在这样刺激的赛制下，我们很可能见到逆风翻盘一串二的好戏。以往在格斗中才能见到的比赛形式，今天你可以在王者荣耀高校区域总决选的舞台亲眼见证。</p><p>&nbsp;</p><p>本次区域总决选共有来自9个赛区的18支顶尖校园队伍参赛。他们被分到了A、B、C三个组别代表学校、赛区出战。</p><p>&nbsp;<img src=\"https://shp.qpic.cn/cfwebcap/0/04d7b5dc72bd255c0037d407bca251a8/0/?width=1212&amp;height=1622\" alt=\"\"/></p><p>（本次赛事分组情况）</p><p>&nbsp;</p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/47cdf7888767841fb23d03e3e25361b6/0/?width=1920&amp;height=3000\" alt=\"\"/></p><p>（本次赛事赛程图）</p><p>&nbsp;</p><p>在赛场上，选手们听从指挥，目标一致、相互援助；在赛场下，高校学子们还发挥专业特长，运用自身所学，创造出海量精彩有趣的创意实践，为母校助威。这也让王者荣耀赛事IP文化在年轻一代学子的新颖表达下，形成更有生命力的文化符号，同时也让电竞文化增添了东方美学的历史内涵。</p><p>&nbsp;<img src=\"https://shp.qpic.cn/cfwebcap/0/da5f884b3caffb907454f5b520918b40/0/?width=1620&amp;height=1080\" alt=\"\"/></p><p>（学生纸雕创意）</p><p>&nbsp;</p><p>本届区域总决选还以王者荣耀中最为用户熟悉的十八位英雄的兵器为背景进行创作，每一种兵器代表一支参加比赛的高校队伍。拥有着鲜明的中国文化烙印，高校联赛通过高校学子的专业共创和赛事主办的创意策划，把中华文化中精彩的内容以与时俱进的方式呈现给世界，吸引更多的外部用户关注。在这里，高校联赛可以成为电竞与高校学子之间的重要纽带，更可以成为传统文化与当代年轻人之间的桥梁。</p><p>&nbsp;<img src=\"https://shp.qpic.cn/cfwebcap/0/247acf57a797d00781935a8f44406879/0/?width=1252&amp;height=750\" alt=\"\"/></p><p>（十八般武器冰雕图）</p><p>&nbsp;</p><p>比赛之外，本次的舞台设计也实现了创新，尽力为每一位观众提供最为极致的观赛体验。本次整体舞美采用了赛博朋克风格的霓虹灯带并改进了更阳光的配色，采用了超大异形LED屏幕的整体设计，同时，通过行业领先的LED控制技术，区别于以往大部分的电竞赛事，让屏幕可以真正地“动起来”。在这样的舞台上，还将举办人气COSER大赛，百位COSER将在舞台上表演节目，展现自己的才艺，结合赛事特点展现COSPLAY的魅力，为线上线下的电竞爱好者和COSPLAY爱好者带来沉浸式的活动体验。12月11日-13日，王者荣耀高校区域总决选期待你的关注与观看！</p><p>&nbsp;<img src=\"https://shp.qpic.cn/cfwebcap/0/7adf7e4f674a4284a87be44f1a4faa25/0/?width=1600&amp;height=750\" alt=\"\"/></p><p>（主舞美效果图图）</p><p>&nbsp;</p><p>在本届区域总决选后，还将有分站赛、大区赛，以及最终将于2021年6月举办的全国总决赛。相信每一位选手都会全力以赴去追寻那份梦想中的荣耀，也让我们为各个赛区参赛学校的少年们加油！</p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/0a0ce5de08fdf618acdcfa8ac553060e/0?width=912&amp;height=580\" alt=\"\"/></p><p>即日起至12月27日，各位召唤师们还可以参与王者荣耀高校区域总决赛限时活动，通过任务或与好友互赠分享集换象征着总决赛各路赛区的王者十八般英雄武器卡，前三百位幸运召唤师即可兑换百元红包；此外，参加总决赛冠军预测还有机会瓜分四万奖池！快来为你心仪的高校赛区加油助威~</p><p><a href=\"https://pvp.qq.com/act/4363/a20201113wzry/index.html\">点击参与</a><br/></p></div>', '2022-03-31 13:26:15', '2022-03-31 13:26:15', 'f5ffe55f0ddb479381d7a37344f88fbc', 'admin', '/files/74134e4b1e574546ac58bff3db3be42d');
INSERT INTO `gf_news` VALUES (21, 'WB冲击S组失败原因在哪？孙膑杨玉环或是版本陷阱', '<p>随着昨天北京WB1:4战败于广州TTG，这个赛季冲击S组的希望彻底破灭了，这个赛季开始前，北京WB招兵买马，1200万买了冠军边路梓墨，射手换了乔兮，辅助也换了DYG的冠军辅助星宇，加上上个赛季就转会过来的花卷，阵容堪称豪华，又重金换了花楼教练组，目标肯定是要重回S组，剑指巅峰。可惜倒在了卡位赛止步于此，赛前，暖阳发微博，想呼吸下S组的空气，看来这S组的空气充满了血腥味，那么WB失利的原因有哪些呢？</p><p><img src=\"https://img.tgl.qq.com/cover/20220331/cb2954a6b2665856e9a83655039cc906_1648691476.jpg\"/></p><p>第一，英雄池单一，暖阳镜澜双绝，一手FMVP的镜带飞全场有目共睹，澜，娜可露露等野核有打的有板有眼，但是像橘右京，兰陵王等节奏野还不能做到游刃有余，比起S组的花海，今屿还是差了些火候，另外就是马超阿古朵体系也不是他们所擅长的，尤其是昨天的第三场对阵TTG的马超阿古朵，在暖阳镜澜用过了以后，再BAN掉他的娜可露露和露娜，暖阳差点当场退役，退而求其次的拿了个云樱，也打的平平无奇，和他第二局的镜形成鲜明对比。，所以WB想要再往上走，暖阳的其他打野还需要再精雕细琢。</p><p><img src=\"https://img.tgl.qq.com/cover/20220331/373bb5119eb961033d3b94e34ffd4d17_1648691514.png\"/></p><p>第二，孙膑杨玉环体系是否是版本陷阱？昨天的比赛中，两队都拿到了这个体系，但是都输掉了，同时这也是杨玉环的8连跪了，杨玉环在22年春季赛登场了12场，胜率仅为25%，反观曾经的18连败的王女士，这个赛季胜率高达60%，这胜率甚至高过了西施，沈梦溪和嬴政，这确实让我没有想到。希望这场比赛后，WB能回去好好复盘，找到问题点，如果实在解决不了，以后就不用了吧。</p><p><img src=\"https://img.tgl.qq.com/cover/20220331/37e3aa81f10f8836b364043e1052b525_1648691555.png\"/></p><p>花卷的表现昨天非常糟糕，几乎成为了TTG的突破口，不排除TTG有在针对花卷的打法，几次冲塔强开，但是他自己本身的站位靠前，成了冰尘盾山MVP的垫脚石，想起西安WE和武汉Estar的对阵中，WE就一直针对易峥这个点，2:0拿下赛点，下场后，SK就告诉易峥小心点，打乱了WE的赛前布局，让二追三拿下比赛，也希望WB的教练组能看到场上队友看不到的地方，及时作出战术调整，帮助队伍从困境中走出来。</p><p><img src=\"https://img.tgl.qq.com/cover/20220331/d71e548ea1293524ce274d9345eccf0c_1648691577.jpg\"/></p><p>希望他们能及时做好心态上的调整，努力备战即将到来的第三轮赛程，同时也不会失去向上走的目标和勇气。荣耀未至，追梦不休！</p><p><img src=\"https://img.tgl.qq.com/cover/20220331/9e67c9a77bfa3e7986b9a964854784f7_1648691599.jpg\"/></p><p>这是小编对于这场比赛的看法，喜欢小编的可以加个关注，有不同意见的小伙伴欢迎留言讨论哦~</p><p><br/></p>', '2022-03-31 13:29:45', '2022-03-31 13:29:45', 'f5ffe55f0ddb479381d7a37344f88fbc', 'admin', '/files/74134e4b1e574546ac58bff3db3be42d');
INSERT INTO `gf_news` VALUES (22, '3月31日孙悟空零号·雷霆星传说返场专属荣耀播报道具获取异常说明', '<div data-v-1d16f0b4=\"\"><div data-v-1d16f0b4=\"\"><div data-v-1d16f0b4=\"\"><p>亲爱的召唤师：</p><p>&nbsp;</p><p>&nbsp; &nbsp; &nbsp; 部分召唤师反馈在购买孙悟空-零号·雷霆星传说皮肤后未获得专属荣耀播报的异常的问题，目前我们正在紧急处理中，针对购买皮肤后未获得专属荣耀播报的玩家我们会在5个工作日内进行补发。同时我们将在官网为您及时更新处理进度。</p><p>&nbsp;</p><p>&nbsp; &nbsp; &nbsp; 我们对给各位召唤师造成的影响感到非常抱歉，感谢您对《王者荣耀》的支持与理解。</p></div></div></div>', '2022-03-31 13:32:38', '2022-03-31 13:33:46', 'f5ffe55f0ddb479381d7a37344f88fbc', 'admin', '/files/74134e4b1e574546ac58bff3db3be42d');
INSERT INTO `gf_news` VALUES (23, '3月31日全服不停机更新公告', '<p>亲爱的召唤师：</p><p>&nbsp; &nbsp; &nbsp; 我们计划在<strong>2022</strong><strong>年3月31日8:30-9:30</strong>对全服进行不停机更新。</p><p><strong>【更新时间】3月31日8:30-9:30</strong></p><p><strong>【更新方式】不停机更新</strong></p><p>由于此次为不停机更新，维护完毕后即可正常进入<strong>【维护期间会有短暂入口维护的情况】</strong>；</p><p>维护时已经登入游戏的召唤师不受任何影响。</p><p><strong>【更新范围】全服</strong></p><p><strong>本次更新大小安卓约11MB，iOS约12MB，</strong><strong>建议您在wifi环境下进行更新操作</strong>！</p><p><strong>【更新内容】</strong></p><h1>活动相关</h1><p><strong>消耗钻石有好礼！零号·赤焰限时返场！</strong></p><h1>钻石消耗-抽精品皮肤</h1><p><img src=\"https://shp.qpic.cn/cfwebcap/0/ba8426194176ef3c70e1c63793e02bf8/0?width=554&amp;height=319\" alt=\"\"/></p><p>活动期间消耗钻石免费兑换荣耀礼包！</p><p>活动时间：3月31日更新后-4月6日23:59</p><p>礼包兑换详情：</p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/d23201a08a6fbb02dfd1053b66ab218f/0?width=629&amp;height=299\" alt=\"\"/></p><p>荣耀礼包：王：打开后必得铭文碎片*20，有一定几率额外获得精品皮肤随机宝箱*1（打开后随机以下皮肤之一：刘禅-天才门将、甄姬-花好人间、后羿-阿尔法小队、阿轲-爱心护理、达摩-大发明家，若已拥有宝箱中所有皮肤将自动转化为皮肤碎片）</p><p>（获得精品皮肤随机宝箱的概率为0.05%，限量40万）</p><p>荣耀礼包：者：打开后可获得以下物品：皮肤碎片*1、浓情玫瑰*1</p><p>荣耀礼包：荣：打开后可获得以下物品：皮肤碎片*1、铭文碎片*60</p><p>荣耀礼包：耀：打开后必得铭文碎片*60，累计开10次必得山河星梦回城特效自选宝箱*1</p><p>山河星梦回城特效自选宝箱：打开后可任意选择以下奖励之一：山河星梦回城特效、铭文碎片*200</p><h1>赛季回馈-冲刺有好礼</h1><p>S26赛季即将结束，赛季更新前到达指定段位可领取铭文碎片和亲密度道具等好礼！</p><p>活动时间：3月31日更新后-赛季更新前</p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/0d2a8c1898da3b5fae6d6a0aea2f326c/0?width=426&amp;height=97\" alt=\"\"/></p><h1>陌上踏青-对战金币翻倍</h1><p>春暖花开的季节来了，活动期间参与指定模式对局获得金币翻倍！</p><p>活动时间：4月3日00:00-4月5日23:59</p><p>指定模式：排位、5V5匹配</p><h1>草长莺飞-登录有好礼</h1><p>万物复苏，草长莺飞，活动期间登录有好礼！</p><p>活动时间：4月3日00:00-4月5日23:59</p><p>活动期间登录1次即可领取春江跃鲤*1+铭文碎片*20</p><h1>孙悟空-零号·赤焰返场</h1><p><img src=\"https://shp.qpic.cn/cfwebcap/0/83f62c2e8cdf08b4b149472668025023/0?width=554&amp;height=313\" alt=\"\"/></p><p>返场时间：4月1日0:00-4月7日23:59</p><p>返场价格：1788点券</p><p>返场期间购买皮肤还可在活动面板领取皮肤专属个性动作！</p><h1>孙悟空-零号·雷霆返场</h1><p><img src=\"https://shp.qpic.cn/cfwebcap/0/8843f30b5f551f9c590e32bd41de676c/0?width=554&amp;height=319\" alt=\"\"/></p><p>返场时间：3月31日更新后-4月7日23:59</p><p>返场价格：300紫星币</p><p>孙悟空零号·雷霆星传说于3月31日更新后加入魔法球奖池替换瑶-时之愿境</p><h1>大圣表情礼包返场</h1><p>返场时间：4月1日0:00-4月7日23:59</p><p>打开后必得以下静态表情奖励：一起来吧*1</p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/64129e3a46ef9f463ce474279f234d59/0?width=116&amp;height=116\" alt=\"\"/></p><p>价格：98点券</p><p>限购1个，已拥有该表情的玩家无法再次购买。</p><h1>局内特效礼包上架</h1><p>上架时间：4月1日0:00-4月7日23:59</p><h2>斗战胜佛礼包</h2><p>购买红蓝对决(1日)，可额外随机获得以下之一：孙悟空专属击败和回城特效-大圣之怒、孙悟空、地狱火、荣耀积分*20、皮肤碎片*2、新品皮肤抽奖券*1。累计150次必得全部局内特效。</p><p>价格：20点券、</p><p>限购150个</p><p>概率公示：</p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/a2d50708f85754416eba21bb393a5920/0?width=395&amp;height=195\" alt=\"\"/></p><h2>百步穿杨礼包</h2><p>购买红蓝对决(1日)，可额外随机获得以下之一：伽罗专属击败和回城特效-百步穿杨、伽罗、花见巫女、箭羽风息、皮肤碎片*2、荣耀积分*20、新品皮肤抽奖券*1。累计150次必得全部局内特效。</p><p>价格：20点券、</p><p>限购150个</p><p>概率公示：</p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/673aa3a385f8a5f259face79f1c943af/0?width=429&amp;height=197\" alt=\"\"/></p><h1>魔法球折扣</h1><p>活动时间：3月31日更新后-4月5日23:59</p><p>折扣价：</p><p>单抽：45荣耀积分（优惠前60荣耀积分）</p><p>五连抽：200荣耀积分（优惠前270荣耀积分）</p><h1>积分夺宝折扣</h1><p>活动时间：4月2日0:00-4月5日23:59</p><p>折扣价：</p><p>单抽：45荣耀积分（优惠前60荣耀积分）</p><p>五连抽：200荣耀积分（优惠前270荣耀积分）</p><h1>累计充值活动</h1><p>活动时间：3月31日更新后-4月1日23:59</p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/8165b4db097e29358ef42778429608e0/0?width=539&amp;height=376\" alt=\"\"/></p><p>皮肤碎片&amp;积分自选礼盒：打开礼包可任意选择以下奖励之一：荣耀积分*10或皮肤碎片*1</p><p>头像框自选礼包：打开后可任意选择以下奖励之一：万象回春头像框、福寿康宁头像框、真香头像框、紫韵幽梦头像框、红粉佳人头像框、钻石*50</p><p>赛季冲刺自选超值礼包：打开后可任意选择以下奖励之一：小case击败、荣耀战令经验*4000、战令币*60。</p><h1>每日充值活动</h1><p>活动时间：4月2日0:00-4月5日23:59</p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/5c237d22965b7a35798cfcea294c073c/0?width=539&amp;height=326\" alt=\"\"/></p><p>皮肤碎片&amp;积分自选礼盒：打开礼包可任意选择以下奖励之一：荣耀积分*10或皮肤碎片*1</p><p>春日超值礼包：打开礼包可任意选择以下奖励之一：铭文碎片*600、战令币*40、战令经验*2000</p><p>春日豪华礼包：打开礼包可任意选择以下奖励之一：铭文碎片*600、战令币*80、战令经验*4000、紫星币*5</p><p>头像框自选礼包：打开后可任意选择以下奖励之一：阖家欢乐头像框、万象回春头像框、福寿康宁头像框、钻石*50</p><p>击败特效礼包：打开后必得400铭文碎片，可额外随机获得以下击败特效：虎啸风生击败特效、KO击败特效其中之一。重复获得的击败特效会转换为90钻石。</p><p>（获得两种击败特效的概率各为50%）</p><h1>每月1元好运礼盒</h1><p>上架时间：4月1日0:00-4月30日</p><p>打开后必得皮肤碎片*2、铭文碎片*100和以下随机奖励之一：皮肤或皮肤体验卡(7日)1张(鲁班七号-电玩小子、白起-星夜王子、大乔-猫狗日记、兰陵王-暗隐猎兽者)</p><p>价格：10点券</p><p>概率公示：</p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/4b60d7f3a3a7302d92ce51fe29307157/0?width=482&amp;height=171\" alt=\"\"/></p><h1>钻石语音上架</h1><p>上架时间：4月1日0:00-4月7日23:59</p><p>朋友们，冲鸭</p><p>限时语音：朋友们，冲鸭(2022.04.30过期后无法使用)</p><p>朋友齐心，排位上星</p><p>限时语音：朋友齐心，排位上星(2022.04.30过期后无法使用)</p><p>价格：180钻石/个</p><p>不可赠送，不可索要</p><h1>头像框礼包上架</h1><p>上架时间：4月2日0:00-4月5日23:59</p><p>打开后可随机获得以下奖励之一：圣斗士星矢头像框、浓情端午头像框、2016情人节纪念头像框、奥运头像框、双倍金币卡：1日、双倍经验卡：1日、铭文碎片*158/128/88/58。</p><p>价格：600金币</p><p>概率公示：</p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/b3e8b89e4f4bf9203d83263f0df518af/0?width=479&amp;height=262\" alt=\"\"/></p><h1>夺宝更新</h1><p>更新时间：3月31日更新后</p><p><strong>积分夺宝奖池更新：</strong>花木兰、嬴政、拳王替换为司马懿、吕布、幻想奇妙夜</p><p><strong>钻石夺宝奖池更新：</strong>梦奇、典韦、孙膑、潮流仙人（3天）替换为大乔、芈月、廉颇、时尚教父（3天）</p><p><strong>幸运夺宝自选礼包：</strong>打开后可任意选择以下奖励之一：我是风儿头像框、我是沙头像框、上分大吉回城(永久)、制霸MVP回城(永久)、赛龙舟回城(永久)、英雄碎片*5</p><h1>碎片商店更新</h1><p>更新时间：3月31日更新后</p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/ee05413e06d775133d3ded37af6075f7/0?width=554&amp;height=355\" alt=\"\"/></p><h1>版本相关</h1><h1>问题修复</h1><p>修复了孙策-末日机甲回城音效丢失的异常问题；</p>', '2022-03-31 13:34:43', '2022-03-31 13:34:43', 'f5ffe55f0ddb479381d7a37344f88fbc', 'admin', '/files/74134e4b1e574546ac58bff3db3be42d');
INSERT INTO `gf_news` VALUES (24, '元歌源梦皮肤设计大赛最终投票开启公告', '<p>亲爱的玩家们：</p><p>&nbsp; &nbsp; &nbsp; &nbsp;元歌源梦皮肤设计大赛经过首轮投票后，由官方评审围绕设计作品的创意度、&nbsp;“美学·叙事·玩法”三要素契合度、实际开发可行性等，综合评估投票前30名作品，选出了3个相对更优方案授予<strong>优秀创意奖</strong>。最佳创意奖将由玩家们从这3个作品中票选决出。</p><p><img src=\"https://shp.qpic.cn/cfwebcap/0/61eaf73db488015bdbd29f238108f65f/0/?width=912&amp;height=580\" alt=\"\" title=\"\" style=\"\"/></p><p>&nbsp;</p><p>&nbsp;&nbsp; &nbsp; &nbsp; 元歌源梦皮肤设计大赛的最终投票环节于<strong>3月25日</strong>正式启动，详情如下——</p><p>1.&nbsp;<strong>最终投票期：3月25日-3月27日</strong></p><p><strong>2. 投票渠道：</strong></p><p>方式①：游戏内大厅-活动-<strong>【元歌源梦】皮肤总决选</strong></p><p>方式②：游戏内大厅-活动-<strong>共创基地-共创入口-创意互动营-元歌皮肤设计大赛</strong></p><p>方式③：游戏内大厅-社区-<strong>发现-创意互动营-元歌皮肤设计大赛</strong></p><p>&nbsp;</p><p><strong>3. 投票资格：</strong></p><p>&nbsp; &nbsp; &nbsp; &nbsp;王者荣耀游戏账号等级达到30级的玩家均可参与投票，投票期间，每个账号每天进入大赛页面可获得1票，拥有元歌英雄每天可获得1票，完成1场5V5对局可获得1票，即每天最多可获得3票，当日未用完票数会在次日零时清空。</p><p><strong>4. 投票奖励：</strong></p><p>&nbsp; &nbsp; &nbsp; &nbsp;首次投票后，玩家获得元歌皮肤设计大赛限时活动语音-“给你们露一手~”。</p><p><strong>5. 投票结果：</strong></p><p>&nbsp; &nbsp; &nbsp; &nbsp;最终投票中得票数最高的作品，将获得本次大赛的最佳创意奖。王者荣耀官方团队将在尊重创意主题的前提下，与最佳创意奖作者沟通，共同完成作品的打磨并落地进游戏，成为“源·梦”系列的第4款皮肤，皮肤将于2022年创意互动周产出。</p><p>&nbsp; &nbsp; &nbsp; &nbsp;欢迎各位玩家投票支持/分享自己喜爱的设计作品，助力其成为元歌“源·梦”新皮肤~</p><p>&nbsp; &nbsp; &nbsp; &nbsp;我们为召唤师们准备了答疑邮箱地址，如对创意互动营的活动有任何疑问或反馈，请发送邮件至hdy_help@tencent.com。</p><p>&nbsp;</p><p>Q：同一账号下的多个角色能否多次投票并领取投票奖励？</p><p>A：不能。投票次数的获取和奖励领取资格都限制至账号。</p><p>&nbsp;</p><p><strong>投票次数资格：</strong></p><p>&nbsp; &nbsp; &nbsp; &nbsp;每个账号每日最多可获得3次投票机会，该账号下所有达到30级的角色共用3次投票机会，如果当日已使用3次投票机会，切换游戏角色再完成单个任务也无法获得新的投票机会。</p><p>&nbsp; &nbsp; &nbsp; &nbsp;举个例子，某账号下拥有角色A及角色B，角色A对3个作品完成了投票后，切换至角色B时，【登录活动页面】任务状态为“已完成”，但再次投票时，依然会提示：您今日的投票次数已用完～。</p><p>&nbsp;</p><p><strong>奖励领取资格：</strong></p><p>&nbsp; &nbsp; &nbsp; &nbsp;最终投票环节首次投票将获得限时活动语音，每个账号仅可领取1次，且奖励会发放至进行首次投票的游戏角色下。</p><p>&nbsp; &nbsp; &nbsp; &nbsp;举个例子，某账号下拥有角色A及角色B，角色A进行了首次投票后，语音礼包将直接发放至角色A的游戏邮箱，切换至角色B时，角色B无法再次领取该奖励。</p><p>&nbsp; &nbsp; &nbsp; 如果是在游戏外的链接中领取奖励，则会发放至绑定角色的游戏邮箱中。</p>', '2022-03-31 13:39:00', '2022-03-31 13:39:00', 'f5ffe55f0ddb479381d7a37344f88fbc', 'admin', '/files/74134e4b1e574546ac58bff3db3be42d');
INSERT INTO `gf_news` VALUES (25, '111', '<p>111</p>', '2022-03-31 15:24:48', '2022-03-31 15:24:48', 'f5ffe55f0ddb479381d7a37344f88fbc', 'admin', '/files/b8aabbf85fe749acbe62ae875afc276e');
INSERT INTO `gf_news` VALUES (26, '11', '<p>11</p>', '2022-04-01 15:50:34', '2022-04-01 15:50:34', 'f5ffe55f0ddb479381d7a37344f88fbc', 'admin', '/files/b8aabbf85fe749acbe62ae875afc276e');
INSERT INTO `gf_news` VALUES (27, '公告测试', '<p>公司</p>', '2022-04-15 15:28:18', '2022-04-15 15:28:18', 'f5ffe55f0ddb479381d7a37344f88fbc', 'admin', '/files/b8aabbf85fe749acbe62ae875afc276e');

-- ----------------------------
-- Table structure for gf_post
-- ----------------------------
DROP TABLE IF EXISTS `gf_post`;
CREATE TABLE `gf_post`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id 帖子id\r\n',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '帖子标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '帖子内容',
  `outline` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '该用户很懒，没有留下什么' COMMENT '帖子概括',
  `photoUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `author_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '作者id',
  `author_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '作者名字',
  `author_avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '作者头像',
  `views` int NULL DEFAULT 0 COMMENT '浏览量',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_update` datetime NOT NULL COMMENT '修改时间',
  `is_stick` tinyint NOT NULL DEFAULT 0 COMMENT '默认0， 1加精，2置顶，3精+顶',
  `status` int NOT NULL DEFAULT 0 COMMENT '状态-1审核不通过，0未审核，1审核公开，2公开私密，3  草稿箱， 4 回收站',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `author_id`(`author_id`) USING BTREE,
  CONSTRAINT `gf_post_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `gf_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '帖子表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gf_post
-- ----------------------------
INSERT INTO `gf_post` VALUES (2, '【QQ飞车】新手指引', '<h3>新手指南</h3><p><i></i><a href=\"https://speed.qq.com/main.shtml\" target=\"_blank\">首页</a>新手指南</p><ul><li><a href=\"javascript:void(\'\')\"><i></i>安装指南</a></li><li><a href=\"javascript:void(\'\')\"><i></i>操作说明</a></li><li><a href=\"javascript:void(\'\')\"><i></i>游戏介绍</a></li><li><a href=\"https://speed.qq.com/web201503/page/game.shtml\"><i></i>游戏模式</a></li></ul><h4>安装指南</h4><h5>如何下载</h5><ul><li>1打开下载链接&nbsp;<a href=\"https://speed.qq.com/web201503/download.shtml\" target=\"_blank\">//speed.qq.com/web201503/download.shtml</a></li><li>2选择一种下载方式 点击相应的图标选择不同的下载方式</li><li>3等待下载完成</li></ul><h5>如何安装</h5><ul><li><p>1双击安装程序后，等待加载，出现安装界面，<strong>点击“下一步”</strong></p><p><img src=\"https://game.gtimg.cn/images/speed/web201503/images/speed_guild/01.jpg\"/></p></li><li><p>2阅读《QQ飞车》用户协议，点击<strong>“我接受”</strong></p><p><img src=\"https://game.gtimg.cn/images/speed/web201503/images/speed_guild/02.jpg\"/></p></li><li><p>3选择一个安装的目录，点击<strong>“安装”</strong></p><p><img src=\"https://game.gtimg.cn/images/speed/web201503/images/speed_guild/03.jpg\"/></p></li><li><p>4出现安装界面后，等待完成即可</p><p><img src=\"https://game.gtimg.cn/images/speed/web201503/images/speed_guild/04.jpg\"/></p></li></ul>', '下载or安装', 'http://localhost:8082/game-server/files/77b34ce4d36a48e7a65149bd59aa5d0e_QQ飞车.jpeg', 'b3bd92d8c40f4e6f864192d4ea5e2c95', 'fan111', '/image/1.jpg', 0, '2022-02-04 09:40:34', '2022-04-03 16:26:03', 0, 1);
INSERT INTO `gf_post` VALUES (3, '【QQ飞车】更新优化', '<p><b><br/>1、画面自适应优化：</b>画面适配逻辑优化，新账号或在新设备登录时，会根据电脑硬件进行最优画面设置。</p><p><b>2、成就界面领取优化：</b>成就界面增加一键领取功能，便于批量领取。</p><p><b>3、歌曲界面功能优化：</b>舞蹈歌曲选择界面增加搜索功能，方便玩家查找指定歌曲。</p><p><b>4、视频录像分享：</b>新增视频上传云端分享功能，仅需复制分享码即可分享下载。</p><p><b>5、魅力寻宝体验优化：</b>每次寻宝结束后会保留在原页面，便于再次开始。</p><p><b>6、仓库优化：</b>改装后的赛车和强化后的宠物开放存入仓库功能。</p><p><b>7、Bug修复：</b>精灵世界中与精灵对话的功能的异常修复。</p>', '优化', 'http://localhost:8082/game-server/files/77b34ce4d36a48e7a65149bd59aa5d0e_QQ飞车.jpeg', 'b3bd92d8c40f4e6f864192d4ea5e2c95', 'fan111', '/image/1.jpg', 0, '2022-02-06 15:39:19', '2022-04-03 16:30:02', 2, 1);
INSERT INTO `gf_post` VALUES (6, 'windows', '<p>我原本是一名 Windows 的粉丝，从 10 岁起就开始在家学习编程，而后又从事了 8 年多的前端开发，这期间使用的都是 Windows。然而，最近我换了一份工作，新公司给了我一台 MacBook Pro，所以我别无选择，只能学习适应 MacOS 的一切。刚开始的时候，我非常不习惯，老实说，我花了几天时间才开始逐渐适应 Mac，但在适应之后，我就喜欢上了这款操作系统。</p><p>刚开始的时候，我非常怀念一些 Windows 上的工具，而且还努力寻找 Mac 上的替代程序。在本文中，我想介绍一些曾给予我帮助的经验，希望可以帮助其他开发人员顺利地从 Windows 过渡到 Mac。</p><p><br/></p><h2>包管理器</h2><p>在 Windows 上，我一直使用 Chocolatey 作为包管理器。我发现这款工具为安装和组织各种软件包提供了很大的便利性，所以我一心想着寻找 Mac 上的最佳替代品。最终我发现 Brew 就是我苦苦寻找的工具。在过去一年里，我一直在使用这款工具，从功能上看，它与 Chocolatey 不相上下，而且没有遇到任何问题。</p><h2><a></a><a></a>终端</h2><p>在 Windows 上，我首推的终端工具就是 ConEmu，所以当发现 Mac 不支持该工具时，我感到万分沮丧。最后，我咨询了团队中的一些人，他们向我推荐了了iTerm2，我必须承认这款工具同样出色。</p><p>iTerm2中缺少的一项功能是，无法一目了然地显示当前活动的 git 分支。不过不用担心！oh-my-zsh 可以来拯救这个问题。你可以通过 curl 命令来安装 oh-my-zsh，安装完成后就可以在终端中看到那些漂亮的 git 分支了。</p><p>与 ConEmu 类似，在 iTerm2 中也可以在打开终端时通过“窗口排列”的功能自动启动各个选项卡。我觉得这个功能很方便，因为打开终端就可以自动导航到正确的目录，并为我打开常用的三个选项卡：git、serve 和 test。可以说，多年来此功能为我节省了大量时间！</p><h2><a></a><a></a>查找工具</h2><p>Finder是 Mac 上的默认文件管理器，相当于 Windows 的资源管理器，但略有不同。在我看来，最大的不同在于没有最常见的剪切和粘贴。在 Windows 上，你只需按下 ctrl + x 和 ctrl + v；但在 Mac 上，你必须选择文件，然后按 cmd + c 和 cmd + option + v。</p><h2><a></a><a></a>隐藏文件</h2><p>如果想在 Finder 中显示隐藏文件，只需按 command + shift + .。</p><p>如果想默认显示隐藏文件，只需打开终端并运行以下命令：</p>', '该用户很懒，没有留下什么', NULL, 'b3bd92d8c40f4e6f864192d4ea5e2c95', 'fan111', '/image/1.jpg', 0, '2022-02-07 16:58:47', '2022-02-07 16:58:47', 0, 1);
INSERT INTO `gf_post` VALUES (7, '新闻热点', '<p>整理 | 苏宓<br/><br/>一分钟速览新闻点！<br/>Oracle Linux 8.5 上架 Microsoft Store<br/>英特尔宣布加入 RISC-V 基金会，并推出 10 亿美元基金建立代工创新生态系统<br/>GitHub 推出只有赞助者能访问的私有库<br/>天津大学牵头组建我国首个脑机接口综合性开源软件平台<br/>200 亿参数 GPT-NeoX 即将开源<br/>长期支持版本 Laravel 9 发布<br/>Tiny Core Linux 13 发布：仅需 46MB 内存、50MB 磁盘<br/>面向 Web 2 前端开发者的 Web 3 指南<br/>开源新闻<br/><br/></p>', '该用户很懒，没有留下什么', NULL, 'b3bd92d8c40f4e6f864192d4ea5e2c95', 'fan111', '/image/1.jpg', 0, '2022-02-08 10:21:30', '2022-02-08 10:21:30', 0, 1);
INSERT INTO `gf_post` VALUES (8, '【七龙珠】如何通过', '<p>大乱斗系统是全新加入不久的竞技类系统，在这类系统中，玩家们会在里面进行大混战，最终角逐出最强者出来，获得丰厚的奖励，那么我们该如何玩转大乱斗系统呢？</p><p><br/></p><p><b>　　【参赛规则】</b></p><p><br/></p><p><img src=\"https://itea-cdn.qq.com/file/editor/20171128/1.1511848000.ad8d855927784c09bb18bdf2dce3f5c3.398x708_115081.jpg\"/></p><p><br/></p><p>　　参赛时一定要选择好自己要进入战场的卡片，报名是从周一开始，到周三晚上9点结束，周三进行普通赛，周四是精英赛，我们需要注意的就是只有在普通赛中获得了第一名的玩家，才有资格进入精英赛，因此大家在普通赛时竞争非常激烈，就是为了那唯一的一个出线名额。</p><p><b><br/></b></p><p><b>　　【参赛奖励】</b></p><p><br/></p><p><img src=\"https://itea-cdn.qq.com/file/editor/20171128/2.1511848009.d8c5b1ce626ee79a4081d307ed9259c6.398x708_89209.jpg\"/></p><p><br/></p><p>　　大乱斗的奖励非常丰富，普通赛主要提供乱斗金币、大量界限突破的材料还有经验元气，而精英赛主要提供乱斗金币、界限突破的材料、大量洗炼石，不仅如此，乱斗金币还可以在特定的商店里兑换限时战士魔人布欧、稀有战士GT特兰克斯的碎片，帮助每个玩家都能拥有属于自己的神卡。</p><p><b><br/></b></p><p><b>　　【乱斗事项】</b></p><p><b><br/></b></p><p><b>　　【战斗】</b></p><p><br/></p><p><img src=\"https://itea-cdn.qq.com/file/editor/20171128/3.1511848024.3cf46d9bc0627faf82dc717c8bdfd76d.398x708_82564.jpg\"/></p><p><br/></p><p>　　所有玩家进入地图之后，混战就开始了，通过移动自己与敌人相遇便会自动触发战斗，如果战士死亡便会自动切换到下一个战士继续上阵，大家也可以自行调整战士出场的顺序，一般来说，拥有续航能力卡片的玩家获胜的机会比较大，所以大家可以将这类卡片先靠前，赚取足够的积分。</p><p><br/></p><p>　<b>　【战场】</b></p><p><br/></p><p><img src=\"https://itea-cdn.qq.com/file/editor/20171128/4.1511848033.7d05764a60dcc92b8d3df3314fc70913.398x708_101170.jpg\"/></p><p><br/></p><p>　　战场一共会分为三个阶段，第一阶段玩家们可以在里面自由行走战斗，当到了第二和第三阶段，地图会分别缩小到一定范围，所以想一直躲藏起来不参与战斗的玩家是不可能获得胜利的。</p><p><br/></p><p><b>　　【战场效果】</b></p><p><br/></p><p><img src=\"https://itea-cdn.qq.com/file/editor/20171128/5.1511848043.dcc22e76ec3da06169e74dbb5a883b26.398x708_77679.jpg\"/></p><p><br/></p><p>　　战场中想获得胜利，不仅仅需要靠自身卡片的培养程度，更需要战场效果的增幅，这样才能事半功倍。</p><p><br/></p><p>　　在混战中，防御提升、攻击提升是可以帮助我们挑战一些高强度玩家的，当你同时获得这两份效果时，一定不要害怕，大胆地去战斗；移速提升可以帮助我们逃避或者追击，移动速度在乱斗中是非常重要的；如果你的主力战士残血或者死掉了，需要特别注意地图上的回血与复活，可以直接让你的战士起死回生，再次回到战场上展现自己的力量；当然，乱斗中还有一个最重要的效果，是地图上看不见的，那就是系统随机给玩家施加的爆气效果，处于爆气状态的玩家，遇到任何敌人都可以直接秒杀，所以这时一定要配合移速提升，先去击败地图中最强大的玩家，然后再逐一击破其他各点。</p><p><br/></p><p>　　大乱斗系统异常惊险刺激，大家不仅仅需要安排好自己的阵容，更要在战场中全力发挥，这样才能拿到优秀的名次。</p>', '终极混战 如何玩转大乱斗系统', 'http://localhost:8082/game-server/files/031affc7ea204bf59b6d89529156be87_七龙珠.jpeg', 'b3bd92d8c40f4e6f864192d4ea5e2c95', 'fan111', '/files/0a9182a4a9434336b91848d4f101d80c', 0, '2022-02-10 09:21:26', '2022-04-03 16:36:40', 0, 1);
INSERT INTO `gf_post` VALUES (9, '【七龙珠】属性解析', '<p>　在游戏中，每个战士都有着自己的面板属性，而对于其中的一些属性作用，大家是否都了解清楚了呢？</p><p><br/></p><p>　　<b>【面板分类】</b></p><p><br/></p><p><img src=\"https://itea-cdn.qq.com/file/editor/20171128/1.1511847608.77a2a0b764204073cdeac7d05bb4645d.398x708_97731.jpg\"/></p><p><br/></p><p>　　面板现在主要分为了两个大部分，属性与融合属性，而这两部分又各自分为了攻击类与防御类两类属性，让我们一起先来划分一下。</p><p><br/></p><p><b>　　【属性】</b></p><p>　　</p><p>　　攻击类：物理攻击、能量攻击、暴击、破挡、暴击伤害、物理增伤、能量增伤、神圣伤害等等。</p><p><br/></p><p>　　防御类：生命、物理防御、能量防御、抗暴、格挡、格挡强度、物理减伤、能量减伤、神圣减伤、治疗效果（偏防御续航）等等。</p><p><br/></p><p>　<b>　【融合属性】</b></p><p><br/></p><p>　　攻击类：融合攻击、融合暴击、融合破挡、融合暴伤、融合格挡虚弱、融合伤害增加。</p><p><br/></p><p>　　防御类：融合防御、融合抗暴、融合格挡、融合暴免、融合格挡强度、融合伤害减免。</p><p><br/></p><p>　<b>　【攻击与防御（以属性为例）】</b></p><p><br/></p><p>　　攻击分为了物理攻击与能量攻击，防御也分为了物理防御与能量防御，它们是对立的。其中攻击是可以通过双招伤害系数进行增幅的，一般来说伤害系数都会大于100%，也就是我们打出去的伤害都会比原本的攻击力打出来的伤害高。另外在技能中我们经常可以看到提升攻击力与防御力，这时的提升效果是不分物理与能量的，两者均会得到增幅。</p><p><br/></p><p>　<b>　【暴击与抗暴、破挡与格挡（以属性为例） 】</b></p><p><br/></p><p>　　暴击、破挡是目前我们大家都比较关注的输出属性，任何输出卡都离不开暴击和破挡，通过提升暴击与破挡的面板，概率自然就会大大增加，而它的对立面就是抗暴与格挡了，通过堆取抗暴和格挡的面板，我们又可以减少暴击和破挡的概率，它们是相互克制的。</p><p><br/></p><p>　<b>　【格挡强度与格挡虚弱（以属性为例）】</b></p><p><br/></p><p>　　格挡强度可以减少格挡时受到的伤害，格挡虚弱又能够反压格挡强度，不过一般来说大家都不会去选择堆取这两个属性，因为格挡后的伤害本身就比较低，即使再提升或减少，也不会有太大变化。</p><p><br/></p><p><b>　　【伤害减免与物理增伤、能量增伤（以属性为例）】</b></p><p><br/></p><p>　　伤害减免是我们平常看到最多的属性，无论是技能还是面板，都深受大家的喜爱，因为它一个属性，可以直接抵挡住物理增伤和能量增伤两种属性，性价比极高，是非常强大的生存属性，所以我推荐大家可以多多重视这个属性的获取。</p><p><br/></p><p>　　以上就是几类主流属性的解析，大家是否对游戏属性有了更深的了解呢？</p>', '相生相克 几类主流属性大解析', 'http://localhost:8082/game-server/files/031affc7ea204bf59b6d89529156be87_七龙珠.jpeg', 'b3bd92d8c40f4e6f864192d4ea5e2c95', 'fan111', '/files/0a9182a4a9434336b91848d4f101d80c', 0, '2022-02-10 09:22:32', '2022-04-03 16:34:21', 1, 1);
INSERT INTO `gf_post` VALUES (21, '【七龙珠】燃烧吧，地球的希望—超赛孙悟饭', '<p>他，是潜力无限的超级赛亚人，是与伙伴们并肩战斗的地球保卫者，是被寄予厚望的一代天之骄子，他就是被众多龙珠迷所喜爱的角色——超赛孙悟饭。</p><p>现在，超赛孙悟饭已经降临龙珠激斗，这个伤仲永式的经典角色在他曾经最辉煌的时期能爆发出何种惊人的力量呢？让我们到游戏中通过技能和定位来一起认识一下他。</p><p><strong>超赛孙悟饭技能分析</strong><strong>：</strong></p><p>特技技能：</p><p>作为新生代的限时神将，优秀的特技是卡牌的一大亮点，超赛孙悟饭与其他拥有特技的神将类似，具备了许多光环类和攻防类的属性：十字范围增加攻防5%；自身提高暴击，格挡以及伤害减免各15%；随怒气的变化，自身攻防也会有0~15%的变化。除了这几项通常的属性提升之外，超赛孙悟饭还有两个相对较特殊，也是对自身提升比较明显的技能：怒气累计3000点，将大幅提升必杀的暴击，并且每恢复一定的怒气，就对整体的攻防进行进一步的大幅提升，让超赛孙悟饭变成一个越打越强的超级输出战士；而当队伍中其他角色受到攻击时，超赛孙悟饭获得30点怒气，其他角色死亡时，额外获得300点怒气，仅仅依靠特技的效果，超赛孙悟饭已经在怒气上有了独一无二的强大系统，让超赛孙悟饭在必杀的使用上更加游刃有余。</p><p><img src=\"https://ossweb-img.qq.com/upload/webplat/info/lzjd/20170213/1486987721928749.jpg\" alt=\"图1.jpg\"/>&nbsp;</p><p><strong>&nbsp;</strong></p><p>绝招技能：</p><p>超赛孙悟饭从绝招技能来看，当属智能型的输出角色，对敌方怒气最高的目标造成单体伤害，降低怒气并附带怒火灼烧效果，将敌方最先能开大的角色牢牢地控制住，延缓对方的开大时机，为己方的输出环境及生存空间都带来了保障。除此之外还会根据对方角色的怒气情况，为自己恢复怒气或增加额外的伤害，效果非常的实用。在怒火灼烧持续的两回合中，也会不断给对手造成血量和能量上的威胁。</p><p>&nbsp;</p><p>&nbsp;</p><p><img src=\"https://ossweb-img.qq.com/upload/webplat/info/lzjd/20170213/1486987739297261.jpg\" alt=\"图2.jpg\"/><strong>&nbsp;</strong></p><p>&nbsp;</p><p>必杀技能：</p><p>超赛孙悟饭的必杀技能绝对堪称亮点，高额的单体输出技能，209%的超高技能系数，附带怒火焚烬效果，可使敌方角色的怒气直接清空，并根据所清掉的怒气数值提高攻击力，最高可达12%。而这个技能如果仅仅如此的话只能说优质，并不能称之为极品技能，但是这个技能同样也配置了智能锁定效果，目标定位敌方最高怒气角色，直接将对面即将满怒甚至已经满怒但是后手释放必杀技的角色怒气燃烬，并且再附带类似沙鲁必杀的溅射效果，绝对堪称史诗级别的必杀技能了。</p><p><img src=\"https://ossweb-img.qq.com/upload/webplat/info/lzjd/20170213/1486987750745188.jpg\" alt=\"图3.jpg\"/>&nbsp;</p><p>&nbsp;</p><p><strong>超赛孙悟饭总结</strong><strong>：</strong></p><p>伴随超蓝体系的出现，搭配黄金弗利萨，伙伴丹迪等人的技能效果，超赛孙悟饭在队友的保护下，能够快速积攒能量，从而在后几回合连续爆发，打出高额的输出伤害以及超强的控制效果，相信在全新体系下超赛孙悟饭会散发出那真正属于超级赛亚人的耀眼光芒！</p>', '攻略 孙悟饭', 'http://localhost:8082/game-server/files/031affc7ea204bf59b6d89529156be87_七龙珠.jpeg', 'b3bd92d8c40f4e6f864192d4ea5e2c95', 'fan111', '/files/0a9182a4a9434336b91848d4f101d80c', 0, '2022-02-11 13:12:31', '2022-04-03 16:33:16', 0, 1);
INSERT INTO `gf_post` VALUES (22, '【王者荣耀】游戏介绍', '<p><br/></p><p><a href=\"https://pvp.qq.com/web201605/introduce.shtml#\"><img src=\"https://game.gtimg.cn/images/yxzj/web201605/page/games.png\" alt=\"游戏介绍\"/></a>&nbsp;&nbsp;游戏介绍</p><p><img src=\"https://ossweb-img.qq.com/upload/webplat/info/yxzj/20190318/49656773132138.jpg\" title=\"\" style=\"\"/></p><p>游戏介绍</p><p>《王者荣耀》是腾讯第一5V5团队公平竞技手游，国民MOBA手游大作！5V5王者峡谷、公平对战、还原MOBA经典体验；契约之战、五军对决、边境突围等，带来花式作战乐趣！10秒实时跨区匹配，与好友开黑上分，向最强王者进击！多款英雄任凭选择，一血、五杀、超神，实力碾压，收割全场！敌军即将到达战场，王者召唤师快来集结好友，准备团战，就在《王者荣耀》！</p><p><a href=\"https://pvp.qq.com/web201605/introduce.shtml#\"><img src=\"https://game.gtimg.cn/images/yxzj/web201605/page/icon_gs.png\" alt=\"游戏特色\"/></a>&nbsp;&nbsp;游戏特色</p><p><i></i></p><p><i></i><a href=\"javascript:void(0);\">游戏特色一</a></p><p><i></i><a href=\"javascript:void(0);\">游戏特色二</a></p><p><i></i><a href=\"https://pvp.qq.com/web201605/introduce.shtml#javascript:void(0);\">游戏特色三</a></p><p><i></i><a href=\"https://pvp.qq.com/web201605/introduce.shtml#javascript:void(0);\">游戏特色三</a></p><p><i></i><a href=\"javascript:void(0);\">游戏特色四</a></p><p><i></i><a href=\"javascript:void(0);\">游戏特色五</a></p><p>视觉全面升级！王者2.0时代来临！</p><p>全景沉浸式大厅，国风配色、传统饰形、山水云纹，更加具有东方神韵；次世代技术，全面提升画质，呈现超高清峡谷地图。</p><p><img src=\"https://ossweb-img.qq.com/upload/webplat/info/yxzj/20191112/580401482397530.png\"/></p>', '【王者荣耀】游戏介绍', 'http://localhost:8082/game-server/files/4742fb1df2b6452a8961225f0268425e_王者荣耀-特工魅影.jpeg', 'f5ffe55f0ddb479381d7a37344f88fbc', 'admin', '/image/1.jpg', 0, '2022-03-11 06:20:58', '2022-04-03 15:57:21', 0, 1);
INSERT INTO `gf_post` VALUES (23, '【王者荣耀】教程视频', '<div class=\"vsc-controller\"></div><video src=\"http://localhost:8082/game-server/files/9dea9d35b7624c53932e8f1a6ff0997d\" controls=\"controls\" style=\"max-width:100%\"></video>', '教程视频', 'http://localhost:8082/game-server/files/4742fb1df2b6452a8961225f0268425e_王者荣耀-特工魅影.jpeg', 'f5ffe55f0ddb479381d7a37344f88fbc', 'admin', '/files/74134e4b1e574546ac58bff3db3be42d', 0, '2022-03-11 07:30:08', '2022-04-03 16:00:19', 3, 1);
INSERT INTO `gf_post` VALUES (24, '【王者荣耀】新手指南', '<p><img alt=\" \" src=\"https://game.gtimg.cn/images/yxzj/web201605/page/icon_qlogo.png\"/>&nbsp;疑问一 :&nbsp;连攻略都看不懂</p><p><a href=\"https://pvp.qq.com/webplat/info/news_version3/15592/24091/25112/m15762/201607/483931.shtml\" target=\"_blank\">更多内容请点这里</a></p><p>什么是AD？ 什么是ADC？ 什么是GANK？ 大神们究竟在说啥？</p><p>很多新手看攻略都会感到很疑惑，因为写攻略的大神们通常都会用大量电竞术语来代表英雄定位、战术行为。官网君给新手们精心准备常见的专业名词解释，点击下面的专业名词 可查看详细解释，看是不是你不懂得词噢。</p><p><img src=\"https://game.gtimg.cn/images/yxzj/web201605/page/icon_qlogo.png\"/>&nbsp;疑问二 :&nbsp;不知道选什么英雄和技能</p><p><a href=\"https://pvp.qq.com/webplat/info/news_version3/15592/24091/25112/m15762/201607/483931.shtml\" target=\"_blank\">更多内容请点这里</a></p><p>不知道选什么英雄？</p><p>对于新手来说，选英雄当然是选自己最熟悉，玩的最多的英雄胜率会越高了，选简单的肉盾/战士生存率会高点 。但是，如果你一直只玩几个英雄，那你肯定只能停留在新手阶段，因为你不了解其他英雄，就不清楚在对线的时候，应该在什么时候主动出击，什么时候回避对手。下面给 新手们推荐几个操作简单又好用的英雄。</p><p><a href=\"https://pvp.qq.com/webplat/info/news_version3/15592/24091/25112/m15762/201607/483520.shtml\" target=\"_blank\">出场率最高的英雄</a><a href=\"https://pvp.qq.com/webplat/info/news_version3/15592/24091/25112/m15762/201607/482183.shtml\" target=\"_blank\">容易上手的英雄</a><a href=\"https://pvp.qq.com/webplat/info/news_version3/15592/24091/25112/m15762/201607/482216.shtml\" target=\"_blank\">容错率高的英雄</a><a href=\"https://pvp.qq.com/webplat/info/news_version3/15592/24091/25112/m15762/201607/483523.shtml\" target=\"_blank\">进阶建议</a></p><p>不知道选什么技能？</p><p>其实正确选择召唤师技能，应该是根据你所选择的英雄来决定。比如说项羽，由于被动技能是当生命降低到30%，就会在6秒内回复24%最大生命值，这个效果注定项羽出增加血量的装备，如果召唤师技能带治疗，立刻回复15%的生命，充分发挥项羽血多的特征。看下图图标组合，或许你就明白应该选择什么样的技能了。</p>', '新手指南', 'http://localhost:8082/game-server/files/4742fb1df2b6452a8961225f0268425e_王者荣耀-特工魅影.jpeg', 'f5ffe55f0ddb479381d7a37344f88fbc', 'admin', '/files/74134e4b1e574546ac58bff3db3be42d', 0, '2022-03-11 07:32:58', '2022-04-15 15:27:20', 3, 1);
INSERT INTO `gf_post` VALUES (25, '【王者荣耀】22活动22', '<p><strong>票次数资格：</strong></p><p>&nbsp; &nbsp; &nbsp; &nbsp;每个账号每日最多可获得3次投票机会，该账号下所有达到30级的角色共用3次投票机会，如果当日已使用3次投票机会，切换游戏角色再完成单个任务也无法获得新的投票机会。</p><p>&nbsp; &nbsp; &nbsp; &nbsp;举个例子，某账号下拥有角色A及角色B，角色A对3个作品完成了投票后，切换至角色B时，【登录活动页面】任务状态为“已完成”，但再次投票时，依然会提示：您今日的投票次数已用完～。</p><p>&nbsp;</p><p><strong>奖励领取资格：</strong></p><p>&nbsp; &nbsp; &nbsp; &nbsp;最终投票环节首次投票将获得限时活动语音，每个账号仅可领取1次，且奖励会发放至进行首次投票的游戏角色下。</p><p>&nbsp; &nbsp; &nbsp; &nbsp;举个例子，某账号下拥有角色A及角色B，角色A进行了首次投票后，语音礼包将直接发放至角色A的游戏邮箱，切换至角色B时，角色B无法再次领取该奖励。</p><p>&nbsp; &nbsp; &nbsp; 如果是在游戏外的链接中领取奖励，则会发放至绑定角色的游戏邮箱中。</p>', '12341', 'http://localhost:8082/game-server/files/4742fb1df2b6452a8961225f0268425e_王者荣耀-特工魅影.jpeg', 'f5ffe55f0ddb479381d7a37344f88fbc', 'admin', '/files/74134e4b1e574546ac58bff3db3be42d', 0, '2022-03-16 06:59:55', '2022-03-16 06:59:55', 0, 0);
INSERT INTO `gf_post` VALUES (26, '【天涯明月刀】3月30日服务器例行维护公告', '<p>亲爱的玩家：<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;青龙乱舞区、大地飞鹰区、沧海云帆区、把酒邀月区、云上之城区、边城浪子区全部服务器将在3月30日6:00~10:00停机维护更新，维护完成后上述各服务器客户端版本更新至2.1.68.23，给您带来的不便敬请谅解。</p><p><strong>天涯战令</strong></p><p>天涯战令开启全新S7赛季！为了让少侠能更快获得天涯战令的成长回馈，我们缩短了天涯战令的周期，预计从6个月左右缩短至3个月左右。</p><p>1、天涯战令奖励刷新，完成指定任务获得海量成长资源，更有200%绑点返还。</p><p>2、天涯战令赛季商店兑换物品更新。</p><p>3、赛季重置后少侠没有领取的奖励将统一发放到背包。</p><p>&nbsp;</p><p><strong>论剑</strong></p><p>1、论剑分数结算进行了算法修改，所以各位少侠在论剑中升段速度会有较大提升。</p><p>2、论剑武圣段位和求败段位的分数计算方式将保持一致。</p><p>3、论剑中将无法使用自断经脉，请各位少侠专心比武切磋。</p><p>&nbsp;</p><p><strong>别业</strong></p><p>1、修复了在别业或者蓝图小筑里，画质选项开启光追之后，可能会导致客户端崩溃的问题。</p><p>&nbsp;</p><p><strong>王府乱斗</strong></p><p>1、修复了王府乱斗中可以使用我意凌云的问题。</p><p>&nbsp;</p><p><strong>商城</strong></p><p>【晓觅晨星活动预告】</p><p>“晓觅晨星”活动即将于3月30日开启！开箱夺宝赢好礼，累计幸运值即可获赠华美时装“浮光·晨星”、随身特效“灵韵·夜之幽”等外观！参与还可获得蔷薇币，随心兑换“陨焰之石”、“大悲赋质料”、“夜耀之晶”、“绝智琉璃魄”等豪华奖励！少侠快来试试手气！</p><p>夜炽光，晨拢翼。全新外观“浮光·晨星”以神秘的黑色为主色调，点缀火焰一般的玫瑰。如魔似魅、高傲优雅。</p><p><img src=\"https://ossweb-img.qq.com/upload/webplat/info/202203/d3dd9bd2011235b1ce063b6821599aaf.files/image001.gif\" alt=\"\"/></p><p>&nbsp;</p><p>【染色系统】</p><p>1、随心染色：本次更新后以下套装已经开放随心染色：浮光·晨星、浮光·童心森林、心王·长生殿。</p><p><img src=\"https://ossweb-img.qq.com/upload/webplat/info/202203/d3dd9bd2011235b1ce063b6821599aaf.files/image002.gif\" alt=\"\"/></p><p><img src=\"https://ossweb-img.qq.com/upload/webplat/info/202203/d3dd9bd2011235b1ce063b6821599aaf.files/image003.gif\" alt=\"\"/></p><p>&nbsp;</p><p>【魅力系统】</p><p>-&nbsp;收藏灵韵·夜之幽：70点魅力</p><p>-&nbsp;收藏浮光·晨星：45点魅力</p><p>-&nbsp;收藏吾爱·炽之念：15点魅力</p><p>-&nbsp;收藏灵殊·暗之灵：15点魅力</p><p>-&nbsp;收藏火蝠儿：10点魅力</p><p>&nbsp;</p><p>【赏玩系统】</p><p>-&nbsp;坐骑“轻云·花映雪”特效更新</p><p>-&nbsp;鞍具“灵甲·冰倾”，“比翼·冰倾”特效更新。</p><p>&nbsp;</p><p>&nbsp;&nbsp;《天涯明月刀》项目组<br/><br/>3月30日</p>', '游戏公告【天涯明月刀】', 'http://localhost:8082/game-server/files/e5412dacfe084ef389815009c625aeb4', 'f5ffe55f0ddb479381d7a37344f88fbc', 'admin', '/files/74134e4b1e574546ac58bff3db3be42d', 0, '2022-03-16 07:10:00', '2022-04-03 16:14:14', 3, 1);
INSERT INTO `gf_post` VALUES (27, '【天涯明月刀】维护公告', '<p>亲爱的玩家：<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;青龙乱舞区、大地飞鹰区、沧海云帆区、把酒邀月区、云上之城区、边城浪子区全部服务器将在3月16日6:00~10:00停机维护更新，维护完成后上述各服务器客户端版本更新至2.1.68.11，给您带来的不便敬请谅解。</p><p><strong>一、重要更新</strong></p><p><strong>馥郁之战</strong></p><p>1、优化血月模式和绝智轩补给车玩法的界面表现，如果本局是血月模式或者出现绝智轩补给车，则界面上会出现血月模式或绝智轩补给车的图标。</p><p><img src=\"https://ossweb-img.qq.com/upload/webplat/info/wuxia/20220315/49260339519713.jpg\" alt=\"\"/></p><p>2、修复部分地形锁定技无法释放的问题。</p><p>3、修复部分地形飞鹤冲天表现异常的问题。</p><p>4、修复跳跃时可能卡进山体中的问题。</p><p>5、增加关于赛季物品清空的说明。</p><p>&nbsp;</p><p><strong>别业</strong></p><p>1、蓝图小筑续接功能</p><p>为解决少侠在蓝图小筑的搭建过程中，因客户端崩溃或网络掉线而退出，导致搭建的努力付诸东流的问题，大宋工部特推出蓝图小筑的断线续接功能。</p><p>当少侠掉线之后，适才的蓝图小筑位面将保存10分钟，少侠在10分钟之内再次上线即可直接进入位面，挽救刚刚的搭建数据。</p><p><img src=\"https://ossweb-img.qq.com/upload/webplat/info/wuxia/20220315/5674414613498.jpg\" alt=\"\"/></p><p>2、【园景】下的【盆栽】分类修改为【生灵】分类，其下新增4款折纸类物件：</p><p>纸灵犀、纸豹豹、纸兔兔、纸小鹿</p><p><img src=\"https://ossweb-img.qq.com/upload/webplat/info/wuxia/20220315/65802114427053.jpg\" alt=\"\"/></p><p>3、优化所有高端模板的《考工卷》与《园冶卷》的物件解锁逻辑，如若少侠已经通过购买市集中的图纸而解锁了模板中的部分物件，则会在使用《考工卷》或《园冶卷》时退还该部分物件的解锁消耗，返还对应货币。</p><p>4、修复了与床榻类物件交互后，偶尔无法下床的问题。</p><p>&nbsp;</p><p><strong>押镖调整</strong></p><p>我们期望通过这次改动，让押安全镖的少侠整体能获得的碎银整体略高于更新前刷红货水平；让对于押威武镖的少侠在扣除镖旗成本后收益整体保持与刷红货的一致。</p><p>1、上调威武镖的基础银两奖励，大幅上调安全镖的基础碎银奖励。</p><p>2.、对于安全镖和威武镖，无论是押镖失败还是放弃都会扣除1次押镖次数。</p><p>3、本次改动仅影响威武镖和安全镖，天下镖不受本次改动影响。</p><p>4、威武镖无需组队即可押送。</p><p>&nbsp;</p><p><strong>商店、掉落调整</strong></p><p>为了使各位少侠有更好的成长体验，我们对话本掉落、商店购买的物品进行了调整。部分物品从商店中移除，在话本中增加产量；部分物品从话本掉落中移除，可以从商店购买</p><p>1、神秘商店增加石母、装备制造材料碎银不限量购买。</p><p>2、移除各商店中的制造材料、灵玉、冶玲珑·初、冶玲珑·深。</p><p>3、移除荡剑币商店中的玲珑炉、地势棱石。</p><p>4、移除帮贡商店中的玲珑炉、劫火石母、紫色砭石礼包、缘材·初。</p><p>5、移除宋钱商店中的玲珑炉。</p><p>6、移除话本中掉落的各类石母。</p><p>7、东海会四盟、雨夜破天牢中增加大量缘材·初的掉落。</p><p>8、移除莲花镇心魔话本中，冶玲珑·初、冶玲珑深的掉落；移除的部分调整至决战朝天宫、东海会四盟、雨夜破天牢话本中掉落，总掉落数量略有增加。</p><p>&nbsp;</p><p><strong>航海战场调整</strong></p><p>1、周奖励1-5分的奖励调整为碎银。</p><p>&nbsp;</p><p><strong>神兵密匣调整</strong></p><p>1、神兵密匣·地藏的周限量调整为35个，提高了周活跃目标中神兵密匣·地藏的产出数量。</p><p>&nbsp;</p><p><strong>周活跃调整</strong></p><p>周活跃目标相关调整内容将于下周一（3月21日）生效</p><p>1、周活跃目标中，每周增加了500万修为的产出；同时删除了砭石分解功能，后续我们将提供砭石删除功能删除砭石库中多余的砭石。</p><p>2、周活跃目标中，神兵密匣·地藏的奖励数量提高至15个。</p><p>&nbsp;</p><p><strong>门派调整</strong></p><p><strong>真武</strong></p><p>1、离渊增加封禁效果：护盾被触发之前，在离渊范围内的敌人将被封禁轻功。</p><p>2、归玄第一击不再会击退目标。</p><p>3、修复真武在离渊范围内会被敌方减益效果影响的问题。</p><p>&nbsp;</p><p><strong>丐帮</strong></p><p>1、修复虎尾脚在部分地形下无法正常释放的问题。</p><p>&nbsp;</p><p><strong>见闻</strong></p><p>因与《仙剑奇侠传》联动到期，联动剧情奇遇【仙缘故梦】即将关闭。一别经年少年梦，曾记多情仙凡尘，作别少侠，回忆的尽头，静待佳期再逢……</p><p>&nbsp;</p><p><strong>二、商城</strong></p><p><strong>【灵琳阁】</strong></p><p>暖春之际，灵琳阁重新开业啦！我们降低了灵琳阁中部分道具的价格，并且新增了若干种受少侠喜爱的商品，少侠们快来看看吧！还有萌趣腰饰【灵殊·王果果】上新兑换商店，请喜爱的少侠不要错过哦！</p><p>*灵琳阁将在更新后逐步按服务器开启，请少侠耐心等待。</p><p>&nbsp;</p><p><strong>【商城上新】</strong></p><p>1、心王·一纸灵犀：落纸处，起烟云。个中意，灵窍心。购买可获得套装“心王·一纸灵犀”、表情动作“折云”，并额外获赠一个“纸趣生灵礼盒”。原价35800点券，折扣价32800点券。绑点售价35800绑点。</p><p><img src=\"https://ossweb-img.qq.com/upload/webplat/info/wuxia/20220315/79715401162863.jpg\" alt=\"\"/></p><p>2、纸趣生灵礼盒：纸上有真意，灵犀已忘形。开启礼盒后可在纸灵犀、纸豹豹、纸兔兔、纸小鹿这四种“动物折纸”中随机获得一种，已拥有的“动物折纸”不会重复获得。获得任意动物折纸即可解锁表情动作：折犀。使用动作后可在场景中随机摆放一个已拥有的动物折纸。也可在“折云”动作场景中自由放置已拥有的动物折纸。绑点售价2800绑点。单角色永久限量3个。</p><p><img src=\"https://ossweb-img.qq.com/upload/webplat/info/wuxia/20220315/60603566937878.jpg\" alt=\"\"/></p><p>3、宫廷御造集·园冶卷：解锁【雕梁画栋】高端模板。以下物件类型中：模板所需的物件直接解锁并获得对应数量；模板未使用到的宫廷风格物件，直接解锁并各获得1个</p><p>建筑：主屋、厢房、亭台、连廊、院墙；</p><p>框架：路径、阑干、底座、外隔</p><p>园景：景观、树木、花草、亭灯、石艺</p><p>商城售价：300000天赏积分。</p><p>4、宫廷御造集·考工卷：解锁【雕梁画栋】高端模板。以下物件类型中：模板所需的物件直接解锁并获得对应数量；模板未使用到的宫廷风格物件，直接解锁并各获得1个。</p><p>奇珍：摆件</p><p>框架：内隔</p><p>家具：床榻、橱柜、桌椅、案台、交互</p><p>装饰：屏风、盆景、摆件、灯饰、壁挂</p><p>商城售价：200000天赏积分。</p><p><img src=\"https://ossweb-img.qq.com/upload/webplat/info/wuxia/20220315/32550993285718.jpg\" alt=\"\"/></p><p>5、《青梅·怒如山火》残页：购买后可获得绑定物品：《青梅·怒如山火》残页*1。单角色永久限购：600。绑点原价1200绑点，绑点售价800绑点。</p><p>6、芳辰暖春礼：开启必得碎银、铸神令、精工材料自选礼盒和活动代币【芳辰币】。概率获得陨焰之石*1（可上架竞价拍卖行）、夜耀之晶*1（可上架竞价拍卖行）、冶玲珑·焰*1（可上架竞价拍卖行）、《青梅·威如天狱》残页包*1（可上架竞价拍卖行）、《青梅·势如破竹》残页包*1（可上架竞价拍卖行）、紫色词缀兑换券*10、金句材料自选*1、金色混沌琅纹自选*1、高级·铸神令*1。绑点售价880绑点，单角色每周限购50个，上架时间：2022年3月16日0时-2022年4月10日24时，请少侠注意购买时间。</p><p>【芳辰币】可在市集芳辰币商店兑换陨焰之石、冶玲珑·焰、高级神兵质料等珍稀道具！少侠们不要错过。</p><p>&nbsp;</p><p><strong>【染色系统】</strong></p><p>1、随心染色：本次更新后以下套装已经开放随心染色：翠羽纳新、心王·九霄、心王·灯如昼、浮光·万象。</p><p><img src=\"https://ossweb-img.qq.com/upload/webplat/info/wuxia/20220315/28362816548290.jpg\" alt=\"\"/></p><p><img src=\"https://ossweb-img.qq.com/upload/webplat/info/wuxia/20220315/47504687062641.jpg\" alt=\"\"/></p><p>&nbsp;</p><p>定制染色：本次更新后以下套装已经开放定制染色：心王·清光里、心王·小甜心。</p><p><img src=\"https://ossweb-img.qq.com/upload/webplat/info/wuxia/20220315/709961229210019.jpg\" alt=\"\"/></p><p><img src=\"https://ossweb-img.qq.com/upload/webplat/info/wuxia/20220315/715041040406371.jpg\" alt=\"\"/></p><p>&nbsp;</p><p><strong>【魅力系统】</strong></p><p>-&nbsp;收藏心王·一纸灵犀：45点魅力</p><p>-&nbsp;收藏灵殊·王果果：15点魅力</p><p>&nbsp;</p><p><strong>【消费满奖】</strong></p><p>2022年3月16日-2022年4月10日24时，商城消费满奖同期开启。在商城消费可达相应档次可获得相应消费满额奖励：</p><p>-&nbsp;消费5000点券享“碎银*1000金”</p><p>-&nbsp;消费30000点券享“鉴赏之心*500”</p><p>-&nbsp;消费60000点券享“问心之魄*100”</p><p>-&nbsp;消费100000点券享“师妹金色心法残页自选*25”</p><p>-&nbsp;消费140000点券享全新步步脚印特效“步步冲鸭（7天）*2”以及“芳辰币*30”【芳辰币】可在市集芳辰币商店兑换各类珍稀道具！</p><p>-&nbsp;消费200000点券享“芳辰币*70”</p><p>&nbsp;</p><p><strong>【3月整点在线】</strong></p><p><img src=\"https://ossweb-img.qq.com/upload/webplat/info/wuxia/20220315/34560821416947.jpg\" alt=\"\"/></p><p>3月在线礼活动时间：3月19日20:00-22:00。</p><p>活动时间玩家上线即可领取3月在线礼包“2022蝶舞莺啼在线礼”：开启即可获得碎银、修为、帮贡、随机减负令礼盒、桃源·彩贝、铸神令、中级云上之晶、鉴赏之心、荡剑币！更有几率获得红尘宝匣、随心染匣、金色天地1级琅纹自选、金色混沌1级琅纹自选、金句材料自选拍卖礼盒（可竞价拍卖）、夜耀之晶、陨焰之石等稀有奖励！（注：非活动时间内将无法领取在线礼包）</p><p>&nbsp;</p><p><strong>三、任务&amp;话本</strong></p><p><strong>挑战开封会八荒</strong></p><p>1、优化了蓝奉月第三阶段的机制提示。</p><p>&nbsp;</p><p><strong>怒挑浪客营</strong></p><p>1、修复阿筑的灯柱火焰伤害区域判定异常的问题。</p><p>&nbsp;</p><p><strong>莲华镇心魔</strong></p><p>1、优化了唐玄灵、久蚩、释沉舟的部分机制提示。</p><p>&nbsp;</p><p><strong>血夜探幽城</strong></p><p>1、修复血夜探幽城话本贺楼明月转阶段有概率卡住的问题示。</p><p>&nbsp;</p><p><strong>四、综合玩法</strong></p><p><strong>王府乱斗</strong></p><p>少侠将有机会在王府乱斗中扮演公孙剑与其他少侠合作对抗！</p><p>1、扮演条件：</p><p>1）地图上会随机刷新一些特殊神符，少侠获得神符后将会扮演公孙剑。</p><p>2）少侠在被击败后，将有机会直接扮演公孙剑。</p><p>&nbsp;</p><p>2、扮演时间：</p><p>1）少侠扮演公孙剑时，每次最多持续30秒。</p><p>2）少侠扮演公孙剑被击败时，将会结束扮演。</p><p>&nbsp;</p><p>3、公孙剑属性：</p><p>1）少侠扮演公孙剑时，将会继承属性和状态。</p><p>&nbsp;</p><p>4、公孙剑技能：</p><p>1）少侠扮演公孙剑时，将会获得特有的强力技能，但不能使用原有的技能。</p><p>&nbsp;</p><p><strong>天波府</strong></p><p>1、将领层部分将领的普通攻击调整为单体攻击。</p><p>&nbsp;</p><p><strong>缉拿</strong></p><p>1、非擒拿技能不再能击杀需要擒拿的逃犯。</p><p>&nbsp;</p><p>&nbsp;《天涯明月刀》项目组<br/><br/>3月15日</p>', '维护公告', 'http://localhost:8082/game-server/files/e5412dacfe084ef389815009c625aeb4', 'f5ffe55f0ddb479381d7a37344f88fbc', 'admin', '/files/74134e4b1e574546ac58bff3db3be42d', 0, '2022-03-16 07:14:52', '2022-04-03 16:19:11', 0, 1);
INSERT INTO `gf_post` VALUES (28, '【天涯明月刀】将张家界美景尽收囊中需要几步？', '<section><section><section><section><section><section></section></section><section><section><section><p><img src=\"http://localhost:8082/game-server/files/6b0a8e4c7e314a12931d3bdf9cd0057f\" contenteditable=\"false\" style=\"font-size: 14px; max-width: 100%;\"/></p><br/><p><strong>@ · 缓归</strong></p></section></section></section><section><p><br/></p></section><section><section><section><p>“嘿咻嘿咻…”刀娘今天迈着沉甸甸的步伐，又和少侠们见面了，哈？你问我为什么这么累？因为！刀娘今天是真正的照片搬运工～</p><p>近期刀娘沉浸在一位少侠的影集中无法自拨！这是一位集地图摄影、别业置景、和染色分享于一身的全才少侠<strong>@·缓归</strong>！刀刀自古出人才，这句话可不是随便说说的！呐，迫不及待将少侠的作品搬来要和大家分享了～</p></section></section></section></section></section><section><p><br/></p></section><section><section><section><section><section><section></section></section></section></section><section><section><section><p><strong>自搭景</strong></p></section></section><section><section><section><section><section><section></section></section></section></section><section><section><section><section></section></section></section></section><section><section><section><section></section></section></section></section><section><section><section><section></section></section></section></section></section></section></section><section><section><section><section></section></section></section></section></section></section><section><section><section><section><section></section></section></section><section><section><section></section></section></section></section></section><section><section><p>这组<strong>「桃源」</strong>是少侠的最新别业自搭作品，真的有“无丝竹之乱耳，无案牍之劳形”内味儿了！竹林搭配茅草还有流水与石桥，真的幽静又隐秘，再配上这恰到好处的大雾天气，想必住在这里的一定是位世外高人吧…</p></section></section><section><section><section></section></section><section><section><section><br/></section></section></section></section><section><section><section><section><section></section></section></section></section></section><section><section><section><section><section><br/></section></section></section></section></section><section><section><p>夜晚的<strong>「桃源」</strong>更显神秘，回归田园，大抵是一种超脱凡尘的心态，如果白天闯荡江湖是奔波与责任，那么夜晚归来，卸下一身盔甲，褪去满眼疲惫，在这里可以得到很好的放松，获得一种短暂的宁静和自由～</p></section></section><section><p><br/></p></section><section><section><section></section></section><section><section><section><br/></section></section></section></section><section><section><section><section><section><br/></section></section></section><section><section><section><br/></section></section></section></section></section><section><p>不仅会自搭景，还擅长用各种特别的角度去将这些场景记录下来，构图真的完美啊啊！这组明暗的对比在画面中形成了很强烈的视觉冲击，在黑夜的衬托下，主体就更加耀眼迷人了哇！（对没错，刀娘又在看美女子了！）不得不说少侠的搭建技术真不错！主调一致，搭配和谐，又是羡慕别人的一天…</p></section><section><section><section></section></section><section><section><section><br/></section></section></section></section><section><section><section><section><section></section></section></section></section></section><section><p><br/></p></section><section><section><section><section><section><section></section></section></section></section><section><section><section><p><strong>地图摄影</strong></p></section></section><section><section><section><section><section><section></section></section></section></section><section><section><section><section></section></section></section></section><section><section><section><section></section></section></section></section><section><section><section><section></section></section></section></section></section></section></section><section><section><section><section></section></section></section></section></section></section><section><section><section><section><section><section><br/></section></section></section><section><section><section><br/></section></section></section></section></section></section><section><section><section><section><section><section><section></section></section></section></section></section><section><section><section><p>左右滑动查看更多「云上之城」昼夜图集</p></section></section></section><section><section><section><section></section></section></section></section></section></section><section><p><br/></p><p><strong>「昼」</strong>是青山之巅古寨孤，苍穹之上旭日出。</p><p><strong>「夜」</strong>是犹记昔年红月时，风吹花落等人知。</p><p><br/></p><p>缓归少侠的这组<strong>「昼夜」</strong>，便是对<strong>「云上之城」</strong>最美的诠释～</p></section><section><p><br/></p><p>距离「云上之城」开启也有一段时日了，很多少侠都惊艳于云上之城的美景，云上之城地图的一大看点，便是植入了5A景区张家界的美景。还记得那段时间经常会收到少侠们分享的返图，并开启了<strong>#在天刀里逛张家界是什么体验#</strong>的话题。再联想到少侠们整天“窜上跳下”的探索地图…啊哈哈哈，抱歉还是没忍住！咳咳…回归正题！</p><p><br/></p><p>缓归少侠还将「云上之城」的美景化作一场梦境，在梦中，TA将带我们体验不一样的「云上之城」，快来看看，还有没有你没去过的地方吧</p></section><section><p><br/></p></section><section><section><p><button><i></i>，时长01:20</button></p><input/></section><p><strong></strong><br/></p></section><section><p>就像是做了一场梦，醒了很久还是很感动…刀娘沦陷了！真是太美了，有剧情、有画面、有音乐，真的好像在看微电影一样好吗！再一次为大佬折腰！</p><p><br/></p></section><section><section><section></section></section><section><section><section><br/></section></section></section></section><section><section><section><section><section><section><br/></section></section></section><section><section><section></section></section></section><section><section><section></section></section></section><section><section><section><br/></section></section></section><section><section><section></section></section></section><section><section><section><span style=\"font-size: 16px;\">左右滑动查看更多地图摄影图集</span></section></section></section></section></section></section><section><section><section><section><section><section></section></section></section></section></section></section><section><p>总是能拉到独特的视角，用精致的画面、别出心裁的构图以及巧妙的构思，带给我们些许震撼。这或许正是摄影的魅力吧！</p></section><section><p><br/></p></section><section><p><img src=\"http://localhost:8082/game-server/files/9ee62e1bd66847e191e5702203f457bb\" contenteditable=\"false\" style=\"font-size: 14px; max-width: 100%;\"/></p><br/></section><section><section><section><section><section><section></section></section></section></section><section><section><section><p><strong>染色分享</strong></p></section></section><section><section><section><section><section><section></section></section></section></section><section><section><section><section></section></section></section></section><section><section><section><section></section></section></section></section><section><section><section><section></section></section></section></section></section></section></section><section><section><section><section></section></section></section></section></section></section><section><p>前面还提到少侠的染色分享，本想一个人会摄影、会搭景就已经很棒棒了对不对！万万没想到，这位少侠的染色技术也是相当拿得出手的！这里跟大家分享一下，少侠的<strong>「催凤驾」</strong>染色，喜欢就赶紧收藏起来～</p></section><section><section><section><section><section><section><br/></section></section></section></section></section></section><section><section><section><section><section><section><section></section></section></section></section></section><section><section><section><p>左右滑动查看更多「催凤驾」染色方案</p></section></section></section><section><section><section><section></section></section></section></section></section></section><section><p>少侠真的是「深色系」爱好者了嘎嘎～这样的染色褪去了「催凤驾」的一丝华贵，而多了几分侠客气息，三种体型都是英气的！爱了爱了～</p></section><section><p><br/></p></section><section><p><br/></p></section><section><section><section><section><section><section></section></section></section></section><section><section><section><p><strong>采访记录</strong></p></section></section><section><section><section><section><section><section></section></section></section></section><section><section><section><section></section></section></section></section><section><section><section><section></section></section></section></section><section><section><section><section></section></section></section></section></section></section></section><section><section><section><section></section></section></section></section></section></section><section><p>这样才华横溢的少侠，刀娘绝不会放弃任何一个与之沟通交流的机会！毕竟…多学习多了解才能使自己进步！哈哈！所以刀娘有幸采访到了这位少侠，接下来奉上采访内容，让我们一起探一探吃什么长大，才能如此优秀吧！（认真脸）</p></section><section><section><section><section><section><section><section></section></section></section></section><section><section><section><section></section></section></section></section><section><section><section><section></section></section></section></section><section><section><section><section></section></section></section></section><section><section><section><section></section></section></section></section><section><section><section><section></section></section></section></section></section><section><section><section><section><section></section></section></section></section><section><section><section><section></section></section></section></section><section><section><section><section></section></section></section></section><section><section><section><section></section></section></section></section><section><section><section><section></section></section></section></section><section><section><section><section></section></section></section></section></section><section><section><section><section><section></section></section></section></section><section><section><section><section></section></section></section></section><section><section><section><section></section></section></section></section><section><section><section><section></section></section></section></section><section><section><section><section></section></section></section></section><section><section><section><section></section></section></section></section></section></section></section><section><section><section><section><section><section><section><p><strong>Q</strong></p></section></section></section></section><section><section><section><p><strong>小记者：请少侠先来段自我介绍吧！</strong></p></section></section></section></section><section><section><p><strong>缓归</strong><strong>：</strong>大家好，我是缓归，一位天刀截图选手、别业小景选手（大景控制不好，只能搭点小景），偶尔玩玩编辑器、摸点视频！</p></section></section><section><p><br/></p></section><section><section><section><section><section><p><strong>Q</strong></p></section></section></section></section><section><section><section><p><strong>小记者：看到少侠是去年十一月份才开始在微博超话里分享自己的刀刀截图，请问是去年才入坑的玩家吗？</strong></p></section></section></section></section><section><section><p><strong>缓归：</strong>其实2016年就已经入坑了！</p></section></section><section><p><br/></p></section><section><section><section><section><section><p><strong>Q</strong></p></section></section></section></section><section><section><section><p><strong>小记者：使用的DX12模式多还是64位模式多一些？</strong></p></section></section></section></section><section><section><p><strong>缓归：</strong>DX12会多一些，光影效果还是更胜一筹，而且也支持开光追！</p></section></section><section><p><br/></p></section><section><section><section><section><section><p><strong>Q</strong></p></section></section></section></section><section><section><section><p><strong>小记者：大大除了截图与别业玩法，平常还会玩些什么呀？</strong></p></section></section></section></section><section><section><p><strong>缓归：</strong>主要就是在玩这两个，有时会玩王府乱斗，因为整体节奏比较快。</p></section></section><section><p><br/></p></section><section><section><section><section><section><p><strong>Q</strong></p></section></section></section></section><section><section><section><p><strong>小记者：有在搭建别业的过程中，使用过咱们的心剑雕像吗？</strong></p></section></section></section></section><section><section><p><strong>缓归：</strong>看到了许多有趣的做法，有位玩家，把心剑物件，放在竹林场景里，配了些文字什么的，还蛮生动有趣（@一个大大大海的别业截图），有机会的话会尝试一下。</p></section></section><section><section><section><section><section><img src=\"https://mmbiz.qpic.cn/mmbiz_jpg/FAZwNcxVaFcYnnFV8TxGs6npNLunzMbeY3HfIWww8ywWUKkRO7rKzVLNSC7nP0tdQ1H2Ug6f4iaLfVBIwbgibgaA/640?wx_fmt=jpeg&amp;wxfrom=5&amp;wx_lazy=1&amp;wx_co=1\" alt=\"图片\"/></section></section></section><section><section><section><img src=\"https://mmbiz.qpic.cn/mmbiz_jpg/FAZwNcxVaFcYnnFV8TxGs6npNLunzMbe6a4yHp7BsoSfHvwH9Q7QVPI5oxkXlyfJrQcCORWXwL68kVFulmb0lw/640?wx_fmt=jpeg&amp;wxfrom=5&amp;wx_lazy=1&amp;wx_co=1\" alt=\"图片\"/></section></section></section></section></section><section><section><section><section><section><img src=\"https://mmbiz.qpic.cn/mmbiz_jpg/FAZwNcxVaFcYnnFV8TxGs6npNLunzMbeNia8Cy2jmr6iam1rXWZ3JSHELCsf8qiatbicajsOcQ1icbOO4SJdgXBibqNA/640?wx_fmt=jpeg&amp;wxfrom=5&amp;wx_lazy=1&amp;wx_co=1\" alt=\"图片\"/></section></section></section><section><section><section><img src=\"https://mmbiz.qpic.cn/mmbiz_jpg/FAZwNcxVaFcYnnFV8TxGs6npNLunzMbepWqruhGJmHnSibPqbOn1VNkiciamzrboryDLvadeJoaMoib0gldibAXB0OQ/640?wx_fmt=jpeg&amp;wxfrom=5&amp;wx_lazy=1&amp;wx_co=1\" alt=\"图片\"/></section></section></section></section></section><section><section><section><section><section><p><strong>Q</strong></p></section></section></section></section><section><section><section><p><strong>小记者：感觉每次大大发的截图，都有一种别致的质感，是纯截图吗，还是做过了一定的后期？</strong></p></section></section></section></section><section><section><p><strong>缓归：</strong>会进行一点点调色，不过也就只限于调色了，做的最多的，就是去把一些画面里感觉多余的东西裁掉，别的没有什么了。</p></section></section><section><p><br/></p></section><section><section><section><section><section><p><strong>Q</strong></p></section></section></section></section><section><section><section><p><strong>小记者：说起来大大发的图多以横构图为主却会竖着放，治好了我的颈椎病（不是），这是为什么呢？</strong></p></section></section></section></section><section><section><p><strong>缓归：</strong>感觉这是更好的展示方式，如果只是横屏的话，一些细节是容易被观看的人忽略掉的；一张图，以横屏的方式展示，<strong>感觉大家大部分都是用手机刷微博，很少有人会把一张图放大来看吧？所以上传之前都进行了旋转，想把图片的一些部分进行放大</strong>，虽然会对观看造成了一定的麻烦，比如需要歪脖子，或者旋转，是不太符合主流的看图方式，但我认为利是大于弊的。</p></section></section><section><p><br/></p></section><section><section><section><section><section><p><strong>Q</strong></p></section></section></section></section><section><section><section><p><strong>小记者：这是很细节的小想法啊~</strong></p></section></section></section></section><section><section><p><strong>缓归：</strong>也是值得这么去做的吧，自己后面也有考虑到这样观看有点...图片多的话，进行了一个拼合；不想歪脖子，又想看图的话，看长图就行，而需要看看细节，看看其他什么，看单张的图就行了！<strong>这个细节，也是自己在看其他摄影师作品学来的，最开始也觉得不习惯，后面这么一想，又觉得是值得的。</strong></p></section></section><section><p><br/></p></section><section><section><section><section><section><p><strong>Q</strong></p></section></section></section></section><section><section><section><p><strong>小记者：你每次分享一个视角代码&nbsp;///SetFOV10是什么小技巧吗？</strong></p></section></section></section></section><section><section><p><strong>缓归：</strong>这个是控制焦距的，选择10这个焦距，是因为在跟被拍摄物体同等距离下，它的区域相对于其他焦距，是很小的；也就意味着，<strong>能让我快速的反应过来，拍摄的主体是什么，同时减少一些杂物。</strong>每次都发，相当于一个关键词的设置？就是搜索【10】，差不多就能看到关于天刀的截图了！这个小技巧是从三问太太那里学习的，对她的截图印象也非常深刻，非常的具有江湖气息。</p></section></section><section><p><br/></p></section><section><section><section><section><section><p><strong>Q</strong></p></section></section></section></section><section><section><section><p><strong>小记者：看大大每次都有备注游戏时辰什么的 会特别根据时辰去截图吗？</strong></p></section></section></section></section><section><section><p><strong>缓归：</strong>最开始是有备注，就是单纯的记录而已；后面怕给别人造成误解认为，这个地点，只有这个天气、时辰，才能出片，其他就不行，也怕这也给自己一个下意识的反应。</p></section></section><section><p><br/></p></section><section><section><section><section><section><p><strong>Q</strong></p></section></section></section></section><section><section><section><p><strong>小记者：那会有感觉到什么时辰、天气截起来特别舒服吗？</strong></p></section></section></section></section><section><section><p><strong>缓归：</strong>个人比较喜欢，酉时、辰时这两个时间！比较舒服，光线也特别美！简单概况一下，就是日出日落的时候，表现会特别的美……天气的话，没有特别的注意，比较随缘吧。</p></section></section><section><p><br/></p></section><section><section><section><section><section><p><strong>Q</strong></p></section></section></section></section><section><section><section><p><strong>小记者：那除了桃源地图 有没有其他地图是自己比较偏好、尝试去多多截图的地图~？</strong></p></section></section></section></section><section><section><p><strong>缓归：</strong>襄州！然后就是幽夜城了……幽夜城可能是觉得，天气的变化不是很大？加上又是天刀后期推出的地图，光影效果什么的，肯定比老地图好，就比较偏向去。</p></section></section><section><p><br/></p></section><section><section><section><section><section><p><strong>Q</strong></p></section></section></section></section><section><section><section><p><strong>小记者：在大世界地图里日出日落的时间非常短暂，感觉是需要蹲蹲的。</strong></p></section></section></section></section><section><section><p><strong>缓归：</strong>可能这也是游戏实截的魅力？因为刀刀的天气，在大世界中，是只能靠玩家去蹲，<strong>也许时间到了，但是天气不行；也许天气可以了，时间又不行…就诸如此类的因素，但是！自己真正的截到了想要的图，又会觉得，在那苦苦蹲了好久，又是值得！</strong>因为在游戏里截图，就自然而然联想到了现实中的摄影师们！为了取景框里的那副画面，为了按下快门的那一瞬间，可以在那等待/蹲守很久，他们花费的不仅是时间、精力，还需要克服困难和挑战，甚至承受一定的压力，在多种压力干扰下依然能坚守，就特别佩服吧。</p><p>像《时与光年》的天刀旅拍，光影声色，非常的震撼，特别是最后的镜头分镜，印象太深了。</p></section></section><section><section><img src=\"data:image/gif;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVQImWNgYGBgAAAABQABh6FO1AAAAABJRU5ErkJggg==\" alt=\"图片\"/></section></section><section><section><img src=\"data:image/gif;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVQImWNgYGBgAAAABQABh6FO1AAAAABJRU5ErkJggg==\" alt=\"图片\"/></section></section><section><section><img src=\"https://mmbiz.qpic.cn/mmbiz_jpg/FAZwNcxVaFcYnnFV8TxGs6npNLunzMbeVebswUYRwS5knYhVvA9DVZwVWQNlcL49UKmcaoW77hPjEw8NaJDoLQ/640?wx_fmt=jpeg&amp;wxfrom=5&amp;wx_lazy=1&amp;wx_co=1\" alt=\"图片\"/></section></section><section><section><section><section><section><p><strong>Q</strong></p></section></section></section></section><section><section><section><p><strong>小记者：从聊天的感觉来看，大大也比较关注咱们其他同人作者们的分享？</strong></p></section></section></section></section><section><section><p><strong>缓归：</strong>其实是能感觉到天刀在同人这方面是重视的，也希望能有更多的小伙伴们一起玩的。平常看到超话里有合作产出这块，一把子羡慕了。比如彤花顺和终有茶的染色联动。</p></section></section><section><section><section><section><section><img src=\"https://mmbiz.qpic.cn/mmbiz_jpg/FAZwNcxVaFcYnnFV8TxGs6npNLunzMbeJWXiclQgXBFzOcLibkZdMarCiaNkgeo9xGasTkOnnzEc8oKYCOOuuBJ6w/640?wx_fmt=jpeg&amp;wxfrom=5&amp;wx_lazy=1&amp;wx_co=1\" alt=\"图片\"/></section></section></section><section><section><section><img src=\"https://mmbiz.qpic.cn/mmbiz_jpg/FAZwNcxVaFcYnnFV8TxGs6npNLunzMbeNLjQrfQVUQeUPeYDpIgENphF1tNR5iaphsobxwT4AJ62maq1Q59NmQg/640?wx_fmt=jpeg&amp;wxfrom=5&amp;wx_lazy=1&amp;wx_co=1\" alt=\"图片\"/></section></section></section></section></section><section><p>合作染色作品《以花之名&nbsp;绘染天涯》，作者：彤花顺 x 终有茶</p></section><section><p><br/></p></section><section><section><section><section><section><p><strong>Q</strong></p></section></section></section></section><section><section><section><p><strong>小记者：（各位少侠看到小记者的眼神暗示了吗？快来和大大一起玩！）咱们体服的【馥郁之忆】即将开启，少侠会去体验吗？</strong></p></section></section></section></section><section><section><p><strong>缓归：</strong>当然！截图党必冲！</p></section></section></section></section><section><p><br/></p></section><section><p><br/></p></section><section><section><section><section><section><section></section></section></section></section><section><section><section><p><strong>云城景</strong></p></section></section><section><section><section><section><section><section></section></section></section></section><section><section><section><section></section></section></section></section><section><section><section><section></section></section></section></section><section><section><section><section></section></section></section></section></section></section></section><section><section><section><section></section></section></section></section></section></section><section><section><p>截止发稿，咱们的体服已经能率先体验到<strong>【馥郁之忆】</strong>了，让我们一起来欣赏一波大大的截图作品吧！</p></section></section><section><section><img src=\"https://mmbiz.qpic.cn/mmbiz_jpg/FAZwNcxVaFcYnnFV8TxGs6npNLunzMbezfoLBlMCOka4I2JrHpauDQAUSSE4yiaaM4G1ee6E2NjQfClMS2FEQxw/640?wx_fmt=jpeg&amp;wxfrom=5&amp;wx_lazy=1&amp;wx_co=1\" alt=\"图片\"/></section></section><section><section><img src=\"https://mmbiz.qpic.cn/mmbiz_jpg/FAZwNcxVaFcYnnFV8TxGs6npNLunzMbeb580pFJ0GM00y025hITgl1FU7E1pDv9GTV4icRqJ7fXISF9Ufj2U29A/640?wx_fmt=jpeg&amp;wxfrom=5&amp;wx_lazy=1&amp;wx_co=1\" alt=\"图片\"/></section></section><section><section><img src=\"https://mmbiz.qpic.cn/mmbiz_jpg/FAZwNcxVaFcYnnFV8TxGs6npNLunzMbegVjf9l4JLxzQhibDamSVibLFTMbnZerRCeoROMYXg7JHJ5A99KrlsqfA/640?wx_fmt=jpeg&amp;wxfrom=5&amp;wx_lazy=1&amp;wx_co=1\" alt=\"图片\"/></section></section><section><section><img src=\"data:image/gif;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVQImWNgYGBgAAAABQABh6FO1AAAAABJRU5ErkJggg==\" alt=\"图片\"/></section></section><section><section><img src=\"https://mmbiz.qpic.cn/mmbiz_jpg/FAZwNcxVaFcYnnFV8TxGs6npNLunzMbea73icNxCOqWBxic0aAPn8cRsSsmp1Cm9xtniafHk3iaItzyUbuCmf7CUFA/640?wx_fmt=jpeg&amp;wxfrom=5&amp;wx_lazy=1&amp;wx_co=1\" alt=\"图片\"/></section></section><section><section><img src=\"https://mmbiz.qpic.cn/mmbiz_jpg/FAZwNcxVaFcYnnFV8TxGs6npNLunzMbew4iaAkgYOlrnT42ySibViapKFALNcaHtkH1828AqzibhaUfalxHicqQ1f7g/640?wx_fmt=jpeg&amp;wxfrom=5&amp;wx_lazy=1&amp;wx_co=1\" alt=\"图片\"/></section></section><section><p><strong>「馥郁之忆」</strong>将会在1月下旬在正式服与大家见面！让我们狠狠的期待一下吧！ξ( ✿＞◡❛)</p></section><section><section><section></section></section><section><section><section><img src=\"https://mmbiz.qpic.cn/mmbiz_svg/NoFChqEQomFjEIE1l5wbIvepEwibQSwgxwttQF4FBJ7lFuoWD8rEibSD3g8ibBRvjib4eiabzSzMGqbauNgrhubszII7euNicjXkBH/640?wx_fmt=svg&amp;wxfrom=5&amp;wx_lazy=1&amp;wx_co=1\" alt=\"图片\"/></section></section></section></section><section><p><br/></p></section><section><section><section><section><section><section><section><section></section></section></section></section><section><section><section><section></section></section></section></section></section></section><section><p>好啦！今日份的才华横溢小少侠刀娘就为大家引荐到这里咯！后续刀刀也会继续优化DX12，给少侠们带更多有趣新奇的玩法和体验！当然！不要忘记给刀娘爱的三连哦！</p></section></section></section><section><section><section></section></section></section><section><p><br/></p></section></section><p><br/></p></section><section><section><section><br/></section></section></section><section><section><section></section></section></section>', '天涯明月刀 活动', 'http://localhost:8082/game-server/files/e5412dacfe084ef389815009c625aeb4', 'f5ffe55f0ddb479381d7a37344f88fbc', 'admin', '/files/74134e4b1e574546ac58bff3db3be42d', 0, '2022-03-16 07:19:06', '2022-04-03 16:10:51', 2, 1);
INSERT INTO `gf_post` VALUES (29, '【王者荣耀】活动1', '<p><strong>票次数资格：</strong></p><p>&nbsp; &nbsp; &nbsp; &nbsp;每个账号每日最多可获得3次投票机会，该账号下所有达到30级的角色共用3次投票机会，如果当日已使用3次投票机会，切换游戏角色再完成单个任务也无法获得新的投票机会。</p><p>&nbsp; &nbsp; &nbsp; &nbsp;举个例子，某账号下拥有角色A及角色B，角色A对3个作品完成了投票后，切换至角色B时，【登录活动页面】任务状态为“已完成”，但再次投票时，依然会提示：您今日的投票次数已用完～。</p><p>&nbsp;</p><p><strong>奖励领取资格：</strong></p><p>&nbsp; &nbsp; &nbsp; &nbsp;最终投票环节首次投票将获得限时活动语音，每个账号仅可领取1次，且奖励会发放至进行首次投票的游戏角色下。</p><p>&nbsp; &nbsp; &nbsp; &nbsp;举个例子，某账号下拥有角色A及角色B，角色A进行了首次投票后，语音礼包将直接发放至角色A的游戏邮箱，切换至角色B时，角色B无法再次领取该奖励。</p><p>&nbsp; &nbsp; &nbsp; 如果是在游戏外的链接中领取奖励，则会发放至绑定角色的游戏邮箱中。</p>', '抽奖公告', 'http://localhost:8082/game-server/files/4742fb1df2b6452a8961225f0268425e_王者荣耀-特工魅影.jpeg', 'f5ffe55f0ddb479381d7a37344f88fbc', 'admin', '/files/74134e4b1e574546ac58bff3db3be42d', 0, '2022-03-31 05:44:09', '2022-04-03 16:17:09', 0, 1);
INSERT INTO `gf_post` VALUES (30, '4月1号11', '<p>435</p>', '减肥了', NULL, '88a7e7de0b274c2aa438640aea31652d', 'kkkk', '/files/8e752c9629084a8d92bcedc76df1433d', 0, '2022-03-31 07:31:12', '2022-03-31 15:32:50', 1, 1);
INSERT INTO `gf_post` VALUES (31, 'Instagram 发帖指南： 20个创意增添帖子趣味', '<nav><ol><li><a href=\"https://www.shopify.cn/\">主页</a><p><use></use></p></li>&nbsp;<li><a href=\"https://www.shopify.cn/blog\">Shopify 博客</a><p><use></use></p></li>&nbsp;<li>Instagram 发帖指南： 20个创意增添帖子趣味</li></ol></nav><header><h1>Instagram 发帖指南： 20个创意增添帖子趣味</h1><ul><li>作者：<a href=\"https://www.shopify.cn/blog/search?link_search=true&amp;q=Shopify+%E5%AE%98%E6%96%B9\">Shopify 官方</a></li>&nbsp;<li><a href=\"https://www.shopify.cn/blog/topics/get-started\">新手上路</a></li></ul><ul><li><time>2021年3月17日</time></li>&nbsp;<li>需阅读 8 分钟</li></ul></header><figure><img alt=\"Instagram 发帖指南\" src=\"https://cdn.shopify.com/s/files/1/0262/9812/2262/articles/960d31dc159bd21df3667ad762458aeb_3277d296-b0c0-407f-871b-947b2f434daa.png?format=webp&amp;v=1615804664&amp;width=1024\"/></figure><p>毫无疑问，许多小型企业主应该通过&nbsp;<a href=\"https://www.shopify.com/blog/instagram-marketing\" target=\"_blank\">Instagram 营销</a>建立自己的形象。</p><p>但故事总是一样的：企业主注册了 Instagram 帐号并创建了个人资料，但是他们遇到了阻碍，不确定自己到底应该发布什么。</p><p>在 Instagram 上生成稳定的内容流可能是一件很困难的事，尤其是当市场营销公司 Buffer 的研究表明，你应该每天<a href=\"https://blog.bufferapp.com/how-often-post-social-media\" target=\"_blank\">至少发布1.5次</a>以迎合&nbsp;<a href=\"https://www.shopify.com/blog/instagram-algorithm\" target=\"_blank\">Instagram 算法</a>。</p><p>不过好消息是，有很多不同的方法来使你的 Instagram 动态保持新鲜感，并让你的关注者参与其中。</p><p>本文我们将讨论应该在 Instagram 上发布什么，并提供一些想法和示例，你可以根据自己的业务进行调整。我们还将探讨如何创建一个发帖时间表，以实施你的 Instagram 营销策略，甚至还有一些如何通过推广你的产品<a href=\"https://www.shopify.cn/blog/make-money-on-instagram\" target=\"_blank\">在 Instagram 上赚钱</a>的创意。</p><p>&nbsp;</p><h3>20个最佳 Instagram 发帖创意</h3><p>作为一个平台 ，Instagram 提供了大量与目标受众建立并培养关系的可能，以及将他们转化为顾客的功能。</p><p>因此，在 Instagram 用户的不同客户旅程阶段，将吸引他们的内容组合起来是很重要的。例如：</p><ul><li>鼓舞人心的语录可以让新用户对你的帖子发表评论并关注你的帐号。</li><li>产品标签和贴纸可以转化已经准备好马上购买的关注者。</li><li>幕后视频可以鼓励忠诚顾客的复购和支持。</li></ul><p>因此请记住每个发帖创意如何有助于你的社交媒体目标（参与度、销售等），我们将在下面分析它们。</p><h4>1. 产品展示帖子</h4><ol></ol><p>高质量的产品图片和<a href=\"https://www.shopify.com/blog/instagram-video\" target=\"_blank\">视频</a>可能是在 Instagram 上最容易（也是最受期待）开始的方法之一。分享产品亮点的特色内容，必然有助于你在 Instagram 上推动销售，促进业务发展。</p><p>在为你的动态拍摄产品时，应该避免让他们看起来像广告。理想情况下，在一个有吸引力同时又相关的背景里展示你的产品，以便你的受众可以代入自己。</p><p>你还需要包含丰富有趣的标题，而不只是产品名和几个流行的&nbsp;<a href=\"https://www.shopify.cn/blog/instagram-hashtags\" target=\"_blank\">Instagram 标签</a>。</p><p>相反，你可以把一篇帖子看作推销一款产品的机会，讨论其特点和好处，或者强调其特别之处。</p><p><a href=\"https://www.instagram.com/clocksandcolours/?hl=en\" target=\"_blank\">Clocks And Colours</a>&nbsp;在下面的图片中做得很好。</p><p><img src=\"http://localhost:8082/game-server/files/8d7a40f09462478cb4a0cbae9ff8c89c\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '111', NULL, '87e10bfcc9714fb296a01b6f1c19463d', 'fan1', '/files/619d7dd8836c4fcb878de8941a5c750e', 0, '2022-04-01 07:52:37', '2022-04-03 15:41:23', 0, 1);
INSERT INTO `gf_post` VALUES (32, '货币转换器简介和好用工具推荐', '<p>近些年来，越来越多的品牌以<a href=\"https://zh.shopify.com/blog/shopify-markets\" target=\"_blank\">全球化发展</a>作为品牌出海的战略发展目标。在品牌纷纷将视野转向海外，拥抱市场全球化时，首先面临的难点就是货币转换问题。货币转换通常发生在交易期间，例如入账付款、发放退款或收到退款时。<a href=\"https://zh.shopify.com/blog/how-branded-website-help-your-business-sell-to-the-international\" target=\"_blank\">全球化品牌官网</a>如果仅简单采用默认货币设置，难免会造成货币默认地区与买家所在地有冲突的现象，从而导致买家在浏览<a href=\"https://zh.shopify.com/blog/pricing-strategies\" target=\"_blank\">产品价格</a>时产生不良的体验感。因此，一个可以带来本土化体验感的货币转化功能是提高品牌力的重要环节。</p><p>对于 Shopify&nbsp;商家来说，将您的&nbsp;<a href=\"https://zh.shopify.com/blog/google-seo\" target=\"_blank\">Shopify</a>&nbsp;在线商店货币进行转换总共有两种方法：直接使用Shopify 内置货币转换器，在后台设置货币转换或者下载<a href=\"https://apps.shopify.com/search?q=%E8%B4%A7%E5%B8%81%E8%BD%AC%E6%8D%A2%E5%99%A8+&amp;locale=zh-CN\" target=\"_blank\">应用商店中的货币转换器 APP</a>。本篇文章将介绍如何使用 Shopify 进行货币转化以及相关货币转换器推荐。</p><p>&nbsp;</p><h2>Shopify 后台直接设定货币转换</h2><p>如果您的 Shopify 网店已经对接了&nbsp;<a href=\"https://zh.shopify.com/payments\" target=\"_blank\">Shopify Payments&nbsp;</a>收款，则可直接在 Shopify 后台操作。商家可自行选择设定自动汇率转换和手动汇率转换两种类型。</p><ul><li><h3>自动汇率转换</h3></li></ul><h4>自动汇率转换使用条件</h4><p>Shopify 商店内含有 Shopify Payments 收款方式。</p><h4>启动自动汇率转换步骤</h4><p>商家通过向模板中添加国家/地区选择器，以便客户可以选择所在国家和地区，然后您的商店便可以显示他们的当地货币。完成此项操作后，客户可以从您添加到 Shopify Payments 设置中的国家和地区下拉列表中选择他们的国家以及地区。当地货币也会在每个国家/地区旁边的下拉列表中显示。</p><h4>自动汇率价格计算方式</h4><p>商店价格乘以货币转换率，加上转换费（转换费以地区为衡量标准，美国地区为转换费&nbsp;1.5&nbsp;%，世界其他国家和地区为 2 %）。</p><h4>自动汇率转换费用由顾客承担</h4><p>默认情况下，<a href=\"https://help.shopify.com/zh-CN/manual/payments/shopify-payments/multi-currency/conversions\" target=\"_blank\">货币转换</a>率和转换费显示在商家的款项详细信息中。计算出货币转换费之后，该费用会包含在客户的价格中。</p><h4>自动汇率转换优缺点</h4><ul><li><h4>优点</h4></li></ul><p>汇率根据<a href=\"https://zh.shopify.com/blog/introduction-to-aliexpress\" target=\"_blank\">国际</a>市场汇率标准实时调整，商家收到的支付金额按照商家向客户信用卡收费时的货币汇率进行计算。可以保证产品的实际销售价格以及实际利润，可控性强。</p><ul><li><h4>缺点</h4></li></ul><p>使用自动收款时，商家无法以不同货币手动设置产品价格。因此，商店内产品的价格会随着国际汇率的波动而改变。这一定程度上可能会影响<a href=\"https://zh.shopify.com/blog/best-ecommerce-sites\" target=\"_blank\">网站</a>的复购率以及观望下单的顾客的成交几率。</p><ul><li><h3>手动汇率转换</h3></li></ul><h4>手动汇率转换使用条件</h4><ul><li><p>Shopify 商店已对接 Shopify Payments 收款方式</p></li><li><p>商家使用 Shopify 、 Advanced Shopify 和 Shopify Plus 套餐</p></li></ul><h4>启用手动费率转换步骤</h4><p>登录&nbsp;Shopify 后台，点击设置&nbsp;&gt;&nbsp;付款&nbsp;&gt; Shopify Payments &gt;管理&nbsp;&gt;&nbsp;在国家/地区部分&nbsp;&gt;&nbsp;编辑的国家/地区旁边的编辑&nbsp;&gt;&nbsp;在汇率部分中，点击要编辑的货币旁边的编辑&nbsp;&gt;&nbsp;使用手动费率&nbsp;&gt;&nbsp;保存，即可完成调整。</p><h4>自动汇率价格转换计算方式</h4><p>自动汇率价格转换中商品的汇率由商家设定，且价格转换后不包含转换费。</p><p>价格转换方法为：商店价格乘以商家设定的转换汇率。</p><h4>手动汇率转换费用由商家承担</h4><p>如果您手动设置货币汇率，则默认情况下，转换费不会包含在客户的价格中。</p><h4>手动汇率转换优缺点</h4><ul><li><h4>优点</h4></li></ul><p>这可让您为已启用的每种货币锁定一个固定汇率，并且无需担心汇率波动。您的价格不会随<a href=\"https://zh.shopify.com/blog/niche-markets\" target=\"_blank\">市场</a>汇率而变化。</p><ul><li><h4>缺点</h4></li></ul><p>从进行授权到商家手动入账资金期间，货币汇率可能发生变化，这可能导致金额产生小幅度的差异。商家会因与当前市场汇率的差异而获利或亏损。</p><ul><li><h3>附加：自定义舍入规则和 Geolocation 应用</h3></li></ul><h4>自定义舍入规则提供转化后价格结尾设定功能</h4><p>当商家以多种货币进行销售时，汇率转换可能导致产品价格和<a href=\"https://zh.shopify.com/blog/shipping-and-fulfillment\" target=\"_blank\">运费</a>的价格结尾不一致。</p><p>自定义舍入规则让您能够设定转换后价格和运费的结尾形式。例如，您可以选择让所有<a href=\"https://zh.shopify.com/blog/black-friday-but-make-it-epic-shopify-merchants-break-records-with-29-billion-in-sales\" target=\"_blank\">美元</a>价格以 0.99 美元结尾，所有欧元价格以 0.90 欧元结尾。转换后的价格和运费可能随货币兑换市场波动，而自定义舍入规则有助于您的价格保持稳定。自定义舍入规则设置如下：</p><ul><li><p>在&nbsp;Shopify 后台中，转到设置&nbsp;&gt;&nbsp;付款</p></li><li><p>在&nbsp;Shopify Payments&nbsp;部分中，点击管理</p></li><li><p>在国家/地区部分，对舍入点击启用</p></li><li><p>点击要编辑的国家/地区旁边的编辑</p></li><li><p>在汇率部分中，点击要编辑的货币旁边的编辑</p></li><li><p>选择新的价格舍入规则，为转换后的价格和运费提供自定义价格结尾</p></li><li><p>点击保存</p></li></ul><h4>Geolocation 应用提供语言转换功能</h4><p>Geolocation 应用可根据客户的地理位置和浏览器或设备语言为其提供语言和国家/地区建议。它还提供在您的在线商店页脚中显示国家/地区和语言选择器的选项，以供客户选择其语言以及国家/地区。客户可以接受建议，也可以使用国家/地区选择器以其首选语言浏览您的商店，并基于所选国家/地区以其首选货币<a href=\"https://zh.shopify.com/blog/shop-pay-becomes-first-shopify-product-to-extend-beyond-shopify-merchants-soon-available-to-any-business-selling-on-facebook-and-google\" target=\"_blank\">进行结账</a>。Geolocation 应用安装方法如下：</p><ul><li><p>转到 Shopify 应用商店中的&nbsp;<a href=\"https://apps.shopify.com/geolocation\" target=\"_blank\">Geolocation</a>&nbsp;应用页面。</p></li><li><p>点击添加应用。如果您未登录 Shopify 账户，则系统会提示您登录。</p></li><li><p>点击安装应用。</p></li></ul>', '``1', NULL, '87e10bfcc9714fb296a01b6f1c19463d', 'fan1', '/files/619d7dd8836c4fcb878de8941a5c750e', 0, '2022-04-01 14:05:53', '2022-04-03 15:42:34', 0, 0);
INSERT INTO `gf_post` VALUES (33, '跨境物流趋势解析：疫后新常态迎来发展拐点', '<p>货物的运送与流动就一直是发展的硬需求。从最初部落与部落，村与村之间的货物流演变到如今国与国之间的跨境配送，物流的发展也跟随着时代的进程迭代更新。现如今，经济技术的发展和国际经济往来的日益扩大，贸易伙伴遍布全球，物流国际化趋势成发展的必然进程。物流无国界，广泛的开展国际物流合作是促进世界经济繁荣必不可少的要素。</p><p>&nbsp;</p><h2>跨境物流简介</h2><h3>什么是跨境物流？</h3><p><a href=\"https://baike.baidu.com/item/%E8%B7%A8%E5%A2%83%E7%89%A9%E6%B5%81/50925436\" target=\"_blank\"><strong>跨境物流</strong></a>为在<a href=\"https://zh.shopify.com/blog/ecommerce-business-blueprint\" target=\"_blank\">电子商务</a>环境下，依靠互联网、大数据、信息化与计算机等先进技术，物品从跨境电商企业流向跨境消费者的跨越不同国家或地区的物流活动。</p><p>直邮和海外仓为跨境电商出口主要途径</p><p>跨境电商出口物流业务模式各有不同，但其核心出发点是为了帮助<a href=\"https://zh.shopify.com/blog/traditional-foreign-trade-and-cross-border-ecommerce\" target=\"_blank\">跨境电商平台</a>实现对货物运输环节的管控以及改善优化海外消费者消费体验。&nbsp;目前我国跨境电商的<a href=\"https://zh.shopify.com/blog/export-taxes\" target=\"_blank\">出口</a>主要通过直邮和<a href=\"https://zh.shopify.com/blog/overseas-warehouse-for-cross-border-brands\" target=\"_blank\">海外仓</a>两种途径：</p><ul><li><h4>直邮业务</h4></li></ul><p>直邮业务是跨境物流服务商完成跨境电商件门到门/门到仓全流程跨境物流环节。</p><ul><li><h4>海外仓模式</h4></li></ul><p>海外仓模式以备货模式为主，跨境物流服务商通过将跨境电商件运至目的国的仓库后，如果目的国有相关商品的订单，再通过目的国物流服务商由海外仓直发海外消费者。</p><p>&nbsp;</p><h2>国际物流五大快递公司</h2><ul><li><h3>EMS</h3></li></ul><p>邮政特快专递服务。它是由万国邮联管理下的国际邮件快递服务，是中国邮政提供的一种快递服务。主要是采取空运方式，加快递送速度，根据地区远近， 1&nbsp;-&nbsp;8 天到达。该业务在海关、航空等部门均享有优先处理权、它以高速度、高质量为用户传递国际、国内紧急信函、文件资料、金融票据、商品货样等各类文件资料和物品。</p><ul><li><h3>DHL</h3></li></ul><p>中外运-敦豪国际航空快件有限公司是由全球快递物流业的领导者<a href=\"https://zh.shopify.com/blog/how-to-use-dhl-to-track-package\" target=\"_blank\">&nbsp;DHL</a>&nbsp;与中国对外贸易运输集团总公司各注资 50%&nbsp;于 1986 年成立，是中国成立最早、经验最丰富的国际航空快递公司。作为德国邮政全球网络旗下的知名品牌。 DHL 的服务网络覆盖全球 220 多个国家和地区，在全球拥有 285,000 名员工，为客户提供快捷、可靠的专业化服务。</p><ul><li><h3>UPS</h3></li></ul><p>起源于 1907 年在美国西雅图成立的一家信差公司，以传递信件以及为零售店运送包裹起家。由于以“最好的服务、最低的价格”为业务原则，逐渐在整个美国西岸打开局面。到 30 年代，UPS 的服务已遍布所有西部大城市，并开发了第一个机械包裹分拣系统。50 年代，UPS 取得了“公共运输承运人”的权利，将自己的包裹递送业务从零售店扩展到普通居民，从而成为美国邮政的直接<a href=\"https://zh.shopify.com/blog/competitive-analysis\" target=\"_blank\">竞争</a>对手。</p><ul><li><h3>FEDEX</h3></li></ul><p>联邦快递是全球最具规模的快递运输公司 ，为全球超过 235 个国家及地区提供快捷、可靠的快递服务。联邦快递设有环球航空及陆运网络，通常只需一至两个工作日，就能迅速运送时限紧迫的货件，而且确保准时送达。</p><ul><li><h3>TNT</h3></li></ul><p>全球领先的快递和邮政服务提供商，总部设在荷兰。 TNT 快递成立于 1946 年，其国际网络覆盖世界 200 多个国家，提供一系列独一无二的全球整合性物流解决方案。此外， TNT 还为澳大利亚以及欧洲、亚洲的许多主要国家提供业界领先的全国范围快递服务。</p><p>&nbsp;</p><p><img alt=\"国际海运\" src=\"https://cdn.shopify.com/s/files/1/0262/9812/2262/files/2_faa1fa50-b9b4-477b-9c50-9741186b6409.jpg?v=1644307815\"/></p><h5>游轮载满中国制造出口的货物运输到海外</h5><p>&nbsp;</p><h2>加持：国家相关政策成跨境物流发展护城河</h2><ul><li><h3>国家政策支持，跨境电商行业的迅猛发展</h3></li></ul><p>外贸作为拉动我国经济增长的三架马车之一，正在随着全球互联网的不断普及，发生新的业态变化。传统的外贸服务向综合型的跨境电商角色演变，跨境电商正在成为我国进<a href=\"https://zh.shopify.com/blog/ddp-vs-dtc\" target=\"_blank\">出口贸易</a>往来的重要途径。在此背景下，我国政府通过一系列政策来扶持跨境电商行业。 2018 年以来，我国正视跨境物流体系作为促进我国外贸高质量发展的重要基础设施地位，为跨境物流企业提供多元化、低成本、高时效运力。*</p><h2>疫情对跨境物流行业带来双重影响</h2><ul><li><h3>疫情提高海外电商渗透率</h3></li></ul><p>2020 年的新冠<a href=\"https://zh.shopify.com/blog/introduction-to-aliexpress\" target=\"_blank\">疫情</a>为全球经济发展带来冲击，但同时却凸显了跨境电商的优势。 疫情是消费模式变化的催化剂。由于多国出台外出限制令，迫使海内外消费者消费结构由线上转移到线下，进一步促使全球电子商务渗透率和销售额不断提升。海外制造业复苏遭遇持续收阻，供应能力尚未完全恢复，中国得益于强有力的疫情管控政策，国内产能得到最大化恢复。通过中国购买商品的需求提高从而带动跨境物流需求上涨的影响，促进了跨境物流行业的发展。</p><ul><li><h3>疫情促进跨境物流费用上涨</h3></li></ul><p>受新冠疫情爆发并快速在全球蔓延影响，跨境出口物流链路中的干线运输运力和尾程配送能力无法满足因疫情影响带来的线上消费需求的快速攀升。疫情还使得跨境物流运力大幅下降，致使运力成本提高，这促使物流服务费用上涨。</p>', '1133', NULL, '87e10bfcc9714fb296a01b6f1c19463d', 'fan1', '/files/619d7dd8836c4fcb878de8941a5c750e', 0, '2022-04-01 14:13:06', '2022-04-03 15:43:20', 0, 0);
INSERT INTO `gf_post` VALUES (34, '晓觅晨星炫酷开启 神魔夜行共赢好礼', '<h2><p>这大概是近期非常炫酷的一次活动了！神魔夜行 晓觅晨星超炫的夺宝活动开启啦！本次活动时间为2022年3月30日至2022年4月24日。<a href=\"https://act.daoju.qq.com/act/a20220304star/index.html\">参加戳我</a></p><p>&nbsp;<img src=\"https://shp.qpic.cn/cfwebcap/0/0aa90015de7b35b375c090e98064890b/0/?width=749&amp;height=377\" alt=\"\" title=\"\" style=\"\"/></p><p>这也是一个拥有多重奖励的超值活动——<strong>一是</strong>可以使用钥匙开启宝箱夺宝获得丰厚奖励；<strong>二是</strong>可以通过夺宝累积幸运值以获取相应档位奖励；<strong>三是</strong>累计夺宝数到达相应档位后可以领取满次奖励；<strong>四是</strong>通过夺宝和幸运值奖励获取的蔷薇币，兑换珍惜奖励。</p><p><strong>一、钥匙获取</strong></p><p>&nbsp;<img src=\"https://shp.qpic.cn/cfwebcap/0/54321daef1383fb7e86ca2423f49095c/0/?width=815&amp;height=271\" alt=\"\" title=\"\" style=\"\"/></p><p>可以通过购买相应数额的碎银礼包进而获赠宝箱钥匙。还能够通过活动期间周活跃度满1000获赠1把钥匙（单角色限1次，单Q限3次）。此外，活动期间，每天登录1次活动页面甚至还能获赠1把钥匙（单Q每天限1次，总限领3次）。也就是说，一共赠送给诸位少侠4把钥匙喔。当然，道聚城兑换钥匙也是开启的：登录掌上道聚城进入天刀礼包中心，玩家在活动页面购买60Q币礼包后可额外使用聚豆兑换1把宝箱钥匙，单Q限1次。</p><p><strong>二、夺宝奖励</strong></p><p>当然要先来看夺宝奖励啦——每次开箱夺宝将消耗对应数量的“宝箱钥匙”，随机获得宝箱中的一种奖励，必得1枚蔷薇币，同时获得2~4点幸运值。</p><p>奖励内容及概率如下：</p><p>&nbsp;<img src=\"https://shp.qpic.cn/cfwebcap/0/21689a4c2a9f42feb2ccff9b8314bbc8/0/?width=391&amp;height=550\" alt=\"\"/></p><p>各幸运值获得也是有概率哒，50%获得2、35%获得3、15%获得4，如此看来，每次夺宝的幸运值期望是<strong>2.65</strong>。</p><p><strong>三、累计开箱奖励</strong></p><p>&nbsp;<img src=\"https://shp.qpic.cn/cfwebcap/0/1babec53da4970b2999b2e3cddef32e7/0/?width=818&amp;height=176\" alt=\"\" title=\"\" style=\"\"/></p><p>开启宝箱的满次奖励丰厚得很，不仅有大量宝箱钥匙，更有随心染匣、冷烟花和限定头顶图案喔！</p><p><strong>四、幸运值奖励</strong></p><p>&nbsp;<img src=\"https://shp.qpic.cn/cfwebcap/0/5fa1be05fe86b6fc66dfcada72f20e86/0/?width=665&amp;height=961\" alt=\"\"/></p><p>我们充分考虑开箱次数累积奖励相关情况，将幸运值奖励的获取次数期望与花费期望进行计算：</p><p>&nbsp;<img src=\"https://shp.qpic.cn/cfwebcap/0/acc3173f3869526e57101c953c226d6f/0/?width=797&amp;height=437\" alt=\"\"/></p><p>此表格将非充值获取的5个钥匙和充值qb97折纳入计算。第4、5档奖励是没有蔷薇币的呐，不过，奖励都是超丰厚的！</p><p><strong>五、蔷薇币兑换商店</strong></p><p>&nbsp;<img src=\"https://shp.qpic.cn/cfwebcap/0/d24d549ab87fd68d8ee6d89b8d6f1f3a/0/?width=806&amp;height=445\" alt=\"\"/></p><p>&nbsp;<img src=\"https://shp.qpic.cn/cfwebcap/0/5bc3e7784dc089761d05aeb6ffb616fd/0/?width=834&amp;height=461\" alt=\"\"/></p><p>&nbsp;<img src=\"https://shp.qpic.cn/cfwebcap/0/d0d4e0d7d07684ed68a4bb1af7e54e11/0/?width=794&amp;height=438\" alt=\"\"/></p><p>在分析幸运值奖励的时候，我们为诸位少侠计算了蔷薇币的获取期望，诸位少侠在参加活动的时候不妨先行估算希望达到的轮数。最超值的道具要数金色混沌1级琅纹自选啦！染发自选礼盒也都蛮不错呐。冶玲珑·焰非常值得一换，梅蕊之卷就略显贵了。这里不建议诸位少侠兑换紫色神兵——飞刀、黑刀、百晓生、千人千面的价位都偏高，血衣蛊、无风悲鸣都是能够通过代币兑换的哦！</p><dl><dt>相关新闻</dt><dd><ul><li><a href=\"https://wuxia.qq.com/news_detail.html?newsid=15745023\" target=\"_blank\">S7赛季天涯战令每周任务一览</a></li><li><a href=\"https://wuxia.qq.com/news_detail.html?newsid=15733396\" target=\"_blank\">天地惊雷s4四强已出 血雨腥风谁主沉浮</a></li><li><a href=\"https://wuxia.qq.com/news_detail.html?newsid=15731666\" target=\"_blank\">全新S7赛季天涯战令！奖励速报！</a></li><li><a href=\"https://wuxia.qq.com/news_detail.html?newsid=15718164\" target=\"_blank\">天地惊雷即将开赛 海量荡剑币不容错过</a></li><li><a href=\"https://wuxia.qq.com/news_detail.html?newsid=15713592\" target=\"_blank\">五毒门派pve向实测：飞雀流和刷刀流的选择</a></li><li><a href=\"https://wuxia.qq.com/news_detail.html?newsid=15696459\" target=\"_blank\">【视频】天涯建筑学院端游篇Vol.14 还原金庸先生黑木崖</a></li></ul></dd></dl></h2>', '攻略：晓觅晨星炫酷开启 神魔夜行共赢好礼', 'http://localhost:8082/game-server/files/e5412dacfe084ef389815009c625aeb4', '87e10bfcc9714fb296a01b6f1c19463d', 'fan1', '/files/619d7dd8836c4fcb878de8941a5c750e', 0, '2022-04-03 07:46:15', '2022-04-03 07:46:15', 0, 1);
INSERT INTO `gf_post` VALUES (35, '【测试】《原神》背后的游戏文化叙事变迁', '<p>近日，“漂亮国”的《时报》发文大谈《原神》，直指《原神》“没有灵魂”。</p><p>“一个几乎完美再现了日式幻想角色扮演游戏的游戏，已经在欧美和日本赚取了数十亿美元。”《时报》先是认可了《原神》在全球市场的成功，随后话锋一转，指出米哈游虽然已经掌握了技术，但仍然面临着重大的创造性缺陷，即对日本主题的有力依赖。</p><p>“米哈游和《原神》更加擅长模仿日本游戏中的想法而不是提出自己的特点。”</p><p><img src=\"https://pics3.baidu.com/feed/960a304e251f95ca5123c7ce0ee06e34650952f1.jpeg?token=9771f39ddf5ed99cb291805af6e66706\"/></p><p>《原神》真的没有自己的特色吗？《原神》身上“二次元”和“日式RPG”这两大标签确实不具新意，但若以类型论英雄，那脱胎于美式RPG的日式RPG也应该被列入《时报》的批判名单。况且，本质上来说，游戏的独特性是它的文化内核带来的，而并非题材类型。</p><p>《原神》中有一个情景，玩家帮助蒙德城的修女后，会收到修女的谢意：“感谢风神大人，啊不对，我应该感谢你。”如果这是欧美游戏亦或日韩游戏，那大概率不会出现后半句台词。</p><p>从游戏文化这一角度看，《原神》是一款绝对地道的中国游戏，这便是它的特点。</p><p>在文化叙事的技巧上，《原神》或许与日本诸多游戏以及全球多款游戏都如出一辙，但其文化叙事背后隐藏的思想与价值观，是具有显著区别性的。而仔细看《原神》的游戏故事，也能发现游戏产品在文化叙事上的变迁。</p><h2><strong>符号下沉</strong></h2><p>法国符号学派认为，文化内容产业是文化符号的一连串组合创造出的，通过多种交流渠道可商业化的财货。因此，不管是游戏还是剧集电影，在文化叙事上的首要准则都是文化符号的融入与组合，《原神》同样如此。</p><p>《原神》目前已推出的蒙德、璃月、稻妻三国各有现实原型，蒙德对标中世纪德国、璃月对应古代中国、稻妻对应日本德川幕府时期。推测来看，《原神》未出的四国中，须弥对应古埃及和古印度、枫丹对应工业革命时期的法国、纳塔对应古罗马、至冬则对应沙皇俄国。</p><p><img src=\"https://pics5.baidu.com/feed/c995d143ad4bd113f755186fe458b50549fb05d0.jpeg?token=2ee263e3acc08e3e1b2b72c3cbbb2147\"/></p><p>简单来说，《原神》以现实历史为依托创造了一个游戏中的虚拟世界，而这些故事背景都是有意识的选择。在《原神》中，诸多设定和设计都围绕着全球化的策略在运作，多元文化背景也是，它是《原神》面向国际市场的一层文化外衣。</p><p>有了现实世界的大框架后，《原神》便可以对游戏中的文化符号进行“填空”，比如在蒙德的故事设定中，蒙德城曾经历两次革命，一次推翻了君王统治，另一次则推翻了贵族阶级，这一背景暗合欧洲历史；而在稻妻地区，雷电将军幕府下设社奉行、勘定奉行、天领奉行，“三奉行”对应的是日本德川幕府时期的寺社奉行、戡定奉行、町奉行。</p><p>以现实作为灵感来源，以全球文化符号作为推广利器，是游戏界乃至文化界过去多年的常规操作，日本的动漫与游戏便是如此走向全球的。</p><p>日本经典动漫作品《火影忍者》中，主角漩涡鸣人为金发碧眼的欧美人形象，日本游戏《最终幻想》与《勇者斗恶龙》虽构建的是虚拟世界，但文化背景是西化的，它们都在一定程度实现了“脱日化”。海外游戏进入中国市场后同样如此，《DOTA2》曾以《西游记》中的“美猴王”为原型创作了英雄“齐天大圣”。</p><p><img src=\"https://pics7.baidu.com/feed/6a600c338744ebf82be0148a1d0ec6206259a7f7.jpeg?token=caa75b6d7a4f3a27cbbd711ed816e5f9\"/></p><p>这都是典型的文化符号的“拿来主义”，选择全球市场中的典型文化符号融入自身的产品中，再将其通过游戏载体传递出去，利用熟悉的文化元素为全球玩家带来强烈的代入感和参与游戏的积极性。</p><p>不过，相比以往的诸多游戏，《原神》的文化符号选取是更下沉式的，这也是当下全球游戏市场提出的新要求。</p><p>过去，游戏行业的文化符号选择路径依赖严重，比如融合日本文化元素，便是樱花、武士、忍者“三板斧”，融合中国文化元素，便是熊猫、功夫、中国龙。过去，这些刻板化的文化符号或许仍有功能价值，但当下不同了，在全球游戏玩家眼中，这些标签化符号与“割韭菜”是划等号的。</p><p>可以发现，《原神》创作稻妻地区时，对日本文化符号的挖掘是更纵深的：稻妻各处可见的标志性图案巴纹，最早出现在中国商代青铜器，后成为日本八幡神的神纹的图样；稻妻PV标题“不动鸣神，泡影断灭”中，“不动鸣神”一词源自日本歌舞剧《七月大歌舞伎》。这些摆脱刻板印象的文化符号，便是纵深度的体现。</p><p><img src=\"https://pics6.baidu.com/feed/6d81800a19d8bc3eb510ebf9427cb714a9d345ee.png?token=d41c02897c792c193af4d776be5e064a\"/></p><p>去年，稻妻角色枫原万叶的PV释出后，一度在日本引发热议，并受到了大量日本玩家认可，这不仅源于万叶浪人武士的形象，以及他身上无处不在的日本和歌元素，也与细节处的走心有关。有日本网友扒出，万叶战斗中“可叹落叶飘零”、“风共云行”、“云隐雁鸣”三句台词皆化用自日本最早的诗歌总集《万叶集》。YouTube上，很多日本玩家甚至称米哈游比他们更熟悉日本文化。</p><p>这就是当下全球游戏玩家对文化叙事的新要求，他们要感受到游戏厂商是在全力刻画自国文化，而不是披着刻板印象来圈钱。</p><p>其实仔细观察可以发现，在璃月地区，《原神》也在摆脱文化叙事的路径依赖。璃月的文化符号中，除了国人熟悉的京剧、灶神、中式园林等文化元素，还包括了方胜纹、礼玉“六器”、阙楼、中式生死观等，这同样是文化符号选取的下沉。</p><h2><strong>由形及意</strong></h2><p>文化符号本身是带有一定文化内涵和情感的，但它的外延有限，因此，游戏产品在叙事上简单融合文化符号，往往只能实现浅层次的文化认同。</p><p>近年来，融入中国文化符号的游戏不在少数，但令玩家印象深刻的或许仅有《魔兽世界：熊猫人之谜》《辐射4》《文明6》等少数游戏。暴雪的《熊猫人之谜》中有这样一段台词：“战火为何而燃？秋叶为何而落？天性不可度，吾辈心中亦有惑。怒拳为谁握？护国安邦惩奸恶，道法自然除心魔。战火休而祸不熄，吾辈何以为战？”</p><p><img src=\"https://pics0.baidu.com/feed/023b5bb5c9ea15ce09239ccd09f72bf93887b222.jpeg?token=4cbd5db72027f4423cae7b21ab3c9b95\"/></p><p>熊猫是国人熟悉的文化元素，而这段台词传达的精神内核，同样是国人所熟悉的。说白了，一款游戏想要在某个国家的玩家群体中得到高度认可，文化叙事就一定要由形及意，摆脱文化缝合、文化挪用等老套路，让玩家产生“你懂我们文化的内在”之感。</p><p>《原神》中，蒙德和稻妻都是以它国为叙事背景，蒙德为“新手村”，叙事深度整体欠佳，而到了稻妻，米哈游的叙事称得上炉火纯青。稻妻主线与支线中，花散里、哲平、阿琉、魔神奥罗巴斯等人，以及御舆一族、天狗一族等族群，最终皆以悲剧收场，他们身上充满了命运操盘下的无力感与宿命感，这正是日式“悲剧美学”的体现。</p><p>可以说，稻妻的故事带给玩家的直观感受是凄婉、压抑、悲伤，甚至是绝望，就如川端康成与太宰治的文学作品一般。</p><p><img src=\"https://pics0.baidu.com/feed/a686c9177f3e670915f663bc86308e37fadc5584.jpeg?token=67931a8b0e5a23c9c61b1db645077a5f\"/></p><p>日本的物哀思想，在《原神》中也有体现。因自然灾害频繁，日本人与生俱来对自然、人生有着敬畏和哀感，他们对世事无常、人生无常也有更深切的感知。《原神》中，雷神影便是物哀思想的代言人，在她看来，幸福和快乐皆转瞬即逝，人的欲望只会带来无休止的痛苦与悲伤，面对无常命运，唯一的答案便是追求静止不变的永恒。</p><p>所以，《原神》真正吸引日本玩家的，并不是《时报》提到的所谓巨型机器人、有着巨大眼睛和尖刺的彩虹色头发的角色、穿着女仆装的女性，因为这些是绝大多数进军日本市场的游戏中都存在的元素。</p><p>《原神》能在日本市场取得成功，最核心的原因还是它让日本玩家感受到了内在的文化认同，不管是悲剧美学还是物哀思想，它们都在由形及意的存在。</p><p>在当下的全球文化市场，挪用文化、改换概念的文化产品市场已经越来越小了，就如《花木兰》在中国市场失利一般，一个完全套壳外国文化内核的中国故事，是不会被明眼人买单的，游戏产品同样如此，尤其是剧情类的游戏。</p><p><img src=\"https://pics5.baidu.com/feed/9d82d158ccbf6c810f0c2b5564c9a03f32fa4051.jpeg?token=e558a87d05ab1bd3748bef06bca5e42c\"/></p><p>RPG游戏与大逃杀、MOBA游戏不同，后两者更依靠竞技性来吸引全球玩家，而RPG游戏更需要深度、完整的叙事，因此，它在文化叙事上要更具深度，也要更尊重各国的本土文化。</p><p>其实，《原神》由形及意的文化叙事不仅体现在以日本为原型的稻妻，这款游戏能在中国市场取得成功，同样与它璃月地区的叙事深度有关。</p><p>在《原神》中，璃月被定义为“契约的国度”以及“岩之国度”，岩之一词，象征着璃月为提瓦特大陆上发展历史最为悠久的国家，也代表了璃月人的精神。在游戏剧情里，千百年来生活在璃月这片土地上的人们辛勤劳作、自强不息，在这个以人为主体的国度，每一个个体的坚韧、努力，以及他们身上的团结精神、牺牲精神，构成了这片土地繁荣昌盛的保障。</p><p><img src=\"https://pics0.baidu.com/feed/79f0f736afc379319b4324492b33a64f42a911ac.png?token=6bd190d0804cdbfccfd6fec6c6a840fc\"/></p><p>稻妻在日本玩家中广受认可，而璃月则在国内玩家中广受认可，背后的道理都是相通的。</p><p>自公测以来，《原神》因地图更新较慢，产能一直被吐槽，但以速度换取质量其实是更好的选择。毕竟从文化角度而言，只有真正深入透彻地考据、研究一个国家的文化，游戏本身才能实现由形及意的文化叙事。</p><h2><strong>文化解构</strong></h2><p>《原神》的多元文化叙事虽然成功，但说到底，没有哪个游戏公司可以做出完全跨越文化壁垒的游戏产品，这就是所谓的画虎难画骨。</p><p>全世界的游戏产品皆“画虎难画骨”有两大原因，一是文化产品本身就有宣传本国文化的使命，二是任何国家的游戏作品，其实都是站在自身文化语境下去解构它国文化，创作者本身是带有“思想钢印”的。不过，这种无法避免的“私货”，恰恰构成了游戏产品的文化独特性。</p><p>《原神》中，蒙德的发展乍看非常西式，但故事中，曾带领蒙德子民推翻暴君和贵族统治的风神温迪，最终将蒙德事务交于骑士团打理，自己化身吟游诗人游走于尘世，他放弃了统治者的身份，却记得每一个蒙德子民的姓名。而在蒙德的龙灾平复后，风神将自由交还给了蒙德城的四风守护之一特瓦林，他道：“被自由之神命令的自由，还能算自由吗？”</p><p><img src=\"https://pics3.baidu.com/feed/f636afc379310a554ed3c4350ab252a380261079.jpeg?token=aa48b9b14f8cae158c8d02ff7765aaba\"/></p><p>从这两处设定来看，蒙德的“自由理念”与今日西方的自由理念是不同的，它更公平、更美好、更尊重个体，也更符合国人对自由的认知，而风神的执政理念，细看其实与道家的“无为而治”很是相似。</p><p>可以说，《原神》各个地区的文化背景和文化符号虽是多元的，但背后潜藏的究极思考与文化价值观，却都是国人熟悉的。</p><p>这在游戏中的稻妻地区也体现得非常明显。在玩家，也就是旅行者的干预下，雷神最终意识到，牺牲民众愿望换取的永恒是死寂式的，于是她走出了自己的意识空间“一心净土”，去亲眼见证稻妻人民的生活，去聆听他们的愿望，明白了在每一个瞬间的传承与变化中，永恒才有其价值所在。</p><p><img src=\"https://pics0.baidu.com/feed/503d269759ee3d6d7721f05efce17c284d4ade45.png?token=766a132096af0cd3a1a6b92ad4e0747b\"/></p><p>通俗来讲，雷神最初对永恒的认知是感性的、唯心的，最终她对永恒的认知才是理性的、唯物的。前者偏向物哀文化影响下的日式思维，而后者则更接近国人思维。</p><p>谈到此，我们或许会对《原神》的文化输出有一个更清晰的认知，它输出的不仅是京剧、中国美食文化等文化符号，让海外玩家对汉语、中国戏曲文化等产生了解的欲望，也是根植于国人基因中的价值与精神，外形为辅，内核为本，双管齐下。</p><p>其实，这种文化解构带来的文化输出体现在《原神》游戏中的各处，比如枫原万叶这一角色虽为浪人武士，但在他身上，体现更多的是中国的“侠”与“义”精神，而非日本武士道的“名”和“忠”精神。</p><p><img src=\"https://pics1.baidu.com/feed/d1a20cf431adcbefda73bac469583fd7a1cc9fab.jpeg?token=73e569c6b15ec78ee6f8e80f02bb7226\"/></p><p>相比文化符号，文化解构之下的文化输出是更隐形，也是更易在潜移默化中被接受的。其实，回溯日本流行文化的全球化历史，便会发现过去多年，日本游戏文化输出的套路也是相同的，就像在《最终幻想》与《勇者斗恶龙》中，日本游戏公司打造了十足西化的虚拟世界，但剧情中的思辨，其实仍是日式思维和日式价值观的体现。</p><p>站在这一角度而言，《时报》提到的“米哈游和原神更加擅长模仿日本游戏中的想法而不是提出自己的特点”，确实有一定道理，但太阳底下无新鲜事，全球游戏公司的战略打法向来如此，《原神》复刻这一打法无可厚非。况且，《原神》也不需要在类型和文化叙事策略上具有独创性，只要它的文化内核足够独特即可。</p><p>或许，自游戏产品走上全球化道路后，每个游戏公司和每款游戏产品都在做着同样的事情，只不过谁站在了舞台中央，谁便能面向全球玩家输出自己的文化。这或许才是《时报》批判原神的核心原因。</p>', '《原神》背后的游戏文化叙事变迁', 'http://localhost:8082/game-server/files/f424dd1903ee45709c282bf5b36cd842', '3eb923c1a7894783bb31a4c97d708785', '0408', '/files/avator.jpg', 0, '2022-04-08 08:27:13', '2022-04-08 08:27:13', 0, 0);

-- ----------------------------
-- Table structure for gf_post__gf_post_classify
-- ----------------------------
DROP TABLE IF EXISTS `gf_post__gf_post_classify`;
CREATE TABLE `gf_post__gf_post_classify`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` int NOT NULL COMMENT '帖子表id',
  `classify_id` int NOT NULL COMMENT '分类表id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `classify_id`(`classify_id`) USING BTREE,
  CONSTRAINT `gf_post__gf_post_classify_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `gf_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gf_post__gf_post_classify_ibfk_2` FOREIGN KEY (`classify_id`) REFERENCES `gf_post_classify` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '帖子表 \r\n《中间表》\r\n分类表\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gf_post__gf_post_classify
-- ----------------------------
INSERT INTO `gf_post__gf_post_classify` VALUES (1, 2, 1);
INSERT INTO `gf_post__gf_post_classify` VALUES (5, 6, 1);
INSERT INTO `gf_post__gf_post_classify` VALUES (19, 23, 1);
INSERT INTO `gf_post__gf_post_classify` VALUES (20, 24, 1);
INSERT INTO `gf_post__gf_post_classify` VALUES (26, 27, 2);
INSERT INTO `gf_post__gf_post_classify` VALUES (27, 27, 3);
INSERT INTO `gf_post__gf_post_classify` VALUES (28, 27, 5);
INSERT INTO `gf_post__gf_post_classify` VALUES (33, 28, 3);
INSERT INTO `gf_post__gf_post_classify` VALUES (35, 22, 2);
INSERT INTO `gf_post__gf_post_classify` VALUES (38, 30, 1);
INSERT INTO `gf_post__gf_post_classify` VALUES (39, 30, 2);
INSERT INTO `gf_post__gf_post_classify` VALUES (40, 31, 1);
INSERT INTO `gf_post__gf_post_classify` VALUES (41, 31, 2);
INSERT INTO `gf_post__gf_post_classify` VALUES (42, 32, 1);
INSERT INTO `gf_post__gf_post_classify` VALUES (43, 33, 1);
INSERT INTO `gf_post__gf_post_classify` VALUES (44, 34, 5);
INSERT INTO `gf_post__gf_post_classify` VALUES (45, 34, 1);
INSERT INTO `gf_post__gf_post_classify` VALUES (46, 24, 11);
INSERT INTO `gf_post__gf_post_classify` VALUES (47, 28, 11);
INSERT INTO `gf_post__gf_post_classify` VALUES (48, 26, 6);
INSERT INTO `gf_post__gf_post_classify` VALUES (49, 26, 11);
INSERT INTO `gf_post__gf_post_classify` VALUES (50, 29, 11);
INSERT INTO `gf_post__gf_post_classify` VALUES (51, 27, 11);
INSERT INTO `gf_post__gf_post_classify` VALUES (52, 2, 3);
INSERT INTO `gf_post__gf_post_classify` VALUES (53, 2, 11);
INSERT INTO `gf_post__gf_post_classify` VALUES (54, 3, 3);
INSERT INTO `gf_post__gf_post_classify` VALUES (55, 3, 6);
INSERT INTO `gf_post__gf_post_classify` VALUES (56, 3, 11);
INSERT INTO `gf_post__gf_post_classify` VALUES (57, 21, 1);
INSERT INTO `gf_post__gf_post_classify` VALUES (58, 21, 5);
INSERT INTO `gf_post__gf_post_classify` VALUES (59, 9, 13);
INSERT INTO `gf_post__gf_post_classify` VALUES (60, 9, 11);
INSERT INTO `gf_post__gf_post_classify` VALUES (61, 8, 11);
INSERT INTO `gf_post__gf_post_classify` VALUES (62, 8, 12);
INSERT INTO `gf_post__gf_post_classify` VALUES (63, 35, 2);
INSERT INTO `gf_post__gf_post_classify` VALUES (64, 35, 3);
INSERT INTO `gf_post__gf_post_classify` VALUES (65, 35, 11);

-- ----------------------------
-- Table structure for gf_post__gf_post_tag
-- ----------------------------
DROP TABLE IF EXISTS `gf_post__gf_post_tag`;
CREATE TABLE `gf_post__gf_post_tag`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` int NOT NULL COMMENT '帖子表id',
  `tag_id` int NOT NULL COMMENT '标签表id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `tag_id`(`tag_id`) USING BTREE,
  CONSTRAINT `gf_post__gf_post_tag_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `gf_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gf_post__gf_post_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `gf_post_tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '帖子表 \r\n《中间表》\r\n标签表\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gf_post__gf_post_tag
-- ----------------------------
INSERT INTO `gf_post__gf_post_tag` VALUES (9, 23, 1);
INSERT INTO `gf_post__gf_post_tag` VALUES (11, 25, 1);
INSERT INTO `gf_post__gf_post_tag` VALUES (12, 25, 2);
INSERT INTO `gf_post__gf_post_tag` VALUES (14, 26, 2);
INSERT INTO `gf_post__gf_post_tag` VALUES (15, 27, 1);
INSERT INTO `gf_post__gf_post_tag` VALUES (26, 30, 1);
INSERT INTO `gf_post__gf_post_tag` VALUES (27, 30, 2);
INSERT INTO `gf_post__gf_post_tag` VALUES (28, 30, 3);
INSERT INTO `gf_post__gf_post_tag` VALUES (29, 31, 1);
INSERT INTO `gf_post__gf_post_tag` VALUES (30, 31, 2);
INSERT INTO `gf_post__gf_post_tag` VALUES (31, 31, 4);
INSERT INTO `gf_post__gf_post_tag` VALUES (32, 32, 1);
INSERT INTO `gf_post__gf_post_tag` VALUES (33, 33, 1);
INSERT INTO `gf_post__gf_post_tag` VALUES (34, 34, 1);
INSERT INTO `gf_post__gf_post_tag` VALUES (35, 22, 11);
INSERT INTO `gf_post__gf_post_tag` VALUES (36, 24, 12);
INSERT INTO `gf_post__gf_post_tag` VALUES (37, 28, 13);
INSERT INTO `gf_post__gf_post_tag` VALUES (38, 28, 2);
INSERT INTO `gf_post__gf_post_tag` VALUES (39, 26, 14);
INSERT INTO `gf_post__gf_post_tag` VALUES (40, 26, 5);
INSERT INTO `gf_post__gf_post_tag` VALUES (41, 29, 13);
INSERT INTO `gf_post__gf_post_tag` VALUES (42, 29, 14);
INSERT INTO `gf_post__gf_post_tag` VALUES (43, 27, 5);
INSERT INTO `gf_post__gf_post_tag` VALUES (44, 27, 13);
INSERT INTO `gf_post__gf_post_tag` VALUES (45, 27, 14);
INSERT INTO `gf_post__gf_post_tag` VALUES (46, 2, 12);
INSERT INTO `gf_post__gf_post_tag` VALUES (47, 2, 11);
INSERT INTO `gf_post__gf_post_tag` VALUES (48, 3, 5);
INSERT INTO `gf_post__gf_post_tag` VALUES (49, 3, 14);
INSERT INTO `gf_post__gf_post_tag` VALUES (50, 21, 10);
INSERT INTO `gf_post__gf_post_tag` VALUES (51, 21, 15);
INSERT INTO `gf_post__gf_post_tag` VALUES (52, 9, 12);
INSERT INTO `gf_post__gf_post_tag` VALUES (53, 9, 11);
INSERT INTO `gf_post__gf_post_tag` VALUES (54, 8, 10);
INSERT INTO `gf_post__gf_post_tag` VALUES (55, 8, 17);
INSERT INTO `gf_post__gf_post_tag` VALUES (56, 35, 1);
INSERT INTO `gf_post__gf_post_tag` VALUES (57, 35, 2);
INSERT INTO `gf_post__gf_post_tag` VALUES (58, 35, 4);

-- ----------------------------
-- Table structure for gf_post_classify
-- ----------------------------
DROP TABLE IF EXISTS `gf_post_classify`;
CREATE TABLE `gf_post_classify`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `classify` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '帖子分类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '帖子分类管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gf_post_classify
-- ----------------------------
INSERT INTO `gf_post_classify` VALUES (1, '教程');
INSERT INTO `gf_post_classify` VALUES (2, '测试');
INSERT INTO `gf_post_classify` VALUES (3, '科普');
INSERT INTO `gf_post_classify` VALUES (5, '攻略');
INSERT INTO `gf_post_classify` VALUES (6, 'bug');
INSERT INTO `gf_post_classify` VALUES (10, '11');
INSERT INTO `gf_post_classify` VALUES (11, '游戏资讯');
INSERT INTO `gf_post_classify` VALUES (12, '通关');
INSERT INTO `gf_post_classify` VALUES (13, '装备属性');

-- ----------------------------
-- Table structure for gf_post_collect
-- ----------------------------
DROP TABLE IF EXISTS `gf_post_collect`;
CREATE TABLE `gf_post_collect`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `type` tinyint NOT NULL COMMENT '收藏类型（0帖子 1游戏）',
  `collect_id` int NOT NULL COMMENT '收藏的帖子id/游戏id\r\n',
  `gmt_create` datetime NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  CONSTRAINT `gf_post_collect_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `gf_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '帖子收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gf_post_collect
-- ----------------------------
INSERT INTO `gf_post_collect` VALUES (13, 'b3bd92d8c40f4e6f864192d4ea5e2c95', 1, 2, '2022-02-14 19:23:19');
INSERT INTO `gf_post_collect` VALUES (14, 'b3bd92d8c40f4e6f864192d4ea5e2c95', 1, 1, '2022-02-14 19:25:32');
INSERT INTO `gf_post_collect` VALUES (16, 'b3bd92d8c40f4e6f864192d4ea5e2c95', 0, 6, '2022-02-14 20:03:07');
INSERT INTO `gf_post_collect` VALUES (19, 'f5ffe55f0ddb479381d7a37344f88fbc', 1, 4, '2022-03-31 13:40:05');
INSERT INTO `gf_post_collect` VALUES (20, 'f5ffe55f0ddb479381d7a37344f88fbc', 0, 22, '2022-03-31 13:41:23');
INSERT INTO `gf_post_collect` VALUES (22, '88a7e7de0b274c2aa438640aea31652d', 0, 2, '2022-03-31 15:28:42');
INSERT INTO `gf_post_collect` VALUES (23, '88a7e7de0b274c2aa438640aea31652d', 1, 1, '2022-03-31 15:50:34');
INSERT INTO `gf_post_collect` VALUES (24, '87e10bfcc9714fb296a01b6f1c19463d', 0, 21, '2022-04-01 15:51:21');
INSERT INTO `gf_post_collect` VALUES (25, '87e10bfcc9714fb296a01b6f1c19463d', 1, 1, '2022-04-01 15:53:48');
INSERT INTO `gf_post_collect` VALUES (26, 'b3bd92d8c40f4e6f864192d4ea5e2c95', 0, 23, '2022-04-15 15:24:02');

-- ----------------------------
-- Table structure for gf_post_comment
-- ----------------------------
DROP TABLE IF EXISTS `gf_post_comment`;
CREATE TABLE `gf_post_comment`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `type` tinyint NOT NULL COMMENT '评论类型（0帖子 1 游戏）',
  `comment_id` int NOT NULL COMMENT '帖子id / 游戏id',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论内容',
  `gmt_create` datetime NOT NULL COMMENT '评论时间',
  `like` int NOT NULL DEFAULT 0 COMMENT '评论点赞数',
  `status` int NOT NULL DEFAULT 0 COMMENT ' 状态 \r\n0.待审核 \r\n1.可查看',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  CONSTRAINT `gf_post_comment_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `gf_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '帖子/游戏评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gf_post_comment
-- ----------------------------
INSERT INTO `gf_post_comment` VALUES (1, 'b3bd92d8c40f4e6f864192d4ea5e2c95', 1, 1, '23', '2022-02-12 02:51:49', 1, 1);
INSERT INTO `gf_post_comment` VALUES (2, 'b3bd92d8c40f4e6f864192d4ea5e2c95', 1, 1, '12', '2022-02-12 15:06:21', 2, 1);
INSERT INTO `gf_post_comment` VALUES (3, 'b3bd92d8c40f4e6f864192d4ea5e2c95', 0, 4, '123', '2022-02-12 15:11:59', 1, 1);
INSERT INTO `gf_post_comment` VALUES (4, 'b3bd92d8c40f4e6f864192d4ea5e2c95', 0, 4, '对了 ', '2022-02-12 15:19:03', 0, 1);
INSERT INTO `gf_post_comment` VALUES (5, 'b3bd92d8c40f4e6f864192d4ea5e2c95', 1, 2, '12', '2022-02-13 20:12:31', 1, 1);
INSERT INTO `gf_post_comment` VALUES (6, 'b3bd92d8c40f4e6f864192d4ea5e2c95', 1, 1, '12', '2022-02-13 21:00:44', 1, 1);
INSERT INTO `gf_post_comment` VALUES (7, 'b3bd92d8c40f4e6f864192d4ea5e2c95', 0, 2, '12', '2022-02-14 01:23:04', 1, 1);
INSERT INTO `gf_post_comment` VALUES (8, 'b3bd92d8c40f4e6f864192d4ea5e2c95', 1, 1, '1111111111', '2022-02-14 12:20:50', 0, 1);
INSERT INTO `gf_post_comment` VALUES (9, 'b3bd92d8c40f4e6f864192d4ea5e2c95', 0, 3, '34', '2022-02-14 15:26:26', 0, 1);
INSERT INTO `gf_post_comment` VALUES (11, 'f5ffe55f0ddb479381d7a37344f88fbc', 0, 23, '', '2022-03-21 19:32:59', 0, 0);
INSERT INTO `gf_post_comment` VALUES (12, 'f5ffe55f0ddb479381d7a37344f88fbc', 0, 23, '1', '2022-03-21 19:38:32', 0, 0);
INSERT INTO `gf_post_comment` VALUES (13, 'f5ffe55f0ddb479381d7a37344f88fbc', 0, 23, '测试欧诺个了', '2022-03-21 21:22:14', 1, 1);
INSERT INTO `gf_post_comment` VALUES (14, 'f5ffe55f0ddb479381d7a37344f88fbc', 0, 23, '测试', '2022-03-21 21:30:00', 0, 0);
INSERT INTO `gf_post_comment` VALUES (15, 'f5ffe55f0ddb479381d7a37344f88fbc', 0, 22, '123', '2022-03-21 21:34:31', 0, 0);
INSERT INTO `gf_post_comment` VALUES (16, 'f5ffe55f0ddb479381d7a37344f88fbc', 0, 22, '123', '2022-03-21 21:37:51', 0, 1);
INSERT INTO `gf_post_comment` VALUES (17, 'f5ffe55f0ddb479381d7a37344f88fbc', 1, 1, '1123', '2022-03-22 00:04:34', 0, 0);
INSERT INTO `gf_post_comment` VALUES (18, 'f5ffe55f0ddb479381d7a37344f88fbc', 1, 1, 'sfhj ', '2022-03-31 13:36:52', 0, 0);
INSERT INTO `gf_post_comment` VALUES (19, 'f5ffe55f0ddb479381d7a37344f88fbc', 1, 1, '1111', '2022-03-31 13:37:34', 0, 1);
INSERT INTO `gf_post_comment` VALUES (20, 'f5ffe55f0ddb479381d7a37344f88fbc', 1, 4, '331', '2022-03-31 13:40:16', 0, 1);
INSERT INTO `gf_post_comment` VALUES (21, 'f5ffe55f0ddb479381d7a37344f88fbc', 0, 26, '123', '2022-03-31 13:41:50', 0, 1);
INSERT INTO `gf_post_comment` VALUES (22, 'f5ffe55f0ddb479381d7a37344f88fbc', 0, 2, '12344', '2022-03-31 14:44:31', 0, 1);
INSERT INTO `gf_post_comment` VALUES (23, '88a7e7de0b274c2aa438640aea31652d', 0, 2, '1111', '2022-03-31 15:28:47', 0, 1);
INSERT INTO `gf_post_comment` VALUES (24, '88a7e7de0b274c2aa438640aea31652d', 1, 1, 'kkkkk', '2022-03-31 15:48:53', 0, 1);
INSERT INTO `gf_post_comment` VALUES (25, '87e10bfcc9714fb296a01b6f1c19463d', 0, 21, '111', '2022-04-01 15:51:27', 0, 1);
INSERT INTO `gf_post_comment` VALUES (26, '87e10bfcc9714fb296a01b6f1c19463d', 0, 23, '这里可以￥￥***，可以***！哈哈，***，哈哈哈！', '2022-04-03 15:18:21', 0, 1);
INSERT INTO `gf_post_comment` VALUES (27, '87e10bfcc9714fb296a01b6f1c19463d', 0, 23, '这里可以￥￥***，可以***！哈哈，***，哈哈哈！', '2022-04-03 15:19:35', 0, 1);
INSERT INTO `gf_post_comment` VALUES (28, '87e10bfcc9714fb296a01b6f1c19463d', 1, 1, '这里可以￥￥***，可以***！哈哈，***，哈哈哈！', '2022-04-03 15:20:04', 0, 1);
INSERT INTO `gf_post_comment` VALUES (29, '87e10bfcc9714fb296a01b6f1c19463d', 1, 1, 'gmt_create', '2022-04-03 15:23:43', 0, 1);
INSERT INTO `gf_post_comment` VALUES (30, '87e10bfcc9714fb296a01b6f1c19463d', 0, 3, 'getAllComment', '2022-04-03 15:29:50', 0, 1);
INSERT INTO `gf_post_comment` VALUES (31, '87e10bfcc9714fb296a01b6f1c19463d', 0, 3, '这里可以￥￥***，可以***！哈哈，***，哈哈哈！', '2022-04-03 15:32:52', 0, 1);
INSERT INTO `gf_post_comment` VALUES (32, '87e10bfcc9714fb296a01b6f1c19463d', 0, 3, '.orderByDesc(\"gmt_create\")\n这里可以￥￥***，可以***！哈哈，***，哈哈哈！', '2022-04-03 15:34:48', 0, 1);
INSERT INTO `gf_post_comment` VALUES (33, '87e10bfcc9714fb296a01b6f1c19463d', 0, 3, '哈哈哈哈这里可以￥￥***，可以***！哈哈，***，哈哈哈！', '2022-04-03 15:35:11', 0, 0);
INSERT INTO `gf_post_comment` VALUES (34, '87e10bfcc9714fb296a01b6f1c19463d', 1, 1, '哈哈这里可以￥￥***，可以***！哈哈，***，哈哈哈！', '2022-04-03 15:35:23', 0, 1);
INSERT INTO `gf_post_comment` VALUES (35, '87e10bfcc9714fb296a01b6f1c19463d', 1, 1, '***！哈哈', '2022-04-03 15:38:43', 0, 1);
INSERT INTO `gf_post_comment` VALUES (36, '87e10bfcc9714fb296a01b6f1c19463d', 1, 1, '***', '2022-04-03 15:38:58', 0, 1);
INSERT INTO `gf_post_comment` VALUES (37, '3eb923c1a7894783bb31a4c97d708785', 1, 1, '这里可以￥￥***，可以***！哈哈，***，哈哈哈！', '2022-04-08 18:42:54', 0, 1);
INSERT INTO `gf_post_comment` VALUES (38, '75945c07515a428e851e9e44f924b351', 1, 1, '***、、、***', '2022-04-14 14:42:28', 0, 1);
INSERT INTO `gf_post_comment` VALUES (39, 'b3bd92d8c40f4e6f864192d4ea5e2c95', 0, 24, '***', '2022-04-15 13:13:57', 0, 1);
INSERT INTO `gf_post_comment` VALUES (40, 'b3bd92d8c40f4e6f864192d4ea5e2c95', 0, 23, '***sss***', '2022-04-15 15:24:16', 0, 0);

-- ----------------------------
-- Table structure for gf_post_like
-- ----------------------------
DROP TABLE IF EXISTS `gf_post_like`;
CREATE TABLE `gf_post_like`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户编号',
  `type` tinyint NULL DEFAULT NULL COMMENT '点赞类型（0帖子 1游戏 2评论）',
  `like_id` int NULL DEFAULT NULL COMMENT '点赞id 帖子id/游戏id/ 评论id',
  `gmt_create` datetime NULL DEFAULT NULL COMMENT '点赞时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid`(`uid`, `type`, `like_id`) USING BTREE COMMENT '每个用户点赞一次',
  CONSTRAINT `gf_post_like_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `gf_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '帖子点赞表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gf_post_like
-- ----------------------------
INSERT INTO `gf_post_like` VALUES (8, 'b3bd92d8c40f4e6f864192d4ea5e2c95', 0, 2, '2022-02-13 19:58:04');
INSERT INTO `gf_post_like` VALUES (45, 'b3bd92d8c40f4e6f864192d4ea5e2c95', 2, 1, '2022-02-14 15:20:48');
INSERT INTO `gf_post_like` VALUES (46, 'b3bd92d8c40f4e6f864192d4ea5e2c95', 2, 7, '2022-02-14 15:20:57');
INSERT INTO `gf_post_like` VALUES (53, 'b3bd92d8c40f4e6f864192d4ea5e2c95', 2, 2, '2022-02-14 15:30:04');
INSERT INTO `gf_post_like` VALUES (56, 'b3bd92d8c40f4e6f864192d4ea5e2c95', 2, 6, '2022-02-14 15:35:39');
INSERT INTO `gf_post_like` VALUES (57, 'b3bd92d8c40f4e6f864192d4ea5e2c95', 2, 5, '2022-02-14 15:51:11');
INSERT INTO `gf_post_like` VALUES (59, 'b3bd92d8c40f4e6f864192d4ea5e2c95', 2, 3, '2022-02-14 16:45:52');
INSERT INTO `gf_post_like` VALUES (60, 'b3bd92d8c40f4e6f864192d4ea5e2c95', 0, 6, '2022-02-15 00:46:08');
INSERT INTO `gf_post_like` VALUES (62, 'b3bd92d8c40f4e6f864192d4ea5e2c95', 1, 6, '2022-02-16 01:52:48');
INSERT INTO `gf_post_like` VALUES (63, 'f5ffe55f0ddb479381d7a37344f88fbc', 2, 13, '2022-03-21 21:22:29');
INSERT INTO `gf_post_like` VALUES (65, 'f5ffe55f0ddb479381d7a37344f88fbc', 1, 9, '2022-03-31 13:59:26');
INSERT INTO `gf_post_like` VALUES (67, '88a7e7de0b274c2aa438640aea31652d', 0, 2, '2022-03-31 15:28:42');
INSERT INTO `gf_post_like` VALUES (68, '88a7e7de0b274c2aa438640aea31652d', 2, 2, '2022-03-31 15:49:48');
INSERT INTO `gf_post_like` VALUES (69, '87e10bfcc9714fb296a01b6f1c19463d', 0, 21, '2022-04-01 15:51:20');
INSERT INTO `gf_post_like` VALUES (70, '87e10bfcc9714fb296a01b6f1c19463d', 1, 1, '2022-04-01 15:53:47');
INSERT INTO `gf_post_like` VALUES (71, 'b3bd92d8c40f4e6f864192d4ea5e2c95', 0, 23, '2022-04-15 15:24:00');
INSERT INTO `gf_post_like` VALUES (72, 'b3bd92d8c40f4e6f864192d4ea5e2c95', 1, 1, '2022-04-15 15:24:43');

-- ----------------------------
-- Table structure for gf_post_tag
-- ----------------------------
DROP TABLE IF EXISTS `gf_post_tag`;
CREATE TABLE `gf_post_tag`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `tag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签分类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '帖子标签' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gf_post_tag
-- ----------------------------
INSERT INTO `gf_post_tag` VALUES (1, '测试');
INSERT INTO `gf_post_tag` VALUES (2, '生活');
INSERT INTO `gf_post_tag` VALUES (3, '励志');
INSERT INTO `gf_post_tag` VALUES (4, '人生感悟');
INSERT INTO `gf_post_tag` VALUES (5, 'BUG');
INSERT INTO `gf_post_tag` VALUES (9, '111');
INSERT INTO `gf_post_tag` VALUES (10, '攻略');
INSERT INTO `gf_post_tag` VALUES (11, '游戏介绍');
INSERT INTO `gf_post_tag` VALUES (12, '新手指南');
INSERT INTO `gf_post_tag` VALUES (13, '活动');
INSERT INTO `gf_post_tag` VALUES (14, '游戏公告');
INSERT INTO `gf_post_tag` VALUES (15, '英雄');
INSERT INTO `gf_post_tag` VALUES (16, '装备');
INSERT INTO `gf_post_tag` VALUES (17, '游戏问答');

-- ----------------------------
-- Table structure for gf_user
-- ----------------------------
DROP TABLE IF EXISTS `gf_user`;
CREATE TABLE `gf_user`  (
  `id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '自增id 用户编号',
  `username` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名称',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `avatar_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '/files/avator.jpg' COMMENT '头像地址',
  `login_date` datetime NOT NULL COMMENT '最后登录时间',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `status` int NOT NULL DEFAULT 0 COMMENT '状态0为可用 1位不可用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_username`(`username`) USING BTREE COMMENT '用户名称唯一'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gf_user
-- ----------------------------
INSERT INTO `gf_user` VALUES ('16d32928f64c465bb511c919466fe1d7', 'admin111', '$2a$10$3da02Dd4LHOeRbcAo2Ka7O5d1PED0.aW1r0wmVkM5QFhNyUheWG8G', '/files/avator.jpg', '2022-03-17 22:54:40', '2022-03-17 22:54:40', 0);
INSERT INTO `gf_user` VALUES ('3b98a21654874d46a559f36533fa981e', '123456admin', '$2a$10$.Xp4ARH/JdHaRQZg81Dujewh/M9zyzbiDZkue.BcPEeHC3VLFfrSG', '/files/avator.jpg', '2022-03-20 00:17:20', '2022-03-20 00:17:20', 0);
INSERT INTO `gf_user` VALUES ('3eb923c1a7894783bb31a4c97d708785', '0408', '$2a$10$wsCPi./RMOUyqzqVBmC2U.iltVwCjWF/PiM/ZrBKcfzOULTaIfoB.', '/files/b0e9971b56854ea5bde5df3f8105b21b', '2022-04-08 15:45:32', '2022-04-08 15:45:32', 0);
INSERT INTO `gf_user` VALUES ('497de6a5865f4623b29f52a5fda55c27', 'admin1329', '$2a$10$u2TgcASB0.Sn.ONjbO7K1uI.g50FR6Dd46Qdowam1PIEP.h51gSmi', '/files/avator.jpg', '2022-03-20 13:30:00', '2022-03-20 13:30:00', 0);
INSERT INTO `gf_user` VALUES ('54a6b407d36f4e289a1803988b3f1257', '122', '$2a$10$L5W.lt03D.CyPB0QhBmxbOEJd9xFAu4m7AirDuiC44aDBk.B1nbUu', '/files/avator.jpg', '2022-03-20 00:17:04', '2022-03-20 00:17:04', 0);
INSERT INTO `gf_user` VALUES ('5aa6c6096b634d31930e26be72110c51', 'fan', '$2a$10$fNFle7W/rlh29kte5EXJ3uj3rjOa/9qNcpu2OLv/bRoToIo9Eltja', '/files/avator.jpg', '2022-04-01 15:47:38', '2022-04-01 15:47:38', 0);
INSERT INTO `gf_user` VALUES ('5facdb1a23a54a04bacb3f1247d062d4', 'kkk', '$2a$10$pWArn3T9I3B1prTypM0QS.EyJ1YTTTC4kcIqd8NgUiZQOlmwrpt7y', '/files/avator.jpg', '2022-03-31 15:15:34', '2022-03-31 15:15:34', 0);
INSERT INTO `gf_user` VALUES ('75945c07515a428e851e9e44f924b351', 'zheng111', '$2a$10$IT/BuuzNbfqAz4Zc83mV3eJ6UoIuNsxISfgHW16HFoJ7NAj/SX.km', '/files/b761a8c4936f4144957bfcdbdb10a8eb', '2022-04-14 14:39:24', '2022-04-14 14:39:24', 0);
INSERT INTO `gf_user` VALUES ('87e10bfcc9714fb296a01b6f1c19463d', 'fan1', '$2a$10$5aXN4fY0XsskHM8KFP54r.BHnFZUYhHrEYLr1H53iwBgU5Td4Z1NK', '/files/619d7dd8836c4fcb878de8941a5c750e', '2022-04-01 15:49:51', '2022-04-01 15:49:51', 0);
INSERT INTO `gf_user` VALUES ('88a7e7de0b274c2aa438640aea31652d', 'kkkk', '$2a$10$4aGV4cyHT4fHqy/WFV.QOeqUNyxwbpxPPq2ClDmYpp41y.8Qu8fJ6', '/files/8e752c9629084a8d92bcedc76df1433d', '2022-03-31 15:15:48', '2022-03-31 15:15:48', 0);
INSERT INTO `gf_user` VALUES ('b3bd92d8c40f4e6f864192d4ea5e2c95', 'fan111', '$2a$10$9IXa/Q/J.gIgOkFKDj3PEOqfKJBcy.L4pcWkLSR6/5lD5pLapB7zC', '/files/48cf12b03d64488e937d2edd92b97884', '2022-01-21 22:33:04', '2022-01-21 22:33:04', 0);
INSERT INTO `gf_user` VALUES ('f5ffe55f0ddb479381d7a37344f88fbc', 'admin', '$2a$10$pELxBnPzJk4oHUKcCX1NaebtOBxSpUK3zJWcoTwCSXZxQkdOTy8si', '/files/b8aabbf85fe749acbe62ae875afc276e', '2022-03-05 23:22:09', '2022-03-05 23:22:09', 0);
INSERT INTO `gf_user` VALUES ('f926e46fdd6e461298d872b35fd61e12', 'admin4321', '$2a$10$DTsesYRIf7P6EhQldkAKFOOssegDmtVSeOek1AtOoUp0IRISTrAgy', '/files/74134e4b1e574546ac58bff3db3be42d', '2022-02-21 23:47:08', '2022-02-21 23:47:08', 0);

-- ----------------------------
-- Table structure for gf_user__gf_user_role
-- ----------------------------
DROP TABLE IF EXISTS `gf_user__gf_user_role`;
CREATE TABLE `gf_user__gf_user_role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户表id',
  `rid` int NOT NULL COMMENT '权限表id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rid`(`rid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  CONSTRAINT `gf_user__gf_user_role_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `gf_user_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `gf_user__gf_user_role_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `gf_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户角色关联表\r\n用户表\r\n    《中间表》\r\n角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gf_user__gf_user_role
-- ----------------------------
INSERT INTO `gf_user__gf_user_role` VALUES (5, 'b3bd92d8c40f4e6f864192d4ea5e2c95', 3);
INSERT INTO `gf_user__gf_user_role` VALUES (10, 'f926e46fdd6e461298d872b35fd61e12', 2);
INSERT INTO `gf_user__gf_user_role` VALUES (11, 'f5ffe55f0ddb479381d7a37344f88fbc', 1);
INSERT INTO `gf_user__gf_user_role` VALUES (12, '16d32928f64c465bb511c919466fe1d7', 3);
INSERT INTO `gf_user__gf_user_role` VALUES (13, '54a6b407d36f4e289a1803988b3f1257', 3);
INSERT INTO `gf_user__gf_user_role` VALUES (14, '3b98a21654874d46a559f36533fa981e', 3);
INSERT INTO `gf_user__gf_user_role` VALUES (15, '497de6a5865f4623b29f52a5fda55c27', 3);
INSERT INTO `gf_user__gf_user_role` VALUES (16, '88a7e7de0b274c2aa438640aea31652d', 3);
INSERT INTO `gf_user__gf_user_role` VALUES (17, '5aa6c6096b634d31930e26be72110c51', 3);
INSERT INTO `gf_user__gf_user_role` VALUES (18, '87e10bfcc9714fb296a01b6f1c19463d', 3);
INSERT INTO `gf_user__gf_user_role` VALUES (19, '3eb923c1a7894783bb31a4c97d708785', 3);
INSERT INTO `gf_user__gf_user_role` VALUES (20, '75945c07515a428e851e9e44f924b351', 3);

-- ----------------------------
-- Table structure for gf_user_info
-- ----------------------------
DROP TABLE IF EXISTS `gf_user_info`;
CREATE TABLE `gf_user_info`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `nickname` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `real_name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `birthday` date NOT NULL COMMENT '生日',
  `gender` tinyint NULL DEFAULT NULL COMMENT '性别',
  `qq` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'QQ',
  `we_chat` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'WeChat',
  `email` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机',
  `address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `hobby` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '爱好',
  `intro` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '自我介绍',
  `work` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid`(`uid`) USING BTREE,
  UNIQUE INDEX `nickname`(`nickname`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE,
  CONSTRAINT `gf_user_info_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `gf_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gf_user_info
-- ----------------------------
INSERT INTO `gf_user_info` VALUES (4, 'b3bd92d8c40f4e6f864192d4ea5e2c95', 'fan111', '帆', '2022-01-18', 1, 'fanqq', 'fanwei', 'efan0305@qq.com', '13415146775', '黑龙江', 'fan\\fan', '昨天再好，也走不回去；明天再难，也要抬脚继续。', 'fan1024');
INSERT INTO `gf_user_info` VALUES (11, 'f926e46fdd6e461298d872b35fd61e12', 'admin4321', NULL, '2022-02-17', 1, NULL, NULL, 'admin4321@qq.com', NULL, '北京', NULL, NULL, NULL);
INSERT INTO `gf_user_info` VALUES (12, 'f5ffe55f0ddb479381d7a37344f88fbc', 'admin', '郑帆', '1999-03-04', 0, NULL, NULL, '1354597524@qq.com', '13415146775', NULL, NULL, '1111', NULL);
INSERT INTO `gf_user_info` VALUES (13, '16d32928f64c465bb511c919466fe1d7', 'admin111', NULL, '2022-03-14', 0, NULL, NULL, 'efan0305@163.com', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gf_user_info` VALUES (16, '54a6b407d36f4e289a1803988b3f1257', '122', NULL, '2022-03-12', 1, NULL, NULL, 'efa1n0305@qq.com', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gf_user_info` VALUES (17, '3b98a21654874d46a559f36533fa981e', '123456admin', NULL, '2022-03-12', 0, NULL, NULL, 'efa3n0305@qq.com', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gf_user_info` VALUES (18, '497de6a5865f4623b29f52a5fda55c27', 'admin1329', NULL, '2022-03-18', 0, NULL, NULL, 'efan10305@qq.com', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gf_user_info` VALUES (19, '88a7e7de0b274c2aa438640aea31652d', 'kkkk', '11111', '2022-03-29', 0, NULL, NULL, 'efan0305333@qq.com', '13415146777', NULL, NULL, '1111111111111111', NULL);
INSERT INTO `gf_user_info` VALUES (20, '5aa6c6096b634d31930e26be72110c51', 'fan', NULL, '2022-03-31', 1, NULL, NULL, 'efan03@qq.com', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gf_user_info` VALUES (21, '87e10bfcc9714fb296a01b6f1c19463d', 'fan1', NULL, '2022-03-03', 0, NULL, NULL, 'efan123@qq.com', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gf_user_info` VALUES (22, '3eb923c1a7894783bb31a4c97d708785', '0408', NULL, '1989-12-31', 1, NULL, NULL, 'da1024da@outlook.com', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gf_user_info` VALUES (23, '75945c07515a428e851e9e44f924b351', 'zheng111', NULL, '2022-04-12', 0, NULL, NULL, 'zheng111@qq.com', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for gf_user_role
-- ----------------------------
DROP TABLE IF EXISTS `gf_user_role`;
CREATE TABLE `gf_user_role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id 角色编号',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '无描述。。。' COMMENT '角色名称',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gf_user_role
-- ----------------------------
INSERT INTO `gf_user_role` VALUES (1, '超级管理员', '2022-01-19 14:51:36');
INSERT INTO `gf_user_role` VALUES (2, '管理员', '2022-01-19 14:52:13');
INSERT INTO `gf_user_role` VALUES (3, '普通用户', '2022-01-19 14:52:37');

SET FOREIGN_KEY_CHECKS = 1;
