select * from movie;
select * from actor;
select * from credit;
select * from actor
	where birthDate < '1982-05-03';
-- list all actors for a certain movie
select * from actor a 
	join credit c
    on c.actorid = a.ID
    where c.movieID = 1;

-- list all actors 2
select * from actor a
join credit c
on c.actorID = a.ID
where c.movieID = (select id from movie where title = 'Spaceballs');

select * from movie
	where title = 'Spaceballs';
-- 3 table join
select m.title as 'Movie', concat(a.firstname, a.lastName) as 'Actor', c.role
  from credit c
	join movie m
		on m.id = movieID
	join actor a
		on a.id = actorID;
        
select * from movie m
    join credit c
		on c.movieID = m.ID
	join actor a
		on c.actorID = a.ID;
    
-- another way to join
select * from actor, credit
	where actor.id = credit.actorID;
    
-- example of a unique constraint violation
-- select * from movie
	-- insert into movie (title, year, rating, director),
		-- values ('Blazzing Saddles', 1987, 'r', 'Mel Brooks');

-- create a user and grant privileges to that user
drop user if exists bmdb_user@localhost;
	create user bmdb_user@localhost identified by 'sesame';
		grant select, insert, delete, update on bmdb.* to bmdb_user@localhost;

-- CREATE USER bmdb_user@localhost IDENTIFIED BY 'sesame';
-- GRANT SELECT, INSERT, DELETE, UPDATE ON bmdb.* TO bmdb_user@localhost;

-- 4) Do some queries... get creative.  But here are some ideas:
-- How many movies star Robert Downey Jr. (or whatever actor you choose)
select count(*) from credit
	where actorID = 1;
-- List all PG movies
select * from movie
	where rating = 'PG';
-- How many movies by rating? (edited) 
select count(*) from movie
	where rating = 'R';
-- 5) Add a couple movies that don't have actors
-- 6) Add a couple actors that aren't in any movies
-- 
-- 7) Do a Left join to show all movies + actors (actors info should be null if there are no actors for the movie)
-- select s.id, firstName, lastName, e.studentID, e.courseID, e.grade, c.name
	-- from student s
	-- left join enrolled e
		-- on e.studentID = s.id
	-- left join course c
		-- on e.courseID = c.id;
select m.title, a.firstName, a.lastName
	from movie m
		left join credit c
			on c.movieID = m.ID
		left join actor a
			on c.actorID = a.ID
				where a.firstName is not null
		order by title;
			