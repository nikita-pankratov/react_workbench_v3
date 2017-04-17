-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema react_workplace
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema react_workplace
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `react_workplace` DEFAULT CHARACTER SET utf8 ;
USE `react_workplace` ;

-- -----------------------------------------------------
-- Table `react_workplace`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `react_workplace`.`employee` (
  `idemployee` INT NOT NULL,
  `username` VARCHAR(20) NOT NULL,
  `password` CHAR(128) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `skills` VARCHAR(200) NULL,
  `description` VARCHAR(200) NULL,
  `image_url` VARCHAR(200) NULL,
  PRIMARY KEY (`idemployee`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  UNIQUE INDEX `idemployee_UNIQUE` (`idemployee` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `react_workplace`.`organization`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `react_workplace`.`organization` (
  `idorganization` INT NOT NULL,
  `username` VARCHAR(20) NOT NULL,
  `name` VARCHAR(50) NULL,
  `password` CHAR(128) NOT NULL,
  `description` VARCHAR(200) NULL,
  `image_url` VARCHAR(200) NULL,
  PRIMARY KEY (`idorganization`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  UNIQUE INDEX `idorganization_UNIQUE` (`idorganization` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `react_workplace`.`project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `react_workplace`.`project` (
  `idproject` INT NOT NULL,
  `organization_idorganization` INT NOT NULL,
  `description` VARCHAR(250) NULL,
  `start_date` DATETIME NOT NULL,
  `requirements` VARCHAR(250) NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`idproject`, `organization_idorganization`),
  INDEX `fk_project_organization_idx` (`organization_idorganization` ASC),
  UNIQUE INDEX `idproject_UNIQUE` (`idproject` ASC),
  CONSTRAINT `fk_project_organization`
    FOREIGN KEY (`organization_idorganization`)
    REFERENCES `react_workplace`.`organization` (`idorganization`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `react_workplace`.`project_has_worker`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `react_workplace`.`project_has_worker` (
  `project_idproject` INT NOT NULL,
  `project_organization_idorganization` INT NOT NULL,
  `worker_idworker` INT NOT NULL,
  PRIMARY KEY (`project_idproject`, `project_organization_idorganization`, `worker_idworker`),
  INDEX `fk_project_has_worker_worker1_idx` (`worker_idworker` ASC),
  INDEX `fk_project_has_worker_project1_idx` (`project_idproject` ASC, `project_organization_idorganization` ASC),
  CONSTRAINT `fk_project_has_worker_project1`
    FOREIGN KEY (`project_idproject` , `project_organization_idorganization`)
    REFERENCES `react_workplace`.`project` (`idproject` , `organization_idorganization`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_project_has_worker_worker1`
    FOREIGN KEY (`worker_idworker`)
    REFERENCES `react_workplace`.`employee` (`idemployee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO employee VALUES (4, 'den', 'den', 'Den', 'Admin', 'Hire Me!', 'httpimg');
INSERT INTO employee VALUES (2, 'user1', 'user1', 'UserOne', 'noob', 'Do NOT Hire Me!', 'httpimg2');
INSERT INTO employee VALUES (3, 'user2', 'user2', 'UserTwo', 'noob as well', 'Do NOT Hire Me!', 'httpimg3');


INSERT INTO organization VALUES (1, 'main', 'main', 'main', 'We are the main organization u dumb ass!', 'httpimg2');
INSERT INTO organization VALUES (2, 'apple', 'apple', 'apple', 'We are the shit organization u dumb ass!', 'httpimg2');
INSERT INTO organization VALUES (3, 'sony', 'sony', 'sony', 'We are the shit organization u dumb ass!', 'httpimg2');

INSERT INTO project VALUES (1, 1, 'We are the project of MAIN ORGANIZATION', '2017-01-01 00:00:01', 'We need smart ppl', 'SaveTheFat');

