<%@ page import="com.mypackage.Recipe" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Date" %>
<%--
  Created by IntelliJ IDEA.
  User: 13590_000
  Date: 6/3/2015
  Time: 12:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
  List<Recipe> b= (List<Recipe>) session.getAttribute("receipt");

  for(Recipe re : b){
    int a = 0;
    if(request.getParameter("namestatus"+re.getId())!=null){
      a = Integer.parseInt(request.getParameter("namestatus"+re.getId()));
    }
    System.out.println(a);
    String c = request.getParameter("status" + re.getId());
    int status = 0;
    if(c!=null)
    status = Integer.parseInt(c);
    System.out.println(status);
    System.out.println(re.getId());
    Date date1 = re.getDatestatus();
    System.out.println(date1);
    if(a==re.getId()) {
      if (status == 1) {
        Recipe r = new Recipe();
        if(date1==null) {
          java.util.Date utilDate = new java.util.Date();
          java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
          r.updaterecipe(a, status, sqlDate);
        }
      } else {
        Recipe r = new Recipe();
        r.updaterecipe(re.getId(), status, null);
      }
    }
  }
  response.sendRedirect("AdminCart.jsp");
%>
</body>
</html>
