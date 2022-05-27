<%--
  Created by IntelliJ IDEA.
  User: TechCare
  Date: 5/27/2022
  Time: 3:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <style>
        #cal{
            border: 1px solid black;
            margin: 0 auto;
            padding: 0 20px 20px;
            background: antiquewhite;
            width: 500px;
        }
    </style>
</head>
<body>
<div id="cal">
<h1>Simple model.Calculator</h1>
<form action="/calculate" method="post">
<filedset>
    <h3>model.Calculator</h3>
    <table>
        <tr>
            <td>First Operand:</td>
            <td><input type="text" name="first-operand"></td>
        </tr>
        <tr>
            <td>Operator:</td>
            <td>
                <select name="operator">
                    <option value="+">Addition</option>
                    <option value="-">subtraction</option>
                    <option value="*">Multiplication</option>
                    <option value="/">Division</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Second Operand:</td>
            <td><input type="text" name="second-operand"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Calculate"></td>
        </tr>
    </table>
</filedset>
</form>
</div>
</body>
</html>
