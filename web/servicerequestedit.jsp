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
  <title>Service Request | INDSAC CRM</title>
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
       Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Entering servicerequestedit.jsp----------Service Request details---");
    	
	
if (session != null) {
			if (session1.getAttribute("usercid_id") == null) {
				response.sendRedirect("signout.jsp");
			} 
		}
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Entering servicerequestedit.jsp----------Service Request ---");
%>


    <%
          String al1[]=new String[35];
          String cid=request.getParameter("2a2e2a636964");
           if(cid!=null){cid=Nd.Decrypt(cid);}
          String tid=request.getParameter("2a2e2a746964");
          if(tid!=null){tid=Nd.Decrypt(tid);}
          String cnt=request.getParameter("cnt");
       
       if(!"null".equals(cid)){
          try{
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from servicerequest where id=? and useradminid=? ");
        smt.setString(1,tid);
         smt.setString(2,usercid_adminid);
        ResultSet rs=smt.executeQuery();
        while(rs.next()){
            for(int i=1;i<34;i++){
               al1[i]=rs.getString(i); 
            }
        }
        
   rs.close();
      smt.close();
      con.close();     }
        catch(Exception e){
      String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n servicerequestedit.jsp-----\n"
     + "LINE=94 \n select * from servicerequest where useradminid="+usercid_adminid+" AND id=?"+tid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
                }
      
       
       }
     
      %>
  
      
    <%  String msg=null;
           String pagetype=request.getParameter("pagetype");
            String type=request.getParameter("type");
          String message="";
       if("taskedit".equals(pagetype)){
            tid=Poul.escapeHtml(request.getParameter("2a2e2a746964"));
            if(tid!=null){tid=Nd.Decrypt(tid);}
       cid=Poul.escapeHtml(request.getParameter("cid"));
        String subject=Poul.escapeHtml(request.getParameter("subject"));
     
        String datepicker=Poul.escapeHtml(request.getParameter("datepicker"));
        String importance=Poul.escapeHtml(request.getParameter("importance"));
        String status=Poul.escapeHtml(request.getParameter("status"));
        String assigned=Poul.escapeHtml(request.getParameter("assignedto"));
        String account=Poul.escapeHtml(request.getParameter("account"));
        String contact=Poul.escapeHtml(request.getParameter("contact"));
        String lead=Poul.escapeHtml(request.getParameter("lead"));
        String notes=Poul.escapeHtml(request.getParameter("notes"));
    String    previousnotes=Poul.escapeHtml(request.getParameter("previousnotes"));
   
    if(notes.length()>0){notes="**"+Db.getEmployeeName(usercid_id)+"******"+java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"*******\n"+notes+"\n\n"+previousnotes;}
    else{notes=previousnotes;}
    String own=Poul.escapeHtml(request.getParameter("own"));
         String resoution=Poul.escapeHtml(request.getParameter("resolution"));
          String servicerequesttype=Poul.escapeHtml(request.getParameter("servicerequesttype"));
          String remark=Poul.escapeHtml(request.getParameter("remark"));
         String assignedto=Poul.escapeHtml(request.getParameter("assignedto"));
          String approvalstatus=Poul.escapeHtml(request.getParameter("approvalstatus"));
       if(al1[8].equals(assignedto)){approvalstatus=approvalstatus;}else{
           approvalstatus="Pending";
           al1[17]=approvalstatus;
       }
          
        datepicker=datepicker.substring(0,10);
       datepicker=Character.toString(datepicker.charAt(6))+Character.toString(datepicker.charAt(7))+Character.toString(datepicker.charAt(8))+Character.toString(datepicker.charAt(9))+"-"+Character.toString(datepicker.charAt(0))+Character.toString(datepicker.charAt(1))+"-"+Character.toString(datepicker.charAt(3))+Character.toString(datepicker.charAt(4))+" "+"23:59:59";
     try{
   Connection c=Poul.getConnectionCRM();

Statement st=c.createStatement();
           ResultSet rs3;
               rs3 = st.executeQuery("select  *  FROM servicerequest where id='"+tid+"'  ");
    ResultSetMetaData rsmd=rs3.getMetaData();
     String aa="null",ab="null",ac="null",ad="null",ae="null",af="null",ag="null",ah="null",ai="null",aj="null",ak="null",all="null",am="null",an="null",ao="",ap="",aq="";
          aa=rsmd.getColumnName(1);
           ab=rsmd.getColumnName(2);
            ac=rsmd.getColumnName(3);
             ad=rsmd.getColumnName(4);
              ae=rsmd.getColumnName(5);
               af=rsmd.getColumnName(6);
                ag=rsmd.getColumnName(7);
                 ah=rsmd.getColumnName(8);
                  ai=rsmd.getColumnName(9);
                   aj=rsmd.getColumnName(10);
                    ak=rsmd.getColumnName(11);
                     all=rsmd.getColumnName(12);
                      am=rsmd.getColumnName(13);
                       an=rsmd.getColumnName(14);
                        ao=rsmd.getColumnName(15);
                        ap=rsmd.getColumnName(16);
                        
         
                       
         
         
  st.addBatch("update servicerequest set   "+ad+"='"+subject+"',"+ae+"='"+datepicker+"',"+af+"='"+importance+"',"+ag+"='"+status+"',"+ah+"='"+assigned+"',"+all+"='"+notes+"',"+am+"='"+servicerequesttype+"',"+an+"='"+resoution+"',"+ao+"='"+remark+"',"+ap+"='"+assignedto+"',approvalstatus='"+approvalstatus+"'  where id='"+tid+"'");
   String logstatus="SR Update";
      rs3 = st.executeQuery("select  id  FROM servicerequestlog  ");
  String SR="0";
      while(rs3.next())
        
          {SR=rs3.getString(1);
          
          }
          int  i = Integer.parseInt( SR ); 
           ++i;  
           java.util.Date date=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());
       
             st.addBatch("insert into servicerequestlog values('"+i+"','"+sqlTime+"','"+tid+"','"+subject+"','"+datepicker+"','"+importance+"','"+status+"','"+assigned+"','"+usercid_adminid+"','"+usercid_id+"','"+cid+"','"+notes+"','"+servicerequesttype+"','"+resoution+"','"+remark+"','','"+approvalstatus+"','"+logstatus+"','','','','','','','','','','','','','','','')");
      
                   
       st.executeBatch(); 
        String requestcid=cid;
        session.setAttribute("requestcid",cid);
             msg="success";    
        rs3.close();
      st.close();
      c.close();
        }
        catch(Exception e)
        {
               String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n servicerequestedit.jsp-----\n"
     + "LINE=198 \n select  *  FROM servicerequest where id='"+tid+"' ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      
        }
        finally{
        
           // session.setAttribute("submitmsg",msg);
           // response.sendRedirect("newleads.jsp");
            if("success".equals(msg)){
        message="Service Request Edited Successfully";
                 if("Pending".equals(al1[17])){    message="Approval  Request Sent  Successfully";}
        
        
            }else{
                Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Entering servicerequestedit.jsp---------Redirecting To------------error.jsp--------------Service Request ---");
               response.sendRedirect("error.jsp");
            }
        }
        
       }
        %>
    
    
       <%
          String al[]=new String[35];
          
       
       if(!"null".equals(cid)){
          try{
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from servicerequest where id=? and useradminid=? ");
        smt.setString(1,tid);
         smt.setString(2,usercid_adminid);
        ResultSet rs=smt.executeQuery();
        while(rs.next()){
            for(int i=1;i<34;i++){
               al[i]=rs.getString(i); 
            }
        }
        
   rs.close();
      smt.close();
      con.close();     }
        catch(Exception e){
      String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n servicerequestedit.jsp-----\n"
     + "LINE=245 \n select * from servicerequest where useradminid="+usercid_adminid+" AND usercid=?"+usercid_id+" ";
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
 
	
	 <section class="content">
    


	
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
            <h3 class="box-title"> Service Request - <%="SR"+al[1] %></h3>
               <h6 class="pull-right"><%="Created By:"+Db.getEmployeeName(al[10])+" ,"+al[2] %></h6><br>
         
<!-- form start -->
            <form class="form-horizontal" action="" method="post">
         
        </div>   <input type="hidden" class="form-control"  name="own"  value="<%=al[13] %>">
                 
       
	    <div class="col-md-6">
		
		 <div class="box ">
            
           
            
              <div class="box-body">
                   <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label"> Contact Name</label>

                  <div class="col-sm-10">
                      <%  if(!"null".equals(al[11])){ String data[]=new String [5];
                      data=Db.getCustomerName(al[11], al[9]); if(("customer").equals(data[4])){data[4]="contact";}
                      %>
                      <a href="<%=data[4] %>details.jsp?esfhrttrfhardersg=<%=Nd.Encrypt(al[11]) %>&2a2e2a74797065=<%=Nd.Encrypt(data[4]) %>"><button type="button" class="col-sm-10 btn btn-warning pull-left"> <% if("".equals(data[2])||"null".equals(data[2])){ out.print(data[3]);} else {out.print(data[2]);} %> </button></a>
           <% } else { 
           %>
           
           <a href="details.jsp"><button type="button" class="col-sm-10 btn btn-warning pull-left"><% out.print(Db.getEmployeeName(al[10], al[9])); %> </button></a>
          
           <% } %>
                  </div>
                   </div> <br><br>
			    <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label"> Subject</label>

                  <div class="col-sm-10">
                      <input type="text" class="form-control" id="subject"  name="subject" placeholder="<%=al[4] %>" value="<%=al[4] %>" >
                  </div>
                </div>
                  <br><br>
				<div class="form-group">
                <label class="col-sm-2 control-label">Due Date</label>

                <div class="input-group date" class="col-sm-10 ">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div> <% 
                String check=(al[5]).substring(0,10);
                  check=Character.toString(check.charAt(5))+Character.toString(check.charAt(6))+"/"+Character.toString(check.charAt(8))+Character.toString(check.charAt(9))+"/"+Character.toString(check.charAt(0))+Character.toString(check.charAt(1))+Character.toString(check.charAt(2))+Character.toString(check.charAt(3));
       
                  
                  %>
                  <input type="text" class="form-control pull-right" name="datepicker" id="datepicker1" placeholder="<%=check %>" value="<%=check %>" required="">
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group --><br>
           
				 <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Priority</label>

                  <div class="col-sm-10">
                 <select id="importance" name="importance" class="form-control"  value="<%=al[6] %>">
                     <option value="<%=al[6] %>"> <%=al[6] %></option>
                          <option value="Normal"> Normal</option>
                          <option value="Very High">Very High</option>
                          <option value="High">High</option>
                          <option value="Critical Situation"> Critical Situation</option>
                          <option value="Normal">Normal</option>
                          <option value="Midium">Midium</option>
                          <option value="Low">Low</option>
                          
                     </select>
                  </div>
                                 </div>   <br><br>
                               
				     <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Status</label>

                  <div class="col-sm-10">
                 <select id="status" name="status" class="form-control" value="<%=al[7] %>">
                     <option value="<%=al[7] %>"> <%=al[7] %></option>
                          <option value="Open"> Open</option>
                           <option value="Follow Up">Follow Up</option>
                          <option value="In Process">In Process</option>
                          <option value="Complete">Complete</option>
                          <option value="Cancelled"> Cancelled</option>
                          <option value="Rejected">Rejected</option>
                          
                          
                     </select>
                  </div>
                </div>
          
		
              
              </div>
              <!-- /.box-body -->
              
             
           
              
              
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
			   <div class="form-group">
                  <label for="inputEmail3" class="col-sm-4 control-label">Approval Status</label>

                  <div class="col-sm-8">
                      <span class="label label-<%=Poul.statusSRApprovalColor(al[17]) %>"><% out.print(al[17]); %></span>
                      <input type="hidden"  name="approvalstatus" value="<%=al[17] %>">
                  </div>
                            </div>  <br>
			    <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Assigned To</label>
 <% int count=Db.getAllEmployeeCount(usercid_adminid) ;

                            String data[][]=new String [count][5] ;  
                             data=Db.getAllEmployeeName(usercid_adminid, count);
                          %> 
                  <div class="col-sm-10">
                 <select id="status" name="assignedto" class="form-control">
                     <option value="<%=al[8] %>"> <%=Db.getEmployeeName(al[8]) %></option>
                     
                     <%  for(int i=1;i<=count;i++) { %>
                          <option value="<%=data[i][1]  %>"> <%=data[i][2]  %></option>
                           
                           <%  } %>
                          
                     </select>
                  </div>
                  </div>
                 <br><br>
                  <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Type</label>

                  <div class="col-sm-10">
                 <select id="status" name="servicerequesttype" class="form-control">
                     <option value="<%=al[13] %>"> <%=al[13] %></option>
                          <option value="Customer Call"> Customer Call</option>
                           <option value="Request for Information">Request for Information</option>
                          <option value="Customer Complaint">Customer Complaint</option>
                          <option value="Defective Product">Defective Product</option>
                          <option value="Installation Request"> Installation Request</option>
                          <option value="Maintenance Visit">Maintenance Visit</option>
                           <option value="Field Service"> Field Service</option>
                           
                          
                     </select>
                  </div>
                  </div><br><br>
					 
			  <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Add Notes</label>

                  <div class="col-sm-10">
                 <textarea class="form-control" rows="6" id="notes" name="notes"  ></textarea>
                 <input type="hidden" name="pagetype" value="taskedit">
                 
                 <input type="hidden" name="2a2e2a746964" value="<%=Nd.Encrypt(tid) %>">
                  </div>
                </div>
				
				
              
              </div>
              <!-- /.box-body -->
		
           
            
          </div>
          <!-- /.box -->
  </div>
        <!--/.col (right) -->
 </div>
      <!-- /.box -->
</div>
		</div>
		
	
	
	 <div class="row invoice">
        <div class="col-xs-12">
		 <!-- Default box -->
      <div >
       
          <h3 class="box-title">Resolution</h3>

         
     
       
	    <div class="col-md-6">
		
		 <div class="box ">
            
           
            <!-- form start -->
         
              <div class="box-body">
			    <div class="form-group">
                  <label for="inputEmail3" class="col-sm-3 control-label"> Remark </label>

                  <div class="col-sm-9">
                      <input type="text" class="form-control" id="remark"  name="remark" placeholder="Remark" value="<%=al[15] %>" autocomplete="off">
                  </div>
                </div>
                  <br><br>
                  	<div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label" >Resolution</label>

                  <div class="col-sm-9" >
                 <textarea class="form-control" rows="5" id="resolution" name="resolution" placeholder="<%=al[14] %>"  autocomplete="off"><%=al[14] %></textarea>
                  </div>
                </div>
              </div>
              <!-- /.box-body -->
             
          </div>
          <!-- /.box -->
        

        </div>
        <!--/.col (left) -->
       <div class="col-md-6">
		
		 <div class="box ">
             <div class="box-body">
                   <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Previous Notes</label>

                  <div class="col-sm-10">
                 <textarea class="form-control" rows="6" id="previousnotes" name="previousnotes" readonly  placeholder="<%=al[12] %>" ><%=al[12] %></textarea>
                 <input type="hidden" name="pagetype" value="taskedit">
                 
                  <input type="hidden" name="tid" value="<%=tid %>">
                  </div>
                </div>
			 <br><br>
                            
                         <br><br>
			
			
          
		
              
              </div>
              <!-- /.box-body -->
                 <div class="box-footer clearfix no-border">
		 <% if(("Pending").equals(al[17])||("Complete").equals(al[7])||("Rejected").equals(al[7])||("Cancelled").equals(al[7])) { %> 
                    <button type="button" class="btn btn-default pull-right" onclick="goBack()"> Cancel</button>
               
                     <% }else{ %>
               <button type="button" class="btn btn-default pull-left" onclick="goBack()"> Cancel</button>
                 
                 <button type="submit" class="btn btn-info pull-right" onClick="return validateForm()" type="submit"> Save</button>
          <%  } %>
                 </div>
           
            </form>
             
           
              
              
          </div>
          <!-- /.box -->
        

        </div>
        <!--/.col (left) -->
    
 </div>
      <!-- /.box -->
</div>
		</div>
		
	
	 <%
        int    i=1,j=0,n=0;
         String   count1="NULL";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from servicerequestlog where srid=? and useradminid=?  ");
        smt.setString(1,tid);
        smt.setString(2,usercid_adminid);
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count1=rs.getString(1);  }
    rs.close();
      smt.close();
      con.close();    } catch(Exception e){
          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n servicerequestedit.jsp-----\n"
     + "LINE=589 \n select count(*) from servicerequestlog where srid="+tid+" and useradminid="+usercid_adminid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg); 
     
      }
      
        n=Integer.parseInt(count1);
        String requestdata[][]=new String[n+1][55];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from servicerequestlog where srid=? and useradminid=?");
        smt.setString(1,tid);
         smt.setString(2,usercid_adminid);
        ResultSet rs=smt.executeQuery();
     i=1;
        while(rs.next())
        { 
           for( j=1;j<=32;j++)
          {
            requestdata[i][j]=rs.getString(j); 
           
          }
           ++i;  
        }
     rs.close();
      smt.close();
      con.close();   } catch(Exception e){
     String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n servicerequestedit.jsp-----\n"
     + "LINE=616 \n select * from servicerequestlog where srid="+tid+" and useradminid="+usercid_adminid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg); 
     
      }
      %>
	
	<div class="row">
	 <div class="col-xs-12">
      

          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Service Request History </h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example5" class="table table-bordered table-striped">
                <thead>
                <tr>
                   <th>Date & Time  </th>
                  <th>Description</th>
                  <th>Status</th>
                  <th>  Due Date</th>
                  <th> Priority</th>
                  <th> Approval</th>
                  <th>Assign</th>
                  <th>Createdby</th>
                </tr>
                </thead>
                <tbody>
                <% int  m=1; for(m=1;m<=n;m++) {  %>
                  <tr>
                      <td><a href="servicerequesthistory.jsp?2a2e2a746964=<%=Nd.Encrypt(requestdata[m][1]) %>"><% out.print(requestdata[m][2]); %></a></td>
                    <td><% out.print(requestdata[m][18]); %></td>
                     <td>
                        <span class="label label-<%=Poul.statusSRColor(requestdata[m][7]) %>"><% out.print(requestdata[m][7]); %></span>
                  </td>
                   <td><% out.print((requestdata[m][5]).substring(0,10));  %></td>
                      <td>
                        <span class="label label-<%=Poul.statusSRPriorityColor(requestdata[m][6]) %>"><% out.print(requestdata[m][6]); %></span>
                  </td>
                    <td>
                        <span class="label label-<%=Poul.statusSRApprovalColor(requestdata[m][17]) %>"><% out.print(requestdata[m][17]); %></span>
                  </td>
                   <td><%=Db.getEmployeeName(requestdata[m][8])  %></td>
                 
                    <td><%=Db.getEmployeeName(requestdata[m][10])  %></td>
                 </tr>
         
                  <% } %>
                 
               
                </tbody>
               
              </table>
            </div>
            <!-- /.box-body -->
         
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
	

</div> <!--/.row  -->		

	
		
		
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <jsp:include page="dist/include/footer.jsp" />  
  <% Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Leaving servicerequestedit.jsp----------Service Request details---");
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
    $('#example5').DataTable()
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
