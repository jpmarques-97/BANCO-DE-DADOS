SELECT s.sname
FROM parts p
INNER JOIN sppj  ON sppj.parts_pno = p.pno
INNER JOIN projects pr ON pr.pjno = sppj.projects_pjno
INNER JOIN suppliers s ON s.sno = sppj.suppliers_sno
WHERE pr.pjno = 'J1'
GROUP BY s.sname
HAVING COUNT(DISTINCT p.pno)>2
