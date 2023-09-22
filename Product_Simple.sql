use Simple
create table product
(
id int,
pname varchar(20),
price int,
company varchar(40)
)
drop table product

insert into product values(1,'Laptop',35000,'Dell'),
(2,'pencil',10,'apsara'),
(3,'Tv',25000,'Sony'),
(4,'computer',30000,'HP'),
(5,'notebook',100,'akshara'),
(6,'LED',15000,'Panasonic'),
(7,'Computer',47000,'HP'),
(8,'Pendrive',2000,'SanDisk'),
(9,'pendrive',999,'HP'),
(10,'Earphone',1300,'boult')

select * from product

delete from product where price=20

select * from product where price<2000

select * from product where company='sony'

select * from product where price between 2000 and 5000

select distinct company from product

select * from product where company in('dell','HP')




