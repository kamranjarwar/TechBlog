/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.*;
public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
  public boolean saveUser(User user){
       boolean f =false;
      try{
         
          String query ="insert into user(name,email,password,gender ,about) values (?,?,?,?,?)";
        PreparedStatement pst=this.con.prepareStatement(query);
        pst.setString(1,user.getName());
         pst.setString(2,user.getEmail());
          pst.setString(3,user.getPassword());
           pst.setString(4,user.getGender());
            pst.setString(5,user.getAbout());
            pst.executeUpdate();
        f=true;
          
          
          
      }catch(Exception e){
          e.printStackTrace();
      }
      return f;
  }  
  public User getUserEmPass( String email,String password){
      User user =null;
      
      try{
          String query ="select * from user where email=? and password=?";
          PreparedStatement pst =con.prepareStatement(query);
          pst.setString(1, email);
           pst.setString(2, password);
         ResultSet set=  pst.executeQuery();
         if(set.next()){
             System.out.println("data agya bhai");
             user=new User();
             String name =set.getString("name");
             user.setName(name);
             user.setId(set.getInt("id"));
             user.setEmail(set.getString("email"));
             user.setPassword(set.getString("password"));
             user.setGender(set.getString("gender"));
             user.setAbout(set.getString("about"));
             user.setDateTime(set.getTimestamp("rdate"));
             user.setProfile(set.getString("profile"));
         } else {
                          System.out.println("data nae  aya bhai");

         }
          
      }catch(Exception e){
          e.printStackTrace();
      }
      return user;
  }
  public boolean updateUser(User user){
      boolean f =false;
      
      try{
          String query ="update user set name = ? ,email =? , password =?, gender =?, about=?, profile =?  where id =?" ;
          PreparedStatement pst =con.prepareStatement(query);
          pst.setString(1,user.getName());
          pst.setString(2, user.getEmail());
            pst.setString(3, user.getPassword());
              pst.setString(4, user.getGender());
                pst.setString(5, user.getAbout());
                pst.setString(6, user.getProfile());
                 pst.setInt( 7  ,user.getId());
               pst.executeUpdate();
               f =true;
      }catch(Exception e){
          e.printStackTrace();
      }
      return f;
  }
}
