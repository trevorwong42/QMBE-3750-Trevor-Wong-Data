USE bits_copy;
SHOW TABLES;

SELECT *
FROM tasks;

SELECT *
FROM client;

CREATE TABLE category_drm AS 
SELECT *
FROM tasks
WHERE category='DRM';

SELECT *
FROM category_drm;

#adding or droping a column

ALTER TABLE category_drm
ADD COLUMN email VARCHAR(255);

SELECT * 
FROM category_drm;

#to change a column's data type or constraints,
#use ALTER TABLE with the MODIFY COLUMN or ALTER COLUMN

ALTER TABLE category_drm
MODIFY COLUMN email VARCHAR(320); 

#For SQL Server, the command is ALTER COLUMN no need to do that:
#ALTER TABLE category_drm
#ALTER COLUMN email NVARCHAR(320);

#Drop Column
ALTER TABLE category_drm
DROP COLUMN email;

#summarizing data into a new table
CREATE TABLE tasks_number AS
SELECT taskid, COUNT(*) AS task_count
FROM tasks
GROUP BY taskid;

CREATE TABLE average_credit AS 
SELECT state, AVG(CreditLimit) AS average
FROM client
GROUP BY state;

SELECT*
FROM average_credit;

SELECT * 
FROM tasks_number;

#updating table and this does not work for some reason
UPDATE category_drm
SET email='new.email@example.com'
WHERE TaskID='DA11';

#written on the board
#to identify cell in a table-> column+row
#best practices and considerations for transporting data: 
#1. backup before transporting. 2. Test in a development environmnet 3. understand data relationships. 4.indexing

DELETE FROM category_drm
WHERE TaskID='DA11'

#2/7 notes
# previously we were ordering by one column
# now we will order by more than one and this can break a tie and be more convenient 
# orders by which column you write in first

SELECT * 
FROM client
ORDER BY balance DESC, creditlimit ASC;

SELECT *
FROM client
ORDER BY balance DESC;

# if it is a string then it orders by alphabetical order
SELECT *
FROM client
ORDER BY city DESC;

SELECT *
FROM client
ORDER BY ClientNum DESC, ClientName ASC;

SELECT street, city
FROM client
ORDER BY 1 DESC,2 DESC;

SELECT *
FROM client
ORDER BY 1 DESC,2 DESC;

#math functions in SQL 

SELECT ABS(balance) AS abs_balance, clientname 
FROM client;

SELECT LOG (creditlimit) AS log_credit, zipcode
FROM client;

SELECT*
FROM consultant;

#function(argument 1, argument 2)
	#return something
# power function POW(column, exponent)--float numbers work in place of the exponent

SELECT POW(Rate, 2) AS rate_squared
FROM consultant;

SELECT SQRT(Rate) AS square_root_rate
FROM consultant;

SELECT rate*hours AS weekly_salary
FROM consultant;

## string functions
# "Jessica"
## LEFT(string, integer)
##LEFT ( Jessica,4
	#returns Jess

SELECT LEFT (city, 2)
FROM client;

SELECT REVERSE (clientname) AS reverse_client
FROM client;

#SUBSTRING(string, start, length)
SELECT SUBSTRING(city,1,2) AS substring_text
FROM client;

#CONCAT-Merge columns
#CONCAT(string1,string2,...,string_n)
#Can use to create primary key and unique identifers

SELECT CONCAT(city, street) AS city_street
FROM client;

SELECT CONCAT(clientnum,zipcode) as clientnum_zip
FROM clientl

#CHAR_LENGTH(string)

SELECT CHAR_LENGTH (street) AS longest_street_name
FROM client;

#procedural Order and Code/Script Order
- #procedural order: from, where, group by, having, select, order by, limit
- # code order: select, from, where, group by, having, order by, limit

#I have no clue I was a tad late... 2/9
SELECT COUNT(*) AS credit_limit_per_client, creditlimit
FROM client
GROUP BY 2;

#CASE WHEN is like if then in python
#synthax
#CASE
	#When condition 1 then result 1
	#ELSE result
#END;

