use Simple

--trigger 
select *from Employee10
create table EmployeTrack
(
id int primary key identity(1,1),
description varchar(209)
)
create trigger tri_emp
on employee10  after insert 
as begin
declare @id int
declare @name varchar(20)
declare @email varchar(20)
declare @age int
declare @salary numeric(12,10)
select @id=id,@name=name,@email=email,@age=age,@salary=salary from inserted
insert into EmployeTrack values ('new details'+cast(@id as varchar)+'name'+@name+'email'+@email+'age'+cast(@age as varchar)+'salary'+cast(@salary as varchar))
end

select *from Employee10
select*from EmployeTrack
alter table Employee10 alter column salary int

insert into Employee10(id,name,email,age,salary) values(78,'swara','swaraj@gmail.com',34,50)
delete from Employee10 where id=45

insert into Employee10(id,name,email,age,salary) values(89,'swaranjali','swaranjali@gmail.com',69,99)



