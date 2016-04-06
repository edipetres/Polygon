<%-- 
    Document   : Buildings
    Created on : Apr 4, 2016, 10:53:09 AM
    Author     : Minerva
--%>

<%@page import="java.util.List"%>
<%@page import="Domain.Building"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Domain.DomainFacade"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DomainFacade domainModel = DomainFacade.getInstance();
    List<Building> buildings = domainModel.showBuildings();
    request.setAttribute("buildings", buildings);
    if (buildings.isEmpty()) {
            request.setAttribute("message","No buildings to show.");
        }
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

        <br><br><br>
        <div class="container">
            <h1>Buildings</h1>
            <div class="navbar navbar-fixed-top navbar-default">
                <div class="container">
                    <div class="navbar-header"><a class="navbar-brand" href="index.html">Healthy Buildings</a><a class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="glyphicon glyphicon-bar"></span>
                            <span class="glyphicon glyphicon-bar"></span>
                            <span class="glyphicon glyphicon-bar"></span>
                        </a>
                    </div>
                    <div class="navbar-collapse">
                        <ul class="nav navbar-nav">
                            <li><a href="Buildings.jsp">Buildings</a></li>
                            <li><a href="AddBuilding.jsp">Add Building</a></li>
                            <li><a href="UserServlet?command=showCustomers">Customers</a></li>
                            <li><a href="AddCustomer.jsp">Add Customer</a></li>
                            <li><a href="UserServlet?command=showCheckupReports">Checkup reports</a></li>
                            <li class="nav-divider"></li>
                            <li><a href="ShowServiceRequests.jsp">Service Requests</a></li>
                            <li><a href="ServiceRequest.jsp">Request new Service</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-sm-5">
                <c:forEach var="building" items="${buildings}" >
                    <div class="panel panel-info">
                        <div class="panel-heading">Building ID:<c:out value="${building.getBuildingID()}"/></div>
                        <div class="panel-body">
                            <b> Name: <c:out value="${building.getName()}"/> <c:out value="${building.getName()}"/></b> <br>
                            
                            <span class="glyphicon glyphicon-user"></span>Customer ID: <c:out value="${building.getCustomerID()}"/> <br>
                            <span class="glyphicon glyphicon-home"></span>Building id: <c:out value="${building.getName()}"/><br>
                            <span class="glyphicon glyphicon-envelope"></span>Condition <c:out value="${building.getCondition()}"/> <br>
                            <span class="glyphicon glyphicon-earphone"></span>Size: <c:out value="${building.getSize()}"/><br>
                            
                            <a href="UserServlet?command=requestCheckup&building_id=${building.getBuildingID()}">Request checkup</a>
                            <button type="button" class="btn btn-primary">View buildings</button>
                        </div>
                    </div><!-- single customer info end-->

                </c:forEach> 
            </div>
            ${message}
           
        </div>
    </body>
</html>
<%--
 <%
                for (int i = 0; i < buildings.size(); i++) {

            %>
            <%= buildings.get(i).getStreet()%>
            <%= buildings.get(i).getZip()%>

            <a href="UserServlet?command=requestCheckup&building_id=<%= buildings.get(i).getBuildingID()%>">Request checkup</a>
            <br>
--%>