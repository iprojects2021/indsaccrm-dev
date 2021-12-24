<%@page import="menu.Email"%>
<%@page import="menu.Contact"%>
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
  <title>Search Contact for Email | INDSAC CRM</title>
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
 Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" -------Entering searchcontact.jsp----------Search Contact---");
    
 if(Email.checkAnyEmailActive(usercid_adminid, usercid_id)<1)
{  
    Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --------searchcontact.jsp----------No Active Email-------------Redirecting To--------mailsetting.jsp-------");
  response.sendRedirect("mailsetting.jsp");
}
%>

  
<div class="wrapper">

  <jsp:include page="dist/include/leftmenu.jsp" />  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
        Select Contact for Email
        
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>
	
	 <section class="content-header">
             
             	<% String tksrch=request.getParameter("tksrch");
                String type=request.getParameter("type");
                
                 if("status".equals(tksrch)){
                            String status=request.getParameter("status");
                            
             String dbdate=null;
           int i=0,j=0,CH=0;
           String count1;  count1="1";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select COUNT(*) from contact where useradminid='"+usercid_adminid+"'  and  status='"+status+"'; ");
       
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count1=rs.getString(1);  }
     rs.close();
      smt.close();
      con.close();       Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+",Searchby="+tksrch+" ,count="+count1+" -- searchtask.jsp----------Search Task---");
   } catch(Exception e){
                             String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n File: searchtask.jsp-----\n"
     + "LINE=114 \n select COUNT(*) from task where useradminid='"+usercid_adminid+"'  and  status='"+status+"'; ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
     
      }
      
       int n1=Integer.parseInt(count1);
       String taskdata1[][]=new String[n1+1][55];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from contact where useradminid='"+usercid_adminid+"'  and  status='"+status+"'; ");
       
        ResultSet rs=smt.executeQuery();
     i=1;
        while(rs.next())
        {  
               CH++;
           for( j=1;j<=41;j++)
          {
            taskdata1[i][j]=rs.getString(j); 
           
          } 
           ++i;  
        }
    rs.close();
      smt.close();
      con.close();    } catch(Exception e){ 
     String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n File: searchtask.jsp-----\n"
     + "LINE=141 \n select * from task where useradminid='"+usercid_adminid+"'  and  status='"+status+"';  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
      }
        
                    
      %> 
      <div class="row invoice">
    <div class="col-md-12" >
       <form action="Mail" method="post">
        <div class="box box-info"> 
            <div class="box-header with-border">
              
 <div class="box-header with-border">
          <h3 class="box-title">Contact Search Result</h3>
                 <input type="submit" value="Next" id="status"  class="btn btn-info pull-right" onClick="return validateForm()" >  </input>
            
        </div>
          </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                 
                <table  id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr> <th><input type="checkbox" name="checkbox" onclick='selectAll()' /> All</th>
                       <th>Date   </th>
                  <th>Company</th>
                  <th>Name</th>
                  <th>  Email</th>
                  
                  <th> City</th>
                   <th> Status</th>
                   <th> Owner</th>
                  </tr>
                  </thead>
                 <tbody>   
                 <% int m=0; for(m=CH;m>0;m--) {
                       %>
                  <tr>
                    <td><input type="checkbox" id="email" name="email" value=<%=taskdata1[m][23] %> ></td>
                     <td><% out.print(taskdata1[m][2]); %></td>
                    <td><% out.print(taskdata1[m][5]); %></td>
                    <td><a href="contactdetails.jsp?cid=<%=taskdata1[m][1] %>&type=<%=("contact") %>"><% out.print(taskdata1[m][6]); %></a></td>
                      <td><% out.print(taskdata1[m][23]); %></td>
                      
                          <td><% out.print(taskdata1[m][33]); %></td>
                         
                    <td>
                        <span class="label label-<%=Contact.statusLeadColor(taskdata1[m][13]) %>"><% out.print(taskdata1[m][13]); %></span>
                  </td>
                   <td><% out.print(Db.getEmployeeName(taskdata1[m][40])); %></td>
                  </tr>
                  <% } %>
                </tbody>
            </table>
                  
              </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
           
          </div> </form>
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
        PreparedStatement smt=con.prepareStatement("select count(*) from contact  where useradminid='"+usercid_adminid+"'  and  customertype='"+customertype+"'; ");
       
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count1=rs.getString(1);  }
       rs.close();
      smt.close();
      con.close();      Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+",Searchby="+tksrch+" ,count="+count1+" -- searchtask.jsp----------Search Task---");
  } catch(Exception e){
        String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n File: searchcontact.jsp-----\n"
     + "LINE=229 \n select count(*) from contact  where useradminid='"+usercid_adminid+"'  and  customertype='"+customertype+"';   ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
      }
      
       int n1=Integer.parseInt(count1);
       String taskdata1[][]=new String[n1+1][55];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from contact  where useradminid='"+usercid_adminid+"'  and  customertype='"+customertype+"'; ");
       
        ResultSet rs1=smt.executeQuery();
     i=1;
        while(rs1.next())
        {  
               CH++;
           for( j=1;j<=41;j++)
          {
            taskdata1[i][j]=rs1.getString(j); 
           
          } 
           ++i;  
        }
     rs1.close();
      smt.close();
      con.close();   } catch(Exception e){
        String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n File: searchtask.jsp-----\n"
     + "LINE=256 \n select * from contact  where useradminid='"+usercid_adminid+"'  and  customertype='"+customertype+"';  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
      
      }
        
                    
      %> 
      <div class="row invoice">
               
    <div class="col-md-12" >
     <form action="Mail" method="post">
        <div class="box box-info"> 
            <div class="box-header with-border">
              
 <div class="box-header with-border">
          <h3 class="box-title"> Contact Search Result</h3>
        <input type="submit" value="Next" id="status"  class="btn btn-info pull-right" onClick="return validateForm()" >  </input>
              
        </div>
           </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <table  id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr> <th><input type="checkbox" name="checkbox" onclick='selectAll()' /> All</th>
                      <th>Date   </th>
                  <th>Company</th>
                  <th>Name</th>
                <th>  Email</th>
                  <th> City</th>
                   <th> Status</th>
                   <th> Owner</th>
                  </tr>
                  </thead>
                  <tbody>   
                <% int m=0; for(m=CH;m>0;m--) {
                       %>
                  <tr>
                     <td><input type="checkbox" id="email" name="email" value=<%=taskdata1[m][23] %> ></td>
                    
                     <td><% out.print(taskdata1[m][2]); %></td>
                    <td><% out.print(taskdata1[m][5]); %></td>
                    <td><a href="<% if("customer".equals(customertype)){customertype="contact"; out.print("contact");}else{out.print(customertype);} %>details.jsp?esfhrttrfhardersg=<%=taskdata1[m][1] %>&type=<%=customertype %>"><% out.print(taskdata1[m][6]); %></a></td>
                      <td><% out.print(taskdata1[m][23]); %></td>
                          <td><% out.print(taskdata1[m][33]); %></td>
                         
                    <td>
                        <span class="label label-<%=Contact.statusLeadColor(taskdata1[m][13]) %>"><% out.print(taskdata1[m][13]); %></span>
                  </td>
                   <td><% out.print(Db.getEmployeeName(taskdata1[m][40])); %></td>
                  </tr>
                  <% } %>
                </tbody>
               </table>
              </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
           
          </div> </form>
          <!-- /.box -->
        </div>
        <!-- ./col -->
		</div>
		 <% } %>
	
                  	<% 
                        if("daterange".equals(tksrch)){
                            String taskdate=request.getParameter("fromdate");
                            String fromdte=taskdate;
                            String todate=request.getParameter("todate");
                            String todte=todate;
                            if(taskdate.equals("") || taskdate.equals(null)|| taskdate.equals("null")){ response.sendRedirect("");} 
                             taskdate=Character.toString(taskdate.charAt(6))+Character.toString(taskdate.charAt(7))+Character.toString(taskdate.charAt(8))+Character.toString(taskdate.charAt(9))+"-"+Character.toString(taskdate.charAt(0))+Character.toString(taskdate.charAt(1))+"-"+Character.toString(taskdate.charAt(3))+Character.toString(taskdate.charAt(4));
    
                             if(todate.equals("") || todate.equals(null)|| todate.equals("null")){ response.sendRedirect("");} 
                             todate=Character.toString(todate.charAt(6))+Character.toString(todate.charAt(7))+Character.toString(todate.charAt(8))+Character.toString(todate.charAt(9))+"-"+Character.toString(todate.charAt(0))+Character.toString(todate.charAt(1))+"-"+Character.toString(todate.charAt(3))+Character.toString(todate.charAt(4));
    taskdate=taskdate+" 00:00:00";todate=todate+" 23:59:59";
             String dbdate=null;
           int i=0,j=0,CH=0;
           String count1;  count1="1";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from contact where useradminid='"+usercid_adminid+"' AND  timestamp between '"+taskdate+"' and '"+todate+"'; ");
       
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count1=rs.getString(1);  }
    rs.close();
      smt.close();
      con.close();         Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+",Searchby="+tksrch+" ,count="+count1+" -- searchtask.jsp----------Search Task---");
  } catch(Exception e){
             String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n File: searchtask.jsp-----\n"
     + "LINE=350 \n select * from task where useradminid='"+usercid_adminid+"' AND  timestamp between '"+taskdate+"' and '"+todate+"'; ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
      }
      
       int n1=Integer.parseInt(count1);
       String taskdata1[][]=new String[n1+1][55];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from contact where useradminid='"+usercid_adminid+"' AND   timestamp between '"+taskdate+"' and '"+todate+"';  ");
       
        ResultSet rs=smt.executeQuery();
     i=1;
        while(rs.next())
        {  
               CH++;
           for( j=1;j<=42;j++)
          {
            taskdata1[i][j]=rs.getString(j); 
           
          } 
           ++i;  
        }
   rs.close();
      smt.close();
      con.close();     } catch(Exception e){
            String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n File: searchtask.jsp-----\n"
     + "LINE=377 \n select * from task where useradminid='"+usercid_adminid+"' AND   timestamp between '"+taskdate+"' and '"+todate+"'; ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
      }
        
                    
      %> 
      <div class="row invoice">
   <div class="col-md-12" >
      <form action="Mail" method="post">
        <div class="box box-info"> 
            <div class="box-header with-border">
              
 <div class="box-header with-border">
          <h3 class="box-title">Contacts From:<%=fromdte  %> To: <%=todte %></h3>
         <input type="submit" value="Next" id="status"  class="btn btn-info pull-right" onClick="return validateForm()" >  </input>
        </div>
          </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
               <table  id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr> <th><input type="checkbox" name="checkbox" onclick='selectAll()' /> All</th>
                      <th>Date   </th>
                  <th>Company</th>
                  <th>Name</th>
                  <th>  Email</th>
                  
                   <th> Status</th>
                   <th> Type</th>
                   <th> Owner</th>
                  </tr>
                  </thead>
                 <tbody>   
                 <% int m=0; for(m=CH;m>0;m--) {
                       %>
                  <tr>
                     <td><input type="checkbox" id="email" name="email" value=<%=taskdata1[m][23] %> ></td>
                    
                    <td><% out.print(taskdata1[m][2]); %></td>
                    <td><% out.print(taskdata1[m][5]); %></td>
                    <td><a href="<% if("customer".equals(taskdata1[m][41])){taskdata1[m][41]="contact"; out.print("contact");}else{out.print(taskdata1[m][41]);} %>details.jsp?esfhrttrfhardersg=<%=taskdata1[m][1] %>&type=<%=taskdata1[m][41] %>"><% out.print(taskdata1[m][6]); %></a></td>
                      <td><% out.print(taskdata1[m][23]); %></td>
                       
                        
                         
                    <td>
                        <span class="label label-<%=Contact.statusLeadColor(taskdata1[m][13]) %>"><% out.print(taskdata1[m][13]); %></span>
                  </td> 
                      <td><% out.print(taskdata1[m][41]); %></td>
                   <td><% out.print(Db.getEmployeeName(taskdata1[m][40])); %></td>
                  </tr>
                  <% } %>
                 </tbody>
              </table>
              </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
           
        </div></form>
          <!-- /.box -->
        </div>
        <!-- ./col -->
		</div>
		 <% } %>
