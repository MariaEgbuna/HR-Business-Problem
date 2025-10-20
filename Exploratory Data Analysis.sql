-- Business Problem for HR Analyst: Employee Retention and Workforce Optimization

SELECT * FROM employee_data AS ed;

-- BASIC INFO

-- TOTAL NUMBER OF EMPLOYEES
SELECT COUNT(*) AS no_of_employees
FROM employee_data AS ed;
-- A total of 3000 employees

-- GENDER COUNT AND DISTRIBUTION
SELECT 
	ed.gender, 
	COUNT(*) AS gender_count,
	ROUND(COUNT(ed.gender) * 100.0 / SUM(COUNT(ed.gender)) OVER (), 2) AS percentage_dist
FROM employee_data AS ed
GROUP BY ed.gender;
-- There is a noticeable difference in gender representation, with Female employees (1682) outnumbering Male employees (1318).

-- DIVERSITY CHECK AND DISTRIBUTION
SELECT 
	ed.race_description, 
	COUNT(ed.race_description) AS ethnicity_count,
	ROUND(COUNT(ed.race_description) * 100.0 / SUM(COUNT(ed.race_description)) OVER (), 2) AS percentage_dist
FROM employee_data AS ed
GROUP BY ed.race_description;
-- The counts for each group are relatively close, ranging from 572 (Hispanic) to 629 (Asian).

-- 1. WORKFORCE DEMOGRAPHICS & DIVERSITY

-- (A). WHAT IS THE GENDER, RACE, AND AGE DISTRIBUTION OF EMPLOYEES ACROSS DIFFERENT BUSINESS UNITS?

-- GENDER DISTRIBUTION ACROSS BUSINESS UNITS
SELECT 
	ed.business_unit,
	ROUND(CAST(COUNT(ed.gender) FILTER (WHERE ed.gender = 'Male') AS NUMERIC) / COUNT(ed.gender) * 100, 2) AS male_dist,
    ROUND(CAST(COUNT(ed.gender) FILTER (WHERE ed.gender = 'Female') AS NUMERIC) / COUNT(ed.gender) * 100, 2) AS female_dist
FROM employee_data AS ed
GROUP BY ed.business_unit;

-- RACE DISTRIBUTION ACROSS BUSINESS UNITS
SELECT 
	ed.business_unit,
	CAST(COUNT(ed.race_description) FILTER (WHERE ed.race_description = 'Asian') AS NUMERIC) / COUNT(ed.race_description) AS asians,
    CAST(COUNT(ed.race_description) FILTER (WHERE ed.race_description = 'Black') AS NUMERIC )/ COUNT(ed.race_description) AS blacks,
    CAST(COUNT(ed.race_description) FILTER (WHERE ed.race_description = 'Hispanic') AS NUMERIC) / COUNT(ed.race_description) AS hispanics,
    CAST(COUNT(ed.race_description) FILTER (WHERE ed.race_description = 'Other') AS NUMERIC) / COUNT(ed.race_description) AS other_race,
    CAST(COUNT(ed.race_description) FILTER (WHERE ed.race_description = 'White') AS NUMERIC) / COUNT(ed.race_description) AS whites
FROM employee_data AS ed
GROUP BY ed.business_unit;

-- AGE GROUP DISTRIBUTION
SELECT
	ed.business_unit,
	ROUND((CAST(COUNT(ed.age) FILTER (WHERE ed.age BETWEEN 20 AND 35) AS NUMERIC) / COUNT(ed.age)) * 100, 2) AS ages_20_35_percent,
	ROUND((CAST(COUNT(ed.age) FILTER (WHERE ed.age BETWEEN 36 AND 55) AS NUMERIC) / COUNT(ed.age)) * 100, 2) AS ages_36_55_percent,
	ROUND((CAST(COUNT(ed.age) FILTER (WHERE ed.age BETWEEN 56 AND 70) AS NUMERIC) / COUNT(ed.age)) * 100, 2) AS ages_56_70_percent,
	ROUND((CAST(COUNT(ed.age) FILTER (WHERE ed.age > 70) AS NUMERIC) / COUNT(ed.age)) * 100, 2) AS above_70_percent
