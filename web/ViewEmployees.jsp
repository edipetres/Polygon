<%-- 
    Document   : ViewEmployees
    Created on : Apr 19, 2016, 12:06:34 PM
    Author     : Minerva
--%>

<%@page import="Domain.Employee"%>
<%@page import="java.util.List"%>
<%@page import="Domain.DomainFacade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="mytags" tagdir="/WEB-INF/tags" %>
<%
    DomainFacade domainModel = DomainFacade.getInstance();

    List<Employee> employees = domainModel.showEmployees();
    request.setAttribute("employees", employees);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!--Custom css-->
        <link href="css/styles.css" rel="stylesheet">
        
        <title>Employees</title>
    </head>
    <body>
        <mytags:navbar/>
        
        
    <c:forEach var="employee" items="${employees}">
         
</c:forEach>
        <div class="container">
        <h1>Employees</h1>
                <div class="panel">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Username</th>
                                <th>Email</th>
                                <th>Phone number</th>
                                
                            </tr>
                        </thead>
    <c:forEach var="employee" items="${employees}">
                            <tr>
                                <td><c:out value="${employee.getEmployee_id()}"/></td>
                                <td><c:out value="${employee.getFname()}"/> <c:out value="${employee.getLname()}"/></td>
                                <td><c:out value="${employee.getUsername()}"/></td>
                                <td><c:out value="${employee.getEmail()}"/></td> 
                                <td><c:out value="${employee.getPhone_no()}"/></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                </div>
</body>
</html>
