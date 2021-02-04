SELECT p.pname
FROM parts p
INNER JOIN sppj  ON sppj.parts_pno = p.pno
INNER JOIN projects pr ON pr.pjno = sppj.projects_pjno
INNER JOIN suppliers s ON s.sno = sppj.suppliers_sno
GROUP BY p.pname
HAVING group_concat(DISTINCT s.sno ORDER BY s.sno) = (	SELECT group_concat(DISTINCT s.sno ORDER BY s.sno)
														FROM suppliers s)
