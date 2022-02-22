<%@page import="menu.Marketing"%>
<%@page import="blezz.Nd"%>
<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
<%@page import="log.Log"%>
<%@page import="blezz.Db"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.util.ArrayList"%>
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
    <head> <link rel="shortcut icon" href="dist/img/u.png" type="image/x-icon" /> 
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title> Lead Edit | INDSAC CRM</title>
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
       Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Entering leadedit.jsp----------Leadedit---");
    	
	
if (session != null) {
			if (session1.getAttribute("usercid_id") == null) {
				response.sendRedirect("signout.jsp");
			} 
		}
Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+"   --  Entring leadedit.jsp---");
%>
   
      <%    String pagetype=Poul.escapeHtml(request.getParameter("pagetype"));
        String lid=request.getParameter("2a2e2a6c6964");
        if(lid!=null){lid=Nd.Decrypt(lid);}
      if("truece".equals(pagetype)){
          
          
      
       String cn=Poul.escapeHtml(request.getParameter("cn"));
        String cfn=Poul.escapeHtml(request.getParameter("cfn"));
        String cln=Poul.escapeHtml(request.getParameter("cln"));
        String department=Poul.escapeHtml(request.getParameter("department"));
        String designation=Poul.escapeHtml(request.getParameter("designation"));
        String dob=Poul.escapeHtml(request.getParameter("dob"));
        String category=Poul.escapeHtml(request.getParameter("category"));
        String sc=Poul.escapeHtml(request.getParameter("sc"));
        String status=Poul.escapeHtml(request.getParameter("status"));
        String rt=Poul.escapeHtml(request.getParameter("rt"));
        String source=Poul.escapeHtml(request.getParameter("source"));
        String vn=Poul.escapeHtml(request.getParameter("vn"));
        String website=Poul.escapeHtml(request.getParameter("website"));
        String bwtc =Poul.escapeHtml(request.getParameter("bwtc"));
        String mobile=Poul.escapeHtml(request.getParameter("mobile"));
        String ap=Poul.escapeHtml(request.getParameter("ap"));
        String email=Poul.escapeHtml(request.getParameter("email"));
        String oai=Poul.escapeHtml(request.getParameter("oai"));
        String oai1=Poul.escapeHtml(request.getParameter("oai1"));
        String phone=Poul.escapeHtml(request.getParameter("phone"));
        String fax=Poul.escapeHtml(request.getParameter("fax"));
        String oe=Poul.escapeHtml(request.getParameter("oe"));
        String oai2=Poul.escapeHtml(request.getParameter("oai2"));
        String oai3=Poul.escapeHtml(request.getParameter("oai3"));
        String address1=Poul.escapeHtml(request.getParameter("address1"));
        String address2=Poul.escapeHtml(request.getParameter("address2"));
        String address3=Poul.escapeHtml(request.getParameter("address3"));
        String city=Poul.escapeHtml(request.getParameter("city"));
        String pincode=Poul.escapeHtml(request.getParameter("pincode"));
        String state=Poul.escapeHtml(request.getParameter("state"));
        String country=Poul.escapeHtml(request.getParameter("country"));
        String notes=Poul.escapeHtml(request.getParameter("notes"));
        String    previousnotes=Poul.escapeHtml(request.getParameter("previousnotes"));
   
    if(notes.length()>0){notes="**"+Db.getEmployeeName(usercid_id)+"******"+java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"*******\n"+notes+"\n\n"+previousnotes;}
    else{notes=previousnotes;}
        String gstin=Poul.escapeHtml(request.getParameter("gstin"));
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
               rs3 = st.executeQuery("select  *  FROM contact where id='"+lid+"'  ");
 ResultSetMetaData rsmd=rs3.getMetaData();
     String aa="null",ab="null",ac="null",ad="null",ae="null",af="null",ag="null",ah="null",ai="null",aj="null",ak="null",all="null",am="null",an="null",ao="null",app="null",aq="null",ar="null",as="null",at="null",au="null",av="null",aw="null",ax="null",ay="null",az="null",ba="null",bb="null",bc="null",bd="null",be="null",bf="null",bg="null",bh="null",bi="null",bj="null",bk="null",bl="null";
          aa=rsmd.getColumnName(1);
           ab=rsmd.getColumnName(2);
            ac=rsmd.getColumnName(3);
             ad=rsmd.getColumnName(4);
              ae=rsmd.getColumnName(5);
               af=rsmd.getColumnName(6);
                ag=rsmd.getColumnName(7);
                 ah=rsmd.getColumnName(8);
                  ai=rsmd.getColumnName(9);
                   aj=rsmd.getColumnName(10);
                    ak=rsmd.getColumnName(11);
                     all=rsmd.getColumnName(12);
                      am=rsmd.getColumnName(13);
                       an=rsmd.getColumnName(14);
                        ao=rsmd.getColumnName(15);
                         app=rsmd.getColumnName(17);
                          aq=rsmd.getColumnName(18);
                           ar=rsmd.getColumnName(19);
                            as=rsmd.getColumnName(20);
                             at=rsmd.getColumnName(21);
                              au=rsmd.getColumnName(22);
                              av=rsmd.getColumnName(23);
                                aw=rsmd.getColumnName(24);
                       ax=rsmd.getColumnName(25);
                        ay=rsmd.getColumnName(26);
                         az=rsmd.getColumnName(27);
                          ba=rsmd.getColumnName(28);
                           bb=rsmd.getColumnName(29);
                            bc=rsmd.getColumnName(30);
                             bd=rsmd.getColumnName(31);
                              be=rsmd.getColumnName(32);
                              bf=rsmd.getColumnName(33);
                               bg=rsmd.getColumnName(34);
                            bh=rsmd.getColumnName(35);
                             bi=rsmd.getColumnName(36);
                              bj=rsmd.getColumnName(37);
                              bk=rsmd.getColumnName(38);
                              bl=rsmd.getColumnName(39);
                             
               
  st.addBatch("update contact set   "+ae+"='"+cn+"',"+af+"='"+cfn+"',"+ag+"='"+cln+"',"+ah+"='"+department+"',"+ai+"='"+designation+"',"+aj+"='"+dob+"',"+ak+"='"+category+"',"+all+"='"+sc+"',"+am+"='"+status+"',"+an+"='"+rt+"',"+ao+"='"+source+"',"+app+"='"+vn+"',"+aq+"='"+website+"',"+ar+"='"+bwtc+"',"+as+"='"+mobile+"',"+at+"='"+ap+"',"+au+"='"+phone+"',"+av+"='"+email+"',"+aw+"='"+oe+"',"+ax+"='"+fax+"',"+ay+"='"+oai+"',"+az+"='"+oai1+"',"+ba+"='"+oai2+"',"+bb+"='"+oai3+"',"+bc+"='"+address1+"',"+bd+"='"+address2+"',"+be+"='"+address3+"',"+bf+"='"+city+"',"+bg+"='"+pincode+"',"+bh+"='"+state+"',"+bi+"='"+country+"',"+bj+"='"+notes+"',"+bk+"='"+gstin+"'   where id='"+lid+"'");
  
            
       st.executeBatch(); 
        
        session.setAttribute("requestid",lid);
        
             msg="success";    
       
    rs3.close();
      st.close();
      c.close();     }
        catch(Exception e)
        {
            String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n leadedit.jsp-----\n"
                   + "\n LINE=177 \n select  *  FROM contact where id='"+lid+"' ";
         Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
       EmergencyEmail.send(e,errormsg);
        }
        finally{
        
          if(msg.equals("success")){
        response.sendRedirect("leaddetails.jsp");
            }else{
              Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" -----------Entring leadedit.jsp---------Redirecting To-----------error.jsp----------------");
               response.sendRedirect("error.jsp");
            }
               
            
        }
    
      } %>
    
    <%
          ArrayList<String> al=new ArrayList<String>();
        
       
       try{
           
        Connection con=Poul.getConnectionCRM();
        PreparedStatement smt=con.prepareStatement("select * from contact where id=?");
        smt.setString(1,lid);
        ResultSet rs=smt.executeQuery();
        while(rs.next()){
            for(int i=1;i<49;i++){
               al.add(rs.getString(i)); 
            }
        }
        
    rs.close();
      smt.close();
      con.close();    }
        catch(Exception e){
               String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \n leadedit.jsp-----\n"
                   + "\n LINE=216 \n select  *  from contact where id='"+lid+"' ";
         Log.writeLogWarn(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+"  /n"+errormsg+" /n"+e);
       EmergencyEmail.send(e,errormsg);
                }
       //System.out.println(al.size());
      %>
    
    
  
    
