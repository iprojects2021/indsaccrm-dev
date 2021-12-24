<%@page import="java.nio.file.Files"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.io.File"%>
<%@page import="blezz.Nd"%>
<%@page import="menu.Expense"%>
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
  <title>Expense Edit | INDSAC CRM</title>
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
         String currency=(String)session1.getAttribute("usercid_currency"); 
      	
	
if (session != null) {
			if (session1.getAttribute("usercid_id") == null) {
				response.sendRedirect("signout.jsp");
			} 
		}

%>
    
<%
          String al1[]=new String[35];
       String pagetype=request.getParameter("pagetype");
            String type=request.getParameter("type");
          String tid=request.getParameter("2a2e2a746964");
          if(tid!=null){tid=Nd.Decrypt(tid);}
      String cid=Poul.escapeHtml(request.getParameter("cid"));
       
    Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+",tid="+tid+" --Entering expenseedit.jsp----------Expense Edit---");
    
       
     
     
      %>
    
    <%  String msg=null;
          
          String message="";
       if("taskedit".equals(pagetype)){
       String datepicker=Poul.escapeHtml(request.getParameter("expensedate"));
        String category=Poul.escapeHtml(request.getParameter("category"));
        String expenseamount=Poul.escapeHtml(request.getParameter("expenseamount"));
        String status=Poul.escapeHtml(request.getParameter("status"));
        String reportto=Poul.escapeHtml(request.getParameter("reportto"));
        String previousnotes=Poul.escapeHtml(request.getParameter("previousnotes"));
     String   approvalstatus=Poul.escapeHtml(request.getParameter("approvalstatus"));
    String notes=Poul.escapeHtml(request.getParameter("notes"));
    if(notes.length()>0){notes="**"+Db.getEmployeeName(usercid_id)+"*****"+java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"******\n"+notes+"\n\n"+previousnotes+"\n";}
    else{notes=previousnotes;}
       datepicker=datepicker.substring(0,10);
       datepicker=Character.toString(datepicker.charAt(6))+Character.toString(datepicker.charAt(7))+Character.toString(datepicker.charAt(8))+Character.toString(datepicker.charAt(9))+"-"+Character.toString(datepicker.charAt(0))+Character.toString(datepicker.charAt(1))+"-"+Character.toString(datepicker.charAt(3))+Character.toString(datepicker.charAt(4))+" "+"23:59:59";
     try{
     Connection c=Poul.getConnectionCRM();

Statement st=c.createStatement();
           ResultSet rs3;
               rs3 = st.executeQuery("select  *  FROM expense where id='"+tid+"'  ");
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
                      
         
         
  st.addBatch("update expense set   "+ae+"='"+datepicker+"',"+af+"='"+category+"',"+ag+"='"+status+"',"+ah+"='"+expenseamount+"',"+al+"='"+notes+"',"+am+"='"+reportto+"'  where id='"+tid+"'");
   String logstatus="Expense Update";
      rs3 = st.executeQuery("select  max(id)  FROM expenselog  ");
  String SR="0";
      while(rs3.next())
        
          {SR=rs3.getString(1);
          
          }
          int  i = Integer.parseInt( SR ); 
           ++i;  
           java.util.Date date=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());
       
             st.addBatch("insert into expenselog values('"+i+"','"+sqlTime+"','"+tid+"','','"+datepicker+"','"+category+"','"+status+"','"+expenseamount+"','"+usercid_adminid+"','"+usercid_id+"','"+tid+"','"+notes+"','"+reportto+"','"+logstatus+"','','','','','','','','','','','','','','','','','','','')");
       
            
       st.executeBatch(); 
        String requestcid=cid;
        session.setAttribute("requestcid",cid);
             msg="success";    
       
     rs3.close();
      st.close();
      c.close();    }
        catch(Exception e)
        {
      String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n expenseedit.jsp-----\n"
     + "LINE=183\n update expenselog where useradminid="+usercid_adminid+" AND usercid=?"+usercid_id+"  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
     
        }
        finally{
        
           // session.setAttribute("submitmsg",msg);
           // response.sendRedirect("newleads.jsp");
            if("success".equals(msg)){
        message="Expense Edited Successfully";
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
        PreparedStatement smt=con.prepareStatement("select * from expense where id=? ");
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
      String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n expenseedit.jsp-----\n"
     + "LINE=228\n select * from expense where id="+tid+"  ";
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
      <div class="box box-warning ">
        <div class="box-header with-border">
            <h3 class="box-title"> Expense id: Ex<%=al[1]  %><a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Settled status cannot be edited "><i class="fa  fa-info-circle"></i></a></h3>
            <h6 class="pull-right"><%="Created By:"+Db.getEmployeeName(al[10])+" ,"+al[2] %></h6><br>
<!-- form start -->
            <form class="form-horizontal" action="" name="expense" method="post">
       </div>   
       <div class="col-md-6">
		 <div class="box ">
             <div class="box-body">
                 
                         <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">Bill Number</label>
   <div class="col-sm-10">
       <input type="text" class="form-control" id="billnumber" name="billnumber" value="<%=al[3] %>" autocomplete="off" disabled="">
                  </div>
                         </div><br><br>
                   <div class="form-group" >
                  <label for="inputEmail3" class="col-sm-2 control-label">Subject</label>
   <div class="col-sm-10" >
                    <input type="text" class="form-control" id="subject" name="subject"  value="<%=al[4] %>" autocomplete="off" disabled="">
                </div>
                </div><br><br>
                   <% 
                String check=(al[5]).substring(0,10);
                  check=Character.toString(check.charAt(5))+Character.toString(check.charAt(6))+"/"+Character.toString(check.charAt(8))+Character.toString(check.charAt(9))+"/"+Character.toString(check.charAt(0))+Character.toString(check.charAt(1))+Character.toString(check.charAt(2))+Character.toString(check.charAt(3));
          %>
			<div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label"> Date:<span style="color:red">*</span></label>
         <div class="col-sm-10">
                <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                    <input type="text" class="form-control pull-right" name="expensedate" id="datepicker1" required=""  placeholder="<%=check %>" value="<%=check %>" autocomplete="off">
                </div>
</div>
                <!-- /.input group -->
              </div>	<br><br>
             <div class="form-group" id="shownewcategoryInput1">
                  <label for="inputPassword3" class="col-sm-2 control-label"> Category<span style="color:red">*</span></label>

                  <div class="col-sm-10">
                      <select id="product" name="category" class="form-control" required>
                         <option value="<%=al[6]  %>"> <%=al[6]  %></option>
                         <option value="Automobile Expense">Automobile Expense</option>
                          <option value="Office Supplies">Office Supplies</option>
                          <option value="Telephone Expense"> Telephone Expense</option>
                           <option value="Employee Expense"> Employee Expense</option>
                        <% 

                             ArrayList<String> categ=new ArrayList<String>();  
                             categ=Expense.getAllDistinctCategory(usercid_adminid);
                          %> 
                                  
                      <%   for(String list:categ) { %>
                          <option value="<%=list  %>"> <%=list  %></option>
                           
                           <%  } %>
                     </select>
                  </div>
             </div><br><br>
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

                  <div class="col-sm-8" >
                      <div id="approve">
                      <span class="label label-<%=Poul.statusSRApprovalColor(al[15]) %>"><% out.print(al[15]); %></span>
                     
                     
                      <% 
                      if((al[13].equals(usercid_id)) && ("Pending".equals(al[15]))) {  %>
                      <a  class="btn btn-success pull-right" onClick="sendInfo()" > Approve</a>
           <% } %> </div>
                  </div>
                            </div>  
       
           <br> <input type="hidden"  name="approvalstatus" value="<%=al[15] %>">
                      
		           	  <div class="form-group">
                                      
                  <label for="inputPassword3" class="col-sm-3 control-label">Amount<span style="color:red">*</span></label>

                  <div class="col-sm-9">
                       <div class="input-group date">
                        <div class="input-group-addon">
                    <i class="fa fa-<%=currency%>"></i>
                  </div>
                    <input type="text" class="form-control" id="expenseamount" name="expenseamount" placeholder="<%=al[8] %>" value="<%=al[8] %>" autocomplete="off" required="" >
                  </div>
                  </div>
                </div><br><br>
                        <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label"> Status<span style="color:red">*</span></label>
  <div class="col-sm-9">
                      <select id="status" name="status" class="form-control">
                          <option value="<%=al[7] %>"> <%=al[7] %></option>
                          <option value="Settled"> Settled</option>
                          <option value="Unsettled">Unsettled</option>
                    </select>
                  </div>
                </div><br><br>
                       <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Report To</label>
 <% int count=Db.getAllEmployeeCount(usercid_adminid) ;

                            String data[][]=new String [count][5] ;  
                             data=Db.getAllEmployeeName(usercid_adminid, count);
                          %> 
                  <div class="col-sm-9">
                 <select id="reportto" name="reportto" class="form-control">
                      <option value="<%=al[13] %>"> <%=Db.getEmployeeName(al[13]) %></option>
                        
                     <%  for(int i=1;i<=count;i++) { %>
                          <option value="<%=data[i][1]  %>"> <%=data[i][2]  %></option>
                           
                           <%  } %>
                    </select>
                  </div>
                  </div>		
              
              </div>
              <!-- /.box-body -->
		    <div class="box-footer clearfix no-border">
		 <% if(("Settled").equals(al[7])) { %> 
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
                 <div class="col-md-6">
                  <form action="Fileupload" method="post"  enctype="multipart/form-data">
                   <div class="form-group">
                  <label for="inputPassword3" class="col-sm-4 control-label">Receipt <span style="color:red">*</span></label>

                  <div class="col-sm-4">
                      <input type="file"  id="expenseamount" name="receipt" required="" >
                  </div>
                        <input type="hidden"  name="expensedate"    value="<%=al[5] %>" >
              
                      <input type="hidden" class="form-control"  name="type"  value="expensereceipt" >
                      <input type="hidden" class="form-control"  name="general"  value="<%=Nd.Encrypt(al[1])  %>" >
                
                  <div class="col-sm-4">
                         <button type="submit" onclick="return processing()" class="btn btn-info pull-right"  > Upload</button>
          </div>
                      
                </div>
                 </form>
                 </div><br>
      <!-- /.box -->
      <%  if(al[16].length()>3){
      String attachfilename=al[16].substring(0, al[16].length()-1);
      String path = Poul.getDirPath()+File.separator+"files"+File.separator+attachfilename;

        Path filePath = Paths.get(path);
        long fileSize = Files.size(filePath);
      %>
    <div class="col-md-6">
      <div class="box-footer">
          <form name="download" >
              
             <ul class="mailbox-attachments clearfix">
                  <li>
                      <span class="mailbox-attachment-icon"><i class="fa fa-file<%=menu.File.getFileExtensionFA(attachfilename) %>"></i></span>
                      <input type="hidden" name="filename" value="<%=attachfilename %>">
                      <input type="hidden" name="type" value="files">
                  <div class="mailbox-attachment-info">
                    <a onclick="downloadFile()" download class="mailbox-attachment-name"><i class="fa fa-paperclip"></i><%=attachfilename %></a>
                        <span class="mailbox-attachment-size">
                            <%=menu.File.getCorrectFileSize(fileSize) %>
                          
                         <script> var x021="<%=attachfilename %>";
                        document.write('<a onclick="downloadFile1(x021)" download   class="btn btn-default btn-xs pull-right"><i class="fa fa-cloud-download"></i></a>');
                        </script>
                        </span>
                  </div>
                </li>
             </ul>
          </form>
                     
            </div>
    </div>
              <% } %>
                         </div>
        <!--/.col (right) -->
</div>
		</div>
		
	
		
	 <%
        int    i=1,j=0,n=0;
         String   count1="NULL";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from expenselog where eid=?");
        smt.setString(1,tid);
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count1=rs.getString(1);  }
    rs.close();
      smt.close();
      con.close();    } catch(Exception e){
          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n taskedit.jsp-----\n"
     + "LINE=396\nselect count(*) from expenselog where eid="+tid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg); 
     
      }
      
        n=Integer.parseInt(count1);
        String requestdata[][]=new String[n+1][55];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from expenselog where eid=?");
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
     String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n expenseedit.jsp-----\n"
     + "LINE=422\n select * from expenselog where eid="+tid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg); 
     
      }
      %>
	 
	<div class="row">
        
	 <div class="col-xs-12">
      <div class="box">
            <div class="box-header">
              <h3 class="box-title">Expense History </h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">   
              <table id="example5" class="table table-bordered table-striped">
                <thead>
                <tr>
                   <th>Date & Time  </th>
                  <th>Description</th>
                   <th>Status</th>
                  <th>  Expense Date</th>
                  <th> Category</th>
                <th>Amount</th>
                <th> Report To</th>
                  <th>Modified By</th>
                </tr>
                </thead>
                <tbody>
                <% int  m=1; for(m=1;m<=n;m++) {  %>
                  <tr>
                    <td><% out.print(requestdata[m][2]); %></td>
                    <td>
                        <% if(("Receipt Upload").equals(requestdata[m][14])){    %>
                      <a  ><%=requestdata[m][14] %></a> 
                      <script> var x<%=m %>="<%=requestdata[m][15].substring(0, requestdata[m][15].length()-1) %>";
                        document.write('<a onclick="downloadFile1(x<%=m %>)" download   class="btn btn-default btn-xs pull-right"><i class="fa fa-cloud-download"></i></a>');
                        </script>
              <% }else { out.print(requestdata[m][14]);} %>
                    </td>
                    <td>
                        <span class="label label-<%=Expense.statusExpenseColor(requestdata[m][7]) %>"><% out.print(requestdata[m][7]); %></span>
                  </td>
                   <td><% out.print((requestdata[m][6]));  %></td>
                      <td>
                 <% out.print(requestdata[m][14]); %> </td>
                  <td><% out.print(requestdata[m][8]); %></td>
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
		
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <jsp:include page="dist/include/footer.jsp" />  
  <%    Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+",tid="+tid+" --Leaving expenseedit.jsp----------Expense Edit---");
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
 function validateForm(){ var general=<%=usercid_id  %>;
      var  status=document.expense.status.value;  
       var  reportto=document.expense.reportto.value;  
        
      var  approvalstatus=document.expense.approvalstatus.value;  
          if(approvalstatus=="Pending"){
              if(reportto!=general){
           document.getElementById("alert-message").innerHTML = "Status Pending";
    $('#show-alert').modal('show')
      
         return false;
       }}
      return true;
    }
</script>
<script>
  $(function () {
    $('#example1').DataTable()
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
var request;  
function sendInfo()  
{  
  var  expensedate=document.expense.expensedate.value;  
var v=document.expense.tid.value;  
var url="ajxexpenseapproval.jsp?key=approval&val="+v+"&expensedate="+expensedate;  
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request.onreadystatechange=getInfo;  
request.open("post",url,true);  
request.send();  
}catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo(){  
if(request.readyState===4){  
var val=request.responseText;  
document.getElementById('approve').innerHTML=val;  
 document.getElementById("alert-message").innerHTML = "Approved Successfully";
    $('#show-alert').modal('show')
}  
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
