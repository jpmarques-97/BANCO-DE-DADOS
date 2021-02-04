SELECT DISTINCT c.dept
FROM  books b
INNER JOIN bookuses bu ON bu.books_isbn = b.isbn
INNER JOIN enrolls e ON e.courses_cnum = bu.courses_cnum
INNER JOIN courses c ON c.cnum = bu.courses_cnum
GROUP BY c.dept
HAVING COUNT(DISTINCT b.publisher) = 1
