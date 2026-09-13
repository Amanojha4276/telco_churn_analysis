use e;


select * from churn_data;
select Contract,churn,count(churn),count(churn)*100/(select count(churn) from churn_data)
from churn_data
group by Contract,churn;

select Contract,churn,count(churn),count(churn)*100/(select count(churn) from churn_data where churn = "yes")
from churn_data
where  churn ="yes"
group by Contract,churn;

SELECT
    Contract AS contract_type,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_pct
FROM churn_data
GROUP BY Contract
ORDER BY churn_rate_pct DESC;


select count(tenure)  from churn_data where tenure>70 ;

select    case
          when tenure between 1 and 4 then "1-4"
          when tenure between 5 and 9 then "5-9"
          when tenure between 10 and 19 then "10-19"
          when tenure between 20 and 29 then "20-29"
          when tenure between 30 and 39 then "30-39"
          when tenure between 40 and 49 then "40-49"
          when tenure between 50 and 59 then "50-59"
          when tenure between 60 and 69 then "60-69"
          else "above 70"
          end as tenure_group,
          count(*) as total,
          SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
          ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS churn_rate_pct
from churn_data           
group by  1
order by churn_rate_pct desc;          

select * from churn_data;

SELECT 
    MIN(monthlycharges) AS lowest_charge,
    MAX(monthlycharges) AS highest_charge,
    MAX(monthlycharges) - MIN(monthlycharges) AS charge_range
FROM churn_data;


select  case
          when MonthlyCharges between 18 and 29 then "18 and 29"
          when MonthlyCharges between 30 and 49 then "30 and 49"
          when MonthlyCharges between 50 and 69 then "50 and 69"
          when MonthlyCharges between 70 and 89 then "70 and 89"
          when MonthlyCharges between 90 and 109 then "90 and 109"
          when MonthlyCharges between 110 and 129 then "110 and 129"
          else "above 130"
          end as charge_range,
          count(monthlycharges),
          SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
          ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS churn_rate_pct
from churn_data
group by 1
order by MIN(MonthlyCharges);
          


select * from churn_data;

select distinct(paymentmethod)from churn_data;

select paymentmethod,
       count(*) as total,
       SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
	   ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS churn_rate_pct
from churn_data
group by 1;       



select onlinesecurity,
       count(*) as total,
       SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
	   ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS churn_rate_pct
from churn_data
group by 1;       

select techsupport,
       count(*) as total,
       SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
	   ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS churn_rate_pct
from churn_data
group by 1;  

select deviceprotection,
       count(*) as total,
       SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
	   ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS churn_rate_pct
from churn_data
group by 1;  

select onlinebackup,
       count(*) as total,
       SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
	   ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS churn_rate_pct
from churn_data
group by 1;  

select streamingmovies,
       count(*) as total,
       SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
	   ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS churn_rate_pct
from churn_data
group by 1;  


  
       
SELECT
    PaymentMethod,
    Contract,
    COUNT(*) AS customer_count
FROM churn_data
GROUP BY PaymentMethod, Contract
ORDER BY PaymentMethod, Contract;

select churn, sum(totalcharges)*100/(select sum(totalcharges) from churn_data)
from churn_data
group by churn;

select * from churn_data;

select gender,
       count(*) as total,
       SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
	   ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS churn_rate_pct
from churn_data
group by 1;  

select paymentmethod,seniorcitizen,
       count(*) as total,
       SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
	   ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS churn_rate_pct
from churn_data
where seniorcitizen=1
group by 1,2
order by 1,2;

select contract,seniorcitizen,
       count(*) as total
from churn_data
group by 1,2
order by 1,2;

SELECT
    Contract,
    COUNT(*) AS senior_customers,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM churn_data WHERE SeniorCitizen = 1),
        2
    ) AS pct_of_seniors
FROM churn_data
WHERE SeniorCitizen = 1
GROUP BY Contract;


select dependents,
       count(*) as total,
       SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
	   ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS churn_rate_pct
from churn_data
group by 1;

