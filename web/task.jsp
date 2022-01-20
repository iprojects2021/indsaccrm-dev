<%@page import="blezz.Nd"%>
<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
<%@page import="blezz.Db"%>
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
 Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" -----------Entering task.jsp-------------");
%>

   <%
          String show="null",show1="null",show0="null";
        String requestcid=(String)session.getAttribute("2a2e2a72657175657374636964");
           if(requestcid!=null){requestcid=Nd.Decrypt(requestcid);}
        String cid=Poul.escapeHtml(request.getParameter("2a2e2a636964"));
        
        if(cid!=null){cid=Nd.Decrypt(cid);}
         String type=Poul.escapeHtml(request.getParameter("2a2e2a74797065"));
         if(type!=null){type=Nd.Decrypt(type);}
      Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+",cid="+cid+" --Entering task.jsp---------- New Task ---");
      
        if(cid!=null||cid!="null"||cid!=""){
       try{
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from contact where id=?");
        smt.setString(1,cid);
        ResultSet rs=smt.executeQuery();
        while(rs.next()){
            int i=5,j=6;
               show=(rs.getString(i)); show1=(rs.getString(j)); 
            
        }
     rs.close();
      smt.close();
      con.close();   }
        catch(Exception e){
           String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n task.jsp-----\n"
     + "LINE=90 \n select * from contact where id="+cid+"  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
                }
        }
       //System.out.println(al.size());
       
        
         String pagetype=request.getParameter("pagetype");
       if("tasksubmit".equals(pagetype)){
            
        String subject=Poul.escapeHtml(request.getParameter("subject"));
        String datepicker=Poul.escapeHtml(request.getParameter("datepicker"));
        String importance=Poul.escapeHtml(request.getParameter("importance"));
        String status=Poul.escapeHtml(request.getParameter("status"));
        String assigned=Poul.escapeHtml(request.getParameter("assigned"));
       
        String notes=Poul.escapeHtml(request.getParameter("notes"));
        if(notes.length()>0){notes="**"+Db.getEmployeeName(usercid_id)+"*****"+java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"******\n"+notes+"\n";}
  
        String assignedto=Poul.escapeHtml(request.getParameter("assignedto"));
       datepicker=Character.toString(datepicker.charAt(6))+Character.toString(datepicker.charAt(7))+Character.toString(datepicker.charAt(8))+Character.toString(datepicker.charAt(9))+"-"+Character.toString(datepicker.charAt(0))+Character.toString(datepicker.charAt(1))+"-"+Character.toString(datepicker.charAt(3))+Character.toString(datepicker.charAt(4))+" "+"23:59:59";
    
        String SR="null";
         int tid=0;
        String msg="null";
        java.util.Date date=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());
        String owner=(String)session.getAttribute("owner"); 
        String id=(String)session.getAttribute("id"); 
          String ownr=(String)session.getAttribute("ownr"); 
          int i='0';
        try{
   Connection c=Poul.getConnectionCRM();
out.print("entered page");
Statement st=c.createStatement();
           ResultSet rs3;
               rs3 = st.executeQuery("select  *  FROM task  ");
    while(rs3.next())
        
          {SR=rs3.getString(1);
          
          }
            i = Integer.parseInt( SR ); 
           ++i; tid=i;
             st.addBatch("insert into task values('"+i+"','"+sqlTime+"','0','"+subject+"','"+datepicker+"','"+importance+"','"+status+"','','"+usercid_adminid+"','"+usercid_id+"','"+cid+"','"+notes+"','"+assignedto+"','','','','','','','','','','','','','','','','','','','','')");
      
         rs3 = st.executeQuery("select  *  FROM tasklog  ");
    while(rs3.next())
        
          {SR=rs3.getString(1);
          
          }
            i = Integer.parseInt( SR ); 
           ++i; out.print("value of i="+i+"  ");
             st.addBatch("insert into tasklog values('"+i+"','"+sqlTime+"','"+tid+"','"+subject+"','"+datepicker+"','"+importance+"','"+status+"','','"+usercid_adminid+"','"+usercid_id+"','"+cid+"','"+notes+"','"+assignedto+"','Creating Task','','','','','','','','','','','','','','','','','','','')");
          
       st.executeBatch(); 
        
       
             msg="success";    
       session.setAttribute("requestcid", cid);
      rs3.close();
      st.close();
      c.close();   }
        catch(Exception e)
        {
                 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n task.jsp-----\n"
     + "LINE=160 \n insert into tasklog values where useradminid="+usercid_adminid+" AND  id="+i+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
        }
        finally{
        
           // session.setAttribute("submitmsg",msg);
           // response.sendRedirect("newleads.jsp");
            if(msg.equals("success")){ String Re="" ;
          Re="taskedit.jsp?2a2e2a746964="+Nd.Encrypt(String.valueOf(tid));
             response.sendRedirect(Re);         
            }else{
                Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   ------- Entring task.jsp---------Redirecting To--------------error.jsp----------------");
               response.sendRedirect("error.jsp");
            }
        }
       }
       
            
       
       
      %>
