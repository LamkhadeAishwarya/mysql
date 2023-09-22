use Simple
create table users
(
usid int,
uname varchar(25),
)
insert into users values(1,'aishwarya'),(2,'ashwini'),(3,'swara'),(4,'shrisha')
alter table users add dno int
alter table users add constraint fk_dno foreign key (dno) references department(dno)
update users set dno=11 where usid=1
update users set dno=12 where usid=2



drop table users

create table department
(
did int,
dno int primary key,
dname varchar (10)
)
insert into department values (1,11,'junior'),(2,12,'senior'),(3,13,'testing')
select *from users
select *from  department
drop table department

select users.uname,users.usid,users.dno,department.dname
from users

left join department
On users.dno=department.dno