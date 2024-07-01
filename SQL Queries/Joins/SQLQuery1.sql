--Show all the tables
select *
from Customers;

Select *
from Orders;

Select *
from OrderStatus;

--Inner Join
/*Syntax
Select column_name(s)
From table1
Inner table 2
on table1.column_name = table2.column_name;*/

select Orders.OrderID, Customers.CustomerName, Orders.OrderDate
from Orders
INNER JOIN Customers on Orders.CustomerID = Customers.CustomerID;

--Alternative still the same when joiningntwo tables but not the same when joining more than two tables.

select Orders.OrderID, Customers.CustomerName, Orders.OrderDate
from Customers
INNER JOIN Orders on  Customers.CustomerID = Orders.CustomerID ;

--Not specifying the tables that the columns come from.

select OrderID, CustomerName, OrderDate
from Orders
INNER JOIN Customers on Orders.CustomerID = Customers.CustomerID;

--Inner join 3 tables

Select Orders.OrderID, Customers.ContactName,OrderStatus.Status, Orders.OrderDate
from (( Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
INNER JOIN OrderStatus ON Orders.OrderID = OrderStatus.OrderID);

--LEFT JOIN
/*The left join keyword returns all records from the left table(table1),
and the matching records from the right table(table2).The result is 0
records from the right side, if there is no match.*/

/*Syntax
Select column_name(s)
from table1
left join table2
on table1.column_name = table2.column_name;*/

select Customers.ContactName,Orders.OrderID
from Customers
Left join Orders on Customers.CustomerID = Orders.CustomerID;

--Right JOIN
/*The right join keyword returns all records from the right table(table2),
and the matching records from the left table(table1).The result is 0
records from the left side, if there is no match.*/

/*Syntax
Select column_name(s)
from table1
Right join table2
on table1.column_name = table2.column_name;*/

select Customers.ContactName,Orders.OrderID
from Customers
Right join Orders on Customers.CustomerID = Orders.CustomerID;

--Full outer Join
/*The full outer joinkeyword returns all records when there is a match in the
left (table 1) or right (table2) table records. */

/*Syntax
Select column_name(s)
from table1
full outer join table2
on table1.column_name = table2.column_name;
where condition;*/

select Customers.ContactName,Orders.OrderID
from Customers
Full outer join Orders on Customers.CustomerID = Orders.CustomerID;

--Self join 
--Logic based
select Orders.OrderID, Customers.CustomerName, Orders.OrderDate
from Orders, Customers
where Orders.CustomerID = Customers.CustomerID;

/*Same Inner join syntax*/
select Orders.OrderID, Customers.CustomerName, Orders.OrderDate
from Orders
inner join customers on Orders.CustomerID = Customers.CustomerID;