--JOINS :  Based on Northwind
--1.	Create a report to display all the Supplier details along with corresponding product details. Report should include all Supplier details whether or not corresponding product exist.
select s.*, p.*
from suppliers s left outer join products p
on s.supplierid = p.supplierid;


--2.	Create a report to display Category name, product name, unit price, units in stock. Report should contain all the category names whether or not corresponding product exists. Also, report should contain all the product details whether they belong to any category or not.
select c.categoryname, P.Productname, P.Unitprice, P.Unitsinstock
from categories c full outer join products p on c.categoryid = P.Categoryid;


--3.	Display Employee first name, last name, title along with corresponding Manager details.
--Note : ReportsTo column in Employee table references EmployeeId column in the same table.
select e1.firstname, e1.lastname, e1.title, e2.firstname || ' ' || e2.lastname as Manager
from employees e1 , employees e2
where e1.reportsto = e2.employeeid;



--4.	Display details of all the Suppliers whose country is same as Country of ‘Robb Merchant’	
select s1.* 
from suppliers s1, suppliers s2
where s1.country = s2.country
and s2.contactname = 'Robb Merchant';
