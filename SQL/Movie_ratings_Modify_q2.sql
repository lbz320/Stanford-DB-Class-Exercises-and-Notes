--Insert 5-star ratings by James Cameron for all movies in the database. Leave the review date as NULL. 

INSERT INTO Rating 
	SELECT Rating.rID, Movie.mID, 5 AS stars, NULL AS ratingDate
	FROM Rating, Movie, Reviewer
	WHERE Rating.rID = Reviewer.rID
					AND Reviewer.name = 'James Cameron'