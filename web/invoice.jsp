<%@page import="blezz.Nd"%>
<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
<%@page import="blezz.InvoiceInsert"%>
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
        <link rel="shortcut icon" href="dist/img/u.png" type="image/x-icon" /> 
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Invoice | INDSAC CRM</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.7 -->
        <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
                <link rel="stylesheet" href="css/modal.css">

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
            <script defer src="js/modal.js"></script>


    </head>
    <body class="hold-transition skin-blue sidebar-mini">
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
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   --Entering Invoicef10.jsp---  ---");
     
           String checkinvoicedefaultsetting[]=new String[4];
            try{ Connection con=Poul.getConnectionCRM();
                    PreparedStatement smt=con.prepareStatement("select invoicedefaultcity from defaultvalues where  useradminid=? and usercid=? ");
                   
                    smt.setString(1,usercid_adminid);
                    smt.setString(2,usercid_id);
                    ResultSet rs=smt.executeQuery();
                    int i=1;
                    while(rs.next()){
                        
                        checkinvoicedefaultsetting[1]=(rs.getString(1)); 
                    } 
                    rs.close();
                    smt.close() ;
                    con.close();}
                    catch(Exception e)
                    {
                        String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoice.jsp-----\n"
     + "LINE=79+ \n select invoicedefaultcity from defaultvalues where  useradminid="+usercid_adminid+"  and usercid="+usercid_id+"  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
         }
         if(checkinvoicedefaultsetting[1]==null || checkinvoicedefaultsetting[1]=="InActive" ){
                 Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   --Entering Invoicef10.jsp--- No Invoice Setting found ---redirecting to invoicesetting.jsp");
     
                response.sendRedirect("invoicesetting.jsp");}
        %>

        <%  String successmsg="",warningmsg="";
            String notifymsg=request.getParameter("msg");if("added".equals(notifymsg)){successmsg="Product added Successfully";}
            int jkr=0; 
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
            String cdata[]=new String[52];
            String amtinwords="",amtinwordspaisa="";
            String invoiceid=null;  int iiil=0;
            String incid=request.getParameter("2a2e2a696e636964");//incid encrypt
            if(incid!=null){incid=Nd.Decrypt(incid);}
            if(incid!=null || incid!=""||incid!="null"){invoiceid=incid; }
            
            String pagetype=Poul.escapeHtml(request.getParameter("2a2e2a74797065"));//type encrypt
            if(pagetype!=null){pagetype=Nd.Decrypt(pagetype);}
            
            String type=pagetype;
            if(("trsh").equals(pagetype)){
               String sn=Poul.escapeHtml(request.getParameter("sn"));
               int isn= Integer.parseInt( sn ); int j=isn,i=0;    
               isn=7*(isn-1)+71; 
               }
            String def[]=new String[50];
            String contact=Poul.escapeHtml(request.getParameter("2a2e2a636f6e74616374"));//contact encrypt
           if(contact!=null){contact=Nd.Decrypt(contact);}
           
            if(("new").equals(pagetype)){
               if(!"".equals(contact)||!"null".equals(contact)){ 
                    try{ Connection con=Poul.getConnectionCRM();
                    PreparedStatement smt=con.prepareStatement("select * from contact where id=? and useradminid=? ");
                    smt.setString(1,contact);
                    smt.setString(2,usercid_adminid);
                    ResultSet rs=smt.executeQuery();
                    int i=1;
                    while(rs.next()){
                        for(i=1;i<50;i++)
                        {cdata[i]=(rs.getString(i));} 
                        
                    } 
                    rs.close();
                    smt.close();
                    con.close();}
                    catch(Exception e)
                    {  
                        String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoice.jsp-----\n"
     + "LINE=142+ \n select * from contact where id="+contact+" and useradminid="+usercid_adminid+"  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
                    }
                    
                  }
               else{  
                   for(int i=1;i<50;i++)
                   {cdata[i]="";}
               }
               String msg="null";
               String id=(String)session.getAttribute("id"); 
               String SR=null,check=null,che1="null",che2=null;    
               String getadminid="";      
               try{
                    Connection c=Poul.getConnectionCRM();
                    Statement st=c.createStatement();
                    ResultSet rs3;
                    rs3 = st.executeQuery("select  count(id)   FROM invoice where c_='1' and useradminid='"+usercid_adminid+"' ");
                    while(rs3.next()){
                        businessinvoiceno=rs3.getString(1);
                    }
                    session.setAttribute("businessinvoiceno",businessinvoiceno); 

                    rs3 = st.executeQuery("select  id   FROM invoice ORDER BY id DESC LIMIT 1 ");
                    while(rs3.next()){
                        SR=rs3.getString(1);
                    }
                    rs3 = st.executeQuery("select c_  FROM invoice where c_='0' and useradminid='"+usercid_adminid+"' ");
                    while(rs3.next()){
                        check=rs3.getString(1);
                    }
                    if("0".equals(check) ){
                        che1=SR;  
                    }
                    cdata[6]=cdata[6].concat(cdata[7]);
                    int i = Integer.parseInt( SR ); 
                    ++i;  
                    if(che1!="null"){i=Integer.parseInt( che1 ); }
                    if("null".equals(che1)){
                    int Checkinvoic=0;
                    Checkinvoic=InvoiceInsert.setInvoiceInsert(usercid_adminid, usercid_id, contact, owner);   }
                    invoiceid=Integer.toString(i);
                    msg="success";    
                    rs3.close();
                    st.close();
                    c.close();     
               }
               catch(Exception e)
               {
                  String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoice.jsp-----\n"
     + "LINE=193+ \n select c_  FROM invoice where c_='0' and useradminid='"+usercid_adminid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
               }
               int j=Integer.parseInt( businessinvoiceno );
               j++;
               businessinvoiceno=Integer.toString(j);
            
               }
            
        %>



        <div class="wrapper">
            <%
                String a1[]=new String[256];
                try{
                    Connection con=Poul.getConnectionCRM();
                    PreparedStatement smt=con.prepareStatement("select * from invoice where id=? and useradminid=?");
                    smt.setString(1,invoiceid);
                    smt.setString(2,usercid_adminid);
                    ResultSet rs=smt.executeQuery();
                    while(rs.next()){
                        for(int i=1;i<255;i++){
                            a1[i]=(rs.getString(i)); 
                        }
                    }  
                    int j=0;
                    for(int i=71;i<241;i+=7){
                        if("".equals(a1[i])||"null".equals(a1[i])||"0".equals(a1[i]) ){ j++;}else { iiil++;}  
                    }
                    rs.close();
                    smt.close();
                    con.close();  
                }
                catch(Exception e)
                {
                     String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoice.jsp-----\n"
     + "LINE=229+ \n select * from invoice where id="+invoiceid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
                }
                int cfinal = 3;
               String Final="";
                String val1="true1";
                String val2="false0";
                
                int c1=2;
                try{
                    Connection con=Poul.getConnectionCRM();
                    PreparedStatement smt=con.prepareStatement("select cfinal,c_ from invoice where id=? and useradminid=?");
                    smt.setString(1,invoiceid);
                    smt.setString(2,usercid_adminid);
                    ResultSet rs=smt.executeQuery();
                    while(rs.next()){
                            cfinal=(rs.getInt(1));
                             c1 =(rs.getInt(2));
                    }    
                    
                    rs.close();
                    smt.close();
                    con.close();  
                }
                catch(Exception e)
                {
                    String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoice.jsp-----\n"
     + "LINE=256+ \n select cfinal,c_ from invoice where id="+invoiceid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
                }
                 
                
                Final=Poul.escapeHtml(request.getParameter("final"));
                
                
                if(Final!=null){
                if(Final.equals(val1))
                {
                try{
                    Connection con=Poul.getConnectionCRM();
                    PreparedStatement smt=con.prepareStatement("update invoice set cfinal = ? where id = ? and useradminid=? ");
                    smt.setInt(1,1);
                    smt.setString(2,invoiceid);
                    smt.setString(3,usercid_adminid);
                    int fi=smt.executeUpdate();
                   
                    smt.close();
                    con.close();  
                }
                catch(Exception e)
                {
                     String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoice.jsp-----\n"
     + "LINE=281+ \n update invoice set cfinal =1 where id ="+invoiceid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
                }
                }
                else if(Final.equals(val2))
                {
                try{
                    Connection con=Poul.getConnectionCRM();
                    PreparedStatement smt=con.prepareStatement("update invoice set cfinal = ? where id = ? and useradminid=? ");
                    smt.setInt(1,0);
                    smt.setString(2,invoiceid);
                    smt.setString(3,usercid_adminid);
                    int fi=smt.executeUpdate();
                    
                    smt.close();
                    con.close();  
                }
                catch(Exception e)
                {
                    String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoice.jsp-----\n"
     + "LINE=301+ \n update invoice set cfinal =1 where id ="+invoiceid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
                }
                }
                }
                try{
                    Connection con=Poul.getConnectionCRM();
                    PreparedStatement smt=con.prepareStatement("select cfinal,c_ from invoice where id=? and useradminid=?");
                    smt.setString(1,invoiceid);
                    smt.setString(2,usercid_adminid);
                    ResultSet rs=smt.executeQuery();
                    while(rs.next()){
                            cfinal=(rs.getInt(1));
                             c1 =(rs.getInt(2));
                    }    
                    
                    rs.close();
                    smt.close();
                    con.close();  
                }
                catch(Exception e)
                {
                    String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoice.jsp-----\n"
     + "LINE=324 + \n update invoice set cfinal =1 where id ="+invoiceid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
                }
                String a11[]=new String[256];
                try{
                Connection con=Poul.getConnectionCRM();
                PreparedStatement smt=con.prepareStatement("select * from invoiceseller where invoiceid=? and useradminid=?");
                smt.setString(1,invoiceid);
                smt.setString(2,usercid_adminid);
                ResultSet rs=smt.executeQuery();
                while(rs.next()){
                    for(int i=1;i<60;i++){
                       a11[i]=(rs.getString(i)); 
                    }
                }  
                rs.close();
                smt.close();
                con.close();   
                }
                catch(Exception e)
                {
                     String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoice.jsp-----\n"
     + "LINE=346 + \n select * from invoiceseller where invoiceid="+invoiceid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
                }
               //System.out.println(al.size());
            %>
            <jsp:include page="dist/include/leftmenu.jsp" />  
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <div class="row" id="invoice">
                        <div class="col-sm-3">
                            <a href="invoice/invoiceprintf10.jsp?2a2e2a696e636964=<%=Nd.Encrypt(invoiceid) %>" target="_blank"> <button type="button" class="btn btn-block btn-info"<%if(cfinal==0 || c1!=1){%>disabled<%}%>><i class="fa fa-fw fa-print"></i>Print</button></a>
                        </div>
                        <div class="col-sm-3"> 
                            <a href="contactdetails.jsp?2a2e2a636964=<%=Nd.Encrypt(a1[253]) %>&2a2e2a74797065=2a2e2a636f6e74616374">     <button  class="btn btn-block btn-info" ><i class="fa fa-fw fa-user"></i>Customer Profile</button></a>
                        </div>
                        <div class="col-sm-3">
                            <a href="#cashmemo" >  <button  class="btn btn-block btn-info" ><i class="fa fa-fw fa-credit-card"></i>Cash Memo</button></a>
                        </div>
                        <div class="col-sm-3">
                            <a href="#depositrecord" >  <button  class="btn btn-block btn-info" ><i class="fa fa-fw fa-credit-card"></i>Deposit Record</button></a>
                        </div>
                        <br>
                        <br>
                        <div class="col-sm-3">
                        </div>
                        <div class="col-sm-1">
                        </div>
                        <form method="post" action="invoice.jsp" > 
                             <%if(c1!=0){%>
                            <div class="col-sm-4">
                                <input type="hidden" name="final" <%if(cfinal==0){%>value="true1"<%}else if(cfinal==1){%>value="false0"<%}%>>
                                <input type="hidden" name="2a2e2a696e636964" value=<%=Nd.Encrypt(invoiceid) %>>
                                <button class="btn btn-block btn-info"   type="submit"><i class="fa fa-fw fa-check-square-o"></i><%if(cfinal!=1){%>Save<%}else{%>Edit<%}%></button>
                            </div>         
                            <%}%>
                        </form>
                        <br>
                        <br>
                        
                        <div class="col-sm-3"></div>
                        <div class="col-sm-3"></div>
                    </div>
                </section>    
                <form method="get" action="InvoiceAddProductf10">
                <!-- Main content -->
                <section class="invoice">
                    <!-- info row -->
                    <!-- info row -->
                    <div class="row">
                        <!-- /.col -->
                        <div class="col-xs-12">
                            <h1 class="page-header" align="center">
                                <strong > TAX INVOICE</strong>
                            </h1>
                        </div><div class="col-sm-3">
                               <%  String invoicelogofile=menu.AdminDefaultValues.getAdminInvoiceLogo(usercid_adminid);
           
                            invoicelogofile=invoicelogofile.substring(0, invoicelogofile.length()-1);
                      if("0".equals(invoicelogofile) || "".equals(invoicelogofile)) {     %>
                          <img class="img-responsive" src="dist/img/u.png" alt="Photo">  
                          <% }else{  %>
                          <img class="img-responsive" src="uploads/logo/<%=invoicelogofile %>" alt="Photo" width="80" height="80">  
                           <% } %>
                        </div><div class="col-sm-3">
                           
                        </div><div class="col-sm-3"></div>
                        <div class="col-sm-3">
                            <%
                                if("".equals(a1[63])||"null".equals(a1[63]) ){ 
                            %>
                               <% 
                                   if("0".equals(a1[54])){}else{ 
                               %>
                            <div class="callout callout-danger ">
                                <p>Due Amount54: <%="<i class='fa fa-fw fa-rupee'></i>"+a1[54]  %></p> 
                            </div>
                            <% }%>
                            <% } 
                                else{
                                  if("0.00".equals(a1[63])||"0".equals(a1[63]) ){
                             %> 
                            <h1 style="background-color:green; color:white;"  >Amount Paid</h1>
                            <%} 
                                  else {
                            %>
                            <div class="callout callout-danger ">
                                <h4>Due Amount:<%="<i class='fa fa-fw fa-rupee'></i>"+a1[63]  %></h4>
                            </div>
                                <% }} %>
                        </div><input type="hidden" name="invoicedueamount" value="<%=a1[63] %>">
                    </div>
                        <!-- info row -->
                        <!-- info row -->
                    <div class="row invoice-info">
                        <div class="col-sm-3 invoice-col">
                            <address>
                                <strong>Seller</strong>
                                <br>
                                <strong><%=a11[12]   %></strong>
                                <br>
                                <%=a11[13]   %><%=","+a11[20]   %>
                                <br>
                                <%=a11[21]   %> <%=","+a11[22]   %>
                                <br>
                                <%=a11[17]   %><%=" "+a11[18]   %>
                                <br>
                                <% 
                                    if(!"null".equals(a11[16])&&!"".equals(a11[16])){out.println("Web:"+a11[16]);} 
                                %>
                                <% 
                                    if(!"null".equals(a11[19])&&!"".equals(a11[19])){out.println("Email:"+a11[19]);}
                                %> 
                                <br>
                                <%="GST:"+a11[15]   %>
                            </address>
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-5 invoice-col">
                            <div class="form-group">
                                <div class="col-sm-3">
                                    <b>Invoice</b> 
                                </div>
                                <div class="col-sm-8">
                                    <% 
                                        if("new".equals(type)){ 
                                    %>
                                    <strong>#<%=businessinvoiceno %></strong>
                                    <% }else{ %>
                                    <strong>#<%=a1[254] %></strong>
                                    <%  } %>
                                </div>
                            </div>
                            <br>  
                            <% 
                                String date="null";
                                date=(a1[2]);
                                date=date.substring(0,10); 
                                date=Character.toString(date.charAt(8))+Character.toString(date.charAt(9))+"/"+Character.toString(date.charAt(5))+Character.toString(date.charAt(6))+"/"+Character.toString(date.charAt(0))+Character.toString(date.charAt(1))+Character.toString(date.charAt(2))+Character.toString(date.charAt(3));
                            %>
                            <div class="form-group">
                                <div class="col-sm-3">
                                    <b>Invoice Date</b> 
                                </div>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="datepicker1"  name="invoicedate" 
                                           <%
                                               if("".equals(a1[5])||"null".equals(a1[5]) ){ 
                                           %>
                                           placeholder="<%=date %>" value="<%=date  %>" 
                                           <%  }
                                               else {
                                           %> 
                                           placeholder="<%=a1[5] %>" 
                                           value="<%=a1[5]  %>" <% }%>>
                                </div>
                            </div>
                            <br>
                            <br>
                            <div class="form-group">
                                <div class="col-sm-3">
                                    <b>Reverse Charge(Y/N) </b> 
                                </div>
                                <div class="col-sm-8">
                                    <select id="reversecharge" name="reversecharge" class="form-control" value="<%=(a1[6]) %>">
                                        <%if("".equals(a1[6])||"null".equals(a1[6]) ){ %> 
                                        <option value="No">No</option> 
                                        <% }else {%>   
                                        <option value="<%=(a1[6]) %>"><%=(a1[6]) %></option> 
                                        <% }%>                    
                                        <option value="Yes">Yes</option>
                                        <option value="Yes">No</option>
                                    </select>
                                </div>
                            </div>
                            <br>
                            <br>
                            <div class="form-group">
                                <div class="col-sm-3">
                                    <b>State</b> 
                                </div>
                                <div class="col-sm-8">
                                    <select id="state1" name="state1" class="form-control" value="<%=(a1[7]) %>">
                                        <%if("".equals(a1[7])||"null".equals(a1[7]) ){ %>
                                        <option value="Madhya Pradesh & Code=23">Madhya Pradesh</option>
                                        <% }else {%>  
                                        <option value="<%=(a1[7]) %>"><%=(a1[7]) %></option> 
                                        <% }%>                    
                                        <option value="Andaman and Nicobar Islands & Code=35">Andaman and Nicobar Islands</option>
                                        <option value="Andhra Pradesh & Code=28">Andhra Pradesh</option>
                                        <option value="Andhra Pradesh(New) & Code=37">Andhra Pradesh (New)</option>
                                        <option value="Arunachal Pradesh & Code=12">Arunachal Pradesh</option>
                                        <option value="Assam & Code=18">Assam</option>
                                        <option value="Bihar & Code=10">Bihar</option>
                                        <option value="Chandigarh & Code=04">Chandigarh</option>
                                        <option value="Chhattisgarh & Code=22">Chhattisgarh</option>
                                        <option value="Dadra and Nagar Haveli & Code=26">Dadra and Nagar Haveli</option>
                                        <option value="Daman and Diu & Code=25">Daman and Diu</option>
                                        <option value="Delhi & Code=07">Delhi</option>
                                        <option value="Goa & Code=30">Goa</option>
                                        <option value="Gujarat & Code=24">Gujarat</option>
                                        <option value="Haryana & Code=06">Haryana</option>
                                        <option value="Himachal Pradesh & Code=02">Himachal Pradesh</option>
                                        <option value="Jammu and Kashmir & Code=01">Jammu and Kashmir</option>
                                        <option value="Jharkhand & Code=20">Jharkhand</option>
                                        <option value="Karnataka & Code=29">Karnataka</option>
                                        <option value="Kerala & Code=32">Kerala</option>
                                        <option value="Lakshadweep & Code=31">Lakshadweep</option>
                                        <option value="Madhya Pradesh & Code=23">Madhya Pradesh</option>
                                        <option value="Maharashtra & Code=27">Maharashtra</option>
                                        <option value="Manipur & Code=14">Manipur</option>
                                        <option value="Meghalaya & Code=17">Meghalaya</option>
                                        <option value="Mizoram & Code=15">Mizoram</option>
                                        <option value="Nagaland & Code=13">Nagaland</option>
                                        <option value="Orissa & Code=21">Orissa</option>
                                        <option value="Pondicherry & Code=34">Pondicherry</option>
                                        <option value="Punjab & Code=03">Punjab</option>
                                        <option value="Rajasthan & Code=08">Rajasthan</option>
                                        <option value="Sikkim & Code=11">Sikkim</option>
                                        <option value="Tamil Nadu & Code=33">Tamil Nadu</option>
                                        <option value="Telangana & Code=36">Telangana</option>
                                        <option value="Tripura & Code=16">Tripura</option>
                                        <option value="Uttarakhand & Code=05">Uttarakhand</option>
                                        <option value="Uttar Pradesh & Code=09">Uttar Pradesh</option>
                                        <option value="West Bengal & Code=19">West Bengal</option>
                                    </select>
                                </div>
                            </div>
                            <br>
                            <br>  
                        </div>
                        <!-- /.col -->
                        <!-- /.col -->
                        <div class="col-sm-4 invoice-col">
                            <div class="form-group">
                                <div class="col-sm-4">
                                    <b>Transporter</b> 
                                </div>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="transporter" name="transporter" 
                                           <%
                                               if("".equals(a1[9])||"null".equals(a1[9]) ){ 
                                           %>
                                           placeholder="transporter" 
                                           <%  }
                                               else {
                                           %> 
                                           placeholder="<%=a1[9] %>" value="<%=a1[9]  %>" <% }%>>
                                </div>
                            </div>
                            <br>
                            <br>
                            <div class="form-group">
                                <div class="col-sm-4">
                                    <b>Vehicle No</b> </div>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="vehicleno" name="supplydate" 
                                           <%
                                               if("".equals(a1[10])||"null".equals(a1[10]) ){ 
                                           %>
                                           placeholder="Vehicle No" 
                                           <% }else {%> 
                                           placeholder="<%=a1[10] %>" value="<%=a1[10]  %>" 
                                           <% }%>>
                                </div>
                            </div>
                            <br><br>
                            <div class="form-group">
                                <div class="col-sm-4">
                                    <b>Date of Supply </b> </div>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="datepicker2" name="supplydate" 
                                           <%
                                               if("".equals(a1[11])||"null".equals(a1[11]) ){ 
                                           %>
                                           placeholder="<%=date %>" 
                                           value="<%=date  %>"
                                           <% }else {%> 
                                           placeholder="<%=a1[11] %>" 
                                           value="<%=date  %>" 
                                           <% }%>>
                                </div>
                            </div>
                            <br>
                            <br>
                            <div class="form-group">
                                <div class="col-sm-4">
                                    <b>Place of Supply</b> 
                                </div>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="supplyplace" name="supplyplace" 
                                           <%
                                               if("".equals(a1[12])||"null".equals(a1[12]) ){ 
                                           %>
                                            placeholder="Indore" 
                                            value="Indore" 
                                            <% }else {%> 
                                            placeholder="<%=a1[12] %>" value="<%=a1[12]  %>" 
                                            <% }%>>
                                </div>
                            </div>
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                    <!-- info row -->
                    <div class="row invoice-info">
                        <div class="col-sm-6 invoice-col" id="billingAddress">
                            <div class="box box-info"> 
                                <div class="box-header with-border">
                                    <h3 class="box-title">Bill of Party</h3>
                                </div>
                                <!-- /.box-header -->
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        <b>Name</b> 
                                    </div>
                                    <div class="col-sm-8">
                                        <% if("new".equals(type) ){ %>
                                           <input type="text" class="form-control" id="bname" name="bname" 
                                            <%
                                                if("".equals(newname)||"null".equals(newname) ){ 
                                            %>
                                            placeholder="Name" value="" 
                                            <% }else {%>
                                            placeholder="<%=newname %>"
                                            value="<%=newname  %>"
                                            <% }%>>
                                        <% }else {  %>
                                            <input type="text" class="form-control" id="bname" name="bname" 
                                            <%
                                                if("".equals(a1[13])||"null".equals(a1[13]) ){ 
                                            %>
                                            placeholder="Name" 
                                            value=""
                                            <% }else {%> 
                                            placeholder="<%=a1[13] %>" 
                                            value="<%=a1[13]  %>" 
                                            <% }%>>
                                        <% } %>
                                    </div>
                                </div>
                                <br>
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        <b>Address1</b> 
                                    </div>
                                    <div class="col-sm-8">
                                        <% if("new".equals(type) ){ %>
                                        <input type="text" class="form-control" id="baddress1" name="baddress1" <%if("".equals(newaddress1)||"null".equals(newaddress1) ){ %>placeholder="Address2" value="" <% }else {%> placeholder="<%=newaddress1 %>" value="<%=newaddress1  %>" <% }%>>
                                        <% }else {  %>
                                        <input type="text" class="form-control" id="baddress1" name="baddress1" <%if("".equals(a1[14])||"null".equals(a1[14]) ){ %>placeholder="Address" value="" <% }else {%> placeholder="<%=a1[14] %>" value="<%=a1[14]  %>" <% }%>>
                                        <% } %>
                                    </div>
                                </div>
                                <br>
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        <b> </b> 
                                    </div>
                                    <div class="col-sm-8">
                                        <% if("new".equals(type) ){ %>
                                        <input type="text" class="form-control" id="baddress2" name="baddress2" <%if("".equals(newaddress2)||"null".equals(newaddress2) ){ %>placeholder="Address2" value="" <% }else {%> placeholder="<%=newaddress2 %>" value="<%=newaddress2  %>" <% }%>>
                                        <% }else {  %>
                                        <input type="text" class="form-control" id="baddress2" name="baddress2" <%if("".equals(a1[15])||"null".equals(a1[15]) ){ %>placeholder="Address2" value="" <% }else {%> placeholder="<%=a1[15] %>" value="<%=a1[15]  %>" <% }%>>
                                        <% } %>
                                    </div>
                                </div>
                                <br>
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        <b></b>
                                    </div>
                                    <div class="col-sm-8">
                                        <% if("new".equals(type) ){ %>
                                        <input type="text" class="form-control" id="baddress3" name="baddress3" <%if("".equals(newaddress3)||"null".equals(newaddress3) ){ %>placeholder="Address3" value="" <% }else {%> placeholder="<%=newaddress3 %>" value="<%=newaddress3  %>" <% }%>>
                                        <% }else {  %>
                                        <input type="text" class="form-control" id="baddress3" name="baddress3" <%if("".equals(a1[16])||"null".equals(a1[16]) ){ %>placeholder="Address3" value="" <% }else {%> placeholder="<%=a1[16] %>" value="<%=a1[16]  %>" <% }%>>
                                        <% } %>
                                    </div>
                                </div>
                                <br>
                                <br>  
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        <b>Contact 1</b>
                                    </div>
                                    <div class="col-sm-8">
                                        <% if("new".equals(type) ){ %>
                                        <input type="text" class="form-control" id="bcontact1" name="bcontact1" <%if("".equals(newcontact1)||"null".equals(newcontact1) ){ %>placeholder="Contact" value="" <% }else {%> placeholder="<%=newcontact1 %>" value="<%=newcontact1  %>" <% }%>>
                                        <% }else {  %>
                                        <input type="text" class="form-control" id="bcontact1" name="bcontact1" <%if("".equals(a1[17])||"null".equals(a1[17]) ){ %>placeholder="Contact" value="" <% }else {%> placeholder="<%=a1[17] %>" value="<%=a1[17]  %>" <% }%>>
                                        <% } %>
                                    </div>
                                </div>
                                <br>
                                <br>  
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        <b>Contact 2</b> 
                                    </div>
                                    <div class="col-sm-8">
                                        <% if("new".equals(type) ){ %>
                                        <input type="text" class="form-control" id="bcontact2" name="bcontact2" <%if("".equals(newcontact2)||"null".equals(newcontact2) ){ %>placeholder="Contact" value="" <% }else {%> placeholder="<%=newcontact2%>" value="<%=newcontact2  %>" <% }%>>
                                        <% }else {  %>
                                        <input type="text" class="form-control" id="bcontact2" name="bcontact2" <%if("".equals(a1[18])||"null".equals(a1[18]) ){ %>placeholder="Contact" value="" <% }else {%> placeholder="<%=a1[18] %>" value="<%=a1[18]  %>" <% }%>>
                                        <% } %>
                                    </div>
                                </div>
                                <br>
                                <br> 
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        <b>District</b> </div>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="bdistt" name="bdistt" <%if("".equals(a1[20])||"null".equals(a1[20]) ){ %>placeholder="District" <% }else {%> placeholder="<%=a1[20] %>" value="<%=a1[20]  %>" <% }%>>
                                    </div>
                                </div>
                                <br><br>  <div class="form-group">
                                    <div class="col-sm-4">
                                        <b>GSTIN</b> </div>
                                    <div class="col-sm-8">
                                        <% if("new".equals(type) ){ %>
                                        <input type="text" class="form-control" id="bgstin" name="bgstin" <%if("".equals(newgstn)||"null".equals(newgstn) ){ %>placeholder="GST" value="" <% }else {%> placeholder="<%=newgstn%>" value="<%=newgstn  %>" <% }%>>
                                        <% }else {  %>
                                        <input type="text" class="form-control" id="bgstin" name="bgstin" <%if("".equals(a1[23])||"null".equals(a1[23]) ){ %>placeholder="GST" value="" <% }else {%> placeholder="<%=a1[23] %>" value="<%=a1[23]  %>" <% }%>>
                                        <% } %>
                                    </div>
                                </div>
                                <br>
                                <br>  
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        <b>State</b> 
                                    </div>
                                    <div class="col-sm-8">
                                        <select id="bstate" name="bstate" class="form-control" value="<%=(a1[21]) %>">
                                            <%if("".equals(a1[21])||"null".equals(a1[21]) ){ %> 
                                            <option value="<%=newstate  %>"><%=newstate %></option>
                                            <% }else {%>   
                                            <option value="<%=(a1[21]) %>"><%=(a1[21]) %></option> <% }%>                    
                                            <option value="Andaman and Nicobar Islands & Code=35">Andaman and Nicobar Islands</option>
                                            <option value="Andhra Pradesh & Code=28">Andhra Pradesh</option>
                                            <option value="Andhra Pradesh(New) & Code=37">Andhra Pradesh (New)</option>
                                            <option value="Arunachal Pradesh & Code=12">Arunachal Pradesh</option>
                                            <option value="Assam & Code=18">Assam</option>
                                            <option value="Bihar & Code=10">Bihar</option>
                                            <option value="Chandigarh & Code=04">Chandigarh</option>
                                            <option value="Chhattisgarh & Code=22">Chhattisgarh</option>
                                            <option value="Dadra and Nagar Haveli & Code=26">Dadra and Nagar Haveli</option>
                                            <option value="Daman and Diu & Code=25">Daman and Diu</option>
                                            <option value="Delhi & Code=07">Delhi</option>
                                            <option value="Goa & Code=30">Goa</option>
                                            <option value="Gujarat & Code=24">Gujarat</option>
                                            <option value="Haryana & Code=06">Haryana</option>
                                            <option value="Himachal Pradesh & Code=02">Himachal Pradesh</option>
                                            <option value="Jammu and Kashmir & Code=01">Jammu and Kashmir</option>
                                            <option value="Jharkhand & Code=20">Jharkhand</option>
                                            <option value="Karnataka & Code=29">Karnataka</option>
                                            <option value="Kerala & Code=32">Kerala</option>
                                            <option value="Lakshadweep & Code=31">Lakshadweep</option>
                                            <option value="Madhya Pradesh & Code=23">Madhya Pradesh</option>
                                            <option value="Maharashtra & Code=27">Maharashtra</option>
                                            <option value="Manipur & Code=14">Manipur</option>
                                            <option value="Meghalaya & Code=17">Meghalaya</option>
                                            <option value="Mizoram & Code=15">Mizoram</option>
                                            <option value="Nagaland & Code=13">Nagaland</option>
                                            <option value="Orissa & Code=21">Orissa</option>
                                            <option value="Pondicherry & Code=34">Pondicherry</option>
                                            <option value="Punjab & Code=03">Punjab</option>
                                            <option value="Rajasthan & Code=08">Rajasthan</option>
                                            <option value="Sikkim & Code=11">Sikkim</option>
                                            <option value="Tamil Nadu & Code=33">Tamil Nadu</option>
                                            <option value="Telangana & Code=36">Telangana</option>
                                            <option value="Tripura & Code=16">Tripura</option>
                                            <option value="Uttarakhand & Code=05">Uttarakhand</option>
                                            <option value="Uttar Pradesh & Code=09">Uttar Pradesh</option>
                                            <option value="West Bengal & Code=19">West Bengal</option>
                                        </select>
                                    </div>
                                </div>
                            </div> <!-- /.box info -->
                        </div>
                        <!-- /.col -->
                        <!-- /.col -->
                        <div class="col-sm-6 invoice-col" id="deliveryAddress">
                            <div class="box box-info"> 
                                <div class="box-header with-border">
                                    <h3 class="box-title">Ship to Party</h3>
                                    <h6 class="box-title pull-right"><input type="checkbox" id="sameAddr" name="sabop" value="true"> Same As BOP</h6>
                                </div>
                                <!-- /.box-header -->
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        <b>Name</b>
                                    </div>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="sname" name="sname" <%if("".equals(a1[25])||"null".equals(a1[25]) ){ %>placeholder="Name" <% }else {%> placeholder="<%=a1[25] %>" value="<%=a1[25]  %>" <% }%>>
                                    </div>
                                </div>
                                <br>
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        <b>Address 1</b> 
                                    </div>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="saddress1" name="saddress1" <%if("".equals(a1[26])||"null".equals(a1[26]) ){ %>placeholder="Address1" <% }else {%> placeholder="<%=a1[26] %>" value="<%=a1[26]  %>" <% }%>>
                                    </div>
                                </div>
                                <br>
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        <b> </b> 
                                    </div>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="saddress2" name="saddress2" <%if("".equals(a1[27])||"null".equals(a1[27]) ){ %>placeholder="Address2" <% }else {%> placeholder="<%=a1[27] %>" value="<%=a1[27]  %>" <% }%>>
                                    </div>
                                </div>
                                <br>
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        <b></b> 
                                    </div>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="saddress3" name="saddress3" <%if("".equals(a1[28])||"null".equals(a1[28]) ){ %>placeholder="Address3" <% }else {%> placeholder="<%=a1[28] %>" value="<%=a1[28]  %>" <% }%>>
                                    </div>
                                </div>
                                <br>
                                <br>  
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        <b>contact 1</b> 
                                    </div>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="scontact1" name="scontact1" <%if("".equals(a1[29])||"null".equals(a1[29]) ){ %>placeholder="Contact1" <% }else {%> placeholder="<%=a1[29] %>" value="<%=a1[29]  %>" <% }%>>
                                    </div>
                                </div>
                                <br>
                                <br>  
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        <b>Contact</b> 
                                    </div>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="scontact2" name="scontact2" <%if("".equals(a1[30])||"null".equals(a1[30]) ){ %>placeholder="Contact2" <% }else {%> placeholder="<%=a1[30] %>" value="<%=a1[30]  %>" <% }%>>
                                    </div>
                                </div>
                                <br>
                                <br>  
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        <b>District</b>
                                    </div>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="sdistt" name="sdistt" <%if("".equals(a1[32])||"null".equals(a1[32]) ){ %>placeholder="District" <% }else {%> placeholder="<%=a1[32] %>" value="<%=a1[32]  %>" <% }%>>
                                    </div>
                                </div>
                                <br>
                                <br> 
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        <b>GSTIN</b> 
                                    </div>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="sgstin"  name="sgstin" <%if("".equals(a1[35])||"null".equals(a1[35]) ){ %>placeholder="GST NO" <% }else {%> placeholder="<%=a1[35] %>" value="<%=a1[35]  %>" <% }%>>
                                    </div>
                                </div>
                                <br>
                                <br>
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        <b>State</b>
                                    </div>
                                    <div class="col-sm-8">
                                        <select id="sstate" name="sstate" class="form-control" value="<%=(a1[33]) %>">
                                            <%if("".equals(a1[33])||"null".equals(a1[33]) ){ %>
                                            <option value="Madhya Pradesh & Code=23">Madhya Pradesh</option> 
                                            <% }else {%>   
                                            <option value="<%=(a1[33]) %>"><%=(a1[33]) %></option> 
                                            <% }%>                    
                                            <option value="Andaman and Nicobar Islands & Code=35">Andaman and Nicobar Islands</option>
                                            <option value="Andhra Pradesh & Code=28">Andhra Pradesh</option>
                                            <option value="Andhra Pradesh(New) & Code=37">Andhra Pradesh (New)</option>
                                            <option value="Arunachal Pradesh & Code=12">Arunachal Pradesh</option>
                                            <option value="Assam & Code=18">Assam</option>
                                            <option value="Bihar & Code=10">Bihar</option>
                                            <option value="Chandigarh & Code=04">Chandigarh</option>
                                            <option value="Chhattisgarh & Code=22">Chhattisgarh</option>
                                            <option value="Dadra and Nagar Haveli & Code=26">Dadra and Nagar Haveli</option>
                                            <option value="Daman and Diu & Code=25">Daman and Diu</option>
                                            <option value="Delhi & Code=07">Delhi</option>
                                            <option value="Goa & Code=30">Goa</option>
                                            <option value="Gujarat & Code=24">Gujarat</option>
                                            <option value="Haryana & Code=06">Haryana</option>
                                            <option value="Himachal Pradesh & Code=02">Himachal Pradesh</option>
                                            <option value="Jammu and Kashmir & Code=01">Jammu and Kashmir</option>
                                            <option value="Jharkhand & Code=20">Jharkhand</option>
                                            <option value="Karnataka & Code=29">Karnataka</option>
                                            <option value="Kerala & Code=32">Kerala</option>
                                            <option value="Lakshadweep & Code=31">Lakshadweep</option>
                                            <option value="Madhya Pradesh & Code=23">Madhya Pradesh</option>
                                            <option value="Maharashtra & Code=27">Maharashtra</option>
                                            <option value="Manipur & Code=14">Manipur</option>
                                            <option value="Meghalaya & Code=17">Meghalaya</option>
                                            <option value="Mizoram & Code=15">Mizoram</option>
                                            <option value="Nagaland & Code=13">Nagaland</option>
                                            <option value="Orissa & Code=21">Orissa</option>
                                            <option value="Pondicherry & Code=34">Pondicherry</option>
                                            <option value="Punjab & Code=03">Punjab</option>
                                            <option value="Rajasthan & Code=08">Rajasthan</option>
                                            <option value="Sikkim & Code=11">Sikkim</option>
                                            <option value="Tamil Nadu & Code=33">Tamil Nadu</option>
                                            <option value="Telangana & Code=36">Telangana</option>
                                            <option value="Tripura & Code=16">Tripura</option>
                                            <option value="Uttarakhand & Code=05">Uttarakhand</option>
                                            <option value="Uttar Pradesh & Code=09">Uttar Pradesh</option>
                                            <option value="West Bengal & Code=19">West Bengal</option>
                                        </select>
                                    </div>
                                </div>
                            </div><!-- /.boxinfo -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                    <br>
                    <br>
                    <br>
                    <div class="row">
                        <div class="box-header with-border">
                            <h3 class="box-title">Add Product Billing</h3>
                        </div>
                        <div class="col-xs-12 table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <td>Sn</td>
                                        <td>Product</td>
                                        <td>#Code</td>
                                        <td>Qty</td>
                                        <td>Rate</td>
                                        <td>Unit</td>
                                        <td>Amount</td>
                                        <td>Delete</td>
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
                                        <td>   
                                           
                                            <a href="invoicedeleteproduct.jsp?incid=<%=invoiceid %>&type=trsh&sn=<%=a1[jj]  %>&max=<%=iiil  %>&pro=<%=a1[jj+1]  %>&cod=<%=a1[jj+2]  %>&qt=<%=a1[jj+3]  %>&rate=<%=a1[jj+4]  %>&amt<%=a1[jj+6]  %>=#sn" > <i class="fa fa-trash-o"></i> </a>
                                        </td>               
                                    </tr>
                                    <% jj=jj+7; } %>
                                    <%
                                    int i=0;
                                    int j=0; 
                                    String count2="0";
                                    try{ 
                                        Connection con=Poul.getConnectionCRM();
                                        PreparedStatement smt=con.prepareStatement("select count(*) from stock where useradminid=? ");
                                        smt.setString(1,usercid_adminid );
                                        ResultSet rs=smt.executeQuery();
                                        while(rs.next()){  count2=rs.getString(1);  }
                                        rs.close();
                                        smt.close();
                                        con.close();     
                                    } 
                                    catch(Exception e)
                                    { 
                                        String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoice.jsp-----\n"
     + "LINE=1019 + \nselect count(*) from stock where useradminid="+usercid_adminid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
                                    }
                                    int n2=Integer.parseInt(count2);
                                    String taskdata2[][]=new String[n2+1][55];
                                    try{ 
                                        Connection con=Poul.getConnectionCRM();
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
                                        con.close();     
                                    } 
                                    catch(Exception e)
                                    {
                                         String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoice10.jsp-----\n"
     + "LINE=1046 + \n select * from stock where useradminid="+usercid_adminid+" ";
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
                                                <% 
                                                    for(i=1;i<=n2;++i){ 
                                                        pronamevalue=taskdata2[i][2]+" HSN="+taskdata2[i][5] ; 
                                                %>
                                                <option value="<%=taskdata2[i][1]+":"+taskdata2[i][2]+":"+taskdata2[i][5]+":"+taskdata2[i][6]+":"+taskdata2[i][7]  %>"><% out.println(taskdata2[i][2]+" ,In-Stock:"+taskdata2[i][3]);  %></option>
                                                <% }  %>
                                            </select>
                                        </td>
                                        <td>    
                                            <input type="text" class="form-control" id="hsncode" name="hsncode"  placeholder="Code">
                                        </td>
                                        <td> 
                                            <input type="number" class="form-control" id="qty" name="qty"  placeholder="1" value="1">       </td>
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
                                           
                                            <button class="btn btn-sm btn-info btn-flat pull-right"onClick="return validateForm()"  type="submit" <%if(cfinal==1 && c1==1){%>disabled<%}%>>Add Product-</button>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                        <!-- /.col -->
                    </div>
                    <br>
                    <br>
                    <br>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="box box-info">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Calculated Amount:</h3>
                                </div>
                            </div>
                            <!-- /.box -->
                        </div>
                        <!--/.col (left) -->
                    </div> <!--/.row  -->
                    <%  
                                    j=71;
                                    String inpro[]=new String[256];
                                    for( i=1;i<=iiil;i++){                                 
                                    j=j+7; } 
                    %>
                    <div class="row">
                        <!-- accepted payments column -->
                        <div class="col-xs-4">
                            <div class="table-responsive">
                                <table class="table">
                                    <tr>
                                        <th>PF
                                            <input type="text" class="form-control" id="pf" name="pf" placeholder="<%=a1[41] %>" value="<%=a1[41] %>">
                                        </th>
                                        <td><%if("".equals(a1[42])||"null".equals(a1[42]) ){ %>00.00 <% }else {%> <%=a1[42]  %> <% }%></td>
                                    </tr>
                                    <tr>
                                        <th><p>Add: CGST-</p>
                                            <input type="text" class="form-control" id="cgst"name="cgst" placeholder="<%=a1[43] %>" value="<%=a1[43] %>">
                                        </th>
                                        <td><%if("".equals(a1[44])||"null".equals(a1[44]) ){ %>00.00 <% }else {%> <%=a1[44]  %> <% }%></td>
                                    </tr>
                                    <tr>
                                        <th>Add: SGST-
                                            <input type="text" class="form-control" id="sgst" name="sgst" placeholder="<%=a1[45] %>" value="<%=a1[45] %>">
                                        </th>
                                        <td><%if("".equals(a1[46])||"null".equals(a1[46]) ){ %>00.00 <% }else {%> <%=a1[46]  %> <% }%></td>
                                    </tr>
                                    <tr>
                                        <th>Add: IGST-
                                            <input type="text" class="form-control" id="igst" name="igst" placeholder="<%=a1[47] %>" value="<%=a1[47] %>">
                                        </th>
                                        <td><%if("".equals(a1[48])||"null".equals(a1[48]) ){ %>00.00 <% }else {%> <%=a1[48]  %> <% }%></td>
                                    </tr>
                                    <tr>
                                </table>
                            </div>
                        </div>
                        <!-- /.col -->
                        <div class="col-xs-4"></div>
                        <div class="col-xs-4">
                            <div class="table-responsive">
                                <table class="table">
                                    <tr>
                                        <th style="width:50%">Total Amount</th>
                                        <td><%if("".equals(a1[37])||"null".equals(a1[37]) ){ %><i class="fa fa-fw fa-rupee"></i> 00.00 <input type="hidden" name="producttotal" value="0.00"> <% }else {%> <i class="fa fa-fw fa-rupee"></i><%=a1[37]  %> <input type="hidden" name="producttotal" value="<%=a1[37]  %>"> <% }%></td>
                                    </tr> 
                                    <tr>
                                    <th>Total Amount(GST)
                                    </th>
                                    <td><strong><%if("".equals(a1[51])||"null".equals(a1[51]) ){ %><i class="fa fa-fw fa-rupee"></i>00.00  <input type="hidden" name="totalamount" value="00.00"><% }else {%> <i class="fa fa-fw fa-rupee"></i><%=a1[51]  %>  <input type="hidden" name="totalamount" value="<%=a1[51]  %>"><% }%></strong></td>
                                    </tr>
                                    <tr>
                                        <th>Freight Charges                         
                                        </th>
                                        <td> 
                                            <input type="text" class="form-control" id="discount" name="discount" placeholder="<%=a1[52] %>" value="<%=a1[52] %>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Net Amount:</th>
                                        <td><strong><%if("".equals(a1[54])||"null".equals(a1[54]) ){ %><i class="fa fa-fw fa-rupee"></i> 00.00 <input type="hidden" name="netamount" value="00.00"> <% }else {%><i class="fa fa-fw fa-rupee"></i> <%=a1[54]  %> <input type="hidden" name="netamount" value="<%=a1[54]  %>"> <% }%></strong></td>
                                    </tr>
                                    <tr>
                                        <th style="width:50%">Total Amount(in Words)</th>  
                                        <td><%if("".equals(a1[58])||"null".equals(a1[58]) ){ out.print(a1[57]); }else {out.print(a1[57]); }%> Only</td>

                                        <!--  +" And "+a1[58]+ " Paise" 
                                        
                                        
                                        -->
                                    </tr>

                                </table>
                            </div>
                        </div>



                    </div>
                    <!-- /.row -->
                    <div class="row">

                        <div class="col-md-4">
                            <div class="box box-solid">
                                <div class="box-header with-border">
                                    <i class="fa fa-text-width"></i>

                                    <h3 class="box-title"><%=a11[31]   %></h3>
                                </div>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <ol>

                                        <li><%=a11[32]   %></li>
                                        <li><%=a11[33]   %></li>
                                        <li><%=a11[34]   %></li>
                                        <li><%=a11[35]   %></li>

                                    </ol>
                                </div>
                                <!-- /.box-body -->
                            </div>
                            <!-- /.box -->
                        </div>
                        <!-- ./col -->
                        <div class="col-md-4">
                            <div class="box box-solid">
                                <div class="box-header with-border">
                                    <i class="fa fa-text-width"></i>

                                    <h3 class="box-title">Note</h3>
                                </div>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <ul class="list-unstyled">
                                        <li><%=a11[37]   %></li>

                                    </ul>
                                </div>
                                <!-- /.box-body -->
                            </div>
                                        
                            <!-- /.box -->
                        </div>
                                        <div class="col-md-4">
                            <div class="box box-solid">
                                <div class="box-header with-border">
                                    <i class="fa fa-text-width"></i>

                                    <h3 class="box-title">Bank Details</h3>
                                </div>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <ul class="list-unstyled">
                                        <li><%=a11[39]   %></li>
                                        <li><%=a11[40]   %></li>
                                        <li><%=a11[41]   %></li>
                                        <li><%=a11[42]   %></li>
                                    </ul>
                                </div>
                                <!-- /.box-body -->
                            </div>
                                        
                            <!-- /.box -->
                        </div>
                        <!-- ./col -->
                    </div>
                    <!-- /.row -->

                    <input type="hidden" name="down" value="true">
                    
                </section>
            </form> 
            
                <section class="invoice">
                    <div class="row">
                        <div class="box-header bg-aqua">
                            <h3 class="box-title">Cash Memo</h3>

                        </div>
              
                        <div class="box" id="cashmemo">
                        
                        <form action="invoicecashmemo.jsp" method="post" >
                            <div class="row invoice-info">


                                <br><br>
                                <div class="col-sm-6 invoice-col">

                                    <div class="form-group">
                                        <div class="col-sm-4">
                                            <b> Depositor Name</b> </div>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="dn" name="depositorname" <%if("".equals(a1[13])||"null".equals(a1[13]) ){ %>placeholder=" Name" <% }else {%> placeholder="<%=a1[13] %>" value="<%=a1[13]  %>" <% }%>>

                                        </div>
                                    </div><br><br>
                                    <div class="form-group">
                                        <div class="col-sm-4">
                                            <b>Amount Received</b> </div>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="ar" pattern="[0-9]{0-100}" name="amtreceived" placeholder="Amount " autocomplete="off" > 

                                        </div>
                                    </div>

                                    <br><br>
                                    <div class="form-group">
                                        <div class="col-sm-4">
                                            <b>Mode of Payment</b> </div>
                                        <div class="col-sm-8">
                                            <select   class="form-control" id="description" name="mop" >
                                                <option  value="Cash Payment" >Cash Payment</option>
                                                <option  value="Cheque">Cheque</option>
                                                <option  value="Bank Draft">Bank Draft</option>
                                                <option  value="Online Bank Transfer">Online Bank Transfer</option>
                                                <option  value="Other">Other</option>

                                            </select>
                                        </div>
                                    </div>
                                    <br><br>
                                    <div class="form-group">
                                        <div class="col-sm-4">
                                            <b> Payment Reference</b> </div>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="pr" name="payref" placeholder="Reference No" autocomplete="off">

                                        </div>
                                    </div>
                                    <br>  <br>
                                    <div class="box-footer clearfix">
                                        <input type="hidden" name="type" value="cashreceipt">
                                        <input type="hidden" name="incid" value="<%=invoiceid %>">
                                        <input type="hidden" name="contact" value="<%=a1[59] %>">
                                        <input type="hidden" name="bino" value="<%=a1[254] %>">

                                        <%if("".equals(a1[63])||"null".equals(a1[63]) ){ %><input type="hidden" name="dueamount" value="<%=a1[54] %>"> <% }else {%> <input type="hidden" name="dueamount" value="<%=a1[63] %>"> <% }%>


                                        <input type="hidden" name="owner" value="<%=owner %>">
                                        <button class="btn btn-sm btn-info btn-flat pull-right" onclick="return validateform1()" type="submit">Submit</button>
                                    </div>

                                </div>
                                <!-- /.col -->

                                <div class="col-xs-6">


                                    <div class="table-responsive">
                                        <table class="table">

                                            <tr>
                                                <th style="width:50%">Due Amount</th>
                                                <td><%if("".equals(a1[63])||"null".equals(a1[63]) ){ %><i class="fa fa-fw fa-rupee"></i> <%=a1[54]  %> <input type="hidden" name="producttotal" value="0.00"> <% }else {%> <i class="fa fa-fw fa-rupee"></i><%=a1[63]  %> <input type="hidden" name="producttotal" value="<%=a1[63]  %>"> <% }%></td>

                                            </tr> <tr>
                                                <th> Notes</th>
                                                <td>  <input type="text" class="form-control" id="notes" name="notes" placeholder="Add Deposit Notes" >
</td>

                                            </tr>
                                            <tr>
                                                <th> 



                                                </th>
                                                <td></td>

                                            </tr>

                                            <tr>

                                            </tr>
                                            <tr>


                                            </tr>

                                        </table>
                                    </div>

                                </div>

                            </div>
                                                <!-- /.row --> 
                        </form>
                        </div>
                    </div>
                </section>
           <%
                        String count123="0";
         
                        try{
           
                         Connection con=Poul.getConnectionCRM();
                         PreparedStatement smt=con.prepareStatement("select count(*) from paymentinfo where invoiceid=?");
                         smt.setString(1,invoiceid);
                         ResultSet rs=smt.executeQuery();
       
                         while(rs.next()){
                             count123=rs.getString(1);
                         } 
         
        
                     rs.close();
                            smt.close();
                            con.close();   }
                         catch(Exception e)
                         {
                               String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoice.jsp-----\n"
     + "LINE=1432 + \n select count(*) from paymentinfo where invoiceid="+invoiceid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);  
                                 }
                        int ij = Integer.parseInt(count123 );  
                         String leaddata[][]=new String[ij+1][499];
                         int k=1; i=1; 
                        try{
           
                         Connection con=Poul.getConnectionCRM();
                         PreparedStatement smt=con.prepareStatement("select * from paymentinfo where invoiceid=?");
                         smt.setString(1,invoiceid);
                         ResultSet rs=smt.executeQuery();
       
                         while(rs.next()){
         
                         for(i=1;i<=50;i++){
                         leaddata[k][i]=rs.getString(i);
                         }
                          k++; 
                         } 
         
        
                    rs.close();
                            smt.close();
                            con.close();    }
                         catch(Exception e)
                         {
                          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoice.jsp-----\n"
     + "LINE=1461 + \n select * from paymentinfo where invoiceid="+invoiceid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);        
                                 } 
      
                        //System.out.println(al.size());
                            %>
                <section class="invoice">
                    <div class="row">
                    <div class="row" id="depositrecord">
                        <div class="col-xs-12">


                            <div class="box">
                                <div class="box-header bg-yellow">
                                    <h3 class="box-title">Deposit Record</h3>
                                </div>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <table id="example7" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Date   </th>
                                             
                                                <th>Depositor</th>
                                                <th>  Amount Received</th>
                                                <th> Mode of Payment</th>
                                                <th> Due Amount</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% int  m=0; for(m=ij;m>0;m--) {   %>
                                            <tr>
                                                <td><% out.print(leaddata[m][2]); %></a></td>
                                                
                                                <td><% out.print(leaddata[m][7]); %></td>
                                                <td><% out.print(leaddata[m][8]); %></td>

                                                <td><% out.print(leaddata[m][10]); %></td>
                                                <td><% out.print(leaddata[m][12]); %></td>
                                                <td>
                                                    <button class="btn bg-transparent" data-modal1-target="#modal1">Details</button>
                                                    <div class="modal1" id="modal1">
                                                      <div class="modal1-header">
                                                        <div class="title">Notes</div>
                                                        <button data-close-button class="close-button">&times;</button>
                                                      </div>
                                                      <div class="modal1-body">
                                                          <table>
                                                              <tbody>
                                                                  <tr>
                                                                      <td>Depositor Name </td>
                                                                      <td>:- <% out.print(leaddata[m][7]); %></td>
                                                                  </tr>
                                                                  <tr>
                                                                      <td>Amount Received </td>
                                                                      <td>:- <% out.print(leaddata[m][8]); %></td>
                                                                  </tr>
                                                                  <tr>
                                                                      <td>Mode of Payment </td>
                                                                      <td>:- <% out.print(leaddata[m][10]); %></td>
                                                                  </tr>
                                                                  <tr>
                                                                      <td>Notes </td>
                                                                      <td>:- <% out.print(leaddata[m][14]); %></td>
                                                                  </tr>
                                                                  
                                                              </tbody>
                                                          </table>
                                                          
                                                      </div>
                                                    </div>
                                                    <div id="overlay"></div>
                                                    
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
                    </div>
                </section>
                    <!-- /.row -->   

                                            
                <section class="content"></section>
                <!-- /.content -->
            </div>
                                            
            <!-- /.content-wrapper -->
            <jsp:include page="dist/include/footer.jsp" />

            <%  Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   --Leaving Invoicef10.jsp---  ---");
 
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
                                                    'paging': true,
                                                    'lengthChange': false,
                                                    'searching': false,
                                                    'ordering': true,
                                                    'info': true,
                                                    'autoWidth': false
                                                })
                                            })
        </script>
        <script>
  (          function(){

  function copyBillingAddress() 
  {
      var billingInputElements = document.querySelectorAll("#billingAddress input");
      var deliveryInputElements = document.querySelectorAll("#deliveryAddress input");
      if (document.getElementById("sameAddr").checked) 
      {
        for (var i = 0; i < billingInputElements.length; i++) 
        {
          deliveryInputElements[i + 1].value = billingInputElements[i].value;
        } 
        document.querySelector("#deliveryAddress select").value = document.querySelector("#billingAddress select").value;
      }else 
      {
        for (var i = 0; i < billingInputElements.length; i++) 
        {
          deliveryInputElements[i + 1].value = "";
        }
        document.querySelector("#deliveryAddress select").selectedIndex = -1;
      }
  }

  document.getElementById("sameAddr").addEventListener('change', 
    function()
    {
      copyBillingAddress();
    }
  );
})();
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
            function validateForm() {
                if (document.getElementById("transporter").value != "") {
                    if (!document.getElementById("transporter").value.match(/^[0-9 a-z.A-Z]+$/)) {
                        document.getElementById("alert-message").innerHTML = "Transporter: Only alphanumeric allowed";
                        $('#show-alert').modal('show')

                        document.getElementById("transporter").focus();
                        return false;
                    } else
                    if (document.getElementById("transporter").value.length > 30) {
                        document.getElementById("alert-message").innerHTML = "Transporter: Only 30 Characters allowed";
                        $('#show-alert').modal('show')


                        document.getElementById("transporter").focus();

                        return false;
                    }
                }

                if (document.getElementById("vehicleno").value != "") {

                    if (!document.getElementById("vehicleno").value.match(/^[0-9 a-z.A-Z]+$/)) {
                        document.getElementById("alert-message").innerHTML = "Vehicle No: Only alphanumeric allowed";
                        $('#show-alert').modal('show')

                        //alert("Only alphanumeric allowed");
                        document.getElementById("vehicleno").focus();
                        return false;
                    } else
                    if (document.getElementById("vehicleno").value.length > 30) {
                        document.getElementById("alert-message").innerHTML = "Vehicle No: Only 30 Characters allowed";
                        $('#show-alert').modal('show')


                        document.getElementById("vehicleno").focus();

                        return false;
                    }
                }

                if (document.getElementById("supplyplace").value != "") {

                    if (!document.getElementById("supplyplace").value.match(/^[0-9 a-z.A-Z]+$/)) {
                        document.getElementById("alert-message").innerHTML = "Place of Supply: Only alphanumeric allowed";
                        $('#show-alert').modal('show')

                        //alert("Only alphanumeric allowed");
                        document.getElementById("supplyplace").focus();
                        return false;
                    } else
                    if (document.getElementById("supplyplace").value.length > 30) {
                        document.getElementById("alert-message").innerHTML = "Place of Supply: Only 30 Characters allowed";
                        $('#show-alert').modal('show')


                        document.getElementById("supplyplace").focus();

                        return false;
                    }
                }

                if (document.getElementById("bname").value != "") {

                    if (!document.getElementById("bname").value.match(/^[0-9 a-z.A-Z]+$/)) {
                        document.getElementById("alert-message").innerHTML = "Bill of Party  <br >Name: Only alphanumeric allowed";
                        $('#show-alert').modal('show')

                        //alert("Only alphanumeric allowed");
                        document.getElementById("bname").focus();
                        return false;
                    } else
                    if (document.getElementById("bname").value.length > 30) {
                        document.getElementById("alert-message").innerHTML = " Bill of Party  <br>Name: Only 30 Characters allowed";
                        $('#show-alert').modal('show')


                        document.getElementById("bname").focus();

                        return false;
                    }
                }

                if (document.getElementById("baddress1").value != "") {

                    if (!document.getElementById("baddress1").value.match(/^[0-9 , : a-z.A-Z]+$/)) {
                        document.getElementById("alert-message").innerHTML = "Bill of Party  <br >Address1: Only alphanumeric allowed";
                        $('#show-alert').modal('show')

                        //alert("Only alphanumeric allowed");
                        document.getElementById("baddress1").focus();
                        return false;
                    } else
                    if (document.getElementById("baddress1").value.length > 100) {
                        document.getElementById("alert-message").innerHTML = "Bill of Party  <br >Address1: Only 30 Characters allowed";
                        $('#show-alert').modal('show')


                        document.getElementById("baddress1").focus();

                        return false;
                    }
                }

                if (document.getElementById("baddress2").value != "") {

                    if (!document.getElementById("baddress2").value.match(/^[0-9 , : a-z.A-Z]+$/)) {
                        document.getElementById("alert-message").innerHTML = "Bill of Party  <br >Address2: Only alphanumeric allowed";
                        $('#show-alert').modal('show')

                        //alert("Only alphanumeric allowed");
                        document.getElementById("baddress2").focus();
                        return false;
                    } else
                    if (document.getElementById("baddress2").value.length > 100) {
                        document.getElementById("alert-message").innerHTML = "Bill of Party  <br >Address2: Only 30 Characters allowed";
                        $('#show-alert').modal('show')


                        document.getElementById("baddress2").focus();

                        return false;
                    }
                }

                if (document.getElementById("baddress3").value != "") {

                    if (!document.getElementById("baddress3").value.match(/^[0-9 , : a-z.A-Z]+$/)) {
                        document.getElementById("alert-message").innerHTML = "Bill of Party <br >Address3: Only alphanumeric allowed";
                        $('#show-alert').modal('show')

                        //alert("Only alphanumeric allowed");
                        document.getElementById("baddress3").focus();
                        return false;
                    } else
                    if (document.getElementById("baddress3").value.length > 100) {
                        document.getElementById("alert-message").innerHTML = "Bill of Party <br >Address3: Only 30 Characters allowed";
                        $('#show-alert').modal('show')


                        document.getElementById("baddress3").focus();

                        return false;
                    }
                }

                if (document.getElementById("bcontact1").value != "") {

                    if (!document.getElementById("bcontact1").value.match(/^[0-9]+$/)) {
                        document.getElementById("alert-message").innerHTML = " Bill of Party  <br >Contact1 :Only numbers allowed ";
                        $('#show-alert').modal('show')

                        document.getElementById("bcontact1").focus();
                        return false;
                    }
                    if (document.getElementById("bcontact1").value.length > 10) {
                        document.getElementById("alert-message").innerHTML = "Bill of Party  <br > Contact1 :Only 10 digits allowed ";
                        $('#show-alert').modal('show')

                        document.getElementById("bcontact1").focus();

                        return false;
                    }
                    if (document.getElementById("bcontact1").value.length < 10) {
                        document.getElementById("alert-message").innerHTML = "Bill of Party  <br > Contact1 :Only 10 digits allowed  ";
                        $('#show-alert').modal('show')

                        document.getElementById("bcontact1").focus();

                        return false;
                    }
                }

                if (document.getElementById("bcontact2").value != "") {

                    if (!document.getElementById("bcontact2").value.match(/^[0-9]+$/)) {
                        document.getElementById("alert-message").innerHTML = "Bill of Party  <br > Contact2 :Only numbers allowed ";
                        $('#show-alert').modal('show')


                        document.getElementById("bcontact2").focus();
                        return false;
                    }
                    if (document.getElementById("bcontact2").value.length > 10) {
                        document.getElementById("alert-message").innerHTML = "Bill of Party  <br > Contact2 :Only 10 digits allowed ";
                        $('#show-alert').modal('show')

                        document.getElementById("bcontact2").focus();

                        return false;
                    }
                    if (document.getElementById("bcontact1").value.length < 10) {
                        document.getElementById("alert-message").innerHTML = "Bill of Party  <br > Contact1 :Only 10 digits allowed  ";
                        $('#show-alert').modal('show')

                        document.getElementById("bcontact1").focus();

                        return false;
                    }
                }
                if (document.getElementById("bdistt").value != "") {

                    if (!document.getElementById("bdistt").value.match(/^[0-9 a-z.A-Z]+$/)) {
                        document.getElementById("alert-message").innerHTML = "Bill of Party  <br >District Only alphanumeric allowed";
                        $('#show-alert').modal('show')

                        //alert("Only alphanumeric allowed");
                        document.getElementById("bdistt").focus();
                        return false;
                    } else
                    if (document.getElementById("bdistt").value.length > 30) {
                        document.getElementById("alert-message").innerHTML = "Bill of Party  <br >District Only 30 Characters allowed";
                        $('#show-alert').modal('show')


                        document.getElementById("bdistt").focus();

                        return false;
                    }
                }

                if (document.getElementById("bgstin").value != "") {

                    if (!document.getElementById("bgstin").value.match(/^[0-9A-Z]+$/)) {
                        document.getElementById("alert-message").innerHTML = "Bill of Party  <br >Please enter valid gstin";
                        $('#show-alert').modal('show')

                        //alert("Only alphanumeric allowed");
                        document.getElementById("bgstin").focus();
                        return false;
                    }
                    if (document.getElementById("bgstin").value.length > 15) {
                        document.getElementById("alert-message").innerHTML = "GSTIN: Only 15 Characters allowed";
                        $('#show-alert').modal('show')


                        document.getElementById("bgstin").focus();

                        return false;
                    }
                    if (document.getElementById("gstin").value.length < 15) {
                        document.getElementById("alert-message").innerHTML = " Bill of Party  <br >GSTIN: Only 15 Characters allowed";
                        $('#show-alert').modal('show')


                        document.getElementById("gstin").focus();

                        return false;
                    }
                }
                if (document.getElementById("sname").value != "") {

                    if (!document.getElementById("sname").value.match(/^[0-9 a-z.A-Z]+$/)) {
                        document.getElementById("alert-message").innerHTML = "Ship to Party <br >  Name: Only alphanumeric allowed";
                        $('#show-alert').modal('show')

                        //alert("Only alphanumeric allowed");
                        document.getElementById("sname").focus();
                        return false;
                    } else
                    if (document.getElementById("sname").value.length > 30) {
                        document.getElementById("alert-message").innerHTML = " Ship to Party <br > Name: Only 30 Characters allowed";
                        $('#show-alert').modal('show')


                        document.getElementById("sname").focus();

                        return false;
                    }
                }

                if (document.getElementById("scontact1").value != "") {

                    if (!document.getElementById("scontact1").value.match(/^[0-9]+$/)) {
                        document.getElementById("alert-message").innerHTML = " Ship to Party <br > Contact1 :Only numbers allowed ";
                        $('#show-alert').modal('show')

                        document.getElementById("scontact1").focus();
                        return false;
                    }
                    if (document.getElementById("scontact1").value.length > 10) {
                        document.getElementById("alert-message").innerHTML = "Ship to Party <br >  Contact1 :Only 10 digits allowed ";
                        $('#show-alert').modal('show')

                        document.getElementById("scontact1").focus();

                        return false;
                    }
                    if (document.getElementById("scontact1").value.length < 10) {
                        document.getElementById("alert-message").innerHTML = "Ship to Party <br > Contact1 :Only 10 digits allowed  ";
                        $('#show-alert').modal('show')

                        document.getElementById("scontact1").focus();

                        return false;
                    }
                }

                if (document.getElementById("scontact2").value != "") {

                    if (!document.getElementById("scontact2").value.match(/^[0-9]+$/)) {
                        document.getElementById("alert-message").innerHTML = "Ship to Party <br >  Contact2 :Only numbers allowed ";
                        $('#show-alert').modal('show')


                        document.getElementById("scontact2").focus();
                        return false;
                    }
                    if (document.getElementById("scontact2").value.length > 10) {
                        document.getElementById("alert-message").innerHTML = "Ship to Party <br > Contact2 :Only 10 digits allowed ";
                        $('#show-alert').modal('show')

                        document.getElementById("scontact2").focus();

                        return false;
                    }
                    if (document.getElementById("scontact1").value.length < 10) {
                        document.getElementById("alert-message").innerHTML = "Ship to Party <br > Contact1 :Only 10 digits allowed  ";
                        $('#show-alert').modal('show')

                        document.getElementById("scontact1").focus();

                        return false;
                    }
                }

                if (document.getElementById("saddress1").value != "") {

                    if (!document.getElementById("saddress1").value.match(/^[0-9 , : a-z.A-Z]+$/)) {
                        document.getElementById("alert-message").innerHTML = "Ship to Party <br >Address1: Only alphanumeric allowed";
                        $('#show-alert').modal('show')

                        //alert("Only alphanumeric allowed");
                        document.getElementById("saddress1").focus();
                        return false;
                    } else
                    if (document.getElementById("saddress1").value.length > 100) {
                        document.getElementById("alert-message").innerHTML = "Ship to Party <br >Address1: Only 30 Characters allowed";
                        $('#show-alert').modal('show')


                        document.getElementById("saddress1").focus();

                        return false;
                    }
                }

                if (document.getElementById("saddress2").value != "") {

                    if (!document.getElementById("saddress2").value.match(/^[0-9 , : a-z.A-Z]+$/)) {
                        document.getElementById("alert-message").innerHTML = "Ship to Party <br >Address2: Only alphanumeric allowed";
                        $('#show-alert').modal('show')

                        //alert("Only alphanumeric allowed");
                        document.getElementById("saddress2").focus();
                        return false;
                    } else
                    if (document.getElementById("saddress2").value.length > 100) {
                        document.getElementById("alert-message").innerHTML = "Ship to Party <br >Address2: Only 30 Characters allowed";
                        $('#show-alert').modal('show')


                        document.getElementById("saddress2").focus();

                        return false;
                    }
                }

                if (document.getElementById("saddress3").value != "") {

                    if (!document.getElementById("saddress3").value.match(/^[0-9 , : a-z.A-Z]+$/)) {
                        document.getElementById("alert-message").innerHTML = "Ship to Party <br >Address3: Only alphanumeric allowed";
                        $('#show-alert').modal('show')

                        //alert("Only alphanumeric allowed");
                        document.getElementById("saddress3").focus();
                        return false;
                    } else
                    if (document.getElementById("saddress3").value.length > 100) {
                        document.getElementById("alert-message").innerHTML = "Ship to Party <br >Address3: Only 30 Characters allowed";
                        $('#show-alert').modal('show')


                        document.getElementById("saddress3").focus();

                        return false;
                    }
                }

                if (document.getElementById("sdistt").value != "") {

                    if (!document.getElementById("sdistt").value.match(/^[0-9 a-z.A-Z]+$/)) {
                        document.getElementById("alert-message").innerHTML = "Ship to Party <br >District Only alphanumeric allowed";
                        $('#show-alert').modal('show')

                        //alert("Only alphanumeric allowed");
                        document.getElementById("sdistt").focus();
                        return false;
                    } else
                    if (document.getElementById("sdistt").value.length > 30) {
                        document.getElementById("alert-message").innerHTML = "Ship to Party <br >District Only 30 Characters allowed";
                        $('#show-alert').modal('show')


                        document.getElementById("sdistt").focus();

                        return false;
                    }
                }

                if (document.getElementById("sgstin").value != "") {

                    if (!document.getElementById("sgstin").value.match(/^[0-9A-Z]+$/)) {
                        document.getElementById("alert-message").innerHTML = "Ship to Party <br >Please enter valid gstin";
                        $('#show-alert').modal('show')

                        //alert("Only alphanumeric allowed");
                        document.getElementById("sgstin").focus();
                        return false;
                    }
                    if (document.getElementById("sgstin").value.length > 15) {
                        document.getElementById("alert-message").innerHTML = "Ship to Party <br >GSTIN: Only 15 Characters allowed";
                        $('#show-alert').modal('show')


                        document.getElementById("sgstin").focus();

                        return false;
                    }
                    if (document.getElementById("sgstin").value.length < 15) {
                        document.getElementById("alert-message").innerHTML = "Ship to Party <br >GSTIN: Only 15 Characters allowed";
                        $('#show-alert').modal('show')


                        document.getElementById("sgstin").focus();

                        return false;
                    }
                }

                if (document.getElementById("hsncode").value != "") {

                    if (!document.getElementById("hsncode").value.match(/^[.0-9 a-zA-Z]+$/)) {
                        document.getElementById("alert-message").innerHTML = "Code: Only aplhanumeric allowed";
                        $('#show-alert').modal('show')

                        //alert("Only alphanumeric allowed");
                        document.getElementById("hsncode").focus();
                        return false;
                    } else
                    if (document.getElementById("hsncode").value.length > 30) {
                        document.getElementById("alert-message").innerHTML = "Code: Only 30 characters allowed";
                        $('#show-alert').modal('show')


                        document.getElementById("hsncode").focus();

                        return false;
                    }
                }

                if (document.getElementById("qty").value != "") {

                    if (!document.getElementById("qty").value.match(/^[0-9]+$/)) {
                        document.getElementById("alert-message").innerHTML = "Quantity: Only numbers allowed";
                        $('#show-alert').modal('show')

                        //alert("Only alphanumeric allowed");
                        document.getElementById("qty").focus();
                        return false;
                    } else
                    if (document.getElementById("qty").value.length > 30) {
                        document.getElementById("alert-message").innerHTML = "Quantity: Only 30 digits allowed";
                        $('#show-alert').modal('show')


                        document.getElementById("qty").focus();

                        return false;
                    }
                }

                if (document.getElementById("rate").value != "") {

                    if (!document.getElementById("rate").value.match(/^[.0-9]+$/)) {
                        document.getElementById("alert-message").innerHTML = "Rate: Only numbers allowed";
                        $('#show-alert').modal('show')

                        //alert("Only alphanumeric allowed");
                        document.getElementById("rate").focus();
                        return false;
                    } else
                    if (document.getElementById("rate").value.length > 30) {
                        document.getElementById("alert-message").innerHTML = "Rate: Only 30 digits allowed";
                        $('#show-alert').modal('show')


                        document.getElementById("rate").focus();

                        return false;
                    }
                }

                if (document.getElementById("pf").value != "") {

                    if (!document.getElementById("pf").value.match(/^[.0-9]+$/)) {
                        document.getElementById("alert-message").innerHTML = "PF: Only numbers allowed";
                        $('#show-alert').modal('show')

                        //alert("Only alphanumeric allowed");
                        document.getElementById("pf").focus();
                        return false;
                    } else
                    if (document.getElementById("pf").value.length > 30) {
                        document.getElementById("alert-message").innerHTML = "PF: Only 30 digits allowed";
                        $('#show-alert').modal('show')


                        document.getElementById("pf").focus();

                        return false;
                    }
                }

                if (document.getElementById("cgst").value != "") {

                    if (!document.getElementById("cgst").value.match(/^[.0-9]+$/)) {
                        document.getElementById("alert-message").innerHTML = "CGST Only numbers allowed";
                        $('#show-alert').modal('show')

                        //alert("Only alphanumeric allowed");
                        document.getElementById("cgst").focus();
                        return false;
                    } else
                    if (document.getElementById("cgst").value.length > 30) {
                        document.getElementById("alert-message").innerHTML = "CGST Only 30 digits allowed";
                        $('#show-alert').modal('show')


                        document.getElementById("cgst").focus();

                        return false;
                    }
                }

                if (document.getElementById("sgst").value != "") {

                    if (!document.getElementById("sgst").value.match(/^[.0-9]+$/)) {
                        document.getElementById("alert-message").innerHTML = "SGST Only numbers allowed";
                        $('#show-alert').modal('show')

                        //alert("Only alphanumeric allowed");
                        document.getElementById("sgst").focus();
                        return false;
                    } else
                    if (document.getElementById("sgst").value.length > 30) {
                        document.getElementById("alert-message").innerHTML = "SGST Only 30 digits allowed";
                        $('#show-alert').modal('show')


                        document.getElementById("sgst").focus();

                        return false;
                    }
                }

                if (document.getElementById("igst").value != "") {

                    if (!document.getElementById("igst").value.match(/^[.0-9]+$/)) {
                        document.getElementById("alert-message").innerHTML = "IGST Only numbers allowed";
                        $('#show-alert').modal('show')

                        //alert("Only alphanumeric allowed");
                        document.getElementById("igst").focus();
                        return false;
                    } else
                    if (document.getElementById("igst").value.length > 30) {
                        document.getElementById("alert-message").innerHTML = "IGST Only 30 digits allowed";
                        $('#show-alert').modal('show')


                        document.getElementById("igst").focus();

                        return false;
                    }
                }

                if (document.getElementById("discount").value != "") {

                    if (!document.getElementById("discount").value.match(/^[.0-9]+$/)) {
                        document.getElementById("alert-message").innerHTML = "Freight Charges: Only numbers allowed";
                        $('#show-alert').modal('show')

                        //alert("Only alphanumeric allowed");
                        document.getElementById("discount").focus();
                        return false;
                    } else
                    if (document.getElementById("discount").value.length > 30) {
                        document.getElementById("alert-message").innerHTML = "Freight Charges: Only 30 digits allowed";
                        $('#show-alert').modal('show')


                        document.getElementById("discount").focus();

                        return false;
                    }
                }

                return true;
            }
        </script>

        <script>
            function validateform1() {

                if (document.getElementById("dn").value != "") {

                    if (!document.getElementById("dn").value.match(/^[0-9 a-z.A-Z]+$/)) {
                        document.getElementById("alert-message").innerHTML = " Cash Memo <br > Depositor Name: Only alphanumeric allowed";
                        $('#show-alert').modal('show')

                        //alert("Only alphanumeric allowed");
                        document.getElementById("dn").focus();
                        return false;
                    } else
                    if (document.getElementById("dn").value.length > 30) {
                        document.getElementById("alert-message").innerHTML = " Cash Memo <br > Depositor Name: Only 30 Characters allowed";
                        $('#show-alert').modal('show')


                        document.getElementById("dn").focus();

                        return false;
                    }
                }

                if (document.getElementById("ar").value != "") {

                    if (!document.getElementById("ar").value.match(/^[.0-9]+$/)) {
                        document.getElementById("alert-message").innerHTML = "Cash Memo <br > Amount Received: Only numbers allowed";
                        $('#show-alert').modal('show')

                        //alert("Only alphanumeric allowed");
                        document.getElementById("ar").focus();
                        return false;
                    } else
                    if (document.getElementById("ar").value.length > 30) {
                        document.getElementById("alert-message").innerHTML = "Cash Memo <br > Amount Received:: Only 30 digits allowed";
                        $('#show-alert').modal('show')


                        document.getElementById("ar").focus();

                        return false;
                    }
                }

                if (document.getElementById("pr").value != "") {

                    if (!document.getElementById("pr").value.match(/^[.0-9 a-zA-Z]+$/)) {
                        document.getElementById("alert-message").innerHTML = "Cash Memo <br >Payment Reference: Only alphanumericallowed";
                        $('#show-alert').modal('show')

                        //alert("Only alphanumeric allowed");
                        document.getElementById("pr").focus();
                        return false;
                    } else
                    if (document.getElementById("pr").value.length > 30) {
                        document.getElementById("alert-message").innerHTML = "Cash Memo <br > Payment Reference: Only 30 characters allowed";
                        $('#show-alert').modal('show')


                        document.getElementById("pr").focus();

                        return false;
                    }
                }

                return true;
            }

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
    </body>
</html>
