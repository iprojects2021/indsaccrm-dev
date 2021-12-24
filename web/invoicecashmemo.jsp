<%-- 
    Document   : test
    Created on : Mar 18, 2018, 5:19:22 PM
    Author     : INDSAC
--%>

<%@page import="blezz.Nd"%>
<%@page import="log.Log"%>
<%@page import="email.EmergencyEmail"%>
<%@page import="java.math.RoundingMode"%>
<%@page import="java.math.BigDecimal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="blezz.Poul"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         
       <%  
                 HttpSession session1 = request.getSession(); // reuse existing
                 String usercid_id=(String)session1.getAttribute("usercid_id");
                 String usercid_email=(String)session1.getAttribute("usercid_email");
                 String useraccountype=(String)session1.getAttribute("useraccountype");
                 String usercid_name=(String)session1.getAttribute("usercid_name");
                 String usercid_adminid=(String)session1.getAttribute("usercid_adminid");
                 String usercid_company=(String)session1.getAttribute("usercid_company");
                 String usercid_website=(String)session1.getAttribute("usercid_website"); 
                 if (session != null) 
                 {
                     if (session1.getAttribute("usercid_id") == null)
                    {
                        response.sendRedirect("signout.jsp");
                    } 
                 }       
                 Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Entering invoicecashmemo.jsp-----");
                 
                 String msg=null;  int iiil=0;
                 String a1[]=new String[256];
                 String b1[]=new String[140]; 
                 String pro=request.getParameter("pro");
                 String cod=request.getParameter("cod");
                 String qt=request.getParameter("qt");
                 String rate=request.getParameter("rate");
                 String amt=request.getParameter("amt");
                 String incid=request.getParameter("incid");
                 String max=request.getParameter("max");
                 String pagetype=Poul.escapeHtml(request.getParameter("type"));
                 if(("cashreceipt").equals(pagetype)){
                 out.print("entered");
                 String SR=null,check=null,receiptid=null;
                 String contact=Poul.escapeHtml(request.getParameter("contact"));
                 String owner=Poul.escapeHtml(request.getParameter("owner"));
                 String depositorname=Poul.escapeHtml(request.getParameter("depositorname"));
                 String amtreceived=Poul.escapeHtml(request.getParameter("amtreceived"));
                 String mop=Poul.escapeHtml(request.getParameter("mop"));
                 String payref=Poul.escapeHtml(request.getParameter("payref"));
                 String dueamount=Poul.escapeHtml(request.getParameter("dueamount"));
                 String notes=Poul.escapeHtml(request.getParameter("notes"));
                  String businessinvoiceno=Poul.escapeHtml(request.getParameter("bino")); 
                
                 BigDecimal  tar= new BigDecimal( dueamount );
                 BigDecimal  ar= new BigDecimal( amtreceived );
                 String balance="0";
                 BigDecimal  blance= new BigDecimal( balance );
                 blance=tar.subtract(ar);
                 java.util.Date date=new java.util.Date();
                 java.sql.Date sqlDate=new java.sql.Date(date.getTime());
                 java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());
                 try{
                     Connection c=Poul.getConnectionCRM();
                     Statement st=c.createStatement();
                     ResultSet rs3;
                     rs3 = st.executeQuery("select  *  FROM paymentinfo  ");
                     while(rs3.next())
                     {
                         SR=rs3.getString(1);
                         check=rs3.getString(3);
          
                     }
                     int i = Integer.parseInt( SR ); 
                     ++i;  
                     st.addBatch("INSERT INTO paymentinfo (id,datetime,owner,contact,invoiceid,depositorname,amountrecieved,modeofpayment,reference,balance,businessinvoiceid,notes,useradminid,usercid,customerid) VALUES ('"+i+"','"+sqlTime+"','"+owner+"','"+contact+"','"+incid+"','"+depositorname+"','"+amtreceived+"','"+mop+"','"+payref+"','"+blance+"','"+businessinvoiceno+"','"+notes+"','"+usercid_adminid+"','"+usercid_id+"','"+contact+"');"); 
                     // st.addBatch("insert into paymentinfo (id,datetime,read) values ('"+i+"','"+sqlTime+"','y')"); 
                     st.executeBatch(); 
                     System.out.print("success");
                     receiptid=Integer.toString(i);
                     msg="success";    
                     rs3.close();
                     st.close();
                     c.close();
                 }
                 catch(Exception e)
                 {
                   String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoicecashmemo.jsp-----\n"
     + "LINE=104 + \n select  *  FROM paymentinfo ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg); 
                 }
                 try
                 {
                     Connection c=Poul.getConnectionCRM();
                     Statement st=c.createStatement();
                     st.addBatch("update invoice set   bk_='"+blance+"'   where id='"+incid+"'");
                     st.executeBatch();
                     st.close();
                     c.close();
                 }
                 catch(Exception e)
                 {
                    String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoicecashmemo.jsp-----\n"
     + "LINE=120 + \n update invoice set   bk_='"+blance+"'   where id='"+incid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg); 
                 }
                 if("success".equals(msg)){String invoiceformat=menu.InvoiceMenu.getInvoiceFormat(usercid_adminid);
                     response.sendRedirect("invoice"+invoiceformat+".jsp?2a2e2a696e636964="+Nd.Encrypt(incid)+"#sn");
                 }
                 else
                 {
                     Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   --  Entring invoicecashmemo.jsp------redirecting to-------errorinvoice.jsp-------");
                     response.sendRedirect("errorinvoice.jsp");
                 }
                 }
           %>     
    </body>
    
</html>
