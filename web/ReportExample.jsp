<%-- 
    Document   : ReportExample
    Created on : Apr 11, 2016, 11:08:43 AM
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
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Report</title>

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!--custom css-->
        <link href="css/styles.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    <body>
        <div class="container report">
            <!--report header-->
            <form role="form" action="UserServlet" method="post">
                <input type="hidden" name="command" value="updateCheckupReport">
            <div class="row">
                <div class="col-sm-4">
                    <img src="images/polygon-logo.PNG" alt=""/>
                    <br>
                    <p>Report number: <%= report.getCreport_id()%></p>
                </div>
                <div class="col-sm-4"><h2>Building review</h2></div>
                <div class="col-sm-4">
                    <img src="images/sundebygninger-logo.PNG" alt=""/>
                </div>
            </div>
            <!--report basic information-->
            <div class="row">
                <div class="col-sm-4">
                    <p>
                        Name of building: <%= report.getBuilding().getName()%>
                        <br>
                        Address: <%= report.getBuilding().getStreet()%>
                        <br>
                        Postnr./City: <%= report.getBuilding().getZip()%>
                    </p>
                </div>    
                <div class="col-sm-4"></div>
                <div class="col-sm-4">
                    <p>
                        Date: <%= report.getCheckDate()%>
                    </p>
                    <p class="contact-info">
                        <br><br>
                        Polygon<br>
                        Rypevang 5<br>
                        3450 Allerød<br><br>
                        Tlf. 4814 0555<br>
                        sundebygninger@polygon.dk
                    </p>
                </div>
            </div>
            <!-- image of building-->
            <div class="row">
                <div class="col-sm-12 image-holder">
                    (Insert image of building here)
                </div>
            </div>
            <!--content of report-->
            <div class="row">
                <div class="col-sm-12">
                    <h4>General information of building</h4>
                    Year built: <%= report.getBuilding().getYear()%><br>
                    Size in m2: <%= report.getBuilding().getSize()%><br>
                    Use of building: <%= report.getBuilding().getBuildingUse()%>

                    <h4>Examination of the building</h4>
                    <h4>Damage and repair</h4>
                    Has there been damage in the building? 
                    <input type="checkbox" name="damaged" value="yes" /> Yes
                    <input type="checkbox" name="damaged" value="no" /> No
                    <br>
                    When? <input type="text" name="damage-when">
                    <br>
                    Where? <input type="text" name="damage-where">
                    <br>
                    What happened? <input type="text" name="damage-what"><br>
                    What is repaired? <input type="text" name="damage-repaired"><br>
                    <h4>Reviewing of...</h4>
                    Walls <input type="text" name="" value="" /><br>
                    Ceiling <input type="text" name="" value="" /><br>
                    Floor <input type="text" name="" value="" /><br>
                    Windows/doors <input type="text" name="" value="" />
                    <h4>Moisture scanning</h4>
                    Has there been moisture scanning? 
                    <input type="checkbox" name="moisture" value="yes" />Yes
                    <input type="checkbox" name="moisture" value="no" />No
                    <br>
                    Measuring point: <input type="text" name="" value="" />
                    <h4>Conclusion</h4>
                    Recommendations<br>
                    <textarea name="comments" rows="4" cols="100"></textarea><br>
                    Building review was conducted by <i><%= report.getEmployee().getFname()%> <%= report.getEmployee().getLname()%></i>, Polygon in cooperation with <i><%= report.getCustomer().getFname()%> <%= report.getCustomer().getLname()%></i> (building resposible)
                    <h4>The building is categorized as</h4>
                    <table class="table table-responsive">
                        <thead>
                            <tr>
                                <th>
                                    Condition grade
                                </th>
                                <th>
                                    Description
                                </th>
                                <th>
                                    Function of building
                                </th>
                                <th>
                                    State level
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    Condition grade 0
                                </td>
                                <td>
                                    The building is new and just built
                                </td>
                                <td>
                                    [CONTENT]
                                </td>
                                <td>
                                    <input type="radio" name="condition_level" value="0">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Condition grade 1
                                </td>
                                <td>
                                    The building part is intact, but with the start of wear and <br>visible damage (only cosmetic damage)
                                </td>
                                <td>
                                    [CONTENT]
                                </td>
                                <td>
                                    <input type="radio" name="condition_level" value="1">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Condition grade 2
                                </td>
                                <td>
                                    The building part is beginning to decay, with individual <br>defective components
                                </td>
                                <td>
                                    [CONTENT]
                                </td>
                                <td>
                                    <input type="radio" name="condition_level" value="2">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Condition grade 3
                                </td>
                                <td>
                                    The building element is broken and must be replaced
                                </td>
                                <td>
                                    [CONTENT]
                                </td>
                                <td>

                                    <input type="radio" name="condition_level" value="3">
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <p>Denne rapport og bygningsgennemgang er lavet for at klarlægge umiddelbare visuelle problemstillinger. 
                        Vores formål er at sikre, at 
                        bygningens anvendelse kan opretholdes. 
                        Vi udbedrer ikke skader som en del af bygningsgennemgangen/rapporten. Gennemgangen 
                        af 
                        bygningen indeholder ikke fugtmålinger af hele bygningen, men vi kan foretage fugtscanninger enkelte steder i bygningen, hvis
                        vi 
                        finder  det  nødvendigt. Hvis vi finder kritiske områder i  bygningen vil vi fremlægge anbefalinger angående yderligere tiltag  s
                        å 
                        som 
                        yderligere undersøgelser, reparationer eller bygningsopdateringer. 
                        Bemærk at vi skal have adgang til hele bygningen for at kunne udføre en fuld gennemgang (dette inkluderer adgang til tag, tag
                        rum, 
                        kælder, krybekælder eller andre aflukkede områder). De
                        nne bygningsgennemgang er ikke
                        -
                        destruktiv. Hvis der skal laves destruktive 
                        indgreb,  skal  dette  først   godkendes  af  de  bygningsansvarlige.  Destruktive  indgreb  er  ikke   en  del  af  denne  rapport  eller 
                        bygningsgennemgang.
                        Den bygningsansvarlige skal udlevere plan
                        tegning over bygningen inden bygningsgennemgangen kan foretages. </p>
                    <button type="submit" class="btn btn-default">Submit</button>
                </div>
            </div>
                    <input type="hidden" name="creport_id" value="<%= report.getCreport_id()%>"/>
                    </form>
        </div> <!--container end-->

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
