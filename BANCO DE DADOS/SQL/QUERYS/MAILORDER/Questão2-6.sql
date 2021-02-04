SELECT c.cname
FROM customers c
LEFT JOIN orders o ON o.cno = c.cno
WHERE o.cno IS NULL
