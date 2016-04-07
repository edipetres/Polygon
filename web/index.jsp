<%-- 
    Document   : Index
    Created on : 07-Apr-2016, 00:17:11
    Author     : edipetres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="mytags" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

        <%-- Java scrips for bootstrap here --%>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <mytags:navbar/>

        <div class="container">
            <div class="center-block">
                <h3>Welcome, to HealthyBuildings</h3>
                <h4>by Poligon</h4>
                <img src="images/maison2.gif" width="500" height="400" alt="maison2"/>
            </div>
        </div>
    </body>
</html>