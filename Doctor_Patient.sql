use Simple
create table patients
(
patient_id int primary key,
first_name varchar(30),
last_name varchar(30),
gender varchar(1),
birth_date date,
city varchar(30),
province_id varchar(2),
allergies varchar(80),
height decimal(3,0),
weights decimal(4,0)
)
drop table patients
alter table patients add constraint fk_pro foreign key (province_id) references Province_names(province_id)
insert into patients values(101,'Aishwarya','Lamkhade','f','01/10/2001','pune','MH','Asthma',3.4,34.6),
(102,'Ashwini','Lamkhade','f','01/11/2001','mumbai','RJ','Drug Allergy',2.5,32),
(103,'swara','Lamkhade','f','04/06/2004','nagpur','Ap','skin',4.5,50),
(104,'rupesh','Lamkhade','m','2/04/2003','nashik','BH','Drug',2.5,45)
update patients set allergies=null where gender='m'
update patients set first_name='chaitali' where patient_id=103
update patients set birth_date='5/7/2020' where patient_id=102


create table Doctors
(
doctor_id int primary key,
first_name varchar(30),
last_name varchar(30),
speciality varchar(25),
)
insert into Doctors values(1,'Dr.Pooja','matale','cardiologist'),
(2,'DR.Diksha ','Jadhav','pediatrician'),
(3,'Dr.Shoham','Deshmukh','Orthopedic Surgeon')
drop table Doctors

create table admissions
(
patient_id int ,
admission_date date,
discharge_date date,
diagnosis varchar(50),
doctor_id int

)
drop table admissions
insert into admissions values(101,'2001/5/06','2001/6/07','A',1),(102,'2002/6/8','2002/5/4','B',2),(103,'2004/6/5','2004/2/6','c',3)
alter table admissions add constraint forenk_id foreign key (patient_id) references patients(patient_id)
alter table admissions add constraint fok_ids foreign key (doctor_id) references Doctors(doctor_id)

create table Province_names
(
province_id varchar(2) primary key,
province_name varchar(30)
)
drop table Province_names
insert into Province_names values('MH','Maharashtra'),
('RJ','Rajsthan'),
('AP','Andhra Pradesh'),
('AS','Assam'),
('BH','Bihar')
select*from patients
select *from Doctors
select*from admissions
select*from province_names

--1.	Show the first name, last name and gender of patients who’s gender is ‘M’
select first_name,last_name,gender from patients where gender='m'
--2.	Show the first name & last name of patients who does not have any allergies
select first_name,last_name from patients where allergies is null
--3.	Show the patients details that start with letter ‘C’
select*from patients where first_name like'c%'
--4.	Show the patients details that height range 100 to 200
select *from patients where height between 2.5 and 4.5
--5.	Update the patient table for the allergies column. Replace ‘NKA’ where allergies is null
update patients set allergies='NkA'where allergies=null
--6.	Show how many patients have birth year is 2020
select count(patient_id)from patients where year(cast(birth_date as date))=2020
--7.	Show the patients details who have greatest height
select top 1*from patients where height=(select max(height)from patients )
--8.	Show the total amount of male patients and the total amount of female patients in the patients table.
select gender ,count(patient_id) from patients group by gender
--9.Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. 
--Show results ordered ascending by allergies then by first_name then by last_name.
select first_name,last_name ,allergies from patients
where allergies ='Drug Allergy' or allergies='Asthma'
order by first_name,last_name ,allergies
--10.	Show first_name, last_name, and the total number of admissions attended for each doctor.

--Every admission has been attended by a doctor.
select concat(d.first_name,'',d.last_name),count(d.doctor_id)
from Doctors d
inner join admissions a
on a.doctor_id=d.doctor_id
group by concat(d.first_name,'',d.last_name)
--11.	For every admission, display the patient's full name, their admission diagnosis,
--and their doctor's full name who diagnosed their problem.

select a.patient_id,p.first_name,p.last_name as'patient name', d.first_name, d.last_name as'doctor name',a.diagnosis 
from admissions a
inner join  patients p
on p.patient_id=a.patient_id
inner join Doctors d 
on d.doctor_id=a.doctor_id