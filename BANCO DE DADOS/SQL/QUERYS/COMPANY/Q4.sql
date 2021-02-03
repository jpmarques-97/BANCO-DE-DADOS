WITH project_employee as (
SELECT e.fname,e.minit,e.lname,e.ssn,group_concat(w.pno ORDER BY w.pno) as grupos
FROM employee e
INNER JOIN works_on w ON w.essn = e.ssn
INNER JOIN project p ON p.pnumber = w.pno
GROUP BY e.ssn
)
select pe.fname, pe.minit, pe.lname
from project_employee pe
where  (SELECT group_concat(p.pnumber ORDER BY p.pnumber)
FROM project as p) = (pe.grupos)
