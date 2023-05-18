/* 
    For all of the questions in this quiz, we are using the Chinook database. 
    All of the interactive code blocks have been setup to retrieve data only from this database.
*/

-- Question 1: Retrieve all the records from the Employees table.

SELECT *
FROM EMPLOYEES

-- Question 2: Retrieve the FirstName, LastName, Birthdate, Address, City, and State from the Employees table.

SELECT FirstName
	,LastName
	,Birthdate
	,Address
	,City
	,STATE
FROM EMPLOYEES

-- Question 3: Retrieve all the columns from the Tracks table, but only return 20 rows.

SELECT *
FROM Tracks LIMIT 20
