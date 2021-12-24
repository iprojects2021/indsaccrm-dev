/*What this page does?Gets the sent mail data from jsp and saves it in the db   
 * What are the varialbes
 * session var accessing the session in the current servlet
 * now var for storing the datetime 
 * subject string var subject form the jsp page
 * content string var content form the jsp page 
 * attachmentdir string var for storing the directory of the attachment
 * List<String> data for getting the selected email form the session
 * sd instance of the savemaildata class
 * recipient var  for running for loop and storing the list values in the var
 * resultmessage for storing the message
 * methods-(parameter) 
 * now();//for getting current local datetime
 * getSession();//for generating the instance  of the session
 * getAttribute("subject");//for getting subject of compose mail form the jsp
 * getAttribute("content");//for getting content of compose mail form the jsp
 * getAttribute("attachmentdir");// for the getting the directory of the attachment 
 * getAttribute("emails");// getting the attribute form the session
 * SaveEmailData();// for creating  the instance of saveemaildata class
 * saveRecipientData(now, recipient);//method save the email data to the db and the current timestamp
 * saveContentData(now, subject, content,attachmentdir);// method save the subject and  content  data to the db and the current timestamp
 * getAttribute("message"); // for the getting the message form the sendmailAttachmnet servlet
 * setAttribute("message", resultMessage);//setting the attribute to send it to the result jsp for display
 * Date Created :10-06-2020
 * Created By:-Tapswi Godara
 * 
 */
package blezz;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import log.Log;

/**
 * Servlet implementation class SaveEmailToDb
 */
@WebServlet("/SaveEmailToDb")
public class SaveEmailToDb extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //now var for storing the datetime
        System.out.println("-------inside saveemailtodb------");
        LocalDateTime now = LocalDateTime.now();//for getting current local datetime
        //session var accessing the session in the current servlet 
        HttpSession session = request.getSession();//for generating the instance  of the session
        //subject string var subject form the jsp page 
        String usercid_id = (String) session.getAttribute("usercid_id");
        String usercid_adminid = (String) session.getAttribute("usercid_adminid");
        String useremail = (String) session.getAttribute("useremail");
        
        String subject = (String) session.getAttribute("subject");//for getting subject of compose mail form the jsp
        //content string var content form the jsp page  
        String content = (String) session.getAttribute("content");//for getting content of compose mail form the jsp
       System.out.println("Subject:"+subject);
        System.out.println("content:"+content);
        content=content.toString();
        //gets the dir length
          int dirlength = 0;
          try{
        dirlength = (Integer) session.getAttribute("dirlength");
          }
          catch(Exception e)
          {System.out.println("inside dirlenght catch exception");
              dirlength=0;}
          System.out.println("dirlength:"+dirlength);

        // attachmentdir string var for storing the directory of the attachment
        String attachmentdir[] = new String[dirlength + 1];
        System.out.println("i default zero="+attachmentdir[0]);
        for (int i = 0; i <= dirlength; i++) {
            attachmentdir[i] = (String) session.getAttribute("attachmentdir" + i);
            System.out.println(attachmentdir[i]);

        }// for the getting the directory of the attachment 
        //List<String> data for getting the selected email form the session
        List<String> data = (List<String>) session.getAttribute("emails");// getting the attribute form the session
        // sd instance of the savemaildata class
        Log.writeLogWarn("Debug:"+java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+",Datetime="+now+",Subject:"+subject+",Content:"+content+",Email="+data+",Fromemail="+useremail+" --,");
      
        SaveEmailData sd = new SaveEmailData();// for creating  the instance of saveemaildata class
        //recipient var  for running for loop and storing the list values in the var
        for (String recipient : data) {
            try{
            sd.saveRecipientData(now, recipient,usercid_id ,usercid_adminid ,useremail);//method save the email data to the db and the current timestamp
            }
            catch(Exception e)
            {
                   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+",Datetime="+now+",Email="+recipient+",Fromemail="+useremail+" --, Error "+e+"");
      
            }
            }
        String attachmentfilename="";
        for (int i = 0; i <= dirlength; i++) {
            attachmentfilename=attachmentfilename+attachmentdir[i]+";";
            }
               try{
            sd.saveContentData(now, subject, content, attachmentfilename,usercid_id ,usercid_adminid ,useremail);
            
      
        }
            catch(Exception e)
            {
                   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+",Datetime="+now+",attachment="+attachmentfilename+",Fromemail="+useremail+" --, Error "+e+"");
      
            }
        // method save the subject and  content  data to the db and the current timestamp
        //resultmessage for storing the message
                for (int i = 0; i <= dirlength; i++) {
            
             session.removeAttribute("attachmentdir" + i);
            }
          session.removeAttribute("dirlength");
      
        String resultMessage = (String) request.getAttribute("message"); // for the getting the message form the sendmailAttachmnet servlet
        request.setAttribute("message", resultMessage);//setting the attribute to send it to the result jsp for display
        getServletContext().getRequestDispatcher("/SentMail.jsp").forward(
                request, response);//for forwarding the control to the result.jsp
    }

}
