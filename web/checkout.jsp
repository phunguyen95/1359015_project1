<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- By Designscrazed.com , just a structure for easy usage. -->

<html lang='en'>
<head>
  <meta charset="UTF-8" />
  <title>
    Buy Shop
  </title>

  <link rel="stylesheet" type="text/css" href="css/style6.css" />

  <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
  <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
  <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,600' rel='stylesheet' type='text/css'>

</head>
<body>

<div class="headline">

  <h6></h6>

  <h1>
    Your List Order
    <h6></h6>
  </h1>
  <h2>Buy Shop</h2>

</div>

<!--  Start here -->
<%
  if(session.getAttribute("userid")!=null)
  {
%>
<div id="wrap">

  <div id="accordian">


    <div class="step" id="step2">
      <div class="number">
        <span>1</span>
      </div>
      <div class="title">
        <h1>Billing Information</h1>
      </div>
      <div class="modify">
        <i class="fa fa-plus-circle"></i>
      </div>
    </div>
    <div class="content" id="address">
      <form action="FileUpload" class="go-right" method="post">
        <input type="hidden" value="<%=session.getAttribute("total")%>" name="price">
        <div>
          <input type="text" name="fname" value="<%=session.getAttribute("fname")%>" id="first_name"  data-trigger="change" data-validation-minlength="1" data-type="name" data-required="true" data-error-message="Enter Your First Name"/><label for="first_name">First Name</label>
        </div>
        <div>
          <label for="last_name">Last Name</label>
          <input type="text" name="lname" value="<%=session.getAttribute("lname")%>" id="last_name"  data-trigger="change" data-validation-minlength="1" data-type="name" data-required="true" data-error-message="Enter Your Last Name"/><label for="last_name">Last Name</label>
        </div>
        <div>
          <input type="text" name="telephone" value="<%=session.getAttribute("telephone")%>" id="telephone" placeholder="<%=session.getAttribute("telephone")%>" data-trigger="change" data-validation-minlength="1" data-type="number" data-required="true" data-error-message="Enter Your Telephone Number"/><label for="telephone">Telephone</label>
        </div>
        <div>
          <input type="text" name="user" value="<%=session.getAttribute("userid")%>" id="company" placeholder="<%=session.getAttribute("userid")%>" data-trigger="change" data-validation-minlength="1" data-type="name" data-required="false" /><label for="Company">User's ID</label>
        </div>
        <div>
          <input type="text" name="address" value="<%=session.getAttribute("address")%>"  placeholder="123 Main Street" data-trigger="change" data-validation-minlength="1" data-type="text" data-required="true" data-error-message="Enter Your Billing Address"/><label for="Address">Address</label>
        </div>
        <div>
          <input type="text" name="date" value="<%= new java.util.Date()%>" id="city" placeholder="" data-trigger="change" data-validation-minlength="1" data-type="text" data-required="true" data-error-message="Enter Your Billing City"/><label for="city">Time</label>
        </div>
        <input type="submit" value="Submit">
      </form>
    </div>
    <div class="step" id="step4">
      <div class="number">
        <span>2</span>
      </div>
      <div class="title">
        <h1>Payment Information</h1>
      </div>
      <div class="modify">
        <i class="fa fa-plus-circle"></i>
      </div>
    </div>
    <div class="content" id="payment">
      <div class="left credit_card">
          <div>
            <input type="text" name="card_number" value="" id="card_number" placeholder="xxxx-xxxx-xxxx-xxxx" data-trigger="change" data-validation-minlength="1" data-type="name" data-required="true" data-error-message="Enter Your Credit Card Number"/><label for="card_number">Card Number</label>
          </div>
          <div>
            <div class="expiry">
              <div class="month_select">
                <select name="exp_month" value="" id="exp_month" placeholder="" data-trigger="change" data-type="name" data-required="true" data-error-message="Enter Your Credit Card Expiration Date">
                  <option value = "1">01 (Jan)</option>
                  <option value = "2">02 (Feb)</option>
                  <option value = "3">03 (Mar)</option>
                  <option value = "4">04 (Apr)</option>
                  <option value = "5">05 (May)</option>
                  <option value = "6">06 (Jun)</option>
                  <option value = "7">07 (Jul)</option>
                  <option value = "8">08 (Aug)</option>
                  <option value = "9">09 (Sep)</option>
                  <option value = "10">10 (Oct)</option>
                  <option value = "11">11 (Nov)</option>
                  <option value = "12">12 (Dec)</option>
                </select>
              </div>
              <span class="divider">-</span>
              <div class="year_select">
                <select name="exp_year" value="" id="exp_year" placeholder="" data-trigger="change" data-type="name" data-required="true" data-error-message="Enter Your Credit Card Expiration Date">
                  <option value = "1">14 </option>
                  <option value = "2">15 (Feb)</option>
                  <option value = "3">16 (Mar)</option>
                  <option value = "4">17 (Apr)</option>
                  <option value = "5">18 (May)</option>
                  <option value = "6">19 (Jun)</option>
                  <option value = "7">20 (Jul)</option>
                  <option value = "8">22 (Aug)</option>
                  <option value = "9">23 (Sep)</option>
                  <option value = "10">24 (Oct)</option>
                  <option value = "11">25 (Nov)</option>
                  <option value = "12">26 (Dec)</option>
                </select>
              </div>
            </div>
            <label class="exp_date" id="Exp_Date" for="Exp_Date">Exp Date</label>
          </div>
          <div class="sec_num">
            <div>
              <input type="text" name="ccv" value="" id="ccv" placeholder="123" data-trigger="change" data-validation-minlength="3" data-type="name" data-required="true" data-error-message="Enter Your Card Security Code"/>
              <label for="ccv">Security Code</label>
            </div>
          </div>
      </div>
      <div class="right">
        <div class="accepted">
          <span><img src="img/Z5HVIOt.png"></span>
          <span><img src="img/Le0Vvgx.png"></span>
          <span><img src="img/D2eQTim.png"></span>
          <span><img src="img/Pu4e7AT.png"></span>
          <span><img src="img/ewMjaHv.png"></span>
          <span><img src="img/3LmmFFV.png"></span>
        </div>
        <div class="secured">
          <img class="lock" src="img/lock.png">
          <p class="security info">What, well you mean like a date? Doc? Am I to understand you're still hanging around with Doctor Emmett Brown, McFly? Tardy slip for you, Miss Parker. And one for you McFly I believe that makes four in a row. Now let me give you a nickle's worth of advice, young man. This so called Doctor Brown is dangerous, he's a real nuttcase.</p>
        </div>
      </div>

    </div>
    <div class="step" id="step5">
      <div class="number">
        <span>3</span>
      </div>
      <div class="title">
        <h1>Finalize Order</h1>
      </div>
      <div class="modify">
        <i class="fa fa-plus-circle"></i>
      </div>

      <div class="content" id="final_products">

        <div class="left" id="ordered">
          <c:forEach items="${list}" var="c">

            <div class="products">
              <div class="product_image">
                <img src="img/${c.picture}"/>
              </div>
              <div class="product_details">
                <span class="product_name">Name'sProduct:${c.name}</span>
                <span class="quantity">Quantity:${c.total}</span>
                <span class="price">Price:${c.price}</span>
              </div>
            </div>
            <div class="totals">
              <span class="subtitle">Subtotal <span id="sub_price">${c.price*c.total}</span></span>
              <span class="subtitle">Tax <span id="sub_tax">$2.00</span></span>
            </div>
          </c:forEach>
          <div class="final">
            <span class="title">Total <span id="calculated_total"><%=session.getAttribute("total")%></span></span>
          </div>
        </div>

        <div class="right" id="reviewed">
          <div class="billing">
            <span class="title">Billing:</span>
            <div class="address_reviewed">
              <span class="name"><%=session.getAttribute("fname")%> <%=session.getAttribute("lname")%></span>
              <span class="address"><%=session.getAttribute("address")%></span>
              <span class="phone"><%=session.getAttribute("telephone")%></span>
            </div>
          </div>
          <div class="shipping">
            <span class="title">Shipping:</span>
            <div class="address_reviewed">
              <span class="name"><%=session.getAttribute("fname")%> <%=session.getAttribute("lname")%></span>
              <span class="address"><%=session.getAttribute("address")%></span>
              <span class="phone"><%=session.getAttribute("telephone")%></span>
            </div>
          </div>
          <div class="payment">
            <span class="title">Payment:</span>
            <div class="payment_reviewed">
              <span class="method">Visa</span>
              <span class="number_hidden">xxxx-xxxx-xxxx-1111</span>
            </div>
          </div>
          <div id="complete">
            <a class="big_button"  href="FileUpload">Complete Order</a>
            <span class="sub">By selecting this button you agree to the purchase and subsequent payment for this order.</span>
          </div>
        </div>
      </div>
    </div>

  </div>
</div>
<%
  }
  else
  {
%>
<div style="font-size: 50px">Please <a href="index.jsp">Login</a>  to finalize your order</div>
<%
  }
%>
</body>
</html>
