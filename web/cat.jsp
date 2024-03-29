<%@ page import="com.mypackage.ClothesDao" %>
<%@ page import="com.mypackage.Clothes" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.sql.*" %>
<%@ page import="controller.ClothesCart" %>
<%@ page import="java.util.*" %>
<%@ page import="com.mypackage.Category" %>
<%@ page import="com.mypackage.Brand" %>
<%ResultSet resultset =null;%>,
<!DOCTYPE HTML>
<html>
<head>
  <title>Buy_shop an E-Commerce online Shopping gory Flat Bootstarp responsive Website Template| Men :: w3layouts</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="keywords" content="Flatro Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
  <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
  <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <!-- Custom Theme files -->
  <link href="css/style.css" rel='stylesheet' type='text/css' />
  <!-- Custom Theme files -->
  <!--webfont-->
  <link href='http://fonts.googleapis.com/css?family=Lato:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
  <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
  <!-- start menu -->
  <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
  <script type="text/javascript" src="js/megamenu.js"></script>
  <script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
  <!-- the jScrollPane script -->
  <script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
  <script type="text/javascript" id="sourcecode">
    $(function()
    {
      $('.scroll-pane').jScrollPane();
    });
  </script>
  <script>$(document).ready(function(c) {
    $('.alert-close').on('click', function(c){
      $('.message').fadeOut('slow', function(c){
        $('.message').remove();
      });
    });
  });
  </script>
  <script>$(document).ready(function(c) {
    $('.alert-close1').on('click', function(c){
      $('.message1').fadeOut('slow', function(c){
        $('.message1').remove();
      });
    });
  });
  </script>
  <%
    HashMap<Integer, Integer> fBuy = (HashMap<Integer, Integer>) session.getAttribute("listBuy");
    if (fBuy != null) {
      List<ClothesCart> listCartView =new ArrayList<ClothesCart>();
      Set<Integer> listKey = fBuy.keySet();
      Iterator<Integer> it = listKey.iterator();
      ClothesDao objDao=new ClothesDao();
      float total=0;
      while (it.hasNext()) {
        int id=it.next();
        Clothes d=objDao.getClothesByName(id);
        ClothesCart clothView=new ClothesCart();
        clothView.setId(d.getId());
        clothView.setName(d.getName());
        clothView.setPicture(d.getPicture());
        clothView.setBrand(d.getBrand());
        clothView.setCat(d.getCat());
        clothView.setPrice(d.getPrice());
        clothView.setTotal(fBuy.get(id));
        clothView.setTotalPaid(clothView.getPrice()*clothView.getTotal());
        total+=clothView.getTotalPaid();
        listCartView.add(clothView);
      }
      session.setAttribute("total",total);
      session.setAttribute("list", listCartView);
    }
    else {
      session.setAttribute("total", "0");
    }
  %>
  <%  ClothesDao cd = new ClothesDao();
    List<Category> cat = cd.getAllCategory();
    session.setAttribute("category",cat);
    List <Brand> brand=cd.getAllBrand();
    session.setAttribute("br",brand);
  %>
</head>
<body>
<div class="header_top">
  <div class="container">
    <div class="one-fifth column row_1">
			<span class="selection-box"><select class="domains valid" name="domains">
              <option>English</option>
              <option>French</option>
              <option>German</option>
            </select></span>
    </div>
    <div class="cssmenu">
      <ul>
        <li class="active"><a href="login.html">My Account</a></li>
      </ul>
    </div>
  </div>
</div>

