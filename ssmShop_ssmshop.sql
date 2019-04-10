-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: ssmshop
-- ------------------------------------------------------
-- Server version	5.7.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `aid` varchar(32) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(256) NOT NULL,
  `status` varchar(20) NOT NULL,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('1b3925e3246f11e9a13710c37b1e9938','1','1','1','暗黑佟大为');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderitem` (
  `itemid` varchar(32) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `pid` varchar(32) DEFAULT NULL,
  `oid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  KEY `oid` (`oid`),
  KEY `pid` (`pid`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`),
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `oid` varchar(32) NOT NULL,
  `uid` varchar(32) NOT NULL,
  `otime` datetime NOT NULL,
  `ototal` decimal(8,2) NOT NULL,
  `ostatus` varchar(20) NOT NULL,
  `receiver` varchar(20) DEFAULT NULL,
  `tel` varchar(11) DEFAULT NULL,
  `addr` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `orders_ibfk_1` (`uid`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `pid` varchar(32) NOT NULL,
  `pname` varchar(256) NOT NULL,
  `ptid` varchar(32) NOT NULL,
  `pimg` varchar(256) NOT NULL,
  `pprice` decimal(8,2) NOT NULL,
  `pstatus` varchar(10) NOT NULL,
  `pcount` int(11) NOT NULL,
  `pdetailed` text NOT NULL,
  `pdate` datetime NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `ptid` (`ptid`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`ptid`) REFERENCES `protype` (`ptid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('0A33AF4DBF6F477E8527BE9CFF2F4169','百褶短裙','BF62251562CB4CEABE748CAB581ED055','pimg/0A33AF4DBF6F477E8527BE9CFF2F4169.jpeg',1188.00,'1',44,'晃日光绿野仙冬毛呢轻复古百搭质感高腰苏格兰格显瘦百褶短裙半裙 海量新品 潮流穿搭 玩趣互动','2019-02-01 03:29:28'),('1378F0C5A5CD4165A5ED9D9F5BE6A4AD','魅莱S新款','29701074801B42169BEA178469DF7882','pimg/1378F0C5A5CD4165A5ED9D9F5BE6A4AD.jpeg',1188.00,'0',50,'正品游戏智能手机十核128G内存4G双卡全网通魅莱S新款学生价机','2019-02-01 02:57:40'),('21CD6146A0C84C52BF581D27BD30C3A9','酷比魔方平板电脑','ED75CBBBD342471EAF29E72ADDCD0EB8','pimg/21CD6146A0C84C52BF581D27BD30C3A9.jpeg',699.00,'0',998,'10.6英寸大屏高清智能wifi游戏小平板电脑安卓 酷比魔方 iPlay 10','2019-02-02 01:31:28'),('2D37B671616E47C2AD7887267FEE1139','加厚卫衣男','C494FBBC7EC9472099373CFA8C39A72B','pimg/2D37B671616E47C2AD7887267FEE1139.jpeg',118.00,'0',47,'春秋季学院风刺绣字母开衫加厚卫衣男士条纹宽松外套潮流港风衣服','2019-02-02 03:22:16'),('408390AD259A4FD5908EFDED6E77C5C0','南极人纸尿裤','7D087863075344708DB13AF658F2960A','pimg/408390AD259A4FD5908EFDED6E77C5C0.jpeg',69.90,'1',1122,'南极人纸尿裤L M S XL男女宝宝婴儿尿不湿超薄透气非纸尿片拉拉裤','2019-02-01 03:23:55'),('6AA41CB1F40F475484F5494DEEC8A943','正品VIVO Y67','29701074801B42169BEA178469DF7882','pimg/6AA41CB1F40F475484F5494DEEC8A943.jpeg',820.00,'1',50,'vivo y66手机全网通4G智能5.5英寸手机正品VIVO Y67双卡双待','2019-02-01 02:59:13'),('6F2A8C9135254FEE965464587F37316D','宽松外套','C494FBBC7EC9472099373CFA8C39A72B','pimg/6F2A8C9135254FEE965464587F37316D.jpeg',5500.00,'0',50,'文艺范冬季麂皮绒加厚立领风衣潮流韩版宽松外套落肩大衣男中长款','2019-02-01 03:31:15'),('6FA17A22AA474B57B3BFDE23686AAF82','条纹衬衫','C494FBBC7EC9472099373CFA8C39A72B','pimg/6FA17A22AA474B57B3BFDE23686AAF82.jpeg',998.00,'1',54,'EAFIN′S 17A/W SHIRT趣味条纹衬衫贴布拼接休闲长袖衬衫','2019-02-02 03:27:24'),('7971D76B06C748E585FDE6AB14EE6DF8','廖记棒棒鸡','46EB02B2278049E89A87093274365398','pimg/7971D76B06C748E585FDE6AB14EE6DF8.jpeg',22.90,'0',900,'廖记棒棒鸡麻辣即食下饭菜海白菜香辣味零食小吃特产锁鲜装食品','2019-02-01 03:19:55'),('8DADC35BC85D47798C0874A6D3C58CD0','复古格子大衣','BF62251562CB4CEABE748CAB581ED055','pimg/8DADC35BC85D47798C0874A6D3C58CD0.jpeg',826.00,'1',120,'MUU 暗粉色文艺复古格子双面羊毛呢大衣女A字型外套羊驼毛','2019-02-01 03:26:24'),('8EF1D281F6FD40F8974FF13B5BD8C28A','棕色短款外套男冬','C494FBBC7EC9472099373CFA8C39A72B','pimg/8EF1D281F6FD40F8974FF13B5BD8C28A.jpeg',188.00,'0',45,'【THESSNCE 】全羊毛双面呢纯手工西装领大衣棕色短款外套男冬','2019-02-02 03:33:31'),('91598CF75F3B41A3AAF4A3BAC0AF7FD1','哈伦长裤','C494FBBC7EC9472099373CFA8C39A72B','pimg/91598CF75F3B41A3AAF4A3BAC0AF7FD1.jpeg',118.00,'0',12,'春秋季潮流军绿色大口袋工装裤男士宽松休闲直筒潮牌小脚哈伦长裤','2019-02-01 03:33:27'),('91C8A52726F540A6996732722408BEAE','牛仔裤男直筒','C494FBBC7EC9472099373CFA8C39A72B','pimg/91C8A52726F540A6996732722408BEAE.jpeg',219.00,'1',54,'GRINCH 街头潮牌渐变水洗灰赤耳丹宁牛仔裤男直筒休闲小脚牛仔裤','2019-02-02 03:23:21'),('A5EE6798597C42DDA291B21FE8130B43','蓝色丹宁牛仔裤男','C494FBBC7EC9472099373CFA8C39A72B','pimg/A5EE6798597C42DDA291B21FE8130B43.jpeg',198.00,'0',45,'GRINCH1928复古80后纯浅蓝色丹宁牛仔裤男潮牌百搭宽松小脚牛仔裤','2019-02-02 03:24:54'),('A6D6702013D344E9A4051265D75424AD','皮绒风衣','C494FBBC7EC9472099373CFA8C39A72B','pimg/A6D6702013D344E9A4051265D75424AD.jpeg',168.90,'0',47,'冬季加厚夹棉麂皮绒风衣文艺青年韩版中长款宽松大衣潮男落肩外套','2019-02-02 03:30:14'),('A7C630C9C272494497A627D43D4A31EC','纸尿裤','7D087863075344708DB13AF658F2960A','pimg/A7C630C9C272494497A627D43D4A31EC.jpeg',39.90,'0',1024,'家得宝环腰纸尿裤大码L28片男女宝宝婴儿尿不湿超薄透气秋季SMXL','2019-02-01 03:22:35'),('AB965D96AD984C978D83A0CDB0E38D56','结婚伴郎礼服休闲职业正装','C494FBBC7EC9472099373CFA8C39A72B','pimg/AB965D96AD984C978D83A0CDB0E38D56.jpeg',428.00,'0',36,'西服套装男三件套韩版修身格子新郎结婚伴郎礼服休闲职业正装西装','2019-02-02 03:32:24'),('B60B9A9E7EE344EF82446BCEF5A9CFF2','棉衣外套男','C494FBBC7EC9472099373CFA8C39A72B','pimg/B60B9A9E7EE344EF82446BCEF5A9CFF2.jpeg',1188.00,'0',50,'文艺范冬季麂皮绒加厚立领风衣潮流韩版宽松外套落肩大衣男中长款','2019-02-01 03:32:08'),('BDE0FE98D1D64262A41D55AEA79C26C6','台式组装电脑主机','ED75CBBBD342471EAF29E72ADDCD0EB8','pimg/BDE0FE98D1D64262A41D55AEA79C26C6.jpeg',2336.00,'0',44,'i3 8100/g5400酷睿四核8G家用办公游戏台式组装电脑主机全套整机','2019-02-01 03:07:40'),('C29BF73F52DB4A28ACDDC880A85CC3F8','电脑外星人','ED75CBBBD342471EAF29E72ADDCD0EB8','pimg/C29BF73F52DB4A28ACDDC880A85CC3F8.jpeg',3699.00,'1',60,'金属独显15寸八代游戏本 酷睿8代i7商务学生办公笔记本电脑外星人','2019-02-01 03:14:07'),('C6B07046E0F14B0BBA05BF582F6CC686','iPhone 7','29701074801B42169BEA178469DF7882','pimg/C6B07046E0F14B0BBA05BF582F6CC686.jpeg',5500.00,'1',12,'Apple/苹果 iPhone 7 4.7英寸 正品行货 全新原封未激活','2019-02-01 03:00:17'),('D2A1EE25EA1849CEB47CE866C2C4589A','针织衫外套男','C494FBBC7EC9472099373CFA8C39A72B','pimg/D2A1EE25EA1849CEB47CE866C2C4589A.jpeg',188.00,'1',45,'GRINCH 2018 AW冬季美式麻花粗线加厚针织衫外套男高品质开衫毛衣','2019-02-02 03:21:22'),('D35D3D6F22484C24B795BC7068B7C23F','洪湖农家泡藕','46EB02B2278049E89A87093274365398','pimg/D35D3D6F22484C24B795BC7068B7C23F.jpeg',52.80,'0',44,'洪湖农家泡藕带6袋酸辣藕尖湖北特产洪湖藕带半成品菜家乡快手菜\r\n开袋即食 炒食更美味 酸爽下饭餐厅酒店热卖','2019-02-01 03:17:27'),('D36CAD64268942EC9950B8FCE02CB92D','羊奶粉','7D087863075344708DB13AF658F2960A','pimg/D36CAD64268942EC9950B8FCE02CB92D.jpeg',230.00,'0',1024,'俄罗斯版荷兰版佳贝艾特kabrita金装羊奶粉3段800g一桶包邮','2019-02-01 03:24:57'),('D61B0704DE5E46C186D3A6D2F5A75792','宽松衬衣','C494FBBC7EC9472099373CFA8C39A72B','pimg/D61B0704DE5E46C186D3A6D2F5A75792.jpeg',68.00,'1',54,'日系下摆毛边设计男士免烫格子宽松衬衣韩版青年春季复古长袖衬衫','2019-02-02 03:26:28'),('DD24E3F21C394770BEA1861F8E86C9C6','西装马甲套装男','C494FBBC7EC9472099373CFA8C39A72B','pimg/DD24E3F21C394770BEA1861F8E86C9C6.jpeg',1088.00,'1',94,'美国皇家保罗品牌西装马甲套装男三件套婚礼礼服伴郎新郎结婚轻奢','2019-02-02 03:35:06'),('E2B738F4E7F6422EA6C571F0DAAA9F35','广西新鲜荔浦芋头','46EB02B2278049E89A87093274365398','pimg/E2B738F4E7F6422EA6C571F0DAAA9F35.jpeg',39.80,'1',500,'广西新鲜荔浦芋头10斤 农家蔬菜香芋槟榔芋小毛芋紫藤芋批发包邮\r\n收藏下单 立减10元 买5斤送5斤 精选一级果','2019-02-01 03:18:39'),('F8F41E6C7F3443B1BC3179E8ACAE93CA','艾特逆光女装','BF62251562CB4CEABE748CAB581ED055','pimg/F8F41E6C7F3443B1BC3179E8ACAE93CA.jpeg',129.00,'0',20,'艾特逆光女装2018冬季新款 加厚宽松拼色中长连帽卫衣绒衫外套 海量新品 潮流穿搭 玩趣互动','2019-02-01 03:27:58'),('FB84E7F5A2B84EBA8155B32AFC13D0A7','外星人笔记本Alienware','ED75CBBBD342471EAF29E72ADDCD0EB8','pimg/FB84E7F5A2B84EBA8155B32AFC13D0A7.jpeg',25899.39,'1',48,'Alienware/外星人笔记本Alienware17 R5/R4/15R3外星人游戏本电脑','2019-02-01 03:12:39');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `protype`
--

DROP TABLE IF EXISTS `protype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `protype` (
  `ptid` varchar(32) NOT NULL,
  `ptname` varchar(50) NOT NULL,
  `ptstatus` varchar(20) NOT NULL,
  PRIMARY KEY (`ptid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `protype`
--

LOCK TABLES `protype` WRITE;
/*!40000 ALTER TABLE `protype` DISABLE KEYS */;
INSERT INTO `protype` VALUES ('29701074801B42169BEA178469DF7882','手机数码','1'),('46EB02B2278049E89A87093274365398','新鲜食材','1'),('7D087863075344708DB13AF658F2960A','母婴用品','1'),('9CFCD315A1974E08A3104F3AAEDAEBC2','测试','1'),('BF62251562CB4CEABE748CAB581ED055','精品女装','1'),('C494FBBC7EC9472099373CFA8C39A72B','时尚男装','1'),('ED75CBBBD342471EAF29E72ADDCD0EB8','电脑主机','1');
/*!40000 ALTER TABLE `protype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid` varchar(32) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

