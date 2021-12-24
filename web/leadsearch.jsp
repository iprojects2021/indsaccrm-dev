<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
<%@page import="blezz.Db"%>
<%@page import="java.util.ArrayList"%>
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
  <meta charset="utf-8"><link rel="shortcut icon" href="dist/img/u.png" type="image/x-icon" /> 
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Search Lead | INDSAC CRM</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
  
 <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">

  <!-- DataTables -->
  <link rel="stylesheet" href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
</head>
<body class="hold-transition skin-blue sidebar-mini">
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
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   --  Entring leadsearch.jsp---");
%>

  
<div class="wrapper">

  <jsp:include page="dist/include/leftmenu.jsp" />  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
 
	
	 <section class="content-header">
             
             	<% String tksrch=request.getParameter("tksrch");
                String type=request.getParameter("type");
                        if("duedate".equals(tksrch)){
                            String duedate=request.getParameter("duedate");
                          
                           
                             if(duedate.equals("") || duedate.equals(null)|| duedate.equals("null")){ response.sendRedirect("");} 
                             duedate=Character.toString(duedate.charAt(6))+Character.toString(duedate.charAt(7))+Character.toString(duedate.charAt(8))+Character.toString(duedate.charAt(9))+"-"+Character.toString(duedate.charAt(0))+Character.toString(duedate.charAt(1))+"-"+Character.toString(duedate.charAt(3))+Character.toString(duedate.charAt(4));
    duedate=duedate+" 23:59:59";
             String dbdate=null;
           int i=0,j=0,CH=0;
           String count1;  count1="1";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from task where useradminid='"+usercid_adminid+"' AND   duedate='"+duedate+"' ; ");
       
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count1=rs.getString(1);  }
       rs.close();
      smt.close();
      con.close(); } catch(Exception e){ 
          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n leadsearch.jsp-----\n"
                   + "\n LINE=99 \n select * from task where useradminid='"+usercid_adminid+"' AND   duedate='"+duedate+"' ";
         Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
       EmergencyEmail.send(e,errormsg);
      }
      
       int n1=Integer.parseInt(count1);
       String taskdata1[][]=new String[n1+1][55];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from task where useradminid='"+usercid_adminid+"'  and  duedate='"+duedate+"';  ");
       
        ResultSet rs=smt.executeQuery();
     i=1;
        while(rs.next())
        {  
               CH++;
           for( j=1;j<=13;j++)
          {
            taskdata1[i][j]=rs.getString(j); 
           
          } 
           ++i;  
        }
    rs.close();
      smt.close();
      con.close();    } catch(Exception e){ 
           String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n leadsearch.jsp-----\n"
                   + "\n LINE=125 \n select * from task where useradminid='"+usercid_adminid+"'  and  duedate='"+duedate+"' ";
         Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
       EmergencyEmail.send(e,errormsg);
      }
        
                    
      %> 
          
          
          
          
	 <div class="row invoice">
               
    <div class="col-md-12" >
     
        <div class="box box-info"> 
            <div class="box-header with-border">
              
 <div class="box-header with-border">
          <h3 class="box-title"> Task Search Result</h3>
          <form action="">        <button type="submit" class="btn btn-info pull-right"  > Search More Task</button></form>
            
        </div>
            
               
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <table  id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                       <th>Task ID  </th>
                  <th>Subject</th>
                  <th>Status</th>
                  <th>  Due Date</th>
                  <th> Priority</th>
                   <th> Owner</th>
                  </tr>
                  </thead>
                  
             

                   <tbody>   
                      
                      
                  <% int m=0; for(m=CH;m>0;m--) {
                       %>
                  <tr>
                    
                     <td ><a href="taskedit.jsp?tid=<%=taskdata1[m][1] %>"><% out.print("TSK"+taskdata1[m][1]); %></a></td>
                    
                    <td><% out.print(taskdata1[m][4]); %></td>
                    <td>
                         <% out.print(taskdata1[m][7]); %>
                     </td>
                     <td><% out.print((taskdata1[m][5]).substring(0, 10));  %></td>
                   <td> 
                         <% out.print(taskdata1[m][6]); %>
                   </td>
                     <td><%=Db.getEmployeeName(taskdata1[m][13]) %></td>
                 
                  </tr>
                  <% } %>
                 </tbody>
             </table>
              </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
           
          </div>
          <!-- /.box -->
        </div>
        <!-- ./col -->
		</div>
		 <% } %>
	
		
             
          <% 
                        if("priority".equals(tksrch)){
                            String priority=request.getParameter("priority");
                            
             String dbdate=null;
           int i=0,j=0,CH=0;
           String count1;  count1="1";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select COUNT(*) from task where useradminid='"+usercid_adminid+"' AND   priority='"+priority+"'; ");
       
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count1=rs.getString(1);  }
      rs.close();
      smt.close();
      con.close();  } catch(Exception e){ 
          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n leadsearch.jsp-----\n"
                   + "\n LINE=221 \n select COUNT(*) from task where useradminid='"+usercid_adminid+"' AND   priority='"+priority+"' ";
         Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
       EmergencyEmail.send(e,errormsg);
        }
      
       int n1=Integer.parseInt(count1);
       String taskdata1[][]=new String[n1+1][55];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from task where useradminid='"+usercid_adminid+"'  and  priority='"+priority+"'; ");
       
        ResultSet rs=smt.executeQuery();
     i=1;
        while(rs.next())
        {  
               CH++;
           for( j=1;j<=13;j++)
          {
            taskdata1[i][j]=rs.getString(j); 
           
          } 
           ++i;  
        }
    rs.close();
      smt.close();
      con.close();    } catch(Exception e){ 
          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n leadsearch.jsp-----\n"
                   + "\n LINE=247 \n select * from task where useradminid='"+usercid_adminid+"'  and  priority='"+priority+"' ";
         Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
       EmergencyEmail.send(e,errormsg);
      }
        
                    
      %> 
          
          
          
          
	 <div class="row invoice">
               
    <div class="col-md-12" >
     
        <div class="box box-info"> 
            <div class="box-header with-border">
              
 <div class="box-header with-border">
          <h3 class="box-title"> Task Search Result</h3>
          <form action="">        <button type="submit" class="btn btn-info pull-right"  > Search More Task</button></form>
            
        </div>
            
               
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <table  id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                       <th>Task ID  </th>
                  <th>Subject</th>
                  <th>Status</th>
                  <th>  Due Date</th>
                  <th> Priority</th>
                   <th> Owner</th>
                  </tr>
                  </thead>
                  
             

                   <tbody>   
                      
                      
                  <% int m=0; for(m=CH;m>0;m--) {
                       %>
                  <tr>
                    
                     <td ><a href="taskedit.jsp?tid=<%=taskdata1[m][1] %>"><% out.print("TSK"+taskdata1[m][1]); %></a></td>
                    
                   <td><% out.print(taskdata1[m][4]); %></td>
                    <td>
                         <% out.print(taskdata1[m][7]); %>
                     </td>
                     <td><% out.print((taskdata1[m][5]).substring(0, 10));  %></td>
                   <td> 
                         <% out.print(taskdata1[m][6]); %>
                   </td>
                     <td><%=Db.getEmployeeName(taskdata1[m][13]) %></td>
                  </tr>
                  <% } %>
                 
                 
                  </tbody>
                 
                  
                  
                  
                  
                  
                  
                  
                </table>
              </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
           
          </div>
          <!-- /.box -->
        </div>
        <!-- ./col -->
		</div>
		 <% } %>
	
		
             
             
             <% 
                        if("status".equals(tksrch)){
                            String status=request.getParameter("status");
                            
             String dbdate=null;
           int i=0,j=0,CH=0;
           String count1;  count1="1";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select COUNT(*) from task where useradminid='"+usercid_adminid+"'  and  status='"+status+"'; ");
       
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count1=rs.getString(1);  }
     rs.close();
      smt.close();
      con.close();   } catch(Exception e){ 
          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n leadsearch.jsp-----\n"
                   + "\n LINE=353 \n select COUNT(*) from task where useradminid='"+usercid_adminid+"'  and  status='"+status+"'' ";
         Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
       EmergencyEmail.send(e,errormsg);
      }
      
       int n1=Integer.parseInt(count1);
       String taskdata1[][]=new String[n1+1][55];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from task where useradminid='"+usercid_adminid+"'  and  status='"+status+"'; ");
       
        ResultSet rs=smt.executeQuery();
     i=1;
        while(rs.next())
        {  
               CH++;
           for( j=1;j<=13;j++)
          {
            taskdata1[i][j]=rs.getString(j); 
           
          } 
           ++i;  
        }
    rs.close();
      smt.close();
      con.close();    } catch(Exception e){ 
           String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n leadsearch.jsp-----\n"
                   + "\n LINE=379 \n select * from task where useradminid='"+usercid_adminid+"'  and  status='"+status+"' ";
         Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
       EmergencyEmail.send(e,errormsg);
      }
        
                    
      %> 
          
          
          
          
	 <div class="row invoice">
               
    <div class="col-md-12" >
     
        <div class="box box-info"> 
            <div class="box-header with-border">
              
 <div class="box-header with-border">
          <h3 class="box-title"> Task Search Result</h3>
          <form action="">        <button type="submit" class="btn btn-info pull-right"  > Search More Task</button></form>
            
        </div>
            
               
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <table  id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                       <th>Task ID  </th>
                  <th>Subject</th>
                  <th>Status</th>
                  <th>  Due Date</th>
                  <th> Priority</th>
                   <th> Owner</th>
                    
                  </tr>
                  </thead>
                  
             

                   <tbody>   
                      
                      
                  <% int m=0; for(m=CH;m>0;m--) {
                       %>
                  <tr>
                    
                     <td ><a href="taskedit.jsp?tid=<%=taskdata1[m][1] %>"><% out.print("TSK"+taskdata1[m][1]); %></a></td>
                    
                    <td><% out.print(taskdata1[m][4]); %></td>
                    <td>
                         <% out.print(taskdata1[m][7]); %>
                     </td>
                     <td><% out.print((taskdata1[m][5]).substring(0, 10));  %></td>
                   <td> 
                         <% out.print(taskdata1[m][6]); %>
                   </td>
                     <td><%=Db.getEmployeeName(taskdata1[m][13]) %></td>
                  </tr>
                  <% } %>
                 
                 
                  </tbody>
                 
                  
                  
                  
                  
                  
                  
                  
                </table>
              </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
           
          </div>
          <!-- /.box -->
        </div>
        <!-- ./col -->
		</div>
		 <% } %>
	
		
                <% 
                        if("customertype".equals(tksrch)){
                            String customertype=request.getParameter("customertype");
                            
             String dbdate=null;
           int i=0,j=0,CH=0;
           String count1;  count1="1";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(t.id) from task t,contact c where t.customerid=c.id and t.useradminid='"+usercid_adminid+"'  and  c.customertype='"+customertype+"'; ");
       
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count1=rs.getString(1);  }
       rs.close();
      smt.close();
      con.close(); } catch(Exception e){ 
          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n leadsearch.jsp-----\n"
                   + "\n LINE=484 \n select count(t.id) from task t,contact c where t.customerid=c.id and t.useradminid='"+usercid_adminid+"'  and  c.customertype='"+customertype+"' ";
         Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
       EmergencyEmail.send(e,errormsg);
      }
      
       int n1=Integer.parseInt(count1);
       String taskdata1[][]=new String[n1+1][55];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select t.id,t.timestamp,t.subject,t.status,t.duedate,t.priority,t.assign,c.customertype from task t,contact c where t.customerid=c.id and t.useradminid='"+usercid_adminid+"'  and  c.customertype='"+customertype+"'; ");
       
        ResultSet rs1=smt.executeQuery();
     i=1;out.println(n1);
        while(rs1.next())
        {  
               CH++;
           for( j=1;j<=9;j++)
          {
            taskdata1[i][j]=rs1.getString(j); 
           
          } 
           ++i;  
        }out.println(taskdata1[2][1]);
     rs1.close();
      smt.close();
      con.close();   } catch(Exception e){
          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n leadsearch.jsp-----\n"
                   + "\n LINE=510 \n select t.id,t.timestamp,t.subject,t.status,t.duedate,t.priority,t.assign,c.customertype from task t,contact c where t.customerid=c.id and t.useradminid='"+usercid_adminid+"'  and  c.customertype='"+customertype+"' ";
         Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
       EmergencyEmail.send(e,errormsg);
      }
        
                    
      %> 
          
          
          
          
	 <div class="row invoice">
               
    <div class="col-md-12" >
     
        <div class="box box-info"> 
            <div class="box-header with-border">
              
 <div class="box-header with-border">
          <h3 class="box-title"> Task Search Result</h3>
          <form action="">        <button type="submit" class="btn btn-info pull-right"  > Search More Task</button></form>
            
        </div>
            
               
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <table  id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                        <th>Task ID  </th>
                  <th>Subject</th>
                  <th>Status</th>
                  <th>  Due Date</th>
                  <th> Priority</th>
                   <th> Owner</th>
                    <th> Type</th>
                  </tr>
                  </thead>
                  
             

                   <tbody>   
                      
                      
                  <% int m=0; for(m=CH;m>0;m--) {
                       %>
                  <tr>
                    
                     <td ><a href="taskedit.jsp?tid=<%=taskdata1[m][1] %>"><% out.print("TSK"+taskdata1[m][1]); %></a></td>
                    
                    <td><% out.print(taskdata1[m][3]); %></td>
                    <td>
                         <% out.print(taskdata1[m][4]); %>
                     </td>
                     <td><% out.print((taskdata1[m][5]).substring(0, 10));  %></td>
                   <td> 
                        <% out.print(taskdata1[m][6]); %>
                   </td>
                    <td> 
                        <%=Db.getEmployeeName(taskdata1[m][7]) %>
                   </td>
                   <td> 
                        <%=(taskdata1[m][8]) %>
                   </td>
                  </tr>
                  <% } %>
                 
                 
                  </tbody>
                 
                  
                  
                  
                  
                  
                  
                  
                </table>
              </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
           
          </div>
          <!-- /.box -->
        </div>
        <!-- ./col -->
		</div>
		 <% } %>
	
             
             
                  	<% 
                        if("daterange".equals(tksrch)){
                            String taskdate=request.getParameter("fromdate");
                            String todate=request.getParameter("todate");
                              String companyname=request.getParameter("companyname");
                                String name=request.getParameter("name");
                                  String mobile=request.getParameter("mobile");
                                    String status=request.getParameter("status");
                                      String priority=request.getParameter("priority");
                                   
                         if(!"".equals(taskdate)){ 
                             taskdate=Character.toString(taskdate.charAt(6))+Character.toString(taskdate.charAt(7))+Character.toString(taskdate.charAt(8))+Character.toString(taskdate.charAt(9))+"-"+Character.toString(taskdate.charAt(0))+Character.toString(taskdate.charAt(1))+"-"+Character.toString(taskdate.charAt(3))+Character.toString(taskdate.charAt(4));
                        }
                             if(!"".equals(todate)){ 
                             todate=Character.toString(todate.charAt(6))+Character.toString(todate.charAt(7))+Character.toString(todate.charAt(8))+Character.toString(todate.charAt(9))+"-"+Character.toString(todate.charAt(0))+Character.toString(todate.charAt(1))+"-"+Character.toString(todate.charAt(3))+Character.toString(todate.charAt(4));
    taskdate=taskdate+" 00:00:00";todate=todate+" 23:59:59";
          
                             }
             String dbdate=null;
           int i=0,j=0,CH=0;
           String count1;  count1="1";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from contact where useradminid='"+usercid_adminid+"' AND customertype='lead' or company like '%"+companyname+"%' or firstname like '%"+name+"%' or lastname like '%"+name+"%' or status like '%"+status+"%' or mobile like '%"+mobile+"%' or alternatephone like '%"+mobile+"%' or  timestamp between '"+taskdate+"' and '"+todate+"'; ");
       
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count1=rs.getString(1);  }
    rs.close();
      smt.close();
      con.close();    } catch(Exception e){ 
          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n leadsearch.jsp-----\n"
                   + "\n LINE=635 \n select count(*) from contact where useradminid='"+usercid_adminid+"' AND customertype='lead' or company like '%"+companyname+"%' or firstname like '%"+name+"%' or lastname like '%"+name+"%' or status like '%"+status+"%' or mobile like '%"+mobile+"%' or alternatephone like '%"+mobile+"%' or  timestamp between '"+taskdate+"' and '"+todate+"' ";
         Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
       EmergencyEmail.send(e,errormsg);
      }
      
       int n1=Integer.parseInt(count1);
       out.println(n1);
       String taskdata1[][]=new String[n1+1][55];
        try{ Connection con=Poul.getConnectionCRM();
       PreparedStatement smt=con.prepareStatement("select * from contact where useradminid='"+usercid_adminid+"' AND customertype='lead' or company like '%"+companyname+"%' or firstname like '%"+name+"%' or lastname like '%"+name+"%' or status like '%"+status+"%' or mobile like '%"+mobile+"%' or alternatephone like '%"+mobile+"%' or  timestamp between '"+taskdate+"' and '"+todate+"'; ");
       
        ResultSet rs=smt.executeQuery();
     i=1;
        while(rs.next())
        {  
               CH++;
           for( j=1;j<=40;j++)
          {
            taskdata1[i][j]=rs.getString(j); 
           
          } 
           ++i;  
        }out.println("ch="+CH);
   rs.close();
      smt.close();
      con.close();     } catch(Exception e){ 
           String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n leadsearch.jsp-----\n"
                   + "\n LINE=662 \n select count(*) from contact where useradminid='"+usercid_adminid+"' AND customertype='lead' or company like '%"+companyname+"%' or firstname like '%"+name+"%' or lastname like '%"+name+"%' or status like '%"+status+"%' or mobile like '%"+mobile+"%' or alternatephone like '%"+mobile+"%' or  timestamp between '"+taskdate+"' and '"+todate+"' ";
         Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
       EmergencyEmail.send(e,errormsg);
      }
        
           out.println("ch="+CH);         
      %> 
          
          
          
          
	 <div class="row invoice">
               
    <div class="col-md-12" >
     
        <div class="box box-info"> 
            <div class="box-header with-border">
              
 <div class="box-header with-border">
          <h3 class="box-title"> Task Search Result</h3>
          <form action="">        <button type="submit" class="btn btn-info pull-right"  > Search More Task</button></form>
            
        </div>
            
               
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <table  id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                         <th>Task ID  </th>
                  <th>Subject</th>
                  <th>Status</th>
                  <th>  Due Date</th>
                  <th> Priority</th>
                   <th> Owner</th>
                    
                  </tr>
                  </thead>
                  
             

                   <tbody>   
                      
                      
                  <% int m=0; for(m=CH;m>0;m--) {
                       %>
                  <tr>
                    
                     <td ><a href="taskedit.jsp?tid=<%=taskdata1[m][1] %>"><% out.print("TSK"+taskdata1[m][1]); %></a></td>
                    
                    <td><% out.print(taskdata1[m][4]); %></td>
                    <td>
                         <% out.print(taskdata1[m][7]); %>
                     </td>
                     <td><% out.print((taskdata1[m][5]));  %></td>
                   <td> 
                         <% out.print(taskdata1[m][6]); %>
                   </td>
                     <td><%=Db.getEmployeeName(taskdata1[m][13]) %></td>
                  </tr>
                  <% } %>
                 
                 
                  </tbody>
                 
                  
                  
                  
                  
                  
                  
                  
                </table>
              </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
           
          </div>
          <!-- /.box -->
        </div>
        <!-- ./col -->
		</div>
		 <% } %>
	
		
             
             
         <div class="row">
        <div class="col-md-6">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Search Lead</h3>
            </div> <form action="" method="POST">
            <!-- /.box-header -->
            <div class="box-body">
              <table class="table table-bordered">
            
                <tr>
                  <td>Created From</td>
                  <td>     <input type="text" class="form-control pull-right" name="fromdate" id="datepicker1"  autocomplete="off">
               </td>
               <td>To</td>
                  <td>
                       <input type="text" class="form-control pull-right" name="todate" id="datepicker2"  autocomplete="off">
                
                  </td>
                </tr>
                <tr>
                  <td>Company Name</td>
                  <td>   <input type="text" class="form-control pull-right" name="companyname" id="companyname" autocomplete="off">
                </td>
                </tr>
                <tr>
                  <td>Name</td>
                  <td>   <input type="text" class="form-control pull-right" name="name" id="name" autocomplete="off">
                </td>
                </tr>
                <tr>
                  <td>Mobile</td>
                  <td>   <input type="text" class="form-control pull-right" name="mobile" id="mobile" autocomplete="off">
                </td>
                </tr>
               <tr>
                  <td>Status</td>
                  <td>    <select id="status" class="form-control pull-right"   name="status" >
                          <option value="">Select</option>
                          <option value="Open">Open</option>
                          <option value="Attempted Contact">Attempted Contact</option>
                            <option value="Not Engaged">Not Engaged</option>
                            <option value="Needs Follow Up">Needs Follow Up</option>
                            <option value="Working">Working</option>
                              <option value="New Oppurtunity">New Oppurtunity</option>
                                <option value="Qualified">Qualified</option>
                                <option value="Disqualified">Disqualified</option>
                     </select>
                </td>
                </tr>
              
              </table>
            </div>
            <!-- /.box-body -->
            <div class="box-footer clearfix">
               <button type="submit" class="btn btn-info pull-left" onClick="return validateForm()" type="submit"> Search</button>
             <input type="hidden" name="tksrch" id="tasksearch" value="daterange">
          
            </div>
            </form>
          </div>
          <!-- /.box -->  
        </div>
         </div>
             
             
             
             
    <!-- SELECT2 EXAMPLE -->
     <div class="row">
          <div class="col-md-3">
      <div class="box box-default ">
       <!-- /.box-header -->
        <div class="box-body">
              <div class="box-header with-border">
          <h3 class="box-title"> Lead By Created Date</h3>
        </div>
          
              <form action="" method="POST">
            <div class="col-md-12">
             		<div class="form-group">
                <label for="inputEmail3" class=" control-label">From</label>
