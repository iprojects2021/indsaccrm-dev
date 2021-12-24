<%@page import="log.Log"%>
<%@page import="email.EmergencyEmail"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="blezz.Poul"%>
<%@page import="blezz.Nd"%>
 

<% HttpSession session1 = request.getSession();
               String a1[]=new String[256];
                 String incid=request.getParameter("2a2e2a696e636964");
                 String drid=request.getParameter("2a2e2a64726964");
                 if(incid!=null){incid=Nd.Decrypt(incid);}
               String currency=(String)session1.getAttribute("usercid_currency"); 
              String usercid_adminid=(String)session1.getAttribute("usercid_adminid");
                              String fileName=null;
                  
                
              int iiil=0;
              try{
           
               Connection con=Poul.getConnectionCRM();
               PreparedStatement smt=con.prepareStatement("select * from invoice where id=? and useradminid=?");
               smt.setString(1,incid);
               smt.setString(2,usercid_adminid);
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
             con.close(); 
       
              }
               catch(Exception e){
                       e.printStackTrace();
                       }
               String a11[]=new String[256];
          
      
              try{
           
               Connection con=Poul.getConnectionCRM();
               PreparedStatement smt=con.prepareStatement("select * from invoiceseller where invoiceid=? and useradminid=?");
               smt.setString(1,incid);
               smt.setString(2,usercid_adminid);
               ResultSet rs=smt.executeQuery();
       
               while(rs.next()){
                   for(int i=1;i<60;i++){
                      a11[i]=(rs.getString(i)); 
               
                   }
               }  
      
            rs.close();
                  smt.close();
                  con.close();   }
      
               catch(Exception e){
                       e.printStackTrace();
                       }
              String invoicelogofile=menu.AdminDefaultValues.getAdminInvoiceLogo(usercid_adminid);
           
                            invoicelogofile=invoicelogofile.substring(0, invoicelogofile.length()-1);
            if("0".equals(invoicelogofile) || "".equals(invoicelogofile)) {fileName="../../dist/img/u.png";}else{fileName=invoicelogofile;}
             
              //System.out.println(al.size());
              String paymentinfo[]=new String[51];int i=0;
                try{
           
                         Connection con=Poul.getConnectionCRM();
                         PreparedStatement smt=con.prepareStatement("select * from paymentinfo where id=?");
                         smt.setString(1,drid);
                         ResultSet rs=smt.executeQuery();
       
                         while(rs.next()){
         for(i=1;i<=50;i++){
                         paymentinfo[i]=rs.getString(i);
                         }
                         } 
         
        
                    rs.close();
                            smt.close();
                            con.close();    }
                         catch(Exception e)
                         {
                          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoicef10.jsp-----\n"
     + "LINE=1461 + \n select * from paymentinfo where invoiceid="+incid+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);        
                                 } 
        %>


<html><head><link rel="shortcut icon" href="../dist/img/u.png" type="image/x-icon" /> 
        <title>Cash Receipt Print | INDSAC CRM</title>
        <link rel="stylesheet" href="../bower_components/font-awesome/css/font-awesome.min.css">
            
 <style>@page { size: A4 }</style>
        <!-- Ionicons -->
        <link rel="stylesheet" href="../bower_components/Ionicons/css/ionicons.min.css">

       
        <meta content="text/html; charset=UTF-8" http-equiv="content-type">
