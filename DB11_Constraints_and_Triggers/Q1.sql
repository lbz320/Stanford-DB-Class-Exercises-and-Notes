--Q1
--Write a trigger that makes new students named 'Friendly' automatically like everyone else in their grade. That is, after the trigger runs, we should have ('Friendly', A) in the Likes table for every other Highschooler A in the same grade as 'Friendly'.

CREATE TRIGGER t1

AFTER INSERT ON Highschooler
FOR EACH ROW
WHEN (New.name='Friendly')
BEGIN
	insert into Likes
	select New.ID, h.ID
	from Highschooler as h
	where h.grade=New.grade and h.name!='Friendly';
END
