<%-- 
    Document   : MyAccount
    Created on : 11-Apr-2016, 13:41:26
    Author     : edipetres
--%>

<%@page import="Domain.UserPrefs"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/styles.css" rel="stylesheet">
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

        <%-- Java scrips for bootstrap here --%>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <title>My Account</title>
    </head>
    <body>
        <br><br><br>
        ${errorMessage}
        <%
            UserPrefs userPrefs = (UserPrefs) session.getAttribute("UserPrefs");
            out.print("User access level: " + userPrefs.getAccessLevel());

            if (userPrefs == null) {
                String site = new String("Login.jsp");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", site);
            }
        %>
        //User prefs with EL


        <div class="navbar navbar-fixed-top navbar-default">
            <div class="container">
                <div class="navbar-header"><a class="navbar-brand" href="index.jsp">HealthyBuildings</a><a class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="glyphicon glyphicon-bar"></span>
                        <span class="glyphicon glyphicon-bar"></span>
                        <span class="glyphicon glyphicon-bar"></span>
                    </a>
                </div>
                <div class="navbar-collapse">
                    <ul class="nav navbar-nav">

                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-home"></span> Buildings <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="Buildings.jsp"><span class="glyphicon glyphicon-th-list"></span>  All buildings</a></li>
                                <li><a href="AddBuilding.jsp"><span class="glyphicon glyphicon-plus"></span> Add new building</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user"></span> Customers <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="UserServlet?command=showCustomers"><span class="glyphicon glyphicon-th-list"></span>  All customers</a></li>
                                <li><a href="AddCustomer.jsp"><span class="glyphicon glyphicon-plus"></span> Add new customer</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                            </ul>
                        </li>
                        <li class="nav-divider"></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-wrench"></span> Services<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="ShowServiceRequests.jsp"><span class="glyphicon glyphicon-th-list"></span> Service Requests</a></li>
                                <li><a href="ServiceRequest.jsp"><span class="glyphicon glyphicon-plus"></span> Request new Service</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="UserServlet?command=showCheckupReports"><span class="glyphicon glyphicon-th-list"></span> CheckUp Reports</a></li>
                            </ul>
                        </li>
                        <li> <a href="#">Logged in as: <b>
                                    <%
                                        if (userPrefs != null) {
                                            String username = userPrefs.getUsername();
                                            out.print(username);
                                        }
                                    %>
                                </b></a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Welcome, <%=userPrefs.getFname()%></h3>
            </div>
            <div class="panel-body">
                <div class="table">
                    
                </div>
            </div>
        </div>
    </body>
</html>
