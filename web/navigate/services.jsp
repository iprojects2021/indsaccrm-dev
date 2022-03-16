
<%@page import="blezz.Poul"%>
<%@page import="log.Log"%>
<!--
   Author: www.indsaccrm.com
   Author URL: https://www.indsaccrm.com
-->
<!doctype html>
<html lang="en">
  <head> <link rel="shortcut icon" href="../dist/img/u.png" type="image/x-icon" />
       <link rel="canonical" href="https://www.indsaccrm.com/services.jsp" />
      <link rel="apple-touch-icon" href="dist/img/u.png"/>
      <link rel="alternate" hreflang="en" href ="https://www.indsaccrm.com/" />
      
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="It gives you a scalable, secure framework to establish and maintain trusted identities and keep communications private">


    <title>INDSAC-CRM Services | Services : indssaccrm.com</title>

    <!-- Template CSS -->
    <link rel="stylesheet" href="assets/css/style-starter.css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Muli:400,600,700&display=swap" rel="stylesheet">
 <style>
.dropbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: #3e8e41;}
</style>
  </head>
  <body id="services">


      <%  Log.writeWEBLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" "+request.getProtocol()+", "+Poul.getPublicIP()+""
              + ", "+request.getRemoteHost()+", Entering services.jsp");
      %>
 <%@include file="header.jsp" %>
    <script src="assets/js/jquery-3.3.1.min.js"></script> <!-- Common jquery plugin -->
    <!--bootstrap working-->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- //bootstrap working-->
<!-- disable body scroll which navbar is in active -->
<script>
    $(function () {
      $('.navbar-toggler').click(function () {
        $('body').toggleClass('noscroll');
      })
    });
  </script>
  <!-- disable body scroll which navbar is in active -->

<!-- breadcrumbs -->
    <section class="w3l-inner-banner-main">
        <div class="about-inner inner2">
            <div class="container seen-w3">
                <ul class="breadcrumbs-custom-path">
                    <li><a href="../index.jsp">Home <span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
                    <li class="active">Services</li>
                </ul>
            </div>
        </div>
    </section>
<!-- breadcrumbs //-->
<section class="w3l-features-4">
    <div class="features4-block">
        <div class="container">
            <div class="main-titles-head text-center">

                <h3 class="header-name">
		Save time with INDSAC-CRM powerful automations
                </h3>
            </div>
            <div class="features-effect row text-center">
              <div class="grids-effect-2 col-lg-4 col-md-6 col-sm-6">
                    <div class="back-color">
                        <a href="contactmanagement.jsp"><img class="img-responsive" src="assets/images/con1.jpg" alt=" "></a>
                        <h4><a href="contactmanagement.jsp" class="title-head">Contact Management</a></h4>
                        <p class="para">CRM systems allow salespeople to create contact records and store prospect and customer information in a database. </p>
                    </div>
                </div>
                <div class=" grids-effect-2 col-lg-4 col-md-6 col-sm-6">
                    <div class="back-color">
                          <a href="task.jsp "><img class="img-responsive" src="assets/images/taskmg.png" alt=" "></a>
                        <h4><a href="task.jsp" class="title-head">Task Management </a></h4>
                        <p class="para"> CRM system that includes task management capabilities sales peoples increase their
                            workflow and keep on top of their follow up. </p>
                    </div>
                </div>
                  <div class="grids-effect-2 col-lg-4 col-md-6 col-sm-6">
                    <div class="back-color">
                         <a href="sales.jsp "><img class="img-responsive" src="assets/images/salesmg.png" alt=" "></a>
                        <h4><a href="sales.jsp" class="title-head">Sales Automation </a></h4>
                        <p class="para">Sales automation takes all the repetitive, manual tasks performed by sales reps and managers, and automates them. 
                            Sales automation helps you track contacts, manage opportunities.</p>
                    </div>
                </div>
                <div class="grids-effect-2 col-lg-4 col-md-6 col-sm-6 mt-4 pt-1 ">
                    <div class="back-color">
                      <a href="salesforcasting.jsp"><img class="img-responsive" src="assets/images/salesf.jpg" alt=" "></a><br><br>
                        <h4><a href="salesforcasting.jsp" class="title-head"> Sales Forecasting  </a></h4>
                        <p class="para">A CRM software predicts your future sales based on data from your current pipeline. You may need to alter your marketing plan based on the sales forecast.</p>
                    </div>
                </div>               
                <div class="grids-effect-2 col-lg-4 col-md-6 col-sm-6 mt-4 pt-1 ">
                    <div class="back-color">
                          <a href="dashboard.jsp"><img class="img-responsive" src="assets/images/reportmg.png" alt=" "></a>
                        <h4><a href="dashboard.jsp" class="title-head">Reporting & Dashboards</a></h4>
                        <p class="para">Create customized reports as interactive pie, bar, and line charts. Export reports as PDFs or Word files.
