--join employee table to salary table
--select employee number, last name, first name, sex, and salary

select e.emp_no as "Employee Number", e.last_name as "Surname", e.first_name as "Name", e.sex as "Gender", s.salary as "Salary"
from salaries as s
inner join employees as e on
e.emp_no=s.emp_no;


--display first_name, last_name, and hire_date for all employees hired in 1986
select first_name as "Name", last_name as "Surname", hire_date as "Start Date" 
from employees
where
	hire_date >= '1986-01-01' 
	and
	hire_date < '1987-01-01';

--display department number, department name, manager's employee number, last name, first name
select d.dept_no as "Department ID", 
	d.dept_name as "Department Name", 
	e.emp_no as "Manager Employee ID", 
	e.last_name as "Surname", 
	e.first_name as "Name"
from dept_manager as m
inner join departments as d on
d.dept_no=m.dept
inner join employees as e on
m.emp_no=e.emp_no;

--join employees with dept_emp and departments, saving into a view for later use

create view employee_departments as
select e.emp_no as "Employee ID",
		e.last_name as "Surname",
		e.first_name as "Name",
		d.dept_name as "Department"
from dept_emp as de
inner join departments as d on
de.dept_no=d.dept_no
inner join employees as e on
de.emp_no=e.emp_no;

--display the view of employee number, last name, first name, and department name
select * from employee_departments;

--list first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B"
select first_name, last_name, sex from employees
where 
first_name = 'Hercules'
and last_name like 'B%';

--list all employees in the sales department, using employee number, last name, first name, and department name
select * from employee_departments
where "Department" = 'Sales';

--list all employees in the sales and development departments, using employee number, last name, first name, and department name
select * from employee_departments
where "Department" = 'Sales'
or "Department" = 'Development';

--in descending order, list the frequency count of employee last names
select last_name as "Surname", count(emp_no) as "Total Employees" from employees
group by last_name 
order by "Total Employees" desc;