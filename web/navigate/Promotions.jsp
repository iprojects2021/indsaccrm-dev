
<%@page import="blezz.Poul"%>
<%@page import="log.Log"%>
<!--
   Author:www.indsaccrm.com
   Author URL: https://www.indsaccrm.com
-->
<!doctype html>
<html lang="en">
  <head><link rel="shortcut icon" href="../dist/img/u.png" type="image/x-icon" />
      <link rel="canonical" href="https://www.indsaccrm.com/Promotions.jsp" />
      <link rel="apple-touch-icon" href="dist/img/u.png"/>
      <link rel="alternate" hreflang="en" href ="https://www.indsaccrm.com/" />
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="promotions provide a breather to salespeople as it removes some weight off their shoulder and induces prospects to purchase the product">


   <title>Sales Promotions | Promotions :: indsaccrm.com</title>
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
                    <li class="active"> Promotions </li>
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
                <img src="assets/images/promotions.jpeg" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                    <h4>CRM Promotions</h4>
                    <p class="para">Promotion is any form of communication a business or organization uses to inform,
                        persuade, or remind people about its products and improve its public image. Product Promotion :
                        <br><br> 1) explains the major features and benefits of its products (especially in relation to 
                        competitors), <br>2) tells where the products are sold, <br>3) advertises sales on those products,
                        <br>4) answers customer questions, and <br>5) introduces new products.
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
	<h3>What are Sales Promotions?</h3>
	<p class="para">    </p>
</div>
<p class="para"> Sales promotions provide a breather to salespeople as it removes some weight off their shoulder and induce prospects to purchase the product. 
    In many ways, sales promotions help your salespeople get more leads and ultimately more customers. 
    If you have a product that is new in the market or which is not receiving a lot of attention, then you can promote this product to customers via sales promotions. 
    Sales promotion is the process of persuading a potential customer to buy the product, 
    It is designed to be used as a short-term tactic to boost sales-affecting long-term customer loyalty.
  </p>
        <br>       
        <div class="left-text">
	<h3> Types of Sales Promotions</h3>
	<p class="para">    </p>
</div>
<p class="para"> A) Consumer sales promotions :<br>
Any sales promotion activity when you keep the end consumer in mind is known as consumer sales promotion.<br><br>

B) Trade Sales promotions : <br>
If your promotional activities are focused on dealers, distributors, or agents, then it is known as trade promotions.
<br></p>
<br><br>
<div class="left-text">
	<h3>There are some examples of sales promotions</h3>
	<p class="para">    </p>
</div>
<p class="para"> 1-Money off coupons(Customer sales promotions): 
    Customers receive coupons, or cut coupons out of newspapers or the packaging of a product that enables them to buy the product next time at a reduced price.<br><br>

2-Discount rates (Trade/Customer sales promotions): 
like a money-off decrease.<br><br>

3-Free gifts (Customer sales promotions): 
A free product when buying another product.<br><br>

4-Free trial (Customer sales promotions): 
You have come across several software or online programs which offer a free trial to you before you purchase the product.<br>
</p>

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
