<%@page import="log.Log"%>
<%@page import="blezz.Db"%>
<%@page import="tables.GetDaterange1"%>
<%@page import="tables.TablePQP"%>
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
        <% 
            HttpSession session1 = request.getSession(); // reuse existing
            String usercid_id=(String)session1.getAttribute("usercid_id");
            String usercid_email=(String)session1.getAttribute("usercid_email");
            String useraccountype=(String)session1.getAttribute("useraccountype");
            String usercid_name=(String)session1.getAttribute("usercid_name");
            String usercid_adminid=(String)session1.getAttribute("usercid_adminid");
            String usercid_company=(String)session1.getAttribute("usercid_company");
            String usercid_website=(String)session1.getAttribute("usercid_website"); 
                
                
            String requestcid=null;
              requestcid=request.getParameter("customerid");
        
           String invoicetype=request.getParameter("invoicetype");
           System.out.println(invoicetype+"ch1");
            if (session != null) {
                if (session1.getAttribute("usercid_id") == null) {
                    response.sendRedirect("signout.jsp");
                } 
            }
             Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" -------------Entering exceldownloadtpqp.jsp------------useradmindid="+usercid_adminid+",usercid="+usercid_id);

        %>
        <% 
                     
                    
            String dater = request.getParameter("datepicker");

                                 Log.writeLog("Requestcid="+requestcid);

             GetDaterange1 gd = new GetDaterange1(); 
             TablePQP ti = new TablePQP(); 
             String datefrom= request.getParameter("datefrom");
             System.out.println(datefrom+"ol");
             String dateto= request.getParameter("dateto");
             System.out.println(dateto+"oi");
              int n123=ti.getCount(datefrom,dateto,requestcid,invoicetype);
             System.out.println(n123);
             String leaddata[][]=new String[n123+10][256];
             leaddata=ti.getTable(datefrom,dateto,requestcid,invoicetype);
             response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
                response.setHeader("Content-Disposition", "inline; filename=" + "Datatable.xls");
                  
                 
        %>
        <table>
            <thead>
                <tr>
                    <th>S.No</th>
                    <th>Date</th>
                    <th>Name</th>
                    <th>Net Amount</th>
                    <th>Owner</th>
                </tr>
            </thead>
            <tbody>
                <% int  m=0; for(m=n123;m>0;m--) {  %>
                <tr>
                    <td><% out.print(leaddata[m][1]); %></a></td>
                    <td><% out.print(leaddata[m][2].substring(0,11)); %></td>
                    <td><% out.print(leaddata[m][13]); %></td>
                    <td><% out.print(leaddata[m][54]); %></td>
                    <td><% out.print(leaddata[m][4]); %></td> 

                    <% } %>
                </tr>

            </tbody>

        </table>
    </body>
</html>
