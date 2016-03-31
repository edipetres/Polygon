<%-- 
    Document   : Reports
    Created on : Mar 31, 2016, 11:54:47 AM
    Author     : Minerva
--%>

<%@page import="Domain.CheckupReport"%>
<%@page import="java.util.List"%>
<%@page import="Presentation.UserServlet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	List<CheckupReport> reports = (List<CheckupReport>) request.getAttribute("reports");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Undone checkup reports</h1>
        <%

        
        for (int i =0; i < reports.size(); i ++ ){
            
        %>
        <b>Customer: </b>
    <%= reports.get(i).getCustomer().getCompany_name()%>
    <b>Worker: </b>
    <%= reports.get(i).getEmployee().getFname()%>
    <%= reports.get(i).getEmployee().getLname()%> 
    
    <a href="FillCheckupReport.jsp">Go</a>

    <br>
 <%} //end of for loop%>
    </body>
</html>
