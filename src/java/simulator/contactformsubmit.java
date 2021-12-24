/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package simulator;

import blezz.Nd;
import blezz.Poul;
import email.Contactformsubmittresponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dell
 */
public class contactformsubmit extends HttpServlet {

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
        try {//servlet try block
            String typeenc=Poul.escapeHtml(request.getParameter("2a2e2a74797065"));
            String useradminidenc=Poul.escapeHtml(request.getParameter("2a2e2a7573657261646d696e6964"));
            String typedec=Nd.Decrypt(typeenc);
            String useradminiddec=Nd.Decrypt(useradminidenc);
           String errormsg="";
    
               String msg=""; String SR="",SR1="";      
               //try block to check adminid present in db or not
               try{
Connection con=Poul.getConnectionCRM();
 PreparedStatement smt=con.prepareStatement("select count(*) from freeformcontact where useradminid=? AND formtype=?");
        smt.setString(1,useradminiddec);
         smt.setString(2,"contactform");
       ResultSet rs=smt.executeQuery();while(rs.next())
         {SR=rs.getString(1);
        }
         msg="success"   ;       
    rs.close();
      smt.close();
      con.close();  
               }//try db check close
        catch(Exception e)
        {
            e.printStackTrace();
        }
               int n123=Integer.parseInt(SR);
           if(n123>0) {//if adminid present in db then get data for sending response
            String responsepath="",responsemail="",businessname="";
                 try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select f.client_response_path,f.responsemail,r.company from freeformcontact f,register r where f.useradminid=? AND f.formtype=? and r.id=?");
        smt.setString(1,useradminiddec);
        smt.setString(2,"contactform");
        smt.setString(3,useradminiddec);
        ResultSet rs=smt.executeQuery();
     while(rs.next())
        { 
       responsepath=rs.getString(1);responsemail=rs.getString(2);businessname=rs.getString(3);
      }
       rs.close();
       smt.close(); 
       con.close(); 
                 }
                 
            catch(Exception e)
            {e.printStackTrace();}
               
                
            String firstname=Poul.escapeHtml(request.getParameter("firstname"));
        String lastname =Poul.escapeHtml(request.getParameter("lastname"));
        String mobile =Poul.escapeHtml(request.getParameter("mobile"));
        String customeremail=Poul.escapeHtml(request.getParameter("email"));
        String subject=Poul.escapeHtml(request.getParameter("subject"));
         String message=Poul.escapeHtml(request.getParameter("message"));
        if(firstname.length()>15){  errormsg="Name%20should%20be%20maximum%20length-15";  }
          if(lastname.length()>15){  errormsg="Name%20should%20be%20maximum%20length-l5";  }
           if(mobile.length()>12||mobile.length()<9){  errormsg="Enter%20correct%20mobile";  }
          if(customeremail.length()>30){  errormsg="Email%20should%20be%20maximum%20length-30";  }
           if(subject.length()>100){  errormsg="Subject%20should%20be%20maximum%20length-100";  }
           if(message.length()>1000){  errormsg="Message%20should%20be%20maximum%20length-1000";  }
          if("".equals(subject)||"null".equals(subject)||"".equals(message)||"null".equals(message)||"".equals(mobile)||"null".equals(mobile)||"".equals(customeremail)||"null".equals(customeremail))
           {  errormsg="Please%20enter%20mandatory%20information%20(Subject,message,email,mobile)";  }
          if(errormsg!="")   {response.sendRedirect(responsepath+"?errormsg="+errormsg);}
          else{
              //inside success inserting into db
               String SR123=null; java.util.Date date=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());  
        try{
       
Connection c=Poul.getConnectionCRM();



Statement st=c.createStatement();
           ResultSet rs3;
               rs3 = st.executeQuery("select  *  FROM freeformcontactsubmit  ");
    while(rs3.next())
        
          {SR123=rs3.getString(1);
          
          }
           int i = Integer.parseInt( SR123 ); 
           ++i; 
             st.addBatch("insert into freeformcontactsubmit values('"+i+"','"+sqlTime+"','0','customer','"+businessname+"','"+firstname+"','"+lastname+"','"+mobile+"','"+customeremail+"','"+subject+"','"+message+"','"+responsemail+"','contactform','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','')");
      st.executeBatch(); 
     
             msg="success"   ;       
    rs3.close();
      st.close();
      c.close();     }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        Contactformsubmittresponse.sendtoClient(responsemail,businessname,firstname);
        Contactformsubmittresponse.sendtoCustomer(customeremail, businessname, firstname);
              response.sendRedirect(responsepath+"?msg=Submitted%20Successfully");
          }
           } 
           
     
            
            
            
            
            
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Please use Google chrome or firefox to submit</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Please use Google chrome or firefox to submit </h1>");
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
