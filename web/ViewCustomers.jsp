<%-- 
    Document   : ViewCustomers
    Created on : Mar 30, 2016, 2:58:30 PM
    Author     : Minerva
--%>

<%@page import="Domain.UserPrefs"%>
<%@page import="java.util.List"%>
<%@page import="Domain.Customer"%>
<%@page import="Domain.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="mytags" tagdir="/WEB-INF/tags" %>
<%
    List<Customer> customers = (List<Customer>) request.getAttribute("customers");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Healthy Buildings</title>
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/styles.css" rel="stylesheet">
        <%-- Java scrips for bootstrap here --%>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <%
            UserPrefs userPrefs = (UserPrefs) session.getAttribute("UserPrefs");
            if (userPrefs != null) {
                request.setAttribute("username", userPrefs.getUsername());
                request.setAttribute("accessLevel", userPrefs.getAccessLevel());
            }
        %>
        <c:if test="${username == null}">
            <jsp:forward page="Login.jsp?login=true" />
        </c:if>
        <mytags:navbar/>
        <div class="container">
            <div class="col-sm-4">
                <c:choose>
                    <c:when test="${result}">
                        <div class="alert alert-success fade in">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>Success!</strong> Customer added.
                        </div>
                    </c:when>
                    <c:when test="${result}">
                        <div class="alert alert-warning fade in">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>Failure!</strong> Data was not saved.
                        </div>
                    </c:when>
                    <c:otherwise>

                    </c:otherwise>
                </c:choose>
                <h1>Customers</h1>
                <!--single customer info start-->
                <c:forEach var="customer" items="${customers}" >
                    <div class="panel panel-info">
                        <div class="panel-heading"><c:out value="${customer.company_name}"/></div>
                        <div class="panel-body">
                            <b> <c:out value="${customer.fname}"/> <c:out value="${customer.lname}"/></b> <br>
                            <span class="glyphicon glyphicon-envelope"></span> <c:out value="${customer.email}"/> <br>
                            <span class="glyphicon glyphicon-earphone"></span> <c:out value="${customer.phone_no}"/><br>
                            <button type="button" class="btn btn-primary">View buildings</button>
                        </div>
                    </div><!-- single customer info end-->

                </c:forEach> 
            </div>
            <div class="col-sm-4"></div>
        </div>
    </body>
</html>
