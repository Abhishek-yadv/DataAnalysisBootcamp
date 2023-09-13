/************************************************/
/******************* BASIC SELECT **************/
/************************************************/

/**** Question 1(Weather Observation Station 4)****/
/********** Key concept Basic SELECT *************/
SELECT (COUNT(CITY)- COUNT(DISTINCT(CITY))) AS DIFFRENCE
FROM STATION;

/**************************************************/
/**** Question 2(Revising the Select QueryI) *****/
SELECT *
FROM CITY
WHERE POPULATION > 100000 AND COUNTRYCODE = 'USA';

# 2ND METHOD BY USING CTE
WITH AMERICA AS (SELECT *
FROM CITY
WHERE POPULATION > 100000 AND COUNTRYCODE = 'USA')
SELECT *
FROM AMERICA ;


/**************************************************/
/**** Question 3(Revising the Select QueryII) ****/
# 1ST METHOD Simple Select
SELECT NAME
FROM CITY
WHERE POPULATION > 120000 AND COUNTRYCODE = 'USA';

# 2nd Method Using CTE
WITH CITY_NAME AS (
    SELECT NAME
    FROM CITY
    WHERE POPULATION > 120000 AND COUNTRYCODE = 'USA'
)
SELECT NAME FROM CITY_NAME ;

# 3rd METHOD Using Subquerry
SELECT NAME
FROM (SELECT NAME 
	    FROM CITY
        WHERE POPULATION > 120000 AND COUNTRYCODE = 'USA'
) AS Subquerry;


/**************************************************/
/************** Question 4 (Select All) **********/
SELECT *
FROM CITY;


/**************************************************/
/************ Question 5 (Select By ID) **********/
SELECT *
FROM CITY
WHERE ID = 1661;

/**************************************************/
/*** Question 6 (Japanese Cities' Attributes) ****/
SELECT *
FROM CITY
WHERE COUNTRYCODE  = 'JPN';

/**************************************************/
/****** Question 7 (Japanese Cities' Names) ******/
SELECT Name
FROM CITY
WHERE COUNTRYCODE  = 'JPN';

/*****************************************************/
/***Question 8 (Weather Observation Station 1) ******/
SELECT CITY, STATE
FROM STATION;


/*****************************************************/
/***Question 9 (Weather Observation Station 3) ******/
SELECT DISTINCT(CITY)
FROM STATION
WHERE ID%2=0;

/*****************************************************/
/***Question 10 (Weather Observation Station 5) ******/
SELECT CITY, LENGTH(CITY)
FROM STATION
ORDER BY LENGTH(CITY) ASC, CITY ASC
LIMIT 1;
SELECT CITY, LENGTH(CITY) AS LENGTH
FROM STATION
ORDER BY LENGTH(CITY) DESC, CITY ASC
LIMIT 1;


#2ND METHOD USING CTE
WITH MIN_NUM AS (
    SELECT CITY, LENGTH(CITY) AS MIN_LEN
    FROM STATION
    ORDER BY LENGTH(CITY) ASC, CITY ASC
    LIMIT 1
),
MAX_NUM AS (
    SELECT CITY, LENGTH(CITY) AS MAX_LEN
    FROM STATION
    ORDER BY LENGTH(CITY) DESC, CITY DESC
    LIMIT 1
)
SELECT CITY, MIN_LEN
FROM MIN_NUM;

SELECT CITY, MAX_LEN
FROM MAX_NUM;

/** Note **/
 -- Alias cannot be referenced in the same query level where it's defined. bcz alias is not accessible in the same query level where it's defined.
 --  for example we can not order by MAX_LEN instead of LENGTH(CITY)
 

/*****************************************************/
/***Question 11 (Weather Observation Station 6) *****/

-- 1st method by using SUBSTR
/* SUBSTRING() that is used to extract a substring from a given string.
GENRAL syntax is as follows:
SUBSTRING(string, start_position, length)
string: This is the input string from which you want to extract the substring.
start_position: An integer value specifies the starting position from where the substring extraction should begin. first character of the string is starting from position 1.
length (optional): This is an integer value that specifies the number of characters to be extracted from the input string. If the length is not provided, the function will extract the substring from the starting position to the end of the string.
*/
SELECT CITY
FROM STATION
WHERE LOWER(SUBSTR(CITY,1,1)) in ('a','e','i','o','u');


-- 2nd method by using REGEXP
SELECT CITY
FROM STATION
WHERE CITY REGEXP"^[A,E,I,O,U]";


-- 3rd method By Using Like 
SELECT CITY
FROM STATION
WHERE CITY LIKE "a%"
	OR CITY LIKE "e%"
    OR CITY LIKE "i%"
    OR CITY LIKE "o%"
    OR CITY LIKE "u%";
    
-- 4th method By using Left 
SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY, 1) IN ('a', 'e', 'i', 'o', 'u');

/* the RIGHT and LEFT functions are string functions
 that allow you to extract a specific number of characters from the right or left side of a given string,
 RIGHT(str, len):-  RIGHT function takes two arguments: str, which is the input string, and len, the number of characters you want to extract from the right side of the string and returns a new string 
 same as with left function
 */
/*****************************************************/
/***Question 12 (Weather Observation Station 7) *****/

# --1st method by using Right method
SELECT DISTINCT CITY
FROM STATION
WHERE RIGHT(CITY, 1) IN ('a', 'e', 'i', 'o', 'u');

# -- 2nd method by using regex $ sign
SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP"[A,E,I,O,U]$";


# -- 3rd method by using like method
SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE "%A" OR
      CITY LIKE "%E" OR
      CITY LIKE "%I" OR
      CITY LIKE "%O" OR
      CITY LIKE "%U";

# --4TH method by using substr 
SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(SUBSTR(CITY, -1)) IN ('a','e','i','o','u');


/*****************************************************/
/***Question 13 (Weather Observation Station 8) *****/
/***********************************/
# 1ST METHOD BY using left and right method
SELECT CITY
FROM STATION
WHERE LEFT(CITY, 1) IN ('a','e','i','o','u') AND RIGHT(CITY, 1) IN ('a','e','i','o','u');

# 2nd method by using regexp
# ".*": Matches any sequence of characters (except newline) zero or more times. 
SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '^[aeiou].*[aeiou]$';

# 3rd Method By Using Subsstring
SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(SUBSTR(CITY, 1, 1)) IN ('a','e','i','o','u') AND LOWER(SUBSTR(CITY, -1, 1)) IN ('a','e','i','o','u');

# 4th Method By Using LIke method
SELECT DISTINCT CITY
FROM STATION
WHERE (CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%')
  AND (CITY LIKE '%A' OR CITY LIKE '%E' OR CITY LIKE '%I' OR CITY LIKE '%O' OR CITY LIKE '%U');


/*****************************************************/
/***Question 14 (Weather Observation Station 9) *****/
# 1st method by using Left method
SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY, 1) NOT IN ('a','e','i','o','u'); 

# 2nd method by substr
SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(SUBSTR(CITY, 1, 1)) NOT IN ('a','e','i','o','u');

# 3rd method by using regexp
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT REGEXP "^[aeiou]";

# 4th method by using 
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT LIKE "a%" AND
      CITY NOT LIKE "e%" AND
      CITY NOT LIKE "i%" AND
      CITY NOT LIKE "o%" AND
      CITY NOT LIKE "U%";
      

/*****************************************************/
/***Question 15 (Weather Observation Station 10)*****/
# 1st method by using RIGHT method
SELECT DISTINCT CITY
FROM STATION
WHERE RIGHT(CITY, 1) NOT IN ('a','e','i','o','u'); 

# 2nd method by substr
SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(SUBSTR(CITY, -1, 1)) NOT IN ('a','e','i','o','u');

# 3rd method by using regexp
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT REGEXP "[aeiou]$";

# 4th method by using 
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT LIKE "%a" AND
      CITY NOT LIKE "%e" AND
      CITY NOT LIKE "%i" AND
      CITY NOT LIKE "%o" AND
      CITY NOT LIKE "%u";

/*****************************************************/
/***Question 16 (Weather Observation Station 11)*****/
# 1st method by using RIGHT AND LEFT CLAUSE
SELECT DISTINCT CITY
FROM STATION
WHERE RIGHT(CITY,1) NOT IN ('a','e','i','o','u') OR
      LEFT(CITY,1) NOT IN('a','e','i','o','u');
      
#2ND method by using substring
SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(SUBSTR(CITY, 1, 1)) NOT IN ('a','e','i','o','u') OR
      LOWER(SUBSTR(CITY,-1, 1)) NOT IN('a','e','i','o','u');
      
# 3RD method By using regexp
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT REGEXP '^[aeiou]' OR
      CITY NOT REGEXP '[aeiou]$';
    
    
/*****************************************************/
/***Question 17 (Weather Observation Station 12)*****/
# 1st method USING regexp
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT REGEXP '^[aeiou]' AND 
      CITY NOT REGEXP '[aeiou]$';

# 2nd method by using SUBSTR
#2ND method by using substring
SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(SUBSTR(CITY, 1, 1)) NOT IN ('a','e','i','o','u') AND
      LOWER(SUBSTR(CITY,-1, 1)) NOT IN('a','e','i','o','u');
      
      
      
/*****************************************************/
/********** Question 18 (Higher Than 75 Marks)*******/
# 1st method By using substring
SELECT Name
FROM Students
WHERE Marks > 75
ORDER BY SUBSTR(Name, -3), ID;

# 2nd method by using RIGHT
SELECT Name
FROM Students
WHERE Marks > 75
ORDER BY RIGHT(Name, 3), ID;

# 3RD method by using regexp
SELECT Name
FROM Students
WHERE Marks > 75
ORDER BY REGEXP_SUBSTR(Name, '.{0,3}$'), ID;

-- In regular expressions, the dot (.) is a special metacharacter that matches any character except for a newline. It's used as a wildcard, meaning it can represent any single character. 
-- *: The asterisk is a quantifier that indicates zero or more occurrences of the preceding character or group.
-- Note:- When .* is used together, it forms a powerful construct known as a "greedy match." It matches zero or more occurrences of any character (except newline) until the end of the line or until the next pattern in the regular expression.
# example
/* 
The regular expression a.*b would match strings like "ab", "acb", "azb", "axxxb", "abbb", etc. The .* part matches any characters between "a" and "b" (including no characters).
The regular expression .* matches any sequence of characters, including an empty string.
 */
 -- Note:- .*? is a non-greedy match for zero or one occurrences of any character. It will match an empty string or a single character if present.

/**************************************************/
/********** Question 19 (Employee Names)**********/
SELECT name
FROM Employee
ORDER BY name;

/**************************************************/
/********** Question 20 (Employee salary)**********/
SELECT Name
FROM Employee
WHERE salary > 2000 AND months < 10;



# Remeber: Sometime you find answer directly from data so read and understand data carefully before jump on any question
-- Before solving questions, read across the data carefully what the data is actaul and what's trying to saying
-- Rmbr For agg fxn filteration always follow having bcz where works on one row at time Not sets of row


/**************************************************/
/******************************** Advanced Select*/
/************************************************/

/**************************************************/
/******** Question 21 (Type of Triangle) *********/
SELECT 
    CASE
        WHEN A + B <= C OR A + C <= B OR B + C <= A THEN 'Not A Triangle'
        WHEN A = B AND A = C THEN 'Equilateral'
        WHEN A = B OR A = C OR B = C THEN 'Isosceles'
        ELSE 'Scalene'
    END
FROM TRIANGLES;

# OR also when 2*biggest size of trangele greter than sum of all side legth
SELECT 
    CASE
        WHEN 2 * GREATEST(A, B, C) >= (A + B + C) THEN "Not A Triangle"
        WHEN A = B AND A = C THEN "Equilateral"
        WHEN A = B OR A = C OR B = C THEN "Isosceles"
        ELSE "Scalene"
    END
FROM TRIANGLES;
    

