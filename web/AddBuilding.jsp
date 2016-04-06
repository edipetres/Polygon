<%-- 
    Document   : AddBuilding
    Created on : 29-Mar-2016, 19:15:35
    Author     : edipetres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/styles.css" rel="stylesheet">
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

        <title>Add New Building</title>
    </head>
    <body>
       <div class="navbar navbar-fixed-top navbar-default">
            <div class="container">
                <div class="navbar-header"><a class="navbar-brand" href="#">Healthy Buildings</a><a class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="glyphicon glyphicon-bar"></span>
                        <span class="glyphicon glyphicon-bar"></span>
                        <span class="glyphicon glyphicon-bar"></span>
                    </a>
                </div>
                <div class="navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="Buildings.jsp">Buildings</a>
                        </li>
                        <li><a href="AddBuilding.jsp">Add Building</a>
                        </li>
                        <li><a href="AddCustomer.jsp">Add Customer</a></li>
                        <li><a href="UserServlet?command=showCustomers">Customers</a>
                        </li>
                        <li><a href="UserServlet?command=showCheckupReports">Checkup reports</a>
                        </li>
                    </ul>

                </div>
                <!--/.navbar-collapse -->
            </div>
        </div>
        <br><br><br>

        <div class="container">
            <div class="row">
                <div class="col-sm-7">
                    <h1>Add a new building:</h1>
                    <form class="form-horizontal" role="form" name="AddBuilding" action="UserServlet" method="POST">
                        <input type="hidden" name="command" value="addBuilding">

                        <div class="form-group">

                            <label for="b_name">Building name:</label>
                            <input type="text" class="form-control" name="b_name">

                        </div>

                        <div class="form-group">

                            <label for="street">Street and No.:</label>
                            <input type="text" class="form-control" name="street" required>

                        </div>
                        <div class="row">
                            <div class="form-group">
                                <div class="col-xs-6">
                                    <label for="zip">Zip:</label>
                                    <input type="text" class="form-control" name="zip" required>
                                </div>
                                <div class="col-xs-6">
                                    <label for="size">Size: (m2)</label>
                                    <input type="text" class="form-control" name="size">
                                </div>
                            </div>    
                            <div class="form-group">

                            </div>
                        </div>
                        <button type="submit" class="btn btn-default">Add Building</button>
                    </form>
                </div>
                <div class="col-sm-3">
                    <img class="pull-left" src="images/building.gif" width="400" height="300" alt="building"/>
                </div>
            </div>
        </div>
    </body>
</html>
