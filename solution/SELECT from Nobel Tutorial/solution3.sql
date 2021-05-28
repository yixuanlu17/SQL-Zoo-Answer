/*
Third section of sqlzoo, SELECT from Nobel https://sqlzoo.net/wiki/SELECT_from_Nobel_Tutorial
*/

--#1
/*
Change the query shown so that it displays Nobel prizes for 1950.
*/
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

--#2
/*
Show who won the 1962 prize for Literature.
*/
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'
   
--#3
/*
Show the year and subject that won 'Albert Einstein' his prize.
*/
SELECT yr, subject
  FROM nobel
 WHERE winner = 'Albert Einstein'


--#14
/*
The expression subject IN ('Chemistry','Physics') can be used as a value - it will be 0 or 1. 
Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.
*/
SELECT 
  winner, subject
FROM 
  nobel
WHERE 
  yr = 1984
ORDER BY 
  CASE WHEN subject IN ('Physics','Chemistry') THEN 1 ELSE 0 END, 
  subject, 
  winner
