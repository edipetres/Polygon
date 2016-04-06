<%-- 
    Document   : FillCheckupReport
    Created on : Mar 31, 2016, 9:54:33 AM
    Author     : Minerva
--%>

<%@page import="Domain.CheckupReport"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	CheckupReport report = (CheckupReport) request.getAttribute("report");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fill out report</title>
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

  Customer: <%= report.getCustomer().getFname()%> <%= report.getCustomer().getLname()%><br>
  Building address: <%= report.getBuilding().getStreet()%>, <%= report.getBuilding().getZip()%><br>
  Size: <%= report.getBuilding().getSize()%>m2
  
  <form role="form" action="UserServlet" method="post">
      <input type="hidden" name="command" value="updateCheckupReport">
    <div class="form-group">
      <label for="condition_level">Condition of building:</label>
      <input type="number" class="form-control" name="condition_level" required>
    </div>
    <div class="form-group">
      <label for="comments">Comments on check up:</label>
      <textarea name="comments" class="form-control" rows="4" cols="20" maxlength="255"></textarea>
    </div>
      <input type="hidden" name="creport_id" value="<%= report.getCreport_id()%>"/>
    <button type="submit" class="btn btn-default">Submit</button>
    <a href="" class="button">Back</a>
  </form>
</div>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    </body>
</html>
