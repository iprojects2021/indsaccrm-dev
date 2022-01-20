/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package menu;

import blezz.Nd;
import blezz.Poul;
import email.EmergencyEmail;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import log.Log;

/**
 *
 * @author HP
 */
public class Register {
    
    public static String getByEmail(String email) throws IOException{
             Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=Register.java  method=getByEmail(String eamil) entered email="+email+"");
      
        String usercid="",useradminid="";
        try{ 
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select id,useradminid from register where email=?");
      
        smt.setString(1,email);
        ResultSet rs=smt.executeQuery();
        
        while(rs.next()){
            usercid=rs.getString(1);
            System.out.println(usercid);
            useradminid=rs.getString(2);
            System.out.println(useradminid);
        }
                
        rs.close();
      smt.close();
      con.close();
           Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=menu ,  Page=Register.java  method=getByEmail(String eamil) email="+email+"");
       }
        catch(Exception e){
              String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=menu , File=Register.java , method=getByEmail(String email)-----\n"
    + "\nLINE=50 \n select count(category) from expense where useradminid=="+useradminid+"  ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
     EmergencyEmail.send(e,errormsg); 
                }
        String enctype=Nd.Encrypt("type");
        String encTypeValue=Nd.Encrypt("resetpassword");
        
        String url=Poul.getProdServerLink()+"Resetpassword/"+Nd.Encrypt("email")+"="+Nd.Encrypt(email)+"&"+
                Nd.Encrypt("user")+"="+Nd.Encrypt(usercid)+"&"+
                Nd.Encrypt("admin")+"="+Nd.Encrypt(useradminid)+"&"+
                enctype+"="+encTypeValue;
                System.out.println("New URL="+url);
              
        System.out.println("usercid="+usercid+",useradminid="+useradminid);
        return usercid;
    }
    
}
