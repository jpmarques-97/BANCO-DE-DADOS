SELECT DISTINCT s.fname, s.minit, s.lname
FROM  students s 
LEFT JOIN enrolls e ON e.students_sid = s.sid
LEFT JOIN courses c ON c.term = e.courses_term AND c.secno = e.courses_secno
WHERE c.term IS NULL
AND c.secno IS NULL
