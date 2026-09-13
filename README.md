# Telco Customer Churn Analysis & Dashboard

A SQL-driven churn analysis of ~7,000 telecom customers, identifying the strongest predictors of customer churn and visualizing them in an interactive Power BI dashboard.

## Project Overview

This project investigates why customers leave a telecom provider by analyzing contract terms, billing behavior, service usage, and demographics against churn outcomes. Beyond a simple "who churned" breakdown, the goal was to find which factors are genuinely independent predictors of churn versus which ones are just proxies for something else already identified — using cross-tabulation alongside standard churn-rate breakdowns.

The workflow: raw CSV → cleaned and loaded into MySQL → analyzed with SQL → visualized in an interactive Power BI dashboard.

## Files in This Repository

| File | Description |
|---|---|
| `churn_data.csv` | Cleaned customer-level dataset — ~7,044 rows, one row per customer |
| `churn_sql.sql` | All SQL queries used for the analysis, in the order they were run |
| `churn_word.docx` | Business questions paired with the SQL query used to answer each one |
| `churn_dashboard.pbip` | Power BI project file for the interactive dashboard |

## Dataset

Each row represents one customer and their account/service details.

| Column | Description |
|---|---|
| `customerID` | Unique customer identifier |
| `gender`, `SeniorCitizen`, `Partner`, `Dependents` | Demographic attributes |
| `tenure` | Number of months the customer has stayed |
| `PhoneService`, `MultipleLines`, `InternetService` | Core service subscriptions |
| `OnlineSecurity`, `OnlineBackup`, `DeviceProtection`, `TechSupport`, `StreamingTV`, `StreamingMovies` | Add-on services |
| `Contract` | Month-to-Month, One Year, or Two Year |
| `PaperlessBilling`, `PaymentMethod` | Billing details |
| `MonthlyCharges`, `TotalCharges` | Billing amounts |
| `Churn` | Whether the customer left (Yes/No) — the target variable |

## Key Findings

**Contract type is the strongest predictor of churn.**
Month-to-month customers churn at **42.7%**, versus 11.3% for one-year and just 2.8% for two-year contracts — roughly a 15x gap between the extremes.

**Churn risk is heavily front-loaded in the first year.**

| Tenure | Churn Rate |
|---|---|
| 1-4 months | 55.5% |
| 5-9 months | 39.5% |
| 10-19 months | 32.5% |
| 20-29 months | 23.1% |
| 30-69 months | 9-22% |
| 70+ months | 3.5% |

Month 1 alone accounts for the single highest churn rate (~62%) of any individual month.

**Monthly charges show a non-linear "hump" pattern, not a straight line.**
Churn peaks in the $70-109/month range (36-38%) — both cheaper and pricier customers churn less. This points to a specific mid-tier segment (likely partially-loaded service bundles) as the highest-risk group, rather than "higher price = higher churn."

**Electronic check users churn 3x more than other payment methods** (45.3% vs. 15-19%), but this is *partly* explained by contract type — 78% of Electronic check users are also on month-to-month contracts.

**Security and support add-ons matter far more than entertainment add-ons.**

| Add-on | Churn (No) | Churn (Yes) | Gap |
|---|---|---|---|
| OnlineSecurity | 41.8% | 14.6% | 27.2 pts |
| TechSupport | 41.6% | 15.2% | 26.4 pts |
| DeviceProtection | 39.1% | 22.5% | 16.6 pts |
| StreamingTV/Movies | ~33.6% | ~29.5% | ~4 pts |

**Senior citizens are an independent risk factor, not just a proxy for contract type.**
Seniors churn more within *every* payment method (e.g., Mailed Check: 46.8% for seniors vs. 17.4% for non-seniors), even though they're also overrepresented in month-to-month contracts (70.7% of seniors vs. 52.0% of non-seniors).

**Gender shows no meaningful churn difference** (26.96% vs. 26.15%) — ruled out as a factor.

## Dashboard

Built in Power BI, the dashboard includes:
- KPI cards: Total Customers, Churned Customers, overall Churn Rate %
- Churn rate by Contract Type (bar chart)
- Churn rate by Tenure Group (bar/line chart)
- Churn rate by Payment Method (bar chart)
- Payment Method × Senior Citizen churn rate (matrix, with conditional formatting)
- Customer Retention Overview (donut chart, Churned vs. Retained)
- Slicers for Contract, PaymentMethod, and Senior Status for interactive filtering

## How to Reproduce This Project

1. **Load the data** into MySQL (or your preferred SQL engine) as a table named `churn_data`.
2. **Run the queries** in `churn_sql.sql` in order — each is documented with its corresponding business question in `churn_word.docx`.
3. **Open the dashboard** — `churn_dashboard.pbip` in Power BI Desktop (requires the accompanying `.Report` and semantic model folders alongside the `.pbip` file).

## Tools Used

- **MySQL** — data querying and churn-rate calculations
- **Power BI** — interactive dashboard and DAX measures

## Possible Next Steps

- Build a predictive model (logistic regression or similar) using the identified risk factors
- Segment customers into a "churn risk score" combining contract type, tenure, and payment method
- Add a what-if analysis showing the revenue impact of moving X% of month-to-month customers to annual contracts
