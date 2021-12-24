<%@page import="java.util.Random"%>
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
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge"><link rel="shortcut icon" href="dist/img/u.png">
  <title>Register Code| INDSAC-CRM</title>
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
<%    HttpSession session1 = request.getSession();
   Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Entering regitercheck.jsp----------");
       
	String msg="";
             String pwd=(String)  session1.getAttribute("pwd");
           String fullname=(String)  session1.getAttribute("fullname");
            
          
            String email=(String)  session1.getAttribute("email");
        Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" Entering regitercheck.jsp----------Email:"+email+"-----Name:"+fullname+"");     
           String usercode="";
          String type=request.getParameter("type");
          if("codesubmit".equals(type)){
               usercode=(String)  session1.getAttribute("usercode");
           String otp=request.getParameter("otp");
           if(otp.equals(usercode)){
           Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" Entering regitercheck.jsp----->SubmitRegister-----before getEmailRegisterCode"+email+";"+fullname);
        String chec=EmailSendingRegisterCode.getEmailRegisterCode(email,fullname);
             Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" Entering regitercheck.jsp----->SubmitRegister-----After getEmailRegisterCode chec="+chec);
       
        session.setAttribute("returnemailmethod", chec);
     response.sendRedirect("checking.jsp");
      
           }else{
                Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  regitercheck.jsp---Wrong Code-------Email:"+email+"-----Name:"+fullname+"  Wrong Code Entered:"+otp+", Correct Code:"+usercode);
           msg="error";
           }
            
        java.util.Date date=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());  
        
      String SR=null;
      
     
          
          
          
          }
          
        Random rand = new Random();
        int num1 = rand.nextInt(1000) ;int num2 = rand.nextInt(1000);
   int num3=num1+num2;
   session1.setAttribute("email", email);
    String Num3=Integer.toString(num3);
             session1.setAttribute("usercode",Num3 );    
       Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  regitercheck.jsp----------Waiting for OTP from user");
       
          
%>

<div class="lockscreen-wrapper">
  <div class="lockscreen-logo">
    <a href="http://www.indsac.com" target="_blank"><b>INDSAC</b>-CRM</a>
  </div>
 <div class="register-box-body">
     
     <p class="login-box-msg">Hi <%=fullname %>,</p>
     <% if("error".equals(msg)){       
           %>Wrong Code,Please register again<a href="https://indsaccrm.com/">Go</a><% }else {  %>
     <p class="login-box-msg">User Verification <strong>Step 1</strong> > Step2</p>
     <h3> <% 
   out.println(num1+" + "+num2+" = ");  %></h3>
     
   
  

    <form action="" method="post">
      <div class="form-group has-feedback">
          <input type="text" class="form-control"  id="otp" name="otp" placeholder="number" autocomplete="off">
       
      </div>
     
      <div class="row">
        
        <!-- /.col -->
        <div class="col-xs-12">
            <input type="hidden" name="type" value="codesubmit">
            <button  onclick="return validateForm()" class="btn btn-primary btn-block btn-flat" type="submit">Submit</button>
        </div>
       
        <!-- /.col -->
      </div>
    </form>

    <% } %>

    
  </div>
  
  <div class="lockscreen-footer text-center">
    Copyright &copy; 2018 <b><a href="www.indsac.com" class="text-black">INDSAC SOFTECH</a></b><br>
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
