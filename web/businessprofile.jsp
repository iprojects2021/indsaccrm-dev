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
%>
   

      <%    String pagetype=Poul.escapeHtml(request.getParameter("pagetype"));
        String cid=request.getParameter("2a2e2a636964");
        if(cid!=null){cid=Nd.Decrypt(cid);}
      if("truece".equals(pagetype)){
          
          
      
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
          String    previousnotes=Poul.escapeHtml(request.getParameter("previousnotes"));
  if(notes.length()>0){notes="**"+Db.getEmployeeName(usercid_id)+"******"+java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"*******\n"+notes+"\n\n"+previousnotes;}
    else{notes=previousnotes;}
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
               rs3 = st.executeQuery("select  *  FROM contact where id='"+cid+"'  ");
 ResultSetMetaData rsmd=rs3.getMetaData();
     String aa="null",ab="null",ac="null",ad="null",ae="null",af="null",ag="null",ah="null",ai="null",aj="null",ak="null",all="null",am="null",an="null",ao="null",app="null",aq="null",ar="null",as="null",at="null",au="null",av="null",aw="null",ax="null",ay="null",az="null",ba="null",bb="null",bc="null",bd="null",be="null",bf="null",bg="null",bh="null",bi="null",bj="null",bk="null",bl="null";
          aa=rsmd.getColumnName(1);
           ab=rsmd.getColumnName(2);
            ac=rsmd.getColumnName(3);
             ad=rsmd.getColumnName(4);
              ae=rsmd.getColumnName(5);
               af=rsmd.getColumnName(6);
                ag=rsmd.getColumnName(7);
                 ah=rsmd.getColumnName(8);
                  ai=rsmd.getColumnName(9);
                   aj=rsmd.getColumnName(10);
                    ak=rsmd.getColumnName(11);
                     all=rsmd.getColumnName(12);
                      am=rsmd.getColumnName(13);
                       an=rsmd.getColumnName(14);
                        ao=rsmd.getColumnName(15);
                         app=rsmd.getColumnName(17);
                          aq=rsmd.getColumnName(18);
                           ar=rsmd.getColumnName(19);
                            as=rsmd.getColumnName(20);
                             at=rsmd.getColumnName(21);
                              au=rsmd.getColumnName(22);
                              av=rsmd.getColumnName(23);
                                aw=rsmd.getColumnName(24);
                       ax=rsmd.getColumnName(25);
                        ay=rsmd.getColumnName(26);
                         az=rsmd.getColumnName(27);
                          ba=rsmd.getColumnName(28);
                           bb=rsmd.getColumnName(29);
                            bc=rsmd.getColumnName(30);
                             bd=rsmd.getColumnName(31);
                              be=rsmd.getColumnName(32);
                              bf=rsmd.getColumnName(33);
                               bg=rsmd.getColumnName(34);
                            bh=rsmd.getColumnName(35);
                             bi=rsmd.getColumnName(36);
                              bj=rsmd.getColumnName(37);
                              bk=rsmd.getColumnName(38);
                              bl=rsmd.getColumnName(39);
                             
               
  st.addBatch("update contact set   "+ae+"='"+cn+"',"+af+"='"+cfn+"',"+ag+"='"+cln+"',"+ah+"='"+department+"',"+ai+"='"+designation+"',"+aj+"='"+dob+"',"+ak+"='"+category+"',"+all+"='"+sc+"',"+am+"='"+status+"',"+an+"='"+rt+"',"+ao+"='"+source+"',"+app+"='"+vn+"',"+aq+"='"+website+"',"+ar+"='"+bwtc+"',"+as+"='"+mobile+"',"+at+"='"+ap+"',"+au+"='"+phone+"',"+av+"='"+email+"',"+aw+"='"+oe+"',"+ax+"='"+fax+"',"+ay+"='"+oai+"',"+az+"='"+oai1+"',"+ba+"='"+oai2+"',"+bb+"='"+oai3+"',"+bc+"='"+address1+"',"+bd+"='"+address2+"',"+be+"='"+address3+"',"+bf+"='"+city+"',"+bg+"='"+pincode+"',"+bh+"='"+state+"',"+bi+"='"+country+"',"+bj+"='"+notes+"',"+bk+"='"+gstin+"'   where id='"+cid+"'");
  
            
       st.executeBatch(); 
        
        session.setAttribute("requestcid",cid);
        
             msg="success";    
       
     rs3.close();
      st.close();
      c.close();    }
        catch(Exception e)
        {
                String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n contactedit.jsp-----\n"
     + "LINE=177 \n select  *  FROM contact where id='"+cid+"'   ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
        }
        finally{
        
          if(msg.equals("success")){
        response.sendRedirect("contactdetails.jsp");
            }else{
               response.sendRedirect("error.jsp");
            }
               
            
        }
    
      } %>
    
    <%
          ArrayList<String> al=new ArrayList<String>();
        
       
       try{
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from contact where id=?");
        smt.setString(1,cid);
        ResultSet rs=smt.executeQuery();
        while(rs.next()){
            for(int i=1;i<49;i++){
               al.add(rs.getString(i)); 
            }
        }
       rs.close();
      smt.close();
      con.close();  
       }
        catch(Exception e)
        {
            String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n contactedit.jsp---"
           + "\n LINE=216 \n"+" select * from contact where id="+cid+"  ";
         Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
       EmergencyEmail.send(e,errormsg);
          
                
                }
       //System.out.println(al.size());
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
                
                <form class="form-horizontal">
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Business Name</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputName" placeholder=" Business Name">
                    </div>
                  </div>
  
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label"> Business Email</label>
  
                    <div class="col-sm-10">
                      <input type="email" class="form-control" id="inputEmail" placeholder=" Business Email">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Website</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputName" placeholder="Website">
                    </div>
                  </div>
                  
                    
                    
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">Telephone No</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputSkills" placeholder="Telephone No">
                    </div>
                  </div>
  
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">Mobile No</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputSkills" placeholder="Mobile No">
                    </div>
                  </div>
  
                  <div class="form-group">
                    <label for="inputExperience" class="col-sm-2 control-label">Head Office Address</label>
  
                    <div class="col-sm-10">
                      <textarea class="form-control" id="inputExperience" placeholder="Head Office Address"></textarea>
                    </div>
                  </div>
                    
                    <div class="form-group">
                    <label for="inputExperience" class="col-sm-2 control-label"> Office Address</label>
  
                    <div class="col-sm-10">
                      <textarea class="form-control" id="inputExperience" placeholder="Office Address"></textarea>
                    </div>
                  </div>
  
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">City</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputSkills" placeholder="City">
                    </div>
                  </div>
  
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">State</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputSkills" placeholder="State">
                    </div>
                  </div>
  
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">Country</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputSkills" placeholder="Country">
                    </div>
                  </div>
  
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">Zip Code</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputSkills" placeholder="Zip Code">
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
                      <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modal-default">
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
              <div class="tab-pane" id="businessdetails">
                <!-- The timeline -->
                
                <form class="form-horizontal">
                     <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label"> Person in Charge Details</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputEmail" placeholder=" Person in Charge Details ">
                    </div>
                  </div>
                    
                     <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2  control-label">Company Status</label>

                  <div class="col-sm-10">
                    <select id="status" name="status" class="form-control">
                          <option value="Active"> Active</option>
                        </select></div>
                </div>
                    
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">No. of Branch with Location</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputSkills" placeholder="No. of Branch with Location">
                    </div>
                  </div>
                    
                    <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Type Of Business</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputName" placeholder="Type Of Business">
                    </div>
                  </div>

                 

                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">No. of Employees</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputName" placeholder="No. of Employees">
                    </div>
                  </div>


                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Year Of Established</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputName" placeholder="Year Of Established">
                    </div>
                  </div>
  
                     <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Gross Annual Turnover</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputName" placeholder="Gross Annual Turnover">
                    </div>
                  </div>
                    
                    
                     <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Annual Export Turnover</label>
  
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputName" placeholder="Annual Export Turnover">
                    </div>
                  </div>
                    
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modal-about1">
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
                     <a  class="box-title">Logo Settings </a>
                     <a  href="selectavatar.jsp" class="btn btn-info pull-right">Select Default Logo </a>
                    </div>

                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">Upload Business Logo</label>
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
        if(document.getElementById("mobile").value==""){
                    document.getElementById("alert-message").innerHTML = "Mobile cannot be empty ";
    $('#show-alert').modal('show')
     
           
           document.getElementById("mobile").focus();
           return false;
        }
       
        else if(document.getElementById("mobile").value!=""){
           
           if(!document.getElementById("mobile").value.match(/^[0-9]+$/)){
                          document.getElementById("alert-message").innerHTML = " Mobile :Only numbers allowed ";
    $('#show-alert').modal('show')
     
          
           document.getElementById("mobile").focus();
     return false;
            } 
        if(document.getElementById("mobile").value.length>10){
         document.getElementById("alert-message").innerHTML = " Mobile :Only 10 digits allowed ";
    $('#show-alert').modal('show')
               
           document.getElementById("mobile").focus();
           
           return false;
       }  if(document.getElementById("mobile").value.length<10){
          document.getElementById("alert-message").innerHTML = "Mobile :Only 10 digits allowed  ";
    $('#show-alert').modal('show')
                
           document.getElementById("mobile").focus();
           
           return false;
       }
   }
       
   
       if(document.getElementById("cfn").value==""){
   
            document.getElementById("alert-message").innerHTML = "First name cannot be empty";
    $('#show-alert').modal('show')
       document.getElementById("cfn").focus();
           return false;
        }else if(document.getElementById("cfn").value!=""){
           
           if(!document.getElementById("cfn").value.match(/^[0-9 a-z.A-Z]+$/)){
              document.getElementById("alert-message").innerHTML = "First Name: Only alphanumeric allowed";
    $('#show-alert').modal('show')
           
           document.getElementById("cfn").focus();
     return false;
            } 
        } 
        if(document.getElementById("cfn").value.length>30){
                document.getElementById("alert-message").innerHTML = "First Name :Only 30 Characters allowed";
    $('#show-alert').modal('show')
         
           // alert("Only 30 Characters allowed ");
           document.getElementById("cfn").focus();
           
           return false;
       }
       
       if(document.getElementById("cln").value==""){
   
            document.getElementById("alert-message").innerHTML = "Last name cannot be empty";
    $('#show-alert').modal('show')
       document.getElementById("cln").focus();
           return false;
        }else if(document.getElementById("cln").value!=""){
           
           if(!document.getElementById("cln").value.match(/^[0-9 a-z.A-Z]+$/)){
              document.getElementById("alert-message").innerHTML = "Last Name: Only alphanumeric allowed";
    $('#show-alert').modal('show')
           
           document.getElementById("cln").focus();
     return false;
            } 
        } 
        if(document.getElementById("cln").value.length>30){
                document.getElementById("alert-message").innerHTML = "Last Name: Only 30 Characters allowed";
    $('#show-alert').modal('show')
         
           // alert("Only 30 Characters allowed ");
           document.getElementById("cln").focus();
           
           return false;
       }
       if(document.getElementById("cn").value!=""){
           
           if(!document.getElementById("cn").value.match(/^[0-9 a-z.A-Z]+$/)){
                     document.getElementById("alert-message").innerHTML = "Company Name: Only alphanumeric allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("cn").focus();
     return false;
            } else
        if(document.getElementById("cn").value.length>30){
                         document.getElementById("alert-message").innerHTML = "Company Name: Only 30 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("cn").focus();
           
           return false;
       }}
      
   if(document.getElementById("department").value!=""){
           
           if(!document.getElementById("department").value.match(/^[0-9 a-z.A-Z]+$/)){
                     document.getElementById("alert-message").innerHTML = "Please enter valid department name";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("department").focus();
     return false;
            } else
        if(document.getElementById("department").value.length>30){
                         document.getElementById("alert-message").innerHTML = "Department Name: Only 30 Characters allowed";
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
        if(document.getElementById("designation").value.length>30){
                         document.getElementById("alert-message").innerHTML = "Designation: Only 30 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("designation").focus();
           
           return false;
       }}
     
      
      
    
      
       if(document.getElementById("gstin").value!=""){
           
           if(!document.getElementById("gstin").value.match(/^[0-9A-Z]+$/)){
                     document.getElementById("alert-message").innerHTML = "Please enter valid gstin";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("gstin").focus();
     return false;
            }
        if(document.getElementById("gstin").value.length>15){
                         document.getElementById("alert-message").innerHTML = "GSTIN: Only 15 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("gstin").focus();
           
           return false;
       }
       if(document.getElementById("gstin").value.length<15){
                         document.getElementById("alert-message").innerHTML = " GSTIN: Only 15 Characters allowed";
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
        if(document.getElementById("rt").value.length>30){
                         document.getElementById("alert-message").innerHTML = "Report To: Only 30 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("rt").focus();
           
           return false;
       }}
       
   
        if(document.getElementById("ap").value!=""){
           
            if(!document.getElementById("ap").value.match(/^[0-9]+$/)){
                          document.getElementById("alert-message").innerHTML = "Alternate Mobile :Only numbers allowed ";
    $('#show-alert').modal('show')
     
          
           document.getElementById("ap").focus();
     return false;
            } 
        if(document.getElementById("ap").value.length>10){
         document.getElementById("alert-message").innerHTML = "Alternate Mobile :Only 10 digits allowed ";
    $('#show-alert').modal('show')
               
           document.getElementById("ap").focus();
           
           return false;
       }  if(document.getElementById("ap").value.length<10){
          document.getElementById("alert-message").innerHTML = "Alternate Mobile :Only 10 digits allowed  ";
    $('#show-alert').modal('show')
                
           document.getElementById("ap").focus();
           
           return false;
       }
   }
   
  if(document.getElementById("email").value!=""){
           
           if(!document.getElementById("email").value.match(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/)){
                     document.getElementById("alert-message").innerHTML = "Enter valid email id";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("email").focus();
     return false;
            } else
        if(document.getElementById("email").value.length>30){
                         document.getElementById("alert-message").innerHTML = "Email id: Only 40 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("email").focus();
           
           return false;
       }}
       
        if(document.getElementById("address1").value!=""){
           
           if(!document.getElementById("address1").value.match(/^[a-zA-Z:,'-'' '\.0-9\n]+$/)){
                     document.getElementById("alert-message").innerHTML = "Address1: Only alphanumeric allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("address1").focus();
     return false;
            } else
        if(document.getElementById("address1").value.length>30){
                         document.getElementById("alert-message").innerHTML = "Address1:Only 30 Characters allowed";
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
        if(document.getElementById("address2").value.length>30){
                         document.getElementById("alert-message").innerHTML = "Address2:Only 30 Characters allowed";
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
        if(document.getElementById("address3").value.length>30){
                         document.getElementById("alert-message").innerHTML = "Address3:Only 30 Characters allowed";
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
        if(document.getElementById("city").value.length>30){
                         document.getElementById("alert-message").innerHTML = "City: Only 30 Characters allowed";
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
                         document.getElementById("alert-message").innerHTML = "Pincode:Only 10 digits allowed";
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
        if(document.getElementById("state").value.length>30){
                         document.getElementById("alert-message").innerHTML = "State: Only 30 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("state").focus();
           
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


<script>
$('#dob').calendarsPicker({
dateFormat:'dd/mm/yyyy'
});
</script>
</body>
</html>
