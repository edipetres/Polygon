<%-- 
    Document   : AddBuilding
    Created on : 29-Mar-2016, 19:15:35
    Author     : edipetres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="mytags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/styles.css" rel="stylesheet">
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        
        <%-- Java scrips for bootstrap here --%>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <title>Add New Building</title>
    </head>
    <body>
       
        <mytags:navbar/>
        <div class="container">
            <div class="row">
                <div class="col-sm-7">
                    <h1>Add a new building:</h1>
                    <form class="form-horizontal" role="form" name="AddBuilding" action="UserServlet" method="POST">
                        <input type="hidden" name="command" value="addBuilding">
                        <div class="form-group">
                            <label for="b_name">Building name:</label>
                            <input type="text" class="form-control" name="b_name">
                        </div>
                        <div class="form-group">

                            <label for="street">Street and No.:</label>
                            <input type="text" class="form-control" name="street" required>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <div class="col-xs-6">
                                    <label for="zip">Zip:</label>
                                    <input type="text" class="form-control" name="zip" required>
                                </div>
                                <div class="col-xs-6">
                                    <label for="size">Size: (m2)</label>
                                    <input type="text" class="form-control" name="size">
                                </div>
                            </div>    
                            <div class="form-group">
                            </div>
                        </div>
                        <button type="submit" class="btn btn-default">Add Building</button>
                    </form>
                </div>
                <div class="col-sm-3">
                    <img class="pull-left" src="images/building.gif" width="400" height="300" alt="building"/>
                </div>
            </div>
        </div>
    </body>
</html>
