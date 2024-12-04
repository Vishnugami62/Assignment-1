USE mavenmovies;

-- Identify the primary keys and foreign keys in maven movies db. Discuss the differences  ? 

SELECT 
    TABLE_NAME AS TableName,
    COLUMN_NAME AS ColumnName,
    CONSTRAINT_NAME AS ConstraintName,
    CASE 
        WHEN REFERENCED_TABLE_NAME IS NULL THEN 'Primary Key'
        ELSE 'Foreign Key'
    END AS KeyType,
    REFERENCED_TABLE_NAME AS ReferencedTableName,
    REFERENCED_COLUMN_NAME AS ReferencedColumnName
FROM 
    INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE 
    TABLE_SCHEMA = 'mavenmovies';
    
/* Answer :  In a table, a primary key is a column that distinctly marks every record and assures that no null or duplicate values 
exist in the column. On the other hand, a Foreign Key establishes a relationship between two tables by referencing the Primary 
Key of another table. */

/* Insites: This query shows the relation between the table and the key used in the table.  
It explicitly shows the mavenmovies database itself.  By using the case statement, we can filter and extract the information 
about primary and foreign keys from the database. */

-- 2. List all details of actors ?

SELECT * FROM mavenmovies.actor;

-- Answer : This query explicitly shows the data of all the columns from the table "actor" from the mavenmovies database.

-- Insite : The "*" Means all so when this * is used it select all the data from the table.

-- 3. List all customer information from DB ?

SELECT * FROM mavenmovies.customer;

-- Answer : This query explicitly shows the data of all the columns from the table "customer" from the mavenmovies database.

-- 4. List different countries ?

SELECT country FROM mavenmovies.country; 


-- Answer : This query specifically shows the data for a list of country from the table "country" in the mavenmovies database.                                                                                                                                                                                

-- 5.  Display all active customers ?

SELECT * FROM mavenmovies.customer WHERE active = 1;

-- Answer : This query shows all the customer details who are active from customer table from mavenmovies database.alter

-- 6. List of all rental IDs for customer with ID 1 ?

SELECT rental_id, customer_id FROM mavenmovies.rental WHERE customer_id = 1;

-- Answer :  The query includes a where clause that filters the rental table and provides the details of just the customer with value 1.

-- 7. Display all the films whose rental duration is greater than 5 ?

SELECT * FROM mavenmovies.film WHERE film.rental_duration > 5;

-- Answer : The query includes a where clause that filters the rental_duration column and provides the details of the films which has rental_duration greater than 5.

-- 8. List the total number of films whose replacement cost is greater than $15 and less than $20 ?

SELECT COUNT(*) AS TotalFilms FROM mavenmovies.film WHERE replacement_cost > 15 AND replacement_cost < 20;

-- Answer : Because we use count in the film table where replacement_cost falls between 15 and 20, this query displays the overall amount of films from the film table.

-- 9. Display the count of unique first name of actors ?

SELECT COUNT(DISTINCT first_name) AS Unique_First_Names FROM mavenmovies.actor;

-- Answer: The count command counts the entries or rows in the column, and the distinct command removes any duplicate values and makes it unique, thus we must use the distinct command in the count field or SQL will throw an error.  When the distinct command is used inside the count, it removes all duplicate values and counts the actor table's data.

-- 10. Display the first 10 records from the customer table ? 

SELECT * FROM customer LIMIT 10;

-- Answer: The limit command helps us to see the limited data from the table.

-- 11. Display the first 3 records from the customer table whose first name starts with ‘b’.

SELECT * FROM customer WHERE first_name LIKE 'B%' LIMIT 3;

-- Answer: The Like command will give the name which start with b and limit will give first 3 data from database.

-- 12. Display the names of the first 5 movies which are rated as ‘G’.                                                                                              

SELECT title,rating FROM film WHERE rating = 'G' LIMIT 5;

-- Answer: This rating =G will give the movie name which has G rating.

-- 13. Find all customers whose first name starts with "a" ?

SELECT first_name FROM customer WHERE first_name LIKE 'a%' ;

-- Answer : This query gives the names of all customers whose first name starts with "A".

-- 14. Find all customers whose first name ends with "a".       

SELECT first_name FROM customer WHERE first_name LIKE '%a' ;

-- Answer : In this query we just need to change the like command where after the percentage sign, a is kept so that we get all names that end with a.

-- 15.  Display the list of first 4 cities which start and end with ‘a’ ?

SELECT * FROM city WHERE city LIKE 'a%a' LIMIT 4;

-- Answer : This query gives the first 4 cities whose names start and end with the letter 'a'.

-- 16. Find all customers whose first name have "NI" in any position ?

SELECT * FROM customer WHERE first_name LIKE '%NI%'; 

-- Answer : The query shows the name which has NI in thier name.

-- 17.  Find all customers whose first name have "r" in the second position ?

SELECT * FROM customer WHERE first_name LIKE '_r%';

-- Answer : This query gives the customers name which has second letter r in their first_name.

-- 18.  Find all customers whose first name starts with "a" and are at least 5 characters in length ?

SELECT * FROM customer WHERE first_name LIKE 'a%' AND LENGTH(first_name) >= 5;

-- Answer : In this query the length command will filter the data which has minimum or equal to 5 character in their first_name.

-- 19.  Find all customers whose first name starts with "a" and ends with "o" ?

SELECT * FROM customer WHERE first_name LIKE 'a%o';

-- Answer : This query filters the first_name and gives the names which start with a and ends with o.

-- 20.  Get the films with pg and pg-13 rating using IN operator ?

SELECT title, rating FROM film WHERE rating IN ('PG', 'PG-13');

-- Answer : This query uses the IN operator and gives the title name which has rating of PG and PG-13.

-- 21.  Get the films with length between 50 to 100 using between operator ?

SELECT title, length FROM film WHERE length BETWEEN 50 AND 100;

-- Answer : This query has between operator and filter the column which has length 50 to 100.alter

-- 22. Get the top 50 actors using limit operator ?

SELECT * FROM actor LIMIT 50;

-- Answer : In this query we need to use directly limit operator without using WHERE command.

-- 23. Get the distinct film ids from inventory table ?

SELECT DISTINCT film_id FROM inventory;

-- Answer : This distinct command filters and removes all the duplicate values from the film_id column.



                                                                                                                                  



