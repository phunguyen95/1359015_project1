<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@page import="com.mypackage.ClothesDao"%>
<%@page import="com.mypackage.Clothes"%>
<%@page import="com.mypackage.ClothesJspGui"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
  <title>Buy_shop an E-Commerce online Shopping Category Flat Bootstarp responsive Website Template| Single :: w3layouts</title>
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
  <script src="js/jquery.easydropdown.js"></script>
  <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
  <script type="text/javascript" src="js/megamenu.js"></script>
  <script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
  <link rel="stylesheet" href="css/etalage.css">
  <script src="js/jquery.etalage.min.js"></script>
  <script>
    jQuery(document).ready(function($){

      $('#etalage').etalage({
        thumb_image_width: 300,
        thumb_image_height: 400,
        source_image_width: 900,
        source_image_height: 1200,
        show_hint: true,
        click_callback: function(image_anchor, instance_id){
          alert('Callback example:\nYou clicked on an image with the anchor: "'+image_anchor+'"\n(in Etalage instance: "'+instance_id+'")');
        }
      });

    });
  </script>
  <!--initiate accordion-->
  <script type="text/javascript">
    $(function() {

      var menu_ul = $('.menu_drop > li > ul'),
              menu_a  = $('.menu_drop > li > a');

      menu_ul.hide();

      menu_a.click(function(e) {
        e.preventDefault();
        if(!$(this).hasClass('active')) {
          menu_a.removeClass('active');
          menu_ul.filter(':visible').slideUp('normal');
          $(this).addClass('active').next().stop(true,true).slideDown('normal');
        } else {
          $(this).removeClass('active');
          $(this).next().stop(true,true).slideUp('normal');
        }
      });

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
        <li class="active"><a href="profile.jsp">My Account</a></li>
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

                <c:forEach items="${brand}" var="b">

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
              <%
                if((session.getAttribute("userid")==null)||session.getAttribute("userid").equals(""))
                {
              %>
              <div class="login_button"><a href="index.jsp">Login</a></div>
              <%
                }
              %>



              <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>

          </ul>
        </li>


      </ul>
      <div class="search">
        <form action="Search" method="post">
          <input type="text" name="name" class="textbox" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}">
          <input type="submit" value="Subscribe" id="submit" name="submit">
          <div id="response"> </div>
          </form></div>
      </div>
      <div class="clearfix"></div>
    </div>
            <div class="clearfix"></div>
          </ul>
        </li>
      </ul>
      <div class="clearfix"></div>
    </div>
    <div class="clearfix"></div>
  </div>
</div>
<div class="single_top">
  <div class="container">
    <div class="single_grid">
      <div class="grid images_3_of_2">
        <ul id="etalage">
          <li>
            <a href="optionallink.html">
              <img class="etalage_thumb_image" src="img/${requestScope.detail.picture}" class="img-responsive" />
              <img class="etalage_source_image"src="img/${requestScope.detail.picture}" title="" />
            </a>
          </li>
          </ul>
        <div class="clearfix"></div>
      </div>
      <div class="desc1 span_3_of_2">
        <ul class="back">
          <li><i class="back_arrow"> </i>Back to <a href="Men.jsp">Men's Clothing</a></li>
        </ul>
        <h1>${requestScope.detail.name}</h1>
        <ul class="price_single">
          <li class="head"><h2>${requestScope.detail.price}$</h2></li>
          <li class="head_desc"><a href="#">12 reviews</a><img src="images/review.png" alt=""/></li>
          <div class="clearfix"></div>
        </ul>
        <p>.${requestScope.detail.describe}</p>
        <div class="dropdown_top">
          <div class="dropdown_left">
            <select class="dropdown" tabindex="10" data-settings='{"wrapperClass":"metro1"}'>
              <option value="0">Select size</option>
              <option value="1">M</option>
              <option value="2">L</option>
              <option value="3">XL </option>
              <option value="4">Fs</option>
              <option value="5">S </option>
              <option value="5"></option>
              <option value="5"></option>
            </select>
          </div>
          <ul class="color_list">
            <li><a href="#"> <span class="color1"> </span></a></li>
            <li><a href="#"> <span class="color2"> </span></a></li>
            <li><a href="#"> <span class="color3"> </span></a></li>
            <li><a href="#"> <span class="color4"> </span></a></li>
            <li><a href="#"> <span class="color5"> </span></a></li>
          </ul>
          <div class="clearfix"></div>
        </div>
        <a href="BuyProcess?name=${requestScope.detail.id}" class="btn1 btn2 btn-primary1"><span>Add To Cart</span></a>
      </div>
      <div class="clearfix"></div>
    </div>
    <div class="single_social_top">
      <ul class="single_social">
        <li><a href="#"> <i class="s_fb"> </i> <div class="social_desc">Share<br> on facebook</div><div class="clearfix"> </div></a></li>
        <li><a href="#"> <i class="s_twt"> </i> <div class="social_desc">Tweet<br> this product</div><div class="clearfix"> </div></a></li>
        <li><a href="#"> <i class="s_google"> </i><div class="social_desc">Google+<br> this product</div><div class="clearfix"> </div></a></li>
        <li class="last"><a href="#"> <i class="s_email"> </i><div class="social_desc">Email<br> a Friend</div><div class="clearfix"> </div></a></li>
      </ul>
    </div>
    <ul class="menu_drop">
      <li class="item1"><a href="#"><img src="images/product_arrow.png">Description</a>
        <ul>
          <li class="subitem1"><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor </a></li>
          <li class="subitem2"><a href="#"> Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore</a></li>
          <li class="subitem3"><a href="#">Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes </a></li>
        </ul>
      </li>
      <li class="item2"><a href="#"><img src="images/product_arrow.png">Additional information</a>
        <ul>
          <li class="subitem2"><a href="#"> Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore</a></li>
          <li class="subitem3"><a href="#">Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes </a></li>
        </ul>
      </li>
      <li class="item3"><a href="#"><img src="images/product_arrow.png">Reviews (10)</a>
        <ul>
          <li class="subitem1"><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor </a></li>
          <li class="subitem2"><a href="#"> Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore</a></li>
          <li class="subitem3"><a href="#">Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes </a></li>
        </ul>
      </li>
      <li class="item4"><a href="#"><img src="images/product_arrow.png">Helpful Links</a>
        <ul>
          <li class="subitem2"><a href="#"> Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore</a></li>
          <li class="subitem3"><a href="#">Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes </a></li>
        </ul>
      </li>
      <li class="item5"><a href="#"><img src="images/product_arrow.png">Make A Gift</a>
        <ul>
          <li class="subitem1"><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor </a></li>
          <li class="subitem2"><a href="#"> Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore</a></li>
          <li class="subitem3"><a href="#">Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes </a></li>
        </ul>
      </li>
    </ul>
  </div>
  <h3 class="m_2">Related Products</h3>

<div class="container">
  <c:forEach var="cloth" items="${product}">

  <div class="box_3">
      <div class="col-md-3">

        <div class="content_box"><a href="GetID?name=${cloth.id}">
          <img src="img/${cloth.picture}" class="img-responsive" alt="">
        </a>
        </div>
        <h4><a href="GetID?name=${cloth.id}">${cloth.name}</a></h4>
        <p>$ ${cloth.price}</p>
      </div>

    </div>
  </c:forEach>
  <div class="clearfix"> </div>
</div>
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
        <p>Copyright © 2015 Buy_shop. All Rights Reserved.<a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
      </div>
    </div>
  </div>
</div>
</body>
</html>		