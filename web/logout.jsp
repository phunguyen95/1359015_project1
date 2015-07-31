<%--
  Created by IntelliJ IDEA.
  User: 13590_000
  Date: 5/22/2015
  Time: 10:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
  session.setAttribute("userid", null);
  session.invalidate();
  response.sendRedirect("index.jsp");
%>
</body>
</html>
