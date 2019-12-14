-- MySQL Workbench Synchronization
-- Generated: 2018-12-03 16:09
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Elizabeth

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `hffit1_db` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `hffit1_db`.`user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(75) NOT NULL,
  `password` VARCHAR(75) NULL DEFAULT NULL,
  `firstname` VARCHAR(75) NULL DEFAULT NULL,
  `lastname` VARCHAR(75) NULL DEFAULT NULL,
  `validation_token` VARCHAR(40) NULL DEFAULT NULL,
  `is_activated` TINYINT(2) NULL DEFAULT 0,
  `user_roles_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `user_roles_id`),
  INDEX `fk_user_user_roles1_idx` (`user_roles_id` ASC),
  CONSTRAINT `fk_user_user_roles1`
    FOREIGN KEY (`user_roles_id`)
    REFERENCES `hffit1_db`.`user_roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `hffit1_db`.`ticket` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `ticket_type_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `ticket_type_id`),
  INDEX `fk_ticket_ticket_type1_idx` (`ticket_type_id` ASC),
  CONSTRAINT `fk_ticket_ticket_type1`
    FOREIGN KEY (`ticket_type_id`)
    REFERENCES `hffit1_db`.`ticket_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `hffit1_db`.`ticket_type` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `type_of_ticket` VARCHAR(75) NOT NULL,
  `price` FLOAT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `hffit1_db`.`event` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `amount` INT(11) NOT NULL,
  `date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `hffit1_db`.`venue` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(75) NOT NULL,
  `location` VARCHAR(200) NULL DEFAULT NULL,
  `description` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `hffit1_db`.`tour` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `tour_name` VARCHAR(75) NULL DEFAULT NULL,
  `post_tour_code` VARCHAR(75) NULL DEFAULT NULL,
  `language` VARCHAR(50) NULL DEFAULT NULL,
  `event_id` INT(11) NOT NULL,
  `guides_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `event_id`, `guides_id`),
  INDEX `fk_tour_event1_idx` (`event_id` ASC),
  INDEX `fk_tour_guides1_idx` (`guides_id` ASC),
  CONSTRAINT `fk_tour_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `hffit1_db`.`event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tour_guides1`
    FOREIGN KEY (`guides_id`)
    REFERENCES `hffit1_db`.`guides` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `hffit1_db`.`food` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `reservation_comments` VARCHAR(350) NULL DEFAULT NULL,
  `event_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `event_id`),
  INDEX `fk_food_event1_idx` (`event_id` ASC),
  CONSTRAINT `fk_food_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `hffit1_db`.`event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `hffit1_db`.`artist` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `artist_name` VARCHAR(75) NOT NULL,
  `band_type` VARCHAR(50) NULL DEFAULT NULL,
  `artist_info` LONGTEXT NULL DEFAULT NULL,
  `event_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `event_id`),
  INDEX `fk_artist_event1_idx` (`event_id` ASC),
  CONSTRAINT `fk_artist_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `hffit1_db`.`event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `hffit1_db`.`guides` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(75) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `hffit1_db`.`volunteer` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(75) NULL DEFAULT NULL,
  `lastname` VARCHAR(75) NULL DEFAULT NULL,
  `password` VARCHAR(150) NULL DEFAULT NULL,
  `profile_picture_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `profile_picture_id`),
  INDEX `fk_volunteer_profile_picture1_idx` (`profile_picture_id` ASC),
  CONSTRAINT `fk_volunteer_profile_picture1`
    FOREIGN KEY (`profile_picture_id`)
    REFERENCES `hffit1_db`.`profile_picture` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `hffit1_db`.`cms_log` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `editor` VARCHAR(200) NULL DEFAULT NULL,
  `date` DATE NULL DEFAULT NULL,
  `description` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `hffit1_db`.`user_has_ticket` (
  `user_id` INT(11) NOT NULL,
  `ticket_id` INT(11) NOT NULL,
  `total_price` FLOAT(11) NOT NULL,
  `amount_of_adults` INT(11) NULL DEFAULT NULL,
  `amount_of_children` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`, `ticket_id`),
  INDEX `fk_user_has_ticket_ticket1_idx` (`ticket_id` ASC),
  INDEX `fk_user_has_ticket_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_ticket_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `hffit1_db`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_ticket_ticket1`
    FOREIGN KEY (`ticket_id`)
    REFERENCES `hffit1_db`.`ticket` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `hffit1_db`.`event_has_ticket` (
  `event_id` INT(11) NOT NULL,
  `ticket_id` INT(11) NOT NULL,
  PRIMARY KEY (`event_id`, `ticket_id`),
  INDEX `fk_event_has_ticket_ticket1_idx` (`ticket_id` ASC),
  INDEX `fk_event_has_ticket_event1_idx` (`event_id` ASC),
  CONSTRAINT `fk_event_has_ticket_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `hffit1_db`.`event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_has_ticket_ticket1`
    FOREIGN KEY (`ticket_id`)
    REFERENCES `hffit1_db`.`ticket` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `hffit1_db`.`event_has_venue` (
  `event_id` INT(11) NOT NULL,
  `venue_id` INT(11) NOT NULL,
  PRIMARY KEY (`event_id`, `venue_id`),
  INDEX `fk_event_has_venue_venue1_idx` (`venue_id` ASC),
  INDEX `fk_event_has_venue_event1_idx` (`event_id` ASC),
  CONSTRAINT `fk_event_has_venue_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `hffit1_db`.`event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_has_venue_venue1`
    FOREIGN KEY (`venue_id`)
    REFERENCES `hffit1_db`.`venue` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `hffit1_db`.`cms_log_has_volunteer` (
  `cms_log_id` INT(11) NOT NULL,
  `volunteer_id` INT(11) NOT NULL,
  PRIMARY KEY (`cms_log_id`, `volunteer_id`),
  INDEX `fk_cms_log_has_volunteer_volunteer1_idx` (`volunteer_id` ASC),
  INDEX `fk_cms_log_has_volunteer_cms_log1_idx` (`cms_log_id` ASC),
  CONSTRAINT `fk_cms_log_has_volunteer_cms_log1`
    FOREIGN KEY (`cms_log_id`)
    REFERENCES `hffit1_db`.`cms_log` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cms_log_has_volunteer_volunteer1`
    FOREIGN KEY (`volunteer_id`)
    REFERENCES `hffit1_db`.`volunteer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `hffit1_db`.`picture` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NULL DEFAULT NULL,
  `path` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `hffit1_db`.`profile_picture` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NULL DEFAULT NULL,
  `path` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `hffit1_db`.`festival_event` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `event` VARCHAR(75) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `hffit1_db`.`user_roles` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(75) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `hffit1_db`.`page` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `page_name` VARCHAR(75) NULL DEFAULT NULL,
  `page_description` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `hffit1_db`.`picture_has_page` (
  `picture_id` INT(11) NOT NULL,
  `page_id` INT(11) NOT NULL,
  PRIMARY KEY (`picture_id`, `page_id`),
  INDEX `fk_picture_has_page_page1_idx` (`page_id` ASC),
  INDEX `fk_picture_has_page_picture1_idx` (`picture_id` ASC),
  CONSTRAINT `fk_picture_has_page_picture1`
    FOREIGN KEY (`picture_id`)
    REFERENCES `hffit1_db`.`picture` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_picture_has_page_page1`
    FOREIGN KEY (`page_id`)
    REFERENCES `hffit1_db`.`page` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
