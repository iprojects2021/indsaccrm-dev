<%@page import="blezz.Nd"%>
<%@page import="menu.AdminDefaultValues"%>
<%@page import="menu.Default"%>
<%@page import="menu.Task"%>
<%@page import="menu.ServiceRequest"%>
<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
<%@page import="blezz.Db"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="blezz.Poul"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>     <link rel="shortcut icon" href="dist/img/u.png" type="image/x-icon" /> 
 
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Dashboard | INDSAC CRM</title>
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
<body class="hold-transition skin-blue sidebar-mini" onload="showNotification()">
    <% HttpSession session1 = request.getSession(); // reuse existing
    
          String usercid_id=(String)session1.getAttribute("usercid_id");
          String usercid_email=(String)session1.getAttribute("usercid_email");
          String useraccountype=(String)session1.getAttribute("useraccountype");
          String usercid_name=(String)session1.getAttribute("usercid_name");
          String usercid_adminid=(String)session1.getAttribute("usercid_adminid");
             String usercid_company=(String)session1.getAttribute("usercid_company");
          String usercid_website=(String)session1.getAttribute("usercid_website"); 
        	 String usercid_avatar=(String)session1.getAttribute("usercid_avatar"); 
        
	Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Entering dashboard.jsp----------Main Dashboard---");
   
if (session != null) {
			if (session1.getAttribute("usercid_id") == null) {
				response.sendRedirect("signout.jsp");
			} 
		}

%>

