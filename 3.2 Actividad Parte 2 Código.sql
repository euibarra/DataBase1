-- MySQL Workbench Forward Engineering

-- Establecer variables para desactivar restricciones temporales
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- Crear el esquema 'mydb' si no existe, con codificación de caracteres UTF-8
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`PRODUCTO`
-- -----------------------------------------------------
-- Crear la tabla `PRODUCTO`
CREATE TABLE IF NOT EXISTS `mydb`.`PRODUCTO` (
  `ID_producto` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Precio` FLOAT NOT NULL,
  `Cantidad_en_stock` INT NOT NULL,
  `Fecha_de_caducidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_producto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`VENTA`
-- -----------------------------------------------------
-- Crear la tabla `VENTA`
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
-- Crear la tabla `PROVEEDOR`
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
-- Crear la tabla `DESCRIPCION`
CREATE TABLE IF NOT EXISTS `mydb`.`DESCRIPCION` (
  `ID_descripcion` INT NOT NULL AUTO_INCREMENT,
  `ID_producto` INT NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Empaque` VARCHAR(45) NOT NULL,
  `Presentacion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_descripcion`, `ID_producto`),
  INDEX `ID_producto_idx` (`ID_producto` ASC) VISIBLE,
  CONSTRAINT `ID_producto`
    FOREIGN KEY (`ID_producto`)
    REFERENCES `mydb`.`PRODUCTO` (`ID_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CLIENTES`
-- -----------------------------------------------------
-- Crear la tabla `CLIENTES`
CREATE TABLE IF NOT EXISTS `mydb`.`CLIENTES` (
  `ID_cliente` INT NOT NULL,
  `ID_venta` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_cliente`),
  INDEX `ID_venta_idx` (`ID_venta` ASC) VISIBLE,
  CONSTRAINT `ID_venta`
    FOREIGN KEY (`ID_venta`)
    REFERENCES `mydb`.`VENTA` (`ID_venta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DETALLE_DE_VENTA`
-- -----------------------------------------------------
-- Crear la tabla `DETALLE_DE_VENTA`
CREATE TABLE IF NOT EXISTS `mydb`.`DETALLE_DE_VENTA` (
  `ID_detalle_venta` INT NOT NULL,
  `ID_venta` INT NOT NULL,
  `ID_producto` INT NOT NULL,
  `Cantidad_vendida` INT NOT NULL,
  `Precio_unitario` FLOAT NOT NULL,
  PRIMARY KEY (`ID_detalle_venta`, `ID_producto`),
  INDEX `ID_venta_idx` (`ID_venta` ASC) VISIBLE,
  INDEX `ID_producto_idx` (`ID_producto` ASC) VISIBLE,
  CONSTRAINT `ID_venta`
    FOREIGN KEY (`ID_venta`)
    REFERENCES `mydb`.`VENTA` (`ID_venta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ID_producto`
    FOREIGN KEY (`ID_producto`)
    REFERENCES `mydb`.`PRODUCTO` (`ID_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Restaurar las configuraciones originales de MySQL
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
