<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
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
<html>
    <head>
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

<%   String cdata[]=new String[50];
              try{ Connection con=Poul.getConnectionCRM();
             PreparedStatement smt=con.prepareStatement("select * from mastertable  ");
             
              ResultSet rs=smt.executeQuery();
              int i=1,j=1;
              while(rs.next()){
                   
                      cdata[i]=(rs.getString(5));  
                      ++i;
              } rs.close();
           smt.close();
           con.close(); }
      catch(Exception e){  
          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoiceprintpreview.jsp-----\n"
     + "LINE=44 + \n select * from mastertable   ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      }   
          
            %>  
  
  
  
    </head><body class="c50" class="A4" ><p class="c2"><span class="c41"></span></p><a id="t.134f2cf2e3b07429a4c0fab1825f02cff2c00133"></a><a id="t.0"></a><table class="c16"><tbody><tr class="c47"><td class="c36" colspan="7" rowspan="1"><p class="c30"><span style="overflow: hidden; display: inline-block; margin: 0.00px 0.00px; border: 0.00px solid #000000; transform: rotate(0.00rad) translateZ(0px); -webkit-transform: rotate(0.00rad) translateZ(0px); width: 35.40px; height: 29.38px;"><img alt="" src="images/image1.jpg" style="width: 35.40px; height: 29.38px; margin-left: -0.00px; margin-top: -0.00px; transform: rotate(0.00rad) translateZ(0px); -webkit-transform: rotate(0.00rad) translateZ(0px);" title=""></span><span class="c31"> <%=cdata[8] %> </span></p><p class="c30 c46"><span class="c0"><%=cdata[9]+cdata[10] %></span></p><p class="c30 c46"><span class="c0"><%=cdata[16] %> <%=cdata[19] %>, <%=cdata[20] %> <%=cdata[21] %> <%=cdata[22] %> </span></p><p class="c6"><span class="c0">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></p><p class="c6"><span class="c60">Mob. <%=cdata[13] %>,<%=cdata[14]%> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Email- <%=cdata[15] %> </span></p></td></tr><tr class="c57"><td class="c36" colspan="7" rowspan="1"><p class="c30"><span class="c34">GSTIN : <%=cdata[11] %> </span></p></td></tr><tr class="c38"><td class="c26 c36" colspan="7" 9229221771,9039032327rowspan="1"><p class="c30"><span class="c51">
 <%
        String a1[]=new String[505];
          String incid=request.getParameter("incid");
       int iiil=0;
       try{
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from invoice where id=?");
        smt.setString(1,incid);
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
           con.close();    }
        catch(Exception e){
               String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n invoiceprintpreview.jsp-----\n"
     + "LINE=82 + \n select * from invoice where id="+incid+"  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
                }
       //System.out.println(al.size());
      %>
                            
                            
                            TAX INVOICE</span></p></td></tr><tr class="c7">
<td class="c32" colspan="3" rowspan="1"><p class="c6"><span class="c15">
            Invoice No. &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; : &nbsp;#<%="34555"%> </span></p></td>


<td class="c22" colspan="4" rowspan="1"><p class="c6"><span class="c15">
Transporter &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: &nbsp;<%=""%> </span></p>

</td></tr><tr class="c11"><td class="c32" colspan="3" rowspan="1"><p class="c6"><span class="c15">
Invoice Date &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; : &nbsp; &nbsp;<%="25/04/2020"%> </span></p>



</td><td class="c22" colspan="4" rowspan="1"><p class="c6"><span class="c15">
Vehicle No &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: &nbsp;<%="1116"%></span></p>


</td></tr><tr class="c38"><td class="c32" colspan="3" rowspan="1"><p class="c6"><span class="c15">
Reverse Charge(Y/N) &nbsp;: &nbsp;<%=""%></span></p>


</td><td class="c22" colspan="4" rowspan="1"><p class="c6"><span class="c15">
L.R. No &amp; Date of Supply: &nbsp;<%=""%></span></p>

</td></tr><tr class="c28"><td class="c32" colspan="3" rowspan="1"><p class="c6"><span class="c15">
State &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;:<%="M.P"%> &nbsp; &nbsp;</span></p><p class="c6"><span class="c15">

 &nbsp;</span></p></td><td class="c22" colspan="4" rowspan="1"><p class="c6"><span class="c15">


Place of Supply &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: &nbsp;<%="Bhopal"%></span></p>

</td></tr><tr class="c28"><td class="c32 c26" colspan="3" rowspan="1"><p class="c6"><span class="c34">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
 Bill of Party</span></p></td><td class="c22 c26" colspan="4" rowspan="1"><p class="c6 c39"><span class="c34">
 
 Ship to Party</span></p></td></tr><tr class="c54"><td class="c32" colspan="3" rowspan="1"><p class="c6"><span class="c0">
 
 
 Name: <%="Rahul Patil"%></span></p><p class="c6"><span class="c0">
 
 Address:<%="Om Nagar "%></span></p><p class="c6"><span class="c0">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
 
  <%=""%></span></p><p class="c6"><span class="c0">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
   <%=""%></span></p><p class="c6"><span class="c0">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
  
  <%=""%>&nbsp; <%=""%></span></p><p class="c6"><span class="c0">
  
  Distt:<%="Indore"%></span></p></td><td class="c22" colspan="4" rowspan="1"><p class="c6"><span class="c0">
  
  Name:<%="Sagar Patil"%></span></p><p class="c6"><span class="c0">
  
  Address:<%=""%></span></p><p class="c6"><span class="c0">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
  
  <%=""%></span></p><p class="c6"><span class="c0">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
  <%=""%></span></p><p class="c6"><span class="c0">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
  
   <%=""%>&nbsp;<%=""%></span></p><p class="c6"><span class="c0">
   Distt:<%="Indore"%></span></p></td></tr><tr class="c57"><td class="c32" colspan="3" rowspan="1"><p class="c6"><span class="c0">
   
   GSTIN:<%=""%></span></p></td><td class="c22" colspan="4" rowspan="1"><p class="c6"><span class="c0">
   
   GSTIN:<%=""%></span></p></td></tr><tr class="c7"><td class="c32" colspan="3" rowspan="1"><p class="c6"><span class="c0">
   
   State: &nbsp; <%="M.P"%> &nbsp; 
   
    </span></p></td><td class="c22" colspan="4" rowspan="1"><p class="c6"><span class="c0">
	
	State: &nbsp;<%="M.P"%> &nbsp; 
	
	</span></p></td></tr><tr class="c7"><td class="c10 c26" colspan="1" rowspan="1"><p class="c6"><span class="c34">
	
	S/N</span></p></td><td class="c19 c26" colspan="1" rowspan="1"><p class="c6 c53"><span class="c34">
	Product Description</span></p></td><td class="c4 c26" colspan="1" rowspan="1"><p class="c6 c44"><span class="c34">
	HSN Code</span></p></td><td class="c8" colspan="1" rowspan="1"><p class="c6 c42"><span class="c34">
	Qty.</span></p></td><td class="c24" colspan="1" rowspan="1"><p class="c6 c52"><span class="c34">
	Rate</span></p></td><td class="c5" colspan="1" rowspan="1"><p class="c6 c43"><span class="c34">
	Per.</span></p></td><td class="c20" colspan="1" rowspan="1"><p class="c6 c56"><span class="c34">
	Amount</span></p></td></tr><tr class="c40">
                <td class="c10" colspan="1" rowspan="2">
                    
                    
                    <% int j=71;for(int i=1;i<=15;i++){ %>  
                    <p class="c6"><span class="c9">
                            
                            <%=i  %>
                        
                        </span></p>
                   
                    <% j=j+7; } %>
                    <p class="c3"><span class="c9"></span></p>
                </td><td class="c19" colspan="1" rowspan="2">
                    
                    
                    <%  j=71;for(int i=1;i<=15;i++){ %>   
                    <p class="c6"><span class="c9">
                        <%="Product"+i  %> </span></p>
                    <% j=j+7; } %>
        
                    
                    <p class="c3 c23"><span class="c9"></span></p></td><td class="c4" colspan="1" rowspan="2">
                   
                     <%  j=71;for(int i=1;i<=15;i++){ %>  
                    <p class="c6"><span class="c9">
                        <%="324"+i  %> </span></p>
                   <% j=j+7; } %>
                 
        
        <p class="c3"><span class="c9"></span></p></td><td class="c18" colspan="1" rowspan="2">
                    
                   <%  j=71;for(int i=1;i<=15;i++){ %>  
                    <p class="c6"><span class="c9">
                        <%=i  %></span></p>
                   <% j=j+7; } %>
        
        <p class="c3"><span class="c9"></span></p></td><td class="c29" colspan="1" rowspan="1">
                    <%  j=71;for(int i=1;i<=15;i++){ %>
                    <p class="c6"><span class="c9">
                        <%=i  %> </span></p>
                <% j=j+7; } %>
        
        
        <p class="c3"><span class="c9"></span></p></td><td class="c13" colspan="1" rowspan="1">
                    <%  j=71;for(int i=1;i<=15;i++){ %>
                    <p class="c3"><span class="c9">
                         <%="KG"  %></span></p>
                   <% j=j+7; } %>
        
        <p class="c3"><span class="c9"></span></p></td><td class="c33" colspan="1" rowspan="1">
                    <% int k=0; j=71;for(int i=1;i<=15;i++){ %>
                    <p class="c6"><span class="c9">
	 <%=i*i  %>                  </span></p>
       
	<% j=j+7; } %>
        <% int kl=0; for(kl=k;kl<=20;kl++){
                    %>  <p class="c3"><span class="c9">  </span></p>  <% } %>
        
      </td></tr><tr class="c28"><td class="c12" colspan="2" rowspan="1"><p class="c3"><span class="c14"></span></p></td><td class="c33" colspan="1" rowspan="1"><p class="c3"><span class="c14"></span></p></td></tr><tr class="c57"><td class="c17" colspan="4" rowspan="2"><p class="c6"><span class="c14">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></p><p class="c30"><span class="c1"><%=cdata[27] %></span></p></td><td class="c12" colspan="2" rowspan="1"><p class="c6"><span class="c0">
	
	Total Amount</span></p></td><td class="c33" colspan="1" rowspan="1"><p class="c6"><span class="c0">
                            
	<%=10567%></span></p></td></tr><tr class="c28"><td class="c12" colspan="2" rowspan="1"><p class="c6"><span class="c0">
	
	P.F(<%=""%>%)</span></p></td><td class="c33" colspan="1" rowspan="1"><p class="c3"><span class="c0">
	<%=""%></span></p></td></tr><tr class="c57"><td class="c35" colspan="4" rowspan="6"><p class="c6"><span class="c0">
	
	<%=cdata[28] %></span></p>
	<p class="c6"><span class="c0"><%=cdata[29] %></span></p>
	<p class="c6"><span class="c0"><%=cdata[30] %></span></p>
	<p class="c6"><span class="c0"><%=cdata[31] %></span></p> <br>
        
	<p class="c3"><span class="c15">Amount In Words:<%if("".equals(a1[58])||"null".equals(a1[58]) ){ out.print(a1[57]); }else {out.print(a1[57]+" And "+a1[58]+ " Paise"); }%> Only</span></p>
	<p class="c6"><span class="c0"> &nbsp; &nbsp; &nbsp; </span></p>
        <p class="c6"><span class="c0"> &nbsp; &nbsp; &nbsp; </span></p>
        
        <% if(a1[52]!=null){ %>
        <p class="c3"><span class="c15">+ Freight Charges </span></p>
	<% } %>
	</td><td class="c12" colspan="2" rowspan="1"><p class="c6"><span class="c0">
	
	Add: CGST- &nbsp; &nbsp; (<%="5"%>%)</span></p></td><td class="c33" colspan="1" rowspan="1"><p class="c6"><span class="c0">
	<%="5"%></span></p></td></tr><tr class="c28"><td class="c12" colspan="2" rowspan="1"><p class="c6"><span class="c0">
	Add: SGST- &nbsp; &nbsp;(<%="6"%> %)</span></p></td><td class="c33" colspan="1" rowspan="1"><p class="c6"><span class="c0">
	<%="6"%></span></p></td></tr><tr class="c27"><td class="c12" colspan="2" rowspan="1"><p class="c6"><span class="c0">
	Add: IGST- &nbsp; &nbsp; &nbsp;(<%="4"%>%)</span></p></td><td class="c33" colspan="1" rowspan="1"><p class="c6"><span class="c0">
	<%="4"%></span></p></td></tr><tr class="c48"><td class="c12" colspan="2" rowspan="1"><p class="c6"><span class="c15">
	Total Amount</span></p></td><td class="c33" colspan="1" rowspan="1"><p class="c6"><span class="c15">
	<%="12345"%></span></p></td></tr>
	<tr class="c45">
	<td class="c12" colspan="2" rowspan="1"><p class="c6"><span class="c0">
	Freight Chrg <!-- <%="60"%> --></span></p></td><td class="c33" colspan="1" rowspan="1"><p class="c6"><span class="c0">
	<%=140%></span></p></td></tr><tr class="c59"><td class="c12" colspan="2" rowspan="1"><p class="c6"><span class="c15">
	Net Amount</span></p></td><td class="c33" colspan="1" rowspan="1"><p class="c6"><span class="c15">
	<%="1200"%></span></p></td></tr><tr class="c7"><td class="c35" colspan="4" rowspan="1"><p class="c6"><span class="c0">
	
	Certified that the particulars given above are true &amp; correct</span></p></td><td class="c25" colspan="3" rowspan="1"><p class="c6"><span class="c0">For: <%=cdata[8] %></span></p></td></tr><tr class="c49">
            <td class="c17" colspan="4" rowspan="1">
                <p class="c30"><span class="c0">Terms &amp; Condition</span></p></td><td class="c55" colspan="3" rowspan="2"><p class="c3"><span class="c0"></span></p><p class="c3"><span class="c0"></span></p></td></tr><tr class="c61"><td class="c35" colspan="4" rowspan="2"><p class="c6"><span class="c0"><%=cdata[23] %></span></p><p class="c6"><span class="c0"> <%=cdata[24] %></span></p><p class="c6"><span class="c0"><%=cdata[25] %> </span></p><p class="c6"><span class="c0"><%=cdata[26] %></span></p></td></tr><tr class="c21"><td class="c25" colspan="3" rowspan="1"><p class="c30"><span class="c0">AUTHORISED SIGNATURE</span></p></td></tr></tbody></table><p class="c37"><span>This is computer generated invoice</span></p><p class="c37 c28"><span class="c14"></span></p></body></html>