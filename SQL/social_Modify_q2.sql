--If two students A and B are friends, and A likes B but not vice-versa, remove the Likes tuple. 
DELETE FROM Likes
WHERE ID1 IN(SELECT ID1 FROM
(SELECT *
FROM Likes
INTERSECT
SELECT *
FROM Friend
EXCEPT
SELECT L1.ID1, L1.ID2
FROM Likes L1, Likes L2
WHERE L1.ID1 = L2.ID2 AND L1.ID2 = L2.ID1))