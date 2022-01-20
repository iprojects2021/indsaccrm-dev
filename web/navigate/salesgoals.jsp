
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

   <title>Best CRM Software | Sales Goals :: indsaccrm.com</title>
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
                    <li><a href="services.jsp">services <span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
                    <li><a href="sales.jsp">Sales Automation<span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
                    <li class="active"> Sales Goals </li>
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
                <img src="assets/images/salesgoals.gif" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                    <h4>Sales Goals</h4>
                    <p class="para">Goals provide a way to measure the success of your business. <br><br> If you're focussed on 
                        closing deals or increasing revenue, goals help you understand what you need to accomplish and how 
                        to take action.<br><br> With Sales Goals, you can define your sales objectives as 
                        measurable goals in your CRM, track progress, and reach your targets.
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
	<h3>Sale CRM Goals</h3>
	<p class="para">    </p>
</div>
<p class="para"><h4>1.Increase customer retention</h4>Happy customers are loyal customers and they also offer good word of mouth advertising, which can be invaluable.
One of the major benefits in mapping out your CRM plan with increased customer satisfaction as your
primary goal is the fact that all other goals and objectives will invariably support this effort. 
In this way, each method that you use or measure that you take will share a symbiotic relationship 
with the rest. As a result, all of your investments in CRM will be supporting your goals in a balanced
and seamless fashion.</p>
              <br>      <br>                                
       <p class="para"><h4>2. Improve The Efficiency Of Your Business </h4> 
       A good CRM platform will collect and organize a wealth of data pertaining to individual and group consumer profiles. Another part of these endeavors can be the implementation and use of knowledge management systems that increase the speed at which customer inquiries are addressed and problems are resolved. 
       Greater levels of efficiency will also lead to improved client satisfaction.  </p>                                 
        <br><br>
        <p class="para"><h4>3. Expand You Customer Base </h4> 
       CRM program that is linked to a high-quality knowledge management platform will allow you to 
       stay in contact with prospects that have yet to convert. It will also allow you to identify 
       commonalities and relationships among the clients that you already have, so that you can hone and 
       improve your future efforts in outreach. A larger customer base will allow for increased continuity 
       in profits, even in a seasonal industry. </p>   
        <br>      <br> 
<p class="para"><h4>4. Enhance Your Sales And Support Teams</h4>
CRM helps you replace undesirable additions to your team or gives you a framework for increasing the customer service skills of existing employees, it is certain to 
improve the benefits that hired workers are providing.<br><br>
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
