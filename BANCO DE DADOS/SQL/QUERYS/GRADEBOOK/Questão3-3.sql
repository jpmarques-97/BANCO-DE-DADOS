SELECT DISTINCT s.sid
FROM  students s 
INNER JOIN enrolls e ON e.students_sid = s.sid
INNER JOIN courses c ON c.term = e.courses_term AND c.secno = e.courses_secno
WHERE c.cno = 'csc226' OR c.cno = 'csc227'
