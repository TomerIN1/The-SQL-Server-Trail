--The SQL Server Trail--
--Solo Practice File--
--File Number 02--

-- In this file you will be shown several question in sql language by different type of topics.
-- After each question you will neet to type your answer.
-- The topics in this file goes from a begginer level to an advanced level.

--Note! - these questions are for students who learned already the basics of SQL Language.  
 
-- If you don't succsess or know the topic you can allways do two things: 
--01- Go and read about the topic, what its purpose and basic syntax. 
--02- Jump into the Question and Answers File (03) to see the correct answer. 


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


--Question 2 - select all the females in the table. Show just the first name, gender and phoneNumber
--Answer: 


--Question 3 - select all the Males that lives in jerusalem and haifa
--Answer: 


--Question 4 - select all the employees with salary 6000 or 11000
--Answer1 - Use OR Operator: 


--Answer2 - Use IN Operator: 



--Question 5 - select all the employees who lives in Jerusalem and Haifa with salary between 4000 and 10000
--Answer: 



--Question 6 - select all employees with the phone number that starts with 050
--Answer: 


--Question 7 - select all employees with the phone number that not starts with 050
--Answer: 


--Question 8 - select 5 rows with columns first name, salary and city order by salary (From max salary to min salary)
--Answer:
 

--Question 9 - select 25 percent of all the employees and order by salary (From max salary to min salary)
--Answer: 
 

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic 02 - Group by questions -- use the tblemployee Table
--Question 1 - show the mean salary by gender
--Answer:


--Question 2 - show the mean salary by city order by Avg Salary from max to min
--Answer:


--Question 3 - show the max and min salary by gender
--Answer:


--Question 4 - show the max and min salary by gender and city 
--Answer:



--Question 5 - show the total salary by gender and city 
--Answer:


--Question 6 - count the total female employees  
--Answer:


--Question 7 - count the total employees in Tel-Aviv
--Answer:
 

--Question 8 - show the total salary by city just for cities with total salary above 20000 and rank them from max to min. 
--Answer:



--Question 9 - show the total salary just for males who lives in Jerusalem and Tel-Aviv
--Answer:	



--Question 10 - show the total salary just for Females who lives in Jerusalem and Tel-Aviv and their phone number starts with 050
--Answer:	


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic 03 - Join questions -- use three tables: 1) tblProducts, 2) tblSubCategory, 3) tblCategory
--Question 1 - select all tables and find the primary key and the foregin key. 
--Answer: 



--Question 2 - create an inner join between tblproducts and tblsubcategory. 
-- from tblproducts show productName and productPrice. 
-- from tblsubcategory show subcategoryName. 
--Answer: 

    

--Question 3 - create an inner join between tblproducts, tblsubcategory, tblcategory. 
-- from tblproducts show productName and productPrice. 
-- from tblsubcategory show subcategoryName.
-- from tblcategory show categoryName. 
--Answer: 



--Question 4 - create an inner join between tblproducts and tblcategory. 
-- from tblproducts show productName and productPrice. 
-- from tblcategory show categoryName. 
--Answer:



---Question 5 - create LEFT join between tblproducts and tblcategory. 
-- from tblproducts show productName and productPrice. 
-- from tblcategory show categoryName.
-- what happend?  
--Answer:



---Question 6 - Show the total productPrice by category name order by max to min. 
-- if you have null values do not show them!  
--Answer:



---Question 7 - show the most expensive product name with subcategory and category.   
-- if you have null values do not show them!  
--Answer:


---Question 8 - show the most expensive product name within the category name =  'kitchen'.
-- if you have null values do not show them!  
--Answer:



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic 04 - Replacing Null value questions -- use the tblKingOfAnimals Table
--Question 1 - create a self join that shows two columns- AnimalName and Dominant AnimalName, so that for each animal you will see the who is her animal dominant. replace the null value with 'King of Animals' USE ISNULL function.
--Answer: 


--Question 2 -   create the same self join .replace the null value with 'King of Animals' USE CASE (Transact-SQL)  
--Answer: 


--Question 3 -  create the same self join .replace the null value with 'King of Animals' USE COALESCE function.  
--Answer: 



