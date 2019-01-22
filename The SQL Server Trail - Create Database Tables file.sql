--The SQL Server Trail--
-- Create Tables file --
-- File Number 01-- 

USE master 
GO

--First lets create the dadabase name
CREATE DATABASE The_SQL_Server_Trail_Database
GO

USE The_SQL_Server_Trail_Database
GO

-- Second - Let create the tables of the database by all the topics.
-- These are the topics: 
--01- simple select questions
--02- Group by questions
--03- Join questions
--04- Replacing Null value questions
--05- Union and Union all questions
--06- Mathmatical Functions
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
--22- CTE - Common table expresion
--23- Duplicate values 
--24- Ntile function
--25- Lag and Lead function
--26- Sliding Window
--27- Basic Pivot
--28- Basic Unpivot
--29- Multiple CTEs
--30- Recursive CTEs


--01- Table Number 1 - tblDepartment - Topics: 14) index, 17) Temporary Tables, 22) CTE - Common table expresion
CREATE TABLE tblDepartment
(
DepartmentID INT PRIMARY KEY, 
DepartmentName NVARCHAR (25), 
DepartmentHead NVARCHAR (20) 
) 

INSERT INTO tblDepartment VALUES
(1, 'IT', 'Shimi'), 
(2, 'HR', 'Roth'), 
(3, 'Payroll', 'Itai'), 
(4, 'Other Department', 'Simha')


--01- Table number 2 - tblemployee - Topics: 1) Simple select questions, 2) Grop by Questions, 07) Date-Time Functions, 12)CAST and CONVERT functions, 13) Stored Procedure, 14) index, 17) Temporary Tables, 18) If Statements, 22) CTE - Common table expresion, 24) Ntile function, 25) Lag and Lead function, 26) Sliding Window

CREATE TABLE tblemployee
(
employeeID INT PRIMARY KEY IDENTITY, 
firstName NVARCHAR (30), 
lastName NVARCHAR (30),
gender NVARCHAR (10), 
Email NVARCHAR (50), 
PhoneNumber NVARCHAR (15),
salary INT, 
city NVARCHAR (20),
HireDate DATE,
DepartmentID INT,
CONSTRAINT FK_DepartmentID FOREIGN KEY (DepartmentID) REFERENCES tblDepartment (DepartmentID) 
) 

INSERT INTO tblemployee VALUES
('Tomer', 'Itzhakov','Male', 'Tomerikoka@gmail.com', '0508554622', 11000, 'Jerusalem', '20011201',1),
('Shira', 'Nevo','Female', 'Shira@gmail.com', '0508515542', 8000, 'Jerusalem', '20020615',4),
('Ester', 'Hyut','Female', 'Ester@gmail.com', '0508575148', 10000, 'Jerusalem', '20120528',3),
('Robin', 'Choen','Male', 'Robin@gmail.com', '0528542523', 7000, 'Tel-Aviv', '20120224',2),
('Shlomi', 'Hai','Male', 'Shlomi@gmail.com', '0528456122', 10000, 'Tel-Aviv', '20081019',3),
('David', 'Kepler','Male', 'David@gmail.com', '0558847365', 11000, 'Tel-Aviv', '20160515',1),
('Dana', 'Tova','Female', 'Dana@gmail.com', '0556789322', 4000, 'Tel-Aviv', '20160202',2),
('Idan', 'Haviv','Male', 'Idan@gmail.com', '0508752256', 10000, 'Haifa', '20170522',3),
('Eti', 'Boblil','Female', 'Eti@gmail.com', '0505847665', 2000, 'Haifa', '20180614',4),
('Esti', 'Karlibah','Female', 'Esti@gmail.com', '0504859998', 1000, 'Haifa', '20140713',2)


--02- Table number 2 - tblCategory - Topics: 3)Join questions, 15)view, 17) Temporary Tables, 19) Derived Tables, 24) Ntile function
CREATE TABLE tblCategory
(
CategoryID INT PRIMARY KEY IDENTITY,
CategoryName NVARCHAR (25) 
) 

INSERT INTO tblCategory VALUES
('Kitchen'),
('Living Room'),
('Bedroom'),
('Electrical appliance')

--03- Table number 3 - tblSubCategory - Topics: 3)Join questions, 15)view, 17) Temporary Tables, 19) Derived Tables, 24) Ntile function
CREATE TABLE tblSubCategory 
(
SubCategoryID INT PRIMARY KEY IDENTITY, 
SubCategoryName NVARCHAR (30) NOT NULL, 
CategoryID INT NOT NULL, 
CONSTRAINT FK_CategoryID FOREIGN KEY (CategoryID) REFERENCES tblCategory (CategoryID)
) 

