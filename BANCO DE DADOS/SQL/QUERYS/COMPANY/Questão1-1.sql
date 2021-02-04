SELECT e.fname, e.minit, e.lname
FROM employee e
INNER JOIN works_on w ON w.essn = e.ssn
INNER JOIN project p ON p.pnumber = w.pno
WHERE 1 = 1  
AND p.pname = 'ProductX'
AND e.dno = 5
AND w.hours > 10
