## View Modification Exercises
### Q1:
Write an instead-of trigger that enables updates to the title attribute of view LateRating.
Policy: Updates to attribute title in LateRating should update Movie.title for the corresponding movie. (You may assume attribute mID is a key for table Movie.) Make sure the mID attribute of view LateRating has not also been updated --
if it has been updated, don't make any changes. Don't worry about updates to stars or ratingDate.

**Answer:**
```SQL
CREATE TRIGGER t1
INSTEAD OF UPDATE ON LateRating
FOR EACH ROW
WHEN Old.mID = New.mID
BEGIN
    UPDATE Movie
    SET title = New.title
    WHERE mID = Old.mID AND title = Old.title;
 END
```

### Q2:
Write an instead-of trigger that enables updates to the stars attribute of view LateRating.
Policy: Updates to attribute stars in LateRating should update Rating.stars for the corresponding movie rating. (You may assume attributes [mID,ratingDate] together are a key for table Rating.) Make sure the mID and ratingDate attributes of view LateRating have not also been updated --
if either one has been updated, don't make any changes. Don't worry about updates to title.

**Answer:**

```SQL
CREATE TRIGGER t2
INSTEAD OF UPDATE ON LateRating
FOR EACH ROW
WHEN Old.mID = New.mID
BEGIN
    UPDATE Movie
    SET title = New.title
    WHERE mID = Old.mID AND title = Old.title;
 END

```

### Q3:
Write an instead-of trigger that enables updates to the mID attribute of view LateRating.
Policy: Updates to attribute mID in LateRating should update Movie.mID and Rating.mID for the corresponding movie. Update all Rating tuples with the old mID, not just the ones contributing to the view. Don't worry about updates to title, stars, or ratingDate.  

**Answer:**

```SQL
CREATE TRIGGER t3
INSTEAD OF UPDATE ON LateRating
FOR EACH ROW
BEGIN
    UPDATE Rating
    SET mID = New.mID
    WHERE mID = Old.mID;
    UPDATE Movie
    SET mID = New.mID
    WHERE mID = Old.mID;
 END
```

### Q4:
Finally, write a single instead-of trigger that combines all three of the previous triggers to enable simultaneous updates to attributes mID, title, and/or stars in view LateRating. Combine the view-update policies of the three previous problems, with the exception that mID may now be updated. Make sure the ratingDate attribute of view LateRating has not also been updated -- if it has been updated, don't make any changes.

**Answer:**

```SQL
CREATE TRIGGER t4
INSTEAD OF DELETE ON LateRating
FOR EACH ROW
WHEN Old.ratingDate = New.ratingDate
BEGIN
    UPDATE Movie
    SET mID = New.mID, title = New.title
    WHERE mID = Old.mID;
    UPDATE Rating
    SET mID = New.mID
    WHERE mID = Old.mID;
    UPDATE Rating
    SET stars = New.stars
    WHERE mID = New.mID AND stars = Old.stars;
 END
```

### Q5:
Write an instead-of trigger that enables deletions from view HighlyRated.
Policy: Deletions from view HighlyRated should delete all ratings for the corresponding movie that have stars > 3.

**Answer:**

```SQL
CREATE TRIGGER t5
INSTEAD OF DELETE ON HighlyRated
FOR EACH ROW
BEGIN
    DELETE FROM Rating
    WHERE mID = Old.mID AND stars>3;
 END
```

### Q6:
Write an instead-of trigger that enables deletions from view HighlyRated.
Policy: Deletions from view HighlyRated should update all ratings for the corresponding movie that have stars > 3 so they have stars = 3.

**Answer:**

```SQL
CREATE TRIGGER t6
INSTEAD OF DELETE ON HighlyRated
FOR EACH ROW
BEGIN
    UPDATE Rating
    SET stars =3
    WHERE mID = Old.mID AND stars>3;
 END
```

### Q7:
Write an instead-of trigger that enables insertions into view HighlyRated.
Policy: An insertion should be accepted only when the (mID,title) pair already exists in the Movie table. (Otherwise, do nothing.) Insertions into view HighlyRated should add a new rating for the inserted movie with rID = 201, stars = 5, and NULL ratingDate

**Answer:**

```SQL
CREATE TRIGGER t7
INSTEAD OF INSERT ON HighlyRated
FOR EACH ROW
WHEN EXISTS (SELECT * FROM Movie m WHERE m.mID = New.mID AND m.title = New.title)
BEGIN
    INSERT INTO Rating
    (rID, mID, stars, ratingDate)
    VALUES (201, New.mID, 5, NULL)
    ;
 END
```

### Q8:
Write an instead-of trigger that enables insertions into view NoRating.
Policy: An insertion should be accepted only when the (mID,title) pair already exists in the Movie table. (Otherwise, do nothing.) Insertions into view NoRating should delete all ratings for the corresponding movie.

**Answer:**

```SQL
CREATE TRIGGER t8
INSTEAD OF INSERT ON Norating
FOR EACH ROW
WHEN EXISTS (SELECT * FROM Movie m WHERE m.mID = New.mID AND m.title = New.title)
BEGIN
    DELETE FROM Rating
    WHERE mID = New.mID;
 END
```

### Q9:
Write an instead-of trigger that enables deletions from view NoRating.
Policy: Deletions from view NoRating should delete the corresponding movie from the Movie table.

**Answer:**

```SQL
CREATE TRIGGER t9
INSTEAD OF DELETE ON NoRating
FOR EACH ROW
BEGIN
    DELETE FROM Movie
    WHERE mID = Old.mID;
 END
```

### Q10:
Write an instead-of trigger that enables deletions from view NoRating.
Policy: Deletions from view NoRating should add a new rating for the deleted movie with rID = 201, stars = 1, and NULL ratingDate.

**Answer:**

```SQL
CREATE TRIGGER t10
INSTEAD OF DELETE ON NoRating
FOR EACH ROW
BEGIN
    INSERT INTO Rating
    (rID, mID, stars, ratingDate)
    values (201, Old.mID, 1, NULL);
 END
```
