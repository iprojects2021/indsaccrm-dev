<%@page import="blezz.Nd"%>
<%@page import="email.EmergencyEmail"%>
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
  <title>Vendor | INDSAC CRM</title>
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
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   --  Entring viewstock.jsp---");
%>
  
<%
          ArrayList<String> al=new ArrayList<String>();
          String vid=request.getParameter("vid");
          String type=request.getParameter("type");
        String requestid=(String)session.getAttribute("requestid");
       
        if("null"!=vid && "vendor".equals(type)||vid!=null&& "vendor".equals(type)){requestid=vid;
        
        }
        
       try{
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from contact where id=?");
        smt.setString(1,requestid);
        ResultSet rs=smt.executeQuery();
        while(rs.next()){
            for(int i=1;i<34;i++){
               al.add(rs.getString(i)); 
            }
        }
     rs.close();
      smt.close();
      con.close();   }
        catch(Exception e){
                String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n viewstock.jsp-----\n"
     + "LINE=120 \n select * from contact where id="+requestid+" ";
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
    <section class="content-header">
    
<%
      String msg=(String)session.getAttribute("submitmsg");
      String modifymsg=(String)session.getAttribute("modifymsg");
     if(msg!=null && msg.equals("success")){ %>
     <div class="alert alert-success alert-dismissable">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
    <strong>Success!</strong> <%=modifymsg%>.
  </div>
    <%}else if(msg!=null && msg.equals("fail")){%>
    <div class="alert alert-danger alert-dismissable">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
    <strong>Failed!</strong> Something wrong please try again...
  </div>
    <%}
    session.removeAttribute("submitmsg");
    session.removeAttribute("modifymsg");
    %>
           
           
          
		
	


	
	
    </section>

   <!-- Main content -->
    <section class="content">
	
		 
      
	 
	<%
           int i=0,j=0;
           String count2="NULL";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from stock where useradminid=?");
        smt.setString(1,usercid_adminid );
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count2=rs.getString(1);  }
   rs.close();
      smt.close();
      con.close();     } catch(Exception e){ 
          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n viewstock.jsp-----\n"
     + "LINE=178 \n select count(*) from stock where useradminid="+usercid_adminid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      }
      
       int n2=Integer.parseInt(count2);
       String taskdata2[][]=new String[n2+1][55];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from stock where useradminid=?");
         smt.setString(1,usercid_adminid );
       
        ResultSet rs=smt.executeQuery();
     i=1;
        while(rs.next())
        { 
           for( j=1;j<=8;j++)
          {
            taskdata2[i][j]=rs.getString(j); 
           
          }
           ++i;  
        }
       rs.close();
      smt.close();
      con.close(); } catch(Exception e){ 
          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n viewstock.jsp-----\n"
     + "LINE=204 \n select * from stock where useradminid="+usercid_adminid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      }
        i=0;
      %>
  
	 <div class="row">
        <div class="col-xs-12">
      

          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Stock Record </h3>
               <a  class="btn btn-sm btn-info btn-flat pull-right"  href="vendor.jsp">Add Product</a>
           
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example4" class="table table-bordered table-striped">
                <thead>
                <tr>
                 <th>SN</th>
                   <th>Product Name</th>
                  <th>Quantity</th>
                  <th>Price</th>
                  
                  <th>  Product Code</th>
                  <th>Limit</th>
                  <th>Report</th>
                  
                </tr>
                </thead>
                <tbody>
                <% int m2=0; for(m2=n2;m2>0;m2--) {  %>
                  <tr>
                      <td><%=++i %></td>
                      <td><a  href="viewstockdetail.jsp?vs=<%=taskdata2[m2][1] %>"><% out.print(taskdata2[m2][2]); %></a></td>
                    
                    
                      <td><% out.print(taskdata2[m2][3]); %></td>
                    <td><% out.print(taskdata2[m2][6]); %></td>
                    <td> <% out.print(taskdata2[m2][5]); %></td>
                    <td><% out.print(taskdata2[m2][4]); %></td>
                    <td>  <a href="viewproductreport.jsp?2a2e2a7673=<%=Nd.Encrypt(taskdata2[m2][1]) %>&2a2e2a706e616d65=<%=Nd.Encrypt(taskdata2[m2][2])%>"  > <h5 class="box-title" align="left" >View </h5></a></td>
                   
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
 <%    Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Leaving viewstock.jsp------");
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
    $('#example2').DataTable()
     $('#example1').DataTable()
     $('#example4').DataTable()
  
  })
</script>
</body>
</html>
