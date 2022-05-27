<%--
  Created by IntelliJ IDEA.
  User: TechCare
  Date: 5/27/2022
  Time: 1:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <style>
      #convert{
        margin: 50px auto;
        border: 5px solid #c3e6cb;
        width: 263px;
        padding: 0 20px 20px;
        background: #999999;
      }
      #data label{
        float: left;
        width: 250px;
        padding-right: 10px;
      }
      #data input{
        float: left;
        width: 260px;
        margin-bottom: 20px;
      }
    </style>
  </head>
  <body>
<div id="convert">
  <h2>Currency Converter</h2>
  <form action="convert.jsp" method="get">
    <div id="data">
    <label>Rate: </label><br/>
    <input type="text" name="rate" placeholder="RATE" value="22000"/><br/>
    <label>USD: </label><br/>
    <input type="text" name="usd" placeholder="USD" value="0"/><br/>
    </div>

    <div style="padding: 10px">
      <br>
      <input type = "submit" id = "submit" value = "Converter"/>
    </div>
  </form>


</div>
  </body>
</html>
