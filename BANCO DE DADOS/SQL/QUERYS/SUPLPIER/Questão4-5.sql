WITH pname_project
as(
SELECT s.sname,p.pname, COUNT(DISTINCT pr.pjname) as projetos
FROM parts p
INNER JOIN sppj  ON sppj.parts_pno = p.pno
INNER JOIN projects pr ON pr.pjno = sppj.projects_pjno
INNER JOIN suppliers s ON s.sno = sppj.suppliers_sno
GROUP BY s.sname, p.pname
)
SELECT pp.sname
FROM pname_project as pp
WHERE projetos>1
GROUP BY pp.sname
HAVING COUNT(DISTINCT pname)>1
