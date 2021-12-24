<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="blezz.Poul"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Contact | INDSAC CRM</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
</head>
<body class="hold-transition skin-blue sidebar-mini">
       <%    
              out.print("1.Started        .");
         int ii=1,jj=0;
           String count123="0";
       try{   out.print("Entered in try       .");
          
            out.print("com.mysql is executed       .");
           Connection con=Poul.getConnectionCRM();
       out.print("connection drivermanager executed       .");
        PreparedStatement smt=con.prepareStatement("select * from employee  ");
         out.print("preparedstatement executed      .");
        ResultSet rs=smt.executeQuery();
         out.print("resultset executed      .");
        while(rs.next()){  count123=rs.getString(2); out.print("1."+count123+"    "); }
         out.print("while loop executed       .");
     con.close();
      out.print("con is closed      .");
    smt.close();  } 
       catch (SQLException ex) 
       {
    // handle any errors
    String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n contact1.jsp---"
           + "\n LINE=59 ";
         Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+ex);
       EmergencyEmail.send(ex,errormsg);
}
  out.print("2.Started        .");
       
     
         
      %>
       
   
			 





</body>
</html>
