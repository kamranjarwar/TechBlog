

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry Something Went Wrong</title>
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   
    <style>
        .banner-background{
           clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 94%, 68% 91%, 31% 96%, 0 89%, 0 0);
        }
    </style>
    </head>
    <body>
        <div class ="container text-center " style="padding: 40px" >
            <image src ="img/browser.png" class ="img-fluid">
            <h3>Sorry Something went Wrong... </h3>
            <%= exception%>
            <a href ="index.jsp" class ="btn primary-background btn-lg text-white">Home</a>
        </div>
    </body>
</html>
