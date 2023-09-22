use Simple
create table Users
(
userid int primary key,
uname varchar(255),
email varchar(255)
)

create table Product1
(
pid int primary key,
pname varchar(255),
price decimal(12,2)
)

create table orders
(
orderid int,
pid int,
userid int,
quantity int,
foreign key (pid) references Product1(pid),
foreign key (userid) references Users(userid)
)

insert into Users values(1,'siddhi','siddhi@gmail.com'),
(2,'Rahul','rahul@gmail.com'),
(3,'Priti','Priti@gmail.com'),
(4,'Isha','isha@gmail.com'),
(5,'Mona','mona@gmail.com')

select * from Users

insert into Product1 values(1,'HP Laptop',45000),
(2,'Dell laptop',52000),
(3,'Mi Mobile',26500),
(4,'Samsung tab',33000),
(5,'LG Ac',43500),
(6,'Sony Tv',29000),
(7,'Cooler',15000),
(8,'Smart watch',5900),
(9,'Washing machine',22000)
select * from Product1

insert into orders values(1,2,3,1),
(2,5,2,1),
(3,8,3,2),
(4,6,5,1),
(5,7,4,2),
(6,4,2,1),
(7,1,5,1),
(8,3,2,2)
select * from orders

select * from Product1
select * from Users
select * from orders

--inner join
select o.orderid,o.pid,p.pname,p.price,u.uname
from orders o
inner join Product1 p on p.pid=o.pid
inner join Users u on u.userid=o.userid


--left join
select o.orderid,o.pid,p.pname,p.price,u.uname
from orders o
left join Product1 p on p.pid=o.pid
left join Users u on u.userid=o.userid


--display the user who does not order single product.
select * from Users where userid not in (select userid from orders )

--display the customer who have ordered a product more than 4 times
select u.uname, count(o.orderid) as 'count' from users u 
join orders o on u.userid=o.userid group by u.uname having count(*)>2

