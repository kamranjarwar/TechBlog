<%-- 
    Document   : login_page
    Created on : Mar 14, 2025, 12:41:01 AM
    Author     : KAMRAN JARWAR
--%>
<%@page import="com.tech.blog.entities.Message" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
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
        <!--navbar-->
        <%@include file ="normal_navbar.jsp" %>
        <main class="d-flex align-items-center primary-background banner-background" style="height :90vh">
            
            <div class ="container">
                <div class="row">
                    <div class ="col-md-4 offset-md-4">
                        <div class="card">
                            <div class ="card-header primary-background text-white text-center">
                                <span class ="fa fa-user-plus fa-2x"> </span>
                                <p>Login here</p>
                            </div>
                            
                            <%   
                           Message m=(Message)session.getAttribute("msg");
                           if(m != null)
                           {
                                  %>
                                 <div class="alert <%= m.getCssClass()  %>" role="alert">
                                   <%=    m.getContent() %>
                                  </div>
                                  <%
                                      session.removeAttribute("msg");
                                }
                            %>
                            <div class ="card-body">
                                <form action="LoginServlet" method="POST">
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input  name ="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input name ="password" required type="password" class="form-control" id="exampleInputPassword1">
  </div>
  
       <div class ="container text-center">                             
  <button type="submit" class="btn btn-primary">Submit</button>
       </div>
</form>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        
        
        
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" crossorigin="anonymous"></script>        
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
       
       <script src="js/myjs.js" type="text/javascript"></script>
       
    </body>
</html>
