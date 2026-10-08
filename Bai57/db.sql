USE demo;

-- 1. Tạo bảng Permission
CREATE TABLE permission (
    id INT(11) PRIMARY KEY,
    name VARCHAR(50)
);

-- 2. Tạo bảng trung gian User_Permission
CREATE TABLE user_permission (
    user_id INT(11),
    permission_id INT(11),
    PRIMARY KEY(user_id, permission_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (permission_id) REFERENCES permission(id)
);

-- 3. Thêm một số dữ liệu mẫu cho bảng Permission
INSERT INTO permission(id, name) VALUES (1, 'add');
INSERT INTO permission(id, name) VALUES (2, 'edit');
INSERT INTO permission(id, name) VALUES (3, 'delete');
INSERT INTO permission(id, name) VALUES (4, 'view');