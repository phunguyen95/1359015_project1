<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 13590_000
  Date: 6/14/2015
  Time: 2:12 PM
  To change this template use File | Settings | File Templates.
--%><%@ page import="java.io.*,java.sql.*" %>
<%@ page import="com.mypackage.Clothes" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.*" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title></title>
</head>
<body>
<%
  String masp=request.getParameter("masp");
  List <Clothes> list=new ArrayList<>();
session.setAttribute("masp",masp);
  Clothes c=null;
  String database = "clothingshop";
  String connectionURL = "jdbc:mysql://localhost:3306/" + database;
  String dbUser = "root";
  String dbPassword = "";
  Connection connection;
  try {

    Class.forName("com.mysql.jdbc.Driver");
    connection = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
    Statement st = connection.createStatement();
    ResultSet rs = st.executeQuery("select * from product where id='" + masp + "'");  // this is for name
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
  session.setAttribute("capnhat2",list);
%>
<c:forEach items="${capnhat2}" var="c">

<div>
<form action="UpdateProduct" method="post" name="form1" enctype="multipart/form-data">
  <table>

  <hr>
   <tr><td>Product's Name:</td><td> <input  size="45" type="text" id="name" name="name" value="${c.name}"  ></td></tr>
  <tr><td><input type="hidden" value="${masp}" name="masp"> </td></tr>
   <tr><td>Price:</td><td> <input   size ='45' type="text"  name="price"  id="price" value="${c.price}" ></td></tr>
    <tr><td>Detail:</td><td><input size="45"  type="text"  name="detail"  id="detail" value="${c.describe}"></td></tr>
  <tr><td>Picture:</td><td><input size="45" type="file" name="picture" id="picture" > </td></tr>

    <tr style="right: 100px "><td><input type="Submit"  value="UPDATE"></td>
  </table>
</form>
  </div>
  <div>
<form action="DeleteProduct" method="post">
  <table>
    <tr><td><input type="hidden" value="${masp}" name="masp"> </td></tr>

    <tr style="right: 100px "><td><input type="Submit"  value="DELETE"></td

</tr>
    </table>
</form>
  </div>
  <h3 style="text-align: center" class="m_1">---------Product's Information-------</h3>

  <div class="section group">

    <div class="col_1_of_3 span_1_of_3">
      <div class="shop-holder">
        <div class="product-img">

          <a href="GetId?name=${c.id}">

            <img width="225" height="265" src="img/${c.picture}" class="img-responsive"  alt="item4"> </a>
          <a href="GetId?name=${c.id}" class="button "></a>	 </div>
      </div>


      <div class="shop-content" style="height: 80px;">

        <h5> <a href="GetId?name=${c.id}"> ${c.name}</a></h5>
          ${c.price}$

      </div>
    </div>

  </div>
  </c:forEach>
</body>
</html>
