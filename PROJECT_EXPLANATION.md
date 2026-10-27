# Resume and Interview Notes

## Project title
Employee Payroll Analysis | MySQL Workbench 8.0, SQL, Power BI, Excel

## Resume bullets (use only after completing the work yourself)
- Built a MySQL payroll database with 500 synthetic employee records and validated salary, bonus, tax, and deduction calculations.
- Wrote 20 SQL queries to examine payroll costs, average pay, department comparisons, and high-earning employees.
- Used SQL CTEs, subqueries, and window functions to rank departments and compare sample payroll totals by month.
- Created a Power BI dashboard with payroll KPIs, department-level charts, and interactive filters.
- Documented database setup, validation steps, SQL findings, and dashboard design in a GitHub portfolio.

## 45-second interview explanation
“I built an Employee Payroll Analysis project using MySQL Workbench and a fictional dataset of 500 employees. First, I created the database and payroll table, then loaded the records using SQL INSERT scripts. I validated the gross pay, deductions, and net pay calculations. I wrote 20 SQL queries using aggregations, subqueries, a CTE, and window functions to compare payroll across departments, locations, and pay months. I then imported the CSV into Power BI and designed KPI cards, department comparisons, and payroll visuals. The dataset has one payroll record per employee, so I explain that monthly trends represent the sample rather than full-company month-to-month changes.”

## Interview questions
**Where did you write SQL?** In MySQL Workbench 8.0, connected to a MySQL Server database.
**How did you load the data?** I ran a SQL script containing 500 INSERT records; the CSV was used for Power BI.
**How did you check correctness?** I verified 500 rows and checked that gross pay equals base plus overtime plus bonus, and net equals gross minus deductions.
**What SQL did you use?** SELECT, WHERE, GROUP BY, aggregate functions, ORDER BY, subqueries, CTE, DENSE_RANK, LAG.
**What did you learn?** How to organize a relational table, validate financial calculations, aggregate costs, and communicate limitations of sampled data.
**Is it real employee data?** No, it is generated synthetic data for learning and portfolio use.
