<%@page import="menu.InvoiceMenu"%>
<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
<%@page import="blezz.Db"%>
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
      <link rel="shortcut icon" href="dist/img/u.png" type="image/x-icon" /> 
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Product Report | INDSAC-CRM</title>
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
<% HttpSession session1 = request.getSession(); // reuse existing
    
          String usercid_id=(String)session1.getAttribute("usercid_id");
          String usercid_email=(String)session1.getAttribute("usercid_email");
          String useraccountype=(String)session1.getAttribute("useraccountype");
          String usercid_name=(String)session1.getAttribute("usercid_name");
          String usercid_adminid=(String)session1.getAttribute("usercid_adminid");
             String usercid_company=(String)session1.getAttribute("usercid_company");
          String usercid_website=(String)session1.getAttribute("usercid_website"); 
         String Customerread=(String)session1.getAttribute("Customerread");
           
           String Customerwrite=(String)session1.getAttribute("Customerwrite");
       		
	
if (session != null) {
			if (session1.getAttribute("usercid_id") == null) {
				response.sendRedirect("signout.jsp");
			} 
		}
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   ------------Entring viewproductreport.jsp----------");
%>
<jsp:include page="dist/include/leftmenu.jsp" />  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <%  String vs=Poul.escapeHtml(request.getParameter("2a2e2a7673")); //vs 
      if(vs!=null){vs=Nd.Decrypt(vs);}
      
      String pname=Poul.escapeHtml(request.getParameter("2a2e2a706e616d65")); //vs 
      if(pname!=null){pname=Nd.Decrypt(pname);}
    
      java.util.Date date=new java.util.Date();
        java.sql.Date sqlDate1=new java.sql.Date(date.getTime());
       
       String month="",year="";
       month=sqlDate1.toString().substring(5,7);year=sqlDate1.toString().substring(0,4);
       
 