<div class="wrapper">

  <jsp:include page="dist/include/leftmenu.jsp" />  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
 
	
	 <section class="content-header">
    


	
		
	
	
	 <div class="row invoice">
        <div class="col-xs-12">
		 <!-- Default box -->
      <div class="box box-warning box-socid">
        <div class="box-header with-border">
          <h3 class="box-title">Create Task</h3>

         
        </div>
       
	    <div class="col-md-6">
		
		 <div class="box ">
            
           
            <!-- form start -->
            <form class="form-horizontal" action="" method="post">
              <div class="box-body">
                  <% if(cid!=null){  %>
                    <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">  Name</label>
                
                  <div class="col-sm-10">
                      <%  String data[]=new String [5];
                      data=Db.getCustomerName(cid, usercid_adminid); if(("customer").equals(data[4])){data[4]="contact";}
                      %>
                      <a href="<%=data[4] %>details.jsp?esfhrttrfhardersg=<%=cid %>&type=<%=data[4] %>"><button type="button" class="col-sm-10 btn btn-warning pull-left"> <% if("".equals(data[2])||"null".equals(data[2])){ out.print(data[3]);} else {out.print(data[2]);} %> </button></a>
          
             </div>
                </div>  <% }  %>
			    <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label"> Subject <span style="color:red">*</span></label>

                  <div class="col-sm-10">
                      <input type="text" class="form-control" id="subject"  name="subject" placeholder="Subject" autocomplete="off">
                  </div>
                </div>
				
				<div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">Due Date: <span style="color:red">*</span></label>
<div class="col-sm-10">
                <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                    <input type="text" class="form-control pull-right" name="datepicker" id="datepicker1"  autocomplete="off">
                </div>
</div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->
               
				 <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Priority</label>

                  <div class="col-sm-10">
                 <select id="importance" name="importance" class="form-control">
                          <option value="Normal"> Normal</option>
                          <option value="Very High">Very High</option>
                          <option value="High">High</option>
                          <option value="Critical Situation"> Critical Situation</option>
                          <option value="Normal">Normal</option>
                          <option value="Midium">Midium</option>
                          <option value="Low">Low</option>
                          
                     </select>
                  </div>
                </div>
				     <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Status</label>

                  <div class="col-sm-10">
                 <select id="status" name="status" class="form-control">
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
		
		 <div class="box ">
             <div class="box-body">
			     <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Assigned To</label>
 <% int count=Db.getAllEmployeeCount(usercid_adminid) ;

                            String data[][]=new String [count][5] ;  
                             data=Db.getAllEmployeeName(usercid_adminid, count);
                          %> 
                  <div class="col-sm-10">
                 <select id="status" name="assignedto" class="form-control">
                     <option value="<%=usercid_id  %>"> <%=Db.getEmployeeName(usercid_id, usercid_adminid)  %></option>
                          
                     <%  for(int i=1;i<=count;i++) { %>
                          <option value="<%=data[i][1]  %>"> <%=data[i][2]  %></option>
                           
                           <%  } %>
                          
                     </select>
                  </div>
                  </div>
                 <br><br>
                            
			<div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label" >Notes</label>

                  <div class="col-sm-10" >
                 <textarea class="form-control" rows="5" id="notes" name="notes" placeholder=" Notes " autocomplete="off"></textarea>
                  </div>
                </div>
                 <%  if(cid!=null){ %>
                 <input type="hidden" name="2a2e2a72657175657374636964" value="<%=Nd.Encrypt(cid) %>">
                 <% } %>
   <input type="hidden" name="pagetype" value="tasksubmit">                 
	
              </div>
              <!-- /.box-body -->
                 <div class="box-footer clearfix no-border">
		  <button type="button" class="btn btn-default pull-left" onclick="goBack()"> Cancel</button>
              <button type="submit" class="btn btn-info pull-right" onClick="return validateForm()" type="submit"> Save</button>
            </div>
           
            </form>
       
          </div>
          <!-- /.box -->
        

        </div>
        <!--/.col (left) -->
    
 </div>
      <!-- /.box -->
