<%-- 
    Document   : AddCustomer
    Created on : Mar 30, 2016, 9:26:40 AM
    Author     : Minerva
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
  <h1>Add new customer</h1>
  <form role="form" action="UserServlet">
    <div class="form-group">
      <label for="company_name">Company name:</label>
      <input type="text" class="form-control" name="company_name">
    </div>
    <div class="form-group">
      <label for="fname">Contact person's first name:</label>
      <input type="text" class="form-control" name="fname">
    </div>
    <div class="form-group">
      <label for="lname">Contact person's last name:</label>
      <input type="text" class="form-control" name="lname">
    </div>
      <div class="form-group">
      <label for="username">Username:</label>
      <input type="text" class="form-control" name="username">
    </div>
      <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="text" class="form-control" name="pwd">
    </div>
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" name="email">
    </div>
      <div class="form-group">
      <label for="phone_no">Phone number:</label>
      <input type="text" class="form-control" name="phone_no">
    </div>
      
    <button type="submit" class="btn btn-default">Submit</button>
  </form>
</div>
        
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    </body>
</html>
