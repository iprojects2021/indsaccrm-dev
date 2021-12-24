<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.io.File"%>
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
  <title>Task | INDSAC CRM</title>
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

%>
    
<%   String warningmsg="",successmsg="";
          String al1[]=new String[35];
          String msgurl=request.getParameter("msg");
          if("upload".equals(msgurl)){successmsg="File uploaded Successfully";}
       String pagetype=request.getParameter("pagetype");
            String type=request.getParameter("type");
          String tid=request.getParameter("2a2e2a746964");
          if(tid!=null){tid=Nd.Decrypt(tid);}
      String cid=Poul.escapeHtml(request.getParameter("cid"));
       
    Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+",tid="+tid+",cid="+cid+" --Entering taskedit.jsp----------Task Edit---");
    
          try{
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from task where id=? ");
        smt.setString(1,tid);
        
        ResultSet rs=smt.executeQuery();
        while(rs.next()){
            for(int i=1;i<34;i++){
               al1[i]=rs.getString(i); 
            }
        }
        
    rs.close();
      smt.close();
      con.close();    }
        catch(Exception e){
      String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n taskedit.jsp-----\n"
     + "LINE=92\nselect * from task where id="+tid+"  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
     
                }
       //System.out.println(al.size());
       
     
     
      %>
    
    <%  String msg=null;
          
          String message="";
       if("taskedit".equals(pagetype)){
         
     
        String subject=Poul.escapeHtml(request.getParameter("subject"));
        String datepicker=Poul.escapeHtml(request.getParameter("datepicker"));
        String importance=Poul.escapeHtml(request.getParameter("importance"));
        String status=Poul.escapeHtml(request.getParameter("status"));
        String assigned=Poul.escapeHtml(request.getParameter("assigned"));
        String account=Poul.escapeHtml(request.getParameter("account"));
        String contact=Poul.escapeHtml(request.getParameter("contact"));
        String lead=Poul.escapeHtml(request.getParameter("lead"));
        String notes=Poul.escapeHtml(request.getParameter("notes"));
        String    previousnotes=Poul.escapeHtml(request.getParameter("previousnotes"));
   
    if(notes.length()>0){notes="**"+Db.getEmployeeName(usercid_id)+"*****"+java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"******\n"+notes+"\n\n"+previousnotes+"\n";}
    else{notes=previousnotes;}
        String own=Poul.escapeHtml(request.getParameter("own"));
         String assignedto=Poul.escapeHtml(request.getParameter("assignedto"));
        
        datepicker=datepicker.substring(0,10);
       datepicker=Character.toString(datepicker.charAt(6))+Character.toString(datepicker.charAt(7))+Character.toString(datepicker.charAt(8))+Character.toString(datepicker.charAt(9))+"-"+Character.toString(datepicker.charAt(0))+Character.toString(datepicker.charAt(1))+"-"+Character.toString(datepicker.charAt(3))+Character.toString(datepicker.charAt(4))+" "+"23:59:59";
     try{
     Connection c=Poul.getConnectionCRM();

Statement st=c.createStatement();
           ResultSet rs3;
               rs3 = st.executeQuery("select  *  FROM task where id='"+tid+"'  ");
    ResultSetMetaData rsmd=rs3.getMetaData();
     String aa="null",ab="null",ac="null",ad="null",ae="null",af="null",ag="null",ah="null",ai="null",aj="null",ak="null",al="null",am="null",an="null",ap="";
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
                     al=rsmd.getColumnName(12);
                      am=rsmd.getColumnName(13);
                       an=rsmd.getColumnName(14);
                        ap=rsmd.getColumnName(15);
                      
         
         
  st.addBatch("update task set   "+ad+"='"+subject+"',"+ae+"='"+datepicker+"',"+af+"='"+importance+"',"+ag+"='"+status+"',"+al+"='"+notes+"',"+am+"='"+assignedto+"'  where id='"+tid+"'");
   String logstatus="Task Update";
      rs3 = st.executeQuery("select  id  FROM tasklog  ");
  String SR="0";
      while(rs3.next())
        
          {SR=rs3.getString(1);
          
          }
          int  i = Integer.parseInt( SR ); 
           ++i;  
           java.util.Date date=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());
       
             st.addBatch("insert into tasklog values('"+i+"','"+sqlTime+"','"+tid+"','"+subject+"','"+datepicker+"','"+importance+"','"+status+"','','"+usercid_adminid+"','"+usercid_id+"','"+cid+"','"+notes+"','"+assignedto+"','"+logstatus+"','','','','','','','','','','','','','','','','','','','')");
       
            
       st.executeBatch(); 
        String requestcid=cid;
        session.setAttribute("requestcid",cid);
             msg="success";    
       
     rs3.close();
      st.close();
      c.close();    }
        catch(Exception e)
        {
      String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n taskedit.jsp-----\n"
     + "LINE=183\nupdate task where useradminid="+usercid_adminid+" AND usercid=?"+usercid_id+"  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
     
        }
        finally{
        
           // session.setAttribute("submitmsg",msg);
           // response.sendRedirect("newleads.jsp");
            if("success".equals(msg)){
        successmsg="Task Edited Successfully";
            }else{
               response.sendRedirect("error.jsp");
            }
        }
        
       }
        %>
   
