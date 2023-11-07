<%--
  Created by IntelliJ IDEA.
  User: aquar
  Date: 2023/11/07
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="discountCalculatorServlet" method="post">
        <label for="description">Product Description</label>
        <input type="text" name="description" id="description">

        <label for="price">Price</label>
        <input type="number" name="price" id="price">

        <label for="discountPercent">Discount Percent</label>
        <input type="number" name="discountPercent" id="discountPercent">
        <button type="submit" >submit</button>
    </form>
</body>
</html>
