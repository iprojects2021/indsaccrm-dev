<%@page import="blezz.Nd"%>
<%@page import="java.time.LocalDate"%>
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
  <title>Monthly Expense | INDSAC CRM</title>
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
    Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"  --Entering monthlyexpensedatecreated.jsp----------Monthly Expense By Date Created ---");
       	
	
if (session != null) {
			if (session1.getAttribute("usercid_id") == null) {
				response.sendRedirect("signout.jsp");
			} 
		}
String year=request.getParameter("year");
String month=request.getParameter("month");
String type=request.getParameter("type");
String datestring="";
if(type==null){ java.util.Date date=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date.getTime());
       
       datestring=sqlDate.toString().substring(0, 8);
       month=datestring.substring(5,7);year=datestring.substring(0,4);
}if("monthlyexpense".equals(type)){datestring=year+"-"+month+"-";}
int count=menu.Expense.getMyAllMonthlyExpenseCountByDateCreated(usercid_adminid, usercid_id,datestring);

String data[][]=new String [count+1][32];
data=menu.Expense.getMyAllMonthlyExpenseDetailByDateCreated(usercid_adminid, usercid_id, count,datestring);

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
        My Monthly Expenses<a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Results based on Expense Date"><i class="fa  fa-info-circle"></i></a>
                
        
      </h1>
      
    </section>
    <section class="content-header">
         <div class="row">
             <div class="col-md-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3><% out.println(CommonUtility.getDashBoardAmount(Float.parseFloat(Expense.getMonthlyExpenseByDateCreated(usercid_adminid,usercid_id,month,year)))); %></h3>

              <p><%=CommonUtility.getMonthName(Integer.parseInt(month))+" "+year %> Expenses</p>
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
             <div class="col-md-6">
            <div class="box box-success">
            <div class="box-header">
              <h3 class="box-title">Search</h3>
            </div>
                <form action="" method="post">
            <div class="box-body">
              <p>Monthly Expenses</p>
<div class="col-md-4">
                    <select class="form-control" required name="year">
                            <% 

                             ArrayList<String> listyear=new ArrayList<String>();  
                             listyear=Expense.getDistinctExpenseYear(usercid_adminid, usercid_id);
                          %> 
                                   <option value="<%=year  %>"> <%=year  %></option>
                      <%   for(String list:listyear) { %>
                          
                          <option value="<%=list  %>"> <%=list  %></option>
                           
                           <%  } %>
                        
                    </select>
               </div>
              
                      <div class="col-md-4">
                  <select class="form-control" required name="month">
                      <option value="<%=month  %>"> <%=CommonUtility.getMonthName(Integer.parseInt(month))  %></option>
                    <option value="01"> January</option>
                     <option value="02"> February</option>
                      <option value="03"> March</option>
                       <option value="04"> April</option>
                        <option value="05"> May</option>
                         <option value="06"> June</option>
                          <option value="07"> July</option>
                           <option value="08"> August</option>
                            <option value="09"> September</option>
                           <option value="10"> October</option>
                           <option value="11"> November</option>
                            <option value="12"> December</option>
                        
                    </select>
                </div>
                <!-- /btn-group -->
                <div class="col-md-4">
                 <span class="input-group-btn">
                     <input type="hidden" name="type" value="monthlyexpense">
                      <button type="submit" class="btn btn-info btn-flat">Go!</button>
                    </span>
                </div>
            </div>
                </form>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
          <!-- split buttons box -->     
             </div>
         </div>
 <div class="row">
        <div class="col-xs-12">
        <div class="box box-info">
            <div class="box-header">
                <h3 class="box-title"><%=CommonUtility.getMonthName(Integer.parseInt(month))+" "+year %> Expenses </h3>
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
      <div class="row" id="expenses">
           
          <div class="box box-success">
               <div class="box-header with-border">
                 <h3 class="box-title"><%=CommonUtility.getMonthName(Integer.parseInt(month))+" "+year %>  Expenses
                    </h3>
</div>
            <div class="box-body">
           <div class="chart">
               <canvas id="chartjs-1"  width="undefined" height="undefined"></canvas>
              </div>
            
      </div>
      </div>
      </div>
          
    
        
	  
	
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
<script src="bower_components/chart.js/Chart2.js" ></script>