/**************************************************/
/************(Question 22 The PADS) **************/
# 1st method by using SELECT
SELECT CONCAT(name, '(', LEFT(occupation, 1), ')') AS FormattedOccupation
FROM occupations
ORDER BY name;
SELECT CONCAT('There are a total of ', COUNT(occupation), ' ', LOWER(occupation), 's.') AS TotalOccupations
FROM occupations
GROUP BY occupation
ORDER BY COUNT(occupation), occupation;


#2nd method by using CTE
WITH PROF AS (
    SELECT name, CONCAT('(', LEFT(occupation, 1), ')') AS FormattedOccupation
    FROM occupations
)
SELECT CONCAT(name, FormattedOccupation) AS FormattedOccupation
FROM PROF
ORDER BY name;
WITH PROF_COUNT AS (
    SELECT COUNT(occupation) AS C, LOWER(occupation) AS occupation
    FROM occupations
    GROUP BY occupation
)
SELECT CONCAT('There are a total of ', C, ' ', occupation, 's.') AS TotalOccupations
FROM PROF_COUNT
ORDER BY C, occupation;


-- dON'T come with multiple WITH clauses in a single query. better should be combine the two CTEs into a single one just using comma and cte name.
/*CONCAT function is used to concatenate (combine) two or more strings together into a single string.
 It takes multiple string arguments and returns a new string formed by joining them in the order specified.
 Genaral syntax: - CONCAT(string1, string2, string3, ...)
 And just for printing single, select is enouph
*/
# Remember for string manipulation in mysql , (substr,right/left,like and regex) is pretty enouph


/**************************************************/
/********** (Question 23 OCCUPATION) *************/
SELECT
    MAX(CASE WHEN Occupation = 'Doctor' THEN Name END) AS Doctor,
    MAX(CASE WHEN Occupation = 'Professor' THEN Name END) AS Professor,
    MAX(CASE WHEN Occupation = 'Singer' THEN Name END) AS Singer,
    MAX(CASE WHEN Occupation = 'Actor' THEN Name END) AS Actor
FROM (
    SELECT Occupation, 
    Name, 
    ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS row_num
    FROM OCCUPATIONS
) AS Subquery
GROUP BY row_num
ORDER BY row_num;

-- Note  B/w (MIN & Max) difference is same here in SQL, bcz there is only one non-null value within a group, both MAX and MIN functions will return the same result.
#2ND method using if statement
SELECT
    MIN(IF(occupation = 'Doctor', name, NULL)) AS Doctor,
    MIN(IF(occupation = 'Professor', name, NULL)) AS Professor,
    MIN(IF(occupation = 'Singer', name, NULL)) AS Singer,
    MIN(IF(occupation = 'Actor', name, NULL)) AS Actor
FROM
    (SELECT
        name,
        occupation,
        ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name) AS row_num
    FROM occupations) AS ord
GROUP BY row_num;


#3rd method by using CTE AND JOIN
WITH D AS(
    SELECT ROW_NUMBER() OVER(ORDER BY Name ASC) AS row_num, Name
    FROM OCCUPATIONS
    WHERE Occupation = 'Doctor'
    ),
    P AS(
    SELECT ROW_NUMBER() OVER(ORDER BY Name ASC) AS row_num, Name
    FROM OCCUPATIONS
    WHERE Occupation = 'Professor'
    ),
    S AS(
    SELECT ROW_NUMBER() OVER(ORDER BY Name ASC) AS row_num, Name
    FROM OCCUPATIONS
    WHERE Occupation = 'Singer'
    ),
    A AS(
    SELECT ROW_NUMBER() OVER(ORDER BY Name ASC) AS row_num, Name
    FROM OCCUPATIONS
    WHERE Occupation = 'Actor'
    )   
SELECT D.Name, P.Name, S.Name, A.Name
FROM P
LEFT JOIN D ON P.row_num = D.row_num
LEFT JOIN S ON P.row_num = S.row_num
LEFT JOIN A ON P.row_num = A.row_num ;


#4th method with cte without join
WITH ORIGIN AS
    (SELECT RANK() OVER(PARTITION BY OCCUPATION ORDER BY NAME) AS RNK,
    NAME, OCCUPATION
    FROM OCCUPATIONS
    ORDER BY OCCUPATION, NAME)
SELECT 
    MAX(CASE OCCUPATION WHEN 'Doctor' THEN NAME END),
    MAX(CASE OCCUPATION WHEN 'Professor' THEN NAME END),
    MAX(CASE OCCUPATION WHEN 'Singer' THEN NAME END),
    MAX(CASE OCCUPATION WHEN 'Actor' THEN NAME END) 
FROM ORIGIN
GROUP BY RNK;

-- PIVOT doesn't support in mysql
/*
 In MySQL, COALESCE is a useful function used to handle NULL values in expressions.
 It returns the first non-NULL expression in the list of arguments. If all arguments are NULL, it returns NULL.
 Genral Syntax COALESCE(expression1, expression2, ..., expressionN)
*/;
# 5th method Using group_concat and window function:
SELECT  
	  GROUP_CONCAT(IF(occupation = "doctor", name, null)) AS Docter, 
	  GROUP_CONCAT(IF(occupation = "professor", name, null)) AS Professor, 
	  GROUP_CONCAT(IF(occupation = "singer", name, null)) AS Singer, 
	  GROUP_CONCAT(IF(occupation = "actor", name, null)) AS Actor 
FROM (SELECT *, ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name) AS row_num
	  FROM occupations
      ) As derived
GROUP by row_num;

/* Query Explanation:- 
SELECT
    MAX(CASE WHEN Occupation = 'Doctor' THEN Name END) AS Doctor,
    MAX(CASE WHEN Occupation = 'Professor' THEN Name END) AS Professor,
    MAX(CASE WHEN Occupation = 'Singer' THEN Name END) AS Singer,
    MAX(CASE WHEN Occupation = 'Actor' THEN Name END) AS Actor
FROM (
    SELECT Occupation, 
    Name, 
    ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS row_num
    FROM OCCUPATIONS
) AS Subquery
GROUP BY row_num
ORDER BY row_num;

-- Query 1
SELECT * FROM OCCUPATIONS

-- Result 1
Occupation table:-
Ashley Professor
Samantha Actor
Julia Doctor
Britney Professor
Maria Professor
Meera Professor
Priya Doctor
Priyanka Professor
Jennifer Actor
Ketty Actor
Belvet Professor
Naomi Professor
Jane Singer
Jenny Singer
Kristeen Singer
Christeen Singer
Eve Actor
Aamina Doctor

-- Query 2
SELECT
        name,
        occupation,
        ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name) AS row_num
    FROM
        occupations
-- result 2
Eve Actor 1
Jennifer Actor 2
Ketty Actor 3
Samantha Actor 4
Aamina Doctor 1
Julia Doctor 2
Priya Doctor 3
Ashley Professor 1
Belvet Professor 2
Britney Professor 3
Maria Professor 4
Meera Professor 5
Naomi Professor 6
Priyanka Professor 7
Christeen Singer 1
Jane Singer 2
Jenny Singer 3
Kristeen Singer 4

-- Querry 3
SELECT
    IF(occupation = 'Doctor', name, NULL) AS Doctor,
    IF(occupation = 'Professor', name, NULL) AS Professor,
    IF(occupation = 'Singer', name, NULL) AS Singer,
    IF(occupation = 'Actor', name, NULL) AS Actor
FROM
    (SELECT
        name,
        occupation,
        ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name) AS row_num
    FROM
        occupations) AS ord; # GROUP BY row_num;
-- Wihout grouping bcz for grouping we have to aggregate

-- Result 3 would be:-
NULL NULL NULL Eve
NULL NULL NULL Jennifer
NULL NULL NULL Ketty
NULL NULL NULL Samantha
Aamina NULL NULL NULL
Julia NULL NULL NULL
Priya NULL NULL NULL
NULL Ashley NULL NULL
NULL Belvet NULL NULL
NULL Britney NULL NULL
NULL Maria NULL NULL
NULL Meera NULL NULL
NULL Naomi NULL NULL
NULL Priyanka NULL NULL
NULL NULL Christeen NULL
NULL NULL Jane NULL
NULL NULL Jenny NULL
NULL NULL Kristeen NULL

-- Querry 4
SELECT
    Max(IF(occupation = 'Doctor', name, NULL)) AS Doctor,
    Max(IF(occupation = 'Professor', name, NULL)) AS Professor,
    Max(IF(occupation = 'Singer', name, NULL)) AS Singer,
    Max(IF(occupation = 'Actor', name, NULL)) AS Actor
FROM
    (SELECT
        name,
        occupation,
        ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name) AS row_num
	FROM
        occupations) AS ord
        GROUP BY row_num;

# results
Aamina Ashley Christeen Eve
Julia Belvet Jane Jennifer
Priya Britney Jenny Ketty
NULL Maria Kristeen Samantha
NULL Meera NULL NULL
NULL Naomi NULL NULL
NULL Priyanka NULL NULL
*/;


/***********************************************************/
/************ (Question 24 Binary Tree Nodes) *************/
SELECT N,
    CASE
        WHEN P IS NULL THEN 'Root'
        WHEN N IN (SELECT DISTINCT P FROM BST) THEN 'Inner'
    ELSE 'Leaf'
END
FROM BST
ORDER BY N;

# OR
SELECT N,
    CASE
        WHEN P IS NULL THEN 'Root'
        WHEN N NOT IN (SELECT DISTINCT P FROM BST WHERE P IS NOT NULL)THEN 'Leaf'
        ELSE 'Inner'
END AS NodeType
FROM BST ORDER BY N;
/* For Forming adjecsent row//along with row Case, Often used to generate a value for a column based on a condition. */

# 2nd method By using LEFT JOIN
SELECT BST1.N,
CASE
    WHEN BST1.P IS NULL THEN 'Root'
    WHEN BST3.P IS NULL THEN 'Inner'
    ELSE 'Leaf'
END
FROM BST AS BST1
LEFT JOIN BST AS BST2
    ON BST1.P = BST2.N
LEFT JOIN BST AS BST3
    ON BST2.P = BST3.N
ORDER BY BST1.N;
    

/****************************************************/
/*********** (Question 25 New Companies) ***********/
SELECT C.Company_Code, C.Founder, COUNT(DISTINCT(Lead_Manager_Code)), COUNT(DISTINCT(Senior_Manager_Code)), COUNT(DISTINCT(Manager_Code)), COUNT(DISTINCT(Employee_Code))
FROM Company C
LEFT JOIN Employee E
ON E.Company_Code = C.Company_Code
GROUP BY C.Company_Code, C.Founder
ORDER BY C.Company_Code ASC;


/************************************************/
/****************** Aggregation ****************/
/**********************************************/

/******************************************************************/
/******** (26 Revising Aggregations - The Count Function) ********/
# COUNT(*) also count all row without here "*" represent all row
SELECT COUNT(NAME)
FROM CITY
WHERE Population > 100000;

# 2nd by directly using COUNT(*) without specified name
SELECT COUNT(*)
FROM CITY
WHERE Population > 100000;


/******************************************************************/
/******** (27 Revising Aggregations - The Count Function) ********/
SELECT SUM(POPULATION)
FROM CITY
WHERE DISTRICT = 'California';


/******************************************************************/
/******** (28 Revising Aggregations - Averages) ******************/
SELECT AVG(POPULATION)
FROM CITY
WHERE DISTRICT = 'California';

-- HAVING clause is used to filter the results of a GROUP BY query based on aggregate functionss.
-- Example like
SELECT NAME, AVG(POPULATION)
FROM CITY
GROUP BY NAME
HAVING MAX(DISTRICT) = 'California';


/* the MAX and MIN functions are used to retrieve the maximum and minimum values, respectively, from a set of values.
 These functions are typically used with numeric or date/time values. When it comes to strings, they work a bit differently.
 For strings, MAX and MIN are used to retrieve the highest and lowest lexicographically ordered values, respectively.
 for example table
Alice
Bob
Carol
David
 
 */