<%
          String al[]=new String[35];
        try{
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from task where id=? ");
        smt.setString(1,tid);
        
        ResultSet rs=smt.executeQuery();
        while(rs.next()){
            for(int i=1;i<34;i++){
               al[i]=rs.getString(i); 
            }
        }
        
    rs.close();
      smt.close();
      con.close();    }
        catch(Exception e){
      String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n taskedit.jsp-----\n"
     + "LINE=230\nselect * from task where id="+tid+"  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
     
                }
       //System.out.println(al.size());
       
      
     
      %>
<div class="wrapper">

  <jsp:include page="dist/include/leftmenu.jsp" />  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
  <section class="content">
  	
 <div class="row invoice">
        <div class="col-xs-12">
		 <!-- Default box -->
      <div class="box box-warning box-socid">
        <div class="box-header with-border">
            <h3 class="box-title"> Task id:TSK<%=al[1]  %></h3>
            <h6 class="pull-right"><%="Created By:"+Db.getEmployeeName(al[10])+" ,"+al[2] %></h6><br>
           
<!-- form start -->
            <form class="form-horizontal" action="" method="post">
       </div>   
         <div class="col-md-6">
		 <div class="box ">
             <div class="box-body">
                  <%   if(!"null".equals(al[11])){ %>
                     <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">  Name</label>
      <div class="col-sm-10">
                      <%   String data[]=new String [5];
                      data=Db.getCustomerName(al[11], al[9]); if(("customer").equals(data[4])){data[4]="contact";}
                      %>
                      <a href="<%=data[4] %>details.jsp?esfhrttrfhardersg=<%=Nd.Encrypt(al[11]) %>&2a2e2a74797065=<%=Nd.Encrypt(data[4]) %>"><button type="button" class="col-sm-10 btn btn-warning pull-left"> <% if("".equals(data[2])||"null".equals(data[2])){ out.print(data[3]);} else {out.print(data[2]);} %> </button></a>
          
          
          
                  </div>
                   </div> <br><br> <% }    %>
         
			    <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label"> Subject</label>

                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="subject"  name="subject" placeholder="<%=al[4] %>" value="<%=al[4] %>">
                  </div>
                </div>
                  <br><br><% 
                String check=(al[5]).substring(0,10);
                  check=Character.toString(check.charAt(5))+Character.toString(check.charAt(6))+"/"+Character.toString(check.charAt(8))+Character.toString(check.charAt(9))+"/"+Character.toString(check.charAt(0))+Character.toString(check.charAt(1))+Character.toString(check.charAt(2))+Character.toString(check.charAt(3));
        %>
				<div class="form-group">
                <label class="col-sm-2 control-label">Due Date</label>

                <div class="input-group date" class="col-sm-10 ">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div> 
                  <input type="text" class="form-control pull-right" name="datepicker" id="datepicker1" placeholder="<%=check %>" value="<%=check %>" required="">
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->
           
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
                                 </div>   <br><br><br>
                                 
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
                  <label for="inputPassword3" class="col-sm-2 control-label">Assigned To</label>
 <% int count=Db.getAllEmployeeCount(usercid_adminid) ;

                            String data[][]=new String [count][5] ;  
                             data=Db.getAllEmployeeName(usercid_adminid, count);
                          %> 
                  <div class="col-sm-10">
                 <select id="status" name="assignedto" class="form-control">
                     <option value="<%=al[13] %>"> <%=Db.getEmployeeName(al[13]) %></option>
                     
                     <%  for(int i=1;i<=count;i++) { %>
                          <option value="<%=data[i][1]  %>"> <%=data[i][2]  %></option>
                           
                           <%  } %>
                          
                     </select>
                  </div>
                  </div>
                 <br><br>
					 
			  <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label"> Add Notes</label>

                  <div class="col-sm-10">
                 <textarea class="form-control" rows="2" id="notes" name="notes"  ></textarea>
                 </div>
                </div>
				
		  <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label"> Previous Notes</label>

                  <div class="col-sm-10">
                      <textarea class="form-control" rows="5" id="previousnotes" name="previousnotes" readonly placeholder="<%=al[12] %>" ><%=al[12] %></textarea>
                 <input type="hidden" name="pagetype" value="taskedit">
                 <input type="hidden" name="2a2e2a746964" value="<%=Nd.Encrypt(tid) %>">
                  </div>
                </div>		
              
              </div>
              <!-- /.box-body -->
		    <div class="box-footer clearfix no-border">
		 <% if(("Complete").equals(al[7])||("Rejected").equals(al[7])||("Cancelled").equals(al[7])) { %> 
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
        <!--/.col (right) -->
 </div>
      <!-- /.box -->
</div>
		</div>
                  <!-- /.row -->
		  <div class="row">
        <!-- left column -->
        <div class="col-md-6">
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Upload File</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form action="Fileupload"  method="post"  enctype="multipart/form-data">
              <div class="box-body">
            
                <div class="form-group">
                  <label for="exampleInputFile">File input</label>
                  <input type="file" name="taskfile" id="exampleInputFile" required="">
            </div>
               <input type="hidden" class="form-control"  name="general"  value="<%=Nd.Encrypt(al[1])  %>" >
                 <input type="hidden" class="form-control"  name="type"  value="taskfile" >
                     
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" onclick="return processing()" class="btn btn-primary">Submit</button>
              </div>
            </form>
          </div>
          <!-- /.box -->
	 </div>
        <!--/.col (right) -->
          <% String attachfilename="";long fileSize=0;
          if(al[8].length()>3){
       attachfilename=al[8].substring(0, al[8].length()-1);
      String path = Poul.getDirPath()+File.separator+"files"+File.separator+attachfilename;

        Path filePath = Paths.get(path);
         fileSize = Files.size(filePath);
          }  %>
        	 <div class="col-xs-6">
       <div class="box">
            <div class="box-header">
              <h3 class="box-title">Attachment </h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example4" class="table table-bordered table-striped">
                <thead>
                <tr>
                   <th>File  </th>
                  <th>Attachment</th>
                  <th>  </th>
               </tr>
                </thead>
                <tbody>
                 <tr>
                     <td><%=attachfilename %></td>
                    <td>  <%=menu.File.getCorrectFileSize(fileSize) %>
                          </td>
                  <td>  <script> var x021="<%=attachfilename %>";
                        document.write('<a onclick="downloadFile1(x021)" download   class="btn btn-info btn-xs pull-right"><i class="fa fa-cloud-download"></i>Download</a>');
                        </script></td>
               </tr>
          </tbody>
               
              </table>
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
        int    i=1,j=0,n=0;
         String   count1="NULL";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from tasklog where tid=?");
        smt.setString(1,tid);
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count1=rs.getString(1);  }
    rs.close();
      smt.close();
      con.close();    } catch(Exception e){
          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n taskedit.jsp-----\n"
     + "LINE=456\nselect count(*) from tasklog where tid="+tid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg); 
     
      }
      
        n=Integer.parseInt(count1);
        String requestdata[][]=new String[n+1][55];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from tasklog where tid=?");
        smt.setString(1,tid);
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
     String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n taskedit.jsp-----\n"
     + "LINE=482\nselect * from tasklog where tid="+tid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg); 
     
      }
      %>
	
	<div class="row">
	 <div class="col-xs-12">
      

          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Task History </h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example5" class="table table-bordered table-striped">
                <thead>
                <tr>
                   <th>Date & Time  </th>
                  <th>Description</th>
                    <th> Subject</th>
                  <th>Status</th>
                  <th>  Due Date</th>
                  <th> Priority</th>
                
                  <th>Assign</th>
                  <th>Createdby</th>
                </tr>
                </thead>
                <tbody>
                <% int  m=1; for(m=1;m<=n;m++) {  %>
                  <tr>
                    <td><% out.print(requestdata[m][2]); %></td>
                    <td><% out.print(requestdata[m][14]); %></td>
                     <td><% out.print(requestdata[m][4]); %></td>
                     
                    <td>
                        <span class="label label-<%=Poul.statusSRColor(requestdata[m][7]) %>"><% out.print(requestdata[m][7]); %></span>
                  </td>
                   <td><% out.print((requestdata[m][5]).substring(0,10));  %></td>
                      <td>
                        <span class="label label-<%=Poul.statusSRPriorityColor(requestdata[m][6]) %>"><% out.print(requestdata[m][6]); %></span>
                  </td>
                  
                   <td><%=Db.getEmployeeName(requestdata[m][13])  %></td>
                 
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
	   <div class="modal fade" id="confirmdownload1">
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
	 <div class="overlay"   >
             
            </div>
		
		
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <jsp:include page="dist/include/footer.jsp" />  
  <%    Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+",tid="+tid+",cid="+cid+" --Leaving taskedit.jsp----------Task Edit---");
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
    $('#example4').DataTable()
    $('#example5').DataTable({
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
    <script>  
var request2;  //$("#waitingdisplay").hide();
function downloadFile1(f)  
{ 
var v="files"; 

  document.getElementById("filename123").innerHTML = f;
document.getElementById("viewfile").innerHTML = '<a href="download/'+f+'" download class="btn btn-primary"><i class="fa fa-cloud-download"></i>Download</a>';
//$("#waitingdisplay").show();
$('#waitingdisplay').modal('show')
var url="DownloadFile?type="+v+"&filename="+f;  
  
if(window.XMLHttpRequest){  
request2=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request2=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request2.onreadystatechange=getInfo;  
request2.open("post",url,true);  
request2.send();  
}catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo(){  
if(request2.readyState===4){  
 //$("#waitingdisplay").hide();
  $('#waitingdisplay').modal('hide')
    $('#confirmdownload1').modal('show')
}  
}  
  
</script>
</body>
</html>