FROM employee_data AS ed
GROUP BY ed.business_unit
ORDER BY ed.business_unit;
-- The ages 36-55 group consistently makes up the largest segment of the workforce across all business units, indicating that the company's employee base is predominantly middle-aged.

-- AVERAGE AGE ACROSS BUSINESS UNITS
SELECT 
	ed.business_unit,
	AVG(ed.age) AS average_age,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ed.age) AS median_age,
    STDDEV(ed.age) AS age_std_dev,
    COUNT(ed.age) AS employee_count
FROM employee_data AS ed
GROUP BY ed.business_unit;
-- Insight: Overall Mature Workforce. The average and median ages across all business units are relatively high, generally ranging from 51 to 55 years.

-- (B). WHICH DEPARTMENTS HAVE THE HIGHEST CONCENTRATION OF EMPLOYEES FROM SPECIFIC DEMOGRAPHIC GROUPS?

-- GENDER  CONCENTRATION
SELECT
	ed.department_type,
	ROUND(CAST(COUNT(ed.gender) FILTER (WHERE ed.gender = 'Male') AS NUMERIC) / COUNT(ed.gender) * 100, 2) AS male_percent,
	ROUND(CAST(COUNT(ed.gender) FILTER (WHERE ed.gender = 'Female') AS NUMERIC) / COUNT(ed.gender) * 100, 2) AS female_percent
FROM employee_data AS ed
GROUP BY ed.department_type;

-- RACE CONCENTRATION
SELECT
	ed.department_type,
	CAST(COUNT(ed.race_description) FILTER (WHERE ed.race_description = 'Asian') AS NUMERIC) / COUNT(ed.race_description) * 100 AS asian_percent,
	CAST(COUNT(ed.race_description) FILTER (WHERE ed.race_description = 'Black') AS NUMERIC) / COUNT(ed.race_description) * 100 AS black_percent,
	CAST(COUNT(ed.race_description) FILTER (WHERE ed.race_description = 'Hispanic') AS NUMERIC) / COUNT(ed.race_description) * 100 AS hispanic_percent,
	CAST(COUNT(ed.race_description) FILTER (WHERE ed.race_description = 'Other') AS NUMERIC) / COUNT(ed.race_description) * 100 AS other_percent,
	CAST(COUNT(ed.race_description) FILTER (WHERE ed.race_description = 'White') AS NUMERIC) / COUNT(ed.race_description) * 100 AS white_percent
FROM employee_data AS ed
GROUP BY ed.department_type
ORDER BY ed.department_type;

-- (C). WHAT IS THE AVERAGE EMPLOYEE TENURE BASED ON AGE GROUPS AND EMPLOYEE CLASSIFICATION TYPES?
WITH EmployeeTenureAndAge AS (
    SELECT
        ed.employee_classification_type,
        CASE
            WHEN ed.age BETWEEN 20 AND 35 THEN '20-35'
            WHEN ed.age BETWEEN 36 AND 55 THEN '36-55'
            WHEN ed.age BETWEEN 56 AND 70 THEN '56-70'
            ELSE 'Over 70'
        END AS age_group,
        EXTRACT(YEARS FROM
            CASE
                WHEN exit_date IS NULL THEN AGE(CURRENT_DATE, start_date)
                ELSE AGE(exit_date, start_date)
            END
        ) AS tenure_years
    FROM employee_data AS ed
)
SELECT employee_classification_type, age_group,
    AVG(tenure_years) AS average_tenure_years,
    COUNT(*) AS employee_count
FROM EmployeeTenureAndAge
GROUP BY employee_classification_type, age_group
ORDER BY employee_classification_type, age_group;
-- Observations: Full-Time employees tend to have slightly higher average tenures across most age groups compared to Part-Time and Temporary employees. The "Ages 20-35" Full-Time group shows the highest average tenure at approximately 2.43yrs

-- 2. EMPLOYEE RETENTION & ATTRITION ANALYSIS

