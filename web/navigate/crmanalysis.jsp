
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

   <title>Best CRM Software | CRM Analysis :: indsaccrm.com</title>
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
                    <li class="active"> CRM Analysis </li>
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
                <img src="assets/images/Analysis.png" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                    <h4>CRM Analysis</h4>
<p class="para">Data analysis is defined as a process of cleaning, transforming, and modeling data to discover useful 
    information for business decision-making. The purpose of Data Analysis is to extract useful information from data and
    taking the decision based upon the data analysis.
                    </p>
                    <br>
                    <p class="para"> If your business is not growing, then you have to look back and acknowledge your mistakes and make a plan again without repeating those mistakes. 
                            And even if your business is growing, then you have to look forward to making the business to grow more. 
                        All you need to do is analyze your business data and business processes.</p>
                </div>
            </div>
        </div>
    </div>
</section>
   				<section class="w3l-recent-work-hobbies">
   				    <div class="recent-work ">
   				        <div class="container">
<div class="left-text">
	<h3>Data Analysis Process</h3>
	<p class="para">    </p>
</div>
<p class="para"> The Data Analysis Process is nothing but gathering information by using a proper application or tool which allows you to explore the data and find a pattern in it. Based on that information and data, you can make decisions, or you can get ultimate conclusions.
 <br> <br> 
Data Analysis consists of the following phases: <br> <br>     
        1. Data Requirement Gathering<br>
        2. Data Collection<br> 
        3. Data Cleaningn<br> 
        4. Data Analysis<br>
        5. Data Interpretation<br>
        6. Data Visualization</p>
        <br>
        
        <div class="left-text">
	<h3>Types of Data Analysis: Techniques and Methods</h3>
	<p class="para">    </p>
</div>
<p class="para"> There are several types of Data Analysis techniques that exist based on business and technology.<br>
    However, the major Data Analysis methods are:<br><br>    
    
    1. Text Analysis : Text Analysis is also referred to as Data Mining. It is one of the methods of data analysis to discover 
    a pattern in large data sets using databases or data mining tools. It used to transform raw data into business information. 
    Business Intelligence tools are present in the market which is used to take strategic business decisions. Overall it offers 
    a way to extract and examine data and deriving patterns and finally interpretation of the data.<br><br>
     
    2. Diagnostic Analysis : Diagnostic Analysis shows "Why did it happen?" by finding the cause from the insight found in <br><br>
        
    3. Statistical Analysis. Statistical Analysis shows "What happen?" by using past data in the form of dashboards. 
    Statistical Analysis includes collection, Analysis, interpretation, presentation, and modeling of data. 
    It analysis a set of data or a sample of data. <br><br>
        
    4. Predictive Analysis :  This Analysis makes predictions about future outcomes based on current or past data. 
    Forecasting is just an estimate. 
    Its accuracy is based on how much detailed information you have and how much you dig in it. <br><br>
        
    5. Prescriptive Analysis : Prescriptive Analysis combines the insight from all previous Analysis to determine 
    which action to take in a current problem or decision. Most data-driven companies are utilizing Prescriptive 
    Analysis because predictive and descriptive Analysis are not enough to improve data performance. Based on current 
    situations and problems, they analyze the data and make decisions.</p>
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
