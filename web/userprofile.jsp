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
  <title> User Profile | INDSAC CRM</title>
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
              <img class="profile-user-img img-responsive img-circle" src="dist/img/up1.png" alt="User profile picture">

              <h3 class="profile-username text-center">Neha Choudhary</h3>

              <p class="text-muted text-center">Software Developer</p>

              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <strong><i class="fa fa-university margin-r-5"></i>Department</strong>

              <p class="text-muted">
                IT
              </p>
                </li>

                <li class="list-group-item">
                  <strong><i class="fa fa-diamond margin-r-5"></i>Manager</strong>

              <p class="text-muted">
            xyz 
              </p>
                </li>

                <li class="list-group-item">
                  <strong><i class=" fa fa-cube margin-r-5"></i>Projects</strong>

                  <p class="text-muted">
                    CRM 
                  </p>
                </li>

                <li class="list-group-item">
                  <strong><i class="fa fa-mortar-board margin-r-5"></i>Designation</strong>

              <p class="text-muted">
                Java Developer
              </p>
                </li>

              </li>

              <li class="list-group-item">
                <strong><i class="fa  fa-calendar-check-o margin-r-5"></i>Years of Experience</strong>

            <p class="text-muted">
            3.5 Yreas
            </p>
              </li>

              <li class="list-group-item">
                <strong><i class=" fa fa-edit margin-r-5"></i>Skills</strong>

            <p class="text-muted">
          Coding , Designe, Testing
            </p>
              </li>

                <li class="list-group-item">
                <strong><i class="fa fa-envelope margin-r-5"></i> Email </strong>

              <p class="text-muted">
               nehachaudhari1398@gmail.com
              </p>
            </li>

            <li class="list-group-item">
              <strong><i class="fa fa-mobile margin-r-5"></i> Mobile No </strong>

            <p class="text-muted">
          799814068
            </p>
          </li>

                <li class="list-group-item">
                <strong><i class="fa fa-map-marker margin-r-5"></i> Location</strong>

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
              <li class="active"><a href="#general" data-toggle="tab">General</a></li>
              <li><a href="#about" data-toggle="tab">About</a></li>
              
              <li><a href="#settings" data-toggle="tab">Settings</a></li>
            </ul>
            <div class="tab-content">
              <div class="active tab-pane" id="general">
                
                <form class="form-horizontal" method="post" action="UserProfileSubmit">
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">First Name<span style="color:red">*</span></label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="firstname"  name="firstname" placeholder="Frist Name">
                    </div>
                  </div>
  
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Last Name<span style="color:red">*</span></label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Last Name">
                    </div>
                  </div>
  
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">Email</label>
  
                    <div class="col-sm-10">
                      <input type="email" class="form-control" id="email" name="email" placeholder="Email">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Gender</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="gender" name="gender" placeholder="Gender">
                    </div>
                  </div>
                  
                    <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Date Of Birth</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="dob" name="dob" placeholder="Date Of Births">
                    </div>
                  </div>
                    
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">Phone</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="phone" name="phone" placeholder="Phone">
                    </div>
                  </div>
  
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">Mobile No<span style="color:red">*</span></label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="mobileno" name="mobileno" placeholder="Mobile No">
                    </div>
                  </div>
  
                  <div class="form-group">
                    <label for="inputExperience" class="col-sm-2 control-label">Address</label>
  
                    <div class="col-sm-10">
                      <textarea class="form-control" id="address" name="address" placeholder="Address"></textarea>
                    </div>
                  </div>
  
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">City</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="city" name="city" placeholder="City">
                    </div>
                  </div>
  
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">State</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="state" name="state" placeholder="State">
                    </div>
                  </div>
  
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">Country</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="country" name="country" placeholder="Country">
                    </div>
                  </div>
  
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">Zip Code</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="zipcode" name="zipcode" placeholder="Zip Code">
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
                      <button type="button" class="btn btn-danger" onClick="return validateForm()">Submit</button>
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
                          <div class="modal-footer">
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save</button>
                          </div>
                        </div>
                        <!-- /.modal-content -->
                      </div>
                    
                    </div>
                  </div>
                </form>

                
              </div>
              <!-- /.tab-pane -->
              <div class="tab-pane" id="about">
                <!-- The timeline -->
                
                <form class="form-horizontal">
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">Manager</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputSkills" placeholder="Manager">
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Project</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputName" placeholder="Project">
                    </div>
                  </div>

                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">Designation</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputEmail" placeholder="Designation">
                    </div>
                  </div>

                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Years of Experience</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputName" placeholder="Years of Experience">
                    </div>
                  </div>


                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Skills</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputName" placeholder="Skills">
                    </div>
                  </div>
  
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modal-about1">Submit</button>
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
                          <div class="modal-footer">
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save </button>
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
                <form class="form-horizontal">

                  <div class="box box-info">
                    <div class="box-header">
                     <a class="box-title">Change Password Settings</a>
                    </div>

                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">New Paasword</label>

                    <div class="col-sm-6">
                      <input type="text" class="form-control" id="inputName" placeholder="New Paasword">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Confirm Password</label>

                    <div class="col-sm-6">
                      <input type="text" class="form-control" id="inputEmail" placeholder="Confirm Password">
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
                     <a  class="box-title">Profile Photo </a>
                     <a  href="selectavatar.jsp" class="btn btn-info pull-right">Select Avatar </a>
                    </div>

                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">Upload Profile Photo</label>
                    <input type="file" id="exampleInputFile">
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
                </form>
              </div>
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
        function validateForm(){
            
        if(document.getElementById("firstname").value==""){
   
            document.getElementById("alert-message").innerHTML = "First Name: Cannot be empty";
    $('#show-alert').modal('show')
       document.getElementById("firstname").focus();
           return false;
        }else 
            if(document.getElementById("firstname").value!=""){
            if(document.getElementById("firstname").value.length>45){
            document.getElementById("alert-message").innerHTML = "First Name: Only 45 Characters allowed";
    $('#show-alert').modal('show')
           document.getElementById("firstname").focus();
           
           return false;
       }else           
           if(!document.getElementById("firstname").value.match(/^[0-9 a-z.A-Z]+$/)){
              document.getElementById("alert-message").innerHTML = "First Name: Only alphanumeric allowed";
    $('#show-alert').modal('show')
           
           document.getElementById("firstname").focus();
     return false;
            } 
        } 
       
   if(document.getElementById("lastname").value==""){
   
            document.getElementById("alert-message").innerHTML = "Last Name: Cannot be empty";
    $('#show-alert').modal('show')
       document.getElementById("lastname").focus();
           return false;
        }else 
            if(document.getElementById("lastname").value!=""){
            if(document.getElementById("lastname").value.length>45){
            document.getElementById("alert-message").innerHTML = "Last Name: Only 45 Characters allowed";
    $('#show-alert').modal('show')
           document.getElementById("lastname").focus();
           
           return false;
       }else           
           if(!document.getElementById("lastname").value.match(/^[0-9 a-z.A-Z]+$/)){
              document.getElementById("alert-message").innerHTML = "Last Name: Only alphanumeric allowed";
    $('#show-alert').modal('show')
           
           document.getElementById("lastname").focus();
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
    
   if(document.getElementById("gender").value!=""){
           
           if(!document.getElementById("gender").value.match(/^[0-9 a-z.A-Z]+$/)){
                     document.getElementById("alert-message").innerHTML = "Gender: Only  alphanumeric allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("gender").focus();
     return false;
            } else
        if(document.getElementById("gender").value.length>45){
                         document.getElementById("alert-message").innerHTML = "Gender: Only 45 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("gender").focus();
           
           return false;
       }
      }
       
       if(document.getElementById("dob").value!=""){
           
           if(!document.getElementById("dob").value.match(/^[0-9 /]+$/)){
                     document.getElementById("alert-message").innerHTML = "Date Of Birth: Only  alphanumeric allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("dob").focus();
     return false;
            } else
        if(document.getElementById("dob").value.length>45){
                         document.getElementById("alert-message").innerHTML = "Date Of Birth: Only 45 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("dob").focus();
           
           return false;
       }
      }
     
    if(document.getElementById("phone").value!=""){
           
           if(!document.getElementById("phone").value.match(/^[0-9]+$/)){
                     document.getElementById("alert-message").innerHTML = "Phone: Only  digit allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("phone").focus();
     return false;
            } else
        if(document.getElementById("phone").value.length>15){
                         document.getElementById("alert-message").innerHTML = "Phone: Only 15 digit allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("phone").focus();
           
           return false;
       }
       }
       
        if(document.getElementById("address").value!=""){
           
           if(!document.getElementById("address").value.match(/^[a-zA-Z:,'-'' '\.0-9\n]+$/)){
                     document.getElementById("alert-message").innerHTML = "Address: Only alphanumeric allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("address").focus();
     return false;
            } else
        if(document.getElementById("address").value.length>45){
                         document.getElementById("alert-message").innerHTML = "Address:Only 45 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("address").focus();
           
           return false;
       } 
     }
     
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
       }
      }
      
      if(document.getElementById("zipcode").value!=""){
           
           if(!document.getElementById("zipcode").value.match(/^[0-9]+$/)){
                     document.getElementById("alert-message").innerHTML = "Zipcode: Only digits allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("zipcode").focus();
     return false;
            } else
        if(document.getElementById("zipcode").value.length>10){
                         document.getElementById("alert-message").innerHTML = "Zipcode:Only 10 digits allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("zipcode").focus();
           
           return false;
       }
       }
       
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
      
       if(document.getElementById("state").value!=""){
           
           if(!document.getElementById("state").value.match(/^[a-zA-Z:,'-'' '\.0-9\n]+$/)){
                     document.getElementById("alert-message").innerHTML = "State: Only alphanumeric allowed";
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
       }
       }
             $('#modal-default').modal('show')
      
      if(document.getElementById("notes").value!=""){
           
           if(!document.getElementById("notes").value.match(/^[a-zA-Z:,'-'' '\.0-9\n]+$/)){
                     document.getElementById("alert-message").innerHTML = "Notes: Only alphanumeric allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("notes").focus();
     return false;
            } else
        if(document.getElementById("notes").value.length>45){
                         document.getElementById("alert-message").innerHTML = "Notes: Only 45 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("notes").focus();
           
           return false;
       }
      }
         
         
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
