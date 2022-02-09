/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package menu;

import blezz.Poul;
import email.EmergencyEmail;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import log.Log;

/**
 *
 * @author Lenovo
 */
public class UserProfileService {
    
    public static String[] getUserProfile(String useradminid)throws IOException{
              int i=0;
              
      String leaddata[]=new String[50];
          try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from register where useradminid=? ");
        smt.setString(1,useradminid);
       
        ResultSet rs=smt.executeQuery();
    
        while(rs.next())
        { 
           for(i=1;i<=48;i++)
        {
        leaddata[i]=rs.getString(i);
               }
        }
        
       rs.close();
      smt.close();
      con.close();
          } catch(Exception e){
              String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n UserProfileService.java-----\n"
              + "LINE=46\nselect * from register where useradminid=?";
              Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
              EmergencyEmail.send(e,errormsg); 
          }
          
          return leaddata;
    }
      
      public static String saveUserProfileLogotoDB(String useradminid,String usercid,String id,String filename ) throws IOException{
        
       try{
           Connection c=Poul.getConnectionCRM();

          Statement st=c.createStatement(); 
          st.addBatch("update register set  logo='"+filename+"'  where id='"+id+"' and useradminid='"+useradminid+"' ");
         
          String logstatus="File Upload";
          st.addBatch("insert into businessprofilelog(usercid,useradminid,businessprofileid,logo) values(?,?,?,?)");
       
        st.executeBatch(); 
         Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  ,File=UserProfileService.java method=saveUserProfileLogotoDB() ,useradminid="+useradminid+" ,usercid="+usercid+",filename="+filename+",id="+id+", User Profile name Saved to DB Successfully");
       
      st.close();
      c.close();    }
        catch(SQLException e)
        {
      String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n Package=menu , File=UserProfileService.java , method=saveUserProfileLogotoDB( useradminid="+useradminid+" ,usercid="+usercid+",filename="+filename+",id="+id+")-----\n"
     + "LINE=75 \n update register set   logo='"+filename+"'  where id='"+id+"' and useradminid='"+useradminid+"'  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
     
        }
    return "true";
      }
    
    
    }
    

