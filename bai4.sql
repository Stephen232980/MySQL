-- 1. Tạo mới cơ sở dữ liệu student_management
CREATE DATABASE IF NOT EXISTS `student_management`;

-- 2. Chuyển sang sử dụng CSDL này
USE `student_management`;

-- 3. Tạo bảng Class
CREATE TABLE IF NOT EXISTS Class (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- 4. Tạo bảng Teacher
CREATE TABLE IF NOT EXISTS Teacher (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT,
    country VARCHAR(255)
);