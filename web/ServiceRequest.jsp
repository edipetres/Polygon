<%-- 
    Document   : DamageReport
    Created on : 31-Mar-2016, 10:10:39
    Author     : edipetres
--%>

<%@page import="Domain.ServiceList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Domain.DomainFacade"%>
<%@page import="DataSource.DBFacade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/styles.css" rel="stylesheet">
        <title>Service Request</title>
    </head>
    <body>
        <%
            DomainFacade domainModel = DomainFacade.getInstance();
            ArrayList<ServiceList> serviceList = domainModel.getAllServices();
            request.setAttribute("serviceList", serviceList);
        %>
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
        <br><br><br>
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <form class="form-horizontal" role="form" action="UserServlet" method="post">
                        <fieldset>

                            <!-- Form Name -->
                            <legend>Request a service</legend>
                            <input type="hidden" name="command" value="serviceRequest">
                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Choose a service</label>
                                <div class="col-md-4">
                                    <select id="selectbasic" name="selectService" class="form-control">
                                        <c:forEach var="service" items="${serviceList}">
                                            <option value="${service.getService_id()}">${service.getService_name()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>


                            <!-- Textarea -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="description">Description</label>
                                <div class="col-md-6">                     
                                    <textarea class="form-control" id="description" name="description">Describe your specific needs for the service request</textarea> 
                                </div>
                            </div>
                            <!-- Button -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="submit"></label>
                                <div class="col-md-4">
                                    <button type="submit" id="submit" name="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>
                <div class="col-sm-4">
                    ${message}
                </div>
            </div>
        </div>
    </body>
</html>
