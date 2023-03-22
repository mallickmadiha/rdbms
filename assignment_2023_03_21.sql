
-- Using Mysql Database

-- Write the query to get the department and department wise total(sum) salary, display it in ascending order according to salary.

SELECT d.department_name, SUM(e.salary) from employees as e, departments as d
WHERE e.department_id = d.department_id
GROUP BY d.department_name;

-- Write the query to get the department, total no. employee of each department, total(sum) salary with respect to department from "Employee" table.

SELECT d.department_name, COUNT(e.employee_id), SUM(e.salary) from employees as e, departments as d 
WHERE e.department_id = d.department_id
GROUP BY d.department_name;

-- Get department wise maximum salary from "Employee" table order by salary ascending

SELECT MAX(e.salary) as max_salary, d.department_name from employees as e, departments as d 
WHERE e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY max_salary;  

-- Write a query to get the departments where average salary is more than 60k

SELECT d.department_name, AVG(e.salary) as avg_salary from employees as e, departments as d 
WHERE e.department_id = d.department_id
GROUP BY d.department_name
HAVING avg_salary > 60000;


-- Write down the query to fetch department name assign to more than one Employee

SELECT d.department_name, COUNT(e.employee_id) as employee_count from employees as e, departments as d 
WHERE e.department_id = d.department_id
GROUP BY d.department_name
HAVING employee_count > 1;


-- Write a query to show department_name and assigned To where assigned To will be "One candidate" if its assigned to only one employee otherwise "Multiple candidates"

SELECT d.department_name,
CASE WHEN COUNT(e.employee_id) = 1 
THEN "One candidate" 
ELSE "Multiple candidates" 
END AS assigned_to
FROM employees as e, departments as d 
WHERE e.department_id = d.department_id
GROUP BY d.department_name;
