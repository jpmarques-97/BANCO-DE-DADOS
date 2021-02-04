SELECT a.fname, a.minit, a.lname
FROM(
SELECT DISTINCT s.fname, s.minit, s.lname, group_concat(DISTINCT ctitle ORDER BY ctitle) as cursos
FROM  students s 
INNER JOIN enrolls e ON e.students_sid = s.sid
INNER JOIN courses c ON c.term = e.courses_term AND c.secno = e.courses_secno
INNER JOIN catalogue ca ON ca.cno = c.cno
GROUP BY s.fname, s.minit, s.lname
HAVING (cursos) = (
SELECT group_concat(DISTINCT ctitle)
FROM catalogue
)
) AS a
