<%-- 
    Document   : CheckupRequest
    Created on : Mar 31, 2016, 2:51:37 PM
    Author     : Minerva
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="UserServlet">
            <input type="hidden" name="command" value="requestCheckup">
            <input type="submit" value="Request Checkup" name="" />
        </form>
    </body>
</html>
