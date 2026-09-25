-- ============================================================
-- DỰ ÁN: AUTORIDE DATABASE OPTIMIZATION
-- File: autoride_db.sql
-- ============================================================

CREATE DATABASE IF NOT EXISTS autoride_db;
USE autoride_db;

-- Xóa bảng cũ nếu tồn tại để chạy lại kịch bản sạch
DROP TABLE IF EXISTS Inspections;
DROP TABLE IF EXISTS Rentals;

-- Tạo lại cấu trúc bảng Rentals sơ khai (Legacy Schema)
CREATE TABLE Rentals (
    rental_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    car_id INT NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    status VARCHAR(20) DEFAULT 'ACTIVE'
);

-- ============================================================
-- PHẦN 1: DDL - NÂNG CẤP VÀ TỐI ƯU HÓA CƠ SỞ DỮ LIỆU (BƯỚC 2 & 3)
-- ============================================================

-- 1. Điều chỉnh bảng Rentals hiện tại bằng ALTER TABLE
ALTER TABLE Rentals
    MODIFY COLUMN status ENUM('BOOKED', 'ACTIVE', 'COMPLETED', 'CANCELLED') NOT NULL DEFAULT 'BOOKED',
    ADD COLUMN security_deposit DECIMAL(12, 2) NOT NULL DEFAULT 0.00 AFTER end_date,
    ADD COLUMN late_fee DECIMAL(12, 2) NOT NULL DEFAULT 0.00 AFTER security_deposit,
    ADD COLUMN damage_fee DECIMAL(12, 2) NOT NULL DEFAULT 0.00 AFTER late_fee;

-- 2. Xây dựng bảng mới Inspections (Biên bản kiểm tra xe)
CREATE TABLE Inspections (
    inspection_id INT AUTO_INCREMENT PRIMARY KEY,
    rental_id INT NOT NULL,
    inspection_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    damage_description TEXT NULL,
    inspector_name VARCHAR(100) NOT NULL,
    
    -- Ràng buộc khóa ngoại chặt chẽ với ON DELETE RESTRICT
    CONSTRAINT fk_inspections_rentals
        FOREIGN KEY (rental_id) REFERENCES Rentals(rental_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- ============================================================
-- PHẦN 2: DML - MÔ PHỎNG LUỒNG NGHIỆP VỤ THỰC TẾ (BƯỚC 4)
-- ============================================================

-- Bước 4.1: Khách hàng "Nguyen Van A" thuê xe, đóng cọc 10.000.000 VNĐ, trạng thái ACTIVE
INSERT INTO Rentals (customer_name, car_id, start_date, end_date, security_deposit, status)
VALUES ('Nguyen Van A', 101, '2026-09-20 08:00:00', '2026-09-25 10:00:00', 10000000.00, 'ACTIVE');

-- Bước 4.2 & 4.3: Khách trả xe, nhân viên kiểm tra phát hiện vỡ đèn pha và ghi nhận vào Inspections
INSERT INTO Inspections (rental_id, inspection_date, damage_description, inspector_name)
VALUES (1, '2026-09-25 10:15:00', 'Vỡ đèn pha trái', 'Tran Van B');

-- Bước 4.4: Cập nhật bảng Rentals: Trạng thái COMPLETED, late_fee = 0, damage_fee = 2.000.000 VNĐ
UPDATE Rentals
SET status = 'COMPLETED',
    late_fee = 0.00,
    damage_fee = 2000000.00
WHERE rental_id = 1;

-- ============================================================
-- PHẦN 3: TRUY VẤN TÍNH SỐ TIỀN HOÀN TRẢ CHO KHÁCH HÀNG
-- ============================================================

SELECT 
    r.rental_id AS 'Mã Hợp Đồng',
    r.customer_name AS 'Khách Hàng',
    r.status AS 'Trạng Thái',
    r.security_deposit AS 'Tiền Cọc (VNĐ)',
    r.late_fee AS 'Phí Trễ Hạn (VNĐ)',
    r.damage_fee AS 'Phí Hư Hỏng (VNĐ)',
    i.damage_description AS 'Ghi Chú Kiểm Tra',
    (r.security_deposit - r.late_fee - r.damage_fee) AS 'Số Tiền Hoàn Trả (VNĐ)'
FROM Rentals r
LEFT JOIN Inspections i ON r.rental_id = i.rental_id
WHERE r.rental_id = 1;