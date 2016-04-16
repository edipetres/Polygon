<%-- 
    Document   : FillCheckupReport
    Created on : Mar 31, 2016, 9:54:33 AM
    Author     : Minerva
--%>

<%@page import="Domain.UserPrefs"%>
<%@page import="Domain.CheckupReport"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="mytags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    CheckupReport report = (CheckupReport) request.getAttribute("report");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fill out report</title>
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
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
            <h1>Check up report </h1>

            Customer: <%= report.getCustomer().getFname()%> <%= report.getCustomer().getLname()%><br>
            Building address: <%= report.getBuilding().getStreet()%>, <%= report.getBuilding().getZip()%> <br>
            Size: <%= report.getBuilding().getSize()%>m2

            <form role="form" action="UserServlet" method="post">
                <input type="hidden" name="command" value="updateCheckupReport">
                <div class="form-group">
                    <label for="condition_level">Condition of building:</label>
                    <input type="number" class="form-control" name="condition_level" required>
                </div>
                <div class="form-group">
                    <label for="comments">Comments on check up:</label>
                    <textarea name="comments" class="form-control" rows="4" cols="20" maxlength="255"></textarea>
                </div>
                <input type="hidden" name="creport_id" value="<%= report.getCreport_id()%>"/>
                <button type="submit" class="btn btn-default">Submit</button>
                <a href="UserServlet?command=showCheckupReports" class="button">Back</a>
            </form>
        </div>
    </body>
</html>
