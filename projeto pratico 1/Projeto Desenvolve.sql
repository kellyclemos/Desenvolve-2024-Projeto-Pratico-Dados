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
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`tb_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `telefone` BIGINT(15) NOT NULL,
  `endereco` VARCHAR(255) NULL,
  `doc_ident` BIGINT(25) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE INDEX `id_cliente_UNIQUE` (`id_cliente` ASC) VISIBLE,
  UNIQUE INDEX `telefone_1_UNIQUE` (`telefone` ASC) VISIBLE,
  UNIQUE INDEX `doc_ident_UNIQUE` (`doc_ident` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_loja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_loja` (
  `id_loja` INT NOT NULL AUTO_INCREMENT,
  `nome_loja` VARCHAR(255) NOT NULL,
  `telefone` INT(15) NULL,
  `email` CHAR(255) NULL,
  PRIMARY KEY (`id_loja`),
  UNIQUE INDEX `id_loja_UNIQUE` (`id_loja` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_vendedor` (
  `id_vendedor` INT NOT NULL AUTO_INCREMENT,
  `nome_vendedor` VARCHAR(255) NULL,
  `cargo` VARCHAR(55) NOT NULL,
  `email` VARCHAR(255) NULL,
  `loja_id_loja` INT NOT NULL,
  PRIMARY KEY (`id_vendedor`, `loja_id_loja`),
  UNIQUE INDEX `id_funcionarios_UNIQUE` (`id_vendedor` ASC) VISIBLE,
  INDEX `fk_funcionarios_loja1_idx` (`loja_id_loja` ASC) VISIBLE,
  CONSTRAINT `fk_funcionarios_loja1`
    FOREIGN KEY (`loja_id_loja`)
    REFERENCES `mydb`.`tb_loja` (`id_loja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_pedido` (
  `id_pedido` INT NOT NULL AUTO_INCREMENT,
  `valor` FLOAT NULL,
  `data` DATE NULL,
  `tb_cliente_id_cliente` INT NOT NULL,
  `tb_vendedor_id_vendedor` INT NOT NULL,
  `tb_vendedor_loja_id_loja` INT NOT NULL,
  PRIMARY KEY (`id_pedido`, `tb_cliente_id_cliente`, `tb_vendedor_id_vendedor`, `tb_vendedor_loja_id_loja`),
  UNIQUE INDEX `id_pedido_UNIQUE` (`id_pedido` ASC) VISIBLE,
  INDEX `fk_tb_pedido_tb_cliente1_idx` (`tb_cliente_id_cliente` ASC) VISIBLE,
  INDEX `fk_tb_pedido_tb_vendedor1_idx` (`tb_vendedor_id_vendedor` ASC, `tb_vendedor_loja_id_loja` ASC) VISIBLE,
  CONSTRAINT `fk_tb_pedido_tb_cliente1`
    FOREIGN KEY (`tb_cliente_id_cliente`)
    REFERENCES `mydb`.`tb_cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_pedido_tb_vendedor1`
    FOREIGN KEY (`tb_vendedor_id_vendedor` , `tb_vendedor_loja_id_loja`)
    REFERENCES `mydb`.`tb_vendedor` (`id_vendedor` , `loja_id_loja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_programa_pontos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_programa_pontos` (
  `id_programa` INT NOT NULL AUTO_INCREMENT,
  `nome_programa` VARCHAR(255) NOT NULL,
  `taxa_conversao` FLOAT NULL,
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`id_programa`),
  UNIQUE INDEX `id_programa_UNIQUE` (`id_programa` ASC) VISIBLE,
  UNIQUE INDEX `id_cliente_UNIQUE` (`id_cliente` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_produto` (
  `id_produto` INT NOT NULL AUTO_INCREMENT,
  `nome_produto` VARCHAR(255) NULL,
  `valor` FLOAT NULL,
  PRIMARY KEY (`id_produto`),
  UNIQUE INDEX `id_produto_UNIQUE` (`id_produto` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_estoque` (
  `id_produto` INT NOT NULL AUTO_INCREMENT,
  `qtd_produtos` INT(20) NOT NULL,
  `id_loja` INT NOT NULL,
  `tb_loja_id_loja` INT NOT NULL,
  `tb_produto_id_produto` INT NOT NULL,
  PRIMARY KEY (`id_produto`, `tb_loja_id_loja`, `tb_produto_id_produto`),
  INDEX `fk_tb_estoque_tb_loja1_idx` (`tb_loja_id_loja` ASC) VISIBLE,
  INDEX `fk_tb_estoque_tb_produto1_idx` (`tb_produto_id_produto` ASC) VISIBLE,
  CONSTRAINT `fk_tb_estoque_tb_loja1`
    FOREIGN KEY (`tb_loja_id_loja`)
    REFERENCES `mydb`.`tb_loja` (`id_loja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_estoque_tb_produto1`
    FOREIGN KEY (`tb_produto_id_produto`)
    REFERENCES `mydb`.`tb_produto` (`id_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`fornecedor_has_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`fornecedor_has_produto` (
  `fornecedor_id_fornecedor` INT NOT NULL,
  `produto_id_produto` INT NOT NULL,
  `produto_categoria_id_categoria` INT NOT NULL,
  PRIMARY KEY (`fornecedor_id_fornecedor`, `produto_id_produto`, `produto_categoria_id_categoria`),
  INDEX `fk_fornecedor_has_produto_produto1_idx` (`produto_id_produto` ASC, `produto_categoria_id_categoria` ASC) VISIBLE,
  CONSTRAINT `fk_fornecedor_has_produto_produto1`
    FOREIGN KEY (`produto_id_produto`)
    REFERENCES `mydb`.`tb_produto` (`id_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_pontos_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_pontos_cliente` (
  `pontos_id` INT NOT NULL AUTO_INCREMENT,
  `pontos_gerados` FLOAT NULL,
  `data_geracao` DATE NOT NULL,
  `cliente_id_cliente` INT NOT NULL,
  `programa_pontos_id_programa` INT NOT NULL,
  PRIMARY KEY (`pontos_id`, `cliente_id_cliente`, `programa_pontos_id_programa`),
  UNIQUE INDEX `pontos_id_UNIQUE` (`pontos_id` ASC) VISIBLE,
  INDEX `fk_pontos_cliente_cliente1_idx` (`cliente_id_cliente` ASC) VISIBLE,
  INDEX `fk_pontos_cliente_programa_pontos1_idx` (`programa_pontos_id_programa` ASC) VISIBLE,
  CONSTRAINT `fk_pontos_cliente_cliente1`
    FOREIGN KEY (`cliente_id_cliente`)
    REFERENCES `mydb`.`tb_cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pontos_cliente_programa_pontos1`
    FOREIGN KEY (`programa_pontos_id_programa`)
    REFERENCES `mydb`.`tb_programa_pontos` (`id_programa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_endereco` (
  `rua` VARCHAR(255) NOT NULL,
  `numero` INT(12) NULL,
  `bairro` VARCHAR(255) NOT NULL,
  `cidade` VARCHAR(255) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `cliente_id_cliente` INT NOT NULL,
  PRIMARY KEY (`cliente_id_cliente`),
  INDEX `fk_endereco_cliente1_idx` (`cliente_id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_endereco_cliente1`
    FOREIGN KEY (`cliente_id_cliente`)
    REFERENCES `mydb`.`tb_cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_pedido_has_tb_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_pedido_has_tb_produto` (
  `tb_pedido_id_pedido` INT NOT NULL,
  `tb_pedido_tb_cliente_id_cliente` INT NOT NULL,
  `tb_produto_id_produto` INT NOT NULL,
  PRIMARY KEY (`tb_pedido_id_pedido`, `tb_pedido_tb_cliente_id_cliente`, `tb_produto_id_produto`),
  INDEX `fk_tb_pedido_has_tb_produto_tb_produto1_idx` (`tb_produto_id_produto` ASC) VISIBLE,
  INDEX `fk_tb_pedido_has_tb_produto_tb_pedido1_idx` (`tb_pedido_id_pedido` ASC, `tb_pedido_tb_cliente_id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_tb_pedido_has_tb_produto_tb_pedido1`
    FOREIGN KEY (`tb_pedido_id_pedido` , `tb_pedido_tb_cliente_id_cliente`)
    REFERENCES `mydb`.`tb_pedido` (`id_pedido` , `tb_cliente_id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_pedido_has_tb_produto_tb_produto1`
    FOREIGN KEY (`tb_produto_id_produto`)
    REFERENCES `mydb`.`tb_produto` (`id_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
