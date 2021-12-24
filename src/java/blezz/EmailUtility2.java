package blezz;

/*What this page does?Sends the mail to the given the mail address as the parameter
 * What are the varialbes 
 * String host stores the value of host  
 * String port stores the value of port 
 * String userName stores the value  of username 
 * String password stores the value  of password
 * String toAddress stores the value  of email address  
 * String subject stores the value  of the subject of the mail
 * String message stores the value  of the content of the mail 
 * List<File> attachedFiles stores the attachment
 *  properties var stores the SMTP server properties 
 *  Authenticator auth stores an instance of Authenticator 
 * methods-(parameter)
 * properties.put// sets SMTP server properties  
 *Authenticator() // creates a new session with an authenticator   
 * PasswordAuthentication(userName, password); //   checks if username and password for given mail account are or not 
 * MimeMessage(session); // creates a new e-mail message
 *   attachFile(aFile);// adds attachments
 *   setContent(multipart);// sets the multi-part as e-mail's content
 *   Transport.send(msg);// sends the e-mail 
 * Date Created :10-06-2020
 * Created By:-Tapswi Godara
 * 
 */

import email.EmergencyEmail;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Properties;
 
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import log.Log;
 
/**
 * A utility class for sending e-mail message with attachment.
 * @author www.codejava.net
 *
 */
public class EmailUtility2 {
     
    /**
     * Sends an e-mail message from a SMTP host with a list of attached files.
     *
     */
    public static void sendEmailWithAttachment(String host, String port,
            final String userName, final String password, String toAddress,
            String subject, String message, List<File> attachedFiles)
                    throws AddressException, MessagingException, IOException {
        // sets SMTP server properties
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.user", userName);
        properties.put("mail.password", password);
 
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
 
        // creates message part
        MimeBodyPart messageBodyPart = new MimeBodyPart();
        messageBodyPart.setContent(message, "text/html");
 
        // creates multi-part
        Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(messageBodyPart);
 
        // adds attachments
        if (attachedFiles != null && attachedFiles.size() > 0) {
            for (File aFile : attachedFiles) {
                MimeBodyPart attachPart = new MimeBodyPart();
 
                try {
                    attachPart.attachFile(aFile);
                } catch (IOException ex) {
                    String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=blezz , File=EmailUtility2.java , sendEmailWithAttachment()-----\n"
    + "\nLINE=107\n     ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+ex);
     EmergencyEmail.send(ex,errormsg);
                }
 
                multipart.addBodyPart(attachPart);
            }
        }
 
        // sets the multi-part as e-mail's content
        msg.setContent(multipart);
 
        // sends the e-mail
        Transport.send(msg);
    }
}