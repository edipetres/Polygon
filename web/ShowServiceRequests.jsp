<%-- 
    Document   : ShowServiceRequests
    Created on : 05-Apr-2016, 12:26:39
    Author     : edipetres
--%>

<%@page import="Domain.UserPrefs"%>
<%@page import="Domain.ServiceRequest"%>
<%@page import="java.util.List"%>
<%@page import="Domain.DomainFacade"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="mytags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link href="css/styles.css" rel="stylesheet">
        <title>Service Requests</title>
        <link rel="icon" href="images/polygon_icon.png">
        <%-- Java scrips for bootstrap here --%>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
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
        <%
            UserPrefs userPrefs = (UserPrefs) session.getAttribute("UserPrefs");
            if (userPrefs != null) {
                request.setAttribute("username", userPrefs.getUsername());
                request.setAttribute("accessLevel", userPrefs.getAccessLevel());
            }
        %>
        <c:if test="${username == null}">
            <jsp:forward page="Login.jsp?login=true" />
        </c:if>
        <mytags:navbar/>
        <div class="container">
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

                        </div>
                    </div><!-- single customer info end-->
                </c:forEach> 
            </div>
        </div>

    </body>
</html>
