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
import java.sql.Statement;
import log.Log;

/**
 *
 * @author Dell
 */
public class Default {
    
    public static int createDefault(String usercid_adminid,String usercid_id) throws IOException{
   int result='0';String SR="0";
   java.util.Date date=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime()); 
       
        try{ 
            ResultSet rs3; 
        Connection con=Poul.getConnectionCRM();
        Statement st=con.createStatement();
                    rs3 = st.executeQuery("select  id   FROM defaultvalues ORDER BY id DESC LIMIT 1 ");
    while(rs3.next())
        
          {SR=rs3.getString(1); }
     int i = Integer.parseInt( SR ); 
           ++i; 
           SR=Integer.toString(i);

        st.addBatch("insert into defaultvalues values('"+i+"','"+sqlTime+"','"+usercid_adminid+"','"+usercid_id+"','InActive','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','')");          
    
         st.executeBatch();
       
      st.close();
      con.close();
         Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=Default.java  method=createDefault('"+usercid_adminid+"','"+usercid_id+"') ");
   result=1;
       }
        catch(Exception e){
              String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Expense.java , method=getAllDistinctCategoryCount(String useradminid)-----\n"
    + "\nLINE=43 \n insert into defaultvalues (useradminid,usercid) VALUES ('"+SR+"','"+usercid_adminid+"','"+usercid_id+"')  ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
               
    }
    return result;}
    
        public static int isDefaultExist(String usercid_adminid,String usercid_id) throws IOException{
   String result="0";int i ='0';
 try{ 
      Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(id) from defaultvalues where useradminid=? and usercid=?  ");
       smt.setString(1,usercid_adminid);
        smt.setString(2,usercid_id);
        ResultSet rs=smt.executeQuery();
       while(rs.next()){
             result=(rs.getString(1)); 
       }
          rs.close();
      smt.close();
      con.close();i= Integer.parseInt(result); 
         Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=Default.java  method=isDefaultExist('"+usercid_adminid+"','"+usercid_id+"') count="+result+" ");
  
       }
        catch(Exception e){
              String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Default.java ,  method=isDefaultExist('"+usercid_adminid+"','"+usercid_id+"')-----\n"
    + "\nLINE=67 \n select count(id) from defaultvalues where useradminid=="+usercid_adminid+" and usercid=="+usercid_id+" ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
    return i;}
   
    public static String getDefaultInvoiceSettingCity(String usercid_adminid,String usercid_id) throws IOException{
    String result="";
        try{ 
      Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select invoicedefaultcity from defaultvalues where useradminid=? and usercid=?  ");
       smt.setString(1,usercid_adminid);
        smt.setString(2,usercid_id);
        ResultSet rs=smt.executeQuery();
       while(rs.next()){
             result=(rs.getString(1)); 
       }
          rs.close();
      smt.close();
      con.close();
         Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=Default.java  method=getDefaultInvoiceSettingCity('"+usercid_adminid+"','"+usercid_id+"') result="+result+" ");
  
       }
        catch(Exception e){
              String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Default.java ,  method=getDefaultInvoiceSettingCity('"+usercid_adminid+"','"+usercid_id+"')-----\n"
    + "\nLINE=102 \n select invoicedefaultcity from defaultvalues where useradminid=="+usercid_adminid+" and usercid=="+usercid_id+" ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
    return result;}
    
    public static int updateInvoiceSettingStatus(String usercid_adminid,String usercid_id,String City) throws IOException{
   int result='0';
   java.util.Date date=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());  
        try{ 
           
        Connection con=Poul.getConnectionCRM();
        Statement st=con.createStatement();
         st.addBatch("update defaultvalues set  invoicedefaultcity='"+City+"' where useradminid="+usercid_adminid+" and usercid="+usercid_id+" ");
       st.executeBatch();
       
      st.close();
      con.close();
         Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=Default.java  method=updateInvoiceSettingStatus('"+usercid_adminid+"','"+usercid_id+"','"+City+") ");
   result=1;
       }
        catch(Exception e){
              String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Default.java , method=updateInvoiceSettingStatus(String usercid_adminid,String usercid_id,String City)-----\n"
    + "\nLINE=127 \n update defaultvalues set  invoicedefaultcity="+City+" where useradminid="+usercid_adminid+" and usercid="+usercid_id+"   ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
    // EmergencyEmail.send(e,errormsg); 
                } 
    return result;}
    
    
}
