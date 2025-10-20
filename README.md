# 🧑‍💼 Employee Data Analysis — Summary Report

## 📘 Project Overview

An in-depth analysis of employee data to identify **drivers of attrition**, **performance issues**, and **departmental inefficiencies**.  
Goal: Support HR in improving **retention**, **performance management**, and **organizational stability**.

---

## 🧩 Business Problem

The company faces rising **employee attrition** and inconsistent **performance trends**.  
Objective: Identify key factors influencing turnover and performance to guide **strategic HR interventions** in recruitment, retention, and workforce development.

---

## 🗂️ Dataset Overview

**Source:** [Employee Dataset](<Datasets/Cleaned Data.csv>)

**Includes:**

- **Demographics:** Date of birth, gender, race, marital status  
- **Employment Details:** Start/exit dates, title, department, business unit, pay zone, classification  
- **Performance Metrics:** Performance score, current rating  
- **Termination Info:** Voluntary and involuntary exit details  

---

## 📊 Exploratory Data Analysis

## 1. Employee Retention & Attrition Analysis

### Turnover Rate by Job Title

| Job Title | Employee Count | Exited Employees | Turnover Rate |
|:---|:---|:---|:---|
| Data Architect | 1 | 1 | 100% |
| Enterprise Architect | 5 | 4 | 80% |
| Software Engineering Manager | 10 | 7 | 70% |
| Sr. BI Developer | 10 | 6 | 60% |
| BI Developer | 9 | 5 | 55.6% |
| Data Analyst | 23 | 12 | 52.2% |
| Senior Software Engineer | 23 | 11 | 47.8% |
| Principal Software Engineer | 10 | 4 | 40% |
| Network Engineer | 12 | 4 | 33.3% |
| Front End Developer | 3 | 1 | 33.3% |

**Observations:**

- **Highly Specialized and Management Roles:** Job titles like `Data Architect`, `Enterprise Architect`, and `Software Engineering Manager` exhibit exceptionally high turnover rates, indicating significant challenges in retaining talent in these critical areas.
- **Data/BI Roles:** `Sr. BI Developer`, `BI Developer`, and `Data Analyst` also show substantial turnover, suggesting a potential industry-wide or company-specific issue in retaining data professionals.
- **Variability:** While some roles have very high turnover, others like `Senior Software Engineer` and `Principal Software Engineer` show high but comparatively lower rates.

### Turnover Rate by Pay Zone

| Payzone | Employee Count | Exited Employees | Turnover Rate |
|:---|:---|:---|:---|
| Zone C | 1206 | 647 | 53.6% |
| Zone A | 1373 | 704 | 51.3% |
| Zone B | 477 | 237 | 49.7% |

**Observations:**

- **Consistent High Turnover:** All three pay zones (`Zone C`, `Zone A`, `Zone B`) exhibit very similar and high turnover rates, ranging from approximately 49.7% to 53.6%. This indicates that high turnover is not concentrated in one specific compensation tier but is a broader organizational issue.

### Supervisor Assignment & Turnover

**Observations:**

- While some supervisors showed 100% turnover, this was predominantly in cases where they managed only one employee. Therefore, a clear, pervasive pattern of supervisor assignments *directly causing* high turnover could not be definitively established from this dataset due to the small team sizes under such supervisors.

---

## 2. Tenure & Performance Insights

### Relationship between Tenure and Termination Type

| Termination Type | Avg Tenure (Yrs) |
|:---|:---|
| PIP | 1.60 |
| Resignation | 1.49 |
| Involuntary | 1.34 |
| Retirement | 1.31 |
| Voluntary | 1.26 |
| Unknown | 1.26 |

**Observations:**

- **Overall Short Tenure:** The average tenure across all termination types is remarkably short, generally ranging from 1.2 to 1.6 years. This indicates a pervasive challenge in retaining employees for longer durations, regardless of how they leave the company.
- **Unexpected PIP Tenure:** Surprisingly, employees terminated due to a **Performance Improvement Plan (PIP)** have the *longest average tenure* (approximately 1.60 years). This is a counter-intuitive finding that might suggest a prolonged process for managing and exiting underperforming employees.
- **Resignations:** Employees who `Resign` have the second-longest average tenure, slightly less than those on PIP.

### Impact of Employee Classification on Performance Ratings

| Employee Classification | Avg Performance Score |
|:---|:---|
| Full-Time | 3.02 |
| Temporary | 3.01 |
| Part-Time | 3.00 |

**Observations:**

- **Minimal Impact:** The `Employee Classification` (Full-Time, Temporary, Part-Time) has a very minimal impact on `Avg Performance Score`. All classifications show an average performance score very close to 3.0 ('Fully Meets'), suggesting a consistent level of performance or a consistent rating distribution across different employee types.

