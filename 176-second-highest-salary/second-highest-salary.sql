-- Write your PostgreSQL query statement below
--SELECT MAX(SALARY) AS SecondHighestSalary  FROM EMPLOYEE WHERE SALARY NOT IN (SELECT MAX(SALARY) FROM EMPLOYEE)

WITH CTE_SAL AS (
    SELECT 
        salary, 
        DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk 
    FROM Employee
) 
SELECT MAX(salary) AS SecondHighestSalary 
FROM CTE_SAL 
WHERE rnk = 2;
