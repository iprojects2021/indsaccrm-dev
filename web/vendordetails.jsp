<%@page import="blezz.Nd"%>
<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="blezz.Poul"%>
<%@page import="blezz.Db"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="dist/img/u.png" type="image/x-icon" /> 
     <style>
    .example-modal .modal {
      position: relative;
      top: auto;
      bottom: auto;
      right: auto;
      left: auto;
      display: block;
      z-index: 1;
    }

    .example-modal .modal {
      background: transparent !important;
    }
  </style>
  
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Vendor | INDSAC CRM</title>
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

 <style>
      .modal-header,.close 
  {
      background-color:#6495ED;
      color:white !important;
      text-align: left;
      font-size: 20px;
  }
  .modal-footer {
      background-color: #f9f9f9;
  }
  .sidebar-form{
      background-color: #f9f9f9;
  }
  </style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <% HttpSession session1 = request.getSession(); // reuse existing
     String vid=request.getParameter("2a2e2a766964");
     if(vid!=null){vid=Nd.Decrypt(vid);}
          String usercid_id=(String)session1.getAttribute("usercid_id");
          String usercid_email=(String)session1.getAttribute("usercid_email");
          String useraccountype=(String)session1.getAttribute("useraccountype");
          String usercid_name=(String)session1.getAttribute("usercid_name");
          String usercid_adminid=(String)session1.getAttribute("usercid_adminid");
             String usercid_company=(String)session1.getAttribute("usercid_company");
          String usercid_website=(String)session1.getAttribute("usercid_website"); 
        	
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" ,vendorid="+vid+" --Entering vendordetails.jsp----------Vendor Details---");
   	
if (session != null) {
			if (session1.getAttribute("usercid_id") == null) {
				response.sendRedirect("signout.jsp");
			} 
		}
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" ,vendorid="+vid+" --Entering vendordetails.jsp----------Vendor Details---");
%>


<%
         String a1[]=new String[50];
         
          String type=request.getParameter("2a2e2a74797065");
          if(type!=null){type=Nd.Decrypt(type);}
            String esfhrttrfhardersg=request.getParameter("esfhrttrfhardersg");//value from taskedit.jsp for (assigned by)
         if(esfhrttrfhardersg!=null ){ vid=Nd.Decrypt(esfhrttrfhardersg);}
          
        String requestid=(String)session.getAttribute("requestid");
       
        if("null"!=vid && "vendor".equals(type)||vid!=null&& "vendor".equals(type)){requestid=vid;
        
        }
          if(requestid==null || requestid==""){response.sendRedirect("vendor.jsp");}
      try{
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from contact where id=?");
        smt.setString(1,requestid);
        ResultSet rs=smt.executeQuery();
        while(rs.next()){
            for(int i=1;i<49;i++){
                a1[i]=(rs.getString(i)); 
              
            }
        }
     rs.close();
      smt.close();
      con.close();   }
        catch(Exception e){
                    String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n vendordetails.jsp-----\n"
     + "LINE=125 \n select * from contact where id=?"+requestid+"  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
                }
       session.setAttribute("requestid","");
       //System.out.println(al.size());
      %>
 <jsp:include page="dist/include/leftmenu.jsp" />  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
     <div class="row">
	 <div class="col-md-12">
          <!-- Widget: user widget style 1 -->
          <div class="box box-widget widget-user">
            <!-- Add the bg color to the header using any of the bg-* classes -->
            <div class="widget-user-header bg-black" style="background: url('dist/img/photo1.png') center center;">
              <h3>Vendor Details</h3>
