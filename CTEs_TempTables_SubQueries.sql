--with CTE_Employee as (
--Select FirstName,LastName,Gender,Salary, count(gender) over(Partition by Gender) as TotalGender,
--Avg (Salary) over (Partition by Gender) as AvgSalary
--From SQL_Tutorial..EmployeeDemographics emp
--join SQL_Tutorial..EmployeeSalary sal
--On emp.EmployeeID = sal.EmployeeID
--Where Salary > '45000'
--)
--Select FirstName,LastName,TotalGender, Avgsalary
--from CTE_Employee


--create Table #temp_Employee
--(EmployeeID int,JobTitle Varchar(100),
--Salary int)

--select *
--from #temp_Employee


--insert into #temp_Employee
--select *
--from SQL_Tutorial..EmployeeSalary

Select *
from EmployeeSalary

--subquery in select

Select EmployeeID, Salary,(select avg(Salary) from EmployeeSalary) as AllAvgSalary
from EmployeeSalary

--How to do it with Partition by

Select EmployeeID, Salary, avg(Salary) over () as AllAvgSalary
from EmployeeSalary

--Why Group by doesn't work

Select EmployeeID, Salary, avg(Salary)  as AllAvgSalary
from EmployeeSalary
Group by EmployeeID,Salary
order by 1,2

--Subquery in From

Select a.EmployeeID, AllAvgSalary
From (Select EmployeeID, Salary, avg(Salary) over () as AllAvgSalary
      from EmployeeSalary) a

--Subquery in where

Select EmployeeID,JobTitle,Salary
from EmployeeSalary
where EmployeeID in (
      Select EmployeeID
      from EmployeeDemographics
      where Age > 30)
 
