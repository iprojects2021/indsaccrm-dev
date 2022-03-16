
<%@page import="blezz.Poul"%>
<%@page import="log.Log"%>
<!--
   Author: www.indsaccrm.com
   Author URL: https://www.indsaccrm.com
-->
<!doctype html>
<html lang="en">
  <head><link rel="shortcut icon" href="../dist/img/u.png" type="image/x-icon" />
      <link rel="canonical" href="https://www.indsaccrm.com/lead.jsp" />
      <link rel="apple-touch-icon" href="dist/img/u.png"/>
      <link rel="alternate" hreflang="en" href ="https://www.indsaccrm.com/" />
      
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Lead management is a systematic process in which incoming leads are qualified, analyzed, and nurtured so that they can be converted into new business opportunities">


    <title>Lead Management | Best CRM Software | Indsac Crm :: indsaccrm.com</title>

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
              + ", "+request.getRemoteHost()+", Entering Lead Management  lead.jsp");
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
					 <li class="active">Lead Management </li>
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
                   Lead Management 
                </h3> 

            </div>
            <div class="cwp4-two row">
            <div class="col-xl-6 cwp4-image ">
                <img src="assets/images/lead2.gif" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                  
                    <p class="para"> Lead management is a systematic process in which incoming leads are qualified, analyzed, and nurtured so that they can be converted into new business opportunities.</p><br>
                       <p class="para">In a sales process, leads from multiple channels enter your lead management system, and the sales-ready leads are converted into deals.</p><br>
                     <p class="para">From lead generation to conversion and analysis, take a look at some of the popular ways that you can find sales success with the INDSAC-CRM lead management system.</p>
                </div>
            </div>
        </div>
    </div>
  <div class="main-titles-head text-center">

                <h3 class="header-name">
	      The Lead Management Process
                </h3>
            </div>   
</section>
<section class="w3l-content-with-photo-4">
    <div class="content-with-photo4-block">
        <div class="container">
            <div class="cwp4-two row">
                <div class="cwp4-text col-xl-6">
                     <h3 class="header-name">1: Lead capturing  </h3> <br>
                   <p class="para"> 
                    A good lead management software ensures that every lead is automatically fed into the CRM system from web forms, e-mails, and chat, preventing prospects from falling through the cracks.
                   </p>
                </div>
                
                <div class="col-xl-6 cwp4-image ">
                <img src="assets/images/lead3.png" alt="product" class="img-responsive ">
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
                <img src="assets/images/lead4.png" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                    <h3 class="header-name">2: Lead enrichment & tracking </h3> <br>
                <p class="para">Lead management software mines data from multiple sources. It uses direct mailing or email 
                    marketing lists. Other times, it extracts information from customer databases or even social media 
                    platforms. With access to the right data, it analyzes the information, segments valuable customer 
                    identifiers, and produces a set of qualified leads.</p>                   
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
                     <h3 class="header-name">3: Lead qualification </h3> <br>
                   <p class="para"> The predictive scoring model helps you prioritize contacts you interact with by going through historical data and assigning a score to every contact based on engagement with your company.
                  Your team can easily identify the right leads and invest their time in making a sale.  </p>
                </div>
	<div class="col-xl-6 cwp4-image ">
                <img src="assets/images/lead5.jpg" alt="product" class="img-responsive ">
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
                <img src="assets/images/lead6.jpg" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                    <h3 class="header-name">4: Lead distribution</h3> <br>
                <p class="para">A lead management system automatically assigns leads to salespeople across territories on a round-robin basis, assigns phone numbers to territories, and transfers calls to sales teams.<br>
                  This way, your sales team can prioritize assigned leads instead of manually searching for new leads in the CRM system.  </p>
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
                     <h3 class="header-name">5: Lead nurturing</h3> <br>
                   <p class="para"> Your all leads are not sales-ready. Lead nurturing educate and demonstrate the value 
                       of your product/service. With lead management software in place, you can send campaigns to these 
                       leads who are not quite ready yet to make a purchase.</p>
                </div>
	    <div class="col-xl-6 cwp4-image ">
                <img src="assets/images/lead7.jpg" alt="product" class="img-responsive ">
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
              + ", "+request.getRemoteHost()+", Leaving Lead Management  lead.jsp");
      %>
</body>

</html>