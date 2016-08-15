SELECT title, director 
FROM Movie 
WHERE director IN
(SELECT table1.director
FROM Movie table1, Movie table2
WHERE table1.director=table2.director AND table1.title<table2.title
)
ORDER BY director, title

--SELECT title, director 
--FROM Movie
--WHERE director IN
--(SELECT director
--FROM Movie
--GROUP BY director
--HAVING COUNT(title)>1)
--ORDER BY director, title