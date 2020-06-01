/*31
Query ID and name of students whose score of course '01' is higher than or equal to 80.
*/
select sc.SId, student.Sname
from SC, Student
where sc.SId = Student.SId
	and sc.CId = '01'
	and sc.score >= 80;

/*32
Query information and score of students who choose the course taught by 
teacher 'zhangsan' and get the highest score in this course. 
The score is not repeated.
*/
select top 1 student.*, sc.score
from student, SC, Teacher, Course
where student.SId = sc.SId
	and sc.CId = Course.CId
	and course.TId = Teacher.TId
	and Teacher.Tname = 'zhangsan'
order by sc.score desc;

/*33
Query information and score of students who choose the course taught by 
teacher 'zhangsan' and get the highest score in this course. 
The score may be repeated.
*/
select student.*, sc.score
from Student, SC, Course, Teacher
where student.SId = sc.SId
	and sc.CId = Course.CId
	and course.TId = Teacher.TId
	and Teacher.Tname = 'zhangsan'
	and sc.score in (
		select MAX(score) 
		from SC, Course, Teacher
		where sc.CId = Course.CId
			and course.TId = Teacher.TId
			and Teacher.Tname = 'zhangsan');

/*34
Query student ID, course ID and score of students 
who have the same score in different courses.
*/
select distinct a.*
from SC as a
	inner join SC as b
	on a.score = b.score
	and a.CId != b.CId;

/*35
Query the number of students choosing every course 
(only show record with more than 5 students).
*/
select sc.CId, COUNT(sc.SId) as num
from SC
group by sc.CId
having COUNT(sc.SId) > 5;

/*36
Query information of students who choose more than 2 courses.
*/
select Student.SId, Sname
from Student, SC
where Student.SId = sc.SId
group by student.SId, Sname
having COUNT(CId) >= 2;

/*37
Query information of students who choose all courses.
*/
select student.*
from SC, Student
where sc.SId = Student.SId
	and CId = (select COUNT(1) from Course);

/*38
Query students' age. Only consider year.
*/
select sname, YEAR(getdate()) - YEAR(sage) as age
from Student;

/*39
Query students' age. Consider birth date. 
*/
select sname, datediff(YEAR,Student.Sage,getdate()) as age
from Student;

/*40
Query information of students who will celebrate birthday this week.

week and now function are in MySQL
*/
select sname
from Student
where week(Sage) = week(now());

/*41 
Query information of students who will celebrate birthday the next week.

week and now function are in MySQL
*/
select sname
from Student
where week(Sage) = week(now()) + 1;

/*42
Query information of students who will celebrate birthday this month.
*/
select sname
from Student
where month(Sage) = month(getdate());

/*43
Query information of students who will celebrate birthday the next month.
*/
select sname, sage
from Student
where month(Sage) = month(getdate()) + 1;


