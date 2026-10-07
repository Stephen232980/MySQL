<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Simple Calculator</title>
    <style>
        fieldset { width: 400px; }
        .form-group { margin-bottom: 10px; }
        label { display: inline-block; width: 120px; }
    </style>
</head>
<body>
    <h1>Simple Calculator</h1>
    <form action="calculate" method="post">
        <fieldset>
            <legend>Calculator</legend>
            <div class="form-group">
                <label>First operand:</label>
                <input type="text" name="firstOperand" required>
            </div>
            <div class="form-group">
                <label>Operator:</label>
                <select name="operator">
                    <option value="+">Addition</option>
                    <option value="-">Subtraction</option>
                    <option value="*">Multiplication</option>
                    <option value="/">Division</option>
                </select>
            </div>
            <div class="form-group">
                <label>Second operand:</label>
                <input type="text" name="secondOperand" required>
            </div>
            <div class="form-group">
                <label></label>
                <input type="submit" value="Calculate">
            </div>
        </fieldset>
    </form>
</body>
</html>

