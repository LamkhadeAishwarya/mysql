use Simple
create table colour
(
cid int,
cname varchar(50)
)

create table sizes
(
id int,
sname varchar(50)
)

insert into colour values(1,'red'),
(2,'blue'),
(3,'green'),
(4,'black'),
(5,'pink')

insert into sizes values(1,'S'),
(2,'M'),
(3,'L'),
(4,'XL'),
(5,'XXL')

select * from colour
select * from sizes

select * from sizes cross join colour

