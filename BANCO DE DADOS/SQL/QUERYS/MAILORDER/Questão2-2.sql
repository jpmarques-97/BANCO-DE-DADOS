select ename, city 
from employees e
inner join orders o on e.eno = o.eno
inner join zipcodes z on e.zip = z.zip
where ono in (select ono from (select o.ono, sum(od.qty*p.price) as valor_ordem from orders o
inner join odetails od on o.ono = od.ono
inner join parts p on od.pno = p.pno
group by o.ono
having valor_ordem > 50) as foo);
