/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package s3453;

import blezz.MasterInsert;
import blezz.Poul;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import menu.Default;

/**
 *
 * @author Sachin
 */
@WebServlet(name = "invoiceset", urlPatterns = {"/invoiceset"})
public class invoiceset extends HttpServlet {

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
        try {HttpSession session1 = request.getSession(); 
              String usercid_adminid=(String)session1.getAttribute("usercid_adminid");
               String usercid_id=(String)session1.getAttribute("usercid_id");
          String pagetype=request.getParameter("pagetype");
          String city=request.getParameter("city");
          
          if("newsellerinformation".equals(pagetype)){
          
          String newentry="";
              String SRid="",esi_city="";
           try{
           Connection c=Poul.getConnectionCRM();
             Statement st=c.createStatement();
           ResultSet rs3;
               rs3 = st.executeQuery("select  id,esi_city  FROM mastertable where useradminid='"+usercid_adminid+"' and esi_city='"+city+"'   ");
             
              
              while(rs3.next()){
                   
                      SRid=(rs3.getString(1));  
                      esi_city=(rs3.getString(2));
              }rs3.close();
      st.close();
      c.close();
              if(city.equals(esi_city)){response.sendRedirect("newsellerinformation.jsp?msg=CityExist");}
              if("".equals(SRid)||"null".equals(SRid)){
              newentry=MasterInsert.setMasterInsert(usercid_adminid, city);
              }
            
              if(!"".equals(newentry)||!"null".equals(newentry)){
              
               String cn=Poul.escapeHtml(request.getParameter("cn"));
        String cfn=Poul.escapeHtml(request.getParameter("cfn"));
        String cln=Poul.escapeHtml(request.getParameter("cln"));
        
       
        String website=Poul.escapeHtml(request.getParameter("website"));
        
        String mobile=Poul.escapeHtml(request.getParameter("mobile"));
        String ap=Poul.escapeHtml(request.getParameter("ap"));
        String email=Poul.escapeHtml(request.getParameter("email"));
       
        String address1=Poul.escapeHtml(request.getParameter("address1"));
        String address2=Poul.escapeHtml(request.getParameter("address2"));
        String address3=Poul.escapeHtml(request.getParameter("address3"));
       
        String pincode=Poul.escapeHtml(request.getParameter("pincode"));
        String state=Poul.escapeHtml(request.getParameter("state"));
        String country=Poul.escapeHtml(request.getParameter("country"));
        
        String gstin=Poul.escapeHtml(request.getParameter("gstin"));
        String SRR=""; String msg="";
               try{
       
Connection con=Poul.getConnectionCRM();

Statement stt=con.createStatement();
    
            stt.addBatch("update mastertable set esi_sellername='"+cn+"',esi_contactfirstname='"+cfn+"',esi_contactlastname='"+cln+"',esi_gst='"+gstin+"',esi_website='"+website+"',esi_mobile='"+mobile+"',esi_alternatephone='"+ap+"',esi_email='"+email+"',esi_address1='"+address1+"',esi_address2='"+address2+"',esi_address3='"+address3+"',esi_city='"+city+"',esi_pincode='"+pincode+"',esi_state='"+state+"',esi_country='"+country+"' where id='"+newentry+"'" );
     
            
       stt.executeBatch(); 
        rs3.close();
      st.close();
      c.close();
      
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
              
              
              
           }
           catch(Exception e){e.printStackTrace();}
           
        }
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet invoiceset</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet invoiceset at " + request.getContextPath() + "</h1>");
            
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
