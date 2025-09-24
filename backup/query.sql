CREATE TABLE `user` (
  `id` INT(9) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `age` INT(3) NOT NULL, /* Idade */
  `gender` ENUM('X', 'Y', 'Z'), /* Identidade gênero */
  `profile_picture_url` VARCHAR(200), /* URL foto de perfil */
  `birth_date` DATE, /* Data de nascimento */

  PRIMARY KEY (`id`)
);

CREATE TABLE `login_credentials` (
  `id` INT(9) NOT NULL,
  `username` VARCHAR(50) NOT NULL,
  `password_hash` VARCHAR(255) NOT NULL,
  `security_question_1` VARCHAR(255),
  `security_answer_1` VARCHAR(255),
  `security_question_2` VARCHAR(255),
  `security_answer_2` VARCHAR(255),

  PRIMARY KEY (`id`),
  FOREIGN KEY (`id`) REFERENCES `user`(`id`) ON DELETE CASCADE
);

CREATE TABLE `account` (
  `id` INT(9) NOT NULL,
  `volunteer_status` ENUM('X', 'Y', 'Z'), 
  `donation_count` INT(5) DEFAULT 0, 
  `total_donated` DECIMAL(10,2) DEFAULT 0.00, 
  `ocupation` VARCHAR(100), /* Ocupação */

  PRIMARY KEY (`id`),
  FOREIGN KEY (`id`) REFERENCES `user`(`id`) ON DELETE CASCADE
);

CREATE TABLE `document` (
  `id` INT(9) NOT NULL,
  `cpf` VARCHAR(14),
  `rg` VARCHAR(20),

  PRIMARY KEY (`id`),
  FOREIGN KEY (`id`) REFERENCES `user`(`id`) ON DELETE CASCADE
);

CREATE TABLE `address` (
  `id` INT(9) NOT NULL,
  `street` VARCHAR(100),
  `city` VARCHAR(50),
  `state` VARCHAR(50),
  `cep` VARCHAR(10),
  `country` VARCHAR(50),

  PRIMARY KEY (`id`),
  FOREIGN KEY (`id`) REFERENCES `user`(`id`) ON DELETE CASCADE
);

CREATE TABLE `contact` (
  `id` INT(9) NOT NULL,
  `email1` VARCHAR(100),
  `email2` VARCHAR(100),
  `phone1` VARCHAR(20),
  `phone2` VARCHAR(20),

  PRIMARY KEY (`id`),
  FOREIGN KEY (`id`) REFERENCES `user`(`id`) ON DELETE CASCADE
);

CREATE TABLE `donation` (
  `id` INT(9) NOT NULL AUTO_INCREMENT,
  `user_id` INT(9) NOT NULL,
  `amount` DECIMAL(10,2),
  `donated_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id`) REFERENCES `user`(`id`)
);
