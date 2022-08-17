-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema CLINIC
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema CLINIC
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CLINIC` DEFAULT CHARACTER SET utf8 ;
USE `CLINIC` ;

-- -----------------------------------------------------
-- Table `CLINIC`.`province`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CLINIC`.`province` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CLINIC`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CLINIC`.`city` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `province_id` INT NOT NULL,
  PRIMARY KEY (`id`, `province_id`),
  INDEX `fk_city_province1_idx` (`province_id` ASC) VISIBLE,
  CONSTRAINT `fk_city_province1`
    FOREIGN KEY (`province_id`)
    REFERENCES `CLINIC`.`province` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CLINIC`.`nationality`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CLINIC`.`nationality` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CLINIC`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CLINIC`.`person` (
  `id` INT NOT NULL,
  `nationalid` VARCHAR(45) NULL,
  `firstname` VARCHAR(256) NULL,
  `lastname` VARCHAR(256) NULL,
  `birthdate` DATE NULL,
  `address` VARCHAR(256) NULL,
  `gender` VARCHAR(1) NULL,
  `city_id` INT NOT NULL,
  `nationality_id` INT NOT NULL,
  PRIMARY KEY (`id`, `city_id`, `nationality_id`),
  INDEX `fk_persion_city1_idx` (`city_id` ASC) VISIBLE,
  INDEX `fk_person_nationality1_idx` (`nationality_id` ASC) VISIBLE,
  CONSTRAINT `fk_persion_city1`
    FOREIGN KEY (`city_id`)
    REFERENCES `CLINIC`.`city` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_person_nationality1`
    FOREIGN KEY (`nationality_id`)
    REFERENCES `CLINIC`.`nationality` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CLINIC`.`sections`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CLINIC`.`sections` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `supervisor_id` INT NOT NULL,
  PRIMARY KEY (`id`, `supervisor_id`),
  INDEX `fk_sections_persion1_idx` (`supervisor_id` ASC) VISIBLE,
  CONSTRAINT `fk_sections_persion1`
    FOREIGN KEY (`supervisor_id`)
    REFERENCES `CLINIC`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CLINIC`.`specialty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CLINIC`.`specialty` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CLINIC`.`doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CLINIC`.`doctor` (
  `id` INT NOT NULL,
  `gmcnumber` INT NULL,
  `sections_id` INT NOT NULL,
  `person_id` INT NOT NULL,
  `specialty_id` INT NOT NULL,
  PRIMARY KEY (`id`, `sections_id`, `person_id`, `specialty_id`),
  INDEX `fk_doctor_sections1_idx` (`sections_id` ASC) VISIBLE,
  INDEX `fk_doctor_persion1_idx` (`person_id` ASC) VISIBLE,
  INDEX `fk_doctor_specialty1_idx` (`specialty_id` ASC) VISIBLE,
  CONSTRAINT `fk_doctor_sections1`
    FOREIGN KEY (`sections_id`)
    REFERENCES `CLINIC`.`sections` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_doctor_persion1`
    FOREIGN KEY (`person_id`)
    REFERENCES `CLINIC`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_doctor_specialty1`
    FOREIGN KEY (`specialty_id`)
    REFERENCES `CLINIC`.`specialty` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CLINIC`.`room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CLINIC`.`room` (
  `id` INT NOT NULL,
  `roomtitle` VARCHAR(45) NULL,
  `roomnumber` INT NULL,
  `sections_id` INT NOT NULL,
  PRIMARY KEY (`id`, `sections_id`),
  INDEX `fk_room_sections1_idx` (`sections_id` ASC) VISIBLE,
  CONSTRAINT `fk_room_sections1`
    FOREIGN KEY (`sections_id`)
    REFERENCES `CLINIC`.`sections` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CLINIC`.`bloodtype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CLINIC`.`bloodtype` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CLINIC`.`religion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CLINIC`.`religion` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CLINIC`.`patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CLINIC`.`patient` (
  `id` INT NOT NULL,
  `person_id` INT NOT NULL,
  `bloodtype_id` INT NOT NULL,
  `religion_id` INT NOT NULL,
  PRIMARY KEY (`id`, `person_id`, `bloodtype_id`, `religion_id`),
  INDEX `fk_Patient_persion1_idx` (`person_id` ASC) VISIBLE,
  INDEX `fk_Patient_bloodtype1_idx` (`bloodtype_id` ASC) VISIBLE,
  INDEX `fk_patient_religion1_idx` (`religion_id` ASC) VISIBLE,
  CONSTRAINT `fk_Patient_persion1`
    FOREIGN KEY (`person_id`)
    REFERENCES `CLINIC`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Patient_bloodtype1`
    FOREIGN KEY (`bloodtype_id`)
    REFERENCES `CLINIC`.`bloodtype` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_religion1`
    FOREIGN KEY (`religion_id`)
    REFERENCES `CLINIC`.`religion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CLINIC`.`servicecost`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CLINIC`.`servicecost` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `cost` INT NULL,
  `sections_id` INT NOT NULL,
  PRIMARY KEY (`id`, `sections_id`),
  INDEX `fk_servicecost_sections1_idx` (`sections_id` ASC) VISIBLE,
  CONSTRAINT `fk_servicecost_sections1`
    FOREIGN KEY (`sections_id`)
    REFERENCES `CLINIC`.`sections` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CLINIC`.`bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CLINIC`.`bill` (
  `id` INT NOT NULL,
  `billcode` INT NULL,
  `totalcost` INT NULL,
  `billdate` DATE NULL,
  `Patient_id` INT NOT NULL,
  `doctor_id` INT NOT NULL,
  `servicecost_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Patient_id`, `doctor_id`, `servicecost_id`),
  INDEX `fk_bill_Patient1_idx` (`Patient_id` ASC) VISIBLE,
  INDEX `fk_bill_doctor1_idx` (`doctor_id` ASC) VISIBLE,
  INDEX `fk_bill_servicecost1_idx` (`servicecost_id` ASC) VISIBLE,
  CONSTRAINT `fk_bill_Patient1`
    FOREIGN KEY (`Patient_id`)
    REFERENCES `CLINIC`.`patient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bill_doctor1`
    FOREIGN KEY (`doctor_id`)
    REFERENCES `CLINIC`.`doctor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bill_servicecost1`
    FOREIGN KEY (`servicecost_id`)
    REFERENCES `CLINIC`.`servicecost` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CLINIC`.`roomPatient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CLINIC`.`roomPatient` (
  `room_id` INT NOT NULL,
  `Patient_id` INT NOT NULL,
  `visitdate` DATE NULL,
  PRIMARY KEY (`room_id`, `Patient_id`),
  INDEX `fk_room_has_Patient_Patient1_idx` (`Patient_id` ASC) VISIBLE,
  INDEX `fk_room_has_Patient_room_idx` (`room_id` ASC) VISIBLE,
  CONSTRAINT `fk_room_has_Patient_room`
    FOREIGN KEY (`room_id`)
    REFERENCES `CLINIC`.`room` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_room_has_Patient_Patient1`
    FOREIGN KEY (`Patient_id`)
    REFERENCES `CLINIC`.`patient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CLINIC`.`phonetype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CLINIC`.`phonetype` (
  `id` INT NOT NULL,
  `typename` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CLINIC`.`telephone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CLINIC`.`telephone` (
  `id` INT NOT NULL,
  `number` INT NULL,
  `phonetype_id` INT NOT NULL,
  `person_id` INT NOT NULL,
  PRIMARY KEY (`id`, `phonetype_id`, `person_id`),
  INDEX `fk_telephone_phonetype1_idx` (`phonetype_id` ASC) VISIBLE,
  INDEX `fk_telephone_person1_idx` (`person_id` ASC) VISIBLE,
  CONSTRAINT `fk_telephone_phonetype1`
    FOREIGN KEY (`phonetype_id`)
    REFERENCES `CLINIC`.`phonetype` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_telephone_person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `CLINIC`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CLINIC`.`shift`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CLINIC`.`shift` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CLINIC`.`doctorshift`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CLINIC`.`doctorshift` (
  `doctor_id` INT NOT NULL,
  `shift_id` INT NOT NULL,
  `startdate` DATE NULL,
  `enddate` DATE NULL,
  PRIMARY KEY (`doctor_id`, `shift_id`),
  INDEX `fk_doctor_has_shift_shift1_idx` (`shift_id` ASC) VISIBLE,
  INDEX `fk_doctor_has_shift_doctor1_idx` (`doctor_id` ASC) VISIBLE,
  CONSTRAINT `fk_doctor_has_shift_doctor1`
    FOREIGN KEY (`doctor_id`)
    REFERENCES `CLINIC`.`doctor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_doctor_has_shift_shift1`
    FOREIGN KEY (`shift_id`)
    REFERENCES `CLINIC`.`shift` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
