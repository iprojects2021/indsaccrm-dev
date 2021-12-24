
<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="blezz.Poul"%>
<%@page import="java.sql.Connection"%>
<%@page import="blezz.DbToExcelDatabase"%>
<%@page import="blezz.DbToExcelModelDatabase"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body> 
    <%   HttpSession session1 = request.getSession(); // reuse existing
    
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
 Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Entering downloadexcel.jsp----------Compose Mail---");
%>
	<%@ page import="java.util.*"%>
<%  
  int i=1,j=0;
           String count="NULL";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from contact where useradminid=? and customertype=?");
        smt.setString(1,usercid_adminid);
        smt.setString(2,"customer");
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count=rs.getString(1);  }
      rs.close();
      smt.close();
      con.close();  } catch(Exception e)
      { 
           String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n downloadexcel.jsp-----\n"
     + "LINE=52 + \n select count(*) from contact where useradminid="+usercid_adminid+" and customertype= customer  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
     
      }
      
       int n=Integer.parseInt(count);
       String taskdata[][]=new String[n+1][55];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from contact where useradminid=? and customertype=?");
        smt.setString(1,usercid_adminid);
        smt.setString(2,"customer");
        ResultSet rs=smt.executeQuery();
     i=1;
        while(rs.next())
        { 
           for( j=1;j<=32;j++)
          {
            taskdata[i][j]=rs.getString(j); 
           
          }
           ++i;  
        }
     rs.close();
      smt.close();
      con.close();   } 
        catch(Exception e)
      {
        String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n downloadexcel.jsp-----\n"
     + "LINE=81 + \n select count(*) from contact where useradminid="+usercid_adminid+" and customertype= customer  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);  
      }
%>
	<table cellpadding="1" cellspacing="1" border="1" bordercolor="gray">
		<tr>
			
			<th>Timestamp</th>
			<th>Company</th>
			<th>Name</th>
			<th>Mobile Number</th>
			<th>Alternate Contact Number</th>
			<th>Email Id</th>
			<th>Address</th>
			<th>City</th>
			<th>Pincode</th>
			<th>State</th>
			<th>Country</th>
			<th>Gstin</th>
		</tr>

		<% for(i=1;i<=n;++i){  %>
		<tr>
			
			<td><%=taskdata[i][2] %></td>
			<td><%=taskdata[i][5]%></td>
			<td><%=taskdata[i][6]%>&nbsp;&nbsp;<%=taskdata[i][7]%></td>
			<td><%=taskdata[i][20]%></td>
			<td><%=taskdata[i][21]%></td>
			<td><%=taskdata[i][23]%></td>
			<td><%=taskdata[i][30]%></td>
			<td><%=taskdata[i][31]%></td>
			<td><%=taskdata[i][32]%></td>
			<td><%=taskdata[i][33]%></td>
			<td><%=taskdata[i][34]%></td>
			<td><%=taskdata[i][35]%></td>

		</tr>
		<%
			}
		%>
	</table>

</body>
</html>