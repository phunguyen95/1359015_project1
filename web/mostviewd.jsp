<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
--><%@ page import="com.mypackage.ClothesDao" %>
<%@ page import="com.mypackage.Clothes" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.sql.*" %>
<%@ page import="controller.ClothesCart" %>
<%@ page import="java.util.*" %>
<%@ page import="com.mypackage.Category" %>
<%@ page import="com.mypackage.Brand" %>
<!DOCTYPE html>
<html>
<head>
  <title>Plot a Real Estate Category Flat bootstrap Responsive website Template | Services :: w3layouts</title>
  <link href="css/bootstrap4.css" type="text/css" rel="stylesheet" media="all">
  <link href="css/style4.css" type="text/css" rel="stylesheet" media="all">
  <!--web-font-->
  <link href='http://fonts.googleapis.com/css?family=Marvel:400,400italic,700,700italic' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
  <!--//web-font-->
  <!-- Custom Theme files -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="keywords" content="Plot Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
  <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
  <!-- //Custom Theme files -->
  <!-- js -->
  <script src="js/jquery-1.11.1.min.js"></script>
  <!-- //js -->
  <!-- start-smoth-scrolling-->
  <script type="text/javascript" src="js/move-top.js"></script>
  <script type="text/javascript" src="js/easing.js"></script>
  <script type="text/javascript">
    jQuery(document).ready(function($) {
      $(".scroll").click(function(event){
        event.preventDefault();
        $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
      });
    });
  </script>
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
  <!--//end-smoth-scrolling-->
</head>
<%
  List<Clothes> list = new ArrayList<Clothes>();
  try {
    Class.forName("com.mysql.jdbc.Driver");
  } catch (ClassNotFoundException e) {
    e.printStackTrace();
  }

  Connection con = null;
  String database = "clothingshop";
  String connectionURL = "jdbc:mysql://localhost:3306/" + database;
  String dbUser = "root";
  String dbPassword = "";

  String sql = "select * from product ORDER BY view desc limit 9";
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
      int brand = rs.getInt("b_id");
      String picture = rs.getString("picture");
      Clothes cat = new Clothes(id, _name, price, describe, catid, brand, picture);
      list.add(cat);
    }
    request.setAttribute("view", list);
    session.setAttribute("view", list);
  } catch (SQLException s) {
    System.out.println("SQL statement is not executed!");
  }
%>
<body>
<div class="container-fluid">
  <div class="row">
    <!--side-bar-->
    <div class="col-sm-3 col-md-2 sidebar">
      <div class="logo">
        <a href="index.jsp"><img src="images/logo10.png" alt="logo"/></a>
      </div>
      <div class="top-nav">
        <span class="menu-icon"><img src="images/menu-icon.png" alt=""/></span>
        <div class="nav1">
          <ul class=" nav nav-sidebar">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="Men.jsp">Product</a></li>
            <li class="active"><a href="bestsell.jsp">top 9 Best Buy</a></li>
            <li><a href="lastestproduct.jsp">Latest Product</a></li>
            <li><a href="mostviewd.jsp">Top 9 Most Viewed</a></li>
          </ul>
          <div class="social-icons">
            <ul>
              <li><a href="#"></a></li>
              <li><a href="#" class="fb"></a></li>
              <li><a href="#" class="be"></a></li>
              <li><a href="#" class="gg"></a></li>
            </ul>
          </div>
        </div>
        <!-- script-for-menu -->
        <script>
          $( "span.menu-icon" ).click(function() {
            $( ".nav1" ).slideToggle( 300, function() {
              // Animation complete.
            });
          });
        </script>
        <!-- /script-for-menu -->
      </div>
      <div class="clearfix"> </div>
      <p>Copyright © 2015 Plot. All rights reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
    </div>
    <!--//side-bar-->
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
          <h3>Top 9 Most Viewd</h3>

          <!-- grids_of_4 -->
          <c:forEach var="cloth" items="${view}">

            <div class="grids_of_4">

              <div class="grid1_of_4">
                <div class="content_box">   <a href="GetId?name=${cloth.id}">

                  <div class="view view-fifth">
                    <img src="img/${cloth.picture}" width="146px" height="207px"  alt=""/>
                    <div class="mask1">
                      <div class="info"> </div>
                    </div>
                  </div>
                </a>
                </div>
                <a href="GetId?name=${cloth.id}"> <h5>${cloth.name}</h5></a>
                  ${cloth.price}$

              </div>
            </div>

          </c:forEach>



          <div class="clearfix"></div>
        </div>
        <!-- end grids_of_4 -->
      </div>
    </div>
    <div class="footer">
      <p>Copyright © 2015 Plot. All rights reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
    </div>
  </div>
</div>
</div>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/bootstrap2.js"> </script>
</body>
</html>