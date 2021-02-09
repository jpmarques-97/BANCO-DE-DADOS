SELECT s.name
FROM students s
LEFT JOIN (
SELECT s.ssn
FROM students s
INNER JOIN enrolls e
ON e.students_ssn = s.ssn
INNER JOIN courses c
ON c.cnum = e.courses_cnum
INNER JOIN bookuses bu
ON (bu.courses_cnum = c.cnum AND bu.quarter = e.quarter)
INNER JOIN books b
ON b.isbn = bu.books_isbn
WHERE b.isbn IN (
						SELECT isbn
						FROM books b
							WHERE b.author = 'Navathe'
							AND b.publisher = 'Addison Wesley'
						)
GROUP BY s.ssn, s.name
) foo ON foo.ssn = s.ssn
WHERE foo.ssn IS NULL
