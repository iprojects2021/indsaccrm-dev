
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

    <title>Best Customer Relationship Management Software | Features :: indsaccrm.com</title>

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
  <body id="optional features">


      <%  Log.writeWEBLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" "+request.getProtocol()+", "+Poul.getPublicIP()+""
              + ", "+request.getRemoteHost()+", Entering optional features.jsp");
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
		<li><a href="feature.jsp">Features <span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
                    <li class="active">Optional Features</li>
                </ul>
            </div>
        </div>
    </section>
<!-- breadcrumbs //-->

<section class="w3l-content-with-photo-4">
<h3 class="header-name"> Optional CRM Features </h3>
    <div class="content-with-photo4-block">
        <div class="container">
            <div class="cwp4-two row">
			
            <div class="col-xl-6 cwp4-image ">
                <img src="assets/images/indsac-call-center-automation.gif" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
				
                    <h4>Call Center Automation</h4>
                    <p class="para">CRM with call center automation enables service agents to solve customers' problems 
                        quickly. It gives the right information at the right time to improve the overall customer experience. 
                        Interactive voice response (IVR), virtual agents, automatic call distribution are just a few examples 
                        of call center automation.</p>                  
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
                    <h4>Training and Ease to learn</h4>
                    <p class="para">Every CRM has a different learning curve. It will not make any difference if your 
                        employees do not understand the application easily. INDSAC-CRM provides training to make the 
                        product more usable. Also, CRM applications have built-in Help functionality to guide users step by
                        step.</p>
                    		 </div>
				 <div class="col-xl-6 cwp4-image ">
                <img src="assets/images/t1.png" alt="product" class="img-responsive ">
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
                <img src="assets/images/cust.png" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                    <h4>  Easy Customization</h4>
                    <p class="para">Every business has its unique strategies and processes. And to automate those processes, 
                        you have to customize CRM. We provide an easy customization feature to make your work easy.</p>                 
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
              + ", "+request.getRemoteHost()+", Leaving optional features.jsp");
      %>
</body>

</html>