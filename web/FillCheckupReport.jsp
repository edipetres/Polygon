<%-- 
    Document   : FillCheckupReport
    Created on : Mar 31, 2016, 9:54:33 AM
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
  <h1>Check up report </h1>
  Customer name
  Building info
  <form role="form" action="UserServlet" method="post">
      <input type="hidden" name="command" value="addCheckupReport">
    <div class="form-group">
      <label for="condition_level">Condition of building:</label>
      <input type="number" class="form-control" name="condition_level">
    </div>
    <div class="form-group">
      <label for="comments">Comments on check up:</label>
      <textarea name="comments" class="form-control" rows="4" cols="20">
      </textarea>
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
