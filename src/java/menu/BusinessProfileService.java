/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 *//*
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
public class BusinessProfileService {
    
   public static boolean checkBusinessExist(String useradminid) throws IOException{
       String result="0";boolean returnResult=false;
        try{
              Connection con=Poul.getConnectionCRM();
              PreparedStatement ps=con.prepareStatement("select id from  businessprofile where useradminid=?");
              ps.setString(1,useradminid);
        ResultSet rs=ps.executeQuery();
       while(rs.next()){
               result=(rs.getString(1)); 
       }
          rs.close();
      ps.close();
      con.close();
             }
        catch(Exception e){
              String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=BusinessProfileService.java , method=checkBusinessExist(String useradminid)-----\n"
    + "\nLINE=42 \n select count(category) from expense where useradminid=="+useradminid+"  ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                }
        if("0".equals(result)){
           Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  File=BusinessProfileService.java , method=checkBusinessExist(String useradminid) useradminid="+useradminid+",  result=false");
           return false;
      }
      else {
           Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  File=BusinessProfileService.java , method=checkBusinessExist(String useradminid) useradminid="+useradminid+", result=true");
      return true;
      }
   }
    public static String[] getBusinessProfile(String useradminid) throws IOException{
        int i=0;
        
         String leaddata[]=new String[36];
          try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from businessprofile where useradminid=? ");
        smt.setString(1,useradminid);
       
        ResultSet rs=smt.executeQuery();
    
        while(rs.next())
        { 
           for(i=1;i<=34;i++)
        {
        leaddata[i]=rs.getString(i);
               }
         
        }
        
       rs.close();
      smt.close();
      con.close();
          } catch(Exception e){
              String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n BusinessProfileService.java-----\n"
              + "LINE=78\nselect * from businessprofile where useradminid=?";
              Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
              EmergencyEmail.send(e,errormsg); 
          }
          
          return leaddata;
    }
        
        }
