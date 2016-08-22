### World-Countries Ex
#### Q1
Return the area of Mongolia.   
**Answer:**  
--XPath
```XPath
doc("countries.xml")/countries/country[@name="Mongolia"]/data(@area)
```
#### Q2
Return the names of all cities that have the same name as the country in which they are located.  
**Answer:**  
--XPath
```XPath
doc("countries.xml")/countries/country/city[name = parent::*/@name]/name
```
#### Q3
Return the average population of Russian-speaking countries.   
**Answer:**  
--XPath
```XPath
avg(doc("countries.xml")/countries/country[language="Russian"]/data(@population))
```
#### Q4
Return the names of all countries that have at least three cities with population greater than 3 million.   
**Answer:**  
--XPath
```XPath
doc("countries.xml")/countries/country[count(city[population>=3000000])>2]/data(@name)
```
#### Q5
Create a list of French-speaking and German-speaking countries.  
**Answer:**  
--XQuery
```XQuery
<result>
    <French>
    {for $f in  distinct-values(doc("countries.xml")/countries/country[language="French"]/data(@name))   
    return
            <country> {$f} </country>}
    </French>
    <German>
    {for $g in  distinct-values(doc("countries.xml")/countries/country[language="German"]/data(@name))   
    return
            <country> {$g} </country>}
    </German>
</result>
```
#### Q6
Return the countries with the highest and lowest population densities.  
**Answer:**  
--XQuery
```XQuery
let $hd := doc("countries.xml")/countries/country[(@population div @area) = max(//country/data(@population div @area))]
let $ld := doc("countries.xml")/countries/country[(@population div @area) = min(//country/data(@population div @area))]
return
    <result>
        <highest density="{$hd/data(@population div @area)}">
            {$hd/data(@name)}
        </highest>
        <lowest density="{$ld/data(@population div @area)}">
            {$ld/data(@name)}
        </lowest>
    </result>
```
