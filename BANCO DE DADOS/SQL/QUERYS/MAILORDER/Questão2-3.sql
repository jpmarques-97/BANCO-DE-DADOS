SELECT  DISTINCT c1.cno, c2.cno
FROM customers as c1
INNER JOIN customers as c2 ON c2.zip = c1.zip AND c2.cno != c1.cno
ORDER BY c1.cno
