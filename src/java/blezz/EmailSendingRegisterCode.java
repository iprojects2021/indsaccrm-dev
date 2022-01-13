/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package blezz;

import email.EmergencyEmail;
import java.io.IOException;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import log.Log;




/**
 *
 * @author Sachin
 */
public class EmailSendingRegisterCode {
    
    
    public static   String getEmailRegisterCode1(String email,String fullname) throws IOException{
          Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Entering EmailSendingRegisterCode.java----->getEmailRegisterCode()-----");
       
     String host; 
     String port;
     String user;
     String pass;
     host="java02.hostingraja.org";port="587";user="noreply@indsaccrm.com";pass="polo9070321";
    HttpServletRequest request = null; 
    HttpServletResponse response=null;
      
        Random rand = new Random();
        int num = rand.nextInt(900000) + 100000;
        String recipient =email;
                //(String) session.getAttribute("email");
        String fname = fullname;
                //(String) session.getAttribute("fullname");
        String subject = "Verification OTP Code from INDSAC";
        String code = Integer.toString(num);
        String content = "Dear "+fname+",<br><br> Greetings from INDSAC!!!<br><br> You are just a step away from registration. Your Verification Code is <strong>"+Integer.toString(num)+"</strong> .The code is valid for 15 minutes and usable only once.<br><br> Once you have verified the code, you'll be registered immediately. This is to ensure that only you have access to your account.\n" 
                        +"<br><br><br><br> Thanks and Regards,<br><br> Indsac Team <br> INDSAC SOFTECH | indsac.com <br><br> Web: www.indsac.com <br><br><br><br> This is system generated Email Please do not reply to this Email. In case you have any query You can Email us at info@indsaccrm.com";
       
        String resultMessage = "",check="";
 
        try {
              Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" EmailSendingRegisterCode.java----->getEmailRegisterCode()-----try Before  EmailUtility.sendEmail");
       
            EmailUtility.sendEmail(host, port, user, pass, recipient, subject,
                    content);
             Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" EmailSendingRegisterCode.java----->getEmailRegisterCode()-----try After  EmailUtility.sendEmail");
       
            resultMessage = "OTP Verification code has been sent to<strong> "+recipient+"</strong> ";
            check="yes";
             
        } catch (Exception ex) {
         String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=blezz , File=EmailSendingRegisterCode.java , Email error-----\n"
    + "\nLINE=63\n     ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+ex);
     EmergencyEmail.send(ex,errormsg);
            resultMessage = "There is an error:  " + ex.getMessage();
            check="no";
        } 
        return code+":"+check+":"+resultMessage;
    }  
    
    
    public static   String getEmailEmployeeVerificationCode1(String email,String fullname) throws IOException{
     String host; 
     String port;
     String user;
     String pass;
     host="java02.hostingraja.org";port="587";user="noreply@indsaccrm.com";pass="polo9070321";
    HttpServletRequest request = null; 
    HttpServletResponse response=null;
      
        Random rand = new Random();
        int num = rand.nextInt(900000) + 100000;
        String recipient =email;
                //(String) session.getAttribute("email");
        String fname = fullname;
                //(String) session.getAttribute("fullname");
        String subject = "Verification OTP Code/Password from INDSAC";
        String code = Integer.toString(num);
        String content = "Dear "+fname+",<br><br> Greetings from INDSAC!!!<br><br> You are just a step away from registration. <br>Once you have verified the code, you'll be registered immediately. This is to ensure that only you have access to your account.\n" 
                        +"<br><a href='http://crm.indsac.com'>Click here</a> to login with your email and OTP Code as Password.  Your Verification Code/Password is <strong>"+Integer.toString(num)+"</strong><br><br><br> Thanks and Regards,<br><br> Indsac Team <br> INDSAC SOFTECH | indsac.com <br><br> Web: www.indsac.com <br><br><br><br> This is system generated Email Please do not reply to this Email. In case you have any query You can Email us at info@indsaccrm.com";
       
        String resultMessage = "",check="";
 
        try {
            EmailUtility.sendEmail(host, port, user, pass, recipient, subject,
                    content);
            resultMessage = "OTP Verification code has been sent to<strong> "+recipient+"</strong> ";
            check="yes";
             
        } catch (Exception ex) {
            String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=blezz , File=EmailSendingRegisterCode.java , Email error-----\n"
    + "\nLINE=104\n     ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+ex);
     EmergencyEmail.send(ex,errormsg);
            resultMessage = "There were an error: " + ex.getMessage();
            check="no";
        } 
        return code+":"+check+":"+resultMessage;
    } 
    
    public static   String getEmailRegisterCode(String email,String fullname) throws IOException{
        String resultMessage = "",check="";
        Random rand = new Random();
        int num = rand.nextInt(900000) + 100000;     
        String code = Integer.toString(num);
         resultMessage = "Please enter security code <strong>"+code+"</strong>  ";
            check="yes";
    return  code+":"+check+":"+resultMessage;
    }
    
    public static   String getEmailEmployeeVerificationCode(String email,String fullname) throws IOException{
        String resultMessage = "",check="";
        Random rand = new Random();
        int num = rand.nextInt(900000) + 100000;     
        String code = Integer.toString(num);
         resultMessage = "Please share security code <strong>"+code+"</strong> as password while login with "+email;
            check="yes";
        return  code+":"+check+":"+resultMessage;
    }
    
}
