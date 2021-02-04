SELECT s.fname, s.minit, s.lname
FROM students s
INNER JOIN enrolls e ON e.students_sid = s.sid
INNER JOIN courses c ON c.term = e.courses_term AND c.secno = e.courses_secno
INNER JOIN catalogue ca ON ca.cno = c.cno
WHERE ca.ctitle = 'Automata' AND c.term = 'f96'
GROUP BY s.fname, s.minit, s.lname
