<%-- 
    Document   : newleads
    Created on : Sep 5, 2017, 3:31:34 PM
    Author     : satyendra
--%>

<%@page import="blezz.Nd"%>
<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="blezz.Poul"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% HttpSession session1 = request.getSession(); // reuse existing
    out.print(" at session: ");
          String usercid_id=(String)session1.getAttribute("usercid_id");
          String usercid_email=(String)session1.getAttribute("usercid_email");
          String useraccountype=(String)session1.getAttribute("useraccountype");
          String usercid_name=(String)session1.getAttribute("usercid_name");
          String usercid_adminid=(String)session1.getAttribute("usercid_adminid");
             String usercid_company=(String)session1.getAttribute("usercid_company");
          String usercid_website=(String)session1.getAttribute("usercid_website"); 
          
          if (session != null) {
			if (session1.getAttribute("usercid_id") == null) {
				response.sendRedirect("signout.jsp");
			} 
		}
          Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   --  Entring irsubmit.jsp---");
          
        String direction=Poul.escapeHtml(request.getParameter("direction"));
        String status1=Poul.escapeHtml(request.getParameter("status1"));
        String priority1=Poul.escapeHtml(request.getParameter("priority1"));
        String enquiry=Poul.escapeHtml(request.getParameter("enquiry"));
        String lid=Poul.escapeHtml(request.getParameter("lid"));
        String product=Poul.escapeHtml(request.getParameter("product"));
       String cid=Poul.escapeHtml(request.getParameter("2a2e2a636964"));
       if(cid!=null){cid=Nd.Decrypt(cid);}
        String msg="null";
        java.util.Date date=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());
        String type=Poul.escapeHtml(request.getParameter("2a2e2a74797065"));
        if(type!=null){type=Nd.Decrypt(type);}
      
        String id=(String)session.getAttribute("id"); 
           String ownr=(String)session.getAttribute("ownr"); 
        String SR=null;
        
        try{
        
Connection c=Poul.getConnectionCRM();


Statement st=c.createStatement();
           ResultSet rs3;
               rs3 = st.executeQuery("select  *  FROM interactionrecord  ");
    while(rs3.next())
        
          {SR=rs3.getString(1);
          
          }
           int i = Integer.parseInt( SR ); 
           ++i;
             st.addBatch("insert into interactionrecord values('"+i+"','"+sqlTime+"','0','"+direction+"','"+status1+"','"+priority1+"','"+enquiry+"','"+lid+"','"+product+"','"+ownr+"','"+usercid_adminid+"','"+usercid_id+"','"+cid+"','','','','','','','','','','','','','','','','','','','','')");
      
            
       st.executeBatch(); 
        String requestid=lid;
        session.setAttribute("requestid",requestid);
             msg="success";    
       
     rs3.close();
      st.close();
      c.close();    }
        catch(Exception e)
        {
            String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoicesetting.jsp-----\n"
     + "LINE=86 + \n select  *  FROM interactionrecord   ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
        }
        finally{
        
           // session.setAttribute("submitmsg",msg);
           // response.sendRedirect("newleads.jsp");
           if(msg.equals("success")){ String Re="" ;
         if("contact".equals(type)){ Re="contactdetails.jsp?2a2e2a636964="+Nd.Encrypt(cid)+"&2a2e2a74797065=2a2e2a636f6e74616374";
             response.sendRedirect(Re);}
         if("vendor".equals(type)){Re="vendordetails.jsp?2a2e2a766964="+Nd.Encrypt(cid)+"&2a2e2a74797065=2a2e2a76656e646f72";
             response.sendRedirect(Re);}
           if("lead".equals(type)){ Re="leaddetails.jsp?2a2e2a6c6964="+Nd.Encrypt(cid)+"&2a2e2a74797065=2a2e2a6c656164";
               response.sendRedirect(Re);}
            }else{
               Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   -----irsubmit.jsp------- Redirecting To--------error.jsp----------");
               response.sendRedirect("error.jsp");
            }
        }
      
        
      
        %>
    </body>
</html>
