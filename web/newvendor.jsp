<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
<%@page import="log.Log"%>
<%@page import="log.Log"%>
<%@page import="blezz.Db"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="blezz.Poul"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> <link rel="shortcut icon" href="dist/img/u.png" type="image/x-icon" /> 
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>New Vendor | INDSAC CRM</title>
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
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Entering newvendor.jsp----------New Vendor---");
%>
    <%    String pagetype=Poul.escapeHtml(request.getParameter("pagetype"));
      if("newvendorsubmit".equals(pagetype)){
    
       String cn=Poul.escapeHtml(request.getParameter("cn"));
        String cfn=Poul.escapeHtml(request.getParameter("cfn"));
        String cln=Poul.escapeHtml(request.getParameter("cln"));
        String department=Poul.escapeHtml(request.getParameter("department"));
        String designation=Poul.escapeHtml(request.getParameter("designation"));
        String dob=Poul.escapeHtml(request.getParameter("dob"));
        String category=Poul.escapeHtml(request.getParameter("category"));
        String sc=Poul.escapeHtml(request.getParameter("sc"));
        String status=Poul.escapeHtml(request.getParameter("status"));
        String rt=Poul.escapeHtml(request.getParameter("rt"));
        String source=Poul.escapeHtml(request.getParameter("source"));
        String vn=Poul.escapeHtml(request.getParameter("vn"));
        String website=Poul.escapeHtml(request.getParameter("website"));
        String bwtc =Poul.escapeHtml(request.getParameter("bwtc"));
        String mobile=Poul.escapeHtml(request.getParameter("mobile"));
        String  alternetmobile=Poul.escapeHtml(request.getParameter("mobile"));
        String ap=Poul.escapeHtml(request.getParameter("ap"));
        String email=Poul.escapeHtml(request.getParameter("email"));
        String oai=Poul.escapeHtml(request.getParameter("oai"));
        String oai1=Poul.escapeHtml(request.getParameter("oai1"));
        String phone=Poul.escapeHtml(request.getParameter("phone"));
        String fax=Poul.escapeHtml(request.getParameter("fax"));
        String oe=Poul.escapeHtml(request.getParameter("oe"));
        String oai2=Poul.escapeHtml(request.getParameter("oai2"));
        String oai3=Poul.escapeHtml(request.getParameter("oai3"));
        String address1=Poul.escapeHtml(request.getParameter("address1"));
        String address2=Poul.escapeHtml(request.getParameter("address2"));
        String address3=Poul.escapeHtml(request.getParameter("address3"));
        String city=Poul.escapeHtml(request.getParameter("city"));
        String pincode=Poul.escapeHtml(request.getParameter("pincode"));
        String state=Poul.escapeHtml(request.getParameter("state"));
        String country=Poul.escapeHtml(request.getParameter("country"));
        String notes=Poul.escapeHtml(request.getParameter("notes"));
        String gstin=Poul.escapeHtml(request.getParameter("gstin"));
        
        String msg=null;
        java.util.Date date=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());  
        String ownr=(String)session.getAttribute("ownr");
      String SR=null;
        try{
        
Connection c=Poul.getConnectionCRM();

Statement st=c.createStatement();
           ResultSet rs3;
               rs3 = st.executeQuery("select  *  FROM contact  ");
    while(rs3.next())
        
          {SR=rs3.getString(1);
          
          }
           int i = Integer.parseInt( SR ); 
           ++i; 
             st.addBatch("insert into contact values('"+i+"','"+sqlTime+"','0','"+ownr+"','"+cn+"','"+cfn+"','"+cln+"','"+department+"','"+designation+"','"+dob+"','','','"+status+"','"+rt+"','"+source+"','','"+vn+"','"+website+"','"+bwtc+"','"+mobile+"','"+alternetmobile+"','"+phone+"','"+email+"','"+oe+"','"+fax+"','"+oai+"','"+oai1+"','"+oai2+"','"+oai3+"','"+address1+"','"+address2+"','"+address3+"','"+city+"','"+pincode+"','"+state+"','"+country+"','"+notes+"','"+gstin+"','"+usercid_adminid+"','"+usercid_id+"','vendor','"+sqlTime+"','','','','','','','','')");
      
       st.executeBatch(); 
        String requestcid=Integer.toString(i);
        session.setAttribute("requestid",requestcid);
        session.setAttribute("type","vendor");
             msg="success";    
       
        }
        catch(Exception e)
        {
                    String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n newvendor.jsp-----\n"
                  + "LINE=134 \n insert into contact values where useradminid="+usercid_adminid+" AND customertype=vendor";
         Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
       EmergencyEmail.send(e,errormsg); 
     
        }
        finally{
        
           // session.setAttribute("submitmsg",msg);
           // response.sendRedirect("newleads.jsp");
            if("success".equals(msg)){
        response.sendRedirect("vendordetails.jsp");
            }else{
               response.sendRedirect("newleads.jsp");
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
          <h3 class="box-title">Vendor Details</h3>
        </div>     
	    <div class="col-md-6">		
		 <div class="box ">        
            <!-- form start -->
            
              <div class="box-body">
			    <div class="form-group">
                  <label for="inputEmail3" class="col-sm-3 control-label">Company Name</label>

                  <div class="col-sm-9">
                      <input type="text" class="form-control" id="cn" name="cn" placeholder="Company Name" autocomplete="off">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-3 control-label">Contact <span style="color:red">*</span> </label>

                  <div class="col-sm-4">
                      <input type="text" class="form-control" id="cfn" name="cfn" placeholder="First Name"  autocomplete="off">
                  </div>
                <div class="col-sm-1">
				</div>
  
                  <div class="col-sm-4">
                      <input type="text" class="form-control" id="cln" name="cln" placeholder="Last Name"  autocomplete="off">
                  </div>
                </div>
	  <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Status</label>

                  <div class="col-sm-9">
                    <select id="status" name="status" class="form-control">
                          <option value="Active"> Active</option>
                          <option value="InActive">InActive</option>
                          <option value="Active">Active</option>                         
                     </select></div>
                </div>			
				  	  <div class="form-group">
                  <label for="inputEmail3" class="col-sm-3 control-label">  Source</label>
 <% int count=Db.getActiveEventsCount(usercid_adminid) ;

                            String data[][]=new String [count][5] ;  
                             data=Db.getAllActiveEvents(usercid_adminid, count);
                          %> 
                    <div class="col-sm-9">
                        <% if(count==0){ %>
                        <a class="btn btn-sm btn-info btn-flat pull-right" href="marketing.jsp"  >Create Event</a>
          
                        <% }else{ %>
                    <select id="source" name="source" class="form-control">
                          <option value=""> Select source </option>
                          < <%  for(int i=1;i<=count;i++) { %>
                          <option value="<%=data[i][1]  %>"> <%=data[i][2]  %></option>
                           
                           <%  } %>
                     </select>
                     <% } %>
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
                  <label for="inputPassword3" class="col-sm-3 control-label">Best Way to Contact</label>

                    <div class="col-sm-9">
                      <select id="bwtc" name="bwtc" class="form-control">
                          
                          <option value="Mobile"> Mobile</option>
                          <option value="Email"> Email</option>
                          <option value="Phone"> Phone</option>
                      </select>
                  </div>
                </div>
			 <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Mobile <span style="color:red">*</span></label>

                  <div class="col-sm-9">
                      <input type="text" class="form-control" id="mobile" name="mobile" placeholder=" Mobile"  autocomplete="off">
                  </div>
                </div>
			 <div class="form-group">
                  <label for="inputEmail3" class="col-sm-3 control-label"> Phone</label>

                  <div class="col-sm-9">

                   <input type="text" class="form-control" id="ap" name="alternetmobile" placeholder="Phone" autocomplete="off" >
                  </div>
                </div>
				 
		<div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Email</label>

                  <div class="col-sm-9">
                  <input type="text" class="form-control" id="email" name="email" placeholder="Email" autocomplete="off">
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
          <h3 class="box-title">Other Information</h3>  
        </div>
	    <div class="col-md-6">		
		 <div class="box ">         
            <!-- form start -->           
              <div class="box-body">
                  	 <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Department</label>

                  <div class="col-sm-9">
                     <input type="text" class="form-control" id="department" name="department" placeholder="Department" autocomplete="off">
                  </div>
                </div>
				     <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Designation</label>

                  <div class="col-sm-9">
                      <input type="text" class="form-control" id="designation" name="designation" placeholder="Designation" autocomplete="off">
                  </div>
                </div>
     		 
              <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Category</label>

                  <div class="col-sm-9">
                      <input type="text" class="form-control" id="category" name="category" placeholder="Category" autocomplete="off">
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
                  <label for="inputPassword3" class="col-sm-2 control-label">ReportTo</label>

                  <div class="col-sm-10">
                      <input type="text" class="form-control" id="rt" name="rt" placeholder="Report To" autocomplete="off">
                  </div>
                </div>
			    <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">GSTIN </label>

                  <div class="col-sm-10">
                      <input type="text" class="form-control" id="gstin" name="gstin" placeholder="GST Number" autocomplete="off">
                  </div>
                </div>
					 
			  <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Website</label>

                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="website" name="website" placeholder=" https://abc.com/" autocomplete="off">
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
                  <label for="inputEmail3" class="col-sm-3 control-label"> Address1</label>

                  <div class="col-sm-9">
                     <input type="text" class="form-control" id="address1" name="address1" placeholder="Address1" autocomplete="off">
                  </div>
                </div>
					 <div class="form-group">
                  <label for="inputEmail3" class="col-sm-3 control-label">Address2</label>

                  <div class="col-sm-9">
                  <input type="text" class="form-control" id="address2" name="address2" placeholder="Address2" autocomplete="off">
                  </div>
                </div>
				 <div class="form-group">
                  <label for="inputEmail3" class="col-sm-3 control-label">Address3</label>

                  <div class="col-sm-9">
                   <input type="text" class="form-control" id="address3" name="address3" placeholder="Address3" autocomplete="off">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">City</label>

                  <div class="col-sm-3">
                    <input type="text" class="form-control" id="city" name="city"  placeholder="City" autocomplete="off">
                  </div>
                
                  <label for="inputPassword3" class="col-sm-3 control-label">Pincode</label>

                  <div class="col-sm-3">
                   <input type="text" class="form-control" id="pincode" name="pincode"  placeholder="Pincode" autocomplete="off">
                  </div>
                </div>
				<div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">State</label>

                  <div class="col-sm-9">
                  <input type="text" class="form-control" id="state" name="state"  placeholder="State" autocomplete="off">
                  </div>
                </div>
				     <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Country</label>

                  <div class="col-sm-9">
                    <input type="text" class="form-control" id="country" name="country"  placeholder="Country" autocomplete="off">
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
                  <label for="inputPassword3" class="col-sm-2 control-label">Notes</label>

                  <div class="col-sm-10">
                    <textarea class="form-control" rows="7" id="notes" name="notes" placeholder=" Notes" autocomplete="off"></textarea>
                    <input type="hidden" name="pagetype" value="newvendorsubmit">
                  </div>
                </div>
              </div>
              <!-- /.box-body -->
			  <div class="box-footer clearfix">
              <button type="button" class="btn btn-default pull-left" onclick="goBack()"> Cancel</button>
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
 <% Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Leaving newvendor.jsp----------New Vendor---");
   	
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
function goBack() {
    window.history.back();
}
</script>

<script>
    function validateForm(){
     
       if(document.getElementById("cfn").value==""){
   
            document.getElementById("alert-message").innerHTML = "First Name: Cannot be empty";
    $('#show-alert').modal('show')
       document.getElementById("cfn").focus();
           return false;
        }else 
            if(document.getElementById("cfn").value!=""){
            if(document.getElementById("cfn").value.length>150){
            document.getElementById("alert-message").innerHTML = "First Name: Only 150 Characters allowed";
    $('#show-alert').modal('show')
           document.getElementById("cfn").focus();
           
           return false;
       }else           
           if(!document.getElementById("cfn").value.match(/^[0-9 a-z.A-Z]+$/)){
              document.getElementById("alert-message").innerHTML = "First Name: Only alphanumeric allowed";
    $('#show-alert').modal('show')
           
           document.getElementById("cfn").focus();
     return false;
            } 
        } 
       
       if(document.getElementById("cln").value==""){
   
            document.getElementById("alert-message").innerHTML = "Last Name: Cannot be empty";
    $('#show-alert').modal('show')
       document.getElementById("cln").focus();
           return false;
        }else 
            if(document.getElementById("cln").value!=""){
            if(document.getElementById("cln").value.length>150){
            document.getElementById("alert-message").innerHTML = "Last Name: Only 150 Characters allowed";
    $('#show-alert').modal('show')
           document.getElementById("cln").focus();
           
           return false;
       }else           
           if(!document.getElementById("cln").value.match(/^[0-9 a-z.A-Z]+$/)){
              document.getElementById("alert-message").innerHTML = "Last Name: Only alphanumeric allowed";
    $('#show-alert').modal('show')
           
           document.getElementById("cln").focus();
     return false;
            } 
        } 
         if(document.getElementById("mobile").value==""){
   
            document.getElementById("alert-message").innerHTML = "Mobile: Cannot be empty";
    $('#show-alert').modal('show')
       document.getElementById("mobile").focus();
           return false;
        }else 
            if(document.getElementById("mobile").value!=""){
            if(document.getElementById("mobile").value.length>15){
            document.getElementById("alert-message").innerHTML = "Mobile:: Only 15 digit allowed";
    $('#show-alert').modal('show')
           document.getElementById("mobile").focus();
           
           return false;
       }else           
           if(!document.getElementById("mobile").value.match(/^[0-9]+$/)){
              document.getElementById("alert-message").innerHTML = "Mobile:: Only number allowed";
    $('#show-alert').modal('show')
           
           document.getElementById("mobile").focus();
     return false;
            } 
        } 
       
       if(document.getElementById("cn").value!=""){
           
           if(!document.getElementById("cn").value.match(/^[0-9 a-z.A-Z]+$/)){
                     document.getElementById("alert-message").innerHTML = "Company Name: Only alphanumeric allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("cn").focus();
     return false;
            } else
        if(document.getElementById("cn").value.length>150){
                         document.getElementById("alert-message").innerHTML = "Company Name: Only 150 Characters allowed";
    $('#show-alert').modal('show')
        
           document.getElementById("cn").focus();
           
           return false;
       }}
           if(document.getElementById("source").value!=""){
           
           if(!document.getElementById("source").value.match(/^[0-9 a-z.A-Z]+$/)){
                     document.getElementById("alert-message").innerHTML = "Source: Only alphanumeric allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("source").focus();
     return false;
            }else
        if(document.getElementById("source").value.length>45){
                         document.getElementById("alert-message").innerHTML = "Source: Only 45 Characters allowed";
    $('#show-alert').modal('show')
         
           document.getElementById("source").focus();
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
            }else
        if(document.getElementById("status").value.length>45){
                         document.getElementById("alert-message").innerHTML = "Status: Only 45 Characters allowed";
    $('#show-alert').modal('show')
         
           document.getElementById("status").focus();
           
           return false;
       }
      }
     
        if(document.getElementById("bwtc").value!=""){
           
           if(!document.getElementById("bwtc").value.match(/^[0-9 a-z.A-Z]+$/)){
                     document.getElementById("alert-message").innerHTML = "Best Way to Contact: Only number allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("bwtc").focus();
     return false;
            }else
        if(document.getElementById("bwtc").value.length>45){
                         document.getElementById("alert-message").innerHTML = "Best Way to Contact: Only 45 Characters allowed";
    $('#show-alert').modal('show')
         
           document.getElementById("bwtc").focus();
           return false;
       }
      }
   
   if(document.getElementById("department").value!=""){
           
           if(!document.getElementById("department").value.match(/^[0-9 a-z.A-Z]+$/)){
                     document.getElementById("alert-message").innerHTML = "Please enter valid department name";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("department").focus();
     return false;
            } else
        if(document.getElementById("department").value.length>45){
                         document.getElementById("alert-message").innerHTML = "Department Name: Only 45 Characters allowed";
    $('#show-alert').modal('show')
        
           document.getElementById("department").focus();
           
           return false;
       }}
       
       if(document.getElementById("designation").value!=""){
           
           if(!document.getElementById("designation").value.match(/^[a-z. A-Z]+$/)){
                     document.getElementById("alert-message").innerHTML = "Please enter valid designation";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("designation").focus();
     return false;
            } else
        if(document.getElementById("designation").value.length>45){
                         document.getElementById("alert-message").innerHTML = "Designation: Only 45 Characters allowed";
    $('#show-alert').modal('show')
          
           document.getElementById("designation").focus();
           
           return false;
       }}
     
      if(document.getElementById("category").value!=""){
           
           if(!document.getElementById("category").value.match(/^[0-9 a-z.A-Z]+$/)){
                     document.getElementById("alert-message").innerHTML = "Please enter valid category";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("category").focus();
     return false;
            } else
        if(document.getElementById("category").value.length>45){
                         document.getElementById("alert-message").innerHTML = "Category: Only 45 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("category").focus();
           
           return false;
       }}
       
          if(document.getElementById("website").value!=""){
           
        if(document.getElementById("website").value.length>45){
                         document.getElementById("alert-message").innerHTML = "Website: Only 45 Characters allowed";
    $('#show-alert').modal('show')
          
           document.getElementById("website").focus();
           
           return false;
       }
   }
      
       if(document.getElementById("gstin").value!=""){
           
           if(!document.getElementById("gstin").value.match(/^[0-9A-Z]+$/)){
                     document.getElementById("alert-message").innerHTML = "Please enter valid gstin";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("gstin").focus();
     return false;
            }else
        if(document.getElementById("gstin").value.length>15){
                         document.getElementById("alert-message").innerHTML = "GSTIN: Only 15 Characters allowed";
    $('#show-alert').modal('show')
         
           document.getElementById("gstin").focus();
           
           return false;
       }
   }
   
    if(document.getElementById("rt").value!=""){
           
           if(!document.getElementById("rt").value.match(/^[0-9 a-z.A-Z]+$/)){
                     document.getElementById("alert-message").innerHTML = "Report To: please enter valid name";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("rt").focus();
     return false;
            } else
        if(document.getElementById("rt").value.length>45){
                         document.getElementById("alert-message").innerHTML = "Report To: Only 45 Characters allowed";
    $('#show-alert').modal('show')
        
           document.getElementById("rt").focus();
           
           return false;
       }}
      
        if(document.getElementById("ap").value!=""){
           
            if(!document.getElementById("ap").value.match(/^[0-9]+$/)){
                          document.getElementById("alert-message").innerHTML = "Alternate Mobile: Only numbers allowed ";
    $('#show-alert').modal('show')
     
          
           document.getElementById("ap").focus();
     return false;
            } else
        if(document.getElementById("ap").value.length>15){
         document.getElementById("alert-message").innerHTML = "Alternate Mobile: Only 15 digits allowed ";
    $('#show-alert').modal('show')
               
           document.getElementById("ap").focus();
           
           return false;
       } 
   }
   
        if(document.getElementById("email").value!=""){
           
                         if(document.getElementById("email").value.length>45){
                         document.getElementById("alert-message").innerHTML = "Email: Only 45 Characters allowed";
    $('#show-alert').modal('show')
          
           document.getElementById("email").focus();
           
           return false;
       }else
           if(!document.getElementById("email").value.match(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/)){
                     document.getElementById("alert-message").innerHTML = "Enter valid email id";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("email").focus();
     return false;
            } 
   }
       
        if(document.getElementById("address1").value!=""){
           
           if(!document.getElementById("address1").value.match(/^[a-zA-Z:,'-'' '\.0-9\n]+$/)){
                     document.getElementById("alert-message").innerHTML = "Address1: Only alphanumeric allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("address1").focus();
     return false;
            } else
        if(document.getElementById("address1").value.length>150){
                         document.getElementById("alert-message").innerHTML = "Address1: Only 150 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("address1").focus();
           
           return false;
       }} 
     
      if(document.getElementById("address2").value!=""){
           
           if(!document.getElementById("address2").value.match(/^[a-zA-Z:,'-'' '\.0-9\n]+$/)){
                     document.getElementById("alert-message").innerHTML = "Address2: Only alphanumeric allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("address2").focus();
     return false;
            } else
        if(document.getElementById("address2").value.length>150){
                         document.getElementById("alert-message").innerHTML = "Address2: Only 150 Characters allowed";
    $('#show-alert').modal('show')
          
           document.getElementById("address2").focus();
           
           return false;
       }} 
      
      if(document.getElementById("address3").value!=""){
           
           if(!document.getElementById("address3").value.match(/^[a-zA-Z:,'-'' '\.0-9\n]+$/)){
                     document.getElementById("alert-message").innerHTML = "Address3: Only alphanumeric allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("address3").focus();
     return false;
            } else
        if(document.getElementById("address3").value.length>150){
                         document.getElementById("alert-message").innerHTML = "Address3: Only 150 Characters allowed";
    $('#show-alert').modal('show')
        
           document.getElementById("address3").focus();
           
           return false;
       }} 
      
      if(document.getElementById("city").value!=""){
           
           if(!document.getElementById("city").value.match(/^[a-zA-Z:,'-'' '\.0-9\n]+$/)){
                     document.getElementById("alert-message").innerHTML = "City: Only alphanumeric allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("city").focus();
     return false;
            } else
        if(document.getElementById("city").value.length>45){
                         document.getElementById("alert-message").innerHTML = "City: Only 45 Characters allowed";
    $('#show-alert').modal('show')
       
           document.getElementById("city").focus();
           
           return false;
       }}
      
      if(document.getElementById("pincode").value!=""){
           
           if(!document.getElementById("pincode").value.match(/^[0-9]+$/)){
                     document.getElementById("alert-message").innerHTML = "Pincode: Only digits allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("pincode").focus();
     return false;
            } else
        if(document.getElementById("pincode").value.length>10){
                         document.getElementById("alert-message").innerHTML = "Pincode: Only 10 digits allowed";
    $('#show-alert').modal('show')
         
           document.getElementById("pincode").focus();
           
           return false;
       }}
      
       if(document.getElementById("state").value!=""){
           
           if(!document.getElementById("state").value.match(/^[a-zA-Z:,'-'' '\.0-9\n]+$/)){
                     document.getElementById("alert-message").innerHTML = "State: Only characters allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("state").focus();
     return false;
            } else
        if(document.getElementById("state").value.length>45){
                         document.getElementById("alert-message").innerHTML = "State: Only 45 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("state").focus();
           
           return false;
       }}
       
       if(document.getElementById("country").value!=""){
           
           if(!document.getElementById("country").value.match(/^[a-zA-Z:,'-'' '\.0-9\n]+$/)){
                     document.getElementById("alert-message").innerHTML = "Country: Only characters allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("country").focus();
     return false;
            } else
        if(document.getElementById("country").value.length>45){
                         document.getElementById("alert-message").innerHTML = "Country: Only 45 Characters allowed";
    $('#show-alert').modal('show')
           
           document.getElementById("country").focus();
           
           return false;
       }
      }
      
      if(document.getElementById("notes").value!=""){
           
           if(!document.getElementById("notes").value.match(/^[a-zA-Z:,'-'' '\.0-9\n]+$/)){
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
$('#dob').calendarsPicker({
dateFormat:'dd/mm/yyyy'
});
</script>
</body>
</html>