<div class="col-sm-12">
                <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                    <input type="text" class="form-control pull-right" name="fromdate" id="datepicker1" required="" autocomplete="off">
                </div>
</div>
                <!-- /.input group -->
              </div>
                
              <!-- /.form-group -->
                <div class="form-group">
                <label for="inputEmail3" class=" control-label">To </label>
<div class="col-sm-12">
                <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                    <input type="text" class="form-control pull-right" name="todate" id="datepicker2" required="" autocomplete="off">
                </div>
</div>
                <!-- /.input group -->
                </div>
               
              <br>
              <!-- /.form group -->
            <button type="submit" class="btn btn-info pull-left" onClick="return validateForm()" type="submit"> Search</button>
             <input type="hidden" name="tksrch" id="tasksearch" value="daterange">
           </div>
          </form>
               <!-- /.col -->
        </div>
        <!-- /.box-body -->
      </div>
      <!-- /.box -->
 </div>
      <!-- /.col -->
        <div class="col-md-3">
      <div class="box box-default ">
       <!-- /.box-header -->
        <div class="box-body">
              <div class="box-header with-border">
          <h3 class="box-title"> Lead By Due Date</h3>
        </div>
           
              <form action="" method="POST">
                  <div class="col-md-12"><br>
             		<div class="form-group">
                <label for="inputEmail3" class=" control-label">Due Date</label>
