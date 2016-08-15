--Q2
--Write one or more triggers to manage the grade attribute of new Highschoolers. If the inserted tuple has a value less than 9 or greater than 12, change the value to NULL. On the other hand, if the inserted tuple has a null value for grade, change it to 9. 

CREATE TRIGGER t2

AFTER INSERT ON Highschooler
FOR EACH ROW
WHEN (New.grade>12 OR New.grade<9)
BEGIN
	UPDATE Highschooler
	SET grade=NULL
	WHERE id = New.id
	;
END;

CREATE TRIGGER t3

AFTER INSERT ON Highschooler
FOR EACH ROW
WHEN NEW.grade IS NULL
BEGIN
	UPDATE Highschooler
	SET grade=9
	WHERE id=New.id;
END;
