<%-- 
    Document   : Buildings
    Created on : Apr 4, 2016, 10:53:09 AM
    Author     : Minerva
--%>

<%@page import="Domain.UserPrefs"%>
<%@page import="java.util.List"%>
<%@page import="Domain.Building"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Domain.DomainFacade"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="mytags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>All Buildings</title>

        <!-- Bootstrap Core CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <!-- Custom css -->
        <link href="css/styles.css" rel="stylesheet">
        
    </head>
    <body>
        <%
            DomainFacade domainModel = DomainFacade.getInstance();
            List<Building> buildings = domainModel.showBuildings();
            request.setAttribute("buildings", buildings);
            if (buildings.isEmpty()) {
                request.setAttribute("message", "No buildings to show.");
            }
            UserPrefs userPrefs = (UserPrefs) session.getAttribute("UserPrefs");
            if (userPrefs != null) {
                request.setAttribute("username", userPrefs.getUsername());
                request.setAttribute("accessLevel", userPrefs.getAccessLevel());
            }
        %>
        <c:if test="${username == null}">
            <jsp:forward page="Login.jsp?login=true" />
        </c:if>
        <c:if test="${accessLevel == 3}">
            <jsp:forward page="index.jsp" />
        </c:if>
        <mytags:navbar/>
        <div class="container">
            <h1>Buildings</h1>

            <div class="col-sm-12">
                <div class="panel panel-group">
                    <c:choose>
                        <c:when test="${result == 'true'}">
                            <div class="alert alert-success fade in">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>Success!</strong> Building was added.
                            </div>
                        </c:when>
                        <c:when test="${result == 'false'}">
                            <div class="alert alert-warning fade in">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>Failure!</strong> Building was not added.
                            </div>
                        </c:when>
                        <c:otherwise>

                        </c:otherwise>
                    </c:choose>

                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th><span class="glyphicon glyphicon-home"></span> Name</th>
                                <th>Street</th>
                                <th>Zip</th>
                                <th>Parcel No.</th>
                                <th>Size (m2)</th>
                                <th>Condition</th>
                                <th>Building use</th>
                                <th>Year</th>
                                <th>CheckUp</th>
                                <th>Edit</th>
                            </tr>
                        </thead>
                        <c:forEach var="building" items="${buildings}" >
                            <tr>
                                <td><c:out value="${building.getBuildingID()}"/></td>
                                <td><c:out value="${building.getName()}"/></td>
                                <td><c:out value="${building.getStreet()}"/></td>
                                <td><c:out value="${building.getZip()}"/></td>
                                <td><c:out value="${building.getParcel_no()}"/></td> 
                                <td><c:out value="${building.getSize()}"/></td>
                                <td><c:out value="${building.getCondition()}"/></td>
                                <td>n/a</td>
                                <td>n/a</td>
                                <td><a class="btn btn-default btn-xs" href="UserServlet?command=requestCheckup&building_id=${building.getBuildingID()}">Request CheckUp</a></td>
                                <td><a class="btn btn-default btn-xs" href="UserServlet?command=editBuilding&building_id=${building.getBuildingID()}">Edit</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
            ${message}
            ${SaveSuccessMessage}
        </div>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
