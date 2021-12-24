<%-- 
    Document   : mobiledatasearch.jsp
    Created on : 13 Mar, 2021, 8:49:46 AM
    Author     : Dell
--%>
<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
<%@page import="blezz.Db"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="blezz.Poul"%>
<%@page import="blezz.Nd"%>
<%@page import="java.sql.Connection"%>
<%   String type=request.getParameter("id");
      if(request.getParameter("key")!=null && "mobile".equalsIgnoreCase(type) || "ap".equalsIgnoreCase(type) ) //get "key" variable from jquery & ajax  part this line "data:'key='+search" and check not null 
    {     HttpSession session1 = request.getSession(); // reuse existing
       
     String key=request.getParameter("key"); //get "key" variable store in created new "key" variable
        String wild="%" +key+ "%"; //remove "%" for use preparedstatement in query name like, and "key" variable store in "wild" variable for further use
          String usercid_adminid=(String)session1.getAttribute("usercid_adminid");
     
try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select id,customertype,mobile,alternatephone,phone from contact where useradminid=? AND  mobile LIKE?");
         smt.setString(1,usercid_adminid);
        smt.setString(2,wild);
        ResultSet rs=smt.executeQuery();
    
        while(rs.next())
        { 
           %>
           
           <option value="<%=(rs.getString("mobile"))%>"> <a href="https://indsac.com"></a></option>
           <option value="<%=(rs.getString("alternatephone"))%>"> <a href="https://indsac.com"></a></option>
              <option value="<%=(rs.getString("phone"))%>"> <a href="https://indsac.com"></a></option>
                <%
        }
       rs.close();
      smt.close();
      con.close();
          } catch(Exception e)
          { 
              String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n mobiledatasearch.jsp-----\n"
                  + "LINE=50 \n select id,customertype,mobile,alternatephone,phone from contact where useradminid="+usercid_adminid+" AND  mobile LIKE="+wild+" ";
         Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
       EmergencyEmail.send(e,errormsg); 
          }
      
       
      }

      
      
      //search for email
         if(request.getParameter("key")!=null && "email".equalsIgnoreCase(type)  ) //get "key" variable from jquery & ajax  part this line "data:'key='+search" and check not null 
    {     HttpSession session1 = request.getSession(); // reuse existing
       
     String key=request.getParameter("key"); //get "key" variable store in created new "key" variable
        String wild="%" +key+ "%"; //remove "%" for use preparedstatement in query name like, and "key" variable store in "wild" variable for further use
          String usercid_adminid=(String)session1.getAttribute("usercid_adminid");
      
try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select email1 from contact where useradminid=? AND  email1 LIKE?");
         smt.setString(1,usercid_adminid);
        smt.setString(2,wild);
        ResultSet rs=smt.executeQuery();
    
        while(rs.next())
        { 
           %>
           <option value="<%=(rs.getString("email1"))%>"> 
               
                <%
        }
       rs.close();
      smt.close();
      con.close();
          } catch(Exception e)
          { 
             String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n mobiledatasearch.jsp-----\n"
                  + "LINE=87 \n select email1 from contact where useradminid="+usercid_adminid+" AND  mobile LIKE="+wild+" ";
         Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
       EmergencyEmail.send(e,errormsg);  
          }
      
       
      }
      
      
      
      
      
%>
