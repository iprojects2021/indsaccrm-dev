
<%@page import="blezz.CommonUtility"%>
<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="blezz.Poul"%>
<%  HttpSession session1 = request.getSession(); String usercid_adminid=(String)session1.getAttribute("usercid_adminid");
 String usercid_id=(String)session1.getAttribute("usercid_id");
String key=request.getParameter("key");
String expensedate=request.getParameter("expensedate");
expensedate=CommonUtility.getTimeStampFromCalenderDate(expensedate);
if("approval".equals(key))
{  
    java.util.Date date=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());
        System.out.println(expensedate);
    java.sql.Timestamp expensedatee=java.sql.Timestamp.valueOf(expensedate);
        System.out.println(expensedatee);
String val=request.getParameter("val");
  try{
     Connection c=Poul.getConnectionCRM();

Statement st=c.createStatement(); 
     st.addBatch("update expense set   approvalstatus='Approved'  where id='"+val+"' and useradminid='"+usercid_adminid+"' ");
 ResultSet rs3;
     rs3 = st.executeQuery("select  max(id)  FROM expenselog  ");
  String SR="0";
      while(rs3.next())
        
          {SR=rs3.getString(1);
          
          }
          int  i = Integer.parseInt( SR ); 
           ++i;  
       
       
       String logstatus="Approval Status- Approved";
             st.addBatch("insert into expenselog values('"+i+"','"+sqlTime+"','','','"+expensedatee+"','','','','"+usercid_adminid+"','"+usercid_id+"','"+val+"','','','"+logstatus+"','','','','','','','','','','','','','','','','','','','')");
       
     st.executeBatch(); 
    Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+",id="+val+", Approval Status Approved Successfully");
       
      st.close();
      c.close();    }
        catch(Exception e)
        {
      String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n Ajax update File=ajxexpenseapproval.java , \n"
     + "LINE=45 \n update expense set  approvalstatus='Approved'   where id='"+val+"' and useradminid='"+usercid_adminid+"'  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      //EmergencyEmail.send(e,errormsg);
     
        }
%>
 <span class="label label-success">Approved</span>
  <% } %>                   