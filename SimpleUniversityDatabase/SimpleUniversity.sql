-- MySQL Script generated by MySQL Workbench
-- Wed 17 Aug 2022 04:02:24 PM +0430
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema SimpleUniversity
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SimpleUniversity
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SimpleUniversity` ;
USE `SimpleUniversity` ;

-- -----------------------------------------------------
-- Table `SimpleUniversity`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimpleUniversity`.`student` (
  `stu_id` INT NOT NULL,
  `firstname` VARCHAR(45) NULL,
  `lastname` VARCHAR(45) NULL,
  PRIMARY KEY (`stu_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimpleUniversity`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimpleUniversity`.`course` (
  `cur_id` INT NOT NULL,
  `title` VARCHAR(45) NULL,
  `unit` INT NULL,
  `isbase` BIT(1) NULL,
  PRIMARY KEY (`cur_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimpleUniversity`.`point`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimpleUniversity`.`point` (
  `id` INT NOT NULL,
  `termno` INT NULL,
  `stu_id` INT NULL,
  `cur_id` INT NULL,
  `point` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `stu_id_idx` (`stu_id` ASC) VISIBLE,
  INDEX `cur_id_idx` (`cur_id` ASC) VISIBLE,
  CONSTRAINT `stu_id`
    FOREIGN KEY (`stu_id`)
    REFERENCES `SimpleUniversity`.`student` (`stu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cur_id`
    FOREIGN KEY (`cur_id`)
    REFERENCES `SimpleUniversity`.`course` (`cur_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `SimpleUniversity`.`student`
-- -----------------------------------------------------
START TRANSACTION;
USE `SimpleUniversity`;
INSERT INTO `SimpleUniversity`.`student` (`stu_id`, `firstname`, `lastname`) VALUES (1, 'ali', 'rasoli');
INSERT INTO `SimpleUniversity`.`student` (`stu_id`, `firstname`, `lastname`) VALUES (2, 'hamid', 'rahimi');
INSERT INTO `SimpleUniversity`.`student` (`stu_id`, `firstname`, `lastname`) VALUES (3, 'hana', 'rezvani');
INSERT INTO `SimpleUniversity`.`student` (`stu_id`, `firstname`, `lastname`) VALUES (4, 'melika', 'taghadosi');
INSERT INTO `SimpleUniversity`.`student` (`stu_id`, `firstname`, `lastname`) VALUES (5, 'erfan', 'alizade');

COMMIT;


-- -----------------------------------------------------
-- Data for table `SimpleUniversity`.`course`
-- -----------------------------------------------------
START TRANSACTION;
USE `SimpleUniversity`;
INSERT INTO `SimpleUniversity`.`course` (`cur_id`, `title`, `unit`, `isbase`) VALUES (1, 'programming', 3, 0);
INSERT INTO `SimpleUniversity`.`course` (`cur_id`, `title`, `unit`, `isbase`) VALUES (2, 'database', 3, 0);
INSERT INTO `SimpleUniversity`.`course` (`cur_id`, `title`, `unit`, `isbase`) VALUES (3, 'math', 2, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `SimpleUniversity`.`point`
-- -----------------------------------------------------
START TRANSACTION;
USE `SimpleUniversity`;
INSERT INTO `SimpleUniversity`.`point` (`id`, `termno`, `stu_id`, `cur_id`, `point`) VALUES (1, 98991, 1, 1, 9);
INSERT INTO `SimpleUniversity`.`point` (`id`, `termno`, `stu_id`, `cur_id`, `point`) VALUES (2, 98991, 1, 2, 10);
INSERT INTO `SimpleUniversity`.`point` (`id`, `termno`, `stu_id`, `cur_id`, `point`) VALUES (3, 98991, 2, 1, 9);
INSERT INTO `SimpleUniversity`.`point` (`id`, `termno`, `stu_id`, `cur_id`, `point`) VALUES (4, 98991, 2, 2, 13);
INSERT INTO `SimpleUniversity`.`point` (`id`, `termno`, `stu_id`, `cur_id`, `point`) VALUES (5, 98991, 5, 1, 17);
INSERT INTO `SimpleUniversity`.`point` (`id`, `termno`, `stu_id`, `cur_id`, `point`) VALUES (6, 98991, 4, 1, 7);
INSERT INTO `SimpleUniversity`.`point` (`id`, `termno`, `stu_id`, `cur_id`, `point`) VALUES (7, 98991, 3, 3, 15);
INSERT INTO `SimpleUniversity`.`point` (`id`, `termno`, `stu_id`, `cur_id`, `point`) VALUES (8, 98992, 1, 1, 10);
INSERT INTO `SimpleUniversity`.`point` (`id`, `termno`, `stu_id`, `cur_id`, `point`) VALUES (9, 98992, 1, 3, 15);
INSERT INTO `SimpleUniversity`.`point` (`id`, `termno`, `stu_id`, `cur_id`, `point`) VALUES (10, 98992, 2, 1, 14);
INSERT INTO `SimpleUniversity`.`point` (`id`, `termno`, `stu_id`, `cur_id`, `point`) VALUES (11, 98992, 5, 3, 18);
INSERT INTO `SimpleUniversity`.`point` (`id`, `termno`, `stu_id`, `cur_id`, `point`) VALUES (12, 98992, 3, 2, 8);
INSERT INTO `SimpleUniversity`.`point` (`id`, `termno`, `stu_id`, `cur_id`, `point`) VALUES (13, 98992, 4, 1, 12);
INSERT INTO `SimpleUniversity`.`point` (`id`, `termno`, `stu_id`, `cur_id`, `point`) VALUES (14, 98992, 3, 1, 12);
INSERT INTO `SimpleUniversity`.`point` (`id`, `termno`, `stu_id`, `cur_id`, `point`) VALUES (15, 98992, 5, 2, 20);
INSERT INTO `SimpleUniversity`.`point` (`id`, `termno`, `stu_id`, `cur_id`, `point`) VALUES (16, 98992, 4, 2, 6);
INSERT INTO `SimpleUniversity`.`point` (`id`, `termno`, `stu_id`, `cur_id`, `point`) VALUES (17, 98992, 4, 3, 11);

COMMIT;

