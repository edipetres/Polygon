<%-- 
    Document   : ShowCheckupReports
    Created on : Apr 4, 2016, 9:32:04 AM
    Author     : Minerva
--%>

<%@page import="Domain.CheckupReport"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	CheckupReport report = (CheckupReport) request.getAttribute("report");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
          Customer: <%= report.getCustomer().getFname()%> <%= report.getCustomer().getLname()%>
  Building: <%= report.getBuilding().getStreet()%> <%= report.getBuilding().getZip()%>
  <%= report.getBuilding().getSize()%>m2
  Condition:   <%= report.getCondition_level()%>
  Comments   <%= report.getComments()%>
    </body>
</html>
