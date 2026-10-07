<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Xóa sản phẩm</title>
</head>
<body>
<h1>Xóa sản phẩm</h1>
<p>Bạn có chắc chắn muốn xóa sản phẩm này?</p>
<p><a href="/products">Quay lại danh sách</a></p>
<form method="post" action="/products?action=delete">
    <input type="hidden" name="id" value="${product.id}">
    <table>
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
        <tr>
            <td></td>
            <td><input type="submit" value="Xóa sản phẩm"></td>
        </tr>
    </table>
</form>
</body>
</html>

