<%-- 
    Document   : navbar
    Created on : Apr 6, 2016, 1:00:07 PM
    Author     : Minerva
--%>

<%@tag description="navigation bar" pageEncoding="UTF-8"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="message"%>

<%-- any content can be specified here e.g.: --%>
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
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Buildings <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="Buildings.jsp">All buildings</a></li>
                        <li><a href="AddBuilding.jsp">Add new building</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Customers <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="UserServlet?command=showCustomers">All customers</a></li>
                        <li><a href="AddCustomer.jsp">Add new customer</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                    </ul>
                </li>
                <li class="nav-divider"></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Services<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="ShowServiceRequests.jsp">Service Requests</a></li>
                        <li><a href="ServiceRequest.jsp">Request new Service</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="UserServlet?command=showCheckupReports">CheckUp Reports</a></li>
                    </ul>
                </li>
                
            </ul>
        </div>
    </div>
</div>
<br><br><br>

<%-- Navbar bottom
<div class="navbar navbar-default navbar-fixed-bottom">
    <div class="navbar-header"><a class="navbar-brand" href="#">Brand</a></div>
    <ul class="nav navbar-nav">
     <li class="active"><a href="#">Home</a></li>
     <li><a href="#">Link</a></li>
     <li><a href="#">More</a></li>
     <li><a href="#">Options</a></li>
      </ul>
</div>
--%>