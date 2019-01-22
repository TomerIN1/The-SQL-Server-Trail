--The SQL Server Trail--
--Question and Answer file--
--File Number 03--

-- In this file you will be shown several question in sql language by different types of topics.
-- After each question you will see the correct answer of the question. 
-- The topics in this file goes from a begginer level to an advanced level.

-- These are the topics: 
--01- simple select questions
--02- Group by questions
--03- Join questions
--04- Replacing Null value questions
--05- Union and Union all questions
--06- Mathematical Functions
--07- Date-Time Functions
--08- String Functions
--09- Finding Character
--10- Patindex function
--11- Counting Letters
--12- CAST and CONVERT functions
--13- Stored Procedure
--14- Index
--15- Views
--16- User Defined Functions
--17- Temporary Tables
--18- If Statements
--19- Derived Tables
--20- Row Number and Partition by
--21- Dense Rank and Partition by
--22- CTE - Common table expression
--23- Duplicate values 
--24- Ntile function
--25- Lag and Lead function
--26- Sliding Window
--27- Basic Pivot
--28- Basic Unpivot
--29- Multiple CTEs
--30- Recursive CTEs

--Choose the Database: 
USE The_SQL_Server_Trail_Database
GO

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic 01 - simple select questions -- use the tblemployee Table
--Question 1 - select all the table
--Answer: 
SELECT * FROM tblemployee

--Question 2 - select all the females in the table. Show just the first name, gender and phoneNumber
--Answer: 
SELECT firstName, gender, PhoneNumber FROM tblemployee
WHERE gender = 'Female' 

--Question 3 - select all the Males that lives in jerusalem and haifa
--Answer: 
SELECT * FROM tblemployee
WHERE gender = 'Male' AND city IN ('Jerusalem', 'Haifa') 

--Question 4 - select all the employees with salary 6000 or 11000
--Answer1 - Use OR Operator: 
SELECT * FROM tblemployee 
WHERE salary = 6000 or salary = 1100

--Answer2 - Use IN Operator: 
SELECT * FROM tblemployee
WHERE salary IN (6000, 11000) 


--Question 5 - select all the employees who lives in Jerusalem and Haifa with salary between 4000 and 10000
--Answer: 
SELECT * FROM tblemployee
WHERE salary BETWEEN 4000 AND 10000
AND city IN ('Jerusalem', 'Haifa') 


--Question 6 - select all employees with the phone number that starts with 050
--Answer: 
SELECT * FROM tblemployee
WHERE PhoneNumber LIKE ('050%')

--Question 7 - select all employees with the phone number that not starts with 050
--Answer: 
SELECT * FROM tblemployee
WHERE PhoneNumber NOT LIKE ('050%')

--Question 8 - select 5 rows with columns first name, salary and city order by salary (From max salary to min salary)
--Answer:
SELECT TOP 5 firstName, salary, city FROM tblemployee
ORDER BY salary DESC;  

--Question 9 - select 25 percent of all the employees and order by salary (From max salary to min salary)
--Answer: 
SELECT TOP 25 PERCENT employeeID, firstName, Email, salary, city FROM tblemployee
ORDER BY salary DESC;   

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic 02 - Group by questions -- use the tblemployee Table
--Question 1 - show the mean salary by gender
--Answer:
SELECT gender, AVG(salary) AS [Avg Salary] FROM tblemployee
GROUP BY gender 

--Question 2 - show the mean salary by city order by Avg Salary from max to min
--Answer:
SELECT city, AVG(salary) AS [Avg Salary] FROM tblemployee
GROUP BY city 
ORDER BY AVG(salary) DESC; 

--Question 3 - show the max and min salary by gender
--Answer:
SELECT gender, MAX(salary) [Max Salary], MIN(salary) [Min Salary] 
FROM tblemployee 
GROUP BY gender

--Question 4 - show the max and min salary by gender and city 
--Answer:
SELECT city, gender, MAX(salary) [Max Salary], MIN(salary) [Min Salary] 
FROM tblemployee 
GROUP BY gender, city 


--Question 5 - show the total salary by gender and city 
--Answer:
SELECT city, gender, SUM(salary) [Total Salary] 
FROM tblemployee 
GROUP BY gender, city 

--Question 6 - count the total female employees  
--Answer:
SELECT gender, COUNT (*) AS EmployeeCount
FROM   tblemployee
GROUP BY gender
HAVING gender = 'Female'

--Question 7 - count the total employees in Tel-Aviv
--Answer:
SELECT city, COUNT(*) EmployeeCount
FROM   tblemployee 
GROUP BY city
HAVING city = 'Tel-Aviv' 

--Question 8 - show the total salary by city just for cities with total salary above 20000 and rank them from max to min. 
--Answer:
SELECT city, SUM(salary) [Total Salary] 
FROM tblemployee 
GROUP BY city 
HAVING SUM(salary) > 20000
ORDER BY [Total Salary]	DESC; 


--Question 9 - show the total salary just for males who lives in Jerusalem and Tel-Aviv
--Answer:	
SELECT gender, city, SUM(salary) [Total Salary] 
FROM tblemployee 
GROUP BY gender, city
HAVING gender = 'Male' AND city IN ('Jerusalem', 'Tel-Aviv') 
ORDER BY SUM(salary) DESC; 


--Question 10 - show the total salary just for Females who lives in Jerusalem and Tel-Aviv and their phone number starts with 050
--Answer:	
SELECT gender, SUM(salary) [Total Salary]   
FROM tblemployee 
WHERE PhoneNumber LIKE ('050%') AND city IN ('Jerusalem', 'Tel-Aviv') 
GROUP BY gender 
HAVING gender = 'Female'


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic 03 - Join questions -- use three tables: 1) tblProducts, 2) tblSubCategory, 3) tblCategory
--Question 1 - select all tables and find the primary key and the foregin key. 
--Answer: 
SELECT * FROM tblProducts -- PRIMARY KEY = 'ProductID', FOREIGN KEY = 'SubCategoryID' 
SELECT * FROM tblSubCategory -- PRIMARY KEY = 'SubCategoryID', FOREIGN KEY = 'CategoryID' 
SELECT * FROM tblCategory -- PRIMARY KEY = 'CategoryID' 

--Question 2 - create an inner join between tblproducts and tblsubcategory. 
-- from tblproducts show productName and productPrice. 
-- from tblsubcategory show subcategoryName. 
--Answer: 
SELECT      PR.ProductName, PR.ProductPrice, SC.SubCategoryName
FROM        tblProducts AS PR
INNER JOIN  tblSubCategory AS SC
ON          PR.SubCategoryID = SC.SubCategoryID     

--Question 3 - create an inner join between tblproducts, tblsubcategory, tblcategory. 
-- from tblproducts show productName and productPrice. 
-- from tblsubcategory show subcategoryName.
-- from tblcategory show categoryName. 
--Answer: 
SELECT      PR.ProductName, PR.ProductPrice, SC.SubCategoryName, CT.CategoryName
FROM        tblProducts AS PR
INNER JOIN  tblSubCategory AS SC
ON          PR.SubCategoryID = SC.SubCategoryID
INNER JOIN  tblCategory AS CT
ON          SC.CategoryID = CT.CategoryID 


--Question 4 - create an inner join between tblproducts and tblcategory. 
-- from tblproducts show productName and productPrice. 
-- from tblcategory show categoryName. 
--Answer:
SELECT      PR.ProductName, PR.ProductPrice, CT.CategoryName
FROM        tblProducts AS PR
INNER JOIN  tblSubCategory AS SC
ON          PR.SubCategoryID = SC.SubCategoryID
INNER JOIN  tblCategory AS CT
ON          SC.CategoryID = CT.CategoryID 


---Question 5 - create LEFT join between tblproducts and tblcategory. 
-- from tblproducts show productName and productPrice. 
-- from tblcategory show categoryName.
-- what happend?  
--Answer:
SELECT      PR.ProductName, PR.ProductPrice, CT.CategoryName
FROM        tblProducts AS PR
LEFT JOIN   tblSubCategory AS SC
ON          PR.SubCategoryID = SC.SubCategoryID
LEFT JOIN   tblCategory AS CT
ON          SC.CategoryID = CT.CategoryID 


---Question 6 - Show the total productPrice by category name order by max to min. 
-- if you have null values do not show them!  
--Answer:
SELECT      CT.CategoryName, SUM(PR.ProductPrice) AS [Total Price]
FROM        tblProducts AS PR
RIGHT JOIN  tblSubCategory AS SC
ON          PR.SubCategoryID = SC.SubCategoryID
RIGHT JOIN  tblCategory AS CT
ON          SC.CategoryID = CT.CategoryID
GROUP BY    CT.CategoryName
ORDER BY    SUM(PR.ProductPrice) DESC


---Question 7 - show the most expensive product name with subcategory and category.   
-- if you have null values do not show them!  
--Answer:
SELECT      TOP 1 PR.ProductName, PR.ProductPrice, SC.SubCategoryName, CT.CategoryName
FROM        tblProducts AS PR
LEFT JOIN   tblSubCategory AS SC
ON          PR.SubCategoryID = SC.SubCategoryID
LEFT JOIN   tblCategory AS CT
ON          SC.CategoryID = CT.CategoryID
ORDER BY    PR.ProductPrice DESC 

