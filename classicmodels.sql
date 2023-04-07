use classicmodels;
select * from customers;
select * from productlines;
select * from orders;
select
productlines,orderyear,ordervalue,
round(percent_rank() 
over(partition by orderyear order by ordervalue),
2)
percentile_rank from productlinesales;



