<%-- 
    Document   : DamageReport
    Created on : 31-Mar-2016, 10:10:39
    Author     : edipetres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/styles.css" rel="stylesheet">
        <title>Service Request</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <form class="form-horizontal">
                        <fieldset>

                            <!-- Form Name -->
                            <legend>Request a service</legend>

                            <!-- Multiple Radios -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="servicesRadios">Select service</label>
                                <div class="col-md-4">
                                    <div class="radio">
                                        <label for="servicesRadios-0">
                                            <input type="radio" name="servicesRadios" id="servicesRadios-0" value="1" checked="checked">
                                            Leak detection
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label for="servicesRadios-1">
                                            <input type="radio" name="servicesRadios" id="servicesRadios-1" value="2">
                                            Moisture testing
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label for="servicesRadios-2">
                                            <input type="radio" name="servicesRadios" id="servicesRadios-2" value="3">
                                            Drying services
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label for="servicesRadios-3">
                                            <input type="radio" name="servicesRadios" id="servicesRadios-3" value="4">
                                            Grafiti removal
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label for="servicesRadios-4">
                                            <input type="radio" name="servicesRadios" id="servicesRadios-4" value="5">
                                            Burglary restoration
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label for="servicesRadios-5">
                                            <input type="radio" name="servicesRadios" id="servicesRadios-5" value="6">
                                            Fire damage
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label for="servicesRadios-6">
                                            <input type="radio" name="servicesRadios" id="servicesRadios-6" value="7">
                                            Other...
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <!-- Textarea -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="description">Description</label>
                                <div class="col-md-6">                     
                                    <textarea class="form-control" id="description" name="description">Describe your specific needs for the service request</textarea> 
                                </div>
                            </div>
                            <!-- Button -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="submit"></label>
                                <div class="col-md-4">
                                    <button type="submit" id="submit" name="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>
                <div class="col-sm-4">

                </div>
            </div>
        </div>
    </body>
</html>
