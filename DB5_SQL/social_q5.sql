SELECT h1.name, h1.grade, h2.name, h2.grade
FROM Highschooler h1, Highschooler h2,
(SELECT *
FROM Likes
WHERE ID2 NOT IN
	(SELECT DISTINCT ID1 FROM Likes)
) AS IDs
WHERE IDs.ID1 = h1.ID AND IDs.ID2 = h2.ID