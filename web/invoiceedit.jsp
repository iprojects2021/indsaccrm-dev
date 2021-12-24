<%@page import="log.Log"%>
<%@page import="email.EmergencyEmail"%>
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
  <meta charset="utf-8">
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
            Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   --  Entring invoiceedit.jsp---");  
           
         int jkr=0; 
       
       String owner=(String)session1.getAttribute("ownr");
       String cdata[]=new String[50];
           String amtinwords="",amtinwordspaisa="";
           String invoiceid=null;  int iiil=0;
       String incid=request.getParameter("incid");
      if(incid!=null || incid!=""||incid!="null"){invoiceid=incid; }
           String pagetype=Poul.escapeHtml(request.getParameter("type"));
           if(("trsh").equals(pagetype)){
              String sn=Poul.escapeHtml(request.getParameter("sn"));
               int isn= Integer.parseInt( sn ); int j=isn,i=0;
    
        isn=7*(isn-1)+71; 
       
           }
           
           String def[]=new String[50];
           if(("new").equals(pagetype)){
           String contact=Poul.escapeHtml(request.getParameter("contact"));
         
           if(!"".equals(contact)||!"null".equals(contact))
           {   try{ Connection con=Poul.getConnectionCRM();
             PreparedStatement smt=con.prepareStatement("select * from contact where id=? ");
              smt.setString(1,contact);
              ResultSet rs=smt.executeQuery();
              int i=1;
              while(rs.next()){
                  for(i=1;i<50;i++)
                  {cdata[i]=(rs.getString(i));} out.print(cdata[i]);
              } rs.close();
           smt.close();
           con.close(); }
      catch(Exception e)
      {  
          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoiceedit.jsp-----\n"
     + "LINE=94 + \n select * from contact where id="+contact+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      }
           
           }else{  for(int i=1;i<50;i++)
                  {cdata[i]="";}}
          
           
           
        String msg="null";
        java.util.Date date=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());
       
        String id=(String)session.getAttribute("id"); 
        String SR=null,check=null,che1="null",che2=null;
        try{ Connection con=Poul.getConnectionCRM();
             PreparedStatement smt=con.prepareStatement("select * from mastertable ");
             
              ResultSet rs=smt.executeQuery();
              int i=1;
              while(rs.next()){
              def[i]=(rs.getString(5));
              i++;} rs.close();
           smt.close();
           con.close(); }
      catch(Exception e)
      {
           String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoiceedit.jsp-----\n"
     + "LINE=124 + \n select * from mastertable  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      }
        try{
        
Connection c=Poul.getConnectionCRM();


Statement st=c.createStatement();
   

 ResultSet rs3;
               rs3 = st.executeQuery("select  *  FROM invoice  ");
    while(rs3.next())
        
          {SR=rs3.getString(1);
          check=rs3.getString(3);
          if("0".equals(check)){che1=SR;  }
          }
    cdata[6]=cdata[6].concat(cdata[7]);
           int i = Integer.parseInt( SR ); 
           ++i;  if(che1!="null"){i=Integer.parseInt( che1 ); }
           if("null".equals(che1)){
   st.addBatch("insert into invoice values('"+i+"',"
                      + "'"+sqlTime+"',"
                      + "'0'," + "'"+owner+"'," + "''," + "'',"   + "'',"  + "'',"+ "'',"+ "'',"
                       + "'',"+ "''," + "'"+cdata[6]+"',"  + "'"+cdata[30]+"',"+ "'"+cdata[31]+"'," + "'"+cdata[32]+"'," + "'"+cdata[20]+"'," + "'"+cdata[21]+"'," + "''," + "'',"
                        + "'"+cdata[35]+"'," + "''," + "'"+cdata[38]+"'," + "''," + "'',"
                       + "''," 
                      + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'"+def[1]+"',"
                       + "'',"
                       + "'"+def[2]+"',"
                       + "'',"
                        + "'"+def[3]+"',"
                      + "'',"
                       + "'"+def[4]+"',"
                       + "'',"
                          + "'"+def[5]+"',"
                      + "'"+def[6]+"',"
                       + "'',"
                       + "'"+def[7]+"',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'"+contact+"',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "''," 
                      + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                          + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                             + "'',"
                       + "'',"
                       + "'',"
                            + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "''," 
                      + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                          + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "''," 
                      + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                          + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "''," 
                             + "'',"
                       + "'',"
                       + "'',"
                            + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "''," 
                      + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                          + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "''," 
                      + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                          + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "''," 
                             + "'',"
                       + "'',"
                       + "'',"
                            + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "''," 
                      + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                          + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "''," 
                      + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                          + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "''," 
                             + "'',"
                       + "'',"
                       + "'',"
                            + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "''," 
                      + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                          + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "''," 
                      + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                          + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                          + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "''," 
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "''," 
                          + "'',"  + "'',"   + "'',"  + "'',"  + "''," + "''," + "''," + "''," + "'',"+ "'')");          
       st.executeBatch(); }
       invoiceid=Integer.toString(i);
             msg="success";    
       rs3.close();
           st.close();
           c.close();
        }
        catch(Exception e)
        {
            String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoiceedit.jsp-----\n"
     + "LINE=629 + \n select  *  FROM invoice   ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
        }
      
        
           }
        %>
    
    
    <%
        
           pagetype=request.getParameter("pagetype");
           
      
           if(("addproduct").equals(pagetype)){
        String invoicedate=Poul.escapeHtml(request.getParameter("invoicedate"));
        String reversecharge=Poul.escapeHtml(request.getParameter("reversecharge"));
        String state1=Poul.escapeHtml(request.getParameter("state1"));
        String statecode1=Poul.escapeHtml(request.getParameter("statecode1"));
        String transporter=Poul.escapeHtml(request.getParameter("transporter"));
        String vehicleno=Poul.escapeHtml(request.getParameter("vehicleno"));
        String supplydate=Poul.escapeHtml(request.getParameter("supplydate"));
        String supplyplace=Poul.escapeHtml(request.getParameter("supplyplace"));
        String bname=Poul.escapeHtml(request.getParameter("bname"));
        String baddress1=Poul.escapeHtml(request.getParameter("baddress1"));
        String baddress2=Poul.escapeHtml(request.getParameter("baddress2"));
        String baddress3=Poul.escapeHtml(request.getParameter("baddress3"));
        String bcontact1=Poul.escapeHtml(request.getParameter("bcontact1"));
        String bcontact2=Poul.escapeHtml(request.getParameter("bcontact2"));
        String bdistt=Poul.escapeHtml(request.getParameter("bdistt"));
        String bgstin=Poul.escapeHtml(request.getParameter("bgstin"));
        String bstate=Poul.escapeHtml(request.getParameter("bstate"));
        String sname=Poul.escapeHtml(request.getParameter("sname"));
         String saddress1=Poul.escapeHtml(request.getParameter("saddress1"));
          String saddress2=Poul.escapeHtml(request.getParameter("saddress2"));
        String saddress3=Poul.escapeHtml(request.getParameter("saddress3"));
        String scontact1=Poul.escapeHtml(request.getParameter("scontact1"));
        String sdistt=Poul.escapeHtml(request.getParameter("sdistt"));
        String scontact2=Poul.escapeHtml(request.getParameter("scontact2"));
        String sgstin=Poul.escapeHtml(request.getParameter("sgstin"));
        String sstate=Poul.escapeHtml(request.getParameter("sstate"));
        String sabop=Poul.escapeHtml(request.getParameter("sabop"));
        
        if("true".equals(sabop)){ 
        sname=bname; 
saddress1=baddress1;
saddress2=baddress2;
saddress3=baddress3;
scontact1=bcontact1;
scontact2=bcontact2;
sdistt=bdistt;
sgstin=bgstin;
sstate=bstate;
        
        }
         String sn=Poul.escapeHtml(request.getParameter("sn"));
        String description=Poul.escapeHtml(request.getParameter("description"));
        String description1=Poul.escapeHtml(request.getParameter("description1"));
        description=description.concat(description1);
        String hsncode=Poul.escapeHtml(request.getParameter("hsncode"));
        String qty=Poul.escapeHtml(request.getParameter("qty"));
        String unit=Poul.escapeHtml(request.getParameter("unit"));
        String rate=Poul.escapeHtml(request.getParameter("rate"));
        String amount=Poul.escapeHtml(request.getParameter("amount"));
        
         String pf=Poul.escapeHtml(request.getParameter("pf"));
        String cgst=Poul.escapeHtml(request.getParameter("cgst"));
        String sgst=Poul.escapeHtml(request.getParameter("sgst"));
        String igst=Poul.escapeHtml(request.getParameter("igst"));
        String discount=Poul.escapeHtml(request.getParameter("discount"));
         String producttotal=Poul.escapeHtml(request.getParameter("producttotal"));
         
        String totalamount=Poul.escapeHtml(request.getParameter("totalamount"));
        String netamount=Poul.escapeHtml(request.getParameter("netamount"));
      
       
       String temp="null";
              
         BigDecimal  ipf= new BigDecimal( pf ); BigDecimal icgst= new BigDecimal( cgst ); BigDecimal isgst=new BigDecimal( sgst );BigDecimal iigst= new BigDecimal( igst );
        int isn= Integer.parseInt( sn );
        BigDecimal iqty= new BigDecimal( qty );
        BigDecimal irate= new BigDecimal( rate );
        BigDecimal iproducttotal= new BigDecimal( producttotal );
       BigDecimal hundred= new BigDecimal( "100" );
        BigDecimal itotalamount= new BigDecimal( totalamount );
        BigDecimal inetamount= new BigDecimal( netamount );
         BigDecimal idiscount= new BigDecimal( discount );
        BigDecimal iamount=new BigDecimal( "0" );
        iamount=iqty.multiply(irate);
        iproducttotal=iamount.add(iproducttotal);
        ipf=((iproducttotal.multiply(ipf))).divide(hundred);ipf = ipf.setScale(2, BigDecimal.ROUND_HALF_UP);
         isgst=((iproducttotal.multiply(isgst))).divide(hundred);isgst = isgst.setScale(2, BigDecimal.ROUND_HALF_UP);
       
        icgst=((iproducttotal.multiply(icgst))).divide(hundred);icgst = icgst.setScale(2, BigDecimal.ROUND_HALF_UP);
        iigst=((iproducttotal.multiply(iigst))).divide(hundred);iigst = iigst.setScale(2, BigDecimal.ROUND_HALF_UP);
        itotalamount=iproducttotal.add(ipf.add(icgst.add(isgst.add(iigst))));itotalamount = itotalamount.setScale(2, BigDecimal.ROUND_HALF_UP);
        
        inetamount=itotalamount.subtract(idiscount);inetamount = inetamount.setScale(2, BigDecimal.ROUND_HALF_UP);
        amtinwords=Poul.convert(Integer.valueOf(inetamount.intValue()));
          BigDecimal result = inetamount.subtract(inetamount.setScale(0, RoundingMode.FLOOR)).movePointRight(inetamount.scale());    
        amtinwordspaisa=Poul.convert(Integer.valueOf(result.intValue()));
         
        
String sipf=ipf.toString(),siqty=iqty.toString(),sirate=irate.toString(),siproducttotal=iproducttotal.toString(),sitotalamount=itotalamount.toString();
String sidiscount=idiscount.toString(),siamount=iamount.toString(),sicgst=icgst.toString(),sisgst=isgst.toString(),siigst=iigst.toString(),  sinetamount=inetamount.toString();

        int j=isn,i=0;
    
        isn=7*(isn-1)+71;
       
        String msg="null";
     
        String SR=null;
        
        try{
        
Connection c=Poul.getConnectionCRM();


Statement st=c.createStatement();
           ResultSet rs3;
               rs3 = st.executeQuery("select  *  FROM invoice where id='"+incid+"'  ");
    ResultSetMetaData rsmd=rs3.getMetaData();
     String aa="null",ab="null",ac="null",ad="null",ae="null",af="null",ag="null",ah="null",ai="null",aj="null",ak="null",all="null",am="null",an="null",ao="null",app="null",aq="null",ar="null",as="null",at="null",au="null",av="null",aw="null",ax="null",ay="null",az="null";
      String ba="null",bb="null",bc="null",bd="null",be="null",bf="null",bg="null",bh="null",bi="null",bj="null",bk="null",bl="null",bm="null",bn="null",bo="null",bp="null",bq="null",br="null",bs="null",bt="null",bu="null",bv="null",bw="null",bx="null",by="null",bz="null";
       String cs="null",ct="null",cu="null",cv="null";
       String cw="null",cx="null",cy="null",cz="null",da="null",db="null",dc="null",dd="null",de="null",df="null",dg="null",dh="null",di="null",dj="null",dk="null",dl="null",dm="null",dn="null",dO="null",dp="null",dq="null",dr="null";
       String defa1="null",defa2="null",defa3="null",defa4="null",defa5="null"; 
     aa=rsmd.getColumnName(1); ab=rsmd.getColumnName(2);ac=rsmd.getColumnName(3);
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
                         app=rsmd.getColumnName(16);
                          aq=rsmd.getColumnName(17);
                           ar=rsmd.getColumnName(18);
                            as=rsmd.getColumnName(19);
                             at=rsmd.getColumnName(20);
                              au=rsmd.getColumnName(21);
                              av=rsmd.getColumnName(22);
                              aw=rsmd.getColumnName(23);
                              ax=rsmd.getColumnName(24);
                              ay=rsmd.getColumnName(25);
                              az=rsmd.getColumnName(26);
          ba=rsmd.getColumnName(27); bb=rsmd.getColumnName(28);bc=rsmd.getColumnName(29);
             bd=rsmd.getColumnName(30);
              be=rsmd.getColumnName(31);
               bf=rsmd.getColumnName(32);
                bg=rsmd.getColumnName(33);
                 bh=rsmd.getColumnName(34);
                  bi=rsmd.getColumnName(35);
                   bj=rsmd.getColumnName(36);
                    bk=rsmd.getColumnName(37);
                     bl=rsmd.getColumnName(38);
                      bm=rsmd.getColumnName(39);
                       bn=rsmd.getColumnName(40); bo=rsmd.getColumnName(41);  bp=rsmd.getColumnName(42); bq=rsmd.getColumnName(43); br=rsmd.getColumnName(44); bs=rsmd.getColumnName(45);bt=rsmd.getColumnName(46);bu=rsmd.getColumnName(47);bv=rsmd.getColumnName(48);bw=rsmd.getColumnName(49); bx=rsmd.getColumnName(50); by=rsmd.getColumnName(51); bz=rsmd.getColumnName(52);
        
                       
                       
                 defa1=rsmd.getColumnName(41);
                   defa2=rsmd.getColumnName(43);
                    defa3=rsmd.getColumnName(45);
                     defa4=rsmd.getColumnName(47);
                      defa5=rsmd.getColumnName(52);       
                      String cal1="null",cal2="null",cal3="null",cal4="null",cal5="null",cal6="null",cal7="null"; 
                       
                       cal1=rsmd.getColumnName(37);
                       cal2=rsmd.getColumnName(42);
                       cal3=rsmd.getColumnName(44);
                       cal4=rsmd.getColumnName(46);
                       cal5=rsmd.getColumnName(48);
                       cal6=rsmd.getColumnName(51);
                       cal7=rsmd.getColumnName(54);
                       
                       String clmname[]=new String[500];
         int ii=71;
         for(ii=71;ii<490;ii++)
         {clmname[ii]=rsmd.getColumnName(ii);
            
         }
  st.addBatch("update invoice set   "+ac+"='1',"+ae+"='"+invoicedate+"',"+af+"='"+reversecharge+"',"+ag+"='"+state1+"',"+ah+"='"+statecode1+"',"+ai+"='"+transporter+"',"+aj+"='"+vehicleno+"',"+ak+"='"+supplydate+"',"+all+"='"+supplyplace+"',"+am+"='"+bname+"',"+an+"='"+baddress1+"',"+ao+"='"+baddress2+"',"+app+"='"+baddress3+"',"+aq+"='"+bcontact1+"',"+ar+"='"+bcontact2+"',"+at+"='"+bdistt+"',"+au+"='"+bstate+"',"+aw+"='"+bgstin+"',"+ay+"='"+sname+"',"+az+"='"+saddress1+"',"+ba+"='"+saddress2+"',"
          +bb+"='"+saddress3+"',"+bc+"='"+scontact1+"',"+bd+"='"+scontact2+"',"+bf+"='"+sdistt+"',"+bg+"='"+sstate+"',"+bi+"='"+sgstin+"',"
          + ""+clmname[isn]+"='"+sn+"',"+clmname[isn+1]+"='"+description+"',"+clmname[isn+2]+"='"+hsncode+"',"+clmname[isn+3]+"='"+qty+"',"+clmname[isn+4]+"='"+rate+"',"+clmname[isn+5]+"='"+unit+"',"+clmname[isn+6]+"='"+iamount+"',"+defa1+"='"+pf+"',"+defa2+"='"+cgst+"',"+defa3+"='"+sgst+"',"+defa4+"='"+igst+"',"+defa5+"='"+discount+"',"+cal1+"='"+iproducttotal +"',"+cal2+"='"+ipf +"',"+cal3+"='"+icgst +"',"+cal4+"='"+isgst +"',"+cal5+"='"+iigst +"',"+cal6+"='"+itotalamount +"',"+cal7+"='"+inetamount +"',be_='"+amtinwords +"',bf_='"+amtinwordspaisa +"'   where id='"+incid+"'");
   
            
       st.executeBatch(); 
       invoiceid=incid;
             msg="success";    
       rs3.close();
           st.close();
           c.close();
        }
        catch(Exception e)
        {
           String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoiceedit.jsp-----\n"
     + "LINE=833 + \n select  *  FROM invoice where id="+incid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
        }
       
        
           }
        %>
    