/**********************************************************/
/************** (29 Average Population) ******************/
-- (FLOOR function):- Round Down to nearest integer
-- (CEIL function) Round Up to nearest integer 
--  ROUND function to round a number to a specified number of decimal places. takes twoo argument
SELECT FLOOR(ROUND(AVG(Population)))
FROM CITY;

/******************************************************************/
/******************** (30 Japan Population) **********************/
SELECT SUM(POPULATION)
FROM CITY
WHERE COUNTRYCODE = 'JPN';



/******************************************************************/
/*********** (31 Population Density Difference) ******************/
SELECT (MAX(POPULATION) - MIN(POPULATION)) AS Diifrence_population
FROM CITY;


/******************************************************************/
/********************* (32 The Blunder) **************************/
/*
Replace:-
		The REPLACE function in MySQL is used to replace all occurrences of a specified substring with another substring in a given string
        General syntax:- 
						REPLACE(original_string, substring_to_replace, replacement_string)

Example:-
SELECT REPLACE('Hello, World!', 'Hello', 'Hi') AS modified_string;
-- Output: 'Hi, World!'


CAST:-
		The CAST function in MySQL is used to explicitly convert a value from one data type to another.
        It's often used when you need to change the data type of a column or expression for specific operations or comparisons.
        
        Genearal syntax;-
						CAST(expression AS new_data_type)
Example:-
SELECT CAST('42' AS SIGNED) AS converted_value;
-- Output: 42

--REPLACE is used for replacing substrings within strings, while CAST is used for converting data types.

-- (FLOOR function):- Round Down to nearest integer. /SELECT FLOOR(4.7);  -- Result will be 4
-- (CEIL function):- Round Up to nearest integer. /SELECT CEIL(4.3);  -- Result will be 5
--  (ROUND function):- Round a number to a specified number of decimal places. /SELECT ROUND(4.567);     -- Result: 5 (rounded to nearest integer)

-- Some notable example in round:-
SELECT ROUND(4.567, 2);  -- Result: 4.57 (rounded to 2 decimal places)
SELECT ROUND(123.456, -1);  -- Result: 120 (rounded to the nearest 10)
*/
				
# 1st method by using CTE method
WITH CTE AS (
    SELECT ROUND(AVG(Salary)) AS Actual_avg, 
           ROUND(AVG(REPLACE(Salary, '0', ''))) AS Miss_avg
    FROM EMPLOYEES
)
SELECT ROUND(Actual_avg - Miss_avg) AS ans
FROM CTE;

#2nd method by using subquery
SELECT ROUND(Actual_avg - Miss_avg) AS ans
FROM (SELECT ROUND(AVG(Salary)) AS Actual_avg, 
			 ROUND(AVG(REPLACE(Salary, '0', ''))) AS Miss_avg
    FROM EMPLOYEES
) AS Subquery;


# 3rd method using regex
SELECT 
    CEIL(AVG(salary) - (
        SELECT AVG(REGEXP_REPLACE(salary, '[*0]', '')) AS mis
        FROM employees
    )) AS result
FROM employees;


# 4th method simple select
SELECT CEIL(AVG(SALARY)-AVG(REPLACE(SALARY,'0',''))) FROM EMPLOYEES;

-- Datatypes more seriously
SELECT CEILING(AVG(SALARY) - AVG(CAST(REPLACE(CAST(SALARY AS CHAR), '0', '') AS DECIMAL))) FROM EMPLOYEES;
-- OR
SELECT CEIL(AVG(SALARY) - AVG(CAST(REPLACE(CAST(SALARY AS CHAR), '0', '') AS DECIMAL))) FROM EMPLOYEES;

-- There's no significant difference between CEIL() and CEILING() are essentially synonyms, Both takes a numeric value as an argument and
--  return the smallest integer that is greater than or equal to that value.

SELECT CEIL(4.3) AS using_ceil;
-- Output: 5

SELECT CEILING(4.3) AS using_ceiling;
-- Output: 5

# Or Also can be use CONVERT
SELECT CEIL(AVG(Salary) - AVG(CONVERT(REPLACE(CONVERT(Salary, char), "0", ""), DECIMAL)))
FROM EMPLOYEES;

/* * Similar to the CAST() CONVERT() function is also used to convert a value from one data type to another. 
 Genral Syntax:-
				CONVERT(expression, target_data_type)
Example:-
		SELECT CONVERT(42, CHAR);  -- Converts the number 42 to the string '42'

* it can be also useful when dealing with multilingual data.
Example:-
		SELECT CONVERT('Hello', CHAR CHARACTER SET utf8);  -- Converts to UTF-8 character set
*/

/* CAST:- CAST() function is used to explicitly convert a value from one data type to another
   But Cast is more portability across different database systems So it would be better to use CAST 
   
   General syntax:- CAST(expression AS target_data_type)

Example1:- SELECT CAST(42 AS CHAR);  -- Converts the number 42 to the string '42'
Example2:- SELECT CAST(NOW() AS CHAR);  -- Converts the current date and time to a string
*/

/******************************************************************/
/********************* (33 Top Earners) **************************/

-- Every derived table must have its own alias so don't forgot to mention it's alias
-- WHERE total_earning = (select earning from Employee) better to use "IN" such types of solution bcz where has single value and subquery has multiple row
-- Subquery returns more than 1 row

/* GROUP_CONCAT function :-  An aggregate function that is used to concatenate the values of a specified column for each group in a result set.
 It's primarily used in combination with the GROUP BY clause to concatenate values from multiple rows into a single string within each group.
 
  basic syntax:-
				GROUP_CONCAT([DISTINCT] expression [ORDER BY sorting] [SEPARATOR separator])

DISTINCT (optional): Specifies that only distinct values should be concatenated.
expression: The column or expression you want to concatenate.
ORDER BY sorting (optional): Specifies the order in which values are concatenated within each group.
SEPARATOR separator (optional): Defines the separator that should be used between concatenated values. The default separator is a comma (,).

EAXMPLE:- 
		SELECT CustomerID, GROUP_CONCAT(Product) AS PurchasedProducts
		FROM Orders
		GROUP BY CustomerID;
        
Result would be like:-
+------------+------------------+
| CustomerID | PurchasedProducts|
+------------+------------------+
| 1          | Product A,Product B |
| 2          | Product C         |
| 3          | Product A,Product C |
+------------+------------------+

*/

# 1st method by Using simple aggregate function
SELECT MAX(salary*months), COUNT(name)
FROM Employee
GROUP BY salary*months DESC
LIMIT 1;

# 2nd method by using subquery method
SELECT max_salary, num_max_earner 
FROM(
    SELECT MAX(salary * months) AS max_salary, COUNT(name) AS num_max_earner
    FROM Employee
    GROUP BY salary, months
    ORDER BY max_salary DESC
    LIMIT 1) AS Subquerry;
    
#3rd method by using CTE method
WITH Top_Earner AS (
    SELECT MAX(salary * months) AS max_salary, COUNT(name) AS num_max_earner
    FROM Employee
    GROUP BY salary, months
    ORDER BY max_salary DESC
    LIMIT 1
)
SELECT max_salary, num_max_earner 
FROM Top_Earner;


/******************************************************************/
/************ 34 (Weather Observation Station 2)******************/
SELECT ROUND(SUM(LAT_N), 2), ROUND(SUM(LONG_W), 2)
FROM STATION;

/******************************************************************/
/*********** 35 (Weather Observation Station 13) *****************/
# 1st method By simple using select statment with > & <
SELECT ROUND(SUM(LAT_N), 4)
FROM STATION
WHERE LAT_N > 38.7880 AND LAT_N < 137.2345;

# 2nd method using between 
SELECT ROUND(SUM(LAT_N), 4)
FROM STATION
WHERE LAT_N BETWEEN  38.7880 AND 137.2345;

/******************************************************************/
/*********** 36 (Weather Observation Station 14) *****************/
SELECT ROUND(MAX(LAT_N),4)
FROM STATION
WHERE LAT_N < 137.2345;


/******************************************************************/
/*********** 37 (Weather Observation Station 15) *****************/
-- from err for joining or combining result from multiple cte you can simply list both CTE names in the FROM clause, separated by a comma.
--  If you're using an aggregate function like MAX,MIN Usually need to include a GROUP BY
# 1st method by using CTE
WITH CTE AS (
    SELECT MAX(LAT_N) AS max_lat_n
    FROM STATION
    WHERE LAT_N < 137.2345
    ORDER BY LAT_N DESC
)
SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (SELECT max_lat_n FROM CTE);

# SECOND METHOD BY USING subquery
SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (
    SELECT MAX(LAT_N)
    FROM STATION
    WHERE LAT_N < 137.2345
);

/******************************************************************/
/*********** 38 (Weather Observation Station 16) *****************/
SELECT ROUND(MIN(LAT_N), 4)
FROM STATION
WHERE LAT_N > 38.7780;

/******************************************************************/
/*********** 39 (Weather Observation Station 17) *****************/
# 1ST METHOD BY USING SUBQUERY
SELECT ROUND((LONG_W),4)
FROM STATION
WHERE LAT_N = (SELECT MIN(LAT_N)
               FROM STATION
               WHERE LAT_N > 38.7780);
               
# 2ND METHOD BY USING CTE
WITH MIN_LAT AS (
    SELECT MIN(LAT_N) AS MIN_LAT_N
    FROM STATION
    WHERE LAT_N > 38.7780
)
SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (SELECT MIN_LAT_N FROM MIN_LAT);


/******************************************************************/
/*********** 40 (Weather Observation Station 18) *****************/
# 1st method by using subquery method
SELECT (ABS(a-c)+ABS(b-d)) AS Manhattan_distance
FROM (SELECT ROUND(MIN(LAT_N),4) AS a,
             ROUND(MIN(LONG_W),4) AS b,
             ROUND(MAX(LONG_W),4) AS C,
             ROUND(MAX(LAT_N),4) AS d
FROM STATION) AS Subquery;

# 2ND METHOD BY USING CTE
WITH CTE AS (SELECT ROUND(MIN(LAT_N),4) AS a,
             ROUND(MIN(LONG_W),4) AS b,
             ROUND(MAX(LONG_W),4) AS C,
             ROUND(MAX(LAT_N),4) AS d
             FROM STATION
)
SELECT (ABS(a-c)+ABS(b-d)) AS Manhattan_distance
FROM CTE;

/******************************************************************/
/*********** 41 (Weather Observation Station 19) *****************/
-- n MySQL, the double asterisk ** is not used for exponentiation as it is in Python. 
-- Instead, MySQL uses the POW() function to perform exponentiation
# 1ST METHOD By using subquery
SELECT ROUND(SQRT(POWER((D - a),2) + (POWER((c - b),2))),4) AS Eucl_distance
FROM (SELECT ROUND(MIN(LAT_N),4) AS a,
             ROUND(MIN(LONG_W),4) AS b,
             ROUND(MAX(LONG_W),4) AS C,
             ROUND(MAX(LAT_N),4) AS d
FROM STATION) AS Subquery;

# 2nd method by simple using select method
SELECT ROUND(SQRT(POW(MAX(LAT_N) - MIN(LAT_N), 2) +
                  POW(MAX(LONG_W) - MIN(LONG_W), 2)), 4) FROM Station;

/******************************************************************/
/*********** 42 (Weather Observation Station 20) *****************/
-- For any particule value where clasue like do i do with loc in pandas 
-- If Dataset has an even number of values, the median is the average of the two middle values.

