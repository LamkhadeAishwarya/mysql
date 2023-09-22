use Simple
create table employee2
(
empid int primary key,
first_name varchar(50),
last_name varchar(50),
department varchar(50),
project int,
adress varchar(100),
dob date ,
gender varchar(20)
)
drop table employee2

create table position
(
empid int,
empposition varchar(50),
date_of_join date,
salary decimal(12,2),
constraint fk_emp2 foreign key(empid) references employee2(empid)
)
drop table position
alter table employee2 alter column project varchar(10)

select * from Employee2
select * from Position

insert into Employee2 values(1,'Rohit','Gupta','Admin','P1','Delhi','1979/12/2','Male')
insert into Employee2 values(2,'Rahul','Mahajan','Admin','P2','Mumbai','1986/10/10','Male')
insert into Employee2 values(3,'Sonia','Banerjee','HR','P3','Pune','1983/6/5','Female')
insert into Employee2 values(4,'Anikta','Kapoor','HR','P4','Chennai','1983/11/28','Female')
insert into Employee2 values(5,'Swati','Garg','HR','P5','Delhi','1991/4/6','Female')

insert into position values(1,'Executive','2020/4/1',75000)
insert into position values(2,'Manager','2020/4/3',50000)
insert into position values(3,'Manager','2020/4/2',150000)
insert into position values(2,'Officer','2020/4/2',90000)
insert into position values(1,'Manager','2020/4/3',300000)


--1. Create a query to generate the first records from the EmployeeInfo table.
select top 1 * from employee2 order by empid

--2. Create a query to generate the last records from the EmployeeInfo table.
select top 1 * from employee2 order by empid desc

--3. Create a query to fetch the third-highest salary from the EmpPosition table.
select e1.*,p1.salary from employee2 e1 
inner join position p1 on p1.empid=e1.empid 
order by p1.salary desc 
offset 2 rows 
fetch next 1 rows only

--4. Write a query to find duplicate records from a table.
select empid , count(empid) as 'count ' from position 
group by empid 
having count(empid)>1

--5. Create an SQL query to fetch EmpPostion and the total salary paid for each employee position.
select empposition , sum(salary) as 'total salary' 
from position 
group by empposition


--6. find the employee who has max salary
select top 1 e1.*,p1.salary from employee2 e1 
inner join position p1 on p1.empid=e1.empid
order by p1.salary desc

--7 find the employee who has max salary from admin department
select top 1 e1.*,p1.salary from employee2 e1 
inner join position p1 on p1.empid=e1.empid
where e1.department='Admin'
order by p1.salary desc

--8 find the age of each employee
  select *, year(cast(GETDATE() as date))-year(cast(dob as date)) as 'Age' from Employee2

--9 display only female employee details
select * from employee2 where gender='female'


--10 display employee whos position is executive
select * from employee2 e join position p on e.empid=p.empid
where p.empposition='executive'
--or
select  e1.*, p1.salary,p1.empposition from Employee2 e1
	   inner join Position p1 on p1.empId=e1.empId
	   where p1.empposition='Executive'

--11 display count of employee in each city
select adress , count(empid) as 'total count' from employee2 group by adress
--or
 select adress,count(empid)as 'count' from Employee2
 group by adress
