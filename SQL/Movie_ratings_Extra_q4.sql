SELECT DISTINCT title 
FROM Movie
WHERE title NOT IN
	(SELECT m.title
	FROM Movie m JOIN Rating r1 USING (mID) JOIN Reviewer r2
				USING (rID)
				WHERE r2.name = 'Chris Jackson')


