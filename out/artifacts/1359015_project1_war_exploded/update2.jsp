<%@ page import="com.mypackage.Category" %>
<%--
  Created by IntelliJ IDEA.
  User: 13590_000
  Date: 5/19/2015
  Time: 10:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
  String id = request.getParameter("txtid");
  String name= request.getParameter("txtname");
  int a = Integer.parseInt(id);
  Category b=new Category(a,name);
  Category  c=new Category();
  c.update(b);
  out.print("Update successfully");
%>
<a href="index.jsp">Go back to homepage</a>
</body>
</html>
