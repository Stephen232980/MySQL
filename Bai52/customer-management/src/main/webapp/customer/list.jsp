<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Danh sách khách hàng</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; background-color: #f8fafc; }
        h1 { color: #1b2a7a; }
        table { border-collapse: collapse; width: 100%; margin-top: 20px; background: white; border-radius: 8px; overflow: hidden; box-shadow: 0 4px 6px rgba(0,0,0,0.05); }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #1b2a7a; color: white; }
        tr:hover { background-color: #f1f5f9; }
        .btn { display: inline-block; padding: 8px 16px; text-decoration: none; border-radius: 4px; font-weight: bold; font-size: 14px; }
        .btn-create { background-color: #27ae60; color: white; margin-bottom: 15px; }
        .btn-edit { color: #2980b9; text-decoration: none; margin-right: 10px; }
        .btn-delete { color: #c0392b; text-decoration: none; }
        .btn-view { color: #1b2a7a; text-decoration: none; margin-right: 10px; font-weight: bold; }
    </style>
</head>
<body>
    <h1>Danh Sách Khách Hàng</h1>
    <a href="${pageContext.request.contextPath}/customers?action=create" class="btn btn-create">Thêm khách hàng mới</a>
    
    <table>
        <thead>
            <tr>
                <th>Họ và Tên</th>
                <th>Email</th>
                <th>Địa chỉ</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${requestScope.customers}" var="customer">
                <tr>
                    <td>
                        <a href="${pageContext.request.contextPath}/customers?action=view&id=${customer.id}" class="btn-view">${customer.name}</a>
                    </td>
                    <td>${customer.email}</td>
                    <td>${customer.address}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/customers?action=edit&id=${customer.id}" class="btn-edit">Sửa</a>
                        <a href="${pageContext.request.contextPath}/customers?action=delete&id=${customer.id}" class="btn-delete">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>