<%@ page import ="java.sql.*" %>

<%@ page import="java.util.Date" %>
<%--
  Created by IntelliJ IDEA.
  User: 13590_000
  Date: 5/22/2015
  Time: 9:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
<body>
<%
  String userid = request.getParameter("uname");
  String pwd = request.getParameter("pass");
  String database = "clothingshop";
  String connectionURL = "jdbc:mysql://localhost:3306/" + database;
  String dbUser = "root";
  String dbPassword = "";
  Connection connection;
  Class.forName("com.mysql.jdbc.Driver");
  connection = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
  Statement st = connection.createStatement();
  ResultSet rs;
  int a=0;
  String s = null;
    rs = st.executeQuery("select * from member where username='" + userid + "' and password='" + pwd + "'");
    if (rs.next()) {
      String name = rs.getString("fname");
      session.setAttribute("fname", name);

      String lname = rs.getString("lname");
      session.setAttribute("lname", lname);
      String email = rs.getString("email");
      session.setAttribute("email", email);
      String address = rs.getString("address");
      session.setAttribute("address", address);
      String telephone = rs.getString("telephone");
      int id = rs.getInt("id");
      session.setAttribute("iduser", id);
      session.setAttribute("telephone", telephone);
      session.setAttribute("userid", userid);

      if (session.getAttribute("list") != null) {

        response.sendRedirect("viewCart.jsp");
      }

      //out.println("welcome " + userid);
      //out.println("<a href='logout.jsp'>Log out</a>");
      else {
        if ((session.getAttribute("userid") == "admin") || (session.getAttribute("userid").equals("admin"))) {
          response.sendRedirect("admin.jsp");
        } else {
          response.sendRedirect("index.jsp");
          session.removeAttribute("count");
        }
      }
    }
    else {
      if (null != session.getAttribute("count")) {
      Integer count = (Integer) session.getAttribute("count");
      count = new Integer(count.intValue() + 1);
      session.setAttribute("count", count);
    }
      else if(null==session.getAttribute("count")) {
        session.setAttribute("count", 1);
      }
      response.sendRedirect("index.jsp");
    }



%>
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
            <input type="submit" id="submit1" value="Log in" style="margin-right:45px"> <a href="register.php"><input type="button" id="signup" value="Register" /></a>
            <label><input type="checkbox" checked="checked"> Keep me signed in</label>
          </fieldset>
        </form>
      </div>
    </li></ul></nav>
</div>
</div>
</body>
</html>
