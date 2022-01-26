<%@page import="blezz.Nd"%>
<%@page import="java.sql.Statement"%>
<%@page import="menu.Expense"%>
<%@page import="java.util.ArrayList"%>
<%@page import="blezz.Db"%>
<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<%@page import="blezz.Poul"%>
<html>
<head>
  <meta charset="utf-8"><link rel="shortcut icon" href="dist/img/u.png" type="image/x-icon" /> 
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Create Expense | INDSAC CRM</title>
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
          String currency=(String)session1.getAttribute("usercid_currency");
          
         
          
      
          String vid=Poul.escapeHtml(request.getParameter("vid"));	
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"  --Entering newexpense.jsp----------New Expense---");
   	
if (session != null) {
			if (session1.getAttribute("usercid_id") == null) {
				response.sendRedirect("signout.jsp");
			} 
		}

    String pagetype=request.getParameter("pagetype");
       if("newexpense".equals(pagetype)){
        String billnumber=Poul.escapeHtml(request.getParameter("billnumber"));    
        String subject=Poul.escapeHtml(request.getParameter("subject"));
        String datepicker=Poul.escapeHtml(request.getParameter("expensedate"));
        String category=Poul.escapeHtml(request.getParameter("category"));
        System.out.println("Category:="+category);
        String expenseamount=Poul.escapeHtml(request.getParameter("expenseamount"));
        String status=Poul.escapeHtml(request.getParameter("status"));
        String reportto=Poul.escapeHtml(request.getParameter("reportto"));
       String approvalstatus="";
        if(usercid_id.equals(reportto)){approvalstatus="Approved";}else{approvalstatus="Pending";}
        String notes=Poul.escapeHtml(request.getParameter("notes"));
        if(notes.length()>0){notes="**"+Db.getEmployeeName(usercid_id)+"*****"+java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"******\n"+notes+"\n";}
  
       
       datepicker=Character.toString(datepicker.charAt(6))+Character.toString(datepicker.charAt(7))+Character.toString(datepicker.charAt(8))+Character.toString(datepicker.charAt(9))+"-"+Character.toString(datepicker.charAt(0))+Character.toString(datepicker.charAt(1))+"-"+Character.toString(datepicker.charAt(3))+Character.toString(datepicker.charAt(4))+" "+"23:59:59";
    
        String SR="null";
         int tid=0;
        String msg="null";
        java.util.Date date=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());
       
        try{
   Connection c=Poul.getConnectionCRM();
Statement st=c.createStatement();
           ResultSet rs3;
               rs3 = st.executeQuery("select Max(id)  FROM expense  ");
    while(rs3.next())
        
          {SR=rs3.getString(1);
          
          }
           int i = Integer.parseInt( SR ); 
           ++i; tid=i;
             st.addBatch("insert into expense values('"+i+"','"+sqlTime+"','"+billnumber+"','"+subject+"','"+datepicker+"','"+category+"','"+status+"','"+expenseamount+"','"+usercid_adminid+"','"+usercid_id+"','','"+notes+"','"+reportto+"','','"+approvalstatus+"','','','','','','','','','','','','','','','','','','')");
      
         rs3 = st.executeQuery("select Max(id)   FROM expenselog  ");
    while(rs3.next())
        
          {SR=rs3.getString(1);
          
          }
            i = Integer.parseInt( SR ); 
           ++i; out.print("value of i="+i+"  ");
              st.addBatch("insert into expenselog values('"+i+"','"+sqlTime+"','"+billnumber+"','"+subject+"','"+datepicker+"','"+category+"','"+status+"','"+expenseamount+"','"+usercid_adminid+"','"+usercid_id+"','"+tid+"','','"+reportto+"','New Expense Created','"+approvalstatus+"','','','','','','','','','','','','','','','','','','')");
      
       st.executeBatch(); 
        
       
             msg="success";    
       
      rs3.close();
      st.close();
      c.close();   }
        catch(Exception e)
        {
                 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n newexpense.jsp-----\n"
     + "LINE=115\n insert into expense id="+tid+"  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
        }
        finally{
        
           // session.setAttribute("submitmsg",msg);
           // response.sendRedirect("newleads.jsp");
            if(msg.equals("success")){ String Re="" ;
          Re="expenseedit.jsp?2a2e2a746964="+Nd.Encrypt(String.valueOf(tid));
             response.sendRedirect(Re);         
            }else{
               response.sendRedirect("error.jsp");
            }
        }
       }
       
