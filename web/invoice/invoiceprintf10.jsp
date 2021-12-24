<%@page import="blezz.Nd"%>
<%@page import="java.math.RoundingMode"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="blezz.Poul"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet "%>
<html>
    <head>
        <link rel="shortcut icon" href="../dist/img/u.png" type="image/x-icon" /> 
        <title>Invoice Print | INDSAC CRM</title>
        <meta content="text/html; charset=UTF-8" http-equiv="content-type">
        <style type="text/css">
            @import url('https://themes.googleusercontent.com/fonts/css?kit=fpjTOVmNbO4Lz34iLyptLTi9jKYd1gJzj5O2gWsEpXol-nTHck7FFkZplK5meosG');
            ol{margin:0;padding:0}
            table td,table th{padding:0}.c5{border-right-style:solid;padding:0pt 5.4pt 0pt 5.4pt;border-bottom-color:#000000;border-top-width:1pt;border-right-width:1pt;border-left-color:#000000;vertical-align:top;border-right-color:#000000;border-left-width:1pt;border-top-style:solid;background-color:#d9d9d9;border-left-style:solid;border-bottom-width:1pt;width:47.6pt;border-top-color:#000000;border-bottom-style:solid}.c20{border-right-style:solid;padding:0pt 5.4pt 0pt 5.4pt;border-bottom-color:#000000;border-top-width:1pt;border-right-width:1pt;border-left-color:#000000;vertical-align:top;border-right-color:#000000;border-left-width:1pt;border-top-style:solid;background-color:#d9d9d9;border-left-style:solid;border-bottom-width:1pt;width:155.8pt;border-top-color:#000000;border-bottom-style:solid}.c25{border-right-style:solid;padding:0pt 5.4pt 0pt 5.4pt;border-bottom-color:#000000;border-top-width:1pt;border-right-width:1pt;border-left-color:#000000;vertical-align:top;border-right-color:#000000;border-left-width:1pt;border-top-style:solid;background-color:#d9d9d9;border-left-style:solid;border-bottom-width:1pt;width:263.6pt;border-top-color:#000000;border-bottom-style:solid}.c17{border-right-style:solid;padding:0pt 5.4pt 0pt 5.4pt;border-bottom-color:#000000;border-top-width:1pt;border-right-width:1pt;border-left-color:#000000;vertical-align:top;border-right-color:#000000;border-left-width:1pt;border-top-style:solid;background-color:#d9d9d9;border-left-style:solid;border-bottom-width:1pt;width:303.4pt;border-top-color:#000000;border-bottom-style:solid}.c8{border-right-style:solid;padding:0pt 5.4pt 0pt 5.4pt;border-bottom-color:#000000;border-top-width:1pt;border-right-width:1pt;border-left-color:#000000;vertical-align:top;border-right-color:#000000;border-left-width:1pt;border-top-style:solid;background-color:#d9d9d9;border-left-style:solid;border-bottom-width:1pt;width:58.3pt;border-top-color:#000000;border-bottom-style:solid}.c24{border-right-style:solid;padding:0pt 5.4pt 0pt 5.4pt;border-bottom-color:#000000;border-top-width:1pt;border-right-width:1pt;border-left-color:#000000;vertical-align:top;border-right-color:#000000;border-left-width:1pt;border-top-style:solid;background-color:#d9d9d9;border-left-style:solid;border-bottom-width:1pt;width:60.2pt;border-top-color:#000000;border-bottom-style:solid}.c19{border-right-style:solid;padding:0pt 5.4pt 0pt 5.4pt;border-bottom-color:#000000;border-top-width:1pt;border-right-width:1pt;border-left-color:#000000;vertical-align:top;border-right-color:#000000;border-left-width:1pt;border-top-style:solid;border-left-style:solid;border-bottom-width:1pt;width:126.5pt;border-top-color:#000000;border-bottom-style:solid}.c4{border-right-style:solid;padding:0pt 5.4pt 0pt 5.4pt;border-bottom-color:#000000;border-top-width:1pt;border-right-width:1pt;border-left-color:#000000;vertical-align:top;border-right-color:#000000;border-left-width:1pt;border-top-style:solid;border-left-style:solid;border-bottom-width:1pt;width:82.8pt;border-top-color:#000000;border-bottom-style:solid}.c35{border-right-style:solid;padding:0pt 5.4pt 0pt 5.4pt;border-bottom-color:#000000;border-top-width:1pt;border-right-width:1pt;border-left-color:#000000;vertical-align:top;border-right-color:#000000;border-left-width:1pt;border-top-style:solid;border-left-style:solid;border-bottom-width:1pt;width:303.4pt;border-top-color:#000000;border-bottom-style:solid}.c18{border-right-style:solid;padding:0pt 5.4pt 0pt 5.4pt;border-bottom-color:#000000;border-top-width:1pt;border-right-width:1pt;border-left-color:#000000;vertical-align:top;border-right-color:#000000;border-left-width:1pt;border-top-style:solid;border-left-style:solid;border-bottom-width:1pt;width:58.3pt;border-top-color:#000000;border-bottom-style:solid}.c10{border-right-style:solid;padding:0pt 5.4pt 0pt 5.4pt;border-bottom-color:#000000;border-top-width:1pt;border-right-width:1pt;border-left-color:#000000;vertical-align:top;border-right-color:#000000;border-left-width:1pt;border-top-style:solid;border-left-style:solid;border-bottom-width:1pt;width:35.8pt;border-top-color:#000000;border-bottom-style:solid}.c32{border-right-style:solid;padding:0pt 5.4pt 0pt 5.4pt;border-bottom-color:#000000;border-top-width:1pt;border-right-width:1pt;border-left-color:#000000;vertical-align:top;border-right-color:#000000;border-left-width:1pt;border-top-style:solid;border-left-style:solid;border-bottom-width:1pt;width:245.1pt;border-top-color:#000000;border-bottom-style:solid}.c12{border-right-style:solid;padding:0pt 5.4pt 0pt 5.4pt;border-bottom-color:#000000;border-top-width:1pt;border-right-width:1pt;border-left-color:#000000;vertical-align:top;border-right-color:#000000;border-left-width:1pt;border-top-style:solid;border-left-style:solid;border-bottom-width:1pt;width:107.8pt;border-top-color:#000000;border-bottom-style:solid}.c33{border-right-style:solid;padding:0pt 5.4pt 0pt 5.4pt;border-bottom-color:#000000;border-top-width:1pt;border-right-width:1pt;border-left-color:#000000;vertical-align:top;border-right-color:#000000;border-left-width:1pt;border-top-style:solid;border-left-style:solid;border-bottom-width:1pt;width:155.8pt;border-top-color:#000000;border-bottom-style:solid}.c36{border-right-style:solid;padding:0pt 5.4pt 0pt 5.4pt;border-bottom-color:#000000;border-top-width:1pt;border-right-width:1pt;border-left-color:#000000;vertical-align:top;border-right-color:#000000;border-left-width:1pt;border-top-style:solid;border-left-style:solid;border-bottom-width:1pt;width:567pt;border-top-color:#000000;border-bottom-style:solid}.c13{border-right-style:solid;padding:0pt 5.4pt 0pt 5.4pt;border-bottom-color:#000000;border-top-width:1pt;border-right-width:1pt;border-left-color:#000000;vertical-align:top;border-right-color:#000000;border-left-width:1pt;border-top-style:solid;border-left-style:solid;border-bottom-width:1pt;width:47.6pt;border-top-color:#000000;border-bottom-style:solid}.c55{border-right-style:solid;padding:0pt 5.4pt 0pt 5.4pt;border-bottom-color:#000000;border-top-width:1pt;border-right-width:1pt;border-left-color:#000000;vertical-align:top;border-right-color:#000000;border-left-width:1pt;border-top-style:solid;border-left-style:solid;border-bottom-width:1pt;width:263.6pt;border-top-color:#000000;border-bottom-style:solid}.c29{border-right-style:solid;padding:0pt 5.4pt 0pt 5.4pt;border-bottom-color:#000000;border-top-width:1pt;border-right-width:1pt;border-left-color:#000000;vertical-align:top;border-right-color:#000000;border-left-width:1pt;border-top-style:solid;border-left-style:solid;border-bottom-width:1pt;width:60.2pt;border-top-color:#000000;border-bottom-style:solid}.c22{border-right-style:solid;padding:0pt 5.4pt 0pt 5.4pt;border-bottom-color:#000000;border-top-width:1pt;border-right-width:1pt;border-left-color:#000000;vertical-align:top;border-right-color:#000000;border-left-width:1pt;border-top-style:solid;border-left-style:solid;border-bottom-width:1pt;width:321.9pt;border-top-color:#000000;border-bottom-style:solid}.c58{background-color:#ffffff;color:#000000;font-weight:400;text-decoration:none;vertical-align:baseline;font-size:10pt;font-family:"Calibri";font-style:normal}.c14{color:#000000;font-weight:400;text-decoration:none;vertical-align:baseline;font-size:11pt;font-family:"Calibri";font-style:normal}.c3{padding-top:0pt;padding-bottom:0pt;line-height:1.0;orphans:2;widows:2;text-align:left;height:11pt}.c34{color:#000000;font-weight:700;text-decoration:none;vertical-align:baseline;font-size:16pt;font-family:"Calibri";font-style:normal}.c9{color:#000000;font-weight:400;text-decoration:none;vertical-align:baseline;font-size:14pt;font-family:"Cambria";font-style:normal}.c15{color:#000000;font-weight:700;text-decoration:none;vertical-align:baseline;font-size:14pt;font-family:"Calibri";font-style:normal}.c41{color:#000000;font-weight:400;text-decoration:none;vertical-align:baseline;font-size:11pt;font-family:"Arial";font-style:normal}.c0{color:#000000;font-weight:400;text-decoration:none;vertical-align:baseline;font-size:14pt;font-family:"Calibri";font-style:normal}.c1{color:#000000;font-weight:400;text-decoration:none;vertical-align:baseline;font-size:16pt;font-family:"Calibri";font-style:normal}.c37{padding-top:0pt;padding-bottom:10pt;line-height:1.1500000000000001;orphans:2;widows:2;text-align:center}.c30{padding-top:0pt;padding-bottom:0pt;line-height:1.0;orphans:2;widows:2;text-align:center}.c6{padding-top:0pt;padding-bottom:0pt;line-height:1.0;orphans:2;widows:2;text-align:left}.c2{padding-top:0pt;padding-bottom:0pt;line-height:1.15;text-align:left;height:11pt}.c16{margin-left:-49.5pt;border-spacing:0;border-collapse:collapse;margin-right:auto}.c50{background-color:#ffffff;max-width:468pt;padding:49.5pt 72pt 49.5pt 72pt}.c31{font-size:26pt;font-style:italic;font-weight:700}.c51{font-size:16pt;color:#000000;font-weight:700}.c56{margin-left:27.2pt}.c21{height:27pt}.c47{height:57pt}.c38{height:8pt}.c52{margin-left:6.2pt}.c46{margin-right:21.6pt}.c60{font-size:14pt}.c7{height:12pt}.c11{height:9pt}.c45{height:20pt}.c53{margin-left:20.4pt}.c23{margin-left:264.2pt}.c39{margin-left:125pt}.c40{height:2pt}.c44{margin-left:26.6pt}.c28{height:11pt}.c57{height:10pt}.c26{background-color:#d9d9d9}.c49{height:14pt}.c61{height:34pt}.c42{margin-left:19.1pt}.c27{height:15pt}.c48{height:16pt}.c43{margin-left:10.2pt}.c59{height:13pt}.c54{height:53pt}.title{padding-top:24pt;color:#000000;font-weight:700;font-size:36pt;padding-bottom:6pt;font-family:"Calibri";line-height:1.1500000000000001;page-break-after:avoid;orphans:2;widows:2;text-align:left}.subtitle{padding-top:18pt;color:#666666;font-size:24pt;padding-bottom:4pt;font-family:"Georgia";line-height:1.1500000000000001;page-break-after:avoid;font-style:italic;orphans:2;widows:2;text-align:left}li{color:#000000;font-size:11pt;font-family:"Calibri"}p{margin:0;color:#000000;font-size:11pt;font-family:"Calibri"}h1{padding-top:24pt;color:#000000;font-weight:700;font-size:24pt;padding-bottom:6pt;font-family:"Calibri";line-height:1.1500000000000001;page-break-after:avoid;orphans:2;widows:2;text-align:left}h2{padding-top:18pt;color:#000000;font-weight:700;font-size:18pt;padding-bottom:4pt;font-family:"Calibri";line-height:1.1500000000000001;page-break-after:avoid;orphans:2;widows:2;text-align:left}h3{padding-top:14pt;color:#000000;font-weight:700;font-size:14pt;padding-bottom:4pt;font-family:"Calibri";line-height:1.1500000000000001;page-break-after:avoid;orphans:2;widows:2;text-align:left}h4{padding-top:12pt;color:#000000;font-weight:700;font-size:12pt;padding-bottom:2pt;font-family:"Calibri";line-height:1.1500000000000001;page-break-after:avoid;orphans:2;widows:2;text-align:left}h5{padding-top:11pt;color:#000000;font-weight:700;font-size:11pt;padding-bottom:2pt;font-family:"Calibri";line-height:1.1500000000000001;page-break-after:avoid;orphans:2;widows:2;text-align:left}h6{padding-top:10pt;color:#000000;font-weight:700;font-size:10pt;padding-bottom:2pt;font-family:"Calibri";line-height:1.1500000000000001;page-break-after:avoid;orphans:2;widows:2;text-align:left}</style>
        <link rel="stylesheet" href="images/normalize.min.css">

        <!-- Load paper.css for happy printing -->
        <link rel="stylesheet" href="images/paper.css">

        <!-- Set page size here: A5, A4 or A3 -->
        <!-- Set also "landscape" if you need -->
        <style>@page { size: A4 }</style>
        <% HttpSession session1 = request.getSession();
               String a1[]=new String[256];
                 String incid=request.getParameter("2a2e2a696e636964");
                 if(incid!=null){incid=Nd.Decrypt(incid);}
                               String usercid_adminid=(String)session1.getAttribute("usercid_adminid");
                              String fileName=null;
                  
                
              int iiil=0;
              try{
           
               Connection con=Poul.getConnectionCRM();
               PreparedStatement smt=con.prepareStatement("select * from invoice where id=?  and useradminid=?");
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
              System.out.println(fileName);
              //System.out.println(al.size());
        %>

    </head>
    <body class="c50" class="A4" onLoad="window.print()">
        <p class="c2">
            <span class="c41">

            </span></p>
        <a id="t.134f2cf2e3b07429a4c0fab1825f02cff2c00133"></a>
        <a id="t.0"></a>
        <table class="c16">
            <tbody>
                <tr class="c47">
                    <td class="c36" colspan="7" rowspan="1">
                        <p class="c30">
                            <span style="overflow: hidden; display: inline-block; margin: 0.00px 0.00px; border: 0.00px solid #000000; transform: rotate(0.00rad) translateZ(0px); -webkit-transform: rotate(0.00rad) translateZ(0px); width: 35.40px; height: 29.38px;"><img alt="" src="../uploads/logo/<%=fileName%>" style="width: 35.40px; height: 29.38px; margin-left: -0.00px; margin-top: -0.00px; transform: rotate(0.00rad) translateZ(0px); -webkit-transform: rotate(0.00rad) translateZ(0px);" title=""></span><span class="c31"><%=a11[12]   %></span></p>
                        <p class="c30 c46"><span class="c0"><%=a11[13]   %><%=","+a11[20]   %><%=a11[21]   %> <%=" "+a11[22]   %></span></p><p class="c6"><span class="c0">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  <%=" "+a11[23]   %><%=" "+a11[24]   %><%=" "+a11[25]   %><%=" "+a11[26]   %> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></p><p class="c6"><span class="c60">Mob. <%=a11[17]   %><%=" "+a11[18]   %> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <% if(!"null".equals(a11[16])&&!"".equals(a11[16])){out.println("Web:"+a11[16]);} %><% if(!"null".equals(a11[19])&&!"".equals(a11[19])){out.println("Email:"+a11[19]);} %></span></p></td></tr><tr class="c57"><td class="c36" colspan="7" rowspan="1"><p class="c30"><span class="c34"><%="GST:"+a11[15]   %></span></p></td></tr><tr class="c38"><td class="c26 c36" colspan="7" rowspan="1"><p class="c30"><span class="c51">



                                TAX INVOICE</span></p></td></tr><tr class="c7">
                    <td class="c32" colspan="3" rowspan="1"><p class="c6"><span class="c15">
                                Invoice No. &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; : &nbsp;#<%=a1[254]%> </span></p></td>


                    <td class="c22" colspan="4" rowspan="1"><p class="c6"><span class="c15">
                                Transporter &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: &nbsp;<%=a1[9]%> </span></p>

                    </td></tr><tr class="c11"><td class="c32" colspan="3" rowspan="1"><p class="c6"><span class="c15">
                                Invoice Date &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; : &nbsp; &nbsp;<%=a1[5]%> </span></p>



                    </td><td class="c22" colspan="4" rowspan="1"><p class="c6"><span class="c15">
                                Vehicle No &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: &nbsp;<%=a1[10]%></span></p>


                    </td></tr><tr class="c38"><td class="c32" colspan="3" rowspan="1"><p class="c6"><span class="c15">
                                Reverse Charge(Y/N) &nbsp;: &nbsp;<%=a1[6]%></span></p>


                    </td><td class="c22" colspan="4" rowspan="1"><p class="c6"><span class="c15">
                                L.R. No &amp; Date of Supply: &nbsp;<%=a1[11]%></span></p>

                    </td></tr><tr class="c28"><td class="c32" colspan="3" rowspan="1"><p class="c6"><span class="c15">
                                State &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;:<%=a1[7]%> &nbsp; &nbsp;</span></p><p class="c6"><span class="c15">

                                &nbsp;</span></p></td><td class="c22" colspan="4" rowspan="1"><p class="c6"><span class="c15">


                                Place of Supply &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: &nbsp;<%=a1[12]%></span></p>

                    </td></tr><tr class="c28"><td class="c32 c26" colspan="3" rowspan="1"><p class="c6"><span class="c34">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                Bill of Party</span></p></td><td class="c22 c26" colspan="4" rowspan="1"><p class="c6 c39"><span class="c34">

                                Ship to Party</span></p></td></tr><tr class="c54"><td class="c32" colspan="3" rowspan="1"><p class="c6"><span class="c0">


                                Name: <%=a1[13]%></span></p><p class="c6"><span class="c0">

                                Address:<%=a1[14]%></span></p><p class="c6"><span class="c0">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;

                                <%=a1[15]%></span></p><p class="c6"><span class="c0">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                <%=a1[16]%></span></p><p class="c6"><span class="c0">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;

                                <%=a1[17]%>&nbsp; <%=a1[18]%></span></p><p class="c6"><span class="c0">

                                Distt:<%=a1[20]%></span></p></td><td class="c22" colspan="4" rowspan="1"><p class="c6"><span class="c0">

                                Name:<%=a1[25]%></span></p><p class="c6"><span class="c0">

                                Address:<%=a1[26]%></span></p><p class="c6"><span class="c0">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 

                                <%=a1[27]%></span></p><p class="c6"><span class="c0">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                <%=a1[28]%></span></p><p class="c6"><span class="c0">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;

                                <%=a1[29]%>&nbsp;<%=a1[30]%></span></p><p class="c6"><span class="c0">
                                Distt:<%=a1[32]%></span></p></td></tr><tr class="c57"><td class="c32" colspan="3" rowspan="1"><p class="c6"><span class="c0">

                                GSTIN:<%=a1[23]%></span></p></td><td class="c22" colspan="4" rowspan="1"><p class="c6"><span class="c0">

                                GSTIN:<%=a1[35]%></span></p></td></tr><tr class="c7"><td class="c32" colspan="3" rowspan="1"><p class="c6"><span class="c0">

                                State: &nbsp; <%=a1[21]%> &nbsp; 

                            </span></p></td><td class="c22" colspan="4" rowspan="1"><p class="c6"><span class="c0">

                                State: &nbsp;<%=a1[33]%> &nbsp; 

                            </span></p></td></tr><tr class="c7"><td class="c10 c26" colspan="1" rowspan="1"><p class="c6"><span class="c34">

                                S/N</span></p></td><td class="c19 c26" colspan="1" rowspan="1"><p class="c6 c53"><span class="c34">
                                Product Description</span></p></td><td class="c4 c26" colspan="1" rowspan="1"><p class="c6 c44"><span class="c34">
                                HSN Code</span></p></td><td class="c8" colspan="1" rowspan="1"><p class="c6 c42"><span class="c34">
                                Qty.</span></p></td><td class="c24" colspan="1" rowspan="1"><p class="c6 c52"><span class="c34">
                                Rate</span></p></td><td class="c5" colspan="1" rowspan="1"><p class="c6 c43"><span class="c34">
                                Per.</span></p></td><td class="c20" colspan="1" rowspan="1"><p class="c6 c56"><span class="c34">
                                Amount</span></p></td></tr><tr class="c40">
                    <td class="c10" colspan="1" rowspan="2">


                        <% int j=71;for(int i=1;i<=iiil;i++){ %>  
                        <p class="c6"><span class="c9">

                                <%if("".equals(a1[j])||"null".equals(a1[j]) ){ %>- <% }else {%> <%=a1[j]  %> <% }%>

                            </span></p>

                        <% j=j+7; } %>
                        <p class="c3"><span class="c9"></span></p>
                    </td><td class="c19" colspan="1" rowspan="2">


                        <%  j=71;for(int i=1;i<=iiil;i++){ %>   
                        <p class="c6"><span class="c9">
                                <%if("".equals(a1[j+1])||"null".equals(a1[j+1]) ){ %>- <% }else {%> <%=a1[j+1]  %> <% }%>
                            </span></p>
                            <% j=j+7; } %>


                        <p class="c3 c23"><span class="c9"></span></p></td><td class="c4" colspan="1" rowspan="2">

                        <%  j=71;for(int i=1;i<=iiil;i++){ %>  
                        <p class="c6"><span class="c9">
                                <%if("".equals(a1[j+2])||"null".equals(a1[j+2]) ){ %>- <% }else {%> <%=a1[j+2]  %> <% }%>
                            </span></p>
                            <% j=j+7; } %>


                        <p class="c3"><span class="c9"></span></p></td><td class="c18" colspan="1" rowspan="2">

                        <%  j=71;for(int i=1;i<=iiil;i++){ %>  
                        <p class="c6"><span class="c9">
                                <%if("".equals(a1[j+3])||"null".equals(a1[j+3]) ){ %>- <% }else {%> <%=a1[j+3]  %> <% }%>
                            </span></p>
                            <% j=j+7; } %>

                        <p class="c3"><span class="c9"></span></p></td><td class="c29" colspan="1" rowspan="1">
                            <%  j=71;for(int i=1;i<=iiil;i++){ %>
                        <p class="c6"><span class="c9">
                                <%if("".equals(a1[j+4])||"null".equals(a1[j+4]) ){ %>- <% }else {%> <%=a1[j+4]  %> <% }%>
                            </span></p>
                            <% j=j+7; } %>


                        <p class="c3"><span class="c9"></span></p></td><td class="c13" colspan="1" rowspan="1">
                            <%  j=71;for(int i=1;i<=iiil;i++){ %>
                        <p class="c3"><span class="c9">
                                <%if("".equals(a1[j+5])||"null".equals(a1[j+5]) ){ %>- <% }else {%> <%=a1[j+5]  %> <% }%>
                            </span></p>
                            <% j=j+7; } %>

                        <p class="c3"><span class="c9"></span></p></td><td class="c33" colspan="1" rowspan="1">
                            <% int k=0; j=71;for(int i=1;i<=iiil;i++){ %>
                        <p class="c6"><span class="c9">
                                <%if("".equals(a1[j+6])||"null".equals(a1[j+6]) ){ %>- <% }else {%> <% out.print(a1[j+6]); k++;  %> <% }%>
                            </span></p>

                        <% j=j+7; } %>
                        <% int kl=0; for(kl=k;kl<=20;kl++){
                        %>  <p class="c3"><span class="c9">  </span></p>  <% } %>

                    </td></tr><tr class="c28"><td class="c12" colspan="2" rowspan="1"><p class="c3"><span class="c14"></span></p></td><td class="c33" colspan="1" rowspan="1"><p class="c3"><span class="c14"></span></p></td></tr><tr class="c57"><td class="c17" colspan="4" rowspan="2"><p class="c6"><span class="c14">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></p><p class="c30"><span class="c1">Bank Details</span></p></td><td class="c12" colspan="2" rowspan="1"><p class="c6"><span class="c0">

                                Total Amount</span></p></td><td class="c33" colspan="1" rowspan="1"><p class="c6"><span class="c0">
                                <%=a1[37]%></span></p></td></tr><tr class="c28"><td class="c12" colspan="2" rowspan="1"><p class="c6"><span class="c0">

                                P.F(<%=a1[41]%>%)</span></p></td><td class="c33" colspan="1" rowspan="1"><p class="c3"><span class="c0">
                                <%=a1[42]%></span></p></td></tr><tr class="c57"><td class="c35" colspan="4" rowspan="6"><p class="c6"><span class="c0">

                                Bank Name &nbsp; &nbsp;: <%=a11[39]   %></span></p>
                        <p class="c6"><span class="c0">Bank A/C No &nbsp;:<%=a11[40]   %></span></p>
                        <p class="c6"><span class="c0">Bank Add &nbsp; &nbsp; &nbsp; : <%=a11[41]   %></span></p>
                        <p class="c6"><span class="c0">Bank IFSC &nbsp; &nbsp; &nbsp; : <%=a11[42]   %></span></p>

                        <p class="c3"><span class="c15">Amount In Words:<%if("".equals(a1[58])||"null".equals(a1[58]) ){ out.print(a1[57]); }else {out.print(a1[57]+" And "+a1[58]+ " Paise"); }%> Only</span></p>
                        <p class="c6"><span class="c0"> &nbsp; &nbsp; &nbsp; </span></p>
                        <p class="c6"><span class="c0"> &nbsp; &nbsp; &nbsp; </span></p>

                        <% if(a1[52]!=null){ %>
                        <p class="c3"><span class="c15">+ Freight Charges </span></p>
                        <% } %>
                    </td><td class="c12" colspan="2" rowspan="1"><p class="c6"><span class="c0">

                                Add: CGST- &nbsp; &nbsp; (<%=a1[43]%>%)</span></p></td><td class="c33" colspan="1" rowspan="1"><p class="c6"><span class="c0">
                                <%=a1[44]%></span></p></td></tr><tr class="c28"><td class="c12" colspan="2" rowspan="1"><p class="c6"><span class="c0">
                                Add: SGST- &nbsp; &nbsp;(<%=a1[45]%> %)</span></p></td><td class="c33" colspan="1" rowspan="1"><p class="c6"><span class="c0">
                                <%=a1[46]%></span></p></td></tr><tr class="c27"><td class="c12" colspan="2" rowspan="1"><p class="c6"><span class="c0">
                                Add: IGST- &nbsp; &nbsp; &nbsp;(<%=a1[47]%>%)</span></p></td><td class="c33" colspan="1" rowspan="1"><p class="c6"><span class="c0">
                                <%=a1[48]%></span></p></td></tr><tr class="c48"><td class="c12" colspan="2" rowspan="1"><p class="c6"><span class="c15">
                                Total Amount</span></p></td><td class="c33" colspan="1" rowspan="1"><p class="c6"><span class="c15">
                                <%=a1[51]%></span></p></td></tr>
                <tr class="c45">
                    <td class="c12" colspan="2" rowspan="1"><p class="c6"><span class="c0">
                                Freight Chrg <!-- <%=a1[61]%> --></span></p></td><td class="c33" colspan="1" rowspan="1"><p class="c6"><span class="c0">
                                <%=a1[52]%></span></p></td></tr><tr class="c59"><td class="c12" colspan="2" rowspan="1"><p class="c6"><span class="c15">
                                Net Amount</span></p></td><td class="c33" colspan="1" rowspan="1"><p class="c6"><span class="c15">
                                <%=a1[54]%></span></p></td></tr><tr class="c7"><td class="c35" colspan="4" rowspan="1"><p class="c6"><span class="c0">

                                Certified that the particulars given above are true &amp; correct</span></p></td><td class="c25" colspan="3" rowspan="1"><p class="c6"><span class="c0">For: <%=a11[12]   %></span></p></td></tr><tr class="c49">
                    <td class="c17" colspan="4" rowspan="1">
                        <p class="c30"><span class="c0">Terms &amp; Condition</span></p></td><td class="c55" colspan="3" rowspan="2"><p class="c3"><span class="c0"></span></p><p class="c3"><span class="c0"></span></p></td></tr><tr class="c61"><td class="c35" colspan="4" rowspan="2"><p class="c6"><span class="c0">*Subject to Indore Jurisdiction.Amount has been roundup</span></p><p class="c6"><span class="c0">*Goods once sold will not be taken back</span></p><p class="c6"><span class="c0">*Please make cheques. </span></p><p class="c6"><span class="c0">*Payment Terms.</span></p></td></tr><tr class="c21"><td class="c25" colspan="3" rowspan="1"><p class="c30"><span class="c0">AUTHORISED SIGNATURE</span></p></td></tr></tbody></table><p class="c37"><span>Invoice generated from www.indsaccrm.com</span></p><p class="c37 c28"><span class="c14"></span></p></body></html>