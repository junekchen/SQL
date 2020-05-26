/*6
Query information of students taught by teacher 'zhangsan'
*/
select student.*
from Student right join (
select r.SId, r.TId from
(select sid, tid from sc right join Course on SC.cid = course.cid) r right join
Teacher on r.TId = Teacher.TId
where teacher.Tname = 'zhangsan') w
on student.SId = w.SId;

/* a simpler way for Q6: multi table joint query */
select student.* from Student,Teacher,Course,SC
where
Student.SId = SC.SId
and course.CId = sc.CId
and course.TId = Teacher.TId
and Tname = 'zhangsan';

/*7
Query information about students who have not completed all courses
*/
select student.* from Student
where student.SId not in (
select SId from sc);

/*8
Query information about students who have at least one course same as course which student '01' take
*/
select distinct Student.*
from Student right join (
select sid from SC right join (
select cid from SC where SId = '01') r on sc.CId = r.CId) w
on student.SId = w.SId;

/* another ans for Q8 */
select * from Student
where Student.SId in (
	select SC.SId from SC
	where sc.CId in (
		select sc.CId from SC
		where sc.SId = '01'
	)
);

/*9
Query information about other students who have the same courses as the student "01"
*/
select sid from sc 
where sid != '01' 
group by sid
having group_concat(cid order by CId) = (select group_concat(cid order by cid) from SC where sid = '01');

/*10
Query information of students who have not studied any course taught by "zhangsan"
*/
select * from Student
where student.SId not in (select sc.SId from Teacher,Course,SC
where course.CId = sc.CId
	and course.TId = Teacher.TId
	and Tname = 'zhangsan');

		