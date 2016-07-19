SELECT r1.name
FROM Reviewer r1 JOIN Rating r2 USING (rID)
WHERE r2.ratingDate IS NULL