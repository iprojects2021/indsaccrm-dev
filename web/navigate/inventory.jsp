
<%@page import="blezz.Poul"%>
<%@page import="log.Log"%>
<!--
   Author: www.indsaccrm.com
   Author URL: https://www.indsaccrm.com
-->
<!doctype html>
<html lang="en">
  <head> <link rel="shortcut icon" href="../dist/img/u.png" type="image/x-icon" />
        <link rel="canonical" href="https://www.indsaccrm.com/inventory.jsp" />
        <link rel="apple-touch-icon" href="dist/img/u.png"/>
        <link rel="alternate" hreflang="en" href ="https://www.indsaccrm.com/" />
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Inventory management system controls and tracks a company's inventory levels, orders, sales, and deliveries. It helps in identifying the right amount of stock to order">


    <title>Inventory Management | Inventory Management :: indsaccrm.com</title>

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
                    <li class="active">Inventory Management</li>
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
                <img src="assets/images/inventory1.jpg" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                    <h4> Inventory Management</h4>
                    <p class="para"> Inventory management system controls and tracks a company's inventory levels, orders, sales, and deliveries. 
                        It helps in identifying the right amount of stock to order. </p>
            </div>
                <div class="jst-two-coloums mt-4">
                        <div class="icon-text">
                            <h5> <a href="#" ></a>
                            </h5>
                            <p class="para"> The inventory management system is confined to managing the critical back-end 
                                business operations such as billing and shipping details, purchase history, accounting 
                                information, financial data, and supply chain management details whereas the CRM software 
                                deals with the front end business operations such as recording the customer details and 
                                customer interactions with the company, tracking of sales, managing the sales pipeline, as 
                                well as creating the marketing campaigns. </p>
                   </div>
            </div>
        </div>
    </div>
    </div>>
</section>
 <section class="w3l-recent-work-hobbies">
       <div class="recent-work ">
     <div class="container">
       <div class="left-text">
	<h3>Why CRM Integrate with Inventory Management System</h3>
	<p class="para">If your business manages inventory data as well as customer information on two different systems. 
            Is it becoming difficult for your team to access the important inventory information in real-time? Are your 
            billing operations and status orders getting delayed due to inaccurate inventory data? Do you miss valuable 
            customers because of your poor customer service?</p><br><br>
        <p class="para">Then, it's high time to integrate the inventory management system with existing 
            CRM software. Earlier, businesses used to handle inventory management as well as CRM software
            as two separate systems.
         </p>
</div>
       
  <div class="recent-work ">
     <div class="container">
<div class="left-text">
    <h3>Indsac Inventory Management</h3>
	<div class="row about-about">
	<div class="col-lg-4 col-md-6">
		<div class="about-grids">

<h4>Request and track online payments</h4>
<p class="para">Send online payment requests to customers, which after being paid, reflect against their outstanding 
    invoices in the Indsac payments module. Quotes and invoices can also be seen by customers by logging into the private 
    customer portal.</p><br>
<div class="mt-3 about-list">	
</div>
     </div>
	</div>
	<div class="col-lg-4 col-md-6 about-line-top">
		<div class="about-grids">
<h4>Manage all orders from one location</h4>

<p class="para">With business the way it is today, speed is everything. With Indsac Inventory, you or your team can create,
    modify, and track the status of sales orders directly from inside the app and associate those orders with your 
    products or services.</p><br>
<div class="mt-3 about-list">	
</div>
         </div>
	</div>
	<div class="col-lg-4 col-md-6 about-line-top">
		<div class="about-grids">
<h4> Manage Products, Services, And Vendors</h4>
<p class="para">Indsac inventory management system captures all information about products and services, including serial 
    numbers, pictures, descriptions, prices, stock numbers, and more. Link those to vendors for quick purchase order 
    creation when stock is low.</p><br>
<div class="mt-3 about-list">
</div>
         </div>
  </div>
</div> 
<br>
<br>
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