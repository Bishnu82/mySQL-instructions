drop database if exists prs_db;
create database prs_db;
use prs_db;

create table user (
	id            int        		primary key auto_increment not null,
    userName      varchar(20)		not null,
    password      varchar(10)		not null,
    firstName     varchar(20)		not null,
    lastName      varchar(20)		not null,
    phoneNumber	  varchar(12)		not null,
    email	      varchar(75)		not null,
	isReviewer	  tinyint(1)		not null,
    isAdmin	      tinyint(1)		not null,
		constraint uname unique (username)
    );

create table vendor (
	id			int				primary key auto_increment not null,
	code		varchar(10)		not null,
	name		varchar(255)	not null,
	address		varchar(255)	not null,
	city		varchar(255)	not null,
	state		varchar(2)		not null,
	zip			varchar(5)		not null,
	phoneNumber	varchar(12)		not null,
	email		varchar(100)	not null,
		constraint vcode unique (code)
    );
    
create table request (
	id					int				primary key auto_increment not null,
	userID				int				not null,
	description			varchar(100)	not null,
	justification		varchar(255)	not null,
	dateNeeded			date			not null,
	deliveryMode		varchar(25)		not null,
	status				varchar(20)		not null,
	total				decimal(10,2)	not null,
	submittedDate		datetime		not null,
	reasonForRejection	varchar(100),
		
        foreign key (userID) references user(id)
    );
    
create table product (
	id			int				primary key auto_increment not null,
	vendorID	int				not null,
	partNumber	varchar(50)		not null,
	name		varchar(150)	not null,
	price		decimal(10,2)	not null,
	unit		varchar(255),
	photoPath	varchar(255),
		
        foreign key (vendorID) references vendor(id),
			constraint vendor_part unique (vendorID, partNumber)
    );
    
create table lineItem (
	id			int		primary key auto_increment not null,
	requestID	int		not null,
	productID	int		not null,
	quantity	int		not null,
		
        foreign key (productID) references product(id),
        foreign key (requestID) references request(id),
			constraint req_pdt unique (requestID, productID)
    );
    
-- insert user into db (ID, userName, password, firstName, lastName, phoneNumber, email, isReviewer, isAdmin)
insert into user (userName, password, firstName, lastName, phoneNumber, email, isReviewer, isAdmin) value
	('JSmith', 'easy1234', 'John', 'Smith', '555-555-5555', 'jsmith@aol.com', 0, 0),
    ('ASmith', 'easy1234', 'Arron', 'Smith', '555-555-5555', 'asmith@aol.com', 0, 0);
    
    
-- insert vendor into db (code, name, address, city, state, zip, phoneNumber, email)
insert into vendor (code, name, address, city, state, zip, phoneNumber, email) value
	('12rty7', 'Citi', '1234 Long Rd', 'Cincinnati', 'OH', '45321', '555-555-5555', 'Citi@aol.com');
    
    
-- insert product into db (vendorID, partNumber, name, price, unit, photoPath)
insert into product (vendorID, partNumber, name, price, unit, photoPath) value
	(1, 'a192o', 'potato', 3.25, 'idaho', 'C:\repos\mySQL-instruction\prs_db\photo)'),
    (1, 'a1958', 'tv', 250.00, 'LG', 'C:\repos\mySQL-instruction\prs_db\photo)');
    
-- create a user and grant privileges to that user
create user prs_user@localhost identified by 'sesame';
grant select, insert, update, delete on prs_db.* to prs_user@localhost;