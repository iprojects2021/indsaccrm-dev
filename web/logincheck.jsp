<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
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
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Login| INDSAC-CRM</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="IndsacCRM/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="IndsacCRM/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="IndsacCRM/bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="IndsacCRM/dist/css/AdminLTE.min.css">

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

<%  String check="null",pagetype="null",pwd="null";
    pagetype=request.getParameter("pagetype");
    pwd=request.getParameter("pwd");
         String a1[][]=new String[10][10];
        String requestid=(String)session.getAttribute("requestid");
    
       try{
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from employee ");
        
        ResultSet rs=smt.executeQuery();
        int i=1,j=0;
        while(rs.next()){
            for(j=1;j<7;j++)
            {
            a1[i][j]=rs.getString(j);
            
            }
              
            ++i;
        }
       
         
    rs.close();
      smt.close();
      con.close();    }
        catch(Exception e){
               String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n logincheck.jsp-----\n"
                   + "\nLINE=67 \n select * from employee ";
         Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
       EmergencyEmail.send(e,errormsg); 
                }
        finally{
        
           // session.setAttribute("submitmsg",msg);
           // response.sendRedirect("newleads.jsp");
            if((pwd).equals(a1[1][5])){
                
                HttpSession session1 = request.getSession(true);
                session1.setAttribute("ownr", a1[1][2]);
        response.sendRedirect("lead.jsp");
        
            }else{  
                 if((pwd).equals(a1[2][5])){
                      HttpSession session1 = request.getSession(true);
                session1.setAttribute("ownr", a1[2][2]);
        response.sendRedirect("lead.jsp");
            }else{
         
               response.sendRedirect("login1.jsp");
            }} 
            
            
      
       }     
                  
       //System.out.println(al.size());
      %>
 
</body>
</html>
