<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="blezz.Poul"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="dist/img/u.png" type="image/x-icon" /> 
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Vendor | INDSAC-CRM</title>
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
  <link rel="stylesheet" href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">

  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

  
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="vendor.jsp" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>INDSAC-CRM</b></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>INDSAC</b>-CRM</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
         
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="dist/img/u.png" class="user-image" alt="User Image">
              <span class="hidden-xs">USHAAI INDUSTRIES</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="dist/img/u.png" class="img-circle" alt="User Image">

                <p>
                  USHAAI INDUSTRIES - Manufacturing Company
                  <small>Member since  2010</small>
                </p>
              </li>
              <!-- Menu Body -->
             
              <!-- Menu Footer-->
              <li class="user-footer">
                
                <div class="pull-right">
                  <a href="http://localhost:8084/IndsacCRM/IndsacCRM/index.jsp" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="dist/img/u.png" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p> <% HttpSession session1 = request.getSession(true); // reuse existing
		if (session1 != null) {
			if (session1.getAttribute("ownr") != null) {
				String name = (String) session1.getAttribute("ownr");
				out.print( name );
			} else {
				response.sendRedirect("index.jsp");
			}
		}
	%> </p>
          
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- search form -->
   
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu" data-widget="tree">
              <li class="treeview ">
          <a href="#">
            <i class="fa  fa-user-md"></i>
            <span>Contact</span>
           <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li ><a href="contact.jsp"><i class="fa fa-dashboard"></i> Contact Dashboard</a></li>
            <li><a href="newcontact.jsp"><i class="fa fa-user-plus"></i> New Contact</a></li>
           
          </ul>
        </li> 
        <li class="treeview active ">
          <a href="#">
            <i class="fa  fa-user-md"></i>
            <span>Vendor</span>
           <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="lead.jsp"><i class="fa fa-dashboard"></i> Lead Dashboard</a></li>
            <li><a href="newleads.jsp"><i class="fa fa-user-plus"></i> New Lead</a></li>
           
          </ul>
        </li>   
        <li class="treeview ">
          <a href="#">
            <i class="fa  fa-user-md"></i>
            <span>Vendor</span>
           <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="vendor.jsp"><i class="fa fa-dashboard"></i> Vendor Dashboard</a></li>
            <li><a href="newvendor.jsp"><i class="fa fa-user-plus"></i> New Vendor</a></li>
           
          </ul>
        </li>
        <li class="treeview ">
          <a href="#">
            <i class="fa  fa-user-md"></i>
            <span>Stock</span>
           <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="viewstock.jsp"><i class="fa fa-dashboard"></i> View Stock</a></li>
           
          </ul>
        </li>
       
        <li class="treeview ">
          <a href="#">
            <i class="fa  fa-user-md"></i>
            <span>Invoice</span>
           <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li ><a href="invoicedash.jsp"><i class="fa fa-dashboard"></i> Invoice Dashboard</a></li>
          
          </ul>
        </li> 
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
   <%    
            

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
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   --  Entring vendor11.jsp---");  
         int ii=1,jj=0;
           String count123="0";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from vendor where readstatus='0' ");
        
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count123=rs.getString(1);  }
       } catch(Exception e){ 
           String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n vendor11.jsp-----\n"
     + "LINE=231 \n select count(*) from vendor where readstatus='0' ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
       }
      int n123=Integer.parseInt(count123);
       String leaddata[][]=new String[n123+10][50];
          try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from vendor where readstatus='0'");
        
        ResultSet rs=smt.executeQuery();
    
        while(rs.next())
        { 
           for(jj=1;jj<32;jj++)
        {
        leaddata[ii][jj]=rs.getString(jj);
        }
           ++ii;  
        }
       } catch(Exception e){ 
           String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n vendor11.jsp-----\n"
     + "LINE=252 \n select * from vendor where readstatus='0' ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
       }
      
       
       
       
       
       
       
       String status=null,month=null,date=null,dbyear=null,dbday=null;
    int jan=0,feb=0,mar=0,apr=0,may=0,jun=0,jul=0,aug=0,sep=0,oct=0,nov=0,dec=0;
    int d1=0,d2=0,d3=0,d4=0,d5=0,d6=0,d7=0,d8=0,d9=0,d10=0,d11=0,d12=0,d13=0,d14=0,d15=0,d16=0,d17=0,d18=0,d19=0,d20=0,d21=0,d22=0,d23=0,d24=0,d25=0,d26=0,d27=0,d28=0,d29=0,d30=0,d31=0;
    int New=0,inprocess=0,hold=0,completed=0,canceled=0,none=0,totalleadcount=0;
    //New=Not attempted, inprocess=followup,hold=contacted,completed=new opportunity, concelled=additional contact,none=disqualified
    //int vh=0,cs=0,high=0,medium=0,normal=0,low=0,vl=0;
        Date date1 = Calendar.getInstance().getTime();  
                DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");  
                String systemdate = dateFormat.format(date1);  
               
              java.util.Date date121=new java.util.Date();
        java.sql.Date sqlDate121=new java.sql.Date(date121.getTime());
       
                
               String curday121=sqlDate121.toString(); 
                String curyear=curday121.substring(0, 4);
                String curmonth=curday121.substring(5,7);
                String curday=curday121.substring(8,10);
               
 try{
   Connection con =Poul.getConnectionCRM();
   Statement smt=con.createStatement();
   ResultSet rs=smt.executeQuery("select * from vendor where readstatus='0'");
    while(rs.next()){
       
        if(rs.getString("firstname")!=null&&!rs.getString("firstname").equals("")&&!rs.getString("firstname").equals("null")){
       totalleadcount++;
       date=rs.getString("timestamp");
       dbyear=date.substring(0,4);
            month=date.substring(5,7);
            dbday=date.substring(8,10);
            
                              if(dbyear.equals(curyear)&&month.equals(curmonth))
                              {
                              if("01".equals(dbday)){ d1++;} 
                              else if("02".equals(dbday)){ d2++;}
                              else if("03".equals(dbday)){ d3++;}
                               else if("04".equals(dbday)){ d4++;}
                               else if("05".equals(dbday)){ d5++;}
                               else if("06".equals(dbday)){ d6++;}
                               else if("07".equals(dbday)){ d7++;}
                               else if("08".equals(dbday)){ d8++;}
                               else if("09".equals(dbday)){ d9++;}
                               else if("10".equals(dbday)){ d10++;} else if("11".equals(dbday)){ d11++;} else if("12".equals(dbday)){ d12++;} else if("13".equals(dbday)){ d13++;}
                               else if("14".equals(dbday)){ d14++;}
                               else if("15".equals(dbday)){ d15++;}
                               else if("16".equals(dbday)){ d16++;}
                               else if("17".equals(dbday)){ d17++;}
                               else if("18".equals(dbday)){ d18++;}
                               else if("19".equals(dbday)){ d19++;} else if("20".equals(dbday)){ d20++;}
                               else if("21".equals(dbday)){ d21++;}
                               else if("22".equals(dbday)){ d22++;}
                               else if("23".equals(dbday)){ d23++;}
                               else if("24".equals(dbday)){ d24++;}
                               else if("25".equals(dbday)){ d25++;}
                               else if("26".equals(dbday)){ d26++;}
                               else if("27".equals(dbday)){ d27++;}
                               else if("28".equals(dbday)){ d28++;}
                               else if("29".equals(dbday)){ d29++;} else if("30".equals(dbday)){ d30++;} else if("31".equals(dbday)){ d31++;} else {}
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              }
            
        if(month.equals("01")){
            jan++;
        }
        else if(month.equals("02")){
            feb++;
        }
        else if(month.equals("03")){
            mar++;
        }
        else if(month.equals("04")){
            apr++;
        }
        else if(month.equals("05")){
            may++;
        }
        else if(month.equals("06")){
            jun++;
        }
        else if(month.equals("07")){
            jul++;
        }
        else if(month.equals("08")){
            aug++;
        }
        else if(month.equals("09")){
            sep++;
        }
        else if(month.equals("10")){
            oct++;
        }
        else if(month.equals("11")){
            nov++;
        }
        else if(month.equals("12")){
            dec++;
        }
           //New=Not attempted, inprocess=followup,hold=contacted,completed=new opportunity, concelled=additional contact,none=disqualified
 
        status=rs.getString("status");
        
        if(status.equals("Not Attempted")){
            New++;
        }
        else if(status.equals("Follow Up")){
            inprocess++;
        }
        else if(status.equals("Contacted")){
            hold++;
        }
        else if(status.equals("New Opportunity")){
            completed++;
        }
        else if(status.equals("Additional Contact")){
            canceled++;
        }
        else if(status.equals("Disqualified")){
            none++;
        }
        
       
        }
    }
    con.close();
    smt.close();
}
 
 catch(Exception e){
   String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n vendor11.jsp-----\n"
     + "LINE=401 \n select count(*) from vendor where readstatus='0' ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
}
%>



   <!-- Main content -->
    <section class="content">
        <!-- Small boxes (Stat box) -->
          <div class="row">
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-aqua">
                <div class="inner">
                  <h3><% out.print(totalleadcount);  %></h3>
                  <p>Total Vendors</p>
                </div>
                <div class="icon">
                  <i class="fa fa-users"></i>
                </div>
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-green">
                <div class="inner">
                  <h3><% out.print(completed); %></h3>
                  <p>New Opportunity</p>
                </div>
                <div class="icon">
                  <i class="fa fa-line-chart"></i>
                </div>
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-yellow">
                <div class="inner">
                  <h3><% out.print(hold); %></h3>
                  <p>Contacted</p>
                </div>
                <div class="icon">
                  <i class="fa fa-phone"></i>
                </div>
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-red">
                <div class="inner">
                  <h3><% out.print(New); %></h3>
                  <p>Not Attempted</p>
                </div>
                <div class="icon">
                  <i class="fa fa-remove"></i>
                </div>
              </div>
            </div><!-- ./col -->
          </div><!-- /.row -->
	
	    <div class="row">
        <div class="col-md-6">	
	     <div class="box box-success">
            <div class="box-header with-border">
                <h3 class="box-title">Vendors Added By Months  of Year 2018 </h3>

              
            </div>
            <div class="box-body">
              <div class="chart">
               <canvas id="chartjs-1"  width="undefined" height="undefined"></canvas>
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

        </div>
        <!-- /.col (RIGHT) -->
		   <div class="col-md-6">	
	     <div class="box box-success">
            <div class="box-header with-border">
              <h3 class="box-title">Vendors by Status</h3>

             
            </div>
            <div class="box-body">
              <div class="chart">
              <canvas id="chartjs-4"  width="undefined" height="undefined"></canvas>
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

        </div>
        <!-- /.col (RIGHT) -->
      </div>
      <!-- /.row -->
	

	   <div class="row">
               <form action="" method="get">
                <div class="col-md-6">
          <div class="box box-primary">
            <div class="box-header">
              <h3 class="box-title">Search Task </h3>
            </div>
            <div class="box-body">
              <!-- Date -->
           

           		<div class="form-group">
                <label>By Due Date:</label>

                <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                    <input type="text" class="form-control pull-right" name="taskdate" id="datepicker1">
                  <input type="hidden" name="tksrch" id="tasksearch" value="true">
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->


            

            

            </div>
            <!-- /.box-body -->
             <!-- /.box-body -->
              <div class="box-footer">
               
                <button  class="btn btn-info pull-right " onclick="return validatetaskSearch()" type="submit">Search</button>
              </div>
              <!-- /.box-footer -->
          </div>
          <!-- /.box -->
                </div>
               </form>
    <div class="col-md-6">
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title"> Task</h3>

               <div class="box-tools pull-right">
                <ul class="pagination pagination-sm inline">
                  <li><a href="#">&laquo;</a></li>
                  <li><a href="#">1</a></li>
                  <li><a href="#">2</a></li>
                  <li><a href="#">3</a></li>
                  <li><a href="#">&raquo;</a></li>
                </ul>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <table class="table no-margin">
                  <thead>
                  <tr>
                       <th>Task Id</th>
                    <th>Description</th>
                    <th>Status</th>
					<th>Due Date</th>
                                        <th>Priority</th>
                    
                  </tr>
                  </thead>
                  <tbody>
                      	<% String tksrch=request.getParameter("tksrch");
                        if("true".equals(tksrch)){
                            String taskdate=request.getParameter("taskdate");
                            if(taskdate.equals("") || taskdate.equals(null)|| taskdate.equals("null")){ response.sendRedirect("");} 
                             taskdate=Character.toString(taskdate.charAt(6))+Character.toString(taskdate.charAt(7))+Character.toString(taskdate.charAt(8))+Character.toString(taskdate.charAt(9))+"-"+Character.toString(taskdate.charAt(0))+Character.toString(taskdate.charAt(1))+"-"+Character.toString(taskdate.charAt(3))+Character.toString(taskdate.charAt(4));
    
             
             String dbdate=null;
           int i=0,j=0,CH=0;
           String count1="NULL";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from task ");
       
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count1=rs.getString(1);  }
       } catch(Exception e){ e.printStackTrace(); }
      
       int n1=Integer.parseInt(count1);
       String taskdata1[][]=new String[n1+1][55];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from task ");
       
        ResultSet rs=smt.executeQuery();
     i=1;
        while(rs.next())
        {  dbdate=rs.getString(5);
           dbdate=dbdate.substring(0,10);
           if(dbdate.equals(taskdate)) {
               CH++;
           for( j=1;j<=32;j++)
          {
            taskdata1[i][j]=rs.getString(j); 
           
          } 
           ++i; } 
        }
       } catch(Exception e){ e.printStackTrace(); }
        
                    
      %>

                      
                      
                      
                  <% int m=0; for(m=CH;m>0;m--) {
                       %>
                  <tr>
                      <% if("".equals(taskdata1[m][11])){    %>
                     <td ><a href="taskedit1.jsp?cid=<%=taskdata1[m][10] %>&tid=<%=taskdata1[m][1] %>"><% out.print("TSK"+taskdata1[m][1]); %></a></td>
                     <% } else {  %>
                   <td ><a href="taskedit.jsp?vid=<%=taskdata1[m][11] %>&tid=<%=taskdata1[m][1] %>"><% out.print("TSK"+taskdata1[m][1]); %></a></td>
                   
                    <%  }  %>
                    
                    <td><% out.print(taskdata1[m][4]); %></td>
                    <td>
                            <% if(taskdata1[m][7].equals("Open")) {   %>
                           <span class="label label-danger"><% out.print(taskdata1[m][7]); %></span>
                        <% } %>
                        <% if(taskdata1[m][7].equals("In Process")) {   %>
                           <span class="label label-warning"><% out.print(taskdata1[m][7]); %></span>
                        <% } %>
                        <% if(taskdata1[m][7].equals("Complete")) {   %>
                           <span class="label label-success"><% out.print(taskdata1[m][7]); %></span>
                        <% } %>
                        <% if(taskdata1[m][7].equals("Cancelled")) {   %>
                           <span class="label label-default"><% out.print(taskdata1[m][7]); %></span>
                        <% } %>
                        <% if(taskdata1[m][7].equals("Rejected")) {   %>
                           <span class="label label-default"><% out.print(taskdata1[m][7]); %></span>
                        <% } %>
                         <% if(taskdata1[m][7].equals("Follow Up")) {   %>
                           <span class="label label-info"><% out.print(taskdata1[m][7]); %></span>
                        <% } %>
                     </td>
                     <td><% out.print((taskdata1[m][5]).substring(0, 10));  %></td>
                   <td> 
                            <% if(taskdata1[m][6].equals("Very High")) {   %>
                           <span class="label label-danger"><% out.print(taskdata1[m][6]); %></span>
                        <% } %>
                        <% if(taskdata1[m][6].equals("Normal")) {   %>
                           <span class="label label-info"><% out.print(taskdata1[m][6]); %></span>
                        <% } %>
                         <% if(taskdata1[m][6].equals("High")) {   %>
                           <span class="label label-warning"><% out.print(taskdata1[m][6]); %></span>
                        <% } %>
                        <% if(taskdata1[m][6].equals("Critical Situation")) {   %>
                           <span class="label label-danger"><% out.print(taskdata1[m][6]); %></span>
                        <% } %>
                        <% if(taskdata1[m][6].equals("Midium")) {   %>
                           <span class="label label-default"><% out.print(taskdata1[m][6]); %></span>
                        <% } %>
                        <% if(taskdata1[m][6].equals("Low")) {   %>
                           <span class="label label-default"><% out.print(taskdata1[m][6]); %></span>
                        <% } %>
                   </td>
                  </tr>
                  <% } %>
                 <% } %>
                 
                  </tbody>
                </table>
              </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer clearfix no-border">
              <button type="button" class="btn btn-default pull-right"><i class="fa fa-plus"></i> Create Task</button>
            </div>
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
        </div>
        <!-- ./col -->
		
	 