/* Given Table is like this (SELECT * FROM STATION LIMIT 10):-
794 Kissee Mills MO 139.65036520 73.41609884
824 Loma Mar CA 48.69788572 130.53935410
603 Sandy Hook CT 72.33748014 148.24007690
478 Tipton IN 33.54792701 97.94286036
619 Arlington CO 75.17993079 92.94615894
711 Turner AR 50.24380534 101.45801630
...
...
*/
/*
SELECT LAT_N, ROW_NUMBER() OVER (ORDER BY LAT_N) AS ROWNUM,
COUNT(*) OVER () AS TOTAL_COUNT
FROM STATION
LIMIT 10

# As we know  ROW_NUMBER() window function to assign a unique row number to each row in the result set.
# and COUNT(*) window function to count the total number of rows in the entire STATION table.
# The OVER () clause specifies that the calculation is done over the entire result set without any specific partitioning or ordering.  

-- Result would be like
25.07352606 1 499
25.40836031 2 499
25.41948948 3 499
27.21713791 4 499
27.25445814 5 499
27.28675141 6 499
27.31872893 7 499
27.34698627 8 499
27.67194236 9 499
27.98898068 10 499

# you can also perform count(*) function on specfic result sets
like :-

SELECT LAT_N, ROW_NUMBER() OVER (ORDER BY LAT_N) AS ROWNUM,
COUNT(*) OVER (Partition by state) AS TOTAL_COUNT
FROM STATION

Then result would be like thid :-
103.19952640 324 2
120.29166660 402 2
119.56071050 397 19
140.29582830 477 19
40.77104358 61 19
45.66018469 75 19
49.93703023 94 19
...
...
...
Here's COUNT(*) function:- calculates the count of rows for each state present in the STATION table. 
-- the PARTITION BY state clause partitions the data into separate groups based on the distinct values in the state column.
-- For each row, this count will represent the total count of rows that share the same state value.
So, For each row in the result set, the TOTAL_COUNT will display the count of rows that belong to the same state as the current row.
 This count is calculated separately for each state due to the PARTITION BY clause.


SELECT LAT_N, ROW_NUMBER() OVER (Partition by state order by LAT_N) AS ROWNUM
FROM STATION

Result would be like this:-

103.19952640 1
120.29166660 2
27.34698627 1
40.77104358 2
45.66018469 3
49.93703023 4
53.32457298 5
...
...

*/
#1st method by IF TOTAL COUNT of row is odd as we checked by count(*) that is odd So
SELECT ROUND(LAT_N, 4) FROM (
    SELECT LAT_N, ROW_NUMBER() OVER (ORDER BY LAT_N) AS ROWNUM,
    COUNT(*) OVER () AS TOTAL_COUNT
    FROM STATION
) RANKED
WHERE ROWNUM = (TOTAL_COUNT + 1) / 2;

