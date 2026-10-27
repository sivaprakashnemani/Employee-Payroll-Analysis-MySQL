# Beginner instructions — MySQL Workbench 8.0+

## 0. Extract ZIP
Right-click ZIP > Extract All. Keep folder structure. You do **not** need to import the CSV to MySQL because the SQL data-loading script already includes all 500 rows.

## 1. Connect to server
Launch **MySQL Workbench**. On the home screen double-click **Local instance MySQL80** (or your existing connection). Enter your MySQL password. Confirm you see a query editor tab and left-side **SCHEMAS**. If no connection tile exists, you must configure/start a MySQL Server 8.0 instance (Workbench alone is only a client).

## 2. Open the first script
In the connected Workbench window select **File > Open SQL Script** and open `sql/01_create_database.sql`. You should see SQL text in a tab with `.sql` at the top.

## 3. Run entire script
Click inside the SQL text. Use **Ctrl+Shift+Enter** (Execute All or Selection), or toolbar lightning bolt for execute-all/selection. The **Action Output** panel at bottom should show green checkmarks. If the lightning bolt is grey: ensure your connection is active and SQL editor tab is selected; reconnect using **Database > Connect to Database**, then reopen script. The lightning bolt is not on the Workbench home screen.

## 4. Confirm database
In SCHEMAS panel click refresh (two arrows). Expand `employee_payroll_analysis` > Tables. You should see `employee_payroll`. If no tables appear, check Action Output for errors.

## 5. Load 500 records
**File > Open SQL Script** > `sql/02_load_sample_data.sql`; click editor; press **Ctrl+Shift+Enter** to run whole file. Wait for all INSERT statements. At bottom you should see result `expected_500 = 500`. Re-running the script replaces the sample records.

## 6. Validate
Open `sql/04_validate_data.sql`, run whole file. The first result should show `row_count = 500`; each incorrect_* result should be `0`. Workbench may show multiple result tabs; click each.

## 7. Run the 20 analysis queries
Open `sql/03_analysis_queries.sql`. Highlight **one complete SELECT statement ending in `;`**, then **Ctrl+Enter** to execute selection. Or press **Ctrl+Shift+Enter** to execute all queries. Inspect result grids along bottom.

## 8. Use the CSV in Power BI
Power BI Desktop > Home > Get Data > Text/CSV > choose `data/employee_payroll_500.csv` > Transform Data. Set hire_date and pay_month to Date, pay amounts to Decimal Number. Close & Apply. See Power BI guide.

## Troubleshooting
- **Grey lightning bolt**: no active SQL editor connection; open server connection from Workbench home and open the .sql in that connected editor.
- **No results**: check bottom **Action Output** for success or error; run `SELECT COUNT(*) FROM employee_payroll_analysis.employee_payroll;` in a new query tab.
- **Error 1046 No database selected**: run `USE employee_payroll_analysis;` first.
- **Error 1049 Unknown database**: run file 01 first.
- **Error 1146 Table doesn't exist**: run file 01 and ensure successful creation.
- **Error 2003 Can't connect**: MySQL Server is stopped/not installed; start/configure the server.
- **Error 1064 syntax**: select entire statement including semicolon, not a partial fragment.
- **CSV import not needed**: file 02 loads data directly without Workbench Import Wizard.
- **Can't find run button**: in connected SQL editor use Ctrl+Shift+Enter. You can also click **Query > Execute (All or Selection)**.
