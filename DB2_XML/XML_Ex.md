# DTD Exercise

## Q1:
In this question, you are to create a DTD for a small XML data set drawn from the Stanford course catalog. There are multiple departments, each with a department chair, some courses, and professors and/or lecturers who teach courses.

**Answer**:
```DTD
<!ELEMENT Course_Catalog (Department*)>
    <!ELEMENT Department (Title, Chair, Course*)>
    <!ATTLIST Department Code CDATA #REQUIRED>
        <!ELEMENT Title (#PCDATA)>
        <!ELEMENT Chair (Professor)>
            <!ELEMENT Professor (First_Name, Middle_Initial*, Last_Name)>
            <!ELEMENT First_Name (#PCDATA)>
            <!ELEMENT Middle_Initial (#PCDATA)>
            <!ELEMENT Last_Name (#PCDATA)>
        <!ELEMENT Course (Title, Description?, Instructors, Prerequisites?)>
        <!ATTLIST Course Number CDATA #REQUIRED Enrollment CDATA #IMPLIED>
            <!ELEMENT Description (#PCDATA)>
            <!ELEMENT Instructors (Professor | Lecturer)*>
            <!ELEMENT Lecturer (First_Name, Middle_Initial?, Last_Name)>
            <!ELEMENT Prerequisites (Prereq+)>
            <!ELEMENT Prereq (#PCDATA)>
```

## Q2:
In this question, you are to create a DTD for a different version of the data set drawn from the Stanford course catalog. This version encodes the data using ID and IDREF(S) attributes.

**Answer**:
```DTD
<!ELEMENT Course_Catalog (Department*)>
  <!ELEMENT Department (Title, Course*, (Professor|Lecturer)*)>
  <!ATTLIST Department Code CDATA #REQUIRED Chair IDREF #REQUIRED>
    <!ELEMENT Title (#PCDATA)>
    <!ELEMENT Course (Title, Description?)>
    <!ATTLIST Course Number ID #REQUIRED
                     Prerequisites IDREFS #IMPLIED
                     Instructors IDREFS #REQUIRED
                     Enrollment CDATA #IMPLIED>
      <!ELEMENT Description (#PCDATA|Courseref)*>
        <!ELEMENT Courseref EMPTY>
        <!ATTLIST Courseref Number IDREFS #REQUIRED>
    <!ELEMENT Professor (First_Name, Middle_Initial?, Last_Name)>
         <!ATTLIST Professor InstrID ID #REQUIRED>
             <!ELEMENT First_Name (#PCDATA)>
             <!ELEMENT Middle_Initial (#PCDATA)>
             <!ELEMENT Last_Name (#PCDATA)>
         <!ELEMENT Lecturer (First_Name, Middle_Initial?, Last_Name)>
         <!ATTLIST Lecturer InstrID ID #REQUIRED>
```

## Q3:
In this question, you are to create a DTD for a small XML data set about world countries. This data is adapted from the Mondial 3.0 database as hosted by the University of Washington, and was originally compiled by the Georg-August University of Goettingen Institute for Informatics. Each country has a name, population, and area (in sq. km). Some countries also list languages (with percentages of the population that speaks each language) and/or cities (with names and populations).

**Answer**:  
```DTD
<!ELEMENT countries (country*)>
    <!ELEMENT country (city*, language*)>
    <!ATTLIST country name CDATA #REQUIRED
                      population CDATA #REQUIRED
                      area CDATA #REQUIRED>
        <!ELEMENT city (name, population)>
            <!ELEMENT name (#PCDATA)>
            <!ELEMENT population (#PCDATA)>
        <!ELEMENT language (#PCDATA)>
        <!ATTLIST language percentage CDATA #REQUIRED>
```
