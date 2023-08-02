-- Rmbr For agg fxn filteration always follow having bcz where works on one row at time Not sets of row
/*****************************************************/
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
SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '^[aeiou].*[aeiou]$';

# 3rd method by using subsstring





/***********************************************************/
/*********** Question 52 Contest Leaderboard **************/
/************ Key concept Basic Join *********************/
# 1st By USing Subquery method
SELECT Max_score.Hacker_id, name, SUM(score) AS total_score
FROM (SELECT H.hacker_id, name, challenge_id, MAX(score) as score
      FROM Hackers H join Submissions S ON H.hacker_id = S.hacker_id
      GROUP BY H.hacker_id, name, challenge_id
      HAVING(score)<>0  -- or HAVING(score) != 0 
     ) AS Max_score
GROUP BY Max_score.Hacker_id, name
ORDER BY total_score DESC, Max_score.Hacker_id;

# 2nd method with CTE method
WITH cte AS (
    SELECT h.hacker_id, h.name, s.challenge_id, s.score,
        ROW_NUMBER() OVER(PARTITION BY h.hacker_id, s.challenge_id ORDER BY s.score DESC, h.hacker_id) AS r -- for all over coverage
    FROM hackers h
    JOIN submissions s ON h.hacker_id = s.hacker_id
)
SELECT hacker_id, name, SUM(score) AS total_score
FROM cte
WHERE r = 1
GROUP BY name, hacker_id
HAVING SUM(score) <> 0
ORDER BY total_score DESC, hacker_id;

# Or For Obejective Clear
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




/***********************************************************/
/*********** Question 53 SQL Project Planning **************/
/************ Key concept Advance Join *********************/

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
FROM (
    SELECT Start_date, End_date, DATE_SUB(End_date, INTERVAL rn DAY) AS Grp_day
    FROM CTE
) AS TEMP
GROUP BY Grp_day
ORDER BY (MAX(End_date) - MIN(Start_date)), MIN(Start_date);


# 4TH Method Usind ADDDATE and INTERVAL method
SELECT MIN(Start_Date), MAX(End_Date)
FROM ( SELECT 
		Start_Date,
		End_DATE,
		ADDDATE(Start_Date, INTERVAL)
		- (ROW_NUMBER() OVER (ORDER BY Start_Date)- 1) Day) AS Project_Group
		FROM Projects
    ) AS TEMP
GROUP BY Project_Group
ORDER BY COUNT(*) ASC; 
 
 
# 5TH By selecting all column and method Using DAY , INTERVAL
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
	SELECT *, DATEADD(DAY, - ROW_NUMBER() OVER(ORDER BY END_DATE), END_DATE) AS RN
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
SELECT MIN(k.start_date), DATE_ADD(MAX(k.start_date), INTERVAL 1 DAY)
FROM (
    SELECT p.start_date, p.start_date - ROW_NUMBER() OVER (ORDER BY p.start_date) AS priority
    FROM projects AS p
) AS k
GROUP BY priority
ORDER BY MAX(k.start_date) - MIN(k.start_date), MIN(k.start_date);

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




/***********************************************************/
/*********** Question 53 Symmetric Pairs **************/
/************ Key concept Advance Join *********************/
# 1ST METHOD By using Inner join, Group by, Having by
SELECT F1.X, F1.Y
FROM functions F1 JOIN functions F2 
     ON F1.X = F2.Y AND F1.Y=F2.X
GROUP BY F1.X, F1.Y
HAVING COUNT(*) > 1 OR  F1.X < F1.Y -- / HAVING F1.X < F1.Y OR (F1.X = F1.Y AND COUNT(F1.X)>1)
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
SELECT A.X, A.Y FROM Functions AS A
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


/***********************************************************/
/*********** Question 55 Ollivander's Inventory **************/
/************ Key concept Basic Join *********************/
SELECT w.id,sub.age,sub.coin,sub.power
FROM (SELECT w.code,wp.age,w.power,min(w.coins_needed) coin
     FROM wands_property wp
     JOIN wands w
     ON w.code=wp.code
     WHERE wp.is_evil=0
     GROUP BY wp.age,w.power,w.code
    )sub JOIN wands w
ON w.code=sub.code AND w.coins_needed = sub.coin
ORDER BY sub.power DESC,sub.age DESC;

# OR Also
SELECT id, age, coins_needed, power
FROM wands w
JOIN wands_property wp ON wp.code = w.code 
WHERE is_evil = 0 AND coins_needed = 
    (SELECT MIN(coins_needed) FROM wands i 
     WHERE i.code = w.code AND i.power = w.power)
ORDER BY power DESC, age DESC;


# 2nd method By Using CTE
WITH cte AS 
        (SELECT w.id, p.age, w.coins_needed, w.power,
        RANK() OVER(PARTITION BY w.power, p.age ORDER BY w.coins_needed) AS aff
        FROM Wands AS w
        LEFT JOIN Wands_Property AS p ON w.code = p.code 
        WHERE p.is_evil = 0 
)
SELECT id, age, coins_needed, power
FROM cte
WHERE aff = 1
ORDER BY power DESC, age DESC;

# 3rd method
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


/**************************************************/
/*********** Question 56 Interviews **************/
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
SELECT challenge_id
    , total_views = sum(total_views)
    , total_unique_views = sum(total_unique_views)
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
ORDER BY con.contest_ID
/* In the table Challenges there is a challenge_id 18765. This ID is not present in the Submission_Stats table,
 but is present in the View_Stats table. So, if you do the inner join on Challenges and Submissions_Stats first,
 there will be no rows with challenge_id 18765 in the result set. And when you do the second inner join with Vew_Stats table,
 the rows with challenge_id 18765 in it will not be regarded. 
If you do the left join, the rows with challege_id 18765 from the Challenges table (the left table)
 will be preserved in the result set even if there are no rows with this id in the rgiht */


/***********************************************************/
/******* Question 57 (15 Days of Learning SQL) ************/
/************ Key concept Advanced Join ******************/;
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

/*****************************************************/
/******* Question 58 (Binary Tree Nodes) ************/
/********* Key concept Advanced SELECT *************/
SELECT N,
    CASE
        WHEN P IS NULL THEN 'Root'
        WHEN N NOT IN (SELECT DISTINCT P FROM BST WHERE P IS NOT NULL)THEN 'Leaf'
        ELSE 'Inner'
END AS NodeType
FROM BST ORDER BY N;
/* For forming adjecsent row Case */