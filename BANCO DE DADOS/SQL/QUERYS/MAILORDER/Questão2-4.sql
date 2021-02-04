SELECT  c.cname
FROM customers as c
INNER JOIN orders o ON c.cno = o.cno
INNER JOIN employees e ON e.eno = o.eno
INNER JOIN zipcodes z ON z.zip = e.zip
WHERE z.city = 'Wichita'
AND 1 = (
SELECT COUNT(DISTINCT z.city)
FROM customers c1
INNER JOIN orders o ON o.cno = c.cno
INNER JOIN employees e ON e.eno = o.eno
INNER JOIN zipcodes z ON z.zip = e.zip
WHERE c1.cno = c.cno
GROUP BY c.cname
)