---Question 8 - show the most expensive product name within the category name =  'kitchen'.
-- if you have null values do not show them!  
--Answer:
SELECT      TOP 1 PR.ProductName, PR.ProductPrice, SC.SubCategoryName, CT.CategoryName
FROM        tblProducts AS PR
LEFT JOIN   tblSubCategory AS SC
ON          PR.SubCategoryID = SC.SubCategoryID
LEFT JOIN   tblCategory AS CT
ON          SC.CategoryID = CT.CategoryID
WHERE       CT.CategoryName = 'Kitchen' 
ORDER BY    PR.ProductPrice DESC; 


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic 04 - Replacing Null value questions -- use the tblKingOfAnimals Table
--Question 1 - create a self join that shows two columns- AnimalName and Dominant AnimalName, so that for each animal you will see the who is her animal dominant. replace the null value with 'King of Animals' USE ISNULL function.
--Answer: 
SELECT      A.AnimalName, 
            ISNULL (b.AnimalName, 'King of Animals') AS [Dominant Rank]
FROM        tblKingOfAnimals AS A
LEFT JOIN   tblKingOfAnimals AS B
ON          A.AnimalDominant = B.AnimalID

--Question 2 -  create the same self join .replace the null value with 'King of Animals' USE CASE (Transact-SQL)  
--Answer: 
SELECT      A.AnimalName, 
            CASE WHEN B.AnimalName IS NULL THEN 'King of Animals' ELSE B.AnimalName END AS [Dominant Rank]
FROM        tblKingOfAnimals AS A
LEFT JOIN   tblKingOfAnimals AS B
ON          A.AnimalDominant = B.AnimalID

--Question 3 -  create the same self join .replace the null value with 'King of Animals' USE COALESCE function.  
--Answer: 
SELECT      A.AnimalName, 
            COALESCE (B.AnimalName, 'King of Animals') [Dominant Rank] 
FROM        tblKingOfAnimals AS A
LEFT JOIN   tblKingOfAnimals AS B
ON          A.AnimalDominant = B.AnimalID


--Question 4 - Replace the null values in tblproduct table with the number '13'   
--Answer: 
SELECT productID, ProductName, ProductPrice,
       ISNULL (SubCategoryID , 13) AS SubCategoryID 
FROM tblProducts

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic 05 - Union and Union all questions -- use two groups of tables: 
-- group one (tblIsraelCustomers, tblUSCustomers, tblSpainCustomers)
-- group two (tblCategory, tblSubCategory, tblProducts) 
--Question 1 - marge all the tables from group one. USE UNION ALL OPERATION. 
--Answer: 
SELECT * FROM tblIsraelCustomers
UNION ALL
SELECT * FROM tblUSCustomers
UNION ALL 
SELECT * FROM tblSpainCustomers

--Question 2 - marge all the tables from group one. USE UNION OPERATION. 
--Answer:
SELECT * FROM tblIsraelCustomers
UNION 
SELECT * FROM tblUSCustomers
UNION 
SELECT * FROM tblSpainCustomers

--Question 3 - What is the main difference between the two queries? type your answer. 
--Answer:
--UNIAN ALL marge all the information and UNION magrge just the unique values.  


---Question 4 - use group two tables:(tblCategory, tblSubCategory, tblProducts).  
-- show the most expensive product of each subcategory and category. use the UNION ALL Operator AND Subquery technique. 
-- if you have null values do not show them!  
--Answer:

SELECT      TOP 1 PR.ProductName, PR.ProductPrice, SC.SubCategoryName, CT.CategoryName
FROM        tblProducts AS PR
LEFT JOIN   tblSubCategory AS SC
ON          PR.SubCategoryID = SC.SubCategoryID
LEFT JOIN   tblCategory AS CT
ON          SC.CategoryID = CT.CategoryID
WHERE       CT.CategoryName = 'Kitchen' AND PR.ProductPrice = 
(
SELECT   MAX(ProductPrice)
FROM     tblProducts 
JOIN     tblSubCategory
ON       tblProducts.SubCategoryID = tblSubCategory.SubCategoryID
JOIN     tblCategory
ON       tblSubCategory.CategoryID = tblCategory.CategoryID
WHERE   CategoryName = 'Kitchen' 
)

UNION ALL 

SELECT      TOP 1 PR.ProductName, PR.ProductPrice, SC.SubCategoryName, CT.CategoryName
FROM        tblProducts AS PR
LEFT JOIN   tblSubCategory AS SC
ON          PR.SubCategoryID = SC.SubCategoryID
LEFT JOIN   tblCategory AS CT
ON          SC.CategoryID = CT.CategoryID
WHERE       CT.CategoryName = 'Living Room' AND PR.ProductPrice = 
(
SELECT   MAX(ProductPrice)
FROM     tblProducts 
JOIN     tblSubCategory
ON       tblProducts.SubCategoryID = tblSubCategory.SubCategoryID
JOIN     tblCategory
ON       tblSubCategory.CategoryID = tblCategory.CategoryID
WHERE   CategoryName = 'Living Room' 
)

UNION ALL 

SELECT      TOP 1 PR.ProductName, PR.ProductPrice, SC.SubCategoryName, CT.CategoryName
FROM        tblProducts AS PR
LEFT JOIN   tblSubCategory AS SC
ON          PR.SubCategoryID = SC.SubCategoryID
LEFT JOIN   tblCategory AS CT
ON          SC.CategoryID = CT.CategoryID
WHERE       CT.CategoryName = 'Bedroom' AND PR.ProductPrice = 
(
SELECT   MAX(ProductPrice)
FROM     tblProducts 
JOIN     tblSubCategory
ON       tblProducts.SubCategoryID = tblSubCategory.SubCategoryID
JOIN     tblCategory
ON       tblSubCategory.CategoryID = tblCategory.CategoryID
WHERE   CategoryName = 'Bedroom' 
)

UNION ALL 

SELECT      TOP 1 PR.ProductName, PR.ProductPrice, SC.SubCategoryName, CT.CategoryName
FROM        tblProducts AS PR
LEFT JOIN   tblSubCategory AS SC
ON          PR.SubCategoryID = SC.SubCategoryID
LEFT JOIN   tblCategory AS CT
ON          SC.CategoryID = CT.CategoryID
WHERE       CT.CategoryName = 'Electrical Appliance' AND PR.ProductPrice = 
(
SELECT   MAX(ProductPrice)
FROM     tblProducts 
JOIN     tblSubCategory
ON       tblProducts.SubCategoryID = tblSubCategory.SubCategoryID
JOIN     tblCategory
ON       tblSubCategory.CategoryID = tblCategory.CategoryID
WHERE   CategoryName = 'Electrical Appliance' 
)
ORDER BY PR.ProductPrice DESC


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic 06 -  Mathmatical Functions -- use tblGenderMeasurements table. 
--Question 1 - Create an AVG for each of the parameters: Age, Height and Weight by Gender. finelly, ceil the AVG number on each of the parameters.
--Answer: 
SELECT     Gender, CEILING(AVG(age)) [Avg Age], CEILING(AVG(Height)) [Avg Height], CEILING(AVG(Weight)) [Avg Weight]   
FROM       tblGenderMeasurements
GROUP BY   Gender 


--Question 2 - Create the same query, but now floor the AVG numbers. 
--Answer: 
SELECT     Gender, FLOOR(AVG(age)) [Avg Age], FLOOR(AVG(Height)) [Avg Height], FLOOR(AVG(Weight)) [Avg Weight]   
FROM       tblGenderMeasurements
GROUP BY   Gender 


--Question 3 -  Create the same query, but now round the AVG numbers. 
--Answer: 
SELECT     Gender, ROUND(AVG(age),1) [Avg Age], ROUND(AVG(Height),2) [Avg Height], ROUND(AVG(Weight),3) [Avg Weight]   
FROM       tblGenderMeasurements
GROUP BY   Gender 


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic 07 - Date-Time Functions 
--Question 1 - show what is the date today
--Answer: 
SELECT GETDATE() AS DATE

--Question 2 - 
--A.show what is the current day of the month
--B. Show the day of the date '01/01/2019'
--Answer:
SELECT DAY(GETDATE()) AS DayDate
SELECT DAY('01/01/2019') AS DayDate

--Question 3 - 
--A.show what is the current month of the year
--B.Show the month of the date '01/01/2019' 
--Answer:
SELECT MONTH(GETDATE()) AS MonthOfYear
SELECT MONTH('01/01/2019') AS MonthOfDate

--Question 4 - 
--A.show what is the current year
--B.Show the year of the date '01/01/2019'
--Answer:
SELECT YEAR(GETDATE()) AS [Current Year] 
SELECT YEAR('01/01/2019') AS [Year Date] 

--Question 5 - show what is the datename of the day, weekday and month of the date '01/01/2019'
--Answer:
SELECT DATENAME(DAY, '01/01/2019') AS [Day]
SELECT DATENAME(WEEKDAY, '01/01/2019') AS [Week day]
SELECT DATENAME(MONTH, '01/01/2019') AS [Month of date] 

--Question 6 - NOTE! - Now use tlbEmployee Table. show the difference between the hire date and the current date by days. 
--Answer:
SELECT *,
       DATEDIFF(DAY,HireDate,GETDATE()) AS DateDiffByDay 
FROM tblemployee 

--Question 7 - NOTE! - Now use tlbEmployee Table. show the difference between the hire date and the current date by months. 
--Answer:
SELECT *,
       DATEDIFF(MONTH,HireDate,GETDATE()) AS DateDiffByMonths 
FROM tblemployee 


--Question 8 - NOTE! - Now use tlbEmployee Table. show the employee with the most high seniority in the work. 
--Answer:
SELECT   TOP 1 *,
         DATEDIFF(MONTH,HireDate,GETDATE()) AS DateDiffByDay 
