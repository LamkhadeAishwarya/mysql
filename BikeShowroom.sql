use Simple
select * from customer
select * from model
select * from payment_mode
select * from feedback_rating

exec sp_help customer
exec sp_help model
exec sp_help payment_mode
exec sp_help feedback_rating

create table model
(
model_id int primary key,
model_name varchar(100),
cost decimal(12,2)
)
create table customer
(
cust_id int primary key,
first_name varchar(50),
last_name varchar(50),
mobile_no varchar(10),
gender varchar(10),
email varchar(100)
)
drop table customer

create table payment_mode
(
payment_id int primary key,
payment_type varchar(20)
)

create table feedback_rating
(
rating_id int primary key,
rating varchar(20)
)

create table purchase
(
purchase_id int primary key,
cust_id int,
 foreign key (cust_id) references customer(cust_id),
model_id int,
foreign key (model_id) references model(model_id),
booking_amount decimal(10,2),
payment_id int,
foreign key (payment_id) references payment_mode(payment_id),
purchase_date date,
rating_id int,
foreign key(rating_id) references feedback_rating(rating_id)
)







insert into model values(101,'Platina',100000),
(102,'Royal enfield bullet ', 1930000),
(103,'Hero splender', 75000),
(104,'Yamaha R15 v4', 1810000),
(105,'Honda sp 125',86000)
 

insert into customer values(1,'Krishna','shinde','8765439281','male','krishna@gmail.com'),
(2,'Isha','Joshi','7756932001','Female','Isha@gmail.com'),
(3,'pooja','raut','8345672902','female','pooja@gmail.com'),
(4,'vedant','sharma','8465378929','male','vedant@gmail.com'),
(5,'shrishti','jadhav','9246007792','female','shrishti@gmail.com'),
(6,'tarun','mehta', '7273849903','male','tarun@gmail.com')


insert into payment_mode values(10,'online'),
(20,'cash'),
(30,'cheque')
select * from payment_mode

--update payment_mode set payment_id=20 where payment_type='cash'
--update payment_mode set payment_id=30 where payment_type='cheque'

insert into feedback_rating values(5,'execellent'),
(4,'good'),
(3,'average'),
(2,'bad'),
(1,'very bad')

select * from feedback_rating

insert into  purchase(purchase_id,cust_id,model_id,booking_amount,rating_id,purchase_date,payment_id) values(100,1,101,10000,2,'2020/10/5',30),
(200,2,102,25000,3,'2021/6/29',10),
(300,3,103,5000,1,'2018/8/8',20),
(400,6,105,16000,3,'2022/1/10',20),
(500,4,104,8000,2,'2019/3/28',10),
(600,5,105,6000,5,'2022/5/25',30),
(700,2,103,10000,3,'2020/12/27',10)

select * from purchase


-- write a query to get the balance amount for customers who made cash payment.
select c.* from customer c join purchase p on c.cust_id = p.cust_id
join model m on m.model_id= p.model_id join feedback_rating f on f.rating_id=p.rating_id
join(select cust_id , sum(cost-booking_amount) as balancamount from model m join purchase p on m.model_id=p.model_id group by cust_id)
 where p.payment_type = 'cash'

-- delete all the records of customer who have paid complete amount as that of bike cost.
delete customer 


-- create an index to have faster retrival of data on the basis of booking_amount.
create index in_index on purchase(booking_amount)


-- write a query to change payment mode to cash for 'activa5g' purchased by customer with id 11.
-- map wherekey is modelname and value is arraylist of ids of customer who purchased that model.
-- create a stored procedure to get the full name of customer whose cust_id is provided as input.
-- write a query to get the number of complaints registered for model activ5g.
-- write a query to get the customers who haven't given rating yet.
-- delete all the complaints records from purchase.
-- update ratings given by mr.vaibhav from good to excellent.
-- reduce cost of all bikes for which rating is bad by 10%
-- display highest selling model along with the  name and count.


