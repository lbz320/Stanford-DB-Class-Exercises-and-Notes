--Q6
--Write a trigger to enforce the following behavior: If A liked B but is updated to A liking C instead, and B and C were friends, make B and C no longer friends. Don't forget to delete the friendship in both directions, and make sure the trigger only runs when the "liked" (ID2) person is changed but the "liking" (ID1) person is not changed. 

CREATE TRIGGER t8
AFTER UPDATE ON Likes
FOR EACH ROW
WHEN (New.ID2!=Old.ID2 AND New.ID1=Old.ID1)
BEGIN
	DELETE FROM Friend
	WHERE (ID1=New.ID2 AND ID2=Old.ID2) OR (ID1=OLD.ID2 AND ID2=New.ID2);
END