--Question 4 - Replace the null values in tblproduct table with the number '13'   
--Answer: 


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic 05 - Union and Union all questions -- use two groups of tables: 
-- group one (tblIsraelCustomers, tblUSCustomers, tblSpainCustomers)
-- group two (tblCategory, tblSubCategory, tblProducts) 
--Question 1 - marge all the tables from group one. USE UNION ALL OPERATION. 
--Answer: 


--Question 2 - marge all the tables from group one. USE UNION OPERATION. 
--Answer:


--Question 3 - What is the main difference between the two queries? type your answer. 
--Answer:



---Question 4 - use group two tables:(tblCategory, tblSubCategory, tblProducts).  
-- show the most expensive product of each subcategory and category. use the UNION ALL Operator AND Subquery technique. 
-- if you have null values do not show them!  
--Answer:



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic 06 -  Mathmatical Functions -- use tblGenderMeasurements table. 
--Question 1 - Create an AVG for each of the parameters: Age, Height and Weight by Gender. finelly, ceil the AVG number on each of the parameters.
--Answer: 



--Question 2 - Create the same query, but now floor the AVG numbers. 
--Answer: 


--Question 3 -  Create the same query, but now round the AVG numbers. 
--Answer: 



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic 07 - Date-Time Functions 
--Question 1 - show what is the date today
--Answer: 


--Question 2 - 
--A.show what is the current day of the month
--B. Show the day of the date '01/01/2019'
--Answer:


--Question 3 - 
--A.show what is the current month of the year
--B.Show the month of the date '01/01/2019' 
--Answer:


--Question 4 - 
--A.show what is the current year
--B.Show the year of the date '01/01/2019'
--Answer:


--Question 5 - show what is the datename of the day, weekday and month of the date '01/01/2019'
--Answer:


--Question 6 - NOTE! - Now use tlbEmployee Table. show the difference between the hire date and the current date by days. 
--Answer:


--Question 7 - NOTE! - Now use tlbEmployee Table. show the difference between the hire date and the current date by months. 
--Answer:



--Question 8 - NOTE! - Now use tlbEmployee Table. show the employee with the most high seniority in the work. 
--Answer:



--Question 9 - NOTE! - Now use tlbEmployee Table. Add to the employee with the most high seniority in the work 2 months of work. 
--show all his profile.
--show months add to hire date (to add months you need a negative number)
--show date difference by months from hire date. 
--show date difference by months from the months adding date.   
--Answer:




--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic 08 - String Functions - use tblStringTest Table
--Question 1 - see the gaps in the table and delete the gaps from the left side of the string. 
--Answer: 


--Question 2 - see the gaps in the table and delete the gaps from the left side and the right side of the string. 
--Answer:


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


--Question 4 - show all columns. Trim the first and last names. For the first name chage all characters to upper string, and for the Middle name chage all characters to lower string. 
--Answer:



--Question 5 - pick up the first two letters from the left side of the first name coulumn. 
--Answer:



--Question 6 - pick up the first two letters from the right side of the first name coulumn. 
--Answer:


--Question 7 - Connect the two letters from the left and right side of the first name into one string. 
--Answer:

--Question 8 - revers the Connected string from the last question. 
--Answer:


--Question 9 - show two columns - 1) Email, 2) The index character (@) of the Email in the table. 
--Answer: 


--Question 10 - Find only the domain part @aaa.com of the email - 'tomer@aaa.com'
--Answer: 


--Question 11 :
--show full name without gaps - first name + middle name + last name 
--show the email
--show just the name from the email
--Show only the domain part of each email 
--show only the part from the right to the first point of the domain (com / co.il)
--replace the com/co.il with 'ZZZZZZZZ'
--Answer: 


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic -09- Finding character - use tblCharacter
--Question 1 - find all the emails with the % symbol USE LIKE and []. 
--Answer:


--Question 2 - find all the emails with the % symbol USE LIKE and ESCAPE Function
--Answer:


