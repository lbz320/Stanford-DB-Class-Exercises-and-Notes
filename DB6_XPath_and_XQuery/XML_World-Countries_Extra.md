### World-Countries Extra Ex
#### Q1
Return the names of all countries with population greater than 100 million.  
**Answer:**  
--XPath
```XPath
doc("countries.xml")/countries/country[@population>100000000]/data(@name)
```
#### Q2
Return the names of all countries where over 50% of the population speaks German.  
**Answer:**  
--XPath
```XPath
doc("countries.xml")/countries/country/language[data(.) = 'German' and @percentage > 50]/parent::country/data(@name)
```
#### Q3
Return the names of all countries where a city in that country contains more than one-third of the country's population.  
**Answer:**  
--XPath
```XPath
doc("countries.xml")/countries/country[city/population > 0.33*@population]/data(@name)
```
#### Q4
Return the population density of Qatar.  
**Answer:**  
--XPath
```XPath
doc("countries.xml")/countries/country[@name='Qatar']/data(@population div @area)
```
#### Q5
Return the names of all countries whose population is less than one thousandth that of some city (in any country).  
**Answer:**  
--XPath
```XPath
doc("countries.xml")/countries/country[@population*1000 < following-sibling::*/city/population
or @population*1000 < preceding-sibling::*/city/population]/data(@name)
```
#### Q6
Return all city names that appear more than once, i.e., there is more than one city with that name in the data. Return only one instance of each such city name.  
**Answer:**  
--XPath
```XPath
doc("countries.xml")/countries/country/city[name= following::city/name]/name
```
#### Q7
Return the names of all countries containing a city such that some other country has a city of the same name.  
**Answer:**  
--XPath
```XPath
doc("countries.xml")/countries/country[city/name=following::city/name or city/name=preceding::city/name]/data(@name)
```
#### Q8
Return the names of all countries whose name textually contains a language spoken in that country. For instance, Uzbek is spoken in Uzbekistan, so return Uzbekistan.  
**Answer:**  
--XPath
```XPath
doc("countries.xml")/countries/country[language[contains(../@name, .)]]/data(@name)
```
#### Q9
Return the names of all countries in which people speak a language whose name textually contains the name of the country. For instance, Japanese is spoken in Japan, so return Japan.  
**Answer:**  
--XPath
```XPath
doc("countries.xml")/countries/country[language[contains(., ../@name)]]/data(@name)
```
#### Q10
Return all languages spoken in a country whose name textually contains the language name. For instance, German is spoken in Germany, so return German.  
**Answer:**  
--XPath
```XPath
doc("countries.xml")/countries/country/data(language[contains(../@name,.)])
```
#### Q11
Return all languages whose name textually contains the name of a country in which the language is spoken. For instance, Icelandic is spoken in Iceland, so return Icelandic.  
**Answer:**  
--XPath
```XPath
doc("countries.xml")/countries/country/data(language[contains(.,../@name)])
```
#### Q12
Return the number of countries where Russian is spoken.  
**Answer:**  
--XPath
```XPath
count(doc("countries.xml")/countries/country[language="Russian"])
```
#### Q13
Return the names of all countries for which the data does not include any languages or cities, but the country has more than 10 million people.  
**Answer:**  
--XPath
```XPath
doc("countries.xml")/countries/country[not(./city) and @population>10000000 and not(./language)]/data(@name)
```
#### Q14
Return the name of the country with the highest population.  
**Answer:**  
--XPath
```XPath
doc("countries.xml")/countries/country[@population=max(//country/@population)]/data(@name)
```
#### Q15
Return the name of the country that has the city with the highest population.  
**Answer:**  
--XPath
```XPath
doc("countries.xml")/countries/country[city/population=max(//city/population)]/data(@name)
```
#### Q16
Return the average number of languages spoken in countries where Russian is spoken.  
**Answer:**  
--XPath
```XPath
avg(doc("countries.xml")/countries/country[language="Russian"]/count(language))
```
#### Q17
Return all country-language pairs where the language is spoken in the country and the name of the country textually contains the language name.  
**Answer:**  
--XQuery
```XQuery
for $l in doc("countries.xml")/countries/country/language[contains(../@name,.)]
let $c := $l/parent::country/data(@name)
return
<country language="{$l/data(.)}">
{$c}
</country>
```
#### Q18
Return all countries that have at least one city with population greater than 7 million.  
**Answer:**  
--XQuery
```XQuery
for $country in doc("countries.xml")/countries/country[city/population>7000000]
return
<country name="{$country/data(@name)}">
    {
    for $city in $country/city[population>7000000]
    return
        <big>{$city/data(name)}</big>

    }
</country>
```
#### Q19
Return all countries where at least one language is listed, but the total percentage for all listed languages is less than 90%. Return the country element with its name attribute and its language subelements, but no other attributes or subelements.  
**Answer:**  
--XQuery
```XQuery
for $c in doc("countries.xml")/countries/country[language]
where sum($c/language/data(@percentage)) <90
return
<country name="{$c/data(@name)}">
    {
    for $l in $c/language
    return
    $l

    }
</country>
```
#### Q20
Return all countries where at least one language is listed, and every listed language is spoken by less than 20% of the population. Return the country element with its name attribute and its language subelements, but no other attributes or subelements.  
**Answer:**  
--XQuery
```XQuery
for $c in doc("countries.xml")/countries/country[language]
where not($c/language/@percentage >= 20)
return
<country name="{$c/data(@name)}">
    {
    for $l in $c/language
    return
    $l
    }
</country>
```
#### Q21
Find all situations where one country's most popular language is another country's least popular, and both countries list more than one language.  
**Answer:**  
--XQuery
```XQuery
let $countries :=doc("countries.xml")/countries/country[count(language)>1]
let $pl :=
    for $country in $countries
    return
    $country/language[@percentage=max($country/language/@percentage)]
let $ll :=
    for $country in $countries
    return
    $country/language[@percentage=min($country/language/@percentage)]

for $most_l in $pl
for $least_l in $ll
where $most_l = $least_l
return
<LangPair language="{$most_l/data(.)}">
    <MostPopular> {$most_l/parent::country/data(@name)} </MostPopular>
    <LeastPopular> {$least_l/parent::country/data(@name)} </LeastPopular>
</LangPair>
```
#### Q22
For each language spoken in one or more countries, create a "language" element with a "name" attribute and one "country" subelement for each country in which the language is spoken. The "country" subelements should have two attributes: the country "name", and "speakers" containing the number of speakers of that language (based on language percentage and the country's population). Order the result by language name, and enclose the entire list in a single "languages" element.  
**Answer:**  
--XQuery
```XQuery
<languages>
{
let $languages := distinct-values(doc("countries.xml")/countries/country/language/data(.))
let $countries := doc("countries.xml")/countries/country[language]
    for $lang in $languages
    order by $lang
    return
    <language name="{$lang}">
        {for $country in $countries
        where $country/language/data(.) = $lang
        return
            <country name="{$country/data(@name)}"
            speakers="{xs:int($country/data(@population) * $country/language[data(.)=$lang]/data(@percentage div 100))}"
            />}
    </language>
}
</languages>

```
