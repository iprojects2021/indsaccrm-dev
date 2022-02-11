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
import java.sql.SQLException;
import java.sql.Statement;
import log.Log;
import org.apache.commons.io.FileUtils;

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
    + "\nLINE=45 \n select count(category) from expense where useradminid=="+useradminid+"  ";
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
              + "LINE=82\nselect * from businessprofile where useradminid=?";
              Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
              EmergencyEmail.send(e,errormsg); 
          }
         return leaddata;
    }
    
      public static String saveBusinessProfileLogotoDB(String useradminid,String usercid,String businessprofileid,String logo ) throws IOException{
        
       try{
           Connection c=Poul.getConnectionCRM();

        Statement st=c.createStatement(); 
        st.addBatch("update businessprofile set   logo='"+logo+"'  where id='"+businessprofileid+"' and useradminid='"+useradminid+"' ");
         
        String logstatus="File Upload";
        st.addBatch("insert into businessprofilelog (usercid,useradminid,businessprofileid,logo,updatestatus) values ('"+usercid+"','"+useradminid+"','"+businessprofileid+"','"+logo+"','Profile Image Uploaded') ");
       
        st.executeBatch(); 
        Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  ,File=BusinessProfileService.java method=saveBusinessProfileLogotoDB() ,useradminid="+useradminid+" ,usercid="+usercid+",filename="+logo+",id="+businessprofileid+", Business Profile name Saved to DB Successfully");
       
        st.close();
        c.close();    }
        catch(SQLException e)
        {
       String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n Package=menu , File=BusinessProfileService.java , method=saveBusinessProfileLogotoDB( useradminid="+useradminid+" ,usercid="+usercid+",filename="+logo+",id="+businessprofileid+")-----\n"
       + "LINE=108 \n update businessprofile set   logo='"+logo+"'  where id='"+businessprofileid+"' and useradminid='"+useradminid+"'  ";
       Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
       EmergencyEmail.send(e,errormsg);
    }
            return "true";
  }
      
         public static String getBusinessProfileLogo(String usercid_adminid) throws IOException{
       String result="0";
       try{ 
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("SELECT logo FROM businessprofile where useradminid=?  ");
      
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
     Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=BusinessProfileService.java  , method=getBusinessProfileLogo(String usercid_adminid) result="+result+"  ");
      }
        catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=BusinessProfileService.java , method=getBusinessProfileLogo(String usercid_adminid)-----\n"
    + "\nLINE=135 \n SELECT logo FROM businessprofile where useradminid="+usercid_adminid+"    ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                }
       String filenames[]=result.split(";");
     result=filenames[0];
            
       String source = Poul.getDirPath()+java.io.File.separator+"files"+java.io.File.separator+ result;
         String  dest=Poul.getProjectPath()+java.io.File.separator+"uploads"+java.io.File.separator+ "logo"+java.io.File.separator+result;
 java.io.File sourcefile = new java.io.File(source);
          java.io.File destfile = new java.io.File(dest);
            if (!destfile.exists()){
        try {   FileUtils.copyFile(sourcefile, destfile);
    } catch (IOException e) {
   String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=BusinessProfileService.java -----\n"
    + "\nLINE=150 \n  useradminid=="+usercid_adminid+"  ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
        }
      }
       return result;
    }         
   }