<div class="wrapper">

 <jsp:include page="dist/include/leftmenu.jsp" />  

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
 
	
	 <section class="content">
   
<form class="form-horizontal" action="" method="get">
	
	 <div class="row invoice">
        <div class="col-xs-12">
		 <!-- Default box -->
      <div class="box box-warning box-solid">
        <div class="box-header with-border">
          <h3 class="box-title">Edit Lead</h3>
          <p class="pull-right">Created By:<%=al.get(3).substring(4)+","+al.get(1) %> </p>
         
        </div>
       
	    <div class="col-md-6">
		
		 <div class="box ">
            
           
            <!-- form start -->
            
              <div class="box-body">
			    <div class="form-group">
                  <label for="inputEmail3" class="col-sm-3 control-label">Company Name</label>

                  <div class="col-sm-9">
                   <input type="text" autocomplete="off" class="form-control" id="cn" name="cn" placeholder="<%=al.get(4) %>" value="<%=al.get(4) %>" onKeyPress="if(this.value.length==30) return false;">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-3 control-label">Contact </label>

                  <div class="col-sm-4">
                    <input type="text"  autocomplete="off" class="form-control" id="cfn" name="cfn" placeholder="<%=al.get(5) %>" value="<%=al.get(5) %>" autocomplete="off">
                  </div>
                <div class="col-sm-1">
				</div>
                 

                  <div class="col-sm-4">
                    <input type="text" autocomplete="off"  class="form-control" id="cln" name="cln" placeholder="<%=al.get(6) %>" value="<%=al.get(6) %>" autocomplete="off">
                  </div>
                </div>
		  <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Status</label>

                  <div class="col-sm-9">
                    <select id="status" name="status" class="form-control" value="<%=al.get(12) %>">
                          <option value="<%=al.get(12) %>"> <%=al.get(12) %></option>
                        
                          
                     </select></div>
                </div>
				
				  <div class="form-group">
                  <label for="inputEmail3" class="col-sm-3 control-label">  Source</label>

                    <div class="col-sm-9">
                    <select id="source" name="source" class="form-control" value="<%=al.get(14) %>">
                          <option value="<%=al.get(14) %>"> <%=Marketing.getEventName(al.get(14)) %></option>
                          <option value="Advertisement">Advertisement</option>
                          <option value="Referral">Referral</option>
                          <option value="Partner">Partner</option>
                          <option value="Email">Email</option>
                          <option value="Chat">Chat</option>
                          <option value="Other">Other</option>
                     </select>
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
                  <label for="inputPassword3" class="col-sm-3 control-label">Best Way to Contact</label>

                    <div class="col-sm-9">
                      <select id="bwtc" name="bwtc" class="form-control"  value="<%=al.get(18) %>">
                           <option value="<%=al.get(18) %>"> <%=al.get(18) %></option>
                          <option value="Mobile"> Mobile</option>
                          <option value="Email"> Email</option>
                          <option value="Phone"> Phone</option>
                      </select>
                  </div>
                </div>
			 <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Mobile</label>

                  <div class="col-sm-9">
                     <input type="text" class="form-control" id="mobile" name="mobile" placeholder="<%=al.get(19) %>" value="<%=al.get(19) %>">
                  </div>
                </div>
                  <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Alternate Mobile</label>

                  <div class="col-sm-9">
                    <input type="text" class="form-control" id="ap" name="ap" placeholder="<%=al.get(20) %>" value="<%=al.get(20) %>">
                  </div>
                </div>
                  	 
				 <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Email</label>

                  <div class="col-sm-9">
                    <input type="text" class="form-control" id="email" name="email" placeholder="<%=al.get(22) %>" value="<%=al.get(22) %>">
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
          <h3 class="box-title">Other Information</h3>

         
        </div>

       
	    <div class="col-md-6">
		
		 <div class="box ">
            
           
            <!-- form start -->
            
              <div class="box-body">
                   <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Department</label>

                  <div class="col-sm-9">
                     <input type="text"  autocomplete="off" class="form-control" id="department" name="department" placeholder="<%=al.get(7) %>" value="<%=al.get(7) %>">
                  </div>
                </div>
				     <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Designation</label>

                  <div class="col-sm-9">
                   <input type="text"  autocomplete="off" class="form-control" id="designation" name="designation" placeholder="<%=al.get(8) %>" value="<%=al.get(8) %>">
                  </div>
                </div>
			    
			 <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Category</label>

                  <div class="col-sm-9">
                      <input type="text" class="form-control" id="category" name="category" placeholder="<%=al.get(10) %>" value="<%=al.get(10) %>">
                  </div>
                </div>			 
					
               
              </div>
              <!-- /.box-body -->
             
                       </div>
          <!-- /.box -->
        

        </div>
        <!--/.col (left) -->
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
                  <label for="inputPassword3" class="col-sm-2 control-label">Report To</label>

                  <div class="col-sm-10">
                    <input type="text"  autocomplete="off" class="form-control" id="rt" name="rt" placeholder="<%=al.get(13) %>" value="<%=al.get(13) %>">
                  </div>
                </div>
		  <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">GSTIN </label>

                  <div class="col-sm-10">
                    <input type="text"  autocomplete="off" class="form-control" id="gstin" name="gstin" placeholder="<%=al.get(37) %>" value="<%=al.get(37) %>">
                  </div>
                </div>
			   
					  
			  <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Website</label>

                  <div class="col-sm-10">
                   <input type="url" autocomplete="off" class="form-control" id="website" name="website" placeholder="<%=al.get(17) %>" value="<%=al.get(17) %>">
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
          <h3 class="box-title">Address</h3>

         
        </div>
       
	    <div class="col-md-6">
		
		 <div class="box ">
            
           
            <!-- form start -->
            
              <div class="box-body">
			 <div class="form-group">
                  <label for="inputEmail3" class="col-sm-3 control-label"> Address1</label>

                  <div class="col-sm-9">
                     <input type="text" class="form-control" id="address1" name="address1" placeholder="<%=al.get(29) %>" value="<%=al.get(29) %>">
                  </div>
                </div>
					 <div class="form-group">
                  <label for="inputEmail3" class="col-sm-3 control-label">Address2</label>

                  <div class="col-sm-9">
                  <input type="text" class="form-control" id="address2" name="address2" placeholder="<%=al.get(30) %>" value="<%=al.get(30) %>">
                  </div>
                </div>
				 <div class="form-group">
                  <label for="inputEmail3" class="col-sm-3 control-label">Address3</label>

                  <div class="col-sm-9">
                   <input type="text" class="form-control" id="address3" name="address3" placeholder="<%=al.get(31) %>" value="<%=al.get(31) %>">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">City</label>

                  <div class="col-sm-3">
                    <input type="text" class="form-control" id="city" name="city"  placeholder="<%=al.get(32) %>" value="<%=al.get(32) %>">
                  </div>
                
                  <label for="inputPassword3" class="col-sm-3 control-label">Pincode</label>

                  <div class="col-sm-3">
                   <input type="text" class="form-control" id="pincode" name="pincode"  placeholder="<%=al.get(33) %>" value="<%=al.get(33) %>">
                  </div>
                </div>
				<div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">State</label>

                  <div class="col-sm-9">
                  <input type="text" class="form-control" id="state" name="state"  placeholder="<%=al.get(34) %>" value="<%=al.get(34) %>">
                  </div>
                </div>
				     <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Country</label>

                  <div class="col-sm-9">
                    <input type="text" class="form-control" id="country" name="country"  placeholder="<%=al.get(35) %>" value="<%=al.get(35) %>">
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
                  <label for="inputPassword3" class="col-sm-2 control-label">Add Notes</label>

                  <div class="col-sm-10">
                      <textarea class="form-control" rows="2" id="notes" name="notes" ></textarea>
                    <input type="hidden" name="pagetype" value="truece">
                    <input type="hidden" name="2a2e2a6c6964" value="<%=Nd.Encrypt(al.get(0)) %>">
                  </div>
                </div>
					
			  <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Previous Notes</label>

                  <div class="col-sm-10">
                      <textarea class="form-control" rows="7" id="previousnotes" readonly name="previousnotes" placeholder="<%=al.get(36) %>" value="<%=al.get(36) %>"><%=al.get(36) %></textarea>
                   
                  </div>
                </div>		
				
              
              </div>
              <!-- /.box-body -->
			  <div class="box-footer clearfix">
              <a href="javascript:void(0)" class="btn btn-sm btn-default btn-flat pull-left">Cancel</a>
              <button class="btn btn-sm btn-info btn-flat pull-right" onClick="return validateForm()" type="submit">Save</button>
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
 <%   Log.writeLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" ,"+request.getRemoteAddr()+" ,useradminid="+usercid_adminid+" ,usercid="+usercid_id+" --Leaving leadedit.jsp----------Leadedit---");
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
        if(document.getElementById("mobile").value==""){
                    document.getElementById("alert-message").innerHTML = "Mobile cannot be empty ";
    $('#show-alert').modal('show')
     
           
           document.getElementById("mobile").focus();
           return false;
        }
       
        else if(document.getElementById("mobile").value!=""){
           
           if(!document.getElementById("mobile").value.match(/^[0-9]+$/)){
                          document.getElementById("alert-message").innerHTML = " Mobile :Only numbers allowed ";
    $('#show-alert').modal('show')
     
          
           document.getElementById("mobile").focus();
     return false;
            } 
        if(document.getElementById("mobile").value.length>10){
         document.getElementById("alert-message").innerHTML = " Mobile :Only 10 digits allowed ";
    $('#show-alert').modal('show')
               
           document.getElementById("mobile").focus();
           
           return false;
       }  if(document.getElementById("mobile").value.length<10){
          document.getElementById("alert-message").innerHTML = "Mobile :Only 10 digits allowed  ";
    $('#show-alert').modal('show')
                
           document.getElementById("mobile").focus();
           
           return false;
       }
   }
       
   
       if(document.getElementById("cfn").value==""){
   
            document.getElementById("alert-message").innerHTML = "First name cannot be empty";
    $('#show-alert').modal('show')
       document.getElementById("cfn").focus();
           return false;
        }else if(document.getElementById("cfn").value!=""){
           
           if(!document.getElementById("cfn").value.match(/^[0-9 a-z.A-Z]+$/)){
              document.getElementById("alert-message").innerHTML = "First Name: Only alphanumeric allowed";
    $('#show-alert').modal('show')
           
           document.getElementById("cfn").focus();
     return false;
            } 
        } 
        if(document.getElementById("cfn").value.length>30){
                document.getElementById("alert-message").innerHTML = "First Name :Only 30 Characters allowed";
    $('#show-alert').modal('show')
         
           // alert("Only 30 Characters allowed ");
           document.getElementById("cfn").focus();
           
           return false;
       }
       
       if(document.getElementById("cln").value==""){
   
            document.getElementById("alert-message").innerHTML = "Last name cannot be empty";
    $('#show-alert').modal('show')
       document.getElementById("cln").focus();
           return false;
        }else if(document.getElementById("cln").value!=""){
           
           if(!document.getElementById("cln").value.match(/^[0-9 a-z.A-Z]+$/)){
              document.getElementById("alert-message").innerHTML = "Last Name: Only alphanumeric allowed";
    $('#show-alert').modal('show')
           
           document.getElementById("cln").focus();
     return false;
            } 
        } 
        if(document.getElementById("cln").value.length>30){
                document.getElementById("alert-message").innerHTML = "Last Name: Only 30 Characters allowed";
    $('#show-alert').modal('show')
         
           // alert("Only 30 Characters allowed ");
           document.getElementById("cln").focus();
           
           return false;
       }
       if(document.getElementById("cn").value!=""){
           
           if(!document.getElementById("cn").value.match(/^[0-9 a-z.A-Z]+$/)){
                     document.getElementById("alert-message").innerHTML = "Company Name: Only alphanumeric allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("cn").focus();
     return false;
            } else
        if(document.getElementById("cn").value.length>30){
                         document.getElementById("alert-message").innerHTML = "Company Name: Only 30 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("cn").focus();
           
           return false;
       }}
      
   if(document.getElementById("department").value!=""){
           
           if(!document.getElementById("department").value.match(/^[0-9 a-z.A-Z]+$/)){
                     document.getElementById("alert-message").innerHTML = "Please enter valid department name";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("department").focus();
     return false;
            } else
        if(document.getElementById("department").value.length>30){
                         document.getElementById("alert-message").innerHTML = "Department Name: Only 30 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("department").focus();
           
           return false;
       }}
       
       if(document.getElementById("designation").value!=""){
           
           if(!document.getElementById("designation").value.match(/^[a-z. A-Z]+$/)){
                     document.getElementById("alert-message").innerHTML = "Please enter valid designation";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("designation").focus();
     return false;
            } else
        if(document.getElementById("designation").value.length>30){
                         document.getElementById("alert-message").innerHTML = "Designation: Only 30 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("designation").focus();
           
           return false;
       }}
     
      
      
    
      
       if(document.getElementById("gstin").value!=""){
           
           if(!document.getElementById("gstin").value.match(/^[0-9A-Z]+$/)){
                     document.getElementById("alert-message").innerHTML = "Please enter valid gstin";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("gstin").focus();
     return false;
            }
        if(document.getElementById("gstin").value.length>15){
                         document.getElementById("alert-message").innerHTML = "GSTIN: Only 15 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("gstin").focus();
           
           return false;
       }
       if(document.getElementById("gstin").value.length<15){
                         document.getElementById("alert-message").innerHTML = " GSTIN: Only 15 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("gstin").focus();
           
           return false;
       }
   } 
     
    if(document.getElementById("rt").value!=""){
           
           if(!document.getElementById("rt").value.match(/^[0-9 a-z.A-Z]+$/)){
                     document.getElementById("alert-message").innerHTML = "Report To: please enter valid name";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("rt").focus();
     return false;
            } else
        if(document.getElementById("rt").value.length>30){
                         document.getElementById("alert-message").innerHTML = "Report To: Only 30 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("rt").focus();
           
           return false;
       }}
       
   
        if(document.getElementById("ap").value!=""){
           
            if(!document.getElementById("ap").value.match(/^[0-9]+$/)){
                          document.getElementById("alert-message").innerHTML = "Alternate Mobile :Only numbers allowed ";
    $('#show-alert').modal('show')
     
          
           document.getElementById("ap").focus();
     return false;
            } 
        if(document.getElementById("ap").value.length>10){
         document.getElementById("alert-message").innerHTML = "Alternate Mobile :Only 10 digits allowed ";
    $('#show-alert').modal('show')
               
           document.getElementById("ap").focus();
           
           return false;
       }  if(document.getElementById("ap").value.length<10){
          document.getElementById("alert-message").innerHTML = "Alternate Mobile :Only 10 digits allowed  ";
    $('#show-alert').modal('show')
                
           document.getElementById("ap").focus();
           
           return false;
       }
   }
   
  if(document.getElementById("email").value!=""){
           
           if(!document.getElementById("email").value.match(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/)){
                     document.getElementById("alert-message").innerHTML = "Enter valid email id";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("email").focus();
     return false;
            } else
        if(document.getElementById("email").value.length>30){
                         document.getElementById("alert-message").innerHTML = "Email id: Only 40 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("email").focus();
           
           return false;
       }}
       
        if(document.getElementById("address1").value!=""){
           
           if(!document.getElementById("address1").value.match(/^[a-zA-Z:,'-'' '\.0-9\n]+$/)){
                     document.getElementById("alert-message").innerHTML = "Address1: Only alphanumeric allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("address1").focus();
     return false;
            } else
        if(document.getElementById("address1").value.length>30){
                         document.getElementById("alert-message").innerHTML = "Address1:Only 30 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("address1").focus();
           
           return false;
       }} 
      
       
      if(document.getElementById("address2").value!=""){
           
           if(!document.getElementById("address2").value.match(/^[a-zA-Z:,'-'' '\.0-9\n]+$/)){
                     document.getElementById("alert-message").innerHTML = "Address2: Only alphanumeric allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("address2").focus();
     return false;
            } else
        if(document.getElementById("address2").value.length>30){
                         document.getElementById("alert-message").innerHTML = "Address2:Only 30 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("address2").focus();
           
           return false;
       }} 
      
      if(document.getElementById("address3").value!=""){
           
           if(!document.getElementById("address3").value.match(/^[a-zA-Z:,'-'' '\.0-9\n]+$/)){
                     document.getElementById("alert-message").innerHTML = "Address3: Only alphanumeric allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("address3").focus();
     return false;
            } else
        if(document.getElementById("address3").value.length>30){
                         document.getElementById("alert-message").innerHTML = "Address3:Only 30 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("address3").focus();
           
           return false;
       }} 
      
      if(document.getElementById("city").value!=""){
           
           if(!document.getElementById("city").value.match(/^[a-zA-Z:,'-'' '\.0-9\n]+$/)){
                     document.getElementById("alert-message").innerHTML = "City: Only alphanumeric allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("city").focus();
     return false;
            } else
        if(document.getElementById("city").value.length>30){
                         document.getElementById("alert-message").innerHTML = "City: Only 30 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("city").focus();
           
           return false;
       }}
      
      if(document.getElementById("pincode").value!=""){
           
           if(!document.getElementById("pincode").value.match(/^[0-9]+$/)){
                     document.getElementById("alert-message").innerHTML = "Pincode: Only digits allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("pincode").focus();
     return false;
            } else
        if(document.getElementById("pincode").value.length>10){
                         document.getElementById("alert-message").innerHTML = "Pincode:Only 10 digits allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("pincode").focus();
           
           return false;
       }}
      
       if(document.getElementById("state").value!=""){
           
           if(!document.getElementById("state").value.match(/^[a-zA-Z:,'-'' '\.0-9\n]+$/)){
                     document.getElementById("alert-message").innerHTML = "State: Only characters allowed";
    $('#show-alert').modal('show')
       
           //alert("Only alphanumeric allowed");
           document.getElementById("state").focus();
     return false;
            } else
        if(document.getElementById("state").value.length>30){
                         document.getElementById("alert-message").innerHTML = "State: Only 30 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("state").focus();
           
           return false;
       }}
      
      if(document.getElementById("notes").value!=""){
           
         
        if(document.getElementById("notes").value.length>2000){
                         document.getElementById("alert-message").innerHTML = "Notes: Only 2000 Characters allowed";
    $('#show-alert').modal('show')
     
                  
           document.getElementById("notes").focus();
           
           return false;
       }}
   
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