<div class="wrapper">
    <%
        String a1[]=new String[505];
          String invoiceiddd=Poul.escapeHtml(request.getParameter("invoiceidd"));
      
       try{
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from invoice where id=?");
        smt.setString(1,invoiceiddd);
        ResultSet rs=smt.executeQuery();
       
        while(rs.next()){
            for(int i=1;i<499;i++){
               a1[i]=(rs.getString(i)); 
               
            }
        } 
        int j=0;
        for(int i=71;i<490;i+=7)
        { if("".equals(a1[i])||"null".equals(a1[i])||"0".equals(a1[i]) ){ j++;}else { iiil++;}   }
        
    rs.close();
           smt.close();
           con.close();   }
        catch(Exception e)
        {
         String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoiceedit.jsp-----\n"
     + "LINE=870 + \n select * from invoice where id="+invoiceiddd+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);       
                }
       //System.out.println(al.size());
      %>

  <header class="main-header">
    <!-- Logo -->
    <a href="index2.html" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>INDSAC</b>-CRM</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>INDSAC</b>-CRM</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
         
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="dist/img/u.png" class="user-image" alt="User Image">
              <span class="hidden-xs">USHAAI INDUSTRIES</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="dist/img/u.png" class="img-circle" alt="User Image">

                <p>
                  USHAAI INDUSTRIES - Manufacturing Company
                  <small>Member since  2010</small>
                </p>
              </li>
              <!-- Menu Body -->
             
              <!-- Menu Footer-->
              <li class="user-footer">
                
                <div class="pull-right">
                  <a href="signout.jsp" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="dist/img/u.png" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p> </p>
          
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- search form -->
   
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu" data-widget="tree">
              <li class="treeview ">
          <a href="#">
            <i class="fa  fa-user-md"></i>
            <span>Contact</span>
           <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="contact.jsp"><i class="fa fa-dashboard"></i> Contact Dashboard</a></li>
            <li><a href="newcontact.jsp"><i class="fa fa-user-plus"></i> New Contact</a></li>
           
          </ul>
        </li> 
        <li class="treeview ">
          <a href="#">
            <i class="fa  fa-user-md"></i>
            <span>Lead</span>
           <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="lead.jsp"><i class="fa fa-dashboard"></i> Lead Dashboard</a></li>
            <li><a href="newleads.jsp"><i class="fa fa-user-plus"></i> New Lead</a></li>
           
          </ul>
        </li>   
        <li class="treeview ">
          <a href="#">
            <i class="fa  fa-user-md"></i>
            <span>Vendor</span>
           <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="vendor.jsp"><i class="fa fa-dashboard"></i> Vendor Dashboard</a></li>
            <li><a href="newvendor.jsp"><i class="fa fa-user-plus"></i> New Vendor</a></li>
           
          </ul>
        </li>
        <li class="treeview ">
          <a href="#">
            <i class="fa  fa-user-md"></i>
            <span>Stock</span>
           <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="viewstock.jsp"><i class="fa fa-dashboard"></i> View Stock</a></li>
           
          </ul>
        </li>
       
        <li class="treeview ">
          <a href="#">
            <i class="fa  fa-user-md"></i>
            <span>Invoice</span>
           <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="invoicedash.jsp"><i class="fa fa-dashboard"></i> Invoice Dashboard</a></li>
          
          </ul>
        </li> 
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
    
	
	
	
	
    </section>

    <!-- Main content -->
    <section class="invoice">
	
	
     
      <!-- info row -->
	      <!-- info row -->
	 <div class="row">
        <div class="col-xs-12">
          <h1 class="page-header" align="center">
         <strong > TAX INVOICE</strong>
           
          </h1>
        </div>
        <!-- /.col -->
      </div>
      <!-- info row -->
      <form method="get" action="invoiceedit.jsp">
      <div class="row invoice-info">
        <div class="col-sm-4 invoice-col">
          Seller
          <address>
            <strong>SITARAM CHOUDHARY</strong><br>
            25A Sai Shakti Nagar, Rau<br>
            Indore 453331 (M.P.) India<br>
            Mob: 9229221771,9039032327<br>
            Email: sitaram2624@gmail.com
            
          </address>
        </div>
        <!-- /.col -->
         <div class="col-sm-4 invoice-col">
           <div class="form-group">
              <div class="col-sm-4">
                  <b>Invoice</b> </div>
                  <div class="col-sm-8">
                      <strong>#<%=invoiceiddd %></strong>

                  </div>
                </div>
             
          <br>
            <div class="form-group">
              <div class="col-sm-4">
                  <b>Invoice Date</b> </div>
                <% String date="null";
                        date=(a1[2]);
                 //     date=date.substring(0,10); 
                // date=Character.toString(date.charAt(5))+Character.toString(date.charAt(6))+"/"+Character.toString(date.charAt(8))+Character.toString(date.charAt(9))+"/"+Character.toString(date.charAt(0))+Character.toString(date.charAt(1))+Character.toString(date.charAt(2))+Character.toString(date.charAt(3));
       
                  
                  %>
                  <div class="col-sm-8">
                      <input type="text" class="form-control" id="datepicker1"  name="invoicedate" <%if("".equals(a1[5])||"null".equals(a1[5]) ){ %>placeholder="<%=date %>" value="<%=date  %>" <% }else {%> placeholder="<%=a1[5] %>" value="<%=a1[5]  %>" <% }%>>

                  </div>
                </div>
          <br><br>
               <div class="form-group">
              <div class="col-sm-4">
                  <b>Reverse Charge(Y/N) </b> </div>
                  <div class="col-sm-8">
 <select id="reversecharge" name="reversecharge" class="form-control" value="<%=(a1[6]) %>">
     <%if("".equals(a1[6])||"null".equals(a1[6]) ){ %> <option value="No">No</option> 
     
     <% }else {%>   <option value="<%=(a1[6]) %>"><%=(a1[6]) %></option> <% }%>                    
   
                        
