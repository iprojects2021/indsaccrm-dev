/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package blezz;

/**
 *
 * @author Sachin
 */
import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import log.Log;
 

public class EmailUtility {
    public static void sendEmail(String host, String port,
            final String userName, final String password, String toAddress,
            String subject, String message) throws AddressException,
            MessagingException {
  Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Entering EmailUtility.java----->sendEmail()-----");
       
        // sets SMTP server properties
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
 
        // creates a new session with an authenticator
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userName, password);
            }
        };
 
        Session session = Session.getInstance(properties, auth);
 
        // creates a new e-mail message
        Message msg = new MimeMessage(session);
 
        msg.setFrom(new InternetAddress(userName));
        InternetAddress[] toAddresses = { new InternetAddress(toAddress) };
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject(subject);
        msg.setSentDate(new Date());
        //msg.setText(message);
        msg.setContent("<img src=\"https://d2q79iu7y748jz.cloudfront.net/s/_logo/d37dc400a5b7128276d44c2ac77b144c\"  width=\"150px\" height=\"50px\">"+"<p>"+message+"</p>" ,"text/html");

        // sends the e-mail
         Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Entering EmailUtility.java----->send()-----Before Transport.send ");
 
        Transport.send(msg);
        Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Entering EmailUtility.java----->send()-----AFter Transport.send ");
 
    }
}