INSERT INTO tblSubCategory VALUES
('Sink',1),
('Tap',1), 
('Capboard',1), 
('Couch',2), 
('Dining table',2), 
('Easy Chair',2), 
('Bed',3), 
('Desk',3), 
('Mirror',3), 
('Television',4), 
('Washing Machine',4), 
('Electric Heater',4) 

--04- Table number 4 - tblProducts - Topics: 3)Join questions, 15)view, 17) Temporary Tables, 19) Derived Tables, 24) Ntile function
CREATE TABLE tblProducts
(
ProductID INT PRIMARY KEY IDENTITY, 
ProductName NVARCHAR (45), 
ProductPrice INT,
SubCategoryID INT, 
CONSTRAINT FK_SubCategoryID FOREIGN KEY (SubCategoryID) REFERENCES tblSubCategory (SubCategoryID)
)


INSERT INTO tblProducts VALUES
('Big Sink',5000,1),
('Small Sink',3500,1),
('Nirosta Sink',7500,1),
('Big Tap',2000,2),
('Small Tap',1000,2),
('Standard Tap',500,2),
('Big Capboard',4000,3),
('Small Capboard',2500,3),
('IKEA Capboard',2000,3),
('Big Couch',4552,4),
('Small Couch',2500,4),
('Leather Couch',1500,4),
('Round Table',8000,5),
('Rectangle Table',5000,5),
('IKEA Table',3500,5),
('American comfort',9000,6),
('IKEA Single Chair',3500,6),
('Beytily Chair',4000,6),
('King size bed',9500,7),
('Queen size bed',11000,7),
('Single size bed',6000,7),
('IKEA Desk',1500,8),
('Whole wood Desk',4500,8),
('Plywood Desk',1000,8),
('Big Mirror',1500,9),
('Small Mirror',500,9),
('Personal Mirror',2500,9),
('56 inch Samsung',5500,10),
('32 inch HP',3500,10),
('21 inch DELL',2700,10),
('Bosh Machine',7000,11),
('Samsung Machine',5000,11),
('Makita Machine',4500,11),
('Big Heater',500,12),
('Small Heater',350,12),
('Rocket Heater',200,12),
('Coffee',5,null),
('brown suger',0.5,null),
('Tea',3,null),
('biscuit',6,null)


--05- Table number 5 - tblAnimalSize - Topics: 4)Replacing Null value questions
CREATE TABLE tblKingOfAnimals 
(
AnimalID INT PRIMARY KEY, 
AnimalName NVARCHAR (30), 
AnimalDominant INT
) 

INSERT INTO tblKingOfAnimals VALUES
(1,'Snake',2), 
(2,'Wolverine',5),
(3,'Wolf',6), 
(4,'Eagle',5),  
(5,'Hyena',6), 
(6,'Lion',null)

--06- Table number 6 - tblIsraelCustomers - Topics: 5) Union and Union all questions
CREATE TABLE tblIsraelCustomers
(
CustomerID INT, 
CustomerName NVARCHAR (20), 
CustomerPhone NVARCHAR (20) 
)

INSERT INTO tblIsraelCustomers VALUES
(1,'Tomer','050-854255'), 
(2,'Shlomi','050-856547'), 
(3,'Hana','052-865214')


--07- Table number 7 - tblUSCustomers - Topics: 5) Union and Union all questions
CREATE TABLE tblUSCustomers
(
CustomerID INT, 
CustomerName NVARCHAR (20), 
CustomerPhone NVARCHAR (20) 
)

INSERT INTO tblUSCustomers VALUES
(1,'James','050-985522'), 
(2,'Patrick','050-888852'), 
(3,'Hana','052-865214')


--07- Table number 7 - tblSpainCustomers - Topics: 5) Union and Union all questions
CREATE TABLE tblSpainCustomers
(
CustomerID INT, 
CustomerName NVARCHAR (20), 
CustomerPhone NVARCHAR (20) 
)

INSERT INTO tblSpainCustomers VALUES
(1,'Tomas','055-869554'), 
(2,'Patrick','050-888852'), 
(3,'Elisio','053-985632')