--Question 3 - find all the emails with two % symbol USE CHARINDEX
--Answer:


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic 10 - Patindex function - use tblPassword Table. 
--Question 1 - Extract all the passwords. if there is no password show the string.  
--Answer:

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic 11 - Counting Letters - use tblCountingLetters Table
--Question 1 - count how many 'e' letters there is in this string   
--Answer:


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic 12 - CAST and CONVERT functions - use tblEmployee Table. in question 3 - use tblproducts Table.
--Question 1 - Create a column - FullID (First name + Last name + ID Number), and show also the gender, email, salary and city. Use CAST function. 
--Answer: 


--Question 2 - ADD to the query an convert function on the Hire date column. use the format that you want to make the date more readable for you.  
--In the style parameter we have some format use can choose to add the CONVERT function. 
--Here all the formats we have: 
--101 = mm/dd/yyyy
--102 = yy.mm.dd
--103 = dd/mm/yyyy
--104- dd.mm.yy
--105- dd.mm.yy 
--Answer:



--Question 3 - NOTE! Now use tblproduct Table. Replace the null values in the tblproduct table into 'Food Category'. USE CAST Transact-SQL.    
--Answer: 


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic 13 - Stored Procedure - use tblEmployee Table
--Question 1 -  Create SP to the query" select firstName, lastName, Gender, Email, Salary, City FROM tblEmployee 
--Answer: 


--Call the SP To see the info
--Answer:

--Delete the sp
--Answer:


--Question 2 -  Create SP to the query : 
-- select firstName, lastName, Gender, Email, Salary, City FROM tblEmployee
-- Create also an input parameters @gender, @city to call the sp for a more accurate info. 
--Answer:


--Call the sp to see the info on Females from Tel-Aviv
--Answer:

--Call the sp to see the info on Males from Jerusalem
--Answer:

--Call the sp to see the info on Memales from Haifa
--Answer:


--Question 3 -  Change the same SP: 
-- Add also an output parameters @EmployeeCount, @TotalSalary for the output info. 
-- At the end you need to insert the gender and the city, and to get the employee count and the total salary of this group. 
--Answer:


--Call the SP and show how much Male employee we have in Tel-Aviv city and what their total salary
--Answer:


--Call the SP and show how much Female employee we have in Haifa city and what their total salary
--Answer:

--Delete the SP
--Answer:



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic 14 - Index - use tblEmployee Table
--Question 1 -  What is the purpose of index? type your answer blow. 
--Answer: 

--Question 2 - create an index for the salary column in tblemployee
--Answer:


--Question 3 - Check the index. 
--Answer:


--Question 4 - Delete the index
--Answer:


--Question 5 - what is the main difference between clustered and non-Clustered indexes? 
--Answer:
 

--Question 6 - what about the uniqueness of an index - clustered and non-clustered? 
--Answer A - clustered: Type your answer and the index syntax:



--Answer B - Non clustered: Type your answer and the index syntax:



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic 15 - Views - use tblEmployee Table and tblDepartment Table. 
--Question 1 -  what is a view?  
--Answer: 


--Question 2 - What are the Advantages of views?
--Answer:  


--Question 3 - create a view just for the IT Head so he can see just the info of he's employees. NOTE! - Use the tbleEmployee and tblDepartment Tables. 
--Answer: 


-- Call the view
--Answer:


-- Delete the view
--Answer:


--Question 4 - create a view to all the info of the employee include departmentname. do not include the salary column. 
--Answer: 


-- Call the view
--Answer: 


--If you don't know the create statement of a view - how can you know what was it? 
--Answer:


-- Delete the view
--Answer:


--Question 5 - create a view to the super boss to see which department cost the most. 
--Answer: 


-- Call the view
--Answer:



-- Delete the view
--Answer:


--Question 6 - Is it possible to update the view? 
--Answer: 
 


--Question 7 - Is it possible to create an index on a view? 
--Answer: 

 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic 16 - User Defined Functions - use tblEmployee Table and tblDepartment Table. 
--Question 1 -  create a function so when you type the department name you get all the total cost of the department by employees salary.  
--Answer: 



--Call the function to see the info of the HR Department
--Answer:



--Question 2 -  change the function so when you type the department name and the gender you get all the total cost of the department by employees gender and salary.  
--Answer: 



--Call the function to see the Salary of the females in the HR Department
--Answer:



--Show the function create statement
--Answer:



--Delelte the function
--Answer:


