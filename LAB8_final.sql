-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LAB8
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LAB8
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LAB8` DEFAULT CHARACTER SET utf8 ;
USE `LAB8` ;

-- -----------------------------------------------------
-- Table `LAB8`.`Status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LAB8`.`Status` (
  `idStatus` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idStatus`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LAB8`.`Estudiante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LAB8`.`Estudiante` (
  `idEstudiante` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `edad` INT NOT NULL,
  `codigoPUCP` VARCHAR(8) NOT NULL,
  `especialidad` VARCHAR(100) NOT NULL,
  `contrasena` VARCHAR(45) NOT NULL,
  `confirmacionContra` VARCHAR(45) NOT NULL,
  `Status_idStatus` INT NOT NULL,
  PRIMARY KEY (`idEstudiante`),
  CONSTRAINT `fk_Estudiante_Status`
    FOREIGN KEY (`Status_idStatus`)
    REFERENCES `LAB8`.`Status` (`idStatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Estudiante_Status_idx` ON `LAB8`.`Estudiante` (`Status_idStatus` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `LAB8`.`Viajes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LAB8`.`Viajes` (
  `idViajes` INT NOT NULL,
  `fechaReserva` DATETIME NOT NULL,
  `fechaViaje` DATETIME NOT NULL,
  `origenCiudad` VARCHAR(45) NOT NULL,
  `destinoCiudad` VARCHAR(45) NOT NULL,
  `empresaSeguro` VARCHAR(45) NULL,
  `numeroBoletos` INT NOT NULL,
  `costoTotal` FLOAT NOT NULL,
  `Estudiante_idEstudiante` INT NOT NULL,
  PRIMARY KEY (`idViajes`),
  CONSTRAINT `fk_Viajes_Estudiante1`
    FOREIGN KEY (`Estudiante_idEstudiante`)
    REFERENCES `LAB8`.`Estudiante` (`idEstudiante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Viajes_Estudiante1_idx` ON `LAB8`.`Viajes` (`Estudiante_idEstudiante` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
