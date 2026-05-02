## 🏢 Insurance Customer & Revenue Analysis using SQL
#### 📌 Project Overview

This project analyzes an insurance dataset using SQL to uncover insights related to customer distribution, revenue generation, and risk exposure.

The goal is to simulate a real-world business scenario where data-driven insights support decision-making in the insurance domain.
#### 🎯 Business Problem

Insurance companies need to understand:

Which plans are most popular?
Which plans generate the highest revenue?
Who are the high-value customers?
Where does potential financial risk exist?

#### 📊 Sample Output
SELECT * from insurance;

#### Customer Distribution by plan
SELECT plan, count(*) AS total_customers
FROM insurance
GROUP by plan
ORDER by total_customers DESC;

<img width="686" height="432" alt="image" src="https://github.com/user-attachments/assets/75521e75-2afe-4ef2-a950-522edefa16e0" />

--Customer Distribution by Plan
Nonpar has the highest number of customers (67)
Followed by ULIP (21) and Par (10)
Health plan adoption is extremely low (2 customers)

Insight:
Customer preference is heavily skewed toward Nonpar plans.


#### Revenue Contribution by plan
SELECT plan,sum(amount) AS total_revenue
FROM insurance
GROUP BY plan
ORDER BY sum(amount) DESC;

<img width="684" height="426" alt="image" src="https://github.com/user-attachments/assets/d86da23c-a15e-4cc4-a57d-8c3a684d2e7d" />

--Revenue Contribution by Plan
ULIP generates the highest revenue: 6,110,000
Nonpar generates: 3,980,000
Par contributes significantly less: 670,000
Health plan revenue is negligible: 3,500

Insight:
The most popular plan (Nonpar) is NOT the most profitable.
ULIP dominates in revenue despite lower customer count.


#### Customer Segmentation by Age Group
SELECT
CASE 
	WHEN age <=25 THEN 'Young'
	When age BETWEEN 25 AND 40 THEN 'Adult'
	ELSE 'Senior'
END AS age_group,
COUNT (*) AS total_customers
FROM insurance
GROUP BY age_group;

<img width="656" height="360" alt="image" src="https://github.com/user-attachments/assets/f04bf9d4-60ee-496d-8084-289a11d17e47" />


#### High Value Clients
SELECT * FROM insurance
ORDER BY amount DESC
LIMIT (10);

<img width="1016" height="718" alt="image" src="https://github.com/user-attachments/assets/526b445b-31cd-46a9-824b-3439b518cdeb" />

--High-Value Customers
Top customers have coverage amounts of 300,000 – 500,000
Majority belong to ULIP plans

👉 Insight:
ULIP plans attract premium customers with higher policy values.

#### Risk Identification (High Coverage, Short Term)
SELECT * FROM insurance
WHERE amount >= 500000 AND policy_term <= 15;

<img width="1036" height="432" alt="image" src="https://github.com/user-attachments/assets/3b8781ee-ad0b-42d9-b3fb-b7c216d2949c" />

Risk Identification (High Coverage + Short Term)
Policies with ≥ 500,000 coverage and shorter durations identified
These are concentrated in ULIP plans

👉 Insight:
High-value short-term policies represent potential financial risk exposure

#### Plan Performance Ranking
SELECT plan, sum(amount) AS total_revenue,
RANK() OVER (ORDER BY sum(amount) DESC) AS rank
FROM insurance
GROUP BY plan;

<img width="768" height="438" alt="image" src="https://github.com/user-attachments/assets/00faa52e-e19e-40be-9258-2696ed3307ef" />

Insight:
ULIP is a high-value product targeting fewer but higher-paying customers.

#### 🧠 Key Business Insights
- Customer volume ≠ revenue generation
- ULIP is the most profitable product
- Revenue is highly concentrated in one plan (ULIP) → dependency risk
- Nonpar attracts volume but lower revenue per customer
- Health plan shows extremely low adoption and performance

#### 💡 Business Recommendations
1. Focus on High-Value Products
Expand ULIP offerings
Target high-income customer segments
2. Improve Low-Performing Plans
Re-evaluate Health plan pricing and features
Increase marketing efforts
3. Risk Monitoring
Monitor high-value short-term policies
Strengthen underwriting policies
4. Portfolio Diversification
Reduce dependency on ULIP
Balance revenue across multiple plans

#### 🚀 Future Enhancements
- Build interactive dashboards using Power BI
- Perform predictive modeling (customer segmentation, risk scoring)
- Integrate claims data for deeper risk analysis
- Conduct customer lifetime value (CLV) analysis

