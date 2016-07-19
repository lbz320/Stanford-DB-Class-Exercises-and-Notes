SELECT DISTINCT table1.name, table2.name
FROM (Rating JOIN Reviewer USING(rID)) table1, (Rating JOIN Reviewer USING(rID)) table2
WHERE table1.mID = table2.mID AND table1.name< table2.name
ORDER BY table1.name, table2.name


