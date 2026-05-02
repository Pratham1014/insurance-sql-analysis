SELECT * from insurance;

--Customer Distribution by plan
SELECT plan, count(*) AS total_customers
FROM insurance
GROUP by plan
ORDER by total_customers DESC;

--Revenue Contribution by plan
SELECT plan,sum(amount) AS total_revenue
FROM insurance
GROUP BY plan
ORDER BY sum(amount) DESC;

--Customer Segmentation by Age Group
SELECT
CASE 
	WHEN age <=25 THEN 'Young'
	When age BETWEEN 25 AND 40 THEN 'Adult'
	ELSE 'Senior'
END AS age_group,
COUNT (*) AS total_customers
FROM insurance
GROUP BY age_group;

--High Value Clients
SELECT * FROM insurance
ORDER BY amount DESC
LIMIT (10);

--Risk Identification (High Coverage, Short Term)
SELECT * FROM insurance
WHERE amount >= 500000 AND policy_term <= 15;

--Plan Performance Ranking
SELECT plan, sum(amount) AS total_revenue,
RANK() OVER (ORDER BY sum(amount) DESC) AS rank
FROM insurance
GROUP BY plan;


