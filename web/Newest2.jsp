<%@page import="com.mypackage.ClothesDao"%>
<%@page import="com.mypackage.Clothes"%>
<%@page import="com.mypackage.ClothesJspGui"%>
<%@ page import="java.util.List" %>
<%@page import="java.sql.*"%>
<%@ page import="com.mypackage.Category" %>
<%--
  Created by IntelliJ IDEA.
  User: 13590_000
  Date: 5/21/2015
  Time: 3:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
  String p = request.getParameter("txtpage");
  String r=request.getParameter("txtrow");
  int a = Integer.parseInt(p);
  int b=Integer.parseInt(r);
  ClothesDao cd= new ClothesDao();
  List<Clothes> c= cd.getNewestPaging(a,b);
  out.print(ClothesJspGui.view(c));
  %>
</body>
</html>
