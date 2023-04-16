-- Using Mysql Database
-- Create a trigger to fill up the full_name column in the dependents table while
-- inserting any new records.
ALTER TABLE
    dependents
ADD
    full_name VARCHAR(255);

CREATE TRIGGER dependents_trigger BEFORE
INSERT
    ON dependents FOR EACH ROW
SET
    NEW.full_name = concat(NEW.first_name, " ", NEW.last_name);

--  Create a trigger that stores the transaction records of each insert, update and
-- delete operations performed on the locations table into locations_info table
CREATE TABLE locations_info (
    location_id INT NOT NULL UNIQUE AUTO_INCREMENT,
    street_address VARCHAR(255),
    postal_code VARCHAR(255),
    city VARCHAR(255),
    state_province VARCHAR(255),
    country_id VARCHAR(255),
    action_performed VARCHAR(255)
);

CREATE TRIGGER locations_trigger
AFTER
INSERT
    ON locations FOR EACH ROW
INSERT INTO
    locations_info (
        street_address,
        postal_code,
        city,
        state_province,
        country_id,
        action_performed
    )
VALUES
    (
        NEW.street_address,
        NEW.pincode,
        NEW.city,
        NEW.state_province,
        NEW.country_id,
        'insert'
    );

-- For the following tables create a view named employee_information with
-- employee first name, last name, salary, department name, city, postal code insert
-- only those records whose postal code length is less than 5
CREATE VIEW employee_information AS
SELECT
    e.first_name,
    e.last_name,
    e.salary,
    d.department_name,
    l.city,
    l.pincode
FROM
    employees AS e
    JOIN departments AS d ON e.department_id = d.department_id
    JOIN locations AS l ON d.location_id = l.location_id
WHERE
    LENGTH(l.pincode) < 5;

SELECT
    *
FROM
    employee_information;

-- Explain ACID properties with an example
ACID stands for Atomicity,
Consistency,
Isolation,
Durability.- Atomicity means that a transaction is treated as a single unit.If any part of the transaction fails,
the entire transaction fails
and the database is left unchanged.- Consistency means that a transaction can only bring the database
from
    one valid state to another.- Isolation means that the concurrent execution of transactions results in a system state that would be obtained if transactions were executed serially,
    i.e.,
    one
after
    the other.- Durability means that once a transaction has been committed,
    it will remain so,
    even in the case
        of power loss,
        crashes,
        or errors.Example: Suppose you are a bank manager
        and you have to transfer money
        from
            one account to another.- Atomicity: If the transaction fails,
            the money should not be transferred
        from
            one account to another.- Consistency: The transaction should only bring the database
        from
            one valid state to another.For example,
            the amount in the senders account should be greater than the amount to be transferred.- Isolation: The concurrent execution of transactions should not result in a system state that would not be obtained if transactions were executed serially.- Durability: Once a transaction has been committed,
            it should remain so,
            even in the case
                of power loss,
                crashes,
                or errors.--  Answer the above question with explanation
                Here if we sort the occupation column in the table in Lexicographical order,
                the result will be: CON - 1 ENG - 3 DOC - 2 SER - 5 MUS - 4 So Here we can say that the occupation column is used for indexing.