SELECT DISTINCT s.name 
FROM  books b
INNER JOIN bookuses bu ON bu.books_isbn = b.isbn
INNER JOIN enrolls e ON e.courses_cnum = bu.courses_cnum
INNER JOIN students s ON s.ssn = e.students_ssn
WHERE b.publisher = 'Addison Wesley'
