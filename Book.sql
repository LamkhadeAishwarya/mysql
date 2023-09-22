use Simple
create table author
(
author_Id int primary key,
author_name varchar(50),
phone_no int,
email varchar(30),
adress varchar(50),
city varchar(15)
)
alter table author drop column adress --Delete column adress.
alter table author alter column phone_no varchar(10) --Change phone_no , int to varchar.

create table book
(
book_id int primary key,
book_name varchar(40),
author_Id int,
price int,
foreign key(author_Id) references author(author_Id)
)

create table masteraward
(
awardtype_Id int primary key,
award_name varchar(50),
award_price int
)

create table award
(
award_id int,
awardtype_id int,
author_Id int,
book_id int,
year int,
foreign key (awardtype_id) references masteraward(awardtype_id),
foreign key(author_id) references author(author_id),
foreign key(book_id) references book(book_id)
)

--Insert values to author table.
insert into author values(101,'jane Austan',9876637783,'jane@gmail.com','bath'),
(102,'JK.Rowling',7554487392,'jrow@gmail.com','edinburg'),
(103,'F.Scott',755447990,'scot@gmail.com','edinburg'),
(104,'George Orwell',9867644376,'george@gmail.com','london')


select * from author

--Insert values to book table.
insert into book values(1,'pride and prejudice',101,1500),
(2,'Harry Potter',102,999),
(3,'The great Gatsby',103,1250),
(4,'1984',104,850)
insert into book values(5,'master chef',102,800),
(6,'animal farm',104,1550),
(7,'emma',101,1450)

select * from book


--Insert values to master award table
insert into masteraward values(10,'Best book of the year',50000),
(11,'highest sold book of the year',100000)
insert into masteraward values(12,'most popular book',80000),
(13,'best fiction book',50000),
(14,'outstanding debut author',100000)
insert into masteraward values(15,'oscar award',200000)
select * from masteraward


--Insert values to the award table
insert into award values(1000,10,102,2,2013),
(1001,11,104,4,2014),
(1002,12,104,4,2014),
(1003,13,101,1,2008),
(1004,14,102,2,2015)
insert into award values(1005,15,104,2,2015)


select * from award

select * from book where book_id=2

select a.author_name,a.author_id,b.book_name,b.book_id,m.award_name,award.award_id,m.awardtype_id,m.award_price
from author a full join book b on a.author_id = b.author_id 
full join award award on award.book_id=b.book_id
full join masteraward m on m.awardtype_id = award.awardtype_id


--find book name which is return by xyz
select b.book_name 
from book b left join author a on b.author_id=a.author_id
where author_name='f.scott'

--find author name from book harry potter
select a.author_name 
from book b left join author a on b.author_id=a.author_id
where book_name = 'Harry potter'

--find author name who get award in 2013
select a.author_name from author a  join award award
on a.author_id=award.author_id


--find books which got award
select b.book_name from book b join award award 
on award.book_id=b.book_id

--find the author name who got oscar award
select a.author_name ,award.book_id from author a 
 join award award on award.author_id=a.author_id
 join masteraward m on m.awardtype_Id=award.awardtype_id
where m.award_name = 'oscar award'

--find the author who got award price more than 10000
select a.author_name,a.author_id from author a
join award award on award.author_id = a.author_id
join masteraward m on m.awardtype_id = award.awardtype_id
where m.award_price > 100000

--find author who got maximum awards
select Top 1 a.author_name ,count(*) from author a 
join award d on a.author_id=d.author_id 
group by a.author_name order by count(*) desc