# OR this also works
SELECT ROUND(LAT_N, 4)
FROM (
    SELECT LAT_N, ROW_NUMBER() OVER (ORDER BY LAT_N) AS ROWNUM,
    COUNT(*) OVER () AS TOTAL_COUNT
    FROM STATION
) AS RANKED
WHERE ROWNUM IN ((TOTAL_COUNT + 1) / 2, (TOTAL_COUNT + 2) / 2 ;


/************************************************/
/****************** Basic Join *****************/
/**********************************************/

/******************************************************************/
/***************** 43 (Population Census) ************************/
SELECT SUM(C.Population) AS Sum_of_population
FROM CITY AS C
JOIN COUNTRY AS CTR
    ON C.CountryCode = CTR.CODE
WHERE CTR.CONTINENT = 'Asia';


/******************************************************************/
/******************* 44 (African Cities) *************************/
SELECT C.Name
FROM CITY C
JOIN COUNTRY CNT
    ON C.CountryCode = CNT.Code
WHERE CNT.CONTINENT = 'Africa';

/******************************************************************/
/********* 45 (Average Population of Each Continent) *************/
SELECT CTR.Continent, FLOOR(AVG(C.POPULATION))
FROM CITY C
JOIN COUNTRY CTR
    ON C.CountryCode = CTR.CODE
GROUP BY CTR.Continent;



/**********************************************************************/
/************************ 46 (The Report) ****************************/

# We can join with comparison operator also like between,AND,OR...
-- Example (JOIN Grades G ON S.marks BETWEEN G.min_mark AND G.max_mark)
-- to view the execution plan of a query. Simply prepend your query with EXPLAIN and execute it. For example:
/* EXPLAIN SELECT * FROM Students WHERE grades = 8; */

/* We can directly pull multiple table column
Example:- SELECT * FROM Students
19 Samantha 87
21 Julia 96
...

SELECT * ROM Grades
1 0 9
2 10 19
...

SELECT *
FROM Students, Grades
91 Vivek 84 1 0 9
76 Amina 89 1 0 9
......

-- For better ot manipulate column use alias

*/

-- 1st method Simply Using Select and Case Clause
SELECT
    CASE
        WHEN G.grade >= 8 THEN CONCAT(S.name, ' ', G.grade, ' ', S.marks)
        WHEN G.grade < 8 THEN CONCAT('NULL', ' ', G.grade, ' ', S.marks)
    END AS Students
FROM Students S
JOIN Grades G ON S.marks BETWEEN G.min_mark AND G.max_mark
ORDER BY G.grade DESC, S.name;

# Or Also This
SELECT s.Name, g.Grade, s.Marks
FROM Students s
JOIN Grades g
ON s.Marks BETWEEN g.Min_Mark AND g.Max_Mark
WHERE g.Grade > 7
ORDER BY g.Grade DESC, s.Name;

SELECT NULL, g.Grade, s.Marks
FROM Students s
JOIN Grades g
ON s.Marks BETWEEN g.Min_Mark AND g.Max_Mark
WHERE g.Grade < 8
ORDER BY g.Grade DESC, s.Name;

#Or also can reduce two time Order by clause 
-- In a UNION, the ORDER BY clause should be applied after the entire UNION operation.
SELECT s.Name, g.Grade, s.Marks
FROM Students s
JOIN Grades g
ON s.Marks BETWEEN g.Min_Mark AND g.Max_Mark
WHERE g.Grade > 7
UNION
SELECT NULL, g.Grade, s.Marks
FROM Students s
JOIN Grades g
ON s.Marks BETWEEN g.Min_Mark AND g.Max_Mark
WHERE g.Grade < 8
ORDER BY Grade DESC, Name ASC;


-- 2nd Method By Using Subquery 
SELECT 
    CASE WHEN Grad < 8 THEN "NULL" ELSE Nam END AS NAME,
    Grad,
    Mark
FROM  
    (SELECT S.Name as Nam, G.Grade as Grad, S.Marks as Mark
    FROM Students S
    JOIN Grades G
        ON S.Marks BETWEEN G.MIN_Mark AND G.Max_Mark
    ORDER BY Grad DESC
) AS Subquery  
ORDER BY Grad DESC, Nam ASC;


# More Cleaner By Just Directly Using Subquery AS Allias Instead Of Defining Allias In Inner Query
SELECT 
    CASE WHEN Sub.Grade < 8 THEN "NULL" ELSE Sub.Name END AS NAME,
    Sub.Grade,
    Sub.Marks
FROM  
    (SELECT S.Name, G.Grade, S.Marks 
    FROM Students S
    JOIN Grades G
        ON S.Marks BETWEEN G.MIN_Mark AND G.Max_Mark
    ORDER BY G.Grade DESC 
) AS Sub 
ORDER BY Sub.Grade DESC, Sub.Name ASC;


# 3rd method By using CTE
WITH Sub AS (SELECT S.Name, G.Grade, S.Marks 
    FROM Students S
    JOIN Grades G
        ON S.Marks BETWEEN G.MIN_Mark AND G.Max_Mark
    ORDER BY G.Grade DESC 
)
SELECT 
    CASE WHEN Sub.Grade < 8 THEN "NULL" ELSE Sub.Name END AS NAME,
    Sub.Grade,
    Sub.Marks
FROM Sub
ORDER BY Sub.Grade DESC, Sub.Name ASC;

# 4th method By using If statement
SELECT IF(S.marks > 70, S.name, "NULL") Name, G.grade,S.marks
FROM Students S
JOIN Grades G
    ON students.marks BETWEEN G.Min_Mark AND G.Max_Mark
ORDER BY G.Grade DESC, S.name ASC, S.marks ASC;


# Or Also simply Using IF clause without JOIN
SELECT IF(G.Grade < 8, NULL, S.Name) Name, G.Grade, S.Marks
FROM Students S, Grades G
WHERE S.Marks BETWEEN G.Min_Mark AND G.Max_Mark
ORDER BY G.Grade DESC, S.Name ASC,S.Marks;


# 5th method By using Pure Case Clause w (But Join is efficient compare to using case as you can see explain)
SELECT Name, Grade, Marks
FROM (
    SELECT
        CASE
            WHEN Marks >= 70 THEN Name
            ELSE NULL
        END AS Name,
        CASE 
            WHEN Marks < 100 THEN (FLOOR(Marks / 10) + 1)
            WHEN MARKS = 100 THEN 10
        END AS Grade,
        Marks
    FROM Students
) AS SUBQUERY
ORDER BY Grade DESC, NAME ASC;

# Or Simple by creating a custom column
SELECT
    CASE WHEN Marks < 70 THEN NULL ELSE Name END AS Name,
    CASE 
        WHEN Marks BETWEEN 70 AND 79 THEN 8 
        WHEN Marks BETWEEN 80 AND 89 THEN 9 
        WHEN Marks BETWEEN 90 AND 100 THEN 10 
        WHEN Marks BETWEEN 60 AND 69 THEN 7 
        WHEN Marks BETWEEN 50 AND 59 THEN 6 
        WHEN Marks BETWEEN 40 AND 49 THEN 5 
        WHEN Marks BETWEEN 30 AND 39 THEN 4 
        WHEN Marks BETWEEN 20 AND 29 THEN 3 
        WHEN Marks BETWEEN 10 AND 19 THEN 2 
        WHEN Marks BETWEEN 0 AND 9 THEN 1 
    END AS Grade, 
    Marks 
FROM Students 
ORDER BY Grade DESC, Name;


# But More simply and efficient
SELECT 
 CASE WHEN g.Grade >7 THEN s.Name ELSE NULL END as Name,
    g.Grade,
    s.Marks
FROM Students s, Grades g
WHERE s.Marks BETWEEN (g.Min_Mark) and (g.Max_Mark)
ORDER BY g.Grade DESC, s.Name;


# 6th method Using Cross Join
SELECT 
    CASE WHEN g.grade <8 THEN NULL ELSE s.name END,
    g.grade,
    s.marks
FROM Students S
CROSS JOIN Grades AS g
WHERE s.marks BETWEEN g.min_mark AND g.max_mark
ORDER BY g.grade DESC,s.name  ASC;
    
    
# Can't getting question just Do it
-- Create temp_students table with grade column
CREATE TABLE temp_students AS
SELECT *, NULL AS Grade
FROM students;

-- Set grade based on mark
UPDATE temp_students
SET Grade = 
    CASE 
        WHEN Marks >= 0 AND Marks <= 9 THEN 1
        WHEN Marks >= 10 AND Marks <= 19 THEN 2
        WHEN Marks >= 20 AND Marks <= 29 THEN 3
        WHEN Marks >= 30 AND Marks <= 39 THEN 4
        WHEN Marks >= 40 AND Marks <= 49 THEN 5
        WHEN Marks >= 50 AND Marks <= 59 THEN 6
        WHEN Marks >= 60 AND Marks <= 69 THEN 7
        WHEN Marks >= 70 AND Marks <= 79 THEN 8
        WHEN Marks >= 80 AND Marks <= 89 THEN 9
        ELSE 10
    END;

-- Update Name to NULL if Grade < 8
UPDATE temp_students
SET Name = NULL
WHERE Grade < 8;

-- Display results
SELECT NAME, GRADE, MARKS
FROM temp_students
ORDER BY Grade DESC, Name ASC;


/**********************************************************************/
/********************** 47 (Top Competitors) *************************/
# Misunderstood takeaway COUNT takes 1 and should be bigger than 1? COUNT(1) > 1
# COUNT(1) means COUNT from column 1 which is h.hacker_id, and 2 would be h.name
# Similar to order by 1,2 meaning sort first by 1 and remaining unsorted data sort by 2   


/* 
The D.SCORE has the MAX score value that a hacker can possible achieve per difficulty_level.
The S.SCORE is the actual score achieved by the hacker in that submission.
So, by comparing S.SCORE=D.SCORE you are MATCHING the score that the hacker achieved with the MAX score possible.
As requested by the exercise this will return the ones who achieved the MAX SCORE in that submission,
and exclude every hacker who didn't. And later to be filtered by the ones who got 2 or more max scores.
*/
-- The score value in the difficulty_level table is full score only

SELECT h.hacker_id, name
FROM Hackers h
JOIN Submissions s USING (hacker_id)
JOIN Challenges c USING (challenge_id)
JOIN Difficulty d USING (difficulty_level)
WHERE d.score=s.score #
GROUP BY 1,2 # Group column wise respectively
HAVING COUNT(*)>1 #It's count acroos grouped set of row not on whole row
ORDER BY COUNT(*) DESC, h.hacker_id ASC;

# 1st method By using Subquery
SELECT hacker_id, name FROM (
    SELECT H.hacker_id, name, COUNT(challenge_id) AS ct
    FROM Submissions AS S
    LEFT JOIN Hackers AS H USING (hacker_id)
    LEFT JOIN Challenges AS C USING (challenge_id)
    LEFT JOIN Difficulty AS D USING (difficulty_level)
    WHERE S.score = D.score
    GROUP BY H.hacker_id, name HAVING ct > 1
    ORDER BY ct DESC, H.hacker_id ASC
) AS rankings;


# 2nd method
SELECT h.hacker_id, h.name
    FROM submissions s
    JOIN challenges c
        ON s.challenge_id = c.challenge_id
    JOIN difficulty d
        ON c.difficulty_level = d.difficulty_level 
    JOIN hackers h
        ON s.hacker_id = h.hacker_id
    WHERE s.score = d.score 
        AND c.difficulty_level = d.difficulty_level
    GROUP BY h.hacker_id
        HAVING COUNT(s.hacker_id) > 1
    ORDER BY COUNT(s.hacker_id) DESC, s.hacker_id ASC;


# 3rd  method
SELECT H.hacker_id, name
FROM Hackers H
LEFT JOIN Submissions S USING (hacker_id)
LEFT JOIN Challenges C USING (challenge_id)
LEFT JOIN Difficulty D USING (difficulty_level)
GROUP BY h.hacker_id, name
-- GROUP BY 1,2
HAVING SUM(d.score = s.score) > 1
ORDER BY SUM(d.score = s.score) DESC, h.hacker_id;

# 3rd method
SELECT h.hacker_id, h.name
FROM Hackers h
JOIN Submissions s USING(hacker_id)  
JOIN Challenges c USING(challenge_id)
JOIN Difficulty d USING(difficulty_level)
WHERE s.score = d.score
GROUP BY h.hacker_id, h.name
HAVING COUNT(*) > 1 #Note;- it gonna count account grouped set of row not on directly on all row 
ORDER BY COUNT(*) DESC, h.hacker_id;

/*
The HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.
 An aggregate function in SQL performs a calculation on multiple values and returns a single value.
 HAVING is used after GROUP BY ; WHERE is used before GROUP BY
*/


/**********************************************************************/
/****************** 48 (Ollivander's Inventory) **********************/
# In join table if column is unique across all table, Good to be not use alias during selecting column

# 1st method simple using SELECT METHOD
SELECT ID, AGE, COINS_NEEDED, W.POWER
FROM Wands W
JOIN Wands_Property P
	ON W.code = P.code
WHERE P.is_evil = 0 AND COINS_NEEDED = (SELECT MIN(COINS_NEEDED) FROM Wands WHERE CODE = W.CODE AND POWER = W.POWER)
ORDER BY POWER DESC, AGE DESC;


select id, age, coins_needed, w.power
from Wands as w
join Wands_Property as p
	on w.code = p.code
where p.is_evil = 0 and coins_needed = (select min(coins_needed) from Wands where code=w.code and power=w.power)
-- where p.is_evil = 0 and coins_needed  = (select min(coins_needed) from wands i where i.code = w.code and i.power = w.power)
order by power DESC, age DESC;

# Or also we can simply define all in where clause directly
select id, age, coins_needed, power 
from wands as w
join Wands_Property as wp
on w.code = wp.code
where (age, power, coins_needed) in 
            (select age, power, min(coins_needed)
            from wands as w
            join Wands_Property as wp
            on w.code = wp.code
            where wp.is_evil = 0
            group by age, power)
order by power desc, age desc;

# 2nd method by using Subquery method
SELECT w.id ,sub.age, sub.coin, sub.power
FROM (SELECT w.code, wp.age, w.power, min(w.coins_needed) coin
     FROM wands_property wp
     JOIN wands w
		ON w.code=wp.code
     WHERE wp.is_evil=0
     GROUP BY wp.age,w.power,w.code
    )sub JOIN wands w
ON w.code=sub.code AND w.coins_needed = sub.coin
ORDER BY sub.power DESC,sub.age DESC

-- SELECT W.ID, WP.AGE, MIN(W.COINS_NEEDED) AS MIN_COINS_NEEDED, W.POWER
-- FROM Wands AS W
-- JOIN Wands_Property AS WP ON W.code = WP.code
-- GROUP BY W.ID, WP.AGE, W.POWER
-- HAVING COUNT(W.POWER) > 1
-- ORDER BY W.POWER DESC, WP.AGE DESC
;

# 3rd method by using CTE method
with ranked_wands as (
	select id, age, coins_needed, power,
	rank() over(partition by age, power order by coins_needed) as ranked
	from wands w
	join wands_property p
		on w.code = p.code
where is_evil=0)
select id, age, coins_needed, power from ranked_wands
where ranked = 1
order by power desc, age desc;



/**********************************************************************/
/************************* 49 (Challenges) ***************************/
WITH CTE AS (SELECT H.hacker_id,
			H.name, 
			COUNT(c.hacker_id) AS num 
FROM Hackers H
JOIN Challenges C
    ON H.hacker_id = C.hacker_id
GROUP BY H.hacker_id, H.name
ORDER BY num DESC, H.hacker_id)
SELECT * FROM CTE 
WHERE num = (SELECT MAX(num) FROM CTE) OR num in (SELECT num FROM CTE GROUP BY num HAVING COUNT(num) = 1) ;


# 2nd method by using Natural JOIN
WITH CTE AS (
    SELECT hacker_id, name, COUNT(challenge_id) AS num_ch
    FROM Hackers
    NATURAL JOIN Challenges
    GROUP BY hacker_id, name
    ORDER BY num_ch DESC, hacker_id ASC
)
SELECT hacker_id, name, num_ch
FROM CTE AS O
WHERE O.num_ch = (SELECT MAX(I.num_ch) FROM CTE AS I)
   OR 1 = (SELECT COUNT(*) FROM CTE AS I WHERE I.num_ch = O.num_ch);


# We can also interpreate by challenge_id count instead of c.hacker_id
WITH CTE AS (
    SELECT h.hacker_id AS h_id, h.name AS h_name, COUNT(c.challenge_id) AS no_cs
    FROM Hackers AS h
    JOIN Challenges AS c 
    ON h.hacker_id = c.hacker_id
    GROUP BY h.hacker_id, h.name
    ORDER BY COUNT(c.challenge_id) DESC, h.hacker_id ASC
)
SELECT h_id, h_name, no_cs 
FROM CTE
WHERE no_cs IN (
    SELECT no_cs FROM CTE 
    GROUP BY no_cs 
    HAVING COUNT(no_cs) = 1 OR no_cs = (SELECT MAX(no_cs) FROM CTE)
);

/**********************************************************************/
/********************* 50 (Contest Leaderboard) **********************/

-- We can not use allias for aggregating within query 
-- if you already using an aggregate function, not need to specify group by H.hacker_id.

# 1st method By using Subquery method
SELECT Max_score.Hacker_id, name, SUM(score) AS total_score
FROM (SELECT H.hacker_id, name, challenge_id, MAX(score) as score
      FROM Hackers H join Submissions S ON H.hacker_id = S.hacker_id
      GROUP BY H.hacker_id, name, challenge_id
      HAVING(score)<>0 -- or HAVING(score) != 0 
     ) AS Max_score
GROUP BY Max_score.Hacker_id, name
ORDER BY total_score DESC, Max_score.Hacker_id;

# 2nd method by using CTE
WITH CTE AS (
    SELECT H.hacker_id, name, challenge_id, MAX(score) AS score
    FROM Hackers H
    JOIN Submissions S ON H.hacker_id = S.hacker_id
    GROUP BY H.hacker_id, name, challenge_id
    HAVING MAX(score) <> 0
)
SELECT C.hacker_id, C.name, SUM(C.score) AS total_score
FROM CTE C
GROUP BY C.hacker_id, C.name
ORDER BY total_score DESC, C.hacker_id ASC;


# 3nd method using row_number and makes sorted by desc for getting highest value
WITH cte AS (
    SELECT h.hacker_id, h.name, s.challenge_id, s.score,
        ROW_NUMBER() OVER(PARTITION BY h.hacker_id, s.challenge_id ORDER BY s.score DESC, h.hacker_id) AS row_num -- for all over coverage
    FROM hackers h
    JOIN submissions s ON h.hacker_id = s.hacker_id
)
SELECT hacker_id, name, SUM(score) AS total_score
FROM cte
WHERE row_num = 1
GROUP BY name, hacker_id
HAVING SUM(score) <> 0
ORDER BY total_score DESC, hacker_id;

# Or Also If Obejective Clear
WITH CTE AS (
    SELECT h.hacker_id AS hacker_id, h.name AS name, s.challenge_id, MAX(score) AS max_score
    FROM hackers AS h
    INNER JOIN submissions AS s ON h.hacker_id = s.hacker_id
    GROUP BY h.hacker_id, h.name, s.challenge_id
)
SELECT hacker_id, name, SUM(max_score) AS total_score
FROM CTE
GROUP BY hacker_id, name
HAVING SUM(max_score) > 0
ORDER BY total_score DESC, hacker_id ASC;




/************************************************/
/**************** Advanced Join ****************/
/**********************************************/

/***********************************************************/
/********** Question 51 (SQL Project Planning) ************/
# Aggr funct like MIN(), max() when wrok with group then returns corresponding value in a "set of rows" values not in whole row.
# DATEDIFF(end_date, start_date) for  used to calculate the difference between two dates 
# OR may be some time DATEDIFF(day, end_date, start_date) where day is just specifies that the difference should be calculated in terms of days.
# Noted:-CTEs are only available within the scope of the query in which they are defined. They are temporary and do not persist like regular tables or columns in the database.



# 1st  Using Subquery Method
SELECT Start_Date, Min(End_Date)
FROM 
 (SELECT Start_Date FROM Projects WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)) AS A,
 (SELECT End_Date FROM Projects WHERE End_Date NOT IN (SELECT Start_Date FROM Projects)) AS B
WHERE Start_Date < End_Date
GROUP BY Start_Date
ORDER BY DATEDIFF(MIN(End_Date), Start_Date) ASC, Start_Date ASC;


# 2nd Method By Creating Two Derived Tables And Join Them
SELECT PrStart.Start_Date, PrEnd.End_Date
FROM (SELECT
      Start_Date,
      Row_Number() OVER (ORDER BY Start_Date ASC) AS ROW_NUM
      FROM Projects
      WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)
) AS PrStart
JOIN (SELECT
     End_Date,
     Row_Number() OVER (ORDER BY END_Date ASC) AS ROW_NUM
     FROM Projects
     WHERE END_Date NOT IN (SELECT Start_Date From Projects)
) AS PrEnd 
ON PrStart.ROW_NUM = PrEnd.ROW_NUM
ORDER BY DATEDIFF(PrEND.End_Date, PrStart.Start_Date) ASC, PrStart.Start_Date ASC;

