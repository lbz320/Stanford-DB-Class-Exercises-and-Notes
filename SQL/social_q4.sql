SELECT name, grade
FROM Highschooler
WHERE ID NOT IN
(SELECT h.ID
FROM Highschooler h, Likes l
WHERE h.ID = l.ID1 OR h.ID = l.ID2)
ORDER BY grade, name