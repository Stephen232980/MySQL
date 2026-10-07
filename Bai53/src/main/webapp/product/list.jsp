<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách sản phẩm</title>
    <style>
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #dddddd; text-align: left; padding: 8px; }
        th { background-color: #f2f2f2; }
        .action-links a { margin-right: 10px; }
        .search-box { margin-bottom: 20px; }
    </style>
</head>
<body>
<h1>Danh sách sản phẩm</h1>
<p><a href="/products?action=create">Thêm sản phẩm mới</a></p>

<div class="search-box">
    <form action="/products" method="get">
        <input type="hidden" name="action" value="search">
        <input type="text" name="name" placeholder="Nhập tên sản phẩm...">
        <button type="submit">Tìm kiếm</button>
    </form>
</div>

<table>
    <tr>
        <th>ID</th>
        <th>Tên sản phẩm</th>
        <th>Giá</th>
        <th>Mô tả</th>
        <th>Nhà sản xuất</th>
        <th>Hành động</th>
    </tr>
    <c:forEach items="${products}" var="product">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.description}</td>
            <td>${product.manufacturer}</td>
            <td class="action-links">
                <a href="/products?action=edit&id=${product.id}">Sửa</a>
                <a href="/products?action=delete&id=${product.id}">Xóa</a>
                <a href="/products?action=view&id=${product.id}">Xem</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

