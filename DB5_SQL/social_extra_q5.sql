SELECT h.name, h.grade
FROM Highschooler h,
(SELECT ID1
FROM Friend
GROUP BY ID1
HAVING COUNT(ID2) = (SELECT MAX(CT)
FROM 
(SELECT ID1, COUNT(ID2) AS CT
FROM Friend
GROUP BY ID1) AS table1)) AS table2
WHERE h.ID = table2.ID1

--Alternative solution

--SELECT h.name, h.grade
--FROM Highschooler h,
--(SELECT ID1
--FROM Friend
--EXCEPT
--SELECT DISTINCT table1.ID1
--FROM
--(SELECT ID1, COUNT(ID2) AS Fct
--FROM Friend
--GROUP BY ID1) AS table1,
--(SELECT ID1, COUNT(ID2) AS Fct
--FROM Friend
--GROUP BY ID1) AS table2
--WHERE table1.Fct<table2.Fct) AS final_ID
--WHERE h.ID = final_ID.ID1
--ORDER BY h.grade DESC

