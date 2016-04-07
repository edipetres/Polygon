<%-- 
    Document   : Reports
    Created on : Mar 31, 2016, 11:54:47 AM
    Author     : Minerva
--%>

<%@page import="Domain.CheckupReport"%>
<%@page import="java.util.List"%>
<%@page import="Presentation.UserServlet"%>
<%@ taglib prefix="mytags" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    List<CheckupReport> requestList = (List<CheckupReport>) request.getAttribute("reports");
    List<CheckupReport> reports = (List<CheckupReport>) request.getAttribute("reports");
    List<CheckupReport> donereports = (List<CheckupReport>) request.getAttribute("donereports");

    //request.setAttribute("requestList", requestList);
    if (requestList == null || requestList.isEmpty()) {
        request.setAttribute("errorMessage", "requestList obj empty.");
    } 
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkup Reports</title>
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/styles.css" rel="stylesheet">
        <%-- Java scrips for bootstrap here --%>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <mytags:navbar/>
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">CheckUp requests</h3>
                        </div>
                        <table class="table table-bordered" cellspacing="0" width="100%">
                            <thread>
                                <tr>
                                    <th>Report ID</th> 
                                    <th>Customer</th> 
                                    <th>Employee</th>
                                    <th>Address</th>
                                    <th>Perform CheckUp</th>
                                </tr>
                            </thread>
                            <c:forEach var="request" items="${reports}">
                                <tr>
                                    <td><c:out value="${request.getCreport_id()}"/></td>
                                    <td><c:out value="${request.getCustomer().getCompany_name()}"/></td>
                                    <td><c:out value="${request.getEmployee().getFname()}"/> <c:out value="${request.getEmployee().getLname()}"/></td>
                                    <td><c:out value="${request.getBuilding().getStreet()}"/> <br> <c:out value="${request.getBuilding().getZip()}"/></td>
                                    <td><a href="UserServlet?command=selectReport&reportid=${request.getCreport_id()}">Fill out report</a></td>
                                </tr>

                            </c:forEach>
                        </table>
                    </div>
                </div>
                
                <%-- 
                Building address: <%= report.getBuilding().getStreet()%>, <%= report.getBuilding().getZip()%><br>
            Size: <%= report.getBuilding().getSize()%>m2
                --%>
                <div class="col-sm-6">
                    <h1>Undone checkup reports</h1>
                    <%
                        for (int i = 0; i < reports.size(); i++) {

                    %>
                    <%= reports.get(i).getCreport_id()%>
                    <b>Customer: </b>
                    <%= reports.get(i).getCustomer().getCompany_name()%>
                    <b>Worker: </b>
                    <%= reports.get(i).getEmployee().getFname()%>
                    <%= reports.get(i).getEmployee().getLname()%> 

                    <a href="UserServlet?command=selectReport&reportid=<%= reports.get(i).getCreport_id()%>">Fill out report</a>

                    <br>
                    <%} //end of for loop%>

                    <h1>Finished checkup reports</h1>
                    <%
                        for (int i = 0; i < donereports.size(); i++) {

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
            </div>
        </div>
        ${errorMessage}
    </body>
</html>
