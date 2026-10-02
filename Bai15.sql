-- Hiển thị tất cả các sinh viên có tên bắt đầu bằng ký tự 'h'
SELECT * 
FROM Student 
WHERE StudentName LIKE 'h%';
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12
SELECT * 
FROM Class 
WHERE MONTH(StartDate) = 12;
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5
SELECT * 
FROM Subject 
WHERE Credit BETWEEN 3 AND 5;
-- Thay đổi mã lớp (ClassID) của sinh viên có tên 'Hung' là 2
UPDATE Student 
SET ClassId = 2 
WHERE StudentName = 'Hung';
-- Hiển thị thông tin StudentName, SubName, Mark (sắp xếp giảm dần theo điểm, nếu trùng sắp theo tên tăng dần)
SELECT s.StudentName, sub.SubName, m.Mark 
FROM Student s 
JOIN Mark m ON s.StudentId = m.StudentId 
JOIN Subject sub ON m.SubId = sub.SubId 
ORDER BY m.Mark DESC, s.StudentName ASC;