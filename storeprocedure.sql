use simple
 create  proc store_proce
 as begin 
 select *from Employee10
 end

 exec store_proce

  create proc store_proce(@name varchar(20))
 as begin
 select *from Employee10 where name=@name
 return 
 end
 exec store_proce
 
 @name='manisha'
 drop proc store_proce

