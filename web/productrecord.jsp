<%@page import="blezz.Nd"%>
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
  <title>Product Record | INDSAC CRM</title>
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
     	
	
if (session != null) {
			if (session1.getAttribute("usercid_id") == null) {
				response.sendRedirect("signout.jsp");
			} 
		}
String sid=request.getParameter("2a2e2a706964");
if(sid!=null){sid=Nd.Decrypt(sid);}
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" ,product="+sid+" --Entering productrecord.jsp----------Product Record---");
  

%>
   <%    String vid=Poul.escapeHtml(request.getParameter("vid"));
           int i=0,j=0; 
           String count2="0";
      
       String taskdata2[]=new String[34];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from stocklog  where useradminid=? and id=?");
         smt.setString(1,usercid_adminid );
       smt.setString(2,sid );
        ResultSet rs=smt.executeQuery();
     i=1;
        while(rs.next())
        { 
           for( j=1;j<=33;j++)
          {
            taskdata2[j]=rs.getString(j); 
           
          }
           ++i;  
        }
         rs.close();
      smt.close();
      con.close();
       } catch(Exception e){
            String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n addstock.jsp-----\n"
     + "LINE=97 \n select * from stocklog where useradminid="+usercid_adminid+"and id=? "+sid+"";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg); 
      
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
 
    <form class="form-horizontal" action="newstocksubmit.jsp" method="post">
	 <section class="content">
    
	 <div class="row invoice">
        <div class="col-xs-12">
		 <!-- Default box -->
      <div class="box box-warning box-solid">
        <div class="box-header with-border">
          <h3 class="box-title"> Product Details</h3>

         
        </div>
       
	    <div class="col-md-6">
		
        
		 <div class="box ">
       
            <!-- form start -->
          <input type="hidden" id="vid" name="vid" value="<%=vid %>">
                 
              <div class="box-body">
                   <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">Bill Number</label>

                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="billnumber" value="<%=taskdata2[13]%>" autocomplete="off">
                  </div>
                </div>
                   <div class="form-group" id="shownewproductInput4">
                  <label for="inputEmail3" class="col-sm-2 control-label">Product Name</label>

                  <div class="col-sm-10" >
                 <input type="text" class="form-control" id="billnumber" value="<%=taskdata2[5]%>" autocomplete="off">
                  
                  </div>
                         
                  
                </div>
            <div class="form-group" id="shownewcategoryInput1">
                  <label for="inputPassword3" class="col-sm-2 control-label">Product Code</label>

                  <div class="col-sm-10">
                      <input type="text" class="form-control" id="billnumber" value="<%=taskdata2[6]%>" autocomplete="off">
                 
                     
                  </div>
               
                  
                </div>
                 <div class="form-group" id="shownewcategoryInput2" hidden>
                  <label for="inputEmail3" class="col-sm-2 control-label">Category</label>

                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="newcategory" name="newcategory" value="<%=taskdata2[7]%>" autocomplete="off">
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
                  <label for="inputPassword3" class="col-sm-2 control-label">Product Status<span style="color:red">*</span></label>

                  <div class="col-sm-10">
                        <input type="text" class="form-control" id="newcategory" name="newcategory" value="<%=taskdata2[8]%>" autocomplete="off">
                  
                  </div>
                </div>
			  <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Buying Price</label>

                  <div class="col-sm-10">
                       <div class="input-group date">
                        <div class="input-group-addon">
                    <i class="fa fa-<%=currency%>"></i>
                  </div>
                    <input type="text" class="form-control" id="website" name="buyingprice" value="<%=taskdata2[9]%>" autocomplete="off">
                  </div>    </div>
                </div>
			<div class="form-group" id="shownewproductInput3" hidden>
                 <label for="inputPassword3" class="col-sm-2 control-label">Selling Price</label>

                  <div class="col-sm-10">
                        <div class="input-group date">
                        <div class="input-group-addon">
                    <i class="fa fa-<%=currency%>"></i>
                  </div>
                     <input type="text" class="form-control"  name="sellingprice" value="<%=taskdata2[10]%>" autocomplete="off">
                  </div> </div>
                </div>   
		 <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Quantity Ordered</label>

                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="quantity" name="quantity" value="<%=taskdata2[11]%>" autocomplete="off">
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
                    <textarea class="form-control" rows="7" id="notes" name="notes" value="" autocomplete="off" ><%=taskdata2[12]%></textarea>
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
		 <div class="box-footer clearfix">
                         <button type="button" class="btn btn-info pull-right" onclick="goBack()"> Back</button>
            </div>
		
		</div>
                    
		</div>	
	
		
	
         
    </section>
  </form>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