<%
      String msg=(String)session.getAttribute("submitmsg");
      String modifymsg=(String)session.getAttribute("modifymsg");
     if(msg!=null && msg.equals("success")){ %>
     <div class="alert alert-success alert-dismissable">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
    <strong>Success!</strong> <%=modifymsg%>.
  </div>
    <%}else if(msg!=null && msg.equals("fail")){%>
    <div class="alert alert-danger alert-dismissable">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
    <strong>Failed!</strong> Something wrong please try again...
  </div>
    <%}
    session.removeAttribute("submitmsg");
    session.removeAttribute("modifymsg");
    %>
            </div>
            <div class="widget-user-image">
              <img class="img-circle" src="dist/img/user.png" alt="User Avatar">
            </div>
            <div class="box-footer">
            <div class="row">
                 
                <div class="col-sm-4 ">
                   
                    <div class="description-block">
                         
			<h1 align="left"><%if(a1[6]!=null&&!"".equals(a1[6])&&!"null".equals(a1[6])){out.print(a1[6]);}%> <%if(a1[7]!=null&&!"".equals(a1[7])&&!"null".equals(a1[7])){out.print(" "+a1[7]);}%></h1>
		
                        
                        <%if(a1[5]!=null&&!a1[5].equals("")&&!a1[5].equals("null")){%> <h5 align="left">Company &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp;<% out.print(a1[5]); %>  </h5><%}%>
		 <%if(a1[8]!=null&&!a1[8].equals("")&&!a1[8].equals("null")){%>  <h5 align="left">Department&nbsp;&nbsp;&nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp;<% out.print(a1[8]); %>  </h5><%}%>
                 <%if(a1[9]!=null&&!a1[9].equals("")&&!a1[9].equals("null")){%> <h5 align="left">  Designation&nbsp;&nbsp;&nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp;<% out.print(a1[9]); %>  </h5><%}%>
              <%if(a1[10]!=null&&!a1[10].equals("")&&!a1[10].equals("null")){%> <h5 align="left"> DOB&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp; <% out.print(a1[15]); %>  </h5><%}%>
             <%if(a1[13]!=null&&!a1[13].equals("")&&!a1[13].equals("null")){ %><h5 align="left">Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp;<span class="label label-success"><% out.print(a1[13]);%></span></h5> <% } %>
		
              
              <%if(a1[14]!=null&&!a1[14].equals("")&&!a1[14].equals("null")){%>  <h5 align="left">Report To&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp;<% out.print(a1[14]); %>  </h5><%}%>
               <%if(a1[15]!=null&&!a1[15].equals("")&&!a1[15].equals("null")){%>  <h5 align="left">Source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp;<% out.print(menu.Marketing.getEventName(a1[15])); %>  </h5><%}%>
               <%if(a1[17]!=null&&!a1[17].equals("")&&!a1[17].equals("null")){%>  <h5 align="left">Vendor Name&nbsp;<strong>:</strong>&nbsp;&nbsp;<% out.print(a1[17]); %>  </h5><%}%>
               <%if(a1[18]!=null&&!a1[18].equals("")&&!a1[18].equals("null")){%>  <h5 align="left">Website&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp;<% out.print(a1[18]); %>  </h5><%}%>
               <%if(a1[38]!=null&&!a1[38].equals("")&&!a1[38].equals("null")){%>  <h5 align="left"><strong>GSTIN</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>:&nbsp;&nbsp;<% out.print(a1[38]); %> </strong> </h5><%}%>
              
			
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
                <div class="col-sm-4 ">
                    <div class="description-block"> <br> <br> <br>
                   <h5 class="description-header">Contact</h5>
      <%if(a1[19]!=null&&!a1[19].equals("")&&!a1[19].equals("null")){%>  <span class="description-text" align="left"> Best Way&nbsp;&nbsp;&nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp; <%=a1[19]%> </span><br><% } %>
      <%if(a1[20]!=null&&!a1[20].equals("")&&!a1[20].equals("null")){%>  <span class="description-text" align="left">  Phone&nbsp;&nbsp;&nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp; <%=a1[20]%> </span><br><% } %>
      <%if(a1[21]!=null&&!a1[21].equals("")&&!a1[21].equals("null")){%>  <span class="description-text" align="left"> Phone&nbsp;&nbsp;&nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp; <%=a1[21]%> </span><br><% } %>
      <%if(a1[22]!=null&&!a1[22].equals("")&&!a1[22].equals("null")){%>  <span class="description-text" align="left"> Phone&nbsp;&nbsp;&nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp; <%=a1[22]%> </span><br><% } %>
      <%if(a1[23]!=null&&!a1[23].equals("")&&!a1[23].equals("null")){%>  <span class="description-text" align="left">  <%=a1[23]%> </span><br><% } %>
      <%if(a1[24]!=null&&!a1[24].equals("")&&!a1[24].equals("null")){%>  <span class="description-text" align="left"> <%=a1[24]%> </span><br><% } %>
     <%if(a1[25]!=null&&!a1[25].equals("")&&!a1[25].equals("null")){%>  <span class="description-text" align="left"> Fax&nbsp;&nbsp;&nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp; <%=a1[25]%> </span><br><% } %>
      <%if(a1[26]!=null&&!a1[26].equals("")&&!a1[26].equals("null")){%>  <span class="description-text" align="left"> Other Account&nbsp;&nbsp;&nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp; <%=a1[26]%> </span><br><% } %>
      <%if(a1[27]!=null&&!a1[27].equals("")&&!a1[27].equals("null")){%>  <span class="description-text" align="left"> Other Account Name&nbsp;&nbsp;&nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp; <%=a1[27]%> </span><br><% } %>
 
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
                <div class="col-sm-4">
                  <div class="description-block"><br> <br> <br>
                   <h5 class="description-header">Address</h5>
     <%if(a1[28]!=null&&!a1[28].equals("")&&!a1[28].equals("null")){%>  <span class="description-text">  <%=a1[28]%> </span><br><% } %>
      <%if(a1[31]!=null&&!a1[31].equals("")&&!a1[31].equals("null")){%>  <span class="description-text">  <%=a1[31]%> </span><br><% } %>
      <%if(a1[32]!=null&&!a1[32].equals("")&&!a1[32].equals("null")){%>  <span class="description-text">  <%=a1[32]%> </span><br><% } %>
      <%if(a1[33]!=null&&!a1[33].equals("")&&!a1[33].equals("null")){%>  <span class="description-text"> <%=a1[33]%> </span><br><% } %>
      <%if(a1[34]!=null&&!a1[34].equals("")&&!a1[34].equals("null")){%>  <span class="description-text">  <%=a1[34]%> </span><br><% } %>
      <%if(a1[35]!=null&&!a1[35].equals("")&&!a1[35].equals("null")){%>  <span class="description-text"> <%=a1[35]%> </span><br><% } %>
                    
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->
	
		
	<div class="row">
	<div class="col-sm-3">
            <button type="button"  class="btn btn-block btn-primary" onclick="location.href = 'task.jsp?2a2e2a636964=<%=Nd.Encrypt(requestid) %>&2a2e2a74797065=2a2e2a76656e646f72';"><i class="fa fa-fw fa-edit"></i>Create Task</button>
	</div>
	<div class="col-sm-3">
	 <button type="button" class="btn btn-block btn-primary"v onclick="location.href = 'addstock.jsp?vid=<%=requestid %>';"><i class="fa fa-fw fa-upload"></i>Add Stock</button>
	</div>
	<div class="col-sm-3">
            <a href="vendoredit.jsp?2a2e2a766964=<%=Nd.Encrypt(requestid) %>">    <button type="button" class="btn btn-block btn-primary"><i class="fa fa-fw fa-edit"></i>Edit Vendor Details</button></a>
	</div>
	<div class="col-sm-3">
	<button type="button" class="btn btn-block btn-primary"><i class="fa fa-fw fa-times"></i>Send Email</button>
	</div>
	</div>


	
	
    </section>
