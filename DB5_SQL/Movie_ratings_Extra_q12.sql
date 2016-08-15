SELECT director, title, stars
FROM Movie JOIN Rating USING(mID)
WHERE director IS NOT NULL
GROUP BY director