SELECT CreditLimit,
CASE
	WHEN CreditLimit<= 2500 THEN "Bad credit"
    WHEN CreditLimit<= 5000 THEN "okay credit"
    WHEN CreditLimit<= 7500 THEN "better credit"
    ELSE "good credit"
END AS credit_rating
FROM client;

#CAWE WHEN with Aggregations
# Count number of rows that meet a certain condition


SELECT CreditLimit,
CASE
	WHEN CreditLimit<= 2500 THEN "Bad credit"
     WHEN CreditLimit<= 5000 THEN "okay credit"
     WHEN CreditLimit<= 7500 THEN "better credit"
     ELSE "good credit"
END AS credit_rating,
AVG(creditlimit) as average_credit
FROM client
GROUP BY 
	CASE
	WHEN CreditLimit<= 2500 THEN "Bad credit"
      WHEN CreditLimit<= 5000 THEN "okay credit"
      WHEN CreditLimit<= 7500 THEN "better credit"
      ELSE "good credit"
    END;
#IDK why ^doesn't work

SELECT creditlimit
FROM client;

SELECT
CASE 
	WHEN CreditLimit<= 2500 THEN "Bad credit"
     WHEN CreditLimit<= 5000 THEN "okay credit"
     WHEN CreditLimit<= 7500 THEN "better credit"
     ELSE "good credit"
END AS credit_rating,
COUNT(*) as number_of_creditors
FROM client
GROUP BY 
	CASE
	WHEN CreditLimit<= 2500 THEN "Bad credit"
     WHEN CreditLimit<= 5000 THEN "okay credit"
     WHEN CreditLimit<= 7500 THEN "better credit"
     ELSE "good credit"
     END;

SELECT *
FROM client;

#single quotes and double quotes are the same in SQL
#CAE WHEN L create new column, aggregate by groups, sorting -> CASE WHEN + ORDER BY

SELECT city, CASE
WHEN city IN ('Easton','Sunland','Lizton') THEN "Region1"
WHEN city IN ('Harpersburg','Amo') THEN "Region 2"
ELSE "Region 3"
END AS 'region'
FROM client;

#ORDER BY CASE
#sort by city, and client.name but if city is Easton, then sort by city then zipcode 

SELECT*
FROM client
ORDER BY city,
	CASE
		WHEN city="Easton" THEN zipcode
        ELSE clientname
	END;
    
SELECT *
FROM tasks;

#ORDER BY category, then description. But if category="SOM" then order by category ... i can't see the rest

SELECT*
FROM tasks 
ORDER BY category,
	CASE
		WHEN category="SOM" THEN price
        ELSE description
	END;

#SUBQUERIES IN SQL -> Query within a query
#Check if the first letter of the city name is not A (not is <>) and return that:

SELECT client.*
	FROM (
		SELECT *
			FROM client
			WHERE creditlimit =5000
			) client
	WHERE LEFT(city,1)<> 'A';

SELECT *
FROM client 
WHERE creditlimit=5000;

SELECT * FROM tasks;

SELECT * FROM 
(SELECT* FROM tasks
WHERE price<=65) tasks
WHERE category='DRM';


SELECT * 
FROM tasks
WHERE price<=65 AND category='DRM';

#JOINS 
#Identify the primary key and foreign key
#select rows by table.column name syntax, need mainly a primary key to join to tables together
#NOW...
#SELECT table1column1, table2column2
#Types of joins
	#Inner join- returns rows when there is at least one match in both tables, if no math rows are not recorded
    #left join- returns all rows from the left table and the matched rows from the right table, result is NULL from right side if there is not match
    #right join-^ but switch left and right
    
SELECT client.clientnum, client.clientname, consultant.consltnum
FROM client #this is your left table
JOIN consultant ON client.consltnum=consultant.consltnum; #this is right table

SELECT client.clientnum, client.clientname, consultant.consltnum
FROM client
INNER JOIN consultant ON client.consltnum=consultant.consltnum;

#referencing tables, does same thing as previous three lines, just written differently

SELECT a.clientnum,a.clientname,b.consltnum
FROM client a# a refers to teh client tables
INNER JOIN consultant b ON a.consltnum=b.consltnum; #b refers to teh consultant's table
    

    
    
    










