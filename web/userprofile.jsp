
<%@page import="menu.UserProfileService"%>
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
    
                   String userProfileData[]=UserProfileService.getUserProfile(usercid_adminid);
                           
                    String warningmsg="",successmsg="";
                    String msgurl=request.getParameter("message");
                    if("succesfulyUploaded".equals(msgurl)){successmsg="Uploaded  Successfully";}
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
              <img class="profile-user-img img-responsive img-circle"
                 <%  String logo=menu.UserProfileService.getUserProfileLogo(usercid_adminid);
                 if("0".equals(logo) || "".equals(logo)) {     %>
                 <img class="img-responsive" src="dist/img/u.png" alt="Photo">
                 <% }else{  %>
                 <img class="img-responsive" src="uploads/logo/<%=logo %>" alt="Photo" width="80" height="80">  
                  <% } %>
                       
              <h3 class="profile-username text-center">
                  <% if( userProfileData[6]!=null && !userProfileData[6].equals("") && !userProfileData[6].equals("null") ){  
                  out.println(userProfileData[6]);
                  } else { %>
                  First Name
                 <% }  %>
              </h3>

              <p class="text-muted text-center">
                  <% if( userProfileData[33]!=null && !userProfileData[33].equals("") && !userProfileData[33].equals("null") ){  
                   out.println(userProfileData[33]);
                  } else { %>
                  City
                  <% }  %>
              </p>

              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <strong><i class="fa fa-university margin-r-5"></i>Department</strong><br>
                 <% if( userProfileData[8]!=null && !userProfileData[8].equals("") && !userProfileData[8].equals("null") ){  
                  out.println(userProfileData[8]);
                  } else { %>
                  Department
                  <% }  %>
                </li>

                <li class="list-group-item">
                    <strong><i class="fa fa-diamond margin-r-5"></i>Manager</strong><br>
                    <% if( userProfileData[14]!=null && !userProfileData[14].equals("") && !userProfileData[14].equals("null") ){  
                  out.println(userProfileData[14]);
                  } else { %>
                  Manager
                  <% }  %>
                </li>

                <li class="list-group-item">
                  <strong><i class=" fa fa-cube margin-r-5"></i>Projects</strong><br>
                  <% if( userProfileData[21]!=null && !userProfileData[21].equals("") && !userProfileData[21].equals("null") ){  
                  out.println(userProfileData[21]);
                  } else { %>
                  Projects
                  <% }  %>
                </li>

                <li class="list-group-item">
                    <strong><i class="fa fa-mortar-board margin-r-5"></i>Designation</strong><br>
                 <% if( userProfileData[9]!=null && !userProfileData[9].equals("") && !userProfileData[9].equals("null") ){  
                  out.println(userProfileData[9]);
                  } else { %>
                  Designation
                  <% }  %>
                </li>
              </li>

              <li class="list-group-item">
                  <strong><i class="fa  fa-calendar-check-o margin-r-5"></i>Years of Experience</strong><br>
                  <% if( userProfileData[24]!=null && !userProfileData[24].equals("") && !userProfileData[24].equals("null") ){  
                  out.println(userProfileData[24]);
                  } else { %>
                  Years of Experience
                  <% }  %>
              </li>

              <li class="list-group-item">
                  <strong><i class=" fa fa-edit margin-r-5"></i>Skills</strong><br>
                  <% if( userProfileData[26]!=null && !userProfileData[26].equals("") && !userProfileData[26].equals("null") ){  
                  out.println(userProfileData[26]);
                  } else { %>
                  Skills
                  <% }  %>
              </li>

                <li class="list-group-item">
                  <strong><i class="fa fa-envelope margin-r-5"></i> Email </strong><br>
                  <% if( userProfileData[4]!=null && !userProfileData[4].equals("") && !userProfileData[4].equals("null") ){  
                  out.println(userProfileData[4]);
                  } else { %>
                  Email
                  <% }  %>
            </li>

            <li class="list-group-item">
                <strong><i class="fa fa-mobile margin-r-5"></i> Mobile No </strong><br>
                <% if( userProfileData[20]!=null && !userProfileData[20].equals("") && !userProfileData[20].equals("null") ){  
                out.println(userProfileData[20]);
                } else { %>
                Mobile No
                <% }  %>
           </li>

                <li class="list-group-item">
                    <strong><i class="fa fa-map-marker margin-r-5"></i> City </strong><br>
                    <% if( userProfileData[33]!=null && !userProfileData[33].equals("") && !userProfileData[33].equals("null") ){  
                    out.println(userProfileData[33]);
                    } else { %>
                   City
                   <% }  %>
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
              <li><a href="#email settings" data-toggle="tab">Email Settings</a></li>
              <li><a href="" data-toggle="tab">History</a></li>
            </ul>
            <div class="tab-content">
              <div class="active tab-pane" id="general">
                
                <form class="form-horizontal" method="post" action="UserProfileSubmit">
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">First Name<span style="color:red">*</span></label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="firstname"  name="firstname"
                      <% if( userProfileData[6]!=null && !userProfileData[6].equals("") && !userProfileData[6].equals("null") ){
                      out.println("placeholder=\""+userProfileData[6]+"\" value=\""+userProfileData[6]+"\">");
                      } else { %>placeholder="Frist Name">
                      <% }  %>   
                    </div>
                  </div>
 
  
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">Email</label>
  
                    <div class="col-sm-10">
                      <input type="email" class="form-control" id="email" name="email" disabled=""
                     <% if( userProfileData[4]!=null && !userProfileData[4].equals("") && !userProfileData[4].equals("null") ){
                  out.println("placeholder=\""+userProfileData[4]+"\" value=\""+userProfileData[4]+"\">");
                  } else { %>placeholder="Email">
                        <% }  %>      
                    </div>
                  </div>
                    
                <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">Phone</label>
  
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="phone" name="phone"
                        <% if( userProfileData[22]!=null && !userProfileData[22].equals("") && !userProfileData[22].equals("null") ){
                        out.println("placeholder=\""+userProfileData[22]+"\" value=\""+userProfileData[22]+"\">");
                        } else { %>placeholder="Phone">
                        <% }  %>    
                    </div>
                  </div>
  
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">Mobile No<span style="color:red">*</span></label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="mobileno" name="mobileno"
                      <% if( userProfileData[20]!=null && !userProfileData[20].equals("") && !userProfileData[20].equals("null") ){
                   out.println("placeholder=\""+userProfileData[20]+"\" value=\""+userProfileData[20]+"\">");
                  } else { %>placeholder="Mobile No">
                            <% }  %> 
                    </div>
                  </div>
  
                  <div class="form-group">
                    <label for="inputExperience" class="col-sm-2 control-label">Address</label>
  
                    <div class="col-sm-10">
                       <% if( userProfileData[30]!=null && !userProfileData[30].equals("") && !userProfileData[30].equals("null") ){  %>
                      <textarea class="form-control" id="address" name="address"> <%=userProfileData[30]  %> </textarea>
                      <%  } else { %><textarea class="form-control" id="address" name="address" placeholder="Address"></textarea>
                      <% }  %>
                    </div>
                  </div>
  
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">City</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="city" name="city"
                            <% if( userProfileData[33]!=null && !userProfileData[33].equals("") && !userProfileData[33].equals("null") ){
                   out.println("placeholder=\""+userProfileData[33]+"\" value=\""+userProfileData[33]+"\">");
                  } else { %>placeholder="City">
                             <% }  %>
                    </div>
                  </div>
  
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">State</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="state" name="state"
                             <% if( userProfileData[35]!=null && !userProfileData[35].equals("") && !userProfileData[35].equals("null") ){
                   out.println("placeholder=\""+userProfileData[35]+"\" value=\""+userProfileData[35]+"\">");
                  } else { %>placeholder="State">
                           <% }  %>  
                    </div>
                  </div>
  
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">Country</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="country" name="country"
                             <% if( userProfileData[36]!=null && !userProfileData[36].equals("") && !userProfileData[36].equals("null") ){
                   out.println("placeholder=\""+userProfileData[36]+"\" value=\""+userProfileData[36]+"\">");
                  } else { %>placeholder="Country">
                           <% }  %>   
                    </div>
                  </div>
  
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">Zip Code</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="zipcode" name="zipcode"
                   <% if( userProfileData[34]!=null && !userProfileData[34].equals("") && !userProfileData[34].equals("null") ){
                   out.println("placeholder=\""+userProfileData[34]+"\" value=\""+userProfileData[34]+"\">");
                  } else { %>placeholder="Zip Code"> 
                          <% }  %>    
                    </div>
                  </div>
                    
                   <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label" >Notes</label>

                  <div class="col-sm-10" >
                 <% if( userProfileData[37]!=null && !userProfileData[37].equals("") && !userProfileData[37].equals("null") ){  %>
                  <textarea class="form-control" id="notes" name="notes" > <%=userProfileData[37]  %> </textarea>
                 <%  } else { %><textarea class="form-control" id="notes" name="notes" placeholder="Notes"></textarea> 
                           <% }  %>                   
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
                            <input type="hidden" name="useradminid" value="<%=usercid_adminid  %>">
                            <input type="hidden" name="usercid" value="<%=usercid_id  %>">
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
                
                <form class="form-horizontal" method="post" >
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">Manager</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="manager" name="manager" 
                      <% if( userProfileData[14]!=null && !userProfileData[14].equals("") && !userProfileData[14].equals("null") ){
                   out.println("placeholder=\""+userProfileData[14]+"\" value=\""+userProfileData[14]+"\">");
                  } else { %>placeholder="Manager">
                         <% }  %>     
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Project</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="project" name="project"
                   <% if( userProfileData[21]!=null && !userProfileData[21].equals("") && !userProfileData[21].equals("null") ){
                   out.println("placeholder=\""+userProfileData[21]+"\" value=\""+userProfileData[21]+"\">");
                  } else { %>placeholder="Project">
                         <% }  %>     
                    </div>
                  </div>

                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">Designation</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="designation" name="designation"
                      <% if( userProfileData[9]!=null && !userProfileData[9].equals("") && !userProfileData[9].equals("null") ){
                   out.println("placeholder=\""+userProfileData[9]+"\" value=\""+userProfileData[9]+"\">");
                  } else { %>placeholder="Designation">        
                       <% }  %>       
                    </div>
                  </div>
                    
                    <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">Department</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="department" name="department" 
                      <% if( userProfileData[8]!=null && !userProfileData[8].equals("") && !userProfileData[8].equals("null") ){
                   out.println("placeholder=\""+userProfileData[8]+"\" value=\""+userProfileData[8]+"\">");
                  } else { %>placeholder="Department">       
                          <% }  %>    
                    </div>
                  </div>
                </form> 
                    
                    <div class="box box-info">
                  <form method="post" class="form-horizontal" action="UserAboutSubmit" > 

                        <div class="box-header"></div>
                    
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Years of Experience</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="yearsofexperience" name="yearsofexperience"
                      <% if( userProfileData[24]!=null && !userProfileData[24].equals("") && !userProfileData[24].equals("null") ){
                   out.println("placeholder=\""+userProfileData[24]+"\" value=\""+userProfileData[24]+"\">");
                  } else { %>placeholder="Years of Experience">       
                        <% }  %>     
                    </div>
                  </div>


                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Skills</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="skills" name="skills"
                         <% if( userProfileData[26]!=null && !userProfileData[26].equals("") && !userProfileData[26].equals("null") ){
                   out.println("placeholder=\""+userProfileData[26]+"\" value=\""+userProfileData[26]+"\">");
                  } else { %>placeholder="Skills">   
                       <% }  %>      
                    </div>
                  </div>
  
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="button" class="btn btn-danger" onClick="return aboutForm()">
                          Submit</button><br><br>
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
                            <button type="submit" class="btn btn-primary">Save </button>
                          </div>
                        </div>
                        <!-- /.modal-content -->
                      </div>
                    </div>
                  </div>
                 </form>  
               </div>
         </div>
              <!-- /.tab-pane -->
