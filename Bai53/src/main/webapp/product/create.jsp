<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Thêm sản phẩm mới</title>
</head>
<body>
<h1>Thêm sản phẩm mới</h1>
<p>
    <c:if test='${message != null}'>
        <span style="color: green">${message}</span>
    </c:if>
</p>
<p><a href="/products">Quay lại danh sách</a></p>
<form method="post" action="/products?action=create">
    <table>
        <tr>
            <td>ID:</td>
            <td><input type="number" name="id" required></td>
        </tr>
        <tr>
            <td>Tên sản phẩm:</td>
            <td><input type="text" name="name" required></td>
        </tr>
        <tr>
            <td>Giá:</td>
            <td><input type="number" step="0.01" name="price" required></td>
        </tr>
        <tr>
            <td>Mô tả:</td>
            <td><input type="text" name="description"></td>
        </tr>
        <tr>
            <td>Nhà sản xuất:</td>
            <td><input type="text" name="manufacturer"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Thêm sản phẩm"></td>
        </tr>
    </table>
</form>
</body>
</html>

