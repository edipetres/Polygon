<%-- 
    Document   : navbarCustomer
    Created on : 17-Apr-2016, 16:02:03
    Author     : edipetres
--%>

<%@tag description="customer navigation bar" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="message"%>
<%@attribute name="username"%>
<%@attribute name="userPrefs"%>
<%@attribute name="accessLevel"%>

<%-- any content can be specified here e.g.: --%>
<div class="navbar navbar-fixed-top navbar-default">
    <div class="container">
        <div class="navbar-header"><a class="navbar-brand" href="index.jsp">HealthyBuildings (customer)</a><a class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="glyphicon glyphicon-bar">Menu</span>
            </a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav pull-left">
                <c:choose>
                    <c:when test="${accessLevel == 3}">
                        <%-- Customer access: --%>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-home"></span> Buildings <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="MyBuildings.jsp"><span class="glyphicon glyphicon-th-list"></span>  My buildings</a></li>
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
                    </c:when>
                    <c:when test="${userPrefs == null}">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-wrench"></span> Services<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="ShowServiceRequests.jsp"><span class="glyphicon glyphicon-th-list"></span> Service Requests</a></li>
                                <li><a href="ServiceRequest.jsp"><span class="glyphicon glyphicon-plus"></span> Request new Service</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="UserServlet?command=showCheckupReports"><span class="glyphicon glyphicon-th-list"></span> CheckUp Reports</a></li>
                            </ul>
                        </li>
                    </c:when>
                </c:choose>


            </ul>

            <c:choose>
                <c:when test="${username != null}">
                    <ul class="nav navbar-nav pull-right">
                        <li class="divider-vertical"></li>
                        <li class="dropdown"  id="menu1">
                            <a class="dropdown-toggle " data-toggle="dropdown" href="#menu1">
                                <i class="icon-user "></i><span class="glyphicon glyphicon-user"></span> <strong> ${username} </strong>
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="MyAccount.jsp"><b>My Account</b></a></li>
                                <li><a href="Authenticate?command=logout"><span class="glyphicon glyphicon-log-out"></span> Log out</a></li>
                            </ul>
                        </li>
                    </ul> 
                </c:when>
                <c:otherwise>
                    <ul class="nav navbar-nav pull-right">
                        <li><a href="Login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                    </ul>
                </c:otherwise>
            </c:choose>
            
        </div>
    </div>
</div>
</div>
<br><br><br>