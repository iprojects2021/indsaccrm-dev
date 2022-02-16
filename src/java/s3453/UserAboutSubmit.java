/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package s3453;

import blezz.Poul;
import email.EmergencyEmail;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import log.Log;

/**
 *
 * @author Lenovo
 */
@WebServlet(name = "UserAboutSubmit", urlPatterns = {"/UserAboutSubmit"})
public class UserAboutSubmit extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            HttpSession session1 = request.getSession();
            String usercid=(String)session1.getAttribute("usercid_id");
            String useradminid=(String)session1.getAttribute("usercid_adminid");
            
            String yearsofexperience=request.getParameter("yearsofexperience");
            String skills=request.getParameter("skills");
            
             try{
              Connection con=Poul.getConnectionCRM();
              PreparedStatement ps=con.prepareStatement("update register set yearsofexperience=?,skills=? where  useradminid=? and id=?");
             
              ps.setString(1,yearsofexperience);
              ps.setString(2,skills);
              ps.setString(3,useradminid);
              ps.setString(4,usercid);
              
              ps.executeUpdate();
              con.close();
              ps.close();
              
            Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=s3453 ,  File=UserAboutSubmit.java , method=processRequest");
            
            //try close
            }catch(Exception e){
            String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \nUserAboutSubmit.java-----\n"
            + "\nLINE=70\n update register set yearsofexperience=?,skills=? where useradminid="+useradminid+" and id="+usercid+"";
            Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
            EmergencyEmail.send(e,errormsg); 
        }
             
             try{
           Connection c=Poul.getConnectionCRM();
           
           Statement st=c.createStatement(); 
           
           String logstatus="Data Update";
           st.addBatch("insert into registerlog (useradminid,usercid,yearsofexperience,skills,updatestatus) values('"+useradminid+"','"+usercid+"','"+yearsofexperience+"','"+skills+"','Update Data') ");
       
           st.executeBatch();        
           st.close();
           c.close();   
           
            Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=s3453 ,  File=UserAboutSubmit.java , method=processRequest");
           response.sendRedirect("userprofile.jsp?message=updatesuccessfully");  

           
           }catch(Exception e){
            String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \nUserAboutSubmit.java-----\n"
            + "\nLINE=93\n insert into registerlog (useradminid,usercid,yearsofexperience,skills,updatestatus) values('"+useradminid+"','"+usercid+"','"+yearsofexperience+"','"+skills+"','Update Data')";
            Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
            EmergencyEmail.send(e,errormsg); 
        }

          /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserAboutSubmit</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserAboutSubmit at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
