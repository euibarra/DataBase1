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
CREATE SCHEMA IF NOT EXISTS `ActividadSQL` DEFAULT CHARACTER SET utf8 ;
USE `ActividadSQL` ;

-- -----------------------------------------------------
-- Table `mydb`.`CLIENTES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ActividadSQL`.`CLIENTES` (
  `ID_clientes` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Teléfono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_clientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`HABITACIONES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ActividadSQL`.`HABITACIONES` (
  `ID_habitaciones` INT NOT NULL AUTO_INCREMENT,
  `Tipo` VARCHAR(45) NOT NULL,
  `Precio` FLOAT NOT NULL,
  `Disponibilidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_habitaciones`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`RESERVAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ActividadSQL`.`RESERVAS` (
  `ID_reservas` INT NOT NULL AUTO_INCREMENT,
  `Fecha_inicio` DATE NOT NULL,
  `Fecha_fin` DATE NOT NULL,
  PRIMARY KEY (`ID_reservas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`HOTEL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ActividadSQL`.`HOTEL` (
  `ID_hotel` INT NOT NULL AUTO_INCREMENT,
  `ID_habitaciones` INT NOT NULL,
  `ID_clientes` INT NOT NULL,
  `ID_reservas` INT NOT NULL,
  PRIMARY KEY (`ID_hotel`, `ID_clientes`, `ID_reservas`, `ID_habitaciones`),
  INDEX `ID_clientes_idx` (`ID_clientes` ASC),
  INDEX `ID_habitaciones_idx` (`ID_habitaciones` ASC),
  INDEX `ID_reservas_idx` (`ID_reservas` ASC),
  CONSTRAINT `ID_clientes`
    FOREIGN KEY (`ID_clientes`)
    REFERENCES `ActividadSQL`.`CLIENTES` (`ID_clientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ID_habitaciones`
    FOREIGN KEY (`ID_habitaciones`)
    REFERENCES `ActividadSQL`.`HABITACIONES` (`ID_habitaciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ID_reservas`
    FOREIGN KEY (`ID_reservas`)
    REFERENCES `ActividadSQL`.`RESERVAS` (`ID_reservas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;