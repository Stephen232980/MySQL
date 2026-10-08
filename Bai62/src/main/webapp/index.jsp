<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh Sách Ghi Chú - iNotes</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        .header { display: flex; justify-content: space-between; align-items: center; }
        .controls { margin-top: 10px; display: flex; justify-content: space-between; }
        .btn { padding: 8px 12px; text-decoration: none; background: #007bff; color: white; border-radius: 4px; border: none; cursor: pointer; }
        .btn-danger { background: #dc3545; }
        .btn-switch { background: #28a745; margin-left: 5px; }
    </style>
</head>
<body>
    <div class="header">
        <h2>Danh Sách Ghi Chú (iNotes Dashboard)</h2>
        <div>
            <span>Lưu trữ hiện tại: <strong>${applicationScope.storageType}</strong></span>
            <a href="switch?type=db" class="btn btn-switch">Dùng Database (MySQL)</a>
            <a href="switch?type=file" class="btn btn-switch">Dùng File (TXT/CSV)</a>
        </div>
    </div>
    
    <div class="controls">
        <form action="" method="get">
            <input type="text" name="keyword" value="${keyword}" placeholder="Nhập từ khóa..." style="padding: 8px; width: 250px;">
            <button type="submit" class="btn">Tìm kiếm</button>
        </form>
        <a href="add" class="btn">+ Thêm Mới</a>
    </div>

    <table>
        <thead>
            <tr>
                <th>#</th>
                <th>Tiêu đề</th>
                <th>Phân loại</th>
                <th>Thao tác</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="note" items="${notes}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td><c:out value="${note.title}" /></td>
                    <td><c:out value="${note.typeName}" /></td>
                    <td>
                        <!-- Sử dụng alert tạm để demo Xem chi tiết -->
                        <a href="javascript:void(0);" onclick="alert('Tiêu đề: ${note.title}\\n\\nNội dung: ${note.content.replace('\'', '\\\'').replace('\"', '\\\"')}');">Xem</a> | 
                        <a href="#">Sửa</a> | 
                        <a href="delete?id=${note.id}" onclick="return confirm('Bạn có chắc muốn xóa ghi chú này?');">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty notes}">
                <tr>
                    <td colspan="4" style="text-align: center;">Không có ghi chú nào.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
</body>
</html>

