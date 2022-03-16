
<%@page import="blezz.Poul"%>
<%@page import="log.Log"%>
<!--
   Author:www.indsaccrm.com
   Author URL: https://www.indsaccrm.com
-->
<!doctype html>
<html lang="en">
  <head><link rel="shortcut icon" href="../dist/img/u.png" type="image/x-icon" />
        <link rel="canonical" href="https://www.indsaccrm.com/costofcrm.jsp" />
        <link rel="apple-touch-icon" href="dist/img/u.png"/>
        <link rel="alternate" hreflang="en" href ="https://www.indsaccrm.com/" />
        
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="CRM vendors have different options on how they price their software and services">


   <title>CRM Cost | No Hidden Costs :: indsaccrm.com</title>
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
  <body id="about">


      <%  Log.writeWEBLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" "+request.getProtocol()+", "+Poul.getPublicIP()+""
              + ", "+request.getRemoteHost()+", Entering about.jsp");
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
                     <li><a href="whychooseus.jsp">Why Choose INDSAC-CRM <span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
                    <li class="active"> Secure And Reliable </li>
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
                <img src="assets/images/s3.gif" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                    <h4>No hidden costs</h4>
                    <p class="para">CRM vendors have different options on how they price their software and services.  
                     <br>  <br>CRM vendors have different options on how they price their software and services. <br><br>CRM can change the dynamics of the total cost of the application.
                      <br>  <br>
                </div>
            </div>
        </div>
    </div>
</section>
   				<section class="w3l-recent-work-hobbies">
   				    <div class="recent-work ">
   				        <div class="container">
<div class="left-text">
    <h3>CRM Pricing Base On Following Factors</h3>
	<p class="para">    </p>
</div>
<p class="para"><h4>1. CRM Training</h4>
Training is an essential part of installing a CRM system. If your users don't know how to use the software, they want to 
use it at all. So all of your users must be trained. The ideal situation is to have your business processes already set up
in the system before everyone is trained. And the training is by role or team.</p>
              <br>      <br>                                
       <p class="para"><h4>2. CRM Integration </h4> 
     Most companies today want to integrate or share data across all their major software applications. Connecting systems 
     create one central location (CRM) where important information can access by all team members. And also prevents double
     or trip data entry and keeps everyone and all records up to date.</p>                                 
        <br><br>
        <p class="para"><h4>3. CRM Implementation   </h4> 
   The implementation consists of configuring and customizing your CRM system so that it fits your business model. This 
   makes the interface more intuitive and users will be able to immediately start using the system without much of a 
   learning curve. Implementation services are a one-time, upfront fee and are priced based on the number of man-hours
   needed.
 </p>   
        <br>      <br> 
<p class="para"><h4>4. Additional Services</h4>
The cost of the subscription per user is just the starting point for CRM implementation. Most CRM
allow customization with third-party add-ons, and the price tag for these can be considerable.</p>
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
              + ", "+request.getRemoteHost()+", Leaving about.jsp");
      %>
</body>

</html>
