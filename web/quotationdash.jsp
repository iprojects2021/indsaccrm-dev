<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
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
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="dist/img/u.png" type="image/x-icon" /> 
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Quotation Dashboard | INDSAC-CRM</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
  <link rel="stylesheet" href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">

  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

  
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<jsp:include page="dist/include/leftmenu.jsp" />  
 
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
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
            Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   --  Entring quotationdash.jsp---");
        
           
         int ii=1,jj=0;
           String count123="NULL";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from quotation where c_='1' ");
        
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count123=rs.getString(1);  }
       rs.close();
      smt.close();
      con.close(); } catch(Exception e){ 
           String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n quotationdash.jsp-----\n"
     + "LINE=75 \n select count(*) from quotation where c_='1' ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      }
      int n123=Integer.parseInt(count123);
       String leaddata[][]=new String[n123+1][55];
          try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from  quotation where c_='1' ");
        
        ResultSet rs=smt.executeQuery();
    
        while(rs.next())
        { 
           for(jj=1;jj<55;jj++)
        {
        leaddata[ii][jj]=rs.getString(jj);
        }
           ++ii;  
        }
    rs.close();
      smt.close();
      con.close();    } catch(Exception e){
          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n quotationdash.jsp-----\n"
     + "LINE=98 \n select * from quotation where c_='1' ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      }
      
       %>
    
    
    
   <%    
              
       
       
       
       
       
       
       String status=null,month=null,date=null,dbyear=null,dbday=null;
    int jan=0,feb=0,mar=0,apr=0,may=0,jun=0,jul=0,aug=0,sep=0,oct=0,nov=0,dec=0;
    int d1=0,d2=0,d3=0,d4=0,d5=0,d6=0,d7=0,d8=0,d9=0,d10=0,d11=0,d12=0,d13=0,d14=0,d15=0,d16=0,d17=0,d18=0,d19=0,d20=0,d21=0,d22=0,d23=0,d24=0,d25=0,d26=0,d27=0,d28=0,d29=0,d30=0,d31=0;
    int New=0,inprocess=0,hold=0,completed=0,canceled=0,none=0,totalleadcount=0;
    //New=Not attempted, inprocess=followup,hold=contacted,completed=new opportunity, concelled=additional contact,none=disqualified
    //int vh=0,cs=0,high=0,medium=0,normal=0,low=0,vl=0;
        Date date1 = Calendar.getInstance().getTime();  
                DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");  
                String systemdate = dateFormat.format(date1);  
         String contactsbymonth=request.getParameter("contactsbymonth");      
              java.util.Date date121=new java.util.Date();
        java.sql.Date sqlDate121=new java.sql.Date(date121.getTime());
       
                
               String curday121=sqlDate121.toString(); 
                String curyear=curday121.substring(0, 4);
                String curmonth=curday121.substring(5,7);
                String curday=curday121.substring(8,10);
                if(contactsbymonth != null && !contactsbymonth.isEmpty())
                 {curyear=contactsbymonth;}
                
 try{
   Connection con =Poul.getConnectionCRM();
   Statement smt=con.createStatement();
   ResultSet rs=smt.executeQuery("select * from quotation ");
    while(rs.next()){
       
        if(rs.getString("id")!=null&&!rs.getString("id").equals("")&&!rs.getString("id").equals("null")){
       totalleadcount++;
       date=rs.getString(2);
       dbyear=date.substring(0,4);
            month=date.substring(5,7);
            dbday=date.substring(8,10);
            
                              if(dbyear.equals(curyear)&&month.equals(curmonth))
                              {
                              if("01".equals(dbday)){ d1++;} 
                              else if("02".equals(dbday)){ d2++;}
                              else if("03".equals(dbday)){ d3++;}
                               else if("04".equals(dbday)){ d4++;}
                               else if("05".equals(dbday)){ d5++;}
                               else if("06".equals(dbday)){ d6++;}
                               else if("07".equals(dbday)){ d7++;}
                               else if("08".equals(dbday)){ d8++;}
                               else if("09".equals(dbday)){ d9++;}
                               else if("10".equals(dbday)){ d10++;} else if("11".equals(dbday)){ d11++;} else if("12".equals(dbday)){ d12++;} else if("13".equals(dbday)){ d13++;}
                               else if("14".equals(dbday)){ d14++;}
                               else if("15".equals(dbday)){ d15++;}
                               else if("16".equals(dbday)){ d16++;}
                               else if("17".equals(dbday)){ d17++;}
                               else if("18".equals(dbday)){ d18++;}
                               else if("19".equals(dbday)){ d19++;} else if("20".equals(dbday)){ d20++;}
                               else if("21".equals(dbday)){ d21++;}
                               else if("22".equals(dbday)){ d22++;}
                               else if("23".equals(dbday)){ d23++;}
                               else if("24".equals(dbday)){ d24++;}
                               else if("25".equals(dbday)){ d25++;}
                               else if("26".equals(dbday)){ d26++;}
                               else if("27".equals(dbday)){ d27++;}
                               else if("28".equals(dbday)){ d28++;}
                               else if("29".equals(dbday)){ d29++;} else if("30".equals(dbday)){ d30++;} else if("31".equals(dbday)){ d31++;} else{}
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              }
            
        if(month.equals("01")&& dbyear.equals(curyear)){
            jan++;
        }
        else if(month.equals("02")&& dbyear.equals(curyear)){
            feb++;
        }
        else if(month.equals("03")&& dbyear.equals(curyear)){
            mar++;
        }
        else if(month.equals("04")&& dbyear.equals(curyear)){
            apr++;
        }
        else if(month.equals("05")&& dbyear.equals(curyear)){
            may++;
        }
        else if(month.equals("06")&& dbyear.equals(curyear)){
            jun++;
        }
        else if(month.equals("07")&& dbyear.equals(curyear)){
            jul++;
        }
        else if(month.equals("08")&& dbyear.equals(curyear)){
            aug++;
        }
        else if(month.equals("09")&& dbyear.equals(curyear)){
            sep++;
        }
        else if(month.equals("10")&& dbyear.equals(curyear)){
            oct++;
        }
        else if(month.equals("11")&& dbyear.equals(curyear)){
            nov++;
        }
        else if(month.equals("12")&& dbyear.equals(curyear)){
            dec++;
        }
           //New=Not attempted, inprocess=followup,hold=contacted,completed=new opportunity, concelled=additional contact,none=disqualified
 
        status=rs.getString("id");
        
        if(status.equals("Not Attempted")){
            New++;
        }
        else if(status.equals("Follow Up")){
            inprocess++;
        }
        else if(status.equals("Contacted")){
            hold++;
        }
        else if(status.equals("New Opportunity")){
            completed++;
        }
        else if(status.equals("Additional Contact")){
            canceled++;
        }
        else if(status.equals("Disqualified")){
            none++;
        }
        
       
        }
    }
    con.close();
    smt.close();
 rs.close();
      smt.close();
      con.close();}
 
 catch(Exception e){
    String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n quotationdash.jsp-----\n"
     + "LINE=257 \n select * from quotation ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
}
%>

   <!-- Main content -->
    <section class="content">
        <!-- Small boxes (Stat box) -->
          <div class="row">
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-aqua">
                <div class="inner">
                  <h3><% out.print(totalleadcount);%></h3>
                  <p>Total Quotation</p>
                </div>
                <div class="icon">
                  <i class="fa fa-file-text-o"></i>
                </div>
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-green">
                <div class="inner">
                  <h3>-</h3>
                  <p>Open Task</p>
                </div>
                <div class="icon">
                  <i class="ion ion-stats-bars"></i>
                </div>
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-yellow">
                <div class="inner">
                  <h3>-</h3>
                  <p>Open Service Request</p>
                </div>
                <div class="icon">
                  <i class="ion ion-person-add"></i>
                </div>
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-red">
                <div class="inner">
                  <h3>-</h3>
                  <p>Active</p>
                </div>
                <div class="icon">
                  <i class="ion ion-pie-graph"></i>
                </div>
              </div>
            </div><!-- ./col -->
          </div><!-- /.row -->
	

	    <div class="row">
        <div class="col-md-12">	
	     <div class="box box-success">
            <div class="box-header with-border">
        <form action=""   method="post" > 
                <h3 class="box-title">Quotation Added By Months  of Year 2018
        <select name="contactsbymonth">
                            <option value="<%=curyear %>"><%=curyear %></option>
  <option value="2017">2017</option>
  <option value="2018">2018</option>
  <option value="2019">2019</option>
  <option value="2020">2020</option>
                        </select> <input type="submit" value="Show Data">
                    </h3>

                </form>
              
            </div>
            <div class="box-body">
              <div class="chart">
               <canvas id="chartjs-1"  width="undefined" height="80px"></canvas>
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

        </div>
        <!-- /.col (RIGHT) -->
		  
      </div>
      <!-- /.row -->
	

	  
    
	  
	      <div class="row">
        <div class="col-xs-12"><form action="" method="POST">
                <div class="box">
                    <div class="box-header">
                
              <h3 class="box-title">Search Quotation </h3>     
            </div>
            <!-- /.box-header -->
            <div class="box-body">
             	<div class="form-group col-xs-4" >
                <label>From:</label>

                <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                    <input type="text" class="form-control pull-right " name="invoicefromdate" id="datepicker1" autocomplete="off">
                </div>
                <!-- /.input group -->
              </div>
                	<div class="form-group col-xs-4" >
                <label>To:</label>

                <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                    <input type="text" class="form-control pull-right " name="invoicetodate" id="datepicker2" autocomplete="off">
                </div>
                <!-- /.input group -->
              </div>
                <div class="form-group col-xs-4" >
               

               
                 
                  <input type="hidden" name="invoicesearchdate" id="invoicesearchdate" value="true">
                    <button  class="btn btn-info pull-left  " onclick="return validatetaskSearch()" type="submit">Search</button>
            
              
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box --></form>
        </div>
        <!-- /.col -->
     
      </div>
      <!-- /.row -->
      
             	<% String invoicesearchdate=request.getParameter("invoicesearchdate");
                        if("true".equals(invoicesearchdate)){
                            String invoicefromdate=request.getParameter("invoicefromdate");
                            String invoicetodate=request.getParameter("invoicetodate");
                            if(invoicefromdate.equals("") || invoicefromdate.equals(null)|| invoicefromdate.equals("null")){ response.sendRedirect("");} 
                           invoicefromdate=Character.toString(invoicefromdate.charAt(6))+Character.toString(invoicefromdate.charAt(7))+Character.toString(invoicefromdate.charAt(8))+Character.toString(invoicefromdate.charAt(9))+"-"+Character.toString(invoicefromdate.charAt(0))+Character.toString(invoicefromdate.charAt(1))+"-"+Character.toString(invoicefromdate.charAt(3))+Character.toString(invoicefromdate.charAt(4));
                       invoicetodate=Character.toString(invoicetodate.charAt(6))+Character.toString(invoicetodate.charAt(7))+Character.toString(invoicetodate.charAt(8))+Character.toString(invoicetodate.charAt(9))+"-"+Character.toString(invoicetodate.charAt(0))+Character.toString(invoicetodate.charAt(1))+"-"+Character.toString(invoicetodate.charAt(3))+Character.toString(invoicetodate.charAt(4));
    
             
             String dbdate=null;
           int i=0,j=0,CH=0;
           String count1;  count1="1";
       try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select count(*) from quotation where c_='1' AND b_ BETWEEN '"+invoicefromdate +"' AND '"+invoicetodate+"'");
       
        ResultSet rs=smt.executeQuery();
        while(rs.next()){  count1=rs.getString(1);  }
      rs.close();
      smt.close();
      con.close();  } catch(Exception e){ 
          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n quotationdash.jsp-----\n"
     + "LINE=427 \n select count(*) from quotation where c_='1' AND b_ BETWEEN '"+invoicefromdate +"' AND '"+invoicetodate+"' ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      }
      
       int n1=Integer.parseInt(count1); 
       
       String searchdata1[][]=new String[n1+1][60];
        try{ Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from quotation where c_='1' AND b_ BETWEEN '"+invoicefromdate +"' AND '"+invoicetodate+"'");
       
        ResultSet rs=smt.executeQuery();
     i=1;
        while(rs.next())
        {  
           for( j=1;j<=59;j++)
          {
            searchdata1[i][j]=rs.getString(j); 
           
          } 
           ++i; 
        }
      rs.close();
      smt.close();
      con.close();  } catch(Exception e){
          String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n quotationdash.jsp-----\n"
     + "LINE=453 \n select * from quotation where c_='1' AND b_ BETWEEN '"+invoicefromdate +"' AND '"+invoicetodate+"' ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
      }
        
                        
      %>
   <div class="row">
        <div class="col-xs-12">
      

          <div class="box">
            <div class="box-header">
                <h3 class="box-title">PO Details  from  <strong>Date:<%=invoicefromdate %>  To:<%=invoicetodate %> </strong> </h3>
                 
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example2" class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th>PO No</th>
                  <th>Date</th>
                  
                  <th>Name</th>
                  <th>Net Amount</th>
                  <th>Owner</th>
                </tr>
                </thead>
                <tbody>
                   <% int m=0; for(m=n1;m>0;m--) {  %>
                  <tr>
                    <td><a href="quotation.jsp?incid=<%=searchdata1[m][1]%>&type=lead"><% out.print(searchdata1[m][1]); %></a></td>
                    <td><% out.print(searchdata1[m][2].substring(0,11)); %></td>
                      <td><% out.print(searchdata1[m][13]); %></td>
                        <td><% out.print(searchdata1[m][54]); %></td>
                          <td><% out.print(searchdata1[m][4]); %></td> 
                    
                   
                  </tr>
                  <% } %>
                 
               
                </tbody>
               
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
	  <% } %>
	    <div class="row">
        <div class="col-xs-12">
      

          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Quotation </h3>
                
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th>PO No</th>
                  <th>Date</th>
                  
                  <th>Name</th>
                  <th>Net Amount</th>
                  <th>Owner</th>
                </tr>
                </thead>
                <tbody>
                   <% int m=0; for(m=n123;m>0;m--) {  %>
                  <tr>
                    <td><a href="quotation.jsp?incid=<%=leaddata[m][1]%>&type=lead"><% out.print(leaddata[m][1]); %></a></td>
                    <td><% out.print(leaddata[m][2].substring(0,11)); %></td>
                      <td><% out.print(leaddata[m][13]); %></td>
                        <td><% out.print(leaddata[m][54]); %></td>
                          <td><% out.print(leaddata[m][4]); %></td> 
                    
                   
                  </tr>
                  <% } %>
                 
               
                </tbody>
               
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
      
      
      
	 <div class="row">
        <div class="col-md-12">	
	     <div class="box box-success">
            <div class="box-header with-border">
                <h3 class="box-title">Quotation Added By Day  of current Month </h3>

              
            </div>
            <div class="box-body">
              <div class="chart">
               <canvas id="chartjs-1231"  width="undefined" height="100px"></canvas>
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

        </div>
        <!-- /.col (RIGHT) -->
    </div>   
	 
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
   <jsp:include page="dist/include/footer.jsp" /> 
    <%    Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Leaving quotationdash.jsp------");
        %> 
  <!-- Control Sidebar -->
  
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- bootstrap datepicker -->
<script src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- FastClick -->
<script src="bower_components/fastclick/lib/fastclick.js"></script>

<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<script src="bower_components/chart.js/Chart2.js" ></script>

<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- page script -->
 page <script>new Chart(document.getElementById("chartjs-4"),{"type":"doughnut","data":{"labels":["Not Attempted","Follow Up","Contacted","New Opportunity","Additional Contact","Disqualified"],"datasets":[{"label":"My First Dataset","data":[<%=New%>,<%=inprocess%>,<%=hold%>,<%=completed%>,<%=canceled%>,<%=none%>],"backgroundColor":["rgb(255, 99, 132)","rgb(106, 160, 251)","rgb(255, 205, 86)","rgb(25, 229, 29)","rgb(243, 164, 253)","rgb(234, 239, 235)"]}]}});</script>  


<script>new Chart(document.getElementById("chartjs-1"),{"type":"bar","data":{"labels":["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"datasets":[{"label":"Invoice","data":[<%=jan%>,<%=feb%>,<%=mar%>,<%=apr%>,<%=may%>,<%=jun%>,<%=jul%>,<%=aug%>,<%=sep%>,<%=oct%>,<%=nov%>,<%=dec%>],"fill":false,"backgroundColor":["rgba(255, 99, 132, 0.2)","rgba(255, 159, 64, 0.2)","rgba(255, 205, 86, 0.2)","rgba(75, 192, 192, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)","rgba(255, 99, 132, 0.2)","rgba(255, 159, 64, 0.2)","rgba(255, 205, 86, 0.2)","rgba(75, 192, 192, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)"],"borderColor":["rgb(255, 99, 132)","rgb(255, 159, 64)","rgb(255, 205, 86)","rgb(75, 192, 192)","rgb(54, 162, 235)","rgb(153, 102, 255)","rgb(255, 99, 132)","rgb(255, 159, 64)","rgb(255, 205, 86)","rgb(75, 192, 192)","rgb(54, 162, 235)","rgb(153, 102, 255)"],"borderWidth":1}]},"options":{"scales":{"yAxes":[{"ticks":{"beginAtZero":true}}]}}});</script>


<script>new Chart(document.getElementById("chartjs-1231"),{"type":"bar","data":{"labels":["Day 1","Day 2","Day 3","Day 4","Day 5","Day 6","Day 7","Day 8","Day 9","Day 10","Day 11","Day 12","Day 13","Day 14","Day 15","Day 16","Day 17","Day 18","Day 19","Day 20","Day 21","Day 22","Day 23","Day 24","Day 24","Day 26","Day 27","Day 28","Day 29","Day 30","Day 31"],"datasets":[{"label":"My First Dataset","data":[<%=d1%>,<%=d2%>,<%=d3%>,<%=d4%>,<%=d5%>,<%=d6%>,<%=d7%>,<%=d8%>,<%=d9%>,<%=d10%>,<%=d11%>,<%=d12%>,<%=d13%>,<%=d14%>,<%=d15%>,<%=d16%>,<%=d17%>,<%=d18%>,<%=d19%>,<%=d20%>,<%=d21%>,<%=d22%>,<%=d23%>,<%=d24%>,<%=d25%>,<%=d26%>,<%=d27%>,<%=d28%>,<%=d29%>,<%=d30%>,<%=d31%>],"fill":false,"backgroundColor":["rgba(255, 99, 132, 0.2)","rgba(255, 159, 64, 0.2)","rgba(255, 205, 86, 0.2)","rgba(75, 192, 192, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)","rgba(201, 203, 207, 0.2)","rgba(255, 99, 132, 0.2)","rgba(255, 159, 64, 0.2)","rgba(255, 205, 86, 0.2)","rgba(75, 192, 192, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)","rgba(201, 203, 207, 0.2)","rgba(255, 99, 132, 0.2)","rgba(255, 159, 64, 0.2)","rgba(255, 205, 86, 0.2)","rgba(75, 192, 192, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)","rgba(201, 203, 207, 0.2)","rgba(255, 99, 132, 0.2)","rgba(255, 159, 64, 0.2)","rgba(255, 205, 86, 0.2)","rgba(75, 192, 192, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)","rgba(201, 203, 207, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)","rgba(201, 203, 207, 0.2)"],"borderColor":["rgb(255, 99, 132)","rgb(255, 159, 64)","rgb(255, 205, 86)","rgb(75, 192, 192)","rgb(54, 162, 235)","rgb(153, 102, 255)","rgb(201, 203, 207)","rgb(255, 99, 132)","rgb(255, 159, 64)","rgb(255, 205, 86)","rgb(75, 192, 192)","rgb(54, 162, 235)","rgb(153, 102, 255)","rgb(201, 203, 207)","rgb(255, 99, 132)","rgb(255, 159, 64)","rgb(255, 205, 86)","rgb(75, 192, 192)","rgb(54, 162, 235)","rgb(153, 102, 255)","rgb(201, 203, 207)","rgb(255, 99, 132)","rgb(255, 159, 64)","rgb(255, 205, 86)","rgb(75, 192, 192)","rgb(54, 162, 235)","rgb(153, 102, 255)","rgb(201, 203, 207)",,"rgb(54, 162, 235)","rgb(153, 102, 255)","rgb(201, 203, 207)"],"borderWidth":1}]},"options":{"scales":{"yAxes":[{"ticks":{"beginAtZero":true}}]}}});</script>


<script>
  $(function () {
    $('#example2').DataTable()
     $('#example1').DataTable()
  
  })
</script>
<script>
  $(function () {
      
     //Date picker
    $('#datepicker1').datepicker({
      autoclose: true
    })  
     //Date picker
    $('#datepicker2').datepicker({
      autoclose: true
    }) 
      
        })
  
</script>
<script>
   function validatetaskSearch(){
           if(document.getElementById("cfn").value==""){
           alert("Enter first name ");
           document.getElementById("cfn").focus();
           return false;
       } 
   
       return true;
    }
</script>
</body>
</html>