<%  int defaultexist=Default.isDefaultExist(usercid_adminid,usercid_id);
      if(defaultexist==0){   if(usercid_adminid!=null && usercid_id!=null ){
          Default.createDefault(usercid_adminid, usercid_id);
      } }
       int admindefaultexist=AdminDefaultValues.isAdminDefaultExist(usercid_adminid);
      if(admindefaultexist==0){   if(usercid_adminid!=null && usercid_id!=null ){
          AdminDefaultValues.createAdminDefault(usercid_adminid);}}
      menu.AdminDefaultValues.doInvoiceLogoReady(usercid_adminid);
       String a1[]=new String[50];
          String cid=request.getParameter("cid");
          String type=request.getParameter("type");
        String requestcid=null;
        requestcid=(String)session.getAttribute("requestcid");
       
        cid=usercid_id;
        requestcid=usercid_id;
    
       //System.out.println(al.size());
      %>
      
         
         
      <%
          //open tasks
       String contactcreated="";
       try{
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from contact   where useradminid=? and usercid=? and customertype=? ");
        smt.setString(1,usercid_adminid);
        smt.setString(2,usercid_id);
        smt.setString(3,"customer");
        
        ResultSet rs=smt.executeQuery();
        while(rs.next()){
            
               contactcreated=rs.getString(1); 
              
            
        }
     rs.close();
      smt.close();
      con.close();   }
        catch(Exception e){
                  String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n dashboard.jsp-----\n"
     + "LINE=133\n sselect count(*) from contact   where useradminid="+usercid_adminid+" and usercid="+requestcid+" and customertype=customer  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
                }
       //System.out.println(al.size());
      %>
       
         <%
          //open tasks
       String openSR="";
       try{
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from servicerequest   where useradminid=? and asignedto=? and (status=? or status=? or status=?)");
        smt.setString(1,usercid_adminid);
        smt.setString(2,requestcid);
        smt.setString(3,"Open");
        smt.setString(4,"Follow Up");
        smt.setString(5,"In Process");
        ResultSet rs=smt.executeQuery();
        while(rs.next()){
            
               openSR=rs.getString(1); 
              
            
        }
     rs.close();
      smt.close();
      con.close();   }
        catch(Exception e){
                  String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n dashboard.jsp-----\n"
     + "LINE=194\n select count(*) from servicerequest where  where useradminid="+usercid_adminid+" and asignedto="+requestcid+" and status=Open or status=Follow Up or status=In Process  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
                }
       //System.out.println(al.size());
       int myOpenTask=0;
          myOpenTask=Task.getMyOpenTaskCount(usercid_adminid, usercid_id);
      %>
    <div class="wrapper">
         <!-- Preloader -->
 
      <jsp:include page="dist/include/leftmenu.jsp" />  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" >
      <section class="content-header" >
     <h1>Dashboard</h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>
    <!-- Content Header (Page header) -->
    <section class="content-header">
       <div class="row">
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-aqua">
                <div class="inner">
                  <h3> <%=myOpenTask %></h3>
                  <p>Open Tasks</p>
                </div>
                <div class="icon">
                  <i class="fa fa-tasks"></i>
                </div>
                   <a href="#opentask" class="small-box-footer">
              More info <i class="fa fa-arrow-circle-right"></i>
            </a>
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-green">
                <div class="inner">
                  <h3>  <% out.print(openSR);%></h3>
                  <p>Open Service Request</p>
                </div>
                <div class="icon">
                  <i class="fa fa-file-text-o"></i>
                </div>
                   <a href="#openSR" class="small-box-footer">
              More info <i class="fa fa-arrow-circle-right"></i>
            </a>
              </div>
            </div><!-- ./col -->
            
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-yellow">
                <div class="inner">
                    <h3><%=contactcreated %></h3>
                  <p>Contact Created</p>
                </div>
                <div class="icon">
                  <i class="ion ion-person-add"></i>
                </div>
                   <a href="#" class="small-box-footer">
              More info <i class="fa fa-arrow-circle-right"></i>
            </a>
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-red">
            <div class="inner">
                
                <h3><%=(ServiceRequest.getSRPendingDueDatesCount(usercid_adminid,usercid_id)+Task.getTaskPendingDueDatesCount(usercid_adminid, usercid_id))  %></h3>

              <p>Pending by Due Dates </p>
            </div>
            <div class="icon">
              <i class="ion ion-pie-graph"></i>
            </div>
                <a href="pendingtsr.jsp" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
            </div><!-- ./col -->
          </div><!-- /.row -->
   
    </section>

   <!-- Main content -->
    <section class="content">
        
        
           <%
           int i=1,j=0;
           String count="NULL";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from servicerequest where useradminid=? and asignedto=? and  approvalstatus=?");
           smt.setString(1,usercid_adminid);
        smt.setString(2,usercid_id);
    smt.setString(3,"Pending");
        
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count=rs.getString(1);  }
     rs.close();
      smt.close();
      con.close();   } catch(Exception e){ e.printStackTrace(); }
      
       int n3=Integer.parseInt(count);
       String taskdata112[][]=new String[n3+1][55];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from servicerequest where useradminid=? and asignedto=? and  approvalstatus=? ");
            smt.setString(1,usercid_adminid);
        smt.setString(2,usercid_id);
    smt.setString(3,"Pending");
         
        ResultSet rs=smt.executeQuery();
     i=1;
        while(rs.next())
        { 
           for( j=1;j<=32;j++)
          {
            taskdata112[i][j]=rs.getString(j); 
           
          }
           ++i;  
        }
    rs.close();
      smt.close();
      con.close();    } catch(Exception e){
                     String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n dashboard.jsp-----\n"
     + "LINE=328\n select * from servicerequest where useradminid=? "+usercid_adminid+" and asignedto="+requestcid+"   ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      }
        int m=0;
      %>
	
  <!-- ./row -->
  <% if(n3>0) { %>
        <div class="row">
	 <div class="col-xs-12">
      

          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Pending Service Request Approval</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="table-responsive">
              <table id="example13" class="table table-bordered table-striped">
                <thead>
                <tr>
                   <th>SR ID  </th>
                  <th>Subject</th>
                  <th>Status</th>
                  <th>  Due Date</th>
                  <th> Priority</th>
                     <th> Approval</th>
                     <th> Assigned</th>
                 <th> Created</th>
                </tr>
                </thead>
                <tbody>
                <%   m=0; for(m=n3;m>0;m--) {  %>
                  <tr>
                    <td><a href="servicerequestpending.jsp?tid=<%=taskdata112[m][1] %>"><% out.print("SR"+taskdata112[m][1]); %></a></td>
                    <td><% out.print(taskdata112[m][4]); %></td>
                    <td><% if(taskdata112[m][7].equals("Open")) {   %>
                           <span class="label label-danger"><% out.print(taskdata112[m][7]); %></span>
                        <% } %>
                        <% if(taskdata112[m][7].equals("In Process")) {   %>
                           <span class="label label-warning"><% out.print(taskdata112[m][7]); %></span>
                        <% } %>
                        <% if(taskdata112[m][7].equals("Complete")) {   %>
                           <span class="label label-success"><% out.print(taskdata112[m][7]); %></span>
                        <% } %>
                        <% if(taskdata112[m][7].equals("Cancelled")) {   %>
                           <span class="label label-default"><% out.print(taskdata112[m][7]); %></span>
                        <% } %>
                        <% if(taskdata112[m][7].equals("Rejected")) {   %>
                           <span class="label label-default"><% out.print(taskdata112[m][7]); %></span>
                        <% } %>
                         <% if(taskdata112[m][7].equals("Follow Up")) {   %>
                           <span class="label label-info"><% out.print(taskdata112[m][7]); %></span>
                        <% } %>
                     </td>
                   <td><% out.print((taskdata112[m][5]).substring(0,10));  %></td>
                   <td> <% if(taskdata112[m][6].equals("Very High")) {   %>
                           <span class="label label-danger"><% out.print(taskdata112[m][6]); %></span>
                        <% } %>
                        <% if(taskdata112[m][6].equals("Normal")) {   %>
                           <span class="label label-info"><% out.print(taskdata112[m][6]); %></span>
                        <% } %>
                         <% if(taskdata112[m][6].equals("High")) {   %>
                           <span class="label label-warning"><% out.print(taskdata112[m][6]); %></span>
                        <% } %>
                        <% if(taskdata112[m][6].equals("Critical Situation")) {   %>
                           <span class="label label-danger"><% out.print(taskdata112[m][6]); %></span>
                        <% } %>
                        <% if(taskdata112[m][6].equals("Midium")) {   %>
                           <span class="label label-default"><% out.print(taskdata112[m][6]); %></span>
                        <% } %>
                        <% if(taskdata112[m][6].equals("Low")) {   %>
                           <span class="label label-default"><% out.print(taskdata112[m][6]); %></span>
                        <% } %>  
                   </td>
                   <td> <span class="label label-warning"><% out.print("Pending"); %></span></td>
                 <td><%=Db.getEmployeeName(taskdata112[m][8]) %></td>
                   <td><%=Db.getEmployeeName(taskdata112[m][10]) %></td>
                  </tr>
         
                  <% } %>
                 
               
                </tbody>
               
              </table>
                  </div>
            </div>
            <!-- /.box-body -->
           
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
</div> <!--/.row  -->
<%  } %>
     <% 
  java.util.Date date123=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date123.getTime());
      String curday11=sqlDate.toString(); 
            String dbdate=null;
            i=0;j=0;int CH=0;
           String count1;  count1="1";
          String duedate=curday11+" 23:59:59";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from task where useradminid=? AND   duedate=? and (status=? or status=? or status=?) ");
        smt.setString(1,usercid_adminid);
        smt.setString(2,duedate);
         smt.setString(3,"Open");
        smt.setString(4,"Follow Up");
        smt.setString(5,"In Process");
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count1=rs.getString(1);  }
       rs.close();
      smt.close();
      con.close(); } catch(Exception e){
                   String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n dashboard.jsp-----\n"
     + "LINE=441\n select count(*) from task where  where useradminid="+usercid_adminid+" and duedate='"+duedate+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
      
      }
      
       int n1=Integer.parseInt(count1);
       String taskdata156[][]=new String[n1+1][55];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from task where useradminid=? AND   duedate=? and (status=? or status=? or status=?) ");
        smt.setString(1,usercid_adminid);
        smt.setString(2,duedate);
         smt.setString(3,"Open");
        smt.setString(4,"Follow Up");
        smt.setString(5,"In Process");
        ResultSet rs=smt.executeQuery();
     i=1;
        while(rs.next())
        {  
               CH++;
           for( j=1;j<=13;j++)
          {
            taskdata156[i][j]=rs.getString(j); 
           
          } 
           ++i;  
        }
    rs.close();
      smt.close();
      con.close();    } catch(Exception e){ 
                   String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n dashboard.jsp-----\n"
     + "LINE=469 \n select * from task where useradminid="+usercid_adminid+" and duedate='"+duedate+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
      }
        
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from servicerequest where useradminid=? AND   duedate=? and (status=? or status=? or status=?) ");
        smt.setString(1,usercid_adminid);
        smt.setString(2,duedate);
         smt.setString(3,"Open");
        smt.setString(4,"Follow Up");
        smt.setString(5,"In Process");
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count1=rs.getString(1);  }
       rs.close();
      smt.close();
      con.close(); } catch(Exception e){
                   String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n dashboard.jsp-----\n"
     + "LINE=441\n select count(*) from task where  where useradminid="+usercid_adminid+" and duedate='"+duedate+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
      
      }
      
       int n122=Integer.parseInt(count1);
       String taskdata157[][]=new String[n122+1][55];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from servicerequest where useradminid=? AND   duedate=? and (status=? or status=? or status=?) ");
        smt.setString(1,usercid_adminid);
        smt.setString(2,duedate);
         smt.setString(3,"Open");
        smt.setString(4,"Follow Up");
        smt.setString(5,"In Process");
        ResultSet rs=smt.executeQuery();
     i=1;
        while(rs.next())
        {  
               CH++;
           for( j=1;j<=13;j++)
          {
            taskdata157[i][j]=rs.getString(j); 
           
          } 
           ++i;  
        }
    rs.close();
      smt.close();
      con.close();    } catch(Exception e){ 
                   String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n dashboard.jsp-----\n"
     + "LINE=469 \n select * from task where useradminid="+usercid_adminid+" and duedate='"+duedate+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
      }        
                  %>
