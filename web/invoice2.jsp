<%@page import="log.Log"%>
<%@page import="email.EmergencyEmail"%>
<%@page import="blezz.InvoiceInsert"%>
<%@page import="blezz.Db"%>
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
  <title>Invoice | INDSAC CRM</title>
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
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" ---------Entering invoice2.jsp------------");
%>
 <%  int jkr=0; 
       String businessinvoiceno="";
         java.util.Date ddate=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(ddate.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(ddate.getTime());
       String newcontactnewinvoice="null";//when invoice row is locked by old contact and new contact create invoice
       String newname=request.getParameter("newname");
               String newaddress1=request.getParameter("newaddress1");
               String newaddress2=request.getParameter("newaddress2");
               String newaddress3=request.getParameter("newaddress3");
               String newcontact1=request.getParameter("newcontact1");
               String newcontact2=request.getParameter("newcontact2");
               String newgstn=request.getParameter("newgstn");
               String newstate=request.getParameter("newstate");
           
       String owner=(String)session1.getAttribute("ownr");
       String cdata[]=new String[50];
           String amtinwords="",amtinwordspaisa="";
           String invoiceid=null;  int iiil=0;
       String incid=request.getParameter("incid");
      if(incid!=null || incid!=""||incid!="null"){invoiceid=incid; }
           String pagetype=Poul.escapeHtml(request.getParameter("type"));
           String type=pagetype;
           if(("trsh").equals(pagetype)){
              String sn=Poul.escapeHtml(request.getParameter("sn"));
               int isn= Integer.parseInt( sn ); int j=isn,i=0;
    
        isn=7*(isn-1)+71; 
       
        
        
        
           }String def[]=new String[50];String contact=Poul.escapeHtml(request.getParameter("contact"));
           if(("new").equals(pagetype)){
         
               
               
               
         
           if(!"".equals(contact)||!"null".equals(contact))
           {   try{ Connection con=Poul.getConnectionCRM();
             PreparedStatement smt=con.prepareStatement("select * from contact where id=? and useradminid=? ");
              smt.setString(1,contact);
              smt.setString(2,usercid_adminid);
                      ResultSet rs=smt.executeQuery();
              int i=1;
              while(rs.next()){
                  for(i=1;i<50;i++)
                  {cdata[i]=(rs.getString(i));} out.print(cdata[i]);
              } rs.close();
           smt.close();
           con.close();}
      catch(Exception e)
      {
          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoice2.jsp-----\n"
     + "LINE=121 + \n select * from contact where id="+contact+" and useradminid="+usercid_adminid+"   ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      }
           
           }else{  for(int i=1;i<50;i++)
                  {cdata[i]="";}}
          
           
           
        String msg="null";
      
       
        String id=(String)session.getAttribute("id"); 
        String SR=null,check=null,che1="null",che2=null;
       
  String getadminid="";      try{
        
Connection c=Poul.getConnectionCRM();

Statement st=c.createStatement();
   

 ResultSet rs3;
            rs3 = st.executeQuery("select  count(id)   FROM invoice where c_='1' and useradminid='"+usercid_adminid+"' ");
    while(rs3.next())
        
          {businessinvoiceno=rs3.getString(1); }
               rs3 = st.executeQuery("select  id   FROM invoice ORDER BY id DESC LIMIT 1 ");
    while(rs3.next())
        
          {SR=rs3.getString(1); }
      rs3 = st.executeQuery("select c_  FROM invoice where c_='0' and useradminid='"+usercid_adminid+"' ");
    while(rs3.next())
        
          {check=rs3.getString(1); }
          
          if("0".equals(check) ){che1=SR;  }
         
    cdata[6]=cdata[6].concat(cdata[7]);
           int i = Integer.parseInt( SR ); 
           ++i;  if(che1!="null"){i=Integer.parseInt( che1 ); }
           if("null".equals(che1)){
         int Checkinvoic=0;
        Checkinvoic=InvoiceInsert.setInvoiceInsert(usercid_adminid, usercid_id, contact, owner);   }
    
           invoiceid=Integer.toString(i);
             msg="success";    
       
   rs3.close();
           st.close();
           c.close();     }
        catch(Exception e)
        {
            String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoice2.jsp-----\n"
     + "LINE=176 + \n select c_  FROM invoice where c_='0' and useradminid='"+usercid_adminid+"   ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
        }
      int j=Integer.parseInt( businessinvoiceno );
      j++;
        businessinvoiceno=Integer.toString(j);
           }
        %>
     <%
        String a1[]=new String[256];
          
      
       try{
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from invoice where id=?");
        smt.setString(1,invoiceid);
        ResultSet rs=smt.executeQuery();
       
        while(rs.next()){
            for(int i=1;i<255;i++){
               a1[i]=(rs.getString(i)); 
               
            }
        }  
        int j=0;
        for(int i=71;i<241;i+=7)
        { if("".equals(a1[i])||"null".equals(a1[i])||"0".equals(a1[i]) ){ j++;}else { iiil++;}   }
        
    rs.close();
           smt.close();
           con.close();   }
      
        catch(Exception e)
        {
                String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoice2.jsp-----\n"
     + "LINE=213 + \n select * from invoice where id="+invoiceid +" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
                }
       String a11[]=new String[256];
          
      
       try{
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from invoiceseller where invoiceid=?");
        smt.setString(1,invoiceid);
        ResultSet rs=smt.executeQuery();
       
        while(rs.next()){
            for(int i=1;i<60;i++){
               a11[i]=(rs.getString(i)); 
               
            }
        }  
      
    rs.close();
           smt.close();
           con.close();   }
      
        catch(Exception e)
        {
              String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoice2.jsp-----\n"
     + "LINE=241 + \n select * from invoiceseller where invoiceid="+invoiceid+" ";
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
 
	    <!-- Content Header (Page header) -->
    <section class="content-header">
    
	<div class="row" id="invoice">
	<div class="col-sm-3">
            <a href="invoice/invoiceprint.jsp?incid=<%=invoiceid %>" target="_blank"> <button type="button" class="btn btn-block btn-info"><i class="fa fa-fw fa-print"></i>Print</button></a>
	</div>
            
	<div class="col-sm-3">
            <a href="contactdetails.jsp?cid=<%=a1[59] %>&type=contact">     <button  class="btn btn-block btn-info" ><i class="fa fa-fw fa-user"></i>Customer Profile</button></a>
              
	</div>
	<div class="col-sm-3">
            <a href="#cashmemo" >  <button  class="btn btn-block btn-info" ><i class="fa fa-fw fa-credit-card"></i>Cash Memo</button></a>
            
               </div>
         <div class="col-sm-3">
            <a href="#depositrecord" >  <button  class="btn btn-block btn-info" ><i class="fa fa-fw fa-credit-card"></i>Deposit Record</button></a>
            
        </div>
        <br><br>
       
         <form method="get" action="InvoiceAddProduct">
	<div class="col-sm-3">
          <button type="submit" class="btn btn-block btn-info"><i class="fa fa-fw fa-check-square-o"></i>Save</button>
	</div>
        
             
             <div class="col-sm-3">
               
                 
                 
             </div><div class="col-sm-3"></div>
       
	</div>

	
	
	
    </section>
	<section class="content-header">
      <h1>
        Invoice
        <small>#007612</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Examples</a></li>
        <li class="active">Invoice</li>
      </ol>
    </section>

  

    <!-- Main content -->
    <section class="invoice">
      <!-- title row -->
      <div class="row">
        <div class="col-xs-12">
          <h2 class="page-header">
              <img src="dist/img/u.png"> INDSAC-CRM
              
              <% String date="null";
                        date=(a1[2]);
                      date=date.substring(0,10); 
                 date=Character.toString(date.charAt(8))+Character.toString(date.charAt(9))+"/"+Character.toString(date.charAt(5))+Character.toString(date.charAt(6))+"/"+Character.toString(date.charAt(0))+Character.toString(date.charAt(1))+Character.toString(date.charAt(2))+Character.toString(date.charAt(3));
         %>
          
            <small class="pull-right">Date: <%if("".equals(a1[5])||"null".equals(a1[5]) ){ out.print(date);   }else { out.println(a1[5]);   }%></small>
          </h2>
        </div>
        <!-- /.col -->
      </div>
      <!-- info row -->
      <div class="row invoice-info">
        <div class="col-sm-3 invoice-col">
          From
         <address>
                <strong><%=a11[12]   %></strong><br>
                <%=a11[13]   %><%=","+a11[20]   %><br>
               <%=a11[21]   %> <%=","+a11[22]   %>  <br>
                <%=a11[17]   %><%=" "+a11[18]   %><br>
                <% if(!"null".equals(a11[16])&&!"".equals(a11[16])){out.println("Web:"+a11[16]);} %><% if(!"null".equals(a11[19])&&!"".equals(a11[19])){out.println("Email:"+a11[19]);} %>   <br>
               <%="GST:"+a11[15]   %>
               
            </address>
        </div>
        <!-- /.col -->
        <div class="col-sm-3 invoice-col">
          To
          <address>
              <strong>
                 <% if("new".equals(type) ){ if("".equals(newname)||"null".equals(newname) ){  }else {out.print(newname+"<br>");   } }else {  if("".equals(a1[13])||"null".equals(a1[13]) ){  }else {out.println(a1[13]+"<br>"); } } %>   
               </strong>
           <% if("new".equals(type) ){ if("".equals(newaddress1)||"null".equals(newaddress1) ){  }else { out.print(newaddress1+"<br>");  } }else {  if("".equals(a1[14])||"null".equals(a1[14]) ){ }else { out.print(a1[14]+"<br>");   } } %>
               
             <% if("new".equals(type) ){ if("".equals(newaddress2)||"null".equals(newaddress2) ){  }else { out.print(newaddress2+"<br>");  } }else {  if("".equals(a1[15])||"null".equals(a1[15]) ){  }else { out.print(a1[15]+"<br>");   } } %>
             <% if("new".equals(type) ){ if("".equals(newaddress3)||"null".equals(newaddress3) ){  }else { out.print(newaddress3+"<br>");  } }else {  if("".equals(a1[16])||"null".equals(a1[16]) ){  }else { out.print(a1[16]+"<br>");   } } %>
             <% if("new".equals(type) ){ if("".equals(newcontact1)||"null".equals(newcontact1) ){  }else { out.print(newcontact1+"<br>");  } }else {  if("".equals(a1[17])||"null".equals(a1[17]) ){  }else { out.print(a1[17]+"<br>");   } } %>
             <% if("new".equals(type) ){ if("".equals(newcontact2)||"null".equals(newcontact2) ){  }else { out.print(newcontact2+"<br>");  } }else {  if("".equals(a1[18])||"null".equals(a1[18]) ){  }else { out.print(a1[18]+"<br>");   } } %>
             <% if("new".equals(type) ){ if("".equals(newgstn)||"null".equals(newgstn) ){  }else { out.print(newgstn+"<br>");  } }else {  if("".equals(a1[23])||"null".equals(a1[23]) ){  }else { out.print(a1[23]+"<br>");   } } %>
           <br>
            
          </address>
        </div>
            <div class="col-sm-3 invoice-col">
         <b>Invoice #<%  if("new".equals(type)){  out.print(businessinvoiceno);  }else{ out.print(a1[254]);   } %></b><br>
         <br>
           <div class="col-sm-6">
              Supply   Date  </div>
                  <div class="col-sm-6">
                     <input type="text" class="form-control" id="datepicker2" name="supplydate" <%if("".equals(a1[11])||"null".equals(a1[11]) ){ %>placeholder="<%=date %>" value="<%=date  %>"<% }else {%> placeholder="<%=a1[11] %>" value="<%=date  %>" <% }%>>

                  </div>
                     <br><br>
          <div class="col-sm-6">
                 Place of Supply </div>
                  <div class="col-sm-6">
                     <input type="text" class="form-control" id="supplyplace" name="supplyplace" <%if("".equals(a1[12])||"null".equals(a1[12]) ){ %>placeholder="Indore" value="Indore" <% }else {%> placeholder="<%=a1[12] %>" value="<%=a1[12]  %>" <% }%>>

                  </div>
           
        </div>
        <!-- /.col -->
        <div class="col-sm-3 invoice-col">
         
           
 Reverse Charge(Y/N):<select id="reversecharge" name="reversecharge"  value="<%=(a1[6]) %>">
     <%if("".equals(a1[6])||"null".equals(a1[6]) ){ %> <option value="No">No</option> 
     
     <% }else {%>   <option value="<%=(a1[6]) %>"><%=(a1[6]) %></option> <% }%>                    
   
                        
<option value="Yes">Yes</option>
<option value="Yes">No</option>
</select> 
     <br><br>
         <div class="col-sm-4">
                  Transporter </div>
                  <div class="col-sm-8">
                       <input type="text" class="form-control" id="transporter" name="transporter" <%if("".equals(a1[9])||"null".equals(a1[9]) ){ %>placeholder="transporter" <% }else {%> placeholder="<%=a1[9] %>" value="<%=a1[9]  %>" <% }%>>


                  </div> <br>  <br>  <div class="col-sm-4">
                 Vehicle No</div>
                  <div class="col-sm-8">
                     <input type="text" class="form-control" id="vehicleno" name="supplydate" <%if("".equals(a1[10])||"null".equals(a1[10]) ){ %>placeholder="Vehicle No" <% }else {%> placeholder="<%=a1[10] %>" value="<%=a1[10]  %>" <% }%>>

                  </div>

        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

      <!-- Table row -->
      <div class="row">
        <div class="col-xs-12 table-responsive">
          <table class="table table-striped">
            <thead>
            <tr>
             <th>Sn</th>
              <th>Product</th>
              <th>#Code</th>
              <th>Qty</th>
              <th>Rate</th>
              <th>Unit</th>
              <th>Amount</th>
              <th>Edit/Delete</th>
            </tr>
            </thead>
            <tbody>
            <% int jj=71;
                         String iinpro[]=new String[505];
                               for(int i=1;i<=iiil;i++){ 
                                   
                      
                        %>  
                            
            <tr>
              
         <td> <%if("".equals(a1[jj])||"null".equals(a1[jj]) ){ %>- <% }else {%> <%=a1[jj]  %> <% }%></td> 

<td><%if("".equals(a1[jj+1])||"null".equals(a1[jj+1]) ){ %>- <% }else {%> <%=a1[jj+1]  %> <% }%></td> 

<td><%if("".equals(a1[jj+2])||"null".equals(a1[jj+2]) ){ %> <% }else {%> <%="#"+a1[jj+2]  %> <% }%></td> 

<td><%if("".equals(a1[jj+3])||"null".equals(a1[jj+3]) ){ %>- <% }else {%> <%=a1[jj+3]  %> <% }%></td> 

<td><%if("".equals(a1[jj+4])||"null".equals(a1[jj+4]) ){ %>- <% }else {%> <%=a1[jj+4]  %> <% }%></td> 

<td><%if("".equals(a1[jj+5])||"null".equals(a1[jj+5]) ){ %>- <% }else {%> <%=a1[jj+5]  %> <% }%></td> 

<td><%if("".equals(a1[jj+6])||"null".equals(a1[jj+6]) ){ %>- <% }else {%> <%="Rs "+a1[jj+6]  %> <% }%></td> 

<td>   <a href="invoice.jsp?incid=<%=invoiceid %>&type=proinedit&sn=<%=a1[jj]  %>" >  <i class="fa fa-edit"></i></a>
<a href="test.jsp?incid=<%=invoiceid %>&type=trsh&sn=<%=a1[jj]  %>&max=<%=iiil  %>&pro=<%=a1[jj+1]  %>&cod=<%=a1[jj+2]  %>&qt=<%=a1[jj+3]  %>&rate=<%=a1[jj+4]  %>&amt<%=a1[jj+6]  %>=#sn" > <i class="fa fa-trash-o"></i> </a>
</td>               


            
            
            
            </tr>
            <% jj=jj+7; } %>
             <%
           int i=0;int j=0; 
           String count2="0";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from stock where useradminid=? ");
         smt.setString(1,usercid_adminid );
       
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count2=rs.getString(1);  }
  rs.close();
           smt.close();
           con.close();     } catch(Exception e)
           { 
               String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoice2.jsp-----\n"
     + "LINE=474 + \n select count(*) from stock where useradminid="+usercid_adminid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);  
           }
      
       int n2=Integer.parseInt(count2);
       String taskdata2[][]=new String[n2+1][55];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from stock where useradminid=?  ");
         smt.setString(1,usercid_adminid );
       
        ResultSet rs=smt.executeQuery();
     i=1;
        while(rs.next())
        { 
           for( j=1;j<=8;j++)
          {
            taskdata2[i][j]=rs.getString(j); 
           
          }
           ++i;  
        }
  rs.close();
           smt.close();
           con.close();     } catch(Exception e)
           { 
               String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoice2.jsp-----\n"
     + "LINE=501 + \n select * from stock where useradminid="+usercid_adminid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg); 
           }
        
        String pronamevalue="";
      %>
      <tr>
          <td><label >  <%=iiil+1  %> </label>
        <input type="hidden" name="sn"   value="<%=iiil+1 %>"></td>
          <td>
               <select   class="form-control" id="description" name="description1" >
