<%--
  Created by IntelliJ IDEA.
  User: TechCare
  Date: 5/26/2022
  Time: 3:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Bai_tap</title>
<style>
  #product {
    border: 2px solid black;
    background: burlywood;
    width: 500px;
    margin: 50px auto;
    padding: 0 20px 20px;
  }

  #data label {
    float: left;
    width: 160px;
    padding-right: 10px;
  }

  #data input {
    float: left;
    width: 260px;
    margin-bottom: 20px;
  }
</style>
</head>
<body>
<div id="product">
  <h1>Product Discount Calculator</h1>
  <form action="/calculator" method="post">
    <div id="data">
      <label>Product Description</label>
      <input type="text" name="description">
      <label>List Price</label>
      <input type="text" name="price">
      <label>Discount Percent</label>
      <input type="text" name="discount">
    </div>
    <div>
      <br>
      <input type="submit" value="Discount Amount">
    </div>

  </form>

</div>
  </body>
</html>
