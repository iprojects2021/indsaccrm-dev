<%@page import="email.EmergencyEmail"%>
<%@page import="log.Log"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="blezz.Poul"%>
<%@page import="java.sql.Connection"%>
<% HttpSession session1 = request.getSession(); // reuse existing
    
          String usercid_id=(String)session1.getAttribute("usercid_id");
          String usercid_email=(String)session1.getAttribute("usercid_email");
          String useraccountype=(String)session1.getAttribute("useraccountype");
          String usercid_name=(String)session1.getAttribute("usercid_name");
          String usercid_adminid=(String)session1.getAttribute("usercid_adminid");
             String usercid_company=(String)session1.getAttribute("usercid_company");
          String usercid_website=(String)session1.getAttribute("usercid_website"); 
         String usercid_avatar=(String)session1.getAttribute("usercid_avatar"); 
         String Customerread=(String)session1.getAttribute("Customerread");
            String paidadmin=(String)session1.getAttribute("ispaidadmin");
         
           String Customerwrite=(String)session1.getAttribute("Customerwrite");
       	
	
if (session != null) {
			if (session1.getAttribute("usercid_id") == null) {
				response.sendRedirect("signout.jsp");
			} 
		}

%> 
 <style>
    .example-modal .modal {
      position: relative;
      top: auto;
      bottom: auto;
      right: auto;
      left: auto;
      display: block;
      z-index: 1;
    }

    .example-modal .modal {
      background: transparent !important;
    }
  </style>
