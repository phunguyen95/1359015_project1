<%@ page import="com.mypackage.Category" %>
<%--
  Created by IntelliJ IDEA.
  User: 13590_000
  Date: 5/20/2015
  Time: 12:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
  String name = request.getParameter("txtproduct");
  Category a=new Category(0,name);
  Category b=new Category();
  b.insert(a);
out.print("Succesfully Insert!!");

%>
<a href="index.jsp">Go back to homepage</a>
</body>
</html>
