SELECT h1.name, h1.grade, h2.name, h2.grade, h3.name, h3.grade
FROM Highschooler h1, Highschooler h2, Highschooler h3,
(SELECT L1.ID1 AS A, L1.ID2 AS B, L2.ID2 AS C
FROM Likes L1, Likes L2
WHERE L2.ID1 = L1.ID2 AND L2.ID2 != L1.ID1) AS trios
WHERE A = h1.ID AND B = h2.ID AND C=h3.ID