<option value="Yes">Yes</option>
<option value="Yes">No</option>
</select>
                  </div>
                </div>
          <br><br>
               <div class="form-group">
              <div class="col-sm-4">
                  <b>State</b> </div>
                  <div class="col-sm-8">
 <select id="state1" name="state1" class="form-control" value="<%=(a1[7]) %>">
     <%if("".equals(a1[7])||"null".equals(a1[7]) ){ %> <option value="Madhya Pradesh & Code=23">Madhya Pradesh</option> <% }else {%>   <option value="<%=(a1[7]) %>"><%=(a1[7]) %></option> <% }%>                    
   
                        
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
          <br><br>  
              
              
         
        </div>
        <!-- /.col -->
        <!-- /.col -->
        <div class="col-sm-4 invoice-col">
           <div class="form-group">
              <div class="col-sm-4">
                  <b>Transporter</b> </div>
                  <div class="col-sm-8">
                       <input type="text" class="form-control" id="transporter" name="transporter" <%if("".equals(a1[9])||"null".equals(a1[9]) ){ %>placeholder="transporter" <% }else {%> placeholder="<%=a1[9] %>" value="<%=a1[9]  %>" <% }%>>


                  </div>
                </div>
             
            <br><br>
            <div class="form-group">
              <div class="col-sm-4">
                  <b>Vehicle No</b> </div>
                  <div class="col-sm-8">
                     <input type="text" class="form-control" id="vehicleno" name="supplydate" <%if("".equals(a1[10])||"null".equals(a1[10]) ){ %>placeholder="Vehicle No" <% }else {%> placeholder="<%=a1[10] %>" value="<%=a1[10]  %>" <% }%>>

                  </div>
                </div>
          <br><br>
               <div class="form-group">
              <div class="col-sm-4">
                  <b>Date of Supply </b> </div>
                  <div class="col-sm-8">
                     <input type="text" class="form-control" id="datepicker2" name="supplydate" <%if("".equals(a1[11])||"null".equals(a1[11]) ){ %>placeholder="<%=date %>" value="<%=date  %>"<% }else {%> placeholder="<%=a1[11] %>" value="<%=date  %>" <% }%>>

                  </div>
                </div>
          <br><br>
               <div class="form-group">
              <div class="col-sm-4">
                  <b>Place of Supply</b> </div>
                  <div class="col-sm-8">
                     <input type="text" class="form-control" id="supplyplace" name="supplyplace" <%if("".equals(a1[12])||"null".equals(a1[12]) ){ %>placeholder="Indore" value="Indore" <% }else {%> placeholder="<%=a1[12] %>" value="<%=a1[12]  %>" <% }%>>

                  </div>
                </div>
       
              
              
         
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

	  <!-- info row -->
      <div class="row invoice-info">
        
		
		
         <div class="col-sm-6 invoice-col">
              <div class="box box-info"> 
                      <div class="box-header with-border">
              <h3 class="box-title">Bill of Party</h3>
            </div>
            <!-- /.box-header -->
           <div class="form-group">
              <div class="col-sm-4">
                  <b>Name</b> </div>
                  <div class="col-sm-8">
                       <input type="text" class="form-control" id="bname" name="bname" <%if("".equals(a1[13])||"null".equals(a1[13]) ){ %>placeholder="Name" <% }else {%> placeholder="<%=a1[13] %>" value="<%=a1[13]  %>" <% }%>>

                  </div>
                </div>
             
          <br>
            <div class="form-group">
              <div class="col-sm-4">
                  <b>Address1</b> </div>
                  <div class="col-sm-8">
                     <input type="text" class="form-control" id="baddress1" name="baddress1" <%if("".equals(a1[14])||"null".equals(a1[14]) ){ %>placeholder="Address1" <% }else {%> placeholder="<%=a1[14] %>" value="<%=a1[14]  %>" <% }%>>

                  </div>
                </div>
          <br>
               <div class="form-group">
              <div class="col-sm-4">
                  <b> </b> </div>
                  <div class="col-sm-8">
                     <input type="text" class="form-control" id="baddress2" name="baddress2" <%if("".equals(a1[15])||"null".equals(a1[15]) ){ %>placeholder="Address2" <% }else {%> placeholder="<%=a1[15] %>" value="<%=a1[15]  %>" <% }%>>

                  </div>
                </div>
          <br>
               <div class="form-group">
              <div class="col-sm-4">
                  <b></b> </div>
                  <div class="col-sm-8">
                     <input type="text" class="form-control" id="baddress3" name="baddress3" <%if("".equals(a1[16])||"null".equals(a1[16]) ){ %>placeholder="Address3" <% }else {%> placeholder="<%=a1[16] %>" value="<%=a1[16]  %>" <% }%>>

                  </div>
                </div>
          <br><br>  
          <div class="form-group">
              <div class="col-sm-4">
                  <b>contact 1</b> </div>
                  <div class="col-sm-8">
                     <input type="text" class="form-control" id="bcontact1" name="bcontact1" <%if("".equals(a1[17])||"null".equals(a1[17]) ){ %>placeholder="Contact1" <% }else {%> placeholder="<%=a1[17] %>" value="<%=a1[17]  %>" <% }%>>

                  </div>
                </div>
               <br><br>  <div class="form-group">
              <div class="col-sm-4">
                  <b>Contact</b> </div>
                  <div class="col-sm-8">
                     <input type="text" class="form-control" id="bcontact2" name="bcontact2" <%if("".equals(a1[18])||"null".equals(a1[18]) ){ %>placeholder="Contact2" <% }else {%> placeholder="<%=a1[18] %>" value="<%=a1[18]  %>" <% }%>>

                  </div>
                </div>
          <br><br> 
          
          <div class="form-group">
              <div class="col-sm-4">
                  <b>Distt</b> </div>
                  <div class="col-sm-8">
                     <input type="text" class="form-control" id="bdistt" name="bdistt" <%if("".equals(a1[20])||"null".equals(a1[20]) ){ %>placeholder="Dist" <% }else {%> placeholder="<%=a1[20] %>" value="<%=a1[20]  %>" <% }%>>

                  </div>
                </div>
                 <br><br>  <div class="form-group">
              <div class="col-sm-4">
                  <b>GSTIN</b> </div>
                  <div class="col-sm-8">
                     <input type="text" class="form-control" id="bgstin" name="bgstin" <%if("".equals(a1[23])||"null".equals(a1[23]) ){ %>placeholder="GST No" <% }else {%> placeholder="<%=a1[23] %>" value="<%=a1[23]  %>" <% }%>>

                  </div>
                </div>
                 <br><br>  <div class="form-group">
              <div class="col-sm-4">
                  <b>State</b> </div>
                  <div class="col-sm-8">