<div class="header_bottom men_border">
  <div class="container">
    <div class="col-xs-9 header-bottom-left">
      <div class="col-xs-2 logo">
        <h1><a href="index.jsp"><span>Buy</span>shop</a></h1>
      </div>
      <div class="col-xs-7 menu">
        <ul class="megamenu skyblue">
          <li class="active grid"><a class="color1" href="Men.jsp">Men</a><div class="megapanel">
            <div class="row">

              <div class="col1">
                <h4>Category</h4>

                <c:forEach items="${category}" var="cat">

                  <div class="h_nav">
                    <ul>
                      <li><a href="GetIdCat?name=${cat.ID}">${cat.name}</a></li>
                    </ul>
                  </div>
                </c:forEach>
              </div>
              <div class="col1">
                <h4>Popular Brands</h4>
                <c:forEach items="${br}" var="b">

                  <div class="h_nav">
                    <ul>
                      <li><a href="GetIdBrand?name=${b.id}">${b.name}</a></li>
                    </ul>
                  </div>
                </c:forEach>
              </div>
            </div>
          </div>
          <li><a class="color4" href="lastestproduct.jsp">Latest Product</a></li>
          <li><a class="color5" href="bestsell.jsp">Most Buy Product</a></li>
          <li><a class="color6" href="mostviewd.jsp">Most viewed Product</a></li>
        </ul>
      </div>
    </div>
    <div class="col-xs-3 header-bottom-right">


      <ul class="icon1 sub-icon1 profile_img">
        <li><a class="active-icon c1" href="#"> </a>

          <ul class="sub-icon1 list">
            <c:if test="${not empty list}">
              <h3>Recently added items(${list.size()})</h3>
            </c:if>
            <div class="shopping_cart">
              <c:forEach items="${list}" var="c">

                <div class="cart_box">
                  <div class="message">
                    <div class="alert-close"> </div>
                    <div class="list_img"><img src="img/${c.picture}"  width="146px" height="207px"  alt=""/></div>
                    <div class="list_desc"><h4><a href="#">${c.name}</a></h4>${c.total} x <span class="actual">
		                             $ ${c.price} </span></div>
                    <div class="clearfix"></div>
                  </div>
                </div>
              </c:forEach>

            </div>
            <div class="total">
              <div class="total_left">CartSubtotal:</div>
              <div class="total_right" ><%=session.getAttribute("total")%></div>
              <div class="clearfix"> </div>

            </div>
            <div class="clearfix"> </div>
            <div class="login_buttons">
              <div class="check_button"><a href="checkout.jsp">Check out</a></div>
              <div class="login_button"><a href="index.jsp">Login</a></div>
              <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
          </ul>

        </li>


      </ul>
      <div class="search">
        <form method="post" action="Search">

        <input type="text" name="name" class="textbox" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}">
        <input type="submit" value="Subscribe" id="submit" name="submit">
          </form>
        <div id="response"> </div>
      </div>
      <div class="clearfix"></div>
    </div>
    <div class="clearfix"></div>
  </div>
</div>
<div class="container">
  <div class="women_main">
    <div class="col-md-9 w_content">
      <div class="women">
        <a href="#"><h4>Enthecwear - <span>4449 itemms</span> </h4></a>
        <ul class="w_nav">
          <li>Sort : </li>
          <li><a class="active" href="#">popular</a></li> |
          <li><a href="#">new </a></li> |
          <li><a href="#">discount</a></li> |
          <li><a href="#">price: Low High </a></li>
          <div class="clear"></div>
        </ul>
        <div class="clearfix"></div>
      </div>
      <!-- grids_of_4 -->
      <c:forEach var="cloth" items="${cat}">

        <div class="grids_of_4">

          <div class="grid1_of_4">
            <div class="content_box">   <a href="GetId?name=${cloth.id}">

              <div class="view view-fifth">
                <img src="img/${cloth.picture}" class="img-responsive" alt=""/>
                <div class="mask1">
                  <div class="info"> </div>
                </div>
              </div>
            </a>
              </a>
            </div>
            <a href="GetId?name=${cloth.id}"> <h5>${cloth.name}</h5></a>
              ${cloth.price}$

          </div>
        </div>

      </c:forEach>

      <div class="clearfix"></div>
      <c:if test="${currentPage != 1}">
        <!--  <td> --><a href="GetIdCat?name=<%=session.getAttribute("i")%>&d=${currentPage - 1}">&nbsp;Previous</a><!-- </td> -->
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
            <!--  <td> --><a href="GetIdCat?name=<%=session.getAttribute("i")%>&d=${i}">${i}&nbsp;</a><!-- </td> -->
          </c:otherwise>
        </c:choose>
      </c:forEach><!--  </tr> -->

      <%--For displaying Next link --%>
      <c:if test="${currentPage lt noOfPages}">
        <!--  <td> --><a href="GetIdCat?name=<%=session.getAttribute("i")%>&d=${currentPage + 1}">&nbsp;Next</a><!-- </td> -->
      </c:if>

    </div>
    <!-- end grids_of_4 -->
  </div>
  <!-- start sidebar -->
  <div class="col-md-3">
    <div class="w_sidebar">
      <form method="post" action="SearchClothes">
        <input type="hidden" name="action" value="load" />
        <div class="w_nav1">
          <ul>
            <li>Name's Product</li>
            <input type="text" name="txtname" size="10" />
          </ul>
        </div>
        <h3>filter by</h3>
        <section  class="sky-form">
          <h4>price</h4>
          <div class="row1 scroll-pane">
            <div class="col col-4">
              <label class="checkbox"><input type="checkbox"  name="txtprice" value="0" checked> <i></i>No option</label>
              <label class="checkbox"><input type="checkbox"  name="txtprice" value="1"> <i></i><27$</label>
              <label class="checkbox"><input type="checkbox" name="txtprice" value="2"><i></i><50$</label>
              <label class="checkbox"><input type="checkbox" name="txtprice"  value="3"><i></i><30$</label>
            </div>
          </div>
        </section>
        <section  class="sky-form">

          <h4>brand</h4>
          <%
            Class.forName("com.mysql.jdbc.Driver");
            String database = "clothingshop";
            String connectionURL = "jdbc:mysql://localhost:3306/" + database;
            String dbUser = "root";
            String dbPassword = "";
            Connection connection;

            try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
              connection = DriverManager.getConnection(connectionURL, dbUser, dbPassword);

              Statement statement = connection.createStatement() ;

              resultset =statement.executeQuery("select * from brand") ;
          %>

          <div class="row1 scroll-pane">
            <div class="col col-4">
              <label class="checkbox"><input type="checkbox" name="txtcategory" value="0" checked><i></i>No option</label>

              <%  while(resultset.next()){ %>
              <label class="checkbox"><input type="checkbox" name="txtcategory" value="<%=resultset.getInt(1)%>"><i></i><%=resultset.getString(2)%></label>

              <% } %>
              </select>
              <%
                  //**Should I input the codes here?**
                }
                catch(SQLException e)
                {
                  System.out.println("wrong entry"+e);
                }
              %>


            </div>
          </div>
        </section>
        <input type="submit" value="Search"/>
      </form>
    </div>
  </div>
  <!-- start content -->
  <div class="clearfix"></div>
  <!-- end content -->