%>

   <!-- Main content -->
    <section class="content">
        <!-- Small boxes (Stat box) -->
        <h1>
        <%=pname%> Dashboard
       
      </h1>
       
          <div class="row">
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-aqua">
                <div class="inner">
                  <h3>
           
                      
                      <% out.print(menu.InvoiceMenu.getTotalQuantityProductSold(usercid_adminid, vs));%></h3>
                  <p>Quantity Sold </p>
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
                  <h3><%=menu.Stock.getProductQuantityInStock(usercid_adminid,vs)%></h3>
                  <p>In-Stock</p>
                </div>
                <div class="icon">
                  <i class="fa fa-file-text-o"></i>
                </div>
              </div>
            </div><!-- ./col -->
            
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-yellow">
                <div class="inner">
                    <h3><%=menu.InvoiceMenu.getCountInvoiceProductSold(usercid_adminid, vs) %></h3>
                  <p>Total Invoice</p>
                </div>
                <div class="icon">
                  <i class="ion ion-person-add"></i>
                </div>
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-red">
                <div class="inner">
                  <h3></h3>
                  <p>InActive Product</p>
                </div>
                <div class="icon">
                  <i class="ion ion-pie-graph"></i>
                </div>
              </div>
            </div><!-- ./col -->
          </div><!-- /.row -->
        

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
 listyear=InvoiceMenu.getDistinctSoldProductYear(usercid_adminid, vs); %> 
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
        <!-- /.col (RIGHT) -->
		   <div class="col-md-6">	
	     <div class="box box-success">
            <div class="box-header with-border">
              <h3 class="box-title">Product by Status</h3>

             
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
        <div class="col-xs-12">
      

          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Product </h3>
              
             <a class="btn btn-info pull-right " href="customertoexcel.jsp?customertype=customer">Download to Excel</a>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                   <th>Date   </th>
                  <th>Product Name</th>
                  <th>Product Code</th>
                  <th>  Quantity</th>
                  <th> Type</th>
                  <th> Invoice No</th>
                   <th> Vendor Bill No</th>
                   <th> Owner</th>
                </tr>
                </thead>
                <tbody> 
                   <%int  m=0; for(m=n123;m>0;m--) {  %>
                  <tr>
                      <td><a href="contactdetails1.jsp?cid=<%=leaddata[m][1] %>&type=<%=("contact") %>"><% out.print(leaddata[m][2]); %></a></td>
                    <td><% out.print(leaddata[m][5]); %></td>
                    <td><% out.print(leaddata[m][6]); %></td>
                      <td><% out.print(leaddata[m][11]); %></td>
                        <td><% 
                        if("add".equals(leaddata[m][24])){out.print("Stock Added");}if("remove".equals(leaddata[m][24])){out.print("Invoiced");}
                        %></td>
                        <td><% if(leaddata[m][25]!=""){out.print(Db.getBusinessInvoiceNo(leaddata[m][25]));}
                        
                       %></td>
                         
                    <td>
                        <% out.print(leaddata[m][13]); %>
                  </td>
                   <td><% out.print(Db.getEmployeeName(leaddata[m][4])); %></td>
                         
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
                <h3 class="box-title">Product Added By Day  of current Month </h3>
  <form action="" method="post">
                <select  class="form-group" name="productbymonth">
                            <option value="<%=curyear %>"><%=curyear %></option>
  <option value="2017">2017</option>
  <option value="2018">2018</option>
  <option value="2019">2019</option>
  <option value="2020">2020</option>
                        </select>  <select name="productbyday">
                            <option value="<%=Poul.getMonth(curmonth) %>"><%=Poul.getMonth(curmonth) %></option>
  <option value="01">January</option>
  <option value="02">February</option>
  <option value="03">March</option>
  <option value="04">April</option>
  <option value="05">May</option>
  <option value="06">June</option>
  <option value="07">July</option>
  <option value="08">August</option>
  <option value="09">September</option>
  <option value="10">October</option>
  <option value="11">November</option>
  <option value="12">December</option>
                        </select>
  
  <input type="submit" class="btn btn-info " value="ShowData">
                </form>      
              
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
<% Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Leaving viewproductreport.jsp------");
 
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
  <script>new Chart(document.getElementById("chartjs-4"),{"type":"doughnut","data":{"labels":["In-Active","Active"],"datasets":[{"label":"Status","data":[<%=New%>,<%=inprocess%>],"backgroundColor":["rgb(255, 99, 132)","rgb(106, 160, 251)"]}]}});</script>  


<script>new Chart(document.getElementById("chartjs-1"),{"type":"bar","data":{"labels":["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"datasets":[{"label":"<% out.print(pname); %>","data":[<%=jan%>,<%=feb%>,<%=mar%>,<%=apr%>,<%=may%>,<%=jun%>,<%=jul%>,<%=aug%>,<%=sep%>,<%=oct%>,<%=nov%>,<%=dec%>],"fill":false,"backgroundColor":["rgba(255, 99, 132, 0.2)","rgba(255, 159, 64, 0.2)","rgba(255, 205, 86, 0.2)","rgba(75, 192, 192, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)","rgba(255, 99, 132, 0.2)","rgba(255, 159, 64, 0.2)","rgba(255, 205, 86, 0.2)","rgba(75, 192, 192, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)"],"borderColor":["rgb(255, 99, 132)","rgb(255, 159, 64)","rgb(255, 205, 86)","rgb(75, 192, 192)","rgb(54, 162, 235)","rgb(153, 102, 255)","rgb(255, 99, 132)","rgb(255, 159, 64)","rgb(255, 205, 86)","rgb(75, 192, 192)","rgb(54, 162, 235)","rgb(153, 102, 255)"],"borderWidth":1}]},"options":{"scales":{"yAxes":[{"ticks":{"beginAtZero":true}}]}}});</script>


<script>new Chart(document.getElementById("chartjs-1231"),{"type":"bar","data":{"labels":["Day 1","Day 2","Day 3","Day 4","Day 5","Day 6","Day 7","Day 8","Day 9","Day 10","Day 11","Day 12","Day 13","Day 14","Day 15","Day 16","Day 17","Day 18","Day 19","Day 20","Day 21","Day 22","Day 23","Day 24","Day 24","Day 26","Day 27","Day 28","Day 29","Day 30","Day 31"],"datasets":[{"label":"<% out.print(pname); %>","data":[<%=d1%>,<%=d2%>,<%=d3%>,<%=d4%>,<%=d5%>,<%=d6%>,<%=d7%>,<%=d8%>,<%=d9%>,<%=d10%>,<%=d11%>,<%=d12%>,<%=d13%>,<%=d14%>,<%=d15%>,<%=d16%>,<%=d17%>,<%=d18%>,<%=d19%>,<%=d20%>,<%=d21%>,<%=d22%>,<%=d23%>,<%=d24%>,<%=d25%>,<%=d26%>,<%=d27%>,<%=d28%>,<%=d29%>,<%=d30%>,<%=d31%>],"fill":false,"backgroundColor":["rgba(255, 99, 132, 0.2)","rgba(255, 159, 64, 0.2)","rgba(255, 205, 86, 0.2)","rgba(75, 192, 192, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)","rgba(201, 203, 207, 0.2)","rgba(255, 99, 132, 0.2)","rgba(255, 159, 64, 0.2)","rgba(255, 205, 86, 0.2)","rgba(75, 192, 192, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)","rgba(201, 203, 207, 0.2)","rgba(255, 99, 132, 0.2)","rgba(255, 159, 64, 0.2)","rgba(255, 205, 86, 0.2)","rgba(75, 192, 192, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)","rgba(201, 203, 207, 0.2)","rgba(255, 99, 132, 0.2)","rgba(255, 159, 64, 0.2)","rgba(255, 205, 86, 0.2)","rgba(75, 192, 192, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)","rgba(201, 203, 207, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)","rgba(201, 203, 207, 0.2)"],"borderColor":["rgb(255, 99, 132)","rgb(255, 159, 64)","rgb(255, 205, 86)","rgb(75, 192, 192)","rgb(54, 162, 235)","rgb(153, 102, 255)","rgb(201, 203, 207)","rgb(255, 99, 132)","rgb(255, 159, 64)","rgb(255, 205, 86)","rgb(75, 192, 192)","rgb(54, 162, 235)","rgb(153, 102, 255)","rgb(201, 203, 207)","rgb(255, 99, 132)","rgb(255, 159, 64)","rgb(255, 205, 86)","rgb(75, 192, 192)","rgb(54, 162, 235)","rgb(153, 102, 255)","rgb(201, 203, 207)","rgb(255, 99, 132)","rgb(255, 159, 64)","rgb(255, 205, 86)","rgb(75, 192, 192)","rgb(54, 162, 235)","rgb(153, 102, 255)","rgb(201, 203, 207)",,"rgb(54, 162, 235)","rgb(153, 102, 255)","rgb(201, 203, 207)"],"borderWidth":1}]},"options":{"scales":{"yAxes":[{"ticks":{"beginAtZero":true}}]}}});</script>


<script>
  $(function () {
    $('#example2').DataTable()
     $('#example1').DataTable()
  $('#example3').DataTable()
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
       else if(document.getElementById("cfn").value.length>30){
           alert("Only 30 Characters allowed ");
           document.getElementById("cfn").focus();
           return false;
       } 
       function inputAlphabet(inputtext, alertMsg){
            var alphaExp = /^[a-zA-Z]+$/;
            if(inputtext.value.match(alphaExp)){
            return true;
            }
            else{
            document.getElementById("cfn").innerText = alertMsg;
            inputtext.focus();
            return false;
            }
}
   
       return true;
    }
</script>
</body>
</html>
