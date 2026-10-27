USE employee_payroll_analysis;
SELECT COUNT(*) AS row_count, COUNT(DISTINCT payroll_id) AS distinct_payroll_ids FROM employee_payroll;
SELECT COUNT(*) AS incorrect_gross FROM employee_payroll WHERE ABS(gross_pay-(base_salary+overtime_pay+bonus))>0.01;
SELECT COUNT(*) AS incorrect_deductions FROM employee_payroll WHERE ABS(total_deductions-(tax_deduction+benefit_deduction))>0.01;
SELECT COUNT(*) AS incorrect_net FROM employee_payroll WHERE ABS(net_salary-(gross_pay-total_deductions))>0.01;
SELECT MIN(pay_month) AS earliest_month, MAX(pay_month) AS latest_month FROM employee_payroll;
