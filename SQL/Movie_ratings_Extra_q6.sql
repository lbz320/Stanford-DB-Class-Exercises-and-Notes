SELECT r2.name, m.title, r1.stars
FROM Movie m, Rating r1, Reviewer r2
WHERE m.mID = r1.mID AND r2.rID = r1.rID
AND r1.stars = (SELECT min(stars) FROM Rating)