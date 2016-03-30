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
            Street: <br>
            <input type="text" name="street"> <br>
            Size: <input type="text" name="size" size="5"> 
            <br>
            Zip: <br> <input type="text" name="zip" size="5">
            <input type="submit" value="Add">
        </form>
        ${Message}
    </body>
</html>
