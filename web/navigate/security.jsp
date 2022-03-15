
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

   <title>Best CRM Software | Secure And Reliable :: indsaccrm.com</title>
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
                     <li><a href="whychooseus.jsp">Why Choose INDSAC-CRM <span class="fa fa-angle-right" aria-hidden="true"></span></a></li>
                    <li class="active"> Secure And Reliable </li>
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
                <img src="assets/images/s3.gif" alt="product" class="img-responsive ">
            </div>
                <div class="cwp4-text col-xl-6">
                    <h4>Secure And Reliable</h4>
                    <p class="para">CRM systems are one of the most useful applications for every organization. 
                     <br>  <br>   They enable businesses to store customer data, which can be utilized to build meaningful 
                        customer relationships, find new customers and grow revenues.<br><br>Since CRM 
                        data contains such valuable information, it's extremely tantalizing for hackers
                        who are looking to steal personal information.
                      <br>  <br>
                </div>
            </div>
        </div>
    </div>
</section>
   				<section class="w3l-recent-work-hobbies">
   				    <div class="recent-work ">
   				        <div class="container">
<div class="left-text">
    <h3>Ways to secure your CRM data</h3>
	<p class="para">    </p>
</div>
<p class="para"><h4>1. Monitor CRM Activity Regularly </h4>
 You don't need to monitor every activity of your employees as they use a CRM system. Use security alerts that notify you 
 in case of unauthorized access or security breaches. Real-time online dashboards to regularly monitor the security status
 of your CRM system and company network.   </p>
              <br>      <br>                                
       <p class="para"><h4>2. Secure Your Infrastructure </h4> 
     It's also important to secure the very IT infrastructure that hosts your CRM data. We create multiple layers of 
     security that make it more difficult for hackers to get in. Start by installing a reputed firewall that will enable
     you to precisely control data access and permissions. </p>                                 
        <br><br>
        <p class="para"><h4>3. Use Passwords Effectively  </h4> 
       One of the most common reasons for which a system can be hacked is that it uses common, 
       easy-to-guess passwords. Ensure that your employees use strong passwords (a strong password 
       is a sentence that's at least 12 characters long) and use a unique password for each account. </p>   
        <br>      <br> 
<p class="para"><h4>4. Educate Your Employees</h4>
Many data breaches happen because employees unintentionally or carelessly pass around documents, data, and even passwords.
Train your employees on using their hardware, software, and data and the right way to safeguard against breaches. </p>
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
