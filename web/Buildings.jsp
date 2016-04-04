<%-- 
    Document   : Buildings
    Created on : Apr 4, 2016, 10:53:09 AM
    Author     : Minerva
--%>

<%@page import="java.util.List"%>
<%@page import="Domain.Building"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Domain.DomainFacade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%
            DomainFacade domainModel = DomainFacade.getInstance();
            List<Building> buildings = domainModel.showBuildings();
            request.setAttribute("buildings", buildings);
        %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>

        <%

        for (int i =0; i < buildings.size(); i ++ ){
            
        %>
        <%= buildings.get(i).getStreet()%>
        <%= buildings.get(i).getZip()%>
        <form action="UserServlet">
            <input type="hidden" name="command" value="requestCheckup">
            <input type="submit" value="Request Checkup" name="" />
        </form>

    <br>
 <%} //end of for loop%>
    </body>
</html>
