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
 * @author IndsacCrm
 */
public class ServiceRequest {
    
//dashboard.jsp    Pending by Due Dates SR  
 public static int getSRPendingDueDatesCount(String usercid_adminid,String usercid_id) throws IOException{

     String count1="0";  java.util.Date date123=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date123.getTime());
      String curday11=sqlDate.toString(); 
        String duedate=curday11+" 23:59:59"; 
   try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from servicerequest where useradminid=? AND asignedto=? and  duedate<=? and (status=? or status=? or status=?) ");
        smt.setString(1,usercid_adminid);
        smt.setString(2,usercid_id);
        smt.setString(3,duedate);
         smt.setString(4,"Open");
        smt.setString(5,"Follow Up");
        smt.setString(6,"In Process");
        ResultSet rs=smt.executeQuery();
        
        while(rs.next()){  count1=rs.getString(1);  }
       rs.close();
      smt.close();
      con.close();
      Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"Package=menu ,  Page=ServiceRequest.java  Method=getSRPendingDueDatesCount("+usercid_adminid+","+usercid_id+") Count="+count1+" ");
  
   } catch(Exception e){
                   String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n Package=menu ,  Page=ServiceRequest.java \n  Method=getSRPendingDueDatesCount(String adminid) \n"
     + "LINE=48\n select count(*) from servicerequest where  where useradminid="+usercid_adminid+" AND asignedto= "+usercid_id+" and duedate='"+duedate+" and (status=Open or status=? or status=?) ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
      
      }
 return Integer.parseInt(count1);
 }
    
}
