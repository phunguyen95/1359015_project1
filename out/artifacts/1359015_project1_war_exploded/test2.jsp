<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 13590_000
  Date: 5/30/2015
  Time: 4:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title></title>


</head>
<body>
<h1 style="color:green">ALL Clothes In Your Cart</h1><br/>

<table border="1" style="text-align: left">
  <tr>
    <td><b>ID: </b></td>
    <td><b>Name: </b></td>
    <td><b>Price: </b></td>
    <td><b>Brand: </b></td>
    <td><b>Category: </b></td>
    <td><b>Total Buy: </b></td>
    <td><b>Total Paid: </b></td>
  </tr>
  <c:forEach items="${list}" var="c">

  <tr>
    <td>${c.id}</td>
    <td>${c.name}</td>
    <td>${c.price}</td>
    <td>${c.brand}</td>
    <td>${c.cat}</td>
    <td><form id="rating" method="post" action="updatecart.jsp"> <input type="text" name="quantity${c.id}" value="${c.total} ">
      <td>${c.total*c.price}</td></c:forEach>
      <tr>
        <td>    <input type="submit" name="update" value="Update"></td>
        <td><a href="checkout.jsp">Check out</a> </td>
        <td></form  ></td>
  </tr>
  </tr>

  <tr>
    <td colspan="7">Total: </td>
    <td> <%=session.getAttribute("total")%></td>
  </tr>
</table>

</form>
</body>
</html>
