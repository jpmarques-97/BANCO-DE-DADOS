-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema company
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema company
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `company` DEFAULT CHARACTER SET utf8 ;
USE `company` ;

-- -----------------------------------------------------
-- Table `company`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company`.`employee` (
  `fname` VARCHAR(15) NOT NULL,
  `minit` CHAR(1) NULL DEFAULT NULL,
  `lname` VARCHAR(15) NOT NULL,
  `ssn` CHAR(9) NOT NULL,
  `bdate` DATE NULL DEFAULT NULL,
  `address` VARCHAR(50) NULL DEFAULT NULL,
  `sex` CHAR(1) NULL DEFAULT NULL,
  `salary` DECIMAL(10,2) NULL DEFAULT NULL,
  `super_ssn` CHAR(9) NULL DEFAULT NULL,
  `dno` INT(11) NOT NULL,
  PRIMARY KEY (`ssn`),
  INDEX `EMPSUPERFK` (`super_ssn` ASC) VISIBLE,
  INDEX `EMP_DEPTO_idx` (`dno` ASC) VISIBLE,
  CONSTRAINT `EMPSUPERFK`
    FOREIGN KEY (`super_ssn`)
    REFERENCES `company`.`employee` (`ssn`)
    ON DELETE SET NULL,
  CONSTRAINT `EMP_DEPTO`
    FOREIGN KEY (`dno`)
    REFERENCES `company`.`department` (`dnumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `company`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company`.`department` (
  `dname` VARCHAR(15) NOT NULL,
  `dnumber` INT(11) NOT NULL,
  `mgr_ssn` CHAR(9) NULL DEFAULT NULL,
  `mgr_start_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`dnumber`),
  UNIQUE INDEX `DEPTSK` (`dname` ASC) VISIBLE,
  INDEX `DEPTMGRFK` (`mgr_ssn` ASC) VISIBLE,
  CONSTRAINT `DEPTMGRFK`
    FOREIGN KEY (`mgr_ssn`)
    REFERENCES `company`.`employee` (`ssn`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `company`.`dependent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company`.`dependent` (
  `essn` CHAR(9) NOT NULL,
  `dependent_name` VARCHAR(15) NOT NULL,
  `sex` CHAR(1) NULL DEFAULT NULL,
  `bdate` DATE NULL DEFAULT NULL,
  `relationship` VARCHAR(8) NULL DEFAULT NULL,
  PRIMARY KEY (`essn`, `dependent_name`),
  CONSTRAINT `EMP_DEP_FK`
    FOREIGN KEY (`essn`)
    REFERENCES `company`.`employee` (`ssn`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `company`.`dept_locations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company`.`dept_locations` (
  `dnumber` INT(11) NOT NULL,
  `dlocation` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`dnumber`, `dlocation`),
  CONSTRAINT `DEPTO`
    FOREIGN KEY (`dnumber`)
    REFERENCES `company`.`department` (`dnumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `company`.`project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company`.`project` (
  `pname` VARCHAR(30) NOT NULL,
  `pnumber` INT(11) NOT NULL,
  `plocation` VARCHAR(15) NULL DEFAULT NULL,
  `dnum` INT(11) NOT NULL,
  PRIMARY KEY (`pnumber`),
  UNIQUE INDEX `pname` (`pname` ASC) VISIBLE,
  INDEX `dnum` (`dnum` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `company`.`works_on`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company`.`works_on` (
  `essn` CHAR(9) NOT NULL,
  `pno` INT(11) NOT NULL,
  `hours` DECIMAL(3,1) NULL DEFAULT NULL,
  PRIMARY KEY (`essn`, `pno`),
  INDEX `PROJFK` (`pno` ASC) VISIBLE,
  CONSTRAINT `EMPFK`
    FOREIGN KEY (`essn`)
    REFERENCES `company`.`employee` (`ssn`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `PROJFK`
    FOREIGN KEY (`pno`)
    REFERENCES `company`.`project` (`pnumber`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