</div>
<div class="footer">
  <div class="container">
    <div class="footer_top">
      <div class="col-md-4 box_3">
        <h3>Our Stores</h3>
        <address class="address">
          <p>9870 St Vincent Place, <br>Glasgow, DC 45 Fr 45.</p>
          <dl>
            <dt></dt>
            <dd>Freephone:<span> +1 800 254 2478</span></dd>
            <dd>Telephone:<span> +1 800 547 5478</span></dd>
            <dd>FAX: <span>+1 800 658 5784</span></dd>
            <dd>E-mail:&nbsp; <a href="mailto@example.com">info(at)buyshop.com</a></dd>
          </dl>
        </address>
        <ul class="footer_social">
          <li><a href=""> <i class="fb"> </i> </a></li>
          <li><a href=""><i class="tw"> </i> </a></li>
          <li><a href=""><i class="google"> </i> </a></li>
          <li><a href=""><i class="instagram"> </i> </a></li>
        </ul>
      </div>
      <div class="col-md-4 box_3">
        <h3>Blog Posts</h3>
        <h4><a href="#">Sed ut perspiciatis unde omnis</a></h4>
        <p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced</p>
        <h4><a href="#">Sed ut perspiciatis unde omnis</a></h4>
        <p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced</p>
        <h4><a href="#">Sed ut perspiciatis unde omnis</a></h4>
        <p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced</p>
      </div>
      <div class="col-md-4 box_3">
        <h3>Support</h3>
        <ul class="list_1">
          <li><a href="#">Terms & Conditions</a></li>
          <li><a href="#">FAQ</a></li>
          <li><a href="#">Payment</a></li>
          <li><a href="#">Refunds</a></li>
          <li><a href="#">Track Order</a></li>
          <li><a href="#">Services</a></li>
        </ul>
        <ul class="list_1">
          <li><a href="#">Services</a></li>
          <li><a href="#">Press</a></li>
          <li><a href="#">Blog</a></li>
          <li><a href="#">About Us</a></li>
          <li><a href="#">Contact Us</a></li>
        </ul>
        <div class="clearfix"> </div>
      </div>
      <div class="clearfix"> </div>
    </div>
    <div class="footer_bottom">
      <div class="copy">
        <p>Copyright � 2015 Buy_shop. All Rights Reserved.<a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
      </div>
    </div>
  </div>
</div>
</body>
</html>