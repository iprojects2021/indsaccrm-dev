
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
import menu.BusinessProfileService;


@WebServlet(name = "ProfileFormSubmit", urlPatterns = {"/ProfileFormSubmit"})
public class BusinessProfileSubmit extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            String useradminid=request.getParameter("useradminid");
            String usercid=request.getParameter("usercid");
            String businessname=request.getParameter("businessname");
            String businessemail=request.getParameter("businessemail");
            String website=request.getParameter("website");
            String landlinetelephone=request.getParameter("landlinetelephone");
            String mobileno=request.getParameter("mobileno");
            String headofficeaddress=request.getParameter("headofficeaddress");
            String officeaddress=request.getParameter("officeaddress");
            String city=request.getParameter("city");
            String state=request.getParameter("state");
            String country=request.getParameter("country");
            String zipcode=request.getParameter("zipcode");
            String notes=request.getParameter("notes");
        
            boolean userAdminIdExist = BusinessProfileService.checkBusinessExist(useradminid);
        if(!userAdminIdExist){
        try{
              Connection con=Poul.getConnectionCRM();
              PreparedStatement ps=con.prepareStatement("insert into businessprofile(registerid,useradminid,usercid,businessname,businessemail,website,phone,mobile,headofficeaddress,officeaddress,city,state,country,zipcode,notes) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
              ps.setString(1,useradminid);
              ps.setString(2,useradminid);
              ps.setString(3,usercid);
              ps.setString(4,businessname);
              ps.setString(5,businessemail);
              ps.setString(6,website);
              ps.setString(7,landlinetelephone);
              ps.setString(8,mobileno);
              ps.setString(9,headofficeaddress);
              ps.setString(10,officeaddress);
              ps.setString(11,city);
              ps.setString(12,state);
              ps.setString(13,country);
              ps.setString(14,zipcode);
              ps.setString(15,notes);
              ps.executeUpdate();
              
              con.close();
              ps.close();
              
               Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=s3453 ,  File=BusinessProfileSubmit.java , method=processRequest( HttpServletRequest request, HttpServletResponse response)");
               response.sendRedirect("businessprofile.jsp?message=successfullysaved"); 
        
              }//try close
              catch(Exception e){
              String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \nBusinessProfileSubmit.java-----\n"
              + "\nLINE=74 \n insert into businessprofile(registerid,useradminid,usercid,businessname,businessemail,website,phone,mobileno,headofficeaddress,officeaddress,city,state,country,zipcode,notes) values";
              Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
              EmergencyEmail.send(e,errormsg); 
        }
        }//boolean check
        else {
            
            try{
              Connection con=Poul.getConnectionCRM();
              PreparedStatement ps=con.prepareStatement("update businessprofile set businessname=?,businessemail=?,website=?,phone=?,mobile=?,headofficeaddress=?,officeaddress=?,city=?,state=?,country=?,zipcode=?,notes=? where useradminid=registerid and usercid=useradminid and useradminid= ?");
             
              ps.setString(1,businessname);
              ps.setString(2,businessemail);
              ps.setString(3,website);
              ps.setString(4,landlinetelephone);
              ps.setString(5,mobileno);
              ps.setString(6,headofficeaddress);
              ps.setString(7,officeaddress);
              ps.setString(8,city);
              ps.setString(9,state);
              ps.setString(10,country);
              ps.setString(11,zipcode);
              ps.setString(12,notes);
              ps.setString(13,useradminid);
              
              ps.executeUpdate();
              con.close();
              ps.close();
              
            Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Package=s3453 ,  File=BusinessProfileSubmit.java , method=processRequest");
            response.sendRedirect("businessprofile.jsp?message=updatesuccessfully");  
            
            //try close
            }catch(Exception e){
            String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \nBusinessProfileSubmit.java-----\n"
            + "\nLINE=109 \n update businessprofile set businessname=?,businessemail=?,website=?,phone=?,mobile=?,headofficeaddress=?,officeaddress=?,city=?,state=?,country=?,zipcode=?,notes=? where useradminid=registerid and usercid=useradminid and useradminid= ?";
            Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
            EmergencyEmail.send(e,errormsg); 
        }
            

        
        }
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProfileFormSubmit</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProfileFormSubmit at " + request.getContextPath() + "</h1>");
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
