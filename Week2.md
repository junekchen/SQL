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