### Relationship between Performance Scores and Tenure

**Observations:**

- The relationship between `performance_score` and `tenure` is not straightforward. While 'Exceeds' performers generally have good tenure, the **longest tenure was observed among 'PIP' employees**. This warrants further investigation into the specific circumstances surrounding employee tenure under performance improvement plans.

### Percentage of Low-Performing Employees by Business Unit

| Business Unit | Employee Count | No of Low Performers | Percentage |
|:---|:---|:---|:---|
| PYZ | 299 | 36 | 12.04% |
| BPC | 303 | 32 | 10.56% |
| MSC | 296 | 31 | 10.47% |
| CCDR | 300 | 27 | 9.00% |
| PL | 301 | 26 | 8.64%|
| SVG | 304 | 25 | 8.22% |
| WBL | 294 | 24 | 8.16% |
| TNS | 297 | 23 | 7.74% |
| EW | 302 | 23 | 7.62%|
| NEL | 304 | 23 | 7.57% |

**Observations:**

- **PYZ has the highest percentage:** The 'PYZ' business unit stands out with 12.04% of its employees classified as low-performing ('Needs Improvement' or 'PIP').
- **Other significant units:** 'BPC' and 'MSC' also show relatively high percentages of low-performing employees at around 10.5% and 10.47% respectively.
- **Varying percentages:** The percentages across the top 10 business units range from about 7.5% to over 12%. This indicates a clear disparity in the concentration of low performers across different units, suggesting a need for targeted interventions.

---

## 3. Departmental & Job Function Analysis

### Departments with Highest Employee Attrition Rates

| Departments | Employee Count | Exited Enployees | Attrition Rate |
|:---|:---|:---|:---|
| Executive Office | 24 | 19 | 79.2%|
| Admin Offices | 80 | 48 | 60.0% |
| Software Engineering | 115 | 64 | 55.7% |
| IT/IS | 430 | 224 | 52.1%|
| Production | 2020 | 1014 | 50.2% |
| Sales | 331 | 164 | 49.5% |

**Observations:**

- **Executive Office has the highest attrition:** The 'Executive Office' department stands out significantly with an attrition rate of approximately 79.17%. While it has a smaller total number of employees, this rate is exceptionally high.
- **Admin Offices and Software Engineering also high:** 'Admin Offices' and 'Software Engineering' follow with notably high attrition rates of 60% and 55.65%, respectively.
- **Widespread Attrition:** Even larger departments like 'IT/IS', 'Production', and 'Sales' show attrition rates around or above 50%, indicating that high attrition is a prevalent issue across most departments.

### Divisions Experiencing More Involuntary Terminations

| Division | Employee Count | Involuntary Termination Count | Percentage |
|:---|:---|:---|:---|
| Corp Operations | 2 | 1 | 50 |
| Sales & Marketing | 9 | 3 | 33.3333 |
| Billable Consultants | 24 | 7 | 29.1667 |
| People Services | 25 | 5 | 20 |
| Catv | 58 | 11 | 18.9655 |
| Finance & Accounting | 70 | 11 | 15.7143 |
| Project Management - Con | 178 | 27 | 15.1685 |
| General - Eng | 86 | 13 | 15.1163 |
| Aerial | 196 | 28 | 14.2857 |
| Engineers | 275 | 39 | 14.1818 |
| Shop (Fleet) | 57 | 8 | 14.0351 |
| Executive | 43 | 6 | 13.9535 |
| Field Operations | 789 | 102 | 12.9278 |
| Underground | 33 | 4 | 12.1212 |
| General - Con | 509 | 61 | 11.9843 |
| Yard (Material Handling) | 59 | 7 | 11.8644 |
| Splicing | 110 | 13 | 11.8182 |
| Safety | 9 | 1 | 11.1111 |
| Fielders | 82 | 9 | 10.9756 |
| General - Sga | 117 | 11 | 9.40171 |
| Wireline Construction | 180 | 16 | 8.88889 |
| Technology / It | 26 | 2 | 7.69231 |
| Project Management - Eng | 16 | 1 | 6.25 |
| Wireless | 33 | 2 | 6.06061 |
| Isp | 14 | 0 | 0 |

**Observations:**

- **'Corp Operations' has the highest percentage:** With a small sample size, 'Corp Operations' shows 50% involuntary terminations.
- **'Sales & Marketing' and 'Billable Consultants' are next:** These divisions have notable involuntary termination rates of 33.33% and 29.17% respectively, indicating a concentration of involuntary exits.
- **Significant rates across several divisions:** Many other divisions show rates ranging from 12% to 20%, highlighting that involuntary terminations are not isolated.
- **'Isp' has zero involuntary terminations:** This division stands out with no recorded involuntary terminations.

