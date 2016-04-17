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
        <!-- Custom css -->
        <link href="css/styles.css" rel="stylesheet">
        
    </head>
    <body>
        <mytags:navbar/>
        <div class="container">
            <h1>Buildings</h1>
            <div class="col-sm-4">
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
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
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