<%@page import="blezz.Nd"%>
<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
<%@page import="blezz.Db"%>
<%@page import="java.sql.ResultSetMetaData"%>
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
  <title>Service Request History | INDSAC CRM</title>
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
 Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Entering servicerequesthistory.jsp----------Service Request History---");
%>
    
    
    <%  String msg=null;
           String pagetype=request.getParameter("pagetype");
            String type=request.getParameter("type");
          String message="";
   
        %>
    
    
    
    
<%
          String al[]=new String[35];
         
          String tid=request.getParameter("2a2e2a746964");
             if(tid!=null){tid=Nd.Decrypt(tid);}
          String cnt=request.getParameter("cnt");
       
       
          try{
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from servicerequestlog where useradminid=? and id=? ");
        smt.setString(1,usercid_adminid);
        smt.setString(2,tid);
        
        ResultSet rs=smt.executeQuery();
        while(rs.next()){
            for(int i=1;i<34;i++){
               al[i]=rs.getString(i); 
            }
        }
        
   rs.close();
      smt.close();
      con.close();     }
        catch(Exception e){
      String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n servicerequesthistory.jsp-----\n"
     + "LINE=105 \n select * from servicerequestlog where useradminid="+usercid_adminid+" AND id=?"+tid+"  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
                }
       //System.out.println(al.size());
       
      
     
      %>
<div class="wrapper">

  <jsp:include page="dist/include/leftmenu.jsp" />  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
 
	
	 <section class="content">
    


	
	<% if(!"".equals(message)){  %> 
        <div class="row"><div class="col-md-2"></div>
        <div class="col-md-6"> 
        <div class="alert alert-success alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <i class="icon fa fa-check"></i> 
                <%=message %>
        </div>  </div></div>   <% } %>	
	
	
	 <div class="row invoice">
        <div class="col-xs-12">
		 <!-- Default box -->
      <div class="box box-warning box-socid">
        <div class="box-header with-border">
            <h3 class="box-title"> Service Request History - <%="SR"+al[3] %></h3>
               <h6 class="pull-right"><%="Created By:"+Db.getEmployeeName(al[10])+" ,"+al[2] %></h6><br>
         
