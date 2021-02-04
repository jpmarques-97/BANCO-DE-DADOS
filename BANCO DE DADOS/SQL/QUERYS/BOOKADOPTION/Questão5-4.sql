WITH books_dept
as(
SELECT DISTINCT c.dept, GROUP_CONCAT(DISTINCT b.title ORDER BY b.title) as titles
FROM  books b
INNER JOIN bookuses bu ON bu.books_isbn = b.isbn
INNER JOIN enrolls e ON e.courses_cnum = bu.courses_cnum
INNER JOIN courses c ON c.cnum = bu.courses_cnum
WHERE publisher = 'Addison Wesley'
AND author = 'Navathe'	
GROUP BY c.dept
)
SELECT bd.dept
FROM books_dept bd
WHERE (
			SELECT group_concat(DISTINCT title) as livros
			FROM books
			WHERE publisher = 'Addison Wesley'
				AND author = 'Navathe'				
		) = (titles)
