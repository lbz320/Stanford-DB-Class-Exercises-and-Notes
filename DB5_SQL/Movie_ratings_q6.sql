SELECT r.name, m.title
FROM
(SELECT * 
FROM Rating AS r JOIN (SELECT rID, mID
FROM Rating
WHERE ratingDate IS NOT NULL
GROUP BY rID, mID
HAVING COUNT(mID)>1) AS subrating USING (rID, mID)) 
AS table1
JOIN
(SELECT * 
FROM Rating AS r JOIN (SELECT rID, mID
FROM Rating
WHERE ratingDate IS NOT NULL
GROUP BY rID, mID
HAVING COUNT(mID)>1) AS subrating USING (rID, mID)) 
AS table2
ON (table1.rID=table2.rID AND table1.mID=table2.mID AND table1.ratingDate<table2.ratingDate)
JOIN Movie AS m ON table1.mID=m.mID
JOIN Reviewer AS r ON table1.rID=r.rID
WHERE table1.stars<table2.stars