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
import java.util.concurrent.TimeUnit;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import log.Log;
import org.apache.commons.io.FileUtils;

/**
 *
 * @author Dell
 */
public class AdminDefaultValues {
     public static int createAdminDefault(String usercid_adminid) throws IOException{
   int result='0';String SR="0";
   java.util.Date date=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());  
        try{ 
            ResultSet rs3; 
        Connection con=Poul.getConnectionCRM();
        Statement st=con.createStatement();
                    rs3 = st.executeQuery("select  id   FROM admindefaultvalues ORDER BY id DESC LIMIT 1 ");
    while(rs3.next())
        
          {SR=rs3.getString(1); }
     int i = Integer.parseInt( SR ); 
           ++i; 
           SR=Integer.toString(i);

        st.addBatch("insert into admindefaultvalues values('"+i+"','"+sqlTime+"','"+usercid_adminid+"','','def','','','dollar','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','')");          
    
         st.executeBatch();
       
      st.close();
      con.close();
         Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=AdminDefaultValues.java  method=createAdminDefault('"+usercid_adminid+"') ");
   result=1;
       }
        catch(Exception e){
              String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , Page=AdminDefaultValues.java  method=admindefaultvalues('"+usercid_adminid+"')-----\n"
    + "\nLINE=52 \n insert into admindefaultvalues (useradminid,usercid) VALUES ('"+SR+"','"+usercid_adminid+"')  ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
    return result;}

  public static int isAdminDefaultExist(String usercid_adminid) throws IOException{
   String result="0";int i ='0';
 try{ 
      Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(id) from admindefaultvalues where useradminid=?   ");
       smt.setString(1,usercid_adminid);
        ResultSet rs=smt.executeQuery();
       while(rs.next()){
             result=(rs.getString(1)); 
       }
          rs.close();
      smt.close();
      con.close();i= Integer.parseInt(result); 
         Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=AdminDefaultValues.java  method=isAdminDefaultExist('"+usercid_adminid+"') count="+result+" ");
  
       }
        catch(Exception e){
              String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=AdminDefaultValues.java ,  method=admindefaultvalues('"+usercid_adminid+"')-----\n"
    + "\nLINE=76 \n select count(id) from admindefaultvalues where useradminid=="+usercid_adminid+"  ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
    return i;}
public static String saveInvoiceLogotoDB(String useradminid,String usercid,String filename) throws IOException{
        
       try{
     Connection c=Poul.getConnectionCRM();

Statement st=c.createStatement(); 
     st.addBatch("update admindefaultvalues set   invoicelogofile='"+filename+"'  where  useradminid='"+useradminid+"'  ");
 ResultSet rs3;
     rs3 = st.executeQuery("select  max(id)  FROM admindefaultvalueslog  ");
  String SR="0";
      while(rs3.next())
        
          {SR=rs3.getString(1);
          
          }
          int  i = Integer.parseInt( SR ); 
           ++i;  
           java.util.Date date=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());
        

       String logstatus="Receipt Upload";
             st.addBatch("insert into admindefaultvalueslog values('"+i+"','"+sqlTime+"','"+useradminid+"','"+usercid+"','Uploaded Invoice Logo','"+filename+"','','','','','','','','','','','','','','','','','','','','','','','','','','','')");
       
     st.executeBatch(); 
    Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  ,File=AdminDefaultValues.java method=saveInvoiceLogotoDB() ,useradminid="+useradminid+" ,usercid="+usercid+",filename="+filename+", Invoice Logo Saved to DB Successfully");
       
      st.close();
      c.close();    }
        catch(SQLException e)
        {
      String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n Package=menu , File=AdminDefaultValues.java , method=saveInvoiceLogotoDB(String useradminid,String usercid,String id,String filename)-----\n"
     + "LINE=114 \n update admindefaultvalues set   invoicelogofile='"+filename+"'  where  useradminid='"+useradminid+"'  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
     
        }
    return "true";}

