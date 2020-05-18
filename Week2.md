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

- filtering on a single condition
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