# 3rd Method By using CTE AND JOIN METHOD
WITH S_DATES AS (SELECT Start_Date, ROW_NUMBER() OVER(ORDER BY Start_Date) RN_A
    from projects   
    WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)
	),E_DATES AS
    (SELECT End_Date, ROW_NUMBER() OVER(ORDER BY End_Date) RN_B 
	FROM Projects
	WHERE End_Date NOT IN (SELECT Start_Date FROM Projects)
)
SELECT Start_Date, End_Date 
FROM S_DATES S
JOIN E_DATES E
	ON S.RN_A = E.RN_B
ORDER BY (End_Date -Start_Date) ASC, Start_Date;
   
# OR also this 
WITH CTE AS (
    SELECT *, ROW_NUMBER() OVER (ORDER BY End_date) - 1 AS rn
    FROM Projects
)
SELECT MIN(Start_date), MAX(End_date)
FROM (SELECT Start_date,
			 End_date,
             DATE_SUB(End_date, INTERVAL rn DAY) AS Grp_day
    FROM CTE) AS TEMP
GROUP BY Grp_day
ORDER BY (MAX(End_date) - MIN(Start_date)), MIN(Start_date);


# 4TH Method Usind ADDDATE and INTERVAL method
SELECT MIN(Start_Date), MAX(End_Date)
FROM ( SELECT 
		Start_Date,
		End_DATE,
		ADDDATE(Start_Date, INTERVAL) - (ROW_NUMBER() OVER (ORDER BY Start_Date)- 1) Day) AS Project_Group
		FROM Projects
    ) AS TEMP
GROUP BY Project_Group
ORDER BY COUNT(*) ASC; 

 -- ADDDATE function is used to add a specific number of days to a date.
 /* Genaral syntax:-
					ADDDATE(date, INTERVAL value unit)
date: The initial date to which you want to add the interval.
value: The number of units (days, months, years, etc.) you want to add.
unit: The unit of time you want to add (e.g., DAY, MONTH, YEAR, etc.).

(Example )
Adding days to a date:-
                SELECT ADDDATE('2023-08-13', INTERVAL 7 DAY); -- Adds 7 days to the date

Adding months to a date:-
				SELECT ADDDATE('2023-08-13', INTERVAL 3 MONTH); -- Adds 3 months to the date
                
Adding years to a date:-
				SELECT ADDDATE('2023-08-13', INTERVAL 2 YEAR); -- Adds 2 years to the date

Notable :-  Negative values can be used to subtract time intervals as well:
				SELECT ADDDATE('2023-08-13', INTERVAL -10 DAY); -- Subtracts 10 days from the date

Often used to perform date arithmetic by adding a certain number of days to a given date value.
 */
 
# 5TH METHOD  By selecting all column and method Using DAY , INTERVAL
SELECT MIN(Start_Date) AS Min_Start_Date, MAX(END_Date)
FROM (SELECT *,
      Row_Number() OVER (ORDER BY Start_Date) AS SeqNum
      FROM Projects AS Pr
      ) Projects 
GROUP BY Start_Date - INTERVAL SeqNum DAY
ORDER BY DATEDIFF(MAX(END_DATE), MIN(Start_Date)), Min_Start_Date;


# 6TH METHOD USING CTE WITH ROW_NUMBER, DATEADD and DAY METHOD
WITH CTE AS (
			SELECT *, DATEADD(DAY, - ROW_NUMBER() OVER(ORDER BY END_DATE), END_DATE) AS RN
			FROM PROJECTS)
SELECT MIN(START_DATE), MAX(END_DATE)
FROM CTE
GROUP BY RN
ORDER BY COUNT(*), MIN(START_DATE);

#OR also
# 4th method By using CTE Method
WITH START_DATE_CTE AS (
        SELECT P1.START_DATE, 
        ROW_NUMBER() OVER (ORDER BY P1.START_DATE) AS R1
        FROM PROJECTS P1 
        LEFT JOIN PROJECTS P2 ON P1.START_DATE = P2.END_DATE
        WHERE P2.END_DATE IS NULL
                        ),
    END_DATE_CTE AS (
        SELECT P2.END_DATE,
        ROW_NUMBER() OVER (ORDER BY P2.END_DATE) AS R2
        FROM PROJECTS P1 
        RIGHT JOIN PROJECTS P2 ON P1.START_DATE = P2.END_DATE
        WHERE P1.START_DATE IS NULL
                    )
SELECT START_DATE, END_DATE 
FROM START_DATE_CTE 
JOIN END_DATE_CTE ON START_DATE_CTE.R1 = END_DATE_CTE.R2
ORDER BY DATEDIFF(END_DATE,START_DATE),START_DATE;


#  7TH METHOD USING SELFJOIN WITH CTE
WITH CTE AS (
   SELECT *, ROW_NUMBER() OVER(ORDER BY Start_Date) AS id
    FROM Projects)
SELECT P1.Start_Date SD,  min(p2.End_Date) ED
FROM CTE P1
JOIN CTE P2
WHERE P1.Start_Date NOT IN (select End_Date FROM Projects) 
    AND P2.End_Date NOT IN (select Start_Date FROM Projects) 
    AND P1.Start_Date < P2.End_Date
    GROUP BY P1.Start_Date
    ORDER BY MIN(P2.id - P1.id);


# 8th method
WITH CTE AS (
	SELECT *,
    DATEADD(DAY, - ROW_NUMBER() OVER(ORDER BY END_DATE), END_DATE) AS RN
	FROM PROJECTS)
SELECT MIN(START_DATE), MAX(END_DATE)
FROM CTE
GROUP BY RN
ORDER BY COUNT(*), MIN(START_DATE);


/* The idea is to use the row_number to substract from the end_date sunch that all task that are 1 day appard will endup having same end_date.
 Then use this new end_date to group the projects to find number of days */

# 9th method with subquerry Row_number()
SELECT t1.start_date, t2.end_date
FROM
    ( -- Only real start_date
    SELECT start_date, ROW_NUMBER() OVER(ORDER BY start_date ASC) rn
    FROM PROJECTS 
    WHERE start_date NOT IN (SELECT end_date FROM PROJECTS)
    ) t1 JOIN 
    ( -- Only real end_date : This is kinda filter 'completed' projects
    SELECT end_date, ROW_NUMBER() OVER(ORDER BY start_date ASC) rn
    FROM PROJECTS 
    WHERE end_date NOT IN (SELECT start_date FROM PROJECTS)
    ) t2 ON t1.rn = t2.rn -- If we plus `AND t1.start_date < t2.end_date` would be more correct.
ORDER BY DATEDIFF(t2.end_date, t1.start_date) ASC, 1 ASC;


# 10th method  with subquerry Row_number()
WITH cte AS (
    SELECT 
        MIN(S.Start_Date) AS Start_Date, MAX(S.End_Date) AS End_Date
    FROM (
        SELECT P.Start_Date, P.End_Date, P.Start_Date - DENSE_RANK() OVER (ORDER BY P.Start_Date) AS Seq_id
        FROM Projects P) AS S
    GROUP BY S.Seq_id
)
SELECT *
FROM cte
ORDER BY (cte.End_Date - cte.Start_Date);

# 11th method
SELECT MIN(start_date), MAX(end_date)
FROM (
    SELECT start_date,
    end_date,
    start_date - ROW_NUMBER() OVER (ORDER BY start_date) AS rnk
    FROM Projects p ) tmp
GROUP BY rnk
ORDER BY MAX(start_date) - MIN(start_date), MIN(start_date);

# 12th method By using CTE AND CASE Clause 
WITH Project_Dates AS (
    SELECT
        Start_Date,
        End_Date,
        SUM(CASE WHEN Start_Date IN (SELECT End_Date FROM Projects) 
            THEN 0 ELSE 1 END) 
            OVER (ORDER BY Start_Date) AS Project_ID
    FROM Projects
), Project_Length AS (
    SELECT Project_ID,
        MIN(Start_Date) AS Start_Date,
        MAX(End_Date) AS End_Date,
        COUNT(Start_Date) AS Days
    FROM Project_Dates
    GROUP BY Project_ID
)
SELECT  Start_Date,End_Date
FROM Project_Length
ORDER BY Days,Start_Date;
    

### 13th method By Assigning Variable Using set method
SET @prevStartDate := NULL;
SET @group := 0;
SELECT MIN(Start_Date) AS start_date, MAX(End_Date) AS end_date
FROM (
    SELECT Start_Date, End_Date, 
        IF(DATEDIFF(Start_Date, @prevStartDate) = 1, @group, @group := @group + 1) AS group_number,
        @prevStartDate := Start_Date
    FROM (
        SELECT Start_Date, End_Date
        FROM (
            SELECT *
            FROM Projects
            ORDER BY End_Date
        ) AS sorted_projects
    ) AS X
) AS grouped_projects
GROUP BY group_number
ORDER BY DATEDIFF(MAX(End_Date), MIN(Start_Date)), MIN(Start_Date);


# MySQL solution with two derived tables:
# TStarts which has (Start_Date)s that are NOT IN Projects.End_Date, meaning these start dates are the distinct start dates.
# TEnds which does the opposite so it has distinct end dates.
# Using ROW_NUMBER() to number these rows and JOIN them together for calculating difference.
# Using DATEDIFF() to calculate dates differences for each row(project).
# Complete code:

# Or also 
# Using Set variable method
SET @VAR:= 0;
SELECT MIN(Start_Date) AS S_Date, MAX(End_Date) AS E_Date
FROM (
    SELECT *,
        CASE
            WHEN DATE_DIFF = 1 THEN @VAR ELSE (@VAR:= @VAR+1) END AS Pr_Group
    FROM (
        SELECT *, DATEDIFF(End_Date, LAG(End_Date) OVER()) AS DATE_DIFF
        FROM Projects
        ORDER BY End_Date
    ) Subq
) Subquery
GROUP BY Pr_Group
ORDER BY COUNT(Start_Date), S_Date;

/*
-- INTERVAL:-  it's used to specify a time interval, It can be used to specify a range or duration in terms of years, months, days, hours, minutes, seconds, etc.
  Interval values can be used in a variety of temporal functions, such as DATE_ADD, DATE_SUB, TIMESTAMPADD, and TIMESTAMPDIFF.in date and time calculations,
  I mean especially when dealing with date arithmetic or date comparisons.
 
Basic syntax: INTERVAL value unit
value: This is the numeric value that represents the length of the interval.
unit: This is the unit of time for the interval, such as YEAR, MONTH, DAY, HOUR, MINUTE, SECOND, etc.

For example:
DATE_ADD(CURRENT_DATE(), INTERVAL 1 DAY)
DATE_SUB(CURRENT_DATE(), INTERVAL -1 DAY)
INTERVAL 1 DAY represents an interval of one day.
INTERVAL 3 MONTH represents an interval of three months.
INTERVAL 2 HOUR represents an interval of two hours.

Or as we used below in problm "GROUP BY start_date - INTERVAL seqnum DAY"
here this query subtracts an interval of seqnum days from the start_date.


-- DateDiff():  The DATEDIFF(): Calculate the difference between two dates. The DATEDIFF() function only considers the date part of the two values, and ignores the time part.
Example :- 
			SELECT DATEDIFF(CURRENT_DATE(), '2023-01-01')
			DATEDIFF(MAX(end_date), MIN(start_date))

here's a list of some important date and time functions available in MySQL:

CURRENT_DATE(): Returns the current date.

CURRENT_TIME(): Returns the current time.

CURRENT_TIMESTAMP(): Returns the current date and time.

MAKEDATE() : Creates a date from a year, month, and day value.

MAKETIME() : Creates a time from an hour, minute, second, and microsecond value.

LOCALTIME() : Returns the current date and time in the local time zone.

YEAR/MONTH/DAY(date): Extracts the year/month/day of the month from a date.

HOUR/MINUTE/SECOND(time): Extracts the hour/minute/second  from a time.

DATE_ADD(date, INTERVAL value unit): Adds an interval to a date.

DATE_SUB(date, INTERVAL value unit): Subtracts an interval from a date.

DATEDIFF(end_date, start_date): Calculates the difference in days between two dates.

TIMESTAMPDIFF(unit, start_datetime, end_datetime): Calculates the difference between two date or time values in a specified unit (e.g., YEAR, MONTH, DAY, HOUR, MINUTE, SECOND).

DATE_FORMAT(date, format): Formats a date according to the specified format string.

TIME_FORMAT(time, format): Formats a time according to the specified format string.

NOW(): Returns the current date and time.

STR_TO_DATE(str, format): Converts a string to a date based on the specified format.

DATE/TIME(str): Converts a string to a date/time.

TIMESTAMP(str): Converts a string to a timestamp.

DAYNAME(date): Returns the name of the day of the week for a date.

MONTHNAME(date): Returns the name of the month for a date.

WEEKDAY(date): Returns the index of the day of the week (0 = Monday, 6 = Sunday) for a date.

LAST_DAY(date): Returns the last day of the month for a given date.

EXTRACT(unit FROM date): Extracts a specified part (unit) from a date or time value.

UNIX_TIMESTAMP(): Returns the current date and time as a Unix timestamp.

FROM_UNIXTIME(unix_timestamp): Converts a Unix timestamp to a MySQL date and time.

SEC_TO_TIME() : Converts a number of seconds to a time value.

STR_TO_DATE() : Converts a string to a date or datetime value.

SUBDATE() : Subtracts a specified interval from a date or datetime value.

TIMEDIFF() : Calculates the difference between two times.

TIMESTAMPADD() : Adds a specified interval to a timestamp value.

TIMESTAMPDIFF() : Calculates the difference between two timestamps.

UNIX_TIMESTAMP() : Converts a date or datetime value to a Unix timestamp.

UTC_DATE/time() : Returns the current date/time in UTC.

UTC_TIMESTAMP() : Returns the current date and time in UTC.

*/


