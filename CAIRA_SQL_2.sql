-- =========================================================
-- QUERIES FOR STUDY:
-- =========================================================

SELECT account_type, SUM(amount) AS total_amount
FROM v_finance_activity
GROUP BY account_type;

SELECT account_type, SUM(amount) AS total_amount
FROM v_finance_activity
WHERE account_type IN ('Revenue','Expense')
GROUP BY account_type;

SELECT txn_month, SUM(amount) AS net_amount
FROM v_finance_activity
GROUP BY txn_month
ORDER BY txn_month;

SELECT
txn_month,
SUM(CASE WHEN account_type = 'Revenue' THEN amount ELSE 0 END) AS revenue,
SUM(CASE WHEN account_type = 'Expense' THEN amount ELSE 0 END) AS expense
FROM v_finance_activity
GROUP BY txn_month
ORDER BY txn_month;

SELECT account_type, AVG(amount) AS avg_amount
FROM v_finance_activity
GROUP BY account_type;

SELECT
MAX(amount) AS largest_transaction,
MIN(amount) AS smallest_transaction
FROM v_finance_activity;

SELECT department_name, SUM(amount) AS total_expense
FROM v_finance_activity
WHERE account_type = 'Expense'
GROUP BY department_name
ORDER BY total_expense;

SELECT department_name, SUM(amount) AS total_expense
FROM v_finance_activity
WHERE account_type = 'Expense'
AND txn_month = '2025-03'
GROUP BY department_name
ORDER BY total_expense;

SELECT department_name, SUM(amount) AS total_revenue
FROM v_finance_activity
WHERE account_type = 'Revenue'
AND (department_name = 'Sales' OR department_name = 'Marketing')
GROUP BY department_name;

SELECT department_name, SUM(amount) AS total_expense
FROM v_finance_activity
WHERE account_type = 'Expense'
GROUP BY department_name
HAVING SUM(amount) < -200000
ORDER BY total_expense;