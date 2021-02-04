WITH project_employee as (
SELECT e.fname,e.minit,e.lname,e.ssn,group_concat(p.plocation) as grupos,group_concat(dl.dlocation) as grupos2 
FROM employee e
LEFT JOIN works_on w ON w.essn = e.ssn
LEFT JOIN project p ON p.pnumber = w.pno
LEFT JOIN department d ON d.dnumber = e.dno
LEFT JOIN dept_locations dl ON dl.dnumber = d.dnumber
GROUP BY e.ssn
)
SELECT pe.* 
FROM project_employee pe
WHERE FIND_IN_SET('Houston',pe.grupos)>0 
AND (FIND_IN_SET('Houston',pe.grupos2)=0 
OR pe.grupos2 IS NULL)
