
<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
<%@page import="blezz.Db"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="blezz.Poul"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="blezz.Nd"%>
<!DOCTYPE html>
<html>
<head>     <link rel="shortcut icon" href="dist/img/u.png" type="image/x-icon" /> 
 
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Employee Details | INDSAC CRM</title>
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
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --------Entering employeedetails.jsp-------------");
%>

<%
          String a1[]=new String[50];
         
          String cid=request.getParameter("cid");
          Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" ,contact_id="+cid+"  --Entering contactdetails1.jsp ---");
    
          String esfhrttrfhardersg=request.getParameter("esfhrttrfhardersg");//value from taskedit.jsp for (assigned by)
         if(esfhrttrfhardersg!=null ){ cid=esfhrttrfhardersg;}
         
          
          String type=request.getParameter("type");
      
        String requestcid=null;
        String[] names =new String[4] ;
        requestcid=(String)session.getAttribute("requestcid");
       
        if("null"!=cid && "employee".equals(type)||cid!=null&& "employee".equals(type)){requestcid=cid;
        
        }
       
        
       try{
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from employee where id=?");
        smt.setString(1,requestcid);
        ResultSet rs=smt.executeQuery();
        while(rs.next()){
            for(int i=1;i<49;i++){
               a1[i]=(rs.getString(i)); 
              
            }
        }
         names[0]=a1[23];
     
       
        rs.close();
      smt.close();
       
         con.close();
        
        
        
        
       }
        catch(Exception e)
        {
           String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n employeedetails.jsp-----\n"
     + "LINE=114 + \n select * from employee where id="+requestcid+"  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
        
        }
        List list = Arrays.asList(names);//method for converting  the names array into list
			session.setAttribute("emails", list);
       //System.out.println(al.size());
      %>
    <div class="wrapper">
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
                <h3>Employee Details </h3>
        
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
              <%if(a1[10]!=null&&!a1[10].equals("")&&!a1[10].equals("null")){%> <h5 align="left"> DOB&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp; <% out.print(a1[10]); %>  </h5><%}%>
             <%if(a1[13]!=null&&!a1[13].equals("")&&!a1[13].equals("null")){ %><h5 align="left">Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp;<span class="label label-success"><% out.print(a1[13]);%></span></h5> <% } %>
		
              
              <%if(a1[14]!=null&&!a1[14].equals("")&&!a1[14].equals("null")){%>  <h5 align="left">Report To&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp;<% out.print(a1[14]); %>  </h5><%}%>
               <%if(a1[15]!=null&&!a1[15].equals("")&&!a1[15].equals("null")){%>  <h5 align="left">Source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>:</strong>&nbsp;&nbsp;<% out.print(a1[15]); %>  </h5><%}%>
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
	
	
                        
                        
        <br>    
                        
	<div class="row"><div class="col-sm-3">
            <form action="invoice.jsp?type=new&contact=<%=requestcid%>" method="post">   <button type="submit" class="btn btn-block btn-default" ><i class="fa fa-fw fa-upload"></i>Create Invoice</button>
                <% session.setAttribute("sessioncontact",requestcid); %>
                <% session.setAttribute("sessiontype","contact"); %>
                <input type="hidden" name="newname" value="<%=a1[5] %>">
                <input type="hidden" name="newaddress1" value="<%=a1[31] %>">
                <input type="hidden" name="newaddress2" value="<%=a1[32] %>">
                <input type="hidden" name="newaddress3" value="<%=a1[33] %>">
                <input type="hidden" name="newcontact1" value="<%=a1[20] %>">
                <input type="hidden" name="newcontact2" value="<%=a1[21] %>">
                <input type="hidden" name="newgstn" value="<%=a1[38] %>">
                <input type="hidden" name="newstate" value="<%=a1[35] %>">
            </form>
	</div>
	
	
         
	<div class="col-sm-3">
          <form action="purchaseorder.jsp?type=new&contact=<%=requestcid%>" method="post">   <button type="submit" class="btn btn-block btn-default" ><i class="fa fa-fw fa-upload"></i>Create Purchase Order</button>
                <% session.setAttribute("sessioncontact",requestcid); %>
                <% session.setAttribute("sessiontype","contact"); %>
                <input type="hidden" name="newname" value="<%=a1[5] %>">
                <input type="hidden" name="newaddress1" value="<%=a1[31] %>">
                <input type="hidden" name="newaddress2" value="<%=a1[32] %>">
                <input type="hidden" name="newaddress3" value="<%=a1[33] %>">
                <input type="hidden" name="newcontact1" value="<%=a1[20] %>">
                <input type="hidden" name="newcontact2" value="<%=a1[21] %>">
                <input type="hidden" name="newgstn" value="<%=a1[38] %>">
                <input type="hidden" name="newstate" value="<%=a1[35] %>">
                <input type="hidden" name="newpopo" value="newpopo">
            </form></div>
                <div class="col-sm-3">
          <form action="proforma.jsp?type=new&contact=<%=requestcid%>" method="post">   <button type="submit" class="btn btn-block btn-default" ><i class="fa fa-fw fa-upload"></i>Create Proforma Invoice</button>
                <% session.setAttribute("sessioncontact",requestcid); %>
                <% session.setAttribute("sessiontype","contact"); %>
                <input type="hidden" name="newname" value="<%=a1[5] %>">
                <input type="hidden" name="newaddress1" value="<%=a1[31] %>">
                <input type="hidden" name="newaddress2" value="<%=a1[32] %>">
                <input type="hidden" name="newaddress3" value="<%=a1[33] %>">
                <input type="hidden" name="newcontact1" value="<%=a1[20] %>">
                <input type="hidden" name="newcontact2" value="<%=a1[21] %>">
                <input type="hidden" name="newgstn" value="<%=a1[38] %>">
                <input type="hidden" name="newstate" value="<%=a1[35] %>">
                <input type="hidden" name="newpopo" value="newpopo">
            </form></div>
                       <div class="col-sm-3">
          <form action="quotation.jsp?type=new&contact=<%=requestcid%>" method="post">   <button type="submit" class="btn btn-block btn-default" ><i class="fa fa-fw fa-upload"></i>Create Quotation</button>
                <% session.setAttribute("sessioncontact",requestcid); %>
                <% session.setAttribute("sessiontype","contact"); %>
                <input type="hidden" name="newname" value="<%=a1[5] %>">
                <input type="hidden" name="newaddress1" value="<%=a1[31] %>">
                <input type="hidden" name="newaddress2" value="<%=a1[32] %>">
                <input type="hidden" name="newaddress3" value="<%=a1[33] %>">
                <input type="hidden" name="newcontact1" value="<%=a1[20] %>">
                <input type="hidden" name="newcontact2" value="<%=a1[21] %>">
                <input type="hidden" name="newgstn" value="<%=a1[38] %>">
                <input type="hidden" name="newstate" value="<%=a1[35] %>">
                <input type="hidden" name="newpopo" value="newpopo">
            </form></div></div>
                <br><div class="row">
	<div class="col-sm-3">
        <a href="contactedit.jsp?cid=<%=requestcid %>">    <button type="button" class="btn btn-block btn-default"><i class="fa fa-fw fa-edit"></i>Edit Contact Details</button></a>
	</div>
        
        <div class="col-sm-3">
        <a href="task.jsp?cid=<%=requestcid %>&type=contact">    <button type="button" class="btn btn-block btn-default"><i class="fa fa-fw fa-edit"></i>Create Task</button></a>
	</div>
        <div class="col-sm-3">
            <a href="servicerequest.jsp?cid=<%=requestcid %>&type=contact" >   <button type="button" class="btn btn-block btn-default"><i class="fa fa-fw fa-edit"></i>Create Service Request</button></a>
	</div>
         <div class="col-sm-3">
            <a href="ComposeMail.jsp?cid=<%=requestcid %>&type=contact" >   <button type="button" class="btn btn-block btn-default"><i class="fa fa-fw fa-edit"></i>Send Mail</button></a>
	</div>
	</div>
       

     
	
    </section>

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
      con.close();
       } catch(Exception e)
       { 
             String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n employeedetails.jsp-----\n"
     + "LINE=302 + \n select count(*) from stock where useradminid="+usercid_adminid+"  ";
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
      con.close();  }
        catch(Exception e)
        {
            String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n employeedetails.jsp-----\n"
     + "LINE=331 + \n select * from stock where useradminid="+usercid_adminid+"  ";
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
                         
                          
                     </select>  </div>
				  </div>
			    <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Status</label>

                  <div class="col-sm-4">
                <select id="status" name="status1" class="form-control">
                          <option value="Close"> Close</option>
                          <option value="Open">Open</option>
                         
                         
                          
                     </select>  </div>
               
                  <label for="inputPassword3" class="col-sm-2 control-label">Priority</label>

                  <div class="col-sm-4">
                  <select id="priority" name="priority1" class="form-control">
                          <option value="Midium"> Midium</option>
                          <option value="High">High</option>
                          <option value="Low">Low</option>
                    
                     </select>  </div>
                </div>
                    <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Product</label>

                  <div class="col-sm-10">
                    <select id="productname" name="product" class="form-control"  >
                             
                       <% for(i=1;i<=n2;++i){  %>
                         <option value="<%=taskdata2[i][2]  %>"><% out.println(taskdata2[i][2]);  %></option>
                        
                         <% }  %>
                          
                     </select>
                  </div>
				  </div>
				   <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Customer Enquiry</label>

                  <div class="col-sm-10">
                 <textarea class="form-control" id="eq" name="enquiry" rows="3" placeholder=" Enquiry"></textarea>
                      <input type="hidden" name="cid" value="<%=requestcid %>"> 
                   <input type="hidden" name="type" value="contact">
                  </div>
                
                
                                   </div>
			
              
              </div>
			
              <!-- /.box-body -->
              <div class="box-footer">
                
                <button type="submit" class="btn btn-info pull-right" onClick="return validateForm()">Submit</button>
              </div>
              <!-- /.box-footer -->
            </form>
          </div>
          <!-- /.box -->
        

        </div>
        <!--/.col (left) -->
		
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
             
			  <a href="contactedit.jsp?cid=<%=requestcid %>" class="btn btn-sm btn-info btn-flat pull-right"> Edit</a>
             
            </div>
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
        </div>
        <!-- ./col -->	
		

</div> <!--/.row  -->
	<%
            i=1; j=0;
           String count="NULL";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from task where customerid=?");
        smt.setString(1,requestcid);
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count=rs.getString(1);  }
      rs.close();
      smt.close();
      con.close();  } 
       catch(Exception e)
       {
         String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n employeedetails.jsp-----\n"
     + "LINE=469 + \n select count(*) from task where customerid="+requestcid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);  
       }
      
       int n=Integer.parseInt(count);
       String taskdata[][]=new String[n+1][55];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from task where customerid=?");
        smt.setString(1,requestcid);
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
      con.close();   } 
        catch(Exception e)
       {
           String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n employeedetails.jsp-----\n"
     + "LINE=496 + \n select * from task where customerid="+requestcid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg); 
            }
      %>
	
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
                   <th> Owner</th>
                </tr>
                </thead>
                <tbody>
                <%  int m=1; for(m=1;m<=n;m++) {  %>
                  <tr>
                    <td><a href="taskedit.jsp?cid=<%=taskdata[m][11] %>&tid=<%=taskdata[m][1] %>&type=contact"><% out.print("TSK"+taskdata[m][1]); %></a></td>
                    <td><% out.print(taskdata[m][4]); %></td>
                    <td><% if(taskdata[m][7].equals("Open")) {   %>
                           <span class="label label-danger"><% out.print(taskdata[m][7]); %></span>
                        <% } %>
                        <% if(taskdata[m][7].equals("In Process")) {   %>
                           <span class="label label-warning"><% out.print(taskdata[m][7]); %></span>
                        <% } %>
                        <% if(taskdata[m][7].equals("Follow Up")) {   %>
                           <span class="label label-info"><% out.print(taskdata[m][7]); %></span>
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
                         
                     </td>
                   <td><% out.print((taskdata[m][5]).substring(0,10));  %></td>
                   <td> <% if(taskdata[m][6].equals("Very High")) {   %>
                           <span class="label label-danger"><% out.print(taskdata[m][6]); %></span>
                        <% } %>
                        <% if(taskdata[m][6].equals("Critical Situation")) {   %>
                           <span class="label label-danger"><% out.print(taskdata[m][6]); %></span>
                        <% } %>
                        <% if(taskdata[m][6].equals("Normal")) {   %>
                           <span class="label label-info"><% out.print(taskdata[m][6]); %></span>
                        <% } %>
                         <% if(taskdata[m][6].equals("High")) {   %>
                           <span class="label label-warning"><% out.print(taskdata[m][6]); %></span>
                        <% } %>
                        
                        <% if(taskdata[m][6].equals("Midium")) {   %>
                           <span class="label label-default"><% out.print(taskdata[m][6]); %></span>
                        <% } %>
                        <% if(taskdata[m][6].equals("Low")) {   %>
                           <span class="label label-default"><% out.print(taskdata[m][6]); %></span>
                        <% } %>  
                   </td>
                   <td><%=Db.getEmployeeName(taskdata[m][13]) %></td>
                  </tr>
         
                  <% } %>
                 
               
                </tbody>
               
              </table>
            </div>
            <!-- /.box-body -->
             <div class="box-footer clearfix">
              <a href="task.jsp?cid=<%=requestcid %>&type=contact" class="btn btn-sm btn-info btn-flat pull-left">Create Task</a>
            </div>
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
	

</div> <!--/.row  -->


 


 
	   
	
<!-- row -->
<%
           
           String count1="NULL";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from interactionrecord where customerid=?");
        smt.setString(1,requestcid);
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count1=rs.getString(1);  }
   rs.close();
      smt.close();
      con.close();     } 
       catch(Exception e)
       { 
            String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n employeedetails.jsp-----\n"
     + "LINE=614 + \n select count(*) from interactionrecord where customerid="+ requestcid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg); 
          }
      
       int n1=Integer.parseInt(count1);
       String taskdata1[][]=new String[n1+1][55];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from interactionrecord where customerid=?");
        smt.setString(1,requestcid);
        ResultSet rs=smt.executeQuery();
      i=1; j=0; 
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
      con.close();   } 
        catch(Exception e)
      { 
          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n employeedetails.jsp-----\n"
     + "LINE=641 + \n select * from interactionrecord where customerid="+ requestcid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg); 
            }
      %>
      <div class="row">
        <div class="col-xs-12">
      

          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Interaction Record</h3>
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
                    <th> Owner</th>
                </tr>
                </thead>
                <tbody>
                <% int m1=0; for(m1=n1;m1>0;m1--) {  %>
                  <tr>
                      <td><a  href="iredit.jsp?tid=<%=taskdata1[m1][1] %>&cid=<%=taskdata1[m1][13] %>&type=contact"><% out.print(taskdata1[m1][2]); %></a></td>
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
            <!-- /.box-body -->
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
        PreparedStatement smt=con.prepareStatement("select count(*) from servicerequest where customerid=?");
        smt.setString(1,requestcid);
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count=rs.getString(1);  }
    rs.close();
      smt.close();
      con.close();    } 
       catch(Exception e)
      {
          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n employeedetails.jsp-----\n"
     + "LINE=723 + \n select count(*) from servicerequest where customerid="+requestcid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg); 
            }
      
        n=Integer.parseInt(count);
        String requestdata[][]=new String[n+1][55];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from servicerequest where customerid=?");
        smt.setString(1,requestcid);
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
      con.close();   } 
        catch(Exception e)
        {
              String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n employeedetails.jsp-----\n"
     + "LINE=750 + \n select * from servicerequest where customerid="+requestcid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
           }
      %>
	
	<div class="row">
	 <div class="col-xs-12">
      

          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Service Request </h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example5" class="table table-bordered table-striped">
                <thead>
                <tr>
                   <th>Request ID  </th>
                  <th>Subject</th>
                  <th>Status</th>
                  <th>  Due Date</th>
                  <th> Priority</th>
                  <th>Owner</th>
                </tr>
                </thead>
                <tbody>
                <%   m=1; for(m=1;m<=n;m++) {  %>
                  <tr>
                    <td><a href="servicerequestedit.jsp?cid=<%=requestdata[m][11] %>&tid=<%=requestdata[m][1] %>&type=contact"><% out.print("TSK"+requestdata[m][1]); %></a></td>
                    <td><% out.print(requestdata[m][4]); %></td>
                    <td><% if(requestdata[m][7].equals("Open")) {   %>
                           <span class="label label-danger"><% out.print(requestdata[m][7]); %></span>
                        <% } %>
                        <% if(requestdata[m][7].equals("In Process")) {   %>
                           <span class="label label-warning"><% out.print(requestdata[m][7]); %></span>
                        <% } %>
                        <% if(requestdata[m][7].equals("Follow Up")) {   %>
                           <span class="label label-info"><% out.print(requestdata[m][7]); %></span>
                        <% } %>
                        <% if(requestdata[m][7].equals("Complete")) {   %>
                           <span class="label label-success"><% out.print(requestdata[m][7]); %></span>
                        <% } %>
                        <% if(requestdata[m][7].equals("Cancelled")) {   %>
                           <span class="label label-default"><% out.print(requestdata[m][7]); %></span>
                        <% } %>
                        <% if(requestdata[m][7].equals("Rejected")) {   %>
                           <span class="label label-default"><% out.print(requestdata[m][7]); %></span>
                        <% } %>
                         
                     </td>
                   <td><% out.print((requestdata[m][5]).substring(0,10));  %></td>
                   <td> <% if(requestdata[m][6].equals("Very High")) {   %>
                           <span class="label label-danger"><% out.print(requestdata[m][6]); %></span>
                        <% } %>
                        <% if(requestdata[m][6].equals("Critical Situation")) {   %>
                           <span class="label label-danger"><% out.print(requestdata[m][6]); %></span>
                        <% } %>
                        <% if(requestdata[m][6].equals("Normal")) {   %>
                           <span class="label label-info"><% out.print(requestdata[m][6]); %></span>
                        <% } %>
                         <% if(requestdata[m][6].equals("High")) {   %>
                           <span class="label label-warning"><% out.print(requestdata[m][6]); %></span>
                        <% } %>
                        
                        <% if(requestdata[m][6].equals("Midium")) {   %>
                           <span class="label label-default"><% out.print(requestdata[m][6]); %></span>
                        <% } %>
                        <% if(requestdata[m][6].equals("Low")) {   %>
                           <span class="label label-default"><% out.print(requestdata[m][6]); %></span>
                        <% } %>  
                   </td>
                   <td><%=Db.getEmployeeName(requestdata[m][16])  %></td>
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
    
       <%    
              
         int ii=1,jj=0;
           String count123="NULL";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from invoice where customerid=? ");
        smt.setString(1,requestcid);
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count123=rs.getString(1);  }
     rs.close();
      smt.close();
      con.close();  } 
       catch(Exception e)
      {
          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n employeedetails.jsp-----\n"
     + "LINE=859 + \n select count(*) from invoice where customerid="+requestcid+"  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg); 
      }
      int n123=Integer.parseInt(count123);
       String leaddata[][]=new String[n123+1][256];
          try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from  invoice where customerid=? ");
        smt.setString(1,requestcid);
        ResultSet rs=smt.executeQuery();
    
        while(rs.next())
        { 
           for(jj=1;jj<255;jj++)
        {
        leaddata[ii][jj]=rs.getString(jj);
        }
           ++ii;  
        }
     rs.close();
      smt.close();
      con.close();  } 
          catch(Exception e)
          {
              String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n employeedetails.jsp-----\n"
     + "LINE=884 + \n select * from  invoice where customerid="+requestcid+"  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg); 
          }
      
       %>
      
      
      <div class="row">
        <div class="col-xs-12">
      

          <div class="box">
            <div class="box-header">
              <h3 class="box-title"> Invoice</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example4" class="table table-bordered table-striped">
                <thead>
                <tr>
                 <th>#Invoice No</th>
                  <th>Date</th>
                  
                  <th>Name</th>
                  <th>Net Amount</th>
                  <th>Due Amount</th>
                </tr>
                </thead>
               <tbody>
                   <%  m=0; for(m=n123;m>0;m--) {  %>
                  <tr>
                    <td><a href="invoice.jsp?incid=<%=leaddata[m][1]%>&type=customer"><% out.print(leaddata[m][254]); %></a></td>
                    <td><% out.print(leaddata[m][2].substring(0,11)); %></td>
                      <td><% out.print(leaddata[m][13]); %></td>
                        <td><% out.print("<i class='fa fa-fw fa-rupee'></i>"+leaddata[m][54]); %></td>
                          <td>
                            <%if("".equals(leaddata[m][63])||"null".equals(leaddata[m][63]) ){ %>
          <% if("0".equals(leaddata[m][54])){}else{ %>
          
    <%="<i class='fa fa-fw fa-rupee'></i>"+leaddata[m][54]  %>
         <% }%>
         <% }else{ %> <% out.print(leaddata[m][63]); %>  <% }  %>
                          
                          </td> 
                    
                    <% } %>
                  </tr>
               
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
	 <%    
              
          ii=1;jj=0;
            count123="NULL";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from purchaseorder where customerid=? ");
        smt.setString(1,requestcid);
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count123=rs.getString(1);  }
     rs.close();
      smt.close();
      con.close();  }
       catch(Exception e)
       {
           String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n employeedetails.jsp-----\n"
     + "LINE=959 + \n select count(*) from purchaseorder where customerid="+requestcid+"  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg); 
       }
       n123=Integer.parseInt(count123);
       String leaddata1[][]=new String[n123+1][256];
          try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from  purchaseorder where customerid=? ");
        smt.setString(1,requestcid);
        ResultSet rs=smt.executeQuery();
    
        while(rs.next())
        { 
           for(jj=1;jj<255;jj++)
        {
        leaddata1[ii][jj]=rs.getString(jj);
        }
           ++ii;  
        }
    rs.close();
      smt.close();
      con.close();   } 
          catch(Exception e)
          {
              String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n employeedetails.jsp-----\n"
     + "LINE=984 + \n select count from purchaseorder where customerid="+requestcid+"  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg); 
          }
      
       %>
      
      
      <div class="row">
        <div class="col-xs-12">
      

          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Purchase Order</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example3" class="table table-bordered table-striped">
                <thead>
                <tr>
                 <th>Purchase Order No</th>
                  <th>Date</th>
                  
                  <th>Name</th>
                  <th>Net Amount</th>
                  <th>Owner</th>
                </tr>
                </thead>
               <tbody>
                   <%  m=0; for(m=n123;m>0;m--) {  %>
                  <tr>
                    <td><a href="purchaseorder.jsp?incid=<%=leaddata1[m][1]%>&type=lead"><% out.print(leaddata1[m][254]); %></a></td>
                    <td><% out.print(leaddata1[m][2].substring(0,11)); %></td>
                      <td><% out.print(leaddata1[m][13]); %></td>
                        <td><% out.print(leaddata1[m][54]); %></td>
                          <td><% out.print(leaddata1[m][4]); %></td> 
                    
                    <% } %>
                  </tr>
               
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
       <%    
              
          ii=1;jj=0;
            count123="NULL";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from proforma where customerid=? ");
        smt.setString(1,requestcid);
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count123=rs.getString(1);  }
    rs.close();
      smt.close();
      con.close();   } 
       catch(Exception e)
       {
           String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n employeedetails.jsp-----\n"
     + "LINE=1051 + \n select count(*) from proforma where customerid="+requestcid+"  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg); 
       }
       n123=Integer.parseInt(count123);
       String leaddata2[][]=new String[n123+1][256];
          try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from  proforma where customerid=? ");
        smt.setString(1,requestcid);
        ResultSet rs=smt.executeQuery();
    
        while(rs.next())
        { 
           for(jj=1;jj<255;jj++)
        {
        leaddata2[ii][jj]=rs.getString(jj);
        }
           ++ii;  
        }
    rs.close();
      smt.close();
      con.close();   } 
          catch(Exception e)
          {
              String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n employeedetails.jsp-----\n"
     + "LINE=1076 + \n select * from  proforma where customerid="+requestcid+"   ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg); 
          }
      
       %>
      
      
      <div class="row">
        <div class="col-xs-12">
      

          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Proforma Invoice</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example6" class="table table-bordered table-striped">
                <thead>
                <tr>
                 <th>Proforma No</th>
                  <th>Date</th>
                  
                  <th>Name</th>
                  <th>Net Amount</th>
                  <th>Owner</th>
                </tr>
                </thead>
               <tbody>
                   <%  m=0; for(m=n123;m>0;m--) {  %>
                  <tr>
                    <td><a href="proforma.jsp?incid=<%=leaddata2[m][1]%>&type=lead"><% out.print(leaddata2[m][254]); %></a></td>
                    <td><% out.print(leaddata2[m][2].substring(0,11)); %></td>
                      <td><% out.print(leaddata2[m][13]); %></td>
                        <td><% out.print(leaddata2[m][54]); %></td>
                          <td><% out.print(leaddata2[m][4]); %></td> 
                    
                    <% } %>
                  </tr>
               
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
      <%    
              
          ii=1;jj=0;
            count123="NULL";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from quotation where customerid=? ");
        smt.setString(1,requestcid);
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count123=rs.getString(1);  }
    rs.close();
      smt.close();
      con.close();   } 
       catch(Exception e)
       {
           String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n employeedetails.jsp-----\n"
     + "LINE=1143 + \n select count(*) from quotation where customerid="+requestcid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg); 
       }
       n123=Integer.parseInt(count123);
       String leaddata3[][]=new String[n123+1][256];
          try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from  quotation where customerid=? ");
        smt.setString(1,requestcid);
        ResultSet rs=smt.executeQuery();
    
        while(rs.next())
        { 
           for(jj=1;jj<255;jj++)
        {
        leaddata3[ii][jj]=rs.getString(jj);
        }
           ++ii;  
        }
    rs.close();
      smt.close();
      con.close();   } 
          catch(Exception e)
          {
             String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n employeedetails.jsp-----\n"
     + "LINE=1168 + \n select * from quotation where customerid="+requestcid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);  
          }
      
       %>
      
      
      <div class="row">
        <div class="col-xs-12">
      

          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Quotation</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example7" class="table table-bordered table-striped">
                <thead>
                <tr>
                 <th>Quotation No</th>
                  <th>Date</th>
                  
                  <th>Name</th>
                  <th>Net Amount</th>
                  <th>Owner</th>
                </tr>
                </thead>
               <tbody>
                   <%  m=0; for(m=n123;m>0;m--) {  %>
                  <tr>
                    <td><a href="quotation.jsp?incid=<%=leaddata3[m][1]%>&type=lead"><% out.print(leaddata3[m][254]); %></a></td>
                    <td><% out.print(leaddata3[m][2].substring(0,11)); %></td>
                      <td><% out.print(leaddata3[m][13]); %></td>
                        <td><% out.print(leaddata3[m][54]); %></td>
                          <td><% out.print(leaddata3[m][4]); %></td> 
                    
                    <% } %>
                  </tr>
               
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
      
	
      
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
<jsp:include page="dist/include/footer.jsp" />
  <%  
    Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" ,contact_id="+cid+"  --Leaving  employeedetails.jsp ---");
    
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
    
    $('#example4').DataTable()
    
    $('#example5').DataTable()
    
    $('#example6').DataTable()
    $('#example7').DataTable()
  })
</script>

<script>
    function validateForm(){
     if(document.getElementById("eq").value!=""){
           
           if(!document.getElementById("eq").value.match(/^[a-zA-Z:,'-'' '\.0-9\n]+$/)){
                     document.getElementById("alert-message").innerHTML = "Customer Enquiry: Only this Charachters a-z A-Z 0-9 . , : '' allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("eq").focus();
     return false;
            } else
        if(document.getElementById("eq").value.length>2000){
                         document.getElementById("alert-message").innerHTML = "Customer Enquiry: Only 2000 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("eq").focus();
           
           return false;
       }}
    return true;
}
    </script>


</body>
</html>
