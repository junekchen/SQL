/*21
Query the number of males and females
*/
select ssex, count(ssex) as num_sex
from student
group by Ssex;

/*22
Query information about students whose name contain "feng"
*/
select *
from Student
where Sname like '%feng%';

/*23
Query the list of students with the same name 
and the number of students with the same name
*/
select sname, COUNT(1) as num
from Student
group by Sname
having COUNT(1)>1;

/*24
Query the list of students born in 1990 
*/
select *
from Student
where Year(Sage) = 1990;

/*25
Query the average score of each course. 
The results are sorted in descending order of average grade. 
When the average grades are the same, 
they are sorted in ascending order of course number.
*/
select sc.CId, AVG(score) as avgsc
from SC
group by sc.CId
order by avgsc desc, CId asc;

/*26
Query the student ID, name and average score of students 
whose average score is greater than or equal to 85.
*/
select sc.SId, student.Sname, AVG(sc.score) as avgsc
from SC left join Student on sc.SId = student.SId
group by sc.SId, student.Sname
having AVG(sc.score) >= 85;

/*27
Query the name and score of students whose course name is "Math" 
and score is less than 60.
*/
select student.Sname, sc.score
from SC, Student, Course
where student.SId = sc.SId
	and course.CId = sc.CId
	and course.Cname = 'Math' 
	and sc.score < 60;

/*28
Query all students' courses and scores. 
(It is possible that students have no grades and no courses).  
*/
select student.Sname, sc.CId, sc.score
from sc left join student on student.SId = sc.SId;

/*29
Query students name, course name and score for any course with scores above 70. 
*/
select student.Sname, Course.Cname, sc.score
from Student, Course, SC
where Student.SId = sc.SId
	and Course.CId = sc.CId
	and score >= 70;

/*30
Query course which some students fail.
*/
select distinct course.*
from Course right join SC on course.CId = sc.CId
where sc.score < 60;
