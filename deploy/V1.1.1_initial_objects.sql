CREATE SCHEMA IF NOT EXISTS GITHUB.HRDATA;

CREATE TABLE IF NOT EXISTS HRDATA.EMPLOYEES
(
    EMPLOYEE_ID NUMBER(10),
    FIRST_NAME VARCHAR(20),
    LAST_NAME VARCHAR(20),
    EMAIL VARCHAR(20),
    PHONE_NUMBER INT,
    HIRE_DATE DATE NOT NULL,
    JOB_ID VARCHAR(20),
    SALARY INT,
    COMMISION_PCT INT,
    MANAGER_ID INT,
    DEPT_ID INT,
    PRIMARY KEY (EMPLOYEE_ID)
);

CREATE TABLE IF NOT EXISTS HRDATA.DEPARTMENT
(
    DEPT_ID INT,
    DEPARTMENT_NAME VARCHAR(20) NOT NULL,
    MANAGER_ID INT,
    LOCATION_ID INT,
    PRIMARY KEY(DEPT_ID)
);

-- Example for inserting 10 records, you can repeat this block for 100 records.
INSERT INTO HRDATA.EMPLOYEES 
(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISION_PCT, MANAGER_ID, DEPT_ID) 
VALUES
(1, 'John', 'Doe', 'john.doe1@example.com', 1234567890, '2022-01-15', 'JOB01', 50000, 10, 2, 10),
(2, 'Jane', 'Smith', 'jane.smith2@example.com', 1234567891, '2022-02-18', 'JOB02', 55000, 12, 3, 11),
(3, 'Alice', 'Johnson', 'alice.johnson3@example.com', 1234567892, '2022-03-12', 'JOB03', 60000, 14, 4, 12),
(4, 'Bob', 'Brown', 'bob.brown4@example.com', 1234567893, '2022-04-21', 'JOB04', 65000, 15, 5, 13),
(5, 'Charlie', 'Davis', 'charlie.davis5@example.com', 1234567894, '2022-05-10', 'JOB01', 70000, 16, 6, 14),
(6, 'David', 'Wilson', 'david.wilson6@example.com', 1234567895, '2022-06-07', 'JOB02', 75000, 18, 7, 10),
(7, 'Emma', 'Taylor', 'emma.taylor7@example.com', 1234567896, '2022-07-03', 'JOB03', 80000, 20, 8, 11),
(8, 'Frank', 'Moore', 'frank.moore8@example.com', 1234567897, '2022-08-14', 'JOB04', 85000, 22, 9, 12),
(9, 'Grace', 'Anderson', 'grace.anderson9@example.com', 1234567898, '2022-09-23', 'JOB01', 90000, 25, 10, 13),
(10, 'Hannah', 'Thomas', 'hannah.thomas10@example.com', 1234567899, '2022-10-29', 'JOB02', 95000, 28, 11, 14);

INSERT INTO HRDATA.DEPARTMENT 
(DEPT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID) 
VALUES
(1, 'HR', 101, 1001),
(2, 'Finance', 102, 1002),
(3, 'IT', 103, 1003),
(4, 'Marketing', 104, 1004),
(5, 'Sales', 105, 1005),
(6, 'Operations', 106, 1006),
(7, 'Legal', 107, 1007),
(8, 'Customer Service', 108, 1008),
(9, 'R&D', 109, 1009),
(10, 'Procurement', 110, 1010);
