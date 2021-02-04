SELECT a.sid
FROM (
SELECT s.sid, group_concat(cno) as cursos
FROM  students s 
INNER JOIN enrolls e ON e.students_sid = s.sid
INNER JOIN courses c ON c.term = e.courses_term AND c.secno = e.courses_secno
GROUP BY s.sid
HAVING FIND_IN_SET('csc226',cursos)>0 AND FIND_IN_SET('csc227',cursos)>0
) as a
