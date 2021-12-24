<%@page import="log.Log"%>
<%@page import="blezz.Db"%>
<%@page import="tables.GetDaterange"%>
<%@page import="tables.CLVTable"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="blezz.Poul"%>
<%@page import="blezz.Nd"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
       
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <% 
                HttpSession session1 = request.getSession(); // reuse existing
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
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" ------------Entering exceldownload.jsp-------------");
            %>
            
                <%    
                    
                String customerType = request.getParameter("customerType");
                CLVTable clvt = new CLVTable(); 
                String datefrom= request.getParameter("datefrom");
                    System.out.println(datefrom);
                    String dateto= request.getParameter("dateto");
                    System.out.println(dateto);
                    String status= request.getParameter("status");
                    int n123=clvt.getCount(datefrom,dateto,usercid_id,usercid_adminid,customerType,status);
                    System.out.println(n123);
                  String leaddata[][]=new String[n123+10][50];
                  
                  leaddata=clvt.getTable(datefrom,dateto,usercid_id,usercid_adminid,customerType,status);
                  
                 Log.writeLog("Excel Downloaded");
                response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
			response.setHeader("Content-Disposition", "inline; filename=" + "Datatable.xls");
                %>
               
                                        <table >
                                            <thead>
                                                <tr>
                                                    <th>Date   </th>
                                                    <th>Company</th>
                                                    <th>Name</th>
                                                    <th>  Phone</th>
                                                    <th> Phone2</th>
                                                    <th> Email Id</th>
                                                    <th> City</th>
                                                    <th> Status</th>
                                                    <th> Owner</th>
                                                </tr>
                                            </thead>
                                            <tbody> 
                                                <% int m=0; for(m=n123;m>0;m--) {  %>
                                                <tr>
                                                    <td><% out.print(leaddata[m][1]); %></a></td>
                                                    <td><% out.print(leaddata[m][2]); %></td>
                                                    <td><% out.print(leaddata[m][3]); %></td>
                                                    <td><% out.print(leaddata[m][4]); %></td>
                                                    <td><% out.print(leaddata[m][5]); %></td>
                                                    <td><% out.print(leaddata[m][6]); %></td>
                                                    <td><% out.print(leaddata[m][7]); %></td>
                                                    <td><% out.print(leaddata[m][8]); %></td>
                                                    <td><% out.print(Db.getEmployeeName(leaddata[m][9])); %></td>
                                                </tr>
                                                <% } %>
                                            </tbody>
                                        </table>
                                   
    </body>
</html>