<div class="col-sm-12">
                <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                    <input type="text" class="form-control pull-right" name="duedate" id="datepicker3" required="" autocomplete="off">
                </div>
</div>
                <!-- /.input group -->
                        </div>
              <!-- /.form-group -->
           
              <!-- /.form group --><br><br><br>
            <button type="submit" class="btn btn-info pull-left" onClick="return validateForm()" type="submit"> Search</button>
             <input type="hidden" name="tksrch" id="tasksearch" value="duedate">
           </div>
          </form>
               <!-- /.col -->
        </div>
        <!-- /.box-body -->
      </div>
      <!-- /.box -->
 </div>
      <!-- /.col -->
        
     
      
        <div class="col-md-2">
      <div class="box box-default ">
       <!-- /.box-header -->
        <div class="box-body">
              <div class="box-header with-border">
          <h3 class="box-title"> By Status</h3>
        </div>
            <br>
              <form action="" method="POST">
            <div class="col-md-12">
             
              <!-- /.form-group -->
               <div class="form-group">
                <label>Status</label>
                
                  <select id="status" name="status" class="form-control">
                          <option value="Open"> Open</option>
                           <option value="Follow Up">Follow Up</option>
                          <option value="In Process">In Process</option>
                          <option value="Complete">Complete</option>
                          <option value="Cancelled"> Cancelled</option>
                          <option value="Rejected">Rejected</option>
                          
                          
                     </select>
              </div>
            
              <!-- /.form group --><br>
            <button type="submit" class="btn btn-info pull-left" onClick="return validateForm()" type="submit"> Search</button>
             <input type="hidden" name="tksrch" id="tasksearch" value="status">
           </div>
          </form>
               <!-- /.col -->
        </div>
        <!-- /.box-body -->
      </div>
      <!-- /.box -->
 </div>
      <!-- /.col -->
      
        <div class="col-md-2">
      <div class="box box-default ">
       <!-- /.box-header -->
        <div class="box-body">
              <div class="box-header with-border">
          <h3 class="box-title">By Priority</h3>
        </div>
            <br>
              <form action="" method="POST">
            <div class="col-md-12">
             	
               <div class="form-group">
                <label>Priority</label>
                
                   <select id="importance" name="priority" class="form-control">
                          <option value="Normal"> Normal</option>
                          <option value="Very High">Very High</option>
                          <option value="High">High</option>
                          <option value="Critical Situation"> Critical Situation</option>
                          <option value="Normal">Normal</option>
                          <option value="Midium">Midium</option>
                          <option value="Low">Low</option>
                          
                     </select>
              </div>
              
              <!-- /.form group --><br>
            <button type="submit" class="btn btn-info pull-left" onClick="return validateForm()" type="submit"> Search</button>
             <input type="hidden" name="tksrch" id="tasksearch" value="priority">
           </div>
          </form>
               <!-- /.col -->
        </div>
        <!-- /.box-body -->
      </div>
      <!-- /.box -->
 </div>
      <!-- /.col -->
    
      
      
      
      <div class="col-md-2">
      <div class="box box-default ">
       <!-- /.box-header -->
        <div class="box-body">
              <div class="box-header with-border">
          <h3 class="box-title">By Type</h3>
        </div>
            <br>
              <form action="" method="POST">
            <div class="col-md-12">
             	
               <div class="form-group">
                <label>Type</label>
                
                   <select id="importance" name="customertype" class="form-control">
                          <option value="customer"> Customer</option>
                          <option value="lead">Lead</option>
                          <option value="vendor">Vendor</option>
                         
                     </select>
              </div>
                
              <!-- /.form group --><br>
            <button type="submit" class="btn btn-info pull-left" onClick="return validateForm()" type="submit"> Search</button>
             <input type="hidden" name="tksrch" id="tasksearch" value="customertype">
           </div>
          </form>
               <!-- /.col -->
        </div>
        <!-- /.box-body -->
      </div>
      <!-- /.box -->
 </div>
      <!-- /.col -->
     
     
     
     </div>
          <!-- /.row -->
          
          
          
	
          
          
          
          
          
          
          
          
          

	
		
		
    </section>
    <!-- /.content -->
  </div>
