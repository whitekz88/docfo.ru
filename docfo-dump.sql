-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: docfo
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `qa_blobs`
--

DROP TABLE IF EXISTS `qa_blobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_blobs` (
  `blobid` bigint unsigned NOT NULL,
  `format` varchar(20) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `content` mediumblob,
  `filename` varchar(255) DEFAULT NULL,
  `userid` int unsigned DEFAULT NULL,
  `cookieid` bigint unsigned DEFAULT NULL,
  `createip` varbinary(16) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`blobid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_blobs`
--

LOCK TABLES `qa_blobs` WRITE;
/*!40000 ALTER TABLE `qa_blobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_blobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_cache`
--

DROP TABLE IF EXISTS `qa_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_cache` (
  `type` char(8) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `cacheid` bigint unsigned NOT NULL DEFAULT '0',
  `content` mediumblob NOT NULL,
  `created` datetime NOT NULL,
  `lastread` datetime NOT NULL,
  PRIMARY KEY (`type`,`cacheid`),
  KEY `lastread` (`lastread`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_cache`
--

LOCK TABLES `qa_cache` WRITE;
/*!40000 ALTER TABLE `qa_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_categories`
--

DROP TABLE IF EXISTS `qa_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_categories` (
  `categoryid` int unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int unsigned DEFAULT NULL,
  `title` varchar(80) NOT NULL,
  `tags` varchar(200) NOT NULL,
  `content` varchar(800) NOT NULL DEFAULT '',
  `qcount` int unsigned NOT NULL DEFAULT '0',
  `position` smallint unsigned NOT NULL,
  `backpath` varchar(804) NOT NULL DEFAULT '',
  PRIMARY KEY (`categoryid`),
  UNIQUE KEY `parentid` (`parentid`,`tags`),
  UNIQUE KEY `parentid_2` (`parentid`,`position`),
  KEY `backpath` (`backpath`(200))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_categories`
--

LOCK TABLES `qa_categories` WRITE;
/*!40000 ALTER TABLE `qa_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_categorymetas`
--

DROP TABLE IF EXISTS `qa_categorymetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_categorymetas` (
  `categoryid` int unsigned NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  PRIMARY KEY (`categoryid`,`title`),
  CONSTRAINT `qa_categorymetas_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `qa_categories` (`categoryid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_categorymetas`
--

LOCK TABLES `qa_categorymetas` WRITE;
/*!40000 ALTER TABLE `qa_categorymetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_categorymetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_contentwords`
--

DROP TABLE IF EXISTS `qa_contentwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_contentwords` (
  `postid` int unsigned NOT NULL,
  `wordid` int unsigned NOT NULL,
  `count` tinyint unsigned NOT NULL,
  `type` enum('Q','A','C','NOTE') NOT NULL,
  `questionid` int unsigned NOT NULL,
  KEY `postid` (`postid`),
  KEY `wordid` (`wordid`),
  CONSTRAINT `qa_contentwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  CONSTRAINT `qa_contentwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_contentwords`
--

LOCK TABLES `qa_contentwords` WRITE;
/*!40000 ALTER TABLE `qa_contentwords` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_contentwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_cookies`
--

DROP TABLE IF EXISTS `qa_cookies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_cookies` (
  `cookieid` bigint unsigned NOT NULL,
  `created` datetime NOT NULL,
  `createip` varbinary(16) NOT NULL,
  `written` datetime DEFAULT NULL,
  `writeip` varbinary(16) DEFAULT NULL,
  PRIMARY KEY (`cookieid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_cookies`
--

LOCK TABLES `qa_cookies` WRITE;
/*!40000 ALTER TABLE `qa_cookies` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_cookies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_iplimits`
--

DROP TABLE IF EXISTS `qa_iplimits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_iplimits` (
  `ip` varbinary(16) NOT NULL,
  `action` char(1) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `period` int unsigned NOT NULL,
  `count` smallint unsigned NOT NULL,
  UNIQUE KEY `ip` (`ip`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_iplimits`
--

LOCK TABLES `qa_iplimits` WRITE;
/*!40000 ALTER TABLE `qa_iplimits` DISABLE KEYS */;
INSERT INTO `qa_iplimits` VALUES (_binary 'Ô¢˜“','L',478643,1);
/*!40000 ALTER TABLE `qa_iplimits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_messages`
--

DROP TABLE IF EXISTS `qa_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_messages` (
  `messageid` int unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('PUBLIC','PRIVATE') NOT NULL DEFAULT 'PRIVATE',
  `fromuserid` int unsigned DEFAULT NULL,
  `touserid` int unsigned DEFAULT NULL,
  `fromhidden` tinyint unsigned NOT NULL DEFAULT '0',
  `tohidden` tinyint unsigned NOT NULL DEFAULT '0',
  `content` varchar(12000) NOT NULL,
  `format` varchar(20) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`messageid`),
  KEY `type` (`type`,`fromuserid`,`touserid`,`created`),
  KEY `touserid` (`touserid`,`type`,`created`),
  KEY `fromhidden` (`fromhidden`),
  KEY `tohidden` (`tohidden`),
  KEY `qa_messages_ibfk_1` (`fromuserid`),
  CONSTRAINT `qa_messages_ibfk_1` FOREIGN KEY (`fromuserid`) REFERENCES `qa_users` (`userid`) ON DELETE SET NULL,
  CONSTRAINT `qa_messages_ibfk_2` FOREIGN KEY (`touserid`) REFERENCES `qa_users` (`userid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_messages`
--

LOCK TABLES `qa_messages` WRITE;
/*!40000 ALTER TABLE `qa_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_options`
--

DROP TABLE IF EXISTS `qa_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_options` (
  `title` varchar(40) NOT NULL,
  `content` varchar(12000) NOT NULL,
  PRIMARY KEY (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_options`
--

LOCK TABLES `qa_options` WRITE;
/*!40000 ALTER TABLE `qa_options` DISABLE KEYS */;
INSERT INTO `qa_options` VALUES ('allow_anonymous_naming','1'),('allow_login_email_only',''),('avatar_allow_gravatar','1'),('avatar_allow_upload','1'),('avatar_default_show',''),('avatar_users_size','30'),('block_bad_usernames','anonymous'),('block_ips_write',''),('cache_flaggedcount','0'),('cache_qcount','0'),('cache_queuedcount','0'),('cache_tagcount',''),('cache_userpointscount','1'),('captcha_module',''),('captcha_on_anon_post','1'),('columns_tags','3'),('columns_users','2'),('comment_on_as','1'),('comment_on_qs','0'),('confirm_user_emails','1'),('custom_footer',''),('custom_header',''),('custom_in_head',''),('db_version','67'),('do_ask_check_qs','0'),('do_complete_tags','1'),('do_count_q_views','1'),('do_example_tags','1'),('editor_for_qs','WYSIWYG Editor'),('enabled_plugins',''),('event_logger_to_database',''),('event_logger_to_files',''),('extra_field_active',''),('feedback_email','job.beloshapkin@gmail.com'),('feedback_enabled','1'),('feed_for_qa','1'),('feed_for_questions','1'),('feed_per_category','1'),('flagging_of_posts','1'),('form_security_salt','b38k9tyibtphmrgf8p0qdgy67clenifc'),('from_email','no-reply@91.198.220.228'),('home_description',''),('logo_height',''),('logo_show',''),('logo_url',''),('logo_width',''),('max_rate_ip_logins','20'),('max_rate_ip_qs','20'),('max_rate_user_qs','10'),('minify_html','1'),('moderate_users',''),('nav_activity',''),('nav_ask','1'),('nav_categories',''),('nav_home',''),('nav_hot',''),('nav_qa_is_home',''),('nav_questions','1'),('nav_tags','1'),('nav_unanswered','1'),('nav_users','1'),('neat_urls','5'),('notify_users_default','1'),('pages_prev_next','3'),('page_size_ask_tags','5'),('page_size_home','20'),('page_size_qs','20'),('page_size_tags','30'),('page_size_users','30'),('permit_delete_hidden','40'),('permit_hide_show','70'),('permit_moderate','100'),('permit_post_a','150'),('permit_post_c','150'),('permit_post_q','150'),('permit_view_new_users_page','70'),('permit_view_special_users_page','40'),('permit_view_voters_flaggers','20'),('points_a_selected','30'),('points_a_voted_max_gain','20'),('points_a_voted_max_loss','5'),('points_base','100'),('points_c_voted_max_gain','10'),('points_c_voted_max_loss','3'),('points_multiple','10'),('points_per_a_voted',''),('points_per_a_voted_down','2'),('points_per_a_voted_up','2'),('points_per_c_voted_down','0'),('points_per_c_voted_up','0'),('points_per_q_voted',''),('points_per_q_voted_down','1'),('points_per_q_voted_up','1'),('points_post_a','4'),('points_post_q','2'),('points_q_voted_max_gain','10'),('points_q_voted_max_loss','3'),('points_select_a','3'),('points_vote_down_a','1'),('points_vote_down_q','1'),('points_vote_on_a',''),('points_vote_on_q',''),('points_vote_up_a','1'),('points_vote_up_q','1'),('register_notify_admin',''),('show_compact_numbers','1'),('show_custom_ask',''),('show_custom_footer',''),('show_custom_header',''),('show_custom_home',''),('show_custom_in_head',''),('show_custom_sidebar','1'),('show_custom_sidepanel',''),('show_custom_welcome','0'),('show_notice_visitor',''),('show_notice_welcome',''),('site_language',''),('site_maintenance','1'),('site_text_direction','ltr'),('site_theme','SnowFlat'),('site_theme_mobile','SnowFlat'),('site_title','Docfo Q&A'),('site_url','http://91.198.220.228/'),('smtp_active',''),('tags_or_categories','tc'),('tag_separator_comma',''),('wysiwyg_editor_upload_images','');
/*!40000 ALTER TABLE `qa_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_pages`
--

DROP TABLE IF EXISTS `qa_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_pages` (
  `pageid` smallint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL,
  `nav` char(1) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `position` smallint unsigned NOT NULL,
  `flags` tinyint unsigned NOT NULL,
  `permit` tinyint unsigned DEFAULT NULL,
  `tags` varchar(200) NOT NULL,
  `heading` varchar(800) DEFAULT NULL,
  `content` mediumtext,
  PRIMARY KEY (`pageid`),
  UNIQUE KEY `position` (`position`),
  KEY `tags` (`tags`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_pages`
--

LOCK TABLES `qa_pages` WRITE;
/*!40000 ALTER TABLE `qa_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_postmetas`
--

DROP TABLE IF EXISTS `qa_postmetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_postmetas` (
  `postid` int unsigned NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  PRIMARY KEY (`postid`,`title`),
  CONSTRAINT `qa_postmetas_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_postmetas`
--

LOCK TABLES `qa_postmetas` WRITE;
/*!40000 ALTER TABLE `qa_postmetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_postmetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_posts`
--

DROP TABLE IF EXISTS `qa_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_posts` (
  `postid` int unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('Q','A','C','Q_HIDDEN','A_HIDDEN','C_HIDDEN','Q_QUEUED','A_QUEUED','C_QUEUED','NOTE') NOT NULL,
  `parentid` int unsigned DEFAULT NULL,
  `categoryid` int unsigned DEFAULT NULL,
  `catidpath1` int unsigned DEFAULT NULL,
  `catidpath2` int unsigned DEFAULT NULL,
  `catidpath3` int unsigned DEFAULT NULL,
  `acount` smallint unsigned NOT NULL DEFAULT '0',
  `amaxvote` smallint unsigned NOT NULL DEFAULT '0',
  `selchildid` int unsigned DEFAULT NULL,
  `closedbyid` int unsigned DEFAULT NULL,
  `userid` int unsigned DEFAULT NULL,
  `cookieid` bigint unsigned DEFAULT NULL,
  `createip` varbinary(16) DEFAULT NULL,
  `lastuserid` int unsigned DEFAULT NULL,
  `lastip` varbinary(16) DEFAULT NULL,
  `upvotes` smallint unsigned NOT NULL DEFAULT '0',
  `downvotes` smallint unsigned NOT NULL DEFAULT '0',
  `netvotes` smallint NOT NULL DEFAULT '0',
  `lastviewip` varbinary(16) DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `hotness` float DEFAULT NULL,
  `flagcount` tinyint unsigned NOT NULL DEFAULT '0',
  `format` varchar(20) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `updatetype` char(1) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `title` varchar(800) DEFAULT NULL,
  `content` varchar(12000) DEFAULT NULL,
  `tags` varchar(800) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `notify` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`postid`),
  KEY `type` (`type`,`created`),
  KEY `type_2` (`type`,`acount`,`created`),
  KEY `type_4` (`type`,`netvotes`,`created`),
  KEY `type_5` (`type`,`views`,`created`),
  KEY `type_6` (`type`,`hotness`),
  KEY `type_7` (`type`,`amaxvote`,`created`),
  KEY `parentid` (`parentid`,`type`),
  KEY `userid` (`userid`,`type`,`created`),
  KEY `selchildid` (`selchildid`,`type`,`created`),
  KEY `closedbyid` (`closedbyid`),
  KEY `catidpath1` (`catidpath1`,`type`,`created`),
  KEY `catidpath2` (`catidpath2`,`type`,`created`),
  KEY `catidpath3` (`catidpath3`,`type`,`created`),
  KEY `categoryid` (`categoryid`,`type`,`created`),
  KEY `createip` (`createip`,`created`),
  KEY `updated` (`updated`,`type`),
  KEY `flagcount` (`flagcount`,`created`,`type`),
  KEY `catidpath1_2` (`catidpath1`,`updated`,`type`),
  KEY `catidpath2_2` (`catidpath2`,`updated`,`type`),
  KEY `catidpath3_2` (`catidpath3`,`updated`,`type`),
  KEY `categoryid_2` (`categoryid`,`updated`,`type`),
  KEY `lastuserid` (`lastuserid`,`updated`,`type`),
  KEY `lastip` (`lastip`,`updated`,`type`),
  CONSTRAINT `qa_posts_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE SET NULL,
  CONSTRAINT `qa_posts_ibfk_2` FOREIGN KEY (`parentid`) REFERENCES `qa_posts` (`postid`),
  CONSTRAINT `qa_posts_ibfk_3` FOREIGN KEY (`categoryid`) REFERENCES `qa_categories` (`categoryid`) ON DELETE SET NULL,
  CONSTRAINT `qa_posts_ibfk_4` FOREIGN KEY (`closedbyid`) REFERENCES `qa_posts` (`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_posts`
--

LOCK TABLES `qa_posts` WRITE;
/*!40000 ALTER TABLE `qa_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_posttags`
--

DROP TABLE IF EXISTS `qa_posttags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_posttags` (
  `postid` int unsigned NOT NULL,
  `wordid` int unsigned NOT NULL,
  `postcreated` datetime NOT NULL,
  KEY `postid` (`postid`),
  KEY `wordid` (`wordid`,`postcreated`),
  CONSTRAINT `qa_posttags_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  CONSTRAINT `qa_posttags_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_posttags`
--

LOCK TABLES `qa_posttags` WRITE;
/*!40000 ALTER TABLE `qa_posttags` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_posttags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_sharedevents`
--

DROP TABLE IF EXISTS `qa_sharedevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_sharedevents` (
  `entitytype` char(1) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `entityid` int unsigned NOT NULL,
  `questionid` int unsigned NOT NULL,
  `lastpostid` int unsigned NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `lastuserid` int unsigned DEFAULT NULL,
  `updated` datetime NOT NULL,
  KEY `entitytype` (`entitytype`,`entityid`,`updated`),
  KEY `questionid` (`questionid`,`entitytype`,`entityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_sharedevents`
--

LOCK TABLES `qa_sharedevents` WRITE;
/*!40000 ALTER TABLE `qa_sharedevents` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_sharedevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_tagmetas`
--

DROP TABLE IF EXISTS `qa_tagmetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_tagmetas` (
  `tag` varchar(80) NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  PRIMARY KEY (`tag`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_tagmetas`
--

LOCK TABLES `qa_tagmetas` WRITE;
/*!40000 ALTER TABLE `qa_tagmetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_tagmetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_tagwords`
--

DROP TABLE IF EXISTS `qa_tagwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_tagwords` (
  `postid` int unsigned NOT NULL,
  `wordid` int unsigned NOT NULL,
  KEY `postid` (`postid`),
  KEY `wordid` (`wordid`),
  CONSTRAINT `qa_tagwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  CONSTRAINT `qa_tagwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_tagwords`
--

LOCK TABLES `qa_tagwords` WRITE;
/*!40000 ALTER TABLE `qa_tagwords` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_tagwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_titlewords`
--

DROP TABLE IF EXISTS `qa_titlewords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_titlewords` (
  `postid` int unsigned NOT NULL,
  `wordid` int unsigned NOT NULL,
  KEY `postid` (`postid`),
  KEY `wordid` (`wordid`),
  CONSTRAINT `qa_titlewords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  CONSTRAINT `qa_titlewords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_titlewords`
--

LOCK TABLES `qa_titlewords` WRITE;
/*!40000 ALTER TABLE `qa_titlewords` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_titlewords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_userevents`
--

DROP TABLE IF EXISTS `qa_userevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_userevents` (
  `userid` int unsigned NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `entityid` int unsigned NOT NULL,
  `questionid` int unsigned NOT NULL,
  `lastpostid` int unsigned NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `lastuserid` int unsigned DEFAULT NULL,
  `updated` datetime NOT NULL,
  KEY `userid` (`userid`,`updated`),
  KEY `questionid` (`questionid`,`userid`),
  CONSTRAINT `qa_userevents_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_userevents`
--

LOCK TABLES `qa_userevents` WRITE;
/*!40000 ALTER TABLE `qa_userevents` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_userevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_userfavorites`
--

DROP TABLE IF EXISTS `qa_userfavorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_userfavorites` (
  `userid` int unsigned NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `entityid` int unsigned NOT NULL,
  `nouserevents` tinyint unsigned NOT NULL,
  PRIMARY KEY (`userid`,`entitytype`,`entityid`),
  KEY `userid` (`userid`,`nouserevents`),
  KEY `entitytype` (`entitytype`,`entityid`,`nouserevents`),
  CONSTRAINT `qa_userfavorites_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_userfavorites`
--

LOCK TABLES `qa_userfavorites` WRITE;
/*!40000 ALTER TABLE `qa_userfavorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_userfavorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_userfields`
--

DROP TABLE IF EXISTS `qa_userfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_userfields` (
  `fieldid` smallint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL,
  `content` varchar(40) DEFAULT NULL,
  `position` smallint unsigned NOT NULL,
  `flags` tinyint unsigned NOT NULL,
  `permit` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`fieldid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_userfields`
--

LOCK TABLES `qa_userfields` WRITE;
/*!40000 ALTER TABLE `qa_userfields` DISABLE KEYS */;
INSERT INTO `qa_userfields` VALUES (1,'name',NULL,1,0,150),(2,'location',NULL,2,0,150),(3,'website',NULL,3,2,150),(4,'about',NULL,4,1,150);
/*!40000 ALTER TABLE `qa_userfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_userlevels`
--

DROP TABLE IF EXISTS `qa_userlevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_userlevels` (
  `userid` int unsigned NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `entityid` int unsigned NOT NULL,
  `level` tinyint unsigned DEFAULT NULL,
  UNIQUE KEY `userid` (`userid`,`entitytype`,`entityid`),
  KEY `entitytype` (`entitytype`,`entityid`),
  CONSTRAINT `qa_userlevels_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_userlevels`
--

LOCK TABLES `qa_userlevels` WRITE;
/*!40000 ALTER TABLE `qa_userlevels` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_userlevels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_userlimits`
--

DROP TABLE IF EXISTS `qa_userlimits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_userlimits` (
  `userid` int unsigned NOT NULL,
  `action` char(1) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `period` int unsigned NOT NULL,
  `count` smallint unsigned NOT NULL,
  UNIQUE KEY `userid` (`userid`,`action`),
  CONSTRAINT `qa_userlimits_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_userlimits`
--

LOCK TABLES `qa_userlimits` WRITE;
/*!40000 ALTER TABLE `qa_userlimits` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_userlimits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_userlogins`
--

DROP TABLE IF EXISTS `qa_userlogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_userlogins` (
  `userid` int unsigned NOT NULL,
  `source` varchar(16) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `identifier` varbinary(1024) NOT NULL,
  `identifiermd5` binary(16) NOT NULL,
  KEY `source` (`source`,`identifiermd5`),
  KEY `userid` (`userid`),
  CONSTRAINT `qa_userlogins_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_userlogins`
--

LOCK TABLES `qa_userlogins` WRITE;
/*!40000 ALTER TABLE `qa_userlogins` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_userlogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_usermetas`
--

DROP TABLE IF EXISTS `qa_usermetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_usermetas` (
  `userid` int unsigned NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  PRIMARY KEY (`userid`,`title`),
  CONSTRAINT `qa_usermetas_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_usermetas`
--

LOCK TABLES `qa_usermetas` WRITE;
/*!40000 ALTER TABLE `qa_usermetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_usermetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_usernotices`
--

DROP TABLE IF EXISTS `qa_usernotices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_usernotices` (
  `noticeid` int unsigned NOT NULL AUTO_INCREMENT,
  `userid` int unsigned NOT NULL,
  `content` varchar(12000) NOT NULL,
  `format` varchar(20) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `tags` varchar(200) DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`noticeid`),
  KEY `userid` (`userid`,`created`),
  CONSTRAINT `qa_usernotices_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_usernotices`
--

LOCK TABLES `qa_usernotices` WRITE;
/*!40000 ALTER TABLE `qa_usernotices` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_usernotices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_userpoints`
--

DROP TABLE IF EXISTS `qa_userpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_userpoints` (
  `userid` int unsigned NOT NULL,
  `points` int NOT NULL DEFAULT '0',
  `qposts` mediumint NOT NULL DEFAULT '0',
  `aposts` mediumint NOT NULL DEFAULT '0',
  `cposts` mediumint NOT NULL DEFAULT '0',
  `aselects` mediumint NOT NULL DEFAULT '0',
  `aselecteds` mediumint NOT NULL DEFAULT '0',
  `qupvotes` mediumint NOT NULL DEFAULT '0',
  `qdownvotes` mediumint NOT NULL DEFAULT '0',
  `aupvotes` mediumint NOT NULL DEFAULT '0',
  `adownvotes` mediumint NOT NULL DEFAULT '0',
  `cupvotes` mediumint NOT NULL DEFAULT '0',
  `cdownvotes` mediumint NOT NULL DEFAULT '0',
  `qvoteds` int NOT NULL DEFAULT '0',
  `avoteds` int NOT NULL DEFAULT '0',
  `cvoteds` int NOT NULL DEFAULT '0',
  `upvoteds` int NOT NULL DEFAULT '0',
  `downvoteds` int NOT NULL DEFAULT '0',
  `bonus` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`),
  KEY `points` (`points`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_userpoints`
--

LOCK TABLES `qa_userpoints` WRITE;
/*!40000 ALTER TABLE `qa_userpoints` DISABLE KEYS */;
INSERT INTO `qa_userpoints` VALUES (1,100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `qa_userpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_userprofile`
--

DROP TABLE IF EXISTS `qa_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_userprofile` (
  `userid` int unsigned NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  UNIQUE KEY `userid` (`userid`,`title`),
  CONSTRAINT `qa_userprofile_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_userprofile`
--

LOCK TABLES `qa_userprofile` WRITE;
/*!40000 ALTER TABLE `qa_userprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_users`
--

DROP TABLE IF EXISTS `qa_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_users` (
  `userid` int unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `createip` varbinary(16) NOT NULL,
  `email` varchar(80) NOT NULL,
  `handle` varchar(20) NOT NULL,
  `avatarblobid` bigint unsigned DEFAULT NULL,
  `avatarwidth` smallint unsigned DEFAULT NULL,
  `avatarheight` smallint unsigned DEFAULT NULL,
  `passsalt` binary(16) DEFAULT NULL,
  `passcheck` binary(20) DEFAULT NULL,
  `passhash` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `level` tinyint unsigned NOT NULL,
  `loggedin` datetime NOT NULL,
  `loginip` varbinary(16) NOT NULL,
  `written` datetime DEFAULT NULL,
  `writeip` varbinary(16) DEFAULT NULL,
  `emailcode` char(8) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `sessioncode` char(8) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `sessionsource` varchar(16) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT '',
  `flags` smallint unsigned NOT NULL DEFAULT '0',
  `wallposts` mediumint NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`),
  KEY `email` (`email`),
  KEY `handle` (`handle`),
  KEY `level` (`level`),
  KEY `created` (`created`,`level`,`flags`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_users`
--

LOCK TABLES `qa_users` WRITE;
/*!40000 ALTER TABLE `qa_users` DISABLE KEYS */;
INSERT INTO `qa_users` VALUES (1,'2024-08-07 17:38:48',_binary '\\7¡A','job.beloshapkin@gmail.com','docfo_superadmin',NULL,NULL,NULL,NULL,NULL,'$2y$10$MMZbNJmU7.tJLmZNOxkOS.R6r8J6Nwj4OPKcKzdIXUWWO7wwaAENW',120,'2024-08-08 14:02:42',_binary 'Ô¢˜“',NULL,NULL,'','w0zmbu7k',NULL,0,0);
/*!40000 ALTER TABLE `qa_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_uservotes`
--

DROP TABLE IF EXISTS `qa_uservotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_uservotes` (
  `postid` int unsigned NOT NULL,
  `userid` int unsigned NOT NULL,
  `vote` tinyint NOT NULL,
  `flag` tinyint NOT NULL,
  `votecreated` datetime DEFAULT NULL,
  `voteupdated` datetime DEFAULT NULL,
  UNIQUE KEY `userid` (`userid`,`postid`),
  KEY `postid` (`postid`),
  KEY `voted` (`votecreated`,`voteupdated`),
  CONSTRAINT `qa_uservotes_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  CONSTRAINT `qa_uservotes_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_uservotes`
--

LOCK TABLES `qa_uservotes` WRITE;
/*!40000 ALTER TABLE `qa_uservotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_uservotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_widgets`
--

DROP TABLE IF EXISTS `qa_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_widgets` (
  `widgetid` smallint unsigned NOT NULL AUTO_INCREMENT,
  `place` char(2) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `position` smallint unsigned NOT NULL,
  `tags` varchar(800) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `title` varchar(80) NOT NULL,
  PRIMARY KEY (`widgetid`),
  UNIQUE KEY `position` (`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_widgets`
--

LOCK TABLES `qa_widgets` WRITE;
/*!40000 ALTER TABLE `qa_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_words`
--

DROP TABLE IF EXISTS `qa_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_words` (
  `wordid` int unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(80) NOT NULL,
  `titlecount` int unsigned NOT NULL DEFAULT '0',
  `contentcount` int unsigned NOT NULL DEFAULT '0',
  `tagwordcount` int unsigned NOT NULL DEFAULT '0',
  `tagcount` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`wordid`),
  KEY `word` (`word`),
  KEY `tagcount` (`tagcount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_words`
--

LOCK TABLES `qa_words` WRITE;
/*!40000 ALTER TABLE `qa_words` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_words` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-09  9:41:43