--Question 3 - NOTE! Use the tblcategory, tblsubcategory and tblproducts Tables. 
-- create a function that calculate the total cost of all the products by category
--Answer: 	  



--Choose your category name and implement in the function: Kitchen, Living Room, Bedroom, Electrical appliance
--Answer:



--Question 4 - use the tblcategory, tblsubcategory and tblproducts Tables. 
-- change the function so it would be more accurate - change the category to subcategory.
--Answer:



 
--Choose your subcategory name and implement in the function:  
--Kitchen (Sink, Tap, Capboard)
--Living Room (Couch, Dining table, Easy Chair)
--Bedroom (Bed, Desk, Mirror)
--Electrical appliance (Television, Washing Machine, Electric Heater)
--Answer:




--Delete the function
--Answer:



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic 17 - Temporary Tables - TWO GROUP OF TABLES: A.(tblProduct, tblSubCategory, tblCategory), B.(tblEmployee, tblDepartment)  
--Question 1 -  what are the types of temporary tables? 
--Answer: 


--Question 2 -  why we use temporary tables?  
--Answer: 

 

--Question 3 -  create a join between the tblcategory, tblsubcategory and tblproducts. show productid, productName, productPrice, SubCategoryName, CategoryName. insert that join into a temporary table.  
--step one- create the join 
--Answer:


--step two - insert the query into temptable
--Answer:


--select all the data from the #temptable
--Answer:


--select all the data on sub category name - sink from the #temptable
--Answer:


--show the total price of the sink sub category product
--Answer:


--delete #tempetable
--Answer:


--Question 4 -  create a join between the tblemployee and tblDepartment tables. show employeeID, FullName, email, salary, hiredate, departmentName. insert that join into a temptable. 
--step one - create the join
--Answer: 


--step two - insert the query into temptable
--Answer:


--Select all the data from the #temptable 2 
--Answer:


--Select all the employees from department Name 'HR'
--Answer:

--Select the newest employee of the HR (by Hire Date) department and give him a 15% gift for entering our company. 
--Answer:


--Delete #temptable2 
--Answer:


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic 18 - If Statements - use tblemployee Table
--Question 1 -  what is the Basic syntax of if statements in sql server? 
--Answer:



--Question 2 -  Returns Black as the boolean expression evaluates to TRUE 
--A. First declare variable - color type int
--B. second - set the variable on 1
--C. third - create an if statement. Black is true and whit is false. 
--Answer:



--Question 3 -  Create a CASE Statemet to tblemployee. all the employees before and equal to the year 2008 are seniors and all the employees after 2008 are juniors.  
--Answer:



--Question 4 -  Replace the CASE Stetement with IIF Statement  
--Answer:



--Question 5 -  create a store procedure (SP) to the last query. use if statement for three cases: 
--01- if statement to choose 'All' the employees
--02- if statement to choose 'Senior' employees
--03- if statement to choose 'Junior' employees
--04- create error typing message. 
--step one - create the sp and create the first if statement
--Answer:



--step two - Add the second the the third if statements + error typing message. 
--Answer:



--slelect all the employees
--Answer:


--select just the senior employees
--Answer:


--select just the junior employees 
--Answer:


--select one of the three options but with spelling mistake
--Answer:


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic -19- Derived Tables - use tblProducts, tblSubCategory and tblCategoty Tables
--Question 1 -  what is the Basic syntax of derived tables? 
--Answer:

 


--Question 2 -  what is difference between derived tables and temporary tables? 
--Answer:
 


--Question 3 - 
--Step one: create an inner join between tblProducts, tblSubCategory and tblCategoty. Select the ProductName, ProductPrice, SubCategoryName, CategoryName. 
--Answer:



--Step two: create a derived table to the join and select all the data from categoryname = 'Living Room'
--Answer: 




--Question 4 - To the same derived table create an if statement - all the products with product price above or equal to 5000 are 'High Price' and all the rest are 'Low Price'. 
--Answer:  




--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic -20- Row Number and Partition by - use tblemployee Table
--Question 1 - Create row number on the employeeID column.
--Answer:



--Question 2 - Create row number on the employeeID column but in the opposite order. 
--Answer:



