<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="blezz.Poul"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8"><link rel="shortcut icon" href="dist/img/u.png" type="image/x-icon" /> 
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Edit Seller Information | INDSAC CRM</title>
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
  <link rel="stylesheet" type="text/css" href="plugins/Allcalenders/css/jquery.calendars.picker.css"> 
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

</head>
   <%
         HttpSession session1 = request.getSession(); // reuse existing
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
         
         
             String pagetype=Poul.escapeHtml(request.getParameter("pagetype"));String id=request.getParameter("direct");String city=Poul.escapeHtml(request.getParameter("city"));
    String location=request.getParameter("location");
           Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+",City="+location+" --Entering editsellerinformation.jsp---------- New Location Add---");
      
     %> 
      
<body class="hold-transition skin-blue sidebar-mini">
    <%   
      if("editsellerinformation".equals(pagetype)){
          
          
      
       String cn=Poul.escapeHtml(request.getParameter("cn"));
        String cfn=Poul.escapeHtml(request.getParameter("cfn"));
        String cln=Poul.escapeHtml(request.getParameter("cln"));
        
        
        String website=Poul.escapeHtml(request.getParameter("website"));
        
        String mobile=Poul.escapeHtml(request.getParameter("mobile"));
        String ap=Poul.escapeHtml(request.getParameter("ap"));
        String email=Poul.escapeHtml(request.getParameter("email"));
       
        String address1=Poul.escapeHtml(request.getParameter("address1"));
        String address2=Poul.escapeHtml(request.getParameter("address2"));
        String address3=Poul.escapeHtml(request.getParameter("address3"));
        
        String pincode=Poul.escapeHtml(request.getParameter("pincode"));
        String state=Poul.escapeHtml(request.getParameter("state"));
        String country=Poul.escapeHtml(request.getParameter("country"));
        
        String gstin=Poul.escapeHtml(request.getParameter("gstin"));
        
        String msg=null;
        
        
      String SR=null;
        try{
       
Connection c=Poul.getConnectionCRM();

Statement st=c.createStatement();
           ResultSet rs3;
      st.addBatch("update mastertable set esi_sellername='"+cn+"',esi_contactfirstname='"+cfn+"',esi_contactlastname='"+cln+"',esi_gst='"+gstin+"',esi_website='"+website+"',esi_mobile='"+mobile+"',esi_alternatephone='"+ap+"',esi_email='"+email+"',esi_address1='"+address1+"',esi_address2='"+address2+"',esi_address3='"+address3+"',esi_pincode='"+pincode+"',esi_state='"+state+"',esi_country='"+country+"' where id='"+id+"'" );
     
            
       st.executeBatch(); 
            
       
        session1.setAttribute("getlocationid",city);
        session1.setAttribute("invoicesetpagetype","new");
             msg="success";    
     
      st.close();
      c.close(); 
        }
        catch(Exception e)
        {
             String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n editsellerinformation.jsp-----\n"
     + "LINE=109 + \n  update mastertable set where id='"+id+"' ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
     
        }
        finally{
        
           // session.setAttribute("submitmsg",msg);
           // response.sendRedirect("newleads.jsp");
            if("success".equals(msg)){
                Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" ------- editsellerinformation.jsp-----Redirect To--------invoicesetting.jsp---");
        response.sendRedirect("invoicesetting.jsp");
            }else{
               response.sendRedirect("editsellerinformation.jsp");
            }
        }
    
      } %>
    
<div class="wrapper">

  <jsp:include page="dist/include/leftmenu.jsp" />  

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
 
	
	 <section class="content">
  


	
	


