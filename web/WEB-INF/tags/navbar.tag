<%-- 
    Document   : navbar
    Created on : Apr 6, 2016, 1:00:07 PM
    Author     : Minerva
--%>

<%@tag description="navigation bar" pageEncoding="UTF-8"%>


<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="message"%>

<%-- any content can be specified here e.g.: --%>
<div class="navbar navbar-fixed-top navbar-default">
    <div class="container">
        <div class="navbar-header"><a class="navbar-brand" href="index.jsp">HealthyBuildings</a><a class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="glyphicon glyphicon-bar"></span>
                <span class="glyphicon glyphicon-bar"></span>
                <span class="glyphicon glyphicon-bar"></span>
            </a>
        </div>
        <div class="navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-home"></span> Buildings <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="Buildings.jsp"><span class="glyphicon glyphicon-th-list"></span>  All buildings</a></li>
                        <li><a href="AddBuilding.jsp"><span class="glyphicon glyphicon-plus"></span> Add new building</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user"></span> Customers <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="UserServlet?command=showCustomers"><span class="glyphicon glyphicon-th-list"></span>  All customers</a></li>
                        <li><a href="AddCustomer.jsp"><span class="glyphicon glyphicon-plus"></span> Add new customer</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                    </ul>
                </li>
                <li class="nav-divider"></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-wrench"></span> Services<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="ShowServiceRequests.jsp"><span class="glyphicon glyphicon-th-list"></span> Service Requests</a></li>
                        <li><a href="ServiceRequest.jsp"><span class="glyphicon glyphicon-plus"></span> Request new Service</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="UserServlet?command=showCheckupReports"><span class="glyphicon glyphicon-th-list"></span> CheckUp Reports</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-wrench"></span> My Account<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="MyAccount.jsp"><span class="glyphicon glyphicon-th-list"></span> My account</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-plus"></span> none</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#"><span class="glyphicon glyphicon-th-list"></span> none</a></li>
                    </ul>
                </li>
                
                
               
            </ul>
            
            <ul class="nav navbar-nav navbar-right">
                <li><a href="Login.jsp">Login</a></li>
                <li><a href="Authenticate?command=logout">Log out</a></li>
            </ul>
        </div>
    </div>
</div>
<br><br><br>

<%-- Navbar bottom
<div class="navbar navbar-default navbar-fixed-bottom">
    <div class="navbar-header"><a class="navbar-brand" href="#">Brand</a></div>
    <ul class="nav navbar-nav">
     <li class="active"><a href="#">Home</a></li>
     <li><a href="#">Link</a></li>
     <li><a href="#">More</a></li>
     <li><a href="#">Options</a></li>
      </ul>
</div>
--%>