<%--
  Created by IntelliJ IDEA.
  User: TechCare
  Date: 5/27/2022
  Time: 2:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<table border="1" width="500px" style="margin: auto;">
    <th>Danh sách khách hàng</th>
    <tr>
        <th>Name</th>
        <th>Date of Birt</th>
        <th>Address</th>
        <th>Image</th>
    </tr>
    <c:forEach items="${ListCustomer}" var="customer">
        <tr>
            <td>${customer.name}</td>
            <td>${customer.dateOfBirth}</td>
            <td>${customer.address}</td>
            <td><img src="${customer.image}" alt=""></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
