<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 13590_000
  Date: 5/27/2015
  Time: 6:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <style type="text/css">
    .giohang{
    position:absolute;
      width:200px;
      height:50px;
      left:1200px;
      border:solid;
    }
  </style>
</head>
<body>
<div class="giohang">Hien tai co (${sessionScope.total})San Pham<br/> trong gio hang cua ban<br/>
  <a href="ShowCart">View Cart</a>
</div>
<table border="1" style="text-align: left">
  <tr>
    <c:forEach items="${listclothes}" var="cloth">
      <tr>
  <td>
  <td><img src="${cloth.picture}"/>
  </td>
  <td>
    <b>ID:</b>${cloth.id}<br/>
    <b>Name:</b>${cloth.name}<br/>
    <b>Price:</b>${cloth.price}<br/>
    <b>Description:</b>${cloth.describe}<br/>
    <b>Cat:</b>${cloth.cat}<br/>
    <b>Brand:</b>${cloth.brand}<br/>
    <a href="BuyCloth?name=${cloth.id}">Buy</a>
  </td>

</tr>
    </c:forEach>

  </tr>
</table>

</body>
</html>
