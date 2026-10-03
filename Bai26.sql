-- Bước 1: Tạo cơ sở dữ liệu demo
CREATE DATABASE IF NOT EXISTS demo;
USE demo;

-- Bước 2: Tạo bảng Products
DROP TABLE IF EXISTS Products;
CREATE TABLE Products (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    productCode VARCHAR(20) NOT NULL,
    productName VARCHAR(100) NOT NULL,
    productPrice DECIMAL(12, 2) NOT NULL,
    productAmount INT NOT NULL,
    productDescription TEXT,
    productStatus VARCHAR(20) DEFAULT 'Active'
);

-- Chèn dữ liệu mẫu vào bảng Products
INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus) VALUES
('P001', 'Laptop Dell XPS 13', 25000000, 10, 'Laptop mỏng nhẹ, pin trâu', 'Active'),
('P002', 'Bàn phím cơ Keychron K2', 1800000, 25, 'Bàn phím cơ không dây Bluetooth', 'Active'),
('P003', 'Chuột Logitech MX Master 3', 2100000, 15, 'Chuột công thái học cao cấp', 'Active'),
('P004', 'Màn hình LG 27 Inch 4K', 8500000, 8, 'Màn hình hiển thị màu chuẩn đồ họa', 'Inactive'),
('P005', 'Tai nghe Sony WH-1000XM4', 6200000, 12, 'Tai nghe chống ồn chủ động', 'Active');

-- Thao tác với Index và kiểm tra bằng EXPLAIN
-- Kiểm tra truy vấn theo productCode
EXPLAIN SELECT * FROM Products WHERE productCode = 'P002';

-- Kiểm tra truy vấn theo productName và productPrice
EXPLAIN SELECT * FROM Products WHERE productName = 'Laptop Dell XPS 13' AND productPrice = 25000000;
-- Tạo Unique Index trên cột productCode
CREATE UNIQUE INDEX idx_productCode ON Products (productCode);

-- Tạo Composite Index trên 2 cột productName và productPrice
CREATE INDEX idx_name_price ON Products (productName, productPrice);
-- Thử lại lệnh EXPLAIN
EXPLAIN SELECT * FROM Products WHERE productCode = 'P002';
-- Kết quả: Cột 'type' chuyển thành 'const', cột 'key' ghi nhận 'idx_productCode'

EXPLAIN SELECT * FROM Products WHERE productName = 'Laptop Dell XPS 13' AND productPrice = 25000000;
-- Kết quả: Cột 'key' ghi nhận 'idx_name_price', số dòng quét ('rows') giảm xuống tối đa

-- 1. Tạo view lấy về: productCode, productName, productPrice, productStatus
CREATE VIEW view_products AS
SELECT productCode, productName, productPrice, productStatus
FROM Products;

-- Xem dữ liệu từ View vừa tạo
SELECT * FROM view_products;

-- 2. Tiến hành sửa đổi view (Thêm cột productAmount)
CREATE OR REPLACE VIEW view_products AS
SELECT productCode, productName, productPrice, productAmount, productStatus
FROM Products;

-- Kiểm tra lại sau khi cập nhật cấu trúc view
SELECT * FROM view_products;

-- 3. Tiến hành xoá view
DROP VIEW IF EXISTS view_products;

DELIMITER //
-- Tạo các Stored Procedure
-- 1. Procedure lấy tất cả thông tin của tất cả các sản phẩm
DROP PROCEDURE IF EXISTS sp_get_all_products //
CREATE PROCEDURE sp_get_all_products()
BEGIN
    SELECT * FROM Products;
END //

-- 2. Procedure thêm một sản phẩm mới
DROP PROCEDURE IF EXISTS sp_add_product //
CREATE PROCEDURE sp_add_product(
    IN p_code VARCHAR(20),
    IN p_name VARCHAR(100),
    IN p_price DECIMAL(12, 2),
    IN p_amount INT,
    IN p_desc TEXT,
    IN p_status VARCHAR(20)
)
BEGIN
    INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
    VALUES (p_code, p_name, p_price, p_amount, p_desc, p_status);
END //

-- 3. Procedure sửa thông tin sản phẩm theo id
DROP PROCEDURE IF EXISTS sp_update_product_by_id //
CREATE PROCEDURE sp_update_product_by_id(
    IN p_id INT,
    IN p_code VARCHAR(20),
    IN p_name VARCHAR(100),
    IN p_price DECIMAL(12, 2),
    IN p_amount INT,
    IN p_desc TEXT,
    IN p_status VARCHAR(20)
)
BEGIN
    UPDATE Products
    SET 
        productCode = p_code,
        productName = p_name,
        productPrice = p_price,
        productAmount = p_amount,
        productDescription = p_desc,
        productStatus = p_status
    WHERE Id = p_id;
END //

-- 4. Procedure xoá sản phẩm theo id
DROP PROCEDURE IF EXISTS sp_delete_product_by_id //
CREATE PROCEDURE sp_delete_product_by_id(
    IN p_id INT
)
BEGIN
    DELETE FROM Products WHERE Id = p_id;
END //

DELIMITER ;
-- Các câu lệnh chạy thử Stored Procedure
-- Lấy danh sách
CALL sp_get_all_products();

-- Thêm sản phẩm mới
CALL sp_add_product('P006', 'Webcam FullHD 1080P', 950000, 20, 'Webcam học online rõ nét', 'Active');

-- Sửa sản phẩm có ID = 1
CALL sp_update_product_by_id(1, 'P001', 'Laptop Dell XPS 13 9310', 26500000, 8, 'Bản nâng cấp RAM 16GB', 'Active');

-- Xoá sản phẩm có ID = 4
CALL sp_delete_product_by_id(4);

-- Kiểm tra lại kết quả
CALL sp_get_all_products();