<!-- /.tab-pane -->
              
              <!-- /.tab-pane -->
              <div class="tab-pane" id="settings">
                

                  <div class="box box-info">
                      <form class="form-horizontal" >
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
                      <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modal-setting">
                      Submit
                      </button><br><br>
                    </div>
                    <div class="modal fade" id="modal-setting">
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
                 
                  <div class="box box-info">
                <form class="form-horizontal" action="Fileupload" method="post" enctype="multipart/form-data">
                    <div class="box-header">

                     <a  class="box-title">Profile Photo </a>
                     <a  href="selectavatar.jsp" class="btn btn-info pull-right">Select Avatar </a>
                    </div>
 
            <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">Upload Profile Photo</label>
                     <input type="hidden" class="form-control"  name="general"  value="<%=Nd.Encrypt(userProfileData[1]) %>" >
                    <input type="hidden" class="form-control"  name="type"  value="userprofile" >
                    <input type="file" name="receipt"  required><br>
                   </div>
          <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="button" class="btn btn-danger" onclick="return processing()">
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
                            <button type="submit" class="btn btn-primary" >Save  </button>
                          </div>
                        </div>
                        <!-- /.modal-content -->
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
 
}   
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
           
           if(!document.getElementById("city").value.match(/^[0-9 a-z.A-Z]+$/)){
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
           
           if(!document.getElementById("country").value.match(/^[0-9 a-z.A-Z]+$/)){
                     document.getElementById("alert-message").innerHTML = "Country: Only alphanumeric allowed";
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
                    $('#modal-default').modal('show')    
   return true;
   }
   
                    function aboutForm(){
                        
            if(document.getElementById("yearsofexperience").value!=""){
           
           if(!document.getElementById("yearsofexperience").value.match(/^[0-9]+$/)){
                     document.getElementById("alert-message").innerHTML = "Years of Experience: Only  number allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("yearsofexperience").focus();
     return false;
            } else
        if(document.getElementById("yearsofexperience").value.length>15){
                         document.getElementById("alert-message").innerHTML = "Years of Experience: Only 15 digit allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("yearsofexperience").focus();
           
           return false;
       }
      }
      
        if(document.getElementById("skills").value!=""){
           
           if(!document.getElementById("skills").value.match(/^[0-9 a-z.A-Z + . #]+$/)){
                     document.getElementById("alert-message").innerHTML = "Skills: Only  alphanumeric allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("skills").focus();
     return false;
            } else
        if(document.getElementById("skills").value.length>45){
                         document.getElementById("alert-message").innerHTML = "Skills: Only 45 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("skills").focus();
           
           return false;
       }
      }
                      
                      $('#modal-about1').modal('show')  
                      
                      return true;   
                        
                    }

</script> 


<script>
    function processing()  
{ 
   $('#waitingdisplay').modal('show') 
   document.addEventListener("contextmenu", function(e){
    
        e.preventDefault();
   
}, false);
                $('#modal-setting1').modal('show')
    
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
