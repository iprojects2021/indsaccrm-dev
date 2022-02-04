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
    }
    

