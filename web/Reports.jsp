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
	List<CheckupReport> donereports = (List<CheckupReport>) request.getAttribute("donereports");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkup Reports</title>
    </head>
    <body>
        <h1>Undone checkup reports</h1>
        <%

        
        for (int i =0; i < reports.size(); i ++ ){
            
        %>
        <%= reports.get(i).getCreport_id()%>
        <b>Customer: </b>
    <%= reports.get(i).getCustomer().getCompany_name()%>
    <b>Worker: </b>
    <%= reports.get(i).getEmployee().getFname()%>
    <%= reports.get(i).getEmployee().getLname()%> 
    
    <a href="UserServlet?command=selectReport&reportid=<%= reports.get(i).getCreport_id()%>">Go</a>

    <br>
 <%} //end of for loop%>
 
 <h1>Finished checkup reports</h1>
  <%
        for (int i =0; i < donereports.size(); i ++ ){
            
        %>
        <%= donereports.get(i).getCreport_id()%>
        <b>Customer: </b>
    <%= donereports.get(i).getCustomer().getCompany_name()%>
    <b>Worker: </b>
    <%= donereports.get(i).getEmployee().getFname()%>
    <%= donereports.get(i).getEmployee().getLname()%> 
    
    <a href="UserServlet?command=selectFinishedReport&reportid=<%= donereports.get(i).getCreport_id()%>">Show more</a>

    <br>
 <%} //end of for loop%>
    </body>
</html>
