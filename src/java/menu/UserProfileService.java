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
import org.apache.commons.io.FileUtils;

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
              + "LINE=49\nselect * from register where useradminid=?";
              Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
              EmergencyEmail.send(e,errormsg); 
          }
          
          return leaddata;
    }
      
      public static String saveUserProfileLogotoDB(String useradminid,String usercid,String registerid,String logo ) throws IOException{
        
       try{
           Connection c=Poul.getConnectionCRM();

          Statement st=c.createStatement(); 
          st.addBatch("update register set  logo='"+logo+"'  where id='"+registerid+"' and useradminid='"+useradminid+"' ");
         
          String logstatus="File Upload";
          st.addBatch("insert into registerlog (useradminid,registerid,usercid,logo,updatestatus) values('"+useradminid+"','"+registerid+"', '"+usercid+"','"+logo+"','Profile Image Uploaded') ");
       
        st.executeBatch(); 
         Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  ,File=UserProfileService.java method=saveUserProfileLogotoDB() ,useradminid="+useradminid+" ,usercid="+usercid+",filename="+logo+",id="+registerid+", User Profile name Saved to DB Successfully");
       
      st.close();
      c.close();    }
        catch(SQLException e)
        {
      String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n Package=menu , File=UserProfileService.java , method=saveUserProfileLogotoDB( useradminid="+useradminid+" ,usercid="+usercid+",filename="+logo+",id="+registerid+")-----\n"
     + "LINE=76 \n update register set   logo='"+logo+"'  where id='"+registerid+"' and useradminid='"+useradminid+"'  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
     
        }
    return "true";
      }
      
         public static String getUserProfileLogo(String usercid_adminid) throws IOException{
       String result="0";
       try{ 
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("SELECT logo FROM register where useradminid=?  ");
      
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
     Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=UserProfileService.java  , method=getUserProfileLogo(String usercid_adminid) result="+result+"  ");
      }
        catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=UserProfileService.java , method=getUserProfileLogo(String usercid_adminid)-----\n"
    + "\nLINE=104 \n SELECT logo FROM register where useradminid="+usercid_adminid+"    ";
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
   String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=UserProfileService.java -----\n"
    + "\nLINE=119 \n  useradminid=="+usercid_adminid+"  ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
        }
            }
       return result;
      
     } 
    
    
    }
    

