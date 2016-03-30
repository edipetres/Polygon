<%-- 
    Document   : AddBuilding
    Created on : 29-Mar-2016, 19:15:35
    Author     : edipetres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Building</title>
    </head>
    <body>
        <h1>You can add a new building here:</h1>
        <form name="AddBuilding" action="UserServlet" method="POST">
            <input type="hidden" name="command" value="addBuilding">
            Building Name: <br>
            <input type="text" name="name" /> <br>
            Address: <br>
            <input type="text" name="address"> <br>
            Size: <input type="text" name="size" size="5"> 
            <br>
            <input type="submit" value="Add">
        </form>
    </body>
</html>
