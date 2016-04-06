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