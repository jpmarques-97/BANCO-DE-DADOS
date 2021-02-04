WITH orders_cliente
AS(
SELECT c.cname, COUNT(o.cno) as qnt
FROM customers c
INNER JOIN orders o ON o.cno = c.cno
GROUP BY c.cname
)
SELECT oc.cname
FROM orders_cliente oc
WHERE oc.qnt = 2
