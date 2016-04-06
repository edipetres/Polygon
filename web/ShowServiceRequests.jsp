<%-- 
    Document   : ShowServiceRequests
    Created on : 05-Apr-2016, 12:26:39
    Author     : edipetres
--%>

<%@page import="Domain.ServiceRequest"%>
<%@page import="java.util.List"%>
<%@page import="Domain.DomainFacade"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link href="css/styles.css" rel="stylesheet">
        <title>Service Requests</title>
    </head>
    <body>

        <%
            DomainFacade domainModel = DomainFacade.getInstance();
            List<ServiceRequest> serviceRequests = domainModel.showPendingServiceRequests();
            request.setAttribute("serviceRequests", serviceRequests);
            
            if (serviceRequests == null || serviceRequests.isEmpty()) {
                request.setAttribute("nothingToShowMessage", "No service requests to show");
            }
        %>
        <div class="container">
            <div class="row">
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
            </div>

            <div class="row">
                <div class="container">
                    <br><br><br>
                    <div class="row">
                        <h1>Pending Service Requests</h1>
                        ${takeServiceMessage}
                        ${nothingToShowMessage}
                        <div class="col-sm-5">
                            <c:forEach var="service" items="${serviceRequests}" >
                                <div class="panel panel-info">
                                    <div class="panel-heading"><c:out value="${service.getRequestDate()}"/></div>
                                    <div class="panel-body">
                                        <b> <c:out value="${service.getBuilding_id()}"/> <c:out value="${service.getReportStatus()}"/></b> <br>
                                        <span class="glyphicon glyphicon-envelope"></span> <c:out value="${service.getDescription()}"/> <br>
                                        <span class="glyphicon glyphicon-earphone"></span> <c:out value="${service.getReportStatus()}"/><br>
                                        <span class="glyphicon glyphicon-earphone"></span> id:<c:out value="${service.getSrequest_id()}"/><br>
                                        <a href="UserServlet?command=takeServiceRequest&srequest_id=${service.getSrequest_id()}">Take this job</a>
                                        <button type="button" class="btn btn-primary">View buildings</button>
                                    </div>
                                </div><!-- single customer info end-->

                            </c:forEach> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