FROM     tblemployee 
ORDER BY DateDiffByDay DESC


--Question 9 - NOTE! - Now use tlbEmployee Table. Add to the employee with the most high seniority in the work 2 months of work. 
--show all his profile.
--show months add to hire date (to add months you need a negative number)
--show date difference by months from hire date. 
--show date difference by months from the months adding date.   
--Answer:
SELECT   TOP 1 *,
         DATEADD (MONTH, 2, Hiredate) AS MonthsAdd,
         DATEDIFF(MONTH, HireDate, GETDATE()) AS DateDiffByMonths,
		 DATEDIFF(MONTH, DATEADD(MONTH,2,Hiredate), GETDATE()) AS DateDiffByMonthsAdd
FROM     tblemployee 
ORDER BY DateDiffByMonths DESC



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic 08 - String Functions - use tblStringTest Table
--Question 1 - see the gaps in the table and delete the gaps from the left side of the string. 
--Answer: 
SELECT LTRIM(FirstName) [First Name], 
       LTRIM(MiddleName) [Middle Name], 
	   LastName, 
	   Email 
FROM   tblStringTest

--Question 2 - see the gaps in the table and delete the gaps from the left side and the right side of the string. 
--Answer:
SELECT RTRIM(LTRIM(FirstName)) [First Name], 
       RTRIM(LTRIM(MiddleName)) [Middle Name], 
	   LastName, 
	   Email 
FROM   tblStringTest

--Question 3 - To check if the gaps was deleted USE len function to show the difference between the string length without the trim functions and with the trim function. 
-- show:
-- first name
-- len without trim - first name
-- first name with trim,
-- len with trim - first name, 
-- middle name
-- len without trim - middle name
-- middle name with trim, 
-- len with trim - middle name
--Answer:
SELECT FirstName,
       LEN(FirstName) AS [Len without Trim - first name],  
       RTRIM(LTRIM(FirstName)) [First Name with Trim],
	   LEN(RTRIM(LTRIM(FirstName))) [Len with Trim - First Name],
	   MiddleName, 
	   LEN(MiddleName) AS [Len without Trim - middle name],
       RTRIM(LTRIM(MiddleName)) [Middle Name with Trim],
	   LEN(RTRIM(LTRIM(MiddleName))) [Len with Trim - Middle Name]  
FROM   tblStringTest

--Question 4 - show all columns. Trim the first and last names. For the first name chage all characters to upper string, and for the Middle name chage all characters to lower string. 
--Answer:
SELECT UPPER(RTRIM(LTRIM(FirstName))) [First Name], 
       LOWER(RTRIM(LTRIM(MiddleName))) [Middle Name], 
	   LastName, 
	   Email 
FROM   tblStringTest


--Question 5 - pick up the first two letters from the left side of the first name coulumn. 
--Answer:
SELECT LEFT(RTRIM(LTRIM(FirstName)),2) AS TwoLetters
FROM   tblStringTest


--Question 6 - pick up the first two letters from the right side of the first name coulumn. 
--Answer:
SELECT RIGHT(RTRIM(LTRIM(FirstName)),2) AS TwoLetters
FROM   tblStringTest

--Question 7 - Connect the two letters from the left and right side of the first name into one string. 
--Answer:
SELECT CONCAT(LEFT(RTRIM(LTRIM(FirstName)),2), RIGHT(RTRIM(LTRIM(FirstName)),2)) FROM tblStringTest 

--Question 8 - revers the Connected string from the last question. 
--Answer:
SELECT REVERSE(CONCAT(LEFT(RTRIM(LTRIM(FirstName)),2), RIGHT(RTRIM(LTRIM(FirstName)),2))) FROM tblStringTest 


--Question 9 - show two columns - 1) Email, 2) The index character (@) of the Email in the table. 
--Answer: 
SELECT FirstName, 
       Email, 
	   CHARINDEX ('@', Email) [char index]  
FROM   tblStringTest

--Question 10 - Find only the domain part @aaa.com of the email - 'tomer@aaa.com'
--Answer: 
SELECT SUBSTRING('tomer@aaa.com', 7,7) AS [aaa.com]

--Question 11 :
--show full name without gaps - first name + middle name + last name 
--show the email
--show just the name from the email
--Show only the domain part of each email 
--show only the part from the right to the first point of the domain (com / co.il)
--replace the com/co.il with 'ZZZZZZZZ'
--Answer: 
select ISNULL(RTRIM(LTRIM(FirstName)) + ' ' + RTRIM(LTRIM(MiddleName)) + LastName, RTRIM(LTRIM(FirstName)) + ' ' + LastName)  AS [Full Name],
       Email, 
       SUBSTRING(Email, 1, CHARINDEX('@',Email)-1) as [Name],
       SUBSTRING(Email, CHARINDEX('@',Email), LEN(Email)) AS Domain,
	   SUBSTRING(Email, CHARINDEX('.',Email)+1, LEN(Email)) AS [com / co.il],
	   REPLACE(Email,SUBSTRING(Email, CHARINDEX('.',Email)+1, LEN(Email)),'ZZZZZZZ') AS [New Ending]
from tblStringTest

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic -09- Finding character - use tblCharacter
--Question 1 - find all the emails with the % symbol USE LIKE and []. 
--Answer:
SELECT * FROM tblcharacter WHERE Email LIKE '%[%]%'

--Question 2 - find all the emails with the % symbol USE LIKE and ESCAPE Function
--Answer:
SELECT * FROM tblcharacter WHERE Email LIKE '%!%%' ESCAPE '!'

--Question 3 - find all the emails with two % symbol USE CHARINDEX
--Answer:
SELECT *
FROM tblcharacter 
WHERE CHARINDEX ('%%', Email)  > 1

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic 10 - Patindex function - use tblPassword Table. 
--Question 1 - Extract all the passwords. if there is no password show the string.  
--Answer:
SELECT *,
       PATINDEX ('%[0-9]%', [Password]),
	   PATINDEX('%[0-9]%', REVERSE([Password])),
	   SUBSTRING([password], 
	             PATINDEX ('%[0-9]%', [Password]), 
				 (LEN([password]) - PATINDEX('%[0-9]%', REVERSE([Password]))+3) -  (PATINDEX ('%[0-9]%', [Password]))) as ExtractPassword    
FROM tblPassword

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic 11 - Counting Letters - use tblCountingLetters Table
--Question 1 - count how many 'e' letters there is in this string   
SELECT 'If you want to know SQL you need to practice everey day for 4 hours' AS String

--Answer:
SELECT String,
       LEN(String) AS [Total Letters], 
	   REPLACE(String, 'e',' ') AS [Replace 'e' with nothing],
	   LEN(REPLACE(String, 'e','')) AS [Number of letters without 'e'],
	   LEN(String) - LEN(REPLACE(String, 'e','')) AS [Number of 'e's] 
FROM tblCountingLetters

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic 12 - CAST and CONVERT functions - use tblEmployee Table. in question 3 - use tblproducts Table.
--Question 1 - Create a column - FullID (First name + Last name + ID Number), and show also the gender, email, salary and city. Use CAST function. 
--Answer: 
SELECT CAST(employeeID AS nvarchar (20)) + ' - ' + firstName + ' ' + lastName AS FullID,
       gender, 
	   Email, 
	   city
FROM   tblemployee 

--Question 2 - ADD to the query an convert function on the Hire date column. use the format that you want to make the date more readable for you.  
--Answer:
SELECT CAST(employeeID AS nvarchar (20)) + ' - ' + firstName + ' ' + lastName AS FullID,
       gender, 
	   Email, 
	   city,
	   CONVERT(nvarchar, HireDate, 103) AS HireDate
FROM   tblemployee 

--In the style parameter we have some format use can choose to add the CONVERT function. 
--Here all the formats we have: 
--101 = mm/dd/yyyy
--102 = yy.mm.dd
--103 = dd/mm/yyyy
--104- dd.mm.yy
--105- dd.mm.yy 

--Question 3 - NOTE! Now use tblproduct Table. Replace the null values in the tblproduct table into 'Food Category'. USE CAST Transact-SQL.    
--Answer: 
SELECT productID, ProductName, ProductPrice,
       ISNULL (CAST(SubCategoryID AS NVARCHAR (30)),'Food Category') AS SubCategoryID 
FROM tblProducts

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic 13 - Stored Procedure - use tblEmployee Table
--Question 1 -  Create SP to the query" select firstName, lastName, Gender, Email, Salary, City FROM tblEmployee 
--Answer: 
CREATE PROCEDURE GetInfoTblEmployee
AS 
BEGIN
   SELECT firstName, lastName, Gender, Email, Salary, City FROM tblEmployee 
END 

--Call the SP To see the info
EXEC GetInfoTblEmployee

--Delete the sp
DROP PROC GetInfoTblEmployee

--Question 2 -  Create SP to the query : 
-- select firstName, lastName, Gender, Email, Salary, City FROM tblEmployee
-- Create also an input parameters @gender, @city to call the sp for a more accurate info. 
--Answer:
CREATE PROCEDURE [Get info by gender and city] 
@gender NVARCHAR (20),
@city   NVARCHAR (20) 
AS
BEGIN
   SELECT firstName, 
          lastName, 
		  Gender, 
		  Email, 
		  Salary, 
		  City
   FROM   tblEmployee
   WHERE  gender = @gender AND city = @city 
END 

--Call the sp to see the info on Females from Tel-Aviv
EXEC [Get info by gender and city] 'Female', 'Tel-Aviv' 

--Call the sp to see the info on Males from Jerusalem
EXEC [Get info by gender and city] 'Male', 'Jerusalem' 

