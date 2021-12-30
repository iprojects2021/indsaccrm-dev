<%@page import="java.util.Enumeration"%>
<%@page import="java.net.NetworkInterface"%>
<%@page import="java.net.InetAddress"%>
<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
<%@page import="blezz.Db"%>
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
<body class="hold-transition login-page" onload="Captcha();">
        <%    Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" Entering login.jsp----------");
        
 HttpSession session1 = request.getSession();
 
 String type=Poul.escapeHtml(request.getParameter("type"));
  String validateuserotpemail="";      
    String a1="",a2="", a3=""; String email=Poul.escapeHtml(request.getParameter("email"));
    String loginemail=Poul.escapeHtml(request.getParameter("loginemail"));
      String loginpassword=Poul.escapeHtml(request.getParameter("loginpassword"));
      
 InetAddress addre=InetAddress.getLocalHost();
 String ipaddre=addre.getHostAddress();
 System.out.println("ipaddre="+ipaddre+", addre="+addre+", hostname="+addre.getHostName());
Enumeration en = NetworkInterface.getNetworkInterfaces();
while(en.hasMoreElements())
{
    NetworkInterface n = (NetworkInterface) en.nextElement();
    Enumeration ee = n.getInetAddresses();
    while (ee.hasMoreElements())
    {
        InetAddress i = (InetAddress) ee.nextElement();
          Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+"  login.jsp----------"+i.getHostAddress());
      
        System.out.println(i.getHostAddress());
    }
}
 String a111="",a222="",a333="";String blocked="";
         try{ 
       Connection con=Poul.getConnectionCRM();
       Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+"  login.jsp----------");
        PreparedStatement smt=con.prepareStatement("select blockedemail,status from blockedemails ");
        String ipadd=(String)request.getRemoteAddr();
        ResultSet rs=smt.executeQuery();
        while(rs.next()){
              a111=(rs.getString(1)); 
                a222=(rs.getString(2)); 
                
                System.out.println(a111+loginemail+" "+a222+" "+a333+email);
                
          if(ipadd.equals(a111))
                // Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+"  login.jsp----------IPaddress block:"+a111+" redirecting to homepage");
        //response.sendRedirect("/index.jsp");
          { blocked="YES";
                     Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+"  login.jsp----------IPaddress block:"+a111+", Email block:"+email+", loginemail block:"+loginemail+"redirecting to homepage");
     
          }
      } 
   rs.close();
      smt.close();
      con.close();     }
        catch(Exception e){
                 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n login.jsp-----\n"
                   + "\nLINE=99 \n select ipaddress,blockedemail,status from blockedemails ";
         Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
       EmergencyEmail.send(e,errormsg); 
        
        }
         if("YES".equals(blocked))
         {response.sendRedirect("https://indsaccrm.com/");}
            
       if("login".equals(type))
       { 
     String loginsha="";      try{ 
          Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+"  login.jsp----------"+loginemail+" inside login");
        
           
           loginsha=Poul.shahash(loginpassword);
           
           Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+"  login.jsp----------"+loginemail+" before connection");
        
        Connection con=Poul.getConnectionCRM();
        
        Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+"  login.jsp----------"+loginemail+" after connection");
        
        PreparedStatement smt=con.prepareStatement("select email,password from register where email=?");
        smt.setString(1,loginemail);
        ResultSet rs=smt.executeQuery();
        while(rs.next()){
            
               a1=(rs.getString(1)); 
                a2=(rs.getString(2)); 
                if(a1.equals(loginemail)){
            if(a1.equals(loginemail) )  
            {   a3=a2;
                a1="logintrue";
                validateuserotpemail="registered";
                 Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+"  login.jsp----------"+loginemail+" validateuserotpemail-registered");
        
                break;}
                }
                
               
        } 
       
        
   rs.close();
      smt.close();
      con.close();     }
        catch(Exception e){
                 String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \nlogin.jsp-----\n"
                   + "\nLINE=147 \n select email,password from register where email="+loginemail+" ";
         Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
       EmergencyEmail.send(e,errormsg); 
        }
         if("logintrue".equals(a1) && loginsha.equals(a3) ){
             Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" login.jsp---------- inside corect credential login"); 
      int usercid_id=0;
      String usercid_email="",useraccountype="",usercid_name="",usercid_adminid="",usercid_company="",usercid_website="";
     String ispaidadmin="false",getpaidinfo="",logoreflect="";
      String usercid_avatar="";String validateempid="";
        try{ 
           
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from register where email=?");
        smt.setString(1,loginemail);
        ResultSet rs=smt.executeQuery(); 
        while(rs.next()){
            
               usercid_id=(rs.getInt(1));
               
                usercid_name=(rs.getString(6));
                useraccountype=(rs.getString(10));
                validateempid=(rs.getString(17));
                usercid_avatar=(rs.getString(29));
                usercid_adminid=(rs.getString(38));
               } 
        if("employee".equals(useraccountype)){
        String ValidateEmpAccess[]=new String [51];
        out.print("ValidateEmpAccess 2:"+ValidateEmpAccess[11]);
        ValidateEmpAccess=Db.getValidateUserData(validateempid, usercid_adminid);
        session1.setAttribute("Customerread",ValidateEmpAccess[11] );session1.setAttribute("Customerwrite",ValidateEmpAccess[12] );
        session1.setAttribute("leadread",ValidateEmpAccess[13] );session1.setAttribute("leadwrite",ValidateEmpAccess[14] );
        session1.setAttribute("vendorread",ValidateEmpAccess[15] );session1.setAttribute("vendorwrite",ValidateEmpAccess[16] );
        session1.setAttribute("taskread",ValidateEmpAccess[17] );session1.setAttribute("taskwrite",ValidateEmpAccess[18] );
        session1.setAttribute("srread",ValidateEmpAccess[19] );session1.setAttribute("srwrite",ValidateEmpAccess[20] );
        session1.setAttribute("irread",ValidateEmpAccess[21] );session1.setAttribute("irwrite",ValidateEmpAccess[22] );
        session1.setAttribute("poread",ValidateEmpAccess[25] );session1.setAttribute("powrite",ValidateEmpAccess[26] );
        session1.setAttribute("emailread",ValidateEmpAccess[27] );session1.setAttribute("emailwrite",ValidateEmpAccess[28] );
       
        }
          smt=con.prepareStatement("select * from register where id=?");
        smt.setString(1,usercid_adminid);
         rs=smt.executeQuery(); 
        while(rs.next()){
            
               
               usercid_company=(rs.getString(5));
             
              
                usercid_website=(rs.getString(18));
                getpaidinfo=(rs.getString(40));
                logoreflect=(rs.getString(41));
               } 
        
    rs.close();
      smt.close();
      con.close();    }
        catch(Exception e){
                    String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \nlogin.jsp-----\n"
                   + "\nLINE=207 \n select * from register where id="+usercid_adminid+"and  select * from register where email="+loginemail+" ";
         Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
       EmergencyEmail.send(e,errormsg); 
         }
        if("Paid".equals(getpaidinfo)&& "Yes".equals(logoreflect)){ispaidadmin="true";}
        String cid=(String.valueOf(usercid_id));
        String owner=String.valueOf(cid)+":_:"+usercid_name;
             session1.setAttribute("usercid_avatar",usercid_avatar ); 
          session1.setAttribute("ownr",owner );
            session1.setAttribute("usercid_id", cid);
        session1.setAttribute("ispaidadmin", ispaidadmin);
         session1.setAttribute("usercid_email", loginemail);
        session1.setAttribute("useraccountype", useraccountype);
         session1.setAttribute("usercid_name", usercid_name);
        session1.setAttribute("usercid_adminid", usercid_adminid);
         session1.setAttribute("usercid_company", usercid_company);
        session1.setAttribute("usercid_website", usercid_website);
        String currency=menu.AdminDefaultValues.getInvoiceCurrency(usercid_adminid);
        System.out.println("Login currency="+currency);
        session1.setAttribute("usercid_currency", currency);
          response.sendRedirect("dashboard.jsp");
        }
         
         //condition will check if user is already registered in validateuser and has pending status or not
         if(!"registered".equals(validateuserotpemail)){ 
             String checkvalidateuseremail="",checkvalidateuserstatus="",matchvalidate="",checkvalidateuserotp="";
           try{
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select email,otp,status from validateuser where email=?");
        smt.setString(1,loginemail);
        ResultSet rs=smt.executeQuery();
        while(rs.next()){
            
               checkvalidateuseremail=(rs.getString(1)); 
               checkvalidateuserotp=(rs.getString(2));
               checkvalidateuserstatus=(rs.getString(3));
               
            if(checkvalidateuseremail.equals(loginemail))  {matchvalidate="true";}
            
        }
       
     rs.close();
      smt.close();
      con.close();   }
        catch(Exception e){
                        String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \nlogin.jsp-----\n"
                   + "\nLINE=251 \n select email,otp,status from validateuser where email="+loginemail+" ";
         Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
       EmergencyEmail.send(e,errormsg); 
       }
           if("true".equals(matchvalidate)&&"Pending".equals(checkvalidateuserstatus)){
             session1.setAttribute("email", loginemail);
        if(loginpassword.equals(checkvalidateuserotp)){session1.setAttribute("requestpwdtype", "newpassword");} else{session1.setAttribute("requestpwdtype", "requestotp");}
             session1.setAttribute("type", "validateotp");
        
          response.sendRedirect("validateuserotp.jsp");
           }
         }
        else { a2="loginfailed"; }
        if(a1!="logintrue"){type="register"; a3="notregistered";}   
       }
    if("submitregister".equals(type)){
       String fullname=Poul.escapeHtml(request.getParameter("fullname"));
        String password1=Poul.escapeHtml(request.getParameter("password1"));
        String password2=Poul.escapeHtml(request.getParameter("password2"));
        String pwd="";
        Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" Entering login.jsp----->SubmitRegister-----");
        try{
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select email from register where email=?");
        smt.setString(1,email);
        ResultSet rs=smt.executeQuery();
        while(rs.next()){
            
               a1=(rs.getString(1)); 
            if(a1.equals(email))  {a1="true";
              Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+"  login.jsp----->Email already in database-----"+email+";"+fullname);
       
            }
            
        }
       Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+ " ,"+request.getRemoteAddr()+" Entering login.jsp----->SubmitRegister-----try method");
    rs.close();
      smt.close();
      con.close();    }
        catch(Exception e){
                              String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \nlogin.jsp-----\n"
                   + "\nLINE=293 \n select email from register where email="+email+" ";
         Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
       EmergencyEmail.send(e,errormsg); 
       }
      /*  if("true".equals(a1)){
                 Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  login.jsp----->Email already in database-----"+email+";"+fullname);
       
            response.sendRedirect("login.jsp");} */
        if(a1!="true"){
        if(password1.equals(password2)){
                
         pwd=Poul.shahash(password1);
        }
       
        session.setAttribute("fullname", fullname);
        session.setAttribute("email", email);
        session.setAttribute("pwd", pwd);
            Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" Entering login.jsp----->SubmitRegister-----redirecting to registercheck.jsp"+email+";"+fullname);
     
     response.sendRedirect("registercheck.jsp");
     /*   out.print(pwd);
    
    */} type="";
      }  
