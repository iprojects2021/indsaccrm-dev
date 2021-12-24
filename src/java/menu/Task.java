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
 * @author Dell
 */
public class Task {
    //dashboard.jsp    Pending by Due Dates Task  
 public static int getTaskPendingDueDatesCount(String usercid_adminid,String usercid_id) throws IOException{

     String count1="0";  java.util.Date date123=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date123.getTime());
      String curday11=sqlDate.toString(); 
        String duedate=curday11+" 23:59:59"; 
   try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from task where useradminid=? AND assign=? and  duedate<=? and (status=? or status=? or status=?) ");
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
      Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"Package=menu ,  Page=Task.java  Method=getTaskPendingDueDatesCount("+usercid_adminid+","+usercid_id+") Count="+count1+" ");
  
   } catch(Exception e){
                   String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n Package=menu ,  Page=Task.java \n  Method=getTaskPendingDueDatesCount(String adminid) \n"
     + "LINE=48\n select count(*) from task where  where useradminid="+usercid_adminid+" AND asignedto= "+usercid_id+" and duedate='"+duedate+" and (status=Open or status=? or status=?) ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
      
      }
 return Integer.parseInt(count1);}
  
     //dashboard.jsp    Pending by Due Dates Task  
 public static int getMyOpenTaskCount(String usercid_adminid,String usercid_id) throws IOException{

     String count1="0"; 
   try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from task where useradminid=? AND assign=?  and (status=? or status=? or status=?) ");
        smt.setString(1,usercid_adminid);
        smt.setString(2,usercid_id);
       
         smt.setString(3,"Open");
        smt.setString(4,"Follow Up");
        smt.setString(5,"In Process");
        ResultSet rs=smt.executeQuery();
        
        while(rs.next()){  count1=rs.getString(1);  }
       rs.close();
      smt.close();
      con.close();
      Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"Package=menu ,  Page=Task.java  Method=getMyOpenTaskCount("+usercid_adminid+","+usercid_id+") Count="+count1+" ");
  
   } catch(Exception e){
                   String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n Package=menu ,  Page=Task.java \n  Method=getMyOpenTaskCount(String adminid) \n"
     + "LINE=77\n select count(*) from task where  where useradminid="+usercid_adminid+" AND asignedto= "+usercid_id+" and  (status=Open or status=? or status=?) ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
      
      }
 return Integer.parseInt(count1);}
 
  public static String saveTaskFileNametoDB(String useradminid,String usercid,String id,String filename) throws IOException{
        
       try{
     Connection c=Poul.getConnectionCRM();

Statement st=c.createStatement(); 
     st.addBatch("update task set   uploadfile='"+filename+"'  where id='"+id+"' and useradminid='"+useradminid+"' ");
 ResultSet rs3;
     rs3 = st.executeQuery("select  max(id)  FROM tasklog  ");
  String SR="0";
      while(rs3.next())
        
          {SR=rs3.getString(1);
          
          }
          int  i = Integer.parseInt( SR ); 
           ++i;  
           java.util.Date date=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());
        
        
       String logstatus="File Upload";
          st.addBatch("insert into tasklog values('"+i+"','"+sqlTime+"','"+id+"','','"+sqlTime+"','','','"+filename+"','"+useradminid+"','"+usercid+"','','','','"+logstatus+"','','','','','','','','','','','','','','','','','','','')");
       
     st.executeBatch(); 
    Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  ,File=Task.java method=saveTaskFileNametoDB() ,useradminid="+useradminid+" ,usercid="+usercid+",filename="+filename+",id="+id+", Task File name Saved to DB Successfully");
       
      st.close();
      c.close();    }
        catch(SQLException e)
        {
      String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n Package=menu , File=Task.java , method=saveTaskFileNametoDB( useradminid="+useradminid+" ,usercid="+usercid+",filename="+filename+",id="+id+")-----\n"
     + "LINE=120 \n update task set   uploadfile='"+filename+"'  where id='"+id+"' and useradminid='"+useradminid+"'  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
     
        }
    return "true";}
 
 
}

