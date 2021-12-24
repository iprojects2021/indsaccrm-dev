/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package s3453;

import blezz.Poul;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sachin
 */
@WebServlet("/BankDetails")
public class InvoiceBankDetails extends HttpServlet {

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
              String usercid_adminid=(String)session1.getAttribute("usercid_adminid");
          String pagetype=request.getParameter("pagetype");
          String city=request.getParameter("city");
           
          
             if("bankdetails".equals(pagetype)){
              
               String bankname=Poul.escapeHtml(request.getParameter("Bankname"));
        String bankacno=Poul.escapeHtml(request.getParameter("Bankacno"));
        String bankadd=Poul.escapeHtml(request.getParameter("Bankadd"));
        
        String bankifsc=Poul.escapeHtml(request.getParameter("Bankifsc"));
        
        String mid=Poul.escapeHtml(request.getParameter("mid"));
        System.out.println(bankname+bankacno+bankadd+bankifsc);
        String SRR=""; String msg="";
               try{
       
Connection con=Poul.getConnectionCRM();

Statement stt=con.createStatement();
    
            stt.addBatch("update mastertable set bankname='"+bankname+"',bankacno='"+bankacno+"',bankadd='"+bankadd+"',bankifsc='"+bankifsc+"'  where id='"+mid+"'" );
     
            
       stt.executeBatch(); 
       
      stt.close();
      con.close();
        session1.setAttribute("getlocationid",city);
        session1.setAttribute("invoicesetpagetype","new");
        
             msg="success";    
  if("success".equals(msg)){response.sendRedirect("invoicesetting.jsp");}
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
              
              
              }
          
          
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
