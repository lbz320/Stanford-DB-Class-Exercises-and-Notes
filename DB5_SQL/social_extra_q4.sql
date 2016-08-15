SELECT COUNT(DISTINCT F1.ID2) + COUNT(DISTINCT F2.ID2)
FROM Friend f1, Friend f2, Highschooler h
WHERE h.name = 'Cassandra' AND h.ID = f1.ID1
AND f2.ID1 = f1.ID2 AND f2.ID1 != f1.ID1 AND f2.ID2 !=f1.ID1