### Average Tenure per Job Function

| Job Function | Avg Tenure (Yrs) |
|:---|:---|
| IT Director | 2.22259 |
| Principal Data Architect | 2.18024 |
| Database Administrator | 2.13279 |
| IT Manager - Support | 2.12252 |
| Director of Sales | 1.91595 |
| Accountant I | 1.86324 |
| President & CEO | 1.72713 |
| Shared Services Manager | 1.70319 |
| BI Director | 1.60712 |
| Sr. Network Engineer | 1.60516 |
| Sales Manager | 1.49815 |
| Network Engineer | 1.45324 |
| Data Analyst | 1.44994 |
| Production Technician II | 1.40221 |
| IT Support | 1.36228 |
| Production Technician I | 1.32647 |
| Senior BI Developer | 1.3013 |
| Production Manager | 1.29386 |
| BI Developer | 1.28679 |
| Area Sales Manager | 1.21373 |
| Administrative Assistant | 1.1077 |
| IT Manager - DB | 1.08214 |
| Data Analyst | 1.07324 |
| Software Engineer | 1.0539 |
| Software Engineering Manager | 1.01848 |
| Director of Operations | 0.938535 |
| Enterprise Architect | 0.874743 |
| Data Architect | 0.789049 |
| CIO | 0.775268 |
| Sr. Accountant | 0.772074 |
| IT Manager - Infra | 0.616016 |
| Sr. DBA | 0.57974 |

**Observations:**

- **Longest Tenures in Leadership and Specialized IT/Data Roles:** Roles such as `IT Director`, `Principal Data Architect`, and `Database Administrator` show the longest average tenures (above 2 years), suggesting greater stability in senior leadership and highly specialized technical positions.
- **Shortest Tenures in Critical Roles:** Conversely, some highly specialized or senior roles like `Sr. DBA` (0.58 years), `IT Manager - Infra` (0.62 years), `CIO` (0.78 years), and `Data Architect` (0.79 years) have the shortest average tenures. This indicates a potential churn issue in these critical, high-impact roles, raising concerns about knowledge retention and leadership continuity.
- **Varying Tenures in Data-Related Roles:** `Data Analyst` (appearing twice, with tenures of 1.45 and 1.07 years), `Senior BI Developer` (1.30 years), and `BI Developer` (1.29 years) show moderate tenures, falling within the overall short average tenure range.

---

## 🔍 Key Findings

1. **High Attrition Rates**
   - Major turnover spike in **2023** across all departments and pay zones.
   - **Executive Office:** 79% attrition  
   - **Admin Office:** 60% attrition  

2. **Low Average Tenure**
   - Most employees stay **< 2 years**.  
   - Shortest tenures in **high-skill roles** like *Data Architect* and *IT Manager (Infra)*.

3. **Performance Challenges**
   - **PYZ business unit** has the **highest concentration of low performers**, especially among employees aged **56–70**.

4. **Termination Trends**
   - Nearly equal split between **voluntary** (resignations) and **involuntary** (terminations) exits.  
   - Indicates both **employee dissatisfaction** and **active performance-based offboarding**.

---

## Conclusion

The company struggles with **retention, engagement, and skill sustainability**.  
Short tenures and high attrition among critical roles signal difficulty in **retaining top talent**.  
Balanced voluntary/involuntary exits suggest deeper organizational issues — possibly related to **culture, pay competitiveness**, or **weak development programs**.

---

## Recommendations

1. **Investigate High-Turnover Roles**
   - Conduct **targeted exit interviews** in high-attrition areas (e.g., Executive Office, Data Architects).  
   - Collect qualitative insights to identify push/pull factors.

2. **Strengthen Performance Management**
   - Audit **PYZ unit’s** management practices.  
   - Implement **upskilling programs** for senior and low-performing staff.

3. **Review Compensation & Career Progression**
   - Perform **market salary benchmarking** for critical, high-turnover roles.  
   - Create **clear career paths** to promote internal growth and retention.

---

> 💡 **Strategic Insight:**  
> The key to improving stability lies in **aligning compensation, culture, and career growth**, while addressing systemic issues in performance management and employee engagement.

---

## Tool Used

- **Excel** - For cleaning and standardizing the dataset.
- **PostgreSQL** — For querying, cleaning, and analyzing relational data.
- **Power BI** - For visualization.

---
**Author:** *Maria Egbuna*  
**Project:** *Employee Attrition and Performance Trend Analysis*  
**License:** *MIT License*  
**Date:** June 12, 2025
