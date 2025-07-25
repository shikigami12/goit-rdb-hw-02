-- MySQL Script generated by MySQL Workbench
-- Sun Jul 13 12:16:21 2025
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema goit-rdb-hw-02
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `goit-rdb-hw-02` ;

-- -----------------------------------------------------
-- Schema goit-rdb-hw-02
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `goit-rdb-hw-02` DEFAULT CHARACTER SET utf8 ;
USE `goit-rdb-hw-02` ;

-- -----------------------------------------------------
-- Table `goit-rdb-hw-02`.`Clients`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `goit-rdb-hw-02`.`Clients` ;

CREATE TABLE IF NOT EXISTS `goit-rdb-hw-02`.`Clients` (
  `client_id` INT NOT NULL AUTO_INCREMENT,
  `client_name` VARCHAR(100) NOT NULL,
  `client_address` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE INDEX (`client_name` ASC) VISIBLE);


-- -----------------------------------------------------
-- Table `goit-rdb-hw-02`.`Products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `goit-rdb-hw-02`.`Products` ;

CREATE TABLE IF NOT EXISTS `goit-rdb-hw-02`.`Products` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE INDEX (`product_name` ASC) VISIBLE);


-- -----------------------------------------------------
-- Table `goit-rdb-hw-02`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `goit-rdb-hw-02`.`Orders` ;

CREATE TABLE IF NOT EXISTS `goit-rdb-hw-02`.`Orders` (
  `order_number` INT NOT NULL AUTO_INCREMENT,
  `order_date` DATE NOT NULL,
  `client_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`order_number`),
  INDEX (`client_id` ASC) VISIBLE,
  CONSTRAINT `client_id`
    FOREIGN KEY (`client_id`)
    REFERENCES `goit-rdb-hw-02`.`Clients` (`client_id`));


-- -----------------------------------------------------
-- Table `goit-rdb-hw-02`.`Order_Items`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `goit-rdb-hw-02`.`Order_Items` ;

CREATE TABLE IF NOT EXISTS `goit-rdb-hw-02`.`Order_Items` (
  `order_item_id` INT NOT NULL AUTO_INCREMENT,
  `order_number` INT NULL DEFAULT NULL,
  `product_id` INT NULL DEFAULT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`order_item_id`),
  INDEX (`order_number` ASC) VISIBLE,
  INDEX (`product_id` ASC) VISIBLE,
  CONSTRAINT `odrder_number`
    FOREIGN KEY (`order_number`)
    REFERENCES `goit-rdb-hw-02`.`Orders` (`order_number`),
  CONSTRAINT `product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `goit-rdb-hw-02`.`Products` (`product_id`));


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
