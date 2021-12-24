<%@page import="log.Log"%>
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
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Bank Details| INDSAC CRM</title>
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
 Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Entering bankdetails.jsp----------Compose Mail---");
 String mid=request.getParameter("mid");
 String city=request.getParameter("city");
                
 String bankInfo[]=new String[6]; 
 bankInfo=menu.InvoiceMenu.getInvoiceBankDetails(usercid_adminid, usercid_id, city);
 %> 
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <jsp:include page="dist/include/leftmenu.jsp" />  
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <form class="form-horizontal" action="BankDetails" method="post">
                        <div class="row invoice">
                            <div class="col-xs-12">
                                <!-- Default box -->
                                <div class="box box-warning box-socid">
                                    <div class="box-header with-border">
                                        <h3 class="box-title"> Bank Details</h3>
                                        <!-- form start -->
                                    </div>
                                    <div class="col-md-6">
                                        <div class="box ">
                                            <div class="box-body">
                                                <div class="form-group">
                                                    <label  class="col-sm-2 control-label"> Bank Name</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="heading"  name="Bankname" value="<%=bankInfo[1]%>" placeholder="" >
                                                    </div>
                                                </div> <br><br>
                                                <div class="form-group">
                                                    <label  class="col-sm-2 control-label">Bank A/C No</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="point1"  name="Bankacno" value="<%=bankInfo[2]%>" placeholder="" >
                                                    </div>
                                                </div> 
                                                <br><br>
                                            </div>
                                            <!-- /.box-body -->
                                        </div>
                                        <!-- /.box -->
                                    </div>
                                    <!--/.col (left) -->

                                    <div class="col-md-6">
                                        <div class="box">
                                            <div class="box-body">
                                                <div class="form-group">
                                                    <label  class="col-sm-2 control-label">Bank Add</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="point2"  name="Bankadd"  value="<%=bankInfo[3]%>"placeholder="" >
                                                    </div>
                                                </div><br><br>
                                                <div class="form-group">
                                                    <label  class="col-sm-2 control-label">Bank IFSC</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="point3"  name="Bankifsc" value="<%=bankInfo[4]%>" placeholder="" >
                                                    </div>
                                                </div>  
                                                <br><br>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                        
                                        
                                    <!--/.col (right) -->
                                </div>
                                <!-- /.box -->
                               
                            </div>
                             <div class="box-footer clearfix no-border">
                                                <button type="button" class="btn btn-default pull-left" onclick="goBack()"> Cancel</button>
                                             
                                                <input type="hidden" name="mid" value="<%=mid  %>">
                                                <input type="hidden" name="city" value="<%=city  %>">
                                                <input type="hidden" name="pagetype" value="bankdetails">
                                                <button type="submit" class="btn btn-info pull-right"> Save</button>
                                            
                                        <!-- /.box -->
                                        </div>
                       

                    </form>





                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
            <jsp:include page="dist/include/footer.jsp" />  
<% Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" ----Leaving----bankdetails.jsp--------");
 
 %>
            <!-- /.control-sidebar -->
            <!-- Add the sidebar's background. This div must be placed
                 immediately after the control sidebar -->
            <div class="control-sidebar-bg"></div>
       
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
        <!-- bootstrap datepicker -->
        <script src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
        <!-- FastClick -->
        <script src="bower_components/fastclick/lib/fastclick.js"></script>
        <!-- AdminLTE App -->
        <script src="dist/js/adminlte.min.js"></script>

        <!-- AdminLTE for demo purposes -->
        <script src="dist/js/demo.js"></script>
        <!-- page script -->
        <script>
                                                    $(function () {
                                                        $('#example1').DataTable()
                                                        $('#example2').DataTable({
                                                            'paging': true,
                                                            'lengthChange': false,
                                                            'searching': false,
                                                            'ordering': true,
                                                            'info': true,
                                                            'autoWidth': false
                                                        })
                                                    })
        </script>
        <script>
            function goBack() {
                window.history.back();
            }
        </script>
        <script>
            $(function () {

                //Date picker
                $('#datepicker1').datepicker({
                    autoclose: true
                })

            })

        </script>


    </body>
</html>
