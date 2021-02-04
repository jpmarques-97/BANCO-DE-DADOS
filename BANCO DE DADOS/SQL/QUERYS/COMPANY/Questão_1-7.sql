SELECT e.fname, e.minit, e.lname
FROM department d
INNER JOIN employee e ON d.mgr_ssn = e.ssn
LEFT JOIN dependent dp ON dp.essn = e.ssn
WHERE dp.essn IS NULL
