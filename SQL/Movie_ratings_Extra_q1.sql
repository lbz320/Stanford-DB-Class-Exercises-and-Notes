SELECT DISTINCT r.name
FROM Movie m  JOIN Rating USING (mID) 
			JOIN Reviewer r USING (rID)
WHERE m.title='Gone with the Wind'