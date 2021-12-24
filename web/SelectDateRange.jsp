<%@page import="log.Log"%>
<%@page import="blezz.Db"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="blezz.Poul"%>
<%@page import="blezz.Nd"%>
<%@page import="java.sql.Connection"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="dist/img/u.png" type="image/x-icon" /> 
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Select Records| INDSAC-CRM</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.7 -->
        <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
        <!-- bootstrap datepicker -->
        <link rel="stylesheet" href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
        <link rel="stylesheet" href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">

        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
        <link rel="stylesheet" href="css/daterangepicker.css">
        <!-- Theme style -->

        <link rel="stylesheet" href="css/bootstrap3-wysihtml5.min.css">


        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <% HttpSession session1 = request.getSession(); // reuse existing
    
                      String usercid_id=(String)session1.getAttribute("usercid_id");
                      String usercid_email=(String)session1.getAttribute("usercid_email");
                      String useraccountype=(String)session1.getAttribute("useraccountype");
                      String usercid_name=(String)session1.getAttribute("usercid_name");
                      String usercid_adminid=(String)session1.getAttribute("usercid_adminid");
                      String usercid_company=(String)session1.getAttribute("usercid_company");
                      String usercid_website=(String)session1.getAttribute("usercid_website"); 
                      String Customerread=(String)session1.getAttribute("Customerread");
                      String Customerwrite=(String)session1.getAttribute("Customerwrite");
                      String customerType= request.getParameter("customerType");
                      session.setAttribute("customerType", customerType);
                      System.out.println(customerType);
                      if (session != null) {
                          if (session1.getAttribute("usercid_id") == null) 
                          {
                              response.sendRedirect("signout.jsp");
                          } 
                       }
       		 Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Entering SelectDateRange.jsp----------Customer Dashboard---useradmindid="+usercid_adminid+",usercid="+usercid_id);

            %>
        </div>
        <jsp:include page="dist/include/leftmenu.jsp" />  
        <div class="wrapper">

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <section class="content-header">
                    <div class="row">
                        <div class="col-xs-12">
                            <form action="ExcelTableCLV.jsp" method="post">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <!-- Div for the date range picker-->
                                            <div class="form-group">
                                                <label>Date range:</label>
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-calendar"></i>
                                                    </div>
                                                    <input type="text" name="datepicker" class="form-control pull-right" id="reservation">
                                                    <input id="prodId" name="customerType" type="hidden" value=<%=customerType%>>
                                                </div>
                                                <!-- /.input group -->
                                            </div>
                                        </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Status</label>
                                                        <select id="status" name="status" class="form-control">
                                                            <option value="Active">Active</option>
                                                            <option value=" ">InActive</option>
                                                        </select>
                                                    </div>
                                                </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="box">
                                                <!-- /.box-header -->
                                                <div class="box-body">
                                                    <div class="box-header">
                                                        <input type="submit" value="Show Table" class="btn btn-primary"></input>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                        </div>
                                                
                    </div>
                </section>
            </div>
                                                
                                                <div class="control-sidebar-bg"></div>
        </div> 
        <!-- /.content-wrapper -->
        <jsp:include page="dist/include/footer.jsp" />  
<% Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" ---Leaving-----SelectDateRange.jsp--------");
 
 %>
        <!-- Control Sidebar -->

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
        <!-- FastClick -->
        <script src="bower_components/fastclick/lib/fastclick.js"></script>
        <!-- AdminLTE App -->
        <script src="dist/js/adminlte.min.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="dist/js/demo.js"></script>
        <script src="js/select2.full.min.js"></script>
        <!-- FastClick -->
        <script src="js/jquery.inputmask.js"></script>
        <script src="js/jquery.inputmask.date.extensions.js"></script>
        <script src="js/jquery.inputmask.extensions.js"></script>
        <script src="js/moment.min.js"></script>
        <script src="js/daterangepicker.js"></script>
        <script src="js/fastclick.js"></script>
        <!-- AdminLTE App -->
        <!-- AdminLTE for demo purposes -->
        <script src="js/bootstrap3-wysihtml5.all.min.js"></script>
        <!-- page script -->
        <script>
    $(function () {
        // Replace the <textarea id="editor1"> with a CKEditor
        // instance, using default configuration.
        CKEDITOR.replace('editor1')
        //bootstrap WYSIHTML5 - text editor
        $('.textarea').wysihtml5()
    })
        </script>
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
        <script >

            $(document).ready(function () {
                $('#example').DataTable({
                    "lengthMenu": [[10, 25, 50, -1], [10, 20, 30, 40]]
                });
            });
        </script>
        <script>
            $(function () {
                //Initialize Select2 Elements
                $('.select2').select2()

                //Datemask dd/mm/yyyy
                $('#datemask').inputmask('dd/mm/yyyy', {
                    'placeholder': 'dd/mm/yyyy'
                })
                //Datemask2 mm/dd/yyyy
                $('#datemask2').inputmask('mm/dd/yyyy', {
                    'placeholder': 'mm/dd/yyyy'
                })
                //Money Euro
                $('[data-mask]').inputmask()

                //Date range picker
                $('#reservation').daterangepicker()
                //Date range picker with time picker
                $('#reservationtime').daterangepicker({
                    timePicker: true,
                    timePickerIncrement: 30,
                    format: 'MM/DD/YYYY h:mm A'
                })
                //Date range as a button
                $('#daterange-btn').daterangepicker(
                        {
                            ranges: {
                                'Today': [moment(), moment()],
                                'Yesterday': [moment().subtract(1, 'days'),
                                    moment().subtract(1, 'days')],
                                'Last 7 Days': [moment().subtract(6, 'days'),
                                    moment()],
                                'Last 30 Days': [moment().subtract(29, 'days'),
                                    moment()],
                                'This Month': [moment().startOf('month'),
                                    moment().endOf('month')],
                                'Last Month': [
                                    moment().subtract(1, 'month').startOf(
                                            'month'),
                                    moment().subtract(1, 'month')
                                            .endOf('month')]
                            },
                            startDate: moment().subtract(29, 'days'),
                            endDate: moment()
                        },
                        function (start, end) {
                            $('#daterange-btn span').html(
                                    start.format('MMMM D, YYYY') + ' - '
                                    + end.format('MMMM D, YYYY'))
                        })

                //Date picker
                $('#datepicker').datepicker({
                    autoclose: true
                })

                //iCheck for checkbox and radio inputs
                $('input[type="checkbox"].minimal, input[type="radio"].minimal')
                        .iCheck({
                            checkboxClass: 'icheckbox_minimal-blue',
                            radioClass: 'iradio_minimal-blue'
                        })
                //Red color scheme for iCheck
                $(
                        'input[type="checkbox"].minimal-red, input[type="radio"].minimal-red')
                        .iCheck({
                            checkboxClass: 'icheckbox_minimal-red',
                            radioClass: 'iradio_minimal-red'
                        })
                //Flat red color scheme for iCheck
                $('input[type="checkbox"].flat-red, input[type="radio"].flat-red')
                        .iCheck({
                            checkboxClass: 'icheckbox_flat-green',
                            radioClass: 'iradio_flat-green'
                        })

                //Colorpicker
                $('.my-colorpicker1').colorpicker()
                //color picker with addon
                $('.my-colorpicker2').colorpicker()

                //Timepicker
                $('.timepicker').timepicker({
                    showInputs: false
                })
            })
        </script>

    </body>
</html>
