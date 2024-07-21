-- MySQL Workbench Forward Engineering

-- Establecer variables para desactivar comprobaciones temporales
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- Crear el esquema si no existe y usarlo
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8mb4 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`PRODUCTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PRODUCTO` (
  `ID_producto` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Precio` FLOAT NOT NULL,
  `Cantidad_en_stock` INT NOT NULL,
  `Fecha_de_caducidad` DATE NOT NULL,
  PRIMARY KEY (`ID_producto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`VENTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`VENTA` (
  `ID_venta` INT NOT NULL AUTO_INCREMENT,
  `ID_producto` INT NOT NULL,
  `Cantidad_vendida` INT NOT NULL,
  `Fecha_de_venta` DATE NOT NULL,
  `Total_de_venta` FLOAT NOT NULL,
  PRIMARY KEY (`ID_venta`, `ID_producto`),
  INDEX `ID_producto_idx` (`ID_producto` ASC) VISIBLE,
  CONSTRAINT `ID_producto`
    FOREIGN KEY (`ID_producto`)
    REFERENCES `mydb`.`PRODUCTO` (`ID_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PROVEEDOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PROVEEDOR` (
  `ID_proveedor` INT NOT NULL AUTO_INCREMENT,
  `ID_producto` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_proveedor`, `ID_producto`),
  INDEX `ID_producto_idx` (`ID_producto` ASC) VISIBLE,
  CONSTRAINT `ID_producto`
    FOREIGN KEY (`ID_producto`)
    REFERENCES `mydb`.`PRODUCTO` (`ID_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DESCRIPCION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DESCRIPCION` (
  `ID_descripcion` INT NOT NULL AUTO_INCREMENT,
  `ID_producto` INT NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Empaque` VARCHAR(45) NOT NULL,
  `Presentacion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_descripcion`, `ID_producto`),
  INDEX `ID_producto_idx` (`ID_producto` ASC) VISIBLE,
  CONSTRAINT `ID_producto_desc`
    FOREIGN KEY (`ID_producto`)
    REFERENCES `mydb`.`PRODUCTO` (`ID_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Restaurar configuración original de SQL_MODE y comprobaciones de claves foráneas y únicas
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
