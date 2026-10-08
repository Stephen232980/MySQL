CREATE DATABASE IF NOT EXISTS inotes_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE inotes_db;

CREATE TABLE note_type (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(255)
);

CREATE TABLE notes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    type_id INT,
    FOREIGN KEY (type_id) REFERENCES note_type(id)
);

INSERT INTO note_type (name, description) VALUES ('Cá nhân', 'Ghi chú cá nhân');
INSERT INTO note_type (name, description) VALUES ('Công việc', 'Ghi chú công việc');
INSERT INTO note_type (name, description) VALUES ('Học tập', 'Ghi chú học tập');

