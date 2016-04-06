<%-- 
    Document   : ViewCustomers
    Created on : Mar 30, 2016, 2:58:30 PM
    Author     : Minerva
--%>

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
        <mytags:navbar/>
        <div class="container">
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

        </div><!--container end-->

    </body>
</html>
