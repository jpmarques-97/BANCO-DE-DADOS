WITH
cte as 
(
SELECT c.cname, b.quarter, GROUP_CONCAT(b.books_isbn) as books
FROM courses c
INNER JOIN bookuses b
ON b.courses_cnum = c.cnum
GROUP BY c.cname, b.quarter
ORDER BY c.cname
)
SELECT cname
FROM cte
WHERE cte.books <> (SELECT books FROM cte as c WHERE c.cname = cte.cname LIMIT 1)
GROUP BY cte.cname
