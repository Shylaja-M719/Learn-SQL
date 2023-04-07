USE HR;
SELECT * FROM COUNTRIES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM EMPLOYEES;
SELECT * FROM JOB_HISTORY;
SELECT * FROM JOBS;
SELECT * FROM LOCATIONS;
SELECT * FROM REGIONS;
SELECT * FROM emp_details_view;

SELECT * FROM EMPLOYES;
SELECT DISTINCT JOB_ID,MANAGER_ID FROM EMPLOYEES;


/*ORDER BY CLAUSE    */

SELECT * FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG' ORDER BY FIRST_NAME;

SELECT * FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG' ORDER BY FIRST_NAME DESC;

/**/
SELECT FIRST_NAME,MANAGER_ID,DEPARTMENT_ID 
FROM EMPLOYEES
ORDER BY MANAGER_ID DESC, DEPARTMENT_ID ASC;


-- /*SELECT SALARY :=(SALARY+300) FROM EMPLOYEES; */
-- SET @new_salary := 300;
-- UPDATE EMPLOYEES
-- SET SALARY := @new_salary + SALARY;



select * FROM EMPLOYEES;

/*group by */

SELECT COUNT(EMPLOYEE_ID),DEPARTMENT_ID 
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID;

select * from employees;
select * from departments;

/*find the total number of employees*/
SELECT COUNT(EMPLOYEE_ID) FROM EMPLOYEES;


/*2. find the number of employees in each department*/
-- select count(employee_id),department_id
-- from  employees
-- group by employee_id and department_id;

SELECT  COUNT(employee_id) as num_employees
FROM employees
GROUP BY department_id;

/*3. Provide the names of all the employees whose salary is less than 6000*/
select first_name, last_name 
from employees
where salary<6000;

/*4. Find the number of employees whose salary is greater than 20000*/
select count(*)
from employees
where salary>20000; 


/*5.find th number of IT-Programmers whose salary is greater than 6000*/
select count(employee_id) 
from employees as e, departments as d
where d.department_id = e.department_id and d.department_name ='IT' and salary > 6000;

/*6. add a column to provide the annual salary of all the employees.*/
set sql_safe_updates=0;
ALTER TABLE employees ADD COLUMN annual_sal DECIMAL(10, 2);
alter table employees drop annual_salary;
UPDATE employees SET annual_sal = salary * 12;

/*7.increase the salary of employees whose annuanly salary is between 16000 and 25000 by 50%*/
-- ct * /

update employees set salary = salary*1.5
where salary between 16000 and 25000;

select * from employees;

/*8.Provide the fullname of employees who take get comission*/
select *
 from employees
 where commission_pct is not null;

/*9.*Provide the fullname of employees wh0 dnot get comission*/
select *
 from employees
 where commission_pct is null;
 
/*10.provide the top 3 employes who are paid the highest salary*/
SELECT *, salary
FROM employees
ORDER BY salary DESC
LIMIT 3; 


/*Assignment*/

/*1. Identify top 3 departments that have highest CTC*/
SELECT department_id, SUM(salary) as total_salary
FROM employees
GROUP BY department_id
ORDER BY total_salary DESC
LIMIT 3;

/*2. Provide the details of all the clearical grade employees*/
SELECT * FROM EMPLOYEES
WHERE JOB_ID LIKE '%CLERK';


/*3. Provide the details of all clerical grade employees and their average salalry.*/
select * from jobs;
SELECT job_title, AVG(salary) AS average_salary
FROM employees
JOIN jobs
ON employees.job_id = jobs.job_id
WHERE job_title LIKE '%CLERK'
GROUP BY job_title;



/*4. Provide the department wise average salary of employees*/ 
select department_name,avg(salary) 
from employees
join departments on employees.department_id=departments.department_id
group by department_name;


/*5. list the departments that have employee salaries in the range of 7000 to 10000 along with their employee count*/
select count(employees_id)department_id, salary
from employees
join departments on employees.department_id= departments.department_id
group by department_id;

SELECT count(employee_id),departments.department_name
FROM departments,employees
WHERE departments.department_id IN (
  SELECT DISTINCT department_id
  FROM employees
  WHERE salary between 7000 and 10000
);

SELECT departments.department_name, COUNT(*) as employee_count
FROM employees
JOIN departments ON employees.department_id = departments.department_id
WHERE employees.salary BETWEEN 7000 AND 10000
GROUP BY departments.department_name;


/*6.analyze salary vs experience level, experince = current_date-hire_date*/
select DATEDIFF(year, hire_date, current_date) AS experience_level;
SELECT employee_id, first_name, last_name, DATEDIFF(year, hire_date, current_date) AS experience_level
FROM employees;

/*7. find the employees who have first letter 'A' and third letter 'e' in their first name*/
select *
from employees
where first_name like 'A__e%';



/*write a query to find the name(first_name,last_name),departmentid and department name of all the employees.*/
select first_name,last_name,employees.department_id,department_name
from employees
inner join departments
 on employees.department_id = departments.department_id;

/*write a query to find the addresses(location_id, street_address,city,state_provice,country_name) of all the departments.*/
select location_id,street_address,city,state_province,country_name
from locations
join countries 
on locations.country_id = countries.country_id;


