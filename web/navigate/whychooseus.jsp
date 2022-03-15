
<%@page import="blezz.Poul"%>
<%@page import="log.Log"%>
<!--
   Author: indsaccrm.com
   Author URL: http://indsaccrm.com.com
-->
<!doctype html>
<html lang="en">
  <head>   <link rel="shortcut icon" href="../dist/img/u.png" type="image/x-icon" />
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Best Customer Relationship Management Software | Why Choose INDSAC-CRM :: indsaccrm.com</title>

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
  <body id="Why Choose Us">


      <%  Log.writeWEBLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" "+request.getProtocol()+", "+Poul.getPublicIP()+""
              + ", "+request.getRemoteHost()+", Entering whychooseus.jsp");
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
                    <li class="active">Why Choose INDSAC-CRM ?</li>
                </ul>
            </div>
        </div>
    </section>
<!-- breadcrumbs //-->
<section class="w3l-content-with-photo-4">
    <div class="content-with-photo4-block">
        <div class="container">
            <div class="cwp4-two row">
            <div class="col-xl-6 cwp4-image ">
                <img src="assets/images/CRMImage.jpg" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                    <h4>Why Choose INDSAC-CRM?</h4>
                    <p class="para">With more than 5 years of experience in the CRM industry, we know what it's like to be at every stage of a growing business. Since our start, 
					we have grown to support customers by putting their needs at the center of everything we do. 
					We have got your back today, tomorrow, and all the days ahead.<br><br>
                    INDSAC-CRM makes customer service better. We build software to meet customer needs, set your team up for success, 
							and keep your business in sync. </p><br>
                    <a href="../login.jsp" class="btn action-button mt-6">Get Free CRM</a>
                    
                   
                    </div>
                </div>
				<div class="left-text">
	<h3 style="font-size: 45px">INDSAC-CRM is not 
	<br>just different, it's better.</h3><br>
	<p class="para">CRM software is used by organizations to run their sales processes. While these solutions might be user-friendly robust, and secure, the amount of complexity leads to the user 
            experience suffering, which often requires you to change the way you work to suit the software.</p><br>
	
<p class="para">INDSAC-CRM with its broad coverage, deep features can go head to head when it comes to technology and 
    functionality. Where other CRMs use predatory business practices and aggressive, multi-year contracts to strong-arm 
    users into sticking around, we are so confident in the strength of our product that we offer flexible, month-to-month subscriptions that can grow with your business.</p>
</div>
            </div>
        </div>
    </div>
</section>
		
<section class="w3l-specification-6">
    <div class="specification-layout">
        <div class="container">
            <div class="main-titles-head">

                <h3 class="header-name">We Bring The Best Services For You
                </h3>
              
            </div>
            <div class="specification-effect row text-center">
                <div class="grids-effect-2 col-lg-4 col-md-6 col-sm-6">
                    
                    <div class="back-color">
                    <span class="fa fa-shield" aria-hidden="true"></span>
                    <h4><a href="security.jsp" class="title-head">Secure and reliable</a></h4>
                    <p class="para">With advanced security features like encryption, audit logs, IP restrictions, and two-factor authentication, INDSAC CRM conveniently protects 
					your data, only allowing access to the users you authorize. </p>
                </div>
            </div>
                <div class=" grids-effect-2 col-lg-4 col-md-6 col-sm-6">
                    <div class="back-color">
                    <span class="fa fa-mobile" aria-hidden="true"></span>
                    <h4><a href="digitalmobile.jsp" class="title-head">Mobile accessibility</a></h4>
                    <p class="para">If you have a sales team in the field, it's important to ensure that they have access to customer data at all times. 
					INDSAC CRM allows them to stay on the move, close deals more effectively, and keep everyone in the loop. </p>
                    </div>
                </div>
                <div class="grids-effect-2 col-lg-4 col-md-6 col-sm-6">
                    <div class="back-color">
                    <span class="fa fa-phone-square" aria-hidden="true"></span>
                    <h4><a href="contact.jsp" class="title-head">Customer support</a></h4>
                    <p class="para">With our support system, you will have access to a team of highly skilled support 
                        engineers on standby 24 hours a day, all year long. They can assist you with all your issues, big and small, generating solutions in the average period.</p>
                </div>
            </div>
                <div class="grids-effect-2 col-lg-4 col-md-6 col-sm-6 mt-4 pt-1">
                    <div class="back-color">
                    <span class="fa fa-paper-plane" aria-hidden="true"></span>
                    <h4><a href="coustomeronbording.jsp" class="title-head">Customer On-boarding</a></h4>
                    <p class="para">Worried about migrating from your existing customer relationship management solutions. Our migration system, switch, 
					helps you bring all your existing sales data into INDSAC CRM in just a few clicks.</p>
                </div>
            </div>
                <div class=" grids-effect-2 col-lg-4 col-md-6 col-sm-6 mt-4 pt-1">
                    <div class="back-color">
                    <span class="fa fa-inr" aria-hidden="true"></span>
                    <h4><a href="costofcrm.jsp" class="title-head"> No hidden costs</a></h4>
                    <p class="para">With INDSAC CRM, there are no forced contracts or additional surprise costs. What you pay for is what you get. 
					The pricing is flexible as well you can opt to pay either monthly or annually.</p>
                </div>
            </div>
                <div class="grids-effect-2 col-lg-4 col-md-6 col-sm-6 mt-4 pt-1 ">
                    <div class="back-color">
                    <span class="fa fa-industry" aria-hidden="true"></span>
                    <h4><a href="crmmarketing.jsp" class="title-head">Marketing</a></h4>
                    <p class="para">Marketing software to help you grow traffic, convert more visitors, and run complete inbound marketing campaigns at scale.</p>
                </div>
            </div>
			
			<div class="left-text">
	<br><br><h3 style="font-size: 35px">The CRM Platform Your Whole Business Will Love</h3> <br><br>
	<p class="para">INDSAC-CRM platform has all the tools and integrations you need for marketing, sales, content management, and customer service. 
	<br>Each feature in the platform is powerful alone, but the real magic happens when you use them together.</p><br>
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
              + ", "+request.getRemoteHost()+", Leaving whychooseus.jsp");
      %>
</body>

</html>