<%-- 
    Document   : test
    Created on : Mar 18, 2018, 5:19:22 PM
    Author     : INDSAC
--%>

<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
<%@page import="java.math.RoundingMode"%>
<%@page import="java.math.BigDecimal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         
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
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   --  Entring test1.jsp---");
           
           String msg=null;  int iiil=0;
        String a1[]=new String[499];
          String b1[]=new String[140];
       String incid=request.getParameter("incid");
       String max=request.getParameter("max");
           String pagetype=Poul.escapeHtml(request.getParameter("type"));
           if(("trsh").equals(pagetype)){
              String sn=Poul.escapeHtml(request.getParameter("sn"));
              int imax=Integer.parseInt( max );
                int imaxxx=Integer.parseInt( max );
                imaxxx=imaxxx-1;
              
               int isn= Integer.parseInt( sn ); int j=isn;
               int nloop=((imax-isn)+1);
    imax=71+(imax*7);
    
        isn=7*(isn-1)+71; 
        
        out.print("incid="+incid);
        
          try{
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from ushaaiinvoice where id=?");
        smt.setString(1,incid);
        ResultSet rs=smt.executeQuery();
       
        while(rs.next()){
            for(int i=1;i<499;i++){
               a1[i]=(rs.getString(i)); 
            }} 
       } catch(Exception e){ 
           String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n test1.jsp-----\n"
     + "LINE=81 \n select * from ushaaiinvoice where id='"+incid+"' ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
       }
          int tdd=isn,jkl=0;
       
     String proamount="null",totalproamt="null",pf="",vpf="",cgst="",vcgst="",sgst="",vsgst="",igst="",vigst="",discount="",totalamount="",netamount="";
       String temp="";
         int colna=isn+6;
       proamount=a1[colna];totalproamt=a1[37];   
        BigDecimal iproamount=new BigDecimal(a1[colna]);
       BigDecimal itotalproamt=new BigDecimal( totalproamt );
           pf=a1[41]; vpf=a1[42];                 BigDecimal ipf=new BigDecimal( pf );BigDecimal ivpf=new BigDecimal( vpf );
           cgst=a1[43]; vcgst=a1[44];            BigDecimal icgst=new BigDecimal( cgst );BigDecimal ivcgst=new BigDecimal( vcgst );
            sgst=a1[45]; vsgst=a1[46];            BigDecimal isgst=new BigDecimal( sgst );BigDecimal ivsgst=new BigDecimal( vsgst );
            igst=a1[47]; vigst=a1[48];            BigDecimal iigst=new BigDecimal( igst );BigDecimal ivigst=new BigDecimal( vigst );
         totalamount=a1[51];    BigDecimal itotalamount=new BigDecimal( totalamount );
         discount=a1[52];       BigDecimal idiscount=new BigDecimal( discount );
         netamount=a1[54];    BigDecimal inetamount=new BigDecimal( netamount );
         BigDecimal hundred= new BigDecimal( "100" );
           itotalproamt=itotalproamt.subtract(iproamount);
         ipf=((itotalproamt.multiply(ipf))).divide(hundred);ipf = ipf.setScale(2, BigDecimal.ROUND_HALF_UP);
        
        icgst=((itotalproamt.multiply(icgst))).divide(hundred);icgst = icgst.setScale(2, BigDecimal.ROUND_HALF_UP);
         isgst=((itotalproamt.multiply(isgst))).divide(hundred);isgst = isgst.setScale(2, BigDecimal.ROUND_HALF_UP);
         iigst=((itotalproamt.multiply(iigst))).divide(hundred);iigst = iigst.setScale(2, BigDecimal.ROUND_HALF_UP);
        
        itotalamount=itotalproamt.add(ipf.add(icgst.add(isgst.add(iigst))));itotalamount = itotalamount.setScale(0, BigDecimal.ROUND_HALF_UP);
        String amtinwords="",amtinwordspaisa="";
        inetamount=itotalamount.add(idiscount);inetamount = inetamount.setScale(0, BigDecimal.ROUND_HALF_UP);
        amtinwords=Poul.convert(Integer.valueOf(itotalamount.intValue())); 
          BigDecimal result = inetamount.subtract(itotalamount.setScale(0, RoundingMode.FLOOR)).movePointRight(itotalamount.scale());    
        amtinwordspaisa=Poul.convert(Integer.valueOf(result.intValue()));
       
          try{
        Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/ushaaicrm","root","mysql");


Statement st=c.createStatement();
           ResultSet rs3;
               rs3 = st.executeQuery("select  *  FROM ushaaiinvoice where id='"+incid+"'  ");
  

         
        
         
  st.addBatch("update ushaaiinvoice set   ak_='"+itotalproamt +"',ap_='"+ipf +"',ar_='"+icgst +"',at_='"+isgst +"',av_='"+iigst +"',ay_='"+itotalamount +"',bb_='"+inetamount +"',be_='"+amtinwords +"',bf_='"+amtinwordspaisa +"'  where id='"+incid+"'");
    
            
       st.executeBatch(); 
       
               
       
        }
        catch(Exception e)
        {
           String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n test1.jsp-----\n"
     + "LINE=139 \n select  *  FROM ushaaiinvoice where id='"+incid+"'  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
        } 
           
        
           
           
           
       try{ Connection con=Poul.getConnectionCRM();
             PreparedStatement smt=con.prepareStatement("select * from ushaaiinvoice where id=?");
             smt.setString(1,incid);
              ResultSet rs=smt.executeQuery();
             while(rs.next()){
              for(int i=1;i<499;i++){a1[i]=(rs.getString(i)); }}  }
      catch(Exception e){  
          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n test1.jsp-----\n"
     + "LINE=156 \n select  *  FROM ushaaiinvoice where id='"+incid+"'  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      }
       jkl=Integer.parseInt( a1[tdd] );
       
       for(j=1;j<=nloop;j++){
           try{
        Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/ushaaicrm","root","mysql");


Statement st=c.createStatement();
           ResultSet rs3;
               rs3 = st.executeQuery("select  *  FROM ushaaiinvoice where id='"+incid+"'  ");
    ResultSetMetaData rsmd=rs3.getMetaData();

                 String clmname[]=new String[500];
         
         for(int i=isn;i<=imax;i++)
         {clmname[i]=rsmd.getColumnName(i);
            
         }
         if(nloop==1)
          {jkl=0; }
         
  st.addBatch("update ushaaiinvoice set   "+clmname[isn]+"='"+jkl+"',"+clmname[isn+1]+"='"+a1[isn+8]+"',"+clmname[isn+2]+"='"+a1[isn+9]+"',"+clmname[isn+3]+"='"+a1[isn+10]+"',"+clmname[isn+4]+"='"+a1[isn+11]+"',"+clmname[isn+5]+"='"+a1[isn+12]+"',"+clmname[isn+6]+"='"+a1[isn+13]+"'  where id='"+incid+"'");
    
            
       st.executeBatch(); 
       
             msg="success";    
       
        }
        catch(Exception e)
        {
            String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n test1.jsp-----\n"
     + "LINE=193 \n select  *  FROM ushaaiinvoice where id='"+incid+"'  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
        }
          isn=isn+7; 
          jkl=jkl+1;
          if(j==(nloop-1))
          {jkl=0; }
           
       }
           
        
           // session.setAttribute("submitmsg",msg);
           // response.sendRedirect("newleads.jsp");
            if("success".equals(msg)){
      response.sendRedirect("ushaaiinvoice.jsp?incid="+incid+"&sn="+imaxxx+"#sn");
            }else{
             Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   --  Entring test1.jsp-------Redirecting To--------lead.jsp-------");
               response.sendRedirect("lead.jsp");
            }
        
        
       
           }out.print(pagetype);
            if(("cashreceipt").equals(pagetype)){
                out.print("entered");
                String SR=null,check=null,receiptid=null;
                String contact=Poul.escapeHtml(request.getParameter("contact"));
                String owner=Poul.escapeHtml(request.getParameter("owner"));
                
                String depositorname=Poul.escapeHtml(request.getParameter("depositorname"));
                String amtreceived=Poul.escapeHtml(request.getParameter("amtreceived"));
                
                String mop=Poul.escapeHtml(request.getParameter("mop"));
                String payref=Poul.escapeHtml(request.getParameter("payref"));
                String dueamount=Poul.escapeHtml(request.getParameter("dueamount"));
                BigDecimal  tar= new BigDecimal( dueamount );
               BigDecimal  ar= new BigDecimal( amtreceived );
        String balance="0";
              BigDecimal  blance= new BigDecimal( balance );
             
              
             
               blance=tar.subtract(ar);
                java.util.Date date=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());
        
                 try{
        Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/ushaaicrm","root","mysql");


Statement st=c.createStatement();
   

 ResultSet rs3;
               rs3 = st.executeQuery("select  *  FROM paymentinfo  ");
    while(rs3.next())
        
          {SR=rs3.getString(1);
          check=rs3.getString(3);
          
          }
    
           int i = Integer.parseInt( SR ); 
           ++i;  
           
   st.addBatch("insert into paymentinfo values('"+i+"',"
                      + "'"+sqlTime+"',"
                      + "'0'," + "'"+owner+"'," + "'"+contact+"'," + "'"+incid+"',"   + "'"+depositorname+"',"  + "'"+amtreceived+"',"+ "'',"+ "'"+mop+"',"
                       + "'"+payref+"',"+ "'"+blance+"'," + "'',"  + "'',"+ "''," + "''," + "''," + "''," + "''," + "'',"
                        + "''," + "''," + "''," + "''," + "'',"
                       + "''," 
                      + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                          + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "''," 
                      + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                          + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                             + "'',"
                       + "'',"
                       + "'',"
                            + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "''," 
                      + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                          + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "''," 
                      + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                          + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "''," 
                             + "'',"
                       + "'',"
                       + "'',"
                            + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "''," 
                      + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                          + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "''," 
                      + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                          + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "''," 
                             + "'',"
                       + "'',"
                       + "'',"
                            + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "''," 
                      + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                          + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "''," 
                      + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                          + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "''," 
                             + "'',"
                       + "'',"
                       + "'',"
                            + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "''," 
                      + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                          + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "''," 
                      + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                          + "'',"
                      + "'',"
                       + "'',"
                       + "'',"
                          + "'',"
                       + "'',"
                       + "'',"
                       + "'',"
                        + "'',"
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
       st.executeBatch(); 
       out.print("success");
       receiptid=Integer.toString(i);
             msg="success";    
       
        }
        catch(Exception e)
        {
            String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n test1.jsp-----\n"
     + "LINE=741 \n select  *  FROM paymentinfo ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
            
        }
                  try{
        Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/ushaaicrm","root","mysql");


Statement st=c.createStatement();
st.addBatch("update ushaaiinvoice set   bk_='"+blance+"'   where id='"+incid+"'");
   
            
       st.executeBatch(); 
}
        catch(Exception e)
        {
          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n test1.jsp-----\n"
     + "LINE=760 \n update ushaaiinvoice set   bk_='"+blance+"'   where id='"+incid+"' ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
        }




                if("success".equals(msg)){
      response.sendRedirect("ushaaiinvoice.jsp?incid="+incid+"#sn");
            }else{
                    Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   --  Entring test1.jsp--------Redirecting To------lead.jsp-------");
               response.sendRedirect("lead.jsp");
            }
            }
           %>
        
        <h1>Hello World!</h1>
    </body>
</html>