<div class="row">
            <div class="col-md-12">
               <!-- TABLE: LATEST ORDERS -->
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Today's Due Date
             
             </h3>

            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <table id="example4" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th> ID  </th>
                  <th>Subject</th>
                  <th>Status</th>
                  <th>  Due Date</th>
                  <th> Priority</th>
                    <th> Assigned</th>
                 <th> Created</th>
                  </tr>
                  </thead>
                  <tbody>
                            <%   m=0; for(m=n122;m>0;m--) {  %>
                  <tr>
                    <td><a href="servicerequestedit.jsp?2a2e2a746964=<%=Nd.Encrypt(taskdata157[m][1]) %>"><% out.print("SR"+taskdata157[m][1]); %></a></td>
                    <td><% out.print(taskdata157[m][4]); %></td>
                    <td><% if(taskdata157[m][7].equals("Open")) {   %>
                           <span class="label label-danger"><% out.print(taskdata157[m][7]); %></span>
                        <% } %>
                        <% if(taskdata157[m][7].equals("In Process")) {   %>
                           <span class="label label-warning"><% out.print(taskdata157[m][7]); %></span>
                        <% } %>
                        <% if(taskdata157[m][7].equals("Complete")) {   %>
                           <span class="label label-success"><% out.print(taskdata157[m][7]); %></span>
                        <% } %>
                        <% if(taskdata157[m][7].equals("Cancelled")) {   %>
                           <span class="label label-default"><% out.print(taskdata157[m][7]); %></span>
                        <% } %>
                        <% if(taskdata157[m][7].equals("Rejected")) {   %>
                           <span class="label label-default"><% out.print(taskdata157[m][7]); %></span>
                        <% } %>
                         <% if(taskdata157[m][7].equals("Follow Up")) {   %>
                           <span class="label label-info"><% out.print(taskdata157[m][7]); %></span>
                        <% } %>
                     </td>
                   <td><% out.print((taskdata157[m][5]).substring(0,10));  %></td>
                   <td> <% if(taskdata157[m][6].equals("Very High")) {   %>
                           <span class="label label-danger"><% out.print(taskdata157[m][6]); %></span>
                        <% } %>
                        <% if(taskdata157[m][6].equals("Normal")) {   %>
                           <span class="label label-info"><% out.print(taskdata157[m][6]); %></span>
                        <% } %>
                         <% if(taskdata157[m][6].equals("High")) {   %>
                           <span class="label label-warning"><% out.print(taskdata157[m][6]); %></span>
                        <% } %>
                        <% if(taskdata157[m][6].equals("Critical Situation")) {   %>
                           <span class="label label-danger"><% out.print(taskdata157[m][6]); %></span>
                        <% } %>
                        <% if(taskdata157[m][6].equals("Midium")) {   %>
                           <span class="label label-default"><% out.print(taskdata157[m][6]); %></span>
                        <% } %>
                        <% if(taskdata157[m][6].equals("Low")) {   %>
                           <span class="label label-default"><% out.print(taskdata157[m][6]); %></span>
                        <% } %>  
                   </td>
                     <td><%=Db.getEmployeeName(taskdata157[m][8]) %></td>
                   <td><%=Db.getEmployeeName(taskdata157[m][10]) %></td>
                  </tr>
         
                  <% } %>
                      
                      
                <%   m=0; for(m=n1;m>0;m--) {  %>
                  <tr>
                      <td><a href="taskedit.jsp?2a2e2a746964=<%=Nd.Encrypt(taskdata156[m][1]) %>"><% out.print("TSK"+taskdata156[m][1]); %></a></td>
                    <td><% out.print(taskdata156[m][4]); %></td>
                    <td><% if(taskdata156[m][7].equals("Open")) {   %>
                           <span class="label label-danger"><% out.print(taskdata156[m][7]); %></span>
                        <% } %>
                        <% if(taskdata156[m][7].equals("In Process")) {   %>
                           <span class="label label-warning"><% out.print(taskdata156[m][7]); %></span>
                        <% } %>
                        <% if(taskdata156[m][7].equals("Complete")) {   %>
                           <span class="label label-success"><% out.print(taskdata156[m][7]); %></span>
                        <% } %>
                        <% if(taskdata156[m][7].equals("Cancelled")) {   %>
                           <span class="label label-default"><% out.print(taskdata156[m][7]); %></span>
                        <% } %>
                        <% if(taskdata156[m][7].equals("Rejected")) {   %>
                           <span class="label label-default"><% out.print(taskdata156[m][7]); %></span>
                        <% } %>
                         <% if(taskdata156[m][7].equals("Follow Up")) {   %>
                           <span class="label label-info"><% out.print(taskdata156[m][7]); %></span>
                        <% } %>
                     </td>
                   <td><% out.print((taskdata156[m][5]).substring(0,10));  %></td>
                   <td> <% if(taskdata156[m][6].equals("Very High")) {   %>
                           <span class="label label-danger"><% out.print(taskdata156[m][6]); %></span>
                        <% } %>
                        <% if(taskdata156[m][6].equals("Normal")) {   %>
                           <span class="label label-info"><% out.print(taskdata156[m][6]); %></span>
                        <% } %>
                         <% if(taskdata156[m][6].equals("High")) {   %>
                           <span class="label label-warning"><% out.print(taskdata156[m][6]); %></span>
                        <% } %>
                        <% if(taskdata156[m][6].equals("Critical Situation")) {   %>
                           <span class="label label-danger"><% out.print(taskdata156[m][6]); %></span>
                        <% } %>
                        <% if(taskdata156[m][6].equals("Midium")) {   %>
                           <span class="label label-default"><% out.print(taskdata156[m][6]); %></span>
                        <% } %>
                        <% if(taskdata156[m][6].equals("Low")) {   %>
                           <span class="label label-default"><% out.print(taskdata156[m][6]); %></span>
                        <% } %>  
                   </td>
                    <td><%=Db.getEmployeeName(taskdata156[m][13]) %></td>
                  
                   <td><%=Db.getEmployeeName(taskdata156[m][10]) %></td>
                  </tr>
         
                  <% } %>
                 
               
                </tbody>
                </table>
              </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
           
            <!-- /.box-footer -->
          </div>
          <!-- /.box --> 
                  </div>
                <!-- /.col -->
              
              </div>
              <!-- /.row -->
        <%
            i=1;j=0;
            count="NULL";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from task where assign=? and useradminid=? and (status=? or status=? or status=?)");
        smt.setString(1,usercid_id);
        smt.setString(2,usercid_adminid);
        smt.setString(3,"Open");
        smt.setString(4,"Follow Up");
        smt.setString(5,"In Process");
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count=rs.getString(1);  }
     rs.close();
      smt.close();
      con.close();   } catch(Exception e){ 
                    String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n dashboard.jsp-----\n"
     + "LINE=597 \n count(*) from task where assign=? and useradminid=? "+usercid_adminid+"   ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
     
      }
      
       int n=Integer.parseInt(count);
       String taskdata11[][]=new String[n+1][55];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from task where assign=? and useradminid=?  and (status=? or status=? or status=?) ");
        smt.setString(1,usercid_id);
        smt.setString(2,usercid_adminid);
         smt.setString(3,"Open");
        smt.setString(4,"Follow Up");
        smt.setString(5,"In Process");
        ResultSet rs=smt.executeQuery();
     i=1;
        while(rs.next())
        { 
           for( j=1;j<=32;j++)
          {
            taskdata11[i][j]=rs.getString(j); 
           
          }
           ++i;  
        }
    rs.close();
      smt.close();
      con.close();    } catch(Exception e){ 
                    String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n dashboard.jsp-----\n"
     + "LINE=627  \n * from task where assign=? and useradminid=? "+usercid_adminid+"   ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
     
      
      }
      %>
	
  <!-- ./row -->	
        <div class="row" id="opentask">
	 <div class="col-xs-12">
      

          <div class="box box-danger">
            <div class="box-header">
              <h3 class="box-title">Task Assigned to Me</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                 <div class="table-responsive">
              <table id="example3" class="table table-bordered table-striped">
                <thead>
                <tr>
                   <th>Task ID  </th>
                  <th>Subject</th>
                  <th>Status</th>
                  <th>  Due Date</th>
                  <th> Priority</th>
                    <th> Assigned</th>
                 <th> Owner</th>
                </tr>
                </thead>
                <tbody>
                <%   m=0; for(m=n;m>0;m--) {  %>
                  <tr>
                      <td><a href="taskedit.jsp?2a2e2a746964=<%=Nd.Encrypt(taskdata11[m][1]) %>"><% out.print("TSK"+taskdata11[m][1]); %></a></td>
                    <td><% out.print(taskdata11[m][4]); %></td>
                    <td><% if(taskdata11[m][7].equals("Open")) {   %>
                           <span class="label label-danger"><% out.print(taskdata11[m][7]); %></span>
                        <% } %>
                        <% if(taskdata11[m][7].equals("In Process")) {   %>
                           <span class="label label-warning"><% out.print(taskdata11[m][7]); %></span>
                        <% } %>
                        <% if(taskdata11[m][7].equals("Complete")) {   %>
                           <span class="label label-success"><% out.print(taskdata11[m][7]); %></span>
                        <% } %>
                        <% if(taskdata11[m][7].equals("Cancelled")) {   %>
                           <span class="label label-default"><% out.print(taskdata11[m][7]); %></span>
                        <% } %>
                        <% if(taskdata11[m][7].equals("Rejected")) {   %>
                           <span class="label label-default"><% out.print(taskdata11[m][7]); %></span>
                        <% } %>
                         <% if(taskdata11[m][7].equals("Follow Up")) {   %>
                           <span class="label label-info"><% out.print(taskdata11[m][7]); %></span>
                        <% } %>
                     </td>
                   <td><% out.print((taskdata11[m][5]).substring(0,10));  %></td>
                   <td> <% if(taskdata11[m][6].equals("Very High")) {   %>
                           <span class="label label-danger"><% out.print(taskdata11[m][6]); %></span>
                        <% } %>
                        <% if(taskdata11[m][6].equals("Normal")) {   %>
                           <span class="label label-info"><% out.print(taskdata11[m][6]); %></span>
                        <% } %>
                         <% if(taskdata11[m][6].equals("High")) {   %>
                           <span class="label label-warning"><% out.print(taskdata11[m][6]); %></span>
                        <% } %>
                        <% if(taskdata11[m][6].equals("Critical Situation")) {   %>
                           <span class="label label-danger"><% out.print(taskdata11[m][6]); %></span>
                        <% } %>
                        <% if(taskdata11[m][6].equals("Midium")) {   %>
                           <span class="label label-default"><% out.print(taskdata11[m][6]); %></span>
                        <% } %>
                        <% if(taskdata11[m][6].equals("Low")) {   %>
                           <span class="label label-default"><% out.print(taskdata11[m][6]); %></span>
                        <% } %>  
                   </td>
                   <td><%=Db.getEmployeeName(taskdata11[m][13]) %></td>
                   <td><%=Db.getEmployeeName(taskdata11[m][10]) %></td>
                  </tr>
         
                  <% } %>
                 
               
                </tbody>
               
              </table>
                 </div>
            </div>
            <!-- /.box-body -->
           
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
	

