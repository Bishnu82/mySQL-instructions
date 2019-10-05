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
    
select * from user;
select * from product;
select * from vendor;
select * from mysql.user;