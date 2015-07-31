<%@ page import="com.mypackage.Cart" %>
<%@ page import="controller.ClothesCart" %>
<%@ page import="java.util.*" %>
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

  float _total=(Float)session.getAttribute("total");
  System.out.println(_total);
  String _id="";
          int id=0;
if(request.getParameter("id")!=null) {
  _id = request.getParameter("id");
  id = Integer.parseInt(_id);
}
  float total=0;
  for(int i = 0; i < a.size(); i++)
    {

      ClothesCart temp = a.get(i);
      if (temp.getId() == id) {
        a.remove(i);
        _total -= (temp.getPrice() * temp.getTotal());
        System.out.println("has" + temp.getPrice() + temp.getTotal());
        System.out.println(_total);
      }

    }
  Set<Integer> IsName = fBuy.keySet();
  Iterator<Integer> it = IsName.iterator();
  int isbnChoosed=0;
  while (it.hasNext()) {
    isbnChoosed =it.next();

    if (isbnChoosed==id) {
      System.out.println("Da tim thay");
      fBuy.remove(isbnChoosed);

      System.out.println("Da xoa them ");
      break;
    }
  }
  session.setAttribute("total",_total);
  session.setAttribute("list", a);
  session.setAttribute("listBuy",fBuy);
  System.out.println(a);
    response.sendRedirect("viewCart.jsp");

%>
</body>
</html>
