-- HỆ THỐNG SMARTFACTORY (LEGACY SCRIPT)
-- Vấn đề: Tối ưu mù quáng tốc độ Đọc (Read), phá hủy tốc độ Ghi (Write) và Storage.

CREATE DATABASE IF NOT EXISTS smartfactory_db;
USE smartfactory_db;

CREATE TABLE SensorLogs (
    log_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    sensor_id INT NOT NULL,
    recorded_at DATETIME NOT NULL,
    temperature DECIMAL(5,2),
    humidity DECIMAL(5,2),
    status VARCHAR(20) -- 'NORMAL', 'WARNING', 'CRITICAL'
);

-- ========================================================
-- "FAT INDEX" GÂY THẢM HỌA (Lập trình viên cũ đã chạy đoạn này)
-- Kỹ sư cũ nhét TẤT CẢ các cột vào Index để SELECT không cần nhìn vào Table!
-- ========================================================
CREATE INDEX idx_fat_covering ON SensorLogs(sensor_id, recorded_at, temperature, humidity, status);

-- Truy vấn từ Dashboard (Chạy siêu nhanh vì chỉ cần đọc trên Index):
-- SELECT temperature, humidity, status FROM SensorLogs 
-- WHERE sensor_id = 105 AND recorded_at >= '2026-06-20';