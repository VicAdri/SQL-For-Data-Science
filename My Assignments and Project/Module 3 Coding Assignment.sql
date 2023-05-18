/* 
    All of the questions in this quiz refer to the open source Chinook Database. 
    Please familiarize yourself with the ER diagram in order to familiarize yourself with the table and column names in order 
    to write accurate queries and get the appropriate answers.
*/

-- Question 1: Using a subquery, find the names of all the tracks for the album "Californication".

SELECT Name
	,AlbumID
FROM Tracks
WHERE AlbumId IN (
		SELECT AlbumId
		FROM Albums
		WHERE Title = "Californication"
		)

-- Question 2: Find the total number of invoices for each customer along with the customer's full name, city and email.

SELECT C.FirstName
	,C.LastName
	,C.City
	,C.Email
	,COUNT(I.CustomerId)
FROM Customers C
INNER JOIN Invoices I ON C.CustomerId = I.CustomerId
GROUP BY C.CustomerId

-- Question 3: Retrieve the track name, album, artistID, and trackID for all the albums.

SELECT Tracks.name AS 'Track Name'
	,Albums.Title AS 'Album Title'
	,Artists.ArtistID
	,Tracks.trackID
FROM (
	Albums INNER JOIN Tracks ON Albums.AlbumId = Tracks.AlbumId
	INNER JOIN Artists ON Albums.ArtistID = Artists.ArtistID
	)

-- Question 4: Retrieve a list with the managers last name, and the last name of the employees who report to him or her.

SELECT M.LastName AS Manager
	,E.LastName AS Employee
FROM Employees M
INNER JOIN Employees E ON M.EmployeeId = E.ReportsTo

-- Question 5: Find the name and ID of the artists who do not have albums. 

SELECT Name AS Artist
	,Artists.ArtistId
	,Albums.Title AS Album
FROM Artists
LEFT JOIN Albums ON Artists.ArtistId = Albums.ArtistId
WHERE Album IS NULL

-- Question 6: Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.

SELECT FirstName
	,LastName
FROM Employees

UNION

SELECT FirstName
	,LastName
FROM Customers
ORDER BY LastName DESC

-- Question 7: See if there are any customers who have a different city listed in their billing city versus their customer city.
SELECT C.FirstName
	,C.LastName
	,C.City AS CustomerCity
	,I.BillingCity
FROM Customers C
INNER JOIN Invoices I ON C.CustomerId = I.CustomerId
WHERE CustomerCity != BillingCity

