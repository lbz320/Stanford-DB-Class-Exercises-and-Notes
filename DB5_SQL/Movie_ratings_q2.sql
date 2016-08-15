SELECT DISTINCT m.year
FROM Movie m JOIN Rating r USING (mID)
WHERE r.stars in (4,5)
ORDER BY 1 ASC