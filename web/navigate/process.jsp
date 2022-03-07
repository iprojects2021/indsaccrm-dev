
<%@page import="blezz.Poul"%>
<%@page import="log.Log"%>
<!--
   Author:indsaccrm.com
   Author URL: http://indsaccrm.com
-->
<!doctype html>
<html lang="en">
  <head><link rel="shortcut icon" href="../dist/img/u.png" type="image/x-icon" />
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

   <title>Best CRM Software | Process Management :: indsaccrm.com</title>
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
                    <li class="active"> Process Management </li>
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
                <img src="assets/images/planning.jpg" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                    <h4>CRM Process Management</h4>
                    <p class="para">The CRM process is a strategy for keeping every customer interaction personalized and meaningful that consists of five main steps. 
                        A customer relationship management system provides the data and functionalities your team needs to execute this strategy and ultimately turn leads into customers.
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>
   				<section class="w3l-recent-work-hobbies">
   				    <div class="recent-work ">
   				        <div class="container">
<div class="left-text">
	<h3>CRM Process Cycle</h3>
	<p class="para">  The CRM cycle involves marketing, customer service, and sales activities. 
            It starts with outreach and customer acquisition and ideally leads to customer loyalty.<br><br>
            There are five key stages in the CRM cycle :<br>
<br>
1. Reaching a potential customer<br>
2. Customer acquisition<br>
3. Conversion<br>
4. Customer retention<br>
5. Customer loyalty<br>

        </p>
</div>
</div>
</div>                                                             
</section>

<section class="w3l-recent-work-hobbies">
   				    <div class="recent-work ">
   				        <div class="container">
<div class="left-text">
	<h3>Steps in CRM Process </h3>
	<p class="para">  The five steps of the CRM process are a collaborative effort between marketing, sales, 
            and support departments. To help you understand how each team works together.<br>
<br>
<h3>1. Generate brand awareness</h3><br>
Acquiring new customers is to introduce them to your business. The marketing team typically takes on this task through 
several measures:<br><br>
1.  Learning about your target audience.<br>
2.  Segmenting your target audience.<br>
3. Creating marketing campaigns that speak to those target demographics.<br><br>

<h3>2.Acquire leads </h3>
	<p class="para">Introducing your brand to a potential customer is just the beginning of the CRM process. From there, 
            you have to encourage them to learn more about your business and engage with it.<br>
<br>
<h3>3.Convert leads into customers </h3>
	<p class="para">  You've successfully engaged with your leads, and they're interested.
            Now it's time to turn those leads into customers.<br>
<br>
<h3>4. Provide superior customer service </h3>
	<p class="para"> You've successfully converted your lead into a customer. But the CRM process doesn't end when a 
            customer converts. To grow as a company, you need to retain customers. <br>
<br>     
 <h3>5.Drive upsells</h3>
	<p class="para">  When we think of a returning customer, we imagine a shopper continually coming back to the same business 
            to buy the products they know and love. 
            But there is another key way existing customers provide value by upgrading to more expensive products. <br>
  <br>       
    </p>
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
              + ", "+request.getRemoteHost()+", Leaving about.jsp");
      %>
</body>

</html>
