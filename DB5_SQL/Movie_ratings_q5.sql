SELECT r1.name AS Reviewer_Name, m.title AS Movie_title, 
			r2.stars AS Stars, r2.ratingDate AS Rating_Date
FROM Movie m JOIN Rating r2 USING (mID) JOIN Reviewer r1 USING(rID)
ORDER BY Reviewer_Name, Movie_title, Stars