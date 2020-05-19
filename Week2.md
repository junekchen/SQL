# Week 2
## filter data
- _WHERE_ cluse operators
```
SELECT column_name, column_name
FROM table_name
WHERE column_name operator value
```
|operator|description|
|:-----:| :----|
|=|equal|
|<> _or_ !=|not equal|
|>|greater than|
|<|less than|
|>=|greater than or equal|
|<=|less than or equal|
|BETWEEN|between an inclusive range|
|IS NULL|is a null value|

### filtering on a single condition
```
SELECT ProductName
       ,UnitPrice
       ,SupplierID
FROM Products
WHERE ProductName = 'Tofu';
```
```
SELECT ProductName
       ,UnitPrice
       ,SupplierID
FROM Products
WHERE UnitPrice >= 75;
```
- filtering with a range of values
```
SELECT ProductName
       ,UnitPrice
       ,SupplierID
FROM Products
WHERE UnitPrice BETWEEN 15 AND 80;
```
- filtering no value  
no value returned because there are no null values in the product name
```
SELECT ProductName
       ,UnitPrice
       ,SupplierID
FROM Products
WHERE ProductName IS NULL;
```
### advanced filter: IN, OR and NOT
- IN operator  
specifies a range of conditions  
comma delimited list of values  
enclosed in()  
```
SELECT ProductName
       ,UnitPrice
       ,SupplierID
FROM Products
WHERE SupplierID IN (9,10,11);
```
- OR operator  
DBMS will __not__ evaluate the second conditions in a where clause if the first condition is met  
use for any rows matching the specific conditions
```
SELECT ProductName
       ,UnitPrice
       ,SupplierID
FROM Products
WHERE ProductName = 'Tofu' OR 'Konbu';
```
- OR with AND  
remember to write ()
```
SELECT ProductName
       ,UnitPrice
       ,SupplierID
FROM Products
WHERE (SupplierID = 9 OR
SupplierID = 11)
AND UnitPrice > 15;
```
- order of operations  
don't rely on the default order of operations. You are better being specific and getting in the habit of using the ()


- NOT operator
```
SELECT *
FROM Employees
WHERE NOT City = 'London' AND
NOT City = 'Seattle';
```
### using wildcards in SQL
can only be used with strings
cannot be used for non-text datatypes  

- using __#__ wildcards  

|wildcard|action|
|:-----| :----|
|%pizza|grab anything ending with pizza|
|pizza%|grab anything after pizza|
|%pizza%|grab anything before and after pizza|

- using __%__ wildcards  
% wildcard will not match NULLs  
NULL represents no value in a col  
|wildcard|action|
|:-----| :----|
|s%e|grab anything that start with s and ends with e(like sadie)|
|t%@gmail.com|grab gmail addresses that start with t(hoping to find tim|

- uderscore(\_) wildcard  
matches a __single__ character
```
WHERE size LIKE '_pizza'
Output: spizza   mpizza
```
- bracket[] wildcard  
used to specify a set of characters in a specific location  

- downsides of wildcards  
takes longer to run  
better to use another operator(if possible): =, <, => and etc.  
placement of wildcards is important

### sorting with ORDER BY
ORDER BY clause allows user to sort data by particular columns
```
SELECT somthing
FROM database
ORDER BY characteristic
```
- rules for ORDER BY  
takes the name of one or more cols  
add a comma after each additional column  
can sort by a col not retrieved  
must always be the last clause in a select statement  

- sorting by column position
```
ORDER BY 2,3
```
2 and 3 mean 2nd and 3rd cols, etc.  

- sort direction
__DESC__ descending order  
__ASC__ ascending order  
only applies to the col names it directly precedes  

### math operations
- math operators  

|operator|description|
|:-----:| :----|
|+|addition|
|-|suntraction|
|\*|multiplication|
|/|division|

```
SELECT 
ProductID
,Units
,UnitPrice
,Units * UnitPrice AS Total_cost
FROM Products
```
- order of operations
parentheses  
exponents  
multiplication  
division  
addition  
subtraction  

### aggregate functions  
AVG()  
COUNT()  
MIN()  
MAX()  
SUM()  

-average function  
rows containing NULL values are ignored by the AVERAGE function
```
SELECT AVG(UnitPrice) AS avg_price
FROM Products
```

- count function  
COUNT（\*): counts all the rows in a table containing values or NULL values    
COUNT(col): counts all the rows in a specific col ignoring NULL values  

- MAX and MIN function  
NULL values are ignored by the MIN and MAX functions  

- using DISTINCT on aggregate functions  
if DISTINCT is not specified, ALL is assumed  
cannot use DISTINCT on COUNT(\*)  
no value to use with MIN an MAX functions
```
SELECT COUNT(DISTINCT CustomerID)
FROM Customers
```
### grouping data with SQL
- having clause: filtering for groups  
WHERE does not work for groups  
WHERE filters on rows  
instead use HAVING clause to filter for groups  
```
SELECT
CustomerID
,COUNT(\*) AS orders
FROM Orders
GROUP BY CustomerID
HAVING COUNT (\*) >= 2;
```
- WHERE vs. HAVING  
WHERE filters before data is grouped  
HAVING filters after data is grouped  
rows eliminated by the WHERE clause will not be a included in the group  



