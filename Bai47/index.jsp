<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Discount Calculator</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 50px;
        }
        .form-container {
            width: 400px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: inline-block;
            width: 150px;
            font-weight: bold;
        }
        input[type="text"], input[type="number"] {
            width: 220px;
            padding: 6px;
        }
        input[type="submit"] {
            padding: 8px 16px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Product Discount Calculator</h2>
    <form action="display-discount" method="POST">
        <div class="form-group">
            <label for="description">Product Description:</label>
            <input type="text" id="description" name="description" placeholder="Mô tả sản phẩm" required>
        </div>
        <div class="form-group">
            <label for="price">List Price ($):</label>
            <input type="number" id="price" name="price" step="0.01" placeholder="Giá niêm yết" required>
        </div>
        <div class="form-group">
            <label for="discount">Discount Percent (%):</label>
            <input type="number" id="discount" name="discount" step="0.1" placeholder="Tỷ lệ chiết khấu" required>
        </div>
        <div>
            <input type="submit" value="Calculate Discount">
        </div>
    </form>
</div>

</body>
</html>