-- (A). WHAT PERCENTAGE OF EMPLOYEES HAVE EXITED THE COMPANY OVER THE YEARS?
SELECT
    EXTRACT(YEAR FROM ed.exit_date) AS exit_year,
    (COUNT(ed.emp_id)::numeric * 100) / (SELECT COUNT(*) FROM employee_data)::numeric AS percentage_exited
FROM employee_data AS ed
WHERE ed.exit_date IS NOT NULL
GROUP BY exit_year
ORDER BY exit_year;
-- Observation: There's a clear upward trend in the number and percentage of employees exiting the company year over year from 2019 to 2023.

-- (B). WHICH DEPARTMENTS HAVE THE HIGHEST EXIT RATES?
WITH Department_Exits AS ( 
	SELECT ed.department_type, 
	COUNT(ed.emp_id) AS employee_count,
	COUNT(ed.exit_date) AS exited_employees
	FROM employee_data AS ed
	GROUP BY ed.department_type
)
SELECT
    de.department_type,
    ROUND((CAST(exited_employees AS NUMERIC) / de.employee_count) * 100, 2) AS exit_rate_percentage
FROM Department_Exits AS de
ORDER BY exit_rate_percentage DESC;

-- (C). WHAT ARE THE TOP REASONS FOR EMPLOYEE EXITS (RESIGNATION, INVOLUNTARY TERMINATION, RETIREMENT)?
SELECT ed.termination_type, COUNT(*) AS count_of_exits
FROM employee_data AS ed
WHERE ed.termination_type IS NOT NULL AND ed.termination_type != 'Unknown'
GROUP BY ed.termination_type
ORDER BY count_of_exits DESC;
-- Observation: There isn't one single reason that dominates the exits, instead, there's a relatively even distribution across these four main categories. This implies that HR strategies might need to address multiple facets of retention and exit management.

-- 3. WHICH JOB TITLES AND PAY ZONES HAVE THE HIGHEST TURNOVER RATES?

-- (A). TURNOVER RATE BY JOB TITLE
WITH EmployeesByJobTitle AS (
    SELECT title, COUNT(*) AS total_employees
    FROM employee_data
    GROUP BY title
),
ExitedEmployeesByJobTitle AS (
    SELECT title, COUNT(*) AS exited_employees
    FROM employee_data
    WHERE exit_date IS NOT NULL
    GROUP BY title
)
SELECT
    t.title, t.total_employees,
    COALESCE(e.exited_employees, 0) AS exited_employees,
    (COALESCE(e.exited_employees, 0)::numeric * 100.0) / t.total_employees::numeric AS turnover_rate
FROM EmployeesByJobTitle AS t
LEFT JOIN ExitedEmployeesByJobTitle AS e ON t.title = e.title
ORDER BY turnover_rate DESC, t.title;
-- Observation: Extremely High Turnover in Specialized Roles. "Data Architect" shows a 100% turnover rate, meaning all 5 employees in this role have exited. "Enterprise Architect" and "Software Engineering Manager" also have very high rates at 80% and 70% respectively.

-- (B). TURNOVER RATE BY PAY ZONE
WITH TotalEmployeesByPayzone AS (
    SELECT payzone, COUNT(*) AS total_employees
    FROM employee_data
    GROUP BY  payzone
),
ExitedEmployeesByPayzone AS (
    SELECT payzone, COUNT(*) AS exited_employees
    FROM employee_data
    WHERE exit_date IS NOT NULL
    GROUP BY payzone
)
SELECT
    p.payzone,
    p.total_employees,
    COALESCE(e.exited_employees, 0) AS exited_employees,
    (COALESCE(e.exited_employees, 0)::numeric * 100.0) / p.total_employees::numeric AS turnover_rate
FROM TotalEmployeesByPayzone AS p
LEFT JOIN ExitedEmployeesByPayzone AS e ON p.payzone = e.payzone
ORDER BY turnover_rate DESC, p.payzone;
-- Observation: The pay zones show a very uniform attrition pattern. This suggests that compensation might not be a differentiating factor in high turnover, or perhaps the issue is systemic across all compensation tiers rather than concentrated in one.

-- 4. WHAT IS THE RELATIONSHIP BETWEEN TENURE AND TERMINATION TYPE?

