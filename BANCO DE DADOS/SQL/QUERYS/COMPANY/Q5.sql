WITH project_employee as (
SELECT e.fname,e.minit,e.lname,e.ssn,group_concat(w.pno ORDER BY w.pno) as grupos
FROM employee e
LEFT JOIN works_on w ON w.essn = e.ssn
LEFT JOIN project p ON p.pnumber = w.pno
GROUP BY e.ssn
)
SELECT pe.fname, pe.minit, pe.lname
FROM project_employee pe
WHERE  pe.grupos IS NULL