<select id="bstate" name="bstate" class="form-control" value="<%=(a1[21]) %>">
     <%if("".equals(a1[21])||"null".equals(a1[21]) ){ %> <option value="Madhya Pradesh & Code=23">Madhya Pradesh</option> <% }else {%>   <option value="<%=(a1[21]) %>"><%=(a1[21]) %></option> <% }%>                    
   
                        
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
        <div class="col-sm-6 invoice-col">
            <div class="box box-info"> 
                      <div class="box-header with-border">
              <h3 class="box-title">Ship to Party</h3>
              <h6 class="box-title pull-right"><input type="checkbox" name="sabop" value="true"> Same As BOP</h6>
            </div>
            <!-- /.box-header -->
           <div class="form-group">
              <div class="col-sm-4">
                  <b>Name</b> </div>
                  <div class="col-sm-8">
                       <input type="text" class="form-control" id="sname" name="sname" <%if("".equals(a1[25])||"null".equals(a1[25]) ){ %>placeholder="Name" <% }else {%> placeholder="<%=a1[25] %>" value="<%=a1[25]  %>" <% }%>>

                  </div>
                </div>
             
          <br>
            <div class="form-group">
              <div class="col-sm-4">
                  <b>Address1</b> </div>
                  <div class="col-sm-8">
                     <input type="text" class="form-control" id="saddress1" name="saddress1" <%if("".equals(a1[26])||"null".equals(a1[26]) ){ %>placeholder="Address1" <% }else {%> placeholder="<%=a1[26] %>" value="<%=a1[26]  %>" <% }%>>

                  </div>
                </div>
          <br>
               <div class="form-group">
              <div class="col-sm-4">
                  <b> </b> </div>
                  <div class="col-sm-8">
                     <input type="text" class="form-control" id="saddress2" name="saddress2" <%if("".equals(a1[27])||"null".equals(a1[27]) ){ %>placeholder="Address2" <% }else {%> placeholder="<%=a1[27] %>" value="<%=a1[27]  %>" <% }%>>

                  </div>
                </div>
          <br>
               <div class="form-group">
              <div class="col-sm-4">
                  <b></b> </div>
                  <div class="col-sm-8">
                     <input type="text" class="form-control" id="saddress3" name="saddress3" <%if("".equals(a1[28])||"null".equals(a1[28]) ){ %>placeholder="Address3" <% }else {%> placeholder="<%=a1[28] %>" value="<%=a1[28]  %>" <% }%>>

                  </div>
                </div>
               <br><br>  <div class="form-group">
              <div class="col-sm-4">
                  <b>contact 1</b> </div>
                  <div class="col-sm-8">
                     <input type="text" class="form-control" id="scontact1" name="scontact1" <%if("".equals(a1[29])||"null".equals(a1[29]) ){ %>placeholder="Contact1" <% }else {%> placeholder="<%=a1[29] %>" value="<%=a1[29]  %>" <% }%>>

                  </div>
                </div>
               <br><br>  <div class="form-group">
              <div class="col-sm-4">
                  <b>Contact</b> </div>
                  <div class="col-sm-8">
                     <input type="text" class="form-control" id="scontact2" name="scontact2" <%if("".equals(a1[30])||"null".equals(a1[30]) ){ %>placeholder="Contact2" <% }else {%> placeholder="<%=a1[30] %>" value="<%=a1[30]  %>" <% }%>>

                  </div>
                </div>
          <br><br>  <div class="form-group">
              <div class="col-sm-4">
                  <b>Distt</b> </div>
                  <div class="col-sm-8">
                     <input type="text" class="form-control" id="sdistt" name="sdistt" <%if("".equals(a1[32])||"null".equals(a1[32]) ){ %>placeholder="Dist" <% }else {%> placeholder="<%=a1[32] %>" value="<%=a1[32]  %>" <% }%>>

                  </div>
                </div>
                 <br><br>  <div class="form-group">
              <div class="col-sm-4">
                  <b>GSTIN</b> </div>
                  <div class="col-sm-8">
                     <input type="text" class="form-control" id="sgstin"  name="sgstin" <%if("".equals(a1[35])||"null".equals(a1[35]) ){ %>placeholder="GST NO" <% }else {%> placeholder="<%=a1[35] %>" value="<%=a1[35]  %>" <% }%>>

                  </div>
                </div>
                 <br><br>  <div class="form-group">
              <div class="col-sm-4">
                  <b>State</b> </div>
                  <div class="col-sm-8">
