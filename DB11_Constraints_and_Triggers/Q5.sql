--Q5
--Write a trigger that automatically deletes students when they graduate, i.e., when their grade is updated to exceed 12 (same as Question 4). In addition, write a trigger so when a student is moved ahead one grade, then so are all of his or her friends. 

CREATE TRIGGER t6
AFTER UPDATE ON Highschooler
WHEN (New.grade>12)
BEGIN
	DELETE FROM Highschooler
	WHERE id=New.id;
END

CREATE TRIGGER t7
AFTER UPDATE ON Highschooler
WHEN (New.grade = Old.grade+1)
BEGIN
	UPDATE Highschooler
	SET grade=grade+1
	WHERE ID IN (SELECT ID2 FROM Friend
							WHERE ID1=New.ID);
END;
