<%@page import="blezz.Nd"%>
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
  <title>Sent Mail | INDSAC CRM</title>
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
        
	Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Entering SentMail.jsp-------------");
   
if (session != null) {
			if (session1.getAttribute("usercid_id") == null) {
				response.sendRedirect("signout.jsp");
			} 
		}
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Entering SentMail.jsp--------");
%>

<% 
 
          String a1[]=new String[50];
          String cid=request.getParameter("cid");
          String type=request.getParameter("type");
        String requestcid=null;
        requestcid=(String)session.getAttribute("requestcid");
       
        cid=usercid_id;
        requestcid=usercid_id;
    
       //System.out.println(al.size());
      %>
 
    <div class="wrapper">
      <jsp:include page="dist/include/leftmenu.jsp" />  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
      <section class="content-header">
      <h1>
        Sent Email   
        
      </h1>
      <ol class="breadcrumb">
          <li><a href="dashboard.jsp"><i class="fa fa-dashboard"></i> Email</a></li>
        <li class="active">Sent Email</li>
      </ol>
    </section>
    <!-- Content Header (Page header) -->
    <section class="content-header">
  
    </section>

   <!-- Main content -->
    <section class="content">
        

     <% 
 
           int i=0;int j=0;int CH=0;
           String count1;  count1="0";
        
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement(" SELECT count(distinct timestamp,subject,usercid) FROM sentmailcontent where useradminid=? AND usercid=? ");
        smt.setString(1,usercid_adminid);
         smt.setString(2,usercid_id);
        
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count1=rs.getString(1);  }
       rs.close();
      smt.close();
      con.close(); }
       catch(Exception e)
       {
                   String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n SentMail.jsp-----\n"
     + "LINE=122\n select count(*) from sentmailcontent where useradminid="+usercid_adminid +" AND usercid="+usercid_id+"  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
      
      }
      
       int n1=Integer.parseInt(count1);
       String taskdata156[][]=new String[n1+1][4];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("SELECT distinct timestamp,subject,usercid FROM sentmailcontent where useradminid=? AND usercid=? ");
        smt.setString(1,usercid_adminid);
         smt.setString(2,usercid_id);
        
        ResultSet rs=smt.executeQuery();
     i=1;
        while(rs.next())
        {  
               CH++;
           for( j=1;j<=3;j++)
          {
            taskdata156[i][j]=rs.getString(j); 
           
          } 
           ++i;  
        }
    rs.close();
      smt.close();
      con.close();    } 
        catch(Exception e)
        { 
                   String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n SentMail.jsp-----\n"
     + "LINE=154 \n select * from sentmailcontent where useradminid="+usercid_adminid+" AND usercid="+usercid_id+"";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
      }
        
            
                  %>
<div class="row">
            <div class="col-md-12">
               <!-- TABLE: LATEST ORDERS -->
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Sent Mails
             
             </h3>

            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <table id="example13" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th> Date & Time </th>
                  <th>Subject</th>
                 
                 <th> Created</th>
                  </tr>
                  </thead>
                  <tbody>
                      
                <% int  m=0; for(m=n1;m>0;m--) {  %>
                  <tr>
                    <td><% out.print(taskdata156[m][1]); %></td>
                    <td><a href="readmail.jsp?<%=Nd.Encrypt("mid") %>=<%=Nd.Encrypt(taskdata156[m][1]) %>"><% out.print(taskdata156[m][2]); %></a></td>
                   
                   
                    <td><%=Db.getEmployeeName(taskdata156[m][3]) %></td>
                 </tr>
         
                  <% } %>
                 
               
                </tbody>
                </table>
              </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
          
            <!-- /.box-footer -->
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

<% Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Leaving SentMail.jsp-------------");
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
  
     $('#example13').DataTable()
   
    
  })
</script>

</body>
</html>
