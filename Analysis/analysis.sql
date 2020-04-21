-- Data Analysis


-- 1. List the following details of each employee:
-- employee number, last name, first name, gender, and salary.

select e.emp_no as "employee number",
	e.last_name as "last name",
	e.first_name as "first name",
	e.gender,
	s.salary from salaries as s
	LEFT JOIN employees as e
	on e.emp_no=s.emp_no;


-- 2. List employees who were hired in 1986

select first_name as "first name",
last_name as "last name"
from employees
where emp_no in
(select emp_no
from salaries
where from_date between '1986-01-01' and '1986-12-31'
order by from_date);


-- 3. List the manager of each department with the following information:
-- department number, department name, the manager's employee number, last name, first name, and start and end employment dates.


select d.dept_no as "department number",
d.dept_name as "department name",
dm.emp_no as "manager employee number",
dm.from_date as "department start",
dm.to_date as "department end",
e.last_name as "last name",
e.first_name as "first name",
s.from_date as "start date",
s.to_date as "end date"
from departments as d
join departmentmanagers as dm
on dm.dept_no=d.dept_no
join employees as e
on e.emp_no = dm.emp_no
join salaries as s
on s.emp_no = e.emp_no;

select dept_no, max(from_date) 
from departmentmanagers
group by dept_no
order by dept_no

select dept_no as dept_no, dept_name
from departments

-- 4. List the department of each employee with the following information:
-- employee number, last name, first name, and department name.


-- 5. List all employees whose first name is "Hercules" and last names begin with "B."


-- 6. List all employees in the Sales department, including their
-- employee number, last name, first name, and department name.


-- 7. List all employees in the Sales and Development departments, including their
-- employee number, last name, first name, and department name.


-- 8. In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.