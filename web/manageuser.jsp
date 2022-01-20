<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
<%@page import="blezz.Nd"%>
<%@page import="blezz.EmailSendingRegisterCode"%>
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
  <title>User Setting | INDSAC CRM</title>
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
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   --  Entring manageuser.jsp---");
%>
<%   String m[] =new String [4];  String message="";
          String code="";
          String check= "";
  String msg="",msg1="",msg3="",msg4="",msg2="";
	
          String email=request.getParameter("email");
          String fullname=request.getParameter("fullname");
         
         String a1="";String a2="";
       //   out.print(message+"    "+code+"    "+check);
          String type=request.getParameter("type");
          String val=request.getParameter("val");
         
          if("resendotp".equals(type)){ 
                try{
           
        Connection con=Poul.getConnectionCRM();out.println("after connection resendtotp");
        PreparedStatement smt=con.prepareStatement("select email,fullname from validateuser where id=?");
      
        smt.setString(1,val);
        ResultSet rs=smt.executeQuery();
        
        while(rs.next()){
            
               a1=(rs.getString(1)); 
               a2=(rs.getString(2));
        }
      rs.close();
      smt.close();
      con.close();  }
        catch(Exception e){
                 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n manageuser.jsp-----\n"
     + "LINE=89 \n select email,fullname from validateuser where id="+val+"";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
                } 
           String chec=EmailSendingRegisterCode.getEmailEmployeeVerificationCode(a1,a2);
          m=chec.split(":");
        //  m[0]=code m[1]check   m[2]resultMessage
           message=m[2];
           code=m[0];
           check= m[1];
         
              if("yes".equals(check)){
          Connection con=Poul.getConnectionCRM();
       
Statement st=con.createStatement();
           String query = "update  validateuser set otp='"+code+"' where id='"+val+"'";
          
            int count = st.executeUpdate(query);
        msg4="success"; 
       
       
              } else {msg3="mailnotsent";}
 
          }
          
          //Check if new user is already registered in register and validateuser
          if("otprequest".equals(type)){
              
              try{
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select email from register where email=?");
        smt.setString(1,email);
        ResultSet rs=smt.executeQuery();
        while(rs.next()){
            
               a1=(rs.getString(1)); 
            if(a1.equals(email))  {a1="true";}
            
        }
       
     rs.close();
      smt.close();
      con.close();   }
        catch(Exception e){
                String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n manageuser.jsp-----\n"
     + "LINE=138 \n select email from register where email="+email+"";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
                }
              try{
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select email from validateuser where email=?");
        smt.setString(1,email);
        ResultSet rs=smt.executeQuery();
        while(rs.next()){
            
               a1=(rs.getString(1)); 
            if(a1.equals(email))  {a2="true";}
            
        }
       
    rs.close();
      smt.close();
      con.close();    }
        catch(Exception e){
                          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n manageuser.jsp-----\n"
     + "LINE=160 \n select email from validateuser where email="+email+"";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
         
                }
                  if(a1!="true"&&a2!="true"){
       
       
            
        String chec=EmailSendingRegisterCode.getEmailEmployeeVerificationCode(email,fullname);
      
          m=chec.split(":");
        //  m[0]=code m[1]check   m[2]resultMessage
           message=m[2];
           code=m[0];
           check= m[1];
         
              if("yes".equals(check)){
        java.util.Date date=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());  
        out.print("message:"+message+", code:"+", check:"+check+", email:"+email+", fullname:"+fullname);
      String SR=null;
        try{
        
Connection c=Poul.getConnectionCRM();



Statement st=c.createStatement();
           ResultSet rs3;
               rs3 = st.executeQuery("select  *  FROM validateuser  ");
    while(rs3.next())
        
          {SR=rs3.getString(1);
          
          }
           int i = Integer.parseInt( SR ); 
           ++i; 
            st.addBatch("insert into validateuser values('"+i+"','"+sqlTime+"','employee','"+email+"','Business Name','"+fullname+"','"+code+"','"+usercid_adminid+"','"+usercid_id+"','Pending','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no','no')");
      
            
       st.executeBatch(); 
       msg2="success";
       
      rs3.close();
      st.close();
      c.close();   }
        catch(Exception e)
        {
   String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n manageuser.jsp-----\n"
     + "LINE=211 \n insert into validateuser values "+email+"";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
         
        }
              } else {msg1="mailnotsent";}
          
          
          
                  }else { msg="Already";
}
                  
          }
%>
<div class="wrapper">

  <jsp:include page="dist/include/leftmenu.jsp" />  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
 
	
	 <section class="content-header">
 

<form class="form-horizontal" action="manageuser.jsp" method="POST">

	
	 <div class="row invoice">
        <div class="col-xs-12">
		 <!-- Default box -->
      <div class="box box-warning box-solid">
        <div class="box-header with-border">
          <h3 class="box-title">User Setting</h3>

         
        </div>
       
	
 </div>
      <!-- /.box -->
