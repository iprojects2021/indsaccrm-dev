<%@page import="menu.BusinessProfileService"%>
<%@page import="blezz.Nd"%>
<%@page import="email.EmergencyEmail"%>
<%@page import="email.EmergencyEmail"%>
<%@page import="email.EmergencyEmail"%>
<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
<%@page import="blezz.Db"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.util.ArrayList"%>
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
    <head> <link rel="shortcut icon" href="dist/img/u.png" type="image/x-icon" /> 
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title> Business Profile | INDSAC CRM</title>
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
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Entering userprofile.jsp-----------");
 String warningmsg="",successmsg="";
          
          String msgurl=request.getParameter("message");
          if("updatesuccessfully".equals(msgurl)||"successfullysaved".equals(msgurl) ){successmsg="Updated  Successfully";}
          String businesProfileData[]=BusinessProfileService.getBusinessProfile(usercid_adminid);
        %>
    
    
<div class="wrapper">

 <jsp:include page="dist/include/leftmenu.jsp" />  

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    
     <section class="content">

      <div class="row">
        <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
              <img class="profile-user-img img-responsive img-circle" src="dist/img/u.png" alt="User profile picture">

              <h3 class="profile-username text-center">INDSAC CRM</h3>

              <ul class="list-group list-group-unbordered">
                
                <li class="list-group-item">
                  <strong><i class="fa fa-diamond margin-r-5"></i>Website</strong>

              <p class="text-muted">
            xyz 
              </p>
                </li>

                <li class="list-group-item">
                  <strong><i class=" fa fa-pencil margin-r-5"></i>GSTIN No.</strong>

                  <p class="text-muted">
                   AGB345ATH356ER1
                  </p>
                </li>

                <li class="list-group-item">
                  <strong><i class="fa fa-user-circle margin-r-5"></i>Owner Name</strong>

              <p class="text-muted">
            XYZ
              </p>
                </li>

              </li>

              <li class="list-group-item">
                <strong><i class="fa  fa-calendar-check-o margin-r-5"></i>Year of Established</strong>

            <p class="text-muted">
            3.5 Yreas
            </p>
              </li>

              
                <li class="list-group-item">
                <strong><i class="fa fa-envelope margin-r-5"></i> Business Email </strong>

              <p class="text-muted">
             info@indsac.com
              </p>
            </li>

            <li class="list-group-item">
              <strong><i class="fa fa-phone margin-r-5"></i> Phone No </strong>

            <p class="text-muted">
          799814068
            </p>
          </li>

                <li class="list-group-item">
                <strong><i class="fa fa-map-marker margin-r-5"></i> Office Location</strong>

              <p class="text-muted">Bangalore, India</p>

            </ul>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          <!-- About Me Box -->
         
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#general" data-toggle="tab">General Info</a></li>
              <li><a href="#businessdetails" data-toggle="tab">Business Details</a></li>
              
              <li><a href="#settings" data-toggle="tab">Settings</a></li>
            </ul>
            <div class="tab-content">
              <div class="active tab-pane" id="general">
                
                <form class="form-horizontal" method="post" action="ProfileFormSubmit">
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Business Name <span style="color:red">*</span> </label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="businessname"  name="businessname"placeholder=" Business Name">
                    </div>
                  </div>
  
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label"> Business Email</label>
  
                    <div class="col-sm-10">
                      <input type="email" class="form-control" id="businessemail"  name="businessemail" placeholder=" Business Email">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Website</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="website" name="website" placeholder="Website">
                    </div>
                  </div>
                <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label"> Landline Telephone </label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="landlinetelephone" name="landlinetelephone" placeholder="Telephone No">
                    </div>
                  </div>
  
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">Mobile No <span style="color:red">*</span></label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="mobileno"  name="mobileno" placeholder="Mobile No">
                    </div>
                  </div>
  
                  <div class="form-group">
                    <label for="inputExperience" class="col-sm-2 control-label">Head Office Address</label>
  
                    <div class="col-sm-10">
                      <textarea class="form-control" id="headofficeaddress" name="headofficeaddress" placeholder="Head Office Address"></textarea>
                    </div>
                  </div>
                    
                    <div class="form-group">
                    <label for="inputExperience" class="col-sm-2 control-label"> Office Address</label>
  
                    <div class="col-sm-10">
                      <textarea class="form-control" id="officeaddress" name="officeaddress" placeholder="Office Address"></textarea>
                    </div>
                  </div>
  
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">City <span style="color:red">*</span></label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="city" name="city" placeholder="City">
                    </div>
                  </div>
  
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">State <span style="color:red">*</span></label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="state"  name="state" placeholder="State">
                    </div>
                  </div>
  
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">Country <span style="color:red">*</span></label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="country"  name="country" placeholder="Country">
                    </div>
                  </div>
  
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">Zip Code <span style="color:red">*</span></label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="zipcode"  name="zipcode" placeholder="Zip Code">
                    </div>
                  </div>
  
                    <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label" >Notes</label>

                  <div class="col-sm-10" >
                 <textarea class="form-control" rows="5" id="notes" name="notes" placeholder=" Notes " autocomplete="off"></textarea>
                  </div>
                </div>
                  
      
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <div class="checkbox">
                        <label>
                          <input type="checkbox" required> I agree to the <a href="#">terms and conditions</a>
                        </label>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="button" class="btn btn-danger"  onClick="return validateForm()">
                      Submit
                      </button>
                    </div>
                    <div class="modal fade" id="modal-default">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Reminder....</h4>
                          </div>
                          <div class="modal-body">
                            <p>Do You Really Want To Save Changes&hellip;</p>
                          </div>
                            <input type="hidden" name="useradminid" value="<%=usercid_adminid  %>">
                            <input type="hidden" name="usercid" value="<%=usercid_id  %>">
                          <div class="modal-footer">
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary" >Save </button>
                          </div>
                        </div>
                        <!-- /.modal-content -->
                      </div>
                    
                    </div>
                  </div>
                </form>
             
              </div>
              <!-- /.tab-pane -->
              <div class="tab-pane" id="businessdetails">
                <!-- The timeline -->
                
                <form class="form-horizontal" method="post" action="BusinessFormSubmit">
                     <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label"> Owner Details</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="ownerdetails" name="ownerdetails" placeholder=" Owner Details">
                    </div>
                  </div>
                    
                     <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2  control-label">Company Status</label>

                  <div class="col-sm-10">
                    <select id="companystatus" name="companystatus" class="form-control">
                          <option value="Active"> Active</option>
                        </select></div>
                </div>
                    
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label"> Branch Location</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="branchlocation"  name="branchlocation" placeholder="Branch Location">
                    </div>
                  </div>
                    
                    <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label"> Business Type</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="businesstype"  name="businesstype" placeholder="Business Type">
                    </div>
                  </div>

                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Total Employees</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="totalemployee"  name="totalemployee" placeholder="Total Employees">
                    </div>
                  </div>
                         <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Year Of Established</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="yearofestablished"  name="yearofestablished" placeholder="Year Of Established">
                    </div>
                  </div>
  
                     <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Gross Annual Turnover</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="grossannualturnover"  name="grossannualturnover" placeholder="Gross Annual Turnover">
                    </div>
                  </div>
                    
                    
                     <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Annual Export Turnover</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="annualexportturnover" name="annualexportturnover" placeholder="Annual Export Turnover">
                    </div>
                  </div>
                    
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="button" class="btn btn-danger"  onClick="return detailForm()" >
                      Submit
                      </button>
                    </div>
                    <div class="modal fade" id="modal-about1">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Reminder....</h4>
                          </div>
                          <div class="modal-body">
                            <p>Do You Want To Really Save Changes&hellip;</p>
                          </div>
                            <input type="hidden" name="useradminid" value="<%=usercid_adminid  %>">
                            <input type="hidden" name="usercid" value="<%=usercid_id  %>">
                          <div class="modal-footer">
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary" >Save </button>
                          </div>
                        </div>
                        <!-- /.modal-content -->
                      </div>
                    
                    </div>
                  </div>
                
                </form>

              </div>
              <!-- /.tab-pane -->
