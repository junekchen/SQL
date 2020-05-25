# student table
create table Student(SId varchar(10),Sname varchar(10),Sage datetime,Ssex varchar(10));
insert into Student values('01' , 'zhaolei' , '1990-01-01' , 'male');
insert into Student values('02' , 'qiandian' , '1990-12-21' , 'male');
insert into Student values('03' , 'sunfeng' , '1990-12-20' , 'male');
insert into Student values('04' , 'liyun' , '1990-12-06' , 'male');
insert into Student values('05' , 'zhoumei' , '1991-12-01' , 'female');
insert into Student values('06' , 'wulan' , '1992-01-01' , 'female');
insert into Student values('07' , 'zhengzhu' , '1989-01-01' , 'female');
insert into Student values('09' , 'zhangsan' , '2017-12-20' , 'female');
insert into Student values('10' , 'lisi' , '2017-12-25' , 'female');
insert into Student values('11' , 'lisi' , '2012-06-06' , 'female');
insert into Student values('12' , 'zhaoliu' , '2013-06-13' , 'female');
insert into Student values('13' , 'sunqi' , '2014-06-01' , 'female');

# course table
create table Course(CId varchar(10),Cname nvarchar(10),TId varchar(10));
insert into Course values('01' , 'chinese' , '02');
insert into Course values('02' , 'math' , '01');
insert into Course values('03' , 'english' , '03');


# teacher_table
create table Teacher(TId varchar(10),Tname varchar(10));
insert into Teacher values('01' , 'zhangsan');
insert into Teacher values('02' , 'lisi');
insert into Teacher values('03' , 'wangwu');

# score table
create table SC(SId varchar(10),CId varchar(10),score decimal(18,1));
insert into SC values('01' , '01' , 80);
insert into SC values('01' , '02' , 90);
insert into SC values('01' , '03' , 99);
insert into SC values('02' , '01' , 70);
insert into SC values('02' , '02' , 60);
insert into SC values('02' , '03' , 80);
insert into SC values('03' , '01' , 80);
insert into SC values('03' , '02' , 80);
insert into SC values('03' , '03' , 80);
insert into SC values('04' , '01' , 50);
insert into SC values('04' , '02' , 30);
insert into SC values('04' , '03' , 20);
insert into SC values('05' , '01' , 76);
insert into SC values('05' , '02' , 87);
insert into SC values('06' , '01' , 31);
insert into SC values('06' , '03' , 34);
insert into SC values('07' , '02' , 89);
insert into SC values('07' , '03' , 98);
