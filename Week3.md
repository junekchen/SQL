# Week 3: subqueries and joins with SQL
## combined for a subquery  
need to know the region each customer is from who has had an order with freight over 100
```
SELECT
CustomerID,
CompanyName,
Region
FROM Customers
WHERE CustomerID in (
  SELECT CustomerID
  FROM Orders
  WHERE Freight > 100);
```
- subqueries for calculations  
total number of orders placed by every customer
```
SELECT customer_name,
    customer_state
    (SELECT COUNT(*) AS orders
    FROM Orders
    WHERE Orders.customer_id = Customer.customer_id) AS orders
FROM customers
ORDER BY Customer_name
```
## joining tables
### joins  
associate correct records from each table on the fly  allows data retrieval from multiple tables in one query  
joins are not physical: they persist for the duration of the query execution  

### cartesian (cross) joins
cross joins: each row from the first table joins with all the rows of another table  
```
SELECT product_name,
unit_price,
company_name
FROM suppliers CROSS JOIN products;
```
output will be the number of joins in the first table multiplied by the numer of rows in the second table  

### inner joins
__INNER JOIN__ selects records that have matching values in both tables  
```
SELECT suppliers.companyname,
productname,
unitprice
FROM Suppliers INNER JOIN Products
ON suppliers.supplierid = products.supplierid
```
- inner join with multiple tables
```
SELECT o.orderid, c.companyname, e.lastname
FROM ((orders o INNER JOIN customers c ON o.customerid = c.customerid)
INNER JOIN employees e ON o.employeeid = e.employeeid);
```
### alias and self join
- alias  
SQL aliases give a table or a column a temp name  
make col names more readable  
an alias only exists for the duration of the query  
``` 
SELECT col_name
FROM table_name AS alias_name
```
- self join  
match customers from the same city  
take the table and treat it like two sepreate tables  
join the original table to itself  
```
SELECT 
A.customername AS customername1, 
B.customername AS customername2,
A.city
FROM customers A, customers B
WHERE A.customerid = B.customerid
AND A.city = B.city
ORDER BY A.city;
```

### advanced joins: left, right and full outer joins
- left join  
return all records from the left table, and the matched records from the right table  
the result is NULL from the right side, if there is no match  
the following sql statement will select all customers, and any orders they might have:
```
SELECT
c.customername, o.orderid
FROM customers c
LEFT JOIN orders o ON c.customerid = o.orderid
ORDER BY c.customername;
```

- right join  
return all records from the right table, and the matched recorded from the left table  
the result is NULL from the left side, when there is no match  
the table you list first is acted upon by the type of join you use  
left join can be turned into right joins by reversing the order of the tables  

- full outer join  
return all records when there is a match in either left or right table records  

### unions
the UNION operator is used to combine the result-set of two or more SELECT statements  
each SELECT statement within UNION must have the same number of cols  
cols must have similar data types  
the cols in each SELECT statement must be in the same order  

- query 1: basic union setup
```
SELECT col_name(s) FROM table1
UNION
SELECT col_name(s) FROM table2;
```
- query 2: which german cities have suppliers  
```
SELECT city, country
FROM customers
WHERE country = 'Germany'
UNION
SELECT city, country
FROM suppliers
WHERE country = 'Germany'
ORDER BY city;
```