<option  value="" >Select Product</option>
 
                       <% for(i=1;i<=n2;++i){ 
                        pronamevalue=taskdata2[i][2]+" HSN="+taskdata2[i][5] ;   %>
                         <option value="<%=taskdata2[i][1]+":"+taskdata2[i][2]+":"+taskdata2[i][5]+":"+taskdata2[i][6]+":"+taskdata2[i][7]  %>"><% out.println(taskdata2[i][2]+" ,In-Stock:"+taskdata2[i][3]);  %></option>
                        
                         <% }  %>
                          
                  </select>
          </td>
          <td>    <input type="text" class="form-control" id="hsncode" name="hsncode"  placeholder="Code">
                 </td>
                 <td>  <input type="number" class="form-control" id="qty" name="qty"  placeholder="1" value="1">       </td>
          <td>    
             <input type="text" class="form-control" id="rate" name="rate"  placeholder="0" value="0" > 
                 </td>
          <td><select required=""  class="form-control" id="unit" name="unit">
<option value="Pcs"  >(Pcs)</option>
<option  value="Bag/Bags">Bag/Bags</option>
<option  value="Barrels">Barrels</option>
<option  value="Bottles">Bottles</option>
<option  value="Box / Boxes">Box / Boxes</option>
<option  value="Bunches">Bunches</option>
<option  value="Bushel/Bushels">Bushel/Bushels</option>
<option  value="Cubic meter">Cubic meter</option>
<option  value="Dozen">Dozen</option>
<option  value="Gallon">Gallon</option>
<option  value="Gram">Gram</option>
<option  value="Kilogram">Kilogram</option>
<option  value="Kilometer">Kilometer</option>
<option  value="Long Ton">Long Ton</option>
<option  value="Meter">Meter</option>
<option  value="Metric Ton">Metric Ton</option>
<option  value="Ounce">Ounce</option>
<option  value="Pack/Packs">Pack/Packs</option>
<option  value="Pair">Pair</option>
<option  value="Pieces">Pieces</option>
<option  value="Pound">Pound</option>
<option  value="Set/Sets">Set/Sets</option>
<option  value="Short Ton">Short Ton</option>
<option  value="Square Meter">Square Meter</option>
<option  value="Ton">Ton</option>
</select></td>
<td>
        <input type="hidden" name="owner" value="<%=owner %>">
    <input type="hidden" name="contact" value="<%=a1[254] %>">
    <input type="hidden" name="pagetype" value="addproduct">
                                <input type="hidden" name="incid" value="<%=invoiceid %>">
                                <%  if("new".equals(type)){ %>
                                     <input type="hidden" name="newcontactdbinsert" value="<%=contact %>">
                           <%     } else {%>
                                         <input type="hidden" name="newcontactdbinsert" value="<%=a1[59] %>">
                            
                           <%     } %>
             <button class="btn btn-sm btn-info btn-flat pull-right"onClick="return validateForm()"  type="submit">Add Product-</button>
