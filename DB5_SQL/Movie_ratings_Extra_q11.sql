SELECT title, avg
FROM Movie JOIN
(SELECT mID, AVG(stars) AS avg
FROM Rating
GROUP BY mID) USING (mID)
WHERE avg=
(
SELECT MIN(avg)
FROM Movie m JOIN
(SELECT mID, AVG(stars) AS avg
FROM Rating
GROUP BY mID
) AS table1
USING (mID)
ORDER BY avg
)