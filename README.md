# 🧑‍💼 HR Insights & Retention Analysis

## Goal
Support HR in improving **retention**, **performance management**, and **organizational stability**.

---

## Business Problem

The company faces rising **employee attrition** and inconsistent **performance trends**.  
Objective: Identify key factors influencing turnover and performance to guide **strategic HR interventions** in recruitment, retention, and workforce development.

---

## Exploratory Data Analysis

## 1. Employee Retention & Attrition Analysis

![Employee Attrition](<Images/Page 1.png>)

### Attrition Trend Over Time

Attrition exhibits **high volatility**, peaking significantly in **July** and showing the lowest figures toward year-end (e.g., December), suggesting a strong seasonal or event-driven pattern in employee exits.

### Attrition by Department

Attrition is highest in the **Executive Office (79.2%)** and **Admin Offices (60.0%)**, with Software Engineering and other departments also showing rates over $50\%$. The high rates in top-level administrative areas warrant immediate investigation.

### Retention vs Attrition by Age Group

Retention Rate and Attrition Rate are **nearly identical and consistently around $50\%$** across all four age groups ($23-34$ through $60+$). This indicates that **age is not a differentiating factor** in predicting employee retention or attrition.

### Attrition by Gender

Attrition is split almost evenly, with **Female exits (50.36%)** being negligibly higher than **Male exits (49.64%)**. Gender is not a significant driver of the attrition trend.

### Reasons for Leaving

Employee exits are primarily driven by **Involuntary** and **Voluntary**, with a smaller portion attributed to **Retirement**.

---

## 2. Tenure & Performance Insights

![Tenure and Performance](<Images/Page 2.png>)

### Performance and Tenure by Age Groups

The **23-34 age group** demonstrates the **highest average performance ($\sim 3.02$)** despite having one of the shortest tenures ($\sim 2.86$ years), indicating they are the highest-performing, highest-risk segment. The **60+ group** shows the longest average tenure ($\sim 3.00$ years) with slightly lower performance.

### Performance Trend by Tenure Length

Performance across departments is largely **stable or slightly increasing** with tenure, with a few exceptions:

- **Executive Office** and **Admin Offices** show a clear **positive rise** in performance as tenure increases from $0-2$ to $6-10$ years.
- **Sales** and **Software Engineering** show a **slight decline** in average performance in the $6-10$ year tenure bracket.

### Workforce Composition by Classification

The workforce is **equally balanced** across classifications: **Full-Time ($\sim 34.7\%$), Temporary ($\sim 32.79\%$), and Part-Time ($\sim 32.52\%$)**. This reliance on non-full-time labor may contribute to the overall low average tenure (2.84 years).

### Termination Type by Tenure Group

The reason for employee separation changes dramatically with tenure:

- **0-2 Years (New Hires):** Exits are split across **Voluntary, Resignation, Involuntary, and Unknown** reasons, indicating high, multifaceted churn early in employment.
- **3-5 Years & 6-10 Years (Experienced Employees):** Separations are overwhelmingly driven by **Unknown Reasons (77.0\% and 100.0\% respectively)**. This suggests that once an employee passes the two-year mark, they are highly likely to be retained until retirement age.

---

## 3. Departmental & Job Function Analysis

![Department Analysis](<Images/Page 3.png>)

### Employee Headcount and Size

The organization is heavily concentrated in the **Production department**, which employs **1,006** of the $1,467$ employees (over two-thirds of the workforce). All other departments are significantly smaller, with the **Executive Office** being the smallest at only **5 employees**.

### Average Performance Score

Average performance scores are generally high and consistent across the organization, ranging from a low of **$2.8$ (Executive Office)** to a high of **$3.0$ (Admin Offices, IT/IS, and Production)**. This suggests a uniformly strong performance rating system, or that most employees are rated highly.

### Attrition Rate by Department

Attrition rates are critically high in the smaller, administrative and leadership departments:

- **Executive Office:** **79.2%** (Highest Attrition)
- **Admin Offices:** **60.0%**
- **Software Engineering:** **55.7%**
- The largest department, **Production (50.2%)**, shows a high attrition rate, but it is not the highest.

### Employee Classification by Department

The workforce composition by employment type (Full-Time, Temporary, Part-Time) is driven primarily by the **Production department**, which dominates the share in all three classifications. This confirms that the departmental structure is highly reliant on the Production department's staffing needs, regardless of employment type.

---

## Key Findings

1. **High Attrition Rates**
   - **Executive Office:** 79% attrition  
   - **Admin Office:** 60% attrition  

2. **Low Average Tenure**
   - Most employees stay **< 2 years**. 

3. **Termination Trends**
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

> **Strategic Insight:**  
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
