/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package blezz;

import email.EmergencyEmail;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import log.Log;

/**
 *
 * @author Sachin
 */
@WebServlet(name = "EmailSending", urlPatterns = {"/EmailSending"})
public class EmailSending extends HttpServlet {
 private String host; private static final long serialVersionUID = 1L;
    private String port;
    private String user;
    private String pass;
 
    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
        
    }
 
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // reads form fields
        
        response.setContentType("text/html");  
        PrintWriter out=response.getWriter();
         HttpSession session=request.getSession();
        Random rand = new Random();
        int num = rand.nextInt(900000) + 100000;
        String recipient = (String) request.getParameter("email");
        String fname = (String) request.getParameter("fullname");
        String subject = "Verification OTP Code from INDSAC";
        String code = Integer.toString(num);
        String content = "Dear "+fname+",<br><br> Greetings from INDSAC!!!<br><br> You are just a step away from registration. Your Verification Code is <strong>"+Integer.toString(num)+"</strong> .The code is valid for 15 minutes and usable only once.<br><br> Once you have verified the code, you'll be registered immediately. This is to ensure that only you have access to your account.\n" 
                        +"<br><br><br><br> Thanks and Regards,<br><br> Indsac Team <br> INDSAC SOFTECH | indsac.com <br><br> Web: www.indsac.com <br><br><br><br> This is system generated Email Please do not reply to this Email. In case you have any query You can Email us at info@indsac.com";
       
        String resultMessage = "",check="";
 
        try {
            EmailUtility.sendEmail(host, port, user, pass, recipient, subject,
                    content);
            resultMessage = "Your Verification code has been sent to "+recipient+" successfully";
            check="yes";
             
        } catch (Exception ex) {
           String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n Package=blezz , File=EmailSending.java , servlet-----\n"
    + "\nLINE=69\n     ";
   Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+ex);
     EmergencyEmail.send(ex,errormsg); 
            resultMessage = "There were an error: " + ex.getMessage();
            check="no";
        } finally {
           session.setAttribute("Message", resultMessage);
            session.setAttribute("vcode",code);
            session.setAttribute("checkYN", check);
            session.setAttribute("count", 0);
            response.sendRedirect("checking.jsp");
            //RequestDispatcher rd=request.getRequestDispatcher("pg/signup/VerifyCodeRegistration.jsp");
            //rd.forward(request, response);
        }
        
     }

    private String String(Object attribute) {
        throw new UnsupportedOperationException("Not supported yet."); 
    }
}