</div>
		</div>

		
    </section>
    <!-- /.content -->
  </div>
<jsp:include page="dist/include/footer.jsp" />
<%   Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+",cid="+cid+" --Leaving task.jsp---------- New Task ---");
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

  <script>
      function validateForm(){
          
           if(document.getElementById("subject").value==""){
   
            document.getElementById("alert-message").innerHTML = "Subject: Cannot be empty";
    $('#show-alert').modal('show')
       document.getElementById("subject").focus();
           return false;
        }else if(document.getElementById("subject").value!=""){
           
           if(!document.getElementById("subject").value.match(/^[0-9 a-z.A-Z]+$/)){
              document.getElementById("alert-message").innerHTML = "Subject: Only alphanumeric allowed";
    $('#show-alert').modal('show')
           
           document.getElementById("subject").focus();
     return false;
            } else
        if(document.getElementById("subject").value.length>150){
                document.getElementById("alert-message").innerHTML = "Subject: Only 150 Characters allowed";
    $('#show-alert').modal('show')
         
           // alert("Only 30 Characters allowed ");
           document.getElementById("subject").focus();
           
           return false;
       }
        } 
           if(document.getElementById("datepicker1").value==""){
   
            document.getElementById("alert-message").innerHTML = "Due Date: Cannot be empty";
    $('#show-alert').modal('show')
       document.getElementById("datepicker1").focus();
           return false;
        }else if(document.getElementById("datepicker1").value!=""){
            if(document.getElementById("datepicker1").value.length>45){
                         document.getElementById("alert-message").innerHTML = "Due Date: Only 45 Characters allowed";
    $('#show-alert').modal('show')
    
           document.getElementById("datepicker1").focus();
           
           return false;
       }else           
           if(!document.getElementById("datepicker1").value.match(/^[0-9 /]+$/)){
              document.getElementById("alert-message").innerHTML = "Due Date: Only digit allowed";
    $('#show-alert').modal('show')
           
           document.getElementById("datepicker1").focus();
     return false;
            } 
        } 
          if(document.getElementById("importance").value!=""){
           
           if(!document.getElementById("importance").value.match(/^[0-9 a-z.A-Z]+$/)){
                     document.getElementById("alert-message").innerHTML = "Priority: Only alphanumeric allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("importance").focus();
     return false;
            } else
        if(document.getElementById("importance").value.length>45){
                         document.getElementById("alert-message").innerHTML = "Priority: Only 45 Characters allowed";
    $('#show-alert').modal('show')
         
           document.getElementById("importance").focus();
           
           return false;
       }
      }
      
      if(document.getElementById("status").value!=""){
           
           if(!document.getElementById("status").value.match(/^[0-9 a-z.A-Z]+$/)){
                     document.getElementById("alert-message").innerHTML = "Status: Only alphanumeric allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("status").focus();
     return false;
            } else
        if(document.getElementById("status").value.length>45){
                         document.getElementById("alert-message").innerHTML = "Status: Only 45 Characters allowed";
    $('#show-alert').modal('show')
         
           document.getElementById("status").focus();
           
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
        if(document.getElementById("assigned").value.length>45){
                         document.getElementById("alert-message").innerHTML = "Assigned To: Only 45 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("assigned").focus();
           
           return false;
       }}
        if(document.getElementById("notes").value!=""){
           
           if(!document.getElementById("notes").value.match(/^[a-zA-Z:,'-'' '\.0-9\n]+$/)){
                     document.getElementById("alert-message").innerHTML = "Notes: Only alphanumeric allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("notes").focus();
     return false;
            } else
        if(document.getElementById("notes").value.length>2000){
                         document.getElementById("alert-message").innerHTML = "Notes: Only 2000 Characters allowed";
    $('#show-alert').modal('show')       
           document.getElementById("notes").focus();
           return false;
       }}
        
         return true;
  }
  
</script>
  

</body>
</html>
