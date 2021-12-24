
<%@page import="log.Log"%>
<!--
   Author: indsaccrm.com
   Author URL: http://indsaccrm.com.com
-->
<!doctype html>
<html lang="en">
  <head> <link rel="shortcut icon" href="../dist/img/u.png" type="image/x-icon" />
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Best Customer Relationship Management Software | Pricing :: indsaccrm.com</title>

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
  <body id="pricing">

      <%  Log.writeWEBLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" "+request.getProtocol()+", "+request.getRemoteAddr()+""
              + ", "+request.getRemoteHost()+", Entering pricing.jsp");
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
                    <li class="active">Pricing</li>
                </ul>
            </div>
        </div>
    </section>
<!-- breadcrumbs //-->
<section>

<section class="w3l-contact-info-main">
    <div class="contact-sec">
        <div class="container">
            <div class="main-titles-head text-center">
                <h3 class="header-name">
                    Drop us Message for any Query
					<a href="login.jsp" class="btn action-button mt-6">Get Free CRM</a>
                </h3> 

            </div>
            <div class="contact row">
                <!-- email -->
                <div class="col-lg-3 col-md-6 col-sm-6 contact-grids">
                    <div class="contact-gtids ">
                        <span class="fa fa-envelope" aria-hidden="true"></span>
                    <h4>Email Address</h4>
                <a href="mailto:hello@example.com">
                    <p class="contact-text-sub">support@indsaccrm.com</p>
                </a>
                <a href="mailto:info@example.com">
                    <p class="contact-text-sub">info@indsaccrm.com</p>
                </a>
            </div>
            </div>
            <!-- phone -->
            <div class=" col-lg-3 col-md-6 col-sm-6 contact-grids">
                <div class="contact-gtids ">
                    <span class="fa fa-phone" aria-hidden="true"></span>
                <h4>Phone Number</h4>
                <a href="tel:+7-800-999-800">
                    <p class="contact-text-sub">+91 7676289081</p>
                </a>
                <a href="tel:+1-222-333-800">
                    <p class="contact-text-sub">+91 7999814068</p>
                </a>
            </div>
            </div>
			 <!-- address -->
                <div class="col-lg-3 col-md-6 col-sm-6 contact-grids">
                    <div class="contact-gtids ">
                        <span class="fa fa-building" aria-hidden="true"></span>
                    <h4>Address Line</h4>
                <p class="contact-text-sub">373, Aswath Nagar, 2nd Main Road, Marathahalli, Bangalore - 560037</p>
    
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
<%  Log.writeWEBLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" "+request.getProtocol()+", "+request.getRemoteAddr()+""
              + ", "+request.getRemoteHost()+", Leaving pricing.jsp");
      %>
</body>

</html>