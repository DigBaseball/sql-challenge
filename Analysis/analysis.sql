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
dm.from_date as "reign start date",
dm.to_date as "reign end date",
dm.emp_no as "manager employee number",
e.last_name as "last name",
e.first_name as "first name",
de.from_date as "employment start date",
de.to_date as "employment end date"
from departments as d
join departmentmanagers as dm
on dm.dept_no=d.dept_no
join employees as e
on e.emp_no = dm.emp_no
join departmentemployees as de
on de.emp_no = dm.emp_no
order by "department number", "reign start date";


-- 4. List the department of each employee with the following information:
-- employee number, last name, first name, and department name.

select e.emp_no as "employee number",
e.first_name as "first name",
e.last_name as "last name",
d.dept_name as "department name"
from employees as e
join departmentemployees as de
on e.emp_no = de.emp_no
join departments as d
on d.dept_no = de.dept_no
order by e.emp_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

select * from employees where
first_name = 'Hercules'
and last_name like 'B%';

-- 6. List all employees in the Sales department, including their
-- employee number, last name, first name, and department name.

select e.emp_no as "employee number",
e.first_name as "first name",
e.last_name as "last name",
d.dept_name as "department name"
from employees as e
join departmentemployees as de
on e.emp_no = de.emp_no
join departments as d
on d.dept_no = de.dept_no
where d.dept_name ='Sales'
order by e.emp_no;

-- 7. List all employees in the Sales and Development departments, including their
-- employee number, last name, first name, and department name.

select e.emp_no as "employee number",
e.first_name as "first name",
e.last_name as "last name",
d.dept_name as "department name"
from employees as e
join departmentemployees as de
on e.emp_no = de.emp_no
join departments as d
on d.dept_no = de.dept_no
where d.dept_name  in ('Sales','Development')
order by d.dept_name desc, e.emp_no;


-- 8. In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.

select last_name as "last name", count(emp_no) as "frequency"
from employees
group by "last name"
order by "frequency" desc;