
CREATE TABLE IF NOT EXISTS `guidebook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page` varchar(50) NOT NULL DEFAULT '0',
  `data` longtext NOT NULL DEFAULT '',
  `page_name` varchar(50) DEFAULT NULL,
  `sub` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
