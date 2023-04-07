use window_function;
CREATE TABLE IF NOT EXISTS Sales (
	Employee_Name VARCHAR(45) NOT NULL, 
    Year INT NOT NULL, 
    Country VARCHAR(45) NOT NULL, 
    Product VARCHAR(45) NOT NULL,
    Sale DECIMAL(12,2) NOT NULL,
    PRIMARY KEY(Employee_Name, Year));
    
INSERT INTO Sales(Employee_Name, Year, Country, Product, Sale)
VALUES 
	('Joseph', 2017, 'India', 'Laptop', 10000),
    ('Joseph', 2018, 'India', 'Laptop', 15000), 
    ('Joseph', 2019, 'India', 'TV', 20000),
    ('Bob', 2017, 'US', 'Computer', 15000), 
    ('Bob', 2018, 'US', 'Computer', 10000),
    ('Bob', 2019, 'US', 'TV', 20000), 
    ('Peter', 2017, 'Canada', 'Mobile', 20000),
    ('Peter', 2018, 'Canada', 'Calculator', 1500), 
    ('Peter', 2019, 'Canada', 'Mobile', 25000);
    
    
SELECT * FROM Sales;


create table frds(name varchar(20),
				 age int,
                 department varchar(20),
                 salary int);
                 
insert into frds(name,age,department,salary) 
values('ramesh',20,'finance',50000),
('deep',25,'Sales',30000),
('suresh',22,'finance',50000),
('ram',20,'finance',20000),
('Pradeep',22,'Sales',20000);

select * from frds;

/*find average salary of employees for each department and order employees within the department by age*/
select department,avg(salary),age
from frds
group by department
order by age;


select department,age,salary,avg(salary)
over(partition by department order by age) avg_sal
from frds;

/*find average salary of employees for each department and order employees within a department by age
order the records as per age values*/

select  department,salary,age,avg(salary)
over(partition by department order by age) avg_sal
from frds
order by age;


/*calculate row no, rank,dense rank of employees is employee table according 
to salary within each department*/

select salary,department,age, row_number()
over(partition by department order by salary) row_number_win_func,
rank() over(partition by department order by salary) rank_win_func,
dense_rank() over(partition by department order by salary) dense_rank_win_func
from frds;
