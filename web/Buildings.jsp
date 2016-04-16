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
<%
    DomainFacade domainModel = DomainFacade.getInstance();
    List<Building> buildings = domainModel.showBuildings();
    request.setAttribute("buildings", buildings);
    if (buildings.isEmpty()) {
        request.setAttribute("message", "No buildings to show.");
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
        <%-- Java scrips for bootstrap here --%>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
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
            <h1>Buildings</h1>

            <div class="col-sm-4">
                <c:choose>
                    <c:when test="${result}">
                        <div class="alert alert-success fade in">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>Success!</strong> Building was added.
                        </div>
                    </c:when>
                    <c:when test="${result}">
                        <div class="alert alert-warning fade in">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>Failure!</strong> Building was not added.
                        </div>
                    </c:when>
                    <c:otherwise>

                    </c:otherwise>
                </c:choose>
                <c:forEach var="building" items="${buildings}" >
                    <div class="panel panel-info">
                        <div class="panel-heading"><b>Name: <c:out value="${building.getName()}"/></b> (ID: <c:out value="${building.getBuildingID()}"/>)</div>
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td><span class="glyphicon glyphicon-user"></span> Customer ID: </td> 
                                    <td><c:out value="${building.getCustomerID()}"/> </td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-home"></span> Address:</td> 
                                    <td><c:out value="${building.getStreet()}"/>, <c:out value="${building.getZip()}"/></td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-signal"></span> Condition:</td> 
                                    <td><c:out value="${building.getCondition()}"/> </td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-resize-full"></span> Size:</td>
                                    <td><c:out value="${building.getSize()}"/> m2</td>
                                </tr>
                            </table>
                            <a class="btn btn-primary" href="UserServlet?command=requestCheckup&building_id=${building.getBuildingID()}">Request CheckUp</a>
                            <a class="btn btn-primary" href="UserServlet?command=editBuilding&building_id=${building.getBuildingID()}">Edit</a>

                        </div>
                    </div><!-- single customer info end-->

                </c:forEach> 
            </div>
            ${message}
            ${SaveSuccessMessage}
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