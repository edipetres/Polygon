<%-- 
    Document   : ViewCustomers
    Created on : Mar 30, 2016, 2:58:30 PM
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
        <h1>Customers</h1>
        <!--single customer info start-->
        <div class="panel panel-info">
      <div class="panel-heading">Company name</div>
      <div class="panel-body">
          <b>Firstname Lastname</b> <br>
          <span class="glyphicon glyphicon-envelope"></span> name@email.com <br>
          <span class="glyphicon glyphicon-earphone"></span> 05 123 4567<br>
          <button type="button" class="btn btn-primary">View buildings</button>
      </div>
    </div><!-- single customer info end-->
        
  </div><!--container end-->
  
  
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    </body>
</html>
