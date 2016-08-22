### Course-Catalog XPath and XQuery Extra Ex
#### Q1:
Return the course number of the course that is cross-listed as "LING180".    
**Answer**:  
--XPath
```XPath
doc("courses.xml")/Course_Catalog/Department/Course[contains(Description, "LING180")]/data(@Number)
```
#### Q2:
Return course numbers of courses that have the same title as some other course.  
**Answer**:  
--XPath
```XPath
doc("courses.xml")/Course_Catalog/Department/Course[Title = preceding::Course/Title
or Title = following::Course/Title]/data(@Number)
```
#### Q3:
Return course numbers of courses taught by an instructor with first name "Daphne" or "Julie".  
**Answer**:  
--XPath
```XPath
doc("courses.xml")/Course_Catalog/Department/Course[Instructors/*/First_Name = 'Daphne'
or Instructors/*/First_Name='Julie']/data(@Number)
```
#### Q4:
Return the number (count) of courses that have no lecturers as instructors.  
**Answer**:  
--XPath
```XPath
count(doc("courses.xml")/Course_Catalog/Department/Course[not(Instructors/*/name()='Lecturer')])
```
#### Q5:
Return titles of courses taught by the chair of a department. For this question, you may assume that all professors have distinct last names.  
**Answer**:  
--XPath
```XPath
doc("courses.xml")/Course_Catalog/Department/Course[Instructors/*/Last_Name = //Chair/*/Last_Name]/Title
```
#### Q6:
Return titles of courses that have both a lecturer and a professor as instructors. Return each title only once.  
**Answer**:  
--XPath
```XPath
doc("courses.xml")/Course_Catalog/Department/Course[Instructors/*/name()='Lecturer' and
Instructors/*/name()='Professor']/Title
```
#### Q7:
Return titles of courses taught by a professor with the last name "Ng" but not by a professor with the last name "Thrun".  
**Answer**:  
--XPath
```XPath
doc("courses.xml")/Course_Catalog/Department/Course[Instructors/Professor/
Last_Name='Ng' and not(Instructors/Professor/Last_Name='Thrun')]/Title
```
#### Q8:
Return course numbers of courses that have a course taught by Eric Roberts as a prerequisite.  
**Answer**:  
--XPath
```XPath
doc("courses.xml")/Course_Catalog/Department/Course[Prerequisites/Prereq=
//Course[Instructors/*/First_Name='Eric' and Instructors/*/Last_Name='Roberts']/data(@Number)
]/data(@Number)
```
#### Q9:
Create a summary of CS classes: List all CS department courses in order of enrollment. For each course include only its Enrollment (as an attribute) and its Title (as a subelement).  
**Answer**:  
--XQuery
```XQuery
<Summary>
  {
    for $course in doc("courses.xml")/Course_Catalog/Department[@Code='CS']/Course
    order by xs:integer($course/data(@Enrollment))
    return
      <Course>
        {$course/@Enrollment}
        {$course/Title}
      </Course>
  }
</Summary>
```
### Q10:
Return a "Professors" element that contains as subelements a listing of all professors in all departments, sorted by last name with each professor appearing once. The "Professor" subelements should have the same structure as in the original data. For this question, you may assume that all professors have distinct last names.  
**Answer**:
--XQuery
```XQuery
<Professors>  
       {
       for $last in distinct-values(doc("courses.xml") //Professor/Last_Name)
       let $p := doc("courses.xml") //Professor[Last_Name=$last]
       for $first in distinct-values($p/First_Name)
       order by $last
       return
       <Professor>
           <First_Name>{$first}</First_Name>
           {$p/Middle_Initial}
           <Last_Name>{$last}</Last_Name>
       </Professor>}
</Professors>
```
### Q11:
Expanding on the previous question, create an inverted course listing: Return an "Inverted_Course_Catalog" element that contains as subelements professors together with the courses they teach, sorted by last name. You may still assume that all professors have distinct last names. The "Professor" subelements should have the same structure as in the original data, with an additional single "Courses" subelement under Professor, containing a further "Course" subelement for each course number taught by that professor. Professors who do not teach any courses should have no Courses subelement at all.  
**Answer**:  
--XQuery
```XQuery
<Inverted_Course_Catalog>  
        {
        for $last in distinct-values(doc("courses.xml")//Professor/Last_Name)
        let $p := doc("courses.xml") //Professor[Last_Name=$last]
        for $first in distinct-values($p/First_Name)
        let $c := doc("courses.xml")//Course[Instructors/*/Last_Name=$last]
        order by $last
        return
        <Professor>
            <First_Name>{$first}</First_Name>
            {$p/Middle_Initial}
            <Last_Name>{$last}</Last_Name>
                {
                if (count($c)>0)
                then
                <Courses>
                {for $singlec in $c
                return
                <Course>{$singlec/data(@Number)}</Course>}
                </Courses>

                else ()
                }
        </Professor>}
 </Inverted_Course_Catalog>
```
