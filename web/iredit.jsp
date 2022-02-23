

<%@page import="blezz.Nd"%>
<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
<%@page import="blezz.Db"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="blezz.Poul"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8"><link rel="shortcut icon" href="dist/img/u.png" type="image/x-icon" /> 
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Interaction Record | INDSAC CRM</title>
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

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
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
 	
if (session != null) {
			if (session1.getAttribute("usercid_id") == null) {
				response.sendRedirect("signout.jsp");
			} 
		}
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"  --Entering iredit.jsp----------New Expense---");
%>
    
    
    <%  String msg=null;
           String pagetype=request.getParameter("pagetype");
          String type=request.getParameter("2a2e2a74797065");
    if(type!=null){type=Nd.Encrypt(type);}
    String tid=Poul.escapeHtml(request.getParameter("2a2e2a746964"));
             if(tid!=null){tid=Nd.Encrypt(tid);}
      String cid=Poul.escapeHtml(request.getParameter("2a2e2a636964"));
      if(cid!=null){cid=Nd.Encrypt(cid);}
          String message="";
       if("iredit".equals(pagetype)){
           
        String direction =Poul.escapeHtml(request.getParameter("direction"));
        String priority=Poul.escapeHtml(request.getParameter("priority"));
        String product=Poul.escapeHtml(request.getParameter("product"));
        String status=Poul.escapeHtml(request.getParameter("status"));
        String enquiry=Poul.escapeHtml(request.getParameter("enquiry"));
    
        String own=Poul.escapeHtml(request.getParameter("own"));
     try{
       
Connection c=Poul.getConnectionCRM();
Statement st=c.createStatement();
           ResultSet rs3;
               rs3 = st.executeQuery("select  *  FROM interactionrecord where id='"+tid+"' and useradminid='"+usercid_adminid+"' ");
    ResultSetMetaData rsmd=rs3.getMetaData();
     String aa="null",ab="null",ac="null",ad="null",ae="null",af="null",ag="null",ah="null",ai="null",aj="null",ak="null",al="null",am="null",an="null";
         
             ad=rsmd.getColumnName(4);
              ae=rsmd.getColumnName(5);
               af=rsmd.getColumnName(6);
                ag=rsmd.getColumnName(7);
                 ah=rsmd.getColumnName(8);
                  ai=rsmd.getColumnName(9);
                   aj=rsmd.getColumnName(10);
                    ak=rsmd.getColumnName(11);
                     al=rsmd.getColumnName(12);
                      am=rsmd.getColumnName(13);
                       an=rsmd.getColumnName(14);
        
  st.addBatch("update interactionrecord set   "+ad+"='"+direction+"',"+ae+"='"+status+"',"+af+"='"+priority+"',"+ag+"='"+enquiry+"',"+ai+"='"+product+"'  where id='"+tid+"' and useradminid='"+usercid_adminid+"'");
     st.executeBatch(); 
        String requestcid=cid;
        session.setAttribute("requestcid",cid);
             msg="success";   
             message="Interaction Record Edited Successfully";      
      rs3.close();
      st.close();
      c.close();   }
        catch(Exception e)
        {
           String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoicesetting.jsp-----\n"
     + "LINE=121 + \n select  *  FROM interactionrecord where id='"+tid+"' and useradminid='"+usercid_adminid+"  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
        }
        finally{
        }        
       }
        %>
    
   
<%
          String al[]=new String[35];       
          String cnt=request.getParameter("cnt");
        if(!"null".equals(cid)){
       try{
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from interactionrecord where id=? ");
        smt.setString(1,tid);
        
        ResultSet rs=smt.executeQuery();
        while(rs.next()){
            for(int i=1;i<34;i++){
               al[i]=rs.getString(i); 
            }
        }
     rs.close();
      smt.close();
      con.close();   }
        catch(Exception e){
               String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoicesetting.jsp-----\n"
     + "LINE=152 + \n select  *  FROM interactionrecord where id='"+tid+"' and useradminid='"+usercid_adminid+"  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
                }
       //System.out.println(al.size());      
        }  
      %>
<div class="wrapper">

   <jsp:include page="dist/include/leftmenu.jsp" /> 
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
	 <section class="content-header">

<% if(!"".equals(message)){  %> 
        <div class="row"><div class="col-md-2"></div>
        <div class="col-md-6"> 
        <div class="alert alert-success alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <i class="icon fa fa-check"></i> 
                <%=message %>
        </div>  </div></div>   <% } %>	
	 <div class="row invoice">
        <div class="col-xs-12">
		 <!-- Default box -->
      <div class="box box-warning box-socid">
        <div class="box-header with-border">
          <h3 class="box-title"> Interaction Record</h3>
          <h6 class="pull-right"><%="Created By:"+Db.getEmployeeName(al[12])+" , "+al[2]  %></h6>
