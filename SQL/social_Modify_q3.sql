--For all cases where A is friends with B, and B is friends with C, add a new friendship for the pair A and C. Do not add duplicate friendships, friendships that already exist, or friendships with oneself. (This one is a bit challenging; congratulations if you get it right.) 

INSERT INTO Friend
SELECT A,C 
FROM (
SELECT f1.ID1 AS A, f2.ID2 AS C
FROM Friend f1, Friend f2
WHERE f1.ID2 = f2.ID1 AND f2.ID2!= f1.ID1
EXCEPT 
SELECT *
FROM Friend)
