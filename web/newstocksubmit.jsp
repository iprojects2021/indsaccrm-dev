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
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   --  Entring newstocksubmit.jsp---");
%>
        <%
            String vid=Poul.escapeHtml(request.getParameter("vid"));
             String billnumber=Poul.escapeHtml(request.getParameter("billnumber"));
        String productname=Poul.escapeHtml(request.getParameter("productname"));
         String productcode=Poul.escapeHtml(request.getParameter("productcode"));
        String newproductname=Poul.escapeHtml(request.getParameter("newproductname"));
        String newproductcode=Poul.escapeHtml(request.getParameter("newproductcode"));
        String productcategory=Poul.escapeHtml(request.getParameter("productcategory"));
        String newcategory=Poul.escapeHtml(request.getParameter("newcategory"));
        String status=Poul.escapeHtml(request.getParameter("status"));
        String buyingprice=Poul.escapeHtml(request.getParameter("buyingprice"));
        String sellingprice=Poul.escapeHtml(request.getParameter("sellingprice"));
        String quantity=Poul.escapeHtml(request.getParameter("quantity"));
        String notes=Poul.escapeHtml(request.getParameter("notes"));
       String limit=Poul.escapeHtml(request.getParameter("limit"));
     String category="";
        
        int newstockid=0;String Newstockid="";
        String msg="null";
        java.util.Date date=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());
        String owner=(String)session.getAttribute("owner"); 
        String id=(String)session.getAttribute("id"); 
       String ownr=(String)session.getAttribute("ownr"); 
       
        String SR=null;
        if(productcategory!=""){category=productcategory;}
        if(newcategory!=""){category=newcategory;}
          if(newproductname!=""){
         try{
        
Connection c=Poul.getConnectionCRM();

out.print("entered page");
Statement st=c.createStatement();
           ResultSet rs3;
               rs3 = st.executeQuery("select  id  FROM stock ORDER BY id DESC LIMIT 1 ");
    while(rs3.next())
        
          {SR=rs3.getString(1);
          
          }
           int i = Integer.parseInt( SR ); 
           ++i; out.print("value of i="+i+"  ");
           newstockid=i;
             st.addBatch("insert into stock values('"+i+"','"+newproductname+"','"+quantity+"','"+limit+"','"+newproductcode+"','"+sellingprice+"','"+category+"','','','','','','"+usercid_adminid+"','"+usercid_id+"','"+vid+"','"+status+"')");
      
            
       st.executeBatch(); 
       rs3.close();
      st.close();
      c.close();   }
          catch(Exception e)
        {
             String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n newstocksubmit.jsp-----\n"
     + "LINE=97 \n insert into stock values '"+newproductname+"','"+quantity+"','"+limit+"','"+newproductcode+"'  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
        }
        
          
        
        
        
        try{
        
Connection c=Poul.getConnectionCRM();


out.print("entered page");
Statement st=c.createStatement();
           ResultSet rs3;
               rs3 = st.executeQuery("select  id  FROM stocklog ORDER BY id DESC LIMIT 1  ");
    while(rs3.next())
        
          {SR=rs3.getString(1);
          
          }
           int i = Integer.parseInt( SR ); 
           ++i; out.print("value of i="+i+"  ");
           Newstockid=String.valueOf(newstockid);
             st.addBatch("insert into stocklog values('"+i+"','"+sqlTime+"','"+vid+"','"+ownr+"','"+newproductname+"','"+newproductcode+"','"+category+"','"+status+"','"+buyingprice+"','"+sellingprice+"','"+quantity+"','"+notes+"','"+billnumber+"','','','','','','','','','','','add','','','"+Newstockid+"','','','','"+usercid_adminid+"','"+usercid_id+"','"+vid+"')");
      
            
       st.executeBatch(); 
        String requestid=Integer.toString(i);
        session.setAttribute("requestid",requestid);
        session.setAttribute("pagetype","newstocksubmit");
             msg="success";    
       
      rs3.close();
      st.close();
      c.close();   }
        catch(Exception e)
        {
             String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n newstocksubmit.jsp-----\n"
     + "LINE=139 \n insert into stocklog values '"+newproductname+"','"+newproductcode+"' ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
        }
        
      
          }
        
          
          
          
          if(productname!=""){
              
              int i=0,j=0; 
          String data="null",pname="null",pcode="null";
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from stock where id=?");
        smt.setString(1,productname);
        ResultSet rs=smt.executeQuery();
     i=1;
        while(rs.next())
            
        {  pname=rs.getString(2);
           data=rs.getString(3);
           pcode=rs.getString(5);
            
        }
      rs.close();
      smt.close();
      con.close();  } catch(Exception e){ 
                 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n newstocksubmit.jsp-----\n"
     + "LINE=171 \n select * from stock where id= "+productname+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
      }
         try{
             System.out.println("data="+data);
             int da=Integer.parseInt(data);
             int qnty=Integer.parseInt(quantity);
             System.out.println("quantity="+quantity);
             System.out.println(data);
             da=da+qnty;
             data=String.valueOf(da);
        System.out.println("da="+da);
Connection c=Poul.getConnectionCRM();

PreparedStatement smt=c.prepareStatement("UPDATE stock SET quantity=? WHERE id=?");
        smt.setString(1,data);
        smt.setString(2,productname);
            int row = smt.executeUpdate();
     // rs.close();
      smt.close();
      c.close();    }
          catch(Exception e)
        {
                       String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n newstocksubmit.jsp-----\n"
     + "LINE=197 \n UPDATE stock SET quantity="+data+" WHERE id="+productname+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
        }
        
          
        
        out.println("   "+pname+"    "+pcode);
        
        try{
        
Connection c=Poul.getConnectionCRM();


out.print("entered page");
Statement st=c.createStatement();
           ResultSet rs3;
               rs3 = st.executeQuery("select  id  FROM stocklog ORDER BY id DESC LIMIT 1  ");
    while(rs3.next())
        
          {SR=rs3.getString(1);
          
          }
           int ii = Integer.parseInt( SR ); 
           ++ii; out.print("value of i="+ii+"  ");
             st.addBatch("insert into stocklog values('"+ii+"','"+sqlTime+"','"+vid+"','"+ownr+"','"+pname+"','"+pcode+"','"+category+"','"+status+"','"+buyingprice+"','"+sellingprice+"','"+quantity+"','"+notes+"','"+billnumber+"','','','','','','','','','','','add','','','"+productname+"','','','','"+usercid_adminid+"','"+usercid_id+"','"+vid+"')");
      
            
       st.executeBatch(); 
        String requestid=Integer.toString(i);
        session.setAttribute("requestid",requestid);
        session.setAttribute("pagetype","newstocksubmit");
             msg="success";    
       
      rs3.close();
      st.close();
      c.close();   }
        catch(Exception e)
        {
                           String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n newstocksubmit.jsp-----\n"
     + "LINE=238 \n insert into stocklog values '"+pname+"','"+pcode+"','"+category+"','"+status+"','"+buyingprice+"' ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
        }
        
      
          }
          
        
        
           // session.setAttribute("submitmsg",msg);
           // response.sendRedirect("newleads.jsp");
          if(msg.equals("success")){
              String location="vendordetails.jsp?2a2e2a766964="+Nd.Encrypt(vid)+"&2a2e2a74797065=2a2e2a76656e646f72";
        response.sendRedirect(location);
            }else{
              Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   --------Entring newstocksubmit.jsp--------Redirecting To--------error.jsp-----------------");
              response.sendRedirect("error.jsp");
            }
       
        %>
    </body>
</html>
