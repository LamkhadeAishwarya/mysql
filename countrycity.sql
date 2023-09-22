use Simple
create table country
(
cid int primary key,
cname varchar(50)
)

create table states
(
stid int primary key,
sname varchar(50),
cid int,
foreign key(cid) references country(cid)
)

create table city
(
city_id int primary key,
city_name varchar(50),
stid int,
foreign key (stid) references states(stid)
)

insert into country values(1,'United states'),
(2,'Canada'),
(3,'Australia'),
(4,'Germany'),
(5,'japan'),
(6,'Brazil'),
(7,'France'),
(8,'India'),
(9,'Mexico'),
(10,'Italy')

insert into states values(1,'Callifornia',1),
(2,'Texas',1),
(3,'New york',1),
(4,'Ontario',2),
(5,'Victoria',3),
(6,'Tokyo',5),
(7,'Maharashtra',8)

insert into city values(1,'Los angeles',1),
(2,'San francisco',1),
(3,'Dallas',2),
(4,'new york city',3),
(5,'melbourne',5),
(6,'minato',6),
(7,'Pune',7),
(8,'Mumbai',7),
(9,'Parali',7)


select * from country
select * from states
select * from city

select c.cname , s.sname, city_name , city_id, s.stid,c.cid
from country c 
join states s on c.cid=s.cid 
join city  on s.stid=city.stid  

--find city name from country india
select city_name from city inner join states s on city.stid=s.stid
 join country c on  c.cid=s.cid 
 where cname='India'

 --find state name whose city name is pune
 select sname from states s join city on s.stid=city.stid
 where city_name = 'pune'

 --find state name whose state id = 3 
 select sname from states where stid=3

--find city whose country is india and state is maharashtra
select city_name from city join states s on s.stid=city.stid
join country c on c.cid=s.cid where cname='India' and sname='Maharashtra'

--find state whose country id is 3 and city name is melbourne
select sname from states s join country c on c.cid=s.cid
join city on city.stid=s.stid where city_name='Melbourne' and c.cid=3

--change city of state id 2
update city set city_name='Austin' where stid=2



