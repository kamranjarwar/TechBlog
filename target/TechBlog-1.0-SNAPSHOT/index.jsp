<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>  <%-- Import your class --%>

<!DOCTYPE html>
<html>
    <head>
         <title>JSP Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        
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
        <%@include file ="normal_navbar.jsp" %>
        <div class="container-fluid p-0 m-0">
            
            <div class ="jumbotron primary-background text-white banner-background">
                <div class="container">
                    <h3 class="display-3">Welcome To  TechBlog</h3>
                
                <p> Welcome To Technical blog,world of technology
                Programming languages differ from natural languages in that natural languages are used for interaction between people, while programming languages are designed to allow humans to communicate instructions to machines.
                </p>
                <p>
                    Every programming language includes fundamental elements for describing data and the operations or transformations applied to them, such as adding two numbers or selecting an item from a collection
                </p>
                <button class="btn btn-outline-light btn-lg"> <span class ="fa fa-external-link"></span> Start ! its Free</button>
                <a href="login_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle fa-spin"></span>  Login</a>
                </div>
                
            </div>
            
        </div>
        <div class="container">
            <div class="row mb-2">
                <div class="col-md-4">
                    <div class="card" >
           
              <div class="card-body">
             <h5 class="card-title">JAVA Programming </h5>
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                 <a href="#" class="btn primary-background text-white">Read More</a>
               </div>
                 </div>
          </div>
                <div class="col-md-4">
                    <div class="card" >
           
              <div class="card-body">
             <h5 class="card-title">JAVA Programming </h5>
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                 <a href="#" class="btn primary-background text-white">Read More</a>
               </div>
                 </div>
          </div>
                <div class="col-md-4">
                    <div class="card" >
           
              <div class="card-body">
             <h5 class="card-title">JAVA Programming </h5>
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                 <a href="#" class="btn primary-background text-white">Read More</a>
               </div>
                 </div>
          </div>
          </div>
            
            
            
             <div class="row">
                <div class="col-md-4">
                    <div class="card" >
           
              <div class="card-body">
             <h5 class="card-title">JAVA Programming </h5>
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                 <a href="#" class="btn primary-background text-white">Read More</a>
               </div>
                 </div>
          </div>
                <div class="col-md-4">
                    <div class="card" >
           
              <div class="card-body">
             <h5 class="card-title">JAVA Programming </h5>
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                 <a href="#" class="btn primary-background text-white">Read More</a>
               </div>
                 </div>
          </div>
                <div class="col-md-4">
                    <div class="card" >
           
              <div class="card-body">
             <h5 class="card-title">JAVA Programming </h5>
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                 <a href="#" class="btn primary-background text-white">Read More</a>
               </div>
                 </div>
          </div>
          </div>
            
        </div>
        
        
       
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" crossorigin="anonymous"></script>        
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
       
       <script src="js/myjs.js" type="text/javascript"></script>
       
    </body>
</html>