<!-- /.tab-pane -->
              
              <!-- /.tab-pane -->
              <div class="tab-pane" id="settings">
                <form class="form-horizontal" >

                  <div class="box box-info">
                    <div class="box-header">
                     <a class="box-title">Change Password Settings</a>
                    </div>

                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">New Paasword</label>

                    <div class="col-sm-6">
                      <input type="text" class="form-control" id="newpaasword" placeholder="New Paasword">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Confirm Password</label>

                    <div class="col-sm-6">
                      <input type="text" class="form-control" id="confirmpassword" placeholder="Confirm Password">
                    </div>
                  </div> 
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modal-setting1">
                      Submit
                      </button>
                    </div>
                    <div class="modal fade" id="modal-setting1">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Reminder....</h4>
                          </div>
                          <div class="modal-body">
                            <p>Do You Want To Really Save Changes&hellip;</p>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save </button>
                          </div>
                        </div>
                        <!-- /.modal-content -->
                      </div>
                    </div>
                   </div>
                  <div class="box box-info">
                    <div class="box-header">
                     <a  class="box-title">Logo Settings </a>
                     <a  href="selectavatar.jsp" class="btn btn-info pull-right">Select Default Logo </a>
                    </div>
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">Upload Business Logo</label>
                    <input type="file" id="uploadbusinesslogo" >
                  </div>
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modal-setting1">
                      Submit
                      </button><br><br>
                    </div>
                    <div class="modal fade" id="modal-setting1">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Reminder....</h4>
                          </div>
                          <div class="modal-body">
                            <p>Do You Want To Really Save Changes&hellip;</p>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save </button>
                          </div>
                        </div>
                        <!-- /.modal-content -->
                      </div>
                    </div>
                  </div>
                  </div>
            
              </div>
            </form>
              <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>
    
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  
 <jsp:include page="dist/include/footer.jsp" />
 <% Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Leaving userprofile.jsp------");
 
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
  window.onload = function()        
{     var x='<%=warningmsg.length()%>'
      var y='<%=successmsg.length()%>'
   
     if(y>0){       
    document.getElementById("alert-message-success").innerHTML = "<%=successmsg %>";
     $('#show-success').modal('show')
 }
    
    if(x>0){       
    document.getElementById("alert-message-warning").innerHTML = "<%=warningmsg %>";
     $('#show-warning').modal('show')
 }
 
}   </script> 
<script>
        function validateForm(){
            
        if(document.getElementById("businessname").value==""){
   
            document.getElementById("alert-message").innerHTML = "Business Name: Cannot be empty";
    $('#show-alert').modal('show')
       document.getElementById("businessname").focus();
           return false;
        }else 
            if(document.getElementById("businessname").value!=""){
            if(document.getElementById("businessname").value.length>150){
            document.getElementById("alert-message").innerHTML = "Business Name: Only 150 Characters allowed";
    $('#show-alert').modal('show')
           document.getElementById("businessname").focus();
           
           return false;
       }else           
           if(!document.getElementById("businessname").value.match(/^[0-9 a-z.A-Z]+$/)){
              document.getElementById("alert-message").innerHTML = "Business Name: Only alphanumeric allowed";
    $('#show-alert').modal('show')
           
           document.getElementById("businessname").focus();
     return false;
            } 
        } 
 
      if(document.getElementById("mobileno").value==""){
   
            document.getElementById("alert-message").innerHTML = "Mobile No: Cannot be empty";
    $('#show-alert').modal('show')
       document.getElementById("mobileno").focus();
           return false;
        }else 
            if(document.getElementById("mobileno").value!=""){
            if(document.getElementById("mobileno").value.length>15){
            document.getElementById("alert-message").innerHTML = "Mobile No: Only 15 digit allowed";
    $('#show-alert').modal('show')
           document.getElementById("mobileno").focus();
           
           return false;
       }else           
           if(!document.getElementById("mobileno").value.match(/^[0-9]+$/)){
              document.getElementById("alert-message").innerHTML = "Mobile No: Only number allowed";
    $('#show-alert').modal('show')
           
           document.getElementById("mobileno").focus();
     return false;
            } 
        } 
       
        if(document.getElementById("city").value==""){
   
            document.getElementById("alert-message").innerHTML = "City: Cannot be empty";
    $('#show-alert').modal('show')
       document.getElementById("city").focus();
           return false;
        }else 
            if(document.getElementById("city").value!=""){
            if(document.getElementById("city").value.length>45){
            document.getElementById("alert-message").innerHTML = "City: Only 45 Characters allowed";
    $('#show-alert').modal('show')
           document.getElementById("city").focus();
           
           return false;
       }else           
           if(!document.getElementById("city").value.match(/^[0-9 a-z.A-Z]+$/)){
              document.getElementById("alert-message").innerHTML = "City: Only alphanumeric allowed";
    $('#show-alert').modal('show')
           
           document.getElementById("city").focus();
     return false;
            } 
        } 
           if(document.getElementById("state").value==""){
   
            document.getElementById("alert-message").innerHTML = "State: Cannot be empty";
    $('#show-alert').modal('show')
       document.getElementById("state").focus();
           return false;
        }else 
            if(document.getElementById("state").value!=""){
            if(document.getElementById("state").value.length>45){
            document.getElementById("alert-message").innerHTML = "State: Only 45 Characters allowed";
    $('#show-alert').modal('show')
           document.getElementById("state").focus();
           
           return false;
       }else           
           if(!document.getElementById("state").value.match(/^[a-zA-Z:,'-'' '\.0-9\n]+$/)){
              document.getElementById("alert-message").innerHTML = "State: Only Characters allowed";
    $('#show-alert').modal('show')
           
           document.getElementById("state").focus();
     return false;
            } 
        } 
    
            if(document.getElementById("country").value==""){
   
            document.getElementById("alert-message").innerHTML = "Country: Cannot be empty";
    $('#show-alert').modal('show')
       document.getElementById("country").focus();
           return false;
        }else 
            if(document.getElementById("country").value!=""){
            if(document.getElementById("country").value.length>45){
            document.getElementById("alert-message").innerHTML = "Country: Only 45 Characters allowed";
    $('#show-alert').modal('show')
           document.getElementById("country").focus();
           
           return false;
       }else           
           if(!document.getElementById("country").value.match(/^[0-9 a-z.A-Z]+$/)){
              document.getElementById("alert-message").innerHTML = "Country: Only alphanumeric allowed";
    $('#show-alert').modal('show')
           
           document.getElementById("country").focus();
     return false;
            } 
        } 
       
       if(document.getElementById("zipcode").value==""){
   
            document.getElementById("alert-message").innerHTML = "Zipcode: Cannot be empty";
    $('#show-alert').modal('show')
       document.getElementById("zipcode").focus();
           return false;
        }else 
            if(document.getElementById("zipcode").value!=""){
            if(document.getElementById("zipcode").value.length>45){
            document.getElementById("alert-message").innerHTML = "Zipcode: Only 10 allowed";
    $('#show-alert').modal('show')
           document.getElementById("zipcode").focus();
           
           return false;
       }else           
           if(!document.getElementById("zipcode").value.match(/^[0-9]+$/)){
              document.getElementById("alert-message").innerHTML = "Zipcode: Only number allowed";
    $('#show-alert').modal('show')
           
           document.getElementById("zipcode").focus();
     return false;
            } 
        } 
  
       if(document.getElementById("businessemail").value!=""){
           
       if(document.getElementById("businessemail").value.length>45){
                         document.getElementById("alert-message").innerHTML = "Business Email: Only 45 Characters allowed";
    $('#show-alert').modal('show')
          
           document.getElementById("businessemail").focus();
           
           return false;
       }else
           if(!document.getElementById("businessemail").value.match(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/)){
                     document.getElementById("alert-message").innerHTML = "Enter valid business email id";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("businessemail").focus();
     return false;
            } 
   }
        
    if(document.getElementById("website").value!=""){
           
        if(document.getElementById("website").value.length>45){
                         document.getElementById("alert-message").innerHTML = "Website: Only 45 Characters allowed";
    $('#show-alert').modal('show')
          
           document.getElementById("website").focus();
           
           return false;
       }
        
   }
   
        if(document.getElementById("landlinetelephone").value!=""){
           
       if(document.getElementById("landlinetelephone").value.length>15){
                         document.getElementById("alert-message").innerHTML = "Landline Telephone: Only 15 digit allowed";
    $('#show-alert').modal('show')
          
           document.getElementById("landlinetelephone").focus();
           
           return false;
       }else
           if(!document.getElementById("landlinetelephone").value.match(/^[0-9]+$/)){
                     document.getElementById("alert-message").innerHTML = "Landline Telephone: Only number allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("landlinetelephone").focus();
     return false;
            } 
   }
   
  if(document.getElementById("headofficeaddress").value!=""){
           
           if(!document.getElementById("headofficeaddress").value.match(/^[a-zA-Z:,'-'' '\.0-9\n]+$/)){
                     document.getElementById("alert-message").innerHTML = "Head Office Address: Only alphanumeric allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("headofficeaddress").focus();
     return false;
            } else
        if(document.getElementById("headofficeaddress").value.length>150){
                         document.getElementById("alert-message").innerHTML = "Head Office Address: Only 150 Characters allowed";
    $('#show-alert').modal('show')
           
           document.getElementById("headofficeaddress").focus();
           
           return false;
       }
       } 
       
        if(document.getElementById("officeaddress").value!=""){
           
           if(!document.getElementById("officeaddress").value.match(/^[a-zA-Z:,'-'' '\.0-9\n]+$/)){
                     document.getElementById("alert-message").innerHTML = "Office Address: Only alphanumeric allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("officeaddress").focus();
     return false;
            } else
        if(document.getElementById("officeaddress").value.length>150){
                         document.getElementById("alert-message").innerHTML = "Office Address:: Only 150 Characters allowed";
    $('#show-alert').modal('show')
           
           document.getElementById("officeaddress").focus();
           
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
        if(document.getElementById("notes").value.length>2000){
                         document.getElementById("alert-message").innerHTML = "Notes: Only 2000 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("notes").focus();
           
           return false;
       }
       }
       
       $('#modal-default').modal('show')
   
   return true;
   }
                function detailForm(){
                    
                    if(document.getElementById("ownerdetails").value!=""){
           if(!document.getElementById("ownerdetails").value.match(/^[0-9 a-z.A-Z]+$/)){
           document.getElementById("alert-message").innerHTML = "Owner Details: Only alphanumeric allowed";
            $('#show-alert').modal('show')
           //alert("Only alphanumeric allowed");
           document.getElementById("ownerdetails").focus();
           return false;
            } else
           if(document.getElementById("ownerdetails").value.length>45){
           document.getElementById("alert-message").innerHTML = "Owner Details: Only 45 Characters allowed";
            $('#show-alert').modal('show')
           document.getElementById("ownerdetails").focus();
           return false;
           }
          }
               if(document.getElementById("companystatus").value!=""){
           if(!document.getElementById("companystatus").value.match(/^[0-9 a-z.A-Z]+$/)){
           document.getElementById("alert-message").innerHTML = "Company Status: Only alphanumeric allowed";
            $('#show-alert').modal('show')
           //alert("Only alphanumeric allowed");
           document.getElementById("companystatus").focus();
           return false;
            } else
           if(document.getElementById("companystatus").value.length>45){
           document.getElementById("alert-message").innerHTML = "Company Status: Only 45 Characters allowed";
            $('#show-alert').modal('show')
           document.getElementById("companystatus").focus();
           return false;
       }
       }
             if(document.getElementById("branchlocation").value!=""){
           if(!document.getElementById("branchlocation").value.match(/^[0-9 a-z.A-Z]+$/)){
           document.getElementById("alert-message").innerHTML = "Branch Location: Only alphanumeric allowed";
            $('#show-alert').modal('show')
           //alert("Only alphanumeric allowed");
           document.getElementById("branchlocation").focus();
           return false;
            } else
           if(document.getElementById("branchlocation").value.length>45){
           document.getElementById("alert-message").innerHTML = "Branch Location: Only 45 Characters allowed";
            $('#show-alert').modal('show')
           document.getElementById("branchlocation").focus();
           return false;
       }
       }             
              if(document.getElementById("businesstype").value!=""){
           if(!document.getElementById("businesstype").value.match(/^[0-9 a-z.A-Z]+$/)){
           document.getElementById("alert-message").innerHTML = "Type Of Business: Only alphanumeric allowed";
            $('#show-alert').modal('show')
           //alert("Only alphanumeric allowed");
           document.getElementById("businesstype").focus();
           return false;
            } else
           if(document.getElementById("businesstype").value.length>45){
           document.getElementById("alert-message").innerHTML = "Type Of Business: Only 45 Characters allowed";
            $('#show-alert').modal('show')
           document.getElementById("businesstype").focus();
           return false;
       }
       }            
                         
               if(document.getElementById("totalemployee").value!=""){
           if(!document.getElementById("totalemployee").value.match(/^[0-9]+$/)){
           document.getElementById("alert-message").innerHTML = "No. of Employees: Only number allowed";
            $('#show-alert').modal('show')
           //alert("Only alphanumeric allowed");
           document.getElementById("totalemployee").focus();
           return false;
            } else
           if(document.getElementById("totalemployee").value.length>45){
           document.getElementById("alert-message").innerHTML = "No. of Employees: Only 45 number allowed";
            $('#show-alert').modal('show')
           document.getElementById("totalemployee").focus();
           return false;
       }
       }           
               if(document.getElementById("yearofestablished").value!=""){
           if(!document.getElementById("yearofestablished").value.match(/^[0-9]+$/)){
           document.getElementById("alert-message").innerHTML = "Year Of Established: Only number allowed";
            $('#show-alert').modal('show')
           //alert("Only alphanumeric allowed");
           document.getElementById("yearofestablished").focus();
           return false;
            } else
           if(document.getElementById("yearofestablished").value.length>45){
           document.getElementById("alert-message").innerHTML = "Year Of Established: Only 45 digit allowed";
            $('#show-alert').modal('show')
           document.getElementById("yearofestablished").focus();
           return false;
       }
       }           
                if(document.getElementById("grossannualturnover").value!=""){
           if(!document.getElementById("grossannualturnover").value.match(/^[0-9 a-z.A-Z]+$/)){
           document.getElementById("alert-message").innerHTML = "Gross Annual Turnover: Only alphanumeric allowed";
            $('#show-alert').modal('show')
           //alert("Only alphanumeric allowed");
           document.getElementById("grossannualturnover").focus();
           return false;
            } else
           if(document.getElementById("grossannualturnover").value.length>45){
           document.getElementById("alert-message").innerHTML = "Gross Aannual Turnover: Only 45 Characters allowed";
            $('#show-alert').modal('show')
           document.getElementById("grossannualturnover").focus();
           return false;
       }
       }          
                if(document.getElementById("annualexportturnover").value!=""){
           if(!document.getElementById("annualexportturnover").value.match(/^[0-9 a-z.A-Z]+$/)){
           document.getElementById("alert-message").innerHTML = "Annual Export Turnover: Only alphanumeric allowed";
            $('#show-alert').modal('show')
           //alert("Only alphanumeric allowed");
           document.getElementById("annualexportturnover").focus();
           return false;
            } else
           if(document.getElementById("annualexportturnover").value.length>45){
           document.getElementById("alert-message").innerHTML = "Annual Export Turnover: Only 45 Characters allowed";
            $('#show-alert').modal('show')
           document.getElementById("annualexportturnover").focus();
           return false;
       }
       } 
                 $('#modal-about1').modal('show')
              
                    
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
