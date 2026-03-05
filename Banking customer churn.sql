


create database churn_modelling
use churn_modelling


-- Knowing churn rate according to geography and gender
WITH CleanData AS (
  SELECT 
    Geography, 
    Gender, 
    CAST(Exited AS INT) AS Exited_Num
  FROM [churn_modelling]
)
SELECT 
  Geography, 
  Gender, 
  ROUND(AVG(CAST(Exited_Num AS FLOAT))*100, 2) AS churn_rate, 
  COUNT(*) AS customer_count
FROM CleanData
GROUP BY Geography, Gender 
ORDER BY churn_rate DESC;




-- Which age group among gender and of what geographical area is most likely to churn alongwith their numerical strength.
-- Add balance risk score
WITH RiskCohorts AS (
  SELECT *,
    CASE WHEN Age < 35 THEN 'Young' 
         WHEN Age < 50 THEN 'Mid-age' ELSE 'Senior' END AS age_group,
    CASE WHEN Balance > 100000 THEN 'High' ELSE 'Low' END AS balance_risk
  FROM [churn_modelling]
)
SELECT Geography, Gender, age_group, balance_risk,
       ROUND(AVG(CAST(Exited AS FLOAT))*100, 2) AS churn_rate,
       COUNT(*) AS n_customers
FROM RiskCohorts
GROUP BY Geography, Gender, age_group, balance_risk
HAVING COUNT(*) > 30
ORDER BY churn_rate DESC;



--"What is the churn rate based on  age group  "


select
   case
      when age<35 then 'Young'
      when age<50 then 'Mid'
      else 'Senior'
   end as age_group,
round(avg(cast(exited as  float))*100,2) as churn_rate,
count(*) as customers

from [churn_modelling]
group by 
  case 
       when age<35 then'Young'
       when age<50 then'Mid'
       else 'Senior'  end
  

order by churn_rate desc;





   
   
 --which balance bracket customers as well as what age group are churning more  
   SELECT 
  CASE 
    WHEN Age < 35 THEN 'Young' 
    WHEN Age < 50 THEN 'Mid-age' 
    ELSE 'Senior' 
  END AS age_group,
  
  CASE 
    WHEN Balance < 50000 THEN 'Low' 
    WHEN Balance < 120000 THEN 'Medium'
    ELSE 'High' 
  END AS balance_group,
  
  ROUND(AVG(CAST(Exited AS FLOAT))*100, 2) AS churn_rate,
  COUNT(*) AS customer_count
FROM [churn_modelling] 
GROUP BY 
  CASE WHEN Age < 35 THEN 'Young' WHEN Age < 50 THEN 'Mid-age' ELSE 'Senior' END,
  CASE WHEN Balance < 50000 THEN 'Low' WHEN Balance < 120000 THEN 'Medium' ELSE 'High' END
HAVING COUNT(*) > 20
ORDER BY churn_rate DESC;



--show customers who are high valued and hold more no. of products whose exit lead to loss
Select customerid,age,balance,estimatedsalary, exited
from[churn_modelling]
where(numofProducts > 2 or balance >100000)
   and IsActiveMember =0
   and cast(exited as int)=1
order by balance desc;





--What it shows: True customer engagement.
CREATE VIEW [churning_features] AS 
SELECT *, 
  CAST(Balance AS FLOAT)/NULLIF(CAST(EstimatedSalary AS FLOAT),0) AS balance_salary_ratio, 
  CASE WHEN CAST(HasCrCard AS INT)=1 AND CAST(IsActiveMember AS INT)=1 THEN 'Active Cardholder' 
       ELSE 'Inactive' END AS activity_flag 
FROM [churn_modelling];



SELECT 
  activity_flag,
  ROUND(AVG(balance_salary_ratio),2) AS avg_ratio,
  ROUND(AVG(CAST(Exited AS FLOAT))*100,2) AS churn_rate,
  COUNT(*) AS customers
FROM churning_features 
GROUP BY activity_flag 
ORDER BY churn_rate DESC;












