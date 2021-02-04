-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mailorder
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mailorder
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mailorder` DEFAULT CHARACTER SET utf8 ;
USE `mailorder` ;

-- -----------------------------------------------------
-- Table `mailorder`.`parts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mailorder`.`parts` (
  `pno` INT NOT NULL,
  `pname` VARCHAR(45) NULL,
  `qoh` INT NULL,
  `price` REAL NULL,
  `olevel` INT NULL,
  PRIMARY KEY (`pno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mailorder`.`zipcodes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mailorder`.`zipcodes` (
  `zip` INT NOT NULL,
  `city` VARCHAR(45) NULL,
  PRIMARY KEY (`zip`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mailorder`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mailorder`.`customers` (
  `cno` INT NOT NULL,
  `cname` VARCHAR(45) NULL,
  `street` VARCHAR(45) NULL,
  `zip` INT NULL,
  `phone` CHAR(12) NULL,
  PRIMARY KEY (`cno`),
  INDEX `fk_customers_zipcodes1_idx` (`zip` ASC) VISIBLE,
  CONSTRAINT `fk_customers_zipcodes1`
    FOREIGN KEY (`zip`)
    REFERENCES `mailorder`.`zipcodes` (`zip`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mailorder`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mailorder`.`employees` (
  `eno` INT NOT NULL,
  `ename` VARCHAR(45) NULL,
  `zip` INT NULL,
  `hdate` DATE NULL,
  PRIMARY KEY (`eno`),
  INDEX `fk_employess_zipcodes1_idx` (`zip` ASC) VISIBLE,
  CONSTRAINT `fk_employess_zipcodes1`
    FOREIGN KEY (`zip`)
    REFERENCES `mailorder`.`zipcodes` (`zip`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mailorder`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mailorder`.`orders` (
  `ono` INT NOT NULL,
  `cno` INT NOT NULL,
  `eno` INT NOT NULL,
  `received` DATE NULL,
  `shipped` DATE NULL,
  PRIMARY KEY (`ono`, `eno`, `cno`),
  INDEX `fk_orders_customers1_idx` (`cno` ASC) VISIBLE,
  INDEX `fk_orders_employess1_idx` (`eno` ASC) VISIBLE,
  CONSTRAINT `fk_orders_customers1`
    FOREIGN KEY (`cno`)
    REFERENCES `mailorder`.`customers` (`cno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_orders_employess1`
    FOREIGN KEY (`eno`)
    REFERENCES `mailorder`.`employees` (`eno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mailorder`.`odetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mailorder`.`odetails` (
  `ono` INT NOT NULL,
  `pno` INT NOT NULL,
  `qty` INT NULL,
  PRIMARY KEY (`ono`, `pno`),
  INDEX `fk__parts_idx` (`pno` ASC) VISIBLE,
  CONSTRAINT `fk__parts`
    FOREIGN KEY (`pno`)
    REFERENCES `mailorder`.`parts` (`pno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk__orders1`
    FOREIGN KEY (`ono`)
    REFERENCES `mailorder`.`orders` (`ono`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
