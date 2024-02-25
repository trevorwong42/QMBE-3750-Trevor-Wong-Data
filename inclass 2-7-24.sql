USE bits_copy;

SHOW TABLES;

SELECT *
FROM client;

#Order by using multiple coloumns 
SELECT *
FROM client
ORDER BY balance DESC, creditlimit ASC;

SELECT *
FROM client
ORDER BY balance DESC;

SELECT *
FROM client
ORDER BY balance DESC, city ASC;



SELECT street, city
FROM client
ORDER BY 1 DESC, 2 ASC;

#Math functions in sql

SELECT ABS(balance0 AS abs_balance, clientname
FROM client;


Select LOG(creditlimit) AS log_credit, zipcode
FROM client;


SELECT *
FROM consultant;

SELECT rate*hours AS weekley_salary
FROM consultant


SELECT POW(Rate, 2.5) AS rate_squared
FROM consultant;

SELECT SQRT(Rate) AS square_root_rate
FROM consultant;


####String functions

SELECT UPPER(street) AS street_upper
FROM consultant;

SELECT Lower(street) AS street_lower
FROM consultant;



SELECT LEFT (city, 3)
FROM client;

SELECT REVERSE (clientname) AS reverse_client 
FROM client;

#SUBstring(string, start, length)
SELECT SUBSTRING(city,2,3) AS substring_text
FROM client;

#CONCAT merge columns 
#CONCAT(string1, string2,...,string_n)

SELECT CONCAT(clientnum, zipcode) AS clientnum_zip
FROM client;

#CHAR_LENGTH(STRING)
SELECT CHAR_LENGTH(street) AS longest_street_name
FROM client;


