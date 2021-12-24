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
public class Email {
    
    public static int getRecipientsCount(String useradminid,String timestamp) throws IOException{
      int n1=0; String count="0";
        try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(id) from sentmail where useradminid=? and timestamp=?");
      
        smt.setString(1,useradminid);
         smt.setString(2,timestamp);
        ResultSet rs=smt.executeQuery();
        
        while(rs.next()){
            
               count=(rs.getString(1)); 
               
        }
          Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu , File=Email.java , method=getRecipientsCount(String useradminid) count="+count+" ");
  
          rs.close();
      smt.close();
      con.close();
        n1=Integer.parseInt(count);
       }
        catch(Exception e){
              String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Email.java , method=getRecipientsCount(String useradminid)-----\n"
    + "\nLINE=103\n select count(id) from sentmail where useradminid="+useradminid+"  and timestamp="+timestamp+" ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
        return n1;
    
     }
    
        public static String[] getAllRecipients(String useradminid,String timestamp,int count) throws IOException{
      int n1=1; String data[]=new String[count+3];
        try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select recipient_email from sentmail where useradminid=? and timestamp=?");
      
        smt.setString(1,useradminid);
         smt.setString(2,timestamp);
        ResultSet rs=smt.executeQuery();
        
        while(rs.next()){
            
               data[n1]=(rs.getString(1)); 
               ++n1;
        }
          rs.close();
      smt.close();
      con.close();
        
       }
        catch(Exception e){
              String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=blezz , File=Db.java , method=getAllEmployeeCount(String useradminid)-----\n"
    + "\nLINE=103\n select count(id) from sentmail where useradminid="+useradminid+"  and timestamp="+timestamp+" ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
        return data;
    
     }
        
        public static int checkDuplicateEmailSetting(String useradminid,String email) throws IOException{
            String count="0";
             try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from emailsetting where useradminid=? and email=?");
      
        smt.setString(1,useradminid);
         smt.setString(2,email);
        ResultSet rs=smt.executeQuery();
        
        while(rs.next()){
            
              count=(rs.getString(1)); 
              
        }
          rs.close();
      smt.close();
      con.close();
        
       }
        catch(Exception e){
              String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Email.java , method=checkDuplicateEmailSetting(String useradminid,String email)-----\n"
    + "\nLINE=110\n select count(*) from emailsetting where useradminid="+useradminid+"  and email="+email+" ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
        
        return Integer.parseInt(count);
        }
        
          public static int checkAnyEmailActive(String useradminid,String usercid) throws IOException{
            String count="0";
             try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from emailsetting where useradminid=? and usercid=? and status=?");
      
        smt.setString(1,useradminid);
         smt.setString(2,usercid);
           smt.setString(3,"Active");
        ResultSet rs=smt.executeQuery();
        
        while(rs.next()){
            
              count=(rs.getString(1)); 
              
        }
          rs.close();
      smt.close();
      con.close();
        
       }
        catch(Exception e){
              String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Email.java , method=checkDuplicateEmailSetting(String useradminid,String email)-----\n"
    + "\nLINE=110\n select count(*) from emailsetting where useradminid="+useradminid+"  and email="+usercid+" ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
        
        return Integer.parseInt(count);
        }
          
          public static int getCountAllEmailFromEmailSetting(String useradminid,String usercid) throws IOException{
            String count="0";
             try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from emailsetting where useradminid=? and usercid=? ");
      
        smt.setString(1,useradminid);
         smt.setString(2,usercid);
          
        ResultSet rs=smt.executeQuery();
        
        while(rs.next()){
            
              count=(rs.getString(1)); 
              
        }
          rs.close();
      smt.close();
      con.close();
        
       }
        catch(Exception e){
              String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Email.java , method=checkDuplicateEmailSetting(String useradminid,String email)-----\n"
    + "\nLINE=110\n select count(*) from emailsetting where useradminid="+useradminid+"  and email="+usercid+" ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
       return Integer.parseInt(count);
         
        }
          
     public static String[][] getAllEmailFromEmailSetting(String useradminid,String usercid,int count) throws IOException{
            
             String data[][]=new String [count+1][5];
             try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select id,timestamp,email,status from emailsetting where useradminid=? and usercid=? ");
      
        smt.setString(1,useradminid);
         smt.setString(2,usercid);
          
        ResultSet rs=smt.executeQuery();
        int i=1,j=1;
       while(rs.next()){
            
            for(j=1;j<=4;j++){
               data[i][j]=(rs.getString(j)); 
            }
            i++;
               
        }
          rs.close();
      smt.close();
      con.close();
        
       }
        catch(Exception e){
              String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Email.java , method=checkDuplicateEmailSetting(String useradminid,String email)-----\n"
    + "\nLINE=110\n select count(*) from emailsetting where useradminid="+useradminid+"  and email="+usercid+" ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
       return data;
         
        }
     
