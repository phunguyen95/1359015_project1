<%@ page import="com.mypackage.Cart" %>
<%@ page import="controller.ClothesCart" %>
<%@ page import="java.util.*" %>
<%@ page import="com.mypackage.Clothes" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 13590_000
  Date: 6/1/2015
  Time: 2:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
  List<ClothesCart> a= (List<ClothesCart>) session.getAttribute("list");
    HashMap<Integer, Integer> fBuy = (HashMap<Integer, Integer>) session.getAttribute("listBuy");
    ClothesCart q=new ClothesCart();
    Float tongtien = Float.valueOf(0);
   Float total =(Float )session.getAttribute("a");
    String c="";
    int d=0;
    if(request.getParameter("quantity"+q.getId())!=null)
    {
        c= request.getParameter("quantity");
        d=Integer.parseInt(c);
    }

    for(ClothesCart b: a) {

        String e = request.getParameter("quantity" + b.getId());
        b.setTotal(Integer.parseInt(e));
        b.setTotalPaid(b.getPrice() * b.getTotal());
        total = b.getTotalPaid();
        tongtien += total;
        Set<Integer> IsName = fBuy.keySet();
        Iterator<Integer> it = IsName.iterator();
        int isbnChoosed = 0;
            isbnChoosed = b.getId();
            if (isbnChoosed == b.getId()) {
                System.out.println("Da tim thay");
                fBuy.put(isbnChoosed,Integer.parseInt(e));
                System.out.println("Da xoa them ");
            }

        }

session.setAttribute("list",a);
    session.setAttribute("listBuy",fBuy);
    session.setAttribute("total",tongtien);
  response.sendRedirect("viewCart.jsp");

%>
</body>
</html>