/***********************************************************/
/*************** Question 52 (Placements) *****************/
# 1st method By using Subquery
SELECT NAME
FROM (SELECT S.Name AS NAME
FROM STUDENTS S
JOIN FRIENDS F ON F.ID=S.ID
JOIN PACKAGES P1 ON P1.ID = S.ID
-- ERROR 1066 (42000) at line 2: Not unique table/alias: 'P'
-- So remeber JOIN Alias/Alias should be Unique otherwise it's become ambigious during join
JOIN PACKAGES P2 ON P2.ID = F.FRIEND_ID
WHERE p2.salary > p1.salary
ORDER BY p2.salary
) AS SubqueryAlias;

# 2nd method By using Subquery
WITH NCTE AS (SELECT S.Name AS Name
      FROM Students S JOIN Friends F ON S.ID = F.ID
      JOIN Packages P1 ON P1.ID = S.ID
-- ERROR 1066 (42000) at line 2: Not unique table/alias: 'P'
      JOIN Packages P2 ON P2.ID = F.Friend_ID 
      WHERE P2.Salary > P1.Salary
      ORDER BY P2.Salary)
SELECT Name
FROM NCTE;

/****************************************************************/
/*************** Question 53 (Symmetric Pairs) *****************/
# Note when it comes to complex query or need to interpreate just use multiple alias of query
/* Testify
#
SELECT F1.X, F1.Y
FROM Functions F1
86 86
27 27
....
....
#
SELECT F2.X, F2.Y
FROM Functions F2
86 86
27 27
....
#
SELECT F1.X, F1.Y
FROM Functions F1
JOIN Functions F2
    ON F1.X = F2.Y AND F2.X = F1.Y
86 86
27 27
45 45
95 95
..
*/

/*
WITH CTE AS (
    SELECT *, ROW_NUMBER() OVER (ORDER BY X) AS rn
    FROM Functions)
SELECT c.X, c.Y
FROM CTE c
JOIN CTE d
    ON c.X = d.Y AND c.rn < d.rn AND c.Y = d.X;
-- WITH C1TE AS (
--     SELECT F1.X AS X1, F1.Y AS Y1
--     FROM Functions F1
-- ), C2TE AS (
--     SELECT F2.X AS X2, F2.Y AS Y2
--     FROM Functions F2
-- )
-- SELECT X, Y
-- FROM Functions
-- WHERE (SELECT X1 FROM C1TE) = (SELECT Y2 FROM C2TE) AND 
-- (SELECT X2 FROM C2TE) = (SELECT Y1 FROM C1TE)
    
-- WITH C1TE AS (
--     SELECT F1.X AS X1, F1.Y AS Y1
--     FROM Functions F1
-- ),
-- WITH C1TE AS (
--     SELECT F2.X AS X2, F2.Y AS Y2
--)    FROM Functions F2
-- WITH CTE AS (
--     SELECT *, ROW_NUMBER() OVER (ORDER BY X) AS rn
--     FROM Functions
-- )
-- SELECT c.X, c.Y
-- FROM CTE c
-- JOIN CTE d ON c.X = d.Y AND c.rn < d.rn AND c.Y = d.X;
*/

# 1ST METHOD By using Inner join, Group by, Having by
SELECT F1.X, F1.Y
FROM functions F1 JOIN functions F2 
     ON F1.X = F2.Y AND F1.Y=F2.X
GROUP BY F1.X, F1.Y
HAVING COUNT(*) > 1 OR  F1.X < F1.Y -- / HAVING F1.X < F1.Y OR (F1.X = F1.Y AND COUNT(F1.X)>1)
# So HAVING COUNT(F1.X) > 1 OR  F1.X < F1.Y
# Here (HAVING COUNT(*)) looking for rows where the same combination of X1 and Y1 values appears more than one time in the self-join.
ORDER BY F1.X;

/* The GROUP BY clause groups the result set based on the values of F1.X and F1.Y.
 This means that rows with the same combination of F1.X and F1.Y will be treated as a single group. 
 AND COUNT(*) function is applied to each group to calculate the count of rows in that group. */
# HAVING clause is used to filter the grouped results
# HAVING COUNT(*) > 1 specifies that the condition should be satisfied if the count of rows within a group is greater than 1.
# This condition ensures that only groups with more than one row (duplicates) are selected.
# So, the query will return only the rows where the combination of F1.X and F1.Y occurs more than once in the "functions" table,
# OR where F1.X is less than F1.Y, after grouping the rows based on F1.X and F1.Y.
 
# 2nd Method 
SELECT DISTINCT F.x,F.y FROM Functions AS F
WHERE (F.x <= F.y) AND (F.x=F.y) <
    (SELECT COUNT(*)
    FROM Functions AS F2
    WHERE F2.x=F.y AND F2.y=F.x)
ORDER BY F.x,F.y;


# 3rd method by using CTE method
WITH CTE1 AS (
    SELECT X AS X1, Y AS Y1
    FROM Functions
), CTE2 AS (
    SELECT X AS X2, Y AS Y2
    FROM Functions)
SELECT R1.X1, R1.Y1
FROM CTE1 AS R1
JOIN CTE2 AS R2
    ON R1.X1= R2.Y2 AND R2.X2 = R1.Y1
GROUP BY R1.X1, R1.Y1
HAVING COUNT(*) > 1 OR R1.X1 < R1.Y1
ORDER BY R1.X1;

#OR
WITH CTE AS (
    SELECT x, y, ROW_NUMBER() OVER (ORDER BY x) AS row_num 
    FROM functions
)
SELECT DISTINCT f1.x, f1.y -- / DISTINCT is not used multiple times in a single column like DISTINCT f1.x, DISTINCT f1.y
/* Note; - DISTINCT keyword is applied to both f1.x and f1.y. It ensures that the result set will contain unique combinations of f1.x and f1.y.
 If there are duplicate combinations in the FCTE table, only one distinct row with that combination will be returned. */
FROM CTE AS f1				-- /
JOIN CTE AS f2
    ON f1.x = f2.y AND f2.x = f1.y
WHERE f1.row_num <> f2.row_num
    AND f1.x <= f1.y
ORDER BY f1.x ASC;

# OR 
WITH CTE AS (
    SELECT *, ROW_NUMBER() OVER (ORDER BY X) AS rn
    FROM Functions
)
SELECT c.X, c.Y
FROM CTE c
JOIN CTE d ON c.X = d.Y AND c.rn < d.rn AND c.Y = d.X;

# OR
WITH CTE AS (
    SELECT x, y, ROW_NUMBER() OVER (ORDER BY x) AS r
    FROM functions
)
SELECT DISTINCT f.x, f.y
FROM CTE f
JOIN CTE a ON a.x = f.y
 AND a.y = f.x AND a.r <> f.r
WHERE f.x <= f.y
ORDER BY f.x;

# 4TH METHOD
WITH Indexed AS (
    SELECT *,
    ROW_NUMBER() OVER(ORDER BY X) AS rn 
    FROM Functions
)
SELECT f1.X, f1.Y
FROM (
    SELECT X, Y, MIN(rn) AS rn
    FROM Indexed
    WHERE X <= Y
    GROUP BY X, Y
) f1
JOIN Indexed f2
ON (f1.X = f2. Y AND f1.Y = f2.X AND f1.rn != f2.rn);


# 5th method BY JOINING After creating 2 Unique subsquential row
SELECT DISTINCT F1.X, F1.Y
FROM
	(SELECT X, Y, ROW_NUMBER() OVER(ORDER BY X) AS rn
    FROM Functions
) F1,
	(SELECT X, Y, ROW_NUMBER() OVER(ORDER BY X) AS rn
    FROM Functions
) F2
WHERE
    F1.X = F2.Y AND
    F1.Y = F2.X AND
    F2.rn != F1.rn AND
    F1.X <= F1.Y
ORDER BY X ASC;
/* The GROUP BY clause groups the result set based on the values of F1.X and F1.Y.
 This means that rows with the same combination of F1.X and F1.Y will be treated as a single group. */
 
# --  ORDER BY clause cannot be used directly on an aggregate function like COUNT() without proper grouping.
# -- FOR Example like

SELECT *
FROM FUNCTIONS
ORDER BY COUNT(*) -- / you will get error due to the use of the ORDER BY clause on the COUNT() function without any grouping.

-- Correct one
;

-- 6TH METHOD Inner Join with UNION
SELECT a.x, a.y
FROM Functions a
INNER JOIN Functions b ON a.x = b.y AND a.y = b.x
WHERE a.x != a.y AND a.x <= a.y
UNION
SELECT *
FROM (
    SELECT x, y
    FROM Functions
    WHERE x = y
    GROUP BY x, y
    HAVING COUNT(x) > 1
) AS Subquery;


# OR 
SELECT A.X, A.Y
 FROM Functions AS A
INNER JOIN Functions AS B
    WHERE (A.X = B.Y) AND (A.Y = B.X) AND (A.X < A.Y)
UNION
    SELECT X, Y FROM Functions
    GROUP BY X, Y
    HAVING (X=Y) AND (COUNT(*) > 1)
ORDER BY X;


-- 7TH METHOD Inner Join with UNION
SELECT DISTINCT table1.x, table1.y
FROM
  (SELECT *, ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) AS rn1 FROM functions) table1
JOIN
  (SELECT *, ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) AS rn2 FROM functions) table2
ON (table1.rn1 != table2.rn2) AND (table1.x = table2.y) AND (table1.y = table2.x) AND (table1.x <= table1.y)
ORDER BY table1.x ASC;


-- 8th Method 
WITH f1 AS (SELECT *, ROW_NUMBER() OVER (ORDER BY x) AS stt FROM Functions ),
	f2 AS ( SELECT *, ROW_NUMBER() OVER (ORDER BY x) AS stt FROM Functions)
SELECT DISTINCT f1.x, f1.y
FROM f1
INNER JOIN f2 ON f1.x = f2.y 
    AND f1.y = f2.x 
    AND f1.stt <> f2.stt 
;

# 9TH WAY TO INTERPREATE
SELECT DISTINCT *
FROM functions f
WHERE f.x <= f.y 
  AND ((SELECT COUNT(*) FROM functions s WHERE f.x = s.y AND f.y = s.x) - (f.x = f.y)) >= 1
