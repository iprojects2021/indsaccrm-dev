<%-- 
    Document   : newleads
    Created on : Sep 5, 2017, 3:31:34 PM
    Author     : satyendra
--%>

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
        <head> <link rel="shortcut icon" href="dist/img/u.png" type="image/x-icon" /> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String cn=Poul.escapeHtml(request.getParameter("cn"));
        String cfn=Poul.escapeHtml(request.getParameter("cfn"));
        String cln=Poul.escapeHtml(request.getParameter("cln"));
        String ls=Poul.escapeHtml(request.getParameter("ls"));
        String industry=Poul.escapeHtml(request.getParameter("industry"));
        String category=Poul.escapeHtml(request.getParameter("category"));
        String status=Poul.escapeHtml(request.getParameter("status"));
        String noe=Poul.escapeHtml(request.getParameter("noe"));
        String ar=Poul.escapeHtml(request.getParameter("ar"));
        String website=Poul.escapeHtml(request.getParameter("website"));
        String bwtc =Poul.escapeHtml(request.getParameter("bwtc"));
        String mobile=Poul.escapeHtml(request.getParameter("mobile"));
        String ap=Poul.escapeHtml(request.getParameter("ap"));
        String email=Poul.escapeHtml(request.getParameter("email"));
        String oai=Poul.escapeHtml(request.getParameter("oai"));
        String oai1=Poul.escapeHtml(request.getParameter("oai1"));
        String phone=Poul.escapeHtml(request.getParameter("phone"));
        String fax=Poul.escapeHtml(request.getParameter("fax"));
        String oe=Poul.escapeHtml(request.getParameter("oe"));
        String oai2=Poul.escapeHtml(request.getParameter("oai2"));
        String oai3=Poul.escapeHtml(request.getParameter("oai3"));
        String address1=Poul.escapeHtml(request.getParameter("address1"));
        String address2=Poul.escapeHtml(request.getParameter("address2"));
        String address3=Poul.escapeHtml(request.getParameter("address3"));
        String city=Poul.escapeHtml(request.getParameter("city"));
        String pincode=Poul.escapeHtml(request.getParameter("pincode"));
        String state=Poul.escapeHtml(request.getParameter("state"));
        String country=Poul.escapeHtml(request.getParameter("country"));
        String notes=Poul.escapeHtml(request.getParameter("notes"));
         String product=Poul.escapeHtml(request.getParameter("product"));
        
        String msg="null";
        java.util.Date date=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());
        String owner=(String)session.getAttribute("owner"); 
        String id=(String)session.getAttribute("id"); 
       String ownr=(String)session.getAttribute("ownr"); 
        String SR=null;
        try{
       
Connection c=Poul.getConnectionCRM();
out.print("entered page");
Statement st=c.createStatement();
           ResultSet rs3;
               rs3 = st.executeQuery("select  *  FROM vendor  ");
    while(rs3.next())
        
          {SR=rs3.getString(1);
          
          }
           int i = Integer.parseInt( SR ); 
           ++i; out.print("value of i="+i+"  ");
             st.addBatch("insert into vendor values('"+i+"','"+sqlTime+"','0','"+cn+"','"+cfn+"','"+cln+"','"+ls+"','"+status+"','"+website+"','"+bwtc+"','"+mobile+"','"+ap+"','"+email+"','"+address1+"','"+address2+"','"+address3+"','"+city+"','"+pincode+"','"+state+"','"+country+"','"+notes+"','"+product+"','"+ownr+"','','','','','','','','','','')");
      
            
       st.executeBatch(); 
        String requestid=Integer.toString(i);
        session.setAttribute("requestid",requestid);
        session.setAttribute("pagetype","newvendorsubmit");
             msg="success";    
       
      rs3.close();
      st.close();
      c.close();   }
        catch(Exception e)
        {
                     String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n newvendorsubmit.jsp-----\n"
                  + "LINE=93 \n insert into vendor values '"+cfn+"','"+cln+"','"+ls+"','"+status+"','"+website+"','"+bwtc+"','"+mobile+"' ";
         Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
       EmergencyEmail.send(e,errormsg); 
     
        }
        finally{
        
           // session.setAttribute("submitmsg",msg);
           // response.sendRedirect("newleads.jsp");
            if(msg.equals("success")){
        response.sendRedirect("vendordetails.jsp");
            }else{
               response.sendRedirect("newvendor.jsp");
            }
        }
        %>
    </body>
</html>
