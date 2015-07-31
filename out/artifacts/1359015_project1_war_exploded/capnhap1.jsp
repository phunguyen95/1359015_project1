<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 13590_000
  Date: 6/14/2015
  Time: 12:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.io.*,java.sql.*" %>
<%@ page import="com.mypackage.Clothes" %>
<%@ page import="java.util.ArrayList" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<%@ page import="java.util.*" %>

<body>
<%
  List <Clothes> list=new ArrayList<>();

String ma=request.getParameter("id");
  String database = "clothingshop";
  String connectionURL = "jdbc:mysql://localhost:3306/" + database;
  String dbUser = "root";
  String dbPassword = "";
  Connection connection;
  Clothes c=null;
  try {
    Class.forName("com.mysql.jdbc.Driver");
    connection = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
    Statement st = connection.createStatement();
    //ResultSet rs = st.executeQuery("select * from emp where empno="+sn);
    ResultSet rs = st.executeQuery("select * from product where b_id='" + ma + "'");  // this is for name
   while (rs.next()) {
     c=new Clothes();
     c.setId(rs.getInt("id"));
     c.setName(rs.getString("name"));
     c.setPrice(rs.getInt("price"));
     c.setDescribe(rs.getString("describe"));
     c.setCat(rs.getInt("catid"));
     c.setBrand(rs.getInt("b_id"));
     c.setPicture(rs.getString("picture"));
      list.add(c);
    }

  }
  catch (SQLException sqle) {

    out.println("SQL Exception thrown: " + sqle);
  }
  session.setAttribute("capnhat",list);
%>
<div>
Product:
<select id="masp" name="masp">
  <option>Select Product</option>

<c:forEach items="${capnhat}" var="c">

  <option value="${c.id}">${c.name}</option>
</c:forEach>

</select>

</div>

</body>
</html>