</div> <!--/.row  -->
   
    
	  
	   
	   <div class="row">
        <div class="col-xs-12">
      
	<%    java.util.Date date123=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date123.getTime());
       
        
                  
                
                String curday11=sqlDate.toString();
             
             String dbdate=null;
           int i=0,j=0,CH=0;
           String count1="NULL";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from task ");
       
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count1=rs.getString(1);  }
       } catch(Exception e){ e.printStackTrace(); }
      
       int n1=Integer.parseInt(count1);
       String taskdata1[][]=new String[n1+1][55];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from task ");
       
        ResultSet rs=smt.executeQuery();
     i=1;
        while(rs.next())
        {  dbdate=rs.getString(5);
           dbdate=dbdate.substring(0,10);
           if(dbdate.equals(curday11)) {
               CH++;
           for( j=1;j<=32;j++)
          {
            taskdata1[i][j]=rs.getString(j); 
           
          } 
           ++i; } 
        }
       } catch(Exception e){ e.printStackTrace(); }
        
                    
      %>

          <div class="box">
            <div class="box-header">
              <h3 class="box-title"> Todays Task</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example2" class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th>Date </th>
                  <th>Subject	</th>
                  <th>Status</th>
                  <th> Due Date</th>
                  <th> Contact</th>
                </tr>
                </thead>
                <tbody>
               <% int m=0; for(m=CH;m>0;m--) {
                       %>
                  <tr>
                   <% if("".equals(taskdata1[m][10])){  %>
                      <td><a href="taskedit.jsp?vid=<%=taskdata1[m][11] %>&tid=<%=taskdata1[m][1] %>"><% out.print("TSK"+taskdata1[m][1]); %></a></td>
                      <% } else  { %>
                       <td><a href="taskedit1.jsp?cid=<%=taskdata1[m][10] %>&tid=<%=taskdata1[m][1] %>"><% out.print("TSK"+taskdata1[m][1]); %></a></td>
                     <% } %>
                      
                      
                    <td><% out.print(taskdata1[m][4]); %></td>
                    <td>
                            <% if(taskdata1[m][7].equals("Open")) {   %>
                           <span class="label label-danger"><% out.print(taskdata1[m][7]); %></span>
                        <% } %>
                        <% if(taskdata1[m][7].equals("In Process")) {   %>
                           <span class="label label-warning"><% out.print(taskdata1[m][7]); %></span>
                        <% } %>
                        <% if(taskdata1[m][7].equals("Complete")) {   %>
                           <span class="label label-success"><% out.print(taskdata1[m][7]); %></span>
                        <% } %>
                        <% if(taskdata1[m][7].equals("Cancelled")) {   %>
                           <span class="label label-default"><% out.print(taskdata1[m][7]); %></span>
                        <% } %>
                        <% if(taskdata1[m][7].equals("Rejected")) {   %>
                           <span class="label label-default"><% out.print(taskdata1[m][7]); %></span>
                        <% } %>
                         <% if(taskdata1[m][7].equals("Follow Up")) {   %>
                           <span class="label label-info"><% out.print(taskdata1[m][7]); %></span>
                        <% } %>
                     </td>
                     <td><% out.print((taskdata1[m][5]).substring(0, 10));  %></td>
                   <td> 
                            <% if(taskdata1[m][6].equals("Very High")) {   %>
                           <span class="label label-danger"><% out.print(taskdata1[m][6]); %></span>
                        <% } %>
                        <% if(taskdata1[m][6].equals("Normal")) {   %>
                           <span class="label label-info"><% out.print(taskdata1[m][6]); %></span>
                        <% } %>
                         <% if(taskdata1[m][6].equals("High")) {   %>
                           <span class="label label-warning"><% out.print(taskdata1[m][6]); %></span>
                        <% } %>
                        <% if(taskdata1[m][6].equals("Critical Situation")) {   %>
                           <span class="label label-danger"><% out.print(taskdata1[m][6]); %></span>
                        <% } %>
                        <% if(taskdata1[m][6].equals("Midium")) {   %>
                           <span class="label label-default"><% out.print(taskdata1[m][6]); %></span>
                        <% } %>
                        <% if(taskdata1[m][6].equals("Low")) {   %>
                           <span class="label label-default"><% out.print(taskdata1[m][6]); %></span>
                        <% } %>
                   </td>
                  </tr>
                  <% } %>
                
                </tbody>
               
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
	    <div class="row">
        <div class="col-xs-12">
      

          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Vendors </h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                   <th>Date   </th>
                  <th>Name</th>
                  <th>Phone</th>
                  <th>  Email</th>
                  <th> Product</th>
                   <th> Status</th>
                </tr>
                </thead>
                <tbody>
                   <%  m=0; for(m=n123;m>0;m--) {  %>
                  <tr>
                    <td><a href="vendordetails.jsp?vid=<%=leaddata[m][1]%>&type=vendor"><% out.print(leaddata[m][2]); %></a></td>
                    <td><% out.print(leaddata[m][5]); %></td>
                      <td><% out.print(leaddata[m][11]); %></td>
                        <td><% out.print(leaddata[m][13]); %></td>
                          <td><% out.print(leaddata[m][22]); %></td>
                         
                    <td><% if("Not Attempted".equals(leaddata[m][8])) {   %>
                           <span class="label label-danger"><% out.print(leaddata[m][8]); %></span>
                        <% } %>
                        <% if("Follow Up".equals(leaddata[m][8])) {   %>
                           <span class="label label-info"><% out.print(leaddata[m][8]); %></span>
                        <% } %>
                        <% if("Contacted".equals(leaddata[m][8])) {   %>
                           <span class="label label-success"><% out.print(leaddata[m][8]); %></span>
                        <% } %>
                        <% if("New Opportunity".equals(leaddata[m][8])) {   %>
                           <span class="label label-default"><% out.print(leaddata[m][8]); %></span>
                        <% } %>
                        <% if("Additional Contact".equals(leaddata[m][8])) {   %>
                           <span class="label label-default"><% out.print(leaddata[m][8]); %></span>
                        <% } %>
                         <% if("Disqualified".equals(leaddata[m][8])) {   %>
                           <span class="label label-default"><% out.print(leaddata[m][8]); %></span>
                        <% } %>
                     </td>
                  
                  </tr>
                  <% } %>
                 
               
                </tbody>
               
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
      
      
      
	 <div class="row">
        <div class="col-md-12">	
	     <div class="box box-success">
            <div class="box-header with-border">
                <h3 class="box-title">Vendors Added By Day  of current Month </h3>

              
            </div>
            <div class="box-body">
              <div class="chart">
               <canvas id="chartjs-1231"  width="undefined" height="100px"></canvas>
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

        </div>
        <!-- /.col (RIGHT) -->
    </div>   
	 
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
      <jsp:include page="dist/include/footer.jsp" />  
<% Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Leaving vendor11.jsp------");
 
 %>

  <!-- Control Sidebar -->
  
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
<script src="bower_components/chart.js/Chart2.js" ></script>

<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- page script -->
 page <script>new Chart(document.getElementById("chartjs-4"),{"type":"doughnut","data":{"labels":["Not Attempted","Follow Up","Contacted","New Opportunity","Additional Contact","Disqualified"],"datasets":[{"label":"My First Dataset","data":[<%=New%>,<%=inprocess%>,<%=hold%>,<%=completed%>,<%=canceled%>,<%=none%>],"backgroundColor":["rgb(255, 99, 132)","rgb(106, 160, 251)","rgb(255, 205, 86)","rgb(25, 229, 29)","rgb(243, 164, 253)","rgb(234, 239, 235)"]}]}});</script>  


<script>new Chart(document.getElementById("chartjs-1"),{"type":"bar","data":{"labels":["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"datasets":[{"label":"My First Dataset","data":[<%=jan%>,<%=feb%>,<%=mar%>,<%=apr%>,<%=may%>,<%=jun%>,<%=jul%>,<%=aug%>,<%=sep%>,<%=oct%>,<%=nov%>,<%=dec%>],"fill":false,"backgroundColor":["rgba(255, 99, 132, 0.2)","rgba(255, 159, 64, 0.2)","rgba(255, 205, 86, 0.2)","rgba(75, 192, 192, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)","rgba(201, 203, 207, 0.2)"],"borderColor":["rgb(255, 99, 132)","rgb(255, 159, 64)","rgb(255, 205, 86)","rgb(75, 192, 192)","rgb(54, 162, 235)","rgb(153, 102, 255)","rgb(201, 203, 207)"],"borderWidth":1}]},"options":{"scales":{"yAxes":[{"ticks":{"beginAtZero":true}}]}}});</script>


<script>new Chart(document.getElementById("chartjs-1231"),{"type":"bar","data":{"labels":["Day 1","Day 2","Day 3","Day 4","Day 5","Day 6","Day 7","Day 8","Day 9","Day 10","Day 11","Day 12","Day 13","Day 14","Day 15","Day 16","Day 17","Day 18","Day 19","Day 20","Day 21","Day 22","Day 23","Day 24","Day 24","Day 26","Day 27","Day 28","Day 29","Day 30","Day 31"],"datasets":[{"label":"My First Dataset","data":[<%=d1%>,<%=d2%>,<%=d3%>,<%=d4%>,<%=d5%>,<%=d6%>,<%=d7%>,<%=d8%>,<%=d9%>,<%=d10%>,<%=d11%>,<%=d12%>,<%=d13%>,<%=d14%>,<%=d15%>,<%=d16%>,<%=d17%>,<%=d18%>,<%=d19%>,<%=d20%>,<%=d21%>,<%=d22%>,<%=d23%>,<%=d24%>,<%=d25%>,<%=d26%>,<%=d27%>,<%=d28%>,<%=d29%>,<%=d30%>,<%=d31%>],"fill":false,"backgroundColor":["rgba(255, 99, 132, 0.2)","rgba(255, 159, 64, 0.2)","rgba(255, 205, 86, 0.2)","rgba(75, 192, 192, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)","rgba(201, 203, 207, 0.2)","rgba(255, 99, 132, 0.2)","rgba(255, 159, 64, 0.2)","rgba(255, 205, 86, 0.2)","rgba(75, 192, 192, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)","rgba(201, 203, 207, 0.2)","rgba(255, 99, 132, 0.2)","rgba(255, 159, 64, 0.2)","rgba(255, 205, 86, 0.2)","rgba(75, 192, 192, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)","rgba(201, 203, 207, 0.2)","rgba(255, 99, 132, 0.2)","rgba(255, 159, 64, 0.2)","rgba(255, 205, 86, 0.2)","rgba(75, 192, 192, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)","rgba(201, 203, 207, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)","rgba(201, 203, 207, 0.2)"],"borderColor":["rgb(255, 99, 132)","rgb(255, 159, 64)","rgb(255, 205, 86)","rgb(75, 192, 192)","rgb(54, 162, 235)","rgb(153, 102, 255)","rgb(201, 203, 207)","rgb(255, 99, 132)","rgb(255, 159, 64)","rgb(255, 205, 86)","rgb(75, 192, 192)","rgb(54, 162, 235)","rgb(153, 102, 255)","rgb(201, 203, 207)","rgb(255, 99, 132)","rgb(255, 159, 64)","rgb(255, 205, 86)","rgb(75, 192, 192)","rgb(54, 162, 235)","rgb(153, 102, 255)","rgb(201, 203, 207)","rgb(255, 99, 132)","rgb(255, 159, 64)","rgb(255, 205, 86)","rgb(75, 192, 192)","rgb(54, 162, 235)","rgb(153, 102, 255)","rgb(201, 203, 207)",,"rgb(54, 162, 235)","rgb(153, 102, 255)","rgb(201, 203, 207)"],"borderWidth":1}]},"options":{"scales":{"yAxes":[{"ticks":{"beginAtZero":true}}]}}});</script>


<script>
  $(function () {
    $('#example2').DataTable()
     $('#example1').DataTable()
  
  })
</script>
<script>
  $(function () {
      
     //Date picker
    $('#datepicker1').datepicker({
      autoclose: true
    })  
      
        })
  
</script>
<script>
   function validatetaskSearch(){
           if(document.getElementById("cfn").value==""){
           alert("Enter first name ");
           document.getElementById("cfn").focus();
           return false;
       } 
   
       return true;
    }
</script>
</body>
</html>
