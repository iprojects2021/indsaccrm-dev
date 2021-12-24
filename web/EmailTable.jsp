<%@page import="log.Log"%>
<%@page import="email.EmergencyEmail"%>
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
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="dist/img/u.png" type="image/x-icon" /> 
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Mail Table| INDSAC-CRM</title>
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
       		String customerType = (String) session1.getAttribute("customerType");
	
            if (session != null) {
                                    if (session1.getAttribute("usercid_id") == null) {
                                            response.sendRedirect("signout.jsp");
                                    } 
                            }
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Entering EmailTable.jsp--------");
            %>
            <jsp:include page="dist/include/leftmenu.jsp" />  
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <%    
              
                      int ii=1,jj=0;
                        String count123="0";
                        
                        String dateto = (String)request.getAttribute("dateto");
                        String datefrom = (String)request.getAttribute("datefrom");
                        System.out.println(dateto+"    "+datefrom+"         "+customerType);
                    try{ Connection con=Poul.getConnectionCRM();
                     PreparedStatement smt=con.prepareStatement("select count(*) from contact where useradminid=? AND customertype=? and timestamp between ? and ? ");
                     smt.setString(1,usercid_adminid);
                      smt.setString(2,customerType);
                      smt.setString(3,datefrom);
                      smt.setString(4,dateto);
        
                     ResultSet rs=smt.executeQuery();
                     while(rs.next()){  count123=rs.getString(1);  }
                    rs.close();
                   smt.close();
                   con.close();
                    } catch(Exception e){ 
                                      String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n EmailTable.jsp-----\n"
                  + "LINE=92\nselect count(*) from contact where useradminid="+usercid_adminid+" AND customertype="+customerType+"and timestamp between "+datefrom+" and "+dateto+"   ";
         Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
       EmergencyEmail.send(e,errormsg); 
     
                    }
                   int n123=Integer.parseInt(count123);
                    String leaddata[][]=new String[n123+10][50];
                       try{ Connection con=Poul.getConnectionCRM();
                     PreparedStatement smt=con.prepareStatement("select * from contact where useradminid=? AND customertype=? and timestamp between ? and ? ");
                     smt.setString(1,usercid_adminid);
                     smt.setString(2,customerType);
                      smt.setString(3,datefrom);
                      smt.setString(4,dateto);
                     ResultSet rs=smt.executeQuery();
    
                     while(rs.next())
                     { 
                        for(jj=1;jj<42;jj++)
                     {
                     leaddata[ii][jj]=rs.getString(jj);
                     }
                        ++ii;  
                     }
                    rs.close();
                   smt.close();
                   con.close();
                       } catch(Exception e){ 
                                                       String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n EmailTable.jsp-----\n"
                  + "LINE=120\nselect * from contact where useradminid="+usercid_adminid+" AND customertype="+customerType+"and timestamp between "+datefrom+" and "+dateto+"   ";
         Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
       EmergencyEmail.send(e,errormsg); 
     
                       }
      
       
       
       
       
       
       
                    
 
                %>
                <form action="Mail" method="post">
                <!-- Main content -->
                <section class="content">
                    
                    <!-- Small boxes (Stat box) -->
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">Customer </h3>
                                </div>
                                <div class="row" >
                                </div>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th><input type="checkbox" name="checkbox" onclick='selectAll()' />	&nbsp;	&nbsp;	&nbsp;Select All</th>
                                                <th>Date   </th>
                                                <th>Company</th>
                                                <th>Name</th>
                                                <th>  Phone</th>
                                                <th> Phone2</th>
                                                <th> Email Id</th>
                                                <th> City</th>
                                                <th> Status</th>
                                                <th> Owner</th>
                                            </tr>
                                        </thead>
                                        <tbody> 
                                            <% int m=0; for(m=n123;m>0;m--) {  %>
                                            <tr>
                                                <td><input type="checkbox" id="email" name="email" value=<%=leaddata[m][23] %>></td>
                                                <td><a href="contactdetails.jsp?cid=<%=leaddata[m][1] %>&type=<%=("contact") %>"><% out.print(leaddata[m][2]); %></a></td>
                                                <td><% out.print(leaddata[m][5]); %></td>
                                                <td><% out.print(leaddata[m][6]); %></td>
                                                <td><% out.print(leaddata[m][20]); %></td>
                                                <td><% out.print(leaddata[m][21]); %></td>
                                                <td><% out.print(leaddata[m][23]); %></td>
                                                <td><% out.print(leaddata[m][33]); %></td>
                                                <td>
                                                    <span class="label label-<%=Poul.statusCustomerColor(leaddata[m][13]) %>"><% out.print(leaddata[m][13]); %></span>
                                                </td>
                                                <td><% out.print(Db.getEmployeeName(leaddata[m][40])); %></td>
                                            </tr>
                                            <% } %>
                                        </tbody>
                                    </table>
                                </div>
                                        <div class="box-footer">
					      <input type="submit" value="SendMail" class="btn btn-primary"></input>
                                        </div>       
                                <!-- /.box-body -->
                            </div>
                            <!-- /.box -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </section>
                </form>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
            <jsp:include page="dist/include/footer.jsp" />  
            <% Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Leaving EmailTable.jsp-------");
 
 %>

            <!-- Control Sidebar -->

            <!-- /.control-sidebar -->
            <!-- Add the sidebar's background. This div must be placed
                 immediately after the control sidebar -->
            <div class="control-sidebar-bg"></div>
        </div>
        <!-- ./wrapper -->

        <!-- jQuery 3 -->
        <script type="text/javascript">
            //function for select all and unselect all checkbox
            var checkbox = document.querySelector("input[name=checkbox]");

            checkbox.addEventListener('change', function () {
                if (this.checked) {
                    var items = document.getElementsByName('email');
                    for (var i = 0; i < items.length; i++) {
                        if (items[i].type == 'checkbox')
                            items[i].checked = true;
                    }
                } else {
                    var items = document.getElementsByName('email');
                    for (var i = 0; i < items.length; i++) {
                        if (items[i].type == 'checkbox')
                            items[i].checked = false;
                    }
                }
            });
        </script>
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

            function validatetaskSearch() {
                if (document.getElementById("cfn").value == "") {
                    alert("Enter first name ");
                    document.getElementById("cfn").focus();
                    return false;
                } else if (document.getElementById("cfn").value.length > 30) {
                    alert("Only 30 Characters allowed ");
                    document.getElementById("cfn").focus();
                    return false;
                }
                function inputAlphabet(inputtext, alertMsg) {
                    var alphaExp = /^[a-zA-Z]+$/;
                    if (inputtext.value.match(alphaExp)) {
                        return true;
                    } else {
                        document.getElementById("cfn").innerText = alertMsg;
                        inputtext.focus();
                        return false;
                    }
                }

                return true;
            }
        </script>
    </body>
</html>
