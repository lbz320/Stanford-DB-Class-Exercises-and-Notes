	SELECT H2.name
	FROM Highschooler H1, Highschooler H2, Friend f
	WHERE H1.ID = f.ID1 AND H1.name = 'Gabriel'
	AND H2.ID = f.ID2