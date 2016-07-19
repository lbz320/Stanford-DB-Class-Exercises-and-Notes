SELECT h1.name, h1.grade, h2.name, h2.grade, h3.name, h3.grade
FROM Highschooler h1, Highschooler h2, Highschooler h3,
(SELECT duos.ID1 AS A, duos.ID2 AS B, f1.ID1 AS C
FROM Friend f1, Friend f2,
(SELECT * 
FROM Likes
EXCEPT
SELECT *
FROM Friend) AS duos
WHERE f1.ID2 = duos.ID1 AND f2.ID2 = duos.ID2 AND f1.ID1 = f2.ID1
) AS trios
WHERE h1.ID = trios.A AND h2.ID = trios.B AND h3.ID = trios.C