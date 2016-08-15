SELECT h1.name, h1.grade, h2.name, h2.grade
FROM Likes L1, Highschooler h1, Highschooler h2
WHERE L1.ID1 = h1.ID AND L1.ID2 = h2.ID
	AND (h1.grade - h2.grade)>1