<select id="sstate" name="sstate" class="form-control" value="<%=(a1[33]) %>">
     <%if("".equals(a1[33])||"null".equals(a1[33]) ){ %> <option value="Madhya Pradesh & Code=23">Madhya Pradesh</option> <% }else {%>   <option value="<%=(a1[33]) %>"><%=(a1[33]) %></option> <% }%>                    
   
                        
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
	
 <div class="row">
     <div class="col-md-12">
		
		 <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Add Product Billing</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
          
                     <div class="box-body">
                   	  <div class="form-group">
                  <div class="col-sm-1">
                     <label for="inputEmail3" class="col-sm-1 control-label"> SN</label>
                  </div>
                        </div>	  <div class="form-group">
                  <div class="col-sm-3">
                     <label for="inputEmail3" class="col-sm-2 control-label"> Description</label>
                  </div>
                            </div> <div class="form-group">
                  <div class="col-sm-1">
                     <label for="inputEmail3" class="col-sm-2 control-label"> </label>
                  </div>
                                </div> <div class="form-group">
                  <div class="col-sm-1">
                     <label for="inputEmail3" class="col-sm-1 control-label"> QTY</label>
                  </div>
                                    </div>
                        <div class="form-group">
                  <div class="col-sm-2">
                     <label for="inputEmail3" class="col-sm-1 control-label"> Rate</label>
                  </div>
                                            </div>
                        
                        
                        <div class="form-group">
                  <div class="col-sm-1">
                     <label for="inputEmail3" class="col-sm-1 control-label"> Unit</label>
                  </div>
                                        </div> 
                                            <div class="form-group">
                  <div class="col-sm-2">
                     <label for="inputEmail3" class="col-sm-1 control-label" > Amount</label>
                  </div>
                                                </div>
    
                </div>
              <!-- /.box-body -->
               
			<% int j=71;
                         String inpro[]=new String[505];
                               for(int i=1;i<=iiil;i++){ 
                                   
                      
                        %>  
                              
                               <div class="box-body">
                                    <div class="form-group">
                  <div class="col-sm-1">
 <label for="inputEmail3" class="col-sm-1 control-label"> <%if("".equals(a1[j])||"null".equals(a1[j]) ){ %>- <% }else {%> <%=a1[j]  %> <% }%></label>
                  </div>
                                       </div><div class="form-group">
                  <div class="col-sm-3">
                     <label for="inputEmail3" class="col-sm-2 control-label"> <%if("".equals(a1[j+1])||"null".equals(a1[j+1]) ){ %>- <% }else {%> <%=a1[j+1]  %> <% }%></label>

                  </div>
                                           </div> <div class="form-group">
                  <div class="col-sm-1">
                     <label for="inputEmail3" class="col-sm-2 control-label"> <%if("".equals(a1[j+2])||"null".equals(a1[j+2]) ){ %> <% }else {%> <%=a1[j+2]  %> <% }%></label>

                  </div>
                                               </div> <div class="form-group">
                  <div class="col-sm-1">
                  <label for="inputEmail3" class="col-sm-1 control-label"> <%if("".equals(a1[j+3])||"null".equals(a1[j+3]) ){ %>- <% }else {%> <%=a1[j+3]  %> <% }%></label>

                  </div>
                                                   </div> <div class="form-group">
                  <div class="col-sm-2">
                      <label for="inputEmail3" class="col-sm-2 control-label"> <%if("".equals(a1[j+4])||"null".equals(a1[j+4]) ){ %>- <% }else {%> <%=a1[j+4]  %> <% }%></label>

                  </div>
                                                       </div> <div class="form-group">
                  <div class="col-sm-1">
                     <label for="inputEmail3" class="col-sm-2 control-label"> <%if("".equals(a1[j+5])||"null".equals(a1[j+5]) ){ %>- <% }else {%> <%=a1[j+5]  %> <% }%></label>

                  </div>
                                                           </div> <div class="form-group">
                  <div class="col-sm-2">
                      <label   for="inputEmail3" class="col-sm-2 control-label"> <%if("".equals(a1[j+6])||"null".equals(a1[j+6]) ){ %>- <% }else {%> <%=a1[j+6]  %> <% }%></label>

                  </div>
                                                               </div> <div class="form-group">
                  <div class="col-sm-1">
                      <a href="invoice.jsp?incid=<%=invoiceid %>&type=proinedit&sn=<%=a1[j]  %>" >  <i class="fa fa-edit"></i></a>
                      <a href="test.jsp?incid=<%=invoiceid %>&type=trsh&sn=<%=a1[j]  %>&max=<%=iiil  %>#sn" > <i class="fa fa-trash-o"></i> </a>
                  </div>
                                                                   </div>
    
                               </div>
              <!-- /.box-body -->
           <% j=j+7; } %>
            
		  <div class="box-body">
				 <div class="form-group">
                  <div class="col-sm-1">
                 <label for="inputEmail3" class="col-sm-1 control-label">  <%=iiil+1  %> </label>
        <input type="hidden" name="sn"   value="<%=iiil+1 %>">
                               
                  </div>
                </div>			  <div class="form-group">
                  <div class="col-sm-3">
                      <input type="text" class="form-control" id="description" name="description"  placeholder="Product Desc" value="">
                  <select   class="form-control" id="description" name="description1" >