-- (A). AVERAGE TENURE BY TERMINATION TYPE
SELECT
    ed.termination_type,
    AVG(
        EXTRACT(YEAR FROM AGE(ed.exit_date, ed.start_date)) +
        EXTRACT(MONTH FROM AGE(ed.exit_date, ed.start_date)) / 12.0 +
        EXTRACT(DAY FROM AGE(ed.exit_date, ed.start_date)) / 365.25
    ) AS average_tenure_years
FROM employee_data AS ed
WHERE ed.termination_type IS NOT NULL AND ed.termination_type != 'Unknown'
GROUP BY ed.termination_type
ORDER BY average_tenure_years DESC;
-- Observation: The average tenure for all termination types is quite low, ranging from approximately 1.29 to 1.41 years. This suggests that, on average, employees are not staying for very long before their employment ends, regardless of the reason.

-- Average Tenure by Employee Type and Termination Type
SELECT
    ed.employee_type, ed.termination_type,
    AVG(
        EXTRACT(YEAR FROM AGE(ed.exit_date, ed.start_date)) +
        EXTRACT(MONTH FROM AGE(ed.exit_date, ed.start_date)) / 12.0 +
        EXTRACT(DAY FROM AGE(ed.exit_date, ed.start_date)) / 365.25
    ) AS average_tenure_years
FROM employee_data AS ed
WHERE ed.termination_type IS NOT NULL AND ed.termination_type != 'Unknown'
GROUP BY ed.employee_type, ed.termination_type
ORDER BY ed.employee_type, average_tenure_years DESC;
-- Observation: These results indicate that while there are slight variations, the overall pattern is one of very short tenure for employees who exit, regardless of their employment classification or the specific reason for their departure.

-- 5. DEPARTMENTAL & JOB FUNCTION ANALYSIS

-- (A). WHICH DEPARTMENTS HAVE THE HIGHEST EMPLOYEE ATTRITION RATES?
SELECT
    ed.department_type,
    COUNT(ed.emp_id) AS total_employees,
    SUM(CASE WHEN ed.exit_date IS NOT NULL THEN 1 ELSE 0 END) AS exited_employees,
    (SUM(CASE WHEN ed.exit_date IS NOT NULL THEN 1 ELSE 0 END)::numeric * 100.0) / COUNT(ed.emp_id)::numeric AS attrition_rate
FROM employee_data AS ed
GROUP BY ed.department_type
ORDER BY attrition_rate DESC;
-- Observation: The 'Executive Office' department stands out significantly with an attrition rate of approximately 79.17%. While it has a smaller total number of employees, this rate is exceptionally high.

-- (B). ARE CERTAIN DIVISIONS EXPERIENCING MORE INVOLUNTARY TERMINATIONS THAN OTHERS?
SELECT
    ed.division,
    COUNT(ed.emp_id) AS total_employees,
    SUM(CASE
            WHEN ed.termination_type IN ('Involuntary', 'Layoff') THEN 1
            ELSE 0
        END) AS involuntary_termination_count,
    (SUM(CASE
            WHEN ed.termination_type IN ('Involuntary', 'Layoff') THEN 1
            ELSE 0
        END)::numeric * 100.0) / COUNT(ed.emp_id)::numeric AS percentage_involuntary_termination
FROM employee_data AS ed
WHERE ed.termination_type IS NOT NULL -- Only consider employees with a recorded termination type
GROUP BY ed.division
ORDER BY percentage_involuntary_termination DESC;
-- Observation: While some divisions might have fewer total employees but high percentages, there are larger divisions like 'Engineers' and 'Field Operations' which, despite their size, still have notable numbers of involuntary terminations. 

-- (C). WHAT IS THE AVERAGE TENURE PER JOB FUNCTION?
SELECT
    ed.title AS job_function,
    AVG(
        EXTRACT(YEAR FROM AGE(ed.exit_date, ed.start_date)) +
        EXTRACT(MONTH FROM AGE(ed.exit_date, ed.start_date)) / 12.0 +
        EXTRACT(DAY FROM AGE(ed.exit_date, ed.start_date)) / 365.25
    ) AS average_tenure_years