<%
           int i=1,j=0;
           String count="NULL";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from task where customerid=?");
        smt.setString(1,requestid);
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count=rs.getString(1);  }
      rs.close();
      smt.close();
      con.close();  } catch(Exception e){ 
                     String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n vendordetails.jsp-----\n"
     + "LINE=260 \n select count(*) from task where customerid="+requestid+"  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
      
      }
      
       int n=Integer.parseInt(count);
       String taskdata[][]=new String[n+1][55];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from task where customerid=?");
        smt.setString(1,requestid);
        ResultSet rs=smt.executeQuery();
     i=1;
        while(rs.next())
        { 
           for( j=1;j<=32;j++)
          {
            taskdata[i][j]=rs.getString(j); 
           
          }
           ++i;  
        }
    rs.close();
      smt.close();
      con.close();    } catch(Exception e){
 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n vendordetails.jsp-----\n"
     + "LINE=287 \n select * from task where customerid="+requestid+"  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
      }
      %>
   <!-- Main content -->
    <section class="content">
	
		 <div class="row">
    <div class="col-md-6">
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Interaction Record</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form class="form-horizontal" action="irsubmit.jsp" method="get">
              <div class="box-body">
			  <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Direction</label>

                  <div class="col-sm-10">
                  <select id="direction" name="direction" class="form-control">
                          <option value="Outbound"> Outbound</option>
                          <option value="Inbound">Inbound</option>
                          <option value="Email">Email</option>
                          <option value="Chat"> Chat</option>
                         
                          
                     </select>
                  </div>
				  </div>
			    <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Status</label>

                  <div class="col-sm-4">
                 <select id="status" name="status1" class="form-control">
                          <option value="Close"> Close</option>
                          <option value="Open">Open</option>
                         
                         
                          
                     </select>
                  </div>
               
                  <label for="inputPassword3" class="col-sm-2 control-label">Priority</label>

                  <div class="col-sm-4">
                 <select id="priority" name="priority1" class="form-control">
                          <option value="Midium"> Midium</option>
                          <option value="High">High</option>
                          <option value="Low">Low</option>
                    
                     </select>
                  </div>
                </div>
                   <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Product</label>

                  <div class="col-sm-10">
                  <select id="direction" name="product" class="form-control">
                         <option value="Camphor Jar">Camphor Jar</option>
                          <option value="Plastic Jar">Plastic Jar</option>
                          <option value="RO Water Filter"> RO Water Filter</option>
                          <option value="Dhoopbatti">Dhoopbatti</option>
                          <option value="BOPP Tape">BOPP Tape</option>
                          
                     </select>
                  </div>
				  </div>
				   <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label"> Enquiry</label>

                  <div class="col-sm-10">
                      <textarea class="form-control" name="enquiry" rows="3" placeholder=" Enquiry"></textarea>
                      <input type="hidden" name="2a2e2a636964" value="<%=Nd.Encrypt(requestid) %>">
                           <input type="hidden" name="2a2e2a74797065" value="2a2e2a76656e646f72">
                 
                  </div>
                </div>
			
              
              </div>
			
              <!-- /.box-body -->
              <div class="box-footer">
               <button type="submit" class="btn btn-info pull-right">Submit</button>
              </div>
              <!-- /.box-footer -->
            </form>
          </div>
          <!-- /.box -->
         
           
           
          
        </div>
        <!-- ./col -->
         <div class="col-md-6">
          <div class="box box-info">
            <div class="box-header with-border">
              <i class="fa fa-text-width"></i>

              <h3 class="box-title">Notes</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <textarea class="form-control" rows="11" readonly ><%  if((a1[37])!=null&&!(a1[37]).equals("")&&!(a1[37]).equals("null")){out.print((a1[37]));}%></textarea>
                 
            </div>
            <!-- /.box-body -->
			 <div class="box-footer clearfix">
             
			  <a href="vendoredit.jsp?2a2e2a766964=<%=Nd.Encrypt(requestid) %>" class="btn btn-sm btn-info btn-flat pull-right"> Edit</a>
             
            </div>
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
        </div>
        <!-- ./col -->	
        </div>
        <!-- ./row -->	
        
        
        
         
	<%
           
           String count2="NULL";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from stocklog where customerid=? and type=?");
        smt.setString(1,requestid);
        smt.setString(2,"add");
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count2=rs.getString(1);  }
      rs.close();
      smt.close();
      con.close();  } catch(Exception e){
          
         String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n vendordetails.jsp-----\n"
     + "LINE=429 \n select count(*) from stocklog where customerid="+requestid+" and type=add ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
      
      }
      
       int n2=Integer.parseInt(count2);
       String taskdata2[][]=new String[n2+1][55];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from stocklog where customerid=? and type=?");
        smt.setString(1,requestid);
        smt.setString(2,"add");
        ResultSet rs=smt.executeQuery();
     i=1;
        while(rs.next())
        { 
           for( j=1;j<=33;j++)
          {
            taskdata2[i][j]=rs.getString(j); 
           
          }
           ++i;  
        }
     rs.close();
      smt.close();
      con.close();   } catch(Exception e){
          
           String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n vendordetails.jsp-----\n"
     + "LINE=458 \n select * from stock where customerid="+requestid+" type=add  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
      
      }
      %>
  
	 <div class="row">
        <div class="col-xs-12">
      

          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Product Record </h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example4" class="table table-bordered table-striped">
                <thead>
                <tr>
                   <th>Date and Time  </th>
                  <th>Product</th>
                  <th>Quantity</th>
                    <th>Bill No</th>
                 <th>  Status</th>
                  <th> Created By</th>
                </tr>
                </thead>
                <tbody>
                <% int m2=0; for(m2=n2;m2>0;m2--) {  %>
                  <tr>
                      <td><a  href="productrecord.jsp?2a2e2a706964=<%=Nd.Encrypt(taskdata2[m2][1]) %>"><% out.print(taskdata2[m2][2]); %></a></td>
                       <td><% out.print(taskdata2[m2][5]); %></td>
                   <td><% out.print(taskdata2[m2][11]); %></td>
                   <td><% out.print(taskdata2[m2][13]); %></td>
                    <td><% if(taskdata2[m2][8].equals("InActive")) {   %>
                           <span class="label label-default"><% out.print(taskdata2[m2][8]); %></span>
                        <% } %>
                        <% if(taskdata2[m2][8].equals("Active")) {   %>
                           <span class="label label-info"><% out.print(taskdata2[m2][8]); %></span>
                        <% } %>
                       
                     </td>
                   <td> 
                      <%=Db.getEmployeeName(taskdata2[m2][32]) %>
                   </td>
                  </tr>
         
                  <% } %>
                 
               
                </tbody>
               
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
        
        
        <div class="row">
	 <div class="col-xs-12">
      

          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Task </h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example2" class="table table-bordered table-striped">
                <thead>
                <tr>
                   <th>Task ID  </th>
                  <th>Subject</th>
                  <th>Status</th>
                  <th>  Due Date</th>
                  <th> Priority</th>
                </tr>
                </thead>
                <tbody>
                <%  int m=0; for(m=n;m>0;m--) {  %>
                  <tr>
                      <td><a href="taskedit.jsp?2a2e2a746964=<%=Nd.Encrypt(taskdata[m][1]) %>"><% out.print("TSK"+taskdata[m][1]); %></a></td>
                    <td><% out.print(taskdata[m][4]); %></td>
                    <td><% if(taskdata[m][7].equalsIgnoreCase("Open")) {   %>
                           <span class="label label-danger"><% out.print(taskdata[m][7]); %></span>
                        <% } %>
                        <% if(taskdata[m][7].equals("In Process")) {   %>
                           <span class="label label-warning"><% out.print(taskdata[m][7]); %></span>
                        <% } %>
                        <% if(taskdata[m][7].equals("Complete")) {   %>
                           <span class="label label-success"><% out.print(taskdata[m][7]); %></span>
                        <% } %>
                        <% if(taskdata[m][7].equals("Cancelled")) {   %>
                           <span class="label label-default"><% out.print(taskdata[m][7]); %></span>
                        <% } %>
                        <% if(taskdata[m][7].equals("Rejected")) {   %>
                           <span class="label label-default"><% out.print(taskdata[m][7]); %></span>
                        <% } %>
                         <% if(taskdata[m][7].equals("Follow Up")) {   %>
                           <span class="label label-info"><% out.print(taskdata[m][7]); %></span>
                        <% } %>
                     </td>
                   <td><% out.print((taskdata[m][5]).substring(0,10));  %></td>
                   <td> <% if(taskdata[m][6].equals("Very High")) {   %>
                           <span class="label label-danger"><% out.print(taskdata[m][6]); %></span>
                        <% } %>
                        <% if(taskdata[m][6].equals("Normal")) {   %>
                           <span class="label label-info"><% out.print(taskdata[m][6]); %></span>
                        <% } %>
                         <% if(taskdata[m][6].equals("High")) {   %>
                           <span class="label label-warning"><% out.print(taskdata[m][6]); %></span>
                        <% } %>
                        <% if(taskdata[m][6].equals("Critical Situation")) {   %>
                           <span class="label label-danger"><% out.print(taskdata[m][6]); %></span>
                        <% } %>
                        <% if(taskdata[m][6].equals("Midium")) {   %>
                           <span class="label label-default"><% out.print(taskdata[m][6]); %></span>
                        <% } %>
                        <% if(taskdata[m][6].equals("Low")) {   %>
                           <span class="label label-default"><% out.print(taskdata[m][6]); %></span>
                        <% } %>  
                   </td>
                  </tr>
         
                  <% } %>
                 
               
                </tbody>
               
              </table>
            </div>
            <!-- /.box-body -->
             <div class="box-footer clearfix">
              <a href="task.jsp?2a2e2a636964=<%=Nd.Encrypt(requestid) %>&2a2e2a74797065=2a2e2a76656e646f72" class="btn btn-sm btn-info btn-flat pull-left">Create Task</a>
            </div>
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
	

