/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package s3453;

import blezz.Nd;
import blezz.Poul;
import email.EmergencyEmail;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import log.Log;

/**
 *
 * @author Sachin
 */
public class leadstatuschange extends HttpServlet {

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
        try {HttpSession session1 = request.getSession(); // reuse existing
      String usercid_id=(String)session1.getAttribute("usercid_id");
       String usercid_adminid=(String)session1.getAttribute("usercid_adminid");
                String oldstatus=request.getParameter("oldstatus");
            String type=request.getParameter("change");
               String cid=request.getParameter("val");
               if(cid!=null){cid=Nd.Decrypt(cid);}
               String status=request.getParameter("status");
                String disqualified=request.getParameter("disqualified");
             
                
                
                //changes status of leaddetails
                if("leadstatuschange".equals(type)){
            try{  
        Connection c=Poul.getConnectionCRM();
Statement st=c.createStatement();
   try{     
         java.util.Date ddate=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(ddate.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(ddate.getTime());
        String SR="";
          ResultSet rs3;
               rs3 = st.executeQuery("select  *  FROM leadstatuslog  ");
    while(rs3.next())
        
          {SR=rs3.getString(1);
          
          }
           int i = Integer.parseInt( SR ); 
           ++i; out.print("value of i="+i+"  ");
             st.addBatch("insert into leadstatuslog values('"+i+"','"+sqlTime+"','0','','','"+oldstatus+"','"+status+"','"+disqualified+"','"+usercid_adminid+"','"+usercid_id+"','"+cid+"','','','','','','','','','','','','','','','','','','','','','','')");
 st.addBatch("update contact set   status='"+status+"',fax='"+disqualified+"'  where id='"+cid+"' and useradminid='"+usercid_adminid+"'");
      st.executeBatch(); 
   Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" ,contact_id="+cid+"  -leadstatuschange.java  Change status: "+oldstatus+" to "+status+"  ---");
      
   
      response.sendRedirect("leaddetails.jsp?2a2e2a74797065=2a2e2a6c656164&2a2e2a6c6964="+Nd.Encrypt(cid)+"");
  
      st.close();
      c.close();
    }catch(Exception e){e.printStackTrace();}
            }catch(Exception e){
                         String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n leadstatuschange.java-----\n"
     + "LINE=87 \n update contact set   status='"+status+"',fax='"+disqualified+"'  where id='"+cid+"' and useradminid='"+usercid_adminid+"' ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg); 
       
            }     
        }
                
                
                //changes status of contactdetails
                 if("contactstatuschange".equals(type)){
       try{  
        Connection c=Poul.getConnectionCRM();
Statement st=c.createStatement();
   try{     
         java.util.Date ddate=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(ddate.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(ddate.getTime());
        String SR="";
          ResultSet rs3;
               rs3 = st.executeQuery("select  *  FROM leadstatuslog  ");
    while(rs3.next())
        
          {SR=rs3.getString(1);
          
          }
           int i = Integer.parseInt( SR ); 
           ++i; out.print("value of i="+i+"  ");
             st.addBatch("insert into leadstatuslog values('"+i+"','"+sqlTime+"','0','','','"+oldstatus+"','"+status+"','"+disqualified+"','"+usercid_adminid+"','"+usercid_id+"','"+cid+"','','','','','','','','','','','','','','','','','','','','','','')");
 st.addBatch("update contact set   status='"+status+"'  where id='"+cid+"' and useradminid='"+usercid_adminid+"'");
      st.executeBatch(); 
      Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" ,contact_id="+cid+"  -leadstatuschange.java  Change status: "+oldstatus+" to "+status+"  ---");
  
      session1.setAttribute("requestcid",cid);
     response.sendRedirect("contactdetails.jsp");
  
      st.close();
      c.close();
    }catch(Exception e){e.printStackTrace();}
            }catch(Exception e){
                                   String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n leadstatuschange.java-----\n"
     + "LINE=127 \n update contact set   status='"+status+"'  where id='"+cid+"' and useradminid='"+usercid_adminid+"' ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg); 
       
            }           
                
                
                 }
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet leadstatuschange</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet leadstatuschange at " + request.getContextPath() + "</h1>");
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
