<%-- 
   Document   : AddCustomer
   Created on : Mar 30, 2016, 9:26:40 AM
   Author     : Minerva
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="mytags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Healthy Buildings</title>
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/styles.css" rel="stylesheet">
    </head>
    <body>
        <mytags:navbar/>
        <div class="container">
            <h1>Add new customer</h1>
            <form role="form" action="UserServlet" method="post" data-toggle="validator">
                <input type="hidden" name="command" value="addCustomer">
                <div class="form-group">
                    <label for="company_name">Municipality or association name:</label>
                    <input type="text" class="form-control" name="company_name" placeholder="Municipality or association name" required>
                </div>
                <div class="form-group">
                    <label for="fname">Contact person's first name:</label>
                    <input type="text" class="form-control" name="fname" placeholder="Contact person's first name" required>
                </div>
                <div class="form-group">
                    <label for="lname">Contact person's last name:</label>
                    <input type="text" class="form-control" name="lname" placeholder="Contact person's last name" required>
                </div>
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" class="form-control" name="username" placeholder="Username" required>
                </div>
                <div class="form-group">
                    <label for="pwd">Password:</label>
                    <input type="password" class="form-control" name="pwd" placeholder="Password" required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" placeholder="Email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="phone_no">Phone number:</label>
                    <input type="text" class="form-control" name="phone_no" placeholder="Phone number">
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
        </div>

                <!-- Latest compiled JavaScript -->
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
