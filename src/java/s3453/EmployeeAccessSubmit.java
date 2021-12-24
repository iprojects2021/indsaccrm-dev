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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
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
@WebServlet(name = "EmployeeAccessSubmit", urlPatterns = {"/YmnhaDw"})
public class EmployeeAccessSubmit extends HttpServlet {

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
        try {  HttpSession session = request.getSession();
            HttpSession session1 = request.getSession();
           
            
            
             String usercid_id=(String)session1.getAttribute("usercid_id");
          String usercid_email=(String)session1.getAttribute("usercid_email");
          String useraccountype=(String)session1.getAttribute("useraccountype");
          String usercid_name=(String)session1.getAttribute("usercid_name");
          String usercid_adminid=(String)session1.getAttribute("usercid_adminid");
             String usercid_company=(String)session1.getAttribute("usercid_company");
          String usercid_website=(String)session1.getAttribute("usercid_website"); 
        	
            
            
            
            
            
             String pagetype=Poul.escapeHtml(request.getParameter("pagetype"));
      if("editaccessrequest".equals(pagetype)){
          
          
      
       String Customerread=Poul.escapeHtml(request.getParameter("Customerread"));
        String Customerwrite=Poul.escapeHtml(request.getParameter("Customerwrite"));
        String leadread=Poul.escapeHtml(request.getParameter("leadread"));
        
        
        String leadwrite=Poul.escapeHtml(request.getParameter("leadwrite"));
        
        String vendorread=Poul.escapeHtml(request.getParameter("vendorread"));
        String vendorwrite=Poul.escapeHtml(request.getParameter("vendorwrite"));
        String taskread=Poul.escapeHtml(request.getParameter("taskread"));
       
        String taskwrite=Poul.escapeHtml(request.getParameter("taskwrite"));
        String srread=Poul.escapeHtml(request.getParameter("srread"));
        String srwrite=Poul.escapeHtml(request.getParameter("srwrite"));
        String irread=Poul.escapeHtml(request.getParameter("irread"));
        String irwrite=Poul.escapeHtml(request.getParameter("irwrite"));
        String invoiceread=Poul.escapeHtml(request.getParameter("invoiceread"));
        String invoicewrite=Poul.escapeHtml(request.getParameter("invoicewrite"));
        
        String poread=Poul.escapeHtml(request.getParameter("poread"));
         String powrite=Poul.escapeHtml(request.getParameter("powrite"));
        String emailread=Poul.escapeHtml(request.getParameter("emailread"));
        String emailwrite=Poul.escapeHtml(request.getParameter("emailwrite"));
        
        String msg=null;
        java.util.Date date=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());  
        String ownr=(String)session.getAttribute("ownr");
        String emp=Poul.escapeHtml(request.getParameter("emp"));
     
      String SR=null;
        try{  out.print("inside try") ;
        Connection c=Poul.getConnectionCRM();

Statement st=c.createStatement();
           ResultSet rs3;
               rs3 = st.executeQuery("select  *  FROM validateuser where id='"+emp+"'  ");
               out.print("after select") ;
 ResultSetMetaData rsmd=rs3.getMetaData();
     String aa="null",ab="null",ac="null",ad="null",ae="null",af="null",ag="null",ah="null",ai="null",aj="null",ak="null",all="null",am="null",an="null",ao="null",ap="null",aq="null",ar="null",as="null",at="null",au="null",av="null",aw="null",ax="null",ay="null",az="null",ba="null",bb="null",bc="null",bd="null",be="null",bf="null",bg="null",bh="null",bi="null",bj="null",bk="null",bl="null";
     
                    ak=rsmd.getColumnName(11);
                     all=rsmd.getColumnName(12);
                      am=rsmd.getColumnName(13);
                       an=rsmd.getColumnName(14);
                        ao=rsmd.getColumnName(15);
                         ap=rsmd.getColumnName(16);
                          aq=rsmd.getColumnName(17);
                           ar=rsmd.getColumnName(18);
                            as=rsmd.getColumnName(19);
                             at=rsmd.getColumnName(20);
                              au=rsmd.getColumnName(21);
                              av=rsmd.getColumnName(22);
                                aw=rsmd.getColumnName(23);
                       ax=rsmd.getColumnName(24);
                        ay=rsmd.getColumnName(25);
                         az=rsmd.getColumnName(26);
                          ba=rsmd.getColumnName(27);
                          bb=rsmd.getColumnName(28);
                            
    try{           out.print(emp);
  st.addBatch("update validateuser set   "+ak+"='"+Customerread +"',"+all+"='"+Customerwrite +"',"+am+"='"+leadread+"',"+an+"='"+leadwrite+"',"+ao+"='"+vendorread+"',"+ap+"='"+vendorwrite+"',"+aq+"='"+taskread+"',"+ar+"='"+taskwrite+"',"+as+"='"+srread+"',"+at+"='"+srwrite+"',"+au+"='"+irread+"',"+av+"='"+irwrite+"',"+aw+"='"+invoiceread+"',"+ax+"='"+invoicewrite+"',"+ay+"='"+poread+"',"+az+"='"+powrite+"',"+ba+"='"+emailread+"',"+bb+"='"+emailwrite+"'   where id='"+emp+"'");
  
  out.print("after update") ;            
               
            
       st.executeBatch(); 
        rs3.close();
      
      st.close();
      c.close();
        out.print("after execute") ;            
    }catch(Exception e){e.printStackTrace();}
             msg="success";    
       
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally{
        
          if(msg.equals("success")){
  response.sendRedirect("editaccessrequest.jsp?eid="+emp);
            }else{
         response.sendRedirect("error.jsp");
            }
               
            
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
