
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
  <body id="common features">


      <%  Log.writeWEBLog(java.time.LocalDate.now()+" "+java.time.LocalTime.now()+" "+request.getProtocol()+", "+Poul.getPublicIP()+""
              + ", "+request.getRemoteHost()+", Entering common features.jsp");
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
                    <li class="active">Common Features</li>
                </ul>
            </div>
        </div>
    </section>
<!-- breadcrumbs //-->
<section class="w3l-content-with-photo-4">
<h3 class="header-name"> Common CRM Features </h3>
    <div class="content-with-photo4-block">
        <div class="container">
            <div class="cwp4-two row">
            <div class="col-xl-6 cwp4-image ">
                <img src="assets/images/sales.png" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                    <h4>Sales Process Automation</h4>
                    <p class="para">Sales process automation is one of the most important features. It automates and 
                        streamlines various sales functionalities to standardize business processes. Businesses can 
                        customize the application as per requirements. It reduces human error, makes the sales cycle 
                        shorter, and improves lead to customer conversion ratio.</p>                 
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
                    <h4>Opportunity Management</h4>
                    <p class="para">When a business qualifies for a lead, it becomes an opportunity. An opportunity is a 
                        potential revenue-generating contact or account. If the business does not nurture contacts or 
                        accounts properly, it will lose its selling opportunity. Opportunity Management enables businesses 
                        to manage and monitor the sales funnel and provides necessary info to complete the sales process.</p>                   
				</div>
		<div class="col-xl-6 cwp4-image ">
                <img src="assets/images/op.png" alt="product" class="img-responsive ">
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
                <img src="assets/images/order.svg" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                    <h4>Quote and Order Management</h4>
                    <p class="para">When a customer is interested to buy a product or service, the salesperson creates a 
                        quote with all details. If the customer agrees to buy it at the specified price, an order will be 
                        generated. If not, the salesperson either cancels the quote or revises it to meet customer 
                        requirements. CRM automates and streamlines this process for business. It improves order processing capability, sales visibility, and relationship with customers.</p>                 
                    </div>
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
                    <h4>Account Management</h4>
                    <p class="para">Account Management is another primary feature of CRM software. It captures and 
                        organizes company or division or household information and manages relationships</p>
                </div>
		  <div class="col-xl-6 cwp4-image ">
                <img src="assets/images/indsac-account-management.gif" alt="product" class="img-responsive ">
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
                <img src="assets/images/indsac-campaign-management.gif" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                    <h4>Campaign Management</h4>
                    <p class="para">Sales process automation is one of the most important features. It automates and 
                        streamlines various sales functionalities to standardize business processes. Businesses can 
                        customize the application as per requirements. It reduces human error, makes the sales cycle 
                        shorter, and improves the lead-to-customer conversion ratio...</p>                  
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
              + ", "+request.getRemoteHost()+", Leaving common features.jsp");
      %>
</body>

</html>