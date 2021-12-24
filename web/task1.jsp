<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
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
  <title>Task | INDSAC CRM</title>
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
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   --  Entring task1.jsp---");

          String show="null",show1="null",show0="null";
        String requestcid=(String)session.getAttribute("requestcid");
        String cid=Poul.escapeHtml(request.getParameter("cid"));
        
        if(cid!=null||cid!="null"||cid!=""){
       try{
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from contact where id=?");
        smt.setString(1,cid);
        ResultSet rs=smt.executeQuery();
        while(rs.next()){
            int i=5,j=6;
               show=(rs.getString(i)); show1=(rs.getString(j)); 
            
        }
       }
        catch(Exception e){
             String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n task1.jsp-----\n"
     + "LINE=88 \n select * from contact where id="+cid+"  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
        
                }
        }
       //System.out.println(al.size());
       
        
         String pagetype=request.getParameter("pagetype");
       if("tasksubmit".equals(pagetype)){
            
        String subject=Poul.escapeHtml(request.getParameter("subject"));
        String datepicker=Poul.escapeHtml(request.getParameter("datepicker"));
        String importance=Poul.escapeHtml(request.getParameter("importance"));
        String status=Poul.escapeHtml(request.getParameter("status"));
        String assigned=Poul.escapeHtml(request.getParameter("assigned"));
        String account=Poul.escapeHtml(request.getParameter("account"));
        String contact=Poul.escapeHtml(request.getParameter("contact"));
        String lead=Poul.escapeHtml(request.getParameter("lead"));
        String notes=Poul.escapeHtml(request.getParameter("notes"));
        
       datepicker=Character.toString(datepicker.charAt(6))+Character.toString(datepicker.charAt(7))+Character.toString(datepicker.charAt(8))+Character.toString(datepicker.charAt(9))+"-"+Character.toString(datepicker.charAt(0))+Character.toString(datepicker.charAt(1))+"-"+Character.toString(datepicker.charAt(3))+Character.toString(datepicker.charAt(4))+" "+"23:59:59";
    
        String SR="null";
        
        String msg="null";
        java.util.Date date=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());
        String owner=(String)session.getAttribute("owner"); 
        String id=(String)session.getAttribute("id"); 
          String ownr=(String)session.getAttribute("ownr"); 
        try{
        Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/ushaaicrm","root","mysql");

out.print("entered page");
Statement st=c.createStatement();
           ResultSet rs3;
               rs3 = st.executeQuery("select  *  FROM task  ");
    while(rs3.next())
        
          {SR=rs3.getString(1);
          
          }
           int i = Integer.parseInt( SR ); 
           ++i; out.print("value of i="+i+"  ");
             st.addBatch("insert into task values('"+i+"','"+sqlTime+"','0','"+subject+"','"+datepicker+"','"+importance+"','"+status+"','"+assigned+"','"+account+"','"+cid+"','"+lead+"','"+notes+"','"+ownr+"','','','','','','','','','','','','','','','','','','','','')");
      
            
       st.executeBatch(); 
        
       
             msg="success";    
       session.setAttribute("requestcid", cid);
        }
        catch(Exception e)
        {
            String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n task1.jsp-----\n"
     + "LINE=149 \n select  *  FROM task  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
        }
        finally{
        
           // session.setAttribute("submitmsg",msg);
           // response.sendRedirect("newleads.jsp");
            if(msg.equals("success")){ 

        response.sendRedirect("contactdetails.jsp");
            }else{
              Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   ------task1.jsp-----------Redirecting To---------------newcontact.jsp--------");
               response.sendRedirect("newcontact.jsp");
            }
        }
       }
       
            
       
       
      %>
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="lead.jsp" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>INDSAC</b>CRM</span>
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
          <p>  <% 
		if (session1 != null) {
			if (session1.getAttribute("ownr") != null) {
				String name = (String) session1.getAttribute("ownr");
				out.print( name );
			} else {
				response.sendRedirect("index.jsp");
			}
		}
	%></p>
          
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
            <li class="active"><a href="contact.jsp"><i class="fa fa-dashboard"></i> Contact Dashboard</a></li>
            <li><a href="newcontact.jsp"><i class="fa fa-user-plus"></i> New Contact</a></li>
           
          </ul>
        </li> 
        <li class="treeview ">
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
       
        <li class="treeview ">
          <a href="#">
            <i class="fa  fa-user-md"></i>
            <span>Invoice</span>
           <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="invoicedash.jsp"><i class="fa fa-dashboard"></i> Invoice Dashboard</a></li>
          
          </ul>
        </li> 
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
 
	
	 <section class="content-header">
    


	
		
	
	
	 <div class="row invoice">
        <div class="col-xs-12">
		 <!-- Default box -->
      <div class="box box-warning box-solid">
        <div class="box-header with-border">
          <h3 class="box-title">Create Task</h3>

         
        </div>
       
	    <div class="col-md-6">
		
		 <div class="box ">
            
           
            <!-- form start -->
            <form class="form-horizontal" action="" method="post">
              <div class="box-body">
			    <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label"> Subject</label>

                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="subject"  name="subject" placeholder="Subject">
                  </div>
                </div>
				
				<div class="form-group">
                <label>Due Date:</label>

                <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                    <input type="text" class="form-control pull-right" name="datepicker" id="datepicker1" required="">
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->
               
				 <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Priority</label>

                  <div class="col-sm-10">
                 <select id="importance" name="importance" class="form-control">
                          <option value="Normal"> Normal</option>
                          <option value="Very High">Very High</option>
                          <option value="High">High</option>
                          <option value="Critical Situation"> Critical Situation</option>
                          <option value="Normal">Normal</option>
                          <option value="Midium">Midium</option>
                          <option value="Low">Low</option>
                          
                     </select>
                  </div>
                </div>
				     <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Status</label>

                  <div class="col-sm-10">
                 <select id="status" name="status" class="form-control">
                          <option value="Open"> Open</option>
                           <option value="Follow Up">Follow Up</option>
                          <option value="In Process">In Process</option>
                          <option value="Complete">Complete</option>
                          <option value="Cancelled"> Cancelled</option>
                          <option value="Rejected">Rejected</option>
                          
                          
                     </select>
                  </div>
                </div>
          
		 <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label"> Assigned To</label>

                  <div class="col-sm-10">
                    <input type="text" class="form-control" name="assigned" id="assigned" placeholder=" Assigned To">
                  </div>
                </div>
              
              </div>
              <!-- /.box-body -->
             
             
           
              
              
          </div>
          <!-- /.box -->
        

        </div>
        <!--/.col (left) -->
      
        <div class="col-md-6">
          <!-- Horizontal Form -->
           <!-- general form elements -->
          <div class="box">
           
            <!-- /.box-header -->
            <!-- form start -->
           
              <div class="box-body">
			  
			   
					    <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label"> Account </label>

                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="account" name="account" placeholder=" Account">
                  </div>
                </div>
				  <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">  Company</label>

                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="contact" name="contact" placeholder="  <% if(cid!=null||cid!="null"||cid!=""){out.print(show+" "+show1);}    %>">
                  </div>
                </div>
                    <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">  Name</label>

                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="lead" name="lead" placeholder="  ">
                  </div>
                </div>
					 
			  <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Notes</label>

                  <div class="col-sm-10">
                 <textarea class="form-control" rows="7" id="notes" name="notes" placeholder=" Notes  "></textarea>
                 <input type="hidden" name="pagetype" value="tasksubmit">
                   <input type="hidden" name="requestcid" value="<%=cid %>">   
                 
                 
                  </div>
                </div>
				
				
              
              </div>
              <!-- /.box-body -->
			    <div class="box-footer clearfix no-border">
		  <button type="button" class="btn btn-default pull-left" onclick="goBack()"> Cancel</button>
              <button type="submit" class="btn btn-info pull-right"> Save</button>
            </div>
           
            </form>
          </div>
          <!-- /.box -->
  </div>
        <!--/.col (right) -->
 </div>
      <!-- /.box -->
</div>
		</div>
		
	
		

	
		
		
    </section>
    <!-- /.content -->
  </div>
<jsp:include page="dist/include/footer.jsp" />  
<% Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Leaving task1.jsp------");
 
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
      
        })
  
</script>
  

</body>
</html>
