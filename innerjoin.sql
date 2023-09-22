use Simple
create table users
(
 userid int primary key,
 uname varchar(35),
 email varchar(35)
)
insert into users values(1,'pooja','pooja234@gmail.com'),
(2,'sakshi','sakshi@gmail.com'),
(3,'Aishwarya','aishwarya@gmail.com')

drop table users

create table orders
(
--oid int primary key,
userid int,
quantity int,
email varchar(35)
)
select * from users
select *from orders
drop table orders
alter table orders add constraint fk_or foreign key(userid)references users(userid)
insert into orders values(1,200,'aishu@gmail.com'),
(2,300,'ash@gmail.com'),
(1,500,'shubham@gmail.com'),
(2,600,'ashwini@gmail.com'),
(1,700,'swara@gmail.com')
select *from orders

select orders.userid,users.uname,users.email,orders.quantity
from orders
inner join  users 
ON orders.userid=users.userid
