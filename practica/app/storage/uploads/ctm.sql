SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `BDDSW` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
USE `BDDSW` ;

-- -----------------------------------------------------
-- Table `BDDSW`.`Administradores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDDSW`.`Administradores` (
  `Rut_Adm` VARCHAR(20) NOT NULL,
  `Clave` VARCHAR(20) NOT NULL,
  `Nombre` VARCHAR(20) NOT NULL,
  `Apellido` VARCHAR(20) NOT NULL,
  `created_at` DATE NOT NULL,
  `updated_at` DATE NOT NULL,
  PRIMARY KEY (`Rut_Adm`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Rut_Adm_UNIQUE` ON `BDDSW`.`Administradores` (`Rut_Adm` ASC);


-- -----------------------------------------------------
-- Table `BDDSW`.`Archivos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDDSW`.`Archivos` (
  `Cod_Arch` VARCHAR(20) NOT NULL,
  `Nombre` VARCHAR(20) NOT NULL,
  `created_at` DATE NOT NULL,
  `updated_at` DATE NULL,
  PRIMARY KEY (`Cod_Arch`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Archivo_UNIQUE` ON `BDDSW`.`Archivos` (`Cod_Arch` ASC);


-- -----------------------------------------------------
-- Table `BDDSW`.`Carreras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDDSW`.`Carreras` (
  `Cod_Carrera` VARCHAR(20) NOT NULL,
  `Nombre` VARCHAR(20) NOT NULL,
  `created_at` DATE NOT NULL,
  `updated_at` DATE NOT NULL,
  PRIMARY KEY (`Cod_Carrera`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Cod_Carrera_UNIQUE` ON `BDDSW`.`Carreras` (`Cod_Carrera` ASC);


-- -----------------------------------------------------
-- Table `BDDSW`.`Alumnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDDSW`.`Alumnos` (
  `Rut_Alum` VARCHAR(20) NOT NULL,
  `Clave` VARCHAR(20) NOT NULL,
  `Nombre` VARCHAR(20) NOT NULL,
  `Apellido` VARCHAR(20) NOT NULL,
  `Carrera_Cod_Carrera` VARCHAR(20) NOT NULL,
  `created_at` DATE NOT NULL,
  `updated_at` DATE NOT NULL,
  PRIMARY KEY (`Rut_Alum`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Rut_Alum_UNIQUE` ON `BDDSW`.`Alumnos` (`Rut_Alum` ASC);

CREATE INDEX `fk_Alumno_Carrera1_idx` ON `BDDSW`.`Alumnos` (`Carrera_Cod_Carrera` ASC);


-- -----------------------------------------------------
-- Table `BDDSW`.`Asignaturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDDSW`.`Asignaturas` (
  `Cod_Asig` VARCHAR(20) NOT NULL,
  `Nombre` VARCHAR(20) NOT NULL,
  `created_at` DATE NOT NULL,
  `updated_at` DATE NOT NULL,
  PRIMARY KEY (`Cod_Asig`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Cod_Asig_UNIQUE` ON `BDDSW`.`Asignaturas` (`Cod_Asig` ASC);


-- -----------------------------------------------------
-- Table `BDDSW`.`Departamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDDSW`.`Departamentos` (
  `Cod_Dpto` VARCHAR(20) NOT NULL,
  `updated_at` DATE NOT NULL,
  `created_at` DATE NOT NULL,
  PRIMARY KEY (`Cod_Dpto`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Cod_Dpto_UNIQUE` ON `BDDSW`.`Departamentos` (`Cod_Dpto` ASC);


-- -----------------------------------------------------
-- Table `BDDSW`.`Profesores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDDSW`.`Profesores` (
  `Rut_Prof` VARCHAR(20) NOT NULL,
  `Clave` VARCHAR(20) NOT NULL,
  `Nombre` VARCHAR(20) NOT NULL,
  `Apellido` VARCHAR(20) NOT NULL,
  `Departamento_Cod_Dpto` VARCHAR(20) NOT NULL,
  `created_at` DATE NOT NULL,
  `updated_at` DATE NOT NULL,
  PRIMARY KEY (`Rut_Prof`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Rut_Prof_UNIQUE` ON `BDDSW`.`Profesores` (`Rut_Prof` ASC);

CREATE INDEX `fk_Profesor_Departamento1_idx` ON `BDDSW`.`Profesores` (`Departamento_Cod_Dpto` ASC);


-- -----------------------------------------------------
-- Table `BDDSW`.`Administradores_has_Archivos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDDSW`.`Administradores_has_Archivos` (
  `Administradores_Rut_Adm` VARCHAR(20) NOT NULL,
  `Archivos_Cod_Arch` VARCHAR(20) NOT NULL,
  `created_at` DATE NOT NULL,
  `updated_at` DATE NOT NULL,
  PRIMARY KEY (`Administradores_Rut_Adm`, `Archivos_Cod_Arch`))
ENGINE = InnoDB;

CREATE INDEX `fk_Administradores_has_Archivos_Archivos1_idx` ON `BDDSW`.`Administradores_has_Archivos` (`Archivos_Cod_Arch` ASC);

CREATE INDEX `fk_Administradores_has_Archivos_Administradores1_idx` ON `BDDSW`.`Administradores_has_Archivos` (`Administradores_Rut_Adm` ASC);


-- -----------------------------------------------------
-- Table `BDDSW`.`Profesores_has_Archivos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDDSW`.`Profesores_has_Archivos` (
  `Profesores_Rut_Prof` VARCHAR(20) NOT NULL,
  `Archivos_Cod_Arch` VARCHAR(20) NOT NULL,
  `created_at` DATE NOT NULL,
  `updated_at` DATE NOT NULL,
  PRIMARY KEY (`Profesores_Rut_Prof`, `Archivos_Cod_Arch`))
ENGINE = InnoDB;

CREATE INDEX `fk_Profesores_has_Archivos_Archivos1_idx` ON `BDDSW`.`Profesores_has_Archivos` (`Archivos_Cod_Arch` ASC);

CREATE INDEX `fk_Profesores_has_Archivos_Profesores1_idx` ON `BDDSW`.`Profesores_has_Archivos` (`Profesores_Rut_Prof` ASC);


-- -----------------------------------------------------
-- Table `BDDSW`.`Alumnos_has_Asignaturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDDSW`.`Alumnos_has_Asignaturas` (
  `Alumnos_Rut_Alum` VARCHAR(20) NOT NULL,
  `Asignaturas_Cod_Asig` VARCHAR(20) NOT NULL,
  `created_at` DATE NOT NULL,
  `updated_at` DATE NOT NULL,
  PRIMARY KEY (`Alumnos_Rut_Alum`, `Asignaturas_Cod_Asig`))
ENGINE = InnoDB;

CREATE INDEX `fk_Alumnos_has_Asignaturas_Asignaturas1_idx` ON `BDDSW`.`Alumnos_has_Asignaturas` (`Asignaturas_Cod_Asig` ASC);

CREATE INDEX `fk_Alumnos_has_Asignaturas_Alumnos1_idx` ON `BDDSW`.`Alumnos_has_Asignaturas` (`Alumnos_Rut_Alum` ASC);


-- -----------------------------------------------------
-- Table `BDDSW`.`Departamentos_has_Asignaturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDDSW`.`Departamentos_has_Asignaturas` (
  `Departamentos_Cod_Dpto` VARCHAR(20) NOT NULL,
  `Asignaturas_Cod_Asig` VARCHAR(20) NOT NULL,
  `created_at` DATE NOT NULL,
  `updated_at` DATE NOT NULL,
  PRIMARY KEY (`Departamentos_Cod_Dpto`, `Asignaturas_Cod_Asig`))
ENGINE = InnoDB;

CREATE INDEX `fk_Departamentos_has_Asignaturas_Asignaturas1_idx` ON `BDDSW`.`Departamentos_has_Asignaturas` (`Asignaturas_Cod_Asig` ASC);

CREATE INDEX `fk_Departamentos_has_Asignaturas_Departamentos1_idx` ON `BDDSW`.`Departamentos_has_Asignaturas` (`Departamentos_Cod_Dpto` ASC);


-- -----------------------------------------------------
-- Table `BDDSW`.`Profesores_has_Asignaturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDDSW`.`Profesores_has_Asignaturas` (
  `Profesores_Rut_Prof` VARCHAR(20) NOT NULL,
  `Asignaturas_Cod_Asig` VARCHAR(20) NOT NULL,
  `created_at` DATE NOT NULL,
  `updated_at` DATE NOT NULL,
  PRIMARY KEY (`Profesores_Rut_Prof`, `Asignaturas_Cod_Asig`))
ENGINE = InnoDB;

CREATE INDEX `fk_Profesores_has_Asignaturas_Asignaturas1_idx` ON `BDDSW`.`Profesores_has_Asignaturas` (`Asignaturas_Cod_Asig` ASC);

CREATE INDEX `fk_Profesores_has_Asignaturas_Profesores1_idx` ON `BDDSW`.`Profesores_has_Asignaturas` (`Profesores_Rut_Prof` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
