
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

    <title>Sales Automation | Best CRM Software | Indsac Crm :: indsaccrm.com</title>

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
              + ", "+request.getRemoteHost()+", Entering Sales Automation sales.jsp");
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
					 <li class="active">Sales Automation</li>
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
                    Sales Automation
                </h3> 

            </div>
            <div class="cwp4-two row">
            <div class="col-xl-6 cwp4-image ">
                <img src="assets/images/sagif.gif" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                  
                    <p class="para"> Sales Automation is a powerful tool to increase your sales and revenue, boost employee productivity and eliminate redundancy from your business 
                        processes. It employs the latest technologies such as Artificial Intelligence, which offer you a deeper penetration into the purchasing 
                        intent of your customers.</p><br>
                       <p class="para">Sales Automation is an excellent tool to create customizable workflows automatically, and reduce time spent on manual or repetitive tasks. </p><br>
                     <p class="para"> Interesting and crucial benefit offered by Sales force automation tools is customer and market intelligence that comes with sterling reports and analytics related to your customers.</p>
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
                    <h4>Benefits of using sales automation </h4>
                    <p class="para"> 1. Sales force automation plays a crucial role in motivating your sales team, keeping them informed in terms of the entire supply chain data, 
                        and enables them to make smarter decisions. <br><br>
                    2. Sales force automation offers seamless integration across devices without compromising organizational security.<br><br> 
                    3. Managers can get actionable insights into real-time data and act accordingly.  <br><br>
                    4. It improves overall productivity, keeps the motivation high, boosts range selling, and increases market coverage, all the while 
                    empowering you to make smart sales teams. <br><br>
                   
                   </p>
                   </div>
	 <div class="col-xl-6 cwp4-image ">
                <img src="assets/images/sales-automation.jpg" alt="product" class="img-responsive ">
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
				Focus on the right Sales Automation for Faster Growth
                </h3>
            </div>
            <div class="features-effect row text-center">
			
				
                <div class="grids-effect-2 col-lg-4 col-md-6 col-sm-6">

                    <div class="back-color">
                        <a href="digitalmobile.jsp"><img class="img-responsive" src="assets/images/sa1.png" alt=" "></a>
                        <h4><a href="digitalmobile.jsp" class="title-head"> Digital Ordering</a></h4>
                        <p class="para">They have access to real-time stock and delivery data that enables them to make better sales pitches. </p>
                    </div>
                </div>	
                
                <div class="grids-effect-2 col-lg-4 col-md-6 col-sm-6">

                    <div class="back-color">
                        <a href="panalysis.jsp"><img class="img-responsive" src="assets/images/sa3.jpg" alt=" "></a>
                        <h4><a href="panalysis.jsp" class="title-head">Measure Productivity</a></h4>
                        <p class="para">These metrics are accessible to the sales reps. Hence, they can self-assess themselves and improve their performance gradually.</p>
                    </div>
                </div>
                
                 <div class=" grids-effect-2 col-lg-4 col-md-6 col-sm-6">

                    <div class="back-color">
                        <a href="salesgoals.jsp"><img class="img-responsive" src="assets/images/sa6.png" alt=" "></a><br>
                        <h4><a href="salesgoals.jsp" class="title-head"> Sales Goals</a></h4><br>
                        <p class="para">Using this feature you can set periodic targets for the sales reps and compare them against their achievements to measure productivity and efficiency. </p>
                    </div>
                </div>
                
               
                <div class=" grids-effect-2 col-lg-4 col-md-6 col-sm-6 mt-4 pt-1">

                    <div class="back-color">
                        <a href="Survey.jsp"><img class="img-responsive" src="assets/images/sa5.png" alt=" "></a>
                        <h4><a href="Survey.jsp" class="title-head"> Instant Customer Surveys </a></h4><br>
                        <p class="para">This helps you understand anything and everything wrong with your sales strategies, and revamp them accordingly. </p>
                    </div>
                </div>
                
                  <div class=" grids-effect-2 col-lg-4 col-md-6 col-sm-6 mt-4 pt-1">

                    <div class="back-color">
                        <a href="ContSync.jsp"><img class="img-responsive" src="assets/images/sa4.png" alt=" "></a>
                        <h4><a href="ContSync.jsp" class="title-head"> Catalog Sync</a></h4>
                        <p class="para">Sales force automation in India that allows your sales teams to display a digital product catalogue that is continuously 
                            synced with the main server in real-time. </p>
                    </div>
                </div>
                
                
                <div class=" grids-effect-2 col-lg-4 col-md-6 col-sm-6 mt-4 pt-1">

                    <div class="back-color">
                        <a href="PredictiveAnalystics.jsp"><img class="img-responsive" src="assets/images/sa8.png" alt=" "></a>
                        <h4><a href="PredictiveAnalystics.jsp" class="title-head"> Predictive Analytics</a></h4><br>
                        <p class="para">The predictive analysis allows your sales reps to suggest orders based on the specific point of sale history and enables them to offer 
                            a seamless purchase experience to the distributors.  </p>
                    </div>
                </div>
                
                 </div>
             </div>
         </div>
        </section>>

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
              + ", "+request.getRemoteHost()+", Leaving Sales Automation sales.jsp");
      %>
</body>

</html>