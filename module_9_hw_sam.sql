CREATE TABLE "departments" (
"dept_no" VARCHAR(5),
"dept_name" VARCHAR(50))

CREATE TABLE "titles"(
"title_id" VARCHAR(5),
"title" VARCHAR(50))
	
CREATE TABLE "employees"(
"emp_no" INTEGER, 
"emp_title" VARCHAR(5),
"birth_date" date,
"first_name" VARCHAR(150),
"last_name" VARCHAR(200),
"sex" VARCHAR(5),
"hire_date" date)

CREATE TABLE "salaries"(
"id" SERIAL,
"emp_no" INTEGER,
"salary" float)

CREATE TABLE "dept_manager"(
"id" SERIAL,
"dept_no" VARCHAR(5),
"emp_no" INTEGER)

CREATE TABLE "dept_emp"(
"id" SERIAL,
"emp_no" INTEGER,
"dept_no" VARCHAR(5))

SELECT employees.emp_no, employees.last_name, employees. first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;


SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

SELECT employees.emp_no,  employees. first_name, employees.last_name, dept_manager.dept_no, departments.dept_name
FROM employees
INNER JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
INNER JOIN departments ON departments.dept_no = dept_manager.dept_no;

SELECT employees.emp_no, employees.last_name, employees. first_name, dept_emp.dept_no, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no;

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

SELECT employees.emp_no, employees.last_name, employees. first_name, dept_emp.dept_no, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales';

SELECT employees.emp_no, employees.last_name, employees. first_name, dept_emp.dept_no, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_name IN ('Development', 'Sales');

SELECT last_name, 
COUNT(*) as frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;

