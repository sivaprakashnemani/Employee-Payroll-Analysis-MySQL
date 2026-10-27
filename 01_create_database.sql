-- Run this file FIRST in MySQL Workbench 8.0+ (Ctrl+Shift+Enter or lightning bolt)
CREATE DATABASE IF NOT EXISTS employee_payroll_analysis CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE employee_payroll_analysis;
CREATE TABLE IF NOT EXISTS employee_payroll (
 payroll_id INT PRIMARY KEY,
 employee_id INT NOT NULL,
 employee_name VARCHAR(100) NOT NULL,
 department VARCHAR(60) NOT NULL,
 job_title VARCHAR(100) NOT NULL,
 location VARCHAR(100) NOT NULL,
 hire_date DATE NOT NULL,
 pay_month DATE NOT NULL,
 base_salary DECIMAL(12,2) NOT NULL,
 overtime_pay DECIMAL(12,2) NOT NULL,
 bonus DECIMAL(12,2) NOT NULL,
 gross_pay DECIMAL(12,2) NOT NULL,
 tax_deduction DECIMAL(12,2) NOT NULL,
 benefit_deduction DECIMAL(12,2) NOT NULL,
 total_deductions DECIMAL(12,2) NOT NULL,
 net_salary DECIMAL(12,2) NOT NULL,
 employment_type VARCHAR(20) NOT NULL,
 INDEX idx_department (department),
 INDEX idx_pay_month (pay_month),
 INDEX idx_employee (employee_id)
);
-- Confirm table exists
SHOW TABLES;
