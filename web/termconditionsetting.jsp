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
        <title>Terms And Condition | INDSAC CRM</title>
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
        <div class="wrapper">
            <jsp:include page="dist/include/leftmenu.jsp" />  
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <form class="form-horizontal" action="InvoiceTermAndCondition" method="post">

                        <div class="row invoice">
                            <div class="col-xs-12">
                                <!-- Default box -->
                                <div class="box box-warning box-socid">
                                    <div class="box-header with-border">
                                        <h3 class="box-title"> Terms and  Condition</h3>
                                        <!-- form start -->

                                    </div>   

                                    <div class="col-md-6">

                                        <div class="box ">



                                            <div class="box-body">
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-2 control-label"> Heading</label>

                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="heading"  name="heading" placeholder="" >
                                                    </div>
                                                </div> <br><br>
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-2 control-label"> Point 1</label>

                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="point1"  name="point1" placeholder="" >
                                                    </div>
                                                </div> <br><br>
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-2 control-label"> Point 2</label>

                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="point2"  name="point2" placeholder="" >
                                                    </div>
                                                </div>
                                                <br><br>

                                                <!-- /.form group -->

                                                <div class="form-group">
                                                    <label for="inputPassword3" class="col-sm-2 control-label">Point 3</label>

                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="point3"  name="point3" placeholder="" >

                                                    </div>
                                                </div>   <br><br>

                                                <div class="form-group">
                                                    <label for="inputPassword3" class="col-sm-2 control-label">Point 4</label>

                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="point4"  name="point4" placeholder="" >


                                                    </div>
                                                </div>



                                            </div>
                                            <!-- /.box-body -->
                                            <div class="box-footer clearfix no-border">




                                            </div>




                                        </div>
                                        <!-- /.box -->


                                    </div>
                                    <!--/.col (left) -->

                                    <div class="col-md-6">
                                        <!-- Horizontal Form -->
                                        <!-- general form elements -->
                                        <div class="box">

                                            <!-- /.box-header -->
                                            <!-- form start -->

                                            <div class="box-body">





                                                <br><br>
                                                <div class="form-group">
                                                    <label for="inputPassword3" class="col-sm-2 control-label">Notes</label>

                                                    <div class="col-sm-10">
                                                        <textarea class="form-control" rows="7" id="notes" name="notes" placeholder=" Notes" maxlength="100" autocomplete="off"></textarea>
                                                    </div>
                                                </div>



                                                <br><br>



                                            </div>
                                            <!-- /.box-body -->
                                            <div class="box-footer clearfix no-border">
                                                <button type="button" class="btn btn-default pull-left" onclick="goBack()"> Cancel</button>
                                                <% String mid=request.getParameter("mid");
                                                String city=request.getParameter("city");
                
                                                %>
                                                <input type="hidden" name="mid" value="<%=mid  %>">
                                                <input type="hidden" name="city" value="<%=city  %>">
                                                <input type="hidden" name="pagetype" value="termconditionsubmit">
                                                <button type="submit" class="btn btn-info pull-right"> Save</button>
                                            </div>


                                        </div>
                                        <!-- /.box -->
                                    </div>
                                    <!--/.col (right) -->
                                </div>
                                <!-- /.box -->
                            </div>
                        </div>

                    </form>





                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
            <jsp:include page="dist/include/footer.jsp" />  

            <!-- /.control-sidebar -->
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
