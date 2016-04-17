<%-- 
    Document   : AssignEmployee
    Created on : Apr 15, 2016, 2:09:54 PM
    Author     : Minerva
--%>

<%@page import="Domain.Employee"%>
<%@page import="Domain.CheckupReport"%>
<%@page import="java.util.List"%>
<%@page import="Domain.DomainFacade"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DomainFacade domainModel = DomainFacade.getInstance();
    List<CheckupReport> reports = domainModel.showPendingCheckupReports();
    request.setAttribute("reports", reports);

    List<Employee> employees = domainModel.showEmployees();
    request.setAttribute("employees", employees);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Bootstrap 101 Template</title>

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>

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
                                    <th>ID</th> 
                                    <th>Customer</th> 
                                    <th>Address</th>
                                    <th>Perform</th>
                                </tr>
                            </thread>
                            <c:forEach var="request" items="${reports}">
                                <tr>
                                    <td><c:out value="${request.getCreport_id()}"/></td>
                                    <td><c:out value="${request.getCustomer().getCompany_name()}"/></td>
                                    <td><c:out value="${request.getBuilding().getStreet()}"/> <br> <c:out value="${request.getBuilding().getZip()}"/> <c:out value="${request.getBuilding().getCity()}"/></td>

                                    <td>
                                        <form action="UserServlet" method="post">
                                            <select name="employeeid">
                                                <c:forEach var="employee" items="${employees}">
                                                    <option value="${employee.getEmployee_id()}"><c:out value="${employee.getFname()}"/> <c:out value="${employee.getLname()}"/></option>
                                                </c:forEach>
                                            </select> 
                                            <input type="hidden" name="command" value="assignEmployee"/>
                                            <input type="hidden" name="reportid" value="${request.getCreport_id()}"/>
                                            <button type="submit" class="btn btn-default">Submit</button>
                                        </form>
                                    </td>
                                </tr>

                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>




        </div>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
