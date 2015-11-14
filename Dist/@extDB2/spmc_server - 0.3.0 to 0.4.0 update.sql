ALTER TABLE `spmc_players` ADD `p_skills` TEXT NOT NULL AFTER `p_equipment`;
ALTER TABLE `spmc_players` ADD `p_experience` INT(10) UNSIGNED NOT NULL AFTER `p_skills`;