if("register".equals(type)){
%>
<div class="register-box">
  <div class="register-logo">
     <a href="www.indsac.com"><b>INDSAC</b>-CRM</a>
 </div>

  <div class="register-box-body">
       <% if("notregistered".equals(a3)) { %>
       <p class="login-box-msg" style="color: #E60415"><%=loginemail %></br> not registered</p>

      <% }  %>
    <p class="login-box-msg">Register now </p>

    <form action="" onsubmit="return validateCaptcha()" method="post">
      <div class="form-group has-feedback">
          <input type="text" class="form-control"  id="fullname" name="fullname" placeholder="Full name" autocomplete="off">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
          <input type="email" class="form-control" id="email" name="email" placeholder="Email" autocomplete="off">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
          <input type="password" class="form-control" id="password1" name="password1" placeholder="Password" autocomplete="off">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
          <input type="password" class="form-control"  id="password2" name="password2" placeholder="Retype password" autocomplete="off">
        <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
      </div>
        <label>Captcha <span style="color:#F00;font-size:20px">*</span>:</label>
        
        
             <div class="form-group has-feedback">
       <input type="text" class="form-control" style="margin-bottom: 0px; width: 200px; height: 40px; font-size: 24px; font-weight: bolder; text-decoration: line-through; display: inline-block; background-color: rgb(178, 0, 255);" id="mainCaptcha" disabled="">
<button class="btn btn-success" type="button" style="display: inline-block;" id="refresh" onclick="Captcha();">Reset</button>
<div style="margin-top:10px; color: #D8000C; background-color: #FFBABA; border-radius: 7px;" id="log"></div>
 
<input style="margin-top:10px;" type="text" class="form-control" placeholder="Enter captcha" name="captcha" id="txtInput" autocomplete="off" required="">

      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
                I agree to the <a href="navigate/termsofuse.jsp">terms</a><input type="checkbox" name="checkboxagree">
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
            <input type="hidden" name="type" value="submitregister">
            <button  onclick="return validateForm()" class="btn btn-primary btn-block btn-flat" type="submit">Register</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

    <div class="social-auth-links text-center">
      <p>- OR -</p>
      
    </div>
<a href="" class="btn btn-danger btn-block btn-flat">Sign In</a>
    
  </div>
  <!-- /.form-box -->
</div>
<!-- /.register-box -->
<% }else{ %>
<div class="login-box">
  <div class="login-logo">
    <a href="www.indsac.com"><b>INDSAC</b>-CRM</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
      <% if("true".equals(a1)) { %>
      <p class="login-box-msg"><%=email %> already registered</p>

      <% }  %>
      
       <% if("loginfailed".equals(a2)&& "".equals(a3)) { %>
       <p class="login-box-msg" style="color: #E60415"> Login Failed !</p>

      <% }  %>
      <% String a=request.getParameter("a");
               if("success".equals(a)) { %>
               <p class="login-box-msg" style="color: #006600">Successful Registered </p>

      <% }  %>
    <p class="login-box-msg">Sign in to start </p>

    <form action="" method="post">
      <div class="form-group has-feedback">
          <input type="email" class="form-control" placeholder="Email" name="loginemail" id="loginemail" autocomplete="off">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
          <input type="password" class="form-control" placeholder="Password" name="loginpassword" id="loginpassword" autocomplete="off">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
          <input type="hidden" name="type" value="login">
                
        <!-- /.col -->
        <div class="col-xs-12">
            <button onclick="return validateForm1()" type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

    <div class="social-auth-links text-center">
        <p>- OR -</p><form action="" method="POST">
            <div class="col-xs-12"> <input type="<%="hidden" %>" name="<%="type" %>" value="<%="register" %>">
          <button type="submit" class="btn btn-danger btn-block btn-flat">Register</button>
      </div></form>
    </div>
    <!-- /.social-auth-links -->

   
    <a href="forgotpassword.jsp" class="text-center">I forgot my password</a>

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->
<% } %>
<div class="lockscreen-footer text-center">
    Copyright &copy; 2021 <b><a target="_blank" href="https://indsac.com" class="text-black">INDSAC SOFTECH</a></b><br>
    All rights reserved
  </div>