</div> <!--/.row  -->
        
        
      
	<%
            i=1;j=0;
            count="NULL";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from servicerequest   where useradminid=? and asignedto=? and (status=? or status=? or status=?)");
          smt.setString(1,usercid_adminid);
        smt.setString(2,requestcid);
        smt.setString(3,"Open");
        smt.setString(4,"Follow Up");
        smt.setString(5,"In Process");
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count=rs.getString(1);  }
    rs.close();
      smt.close();
      con.close();    } catch(Exception e){ 
                       String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n dashboard.jsp-----\n"
     + "LINE=740  \n * from task where assign=? and useradminid=? "+usercid_adminid+"   ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
     
      
      }
      
        n=Integer.parseInt(count);
       String taskdata[][]=new String[n+1][55];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from servicerequest   where useradminid=? and asignedto=? and (status=? or status=? or status=?)");
         smt.setString(1,usercid_adminid);
        smt.setString(2,requestcid);
        smt.setString(3,"Open");
        smt.setString(4,"Follow Up");
        smt.setString(5,"In Process");
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
      con.close();     } catch(Exception e){ 
      
                       String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n dashboard.jsp-----\n"
     + "LINE=772  \n * from task where assign=? and useradminid=? "+usercid_adminid+"   ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
     
      
      }
      %>
	
  <!-- ./row -->	
        <div class="row" id="openSR">
	 <div class="col-xs-12">
      

          <div class="box box-warning">
            <div class="box-header">
              <h3 class="box-title">SR  Assigned to Me</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                 <div class="table-responsive">
              <table id="example2" class="table table-bordered table-striped">
                <thead>
                <tr>
                   <th>SR ID  </th>
                  <th>Subject</th>
                  <th>Status</th>
                  <th>  Due Date</th>
                  <th> Priority</th>
                     <th> Approval</th>
                     <th> Assigned</th>
                 <th> Created</th>
                </tr>
                </thead>
                <tbody>
                <%   m=0; for(m=n;m>0;m--) {  %>
                  <tr>
                    <td><a href="servicerequestedit.jsp?2a2e2a746964=<%=Nd.Encrypt(taskdata[m][1]) %>"><% out.print("SR"+taskdata[m][1]); %></a></td>
                    <td><% out.print(taskdata[m][4]); %></td>
                    <td><% if(taskdata[m][7].equals("Open")) {   %>
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
                   <td>   <span class="label label-<%=Poul.statusSRApprovalColor(taskdata[m][17]) %>"><% out.print(taskdata[m][17]); %></span>
                     </td>
                 <td><%=Db.getEmployeeName(taskdata[m][8]) %></td>
                   <td><%=Db.getEmployeeName(taskdata[m][10]) %></td>
                  </tr>
                  <% } %>
                 
               
                </tbody>
               
              </table>
                 </div>
            </div>
            <!-- /.box-body -->
           
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
           
            count1="NULL";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from interactionrecord where useradminid=? and usercid=?  and (status=? or status=? or status=?)");
        smt.setString(1,usercid_adminid);
        smt.setString(2,requestcid);
        smt.setString(3,"Open");
        smt.setString(4,"Follow Up");
        smt.setString(5,"In Process");
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count1=rs.getString(1);  }
      rs.close();
      smt.close();
      con.close();  } catch(Exception e){ 
                       String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n dashboard.jsp-----\n"
     + "LINE=902  \n * from task where assign=? and useradminid=? "+usercid_adminid+"   ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
     
      
      }
      
        n1=Integer.parseInt(count1);