--Call the sp to see the info on Memales from Haifa
EXEC [Get info by gender and city] 'Female' , 'Haifa' 


--Question 3 -  Change the same SP: 
-- Add also an output parameters @EmployeeCount, @TotalSalary for the output info. 
-- At the end you need to insert the gender and the city, and to get the employee count and the total salary of this group. 
--Answer:
ALTER PROCEDURE [Get info by gender and city] 
@gender NVARCHAR (20),
@city   NVARCHAR (20),
@EmployeeCount INT OUTPUT,
@TotalSalary INT OUTPUT 
AS
BEGIN
   SELECT @EmployeeCount = COUNT(employeeID), @TotalSalary = SUM(Salary)
   FROM   tblEmployee
   WHERE  gender = @gender AND city = @city 
END 

--Call the SP and show how much Male employee we have in Tel-Aviv city and what their total salary
DECLARE @TotalCount INT, @SumSalary INT
EXEC [Get info by gender and city] @gender = 'Male', @city = 'Tel-Aviv',  @EmployeeCount = @TotalCount OUTPUT, @TotalSalary = @SumSalary OUTPUT 
SELECT @TotalCount AS [Employee Count], @SumSalary AS [Total Salary] 

--Call the SP and show how much Female employee we have in Haifa city and what their total salary
DECLARE @TotalCount INT, @SumSalary INT
EXEC [Get info by gender and city] @gender = 'Female', @city = 'Haifa',  @EmployeeCount = @TotalCount OUTPUT, @TotalSalary = @SumSalary OUTPUT 
SELECT @TotalCount AS [Employee Count], @SumSalary AS [Total Salary] 

--Delete the SP
DROP PROC [Get info by gender and city]


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic 14 - Index - use tblEmployee Table
--Question 1 -  What is the purpose of index? type your answer blow. 
--Answer: 
-- The existence of the right indexes, can drastically improve the performance of the query. 
-- If there is no index to help the query, then the query engine, checks every row in the table from the beginning to the end. This is called Table Scan. Table scan is bad for performance. 

--Question 2 - create an index for the salary column in tblemployee
--Answer:
CREATE INDEX IX_tblEmployee_Salary
ON tblEmployee (salary) 

--Question 3 - Check the index. 
--Answer:
SP_HELPINDEX tblemployee; 

--Question 4 - Delete the index
--Answer:
DROP INDEX tblemployee.IX_tblEmployee_Salary

--Question 5 - what is the main difference between clustered and non-Clustered indexes? 
--Answer:
--clustered index = unique index and behave like a PRIMARY KEY. Can by create just one time. the index is a part of the table. 
--non-clustered index = can be unique but not all the time. don't behave like a primary key. can be created multiple times. the index is not a part of the table. the query go's to the index, but from the outside. 

--Question 6 - what about the uniqueness of an index - clustered and non-clustered? 
--Answer A - clustered: Type your answer and the index syntax:
-- we can create for both of the indexes uniqueness. 
-- to the non-clustered we type 
CREATE UNIQUE NONCLUSTERED INDEX IX_NAME
ON TABLE_NAME (TABLE_COLUMN) 

--Answer B - Non clustered: Type your answer and the index syntax:
-- To the clustered we first need to delete any of the unique key and then type: 
CREATE UNIQUE CLUSTERED INDEX IX_NAME
ON TABLE_NAME (TABLE_COLUMN) 


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic 15 - Views - use tblEmployee Table and tblDepartment Table. 
--Question 1 -  what is a view?  
--Answer: 
-- A view is nothing more than a saved SQL query.

--Question 2 - What are the Advantages of views?
--Answer:  
-- Views can be used to reduce the complexity of the database schema.
-- Views can be used as a mechanism to implement row and column level security. 

--Question 3 - create a view just for the IT Head so he can see just the info of he's employees. NOTE! - Use the tbleEmployee and tblDepartment Tables. 
--Answer: 
CREATE VIEW VWITEmployeesByDepartment
AS
SELECT EM.employeeID, EM.firstName, EM.lastName, EM.gender, EM.Email, EM.PhoneNumber, EM.HireDate, EM.salary, DP.DepartmentName
FROM   tblemployee AS EM
JOIN   tbldepartment AS DP 
ON     EM.DepartmentID = DP.DepartmentID
WHERE  DP.DepartmentName = 'IT'

-- Call the view
SELECT * FROM VWITEmployeesByDepartment 

-- Delete the view
DROP VIEW VWITEmployeesByDepartment

--Question 4 - create a view to all the info of the employee include departmentname. do not include the salary column. 
--Answer: 
CREATE VIEW VWEmployeesByDepartment
AS
SELECT EM.employeeID, EM.firstName, EM.lastName, EM.gender, EM.Email, EM.PhoneNumber, EM.HireDate, DP.DepartmentName
FROM   tblemployee AS EM
JOIN   tbldepartment AS DP 
ON     EM.DepartmentID = DP.DepartmentID

-- Call the view
--Answer:
SELECT * FROM VWEmployeesByDepartment

--If you don't know the create statement of a view - how can you know what was it? 
--Answer:
SP_HELPTEXT VWEmployeesByDepartment

-- Delete the view
--Answer:
DROP VIEW VWEmployeesByDepartment

--Question 5 - create a view to the super boss to see which department cost the most. 
--Answer: 
CREATE VIEW VW_Total_Cost_By_Department
AS
SELECT    DP.DepartmentName, SUM(EM.Salary) AS [Total Cost] 
FROM      tblemployee AS EM
JOIN      tbldepartment AS DP 
ON        EM.DepartmentID = DP.DepartmentID
GROUP BY  DP.DepartmentName

-- Call the view
--Answer:
SELECT * FROM VW_Total_Cost_By_Department
ORDER BY [Total Cost] DESC

-- Delete the view
--Answer:
DROP VIEW VW_Total_Cost_By_Department


--Question 6 - Is it possible to update the view? 
--Answer: 
-- yes but just if the view based on one table. if it based on multiple tables, the update will not implemented the right way. 


--Question 7 - Is it possible to create an index on a view? 
--Answer: 
-- yes it is possible. the index will make the view query more quicker! 
CREATE INDEX IX_NAME
ON VIEW_NAME (VIEW_COLUMN) 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic 16 - User Defined Functions - use tblEmployee Table and tblDepartment Table. 
--Question 1 -  create a function so when you type the department name you get all the total cost of the department by employees salary.  
--Answer: 
CREATE FUNCTION FN_CalculateSalary(@DepartmentName NVARCHAR (20))
RETURNS INT
AS 
BEGIN
	RETURN (SELECT SUM(Salary) 
	        FROM   tblemployee AS A
			JOIN   tblDepartment AS B
			ON     A.DepartmentID = B.DepartmentID
	        WHERE  B.DepartmentName = @DepartmentName)
END 

--Call the function to see the info of the HR Department
SELECT dbo.FN_CalculateSalary ('HR') 


--Question 2 -  change the function so when you type the department name and the gender you get all the total cost of the department by employees gender and salary.  
--Answer: 
ALTER FUNCTION FN_CalculateSalary(@DepartmentName NVARCHAR (20), @Gender NVARCHAR (20))
RETURNS INT
AS 
BEGIN
	RETURN (SELECT SUM(Salary) 
	        FROM   tblemployee AS A
			JOIN   tblDepartment AS B
			ON     A.DepartmentID = B.DepartmentID
	        WHERE  B.DepartmentName = @DepartmentName 
			AND    A.gender = @Gender)
END 


--Call the function to see the Salary of the females in the HR Department
SELECT dbo.FN_CalculateSalary ('HR', 'Female') 


--Show the function create statement
SP_HELPTEXT FN_CalculateSalary

--Delelte the function
DROP FUNCTION dbo.FN_CalculateSalary 


--Question 3 - NOTE! Use the tblcategory, tblsubcategory and tblproducts Tables. 
-- create a function that calculate the total cost of all the products by category
--Answer: 	  
CREATE FUNCTION CalculatePrice (@CategoryName NVARCHAR (20))
RETURNS INT 
AS
BEGIN
    RETURN
	(
	SELECT SUM(PR.ProductPrice)
	FROM   tblProducts AS PR
	JOIN   tblSubCategory AS SC
	ON     PR.SubCategoryID = SC.SubCategoryID
	JOIN   tblCategory AS CA
	ON     SC.CategoryID = CA.CategoryID
	WHERE  CategoryName = @CategoryName
	)
END 

--Choose your category name and implement in the function: Kitchen, Living Room, Bedroom, Electrical appliance
--Answer:
SELECT dbo.CalculatePrice ('bedroom') AS [Category Product Price] 

--Question 4 - use the tblcategory, tblsubcategory and tblproducts Tables. 
-- change the function so it would be more accurate - change the category to subcategory. 
--Answer: 
ALTER FUNCTION CalculatePrice (@SubCategoryName NVARCHAR (20))
RETURNS INT 
AS
BEGIN
    RETURN
	(
	SELECT SUM(PR.ProductPrice)
	FROM   tblProducts AS PR
	JOIN   tblSubCategory AS SC
	ON     PR.SubCategoryID = SC.SubCategoryID
	JOIN   tblCategory AS CA
	ON     SC.CategoryID = CA.CategoryID
	WHERE  SubCategoryName = @SubCategoryName
	)
END 

--Choose your subcategory name and implement in the function:  
--Kitchen (Sink, Tap, Capboard)
--Living Room (Couch, Dining table, Easy Chair)
--Bedroom (Bed, Desk, Mirror)
--Electrical appliance (Television, Washing Machine, Electric Heater)
SELECT dbo.CalculatePrice ('sink') 

