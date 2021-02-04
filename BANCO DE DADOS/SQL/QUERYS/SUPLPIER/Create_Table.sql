-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema supplier
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema supplier
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `supplier` DEFAULT CHARACTER SET utf8 ;
USE `supplier` ;

-- -----------------------------------------------------
-- Table `supplier`.`suppliers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supplier`.`suppliers` (
  `sno` CHAR(2) NOT NULL,
  `sname` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  PRIMARY KEY (`sno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `supplier`.`parts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supplier`.`parts` (
  `pno` CHAR(2) NOT NULL,
  `pname` VARCHAR(45) NULL,
  `color` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  PRIMARY KEY (`pno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `supplier`.`projects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supplier`.`projects` (
  `pjno` CHAR(2) NOT NULL,
  `pjname` VARCHAR(45) NULL,
  `pjcity` VARCHAR(45) NULL,
  PRIMARY KEY (`pjno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `supplier`.`sppj`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supplier`.`sppj` (
  `suppliers_sno` CHAR(2) NOT NULL,
  `parts_pno` CHAR(2) NOT NULL,
  `projects_pjno` CHAR(2) NOT NULL,
  `qty` INT NULL,
  PRIMARY KEY (`suppliers_sno`, `parts_pno`, `projects_pjno`),
  INDEX `fk_sppj_parts1_idx` (`parts_pno` ASC) VISIBLE,
  INDEX `fk_sppj_projects1_idx` (`projects_pjno` ASC) VISIBLE,
  CONSTRAINT `fk_sppj_suppliers`
    FOREIGN KEY (`suppliers_sno`)
    REFERENCES `supplier`.`suppliers` (`sno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_sppj_parts1`
    FOREIGN KEY (`parts_pno`)
    REFERENCES `supplier`.`parts` (`pno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_sppj_projects1`
    FOREIGN KEY (`projects_pjno`)
    REFERENCES `supplier`.`projects` (`pjno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
