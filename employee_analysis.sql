-- Project: Employee Department Analysis
-- Concepts: GROUP BY, HAVING, SUBQUERY, JOINS

CREATE TABLE department (dept_id INT PRIMARY KEY, dept_name VARCHAR(50), location VARCHAR(50));
CREATE TABLE employee (emp_id INT PRIMARY KEY, emp_name VARCHAR(50), salary INT, dept_id INT);

-- Q1: What is the maximum salary in each department?
SELECT dept_id, MAX(salary) as max_sal FROM employee GROUP BY dept_id;

-- Q2: Which departments have more than one employee?
SELECT dept_id, COUNT(*) as total_emp FROM employee GROUP BY dept_id HAVING COUNT(*) > 1;

-- Q3: Employees earning more than average salary (Single-row subquery)
SELECT * FROM employee WHERE salary > (SELECT AVG(salary) FROM employee);

-- Q4: Employees working in Hyderabad departments (Multi-row subquery)
SELECT * FROM employee WHERE dept_id IN (SELECT dept_id FROM department WHERE location='Hyderabad');

-- Q5: Employee details with department name and location (INNER JOIN)
SELECT e.emp_name, e.salary, d.dept_name, d.location FROM employee e INNER JOIN department d ON e.dept_id = d.dept_id;

-- Q6: Department-wise employee count and average salary (LEFT JOIN + GROUP BY)
SELECT d.dept_name, COUNT(e.emp_id) as total_emp, AVG(e.salary) as avg_salary FROM department d LEFT JOIN employee e ON d.dept_id = e.dept_id GROUP BY d.dept_name;