      public static String statusEmailStatusColor(String colortype){
    String color="";
    
     if("Active".equalsIgnoreCase(colortype)){return "info";}
       if("InActive".equalsIgnoreCase(colortype)){return "warning";}
    else { return "";}
    }
      public static String[] getEmailSettingDetail(String useradminid,String usercid,String id) throws IOException{
            
             String data[]=new String[20];
             try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from emailsetting where useradminid=? and usercid=? and id=? ");
      
        smt.setString(1,useradminid);
         smt.setString(2,usercid);
          smt.setString(3,id);
        ResultSet rs=smt.executeQuery();
        int i=1,j=1;
       while(rs.next()){
            
            for(j=1;j<=19;j++){
               data[j]=(rs.getString(j)); 
            }
          
               
        }
          rs.close();
      smt.close();
      con.close();
        
       }
        catch(Exception e){
              String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Email.java , method=checkDuplicateEmailSetting(String useradminid,String email)-----\n"
    + "\nLINE=110\n select count(*) from emailsetting where useradminid="+useradminid+"  and email="+usercid+" ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
       return data;
         
        }
    public static String getActiveEmailFromMailSetting(String useradminid,String usercid) throws IOException{
            String count="0";
             try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select email from emailsetting where useradminid=? and usercid=? and status=?");
      
        smt.setString(1,useradminid);
         smt.setString(2,usercid);
           smt.setString(3,"Active");
        ResultSet rs=smt.executeQuery();
        
        while(rs.next()){
            
              count=(rs.getString(1)); 
              
        }
          rs.close();
      smt.close();
      con.close();
        
       }
        catch(Exception e){
              String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Email.java , method=getActiveEmailFromMailSetting(String useradminid,String usercid)-----\n"
    + "\nLINE=284\n select email from emailsetting where useradminid="+useradminid+"  and email="+usercid+" ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
        
        return (count);
        }  
     public static int getCountAllEmailHistFromEmailSetting(String useradminid,String usercid) throws IOException{
            String count="0";
             try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from emailsettinglog where useradminid=? and usercid=? ");
      
        smt.setString(1,useradminid);
         smt.setString(2,usercid);
          
        ResultSet rs=smt.executeQuery();
        
        while(rs.next()){
            
              count=(rs.getString(1)); 
              
        }
          rs.close();
      smt.close();
      con.close();
        
       }
        catch(Exception e){
              String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Email.java , method=checkDuplicateEmailSetting(String useradminid,String email)-----\n"
    + "\nLINE=110\n select count(*) from emailsettinglog where useradminid="+useradminid+"  and email="+usercid+" ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
       return Integer.parseInt(count);
         
        }   
     
      public static String[][] getAllEmailHistFromEmailSetting(String useradminid,String usercid,int count) throws IOException{
            
             String data[][]=new String [count+1][12];
             try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from emailsettinglog where useradminid=? and usercid=? ");
      
        smt.setString(1,useradminid);
         smt.setString(2,usercid);
          
        ResultSet rs=smt.executeQuery();
        int i=1,j=1;
       while(rs.next()){
            
            for(j=1;j<=11;j++){
               data[i][j]=(rs.getString(j)); 
            }
            i++;
               
        }
          rs.close();
      smt.close();
      con.close();
        
       }
        catch(Exception e){
              String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Email.java , method=getAllEmailHistFromEmailSetting(String useradminid,String usercid,int count) -----\n"
    + "\nLINE=110\n select * from emailsettinglog where useradminid="+useradminid+"  and usercid="+usercid+" ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
       return data;
         
        }
       public static String[] getActiveEmailSettingDetail(String useradminid,String usercid) throws IOException{
            
             String data[]=new String[5];
             try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select email,password,outgoingserver,port from emailsetting where useradminid=? and usercid=? and status=? ");
      
        smt.setString(1,useradminid);
         smt.setString(2,usercid);
          smt.setString(3,"Active");
        ResultSet rs=smt.executeQuery();
        int i=1,j=1;
       while(rs.next()){
            
            for(j=1;j<=4;j++){
               data[j]=(rs.getString(j)); 
            }
          
               
        }
          rs.close();
      smt.close();
      con.close();
        
       }
        catch(Exception e){
              String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Email.java , method=checkDuplicateEmailSetting(String useradminid,String email)-----\n"
    + "\nLINE=386\n select email,password,outgoingserver,port from emailsetting where useradminid="+useradminid+"  and usercid="+usercid+" ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
       return data;
         
        }
}

