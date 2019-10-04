-- Select all student
select * from student;

-- Select all course
select * from course;

-- students w/out middle names?
select * from student
	where middleInitial is null;
    
-- List all states, # students
select state, count(*)
	from student
    group by state;
    
-- sudents in ohio
select count(*) 
	from student
		where state = 'oh';

-- oldest student?
-- select min(birthday)
-- 	from student;
select concat(firstName, " ", middleInitial, " ", lastName) as 'Oldest Student:', birthday as 'Birthday:'
 from student
where birthday = (select min(birthday) from student);

-- youngest student
-- select max(birthday)
-- 	from student;
select concat(firstName, " ", middleInitial, " ", lastName) as 'Youngest Student:', birthday as 'Birthday:'
 from student
where birthday = (select max(birthday) from student);

-- how many social studies courses?
select count(*) from course
	where subject = 'socialStudies';
    
-- list all subjest starting with the letter m
select * from course
	where subject like 'm%';
		
    
-- How many math courses?
select count(*) from course
	where subject = 'math';

-- inner join all 3
select * from enrolled e
    join student s
		on e.studentID = s.ID
	join course c
		on e.courseID = c.ID;
        
-- age of oldest student figure out dates
select firstname, lastname, birthday,
	year(curdate()) -year(birthday) as Age
		from student
        where birthday = (select min(birthday) from student)
		order by age;
        
-- all students plus enrollments
select s.id, firstName, lastName, e.studentID, e.courseID, e.grade, c.name
	from student s
	left join enrolled e
		on e.studentID = s.id
	left join course c
		on e.courseID = c.id;