-- Using Mysql Database


-- Find all the departments where the minimum salary is less than 2000
SELECT
    department_name,
    department_id
FROM
    departments
WHERE
    department_id IN (
        SELECT
            department_id
        FROM
            employees
        WHERE
            salary < 2000
    );
    

-- Find all the countries where no employees exist.
SELECT
    country_id,
    country_name
FROM
    countries
WHERE
    country_id NOT IN (
        SELECT
            country_id
        FROM
            locations
        WHERE
            location_id IN (
                SELECT
                    location_id
                FROM
                    departments
                WHERE
                    department_id IN (
                        SELECT
                            department_id
                        FROM
                            employees
                    )
            )
    );


-- From the following tables write a query to find all the jobs, having at least 2 employees in a single department.
SELECT
    job_id,
    job_title
FROM
    jobs
WHERE
    job_id IN (
        SELECT
            job_id
        FROM
            employees
        WHERE
            department_id IN(
                SELECT
                    department_id
                FROM
                    (
                        SELECT
                            DISTINCT department_id,
                            (
                                SELECT
                                    COUNT(employee_id)
                                FROM
                                    employees e1
                                WHERE
                                    e1.department_id = e2.department_id
                            ) as emp_count
                        FROM
                            employees e2
                    ) t1
                WHERE
                    emp_count >= 2
            )
    );


-- From the following tables write a query to find all the countries, having cities with all the city names starting with 'a'
SELECT
    country_id,
    country_name
FROM
    countries
WHERE
    country_id IN (
        SELECT
            country_id
        FROM
            locations
        WHERE
            city IN (
                SELECT
                    city
                FROM
                    locations
                WHERE
                    city = ANY (
                        SELECT
                            city
                        FROM
                            locations
                        WHERE
                            city LIKE "a%"
                    )
            )
    );


-- From the following tables write a query to find all the departments, having no cities.
SELECT
    department_id,
    department_name
FROM
    departments
WHERE
    location_id IN (
        SELECT
            location_id
        FROM
            locations
        WHERE
            NOT EXISTS (
                SELECT
                    city
                FROM
                    locations
            )
    );
