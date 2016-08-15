
SELECT h1.name, h1.grade, h2.name, h2.grade
FROM
Highschooler h1, Highschooler h2,
(SELECT L1.ID1 AS ID1, L1.ID2 AS ID2
FROM Likes L1, Likes L2
WHERE L1.ID1 = L2.ID2 AND L1.ID2=L2.ID1) AS table1
WHERE table1.ID1 = h1.ID AND table1.ID2 = h2.ID AND h1.name<h2.name