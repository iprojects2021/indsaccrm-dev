<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
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
  <title>Search Interaction | INDSAC CRM</title>
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
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   --  Entring searchinteraction.jsp---");
%>

  
<div class="wrapper">

  <jsp:include page="dist/include/leftmenu.jsp" />  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
 
	
	 <section class="content-header">
             
          
             
          <%  String tksrch=request.getParameter("tksrch");
                        if("priority".equals(tksrch)){
                            String priority=request.getParameter("priority");
                            
             String dbdate=null;
           int i=0,j=0,CH=0;
           String count1;  count1="1";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select COUNT(*) from interactionrecord where useradminid='"+usercid_adminid+"' AND usercid='"+usercid_id+"' and  priority='"+priority+"'; ");
       
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count1=rs.getString(1);  }
    rs.close();
      smt.close();
      con.close();    } catch(Exception e){ 
          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n searchinteraction.jsp-----\n"
     + "LINE=95 \nselect COUNT(*) from interactionrecord where useradminid='"+usercid_adminid+"' AND usercid='"+usercid_id+"' and  priority='"+priority+"'  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      }
      
       int n1=Integer.parseInt(count1);
       String taskdata1[][]=new String[n1+1][55];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from interactionrecord where useradminid='"+usercid_adminid+"' AND usercid='"+usercid_id+"' and  priority='"+priority+"'; ");
       
        ResultSet rs=smt.executeQuery();
     i=1;
        while(rs.next())
        {  
               CH++;
           for( j=1;j<=10;j++)
          {
            taskdata1[i][j]=rs.getString(j); 
           
          } 
           ++i;  
        }
     rs.close();
      smt.close();
      con.close();   } catch(Exception e){ 
           String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n searchinteraction.jsp-----\n"
     + "LINE=121 \n select * from interactionrecord where useradminid='"+usercid_adminid+"' AND usercid='"+usercid_id+"' and  priority='"+priority+"'  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      }
        
                    
      %> 
          
          
          
          
	 <div class="row invoice">
               
    <div class="col-md-12" >
     
        <div class="box box-info"> 
            
              
 <div class="box-header with-border">
     <h3 class="box-title"> Interaction Results for  <%=priority %> Priority  </h3>
          <form action="">        <button type="submit" class="btn btn-info pull-right"  > Search More Task</button></form>
            
        </div>
            
               
          
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <table id="example2" class="table table-bordered table-striped">
                <thead>
                 <tr>
                       <th>Date</th>
                    <th>Product</th>
                    <th>Direction</th>
					<th>Status</th>
                                        <th>Priority</th>
                    
                  </tr>
                </thead>
                <tbody>
              <% int m=0; for(m=1;m<=n1;m++) {
                       %>
                  <tr>
                    
                      <td ><a href="iredit.jsp?tid=<%=taskdata1[m][1] %>"><% out.print(taskdata1[m][2].substring(0, 10)); %></a></td>
                    
                    <td><% out.print(taskdata1[m][9]); %></td>
                    <td><% out.print(taskdata1[m][4]); %>
                          
                          
                     </td>
                     <td> <span class="label label-<%=Poul.statusIRColor(taskdata1[m][5])  %>"><% out.print(taskdata1[m][5]); %></span>
                      </td>
                   <td> 
                        
                           <span class="label label-<%=Poul.statusIRPriorityColor(taskdata1[m][6])  %>"><% out.print(taskdata1[m][6]); %></span>
                        
                   </td>
                  </tr>
                  <% } %>
                
                </tbody>
               
              </table>
              </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
           
          </div>
          <!-- /.box -->
        </div>
        <!-- ./col -->
		</div>
		 <% } %>
	
		
             
             
             <% 
                        if("status".equals(tksrch)){
                            String status=request.getParameter("status");
                            
             String dbdate=null;
           int i=0,j=0,CH=0;
           String count1;  count1="1";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select COUNT(*) from interactionrecord where useradminid='"+usercid_adminid+"' AND usercid='"+usercid_id+"' and  status='"+status+"'; ");
       
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count1=rs.getString(1);  }
    rs.close();
      smt.close();
      con.close();    } catch(Exception e){ 
          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n searchinteraction.jsp-----\n"
     + "LINE=217 \n select COUNT(*) from interactionrecord where useradminid='"+usercid_adminid+"' AND usercid='"+usercid_id+"' and  status='"+status+"'  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      }
      
       int n1=Integer.parseInt(count1);
       String taskdata1[][]=new String[n1+1][55];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from interactionrecord where useradminid='"+usercid_adminid+"' AND usercid='"+usercid_id+"' and  status='"+status+"'; ");
       
        ResultSet rs=smt.executeQuery();
     i=1;
        while(rs.next())
        {  
               CH++;
           for( j=1;j<=10;j++)
          {
            taskdata1[i][j]=rs.getString(j); 
           
          } 
           ++i;  
        }
    rs.close();
      smt.close();
      con.close();    } catch(Exception e){ 
          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n searchinteraction.jsp-----\n"
     + "LINE=243 \n select * from interactionrecord where useradminid='"+usercid_adminid+"' AND usercid='"+usercid_id+"' and  status='"+status+"' ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      }
        
                    
      %> 
          
          
          
          
	 <div class="row invoice">
               
    <div class="col-md-12" >
     
        <div class="box box-info"> 
          
              
 <div class="box-header with-border">
          <h3 class="box-title"> Interaction Results for <%=status  %> Status </h3>
          <form action="">        <button type="submit" class="btn btn-info pull-right"  > Search More Interactions</button></form>
            
        </div>
            
               
         
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
               <table id="example2" class="table table-bordered table-striped">
                <thead>
                 <tr>
                       <th>Date</th>
                    <th>Product</th>
                    <th>Direction</th>
					<th>Status</th>
                                        <th>Priority</th>
                    
                  </tr>
                </thead>
                <tbody>
              <% int m=0; for(m=1;m<=n1;m++) {
                       %>
                  <tr>
                    
                      <td ><a href="iredit.jsp?tid=<%=taskdata1[m][1] %>"><% out.print(taskdata1[m][2].substring(0, 10)); %></a></td>
                    
                    <td><% out.print(taskdata1[m][9]); %></td>
                    <td><% out.print(taskdata1[m][4]); %>
                          
                          
                     </td>
                     <td> <span class="label label-<%=Poul.statusIRColor(taskdata1[m][5])  %>"><% out.print(taskdata1[m][5]); %></span>
                      </td>
                   <td> 
                        
                           <span class="label label-<%=Poul.statusIRPriorityColor(taskdata1[m][6])  %>"><% out.print(taskdata1[m][6]); %></span>
                        
                   </td>
                  </tr>
                  <% } %>
                
                </tbody>
               
              </table>
              </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
           
          </div>
          <!-- /.box -->
        </div>
        <!-- ./col -->
		</div>
		 <% } %>
	
		
                <% 
                        if("direction".equals(tksrch)){
                            String directiontype=request.getParameter("directiontype");
                            
             String dbdate=null;
           int i=0,j=0,CH=0;
           String count1;  count1="1";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from interactionrecord where useradminid='"+usercid_adminid+"' AND usercid='"+usercid_id+"' and  direction='"+directiontype+"'; ");
       
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count1=rs.getString(1);  }
        rs.close();
      smt.close();
      con.close();} catch(Exception e){ 
          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n searchinteraction.jsp-----\n"
     + "LINE=337 select count(*) from interactionrecord where useradminid='"+usercid_adminid+"' AND usercid='"+usercid_id+"' and  direction='"+directiontype+"' ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      }
      
       int n1=Integer.parseInt(count1);
       String taskdata1[][]=new String[n1+1][55];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from interactionrecord where useradminid='"+usercid_adminid+"' AND usercid='"+usercid_id+"' and  direction='"+directiontype+"'; ");
       
        ResultSet rs1=smt.executeQuery();
     i=1;out.println(n1);
        while(rs1.next())
        {  
               CH++;
           for( j=1;j<=7;j++)
          {
            taskdata1[i][j]=rs1.getString(j); 
           
          } 
           ++i;  
        }out.println(taskdata1[2][1]);
    rs1.close();
      smt.close();
      con.close();    } catch(Exception e){ 
          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n searchinteraction.jsp-----\n"
     + "LINE=363 select * from interactionrecord where useradminid='"+usercid_adminid+"' AND usercid='"+usercid_id+"' and  direction='"+directiontype+"' ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      }
        
                    
      %> 
          
          
          
          
	 <div class="row invoice">
               
    <div class="col-md-12" >
     
        <div class="box box-info"> 
            
 <div class="box-header with-border">
     <h3 class="box-title"> Interaction Results for <%=directiontype %> Direction</h3>
          <form action="">        <button type="submit" class="btn btn-info pull-right"  > Search More Task</button></form>
            
      
            
               
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <table id="example2" class="table table-bordered table-striped">
                <thead>
                 <tr>
                       <th>Date</th>
                    <th>Product</th>
                    <th>Direction</th>
					<th>Status</th>
                                        <th>Priority</th>
                    
                  </tr>
                </thead>
                <tbody>
              <% int m=0; for(m=1;m<=n1;m++) {
                       %>
                  <tr>
                    
                      <td ><a href="iredit.jsp?tid=<%=taskdata1[m][1] %>"><% out.print(taskdata1[m][2].substring(0, 10)); %></a></td>
                    
                    <td><% out.print(taskdata1[m][9]); %></td>
                    <td><% out.print(taskdata1[m][4]); %>
                          
                          
                     </td>
                     <td> <span class="label label-<%=Poul.statusIRColor(taskdata1[m][5])  %>"><% out.print(taskdata1[m][5]); %></span>
                      </td>
                   <td> 
                        
                           <span class="label label-<%=Poul.statusIRPriorityColor(taskdata1[m][6])  %>"><% out.print(taskdata1[m][6]); %></span>
                        
                   </td>
                  </tr>
                  <% } %>
                
                </tbody>
               
              </table>
              </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
           
          </div>
          <!-- /.box -->
        </div>
        <!-- ./col -->
		</div>
		 <% } %>
	
             
             
                  	
             
             
             
             
             
             
             
    <!-- SELECT2 EXAMPLE -->
     <div class="row">
      
     
      
        <div class="col-md-4">
      <div class="box box-default ">
       <!-- /.box-header -->
        <div class="box-body">
              <div class="box-header with-border">
          <h3 class="box-title">Search By Status</h3>
        </div>
            <br>
              <form action="" method="POST">
            <div class="col-md-12">
             
              <!-- /.form-group -->
               <div class="form-group">
                <label>Status</label>
                
                  <select id="status" name="status" class="form-control">
                         <option value="Close"> Close</option>
                          <option value="Open">Open</option>
                          
                     </select>
              </div>
            
              <!-- /.form group --><br>
            <button type="submit" class="btn btn-info pull-left" onClick="return validateForm()" type="submit"> Search</button>
             <input type="hidden" name="tksrch" id="tasksearch" value="status">
           </div>
          </form>
               <!-- /.col -->
        </div>
        <!-- /.box-body -->
      </div>
      <!-- /.box -->
 </div>
      <!-- /.col -->
      
        <div class="col-md-4">
      <div class="box box-default ">
       <!-- /.box-header -->
        <div class="box-body">
              <div class="box-header with-border">
          <h3 class="box-title">Search By Priority</h3>
        </div>
            <br>
              <form action="" method="POST">
            <div class="col-md-12">
             	
               <div class="form-group">
                <label>Priority</label>
                
                   <select id="importance" name="priority" class="form-control">
                         <option value="Midium"> Midium</option>
                          <option value="High">High</option>
                          <option value="Low">Low</option>
                    
                          
                     </select>
              </div>
              
              <!-- /.form group --><br>
            <button type="submit" class="btn btn-info pull-left" onClick="return validateForm()" type="submit"> Search</button>
             <input type="hidden" name="tksrch" id="tasksearch" value="priority">
           </div>
          </form>
               <!-- /.col -->
        </div>
        <!-- /.box-body -->
      </div>
      <!-- /.box -->
 </div>
      <!-- /.col -->
    
      
      
      
      <div class="col-md-4">
      <div class="box box-default ">
       <!-- /.box-header -->
        <div class="box-body">
              <div class="box-header with-border">
          <h3 class="box-title">Search By Direction</h3>
        </div>
            <br>
              <form action="" method="POST">
            <div class="col-md-12">
             	
               <div class="form-group">
                <label>Direction</label>
                
                   <select id="importance" name="directiontype" class="form-control">
                         <option value="Outbound"> Outbound</option>
                          <option value="Inbound">Inbound</option>
                          <option value="Email">Email</option>
                          <option value="Chat"> Chat</option>
                     </select>
              </div>
                
              <!-- /.form group --><br>
            <button type="submit" class="btn btn-info pull-left" onClick="return validateForm()" type="submit"> Search</button>
             <input type="hidden" name="tksrch" id="tasksearch" value="direction">
           </div>
          </form>
               <!-- /.col -->
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
<jsp:include page="dist/include/footer.jsp" />
<%    Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Leaving searchinteraction.jsp------");
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
       $('#datepicker2').datepicker({
      autoclose: true
    }) 
    $('#datepicker3').datepicker({
      autoclose: true
    }) 
        })
   
  
</script>

  <script>
      function validateForm(){
          
           if(document.getElementById("subject").value==""){
   
            document.getElementById("alert-message").innerHTML = "Subject cannot be empty";
    $('#show-alert').modal('show')
       document.getElementById("subject").focus();
           return false;
        }else if(document.getElementById("subject").value!=""){
           
           if(!document.getElementById("subject").value.match(/^[0-9 a-z.A-Z]+$/)){
              document.getElementById("alert-message").innerHTML = "Subject: only alphanumeric allowed";
    $('#show-alert').modal('show')
           
           document.getElementById("subject").focus();
     return false;
            } 
        } 
        
        if(document.getElementById("assigned").value!=""){
           
           if(!document.getElementById("assigned").value.match(/^[0-9 a-z.A-Z]+$/)){
                     document.getElementById("alert-message").innerHTML = "Assigned To: Only alphanumeric allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("assigned").focus();
     return false;
            } else
        if(document.getElementById("assigned").value.length>30){
                         document.getElementById("alert-message").innerHTML = "Assigned To: Only 30 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("assigned").focus();
           
           return false;
       }}
        
         return true;
  }
  
</script>
 

</body>
</html>
