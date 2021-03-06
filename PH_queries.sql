-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select employees.emp_no, employees.last_name, employees.first_name, employees.sex,
salaries.salary
from employees
inner join salaries
	on employees.emp_no = salaries.emp_no
;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
select e.last_name, e.first_name, e.hire_date
from employees as e
where hire_date between '$1986-01-01' AND '$1986-12-31'
order by hire_date asc
;

-- 3. List the manager of each department with the following information:
-- department number, department name, the manager's employee number, last name, first name.
select dm.dept_no,
d.dept_name,
e.emp_no,
e.last_name,
e.first_name
from dept_manager as dm
left join employees as e
	on dm.emp_no = e.emp_no
left join departments as d
	on dm.dept_no = d.dept_no
order by dept_no asc
;

-- 4. List the department of each employee with the following information:
-- employee number, last name, first name, and department name.
select de.emp_no,
e.last_name,
e.first_name,
d.dept_name
from dept_emp as de
left join employees as e
	on de.emp_no = e.emp_no
left join departments as d
	on de.dept_no = d.dept_no
order by emp_no asc
;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select e.first_name, e.last_name, e.sex
from employees as e
where first_name = 'Hercules'
and last_name like 'B%'
;

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join dept_emp as de
	on e.emp_no = de.emp_no
inner join departments as d
	on de.dept_no = d.dept_no
	where d.dept_name = 'Sales'
	order by e.emp_no
;

-- 7. List all employees in the Sales and Development departments,
-- including their employee number, last name, first name, and department name.

select e.emp_no,
e.last_name,
e.first_name,
d.dept_name
from employees as e
inner join dept_emp as de
	on e.emp_no = de.emp_no
inner join departments as d
	on de.dept_no = d.dept_no
	where d.dept_name = 'Sales'
	or d.dept_name = 'Development'
	order by e.emp_no
;

-- In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.
select last_name as "Last Name" ,count(emp_no) as "Frequency of Last Name"
from employees
group by "Last Name"
order by "Frequency of Last Name" desc
;