/*
Nineth section of sqlzoo, https://sqlzoo.net/wiki/NSS_Tutorial
*/

--#3
/*
Show the institution and score where the score for '(8) Computer Science' is less than 50 for question 'Q15'
*/
SELECT institution, score
  FROM nss
  WHERE subject = '(8) Computer Science'
    AND score < 50
    AND question = 'Q15';)
    
    
--#4
/*
Show the subject and total number of students who responded to question 22 for each of the subjects '(8) Computer Science' and '(H) Creative Arts and Design'.
*/
select subject, sum(response) from nss
where subject in( '(8) Computer Science',  '(H) Creative Arts and Design')
and question = 'Q22'
group by subject

--#5
/*
Show the subject and total number of students who A_STRONGLY_AGREE to question 22 for each of the subjects '(8) Computer Science' and '(H) Creative Arts and Design'.
*/
select subject, sum(A_STRONGLY_AGREE * response / 100) from nss
where question='Q22'
and subject in ( '(8) Computer Science','(H) Creative Arts and Design')
group by subject

--#8
/*
Show the institution, the total sample size and the number of computing students for institutions in Manchester for 'Q01'
*/
select institution, sum(sample),
sum(case when subject ='(8) Computer Science' then sample else 0 end)
from nss
where institution like '%Manchester%'
and question='Q01' 
group by institution
