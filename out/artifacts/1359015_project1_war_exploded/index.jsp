<%@page import="com.mypackage.ClothesDao"%>
<%@page import="com.mypackage.Clothes"%>
<%@page import="com.mypackage.ClothesJspGui"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mypackage.Category" %>
<%@ page import="com.mypackage.Brand" %>
<%@ page import="controller.ClothesCart" %>
<%@ page import="java.util.*" %>
<%--
  Created by IntelliJ IDEA.
  User: 13590_000
  Date: 5/20/2015
  Time: 12:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.comq
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<head>
  <title>Buy_shop an E-Commerce online Shopping Category Flat Bootstarp responsive Website Template| Home :: w3layouts</title>
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
  <link href="css/style2.css" rel="stylesheet" type="text/css"/>
  <script type="text/javascript" src="js/megamenu.js"></script>
  <script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
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
  <script type="text/javascript" src="js/jquery.roundabout-1.0.min.js"></script>
  <script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
  <script type="text/javascript">
    $(document).ready(function() { //Start up our Featured Project Carosuel
      $('#featured ul').roundabout({
        easing: 'easeOutInCirc',
        duration: 600
      });
      $('#login-trigger').click(function(){
        $(this).next('#login-content').slideToggle();
        $(this).toggleClass('active');

        if ($(this).hasClass('active')) $(this).find('span').html('&#x25B2;')
        else $(this).find('span').html('&#x25BC;')
      });
    });
  </script>

  <!--[if IE 6]>
  <script src="js/DD_belatedPNG_0.0.8a-min.js"></script>
  <script>
    /* EXAMPLE */
    DD_belatedPNG.fix('.button');

    /* string argument can be any CSS selector */
    /* .png_bg example is unnecessary */
    /* change it to what suits you! */
  </script>

  <![endif]-->
</head>
<html>
<body>
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
<%
  ClothesDao cd = new ClothesDao();
  List<Category> cat = cd.getAllCategory();
  session.setAttribute("category",cat);
  List <Brand> brand=cd.getAllBrand();
  session.setAttribute("br",brand);
%>
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
          <li class="active"><a href="profile.jsp">My Account</a></li>
        </ul>
      </div>

<%
  if(session.getAttribute("count")!=null)
  {
    out.write("<script type='text/javascript'>\n");
    out.write("alert(' Username of Password invalid ');\n");
    out.write("</script>\n");
  }
%>
      <%
        session.setAttribute("checkcount",3);
        Integer check = (Integer) session.getAttribute("checkcount");
        Integer count = (Integer) session.getAttribute("count");
        if(check.equals(count))
        {

          out.write("<script type='text/javascript'>\n");
          out.write("alert(' 20mins ');\n");
          out.write("</script>\n");
        }
        if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
      %>
      <ul>
        <li class="active"><a href="register.jsp">Register</a></li>

      </ul>
      <nav>
        <ul>

          <li id="login">
            <a id="login-trigger" href="#">
              Log in
            </a>
            <div id="login-content">
              <form id="form1" name="form1" method="post" action="login.jsp">
                <fieldset id="inputs">
                  <input id="username" type="text" name="uname" placeholder="Your username" required>
                  <input id="password" type="password" name="pass" placeholder="Password" required>
                </fieldset>
                <fieldset id="actions">
                  <input type="submit" id="submit1" value="Log in" style="margin-right:45px"> <a href="register.jsp"><input type="button" id="signup" value="Register" /></a>
                  <label><input type="checkbox" checked="checked"> Keep me signed in</label>
                </fieldset>
              </form>
            </div>
          </li></ul></nav>

      <%}else{
        %>
      Welcome <%=session.getAttribute("userid")%>
        <a href='logout.jsp'>Log out</a>
        <%
        }
      %>
    </div>
  </div>
</div>
<div class="wrap-box"></div>
<div class="header_bottom">
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
        <li><a class="active-icon c1" href="viewCart.jsp"> </a>

          <ul class="sub-icon1 list">
            <c:if test="${not empty list}">
              <h3>Recently added items(${list.size()})</h3>
            </c:if>

            <div class="shopping_cart">

              <div class="cart_box">
                <c:forEach items="${list}" var="c">

                  <div class="message">
                    <div class="alert-close"> </div>
                    <div class="list_img"><img src="img/${c.picture}" class="img-responsive" alt=""/></div>
                    <div class="list_desc"><h4><a href="#">${c.name}</a></h4>${c.total} x <span class="actual">
		                             $ ${c.price} </span></div>
                    <div class="clearfix"></div>
                  </div>
                </c:forEach>

              </div>

            </div>
            <div class="total">
              <div class="total_left">CartSubtotal:</div>
              <div class="total_right" ><%=session.getAttribute("total")%></div>
              <div class="clearfix"> </div>

            </div>
            <div class="clearfix"> </div>
            <div class="login_buttons">
              <div class="check_button"><a href="checkout.jsp">Check out</a></div>
              <div class="login_button"><a href="login.html">Login</a></div>
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
      <div class="clearfix"></div>
    </div>
  </div>