<style type="text/css">@import url('https://themes.googleusercontent.com/fonts/css?kit=fpjTOVmNbO4Lz34iLyptLUXza5VhXqVC6o75Eld_V98');ol{margin:0;padding:0}table td,table th{padding:0}.c35{border-right-style:solid;padding:0pt 5.4pt 0pt 5.4pt;border-bottom-color:#000000;border-top-width:1pt;border-right-width:1pt;border-left-color:#000000;vertical-align:top;border-right-color:#000000;border-left-width:1pt;border-top-style:solid;border-left-style:solid;
    border-bottom-width:1pt;width:198pt;border-top-color:#000000;border-bottom-style:solid}
    .c30{border-right-style:solid;padding:0pt 5.4pt 0pt 5.4pt;border-bottom-color:#000000;border-top-width:1pt;border-right-width:1pt;border-left-color:#000000;vertical-align:top;border-right-color:#000000;border-left-width:1pt;border-top-style:solid;border-left-style:solid;border-bottom-width:1pt;width:42.8pt;border-top-color:#000000;border-bottom-style:solid}
    .c20{border-right-style:solid;padding:0pt 5.4pt 0pt 5.4pt;border-bottom-color:#000000;border-top-width:1pt;border-right-width:1pt;border-left-color:#000000;vertical-align:top;border-right-color:#000000;border-left-width:1pt;border-top-style:solid;border-left-style:solid;border-bottom-width:1pt;width:111pt;border-top-color:#000000;border-bottom-style:solid}.c16{border-right-style:solid;padding:0pt 5.4pt 0pt 5.4pt;border-bottom-color:#000000;border-top-width:1pt;border-right-width:1pt;border-left-color:#000000;vertical-align:top;border-right-color:#000000;border-left-width:1pt;
                                                                                                                                                                                                        border-top-style:solid;border-left-style:solid;border-bottom-width:1pt;width:145.5pt;border-top-color:#000000;border-bottom-style:solid}.c26{border-right-style:solid;padding:0pt 5.4pt 0pt 5.4pt;border-bottom-color:#000000;border-top-width:1pt;border-right-width:1pt;border-left-color:#000000;vertical-align:top;
                                                                                                                                                                                                        border-right-color:#000000;border-left-width:1pt;border-top-style:solid;border-left-style:solid;border-bottom-width:1pt;width:42pt;border-top-color:#000000;border-bottom-style:solid}.c32{border-right-style:solid;padding:0pt 5.4pt 0pt 5.4pt;border-bottom-color:#000000;border-top-width:1pt;border-right-width:1pt;border-left-color:#000000;vertical-align:top;border-right-color:#000000;border-left-width:1pt;
                                                                                                                                                                                               border-top-style:solid;border-left-style:solid;border-bottom-width:1pt;width:36.8pt;border-top-color:#000000;border-bottom-style:solid}.c7{border-right-style:solid;padding:0pt 5.4pt 0pt 5.4pt;border-bottom-color:#000000;border-top-width:1pt;border-right-width:1pt;border-left-color:#000000;vertical-align:top;border-right-color:#000000;border-left-width:1pt;border-top-style:solid;border-left-style:solid;border-bottom-width:1pt;width:297.8pt;border-top-color:#000000;border-bottom-style:solid}.c17{border-right-style:solid;padding:0pt 5.4pt 0pt 5.4pt;border-bottom-color:#000000;border-top-width:1pt;border-right-width:1pt;border-left-color:#000000;vertical-align:top;border-right-color:#000000;border-left-width:1pt;border-top-style:solid;border-left-style:solid;border-bottom-width:1pt;width:59.2pt;border-top-color:#000000;border-bottom-style:solid}.c4{border-right-style:solid;padding:0pt 5.4pt 0pt 5.4pt;border-bottom-color:#000000;border-top-width:1pt;border-right-width:1pt;border-left-color:#000000;vertical-align:top;border-right-color:#000000;border-left-width:1pt;border-top-style:solid;border-left-style:solid;border-bottom-width:1pt;width:36pt;
       border-top-color:#000000;border-bottom-style:solid}.c0{border-right-style:solid;padding:0pt 5.8pt 0pt 5.8pt;border-bottom-color:#000000;border-top-width:1pt;border-right-width:1pt;border-left-color:#000000;vertical-align:top;border-right-color:#000000;border-left-width:1pt;border-top-style:solid;border-left-style:solid;border-bottom-width:1pt;width:592.5pt;border-top-color:#000000;border-bottom-style:solid}.c1{margin-left:18.8pt;padding-top:0pt;text-indent:-18.8pt;padding-bottom:0pt;line-height:1.1500000000000001;orphans:2;widows:2;text-align:left}.c24{color:#000000;font-weight:700;text-decoration:none;vertical-align:baseline;font-size:13pt;font-family:"Calibri";font-style:normal}.c19{color:#000000;font-weight:700;text-decoration:none;vertical-align:baseline;font-size:26pt;font-family:"Calibri";font-style:italic}.c2{color:#000000;font-weight:400;text-decoration:none;vertical-align:baseline;font-size:11pt;font-family:"Calibri";font-style:normal}.c5{padding-top:0pt;padding-bottom:0pt;line-height:1.0;orphans:2;widows:2;text-align:center;height:11pt}.c12{color:#000000;font-weight:700;text-decoration:none;vertical-align:baseline;font-size:11pt;font-family:"Calibri";font-style:normal}.c3{padding-top:0pt;padding-bottom:0pt;line-height:1.0;orphans:2;widows:2;text-align:left;height:11pt}.c11{color:#000000;font-weight:400;text-decoration:none;vertical-align:baseline;font-size:11pt;font-family:"Arial";font-style:normal}.c25{padding-top:0pt;padding-bottom:0pt;line-height:1.1500000000000001;orphans:2;widows:2;text-align:left;height:11pt}.c8{padding-top:0pt;padding-bottom:0pt;line-height:1.0;orphans:2;widows:2;text-align:center}
    .c37{color:#000000;text-decoration:none;vertical-align:baseline;font-size:8pt;font-family:"Calibri";font-style:normal}.c9{padding-top:0pt;padding-bottom:0pt;line-height:1.1500000000000001;orphans:2;widows:2;text-align:center}.c6{padding-top:0pt;padding-bottom:0pt;line-height:1.0;orphans:2;widows:2;text-align:left}.c13{padding-top:0pt;padding-bottom:0pt;line-height:1.15;text-align:left;height:11pt}.c14{margin-left:-61.8pt;border-spacing:0;border-collapse:collapse;margin-right:auto}.c10{margin-left:13.1pt;border-spacing:0;border-collapse:collapse;margin-right:auto}.c33{margin-left:13.3pt;border-spacing:0;border-collapse:collapse;margin-right:auto}.c38{background-color:#ffffff;max-width:468pt;padding:22.5pt 72pt 72pt 72pt}.c21{font-weight:700;font-style:italic}.c27{font-size:24pt;font-weight:700}.c34{height:14pt}.c31{font-size:13pt}.c28{font-weight:700}.c36{height:11pt}.c15{height:13pt}.c18{height:18pt}.c23{height:285pt}.c29{height:20pt}.c22{font-size:14pt}.title{padding-top:24pt;color:#000000;font-weight:700;font-size:36pt;padding-bottom:6pt;font-family:"Calibri";line-height:1.1500000000000001;page-break-after:avoid;orphans:2;widows:2;text-align:left}
    .subtitle{padding-top:18pt;color:#666666;font-size:24pt;padding-bottom:4pt;font-family:"Georgia";line-height:1.1500000000000001;page-break-after:avoid;font-style:italic;orphans:2;widows:2;text-align:left}li{color:#000000;font-size:11pt;font-family:"Calibri"}p{margin:0;color:#000000;font-size:11pt;font-family:"Calibri"}
    h1{padding-top:24pt;color:#000000;font-weight:700;font-size:24pt;padding-bottom:6pt;font-family:"Calibri";line-height:1.1500000000000001;page-break-after:avoid;orphans:2;widows:2;text-align:left}h2{padding-top:18pt;color:#000000;font-weight:700;font-size:18pt;padding-bottom:4pt;font-family:"Calibri";line-height:1.1500000000000001;page-break-after:avoid;orphans:2;widows:2;text-align:left}h3{padding-top:14pt;color:#000000;font-weight:700;font-size:14pt;padding-bottom:4pt;font-family:"Calibri";line-height:1.1500000000000001;page-break-after:avoid;orphans:2;widows:2;text-align:left}h4{padding-top:12pt;color:#000000;font-weight:700;font-size:12pt;padding-bottom:2pt;font-family:"Calibri";line-height:1.1500000000000001;
       page-break-after:avoid;orphans:2;widows:2;text-align:left}
    h5{padding-top:11pt;color:#000000;font-weight:700;font-size:11pt;padding-bottom:2pt;font-family:"Calibri";line-height:1.1500000000000001;page-break-after:avoid;orphans:2;widows:2;text-align:left}h6{padding-top:10pt;color:#000000;font-weight:700;font-size:10pt;padding-bottom:2pt;font-family:"Calibri";line-height:1.1500000000000001;page-break-after:avoid;orphans:2;widows:2;text-align:left}</style></head>
    <body class="c38 A4" onLoad="window.print()"><p class="c13"><span class="c11"></span></p><a id="t.6d4aeaf8600087338b14b5e63fae10a5fd4864d9">
     </a><a id="t.0"></a><table class="c14"><tbody><tr class="c23"><td class="c0" colspan="1" rowspan="1"><p class="c9"><span style="overflow: hidden; display: inline-block; margin: 0.00px 0.00px; border: 0.00px solid #000000; transform: rotate(0.00rad) translateZ(0px); -webkit-transform: rotate(0.00rad) translateZ(0px); width: 35.40px; height: 29.38px;">
   <img alt="" src="../uploads/logo/<%=invoicelogofile%>" style="width: 35.40px; height: 29.38px; margin-left: -0.00px; margin-top: -0.00px; transform: rotate(0.00rad) translateZ(0px); -webkit-transform: rotate(0.00rad) translateZ(0px);" title=""></span>
   <span class="c19"><%=a11[12]   %></span></p><p class="c8"><span class="c2"><%=a11[13]   %><%=","+a11[20]   %><%=a11[21]   %> <%=" "+a11[22]   %></span></p><p class="c9"><span class="c2"><%=a11[17]   %><%=" "+a11[18]   %>&nbsp;<% if(!"null".equals(a11[16])&&!"".equals(a11[16])){out.println("Web:"+a11[16]);} %>&nbsp;<% if(!"null".equals(a11[19])&&!"".equals(a11[19])){out.println("Email:"+a11[19]);} %> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></p><p class="c9"><span class="c27">Cash Receipt</span></p><p class="c1"><span class="c12">&nbsp; &nbsp; &nbsp; Invoice No. &nbsp; &nbsp; : #<%=a1[254]%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Date:<%=blezz.CommonUtility.getCalenderDateFromTimeStamp(paymentinfo[2])%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                     </p><p class="c1"><span class="c12">&nbsp; &nbsp; &nbsp;Cash Receipt &nbsp;: #<%=drid%></span></p>
                     <p class="c1"><span class="c28">&nbsp; &nbsp; &nbsp;Cash Received From</span><span>&nbsp;: &nbsp; <%=paymentinfo[7]%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="c12">of &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<i class="fa fa-fw fa-<%=currency%>"></i><%=paymentinfo[8]%>/-</span></p><p class="c1"><span class="c28">&nbsp; &nbsp; </span></p><a id="t.30c53a621760fd174989cc616b0097b0a40f3e96"></a><a id="t.1"></a>
                     <table class="c10">
                         <tbody><tr class="c18"><td class="c7" colspan="1" rowspan="3"><p class="c6"><span class="c28">Amount In Words: </span><span class="c2">
                                             
                                             <% 
                                             out.println(blezz.Poul.convert(Integer.valueOf(paymentinfo[8]))); %> 
                                             
                                             Only
                                         
                                         </span></p></td><td class="c20" colspan="1" rowspan="1"><p class="c6"><span class="c2"><strong>Description</strong></span></p></td><td class="c16" colspan="1" rowspan="1"><p class="c6"><span class="c2"><strong>Amount</strong></span></p></td></tr><tr class="c29"><td class="c20" colspan="1" rowspan="1"><p class="c6"><span class="c2">Amount Received</span></p></td><td class="c16" colspan="1" rowspan="1"><p class="c6"><span class="c2"><i class="fa fa-fw fa-<%=currency%>"></i><%=paymentinfo[8]%>/-</span></p></td></tr><tr class="c34"><td class="c20" colspan="1" rowspan="1"><p class="c6"><span class="c2">Amount Balance</span></p></td><td class="c16" colspan="1" rowspan="1"><p class="c6"><span class="c2"><i class="fa fa-fw fa-<%=currency%>"></i><%=paymentinfo[12]%>/-</span></p></td></tr></tbody></table><p class="c1 c36"><span class="c28 c37"></span></p><p class="c1"><span class="c28 c31">&nbsp; &nbsp; &nbsp; &nbsp;Payment Received in: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;    </span><span class="c21 c22"><%=a11[13]   %></span><span class="c24">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></p><a id="t.1fae0d20fc653f3f5809ed55b8c7c8c038bf54b0"></a><a id="t.2"></a><table class="c33"><tbody><tr class="c15"><td class="c30" colspan="1" rowspan="1"><p class="c8"><span class="c2"><%=paymentinfo[10]%></span></p></td><td class="c35" colspan="5" rowspan="1"><p class="c6"><span class="c2">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<%=paymentinfo[11]%></span></p></td></tr></tbody></table><p class="c8"><span class="c21">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span><span class="c28">Signed By</span><span class="c21">&nbsp;</span></p></td></tr></tbody></table><p class="c8"><span class="c2">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></p><p class="c25"><span class="c24"></span></p>
    </body></html>