### Course-Catalog XPath and XQuery  

#### Q1:
Return all Title elements (of both departments and courses).   
**Answer**:  
--XPath
```XPath
doc("courses.xml")/Course_Catalog//Title
```
#### Q2:
Return last names of all department chairs.   
**Answer**:  
--XPath
```XPath
doc("courses.xml")/Course_Catalog/Department/Chair//Last_Name
```
#### Q3:
Return titles of courses with enrollment greater than 500.  
**Answer**:  
--XPath
```XPath
doc("courses.xml")/Course_Catalog/Department/Course[@Enrollment>500]/Title
```
#### Q4:
Return titles of departments that have some course that takes "CS106B" as a prerequisite.
**Answer**:  
--XPath
```XPath
doc("courses.xml")/Course_Catalog/Department[Course/Prerequisites/Prereq="CS106B"]/Title
```
#### Q5:  
Return last names of all professors or lecturers who use a middle initial. Don't worry about eliminating duplicates.  
**Answer**:  
--XPath
```XPath
doc("courses.xml")//(Professor[Middle_Initial]|Lecturer[Middle_Initial])/Last_Name
```
#### Q6:
Return the count of courses that have a cross-listed course (i.e., that have "Cross-listed" in their description).   
**Answer**:  
--XPath
```XPath
count(doc("courses.xml")/Course_Catalog/Department/Course[contains(Description, "Cross-listed")]/Title)
```
### Q7:
Return the average enrollment of all courses in the CS department.  
**Answer**:  
--XPath
```XPath
avg(doc("courses.xml")/Course_Catalog/Department[@Code="CS"]/Course/data(@Enrollment))
```
### Q8:
Return last names of instructors teaching at least one course that has "system" in its description and enrollment greater than 100.   
**Answer**:  
--XPath
```XPath
doc("courses.xml")/Course_Catalog/Department/
Course[contains(Description, "system") and @Enrollment>100]/Instructors/*/Last_Name
```
### Q9:
Return the title of the course with the largest enrollment.  
**Answer**:  
--XPath
```XPath
doc("courses.xml")/Course_Catalog/Department/Course[@Enrollment = max(//Course/data(@Enrollment))]/Title
```
