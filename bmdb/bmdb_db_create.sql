drop database if exists bmdb;
create database bmdb;
use bmdb;

create table movie (
	id 				int 			not null primary key auto_increment,
	title 			varchar(100) 	not null,
	rating 			varchar(5) 	    not null,
	year 			int 	        not null,
	director        varchar(50)     not null
);

Insert into movie (title, rating, year, director)
	values ('Spaceballs', 'PG', 1987, 'Mel Brooks');
Insert into movie (title, rating, year, director)
	values ('Blazzing Saddles', 'R', 1974, 'Mel Brooks');
Insert into movie (title, rating, year, director)
	values ('Scrooged', 'PG-13', 1988, 'Richard Donner');
Insert into movie (title, rating, year, director)
	values ('White Christmas', 'NR', 1954, 'Michael Curtiz');
Insert into movie (title, rating, year, director)
	values ('Blockers', 'R', 2018, 'Kay Cannon');
Insert into movie (title, rating, year, director)
	values ('Zombieland', 'R', 2009, 'Ruben Fleischer');
Insert into movie (title, rating, year, director)
	values ('Young Frankenstien', 'PG', 1974, 'Mel Brooks');
Insert into movie (title, rating, year, director)
	values ('The Big Lebowski', 'R', 1998, ' Joel Coen, Ethan Coen');
Insert into movie (title, rating, year, director)
	values ('Dazed and Confused', 'R', 1993, 'Richard Linklater');
Insert into movie (title, rating, year, director)
	values ('The Inbetweeners', 'R', 2011, 'Ben Palmer');
Insert into movie (title, rating, year, director)
	values ('Spider-Man: Into the Spider-Verse', 'PG', 2018, 'Bob Persichetti, Peter Ramsey, Rodney Rothman');
Insert into movie (title, rating, year, director)
	values ("Harry Potter and the Sorcerer's Stone", 'PG', 2001, 'Chris Columbus');
Insert into movie (title, rating, year, director)
	values ('Afro Samurai: Resurrection', 'TV-MA', 2009, 'Fuminori Kizaki');

create table actor (
	id 				int 			not null primary key auto_increment,
	firstName 		varchar(25) 	not null,
	lastName		varchar(25) 	not null,
	gender 			varchar(6) 	    not null,
    birthDate       date			not null,
	-- constraint help stop duplicate data by setting rules
        constraint unq_actor unique (firstName, lastName, birthDate)
);

-- Date format YYYY-MM-DD

Insert into actor (firstName, lastName, gender, birthDate)
	values ('Mel', 'Brooks', 'M', '1926-06-28');
Insert into actor (firstName, lastName, gender, birthDate)
	values ('Gene', 'Wilder', 'M', '1933-06-11');
Insert into actor (firstName, lastName, gender, birthDate)
	values ('Bill', 'Murray', 'M', '1950-09-21');
Insert into actor (firstName, lastName, gender, birthDate)
	values ('Bing', 'Crosby', 'M', '1903-05-02');
Insert into actor (firstName, lastName, gender, birthDate)
	values ('Leslie', 'Mann', 'F', '1972-03-26');
Insert into actor (firstName, lastName, gender, birthDate)
	values ('Emma', 'Stone', 'F', '1988-11-06');
Insert into actor (firstName, lastName, gender, birthDate)
	values ('Peter', 'Boyle', 'M', '1935-10-18');
Insert into actor (firstName, lastName, gender, birthDate)
	values ('Jeff', 'Bridges', 'M', '1949-12-04');
Insert into actor (firstName, lastName, gender, birthDate)
	values ('Milla', 'Jovovich', 'F', '1975-12-17');
Insert into actor (firstName, lastName, gender, birthDate)
	values ('Simon', 'Bird', 'M', '1984-08-19');
Insert into actor (firstName, lastName, gender, birthDate)
	values ('Edward', 'Norton', 'M', '1969-08-18');
Insert into actor (firstName, lastName, gender, birthDate)
	values ('Brad', 'Pitt', 'M', '1963-12-18');
Insert into actor (firstName, lastName, gender, birthDate)
	values ('Meat', 'Loaf', 'M', '1947-09-27');

create table Credit (
	id 				int 			not null primary key auto_increment,
	movieID 		int 			not null,
	actorID		    int 			not null,
	role 			varchar(70) 	not null,
	    foreign key (movieID) references movie(id),
        foreign key (actorID) references actor(id),
        constraint act_mov unique (actorID, movieID)
);

Insert into Credit (movieID, actorID, role)
	values (1, 1, 'President Skroob / Yogurt');
Insert into Credit (movieID, actorID, role)
	values (2, 2, 'Jim');
Insert into Credit (movieID, actorID, role)
	values (3, 3, 'Frank Cross');
Insert into Credit (movieID, actorID, role)
	values (2, 1, 'Governor Lepetomane / Indian Chief');
Insert into Credit (movieID, actorID, role)
	values (4, 4, 'Bob Wallace');
Insert into Credit (movieID, actorID, role)
	values (5, 5, 'Lisa');
Insert into Credit (movieID, actorID, role)
	values (6, 6, 'Wichita');
Insert into Credit (movieID, actorID, role)
	values (7, 7, 'The Monster');
Insert into Credit (movieID, actorID, role)
	values (8, 8, 'The Dude');
Insert into Credit (movieID, actorID, role)
	values (9, 9, 'Michelle');
Insert into Credit (movieID, actorID, role)
	values (10, 10, 'Will MacKenzie');
Insert into Credit (movieID, actorID, role)
	values (7, 1, 'Werewolf / Cat Hit by Dart / Victor Frankenstein (voice) (uncredited)');