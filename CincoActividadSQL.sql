-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema CincoActividadSQL
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema CincoActividadSQL
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CincoActividadSQL` DEFAULT CHARACTER SET utf8 ;
USE `CincoActividadSQL` ;

-- -----------------------------------------------------
-- Table `CincoActividadSQL`.`EMPLEO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CincoActividadSQL`.`EMPLEO` ;

CREATE TABLE IF NOT EXISTS `CincoActividadSQL`.`EMPLEO` (
  `ID_empleo` INT NOT NULL AUTO_INCREMENT,
  `Titulo` VARCHAR(45) NOT NULL,
  `Salario` FLOAT NOT NULL,
  PRIMARY KEY (`ID_empleo`),
  UNIQUE INDEX `ID_empleo_UNIQUE` (`ID_empleo` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CincoActividadSQL`.`EMPLEADO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CincoActividadSQL`.`EMPLEADO` ;

CREATE TABLE IF NOT EXISTS `CincoActividadSQL`.`EMPLEADO` (
  `ID_empleado` INT NOT NULL AUTO_INCREMENT,
  `ID_empleo` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_empleado`),
  UNIQUE INDEX `ID_empleado_UNIQUE` (`ID_empleado` ASC) VISIBLE,
  UNIQUE INDEX `ID_empleo_UNIQUE` (`ID_empleo` ASC) VISIBLE,
  -- CONSTRAINT `ID_empleo`
    FOREIGN KEY (`ID_empleo`)
    REFERENCES `CincoActividadSQL`.`EMPLEO` (`ID_empleo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CincoActividadSQL`.`PROYECTO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CincoActividadSQL`.`PROYECTO` ;

CREATE TABLE IF NOT EXISTS `CincoActividadSQL`.`PROYECTO` (
  `ID_proyecto` INT NOT NULL AUTO_INCREMENT,
  `ID_empleado` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  `Fecha_inicio` DATE NOT NULL,
  `Fecha_fin` DATE NOT NULL,
  PRIMARY KEY (`ID_proyecto`),
  UNIQUE INDEX `ID_proyecto_UNIQUE` (`ID_proyecto` ASC) VISIBLE,
  UNIQUE INDEX `ID_empleado_UNIQUE` (`ID_empleado` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CincoActividadSQL`.`ASIGNACION`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CincoActividadSQL`.`ASIGNACION` ;

CREATE TABLE IF NOT EXISTS `CincoActividadSQL`.`ASIGNACION` (
  `ID_asignacion` INT NOT NULL AUTO_INCREMENT,
  `ID_empleado` INT NOT NULL,
  `Asignacion_horas` FLOAT NOT NULL,
  `Fecha_asignacion` DATE NOT NULL,
  PRIMARY KEY (`ID_asignacion`),
  UNIQUE INDEX `ID_asignacion_UNIQUE` (`ID_asignacion` ASC) VISIBLE,
  INDEX `ID_empleado_idx` (`ID_empleado` ASC) VISIBLE,
  UNIQUE INDEX `ID_empleado_UNIQUE` (`ID_empleado` ASC) VISIBLE,
  CONSTRAINT `ID_empleado`
    FOREIGN KEY (`ID_empleado`)
    REFERENCES `CincoActividadSQL`.`PROYECTO` (`ID_proyecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CincoActividadSQL`.`EmpleoProyecto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CincoActividadSQL`.`EmpleoProyecto` ;

CREATE TABLE IF NOT EXISTS `CincoActividadSQL`.`EmpleoProyecto` (
  `ID_empleo` INT NOT NULL,
  `ID_proyecto` INT NOT NULL,
  INDEX `ID_empleo_idx` (`ID_empleo` ASC) VISIBLE,
  INDEX `ID_proyecto_idx` (`ID_proyecto` ASC) VISIBLE,
  UNIQUE INDEX `ID_empleo_UNIQUE` (`ID_empleo` ASC) VISIBLE,
  UNIQUE INDEX `ID_proyecto_UNIQUE` (`ID_proyecto` ASC) VISIBLE,
  CONSTRAINT `ID_empleo`
    FOREIGN KEY (`ID_empleo`)
    REFERENCES `CincoActividadSQL`.`EMPLEO` (`ID_empleo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ID_proyecto`
    FOREIGN KEY (`ID_proyecto`)
    REFERENCES `CincoActividadSQL`.`PROYECTO` (`ID_proyecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
