<%-- 
    Document   : CheckupRequest
    Created on : Mar 31, 2016, 2:51:37 PM
    Author     : Minerva
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="mytags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <title>JSP Page</title>
                <%-- Java scrips for bootstrap here --%>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <mytags:navbar/>
        <h1>Hello World!</h1>
        <form action="UserServlet">
            <input type="hidden" name="command" value="requestCheckup">
            <input type="submit" value="Request Checkup" name="" />
        </form>
    </body>
</html>
