<%@page import="com.mypackage.ClothesDao"%>
<%@page import="com.mypackage.Clothes"%>
<%@page import="com.mypackage.ClothesJspGui"%>
<%@ page import="java.util.List" %>
<%@page import="java.sql.*"%>
<%@ page import="com.mypackage.Category" %>
<%--
  Created by IntelliJ IDEA.
  User: 13590_000
  Date: 5/19/2015
  Time: 7:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title></title>
</head>
<body>
<%--
  Created by IntelliJ IDEA.
  User: 13590_000
  Date: 5/20/2015
  Time: 12:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title></title>
</head>
<body>
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
</head>
<html>
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
<div class="wrap-box"></div>
<div class="header_bottom">
  <div class="container">
    <div class="col-xs-9 header-bottom-left">
      <div class="col-xs-2 logo">
        <h1><a href="index.html"><span>Buy</span>shop</a></h1>
      </div>
      <div class="col-xs-7 menu">
        <ul class="megamenu skyblue">
          <li class="active grid"><a class="color1" href="index.html">Men</a><div class="megapanel">
            <div class="row">
              <div class="col1">
                <div class="h_nav">
                  <ul>
                    <li><a href="men.html">Accessories</a></li>
                    <li><a href="men.html">Bags</a></li>
                    <li><a href="men.html">Caps & Hats</a></li>
                    <li><a href="men.html">Hoodies & Sweatshirts</a></li>
                    <li><a href="men.html">Jackets & Coats</a></li>
                    <li><a href="men.html">Jeans</a></li>
                    <li><a href="men.html">Jewellery</a></li>
                    <li><a href="men.html">Jumpers & Cardigans</a></li>
                    <li><a href="men.html">Leather Jackets</a></li>
                    <li><a href="men.html">Long Sleeve T-Shirts</a></li>
                    <li><a href="men.html">Loungewear</a></li>
                  </ul>
                </div>
              </div>
              <div class="col1">
                <div class="h_nav">
                  <ul>
                    <li><a href="men.html">Shirts</a></li>
                    <li><a href="men.html">Shoes, Boots & Trainers</a></li>
                    <li><a href="men.html">Shorts</a></li>
                    <li><a href="men.html">Suits & Blazers</a></li>
                    <li><a href="men.html">Sunglasses</a></li>
                    <li><a href="men.html">Sweatpants</a></li>
                    <li><a href="men.html">Swimwear</a></li>
                    <li><a href="men.html">Trousers & Chinos</a></li>
                    <li><a href="men.html">T-Shirts</a></li>
                    <li><a href="men.html">Underwear & Socks</a></li>
                    <li><a href="men.html">Vests</a></li>
                  </ul>
                </div>
              </div>
              <div class="col1">
                <div class="h_nav">
                  <h4>Popular Brands</h4>
                  <ul>
                    <li><a href="men.html">Levis</a></li>
                    <li><a href="men.html">Persol</a></li>
                    <li><a href="men.html">Nike</a></li>
                    <li><a href="men.html">Edwin</a></li>
                    <li><a href="men.html">New Balance</a></li>
                    <li><a href="men.html">Jack & Jones</a></li>
                    <li><a href="men.html">Paul Smith</a></li>
                    <li><a href="men.html">Ray-Ban</a></li>
                    <li><a href="men.html">Wood Wood</a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          </li>
          <li class="grid"><a class="color2" href="#">Women</a>
            <div class="megapanel">
              <div class="row">
                <div class="col1">
                  <div class="h_nav">
                    <ul>
                      <li><a href="men.html">Accessories</a></li>
                      <li><a href="men.html">Bags</a></li>
                      <li><a href="men.html">Caps & Hats</a></li>
                      <li><a href="men.html">Hoodies & Sweatshirts</a></li>
                      <li><a href="men.html">Jackets & Coats</a></li>
                      <li><a href="men.html">Jeans</a></li>
                      <li><a href="men.html">Jewellery</a></li>
                      <li><a href="men.html">Jumpers & Cardigans</a></li>
                      <li><a href="men.html">Leather Jackets</a></li>
                      <li><a href="men.html">Long Sleeve T-Shirts</a></li>
                      <li><a href="men.html">Loungewear</a></li>
                    </ul>
                  </div>
                </div>
                <div class="col1">
                  <div class="h_nav">
                    <ul>
                      <li><a href="men.html">Shirts</a></li>
                      <li><a href="men.html">Shoes, Boots & Trainers</a></li>
                      <li><a href="men.html">Shorts</a></li>
                      <li><a href="men.html">Suits & Blazers</a></li>
                      <li><a href="men.html">Sunglasses</a></li>
                      <li><a href="men.html">Sweatpants</a></li>
                      <li><a href="men.html">Swimwear</a></li>
                      <li><a href="men.html">Trousers & Chinos</a></li>
                      <li><a href="men.html">T-Shirts</a></li>
                      <li><a href="men.html">Underwear & Socks</a></li>
                      <li><a href="men.html">Vests</a></li>
                    </ul>
                  </div>
                </div>
                <div class="col1">
                  <div class="h_nav">
                    <h4>Popular Brands</h4>
                    <ul>
                      <li><a href="men.html">Levis</a></li>
                      <li><a href="men.html">Persol</a></li>
                      <li><a href="men.html">Nike</a></li>
                      <li><a href="men.html">Edwin</a></li>
                      <li><a href="men.html">New Balance</a></li>
                      <li><a href="men.html">Jack & Jones</a></li>
                      <li><a href="men.html">Paul Smith</a></li>
                      <li><a href="men.html">Ray-Ban</a></li>
                      <li><a href="men.html">Wood Wood</a></li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </li>
          <li><a class="color4" href="about.html">About</a></li>
          <li><a class="color5" href="delete.jsp">Delete</a></li>
          <li><a class="color6" href="insert.jsp">Insert</a></li>
          <li><a class="color7" href="update.jsp">Update</a></li>
          <li><a class="color8" href="category.jsp">Category</a></li>
          <li><a class="color9" href="View.jsp">Top Viewed</a></li>
        </ul>
      </div>
    </div>
    <div class="col-xs-3 header-bottom-right">
      <ul class="icon1 sub-icon1 profile_img">
        <li> <a class="active-icon c1" href="#"> </a>
          <ul class="sub-icon1 list">
            <h3>Recently added items(2)</h3>
            <div class="shopping_cart">
              <div class="cart_box">
                <div class="message">
                  <div class="alert-close"> </div>
                  <div class="list_img"><img src="images/14.jpg" class="img-responsive" alt=""/></div>
                  <div class="list_desc"><h4><a href="#">velit esse molestie</a></h4>1 x<span class="actual">
		                             $12.00</span></div>
                  <div class="clearfix"></div>

                </div>
              </div>
              <div class="cart_box1">
                <div class="message1">
                  <div class="alert-close1"> </div>
                  <div class="list_img"><img src="images/15.jpg" class="img-responsive" alt=""/></div>
                  <div class="list_desc"><h4><a href="#">velit esse molestie</a></h4>1 x<span class="actual">
		                             $12.00</span></div>
                  <div class="clearfix"></div>
                </div>
              </div>
            </div>
            <div class="total">
              <div class="total_left">CartSubtotal : </div>
              <div class="total_right">$250.00</div>
              <div class="clearfix"> </div>
            </div>
            <div class="login_buttons">
              <div class="check_button"><a href="checkout.html">Check out</a></div>
              <div class="login_button"><a href="login.html">Login</a></div>
              <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
          </ul>
        </li>
      </ul>
      <div class="search">
        <form method="post">
          <input type="text" name="s" class="textbox" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}">
          <input type="submit" value="Subscribe" id="submit" name="submit">
        </form>
        <div id="response"> </div>
      </div>
      <div class="clearfix"></div>
      <div class="clearfix"></div>
    </div>
  </div>
</div>
<p style="text-align: center;font-size: 50px">-----View Categoy---</p>
<%
  ClothesDao cd= new ClothesDao();
  List<Category> c= cd.getAll();
  out.print(ClothesJspGui.ToString(c));
%>
</body>
</html>
