
ALTER TABLE hr_employee RENAME TO employee;

SELECT * FROM employee LIMIT 5;

-- 1 Total employees and overview
SELECT 
    COUNT(*) AS total_employees,
    COUNT(DISTINCT department) AS total_departments,
    ROUND(AVG(salary)::numeric, 2) AS avg_salary,
    ROUND(AVG(experienceyears)::numeric, 1) AS avg_experience
FROM employee;

-- 2 Employee count by department
SELECT department, COUNT(*) AS total_employees
FROM employee
GROUP BY department
ORDER BY total_employees DESC;

-- 3 Gender distribution
SELECT gender, 
    COUNT(*) AS count,
    ROUND(COUNT(*)*100.0/SUM(COUNT(*)) OVER(), 2) AS percentage
FROM employee
GROUP BY gender;

-- 4. Average salary by department
SELECT department,
    ROUND(AVG(salary)::numeric, 2) AS avg_salary,
    ROUND(MIN(salary)::numeric, 2) AS min_salary,
    ROUND(MAX(salary)::numeric, 2) AS max_salary
FROM employee
GROUP BY department
ORDER BY avg_salary DESC;

-- 7 Salary by job title
SELECT jobtitle,
    COUNT(*) AS employees,
    ROUND(AVG(salary)::numeric, 2) AS avg_salary
FROM employee
GROUP BY jobtitle
ORDER BY avg_salary DESC;

-- 8. Experience vs salary analysis
SELECT 
    CASE 
        WHEN experienceyears <= 2 THEN '0-2 Years'
        WHEN experienceyears BETWEEN 3 AND 7 THEN '3-7 Years'
        WHEN experienceyears BETWEEN 8 AND 15 THEN '8-15 Years'
        ELSE 'Above 15 Years'
    END AS experience_band,
    COUNT(*) AS employees,
    ROUND(AVG(salary)::numeric, 2) AS avg_salary
FROM employee
GROUP BY experience_band
ORDER BY avg_salary DESC;


-- 9 Top 5 highest paid employees
SELECT employeename, department, jobtitle,
    ROUND(salary::numeric, 2) AS salary,
    experienceyears
FROM employee
ORDER BY salary DESC
LIMIT 5;

-- 10. Department wise performance ranking
SELECT department,
    ROUND(AVG(performancescore)::numeric, 2) AS avg_performance,
    RANK() OVER(ORDER BY AVG(performancescore) DESC) AS performance_rank
FROM employee
GROUP BY department;

-- 11. Salary vs performance correlation
SELECT performancescore,
    COUNT(*) AS employees,
    ROUND(AVG(salary)::numeric, 2) AS avg_salary,
    ROUND(AVG(experienceyears)::numeric, 1) AS avg_experience
FROM employee
GROUP BY performancescore
ORDER BY performancescore DESC;

---12. Projects handled vs performance
SELECT projectshandled,
    COUNT(*) AS employees,
    ROUND(AVG(performancescore)::numeric, 2) AS avg_performance,
    ROUND(AVG(salary)::numeric, 2) AS avg_salary
FROM employee
GROUP BY projectshandled
ORDER BY projectshandled DESC;

--13. Complete HR summary
SELECT
    COUNT(*) AS total_employees,
    COUNT(DISTINCT department) AS departments,
    ROUND(AVG(salary)::numeric, 2) AS avg_salary,
    ROUND(AVG(experienceyears)::numeric, 1) AS avg_experience,
    ROUND(AVG(performancescore)::numeric, 2) AS avg_performance,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS total_attrition,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*), 2) AS attrition_rate,
    ROUND(AVG(projectshandled)::numeric, 1) AS avg_projects
FROM employee;