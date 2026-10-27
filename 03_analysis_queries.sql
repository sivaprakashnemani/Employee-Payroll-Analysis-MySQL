USE employee_payroll_analysis;

-- 01. Record count
SELECT COUNT(*) AS payroll_records, COUNT(DISTINCT employee_id) AS unique_employees FROM employee_payroll;

-- 02. Total net payroll
SELECT ROUND(SUM(net_salary),2) AS total_net_payroll FROM employee_payroll;

-- 03. Total gross payroll
SELECT ROUND(SUM(gross_pay),2) AS total_gross_payroll FROM employee_payroll;

-- 04. Average net pay
SELECT ROUND(AVG(net_salary),2) AS average_net_pay FROM employee_payroll;

-- 05. Highest and lowest net pay
SELECT MAX(net_salary) AS highest_net_pay, MIN(net_salary) AS lowest_net_pay FROM employee_payroll;

-- 06. Department employee counts
SELECT department, COUNT(*) AS employees FROM employee_payroll GROUP BY department ORDER BY employees DESC;

-- 07. Department net payroll
SELECT department, ROUND(SUM(net_salary),2) AS net_payroll FROM employee_payroll GROUP BY department ORDER BY net_payroll DESC;

-- 08. Department average gross pay
SELECT department, ROUND(AVG(gross_pay),2) AS avg_gross_pay FROM employee_payroll GROUP BY department ORDER BY avg_gross_pay DESC;

-- 09. Top ten earners
SELECT employee_id, employee_name, department, net_salary FROM employee_payroll ORDER BY net_salary DESC LIMIT 10;

-- 10. Total bonuses by department
SELECT department, SUM(bonus) AS total_bonus FROM employee_payroll GROUP BY department ORDER BY total_bonus DESC;

-- 11. Overtime by department
SELECT department, SUM(overtime_pay) AS total_overtime FROM employee_payroll GROUP BY department ORDER BY total_overtime DESC;

-- 12. Total taxes and benefits
SELECT ROUND(SUM(tax_deduction),2) AS taxes, ROUND(SUM(benefit_deduction),2) AS benefits FROM employee_payroll;

-- 13. Deduction percentage
SELECT ROUND(100*SUM(total_deductions)/NULLIF(SUM(gross_pay),0),2) AS deduction_pct FROM employee_payroll;

-- 14. Monthly net payroll
SELECT DATE_FORMAT(pay_month, '%Y-%m') AS payroll_month, ROUND(SUM(net_salary),2) AS total_net_payroll FROM employee_payroll GROUP BY pay_month ORDER BY pay_month;

-- 15. Monthly employee count
SELECT DATE_FORMAT(pay_month, '%Y-%m') AS payroll_month, COUNT(*) AS records FROM employee_payroll GROUP BY pay_month ORDER BY pay_month;

-- 16. Location payroll
SELECT location, COUNT(*) AS employees, ROUND(SUM(net_salary),2) AS net_payroll FROM employee_payroll GROUP BY location ORDER BY net_payroll DESC;

-- 17. Employment type split
SELECT employment_type, COUNT(*) AS employees, ROUND(AVG(net_salary),2) AS average_net_pay FROM employee_payroll GROUP BY employment_type;

-- 18. Employees with above-average net pay
SELECT employee_id, employee_name, department, net_salary FROM employee_payroll WHERE net_salary > (SELECT AVG(net_salary) FROM employee_payroll) ORDER BY net_salary DESC;

-- 19. Department ranking using window function
SELECT department, total_net_payroll, DENSE_RANK() OVER (ORDER BY total_net_payroll DESC) AS payroll_rank FROM (SELECT department, ROUND(SUM(net_salary),2) AS total_net_payroll FROM employee_payroll GROUP BY department) d;

-- 20. Monthly trend with previous month comparison
WITH monthly AS (SELECT pay_month, SUM(net_salary) AS net_payroll FROM employee_payroll GROUP BY pay_month), trends AS (SELECT pay_month, net_payroll, LAG(net_payroll) OVER (ORDER BY pay_month) AS previous_month_payroll FROM monthly) SELECT DATE_FORMAT(pay_month, '%Y-%m') AS payroll_month, ROUND(net_payroll,2) AS net_payroll, ROUND(previous_month_payroll,2) AS previous_month_payroll, ROUND(100*(net_payroll-previous_month_payroll)/NULLIF(previous_month_payroll,0),2) AS month_over_month_pct FROM trends ORDER BY pay_month;
