-- HỆ THỐNG PAYFLOW (LEGACY SCRIPT)
CREATE DATABASE IF NOT EXISTS payflow_db;
USE payflow_db;

CREATE TABLE Transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(15,2),
    transaction_type VARCHAR(20), -- 'DEPOSIT', 'WITHDRAW', 'TRANSFER'
    created_at DATETIME
);

-- (Giả lập: Bảng này đang chứa 5,000,000 dòng dữ liệu thực tế)

-- ========================================================
-- BÁO CÁO GÂY SẬP HỆ THỐNG (Lỗi do Kế toán viết)
-- ========================================================
EXPLAIN 
SELECT SUM(amount) AS total_deposit
FROM Transactions
WHERE transaction_type = 'DEPOSIT' 
  AND YEAR(created_at) = 2026 
  AND MONTH(created_at) = 6;