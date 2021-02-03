SELECT e.fname, e.minit, e.lname
FROM employee e
INNER JOIN dependent d ON d.essn = e.ssn AND e.fname =  d.dependent_name