--Delete the function: 
DROP FUNCTION dbo.CalculatePrice 


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic 17 - Temporary Tables - TWO GROUP OF TABLES: A.(tblProduct, tblSubCategory, tblCategory), B.(tblEmployee, tblDepartment)  
--Question 1 -  what are the types of temporary tables? 
--Answer: 
-- the first type is local table and the second is global table. 
--the local is used just to the session it is created in, and the global is used in all the sessions. 
--Both of them are created in the tempdb database. 
--when a session of a local temporary table is closed it is deleted automatically. when all the sessions of a global temporary table are closed it is deleted automatically. 

--Question 2 -  why we use temporary tables?  
--Answer: 
--we use it to reduce the complaxity of a quary and reduce also the time of the query output. 
--for example, lets say we have a big database and we want to create a join between 4 tables. 
--now, in our work we need that join to process its data from a diferent angle. what can we do? 
--insted typing the join over and over again, we can insert all the join data into a temporary table (local or global). 
--now, when the join is available in a table, the complaxity of the quary, and the output time is reduced. 

--Question 3 -  create a join between the tblcategory, tblsubcategory and tblproducts. show productid, productName, productPrice, SubCategoryName, CategoryName. insert that join into a temporary table. 
--step one- create the join
--Answer:
SELECT PR.ProductID, PR.ProductName, PR.ProductPrice, SC.SubCategoryName, CA.CategoryName
FROM   tblProducts AS PR
JOIN   tblSubCategory AS SC
ON     PR.SubCategoryID = SC.SubCategoryID
JOIN   tblCategory AS CA
ON     SC.CategoryID = CA.CategoryID  

--step two - insert the query into temptable
--Answer:
SELECT PR.ProductID, PR.ProductName, PR.ProductPrice, SC.SubCategoryName, CA.CategoryName into #TempTable
FROM   tblProducts AS PR
JOIN   tblSubCategory AS SC
ON     PR.SubCategoryID = SC.SubCategoryID
JOIN   tblCategory AS CA
ON     SC.CategoryID = CA.CategoryID  


--select all the data from the #temptable
--Answer:
SELECT * FROM #TempTable

--select all the data on sub category name - sink from the #temptable
--Answer:
SELECT * FROM #TempTable
WHERE SubCategoryName = 'Sink'  

--show the total price of the sink sub category product
--Answer:
SELECT SubCategoryName, SUM(ProductPrice) AS TotalPrice 
FROM   #TempTable
GROUP BY SubCategoryName
HAVING SubCategoryName = 'Sink'

--delete #tempetable
--Answer:
DROP TABLE #TempTable


--Question 4 -  create a join between the tblemployee and tblDepartment tables. show employeeID, FullName, email, salary, hiredate, departmentName. insert that join into a temptable. 
--step one - create the join
--Answer: 
SELECT EM.employeeID, firstName + ' ' + lastName AS FullName, EM.Email, EM.salary, EM.city, EM.HireDate, DP.DepartmentName
FROM   tblemployee AS EM
JOIN   tblDepartment AS DP
ON     EM.DepartmentID = DP.DepartmentID

--step two - insert the query into temptable
--Answer:
SELECT EM.employeeID, firstName + ' ' + lastName AS FullName, EM.Email, EM.salary, EM.city, EM.HireDate, DP.DepartmentName INTO #TempTable2 
FROM   tblemployee AS EM
JOIN   tblDepartment AS DP
ON     EM.DepartmentID = DP.DepartmentID

--Select all the data from the #temptable 2 
--Answer:
SELECT * FROM #TempTable2

--Select all the employees from department Name 'HR'
--Answer:
SELECT * FROM #TempTable2
WHERE  DepartmentName = 'HR'

--Select the newest employee of the HR (by Hire Date) department and give him a 15% gift for entering our company
--Answer: 
SELECT TOP 1 *, DATEDIFF(MONTH,HireDate,GETDATE()) AS DateCheck, salary * 0.15 AS [15% Gift] FROM #TempTable2
WHERE DepartmentName = 'HR'   
ORDER BY DateCheck

--Delete #temptable2 
--Answer:
DROP TABLE #TempTable2  
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic 18 - If Statements - use tblemployee Table
--Question 1 -  what is the Basic syntax of if statements in sql server? 
--Answer:
SELECT IIF(Boolean Expression, true_value, false_value) 


--Question 2 -  Returns Black as the boolean expression evaluates to TRUE 
--A. First declare variable - color type int
--B. second - set the variable on 1
--C. third - create an if statement. Black is true and whit is false. 
--Answer:
DECLARE @Color INT
SET @Color = 1;

SELECT IIF (@Color =1 , 'Black', 'Whit') AS Color


--Question 3 -  Create a CASE Statemet to tblemployee. all the employees before and equal to the year 2008 are seniors and all the employees after 2008 are juniors.  
--Answer:
SELECT *, 
       CASE WHEN YEAR(HireDate) <= 2008 
	        THEN 'Senior'
			ELSE 'Junior'
	   END AS Senior 
FROM tblemployee 

--Question 4 -  Replace the CASE Stetement with IIF Statement  
--Answer:
SELECT *,
       IIF(YEAR(HireDate) <= 2008, 'Senior', 'Junior') AS Senior
FROM   tblemployee 


--Question 5 -  create a store procedure (SP) to the last query. use if statement for three cases: 
--01- if statement to choose 'All' the employees
--02- if statement to choose 'Senior' employees
--03- if statement to choose 'Junior' employees
--04- create error typing message. 
--step one - create the sp and create the first if statement
--Answer:
CREATE PROCEDURE SP_Get_Employees
@EmployeeInfo NVARCHAR (20) 
AS
BEGIN
      IF @EmployeeInfo = 'All'
	     BEGIN
		       SELECT *, 
			          IIF(YEAR(HireDate) <= 2008, 'Senior', 'Junior') AS Senior 
			   FROM   tblemployee 
		 RETURN 
		 END
END 

--step two - Add the second the the third if statements + error typing message
--Answer: 
ALTER PROCEDURE SP_Get_Employees
@EmployeeInfo NVARCHAR (20) 
AS
BEGIN
      IF @EmployeeInfo = 'All'
	     BEGIN
		       SELECT *, 
			          IIF(YEAR(HireDate) <= 2008, 'Senior', 'Junior') AS Senior 
			   FROM   tblemployee 
		 RETURN 
		 END

	  IF @EmployeeInfo = 'Senior'
	     BEGIN
		 	   SELECT * FROM 
			   (
			   SELECT *, 
			         IIF(YEAR(HireDate) <= 2008, 'Senior', 'Junior') AS Senior 
			   FROM  tblemployee
			   ) AS TEMP
			   WHERE Senior = 'Senior'
		 RETURN
		 END

	IF @EmployeeInfo = 'Junior'
	     BEGIN
		 	   SELECT * FROM 
			   (
			   SELECT *, 
			         IIF(YEAR(HireDate) <= 2008, 'Senior', 'Junior') AS Senior 
			   FROM  tblemployee
			   ) AS TEMP
			   WHERE Senior = 'Junior'
		 RETURN
		 END

	 SELECT 'You must choose ALL, senior or Junior' AS [Message!!] -- this messege will pop up if all the condition are not met within the if statemetns.
END 

--slelect all the employees
--Answer:
EXEC SP_Get_Employees 'ALL'

--select just the senior employees
--Answer:
EXEC SP_Get_Employees 'Senior' 

--select just the junior employees 
--Answer:
EXEC SP_Get_Employees 'Junior' 

--select one of the three options but with spelling mistake
--Answer:
EXEC SP_Get_Employees 'Junior123' 



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic -19- Derived Tables - use tblProducts, tblSubCategory and tblCategoty Tables
--Question 1 -  what is the Basic syntax of derived tables? 
--Answer:
SELECT Column_Name FROM 
(
SQL_Query (Basic_Select_statement, Joins) 
)AS Derived_Table_Name
+ Condition 


--Question 2 -  what is difference between derived tables and temporary tables? 
--Answer:
-- they act the same. but, temporary table are stored in the tempdb data base where as derived tables are specific to that query.  


--Question 3 - 
--Step one: create an inner join between tblProducts, tblSubCategory and tblCategoty. Select the ProductName, ProductPrice, SubCategoryName, CategoryName. 
--Answer:
SELECT      PR.ProductName, PR.ProductPrice, SC.SubCategoryName, CA.CategoryName 
FROM        tblProducts AS PR
INNER JOIN  tblSubCategory AS SC
ON          PR.SubCategoryID = SC.SubCategoryID
INNER JOIN  tblCategory AS CA
ON          SC.CategoryID = CA.CategoryID

--Step two: create a derived table to the join and select all the data from categoryname = 'Living Room'
--Answer: 
SELECT * FROM 
(
SELECT      PR.ProductName, PR.ProductPrice, SC.SubCategoryName, CA.CategoryName 
FROM        tblProducts AS PR
INNER JOIN  tblSubCategory AS SC
ON          PR.SubCategoryID = SC.SubCategoryID
INNER JOIN  tblCategory AS CA
ON          SC.CategoryID = CA.CategoryID
) AS ProductsName
WHERE CategoryName = 'Living Room' 


