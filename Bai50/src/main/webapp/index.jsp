<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.demo.model.Customer" %>

<%
    // Create customer list
    List<Customer> customerList = new ArrayList<>();
    customerList.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "images/pic1.jpg"));
    customerList.add(new Customer("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", "images/pic2.jpg"));
    customerList.add(new Customer("Nguyễn Thái Hòa", "1983-08-22", "Nam Định", "images/pic3.jpg"));
    customerList.add(new Customer("Trần Đăng Khoa", "1983-08-17", "Hà Tây", "images/pic4.jpg"));
    customerList.add(new Customer("Nguyễn Đình Thi", "1983-08-19", "Hà Nội", "images/pic5.jpg"));

    request.setAttribute("customers", customerList);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách khách hàng</title>
    <style>
        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            font-family: sans-serif;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        th, td {
            border-bottom: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #f8f8f8;
            font-weight: bold;
        }
        caption {
            font-size: 24px;
            font-weight: bold;
            padding: 10px;
        }
        img {
            width: 60px;
            height: auto;
            border-radius: 4px;
        }
    </style>
</head>
<body>

    <table>
        <caption>Danh sách khách hàng</caption>
        <thead>
            <tr>
                <th>Tên</th>
                <th>Ngày sinh</th>
                <th>Địa chỉ</th>
                <th>Ảnh</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="customer" items="${customers}">
                <tr>
                    <td>${customer.name}</td>
                    <td>${customer.birthDate}</td>
                    <td>${customer.address}</td>
                    <td><img src="${customer.imagePath}" alt="${customer.name}"></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</body>
</html>

