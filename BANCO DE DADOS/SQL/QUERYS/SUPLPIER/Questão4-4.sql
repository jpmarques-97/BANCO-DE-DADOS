SELECT pr.pjname
FROM parts p
INNER JOIN sppj  ON sppj.parts_pno = p.pno
INNER JOIN projects pr ON pr.pjno = sppj.projects_pjno
INNER JOIN suppliers s ON s.sno = sppj.suppliers_sno
WHERE s.sno = 'S1'
AND 1 = (
			SELECT COUNT(DISTINCT s.sno)
            FROM suppliers s 
            INNER JOIN sppj  ON sppj.suppliers_sno = s.sno
            INNER JOIN projects pr1 ON pr.pjno = sppj.projects_pjno
            WHERE pr1.pjno = pr.pjno
            )
