
<%@page import="blezz.Nd"%>
<%@page import="log.Log"%>
<%@page import="email.EmergencyEmail"%>
<%@page import="blezz.Proformainsert"%>
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
        <title>Proforma | INDSAC CRM</title>
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
           Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   --  Entring proforma.jsp---");
        %>

        <%  
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
            String incid=request.getParameter("incid");
            if(incid!=null || incid!=""||incid!="null"){invoiceid=incid; }
            String pagetype=Poul.escapeHtml(request.getParameter("type"));
            String type=pagetype;
            if(("trsh").equals(pagetype)){
               String sn=Poul.escapeHtml(request.getParameter("sn"));
               int isn= Integer.parseInt( sn ); int j=isn,i=0;    
               isn=7*(isn-1)+71; 
               }
            String def[]=new String[50];String contact=Poul.escapeHtml(request.getParameter("contact"));
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
                    catch(Exception e){  
                        String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n proforma.jsp-----\n"
     + "LINE=108 \n  select * from contact where id="+contact+" and useradminid="+usercid_adminid+" ";
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
                    rs3 = st.executeQuery("select  count(id)   FROM proforma where c_='1' and useradminid='"+usercid_adminid+"' ");
                    while(rs3.next()){
                        businessinvoiceno=rs3.getString(1);
                    }
                    rs3 = st.executeQuery("select  id   FROM proforma ORDER BY id DESC LIMIT 1 ");
                    while(rs3.next()){
                        SR=rs3.getString(1);
                    }
                    rs3 = st.executeQuery("select c_  FROM proforma where c_='0' and useradminid='"+usercid_adminid+"' ");
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
                    String Checkinvoic="";
                    Checkinvoic=Proformainsert.setProformaInsert(usercid_adminid, usercid_id, contact, owner);   }
                    invoiceid=Integer.toString(i);
                    msg="success";    
                    rs3.close();
                    st.close();
                    c.close();     
               }
               catch(Exception e){
                    String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n proforma.jsp-----\n"
     + "LINE=155 \n  select  count(id)   FROM proforma where c_='1' and useradminid='"+usercid_adminid+"' ";
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
                    PreparedStatement smt=con.prepareStatement("select * from proforma where id=?");
                    smt.setString(1,invoiceid);
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
                catch(Exception e){
                    String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n proforma.jsp-----\n"
     + "LINE=190 \n  select * from proforma where id="+invoiceid+" ";
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
                    PreparedStatement smt=con.prepareStatement("select cfinal,c_ from proforma where id=?");
                    smt.setString(1,invoiceid);
                    ResultSet rs=smt.executeQuery();
                    while(rs.next()){
                            cfinal=(rs.getInt(1));
                             c1 =(rs.getInt(2));
                    }    
                    
                    rs.close();
                    smt.close();
                    con.close();  
                }
                catch(Exception e){
                    String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n proforma.jsp-----\n"
     + "LINE=216 \n  select cfinal,c_ from proforma where id="+invoiceid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
                }
                 
                
                Final=Poul.escapeHtml(request.getParameter("final"));
                
                
                if(Final!=null){
                if(Final.equals(val1))
                {
                try{
                    Connection con=Poul.getConnectionCRM();
                    PreparedStatement smt=con.prepareStatement("update proforma set cfinal = ? where id = ? ");
                    smt.setInt(1,1);
                    smt.setString(2,invoiceid);
                    int fi=smt.executeUpdate();
                    
                    smt.close();
                    con.close();  
                }
                catch(Exception e){
                     String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n proforma.jsp-----\n"
     + "LINE=240 \n  update proforma set cfinal = 1 where id ="+invoiceid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
                }
                }
                else if(Final.equals(val2))
                {
                try{
                    Connection con=Poul.getConnectionCRM();
                    PreparedStatement smt=con.prepareStatement("update proforma set cfinal = ? where id = ? ");
                    smt.setInt(1,0);
                    smt.setString(2,invoiceid);
                    int fi=smt.executeUpdate();
                    
                    smt.close();
                    con.close();  
                }
                catch(Exception e){
                     String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n proforma.jsp-----\n"
     + "LINE=259 \n  update proforma set cfinal = 1 where id ="+invoiceid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
                }
                }
                }
                try{
                    Connection con=Poul.getConnectionCRM();
                    PreparedStatement smt=con.prepareStatement("select cfinal,c_ from proforma where id=?");
                    smt.setString(1,invoiceid);
                    ResultSet rs=smt.executeQuery();
                    while(rs.next()){
                            cfinal=(rs.getInt(1));
                             c1 =(rs.getInt(2));
                    }    
                   
                    rs.close();
                    smt.close();
                    con.close();  
                }
                catch(Exception e){
                     String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n proforma.jsp-----\n"
     + "LINE=281 \n  select cfinal,c_ from proforma where id="+invoiceid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
                }
                String a11[]=new String[256];
                try{
                Connection con=Poul.getConnectionCRM();
                PreparedStatement smt=con.prepareStatement("select * from proformaseller where proformaid=?");
                smt.setString(1,invoiceid);
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
                catch(Exception e){
                     String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n proforma.jsp-----\n"
     + "LINE=302 \n  select * from proformaseller where proformaid="+invoiceid+" ";
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
                            <a href="invoice/proformaprint.jsp?incid=<%=invoiceid %>" target="_blank"> <button type="button" class="btn btn-block btn-info"<%if(cfinal==0 || c1!=1){%>disabled<%}%>><i class="fa fa-fw fa-print"></i>Print</button></a>
                        </div>
                        <div class="col-sm-3">
                            <a href="contactdetails.jsp?2a2e2a636964=<%=Nd.Encrypt(a1[59]) %>&2a2e2a74797065=2a2e2a636f6e74616374">     <button  class="btn btn-block btn-info" ><i class="fa fa-fw fa-user"></i>Customer Profile</button></a>
                        </div>
                       <div class="col-sm-3">
                          <form method="get" action="proforma.jsp" > 
                             <%if(c1!=0){%>
                        
                                <input type="hidden" name="final" <%if(cfinal==0){%>value="true1"<%}else if(cfinal==1){%>value="false0"<%}%>>
                                <input type="hidden" name="incid" value=<%=invoiceid %>>
                                <button class="btn btn-block btn-info"   type="submit"><i class="fa fa-fw fa-check-square-o"></i><%if(cfinal!=1){%>Save<%}else{%>Edit<%}%></button>
                                   
                            <%}%>
                        </form>
                       </div>
                        <div class="col-sm-3"></div>
                    </div>
                </section>    
                <form method="get" action="ProformaAddProduct">
                <!-- Main content -->
                <section class="invoice">
                    <!-- info row -->
                    <!-- info row -->
                   
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
                                    <b>Proforma</b> 
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
                                    <b>Proforma Date</b> 
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
                                            
                                            <a href="deleteproformaproduct.jsp?incid=<%=invoiceid %>&type=trsh&sn=<%=a1[jj]  %>&max=<%=iiil  %>&pro=<%=a1[jj+1]  %>&cod=<%=a1[jj+2]  %>&qt=<%=a1[jj+3]  %>&rate=<%=a1[jj+4]  %>&amt<%=a1[jj+6]  %>=#sn" > <i class="fa fa-trash-o"></i> </a>
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
                                    catch(Exception e){ 
                                        String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n proforma.jsp-----\n"
     + "LINE=943 \n  select count(*) from stock where useradminid="+usercid_adminid+" ";
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
                                    catch(Exception e){ 
                                        String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n proforma.jsp-----\n"
     + "LINE=969 \n  select * from stock where useradminid="+usercid_adminid+" ";
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
                   
                    <!-- /.row -->

                    <input type="hidden" name="down" value="true">
                    
                </section>
            </form> 
            
                                            
                    <!-- /.row -->   

                
               
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
            <jsp:include page="dist/include/footer.jsp" />
<%    Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Leaving proforma.jsp---------- --");
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

                    if (!document.getElementById("baddress1").value.match(/^[0-9 a-z, /:A-Z]+$/)) {
                        document.getElementById("alert-message").innerHTML = "Bill of Party  <br >Address1: Only alphanumeric allowed";
                        $('#show-alert').modal('show')

                        //alert("Only alphanumeric allowed");
                        document.getElementById("baddress1").focus();
                        return false;
                    } else
                    if (document.getElementById("baddress1").value.length > 30) {
                        document.getElementById("alert-message").innerHTML = "Bill of Party  <br >Address1: Only 30 Characters allowed";
                        $('#show-alert').modal('show')


                        document.getElementById("baddress1").focus();

                        return false;
                    }
                }

                if (document.getElementById("baddress2").value != "") {

                    if (!document.getElementById("baddress2").value.match(/^[0-9 a-z, /:A-Z]+$/)) {
                        document.getElementById("alert-message").innerHTML = "Bill of Party  <br >Address2: Only alphanumeric allowed";
                        $('#show-alert').modal('show')

                        //alert("Only alphanumeric allowed");
                        document.getElementById("baddress2").focus();
                        return false;
                    } else
                    if (document.getElementById("baddress2").value.length > 30) {
                        document.getElementById("alert-message").innerHTML = "Bill of Party  <br >Address2: Only 30 Characters allowed";
                        $('#show-alert').modal('show')


                        document.getElementById("baddress2").focus();

                        return false;
                    }
                }

                if (document.getElementById("baddress3").value != "") {

                    if (!document.getElementById("baddress3").value.match(/^[0-9 a-z, /:A-Z]+$/)) {
                        document.getElementById("alert-message").innerHTML = "Bill of Party <br >Address3: Only alphanumeric allowed";
                        $('#show-alert').modal('show')

                        //alert("Only alphanumeric allowed");
                        document.getElementById("baddress3").focus();
                        return false;
                    } else
                    if (document.getElementById("baddress3").value.length > 30) {
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

                    if (!document.getElementById("saddress1").value.match(/^[0-9 a-z, /:A-Z]+$/)) {
                        document.getElementById("alert-message").innerHTML = "Ship to Party <br >Address1: Only alphanumeric allowed";
                        $('#show-alert').modal('show')

                        //alert("Only alphanumeric allowed");
                        document.getElementById("saddress1").focus();
                        return false;
                    } else
                    if (document.getElementById("saddress1").value.length > 30) {
                        document.getElementById("alert-message").innerHTML = "Ship to Party <br >Address1: Only 30 Characters allowed";
                        $('#show-alert').modal('show')


                        document.getElementById("saddress1").focus();

                        return false;
                    }
                }

                if (document.getElementById("saddress2").value != "") {

                    if (!document.getElementById("saddress2").value.match(/^[0-9 a-z, /:A-Z]+$/)) {
                        document.getElementById("alert-message").innerHTML = "Ship to Party <br >Address2: Only alphanumeric allowed";
                        $('#show-alert').modal('show')

                        //alert("Only alphanumeric allowed");
                        document.getElementById("saddress2").focus();
                        return false;
                    } else
                    if (document.getElementById("saddress2").value.length > 30) {
                        document.getElementById("alert-message").innerHTML = "Ship to Party <br >Address2: Only 30 Characters allowed";
                        $('#show-alert').modal('show')


                        document.getElementById("saddress2").focus();

                        return false;
                    }
                }

                if (document.getElementById("saddress3").value != "") {

                    if (!document.getElementById("saddress3").value.match(/^[0-9 a-z, /:A-Z]+$/)) {
                        document.getElementById("alert-message").innerHTML = "Ship to Party <br >Address3: Only alphanumeric allowed";
                        $('#show-alert').modal('show')

                        //alert("Only alphanumeric allowed");
                        document.getElementById("saddress3").focus();
                        return false;
                    } else
                    if (document.getElementById("saddress3").value.length > 30) {
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
    </body>
</html>
