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
 <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v7.0"></script>
    
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
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   --  Entring template.jsp---");
%>
    
    
    <%  String msg=null;
           String pagetype=request.getParameter("pagetype");
            String type=request.getParameter("type");
          String message="";
       if("taskedit".equals(pagetype)){
           String tid=Poul.escapeHtml(request.getParameter("tid"));
      String cid=Poul.escapeHtml(request.getParameter("cid"));
        String subject=Poul.escapeHtml(request.getParameter("subject"));
        String datepicker=Poul.escapeHtml(request.getParameter("datepicker"));
        String importance=Poul.escapeHtml(request.getParameter("importance"));
        String status=Poul.escapeHtml(request.getParameter("status"));
        String assigned=Poul.escapeHtml(request.getParameter("assigned"));
        String account=Poul.escapeHtml(request.getParameter("account"));
        String contact=Poul.escapeHtml(request.getParameter("contact"));
        String lead=Poul.escapeHtml(request.getParameter("lead"));
        String notes=Poul.escapeHtml(request.getParameter("notes"));
        String own=Poul.escapeHtml(request.getParameter("own"));
         String assignedto=Poul.escapeHtml(request.getParameter("assignedto"));
        
        datepicker=datepicker.substring(0,10);
       datepicker=Character.toString(datepicker.charAt(6))+Character.toString(datepicker.charAt(7))+Character.toString(datepicker.charAt(8))+Character.toString(datepicker.charAt(9))+"-"+Character.toString(datepicker.charAt(0))+Character.toString(datepicker.charAt(1))+"-"+Character.toString(datepicker.charAt(3))+Character.toString(datepicker.charAt(4))+" "+"23:59:59";
     try{
     Connection c=Poul.getConnectionCRM();

Statement st=c.createStatement();
           ResultSet rs3;
               rs3 = st.executeQuery("select  *  FROM task where id='"+tid+"'  ");
    ResultSetMetaData rsmd=rs3.getMetaData();
     String aa="null",ab="null",ac="null",ad="null",ae="null",af="null",ag="null",ah="null",ai="null",aj="null",ak="null",al="null",am="null",an="null",ap="";
          aa=rsmd.getColumnName(1);
           ab=rsmd.getColumnName(2);
            ac=rsmd.getColumnName(3);
             ad=rsmd.getColumnName(4);
              ae=rsmd.getColumnName(5);
               af=rsmd.getColumnName(6);
                ag=rsmd.getColumnName(7);
                 ah=rsmd.getColumnName(8);
                  ai=rsmd.getColumnName(9);
                   aj=rsmd.getColumnName(10);
                    ak=rsmd.getColumnName(11);
                     al=rsmd.getColumnName(12);
                      am=rsmd.getColumnName(13);
                       an=rsmd.getColumnName(14);
                        ap=rsmd.getColumnName(15);
                      
         
         
  st.addBatch("update task set   "+ad+"='"+subject+"',"+ae+"='"+datepicker+"',"+af+"='"+importance+"',"+ag+"='"+status+"',"+al+"='"+notes+"',"+am+"='"+assignedto+"'  where id='"+tid+"'");
   
            
       st.executeBatch(); 
        String requestcid=cid;
        session.setAttribute("requestcid",cid);
             msg="success";    
       
     rs3.close();
      st.close();
      c.close();    }
        catch(Exception e)
        {
            String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n template.jsp-----\n"
     + "LINE=132 \n select  *  FROM task where id='"+tid+"'  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
        }
        finally{
        
           // session.setAttribute("submitmsg",msg);
           // response.sendRedirect("newleads.jsp");
            if("success".equals(msg)){
        message="Task Edited Successfully";
            }else{
                Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   --------Entring invoicedash.jsp----------Redirecting To-----------error.jsp----------------");
               response.sendRedirect("error.jsp");
            }
        }
        
       }
        %>
    
    
    
    
<%
          String al[]=new String[35];
          String cid=request.getParameter("cid");
          String tid=request.getParameter("tid");
          String cnt=request.getParameter("cnt");
       
       if(!"null".equals(cid)){
          try{
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from task where id=? ");
        smt.setString(1,tid);
        
        ResultSet rs=smt.executeQuery();
        while(rs.next()){
            for(int i=1;i<34;i++){
               al[i]=rs.getString(i); 
            }
        }
        
    rs.close();
      smt.close();
      con.close();    }
        catch(Exception e){
                String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n template.jsp-----\n"
     + "LINE=179 \n select  *  FROM task where id='"+tid+"'  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
                }
       //System.out.println(al.size());
       
       }
     
      %>
<div class="wrapper">

  <jsp:include page="dist/include/leftmenu.jsp" />  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
 
	
	 <section class="content-header">
    


	
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
            <h3 class="box-title"> Facebook </h3>
            <h6 class="pull-right"><%="Created By:"+Db.getEmployeeName(al[10])+" ,"+al[2] %></h6><br>
           
<!-- form start -->
            <form class="form-horizontal" action="" method="post">
         
        </div>   
       
	    <div class="col-md-6">
	<div class="fb-page" data-href="https://www.facebook.com/BusinessConnect-113987237009831" data-tabs="timeline,events,messages" data-width="500" data-height="700" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><blockquote cite="https://www.facebook.com/BusinessConnect-113987237009831" class="fb-xfbml-parse-ignore">
                <a href="https://www.facebook.com/BusinessConnect-113987237009831">BusinessConnect</a>
            </blockquote>
        </div>

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
                  <label for="inputPassword3" class="col-sm-2 control-label">Assigned To</label>
 <% int count=Db.getAllEmployeeCount(usercid_adminid) ;

                            String data[][]=new String [count][5] ;  
                             data=Db.getAllEmployeeName(usercid_adminid, count);
                          %> 
                  <div class="col-sm-10">
                 <select id="status" name="assignedto" class="form-control">
                     <option value="<%=al[13] %>"> <%=Db.getEmployeeName(al[13]) %></option>
                     
                     <%  for(int i=1;i<=count;i++) { %>
                          <option value="<%=data[i][1]  %>"> <%=data[i][2]  %></option>
                           
                           <%  } %>
                          
                     </select>
                  </div>
                  </div>
                 <br><br>
					 
			  <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Notes</label>

                  <div class="col-sm-10">
                 <textarea class="form-control" rows="7" id="notes" name="notes" placeholder="<%=al[12] %>" ><%=al[12] %></textarea>
                 <input type="hidden" name="pagetype" value="taskedit">
                 
                  <input type="hidden" name="tid" value="<%=tid %>">
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
  <!-- /.content-wrapper -->
  <jsp:include page="dist/include/footer.jsp" />  
<% Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" -------Leaving template.jsp------");
 
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
