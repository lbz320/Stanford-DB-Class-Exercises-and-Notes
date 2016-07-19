SELECT m.title, MAX(r.stars)
FROM Movie m JOIN Rating r USING(mID)
GROUP BY m.title
ORDER BY m.title