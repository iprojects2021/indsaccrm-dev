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
  <title>Add Stock | INDSAC CRM</title>
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
     
          String vid=Poul.escapeHtml(request.getParameter("vid"));	
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" ,vendorid="+vid+" --Entering addstock.jsp----------Add Stock---");
   	
if (session != null) {
			if (session1.getAttribute("usercid_id") == null) {
				response.sendRedirect("signout.jsp");
			} 
		}
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" -------Entering addstock.jsp--------");
%>

   <%
           int i=0,j=0; 
           String count2="0";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from stock where useradminid=? ");
        smt.setString(1,usercid_adminid );
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count2=rs.getString(1);  }
           rs.close();
      smt.close();
      con.close();
       } 
       catch(Exception e)
       {
    String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n addstock.jsp-----\n"
     + "LINE=103 \n select count(*) from stock where useradminid="+usercid_adminid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg); 
      
       }
      
       int n2=Integer.parseInt(count2);
       String taskdata2[][]=new String[n2+1][17];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from stock  where useradminid=?");
         smt.setString(1,usercid_adminid );
       
        ResultSet rs=smt.executeQuery();
     i=1;
        while(rs.next())
        { 
           for( j=1;j<=16;j++)
          {
            taskdata2[i][j]=rs.getString(j); 
           
          }
           ++i;  
        }
         rs.close();
      smt.close();
      con.close();
       } catch(Exception e){
            String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n addstock.jsp-----\n"
     + "LINE=131 \n select * from stock where useradminid="+usercid_adminid+" ";
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
    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
    <strong>Success!</strong> Lead detail submitted successfully.
  </div>
    <%}else if(msg!=null && msg.equals("fail")){%>
    <div class="alert alert-danger alert-dismissable">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
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
          <h3 class="box-title">Add Product Details</h3>

         
        </div>
       
	    <div class="col-md-6">
		
        
		 <div class="box ">
       
            <!-- form start -->
          <input type="hidden" id="vid" name="vid" value="<%=vid %>">
                 
              <div class="box-body">
                   <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">Bill Number</label>

                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="billnumber" name="billnumber" placeholder="Bill Number" autocomplete="off">
                  </div>
                </div>
                   <div class="form-group" id="shownewproductInput4">
                  <label for="inputEmail3" class="col-sm-2 control-label">Product Name</label>

                  <div class="col-sm-4" >
                <select id="productname" name="productname" class="form-control" >
                        <option value=""> Select Product</option> 
                       <% for(i=1;i<=n2;++i){  %>
                         <option value="<%=taskdata2[i][1]  %>"><% out.println(taskdata2[i][2]+" ,In-Stock:"+taskdata2[i][3]);  %></option>
                        
                         <% }  %>
                          
                     </select>
                  </div>
                         <div class="col-sm-1">
				</div>
                         <div class="col-sm-5">
                  <button class="btn btn-sm btn-info btn-flat pull-left" id="showInput"  type="button">New Product</button>
            </div>
                </div>
              <div class="form-group" id="shownewproductInput1" hidden>
                               <label for="inputEmail3" class="col-sm-2 control-label">New Product </label>

    
                  <div class="col-sm-4">
                    <input type="text" class="form-control" id="newproductname" name="newproductname" placeholder="Product Name" autocomplete="off">
                  </div>
                <div class="col-sm-1">
				</div>
                 

                  <div class="col-sm-5">
                    <input type="text" class="form-control" id="newproductcode" name="newproductcode" placeholder="Product Code" autocomplete="off">
                  </div>
                </div>  
                 <div class="form-group" id="shownewproductInput2" hidden>
                  <label for="inputEmail3" class="col-sm-2 control-label"> Limit Alert</label>

                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="limit" name="limit" placeholder="Quantity Limit Message" autocomplete="off">
                  </div>
                </div>
                   <div class="form-group" id="shownewcategoryInput1">
                  <label for="inputPassword3" class="col-sm-2 control-label">Product Category</label>

                  <div class="col-sm-4">
                      <select id="product" name="productcategory" class="form-control">
                          <option value=""> Select Category</option>
                         <option value="Camphor Jar">Camphor Jar</option>
                          <option value="Plastic Jar">Plastic Jar</option>
                          <option value="RO Water Filter"> RO Water Filter</option>
                          <option value="Dhoopbatti">Dhoopbatti</option>
                          <option value="BOPP Tape">BOPP Tape</option>
                          
                     </select>
                  </div>
                   <div class="col-sm-1">
				</div>
                         <div class="col-sm-5">
                  <button class="btn btn-sm btn-info btn-flat pull-left" id="showcategoryInput"  type="button">New Category</button>
            </div>
                  
                </div>
                 <div class="form-group" id="shownewcategoryInput2" hidden>
                  <label for="inputEmail3" class="col-sm-2 control-label">New Category</label>

                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="newcategory" name="newcategory" placeholder="New Category" autocomplete="off">
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
                      <select id="status" name="status" class="form-control">
                          <option value="Active"> Active</option>
                          <option value="InActive">InActive</option>
                         
                     </select>
                  </div>
                </div>
			  <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Buying Price</label>

                  <div class="col-sm-10">
                       <div class="input-group date">
                        <div class="input-group-addon">
                    <i class="fa fa-<%=currency%>"></i>
                  </div>
                    <input type="text" class="form-control" id="website" name="buyingprice" placeholder="Price" autocomplete="off">
                  </div>
                  </div>
                </div>
			<div class="form-group" id="shownewproductInput3" hidden>
                 <label for="inputPassword3" class="col-sm-2 control-label">Selling Price</label>

                  <div class="col-sm-10">
                        <div class="input-group date">
                        <div class="input-group-addon">
                    <i class="fa fa-<%=currency%>"></i>
                  </div>
                     <input type="text" class="form-control"  name="sellingprice" placeholder="Selling Price" autocomplete="off">
                  </div></div>
                </div>   
		 <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Quantity Ordered</label>

                  <div class="col-sm-10">
                      <input type="text" class="form-control" id="quantity" name="quantity" placeholder="Quantity" autocomplete="off" required="">
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
                    <textarea class="form-control" rows="7" id="notes" name="notes" placeholder=" Notes" autocomplete="off" ></textarea>
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
<% Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" ,vendorid="+vid+" --Leaving addstock.jsp----------Add Stock---");
  
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
