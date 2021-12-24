<%@page import="email.EmergencyEmail"%>
<%@page import="blezz.Nd"%>
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
  <title>New Lead | INDSAC CRM</title>
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
        	
	Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Entering freeformcontact.jsp----------Contact Form---");
   	
        System.out.println("<form action=\"http://localhost:8084/myindsactools/contactformsubmit\" method=\"post\">");
        System.out.println("<input type=\"text\" name=\"firstname\" placeholder=\"First Name\" maxlength=\"15\" >");
        System.out.println("<input type=\"text\" name=\"lastname\" placeholder=\"Last Name\" maxlength=\"15\" >");
        System.out.println("<input type=\"tel\" name=\"mobile\" placeholder=\"Mobile\" maxlength=\"12\" >");
        System.out.println("<input type=\"email\" name=\"email\" placeholder=\"Email\" maxlength=\"30\" >");
        System.out.println("<input type=\"text\" name=\"subject\" placeholder=\"Subject\" maxlength=\"100\" >");
         System.out.println("<textarea rows=\"7\" name=\"message\" placeholder=\"Message\" maxlength=\"1000\" >");
          System.out.println("<input type=\"hidden\" name=\""+Nd.Encrypt("useradminid") +"\" value=\""+Nd.Encrypt("2") +"\"  >");
       System.out.println("<input type=\"hidden\" name=\""+Nd.Encrypt("type") +"\" value=\""+Nd.Encrypt("contactform") +"\"  >");
      System.out.println("<input type=\"submit\" value=\"Submit\">");
         
         
         System.out.println("</form>");
if (session != null) {
			if (session1.getAttribute("usercid_id") == null) {
				response.sendRedirect("signout.jsp");
			} 
		}
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" ---------Entering freeformcontact.jsp-------------");
%>
     <%    String pagetype=Poul.escapeHtml(request.getParameter("freecontactform"));    String msg=null;
      if("freecontactform".equals(pagetype)){
          String sr="0";
          String adminid=Poul.escapeHtml(request.getParameter("adminid"));
                try{
       
Connection con=Poul.getConnectionCRM();

        

  PreparedStatement smt=con.prepareStatement("select count(*) from freeformcontact where useradminid=? AND formtype=?");
        smt.setString(1,adminid);
         smt.setString(2,"contactform");
        
        ResultSet rs=smt.executeQuery();while(rs.next())
        
          {sr=rs.getString(1);
          
         }
         msg="success"   ;       
    rs.close();
      smt.close();
      con.close();     }
        catch(Exception e)
        {
           String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n freeformcontact.jsp-----\n"
     + "LINE=97 + \n select count(*) from freeformcontact where useradminid="+adminid+" AND formtype=contactform   ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
        }
               int n123=Integer.parseInt(sr);
           if(n123==0) {
         
      
       String cn=Poul.escapeHtml(request.getParameter("cn"));
        String crf =Poul.escapeHtml(request.getParameter("crf"));
        String ccfn =Poul.escapeHtml(request.getParameter("ccfn"));
        String formtype=Poul.escapeHtml(request.getParameter("formtype"));
        String status=Poul.escapeHtml(request.getParameter("status"));
        String htmlcode=Poul.escapeHtml(request.getParameter("htmlcode"));
       String responseemail=Poul.escapeHtml(request.getParameter("responseemail"));
      
     
        java.util.Date date=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());  
        String ownr=(String)session.getAttribute("ownr");
      String SR=null; String customerid="";
        try{
       
Connection c=Poul.getConnectionCRM();



Statement st=c.createStatement();
           ResultSet rs3;
               rs3 = st.executeQuery("select  *  FROM freeformcontact  ");
    while(rs3.next())
        
          {SR=rs3.getString(1);
          
          }
           int i = Integer.parseInt( SR ); 
           ++i; 
             st.addBatch("insert into freeformcontact values('"+i+"','"+sqlTime+"','0','"+ownr+"','"+adminid+"','"+formtype+"','"+htmlcode+"','"+cn+"','"+crf+"','"+ccfn+"','','','"+status+"','"+responseemail+"','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','')");
       customerid=SR;
 
       st.executeBatch(); 
     
             msg="success"   ;       
    rs3.close();
      st.close();
      c.close();     }
        catch(Exception e)
        {
           String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n freeformcontact.jsp-----\n"
     + "LINE=147 + \n select  *  FROM freeformcontact  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
        }
        
     
         }else{msg="Adminid="+adminid+" already present";}
    
    
      } %>
