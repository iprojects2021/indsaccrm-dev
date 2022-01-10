
<%@page import="blezz.Poul"%>
<%@page import="log.Log"%>
<!--
   Author: indsaccrm.com
   Author URL: http://indsaccrm.com.com
-->
<!doctype html>
<html lang="en">
  <head><link rel="shortcut icon" href="../dist/img/u.png" type="image/x-icon" />
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title> Opportunity Management | Best CRM Software | Indsac Crm :: indsaccrm.com</title>

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
  <body id="Contact Management">


      <%  Log.writeWEBLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" "+request.getProtocol()+", "+Poul.getPublicIP()+""
              + ", "+request.getRemoteHost()+", Entering Opportunity Management opp.jsp");
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
                    <li ><a href="services.jsp">Services <span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
					 <li class="active">Opportunity Management</li>
                </ul>
            </div>
        </div>
    </section>
<!-- breadcrumbs //-->
<section class="w3l-content-with-photo-4">
    <div class="content-with-photo4-block">
        <div class="container">
		      <div class="main-titles-head text-center">
                <h3 class="header-name">
                 Opportunity Management
                </h3> 

            </div>
            <div class="cwp4-two row">
            <div class="col-xl-6 cwp4-image ">
                <img src="assets/images/opp1.gif" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                  
                    <p class="para"> Our opportunity management functionality allows you to implement sales methodologies that help guide your sales reps through predefined steps to the final sale. </p><br>
                       <p class="para">It provides opportunity tracking so you'll always know the details for each prospective sale, and allows you to review forecasts in real-time with detailed reports, dashboards and lists. </p><br>
                     <p class="para">INDSAC-CRM gives you complete visibility into your pipeline so you can ensure your forecasting is accurate and identify where the best opportunities lie.</p>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="w3l-content-with-photo-4">
    <div class="content-with-photo4-block">
        <div class="container">
            <div class="container">
	
            <div class="cwp4-two row">
          
                <div class="cwp4-text col-xl-6">
                    <h4>What is an opportunity management? </h4>
                    <p class="para"> Every business generates leads. However, leads don't bring in revenue, deals do. 
                        You generate leads, nurture them, and convert them when they show an interest in purchasing your products or service. </p><br>
                         <p class="para">   The stage between identifying a lead and closing or losing a deal is your "opportunity". </p> <br> 
                          <p class="para">  Your sales team likely puts a substantial amount of effort in interacting with the right people, involving stakeholders, making presentations, 
                        and showcasing demos to help them make that purchasing decision.
                   </p>
                   </div>
	 <div class="col-xl-6 cwp4-image ">
                <img src="assets/images/opp2.jpg" alt="product" class="img-responsive ">
            </div>
            </div>
            </div>
        </div>
    </div>
</section>
   	<section class="w3l-features-4">
    <div class="features4-block">
        <div class="container">
            <div class="main-titles-head text-center">

                <h3 class="header-name">
				Complete Visibility of Your Opportunities
                </h3>
            </div>
            <div class="features-effect row text-center">
			
				
                <div class="grids-effect-2 col-lg-4 col-md-6 col-sm-6">

                    <div class="back-color">
                        <a href=""><img class="img-responsive" src="assets/images/opp7.jpg" alt=" "></a><br>
                        <h4><a href="" class="title-head"> Improve Your Win Rates</a></h4>
                        <p class="para">Implement sales methodologies and guide reps through predefined steps so important stages are never missed and opportunities 
                            continue progressing through your pipeline. </p>
                    </div>
                </div>	
                
                <div class="grids-effect-2 col-lg-4 col-md-6 col-sm-6">

                    <div class="back-color">
                        <a href=""><img class="img-responsive" src="assets/images/opp4.png" alt=" "></a>
                        <h4><a href="" class="title-head">Manage Your Pipeline</a></h4>
                        <p class="para">ales and management reports and dashboards provide access to data and analytics, including an opportunity funnel, sales reports, 
                            key performance indicators and pending activities.</p>
                    </div>
                </div>
                
                 <div class=" grids-effect-2 col-lg-4 col-md-6 col-sm-6">

                    <div class="back-color">
                        <a href=""><img class="img-responsive" src="assets/images/opp5.png" alt=" "></a><br>
                        <h4><a href="" class="title-head"> Expose Hot Opportunities</a></h4>
                        <p class="para"> With more information at your fingertips, you can uncover the best opportunities and focus resources where they matter most. </p>
                    </div>
                </div>
                 </div>
             </div>
         </div>
        </section>>

        <section class="w3l-content-with-photo-4">
    <div class="content-with-photo4-block">
        <div class="container">
            <div class="cwp4-two row">
                <div class="cwp4-text col-xl-6">
                     <h3 class="header-name">Capture opportunities easily without creating duplicates</h3> <br>
                   <p class="para"> Auto-capture and map all the different opportunities associated with one contact, from no matter how many different channels of 
                       inquiry including online and phone channel, manual bulk upload, or individual opportunity addition without creating duplicate contacts.
                   </p>
                </div>
                
                <div class="col-xl-6 cwp4-image ">
                <img src="assets/images/oppm.gif" alt="product" class="img-responsive ">
            </div>
	
            </div>
        </div>
    </div>
</section>

        <section class="w3l-content-with-photo-4">
    <div class="content-with-photo4-block">
        <div class="container">
            <div class="cwp4-two row">
            <div class="col-xl-6 cwp4-image ">
                <img src="assets/images/oppm1.jpg" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                    <h3 class="header-name">More Accurate Forecasting</h3> <br>
                <p class="para">Build reliable and accurate sales forecasts with INDSAC-CRM opportunity management. Our sales dashboards and reports give you a 
  view into exactly what is happening in your pipeline, so you can identify the details of every opportunity and ensure your forecasts are always accurate and up-to-date.</p>
                    
                    </div>
                </div>
            </div>
        </div>
</section>
        
   <section class="w3l-content-with-photo-4">
    <div class="content-with-photo4-block">
        <div class="container">
            <div class="cwp4-two row">
                <div class="cwp4-text col-xl-6">
                     <h3 class="header-name">Boost Productivity</h3> <br>
                   <p class="para">  INDSAC-CRM opportunity management also delivers a major boost in productivity. 
                       Rather than having your reps spend their time compiling the details for all their deals, management can generate an up-to-date 
                       opportunity forecast with just a few clicks of the mouse. You can also quickly generate quotes and maintain a detailed quote history for each opportunity.
                   </p>
                </div>
                
                <div class="col-xl-6 cwp4-image ">
                <img src="assets/images/oppm2.png" alt="product" class="img-responsive ">
            </div>
	
            </div>
        </div>
    </div>
</section>        
        
   <section class="w3l-content-with-photo-4">
    <div class="content-with-photo4-block">
        <div class="container">
            <div class="cwp4-two row">
            <div class="col-xl-6 cwp4-image ">
                <img src="assets/images/oppm3.png" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                    <h3 class="header-name">Ensure high team productivity with opportunity smart views</h3> <br>
                <p class="para">Smart views allow teams to prioritize their opportunities and concentrate on the most important tasks first. 
                    They'd know exactly which opportunities to handle next, view all their tasks and follow-ups in a clean view, and make prospect interactions fast and relevant.</p>
                    
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
              + ", "+request.getRemoteHost()+", Leaving Opportunity Management opp.jsp");
      %>
</body>

</html>