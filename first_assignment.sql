-- jobs table

CREATE TABLE jobs 
(
  job_id INT UNIQUE NOT NULL AUTO_INCREMENT,
  job_title VARCHAR(255), 
  min_salary FLOAT, 
  max_salary FLOAT,
  PRIMARY KEY (job_id)
);

INSERT INTO jobs 
(job_title, min_salary, max_salary)
VALUES 
( 'SDE1', 45000, 85000),
( 'Doctor', 45000, 750000),
( 'Pilot', 150000, 350000),
( 'Teacher', 25000, 45000),
( 'Officer', 100000, 250000);



-- regions table

CREATE TABLE regions
(
    region_id INT UNIQUE NOT NULL AUTO_INCREMENT,
    region_name VARCHAR(255),
    PRIMARY KEY (region_id)
);

INSERT INTO regions
(region_name)
VALUES
  ('Western Europe'),
  ('Asia'),
  ('Africa'),
  ('Middle East'),
  ('Eastern Europe');


-- countries table

CREATE TABLE countries
(
  country_id INT NOT NULL UNIQUE AUTO_INCREMENT,
  country_name VARCHAR(255),
  region_id INT,
  FOREIGN KEY (region_id) REFERENCES regions(region_id),
  PRIMARY KEY (country_id)
);

INSERT INTO countries
(country_name, region_id)
VALUES
('India',1 ),
('Switzerland',2),
('Canada',2),
('Japan',5),
('Australia',3);



-- locations table

CREATE TABLE locations
(
  location_id INT NOT NULL UNIQUE AUTO_INCREMENT,
  street_address VARCHAR(255),
  postal_code INT,
  city VARCHAR(255),
  state_province VARCHAR(255),
  country_id INT,
  FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

INSERT INTO locations
(street_address, postal_code, city, state_province, country_id)
VALUES
(
  '2004 Charade Rd', 98199, 'Seattle', 'Washington', 1
),
(
  '2088 W Yakima Ave', 98902, 'Yakima', 'Kentucky', 2

),
(
  '1827 E Elwood St', 85016, 'Phoenix', 'Arizona', 1
),

(
  '1557 Watson Blvd', 98199, 'Seattle', 'Washington', 3
),
(
  '1021 Lillydale Dr', 98199, 'Seattle', 'Washington', 2
);



-- departments table

CREATE TABLE departments
(
  department_id INT NOT NULL UNIQUE AUTO_INCREMENT,
  department_name VARCHAR(255),
  location_id INT,
  FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

INSERT INTO departments
(department_name, location_id)
VALUES
('General Manager', 1),
('Marketing Department', 5),
('Operations Department',4),
('Finance Department',1 ),
('Sales Department', 3);



-- employees table

CREATE TABLE employees
(
    employee_id INT UNIQUE NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    phone_number VARCHAR(255),
    hire_date DATE,
    salary FLOAT,
    job_id INT,
    manager_id INT,
    department_id INT,
    FOREIGN KEY (job_id) REFERENCES jobs(job_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);

INSERT INTO employees
(first_name, last_name, email, phone_number, hire_date, salary, job_id, manager_id, department_id)
VALUES
('John', 'Doe', 'John@gmail.com' , '1234567890', '2019-01-01', 45000, 1, NULL, 2),
('Abir' , 'Doe', 'Abir@gmail.com' , '1123456789', '2019-01-01', 67000, 2, 1, 1),
('Shumbham' , 'Doe', 'shubham@gmail.com' , '1233456789', '2019-01-01', 87000,5, 1, 1),
('Shams' , 'Doe', 'shams@gmail.com' , '1234564789', '2019-01-01', 77000,3,  2, 1),
('Keshri' , 'Doe', 'keshri@gmail.com' , '1234565789', '2019-01-01', 10000,1, 1, 4),
('Shalini' , 'Doe', 'shalini@gmail.com' , '1234567902', '2019-01-01', 45892,3, 3, 5),
('Avinash' , 'Doe', 'avinash@gmail.com' , '12345678402', '2019-01-01', 35000, 2,2, 2),
('Tim' , 'Doe', 'tim@gmail.com' , '1234567905', '2019-01-01', 24000,5, 3, 3),
('Madiha' , 'Doe', 'madiha@gmail.com' , '1234578902', '2019-01-01', 22000, 4, 3, 2),
('Ankit' , 'Doe', 'ankit@gmail.com' , '1234568905', '2019-01-01', 63000,2, 1, 1);



-- dependents table

CREATE TABLE dependents
(
  dependent_id INT NOT NULL UNIQUE AUTO_INCREMENT,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  relationship VARCHAR(255),
  employee_id INT,
  FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO dependents
(first_name, last_name, relationship, employee_id)
VALUES
('Harry', 'Styles', 'son', 1),
('Louis', 'Tomlinson', 'son', 10),
('Niall', 'Horan', 'son', 8),
('Zayn', 'Malik', 'son', 6),
('Liam', 'Payne', 'son', 4);



-- Questions:


-- In departments table, add a new field ‘manager_name’ of type VARCHAR

ALTER TABLE departments ADD manager_name VARCHAR(255);


-- REMOVE field max_salary from jobs. 

AlTER TABLE jobs DROP max_salary;

-- In the locations table, rename postal_code column to pincode

ALTER TABLE locations RENAME COLUMN postal_code to pincode;

-- First_name and last_name should not be null

ALTER TABLE employees
MODIFY COLUMN first_name VARCHAR(255) NOT NULL;

ALTER TABLE employees
MODIFY COLUMN last_name VARCHAR(255) NOT NULL;


ALTER TABLE dependents
MODIFY COLUMN first_name VARCHAR(255) NOT NULL;

ALTER TABLE dependents
MODIFY COLUMN last_name VARCHAR(255) NOT NULL;


-- Min_salary must be greater than 1000

ALTER TABLE jobs ADD CHECK( min_salary>1000);

-- Max length of postal_code should be 10.

ALTER TABLE locations ADD CHECK( LENGTH(pincode) <= 10);