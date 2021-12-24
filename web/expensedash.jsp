<%@page import="blezz.CommonUtility"%>
<%@page import="menu.Expense"%>
<%@page import="menu.Task"%>
<%@page import="menu.ServiceRequest"%>
<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
<%@page import="blezz.Db"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="blezz.Poul"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>     <link rel="shortcut icon" href="dist/img/u.png" type="image/x-icon" /> 
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Expense Dashboard | INDSAC CRM</title>
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

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
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
        	 String usercid_avatar=(String)session1.getAttribute("usercid_avatar"); 
        
	Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Entering expensedash.jsp----------Expense Dashboard---");
   
if (session != null) {
			if (session1.getAttribute("usercid_id") == null) {
				response.sendRedirect("signout.jsp");
			} 
		}

%>


    <div class="wrapper">
         <!-- Preloader -->
  <jsp:include page="dist/include/leftmenu.jsp" />  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
      <section class="content-header">
    <h1>
        Expense Dashbaord
     </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>
    <!-- Content Header (Page header) -->
    <section class="content-header">
       <div class="row">
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-aqua">
                <div class="inner">
                  <h3>
             <% java.util.Date date=new java.util.Date();
        java.sql.Date sqlDate1=new java.sql.Date(date.getTime());
       
       String month="",year="";
       month=sqlDate1.toString().substring(5,7);year=sqlDate1.toString().substring(0,4);
       
out.println(CommonUtility.getDashBoardAmount(Float.parseFloat(Expense.getMonthlyExpense(usercid_adminid,usercid_id,month,year)))); %></h3>
                  <p>Monthly Expense</p>
                </div>
                <div class="icon">
                  <i class="fa  fa-shopping-cart"></i>
                </div>
                   <a href="monthlyexpense.jsp" class="small-box-footer">
              More info <i class="fa fa-arrow-circle-right"></i>
            </a>
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-green">
                <div class="inner">
                    <h3>  <% out.print(CommonUtility.getDashBoardAmount(Float.parseFloat(Expense.getMyStatusExpenseAmount(usercid_adminid,usercid_id,"Unsettled"))) );%></h3>
                  <p>Unsettled Amount</p>
                </div>
                <div class="icon">
                  <i class="fa  fa-diamond"></i>
                </div>
                  <a href="unsettledexpense.jsp" class="small-box-footer">
              More info <i class="fa fa-arrow-circle-right"></i>
            </a>
              </div>
            </div><!-- ./col -->
            
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-yellow">
                <div class="inner">
                    <h3><%=Expense.getMyApprovalStatusExpensesCount(usercid_adminid, usercid_id,"Pending") %></h3>
                  <p>Pending Approval </p>
                </div>
                <div class="icon">
                  <i class="fa fa-flask"></i>
                </div>
                  <a href="mypendingexpenses.jsp" class="small-box-footer">
              More info <i class="fa fa-arrow-circle-right"></i>
            </a>
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-red">
            <div class="inner">
                
                <h3>Search</h3>

              <p>Pending by Due Dates </p>
            </div>
            <div class="icon">
              <i class="ion ion-pie-graph"></i>
            </div>
                <a href="pendingtsr.jsp" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
            </div><!-- ./col -->
          </div><!-- /.row -->
    </section>
 <!-- Main content -->
    <section class="content">
         <div class="row">
        <div class="col-md-6">	
	     <div class="box box-success">
            <div class="box-header with-border">
                <form action="" name="monthchart"   method="post" > 
                    <h3 class="box-title">Expenses for Year 
                       <select  required name="chartyear">
                            <%  String chartyear=request.getParameter("chartyear"); 
                           
                            if(chartyear!=null){year=chartyear;}
                            ArrayList<String> listyear=new ArrayList<String>();  
                             listyear=Expense.getDistinctExpenseYear(usercid_adminid, usercid_id); %> 
                      <option value="<%=year%>"> <%=year%></option>
                           <%   for(String list:listyear) { %>
                         <option value="<%=list  %>"> <%=list  %></option>
                           <%  } %>
                    </select>
                    <input type="submit"  class="btn btn-info " value="Show">
                    </h3>
  </form>
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
        <!-- /.col (LEFT) -->
	 <div class="col-md-6">
            <div class="box box-success">
            <div class="box-header">
              <h3 class="box-title">Search by Date Created</h3>
            </div>
                <form action="monthlyexpensedatecreated.jsp" method="post">
            <div class="box-body">
              <p>Monthly Expenses</p>
<div class="col-md-4">
                    <select class="form-control" required name="year">
                            <% 

                             ArrayList<String> listyear1=new ArrayList<String>();  
                             listyear1=Expense.getDistinctExpenseYear(usercid_adminid, usercid_id);
                          %> 
                                   <option value="<%=year  %>"> <%=year  %></option>
                      <%   for(String list1:listyear1) { %>
                          
                          <option value="<%=list1  %>"> <%=list1  %></option>
                           
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
        <!-- /.col (RIGHT) -->
      </div>
      <!-- /.row -->
          
    
</section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <jsp:include page="dist/include/footer.jsp" />  


  
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
<!-- FastClick -->
<script src="bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<script src="bower_components/chart.js/Chart2.js" ></script>
<div id="monthlyexpensechart">
<% int [][] data1=new int[13][3];
 data1=Expense.getExpenseMonthlyCountByYear(usercid_adminid, usercid_id, year);
%>
<script>new Chart(document.getElementById("chartjs-1"),{"type":"bar","data":{"labels":["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"datasets":[{"label":"Expenses","data":[<%=data1[1][2]%>,<%=data1[2][2]%>,<%=data1[3][2]%>,<%=data1[4][2]%>,<%=data1[5][2]%>,<%=data1[6][2]%>,<%=data1[7][2]%>,<%=data1[8][2]%>,<%=data1[9][2]%>,<%=data1[10][2]%>,<%=data1[11][2]%>,<%=data1[12][2]%>],"fill":false,"backgroundColor":["rgba(255, 99, 132, 0.2)","rgba(255, 159, 64, 0.2)","rgba(255, 205, 86, 0.2)","rgba(75, 192, 192, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)","rgba(255, 99, 132, 0.2)","rgba(255, 159, 64, 0.2)","rgba(255, 205, 86, 0.2)","rgba(75, 192, 192, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)"],"borderColor":["rgb(255, 99, 132)","rgb(255, 159, 64)","rgb(255, 205, 86)","rgb(75, 192, 192)","rgb(54, 162, 235)","rgb(153, 102, 255)","rgb(255, 99, 132)","rgb(255, 159, 64)","rgb(255, 205, 86)","rgb(75, 192, 192)","rgb(54, 162, 235)","rgb(153, 102, 255)"],"borderWidth":1}]},"options":{"scales":{"yAxes":[{"ticks":{"beginAtZero":true}}]}}});</script>
</div>
<%  Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"  --Leaving expensedash.jsp----------Expense Dashboard---");
   
                %>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>

<!-- page script -->
<script>
  $(function () {
    $('#example1').DataTable()
    $('#example2').DataTable()
    $('#example3').DataTable()
     $('#example13').DataTable()
    $('#example4').DataTable()
    
  })
</script>
<script>  
var request;  
function sendInfo()  
{  
    var val=document.monthchart.year.value; 
  
var url="expensemonthlychart.jsp?val="+val;  
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request.onreadystatechange=getInfo;  
request.open("post",url,true);  
request.send();  
}catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo(){  
if(request.readyState===4){  
var val=request.responseText;  
document.getElementById('monthlyexpensechart').innerHTML=val;  
}  
}  
  
</script>
</body>
</html>
