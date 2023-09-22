use Simple
select * from employee10
-- Update command.
update employee10 set salary= 21800 where id=2  

update employee10 set email='saksra@gmail.com',salary=23000,age=28 where id=3 

alter table employee10 add city varchar(20) -- Add city column in table

-- Insert city in column
update employee10 set city='Mumbai' where id in(1,2,3,4,5,6,7)
update employee10 set city='Pune' where id in(8,9,10,11,12,13)

-- Delete command.
delete from employee10 where id = 15
delete from employee10 where age<20

-- Select command
select * from employee10 -- indicate all column
select name as'employee name',email as 'email id' from employee10 -- Temporary show
select * from employee10 where id=1 -- Get data whose id is 1
select * from employee10 where city='Pune' -- Get data whose city is pune
select * from employee10 where age<28 -- Get data whose age is less then 28.

select * from employee10 where age<>24 and age<>25  -- show data whose age is not 24 amd 25.

-- Distinct Used to get unique record.
select distinct salary from employee10

--and-->all condition must be true
select * from employee10 where salary<28000 and city='pune' and age<23

--or = either one is true
select * from employee10 where city='Mumbai' or city='delhi'

--between = show in that range
select * from employee10 where salary between 25000 and 28000

--in clause
select * from employee10 where id in(1,2,3,4,5)

--not in clause
select * from employee10 where id not in(1,2,3,4,5,6,7,8)


