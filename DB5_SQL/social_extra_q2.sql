SELECT h.name, h.grade
FROM Highschooler h,
(SELECT ID1
FROM Likes
EXCEPT
SELECT DISTINCT h1.ID
FROM Highschooler h1, Highschooler h2, Friend f
WHERE f.ID1 = h1.ID AND f.ID2 = h2.ID and h1.grade = h2.grade
) AS IDs
WHERE h.ID = IDs.ID1