%>

<div class="wrapper">
 <jsp:include page="dist/include/leftmenu.jsp" />  
 
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
      <%String msg=(String)session.getAttribute("submitmsg");if(msg!=null && msg.equals("success")){ %>
      <div class="alert alert-success alert-dismissable">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">?</a>
    <strong>Success!</strong> Lead detail submitted successfully.
  </div>
    <%}else if(msg!=null && msg.equals("fail")){%>
    <div class="alert alert-danger alert-dismissable">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">?</a>
    <strong>Failed!</strong> Something wrong please try again...
  </div>
    <%}
    session.removeAttribute("submitmsg"); 
    %>
    <!-- Content Header (Page header) -->
 
    <form class="form-horizontal" action="" method="post">
	 <section class="content">
    
	 <div class="row invoice">
        <div class="col-xs-12">
		 <!-- Default box -->
      <div class="box box-warning box-solid">
        <div class="box-header with-border">
          <h3 class="box-title">Create Expense</h3>
  </div>
         <div class="col-md-6">
	 <div class="box ">
         <!-- form start -->
        
              <div class="box-body">
                   <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">Bill Number</label>
   <div class="col-sm-10">
                    <input type="text" class="form-control" id="billnumber" name="billnumber" placeholder="Bill Number" autocomplete="off">
                  </div>
                </div>
                   <div class="form-group" >
                  <label for="inputEmail3" class="col-sm-2 control-label">Subject<span style="color:red">*</span></label>
   <div class="col-sm-10" >
                    <input type="text" class="form-control" id="subject" name="subject" placeholder="Subject" autocomplete="off">
                </div>
                </div>
                  <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">Expense Date: <span style="color:red">*</span></label>
                
<div class="col-sm-10">
                <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                    <input type="text" class="form-control pull-right" name="expensedate" id="datepicker1" autocomplete="off">
                </div>
</div>
                <!-- /.input group -->
              </div>	
             <div class="form-group" id="shownewcategoryInput1">
                  <label for="inputPassword3" class="col-sm-2 control-label"> Category<span style="color:red">*</span></label>

                  <div class="col-sm-10">
                      <select id="product" name="category" class="form-control" required>
                          <option value=""> Select </option>
                         <option value="Automobile Expense">Automobile Expense</option>
                          <option value="Office Supplies">Office Supplies</option>
                          <option value="Telephone Expense"> Telephone Expense</option>
                           <option value="Employee Expense"> Employee Expense</option>
                        <% 

                             ArrayList<String> categ=new ArrayList<String>();  
                             categ=Expense.getAllDistinctCategory(usercid_adminid);
                          %> 
                                  
                      <%   for(String list:categ) { %>
                          <option value="<%=list  %>"> <%=list  %></option>
                           
                           <%  } %>
                     </select>
                  </div>
                   <div class="col-sm-1">
				</div>
                         <div class="col-sm-2">
            </div>
              </div>
                     <div class="form-group" >
                
                  <div class="col-sm-6">
                      <button class="btn btn-sm btn-info btn-flat pull-left" id="showcategoryInput"  type="button">New Category +</button>
             </div>
                </div>
                 <div class="form-group" id="shownewcategoryInput2" hidden>
                  <label for="inputEmail3" class="col-sm-2 control-label">New Category<span style="color:red">*</span></label>

                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="newcategory" name="category" placeholder="New Category" autocomplete="off">
                  </div>
                </div>
      </div>
              <!-- /.box-body -->
              </div>
          <!-- /.box -->
      </div>
        <!--/.col (left) -->
        <!-- right column -->
        <div class="col-md-6">
          <!-- Horizontal Form -->
           <!-- general form elements -->
          <div class="box ">
          <!-- /.box-header -->
            <!-- form start -->
            <div class="box-body">
                  	   
		           	  <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Amount<span style="color:red">*</span></label>
<<<<<<< HEAD
<div class="col-sm-10">
                <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-fw fa-<%=currency%>"></i>
