<%@page import="blezz.Nd"%>
<%@page import="menu.Expense"%>
<%@page import="blezz.CommonUtility"%>
<%@page import="log.Log"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="blezz.Poul"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="dist/img/u.png" type="image/x-icon" /> 
     <style>
    .example-modal .modal {
      position: relative;
      top: auto;
      bottom: auto;
      right: auto;
      left: auto;
      display: block;
      z-index: 1;
    }

    .example-modal .modal {
      background: transparent !important;
    }
  </style>
  
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Unsettled Expense | INDSAC CRM</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
  <!-- DataTables -->
 <link rel="stylesheet" href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">

  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
<!-- AdminLTE App -->


  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

 <style>
      .modal-header,.close 
  {
      background-color:#6495ED;
      color:white !important;
      text-align: left;
      font-size: 20px;
  }
  .modal-footer {
      background-color: #f9f9f9;
  }
  .sidebar-form{
      background-color: #f9f9f9;
  }
  </style>
</head>
  <% HttpSession session1 = request.getSession(); // reuse existing
    
          String usercid_id=(String)session1.getAttribute("usercid_id");
          String usercid_email=(String)session1.getAttribute("usercid_email");
          String useraccountype=(String)session1.getAttribute("useraccountype");
          String usercid_name=(String)session1.getAttribute("usercid_name");
          String usercid_adminid=(String)session1.getAttribute("usercid_adminid");
             String usercid_company=(String)session1.getAttribute("usercid_company");
          String usercid_website=(String)session1.getAttribute("usercid_website"); 
    Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"  --Entering monthlyexpense.jsp----------Monthly Expense ---");
       	
	
if (session != null) {
			if (session1.getAttribute("usercid_id") == null) {
				response.sendRedirect("signout.jsp");
			} 
		}
int count=menu.Expense.getMyAllStatusExpenseCount(usercid_adminid, usercid_id,"Unsettled");

String data[][]=new String [count+1][32];
data=menu.Expense.getMyAllStatusExpenseDetail(usercid_adminid, usercid_id, count,"Unsettled");

%>
  
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
      
  <jsp:include page="dist/include/leftmenu.jsp" />  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
   <!-- Main content -->
    <section class="content-header">
    <h1>
        My Unsettled Expenses<a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Results based on all my unsettled Expense "><i class="fa  fa-info-circle"></i></a>
                
        
      </h1>
      
    </section>
    <section class="content-header">
         <div class="row">
             <div class="col-md-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3><% out.print(CommonUtility.getDashBoardAmount(Float.parseFloat(Expense.getMyStatusExpenseAmount(usercid_adminid,usercid_id,"Unsettled"))) );%></h3>

              <p>Unsettled Expenses</p>
            </div>
            <div class="icon">
              <i class="fa fa-shopping-cart"></i>
            </div>
            <a href="#expenses" class="small-box-footer">
              More info <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
        </div>
        <!-- ./col -->
       
         </div>
 <div class="row">
        <div class="col-xs-12">
        <div class="box box-info">
            <div class="box-header">
                <h3 class="box-title">Unsettled Expenses </h3>
           </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example4" class="table table-bordered table-striped">
                <thead>
                <tr>
                 <th>ID</th>
                   <th>Date & Time</th>
                  <th>Bill Number</th>
                  <th>Subject</th>
                  <th>Expense Amount</th>
                  <th> Expense Date</th>
                  <th> Approval Status</th>
                  <th>Category</th>
                  <th>Status</th>
                   <th>Created By</th>
                </tr>
                </thead>
                <tbody>
                <% int m2=0; for(m2=count;m2>0;m2--) {  %>
                  <tr>
                      <td><%="EX"+data[m2][1] %></td>
                      <td><% out.print(data[m2][2]); %></td>
                      <td><% out.print(data[m2][3]); %></td>
                      <td><a  href="expenseedit.jsp?2a2e2a746964=<%=Nd.Encrypt(data[m2][1]) %>"><% out.print(data[m2][4]); %></a></td>
                    <td><% out.print(CommonUtility.getDashBoardAmount(Float.parseFloat(data[m2][8]))); %></td>
                    <td> <% out.print(data[m2][5].substring(0, 10)); %></td>
                      <td> <span class="label label-<%=Poul.statusSRApprovalColor(data[m2][15]) %>"><% out.print(data[m2][15]); %></span>
                     </td>
                    <td><% out.print(data[m2][6]); %></td>
                    <td><span class="label label-<%=menu.Expense.statusExpenseColor(data[m2][7]) %>"><% out.print(data[m2][7]); %></span></td>
                 <td> <% out.print(blezz.Db.getEmployeeName(data[m2][10])); %> </td>
                   
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
 
          
    
        
	  
	
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
 <jsp:include page="dist/include/footer.jsp" />  

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
<!-- DataTables -->
<script src="bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

<!-- SlimScroll -->
<script src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>


<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>

<!-- page script -->
<script>
  $(function () {
    $('#example2').DataTable()
     $('#example1').DataTable()
     $('#example4').DataTable()
  
  })
</script>
</body>
</html>
