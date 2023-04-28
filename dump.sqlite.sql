QUESTION ONE: Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.

SELECT *
FROM CITY
WHERE POPULATION > 100000 AND COUNTRYCODE = 'USA';

QUESTION TWO: Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.

SELECT NAME
FROM CITY
WHERE POPULATION > 120000 AND COUNTRYCODE = 'USA';

QUESTION THREE: Query all columns (attributes) for every row in the CITY table

SELECT *
FROM CITY;

QUETION FOUR: Query all columns for a city in CITY with the ID 1661
SELECT *
FROM CITY
WHERE ID = 1661;

QUESTION FIVE: Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.
SELECT *
FROM CITY
WHERE COUNTRYCODE = 'JPN';

QUESTION SIX: Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.
SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'JPN';

QUESTION SEVEN: Query a list of CITY and STATE from the STATION table.
SELECT CITY, STATE
FROM STATION;

QUESTION EIGHT: Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.
SELECT DISTINCT CITY
FROM STATION
WHERE MOD(ID, 2) = 0;

QUESTION NINE: Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
SELECT COUNT(CITY) - COUNT(DISTINCT CITY)
FROM STATION

QUESTION TEN: Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
( select CITY, char_length(CITY) as len_city 
  from STATION 
  where char_length(CITY) = (select char_length(CITY) 
                             from STATION 
                          order by char_length(CITY) LIMIT 1) 
  Order by CITY LIMIT 1) 
 UNION ALL 
 (select CITY, char_length(CITY) as len_city 
  from STATION 
  where char_length(CITY)=(select char_length(CITY) 
                           from STATION 
                           order by char_length(CITY) DESC LIMIT 1)  
  Order by CITY DESC LIMIT 1) 
  ORDER BY char_length(CITY);

QUESTION 11: Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE 'a%'OR CITY LIKE 'e%' OR CITY LIKE 'i%' OR CITY LIKE 'o%' OR CITY LIKE 'u%';

QUESSTION 12: Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u';

QUESTION 13: Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE (CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%') AND (CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u')
ORDER BY CITY;

QUESTION 14: Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY NOT RLIKE '^[aeiouAEIOU].*$'

QUESTION 15: Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates
SELECT DISTINCT CITY
FROM STATION
WHERE UPPER(SUBSTR(CITY, LENGTH(CITY), 1)) NOT IN ('A','E','I','O','U') AND LOWER(SUBSTR(CITY, LENGTH(CITY),1)) NOT IN ('a','e','i','o','u'); 

QUESTION 16: Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(SUBSTR(CITY,1,1)) NOT IN ('a','e','i','o','u')
OR LOWER(SUBSTR(CITY, LENGTH(CITY),1)) NOT IN ('a','e','i','o','u');

QUESTION 17: Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates
SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(SUBSTR(CITY,1,1)) NOT IN ('a','e','i','o','u')
AND LOWER(SUBSTR(CITY,LENGTH(CITY),1)) NOT IN ('a','e','i','o','u');

QUESTION 18: Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
SELECT Name
FROM STUDENTS
WHERE Marks > 75
ORDER BY SUBSTR(NAME, LENGTH(NAME)-2, 3), ID;

QUESTION 19: Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order
SELECT name
FROM Employee
ORDER BY name ASC

QUESTION 20: Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than  per month who have been employees for less than  months. Sort your result by ascending employee_id
SELECT name
FROM Employee
WHERE salary > 2000 AND months < 10
ORDER BY employee_id ASC

QUESTION 21: Query the total population of all cities in CITY where District is California.
SELECT SUM(POPULATION)
FROM CITY
WHERE DISTRICT = 'California'

QUESTION 22: Query the average population of all cities in CITY where District is California
SELECT AVG(POPULATION)
FROM CITY
WHERE DISTRICT = 'California';

QUESTION 23: Query the average population for all cities in CITY, rounded down to the nearest integer.
SELECT ROUND(AVG(Population)) AS AvgPopulation 
FROM City ;

QUESTION 24: Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.
SELECT SUM(POPULATION)
FROM CITY
WHERE COUNTRYCODE = 'JPN';

 
