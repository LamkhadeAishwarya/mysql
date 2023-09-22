
use Simple
--find the max salary in employee table
select max(salary) from Employee1

-- display the emp details who has max salary in emp table
--outer query                            inner/ subquery
select * from Employee1 where salary=(select max(salary) from Employee1)

-- display emp details who work in HR dept

select * from Employee1
select * from Department1
select * from Employee where did=
(
select did from Department1 where dname='Develope'
)

-- display emp details who has less salary than sayli

select * from Employee1 where salary <
(
select salary from employee1 where ename='Divya'
)

-- display the emp details who has less salary than the avg salary of all emps
select * from Employee1 where salary<
(
select avg(salary) from Employee1
)

--display the emp from dev dept who has less salary then the 
--avg salary of admin dept
select * from Employee1 where salary<
(
select avg(salary) from Employee1 where did=(select did from department1 where dname='admin')
)
and did=(select did from Department1 where dname='development')


-- display the emp details who has 2nd highest salary
select * from Employee1 where salary=
(
select max(salary) from Employee1 where salary<>
(
select max(salary) from Employee1
)
)


-- update the salary by 2000rs for emp who work in hr dept

update Employee1 set salary=salary+2000 where did in
(
select did from Department1 where dname='HR'
)

-- delete the emp who work in admin dept

delete from Employee1 where did in
(
select did from Department1 where dname='Admin'
)

