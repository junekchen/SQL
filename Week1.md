# Week 1
## Data models
Data modeling is to organize and structure information into multiple, realted tables.

- relational and transactional database models  
relational model: allows for easy querying and data manipulation in an easy, logical and intuitive way  
transactional model: operational database - insurance claims within a healthcare database

- one-one（1:1）, one-many(1:M), and many-many(M:N) relationships  
Using __ER diagrams__ to show relationships and links(primary key)

- primary keys and foreign keys  
primary key: a column(or set of cols) whose values uniquely identify every row in a table  
foreign key: one or more cols that can be used together to identify a single row in another table

## Retrieving data using _SELECT_ statement
- retrieving one columns  
need to specify two pieces of information to use a _SELECT_ statement: what you want and where you want to select it from.
```
SELECT prod_name
FROM Products;
```
- retrieving multiple columns  
be sure to use a __comma__
```
SELECT prod_name
       ,prod_id
       ,prod_price
FROM Products;
```
- retrieving multiple columns using a wildcard  
request all columns by using the asterisk (\*) wildcard character instead of column names
```
SELECT *
FROM Products;
```
- limit results: only want to see a sample of the data  
```
SELECT columns you wish to see
FROM specific table
LIMIT number of records
```

## Creating tables  
every column is either __NULL__ or __NOT NULL__  
an error will be returned if on tries to submit a column with no value  
don't confuse null values with empty strings  
primary keys cannot be NULL
```
CREATE TABLE Shoes
(
Id    char(10)      PRIMARY KEY,
Brand char(10)      NOT NULL,
Type  char(250)     NOT NULL,
Color char(250)     NOT NULL,
Price decimal(8,2)  NOT NULL,
Desc  Varchar(750)  NULL
);
```
- adding data to the table  
two way to add data
```
INSERT INTO Shoes
VALUES('14535',
       ,'Gucci'
       ,'Slippers'
       ,'pink'
       ,'695.00'
       ,NULL
      );
```  
```
INSERT INTO Shoes
       (Id
       ,Brand
       ,Type
       ,Color
       ,Price
       ,Desc
       )
VALUES
       ('14535',
       ,'Gucci'
       ,'Slippers'
       ,'pink'
       ,'695.00'
       ,NULL
       );
```
## Creating temporary table  
temporary tables will be _deleted_ when _current session is terminated_  
faster than creating a real table  
useful for complex queries using subsets and joins  
```
CREATE TEMPORARY TABLE Sandals AS
(
    SELECT *
    FROM Shoes
    WHERE shoe_type = 'sandals'
)
```
## Adding comments to SQL  
two way to adding comments  
- single line
```
SELECT prod_name
- -    ,prod_id
       ,prod_price
FROM Products;
```
- section
```
SELECT prod_name
/*     ,prod_id
       ,prod_price
*/
FROM Products;
```