</div>
		</div>
		
	 <div class="row invoice">
        <div class="col-xs-12">
		 <!-- Default box -->
      <div class="box box-solid">
       <div class="box-header with-border">
          <h3 class="box-title">Add User</h3>
          <% if("Already".equals(msg)) { %>
          <h3 class="box-title" style="color:red">Already Registered</h3>
          <% } %>
           <% if("mailnotsent".equals(msg1)) { %>
          <h3 class="box-title" style="color:red">Error Sending the OTP Code, try  again</h3>
          <% } %>
          <% if("mailnotsent".equals(msg3)) { %>
          <h3 class="box-title" style="color:red">Error Sending the OTP Code, try  again</h3>
          <% } %>
            <% if("success".equals(msg2)) { %>
          <h3 class="box-title" style="color:green ">OTP send to <%=email  %> </h3>
          <% } %>
           <% if("success".equals(msg4)) { %>
          <h3 class="box-title" style="color:green ">OTP send to <%=a1  %> </h3>
          <% } %>
        </div>

       
	    <div class="col-md-6">
		
		 <div class="box ">
            
           
            <!-- form start -->
            
              <div class="box-body">
			
			 <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Full Name<span style="color:red">*</span></label>

                  <div class="col-sm-9">
                      <input type="text" class="form-control" id="fullname" name="fullname" placeholder=" Full Name"  autocomplete="off">
                  </div>
                </div>
				 
			 <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Email<span style="color:red">*</span></label>

                  <div class="col-sm-9">
                  <input type="text" class="form-control" id="email" name="email" placeholder="Email">
                  </div>
                </div>		 
			 <div class="form-group">
                  <label for="inputEmail3" class="col-sm-3 control-label">    
           </label>
                             <input type="hidden" name="type" value="otprequest">
                  <div class="col-sm-9">
<button class="btn btn-sm btn-info btn-flat pull-left" onClick="return validateForm()">Submit</button>
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
         
 
    

    
      
        </div>
        <!--/.col (right) -->

      </div>
      <!-- /.box -->
		
		
		</div>
		</div>
	</form>	
<%
           int i=0,j=0;
           String count1="NULL";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from validateuser where usercid=?");
        smt.setString(1,usercid_id);
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count1=rs.getString(1);  }
    rs.close();
      smt.close();
      con.close();    } catch(Exception e){
          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n manageuser.jsp-----\n"
     + "LINE=362 \n select count(*) from validateuser where usercid="+usercid_id+"";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
       
      }
      
       int n1=Integer.parseInt(count1);
       String taskdata1[][]=new String[n1+1][55];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from validateuser where usercid=?");
        smt.setString(1,usercid_id);
        ResultSet rs=smt.executeQuery();
      i=1; j=0; 
        while(rs.next())
        { 
           for( j=1;j<=32;j++)
          {
            taskdata1[i][j]=rs.getString(j); 
           
          }
           ++i;  
        }
      rs.close();
      smt.close();
      con.close();  } catch(Exception e){
                String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n manageuser.jsp-----\n"
     + "LINE=388 \n select * from validateuser where usercid="+usercid_id+"";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
      }
      %>
      <div class="row">
        <div class="col-xs-12">
      

          <div class="box">
            <div class="box-header">
              <h3 class="box-title">User Record</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                   <th>Access Requests  </th>
                  <th>Name</th>
                  <th>Email</th>
                  <th>  Status</th>
                  <th> </th>
                </tr>
                </thead>
                <tbody>
                <% int m1=0; for(m1=n1;m1>0;m1--) {  %>
                  <tr>
                      <td><a  href="editaccessrequest.jsp?eid=<%=taskdata1[m1][1]    %>">Edit Access Request</a></td>
                    <td><% out.print(taskdata1[m1][6]); %></td>
                    <td><% out.print(taskdata1[m1][4]); %></td>
                    <td>
                           <span class="label label-<%=Poul.statusEmployeeVerification(taskdata1[m1][10]) %>"><% out.print(taskdata1[m1][10]); %></span>
                       
                       
                     </td>
                   
                   <td> 
                       <% if("Pending".equals(taskdata1[m1][10])){ %> 
                       <a href="manageuser.jsp?val=<%=taskdata1[m1][1] %>&type=resendotp" > <button class="btn btn-sm btn-info btn-flat pull-left" >Resend OTP</button></a>

                       <%  } %>
                   </td>
                  </tr>
         
                  <% } %>
                </tbody>
               
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->		
	   
		
		
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
    
<jsp:include page="dist/include/footer.jsp" />
 <% Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Leaving manageuser.jsp------");
 
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
       
       if(document.getElementById("fullname").value==""){
   
            document.getElementById("alert-message").innerHTML = "Full Name: Cannot be empty";
    $('#show-alert').modal('show')
       document.getElementById("fullname").focus();
           return false;
        }else if(document.getElementById("fullname").value!=""){
           
           if(!document.getElementById("fullname").value.match(/^[0-9 a-z.A-Z]+$/)){
              document.getElementById("alert-message").innerHTML = "Full Name: Only alphanumeric allowed";
    $('#show-alert').modal('show')
           
           document.getElementById("fullname").focus();
     return false;
            } 
        } 
        if(document.getElementById("fullname").value.length>45){
                document.getElementById("alert-message").innerHTML = "Full Name: Only 45 Characters allowed";
    $('#show-alert').modal('show')
         
           // alert("Only 30 Characters allowed ");
           document.getElementById("fullname").focus();
           
           return false;
       }
        
        if(document.getElementById("email").value==""){
   
            document.getElementById("alert-message").innerHTML = "Email: Cannot be empty";
    $('#show-alert').modal('show')
       document.getElementById("email").focus();
           return false;
        }else
           if(document.getElementById("email").value!=""){
           
           if(!document.getElementById("email").value.match(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/)){
                     document.getElementById("alert-message").innerHTML = "Enter valid email id";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("email").focus();
     return false;
            } else
        if(document.getElementById("email").value.length>45){
                         document.getElementById("alert-message").innerHTML = "Email id: Only 45 Characters allowed";
    $('#show-alert').modal('show')
          
           document.getElementById("email").focus();
           
           return false;
       }}
       
      
       return true;
    }
</script>
<script> function showRegisteredAlert(){ document.getElementById("alert-message").innerHTML = "Email Already Registered";
    $('#show-alert').modal('show')
    }
</script>
<script>
$('#dob').calendarsPicker({
dateFormat:'dd/mm/yyyy'
});
</script>
</body>
</html>
