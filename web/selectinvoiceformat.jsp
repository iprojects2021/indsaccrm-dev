<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
<%@page import="java.sql.ResultSetMetaData"%>
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
  <title>Select Invoice Format | INDSAC CRM</title>
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
     
	
if (session != null) {
			if (session1.getAttribute("usercid_id") == null) {
				response.sendRedirect("signout.jsp");
			} 
		}
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   --  Entring selectinvoiceformat.jsp---");
%>

<%
          String a1[]=new String[50];
          String cid=request.getParameter("cid");
          String type=request.getParameter("pagetype");
            
        String requestcid=null;
        requestcid=(String)session.getAttribute("requestcid");
       String avatar=request.getParameter("avatar");
        cid=usercid_id;
        requestcid=usercid_id;String msg="";
        if("avatarsubmit".equals(type)){
      try{
        Connection con=Poul.getConnectionCRM();
Statement st=con.createStatement();
           String query = "update  admindefaultvalues set invoiceformat='"+avatar+"' where id='"+cid+"'";
            int count = st.executeUpdate(query);
       msg="success"; 
     // rs.close();
      st.close();
      con.close();  }
        catch(Exception e){
               String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n  selectinvoiceformat.jsp-----\n"
     + "LINE=93 \n update  admindefaultvalues set avatar='"+avatar+"' where id='"+cid+"' ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
                }
         finally{
         if(msg.equals("success")){
       response.sendRedirect("profilesetting.jsp");
            }else{
              Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   ------  Entring selectinvoiceformat.jsp----------Redirecting To-------------error.jsp----------");
               response.sendRedirect("error.jsp");
            }
       }
       //System.out.println(al.size());
        }    %>
    <div class="wrapper">
      <jsp:include page="dist/include/leftmenu.jsp" />  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
   <!-- Main content -->
    <section class="content">
         <div class="row">
             <form action="" method="POST">
    <div class="col-md-12" id="avatarselect">
      <div class="box box-info"> 
            <div class="box-header with-border">
            <div class="col-md-3">     <h3 class="box-title">Select  Invoice Format </h3></div>
                <div class="col-md-3">     </div>
               <div class="col-md-4">    
              </div>
                <div class="col-md-2">       <button  class="btn btn-info pull-right " onclick="return validatetaskSearch()" type="submit">Save</button>
             </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
           </div>
            <!-- /.box-body -->
         </div>
          <!-- /.box -->
        </div>
        <!-- ./col -->
 </div>
      <!-- /.row -->
	<div class="row ">
            
           <div class="col-md-6">
<div class="box box-primary">
            <div class="box-body box-profile">
                <h3 class="profile-username text-left">Default<input type="radio" id="avatar" name="avatar" value="default" checked></h3>
             <a class="btn btn-sm btn-info btn-flat pull-left" href="invoice/examples/Format2-print.html" target="_blank">View</a>
             <img  src="dist/img/invoicesample/default.PNG" alt="User profile picture" width="300" height="400">
</div>   <!-- /.box-body -->
          </div><!-- /.box -->
</div>  <!-- /.col -->  
<div class="col-md-6">
<div class="box box-primary">
            <div class="box-body box-profile">
                 <h3 class="profile-username text-left">Set Format2<input type="radio" id="avatar" name="avatar" value="format2"></h3>
  <a class="btn btn-sm btn-info btn-flat pull-left" href="invoice/examples/Format2-print.html" target="_blank">View</a>
              
  <img  src="dist/img/invoicesample/invoiceprint1.PNG" alt="User profile picture" width="300">
 </div>   <!-- /.box-body -->
          </div><!-- /.box -->
</div>  <!-- /.col -->     

<div class="col-md-6">
<div class="box box-primary">
            <div class="box-body box-profile">
                 <h3 class="profile-username text-left">Set Format3<input type="radio" id="avatar" name="avatar" value="format3"></h3>
  <a class="btn btn-sm btn-info btn-flat pull-left" href="invoice/examples/invoiceprint.htm" target="_blank">View</a>
              
                <img  src="dist/img/invoicesample/invoiceprint1.PNG" alt="User profile picture" width="300">
  </div>   <!-- /.box-body -->
          </div><!-- /.box -->
</div>  <!-- /.col -->  
<div class="col-md-6">
<div class="box box-primary">
            <div class="box-body box-profile">
                 <h3 class="profile-username text-left">Set Format4<input type="radio" id="avatar" name="avatar" value="format4"></h3>
  <a class="btn btn-sm btn-info btn-flat pull-left" href="invoice/examples/invoiceprint.htm" target="_blank">View</a>
              
                <img  src="dist/img/invoicesample/invoiceprint1.PNG" alt="User profile picture">
  </div>   <!-- /.box-body -->
          </div><!-- /.box -->
</div>  <!-- /.col -->  
<input type="hidden"     name="pagetype"    value="avatarsubmit">
</div><!-- /.row -->
   <div class="row">
               
               
              
    <div class="col-md-12" id="avatarselect">
     
        <div class="box box-info"> 
            <div class="box-header with-border">
              

                 
               
                <div class="col-md-4">    
                 
                    <script> 
                   
                    </script>
                        
                 
                 </div>
                <div class="col-md-2">       <button  class="btn btn-info pull-right " onclick="return validatetaskSearch()" type="submit">Save</button>
             </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
             
            </div>
            <!-- /.box-body -->
           
          </div>
          <!-- /.box -->
        </div>
        <!-- ./col -->
 </div>
      <!-- /.row -->	
      </form>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
   <jsp:include page="dist/include/footer.jsp" />  
<%   Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Leaving selectinvoiceformat.jsp----------Select Invoice Format---");
       %>
  
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
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- page script -->
<script>
       function validatetaskSearch(){
             
        
           var avatar = document.getElementsByName('avatar');
        var genValue = false;

        for(var i=0; i<avatar.length;i++){
            if(avatar[i].checked == true){
                genValue = true;    
            }
        }
        if(!genValue){
           document.getElementById("alert-message").innerHTML = "Please select avatar";
    $('#show-alert').modal('show') 
    return false;
       } 
   
       

   
       return true;
    }
    
  $(function () {
    $('#example1').DataTable()
    $('#example2').DataTable()
    $('#example3').DataTable()
    $('#example4').DataTable()
    
  })
</script>

</body>
</html>
