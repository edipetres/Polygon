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
                                    <td><c:out value="${request.getBuilding().getStreet()}"/> <br> <c:out value="${request.getBuilding().getZip()}"/> <c:out value="${request.getBuilding().getCity()}"/></td>
                                    <td><a href="UserServlet?command=selectReport&reportid=${request.getCreport_id()}">Fill out report</a></td>
                                </tr>

                            </c:forEach>
                        </table>
                    </div>
                </div>
                
                <div class="col-sm-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Finished reports</h3>
                        </div>
                        <table class="table table-bordered" cellspacing="0" width="100%">
                            <thread>
                                <tr>
                                    <th>Report ID</th> 
                                    <th>Customer</th> 
                                    <th>Employee</th>
                                    <th>Address</th>
                                    <th> </th>
                                </tr>
                            </thread>
                            <c:forEach var="finished" items="${donereports}">
                                <tr>
                                    <td><c:out value="${finished.getCreport_id()}"/></td>
                                    <td><c:out value="${finished.getCustomer().getCompany_name()}"/></td>
                                    <td><c:out value="${finished.getEmployee().getFname()}"/> <c:out value="${finished.getEmployee().getLname()}"/></td>
                                    <td><c:out value="${finished.getBuilding().getStreet()}"/> <br> <c:out value="${finished.getBuilding().getZip()}"/> <c:out value="${finished.getBuilding().getCity()}"/></td>
                                    <td>                    <a href="UserServlet?command=selectFinishedReport&reportid=${finished.getCreport_id()}">Show more</a></td>
                                </tr>

                            </c:forEach>
                        </table>
                    </div>
                </div>

                </div>
            </div>
        </div>
        ${errorMessage}
    </body>
</html>