<div class="wrapper">

  <jsp:include page="dist/include/leftmenu.jsp" />  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->

	 <section class="content">
<form class="form-horizontal" action="" method="post" name="newlead">
 <div class="row invoice">
        <div class="col-xs-12">
            <%  if("success".equals(msg)){out.println("Form created sucessfull, Now system able to receive response");}else{out.println(msg);} %>
		 <!-- Default box -->
      <div class="box box-warning box-solid">
        <div class="box-header with-border">
          <h3 class="box-title">Free Form Contact</h3>
   </div>
     <div class="col-md-10">
	 <div class="box ">
    <!-- form start -->
            
              <div class="box-body">
                  
                   <div class="form-group">
                  <label for="inputEmail3" class="col-sm-3 control-label">Response Email</label>

                  <div class="col-sm-9">
                      <input type="text" class="form-control" required="" id="responseemail" name="responseemail" placeholder="Email" autocomplete="off">
                  </div>
                </div>
                    <div class="form-group">
                  <label for="inputEmail3" class="col-sm-3 control-label">AdminId</label>

                  <div class="col-sm-9">
                      <input type="text" class="form-control" required="" id="adminid" name="adminid" placeholder="adminid" autocomplete="off">
                  </div>
                </div>
			    <div class="form-group">
                  <label for="inputEmail3" class="col-sm-3 control-label">Client Response Path</label>

                  <div class="col-sm-9">
                      <input type="text" class="form-control" required="" id="cn" name="cn" placeholder="https://www.example.com/contact.php" autocomplete="off">
                  </div>
                </div>
                  	    <div class="form-group">
                  <label for="inputEmail3" class="col-sm-3 control-label">Client Response File</label>

                  <div class="col-sm-9">
                      <input type="text" class="form-control"  required="" id="crf" name="crf" placeholder="contact.php" autocomplete="off">
                  </div>
                </div>
                      <div class="form-group">
                  <label for="inputEmail3" class="col-sm-3 control-label">Client Contact File Name</label>

                  <div class="col-sm-9">
                      <input type="text" class="form-control" required="" id="ccfn" name="ccfn" placeholder="contact.php" autocomplete="off">
                  </div>
                </div>
               
                 <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Status</label>

                  <div class="col-sm-9">
                      <select id="status" name="status" class="form-control">
                  <option value="Active">Active</option>
                          <option value="InActive">InActive</option>
                </select>
                  </div>
                </div>    
                   <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Form Type</label>
 <div class="col-sm-9">
                      <select id="status" name="formtype" class="form-control">
                      <option value="contactform">Contact Form</option>
           </select>
                  </div>
                </div>
				  <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">HTML Form Code</label>

                  <div class="col-sm-10">
                      <textarea class="form-control" rows="7" id="htmlcode" name="htmlcode" placeholder=" <html></html>"  required="" autocomplete="off"></textarea>
                    <input type="hidden" name="freecontactform" value="freecontactform">
                  </div>
                </div>
          
	
	
	  <div class="box-footer clearfix">
              <a href="javascript:void(0)" class="btn btn-sm btn-default btn-flat pull-left">Cancel</a>
               <button class="btn btn-sm btn-info btn-flat pull-right" >Save</button>
            </div>
	
	
	

	
	
	<p id="error" style="color:red;"></p><p id="success" style="color:blue;"></p>
	<script> 
		
			let urlString =window.location.href;
		
			let paramString = urlString.split('?')[1]; 
			
			let queryString = new URLSearchParams(paramString); 
		
			for (let pair of queryString.entries()) { 
				console.log("Key is:" + pair[0]); 
				console.log("Value is:" + pair[1]);
                if(pair[0]=="errormsg"){
                 document.getElementById("error").innerHTML =pair[0]+ pair[1];}
                 else {
                 document.getElementById("success").innerHTML =pair[0]+ pair[1];}
			} 
		
	</script> 
  

 <% Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Leaving freeformcontact.jsp----------Freeformcontact---");
   	
                        %>
  <div class="control-sidebar-bg"></div>
              </div></div></div></div></div></div></form>
         
         
           <div class="row" style="margin-top: 10px;">
        <div class="col-md-12">
          <div class="box box-primary">
            <div class="box-header">
              <h3 class="box-title"><i class="fa fa-code"></i> Timeline Markup</h3>
            </div>
            <div class="box-body">
                  <pre style="font-weight: 600;">