<form class="form-horizontal" action="" method="get">
	
	 <div class="row invoice">
        <div class="col-xs-12">
		 <!-- Default box -->
      <div class="box box-warning box-solid">
        <div class="box-header with-border">
          <h3 class="box-title">Edit Seller Information</h3>
          <%=id %>
         
        </div>
       
	    <div class="col-md-6">
		
		 <div class="box ">
            
           <%   String cdata[]=new String[50];
           
              try{ Connection con=Poul.getConnectionCRM();
             PreparedStatement smt=con.prepareStatement("select * from mastertable where esi_city=?  ");
             smt.setString(1,location );
              ResultSet rs=smt.executeQuery();
              int i=1,j=1;
              while(rs.next()){
                      for(i=1;i<45;i++){
                      cdata[i]=(rs.getString(i));  
                      }
              } rs.close();
      smt.close();
      con.close(); }
      catch(Exception e)
      { 
           String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n editsellerinformation.jsp-----\n"
     + "LINE=178 + \n select * from mastertable where esi_city="+location+"   ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
     
      }   
            
            
        
            
            %>
            <!-- form start -->
            
              <div class="box-body">
			    <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">Seller Name</label>

                  <div class="col-sm-10">
                      <input type="text" class="form-control" id="cn" name="cn" value="<%=cdata[12] %>" placeholder="Seller Name" onKeyPress="if(this.value.length==30) return false;">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">Contact </label>

                  <div class="col-sm-4">
                    <input type="text" class="form-control" id="cfn" name="cfn" value="<%=cdata[13] %>" placeholder="First Name" onKeyPress="if(this.value.length==30) return false;">
                  </div>
                <div class="col-sm-1">
				</div>
                 

                  <div class="col-sm-5">
                    <input type="text" class="form-control" id="cln" name="cln" value="<%=cdata[14] %>" placeholder="Last Name" onKeyPress="if(this.value.length==30) return false;">
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
                  <label for="inputPassword3" class="col-sm-2 control-label">GSTIN </label>

                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="gstin" name="gstin" value="<%=cdata[15] %>" placeholder="GST Number" onKeyPress="if(this.value.length==30) return false;">
                  </div>
                </div>
			   
				
				
			
			  <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Website</label>

                  <div class="col-sm-10">
                   <input type="text" class="form-control" id="website" name="website" value="<%=cdata[16] %>" placeholder=" www.abc.com" onKeyPress="if(this.value.length==30) return false;">
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
          <h3 class="box-title">Contact Information</h3>

         
        </div>

       
	    <div class="col-md-6">
		
		 <div class="box ">
            
           
            <!-- form start -->
            
              <div class="box-body">
			   
			 <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Mobile</label>

                  <div class="col-sm-10">
                     <input type="text" class="form-control" id="mobile" name="mobile" value="<%=cdata[17] %>" placeholder=" Mobile" onKeyPress="if(this.value.length==12) return false;">
                  </div>
                </div>
				 <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Alternate Phone</label>

                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="ap" name="ap" value="<%=cdata[18] %>" placeholder=" Alternate Phone" onKeyPress="if(this.value.length==12) return false;">
                  </div>
                </div>
			
					
              
              </div>
              <!-- /.box-body -->
             
                       </div>
          <!-- /.box -->
        

        </div>
        <!--/.col (left) -->
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
                  <label for="inputPassword3" class="col-sm-2 control-label">Email</label>

                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="email" name="email" value="<%=cdata[19] %>" placeholder=" email" onKeyPress="if(this.value.length==30) return false;">
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
          <h3 class="box-title">Address</h3>

         
        </div>
       
	    <div class="col-md-6">
		
		 <div class="box ">
            
           
            <!-- form start -->
            
              <div class="box-body">
			 <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label"> Address1</label>

                  <div class="col-sm-10">
                     <input type="text" class="form-control" id="address1" name="address1" value="<%=cdata[20] %>"placeholder="Address1"  onKeyPress="if(this.value.length==30) return false;">
                  </div>
                </div>
					 <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">Address2</label>

                  <div class="col-sm-10">
                  <input type="text" class="form-control" id="address2" name="address2" value="<%=cdata[21] %>"placeholder="Address2"  onKeyPress="if(this.value.length==30) return false;">
                  </div>
                </div>
				 <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">Address3</label>

                  <div class="col-sm-10">
                   <input type="text" class="form-control" id="address3" name="address3"value="<%=cdata[22] %>" placeholder="Address3"  onKeyPress="if(this.value.length==30) return false;">
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
                  <label for="inputPassword3" class="col-sm-2 control-label">City</label>

                  <div class="col-sm-4">
                      <input type="text" class="form-control" id="city" name="city"  value="<%=cdata[23] %>" placeholder="City"  onKeyPress="if(this.value.length==30) return false;" disabled="">
                  </div>
                
                  <label for="inputPassword3" class="col-sm-2 control-label">Pincode</label>

                  <div class="col-sm-4">
                   <input type="text" class="form-control" id="pincode" name="pincode" value="<%=cdata[24] %>" placeholder="Pincode" onKeyPress="if(this.value.length==6) return false;">
                  </div>
                </div>
				<div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">State</label>

                  <div class="col-sm-10">
                  <input type="text" class="form-control" id="state" name="state" value="<%=cdata[25] %>" placeholder="State" onKeyPress="if(this.value.length==30) return false;">
                  </div>
                </div>
				     <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Country</label>

                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="country" name="country" value="<%=cdata[25] %>" placeholder="Country"  onKeyPress="if(this.value.length==30) return false;">
                  </div>
                </div>
			  
		  <input type="hidden" name="pagetype" value="editsellerinformation">
                 
			 <input type="hidden" name="direct" value="<%=cdata[1] %>">
                 		
				
				
              
              </div>
              <!-- /.box-body -->
			  <div class="box-footer clearfix">
              <a href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-left">Cancel</a>
               <button class="btn btn-sm btn-info btn-flat pull-right" onClick="return validateForm()">Save</button>
            </div>
            <!-- /.box-footer -->

         
        
			
          </div>
          <!-- /.box -->

    

    
      
        </div>
        <!--/.col (right) -->

	   
	   
	   
	   
      </div>
      <!-- /.box -->
		
		
		</div>
		</div>
		
	    </form>
		
		
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <jsp:include page="dist/include/footer.jsp" />
 <% Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Leaving editsellerinformation.jsp------");
 
 %>
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
<script src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- All Calenders-->
<script type="text/javascript" src="plugins/Allcalenders/js/jquery.calendars.js"></script> 
<script type="text/javascript" src="plugins/Allcalenders/js/jquery.calendars.plus.js"></script>
<script type="text/javascript" src="plugins/Allcalenders/js/jquery.plugin.js"></script> 
<script type="text/javascript" src="plugins/Allcalenders/js/jquery.calendars.picker.js"></script>
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
    function validateForm(){
        
        if(document.getElementById("cn").value==""){
           alert("Enter Seller Name ");
           document.getElementById("cn").focus();
           return false;
       } 
       else if(document.getElementById("cn").value.length>30){
           alert("Only 30 Characters allowed ");
           document.getElementById("cn").focus();
           return false;
       } 
       
         
     else if(document.getElementById("cfn").value.length>30){
           alert("Only 30 Characters allowed ");
           document.getElementById("cfn").focus();
           return false;
       } 
       
       else if(document.getElementById("cln").value.length>30){
           alert("Only 30 Characters allowed ");
           document.getElementById("cln").focus();
           return false;
       }
       
       else if(document.getElementById("gstin").value.length>30){
           alert("Only 30 Characters allowed ");
           document.getElementById("gstin").focus();
           return false;
       }
       
       else if(document.getElementById("website").value.length>30){
           alert("Only 30 Characters allowed ");
           document.getElementById("website").focus();
           return false;
       }
       
      /* else if(document.getElementById("mobile").value.length>10){
           alert("Only 12 digit allowed ");
           document.getElementById("mobile").focus();
           return false;*/
       //}
       
       else if(document.getElementById("ap").value.length>12){
           alert("Only 12 digit allowed ");
           document.getElementById("ap").focus();
           return false;
       }
       
       else if(document.getElementById("email").value.length>30){
           alert("Only 30 Characters allowed ");
           document.getElementById("email").focus();
           return false;
       }
       
       else if(document.getElementById("address1").value.length>30){
           alert("Only 30 Characters allowed ");
           document.getElementById("address1").focus();
           return false;
       }
       
       else if(document.getElementById("address2").value.length>30){
           alert("Only 30 Characters allowed ");
           document.getElementById("address2").focus();
           return false;
       }
       
       else if(document.getElementById("address3").value.length>30){
           alert("Only 30 Characters allowed ");
           document.getElementById("address3").focus();
           return false;
       }
       else if(document.getElementById("city").value.length>30){
           alert("Only 30 Characters allowed ");
           document.getElementById("city").focus();
           return false;
       }
       
       else if(document.getElementById("pincode").value.length>6){
           alert("Only 6 Digit allowed ");
           document.getElementById("pincode").focus();
           return false;
       }
       
       else if(document.getElementById("state").value.length>30){
           alert("Only 30 Characters allowed ");
           document.getElementById("state").focus();
           return false;
       }
       
       else if(document.getElementById("country").value.length>30){
           alert("Only 30 Characters allowed ");
           document.getElementById("country").focus();
           return false;
       }
       return true;
    }
</script>
<script>
$('#dob').calendarsPicker({
dateFormat:'dd/mm/yyyy'
});
</script>

<script>
            function myfun()
            {
                var a=document.getElementById("mobile").value;
                if(a=="")
                {  
                  
           document.getElementById("message").innerHTML="please entre numbers only"();
           return false;
            }
            if(isNaN(a)){
                document.getElementById("message").innerHTML="please entre numbers only"();
           return false;
            }
            if(a.length<10){
                document.getElementById("message").innerHTML="please entre numbers only"();
           return false;
            }
                if(a.length>10){
                document.getElementById("message").innerHTML="please entre numbers only"();
           return false;
            }
                
            }
</script>     

</body>
</html>