FROM employee_data AS ed
WHERE
    ed.exit_date IS NOT NULL -- Only consider exited employees for tenure calculation
    AND ed.title IS NOT NULL -- Ensure job function is recorded
GROUP BY ed.title
ORDER BY average_tenure_years DESC;
-- Observation: Overall, the average tenure varies significantly by job function, highlighting specific areas of strength in retention (e.g., certain IT and leadership roles) and areas of concern (e.g., some highly specialized IT/Data Architect roles, and senior leadership like CIO).

-- 6. PERFORMANCE & COMPENSATION INSIGHTS

-- (A). HOW DOES EMPLOYEE CLASSIFICATION IMPACT PERFORMANCE RATINGS?
SELECT
    ed.employee_classification_type,
    AVG(
        CASE ed.performance_score
            WHEN 'Exceeds' THEN 4.0
            WHEN 'Fully Meets' THEN 3.0
            WHEN 'Needs Improvement' THEN 2.0
            WHEN 'PIP' THEN 1.0
            ELSE NULL -- Handle any unexpected values
        END
    ) AS avg_performance_score,
    AVG(ed.current_employee_rating) AS avg_current_employee_rating
FROM employee_data AS ed
GROUP BY ed.employee_classification_type
ORDER BY avg_performance_score DESC;
-- Observations: While Part-Time employees show a slight edge in current_employee_rating, the formal performance_score averages are practically the same for all classifications.

-- (B). DO CERTAIN BUSINESS UNITS HAVE A HIGHER PERCENTAGE OF LOW-PERFORMING EMPLOYEES?
SELECT
    ed.business_unit,
    COUNT(ed.emp_id) AS total_employees,
    SUM(CASE
            WHEN ed.performance_score = 'Needs Improvement' THEN 1
            WHEN ed.performance_score = 'PIP' THEN 1
            ELSE 0
        END) AS low_performing_count,
    (SUM(CASE
            WHEN ed.performance_score = 'Needs Improvement' THEN 1
            WHEN ed.performance_score = 'PIP' THEN 1
            ELSE 0
        END)::numeric * 100.0) / COUNT(ed.emp_id)::numeric AS percentage_low_performing
FROM employee_data AS ed
WHERE ed.performance_score IS NOT NULL
GROUP BY ed.business_unit
ORDER BY percentage_low_performing DESC;
-- Observation: Certain business units, particularly PYZ (12.04% low-performing), BPC (10.56%), and MSC (10.47%), had a noticeably higher percentage of low-performing employees ('Needs Improvement' or 'PIP'). This indicates potential areas for targeted performance management interventions.

-- ANALYZING THE PYZ BUSINESS UNIT

-- 1. Demographic Breakdown (by age group)
SELECT
    CASE
        WHEN ed.age BETWEEN 20 AND 35 THEN '20-35'
        WHEN ed.age BETWEEN 36 AND 55 THEN '36-55'
        WHEN ed.age BETWEEN 56 AND 70 THEN '56-70'
        ELSE 'Over 70'
    END AS age_group,
    COUNT(*) AS low_performing_count
FROM employee_data AS ed
WHERE ed.business_unit = 'PYZ' AND ed.performance_score IN ('Needs Improvement', 'PIP')
GROUP BY age_group
ORDER BY low_performing_count DESC;
-- This pattern suggests that performance issues in the PYZ business unit are more prevalent in older employees.

-- 2. Job Role Analysis
WITH PYZEmployeePerformance AS (
    SELECT
        title,
        CASE
            WHEN performance_score IN ('Needs Improvement', 'PIP') THEN 1
            ELSE 0
        END AS is_low_performer
    FROM employee_data
    WHERE business_unit = 'PYZ' AND performance_score IS NOT NULL
)
SELECT
    title,
    COUNT(*) AS total_in_title,
    SUM(is_low_performer) AS low_performing_count,
    ROUND((SUM(is_low_performer)::numeric * 100) / COUNT(*)::numeric, 2) AS percentage_low_performing
FROM PYZEmployeePerformance
GROUP BY title
ORDER BY percentage_low_performing DESC;
