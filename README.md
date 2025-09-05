## Project Overview

This project involves an in-depth analysis of employee data to uncover critical insights related to talent retention, performance dynamics, and departmental health. Utilizing a provided dataset, the analysis aims to answer key business questions that can inform human resources strategies and improve overall organizational stability and efficiency.

## Business Problem

The primary business problem addressed by this analysis is to **understand the underlying factors contributing to employee attrition and performance trends within the organization.** By identifying areas of high turnover, concentrations of low performance, and specific departmental or job function challenges, the goal is to provide actionable insights for strategic interventions in talent management, recruitment, and operational efficiency.

## Dataset

The analysis is based on the `employee_data.csv` file, which contains comprehensive information about employees, including:
* Employee demographics (date of birth, gender, race, marital status)
* Employment details (start date, exit date, title, department, division, business unit, employee type, classification, pay zone)
* Performance metrics (performance score, current employee rating)
* Termination details (termination type)

## Tools Used

* **PostgreSQL:** For querying and managing relational data (as demonstrated through SQL queries).

## Key Findings

The company is experiencing a significant systemic turnover problem. Key findings include:

* A high company-wide attrition rate, with a major spike in 2023, affecting all departments and pay zones.

* The Executive Office and Admin Offices have exceptionally high attrition rates of 79% and 60%, respectively.

* Average employee tenure is consistently low, with most job functions averaging less than 2 years. Highly-skilled roles like Data Architect and IT Manager - Infra have the shortest tenures.

* Performance issues are not evenly distributed. The PYZ business unit has the highest percentage of low-performing employees, particularly among those in the 56-70 age group.

* Exits are split nearly equally between voluntary and involuntary terminations.

## Conclusion: Driving Strategic Action from Employee Data Insights

The data indicates that the company is struggling with talent retention and management on multiple fronts. The low average tenure, combined with high attrition in specialized roles, suggests the company is unable to compete for or retain its most valuable talent. The near-even split between voluntary and involuntary exits implies a dual issue: employees are leaving for better opportunities (voluntary), and the company is actively terminating a significant number of underperforming employees (involuntary). This points to a deeper root cause involving either an uncompetitive environment, or inadequate performance and development programs.

## Recommendation:

To address the high turnover and performance issues, it is recommended that the company focus on three key areas:

1. Investigate High-Turnover Areas: Conduct targeted exit interviews for employees in roles and departments with the highest attrition rates (e.g., Executive Office, Data Architect). The goal is to gather qualitative data to understand the specific reasons for their departure.

2. Enhance Performance Management: Implement a review of management practices in units with high numbers of low performers, such as PYZ. Develop a targeted training and development plan for senior employees to ensure their skills remain relevant.

3. Review Compensation and Career Paths: Conduct a market analysis of compensation for high-turnover, high-skill roles. Additionally, establish clear career progression paths for these roles to provide employees with a reason to stay and grow within the company.
---

**Date:** June 12, 2025
