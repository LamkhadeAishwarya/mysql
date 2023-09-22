use Simple
create table stude
(
roll int,
sname varchar(20),
degree varchar(25),
birthdate date,
course_id int,
batch_id int,
fees_paid int,
remark varchar(32),
isplaced varchar,

constraint fy_kry foreign key(course_id) references course(course_id)
)
alter table stude alter column isplaced varchar(35)
insert into stude values (1,'tanuja','computer science','2001/10/01',101,201,10000,'A','yes')
insert into stude values(2,'alisha','mechanical','2002/09/02',102,202,5000,'b','no')
insert into stude values(3,'payal','electronic','2003/07/03',103,203,1800,'c','yes')
insert into stude values(4,'pradnya','electric','2004/11/04',104,204,9000,'d','no')
select*from stude
select*from course
select*from Trainer
drop table stude




create table course
(
course_id int primary key,
coursename varchar(23),
duration date,
trainerid int,
totalfees int
)
insert into course values(101,'bcs','2001/08/05',501,25000)

insert into course values(102,'bba','2005/09/04',502,23000)

insert into course values(103,'bcom','2001/03/02',503,29000)

insert into course values(104,'junior','2006/02/01',504,23000)


drop table course

create table Trainer
(
trainerid int primary key,
trainername varchar(34),
joindate date,
email varchar(34),
experienceyear date
)
insert into Trainer values(501,'shital','2001/08/05','shital@gmail.com','2002/06/07')
insert into Trainer values(502,'amol','2004/04/06','amol@gmail.com','2003/06/07')
insert into Trainer values(503,'kirti','2005/02/02','kirtil@gmail.com','2004/02/03')
insert into Trainer values(504,'usha','2006/04/01','ushal@gmail.com','1999/03/02')
drop table Trainer

--1. Show list of students. List contains roll no , student name , course name , trainer name in 
--order of course name and student name
 select stude.roll,stude.sname,course.coursename,Trainer.trainername
 from stude 
 inner join course 
 on stude.course_id=course.course_id
 inner join Trainer 
 on Trainer.trainerid=course.trainerid
 order by coursename,sname
 
 -- Show list of students who have pending fees more than 1000rs . List should have student 
--name , course name , balance fees . Show this list in descending order of balance fees. 

select stude.sname,stude.fees_paid,(course.totalfees-stude.fees_paid)as'pending fees',course.coursename
from stude
inner join course
on stude.course_id=course.course_id
where( course.totalfees-stude.fees_paid) >=1000 order by fees_paid desc





