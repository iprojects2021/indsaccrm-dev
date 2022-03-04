/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package email;

import blezz.EmailUtility;
import blezz.Nd;
import com.oreilly.servlet.multipart.ExceededSizeException;
import java.io.IOException;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import log.Log;

/**
 *
 * @author Dell
 */
public class EmergencyEmail {
    
      public static   void send1(Exception exception,String message) throws IOException{
          Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Entering EmergencyEmail.java----->send()-----");
       
     String host; 
     String port;
     String user;
     String pass;
   //host="smtp.gmail.com";port="587";user="indsaccrmservice@gmail.com";pass="polo9070321";
  
      host="103.92.235.138";port="465";user="emergency@indsaccrm.com";
      pass=Nd.Decrypt("2a2e2a656d657267656e637940323032316d61696c");
    HttpServletRequest request = null; 
    HttpServletResponse response=null;
      
        Random rand = new Random();
        int num = rand.nextInt(900000) + 100000;
        String recipient ="sachin2222choudhary@gmail.com";
                //(String) session.getAttribute("email");
        
                //(String) session.getAttribute("fullname");
        String subject = "Emergency: APP:INDSACCRM Required immediate attention!!!!!!";
        String code = Integer.toString(num);
        String content = "Hi ,<br><br> Error!!!<br><br>"+message+"<br><br>"+exception+" \n" 
                        +"<br><br><br><br> Thanks and Regards,<br><br> Indsac Team <br> INDSAC SOFTECH | indsac.com <br><br> Web: www.indsac.com <br><br><br><br> This is system generated Email Please do not reply to this Email. In case you have any query You can Email us at support@indsacrm.com";
       
        String resultMessage = "",check="";
 
        try {
              Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" EmergencyEmail.java----->insidetry-----try Before  EmailUtility.sendEmail");
       
            EmailUtility.sendEmail(host, port, user, pass, recipient, subject,
                    content);
             Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" EmergencyEmail.java----->send()-----try After  EmailUtility.sendEmail");
       
            
             
        } catch (Exception ex) {
             Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" EmergencyEmail.java----->send()-----Email error"+ex);
       
            
        } 
        
    }  
    
   public static   void send(Exception exception,String message) throws IOException{
         Log.writeLogWarn("CRITICAL ERROR : "+java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n message="+message+" ,\n exception="+exception);
    } 
}
