/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 *//*
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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import log.Log;
import menu.BusinessProfileService;

/**
 *
 * @author Lenovo
 */
public class BusinessDetailSubmit extends HttpServlet {

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
            String gstin=request.getParameter("gstin");
            String ownerdetails=request.getParameter("ownerdetails");
            String companystatus=request.getParameter("companystatus");
            String businesstype=request.getParameter("businesstype");
            String totalemployee=request.getParameter("totalemployee");
            String yearofestablished=request.getParameter("yearofestablished");
            String grossannualturnover=request.getParameter("grossannualturnover");
            String annualexportturnover=request.getParameter("annualexportturnover");
            
            boolean userAdminIdExist = BusinessProfileService.checkBusinessExist(useradminid);
        if(userAdminIdExist){
          
              try{
              Connection con=Poul.getConnectionCRM();
              PreparedStatement ps=con.prepareStatement("update businessprofile set gstin=?,ownerdetails=?,companystatus=?,businesstype=?,totalemployee=?,yearofestablished=?,grossannualturnover=?,annualexportturnover=? where useradminid=registerid and usercid=useradminid and useradminid= ?");
              
              ps.setString(1,gstin);
              ps.setString(2,ownerdetails);
              ps.setString(3,companystatus);
              ps.setString(4,businesstype);
              ps.setString(5,totalemployee);
              ps.setString(6,yearofestablished);
              ps.setString(7,grossannualturnover);
              ps.setString(8,annualexportturnover);
              ps.setString(9,useradminid);
              
              ps.executeUpdate();
              con.close();
              ps.close();
              
            Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=s3453 ,  File=BusinessDetailSubmit.java , method=processRequest");
            
            //try close
            }catch(Exception e){
            String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \nBusinessDetaileSubmit.java-----\n"
            + "\nLINE=84 \n update businessprofile set gstin=?,ownerdetails=?,companystatus=?,businesstype=?,totalemployee=?,yearofestablished=?,grossannualturnover=?,annualexportturnover=? where useradminid=registerid and usercid=useradminid and useradminid= ?";
            Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
            EmergencyEmail.send(e,errormsg); 
        }
        }
          String usercid=request.getParameter("usercid");

           try{
           Connection c=Poul.getConnectionCRM();
           
           Statement st=c.createStatement(); 
           
           String logstatus="Data Update";
           st.addBatch("insert into businessprofilelog (useradminid,usercid,gstin,ownerdetails,companystatus,businesstype,totalemployee,yearofestablished,grossannualturnover,annualexportturnover,updatestatus) values('"+useradminid+"','"+usercid+"','"+gstin+"','"+ownerdetails+"', '"+companystatus+"','"+businesstype+"','"+totalemployee+"','"+yearofestablished+"','"+grossannualturnover+"','"+annualexportturnover+"','Update Data') ");
       
           st.executeBatch();        
           st.close();
           c.close();   
           
           Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=s3453 ,  File=BusinessDetailSubmit.java , method=processRequest");
           response.sendRedirect("businessprofile.jsp?message=updatesuccessfully");  

           
           }catch(Exception e){
            String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \nBusinessDetailSubmit.java-----\n"
            + "\nLINE=109\n insert into businessprofilelog (useradminid,usercid,gstin,ownerdetails,companystatus,businesstype,totalemployee,yearofestablished,grossannualturnover,annualexportturnover,updatestatus) values('"+useradminid+"','"+usercid+"','"+gstin+"','"+ownerdetails+"', '"+companystatus+"','"+businesstype+"','"+totalemployee+"','"+yearofestablished+"','"+grossannualturnover+"','"+annualexportturnover+"','Update Data')";
            Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
            EmergencyEmail.send(e,errormsg); 
        }
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BusinessFormSubmit</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BusinessFormSubmit at " + request.getContextPath() + "</h1>");
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
