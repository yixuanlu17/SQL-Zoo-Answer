/*
Fourth section of sqlzoo, SELECT from Nobel https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial
*/

--#1
/*
List each country name where the population is larger than that of 'Russia'.
*/
select name from world 
 where population > (select population from world where name = 'Russia')
 
--#2
/*
Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
*/ 
select name 
from world 
where continent = 'Europe' and 
GDP/population > (select GDP/population from world where name = 'United Kingdom')

--#3
/*
List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
*/ 
select name, continent 
from world
where continent in (select continent from world where name in ('Argentina', 'Australia'))
order by name

--#4
/*
Which country has a population that is more than Canada but less than Poland? Show the name and the population.
*/ 
select name, population
from world
where population > (select population from world where name = 'Canada') and 
population <  (select population from world where name = 'Poland')

--#5
/*
Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
*/ 
SELECT 
  name, 
  CONCAT(ROUND((population*100)/(SELECT population 
                                 FROM world WHERE name='Germany'), 0), '%')
FROM world
WHERE population IN (SELECT population
                     FROM world
                     WHERE continent='Europe')
                     
--#6
/*
Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
*/ 
select name from world
where GDP > All (select GDP from world where GDP>0 and continent = 'Europe')

--#7
/*
Find the largest country (by area) in each continent, show the continent, the name and the area:
*/ 

 /*
 method 1
 */ 
 select continent, name, area
 from world 
 where area in  (select max(area) from world group by continent)

/*
 method 2
 */ 
select continent, name, area FROM world x
 where area = (select max(area) from world y where y.continent=x.continent)


--#8
/*
List each continent and the name of the country that comes first alphabetically.
*/ 
Select  x.continent, x.name
From world x
Where x.name <= ALL (select y.name from world y where x.continent=y.continent)
ORDER BY name


--#9
/*
Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.
*/ 

select name, continent, population from world x
where 25000000 > = All
(select population from world y
where  x.continent=y.continent
and population >0);
