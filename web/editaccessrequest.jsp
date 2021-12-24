<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
<%@page import="blezz.Db"%>
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
  <title>Edit Access Request | INDSAC CRM</title>
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
    String eid=request.getParameter("eid");
   
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
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Entering editaccessrequest.jsp-------------");

String data[]=new String[51];
data=Db.getValidateUserData(eid, usercid_adminid);
%>


<div class="wrapper">

  <jsp:include page="dist/include/leftmenu.jsp" />  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
 
	
	 <section class="content-header">
    


	
	

<form class="form-horizontal" action="YmnhaDw" method="POST">

	
	 <div class="row invoice">
        <div class="col-xs-12">
		 <!-- Default box -->
      <div class="box box-warning box-solid">
        <div class="box-header with-border">
          <h3 class="box-title">User Access</h3>

         
        </div>
      
	
 </div>
      <!-- /.box -->
       <div class="box with-border">
           <p class="box-title"><%="Name:"+data[6]  %></p>
           <p class="box-title pull-right" ><%="Created on:"+data[2].substring(0, 10)  %></p>
           <br>
           <p class="box-title"><%="Email:"+data[4]  %></p>
            </div>
</div>
		</div>
		
	 <div class="row invoice">
        <div class="col-xs-12">
		 <!-- Default box -->
      <div class="box box-solid">
       <div class="box-header with-border">
          <h3 class="box-title">Select Access for User</h3>
         <button class="btn btn-sm btn-info btn-flat pull-right" type="submit" onclick="" >Save</button>

        </div>
    <!-- Table row -->
      <div class="row">
        <div class="col-xs-12 table-responsive">
          <table class="table table-striped">
            <thead>
            <tr>
              <th>SN</th>
              <th>Activity</th>
              <th>Read Access</th>
              <th>Write Access</th>
              <th><input type="checkbox" id="select-all"> &nbsp;Select All</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td>1</td>
              <td>Customer</td>
              <td><input type="checkbox" name="Customerread"  id="Customerread" value="true" <% if("true".equals(data[11])){out.print("checked");} %>  >&nbsp;Read</td>
              <td><input type="checkbox" name="Customerwrite" id="Customerwrite" value="true" <% if("true".equals(data[12])){out.print("checked");} %> >&nbsp;Write</td>
              
            </tr>
             <tr>
              <td>2</td>
              <td>Lead</td>
               <td><input type="checkbox" name="leadread" id="" value="true" <% if("true".equals(data[13])){out.print("checked");} %> >&nbsp;Read</td>
              <td><input type="checkbox" name="leadwrite" id="" value="true" <% if("true".equals(data[14])){out.print("checked");} %> >&nbsp;Write</td>
              
            </tr>
             <tr>
              <td>3</td>
              <td>Vendor</td>
              <td><input type="checkbox" name="vendorread" id="vendorreate" value="true" <% if("true".equals(data[15])){out.print("checked");} %> >&nbsp;Read</td>
              <td><input type="checkbox" name="vendorwrite" id="vendorwrite" value="true" <% if("true".equals(data[16])){out.print("checked");} %> >&nbsp;Write</td>
              
            </tr>
             <tr>
              <td>4</td>
              <td>Task</td>
              <td><input type="checkbox" name="taskread" id="" value="true" <% if("true".equals(data[17])){out.print("checked");} %> >&nbsp;Read</td>
              <td><input type="checkbox" name="taskwrite" id="" value="true" <% if("true".equals(data[18])){out.print("checked");} %> >&nbsp;Write</td>
              
            </tr>
             <tr>
              <td>5</td>
              <td>Service Request</td>
              <td><input type="checkbox" name="srread" id="" value="true" <% if("true".equals(data[19])){out.print("checked");} %> >&nbsp;Read</td>
              <td><input type="checkbox" name="srwrite" id="" value="true" <% if("true".equals(data[20])){out.print("checked");} %> >&nbsp;Write</td>
              
            </tr>
             <tr>
              <td>6</td>
              <td>Interaction Record</td>
              <td><input type="checkbox" name="irread" id="" value="true" <% if("true".equals(data[21])){out.print("checked");} %> >&nbsp;Read</td>
              <td><input type="checkbox" name="irwrite" id="" value="true" <% if("true".equals(data[22])){out.print("checked");} %> >&nbsp;Write</td>
              
            </tr>
             <tr>
              <td>7</td>
              <td>Invoice</td>
              <td><input type="checkbox" name="invoiceread" id="" value="true" <% if("true".equals(data[23])){out.print("checked");} %> >&nbsp;Read</td>
              <td><input type="checkbox" name="invoicewrite" id="" value="true" <% if("true".equals(data[24])){out.print("checked");} %> >&nbsp;Write</td>
              
            </tr>
             <tr>
              <td>8</td>
              <td>Purchase Order</td>
              <td><input type="checkbox" name="poread" id="" value="true" <% if("true".equals(data[25])){out.print("checked");} %> >&nbsp;Read</td>
              <td><input type="checkbox" name="powrite" id="" value="true" <% if("true".equals(data[26])){out.print("checked");} %> >&nbsp;Write</td>
              
            </tr>
             <tr>
              <td>9</td>
              <td> Email<%=eid  %></td>
              <td><input type="checkbox" name="emailread" id="" value="true" <% if("true".equals(data[27])){out.print("checked");} %> >&nbsp;Read</td>
              <td><input type="checkbox" name="emailwrite" id="" value="true" <% if("true".equals(data[28])){out.print("checked");} %> >&nbsp;Write</td>
            <input type="hidden" name="pagetype" value="editaccessrequest">
            <input type="hidden" name="emp" value="<%=eid  %>">
            
            </tr>
            </tbody>
          </table>
        </div>
        <!-- /.col -->
        
        <button class="btn btn-sm btn-info btn-flat pull-right" type="submit" onclick="" >Save</button>

    
      </div>
      <!-- /.row -->   
       
	   
        <!-- right column -->
      
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
      con.close();   } 
       catch(Exception e)
      { String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n downloadexcel.jsp-----\n"
     + "LINE=245 + \n select count(*) from validateuser where usercid="+usercid_id+" ";
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
      con.close();    } 
        catch(Exception e)
        {
         String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n downloadexcel.jsp-----\n"
     + "LINE=272 + \n select * from validateuser where usercid="+usercid_id+" ";
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
                      <td><a  href="iredit.jsp?tid=<%=taskdata1[m1][1] %>&cid=<%=taskdata1[m1][13] %>&type=contact">Edit Access Request</a></td>
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
 <% Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Leaving editaccessrequest.jsp------");
 
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
    document.getElementById('select-all').onclick = function() {
  var checkboxes = document.querySelectorAll('input[type="checkbox"]');
  for (var checkbox of checkboxes) {
    checkbox.checked = this.checked;
  }
}
    function validateForm(){
       
       if(document.getElementById("fullname").value==""){
   
            document.getElementById("alert-message").innerHTML = "Name cannot be empty";
    $('#show-alert').modal('show')
       document.getElementById("fullname").focus();
           return false;
        }else if(document.getElementById("fullname").value!=""){
           
           if(!document.getElementById("fullname").value.match(/^[0-9 a-z.A-Z]+$/)){
              document.getElementById("alert-message").innerHTML = "Only alphanumeric allowed";
    $('#show-alert').modal('show')
           
           document.getElementById("fullname").focus();
     return false;
            } 
        } 
        if(document.getElementById("fullname").value.length>30){
                document.getElementById("alert-message").innerHTML = "Only 30 Characters allowed";
    $('#show-alert').modal('show')
         
           // alert("Only 30 Characters allowed ");
           document.getElementById("fullname").focus();
           
           return false;
       }
     
    
       
      
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
