/*15
Sort scores of each subject and display the ranking. 
Keep the vacancies when the score is repeated.

Using window function
*/
select *,
RANK() over (partition by cid
			 order by score desc) as ranking
from SC;

/*16
Query and rank students' total scores. 
If the total scores are repeated, no vacancies will be reserved.

using window function
*/
select *,
dense_rank() over (order by total desc) as ranking
from (select sid, sum(score) as total from SC group by SId) r;

/*17
Count the number of students in each grade segment of every subjects: 
course number, course name, percentage of [100-85], [85-70], [70-60] and [60-0] 
*/
 select sc.CId, cname,
	convert(decimal(6,5),SUM(case when score >= 0 and score <= 60 then 1 else 0 end))/COUNT(sid) as '[60-0]',
	convert(decimal(6,5),SUM(case when score > 60 and score <= 70 then 1 else 0 end))/COUNT(sid) as '[70-60]',
	convert(decimal(6,5),SUM(case when score > 70 and score <= 85 then 1 else 0 end))/COUNT(sid) as '[85-70]',
	convert(decimal(6,5),SUM(case when score > 85 and score <= 100 then 1 else 0 end))/COUNT(sid) as '[100-85]'
from SC left join Course on sc.CId = course.CId
group by sc.CId,cname;

/*18
Query the information of top 3 students in each subject  
*/
select a.CId, a.SId, (COUNT(b.score)+1) as srank
from SC as a left join SC as b
on a.CId = b.CId and a.score < b.score
group by a.CId, a.SId
having (count(b.score)+1) <= 3
order by a.CId, srank;

/*19
Query the number of students selected for each course  
*/
select cid, COUNT(sid) as num
from SC
group by CId;

/*20
Query the student ID and name of students who only take two courses  
*/
select student.SId, student.Sname
from Student right join SC on student.SId = sc.SId
group by student.SId, student.Sname
having count(score) = 2;

