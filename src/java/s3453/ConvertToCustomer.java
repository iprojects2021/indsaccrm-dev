/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package s3453;

import blezz.Nd;
import blezz.Poul;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
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
 * @author Sachin
 */
@WebServlet(name = "ConvertToCustomer", urlPatterns = {"/ConvertToCustomer"})
public class ConvertToCustomer extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
          HttpSession session1 = request.getSession();
          String usercid_adminid=(String)session1.getAttribute("usercid_adminid");  
            
            
            String cid=request.getParameter("val");
           String usercid_id=(String)session1.getAttribute("usercid_id");
            try{  
        Connection c=Poul.getConnectionCRM();

Statement st=c.createStatement();
     ResultSet rs3;     

                            
    try{     
         java.util.Date ddate=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(ddate.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(ddate.getTime());
  st.addBatch("update contact set   customertype='customer',convertdate='"+sqlTime+"'  where id='"+cid+"'");
   rs3 = st.executeQuery("SELECT MAX(Id)FROM leadstatuslog   ");
   String SR="0" ;
   while(rs3.next())
        
          {SR=rs3.getString(1);
          
          }
          int  i = Integer.parseInt( SR ); 
           ++i; 
            st.addBatch("insert into leadstatuslog values('"+i+"','"+sqlTime+"','0','','','Lead','Customer','','"+usercid_adminid+"','"+usercid_id+"','"+cid+"','','','','','','','','','','','','','','','','','','','','','','')");
            
       st.executeBatch(); 
    Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" ,contact_id="+cid+"  -ConvertToCustomer.java  Lead to Customer ---");
      
      response.sendRedirect("contactdetails.jsp?2a2e2a74797065=2a2e2a636f6e74616374&2a2e2a636964="+Nd.Encrypt(cid)+"");
  
      st.close();
      c.close();
    }catch(Exception e){e.printStackTrace();}
            }catch(Exception e){e.printStackTrace();}     
            
            
            
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