--08- Table number 8 - tblGenderMeasurements - Topics: 6) Mathmatical Functions
CREATE TABLE tblGenderMeasurements 
(
NumerID INT PRIMARY KEY, 
Name    NVARCHAR (30), 
Gender  NVARCHAR (20), 
Age     DECIMAL (8,2),
Height  DECIMAL (8,2),
Weight  DECIMAL (8,2)
) 

INSERT INTO tblGenderMeasurements VALUES
(1,'Tomer','Male',31.4,1.73,68.5),
(2,'Shai','Male',28.5,1.81,73.8), 
(3,'Noam','Male',32.3,1.77,80.8), 
(4,'Ben','Male',27.7,1.86,105.9), 
(5,'Rita','Female',32.2,1.65,61.8),
(6,'Simha','Female',29.5,1.73,55.6),
(7,'Efrat','Female',35.2,1.70,59.4),
(8,'Miri','Female',26.4,1.78,63.8)


--09- Table number 9 - tblStringTest - Topics: 8) String Functions
CREATE TABLE tblStringTest
(
ID INT PRIMARY KEY, 
FirstName NVARCHAR (20), 
MiddleName NVARCHAR (20), 
LastName NVARCHAR (20), 
Email NVARCHAR (25), 
) 

INSERT INTO tblStringTest VALUES
(1, '      Tomer','  D.    ', 'Itzhakkov-Nevo', 'Tomeriko@gmail.com'),
(2, ' Shalom     ','    T.    ', 'Rabinovitz', 'Shalom@gmail.com'),
(3, '   Meir   ', NULL , 'Ariel', 'Meir@yaho.com'),
(4, '              Moosh  ','  B.    ', 'Ari', 'Moosh@walla.co.il'),
(5, ' Gad', NULL , 'Tetanus', 'Gad@walla.co.il'),
(6, '  Efi','  N.    ', 'Flotch', 'Efi@gmail.com'),
(7, '      Ehod','  B.    ', 'Barack', 'Ehod@ynet.co.il')


--10- Table number 10 - tblDuplicates - Topics: 23) Duplicate values
CREATE TABLE tblDuplicates 
(
NumberID INT,
FirstName NVARCHAR (20), 
LastName NVARCHAR (20), 
Age INT, 
Email NVARCHAR (25), 
Hobby NVARCHAR (25)
) 

INSERT INTO tblDuplicates VALUES
(1,'Eli', 'Meron', 35, 'Eli@gmail.com', 'Cars'),
(1,'Eli', 'Meron', 35, 'Eli@gmail.com', 'Cars'),
(2,'Rita', 'Shmoel', 41, 'Rita@gmail.com', 'Theater'),
(2,'Rita', 'Shmoel', 41, 'Rita@gmail.com', 'Theater'),
(3,'Kobbi', 'Erdan', 32, 'Kobbi@gmail.com', 'Reading'),
(4,'Mika', 'Teva', 31, 'Mika@gmail.com', 'Tracking')


--11- Table number 11 - tblSalary - Topics: 25) Lag and Lead function, 26) Sliding Window
CREATE TABLE tblSalary 
(
EmployeeID INT, 
EmployeeName NVARCHAR (20), 
Salary DECIMAL (8,3), 
[Date - Salary Payment] DATE 
) 

