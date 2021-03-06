-- MySQL Script generated by MySQL Workbench
-- Fri Mar  9 15:25:59 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema MicroServiceFrameDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `MicroServiceFrameDB` ;

-- -----------------------------------------------------
-- Schema MicroServiceFrameDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MicroServiceFrameDB` DEFAULT CHARACTER SET utf8 ;
USE `MicroServiceFrameDB` ;

-- -----------------------------------------------------
-- Table `MicroServiceFrameDB`.`Tenants`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MicroServiceFrameDB`.`Tenants` ;

CREATE TABLE IF NOT EXISTS `MicroServiceFrameDB`.`Tenants` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `uuid` CHAR(30) NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `createdAt` TIMESTAMP NULL,
  `modifiedAt` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MicroServiceFrameDB`.`Directories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MicroServiceFrameDB`.`Directories` ;

CREATE TABLE IF NOT EXISTS `MicroServiceFrameDB`.`Directories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `uuid` CHAR(30) NOT NULL,
  `tenantUUID` CHAR(30) NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `merchantUUID` VARCHAR(45) NULL,
  `merchantHref` VARCHAR(200) NULL,
  `createdAt` TIMESTAMP NULL,
  `modifiedAt` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC),
  INDEX `tenantUUID_idx` (`tenantUUID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MicroServiceFrameDB`.`Users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MicroServiceFrameDB`.`Users` ;

CREATE TABLE IF NOT EXISTS `MicroServiceFrameDB`.`Users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `uuid` CHAR(30) NOT NULL,
  `directoryUUID` CHAR(30) NULL,
  `name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `mobile` VARCHAR(45) NULL,
  `createdAt` TIMESTAMP NULL,
  `modifiedAt` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC),
  INDEX `directoryUUID_idx` (`directoryUUID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MicroServiceFrameDB`.`Groups`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MicroServiceFrameDB`.`Groups` ;

CREATE TABLE IF NOT EXISTS `MicroServiceFrameDB`.`Groups` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `uuid` CHAR(30) NOT NULL,
  `tenantUUID` CHAR(30) NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `merchantUUID` VARCHAR(45) NULL,
  `merchantHref` VARCHAR(45) NULL,
  `createdAt` TIMESTAMP NULL,
  `modifiedAt` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC),
  INDEX `tenantUUID_idx` (`tenantUUID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MicroServiceFrameDB`.`UserGroupMemberships`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MicroServiceFrameDB`.`UserGroupMemberships` ;

CREATE TABLE IF NOT EXISTS `MicroServiceFrameDB`.`UserGroupMemberships` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `uuid` CHAR(30) NOT NULL,
  `userUUID` CHAR(30) NULL,
  `groupUUID` CHAR(30) NULL,
  `createdAt` TIMESTAMP NULL,
  `modifiedAt` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC),
  INDEX `userUUID_idx` (`userUUID` ASC),
  INDEX `groupUUID_idx` (`groupUUID` ASC))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
