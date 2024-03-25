
-- create schema  
CREATE SCHEMA `ebook-app` ;

-- create table 
CREATE TABLE `ebook-app`.`new_table` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `phno` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `landmark` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `pincode` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));

-- View table 
SELECT * FROM `ebook-app`.user;

-- add new user 
INSERT INTO `ebook-app`.`user` (`id`, `name`, `email`, `phno`, `password`) 
	VALUES ('5', 'Thinh', 'thinh123@gmail.com', '12365', '123');
