<%@page import="log.Log"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="blezz.Poul"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.File"%>

<!DOCTYPE html>
<html>
    <head>     <link rel="shortcut icon" href="dist/img/u.png" type="image/x-icon" /> 

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Select Logo| INDSAC CRM</title>
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
              String root = Poul.getDirPath();
                 session1.setAttribute("root", root);
               String fileName=(String)request.getAttribute("fileName");
                            System.out.println(fileName+"ty"+"ROOT"+root);

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
     Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   --  Entring selectlogo.jsp---");
        %>
 <jsp:include page="dist/include/leftmenu.jsp" />  
        <div class="wrapper">
           
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <form action="upload" method="post" enctype="multipart/form-data">  
Select File:<input type="file" name="fname"/><br/>  
<input type="submit" value="upload"/>  
</form>  

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="box box-info"> 
                            <div class="box-header with-border">
                                <div class="col-md-3"><h3 class="box-title">Select Logo </h3></div>
                                <div class="col-md-3"></div>
                                <div class="col-md-4"></div>
                                <div class="col-md-2"><button  class="btn btn-info pull-right " type="submit" id="uploadCanvas" >Save</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row ">
                        <div class="col-md-12">
                            <div class="box box-primary">
                                <div class="box-body box-profile">
                                    <div class="col-md-3"> </div>
                                    <div class="col-md-2"> </div>
                                    <div class="col-md-3"> <input type="file" id="file">    </div>
                                    <div class="col-md-4" id="fileInfo"></div>
                                </div> 
                            </div>
                        </div>
                    </div>
                  
                    <div  id="myDIV" class="row "style="display: none" >
                        <div class="col-md-12">
                            <div class="box box-primary">
                                <div class="box-body box-profile">
                                    <div class="col-md-3"> </div>
                                    <div class="col-md-2"> </div>
                                    <div class="col-md-3">  <p>File Uploaded Successfully</p> </div>
                                    
                                    <div class="col-md-4"></div>
                                </div> 
                            </div>
                        </div>
                    </div>
                   
                    <!-- /.box-body -->
                    <div class="row ">
                        <div class="col-md-12">
                            <div class="box box-primary">
                                <div class="box-body box-profile">
                                    <div class="col-md-1"> Compressed Logo </div>
                                    <div class="col-md-4">   <canvas id="panel"></canvas> </div>
                                    <div class="col-md-3">  </div>
                                    <div class="col-md-4"> </div>
                                </div>   <!-- /.box-body -->
                            </div><!-- /.box -->
                        </div> 
                    </div>
                </section>

            </div>

            <!-- /.content -->


        </div>


        <!-- /.content-wrapper -->
        <footer class="main-footer">
            <div class="pull-right hidden-xs">
                <b>Version</b> 2.4.0
            </div>
            <strong>Copyright &copy; 2018 <a href="www.indsac.com">INDSAC SOFTECH</a>.</strong> All rights
            reserved.
        </footer>


        <!-- Add the sidebar's background. This div must be placed
             immediately after the control sidebar -->
        <div class="control-sidebar-bg"></div>
    
    <!-- ./wrapper -->
   
    <script type="text/javascript">
        var imageUploader = {

            imageFile: null,

            canvasCtx: document.getElementById("panel").getContext("2d"),
             /**
             * Trigger this object by setting up basic events.
             */
            init: function () {

               // document.getElementById("uploadImage").onclick = this.uploadImage.bind(this);
                document.getElementById("uploadCanvas").onclick = this.uploadCanvasAsImage.bind(this);

                document.getElementById("file").onchange = function (event) {
                    this.imageFile = event.target.files[0];
                    document.getElementById("fileInfo").innerHTML = "File Name: " + this.imageFile.name + "<br> Image type: " + this.imageFile.type;
                    var reader = new FileReader();
                    reader.onload = function (event) {
                        var img = new Image();
                        img.onload = function () {
                            this.drawImageOnCanvas(img);
                 //           this.displayImage(img);
                        }.bind(this)
                        img.src = event.target.result;
                    }.bind(this);
                    reader.readAsDataURL(this.imageFile);
                }.bind(this);
            },

            /**
             * Draw uploaded image on Canvas
             */
            drawImageOnCanvas: function (img) {
                this.canvasCtx.canvas.width = 80;
                this.canvasCtx.canvas.height = 65;
                this.canvasCtx.drawImage(img, 0, 0,this.canvasCtx.canvas.width, this.canvasCtx.canvas.height);
                //Some update on canvas
                
            },

            /**
             * Basic image display as per the uploaded image.
             */
           
            /**
             * canvas data uri return the Base64 encoded image, we need to conver into a binary file
             * before sending it to server.
             *
             */
            canvasToBlob: function (canvas, type) {

                var byteString = atob(canvas.toDataURL().split(",")[1]),
                        ab = new ArrayBuffer(byteString.length),
                        ia = new Uint8Array(ab),
                        i;

                for (i = 0; i < byteString.length; i++) {
                    ia[i] = byteString.charCodeAt(i);
                }

                return new Blob([ab], {
                    type: type
                });
            },

            /**
             * Upload basic image or file to server.
             */
        

            /**
             * Add extra parmeter, in case of Canvas upload.
             */
            uploadCanvasAsImage: function () {

                var data = new FormData();

                var blob = this.canvasToBlob(this.canvasCtx.canvas, this.imageFile.type);
                data.append("blob", blob);
                data.append("blobName", this.imageFile.name);
                data.append("blobType", this.imageFile.type);
                this.uploadToServer(data);

            },

            uploadToServer: function (formData) {

                //Uncomment when you server ready

                xhr = new XMLHttpRequest();
                xhr.open("post", "/fileUpload", true);
              //xhr.open("post", "http://103.143.46.18:33230/myindsactools/fileUpload", true);
                xhr.onreadystatechange = function () {
                    var x = document.getElementById("myDIV");
  
                       x.style.display = "block";
                };
                xhr.send(formData);

            }
        }

        /**
         * Trigger the app.
         */
        imageUploader.init();
    </script>
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


</body>
</html>
