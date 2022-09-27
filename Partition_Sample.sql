--SELECT  Jobtitle, AVG(Salary)
--FROM  EmployeeDemographics 
--JOIN EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--Group by Jobtitle
--HAVING AVG(Salary) > 45000
--ORDER BY AVG(Salary)

--Select FirstName, Lastname, Gender, Salary
--, COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender
--FROM EmployeeDemographics dem
--JOIN EmployeeSalary sal
--	ON dem.EmployeeID = sal.EmployeeID

--Select FirstName, Lastname, Gender, Salary, COUNT(Gender)
--FROM EmployeeDemographics dem
--JOIN EmployeeSalary sal
--	ON dem.EmployeeID = sal.EmployeeID
--GROUP BY FirstName, Lastname, Gender, Salary

WITH CTE_Employee as
(Select FirstName, Lastname, Gender, Salary
, COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender
, AVG(Salary) OVER (PARTITION BY Gender) as AvgSalary
FROM EmployeeDemographics emp
JOIN EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
WHERE Salary > '45000'
)
Select FirstName, AvgSalary
FROM CTE_Employee