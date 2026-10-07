<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Xác nhận xóa khách hàng</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; background-color: #f8fafc; }
        .delete-container { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); max-width: 500px; margin: auto; text-align: center; }
        h2 { color: #c0392b; }
        p { font-size: 16px; color: #555; line-height: 1.5; }
        .btn-group { margin-top: 20px; }
        .btn { display: inline-block; padding: 10px 20px; text-decoration: none; border-radius: 4px; font-weight: bold; margin: 0 10px; cursor: pointer; }
        .btn-confirm { background-color: #c0392b; color: white; border: none; font-size: 16px; }
        .btn-confirm:hover { background-color: #a93226; }
        .btn-cancel { background-color: #bdc3c7; color: #333; text-decoration: none; }
        .btn-cancel:hover { background-color: #95a5a6; }
    </style>
</head>
<body>
    <div class="delete-container">
        <h2>XÁC NHẬN XÓA KHÁCH HÀNG</h2>
        <p>Bạn có chắc chắn muốn xóa khách hàng sau khỏi danh sách hệ thống?</p>
        <p><strong>Họ và tên:</strong> ${requestScope.customer.name}<br>
           <strong>Email:</strong> ${requestScope.customer.email}</p>
        
        <form action="${pageContext.request.contextPath}/customers?action=delete" method="POST">
            <input type="hidden" name="id" value="${requestScope.customer.id}" />
            <div class="btn-group">
                <button type="submit" class="btn btn-confirm">Đồng ý xóa</button>
                <a href="${pageContext.request.contextPath}/customers" class="btn btn-cancel">Hủy bỏ</a>
            </div>
        </form>
    </div>
</body>
</html>