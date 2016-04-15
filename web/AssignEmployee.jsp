<%-- 
    Document   : AssignEmployee
    Created on : Apr 15, 2016, 2:09:54 PM
    Author     : Minerva
--%>

<%@page import="Domain.CheckupReport"%>
<%@page import="java.util.List"%>
<%@page import="Domain.DomainFacade"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DomainFacade domainModel = DomainFacade.getInstance();
    List<CheckupReport> reports = domainModel.showPendingCheckupReports();
    request.setAttribute("reports", reports);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <c:forEach var="request" items="${reports}">

            <c:out value="${request.getCreport_id()}"/>


    </c:forEach>
</body>
</html>
