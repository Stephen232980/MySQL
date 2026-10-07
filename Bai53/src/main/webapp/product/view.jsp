<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chi tiết sản phẩm</title>
</head>
<body>
<h1>Chi tiết sản phẩm</h1>
<p><a href="/products">Quay lại danh sách</a></p>
<table>
    <tr>
        <td>ID:</td>
        <td>${product.id}</td>
    </tr>
    <tr>
        <td>Tên sản phẩm:</td>
        <td>${product.name}</td>
    </tr>
    <tr>
        <td>Giá:</td>
        <td>${product.price}</td>
    </tr>
    <tr>
        <td>Mô tả:</td>
        <td>${product.description}</td>
    </tr>
    <tr>
        <td>Nhà sản xuất:</td>
        <td>${product.manufacturer}</td>
    </tr>
</table>
</body>
</html>

