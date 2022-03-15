
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

   <title>Best CRM Software | Predictive Analytics :: indsaccrm.com</title>
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
                    <li><a href="../index.jsp">Services <span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
                    <li><a href="sales.jsp">Sales Automation <span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
                    <li class="active"> Predictive Analytics </li>
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
                <img src="assets/images/panalysis.gif" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                    <h4>Predictive Analytics</h4>
                    <p class="para">Predictive analytics is a technology that allows firms to analyze structured and 
                        unstructured data for identifying key trends and correlations to uncover certain customer 
                        behaviors.<br><br> CRM solutions are the ideal application for predictive analytics, enabling 
                        a company to maximize revenue. Because making the wrong decisions can be costly to a firm, the 
                        ability to predict 'what' and 'where' is key to business success.
                      <br>  <br>Predictive analytics are now increasingly being tied to CRM as vendors respond to
                      businesses that demand more from their CRM systems.
                    </p>
                </div>
            </div>
        </div>
    <div class="recent-work ">
   <div class="container">
<div class="left-text">
	<p class="para"> Predictive Analytics is all about finding the insights that will help you understand what might 
            happen in the future. They help you recognize patterns in historical data, repeated transactions, and 
            relationship cues. If you use predictive analytics effectively, you can facilitate a more proactive business 
            approach.  </p>
          <br> 
          <p class="para">The predictive Analytics approach makes use of tons of moments sellers have labored on in past 
              years and evaluates win/loss predictions with advanced machine-learning algorithms. Data analytics paid
              emphasis on the things which have already occurred in the past but, what predictive analytics does is that 
              it learns and predicts about the future.</p>
</div>
       <br><br>
       <div class="recent-work ">
   <div class="container">
       <div class="left-text">
           <h3> Risk Analysis and decrement</h3><br>
           <p class="para">Predictive Analytics can transform the CRM experience by supplementing all those members or 
               customers who are a threat to the company. Predictive analytics uses basic information to find fault among 
               the behavioral patterns of the customers. Thus, this helps to cross-check the capability of its customers. 
               Thereafter, it's useful for the organization for the distant future.</p>           
           <br><br>
<h3> Ceding primary importance to customers</h3><br>
           <p class="para"> Customers play a key role in marketing. Their needs are to be satisfied with the overall success of the firm.
               Predictive analytics helps in fulfilling this customer requirement by keeping an account of the products which their customers have purchased to date. 
               This helps the organization to know about their customer's further needs.</p>
           
           <br><br>
<h3> Problem Solving Response</h3><br>
           <p class="para"> People are aware of the fact that Predictive Analytics helps in forecasting or predicting the
               near future. Additionally, a problem-solving response also plays a major role in analytics. It helps in 
               determining all the responses and conduct of the customers. This creates an impact on the clients as the next
               notification they receive while working is what they require.</p>          
           <br><br>
<h3> Accounting customer trends</h3><br>
           <p class="para"> Predictive Analytics has a special built-in feature Algorithm feature, which constantly extracts data from various companies. 
               Thus, now they use this data for the promotional strategies</p>
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
