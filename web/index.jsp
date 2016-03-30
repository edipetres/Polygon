<%-- 
    Document   : newjsp
    Created on : Mar 30, 2016, 6:55:21 PM
    Author     : Pasi
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
request.setAttribute("bansk", "olen himokoodari banskton!");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <h1>
        <c:out value="${bansk}"></c:out>
    </h1>
    </body>
</html>
