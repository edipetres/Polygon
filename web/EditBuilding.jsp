<%-- 
    Document   : EditBuilding
    Created on : 06-Apr-2016, 14:22:40
    Author     : edipetres
--%>

<%@page import="Domain.Building"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="mytags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/styles.css" rel="stylesheet">
                <%-- Java scrips for bootstrap here --%>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <mytags:navbar/>
        <%
        Building building = (Building) request.getAttribute("building");
        if (building == null) {
                out.println("Building object is NULL.");
            }
        %>
        
        <div class="container">
            
                <div class="col-sm-6">
                    
                    <h1>Editing building</h1>
                    <p>Building ID: ${building.getBuildingID()}</p>
                    <form class="form-horizontal" role="form" name="EditBuilding" action="UserServlet" method="POST">
                        <input type="hidden" name="command" value="saveBuildingEdits">
                        <input type="hidden" name="building_id" value="${building.getBuildingID()}">
                        <div class="form-group">
                            <label for="b_name">Building name:</label>
                            <input type="text" class="form-control" name="b_name" value="${building.getName()}">
                        </div>
                        <div class="form-group">
                            <label for="street">Street and No.:</label>
                            <input type="text" class="form-control" name="street" required value="${building.getStreet()}">
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <div class="col-xs-6">
                                    <label for="zip">Zip:</label>
                                    <input type="text" class="form-control" name="zip" required value="${building.getZip()}">
                                </div>
                                <div class="col-xs-6">
                                    <label for="size">Size: (m2)</label>
                                    <input type="text" class="form-control" name="size" value="${building.getSize()}">
                                </div>
                            </div>    
                            <div class="form-group">
                                <div class="col-xs-6">
                                    <label for="condition_level">Condition level:</label>
                                    <input type="text" class="form-control" name="condition_level" required value="${building.getCondition()}">
                                </div>
                                <div class="col-xs-6">
                                    <label for="parcel_no">Parcel number:</label>
                                    <input type="text" class="form-control" name="parcel_no" required value="${building.getParcel_no()}">
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-default">Save changes</button>
                    </form>
                    
                </div>
                <div class="col-sm-3">
                    <img class="pull-left" src="images/building.gif" width="400" height="300" alt="building"/>
                </div>
            
        </div>
    ${SaveSuccessMessage}
    </body>
</html>
