-- create and select the database
DROP DATABASE IF EXISTS company;
CREATE DATABASE company;
USE company;

-- create the tables
CREATE TABLE depts (
  deptID       INT(11)        NOT NULL AUTO_INCREMENT,
  deptName     VARCHAR(255)   NOT NULL,
  PRIMARY KEY (deptID)
);

CREATE TABLE emps (
  empID        INT(11)        NOT NULL  AUTO_INCREMENT,
  deptID       INT(11)        NOT NULL,
  empCode      VARCHAR(50)    NOT NULL   UNIQUE,
  empName      VARCHAR(255)   NOT NULL,
  empSalary    DECIMAL(10,2)  NOT NULL,
  PRIMARY KEY (empID)
);
ALTER TABLE emps
ADD FOREIGN KEY (deptID) REFERENCES depts(deptID);
-- insert data into the database
INSERT INTO depts(deptName) VALUES
('INFORMATION TECHNOLOGY'),
('ACCOUNTING'),
('PRODUCTION');

INSERT INTO emps(deptID,empCode,empName,empSalary) VALUES
( 1, 'DB Developer', 'Albert Einstein', '5000.00'),
( 1, 'DB Administrator', 'Marlene Dietrich', '9000.00'),
( 1, 'IT Manager', 'Jacky Kennedy', '7500.00'),
( 2, 'Main Accountant', 'Jimmy Carter', '12000.00'),
( 2, 'Accounts Receivable', 'Rob Ford', '3300.00');

-- create the users and grant priveleges to those users
GRANT SELECT, INSERT, DELETE, UPDATE
ON company.*
TO mgs_user@localhost
IDENTIFIED BY 'pwd';

GRANT SELECT
ON emps
TO mgs_tester@localhost
IDENTIFIED BY 'pwd';

GRANT SELECT
ON depts
TO mgs_tester@localhost
IDENTIFIED BY 'pwd';