<jsp:include page="dist/include/footer.jsp" />
<%
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   --  Leaving leadsearch.jsp---");
%>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- bootstrap datepicker -->

<script src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- FastClick -->
<script src="bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>

<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- page script -->
<script>
  $(function () {
    $('#example1').DataTable()
    $('#example2').DataTable({
      'paging'      : true,
      'lengthChange': false,
      'searching'   : false,
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false
    })
  })
</script>
<script>
function goBack() {
    window.history.back();
}
</script>


<script>
  $(function () {
      
     //Date picker
    $('#datepicker1').datepicker({
      autoclose: true
    })  
       $('#datepicker2').datepicker({
      autoclose: true
    }) 
    $('#datepicker3').datepicker({
      autoclose: true
    }) 
        })
   
  
</script>

  <script>
      function validateForm(){
          
           if(document.getElementById("subject").value==""){
   
            document.getElementById("alert-message").innerHTML = "Subject cannot be empty";
    $('#show-alert').modal('show')
       document.getElementById("subject").focus();
           return false;
        }else if(document.getElementById("subject").value!=""){
           
           if(!document.getElementById("subject").value.match(/^[0-9 a-z.A-Z]+$/)){
              document.getElementById("alert-message").innerHTML = "Subject: only alphanumeric allowed";
    $('#show-alert').modal('show')
           
           document.getElementById("subject").focus();
     return false;
            } 
        } 
        
        if(document.getElementById("assigned").value!=""){
           
           if(!document.getElementById("assigned").value.match(/^[0-9 a-z.A-Z]+$/)){
                     document.getElementById("alert-message").innerHTML = "Assigned To: Only alphanumeric allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("assigned").focus();
     return false;
            } else
        if(document.getElementById("assigned").value.length>30){
                         document.getElementById("alert-message").innerHTML = "Assigned To: Only 30 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("assigned").focus();
           
           return false;
       }}
        
         return true;
  }
  
</script>
 

</body>
</html>
