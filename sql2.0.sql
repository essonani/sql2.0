/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
Select P.Name as ProductName,C.Name as CategoryName
 From products as P
 Inner Join categories as C
 On C.CategoryID=P.CategoryID
 Where C.Name='Computers';
  Select products.Name ,Categories.Name
 from products
 Inner join categories on categories.CategoryID=products.CategoryID
 where categories.Name='Computers';
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
Select products.Name,products.Price,reviews.Rating
 From products
 Inner Join reviews On reviews.ProductID=products.ProductID
 where reviews.Rating=5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
Select e.FirstName,e.LastName,Sum(s.Quantity) As Total
From sales as s
Inner Join employees As e On e.EmployeeID=s.EmployeeID
group by e.EmployeeID
order by Total Desc
Limit 2;
Select * From sales 
where EmployeeID=33809;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
Select d.Name as 'Department Name',c.Name as 'Category Name'From departments as d
Inner Join categories as c on c.DepartmentID=d.DepartmentID
Where c.Name='Appliances' or c.Name='Games';
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
Select p.Name ,sum(s.Quantity) as 'Total Sold',sum(s.quantity * s.PricePerUnit)as 'Total Price'
From products as p
Inner Join sales as s on s.ProductID=p.ProductID
Where p.ProductID=97;
-- to verify
Select * from sales where productID=97;
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
Select p.Name ,r.Reviewer,r.Rating,r.Comment
from products as p
Inner Join reviews as r On r.ProductID=p.ProductID
Where p.ProductID=857 AND r.Rating=1;
-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
Select e.EmployeeID,e.FirstName,e.LastName,p.Name, SUM(s.Quantity)as TotalSold
From Sales as s
Inner Join employees as e on e.EmployeeID=s.EmployeeID
Inner Join products as p on p.ProductID=s.ProductID
Group by e.EmployeeID,p.ProductID
order by e.FirstName;