=======

                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="expenseamount" name="expenseamount" placeholder="Amount" autocomplete="off"  >
>>>>>>> devmaster
                  </div>
                    <input type="text" class="form-control pull-right"  id="expenseamount" name="expenseamount" placeholder="Amount" required="" autocomplete="off">
                </div>
</div>
                  
                </div>
                        <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label"> Status<span style="color:red">*</span></label>
  <div class="col-sm-10">
                      <select id="status" name="status" class="form-control">
                          <option value="Unsettled">Unsettled</option>
                          <option value="Settled"> Settled</option>
                   </select>
                  </div>
                </div>
                       <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Report To</label>
 <% int count=Db.getAllEmployeeCount(usercid_adminid) ;

                            String data[][]=new String [count][5] ;  
                             data=Db.getAllEmployeeName(usercid_adminid, count);
                          %> 
                  <div class="col-sm-10">
                 <select id="reportto" name="reportto" class="form-control">
                     <option value="<%=usercid_id  %>"> <%=Db.getEmployeeName(usercid_id, usercid_adminid)  %></option>
                          
                     <%  for(int i=1;i<=count;i++) { %>
                          <option value="<%=data[i][1]  %>"> <%=data[i][2]  %></option>
                           
                           <%  } %>
                    </select>
                  </div>
                  </div>
         </div>
              <!-- /.box-body -->
                    </div>
          <!-- /.box -->
  </div>
        <!--/.col (right) -->
 </div>
      <!-- /.box -->
</div>
		</div>
		 <div class="row invoice">
        <div class="col-xs-12">
		 <!-- Default box -->
      <div class="box box-solid">
        <div class="box-header with-border">
          <h3 class="box-title">Notes</h3>
    </div>
        <!--/.col (left) -->
        <!-- right column -->
        <div class="col-md-6">
          <!-- Horizontal Form -->
           <!-- general form elements -->
          <div class="box ">
         <!-- /.box-header -->
            <!-- form start -->
                       <div class="box-body">
			    <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Notes</label>
   <div class="col-sm-10">
                    <textarea class="form-control" rows="3" id="notes" name="notes" placeholder=" Notes" autocomplete="off" ></textarea>
                  </div>
                </div>
	    </div>
              <!-- /.box-body -->
	   <!-- /.box-footer -->
        </div>
          <!-- /.box -->
  </div>
        <!--/.col (right) -->
      </div>
      <!-- /.box -->
      <input type="hidden" name="pagetype" value="newexpense">
		 <div class="box-footer clearfix">
                         <button type="button" class="btn btn-default pull-left" onclick="goBack()"> Cancel</button>
                         <button class="btn btn-sm btn-info btn-flat pull-right" onclick="return validateForm()" type="submit">Save</button>
            </div>
	</div>
          	</div>	
    </section>
  </form>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
