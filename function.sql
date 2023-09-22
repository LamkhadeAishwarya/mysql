use Simple
--scalar function
create function addition(@a int,@b int)
returns int 
as begin
declare @c int
set @c=@a+@b
return @c
end
select dbo.addition(1,3) as 'sum '


select*from Employee1
create function GetName(@eid int)
returns varchar(34)
as begin
return (select ename from Employee1 where eid=@eid)
end
select dbo.GetName(3) as 'empname'

select *from product
create function getprice(@price int)
returns int
as begin
declare @dic decimal
set @dic=@price -(@price*0.10)
return @dic
end

select price,dbo.getprice(price) from product