<!-- form start -->
          
        </div>   <input type="hidden" class="form-control"  name="own"  value="<%=al[13] %>">
           <div class="col-md-6">
		 <div class="box ">
             <div class="box-body">
                     <div class="form-group">
                  <label for="inputEmail3" class="col-sm-3 control-label"> Description</label>

                  <div class="col-sm-9">
                      <input type="text" class="form-control" id="subject"  name="subject" placeholder="<%=al[4] %>" value="<%=al[18] %>" disabled>
                  </div>
                </div>
                  <br><br>
          		    <div class="form-group">
                  <label for="inputEmail3" class="col-sm-3 control-label"> Subject</label>

                  <div class="col-sm-9">
                      <input type="text" class="form-control" id="subject"  name="subject" placeholder="<%=al[4] %>" value="<%=al[4] %>" disabled>
                  </div>
                </div>
                  <br><br>
				<div class="form-group">
                <label class="col-sm-3 control-label">Due Date</label>

                <div class="input-group date" class="col-sm-9 ">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div> <% 
                String check=(al[5]).substring(0,10);
                  check=Character.toString(check.charAt(5))+Character.toString(check.charAt(6))+"/"+Character.toString(check.charAt(8))+Character.toString(check.charAt(9))+"/"+Character.toString(check.charAt(0))+Character.toString(check.charAt(1))+Character.toString(check.charAt(2))+Character.toString(check.charAt(3));
       
                  
                  %>
                  <input type="text" class="form-control pull-right" name="datepicker" id="datepicker1" placeholder="<%=check %>" value="<%=check %>" required="" disabled>
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group --><br>
           
				 <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Priority</label>

                  <div class="col-sm-9">
                 <select id="importance" name="importance" class="form-control"  value="<%=al[6] %>" disabled>
                     <option value="<%=al[6] %>"> <%=al[6] %></option>
                          <option value="Normal"> Normal</option>
                          <option value="Very High">Very High</option>
                          <option value="High">High</option>
                          <option value="Critical Situation"> Critical Situation</option>
                          <option value="Normal">Normal</option>
                          <option value="Midium">Midium</option>
                          <option value="Low">Low</option>
                          
                     </select>
                  </div>
                                 </div>   <br><br>
                               
				     <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Status</label>

                  <div class="col-sm-9">
                 <select id="status" name="status" class="form-control" value="<%=al[7] %>" disabled>
                     <option value="<%=al[7] %>"> <%=al[7] %></option>
                          <option value="Open"> Open</option>
                           <option value="Follow Up">Follow Up</option>
                          <option value="In Process">In Process</option>
                          <option value="Complete">Complete</option>
                          <option value="Cancelled"> Cancelled</option>
                          <option value="Rejected">Rejected</option>
                          
                          
                     </select>
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
                  <label for="inputEmail3" class="col-sm-4 control-label">Approval Status</label>

                  <div class="col-sm-8">
                      <span class="label label-<%=Poul.statusSRApprovalColor(al[17]) %>"><% out.print(al[17]); %></span>
                    </div>
                            </div>  <br>
			    <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Assigned To</label>
 <% int count=Db.getAllEmployeeCount(usercid_adminid) ;

                            String data[][]=new String [count][5] ;  
                             data=Db.getAllEmployeeName(usercid_adminid, count);
                          %> 
                  <div class="col-sm-9">
                 <select id="status" name="assignedto" class="form-control" disabled>
                     <option value="<%=al[8] %>"> <%=Db.getEmployeeName(al[8]) %></option>
                     
                     <%  for(int i=1;i<=count;i++) { %>
                          <option value="<%=data[i][1]  %>"> <%=data[i][2]  %></option>
                           
                           <%  } %>
                          
                     </select>
                  </div>
                  </div>
                 <br><br>
                  <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Type</label>

                  <div class="col-sm-9">
                 <select id="status" name="servicerequesttype" class="form-control" disabled>
                     <option value="<%=al[13] %>"> <%=al[13] %></option>
                          <option value="Customer Call"> Customer Call</option>
                           <option value="Request for Information">Request for Information</option>
                          <option value="Customer Complaint">Customer Complaint</option>
                          <option value="Defective Product">Defective Product</option>
                          <option value="Installation Request"> Installation Request</option>
                          <option value="Maintenance Visit">Maintenance Visit</option>
                           <option value="Field Service"> Field Service</option>
                           
                          
                     </select>
                  </div>
                  </div><br><br>
					 
		    <div class="form-group">
                  <label for="inputEmail3" class="col-sm-3 control-label"> Remark </label>

                  <div class="col-sm-9">
                      <input type="text" class="form-control" id="remark"  name="remark" placeholder="Remark" value="<%=al[15] %>" autocomplete="off" disabled>
                  </div>
                </div>
                  <br><br>
                  	<div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label" >Resolution</label>

                  <div class="col-sm-9" >
                 <textarea class="form-control" rows="2" id="resolution" name="resolution" placeholder="<%=al[14] %>"  autocomplete="off" disabled><%=al[14] %></textarea>
                  </div>
                </div>
				
				
              
              </div>
              <!-- /.box-body -->
	  <div class="box-footer clearfix no-border">
		  <button type="button" class="btn btn-info pull-right" onclick="goBack()"> Back</button>
            </div>	
           
            
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
  <!-- /.content-wrapper -->
  <jsp:include page="dist/include/footer.jsp" />  
  <% Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+",SRid=SR"+al[3]+",id="+tid+"  --Leaving servicerequesthistory.jsp----------Service Request History---");
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
    $('#example5').DataTable()
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
