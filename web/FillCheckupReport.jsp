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
    </head>
    <body>
        <div class="container">
  <h1>Check up report </h1>
  Customer name
  Building info
  <form role="form" action="UserServlet" method="post">
      <input type="hidden" name="command" value="addChecupReport">
    <div class="form-group">
      <label for="company_name">Municipality or association name:</label>
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
     
      
    <button type="submit" class="btn btn-default">Submit</button>
  </form>
</div>
    </body>
</html>
