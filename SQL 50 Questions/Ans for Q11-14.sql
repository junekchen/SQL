/*11
Query the student numbers, names and average grades of students 
who failed two or more courses
*/
select student.SId, student.Sname, b.mean
from student right join 
	(select sid, AVG(score) as mean from sc
	where SId in (select sid from sc where score < 60 
		group by SId having COUNT(score) > 1)
	group by sid) b on student.SId = b.SId;

/*12
Query information of students whose scores of course '01' are less than 60, 
and sort data in descending order 
*/
select student.*, sc.score
from Student right join sc on student.SId = sc.SId
where CId = '01' and score < 60	
order by sc.score DESC;

/*13
Show all course grades and the average grade 
of all students in descending order of average grades
*/
select * 
from SC left join(
	select sid, AVG(score) as avg_score from SC
	group by SId) r
on sc.SId = r.SId
order by avg_score DESC;

/* another answer for Q13 using MySQL */
select student.SId, student.Sname,
	(select group_concat(score) as score from SC where sc.SId = student.SId) as score,
	(select AVG(score) as score from SC where sc.SId = student.SId) as avg_score
from student

/*14
Query the highest score, lowest score and average score of each subject:  
    -  Display in the following form: course ID, course name, highest score, 
    lowest score, average score, passing rate, medium rate, good rate, excellent rate  
    -  Pass: >= 60, medium: 70-80, good: 80-90, excellent: >= 90  
    -  Require to output the course number and the number of students. 
    The query results are arranged in descending order of the number of persons, 
    and if the number of persons is the same, 
    they are arranged in ascending order of the course number
*/ 
select sc.CId, 
	MAX(sc.score) as max_score,
	MIN(sc.score) as min_score,
	AVG(sc.score) as avg_score,
	COUNT(*) as num_of_students,
	convert(decimal(6,5),SUM(case when sc.score >= 60 then 1 else 0 end))/COUNT(*) as pass_rate,
	convert(decimal(6,5),SUM(case when sc.score >= 70 and sc.score < 80 then 1 else 0 end))/COUNT(*) as medium_rate,
	convert(decimal(6,5),SUM(case when sc.score >= 80 and sc.score < 90 then 1 else 0 end))/COUNT(*) as good_rate,
	convert(decimal(6,5),SUM(case when sc.score >= 90 then 1 else 0 end))/COUNT(*) as excellent_rate
from SC
group by sc.CId
order by COUNT(*) desc, sc.CId asc;

select convert(decimal(6,5),SUM(case when sc.score >= 60 then 1 else 0 end)/COUNT(*)) as pass_rate
from SC
group by sc.CId


	