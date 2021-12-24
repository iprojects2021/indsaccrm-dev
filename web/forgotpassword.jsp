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
  <title>Forgot Password| INDSAC-CRM</title>
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
   Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Entering forgotpassword.jsp----------");
       String forgot=request.getParameter("forgot"); 
       String message="";
       if(forgot!=null){
            try{
        String email=request.getParameter("email");
Connection c=Poul.getConnectionCRM();

Statement st=c.createStatement();
    st.addBatch("insert into forgetpassword(email,status,priority) values('"+email+"','open','high')");
         st.executeBatch();    
            st.close();
      c.close(); 
            message="Our team will contact you soon on <strong>"+email+"</strong>";
            }
        catch(Exception e)
        { 
             String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n forgotpassword.jsp-----\n"
     + "LINE=100 \n insert into forgotpassword values ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
           
        }
       }
       
          
%>

<div class="lockscreen-wrapper">
  <div class="lockscreen-logo">
    <a href="http://www.indsac.com" target="_blank"><b>INDSAC</b>-CRM</a>
  </div>
 <div class="register-box-body">
     <%  if(message.length()>5){  %>
     <p class="login-box-msg"><%=message %></p>
     <% }else{ %>
     <p class="login-box-msg">Forgot Password</p>
     <p class="login-box-msg">Enter email address </p>
    <!-- <a href="checking.jsp?resend=true"><p class="login-box-msg">Resend OTP</p></a> 
    <p class="login-box-msg">Enter Security Code</p> -->

    <form action="" method="post">
      <div class="form-group has-feedback">
          <input type="email" class="form-control"  id="email" name="email" placeholder="Email" autocomplete="off">
          <input type="hidden" name="forgot" value="forgot">
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
<% } %>
    

    
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
         if(document.getElementById("email").value==""){
           alert("Enter Email ");
           document.getElementById("email").focus();
           return false;
       } }
   </script>
       
       
</body>
</html>