<jsp:include page="dist/include/footer.jsp" />
<% Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Leaving newexpense.jsp----------New Expense---");
  
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
<script src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- FastClick -->
<script src="bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- page script -->
<script>
 
    
     $("#showcategoryInput").click(function() {
  $("#shownewcategoryInput1").hide();
   $("#showcategoryInput").hide();
  $("#shownewcategoryInput2").show();
  
});
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
   function validateForm(){ 
       
              if(document.getElementById("subject").value==""){
   
            document.getElementById("alert-message").innerHTML = "Subject: Cannot be empty";
          $('#show-alert').modal('show')
         document.getElementById("subject").focus();
           return false;
        }else 
            if(document.getElementById("subject").value!=""){
            if(document.getElementById("subject").value.length>45){
            document.getElementById("alert-message").innerHTML = "Subject: Only 45 Characters allowed";
    $('#show-alert').modal('show')
           document.getElementById("subject").focus();
           
           return false;
       }else           
           if(!document.getElementById("subject").value.match(/^[0-9 a-z.A-Z]+$/)){
              document.getElementById("alert-message").innerHTML = "Subject: Only alphanumeric allowed";
    $('#show-alert').modal('show')
           
           document.getElementById("subject").focus();
     return false;
            } 
        } 
    
           if(document.getElementById("datepicker1").value==""){
   
            document.getElementById("alert-message").innerHTML = "Expense Date: Cannot be empty";
    $('#show-alert').modal('show')
       document.getElementById("datepicker1").focus();
           return false;
        }else if(document.getElementById("datepicker1").value!=""){
            if(document.getElementById("datepicker1").value.length>45){
                         document.getElementById("alert-message").innerHTML = "Expense Date: Only 45 Characters allowed";
    $('#show-alert').modal('show')
    
           document.getElementById("datepicker1").focus();
           
           return false;
       }else           
           if(!document.getElementById("datepicker1").value.match(/^[0-9 /]+$/)){
              document.getElementById("alert-message").innerHTML = "Expense Date: Only digit allowed";
    $('#show-alert').modal('show')
           
           document.getElementById("datepicker1").focus();
     return false;
            } 
        } 
        
          if(document.getElementById("newcategory").value==""){
   
            document.getElementById("alert-message").innerHTML = "New Category Cannot be empty";
          $('#show-alert').modal('show')
         document.getElementById("newcategory").focus();
           return false;
        }else 
            if(document.getElementById("newcategory").value!=""){
            if(document.getElementById("newcategory").value.length>45){
            document.getElementById("alert-message").innerHTML = "New Category Only 45 Characters allowed";
    $('#show-alert').modal('show')
           document.getElementById("newcategory").focus();
           
           return false;
       }else           
           if(!document.getElementById("newcategory").value.match(/^[0-9 a-z.A-Z]+$/)){
              document.getElementById("alert-message").innerHTML = "New Category Only alphanumeric allowed";
    $('#show-alert').modal('show')
           
           document.getElementById("newcategory").focus();
     return false;
            } 
        } 
    
           if(document.getElementById("status").value==""){
   
            document.getElementById("alert-message").innerHTML = "Satus: Cannot be empty";
    $('#show-alert').modal('show')
       document.getElementById("status").focus();
           return false;
        }else if(document.getElementById("status").value!=""){
               if(document.getElementById("status").value.length>45){
                document.getElementById("alert-message").innerHTML = "Status: Only 45 Characters allowed";
    $('#show-alert').modal('show')
         
           // alert("Only 30 Characters allowed ");
           document.getElementById("status").focus();
           
           return false;
       }else
           if(!document.getElementById("status").value.match(/^[0-9 a-z.A-Z]+$/)){
              document.getElementById("alert-message").innerHTML = "Status: Only alphanumeric allowed";
    $('#show-alert').modal('show')
           
           document.getElementById("status").focus();
     return false;
            } 
        } 
       
           if(document.getElementById("billnumber").value!=""){
           if(!document.getElementById("billnumber").value.match(/^[0-9 a-z.A-Z]+$/)){
                     document.getElementById("alert-message").innerHTML = "Bill Number: Only alphanumeric allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("billnumber").focus();
     return false;
            } else
        if(document.getElementById("billnumber").value.length>45){
                         document.getElementById("alert-message").innerHTML = "Bill Number: Only 45 characters allowed";
    $('#show-alert').modal('show')
        
           document.getElementById("billnumber").focus();
           
           return false;
       }}
       
       if(document.getElementById("reportto").value!=""){
           
           if(!document.getElementById("reportto").value.match(/^[0-9 a-z.A-Z]+$/)){
                     document.getElementById("alert-message").innerHTML = "Report To: Only alphanumeric allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("reportto").focus();
     return false;
            } else
        if(document.getElementById("reportto").value.length>45){
                         document.getElementById("alert-message").innerHTML = "Report To: Only 45 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("reportto").focus();
           
           return false;
       }}
       
       
        if(document.getElementById("notes").value!=""){
           
           if(!document.getElementById("notes").value.match(/^[0-9 a-z.A-Z]+$/)){
                     document.getElementById("alert-message").innerHTML = "Notes: Only alphanumeric allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("notes").focus();
     return false;
            } else
        if(document.getElementById("notes").value.length>10000){
                         document.getElementById("alert-message").innerHTML = "Notes: Only 10000 Characters allowed";
    $('#show-alert').modal('show')
     
           document.getElementById("notes").focus();
           
           return false;
       }}
     
              return true;
    }
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