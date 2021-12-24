<%@page import="log.Log"%>
<%@page import="menu.Email"%>
<%@page import="blezz.Poul"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head> <link rel="shortcut icon" href="dist/img/u.png" type="image/x-icon" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Send Mail | INDSAC CRM</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
<!-- bootstrap wysihtml5 - text editor -->
<link rel="stylesheet" href="css/bootstrap3-wysihtml5.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
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
 Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Entering ComposeMail.jsp----------Compose Mail---");
    
 if(Email.checkAnyEmailActive(usercid_adminid, usercid_id)<1)
{  
    Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --searchtask.jsp----------No Active Email---");
  response.sendRedirect("mailsetting.jsp");
}
%>
<body class="hold-transition skin-blue sidebar-mini">
    <jsp:include page="dist/include/leftmenu.jsp" />  
	<div class="wrapper">
   <div class="modal fade overlay" id="waitingdisplay">
          <div class="modal-dialog">
            <div class="modal-content alert-warning">
              
              <div class="modal-body">
                 Sending Mail     <i  class="fa fa-spinner fa-spin" > </i>
              </div>
             
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>Compose Mail</h1>

			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-info">
<!--Div for all the recipients-->
							<div class="row">
								<div class="col-xs-12">
									<div class="box">
										<h5><!--Recipients:are imported from the database with help of MailServlet -->
											<b>Recipients:&nbsp;&nbsp;</b><c:forEach items="${emails}" var="email">${email};</c:forEach>
										</h4>
										
									</div>
								</div>
							</div>

							<!-- /.box-header -->
							<div class="box-body pad">
<!--Div for all the text editor and form for getting subject and content-->

								<form action="SendMailAttachServlet" method="post"
									enctype="multipart/form-data">
									<div class="form-group">
										<input type="text" name="subject" class="form-control"
											placeholder="Subject">
									</div>
									<textarea id="editor1" name="content" rows="10" cols="80">
                                            This is my textarea to be replaced 
                                    </textarea>
									<div class="box-footer">
										<input type="file" name="file" multiple size="50" value="Select"
											class="btn btn-light"></input>
									</div>
                                                                    <input type="submit" value="Send" name="editor1" onclick="return processing()"
										class="btn btn-info" />
								</form>
							</div>
						</div>
						<!-- /.box -->

						
					</div>
					<!-- /.col-->
				</div>
				<!-- ./row -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

<jsp:include page="dist/include/footer.jsp" />  
<% Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Leaving ComposeMail.jsp----------Compose Mail---");
 
 %>
		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

	<!-- jQuery 3 -->
	<script src="js/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script src="js/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="js/demo.js"></script>
	<!-- CK Editor -->
	<script src="js/ckeditor/ckeditor.js"></script>
	<!-- Bootstrap WYSIHTML5 -->
	<script src="js/bootstrap3-wysihtml5.all.min.js"></script>
	<script>
		$(function() {
			// Replace the <textarea id="editor1"> with a CKEditor
			// instance, using default configuration.
			CKEDITOR.replace('editor1')
			//bootstrap WYSIHTML5 - text editor
			$('.textarea').wysihtml5()
		})
	</script>
        <script>  
//$("#waitingdisplay").hide();
function processing()  
{ 
   $('#waitingdisplay').modal('show') 
   document.addEventListener("contextmenu", function(e){
    
        e.preventDefault();
   
}, false);

   return true;
}
    </script>
</body>
</html>
