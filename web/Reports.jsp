<%-- 
    Document   : Reports
    Created on : Mar 31, 2016, 11:54:47 AM
    Author     : Minerva
--%>

<%@page import="Domain.CheckupReport"%>
<%@page import="java.util.List"%>
<%@page import="Presentation.UserServlet"%>
<%@ taglib prefix="mytags" tagdir="/WEB-INF/tags" %>
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
        <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    </head>
    <body>
        
        <mytags:navbar/>
        <br><br><br>
        <div class="container">
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
 </div>
    </body>
</html>
