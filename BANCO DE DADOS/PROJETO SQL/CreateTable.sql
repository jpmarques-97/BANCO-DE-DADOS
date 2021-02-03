-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Projeto_BD
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Projeto_BD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Projeto_BD` ;
USE `Projeto_BD` ;

-- -----------------------------------------------------
-- Table `Projeto_BD`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projeto_BD`.`usuarios` (
  `id_usuario` INT NOT NULL,
  `nome` VARCHAR(200) NOT NULL,
  `cargo` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `funcao` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projeto_BD`.`relatorios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projeto_BD`.`relatorios` (
  `id_relatorio` INT NOT NULL,
  `nome_arquivo` VARCHAR(50) NOT NULL,
  `colunas` VARCHAR(50) NULL,
  PRIMARY KEY (`id_relatorio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projeto_BD`.`requerimento_paineis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projeto_BD`.`requerimento_paineis` (
  `id_requerimento` INT NOT NULL,
  `descricao` VARCHAR(500) NULL,
  PRIMARY KEY (`id_requerimento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projeto_BD`.`bi_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projeto_BD`.`bi_usuario` (
  `usuarios_id_usuario` INT NOT NULL,
  PRIMARY KEY (`usuarios_id_usuario`),
  CONSTRAINT `fk_bi_usuario_usuarios1`
    FOREIGN KEY (`usuarios_id_usuario`)
    REFERENCES `Projeto_BD`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projeto_BD`.`setor_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projeto_BD`.`setor_usuario` (
  `setor` VARCHAR(50) NOT NULL,
  `usuarios_id_usuario` INT NOT NULL,
  PRIMARY KEY (`usuarios_id_usuario`),
  CONSTRAINT `fk_setor_usuario_usuarios`
    FOREIGN KEY (`usuarios_id_usuario`)
    REFERENCES `Projeto_BD`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projeto_BD`.`chefe_setor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projeto_BD`.`chefe_setor` (
  `setor_usuario_usuarios_id_usuario` INT NOT NULL,
  PRIMARY KEY (`setor_usuario_usuarios_id_usuario`),
  CONSTRAINT `fk_chefe_setor_setor_usuario1`
    FOREIGN KEY (`setor_usuario_usuarios_id_usuario`)
    REFERENCES `Projeto_BD`.`setor_usuario` (`usuarios_id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projeto_BD`.`assistente_setor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projeto_BD`.`assistente_setor` (
  `setor_usuario_usuarios_id_usuario` INT NOT NULL,
  PRIMARY KEY (`setor_usuario_usuarios_id_usuario`),
  CONSTRAINT `fk_assistente_setor_setor_usuario1`
    FOREIGN KEY (`setor_usuario_usuarios_id_usuario`)
    REFERENCES `Projeto_BD`.`setor_usuario` (`usuarios_id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projeto_BD`.`atende`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projeto_BD`.`atende` (
  `bi_usuario_usuarios_id_usuario` INT NOT NULL,
  `requerimento_paineis_id_requerimento` INT NOT NULL,
  PRIMARY KEY (`bi_usuario_usuarios_id_usuario`, `requerimento_paineis_id_requerimento`),
  INDEX `fk_bi_usuario_has_requerimento_paineis_requerimento_paineis_idx` (`requerimento_paineis_id_requerimento` ASC) VISIBLE,
  INDEX `fk_bi_usuario_has_requerimento_paineis_bi_usuario1_idx` (`bi_usuario_usuarios_id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_bi_usuario_has_requerimento_paineis_bi_usuario1`
    FOREIGN KEY (`bi_usuario_usuarios_id_usuario`)
    REFERENCES `Projeto_BD`.`bi_usuario` (`usuarios_id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bi_usuario_has_requerimento_paineis_requerimento_paineis1`
    FOREIGN KEY (`requerimento_paineis_id_requerimento`)
    REFERENCES `Projeto_BD`.`requerimento_paineis` (`id_requerimento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projeto_BD`.`requerer_painel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projeto_BD`.`requerer_painel` (
  `chefe_setor_setor_usuario_usuarios_id_usuario` INT NOT NULL,
  `requerimento_paineis_id_requerimento` INT NOT NULL,
  PRIMARY KEY (`chefe_setor_setor_usuario_usuarios_id_usuario`, `requerimento_paineis_id_requerimento`),
  INDEX `fk_chefe_setor_has_requerimento_paineis_requerimento_painei_idx` (`requerimento_paineis_id_requerimento` ASC) VISIBLE,
  INDEX `fk_chefe_setor_has_requerimento_paineis_chefe_setor1_idx` (`chefe_setor_setor_usuario_usuarios_id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_chefe_setor_has_requerimento_paineis_chefe_setor1`
    FOREIGN KEY (`chefe_setor_setor_usuario_usuarios_id_usuario`)
    REFERENCES `Projeto_BD`.`chefe_setor` (`setor_usuario_usuarios_id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_chefe_setor_has_requerimento_paineis_requerimento_paineis1`
    FOREIGN KEY (`requerimento_paineis_id_requerimento`)
    REFERENCES `Projeto_BD`.`requerimento_paineis` (`id_requerimento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projeto_BD`.`criar_relatorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projeto_BD`.`criar_relatorio` (
  `chefe_setor_setor_usuario_usuarios_id_usuario` INT NOT NULL,
  `relatorios_id_relatorio` INT NOT NULL,
  PRIMARY KEY (`chefe_setor_setor_usuario_usuarios_id_usuario`, `relatorios_id_relatorio`),
  INDEX `fk_chefe_setor_has_relatorios_relatorios1_idx` (`relatorios_id_relatorio` ASC) VISIBLE,
  INDEX `fk_chefe_setor_has_relatorios_chefe_setor1_idx` (`chefe_setor_setor_usuario_usuarios_id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_chefe_setor_has_relatorios_chefe_setor1`
    FOREIGN KEY (`chefe_setor_setor_usuario_usuarios_id_usuario`)
    REFERENCES `Projeto_BD`.`chefe_setor` (`setor_usuario_usuarios_id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_chefe_setor_has_relatorios_relatorios1`
    FOREIGN KEY (`relatorios_id_relatorio`)
    REFERENCES `Projeto_BD`.`relatorios` (`id_relatorio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projeto_BD`.`remover_relatorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projeto_BD`.`remover_relatorio` (
  `chefe_setor_setor_usuario_usuarios_id_usuario` INT NOT NULL,
  `relatorios_id_relatorio` INT NOT NULL,
  PRIMARY KEY (`chefe_setor_setor_usuario_usuarios_id_usuario`, `relatorios_id_relatorio`),
  INDEX `fk_chefe_setor_has_relatorios_relatorios2_idx` (`relatorios_id_relatorio` ASC) VISIBLE,
  INDEX `fk_chefe_setor_has_relatorios_chefe_setor2_idx` (`chefe_setor_setor_usuario_usuarios_id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_chefe_setor_has_relatorios_chefe_setor2`
    FOREIGN KEY (`chefe_setor_setor_usuario_usuarios_id_usuario`)
    REFERENCES `Projeto_BD`.`chefe_setor` (`setor_usuario_usuarios_id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_chefe_setor_has_relatorios_relatorios2`
    FOREIGN KEY (`relatorios_id_relatorio`)
    REFERENCES `Projeto_BD`.`relatorios` (`id_relatorio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projeto_BD`.`ter_acesso_relatorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projeto_BD`.`ter_acesso_relatorio` (
  `assistente_setor_setor_usuario_usuarios_id_usuario` INT NOT NULL,
  `relatorios_id_relatorio` INT NOT NULL,
  PRIMARY KEY (`assistente_setor_setor_usuario_usuarios_id_usuario`, `relatorios_id_relatorio`),
  INDEX `fk_assistente_setor_has_relatorios_relatorios1_idx` (`relatorios_id_relatorio` ASC) VISIBLE,
  INDEX `fk_assistente_setor_has_relatorios_assistente_setor1_idx` (`assistente_setor_setor_usuario_usuarios_id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_assistente_setor_has_relatorios_assistente_setor1`
    FOREIGN KEY (`assistente_setor_setor_usuario_usuarios_id_usuario`)
    REFERENCES `Projeto_BD`.`assistente_setor` (`setor_usuario_usuarios_id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_assistente_setor_has_relatorios_relatorios1`
    FOREIGN KEY (`relatorios_id_relatorio`)
    REFERENCES `Projeto_BD`.`relatorios` (`id_relatorio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projeto_BD`.`relatorio_painel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projeto_BD`.`relatorio_painel` (
  `requerimento_paineis_id_requerimento` INT NOT NULL,
  `relatorios_id_relatorio` INT NOT NULL,
  PRIMARY KEY (`requerimento_paineis_id_requerimento`, `relatorios_id_relatorio`),
  INDEX `fk_requerimento_paineis_has_relatorios_relatorios1_idx` (`relatorios_id_relatorio` ASC) VISIBLE,
  INDEX `fk_requerimento_paineis_has_relatorios_requerimento_paineis_idx` (`requerimento_paineis_id_requerimento` ASC) VISIBLE,
  CONSTRAINT `fk_requerimento_paineis_has_relatorios_requerimento_paineis1`
    FOREIGN KEY (`requerimento_paineis_id_requerimento`)
    REFERENCES `Projeto_BD`.`requerimento_paineis` (`id_requerimento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_requerimento_paineis_has_relatorios_relatorios1`
    FOREIGN KEY (`relatorios_id_relatorio`)
    REFERENCES `Projeto_BD`.`relatorios` (`id_relatorio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
