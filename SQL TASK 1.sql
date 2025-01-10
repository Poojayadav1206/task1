-- task 1
CREATE TABLE EmployeeDetails (
    EmployeeID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL, 
    LastName VARCHAR(50) NOT NULL, 
    Email VARCHAR(100) UNIQUE NOT NULL, 
    PhoneNumber VARCHAR(15) UNIQUE, 
    HireDate DATE NOT NULL, 
    Salary DECIMAL(10, 2) CHECK (Salary >= 0), 
    DepartmentID INT NOT NULL, 
    IsActive BOOLEAN DEFAULT TRUE, 
    JobTitle VARCHAR(100) NOT NULL 
);
-- task 2
INSERT INTO EmployeeDetails 
(FirstName, LastName, Email, PhoneNumber, HireDate, Salary, DepartmentID, IsActive, JobTitle)
VALUES 
('John', 'Doe', 'john.doe@example.com', '1234567890', '2021-06-15', 60000.00, 1, TRUE, 'Software Engineer');

INSERT INTO EmployeeDetails 
(FirstName, LastName, Email, PhoneNumber, HireDate, Salary, DepartmentID, IsActive, JobTitle)
VALUES 
('Jane', 'Smith', 'jane.smith@example.com', '1234567891', '2022-01-20', 75000.00, 2, TRUE, 'Data Analyst');

INSERT INTO EmployeeDetails 
(FirstName, LastName, Email, PhoneNumber, HireDate, Salary, DepartmentID, IsActive, JobTitle)
VALUES 
('Alice', 'Johnson', 'alice.johnson@example.com', '1234567892', '2020-09-10', 82000.00, 3, FALSE, 'Project Manager');

INSERT INTO EmployeeDetails 
(FirstName, LastName, Email, PhoneNumber, HireDate, Salary, DepartmentID, IsActive, JobTitle)
VALUES 
('Robert', 'Brown', 'robert.brown@example.com', '1234567893', '2019-03-05', 55000.00, 1, TRUE, 'Quality Assurance Engineer');

INSERT INTO EmployeeDetails 
(FirstName, LastName, Email, PhoneNumber, HireDate, Salary, DepartmentID, IsActive, JobTitle)
VALUES 
('Emily', 'Davis', 'emily.davis@example.com', '1234567894', '2023-07-18', 68000.00, 2, TRUE, 'Business Analyst');

SELECT * FROM EmployeeDetails;

-- task 3
COPY EmployeeDetails (FirstName, LastName, Email, PhoneNumber, HireDate, Salary, DepartmentID, IsActive, JobTitle)
FROM '/path/to/file.csv'
DELIMITER ','
CSV HEADER;

-- task 4
UPDATE EmployeeDetails
SET DepartmentID = 0
WHERE IsActive = FALSE;

-- task 5
UPDATE EmployeeDetails
SET Salary = Salary * 1.08
WHERE IsActive = FALSE AND DepartmentID = 0 AND JobTitle IN ('Software Engineer', 'Data Analyst', 'Project Manager', 'Quality Assurance Engineer','Business Analyst');

-- task 6
SELECT FirstName AS Name, LastName AS Surname
FROM EmployeeDetails
WHERE Salary BETWEEN 30000 AND 50000;

-- task 7
SELECT * FROM EmployeeDetails
WHERE FirstName LIKE 'A%';

-- task 8
DELETE FROM EmployeeDetails
WHERE EmployeeID BETWEEN 1 AND 5;

-- task 9
ALTER TABLE EmployeeDetails RENAME TO employee_database;

ALTER TABLE employee_database RENAME COLUMN FirstName TO Name;
ALTER TABLE employee_database RENAME COLUMN LastName TO Surname;

-- task 10
ALTER TABLE employee_database ADD COLUMN State VARCHAR;

UPDATE employee_database
SET State = CASE
  WHEN IsActive = TRUE THEN 'India'
  WHEN IsActive = FALSE THEN 'USA'
END;

ALTER TABLE employee_database ALTER COLUMN State SET NOT NULL;