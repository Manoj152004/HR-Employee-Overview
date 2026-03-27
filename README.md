# HR Employee Overview & Attrition Analysis
https://app.powerbi.com/links/L0ZQQ283zR?ctid=ef51de3c-3b7d-4e60-a91b-e607598f3278&pbi_source=linkShare

## Project Overview
End-to-end HR employee data analysis project covering data cleaning 
in Excel, Python, and Power Query, SQL analysis with 13+ business 
queries, matplotlib visualizations, and an interactive Power BI 
dashboard built on 2100+ rows of employee data.

---

## Tools & Technologies
- **Python** (pandas, numpy, matplotlib) — Data cleaning & EDA
- **Microsoft Excel + Power Query** — Initial cleaning & transformation
- **PostgreSQL / pgAdmin** — Data storage & SQL analysis
- **Power BI** — Interactive dashboard & DAX measures

---

## Project Workflow

### Step 1 — Excel & Power Query
- Loaded raw HR employee dataset
- Removed duplicates and blank rows
- Standardized column headers
- Fixed inconsistent department, city, job title values
- Exported cleaned CSV for Python processing

### Step 2 — Python (pandas + matplotlib)
- Imported cleaned CSV and standardized all column names
- Dropped duplicates using `drop_duplicates()`
- Dropped rows with null salary values
- Converted salary column — removed currency symbols using regex
- Filled null age values with median
- Filled null employee name with 'Employee'
- Filled null gender with 'Unknown'
- Dropped rows with null attrition values
- Standardized categorical columns (workmode, status, city,
  educationlevel, jobtitle, department) using strip + lower + title
- Checked all unique values per column for data quality
- Exported cleaned data to PostgreSQL using SQLAlchemy

**Matplotlib Visualizations:**
- Bar chart: Avg Salary by Department
- Pie chart: Work Mode Breakdown (On-Site 35.9%, Remote 31.7%, 
  Hybrid 32.5%)

### Step 3 — SQL (PostgreSQL)
Renamed table and ran 13 business analysis queries:
- Total employees, departments, avg salary, avg experience
- Employee count by department
- Gender distribution with percentage
- Avg, min, max salary by department
- Salary by job title
- Experience band vs avg salary analysis
- Top 5 highest paid employees
- Department wise performance ranking using RANK()
- Salary vs performance correlation
- Projects handled vs avg performance and salary
- Complete HR summary with attrition rate

### Step 4 — Power BI Dashboard
**DAX Measures created:**
- Total Employees
- Avg Salary
- Avg Performance
- Attrition Count
- Attrition Rate %
- Retention Rate %
- Max Salary
- Min Salary
- High Salary Employees

**Dashboard — 3 Pages:**

**Page 1 — HR Employee Overview**
- 4 KPI Cards: Total Employees, Avg Salary, Avg Performance, 
  Attrition Rate %
- Bar chart: Avg Salary by Job Title
- Donut chart: Attrition Yes vs No
- Slicers: Department, Gender, Work Mode

**Page 2 — Attrition Analysis**
- Gauge: Attrition Rate %
- Bar chart: Attrition by Department
- Column chart: Attrition by Age Group
- Donut chart: Attrition by Work Mode

**Page 3 — Salary & Performance**
- Funnel: Salary by Job Title
- Scatter: Experience vs Salary
- Column chart: Projects Handled vs Avg Performance
- Bar chart: City wise Employee Count

---

## Key Insights
- **Legal and Sales** departments have highest average salary
- **Marketing** department has lowest average salary
- Work mode is evenly distributed — On-Site 35.9%, 
  Remote 31.7%, Hybrid 32.5%
- Employees with more experience earn significantly higher salary
- High performers handle more projects on average

---

## Business Recommendations
- Increase salary budget for Marketing and HR departments
  to reduce attrition risk
- Promote hybrid and remote work — evenly distributed
  preference shows flexibility matters to employees
- Focus retention efforts on high performers — losing them
  costs more than salary increase
- Reward employees handling 15+ projects with higher pay
  to prevent burnout and attrition

---

## Dataset
- Rows: 2100+
- Columns: 17
- Source: Synthetic HR employee data

---<img width="838" height="531" alt="Screenshot 2026-03-23 172806" src="https://github.com/user-attachments/assets/58860262-a635-4c1f-b576-6f8f417b9d78" />


## Files in Repository
HR-Employee-Overview/
│
├── HR_employee 02.ipynb              # Python cleaning notebook
├── HR Employee Cleaning using
Power Query 01.csv                # Excel cleaned dataset
├── HR EMPLOYEE 03.sql                # SQL analysis queries
├── screenshots/
│   ├── page1_overview.png
│   ├── page2_attrition.png
│   └── page3_salary.png
└── README.md
---


## Author
**Manoj Kumar**
Data Analyst | New Delhi, India
GitHub: github.com/Manoj152004
Skills: Python | SQL | Power BI | Excel | pandas | numpy | matplotlib