INSERT INTO tblSalary VALUES
(1,'Shlomi',9500,'01/01/2019'),
(2,'Shira',10000,'02/01/2019'),
(3,'Ester',6500,'03/01/2019'),
(4,'Eli',3654,'04/01/2019'),
(5,'Sima',8541,'05/01/2019'),
(6,'Robin',9851,'06/01/2019'),
(7,'Eyal',11000,'07/01/2019'),
(8,'Matan',9985,'08/01/2019'),
(9,'Hanan',9548,'09/01/2019'),
(10,'Amir',7236,'10/01/2019'),
(11,'Miryam',6584,'11/01/2019'),
(12,'Oshri',6998,'12/01/2019'),
(1,'Shlomi',9595,'01/01/2020'),
(2,'Shira',10100,'02/01/2020'),
(3,'Ester',6565,'03/01/2020'),
(4,'Eli',3690.5,'04/01/2020'),
(5,'Sima',8626.4,'05/01/2020'),
(6,'Robin',9949.5,'06/01/2020'),
(7,'Eyal',11110,'07/01/2020'),
(8,'Matan',10084.9,'08/01/2020'),
(9,'Hanan',9643.5,'09/01/2020'),
(10,'Amir',7308.4,'10/01/2020'),
(11,'Miryam',6649.8,'11/01/2020'),
(12,'Oshri',7068,'12/01/2020'),
(1,'Shlomi',9691,'01/01/2021'),
(2,'Shira',10201,'02/01/2021'),
(3,'Ester',6630.7,'03/01/2021'),
(4,'Eli',3727.4,'04/01/2021'),
(5,'Sima',8712.7,'05/01/2021'),
(6,'Robin',10049,'06/01/2021'),
(7,'Eyal',11221.1,'07/01/2021'),
(8,'Matan',10185.7,'08/01/2021'),
(9,'Hanan',9739.9,'09/01/2021'),
(10,'Amir',7381.4,'10/01/2021'),
(11,'Miryam',6716.3,'11/01/2021'),
(12,'Oshri',7138.7,'12/01/2021'),
(1,'Shlomi',9787.9,'01/01/2022'),
(2,'Shira',10303,'02/01/2022'),
(3,'Ester',6697,'03/01/2022'),
(4,'Eli',3764.7,'04/01/2022'),
(5,'Sima',8799.8,'05/01/2022'),
(6,'Robin',10149.5,'06/01/2022'),
(7,'Eyal',11333.3,'07/01/2022'),
(8,'Matan',10287.6,'08/01/2022'),
(9,'Hanan',9837.3,'09/01/2022'),
(10,'Amir',7455.3,'10/01/2022'),
(11,'Miryam',6783.5,'11/01/2022'),
(12,'Oshri',7210,'12/01/2022'),
(1,'Shlomi',9885.7,'01/01/2023'),
(2,'Shira',10406,'02/01/2023'),
(3,'Ester',6763.9,'03/01/2023'),
(4,'Eli',3802.4,'04/01/2023'),
(5,'Sima',8887.8,'05/01/2023'),
(6,'Robin',10251,'06/01/2023'),
(7,'Eyal',11446.6,'07/01/2023'),
(8,'Matan',10390.4,'08/01/2023'),
(9,'Hanan',9935.7,'09/01/2023'),
(10,'Amir',7529.8,'10/01/2023'),
(11,'Miryam',6851.3,'11/01/2023'),
(12,'Oshri',7282.1,'12/01/2023'),
(1,'Shlomi',9984.6,'01/01/2024'),
(2,'Shira',10510.1,'02/01/2024'),
(3,'Ester',6831.6,'03/01/2024'),
(4,'Eli',3840.4,'04/01/2024'),
(5,'Sima',8976.7,'05/01/2024'),
(6,'Robin',10353.5,'06/01/2024'),
(7,'Eyal',11561.1,'07/01/2024'),
(8,'Matan',10494.3,'08/01/2024'),
(9,'Hanan',10035,'09/01/2024'),
(10,'Amir',7605.1,'10/01/2024'),
(11,'Miryam',6919.9,'11/01/2024'),
(12,'Oshri',7355,'12/01/2024'),
(1,'Shlomi',10084.4,'01/01/2025'),
(2,'Shira',10615.2,'02/01/2025'),
(3,'Ester',6899.9,'03/01/2025'),
(4,'Eli',3878.8,'04/01/2025'),
(5,'Sima',9066.4,'05/01/2025'),
(6,'Robin',10457,'06/01/2025'),
(7,'Eyal',11676.7,'07/01/2025'),
(8,'Matan',10599.3,'08/01/2025'),
(9,'Hanan',10135.4,'09/01/2025'),
(10,'Amir',7681.2,'10/01/2025'),
(11,'Miryam',6989,'11/01/2025'),
(12,'Oshri',7428.5,'12/01/2025'),
(1,'Shlomi',10185.3,'01/01/2026'),
(2,'Shira',10721.4,'02/01/2026'),
(3,'Ester',6968.9,'03/01/2026'),
(4,'Eli',3917.6,'04/01/2026'),
(5,'Sima',9157.1,'05/01/2026'),
(6,'Robin',10561.6,'06/01/2026'),
(7,'Eyal',11793.5,'07/01/2026'),
(8,'Matan',10705.3,'08/01/2026'),
(9,'Hanan',10236.7,'09/01/2026'),
(10,'Amir',7758,'10/01/2026'),
(11,'Miryam',7058.9,'11/01/2026'),
(12,'Oshri',7502.8,'12/01/2026'),
(1,'Shlomi',10287.1,'01/01/2027'),
(2,'Shira',10828.6,'02/01/2027'),
(3,'Ester',7038.6,'03/01/2027'),
(4,'Eli',3956.8,'04/01/2027'),
(5,'Sima',9248.7,'05/01/2027'),
(6,'Robin',10667.2,'06/01/2027'),
(7,'Eyal',11911.4,'07/01/2027'),
(8,'Matan',10812.3,'08/01/2027'),
(9,'Hanan',10339.1,'09/01/2027'),
(10,'Amir',7835.6,'10/01/2027'),
(11,'Miryam',7129.5,'11/01/2027'),
(12,'Oshri',7577.8,'12/01/2027'),
(1,'Shlomi',10390,'01/01/2028'),
(2,'Shira',10936.9,'02/01/2028'),
(3,'Ester',7109,'03/01/2028'),
(4,'Eli',3996.3,'04/01/2028'),
(5,'Sima',9341.2,'05/01/2028'),
(6,'Robin',10773.9,'06/01/2028'),
(7,'Eyal',12030.5,'07/01/2028'),
(8,'Matan',10920.4,'08/01/2028'),
(9,'Hanan',10442.5,'09/01/2028'),
(10,'Amir',7913.9,'10/01/2028'),
(11,'Miryam',7200.8,'11/01/2028'),
(12,'Oshri',7653.6,'12/01/2028'),
(1,'Shlomi',10493.9,'01/01/2029'),
(2,'Shira',11046.2,'02/01/2029'),
(3,'Ester',7180,'03/01/2029'),
(4,'Eli',4036.3,'04/01/2029'),
(5,'Sima',9434.6,'05/01/2029'),
(6,'Robin',10881.6,'06/01/2029'),
(7,'Eyal',12150.8,'07/01/2029'),
(8,'Matan',11029.7,'08/01/2029'),
(9,'Hanan',10546.9,'09/01/2029'),
(10,'Amir',7993,'10/01/2029'),
(11,'Miryam',7272.8,'11/01/2029'),
(12,'Oshri',7730.1,'12/01/2029'),
(1,'Shlomi',10598.8,'01/01/2030'),
(2,'Shira',11156.7,'02/01/2030'),
(3,'Ester',7251.8,'03/01/2030'),
(4,'Eli',4076.7,'04/01/2030'),
(5,'Sima',9528.9,'05/01/2030'),
(6,'Robin',10990.4,'06/01/2030'),
(7,'Eyal',12272.4,'07/01/2030'),
(8,'Matan',11139.9,'08/01/2030'),
(9,'Hanan',10652.4,'09/01/2030'),
(10,'Amir',8073,'10/01/2030'),
(11,'Miryam',7345.6,'11/01/2030'),
(12,'Oshri',7807.4,'12/01/2030')

