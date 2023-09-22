use Simple
create table Doctors
(
d_id int primary key,
d_name varchar(50),
d_address varchar(100),
d_qualification varchar(50),
no_of_patient_handled int,
)
alter table doctors alter column d_address varchar(100) null

create table PatientMaster
(
p_code int primary key,
p_name varchar(50),
p_address varchar(100),
p_age int,
p_gender varchar(10),
p_bloodgroup varchar(50)
)

create table admitted_patient 
(
p_code int,
entry_date date,
discharge_date date,
wardno int,
disease varchar(50),
d_id int,
foreign key(p_code) references patientMaster(p_code),
foreign key(d_id) references doctors(d_id)
)

create table bill
(
p_code int ,
bill_amount decimal(12,2),
foreign key(p_code) references patientmaster(p_code)
)
exec sp_help bill
 
 insert into doctors values(1,'dr.manish sharma','katraj Pune','MBBS.MD',156),
 (2,'dr.krushna mehta','panvel Mumbai','MBBS',50),
 (3,'dr.trisha kaur','Delhi','BHMS',15),
 (4,'dr.priti karve','Pune','MBBS',125)

 select * from doctors
 select * from PatientMaster 
 select * from admitted_patient 
 select * from bill

 insert into PatientMaster values(11,'sandip raut','surya nagar pune',35,'Male','A+'),
 (12,'raj munde','gokuldham colony mumbai',8,'Male','B+'),
 (13,'shrisha mehta','M.P colony ambajogai',22,'Female','A-'),
 (14,'sonal shetty','rajesh nagar parali',28,'female','O'),
 (15,'trupti roshan','N.K.society nanded',35,'Female','B+'),
 (16,'siddhi vaidya','samarth nagar pune',42,'Female','B+'),
 (17,'suresh shastri', 'ram temple mumbai',66,'Male','B-')

 insert into admitted_patient values(11,'2020/6/12','2020/6/20',4,'viral infection',3),
 (15,'2021/9/18','2021/10/5',2,'pnemonia',1),
 (16,'2021/9/21','2021/9/27',6,'diabetes',4),
 (17,'2021/11/8','2021/11/26',2,'dengue fever',1),
 (13,'2022/1/14','2022/1/15',5,'anemia',4)


insert into bill values(11,25000),
(12,8500),
(13,36000),
(14,4200),
(15,52000),
(16,17500),
(17,43000)


--write a query to change the data type of wardnumber int to varchar(10)
alter table admitted_patient alter column wardno varchar(10)
 

--write a query to find number of doctors as per qualification.
select d_qualification,count(d_id) from Doctors group by d_qualification 

--find the doctors whose qualification is md or mbbs.
select * from doctors where d_qualification = 'md' or d_qualification = 'mbbs'

-- find patients whose age is between 21 to 30 with bloodgroup A-.
select * from PatientMaster where p_age between 21 and 30  and  p_bloodgroup = 'A-'

--find the doctors whose adress is 'panvel mumbai' and number of patient handled are 50
select * from Doctors where d_address = 'panvel mumbai' and no_of_patient_handled = 50

--find the count of patients as per the blood group.
select p_bloodgroup,count(p_code) from PatientMaster group by p_bloodgroup 

--find the maximum bill amount.
select max(bill_amount) from bill

--find the doctors who has number of patient handled are more than 50.
select * from doctors where no_of_patient_handled > 50

--find the number of patients who live in samarth nagar pune.
select count(p_code) from PatientMaster where p_address = 'samarth nagar pune'

--find the patients whose blood group is B+ and gender is female.
select * from PatientMaster where p_bloodgroup = 'B+' and p_gender = 'female'

--delete the patient whose wardno is 4 or 6 and disease is covid19.
delete from admitted_patient where wardno = 4 or wardno = 6 and disease = 'covid19'

--remove all records from bill table.
delete from bill

--find the details of doctor who are treating the patient of wardno 2.
select * from Doctors join admitted_patient ap on ap.d_id = doctors.d_id where ap.wardno = 2

--find the details of patients who are dischared within the date 2021-9-10 to 2021-10-10.
select * from admitted_patient where discharge_date between '2021/9/10' and '2021/10/10'

--give details of patients who admitted in hospital more than 5 days.
select * from admitted_patient 


--find the patients who are suffered from dengue fever and having age less then 70 and blood group is 'B-'
select * from admitted_patient adp join PatientMaster p on p.p_code = adp.p_code 
where adp.disease = 'dengue fever' and p_age < 70 and p_bloodgroup = 'B-' 

--find the patients having bill amount greater than 20000.
select * from PatientMaster p join bill b on p.p_code = b.p_code where bill_amount > 20000

--find the patients having bill amount greater than 30000 and age greater than 30.
select *  from PatientMaster p join bill b on b.p_code = b.p_code where bill_amount > 30000 and p_age > 30 



