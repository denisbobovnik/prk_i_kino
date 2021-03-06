/* to je za ustvarjanje in runnanje baze */
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE `comments` CASCADE;
DROP TABLE `glasovanje` CASCADE;
DROP TABLE `movies` CASCADE;
DROP TABLE `shows` CASCADE;
DROP TABLE `tickets` CASCADE;
DROP TABLE `users` CASCADE;
SET FOREIGN_KEY_CHECKS=1;

CREATE TABLE `comments` (
	`comments_id` INT auto_increment,
	`content` VARCHAR(100) NOT NULL,
	`movies_movie_id` INT NOT NULL,
	`users_user_id` INT NOT NULL,
	PRIMARY KEY (`comments_id`));

ALTER TABLE `comments`
	ADD CONSTRAINT fk_comments_movies foreign key
    (movies_movie_id) references movies(movies_id);

ALTER TABLE `comments`
	ADD CONSTRAINT fk_comments_users foreign key
    (users_user_id) references users(users_id);
    
CREATE TABLE `glasovanje` (
	`glasovanje_ID` INT auto_increment,
	`TK_ID_film` int,
	`Film` varchar(199),
	`petek_2` int,
	`petek_3` int,
	`petek_9` int,
	`sob_2` int,
	`sob_3` int,
	`sob_9` int,
	`petek_2_vosta` int,
	`petek_3_vosta` int,
	`petek_9_vosta` int,
	`sob_2_vosta` int,
	`sob_3_vosta` int,
	`sob_9_vosta` int,
PRIMARY KEY (`glasovanje_ID`));

ALTER TABLE `glasovanje`
	CONSTRAINT fk_glasovanje_film foreign key
	(TK_ID_film) references movies(movies_id);

CREATE TABLE `movies` (
	`movies_id` INT auto_increment,
	`movie_id` VARCHAR(18) NOT NULL,
	`title` VARCHAR(100) NOT NULL,
	`original_title` VARCHAR(100) NOT NULL,
	`punchline` VARCHAR(250) NOT NULL,
	`trailer` VARCHAR(80) NOT NULL,
	`genre` VARCHAR(60) NOT NULL,
	`year` INT NOT NULL,
	`duration` INT NOT NULL,
	`url` VARCHAR(150) NOT NULL,
	`poster` VARCHAR(150) NOT NULL,
	`director` VARCHAR(45) NOT NULL,
	`producer` VARCHAR(45) NOT NULL,
	`writer` VARCHAR(100) NOT NULL,
	`cast` VARCHAR(500) NOT NULL,
	`distributor` VARCHAR(45) NOT NULL,
	`language` VARCHAR(45) NOT NULL,
	`country` VARCHAR(100) NOT NULL,
	`localization` VARCHAR(45) NOT NULL,
	`plot_outline` VARCHAR(2000) NOT NULL,
	`sum_of_scores` DOUBLE NOT NULL,
	`num_of_scores` DOUBLE NOT NULL,
	`na_voljo` boolean NOT NULL,
	PRIMARY KEY (`movies_id`));

/*to maš, ker pri branju iz kolosej.xml vnaša null, kar pa tabela ne dovoljuje (for some reason)*/
ALTER TABLE `movies` ALTER `sum_of_scores` SET DEFAULT 0.0;
ALTER TABLE `movies` ALTER `num_of_scores` SET DEFAULT 0.0;

CREATE TABLE `shows` (
	`shows_id` INT auto_increment,
	`show_id` VARCHAR(18) NOT NULL,
	`date_time` datetime NOT NULL,
	`city` VARCHAR(45) NOT NULL,
	`center` VARCHAR(45) NOT NULL,
	`theater` VARCHAR(45) NOT NULL,
	`movies_movie_id` int NOT NULL,
	PRIMARY KEY (`shows_id`));
  
ALTER TABLE `shows`
ADD CONSTRAINT fk_shows_movies FOREIGN KEY
(`movies_movie_id`) REFERENCES movies(`movies_id`);

CREATE TABLE `tickets` (
	`idtickets` INT NOT NULL,
	`cena` DOUBLE NOT NULL,
	`kraj` VARCHAR(45) NOT NULL,
	`vrsta` VARCHAR(45) NOT NULL,
	PRIMARY KEY (`idtickets`));
    
CREATE TABLE `users` (
	`users_id` INT auto_increment,
	`first_name` varchar(45) NOT NULL,
	`last_name` varchar(45) NOT NULL,
	`email` varchar(45) NOT NULL,
	`pass` varchar(45) NOT NULL,
	PRIMARY KEY (`users_id`)) ENGINE=InnoDB CHARACTER SET=utf8;
  
ALTER TABLE `users` CONVERT TO CHARACTER SET utf8;