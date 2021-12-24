<%@ page errorPage="mailsetting.jsp" %>  
<%@page import="blezz.EmailUtility2"%>
<%@page import="blezz.Nd"%>
<%@page import="menu.Email"%>
<%   
    
    String mat=request.getParameter("mat");
    if("testmail".equals(mat)){
HttpSession session1 = request.getSession(); // reuse existing
    
          String usercid_id=(String)session1.getAttribute("usercid_id");
          String usercid_email=(String)session1.getAttribute("usercid_email");
          String useraccountype=(String)session1.getAttribute("useraccountype");
          String usercid_name=(String)session1.getAttribute("usercid_name");
          String usercid_adminid=(String)session1.getAttribute("usercid_adminid");
             String usercid_company=(String)session1.getAttribute("usercid_company");
          String usercid_website=(String)session1.getAttribute("usercid_website"); 
        	 String usercid_avatar=(String)session1.getAttribute("usercid_avatar");
                 
String data[]=new String [5];
data=Email.getActiveEmailSettingDetail(usercid_adminid, usercid_id);

String ActiveEmail="",host="",password="",port="";
ActiveEmail=data[1];
password=Nd.Decrypt(data[2]);
host=data[3];
port=data[4];

String email1=request.getParameter("email1");
String general=request.getParameter("general");

if(email1.equals(ActiveEmail)){
EmailUtility2.sendEmailWithAttachment(host, port, ActiveEmail, password, ActiveEmail, "Test Mail","This is test email. Email Successfully Received", null);
response.sendRedirect("mailsetting.jsp?mar=testemail&m=Email+send+Successfully");
}




    }






%>