</div>
<div class="container">
  <div class="banner">
    <div class="banner_desc">
      <h1>New Season Arrivals.</h1>
      <h2>Check out all the new trends</h2>
    </div>
    <div class="button">
      <a href="#" class="hvr-shutter-out-horizontal">Shop Now</a>
    </div>
  </div>
</div>
<%
  List<Clothes> list = new ArrayList<Clothes>();
  Class.forName("com.mysql.jdbc.Driver");

  Connection con = null;
  String database = "clothingshop";
  String connectionURL = "jdbc:mysql://localhost:3306/" + database;
  String dbUser = "root";
  String dbPassword = "";

  String sql = "select * from product ORDER BY date desc limit 3";
  try {
    con = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery(sql);
    while (rs.next()) {

      int id = rs.getInt("id");
      String _name = rs.getString("name");
      int price = rs.getInt("price");
      String describe = rs.getString("describe");
      int catid = rs.getInt("catid");
      int brand1 = rs.getInt("b_id");
      String picture = rs.getString("picture");
      Clothes cat1 = new Clothes(id, _name, price, describe, catid, brand1, picture);
      list.add(cat1);
    }
    request.setAttribute("newest", list);
    session.setAttribute("newest", list);
  } catch (SQLException s) {
    System.out.println("SQL statement is not executed!");
  }
%>


<div class="content_top">
  <h3 class="m_1">Latest Products</h3>
  <div class="container">
    <div class="box_1">
      <div class="col-md-7">
        <c:forEach items="${newest}" var="c">

        <div class="section group">

          <div class="col_1_of_3 span_1_of_3">
            <div class="shop-holder">
              <div class="product-img">

                <a href="details.jsp">

                  <img width="225" height="265" src="img/${c.picture}" class="img-responsive"  alt="item4"> </a>
                <a href="" class="button "></a>	 </div>
            </div>


            <div class="shop-content" style="height: 80px;">

         <h5> <a href="details.jsp"> ${c.name}</a></h5>
            ${c.price}$

            </div>
          </div>

          </div>
        </c:forEach>

        <div class="clearfix"></div>
        </div>
      </div>
      <div class="col-md-5 row_3">
        <div class="about-block-content">
           <div class="border-add"></div>
          <h4>About Us</h4>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Obcaecati beatae quam voluptatibus deleniti ipsa consequatur!</p>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing.</p>
          <p>		        	</p></div>
        <img src="images/pic9.jpg" class="img-responsive" alt=""/>
      </div>
      <div class="clearfix"></div>
    </div>
  </div>
</div>
<div class="content_bottom">
  <div class="container">
    <h2 class="m_3">From the Blog</h2>
    <div class="grid_1">
      <div class="col-md-6 blog_1">
        <div class="item-inner">
          <img src="images/pic7.jpg" class="img-responsive" alt=""/>
          <div class="date-comments">
            <div class="time"><span class="date"><span class="word1">14</span> <span class="word2">Jan</span> </span></div>
            <div class="comments">
						<span><span class="word1">0</span>
						<span class="word2">comment</span></span>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-6 row_2">
        <div class="item-inner">
          <img src="images/pic8.jpg" class="img-responsive" alt=""/>
          <div class="date-comments">
            <div class="time"><span class="date"><span class="word1">14</span> <span class="word2">Jan</span> </span></div>
            <div class="comments">
						<span><span class="word1">0</span>
						<span class="word2">comment</span></span>
            </div>
          </div>
        </div>
      </div>
      <div class="clearfix"></div>
    </div>
  </div>
</div>


<div class="content_bottom-grid">
  <div class="col-md-6 row_4">
  </div>
</div>
<div class="clearfix"></div>

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
        <p>Copyright © 2015 Buy_shop. All Rights Reserved.<a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
      </div>
    </div>
  </div>
</div>
</body>
</html>