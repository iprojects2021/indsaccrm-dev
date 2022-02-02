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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import log.Log;

/**
 *
 * @author Lenovo
 */
@WebServlet(name = "UserProfileSubmit", urlPatterns = {"/UserProfileSubmit"})
public class UserProfileSubmit extends HttpServlet {

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
            
            
            String useradminid=request.getParameter("useradminid");
            String firstname=request.getParameter("firstname");
            String lastname=request.getParameter("lastname");
            firstname=firstname+" "+lastname;
            
           // String gender=request.getParameter("gender");
           // String dob=request.getParameter("dob");
            String phone=request.getParameter("phone");
            String mobileno=request.getParameter("mobileno");
            String address=request.getParameter("address");
            String city=request.getParameter("city");
            String state=request.getParameter("state");
            String country=request.getParameter("country");
            String zipcode=request.getParameter("zipcode");
            
            try{
              Connection con=Poul.getConnectionCRM();
              PreparedStatement ps=con.prepareStatement("update register set firstname=?,phone=?,mobile=?,address1=?,city=?,state=?,country=?,pincode=? where  useradminid=?");
             
              ps.setString(1,firstname);
            //  ps.setString(3,gender);
            //  ps.setString(4,dob);
              ps.setString(2,phone);
              ps.setString(3,mobileno);
              ps.setString(4,address);
              ps.setString(5,city);
              ps.setString(6,state);
              ps.setString(7,country);
              ps.setString(8,zipcode);
             
              ps.setString(9,useradminid);
              
              ps.executeUpdate();
              con.close();
              ps.close();
              
            Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=s3453 ,  File=UserProfileSubmit.java , method=processRequest");
            response.sendRedirect("userprofile.jsp?message=updatesuccessfully");  
            
            //try close
            }catch(Exception e){
            String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \nUserProfileSubmit.java-----\n"
            + "\nLINE=87\n update register set firstname=?,phone=?,mobileno=?,address1=?,city=?,state=?,country=?,pincode=? where useradminid=?";
            Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
            EmergencyEmail.send(e,errormsg); 
        }
            
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserProfileSubmit</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserProfileSubmit at " + request.getContextPath() + "</h1>");
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
