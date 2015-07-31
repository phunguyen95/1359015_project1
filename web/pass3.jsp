<%@ page import="java.io.*,java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%

  String sn=request.getParameter("ver");
  String email=request.getParameter("ver2");
  String database = "clothingshop";
  String connectionURL = "jdbc:mysql://localhost:3306/" + database;
  String dbUser = "root";
  String dbPassword = "";
  Connection connection;
  try {
    try {
      Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    }
    connection = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
    Statement st = connection.createStatement();
    //ResultSet rs = st.executeQuery("select * from emp where empno="+sn);
    ResultSet rs = st.executeQuery("select * from member where username='" + sn + "' or email='" + email+"'");  // this is for name
    if (rs.next()) {
      out.print(" <input type='submit' value='submit' disabled/>");
    } else {
      out.print("<input type='submit' value='submit'/>");
    }
  }  catch (SQLException sqle) {
    out.println("SQL Exception thrown: " + sqle);
  }
  out.close();
%>