--Question 4 - To the same derived table create an if statement - all the products with product price above or equal to 5000 are 'High Price' and all the rest are 'Low Price'. 
--Answer:  
SELECT *, IIF(ProductPrice >= 5000, 'High Price', 'Low Price') AS [Price Category] FROM 
(
SELECT      PR.ProductName, PR.ProductPrice, SC.SubCategoryName, CA.CategoryName 
FROM        tblProducts AS PR
INNER JOIN  tblSubCategory AS SC
ON          PR.SubCategoryID = SC.SubCategoryID
INNER JOIN  tblCategory AS CA
ON          SC.CategoryID = CA.CategoryID
) AS ProductsName
WHERE CategoryName = 'Living Room' 
ORDER BY ProductPrice DESC


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic -20- Row Number and Partition by - use tblemployee Table
--Question 1 - Create row number on the employeeID column.
--Answer:
SELECT *, ROW_NUMBER () OVER (ORDER BY EmployeeID) AS RN 
FROM tblEmployee 

--Question 2 - Create row number on the employeeID column but in the opposite order. 
--Answer:
SELECT *, ROW_NUMBER () OVER (ORDER BY EmployeeID DESC) AS RN 
FROM tblEmployee 

--Question 3 - Create row number on the gender column. for each gender give it's own numbers. USE PARTITION BY. 
--Answer: 
SELECT *, ROW_NUMBER () OVER (PARTITION BY Gender ORDER BY Gender) AS RN
FROM   tblemployee 

--Question 4 
--Step one: Create a salary type column - for salary above or equal 5000 give 'High Salary' and for the rest give 'Low Salary'
--Answer: 
SELECT *, IIF(Salary >= 5000, 'High Salary', 'Low Salary') AS [Salary Type]
FROM   tblemployee


--Step two: now, to the new column create a row number for each group. inside each group rank the employees form the highest salary to the lowest salary. 
--Answer:  
SELECT *, ROW_NUMBER () OVER (PARTITION BY [Salary Type] ORDER BY Salary DESC) AS [Salary Ranking] FROM 
(
SELECT *, IIF(Salary >= 5000, 'High Salary', 'Low Salary') AS [Salary Type]
FROM   tblemployee
) AS Temp 

--Step three: select the highest salary from each group
--Answer:
SELECT * FROM 
( 
SELECT *, ROW_NUMBER () OVER (PARTITION BY [Salary Type] ORDER BY Salary DESC) AS [Salary Ranking] FROM 
(
SELECT *, IIF(Salary >= 5000, 'High Salary', 'Low Salary') AS [Salary Type]
FROM   tblemployee
) AS Temp 
) AS Temp2
WHERE [Salary Ranking] = 1


--Step four: select the lowest salary from each group
--Answer:
SELECT * FROM 
( 
SELECT *, ROW_NUMBER () OVER (PARTITION BY [Salary Type] ORDER BY Salary DESC) AS [Salary Ranking] FROM 
(
SELECT *, IIF(Salary >= 5000, 'High Salary', 'Low Salary') AS [Salary Type]
FROM   tblemployee
) AS Temp 
) AS Temp2 
WHERE salary IN (SELECT MIN(Salary) FROM 
				(
				SELECT *, IIF(Salary >= 5000, 'High Salary', 'Low Salary') AS [Salary Type]
				FROM   tblemployee
				) AS Test 
				GROUP BY [Salary Type])


--Step Five: select the lowest and highest salary from each group and show them in a single table order by salary
--Answer:

SELECT * FROM 
( 
SELECT *, ROW_NUMBER () OVER (PARTITION BY [Salary Type] ORDER BY Salary DESC) AS [Salary Ranking] FROM 
(
SELECT *, IIF(Salary >= 5000, 'High Salary', 'Low Salary') AS [Salary Type]
FROM   tblemployee
) AS Temp 
) AS Temp2
WHERE [Salary Ranking] = 1

UNION ALL 

SELECT * FROM 
( 
SELECT *, ROW_NUMBER () OVER (PARTITION BY [Salary Type] ORDER BY Salary DESC) AS [Salary Ranking] FROM 
(
SELECT *, IIF(Salary >= 5000, 'High Salary', 'Low Salary') AS [Salary Type]
FROM   tblemployee
) AS Temp 
) AS Temp2 
WHERE salary IN (SELECT MIN(Salary) FROM 
				(SELECT *, IIF(Salary >= 5000, 'High Salary', 'Low Salary') AS [Salary Type] FROM tblemployee) AS MinSalary
				GROUP BY [Salary Type])
ORDER BY salary DESC

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic -21- Dense Rank and Partition by - use tblemployee Table
--Question 1 - Create Dense Rank on the salary column from highest to lowest salary. 
--Answer:
SELECT *, DENSE_RANK () OVER (ORDER BY salary DESC) RNK
FROM   tblemployee 

--Question 2 - Create Dense Rank on the salary column from highest to lowest salary by gender
--Answer:
SELECT *, DENSE_RANK () OVER (PARTITION BY Gender ORDER BY Salary DESC) [Salary_Gender RNK] 
FROM   tblemployee 

--Question 3 - Create Dense Rank on the salary column from highest to lowest salary by city
--Answer:
SELECT *, DENSE_RANK () OVER (PARTITION BY City ORDER BY Salary DESC) [Salary_City RNK] 
FROM   tblemployee 

--Question 4 - find the AVG Salary of each city and rank it compare to the other cities. 
--Answer:
SELECT *, DENSE_RANK () OVER (ORDER BY [Salary AVG By City] DESC) AS [Avg RNK by City]  FROM 
(
SELECT   city, AVG(salary) [Salary AVG By City] 
FROM     tblemployee 
GROUP BY city
) AS AVG_Salary_City

--Question 5 - 
--Step One: find the AVG Salary of each city and gender
--Answer:
SELECT   city, gender, AVG(salary) [Salary AVG By City] 
FROM     tblemployee 
GROUP BY city, gender 

--Step Two: create a derived table to the query and name it Salary_City_Gender. Order the table by city. 
--Answer:
SELECT * FROM 
(
SELECT   city, gender, AVG(salary) [Salary AVG By City] 
FROM     tblemployee 
GROUP BY city, gender 
) AS AVG_Salary_City_Gender
ORDER BY city

--Step Three: because we have duplicate rows for each city, change the second row of each city into null values. use row number to count the duplicate and then use another derived table to create a case condition on the row number to replace the values.  
--Answer: 
SELECT CASE WHEN City_RN = 2 THEN NULL ELSE city END AS City, gender, [Salary AVG By City] FROM 
(
SELECT *, ROW_NUMBER () OVER (PARTITION BY City ORDER BY City) AS City_RN FROM 
(
SELECT   city, gender, AVG(salary) [Salary AVG By City] 
FROM     tblemployee 
GROUP BY city, gender 
) AS AVG_Salary_City_Gender
) AS AVG_Salary_City_Gender2

--Step Four: rank the gender salary avg in each city. kept the table structure.
--Answer: 
SELECT CASE WHEN City_RN = 2 THEN NULL ELSE city END AS City, 
       gender, 
	   [Salary AVG By Gender and City],
	   DENSE_RANK () OVER (PARTITION BY city ORDER BY [Salary AVG By Gender and City] DESC) AS [Salary AVG RNK By Gender]
FROM 
(
SELECT *, ROW_NUMBER () OVER (PARTITION BY City ORDER BY City) AS City_RN FROM 
(
SELECT   city, gender, AVG(salary) [Salary AVG By Gender and City] 
FROM     tblemployee 
GROUP BY city, gender 
) AS AVG_Salary_City_Gender
) AS AVG_Salary_City_Gender2


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic -22- CTE - Common table expresion - use tblemployee and tblDepartment Table
--Question 1 - what is the basic syntax of CTE? 
--Answer:
WITH CTE_NAME (CTE_COLUMN)
AS
(
SQL_Server_Query
)
SELECT CTE_COLUMN FROM CTE_NAME

--Question 2 - Create a join between tblEmployee and tblDepartment Tables. then create a CTE and show the full data of the join. select employeeID, FirstName, LastName, Gender, Email, PhoneNumer, Salary, City, HireDate, DepartmentName, DepartmentHead.  
--Answer:
;WITH CTE_Get_Data 
AS
(
SELECT EM.employeeID,
       EM.firstName, 
	   EM.lastName, 
	   EM.gender, 
	   EM.Email, 
	   EM.PhoneNumber, 
	   EM.salary, 
	   EM.city, 
	   EM.HireDate, 
	   DP.DepartmentName,
	   DP.DepartmentHead
FROM   tblemployee AS EM
JOIN   tblDepartment AS DP
ON     EM.DepartmentID = DP.DepartmentID
)
SELECT * FROM CTE_Get_Data


--Question 3 -From the same cte select just the employees of the department head named roth 
--Answer:
;WITH CTE_Get_Data 
AS
(
SELECT EM.employeeID,
       EM.firstName, 
	   EM.lastName, 
	   EM.gender, 
	   EM.Email, 
	   EM.PhoneNumber, 
	   EM.salary, 
	   EM.city, 
	   EM.HireDate, 
	   DP.DepartmentName,
	   DP.DepartmentHead
FROM   tblemployee AS EM
JOIN   tblDepartment AS DP
ON     EM.DepartmentID = DP.DepartmentID
)
SELECT * FROM CTE_Get_Data
WHERE  DepartmentHead = 'Roth'

