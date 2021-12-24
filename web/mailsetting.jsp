<%@ page isErrorPage="true" %>
<%@page import="blezz.Nd"%>
<%@page import="menu.Email"%>
<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
<%@page import="blezz.Db"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="blezz.Poul"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>     <link rel="shortcut icon" href="dist/img/u.png" type="image/x-icon" /> 
 
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Email Setting | INDSAC CRM</title>
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

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

 
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
        	 String usercid_avatar=(String)session1.getAttribute("usercid_avatar"); 
        
	Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Entering mailsetting.jsp-------------");
   
if (session != null) {
			if (session1.getAttribute("usercid_id") == null) {
				response.sendRedirect("signout.jsp");
			} 
		}

%>

<%
          
        String mailtype=request.getParameter("mailtype");
        String general=request.getParameter("general");
         String mar=request.getParameter("mar");
        String marg=request.getParameter("m");
        
        String mesg="",errormessage="";
       
        if("testemail".equals(mar)){mesg=marg;}
         if("setupdate".equals(mailtype))
         {
             String email=request.getParameter("email");
       String password=request.getParameter("password");
       String confirmpassword=request.getParameter("confirmpassword");
       String outgoing=request.getParameter("outgoing");
       String smtpport=request.getParameter("smtpport");
       String status=request.getParameter("status");
       general=Nd.Decrypt(general);
                    if((password.equals(confirmpassword)))
             {   String activeemail=Email.getActiveEmailFromMailSetting(usercid_adminid, usercid_id);
                if("0".equals(activeemail)){activeemail=email;}
             
                 if("Active".equals(status) && (!email.equals(activeemail)))
                 {errormessage="Other email already have Active status, please disable other email";}
              
                     
              if(Email.checkAnyEmailActive(usercid_adminid, usercid_id)>1)
                {   
                     errormessage="Other email already have Active status";
                     
                 }
             if("".equals(errormessage)){
             java.util.Date date=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime()); 
         String SR="";
        try{
       
Connection c=Poul.getConnectionCRM();
Statement st=c.createStatement();
     
      st.addBatch("update emailsetting set password='"+Nd.Encrypt(password)+"',outgoingserver='"+outgoing+"',port='"+smtpport+"',status='"+status+"' where id='"+general+"'" );
      ResultSet rs3; int i='0';
           rs3 = st.executeQuery("SELECT MAX(Id)FROM emailsettinglog   ");
    while(rs3.next())
        
          {SR=rs3.getString(1);
          
          }
            i = Integer.parseInt( SR ); 
           ++i; 
     st.addBatch("insert into emailsettinglog values('"+i+"','"+sqlTime+"','"+email+"','"+password+"','"+outgoing+"','"+smtpport+"','','"+status+"','"+usercid_adminid+"','"+usercid_id+"','Email Setting Update','"+general+"','','','','','','','')");
     st.executeBatch(); 
           mesg="Updated Successfully";    
       Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Email="+email+", Email Setting Updated Successfully");
        
       rs3.close();
      st.close();
      c.close();  }
        catch(Exception e)
        {
                   String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n newcontact.jsp-----\n"
                  + "LINE=136\n insert into emailsetting values where useradminid="+usercid_adminid+" ";
         Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
       //EmergencyEmail.send(e,errormsg); 
        
        }
        
             }
             }//password and confirm password check
                    else{errormessage="Password and Confirm Password must match";}
        
         }
         
         
       if("mailset".equals(mailtype)){
       String email=request.getParameter("email");
       String password=request.getParameter("password");
       String confirmpassword=request.getParameter("confirmpassword");
       String outgoing=request.getParameter("outgoing");
       String smtpport=request.getParameter("smtpport");
       String status=request.getParameter("status");
             String agreement=request.getParameter("agreetc");
             if((password.equals(confirmpassword)) && "yes".equals(agreement))
             {    if(Email.checkDuplicateEmailSetting(usercid_adminid, email)>0)
                {   
                     errormessage="Email already exist";
                     
                 }
            String activeemail=Email.getActiveEmailFromMailSetting(usercid_adminid, usercid_id);
                if("0".equals(activeemail)){activeemail=email;}
             
                 if("Active".equals(status) && (!email.equals(activeemail)))
                 {errormessage="Other email already have Active status, please disable other email";}
              
              if(Email.checkAnyEmailActive(usercid_adminid, usercid_id)>1)
                {   
                     errormessage="Other email already have Active status";
                     
                 }
             if("".equals(errormessage)){
             java.util.Date date=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime()); 
         String SR="";
        try{
       
Connection c=Poul.getConnectionCRM();



Statement st=c.createStatement();
           ResultSet rs3;
               rs3 = st.executeQuery("SELECT MAX(Id)FROM  emailsetting  ");
    while(rs3.next())
        
          {SR=rs3.getString(1);
          
          }
           int i = Integer.parseInt( SR ); 
           ++i;  String requestcid=Integer.toString(i);
             st.addBatch("insert into emailsetting values('"+i+"','"+sqlTime+"','"+email+"','"+Nd.Encrypt(password)+"','"+outgoing+"','"+smtpport+"','"+agreement+"','"+status+"','"+usercid_adminid+"','"+usercid_id+"','','','','','','','','','')");
              rs3 = st.executeQuery("SELECT MAX(Id)FROM emailsettinglog   ");
    while(rs3.next())
        
          {SR=rs3.getString(1);
          
          }
            i = Integer.parseInt( SR ); 
           ++i; 
        st.addBatch("insert into emailsettinglog values('"+i+"','"+sqlTime+"','"+email+"','"+Nd.Encrypt(password)+"','"+outgoing+"','"+smtpport+"','"+agreement+"','"+status+"','"+usercid_adminid+"','"+usercid_id+"','Email Created','"+requestcid+"','','','','','','','')");
     st.executeBatch(); 
           mesg="Added Successfully";    
     Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Email="+email+", Email Setting Created Successfully");
         
       rs3.close();
      st.close();
      c.close();  }
        catch(Exception e)
        {
                   String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n newcontact.jsp-----\n"
                  + "LINE=136\n insert into emailsetting values where useradminid="+usercid_adminid+" ";
         Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
       EmergencyEmail.send(e,errormsg); 
        
        }
        
             }
             }//password and confirm password check
               else{errormessage="Password and Confirm Password must match";}
       }
    
       //System.out.println(al.size());
      %>
 
    <div class="wrapper">
      <jsp:include page="dist/include/leftmenu.jsp" />  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
      <section class="content-header">
          <% if(!"".equals(errormessage)){  %> 
        <div class="row"><div class="col-md-2"></div>
        <div class="col-md-6"> 
        <div class="alert alert-danger alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <i class="icon fa fa-check"></i> 
                <%=errormessage %>
        </div>  </div></div>   <% } %>	
           <% if(exception!=null){  
             Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --, Error "+exception+"");
      
           %> 
        <div class="row"><div class="col-md-2"></div>
        <div class="col-md-6"> 
        <div class="alert alert-danger alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <i class="icon fa fa-check"></i> 
                <%="Oops! Error Occured" %>
               <% if(exception.toString().contains("AuthenticationFailedException")){out.println(", authentication failed. ");} %>
          <% if(exception.toString().contains("SMTP")){out.println(", Please check correct outgoing server host");} %>
        
        </div>  </div></div>   <% } %>	
           <% if(!"".equals(mesg)){  %> 
        <div class="row"><div class="col-md-2"></div>
        <div class="col-md-6"> 
        <div class="alert alert-success alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <i class="icon fa fa-check"></i> 
                <%=mesg %>
        </div>  </div></div>   <% } %>	
      <h1>
        Email Setting  
         
      </h1>
      <ol class="breadcrumb">
          <li><a href="dashboard.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active"> <i class="fa fa-dashboard"></i>Profile Setting</li>
        
        <li ><i class="fa fa-dashboard"></i>Email Setting</li>
      </ol>
    </section>
    <!-- Content Header (Page header) -->
   

   <!-- Main content -->
    <section class="content">
        
 <div class="row">
        <!-- left column -->
        <% String formtype=request.getParameter("tr") ; 
        if("ext".equals(formtype)){
            String mid=request.getParameter("mid") ;
            if(general!=(null)){mid=general;}
            String emaildta[]=new String[20];
            emaildta=Email.getEmailSettingDetail(usercid_adminid, usercid_id,mid);
        %>
         <div class="col-md-6">
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Status:<span class="label label-<%=Email.statusEmailStatusColor(emaildta[8])%>"><% out.print(emaildta[8]); %></span></h3>
              <a href="mailsetting.jsp"><button  class="btn btn-primary pull-right">New Email</button></a>
           <% if("Active".equals(emaildta[8])) { %>
              <a href="" data-toggle="modal" data-target="#test-email"><button  class="btn btn-info pull-right">Test it</button></a>
            <div class="modal modal-info fade" id="test-email">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Test your Email</h4>
              </div>
              <div class="modal-body">
                <p>Test email will be sent to <%=emaildta[3] %> </p>
                <p>Please check your email, if test email does not receive please check configuration or contact our technical support </p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Close</button>
                <form action="emailtest.jsp" >   
                    <input type="hidden" name="email1" value="<%=emaildta[3] %>">
                    <input type="hidden" name="general" value="<%=emaildta[1] %>">
                     <input type="hidden" name="mat" value="testmail">
                    <button type="submit" class="btn btn-outline">Send Email</button></form>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
        <% } %>
            </div>
            <!-- /.box-header -->
         
            <!-- form start -->
            <form action="" method="POST" >
              <div class="box-body">
                <div class="form-group">
                  <label for="exampleInputEmail1">Email address</label>
                  <input  class="form-control"  value="<%=emaildta[3] %>" disabled="">
                  <input type="hidden" class="form-control" id="email" name="email" value="<%=emaildta[3] %>" >
               
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">Password</label>
                  <input type="password" class="form-control" id="password" name="password" placeholder="Enter Valid Password" required="">
                </div>
                   <div class="form-group">
                  <label for="exampleInputPassword1">Confirm Password</label>
                  <input type="password" class="form-control" id="confirmpassword" name="confirmpassword" placeholder="Password" required="">
                </div>
                 <div class="form-group">
                  <label for="exampleInputEmail1">Outgoing Server</label>
                  <input type="text" class="form-control" id="outgoing" name="outgoing" value="<%=emaildta[5] %>">
                </div>
                  <div class="form-group">
                  <label for="exampleInputEmail1">SMTP Port</label>
                  <input type="number" class="form-control" id="smtpport" name="smtpport" value="<%=emaildta[6] %>">
                </div>
              <div class="form-group">
                  <label for="exampleInputEmail1">Status</label>
                  <select class="form-control" name="status">
                      <option  value="<%=emaildta[8] %>"><%=emaildta[8] %></option>
                      <option  value="Active">Active</option>
                      <option  value="InActive">InActive</option>
                  </select>
                </div>
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                  <input type="hidden" name="general" value="<%=Nd.Encrypt(emaildta[1]) %>">
                  <input type="hidden" name="mailtype" value="setupdate">
                <button type="submit" class="btn btn-primary">Update</button>
              </div>
            </form>
          </div>
          <!-- /.box -->
        </div>
        
        <% }else{  %>
        <div class="col-md-6">
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">New Email</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form action="" method="POST" >
              <div class="box-body">
                <div class="form-group">
                  <label for="exampleInputEmail1">Email address</label>
                  <input type="email" class="form-control" id="email" name="email" placeholder="Enter email">
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">Password</label>
                  <input type="password" class="form-control" id="password" name="password" placeholder="Enter Valid Password" required="">
                </div>
                   <div class="form-group">
                  <label for="exampleInputPassword1">Confirm Password</label>
                  <input type="password" class="form-control" id="confirmpassword" name="confirmpassword" placeholder="Password"  required="">
                </div>
                 <div class="form-group">
                  <label for="exampleInputEmail1">Outgoing Server</label>
                  <input type="text" class="form-control" id="outgoing" name="outgoing" placeholder="Enter Outgoing Server">
                </div>
                  <div class="form-group">
                  <label for="exampleInputEmail1">SMTP Port</label>
                  <input type="number" class="form-control" id="smtpport" name="smtpport" placeholder="Enter SMTP Port">
                </div>
                   <div class="form-group">
                  <label for="exampleInputEmail1">Status</label>
                  <select class="form-control" name="status">
                      
                      <option  value="Active">Active</option>
                      <option  value="InActive">InActive</option>
                  </select>
                </div>
                <div class="checkbox">
                  <label>
                      <input type="checkbox" value="yes" name="agreetc" required=""> Agree Terms and Conditions
                  </label>
                </div>
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                  <input type="hidden" name="mailtype" value="mailset">
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>
            </form>
          </div>
          <!-- /.box -->
        </div>
        <% } %>
          <%  int emailcount='0';
      emailcount=Email.getCountAllEmailFromEmailSetting(usercid_adminid, usercid_id);
      String [][] emaildata=new String[emailcount][5];
      emaildata=Email.getAllEmailFromEmailSetting(usercid_adminid, usercid_id, emailcount);
      %>

         <div class="col-xs-6">
    
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">All Email </h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                 <div class="table-responsive">
              <table id="example6" class="table table-bordered table-striped">
                <thead>
                <tr>
                   <th>Date & Time  </th>
                  <th>Email</th>
                    <th> Status</th>
                  
                </tr>
                </thead>
                <tbody>
                <% int  m=1; for(m=1;m<=emailcount;m++) {  %>
                  <tr>
                    <td><% out.print(emaildata[m][2]); %></td>
                    <td><a href="mailsetting.jsp?mid=<%=emaildata[m][1] %>&tr=ext"><% out.print(emaildata[m][3]); %></a></td>
                    <td><span class="label label-<%=Email.statusEmailStatusColor(emaildata[m][4])%>"><% out.print(emaildata[m][4]); %></span></td>
                     
                   
                 </tr>
         
                  <% } %>
                 
               
                </tbody>
               
              </table>
                 </div>
            </div>
            <!-- /.box-body -->
         
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
 </div>
                    <%  int emailhistorycount='0';
      emailhistorycount=Email.getCountAllEmailHistFromEmailSetting(usercid_adminid, usercid_id);
      String [][] emailhistorydata=new String[emailhistorycount][12];
      emailhistorydata=Email.getAllEmailHistFromEmailSetting(usercid_adminid, usercid_id, emailhistorycount);
      %>
