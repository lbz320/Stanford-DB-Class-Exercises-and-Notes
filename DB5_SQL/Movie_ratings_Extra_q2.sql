SELECT DISTINCT r1.name, m.title, r2.stars
FROM Movie m  JOIN Rating r2 USING (mID)
			JOIN Reviewer r1 USING (rID)
WHERE m.director=r1.name