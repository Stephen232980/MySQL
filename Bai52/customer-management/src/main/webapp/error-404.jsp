<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Không tìm thấy khách hàng - 404</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; margin-top: 100px; background-color: #f8fafc; }
        .error-container { background: white; padding: 40px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); display: inline-block; width: 450px; }
        h1 { color: #c0392b; font-size: 48px; margin: 0; }
        h2 { color: #333; margin-top: 10px; }
        p { color: #666; margin: 15px 0; }
        .home-btn { display: inline-block; padding: 10px 20px; background-color: #1b2a7a; color: white; text-decoration: none; border-radius: 4px; font-weight: bold; margin-top: 15px; }
    </style>
</head>
<body>
    <div class="error-container">
        <h1>404</h1>
        <h2>Không tìm thấy khách hàng!</h2>
        <p>Xin lỗi, dữ liệu khách hàng bạn yêu cầu hiện không tồn tại hoặc đã bị xóa khỏi hệ thống.</p>
        <a href="${pageContext.request.contextPath}/customers" class="home-btn">Quay lại danh sách chính</a>
    </div>
</body>
</html>