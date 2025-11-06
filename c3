-- Clean up previous tables (Ensures a fresh start)
DROP TABLE IF EXISTS EMP;
DROP TABLE IF EXISTS DEPT;

-- 1. Create the DEPT table first (Parent table)
CREATE TABLE DEPT (
    deptId INT PRIMARY KEY,              -- Set appropriate primary key
    deptName VARCHAR(10)
);

-- 5. Add column deptLoc varchar(10) to dept table (Done immediately after creation for simplicity)
-- 4. Add Unique constraint to deptLoc
ALTER TABLE DEPT
ADD deptLoc VARCHAR(10) UNIQUE;

-- 1. Create the EMP table (Child table)
CREATE TABLE EMP (
    empId INT PRIMARY KEY,               -- Set appropriate primary key
    empName VARCHAR(10) NOT NULL,        -- 2. Add Not Null constraint to empName
    empSal INT,
    empDeptId INT,
    -- Set appropriate Foreign key: Links empDeptId in EMP to deptId in DEPT
    FOREIGN KEY (empDeptId) REFERENCES DEPT(deptId)
);

-- 3. Insert Records

-- Insert records into DEPT first (Parent table data)
INSERT INTO DEPT (deptId, deptName, deptLoc) VALUES
(10, 'HR', 'Mumbai'),
(20, 'IT', 'Pune'),
(30, 'Sales', 'Delhi');

-- Insert records into EMP (Child table data)
INSERT INTO EMP (empId, empName, empSal, empDeptId) VALUES
(101, 'Alice', 55000, 20),
(102, 'Bob', 45000, 10),
(103, 'Charlie', 70000, 20),
(104, 'David', 60000, 30);

SELECT * FROM DEPT;

SELECT * FROM EMP;

SELECT E.empName, D.deptName, D.deptLoc FROM EMP E JOIN DEPT D ON E.empDeptId = D.deptId;
