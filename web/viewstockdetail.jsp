<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.ArrayList"%>
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
    <% HttpSession session1 = request.getSession(); // reuse existing
    
          String usercid_id=(String)session1.getAttribute("usercid_id");
          String usercid_email=(String)session1.getAttribute("usercid_email");
          String useraccountype=(String)session1.getAttribute("useraccountype");
          String usercid_name=(String)session1.getAttribute("usercid_name");
          String usercid_adminid=(String)session1.getAttribute("usercid_adminid");
             String usercid_company=(String)session1.getAttribute("usercid_company");
          String usercid_website=(String)session1.getAttribute("usercid_website"); 
      
          String vs=Poul.escapeHtml(request.getParameter("vs"));	

   	
if (session != null) {
			if (session1.getAttribute("usercid_id") == null) {
				response.sendRedirect("signout.jsp");
			} 
		}
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   -----------Entring viwestockdetails.jsp---");
%>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <jsp:include page="dist/include/leftmenu.jsp" />  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
      <%String msg=(String)session.getAttribute("submitmsg");if(msg!=null && msg.equals("success")){ %><div class="alert alert-success alert-dismissable">
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
 
    <form class="form-horizontal" action="" method="post">
	 <section class="content-header">

	 <div class="row invoice">
        <div class="col-xs-12">    <a href="viewproductreport.jsp?vs=<%=vs %>"  > <h5 class="box-title" align="right" >View Report</h5></a>
		 <!-- Default box -->
      <div class="box box-warning box-solid">
        <div class="box-header with-border">
          <h3 class="box-title">Edit Stock Details</h3>
      

         
        </div>
       
	    <div class="col-md-6">
		  
        
		 <div class="box ">
       <% 
                  String pagetype=request.getParameter("pagetype");
                    if(("addstock").equals(pagetype)){
                  String productname=request.getParameter("productname");
                  String productcode=request.getParameter("productcode");
                    String Quantity=request.getParameter("Quantity");
                  String Limit=request.getParameter("Limit");
                  String Price=request.getParameter("Price");
                  String status=request.getParameter("status");
                  String category1=request.getParameter("category1");
                  String category2=request.getParameter("category2");
                  String category3=request.getParameter("category3");
                  String category4=request.getParameter("category4");
                  String category5=request.getParameter("category5");
                int ii='0';
                  try{ ii = Integer.parseInt( vs );
      Connection c=Poul.getConnectionCRM();
PreparedStatement smt=c.prepareStatement("UPDATE stock SET Product=?,productcode=?,price=?,status=?,category1=?,category2=?,category3=?,category4=?,category5=? WHERE id=?");
        smt.setString(1,productname);
       
       smt.setString(2,productcode);
        smt.setString(3,Price);
        smt.setString(4,status);
        smt.setString(5,category1);
      smt.setString(6,category2);
         smt.setString(7,category3);
         smt.setString(8,category4);
        smt.setString(9,category5);
      
        smt.setString(10, String.valueOf(ii));
            int row = smt.executeUpdate();
      
      smt.close();
      c.close();   }
          catch(Exception e)
        {
                   String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n File= viewstockdetails.jsp-----\n"
     + "LINE=129 \n UPDATE stock SET Product="+productname+",productcode="+productcode+",price="+Price+",status="+status+",category1="+category1+",category2="+category2+",category3="+category3+",category4="+category4+",category5="+category5+" WHERE id="+String.valueOf(ii)+"";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg); 
     
        }          
                    
                    }
          String []al=new String[17]  ;        
         
       
       try{
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from stock where id=? ");
        smt.setString(1,vs);
        
        ResultSet rs=smt.executeQuery();
        while(rs.next()){
            for(int i=1;i<=16;i++){
               al[i]=rs.getString(i); 
            }
        }
        
     rs.close();
      smt.close();
      con.close();   }
        catch(Exception e){
                        String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n File= viewstockdetails.jsp-----\n"
     + "LINE=157 \n select * from stock where id="+vs+"";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg); 
     
                }
       //System.out.println(al.size());
       
       
     
      %>
           
            <!-- form start -->
               
              <div class="box-body">
                   <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">Product Name</label>

                  <div class="col-sm-10">
                      <%if("".equals(al[2])||"null".equals(al[2]) ){ %>
                    <input type="text" class="form-control" id="productname" name="productname" placeholder="Product Name" autocomplete="off">
                <% }else{ %>      <input type="text" class="form-control" id="productname" name="productname" value="<%=al[2]  %>" autocomplete="off">
               <% } %>
                  </div>
                </div>
                    <div class="form-group" id="shownewproductInput2" >
                  <label for="inputEmail3" class="col-sm-2 control-label">Product Code</label>

                  <div class="col-sm-10">
                      <%if("".equals(al[5])||"null".equals(al[5]) ){ %>
                    <input type="text" class="form-control" id="productcode" name="productcode" placeholder="productcode" autocomplete="off">
                 <% }else{ %>    <input type="text" class="form-control" id="productcode" name="productcode" value="<%=al[5]  %>" autocomplete="off">
                <% } %>
                  </div>
                </div>
                   <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">Quantity</label>

                  <div class="col-sm-10">
                       <%if("".equals(al[3])||"null".equals(al[3]) ){ %>
                    <input type="text" class="form-control" id="Quantity" name="Quantity" placeholder="Quantity" autocomplete="off">
                    <% }else{ %>    <input type="text" class="form-control" id="Quantity" name="Quantity" value="<%=al[3]  %>" autocomplete="off" disabled="">
                <% } %>
                  </div>
                </div>
             <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">Limit </label>

                  <div class="col-sm-10">
                       <%if("".equals(al[4])||"null".equals(al[4]) ){ %>
                    <input type="text" class="form-control" id="Limit" name="Limit" placeholder="Limit" autocomplete="off">
                    <% }else{ %>  <input type="text" class="form-control" id="Limit" name="Limit" value="<%=al[4]  %>" autocomplete="off">
                    <% } %>
                  
                  </div>
                </div>
               
                  <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">Price</label>

                  <div class="col-sm-10">
                       <%if("".equals(al[6])||"null".equals(al[6]) ){ %>
                    <input type="text" class="form-control" id="Price" name="Price" placeholder="Price" autocomplete="off">
                    <% }else{ %>   <input type="text" class="form-control" id="Price" name="Price" value="<%=al[6]  %>" autocomplete="off">
                  <% } %>
                  </div>
                </div>
                  <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Status</label>

                  <div class="col-sm-10">
                  
                     <select id="status" name="status" class="form-control">
                          
                           <option value="<%=al[16]%>"> <%=al[16]%></option>
                          <option value="Active"> Active</option>
                          <option value="InActive">InActive</option>
                          
                     </select>
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
                  <label for="inputPassword3" class="col-sm-3 control-label">Category 1</label>

                  <div class="col-sm-9">
                  <%if("".equals(al[7])||"null".equals(al[7]) ){ %>
                      <input type="text" class="form-control" id="category1" name="category1" placeholder="category1" autocomplete="off">
                  <% }else{ %>     <input type="text" class="form-control" id="category1" name="category1" value="<%=al[7]  %>" autocomplete="off">
                  <% } %>
                  </div>
                </div>
			  <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Category 2</label>

                  <div class="col-sm-9">
                    <%if("".equals(al[8])||"null".equals(al[8]) ){ %>
                      <input type="text" class="form-control" id="category2" name="category2" placeholder="category2" autocomplete="off">
                 <% }else{ %>     <input type="text" class="form-control" id="category2" name="category2" value="<%=al[8]  %>" autocomplete="off">
                 <% } %>
                  </div>
                </div>
			<div class="form-group" id="shownewproductInput3" >
                 <label for="inputPassword3" class="col-sm-3 control-label">Category 3</label>

                  <div class="col-sm-9">
                   <%if("".equals(al[9])||"null".equals(al[9]) ){ %>
                      <input type="text" class="form-control"  name="category3" placeholder="category3" autocomplete="off">
                   <% }else{ %>      <input type="text" class="form-control"  name="category3" value="<%=al[9]  %>" autocomplete="off">
                   <% } %>
                  </div>
                </div>   
		 <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Category 4</label>

                  <div class="col-sm-9">
                    <%if("".equals(al[10])||"null".equals(al[10]) ){ %>
                      <input type="text" class="form-control" id="category4" name="category4" placeholder="category4" autocomplete="off">
                 <% }else{ %>        <input type="text" class="form-control" id="category4" name="category4" value="<%=al[10]  %>" autocomplete="off">
                <% } %>
                  </div>
                </div>
		  <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Category 5</label>

                  <div class="col-sm-9">
                      <%if("".equals(al[11])||"null".equals(al[11]) ){ %>
                    <input type="text" class="form-control" id="category5" name="category5" placeholder="category5" autocomplete="off">
                   <% }else{ %>    <input type="text" class="form-control" id="category5" name="category5" value="<%=al[11]  %>" autocomplete="off">
                  <% } %>
                  </div>
                </div>
                   
			
			 
				
				
                  <input type="hidden" name="pagetype" value="addstock">
              </div>
              <!-- /.box-body -->
                    </div>
          <!-- /.box -->
          <div class="box-footer clearfix">
                         <button type="button" class="btn btn-default pull-left" onclick="goBack()"> Cancel</button>
                         <button class="btn btn-sm btn-info btn-flat pull-right"  type="submit">Save</button>
            </div>
  </div>
        <!--/.col (right) -->
 </div>
      <!-- /.box -->
</div>
		</div>
			
	
		
	
         
    </section>
  </form>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
<jsp:include page="dist/include/footer.jsp" />  
 <%    Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Leaving viewstockdetails.jsp------");
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
         if(document.getElementById("quantity").value==""){
           alert("Enter Quantity  ");
           document.getElementById("quantity").focus();
           return false;
       } 
      
        else if(document.getElementById("city").value==""){
           alert("Enter City ");
           document.getElementById("city").focus();
           return false;
       }
       else if(document.getElementById("product").value==""){
           alert("Select Product ");
           document.getElementById("product").focus();
           return false;
       }
       else if(document.getElementById("status").value==""){
           alert("Enter Status ");
           document.getElementById("status").focus();
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