<option  value="" >None</option>
<option  value="Tractor, Trally, Tanker HSN=998719">Tractor, Trally, Tanker</option>
<option  value="RO Plant HSN=998719">RO Plant</option>
<option  value="Pet Jar HSN=3923">Pet Jar</option>
<option  value="Bottle Cap HSN=39235010">Bottle Cap</option>
<option  value="Plastic Jug HSN=39231030">Plastic Jug</option>
<option  value="Plastic Jug Handle">Plastic Jug Handle</option>
<option  value="Plastic Null">Plastic Null</option>
<option  value="Plastic Jar Cap">Plastic Jar Cap</option>
                  </select>
                  </div>
                </div>
				 <div class="form-group">
                  <div class="col-sm-1">
                     <input type="text" class="form-control" id="hsncode" name="hsncode"  placeholder="HSNCODE">
                  </div>
                </div>
				 <div class="form-group">
                  <div class="col-sm-1">
                      <input type="text" class="form-control" id="qty" name="qty"  placeholder="1" value="1">
                  </div>
                </div>
		  <div class="form-group">
                  <div class="col-sm-2">
                      <input type="text" class="form-control" id="rate" name="rate"  placeholder="0" value="0" >
                  </div>
                </div>	
                <div class="form-group">
                  <div class="col-sm-2">
                 <select required=""  class="form-control" id="unit" name="unit">
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
</select>
                  </div>
                </div>
               
                 <div class="form-group">
                  <div class="col-sm-2">
                     --
                  </div>
                </div>
    
              </div>
              <!-- /.box-body -->
			  	 
			   <div class="box-footer clearfix">
                               <input type="hidden" name="pagetype" value="addproduct">
                                <input type="hidden" name="incid" value="<%=invoiceiddd %>">
             <button class="btn btn-sm btn-info btn-flat pull-right"  type="submit">Add Product-</button>
            </div>

			  
			  
          
          </div>
          <!-- /.box -->
        
		
		

        </div>
        <!--/.col (left) -->
		
		
		

