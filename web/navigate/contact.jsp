<%@page import="blezz.Poul"%>
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

    <title>Best Customer Relationship Management Software | Contact Us :: indsaccrm.com</title>

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
  <body id="contact">


      <%  Log.writeWEBLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" "+request.getProtocol()+", "+Poul.getPublicIP()+""
              + ", "+request.getRemoteHost()+", Entering contact.jsp");
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
                    <li class="active">Contact Us</li>
                </ul>
            </div>
        </div>
    </section>
<!-- breadcrumbs //-->
<section class="w3l-contact-info-main">
    <div class="contact-sec">
        <div class="container">
            <div class="main-titles-head text-center">
                <h3 class="header-name">
                    Drop us Message for any Query
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
               
            </div>
            </div>
                <!-- address -->
                <div class="col-lg-3 col-md-6 col-sm-6 contact-grids">
                    <div class="contact-gtids ">
                        <span class="fa fa-building" aria-hidden="true"></span>
                    <h4>Address Line</h4>
                <p class="contact-text-sub">373, Aswath Nagar, Bengaluru, 2nd Main Road, Marathahalli, Bangalore - 560037, Near Annapoorna Theatre</p>
    
            </div>
        </div>
<!-- 24 customer service -->
                <div class="col-lg-3 col-md-6 col-sm-6 contact-grids">
                    <div class="contact-gtids ">
                        <span class="fa fa-headphones" aria-hidden="true"></span>
                    <h4>Support</h4>
                    <p class="contact-text-sub">24/7 Ready Our Support Team For You.</p>

                </div>
            </div>
            </div>
            <form method="post" class="indsaccrm.com-contact-fm" action="https://sendmail.indsaccrm.com.com/submitForm">
                <div class="row main-cont-sec">
                    <div class="col-lg-6 left-cont-contact">
                        <div class="form-group input-gap">
                            <input class="form-control" type="text" name="w3lName" id="w3lName" placeholder="First Name"
                                required="">
                        </div>
                        <div class="form-group input-gap">
                            <input class="form-control" type="text" name="w3lName" id="w3lName" placeholder="Last Name"
                                required="">
                        </div>
                        <div class="form-group input-gap">
                            <input class="form-control" type="email" name="w3lSender" id="w3lSender" placeholder="Email"
                                required="">
                        </div>
                    </div>
                    <div class="col-lg-6 right-cont-contact">
                        <div class="form-group">
                            <textarea class="form-control" name="w3lMessage" id="w3lMessage" placeholder="Write Message"
                                required=""></textarea>
                        </div>
                    </div>
                </div>
                <div class="form-group-2">
                    <button type="submit" class="btn action-button mt-3">Send Now</button>
                </div>
            </form>
             <div class=" contact-map">
                   <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15552.882637193943!2d77.7034409!3d12.9577274!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x357fd0906e5de67e!2sIndsac%20Softech!5e0!3m2!1sen!2sin!4v1614863435029!5m2!1sen!2sin" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
        
  
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
              + ", "+request.getRemoteHost()+", Leaving contact.jsp");
      %>
</body>

</html>