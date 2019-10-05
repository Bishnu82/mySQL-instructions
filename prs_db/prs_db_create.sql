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