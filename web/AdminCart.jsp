<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.sql.*" %>
<%@ page import="controller.ClothesCart" %>
<%@ page import="java.util.*" %>
<%@ page import="com.mypackage.*" %>
<%@ page import="java.sql.Date" %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">
  <meta name="viewport" content="initial-scale=1.0; maximum-scale=1.0; width=device-width;">

  <title>SB Admin 2 - Bootstrap Admin Theme</title>

  <!-- Bootstrap Core CSS -->
  <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- MetisMenu CSS -->
  <link href="bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

  <!-- Custom CSS -->
  <link href="dist/css/sb-admin-2.css" rel="stylesheet">

  <!-- Custom Fonts -->
  <link href="bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link href="css/styles.css" rel='stylesheet' type='text/css' />

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
  <![endif]-->

  <script src="jquery.js"></script>
  <script>
    $(document).ready(function(){
      $("#idsp").change(function(){
        var idsp=$("#idsp").val();
        $.post("capnhap1.jsp?id="+idsp,
                {
                  id:idsp
                },
                function(data,status){
                  if(status=="success")
                  {
                    $("#iddiv").html(data);
                    $("#masp").change(function(){
                      var masp=$("#masp").val();
                      $.post("capnhap2.jsp?masp="+masp,
                              {
                                masp:masp
                              },
                              function(data,status){
                                if(status=="success")
                                {
                                  $("#iddiv1").html(data);
                                }

                              })
                    });
                  }
                });
      });
    });
  </script>

</head>


<body>

<div id="wrapper">

  <!-- Navigation -->
  <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.html">SB Admin v2.0</a>
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

  <!-- Page Content -->
  <div id="page-wrapper">
    <div class="container-fluid">
      <div class="row">
        <div class="col-lg-12">
          <%

            List<Recipe> list = new ArrayList<Recipe>();
            try {
              Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
              e.printStackTrace();
            }
            String database = "clothingshop";
            String connectionURL = "jdbc:mysql://localhost:3306/" + database;
            String dbUser = "root";
            String dbPassword = "";

            Connection connection;
            int status=0;
            try {
              connection = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
              Statement stmt = connection.createStatement();
              ResultSet rs = stmt.executeQuery("select * from recipe ");
              while (rs.next()) {
                int id = rs.getInt("id");
                String user = rs.getString("user");
                String name = rs.getString("name");
                int price = rs.getInt("price");
                status = rs.getInt("status");
                Date date=rs.getDate("date");
                Date datestatus=rs.getDate("datestatus");
                String telephone=rs.getString("telephone");
                String address =rs.getString("address");
                Recipe cat = new Recipe(id, user, name, price, status,date,datestatus,telephone,address);
                list.add(cat);
              }
              session.setAttribute("receipt",list);
              session.setAttribute("status",status);
              if (connection != null) {
                connection.close();
                connection = null;
              }
            } catch (SQLException sqle) {
              System.out.println("SQL Exception thrown: " + sqle);
            }
          %>
          <form action="admincart2.jsp" method="post">
            <div class="table-title">
              <h3>List Receipt</h3>
            </div>
            <table class="table-fill">
              <thead>

              <tr>
                <th><b>ID </b></th>
                <th><b>User </b></th>
                <th><b>Name </b></th>
                <th><b>Price </b></th>
                <td><b>Telephone</b></td>
                <td><b>Address</b></td>
                <th>Status</th>
                <th>Date Order</th>
                <th>Date Paid</th>
              </tr>
              </thead>

              <tbody class="table-hover">
              <tr>

                <c:forEach items="${receipt}" var="c">
                <td class="text-left">${c.id}</td>
                <td class="text-left">${c.user}</td>
                <td class="text-left">${c.name}</td>
                <td class="text-left">${c.price}</td>
                  <td class="text-left">${c.telephone}</td>
                  <td class="text-left">${c.address}</td>
                <td class="text-left">${c.date}</td>



                  <c:choose>
                  <c:when test="${c.status==0}">
                    <td class="text-left"><select name="status${c.id}">
                      <option value="${c.status}">not yet delivered</option>
                      <option value="1">Done</option>
                    </select> </td>
                  </c:when>
                  <c:otherwise>
                    <td class="text-left"><select name="status${c.id}">
                      <option value="${c.status}">Done</option>
                      <option value="0">not yet delivered</option>
                    </select>
                    </td>
                    <td class="text-left">${c.datestatus}</td>

                  </c:otherwise>
                </c:choose>
              </tr>
              <input type="hidden" name="namestatus${c.id}" value="${c.id}">
              </c:forEach>

              <tr>
                <td><input type="submit" name="submit" value="Update"/></td>
              </tr>
              </tbody>
            </table>
          </form>
        </div>


      </div>
            <!-- /.col-lg-12 -->
          </div>
          <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
      </div>
      <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
  </div>
  <!-- jQuery -->
  <script src="bower_components/jquery/dist/jquery.min.js"></script>

  <!-- Bootstrap Core JavaScript -->
  <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

  <!-- Metis Menu Plugin JavaScript -->
  <script src="bower_components/metisMenu/dist/metisMenu.min.js"></script>
  <!-- Custom Theme JavaScript -->
  <script src="dist/js/sb-admin-2.js"></script>
</div>
</body>

</html>
