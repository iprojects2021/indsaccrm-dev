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
  <title>Profile Setting | INDSAC CRM</title>
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
        
	
if (session != null) {
			if (session1.getAttribute("usercid_id") == null) {
				response.sendRedirect("signout.jsp");
			} 
		}
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   --  Entring profilesetting.jsp---");
%>

<%
          String a1[]=new String[50];
          String cid=request.getParameter("cid");
          String type=request.getParameter("type");
        String requestcid=null;
        requestcid=(String)session.getAttribute("requestcid");
       
        cid=usercid_id;
        requestcid=usercid_id;
       try{
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from register where id=?");
        smt.setString(1,requestcid);
        ResultSet rs=smt.executeQuery();
        while(rs.next()){
            for(int i=1;i<49;i++){
               a1[i]=(rs.getString(i)); 
              
            }
        }
     rs.close();
      smt.close();
      con.close();   }
        catch(Exception e){
                String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n profilesetting.jsp-----\n"
     + "LINE=89 \n  select * from register where id="+requestcid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg); 
                }
   
      %>
    <div class="wrapper">
      <jsp:include page="dist/include/leftmenu.jsp" />  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
     <div class="row">
	 <div class="col-md-12">
          <!-- Widget: user widget style 1 -->
          <div class="box box-widget widget-user">
            <!-- Add the bg color to the header using any of the bg-* classes -->
            <div class="widget-user-header bg-black" style="background: url('dist/img/photo1.png') center center;">
              <h3>Profile Setting</h3>

            </div>
            <div class="widget-user-image">
              <img class="img-circle" src="dist/img/<%=usercid_avatar %>" alt="User Avatar">
            </div>
            <div class="box-footer">
              <div class="row">
                 
                <div class="col-sm-4 ">
                   
                    <div class="description-block">
                         
			<h1 align="left"><% if(a1[6]!=null&&!"".equals(a1[6])&&!"null".equals(a1[6])){out.print(a1[6]);}  %> </h1>
		
                        
                        <%if(a1[5]!=null&&!a1[5].equals("")&&!a1[5].equals("null")){%> <h5 align="left">Company &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp;<% out.print(a1[5]); %>  </h5><%}%>
		 <%if(a1[8]!=null&&!a1[8].equals("")&&!a1[8].equals("null")){%>  <h5 align="left">Department&nbsp;&nbsp;&nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp;<% out.print(a1[8]); %>  </h5><%}%>
                 <%if(a1[9]!=null&&!a1[9].equals("")&&!a1[9].equals("null")){%> <h5 align="left">  Designation&nbsp;&nbsp;&nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp;<% out.print(a1[9]); %>  </h5><%}%>
             <%if(a1[13]!=null&&!a1[13].equals("")&&!a1[13].equals("null")){ %><h5 align="left">Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp;<span class="label label-success"><% out.print(a1[13]);%></span></h5> <% } %>
		
              
              <%if(a1[14]!=null&&!a1[14].equals("")&&!a1[14].equals("null")){%>  <h5 align="left">Report To&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp;<% out.print(a1[14]); %>  </h5><%}%>
               <%if(a1[15]!=null&&!a1[15].equals("")&&!a1[15].equals("null")){%>  <h5 align="left">Source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp;<% out.print(a1[15]); %>  </h5><%}%>
               <%if(a1[17]!=null&&!a1[17].equals("")&&!a1[17].equals("null")){%>  <h5 align="left">Vendor Name&nbsp;<strong>:</strong>&nbsp;&nbsp;<% out.print(a1[17]); %>  </h5><%}%>
               <%if(a1[18]!=null&&!a1[18].equals("")&&!a1[18].equals("null")){%>  <h5 align="left">Website&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp;<% out.print(a1[18]); %>  </h5><%}%>
               <%if(a1[25]!=null&&!a1[25].equals("")&&!a1[25].equals("null")){%>  <h5 align="left"><strong>GSTIN</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>:&nbsp;&nbsp;<% out.print(a1[25]); %> </strong> </h5><%}%>
              
			
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
                <div class="col-sm-4 ">
                    <div class="description-block"> <br> <br> <br>
                   <h5 class="description-header">Contact</h5>
      <%if(a1[20]!=null&&!a1[20].equals("")&&!a1[20].equals("null")){%>  <span class="description-text" align="left"> Personal Mobile&nbsp;&nbsp;&nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp; <%=a1[20]%> </span><br><% } %>
      <%if(a1[21]!=null&&!a1[21].equals("")&&!a1[21].equals("null")){%>  <span class="description-text" align="left"> Personal Phone&nbsp;&nbsp;&nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp; <%=a1[21]%> </span><br><% } %>
    <%if(a1[22]!=null&&!a1[22].equals("")&&!a1[22].equals("null")){%>  <span class="description-text" align="left"> Business Mobile&nbsp;&nbsp;&nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp; <%=a1[22]%> </span><br><% } %>
      <%if(a1[26]!=null&&!a1[26].equals("")&&!a1[26].equals("null")){%>  <span class="description-text" align="left"> Business Phone&nbsp;&nbsp;&nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp; <%=a1[26]%> </span><br><% } %>
     <%if(a1[23]!=null&&!a1[23].equals("")&&!a1[23].equals("null")){%>  <span class="description-text" align="left"> Business Email&nbsp;&nbsp;&nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp; <%=a1[23]%> </span><br><% } %>
     <%if(a1[24]!=null&&!a1[24].equals("")&&!a1[24].equals("null")){%>  <span class="description-text" align="left"> Business Email&nbsp;&nbsp;&nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp; <%=a1[24]%> </span><br><% } %>
    
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
                <div class="col-sm-4">
                  <div class="description-block"><br> <br> <br>
                   <h5 class="description-header">Address</h5>
     <%if(a1[28]!=null&&!a1[28].equals("")&&!a1[28].equals("null")){%>  <span class="description-text">  <%=a1[28]%> </span><br><% } %>
      <%if(a1[31]!=null&&!a1[31].equals("")&&!a1[31].equals("null")){%>  <span class="description-text">  <%=a1[31]%> </span><br><% } %>
      <%if(a1[32]!=null&&!a1[32].equals("")&&!a1[32].equals("null")){%>  <span class="description-text">  <%=a1[32]%> </span><br><% } %>
      <%if(a1[33]!=null&&!a1[33].equals("")&&!a1[33].equals("null")){%>  <span class="description-text"> <%=a1[33]%> </span><br><% } %>
      <%if(a1[34]!=null&&!a1[34].equals("")&&!a1[34].equals("null")){%>  <span class="description-text">  <%=a1[34]%> </span><br><% } %>
      <%if(a1[35]!=null&&!a1[35].equals("")&&!a1[35].equals("null")){%>  <span class="description-text"> <%=a1[35]%> </span><br><% } %>
                    
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->
	
		
	<div class="row ">
	<div class="col-sm-3">
	<button type="button" class="btn btn-block btn-primary"><i class="fa fa-fw fa-edit"></i>Create Service Request</button>
	</div>
	
	<div class="col-sm-3">
            <a href="selectavatar.jsp" >  <button type="submit" class="btn btn-block btn-primary" ><i class="fa fa-fw fa-upload"></i>Select Avatar</button></a>
             </div>
	<div class="col-sm-3">
        <a href="profileedit.jsp?cid=<%=requestcid %>">    <button type="button" class="btn btn-block btn-primary"><i class="fa fa-fw fa-edit"></i>Edit Profile Details</button></a>
	</div>
       <div class="col-sm-3">
        <a href="mailsetting.jsp">    <button type="button" class="btn btn-block btn-primary"><i class="fa fa-fw fa-edit"></i>Email Setting</button></a>
	</div>
	</div>

     
	
    </section>

   <!-- Main content -->
    <section class="content">
        
    </section>
  </div>
  <!-- /.content-wrapper -->
  <jsp:include page="dist/include/footer.jsp" />  
<% Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Leaving profilesetting.jsp------");
 
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
  $(function () {
    $('#example1').DataTable()
    $('#example2').DataTable()
    $('#example3').DataTable()
    $('#example4').DataTable()
    
  })
</script>

</body>
</html>
