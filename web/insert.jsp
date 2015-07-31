<%--
  Created by IntelliJ IDEA.
  User: 13590_000
  Date: 5/20/2015
  Time: 12:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<head>

  <style type="text/css">
    #wrapper {
      width:450px;
      margin-left: 400px;
        font-family:Verdana, sans-serif;
    }
    legend {
      color:#0481b1;
      font-size:16px;
      padding:0 10px;
      background:#fff;
      -moz-border-radius:4px;
      box-shadow: 0 1px 5px rgba(4, 129, 177, 0.5);
      padding:5px 10px;
      text-transform:uppercase;
      font-family:Helvetica, sans-serif;
      font-weight:bold;
    }
    fieldset {
      border-radius:4px;
      background: #fff;
      background: -moz-linear-gradient(#fff, #f9fdff);
      background: -o-linear-gradient(#fff, #f9fdff);
      background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#fff), to(#f9fdff)); /
    background: -webkit-linear-gradient(#fff, #f9fdff);
      padding:20px;
      border-color:rgba(4, 129, 177, 0.4);
    }
    input,
    textarea {
      color: #373737;
      background: #fff;
      border: 1px solid #CCCCCC;
      color: #aaa;
      font-size: 14px;
      line-height: 1.2em;
      margin-bottom:15px;

      -moz-border-radius:4px;
      -webkit-border-radius:4px;
      border-radius:4px;
      box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1) inset, 0 1px 0 rgba(255, 255, 255, 0.2);
    }
    input[type="text"],
    input[type="password"]{
      padding: 8px 6px;
      height: 22px;
      width:280px;
    }
    input[type="text"]:focus,
    input[type="password"]:focus {
      background:#f5fcfe;
      text-indent: 0;
      z-index: 1;
      color: #373737;
      -webkit-transition-duration: 400ms;
      -webkit-transition-property: width, background;
      -webkit-transition-timing-function: ease;
      -moz-transition-duration: 400ms;
      -moz-transition-property: width, background;
      -moz-transition-timing-function: ease;
      -o-transition-duration: 400ms;
      -o-transition-property: width, background;
      -o-transition-timing-function: ease;
      width: 380px;

      border-color:#ccc;
      box-shadow:0 0 5px rgba(4, 129, 177, 0.5);
      opacity:0.6;
    }
    input[type="submit"]{
      background: #222;
      border: none;
      text-shadow: 0 -1px 0 rgba(0,0,0,0.3);
      text-transform:uppercase;
      color: #eee;
      cursor: pointer;
      font-size: 15px;
      margin: 5px 0;
      padding: 5px 22px;
      -moz-border-radius: 4px;
      border-radius: 4px;
      -webkit-border-radius:4px;
      -webkit-box-shadow: 0px 1px 2px rgba(0,0,0,0.3);
      -moz-box-shadow: 0px 1px 2px rgba(0,0,0,0.3);
      box-shadow: 0px 1px 2px rgba(0,0,0,0.3);
    }
    textarea {
      padding:3px;
      width:96%;
      height:100px;
    }
    textarea:focus {
      background:#ebf8fd;
      text-indent: 0;
      z-index: 1;
      color: #373737;
      opacity:0.6;
      box-shadow:0 0 5px rgba(4, 129, 177, 0.5);
      border-color:#ccc;
    }
    .small {
      line-height:14px;
      font-size:12px;
      color:#999898;
      margin-bottom:3px;
    }
  </style>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Bootstrap Admin Theme</title>

  <!-- Bootstrap Core CSS -->
  <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- MetisMenu CSS -->
  <link href="bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

  <!-- Timeline CSS -->
  <link href="dist/css/timeline.css" rel="stylesheet">

  <!-- Custom CSS -->
  <link href="dist/css/sb-admin-2.css" rel="stylesheet">

  <!-- Morris Charts CSS -->
  <link href="bower_components/morrisjs/morris.css" rel="stylesheet">

  <!-- Custom Fonts -->
  <link href="bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <meta charset="utf-8" />
  <title>Remove Band - Formoid php form</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<html>
<body>
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="admin.jsp">SB Admin v2.0</a>
  </div>
  <!-- /.navbar-header -->

  <ul class="nav navbar-top-links navbar-right">
    <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">
        <i class="fa fa-envelope fa-fw"></i>  <i class="fa fa-caret-down"></i>
      </a>
      <ul class="dropdown-menu dropdown-messages">
        <li>
          <a href="#">
            <div>
              <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
            </div>
            <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
          </a>
        </li>
        <li class="divider"></li>
        <li>
          <a href="#">
            <div>
              <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
            </div>
            <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
          </a>
        </li>
        <li class="divider"></li>
        <li>
          <a href="#">
            <div>
              <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
            </div>
            <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
          </a>
        </li>
        <li class="divider"></li>
        <li>
          <a class="text-center" href="#">
            <strong>Read All Messages</strong>
            <i class="fa fa-angle-right"></i>
          </a>
        </li>
      </ul>
      <!-- /.dropdown-messages -->
    </li>
    <!-- /.dropdown -->
    <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">
        <i class="fa fa-tasks fa-fw"></i>  <i class="fa fa-caret-down"></i>
      </a>
      <ul class="dropdown-menu dropdown-tasks">
        <li>
          <a href="#">
            <div>
              <p>
                <strong>Task 1</strong>
                <span class="pull-right text-muted">40% Complete</span>
              </p>
              <div class="progress progress-striped active">
                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                  <span class="sr-only">40% Complete (success)</span>
                </div>
              </div>
            </div>
          </a>
        </li>
        <li class="divider"></li>
        <li>
          <a href="#">
            <div>
              <p>
                <strong>Task 2</strong>
                <span class="pull-right text-muted">20% Complete</span>
              </p>
              <div class="progress progress-striped active">
                <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                  <span class="sr-only">20% Complete</span>
                </div>
              </div>
            </div>
          </a>
        </li>
        <li class="divider"></li>
        <li>
          <a href="#">
            <div>
              <p>
                <strong>Task 3</strong>
                <span class="pull-right text-muted">60% Complete</span>
              </p>
              <div class="progress progress-striped active">
                <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                  <span class="sr-only">60% Complete (warning)</span>
                </div>
              </div>
            </div>
          </a>
        </li>
        <li class="divider"></li>
        <li>
          <a href="#">
            <div>
              <p>
                <strong>Task 4</strong>
                <span class="pull-right text-muted">80% Complete</span>
              </p>
              <div class="progress progress-striped active">
                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                  <span class="sr-only">80% Complete (danger)</span>
                </div>
              </div>
            </div>
          </a>
        </li>
        <li class="divider"></li>
        <li>
          <a class="text-center" href="#">
            <strong>See All Tasks</strong>
            <i class="fa fa-angle-right"></i>
          </a>
        </li>
      </ul>
      <!-- /.dropdown-tasks -->
    </li>
    <!-- /.dropdown -->
    <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">
        <i class="fa fa-bell fa-fw"></i>  <i class="fa fa-caret-down"></i>
      </a>
      <ul class="dropdown-menu dropdown-alerts">
        <li>
          <a href="#">
            <div>
              <i class="fa fa-comment fa-fw"></i> New Comment
              <span class="pull-right text-muted small">4 minutes ago</span>
            </div>
          </a>
        </li>

        <li class="divider"></li>
        <li>
          <a href="#">
            <div>
              <i class="fa fa-twitter fa-fw"></i> New User:
              <span class="pull-right text-muted small"><%=session.getAttribute("userid")%></span>
            </div>
          </a>
        </li>
        <li class="divider"></li>
        <li>
          <a href="#">
            <div>
              <i class="fa fa-envelope fa-fw"></i> Message Sent
              <span class="pull-right text-muted small">4 minutes ago</span>
            </div>
          </a>
        </li>
        <li class="divider"></li>
        <li>
          <a href="#">
            <div>
              <i class="fa fa-tasks fa-fw"></i> New Task
              <span class="pull-right text-muted small">4 minutes ago</span>
            </div>
          </a>
        </li>
        <li class="divider"></li>
        <li>
          <a href="#">
            <div>
              <i class="fa fa-upload fa-fw"></i> Server Rebooted
              <span class="pull-right text-muted small">4 minutes ago</span>
            </div>
          </a>
        </li>
        <li class="divider"></li>
        <li>
          <a class="text-center" href="#">
            <strong>See All Alerts</strong>
            <i class="fa fa-angle-right"></i>
          </a>
        </li>
      </ul>
      <!-- /.dropdown-alerts -->
    </li>
    <!-- /.dropdown -->
    <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">
        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
      </a>
      <ul class="dropdown-menu dropdown-user">
        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
        </li>
        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
        </li>
        <li class="divider"></li>
        <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
        </li>
      </ul>
      <!-- /.dropdown-user -->
    </li>
    <!-- /.dropdown -->
  </ul>
  <!-- /.navbar-top-links -->

  <div class="navbar-default sidebar" role="navigation">
    <div class="sidebar-nav navbar-collapse">
      <ul class="nav" id="side-menu">
        <li class="sidebar-search">
          <div class="input-group custom-search-form">
            <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                  <i class="fa fa-search"></i>
                                </button>
                            </span>
          </div>
          <!-- /input-group -->
        </li>
        <li>
          <a href="admin.jsp"><i class="fa fa-dashboard fa-fw"></i> Admin Panel</a>
        </li>
        <li><a href="insert.jsp"><i class="fa fa-flag fa-fw"></i> Insert Product</a></li>
        <li><a href="removeband.jsp"><i class="fa fa-flag fa-fw"></i>Update&Remove Product</a></li>
        <li><a href="insertband.jsp"><i class="fa fa-flag fa-fw"></i> Insert Brand</a></li>
        <li><a href="deleteband.jsp"><i class="fa fa-flag fa-fw"></i> Delete Brand</a></li>
        <li>
          <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Checkout<span class="fa arrow"></span></a>
          <ul class="nav nav-second-level">
            <li>
              <a href="AdminCart.jsp">List Receipt</a>
            </li>
            <li>
              <a href="listorder.jsp">List Order</a>
            </li>
          </ul>
          <!-- /.nav-second-level -->
        </li>
      </ul>
    </div>
    <!-- /.sidebar-collapse -->
  </div>
  <!-- /.navbar-static-side -->
</nav>

<p style="text-align: center;font-size: 50px">-----Insert Item----</p>
<div id="wrapper">
  <form action="FileUploadDBServlet" method="post" enctype="multipart/form-data">

    <fieldset>
      <legend>Insert Form</legend>
      <div>
        <input type="text" name="name" placeholder="Name"/>
      </div>
      <div>
        <input type="text" name="price" placeholder="Price:"/>
      </div>
      <div>
        <input type="text" name="cat" placeholder="Category:"/>
      </div>
      <div>
        <input type="text" name="brand" placeholder="Brand"/>
      </div>
      <div>
        <input type="text" name="describe" placeholder="Describe:" size="30">
      </div>
      <div>
        <input  name="picture" type="file"  >

      </div>
      <%
        if(session.getAttribute("insert")!=null)
        {
      %>
      <div>
        <p style="font-size: 30px">Congratulation,Your process is completed</p>

      </div>
      <%
        }
      %>
      <input type="submit" name="submit" value="Send"/>
    </fieldset>
  </form>
</div>
</body>
</html>