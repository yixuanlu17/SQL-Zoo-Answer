/*
Eighth section of sqlzoo, https://sqlzoo.net/wiki/Using_Null
*/

--#3
/*
Use a different JOIN so that all teachers are listed.
*/
SELECT teacher.name, dept.name
 FROM teacher left JOIN dept
           ON (teacher.dept=dept.id)

--#4
/*
Use a different JOIN so that all departments are listed.
*/
SELECT teacher.name, dept.name
 FROM teacher right JOIN dept
           ON (teacher.dept=dept.id)
           
SELECT teacher.name, dept.name
 FROM dept left JOIN teacher
           ON (teacher.dept=dept.id)         

--#5
/*
Use COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given. Show teacher name and mobile number or '07986 444 2266'
*/
select name, coalesce(mobile,'07986 444 2266') from teacher

--#6
/*
Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department.
*/
select teacher.name, coalesce(dept.name,'None')
from teacher left join dept on teacher.dept = dept.id

--#7
/*
Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise.
*/
select teacher.name,
case when teacher.dept = 1 then 'Sci'
when teacher.dept = 2 then 'Sci'
else 'Art'
end
from teacher

