use Simple
create table employee10
(
id int primary key,
name varchar(20) not null,
email varchar(40) unique,
age int check(age>=18),
salary numeric(12,2)
)

select * from employee10
insert into employee10 values(1,'suraj','suraj@gmail.com',22,25000.45)
insert into employee10 values(2,'sayli','sayli@gmail.com',25,23000.95)
insert into employee10 values(3,'sakshi','sakshi@gmail.com',25,20000.78)
insert into employee10 values(4,'Raj','raj@gmail.com',24,26000.45)
insert into employee10 values(5,'aahana','ahana@gmail.com',29,35000.67)
insert into employee10 values(6,'Piya','priya23@gmail.com',21,15000.49)
insert into employee10 values(7,'nikita','nikita@gmail.com',22,22000.16)
insert into employee10 values(8,'manisha','manisha@gmail.com',26,32000.45)
insert into employee10 values(9,'shilpa','shilpa@gmail.com',35,40000.65)
insert into employee10 values(10,'vaishu','vaishu@gmail.com',28,45000.84)
insert into employee10 values(11,'rohini','rohini@gmail.com',19,17000.63)
insert into employee10 values(12,'pooja','pooja@gmail.com',20,21000.61)
insert into employee10 values(13,'trisha','trisha@gmail.com',28,35000.75)
insert into employee10 values(14,'krishna','krishna@gmail.com',23,28000.95)
insert into employee10 values(15,'rutu','rutu@gmail.com',31,50000.37)