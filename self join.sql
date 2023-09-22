use Simple

select * from employee10

alter table employee10 add managerid int
update employee10 set managerid=5 where id in(1,2,3,4)
update employee10 set managerid=10 where id in(6,7,8,9)
update employee10 set managerid=15 where id in(12,13,14)

--self join
select e1.name as 'Employee', e2.name as 'Manager'
from employee10 e1, employee10 e2
where e1.managerid=e2.id


select e1.name as'High salary' ,e1.salary, e2.name as 'Low salary',e2.salary
from employee10 e1 , employee e2
where e1.salary > e2.salary
