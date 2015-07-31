<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ page import="nl.captcha.Captcha"%>
<%@ page import="com.mypackage.Brand" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

  <title>Buy_shop an E-Commerce online Shopping Category Flat Bootstarp responsive Website Template| Login :: w3layouts</title>
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
<link href="css/font-awesome.css" rel="stylesheet" type="text/css">
<link href="css/font-awesome.css" rel="stylesheet" type="text/css">
  <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
  <!-- start menu -->
  <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript">
  $(document).ajaxStart(function(){
    $("#loadingDiv").css("display","block");
  });
  $(document).ajaxComplete(function(){
    $("#loadingDiv").css("display","none");
  });
</script>
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
    <script type="text/javascript">
  function loadXMLDoc()
  {
    var xmlhttp;
    var xmlhttp2;
    var k=document.getElementById("uname").value;
    var urls="pass.jsp?ver="+k;
    var urls2="pass3.jsp?ver="+k;

    if (window.XMLHttpRequest)
    {
      xmlhttp=new XMLHttpRequest();
      xmlhttp2=new XMLHttpRequest();

    }
    else
    {
      xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
      xmlhttp2=new ActiveXObject("Microsoft.XMLHTTP");

    }

    xmlhttp.onreadystatechange=function()
    {
      if (xmlhttp.readyState==4)
      {
        //document.getElementById("err").style.color="red";
        document.getElementById("err").innerHTML=xmlhttp.responseText;
      }
    }
    xmlhttp2.onreadystatechange=function()
    {
      if (xmlhttp.readyState==4)
      {
        //document.getElementById("err").style.color="red";
        document.getElementById("err2").innerHTML=xmlhttp2.responseText;
      }
    }
    xmlhttp.open("GET",urls,true);
    xmlhttp.send();
    xmlhttp2.open("GET",urls2,true);
    xmlhttp2.send();
  }
  function loadXMLDocEmail()
  {
    var xmlhttp;
    var xmlhttp2;
    var k=document.getElementById("email").value;
    var urls="pass2.jsp?ver2="+k;
    var urls2="pass3.jsp?ver2="+k;

    if (window.XMLHttpRequest)
    {
      xmlhttp=new XMLHttpRequest();
      xmlhttp2=new XMLHttpRequest();

    }
    else
    {
      xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
      xmlhttp2=new ActiveXObject("Microsoft.XMLHTTP");

    }
    xmlhttp.onreadystatechange=function()
    {
      if (xmlhttp.readyState==4)
      {
        //document.getElementById("err").style.color="red";
        document.getElementById("er").innerHTML=xmlhttp.responseText;

      }
    }
    xmlhttp.open("GET",urls,true);
    xmlhttp.send();
    xmlhttp2.open("GET",urls2,true);
    xmlhttp2.send();
  }

  function checkPasswordMatch() {
    var password = $("#txtNewPassword").val();
    var confirmPassword = $("#txtConfirmPassword").val();

    if (password != confirmPassword)
      $("#divCheckPasswordMatch").html("Passwords do not match!");
    else
      $("#divCheckPasswordMatch").html("Passwords match.");

  }

  $(document).ready(function () {
    $("#txtConfirmPassword").keyup(checkPasswordMatch);
  });
  function phonenumber(inputtxt)
  {
    var phoneno = /^\d{10}$/;
    if((inputtxt.value.match(phoneno)))
    {
      return true;
    }
    else
    {
      alert("message");
      return false;
    }
  }

    </script>
  <%  ClothesDao cd = new ClothesDao();
    List<Category> cat = cd.getAllCategory();
    session.setAttribute("category",cat);
    List <Brand> brand=cd.getAllBrand();
    session.setAttribute("brand",brand);
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
          <li><a class="color10" href="lastestproduct.jsp">Newsest Product</a></li>
          <li><a class="color10" href="bestsell.jsp">Most Buy</a></li>
          <li><a class="color10" href="mostviewd.jsp">Most Viewed</a></li>

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
              <div class="login_button"><a href="admin.jsp">Login</a></div>
              <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>

          </ul>
        </li>


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
<div class="single_top">
  <div class="container">
    <div class="register">
      <form name="form1" action="SignUpServlet" method="post">
        <div class="register-top-grid">
          <h3>PERSONAL INFORMATION</h3>
          <div>
            <span>First Name<label>*</label></span>
            <input type="text" name="fname" required>
          </div>
          <div>
            <span>Last Name<label>*</label></span>
            <input type="text" name="lname"required>
          </div>
          <div>
            <span>Email Address<label>*</label></span>
            <input type="email" name="email" id="email" onblur="loadXMLDocEmail()" required>
            <span id="er"> </span>
          </div>
          <div>
            <span>Country <label>*</label></span>
            <select name="ucountry">
              <option value="Afghanistan" title ="Afghanistan">Afghanistan</option>
              <option value="�land Islands" title="�land Islands">�land Islands</option>
              <option value="Albania" title="Albania">Albania</option>
              <option value="Algeria" title="Algeria">Algeria</option>
              <option value="American Samoa" title="American Samoa">American Samoa</option>
              <option value="Andorra" title="Andorra">Andorra</option>
              <option value="Angola" title="Angola">Angola</option>
              <option value="Anguilla" title="Anguilla">Anguilla</option>
              <option value="Antarctica" title="Antarctica">Antarctica</option>
              <option value="Antigua and Barbuda" title="Antigua and Barbuda">Antigua and Barbuda</option>
              <option value="Argentina" title="Argentina">Argentina</option>
              <option value="Armenia" title="Armenia">Armenia</option>
              <option value="Aruba" title="Aruba">Aruba</option>
              <option value="Australia" title="Australia">Australia</option>
              <option value="Austria" title="Austria">Austria</option>
              <option value="Azerbaijan" title="Azerbaijan">Azerbaijan</option>
              <option value="Bahamas" title="Bahamas">Bahamas</option>
              <option value="Bahrain" title="Bahrain">Bahrain</option>
              <option value="Bangladesh" title="Bangladesh">Bangladesh</option>
              <option value="Barbados" title="Barbados">Barbados</option>
              <option value="Belarus" title="Belarus">Belarus</option>
              <option value="Belgium" title="Belgium">Belgium</option>
              <option value="Belize" title="Belize">Belize</option>
              <option value="Benin" title="Benin">Benin</option>
              <option value="Bermuda" title="Bermuda">Bermuda</option>
              <option value="Bhutan" title="Bhutan">Bhutan</option>
              <option value="Bolivia, Plurinational State of" title="Bolivia, Plurinational State of">Bolivia, Plurinational State of</option>
              <option value="Bonaire, Sint Eustatius and Saba" title="Bonaire, Sint Eustatius and Saba">Bonaire, Sint Eustatius and Saba</option>
              <option value="Bosnia and Herzegovina" title="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
              <option value="Botswana" title="Botswana">Botswana</option>
              <option value="Bouvet Island" title="Bouvet Island">Bouvet Island</option>
              <option value="Brazil" title="Brazil">Brazil</option>
              <option value="British Indian Ocean Territory" title="British Indian Ocean Territory">British Indian Ocean Territory</option>
              <option value="Brunei Darussalam" title="Brunei Darussalam">Brunei Darussalam</option>
              <option value="Bulgaria" title="Bulgaria">Bulgaria</option>
              <option value="Burkina Faso" title="Burkina Faso">Burkina Faso</option>
              <option value="Burundi" title="Burundi">Burundi</option>
              <option value="Cambodia" title="Cambodia">Cambodia</option>
              <option value="Cameroon" title="Cameroon">Cameroon</option>
              <option value="Canada" title="Canada">Canada</option>
              <option value="Cape Verde" title="Cape Verde">Cape Verde</option>
              <option value="Cayman Islands" title="Cayman Islands">Cayman Islands</option>
              <option value="Central African Republic" title="Central African Republic">Central African Republic</option>
              <option value="Chad" title="Chad">Chad</option>
              <option value="Chile" title="Chile">Chile</option>
              <option value="China" title="China">China</option>
              <option value="Christmas Island" title="Christmas Island">Christmas Island</option>
              <option value="Cocos (Keeling) Islands" title="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>
              <option value="Colombia" title="Colombia">Colombia</option>
              <option value="Comoros" title="Comoros">Comoros</option>
              <option value="Congo" title="Congo">Congo</option>
              <option value="Congo, the Democratic Republic of the" title="Congo, the Democratic Republic of the">Congo, the Democratic Republic of the</option>
              <option value="Cook Islands" title="Cook Islands">Cook Islands</option>
              <option value="Costa Rica" title="Costa Rica">Costa Rica</option>
              <option value="C�te d'Ivoire" title="C�te d'Ivoire">C�te d'Ivoire</option>
              <option value="Croatia" title="Croatia">Croatia</option>
              <option value="Cuba" title="Cuba">Cuba</option>
              <option value="Cura�ao" title="Cura�ao">Cura�ao</option>
              <option value="Cyprus" title="Cyprus">Cyprus</option>
              <option value="Czech Republic" title="Czech Republic">Czech Republic</option>
              <option value="Denmark" title="Denmark">Denmark</option>
              <option value="Djibouti" title="Djibouti">Djibouti</option>
              <option value="Dominica" title="Dominica">Dominica</option>
              <option value="Dominican Republic" title="Dominican Republic">Dominican Republic</option>
              <option value="Ecuador" title="Ecuador">Ecuador</option>
              <option value="Egypt" title="Egypt">Egypt</option>
              <option value="El Salvador" title="El Salvador">El Salvador</option>
              <option value="Equatorial Guinea" title="Equatorial Guinea">Equatorial Guinea</option>
              <option value="Eritrea" title="Eritrea">Eritrea</option>
              <option value="Estonia" title="Estonia">Estonia</option>
              <option value="Ethiopia" title="Ethiopia">Ethiopia</option>
              <option value="Falkland Islands (Malvinas)" title="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option>
              <option value="Faroe Islands" title="Faroe Islands">Faroe Islands</option>
              <option value="Fiji" title="Fiji">Fiji</option>
              <option value="Finland" title="Finland">Finland</option>
              <option value="France" title="France">France</option>
              <option value="French Guiana" title="French Guiana">French Guiana</option>
              <option value="French Polynesia" title="French Polynesia">French Polynesia</option>
              <option value="French Southern Territories" title="French Southern Territories">French Southern Territories</option>
              <option value="Gabon" title="Gabon">Gabon</option>
              <option value="Gambia" title="Gambia">Gambia</option>
              <option value="Georgia" title="Georgia">Georgia</option>
              <option value="Germany" title="Germany">Germany</option>
              <option value="Ghana" title="Ghana">Ghana</option>
              <option value="Gibraltar" title="Gibraltar">Gibraltar</option>
              <option value="Greece" title="Greece">Greece</option>
              <option value="Greenland" title="Greenland">Greenland</option>
              <option value="Grenada" title="Grenada">Grenada</option>
              <option value="Guadeloupe" title="Guadeloupe">Guadeloupe</option>
              <option value="Guam" title="Guam">Guam</option>
              <option value="Guatemala" title="Guatemala">Guatemala</option>
              <option value="Guernsey" title="Guernsey">Guernsey</option>
              <option value="Guinea" title="Guinea">Guinea</option>
              <option value="Guinea-Bissau" title="Guinea-Bissau">Guinea-Bissau</option>
              <option value="Guyana" title="Guyana">Guyana</option>
              <option value="Haiti" title="Haiti">Haiti</option>
              <option value="Heard Island and McDonald Islands" title="Heard Island and McDonald Islands">Heard Island and McDonald Islands</option>
              <option value="Holy See (Vatican City State)" title="Holy See (Vatican City State)">Holy See (Vatican City State)</option>
              <option value="Honduras" title="Honduras">Honduras</option>
              <option value="Hong Kong" title="Hong Kong">Hong Kong</option>
              <option value="Hungary" title="Hungary">Hungary</option>
              <option value="Iceland" title="Iceland">Iceland</option>
              <option value="India" title="India">India</option>
              <option value="Indonesia" title="Indonesia">Indonesia</option>
              <option value="Iran, Islamic Republic of" title="Iran, Islamic Republic of">Iran, Islamic Republic of</option>
              <option value="Iraq" title="Iraq">Iraq</option>
              <option value="Ireland" title="Ireland">Ireland</option>
              <option value="Isle of Man" title="Isle of Man">Isle of Man</option>
              <option value="Israel" title="Israel">Israel</option>
              <option value="Italy" title="Italy">Italy</option>
              <option value="Jamaica" title="Jamaica">Jamaica</option>
              <option value="Japan" title="Japan">Japan</option>
              <option value="Jersey" title="Jersey">Jersey</option>
              <option value="Jordan" title="Jordan">Jordan</option>
              <option value="Kazakhstan" title="Kazakhstan">Kazakhstan</option>
              <option value="Kenya" title="Kenya">Kenya</option>
              <option value="Kiribati" title="Kiribati">Kiribati</option>
              <option value="Korea, Democratic People's Republic of" title="Korea, Democratic People's Republic of">Korea, Democratic People's Republic of</option>
              <option value="Korea, Republic of" title="Korea, Republic of">Korea, Republic of</option>
              <option value="Kuwait" title="Kuwait">Kuwait</option>
              <option value="Kyrgyzstan" title="Kyrgyzstan">Kyrgyzstan</option>
              <option value="Lao People's Democratic Republic" title="Lao People's Democratic Republic">Lao People's Democratic Republic</option>
              <option value="Latvia" title="Latvia">Latvia</option>
              <option value="Lebanon" title="Lebanon">Lebanon</option>
              <option value="Lesotho" title="Lesotho">Lesotho</option>
              <option value="Liberia" title="Liberia">Liberia</option>
              <option value="Libya" title="Libya">Libya</option>
              <option value="Liechtenstein" title="Liechtenstein">Liechtenstein</option>
              <option value="Lithuania" title="Lithuania">Lithuania</option>
              <option value="Luxembourg" title="Luxembourg">Luxembourg</option>
              <option value="Macao" title="Macao">Macao</option>
              <option value="Macedonia, the former Yugoslav Republic of" title="Macedonia, the former Yugoslav Republic of">Macedonia, the former Yugoslav Republic of</option>
              <option value="Madagascar" title="Madagascar">Madagascar</option>
              <option value="Malawi" title="Malawi">Malawi</option>
              <option value="Malaysia" title="Malaysia">Malaysia</option>
              <option value="Maldives" title="Maldives">Maldives</option>
              <option value="Mali" title="Mali">Mali</option>
              <option value="Malta" title="Malta">Malta</option>
              <option value="Marshall Islands" title="Marshall Islands">Marshall Islands</option>
              <option value="Martinique" title="Martinique">Martinique</option>
              <option value="Mauritania" title="Mauritania">Mauritania</option>
              <option value="Mauritius" title="Mauritius">Mauritius</option>
              <option value="Mayotte" title="Mayotte">Mayotte</option>
              <option value="Mexico" title="Mexico">Mexico</option>
              <option value="Micronesia, Federated States of" title="Micronesia, Federated States of">Micronesia, Federated States of</option>
              <option value="Moldova, Republic of" title="Moldova, Republic of">Moldova, Republic of</option>
              <option value="Monaco" title="Monaco">Monaco</option>
              <option value="Mongolia" title="Mongolia">Mongolia</option>
              <option value="Montenegro" title="Montenegro">Montenegro</option>
              <option value="Montserrat" title="Montserrat">Montserrat</option>
              <option value="Morocco" title="Morocco">Morocco</option>
              <option value="Mozambique" title="Mozambique">Mozambique</option>
              <option value="Myanmar" title="Myanmar">Myanmar</option>
              <option value="Namibia" title="Namibia">Namibia</option>
              <option value="Nauru" title="Nauru">Nauru</option>
              <option value="Nepal" title="Nepal">Nepal</option>
              <option value="Netherlands" title="Netherlands">Netherlands</option>
              <option value="New Caledonia" title="New Caledonia">New Caledonia</option>
              <option value="New Zealand" title="New Zealand">New Zealand</option>
              <option value="Nicaragua" title="Nicaragua">Nicaragua</option>
              <option value="Niger" title="Niger">Niger</option>
              <option value="Nigeria" title="Nigeria">Nigeria</option>
              <option value="Niue" title="Niue">Niue</option>
              <option value="Norfolk Island" title="Norfolk Island">Norfolk Island</option>
              <option value="Northern Mariana Islands" title="Northern Mariana Islands">Northern Mariana Islands</option>
              <option value="Norway" title="Norway">Norway</option>
              <option value="Oman" title="Oman">Oman</option>
              <option value="Pakistan" title="Pakistan">Pakistan</option>
              <option value="Palau" title="Palau">Palau</option>
              <option value="Palestinian Territory, Occupied" title="Palestinian Territory, Occupied">Palestinian Territory, Occupied</option>
              <option value="Panama" title="Panama">Panama</option>
              <option value="Papua New Guinea" title="Papua New Guinea">Papua New Guinea</option>
              <option value="Paraguay" title="Paraguay">Paraguay</option>
              <option value="Peru" title="Peru">Peru</option>
              <option value="Philippines" title="Philippines">Philippines</option>
              <option value="Pitcairn" title="Pitcairn">Pitcairn</option>
              <option value="Poland" title="Poland">Poland</option>
              <option value="Portugal" title="Portugal">Portugal</option>
              <option value="Puerto Rico" title="Puerto Rico">Puerto Rico</option>
              <option value="Qatar" title="Qatar">Qatar</option>
              <option value="R�union" title="R�union">R�union</option>
              <option value="Romania" title="Romania">Romania</option>
              <option value="Russian Federation" title="Russian Federation">Russian Federation</option>
              <option value="Rwanda" title="Rwanda">Rwanda</option>
              <option value="Saint Barth�lemy" title="Saint Barth�lemy">Saint Barth�lemy</option>
              <option value="Saint Helena, Ascension and Tristan da Cunha" title="Saint Helena, Ascension and Tristan da Cunha">Saint Helena, Ascension and Tristan da Cunha</option>
              <option value="Saint Kitts and Nevis" title="Saint Kitts and Nevis">Saint Kitts and Nevis</option>
              <option value="Saint Lucia" title="Saint Lucia">Saint Lucia</option>
              <option value="Saint Martin (French part)" title="Saint Martin (French part)">Saint Martin (French part)</option>
              <option value="Saint Pierre and Miquelon" title="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option>
              <option value="Saint Vincent and the Grenadines" title="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option>
              <option value="Samoa" title="Samoa">Samoa</option>
              <option value="San Marino" title="San Marino">San Marino</option>
              <option value="Sao Tome and Principe" title="Sao Tome and Principe">Sao Tome and Principe</option>
              <option value="Saudi Arabia" title="Saudi Arabia">Saudi Arabia</option>
              <option value="Senegal" title="Senegal">Senegal</option>
              <option value="Serbia" title="Serbia">Serbia</option>
              <option value="Seychelles" title="Seychelles">Seychelles</option>
              <option value="Sierra Leone" title="Sierra Leone">Sierra Leone</option>
              <option value="Singapore" title="Singapore">Singapore</option>
              <option value="Sint Maarten (Dutch part)" title="Sint Maarten (Dutch part)">Sint Maarten (Dutch part)</option>
              <option value="Slovakia" title="Slovakia">Slovakia</option>
              <option value="Slovenia" title="Slovenia">Slovenia</option>
              <option value="Solomon Islands" title="Solomon Islands">Solomon Islands</option>
              <option value="Somalia" title="Somalia">Somalia</option>
              <option value="South Africa" title="South Africa">South Africa</option>
              <option value="South Georgia and the South Sandwich Islands" title="South Georgia and the South Sandwich Islands">South Georgia and the South Sandwich Islands</option>
              <option value="South Sudan" title="South Sudan">South Sudan</option>
              <option value="Spain" title="Spain">Spain</option>
              <option value="Sri Lanka" title="Sri Lanka">Sri Lanka</option>
              <option value="Sudan" title="Sudan">Sudan</option>
              <option value="Suriname" title="Suriname">Suriname</option>
              <option value="Svalbard and Jan Mayen" title="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option>
              <option value="Swaziland" title="Swaziland">Swaziland</option>
              <option value="Sweden" title="Sweden">Sweden</option>
              <option value="Switzerland" title="Switzerland">Switzerland</option>
              <option value="Syrian Arab Republic" title="Syrian Arab Republic">Syrian Arab Republic</option>
              <option value="Taiwan, Province of China" title="Taiwan, Province of China">Taiwan, Province of China</option>
              <option value="Tajikistan" title="Tajikistan">Tajikistan</option>
              <option value="Tanzania, United Republic of" title="Tanzania, United Republic of">Tanzania, United Republic of</option>
              <option value="Thailand" title="Thailand">Thailand</option>
              <option value="Timor-Leste" title="Timor-Leste">Timor-Leste</option>
              <option value="Togo" title="Togo">Togo</option>
              <option value="Tokelau" title="Tokelau">Tokelau</option>
              <option value="Tonga" title="Tonga">Tonga</option>
              <option value="Trinidad and Tobago" title="Trinidad and Tobago">Trinidad and Tobago</option>
              <option value="Tunisia" title="Tunisia">Tunisia</option>
              <option value="Turkey" title="Turkey">Turkey</option>
              <option value="Turkmenistan" title="Turkmenistan">Turkmenistan</option>
              <option value="Turks and Caicos Islands" title="Turks and Caicos Islands">Turks and Caicos Islands</option>
              <option value="Tuvalu" title="Tuvalu">Tuvalu</option>
              <option value="Uganda" title="Uganda">Uganda</option>
              <option value="Ukraine" title="Ukraine">Ukraine</option>
              <option value="United Arab Emirates" title="United Arab Emirates">United Arab Emirates</option>
              <option value="United Kingdom" title="United Kingdom">United Kingdom</option>
              <option value="United States" title="United States">United States</option>
              <option value="United States Minor Outlying Islands" title="United States Minor Outlying Islands">United States Minor Outlying Islands</option>
              <option value="Uruguay" title="Uruguay">Uruguay</option>
              <option value="Uzbekistan" title="Uzbekistan">Uzbekistan</option>
              <option value="Vanuatu" title="Vanuatu">Vanuatu</option>
              <option value="Venezuela, Bolivarian Republic of" title="Venezuela, Bolivarian Republic of">Venezuela, Bolivarian Republic of</option>
              <option value="Viet Nam" title="Viet Nam">Viet Nam</option>
              <option value="Virgin Islands, British" title="Virgin Islands, British">Virgin Islands, British</option>
              <option value="Virgin Islands, U.S." title="Virgin Islands, U.S.">Virgin Islands, U.S.</option>
              <option value="Wallis and Futuna" title="Wallis and Futuna">Wallis and Futuna</option>
              <option value="Western Sahara" title="Western Sahara">Western Sahara</option>
              <option value="Yemen" title="Yemen">Yemen</option>
              <option value="Zambia" title="Zambia">Zambia</option>
              <option value="Zimbabwe" title="Zimbabwe">Zimbabwe</option>
            </select>
          </div>
          <div class="clearfix"> </div>
          <a class="news-letter" href="#">
            <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i> </i>Sign Up for Newsletter</label>
          </a>
        </div>
        <div>
        </div>
        <div class="register-bottom-grid">
          <h3>LOGIN INFORMATION</h3>
          <div>
            <span>Username<label>*</label></span>
            <input type="text" name="uname" id="uname" onblur="loadXMLDoc()"required>
            <span id="err"> </span>
          </div>
          <div>
            <span>Password<label>*</label></span>
            <input type="password" id="txtNewPassword" name="pword"required>
          </div>
          <div>
            <div>
            <span>Confirm Password<label>*</label></span>
            <input type="password" id="txtConfirmPassword" onChange="checkPasswordMatch();" />
            <div class="registrationFormAlert" id="divCheckPasswordMatch">
            </div>
            </div>
            </div>
          <div>
            <span>Address<label>*</label></span>
            <input type="text" id="address" name="address"required>
          </div>
          <div>
            <span>Telephone<label>*</label></span>
          <input type="text" name="telephone" required>
          </div>

          <div class="clearfix"> </div>
        </div>
        <div class="clearfix"> </div>
        <div class="register-but">
          <div id="err2">
            <input type="submit" value="Register">
          </div>
          <div id="loadingDiv">
          <i  class="fa fa-refresh fa-spin"></i>
          </div>
          <div class="clearfix"> </div>
        </div>
      </form>

    </div>
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
        <p>Copyright � 2015 Buy_shop. All Rights Reserved.<a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
      </div>
    </div>
  </div>
</div>
</body>
</html>
