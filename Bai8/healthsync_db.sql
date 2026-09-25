-- ============================================================
-- PHẦN 1: DDL - KHỞI TẠO CƠ SỞ DỮ LIỆU & TẠO BẢNG CHUẨN HÓA
-- ============================================================

-- Xóa bảng cũ nếu đã tồn tại để tránh xung đột
DROP TABLE IF EXISTS Prescriptions;
DROP TABLE IF EXISTS Appointments;

-- 1. Tạo bảng Appointments (Đã tái cấu trúc)
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    
    -- Thay thế is_active bằng cột status dạng ENUM quản lý đa trạng thái
    status ENUM('PENDING', 'CONFIRMED', 'CHECKED_IN', 'COMPLETED', 'CANCELLED') NOT NULL DEFAULT 'PENDING',
    
    -- Các cột quản lý dòng tiền (Dùng DECIMAL tránh sai số làm tròn)
    deposit_amount DECIMAL(12, 2) DEFAULT 0.00,
    penalty_fee DECIMAL(12, 2) DEFAULT 0.00,
    
    -- Cột ghi nhận lý do hủy hẹn
    cancel_reason VARCHAR(255) NULL,
    
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 2. Tạo bảng Prescriptions (Đơn thuốc - Quan hệ 1-1 với Appointments)
CREATE TABLE Prescriptions (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL UNIQUE, -- Unique đảm bảo quan hệ 1-1
    medication_details TEXT NOT NULL,
    issued_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    -- Thiết lập Khóa ngoại trỏ về bảng Appointments
    CONSTRAINT fk_prescriptions_appointments 
        FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- ============================================================
-- PHẦN 2: DML - MÔ PHỎNG LUỒNG NGHIỆP VỤ THỰC TẾ
-- ============================================================

-- KỊCH BẢN 1: Luồng khám bệnh THÀNH CÔNG
-- Bước 1: Khách đặt lịch hẹn và đặt cọc 500.000đ
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status, deposit_amount)
VALUES (101, 201, '2026-10-05 09:00:00', 'PENDING', 500000.00);

-- Bước 2: Bệnh nhân đến phòng khám và Check-in
UPDATE Appointments 
SET status = 'CHECKED_IN' 
WHERE appointment_id = 1;

-- Bước 3: Bác sĩ khám xong, hoàn tất lịch hẹn
UPDATE Appointments 
SET status = 'COMPLETED' 
WHERE appointment_id = 1;

-- Bước 4: Tạo đơn thuốc cho lịch hẹn hoàn tất này
INSERT INTO Prescriptions (appointment_id, medication_details)
VALUES (1, '1. Paracetamol 500mg: 20 viên (Uống 2 lần/ngày sau ăn)\n2. Vitamin C 1000mg: 10 viên (Uống 1 lần/sáng)');


-- KỊCH BẢN 2: Luồng HỦY LỊCH VÀ PHẠT VI PHẠM
-- Bước 1: Khách đặt lịch hẹn, cọc 300.000đ và đã được xác nhận
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status, deposit_amount)
VALUES (102, 202, '2026-10-06 14:00:00', 'CONFIRMED', 300000.00);

-- Bước 2: Khách báo hủy hẹn sát giờ -> Chuyển CANCELLED, ghi lý do & áp phí phạt 150.000đ
UPDATE Appointments 
SET status = 'CANCELLED',
    cancel_reason = 'Bận việc đột xuất',
    penalty_fee = 150000.00
WHERE appointment_id = 2;


-- ============================================================
-- PHẦN 3: TRUY VẤN KIỂM TRA VÀ BÁO CÁO (TESTER)
-- ============================================================

-- Truy vấn lấy danh sách tất cả bệnh nhân đã hoàn tất khám kèm chi tiết đơn thuốc
SELECT 
    a.appointment_id AS 'Mã Lịch Hẹn',
    a.patient_id AS 'Mã Bệnh Nhân',
    a.doctor_id AS 'Mã Bác Sĩ',
    a.appointment_date AS 'Thời Gian Khám',
    a.status AS 'Trạng Thái',
    a.deposit_amount AS 'Tiền Cọc',
    p.prescription_id AS 'Mã Đơn Thuốc',
    p.medication_details AS 'Chi Tiết Đơn Thuốc',
    p.issued_date AS 'Ngày Kê Đơn'
FROM Appointments a
INNER JOIN Prescriptions p ON a.appointment_id = p.appointment_id
WHERE a.status = 'COMPLETED';

-- Truy vấn kiểm tra các lịch hẹn bị hủy và phí phạt phát sinh
SELECT 
    appointment_id AS 'Mã Lịch Hẹn',
    patient_id AS 'Mã Bệnh Nhân',
    status AS 'Trạng Thái',
    deposit_amount AS 'Tiền Cọc',
    penalty_fee AS 'Phí Phạt',
    cancel_reason AS 'Lý Do Hủy'
FROM Appointments
WHERE status = 'CANCELLED';