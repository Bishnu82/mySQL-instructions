drop database if exists stuffy_db;
create database stuffy_db;
use stuffy_db;

create table stuffy (
		id 				int 			not null primary key auto_increment,
        type            varchar(255)    not null,
        color           varchar(20)     not null,
        size            varchar(2)      not null,
        limbs           int             not null
        );
        
Insert into stuffy values
	(1, 'sea horse', 'red', 'l', 3),
    (2, 'turtle', 'orange', 's', 5),
    (3, 'whale', 'green', 'xl', 3),
    (4, 'crab', 'blue', 'm', 8),
    (5, 'scorpion', 'indigo', 'm', 9),
    (6, 'harpy', 'violet', 's', 4),
    (7, 'troll', 'cyan', 'xl', 6),
    (8, 'unicorn', 'magenta', 'l', 5),
    (9, 'griffon', 'purple', 'm', 6),
    (10, 'ox', 'brown', 's', 7);
    
-- create a user and grant privileges to that user
drop user if exists stuffy_user@localhost;
create user stuffy_user@localhost identified by 'seasame';
grant select, insert, delete, update on bmdb.* to stuffy_user@localhost;
