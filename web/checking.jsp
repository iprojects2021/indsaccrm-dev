<%@page import="email.SuccessfullRegistration"%>
<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
<%@page import="blezz.EmailSendingRegisterCode"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="blezz.Poul"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head> <link rel="shortcut icon" href="dist/img/u.png" type="image/x-icon" /> 
 
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
   Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Entering checking.jsp----------");
       
	
             String pwd=(String)  session.getAttribute("pwd");
           String fullname=(String)  session.getAttribute("fullname");
          
            String email=(String)  session.getAttribute("email");
        Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Entering checking.jsp----------Email:"+email+"-----Name:"+fullname+"");     
           String returnemailmethod=(String)  session.getAttribute("returnemailmethod");
          String m[] =new String [4];
          m=returnemailmethod.split(":");
        //  m[0]=code m[1]check   m[2]resultMessage
          
          String message=m[0];
          String code=m[1];
          String check= m[2];
       //   out.print(message+"    "+code+"    "+check);
          String type=request.getParameter("type");
          if("otpsubmit".equals(type)){
          
              String msg=null;
        java.util.Date date=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());  
        
      String SR=null;String checkemailexist="0";
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
           rs3 = st.executeQuery("select  *  FROM register where email='"+email+"' ");
    while(rs3.next())
        
          {checkemailexist=rs3.getString(1);
          
          } if(checkemailexist!=email){
            st.addBatch("insert into register values('"+i+"','"+sqlTime+"','lead','"+email+"','Business Name','"+fullname+"','"+pwd+"','','','admin','','','active','','','','','www.website.com','','','','','','','','','','','user.png','','','','','','','','','"+i+"','','','','','','','','','','','','')");
          }else{
                Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n Email found registered while inserting new email="+email+", redirecting to login.jsp ");
    response.sendRedirect("login.jsp?a=success");
          }
            
       st.executeBatch(); 
       SuccessfullRegistration.sendAdmin(fullname, email,"Admin");
        String requestcid=Integer.toString(i);
        
        session.setAttribute("usercid",requestcid);
        session.setAttribute("useraccounttype","admin");
        session.setAttribute("usertype","lead");
             msg="success";    
       
   rs3.close();
      st.close();
      c.close();      }
        catch(Exception e)
        { 
             String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n checking.jsp-----\n"
     + "LINE=100 \n insert into register values ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg); 
      
        }
        finally{
        
           // session.setAttribute("submitmsg",msg);
           // response.sendRedirect("newleads.jsp");
            if("success".equals(msg)){
               
        response.sendRedirect("login.jsp?a=success");
            }else{
               response.sendRedirect("login.jsp");
            }
        }
          
          
          
          }
          
         String resendotp="" ;
         resendotp=request.getParameter("resend");
         if("true".equals(resendotp)){
         String resendEmail=(String)session.getAttribute("email");
         String resendfullname=(String)session.getAttribute("fullname");
          Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  checking.jsp----------resendotp");
   
          String chec=EmailSendingRegisterCode.getEmailRegisterCode(resendEmail,resendfullname);
           Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  checking.jsp----------"+chec);
   
          session.setAttribute("returnemailmethod", chec);
         }
         
                 
       Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  checking.jsp----------Waiting for OTP from user");
       
          
%>

<div class="lockscreen-wrapper">
  <div class="lockscreen-logo">
    <a href="http://www.indsac.com" target="_blank"><b>INDSAC</b>-CRM</a>
  </div>
 <div class="register-box-body">
     <p class="login-box-msg">User Verification Step 1><strong> Step2</strong></p>
     <p class="login-box-msg"><%=check %> </p>
    <!-- <a href="checking.jsp?resend=true"><p class="login-box-msg">Resend OTP</p></a> 
    <p class="login-box-msg">Enter Security Code</p> -->

    <form action="" method="post">
      <div class="form-group has-feedback">
          <input type="text" class="form-control"  id="otp" name="otp" placeholder="Enter above security Code here" autocomplete="off">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
     
      <div class="row">
        
        <!-- /.col -->
        <div class="col-xs-12">
            <input type="hidden" name="type" value="otpsubmit">
            <button  onclick="return validateForm()" class="btn btn-primary btn-block btn-flat" type="submit">Register</button>
        </div>
       
        <!-- /.col -->
      </div>
    </form>

    

    
  </div>
  
  <div class="lockscreen-footer text-center">
    Copyright &copy; 2021 <b><a href="www.indsac.com" class="text-black">INDSAC SOFTECH</a></b><br>
    All rights reserved
  </div>
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