     public static String getAdminInvoiceLogo(String usercid_adminid) throws IOException{
       String result="0";
       try{ 
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("SELECT invoicelogofile FROM admindefaultvalues where useradminid=?  ");
      
        smt.setString(1,usercid_adminid);
        ResultSet rs=smt.executeQuery();
        int i=1,j=1;
        while(rs.next()){
           result=rs.getString(1);
       }
        rs.close();
      smt.close();
      con.close();
      if(result==null|| "".equals(result)){result="0";}
     Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=AdminDefaultValues.java  , method=getAdminInvoiceLogo(String usercid_adminid) result="+result+"  ");
      }
        catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=AdminDefaultValues.java , method=getAdminInvoiceLogo(String usercid_adminid)-----\n"
    + "\nLINE=141 \n SELECT invoidelogofile FROM admindefaultvalues where useradminid="+usercid_adminid+"    ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
       return result;
      
     }     
     public static String saveInvoiceCurrency(String useradminid,String currency,HttpServletRequest request) throws IOException{
        
       try{
     Connection c=Poul.getConnectionCRM();

Statement st=c.createStatement(); 
     st.addBatch("update admindefaultvalues set   currency='"+currency+"'  where  useradminid='"+useradminid+"'  ");
    
     st.executeBatch(); 
    Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  ,File=AdminDefaultValues.java method=saveInvoiceCurrency() ,useradminid="+useradminid+"  Invoice Currency="+currency+" Saved to DB Successfully");
       
      st.close();
      c.close();    }
        catch(SQLException e)
        {
      String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n Package=menu , File=AdminDefaultValues.java , method=saveInvoiceCurrency(String useradminid,String usercid,String id,String filename)-----\n"
     + "LINE=164 \n update admindefaultvalues set    currency='"+currency+"' where  useradminid='"+useradminid+"'  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
     
        }
       HttpSession session1 = request.getSession();
       session1.setAttribute("usercid_currency", currency);
    return "true";}
 public static String getInvoiceCurrency(String usercid_adminid) throws IOException{
       String result="";
       try{ 
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("SELECT currency FROM admindefaultvalues where useradminid=?  ");
      
        smt.setString(1,usercid_adminid);
        ResultSet rs=smt.executeQuery();
        int i=1,j=1;
        while(rs.next()){
           result=rs.getString(1);
       }
        rs.close();
      smt.close();
      con.close();
      if(result==null|| "".equals(result)){result="dollar";}
     Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=AdminDefaultValues.java  , method=getInvoiceCurrency(String usercid_adminid) result="+result+"  ");
      }
        catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=AdminDefaultValues.java , method=getInvoiceCurrency(String usercid_adminid)-----\n"
    + "\nLINE=190 \n SELECT currency FROM admindefaultvalues where useradminid="+usercid_adminid+"    ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
       return result;
      
     }   
 public static String getDefaultCity(String usercid_adminid,String usercid_id) throws IOException{
   String result="";
 try{ 
      Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select invoicedefaultcity from defaultvalues where  useradminid=? and usercid=?   ");
       smt.setString(1,usercid_adminid);
       smt.setString(2,usercid_id);
        ResultSet rs=smt.executeQuery();
       while(rs.next()){
             result=(rs.getString(1)); 
       }
          rs.close();
      smt.close();
      con.close();
         Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=AdminDefaultValues.java  method=getDefaultCity(String usercid_adminid,String usercid_id) result="+result+" ");
  
       }
        catch(Exception e){
              String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=AdminDefaultValues.java ,  method=getDefaultCity(String usercid_adminid,String usercid_id)-----\n"
    + "\nLINE=214 \n select invoicedefaultcity from defaultvalues  where useradminid=="+usercid_adminid+" and usercid=="+usercid_id+"  ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                } 
    return result;}
 
 public static String doInvoiceLogoReady(String usercid_adminid) throws IOException{
 String result="";
 try{ 
      Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select invoicelogofile from admindefaultvalues where  useradminid=?    ");
       smt.setString(1,usercid_adminid);
        ResultSet rs=smt.executeQuery();
       while(rs.next()){
             result=(rs.getString(1)); 
       }
          rs.close();
      smt.close();
      con.close();
         Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=AdminDefaultValues.java  method=doInvoiceLogoReady(String usercid_adminid) result="+result+" ");
  
       }
        catch(Exception e){
              String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=AdminDefaultValues.java ,  method=doInvoiceLogoReady(String usercid_adminid)-----\n"
    + "\nLINE=242 \n select invoicedefaultcity from defaultvalues  where useradminid=="+usercid_adminid+"  ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                }
 if("0".equals(result) || "".equals(result)||result==null) {result="0"; }else{
 result=result.substring(0, result.length()-1);
            
     String source = Poul.getDirPath()+java.io.File.separator+"files"+java.io.File.separator+ result;
         String  dest=Poul.getProjectPath()+java.io.File.separator+"uploads"+java.io.File.separator+ "logo"+java.io.File.separator+result;
 java.io.File sourcefile = new java.io.File(source);
          java.io.File destfile = new java.io.File(dest);
            if (!destfile.exists()){
        try {   FileUtils.copyFile(sourcefile, destfile);
    } catch (IOException e) {
                    String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=AdminDefaultValues.java , Type=Files, Filename="+result+"-----\n"
    + "\nLINE=256 \n  useradminid=="+usercid_adminid+"  ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
        }
        result="true"; 
      }
 } 
    return result;
 }
 
}
