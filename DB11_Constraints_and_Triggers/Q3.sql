--Q3
--Write one or more triggers to maintain symmetry in friend relationships. Specifically, if (A,B) is deleted from Friend, then (B,A) should be deleted too. If (A,B) is inserted into Friend then (B,A) should be inserted too. Don't worry about updates to the Friend table. 

CREATE TRIGGER t4
AFTER DELETE ON Friend
FOR EACH ROW
BEGIN
	DELETE FROM Friend
	WHERE Friend.ID1=OLD.ID2 AND FRIEND.ID2=OLD.ID1;
END

CREATE TRIGGER t5

AFTER INSERT ON Friend
FOR EACH ROW
BEGIN
	INSERT INTO Friend
	VALUES (New.ID2, New.ID1);
END