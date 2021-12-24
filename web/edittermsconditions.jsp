<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="blezz.Poul"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Edit Seller Information | INDSAC CRM</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" type="text/css" href="plugins/Allcalenders/css/jquery.calendars.picker.css"> 
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">



</head>
<body class="hold-transition skin-blue sidebar-mini">
    <% HttpSession session1 = request.getSession(); // reuse existing
    
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
 Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Entering edittermsconditions.jsp------------");
    %>
    <%    String pagetype=Poul.escapeHtml(request.getParameter("pagetype"));
      if("edittermsconditions".equals(pagetype)){
      
        String line1=Poul.escapeHtml(request.getParameter("line1"));
        String line2=Poul.escapeHtml(request.getParameter("line2"));
        String line3=Poul.escapeHtml(request.getParameter("line3"));
        String line4=Poul.escapeHtml(request.getParameter("line4"));
        String inheading=Poul.escapeHtml(request.getParameter("inheading"));
        String inline1=Poul.escapeHtml(request.getParameter("inline1"));
        String inline2=Poul.escapeHtml(request.getParameter("inline2"));
        String inline3=Poul.escapeHtml(request.getParameter("inline3"));
        String inline4=Poul.escapeHtml(request.getParameter("inline4"));
        
        String msg=null;
        java.util.Date date=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date.getTime());
        java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());  
        String ownr=(String)session.getAttribute("ownr");
      String SR=null;
        try{
        
Connection c=Poul.getConnectionCRM();

Statement st=c.createStatement();
           ResultSet rs3;
               rs3 = st.executeQuery("select  *  FROM mastertable  ");
    while(rs3.next())
        
          {SR=rs3.getString(1);
          
          }
           int i = Integer.parseInt( SR ); 
           ++i; 
             
             st.addBatch("update mastertable set e_='"+line1+"' where c_='etc_line1'" );
            
              st.addBatch("update mastertable set e_='"+line2+"' where c_='etc_line2'" );
              
             st.addBatch("update mastertable set e_='"+line3+"' where c_='etc_line3'" );
              
                st.addBatch("update mastertable set e_='"+line4+"' where c_='etc_line4'" );
            
                st.addBatch("update mastertable set e_='"+inheading+"' where c_='n_heading'" );
                st.addBatch("update mastertable set e_='"+inline1+"' where c_='n_line1'" );
                st.addBatch("update mastertable set e_='"+inline2+"' where c_='n_line2'" );
                st.addBatch("update mastertable set e_='"+inline3+"' where c_='n_line3'" );
                st.addBatch("update mastertable set e_='"+inline4+"' where c_='n_line4'" );
            
       st.executeBatch(); 
        String requestcid=Integer.toString(i);
        session.setAttribute("requestcid",requestcid);
        session.setAttribute("pagetype","newleadsubmit");
             msg="success";    
       rs3.close();
      st.close();
      c.close();
        }
        catch(Exception e)
        {
             String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n edittermsconditions.jsp-----\n"
     + "LINE=115" + " + \n select  *  FROM mastertable  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg);
     
        }
        finally{
        
           // session.setAttribute("submitmsg",msg);
           // response.sendRedirect("newleads.jsp");
            if("success".equals(msg)){
                Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" ------- edittermsconditions.jsp-----Redirect To--------invoicesetting.jsp---");
        response.sendRedirect("invoicesetting.jsp");
            }else{
               response.sendRedirect("edittermsconditions.jsp");
            }
            
        }
    
      } %>
    
<div class="wrapper">

  <jsp:include page="dist/include/leftmenu.jsp" />  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
 
	
	 <section class="content-header">
    


	
	