<!-- SELECT2 EXAMPLE -->
     <div class="row">
          <div class="col-md-4">
      <div class="box box-default ">
       <!-- /.box-header -->
        <div class="box-body">
              <div class="box-header with-border">
          <h3 class="box-title"> Contacts By Created Date</h3>
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
            <button type="submit" class="btn btn-info pull-left"  type="submit"> Search</button>
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
 <div class="col-md-4">
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
                           <option value="Open">Open</option>
                          <option value="Attempted Contact">Attempted Contact</option>
                          <option value="Active"> Active</option>
                          <option value="InActive">InActive</option>
                            <option value="Not Engaged">Not Engaged</option>
                            <option value="Needs Follow Up">Needs Follow Up</option>
                            <option value="Working">Working</option>
                             <option value="New Opportunity">New Oppurtunity</option>
                                <option value="Qualified">Qualified</option>
                                <option value="Disqualified">Disqualified</option>
                     </select>
              </div>
             <!-- /.form group --><br>
            <button type="submit" class="btn btn-info pull-left"  type="submit"> Search</button>
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
     
      <div class="col-md-4">
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
            <button type="submit" class="btn btn-info pull-left" type="submit"> Search</button>
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
 <% Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Leaving searchtask.jsp----------Search Task---");
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
    <script type="text/javascript">
        //function for select all and unselect all checkbox
            var checkbox = document.querySelector("input[name=checkbox]");

            checkbox.addEventListener('change', function () {
                if (this.checked) {
                    var items = document.getElementsByName('email');
                    for (var i = 0; i < items.length; i++) {
                        if (items[i].type == 'checkbox')
                            items[i].checked = true;
                    }
                } else {
                    var items = document.getElementsByName('email');
                    for (var i = 0; i < items.length; i++) {
                        if (items[i].type == 'checkbox')
                            items[i].checked = false;
                    }
                }
            });
            
                function validateForm(){
                     var checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
                     if(checkboxes.length==0){
                      document.getElementById("alert-message").innerHTML ="Please select contacts";
    $('#show-alert').modal('show')
    return false;}
                    };
                     
    
        </script>
    
<script>
  $(function () {
    $('#example11').DataTable({
      'paging'      : true,
      'lengthChange': false,
      'searching'   : false,
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false
    })
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



</body>
</html>
