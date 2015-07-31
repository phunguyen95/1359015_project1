<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@ page import="com.mypackage.Clothes" %>
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
    <title>Furnyish Store a Ecommerce Category Flat Bootstarp Responsive Website Template | Cart :: w3layouts</title>
    <link href="css/bootstrap5.css" rel='stylesheet' type='text/css' />
    <!-- jQuery (necessary JavaScript plugins) -->
    <script type='text/javascript' src="js/jquery-1.11.1.min.js"></script>
    <!-- Custom Theme files -->
    <link href="css/style5.css" rel='stylesheet' type='text/css' />
    <!-- Custom Theme files -->
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Furnyish Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href='http://fonts.googleapis.com/css?family=Montserrat|Raleway:400,200,300,500,600,700,800,900,100' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Playfair+Display:400,700,900' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Aladin' rel='stylesheet' type='text/css'>
    <!-- start menu -->
    <link href="css/megamenu5.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="js/megamenu.js"></script>
    <script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
    <script src="js/menu_jquery.js"></script>
    <script src="js/simpleCart.min.js"> </script>
    <script src="js/responsiveslides.min.js"></script>
    <script>
        // You can also use "$(window).load(function() {"
        $(function () {
            // Slideshow 1
            $("#slider1").responsiveSlides({
                auto: true,
                nav: true,
                speed: 500,
                namespace: "callbacks"
            });
        });
    </script>

</head>
<body>

<!-- header -->
<div class="top_bg">
    <div class="container">
        <div class="header_top-sec">
            <div class="top_right">
                <ul>
                    <li><a href="#">help</a></li>|
                    <li><a href="contact.html">Contact</a></li>|
                    <li><a href="login.html">Track Order</a></li>
                </ul>
            </div>
            <div class="top_left">
                <ul>
                    <li class="top_link">Email: <a href="mailto@example.com">info(at)Mobilya.com</a></li>|
                    <li class="top_link"><a href="profile.jsp">My Account</a></li>|
                </ul>
                <div class="social">
                    <ul>
                        <li><a href="#"><i class="facebook"></i></a></li>
                        <li><a href="#"><i class="twitter"></i></a></li>
                        <li><a href="#"><i class="dribble"></i></a></li>
                        <li><a href="#"><i class="google"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<div class="header_top">
    <div class="container">

    </div>
</div>
<!--cart-->

<!------>
<div class="mega_nav">
    <div class="container">
        <div class="menu_sec">
            <!-- start header menu -->
            <ul class="megamenu skyblue">            </ul>

            <li class="active grid"><a class="color1" href="index.jsp">Home</a></li>
                <li class="grid"><a class="color2" href="Men.jsp">All Product</a>
                </li>
        </div>
        <!---->


        <div class="cart_main">
            <div class="container">
                <ol class="breadcrumb">
                    <li><a href="Men.jsp">Home</a></li>
                    <li class="active">Cart</li>
                </ol>
                <div class="cart-items">
                    <h2>My Shopping Bag (2)</h2>
                    <script>$(document).ready(function(c) {
                        $('.close1').on('click', function(c){
                            $('.cart-header').fadeOut('slow', function(c){
                                $('.cart-header').remove();
                            });
                        });
                    });
                    </script>

                    <div class="cart-header">

                        <div class="close1"> </div>
                        <form id="rating" method="post" action="updatecart.jsp">

                        <div class="cart-sec">

                            <c:forEach items="${list}" var="c">

                                <div class="cart-item cyc">
                                    <img src="img/${c.picture}">
                                </div>
                                <div class="cart-item-info">
                                    <h3>${c.name}r<span>${c.id}</span></h3>
                                    <h4><span>Rs. $ </span>${c.price}</h4>
                                    <p class="qty">Qty ::</p>
                                        <input type="text" name="quantity${c.id}" value="${c.total}">

                                </div>
                                <div class="clearfix"></div>
                                <div class="delivery">
                                    <p>Total:${c.total*c.price}</p>
                                </div>
                                <div>
                                    <a href="deletecart.jsp?id=${c.id}">Delete</a>
                                </div>
                                <input type="hidden" value="${c.id}" name="id">

                            </c:forEach>
                                <input type="submit" value="Update">
                                 </form>


                </div>

                    </div>

                </div>

                <div class="cart-total">
                </div>
                <div class="price-details">
                    <h3>Price Details</h3>
                    <span>Total</span>
                    <span class="total"><%=session.getAttribute("total")%></span>
                    <span>Discount</span>
                    <span class="total">---</span>

                    <div class="clearfix"></div>
                </div>
                <h4 class="last-price">TOTAL</h4>
                <span class="total final"><%=session.getAttribute("total")%></span>
                <div class="clearfix"></div>
                <a class="order" href="checkout.jsp">Checkout</a>
            </div>

        </div>

    </div>
    <!---->

    <!---->
</div>

<!---->
</body>
</html>