<div class="row">
	 <div class="col-xs-12">
       <div class="box">
            <div class="box-header">
              <h3 class="box-title">Email Setting History </h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                 <div class="table-responsive">
              <table id="example5" class="table table-bordered table-striped">
                <thead>
                <tr>
                   <th>Date & Time  </th>
                  <th>Description</th>
                    <th> Email</th>
                  <th>Status</th>
                  <th>Outgoing</th>
                  <th> Port</th>
                  <th>Modifiedby</th>
                </tr>
                </thead>
                <tbody>
                <%   m=1; for(m=1;m<=emailhistorycount;m++) {  %>
                  <tr>
                    <td><% out.print(emailhistorydata[m][2]); %></td>
                    <td><% out.print(emailhistorydata[m][11]); %></td>
                     <td><% out.print(emailhistorydata[m][3]); %></td>
                     
                    <td>
                        <span class="label label-<%=Email.statusEmailStatusColor(emailhistorydata[m][8]) %>"><% out.print(emailhistorydata[m][8]); %></span>
                  </td>
                   <td><% out.print((emailhistorydata[m][5]));  %></td>
                  <td><%=(emailhistorydata[m][6])  %></td>
                 
                    <td><%=Db.getEmployeeName(emailhistorydata[m][10])  %></td>
                 </tr>
         
                  <% } %>
                 
               
                </tbody>
               
              </table>
                 </div>
            </div>
            <!-- /.box-body -->
         
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
	

</div> <!--/.row  -->		
      
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <jsp:include page="dist/include/footer.jsp" />  

<% Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Leaving mailsetting.jsp-------------");
     %>
  
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
  $(function () {
  
     $('#example5').DataTable()
      $('#example6').DataTable()
   
    
  })
</script>

</body>
</html>
