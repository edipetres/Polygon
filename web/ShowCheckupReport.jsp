<%-- 
    Document   : ShowCheckupReports
    Created on : Apr 4, 2016, 9:32:04 AM
    Author     : Minerva
--%>

<%@page import="Domain.CheckupReport"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	CheckupReport report = (CheckupReport) request.getAttribute("report");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Healthy Buildings</title>
        <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link href="css/styles.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
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
        <div class="col-sm-12 report">
        <h1>Report details</h1>
        Customer: <%= report.getCustomer().getCompany_name()%><br>
        Contact person: <%= report.getCustomer().getFname()%> <%= report.getCustomer().getLname()%><br>
        Building: <%= report.getBuilding().getStreet()%> <%= report.getBuilding().getZip()%><br>
        Size: <%= report.getBuilding().getSize()%>m2<br>
        Condition:   <%= report.getCondition_level()%><br>
        Comments   <%= report.getComments()%>
        </div>
        </div>
    </body>
</html>
