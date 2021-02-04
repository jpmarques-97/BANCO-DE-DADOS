SELECT c.cname
FROM courses c
GROUP BY c.cname
HAVING COUNT(c.cnum)>1
