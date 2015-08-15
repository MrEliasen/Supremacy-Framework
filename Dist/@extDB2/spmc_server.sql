CREATE TABLE IF NOT EXISTS `spmc_players` (
  `p_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `p_steam64` varchar(64) NOT NULL,
  `p_name` varchar(100) NOT NULL,
  `p_money` int(10) unsigned NOT NULL,
  `p_stats` varchar(20) NOT NULL,
  `p_equipment` text NOT NULL,
  `p_joindate` timestamp NOT NULL,
  `p_lastactive` timestamp NOT NULL,
  PRIMARY KEY (`p_id`),
  UNIQUE KEY `p_steam64` (`p_steam64`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;