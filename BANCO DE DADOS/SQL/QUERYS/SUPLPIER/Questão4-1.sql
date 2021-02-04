SELECT p.pname
FROM parts p
INNER JOIN sppj  ON sppj.parts_pno = p.pno
INNER JOIN projects pr ON pr.pjno = sppj.projects_pjno
GROUP BY p.pname
HAVING 2 = COUNT(DISTINCT pr.pjno)