<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<% int [][] data1=new int[32][3];
 data1=Expense.getExpenseDailyCountByMonthByDateCreated(usercid_adminid, usercid_id, month, year);
%>
<script>new Chart(document.getElementById("chartjs-1"),{"type":"bar","data":{"labels":["Day 1","Day 2","Day 3","Day 4","Day 5","Day 6","Day 7","Day 8","Day 9","Day 10","Day 11","Day 12","Day 13","Day 14","Day 15","Day 16","Day 17","Day 18","Day 19","Day 20","Day 21","Day 22","Day 23","Day 24","Day 24","Day 26","Day 27","Day 28","Day 29","Day 30","Day 31"],"datasets":[{"label":"Expenses","data":[<%=data1[1][2]%>,<%=data1[2][2]%>,<%=data1[3][2]%>,<%=data1[4][2]%>,<%=data1[5][2]%>,<%=data1[6][2]%>,<%=data1[7][2]%>,<%=data1[8][2]%>,<%=data1[9][2]%>,<%=data1[10][2]%>,<%=data1[11][2]%>,<%=data1[12][2]%>,<%=data1[13][2]%>,<%=data1[14][2]%>,<%=data1[15][2]%>,<%=data1[16][2]%>,<%=data1[17][2]%>,<%=data1[18][2]%>,<%=data1[19][2]%>,<%=data1[20][2]%>,<%=data1[21][2]%>,<%=data1[22][2]%>,<%=data1[23][2]%>,<%=data1[24][2]%>,<%=data1[25][2]%>,<%=data1[26][2]%>,<%=data1[27][2]%>,<%=data1[28][2]%>,<%=data1[29][2]%>,<%=data1[30][2]%>,<%=data1[31][2]%>],"fill":false,"backgroundColor":["rgba(255, 99, 132, 0.2)","rgba(255, 159, 64, 0.2)","rgba(255, 205, 86, 0.2)","rgba(75, 192, 192, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)","rgba(201, 203, 207, 0.2)","rgba(255, 99, 132, 0.2)","rgba(255, 159, 64, 0.2)","rgba(255, 205, 86, 0.2)","rgba(75, 192, 192, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)","rgba(201, 203, 207, 0.2)","rgba(255, 99, 132, 0.2)","rgba(255, 159, 64, 0.2)","rgba(255, 205, 86, 0.2)","rgba(75, 192, 192, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)","rgba(201, 203, 207, 0.2)","rgba(255, 99, 132, 0.2)","rgba(255, 159, 64, 0.2)","rgba(255, 205, 86, 0.2)","rgba(75, 192, 192, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)","rgba(201, 203, 207, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)","rgba(201, 203, 207, 0.2)"],"borderColor":["rgb(255, 99, 132)","rgb(255, 159, 64)","rgb(255, 205, 86)","rgb(75, 192, 192)","rgb(54, 162, 235)","rgb(153, 102, 255)","rgb(201, 203, 207)","rgb(255, 99, 132)","rgb(255, 159, 64)","rgb(255, 205, 86)","rgb(75, 192, 192)","rgb(54, 162, 235)","rgb(153, 102, 255)","rgb(201, 203, 207)","rgb(255, 99, 132)","rgb(255, 159, 64)","rgb(255, 205, 86)","rgb(75, 192, 192)","rgb(54, 162, 235)","rgb(153, 102, 255)","rgb(201, 203, 207)","rgb(255, 99, 132)","rgb(255, 159, 64)","rgb(255, 205, 86)","rgb(75, 192, 192)","rgb(54, 162, 235)","rgb(153, 102, 255)","rgb(201, 203, 207)",,"rgb(54, 162, 235)","rgb(153, 102, 255)","rgb(201, 203, 207)"],"borderWidth":1}]},"options":{"scales":{"yAxes":[{"ticks":{"beginAtZero":true}}]}}});</script>
 <%  Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"  --Leaving monthlyexpensedatecreated.jsp----------Monthly Expense ---");
   
                %>
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
