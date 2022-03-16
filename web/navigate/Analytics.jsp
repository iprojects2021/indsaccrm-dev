
<%@page import="blezz.Poul"%>
<%@page import="log.Log"%>
<!--
   Author:www.indsaccrm.com
   Author URL: https://www.indsaccrm.com
-->
<!doctype html>
<html lang="en">
  <head><link rel="shortcut icon" href="../dist/img/u.png" type="image/x-icon" />
      <link rel="canonical" href="https://www.indsaccrm.com/Analytics.jsp" />
      <link rel="apple-touch-icon" href="dist/img/u.png"/>
      <link rel="alternate" hreflang="en" href ="https://www.indsaccrm.com/" />
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="CRM analytics, also known as customer analytics, refers to the process of interpreting the data within your CRM software to uncover valuable insights that will impact business decisions">


   <title>INDSAC-CRM Analytics | CRM Analytics :: indsaccrm.com</title>
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
                    <li class="active"> CRM Analytics</li>
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
                <img src="assets/images/anaylitics.gif" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                    <h4>CRM Analytics</h4>
                    <p class="para">CRM analytics, also known as customer analytics, refers to the process of interpreting
                        the data within your CRM software to uncover valuable insights that will impact business decisions. 
                        The overall purpose is to better understand your customers so you can sell to them as effectively as possible. 
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
	<h3>How INDSAC-CRM analytics can help your business?</h3>
	<p class="para">    </p>
</div>
<p class="para"> While there are specific functions a CRM should provide to work well, another side of its functionality 
    is providing data and analytics. Business analytics is the foundation for successfully converting leads into 
    customers and customers into brand advocates.<br> <br>     
         1. Shows a clear customer journey <br>
        2. Indicates a change in lead status<br> 
        3. Offers insight into customer retention strategies<br> 
        4. Segments your customers </p>
        <br>
        
        <div class="left-text">
	<h3>Applications of CRM analytics</h3>
	<p class="para">    </p>
</div>
<p class="para"> After implementation, CRM analytics offers insights to understand and use the data that is mined. 
    Organizations use CRM analytics in the following ways:<br><br>    
    
       1. Customer segmentation groupings: Dividing customers into those most and least likely to repurchase a product.<br><br>
       2. Profitability analysis and customer value: Learning which customers contribute to the highest profits over time.
       This involves understanding not just how much a customer spends, but how many resources you dedicate to that customer in return.<br> <br>
       3. Personalization: The ability to market to individual customers based on the data collected about them.<br> <br>
       4. Measuring and tracking escalation: The ability to measure how often problems arise with a product or service to 
       eliminate that issue and quickly achieve customer satisfaction.<br> <br>
       5. Predictive modeling: Comparing various product development plans in terms of likely future success given the customer knowledge base by measuring engagement levels through customer shares.</p>
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