<form class="form-horizontal" action="" method="get">
	
	 <div class="row invoice">
        <div class="col-xs-12">
		 <!-- Default box -->
      <div class="box box-warning box-solid">
        <div class="box-header with-border">
          <h3 class="box-title">Edit Terms & Conditions</h3>

         
        </div>
       
	    
		
		
            
           <%   String cdata[]=new String[50];
              try{ Connection con=Poul.getConnectionCRM();
             PreparedStatement smt=con.prepareStatement("select * from mastertable  ");
             
              ResultSet rs=smt.executeQuery();
              int i=1,j=1;
              while(rs.next()){
                   
                      cdata[i]=(rs.getString(5));  
                      ++i;
              } rs.close();
      smt.close();
      con.close(); }
      catch(Exception e)
      {  
         String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"\n edittermsconditions.jsp-----\n"
     + "LINE=183" + " + \n select  *  FROM mastertable  ";
     Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
      EmergencyEmail.send(e,errormsg); 
      }   
            
            
        
            
            %>
            <!-- form start -->
            
              
          <!-- /.box -->
        

        
 </div>
      <!-- /.box -->
</div>
		</div>
		
	
		 <div class="row invoice">
        <div class="col-xs-12">
		 <!-- Default box -->
      <div class="box box-solid">
        <div class="box-header with-border">
          <h3 class="box-title">Terms & Conditions</h3>

         
        </div>
       
	    <div class="col-md-6">
		
		 <div class="box ">
            
           
            <!-- form start -->
            
              <div class="box-body">
			 <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label"> Line1</label>

                  <div class="col-sm-10">
                      
                    <input type="text" class="form-control" id="line1" name="line1" value="<%=cdata[23] %>" placeholder="Line1" onKeyPress="if(this.value.length==70) return false;">
                   
                     
                  </div>
                </div>
					 <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">Line2</label>

                  <div class="col-sm-10">
                  <input type="text" class="form-control" id="line2" name="line2" value="<%=cdata[24] %>" placeholder="Line2"  onKeyPress="if(this.value.length==70) return false;">
                  </div>
                </div>
				
                
				
				
		
              
              </div>
              <!-- /.box-body -->
             
             
           
          </div>
          <!-- /.box -->
        

        </div>
        <!--/.col (left) -->
        <!-- right column -->
        <div class="col-md-6">
          <!-- Horizontal Form -->
           <!-- general form elements -->
          <div class="box ">
           
            <!-- /.box-header -->
            <!-- form start -->
           
              <div class="box-body">
                  
                 <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">Line3</label>

                  <div class="col-sm-10">
                   <input type="text" class="form-control" id="line3" name="line3"value="<%=cdata[25] %>" placeholder="Line3"  onKeyPress="if(this.value.length==70) return false;">
                  </div>
                </div>
                  
				<div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Line4</label>

                  <div class="col-sm-10">
                  <input type="text" class="form-control" id="line4" name="line4" value="<%=cdata[26] %>" placeholder="Line4" onKeyPress="if(this.value.length==70) return false;">
                  </div>
                </div>
           
            </div>
              <!-- /.box-body -->
			
   </div>
          <!-- /.box -->
  </div>
        <!--/.col (right) -->
  </div>
      <!-- /.box -->
		</div>
		</div>
	 <div class="row invoice">
        <div class="col-xs-12">
		 <!-- Default box -->
      <div class="box box-solid">
        <div class="box-header with-border">
          <h3 class="box-title">Invoice Notes</h3>

         
        </div>
       
	    <div class="col-md-6">
		
		 <div class="box ">
            
           
            <!-- form start -->
            
              <div class="box-body">
                  <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label"> Heading</label>

                  <div class="col-sm-10">
                      
                    <input type="text" class="form-control" id="inheading" name="inheading" value="<%=cdata[27] %>" placeholder="Notes Heading" onKeyPress="if(this.value.length==70) return false;">
                   
                     
                  </div>
                </div>
			 <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label"> Line1</label>

                  <div class="col-sm-10">
                      
                    <input type="text" class="form-control" id="inline1" name="inline1" value="<%=cdata[28] %>" placeholder="Line1" onKeyPress="if(this.value.length==70) return false;">
                   
                     
                  </div>
                </div>
					 <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">Line2</label>

                  <div class="col-sm-10">
                  <input type="text" class="form-control" id="inline2" name="inline2" value="<%=cdata[29] %>" placeholder="Line2"  onKeyPress="if(this.value.length==70) return false;">
                  </div>
                </div>
	   </div>
              <!-- /.box-body -->
        </div>
          <!-- /.box -->
       </div>
        <!--/.col (left) -->
        <!-- right column -->
        <div class="col-md-6">
          <!-- Horizontal Form -->
           <!-- general form elements -->
          <div class="box ">
           
            <!-- /.box-header -->
            <!-- form start -->
             <div class="box-body">
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">Line3</label>

                  <div class="col-sm-10">
                   <input type="text" class="form-control" id="inline3" name="inline3"value="<%=cdata[30] %>" placeholder="Line3"  onKeyPress="if(this.value.length==70) return false;">
                  </div>
                </div>
            		<div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Line4</label>

                  <div class="col-sm-10">
                  <input type="text" class="form-control" id="inline4" name="inline4" value="<%=cdata[31] %>" placeholder="Line4" onKeyPress="if(this.value.length==70) return false;">
                  </div>
                </div>
             <input type="hidden" name="pagetype" value="edittermsconditions">
            
              </div>
              <!-- /.box-body -->
			  <div class="box-footer clearfix">
              <a href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-left">Cancel</a>
               <button class="btn btn-sm btn-info btn-flat pull-right" onClick="return validateForm()">Save</button>
            </div>
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
</div>
        <!--/.col (right) -->
     </div>
      <!-- /.box -->
	
		</div>
		</div>	
	    </form>
 </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <jsp:include page="dist/include/footer.jsp" />  

<% Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+Poul.getPublicIP()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Leaving edittermsconditions.jsp------");
 
 %>
 
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
<!-- FastClick -->
<script src="bower_components/fastclick/lib/fastclick.js"></script>
<script src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- All Calenders-->
<script type="text/javascript" src="plugins/Allcalenders/js/jquery.calendars.js"></script> 
<script type="text/javascript" src="plugins/Allcalenders/js/jquery.calendars.plus.js"></script>
<script type="text/javascript" src="plugins/Allcalenders/js/jquery.plugin.js"></script> 
<script type="text/javascript" src="plugins/Allcalenders/js/jquery.calendars.picker.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- page script -->
<script>
  $(function () {
    $('#example1').DataTable()
    $('#example2').DataTable({
      'paging'      : true,
      'lengthChange': false,
      'searching'   : false,
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false
    })
  })
</script>
<script>
    function validateForm(){
        
       if(document.getElementById("line1").value.length>70){
           alert("Only 70 Characters allowed ");
           document.getElementById("line1").focus();
           return false;
       }
       
       else if(document.getElementById("line2").value.length>70){
           alert("Only 70 Characters allowed ");
           document.getElementById("line2").focus();
           return false;
       }
       
       else if(document.getElementById("line3").value.length>70){
           alert("Only 70 Characters allowed ");
           document.getElementById("line3").focus();
           return false;
       }
       
       
       else if(document.getElementById("line4").value.length>70){
           alert("Only 70 Characters allowed ");
           document.getElementById("line4").focus();
           return false;
       }
       
       else if(document.getElementById("inheading").value.length>70){
           alert("Only 70 Characters allowed ");
           document.getElementById("inheading").focus();
           return false;
       }
       
       else if(document.getElementById("inline1").value.length>70){
           alert("Only 70 Characters allowed ");
           document.getElementById("inline1").focus();
           return false;
       }
       
       else if(document.getElementById("inline2").value.length>70){
           alert("Only 70 Characters allowed ");
           document.getElementById("inline2").focus();
           return false;
       }
       
       else if(document.getElementById("inline3").value.length>70){
           alert("Only 70 Characters allowed ");
           document.getElementById("inline3").focus();
           return false;
       }
       
       else if(document.getElementById("inline4").value.length>70){
           alert("Only 70 Characters allowed ");
           document.getElementById("inline4").focus();
           return false;
       }
       
       
       return true;
    }
</script>
<script>
$('#dob').calendarsPicker({
dateFormat:'dd/mm/yyyy'
});
</script>
</body>
</html>