--Question 4 -From the same cte  find the avg salary of the department head named Shimi and show also he's department name. 
--Answer:
;WITH CTE_Get_Data 
AS
(
SELECT EM.employeeID,
       EM.firstName, 
	   EM.lastName, 
	   EM.gender, 
	   EM.Email, 
	   EM.PhoneNumber, 
	   EM.salary, 
	   EM.city, 
	   EM.HireDate, 
	   DP.DepartmentName,
	   DP.DepartmentHead
FROM   tblemployee AS EM
JOIN   tblDepartment AS DP
ON     EM.DepartmentID = DP.DepartmentID
)
SELECT   DepartmentHead, DepartmentName, AVG(salary) AS AvgSalary FROM CTE_Get_Data
WHERE    DepartmentHead = 'shimi'
GROUP BY DepartmentHead, DepartmentName


--Question 5 - create a row number on the salary by gender and select the top employee from each gender with CTE. Create a dense rank to rank their salary Within the CTE. 
--Answer:
;WITH CTE
AS
(
SELECT *, ROW_NUMBER () OVER (PARTITION BY Gender ORDER BY Salary DESC) AS RN 
FROM tblemployee 
)
SELECT *, DENSE_RANK () OVER (ORDER BY Salary DESC) AS RNK FROM CTE
WHERE RN = 1 



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic -23- Duplicate values  - use tblDuplicates Table
--Question 1 - show all the duplicate rows
--Answer:
SELECT * FROM tblDuplicates
WHERE NumberID IN 
( 
SELECT NumberID AS CountDuplicate
FROM tblDuplicates
GROUP BY NumberID
HAVING COUNT(*) = 2
)

--Question 2 - show just single rows. exclude all duplicates rows. 
--Answer:
;WITH CTE
AS
(
SELECT NumberID, FirstName, LastName, Age, Email, Hobby, MAX(Age) AS MaxAge
FROM tblduplicates
GROUP BY  NumberID, FirstName, LastName, Age, Email, Hobby
)
SELECT NumberID, FirstName, LastName, Age, Email, Hobby FROM CTE 


--Question 3 - show just the single rows in the table. exclude all the duplicates. 
--Answer:
SELECT NumberID, FirstName, LastName, Email, Hobby, Age, COUNT(*) AS CountDuplicate 
FROM tblDuplicates
GROUP BY NumberID, FirstName, LastName, Email, Hobby, Age
HAVING COUNT(*) != 2


--Question 4 - show just single rows from the duplicate rows.
--Answer:
SELECT NumberID, FirstName, LastName, Email, Hobby, Age, COUNT(*) AS CountDuplicate 
FROM tblDuplicates
GROUP BY NumberID, FirstName, LastName, Email, Hobby, Age
HAVING COUNT(*) = 2


--Question 5 - delete the duplicate rows. do not delete the rows if you want to practice on the table! Just type your answer.
--Answer:
;WITH CTE
AS
(
SELECT *, ROW_NUMBER () OVER (PARTITION BY NumberID ORDER BY NumberID) RN
FROM    tblDuplicates
)
DELETE FROM CTE WHERE RN = 2; 



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic -24- Ntile function - use tblEmployee Table, tblProduct, tblSubCategory, tblCategory Tables
--Question 1 - devide the employee to three groups using NTILE function
--Answer:
SELECT *, NTILE (3) OVER (ORDER BY Salary DESC) AS NTL
FROM    tblemployee 


--Question 2 - devide the employee into two groups within the gender using NTILE function
--Answer:
SELECT *, NTILE (2) OVER (PARTITION BY Gender ORDER BY Salary) AS NTL
FROM    tblemployee 

--Question 3 - devide the employee into two groups within the departmentID using NTILE function
--Answer:
SELECT *, NTILE (2) OVER (PARTITION BY DepartmentID ORDER BY Salary) AS NTL
FROM    tblemployee 

--Question 4 -
--Step one: create a join between tblProduct, tblSubCategory, tblCategory - select the productName, ProductPrice, SubCategoryName, CategoryName. 
--Answer:
SELECT PR.ProductName, PR.ProductPrice, SC.SubCategoryName, CA.CategoryName
FROM   tblProducts AS PR
JOIN   tblSubCategory AS SC
ON     PR.SubCategoryID = SC.SubCategoryID
JOIN   tblCategory AS CA
ON     SC.CategoryID = CA.CategoryID


--Step Two: create an CTE on the join and use the NLTILE function to devide the ProductPrice by 4. Then insert the CTE into a temporary table. 
--Answer:
;WITH CTE
AS
(
SELECT PR.ProductName, PR.ProductPrice, SC.SubCategoryName, CA.CategoryName
FROM   tblProducts AS PR
JOIN   tblSubCategory AS SC
ON     PR.SubCategoryID = SC.SubCategoryID
JOIN   tblCategory AS CA
ON     SC.CategoryID = CA.CategoryID
)
SELECT *, NTILE (4) OVER (ORDER BY ProductPrice) AS NTL_4_ProductPrice INTO #TempTable33 
FROM   CTE

--Step Three: select the most expensive products from the temporary table and rank them from high to low. 
--Answer:
SELECT *, DENSE_RANK () OVER (ORDER BY ProductPrice DESC) AS RNK_Expensive_Product_Price 
FROM   #TempTable33
WHERE  NTL_4_ProductPrice = 4



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic -25- Lag and Lead function - use tblSalary Table
--Question 1 (LAG Question) - create an avg on the salary by year. insert the query into CTE and use LAG to see the privious AVG Salary by yaer. 
--Answer:
;WITH CTE 
AS
(
SELECT YEAR([Date - Salary Payment]) AS [Year], AVG(Salary) AS [AVG Salary by Year]  
FROM   tblSalary
GROUP BY YEAR([Date - Salary Payment])
)
SELECT *, LAG([AVG Salary by Year]) OVER (ORDER BY [Year]) AS [Privious AVG Salary by Year] 
FROM   CTE 

--Question 2 (LAG Question) - on the last CTE find the yearly percent of change between the avg year salary and the privious avg year salary. Add to the calculation % symbol. percantage of change = ((day/month/year - privious day/month/year)*100)/privious day/month/year
--Answer:
;WITH CTE 
AS
(
SELECT YEAR([Date - Salary Payment]) AS [Year], ROUND(AVG(Salary),2) AS [AVG Salary by Year]  
FROM   tblSalary
GROUP BY YEAR([Date - Salary Payment])
)
SELECT *, LAG([AVG Salary by Year]) OVER (ORDER BY [Year]) AS [Privious AVG Salary by Year],
          '%' + CAST(CAST((([AVG Salary by Year] -  LAG([AVG Salary by Year]) OVER (ORDER BY [Year])) *100)/LAG([AVG Salary by Year]) OVER (ORDER BY [Year]) AS decimal (8,4)) AS nvarchar (40))  AS [Yearly % Change] 
FROM   CTE 


--Question 3 (LEAD Question) - in the tblProduct find the product price gap between the most expensive product and the cheapest product by the same category. Use CTE and insert it's values into a #temptable.   
--Answer:
;WITH CTE
AS
(
SELECT PR.ProductName, 
       PR.ProductPrice, 
	   CA.CategoryName,
	   DENSE_RANK () OVER (PARTITION BY CategoryName ORDER BY ProductPrice DESC) AS RNK
FROM   tblProducts AS PR
JOIN   tblSubCategory AS SC
ON     PR.SubCategoryID = SC.SubCategoryID
JOIN   tblCategory AS CA
ON     SC.CategoryID = CA.CategoryID
)
SELECT * INTO #TempTable200 FROM CTE 
WHERE  RNK IN (1,9)
UNION ALL 
SELECT * FROM CTE 
WHERE RNK = 8 AND CategoryName != 'Electrical appliance'
ORDER BY CategoryName, RNK 

--call the #temptable, and add two columns:
-- 1)Low Price By Category. Use lead function. also, convert the high price in this column into a null values.  
-- 2)Gap Between Expansive and cheapest products by category. Calaulate the difference between the higher price vs lower price. convert the negative numbers into null values. 
--Answer:   

SELECT *, 
       CASE WHEN RNK IN (8,9) THEN NULL ELSE LEAD (ProductPrice) OVER (ORDER BY CategoryName) END AS [Low Price by Category],
	   CASE WHEN RNK IN (8,9) THEN NULL ELSE ProductPrice - LEAD (ProductPrice) OVER (ORDER BY CategoryName) END AS [Gap Between Expensive and cheapest products by category] 
FROM #TempTable200

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic -26- Sliding Window - use tblSalary Table, use tblEmployee Table
--Question 1 - NOTE! Use tblEmployee - find the total salary of all the employees. Use sliding window function. 
--Answer:
SELECT *, 
       SUM (Salary) OVER () [Total Salary]  
FROM   tblemployee 

--Question 2 - NOTE! Use tblEmployee - find the total salary of all the employees by each department. Use sliding window function. 
--Answer:
SELECT *, 
       SUM (Salary) OVER (ORDER BY DepartmentID) [Total Salary]  
FROM   tblemployee 


--Question 3 - NOTE! Use tblSalary - find the total salary of each employee. 
--Answer:
SELECT *,
       SUM (Salary) OVER (ORDER BY EmployeeID) [Total Salary] 
FROM   tblSalary 


--Question 4 - NOTE! Use tblSalary - find the total salary of each year. in each year show the salary cost of each employee that contribute to the total salary of each year. finally create a row number partition by year and order by employeeID.  
--Answer:
SELECT *,
       SUM (Salary) OVER (PARTITION BY YEAR([Date - Salary Payment]) ORDER BY EmployeeID) [Total Salary],
	   ROW_NUMBER () OVER (PARTITION BY YEAR([Date - Salary Payment]) ORDER BY EmployeeID) RN 
FROM   tblSalary 


