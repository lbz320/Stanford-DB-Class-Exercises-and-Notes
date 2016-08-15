SELECT m.title, (MAX(r.stars)-MIN(r.stars)) AS spread
FROM Movie m JOIN Rating r USING(mID)
GROUP BY m.title
ORDER BY spread DESC, m.title