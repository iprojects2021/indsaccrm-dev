<%-- 
    Document   : ConvertToCustomer
    Created on : 19 Jun, 2020, 11:43:47 AM
    Author     : Sachin
--%>

<%@page import="java.sql.Statement"%>
<%@page import="blezz.Poul"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <% 
         String cid=request.getParameter("val");
            try{  
        Connection c=Poul.getConnectionCRM();

Statement st=c.createStatement();
          

                            
    try{     
         java.util.Date ddate=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(ddate.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(ddate.getTime());
  st.addBatch("update contact set   customertype='customer',convertdate='"+sqlTime+"'  where id='"+cid+"'");
        
       st.executeBatch(); 
      
      response.sendRedirect("../contactdetails.jsp?type=contact&cid="+cid+"");
  
      st.close();
      c.close();
    }catch(Exception e){e.printStackTrace();}
            }catch(Exception e){e.printStackTrace();}     
            
               
       %>
    </body>
</html>