ORDER BY f.x;


# 10TH WAY TO By USING CASE CLAUSE
WITH Sorted AS(
SELECT 
    CASE 
        WHEN X<=Y THEN X
        ELSE Y
    END as X,
    CASE
        WHEN X<=Y THEN Y
        ELSE X
    END as Y
FROM Functions)
SELECT DISTINCT * FROM Sorted
GROUP BY X, Y
HAVING COUNT(*)>1
ORDER BY X;


/**************************************************/
/*********** Question 54 Interviews **************/
/************ Key concept Advanced Join ************/
SELECT Subq1.contest_id, Subq1.hacker_id, Subq1.name, total_submissions, total_accepted_submissions, total_views, total_unique_views
FROM (
    SELECT c.contest_id, c.hacker_id, c.name,
           SUM(total_submissions) AS total_submissions,
           SUM(total_accepted_submissions) AS total_accepted_submissions
    FROM contests c
    INNER JOIN colleges col ON c.contest_id = col.contest_id
    INNER JOIN challenges cl ON cl.college_id = col.college_id
    INNER JOIN submission_stats sub ON sub.challenge_id = cl.challenge_id
    GROUP BY c.contest_id, c.hacker_id, c.name
) Subq1
INNER JOIN (
    SELECT c.contest_id, c.hacker_id, c.name,
           SUM(total_views) AS total_views,
           SUM(total_unique_views) AS total_unique_views
    FROM contests c
    INNER JOIN colleges col ON c.contest_id = col.contest_id
    INNER JOIN challenges cl ON cl.college_id = col.college_id
    INNER JOIN view_stats vs ON vs.challenge_id = cl.challenge_id
    GROUP BY c.contest_id, c.hacker_id, c.name
) Subq2 ON Subq1.contest_id = Subq2.contest_id
ORDER BY Subq1.contest_id;

# 2nd method with CTE method
WITH SUM_View_Stats AS (
SELECT challenge_id,
	   total_views = sum(total_views),
       total_unique_views = sum(total_unique_views)
FROM View_Stats 
GROUP BY challenge_id
), SUM_Submission_Stats AS (
SELECT challenge_id,
      total_submissions = sum(total_submissions),
      total_accepted_submissions = sum(total_accepted_submissions)
FROM Submission_Stats 
GROUP BY challenge_id
)
SELECT con.contest_id, con.hacker_id, con.name , SUM(total_submissions), sum(total_accepted_submissions), sum(total_views) , sum(total_unique_views)
FROM Contests con
INNER JOIN Colleges col
    ON con.contest_id = col.contest_id
INNER JOIN Challenges cha
    ON cha.college_id = col.college_id
LEFT JOIN SUM_View_Stats vs
    ON vs.challenge_id = cha.challenge_id
LEFT JOIN SUM_Submission_Stats ss
    ON ss.challenge_id = cha.challenge_id
GROUP BY con.contest_id,con.hacker_id,con.name
HAVING (SUM(total_submissions)
        +sum(total_accepted_submissions)
        +sum(total_views)
        +sum(total_unique_views)) <> 0
ORDER BY con.contest_ID;
/* In the table Challenges there is a challenge_id 18765. This ID is not present in the Submission_Stats table,
 but is present in the View_Stats table. So, if you do the inner join on Challenges and Submissions_Stats first,
 there will be no rows with challenge_id 18765 in the result set. And when you do the second inner join with Vew_Stats table,
 the rows with challenge_id 18765 in it will not be regarded. 
If you do the left join, the rows with challege_id 18765 from the Challenges table (the left table)
 will be preserved in the result set even if there are no rows with this id in the rgiht */


/***********************************************************/
/******* Question 55 (15 Days of Learning SQL) ************/
/************ Key concept Advanced Join ******************/
WITH HackerSubmissions AS (
    SELECT
        H.hacker_id,
        H.name,
        S.submission_date,
        COUNT(S.submission_id) AS submissions
    FROM
        Hackers H
    JOIN Submissions S ON H.hacker_id = S.hacker_id
    WHERE S.submission_date BETWEEN '2016-03-01' AND '2016-03-15'
    GROUP BY H.hacker_id, H.name, S.submission_date
),
MaxSubmissions AS (
    SELECT
        submission_date,
        MAX(submissions) AS max_submissions
    FROM
        HackerSubmissions
    GROUP BY submission_date
)
SELECT
    HS.submission_date,
    COUNT(DISTINCT HS.hacker_id) AS hackers,
    HS.hacker_id,
    HS.name
FROM
    HackerSubmissions HS
JOIN MaxSubmissions MS ON HS.submission_date = MS.submission_date AND HS.submissions = MS.max_submissions
GROUP BY HS.submission_date, HS.hacker_id, HS.name
ORDER BY HS.submission_date;

#1st method USING CTE METHOD

# OR
with 
df (sdate, id, csubs, sday, prog) as (
    select submission_date, hacker_id, count(hacker_id),
    day(submission_date), row_number() over 
    (partition by hacker_id order by submission_date asc)
    from submissions
    group by submission_date, hacker_id),
tot_sub as (
    select sdate, count(sdate) as tsubs 
    from df
    where sday = prog
    group by sdate),
rank_sub as (
    select sdate, id,
    rank() over(partition by sdate order by csubs desc) as rsubs
    from df)
    
select t.sdate, tsubs, r.mid, name
from tot_sub as t
left join (select sdate, min(id) as mid
           from rank_sub 
           where rsubs = 1
           group by sdate) as r
           on t.sdate = r.sdate
left join Hackers as h on r.mid = h.hacker_id
order by t.sdate;

# 2ND METHOD Using subquery
/*
SELECT IN SELECT EXPECTS NOT MORE THAN ONE COLUMN
*/
select t.submission_date, t.num, t.id, h.name from
(
    select s.submission_date, 
    (
        select count(distinct(s1.hacker_id)) 
        from Submissions s1 
        where 
        s1.submission_date = s.submission_date and 
        (
            select count(distinct(s2.submission_date)) 
            from Submissions s2 
            where s2.submission_date < s.submission_date and s2.hacker_id = s1.hacker_id
        ) = datediff(s.submission_date, (select min(s3.submission_date) from Submissions s3) )
    )as num,
    (
        select s4.hacker_id
        from Submissions s4 
        where s4.submission_date = s.submission_date 
        group by s4.hacker_id 
        order by count(*) desc, s4.hacker_id
        limit 1
    ) as id
    from 
    (
        select distinct(s5.submission_date) 
        from Submissions s5
    ) s
) t, Hackers h
where h.hacker_id = t.id
order by t.submission_date; 


/************************************************/
/********** Alternative Queries ****************/
/**********************************************/

/*********** 56 (Draw The Triangle 1) **************/
/**************************************************/
/*
The SET clause can be used to set the value of any variable, not just variables that are declared in the current scope.
The SET clause can be used to set the value of a variable to a literal value, a column value, or the result of a function.
The SET clause can be used to set the value of multiple variables in a single statement.


The INFORMATION_SCHEMA.TABLES:-  view allows you to get information about all tables and views within a database.
								 By default it will show you this information for every single table and view that is in the database.
/*
The information_schema.tables is a view in most relational database management systems (RDBMS) that provides metadata information about tables in a database.
 It is a part of the information_schema database, which is a system database that stores information about the schema and structure of a database.
*/

-- User defined variables start with @ in MYSQL. 
-- In sql '=' is used for comparing/checking for equality (like '==' in c/c++/java) , for assign a value in to a variable in sql ':=' is used.
-- the actual values of information_schema.tables is not required as such but for running the sql query it has to refer to a table.

# 1st method
DELIMITER //
CREATE PROCEDURE GeneratePattern()
BEGIN
    DECLARE row_num INT DEFAULT 20;
    DECLARE line TEXT DEFAULT '';

    WHILE row_num > 0 DO
        SET line = REPEAT('* ', row_num);
        SELECT line;
        SET row_num = row_num - 1;
    END WHILE;
END //
DELIMITER ; #Must have space
CALL GeneratePattern();

# 2ND METHOD
WITH RECURSIVE num_list AS 
    (
    SELECT 20 AS num
    UNION ALL
    SELECT num - 1
    FROM num_list
    WHERE num > 1
)
SELECT REPEAT('* ', num) AS pattern
FROM num_list
ORDER BY num DESC;

# 3rd method by using set method and REPEAT
SET @number = 6;
SELECT REPEAT('* ', @number := @number - 1)
FROM information_schema.tables 
LIMIT 5;


/*********** 57 (Draw The Triangle 2) **************/
/**************************************************/
# 1st method by using STORE PROCEDURE
-- DELIMITER //
CREATE PROCEDURE PrintPatternReverse()
BEGIN
    DECLARE current_row INT DEFAULT 1;

    WHILE current_row <= 20 DO
        SELECT REPEAT('* ', current_row) AS pattern;
        SET current_row := current_row + 1;
    END WHILE;
END //

DELIMITER ;
CALL PrintPatternReverse();

# OR
DELIMITER $$ 
CREATE PROCEDURE myproc()
BEGIN
DECLARE count INT DEFAULT 20;
   WHILE count >= 1 DO
      SELECT REPEAT('* ', count);
      SET count = count - 1;
   END WHILE;
END $$
DELIMITER ;
Call myproc();

#2nd method By using recursive method
WITH RECURSIVE num_list AS 
    (
    SELECT 1 AS num
    UNION ALL
    SELECT num + 1
    FROM num_list
    WHERE num < 20
)
SELECT REPEAT('* ', num) AS pattern
FROM num_list
ORDER BY num asc;

#3rd method Simply by defining variable and repeat clause
SET @number = 21;
SELECT REPEAT('* ', @number := @number - 1)
FROM information_schema.tables 
LIMIT 20;


/*********** 58 (Print Prime Numbers) **************/
/**************************************************/
# 1st method By using recursive, GROUP_CONCAT clause
WITH RECURSIVE num_list AS (
    SELECT 2 AS num
    UNION ALL
    SELECT num + 1
    FROM num_list
    WHERE num < 1000
)
SELECT GROUP_CONCAT(num SEPARATOR '&') AS prime_numbers
FROM num_list
WHERE NOT EXISTS (
    SELECT 1
    FROM num_list nl
    WHERE nl.num < num_list.num AND num_list.num % nl.num = 0
) AND num_list.num <= 1000; 

# OR
WITH RECURSIVE t AS (
  SELECT 2 AS number
UNION ALL
  SELECT number + 1 FROM t WHERE number < 1000
)
SELECT GROUP_CONCAT(number SEPARATOR '&') FROM t
WHERE (
  SELECT COUNT(*) FROM t t2
  WHERE t.number % t2.number = 0
) = 1;

# Note whenever each or every comes in statement think group by and join
# in string or text min funxn in minimum (lowest) value based on the lexicographical order and max vice versa
# can't use alias within inline query bcz before this some other clause perform
#  WHERE clause expects a single value in a column
/*🔽FROM: Gathers all of the data
 
🔽WHERE: Filters rows of data

🔽GROUP BY: Groups rows together

🔽HAVING: Filters grouped rows

🔽SELECT: Specifies columns to display

🔽ORDER BY: Rearranges the results
/*
# Just experimenting it's mnot hackerrank qustion
SELECT continent, name, area
FROM world x
WHERE area = (
    SELECT MAX(area)
    FROM world y
    WHERE y.continent = x.continent
);
SELECT w1.continent, w1.name, w1.area
FROM world w1
JOIN (
    SELECT continent, MAX(area) AS max_area
    FROM world
    GROUP BY continent
) w2
ON w1.continent = w2.continent AND w1.area = w2.max_area;
SELECT w1.continent, w1.name, w1.area
FROM world w1
JOIN (
    SELECT continent, MAX(area) AS max_area
    FROM world
    GROUP BY continent
) w2
ON w1.continent = w2.continent AND w1.area = w2.max_area;
