-- MySQL Script generated by MySQL Workbench
-- sab 15 ago 2020 16:07:49 CEST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Shop`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Shop` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `adress` VARCHAR(100) NOT NULL,
  `phone` BIGINT(13) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `date_of_create` DATETIME NOT NULL,
  `staff_size` INT UNSIGNED NOT NULL,
  `auto_park` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `auto_park`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Работники`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Работники` (
  `id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `date_of_birth` DATE NOT NULL,
  `education` VARCHAR(150) NULL DEFAULT NULL COMMENT 'АНКЕТА СОТРУДНИКОВ',
  `experience` INT NULL DEFAULT 0,
  `phone` BIGINT(13) UNSIGNED NULL,
  `adress` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`товар`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`товар` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code_product` VARCHAR(45) NOT NULL,
  `name_of_product` VARCHAR(50) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `quantity` VARCHAR(45) NULL DEFAULT 0,
  `price` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `code_product_UNIQUE` (`code_product` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`штат`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`штат` (
  `id` INT NOT NULL,
  `profession` VARCHAR(45) NOT NULL,
  `position` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`поставщики`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`поставщики` (
  `id` INT NOT NULL,
  `name_company` VARCHAR(45) NOT NULL,
  `adress` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`покупатели`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`покупатели` (
  `id` INT NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `date_of_birth` DATETIME NULL,
  `adress` VARCHAR(150) NULL,
  `phone` BIGINT(13) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Заказ`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Заказ` (
  `id` INT NOT NULL,
  `num_order` VARCHAR(45) NULL,
  `date_of_order` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`transport`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`transport` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `marka` VARCHAR(40) NOT NULL,
  `type` VARCHAR(50) NOT NULL,
  `data_service` DATE NOT NULL,
  `Shop_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Shop_id`),
  INDEX `fk_transport_Shop_idx` (`Shop_id` ASC) VISIBLE,
  CONSTRAINT `fk_transport_Shop`
    FOREIGN KEY (`Shop_id`)
    REFERENCES `mydb`.`Shop` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;