<header class="main-header">
    <!-- Logo -->
    <a href="contact.jsp" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini">
          <% if("true".equals(paidadmin)) { %>
          <b><%=usercid_company %></b>
      <% }else{ %>  <b>INDSAC-CRM</b>   <% } %>
      </span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg">
           <% if("true".equals(paidadmin)) { %>
           <b><%=usercid_company %></b>
       <% }else{ %>    <b>INDSAC</b>-CRM  <% } %>
      
      </span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
         
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
             <span class="hidden-xs"><%=usercid_company %></span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                
                <p>
                  <%=usercid_company %>
                  <small><%=usercid_website %></small>
                </p>
              </li>
              <!-- Menu Body -->
             
              <!-- Menu Footer-->
              <li class="user-footer">
                
                <div class="pull-right">
                  <a href="signout.jsp" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="dist/img/<%=usercid_avatar %>" class="img-circle" alt="User Image">
       
        </div>
        <div class="pull-left info">
            <p><%=usercid_name %>  </p>
          
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- search form -->
   
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
       <ul class="sidebar-menu" data-widget="tree">
          <li>
          
         
            <li ><a href="dashboard.jsp"><i class="fa fa-th"></i> Dashboard</a></li>
          
          
            </li> 
             <li>
          
         
            <li ><a href="marketing.jsp"><i class="fa fa-cubes"></i> Marketing</a></li>
          
          
            </li> 
       
             <li class="treeview  ">
          <a href="#">
            <i class="fa  fa-user"></i>
            <span>Customer</span>
           <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li ><a href="contact.jsp"><i class="fa fa-dashboard"></i> Customer Dashboard</a></li>
            <li><a href="newcontact.jsp"><i class="fa fa-user-plus"></i> New Customer</a></li>
           
          </ul>
        </li>
       
        
          <li class="treeview ">
          <a href="#">
            <i class="fa  fa-user"></i>
            <span>Lead</span>
           <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li ><a href="lead.jsp"><i class="fa fa-dashboard"></i> Lead Dashboard</a></li>
            <li><a href="newleads.jsp"><i class="fa fa-user-plus"></i> New Lead</a></li>
           
          </ul>
        </li>
       
       
         <li class="treeview ">
          <a href="#">
            <i class="fa  fa-user"></i>
            <span>Vendor</span>
           <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li ><a href="vendor.jsp"><i class="fa fa-dashboard"></i> Vendor Dashboard</a></li>
            <li><a href="newvendor.jsp"><i class="fa fa-user-plus"></i> New Vendor</a></li>
           
          </ul>
         </li>
        
         <li class="treeview ">
          <a href="#">
            <i class="fa  fa-user"></i>
            <span>Email</span>
           <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
               <li ><a href="searchcontact.jsp"><i class="fa fa-envelope-o"></i>Send Bulk Email </a></li>
          <li ><a href="SentMail.jsp"><i class="fa fa-envelope-o"></i>Sent Mail</a></li>          
          </ul>
        </li>
       
        <%   String count1="0";
              try{ Connection con=Poul.getConnectionCRM();
       PreparedStatement smt=con.prepareStatement("SELECT count(*) FROM task  where  useradminid=? AND usercid=? and status='Open'   ");
       smt.setString(1, usercid_adminid);
        smt.setString(2, usercid_id);
      
      ResultSet rs=smt.executeQuery();
        while(rs.next()){  count1=rs.getString(1);  }
    rs.close();
      smt.close();
      con.close();   } catch(Exception e){
                                   String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \nleftmenu.jsp-----\n"
                   + "\nLINE=208\nSELECT count(*) FROM task  where  useradminid="+usercid_adminid+" AND usercid="+usercid_id+" and status='Open'  ";
       EmergencyEmail.send(e,errormsg); 
     
      }
      int taskcount=0;
      taskcount=Integer.parseInt(count1);
           
           String taskread=(String)session1.getAttribute("taskread");
           String taskwrite=(String)session1.getAttribute("taskwrite");
           
           
         %>
          
         <li class="treeview ">
          <a href="#">
            <i class="fa  fa-list-alt"></i>
            <span>Task</span>
             <% if(taskcount>0){ %>
                    <span class="pull-right-container">
                        <small class="label pull-right bg-red"><%=taskcount  %></small>
              <small class="label pull-right bg-blue">Open</small>
            </span>
                    <%  }else{  %>
           <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
           <% } %>
          </a>
          <ul class="treeview-menu">
           <li ><a href="taskdash.jsp"><i class="fa fa-list-alt"></i><span> Task Dashboard</span>
            
                    </a>
            </li><li ><a href="task.jsp?2a2e2a74797065=2a2e2a6e6577"><i class="fa fa-list-alt"></i>Create Task </a></li>
            <li ><a href="searchtask.jsp"><i class="fa fa-list-alt"></i>Search Task </a></li>
            
          </ul>
        </li>
       
          <% String count123="0"; int ircount=0;
          
              try{ Connection con=Poul.getConnectionCRM();
       PreparedStatement smt=con.prepareStatement("SELECT count(*) FROM interactionrecord  where  useradminid=? AND usercid=? and status='Open'   ");
       smt.setString(1, usercid_adminid);
        smt.setString(2, usercid_id);
      
      ResultSet rs=smt.executeQuery();
        while(rs.next()){  count123=rs.getString(1);  }
   rs.close();
      smt.close();
      con.close();    } catch(Exception e){ 
                                     String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \nleftmenu.jsp-----\n"
                   + "\nLINE=259\nSELECT count(*) FROM interactionrecord  where  useradminid="+usercid_adminid+" AND usercid="+usercid_id+" and status='Open'  ";
       EmergencyEmail.send(e,errormsg); 
     
      } 
           ircount=Integer.parseInt(count123);
           
           
           String irread=(String)session1.getAttribute("irread");
           String irwrite=(String)session1.getAttribute("irwrite");
       
           %>
      
   
     <li class="treeview ">
          <a href="#">
            <i class="fa  fa-sticky-note-o"></i>
            <span>Interaction </span>
           <% if(ircount>0){ %>
                    <span class="pull-right-container">
                        <small class="label pull-right bg-red"><%=ircount  %></small>
              <small class="label pull-right bg-blue">Open</small>
            </span>
                    <%  } else{  %>
           <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
           <% } %>
          </a>
          <ul class="treeview-menu">
             <li ><a href="interactiondash.jsp"><i class="fa fa-sticky-note-o"></i> Interaction  Dashboard</a></li>
           <li ><a href="searchinteraction.jsp"><i class="fa fa-sticky-note-o"></i> Search Interaction </a></li>
           
          </ul>
        </li>
   
      <%  String count12="0"; int srcount=0;
          
              try{ Connection con=Poul.getConnectionCRM();
       PreparedStatement smt=con.prepareStatement("SELECT count(*) FROM servicerequest  where  useradminid=? AND usercid=? and status='Open'   ");
       smt.setString(1, usercid_adminid);
        smt.setString(2, usercid_id);
      
      ResultSet rs=smt.executeQuery();
        while(rs.next()){  count12=rs.getString(1);  }
    rs.close();
      smt.close();
      con.close();   } catch(Exception e){ 
                                       String errormsg=java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" \nleftmenu.jsp-----\n"
                   + "\nLINE=307\nSELECT count(*) FROM servicerequest  where   useradminid="+usercid_adminid+" AND usercid="+usercid_id+" and status='Open'  ";
       EmergencyEmail.send(e,errormsg); 
     
      } 
           srcount=Integer.parseInt(count12);
           
           
           String srread=(String)session1.getAttribute("srread");
           String srwrite=(String)session1.getAttribute("srwrite");
         
          
           %>
       
       
        <li class="treeview ">
          <a href="#">
            <i class="fa  fa-file-text"></i>
            <span>Service Request</span>
             <% if(srcount>0){ %>
                    <span class="pull-right-container">
                        <small class="label pull-right bg-red"><%=srcount  %></small>
              <small class="label pull-right bg-blue">Open</small>
            </span>
                    <%  } else{  %>
           <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
           <% } %>
          </a>
          <ul class="treeview-menu">
            <li ><a href="servicerequestdash.jsp"><i class="fa fa-file-text-o"></i> Service Request Dashboard</a></li>
           <li ><a href="searchservicerequest.jsp"><i class="fa fa-list-alt"></i>Search Service Request </a></li>
            
          </ul>
        </li> 
       
        
          <li class="treeview ">
          <a href="#">
            <i class="fa  fa-navicon"></i>
            <span>Stock</span>
           <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="viewstock.jsp"><i class="fa fa-navicon"></i> View Stock</a></li>
           
          </ul>
        </li>
         <%  String invoiceread=(String)session1.getAttribute("invoiceread");
           String invoicewrite=(String)session1.getAttribute("invoicewrite");
         
          
           %>
       
       
         <li class="treeview ">
          <a href="#">
            <i class="fa  fa-indent"></i>
            <span>Sales</span>
           <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li ><a href="invoicedash.jsp"><i class="fa fa-th"></i> Invoice Dashboard</a></li>
           <li ><a href="" data-toggle="modal" data-target="#create-invoice"><i class="fa fa-file"></i> Create New Invoice</a></li>
            <li ><a href="purchaseorderdash.jsp"><i class="fa fa-th"></i> Purchase Order Dashboard</a></li>
           <li ><a href="" data-toggle="modal" data-target="#create-invoice"><i class="fa fa-file"></i> Create New Purchase Order</a></li>
          <li ><a href="proformadash.jsp"><i class="fa fa-th"></i> Proforma Dashboard</a></li>
           <li ><a href="proforma.jsp" data-toggle="modal" data-target="#create-invoice"><i class="fa fa-file"></i> Create New Proforma Invoice</a></li>
            <li ><a href="quotationdash.jsp"><i class="fa fa-th"></i> Quotation Dashboard</a></li>
           <li ><a href="quotation.jsp" data-toggle="modal" data-target="#create-invoice"><i class="fa fa-file"></i> Create New Quotation</a></li>
            
          </ul>
        </li> 
        
         <%  String poread=(String)session1.getAttribute("poread");
           String powrite=(String)session1.getAttribute("powrite");
         
          
           %>
         <li class="treeview ">
          <a href="#">
            <i class="fa  fa-indent"></i>
            <span>Purchase</span>
           <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li ><a href="expensedash.jsp"><i class="fa fa-th"></i> Expense Dashboard</a></li>
             <li ><a href="newexpense.jsp"><i class="fa fa-th"></i> New Expense</a></li>
           
          </ul>
        </li> 
      
        
         <li class="treeview ">
          <a href="#">
            <i class="fa  fa-gear"></i>
            <span>Setting</span>
           <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
               <li ><a href="profilesetting.jsp"><i class="fa fa-dashboard"></i> Profile Setting</a></li>
       
           
           <% if("admin".equals( useraccountype)){  %>
           <li ><a href="manageuser.jsp"><i class="fa fa-dashboard"></i>Manage User </a></li>
           <li ><a href="invoicesetting.jsp"><i class="fa fa-dashboard"></i> Invoice Setting</a></li>
           <li ><a href="hrdashboard.jsp"><i class="fa fa-dashboard"></i> HRM</a></li>
          <li ><a href="addemployee.jsp"><i class="fa fa-dashboard"></i> Add Employee</a></li>
          
           <% }  %>
          </ul>
              
        </li> 
         <li >
          
         
            <li ><a href="signout.jsp"><i class="fa fa-times-circle-o"></i> Sign Out</a></li>
          
          
        </li> 
         
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
 <div class="modal modal-info fade" id="create-invoice">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Need to select Customer</h4>
              </div>
              <div class="modal-body">
                <p>To create invoice please select customer</p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Close</button>
                <form action="contact.jsp" >    <button type="submit" class="btn btn-outline">Select Customer</button></form>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
        <div class="modal fade" id="show-alert">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="alert-heading">Alert!!</h4>
              </div>
              <div class="modal-body">
                <p id="alert-message"></p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-primary pull-left" data-dismiss="modal">Close</button>
               
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
       <div class="modal fade" id="show-alert1">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="alert-heading">Alert!!</h4>
              </div>
              <div class="modal-body">
                <p id="alert-message1"></p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-primary pull-left" data-dismiss="modal">Close</button>
                <button type="button" id="ok" value="true" class="btn btn-primary">Yes</button>
             
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
       <div class="modal fade" id="show-success">
          <div class="modal-dialog">
            <div class="alert alert-success alert-dismissible">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
              <p id="alert-message-success"></p>
      
        </div> 
         </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal --> 
           <div class="modal fade" id="show-warning">
          <div class="modal-dialog">
            <div class="alert alert-warning alert-dismissible">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                
                 <p id="alert-message-warning"></p>
        </div> 
         </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal --> 
           <div class="modal fade" id="show-error">
          <div class="modal-dialog">
            <div class="alert alert-danger alert-dismissible">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                
                       <p id="alert-message-error"></p>
        </div> 
         </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal --> 