</td>
      </tr>
      
            </tbody>
          </table>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

      <div class="row">
        <!-- accepted payments column -->
        <div class="col-xs-6">
            <p class="lead">Tax Calculation:</p>
         <table class="table table-striped">
            <thead>
            <tr>
             <th>Tax</th>
              <th>Rate</th>
              <th>Amount</th>
              
             
            </tr>
            </thead>
            <tbody>
             <tr>
                    <td>CGST</td>
                    <td><input type="text"  name="" placeholder="<%=a1[43] %>" value="<%=a1[43] %>">%</td>
                    <td><i class="fa fa-fw fa-rupee"></i><%if("".equals(a1[44])||"null".equals(a1[44]) ){ %>00.00 <% }else {%> <%=a1[44]  %> <% }%></td>
                    
                </tr>
                 <tr>
                    <td>SGST</td>
                    <td><input type="text"  name="" placeholder="<%=a1[45] %>" value="<%=a1[45] %>">%</td>
                    <td><i class="fa fa-fw fa-rupee"></i><%if("".equals(a1[46])||"null".equals(a1[46]) ){ %>00.00 <% }else {%> <%=a1[46]  %> <% }%></td>
                    
                </tr>
                 <tr>
                    <td>IGST</td>
                    <td><input type="text"  id="igst" name="igst" placeholder="<%=a1[47] %>" value="<%=a1[47] %>">%</td>
                    <td><i class="fa fa-fw fa-rupee"></i><%if("".equals(a1[48])||"null".equals(a1[48]) ){ %>00.00 <% }else {%> <%=a1[48]  %> <% }%></td>
                   
                </tr>
                <tr>
                    <td></td>
                    <td align="right"><b>Total Tax</b></td>
                </tr>
                 
            </tbody></table>

          <p class="text-muted well well-sm no-shadow" style="margin-top: 10px;">
            Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg
            dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra.
          </p>
        </div>
        <!-- /.col -->
        <div class="col-xs-6">
          <p class="lead">Amount </p>

          <div class="table-responsive">
            <table class="table">
              <tr>
                <th style="width:50%">Subtotal:</th>
                <td><%if("".equals(a1[37])||"null".equals(a1[37]) ){ %><i class="fa fa-fw fa-rupee"></i> 00.00 <input type="hidden" name="producttotal" value="0.00"> <% }else {%> <i class="fa fa-fw fa-rupee"></i><%=a1[37]  %> <input type="hidden" name="producttotal" value="<%=a1[37]  %>"> <% }%></td>
              </tr>
              <tr>
                <th>Total Amount With Tax</th>
                <td>$10.34</td>
              </tr>
                <tr>
                <th>In Words:</th>
                <td><b>Seven Hundred Twenty Thousands Thirty Five Only</b></td>
              </tr>
                <tr>
                    <td>Charges are excluded</td>
              </tr>
              <tr>
                <th>Shipping Charge:</th>
                <td>$5.80</td>
              </tr>
               <tr>
                <th>Service Charge:</th>
                <td>$5.80</td>
              </tr>
               <tr>
                <th>Freight Charge:</th>
                <td>$5.80</td>
              </tr>
               <tr>
                <th>Discount:</th>
                <td>$5.80</td>
              </tr>
              <tr>
                <th>Total:</th>
                <td>$265.24</td>
              </tr>
              <tr>
                <th>In Words:</th>
                <td><b>Seven Hundred Twenty Thousands Thirty Five Only</b></td>
              </tr>
            </table>
          </div>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

      <!-- this row will not appear when printing -->
      <div class="row no-print">
        <div class="col-xs-12">
          <a href="invoice-print.html" target="_blank" class="btn btn-default"><i class="fa fa-print"></i> Print</a>
          <button type="button" class="btn btn-success pull-right"><i class="fa fa-credit-card"></i> Submit Payment
          </button>
          <button type="button" class="btn btn-primary pull-right" style="margin-right: 5px;">
            <i class="fa fa-download"></i> Generate PDF
          </button>
        </div>
      </div>
    </section><section class="content"></section>
    <!-- /.content -->
  </div>
<jsp:include page="dist/include/footer.jsp" />
<% Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Leaving invoice2.jsp------");
 
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
      function validateForm(){
          
           if(document.getElementById("subject").value==""){
   
            document.getElementById("alert-message").innerHTML = "Subject cannot be empty";
    $('#show-alert').modal('show')
       document.getElementById("subject").focus();
           return false;
        }else if(document.getElementById("subject").value!=""){
           
           if(!document.getElementById("subject").value.match(/^[0-9 a-z.A-Z]+$/)){
              document.getElementById("alert-message").innerHTML = "Subject: only alphanumeric allowed";
    $('#show-alert').modal('show')
           
           document.getElementById("subject").focus();
     return false;
            } 
        } 
        
        if(document.getElementById("assigned").value!=""){
           
           if(!document.getElementById("assigned").value.match(/^[0-9 a-z.A-Z]+$/)){
                     document.getElementById("alert-message").innerHTML = "Assigned To: Only alphanumeric allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("assigned").focus();
     return false;
            } else
        if(document.getElementById("assigned").value.length>30){
                         document.getElementById("alert-message").innerHTML = "Assigned To: Only 30 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("assigned").focus();
           
           return false;
       }}
       
        
         return true;
  }
  
</script>
  

</body>
</html>