</div> <!--/.row  -->
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
                <th>Add: CGST-
                  
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
                 <th>Total Amount(GST)
                  
                     

               </th>
               <td><strong><%if("".equals(a1[51])||"null".equals(a1[51]) ){ %><i class="fa fa-fw fa-rupee"></i>00.00  <input type="hidden" name="totalamount" value="00.00"><% }else {%> <i class="fa fa-fw fa-rupee"></i><%=a1[51]  %>  <input type="hidden" name="totalamount" value="<%=a1[51]  %>"><% }%></strong></td>
           
                </tr>
                 <tr>
                <th>Discount
                  
                   
               </th>
                <td> <input type="text" class="form-control" id="discount" name="discount" placeholder="<%=a1[52] %>" value="<%=a1[52] %>">
</td>
              </tr>
              <tr>
                <th>Net Amount:</th>
                <td><strong><%if("".equals(a1[54])||"null".equals(a1[54]) ){ %><i class="fa fa-fw fa-rupee"></i> 00.00 <input type="hidden" name="netamount" value="00.00"> <% }else {%><i class="fa fa-fw fa-rupee"></i> <%=a1[54]  %> <input type="hidden" name="netamount" value="<%=a1[54]  %>"> <% }%></strong></td>
             
              </tr>
              <tr>
                <th style="width:50%">Total Amount(in Words)</th>  
                <td><%if("".equals(a1[58])||"null".equals(a1[58]) ){ out.print(a1[57]); }else {out.print(a1[57]+" And "+a1[58]+ " Paise"); }%> Only</td>
                  
                  
              </tr>
              
            </table>
          </div>
          </div>
        
        
        
      </div>
      <!-- /.row -->
      <input type="hidden" name="down" value="true">
	    <div class="row no-print">
        <div class="col-xs-12">
            <a href="invoice/invoiceprint.jsp?incid=<%=invoiceid %>" target="_blank" class="btn btn-primary"><i class="fa fa-print"></i> Print</a>
          <button type="submit" class="btn btn-success pull-right"><i class="fa fa-credit-card"></i> Submit Payment
          </button>
          <button type="button" class="btn btn-primary pull-right" style="margin-right: 5px;">
            <i class="fa fa-download"></i> Generate PDF
          </button>
        </div>
      </div>
      </form>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <jsp:include page="dist/include/footer.jsp" />  
    <%    Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Leaving ivoiceedit.jsp------");
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
  $(function () {
      
     //Date picker
    $('#datepicker1').datepicker({
      autoclose: true
    })  
      
        })
  
</script>
<script>
  $(function () {
      
     //Date picker
    $('#datepicker2').datepicker({
      autoclose: true
    })  
      
        })
  
</script>
</body>
</html>