String taskdata1[][]=new String[n1+1][55];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from interactionrecord where useradminid=? and usercid=?  and (status=? or status=? or status=?)");
        smt.setString(1,usercid_adminid);
        smt.setString(2,requestcid);
        smt.setString(3,"Open");
        smt.setString(4,"Follow Up");
        smt.setString(5,"In Process");
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
      con.close();  } catch(Exception e){ 
                       String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n dashboard.jsp-----\n"
     + "LINE=933  \n * from task where assign=? and useradminid=? "+usercid_adminid+"   ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
     
      
      }
      %>
  
	 <div class="row">
        <div class="col-xs-12">
      

          <div class="box box-primary">
            <div class="box-header">
              <h3 class="box-title">Interaction Record </h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                 <div class="table-responsive">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                   <th>Date and Time  </th>
                  <th>Product</th>
                  <th>Direction</th>
                  <th>  Status</th>
                  <th> Priority</th>
                   <th> Created</th>
                </tr>
                </thead>
                <tbody>
                <% int m1=0; for(m1=n1;m1>0;m1--) {  %>
                  <tr>
                      <td><a  href="iredit.jsp?tid=<%=taskdata1[m1][1] %>&cid=<%=taskdata1[m1][13] %>&type=lead"><% out.print(taskdata1[m1][2]); %></a></td>
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
                     <td><%=Db.getEmployeeName(taskdata1[m1][12])   %></td>
                 
                  </tr>
         
                  <% } %>
                 
               
                </tbody>
               
              </table>
                 </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

	
      
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <jsp:include page="dist/include/footer.jsp" />  

<% Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Leaving dashboard.jsp----------Main Dashboard---");
     %>
  
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
    $('#example2').DataTable()
    $('#example3').DataTable()
     $('#example13').DataTable()
    $('#example4').DataTable()
    
  })
</script>
      <script>
         function showNotification()  
{         //  if((<%=myOpenTask%>>0)||(<%=Integer.parseInt(openSR)%>>0)){       
  //  document.getElementById("alert-message-warning").innerHTML = "Please close all the Open,Follow Up and In Process Status";
    // $('#show-warning').modal('show')
 //}
}   </script>
</body>
</html>
