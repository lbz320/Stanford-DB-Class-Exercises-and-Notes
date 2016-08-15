SELECT AVG(early.avg_ratings) - AVG(late.avg_ratings)
FROM 
(SELECT m.title, AVG(r.stars) AS avg_ratings
FROM Movie m JOIN Rating r USING (mID)
WHERE m.year<1980
GROUP BY m.title) AS early,
(SELECT m.title, AVG(r.stars) AS avg_ratings
FROM Movie m JOIN Rating r USING (mID)
WHERE m.year>=1980
GROUP BY m.title) AS late