Utilize dashboards and reports for management, sales, marketing & more. </p>
                    </div>
                </div>
               
                <div class="grids-effect-2 col-lg-4 col-md-6 col-sm-6 mt-4 pt-1 ">
                    <div class="back-color">
                       <a href="panalysis.jsp"><img class="img-responsive" src="assets/images/productivitymg.png" alt=" "></a>
                        <h4><a href="panalysis.jsp" class="title-head"> Productivity Analysis </h4>
                        <p class="para">Track and measure your team's progress, know the status of key opportunities, and 
                            ensure you're getting results. Compare productivity among departments and representatives. 
                            Track detailed marketing campaign metrics. </p>
                    </div>
                </div>
                
		 <div class="grids-effect-2 col-lg-4 col-md-6 col-sm-6 mt-4 pt-1">
                    <div class="back-color">
                          <a href="lead.jsp "><img class="img-responsive" src="assets/images/leadmg.svg" alt=" "></a><br>
                        <h4><a href="lead.jsp" class="title-head">Lead Management </a></h4>
                        <p class="para">Lead management is the process of capturing and nurturing leads as they move through your sales pipeline along with
						the sales representatives and converted into a sale. </p>
                    </div>
                </div>	
                
		 <div class="grids-effect-2 col-lg-4 col-md-6 col-sm-6 mt-4 pt-1 ">
                    <div class="back-color">
                         <a href="email.jsp"><img class="img-responsive" src="assets/images/emailmg.jpg" alt=" "></a><br>
                        <h4><a href="email.jsp" class="title-head">Email Integration</a></h4>
                        <p class="para"> Email service in an INDSAC-CRM helps keep your sales team organized and productive. 
                            They can integrate their calendars to schedule appointments and engage prospects and customers 
                            accordingly.</p>
                    </div>
                </div>
                
		<div class=" grids-effect-2 col-lg-4 col-md-6 col-sm-6 mt-4 pt-1">
                    <div class="back-color">
                       <a href="opp.jsp "><img class="img-responsive" src="assets/images/oppormg.png" alt=" "></a><br>
                        <h4><a href="opp.jsp" class="title-head">Opportunity Management</a></h4>
                        <p class="para">It provides opportunity tracking so you'll always know the details for each prospective sale, and allows you to 
				review forecasts in real-time with detailed reports., dashboards and lists.</p>
                    </div>
                </div>		
           </div>
        </div>
    </div>
</section>

<%@include file="footer.jsp" %>

<!-- move top -->
<button onclick="topFunction()" id="movetop" title="Go to top">
	<span class="fa fa-angle-up"></span>
</button>
<script>
	// When the user scrolls down 20px from the top of the document, show the button
	window.onscroll = function () {
		scrollFunction()
	};

	function scrollFunction() {
		if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
			document.getElementById("movetop").style.display = "block";
		} else {
			document.getElementById("movetop").style.display = "none";
		}
	}

	// When the user clicks on the button, scroll to the top of the document
	function topFunction() {
		document.body.scrollTop = 0;
		document.documentElement.scrollTop = 0;
	}
</script>
<!-- /move top -->
<%  Log.writeWEBLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" "+request.getProtocol()+", "+Poul.getPublicIP()+""
              + ", "+request.getRemoteHost()+", Leaving services.jsp");
      %>
</body>

</html>