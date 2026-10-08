<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thêm Mới Ghi Chú - iNotes</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input[type="text"], select, textarea { width: 100%; padding: 8px; box-sizing: border-box; }
        textarea { height: 150px; }
        .btn { padding: 10px 15px; text-decoration: none; background: #007bff; color: white; border-radius: 4px; border: none; cursor: pointer; }
        .btn-cancel { background: #6c757d; }
    </style>
</head>
<body>
    <h2>Thêm Mới Ghi Chú</h2>
    
    <form action="add" method="post" style="max-width: 600px;">
        <div class="form-group">
            <label>Tiêu đề:</label>
            <input type="text" name="title" placeholder="Nhập tiêu đề ghi chú..." required>
        </div>
        
        <div class="form-group">
            <label>Phân loại:</label>
            <select name="typeId" required>
                <option value="1">Cá nhân</option>
                <option value="2">Công việc</option>
                <option value="3">Học tập</option>
            </select>
        </div>
        
        <div class="form-group">
            <label>Nội dung:</label>
            <textarea name="content" placeholder="Nhập nội dung chi tiết..." required></textarea>
        </div>
        
        <div>
            <button type="submit" class="btn">Lưu Ghi Chú</button>
            <a href="${pageContext.request.contextPath}/" class="btn btn-cancel">Hủy bỏ</a>
        </div>
    </form>
</body>
</html>

