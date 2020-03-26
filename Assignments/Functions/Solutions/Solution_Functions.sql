--Functions : Based on Northwind tables

--1.	Find the Number of Employees
Select COUNT(EmployeeID) as TOTAL_EMPLOYEES
from employees;


--2.	Find the Total Number of Units Ordered of Product ID 3
select unitsonorder
from products
where Productid=3;


--3.	Find the Earliest and Latest Dates of Hire
Select MIN(Hiredate) as Earliest_HIREDATE , MAX(Hiredate) as Latest_HIREDATE
from Employees;


--4.	Retrieve the number of employees in each city
Select  city,COUNT(EmployeeID) as NO_OF_EMPLOYEES
from employees
GROUP BY City;


--5.	Retrieve the number of employees in each city in which there are at least 2 employees.
Select city, COUNT(EmployeeID) as NO_OF_EMPLOYEES
from employees
GROUP BY city
HAVING COUNT(EmployeeID)>=2;


--6.	Find the number of sales representatives in each city that contains at least 2 sales representatives. Order by the number of employees. 
Select city, COUNT(Title) as NO_OF_Employees
from employees
WHERE Title = 'Sales Representative'
GROUP BY City
Having COUNT(Title)>=2
ORDER BY COUNT(Title);


--7.	Find the Birth month for every employee
select firstName, to_char(birthdate,'Month') 
from employees;


--8.	Write a query to display Employee name, birth date, hire date, city and country of every Employee hired in 2011. Display birth date of every employee as ‘2nd August 2016’
select FirstName || ' ' || lastname as EmployeeName , to_char(birthdate, ' Ddth Month YYYY '), hiredate, city, country
from Employees
Where to_char(hiredate,'YYYY') = 2011;


--9.	Create a report that shows the total number of orders by Customer since December 31, 1996. The report should only return rows for which the NumOrders is greater than 15. 
select COUNT(*), customerid
from Orders
where orderdate >= '31-12-1996'
group by customerid having count(*)>15;

--10.	Create a report that shows the total quantity of products (from the Order_Details table) ordered. 
--Only show records for products for which the quantity ordered is fewer than 200.
select COUNT(quantity) from order_details group by productId having count(quantity)<200;
