use Simple
--Identity
create table Product_idet
(
id int primary key identity(101,1),
pname varchar(20),
price int
)

insert into Product_idet values('pencil',20)
insert into Product_idet values('pen',50)
insert into Product_idet values('pendrive',800)

select * from Product_idet 