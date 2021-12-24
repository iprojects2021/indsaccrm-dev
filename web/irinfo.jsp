<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="blezz.Poul"%>
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="dist/img/u.png" type="image/x-icon" /> 
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Interation Record | INDSAC-CRM</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
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
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">
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
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   --  Entring irinfo.jsp---");
%>
	<%
           String lid=request.getParameter("lid");
           String irid=request.getParameter("ir");
         
       String taskdata1[][]=new String[2][55];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from interactionrecord where customerid=?");
        smt.setString(1,lid);
        ResultSet rs=smt.executeQuery();
    int j=1;
        while(rs.next())
        { 
           for( j=1;j<=32;j++)
          {
            taskdata1[1][j]=rs.getString(j); 
           
          }
            
        }
     rs.close();
      smt.close();
      con.close();   } catch(Exception e)
      { 
          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoicesetting.jsp-----\n"
     + "LINE=85 + \n select * from interactionrecord where customerid="+lid+"  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      }
      %>
  
  <header class="main-header">
    <!-- Logo -->
    <a href="lead.jsp" class="logo">
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
               <span class="hidden-xs"><%=usercid_company %></span>
           </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="dist/img/u.png" class="img-circle" alt="User Image">

                <p>
                  <%=usercid_company %>
                  <small><%=usercid_website %></small>
                </p>
              </li>
              <!-- Menu Body -->
             
              <!-- Menu Footer-->
              <li class="user-footer">
                
               <div class="pull-right">
                  <a href="signout.jsp" class="btn btn-default btn-flat">Sign out</a>
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
         <p><%=usercid_name %>  </p>
          
          
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- search form -->
   
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
       <ul class="sidebar-menu" data-widget="tree">
        <li class="treeview active">
          <a href="#">
            <i class="fa  fa-user-md"></i>
            <span>Lead</span>
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
         <li>
          <a href="template.jsp">
            <i class="fa fa-th"></i> <span>Template</span>
            <span class="pull-right-container">
              <small class="label pull-right bg-green">Hot</small>
            </span>
          </a>
        </li>
      
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- =============================================== -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Interaction Record
        
      </h1>
     <ol class="breadcrumb">
        
        <li class="active">Created By:<%=taskdata1[1][10] %></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Date:<%=(taskdata1[1][2]).substring(0,10) %></h3>

        
        </div>
        <div class="box-body">
            <p>Direction &nbsp; :<%=taskdata1[1][4] %></p>
            <p>Status &nbsp; :<%=taskdata1[1][5] %></p>
            <p>Priority &nbsp; :<%=taskdata1[1][6] %></p>
            <p>Product &nbsp; :<%=taskdata1[1][9] %></p>
            <br>
            <p>Enquiry &nbsp; :<%=taskdata1[1][7] %></p>
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
           <div class="box-footer clearfix">
                         <button type="button" class="btn btn-default pull-left" onclick="goBack()"> Cancel</button>
                         
            </div>
        </div>
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

<jsp:include page="dist/include/footer.jsp" />  
<% Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Leaving irinfo.jsp------");
 
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
<!-- SlimScroll -->
<script src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<script>
  $(document).ready(function () {
    $('.sidebar-menu').tree()
  })
</script>
<script>
function goBack() {
    window.history.back();
}
</script>
</body>
</html>
