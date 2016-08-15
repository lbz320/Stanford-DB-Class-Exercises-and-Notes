SELECT r2.name
FROM Reviewer r2 JOIN Rating r1 USING(rID)
GROUP BY r2.name
HAVING COUNT(r1.mID)>2


