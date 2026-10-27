# Employee Payroll Analysis | MySQL 8.0 + Power BI

A portfolio-ready, **synthetic** payroll dataset with 500 employees and one payroll record per employee across 12 months in 2026. All names and values are fictional. **Important:** monthly totals reflect the sample of employees assigned to each month; they are **not** full-company monthly payroll totals. Do not describe the dataset as 500 employees paid in every month.

## Files
- `sql/01_create_database.sql`: creates database and table
- `sql/02_load_sample_data.sql`: loads all 500 records (no CSV import required)
- `sql/03_analysis_queries.sql`: 20 runnable analysis queries
- `sql/04_validate_data.sql`: checks row count and arithmetic
- `data/employee_payroll_500.csv`: dataset for Excel/Power BI
- `docs/START_HERE.md`: step-by-step beginner instructions
- `docs/PROJECT_EXPLANATION.md`: interview script and resume bullets
- `powerbi/POWER_BI_DASHBOARD_GUIDE.md`: Power BI visuals and measures

## Run in MySQL Workbench
1. Connect to your local MySQL server.
2. Open `01_create_database.sql`, click inside editor, and press **Ctrl+Shift+Enter** to execute all statements (or use the lightning bolt for all/selection).
3. Open `02_load_sample_data.sql`, run all statements. Wait until finished.
4. Open `04_validate_data.sql`, run all; row count must be 500, arithmetic errors 0.
5. Open `03_analysis_queries.sql`; select **one query including its semicolon** and press **Ctrl+Enter**, or execute entire script with Ctrl+Shift+Enter.
6. If the lightning bolt is disabled, make sure you have an open SQL query tab and an active server connection. See START_HERE.

## SQL topics
SELECT, GROUP BY, ORDER BY, aggregates, subqueries, CTE, LAG, DENSE_RANK, NULLIF.

## Dataset notes
- `base_salary` is a monthly base amount (derived from an annual salary range).
- `gross_pay = base_salary + overtime_pay + bonus`.
- `total_deductions = tax_deduction + benefit_deduction`.
- `net_salary = gross_pay - total_deductions`.
- One record per employee, so employee counts can use COUNT(*) on the entire dataset.
- Tax rates and benefits are **illustrative** and not legal/payroll advice.
- Monthly comparisons reflect differing sample composition, not same-cohort growth.

## License
Educational portfolio example. No actual employees or confidential payroll data.