<jsp:include page="dist/include/footer.jsp" />
<% Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" ,product="+sid+" --Leaving productrecord.jsp----------Product Record---");
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
<!-- FastClick -->
<script src="bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- page script -->
<script>
    $("#showInput").click(function() {
  $("#shownewproductInput1").show();
  $("#shownewproductInput2").show();
  $("#shownewproductInput3").show();
  $("#shownewproductInput4").hide();
});
    
     $("#showcategoryInput").click(function() {
  $("#shownewcategoryInput1").hide();
  $("#shownewcategoryInput2").show();
  
});
  $(function () {
    $('#example4').DataTable()
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
     if(document.getElementById("productname").value==""){
      if(document.getElementById("newproductname").value==""){
       document.getElementById("alert-message").innerHTML = " Please Enter Product Name ";
    $('#show-alert').modal('show')
          document.getElementById("productname").focus();
     return false;
     }
     }
    
          if(document.getElementById("productname").value!=""){
           
           if(!document.getElementById("productname").value.match(/^[0-9 a-z.A-Z]+$/)){
                          document.getElementById("alert-message").innerHTML = " Product Name :Only alphabets allowed ";
    $('#show-alert').modal('show')
     
          
           document.getElementById("productname").focus();
     return false;
            } 
        if(document.getElementById("productname").value.length>30){
         document.getElementById("alert-message").innerHTML = " Product Name :Only 30 characters allowed ";
    $('#show-alert').modal('show')
               
           document.getElementById("productname").focus();
           
           return false;
       } 
   } 
       
         if(document.getElementById("newproductname").value!=""){
           
           if(!document.getElementById("newproductname").value.match(/^[0-9 a-z.A-Z]+$/)){
                          document.getElementById("alert-message").innerHTML = " New Product Name :Only alphabets allowed ";
    $('#show-alert').modal('show')
     
          
           document.getElementById("newproductname").focus();
     return false;
            } 
        if(document.getElementById("newproductname").value.length>30){
         document.getElementById("alert-message").innerHTML = " New Product Name :Only 30 digits allowed ";
    $('#show-alert').modal('show')
               
           document.getElementById("newproductname").focus();
           
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
        if(document.getElementById("billnumber").value.length>30){
                         document.getElementById("alert-message").innerHTML = "Bill Number: Only 30 characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("billnumber").focus();
           
           return false;
       }}
       
       if(document.getElementById("website").value!=""){
           
           if(!document.getElementById("website").value.match(/^[.0-9]+$/)){
                     document.getElementById("alert-message").innerHTML = "Buying Price: Only numbers allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("website").focus();
     return false;
            } else
        if(document.getElementById("website").value.length>30){
                         document.getElementById("alert-message").innerHTML = "Buying Price: Only 30 digits allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("website").focus();
           
           return false;
       }}
       
       if(document.getElementById("quantity").value!=""){
           
           if(!document.getElementById("quantity").value.match(/^[0-9]+$/)){
                     document.getElementById("alert-message").innerHTML = "Quantity Ordered: Only numbers allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("quantity").focus();
     return false;
            } else
        if(document.getElementById("quantity").value.length>30){
                         document.getElementById("alert-message").innerHTML = "Quantity Ordered: Only 30 digits allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("quantity").focus();
           
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
        if(document.getElementById("notes").value.length>2000){
                         document.getElementById("alert-message").innerHTML = "Notes: Only 2000 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("notes").focus();
           
           return false;
       }}
     
       if(document.getElementById("newproductname").value!=""){
           
           if(!document.getElementById("newproductname").value.match(/^[0-9 a-z.A-Z]+$/)){
                     document.getElementById("alert-message").innerHTML = "Product Name: Only alphanumeric allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("newproductname").focus();
     return false;
            } else
        if(document.getElementById("newproductname").value.length>30){
                         document.getElementById("alert-message").innerHTML = "Product Name: Only 30 characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("newproductname").focus();
           
           return false;
       }}
       
      
       if(document.getElementById("limit").value!=""){
           
           if(!document.getElementById("limit").value.match(/^[0-9]+$/)){
                     document.getElementById("alert-message").innerHTML = "New Limit: Only numbers allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("limit").focus();
     return false;
            } else
        if(document.getElementById("limit").value.length>30){
                         document.getElementById("alert-message").innerHTML = "New Limit: Only 30 digits allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("limit").focus();
           
           return false;
       }}
       
       if(document.getElementById("newcategory").value!=""){
           
           if(!document.getElementById("newcategory").value.match(/^[0-9 a-z.A-Z]+$/)){
                     document.getElementById("alert-message").innerHTML = "New Category: Only alphanumeric allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("newcategory").focus();
     return false;
            } else
        if(document.getElementById("newcategory").value.length>30){
                         document.getElementById("alert-message").innerHTML = "New Category: Only 30 charactersallowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("newcategory").focus();
           
           return false;
       }}

        if(document.getElementById("vid").value=="" ||document.getElementById("vid").value=="null" ){
                    document.getElementById("alert-message").innerHTML = "Please select vendor for addstock <br> Goto:  Vendor > VendorDashboard > Select Vendor > Click Add Stock";
    $('#show-alert').modal('show')
     
           
           document.getElementById("vid").focus();
           return false;
        }
       
       return true;
    }
</script>
<script>
function goBack() {
    window.history.back();
}
</script>
</body>
</html>
