-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema libreria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema libreria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `libreria` DEFAULT CHARACTER SET utf8 ;
USE `libreria` ;

-- -----------------------------------------------------
-- Table `libreria`.`speciality`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria`.`speciality` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libreria`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria`.`city` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libreria`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria`.`Client` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `areaCode` INT NULL,
  `phone` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `shippingPreference` VARCHAR(45) NULL,
  `speciality_id` INT NULL,
  `city_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  INDEX `fk_Client_specialty1_idx` (`speciality_id` ASC),
  INDEX `fk_Client_city1_idx` (`city_id` ASC),
  CONSTRAINT `fk_Client_specialty1`
    FOREIGN KEY (`speciality_id`)
    REFERENCES `libreria`.`speciality` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Client_city1`
    FOREIGN KEY (`city_id`)
    REFERENCES `libreria`.`city` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libreria`.`type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria`.`type` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libreria`.`creditCard`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria`.`creditCard` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `client_id` INT NOT NULL,
  `number` VARCHAR(45) NOT NULL,
  `expiration` VARCHAR(45) NOT NULL,
  `ccv` VARCHAR(45) NOT NULL,
  `type_id` INT NOT NULL,
  PRIMARY KEY (`id`, `client_id`),
  INDEX `fk_creditCard_Client_idx` (`client_id` ASC),
  INDEX `fk_creditCard_type1_idx` (`type_id` ASC),
  CONSTRAINT `fk_creditCard_Client`
    FOREIGN KEY (`client_id`)
    REFERENCES `libreria`.`Client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_creditCard_type1`
    FOREIGN KEY (`type_id`)
    REFERENCES `libreria`.`type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libreria`.`author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria`.`author` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libreria`.`editorial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria`.`editorial` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libreria`.`book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria`.`book` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `ISBN` VARCHAR(100) NOT NULL,
  `price` INT NOT NULL,
  `stock` INT NOT NULL,
  `author_id` INT NOT NULL,
  `editorial_id` INT NOT NULL,
  `speciality_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_libro_author1_idx` (`author_id` ASC),
  INDEX `fk_libro_editorial1_idx` (`editorial_id` ASC),
  INDEX `fk_libro_specialty1_idx` (`speciality_id` ASC),
  CONSTRAINT `fk_libro_author1`
    FOREIGN KEY (`author_id`)
    REFERENCES `libreria`.`author` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_libro_editorial1`
    FOREIGN KEY (`editorial_id`)
    REFERENCES `libreria`.`editorial` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_libro_specialty1`
    FOREIGN KEY (`speciality_id`)
    REFERENCES `libreria`.`speciality` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libreria`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria`.`order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `client_id` INT NOT NULL,
  `date` DATE NULL,
  `total` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_order_Client1_idx` (`client_id` ASC),
  CONSTRAINT `fk_order_Client1`
    FOREIGN KEY (`client_id`)
    REFERENCES `libreria`.`Client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libreria`.`orderDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria`.`orderDetails` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `amount` INT NOT NULL,
  `order_id` INT NOT NULL,
  `book_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_orderDetails_order1_idx` (`order_id` ASC),
  INDEX `fk_orderDetails_libro1_idx` (`book_id` ASC),
  CONSTRAINT `fk_orderDetails_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `libreria`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderDetails_libro1`
    FOREIGN KEY (`book_id`)
    REFERENCES `libreria`.`book` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libreria`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libreria`.`libro_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria`.`libro_category` (
  `book_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`book_id`, `category_id`),
  INDEX `fk_libro_has_category_category1_idx` (`category_id` ASC),
  INDEX `fk_libro_has_category_libro1_idx` (`book_id` ASC),
  CONSTRAINT `fk_libro_has_category_libro1`
    FOREIGN KEY (`book_id`)
    REFERENCES `libreria`.`book` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_libro_has_category_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `libreria`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