<!-- form start -->
            <form class="form-horizontal" action="" method="post">        
        </div>   
          <input type="hidden" class="form-control"  name="own"  value="<%=al[13] %>">
 	    <div class="col-md-6">
		 <div class="box ">
            <div class="box-body">
                   <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label"> Contact Name</label>
                  <div class="col-sm-10">
                      <%  if(!"null".equals(al[13])){ String data[]=new String [5];
                      data=Db.getCustomerName(al[13], al[11]); if(("customer").equals(data[4])){data[4]="contact";}
                      %>
                      <a href="<%=data[4] %>details.jsp?esfhrttrfhardersg=<%=Nd.Encrypt(al[13]) %>&2a2e2a74797065=<%=Nd.Encrypt(data[4]) %>"><button type="button" class="col-sm-10 btn btn-warning pull-left"> <% if("".equals(data[2])||"null".equals(data[2])){ out.print(data[3]);} else {out.print(data[2]);} %> </button></a>
           <% }  
           %>
                  </div>
                      </div> <br><br>
	        <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">Date/Time</label>
                 <div class="col-sm-10">
                      <input type="text" class="form-control" id="date"  name="date" placeholder="<%=al[2] %>" value="<%=al[2] %>" disabled="">
                  </div>
                </div>
                  <br><br>
		 <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Direction</label>
                <div class="col-sm-10">
                 <select id="direction" name="direction" class="form-control" >
                        <option value="<%=al[4] %>"> <%=al[4] %></option> 
                     <option value="Outbound"> Outbound</option>
                          <option value="Inbound">Inbound</option>
                          <option value="Email">Email</option>
                          <option value="Chat"> Chat</option>
                   </select>  </div>
				  </div>
                     <!-- /.form group --><br><br>          
				 <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Priority</label>
                  <div class="col-sm-10">
                 <select id="priority" name="priority" class="form-control"  value="<%=al[6] %>">
                     <option value="<%=al[6] %>"> <%=al[6] %></option>
                          <option value="Midium"> Midium</option>
                          <option value="High">High</option>
                          <option value="Low">Low</option>                          
                     </select>
                  </div>                      
                     </div>   <br><br>                                 
		<div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Status</label>
                  <div class="col-sm-10">
                 <select id="status" name="status" class="form-control" value="<%=al[5] %>">
                     <option value="<%=al[5] %>"> <%=al[5] %></option>
                           <option value="Close"> Close</option>
                          <option value="Open">Open</option>                         
                     </select>
                  </div>
                  </div><br><br>
             </div>
              <!-- /.box-body -->
       </div>
          <!-- /.box -->
       </div>
        <!--/.col (left) -->
         <%
           int i=0,j=0; 
           String count2="0";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from stock where useradminid=? ");
        smt.setString(1,usercid_adminid );
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count2=rs.getString(1);  }
    rs.close();
      smt.close();
      con.close();    } catch(Exception e)
      { 
          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoicesetting.jsp-----\n"
     + "LINE=259 + \n select count(*) from stock where useradminid="+usercid_adminid+"  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      }     
       int n2=Integer.parseInt(count2);
       String taskdata2[][]=new String[n2+1][17];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from stock  where useradminid=?");
         smt.setString(1,usercid_adminid );
       
        ResultSet rs=smt.executeQuery();
     i=1;
        while(rs.next())
        { 
           for( j=1;j<=16;j++)
          {
            taskdata2[i][j]=rs.getString(j);           
          }
           ++i;  
        }
    rs.close();
      smt.close();
      con.close();    } catch(Exception e)
      {
          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoicesetting.jsp-----\n"
     + "LINE=284 + \n select * from stock  where useradminid="+usercid_adminid+"  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      }
      %>
      
        <div class="col-md-6">
          <!-- Horizontal Form -->
           <!-- general form elements -->
          <div class="box">
            <!-- /.box-header -->
            <!-- form start -->
              <div class="box-body">
                      <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Product</label>
                 <div class="col-sm-10">
                          <select id="productname" name="product" class="form-control"  >
                                <option value="<%=al[9] %>"><%=al[9] %></option>
                      <% for(i=1;i<=n2;++i){  %>
                         <option value="<%=taskdata2[i][2]  %>"><% out.println(taskdata2[i][2]);  %></option>
                        <% }  %>
                     </select>
                  </div>
		 </div>
               <br><br>
	<div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Enquiry</label>
                  <div class="col-sm-10">
                 <textarea class="form-control" rows="7" id="enquiry" name="enquiry" placeholder="<%=al[7] %>" ><%=al[7] %></textarea>
                 <input type="hidden" name="pagetype" value="iredit">
                 <input type="hidden" name="2a2e2a636964" value="<%=Nd.Encrypt(cid) %>">
                 <input type="hidden" name="2a2e2a746964" value="<%=Nd.Encrypt(tid) %>">
                  </div>
                </div>
            </div>
              <!-- /.box-body -->
			    <div class="box-footer clearfix no-border">
		  <button type="button" class="btn btn-default pull-left" onclick="goBack()"> Cancel</button>
              <button type="submit" class="btn btn-info pull-right"onClick="return validateForm()"> Save</button>
            </div>          
            </form>
          </div>
          <!-- /.box -->
  </div>
        <!--/.col (right) -->
 </div>
      <!-- /.box -->
</div>
		</div>
</section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
<jsp:include page="dist/include/footer.jsp" />
  <%    Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Leaving iredit.jsp------");
        %>
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
     if(document.getElementById("enquiry").value!=""){
           
           if(!document.getElementById("enquiry").value.match(/^[a-zA-Z:,'-'' '\.0-9\n]+$/)){
                     document.getElementById("alert-message").innerHTML = " Enquiry: Only this Charachters a-z A-Z 0-9 . , : '' allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("enquiry").focus();
     return false;
            } else
        if(document.getElementById("enquiry").value.length>2000){
                         document.getElementById("alert-message").innerHTML = " Enquiry: Only 2000 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("enquiry").focus();
           
           return false;
       }}
    return true;
}
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
