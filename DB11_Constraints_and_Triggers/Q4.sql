--Q4
--Write a trigger that automatically deletes students when they graduate, i.e., when their grade is updated to exceed 12. 

CREATE TRIGGER t6
AFTER UPDATE ON Highschooler
WHEN (New.grade>12)
BEGIN
	DELETE FROM Highschooler
	WHERE id=New.id;
END