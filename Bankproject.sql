use Simple
create table Bank
(
bank_id int primary key,
bank_name varchar(50),
adress varchar(100),
city varchar(50),
bstate varchar(50)
)

create table customer
(
cust_id int,
bank_id int,
foreign key (bank_id) references bank(bank_id)
)
drop table customer

create table account_type
(
acctype_id int primary key,
acctype varchar(40)
)

create table cust_master
(
cust_id int primary key,
cname varchar(50),
contact varchar(10),
age int,
pan_no varchar(20)
)


create table accounts
(
acc_no varchar(20) primary key,
cust_id int,
acctype_id int,
balance decimal(12,2)
foreign key (cust_id) references cust_master(cust_id),
foreign key (acctype_id) references account_type(acctype_id)
)

create table bank_transaction
(
trans_id int primary key,
acc_no varchar(20),
amount decimal(12,2),
trans_type varchar(10),
foreign key(acc_no) references accounts(acc_no)
)

insert into bank (bank_id,bank_name,city,bstate) values(1,'state bank of india','parali','maharashtra'),
(2,'HDFC','Mumbai','Maharashtra'),
(3,'Bank of Baroda','vadodara','Gujrat'),
(4,'Axis bank','pune','maharashtra'),
(5,'indian bank','chennai','Tamil nadu')


insert into account_type values(11,'saving'),
(12,'checking'),
(13,'fix deposite')

insert into cust_master values(1,'deepak bhat',7565835490,35,'bnzpm2401f'),
(2,'nisha mehta',8888042488,29,'jhfgj6530f'),
(3,'vedika sharma',7284937445,52,'zhpsn8632g'),
(4,'shrinath varma',9960523783,22,'mschy7638z'),
(5,'karan taur',9329456778,43,'afshj2435k'),
(6,'Ram desai',9284700839,62,'bhyi7735d'),
(7,'ishan puri',9836787475,22,'jjkdh9077w'),
(8,'vasim shaikh',8476748432,32,'fghyd3456p')

insert into customer values(1,3),
(2,5),
(3,4),
(4,1),
(5,2),
(6,3),
(7,2),
(8,4)

insert into accounts values(237687289,1,13,150000),
(837489373,2,12,27000),
(535245732,3,11,1253340),
(837736789,4,12,50000),
(265578382,5,11,35000),
(237687289,6,13,430000),
(773665668,7,12,273000),
(562627793,8,12,267782)
select * from accounts 

insert into bank_transaction values(10,237687289,10000,'credit'),
(20,237687289,50000,'debit'),
(30,837489373,25000,'debit'),
(40,535245732,150000,'debit'),
(50,535245732,300000,'credit'),
(60,837736789,2000,'debit'),
(70,237687289,10000,'debit'),
(80,237687289,50000,'credit'),
(90,237687289,25000,'debit'),
(100,773665668,3000,'debit'),
(110,562627793,27300,'credit'),
(120,562627793,10000,'debit'),
(130,562627793,25000,'debit')


--1. find the number of accounts in saving accounts.
select count(cust_id) as 'total count' from accounts
where acctype_id =
(select acctype_id from account_type
where acctype ='saving')

--2. Display all bank name, cname, city from all bank in ascending order of bankname and desceding order of city name.
select b.bank_name , cm.cname,b.city from bank b join customer c on c.bank_id = b.bank_id 
join cust_master cm on cm.cust_id = c.cust_id 
order by bank_name , city desc


--3. Find the customer who has perform maximum number of transaction.
select top 1 cm.cname , count(t.trans_id) as transaction_count from cust_master cm 
join accounts a on cm.cust_id = a.cust_id 
join bank_transaction t on t.acc_no = a.acc_no 
group by cm.cname 
order by transaction_count desc

--4. find the customers whose balance is greater than avg balance of saving accounts. 
select cm.cname from cust_master cm join accounts a on a.cust_id = cm.cust_id 
join account_type ac on a.acctype_id = ac.acctype_id 
where ac.acctype = 'saving' 
group by cm.cust_id ,cm.cname having avg(a.balance) > (select avg(balance) from accounts  
where acctype_id = (select acctype_id from account_type where acctype ='saving'))

--5. find the amount, name of customer whose acc_no is 12345
select ac.balance,cm.cname from cust_master cm join accounts ac 
on ac.cust_id = cm.cust_id  where acc_no = 535245732

--6. display the customer name,contact of customers whose account type is
--'saving' order by descending order of cname
select cm.cname , cm.contact from cust_master cm join accounts a on a.cust_id = cm.cust_id 
join account_type ac on ac.acctype_id =a.acctype_id where acctype = 'saving'
order by cm.cname desc

--7. display bank name, total balance of all customers in that bank of all banks in descending order of balance. 
select b.bank_name as bank_name , sum(a.balance) as total_balance from bank b
join customer c on c.bank_id =b.bank_id
join accounts a on a.cust_id = c.cust_id 
group by bank_name 
order by total_balance desc
