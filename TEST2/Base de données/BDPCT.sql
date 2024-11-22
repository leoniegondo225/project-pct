-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema pctbd
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pctbd
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pctbd` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- -----------------------------------------------------
-- Schema bdpct
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bdpct
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bdpct` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `pctbd` ;

-- -----------------------------------------------------
-- Table `pctbd`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pctbd`.`clients` (
  `idClient` INT NOT NULL,
  `Nonclient` VARCHAR(100) NULL DEFAULT NULL,
  `Contact` VARCHAR(100) NULL DEFAULT NULL,
  `Commune` VARCHAR(100) NULL DEFAULT NULL,
  `Quartier` VARCHAR(100) NULL DEFAULT NULL,
  `TypeBesoins` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idClient`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pctbd`.`articles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pctbd`.`articles` (
  `idArticle` INT NOT NULL,
  `NomArticle` VARCHAR(100) NULL DEFAULT NULL,
  `Montant` DECIMAL(10,2) NULL DEFAULT NULL,
  `Quantité` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idArticle`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pctbd`.`achete`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pctbd`.`achete` (
  `idAchat` INT NOT NULL,
  `idClient` INT NULL DEFAULT NULL,
  `idArticle` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idAchat`),
  INDEX `idClient` (`idClient` ASC) VISIBLE,
  INDEX `idArticle` (`idArticle` ASC) VISIBLE,
  CONSTRAINT `achete_ibfk_1`
    FOREIGN KEY (`idClient`)
    REFERENCES `pctbd`.`clients` (`idClient`),
  CONSTRAINT `achete_ibfk_2`
    FOREIGN KEY (`idArticle`)
    REFERENCES `pctbd`.`articles` (`idArticle`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pctbd`.`artisans`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pctbd`.`artisans` (
  `idArtisan` INT NOT NULL,
  `NonArtisan` VARCHAR(100) NULL DEFAULT NULL,
  `Contact` VARCHAR(100) NULL DEFAULT NULL,
  `WorkSpace` VARCHAR(100) NULL DEFAULT NULL,
  `Métier` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idArtisan`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pctbd`.`fabrique`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pctbd`.`fabrique` (
  `idProduction` INT NOT NULL,
  `idArtisan` INT NULL DEFAULT NULL,
  `idArticle` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idProduction`),
  INDEX `idArtisan` (`idArtisan` ASC) VISIBLE,
  INDEX `idArticle` (`idArticle` ASC) VISIBLE,
  CONSTRAINT `fabrique_ibfk_1`
    FOREIGN KEY (`idArtisan`)
    REFERENCES `pctbd`.`artisans` (`idArtisan`),
  CONSTRAINT `fabrique_ibfk_2`
    FOREIGN KEY (`idArticle`)
    REFERENCES `pctbd`.`articles` (`idArticle`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pctbd`.`livreurs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pctbd`.`livreurs` (
  `idLivreur` INT NOT NULL,
  `NomLivreur` VARCHAR(100) NULL DEFAULT NULL,
  `Contact` VARCHAR(100) NULL DEFAULT NULL,
  `Engins` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idLivreur`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pctbd`.`livre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pctbd`.`livre` (
  `idLivraison` INT NOT NULL,
  `idLivreur` INT NULL DEFAULT NULL,
  `idClient` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idLivraison`),
  INDEX `idLivreur` (`idLivreur` ASC) VISIBLE,
  INDEX `idClient` (`idClient` ASC) VISIBLE,
  CONSTRAINT `livre_ibfk_1`
    FOREIGN KEY (`idLivreur`)
    REFERENCES `pctbd`.`livreurs` (`idLivreur`),
  CONSTRAINT `livre_ibfk_2`
    FOREIGN KEY (`idClient`)
    REFERENCES `pctbd`.`clients` (`idClient`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pctbd`.`services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pctbd`.`services` (
  `idService` INT NOT NULL,
  `idArtisan` INT NULL DEFAULT NULL,
  `idClient` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idService`),
  INDEX `idArtisan` (`idArtisan` ASC) VISIBLE,
  INDEX `idClient` (`idClient` ASC) VISIBLE,
  CONSTRAINT `services_ibfk_1`
    FOREIGN KEY (`idArtisan`)
    REFERENCES `pctbd`.`artisans` (`idArtisan`),
  CONSTRAINT `services_ibfk_2`
    FOREIGN KEY (`idClient`)
    REFERENCES `pctbd`.`clients` (`idClient`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `bdpct` ;

-- -----------------------------------------------------
-- Table `bdpct`.`artisans`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdpct`.`artisans` (
  `idartisans` INT NOT NULL AUTO_INCREMENT,
  `nom_artisan` VARCHAR(45) NOT NULL,
  `prenom_artisan` VARCHAR(45) NOT NULL,
  `age_artisan` INT NULL DEFAULT NULL,
  `numero_artisan` VARCHAR(10) NULL DEFAULT NULL,
  `email_artisan` VARCHAR(100) NULL DEFAULT NULL,
  `profession_artisan` VARCHAR(100) NULL DEFAULT NULL,
  `localisation_artisan` VARCHAR(100) NULL DEFAULT NULL,
  `metier` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idartisans`),
  UNIQUE INDEX `email_artisan` (`email_artisan` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bdpct`.`packs_publicitaires`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdpct`.`packs_publicitaires` (
  `idpacks_publicitaires` INT NOT NULL AUTO_INCREMENT,
  `Nom_du_pack` VARCHAR(45) NOT NULL,
  `Description_du_pack` VARCHAR(45) NULL DEFAULT NULL,
  `Cout_du_pack` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`idpacks_publicitaires`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bdpct`.`choisir`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdpct`.`choisir` (
  `idchoix` VARCHAR(45) NOT NULL,
  `artisans_idartisans` INT NULL DEFAULT NULL,
  `idpacks_publicitaires` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idchoix`),
  INDEX `artisans_idartisans` (`artisans_idartisans` ASC) VISIBLE,
  INDEX `idpacks_publicitaires` (`idpacks_publicitaires` ASC) VISIBLE,
  CONSTRAINT `choisir_ibfk_1`
    FOREIGN KEY (`artisans_idartisans`)
    REFERENCES `bdpct`.`artisans` (`idartisans`),
  CONSTRAINT `choisir_ibfk_2`
    FOREIGN KEY (`idpacks_publicitaires`)
    REFERENCES `bdpct`.`packs_publicitaires` (`idpacks_publicitaires`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bdpct`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdpct`.`clients` (
  `idClient` INT NOT NULL AUTO_INCREMENT,
  `Nomclient` VARCHAR(100) NOT NULL,
  `Contact` INT NOT NULL,
  `Commune` VARCHAR(100) NULL DEFAULT NULL,
  `Quartier` VARCHAR(100) NULL DEFAULT NULL,
  `Mot_de_passe` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idClient`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bdpct`.`demandes_service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdpct`.`demandes_service` (
  `iddemandes_Service` INT NOT NULL AUTO_INCREMENT,
  `Description_besoin` VARCHAR(45) NOT NULL,
  `Date_demande` DATETIME NOT NULL,
  `Statut_demande` VARCHAR(45) NULL DEFAULT NULL,
  `artisans_idartisans` INT NOT NULL,
  PRIMARY KEY (`iddemandes_Service`),
  INDEX `artisans_idartisans` (`artisans_idartisans` ASC) VISIBLE,
  CONSTRAINT `demandes_service_ibfk_1`
    FOREIGN KEY (`artisans_idartisans`)
    REFERENCES `bdpct`.`artisans` (`idartisans`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bdpct`.`facture`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdpct`.`facture` (
  `idfacture` INT NOT NULL AUTO_INCREMENT,
  `pack_choisi` VARCHAR(45) NULL DEFAULT NULL,
  `montant` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idfacture`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bdpct`.`faire`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdpct`.`faire` (
  `idfait_demande` VARCHAR(45) NOT NULL,
  `clients_idClient` INT NOT NULL,
  `iddemandes_Service` INT NOT NULL,
  PRIMARY KEY (`idfait_demande`),
  INDEX `clients_idClient` (`clients_idClient` ASC) VISIBLE,
  INDEX `iddemandes_Service` (`iddemandes_Service` ASC) VISIBLE,
  CONSTRAINT `faire_ibfk_1`
    FOREIGN KEY (`clients_idClient`)
    REFERENCES `bdpct`.`clients` (`idClient`),
  CONSTRAINT `faire_ibfk_2`
    FOREIGN KEY (`iddemandes_Service`)
    REFERENCES `bdpct`.`demandes_service` (`iddemandes_Service`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bdpct`.`solder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdpct`.`solder` (
  `artisans_idartisans` INT NOT NULL,
  `facture_idfacture` INT NOT NULL,
  `statut` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`artisans_idartisans`, `facture_idfacture`),
  INDEX `facture_idfacture` (`facture_idfacture` ASC) VISIBLE,
  CONSTRAINT `solder_ibfk_1`
    FOREIGN KEY (`artisans_idartisans`)
    REFERENCES `bdpct`.`artisans` (`idartisans`),
  CONSTRAINT `solder_ibfk_2`
    FOREIGN KEY (`facture_idfacture`)
    REFERENCES `bdpct`.`facture` (`idfacture`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`artisans`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`artisans` (
  `idartisans` INT NOT NULL AUTO_INCREMENT,
  `nom_artisan` VARCHAR(45) NOT NULL,
  `prenom_artisan` VARCHAR(45) NOT NULL,
  `age_artisan` INT NULL DEFAULT NULL,
  `numero_artisan` VARCHAR(10) NULL DEFAULT NULL,
  `email_artisan` VARCHAR(100) NULL DEFAULT NULL,
  `profession_artisan` VARCHAR(100) NULL DEFAULT NULL,
  `localisation_artisan` VARCHAR(100) NULL DEFAULT NULL,
  `metier` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idartisans`),
  UNIQUE INDEX `email_artisan` (`email_artisan` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`facture`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`facture` (
  `idfacture` INT NOT NULL AUTO_INCREMENT,
  `pack_choisi` VARCHAR(45) NULL DEFAULT NULL,
  `montant` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idfacture`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`packs_publicitaires`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`packs_publicitaires` (
  `idpacks_publicitaires` INT NOT NULL AUTO_INCREMENT,
  `Nom_du_pack` VARCHAR(45) NOT NULL,
  `Description_du_pack` VARCHAR(45) NULL DEFAULT NULL,
  `Cout_du_pack` VARCHAR(20) NULL DEFAULT NULL,
  `facture_idfacture` INT NOT NULL,
  PRIMARY KEY (`idpacks_publicitaires`),
  INDEX `fk_packs_publicitaires_facture1_idx` (`facture_idfacture` ASC) VISIBLE,
  CONSTRAINT `fk_packs_publicitaires_facture1`
    FOREIGN KEY (`facture_idfacture`)
    REFERENCES `mydb`.`facture` (`idfacture`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`choisir`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`choisir` (
  `idchoix` VARCHAR(45) NOT NULL,
  `artisans_idartisans` INT NULL DEFAULT NULL,
  `idpacks_publicitaires` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idchoix`),
  INDEX `artisans_idartisans` (`artisans_idartisans` ASC) VISIBLE,
  INDEX `idpacks_publicitaires` (`idpacks_publicitaires` ASC) VISIBLE,
  CONSTRAINT `choisir_ibfk_1`
    FOREIGN KEY (`artisans_idartisans`)
    REFERENCES `mydb`.`artisans` (`idartisans`),
  CONSTRAINT `choisir_ibfk_2`
    FOREIGN KEY (`idpacks_publicitaires`)
    REFERENCES `mydb`.`packs_publicitaires` (`idpacks_publicitaires`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`clients` (
  `idClient` INT NOT NULL AUTO_INCREMENT,
  `Nomclient` VARCHAR(100) NOT NULL,
  `Contact` INT NOT NULL,
  `Commune` VARCHAR(100) NULL DEFAULT NULL,
  `Quartier` VARCHAR(100) NULL DEFAULT NULL,
  `Mot_de_passe` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idClient`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`demandes_service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`demandes_service` (
  `iddemandes_Service` INT NOT NULL AUTO_INCREMENT,
  `Description_besoin` VARCHAR(45) NOT NULL,
  `Date_demande` DATETIME NOT NULL,
  `Statut_demande` VARCHAR(45) NULL DEFAULT NULL,
  `artisans_idartisans` INT NULL DEFAULT NULL,
  PRIMARY KEY (`iddemandes_Service`),
  INDEX `artisans_idartisans` (`artisans_idartisans` ASC) VISIBLE,
  CONSTRAINT `demandes_service_ibfk_1`
    FOREIGN KEY (`artisans_idartisans`)
    REFERENCES `mydb`.`artisans` (`idartisans`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`faire`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`faire` (
  `idfait_demande` VARCHAR(45) NOT NULL,
  `clients_idClient` INT NULL DEFAULT NULL,
  `iddemandes_Service` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idfait_demande`),
  INDEX `clients_idClient` (`clients_idClient` ASC) VISIBLE,
  INDEX `iddemandes_Service` (`iddemandes_Service` ASC) VISIBLE,
  CONSTRAINT `faire_ibfk_1`
    FOREIGN KEY (`clients_idClient`)
    REFERENCES `mydb`.`clients` (`idClient`),
  CONSTRAINT `faire_ibfk_2`
    FOREIGN KEY (`iddemandes_Service`)
    REFERENCES `mydb`.`demandes_service` (`iddemandes_Service`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`solder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`solder` (
  `artisans_idartisans` INT NOT NULL,
  `facture_idfacture` INT NOT NULL,
  `statut` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`artisans_idartisans`, `facture_idfacture`),
  INDEX `facture_idfacture` (`facture_idfacture` ASC) VISIBLE,
  CONSTRAINT `solder_ibfk_1`
    FOREIGN KEY (`artisans_idartisans`)
    REFERENCES `mydb`.`artisans` (`idartisans`),
  CONSTRAINT `solder_ibfk_2`
    FOREIGN KEY (`facture_idfacture`)
    REFERENCES `mydb`.`facture` (`idfacture`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
