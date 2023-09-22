use Simple

create table Trainer
(
trainer_id int primary key,
trainer_name varchar(100),
join_date date,
email varchar(100),
experience_years int
)

create table course1
(
course_id int primary key,
course_name varchar(100),
duration varchar(50),
trainer_id int,
total_fees decimal,
foreign key(trainer_id) references trainer(trainer_id)
)

create table students4
(
rollno int primary key,
sname varchar(100),
degree varchar(100),
birthdate date,
course_id int,
fees_paid decimal,
remark varchar(100),
is_placed varchar(10),
foreign key(course_id) references course1(course_id)
)
drop table students4
insert into trainer values(1,'aniket kalvit','2015/11/5','aniket@gmail.com',8),
(2,'Kalyani ambekar','2018/8/3','kalyani@gmail.com',5)

insert into course1 values(1,'.Net','6 months',1,177000),
(2,'Java','4 months', 2 , 118000),
(3,'Python','8 months', 1, 90000),
(4,'c++','1 month',2,15000)

--update course set total_fees=117000 where course_id=1

select * from course1

insert into students4(rollno,sname,degree,birthdate,course_id,fees_paid,is_placed) values(1,'siya','Bsc','2000/10/4',2,50000,'Yes'),
(2,'alia','Bcs','1999/1/28',1,90000,'no'),
(3,'priti','Bca','2001/8/21',3,15000,'no'),
(4,'shweta','engeneering','1997/2/21',3,90000,'Yes'),
(5,'tushar','Bsc','2002/8/18',4,10000,'no'),
(6,'tina','mechanical eng','1998/12/12',1,100000,'Yes'),
(7,'Satyam','mca','2000/5/17',2,80000,'Yes'),
(8,'Snehal','electrical eng','1995/2/26',3,30000,'Yes'),
(9,'shital','bca','2001/7/19',4,15000,'Yes'),
(10,'tripti','Bcom','1998/9/29',2,118000,'Yes')

select * from students4

-- 1. show list of student. list contains roll no,stud name,course name,trainer name in order of course name and student name.
select s.rollno,s.sname,c.course_name,t.trainer_name from students4 s
join course1 c on s.course_id=c.course_id 
join trainer t on t.trainer_id=c.trainer_id
order by c.course_name , s.sname


-- 2. show list of students who have pending fees more than 50000 rs. 
--list contain stud name,course name,balance fees.
--show in descending order of balance fees.
select s.sname,c.course_name,(c.total_fees-s.fees_paid) as balance_fees from students4 s 
 join course1 c on s.course_id=c.course_id 
where (c.total_fees-s.fees_paid) > 50000 
order by balance_fees desc



--4. update table student. update 'remark' field. remark should be 'eligible for exam' if fees paid by student ids more than 60%



--5. create a index to make retrival faster based on course name.
create index a_index on course1(course_name)

--6. list name of course for which more than 2 students are enrolled.
select c.course_name from course1 c join students4 s on s.course_id=c.course_id
group by c.course_name
having count(*) > 2

--7. list name of courses for which maximum revenue was generated (max fee collection).
select course_name from course1 
where total_fees = (select max(total_fees) from course1)

--8. select name of students who are in same course.
select students4.* from students4
join course1 on students4.course_id= course1.course_id
where course1.course_id = 3


--9. delete all students who are in course which is less than 2 months duration.
delete from students4
where course_id in (select course_id from course1 where duration < 2 

--10. delete all students for whom is placed is 'yes' and who have paid all the fees of his course.
delete from students4 where is_placed  = 'yes' and
course_id in (select course_id from course1
where fees_paid=course.total_fees)


--12. create a view which shows name of trainer and number of students he is training.
select t.trainer_name , count(rollno) as 'total count' from trainer t join course1 c on t.trainer_id=c.trainer_id
join students4 s on s.course_id=c.course_id 
group by t.trainer_name

--13. show names of students who are more than 20 years old.
select sname , year(cast(GetDate() as date))-year(cast(birthdate as date)) as 'age' from students4
where  year(cast(GetDate() as date))-year(cast(birthdate as date)) > 22


--14. show names of students who have paid all the fees.
select s.sname from students4 s join course1 c on c.course_id=s.course_id 
where c.total_fees=s.fees_paid
