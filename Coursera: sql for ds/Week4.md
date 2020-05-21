# Modifying and Analyzing Data with SQL
## working with text strings
### concatenations
```
SELECT
companyname,
contactname,
companyname || '(' || contactname || ')'
FROM customers
```
note: sql server supports + instead of ||  

### trimming strings
trims the leading or trailing space from a string  
TRIM  
LTRIM  
RTEIM  
```
SELECT TRIM("You are the best.") 
AS TrimmedString;
```
- substring  
returns the specified number of characters from a particular position o f a given string
```
SUBSTR(string name, string position, number of chars to be returned);

SELECT firstname, SUBSTR(firstname,2,3)
FROM employees
WHERE departmentid = 60;
```
- upper and lower  
```
SELECT UPPER(colname) FROM tablename;
SELECT LOWER(colname) FROM tablename;
SELECT UCASE(colname) FROM tablename;
```

## working with date and time strings
dates are stored as datetypes  
### date formats
date: YYYY-MM-DD  
datetime: YYYY-MM-DD HH:MM:SS  
timestamp: YYYY-MM-DD HH:MM:SS  
### sqlite date time functions
```
DATE(timestring, modifier, modifier, ...)
TIME(timestring, modifier, modifier, ...)
DATETIME(timestring, modifier, modifier, ...)
JULIANDAY(timestring, modifier, modifier, ...)
STRFTIME(format,timestring, modifier, modifier, ...)
```
- timestrings  
a time string can be in any of the following formats
```
YYYY-MM-DD
YYYY-MM-DD HH:MM
YYYY-MM-DD HH:MM:SS
YYYY-MM-DD HH:MM:SS.SSS
YYYY-MM-DDTHH:MM
YYYY-MM-DDTHH:MM:SS
YYYY-MM-DDTHH:MM:SS.SSS
HH:MM
HH:MM:SS
HH:MM:SS.SSS
```
- modifiers  
NNN days  
NNN hours   
NNN minutes   
NNN.NNNN seconds  
NNN months  
NNN years  
start of month  
start of year  
start of day  
weekday N  
unixepoch  
localtime  
utc  

- examples  
```
SELECT birthdate,
STRFTIME('%Y', birthdate) AS Year,
STRFTIME('%m', birthdate) AS Month,
STRFTIME('%d', birthdate) AS Day,
FROM employees
```
- compute current date  
```
SELECT DATE('now')
SELECT STRFTIME('%Y %m %d', 'now')
SELECT STRFTIME('%H %M %S %s', 'now')
```
- compute age using birthdate  
```
SELECT birthdate
STRFTIME('%Y', birthdate) AS Year,
STRFTIME('%m', birthdate) AS Month,
STRFTIME('%d', birthdate) AS Day,
DATE(('now')- birthdate) AS Age
FROM employees
```

## case statements
mimics if-then-else statement found in most programming languages  
can be used in SELECT, INSERT, UPDATE, and DELETE statements
```
CASE
WHEN C1 THEN E1
WHEN C2 THEN E2
...
ELSE [result else]
END
```
- simple case statement  
```
CASE input_expression
     WHEN when_expression THEN result_expression [...n]
     [ ELSE else_result_expression ]
END
```
```
select
employid,
firstname,
lastname,
city,
case city
     when 'calgary' then 'calgary'
else 'other'
end calgary
from employees
order by firstname, lastname;
```
- search case statement  
```
case when boolean_expression
then result_expression [...n]
[else else_result_expression]
end
```
```
select
trackid,
name,
bytes,
case when bytes < 30000 then 'small'
     when bytes >= 30001 and bytes <= 50000 then 'medium'
     when bytes >=50001 then 'large'
else 'other'
end bytescategory
from tracks;
```
## views
### creating a view
```
create view my_view
as
select
cola,
colb
from table1
```
### delete view
```
drop view viewname;
```