<!-- jQuery 3 -->
<script src="bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="plugins/iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
  function validateForm1(){
          if(document.getElementById("loginemail").value==""){
           alert("Enter Email ");
           document.getElementById("loginemail").focus();
           return false;
       }
        else
         if(document.getElementById("loginpassword").value==""){
           alert("Enter Password  ");
           document.getElementById("loginpassword").focus();
           return false;
       } 
      
      
       return true;
    }
      function validateForm(){
          if(document.getElementById("fullname").value==""){
           alert("Enter Full Name ");
           document.getElementById("fullname").focus();
           return false;
       }
        else
         if(document.getElementById("email").value==""){
           alert("Enter Email  ");
           document.getElementById("email").focus();
           return false;
       } 
       else
         if(document.getElementById("password1").value==""){
           alert("Enter Password  ");
           document.getElementById("password1").focus();
           return false;
       } 
      
        else if(document.getElementById("password2").value==""){
           alert("Enter Confirm Password ");
           document.getElementById("password2").focus();
           return false;
       }
       else if(document.getElementById("password1").value!=document.getElementById("password2").value){
           alert("Confirm Password does not match ");
           document.getElementById("password2").focus();
           return false;
       }else if(document.getElementById("password1").value!=""){
       
        var p = document.getElementById("password1").value,
        errors = [];
    if (p.length < 8) {
        errors.push("Your password must be at least 8 characters"); 
    }
    if (p.search(/[a-z]/i) < 0) {
        errors.push("Your password must contain at least one letter.");
    }
    if (p.search(/[0-9]/) < 0) {
        errors.push("Your password must contain at least one digit."); 
    }
    if (errors.length > 0) {
        alert(errors.join("\n"));
        return false;
    }
       
       }
      else if(document.getElementById("password2").value!=""){
       
        var p = document.getElementById("password2").value,
        errors = [];
    if (p.length < 8) {
        errors.push("Your confirm password must be at least 8 characters"); 
    }
    if (p.search(/[a-z]/i) < 0) {
        errors.push("Your confirm password must contain at least one letter.");
    }
    if (p.search(/[0-9]/) < 0) {
        errors.push("Your confirm password must contain at least one digit."); 
    }
    if (errors.length > 0) {
        alert(errors.join("\n"));
        return false;
    }
       
       }
      
       return true;
    }
