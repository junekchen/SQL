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

/*
1.3
Query the situation where course "01" does not exist but course "02" exists
*/
select * from sc
where sc.sid not in (
select sid from sc
where sc.cid ='01'
)
and sc.cid ='02';