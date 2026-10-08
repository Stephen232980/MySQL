Use demo;
CREATE TABLE Employee ( 
    id INT(3) NOT NULL AUTO_INCREMENT, 
    name VARCHAR(120) NOT NULL, 
    salary INT(220) NOT NULL, 
    created_Date DATETIME, 
    PRIMARY KEY (id) 
);DELIMITER 
CREATE PROCEDURE get_all_users()
BEGIN
    SELECT * FROM users;
END

CREATE PROCEDURE update_user(IN user_id int, IN user_name varchar(50), IN user_email varchar(50), IN user_country varchar(50))
BEGIN
    UPDATE users SET name = user_name, email = user_email, country = user_country WHERE id = user_id;
END

CREATE PROCEDURE delete_user(IN user_id int)
BEGIN
    DELETE FROM users WHERE id = user_id;
END
DELIMITER ;