</script>
 <script>function validateCaptcha(){
            document.getElementById('log').innerHTML = '';
            var string1 = removeSpaces(document.getElementById('mainCaptcha').value);
            var string2 = removeSpaces(document.getElementById('txtInput').value);
             
            if (string1 != string2 || string2 == ""){
                //Captcha();
                document.getElementById('log').innerHTML += '<span style="font-size:16px; padding: 25px;">Entered Invalid Captcha</span> ';
                return false;
            }
        }
        function Captcha(){
            var alpha = new Array('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','1','2','3','4','5','6','7','8','9','0');
            var i;
            for (i=0;i<6;i++){
                var a = alpha[Math.floor(Math.random() * alpha.length)];
                var b = alpha[Math.floor(Math.random() * alpha.length)];
                var c = alpha[Math.floor(Math.random() * alpha.length)];
                var d = alpha[Math.floor(Math.random() * alpha.length)];
                var e = alpha[Math.floor(Math.random() * alpha.length)];
                var f = alpha[Math.floor(Math.random() * alpha.length)];
                var g = alpha[Math.floor(Math.random() * alpha.length)];
            }
            var code = a + ' ' + b + ' ' + ' ' + c + ' ' + d + ' ' + e + ' '+ f + ' ' + g;
            document.getElementById("mainCaptcha").value = code
            var colors = ["#B40404", "#beb1dd", "#b200ff", "#faff00", "#0000FF", "#FE2E9A", "#FF0080", "#2EFE2E", ];
            var rand = Math.floor(Math.random() * colors.length);
            $('#mainCaptcha').css("background-color", colors[rand]);
 
        }
        function removeSpaces(string){
            return string.split(' ').join('');
        }</script>
</body>
</html>
