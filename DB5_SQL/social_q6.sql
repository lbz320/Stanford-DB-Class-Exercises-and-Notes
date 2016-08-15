SELECT name, grade
FROM Highschooler h,
(SELECT ID1
FROM Friend
EXCEPT
SELECT ID1
FROM Highschooler h1, Highschooler h2, Friend f
WHERE f.ID1 = h1.ID AND f.ID2 = h2.ID AND h1.grade != h2.grade) AS IDs
WHERE IDs.ID1 = h.ID
ORDER BY grade, name

