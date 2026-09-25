-- 1. Tạo cơ sở dữ liệu QuanLyBanHang
CREATE DATABASE QuanLyBanHang;
USE QuanLyBanHang;

-- 2. Tạo bảng Customer (Khách hàng)
CREATE TABLE Customer (
    cID INT AUTO_INCREMENT PRIMARY KEY,
    cName VARCHAR(50) NOT NULL,
    cAge TINYINT CHECK (cAge > 0)
);

-- 3. Tạo bảng Product (Sản phẩm)
CREATE TABLE Product (
    pID INT AUTO_INCREMENT PRIMARY KEY,
    pName VARCHAR(100) NOT NULL,
    pPrice DECIMAL(12, 2) NOT NULL CHECK (pPrice >= 0)
);

-- 4. Tạo bảng Order (Hóa đơn)
CREATE TABLE `Order` (
    oID INT AUTO_INCREMENT PRIMARY KEY,
    cID INT NOT NULL,
    oDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    oTotalPrice DECIMAL(12, 2) DEFAULT NULL,
    
    -- Khóa ngoại kết nối tới bảng Customer
    CONSTRAINT FK_Order_Customer FOREIGN KEY (cID) 
        REFERENCES Customer(cID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- 5. Tạo bảng OrderDetail (Chi tiết hóa đơn - Bảng trung gian)
CREATE TABLE OrderDetail (
    oID INT NOT NULL,
    pID INT NOT NULL,
    odQTY INT NOT NULL CHECK (odQTY > 0),
    
    -- Khóa chính phức hợp gồm (oID, pID)
    PRIMARY KEY (oID, pID),
    
    -- Khóa ngoại kết nối tới bảng Order và Product
    CONSTRAINT FK_OrderDetail_Order FOREIGN KEY (oID) 
        REFERENCES `Order`(oID)
        ON DELETE CASCADE ON UPDATE CASCADE,
        
    CONSTRAINT FK_OrderDetail_Product FOREIGN KEY (pID) 
        REFERENCES Product(pID)
        ON DELETE CASCADE ON UPDATE CASCADE
);