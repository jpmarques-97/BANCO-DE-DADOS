-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema gradebook
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema gradebook
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gradebook` DEFAULT CHARACTER SET utf8 ;
USE `gradebook` ;

-- -----------------------------------------------------
-- Table `gradebook`.`catalogue`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gradebook`.`catalogue` (
  `cno` CHAR(6) NOT NULL,
  `ctitle` VARCHAR(45) NULL,
  PRIMARY KEY (`cno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gradebook`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gradebook`.`courses` (
  `term` VARCHAR(4) NOT NULL,
  `secno` INT NOT NULL,
  `cno` CHAR(6) NULL,
  `a` INT NULL,
  `b` INT NULL,
  `c` INT NULL,
  `d` INT NULL,
  INDEX `fk_courses_catalogue_idx` (`cno` ASC) VISIBLE,
  PRIMARY KEY (`term`, `secno`),
  CONSTRAINT `fk_courses_catalogue`
    FOREIGN KEY (`cno`)
    REFERENCES `gradebook`.`catalogue` (`cno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gradebook`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gradebook`.`students` (
  `sid` INT NOT NULL,
  `fname` VARCHAR(45) NULL,
  `lname` VARCHAR(45) NULL,
  `minit` CHAR(1) NULL,
  PRIMARY KEY (`sid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gradebook`.`enrolls`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gradebook`.`enrolls` (
  `courses_term` VARCHAR(4) NOT NULL,
  `courses_secno` INT NOT NULL,
  `students_sid` INT NOT NULL,
  PRIMARY KEY (`courses_term`, `courses_secno`, `students_sid`),
  INDEX `fk_enrolls_students1_idx` (`students_sid` ASC) VISIBLE,
  CONSTRAINT `fk_enrolls_courses1`
    FOREIGN KEY (`courses_term` , `courses_secno`)
    REFERENCES `gradebook`.`courses` (`term` , `secno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_enrolls_students1`
    FOREIGN KEY (`students_sid`)
    REFERENCES `gradebook`.`students` (`sid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
