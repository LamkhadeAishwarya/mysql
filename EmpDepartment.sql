use Simple
reate table department1
(
did int primary key,
dname varchar(50),
location varchar(100)
)

create table employee1
(
eid int primary key,
ename varchar(50),
did int,
salary decimal(12,2)
foreign key (did) references department1(did)
)

insert into department1 values(1,'HR','Pune'),
(2,'Admin','Mumbai'),
(3,'Sales','Delhi'),
(4,'Development','Pune')

insert into employee1(eid,ename,did,salary) values(1,'Suresh',1,25000),
(2,'Divya',2,28500),
(3,'Aditya',3,35000),
(4,'Neha',2,22000),
(5,'Sakshi',1,27000),
(6,'Pooja',3,33000)

select * from department1
select * from employee1

--sub query
 select did from employee1 where ename='aditya'
select dname from department1 where did=3

           

-- Using join 
select e.ename ,d.dname from employee1 e join department1 d
on e.did = d.did  where ename='sakshi'

--find employee name working in HR department.
select e.ename from employee1 e join department1 d
on e.did=d.did where dname='HR'

--find salary of employee who's id is 3 
select e.ename , d.dname , e.salary from employee1 e join department1 d
on e.did=d.did where eid=3
--or
select salary ,ename from employee1 where eid=3

--find the employee name whos salary is more than 25000
select e.ename,e.salary from employee1 e
where salary>25000

--find salary of employee whose location is pune
select e.ename,e.salary from employee1 e join department1 d
 on e.did=d.did where d.location='pune'

 --find salary of emp who is working in admin department
 select e.ename ,d.dname,e.salary from employee1 e join department1 d
 on e.did=d.did where d.dname='admin'

 --find number of employee of each department
 select dname, count(eid) as 'total count' from employee1 e
  inner join department1 d on e.did=d.did group by dname

  --find emp name who is working in HR department
  select e.ename , d.dname from employee1 e join department1 d
  on e.did=d.did where d.dname='HR'

--find emp name who is not working in HR department
select e.ename from employee1 e , department1 d 
where e.did=d.did and dname<>'HR'

--find the employee who has not working in any department
select e.ename from employee1 e left join
department1 d on e.did=d.did
where dname is null

