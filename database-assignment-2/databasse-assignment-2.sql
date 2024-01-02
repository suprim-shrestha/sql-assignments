-- 1. Japanese Cities' Names
SELECT name 
FROM city 
WHERE countrycode = 'JPN';


-- 2. Weather Observation Station 3
SELECT city
FROM station
WHERE id % 2 = 0
GROUP BY city;
-- or
SELECT DISTINCT city
FROM station
WHERE id % 2 = 0;


-- 3. Weather Observation Station 5
(
    SELECT city, LENGTH(city) AS word_length
    FROM Station
    WHERE LENGTH(city) = (
        SELECT MIN(LENGTH(city)) AS min_length
        FROM Station
    )
    ORDER BY city
    LIMIT 1
)
UNION ALL
(
    SELECT city, LENGTH(city) AS word_length
    FROM Station
    WHERE LENGTH(city) = (
        SELECT MAX(LENGTH(city)) AS max_length
        FROM Station
    )
    ORDER BY city
    LIMIT 1
);


-- 4. The Bundler

-- Postgres
SELECT 
	CEIL(
		AVG(salary) - 
		AVG(CAST(REPLACE(CAST(salary AS VARCHAR(5)), '0', '') AS DECIMAL))
	)
FROM employees;

-- MySQL
SELECT 
	CEIL(
		AVG(salary) - 
		AVG(CAST(REPLACE(salary, '0', '') AS DECIMAL))
	)
FROM employees;


-- 5. Weather Observation Station 18
SELECT
	ROUND(
    	((MAX(lat_n) - MIN(lat_n)) +
    	(MAX(long_w) - MIN(long_w))), 4
)
FROM station;


-- 6. Average Population of Each Continent
SELECT
    country.continent,
    FLOOR(AVG(city.population))
FROM country
JOIN city
ON country.code = city.countrycode
GROUP BY country.continent;


-- 7. THE PADS
SELECT
    CONCAT(name, '(', LEFT(occupation, 1), ')')
FROM occupations
ORDER BY name;

SELECT
    CONCAT(
        'There are a total of ',
        COUNT(occupation),
        ' ',
        LOWER(occupation),
        's.'
    )
FROM occupations
GROUP BY occupation
ORDER BY COUNT(occupation), occupation;


-- 8. Type of Triangle
SELECT
    CASE
        WHEN 
            a + b <= c OR
            b + c <= a OR
            a + c <= b
        THEN 'Not A Triangle'
        WHEN
            a = b AND b = c
        THEN 'Equilateral'
        WHEN 
            a = b OR b = c OR a = c 
        THEN 'Isosceles'
        ELSE 'Scalene'
    END
FROM Triangles;


-- 9. Weather Observation Station 13
SELECT TRUNC(SUM(LAT_N), 4)
FROM Station
WHERE LAT_N >38.7880 AND LAT_N < 137.2345;


-- 10. The Report
SELECT 
    name,
    (
        SELECT grade
        FROM grades
        WHERE s.marks <= max_mark AND s.marks >= min_mark
    ) g,
    marks
FROM students s
HAVING g >=8
ORDER BY g DESC, name ASC;

SELECT 
    "NULL",
    (
        SELECT grade
        FROM grades
        WHERE s.marks <= max_mark AND s.marks >= min_mark
    ) g,
    marks
FROM students s
HAVING g < 8
ORDER BY g DESC, marks ASC;

-- using CASE
SELECT 
    CASE
        WHEN (
            SELECT grade
            FROM grades
            WHERE s.marks <= max_mark AND s.marks >= min_mark
        ) >= 8 THEN name
        ELSE 'NULL'
    END AS student_name,
    (
        SELECT grade
        FROM grades
        WHERE s.marks <= max_mark AND s.marks >= min_mark
    ) AS student_grade,
    marks
FROM students s
ORDER BY student_grade DESC, student_name, marks;




