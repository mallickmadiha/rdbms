-- Using Mysql Database


-- From the following tables write a SQL query to find the details of an employee. Return full name, email, salary, Department Name, postal code, and City
SELECT
  CONCAT(e.first_name, " ", e.last_name) as full_name,
  e.email,
  e.salary,
  d.department_name,
  l.pincode,
  l.city
FROM
  employees as e
  JOIN departments as d ON e.employee_id = d.department_id
  JOIN locations as l ON l.location_id = d.department_id;



-- From the following tables write a SQL query to find the departments whose location is in "Jammu Kashmir" or "Jharkhand". Return Department Name, state_province, street_address.
SELECT
  d.department_name,
  l.state_province,
  l.street_address
FROM
  departments as d
  JOIN locations as l ON d.department_id = l.location_id
WHERE
  l.state_province IN ('Jammu Kashmir', 'Jharkhand');



-- From the following tables write a SQL query to find the count of employees present in different jobs whose average salary is greater than 10,000. Return all the jobs with employee count, Job Name, and average salary
SELECT
  COUNT(e.employee_id) as emp_count,
  j.job_title,
  AVG(e.salary) as avg_sal
FROM
  employees as e
  JOIN jobs as j ON e.job_id = j.job_id
GROUP BY
  e.job_id
HAVING
  avg_sal > 10000;



-- From the following table write a SQL query to find all the first_names and last_names in both dependents and employees tables. Return the duplicate records as well and order the records in descending order of the last_name column
SELECT
  first_name,
  last_name
FROM
  employees
UNION
SELECT
  first_name,
  last_name
FROM
  dependents
ORDER BY
  last_name DESC;



-- From the following table write a SQL query to list every employee that has a manager with the name of his or her manager.
SELECT
  e.employee_id,
  e.first_name,
  e.last_name,
  m.manager_id,
  m.first_name,
  m.last_name
FROM
  employees as e
  JOIN employees as m ON e.manager_id = m.employee_id
WHERE
  m.first_name = e.first_name
  AND m.last_name = e.last_name;



-- Find the departments that have more than 5 employees earning a salary greater than 50,000 and are located in either New York or California. Include the department name, location, and the number of employees meeting the criteria
SELECT
  COUNT(e.employee_id) as emp_count,
  d.department_name,
  l.state_province
FROM
  employees as e
  JOIN departments as d ON e.department_id = d.department_id
  JOIN locations as l ON d.location_id = l.location_id
WHERE
  e.salary > 50000
  AND l.state_province IN ('New York', 'California')
GROUP BY
  d.department_id
HAVING
  emp_count > 1;



-- List any employees who have dependents and have a job title that includes the word 'manager', and sort the results by department name in ascending order
SELECT
  e.employee_id,
  dp.department_name,
  j.job_title
FROM
  employees as e
  JOIN dependents as d ON d.employee_id = e.employee_id
  JOIN jobs as j ON e.job_id = j.job_id
  JOIN departments as dp ON e.department_id = dp.department_id
WHERE
  j.job_title LIKE concat('%', "manager", '%')
ORDER BY
  dp.department_name;



-- Add a column in the dependent table called “city” depicting their current location of stay. 
AlTER TABLE
  dependents
ADD
  City VARCHAR(255);

UPDATE
  dependents
SET
  city = 'Kolkata'
WHERE
  dependent_id = 1;

UPDATE
  dependents
SET
  city = 'Seattle'
WHERE
  dependent_id = 2;

UPDATE
  dependents
SET
  city = 'Jharkhand'
WHERE
  dependent_id = 3;

UPDATE
  dependents
SET
  city = 'Seattle'
WHERE
  dependent_id = 4;

UPDATE
  dependents
SET
  city = 'Bangalore'
WHERE
  dependent_id = 5;



-- Find all employees who have been hired in the past 3 years and have dependents living in a city that is different from the city they work in (if I work in Kolkata, then my dependent should not be in Kolkata). Additionally, only include employees whose salary is greater than the average salary of their job title(suppose, my job_title is ”developer” and the salary is 80k, and the average salary under the same job_title “developer” is 70k), and whose manager's job title includes the word 'director'. Finally, include the department name and location of each employee, and sort the results by department name in ascending order
SELECT
  COUNT(e.employee_id),
  j.job_title,
  AVG(e.salary) as avg_sal,
  dp.department_name,
  e.manager_id,
  l.state_province
FROM
  employees as e
  JOIN departments as dp ON e.department_id = dp.department_id
  JOIN locations as l ON dp.department_id = l.location_id
  JOIN dependents as d ON d.dependent_id = e.employee_id
  JOIN jobs as j ON e.job_id = j.job_id
  JOIN employees as m ON m.manager_id = j.job_id
WHERE
  e.hire_date < DATE_SUB(CURDATE(), INTERVAL 3 YEAR)
  AND e.salary > (
    SELECT
      AVG(salary)
    FROM
      employees
    WHERE
      job_id = e.job_id
  )
  AND (
    SELECT
      job_title
    FROM
      jobs as j1
    WHERE
      j1.job_id = m.job_id
  ) LIKE concat('%', "director", '%')
  AND d.City != l.city
GROUP BY
  e.job_id,
  dp.department_name,
  l.state_province,
  e.manager_id;
