
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

    <title>Best Customer Relationship Management Software | Resources :: indsaccrm.com</title>

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
  <body id="Aerospace">
      <%  Log.writeWEBLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" "+request.getProtocol()+", "+Poul.getPublicIP()+""
              + ", "+request.getRemoteHost()+", Entering Aerospace.jsp");
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
                    <li class="active">Mobile CRM</li>
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
                <img src="assets/images/mobilecrm.jpg" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                    <h4>Mobile CRM </h4>
                    <p class="para">  Mobile Customer Relationship Management, can be defined as a CRM platform that has been 
                        specifically designed for mobile devices and tablets, 
                        allowing users to get a holistic CRM experience on their mobile phones.
                    </p>
                    <div class="jst-two-coloums mt-4">
                        <div class="icon-text">
                            <h5> <a href="#" ></a>
                            </h5>
                            <p class="para">Flexibility is an important and essential requirement for most professionals today due to 
                                the diverse working conditions, 
                             including remote working, work from home, and more. </p>
                       </div>
                        <div class="icon-text mt-lx-3 pt-lx-1">
                            <h5 ><a href="#" ></a>
                            </h5>
                            <p class="para">With the help of mobile CRM, employees can have access to important data irrespective of their location.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
   				<section class="w3l-recent-work-hobbies">
   				    <div class="recent-work ">
   				        <div class="container">
<div class="left-text">
	<h3>CRM for Aerospace Industry </h3>
	<p class="para">Aerospace companies are not customer-driven, most of them have come to recognize the importance of customer relationship management (CRM) when it comes to improving sales and business development 
	effectiveness, delivering superior customer service, improving product, quote, and order configuration accuracy, 
	and maximizing employee productivity and knowledge sharing, among other things. CRM software  now offer a broad selection of CRM software capable of satisfying the complex and unique demands of aerospace and defense companies. </p> 
	<br>
	<p class="para"> Aerospace contracts are characterized by their complexity and wide-ranging scope. Their management is further complicated by exceedingly intricate procedures, stringent regulations, and strict requirements from both clients and the government. 
A Cloud CRM solution in this environment must address the need for management of information security with exchanges as a priority from both operational and administrative perspectives in the Aerospace Sector.</p>
<br>
<br>
<br>
	<h3>Benefits of INDSAC-CRM for Aerospace Industry</h3>
	</div>
<div class="row about-about">
	<div class="col-lg-4 col-md-6">
		<div class="about-grids">
		
<p class="para">CRM software tools that target small and medium-sized businesses are seldom able to satisfy the complex requirements of aerospace companies. </p>
<div class="mt-3 about-list">
	
</div>
		</div>
	</div>
	<div class="col-lg-4 col-md-6 about-line-top">
		<div class="about-grids">


<p class="para ">The most powerful benefit of using a CRM in aviation is that sales team spends more time connecting with customers and developing deals, and less time analyzing data.. </p>
<div class="mt-3 about-list">
	
</div>
		</div>
	</div>
	<div class="col-lg-4 col-md-6 about-line-top">
		<div class="about-grids">

<p class="para"> Using CRM you can create much more effective and personalized marketing campaigns. CRM platforms allow you to really drill down into the data and get to know your passengers and their behavior.</p>
<div class="mt-3 about-list">

</div>
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
<%  Log.writeWEBLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" "+request.getProtocol()+", "+Poul.getPublicIP()+""
              + ", "+request.getRemoteHost()+", Leaving Aerospace.jsp");
      %>
</body>

</html>