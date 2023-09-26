use Simple
select pname,price,
case
when price<35000 then 'extensive'
when price>10 then 'inextensive'
else 'average'
end as 'remark'
from product

select id,name,salary,
case
when salary>25000 and salary<50000 then 'High salary'
when salary>35000 and salary <45000 then 'Average salary'
else  'low salary'

end as 'remark'
from Employee10
