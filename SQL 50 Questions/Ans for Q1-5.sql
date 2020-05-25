/*1 
Query students' information and course scores who have higher grades in course "01" than "02"  
*/
select *
from student right join (
select t1.sid, class1, class2 from
(select sid, score as class1 from sc where sc.cid = '01') as t1,
(select sid, score as class2 from sc where sc.cid = '02') as t2
where t1.sid = t2.sid and t1.class1 > t2.class2) r
on student.sid = r.sid;

/*1.1
Query the situation where there are both course "01" and "02"
*/
select * from
(select * from sc where sc.cid = '01') as t1,
(select * from sc where sc.cid = '02') as t2
where t1.sid = t2.sid;

/*1.2
 Query the situation where course "01" exists but course "02" may not exist(display 'null' if it does not exist)
*/
select * from 
(select * from sc where sc.cid = '01') as t1
left join
(select * from sc where sc.cid ='02') as t2
on t1.sid = t2.sid;

/*1.3
Query the situation where course "01" does not exist but course "02" exists
*/
select * from sc
where sc.sid not in (
select sid from sc
where sc.cid ='01'
)
and sc.cid ='02';

/*2
Query the student number, student name and average score of students whose average scores are greater than or equal to 60 points
*/
select Student.SId, sname, ss 
from Student, 
(select sid, AVG(score) as ss from sc
group by SId
having AVG(score) > 60) r
where student.SId = r.SId;

/*3
Query information about students with grades in SC table
*/
select distinct student.* 
from student right join sc
on student.sid = sc.sid;

/*4
Query the student numbers, student names, total number of courses selected, and the total score of all courses for all students
*/
select student.SId, student.Sname, num, total
from student left join (
select sid, SUM(score) as total, COUNT(cid) as num
from SC
group by SId) r
on student.SId = r.SId;

/*4.1
Query information of students who have scores
*/
select DISTINCT student.*
from Student right join SC
on student.SId = sc.SId;

/*5
Query the number of teachers whose last name is li
*/
select COUNT(tid)
from Teacher
where Tname like 'li%';