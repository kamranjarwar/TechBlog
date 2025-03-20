<%@page import ="com.tech.blog.entities.User"%>
<%@ page import="com.tech.blog.entities.Message"%>
<%@ page import="com.tech.blog.dao.PostDao"%>
<%@ page import="com.tech.blog.helper.ConnectionProvider"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.tech.blog.entities.Category" %>


<%@page errorPage ="error_page.jsp"%>
<% 
   User user = (User) session.getAttribute("CurrentUser");
   if (user == null) {
       response.sendRedirect("login_page.jsp");
       return; // Important: Prevents further execution
   }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>
        
        
        
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   
    <style>
        .banner-background{
           clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 94%, 68% 91%, 31% 96%, 0 89%, 0 0);
        }
        body{
            background: url(img/bg.jpeg);
            background-size: cover;
            background: fixed;
        }
    </style>
        
        
        
        
    </head>
    <body>
<!--        nav bar start-->
        
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <a class="navbar-brand" href="index.jsp"><sampTech class ="	fa fa-asterisk"></sampTech> Tech Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="#"><span class ="fa fa-bell-o"></span>   Home <span class="sr-only">(current)</span></a>
      </li>
    
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
            <span class="fa fa-check-square-o"></span>  Categories
        </a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="#">Programming language</a>
          <a class="dropdown-item" href="#">Project Implementation</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Structure</a>
        </div>
      </li>
        <li class="nav-item">
            <a class="nav-link" href="#"><span class ="	fa fa-address-card-o"></span>   Contact</a>
      </li>
        <li class="nav-item">
            <a class="nav-link" href="#" data-toggle="modal" data-target ="#do-post-modal"><span class ="	fa fa-asterisk"></span>Do Post</a>
      </li>
       
      
       
      
    </ul>
      <ul class="navbar-nav mr-right">
          
           <li class="nav-item">
            <a class="nav-link" href="#!" data-toggle="modal" data-target ="#profile-click"><span class ="fa fa-user-circle "></span> <%= user.getName()%></a>
      </li>
          
          <li class="nav-item">
            <a class="nav-link" href="logoutServlet"><span class "a fa-user-plus "></span>LogOut</a>
      </li>
      </ul>
  </div>
</nav>
      
      
      
<!--         end of nav bar-->





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

                            
                            
          <!--                      main body of the page      -->


          <main>
              <div class="container">
                  
                  <div class="row mt-4">
                      
<!--                      first colum-->
                 <div class="col-md-4">
                     <div class="list-group">
                         <a href="#" onclick="getPosts(0,this)" class=" c-link list-group-item list-group-item-action active" aria-current="true">
      All Post
  </a>
   <%               
   
   PostDao d =new PostDao(ConnectionProvider.getConnection());
             ArrayList<Category> list1 = d.getAllCategories();
                 
         for(Category cc :list1){
         
         %>
         <a href="#" onclick="getPosts(<%= cc.getCid() %>,this )"   class="c-link list-group-item list-group-item-action"><%= cc.getName()   %></a>
  
         <%
             
       }
   
   %>
 
</div>
                    
                    </div>
<!--                   second colum-->
                      
                         <div class="col-md-8">
                             <div class="container text-center" id ="loader">
                                 <i class="fa fa-refresh fa-3x fa-spin"></i>
                                 <h3 class="mt-2">loading....</h3>
                             </div>
                             <div class="container-fluid" id ="post-container">
                                 
                                 
                             </div>
                    
                    </div>


                  </div>
                  
              </div>
              
              
          </main>




                   <!--end main body of page-->



<!--   profile model-->


<!-- Modal -->
<div class="modal fade" id="profile-click" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div> 
      <div class="modal-body">
          <dive class ="container text-center " >
              <img src ="pics/<%=  user.getProfile() %>" class="img-fluid" style="border-redius :50%; max-width: 150px" >
              <br>
           <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName()%></h5>
           
           
<!--           //details
           -->
           <div id ="profile-details">
           <table class="table">
 
  <tbody>
    <tr>
      <th scope="row">Id</th>
      <td><%= user.getId()  %></td>
      
    </tr>
    <tr>
      <th scope="row">Email</th>
      <td><%= user.getEmail()  %></td>
      
    </tr>
    <tr>
      <th scope="row">Password</th>
      <td><%= user.getPassword()  %></td>
      
    </tr>
    <tr>
      <th scope="row">Gender</th>
      <td><%= user.getGender() %></td>
      
    </tr>
    <tr>
      <th scope="row">About</th>
      <td><%= user.getAbout() %></td>
      
    </tr>
    <tr>
      <th scope="row">Register Date</th>
      <td><%= user.getDateTime() %></td>
      
    </tr>
  </tbody>
</table>
           </div>
      
           
