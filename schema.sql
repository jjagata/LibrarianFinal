-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema library
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema library
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `library` DEFAULT CHARACTER SET utf8 ;
USE `library` ;

-- -----------------------------------------------------
-- Table `library`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`address` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(255) NULL DEFAULT NULL,
  `number` VARCHAR(255) NULL DEFAULT NULL,
  `street` VARCHAR(255) NULL DEFAULT NULL,
  `zipCode` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `library`.`author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`author` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(255) NULL DEFAULT NULL,
  `lastName` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `library`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`category` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `library`.`book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`book` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NULL DEFAULT NULL,
  `author_id` INT(11) NULL DEFAULT NULL,
  `category_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKklnrv3weler2ftkweewlky958` (`author_id` ASC),
  INDEX `FKam9riv8y6rjwkua1gapdfew4j` (`category_id` ASC),
  CONSTRAINT `FKam9riv8y6rjwkua1gapdfew4j`
    FOREIGN KEY (`category_id`)
    REFERENCES `library`.`category` (`id`),
  CONSTRAINT `FKklnrv3weler2ftkweewlky958`
    FOREIGN KEY (`author_id`)
    REFERENCES `library`.`author` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `library`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(255) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `library`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`employee` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(255) NULL DEFAULT NULL,
  `lastName` VARCHAR(255) NULL DEFAULT NULL,
  `user_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`),
  INDEX `FK6lk0xml9r7okjdq0onka4ytju` (`user_id` ASC),
  CONSTRAINT `FK6lk0xml9r7okjdq0onka4ytju`
    FOREIGN KEY (`user_id`)
    REFERENCES `library`.`user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `library`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`customer` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `birthDate` DATETIME(6) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `firstName` VARCHAR(255) NULL DEFAULT NULL,
  `lastName` VARCHAR(255) NULL DEFAULT NULL,
  `address_id` INT(11) NULL DEFAULT NULL,
  `user_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKglkhkmh2vyn790ijs6hiqqpi` (`address_id` ASC),
  INDEX `FKj8dlm21j202cadsbfkoem0s58` (`user_id` ASC),
  CONSTRAINT `FKglkhkmh2vyn790ijs6hiqqpi`
    FOREIGN KEY (`address_id`)
    REFERENCES `library`.`address` (`id`),
  CONSTRAINT `FKj8dlm21j202cadsbfkoem0s58`
    FOREIGN KEY (`user_id`)
    REFERENCES `library`.`user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `library`.`borrowing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`borrowing` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `rentalDate` DATE NULL DEFAULT NULL,
  `returnDate` DATE NULL DEFAULT NULL,
  `status` VARCHAR(255) NULL DEFAULT NULL,
  `book_id` INT(11) NULL DEFAULT NULL,
  `customer_id` INT(11) NULL DEFAULT NULL,
  `employee_Id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKpgw9do56tnua1aepwswrbwifh` (`book_id` ASC),
  INDEX `FKnh1g6u9v9bf1vy9ew5c84jx8j` (`customer_id` ASC),
  INDEX `FKhklsrewf0xffse4kbmc6oltdr` (`employee_Id` ASC),
  CONSTRAINT `FKhklsrewf0xffse4kbmc6oltdr`
    FOREIGN KEY (`employee_Id`)
    REFERENCES `library`.`employee` (`Id`),
  CONSTRAINT `FKnh1g6u9v9bf1vy9ew5c84jx8j`
    FOREIGN KEY (`customer_id`)
    REFERENCES `library`.`customer` (`id`),
  CONSTRAINT `FKpgw9do56tnua1aepwswrbwifh`
    FOREIGN KEY (`book_id`)
    REFERENCES `library`.`book` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
