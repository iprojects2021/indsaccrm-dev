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
 * @author Dell
 */
public class Marketing {
    
        public static String getEventName(String eventid) throws IOException{
        String name="";
     try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select subject from events where id=?");
      
        smt.setString(1,eventid);
        ResultSet rs=smt.executeQuery();
        
        while(rs.next()){
            
               name=(rs.getString(1)); 
               
        }
        rs.close();
      smt.close();
      con.close();
     Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"Package=menu ,  Page=Marketing.java  Method=getEventName(String eventid) Eventname="+name+"");
     
       }
        catch(Exception e){
               String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Marketing.java , method=getEventName(String eventid) -----\n"
    + "\nLINE=45\n select subject from events where id="+eventid+"  ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
        return name;
    
    }
    
}
