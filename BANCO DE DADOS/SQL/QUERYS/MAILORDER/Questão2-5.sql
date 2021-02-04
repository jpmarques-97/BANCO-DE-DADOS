WITH orders_name 
as (
SELECT DISTINCT c.cname, group_concat(p.pname ORDER BY p.pname) as pedidos
FROM customers c
INNER JOIN orders o ON o.cno = c.cno
INNER JOIN odetails od ON od.ono = o.ono
INNER JOIN parts p ON p.pno = od.pno
WHERE p.price < 20
GROUP BY c.cname
)
SELECT ona.cname
FROM orders_name ona
where (pedidos) = (
	SELECT group_concat(p.pname ORDER BY p.pname)
    FROM parts p
    WHERE p.price < 20
)
