-- HỆ THỐNG QUICKFEED (LEGACY SCRIPT)
-- Vấn đề: Lạm dụng Index vô tội vạ gây sụp đổ tốc độ GHI (Write) và cạn kiệt ổ cứng.

CREATE DATABASE IF NOT EXISTS quickfeed_db;
USE quickfeed_db;

CREATE TABLE Posts (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    content TEXT,
    post_type VARCHAR(10), -- Chỉ chứa 3 giá trị: 'TEXT', 'IMAGE', 'VIDEO'
    is_visible BOOLEAN DEFAULT 1, -- Chỉ chứa 1 (Hiện) hoặc 0 (Ẩn)
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ========================================================
-- THẢM HỌA OVER-INDEXING (Lập trình viên cũ đã chạy đoạn này)
-- ========================================================
CREATE INDEX idx_user_id ON Posts(user_id);
-- LỖI 1: Index cột TEXT gây phình to dung lượng ổ cứng khủng khiếp
CREATE INDEX idx_content ON Posts(content(255)); 
-- LỖI 2: Cardinality quá thấp (3 giá trị), MySQL Optimizer thường sẽ bỏ qua Index này
CREATE INDEX idx_post_type ON Posts(post_type); 
-- LỖI 3: Cardinality cực thấp (2 giá trị), vô dụng và tốn chi phí bảo trì cây B-Tree
CREATE INDEX idx_is_visible ON Posts(is_visible); 
CREATE INDEX idx_created_at ON Posts(created_at);