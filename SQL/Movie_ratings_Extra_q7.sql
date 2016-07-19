SELECT m.title, AVG(r1.stars) AS avg
FROM Movie m JOIN Rating r1 USING (mID)
GROUP BY m.title
ORDER BY avg DESC, m.title ASC