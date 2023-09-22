create database Simple
use Simple
create table first
(
id int,
name varchar(20),
email varchar(20),
gender varchar(30),
contact numeric(20,10),
city varchar(26)
)
insert into first values(1,'aishwarya','aishu2002@gmail.com','female',9657489835,'pune'),
(2,'madhura','madhura@gmail.com','female',1234567890,'beed'),
(3,'pooja','pooja@gmail.com','female',0987654321,'mumbai')
exec sp_help first
select*from first