--Question 3 - Create row number on the gender column. for each gender give it's own numbers. USE PARTITION BY. 
--Answer: 


--Question 4 
--Step one: Create a salary type column - for salary above or equal 5000 give 'High Salary' and for the rest give 'Low Salary'
--Answer: 



--Step two: now, to the new column create a row number for each group. inside each group rank the employees form the highest salary to the lowest salary. 
--Answer:  



--Step three: select the highest salary from each group
--Answer:




--Step four: select the lowest salary from each group
--Answer:




--Step Five: select the lowest and highest salary from each group and show them in a single table order by salary
--Answer:





--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic -21- Dense Rank and Partition by - use tblemployee Table
--Question 1 - Create Dense Rank on the salary column from highest to lowest salary. 
--Answer:



--Question 2 - Create Dense Rank on the salary column from highest to lowest salary by gender
--Answer:


--Question 3 - Create Dense Rank on the salary column from highest to lowest salary by city
--Answer:


--Question 4 - find the AVG Salary of each city and rank it compare to the other cities. 
--Answer:



--Question 5 - 
--Step One: find the AVG Salary of each city and gender
--Answer:



--Step Two: create a derived table to the query and name it Salary_City_Gender. Order the table by city
--Answer: 



--Step Three: because we have duplicate rows for each city, change the second row of each city into null values. use row number to count the duplicate and then use another derived table to create a case condition on the row number to replace the values.  
--Answer: 




--Step Four: rank the gender salary avg in each city. kept the table structure. 
--Answer:



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic -22- CTE - Common table expresion - use tblemployee and tblDepartment Table
--Question 1 - what is the basic syntax of CTE? 
--Answer:


--Question 2 - Create a join between tblEmployee and tblDepartment Tables. then create a CTE and show the full data of the join. select employeeID, FirstName, LastName, Gender, Email, PhoneNumer, Salary, City, HireDate, DepartmentName, DepartmentHead.  
--Answer:




--Question 3 -From the same cte select just the employees of the department head named roth 
--Answer:



--Question 4 -From the same cte  find the avg salary of the department head named Shimi and show also he's department name. 
--Answer:




--Question 5 - create a row number on the salary by gender and select the top employee from each gender with CTE. Create a dense rank to rank their salary Within the CTE. 
--Answer:



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic -23- Duplicate values  - use tblDuplicates Table
--Question 1 - show all the duplicate rows
--Answer:


--Question 2 - show just single rows. exclude all duplicates rows. 
--Answer:



--Question 3 - show just the single rows in the table. exclude all the duplicates. 
--Answer:



--Question 4 - show just single rows from the duplicate rows.
--Answer:



--Question 5 - delete the duplicate rows. do not delete the rows if you want to practice on the table! Just type your answer.
--Answer:




--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic -24- Ntile function - use tblEmployee Table, tblProduct, tblSubCategory, tblCategory Tables
--Question 1 - devide the employee to three groups using NTILE function
--Answer:



--Question 2 - devide the employee into two groups within the gender using NTILE function
--Answer:


--Question 3 - devide the employee into two groups within the departmentID using NTILE function
--Answer:



--Question 4 -
--Step one: create a join between tblProduct, tblSubCategory, tblCategory - select the productName, ProductPrice, SubCategoryName, CategoryName. 
--Answer:



--Step Two: create an CTE on the join and use the NLTILE function to devide the ProductPrice by 4. Then insert the CTE into a temporary table. 
--Answer:



--Step Three: select the most expensive products from the temporary table and rank them from high to low. 
--Answer:




--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic -25- Lag and Lead function - use tblSalary Table
--Question 1 (LAG Question) - create an avg on the salary by year. insert the query into CTE and use LAG to see the privious AVG Salary by yaer. 
--Answer:



--Question 2 (LAG Question) - on the last CTE find the yearly percent of change between the avg year salary and the privious avg year salary. Add to the calculation % symbol. percantage of change = ((day/month/year - privious day/month/year)*100)/privious day/month/year
--Answer:




--Question 3 (LEAD Question) - in the tblProduct find the product price gap between the most expensive product and the cheapest product by the same category. Use CTE and insert it's values into a #temptable.   
--Answer:



