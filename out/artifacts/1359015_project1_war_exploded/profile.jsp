<!doctype html>
<html lang="en-US">
<head>
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html">
  <title>User Profile with Content Tabs - Design Shack Demo</title>
  <meta name="author" content="Jake Rocheleau">
  <link rel="shortcut icon" href="http://designshack.net/favicon.ico">
  <link rel="icon" href="http://designshack.net/favicon.ico">
  <link rel="stylesheet" type="text/css" media="all" href="css/style3.css">
  <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
</head>

<body>
<div id="topbar">
  <a href="index.jsp">Back to Homepage</a>
</div>

<div id="w">
  <div id="content" class="clearfix">
    <h1>Minimal User Profile Layout</h1>

    <nav id="profiletabs">
      <ul class="clearfix">
        <li><a href="#settings">Settings</a></li>
      </ul>
    </nav>

    <section id="settings" class="hidden">
      <p>Edit your user settings:</p>
    <form method="post" action="UpdateProfile">

      <p class="setting"> <span>Password: <img src="images/edit.png" alt="*Edit*"></span><input type="password" name="password" placeholder="Password"></p>

      <p class="setting"><span>Email <img src="images/edit.png" alt="*Edit*"></span>  <input type="text" value="<%=session.getAttribute("email")%>" name="email" placeholder=" <%=session.getAttribute("email")%>"></p>

      <p class="setting"><span>First Name <img src="images/edit.png" alt="*Edit*"></span> <input type="text" value="<%=session.getAttribute("fname")%>" name="fname" placeholder=" <%=session.getAttribute("fname")%>"></p>

      <p class="setting"><span>Last Name <img src="images/edit.png" alt="*Edit*"></span><input type="text" value="<%=session.getAttribute("lname")%>" name="lname" placeholder=" <%=session.getAttribute("lname")%>"></p>

      <p class="setting"><span>Telephone <img src="images/edit.png" alt="*Edit*"></span> <input type="text" value="<%=session.getAttribute("telephone")%>" name="telephone" placeholder=" <%=session.getAttribute("telephone")%>"></p>
      <p class="setting"><span>Address <img src="images/edit.png" alt="*Edit*"></span> <input type="text" value="<%=session.getAttribute("address")%>" name="address" placeholder=" <%=session.getAttribute("address")%>"></p>
    <input type="submit" value="Submit">
    </form>
    </section>
  </div><!-- @end #content -->
</div><!-- @end #w -->
<script type="text/javascript">
  $(function(){
    $('#profiletabs ul li a').on('click', function(e){
      e.preventDefault();
      var newcontent = $(this).attr('href');

      $('#profiletabs ul li a').removeClass('sel');
      $(this).addClass('sel');

      $('#content section').each(function(){
        if(!$(this).hasClass('hidden')) { $(this).addClass('hidden'); }
      });

      $(newcontent).removeClass('hidden');
    });
  });
</script>
</body>
</html>