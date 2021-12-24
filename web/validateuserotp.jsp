<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
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
  <meta http-equiv="X-UA-Compatible" content="IE=edge"><link rel="shortcut icon" href="dist/img/u.png">
  <title>Login| INDSAC-CRM</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition lockscreen">
<!-- Automatic element centering -->
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
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   --  Entring validateuserotp.jsp---");
            
            String email=(String)  session.getAttribute("email");
          String message="";
           String sespagetype=(String)  session.getAttribute("type");
    String   requestpwdtype=(String)  session.getAttribute("requestpwdtype");
     
          String type=request.getParameter("type");
           if("otpsubmit".equals(type)){
                  String checkvalidateuseremail="",checkvalidateuserstatus="",matchvalidate="",checkvalidateuserotp="";
           String useradminid="",fullname="",usercid="";
                  try{
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select id,email,fullname,otp,useradminid,status from validateuser where email=?");
        smt.setString(1,email);
        ResultSet rs=smt.executeQuery();
        while(rs.next()){
            usercid=(rs.getString(1)); 
               checkvalidateuseremail=(rs.getString(2)); 
               fullname=(rs.getString(3));
               checkvalidateuserotp=(rs.getString(4));
               useradminid=(rs.getString(5));
               checkvalidateuserstatus=(rs.getString(6));
               
            if(checkvalidateuseremail.equals(email))  {matchvalidate="true";}
            
        }
       
     rs.close();
      smt.close();
      con.close();   }
        catch(Exception e){
                String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n validateuserotp.jsp-----\n"
     + "LINE=93 \n select id,email,fullname,otp,useradminid,status from validateuser where email="+email+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
                }
           String otp=request.getParameter("otp");
           if("true".equals(matchvalidate)&&"Pending".equals(checkvalidateuserstatus)&&(checkvalidateuserotp).equals(otp))
           {    session.setAttribute("usercid", usercid);
             
              session.setAttribute("fullname", fullname);
              session.setAttribute("useradminid", useradminid);
                   requestpwdtype="newpassword";
           }
           }
          
          
          
          if("passwordsubmit".equals(type)){
              
                   String checkvalidateuseremail="",checkvalidateuserstatus="",matchvalidate="",checkvalidateuserotp="";
           String useradminid="",fullname="",usercid="";
                  try{
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select id,email,fullname,otp,useradminid,status from validateuser where email=?");
        smt.setString(1,email);
        ResultSet rs=smt.executeQuery();
        while(rs.next()){
            usercid=(rs.getString(1)); 
               checkvalidateuseremail=(rs.getString(2)); 
               fullname=(rs.getString(3));
               checkvalidateuserotp=(rs.getString(4));
               useradminid=(rs.getString(5));
               checkvalidateuserstatus=(rs.getString(6));
               
            if(checkvalidateuseremail.equals(email))  {matchvalidate="true";}
            
        }
       
     rs.close();
      smt.close();
      con.close();   }
        catch(Exception e){
               String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n validateuserotp.jsp-----\n"
     + "LINE=136 \n select id,email,fullname,otp,useradminid,status from validateuser where email="+email+" ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
                }
           
            String password=request.getParameter("password");
           String confirmpassword=request.getParameter("confirmpassword");
         
         if(password.equals(confirmpassword)){password=Poul.shahash(password);} else{message="Password Not Matched"; }
              String msg=null;
        java.util.Date date=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());  
        
      String SR=null;
        try{
   Connection c=Poul.getConnectionCRM();

Statement st=c.createStatement();
           ResultSet rs3;
               rs3 = st.executeQuery("select  *  FROM register  ");
    while(rs3.next())
        
          {SR=rs3.getString(1);
          
          }
           int i = Integer.parseInt( SR ); 
           ++i; 
            st.addBatch("insert into register values('"+i+"','"+sqlTime+"','lead','"+email+"','Business Name','"+fullname+"','"+password+"','','','employee','','','active','','','','"+usercid+"','www.website.com','','','','','','','','','','','user.png','','','','','','','','','"+useradminid+"','','','','','','','','','','','','')");
      
            
       st.executeBatch(); 
      
        
  
    rs3.close();
      st.close();
      c.close();    
        }
        catch(Exception e)
        {
          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n validateuserotp.jsp-----\n"
     + "LINE=178 \n insert into register values "+useradminid+"";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
        }
        
          
        
        
        try{
       Connection con=Poul.getConnectionCRM();
      
     Statement   st=con.createStatement();
           String query = "update  validateuser set status='Verified' where id='"+usercid+"'";
          
            int count = st.executeUpdate(query);
       
       
    
             msg="success";   
        
    
      st.close();
      con.close();   } catch(Exception e)
        {
            String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n validateuserotp.jsp-----\n"
     + "LINE=203 \n update  validateuser set status='Verified' where id='"+usercid+"' ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
        }
        finally{
        
           // session.setAttribute("submitmsg",msg);
           // response.sendRedirect("newleads.jsp");
            if("success".equals(msg)){
               
        response.sendRedirect("login.jsp?a=success");
            }else{
                Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   -------Entring validateuserotp.jsp--------Redirecting To -----------login.jsp-------------");
               response.sendRedirect("login.jsp");
            }
        }
          
          }
%>

<div class="lockscreen-wrapper">
  <div class="lockscreen-logo">
    <a href="http://www.indsac.com" target="_blank"><b>INDSAC</b>-CRM</a>
  </div>
 <div class="register-box-body">
   <%  if("requestotp".equals(requestpwdtype)) { %>
     
    <p class="login-box-msg">Enter correct OTP Code</p>

    <form action="" method="post">
      <div class="form-group has-feedback">
          <input type="text" class="form-control"  id="otp" name="otp" placeholder="OTP Code" autocomplete="off">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
     
      <div class="row">
        
        <!-- /.col -->
        <div class="col-xs-12">
            <input type="hidden" name="type" value="otpsubmit">
            <button  onclick="return validateForm()" class="btn btn-primary btn-block btn-flat" type="submit">Submit</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

   <%  } %> 

    <%  if("newpassword".equals(requestpwdtype)) { %>
     
    <p class="login-box-msg">Enter Password</p>

    <form action="" method="post">
      <div class="form-group has-feedback">
          <input type="text" class="form-control"  id="password" name="password" placeholder="Password" autocomplete="off">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
        <div class="form-group has-feedback">
          <input type="text" class="form-control"  id="confirmpassword" name="confirmpassword" placeholder="Confirm Password" autocomplete="off">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
     
      <div class="row">
        
        <!-- /.col -->
        <div class="col-xs-12">
            <input type="hidden" name="type" value="passwordsubmit">
            <button  onclick="return validateForm1()" class="btn btn-primary btn-block btn-flat" type="submit">Register</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

   <%  } %> 
    
  </div>
  
      <jsp:include page="dist/include/footer.jsp" />  
<% Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Leaving validateuserotp.jsp------");
 
 %>
</div>
<!-- /.center -->

<!-- jQuery 3 -->
<script src="bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script>
   function validateForm(){
         if(document.getElementById("password").value==""){
           alert("Enter password ");
           document.getElementById("password").focus();
           return false;
       } }
   </script>
       
       
</body>
</html>