--call the #temptable, and add two columns:
-- 1)Low Price By Category. Use lead function. also, convert the high price in this column into a null values.  
-- 2)Gap Between Expansive and cheapest products by category. Calaulate the difference between the higher price vs lower price. convert the negative numbers into null values.
--Answer:    



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic -26- Sliding Window - use tblSalary Table, use tblEmployee Table
--Question 1 - NOTE! Use tblEmployee - find the total salary of all the employees. Use sliding window function. 
--Answer:



--Question 2 - NOTE! Use tblEmployee - find the total salary of all the employees by each department. Use sliding window function. 
--Answer:



--Question 3 - NOTE! Use tblSalary - find the total salary of each employee. 
--Answer:



--Question 4 - NOTE! Use tblSalary - find the total salary of each year. in each year show the salary cost of each employee that contribute to the total salary of each year. finally create a row number partition by year and order by employeeID.  
--Answer:



--Question 5 - NOTE! Use tblSalary - insert the last query into a CTE and show for each year the total salary cost in a single row. show just year and total salary.  
--Answer:




--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic -27- Basic Pivot - use tblSalary Table
--Question 1 - Create a pivot table where X = EmployeeName, Y = Year and Z = Salary. 
--Answer:




--Question 2 - Create the same pivot. but this time use dynamic pivot. to do so follow these steps: 
--01- Declare a variable @EmployeeName NVARCHAR
--02- Declare another variable @Query NVARCHAR
--03 - Set the @EmpoyeeName variable - use STUFF, QUOTENAME and XML PATH to capture all the name in a form of name in each brackets. for example [Amir], [Eli], [Ester]...
--04- Set the @Query as all the select and pivot command inside of a Quotation marks. when you need to insert the employee names use the @EmployeeName variable. for example - FOR EmployeeName IN (' + @EmployeeName + ' )...
--05- Execute the @Query 
--Answer:



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic -28- Basic UnPivot - use tblPhoneComparison Table
--Question 1 - Create unpivot table where X = weight in g, qualityScore, price , Y = productName and Z = values
--Answer:




--Question 2 - insert all the new table into temp table name #TEMP2000. Then select the temp table and rank the price for each phone. 
--Answer:




--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic -29- Multiple CTEs - use tlbEmployee Table
--Question 1 - show two employees - the one with the most high seniority and the one with the most low seniority. 
--01- create an cte with datediff by month from the hiredate to getdate. 
--02- create an second cte and use the first cte to rank the datediff by month. 
--03- select from the second cte two employees - the one with the most high seniority and the one with the most low seniority.
--Answer:





--Question 2 - use tblproduct - find the price difference between the most expansive products group. 
--01- create a price category - when the price is more than 5500 label it as High price else low price. 
--02- create a cte on that select statement. 
--03- use second cte to rank the price inside the High price group. 
--04- use third cte to select the Higest product price and the lowest product price of the High price group. 
--05- call the third cte and use it for a self join - than find the price difference between the two products. select only one row - in that row show - High product name, High Product Price, Low Product Name, Low Product Price and Price Difference.  
--Answer:







--Question 3 - use tblGenderMeasurements - find the difference between the avg measurements values of males and avg measurements values of females. 
--01- find the Age, Weight and Height AVG of each group
--02- creat an cte to the select statement. 
--03- create second cte and use the first cte to create a rownumber to each group
--04- create third cte and choose just rownumber = 1(female)
--05- create fourth cte and choose just rownumber = 2 (male)
--06- use the 3 and 4 cte's and create between them a join, then clclulate the difference avg between the groups. 
--Answer:






 --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Topic -30- Recursive CTEs  - use tblKingOfAnimals Table
--Question 1 - Create a recursive cte to king of animals. use self join to show the animal name and the dominant animal name. 
--Answer: 





--Question 2 - Create the same recursive cte but now first declare on a animal id. then insert the @animalID to the cte. 
--then use it in a self join so when you set the @animalID, in the results you get organized hierarchy from the @animalID until the end result of the king of animals.  
--Answer: 




--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Well done! You finished the SQL Server trail. you can practice over and over again until you feel comfortable with SQL Language. 