--12- Table number 12 - tblCharacter - Topics: 9) Finding Character
CREATE TABLE tblCharacter 
(
ID INT, 
[NAME] NVARCHAR (20), 
Email NVARCHAR (20)
) 

INSERT INTO tblCharacter VALUES
(1,'Tomer', 'Tomer.Gamil.com'), 
(2,'Eli', 'Eli%Gamil.com'), 
(3,'Roni', 'Roni%Gamil.com'), 
(4,'Arik', 'Arik%%Gamil.com'), 
(5,'Moshe', 'Moshe.Gamil.com'),
(6,'Hava', 'Hava.Gamil.com'), 
(7,'Meir', 'Meir%Gamil.com'), 
(8,'Ran', 'Ran%%Gamil.com')


--13- Table Number 13 - tblPassword - Topics: 10) Patindex function
CREATE TABLE tblPassword
(
ID INT, 
[Password] NVARCHAR (80) 
) 

INSERT INTO tblPassword VALUES
(1,'My password is 9853391'), 
(2,'98234591122'), 
(3,'The password is 1231986 - My birthday '), 
(4,'I don''t have password'), 
(5,'My password is 222222 use it for free')

--14 - Table number 14 - tblCountingLetters - Topics: 11) Counting Letters
CREATE TABLE tblCountingLetters
(
String NVARCHAR (300) 
) 

INSERT INTO tblCountingLetters VALUES
('If you want to know SQL you need to practice every day for 4 hours')


--15- Table Number 15 - tblSales - Topics: 28) Basic Unpivot
CREATE TABLE tblPhoneComparison
(
ProductName NVARCHAR (20), 
[Weight in g] INT, 
QualityScore INT, 
Price INT
)

INSERT INTO tblPhoneComparison VALUES
('IphoneX',300,9,7000),
('Samsung Galaxy 2',150,7,3500),
('Nokia',500,6,2000),
('MaxPhone',222,10,8000),
('SpacePhne',521,8,5000)








 


