--Question 5 - NOTE! Use tblSalary - insert the last query into a CTE and show for each year the total salary cost in a single row. show just year and total salary.  
--Answer:
;WITH CTE
AS
(
SELECT *,
       SUM (Salary) OVER (PARTITION BY YEAR([Date - Salary Payment]) ORDER BY EmployeeID) [Total Salary],
	   ROW_NUMBER () OVER (PARTITION BY YEAR([Date - Salary Payment]) ORDER BY EmployeeID) RN
FROM   tblSalary 
) 
SELECT YEAR([Date - Salary Payment]) [Year], [Total Salary]
FROM CTE
WHERE RN=12


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic -27- Basic Pivot - use tblSalary Table
--Question 1 - Create a pivot table where X = EmployeeName, Y = Year and Z = Salary. 
--Answer:
SELECT * 
FROM (
SELECT EmployeeName, YEAR([Date - Salary Payment]) AS [Year], Salary
FROM   tblSalary
) AS tbl 
	PIVOT
	(
	MAX(Salary)
	FOR EmployeeName IN ([Shlomi], [Shira], [Ester], [Eli], [Sima], [Robin], [Eyal], [Matan], [Hanan], [Amir], [Miryam], [Oshri]) 
	) AS PVT

--Question 2 - Create the same pivot. but this time use dynamic pivot. to do so follow these steps: 
--01- Declare a variable @EmployeeName NVARCHAR
--02- Declare another variable @Query NVARCHAR
--03 - Set the @EmpoyeeName variable - use STUFF, QUOTENAME and XML PATH to capture all the name in a form of name in each brackets. for example [Amir], [Eli], [Ester]...
--04- Set the @Query as all the select and pivot command inside of a Quotation marks. when you need to insert the employee names use the @EmployeeName variable. for example - FOR EmployeeName IN (' + @EmployeeName + ' )...
--05- Execute the @Query 
--Answer:

DECLARE @EmployeeName NVARCHAR (100)
DECLARE @Query NVARCHAR (500)
SET @EmployeeName = STUFF ((SELECT DISTINCT ',' + QUOTENAME(EmployeeName) FROM tblSalary FOR XML PATH ('')), 1, 1,'')

SET @Query = 
			'SELECT * 
			FROM (
			SELECT EmployeeName, YEAR([Date - Salary Payment]) AS [Year], Salary
			FROM   tblSalary
			) AS tbl 
				PIVOT
				(
				MAX(Salary)
				FOR EmployeeName IN (' + @EmployeeName + ') 
				) AS PVT'
EXEC (@Query)


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic -28- Basic UnPivot - use tblPhoneComparison Table
--Question 1 - Create unpivot table where X = weight in g, qualityScore, price , Y = productName and Z = values
--Answer:
SELECT * FROM 
(
SELECT ProductName, 
       [Weight in g], 
	   QualityScore, 
	   Price
FROM   tblPhoneComparison
) AS TBL
UNPIVOT
(
[Values] FOR Measurments IN ([Weight in g], [QualityScore], [Price]) 
) AS UNPVT 

--Question 2 - insert all the new table into temp table name #TEMP2000. Then select the temp table and rank the price for each phone. 
--Answer:

SELECT * INTO #TEMP2000 FROM 
(
SELECT ProductName, 
       [Weight in g], 
	   QualityScore, 
	   Price
FROM   tblPhoneComparison
) AS TBL
UNPIVOT
(
[Values] FOR Measurments IN ([Weight in g], [QualityScore], [Price]) 
) AS UNPVT 


SELECT ProductName, [Values], DENSE_RANK () OVER (ORDER BY [Values] DESC) [Price Rank]  
FROM #TEMP2000
WHERE #TEMP2000.Measurments = 'Price'


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic -29- Multiple CTEs - use tlbEmployee Table
--Question 1 - show two employees - the one with the most high seniority and the one with the most low seniority. 
--01- create an cte with datediff by month from the hiredate to getdate. 
--02- create an second cte and use the first cte to rank the datediff by month. 
--03- select from the second cte two employees - the one with the most high seniority and the one with the most low seniority.
--Answer:
;WITH CTE
AS
(
SELECT    *,
          DATEDIFF(MONTH,HireDate,GETDATE()) AS [Date Diff By Months] 
FROM      tblemployee  
), 
CTE1 AS 
(
SELECT *, 
       DENSE_RANK () OVER (ORDER BY [Date Diff By Months] DESC) AS RNK_Date 
FROM CTE 
)
SELECT * FROM CTE1 
WHERE RNK_Date IN (1,10) 


--Question 2 - use tblproduct - find the price difference between the most expansive products group. 
--01- create a price category - when the price is more than 5500 label it as High price else low price. 
--02- create a cte on that select statement. 
--03- use second cte to rank the price inside the High price group. 
--04- use third cte to select the Higest product price and the lowest product price of the High price group. 
--05- call the third cte and use it for a self join - than find the price difference between the two products. select only one row - in that row show - High product name, High Product Price, Low Product Name, Low Product Price and Price Difference.  
--Answer:
;WITH CTE1
AS
(
SELECT *, IIF(ProductPrice > 5500, 'High Price', 'Low Price') [Price Category] 
FROM   tblProducts
), 
CTE2 AS 
(
SELECT *, DENSE_RANK () OVER (PARTITION BY [Price Category] ORDER BY ProductPrice DESC) RNK
FROM CTE1
WHERE [Price Category] = 'High Price'
),
CTE3 AS
(
SELECT * 
FROM CTE2
WHERE RNK IN (1,7) 
)
SELECT TOP 1 A.ProductName, A.ProductPrice, B.ProductName, B.ProductPrice, A.ProductPrice - B.ProductPrice AS [Price Difference]   
FROM CTE3 AS A
JOIN CTE3 AS B
ON   A.ProductPrice != B.ProductPrice 
ORDER BY [Price Difference] DESC


--Question 3 - use tblGenderMeasurements - find the difference between the avg measurements values of males and avg measurements values of females. 
--01- find the Age, Weight and Height AVG of each group
--02- creat an cte to the select statement. 
--03- create second cte and use the first cte to create a rownumber to each group
--04- create third cte and choose just rownumber = 1(female)
--05- create fourth cte and choose just rownumber = 2 (male)
--06- use the 3 and 4 cte's and create between them a join, then clclulate the difference avg between the groups. 
--Answer:
;WITH CTE
AS
(
SELECT     Gender, AVG(age) [Avg Age], AVG(Height) [Avg Height], AVG(Weight) [Avg Weight]   
FROM       tblGenderMeasurements
GROUP BY   Gender 
), 
CTE1 AS
(
SELECT *, 
       ROW_NUMBER () OVER (ORDER BY Gender) AS RN
FROM   CTE
),
CTE2 AS
(
SELECT [Avg Age], [Avg Height], [Avg Weight]
FROM   CTE1 
WHERE  RN = 2
), 
CTE3 AS 
(
SELECT [Avg Age], [Avg Height], [Avg Weight]
FROM   CTE1 
WHERE  RN = 1
)
SELECT A.[Avg Age] - B.[Avg Age] AS AvgAgeDiff, A.[Avg Height] - B.[Avg Height] AS AvgHeightDiff, A.[Avg Weight] - B.[Avg Weight] AS AvgWeightDiff
FROM   CTE2 AS A
JOIN   CTE3 AS B
ON     A.[Avg Age] != B.[Avg Age]  
 

 --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic -30- Recursive CTEs  - use tblKingOfAnimals Table
--Question 1 - Create a recursive cte to king of animals. use self join to show the animal name and the dominant animal name. 
--Answer: 
;WITH CTE 
        (
		AnimalID, 
       AnimalName, 
	   AnimalDominant,
	   AnimalLevel
		)
AS
( 
SELECT AnimalID, 
       AnimalName, 
	   AnimalDominant, 
	   AnimalLevel = 0
FROM   tblKingOfAnimals 
WHERE  AnimalDominant IS NULL

UNION ALL

SELECT A.AnimalID, 
       A.AnimalName, 
	   A.AnimalDominant,
	   B.AnimalLevel + 1
FROM   tblKingOfAnimals AS A
JOIN   CTE AS B
ON     A.AnimalDominant = B.AnimalID
) 
SELECT B.AnimalName , ISNULL(C.AnimalName, 'King of Animals') AS [Animal Dominant] 
FROM CTE AS B
LEFT JOIN CTE AS C
ON   B.AnimalDominant = C.AnimalID


--Question 2 - Create the same recursive cte but now first declare on a animal id. then insert the @animalID to the cte. 
--then use it in a self join so when you set the @animalID, in the results you get organized hierarchy from the @animalID until the end result of the king of animals.  
--Answer: 

DECLARE @AnimalID INT
SET @AnimalID = 4;


;WITH CTE 
        (
		AnimalID, 
       AnimalName, 
	   AnimalDominant,
	   AnimalLevel
		)
AS
( 
SELECT AnimalID, 
       AnimalName, 
	   AnimalDominant, 
	   AnimalLevel = 0
FROM   tblKingOfAnimals 
WHERE  AnimalID = @AnimalID

UNION ALL

SELECT A.AnimalID, 
       A.AnimalName, 
	   A.AnimalDominant,
	   B.AnimalLevel + 1
FROM   tblKingOfAnimals AS A
JOIN   CTE AS B
ON     A.AnimalID = B.AnimalDominant
) 
SELECT B.AnimalName , ISNULL(C.AnimalName, 'King of Animals') AS [Animal Dominant] 
FROM CTE AS B
LEFT JOIN CTE AS C
ON   B.AnimalDominant = C.AnimalID








