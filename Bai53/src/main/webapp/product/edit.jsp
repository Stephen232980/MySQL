<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Sửa sản phẩm</title>
</head>
<body>
<h1>Sửa thông tin sản phẩm</h1>
<p>
    <c:if test='${message != null}'>
        <span style="color: green">${message}</span>
    </c:if>
</p>
<p><a href="/products">Quay lại danh sách</a></p>
<form method="post" action="/products?action=edit">
    <input type="hidden" name="id" value="${product.id}">
    <table>
        <tr>
            <td>Tên sản phẩm:</td>
            <td><input type="text" name="name" value="${product.name}" required></td>
        </tr>
        <tr>
            <td>Giá:</td>
            <td><input type="number" step="0.01" name="price" value="${product.price}" required></td>
        </tr>
        <tr>
            <td>Mô tả:</td>
            <td><input type="text" name="description" value="${product.description}"></td>
        </tr>
        <tr>
            <td>Nhà sản xuất:</td>
            <td><input type="text" name="manufacturer" value="${product.manufacturer}"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Cập nhật"></td>
        </tr>
    </table>
</form>
</body>
</html>

