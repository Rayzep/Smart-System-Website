SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema smartfarm
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema smartfarm
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `smartfarm` DEFAULT CHARACTER SET utf8mb3 ;
USE `smartfarm` ;

-- -----------------------------------------------------
-- Table `smartfarm`.`farm_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smartfarm`.`farm_info` (
  `farmID` INT NOT NULL AUTO_INCREMENT,
  `farmName` VARCHAR(255) NOT NULL,
  `location` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`farmID`),
  UNIQUE INDEX `farmName_UNIQUE` (`farmName` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

-- -----------------------------------------------------
-- Table `smartfarm`.`parameters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smartfarm`.`parameters` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `farmID` INT NOT NULL,
  `temperature` INT NOT NULL,
  `humidity` INT NOT NULL,
  `soilMoisture` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_farmID_idx` (`farmID` ASC),
  CONSTRAINT `fk_farmID`
    FOREIGN KEY (`farmID`)
    REFERENCES `smartfarm`.`farm_info` (`farmID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
