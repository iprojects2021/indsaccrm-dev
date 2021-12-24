/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package email;

import blezz.EmailUtility;
import blezz.Nd;
import blezz.Poul;
import java.io.IOException;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import log.Log;

/**
 *
 * @author Dell
 */
public class Contactformsubmittresponse {
    
        public static   void sendtoClient(String clientmail,String businessname,String customername) throws IOException{
          Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Entering Contactformsubmittresponse.java----->sendtoClient()-----");
       
     String host; 
     String port;
     String user;
     String pass;
   host="smtp.gmail.com";port="465";user="indsaccrmservice@gmail.com";pass="polo9070321";
  
     // host="mail.indsaccrm.com";port="587";user=Poul.getEmailResponseUser();
     // pass=Nd.Decrypt(Poul.getEmailResponsePass());
    HttpServletRequest request = null; 
    HttpServletResponse response=null;
      
        Random rand = new Random();
        int num = rand.nextInt(900000) + 100000;
        String recipient =clientmail;
                //(String) session.getAttribute("email");
        
                //(String) session.getAttribute("fullname");
        String subject = "Customer Enquiry: Visit indsaccrm.com";
        String code = Integer.toString(num);
        String content = "Hi "+businessname+",<br><br>Received business enquiry from "+customername+" Please visit INDSACCRM to check the enquiry.<br><br> \n" 
                        +"<br> Thanks and Regards,<br> Indsac Team <br> INDSAC-CRM | indsaccrm.com <br> Web: www.indsaccrm.com <br><br><br><br> This is system generated Email Please do not reply to this Email. In case you have any query You can Email us at support@indsaccrm.com";
       
        String resultMessage = "",check="";
 
        try {
              Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Contactformsubmittresponse.java----->insidetry-----try Before  EmailUtility.sendEmail");
       
            EmailUtility.sendEmail(host, port, user, pass, recipient, subject,
                    content);
             Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Contactformsubmittresponse.java----->sendtoClient()-----try After  EmailUtility.sendEmail");
       
            
             
        } catch (Exception ex) {
             Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Contactformsubmittresponse.java----->sendtoClient()-----Email error"+ex);
       
            
        } 
        
    }  
    
        
        
            public static   void sendtoCustomer(String customeremail,String businessname,String customername) throws IOException{
          Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Entering Contactformsubmittresponse.java----->sendtoClient()-----");
       
     String host; 
     String port;
     String user;
     String pass;
  
      host="mail.indsaccrm.com";port="587";user=Poul.getEmailResponseUser();
      pass=Nd.Decrypt(Poul.getEmailResponsePass());
    HttpServletRequest request = null; 
    HttpServletResponse response=null;
      
        Random rand = new Random();
        int num = rand.nextInt(900000) + 100000;
        String recipient =customeremail;
                //(String) session.getAttribute("email");
        
                //(String) session.getAttribute("fullname");
        String subject = "INDSAC-CRM: Message submitted Successfully";
        String code = Integer.toString(num);
        String content = "Hi "+customername+",<br><br>Thank you for your interest and contacting "+businessname+". Your message has been submitted successful.  Our team will contact you shortly<br><br> \n" 
                        +"<br> Thanks and Regards,<br> Indsac Team <br> INDSAC-CRM | indsaccrm.com <br> Web: www.indsaccrm.com <br><br><br>"
                + "INDSAC-CRM best software for business solution. Customer management,Inventory management,Invoice Creation,Employee management,Sales forecast and many more visit https://indsaccrm.com "
                + "<br> This is system generated Email Please do not reply to this Email. In case you have any query You can Email us at support@indsaccrm.com";
       
        String resultMessage = "",check="";
 
        try {
              Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Contactformsubmittresponse.java----->insidetry-----try Before  EmailUtility.sendEmail");
       
            EmailUtility.sendEmail(host, port, user, pass, recipient, subject,
                    content);
             Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Contactformsubmittresponse.java----->sendtoClient()-----try After  EmailUtility.sendEmail");
       
            
             
        } catch (Exception ex) {
             Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Contactformsubmittresponse.java----->sendtoClient()-----Email error"+ex);
       
            
        } 
        
    }  
}
