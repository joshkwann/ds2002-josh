/* DS2002 HW */

/* PART 1  */

/* WORLD DATABASE QUESTIONS */

/* List all countries in South America */
SELECT * FROM `country` WHERE Continent="South America";

/* Find the population of 'Germany' */
SELECT Population FROM `country` WHERE Name="Germany";

/* Retrieve all cities in the country 'Japan' */
SELECT * FROM `city` WHERE CountryCode="JPN";

/* Find the 3 most populated countries in the 'Africa' region */
SELECT * FROM `country` WHERE Region="Western Africa" LIMIT 3;

/* Retrieve the country and its life expectancy where the population is between 1 and 5 million. */
SELECT Name, LifeExpectancy FROM country WHERE Population BETWEEN 1000000 AND 5000000;

/* List countries with an official language of 'French'. */
SELECT country.Name FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'French' AND countrylanguage.IsOfficial = 'T';

/* CHINHOOK DATABASE QUESTIONS */

/* Retrieve all album titles by the artist 'AC/DC' */
SELECT Album.Title FROM Album JOIN Artist ON Album.ArtistId = Artist.ArtistId WHERE Name='AC/DC';

/* Find the name and email of customers located in 'Brazil'. */
SELECT FirstName, Email FROM `Customer` WHERE Country='Brazil';

/* List all playlists in the database. */
SELECT * FROM `Playlist`

/* Find the total number of tracks in the 'Rock' genre */
SELECT Track.Name FROM Track JOIN Genre ON Track.GenreId = Genre.GenreId WHERE Genre.Name = "Rock";

/* List all employees who report to 'Nancy Edwards' */
SELECT * FROM `Employee` WHERE ReportsTo=2;

/* Calculate the total sales per customer by summing the total amount in invoices. */
SELECT CustomerId, SUM(Total) AS Total FROM Invoice GROUP BY CustomerId;

/* PART 2 */

/* Design Your Database:** Create a database for a small business of your choice, with at least 3 tables with appropriate columns. */
CREATE DATABASE LemonadeStand;
USE LemonadeStand;

/* Create the Tables:** Write SQL statements to create the tables for your database.
Ensure that each table has a primary key and relationships where appropriate. */
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name CHAR(50),
    email CHAR(100)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product CHAR(100),
    price DECIMAL(5, 2)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date CHAR(10),
    total_amount DECIMAL(5, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

/* Insert Data:** Insert at least 5 rows of data into each of the tables you created. */
INSERT INTO Customers (name, email) 
VALUES 
('Josh Kwan', 'a@example.com'),
('Bob Mcdonald', 'b@example.com'),
('Lebron James', 'c@example.com'),
('The Rock', 'd@example.com'),
('Michael Jordan', 'e@example.com');

INSERT INTO Products (product, price) 
VALUES 
('Classic Lemonade', 2.50),
('Mint Lemonade', 3.00),
('Strawberry Lemonade', 3.50),
('Arnold Palmer', 2.75),
('Sparkling Lemonade', 3.25);

INSERT INTO Orders (customer_id, order_date, total_amount)
VALUES 
(1, '2024-09-01', 7.50),
(2, '2024-09-02', 3.00),
(3, '2024-09-03', 6.75),
(4, '2024-09-04', 5.50),
(5, '2024-09-05', 7.75);

/* Write Queries:** Write at least 3 queries to extract data from your new database. */
SELECT email FROM Customers;

SELECT Customers.name, AVG(Orders.total_amount) AS average_spent FROM Orders JOIN Customers ON Orders.customer_id = Customers.customer_id GROUP BY Customers.customer_id;

SELECT product, price FROM Products WHERE price > 3.00;










