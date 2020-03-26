--SUB-QUERIES ( based on Northwind Schema)

1--.	Find the Companies that placed orders in 1997

select CompanyName
from Customers
where CustomerId IN (select CustomerId from Orders where to_char(orderdate,'YYYY') = '1997');


--2.	Create a report that shows all products by name that are in the Seafood category.
select productName
from products
where Categoryid = (select categoryid from categories where categoryname = 'Seafood');


--3.	Create a report that shows all companies by name that sell products in CategoryID 8.
select companyName 
from suppliers
where Supplierid IN (select supplierId from Products where categoryId =  8 );


--4.	Create a report that shows all companies by name that sell products in the Seafood category.
select companyName
from suppliers
where supplierId IN (select supplierId from products where categoryId = (select categoryId from categories where categoryName = 'Seafood'));



--5.	Create a report that shows countries where customers live, but there is no supplier located in that country
select DISTINCT(country)
from customers
MINUS
select country from suppliers ;


--6.	Provide list of customers who ordered more than 20 items of product number 23 on a single order.
select * from customers
where customerId IN (select customerId from orders where OrderId IN (select orderId from order_details where quantity > 20 and productId = 23));



--7.	Provide list of employees who received orders on '9/5/97'. (USE EXISTS)
SELECT *
FROM employees
WHERE EXISTS(select customerid from orders where requireddate = '09-05-1997');


