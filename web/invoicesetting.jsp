<%@page import="menu.AdminDefaultValues"%>
<%@page import="menu.Default"%>
<%@page import="menu.Invoice"%>
<%@page import="menu.Email"%>
<%@page import="email.EmergencyEmail"%>

<%@page import="log.Log"%>

<%@page import="java.math.RoundingMode"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="blezz.Poul"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"><link rel="shortcut icon" href="dist/img/u.png" type="image/x-icon" /> 
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Invoice Setting | INDSAC CRM</title>
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
  <!-- DataTables -->
  <link rel="stylesheet" href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">



</head>
     <%
         HttpSession session1 = request.getSession(); // reuse existing
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
         
           Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Entering invoicesetting.jsp---------- Invoice Setting---");
      
     %>
    
<body class="hold-transition skin-blue sidebar-mini" >
    <div class="wrapper">
        <jsp:include page="dist/include/leftmenu.jsp" /> 
        <!-- Content Wrapper. Contains page content -->
                        <%
                    String message="",warningmsg="",successmsg="";
                    
                    int defaultexist=Default.isDefaultExist(usercid_adminid,usercid_id);
      if(defaultexist==0){   if(usercid_adminid!=null && usercid_id!=null ){
          Default.createDefault(usercid_adminid, usercid_id);
      } }
       int admindefaultexist=AdminDefaultValues.isAdminDefaultExist(usercid_adminid);
      if(admindefaultexist==0){   if(usercid_adminid!=null && usercid_id!=null ){
          AdminDefaultValues.createAdminDefault(usercid_adminid);}}
                    String getlocationid=(String)session1.getAttribute("getlocationid");
                    String invoicesetpagetype=(String)session1.getAttribute("invoicesetpagetype");
                     String getlocationid11=request.getParameter("location");
                     String type=request.getParameter("type");
                      String status=request.getParameter("status");
                     if("statusupdate".equals(type)){ 
                     
                      int upd='0';
                      if("Active".equals(status)){ 
                          upd=Default.updateInvoiceSettingStatus(usercid_adminid, usercid_id, getlocationid11);
                       if(upd==1){
                           successmsg="Status Updated Successfully";}
                       else{warningmsg="Something Went Wrong";}
                      }
                     if("InActive".equals(status)){  upd=Default.updateInvoiceSettingStatus(usercid_adminid, usercid_id, "InActive");
                       if(upd==1){successmsg="Status Updated Successfully";}
                       else{warningmsg="Something Went Wrong";}
                      }
                     }
                     if("currencyupdate".equals(type)){String currency=request.getParameter("currency");
                     System.out.println("New Currency="+currency+",update="+menu.AdminDefaultValues.saveInvoiceCurrency(usercid_adminid, currency,request));
                      
                     successmsg="Currency Updated Successfully";
                     }
                      String defaultcity=Default.getDefaultInvoiceSettingCity(usercid_adminid, usercid_id);
      
                     if(getlocationid11!=null){getlocationid=getlocationid11;}
                     if(getlocationid==null && defaultcity!=null){getlocationid=defaultcity;}
                    
                    String citydata[]=new String[50];
                    String cdata[]=new String[50];
                    int citycount=0,count=0;
                   
                        try{ 
                            Connection con=Poul.getConnectionCRM();
                            PreparedStatement smt=con.prepareStatement("select esi_city from mastertable where useradminid=?  ");
                            smt.setString(1,usercid_adminid);
                            ResultSet rs=smt.executeQuery();
                            int i=1,j=1;
                            while(rs.next())
                            {
                                citydata[i]=(rs.getString(1));
                                i++;
                                citycount++;
                            } 
                            rs.close();
                            smt.close();
                            con.close(); 
                        }
                        catch(Exception e)
                        {
                            String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoicesetting.jsp-----\n"
     + "LINE=106 + \n select esi_city from mastertable where useradminid="+usercid_adminid+"  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      //EmergencyEmail.send(e,errormsg);
                        }
                      if("InActive".equals(defaultcity) && citycount==0){defaultcity="";warningmsg="No Active Invoice Address found, Please Add new location";}
                       if("InActive".equals(defaultcity) && citycount>0){defaultcity="";warningmsg="No Active Invoice Address found, Please select location and make  Active status ";}
                         
                  
                    if(!"".equals(getlocationid)||!"null".equals(getlocationid))
                    {
                        try{
                            Connection con=Poul.getConnectionCRM();
                            PreparedStatement smt=con.prepareStatement("select * from mastertable where esi_city=? and useradminid=?  ");
                            smt.setString(1,getlocationid);
                            smt.setString(2,usercid_adminid);
                            ResultSet rs=smt.executeQuery();
                            int i=1,j=1;
                            while(rs.next())
                            {
                                for(i=1;i<49;++i)
                                {
                                    cdata[i]=(rs.getString(i));
                                    count++;
                                }
                            } 
                            rs.close();
                            smt.close();
                            con.close(); 
                        }
                        catch(Exception e)
                        { 
                             String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoicesetting.jsp-----\n"
     + "LINE=135 + \n select * from mastertable where esi_city="+getlocationid+"  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      //EmergencyEmail.send(e,errormsg);
                        }
                        message="show";
                    }
                    session1.setAttribute("invoicesetpagetype","");
                    
             %>
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">  
                 <h1>
        INVOICE SETTING
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Invoice Setting</a></li>
      </ol>
            </section>
            <!-- Main content -->
   <section class="content">  
       <div class="row">
          <div class="col-md-6">
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">
              <%    if(citycount==0){ out.println("Add Location for creating Invoice");
                                    }  else { %>
                                    Location:     <form action=""  method="post" >  <select name="location" class="form-control pull-left" onchange="this.form.submit()">
                        <% if(cdata[23]==null){ %> <option value="">Select Location</option> <% }else{%>        <option value="<%=cdata[23]%>"><%=cdata[23]%></option><% } %>
                                <% for(int i=1;i<=citycount;++i){  %>
                                <option value="<%=citydata[i]  %>"><%=citydata[i]  %></option>
                                <% } %>
                            </select>     
                                    </form>     
                                    
                              <% }  %>
         </h3>        <a href="newsellerinformation.jsp" class="btn btn-sm btn-info btn-flat pull-right"  >Add Location </a>
                        </div>
            <!-- /.box-header -->
            <!-- form start -->
               
              <div class="box-body">
                 <form action=""   method="post"><input type="hidden" name="location" value="<%=cdata[23]%>">
               
                  <div class="form-group">
             <label for="inputEmail3"  control-label">Status</label>
                  <%  String status1="InActive";if(defaultcity.equals(cdata[23])){status1="Active";
                 %>
  <span class="label label-<%=Invoice.statusInvoiceSettingCityColor("Active") %>"><% out.print("Active"); %></span>
   <button type="submit" class="btn btn-sm btn-warning btn-flat pull-right"  >Make InActive</button>
  <input type="hidden" name="status" value="InActive">
   
   <% }else { %>
  <span class="label label-<%=Invoice.statusInvoiceSettingCityColor("InActive") %>"><% out.print("InActive"); %></span>
    <button type="submit" class="btn btn-sm btn-primary btn-flat pull-right"  >Make Active</button>
   <input type="hidden" name="status" value="Active">
           
    <% } %>
  <input type="hidden" name="type" value="statusupdate">
              
                            </div>
            </form> 
                
                
              
              </div>
              <!-- /.box-body -->

            </form>
          </div>
          <!-- /.box -->
          <section class="invoice">
             <%  if(count>0){ %>
             <!-- info row --><script>
                 window.onload = function(){
  document.getElementById('sellerinformation123').click();}
             </script>
                <div class="row invoice-info">
                    <div class="col-sm-4 invoice-col">
                    </div>
                </div>
                <div class="row invoice-info">
                    <div class="nav-tabs-custom">
                        <div class="col-sm-3 invoice-col nav nav-tabs">
                            <a href="#sellerinformation" id="sellerinformation123"  data-toggle="tab" class="active" >
                                <button  class=" btn btn-block btn-default">Seller Info</button>
                            </a>
                            <br>
                            <a href="#taxsetting" data-toggle="tab">    
                                <button  class="btn btn-block btn-default">Tax Setting</button>
                            </a>
                            <br>
                            <a href="#termscondition" data-toggle="tab">  
                                <button  class="btn btn-block btn-default"> T&c</button>
                            </a>
                            <br>
                            <a href="" data-toggle="tab">   
                                <button  class="btn btn-block btn-default">Print Preview</button>
                            </a>
                            <br>
                            <a href="#bankdetails" data-toggle="tab">
                                <button  class="btn btn-block btn-default">Bank Details</button>
                            </a>
                             <br>
                            <a href="#currency" data-toggle="tab">
                                <button  class="btn btn-block btn-default">Currency</button>
                            </a>
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-1 invoice-col">
                            
                        </div>
                        <div class="col-sm-8 invoice-col tab-content">
                            <div class="box box-success active tab-pane" id="sellerinformation">
                                <form action="editsellerinformation.jsp" method="post">
                                    <div class="box-header with-border">
                                        <h3 class="box-title">Seller Information </h3>
                                        <p class="pull-right col-sm-3">
                                            <button type="submit" class=" btn btn-block btn-warning" title="Edit Seller Information">
                                                <i class="fa fa-fw fa-edit"></i> </button>
                                        </p> 
                                    </div>
                                    <input type="hidden" name="location" value="<%=cdata[23] %>">
                                </form><!-- /.box-header -->
                                <div class="box-body">
                                    <strong><i class="fa fa-book margin-r-5"></i> Business Name</strong>\
                                    <p class="text-muted"><%=cdata[12] %> </p>
                                    <hr> 
                                    <strong><i class="fa fa-book margin-r-5"></i> Contact Name</strong>
                                    <p class="text-muted"><%=cdata[13]+" "+cdata[14] %> </p>
                                    <hr>
                                    <strong><i class="fa fa-book margin-r-5"></i> Contact</strong>
                                    <p class="text-muted"><%=cdata[17]+","+cdata[18] %> </p>
                                    <hr>
                                    <strong><i class="fa fa-book margin-r-5"></i> GST</strong>
                                    <p class="text-muted"><%=cdata[15] %> </p>
                                    <hr>
                                    <strong><i class="fa fa-book margin-r-5"></i>Website</strong>
                                    <p class="text-muted">Email:   <%=cdata[19] %> </p>
                                    <p class>Website: <%=cdata[16]%></p>
                                    <hr>
                                    <strong><i class="fa fa-map-marker margin-r-5 "></i> Address</strong>
                                    <p class="text-muted"> <%=cdata[20] %><br><!-- <%=cdata[21] %><br><%=cdata[22] %><br> -->
                                    <%=cdata[23]+" "+cdata[24]+" "+cdata[25] %><br></p>
                                    <hr>
                                </div><!-- /.box-body -->
                            </div> <!-- /.box  tab-pane ends here-->
                            <div class="box box-warning active tab-pane" id="taxsetting">
                                <div class="box-header with-border">
                                    <h3 class="box-title">TAX INFORMATION </h3>
                                    <div class="pull-right col-sm-3">
                                        <form action="master.jsp" method="post"> 
                                            <input type="hidden" name="mid" value="<%=cdata[1] %>">
                                            <input type="hidden" name="city" value="<%=cdata[23] %>">
                                            <input type="hidden" name="location" value="">
                                            <button type="submit" class=" btn btn-block btn-warning" title="Edit Tax Information"><i class="fa fa-fw fa-edit"></i> </button>
                                        </form>
                                    </div>
                                            <p class="pull-right col-sm-4"> 
                                                <button  class=" btn btn-block btn-warning" title="Compare with other Location"><i class="fa fa-fw fa-table"></i>  </button>
                                            </p>
                                </div> <!-- /.box-header -->
                                <div class="box-body">
                                    <strong><i class="fa fa-book margin-r-5"></i> GST</strong>
                                    <p class="text-muted"><%=cdata[36] %> </p>
                                    <hr><strong><i class="fa fa-book margin-r-5"></i> CGST</strong>
                                    <p class="text-muted"><%=cdata[5] %> </p><hr>
                                    <strong><i class="fa fa-book margin-r-5"></i> SGST</strong>
                                    <p class="text-muted"><%=cdata[6] %> </p>
                                    <hr>
                                    <strong><i class="fa fa-book margin-r-5"></i> IGST</strong>
                                    <p class="text-muted">
                                        <%=cdata[7] %>
                                    </p>
                                    <hr>
                                    <strong><i class="fa fa-book margin-r-5"></i> SHIPPING CHARGE</strong>
                                    <p class="text-muted">
                                        <%=cdata[8] %> </p>
                                    <hr>
                                    <strong><i class="fa fa-book margin-r-5"></i> SERVICE CHARGE</strong>

                                    <p class="text-muted">
                                        <%=cdata[9] %> </p>
                                    <hr>
                                    <strong><i class="fa fa-book margin-r-5"></i>FRIEGHT CHARGE</strong>

                                    <p class="text-muted">
                                        <%=cdata[11] %> </p>
                                    <hr>
                                    <strong><i class="fa fa-book margin-r-5"></i> DISCOUNT</strong>

                                    <p class="text-muted">
                                        <%=cdata[10] %> </p>
                                    <hr>
                                </div><!-- /.box-body -->
                            </div><!-- /.box  tab-pane ends here-->
                            <div class="box box-danger active tab-pane" id="termscondition">
                                <div class="box-header with-border">
                                    <h3 class="box-title">TERMS CONDITIONS </h3>
                                    <div class="pull-right col-sm-3">
                                        <form action="termconditionsetting.jsp" method="post"> 
                                            <input type="hidden" name="mid" value="<%=cdata[1] %>">
                                            <input type="hidden" name="city" value="<%=cdata[23] %>">
                                            <input type="hidden" name="location" value="">
                                            <button type="submit" class=" btn btn-block btn-warning" title="Edit Terms and Conditions"><i class="fa fa-fw fa-edit"></i> </button>
                                        </form>
                                    </div> 
                                </div>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <strong><i class="fa fa-book margin-r-5"></i> Heading</strong>
                                    <p class="text-muted">
                                        <%=cdata[31] %> </p>
                                    <hr>
                                    <strong><i class="fa fa-book margin-r-5"></i> 1</strong>
                                    <p class="text-muted">
                                        <%=cdata[32] %> </p>
                                    <hr>
                                    <strong><i class="fa fa-book margin-r-5"></i> 2</strong>
                                    <p class="text-muted">
                                        <%=cdata[33] %> </p>
                                    <hr>
                                    <strong><i class="fa fa-book margin-r-5"></i> 3</strong>
                                    <p class="text-muted">
                                        <%=cdata[34] %> </p>
                                    <hr>
                                    <strong><i class="fa fa-book margin-r-5"></i> 4</strong>
                                    <p class="text-muted">
                                        <%=cdata[35] %> </p>
                                    <hr>
                                    <strong><i class="fa fa-book margin-r-5"></i> NOTE:</strong>
                                    <p class="text-muted">
                                    </p>
                                    <p class="text-muted">
                                        <%=cdata[37] %> </p>
                                    <hr>
                                </div>
                                <!-- /.box-body -->
                            </div>
                            <!-- /.box  tab-pane ends here-->
                            <div class="box box-success active tab-pane" id="bankdetails">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Bank Details </h3>
                                    <div class="pull-right col-sm-3">
                                        <form action="bankdetails.jsp" method="post"> 
                                            <input type="hidden" name="mid" value="<%=cdata[1] %>">
                                            <input type="hidden" name="city" value="<%=cdata[23] %>">
                                            <input type="hidden" name="location" value="">
                                            <button type="submit" class=" btn btn-block btn-warning" title="Edit Bank Details"><i class="fa fa-fw fa-edit"></i> </button>
                                        </form>
                                    </div> 
                                </div>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <strong><i class="fa fa-book margin-r-5"></i> Bank Name</strong>
                                    <p class="text-muted">
                                        <%=cdata[39] %> </p>
                                    <hr>
                                    <strong><i class="fa fa-book margin-r-5"></i>Account No</strong>
                                    <p class="text-muted">
                                        <%=cdata[40] %> </p>
                                    <hr>
                                    <strong><i class="fa fa-book margin-r-5"></i>Bank Address</strong>
                                    <p class="text-muted">
                                        <%=cdata[41] %> </p>
                                    <hr>
                                    <strong><i class="fa fa-book margin-r-5"></i>I.F.S.C Code</strong>
                                    <p class="text-muted">
                                        <%=cdata[42] %> </p>
                                    <hr>
                                    
                                </div>
                                <!-- /.box-body -->
                            </div>
                                     <div class="box box-warning active tab-pane" id="currency">
                                    <form action="" method="post"> 
                                         <div class="box-header with-border">
                                    <h3 class="box-title">Currency </h3>
                                    <div class="pull-right col-sm-3">
                                       
                                        <button type="submit" class=" btn btn-block btn-primary" title="Save"><i class="fa fa-fw fa-hand-pointer-o"></i> </button>
                                        
             
                                    </div> 
                                </div>
                                <!-- /.box-header -->
                                <div class="box-body">
                                 <div class="form-group">
                  
                       <input type="hidden" name="type" value="currencyupdate">
                              
                  <div class="col-sm-12">
              <h4 class="page-header">Currency Icons</h4>
              <% String currentcurrency=menu.AdminDefaultValues.getInvoiceCurrency(usercid_adminid);  %>
                  <div class="row fontawesome-icon-list">
                   
                     <div class="col-md-3 col-sm-4"><input type="radio" name="currency" value="dollar" <%if("dollar".equals(currentcurrency)){out.println("checked");}%>><i class="fa fa-fw fa-dollar"></i> dollar
                     </div>
                     <div class="col-md-3 col-sm-4"><input type="radio" name="currency" value="rupee" <%if("rupee".equals(currentcurrency)){out.println("checked");}%>><i class="fa fa-fw fa-rupee"></i> rupee 
                    </div>
                      <div class="col-md-3 col-sm-4"><input type="radio" name="currency" value="bitcoin" <%if("bitcoin".equals(currentcurrency)){out.println("checked");}%>><i class="fa fa-fw fa-bitcoin"></i> bitcoin
                    </div>
                      <div class="col-md-3 col-sm-4"><input type="radio" name="currency" value="yen" <%if("yen".equals(currentcurrency)){out.println("checked");}%>><i class="fa fa-fw fa-yen"></i> yen 
                    </div>
                  <div class="col-md-3 col-sm-4"><input type="radio" name="currency" value="euro" <%if("euro".equals(currentcurrency)){out.println("checked");}%>><i class="fa fa-fw fa-euro"></i> euro 
                    </div>
                    <div class="col-md-3 col-sm-4"><input type="radio" name="currency" value="gbp" <%if("gbp".equals(currentcurrency)){out.println("checked");}%>><i class="fa fa-fw fa-gbp"></i> gbp</div>
                    <div class="col-md-3 col-sm-4"><input type="radio" name="currency" value="krw" <%if("krw".equals(currentcurrency)){out.println("checked");}%>><i class="fa fa-fw fa-krw"></i> krw</div>
                    <div class="col-md-3 col-sm-4"><input type="radio" name="currency" value="money" <%if("money".equals(currentcurrency)){out.println("checked");}%>><i class="fa fa-fw fa-money"></i> money</div>
                   
                    <div class="col-md-3 col-sm-4"><input type="radio" name="currency" value="rouble" <%if("rouble".equals(currentcurrency)){out.println("checked");}%>><i class="fa fa-fw fa-rouble"></i> rouble
                      </div>
                   
                   
                    <div class="col-md-3 col-sm-4"><input type="radio" name="currency" value="sheqel" <%if("sheqel".equals(currentcurrency)){out.println("checked");}%>><i class="fa fa-fw fa-sheqel"></i> sheqel
                     </div>
                    <div class="col-md-3 col-sm-4"><input type="radio" name="currency" value="turkish-lira" <%if("turkish-lira".equals(currentcurrency)){out.println("checked");}%>><i class="fa fa-fw fa-turkish-lira"></i> turkish-lira
                      </div>
                    <div class="col-md-3 col-sm-4"><input type="radio" name="currency" value="won" <%if("won".equals(currentcurrency)){out.println("checked");}%>><i class="fa fa-fw fa-won"></i> won 
                    </div>
                  </div>
  
                  </div> 
                                 </div> 
               
                                </div>
                                <!-- /.box-body -->
                                   </form>   
                            </div>
                        </div>
                        <!-- /.col  tab-content -->
                        <!-- /.col -->
                    </div>
                    <!-- /.nav-tabs-custom -->
                </div>
                <!-- /.row -->
                <!-- info row -->
                <% }  %>
                </section>
            </div>
  <!-- /.col -->
           <div class="col-md-6">
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Invoice Format (<% if(cdata[23]==null){out.println("Default");}else {out.println("Location:"+cdata[23]);}%>)</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
           <%   %>
              <div class="box-body">
                  <div class="row margin-bottom">
                    <div class="col-sm-6">
                        <strong> Format 1</strong>
                       <img class="img-responsive" src="dist/img/invoicesample/default.PNG" alt="Photo">  
                    <div class="mailbox-attachment-info">
                    <a href="dist/img/invoicesample/default.PNG" download class="mailbox-attachment-name"><i class="fa fa-camera"></i> Invoice Preview</a>
                        <span class="mailbox-attachment-size">
                          1.9 MB
                          <a href="dist/img/invoicesample/default.PNG" download  class="btn btn-default btn-xs pull-right"><i class="fa fa-cloud-download"></i></a>
                        </span>
                  </div>
                       <% if("admin".equals(useraccountype)){  %>
              <div class="box-footer">
                <a href="selectinvoiceformat.jsp" class="btn btn-primary">Select Invoice Format</a>
            </div>
              <% } %>
                   </div>
                        <div class="col-sm-6">
                              <strong>Invoice Logo</strong>
                            <%  String invoicelogofile=menu.AdminDefaultValues.getAdminInvoiceLogo(usercid_adminid);
           
                            invoicelogofile=invoicelogofile.substring(0, invoicelogofile.length()-1);
                      if("0".equals(invoicelogofile) || "".equals(invoicelogofile)) {     %>
                          <img class="img-responsive" src="dist/img/u.png" alt="Photo">  
                          <% }else{  %>
                          <img class="img-responsive" src="uploads/logo/<%=invoicelogofile %>" alt="Photo" width="80" height="80">  
                           <% } %>
                          <br>
                          <% if("admin".equals(useraccountype)){  %>
                            <div class="box-footer">
              <form action="Fileupload" method="post"  enctype="multipart/form-data">  
                <input type="hidden" class="form-control"  name="type"  value="invoicelogoupload" >
                <input type="file" name="receipt"  required><br>
                  <button type="submit" onclick="return processing()" class="btn btn-primary ">Upload Logo</button>
              </form>
                   </div>
                    <% } %>      
                   </div>
                  </div>
  
              </div>
              <!-- /.box-body -->

            </form>
          </div>
          <!-- /.box -->
            </div>
        <!-- /.col -->
                </div>
            </section>
          <!-- /.content -->
             <div class="modal fade overlay  " id="waitingdisplay">
          <div class="modal-dialog">
            <div class="modal-content  alert-warning">
              
              <div class="modal-body">
                 Processing     <i  class="fa fa-spinner fa-spin" > </i>
              </div>
             
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
        </div>
        <!-- /.content-wrapper -->
        <jsp:include page="dist/include/footer.jsp" />
        <%    Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Leaving invoicesetting.jsp---------- Invoice Setting---");
        %>
        <!-- /.control-sidebar -->
        <!-- Add the sidebar's background. This div must be placed
             immediately after the control sidebar -->
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
    <!-- AdminLTE App -->
    <script src="dist/js/adminlte.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js"></script>
    <script src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <!-- page script -->
    <script>
      $(function () {
          $('#example7').DataTable()
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
      $(function () {
      
         //Date picker
        $('#datepicker1').datepicker({
            format: 'dd/mm/yyyy',
    
          autoclose: true
        })  
      
            })
  
    </script>
    <script>
      $(function () {
      
         //Date picker
        $('#datepicker2').datepicker({
            format: 'dd/mm/yyyy',
    
          autoclose: true
        })  
      
            })
  
    </script>
        <script>
  window.onload = function()        
{     var x='<%=warningmsg.length()%>'
      var y='<%=successmsg.length()%>'
   
     if(y>0){       
    document.getElementById("alert-message-success").innerHTML = "<%=successmsg %>";
     $('#show-success').modal('show')
 }
    
    if(x>0){       
    document.getElementById("alert-message-warning").innerHTML = "<%=warningmsg %>";
     $('#show-warning').modal('show')
 }
 
}   </script>
        <script>
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
