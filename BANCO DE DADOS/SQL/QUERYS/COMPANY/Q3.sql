SELECT e.fname, e.minit, e.lname
FROM employee e
WHERE e.super_ssn = (SELECT e.ssn
						FROM employee e
						WHERE e.fname = 'Franklin'
						AND e.minit = 'T'
						AND e.lname = 'Wong')
