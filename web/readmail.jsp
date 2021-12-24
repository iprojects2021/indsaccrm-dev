<%@page import="java.nio.file.Files"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.io.File"%>
<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
<%@page import="blezz.Db"%>
<%@page import="menu.Email"%>
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
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="dist/img/u.png" type="image/x-icon" /> 
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Read Mail | INDSAC-CRM</title>
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

        <link rel="stylesheet" href="css/modal.css">
        <script defer src="js/modal.js"></script>

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
       Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Entering readmail.jsp-------------");
   		
	
            if (session != null) {
                                    if (session1.getAttribute("usercid_id") == null) {
                                            response.sendRedirect("signout.jsp");
                                    } 
                            }

           String mid=request.getParameter("2a2e2a6d6964"); //mid  encrypted form
           mid=Nd.Decrypt(mid);
           String data[]=new String[10];
                     try{
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from sentmailcontent where timestamp=? ");
        smt.setString(1,mid);
        
        ResultSet rs=smt.executeQuery();
        while(rs.next()){
            for(int i=1;i<=8;i++){
               data[i]=rs.getString(i); 
            }
        }
        
    rs.close();
      smt.close();
      con.close();    }
        catch(Exception e){
      String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n taskedit.jsp-----\n"
     + "LINE=92\nselect * from sentmailcontent where id="+mid+"  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
     
                }
       //System.out.println(al.size());
       
      int recount='0';recount= Email.getRecipientsCount(usercid_adminid, data[2]);
      String recemail[]=new String[recount+3];
      recemail=Email.getAllRecipients(usercid_adminid, data[2], recount);
            
            %>
            <jsp:include page="dist/include/leftmenu.jsp" />  
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
               <!-- Main content -->
    <section class="content">
      <div class="row">
       
        <div class="col-md-12">
          <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title"><a onclick="window.history.back()"><i class="fa   fa-arrow-left"></i></a>&nbsp;Read Mail</h3>

              <div class="box-tools pull-right">
                <a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Previous"><i class="fa fa-chevron-left"></i></a>
                <a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Next"><i class="fa fa-chevron-right"></i></a>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
                 <div class="mailbox-read-info">
                     <h3>To,</h3>
                     <h5 class=" pull-right">Sent By: <%=Db.getEmployeeName(data[7]) %></h5>
                  <h5> <% for(int i=1;i<=recount;i++){out.println(recemail[i]+";");} %>
                  <h5 class=" pull-right">From: <%=(data[8]) %></h5>
              </div>
              <div class="mailbox-read-info">
                  <h3><strong>Subject: <%=data[3]  %></strong></h3>
                
                  <span class="mailbox-read-time pull-right"><%=" Date:"+data[2]  %></span></h5>
              </div>
              <!-- /.mailbox-read-info -->
           
              <!-- /.mailbox-controls -->
              <div class="mailbox-read-message">
                <p>Message: <%=data[4]  %></p>

                
              </div>
              <!-- /.mailbox-read-message -->
            </div>
            <!-- /.box-body -->
             <div class="modal  " id="waitingdisplay">
          <div class="modal-dialog">
            <div class="modal-content alert-warning">
              
              <div class="modal-body">
                 Processing     <i  class="fa fa-spinner fa-spin" > </i>
              </div>
             
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
           <%  if(!data[5].contains("null"))
            {  %>
            <div class="box-footer">
            
              <ul class="mailbox-attachments clearfix">
                       <% 
           
            String attachfilename[]=data[5].split(";"); int i=0;
            for(String filename:attachfilename){
            System.out.println(filename);
           String path = Poul.getDirPath()+File.separator+"mailattachment"+File.separator+filename;

        Path filePath = Paths.get(path);
        long fileSize = Files.size(filePath); 
        int filecount=attachfilename.length;
        System.out.println("filecount="+filecount); i++;
            %>
                <li><form name="download<%=i %>" >
                    <span class="mailbox-attachment-icon"><i class="fa fa-file<%=menu.File.getFileExtensionFA(filename) %>"></i></span>
                <input type="hidden" name="filename<%=i %>" value="<%=filename %>">
                  <div class="mailbox-attachment-info">
                    <a onclick="downloadFile(<%=filename %>)" download class="mailbox-attachment-name"><i class="fa fa-paperclip"></i><%=filename %></a>
                        <span class="mailbox-attachment-size">
                            <%=menu.File.getCorrectFileSize(fileSize) %>
                            <script> var x<%=i %>="<%=filename %>";var y<%=i %>="<%=i %>";
                        document.write('<a onclick="downloadFile(x<%=i %>,y<%=i %>)" download   class="btn btn-default btn-xs pull-right"><i class="fa fa-cloud-download"></i></a>');
                        </script>
            </span>
                  </div>
                    </form>
            
         
                </li>
             <% 
             }
            
             %>  
            </ul>
            <div class="modal fade" id="confirmdownload">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Confirm Download</h4>
              </div>
              <div class="modal-body">
                  <p>File is ready for download. </p>
                  <p id="filename123"></p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
         <p id="viewfile">     </p>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
            </div>
             <% } %>
            <!-- /.box-footer -->
            <div class="box-footer">
              <div class="pull-right">
                  <button type="button" onclick="window.history.back()" class="btn btn-default"><i class="fa fa-reply"></i> Back</button>
             </div>
           </div>
            <!-- /.box-footer -->
          </div>
          <!-- /. box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
               
               
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
            <jsp:include page="dist/include/footer.jsp" />  
<%  Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Leaving readmail.jsp-------------");
   	 %>
            <!-- Control Sidebar -->

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
        <script src="bower_components/chart.js/Chart2.js" ></script>

        <!-- AdminLTE for demo purposes -->
        <script src="dist/js/demo.js"></script>
        <!-- page script -->


        <script>
            $(function () {
                $('#example2').DataTable()
                $('#example1').DataTable()
                $('#example3').DataTable()
            })
        </script>
        <script>
            $(function () {

                //Date picker
                $('#datepicker1').datepicker({
                    autoclose: true
                })

            })

        </script>
      <script>  
var request1;  
function downloadFile(f,n)  
{ $('#waitingdisplay').modal('show')
var v="mailattachment"; 

  document.getElementById("filename123").innerHTML = f;
document.getElementById("viewfile").innerHTML = '<a href="download/'+f+'" download class="btn btn-primary"><i class="fa fa-cloud-download"></i>Download</a>';
$("#waitingdisplay").show();
var url="DownloadFile?type="+v+"&filename="+f;  
  
if(window.XMLHttpRequest){  
request1=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request1=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request1.onreadystatechange=getInfo;  
request1.open("post",url,true);  
request1.send();  
}catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo(){  
if(request1.readyState===4){  
$('#waitingdisplay').modal('hide')
    $('#confirmdownload').modal('show')
}  
}  
  
</script>  
    </body>
</html>
