-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bookadoption
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bookadoption
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bookadoption` DEFAULT CHARACTER SET utf8 ;
USE `bookadoption` ;

-- -----------------------------------------------------
-- Table `bookadoption`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookadoption`.`students` (
  `ssn` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `major` VARCHAR(45) NULL,
  `bdate` DATE NULL,
  PRIMARY KEY (`ssn`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bookadoption`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookadoption`.`courses` (
  `cnum` CHAR(7) NOT NULL,
  `cname` VARCHAR(45) NULL,
  `dept` VARCHAR(45) NULL,
  PRIMARY KEY (`cnum`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bookadoption`.`enrolls`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookadoption`.`enrolls` (
  `students_ssn` INT NOT NULL,
  `courses_cnum` CHAR(7) NOT NULL,
  `quarter` CHAR(4) NULL,
  `grade` CHAR(1) NULL,
  PRIMARY KEY (`students_ssn`, `courses_cnum`),
  INDEX `fk_enrolls_courses1_idx` (`courses_cnum` ASC) VISIBLE,
  CONSTRAINT `fk_enrolls_students`
    FOREIGN KEY (`students_ssn`)
    REFERENCES `bookadoption`.`students` (`ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_enrolls_courses1`
    FOREIGN KEY (`courses_cnum`)
    REFERENCES `bookadoption`.`courses` (`cnum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bookadoption`.`books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookadoption`.`books` (
  `isbn` CHAR(8) NOT NULL,
  `title` VARCHAR(45) NULL,
  `author` VARCHAR(45) NULL,
  `publisher` VARCHAR(45) NULL,
  PRIMARY KEY (`isbn`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bookadoption`.`bookuses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookadoption`.`bookuses` (
  `courses_cnum` CHAR(7) NOT NULL,
  `quarter` CHAR(4) NOT NULL,
  `books_isbn` CHAR(8) NOT NULL,
  PRIMARY KEY (`courses_cnum`, `quarter`, `books_isbn`),
  INDEX `fk_bookuses_books1_idx` (`books_isbn` ASC) VISIBLE,
  CONSTRAINT `fk_bookuses_courses1`
    FOREIGN KEY (`courses_cnum`)
    REFERENCES `bookadoption`.`courses` (`cnum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bookuses_books1`
    FOREIGN KEY (`books_isbn`)
    REFERENCES `bookadoption`.`books` (`isbn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