<!--           end details-->
           <!--prifile edit-->
           <div id ="profile-edit" style="display: none;">
               <h2 class ="mt-2">EDIT Carefully </h2>
               <form action ="EditServlet" method="POST"  enctype="multipart/form-data">
                   <table class="table">
                       <tr>
                           <td>ID : </td>
                            <td><%= user.getId()  %> </td>
                       </tr>
                       
                       <tr>
                           <td>Email : </td>
                           <td><input type="email" class="form-control" name ="user_email" value="<%= user.getEmail()%> "> </td>
                       </tr>
                       <tr>
                           <td>Name : </td>
                           <td><input type="text" class="form-control" name ="user_name" value="<%= user.getName()%> "> </td>
                       </tr>
                       <tr>
                       <td>Password :</td>
                                       <td>
                        <input type="password" class="form-control" name="user_password" value="<%= user.getPassword() %>">
              </td>
                       </tr>

                       <tr>
                           <td>Gender : </td>
                           <td> <%= user.getGender().toUpperCase()%> </td>
                       </tr>
                       <tr>
                           <td>About : </td>
                           <td> 
                               <textarea class =" form-control" name="user_about"><%=  user.getAbout()%>
                                   
                               </textarea>
                           
                           </td>
                       </tr>
                       <tr>
                                      <td>New Profile:</td><td> 
                               <input type="file" name="image" class="form-control">
                           </td>
                           
                       </tr>
                       
                   </table>
                              
                   
                               <div class ="container p-2" >
                   <button type="submit" class="btn  btn-outline-primary">Save</button>
                               </div>
               </form>
           </div>
          </dive> 
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id ="edit-profile-button"  type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>







<!--end of profile model -->


<!--add post modal-->


 

<!-- Modal -->
<div class="modal fade" id="do-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Provide Post Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          
          
          <form  id="add-post-form" action="AddPostServlet" method ="POST">
              <div class="form-group">
                  
                  <select class="form-control" name ="cid" > 
                      <option selected disabled>--Select Categories--</option>
                      <% 
                       PostDao posttd = new PostDao(ConnectionProvider.getConnection());
                        ArrayList<Category> list=posttd.getAllCategories();
                        for(Category c : list )
                        {
                        
                      %>
                      <option value="<%= c.getCid() %>"><%=  c.getName() %></option>
                 
                    <%
                        }

                     %>
              </select>
          
              </div>
              <div class="form-group">
                  <input name ="pTitle" type="text" placeholder="Enter Post Tittle " class="form-control"/>
              </div>
             <div class="form-group">
                 <textarea name = "pContent " class="form-control"  style="height :100px;" placeholder="Enter Your Content"></textarea>
                 </div>
             <div class="form-group">
                <textarea name ="pCode" class="form-control"  placeholder="Enter your program (if any)"></textarea>
                 </div>
              <div class="form-group">
                  <label> Select Your Pic</label>
                  <br>
                  <input type="file" name="pic">
     
              </div>
              <div class="container text-center">
                  <button type="submit" class="btn btn-outline-primary">Post</button>
              </div>
          </form>
        ...
      </div>
     
    </div>
  </div>
</div>



<!--End  add post model -->




        
       
        
        
           <script src="https://code.jquery.com/jquery-3.7.1.min.js" crossorigin="anonymous"></script>        
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
       <script src="js/myjs.js" type="text/javascript"></script>
        
       <script>
           
           $(document).ready(function(){
               
               
               let editStatus = false;
               
               $('#edit-profile-button').click(function()
               {
                   if(editStatus === false){
                       $("#profile-details").hide();
                      $("#profile-edit").show();
                      editStatus = true;
                      $(this).text("Back");
                   }else
                   {
                        $("#profile-details").show();
                      $("#profile-edit").hide();
                      editStatus = false;
                      $(this).text("Edit");
                       
                   }
               });
           });
           
       </script>
       
       
<!--        now add post js-->
 <script>
            $(document).ready(function (e) {
                //
                $("#add-post-form").on("submit", function (event) {
                    //this code gets called when form is submitted....
                    event.preventDefault();
                    console.log("you have clicked on submit..")
                    let form = new FormData(this);

                    //now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success ..
                            console.log(data);
                            if (data.trim() ==='done')
                            {
                                swal("Good job!", "saved successfully", "success");
                            } else
                            {
                                swal("Error!!", "Something went wrong try again...", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error..
                            swal("Error!!", "Something went wrong ...", "error");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
        
<!--          loading post -->
 
<script>

            function getPosts(catId, temp) {
                $("#loader").show();
                $("#post-container").hide()

                $(".c-link").removeClass('active')


                $.ajax({
                    url: "load_posts.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $("#post-container").show();
                        $('#post-container').html(data);
                        $(temp).addClass('active');

                    }
                })

            }

            $(document).ready(function (e) {

                let allPostRef = $('.c-link')[0];
                getPosts(0, allPostRef);


            });
        </script>
    </body>
</html>