</div> <!--/.row  -->
	
	 <div class="row">
  <div class="col-md-6">
		
		

        </div>
        <!--/.col (left) -->
		
		
		

</div> <!--/.row  -->
	
	

	 
	<%
           
           String count1="NULL";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from interactionrecord where customerid=?");
        smt.setString(1,requestid);
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count1=rs.getString(1);  }
      rs.close();
      smt.close();
      con.close();  } catch(Exception e){
      String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n vendordetails.jsp-----\n"
     + "LINE=637 \n select count(*) from interactionrecord where customerid="+requestid+"  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
      }
      
       int n1=Integer.parseInt(count1);
       String taskdata1[][]=new String[n1+1][55];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from interactionrecord where customerid=?");
        smt.setString(1,requestid);
        ResultSet rs=smt.executeQuery();
     i=1;
        while(rs.next())
        { 
           for( j=1;j<=32;j++)
          {
            taskdata1[i][j]=rs.getString(j); 
           
          }
           ++i;  
        }
     rs.close();
      smt.close();
      con.close();   } catch(Exception e){
        String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n vendordetails.jsp-----\n"
     + "LINE=663 \n select * from interactionrecord where customerid="+requestid+"  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
      }
      %>
  
	 <div class="row">
        <div class="col-xs-12">
      

          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Interaction Record </h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                   <th>Date and Time  </th>
                  <th>Product</th>
                  <th>Direction</th>
                  <th>  Status</th>
                  <th> Priority</th>
                </tr>
                </thead>
                <tbody>
                <% int m1=0; for(m1=n1;m1>0;m1--) {  %>
                  <tr>
                      <td><a  href="iredit.jsp?2a2e2a746964=<%=Nd.Encrypt(taskdata1[m1][1]) %>"><% out.print(taskdata1[m1][2]); %></a></td>
                      
                    <td><% out.print(taskdata1[m1][9]); %></td>
                    <td><% out.print(taskdata1[m1][4]); %></td>
                    <td><% if(taskdata1[m1][5].equals("Open")) {   %>
                           <span class="label label-info"><% out.print(taskdata1[m1][5]); %></span>
                        <% } %>
                        <% if(taskdata1[m1][5].equals("Close")) {   %>
                           <span class="label label-default"><% out.print(taskdata1[m1][5]); %></span>
                        <% } %>
                       
                     </td>
                   
                   <td> <% if(taskdata1[m1][6].equals("Midium")) {   %>
                           <span class="label label-warning"><% out.print(taskdata1[m1][6]); %></span>
                        <% } %>
                        <% if(taskdata1[m1][6].equals("High")) {   %>
                           <span class="label label-info"><% out.print(taskdata1[m1][6]); %></span>
                        <% } %>
                         <% if(taskdata1[m1][6].equals("Low")) {   %>
                           <span class="label label-default"><% out.print(taskdata1[m1][6]); %></span>
                        <% } %>
                      
                   </td>
                  </tr>
         
                  <% } %>
                 
               
                </tbody>
               
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
      
      
	
       <div class="row">
 <div class="col-md-12">
 <div class="box">
 <div class="box-header">
              <h3 class="box-title">Products	</h3>
            </div>
 <div class="box-body table-responsive pad">
    <div class="col-md-1">
	<button type="button" class="btn btn-default">Middle1</button>
	</div>
	<div class="col-md-1">
	<button type="button" class="btn btn-default">Middle2</button>
	</div>
	<div class="col-md-1">
	<button type="button" class="btn btn-default">Middle3</button>
	</div>
	<div class="col-md-1">
	<button type="button" class="btn btn-default">Middle4</button>
	</div>
	<div class="col-md-1">
	<button type="button" class="btn btn-default">Middle5</button>
	</div>
	<div class="col-md-1">
	<button type="button" class="btn btn-default">Middle6</button>
	</div>
	
	
	
	 <!-- col-md-1 -->
	 </div>
	  <!-- box body -->
	  </div>
	  <!-- box  -->
	  </div>
	  <!-- col-md-12 -->
</div>
<!-- row -->
    
        
	  
	
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
<jsp:include page="dist/include/footer.jsp" />
 <% Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" ,vendorid="+vid+"--Leaving vendordetails.jsp----------Vendor Details---");
   	
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
<script>
  $(function () {
    $('#example2').DataTable()
     $('#example1').DataTable()
     $('#example4').DataTable()
  
  })
</script>
</body>
</html>
