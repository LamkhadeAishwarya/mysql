use Simple
select*from Employee10
create proc DMLCommand
(
@id int,
@name varchar(20),
@email varchar(25),
@age int,
@salary numeric(12,2),
@managerid int
)
as begin
insert into Employee10 values(@id,@name,@email,@age,@salary,@managerid)
return 
end
alter table Employee10 alter column salary numeric (12,2)
exec DMLCommand
@id=99,
@name='Aishu',
@email='aishul2002@gmail.com',
@age=22,
@salary=450,
@managerid=15