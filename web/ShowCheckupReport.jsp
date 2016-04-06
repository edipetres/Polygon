<%-- 
    Document   : ShowCheckupReports
    Created on : Apr 4, 2016, 9:32:04 AM
    Author     : Minerva
--%>

<%@page import="Domain.CheckupReport"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="mytags" tagdir="/WEB-INF/tags" %>
<%
    CheckupReport report = (CheckupReport) request.getAttribute("report");
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
        <mytags:navbar/>
        <div class="container">
            <div class="col-sm-12 report">
                <h1>Report details</h1>
                Customer: <%= report.getCustomer().getCompany_name()%><br>
                Contact person: <%= report.getCustomer().getFname()%> <%= report.getCustomer().getLname()%><br>
                Building: <%= report.getBuilding().getStreet()%> <%= report.getBuilding().getZip()%><br>
                Size: <%= report.getBuilding().getSize()%>m2<br>
                Condition:   <%= report.getCondition_level()%><br>
                Comments   <%= report.getComments()%>
            </div>
        </div>
    </body>
</html>