&lt;!-- / HTML Code -->

&lt;form action="http://localhost:8084/myindsactools/contactformsubmit\" method="post">
      &lt;input type="text" name="firstname" placeholder="First Name" maxlength="15" >
      &lt;input type="text" name="lastname" placeholder="Last Name" maxlength="15" >
     &lt;input type="tel" name="mobile" placeholder="Mobile" maxlength="12" >
      &lt;input type="email" name="email" placeholder="Email" maxlength="30" >
     &lt;input type="text" name="subject" placeholder="Subject" maxlength="100" >
    &lt;textarea rows="7" name="message" placeholder="Message" maxlength="1000" >
        &lt;input type="hidden" name="<%=Nd.Encrypt("useradminid") %>" value="<%=Nd.Encrypt("2") %> "  >
&lt;input type="hidden" name="<%=Nd.Encrypt("type") %>" value="<%=Nd.Encrypt("contactform") %>"  >
&lt;input type="submit" value="Submit">




&lt;!-- / Javascript Code Code -->

&lt;script> 
let urlString =window.location.href;
let paramString = urlString.split('?')[1]; 
let queryString = new URLSearchParams(paramString); 
for (let pair of queryString.entries()) { 
console.log("Key is:" + pair[0]); 
console.log("Value is:" + pair[1]);
  if(pair[0]=="errormsg"){
document.getElementById("indsacerror").innerHTML = pair[1];} else {
  document.getElementById("indsacsuccess").innerHTML = pair[1];} } 
&lt;/script>





&lt;ul class="timeline">

    &lt;!-- timeline time label -->
    &lt;li class="time-label">
        &lt;span class="bg-red">
            10 Feb. 2014
        &lt;/span>
    &lt;/li>
    &lt;!-- /.timeline-label -->

    &lt;!-- timeline item -->
    &lt;li>
        &lt;!-- timeline icon -->
        &lt;i class="fa fa-envelope bg-blue">&lt;/i>
        &lt;div class="timeline-item">
            &lt;span class="time">&lt;i class="fa fa-clock-o">&lt;/i> 12:05&lt;/span>

            &lt;h3 class="timeline-header">&lt;a href="#">Support Team&lt;/a> ...&lt;/h3>

            &lt;div class="timeline-body">
                ...
                Content goes here
            &lt;/div>

            &lt;div class="timeline-footer">
                &lt;a class="btn btn-primary btn-xs">...&lt;/a>
            &lt;/div>
        &lt;/div>
    &lt;/li>
    &lt;!-- END timeline item -->

    ...

&lt;/ul>
                  </pre>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
         
         </section></div></div>
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
        }else if(document.getElementById("source").value==""){
                    document.getElementById("alert-message").innerHTML = "Source cannot be empty ";
    $('#show-alert').modal('show')
     
           
           document.getElementById("source").focus();
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
     
      if(document.getElementById("category").value!=""){
           
           if(!document.getElementById("category").value.match(/^[0-9 a-z.A-Z]+$/)){
                     document.getElementById("alert-message").innerHTML = "Please enter valid category";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("category").focus();
     return false;
            } else
        if(document.getElementById("category").value.length>30){
                         document.getElementById("alert-message").innerHTML = "Category: Only 30 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("category").focus();
           
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

