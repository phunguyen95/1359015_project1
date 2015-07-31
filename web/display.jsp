<%@ page import="com.mypackage.ClothesDao" %>
<%@ page import="com.mypackage.Clothes" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Employees</title>
</head>

<body>

<%
int c=1;
  int recordsPerPage = 5;
  if(request.getParameter("c") != null){
    c = Integer.parseInt(request.getParameter("c"));
  }
  ClothesDao dao = new ClothesDao();
  List<Clothes> list = dao.viewAllClothes((c - 1) * recordsPerPage, recordsPerPage);
  int noOfRecords = dao.getNoOfRecords();
  int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
  request.setAttribute("employeeList", list);
  request.setAttribute("noOfPages", noOfPages);
  request.setAttribute("currentPage", c);
  session.setAttribute("employeeList", list);
  session.setAttribute("noOfPages", noOfPages);
  session.setAttribute("currentPage", c);
%>
<table border="1" cellpadding="5" cellspacing="5">
  <tr>
    <td><b>ID: </b></td>
    <td><b>Name: </b></td>
    <td>Describe:</td>
    <td><b>Price: </b></td>
    <td>Categoy</td>
    <td><b>Brand: </b></td>
  </tr>
  <c:forEach var="cloth" items="${employeeList}">
    <tr>
      <td>${cloth.id}</td>
      <td>${cloth.name}</td>
      <td>${cloth.describe}</td>
      <td>${cloth.price}</td>
      <td>${cloth.cat}</td>
      <td>${cloth.brand}</td>
    </tr>
  </c:forEach>
</table>
<table border="0" cellpadding="0" cellspacing="0">
  <td>
    <%--For displaying Previous link except for the 1st page --%>
    <c:if test="${currentPage != 1}">
      <!--  <td> --><a href="display.jsp?c=${currentPage - 1}">&nbsp;Previous</a><!-- </td> -->
    </c:if>
    <%--For displaying Page numbers.
    The when condition does not display a link for the current page--%>
    <!-- <table border="1" cellpadding="5" cellspacing="5"> -->
    <!--  <tr> -->
    <c:forEach begin="1" end="${noOfPages}" var="i">
      <c:choose>
        <c:when test="${currentPage eq i}">
          <!-- <td> -->${i}&nbsp;&nbsp;<!-- </td> -->
        </c:when>
        <c:otherwise>
          <!--  <td> --><a href="display.jsp?c=${i}">${i}&nbsp;</a><!-- </td> -->
        </c:otherwise>
      </c:choose>
    </c:forEach>
    <!--  </tr> -->

    <%--For displaying Next link --%>
    <c:if test="${currentPage lt noOfPages}">
      <!--  <td> --><a href="display.jsp?c=${currentPage + 1}">&nbsp;Next</a><!-- </td> -->
    </c:if>
  </td>
</table>
</body>
</html>
