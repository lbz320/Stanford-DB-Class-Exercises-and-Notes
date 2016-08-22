### XSLT Exercise
#### Course-Catalog-Q1
Return a list of department titles.  
**Answer**:
```XSLT
<?xml version="1.0" encoding="ISO-8859-1"?>
    <xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
        <xsl:template match="Department/Title">
            <xsl:copy-of select="." />
        </xsl:template>
        <xsl:template match="text()" />
    </xsl:stylesheet>
```
#### Course-Catalog-Q2
Return a list of department elements with no attributes and two subelements each: the department title and the entire Chair subelement structure.  
**Answer**:
```XSLT
<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="Department">
        <Department>
        <Title><xsl:value-of select="Title" /></Title>
        <xsl:copy-of select="Chair" />
        </Department>
    </xsl:template>
</xsl:stylesheet>
```
#### Course-Catalog-Extra-Q1
Return all courses with enrollment greater than 500. Retain the structure of Course elements from the original data.  
**Answer**:
```XSLT
<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="Course[@Enrollment &gt; 500]">
       <xsl:copy-of select="." />
    </xsl:template>
    <xsl:template match="text()" />
</xsl:stylesheet>
```
#### Course-Catalog-Extra-Q2
Remove from the data all courses with enrollment greater than 60, or with no enrollment listed. Otherwise the structure of the data should be the same.  
**Answer**:
```XSLT
<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="*|@*|text()">
    <xsl:copy>
      <xsl:apply-templates select="*|@*|text()" />
    </xsl:copy>
  </xsl:template>
  <xsl:template match='Course[@Enrollment &gt; 60 or not(@Enrollment)]' />
</xsl:stylesheet>
```
#### Course-Catalog-Extra-Q3
Create a summarized version of the EE part of the course catalog. For each course in EE, return a Course element, with its Number and Title as attributes, its Description as a subelement, and the last name of each instructor as an Instructor subelement. Discard all information about department titles, chairs, enrollment, and prerequisites, as well as all courses in departments other than EE.  
**Answer**:
```XSLT
<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="Department[@Code='EE']/Course">
    <Course Title="{Title}">
      <xsl:copy-of select="@Number" />
      <xsl:copy-of select="Description" />
      <xsl:for-each select="Instructors/*">
        <Instructor>
          <xsl:value-of select="Last_Name" />
        </Instructor>
      </xsl:for-each>
    </Course>
  </xsl:template>
  <xsl:template match="text()" />
</xsl:stylesheet>
```
#### World-Countries-Q1
Return all countries with population between 9 and 10 million. Retain the structure of country elements from the original data.  
**Answer**:
```XSLT
<?xml version="1.0" encoding="ISO-8859-1"?>
    <xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
        <xsl:template match="country[@population &gt; 9000000 and @population &lt; 10000000]">
            <xsl:copy-of select="." />
        </xsl:template>
        <xsl:template match="text()" />
    </xsl:stylesheet>
```
#### World-Countries-Q2
Create a table using HTML constructs that lists all countries that have more than 3 languages. Each row should contain the country name in bold, population, area, and number of languages. Sort the rows in descending order of number of languages. No header is needed for the table, but use <table border="1"> to make it format nicely, should you choose to check your result in a browser.  
**Answer**:
```XSLT
<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:template match="/countries">
   <html>
       <table border="1">
           <xsl:for-each select="country[count(language) &gt; 3]">
           <xsl:sort select="count(language)" data-type="number" order="descending" />
               <tr>
               <td><b><xsl:value-of select='@name' /></b></td>
               <td><xsl:value-of select='@population' /></td>
               <td><xsl:value-of select='@area' /></td>
               <td><xsl:value-of select='count(language)' /></td>
               </tr>         
          </xsl:for-each>
       </table>
    </html>
   </xsl:template>
<xsl:template match="text()" />
</xsl:stylesheet>
```
#### World-Countries-Q3
Create an alternate version of the countries database: for each country, include its name and population as sublements, and the number of languages and number of cities as attributes (called "languages" and "cities" respectively).  
**Answer**:
```XSLT
<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match='/'>
        <countries>
          <xsl:apply-templates />
        </countries>
    </xsl:template>
    <xsl:template match='country'>
        <country languages='{count(language)}' cities='{count(city)}'>
            <name><xsl:value-of select='@name'/> </name>
            <population><xsl:value-of select='@population'/> </population>
        </country>
    </xsl:template>
</xsl:stylesheet>
```
#### World-Countries-Extra-Q1
Find all country names containing the string "stan"; return each one within a "Stan" element.  
**Answer**:
```XSLT
<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="country[contains(@name, 'stan')]">
        <Stan>
            <xsl:value-of select='@name'/>
        </Stan>
    </xsl:template>
    <xsl:template match='text()' />
</xsl:stylesheet>
```
#### World-Countries-Extra-Q2
Remove from the data all countries with area greater than 40,000 and all countries with no cities listed. Otherwise the structure of the data should be the same.  
**Answer**:
```XSLT
<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
    <countries>
        <xsl:for-each select="countries/country">
            <xsl:if test="@area &lt; 40000 and count(city) &gt; 0">
                <xsl:copy-of select="." />
            </xsl:if>
        </xsl:for-each>
    </countries>
    </xsl:template>  
    <xsl:template match='text()' />
</xsl:stylesheet>Â
```
