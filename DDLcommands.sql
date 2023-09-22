use Simple

create table staff
(
tid int,
tname varchar(20),
tage int,
temail varchar(26),
city varchar(25) default'pune'
)
drop table staff
alter table staff alter column tname varchar(24) null
alter table staff add adddr varchar(43)
exec sp_rename 'staff.temail','email'
---constraint
alter table staff add constraint uni_st unique (tid)
alter table staff drop constraint uni_st
alter table staff alter column tid int not null
alter table staff add constraint pk_sta primary key (tid)
alter table staff add constraint ch_ag check(tage>50)
-----------index remeaning
create index ind_id on staff(tid) 
exec sp_help staff
----------------------------------------------------
-----------DMl
---update
select*from staff
insert into staff values(1,'amol',78,'amol@gmail.com','mumbai','mangrul')
insert into staff values(2,'Aishu',67,'aishu@gmail.com','pune','takli')
insert into staff values(3,'nikita',78,'nikuu@gmail.com','pune','takli')
insert into staff values(4,'jayant',89,'jayant@gmail.com','nagpur','takli')
insert into staff values(5,'rupesh',90,'rupesh@gmail.com','nashik','takli')
insert into staff values(6,'kirti',99,'kirtu@gmail.com','pune','takli')
select *from staff where tname like'a%'
update staff set tname='ashu' where tid=(6)
update staff set tname='aishwarya' where tage=67
update staff set tname='aishwarya'where tid =2
update staff set tage=88 where tname='amol'
update staff set tage=89 where tname='aishwarya'
---delete

delete from staff where tid in(1,2)
delete from staff where tage>87
----------------------------where DQL
select *from staff where tid=1
select *from staff where city='pune'
select *from staff where tid<>(2)
select distinct city from staff
select *from staff where tage<(70)
select *from staff where tid in(1,2)
select *from staff  where tage<80 and tage >65
select *from staff where tage not in(78)
select *from staff where city in('pune','mumbai')
--update
update staff set tname = null where tid=1
----is null or not null
select *from staff where tname is null
select *from staff where tname is not null
-------like
select *from staff where tname like'a%'
select *from staff where tname like'%a'
select *from staff where tname like'%a%'
select *from staff where tname like'%y%'
select *from staff where tname like'%a'
select *from staff where tname like'%a%'
select *from staff where tname like'%[ta]'
select *from staff where tname like'%[iku]%'
select *from staff where tname like'%[a-z]%'
select *from staff where tname not like'%[t]%'
select *from staff where tname like'j____t'
select *from staff where tname like'a___w__y_'
select *from staff order by tname desc
update staff set tname='amol' where tid=1
select *from staff order by city

select top 5*from staff order by tid
select 'tname'as 'teachername' from staff
-----offset fetch demo
select *from staff order by tage desc
offset 2 rows 
fetch next 3 row only
select *from staff order by tage
offset 4 rows
fetch next 1 rows only
select *from staff order by tid
offset  4 rows
fetch next 1 row only

select top 3 with ties *from staff order by tage desc
select count (tid) as 'total count'from staff 
select max(tage)as 'Maximum age'from staff
select min(tage)as 'minimum age'from staff
select sum(tage)as'sum of age'from staff
